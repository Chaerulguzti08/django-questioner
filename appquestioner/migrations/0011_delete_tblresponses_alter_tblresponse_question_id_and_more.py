# Generated by Django 4.2.4 on 2023-09-25 03:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('appquestioner', '0010_delete_tblanswer_delete_tblsurvei'),
    ]

    operations = [
        migrations.DeleteModel(
            name='TblResponses',
        ),
        migrations.AlterField(
            model_name='tblresponse',
            name='question_id',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='tblresponse',
            name='respondent_id',
            field=models.IntegerField(),
        ),
    ]
