# Generated by Django 4.2.4 on 2023-10-05 05:09

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('appquestioner', '0014_alter_tblresponse_unique_together'),
    ]

    operations = [
        migrations.DeleteModel(
            name='TblResponse',
        ),
    ]