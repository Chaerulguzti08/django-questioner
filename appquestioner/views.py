from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import TblQuestion, TblAnswers, TblProject, TblRespondent, TblResponse
from .serializers import QuestionSerializer, ProjectSerializer, RespondentSerializer
import requests
import psycopg2
import mysql.connector
import re
import uuid
import os
from django.conf import settings
from django.utils import timezone
import json

def index_view(request):
    return render(request, 'index.html')

# Start Project View
class ProjectViews(APIView):
    def get(self, request):
        api_keys = TblProject.objects.all()

        if not api_keys.exists():
            response_data = {
                "success": True,
                "message": "success",
                "data": [
                    {
                        "feedback": "N"
                    }
                ]
            }
            return Response(response_data)
        
        serializer = ProjectSerializer(api_keys, many=True)
        response_data = {
            "Success": True,
            "Message": "success",
            "data": serializer.data
        }
        return Response(response_data)

class ProjectDetailsViews(APIView):
    def get(self, request, id):
        api_keys = TblProject.objects.filter(id=id)

        if not api_keys.exists():
            response_data = {
                "success": True,
                "message": "success",
                "data": [
                    {
                        "feedback": "N"
                    }
                ]
            }
            return Response(response_data)
        
        serializer = ProjectSerializer(api_keys, many=True)
        response_data = {
            "Success": True,
            "Message": "success",
            "data": serializer.data
        }
        return Response(response_data)
    
class ProjectPostViews(APIView):
    def post(self, request):
        name = request.data.get('name')
        location = request.data.get('location')
        date = request.data.get('date')
        error_messages = {}
        
        if not location:
            error_messages['location'] = 'location is required.'
        if not name:
            error_messages['name'] = 'name is required.'
        if not date:
            error_messages['date'] = 'date is required.'

        if not error_messages:
            current_timestamp = timezone.now()
            formatted_timestamp = current_timestamp.strftime("%Y-%m-%d %H:%M:%S")

            new_answer = TblProject.objects.create(name=name, location=location, date=date, created_by="admin", updated_by = "admin", created_at = formatted_timestamp,  updated_at = formatted_timestamp)
            response_data = {
                "name": name,
                "location": location,
                "date": date,
                "created_by": "admin",
                "updated_by": "admin",
            }
            
            return Response(response_data)
        else:
            response_data = {
                "success": False,
                "message": "Failed",
                "data": error_messages
            }
            return Response(response_data)
        
class ProjectPutView(APIView):
    def put(self, request, id):
        name = request.data.get('name')
        location = request.data.get('location')
        date = request.data.get('date')
        error_messages = {}
        
        if not location:
            error_messages['location'] = 'location is required.'
        if not name:
            error_messages['name'] = 'name is required.'
        if not date:
            error_messages['date'] = 'date is required.'

        if not error_messages:
            current_timestamp = timezone.now()
            formatted_timestamp = current_timestamp.strftime("%Y-%m-%d %H:%M:%S")

            try:
                item = TblProject.objects.get(id=id)
                item.name = name
                item.location = location
                item.date = date
                item.updated_at = formatted_timestamp
                item.save()

                response_data = {
                    "id": item.id,
                    "name": item.name,
                    "location": item.location,
                    "date": item.date,
                    "created_by": item.created_by,
                    "updated_by": "admin",
                }
                return Response(response_data)
            except TblProject.DoesNotExist:
                response_data = {
                    "success": False,
                    "message": "Item not found.",
                    "data": {}
                }
                return Response(response_data, status=404)
        else:
            response_data = {
                "success": False,
                "message": "Failed",
                "data": error_messages
            }
            return Response(response_data)
        
class ProjectDeleteViews(APIView):
    def delete(self, request, id):
        TblProject.objects.filter(id = id).delete()

        response_data = {
            "success": True,
            "message": "Delete Data successfully",
        }
        return Response(response_data, status=200)
    

#   End Project View

# Start Questioner View    
class questionerViews(APIView):
    def get(self, request, id):
        api_keys = TblQuestion.objects.filter(project_id=id)

        if not api_keys.exists():
            response_data = {
                "success": True,
                "message": "success",
                "data": [
                    {
                        "feedback": "N"
                    }
                ]
            }
            return Response(response_data)
        
        serializer = QuestionSerializer(api_keys, many=True)
        response_data = {
            "Success": True,
            "Message": "success",
            "data": serializer.data
        }
        return Response(response_data)
        
class SurveiViews(APIView):
    def get(self, request):
        api_keys = TblQuestion.objects.all()

        if not api_keys.exists():
            response_data = {
                "success": True,
                "message": "success",
                "data": [
                    {
                        "feedback": "N"
                    }
                ]
            }
            return Response(response_data)
        
        serializer = QuestionSerializer(api_keys, many=True)
        response_data = {
            "Success": True,
            "Message": "success",
            "data": serializer.data
        }
        return Response(response_data)

