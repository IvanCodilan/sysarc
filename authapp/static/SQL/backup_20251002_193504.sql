-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: brgy_570_prtl
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (3,'Admin'),(1,'AdminUser'),(2,'LimitedUser');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,2,29);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add person information',7,'add_personinformation'),(26,'Can change person information',7,'change_personinformation'),(27,'Can delete person information',7,'delete_personinformation'),(28,'Can view person information',7,'view_personinformation'),(29,'Can add Certificate Log',8,'add_certificatelog'),(30,'Can change Certificate Log',8,'change_certificatelog'),(31,'Can delete Certificate Log',8,'delete_certificatelog'),(32,'Can view Certificate Log',8,'view_certificatelog'),(33,'Can add barangay official',9,'add_barangayofficial'),(34,'Can change barangay official',9,'change_barangayofficial'),(35,'Can delete barangay official',9,'delete_barangayofficial'),(36,'Can view barangay official',9,'view_barangayofficial'),(37,'Can add activity log',10,'add_activitylog'),(38,'Can change activity log',10,'change_activitylog'),(39,'Can delete activity log',10,'delete_activitylog'),(40,'Can view activity log',10,'view_activitylog'),(41,'Can add password reset token',11,'add_passwordresettoken'),(42,'Can change password reset token',11,'change_passwordresettoken'),(43,'Can delete password reset token',11,'delete_passwordresettoken'),(44,'Can view password reset token',11,'view_passwordresettoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$24QAHdIsY61TYcbEK5Y2MW$T3iHK+1DIAELjgYR1wgQSaTZMRUyYI92A+RLp3oIWHw=','2025-10-01 08:29:24.905858',1,'cdln','','','cdln@gmail.com',1,1,'2025-03-25 10:34:10.162063'),(2,'pbkdf2_sha256$720000$VYD57EF4H2IfarUhcsijOr$iwsLVVFnAAsTurZWqhw54cRb2UyT9uKCqEL/qm2Mm0s=','2025-10-02 11:35:00.723518',1,'admin','','','nepomucenoluis53@gmail.com',1,1,'2025-10-01 09:19:34.009356'),(3,'pbkdf2_sha256$720000$vD8sH8BE5KrpUVoAZWKiBh$5uegZbA4P/f4IsozlQsF7MkrgxTCtZgcRtinJvrCa7M=','2025-10-02 08:35:31.279713',0,'moderator','','','',1,1,'2025-10-01 09:19:34.974307');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,3),(2,3,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authapp_barangayofficial`
--

DROP TABLE IF EXISTS `authapp_barangayofficial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authapp_barangayofficial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `committee` varchar(50) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authapp_barangayofficial`
--

