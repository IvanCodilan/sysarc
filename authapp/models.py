# Create your models here.
from django.db import models
from django.contrib.auth.models import User
from datetime import date
from django.contrib.auth.models import Group
from django.conf import settings
from django.core.exceptions import ImproperlyConfigured
from cryptography.fernet import Fernet, InvalidToken


class EncryptedTextField(models.TextField):
    """A TextField that transparently encrypts/decrypts values using Fernet."""

    def _get_fernet(self):
        key = getattr(settings, 'FERNET_KEY', None)
        if not key:
            raise ImproperlyConfigured('FERNET_KEY is not set in settings.')
        if isinstance(key, str):
            key = key.encode()
        return Fernet(key)

    def get_prep_value(self, value):
        value = super().get_prep_value(value)
        if value in (None, ''):
            return value
        if isinstance(value, str):
            value_bytes = value.encode('utf-8')
        else:
            value_bytes = value
        token = self._get_fernet().encrypt(value_bytes)
        return token.decode('utf-8')

    def from_db_value(self, value, expression, connection):
        if value in (None, ''):
            return value
        try:
            decrypted = self._get_fernet().decrypt(value.encode('utf-8'))
            return decrypted.decode('utf-8')
        except (InvalidToken, ValueError, TypeError):
            # If it's not decryptable (e.g., already plaintext), return as-is
            return value

    def to_python(self, value):
        if value in (None, ''):
            return value
        if isinstance(value, str):
            # Attempt decrypt; if fails, assume plaintext
            try:
                decrypted = self._get_fernet().decrypt(value.encode('utf-8'))
                return decrypted.decode('utf-8')
            except (InvalidToken, ValueError, TypeError):
                return value
        return value


class PersonInformation(models.Model):
    # Keep plaintext for searchable/sortable fields
    barangay = models.CharField(max_length=100, blank=True, null=True)
    last_name = models.CharField(max_length=100, blank=True, null=True)
    first_name = models.CharField(max_length=100, blank=True, null=True)
    middle_name = models.CharField(max_length=100, blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    gender = models.CharField(max_length=6, choices=[('Male','Male'),('Female','Female'),('Other','Other')])
    pwd_status = models.CharField(
        max_length=3,
        choices=[('No', 'No'), ('PWD', 'PWD')],
        default='No'
    )
    voter_status = models.CharField(
        max_length=10,
        choices=[('Voter', 'Voter'), ('Non-Voter', 'Non-Voter')],
        default='Non-Voter'
    )
    resident_status = models.CharField(
        max_length=20,
        choices=[('Active', 'Active'), ('Inactive', 'Inactive')],
        default='Inactive'
    )

    # Encrypted sensitive fields
    region = EncryptedTextField(blank=True, null=True)
    street_number = EncryptedTextField(blank=True, null=True)
    street = EncryptedTextField(blank=True, null=True)
    city = EncryptedTextField(blank=True, null=True)
    province = EncryptedTextField(blank=True, null=True)
    place_of_birth = EncryptedTextField(blank=True, null=True)
    civil_status = EncryptedTextField(blank=True, null=True)
    occupation = EncryptedTextField(blank=True, null=True)
    citizenship = EncryptedTextField(blank=True, null=True)
    relationship_to_household_head = EncryptedTextField(blank=True, null=True)
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
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)

    def save(self, *args, **kwargs):
        def _norm(v):
            if isinstance(v, str):
                v2 = v.strip()
                return v2.title()
            return v

        for fname in [
            'first_name', 'middle_name', 'last_name',
            'barangay', 'street_number', 'street', 'city', 'province', 'region',
            'place_of_birth', 'civil_status', 'occupation', 'citizenship',
            'relationship_to_household_head', 'educational_background',
        ]:
            val = getattr(self, fname, None)
            if val is not None:
                setattr(self, fname, _norm(val))

        super().save(*args, **kwargs)


