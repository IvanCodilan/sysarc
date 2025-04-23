from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse

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