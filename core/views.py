from django.shortcuts import render
from core.models import Noticia

# Create your views here.
def index(request):
    return render(request, "index.html")

def noticias(request):
    contexto = {
        'noticias': Noticia.objects.all,
    }
    return render(request, "noticias.html", contexto)

def noticia_post(request):
    return render(request, 'noticiaPost.html')


