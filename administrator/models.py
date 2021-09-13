from django.db import models
import datetime
import os
from django.core.validators import RegexValidator

# Create your models here.

def filepath(request, filename):
    old_filename = filename
    timeNow = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')
    filename = "%s%s" % (timeNow, old_filename)
    return os.path.join('uploads/', filename)

class Login(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=255)
    password = models.CharField(max_length=50)
    role = models.CharField(max_length=50)

class Department(models.Model):
    id = models.AutoField(primary_key=True)
    dp_name = models.CharField(max_length=255)
    dp_status= models.CharField(max_length=50)

class Employees(models.Model):
    id = models.AutoField(primary_key=True)
    emp_id = models.CharField(max_length=255)
    emp_name = models.CharField(max_length=255)
    emp_email = models.CharField(max_length=255)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
    emp_number = models.CharField(validators=[phone_regex], max_length=17, blank=True) 
    emp_department = models.IntegerField()
    emp_designation = models.CharField(max_length=255)
    emp_gender = models.CharField(max_length=50)
    joined_date = models.DateField(max_length=50)
    emp_password = models.CharField(max_length=50)
    emp_img = models.ImageField(upload_to=filepath, null=True, blank=True)
    emp_status= models.CharField(max_length=50)
    emp_address= models.CharField(max_length=500)

class Slider(models.Model):
    id = models.AutoField(primary_key=True)
    # slider_img = models.BinaryField(blank=True)
    slider_img = models.ImageField(upload_to=filepath, null=True, blank=True)
    slider_status= models.CharField(max_length=50)


