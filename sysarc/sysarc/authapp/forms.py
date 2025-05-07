from django import forms
from .models import PersonInformation

class PersonForm(forms.ModelForm):
    class Meta:
        model = PersonInformation
        fields = [
            'region', 'barangay', 'last_name', 'first_name', 'middle_name',
            'street_number', 'street', 'city', 'province', 'date_of_birth',
            'place_of_birth', 'gender', 'civil_status', 'occupation',
            'citizenship', 'relationship_to_household_head', 'educational_background'
        ]
        widgets = {
            'date_of_birth': forms.DateInput(attrs={'type': 'date'}),
        }