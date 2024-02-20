from django.db import models

class TblQuestion(models.Model):
    project_id = models.IntegerField()
    type = models.CharField(max_length=255)
    question = models.CharField(max_length=255)
    created_by = models.CharField(max_length=50)
    updated_by = models.CharField(max_length=50)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'tbl_question'

class TblAnswers(models.Model):
    question_id = models.IntegerField()
    answer = models.CharField(max_length=250)
    correct = models.CharField(max_length=250)
    created_by = models.CharField(max_length=50)
    updated_by = models.CharField(max_length=50)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    class Meta:
        db_table = 'tbl_answers'

class TblProject(models.Model):
    name = models.CharField(max_length=250)
    location = models.CharField(max_length=250)
    date = models.DateField()
    created_by = models.CharField(max_length=50)
    updated_by = models.CharField(max_length=50)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    class Meta:
        db_table = 'tbl_project'

class TblRespondent(models.Model):
    name = models.CharField(max_length=250)
    phone_number = models.CharField(max_length=250)
    email = models.CharField(max_length=50)
    froms = models.CharField(max_length=50)

    class Meta:
        db_table = 'tbl_respondents'

class TblResponse(models.Model):
    question_id = models.IntegerField()
    respondent_id = models.IntegerField()
    answer_id = models.IntegerField()
    answer = models.TextField()

    class Meta:
        db_table = 'tbl_response'
        unique_together = ('question_id', 'respondent_id')


