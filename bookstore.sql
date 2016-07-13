-- MySQL dump 10.13  Distrib 5.6.27, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	5.6.27-2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
  `name` varchar(80) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add author',8,'add_author'),(23,'Can change author',8,'change_author'),(24,'Can delete author',8,'delete_author'),(25,'Can add link',9,'add_link'),(26,'Can change link',9,'change_link'),(27,'Can delete link',9,'delete_link'),(28,'Can add about',10,'add_about'),(29,'Can change about',10,'change_about'),(30,'Can delete about',10,'delete_about'),(31,'Can add contact',11,'add_contact'),(32,'Can change contact',11,'change_contact'),(33,'Can delete contact',11,'delete_contact'),(34,'Can add advertisment',12,'add_advertisment'),(35,'Can change advertisment',12,'change_advertisment'),(36,'Can delete advertisment',12,'delete_advertisment'),(37,'Can add legal',13,'add_legal'),(38,'Can change legal',13,'change_legal'),(39,'Can delete legal',13,'delete_legal'),(40,'Can add notice',14,'add_notice'),(41,'Can change notice',14,'change_notice'),(42,'Can delete notice',14,'delete_notice'),(43,'Can add day',15,'add_day'),(44,'Can change day',15,'change_day'),(45,'Can delete day',15,'delete_day'),(46,'Can add book',16,'add_book'),(47,'Can change book',16,'change_book'),(48,'Can delete book',16,'delete_book'),(49,'Can add review',17,'add_review'),(50,'Can change review',17,'change_review'),(51,'Can delete review',17,'delete_review'),(52,'Can add captcha store',18,'add_captchastore'),(53,'Can change captcha store',18,'change_captchastore'),(54,'Can delete captcha store',18,'delete_captchastore');
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
  `password` varchar(128) COLLATE utf8_persian_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_persian_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_persian_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_persian_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$nCwsDIX5jmQk$YWuvGFYb/dR1Qo5BvLVKg6tj8bIPA02ze509yrrZSI0=','2016-04-06 19:26:41.130356',1,'admin','','','admin@a.com',1,1,'2016-04-06 19:26:33.694533');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_about`
--

DROP TABLE IF EXISTS `bookstore_about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookstore_about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `context` longtext COLLATE utf8_persian_ci NOT NULL,
  `a_link` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `timestamp` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_about`
--

