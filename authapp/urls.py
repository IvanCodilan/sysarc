from django.urls import path
from .views import login_view, logout_view, dashboard_view, records_view, logbook_view, certification_view

urlpatterns = [
    path("login/", login_view, name="login"),
    path("logout/", logout_view, name="logout"),
    path('dashboard/', dashboard_view, name='dashboard'),
    path('records/', records_view, name='records'),
    path('logbook/', logbook_view, name='logbook'),
    path('certification/', certification_view, name='certification'),
]
