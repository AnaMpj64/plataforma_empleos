"""
URL configuration for plataforma_empleos project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path


from empleos import views
from empleos.views import CompletarDatosCandidatoView, CompletarDatosEmpresaView, CompletarPerfilBaseView, CrearOfertaView, OfertasLaboralesView, VerPerfilEmpresaView, redireccionar_despues_login

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('allauth.urls')),
    path('completar-perfil/', CompletarPerfilBaseView.as_view(), name='completar_perfil_base'),
    path("completar-datos-empresa/", CompletarDatosEmpresaView.as_view(), name="completar_datos_empresa"),
    path("completar-datos-candidato/", CompletarDatosCandidatoView.as_view(), name="completar_datos_candidato"),
    path('crear-oferta/', CrearOfertaView.as_view(), name='crear_oferta'),
    path('redireccionar/', redireccionar_despues_login, name='redireccionar_despues_login'),
    path('perfil-empresa/', VerPerfilEmpresaView.as_view(), name="ver_perfil_empresa"),
    path("ofertas-laborales/", OfertasLaboralesView.as_view(), name="ofertas_laborales"),
    path('oferta/<int:id>/', views.OfertaDetalleView.as_view(), name='oferta_detalle'),
    path("enviar-solicitud/", views.enviar_solicitud, name="enviar_solicitud"),
    path('mis-postulaciones/', views.MisPostulacionesView.as_view(), name='mis_postulaciones'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

