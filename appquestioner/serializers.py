from rest_framework import serializers
from .models import TblQuestion, TblProject, TblRespondent

class QuestionSerializer(serializers.ModelSerializer):
    project_name = serializers.SerializerMethodField()

    def get_project_name(self, obj):
        project_id = obj.project_id
        try:
            project = TblProject.objects.get(id=project_id)
            return project.name
        except TblProject.DoesNotExist:
            return None
    class Meta:
        model = TblQuestion
        fields = '__all__'

class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = TblProject
        fields = '__all__'

class RespondentSerializer(serializers.ModelSerializer):
    class Meta:
        model = TblRespondent
        fields = '__all__'

