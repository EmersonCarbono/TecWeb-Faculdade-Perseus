from django.shortcuts import render

from curriculo.models import Curso, GradeCurricular, Periodo

# Create your views here.
#   Curso
def curso(request, sigla):
    curso = Curso.objects.get(sigla = sigla.upper())
    grade =  GradeCurricular.objects.filter(curso = curso)
    periodo = Periodo.objects.get(grade = grade)
    disicplina = periodo.disciplinas.all()
    contexto = {
        'curso_obj': curso,
        'grade_obj': grade,
        'disciplinas': disicplina
        }
    return render(request,'curso.html', contexto)

def lista_curso(request):
    contexto = {
        'cursos': Curso.objects.all,
    }
    return render(request, "listaCursos.html", contexto)