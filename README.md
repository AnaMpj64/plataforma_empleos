# Proyecto de Gestión de Empleos

Este es un proyecto en desarrollo para la gestión de empleos, enfocado en ofrecer funcionalidades avanzadas para empresas y candidatos. Este documento proporciona los detalles para instalar, configurar y ejecutar el proyecto en tu máquina local.

---

## Requerimientos de Instalación

1. Asegúrate de tener **Python 3.12** o superior instalado en tu máquina.
2. Instala Anaconda para manejar entornos virtuales fácilmente.
3. Instala las dependencias listadas en el archivo `requirements.txt` usando el siguiente comando:
   ```bash
   pip install -r requirements.txt


## Requerimientos de Instalación
1. Puerto actual de la base de datos: 3305
2. La conexión a la base de datos y las credenciales se manejan a través de un archivo .env que debes crear en la raíz del proyecto. Este archivo incluirá las siguientes variables de entorno por ahora:

DB_NAME=nombre_de_la_base_de_datos
DB_USER=usuario_de_la_base_de_datos
DB_PASSWORD=contraseña_de_la_base_de_datos
DB_HOST=localhost
DB_PORT=3305

## Creación de un Super Usuario

Para acceder al sistema como administrador, puedes crear un nuevo superusuario ejecutando el siguiente comando en la terminal de Anaconda:

python manage.py createsuperuser

### Usuarios de prueba disponibles actualmente:
Nombre de usuario: ana
Contraseña: ana123456

## Acceso al Proyecto
Actualmente, muchas vistas están en desarrollo. Para acceder al sistema, inicia sesión en la URL:
http://127.0.0.1:8000/accounts/login/


