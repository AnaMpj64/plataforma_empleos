from django import forms
from .models import Adecuacion, Empresa, Candidato, OfertaDeEmpleo, CriterioInclusión

class PerfilBaseForm(forms.Form): 
    telefono = forms.CharField(max_length=15, required=False, label="Teléfono")
    direccion = forms.CharField(widget=forms.Textarea, required=False, label="Dirección")
    linkedin = forms.URLField(required=False, label="Perfil de LinkedIn")
    foto = forms.ImageField(required=False, label="Foto de perfil")
    tipo_usuario = forms.ChoiceField(
        choices=[("empresa", "Empresa"), ("candidato", "Candidato")],
        label="Tipo de usuario",
        widget=forms.Select(attrs={"class": "form-select form-select-lg bg-dark text-white"}),
    )

    class Meta:
        model = Empresa  
        fields = ["telefono", "direccion", "linkedin", "foto", "tipo_usuario"]

class EmpresaForm(forms.ModelForm):
    adecuaciones = forms.ModelMultipleChoiceField(
        queryset=Adecuacion.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        required=False,
        label="Adecuaciones"
    )

    class Meta:
        model = Empresa
        fields = ['nombre_empresa', 'descripcion', 'ubicacion', 'adecuaciones']

class CandidatoForm(forms.ModelForm):
    class Meta:
        model = Candidato
        fields = ["portafolio_url", "nivel_estudios", "habilidades_tecnicas", "habilidades_blandas", "idiomas", "experiencia_laboral", "cursos_certificados", "grado_discapacidad", "discapacidades"]

class OfertaDeEmpleoForm(forms.ModelForm):
    criterios_inclusion = forms.ModelMultipleChoiceField(
        queryset=CriterioInclusión.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        required=False,
        label="Criterios de Inclusión"
    )
    requisitos = forms.CharField(
        required=False,
        widget=forms.HiddenInput, 
    )
    preguntas = forms.CharField(
        required=False,
        widget=forms.HiddenInput
    )

    class Meta:
        model = OfertaDeEmpleo
        fields = ['titulo', 'descripcion', 'requisitos', 'criterios_inclusion', 'preguntas']

class CompletarDatosCandidatoForm(forms.ModelForm):
    descripcion_personal = forms.CharField(
        widget=forms.Textarea(attrs={'rows': 4, 'class': 'form-control form-control-lg'}),
        required=False
    )
    class Meta:
        model = Candidato
        fields = [
            'portafolio_url', 'nivel_estudios', 'habilidades_tecnicas', 'habilidades_blandas', 'idiomas',
            'experiencia_laboral', 'instituciones_educativas', 'cursos_certificados', 'descripcion_personal',
            'grado_discapacidad', 'discapacidades', 'documentos_adjuntos'
        ]
        widgets = {
            'descripcion_personal': forms.Textarea(attrs={'rows': 4}),
            'habilidades_tecnicas': forms.CheckboxSelectMultiple(),
            'habilidades_blandas': forms.CheckboxSelectMultiple(),
        }

