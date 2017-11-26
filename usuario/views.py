from django.shortcuts import render
from django.contrib.auth.decorators import login_required, user_passes_test

from .models import Professor

# Create your views here.
def checa_aluno(user):
     return user.perfil == 'A'

@login_required(login_url='/entrar')
@user_passes_test(checa_aluno, login_url='/?error=acesso', redirect_field_name = None)
def area_aluno(request):
    return render(request, "areaAluno.html")

@login_required(login_url='/entrar')
@user_passes_test(checa_aluno, login_url='/?error=acesso', redirect_field_name = None)
def area_aluno_boletim(request):
    return render(request, "areaAlunoBoletim.html")

@login_required(login_url='/entrar')
@user_passes_test(checa_aluno, login_url='/?error=acesso', redirect_field_name = None)
def area_aluno_contato_professor(request):
    contexto = {
        'professores': Professor.objects.all()
    }
    return render(request, "areaAlunoContatoProfessor.html", contexto)

@login_required(login_url='/entrar')
@user_passes_test(checa_aluno, login_url='/?error=acesso', redirect_field_name = None)
def area_aluno_smart_class1(request):
    return render(request, "areaAlunoSmartClass1.html")

@login_required(login_url='/entrar')
@user_passes_test(checa_aluno, login_url='/?error=acesso', redirect_field_name = None)
def area_aluno_smart_class2(request):
    return render(request, "areaAlunoSmartClass2.html")

#Area Professor

def area_professor(request):
    return render(request, "areaProfessor.html")

def area_professor_boletim(request):
    return render(request, "areaProfessorBoletim.html")

def area_professor_contato_professor(request):
    contexto = {
        'professores': Professor.objects.all()
    }
    return render(request, "areaProfessorContatoProfessor.html", contexto)

def area_professor_smart_class1(request):
    return render(request, "areaProfessorSmartClass1.html")

def area_professor_smart_class2(request):
    return render(request, "areaProfessorSmartClass2.html")