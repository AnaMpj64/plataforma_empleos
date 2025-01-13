from django.db import models
from django.contrib.auth.models import User

class PerfilBase(models.Model):
    user = models.OneToOneField(
        User, 
        on_delete=models.CASCADE, 
        related_name="perfil_base", 
        help_text="Usuario al que pertenece este perfil"
    )
    telefono = models.CharField(max_length=15, blank=True, null=True, help_text="Número de teléfono")
    direccion = models.TextField(blank=True, null=True, help_text="Dirección del usuario")
    linkedin = models.URLField(blank=True, null=True, help_text="Perfil de LinkedIn")
    fecha_registro = models.DateTimeField(auto_now_add=True, help_text="Fecha de registro")
    foto = models.ImageField(upload_to='media/usuario/foto', null=True, blank= True)
    tipo_usuario = models.CharField(
        max_length=20,
        choices=[('empresa', 'Empresa'), ('candidato', 'Candidato')],
        default="candidato",
        help_text="Tipo de usuario"
    )

    class Meta:
        abstract = True

    def __str__(self):
        return f"{self.user.username} ({self.tipo_usuario})"
    
class Adecuacion(models.Model):
    nombre = models.CharField(max_length=255, help_text="Nombre de la adecuación")
    descripcion = models.TextField(help_text="Descripción de la adecuación")

    def __str__(self):
        return self.nombre

class Empresa(PerfilBase): 
    user = models.OneToOneField(
        User, 
        on_delete=models.CASCADE, 
        related_name="perfil_empresa",  
        help_text="Usuario al que pertenece esta empresa"
    )
    nombre_empresa = models.CharField(max_length=100, blank=True, null=True, help_text="Nombre de la empresa")
    descripcion = models.TextField(blank=True, null=True, help_text="Descripción de la empresa")
    ubicacion = models.CharField(max_length=100, blank=True, null=True, help_text="Ubicación de la empresa")
    puntuacion_promedio = models.FloatField(default=0.0, blank=True, null=True, help_text="Puntuación promedio basada en comentarios")
    adecuaciones = models.ManyToManyField(Adecuacion, blank=True, help_text="Adecuaciones disponibles en la empresa")

    def __str__(self):
        return self.nombre_empresa

    def publicar_oferta(self):
        # a futuro aqui se pone el metodo de publicar oferta
        pass

    def gestionar_ofertas(self):
        # aqui va a ir el metodo de gestionar ofertas
        pass

class Candidato(PerfilBase):
    user = models.OneToOneField(
        User, 
        on_delete=models.CASCADE, 
        related_name="perfil_candidato",  
        help_text="Usuario al que pertenece este candidato"
    )
    portafolio_url = models.URLField(blank=True, null=True, help_text="URL del portafolio del candidato")
    NIVEL_ESTUDIOS_CHOICES = [
        ('bachiller', 'Bachiller'),
        ('tercer_nivel', 'Título de tercer nivel'),
        ('maestria', 'Maestría o especialidad'),
        ('doctorado', 'Doctorado'),
        ('postdoctorado', 'Postdoctorado'),
    ]
    nivel_estudios = models.CharField(
        max_length=20,
        choices=NIVEL_ESTUDIOS_CHOICES,
        blank=True,
        null=True,
        help_text="Nivel de estudios del candidato"
    )
    habilidades_tecnicas = models.JSONField(blank=True, null=True, help_text="Habilidades técnicas")
    habilidades_blandas = models.JSONField(blank=True, null=True, help_text="Habilidades blandas")
    idiomas = models.JSONField(blank=True, null=True, help_text="Idiomas conocidos")
    experiencia_laboral = models.JSONField(blank=True, null=True, help_text="Experiencia laboral")
    instituciones_educativas = models.JSONField(blank=True, null=True)
    cursos_certificados = models.JSONField(blank=True, null=True, help_text="Cursos certificados del candidato")
    descripcion_personal = models.TextField(blank=True, null=True)
    GRADO_DISCAPACIDAD_CHOICES = [
        ('ninguna', 'Ninguna discapacidad (del 0% y 4%)'),
        ('leve', 'Leve (del 5% y 24%)'),
        ('moderada', 'Moderada (del 25% al 49%)'),
        ('grave', 'Grave (del 50% al 74%)'),
        ('muy_grave', 'Muy grave (del 75 % al 95 %)'),
        ('completa', 'Completa (el 100 %)'),
    ]
    grado_discapacidad = models.CharField(
        max_length=20,
        choices=GRADO_DISCAPACIDAD_CHOICES,
        default='ninguna',
        blank=True,
        null=True,
        help_text="Grado de discapacidad del candidato"
    )
    discapacidades = models.CharField(max_length=25, blank=True, null=True, help_text="Detalles de discapacidades")
    documentos_adjuntos = models.FileField(upload_to='documentos/', blank=True, null=True)

    def aplicar_oferta(self):
        # aqui va a ir el metodo para postular a ofertas
        pass

