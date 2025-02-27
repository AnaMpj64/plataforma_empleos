import json
import random
import requests
from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render, redirect
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views import View
from django.views.generic import DetailView, ListView
from django.views.decorators.csrf import csrf_exempt
from .models import Empresa, Candidato, OfertaDeEmpleo, SolicitudDeEmpleo, CriterioInclusión
from .forms import CandidatoForm, CompletarDatosCandidatoForm, EmpresaForm, OfertaDeEmpleoForm, PerfilBaseForm


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
        candidato = Candidato.objects.get(user=request.user)
        if candidato.portafolio_url:
            return redirect("ofertas_laborales")
        else:
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
            print(form.cleaned_data.get('descripcion_personal'))
            print(form.cleaned_data)
            # Convertir los campos dinámicos a JSON
            candidato = form.save(commit=False)
            candidato.habilidades_tecnicas = request.POST.getlist('tecnicas')
            candidato.habilidades_blandas = request.POST.getlist('Blandas')
            candidato.descripcion_personal = form.cleaned_data.get('descripcion_personal')
            candidato.idiomas = json.loads(request.POST.get('idiomas', '{}'))
            candidato.experiencia_laboral = json.loads(request.POST.get('experiencia_laboral', '[]'))
            candidato.instituciones_educativas = json.loads(request.POST.get('instituciones_educativas', '[]'))
            candidato.cursos_certificados = json.loads(request.POST.get('cursos_certificados', '[]'))

            # Guardar el perfil
            candidato.save()
            return redirect("ofertas_laborales")

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

            # Procesar requisitos
            requisitos_json = request.POST.get('requisitos', '[]')
            try:
                oferta.requisitos = json.loads(requisitos_json)
            except json.JSONDecodeError:
                oferta.requisitos = []

            # Procesar preguntas
            preguntas_json = request.POST.get('preguntas', '[]')
            try:
                oferta.preguntas = json.loads(preguntas_json)
            except json.JSONDecodeError:
                oferta.preguntas = []

            oferta.save()
            form.save_m2m()
            return redirect("ver_perfil_empresa")

        return render(request, "ofertas/crear_oferta.html", {"form": form})
    
    @login_required
    def completar_datos_candidato(request):
        if request.method == 'POST':
            form = CompletarDatosCandidatoForm(request.POST, request.FILES, instance=request.user.perfil_candidato)
            if form.is_valid():
                form.save()
                return redirect('perfil')
        else:
            form = CompletarDatosCandidatoForm(instance=request.user.perfil_candidato)
        
        return render(request, 'completar_datos_candidato.html', {'form': form})            
    
class OfertasLaboralesView(View):
    @method_decorator(login_required)
    def get(self, request):
        perfil_candidato = Candidato.objects.filter(user=request.user).first()
        if perfil_candidato and not perfil_candidato.portafolio_url:
            return redirect("completar_perfil_base")

        ofertas = OfertaDeEmpleo.objects.order_by('-fecha_publicacion')[:10]
        return render(request, "ofertas/ofertas_laborales.html", {"ofertas": ofertas})
    
class OfertaDetalleView(DetailView):
    model = OfertaDeEmpleo
    template_name = "ofertas/oferta_detalle.html"
    context_object_name = "oferta"

    def get_object(self):
        id_ = self.kwargs.get("id")
        return OfertaDeEmpleo.objects.get(id=id_)

import json
import requests
from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Candidato, OfertaDeEmpleo, SolicitudDeEmpleo

@login_required
def enviar_solicitud(request):
    if request.method == "POST":
        candidato = get_object_or_404(Candidato, user=request.user)
        oferta_id = request.POST.get("oferta_id")
        respuestas = json.loads(request.POST.get("respuestas", "{}"))

        try:
            oferta = get_object_or_404(OfertaDeEmpleo, id=oferta_id)

            # Construir el texto de la oferta de empleo
            requisitos = oferta.requisitos if isinstance(oferta.requisitos, list) else []
            preguntas = oferta.preguntas if isinstance(oferta.preguntas, list) else []

            job_offer_text = f"""
            Título: {oferta.titulo}
            Descripción: {oferta.descripcion}
            Requisitos: {', '.join(requisitos)}
            Preguntas: {', '.join(preguntas)}
            Criterios de Inclusión: {', '.join([criterio.nombre for criterio in oferta.criterios_inclusion.all()])}
            """

            # Construir el texto del candidato
            candidate_text = f"""
            Nivel de Estudios: {candidato.get_nivel_estudios_display()}
            Habilidades Técnicas: {', '.join(candidato.habilidades_tecnicas or [])}
            Habilidades Blandas: {', '.join(candidato.habilidades_blandas or [])}
            Idiomas: {', '.join([f"{idioma}: {nivel}" for idioma, nivel in (candidato.idiomas or {}).items()])}
            Experiencia Laboral: {', '.join([f"{exp['empresa']} - {exp['tiempo']} meses" for exp in (candidato.experiencia_laboral or [])])}
            Cursos Certificados: {', '.join(candidato.cursos_certificados or [])}
            Grado de Discapacidad: {candidato.get_grado_discapacidad_display()}
            Discapacidades: {candidato.discapacidades or 'No especificadas'}
            Descripción Personal: {candidato.descripcion_personal or 'No disponible'}
            Instituciones Educativas: {', '.join([f"{inst['nombre']} - {inst['titulo']}" for inst in (candidato.instituciones_educativas or [])])}
            Respuestas: {', '.join([f"{key}: {value}" for key, value in respuestas.items()])}
            """

            # Crear el cuerpo de la solicitud
            data = {
                "job_offer": job_offer_text.strip(),
                "candidate": candidate_text.strip(),
            }

            # Hacer la solicitud POST a la API
            response = requests.post("https://1kksqu.buildship.run/analisisperfilia", json=data)

            # Guardar el análisis en el modelo, manejando texto plano
            solicitud = SolicitudDeEmpleo.objects.create(
                candidato=candidato,
                oferta=oferta,
                respuestas=respuestas,
                analisis_de_ia=response.text  # Aquí guardamos el texto plano devuelto por la API
            )

            return JsonResponse({"status": "success", "message": "Solicitud enviada correctamente"})

        except OfertaDeEmpleo.DoesNotExist:
            return JsonResponse({"status": "error", "message": "La oferta no existe"})

    return JsonResponse({"status": "error", "message": "Método no permitido"})



