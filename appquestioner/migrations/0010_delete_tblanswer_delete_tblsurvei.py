# Generated by Django 4.2.4 on 2023-09-25 03:39

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('appquestioner', '0009_tblresponses'),
    ]

    operations = [
        migrations.DeleteModel(
            name='TblAnswer',
        ),
        migrations.DeleteModel(
            name='TblSurvei',
        ),
    ]
