# Generated by Django 4.2.4 on 2023-10-05 04:21

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('appquestioner', '0011_delete_tblresponses_alter_tblresponse_question_id_and_more'),
    ]

    operations = [
        migrations.DeleteModel(
            name='TblResponse',
        ),
    ]