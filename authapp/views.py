from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from .models import PersonInformation  # (Assuming model is named PersonInformation)
from django.views.decorators.csrf import csrf_exempt
import json
from datetime import datetime

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

@login_required  # Restrict access to authenticated users
def records_view(request):
    return render(request, "authapp/records.html")

@login_required  # Restrict access to authenticated users
def logbook_view(request):
    return render(request, "authapp/logbook.html")

@login_required  # Restrict access to authenticated users
def certification_view(request):
    return render(request, "authapp/certification.html")

def home_view(request):
    return redirect('dashboard')



def records_view(request):
    residents = PersonInformation.objects.all()
    return render(request, "authapp/records.html", {"residents": residents})

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
            "date_of_birth": str(person.date_of_birth),
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
        data = json.loads(request.body)
        person = PersonInformation.objects.get(id=id)
        person.region = data.get('region')
        person.barangay = data.get('barangay')
        person.last_name = data.get('last_name')
        person.first_name = data.get('first_name')
        person.middle_name = data.get('middle_name')
        person.street_number = data.get('street_number')
        person.street = data.get('street')
        person.city = data.get('city')
        person.province = data.get('province')
        person.date_of_birth = data.get('date_of_birth')
        person.place_of_birth = data.get('place_of_birth')
        person.gender = data.get('gender')
        person.civil_status = data.get('civil_status')
        person.occupation = data.get('occupation')
        person.citizenship = data.get('citizenship')
        person.relationship_to_household_head = data.get('relationship_to_household_head')
        person.educational_background = data.get('educational_background')
        person.save()
        return JsonResponse({"success": True})
    return JsonResponse({"error": "Invalid method"}, status=400)

@csrf_exempt
def delete_resident(request, id):
    if request.method == "POST":
        try:
            person = PersonInformation.objects.get(id=id)
            person.delete()
            return JsonResponse({"success": True})
        except PersonInformation.DoesNotExist:
            return JsonResponse({"error": "Resident not found"}, status=404)
    return JsonResponse({"error": "Invalid method"}, status=400)