LOCK TABLES `bookstore_about` WRITE;
/*!40000 ALTER TABLE `bookstore_about` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookstore_about` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_advertisment`
--

DROP TABLE IF EXISTS `bookstore_advertisment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookstore_advertisment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `context` longtext COLLATE utf8_persian_ci NOT NULL,
  `a_link` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `timestamp` date NOT NULL,
  `img_patch` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_advertisment`
--

LOCK TABLES `bookstore_advertisment` WRITE;
/*!40000 ALTER TABLE `bookstore_advertisment` DISABLE KEYS */;
INSERT INTO `bookstore_advertisment` VALUES (1,'ds','<p>vf</p>','GOOGLE.COM','2016-04-06','advertisment/2016/04/06/googlelogo_color_272x92dp.png');
/*!40000 ALTER TABLE `bookstore_advertisment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_author`
--

DROP TABLE IF EXISTS `bookstore_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookstore_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `author_text` longtext COLLATE utf8_persian_ci NOT NULL,
  `img_patch` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `timestamp` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_author`
--

LOCK TABLES `bookstore_author` WRITE;
/*!40000 ALTER TABLE `bookstore_author` DISABLE KEYS */;
INSERT INTO `bookstore_author` VALUES (1,'a','aaaaa','<p>aaaaaaaaaa</p>','authors/2016/04/06/googlelogo_color_272x92dp.png','2016-04-06');
/*!40000 ALTER TABLE `bookstore_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_book`
--

DROP TABLE IF EXISTS `bookstore_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookstore_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8_persian_ci NOT NULL,
  `publication_year` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8_persian_ci NOT NULL,
  `img_patch` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookstore_book_author_id_c8c6315b_fk_bookstore_author_id` (`author_id`),
  CONSTRAINT `bookstore_book_author_id_c8c6315b_fk_bookstore_author_id` FOREIGN KEY (`author_id`) REFERENCES `bookstore_author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_book`
--

LOCK TABLES `bookstore_book` WRITE;
/*!40000 ALTER TABLE `bookstore_book` DISABLE KEYS */;
INSERT INTO `bookstore_book` VALUES (1,'dsadsdssd',1186,1,'<p>adcsascsd</p>','documents/2016/04/06/googlelogo_color_272x92dp.png'),(2,'fsd',1186,1,'<p>dss</p>','documents/2016/04/06/googlelogo_color_272x92dp_HNbUhFF.png'),(3,'ds',1186,1,'<p>scsc</p>','documents/2016/04/06/googlelogo_color_272x92dp_x1rw8ar.png'),(4,'dsfsd',1186,1,'<p>dcdc</p>','documents/2016/04/06/googlelogo_color_272x92dp_xWCqC5d.png');
/*!40000 ALTER TABLE `bookstore_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_contact`
--

DROP TABLE IF EXISTS `bookstore_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookstore_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `contact_email` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `message_title` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `message_context` longtext COLLATE utf8_persian_ci NOT NULL,
  `timestamp` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_contact`
--

LOCK TABLES `bookstore_contact` WRITE;
/*!40000 ALTER TABLE `bookstore_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookstore_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_day`
--

DROP TABLE IF EXISTS `bookstore_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookstore_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` longtext COLLATE utf8_persian_ci NOT NULL,
  `timestamp` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_day`
--

LOCK TABLES `bookstore_day` WRITE;
/*!40000 ALTER TABLE `bookstore_day` DISABLE KEYS */;
INSERT INTO `bookstore_day` VALUES (1,'<p>AAAS</p>','2016-04-06'),(2,'<p>adssdds</p>','2016-04-06'),(3,'<p>aaaa</p>','2016-04-06'),(4,'<p>aasdsdadsa</p>','2016-04-06');
/*!40000 ALTER TABLE `bookstore_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_legal`
--

DROP TABLE IF EXISTS `bookstore_legal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookstore_legal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legal_title` longtext COLLATE utf8_persian_ci NOT NULL,
  `legal_context` longtext COLLATE utf8_persian_ci NOT NULL,
  `timestamp` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_legal`
--

LOCK TABLES `bookstore_legal` WRITE;
/*!40000 ALTER TABLE `bookstore_legal` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookstore_legal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_link`
--

DROP TABLE IF EXISTS `bookstore_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookstore_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `context` longtext COLLATE utf8_persian_ci NOT NULL,
  `a_link` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `timestamp` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_link`
--

LOCK TABLES `bookstore_link` WRITE;
/*!40000 ALTER TABLE `bookstore_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookstore_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_notice`
--

DROP TABLE IF EXISTS `bookstore_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookstore_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` longtext COLLATE utf8_persian_ci NOT NULL,
  `notice_context` longtext COLLATE utf8_persian_ci NOT NULL,
  `timestamp` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_notice`
--

LOCK TABLES `bookstore_notice` WRITE;
/*!40000 ALTER TABLE `bookstore_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookstore_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_review`
--

DROP TABLE IF EXISTS `bookstore_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookstore_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` date NOT NULL,
  `review_message` longtext COLLATE utf8_persian_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `img_patch_review` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookstore_review_book_id_3715ecd7_fk_bookstore_book_id` (`book_id`),
  KEY `bookstore_review_user_id_4cec4aa5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `bookstore_review_book_id_3715ecd7_fk_bookstore_book_id` FOREIGN KEY (`book_id`) REFERENCES `bookstore_book` (`id`),
  CONSTRAINT `bookstore_review_user_id_4cec4aa5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_review`
--

LOCK TABLES `bookstore_review` WRITE;
/*!40000 ALTER TABLE `bookstore_review` DISABLE KEYS */;
INSERT INTO `bookstore_review` VALUES (1,'2016-04-06','<p>svvs</p>',3,1,1,'review/2016/04/06/googlelogo_color_272x92dp.png'),(2,'2016-04-06','<p>se</p>',2,1,1,'review/2016/04/06/googlelogo_color_272x92dp_jBdOEHE.png'),(3,'2016-04-06','<p>dasas</p>',4,4,1,'review/2016/04/06/googlelogo_color_272x92dp_JrWaUwn.png');
/*!40000 ALTER TABLE `bookstore_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) COLLATE utf8_persian_ci NOT NULL,
  `response` varchar(32) COLLATE utf8_persian_ci NOT NULL,
  `hashkey` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (1,'JRGF','jrgf','624b78c76ff3bf4cfa0fe185a80426b7f845a0d5','2016-04-06 19:46:15.483546');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8_persian_ci,
  `object_repr` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_persian_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-04-06 19:29:16.673573','1','a aaaaa',1,'Added.',8,1),(2,'2016-04-06 19:29:34.201924','1','dsadsdssd',1,'Added.',16,1),(3,'2016-04-06 19:29:46.753235','1','admin : dsadsdssd',1,'Added.',17,1),(4,'2016-04-06 19:30:35.424813','2','fsd',1,'Added.',16,1),(5,'2016-04-06 19:30:47.675968','3','ds',1,'Added.',16,1),(6,'2016-04-06 19:30:59.803053','4','dsfsd',1,'Added.',16,1),(7,'2016-04-06 19:32:00.247826','1','ds <p>vf</p>',1,'Added.',12,1),(8,'2016-04-06 19:33:38.237541','2','admin : dsadsdssd',1,'Added.',17,1),(9,'2016-04-06 19:33:55.731627','3','admin : dsfsd',1,'Added.',17,1),(10,'2016-04-06 19:35:31.955525','1','<p>AAAS</p>',1,'Added.',15,1),(11,'2016-04-06 19:35:37.345334','2','<p>adssdds</p>',1,'Added.',15,1),(12,'2016-04-06 19:35:43.622172','3','<p>aaaa</p>',1,'Added.',15,1),(13,'2016-04-06 19:35:50.090789','4','<p>aasdsdadsa</p>',1,'Added.',15,1);
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
  `app_label` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(2,'auth','group'),(1,'auth','permission'),(3,'auth','user'),(10,'bookstore','about'),(12,'bookstore','advertisment'),(8,'bookstore','author'),(16,'bookstore','book'),(11,'bookstore','contact'),(15,'bookstore','day'),(13,'bookstore','legal'),(9,'bookstore','link'),(14,'bookstore','notice'),(17,'bookstore','review'),(18,'captcha','captchastore'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(6,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-04-06 19:20:32.240426'),(2,'auth','0001_initial','2016-04-06 19:20:42.123491'),(3,'admin','0001_initial','2016-04-06 19:20:44.386956'),(4,'admin','0002_logentry_remove_auto_add','2016-04-06 19:20:44.593691'),(5,'contenttypes','0002_remove_content_type_name','2016-04-06 19:20:46.003729'),(6,'auth','0002_alter_permission_name_max_length','2016-04-06 19:20:46.796542'),(7,'auth','0003_alter_user_email_max_length','2016-04-06 19:20:50.903722'),(8,'auth','0004_alter_user_username_opts','2016-04-06 19:20:50.981256'),(9,'auth','0005_alter_user_last_login_null','2016-04-06 19:20:52.756413'),(10,'auth','0006_require_contenttypes_0002','2016-04-06 19:20:52.808983'),(11,'auth','0007_alter_validators_add_error_messages','2016-04-06 19:20:52.887845'),(12,'bookstore','0001_initial','2016-04-06 19:21:00.286903'),(13,'bookstore','0002_auto_20160302_0741','2016-04-06 19:21:14.454860'),(14,'captcha','0001_initial','2016-04-06 19:21:16.033443'),(15,'sessions','0001_initial','2016-04-06 19:21:16.967045'),(16,'sites','0001_initial','2016-04-06 19:21:17.348819'),(17,'sites','0002_alter_domain_unique','2016-04-06 19:21:17.705991');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `session_data` longtext COLLATE utf8_persian_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7hx8f2iaqnxn2f2d43fi5wsi2qyycas3','NzljZmQ1MjI3NmIwZDJmNjYzZmIxZTBkMWNjOGIwYTg4Mjk1NmFjNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjgxYmI3Yjc3MWJiZWZkZjQ0MmU0NWMzNzA1ODIwMTI1Njg2ODIwZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-04-20 19:26:41.298807');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-16 20:32:21
