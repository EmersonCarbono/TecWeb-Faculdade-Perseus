from django.shortcuts import render

from curriculo.models import Curso, GradeCurricular, Periodo

# Create your views here.
#   Curso
def curso(request, sigla):
    curso = Curso.objects.get(sigla = sigla.upper())
    grade =  GradeCurricular.objects.filter(curso = curso)
    
    periodo = {}
    for g in grade:
        periodo[g.semestre] = Periodo.objects.get(grade = g)
    
    disciplinas = {}
    for p in periodo.keys():
        disciplinas[p] = periodo[p].disciplinas.all()
            

    contexto = {
        'curso_obj': curso,
        'disciplinas': disciplinas
        }
    return render(request,'curso.html', contexto)

def lista_curso(request):
    contexto = {
        'cursos': Curso.objects.all,
    }
    return render(request, "listaCursos.html", contexto)