from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from .models import PersonInformation  # (Assuming model is named PersonInformation)
from django.views.decorators.csrf import csrf_exempt
import json
from datetime import datetime
import openpyxl
from django.views.decorators.csrf import csrf_exempt
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from django.db.models import Q
from .models import ActivityLog



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
    return render(request, 'authapp/dashboard.html')

def logout_view(request):
    logout(request)
    return redirect('login')  # Redirect to login page after logout

@login_required
def logbook_view(request):
    logs = ActivityLog.objects.select_related('admin').order_by('-timestamp')
    return render(request, 'authapp/logbook.html', {'logs': logs})


@login_required  # Restrict access to authenticated users
def certification_view(request):
    return render(request, "authapp/certification.html")

def home_view(request):
    return redirect('dashboard')


#CRUD FUNCTION OF RECORDS
@login_required  # Restrict access to authenticated users
def records_view(request):
    query = request.GET.get('q')  # Get the search term
    if query:
        residents = PersonInformation.objects.filter(
            Q(first_name__icontains=query) |
            Q(last_name__icontains=query) |
            Q(middle_name__icontains=query)
        )
    else:
        residents = PersonInformation.objects.all()
    return render(request, "authapp/records.html", {"residents": residents, "query": query})


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

        ActivityLog.objects.create(
            admin=request.user,
            action='ADD',
            resident_name=f"{person.last_name}, {person.first_name} {person.middle_name}"
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

            ActivityLog.objects.create(
                admin=request.user,
                action='EDIT',
                resident_name=f"{person.last_name}, {person.first_name} {person.middle_name}" 
            )

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

            ActivityLog.objects.create(
                admin=request.user,
                action='DELETE',
                resident_name=resident_name
            )
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
            wb = openpyxl.load_workbook(file_full_path)
            ws = wb.active
            success_count = 0
            for row in ws.iter_rows(min_row=2, values_only=True):  # Assuming first row is header
                try:
                    person = PersonInformation.objects.create(
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
                    ActivityLog.objects.create(
                        admin=request.user,
                        action='ADD',
                        resident_name=f"{person.last_name}, {person.first_name} {person.middle_name}"
                    )
                    success_count += 1
                except Exception as e:
                    continue  # Skip invalid row
            return JsonResponse({'success': True, 'message': f'{success_count} records uploaded successfully.'})
        except Exception as e:
            return JsonResponse({'success': False, 'message': f'Error processing file: {str(e)}'})
    return JsonResponse({'success': False, 'message': 'No file uploaded or invalid method'})



