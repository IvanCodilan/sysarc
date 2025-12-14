from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import PersonInformation, ArchivedResident

@receiver(post_save, sender=PersonInformation)
def archive_inactive_resident(sender, instance, created, **kwargs):
    """
    Archive a resident if their status becomes Inactive. Do NOT delete.
    """
    # Skip newly created residents
    if created:
        return

    # Check if resident is Inactive and not yet archived
    if instance.resident_status == "Inactive":
        if not ArchivedResident.objects.filter(
            first_name=instance.first_name,
            middle_name=instance.middle_name,
            last_name=instance.last_name,
            date_of_birth=instance.date_of_birth
        ).exists():
            # Archive first
            ArchivedResident.objects.create(
                first_name=instance.first_name,
                middle_name=instance.middle_name,
                last_name=instance.last_name,
                gender=instance.gender,
                date_of_birth=instance.date_of_birth,
                archived_reason="Status changed to Inactive"
            )

        # Do not delete; keep the resident record marked as Inactive