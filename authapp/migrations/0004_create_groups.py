from django.db import migrations

def create_groups(apps, schema_editor):
    Group = apps.get_model('auth', 'Group')
    Permission = apps.get_model('auth', 'Permission')
    ContentType = apps.get_model('contenttypes', 'ContentType')

    # Get or create groups
    admin_group, _ = Group.objects.get_or_create(name="AdminUser")
    limited_group, _ = Group.objects.get_or_create(name="LimitedUser")

    # ===== AdminUser: give all permissions =====
    all_perms = Permission.objects.all()
    admin_group.permissions.set(all_perms)

    # ===== LimitedUser: only create certificates =====
    cert_content_type = ContentType.objects.get(app_label='authapp', model='certificatelog')
    add_cert_perm = Permission.objects.get(codename='add_certificatelog', content_type=cert_content_type)

    limited_group.permissions.set([add_cert_perm])

class Migration(migrations.Migration):

    dependencies = [
        ('authapp', '0003_alter_personinformation_pwd_status_and_more'),
        ('auth', '__latest__'),
    ]

    operations = [
        migrations.RunPython(create_groups),
    ]