class QuestionerViewsDetails(APIView):
    def get(self, request, id):
        api_keys = TblQuestion.objects.filter(id=id)

        if not api_keys.exists():
            response_data = {
                "success": True,
                "message": "success",
                "data": [
                    {
                        "feedback": "N"
                    }
                ]
            }
            return Response(response_data)
        
        serializer = QuestionSerializer(api_keys, many=True)
        response_data = {
            "Success": True,
            "Message": "success",
            "data": serializer.data
        }
        return Response(response_data)
    
class questionPostViews(APIView):
    def post(self, request):
        project_id = request.data.get('project_id')
        type = request.data.get('type')
        question = request.data.get('question')
        error_messages = {}
        
        if not type:
            error_messages['type'] = 'type is required.'
        if not project_id:
            error_messages['project_id'] = 'project_id is required.'
        if not question:
            error_messages['question'] = 'question is required.'

        if not error_messages:
            current_timestamp = timezone.now()
            formatted_timestamp = current_timestamp.strftime("%Y-%m-%d %H:%M:%S")

            new_answer = TblQuestion.objects.create(project_id=project_id, type=type, question=question, created_by="admin", updated_by = "admin", created_at = formatted_timestamp,  updated_at = formatted_timestamp)
            response_data = {
                "project_id": project_id,
                "type": type,
                "question": question,
                "created_by": "admin",
                "updated_by": "admin",
            }
            
            return Response(response_data)
        else:
            response_data = {
                "success": False,
                "message": "Failed",
                "data": error_messages
            }
            return Response(response_data)

class QuestionPutView(APIView):
    def put(self, request, id):
        project_id = request.data.get('project_id')
        type = request.data.get('type')
        question = request.data.get('question')
        error_messages = {}
        
        if not question:
            error_messages['question'] = 'question is required.'
        if not type:
            error_messages['type'] = 'type is required.'
        if not project_id:
            error_messages['project_id'] = 'project_id is required.'

        if not error_messages:
            current_timestamp = timezone.now()
            formatted_timestamp = current_timestamp.strftime("%Y-%m-%d %H:%M:%S")

            try:
                item = TblQuestion.objects.get(id=id)
                item.project_id = project_id
                item.type = type
                item.question = question
                item.updated_at = formatted_timestamp
                item.save()

                response_data = {
                    "id": item.id,
                    "project_id": item.project_id,
                    "type": item.type,
                    "question": item.question,
                    "created_by": item.created_by,
                    "updated_by": "admin",
                }
                return Response(response_data)
            except TblProject.DoesNotExist:
                response_data = {
                    "success": False,
                    "message": "Item not found.",
                    "data": {}
                }
                return Response(response_data, status=404)
        else:
            response_data = {
                "success": False,
                "message": "Failed",
                "data": error_messages
            }
            return Response(response_data)
        
class QuestionDeleteViews(APIView):
    def delete(self, request, id):
        TblQuestion.objects.filter(id = id).delete()

        response_data = {
            "success": True,
            "message": "Delete Data successfully",
        }
        return Response(response_data, status=200)
        
# End Questioner View

class CheckEmail(APIView):
    def post(self, request):
        question_id = request.data.get('question_id')
        email = request.data.get('email')
        # try:
        cek_email = TblRespondent.objects.filter(email=email)
        data = []
        for email in cek_email:
            cek_response = TblResponse.objects.filter(respondent_id = email.id)
            for ques in cek_response:
                data.append({
                    "email": ques.question_id
                }) 

        if any(entry["email"] == int(question_id) for entry in data):
            result = True
        else:
            result = False
        return Response(result)
        # is_present = any(entry["email"] == int(question_id) for entry in data)
        # return Response(is_present)

class ResponseViews(APIView):
    def post(self, request):
        question_id = request.data.get('question_id')
        respondent_id = request.data.get('respondent_id')
        answer_id = request.data.get('answer_id')
        answer = request.data.get('answer')
        error_messages = {}
        
        if not question_id:
            error_messages['question_id'] = 'question_id is required.'
        if not respondent_id:
            error_messages['respondent_id'] = 'respondent_id is required.'
        if not answer_id:
            error_messages['answer_id'] = 'answer_id is required.'

        if not error_messages:
            new_respondent = TblResponse.objects.create(question_id=question_id, respondent_id=respondent_id, answer_id=answer_id, answer = answer)
            response_data = {
                "question_id": question_id,
                "respondent_id": respondent_id,
                "answer_id": answer_id,
                "answer": answer,
                
            }
            return Response(response_data)
        else:
            response_data = {
                "success": False,
                "message": "Failed",
                "data": error_messages
            }
            return Response(response_data)
        
