from django.db import migrations

def create_default_users(apps, schema_editor):
    User = apps.get_model("auth", "User")
    Group = apps.get_model("auth", "Group")

    admin_group, _ = Group.objects.get_or_create(name="Admin")
    limited_group, _ = Group.objects.get_or_create(name="LimitedUser")


    if not User.objects.filter(username="admin").exists():
        admin_user = User.objects.create_user(
            username="admin",
            password="32ed05eb",
            email="nepomucenoluis53@gmail.com",
            is_superuser=True,
            is_staff=True
        )
        admin_user.groups.add(admin_group)

    if not User.objects.filter(username="moderator").exists():
        mod_user = User.objects.create_user(
            username="moderator",
            password="4f4a07af",
            is_superuser=False,
            is_staff=True
        )
        mod_user.groups.add(limited_group)

def delete_default_users(apps, schema_editor):
    User = apps.get_model("auth", "User")
    User.objects.filter(username__in=["admin", "moderator"]).delete()

class Migration(migrations.Migration):

    dependencies = [
        ("authapp", "0004_create_groups"),  
    ]

    operations = [
        migrations.RunPython(create_default_users, delete_default_users),
    ]