class MisPostulacionesView(ListView):
    model = SolicitudDeEmpleo
    template_name = 'perfil/mis_postulaciones.html'

    def get_queryset(self):
        return SolicitudDeEmpleo.objects.filter(candidato__user=self.request.user).order_by('-fecha_solicitud')

@csrf_exempt
@login_required
def calificar_experiencia(request, solicitud_id):
    if request.method == 'POST':
        try:
            solicitud = SolicitudDeEmpleo.objects.get(id=solicitud_id, candidato__user=request.user)
            data = json.loads(request.body)
            estrellas = int(data.get('estrellas'))
            empresa = solicitud.oferta.empresa

            # Obtener el total de calificaciones previas
            total_calificaciones_previas = SolicitudDeEmpleo.objects.filter(oferta__empresa=empresa, calificada=True).count()

            # Calcular la nueva puntuación promedio
            nueva_puntuacion = (
                (empresa.puntuacion_promedio * total_calificaciones_previas) + estrellas
            ) / (total_calificaciones_previas + 1)

            # Guardar la nueva puntuación redondeada
            empresa.puntuacion_promedio = round(nueva_puntuacion, 2)
            empresa.save()

            # Marcar la solicitud como calificada
            solicitud.calificada = True
            solicitud.save()

            return JsonResponse({'status': 'success', 'message': '¡Gracias por tu calificación!'})
        except SolicitudDeEmpleo.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Solicitud no encontrada.'})
    return JsonResponse({'status': 'error', 'message': 'Método no permitido.'})

class GestionarOfertasView(ListView):
    model = OfertaDeEmpleo
    template_name = 'ofertas/gestionar_ofertas.html'

    def get_queryset(self):
        return OfertaDeEmpleo.objects.filter(empresa__user=self.request.user).order_by('-fecha_publicacion')
    
class EditarOfertaView(View):
    def get(self, request, id):
        oferta = get_object_or_404(OfertaDeEmpleo, id=id)
        criterios = CriterioInclusión.objects.all()
        form = OfertaDeEmpleoForm(instance=oferta)
        return render(request, 'ofertas/editar_oferta.html', {
            'form': form,
            'oferta': oferta,
            'criterios': criterios,
            'estado_actual': oferta.estado  # Pasa el estado actual
        })

    def post(self, request, id):
        oferta = get_object_or_404(OfertaDeEmpleo, id=id)
        form = OfertaDeEmpleoForm(request.POST, instance=oferta)

        if form.is_valid():
            oferta.estado = request.POST.get('estado') 
            requisitos = request.POST.getlist('requisito')
            preguntas = request.POST.getlist('pregunta')
            oferta.requisitos = requisitos
            oferta.preguntas = preguntas
            form.save()
            return redirect('gestionar_ofertas')

        return render(request, 'ofertas/editar_oferta.html', {
            'form': form,
            'oferta': oferta,
            'criterios': CriterioInclusión.objects.all(),
            'estado_actual': oferta.estado
        })

class VerPostulacionesView(View):
    def get(self, request, oferta_id):
        oferta = get_object_or_404(OfertaDeEmpleo, id=oferta_id)
        postulaciones = SolicitudDeEmpleo.objects.filter(oferta=oferta)
        return render(request, 'ofertas/ver_postulaciones.html', {'postulaciones': postulaciones, 'oferta': oferta})
    
class VerPerfilCandidatoView(View):
    def get(self, request, candidato_id, postulacion_id):
        candidato = get_object_or_404(Candidato, id=candidato_id)
        postulacion = get_object_or_404(SolicitudDeEmpleo, id=postulacion_id)

        comentarios_ia = [
            "Este candidato tiene habilidades destacadas en gestión de proyectos.",
            "La experiencia de este candidato es ideal para roles de liderazgo.",
            "Su perfil técnico es muy fuerte en áreas clave como programación y diseño.",
        ]
        comentario_ia = random.choice(comentarios_ia)

        return render(request, 'perfil/ver_perfil_candidato.html', {
            'candidato': candidato,
            'comentario_ia': comentario_ia,
            'postulacion': postulacion
        })
    
@csrf_exempt
def actualizar_postulacion(request, id):
    if request.method == 'POST':
        postulacion = get_object_or_404(SolicitudDeEmpleo, id=id)
        data = json.loads(request.body)
        estado = data.get('estado')

        if estado in ['aceptada', 'rechazada']:
            postulacion.estado = estado
            postulacion.save()
            return JsonResponse({'status': 'success', 'message': f'La postulación ha sido {estado}.'})
        else:
            return JsonResponse({'status': 'error', 'message': 'Estado inválido.'})

    return JsonResponse({'status': 'error', 'message': 'Método no permitido.'})
    





