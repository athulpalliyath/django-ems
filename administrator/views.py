from django.shortcuts import render,redirect
from django.contrib import messages
from django.contrib.auth.models import User, auth
from . models import Department, Slider,Employees 
from django.db.models import Q
import base64
import os

# Create your views here.

def login(request):
    if request.method=="POST":
        username=request.POST['email']
        password=request.POST['password']
        
        user=auth.authenticate(username=username,password=password,is_superuser=1)
        
        if user is not None:
            if user.is_superuser:
                auth.login(request,user)
                request.session['user']=user.username
                return redirect('admindashboardpage')
            else:
                messages.info(request,'Invalid Credentials')
                return redirect('login')
        else:
            messages.info(request,'Invalid Credentials')
            return redirect('login')
    else:
        return render(request,'login.html')
 
    
        
def admindashboard(request):
    if 'user' not in request.session:
        return redirect('login')
    dp_count = Department.objects.filter(dp_status='published').count()
    empactive_count = Employees.objects.filter(emp_status='active').count()
    totalemp_count = Employees.objects.filter(Q(emp_status='active') | Q(emp_status='exemp')).count()
    blockedemp_count = Employees.objects.filter(emp_status='blocked').count()
    men_count = Employees.objects.filter(Q(emp_gender='male') & Q(emp_status='active')).count()
    women_count = Employees.objects.filter(Q(emp_gender='female') & Q(emp_status='active')).count()
    return render(request,'admindashboard.html',{'women_count':women_count,'men_count':men_count,'blockedemp_count':blockedemp_count,'dp_count':dp_count,'empactive_count':empactive_count,'totalemp_count':totalemp_count})

def logout(request):
    auth.logout(request)
    request.session.flush()
    return redirect('login')

def department(request):
    if 'user' not in request.session:
        return redirect('login')
    department_details = Department.objects.all()
    return render(request,'department.html',{'department_details':department_details})
    

def adddepartment(request):
    if 'user' not in request.session:
        return redirect('login')
    department = Department()
    if request.method=="POST":
        dpmnt_name=request.POST['department']
        status=request.POST['status']
        if Department.objects.filter(dp_name=dpmnt_name).exists():
            messages.info(request,'Department Already Exist')
            return render(request,'adddepartment.html')
        else:
            department.dp_name=dpmnt_name
            department.dp_status=status
            department.save()
            messages.info(request,'Department Successfully Added')
            return redirect('department')
    else:
        return render(request,'adddepartment.html')
    

def editdepartment(request, department_id):
    if 'user' not in request.session:
        return redirect('login')
    department=Department.objects.get(pk=department_id)
    if request.method=="POST":
        department.dp_name = request.POST['department']
        department.dp_status=request.POST['status']
        department.save()
        messages.info(request,'Department Successfully Updated')
        return redirect('department')
        # return render(request,'department.html')
    
    return render(request,'editdepartment.html',{'department':department})

def deletedepartment(request, department_id):
    if 'user' not in request.session:
        return redirect('login')
    department = Department.objects.get(pk = department_id)
    department.delete()
    messages.info(request,'Department Successfully Deleted')
    return redirect('department')

def homeslider(request):
    if 'user' not in request.session:
        return redirect('login')
    slider_details = Slider.objects.all()
    return render(request,'homeslider.html',{'slider_details':slider_details})

def addslider(request):
    if 'user' not in request.session:
        return redirect('login')
    slider = Slider()
    if request.method=="POST":
        status=request.POST['status']
        if len(request.FILES) != 0:
            slider.slider_img=request.FILES['sliderimg']
        slider.slider_status=status
        slider.save()
        messages.info(request,'Slider Successfully Added')
        return redirect('homeslider')
    else:
        return render(request,'addslider.html')
    

def editslider(request, slider_id):
    if 'user' not in request.session:
        return redirect('login')
    slider=Slider.objects.get(pk=slider_id)
    if request.method=="POST":
        if len(request.FILES) != 0:
            if len(slider.slider_img)>0:
                os.remove(slider.slider_img.path)
            slider.slider_img=request.FILES['sliderimg']
        slider.slider_status=request.POST['status']
        slider.save()
        messages.info(request,'Slider Successfully Updated')
        return redirect('homeslider')
        # return render(request,'department.html')
    
    return render(request,'editslider.html',{'slider':slider})

