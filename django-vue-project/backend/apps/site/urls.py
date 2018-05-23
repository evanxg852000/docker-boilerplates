from django.contrib import admin
from django.urls import path
from django.views.generic import TemplateView

urlpatterns = [
    path('', TemplateView.as_view(template_name='home.html'), name='landing-page'),
    path('vue/', TemplateView.as_view(template_name='vue.html'), name='vue-page')
]
