from administrator.views import employee
from django.db import models

# Create your models here.

class Skills(models.Model):
    id = models.AutoField(primary_key=True)
    employee_id=models.IntegerField()
    skill = models.CharField(max_length=255)
    rating = models.CharField(max_length=50)