class CriterioInclusión(models.Model):
    nombre = models.CharField(max_length=100, help_text="Nombre del criterio")
    descripcion = models.TextField(help_text="Descripción del criterio")

    class Meta:
        verbose_name = "Criterio de inclusión"
        verbose_name_plural = "Criterios de inclusión"

    def __str__(self):
        return self.nombre

class OfertaDeEmpleo(models.Model):
    titulo = models.CharField(max_length=100, help_text="Título de la oferta")
    descripcion = models.TextField(help_text="Descripción de la oferta")
    requisitos = models.JSONField(help_text="Requisitos de la oferta")
    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE, related_name="ofertas", help_text="Empresa que publica la oferta")
    fecha_publicacion = models.DateTimeField(auto_now_add=True, help_text="Fecha de publicación")
    estado = models.CharField(max_length=20, choices=[('abierta', 'Abierta'), ('cerrada', 'Cerrada')], default='abierta', help_text="Estado de la oferta")
    criterios_inclusion = models.ManyToManyField(CriterioInclusión, blank=True, help_text="Criterios de inclusión para la oferta")
    preguntas = models.JSONField(help_text="Preguntas que el candidato debe responder", blank=True, null=True)

    class Meta:
        verbose_name = "Oferta de empleo"
        verbose_name_plural = "Ofertas de empleo"

    def __str__(self):
        return f"{self.titulo} - {self.empresa.nombre_empresa}"

class Comentario(models.Model):
    texto = models.TextField(help_text="Comentario")
    puntuacion = models.IntegerField(help_text="Puntuación del comentario")
    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE, related_name="comentarios", help_text="Empresa a la que pertenece el comentario")
    fecha = models.DateTimeField(auto_now_add=True, help_text="Fecha del comentario")

    def __str__(self):
        return f"Comentario {self.id} - {self.empresa.nombre_empresa}"

class Archivo(models.Model):
    nombre = models.CharField(max_length=100, help_text="Nombre del archivo")
    url = models.URLField(help_text="URL del archivo")

    def __str__(self):
        return self.nombre
    
class SolicitudDeEmpleo(models.Model):
    ESTADO_CHOICES = [
        ('pendiente', 'Pendiente'),
        ('rechazada', 'Rechazada'),
        ('aceptada', 'Aceptada'),
    ]

    candidato = models.ForeignKey(Candidato, on_delete=models.CASCADE, related_name="solicitudes")
    oferta = models.ForeignKey(OfertaDeEmpleo, on_delete=models.CASCADE, related_name="solicitudes")
    respuestas = models.JSONField(help_text="Respuestas del candidato a las preguntas", blank=True, null=True)
    fecha_solicitud = models.DateTimeField(auto_now_add=True, help_text="Fecha de la solicitud")
    estado = models.CharField(max_length=20, choices=ESTADO_CHOICES, default='pendiente', help_text="Estado de la solicitud")

    def __str__(self):
        return f"Solicitud de {self.candidato.user.username} para {self.oferta.titulo} - Estado: {self.estado}"


