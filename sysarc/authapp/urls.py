from django.urls import path
from . import views
from .views import login_view, logout_view, dashboard_view, records_view, logbook_view, certification_view
from .views import records_view, add_resident, update_resident, delete_resident


urlpatterns = [
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
    path('logbook/', views.logbook_view, name='logbook'),

]
