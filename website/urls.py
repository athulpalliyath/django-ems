from django.urls import path 
from . import views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.index, name="index"),
    path('loginemployee/', views.loginemployee, name="loginemployee"),
    path('employeelogout/', views.employeelogout, name="employeelogout"),
    path('employeedetail/<emp_id>', views.employeedetail, name="employeedetail"),
    path('employeedashboard/<emp_id>', views.employeedashboard, name="employeedashboard"),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)