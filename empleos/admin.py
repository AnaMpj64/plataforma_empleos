from django.contrib import admin
from .models import Empresa, Candidato, OfertaDeEmpleo, Comentario, Archivo, CriterioInclusión

@admin.register(Empresa)
class EmpresaAdmin(admin.ModelAdmin):
    list_display = ('user', 'nombre_empresa', 'ubicacion', 'puntuacion_promedio')
    search_fields = ('nombre_empresa', 'ubicacion')
    list_filter = ('puntuacion_promedio',)

@admin.register(Candidato)
class CandidatoAdmin(admin.ModelAdmin):
    list_display = ('user', 'portafolio_url', 'grado_discapacidad')
    search_fields = ('user__username', 'portafolio_url')
    list_filter = ('grado_discapacidad',)

@admin.register(OfertaDeEmpleo)
class OfertaDeEmpleoAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'empresa', 'fecha_publicacion', 'estado')
    search_fields = ('titulo', 'empresa__nombre_empresa')
    list_filter = ('estado',)

@admin.register(Comentario)
class ComentarioAdmin(admin.ModelAdmin):
    list_display = ('texto', 'puntuacion', 'empresa', 'fecha')
    search_fields = ('empresa__nombre_empresa', 'texto')
    list_filter = ('puntuacion',)

@admin.register(CriterioInclusión)
class CriterioInclusiónAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'descripcion')
    search_fields = ('nombre',)
