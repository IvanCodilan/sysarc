# Create your models here.
from django.db import models
from django.contrib.auth.models import User


class PersonInformation(models.Model):
    region = models.CharField(max_length=100, blank=True, null=True)
    barangay = models.CharField(max_length=100, blank=True, null=True)
    last_name = models.CharField(max_length=100, blank=True, null=True)
    first_name = models.CharField(max_length=100, blank=True, null=True)
    middle_name = models.CharField(max_length=100, blank=True, null=True)
    street_number = models.CharField(max_length=20, blank=True, null=True)
    street = models.CharField(max_length=100, blank=True, null=True)
    city = models.CharField(max_length=100, blank=True, null=True)
    province = models.CharField(max_length=100, blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    place_of_birth = models.CharField(max_length=100, blank=True, null=True)
    gender = models.CharField(max_length=6, choices=[('Male','Male'),('Female','Female'),('Other','Other')])
    civil_status = models.CharField(max_length=9, choices=[('Single','Single'),('Married','Married'),('Separated','Separated')])
    occupation = models.CharField(max_length=100, blank=True, null=True)
    citizenship = models.CharField(max_length=50, blank=True, null=True)
    relationship_to_household_head = models.CharField(max_length=100, blank=True, null=True)
    educational_background = models.CharField(
        max_length=20,
        blank=True,
        null=True,
        choices=[
            ('No Formal Education','No Formal Education'),
            ('Elementary Graduate','Elementary Graduate'),
            ('High School Graduate','High School Graduate'),
            ('College Graduate','College Graduate'),
        ],
    )

class LogEntry(models.Model):
    admin = models.ForeignKey(User, on_delete=models.CASCADE, related_name='custom_log_entries')
    action = models.CharField(max_length=10)  # e.g., 'ADD', 'EDIT', 'DELETE', 'IMPORT'
    resident_name = models.CharField(max_length=255)
    timestamp = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return f"{self.admin.username} - {self.action} - {self.resident_name}"
    
