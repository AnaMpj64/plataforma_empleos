# Generated by Django 5.1.4 on 2025-01-12 20:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('empleos', '0013_rename_descripcion_personales_candidato_descripcion_personal'),
    ]

    operations = [
        migrations.AddField(
            model_name='ofertadeempleo',
            name='preguntas',
            field=models.JSONField(blank=True, help_text='Preguntas que el candidato debe responder', null=True),
        ),
    ]
