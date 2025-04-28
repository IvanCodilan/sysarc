from django.urls import path
from . import views

urlpatterns = [
    path("login/", views.login_view, name="login"),
    path("logout/", views.logout_view, name="logout"),
    path('dashboard/', views.dashboard_view, name='dashboard'),
    path('records/', views.records_view, name='records'),
    path('logbook/', views.logbook_view, name='logbook'),
    path('certification/', views.certification_view, name='certification'),

    path('add_resident/', views.add_resident, name='add_resident'),
    path('edit_resident/<int:id>/', views.edit_resident_view, name='edit_resident'),
    path('update_resident/<int:id>/', views.update_resident, name='update_resident'),
    path('delete_resident/<int:id>/', views.delete_resident, name='delete_resident'),
]
