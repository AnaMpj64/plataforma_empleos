-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: postulaciones_empleos
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'ana@hotmail.com',0,0,1),(7,'nina@hotmail.com',0,1,7),(8,'kike@hotmail.com',0,1,8);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add usuario',7,'add_usuario'),(26,'Can change usuario',7,'change_usuario'),(27,'Can delete usuario',7,'delete_usuario'),(28,'Can view usuario',7,'view_usuario'),(29,'Can add archivo',8,'add_archivo'),(30,'Can change archivo',8,'change_archivo'),(31,'Can delete archivo',8,'delete_archivo'),(32,'Can view archivo',8,'view_archivo'),(33,'Can add criterio inclusión',9,'add_criterioinclusión'),(34,'Can change criterio inclusión',9,'change_criterioinclusión'),(35,'Can delete criterio inclusión',9,'delete_criterioinclusión'),(36,'Can view criterio inclusión',9,'view_criterioinclusión'),(37,'Can add oferta de empleo',10,'add_ofertadeempleo'),(38,'Can change oferta de empleo',10,'change_ofertadeempleo'),(39,'Can delete oferta de empleo',10,'delete_ofertadeempleo'),(40,'Can view oferta de empleo',10,'view_ofertadeempleo'),(41,'Can add empresa',11,'add_empresa'),(42,'Can change empresa',11,'change_empresa'),(43,'Can delete empresa',11,'delete_empresa'),(44,'Can view empresa',11,'view_empresa'),(45,'Can add comentario',12,'add_comentario'),(46,'Can change comentario',12,'change_comentario'),(47,'Can delete comentario',12,'delete_comentario'),(48,'Can view comentario',12,'view_comentario'),(49,'Can add candidato',13,'add_candidato'),(50,'Can change candidato',13,'change_candidato'),(51,'Can delete candidato',13,'delete_candidato'),(52,'Can view candidato',13,'view_candidato'),(53,'Can add email address',14,'add_emailaddress'),(54,'Can change email address',14,'change_emailaddress'),(55,'Can delete email address',14,'delete_emailaddress'),(56,'Can view email address',14,'view_emailaddress'),(57,'Can add email confirmation',15,'add_emailconfirmation'),(58,'Can change email confirmation',15,'change_emailconfirmation'),(59,'Can delete email confirmation',15,'delete_emailconfirmation'),(60,'Can view email confirmation',15,'view_emailconfirmation'),(61,'Can add adecuacion',16,'add_adecuacion'),(62,'Can change adecuacion',16,'change_adecuacion'),(63,'Can delete adecuacion',16,'delete_adecuacion'),(64,'Can view adecuacion',16,'view_adecuacion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$XwI9ztV9HyVnfLrbPz83Ay$tiCND5wCbIl4CCjM3sGack7KG8SQVdBuY/fOpwUtGyY=','2024-12-18 23:34:32.121184',1,'ana','','','ana@hotmail.com',1,1,'2024-12-12 19:47:11.529555'),(7,'pbkdf2_sha256$870000$28XtNoqqpJt1D5GlkujjJi$uOTZnSYr3e1P5EIJjVFsEShQ+89hS/dhvoI2bjuFzOA=','2024-12-13 21:13:32.229963',0,'nina','','','nina@hotmail.com',0,1,'2024-12-13 19:54:14.965319'),(8,'pbkdf2_sha256$870000$dvNtzCNlT27kpxhI0w7q2o$HZLUsPljjYccQBsBRVon96nvAtcgwgdrYyEclRRcnRQ=','2024-12-13 21:14:03.708447',0,'kike','','','kike@hotmail.com',0,1,'2024-12-13 21:14:03.379262');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'account','emailaddress'),(15,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(16,'empleos','adecuacion'),(8,'empleos','archivo'),(13,'empleos','candidato'),(12,'empleos','comentario'),(9,'empleos','criterioinclusión'),(11,'empleos','empresa'),(10,'empleos','ofertadeempleo'),(7,'empleos','usuario'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-12-12 18:29:46.298607'),(2,'auth','0001_initial','2024-12-12 18:29:46.809146'),(3,'admin','0001_initial','2024-12-12 18:29:46.928579'),(4,'admin','0002_logentry_remove_auto_add','2024-12-12 18:29:46.934819'),(5,'admin','0003_logentry_add_action_flag_choices','2024-12-12 18:29:46.940430'),(6,'contenttypes','0002_remove_content_type_name','2024-12-12 18:29:47.011391'),(7,'auth','0002_alter_permission_name_max_length','2024-12-12 18:29:47.060888'),(8,'auth','0003_alter_user_email_max_length','2024-12-12 18:29:47.080414'),(9,'auth','0004_alter_user_username_opts','2024-12-12 18:29:47.086577'),(10,'auth','0005_alter_user_last_login_null','2024-12-12 18:29:47.131160'),(11,'auth','0006_require_contenttypes_0002','2024-12-12 18:29:47.134144'),(12,'auth','0007_alter_validators_add_error_messages','2024-12-12 18:29:47.140694'),(13,'auth','0008_alter_user_username_max_length','2024-12-12 18:29:47.195419'),(14,'auth','0009_alter_user_last_name_max_length','2024-12-12 18:29:47.247222'),(15,'auth','0010_alter_group_name_max_length','2024-12-12 18:29:47.262911'),(16,'auth','0011_update_proxy_permissions','2024-12-12 18:29:47.268374'),(17,'auth','0012_alter_user_first_name_max_length','2024-12-12 18:29:47.319598'),(18,'empleos','0001_initial','2024-12-12 18:29:47.340499'),(19,'sessions','0001_initial','2024-12-12 18:29:47.369818'),(20,'empleos','0002_archivo_candidato_comentario_criterioinclusión_and_more','2024-12-12 20:45:05.207831'),(21,'empleos','0003_alter_criterioinclusión_options_and_more','2024-12-12 23:25:18.376653'),(22,'empleos','0004_alter_candidato_grado_discapacidad','2024-12-12 23:29:00.612982'),(23,'account','0001_initial','2024-12-13 04:32:19.530258'),(24,'account','0002_email_max_length','2024-12-13 04:32:19.547069'),(25,'account','0003_alter_emailaddress_create_unique_verified_email','2024-12-13 04:32:19.578304'),(26,'account','0004_alter_emailaddress_drop_unique_email','2024-12-13 04:32:19.619101'),(27,'account','0005_emailaddress_idx_upper_email','2024-12-13 04:32:19.642729'),(28,'account','0006_emailaddress_lower','2024-12-13 04:32:19.653497'),(29,'account','0007_emailaddress_idx_email','2024-12-13 04:32:19.692087'),(30,'account','0008_emailaddress_unique_primary_email_fixup','2024-12-13 04:32:19.703740'),(31,'account','0009_emailaddress_unique_primary_email','2024-12-13 04:32:19.710671'),(32,'empleos','0005_alter_candidato_tipo_usuario_and_more','2024-12-13 16:07:26.415251'),(33,'empleos','0006_candidato_foto_empresa_foto','2024-12-13 19:21:37.219035'),(34,'empleos','0007_alter_candidato_experiencia_laboral_and_more','2024-12-13 20:54:39.308899'),(35,'empleos','0008_adecuacion_empresa_adecuaciones','2024-12-16 16:47:18.625484'),(36,'empleos','0009_ofertadeempleo_criterios_inclusion','2024-12-18 23:31:45.276592');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos_adecuacion`
--

DROP TABLE IF EXISTS `empleos_adecuacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleos_adecuacion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_adecuacion`
--

LOCK TABLES `empleos_adecuacion` WRITE;
/*!40000 ALTER TABLE `empleos_adecuacion` DISABLE KEYS */;
INSERT INTO `empleos_adecuacion` VALUES (1,'Sistemas de comunicación visuales','Sistemas de comunicación visuales (pantallas, texto, señales luminosas), intérpretes de lenguaje de señas, equipos de videollamadas adaptados.'),(2,'Software lector de pantalla','Software lector de pantalla, señalización táctil (Braille), rutas accesibles con guías táctiles y perros guía permitidos.'),(3,'Herramientas de comunicación escrita y visual','Uso de herramientas de comunicación escrita y visual, soporte en dispositivos de voz asistida.'),(4,'Accesos y estaciones de trabajo adaptados','Accesos, baños y estaciones de trabajo adaptados; ascensores y escritorios ajustables.'),(5,'Capacitación específica y supervisión','Capacitación específica, supervisión adecuada, tareas con rutinas estructuradas.'),(6,'Ambientes tranquilos y flexibilidad','Ambientes tranquilos, flexibilidad en horarios, soporte emocional, zonas de descanso.');
/*!40000 ALTER TABLE `empleos_adecuacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos_archivo`
--

DROP TABLE IF EXISTS `empleos_archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleos_archivo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_archivo`
--

LOCK TABLES `empleos_archivo` WRITE;
/*!40000 ALTER TABLE `empleos_archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleos_archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos_candidato`
--

DROP TABLE IF EXISTS `empleos_candidato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleos_candidato` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` longtext,
  `linkedin` varchar(200) DEFAULT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL,
  `portafolio_url` varchar(200) DEFAULT NULL,
  `nivel_estudios` varchar(20) DEFAULT NULL,
  `habilidades_tecnicas` json DEFAULT NULL,
  `habilidades_blandas` json DEFAULT NULL,
  `idiomas` json DEFAULT NULL,
  `experiencia_laboral` json DEFAULT NULL,
  `cursos_certificados` json DEFAULT NULL,
  `grado_discapacidad` varchar(20) DEFAULT NULL,
  `discapacidades` json DEFAULT NULL,
  `user_id` int NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `empleos_candidato_user_id_8723dcc4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_candidato`
