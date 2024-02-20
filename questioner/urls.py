"""
URL configuration for survei project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from appquestioner.views import index_view, SurveiViews, ResponseGet, AnswerViews, QuestionerViewsDetails, ProjectViews, questionerViews, RespondentViews, ResponseViews, questionPostViews, ProjectPostViews, ProjectDetailsViews, CheckEmail, RespondentGet, ProjectDeleteViews, ProjectPutView, QuestionDeleteViews, QuestionPutView

urlpatterns = [
    path('', index_view, name='index'),
    path('admin/', admin.site.urls),
    path('api/answer/', AnswerViews.as_view()),
    path('api/response/', ResponseViews.as_view()),
    path('api/survei/', SurveiViews.as_view()),
    path('api/question/', questionPostViews.as_view()),
    path('api/question/<int:id>/', questionerViews.as_view()),
    path('api/question/detail/<int:id>/', QuestionerViewsDetails.as_view()),
    path('api/question/edit/<int:id>/', QuestionPutView.as_view()),
    path('api/question/delete/<int:id>/', QuestionDeleteViews.as_view()),
    path('api/project/', ProjectViews.as_view()),
    path('api/project/<int:id>/', ProjectDetailsViews.as_view()),
    path('api/project/edit/<int:id>/', ProjectPutView.as_view()),
    path('api/project/delete/<int:id>/', ProjectDeleteViews.as_view()),
    path('api/project/post/', ProjectPostViews.as_view()),
    path('api/survei/edit/<int:id>/', SurveiViews.as_view()),
    path('api/respondents/', RespondentViews.as_view()),
    path('api/respondents-get/', RespondentGet.as_view()),
    path('api/checkEmail/', CheckEmail.as_view()),
    path('api/responseGet/', ResponseGet.as_view()),
]
