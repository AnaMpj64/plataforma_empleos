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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'ana@hotmail.com',0,0,1),(7,'nina@hotmail.com',0,1,7),(8,'kike@hotmail.com',0,1,8),(9,'alexandra@gmail.com',0,1,9),(10,'empresa@empresa.com',0,1,10),(11,'ventas@delavegasteakhouse.com',0,1,11),(12,'ventas@dalis.com',0,1,12),(13,'tian1@gmail.com',0,1,13),(14,'mariahidalgomartinez@gmail.com',0,1,14);
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add usuario',7,'add_usuario'),(26,'Can change usuario',7,'change_usuario'),(27,'Can delete usuario',7,'delete_usuario'),(28,'Can view usuario',7,'view_usuario'),(29,'Can add archivo',8,'add_archivo'),(30,'Can change archivo',8,'change_archivo'),(31,'Can delete archivo',8,'delete_archivo'),(32,'Can view archivo',8,'view_archivo'),(33,'Can add criterio inclusión',9,'add_criterioinclusión'),(34,'Can change criterio inclusión',9,'change_criterioinclusión'),(35,'Can delete criterio inclusión',9,'delete_criterioinclusión'),(36,'Can view criterio inclusión',9,'view_criterioinclusión'),(37,'Can add oferta de empleo',10,'add_ofertadeempleo'),(38,'Can change oferta de empleo',10,'change_ofertadeempleo'),(39,'Can delete oferta de empleo',10,'delete_ofertadeempleo'),(40,'Can view oferta de empleo',10,'view_ofertadeempleo'),(41,'Can add empresa',11,'add_empresa'),(42,'Can change empresa',11,'change_empresa'),(43,'Can delete empresa',11,'delete_empresa'),(44,'Can view empresa',11,'view_empresa'),(45,'Can add comentario',12,'add_comentario'),(46,'Can change comentario',12,'change_comentario'),(47,'Can delete comentario',12,'delete_comentario'),(48,'Can view comentario',12,'view_comentario'),(49,'Can add candidato',13,'add_candidato'),(50,'Can change candidato',13,'change_candidato'),(51,'Can delete candidato',13,'delete_candidato'),(52,'Can view candidato',13,'view_candidato'),(53,'Can add email address',14,'add_emailaddress'),(54,'Can change email address',14,'change_emailaddress'),(55,'Can delete email address',14,'delete_emailaddress'),(56,'Can view email address',14,'view_emailaddress'),(57,'Can add email confirmation',15,'add_emailconfirmation'),(58,'Can change email confirmation',15,'change_emailconfirmation'),(59,'Can delete email confirmation',15,'delete_emailconfirmation'),(60,'Can view email confirmation',15,'view_emailconfirmation'),(61,'Can add adecuacion',16,'add_adecuacion'),(62,'Can change adecuacion',16,'change_adecuacion'),(63,'Can delete adecuacion',16,'delete_adecuacion'),(64,'Can view adecuacion',16,'view_adecuacion'),(65,'Can add solicitud de empleo',17,'add_solicituddeempleo'),(66,'Can change solicitud de empleo',17,'change_solicituddeempleo'),(67,'Can delete solicitud de empleo',17,'delete_solicituddeempleo'),(68,'Can view solicitud de empleo',17,'view_solicituddeempleo');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$XwI9ztV9HyVnfLrbPz83Ay$tiCND5wCbIl4CCjM3sGack7KG8SQVdBuY/fOpwUtGyY=','2025-01-16 02:06:45.291292',1,'ana','','','ana@hotmail.com',1,1,'2024-12-12 19:47:11.529555'),(7,'pbkdf2_sha256$870000$28XtNoqqpJt1D5GlkujjJi$uOTZnSYr3e1P5EIJjVFsEShQ+89hS/dhvoI2bjuFzOA=','2024-12-13 21:13:32.229963',0,'nina','','','nina@hotmail.com',0,1,'2024-12-13 19:54:14.965319'),(8,'pbkdf2_sha256$870000$dvNtzCNlT27kpxhI0w7q2o$HZLUsPljjYccQBsBRVon96nvAtcgwgdrYyEclRRcnRQ=','2024-12-13 21:14:03.708447',0,'kike','','','kike@hotmail.com',0,1,'2024-12-13 21:14:03.379262'),(9,'pbkdf2_sha256$870000$LtKvHhTWEfX6ScoF6uF9gm$KSsTXLd4kV4vGRPHX+1LzyuWtVrp9i+UzhFQG9Vb4Zo=','2025-01-16 03:20:16.960959',0,'alexandra','','','alexandra@gmail.com',0,1,'2025-01-08 00:43:52.132185'),(10,'pbkdf2_sha256$870000$QJxQc9z0nD9aCpKzGuSx1q$z1lSqExBjXdiolZMFjdLaZ4ZSV4OnJPe8EuSjN6W+PE=','2025-01-12 18:02:37.808125',0,'EmpresaPrueba','','','empresa@empresa.com',0,1,'2025-01-12 18:02:37.384131'),(11,'pbkdf2_sha256$870000$A28QTCkbDSMDO1pVmxOqPj$deXX3olGsIyitXYOK3gFwvX8EJfyM6Njuc5NCZnU0As=','2025-01-17 02:29:44.681646',0,'Roberto','','','ventas@delavegasteakhouse.com',0,1,'2025-01-17 01:11:27.011854'),(12,'pbkdf2_sha256$870000$cgqLo2pTWqZZoC0Xfc9c3g$UahGx8GMblhc1HpI28n1ofcso8xAnu0AumkPXC8Alfw=','2025-01-17 03:16:50.630499',0,'Jhonnathan','','','ventas@dalis.com',0,1,'2025-01-17 01:40:00.863038'),(13,'pbkdf2_sha256$870000$uZielNnqcZKmxcuDQXHnrl$JjCACk98bTL+5Vyvifj0zMr4VjZgg03oGQzZ3PqeXpI=','2025-01-17 01:54:39.681625',0,'Sebastian','','','tian1@gmail.com',0,1,'2025-01-17 01:54:37.861292'),(14,'pbkdf2_sha256$870000$ZIjBM72toHZsF2S85LgYeR$4BOLkN1j4nO1IqPvtXMnyNQDKA4kheNdXoUPO238d8A=','2025-01-17 03:19:23.460562',0,'Maria','','','mariahidalgomartinez@gmail.com',0,1,'2025-01-17 02:22:21.814453');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'account','emailaddress'),(15,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(16,'empleos','adecuacion'),(8,'empleos','archivo'),(13,'empleos','candidato'),(12,'empleos','comentario'),(9,'empleos','criterioinclusión'),(11,'empleos','empresa'),(10,'empleos','ofertadeempleo'),(17,'empleos','solicituddeempleo'),(7,'empleos','usuario'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-12-12 18:29:46.298607'),(2,'auth','0001_initial','2024-12-12 18:29:46.809146'),(3,'admin','0001_initial','2024-12-12 18:29:46.928579'),(4,'admin','0002_logentry_remove_auto_add','2024-12-12 18:29:46.934819'),(5,'admin','0003_logentry_add_action_flag_choices','2024-12-12 18:29:46.940430'),(6,'contenttypes','0002_remove_content_type_name','2024-12-12 18:29:47.011391'),(7,'auth','0002_alter_permission_name_max_length','2024-12-12 18:29:47.060888'),(8,'auth','0003_alter_user_email_max_length','2024-12-12 18:29:47.080414'),(9,'auth','0004_alter_user_username_opts','2024-12-12 18:29:47.086577'),(10,'auth','0005_alter_user_last_login_null','2024-12-12 18:29:47.131160'),(11,'auth','0006_require_contenttypes_0002','2024-12-12 18:29:47.134144'),(12,'auth','0007_alter_validators_add_error_messages','2024-12-12 18:29:47.140694'),(13,'auth','0008_alter_user_username_max_length','2024-12-12 18:29:47.195419'),(14,'auth','0009_alter_user_last_name_max_length','2024-12-12 18:29:47.247222'),(15,'auth','0010_alter_group_name_max_length','2024-12-12 18:29:47.262911'),(16,'auth','0011_update_proxy_permissions','2024-12-12 18:29:47.268374'),(17,'auth','0012_alter_user_first_name_max_length','2024-12-12 18:29:47.319598'),(18,'empleos','0001_initial','2024-12-12 18:29:47.340499'),(19,'sessions','0001_initial','2024-12-12 18:29:47.369818'),(20,'empleos','0002_archivo_candidato_comentario_criterioinclusión_and_more','2024-12-12 20:45:05.207831'),(21,'empleos','0003_alter_criterioinclusión_options_and_more','2024-12-12 23:25:18.376653'),(22,'empleos','0004_alter_candidato_grado_discapacidad','2024-12-12 23:29:00.612982'),(23,'account','0001_initial','2024-12-13 04:32:19.530258'),(24,'account','0002_email_max_length','2024-12-13 04:32:19.547069'),(25,'account','0003_alter_emailaddress_create_unique_verified_email','2024-12-13 04:32:19.578304'),(26,'account','0004_alter_emailaddress_drop_unique_email','2024-12-13 04:32:19.619101'),(27,'account','0005_emailaddress_idx_upper_email','2024-12-13 04:32:19.642729'),(28,'account','0006_emailaddress_lower','2024-12-13 04:32:19.653497'),(29,'account','0007_emailaddress_idx_email','2024-12-13 04:32:19.692087'),(30,'account','0008_emailaddress_unique_primary_email_fixup','2024-12-13 04:32:19.703740'),(31,'account','0009_emailaddress_unique_primary_email','2024-12-13 04:32:19.710671'),(32,'empleos','0005_alter_candidato_tipo_usuario_and_more','2024-12-13 16:07:26.415251'),(33,'empleos','0006_candidato_foto_empresa_foto','2024-12-13 19:21:37.219035'),(34,'empleos','0007_alter_candidato_experiencia_laboral_and_more','2024-12-13 20:54:39.308899'),(35,'empleos','0008_adecuacion_empresa_adecuaciones','2024-12-16 16:47:18.625484'),(36,'empleos','0009_ofertadeempleo_criterios_inclusion','2024-12-18 23:31:45.276592'),(37,'empleos','0010_candidato_descripcion_personal_and_more','2025-01-08 02:20:22.030591'),(38,'empleos','0011_alter_candidato_discapacidades','2025-01-08 16:45:19.094571'),(39,'empleos','0012_rename_descripcion_personal_candidato_descripcion_personales','2025-01-09 18:05:59.863946'),(40,'empleos','0013_rename_descripcion_personales_candidato_descripcion_personal','2025-01-09 18:06:20.768622'),(41,'empleos','0014_ofertadeempleo_preguntas','2025-01-12 20:25:47.308697'),(42,'empleos','0015_solicituddeempleo','2025-01-13 00:04:23.682549'),(43,'empleos','0016_solicituddeempleo_estado','2025-01-13 01:27:41.054517'),(44,'empleos','0017_solicituddeempleo_calificada','2025-01-13 02:55:55.764189'),(45,'empleos','0018_solicituddeempleo_analisis_de_ia','2025-01-14 23:16:18.932278');
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
INSERT INTO `django_session` VALUES ('wl93x41lamadh2sbq7jgdo9vdjnp9qq7','.eJxVkMFOwzAMht_F56pKu8RtduTOEyBUOY5DC1syNakYmvbuNLDLbpa_359l34CY0xbLRFuZJZaFqSwpTmcpc_IZjm83-K_hCBfK-TutHhqgAsduOCCOI-qhNdr26oANbFnWSGfZ03SSK0W_EtzfG_hbMFU8LdVl4anniL8kVuA_KX6kllMs6-LaGmkfNLevycvp5ZF9EsyU531aVAjaBrQKOXDoKaBSbLRxot0gDl1g7tmjFd1ZM2j0wSjTcY_a4KiqNEvO9QdyvSzrz35nr-xuuf8Cl-BjdQ:1tWy3D:BAtACPKowT_KV4M6xkEt41Tcc1-wKuLslzs1cN1zGGQ','2025-01-26 13:30:47.565699');
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
  `discapacidades` varchar(25) DEFAULT NULL,
  `user_id` int NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `descripcion_personal` longtext,
  `documentos_adjuntos` varchar(100) DEFAULT NULL,
  `instituciones_educativas` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `empleos_candidato_user_id_8723dcc4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_candidato`
--

LOCK TABLES `empleos_candidato` WRITE;
/*!40000 ALTER TABLE `empleos_candidato` DISABLE KEYS */;
INSERT INTO `empleos_candidato` VALUES (7,'0983647648','Av Quito','https://music.youtube.com/','2025-01-08 01:23:28.380395','candidato','https://www.youtube.com/watch?v=0xJwGXR8LBM','doctorado','[\"Programación\", \"Contabilidad\", \"Reparación de equipos electrónicos\", \"Ventas\", \"Soporte técnico\"]','[\"Liderazgo\", \"Resolución de problemas\", \"Inteligencia emocional\", \"Networking\", \"Resolución de conflictos\"]','{\"Ingles\": \"B2\"}','[{\"tiempo\": \"2 años\", \"empresa\": \"Pronaca\"}]','[\"Scrum master\"]','leve','Discapacidad auditiva',9,'',NULL,'documentos/Recibo.pdf','[{\"nombre\": \"Unniandes\", \"titulo\": \"Ingeniería en software\"}]'),(8,'0936478273','Av Los Laureles Calle 13, Cuenca, Ecuador','https://www.linkedin.com/in/sebasti%C3%A1n-mej%C3%ADa-97123323b/','2025-01-17 01:56:50.699942','candidato','https://sebastianmejia.com.co/','tercer_nivel','[\"Diseño gráfico\", \"Gestión de inventarios\", \"Traducción\"]','[\"Comunicación\", \"Liderazgo\", \"Resolución de problemas\"]','{\"Inglés\": \"B1\"}','[{\"tiempo\": \"3 años\", \"empresa\": \"Almacenes Fiestón\"}]','[\"Atención al cliente\"]',NULL,NULL,13,'',NULL,'documentos/certificados.pdf','[{\"nombre\": \"Universidad Central del Ecuador\", \"titulo\": \"Diseño de interiores\"}]'),(9,'0936474446','Av. Quito e Ibarra frente comercial Pantoja, Santo Domingo, Ecuador','https://www.linkedin.com/in/maria-augusta-hidalgo-martinez-79b620212/?originalSubdomain=ec','2025-01-17 02:23:26.801079','candidato','https://www.instagram.com/maria_mhm19/','bachiller','[\"Contabilidad\", \"Gestión de proyectos\"]','[\"Comunicación\", \"Resolución de problemas\", \"Trabajo en equipo\"]','{\"Inglés\": \"B2\"}','[{\"tiempo\": \"2 años\", \"empresa\": \"Almacenes Pantoja\"}]','[\"Gestión de proyectos - OpenCurse\"]','leve','Discapacidad visual',14,'',NULL,'documentos/curriculumvitaemaria.pdf','[{\"nombre\": \"Colegio Nacional Eloy Alfaro\", \"titulo\": \"Bachiller en ciencias\"}]');
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_criterioinclusión`
--

LOCK TABLES `empleos_criterioinclusión` WRITE;
/*!40000 ALTER TABLE `empleos_criterioinclusión` DISABLE KEYS */;
INSERT INTO `empleos_criterioinclusión` VALUES (1,'Depende de sonidos','Tareas que requieran escuchar alarmas o sonidos específicos. No recomendado para personas con discapacidad auditiva o pérdida de audición.'),(2,'Requiere lectura visual','Trabajos que dependan de lectura visual rápida. No recomendado para personas con discapacidad visual o baja visión.'),(3,'Requiere comunicación verbal','Roles en servicio al cliente que requieran comunicación verbal constante. No recomendado para personas con dificultades del habla o mutismo.'),(4,'Esfuerzos físicos intensos','Tareas que involucren esfuerzos físicos intensos o en lugares inaccesibles. No recomendado para personas con afecciones cardíacas, problemas musculares o movilidad reducida.'),(5,'Toma de decisiones bajo presión','Roles que requieran toma de decisiones complejas bajo presión. No recomendado para personas con trastornos de ansiedad o dificultades para manejar el estrés.'),(6,'Trabajos de alta presión','Trabajos de alta presión, con ruido constante o sin posibilidad de pausas. No recomendado para personas con trastornos de ansiedad, hipertensión o problemas cardíacos.'),(7,'Ambiente ruidoso','Trabajos que se realizan en lugares con niveles altos de ruido constante o intermitente. No recomendado para personas con sensibilidad auditiva o trastornos sensoriales.'),(8,'Requiere atención a detalles visuales','Tareas que demandan identificar pequeños detalles o cambios visuales en el entorno o en documentos. No recomendado para personas con baja visión o discapacidad visual.'),(9,'Posturas prolongadas','Roles que implican estar sentado o de pie durante períodos extendidos sin pausas significativas. No recomendado para personas con problemas de columna o movilidad limitada.'),(10,'Movilidad constante','Trabajos que requieren moverse constantemente de un lugar a otro, como en almacenes o tiendas grandes. No recomendado para personas con movilidad reducida o afecciones musculares.'),(11,'Carga de objetos pesados','Actividades que implican levantar o transportar peso superior a 10 kg de manera repetitiva. No recomendado para personas con problemas de espalda, afecciones musculares o movilidad limitada.'),(12,'Exposición a sustancias químicas','Roles que trabajan directamente con productos químicos, que podrían causar reacciones adversas. No recomendado para personas con alergias, problemas respiratorios o condiciones dermatológicas.'),(13,'Interacción constante con personas','Trabajos en los que se requiere interactuar verbal o físicamente con clientes, colegas o público durante todo el día. No recomendado para personas con fobia social, trastornos de ansiedad o dificultades del habla.'),(14,'Exposición a pantallas','Tareas que implican trabajar frente a pantallas de computadora o dispositivos electrónicos por períodos prolongados. No recomendado para personas con problemas visuales o sensibilidad a la luz.'),(15,'Ambientes al aire libre','Roles que se desempeñan mayormente en exteriores, expuestos a cambios climáticos. No recomendado para personas con alergias graves, problemas respiratorios o sensibilidad a cambios climáticos.'),(16,'Trabajo en turnos nocturnos','Empleos que requieren trabajar regularmente durante la noche o en horarios irregulares. No recomendado para personas con trastornos del sueño o problemas de salud relacionados con ritmos circadianos.'),(17,'Trabajo en altura','Tareas que demandan realizar actividades en escaleras, plataformas o lugares elevados. No recomendado para personas con vértigo, problemas de equilibrio o movilidad limitada.'),(18,'Ambiente controlado por temperatura','Trabajos que se desarrollan en ambientes con temperaturas muy bajas (cámaras frigoríficas) o altas (cocinas industriales). No recomendado para personas con problemas circulatorios o sensibilidad extrema a la temperatura.'),(19,'Velocidad de respuesta alta','Actividades que exigen tomar decisiones o realizar acciones rápidas bajo presión. No recomendado para personas con dificultades motoras o problemas de concentración.'),(20,'Capacidad de concentración prolongada','Roles que requieren mantener altos niveles de atención y concentración durante períodos largos. No recomendado para personas con trastorno por déficit de atención o fatiga mental.'),(21,'Tareas repetitivas','Trabajos que consisten en realizar las mismas tareas o movimientos de manera continua. No recomendado para personas con síndrome del túnel carpiano o trastornos musculoesqueléticos.'),(22,'Uso de herramientas especializadas','Actividades que demandan el uso de maquinaria, herramientas o dispositivos específicos. No recomendado para personas con falta de destreza manual o problemas motores.'),(23,'Trabajo en equipo constante','Empleos donde la mayoría de las tareas se realizan en colaboración con un grupo de personas. No recomendado para personas con fobia social o dificultades para trabajar en grupo.'),(24,'Trabajo en solitario','Roles que exigen realizar las actividades de forma individual, con poca o nula interacción con otros. No recomendado para personas que requieren supervisión constante o apoyo emocional.'),(25,'Dependencia de tecnología','Trabajos que requieren manejar software, sistemas o dispositivos tecnológicos avanzados. No recomendado para personas con poca experiencia en el uso de herramientas digitales.'),(26,'Exposición a riesgo físico','Actividades en las que hay un mayor riesgo de accidentes laborales, como en construcción o minería. No recomendado para personas con problemas de salud que podrían agravarse por accidentes laborales.'),(27,'Requiere desplazamientos frecuentes','Tareas que implican viajar regularmente dentro o fuera de la ciudad. No recomendado para personas con movilidad reducida o problemas de salud que limiten los desplazamientos.'),(28,'Exposición a luz intensa','Roles que requieren trabajar bajo luces brillantes o flashes constantes, como en fotografía o producción audiovisual. No recomendado para personas con fotofobia o sensibilidad ocular.'),(29,'Tolerancia a olores intensos','Trabajos en ambientes donde se perciben fuertes olores, como en fábricas de alimentos o laboratorios. No recomendado para personas con alergias o sensibilidad olfativa.'),(30,'Acceso a espacios reducidos','Tareas que deben realizarse en áreas pequeñas o confinadas, como mantenimiento de maquinaria. No recomendado para personas con claustrofobia o movilidad reducida.'),(31,'Precisión manual','Actividades que exigen un alto nivel de destreza y precisión manual, como ensamblaje o cirugía. No recomendado para personas con temblores o problemas de motricidad fina.'),(32,'Requiere habilidades matemáticas avanzadas','Roles que incluyen cálculos frecuentes o manejo de estadísticas complejas. No recomendado para personas con discalculia o dificultades para el cálculo.'),(33,'Trabajo en horarios extendidos','Empleos que pueden requerir más de las horas regulares de trabajo por día. No recomendado para personas con problemas de salud que requieran descansos regulares.'),(34,'Tolerancia al estrés','Trabajos que involucran situaciones de alta presión o ambientes competitivos. No recomendado para personas con trastornos de ansiedad o depresión.'),(35,'Capacidad de comunicación escrita','Roles donde la redacción de informes o documentos es una tarea principal. No recomendado para personas con dislexia o dificultades en la escritura.'),(36,'Capacidad de seguimiento de instrucciones estrictas','Trabajos que exigen seguir protocolos exactos sin desviaciones. No recomendado para personas con trastornos del desarrollo o dificultades cognitivas.'),(37,'Capacidad de liderazgo','Empleos que demandan supervisar o coordinar a un equipo de trabajo. No recomendado para personas con dificultades para gestionar equipos o tomar decisiones.');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_empresa`
--

LOCK TABLES `empleos_empresa` WRITE;
/*!40000 ALTER TABLE `empleos_empresa` DISABLE KEYS */;
INSERT INTO `empleos_empresa` VALUES (8,'0983746256','Urb. El Centenario','https://www.linkedin.com/company/farmacias-santa-martha/','2024-12-18 15:17:53.717829','empresa','Farmacias Santa Martha','Farmacia - Venta de artículos para la salud, medicamentos y cuidado personal.','Santo Domingo - Av. Esmeraldas y Abraham Calazacon',2,1,''),(9,'0984742982','sdfsdfff','https://music.youtube.com/','2025-01-12 18:03:34.095572','empresa',NULL,NULL,NULL,0,10,''),(10,'0953647387','Av. Chone Km3 Y Av. Bombolí\r\nSanto Domingo De Los Colorados','https://www.linkedin.com/in/jdelavega/','2025-01-17 01:17:19.125986','empresa','De La Vega Steak House','\"Calidad de SUPERMERCADO, a precio de MERCADO\" Somos Productores y Distribuidores de Carnes en general y Cortes Finos','Av. Chone Km3 Y Av. Bombolí Santo Domingo De Los Colorados',4,11,''),(11,'0936289384','Av Cuenca, Santo Domingo de los Colorados, Ecuador','https://www.linkedin.com/in/dalis-garzon-88882b20/','2025-01-17 01:41:22.024603','empresa','Almacén D\'Alis','Venta y alquiler de artículos para fiestas y todo tipo de eventos.','Av Cuenca, Santo Domingo de los Colorados, Ecuador',4,12,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_empresa_adecuaciones`
--

LOCK TABLES `empleos_empresa_adecuaciones` WRITE;
/*!40000 ALTER TABLE `empleos_empresa_adecuaciones` DISABLE KEYS */;
INSERT INTO `empleos_empresa_adecuaciones` VALUES (5,8,1),(6,10,2),(7,10,3);
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
  `preguntas` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empleos_ofertadeempleo_empresa_id_5f61f561_fk_empleos_empresa_id` (`empresa_id`),
  CONSTRAINT `empleos_ofertadeempleo_empresa_id_5f61f561_fk_empleos_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empleos_empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_ofertadeempleo`
--

LOCK TABLES `empleos_ofertadeempleo` WRITE;
/*!40000 ALTER TABLE `empleos_ofertadeempleo` DISABLE KEYS */;
INSERT INTO `empleos_ofertadeempleo` VALUES (7,'Asistente de Farmacia','Estamos buscando un Asistente de Farmacia comprometido y organizado para unirse a nuestro equipo. La persona seleccionada será responsable de brindar atención personalizada a los clientes, gestionar inventarios de medicamentos y apoyar en tareas administrativas. Este es un puesto ideal para alguien con habilidades interpersonales y pasión por la salud.','[\"Experiencia mínima de 1 año en farmacias o puestos relacionados.\", \"Conocimientos básicos de medicamentos y su uso.\", \"Manejo de software para inventario y facturación.\", \"Habilidades de comunicación y servicio al cliente.\", \"Disponibilidad para trabajar en horarios rotativos.\"]','2024-12-19 00:41:08.331844','abierta',8,NULL),(8,'Cajero/a para Farmacia','Buscamos un Cajero/a proactivo/a y responsable para formar parte de nuestro equipo en una reconocida farmacia. La persona seleccionada será responsable de brindar atención directa a los clientes, realizar cobros en caja, gestionar pagos con diversos métodos, y colaborar en la organización del punto de venta. \r\n\r\nEl puesto requiere un enfoque orientado al cliente, precisión en el manejo de dinero y la capacidad de trabajar en equipo en un entorno dinámico y enfocado en la salud y bienestar de todos nuestros clientes.','[\"Experiencia previa como cajero/a, preferentemente en farmacias o tiendas de retail.\", \"Habilidades en manejo de caja y medios de pago electrónicos.\", \"Conocimiento básico de facturación y emisión de comprobantes.\", \"Orientación al cliente y capacidad de resolución de problemas.\", \"Buenas habilidades de comunicación y trato amable.\", \"Disponibilidad para trabajar en turnos rotativos.\", \"Conocimientos básicos en el uso de sistemas de gestión de ventas (deseable).\", \"Secundaria completa (requisito mínimo).\"]','2025-01-12 20:43:07.110268','abierta',8,'[\"¿Qué harías si al final de tu turno el cierre de caja no cuadra con lo esperado?\", \"¿Cómo te aseguras de que no haya errores al dar cambio al cliente?\", \"¿Sabes emitir facturas y comprobantes fiscales?\", \"¿Qué pasos sigues para realizar un arqueo y cierre de caja correctamente?\"]'),(9,'Supervisor de Producción y Ventas de Carnes Premium','Estamos en busca de un Supervisor de Producción y Ventas para nuestro local especializado en carnes en general y cortes finos. El candidato ideal será responsable de coordinar las operaciones diarias, supervisar el procesamiento de carnes, garantizar los estándares de calidad y atender a clientes mayoristas y minoristas.\r\n\r\nEste puesto requiere conocimientos en selección de cortes premium, control de inventarios y estrategias de ventas para maximizar la rentabilidad.','[\"Experiencia mínima de 2 años en el sector cárnico, producción o ventas de carnes premium.\", \"Conocimientos en clasificación de cortes finos, almacenamiento y conservación de carne.\", \"Habilidad para trabajar en entornos fríos y manejar herramientas de corte.\", \"Capacidad para liderar equipos y resolver problemas operativos.\", \"Excelentes habilidades de comunicación y servicio al cliente.\", \"Disponibilidad para horarios rotativos o fines de semana (según necesidades del negocio).\"]','2025-01-17 01:29:00.120230','abierta',10,'[\"¿Qué estrategias utilizarías para mejorar la rotación y frescura de los productos?\", \"¿Cómo manejarías una queja de un cliente sobre la calidad de un corte?\", \"¿Tienes experiencia supervisando equipos de trabajo? ¿Cómo motivarías a tu equipo?\", \"¿Has trabajado con proveedores para la adquisición de carne? ¿Cómo manejas la negociación?\"]'),(10,'Carnicero Especializado en Cortes Finos','Buscamos un Carnicero Especializado en Cortes Finos para unirse a nuestro equipo. Este rol es clave en la preparación y presentación de cortes de carne de alta calidad para clientes mayoristas y minoristas.\r\n\r\nEl candidato ideal tendrá experiencia en técnicas de despiece, selección de cortes premium y conocimiento de estándares de calidad e higiene. Se espera que asesore a los clientes en la elección de cortes y garantice una óptima manipulación de los productos cárnicos.','[\"Experiencia mínima de 1 año en carnicería o manejo de cortes finos.\", \"Habilidad en el uso de cuchillos y sierras de corte.\", \"Conocimiento sobre almacenamiento y conservación de carnes.\", \"Atención al detalle para garantizar la calidad y presentación de los cortes.\", \"Buen trato con clientes y capacidad para trabajar en equipo.\", \"Disponibilidad para horarios rotativos o fines de semana.\"]','2025-01-17 01:32:41.134639','abierta',10,'[\"¿Qué herramientas de corte has utilizado y cuál es tu nivel de habilidad con ellas?\", \"¿Cómo garantizarías la frescura y calidad de los productos que manipulas?\", \"¿Qué harías si un cliente solicita un corte especial que no está disponible en exhibición?\"]'),(11,'Asesor de Ventas y Alquiler de Artículos para Eventos','Buscamos un Asesor de Ventas y Alquiler de Artículos para Eventos para atender a nuestros clientes, ayudándolos a encontrar los artículos ideales para sus celebraciones. El candidato ideal tendrá habilidades de atención al cliente, experiencia en ventas y conocimientos sobre decoración y planificación de eventos.\r\n\r\nSu función principal será guiar a los clientes en la elección de productos y coordinar el alquiler de mobiliario, arreglos y otros accesorios, asegurando una experiencia satisfactoria y eficiente.','[\"Experiencia mínima de 1 año en ventas, atención al cliente o eventos.\", \"Habilidades en asesoría y negociación con clientes.\", \"Conocimientos básicos en decoración y montaje de eventos.\", \"Capacidad para trabajar en equipo y bajo presión en temporadas altas.\", \"Actitud proactiva y atención al detalle.\", \"Disponibilidad para horarios rotativos y fines de semana.\"]','2025-01-17 01:46:31.323847','abierta',11,'[\"¿Cómo resolverías una queja de un cliente sobre un artículo alquilado que llegó en mal estado?\", \"¿Cómo manejarías una situación en la que dos clientes quieren reservar el mismo artículo para la misma fecha?\", \"¿Cómo ayudarías a mejorar la experiencia de los clientes en la tienda?\"]'),(12,'Coordinador de Montaje y Logística de Eventos','Buscamos un Coordinador de Montaje y Logística de Eventos para gestionar la entrega, instalación y recolección de artículos alquilados para eventos. Este puesto es clave para garantizar que los clientes reciban sus productos en tiempo y forma, asegurando un montaje eficiente y acorde a sus expectativas.\r\n\r\nEl candidato ideal tendrá habilidades organizativas, experiencia en logística y montaje de eventos, y capacidad para resolver problemas en tiempo real.','[\"Experiencia mínima de 1 año en logística, montaje de eventos o transporte.\", \"Capacidad para levantar y mover mobiliario pesado con precaución.\", \"Habilidades organizativas y de trabajo en equipo.\"]','2025-01-17 01:50:18.802426','abierta',11,'[\"¿Cómo manejarías un retraso en la entrega de mobiliario a un evento importante?\", \"¿Qué medidas tomarías para garantizar la seguridad de los artículos durante el transporte?\"]'),(13,'Diseñador y Decorador de Eventos','Estamos en busca de un Diseñador y Decorador de Eventos apasionado por la creatividad y la planificación de ambientes festivos. Este puesto se encargará de diseñar, coordinar y ejecutar decoraciones para todo tipo de celebraciones, asegurando que cada evento tenga un estilo único y personalizado.\r\n\r\nEl candidato ideal tendrá experiencia en decoración de eventos, conocimiento en tendencias actuales y habilidades para transformar espacios con globos, telas, luces y arreglos temáticos.','[\"Experiencia mínima de 1 año en decoración de eventos, diseño de interiores o afines.\", \"Habilidades en manualidades, diseño de espacios y montaje decorativo.\", \"Creatividad y capacidad para desarrollar nuevas propuestas.\", \"Habilidad para trabajar bajo presión y cumplir con plazos ajustados.\", \"Atención al detalle y compromiso con la satisfacción del cliente.\", \"Disponibilidad para horarios flexibles y fines de semana.\"]','2025-01-17 01:53:38.656377','abierta',11,'[\"¿Cómo manejarías un cliente que no está satisfecho con la propuesta de decoración?\", \"¿Qué harías si un cliente pide un cambio de última hora en el montaje del evento?\"]');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_ofertadeempleo_criterios_inclusion`
--

LOCK TABLES `empleos_ofertadeempleo_criterios_inclusion` WRITE;
/*!40000 ALTER TABLE `empleos_ofertadeempleo_criterios_inclusion` DISABLE KEYS */;
INSERT INTO `empleos_ofertadeempleo_criterios_inclusion` VALUES (12,8,2),(13,8,3),(15,8,9),(14,8,16),(16,8,30),(17,8,37),(18,9,2),(19,9,3),(21,9,5),(22,9,8),(20,9,37),(23,10,3),(24,10,8),(25,10,9),(26,10,10),(27,10,23),(29,11,3),(30,11,4),(31,11,8),(32,11,10),(33,11,21),(34,11,31),(28,11,34),(35,12,4),(36,12,5),(37,12,7),(38,12,15),(39,12,26),(40,13,3),(41,13,4),(42,13,6),(43,13,15),(44,13,19),(45,13,23);
/*!40000 ALTER TABLE `empleos_ofertadeempleo_criterios_inclusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos_solicituddeempleo`
--

DROP TABLE IF EXISTS `empleos_solicituddeempleo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleos_solicituddeempleo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `respuestas` json DEFAULT NULL,
  `fecha_solicitud` datetime(6) NOT NULL,
  `candidato_id` bigint NOT NULL,
  `oferta_id` bigint NOT NULL,
  `estado` varchar(20) NOT NULL,
  `calificada` tinyint(1) NOT NULL,
  `analisis_de_ia` longtext,
  PRIMARY KEY (`id`),
  KEY `empleos_solicituddee_candidato_id_6d4eaf12_fk_empleos_c` (`candidato_id`),
  KEY `empleos_solicituddee_oferta_id_85d53e2c_fk_empleos_o` (`oferta_id`),
  CONSTRAINT `empleos_solicituddee_candidato_id_6d4eaf12_fk_empleos_c` FOREIGN KEY (`candidato_id`) REFERENCES `empleos_candidato` (`id`),
  CONSTRAINT `empleos_solicituddee_oferta_id_85d53e2c_fk_empleos_o` FOREIGN KEY (`oferta_id`) REFERENCES `empleos_ofertadeempleo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_solicituddeempleo`
--

LOCK TABLES `empleos_solicituddeempleo` WRITE;
/*!40000 ALTER TABLE `empleos_solicituddeempleo` DISABLE KEYS */;
INSERT INTO `empleos_solicituddeempleo` VALUES (1,'{\"respuesta_1\": \"Pongo de mi plata\", \"respuesta_2\": \"Le digo al cliente que cuente\", \"respuesta_3\": \"Nop\", \"respuesta_4\": \"No sé qué es arqueo\", \"respuesta_5\": \"Le digo al cliente que vaya retire mejor\"}','2025-01-13 00:49:55.056480',7,8,'aceptada',1,NULL),(2,'{}','2025-01-13 00:54:27.450536',7,7,'pendiente',1,NULL),(9,'{}','2025-01-14 01:45:29.040780',7,7,'rechazada',0,NULL),(10,'{}','2025-01-15 01:06:12.214800',7,7,'pendiente',0,'El candidato actual tiene un 40% de ser apto para esta oferta laboral.\n\nEl candidato presenta algunas fortalezas relevantes para el puesto de Asistente de Farmacia, pero también varias debilidades significativas. A continuación se detallan los aspectos más relevantes:\n\n**Fortalezas:**\n1. **Habilidades de comunicación y servicio al cliente:** Aunque no se menciona explícitamente, el nivel de inglés B2 sugiere que el candidato podría tener buenas habilidades de comunicación, lo cual es valioso para la atención al cliente en una farmacia.\n2. **Experiencia laboral:** El candidato tiene experiencia laboral previa en Pronaca, lo que indica que tiene experiencia en un entorno profesional. Sin embargo, no está claro si esta experiencia está relacionada con farmacias o servicios de salud.\n\n**Debilidades:**\n1. **Experiencia específica en farmacias:** La oferta requiere al menos un año de experiencia en farmacias o puestos relacionados, pero el candidato no menciona experiencia directa en este tipo de entorno.\n2. **Conocimientos básicos de medicamentos:** No hay indicios de que el candidato posea conocimientos sobre medicamentos y su uso, que es un requisito clave para este puesto.\n3. **Manejo de software para inventario y facturación:** Aunque el candidato tiene habilidades técnicas en programación, no se especifica experiencia con software específico para inventarios y facturación en farmacias.\n4. **Disponibilidad para horarios rotativos:** No se menciona la disponibilidad del candidato para trabajar en horarios rotativos, lo cual es un requisito del puesto.\n5. **Nivel de estudios:** El candidato tiene un grado en Ingeniería en Software, que no se alinea directamente con el campo de la salud o farmacia.\n\nEn resumen, aunque el candidato tiene habilidades técnicas y experiencia laboral, carece de experiencia específica y conocimientos en el ámbito farmacéutico, lo cual es crítico para el puesto de Asistente de Farmacia.'),(11,'{\"respuesta_1\": \"Verificar que sea de proveedores de calidad\", \"respuesta_2\": \"Explicándole los motivos de por qué si es de calidad \", \"respuesta_3\": \"Sí tengo experiencia y lo motivaría con recompensas\", \"respuesta_4\": \"Sí he trabajado con proveedores y me gusta negociar llegando a acuerdos de beneficio mutuo\"}','2025-01-17 02:14:22.606046',8,9,'pendiente',0,'El candidato actual tiene un 50% de ser apto para esta oferta laboral.\n\n**Fortalezas:**\n1. **Experiencia en Supervisión y Motivación de Equipos:** El candidato afirma tener experiencia supervisando equipos de trabajo y menciona estrategias de motivación, lo cual es crucial para el rol de liderazgo requerido.\n2. **Habilidades de Atención al Cliente:** Ha tomado cursos certificados en atención al cliente, lo que es relevante para manejar quejas y asegurar una experiencia positiva para los clientes.\n3. **Conocimientos de Negociación con Proveedores:** Ha trabajado con proveedores y tiene experiencia en negociación, lo cual es importante para la adquisición de carne y gestión de relaciones con proveedores.\n\n**Debilidades:**\n1. **Falta de Experiencia Específica en el Sector Cárnico:** No se menciona experiencia directa en el sector cárnico, producción o ventas de carnes premium, lo cual es un requisito fundamental del puesto.\n2. **Educación no Relacionada con el Puesto:** El candidato tiene formación en Diseño de Interiores, que no se alinea directamente con los requisitos técnicos de selección de cortes premium o manejo de carnes.\n3. **Conocimientos Técnicos No Relevantes:** Las habilidades técnicas indicadas, como diseño gráfico y traducción, no son necesarias para este puesto específico.\n4. **Nivel de Inglés:** Un nivel B1 en inglés puede ser limitado si el puesto requiere interacción con proveedores o clientes internacionales que requieran un nivel más avanzado de comunicación.\n\nEn resumen, aunque el candidato tiene habilidades valiosas en liderazgo y atención al cliente, carece de la experiencia y conocimientos específicos en el sector cárnico que son críticos para el éxito en este puesto.'),(12,'{\"respuesta_1\": \"Verificar que sea de proveedores de calidad\", \"respuesta_2\": \"Explicándole los motivos de por qué si es de calidad \", \"respuesta_3\": \"Sí tengo experiencia y lo motivaría con recompensas\", \"respuesta_4\": \"Sí he trabajado con proveedores y me gusta negociar llegando a acuerdos de beneficio mutuo\"}','2025-01-17 02:14:24.456318',8,9,'pendiente',0,'El candidato actual tiene un 40% de ser apto para esta oferta laboral.\n\nEl candidato posee algunas habilidades y experiencias relevantes, pero también presenta varias áreas donde no cumple con los requisitos del puesto. A continuación, se detallan las fortalezas y debilidades del candidato en relación con la oferta:\n\n**Fortalezas:**\n1. **Experiencia en Atención al Cliente:** El candidato ha realizado un curso certificado en atención al cliente, lo cual es beneficioso para el rol que requiere excelentes habilidades de comunicación y servicio al cliente.\n2. **Experiencia Supervisando Equipos:** Según sus respuestas, el candidato tiene experiencia supervisando equipos de trabajo, lo cual es crucial para un puesto de supervisión.\n3. **Capacidad de Negociación:** La experiencia previa con proveedores y su interés en llegar a acuerdos de beneficio mutuo indican habilidades útiles para la gestión de proveedores.\n\n**Debilidades:**\n1. **Falta de Experiencia Específica en el Sector Cárnico:** No se menciona experiencia directa en el sector cárnico, producción o ventas de carnes premium, lo cual es un requisito fundamental para el puesto.\n2. **Conocimientos Técnicos en Cortes de Carne:** No hay evidencia de conocimientos en clasificación de cortes finos, almacenamiento y conservación de carne, que son esenciales para supervisar el procesamiento de carnes.\n3. **Educación No Relacionada con el Puesto:** El candidato tiene un título en Diseño de Interiores, lo cual no está relacionado con las funciones del puesto de Supervisor de Producción y Ventas de Carnes Premium.\n4. **Habilidades Técnicas No Relevantes:** Aunque el candidato tiene habilidades en diseño gráfico y traducción, estas no son relevantes para los requisitos técnicos del puesto.\n5. **Idiomas y Disponibilidad:** El nivel de inglés B1 podría ser una limitación si se requiere un nivel más alto para atender a clientes internacionales. Además, no se menciona disponibilidad para horarios rotativos o fines de semana.\n\nEn resumen, aunque el candidato muestra potencial en ciertas áreas como la supervisión de equipos y atención al cliente, carece de la experiencia y conocimientos específicos necesarios para el sector cárnico, lo cual limita significativamente su aptitud para el puesto.'),(13,'{\"respuesta_1\": \"Cuchillos pero no tengo mucha habilidad\", \"respuesta_2\": \"Verificando proveedores y fechas de caducidad\", \"respuesta_3\": \"No podría hacer nada al respecto\"}','2025-01-17 02:15:45.126968',8,10,'pendiente',0,'El candidato actual tiene un 40% de ser apto para esta oferta laboral.\n\nRazones de evaluación:\n\nFortalezas:\n1. **Experiencia Laboral**: El candidato cuenta con más de tres años de experiencia en Almacenes Fiestón, lo que sugiere cierta familiaridad con el entorno de trabajo relacionado con la atención al cliente y posiblemente con la gestión de inventarios, aunque no específicamente en carnicería.\n2. **Atención al Cliente**: Ha realizado un curso certificado en atención al cliente, lo cual es relevante para asesorar a los clientes en la elección de cortes, un aspecto importante del rol.\n\nDebilidades:\n1. **Experiencia Específica en Carnicería**: No se menciona experiencia específica en carnicería o manejo de cortes finos, que es un requisito fundamental para el puesto.\n2. **Habilidad con Herramientas de Corte**: El candidato indica haber utilizado cuchillos pero admite no tener mucha habilidad, lo cual es una debilidad significativa dado que la habilidad en el uso de cuchillos y sierras de corte es esencial para el rol.\n3. **Conocimiento Técnico**: No se evidencia conocimiento específico sobre técnicas de despiece, selección de cortes premium, o estándares de calidad e higiene, que son cruciales para el puesto.\n4. **Educación**: Posee un título en Diseño de Interiores, que no está alineado con las necesidades técnicas del puesto de carnicero.\n5. **Respuesta a Situaciones de Ventas**: La respuesta sobre cómo manejar una solicitud de un corte especial es inadecuada, mostrando falta de iniciativa o resolución de problemas en situaciones de atención al cliente.\n\nEn resumen, aunque el candidato tiene fortalezas en atención al cliente y experiencia laboral general, carece de la experiencia específica y habilidades técnicas necesarias para desempeñar eficazmente el rol de Carnicero Especializado en Cortes Finos.'),(14,'{\"respuesta_1\": \"Llamaría al supervisor\", \"respuesta_2\": \"Le entrego al que reservó primero\", \"respuesta_3\": \"Dejo que ellos observen solos\"}','2025-01-17 02:16:46.677414',8,11,'pendiente',0,'El candidato actual tiene un 70% de ser apto para esta oferta laboral. \n\nEl candidato muestra fortalezas significativas que se alinean con los requisitos del puesto. Su experiencia laboral de más de 3 años en \"Almacenes Fiestón\" sugiere que tiene una sólida base en ventas y atención al cliente, superando el requisito mínimo de un año. Además, su formación en \"Diseño de interiores\" en la Universidad Central del Ecuador indica que posee conocimientos relevantes en decoración, lo cual es un plus para el papel de asesor en eventos.\n\nEn cuanto a habilidades blandas, el candidato tiene un curso certificado en atención al cliente, lo cual es crucial para el rol de asesor. Sin embargo, las respuestas proporcionadas a las preguntas situacionales son bastante básicas y podrían indicar una falta de proactividad o creatividad en la resolución de problemas, lo cual es una debilidad. \n\nEn términos de habilidades técnicas, el candidato no menciona experiencia específica en gestión de inventarios o diseño gráfico, que aunque no son requisitos críticos, podrían aportar un valor añadido al rol. Su nivel de inglés es B1, que es un nivel intermedio, lo cual es adecuado para comunicación básica pero podría no ser suficiente si se requiere una interacción más fluida con clientes angloparlantes.\n\nFinalmente, la disponibilidad para horarios rotativos y fines de semana no se menciona explícitamente, lo que podría ser una limitación dependiendo de sus compromisos personales. En resumen, el candidato tiene una buena base para el puesto, pero hay áreas de mejora en cuanto a habilidades de resolución de problemas y posiblemente en la flexibilidad de horarios.'),(15,'{\"respuesta_1\": \"Lo reemplazo con mobiliario en stock\", \"respuesta_2\": \"Ninguna, ya que no creo que se dañen\"}','2025-01-17 02:17:38.080550',8,12,'pendiente',0,'El candidato actual tiene un 70% de ser apto para esta oferta laboral. \n\nEl candidato tiene una experiencia laboral de 3 años y 3 meses en Almacenes Fiestón, lo cual supera el requisito mínimo de un año de experiencia en logística o montaje de eventos. Esto es una fortaleza significativa, ya que demuestra que tiene experiencia directa en el campo relevante. Además, el candidato posee habilidades organizativas y de trabajo en equipo, esenciales para el puesto.\n\nEn cuanto a la educación, el candidato tiene un título de tercer nivel en Diseño de Interiores de la Universidad Central del Ecuador, lo que cumple con el requisito educativo. Sin embargo, la relevancia directa de este campo de estudio para la logística de eventos no es del todo clara, aunque podría aportar en términos de diseño y estética de eventos.\n\nEl candidato tiene habilidades blandas como comunicación, liderazgo y resolución de problemas, que son cruciales para manejar situaciones de presión y coordinar equipos. Sin embargo, su respuesta a la pregunta sobre cómo manejaría un retraso en la entrega de mobiliario es algo limitada y podría reflejar una falta de preparación para situaciones imprevistas, lo cual es una debilidad.\n\nEn cuanto a la capacidad física, no se menciona explícitamente si el candidato puede levantar y mover mobiliario pesado, lo cual es un requisito importante para el rol. Tampoco se aborda cómo garantizaría la seguridad de los artículos durante el transporte, lo que podría ser un área de mejora en su enfoque.\n\nFinalmente, el nivel de inglés del candidato es B1, lo cual puede ser suficiente dependiendo de las necesidades específicas del puesto en cuanto a comunicación con clientes o proveedores internacionales.\n\nEn resumen, el candidato tiene una base sólida de experiencia y habilidades, pero hay áreas donde se podría mejorar su aptitud para el puesto, especialmente en la preparación para imprevistos y la capacidad física.'),(16,'{\"respuesta_1\": \"Sugiero cambios en base a sus gustos\", \"respuesta_2\": \"Lo tomo en cuenta si es un cambio pequeño\"}','2025-01-17 02:18:46.382329',8,13,'pendiente',0,'El candidato actual tiene un 75% de ser apto para esta oferta laboral. \n\nRazones:\n\n1. **Experiencia Laboral**: El candidato cuenta con más de 3 años de experiencia en Almacenes Fiestón, lo cual supera el requisito mínimo de 1 año en decoración de eventos o áreas afines. Esto indica un buen nivel de experiencia práctica en el campo.\n\n2. **Educación**: Posee un título de tercer nivel en Diseño de Interiores de la Universidad Central del Ecuador, lo cual es relevante y cumple con el requisito del nivel de estudios. Esto sugiere una formación académica sólida en diseño, que es fundamental para el rol.\n\n3. **Habilidades Técnicas**: Aunque el diseño gráfico es una habilidad técnica mencionada, no se especifica si el candidato tiene experiencia en esta área. Sin embargo, su formación en diseño de interiores puede implicar conocimientos básicos en diseño gráfico. La gestión de inventarios y la traducción no se mencionan en su perfil, lo que podría ser una debilidad si estos son aspectos críticos para la oferta.\n\n4. **Habilidades Blandas**: El candidato ha realizado un curso certificado en atención al cliente, lo cual es relevante para la satisfacción del cliente, uno de los requisitos del puesto. Además, sus respuestas a las preguntas sobre manejo de clientes sugieren una buena capacidad de comunicación y resolución de problemas.\n\n5. **Idiomas**: El nivel de inglés B1 es adecuado para el puesto, ya que no se especifica un nivel más alto como requisito.\n\n6. **Disponibilidad y Flexibilidad**: No se menciona explícitamente su disponibilidad para horarios flexibles y fines de semana, pero al haber trabajado en un entorno de eventos, es probable que esté acostumbrado a estos horarios.\n\nEn conclusión, el candidato muestra fortalezas importantes en experiencia y educación, así como en habilidades blandas relevantes para el puesto. Sin embargo, la falta de información sobre ciertas habilidades técnicas y su disponibilidad podría ser un área de mejora para cumplir completamente con los requisitos del puesto.'),(17,'{\"respuesta_1\": \"Pongo de mi dinero\", \"respuesta_2\": \"Cuento 2 veces el cambio\", \"respuesta_3\": \"No\", \"respuesta_4\": \"Ninguno\"}','2025-01-17 02:27:13.411487',9,8,'pendiente',0,'El candidato actual tiene un 60% de ser apto para esta oferta laboral.\n\n**Fortalezas:**\n1. **Experiencia Laboral:** El candidato tiene experiencia previa de más de dos años en un entorno similar (Almacenes Pantoja), lo cual es relevante para el puesto de cajero en una farmacia o tienda de retail.\n2. **Educación:** Cumple con el requisito mínimo de educación, ya que posee un bachillerato en ciencias.\n3. **Habilidades Blandas:** Demuestra habilidades de resolución de problemas y trabajo en equipo, que son esenciales para el puesto.\n4. **Disponibilidad:** No hay indicios de que el candidato tenga restricciones para trabajar en turnos rotativos, lo cual es un requisito para el puesto.\n\n**Debilidades:**\n1. **Conocimientos Técnicos:** El candidato no tiene experiencia en la emisión de facturas y comprobantes fiscales, lo cual es un requisito importante para el manejo de caja en una farmacia.\n2. **Habilidades en Manejo de Caja:** Aunque tiene experiencia previa, sus respuestas sugieren una falta de confianza o conocimiento en procedimientos estándar de caja, como el arqueo y cierre correcto.\n3. **Habilidades Técnicas y Certificaciones:** Aunque ha realizado un curso de gestión de proyectos, no se menciona experiencia ni habilidades específicas en contabilidad o sistemas de gestión de ventas, que son deseables para el puesto.\n4. **Conocimiento de Idiomas:** No se menciona el nivel de inglés, que podría ser relevante dependiendo del entorno de trabajo de la farmacia.\n\nEn resumen, el candidato tiene una base sólida de experiencia y habilidades blandas, pero carece de algunos conocimientos técnicos específicos requeridos para el puesto, lo que reduce su aptitud general para la oferta laboral.'),(18,'{\"respuesta_1\": \"Revisar los proveedores y sus resultados\", \"respuesta_2\": \"Escucharía si tiene la razón\", \"respuesta_3\": \"No tengo experiencia pero puedo aprender\", \"respuesta_4\": \"Sí, la negociacion es en base al beneficio mutuo\"}','2025-01-17 02:28:40.205419',9,9,'rechazada',0,'El candidato actual tiene un 65% de ser apto para esta oferta laboral. \n\nEl candidato cumple con algunos requisitos importantes para el puesto de Supervisor de Producción y Ventas de Carnes Premium. Tiene una experiencia de más de dos años en Almacenes Pantoja, lo cual es relevante dado que se requiere experiencia mínima de dos años en el sector cárnico. Además, ha cursado un certificado en gestión de proyectos, lo cual podría ser útil para coordinar operaciones diarias y resolver problemas operativos.\n\nEn cuanto a las habilidades técnicas y blandas, el candidato tiene formación en gestión de proyectos y habilidades en comunicación y resolución de problemas, lo cual es crucial para el liderazgo y servicio al cliente que el puesto demanda. Su nivel de inglés B2 también es un punto positivo, aunque no es un requisito explícito del puesto.\n\nSin embargo, el candidato presenta algunas debilidades significativas. No tiene experiencia previa supervisando equipos de trabajo, lo cual es un requisito esencial para el rol de liderazgo que se busca. Además, no ha demostrado tener conocimientos específicos en clasificación de cortes finos o estrategias de ventas para maximizar la rentabilidad, áreas clave para el desempeño exitoso en este puesto. Su respuesta sobre la falta de experiencia supervisando equipos sugiere una falta de preparación en este aspecto, aunque muestra disposición para aprender.\n\nFinalmente, la discapacidad visual leve podría requerir ciertas adaptaciones en un entorno que requiere atención a detalles visuales, pero no parece ser un impedimento mayor para el desempeño del rol, siempre y cuando se proporcionen las herramientas adecuadas. \n\nEn conclusión, el candidato tiene fortalezas en experiencia general y habilidades blandas, pero carece de experiencia específica y conocimientos técnicos críticos para el puesto.');
/*!40000 ALTER TABLE `empleos_solicituddeempleo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-16 22:23:22