class CertificateLog(models.Model):
    admin = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    resident = models.ForeignKey(PersonInformation, on_delete=models.SET_NULL, null=True, blank=True)
    certificate_type = models.CharField(max_length=100)
    purpose = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    resident_name = models.CharField(max_length=255, blank=True)  # For manual entries
    certificate_number = models.CharField(max_length=50, unique=True, blank=True, null=True)

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Certificate Log'
        verbose_name_plural = 'Certificate Logs'

    def __str__(self):
        if self.resident:
            return f"{self.certificate_type} - {self.resident.first_name} {self.resident.last_name}"
        return f"{self.certificate_type} - {self.resident_name or 'Manual Entry'}"
    
    def save(self, *args, **kwargs):
        if not self.certificate_number:
            # Generate certificate number: BRGY570-YYYY-NNNNNN
            year = self.created_at.year if self.created_at else date.today().year
            last_cert = CertificateLog.objects.filter(
                created_at__year=year
            ).order_by('-id').first()
            
            if last_cert and last_cert.certificate_number:
                # Extract the last number and increment
                try:
                    last_number = int(last_cert.certificate_number.split('-')[-1])
                    new_number = last_number + 1
                except (ValueError, IndexError):
                    new_number = 1
            else:
                new_number = 1
            
            self.certificate_number = f"BRGY570-{year}-{new_number:06d}"
        
        super().save(*args, **kwargs)

class BarangayOfficial(models.Model):
    POSITION_CHOICES = [
        ('Punong Barangay', 'Punong Barangay'),
        ('Kagawad', 'Kagawad'),
        ('Secretary', 'Secretary'),
        ('Treasurer', 'Treasurer'),
        ('SK Chairman', 'SK Chairman'),
    ]
    
    COMMITTEE_CHOICES = [
        ('Appropriation', 'Appropriation'),
        ('Clean & Beautification', 'Clean & Beautification'),
        ('Women, Children, & Elderly', 'Women, Children, & Elderly'),
        ('Health & Sanitation', 'Health & Sanitation'),
        ('Peace & Order', 'Peace & Order'),
        ('Youth & Education', 'Youth & Education'),
        ('Ways & Means', 'Ways & Means'),
        ('None', 'None'),
    ]
    
    position = models.CharField(max_length=50, choices=POSITION_CHOICES)
    name = models.CharField(max_length=100)
    committee = models.CharField(max_length=50, choices=COMMITTEE_CHOICES, default='None')
    order = models.IntegerField(default=0)  # For sorting
    
    class Meta:
        ordering = ['order']
    
    def __str__(self):
        return f"{self.position}: {self.name}"
    
from django.contrib.auth.models import User

class RolePermission(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    can_add_resident = models.BooleanField(default=False)
    can_edit_resident = models.BooleanField(default=False)
    can_delete_resident = models.BooleanField(default=False)
    can_upload_excel = models.BooleanField(default=False)

    def __str__(self):
        return f"Permissions for {self.user.username}"

class ArchivedResident(models.Model):
    first_name = models.CharField(max_length=100)
    middle_name = models.CharField(max_length=100, null=True, blank=True)
    last_name = models.CharField(max_length=100)
    date_of_birth = models.DateField(null=True, blank=True)
    place_of_birth = models.CharField(max_length=255, null=True, blank=True)
    gender = models.CharField(max_length=10, null=True, blank=True)
    civil_status = models.CharField(max_length=50, null=True, blank=True)
    occupation = models.CharField(max_length=100, null=True, blank=True)
    citizenship = models.CharField(max_length=50, null=True, blank=True)
    relationship_to_household_head = models.CharField(max_length=50, null=True, blank=True)
    educational_background = models.CharField(max_length=100, null=True, blank=True)
    street_number = models.CharField(max_length=50, null=True, blank=True)
    street = models.CharField(max_length=100, null=True, blank=True)
    barangay = models.CharField(max_length=100, null=True, blank=True)
    city = models.CharField(max_length=100, null=True, blank=True)
    province = models.CharField(max_length=100, null=True, blank=True)
    region = models.CharField(max_length=100, null=True, blank=True)
    pwd_status = models.CharField(max_length=50, null=True, blank=True)
    voter_status = models.CharField(max_length=50, null=True, blank=True)
    resident_status = models.CharField(max_length=50, default="Inactive")
    date_archived = models.DateTimeField(auto_now_add=True)
    archived_reason = models.CharField(max_length=255, default="Deceased")

    def __str__(self):
        return f"{self.first_name} {self.middle_name or ''} {self.last_name}"