--

LOCK TABLES `empleos_candidato` WRITE;
/*!40000 ALTER TABLE `empleos_candidato` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleos_candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos_comentario`
--

DROP TABLE IF EXISTS `empleos_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleos_comentario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `texto` longtext NOT NULL,
  `puntuacion` int NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `empresa_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empleos_comentario_empresa_id_b840df27_fk_empleos_empresa_id` (`empresa_id`),
  CONSTRAINT `empleos_comentario_empresa_id_b840df27_fk_empleos_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empleos_empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_comentario`
--

LOCK TABLES `empleos_comentario` WRITE;
/*!40000 ALTER TABLE `empleos_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleos_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos_criterioinclusión`
--

DROP TABLE IF EXISTS `empleos_criterioinclusión`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleos_criterioinclusión` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_criterioinclusión`
--

LOCK TABLES `empleos_criterioinclusión` WRITE;
/*!40000 ALTER TABLE `empleos_criterioinclusión` DISABLE KEYS */;
INSERT INTO `empleos_criterioinclusión` VALUES (1,'Depende de sonidos','Tareas que requieran escuchar alarmas o sonidos específicos.'),(2,'Requiere lectura visual','Trabajos que dependan de lectura visual rápida.'),(3,'Requere comunicación verbal','Roles en servicio al cliente que requieran comunicación verbal constante.'),(4,'Esfuerzos físicos intensos','Tareas que involucren esfuerzos físicos intensos o en lugares inaccesibles.'),(5,'Toma de decisiones bajo presión','Roles que requieran toma de decisiones complejas bajo presión.'),(6,'Trabajos de alta presión','Trabajos de alta presión, con ruido constante o sin posibilidad de pausas.');
/*!40000 ALTER TABLE `empleos_criterioinclusión` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos_empresa`
--

DROP TABLE IF EXISTS `empleos_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleos_empresa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` longtext,
  `linkedin` varchar(200) DEFAULT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL,
  `nombre_empresa` varchar(100) DEFAULT NULL,
  `descripcion` longtext,
  `ubicacion` varchar(100) DEFAULT NULL,
  `puntuacion_promedio` double DEFAULT NULL,
  `user_id` int NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `empleos_empresa_user_id_e641bff5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_empresa`
--

LOCK TABLES `empleos_empresa` WRITE;
/*!40000 ALTER TABLE `empleos_empresa` DISABLE KEYS */;
INSERT INTO `empleos_empresa` VALUES (8,'0983746256','Urb. El Centenario','https://www.linkedin.com/company/farmacias-santa-martha/','2024-12-18 15:17:53.717829','empresa','Farmacias Santa Martha','Farmacia - Venta de artículos para la salud, medicamentos y cuidado personal.','Santo Domingo - Av. Esmeraldas y Abraham Calazacon',0,1,'');
/*!40000 ALTER TABLE `empleos_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos_empresa_adecuaciones`
--

DROP TABLE IF EXISTS `empleos_empresa_adecuaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleos_empresa_adecuaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint NOT NULL,
  `adecuacion_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `empleos_empresa_adecuaci_empresa_id_adecuacion_id_f0b98969_uniq` (`empresa_id`,`adecuacion_id`),
  KEY `empleos_empresa_adec_adecuacion_id_690a61dd_fk_empleos_a` (`adecuacion_id`),
  CONSTRAINT `empleos_empresa_adec_adecuacion_id_690a61dd_fk_empleos_a` FOREIGN KEY (`adecuacion_id`) REFERENCES `empleos_adecuacion` (`id`),
  CONSTRAINT `empleos_empresa_adec_empresa_id_f63217e8_fk_empleos_e` FOREIGN KEY (`empresa_id`) REFERENCES `empleos_empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_empresa_adecuaciones`
--

LOCK TABLES `empleos_empresa_adecuaciones` WRITE;
/*!40000 ALTER TABLE `empleos_empresa_adecuaciones` DISABLE KEYS */;
INSERT INTO `empleos_empresa_adecuaciones` VALUES (5,8,1);
/*!40000 ALTER TABLE `empleos_empresa_adecuaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos_ofertadeempleo`
--

DROP TABLE IF EXISTS `empleos_ofertadeempleo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleos_ofertadeempleo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `requisitos` json NOT NULL,
  `fecha_publicacion` datetime(6) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `empresa_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empleos_ofertadeempleo_empresa_id_5f61f561_fk_empleos_empresa_id` (`empresa_id`),
  CONSTRAINT `empleos_ofertadeempleo_empresa_id_5f61f561_fk_empleos_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empleos_empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_ofertadeempleo`
--

LOCK TABLES `empleos_ofertadeempleo` WRITE;
/*!40000 ALTER TABLE `empleos_ofertadeempleo` DISABLE KEYS */;
INSERT INTO `empleos_ofertadeempleo` VALUES (7,'Asistente de Farmacia','Estamos buscando un Asistente de Farmacia comprometido y organizado para unirse a nuestro equipo. La persona seleccionada será responsable de brindar atención personalizada a los clientes, gestionar inventarios de medicamentos y apoyar en tareas administrativas. Este es un puesto ideal para alguien con habilidades interpersonales y pasión por la salud.','[\"Experiencia mínima de 1 año en farmacias o puestos relacionados.\", \"Conocimientos básicos de medicamentos y su uso.\", \"Manejo de software para inventario y facturación.\", \"Habilidades de comunicación y servicio al cliente.\", \"Disponibilidad para trabajar en horarios rotativos.\"]','2024-12-19 00:41:08.331844','abierta',8);
/*!40000 ALTER TABLE `empleos_ofertadeempleo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos_ofertadeempleo_criterios_inclusion`
--

DROP TABLE IF EXISTS `empleos_ofertadeempleo_criterios_inclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleos_ofertadeempleo_criterios_inclusion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ofertadeempleo_id` bigint NOT NULL,
  `criterioinclusión_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `empleos_ofertadeempleo_c_ofertadeempleo_id_criter_b75c983b_uniq` (`ofertadeempleo_id`,`criterioinclusión_id`),
  KEY `empleos_ofertadeempl_criterioinclusión_id_ed75102c_fk_empleos_c` (`criterioinclusión_id`),
  CONSTRAINT `empleos_ofertadeempl_criterioinclusión_id_ed75102c_fk_empleos_c` FOREIGN KEY (`criterioinclusión_id`) REFERENCES `empleos_criterioinclusión` (`id`),
  CONSTRAINT `empleos_ofertadeempl_ofertadeempleo_id_caf8e8ff_fk_empleos_o` FOREIGN KEY (`ofertadeempleo_id`) REFERENCES `empleos_ofertadeempleo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_ofertadeempleo_criterios_inclusion`
--

LOCK TABLES `empleos_ofertadeempleo_criterios_inclusion` WRITE;
/*!40000 ALTER TABLE `empleos_ofertadeempleo_criterios_inclusion` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleos_ofertadeempleo_criterios_inclusion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-18 21:21:28
