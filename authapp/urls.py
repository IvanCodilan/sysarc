from django.urls import path
from . import views
from .views import home_view, login_view, logout_view, dashboard_view, records_view, logbook_view, certification_view
from .views import records_view, add_resident, update_resident, delete_resident
from .views import search_resident, generate_certificate
from .views import manual_certificate_input


urlpatterns = [
    path("home/", home_view, name="home"),
    path("login/", login_view, name="login"),
    path("logout/", logout_view, name="logout"),    
    path('dashboard/', dashboard_view, name='dashboard'),
    path('records/', views.records_view, name='records'),
    path('logbook/', logbook_view, name='logbook'),
    path('certification/', certification_view, name='certification'),
    path('records/', records_view, name='records'),
    path('add_resident/', add_resident, name='add_resident'),
    path('update_resident/<int:id>/', update_resident, name='update_resident'),
    path('delete_resident/<int:id>/', delete_resident, name='delete_resident'),
    path('upload_excel/', views.upload_excel, name='upload_excel'),
    path('generate/<str:cert_type>/', search_resident, name='search_resident'),
    path('generate/<str:cert_type>/<int:resident_id>/', generate_certificate, name='generate_certificate'),
    path('manual-certificate/', manual_certificate_input, name='manual_certificate'),
    path('get-officials/', views.get_officials_json, name='get_officials_json'),
    path('update-officials/', views.update_officials, name='update_officials'),
    path('backup-database/', views.backup_database, name='backup_database'),
    path('resident/<int:id>/modal/', views.resident_detail_modal, name='resident_detail_modal'),
    # Password Reset URLs
    path('password-reset/', views.password_reset_request, name='password_reset'),
    path('password-reset-done/', views.password_reset_done, name='password_reset_done'),
    path('password-reset-confirm/<uidb64>/<token>/', views.password_reset_confirm, name='password_reset_confirm'),
    path('password-reset-complete/', views.password_reset_complete, name='password_reset_complete'),
    # Login unlock (magic link)
    path('unlock-login/<uidb64>/<token>/', views.unlock_login, name='unlock_login'),
    # User Settings
    path('settings/', views.user_settings, name='user_settings'),
    path('user/settings/', views.user_settings, name='user_settings'),
    path('user_settings/', views.user_settings, name='user_settings'),
    path('create_moderator/', views.create_moderator, name='create_moderator'),
    path('edit-moderator-modal/', views.edit_moderator_modal, name='edit_moderator_modal'),
    path("delete_moderator/<int:user_id>/", views.delete_moderator, name="delete_moderator"),
    path('archived-records/', views.archived_records, name='archived_records'),
    path('add-certificate/', views.add_certificate, name='add_certificate'),
    path('restore-resident/<int:archived_id>/', views.restore_resident, name='restore_resident'),
]
