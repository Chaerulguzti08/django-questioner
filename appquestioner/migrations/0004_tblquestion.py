# Generated by Django 4.2.4 on 2023-09-20 04:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('appquestioner', '0003_alter_tblanswer_question_id'),
    ]

    operations = [
        migrations.CreateModel(
            name='TblQuestion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('project_id', models.IntegerField()),
                ('type', models.CharField(max_length=255)),
                ('question', models.CharField(max_length=255)),
                ('created_by', models.CharField(max_length=50)),
                ('updated_by', models.CharField(max_length=50)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'tbl_question',
            },
        ),
    ]
