from django.shortcuts import render
from .models import Noticia

# Create your views here.
def index(request):
    return render(request, "index.html")

def noticias(request):
    contexto = {
        'noticias': Noticia.objects.all,
    }
    return render(request, "noticias.html", contexto)

def noticia_post(request, titulo):
    noticia = Noticia.objects.get(titulo = titulo.upper())
    contexto = {
        'noticia': noticia,
    }
    return render(request, 'noticiaPost.html', contexto)


