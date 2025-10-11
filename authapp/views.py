from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from .models import PersonInformation
from django.views.decorators.csrf import csrf_exempt
import json
from datetime import datetime
from datetime import date
import openpyxl
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from django.db.models import Q
from django.shortcuts import render, get_object_or_404, redirect
from django.utils.timezone import now
from .models import CertificateLog
from django.utils.dateparse import parse_date
from .models import BarangayOfficial
import subprocess
from django.conf import settings
from pathlib import Path
from django.contrib import messages
from django.db.models import Count
from django.db.models.functions import TruncMonth
from django.contrib.auth.models import User
from django.contrib.auth.tokens import default_token_generator
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from django.core.mail import send_mail
from django.template.loader import render_to_string


def login_view(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return JsonResponse({"success": True})  # Send success response
        else:
            return JsonResponse({"success": False, "error": "The username and/or password you entered are incorrect"})

    return render(request, "authapp/login.html")


@login_required
def dashboard_view(request):
    today = date.today()
    residents = PersonInformation.objects.all()

    # ---------------- Gender Counts ----------------
    male_count = residents.filter(gender='Male').count()
    female_count = residents.filter(gender='Female').count()

    # ---------------- Age Groups ----------------
    seniors_count = residents.filter(
        date_of_birth__isnull=False,
        date_of_birth__lte=date(today.year - 60, today.month, today.day)
    ).count()

    kids_count = residents.filter(
        date_of_birth__isnull=False,
        date_of_birth__gte=date(today.year - 17, today.month, today.day)
    ).count()

    adults_count = residents.filter(
        date_of_birth__isnull=False
    ).exclude(
        date_of_birth__lte=date(today.year - 60, today.month, today.day)
    ).exclude(
        date_of_birth__gte=date(today.year - 17, today.month, today.day)
    ).count()

    # ---------------- Gender + Age Group ----------------
    male_kids = residents.filter(gender='Male', date_of_birth__gte=date(today.year - 17, today.month, today.day)).count()
    female_kids = residents.filter(gender='Female', date_of_birth__gte=date(today.year - 17, today.month, today.day)).count()
    male_seniors = residents.filter(gender='Male', date_of_birth__lte=date(today.year - 60, today.month, today.day)).count()
    female_seniors = residents.filter(gender='Female', date_of_birth__lte=date(today.year - 60, today.month, today.day)).count()
    male_adults = residents.filter(
        gender='Male',
        date_of_birth__lt=date(today.year - 17, today.month, today.day),
        date_of_birth__gt=date(today.year - 60, today.month, today.day)
    ).count()
    female_adults = residents.filter(
        gender='Female',
        date_of_birth__lt=date(today.year - 17, today.month, today.day),
        date_of_birth__gt=date(today.year - 60, today.month, today.day)
    ).count()

    # ---------------- Education Levels ----------------
    no_education = residents.filter(educational_background='No Formal Education').count()
    elementary = residents.filter(educational_background='Elementary Graduate').count()
    high_school = residents.filter(educational_background='High School Graduate').count()
    college = residents.filter(educational_background='College Graduate').count()

    # ---------------- PWD & Voter Status ----------------
    pwd_count = residents.filter(pwd_status='PWD').count()
    non_pwd_count = residents.filter(pwd_status='No').count()
    voter_count = residents.filter(voter_status='Voter').count()
    non_voter_count = residents.filter(voter_status='Non-Voter').count()

    # ---------------- Civil Status Counts ----------------
    from collections import Counter
    civil_status_qs = residents.values_list('civil_status', flat=True)
    civil_status_counts = dict(Counter(civil_status_qs))

# ---------------- Certificates by Month ----------------
    certificates_by_month = (
        CertificateLog.objects
        .annotate(month=TruncMonth('created_at'))
        .values('month', 'certificate_type')
        .annotate(count=Count('id'))
        .order_by('month')
    )

    # Organize for Chart.js
    cert_data = {}
    for entry in certificates_by_month:
        if entry['month']:
            month_str = entry['month'].strftime("%B %Y")
            cert_type = entry['certificate_type']
            count = entry['count']
            if month_str not in cert_data:
                cert_data[month_str] = {}
            cert_data[month_str][cert_type] = count


    # ---------------- Context ----------------
    context = {
        'male_count': male_count,
        'female_count': female_count,
        'seniors_count': seniors_count,
        'kids_count': kids_count,
        'male_kids': male_kids,
        'female_kids': female_kids,
        'male_adults': male_adults,
        'female_adults': female_adults,
        'male_seniors': male_seniors,
        'female_seniors': female_seniors,
        'no_education': no_education,
        'elementary': elementary,
        'high_school': high_school,
        'college': college,
        'pwd_count': pwd_count,
        'non_pwd_count': non_pwd_count,
        'voter_count': voter_count,
        'non_voter_count': non_voter_count,
        'civil_status_counts': civil_status_counts,
        'cert_data': json.dumps(cert_data)  # Pass as JSON to template

    }

    return render(request, 'authapp/dashboard.html', context)


def logout_view(request):
    logout(request)
    return redirect('login')  # Redirect to login page after logout

@login_required
def logbook_view(request):
    logs = CertificateLog.objects.all().order_by('-created_at')
    return render(request, "authapp/logbook.html", {"logs": logs})


@login_required  # Restrict access to authenticated users
def certification_view(request):
    return render(request, "authapp/certification.html")

@login_required
def home_view(request):
    return render (request, 'authapp/home.html')


#CRUD FUNCTION OF RECORDS
@login_required
def records_view(request):
    query = request.GET.get('q')
    filter_type = request.GET.get('filter')
    today = date.today()

    # Start with all residents
    residents = PersonInformation.objects.all()

    # Search by name
    if query:
        residents = residents.filter(
            Q(first_name__icontains=query) |
            Q(last_name__icontains=query) |
            Q(middle_name__icontains=query)
        )

    # Filter by age or gender
    if filter_type == 'seniors':
        residents = residents.filter(
            date_of_birth__isnull=False,
            date_of_birth__lte=date(today.year - 60, today.month, today.day)
        )
    elif filter_type == 'kids':
        residents = residents.filter(
            date_of_birth__isnull=False,
            date_of_birth__gte=date(today.year - 17, today.month, today.day)
        )
    elif filter_type == 'male':
        residents = residents.filter(gender__iexact='Male')
    elif filter_type == 'female':
        residents = residents.filter(gender__iexact='Female')

    # Check if the user is LimitedUser
    is_limited = request.user.groups.filter(name="LimitedUser").exists()

    return render(request, "authapp/records.html", {
        "residents": residents,
        "query": query,
        "selected_filter": filter_type,
        "is_limited": is_limited,  # <-- pass this to template
    })


@csrf_exempt
@login_required
def add_resident(request):
    if request.user.groups.filter(name="LimitedUser").exists():
        messages.error(request, "You are not allowed to add residents.")
        return redirect("records")

    if request.method == "POST":
        try:
            dob = request.POST.get("date_of_birth") or None
            if dob:
                dob = parse_date(dob)

            person = PersonInformation.objects.create(
                region=request.POST.get("region"),
                barangay=request.POST.get("barangay"),
                last_name=request.POST.get("last_name"),
                first_name=request.POST.get("first_name"),
                middle_name=request.POST.get("middle_name"),
                street_number=request.POST.get("street_number"),
                street=request.POST.get("street"),
                city=request.POST.get("city"),
                province=request.POST.get("province"),
                date_of_birth=dob,
                place_of_birth=request.POST.get("place_of_birth"),
                gender=request.POST.get("gender"),
                civil_status=request.POST.get("civil_status"),
                occupation=request.POST.get("occupation"),
                citizenship=request.POST.get("citizenship"),
                relationship_to_household_head=request.POST.get("relationship_to_household_head"),
                educational_background=request.POST.get("educational_background"),
                pwd_status=request.POST.get("pwd_status", "No"),
                voter_status=request.POST.get("voter_status", "Non-Voter"),
            )
            messages.success(request, f"Resident {person.first_name} {person.last_name} added successfully.")
        except Exception as e:
            messages.error(request, f"Error adding resident: {str(e)}")

    return redirect("records")

@csrf_exempt
@login_required
def update_resident(request, id):
    if request.user.groups.filter(name="LimitedUser").exists():
        messages.error(request, "You are not allowed to update residents.")
        return redirect("records")

    person = get_object_or_404(PersonInformation, id=id)
    if request.method == "POST":
        try:
            dob = request.POST.get("date_of_birth") or None
            if dob:
                dob = parse_date(dob)

            for field in [
                "region", "barangay", "last_name", "first_name", "middle_name",
                "street_number", "street", "city", "province", "place_of_birth",
                "gender", "civil_status", "occupation", "citizenship",
                "relationship_to_household_head", "educational_background",
                "pwd_status", "voter_status"
            ]:
                setattr(person, field, request.POST.get(field))

            person.date_of_birth = dob
            person.save()
            messages.success(request, f"Resident {person.first_name} {person.last_name} updated successfully.")
        except Exception as e:
            messages.error(request, f"Error updating resident: {str(e)}")

    return redirect("records")

def get_resident(request, id):
    try:
        person = PersonInformation.objects.get(id=id)
        data = {
            "id": person.id,
            "region": person.region,
            "barangay": person.barangay,
            "last_name": person.last_name,
            "first_name": person.first_name,
            "middle_name": person.middle_name,
            "street_number": person.street_number,
            "street": person.street,
            "city": person.city,
            "province": person.province,
            "date_of_birth": person.date_of_birth.strftime('%Y-%m-%d') if person.date_of_birth else None,
            "place_of_birth": person.place_of_birth,
            "gender": person.gender,
            "civil_status": person.civil_status,
            "occupation": person.occupation,
            "citizenship": person.citizenship,
            "relationship_to_household_head": person.relationship_to_household_head,
            "educational_background": person.educational_background,
        }
        return JsonResponse(data)
    except PersonInformation.DoesNotExist:
        return JsonResponse({"error": "Resident not found"}, status=404)


@csrf_exempt
@login_required
def delete_resident(request, id):
    # 🚫 Restrict LimitedUser
    if request.user.groups.filter(name="LimitedUser").exists():
        messages.error(request, "You are not allowed to delete residents.")
        return redirect("records")

    person = get_object_or_404(PersonInformation, id=id)
    if request.method == "POST":
        person.delete()
        messages.success(request, f"Resident {person.first_name} {person.last_name} deleted successfully.")
    return redirect("records")

#UPLOAD EXCEL FOR RECORDS
@csrf_exempt
@login_required
def upload_excel(request):
    # 🚫 Restrict LimitedUser
    if request.user.groups.filter(name="LimitedUser").exists():
        return JsonResponse({'success': False, 'message': 'You are not allowed to upload records.'}, status=403)

    if request.method == 'POST' and request.FILES.get('excel_file'):
        excel_file = request.FILES['excel_file']

        # Save the file temporarily
        file_path = default_storage.save('tmp/' + excel_file.name, ContentFile(excel_file.read()))
        file_full_path = default_storage.path(file_path)

        try:
            wb = openpyxl.load_workbook(file_full_path, read_only=True)
            ws = wb.active
            residents_to_create = []
            names_for_log = []
            for row in ws.iter_rows(min_row=2, values_only=True):  # Skip header
                try:
                    resident = PersonInformation(
                        first_name=row[0],
                        middle_name=row[1],
                        last_name=row[2],
                        date_of_birth=row[3],
                        place_of_birth=row[4],
                        gender=row[5],
                        civil_status=row[6],
                        occupation=row[7],
                        citizenship=row[8],
                        relationship_to_household_head=row[9],
                        educational_background=row[10],
                        street_number=row[11],
                        street=row[12],
                        barangay=row[13],
                        city=row[14],
                        province=row[15],
                        region=row[16],
                        pwd_status=row[17],
                        voter_status=row[18]
                    )
                    residents_to_create.append(resident)
                    names_for_log.append(f"{row[2]}, {row[0]} {row[1]}")
                except Exception:
                    continue  # Skip invalid row

            # Bulk create all valid residents at once
            PersonInformation.objects.bulk_create(residents_to_create)
            
            return JsonResponse({'success': True, 'message': f'{len(residents_to_create)} records uploaded successfully.'})
        except Exception as e:
            return JsonResponse({'success': False, 'message': f'Error processing file: {str(e)}'})

    return JsonResponse({'success': False, 'message': 'No file uploaded or invalid method'})


@login_required
def search_resident(request, cert_type):
    search_name = ""
    residents = None
    error = None

    if request.method == "POST":
        search_name = request.POST.get("full_name")
        residents = PersonInformation.objects.filter(
            Q(first_name__icontains=search_name) |
            Q(last_name__icontains=search_name) |
            Q(middle_name__icontains=search_name)
        )

        if residents.exists():
            if residents.count() == 1:
                return redirect('generate_certificate', cert_type=cert_type, resident_id=residents.first().id)
        else:
            error = "Resident not found."

    # Check if the user is LimitedUser
    is_limited = request.user.groups.filter(name="LimitedUser").exists()
    # Pass all user groups to template for JS logic if needed
    user_groups = list(request.user.groups.values_list('name', flat=True))

    context = {
        'cert_type': cert_type,
        'residents': residents,
        'search_term': search_name,
        'error': error,
        'is_limited': is_limited,
        'user_groups': user_groups,
    }

    return render(request, 'certificates/search.html', context)


def generate_certificate(request, cert_type, resident_id):
    # Define purpose_map first
    purpose_map = {
        "good_moral": "Good Moral Certificate",
        "financial_assistance": "Financial Assistance",
        "proof_of_residency": "Proof of Residency",
        "medical_assistance": "Medical Assistance",
        "first_time_job_seekers": "Employment Requirement",
        "solo_parent_renewal": "Solo Parent/ PWD Support",
        "business_permit": "Business Permit",
        "building_permit": "Building Permit",
        "pwd_application": "PWD Application"
    }

    resident = get_object_or_404(PersonInformation, pk=resident_id)
    full_name = f"{resident.first_name} {resident.middle_name} {resident.last_name}"
    address = f"{resident.street_number} {resident.street}, {resident.barangay}, {resident.city}"
    birthday = resident.date_of_birth.strftime("%B %d, %Y") if resident.date_of_birth else ""
    civil_status = resident.civil_status

    # Log the certificate generation and get the certificate number
    cert_log = CertificateLog.objects.create(
        admin=request.user,
        resident=resident,
        certificate_type=cert_type.replace('_', ' ').title(),
        purpose=purpose_map.get(cert_type, "OFFICIAL PURPOSES"),
        resident_name=full_name,
        created_at=now() 
    )

    context = {
        'full_name': full_name,
        'address': address,
        'birthday': birthday,
        'civil_status': civil_status,
        'date_today': date.today().strftime("%B %d, %Y"),
        'purpose': purpose_map.get(cert_type, "FOR OFFICIAL PURPOSES"),
        'certificate_number': cert_log.certificate_number
    }

    return render(request, f'certificates/{cert_type}.html', context)

def manual_certificate_input(request):
    if request.method == "POST":
        full_name = request.POST.get("full_name")
        address = request.POST.get("address")
        birthday = request.POST.get("birthday")
        civil_status = request.POST.get("civil_status")
        cert_type = request.POST.get("cert_type")

        purpose_map = {
            "good_moral": "",
            "financial_assistance": "FINANCIAL ASSISTANCE",
            "proof_of_residency": "PROOF OF RESIDENCY",
            "medical_assistance": "MEDICAL ASSISTANCE",
            "burial_assistance": "BURIAL ASSISTANCE",
            "solo_parent_renewal": "SOLO PARENT/PWD SUPPORT",
            "business_permit": "BUSINESS PERMIT",
            "building_permit": "BUILDING PERMIT"
        }

        context = {
            "full_name": full_name,
            "address": address,
            "birthday": parse_date(birthday).strftime("%B %d, %Y") if birthday else "",
            "civil_status": civil_status,
            "date_today": date.today().strftime("%B %d, %Y"),
            "purpose": purpose_map.get(cert_type, "FOR OFFICIAL PURPOSES"),
        }

        return render(request, f'certificates/{cert_type}.html', context)

    return render(request, "certificates/manual_input.html")


@login_required
def get_officials_json(request):
    officials = BarangayOfficial.objects.all().order_by('order')
    data = [{
        'id': official.id,
        'position': official.position,
        'name': official.name,
        'committee': official.committee,
        'order': official.order
    } for official in officials]
    
    response = JsonResponse(data, safe=False)
    response['Cache-Control'] = 'no-cache, no-store, must-revalidate'
    response['Pragma'] = 'no-cache'
    response['Expires'] = '0'
    return response

@login_required
def update_officials(request):
    # 🚫 Restrict LimitedUser
    if request.user.groups.filter(name="LimitedUser").exists():
        return JsonResponse({'success': False, 'error': 'You are not allowed to update officials.'}, status=403)

    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            for official_data in data:
                try:
                    official_id = int(official_data.get('id'))
                    official = BarangayOfficial.objects.get(id=official_id)
                    official.name = official_data.get('name', official.name)
                    official.save()
                except (ValueError, BarangayOfficial.DoesNotExist):
                    continue
            
            return JsonResponse({'success': True})
        except Exception as e:
            return JsonResponse({'success': False, 'error': str(e)}, status=400)

    return JsonResponse({'success': False, 'error': 'Invalid method'}, status=400)


@login_required
def backup_database(request):
    if request.method == "POST":
        try:
            # Prepare backup directory
            backup_dir = Path(settings.BASE_DIR) / 'authapp' / 'static' / 'SQL'
            backup_dir.mkdir(parents=True, exist_ok=True)

            # Timestamped filename
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            backup_file = backup_dir / f"backup_{timestamp}.sql"

            # MySQL credentials from settings
            db_settings = settings.DATABASES['default']
            db_name = db_settings['NAME']
            db_user = db_settings['USER']
            db_password = db_settings['PASSWORD']
            db_host = db_settings.get('HOST', '127.0.0.1')
            db_port = db_settings.get('PORT', '3306')

            # Try to find mysqldump in common locations
            possible_paths = [
                r"C:\Program Files\MySQL\MySQL Server 9.0\bin\mysqldump.exe",
                r"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe",
                r"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump.exe",
                r"C:\xampp\mysql\bin\mysqldump.exe",
                r"C:\wamp64\bin\mysql\mysql8.0.31\bin\mysqldump.exe",
            ]
            
            mysqldump_path = None
            for path in possible_paths:
                if Path(path).exists():
                    mysqldump_path = path
                    break
            
            if not mysqldump_path:
                return JsonResponse({
                    "success": False, 
                    "error": "mysqldump.exe not found. Please check your MySQL installation path."
                }, status=500)

            # Build command
            command = [
                mysqldump_path,
                f"-u{db_user}",
                f"-h{db_host}",
                f"-P{db_port}",
            ]

            # Add password if not empty
            if db_password:
                command.append(f"-p{db_password}")
            
            command.append(db_name)

            # Run the command
            with open(backup_file, "w", encoding="utf-8") as f:
                result = subprocess.run(command, stdout=f, stderr=subprocess.PIPE, check=True)

            return JsonResponse({"success": True, "file": str(backup_file)})

        except subprocess.CalledProcessError as e:
            error_msg = e.stderr.decode('utf-8') if e.stderr else "Unknown error occurred"
            return JsonResponse({"success": False, "error": f"Backup failed: {error_msg}"}, status=500)
        except FileNotFoundError:
            return JsonResponse({"success": False, "error": "MySQL is not installed or mysqldump.exe not found"}, status=500)
        except Exception as e:
            return JsonResponse({"success": False, "error": f"Error: {str(e)}"}, status=500)

    return JsonResponse({"error": "Invalid method"}, status=405)

@login_required
def resident_detail_modal(request, id):
    resident = get_object_or_404(PersonInformation, id=id)

    total_certs = CertificateLog.objects.filter(resident=resident).count()

    certs_by_type = (
        CertificateLog.objects
        .filter(resident=resident)
        .values('certificate_type')
        .annotate(count=Count('id'))
        .order_by('-count')
    )

    certificates = (
        CertificateLog.objects
        .filter(resident=resident)
        .select_related('admin')
        .order_by('-created_at')
    )

    return render(request, 'authapp/resident_detail_modal.html', {
        'resident': resident,
        'total_certs': total_certs,
        'certs_by_type': certs_by_type,
        'certificates': certificates,
    })

# Password Reset Views
def password_reset_request(request):
    if request.method == "POST":
        email = request.POST.get("email")
        try:
            user = User.objects.get(email=email)
            
            # Generate token and uid
            token = default_token_generator.make_token(user)
            uid = urlsafe_base64_encode(force_bytes(user.pk))
            
            # Build reset link
            reset_link = request.build_absolute_uri(
                f'/password-reset-confirm/{uid}/{token}/'
            )
            
            # Send email
            subject = "Password Reset Request"
            message = f"""
Hello {user.username},

You requested a password reset. Click the link below to reset your password:

{reset_link}

If you didn't request this, please ignore this email.

This link will expire in 24 hours.
            """
            
            send_mail(
                subject,
                message,
                settings.DEFAULT_FROM_EMAIL,
                [email],
                fail_silently=False,
            )
            
            return redirect('password_reset_done')
        except User.DoesNotExist:
            messages.error(request, "No user found with that email address.")
    
    return render(request, 'authapp/password_reset_request.html')

def password_reset_done(request):
    return render(request, 'authapp/password_reset_done.html')

def password_reset_confirm(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    
    if user is not None and default_token_generator.check_token(user, token):
        if request.method == "POST":
            password1 = request.POST.get("password1")
            password2 = request.POST.get("password2")
            
            if password1 == password2:
                user.set_password(password1)
                user.save()
                messages.success(request, "Your password has been reset successfully!")
                return redirect('password_reset_complete')
            else:
                messages.error(request, "Passwords do not match.")
        
        return render(request, 'authapp/password_reset_confirm.html', {
            'validlink': True,
            'uidb64': uidb64,
            'token': token
        })
    else:
        return render(request, 'authapp/password_reset_confirm.html', {
            'validlink': False
        })

def password_reset_complete(request):
    return render(request, 'authapp/password_reset_complete.html')

@login_required
def user_settings(request):
    # Restrict to Admin group only
    if not request.user.groups.filter(name="Admin").exists():
        messages.error(request, "You do not have permission to access this page.")
        return redirect('dashboard')
    
    if request.method == "POST":
        email = request.POST.get("email")
        
        # Update user email
        if email:
            request.user.email = email
            request.user.save()
            messages.success(request, "Email updated successfully!")
        else:
            messages.error(request, "Email cannot be empty.")
        
        return redirect('user_settings')
    
    return render(request, 'authapp/user_settings.html', {
        'user': request.user
    })
    