def deleteslider(request, slider_id):
    if 'user' not in request.session:
        return redirect('login')
    slider = Slider.objects.get(pk = slider_id)
    if len(slider.slider_img)>0:
                os.remove(slider.slider_img.path)
    slider.delete()
    messages.info(request,'Slider Successfully Deleted')
    return redirect('homeslider')

def employee(request):
    if 'user' not in request.session:
        return redirect('login')
    employe_details = Employees.objects.all().order_by('emp_status')
    return render(request,'employee.html',{'employe_details':employe_details})

def addemployee(request):
    if 'user' not in request.session:
        return redirect('login')
    emp = Employees()
    if request.method=='POST':
        empemail=request.POST['empemail']
        if Employees.objects.filter(emp_email=empemail).exists():
            messages.info(request,'Email ID Already Exist')
            return redirect('addemployee')
        else:
            empname=request.POST['empname']
            empemail=request.POST['empemail']
            empnumber=request.POST['empnumber']
            empdepartment=request.POST['empdepartment']
            empdesignation=request.POST['empdesignation']
            gender=request.POST['gender']
            empdate=request.POST['empdate']
            emppassword=request.POST['emppassword']
            empstatus=request.POST['empstatus']
            empaddress=request.POST['empaddress']
            if len(request.FILES) != 0:
                emp.emp_img=request.FILES['empimg']
            emp.emp_name=empname
            emp.emp_email=empemail
            emp.emp_number=empnumber
            emp.emp_department=empdepartment
            emp.emp_designation=empdesignation
            emp.emp_gender=gender
            emp.joined_date=empdate
            emp.emp_status=empstatus
            emp.emp_address=empaddress
            emp.save()
            emplatest_id=emp.id
            emp.emp_id = emplatest_id 
            emp.save()
            user = User.objects.create_user(username=empemail,password=emppassword,email=empemail)
            user.save()
            messages.info(request,'Employee Successfully Added')
            return redirect('employee')
    department=Department.objects.filter(dp_status='published')
    return render(request,'addemployee.html',{'department':department})

def editemployee(request, emp_id):
    if 'user' not in request.session:
        return redirect('login')
    emp = Employees.objects.get(pk=emp_id)
    email=emp.emp_email
    department=Department.objects.filter(dp_status='published')
    user = User.objects.get(username=email)
    if request.method=="POST":
        empemail=request.POST['empemail']
        if Employees.objects.filter(~Q(id=emp_id),emp_email=empemail).exists():
            messages.info(request,'Email ID Already Exist')
            return redirect('employee')
        else : 
            if len(request.FILES) != 0:
                if len(emp.emp_img)>0:
                    os.remove(emp.emp_img.path)
                emp.emp_img=request.FILES['empimg']
            emp.emp_name=request.POST['empname']
            emp.emp_email=request.POST['empemail']
            emp.emp_number=request.POST['empnumber']
            emp.emp_department=request.POST['empdepartment']
            emp.emp_designation=request.POST['empdesignation']
            emp.emp_gender=request.POST['gender']
            emp.joined_date=request.POST['empdate']
            emp.emp_status=request.POST['empstatus']
            emp.emp_address=request.POST['empaddress']
            if request.POST['emppassword'] != '':
                user.set_password(request.POST['emppassword'])
            user.username=request.POST['empemail']
            user.email=request.POST['empemail']
            emp.save()
            user.save()
            messages.info(request,'Employee Successfully Updated')
            return redirect('employee')
    return render(request,'editemployee.html',{'employee':emp,'department':department,'user':user})

def deleteemployee(request, emp_id):
    if 'user' not in request.session:
        return redirect('login')
    emp = Employees.objects.get(pk = emp_id)
    email=emp.emp_email
    user = User.objects.get(username = email)
    if len(emp.emp_img)>0:
                os.remove(emp.emp_img.path)
    emp.delete()
    user.delete()
    messages.info(request,'Employee Successfully Deleted')
    return redirect('employee')

