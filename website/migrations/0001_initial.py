# Generated by Django 3.2.7 on 2021-09-11 14:40

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Skills',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('employee_id', models.IntegerField()),
                ('skill', models.CharField(max_length=255)),
                ('rating', models.CharField(max_length=50)),
            ],
        ),
    ]