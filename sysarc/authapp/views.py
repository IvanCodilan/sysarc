from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from .models import PersonInformation  # (Assuming model is named PersonInformation)
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

    male_count = residents.filter(gender__iexact='Male').count()
    female_count = residents.filter(gender__iexact='Female').count()

    seniors_count = residents.filter(
        date_of_birth__isnull=False,
        date_of_birth__lte=date(today.year - 60, today.month, today.day)
    ).count()

    kids_count = residents.filter(
        date_of_birth__isnull=False,
        date_of_birth__gte=date(today.year - 17, today.month, today.day)
    ).count()

    return render(request, 'authapp/dashboard.html', {
        'male_count': male_count,
        'female_count': female_count,
        'seniors_count': seniors_count,
        'kids_count': kids_count
    })

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

def home_view(request):
    return redirect('dashboard')


#CRUD FUNCTION OF RECORDS
@login_required
def records_view(request):
    query = request.GET.get('q')
    filter_type = request.GET.get('filter')
    today = date.today()

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
        residents = [r for r in residents if r.date_of_birth and (
            today.year - r.date_of_birth.year - ((today.month, today.day) < (r.date_of_birth.month, r.date_of_birth.day)) >= 60)]
    elif filter_type == 'kids':
        residents = [r for r in residents if r.date_of_birth and (
            today.year - r.date_of_birth.year - ((today.month, today.day) < (r.date_of_birth.month, r.date_of_birth.day)) <= 17)]
    elif filter_type == 'male':
        residents = residents.filter(gender__iexact='Male')
    elif filter_type == 'female':
        residents = residents.filter(gender__iexact='Female')

    return render(request, "authapp/records.html", {
        "residents": residents,
        "query": query,
        "selected_filter": filter_type
    })


@csrf_exempt
def add_resident(request):
    if request.method == "POST":
        data = json.loads(request.body)
        person = PersonInformation.objects.create(
            region = data.get('region'),
            barangay = data.get('barangay'),
            last_name = data.get('last_name'),
            first_name = data.get('first_name'),
            middle_name = data.get('middle_name'),
            street_number = data.get('street_number'),
            street = data.get('street'),
            city = data.get('city'),
            province = data.get('province'),
            date_of_birth = data.get('date_of_birth'),
            place_of_birth = data.get('place_of_birth'),
            gender = data.get('gender'),
            civil_status = data.get('civil_status'),
            occupation = data.get('occupation'),
            citizenship = data.get('citizenship'),
            relationship_to_household_head = data.get('relationship_to_household_head'),
            educational_background = data.get('educational_background'),
        )

        
        return JsonResponse({"success": True})
    return JsonResponse({"error": "Invalid method"}, status=400)

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
def update_resident(request, id):
    if request.method == "POST":
        try:
            data = json.loads(request.body)
            person = PersonInformation.objects.get(id=id)
            
            # Update only provided fields
            fields = ['region', 'barangay', 'last_name', 'first_name', 'middle_name', 
                     'street_number', 'street', 'city', 'province', 'date_of_birth',
                     'place_of_birth', 'gender', 'civil_status', 'occupation',
                     'citizenship', 'relationship_to_household_head', 'educational_background']
            
            for field in fields:
                if field in data:
                    setattr(person, field, data[field])

            person.save()
            return JsonResponse({"success": True})
            
        except PersonInformation.DoesNotExist:
            return JsonResponse({"error": "Resident not found"}, status=404)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Invalid method"}, status=400)

@csrf_exempt
def delete_resident(request, id):
    if request.method == "POST":
        try:
            person = PersonInformation.objects.get(id=id)
            resident_name = f"{person.last_name}, {person.first_name} {person.middle_name}"

            person.delete()
            return JsonResponse({"success": True})
        except PersonInformation.DoesNotExist:
            return JsonResponse({"error": "Resident not found"}, status=404)
    return JsonResponse({"error": "Invalid method"}, status=400)


#UPLOAD EXCEL FOR RECORDS
@csrf_exempt
@login_required
def upload_excel(request):
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
                        region=row[16]
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

#

def search_resident(request, cert_type):
    if request.method == "POST":
        search_name = request.POST.get("full_name")
        # Search in first_name, last_name, or middle_name
        residents = PersonInformation.objects.filter(
            Q(first_name__icontains=search_name) |
            Q(last_name__icontains=search_name) |
            Q(middle_name__icontains=search_name)
        )
        
        if residents.exists():
            if residents.count() == 1:
                return redirect('generate_certificate', cert_type=cert_type, resident_id=residents.first().id)
            else:
                return render(request, 'certificates/search.html', {
                    'residents': residents,
                    'cert_type': cert_type,
                    'search_term': search_name
                })
        else:
            return render(request, 'certificates/search.html', {
                'error': 'Resident not found.',
                'cert_type': cert_type,
                'search_term': search_name
            })
    return render(request, 'certificates/search.html', {'cert_type': cert_type})


def generate_certificate(request, cert_type, resident_id):
    # Define purpose_map first
    purpose_map = {
        "good_moral": "Good Moral Certificate",
        "financial_assistance": "FINANCIAL ASSISTANCE",
        "proof_of_residency": "PROOF OF RESIDENCY",
        "medical_assistance": "MEDICAL ASSISTANCE",
        "first_time_job_seekers": "EMPLOYMENT REQUIREMENT",
        "solo_parent_renewal": "SOLO PARENT/PWD SUPPORT"
    }

    resident = get_object_or_404(PersonInformation, pk=resident_id)
    full_name = f"{resident.first_name} {resident.middle_name} {resident.last_name}"
    address = f"{resident.street_number} {resident.street}, {resident.barangay}, {resident.city}"
    birthday = resident.date_of_birth.strftime("%B %d, %Y") if resident.date_of_birth else ""
    civil_status = resident.civil_status

    # Log the certificate generation
    CertificateLog.objects.create(
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
        'purpose': purpose_map.get(cert_type, "FOR OFFICIAL PURPOSES")
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
            "solo_parent_renewal": "SOLO PARENT/PWD SUPPORT"
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

def update_officials(request):
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