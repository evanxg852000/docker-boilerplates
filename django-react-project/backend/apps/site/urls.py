from django.contrib import admin
from django.urls import path
from django.views.generic import TemplateView

urlpatterns = [
    path('', TemplateView.as_view(template_name='home.html'), name='landing-page'),
    path('react/', TemplateView.as_view(template_name='react.html'), name='react-page')
]
