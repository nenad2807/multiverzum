# Generated by Django 4.1.7 on 2023-06-03 23:40

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('main', '0005_faq'),
        ('user', '0003_preferredcategories'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='preferredCategories',
            new_name='userCategoryPreferences',
        ),
        migrations.AlterModelOptions(
            name='usercategorypreferences',
            options={},
        ),
        migrations.AlterModelTable(
            name='usercategorypreferences',
            table='user_category_preference',
        ),
    ]
