from administrator.views import department
from django.shortcuts import redirect, render
from administrator.models import Department, Slider,Employees
from .models import Skills
from django.contrib.auth.models import User, auth
from django.contrib import messages


# Create your views here.

def index(request):
    if 'useremail' not in request.session: 
        slider = Slider.objects.filter(slider_status='published')
        emp = Employees.objects.filter(emp_status='active')
        return render(request,'index.html',{'slider':slider,'employee':emp})
    else :
        username=request.session['useremail']
        emp=Employees.objects.get(emp_email=username)
        empname=emp.emp_name
        empdepartment=emp.emp_department
        empid=emp.id
        slider = Slider.objects.filter(slider_status='published')
        emps = Employees.objects.filter(emp_status='active',emp_department=empdepartment)
        department=Department.objects.get(id=empdepartment)
        dp_name=department.dp_name
        return render(request,'index.html',{'empid':empid,'empname':empname,'slider':slider,'employee':emps,'dp_name':dp_name})


def loginemployee(request):
    if request.method=="POST":
        username=request.POST['email']
        password=request.POST['password']
        user=auth.authenticate(username=username,password=password,is_superuser='0')
        
        if user is not None:
            if user.is_superuser:
                messages.info(request,'Invalid Credentials')
                return redirect('loginemployee')
            else:
                auth.login(request,user)
                request.session['useremail']=user.username
                emp=Employees.objects.get(emp_email=username)
                empname=emp.emp_name
                empdepartment=emp.emp_department
                empid=emp.id
                slider = Slider.objects.filter(slider_status='published')
                emps = Employees.objects.filter(emp_status='active',emp_department=empdepartment)
                department=Department.objects.get(id=empdepartment)
                dp_name=department.dp_name
                return render(request,'index.html',{'empid':empid,'empname':empname,'slider':slider,'employee':emps,'dp_name':dp_name})
        else:
            messages.info(request,'Invalid Credentials')
            return redirect('loginemployee')
    else:
        return render(request,'loginemployee.html')

def employeelogout(request):
    auth.logout(request)
    request.session.flush()
    return redirect('index')

def employeedetail(request,emp_id):
    if 'useremail' not in request.session:
        emp = Employees.objects.get(pk=emp_id)
        empdepartment=emp.emp_department
        department=Department.objects.get(id=empdepartment)
        dp_name=department.dp_name
        return render(request,'employeedetail.html',{'employee':emp,'dp_name':dp_name})
    else :
        username=request.session['useremail']
        emp=Employees.objects.get(emp_email=username)
        empname=emp.emp_name
        empid=emp.id
        emps = Employees.objects.get(id=emp_id)
        empdepartment=emps.emp_department
        department=Department.objects.get(id=empdepartment)
        dp_name=department.dp_name
        return render(request,'employeedetail.html',{'empid':empid,'empname':empname,'employee':emps,'dp_name':dp_name})

def employeedashboard(request,emp_id):
    if 'useremail' not in request.session:
        return redirect('index')
    else:
        username=request.session['useremail']
        emp=Employees.objects.get(emp_email=username)
        empname=emp.emp_name
        empid=emp.id
        emps = Employees.objects.get(id=emp_id)
        empdepartment=emps.emp_department
        department=Department.objects.get(id=empdepartment)
        dp_name=department.dp_name
        labels = []
        data = []
    
        queryset = Skills.objects.filter(employee_id=empid).order_by('-id')[:9]
        for item in queryset:
            labels.append(item.skill)
            data.append(item.rating)
    
        mgender = Employees.objects.filter(emp_department=empdepartment,emp_gender='male',emp_status='active').count()
        fgender = Employees.objects.filter(emp_department=empdepartment,emp_gender='female',emp_status='active').count()
        
        
        if request.method=="POST":
            skill=Skills()
            skill.skill=request.POST['skill']
            skill.rating=request.POST['rate']
            skill.employee_id=emp.id
            skill.save()
            messages.info(request,'Skill Successfully Added, scroll down to see the skill set graphical representation')
            return redirect('employeedashboard',emp_id=empid)

        return render(request,'employeedashboard.html',{'empid':empid,'empname':empname,'employee':emps,'dp_name':dp_name,'labels': labels,
        'data': data,'mcount': mgender,'fcount': fgender})


