import json
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views import View
from .models import Empresa, Candidato
from .forms import CandidatoForm, EmpresaForm, OfertaDeEmpleoForm, PerfilBaseForm


class CompletarPerfilBaseView(View):
    @method_decorator(login_required)
    def get(self, request):
        perfil = Empresa.objects.filter(user=request.user).first() or Candidato.objects.filter(user=request.user).first()
        initial_data = {}
        if perfil:
            initial_data = {
                "telefono": perfil.telefono,
                "direccion": perfil.direccion,
                "linkedin": perfil.linkedin,
                "foto": perfil.foto,
                "tipo_usuario": perfil.tipo_usuario,
            }
        form = PerfilBaseForm(initial=initial_data)
        return render(request, "perfil/completar_perfil_base.html", {"form": form})

    @method_decorator(login_required)
    def post(self, request):
        form = PerfilBaseForm(request.POST, request.FILES)
        if form.is_valid():
            tipo_usuario = form.cleaned_data["tipo_usuario"]

            
            if tipo_usuario == "empresa":
                perfil, created = Empresa.objects.get_or_create(user=request.user)
            else:
                perfil, created = Candidato.objects.get_or_create(user=request.user)

            perfil.telefono = form.cleaned_data["telefono"]
            perfil.direccion = form.cleaned_data["direccion"]
            perfil.linkedin = form.cleaned_data["linkedin"]
            perfil.foto = form.cleaned_data["foto"]
            perfil.tipo_usuario = tipo_usuario
            perfil.save()

            
            if tipo_usuario == "empresa":
                return redirect("completar_datos_empresa")
            else:
                return redirect("completar_datos_candidato")

        return render(request, "perfil/completar_perfil_base.html", {"form": form})

""" def redireccionar_despues_login(request):
    if not Empresa.objects.filter(user=request.user).exists() and not Candidato.objects.filter(user=request.user).exists():
        return redirect("completar_perfil_base") 
    return redirect("/")  """

def redireccionar_despues_login(request):
    if Empresa.objects.filter(user=request.user).exists():
        return redirect("ver_perfil_empresa")  
    elif Candidato.objects.filter(user=request.user).exists():
        return redirect("completar_perfil_base") 
    return redirect("completar_perfil_base")  

class CompletarDatosEmpresaView(View):
    @method_decorator(login_required)
    def get(self, request):
        perfil = Empresa.objects.filter(user=request.user).first()
        if not perfil:
            return redirect("completar_perfil_base") 
        form = EmpresaForm(instance=perfil)
        return render(request, "perfil/completar_datos_empresa.html", {"form": form})

    @method_decorator(login_required)
    def post(self, request):
        perfil = Empresa.objects.filter(user=request.user).first()
        if not perfil:
            return redirect("completar_perfil_base")
        form = EmpresaForm(request.POST, request.FILES, instance=perfil)
        if form.is_valid():
            form.save()
            return redirect("/") 
        return render(request, "perfil/completar_datos_empresa.html", {"form": form})


class CompletarDatosCandidatoView(View):
    @method_decorator(login_required)
    def get(self, request):
        perfil = Candidato.objects.filter(user=request.user).first()
        if not perfil:
            return redirect("completar_perfil_base")  
        form = CandidatoForm(instance=perfil)
        return render(request, "perfil/completar_datos_candidato.html", {"form": form})

    @method_decorator(login_required)
    def post(self, request):
        perfil = Candidato.objects.filter(user=request.user).first()
        if not perfil:
            return redirect("completar_perfil_base")
        form = CandidatoForm(request.POST, request.FILES, instance=perfil)
        if form.is_valid():
            form.save()
            return redirect("/")  
        return render(request, "perfil/completar_datos_candidato.html", {"form": form})
    
class VerPerfilEmpresaView(View):
    @method_decorator(login_required)
    def get(self, request):
        perfil = Empresa.objects.filter(user=request.user).first()
        if not perfil:
            return redirect("completar_perfil_base")  

        context = {
            "perfil": perfil,
        }
        return render(request, "perfil/ver_perfil_empresa.html", context)
    
class CrearOfertaView(View):
    @method_decorator(login_required)
    def get(self, request):
        form = OfertaDeEmpleoForm()
        return render(request, "ofertas/crear_oferta.html", {"form": form})

    @method_decorator(login_required)
    def post(self, request):
        empresa = Empresa.objects.filter(user=request.user).first()
        if not empresa:
            return redirect("completar_perfil_base") 

        form = OfertaDeEmpleoForm(request.POST)
        if form.is_valid():
            oferta = form.save(commit=False)
            oferta.empresa = empresa 

            requisitos_json = request.POST.get('requisitos', '[]')
            try:
                requisitos_lista = json.loads(requisitos_json)  
                oferta.requisitos = requisitos_lista  
            except json.JSONDecodeError:
                oferta.requisitos = []  

            oferta.save()
            form.save_m2m() 
            return redirect("ver_perfil_empresa")

        return render(request, "ofertas/crear_oferta.html", {"form": form})



