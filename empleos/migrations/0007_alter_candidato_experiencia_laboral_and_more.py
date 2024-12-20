# Generated by Django 5.1.4 on 2024-12-13 20:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('empleos', '0006_candidato_foto_empresa_foto'),
    ]

    operations = [
        migrations.AlterField(
            model_name='candidato',
            name='experiencia_laboral',
            field=models.JSONField(blank=True, help_text='Experiencia laboral', null=True),
        ),
        migrations.AlterField(
            model_name='candidato',
            name='grado_discapacidad',
            field=models.CharField(blank=True, choices=[('ninguna', 'Ninguna discapacidad (del 0% y 4%)'), ('leve', 'Leve (del 5% y 24%)'), ('moderada', 'Moderada (del 25% al 49%)'), ('grave', 'Grave (del 50% al 74%)'), ('muy_grave', 'Muy grave (del 75 % al 95 %)'), ('completa', 'Completa (el 100 %)')], default='ninguna', help_text='Grado de discapacidad del candidato', max_length=20, null=True),
        ),
        migrations.AlterField(
            model_name='candidato',
            name='habilidades_blandas',
            field=models.JSONField(blank=True, help_text='Habilidades blandas', null=True),
        ),
        migrations.AlterField(
            model_name='candidato',
            name='habilidades_tecnicas',
            field=models.JSONField(blank=True, help_text='Habilidades técnicas', null=True),
        ),
        migrations.AlterField(
            model_name='candidato',
            name='idiomas',
            field=models.JSONField(blank=True, help_text='Idiomas conocidos', null=True),
        ),
        migrations.AlterField(
            model_name='candidato',
            name='nivel_estudios',
            field=models.CharField(blank=True, choices=[('bachiller', 'Bachiller'), ('tercer_nivel', 'Título de tercer nivel'), ('maestria', 'Maestría o especialidad'), ('doctorado', 'Doctorado'), ('postdoctorado', 'Postdoctorado')], help_text='Nivel de estudios del candidato', max_length=20, null=True),
        ),
        migrations.AlterField(
            model_name='empresa',
            name='nombre_empresa',
            field=models.CharField(blank=True, help_text='Nombre de la empresa', max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='empresa',
            name='puntuacion_promedio',
            field=models.FloatField(blank=True, default=0.0, help_text='Puntuación promedio basada en comentarios', null=True),
        ),
        migrations.AlterField(
            model_name='empresa',
            name='ubicacion',
            field=models.CharField(blank=True, help_text='Ubicación de la empresa', max_length=100, null=True),
        ),
    ]