class RespondentViews(APIView):
    def post(self, request):
        name = request.data.get('name')
        phone_number = request.data.get('phone_number')
        email = request.data.get('email')
        froms = request.data.get('froms')
        error_messages = {}
        
        if not phone_number:
            error_messages['phone_number'] = 'phone_number is required.'
        if not name:
            error_messages['name'] = 'name is required.'
        if not email:
            error_messages['email'] = 'email is required.'
        if not froms:
            error_messages['froms'] = 'froms is required.'

        if not error_messages:
            new_respondent = TblRespondent.objects.create(name=name, phone_number=phone_number, email=email, froms = froms)
            new_respondent_id = new_respondent.id
            response_data = {
                "id": new_respondent_id,
                "name": name,
                "phone_number": phone_number,
                "email": email,
                "froms": froms,
                
            }
            return Response(response_data)
        else:
            response_data = {
                "success": False,
                "message": "Failed",
                "data": error_messages
            }
            return Response(response_data)
class RespondentGet(APIView):
    def get(self, request):
        api_keys = TblRespondent.objects.all()

        if not api_keys.exists():
            response_data = {
                "success": True,
                "message": "success",
                "data": [
                    {
                        "feedback": "N"
                    }
                ]
            }
            return Response(response_data)
        
        serializer = RespondentSerializer(api_keys, many=True)
        response_data = {
            "Success": True,
            "Message": "success",
            "data": serializer.data
        }
        return Response(response_data)
    
class AnswerViews(APIView):
    def post(self, request):
        question_id = request.data.get('question_id')
        answer = request.data.get('answer')
        error_messages = {}
        
        if not answer:
            error_messages['answer'] = 'answer is required.'
        if not question_id:
            error_messages['question_id'] = 'question_id is required.'

        if not error_messages:
            current_timestamp = timezone.now()
            formatted_timestamp = current_timestamp.strftime("%Y-%m-%d %H:%M:%S")

            new_answer = TblAnswers.objects.create(question_id=question_id, answer=answer, created_by="admin", updated_by = "admin", created_at = formatted_timestamp,  updated_at = formatted_timestamp)
            new_answer_id = new_answer.id
            response_data = {
                "id": new_answer_id,
                "question_id": question_id,
                "answer": answer,
                "created_by": "admin",
                "updated_by": "admin",
            }
            
            return Response(response_data)
        else:
            response_data = {
                "success": False,
                "message": "Failed",
                "data": error_messages
            }
            return Response(response_data)
        

class ResponseGet(APIView):
    def get(self, request):
        conn = mysql.connector.connect(
            host='localhost',
            port='3306',
            database='db_questioner',
            user='root',
            password='',
        )

        # Melakukan proses select dari tabel TblType pada database yang terkait
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM tbl_project')
        result = cursor.fetchall()
        
        if result:
            data = []
            for row in result:
                cursor.execute('''
                SELECT * FROM tbl_question WHERE project_id = %s;
                ''', (row[0],))
                result_image = cursor.fetchall()
                data_question = []
                for row_image in result_image:

                    cursor.execute('''
                    SELECT COUNT(*) FROM tbl_answers WHERE question_id = %s AND answer = %s;
                    ''', (row_image[0], "Tidak"))
                    count_result = cursor.fetchone()
                    total_count_no = count_result[0]

                    cursor.execute('''
                    SELECT COUNT(*) FROM tbl_answers WHERE question_id = %s AND answer = %s;
                    ''', (row_image[0], "Ya"))
                    count_result = cursor.fetchone()
                    total_count_ya = count_result[0]
                    
                    cursor.execute('''
                    SELECT * FROM tbl_answers WHERE question_id = %s;
                    ''', (row_image[0],))
                    result_image = cursor.fetchall()
                    data_project = []
                    for row_project in result_image:
                        data_project.append({
                            "question_id" : row_project[0],
                            "answer_id" : row_project[1],
                            "answer": row_project[2],
                        })

                    data_question.append({
                        "question_id" : row_image[0],
                        "question_name" : row_image[3],
                        "answer_tidak" : total_count_no,
                        "answer_ya": total_count_ya,
                        "data_response": data_project,
                    })

                # cursor.execute('''
                # SELECT * FROM tbl_answer WHERE question_id = %s;
                # ''', (row[2],))
                # result_image = cursor.fetchall()
                # data_respondent = []
                # for row_respondent in result_image:
                #     data_respondent.append({
                #         "id" : row_respondent[0],
                #         "name" : row_respondent[1],
                #         "phone_number": row_respondent[2],
                #         "email": row_respondent[3],
                #     })

                # cursor.execute('''
                # SELECT * FROM tbl_question WHERE project_id = %s;
                # ''', (row[0],))
                # result_image = cursor.fetchall()
                # data_questioner = []
                # for row_respondent in result_image:
                #     data_questioner.append({
                #         "question_id" : row_respondent[0],
                #         "question_name" : row_respondent[1],
                #     })
                    

                data.append({
                    "project_id" : row[0],
                    "project_name": row[1],
                    'data_questioner': data_question,

                })

            response_data = {
                "success": True,
                "message": "Data retrieved successfully",
                "data": data
            }
            return Response(response_data, status=200)
        else:
            response_data = {
                "success": True,
                "message": "Failed",
                "data": "data not found",
            }
            return Response(response_data, status=404)
