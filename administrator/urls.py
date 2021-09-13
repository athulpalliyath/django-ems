
from django.urls import path 
from . import views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.login, name="login"),
    path('admindashboard/', views.admindashboard, name="admindashboardpage"),
    path('logout/', views.logout, name="logout"),
    path('department/', views.department, name="department"),
    path('adddepartment/', views.adddepartment, name="adddepartment"),
    path('editdepartment/<department_id>', views.editdepartment, name="editdepartment"),
    path('deletedepartment/<department_id>', views.deletedepartment, name="deletedepartment"),
    path('homeslider/', views.homeslider, name="homeslider"),
    path('addslider/', views.addslider, name="addslider"),
    path('editslider/<slider_id>', views.editslider, name="editslider"),
    path('deleteslider/<slider_id>', views.deleteslider, name="deleteslider"),
    path('employee/', views.employee, name="employee"),
    path('addemployee/', views.addemployee, name="addemployee"),
    path('editemployee/<emp_id>', views.editemployee, name="editemployee"),
    path('deleteemployee/<emp_id>', views.deleteemployee, name="deleteemployee"),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
