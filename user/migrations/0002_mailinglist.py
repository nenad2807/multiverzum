# Generated by Django 4.1.7 on 2023-05-10 20:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='MailingList',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_created', models.DateTimeField(auto_now=True)),
                ('is_deleted', models.BooleanField(default=False)),
                ('email', models.EmailField(max_length=60, unique=True)),
            ],
            options={
                'db_table': 'mailing_list',
            },
        ),
    ]
