-- MySQL dump 10.15  Distrib 10.0.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: buy_eshop
-- ------------------------------------------------------
-- Server version	10.0.34-MariaDB-0ubuntu0.16.04.1

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Eletronicos','2018-05-31 17:36:13','2018-05-31 17:40:22','2018-05-31 17:40:22',NULL),(2,'Eletronicos','2018-05-31 17:40:29','2018-05-31 17:40:29',NULL,'eletronicos');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(12,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(13,2,'id','number','ID',1,0,0,0,0,0,'',1),(14,2,'name','text','Name',1,1,1,1,1,1,'',2),(15,2,'created_at','timestamp','Created At',0,0,0,0,0,0,'',3),(16,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'',4),(17,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(18,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(19,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(20,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(21,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(22,1,'role_id','text','Role',0,1,1,1,1,1,NULL,9),(23,4,'id','text','Id',1,0,0,0,0,0,NULL,1),(24,4,'type','text','Tipo',1,1,1,1,1,1,NULL,2),(25,4,'deleted_at','timestamp','Deletado em',0,0,0,0,0,0,NULL,3),(26,4,'host','text','Host',1,1,1,1,1,1,NULL,4),(27,5,'id','text','Id',1,0,0,0,0,0,NULL,1),(28,5,'link','text','Link',0,1,1,1,1,1,NULL,2),(32,5,'deleted_at','timestamp','Deleted At',0,0,0,0,0,0,NULL,6),(33,5,'logo','image','Logo',0,1,1,0,0,1,NULL,7),(34,5,'title','text','Titulo',0,1,1,1,0,1,NULL,8),(35,5,'short_description','text','Descrição',0,0,1,1,0,0,NULL,9),(36,5,'product_belongsto_provider_type_relationship','relationship','Tipo de Provedor',0,1,1,1,1,1,'{\"model\":\"\\\\App\\\\ProviderType\",\"table\":\"provider_types\",\"type\":\"belongsTo\",\"column\":\"provider_type_id\",\"key\":\"id\",\"label\":\"type\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(37,5,'user_id','text','User Id',1,0,0,0,0,0,NULL,7),(38,5,'provider_type_id','text','Provider Type Id',0,0,0,0,0,0,NULL,8),(39,6,'id','text','Id',1,0,0,0,0,0,NULL,1),(40,6,'name','text','Name',1,1,1,1,1,1,NULL,2),(41,6,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(42,6,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(43,6,'deleted_at','timestamp','Deleted At',0,0,0,0,0,0,NULL,5),(44,6,'slug','text','Slug',0,0,0,0,0,0,NULL,6),(45,5,'product_belongsto_category_relationship','relationship','Categoria',0,1,1,1,1,1,'{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',11),(46,5,'category_id','text','Category Id',0,1,1,1,1,1,NULL,9);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','Usuário','Usuários','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy',NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-05-31 15:23:39','2018-05-31 17:06:44'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2018-05-31 15:23:39','2018-05-31 15:23:39'),(3,'roles','roles','Cargo','Cargos','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-05-31 15:23:39','2018-05-31 17:06:29'),(4,'provider_types','tipos-de-fornecedores','Tipo de Provedor','Tipos de Provedores','voyager-pie-chart','App\\ProviderType',NULL,NULL,'Um tipo de provedor é uma loja online que fornece as informações dos produtos do e-shop, como magazineluiza, polishop...',1,1,'{\"order_column\":\"type\",\"order_display_column\":\"type\"}','2018-05-31 15:38:49','2018-05-31 15:48:25'),(5,'products','produtos','Produto','Produtos','voyager-archive','App\\Product',NULL,NULL,'Um produto que deve possuir as informações do provedor e entrar na listagem no app',1,1,'{\"order_column\":\"id\",\"order_display_column\":\"id\"}','2018-05-31 15:43:01','2018-05-31 15:43:01'),(6,'categories','categories','Category','Categories','voyager-calendar','App\\Category',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-05-31 17:32:44','2018-05-31 17:47:04');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2018-05-31 15:23:40','2018-05-31 15:23:40','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2018-05-31 15:23:40','2018-05-31 15:23:40','voyager.media.index',NULL),(3,1,'Usuários','','_self','voyager-person','#000000',NULL,3,'2018-05-31 15:23:40','2018-05-31 17:05:07','voyager.users.index','null'),(4,1,'Cargos','','_self','voyager-lock','#000000',NULL,2,'2018-05-31 15:23:40','2018-05-31 17:05:01','voyager.roles.index','null'),(5,1,'Ferramentas','','_self','voyager-tools','#000000',NULL,9,'2018-05-31 15:23:40','2018-05-31 17:05:14',NULL,''),(6,1,'Construtor de Menus','','_self','voyager-list','#000000',5,10,'2018-05-31 15:23:40','2018-05-31 17:05:22','voyager.menus.index','null'),(7,1,'Banco de Dados','','_self','voyager-data','#000000',5,11,'2018-05-31 15:23:40','2018-05-31 17:05:30','voyager.database.index','null'),(8,1,'Compass','','_self','voyager-compass',NULL,5,12,'2018-05-31 15:23:40','2018-05-31 15:23:40','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2018-05-31 15:23:40','2018-05-31 15:23:40','voyager.bread.index',NULL),(10,1,'Configurações','','_self','voyager-settings','#000000',NULL,14,'2018-05-31 15:23:40','2018-05-31 17:05:41','voyager.settings.index','null'),(11,1,'Hooks','','_self','voyager-hook',NULL,5,13,'2018-05-31 15:23:43','2018-05-31 15:23:43','voyager.hooks',NULL),(12,1,'Tipos de Provedores','','_self','voyager-pie-chart','#000000',NULL,15,'2018-05-31 15:38:49','2018-05-31 15:49:40','voyager.tipos-de-fornecedores.index','null'),(13,1,'Produtos','','_self','voyager-archive',NULL,NULL,16,'2018-05-31 15:43:02','2018-05-31 15:43:02','voyager.produtos.index',NULL),(14,1,'Categories','','_self',NULL,NULL,NULL,17,'2018-05-31 17:32:44','2018-05-31 17:32:44','voyager.categories.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2018-05-31 15:23:40','2018-05-31 15:23:40');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(1,3),(1,4),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(16,4),(17,1),(17,4),(18,1),(19,1),(20,1),(21,1),(21,4),(22,1),(22,4),(23,1),(23,4),(24,1),(25,1),(26,1),(27,1),(27,4),(28,1),(28,4),(29,1),(29,4),(30,1),(30,4),(31,1),(32,1),(32,3),(32,4),(33,1),(33,3),(33,4),(34,1),(34,3),(34,4),(35,1),(35,3),(35,4),(36,1),(36,3),(36,4),(37,1),(37,4),(38,1),(38,4),(39,1),(39,4),(40,1),(40,4),(41,1),(41,4);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2018-05-31 15:23:41','2018-05-31 15:23:41'),(2,'browse_bread',NULL,'2018-05-31 15:23:41','2018-05-31 15:23:41'),(3,'browse_database',NULL,'2018-05-31 15:23:41','2018-05-31 15:23:41'),(4,'browse_media',NULL,'2018-05-31 15:23:41','2018-05-31 15:23:41'),(5,'browse_compass',NULL,'2018-05-31 15:23:41','2018-05-31 15:23:41'),(6,'browse_menus','menus','2018-05-31 15:23:41','2018-05-31 15:23:41'),(7,'read_menus','menus','2018-05-31 15:23:41','2018-05-31 15:23:41'),(8,'edit_menus','menus','2018-05-31 15:23:41','2018-05-31 15:23:41'),(9,'add_menus','menus','2018-05-31 15:23:41','2018-05-31 15:23:41'),(10,'delete_menus','menus','2018-05-31 15:23:41','2018-05-31 15:23:41'),(11,'browse_roles','roles','2018-05-31 15:23:41','2018-05-31 15:23:41'),(12,'read_roles','roles','2018-05-31 15:23:41','2018-05-31 15:23:41'),(13,'edit_roles','roles','2018-05-31 15:23:41','2018-05-31 15:23:41'),(14,'add_roles','roles','2018-05-31 15:23:41','2018-05-31 15:23:41'),(15,'delete_roles','roles','2018-05-31 15:23:41','2018-05-31 15:23:41'),(16,'browse_users','users','2018-05-31 15:23:41','2018-05-31 15:23:41'),(17,'read_users','users','2018-05-31 15:23:41','2018-05-31 15:23:41'),(18,'edit_users','users','2018-05-31 15:23:41','2018-05-31 15:23:41'),(19,'add_users','users','2018-05-31 15:23:41','2018-05-31 15:23:41'),(20,'delete_users','users','2018-05-31 15:23:41','2018-05-31 15:23:41'),(21,'browse_settings','settings','2018-05-31 15:23:41','2018-05-31 15:23:41'),(22,'read_settings','settings','2018-05-31 15:23:41','2018-05-31 15:23:41'),(23,'edit_settings','settings','2018-05-31 15:23:41','2018-05-31 15:23:41'),(24,'add_settings','settings','2018-05-31 15:23:42','2018-05-31 15:23:42'),(25,'delete_settings','settings','2018-05-31 15:23:42','2018-05-31 15:23:42'),(26,'browse_hooks',NULL,'2018-05-31 15:23:43','2018-05-31 15:23:43'),(27,'browse_provider_types','provider_types','2018-05-31 15:38:49','2018-05-31 15:38:49'),(28,'read_provider_types','provider_types','2018-05-31 15:38:49','2018-05-31 15:38:49'),(29,'edit_provider_types','provider_types','2018-05-31 15:38:49','2018-05-31 15:38:49'),(30,'add_provider_types','provider_types','2018-05-31 15:38:49','2018-05-31 15:38:49'),(31,'delete_provider_types','provider_types','2018-05-31 15:38:49','2018-05-31 15:38:49'),(32,'browse_products','products','2018-05-31 15:43:02','2018-05-31 15:43:02'),(33,'read_products','products','2018-05-31 15:43:02','2018-05-31 15:43:02'),(34,'edit_products','products','2018-05-31 15:43:02','2018-05-31 15:43:02'),(35,'add_products','products','2018-05-31 15:43:02','2018-05-31 15:43:02'),(36,'delete_products','products','2018-05-31 15:43:02','2018-05-31 15:43:02'),(37,'browse_categories','categories','2018-05-31 17:32:44','2018-05-31 17:32:44'),(38,'read_categories','categories','2018-05-31 17:32:44','2018-05-31 17:32:44'),(39,'edit_categories','categories','2018-05-31 17:32:44','2018-05-31 17:32:44'),(40,'add_categories','categories','2018-05-31 17:32:44','2018-05-31 17:32:44'),(41,'delete_categories','categories','2018-05-31 17:32:44','2018-05-31 17:32:44');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `logo` text COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` mediumtext COLLATE utf8_unicode_ci,
  `user_id` int(10) unsigned NOT NULL,
  `provider_type_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'teste','2018-05-31 16:08:31',NULL,NULL,NULL,1,0,NULL),(2,'outro teste','2018-05-31 16:08:31',NULL,NULL,NULL,2,0,NULL),(3,'https://www.polishop.com.br/shine-remington/p?idsku=116195','2018-05-31 16:45:37',NULL,NULL,NULL,1,0,NULL),(4,'https://www.polishop.com.br/shine-remington/p?idsku=116195','2018-05-31 16:53:06',NULL,NULL,NULL,1,0,NULL),(5,'https://www.polishop.com.br/shine-remington/p?idsku=116195','2018-05-31 17:02:03',NULL,NULL,NULL,1,NULL,NULL),(6,'https://www.polishop.com.br/shine-remington/p?idsku=116195',NULL,'https://polishop.vteximg.com.br/arquivos/ids/426167-1000-563/shine-therapy-2x-showcase.jpg?v=636005628810500000','Prancha Shine Therapy 2x Remington - | Bivolt','Shine Therapy Abacate e Macadâmia proporciona aos seus cabelos um efeito de escova progressiva: liso instantâneo e duradouro, sem usar produtos químicos nem ficar horas no salão!\r\n\r\nSuas placas de cerâmica flutuantes pressionam suavemente e de forma uniforme cada mecha de cabelo para alisar sem marcar e liberar microcondicionadores de vitamina E e nano-partículas de óleo de abacate e macadâmia – que nutrem e hidratam profundamente fio a fio! É a combinação perfeita de beleza e cuidado!\r\n\r\nO resultado é um liso profissional, com toque macio e sedoso, que dura muito mais tempo – mesmo após lavar os cabelos!\r\nShine Therapy é uma verdadeira terapia para todo tipo de cabelo, até os fios mais grossos ou volumosos, pois com seu ajuste preciso de temperatura, você escolhe a temperatura adequada para cada tipo de cabelo: fino, grosso, encaracolado, ondulado ou até mesmo liso!\r\n\r\nShine Therapy Abacate e Macadâmia tem a qualidade Remington e é uma super exclusividade Polishop!',1,2,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_types`
--

DROP TABLE IF EXISTS `provider_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_types`
--

LOCK TABLES `provider_types` WRITE;
/*!40000 ALTER TABLE `provider_types` DISABLE KEYS */;
INSERT INTO `provider_types` VALUES (1,'Magazine luiza','2018-05-31 16:12:50','www.magazineluiza.com.br'),(2,'Polishop',NULL,'www.polishop.com.br');
/*!40000 ALTER TABLE `provider_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2018-05-31 15:23:41','2018-05-31 15:23:41'),(2,'user','Normal User','2018-05-31 15:23:41','2018-05-31 15:23:41'),(3,'partner','Parceiro','2018-05-31 15:54:10','2018-05-31 15:54:10'),(4,'modder','Moderador','2018-05-31 17:48:33','2018-05-31 17:48:33');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Buy Eshop','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','settings/May2018/hQz00HIYyzX2utAGxUmT.png','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Buy Eshop','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Reginaldo','reginaldo.junior696@gmail.com','users/default.png','$2y$10$W9dzZPuaWH0VAaXMdnwOSek4dc4yNcTbfDeB.8i1DqU0TxdjxKM4.','IbnQT4IKxrCgyk6gCcWYIK5VRtSStvuyO5uhOvmZyp6TgdokiRdCw1fLSDJ5',NULL,'2018-05-31 15:25:39','2018-05-31 15:25:39'),(2,4,'Jhonatas','virtualdjhonata@hotmail.com','users/default.png','$2y$10$PTUUjFDHlZIhQyXnto4At.QxmTxCfH7yoJCNggGeRUctVZqXceYG2','Z3YjnMlUfv1opcgbKw8ZqLyldRdAWY6oPVDDjR0ATZ6bjbHzb7CFI9VWNYVp','{\"locale\":\"pt_br\"}','2018-05-31 15:54:46','2018-05-31 17:48:55');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-31 11:49:52