LOCK TABLES `authapp_barangayofficial` WRITE;
/*!40000 ALTER TABLE `authapp_barangayofficial` DISABLE KEYS */;
INSERT INTO `authapp_barangayofficial` VALUES (1,'Punong Barangay','GIANNIS ANTETOKOUNMPO','None',1),(2,'Kagawad','JOCELYN F. DUTONG','Appropriation',2),(3,'Kagawad','BRYAN MORRIS S. ABABAO','Clean & Beautification',3),(4,'Kagawad','SIMONE JULIENNE T. SORIO','Women, Children, & Elderly',4),(5,'Kagawad','FREDIE C. ARAMBULO ','Health & Sanitation',5),(6,'Kagawad','ROSA MAIA L. LACAP','Peace & Order',6),(7,'Kagawad','MICKO T. GOMEZ','Youth & Education',7),(8,'Kagawad','MANOLITO G. GERADO','Ways & Means',8),(9,'Secretary','KONRAD KENNEDY D. MARTINEZ','None',9),(10,'Treasurer','ROSE ANN R. SANTOS','None',10),(11,'SK Chairman','SERGS MATTHEW RAVALO','None',11);
/*!40000 ALTER TABLE `authapp_barangayofficial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authapp_certificatelog`
--

DROP TABLE IF EXISTS `authapp_certificatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authapp_certificatelog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `certificate_type` varchar(100) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `resident_name` varchar(255) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `resident_id` bigint(20) DEFAULT NULL,
  `certificate_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificate_number` (`certificate_number`),
  KEY `authapp_certificatelog_admin_id_efca4934_fk_auth_user_id` (`admin_id`),
  KEY `authapp_certificatel_resident_id_0d55f648_fk_authapp_p` (`resident_id`),
  CONSTRAINT `authapp_certificatel_resident_id_0d55f648_fk_authapp_p` FOREIGN KEY (`resident_id`) REFERENCES `authapp_personinformation` (`id`),
  CONSTRAINT `authapp_certificatelog_admin_id_efca4934_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=388 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authapp_certificatelog`
--

LOCK TABLES `authapp_certificatelog` WRITE;
/*!40000 ALTER TABLE `authapp_certificatelog` DISABLE KEYS */;
INSERT INTO `authapp_certificatelog` VALUES (387,'Proof Of Residency','Proof of Residency','2025-10-02 09:17:50.022331','Rafael Rod Jalmasco',2,2211,'BRGY570-2025-000001');
/*!40000 ALTER TABLE `authapp_certificatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authapp_passwordresettoken`
--

DROP TABLE IF EXISTS `authapp_passwordresettoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authapp_passwordresettoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `authapp_passwordresettoken_user_id_9936e1dd_fk_auth_user_id` (`user_id`),
  CONSTRAINT `authapp_passwordresettoken_user_id_9936e1dd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authapp_passwordresettoken`
--

LOCK TABLES `authapp_passwordresettoken` WRITE;
/*!40000 ALTER TABLE `authapp_passwordresettoken` DISABLE KEYS */;
INSERT INTO `authapp_passwordresettoken` VALUES (4,'fd3a0b4f92a544139ce3df937eab1df0','2025-10-01 08:41:59.561166',0,1);
/*!40000 ALTER TABLE `authapp_passwordresettoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authapp_personinformation`
--

DROP TABLE IF EXISTS `authapp_personinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authapp_personinformation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `region` varchar(100) DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `street_number` varchar(20) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `civil_status` varchar(9) NOT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `relationship_to_household_head` varchar(100) DEFAULT NULL,
  `educational_background` varchar(20) DEFAULT NULL,
  `pwd_status` varchar(3) NOT NULL,
  `voter_status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authapp_personinformation`
--

LOCK TABLES `authapp_personinformation` WRITE;
/*!40000 ALTER TABLE `authapp_personinformation` DISABLE KEYS */;
INSERT INTO `authapp_personinformation` VALUES (2211,'NCR','BF Homes','Jalmasco','Rafael','Rod','033','Nunez Extension','Paranaque','Zamboanga del Sur','2025-10-02','Cavite Silang','Female','Single','none','Filipino','Brother','No Formal Education','PWD','Non-Voter');
/*!40000 ALTER TABLE `authapp_personinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(10,'authapp','activitylog'),(9,'authapp','barangayofficial'),(8,'authapp','certificatelog'),(11,'authapp','passwordresettoken'),(7,'authapp','personinformation'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-06-09 10:03:31.073935'),(2,'auth','0001_initial','2025-06-09 10:03:31.874413'),(3,'admin','0001_initial','2025-06-09 10:03:32.121948'),(4,'admin','0002_logentry_remove_auto_add','2025-06-09 10:03:32.143670'),(5,'admin','0003_logentry_add_action_flag_choices','2025-06-09 10:03:32.171154'),(6,'contenttypes','0002_remove_content_type_name','2025-06-09 10:03:32.307174'),(7,'auth','0002_alter_permission_name_max_length','2025-06-09 10:03:32.415999'),(8,'auth','0003_alter_user_email_max_length','2025-06-09 10:03:32.455616'),(9,'auth','0004_alter_user_username_opts','2025-06-09 10:03:32.489350'),(10,'auth','0005_alter_user_last_login_null','2025-06-09 10:03:32.595116'),(11,'auth','0006_require_contenttypes_0002','2025-06-09 10:03:32.599679'),(12,'auth','0007_alter_validators_add_error_messages','2025-06-09 10:03:32.624023'),(13,'auth','0008_alter_user_username_max_length','2025-06-09 10:03:32.773334'),(14,'auth','0009_alter_user_last_name_max_length','2025-06-09 10:03:32.821295'),(15,'auth','0010_alter_group_name_max_length','2025-06-09 10:03:32.861461'),(16,'auth','0011_update_proxy_permissions','2025-06-09 10:03:32.886544'),(17,'auth','0012_alter_user_first_name_max_length','2025-06-09 10:03:32.942732'),(18,'authapp','0001_initial','2025-06-09 10:03:33.103957'),(19,'authapp','0002_alter_activitylog_table','2025-06-09 10:03:33.133441'),(20,'authapp','0003_logentry_delete_activitylog','2025-06-09 10:03:33.288574'),(21,'authapp','0004_certificatelog','2025-06-09 10:03:33.515278'),(22,'authapp','0005_delete_logentry','2025-06-09 10:03:33.533191'),(23,'authapp','0006_logentry','2025-06-09 10:03:33.673024'),(24,'authapp','0007_delete_logentry','2025-06-09 10:03:33.688655'),(25,'authapp','0008_barangayofficial','2025-06-09 10:03:33.711534'),(26,'sessions','0001_initial','2025-06-09 10:03:33.784257'),(27,'authapp','0002_personinformation_pwd_status_and_more','2025-08-28 08:28:36.810528'),(28,'authapp','0003_alter_personinformation_pwd_status_and_more','2025-08-28 08:28:36.947577'),(29,'authapp','0009_alter_barangayofficial_committee_and_more','2025-08-29 04:04:10.808423'),(30,'authapp','0004_passwordresettoken','2025-10-01 08:33:16.536724'),(31,'authapp','0004_create_groups','2025-10-01 09:19:33.999929'),(32,'authapp','0005_create_default_users','2025-10-01 09:19:35.988569'),(33,'authapp','0006_certificatelog_certificate_number','2025-10-01 10:09:16.444921');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('14mtvde9kkbv5zuacip5hlep3r9evhgr','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uCBbq:Hu8NUoBZNyukrSW2Dy9vhoCqjKUPsHHl8-RIN_Y4b18','2025-05-20 06:16:54.308500'),('1b21kn2rs1n7euggdlyvbpf64egu4u2p','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1urccj:OZfB0wIljNiuk5ArZFPzHamKGGZHbZ1O9Q3qfZGwKZs','2025-09-11 13:25:05.540051'),('1zbp04yqvo85ji8dbwjdepqmzqn5bn5d','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1txgmO:pW2W0jKLDfXniMHIoDqHDVyqKor93C8S7ImiTRoT8J4','2025-04-10 06:31:52.489552'),('32n1nvk3u1zc6brry6cu4rg6zfj308yb','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1txgyy:igkOkb6ZPwOtcMu8knd9Y6XI1SCaqiJpcLw-SYvRKPs','2025-04-10 06:44:52.768317'),('3jl51ak5dlx2c1ko3zlj16654jxvdlsz','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uJ2KQ:33EbMSUl8HlN4DQkFzRO6WCT502Fd2XsjvG-9QX1ml0','2025-06-08 03:47:14.074045'),('4eu9a32sjfzaa7cd5k5zeoflk69wmsr8','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uuS9L:tx0rS4lVVYRCNRewDKuvGu7DA06jSXThTMNAIIap0_c','2025-09-19 08:50:27.310312'),('4t0rih8fpnc9ukl8yhtemnsodjqhxlvt','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1u7XIM:6JfmSU8tadD7U4CDSptGJf95Bo4k9GB90Z1_hoHxNCc','2025-05-07 10:25:34.050895'),('616ifry4jyi8p8flesk6ocsgyqigu2tf','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1u8bbC:e58esrde82YdAMEO9dHa2qQ_2RsWFM5TghA4C2QJSKM','2025-05-10 09:13:26.914252'),('6pgg1w55yjpfxx8vdgty19g19susyu68','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1u8bHU:8CJfteb-uGMXV3sYQ9JsRuptjrN6wlN28--esOOrJUA','2025-05-10 08:53:04.150913'),('6x4j8gp77rh1fh8fxytqxxltwdmy4kjx','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1u8aGa:R6nowEg3UNjim7NYfLmJVwi0jejxdJK4FwnDrIycnkU','2025-05-10 07:48:04.498227'),('8u0wlch7gvl3az0rn51m5xi355jl4t6j','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1urrBA:2GAiVfybYJAgdXsIclDCqiaKRGPlUAY20PFjkOrAZyk','2025-09-12 04:57:36.681977'),('9bmneidevvzmjfxe01d0r62vh63d5whl','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uCb0W:zCWWf-WzSXVsFHsazj0CYj2PVo53IyFiS745hOauHT0','2025-05-21 09:24:04.425163'),('bsxu4iiobzy41f8qtu8ar030sxs5sa70','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uOZQB:_8p9NyYag4AcKdF_3NrroimcjPPmiTC7q36Cqnwy5nk','2025-06-23 10:08:03.377786'),('cp3gjlcj79grveva0iu75qsgukuvv1ft','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uCYqe:abVXbOlHVLAXyGCzQYSPlRrcQW9qgoRif6TFget2WTY','2025-05-21 07:05:44.060157'),('d5j8nhw29upbysaj2f8pktmwuoi2915w','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uMi10:M1iFJsCqZcvrSX0br_ypQE0husibwpZLGDWkLsg2oHs','2025-06-18 06:54:22.526898'),('fvmdxf9os4va05exm66vcqrplngtaqb3','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uuSD2:qREcBoRb1TdG3pGsBzbH4LfmzQJ1xdVnZTt0u4pa8gU','2025-09-19 08:54:16.816886'),('h1biyk42uhw3g48b1rurb1xnle3n4y1q','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1u7XHX:vMmYdKZfcoO_-RGotQtTjIp_ZMqI9YEJypi13r_UiXg','2025-05-07 10:24:43.349750'),('h34t2e6f77zgp9e6q0zmc10p4l8nebli','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1txhTd:F3pUqd2LMwvazx7lxXqPfa1fa_UZqoSvbCOvPuEgC8w','2025-04-10 07:16:33.676503'),('k2xprmvqv3g98g6hc36jfxiqvmh19hqk','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uCWsj:LjHJIK7_v4WZY7JBtqTqAyEQAQJnmtnBGhQ38geh9uE','2025-05-21 04:59:45.143217'),('laynhds0fryukyp6jtt5owimz0psw9qi','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1tx360:Knd57sLWTWYVyxP-W2jTwhLXsuquLdBrM6izvElasms','2025-04-08 12:09:28.895244'),('lg0f7bnq0o56dec1j6wf4ee77ptzgis5','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1urqZy:040ew4GU2aB7gnzhdVOR6dK8FN7rlU2B80GfPeL-t9c','2025-09-12 04:19:10.572964'),('nf3xo10vy34zvnaledytf3dijwuxmbqg','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1u7XTK:_5NtQN4Kch4NCpAPO6IBJwfNvIsapjz6DkXYSlUOCgc','2025-05-07 10:36:54.789177'),('ork4kuycv69vy0krq2ts79imr498ls4g','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uJmqp:xhVRGaTBWIaIh3UMiYI_I2QzpTKUXN5p8xUWiIzWWkc','2025-06-10 05:27:47.280557'),('oroddb73l2x2lza2br5tzfkf6pg6aj7p','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uMi11:ec-PNnFMHXSCT2Vx0mjlH0vr1QkB_zvDWv1Y0ZpcCO8','2025-06-18 06:54:23.899775'),('oy9u0zn3hjhy5ym6vjgt3fo8r58svt5l','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uvUDS:JX0nJWvTzg8jyiGsDNInsecDxjkTSulLtBQa58NHRlI','2025-09-22 05:14:58.528295'),('qyabqu87pf7m6p34xw7ni96e24rmvdbd','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uge8t:pIGq8uQWjQ0sgicRPNgNoexdgUmZ-DIuMUVZgEg1YgM','2025-08-12 06:48:55.353015'),('r9l09poqsmpwn5crs8g69ygt0kho07mp','e30:1tx1jT:-zqz04TwuW1F_NFCt2h9e76AywI38Twq5NZCOIfV3tQ','2025-04-08 10:42:07.176100'),('rj9s9j1xveov88mlvaecwzmwczgnu4bq','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uMhv4:DHM281Drx9pyLDTJkJCO-vN_Mbe_4NnpJpqg7_aCLyI','2025-06-18 06:48:14.062091'),('sxkkd2dylwtv4do7743rw9zl3jnhej7y','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1txh82:31nx0QPcPUvMKH77AY8uDj7enNgbPZsfjkdQxn7a2p8','2025-04-10 06:54:14.430825'),('u72kj643fysc79h8jlkrqvvxmgrkaao2','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uuQwi:mRd9uJ24-EA_fGJLaUTWFblL_oVEc1uwJYH5oe1VK-4','2025-09-19 07:33:20.192713'),('u96pesjxm6rjr77fi4tist8a4nr166k7','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uMhv5:v2JxvXyu1eCLSFeL4LHKhW4PHC96aXwIY5ka5AwA_c4','2025-06-18 06:48:15.219496'),('uap742is15l6i80k3fdpr0xukr1wzmhq','.eJxVjMsOwiAQRf-FtSFAebp07zeQYRikaiAp7cr479qkC93ec859sQjbWuM2aIlzZmem2Ol3S4APajvId2i3zrG3dZkT3xV-0MGvPdPzcrh_BxVG_dYmSKNdcloQgVZIWXjvihMFE6YJrFWhJAzgvJBWo_TG-VAMKjmhJsHeH-ECN64:1v4HaO:nvHJdu3In54hKHdAJYiMR3Z0a9e_3Cz8U7gyNZKE36w','2025-10-16 11:35:00.726581'),('whuoz7fhh4erxnhlgk3r1pmpwibp3e1y','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1txgE5:hFrbuQaPnaXzZNJwF4uWFHToeZx1wcMZZWUWtQk1-sc','2025-04-10 05:56:25.929019'),('xmyfqoq08bfaxbuqdb6w3gsr50qik654','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1u8bgJ:UnmRJosYPtAlER7wyP_P6xlSdclJroGZcNT5b4MBAlc','2025-05-10 09:18:43.465327'),('ytdp8ipeb3cb5i3teye3dkapf6vhb782','.eJxVjMsOwiAQRf-FtSFAebp07zeQYRikaiAp7cr479qkC93ec859sQjbWuM2aIlzZmem2Ol3S4APajvId2i3zrG3dZkT3xV-0MGvPdPzcrh_BxVG_dYmSKNdcloQgVZIWXjvihMFE6YJrFWhJAzgvJBWo_TG-VAMKjmhJsHeH-ECN64:1v4FK7:SBE9w4f0XBxelhsja16-Qe-PcFfsICZCeG8yTW4kyRI','2025-10-16 09:10:03.365117'),('zlky5uqfhqm091rzlwrx5l83hywr9qb4','.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1uuSBR:L96q5iOPOE5pJK-x82MZnosy_BLuvFwyeZPPPoAQ97k','2025-09-19 08:52:37.703793');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-02 19:35:04
