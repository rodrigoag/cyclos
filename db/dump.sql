-- MySQL dump 10.13  Distrib 5.1.53, for apple-darwin10.3.0 (i386)
--
-- Host: localhost    Database: cyclos3
-- ------------------------------------------------------
-- Server version	5.1.53

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
-- Table structure for table `account_fee_amounts`
--

DROP TABLE IF EXISTS `account_fee_amounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_fee_amounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `available_balance` decimal(18,6) NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `account_fee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`,`date`),
  KEY `FK8A011450DA75B281` (`account_fee_id`),
  KEY `FK8A0114508AD473C0` (`account_id`),
  CONSTRAINT `FK8A0114508AD473C0` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK8A011450DA75B281` FOREIGN KEY (`account_fee_id`) REFERENCES `account_fees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_fee_amounts`
--

LOCK TABLES `account_fee_amounts` WRITE;
/*!40000 ALTER TABLE `account_fee_amounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_fee_amounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_fee_logs`
--

DROP TABLE IF EXISTS `account_fee_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_fee_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_fee_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `recharging_failed` bit(1) NOT NULL,
  `recharge_attempt` int(11) NOT NULL DEFAULT '0',
  `failed_members` int(11) NOT NULL,
  `total_members` int(11) DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `amount` decimal(15,6) NOT NULL,
  `free_base` decimal(15,6) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_fee_id` (`account_fee_id`,`date`),
  KEY `FK252A009ADA75B281` (`account_fee_id`),
  CONSTRAINT `FK252A009ADA75B281` FOREIGN KEY (`account_fee_id`) REFERENCES `account_fees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_fee_logs`
--

LOCK TABLES `account_fee_logs` WRITE;
/*!40000 ALTER TABLE `account_fee_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_fee_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_fees`
--

DROP TABLE IF EXISTS `account_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `charge_mode` varchar(2) NOT NULL,
  `run_mode` varchar(1) NOT NULL,
  `payment_direction` varchar(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `account_type_id` int(11) NOT NULL,
  `invoice_mode` varchar(1) DEFAULT NULL,
  `description` longtext,
  `enabled_since` datetime DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `hour` tinyint(4) DEFAULT NULL,
  `free_base` decimal(15,6) DEFAULT NULL,
  `transfer_type_id` int(11) NOT NULL,
  `recurrence_number` int(11) DEFAULT NULL,
  `recurrence_field` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4107687FC2D40D5B` (`account_type_id`),
  KEY `FK4107687FA4766B0A` (`transfer_type_id`),
  CONSTRAINT `FK4107687FA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK4107687FC2D40D5B` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_fees`
--

LOCK TABLES `account_fees` WRITE;
/*!40000 ALTER TABLE `account_fees` DISABLE KEYS */;
INSERT INTO `account_fees` VALUES (1,'Contribution','FA','S','S','\0','5.000000',5,'C','Periodical units contribution',NULL,1,3,NULL,27,1,2),(2,'Liquidity tax','VP','S','S','\0','1.000000',5,'N','Liquidity tax',NULL,1,1,NULL,28,1,2),(3,'Registration','FA','M','S','','5.000000',5,'C',NULL,'2013-12-15 04:11:07',NULL,NULL,NULL,18,NULL,NULL);
/*!40000 ALTER TABLE `account_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_limit_logs`
--

DROP TABLE IF EXISTS `account_limit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_limit_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `by_id` int(11) DEFAULT NULL,
  `credit_limit` decimal(15,6) DEFAULT NULL,
  `upper_credit_limit` decimal(15,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_acctlimlog_account_date` (`account_id`,`date`),
  KEY `FKEA45ED05123F9A53` (`by_id`),
  KEY `FKEA45ED053317FFBA` (`account_id`),
  CONSTRAINT `FKEA45ED053317FFBA` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FKEA45ED05123F9A53` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_limit_logs`
--

LOCK TABLES `account_limit_logs` WRITE;
/*!40000 ALTER TABLE `account_limit_logs` DISABLE KEYS */;
INSERT INTO `account_limit_logs` VALUES (1,2,'2013-12-15 00:42:49',1,'0.000000',NULL),(2,4,'2013-12-15 00:51:23',1,'0.000000',NULL),(3,2,'2013-12-15 01:03:18',1,'0.000000',NULL),(4,2,'2013-12-15 01:03:54',1,'0.000000',NULL);
/*!40000 ALTER TABLE `account_limit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_locks`
--

DROP TABLE IF EXISTS `account_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_locks` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_locks`
--

LOCK TABLES `account_locks` WRITE;
/*!40000 ALTER TABLE `account_locks` DISABLE KEYS */;
INSERT INTO `account_locks` VALUES (1),(2),(3),(4),(5),(6),(7);
/*!40000 ALTER TABLE `account_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_rates`
--

DROP TABLE IF EXISTS `account_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emission_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `i_rate` decimal(15,6) DEFAULT NULL,
  `rate_balance_correction` decimal(21,6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `transfer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_accntrts_transfer` (`transfer_id`),
  KEY `ix_accntrts_account_date` (`account_id`),
  KEY `FKE08D27012F78F3B3` (`transfer_id`),
  KEY `FKE08D27013317FFBA` (`account_id`),
  CONSTRAINT `FKE08D27013317FFBA` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FKE08D27012F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_rates`
--

LOCK TABLES `account_rates` WRITE;
/*!40000 ALTER TABLE `account_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `description` longtext,
  `system_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE0B42FE7C0E7F6FA` (`currency_id`),
  KEY `FKE0B42FE7906BCA9B` (`system_account_id`),
  CONSTRAINT `FKE0B42FE7906BCA9B` FOREIGN KEY (`system_account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FKE0B42FE7C0E7F6FA` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
INSERT INTO `account_types` VALUES (1,'S','Debit/Loan account',1,'The system unlimited account',1),(2,'S','Acacia International Master account',1,'A community specific account',2),(3,'S','Voucher account',1,'The account used to manage voucher payments',3),(4,'S','One Thor account',1,'An organization specific account',4),(5,'M','International Member account',1,'Each member has one account of this type',NULL);
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_closing_date` date DEFAULT NULL,
  `owner_name` varchar(255) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `credit_limit` decimal(15,6) DEFAULT NULL,
  `upper_credit_limit` decimal(15,6) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `member_status` varchar(1) DEFAULT NULL,
  `last_low_units_sent` datetime DEFAULT NULL,
  `member_action` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK809DBBE6EAE0AB57` (`member_id`),
  KEY `FK809DBBE6B93596D` (`type_id`),
  KEY `FK809DBBE68EDC5867` (`type_id`),
  CONSTRAINT `FK809DBBE68EDC5867` FOREIGN KEY (`type_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `FK809DBBE6B93596D` FOREIGN KEY (`type_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `FK809DBBE6EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'S','2013-12-14 18:15:32',NULL,'Debit/Loan account',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'S','2013-12-14 18:15:32',NULL,'Acacia International Master account',2,'0.000000',NULL,NULL,NULL,NULL,NULL),(3,'S','2013-12-14 18:15:32',NULL,'Voucher account',3,'0.000000',NULL,NULL,NULL,NULL,NULL),(4,'S','2013-12-14 18:15:32',NULL,'One Thor account',4,'0.000000',NULL,NULL,NULL,NULL,NULL),(5,'M','2013-12-15 00:37:32',NULL,'12345',5,'0.000000',NULL,2,'A',NULL,NULL),(7,'M','2013-12-15 03:11:01',NULL,'91072989',5,'0.000000',NULL,3,'A',NULL,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_categories`
--

DROP TABLE IF EXISTS `ad_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_index` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `active` bit(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEF2FABB85D31AC77` (`parent_id`),
  CONSTRAINT `FKEF2FABB85D31AC77` FOREIGN KEY (`parent_id`) REFERENCES `ad_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_categories`
--

LOCK TABLES `ad_categories` WRITE;
/*!40000 ALTER TABLE `ad_categories` DISABLE KEYS */;
INSERT INTO `ad_categories` VALUES (1,0,'Example ad category','',NULL);
/*!40000 ALTER TABLE `ad_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_imports`
--

DROP TABLE IF EXISTS `ad_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK79EBE152C0E7F6FA` (`currency_id`),
  KEY `FK79EBE152123F9A53` (`by_id`),
  CONSTRAINT `FK79EBE152123F9A53` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK79EBE152C0E7F6FA` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_imports`
--

LOCK TABLES `ad_imports` WRITE;
/*!40000 ALTER TABLE `ad_imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_interests`
--

DROP TABLE IF EXISTS `ad_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_interests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `trade_type` varchar(1) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `group_filter_id` int(11) DEFAULT NULL,
  `initial_price` decimal(15,6) DEFAULT NULL,
  `final_price` decimal(15,6) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD8DBB56DC0E7F6FA` (`currency_id`),
  KEY `FKD8DBB56D9D46A867` (`group_filter_id`),
  KEY `FKD8DBB56DEAE0AB57` (`member_id`),
  KEY `FKD8DBB56D3D73A7A3` (`category_id`),
  KEY `FKD8DBB56DFE01A09E` (`owner_id`),
  CONSTRAINT `FKD8DBB56DFE01A09E` FOREIGN KEY (`owner_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKD8DBB56D3D73A7A3` FOREIGN KEY (`category_id`) REFERENCES `ad_categories` (`id`),
  CONSTRAINT `FKD8DBB56D9D46A867` FOREIGN KEY (`group_filter_id`) REFERENCES `group_filters` (`id`),
  CONSTRAINT `FKD8DBB56DC0E7F6FA` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `FKD8DBB56DEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_interests`
--

LOCK TABLES `ad_interests` WRITE;
/*!40000 ALTER TABLE `ad_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_group_authorization_level`
--

DROP TABLE IF EXISTS `admin_group_authorization_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_group_authorization_level` (
  `authorization_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `FKBB2E758E3794D57D` (`group_id`),
  KEY `FKBB2E758EFB6913C5` (`authorization_id`),
  CONSTRAINT `FKBB2E758EFB6913C5` FOREIGN KEY (`authorization_id`) REFERENCES `authorization_levels` (`id`),
  CONSTRAINT `FKBB2E758E3794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_group_authorization_level`
--

LOCK TABLES `admin_group_authorization_level` WRITE;
/*!40000 ALTER TABLE `admin_group_authorization_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_group_authorization_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_groups_admin_record_types`
--

DROP TABLE IF EXISTS `admin_groups_admin_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_groups_admin_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FKC4790156E46288C5` (`member_record_type_id`),
  KEY `FKC47901563794D57D` (`group_id`),
  CONSTRAINT `FKC47901563794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKC4790156E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_groups_admin_record_types`
--

LOCK TABLES `admin_groups_admin_record_types` WRITE;
/*!40000 ALTER TABLE `admin_groups_admin_record_types` DISABLE KEYS */;
INSERT INTO `admin_groups_admin_record_types` VALUES (1,1);
/*!40000 ALTER TABLE `admin_groups_admin_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_groups_create_admin_record_types`
--

DROP TABLE IF EXISTS `admin_groups_create_admin_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_groups_create_admin_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FK3A580A63E46288C5` (`member_record_type_id`),
  KEY `FK3A580A633794D57D` (`group_id`),
  CONSTRAINT `FK3A580A633794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK3A580A63E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_groups_create_admin_record_types`
--

LOCK TABLES `admin_groups_create_admin_record_types` WRITE;
/*!40000 ALTER TABLE `admin_groups_create_admin_record_types` DISABLE KEYS */;
INSERT INTO `admin_groups_create_admin_record_types` VALUES (1,1);
/*!40000 ALTER TABLE `admin_groups_create_admin_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_groups_create_member_record_types`
--

DROP TABLE IF EXISTS `admin_groups_create_member_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_groups_create_member_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FK25883928E46288C5` (`member_record_type_id`),
  KEY `FK258839283794D57D` (`group_id`),
  CONSTRAINT `FK258839283794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK25883928E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_groups_create_member_record_types`
--

LOCK TABLES `admin_groups_create_member_record_types` WRITE;
/*!40000 ALTER TABLE `admin_groups_create_member_record_types` DISABLE KEYS */;
INSERT INTO `admin_groups_create_member_record_types` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `admin_groups_create_member_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_groups_custom_fields`
--

DROP TABLE IF EXISTS `admin_groups_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_groups_custom_fields` (
  `custom_field_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `FK79E2D70C990F9C1A` (`custom_field_id`),
  KEY `FK79E2D70C3794D57D` (`group_id`),
  CONSTRAINT `FK79E2D70C3794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK79E2D70C990F9C1A` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_groups_custom_fields`
--

LOCK TABLES `admin_groups_custom_fields` WRITE;
/*!40000 ALTER TABLE `admin_groups_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_groups_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_groups_delete_admin_record_types`
--

DROP TABLE IF EXISTS `admin_groups_delete_admin_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_groups_delete_admin_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FK13E63154E46288C5` (`member_record_type_id`),
  KEY `FK13E631543794D57D` (`group_id`),
  CONSTRAINT `FK13E631543794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK13E63154E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_groups_delete_admin_record_types`
--

LOCK TABLES `admin_groups_delete_admin_record_types` WRITE;
/*!40000 ALTER TABLE `admin_groups_delete_admin_record_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_groups_delete_admin_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_groups_delete_member_record_types`
--

DROP TABLE IF EXISTS `admin_groups_delete_member_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_groups_delete_member_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FK7DBEF057E46288C5` (`member_record_type_id`),
  KEY `FK7DBEF0573794D57D` (`group_id`),
  CONSTRAINT `FK7DBEF0573794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK7DBEF057E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_groups_delete_member_record_types`
--

LOCK TABLES `admin_groups_delete_member_record_types` WRITE;
/*!40000 ALTER TABLE `admin_groups_delete_member_record_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_groups_delete_member_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_groups_member_record_types`
--

DROP TABLE IF EXISTS `admin_groups_member_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_groups_member_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FKDF862095E46288C5` (`member_record_type_id`),
  KEY `FKDF8620953794D57D` (`group_id`),
  CONSTRAINT `FKDF8620953794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKDF862095E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_groups_member_record_types`
--

LOCK TABLES `admin_groups_member_record_types` WRITE;
/*!40000 ALTER TABLE `admin_groups_member_record_types` DISABLE KEYS */;
INSERT INTO `admin_groups_member_record_types` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `admin_groups_member_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_groups_modify_admin_record_types`
--

DROP TABLE IF EXISTS `admin_groups_modify_admin_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_groups_modify_admin_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FKC279EDE5E46288C5` (`member_record_type_id`),
  KEY `FKC279EDE53794D57D` (`group_id`),
  CONSTRAINT `FKC279EDE53794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKC279EDE5E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_groups_modify_admin_record_types`
--

LOCK TABLES `admin_groups_modify_admin_record_types` WRITE;
/*!40000 ALTER TABLE `admin_groups_modify_admin_record_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_groups_modify_admin_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_groups_modify_member_record_types`
--

DROP TABLE IF EXISTS `admin_groups_modify_member_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_groups_modify_member_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FKA1A2C5E6E46288C5` (`member_record_type_id`),
  KEY `FKA1A2C5E63794D57D` (`group_id`),
  CONSTRAINT `FKA1A2C5E63794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKA1A2C5E6E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_groups_modify_member_record_types`
--

LOCK TABLES `admin_groups_modify_member_record_types` WRITE;
/*!40000 ALTER TABLE `admin_groups_modify_member_record_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_groups_modify_member_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_manages_member_groups`
--

DROP TABLE IF EXISTS `admin_manages_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_manages_member_groups` (
  `manager_group_id` int(11) NOT NULL,
  `managed_group_id` int(11) NOT NULL,
  KEY `FK19C43358609349CF` (`manager_group_id`),
  KEY `FK19C4335881536B8E` (`managed_group_id`),
  CONSTRAINT `FK19C4335881536B8E` FOREIGN KEY (`managed_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK19C43358609349CF` FOREIGN KEY (`manager_group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_manages_member_groups`
--

LOCK TABLES `admin_manages_member_groups` WRITE;
/*!40000 ALTER TABLE `admin_manages_member_groups` DISABLE KEYS */;
INSERT INTO `admin_manages_member_groups` VALUES (1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11);
/*!40000 ALTER TABLE `admin_manages_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notification_preferences`
--

DROP TABLE IF EXISTS `admin_notification_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_notification_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `application_errors` bit(1) NOT NULL,
  `system_invoices` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE4ED5494D2DEA05B` (`admin_id`),
  CONSTRAINT `FKE4ED5494D2DEA05B` FOREIGN KEY (`admin_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notification_preferences`
--

LOCK TABLES `admin_notification_preferences` WRITE;
/*!40000 ALTER TABLE `admin_notification_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notification_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_preferences_guarantee_types`
--

DROP TABLE IF EXISTS `admin_preferences_guarantee_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_preferences_guarantee_types` (
  `preference_id` int(11) NOT NULL,
  `guarantee_type_id` int(11) NOT NULL,
  PRIMARY KEY (`preference_id`,`guarantee_type_id`),
  KEY `FK9B3E7BCB9383E848` (`guarantee_type_id`),
  KEY `FK9B3E7BCBFB43CB21` (`preference_id`),
  CONSTRAINT `FK9B3E7BCBFB43CB21` FOREIGN KEY (`preference_id`) REFERENCES `admin_notification_preferences` (`id`),
  CONSTRAINT `FK9B3E7BCB9383E848` FOREIGN KEY (`guarantee_type_id`) REFERENCES `guarantee_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_preferences_guarantee_types`
--

LOCK TABLES `admin_preferences_guarantee_types` WRITE;
/*!40000 ALTER TABLE `admin_preferences_guarantee_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_preferences_guarantee_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_preferences_member_alerts`
--

DROP TABLE IF EXISTS `admin_preferences_member_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_preferences_member_alerts` (
  `preference_id` int(11) NOT NULL,
  `type` varchar(70) NOT NULL,
  PRIMARY KEY (`preference_id`,`type`),
  KEY `FK70B839E5FB43CB21` (`preference_id`),
  CONSTRAINT `FK70B839E5FB43CB21` FOREIGN KEY (`preference_id`) REFERENCES `admin_notification_preferences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_preferences_member_alerts`
--

LOCK TABLES `admin_preferences_member_alerts` WRITE;
/*!40000 ALTER TABLE `admin_preferences_member_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_preferences_member_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_preferences_message_categories`
--

DROP TABLE IF EXISTS `admin_preferences_message_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_preferences_message_categories` (
  `preference_id` int(11) NOT NULL,
  `message_category_id` int(11) NOT NULL,
  PRIMARY KEY (`preference_id`,`message_category_id`),
  KEY `FK4C0418EBFB43CB21` (`preference_id`),
  KEY `FK4C0418EBD05BD7A4` (`message_category_id`),
  CONSTRAINT `FK4C0418EBD05BD7A4` FOREIGN KEY (`message_category_id`) REFERENCES `message_categories` (`id`),
  CONSTRAINT `FK4C0418EBFB43CB21` FOREIGN KEY (`preference_id`) REFERENCES `admin_notification_preferences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_preferences_message_categories`
--

LOCK TABLES `admin_preferences_message_categories` WRITE;
/*!40000 ALTER TABLE `admin_preferences_message_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_preferences_message_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_preferences_new_members`
--

DROP TABLE IF EXISTS `admin_preferences_new_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_preferences_new_members` (
  `preference_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`preference_id`,`group_id`),
  KEY `FK292DCDC3FB43CB21` (`preference_id`),
  KEY `FK292DCDC3B45926EE` (`group_id`),
  CONSTRAINT `FK292DCDC3B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK292DCDC3FB43CB21` FOREIGN KEY (`preference_id`) REFERENCES `admin_notification_preferences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_preferences_new_members`
--

LOCK TABLES `admin_preferences_new_members` WRITE;
/*!40000 ALTER TABLE `admin_preferences_new_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_preferences_new_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_preferences_new_pending_payments`
--

DROP TABLE IF EXISTS `admin_preferences_new_pending_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_preferences_new_pending_payments` (
  `preference_id` int(11) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  PRIMARY KEY (`preference_id`,`transfer_type_id`),
  KEY `FKD0252B6BA4766B0A` (`transfer_type_id`),
  KEY `FKD0252B6BFB43CB21` (`preference_id`),
  CONSTRAINT `FKD0252B6BFB43CB21` FOREIGN KEY (`preference_id`) REFERENCES `admin_notification_preferences` (`id`),
  CONSTRAINT `FKD0252B6BA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_preferences_new_pending_payments`
--

LOCK TABLES `admin_preferences_new_pending_payments` WRITE;
/*!40000 ALTER TABLE `admin_preferences_new_pending_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_preferences_new_pending_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_preferences_system_alerts`
--

DROP TABLE IF EXISTS `admin_preferences_system_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_preferences_system_alerts` (
  `preference_id` int(11) NOT NULL,
  `type` varchar(70) NOT NULL,
  PRIMARY KEY (`preference_id`,`type`),
  KEY `FK44CB90B0FB43CB21` (`preference_id`),
  CONSTRAINT `FK44CB90B0FB43CB21` FOREIGN KEY (`preference_id`) REFERENCES `admin_notification_preferences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_preferences_system_alerts`
--

LOCK TABLES `admin_preferences_system_alerts` WRITE;
/*!40000 ALTER TABLE `admin_preferences_system_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_preferences_system_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_preferences_transfer_types`
--

DROP TABLE IF EXISTS `admin_preferences_transfer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_preferences_transfer_types` (
  `preference_id` int(11) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  PRIMARY KEY (`preference_id`,`transfer_type_id`),
  KEY `FKD472F23CA4766B0A` (`transfer_type_id`),
  KEY `FKD472F23CFB43CB21` (`preference_id`),
  CONSTRAINT `FKD472F23CFB43CB21` FOREIGN KEY (`preference_id`) REFERENCES `admin_notification_preferences` (`id`),
  CONSTRAINT `FKD472F23CA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_preferences_transfer_types`
--

LOCK TABLES `admin_preferences_transfer_types` WRITE;
/*!40000 ALTER TABLE `admin_preferences_transfer_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_preferences_transfer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_view_account_information`
--

DROP TABLE IF EXISTS `admin_view_account_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_view_account_information` (
  `group_id` int(11) NOT NULL,
  `account_type_id` int(11) NOT NULL,
  KEY `FK374B1C701C7906A6` (`account_type_id`),
  KEY `FK374B1C703794D57D` (`group_id`),
  CONSTRAINT `FK374B1C703794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK374B1C701C7906A6` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_view_account_information`
--

LOCK TABLES `admin_view_account_information` WRITE;
/*!40000 ALTER TABLE `admin_view_account_information` DISABLE KEYS */;
INSERT INTO `admin_view_account_information` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4);
/*!40000 ALTER TABLE `admin_view_account_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_view_connected_users_of`
--

DROP TABLE IF EXISTS `admin_view_connected_users_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_view_connected_users_of` (
  `viewer_group_id` int(11) NOT NULL,
  `viewed_group_id` int(11) NOT NULL,
  KEY `FK79A22CE8049090A` (`viewer_group_id`),
  KEY `FK79A22CE2444D958` (`viewed_group_id`),
  CONSTRAINT `FK79A22CE2444D958` FOREIGN KEY (`viewed_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK79A22CE8049090A` FOREIGN KEY (`viewer_group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_view_connected_users_of`
--

LOCK TABLES `admin_view_connected_users_of` WRITE;
/*!40000 ALTER TABLE `admin_view_connected_users_of` DISABLE KEYS */;
INSERT INTO `admin_view_connected_users_of` VALUES (1,1),(1,2),(2,1),(2,2);
/*!40000 ALTER TABLE `admin_view_connected_users_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `permanent` bit(1) NOT NULL,
  `external_publication` bit(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `trade_type` varchar(1) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `price` decimal(15,6) DEFAULT NULL,
  `publication_start` date DEFAULT NULL,
  `publication_end` date DEFAULT NULL,
  `description` longtext,
  `delete_date` date DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `is_html` bit(1) NOT NULL,
  `members_notified` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK178B0C0E7F6FA` (`currency_id`),
  KEY `FK178B03D73A7A3` (`category_id`),
  KEY `FK178B0FE01A09E` (`owner_id`),
  CONSTRAINT `FK178B0FE01A09E` FOREIGN KEY (`owner_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK178B03D73A7A3` FOREIGN KEY (`category_id`) REFERENCES `ad_categories` (`id`),
  CONSTRAINT `FK178B0C0E7F6FA` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `removed` bit(1) NOT NULL,
  `msg_key` varchar(255) NOT NULL,
  `arg0` varchar(255) DEFAULT NULL,
  `arg1` varchar(255) DEFAULT NULL,
  `arg2` varchar(255) DEFAULT NULL,
  `arg3` varchar(255) DEFAULT NULL,
  `arg4` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKABA7A297EAE0AB57` (`member_id`),
  CONSTRAINT `FKABA7A297EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (1,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-14 18:15:39',NULL),(2,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 00:20:27',NULL),(3,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 00:20:34',NULL),(4,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:04:04',NULL),(5,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:04:18',NULL),(6,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:21:04',NULL),(7,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:21:16',NULL),(8,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:24:39',NULL),(9,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:24:51',NULL);
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amount_reservations`
--

DROP TABLE IF EXISTS `amount_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amount_reservations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `account_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(15,6) DEFAULT NULL,
  `transfer_id` bigint(20) DEFAULT NULL,
  `transfer_authorization_id` bigint(20) DEFAULT NULL,
  `scheduled_payment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_amtres_account_date` (`account_id`,`date`),
  KEY `FKE0379EAEB3A79238` (`scheduled_payment_id`),
  KEY `FKE0379EAE2F78F3B3` (`transfer_id`),
  KEY `FKE0379EAE108D798A` (`transfer_authorization_id`),
  KEY `FKE0379EAE3317FFBA` (`account_id`),
  CONSTRAINT `FKE0379EAE3317FFBA` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FKE0379EAE108D798A` FOREIGN KEY (`transfer_authorization_id`) REFERENCES `transfer_authorizations` (`id`),
  CONSTRAINT `FKE0379EAE2F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FKE0379EAEB3A79238` FOREIGN KEY (`scheduled_payment_id`) REFERENCES `scheduled_payments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amount_reservations`
--

LOCK TABLES `amount_reservations` WRITE;
/*!40000 ALTER TABLE `amount_reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `amount_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(10) DEFAULT NULL,
  `online` bit(1) NOT NULL DEFAULT b'1',
  `account_status_enabled_since` date DEFAULT NULL,
  `password_hash` varchar(1) DEFAULT NULL,
  `last_index_rebuilding_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,'3.7.3','','2013-12-14','T',NULL);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorization_levels`
--

DROP TABLE IF EXISTS `authorization_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorization_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `authorizer` varchar(1) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9AAA27F59D63275E` (`type_id`),
  CONSTRAINT `FK9AAA27F59D63275E` FOREIGN KEY (`type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization_levels`
--

LOCK TABLES `authorization_levels` WRITE;
/*!40000 ALTER TABLE `authorization_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorization_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `binary_files`
--

DROP TABLE IF EXISTS `binary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `binary_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type` varchar(100) NOT NULL,
  `size` int(11) NOT NULL,
  `last_modified` datetime NOT NULL,
  `contents` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binary_files`
--

LOCK TABLES `binary_files` WRITE;
/*!40000 ALTER TABLE `binary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `binary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_commission_contracts`
--

DROP TABLE IF EXISTS `broker_commission_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_commission_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brokering_id` int(11) DEFAULT NULL,
  `broker_commission_id` int(11) DEFAULT NULL,
  `amount_value` decimal(15,6) NOT NULL,
  `amount_type` char(1) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `cancelled_by_id` int(11) DEFAULT NULL,
  `status_before_suspension` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1AEDD3F3F7069BBE` (`broker_commission_id`),
  KEY `FK1AEDD3F397ECA054` (`cancelled_by_id`),
  KEY `FK1AEDD3F3F096D933` (`brokering_id`),
  CONSTRAINT `FK1AEDD3F3F096D933` FOREIGN KEY (`brokering_id`) REFERENCES `brokerings` (`id`),
  CONSTRAINT `FK1AEDD3F397ECA054` FOREIGN KEY (`cancelled_by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK1AEDD3F3F7069BBE` FOREIGN KEY (`broker_commission_id`) REFERENCES `transaction_fees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_commission_contracts`
--

LOCK TABLES `broker_commission_contracts` WRITE;
/*!40000 ALTER TABLE `broker_commission_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker_commission_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_conversion_simulation_transfer_types`
--

DROP TABLE IF EXISTS `broker_conversion_simulation_transfer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_conversion_simulation_transfer_types` (
  `group_id` int(11) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  KEY `FKA32CA71AA4766B0A` (`transfer_type_id`),
  KEY `FKA32CA71A85B3A90F` (`group_id`),
  CONSTRAINT `FKA32CA71A85B3A90F` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKA32CA71AA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_conversion_simulation_transfer_types`
--

LOCK TABLES `broker_conversion_simulation_transfer_types` WRITE;
/*!40000 ALTER TABLE `broker_conversion_simulation_transfer_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker_conversion_simulation_transfer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_groups_create_member_record_types`
--

DROP TABLE IF EXISTS `broker_groups_create_member_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_groups_create_member_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FKA9B20B32E46288C5` (`member_record_type_id`),
  KEY `FKA9B20B3285B3A90F` (`group_id`),
  CONSTRAINT `FKA9B20B3285B3A90F` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKA9B20B32E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_groups_create_member_record_types`
--

LOCK TABLES `broker_groups_create_member_record_types` WRITE;
/*!40000 ALTER TABLE `broker_groups_create_member_record_types` DISABLE KEYS */;
INSERT INTO `broker_groups_create_member_record_types` VALUES (9,1);
/*!40000 ALTER TABLE `broker_groups_create_member_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_groups_delete_member_record_types`
--

DROP TABLE IF EXISTS `broker_groups_delete_member_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_groups_delete_member_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FK1E8C261E46288C5` (`member_record_type_id`),
  KEY `FK1E8C26185B3A90F` (`group_id`),
  CONSTRAINT `FK1E8C26185B3A90F` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK1E8C261E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_groups_delete_member_record_types`
--

LOCK TABLES `broker_groups_delete_member_record_types` WRITE;
/*!40000 ALTER TABLE `broker_groups_delete_member_record_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker_groups_delete_member_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_groups_documents`
--

DROP TABLE IF EXISTS `broker_groups_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_groups_documents` (
  `group_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK81E65B3D6DB8FB3` (`document_id`),
  KEY `FK81E65B385B3A90F` (`group_id`),
  CONSTRAINT `FK81E65B385B3A90F` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK81E65B3D6DB8FB3` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_groups_documents`
--

LOCK TABLES `broker_groups_documents` WRITE;
/*!40000 ALTER TABLE `broker_groups_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker_groups_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_groups_member_record_types`
--

DROP TABLE IF EXISTS `broker_groups_member_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_groups_member_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FK19FC25CBE46288C5` (`member_record_type_id`),
  KEY `FK19FC25CB85B3A90F` (`group_id`),
  CONSTRAINT `FK19FC25CB85B3A90F` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK19FC25CBE46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_groups_member_record_types`
--

LOCK TABLES `broker_groups_member_record_types` WRITE;
/*!40000 ALTER TABLE `broker_groups_member_record_types` DISABLE KEYS */;
INSERT INTO `broker_groups_member_record_types` VALUES (9,1);
/*!40000 ALTER TABLE `broker_groups_member_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_groups_modify_member_record_types`
--

DROP TABLE IF EXISTS `broker_groups_modify_member_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_groups_modify_member_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FK25CC97F0E46288C5` (`member_record_type_id`),
  KEY `FK25CC97F085B3A90F` (`group_id`),
  CONSTRAINT `FK25CC97F085B3A90F` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK25CC97F0E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_groups_modify_member_record_types`
--

LOCK TABLES `broker_groups_modify_member_record_types` WRITE;
/*!40000 ALTER TABLE `broker_groups_modify_member_record_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker_groups_modify_member_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_groups_possible_initial_groups`
--

DROP TABLE IF EXISTS `broker_groups_possible_initial_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_groups_possible_initial_groups` (
  `possible_initial_group_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `FK3DAD1F7885B3A90F` (`group_id`),
  KEY `FK3DAD1F782703D697` (`possible_initial_group_id`),
  CONSTRAINT `FK3DAD1F782703D697` FOREIGN KEY (`possible_initial_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK3DAD1F7885B3A90F` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_groups_possible_initial_groups`
--

LOCK TABLES `broker_groups_possible_initial_groups` WRITE;
/*!40000 ALTER TABLE `broker_groups_possible_initial_groups` DISABLE KEYS */;
INSERT INTO `broker_groups_possible_initial_groups` VALUES (5,9);
/*!40000 ALTER TABLE `broker_groups_possible_initial_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_groups_transaction_fees`
--

DROP TABLE IF EXISTS `broker_groups_transaction_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_groups_transaction_fees` (
  `transaction_fee_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `FK8E3E931385B3A90F` (`group_id`),
  KEY `FK8E3E9313CA99FDAA` (`transaction_fee_id`),
  CONSTRAINT `FK8E3E9313CA99FDAA` FOREIGN KEY (`transaction_fee_id`) REFERENCES `transaction_fees` (`id`),
  CONSTRAINT `FK8E3E931385B3A90F` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_groups_transaction_fees`
--

LOCK TABLES `broker_groups_transaction_fees` WRITE;
/*!40000 ALTER TABLE `broker_groups_transaction_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker_groups_transaction_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brokering_commission_status`
--

DROP TABLE IF EXISTS `brokering_commission_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brokering_commission_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brokering_id` int(11) DEFAULT NULL,
  `broker_commission_id` int(11) DEFAULT NULL,
  `when_apply` varchar(1) NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `amount_type` char(1) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `max_count` int(11) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT '0',
  `total_amount` decimal(21,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id`),
  KEY `FK1E5A2870F7069BBE` (`broker_commission_id`),
  KEY `FK1E5A2870F096D933` (`brokering_id`),
  CONSTRAINT `FK1E5A2870F096D933` FOREIGN KEY (`brokering_id`) REFERENCES `brokerings` (`id`),
  CONSTRAINT `FK1E5A2870F7069BBE` FOREIGN KEY (`broker_commission_id`) REFERENCES `transaction_fees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brokering_commission_status`
--

LOCK TABLES `brokering_commission_status` WRITE;
/*!40000 ALTER TABLE `brokering_commission_status` DISABLE KEYS */;
INSERT INTO `brokering_commission_status` VALUES (1,1,2,'C','2.500000','P','2013-12-15',NULL,'2013-12-15 03:15:37',NULL,20,0,'0.000000');
/*!40000 ALTER TABLE `brokering_commission_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brokerings`
--

DROP TABLE IF EXISTS `brokerings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brokerings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `broker_id` int(11) NOT NULL,
  `brokered_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6445482A4B8741B8` (`broker_id`),
  KEY `FK6445482ABF06B6F9` (`brokered_id`),
  CONSTRAINT `FK6445482ABF06B6F9` FOREIGN KEY (`brokered_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK6445482A4B8741B8` FOREIGN KEY (`broker_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brokerings`
--

LOCK TABLES `brokerings` WRITE;
/*!40000 ALTER TABLE `brokerings` DISABLE KEYS */;
INSERT INTO `brokerings` VALUES (1,3,2,'2013-12-15 03:15:37',NULL);
/*!40000 ALTER TABLE `brokerings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `can_view_message_categories`
--

DROP TABLE IF EXISTS `can_view_message_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `can_view_message_categories` (
  `group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `FKDFC12DBF3F6F4BDC` (`category_id`),
  KEY `FKDFC12DBF659B479` (`group_id`),
  CONSTRAINT `FKDFC12DBF659B479` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKDFC12DBF3F6F4BDC` FOREIGN KEY (`category_id`) REFERENCES `message_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `can_view_message_categories`
--

LOCK TABLES `can_view_message_categories` WRITE;
/*!40000 ALTER TABLE `can_view_message_categories` DISABLE KEYS */;
INSERT INTO `can_view_message_categories` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(9,1),(9,2),(9,3),(5,2),(5,3),(5,1);
/*!40000 ALTER TABLE `can_view_message_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_logs`
--

DROP TABLE IF EXISTS `card_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `card_id` int(11) NOT NULL,
  `by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF1616D7E2B1214C2` (`by_id`),
  KEY `FKF1616D7E293F7A45` (`card_id`),
  CONSTRAINT `FKF1616D7E293F7A45` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`),
  CONSTRAINT `FKF1616D7E2B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_logs`
--

LOCK TABLES `card_logs` WRITE;
/*!40000 ALTER TABLE `card_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `card_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_types`
--

DROP TABLE IF EXISTS `card_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `card_format_number` varchar(56) DEFAULT NULL,
  `default_expiration_number` int(11) DEFAULT NULL,
  `default_expiration_field` int(11) DEFAULT NULL,
  `card_security_code` varchar(1) DEFAULT NULL,
  `show_card_security_code` bit(1) NOT NULL DEFAULT b'0',
  `ignore_day_in_expiration_date` bit(1) NOT NULL DEFAULT b'0',
  `min_card_security_code_length` int(11) DEFAULT NULL,
  `max_card_security_code_length` int(11) DEFAULT NULL,
  `security_code_block_time_number` int(11) DEFAULT NULL,
  `security_code_block_time_field` int(11) DEFAULT NULL,
  `max_security_code_tries` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_types`
--

LOCK TABLES `card_types` WRITE;
/*!40000 ALTER TABLE `card_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `card_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type_id` int(11) NOT NULL,
  `card_number` decimal(19,0) DEFAULT NULL,
  `card_security_code` varchar(64) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `activation_date` datetime DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `card_security_code_blocked_until` datetime DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_number` (`card_number`),
  KEY `FK5A0E763FE01A09E` (`owner_id`),
  KEY `FK5A0E7638595CD86` (`card_type_id`),
  CONSTRAINT `FK5A0E7638595CD86` FOREIGN KEY (`card_type_id`) REFERENCES `card_types` (`id`),
  CONSTRAINT `FK5A0E763FE01A09E` FOREIGN KEY (`owner_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certification_logs`
--

DROP TABLE IF EXISTS `certification_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certification_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `status` varchar(2) NOT NULL,
  `certification_id` int(11) NOT NULL,
  `by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK75720E142B1214C2` (`by_id`),
  KEY `FK75720E14205CEC57` (`certification_id`),
  CONSTRAINT `FK75720E14205CEC57` FOREIGN KEY (`certification_id`) REFERENCES `certifications` (`id`),
  CONSTRAINT `FK75720E142B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certification_logs`
--

LOCK TABLES `certification_logs` WRITE;
/*!40000 ALTER TABLE `certification_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `certification_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications`
--

DROP TABLE IF EXISTS `certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(15,6) NOT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `guarantee_type_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `issuer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK591542F9608B319E` (`buyer_id`),
  KEY `FK591542F99383E848` (`guarantee_type_id`),
  KEY `FK591542F9A5F0DAD8` (`issuer_id`),
  CONSTRAINT `FK591542F9A5F0DAD8` FOREIGN KEY (`issuer_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK591542F9608B319E` FOREIGN KEY (`buyer_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK591542F99383E848` FOREIGN KEY (`guarantee_type_id`) REFERENCES `guarantee_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `internal_name` varchar(50) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `credentials` varchar(1) NOT NULL,
  `pmt_req_ws_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `internal_name` (`internal_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'web','Main web access','D',NULL),(2,'rest','Mobile phone application','D',NULL),(3,'wap2','WAP 2 access','D',NULL),(4,'wap1','WAP 1 access','D',NULL),(5,'webshop','Webshop payments','D',NULL),(6,'posweb','Posweb payments','P',NULL),(7,'pos','POS','P',NULL);
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels_principals`
--

DROP TABLE IF EXISTS `channels_principals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels_principals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `principal` varchar(1) NOT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `is_default` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDABC45D47514938B` (`custom_field_id`),
  KEY `FKDABC45D49B71D578` (`channel_id`),
  CONSTRAINT `FKDABC45D49B71D578` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `FKDABC45D47514938B` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels_principals`
--

LOCK TABLES `channels_principals` WRITE;
/*!40000 ALTER TABLE `channels_principals` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels_principals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `closed_account_balances`
--

DROP TABLE IF EXISTS `closed_account_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `closed_account_balances` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `balance` decimal(21,6) NOT NULL DEFAULT '0.000000',
  `reserved` decimal(21,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id`),
  KEY `ix_cldacctbal_account_date` (`account_id`,`date`),
  KEY `FK8FF83D5C3317FFBA` (`account_id`),
  CONSTRAINT `FK8FF83D5C3317FFBA` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `closed_account_balances`
--

LOCK TABLES `closed_account_balances` WRITE;
/*!40000 ALTER TABLE `closed_account_balances` DISABLE KEYS */;
/*!40000 ALTER TABLE `closed_account_balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `notes` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_id` (`owner_id`,`contact_id`),
  KEY `FKDE2D6053A3365C11` (`contact_id`),
  KEY `FKDE2D6053FE01A09E` (`owner_id`),
  CONSTRAINT `FKDE2D6053FE01A09E` FOREIGN KEY (`owner_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKDE2D6053A3365C11` FOREIGN KEY (`contact_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `pattern` varchar(30) NOT NULL,
  `description` longtext,
  `a_rate_params_id` int(11) DEFAULT NULL,
  `d_rate_params_id` int(11) DEFAULT NULL,
  `i_rate_params_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBF10006FD5E3649E` (`d_rate_params_id`),
  KEY `FKBF10006F239B8C3E` (`a_rate_params_id`),
  KEY `FKBF10006FFF05CD3E` (`i_rate_params_id`),
  CONSTRAINT `FKBF10006FFF05CD3E` FOREIGN KEY (`i_rate_params_id`) REFERENCES `rate_parameters` (`id`),
  CONSTRAINT `FKBF10006F239B8C3E` FOREIGN KEY (`a_rate_params_id`) REFERENCES `rate_parameters` (`id`),
  CONSTRAINT `FKBF10006FD5E3649E` FOREIGN KEY (`d_rate_params_id`) REFERENCES `rate_parameters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'US Dollar','USD','$#amount#',NULL,NULL,NULL,NULL),(2,'Brazilian Real','BRL','R$#amount#',NULL,NULL,NULL,NULL),(3,'Points','Points','#amount# points',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_possible_values`
--

DROP TABLE IF EXISTS `custom_field_possible_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_possible_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `is_enabled` bit(1) NOT NULL DEFAULT b'1',
  `is_default` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`,`parent_id`,`value`),
  KEY `FK8C2BD41DB0A99719` (`parent_id`),
  KEY `FK8C2BD41DD6C28FF7` (`field_id`),
  CONSTRAINT `FK8C2BD41DD6C28FF7` FOREIGN KEY (`field_id`) REFERENCES `custom_fields` (`id`),
  CONSTRAINT `FK8C2BD41DB0A99719` FOREIGN KEY (`parent_id`) REFERENCES `custom_field_possible_values` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_possible_values`
--

LOCK TABLES `custom_field_possible_values` WRITE;
/*!40000 ALTER TABLE `custom_field_possible_values` DISABLE KEYS */;
INSERT INTO `custom_field_possible_values` VALUES (1,2,NULL,'Male','','\0'),(2,2,NULL,'Female','','\0'),(3,6,NULL,'Example area','','\0');
/*!40000 ALTER TABLE `custom_field_possible_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_values`
--

DROP TABLE IF EXISTS `custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(10) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `string_value` varchar(4000) DEFAULT NULL,
  `possible_value_id` int(11) DEFAULT NULL,
  `member_value_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `pending_member_id` int(11) DEFAULT NULL,
  `imported_member_id` int(11) DEFAULT NULL,
  `member_hidden` bit(1) NOT NULL DEFAULT b'0',
  `admin_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `ad_id` int(11) DEFAULT NULL,
  `scheduled_payment_id` int(11) DEFAULT NULL,
  `transfer_id` bigint(20) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `guarantee_id` int(11) DEFAULT NULL,
  `loan_group_id` int(11) DEFAULT NULL,
  `member_record_id` int(11) DEFAULT NULL,
  `imported_ad_id` int(11) DEFAULT NULL,
  `imported_member_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_string_value` (`string_value`(255)),
  KEY `FK8AE18A15B3A79238` (`scheduled_payment_id`),
  KEY `FK8AE18A152F78F3B3` (`transfer_id`),
  KEY `FK8AE18A1529C0E817` (`guarantee_id`),
  KEY `FK8AE18A1573D9F3D7` (`operator_id`),
  KEY `FK8AE18A15EA75B58B` (`imported_member_record_id`),
  KEY `FK8AE18A15D6C28FF7` (`field_id`),
  KEY `FK8AE18A15CA915C00` (`possible_value_id`),
  KEY `FK8AE18A15EAE0AB57` (`member_id`),
  KEY `FK8AE18A15629CF4CC` (`pending_member_id`),
  KEY `FK8AE18A15CAF74240` (`ad_id`),
  KEY `FK8AE18A15B1DE9525` (`member_value_id`),
  KEY `FK8AE18A15E9B959A1` (`invoice_id`),
  KEY `FK8AE18A15D2DEA05B` (`admin_id`),
  KEY `FK8AE18A15726DC538` (`member_record_id`),
  KEY `FK8AE18A1554774F2E` (`loan_group_id`),
  KEY `FK8AE18A15A71C13E9` (`imported_ad_id`),
  KEY `FK8AE18A1581B2B280` (`imported_member_id`),
  CONSTRAINT `FK8AE18A1581B2B280` FOREIGN KEY (`imported_member_id`) REFERENCES `imported_members` (`id`),
  CONSTRAINT `FK8AE18A1529C0E817` FOREIGN KEY (`guarantee_id`) REFERENCES `guarantees` (`id`),
  CONSTRAINT `FK8AE18A152F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK8AE18A1554774F2E` FOREIGN KEY (`loan_group_id`) REFERENCES `loan_groups` (`id`),
  CONSTRAINT `FK8AE18A15629CF4CC` FOREIGN KEY (`pending_member_id`) REFERENCES `pending_members` (`id`),
  CONSTRAINT `FK8AE18A15726DC538` FOREIGN KEY (`member_record_id`) REFERENCES `member_records` (`id`),
  CONSTRAINT `FK8AE18A1573D9F3D7` FOREIGN KEY (`operator_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK8AE18A15A71C13E9` FOREIGN KEY (`imported_ad_id`) REFERENCES `imported_ads` (`id`),
  CONSTRAINT `FK8AE18A15B1DE9525` FOREIGN KEY (`member_value_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK8AE18A15B3A79238` FOREIGN KEY (`scheduled_payment_id`) REFERENCES `scheduled_payments` (`id`),
  CONSTRAINT `FK8AE18A15CA915C00` FOREIGN KEY (`possible_value_id`) REFERENCES `custom_field_possible_values` (`id`),
  CONSTRAINT `FK8AE18A15CAF74240` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`),
  CONSTRAINT `FK8AE18A15D2DEA05B` FOREIGN KEY (`admin_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK8AE18A15D6C28FF7` FOREIGN KEY (`field_id`) REFERENCES `custom_fields` (`id`),
  CONSTRAINT `FK8AE18A15E9B959A1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `FK8AE18A15EA75B58B` FOREIGN KEY (`imported_member_record_id`) REFERENCES `imported_member_records` (`id`),
  CONSTRAINT `FK8AE18A15EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_values`
--

LOCK TABLES `custom_field_values` WRITE;
/*!40000 ALTER TABLE `custom_field_values` DISABLE KEYS */;
INSERT INTO `custom_field_values` VALUES (1,'member',1,'02/03/1981',NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'member',2,NULL,1,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'member',3,'4959 SW 33rd Way',NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'member',4,'33312',NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'member',5,'Hollywood',NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'member',6,NULL,NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'member',7,'305-349-3387',NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'member',8,'305-342-2557',NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'member',9,NULL,NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'member',10,NULL,NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'member',1,'15/12/2013',NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'member',2,NULL,1,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'member',3,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'member',4,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'member',5,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'member',6,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'member',7,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'member',8,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'member',9,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'member',10,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(10) NOT NULL,
  `internal_name` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `order_number` smallint(6) NOT NULL,
  `type` varchar(10) NOT NULL,
  `control` varchar(10) NOT NULL,
  `size` varchar(1) DEFAULT NULL,
  `val_required` bit(1) NOT NULL,
  `val_unique` bit(1) NOT NULL,
  `val_min_length` smallint(6) DEFAULT NULL,
  `val_max_length` smallint(6) DEFAULT NULL,
  `val_class` varchar(256) DEFAULT NULL,
  `all_selected_label` varchar(100) DEFAULT NULL,
  `pattern` varchar(100) DEFAULT NULL,
  `description` longtext,
  `parent_id` int(11) DEFAULT NULL,
  `member_visibility_access` varchar(1) DEFAULT NULL,
  `member_update_access` varchar(1) DEFAULT NULL,
  `member_search_access` varchar(1) DEFAULT NULL,
  `member_loan_search_access` varchar(1) DEFAULT NULL,
  `member_ad_search_access` varchar(1) DEFAULT NULL,
  `member_can_hide` bit(1) NOT NULL DEFAULT b'0',
  `member_show_in_print` bit(1) NOT NULL DEFAULT b'0',
  `member_indexing` varchar(1) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `operator_visibility` varchar(1) DEFAULT NULL,
  `ad_show_in_search` bit(1) NOT NULL DEFAULT b'0',
  `ad_indexed` bit(1) NOT NULL DEFAULT b'0',
  `ad_visibility` varchar(1) DEFAULT NULL,
  `transfer_type_id` int(11) DEFAULT NULL,
  `payment_enabled` bit(1) NOT NULL DEFAULT b'1',
  `payment_search_access` varchar(1) DEFAULT NULL,
  `payment_list_access` varchar(1) DEFAULT NULL,
  `loan_group_show_in_search` bit(1) NOT NULL DEFAULT b'0',
  `member_record_type_id` int(11) DEFAULT NULL,
  `record_show_in_search` bit(1) NOT NULL DEFAULT b'0',
  `record_show_in_list` bit(1) NOT NULL DEFAULT b'0',
  `record_broker_access` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2EE15F47E46288C5` (`member_record_type_id`),
  KEY `FK2EE15F47EAE0AB57` (`member_id`),
  KEY `FK2EE15F47A4766B0A` (`transfer_type_id`),
  KEY `FK2EE15F478988CA47` (`parent_id`),
  CONSTRAINT `FK2EE15F478988CA47` FOREIGN KEY (`parent_id`) REFERENCES `custom_fields` (`id`),
  CONSTRAINT `FK2EE15F47A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK2EE15F47E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`),
  CONSTRAINT `FK2EE15F47EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (1,'member','birthday','Birthday',0,'date','text','S','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(2,'member','gender','Gender',1,'enum','radio','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(3,'member','address','Address',2,'string','text','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','A',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(4,'member','postalCode','Postal code',3,'string','text','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(5,'member','city','City',4,'string','text','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','A',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(6,'member','area','Area',5,'enum','select','D','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','A',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(7,'member','phone','Phone',6,'string','text','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(8,'member','mobilePhone','Mobile phone',7,'string','text','L','\0','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(9,'member','fax','Fax',8,'string','text','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(10,'member','url','Url',9,'url','text','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(11,'pmt','identifier','Identifier',0,'string','text','S','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','\0',NULL,NULL,NULL,'\0','\0',NULL,22,'','F','N','\0',NULL,'\0','\0',NULL),(12,'record','comments','Comments',0,'string','textarea','F','','\0',NULL,NULL,NULL,NULL,NULL,'Remark comments',NULL,NULL,NULL,NULL,NULL,NULL,'\0','\0',NULL,NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',1,'\0','','E'),(13,'member','Broker','Branch',10,'member','member','D','','\0',0,0,NULL,NULL,NULL,'Branch association',NULL,'R','R','B','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL);
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_broker_commissions`
--

DROP TABLE IF EXISTS `default_broker_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_broker_commissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `broker_id` int(11) DEFAULT NULL,
  `broker_commission_id` int(11) DEFAULT NULL,
  `amount` decimal(15,6) NOT NULL,
  `amount_type` char(1) NOT NULL,
  `when_apply` varchar(1) NOT NULL,
  `when_count` int(11) DEFAULT NULL,
  `set_by_broker` bit(1) DEFAULT NULL,
  `suspended` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK88481840F7069BBE` (`broker_commission_id`),
  KEY `FK884818404B8741B8` (`broker_id`),
  CONSTRAINT `FK884818404B8741B8` FOREIGN KEY (`broker_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK88481840F7069BBE` FOREIGN KEY (`broker_commission_id`) REFERENCES `transaction_fees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_broker_commissions`
--

LOCK TABLES `default_broker_commissions` WRITE;
/*!40000 ALTER TABLE `default_broker_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_broker_commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `document_page_id` int(11) DEFAULT NULL,
  `form_page_id` int(11) DEFAULT NULL,
  `binary_file_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `visibility` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK383D52B8EAE0AB57` (`member_id`),
  KEY `FK383D52B8FF98BF58` (`binary_file_id`),
  KEY `FK383D52B8F4C05F3` (`form_page_id`),
  KEY `FK383D52B81EB6834A` (`document_page_id`),
  CONSTRAINT `FK383D52B81EB6834A` FOREIGN KEY (`document_page_id`) REFERENCES `files` (`id`),
  CONSTRAINT `FK383D52B8EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK383D52B8F4C05F3` FOREIGN KEY (`form_page_id`) REFERENCES `files` (`id`),
  CONSTRAINT `FK383D52B8FF98BF58` FOREIGN KEY (`binary_file_id`) REFERENCES `binary_files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_log_entries`
--

DROP TABLE IF EXISTS `error_log_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_log_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `path` varchar(200) NOT NULL,
  `removed` bit(1) NOT NULL,
  `logged_user_id` int(11) DEFAULT NULL,
  `stack_trace` longtext,
  PRIMARY KEY (`id`),
  KEY `FKDBACAEDE2EB5623F` (`logged_user_id`),
  CONSTRAINT `FKDBACAEDE2EB5623F` FOREIGN KEY (`logged_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_log_entries`
--

LOCK TABLES `error_log_entries` WRITE;
/*!40000 ALTER TABLE `error_log_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_log_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_log_entry_parameters`
--

DROP TABLE IF EXISTS `error_log_entry_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_log_entry_parameters` (
  `error_log_entry_id` int(11) NOT NULL,
  `value` longtext,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`error_log_entry_id`,`name`),
  KEY `FKA47F4149820A7941` (`error_log_entry_id`),
  CONSTRAINT `FKA47F4149820A7941` FOREIGN KEY (`error_log_entry_id`) REFERENCES `error_log_entries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_log_entry_parameters`
--

LOCK TABLES `error_log_entry_parameters` WRITE;
/*!40000 ALTER TABLE `error_log_entry_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_log_entry_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_accounts`
--

DROP TABLE IF EXISTS `external_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` longtext,
  `member_account_id` int(11) NOT NULL,
  `system_account_id` int(11) NOT NULL,
  `file_mapping_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE7A59DDAF865E9E2` (`file_mapping_id`),
  KEY `FKE7A59DDA99B38EF5` (`system_account_id`),
  KEY `FKE7A59DDAE6699C5F` (`member_account_id`),
  CONSTRAINT `FKE7A59DDAE6699C5F` FOREIGN KEY (`member_account_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `FKE7A59DDA99B38EF5` FOREIGN KEY (`system_account_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `FKE7A59DDAF865E9E2` FOREIGN KEY (`file_mapping_id`) REFERENCES `file_mappings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_accounts`
--

LOCK TABLES `external_accounts` WRITE;
/*!40000 ALTER TABLE `external_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_transfer_imports`
--

DROP TABLE IF EXISTS `external_transfer_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_transfer_imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `by_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK60B0F30E123F9A53` (`by_id`),
  KEY `FK60B0F30EEAEDFACC` (`account_id`),
  CONSTRAINT `FK60B0F30EEAEDFACC` FOREIGN KEY (`account_id`) REFERENCES `external_accounts` (`id`),
  CONSTRAINT `FK60B0F30E123F9A53` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_transfer_imports`
--

LOCK TABLES `external_transfer_imports` WRITE;
/*!40000 ALTER TABLE `external_transfer_imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_transfer_imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_transfer_types`
--

DROP TABLE IF EXISTS `external_transfer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_transfer_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(1) NOT NULL,
  `transfer_type_id` int(11) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`,`code`),
  KEY `FK20F3219A4766B0A` (`transfer_type_id`),
  KEY `FK20F3219EAEDFACC` (`account_id`),
  CONSTRAINT `FK20F3219EAEDFACC` FOREIGN KEY (`account_id`) REFERENCES `external_accounts` (`id`),
  CONSTRAINT `FK20F3219A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_transfer_types`
--

LOCK TABLES `external_transfer_types` WRITE;
/*!40000 ALTER TABLE `external_transfer_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_transfer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_transfers`
--

DROP TABLE IF EXISTS `external_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(1) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,6) DEFAULT NULL,
  `description` longtext,
  `line_number` int(11) DEFAULT NULL,
  `comments` longtext,
  `account_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB8B2A274EAE0AB57` (`member_id`),
  KEY `FKB8B2A2743C9C4AF3` (`import_id`),
  KEY `FKB8B2A274EAEDFACC` (`account_id`),
  KEY `FKB8B2A274D64E2913` (`type_id`),
  CONSTRAINT `FKB8B2A274D64E2913` FOREIGN KEY (`type_id`) REFERENCES `external_transfer_types` (`id`),
  CONSTRAINT `FKB8B2A2743C9C4AF3` FOREIGN KEY (`import_id`) REFERENCES `external_transfer_imports` (`id`),
  CONSTRAINT `FKB8B2A274EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKB8B2A274EAEDFACC` FOREIGN KEY (`account_id`) REFERENCES `external_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_transfers`
--

LOCK TABLES `external_transfers` WRITE;
/*!40000 ALTER TABLE `external_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_mappings`
--

DROP TABLE IF EXISTS `field_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_index` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `field` varchar(2) NOT NULL,
  `file_mapping_id` int(11) NOT NULL,
  `member_field_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK295A0B0A141FB961` (`file_mapping_id`),
  KEY `FK295A0B0AF865E9E2` (`file_mapping_id`),
  KEY `FK295A0B0AACBA9282` (`member_field_id`),
  CONSTRAINT `FK295A0B0AACBA9282` FOREIGN KEY (`member_field_id`) REFERENCES `custom_fields` (`id`),
  CONSTRAINT `FK295A0B0A141FB961` FOREIGN KEY (`file_mapping_id`) REFERENCES `file_mappings` (`id`),
  CONSTRAINT `FK295A0B0AF865E9E2` FOREIGN KEY (`file_mapping_id`) REFERENCES `file_mappings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_mappings`
--

LOCK TABLES `field_mappings` WRITE;
/*!40000 ALTER TABLE `field_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_mappings`
--

DROP TABLE IF EXISTS `file_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(3) NOT NULL,
  `account_id` int(11) NOT NULL,
  `date_format` varchar(20) DEFAULT NULL,
  `number_format` varchar(1) DEFAULT NULL,
  `decimal_places` int(11) DEFAULT NULL,
  `decimal_separator` char(1) DEFAULT NULL,
  `negative_amount_value` varchar(50) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `string_quote` char(1) DEFAULT NULL,
  `column_separator` char(1) DEFAULT NULL,
  `header_lines` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7282A8C8EAEDFACC` (`account_id`),
  CONSTRAINT `FK7282A8C8EAEDFACC` FOREIGN KEY (`account_id`) REFERENCES `external_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_mappings`
--

LOCK TABLES `file_mappings` WRITE;
/*!40000 ALTER TABLE `file_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `last_modified` datetime NOT NULL,
  `contents` longtext,
  `type` varchar(1) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `group_filter_id` int(11) DEFAULT NULL,
  `original_contents` longtext,
  `new_contents` longtext,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5CEBA77D6DB8FB3` (`document_id`),
  KEY `FK5CEBA779D46A867` (`group_filter_id`),
  KEY `FK5CEBA7725A5B3E8` (`group_id`),
  CONSTRAINT `FK5CEBA7725A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK5CEBA779D46A867` FOREIGN KEY (`group_filter_id`) REFERENCES `group_filters` (`id`),
  CONSTRAINT `FK5CEBA77D6DB8FB3` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'c','posweb.css','2013-12-15 02:25:28','body, td, th, input, textarea, select, .tdHeaderTable, a {\n	font-size: 11pt;\n	margin: 0px;\n}\n\n.poswebBanner {\n	background: white url(posweb_header_background.jpg) repeat-x;\n	height: 129px;\n	margin-bottom: 50px;\n	position: relative;	\n}\n\n.poswebBannerText {\n	font-size:   10pt;\n	font-weight: bold;\n	color: white;\n	position: absolute;\n	bottom: 8px;\n	right: 10px;\n	display: inline;\n}\n\ntable.poswebLoginTable {\n	width: 		400px;\n	float:		none;\n}\n\ntable.poswebTopTable {\n	margin:			0px;\n	float:			none;\n}\n\ninput.button, input.ButtonDisabled, button {\n	font-size: 		10pt !important;\n	float: 			right;\n	margin-left: 	10px;\n	padding: 5px 10px;\n}\n\n.ieold button, .ieold .button, .ieold .linkButton, .ieold .ButtonDisabled {\n	padding: 2px 0px;\n}\n\ninput.poswebAction {\n	margin: 		6px;\n}\n\ninput.date {\n	width: 			115px !important;\n}\n\ntable.poswebRoot {\n	height: 		100%;\n	width: 			100%;\n}\ntable.poswebRoot>tr>td, table.poswebRoot>tbody>tr>td {\n	text-align: 	center;\n	vertical-align: center;\n}\n\nselect {\n	height: auto;\n}\n\n.tdHeaderTable {\n    font-size: 12pt;\n}','C',NULL,NULL,'body, td, th, input, textarea, select, .tdHeaderTable, a {\n	font-size: 11pt;\n	margin: 0px;\n}\n\n.poswebBanner {\n	background: white url(posweb_header_background.jpg) repeat-x;\n	height: 129px;\n	margin-bottom: 50px;\n	position: relative;	\n}\n\n.poswebBannerText {\n	font-size:   10pt;\n	font-weight: bold;\n	color: white;\n	position: absolute;\n	bottom: 8px;\n	right: 10px;\n	display: inline;\n}\n\ntable.poswebLoginTable {\n	width: 		400px;\n	float:		none;\n}\n\ntable.poswebTopTable {\n	margin:			0px;\n	float:			none;\n}\n\ninput.button, input.ButtonDisabled, button {\n	font-size: 		10pt !important;\n	float: 			right;\n	margin-left: 	10px;\n	padding: 5px 10px;\n}\n\n.ieold button, .ieold .button, .ieold .linkButton, .ieold .ButtonDisabled {\n	padding: 2px 0px;\n}\n\ninput.poswebAction {\n	margin: 		6px;\n}\n\ninput.date {\n	width: 			115px !important;\n}\n\ntable.poswebRoot {\n	height: 		100%;\n	width: 			100%;\n}\ntable.poswebRoot>tr>td, table.poswebRoot>tbody>tr>td {\n	text-align: 	center;\n	vertical-align: center;\n}\n\nselect {\n	height: auto;\n}\n\n.tdHeaderTable {\n    font-size: 12pt;    \n}',NULL,NULL),(2,'c','style.css','2013-12-15 02:25:28','/*\n* Green\n*/\n\n/*  --------------------------- Body ---------------------------*/\nbody, .bgBody {\n	margin-top:	    0px;\n	margin-left:    8px;\n	margin-right:   8px;\n	margin-bottom:  0px;\n	padding:        0px;\n	border:         0px;\n	font-family:    Liberation sans, Arial, Sans-serif;\n	font-size:	    9pt;\n	background: 	white;\n}\nbody.main {\n	background-color: #f5f5f5;\n	text-align: center;\n}\n\n.bodyPrint {\n	margin: 5px;\n	color:	black;\n}\n\n.bodyImage {\n	margin:     0px;\n	background: #F0F8FF;\n	overflow:   hidden;\n}\n\n/*  ---------------------- Global layout -----------------------*/\n\n/* Top-most table on the layout */\n.topTable {\n	width:  940px;\n}\n\n.topContainer {\n	margin: 16px auto;\n	width: 960px;\n}\n\n.topContainer>tr>td, .topContainer>tbody>tr>td {\n	border: 1px solid #dedede;\n	border-radius: 6px;\n	-moz-border-radius: 6px;\n	-webkit-border-radius: 6px;\n}\n.topContainerBorder {\n	border: 1px solid #c4c4c4;\n	border-radius: 6px;\n	-moz-border-radius: 6px;\n	-webkit-border-radius: 6px;\n	padding: 9px 9px 12px 9px;\n	background: white;\n	min-height: 600px;\n	overflow: auto;\n}\n.topBanner {\n	background: white url(top_background.jpg) no-repeat;\n	height: 129px;\n	margin-bottom: 10px;\n	position: relative;\n}\n.topBannerText {\n	font-size:   10pt;\n	font-weight: bold;\n	color: white;\n	font-weight: bold;\n	position: absolute;\n	bottom: 8px;\n	left: 10px;\n}\n.minHeight {\n	height: 500px;\n}\n\n.standaloneContents {\n	width: 			716px;\n	margin-left: 	auto;\n	margin-right: 	auto;\n}\n\n/* System header bar */\n.headerBar {\n	border:  0px;\n	margin:  0px;\n}\n\n/* Bar that shows the logged user */\n.loginDataBar {\n	background:				-moz-linear-gradient(center top, #FFFFFF, #FFFFFF 50%, #EDEDED 100%);\n	background:				-webkit-gradient(linear, center top, center bottom, color-stop(0%, #FFFFFF), color-stop(50%, #FFFFFF), color-stop(100%, #EDEDED));\n	border:					1px solid #CCCCCC;\n	overflow:				hidden;\n	padding-right:			7px;\n	padding-top:			3px;\n	padding-bottom:			3px;\n	line-height:			12px;\n	text-align:				right;\n	background-color:		#F7F7F7;\n	-moz-border-radius: 	4px;\n	-webkit-border-radius:	4px;\n	border-radius: 			4px;\n}\n\n/* Span that shows data on the logged user bar */\n.loginData {\n	font-weight:	bold;\n	font-size:		8pt;\n	color:			#3E3E3D;\n	font-family:    Liberation sans, Arial, Sans-serif;\n	padding-left:	5px;\n}\n\n/* Even rows on result lists */\n.ClassColor1 {\n	background-color: #ffffff;\n}\n\n/* Odd rows on result lists */\n.ClassColor2 {\n	background-color: #fffcf4;\n}\n\n/* Rows when the mouse is over it */\n.ClassColorSelected {\n	background-color: #ffeed7;\n	text-decoration: none;\n}\n\n.tdHeaderContents, .ClassColor1>td, .ClassColor2>td, .ClassColorSelected>td {\n	padding:    	4px 3px !important;\n	line-height: 	19px !important;\n}\n\n/* Messages that appear next to fields (like date format) */\n.fieldDecoration {\n	color: red !important;\n}\n\n/* Messages that appear at the bottom of the page */\n.footerNote {\n	font-weight: bold;\n	text-align:  center;\n	width:       100%;\n	color:       #3E3E3D;\n}\n\n/* Pagination text for search results */\n.pagination {\n}\n\n/* Pagination links */\n.paginationLink {\n	font-weight: bold;\n}\n\n/* Current page in pagination */\n.currentPage {\n	font-weight: bold;\n	color: red;\n}\n\n/* Contents on print windows */\n.printContent {\n	background-color: white;\n	border: none;\n}\n\n/* Title on print pages */\n.printTitle {\n	color:       black;\n	font-weight: bold;\n	font-size:   10pt;\n	text-align:  center;\n}\n\n/* Labels on print page */\n.printLabel {\n	color:       black;\n	font-weight: bold;\n	font-size:   9pt;\n	font-style:  italic;\n	text-align:  right;\n	vertical-align: top;\n}\n\n/* Column headers */\nth.printLabel {\n	text-align: center !important;\n}\n\n/* Data on print page */\n.printData {\n	color: black;\n	vertical-align: top;\n}\n\n/* Elements with border */\n.printBorder, .printBorder th, .printBorder td {\n	border: 1px solid black;\n	border-collapse: collapse;\n	padding: 1px 2px;\n}\n\n/*  -------------------------- Help ----------------------------*/\n\n.helpWindowBody {\n	margin:     0px;\n	cursor:     default;\n	background: #f9f9f9;\n}\n\n.helpWindowTable {\n	border:     0px;\n	width:      100%;\n	height:     100%;\n	background: #f9f9f9;\n}\n\n.helpWindowTableContent {\n	color:       navy;\n}\n\nbr.small {\n	font-size: 6px;\n}\n\n/*  ------------------------ Tables ----------------------------*/\n\n.defaultTable, .defaultTableCenter {\n	border:          0px;\n	border-spacing:  0px;\n	border-collapse: collapse;\n	padding:         0px;\n	width:	    	 100%;\n	empty-cells:     show;\n}\n\n.standAloneFixedWidth {\n	width:	    	 716px !important;\n}\n\n.bordered {\n	border-bottom:		1px solid #CCCCCC;\n	border-spacing:		0px;\n	border-collapse:	collapse;\n}\n\n.fullBordered {\n	border:				1px solid #CCCCCC;\n}\n\n.defaultTableCenter {\n	text-align: center;\n	vertical-align: middle;\n}\n\n.defaultTableContent, .defaultTableContentHidden {\n	width:					716px;\n	_width:					714px;\n	padding:				0px;\n	margin:					10px 0px 4px;\n	border-spacing:			0px;\n	float:					left;\n}\n\n.defaultTableContent {\n	border:					1px solid #006500;\n	border-radius:			4px 4px 4px 4px;\n	-moz-border-radius:		4px 4px 4px 4px;\n	-webkit-border-radius:	4px 4px 4px 4px;\n	box-shadow:				1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n	-moz-box-shadow:		1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n	-webkit-box-shadow:		1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n}\n\n.standaloneContents .defaultTableContent, .standaloneContents .defaultTableContentHidden {\n	width: 100%;\n}\n\ntable.nested, table.nested.td, table.nested.th {\n	margin:          0px;\n	padding:         0px;\n	border-collapse: collapse;\n	border-spacing:  0px;\n}\n\nform {\n	display: inline;\n	margin:  0px;\n}\n\ntd, pre, legend {\n	font-family:    Liberation sans, Arial, Sans-serif;\n	font-size:		9pt;\n	color: 			#3E3E3D;\n}\n\npre {\n	display:inline;\n}\n\n\n.tdHeaderTable {\n	background-color:		#006500;\n	border-bottom: 			1px solid white;\n	border-radius:			3px 0px 0px 0px;\n	-moz-border-radius:		3px 0px 0px 0px;\n	-webkit-border-radius:	3px 0px 0px 0px;\n	color:					#FFFFFF;\n	padding-left:			10px;\n    padding-top:			7px;\n	padding-bottom:			7px;\n    vertical-align: 		top;\n	font-size:				10pt;\n	font-weight:			bold;\n	text-align:				left;\n}\n\n.tdHelpIcon {\n	background-color:		#006500;\n	border-bottom:			1px solid white;\n	border-radius:			0px 3px 0px 0px;\n	-moz-border-radius:		0px 3px 0px 0px;\n	-webkit-border-radius:	0px 3px 0px 0px;\n	padding-right:			9px;\n	padding-top: 			0px;\n    vertical-align: 		middle;\n}\n\n.ie .tdHelpIcon, .ie .tdHeaderTable {\n      border-top: none;\n}\n\n.tdHelpIcon img {\n	margin-left: 3px;\n}\n\n.innerBorder {\n}\n\n.bottomLeft {\n	height: 6px;\n}\n\n.bottomRight {\n	height: 6px;\n}\n\n.tdHeaderContents {\n	background-color:	#FFEED7;\n	color:				#3E3E3D;\n	text-align:			center;\n	border:				1px solid #FFFFFF;\n	font-family:    	Liberation sans, Arial, Sans-serif;\n	font-size:			9pt;\n	font-weight:		bold;\n}\n\n.tdContentTable {\n	padding: 8px;\n}\n\n.tdContentTableForms {\n	padding: 5px;\n}\n\n.tdContentTableLists {\n	padding: 1px;\n}\n\n.tdContentTableLists table {\n	border-spacing: 1px;\n}\n\n.tdContentTableForms table {\n	border-spacing: 3px;\n}\n\n.tdContentTableLists table td, .tdContentTableLists table th {\n	padding: 3px 4px;\n	line-height: 18px;\n}\n\n.tdContentTableForms table td, .tdContentTableForms table th {\n	padding-top: 3px;\n	padding-left: 2px;\n	padding-right: 2px;\n	padding-bottom: 3px;\n}\n\n.tdContents {\n	background:		transparent;\n	padding:		0px;\n	padding-left:	14px;\n	border:			none;\n	float:			left;\n	text-align:		left;\n	width: 			716px;\n	color: 			#3E3E3D;\n}\n\n.tdContentsStandalone {\n	text-align: 	left;\n	padding-left: 	0px;\n	width: 			100%;\n}\n\n.tdContentsCenter {\n	background:	    #FFFFFF;\n	text-align:     center;\n	vertical-align: middle;\n}\n\n.loadingMessage {\n	border:				#d15113 1px solid;\n	background-color: 	#FFF4E6;\n	color: 	        	#3E3E3D;\n	font-family:    	Liberation sans, Arial, Sans-serif;\n	font-size:      	9pt;\n	text-align:     	center;\n	padding:			0px 8px;\n	line-height:        20px;\n}\n\n.tablePrint {\n	width:	    	 100%;\n	border:          1px solid #808080;\n	border-spacing:  0px;\n	border-collapse: collapse;\n}\n\n.tdPrintHeader {\n	color:			 black;\n	font-weight:     bold;\n	text-align:      center;\n	vertical-align:  middle;\n	border:          1px solid #808080;\n	border-spacing:  0px;\n	border-collapse: collapse;\n}\n\n.tdPrintData {\n	color:			 black;\n	text-align:      left;\n	vertical-align:  middle;\n	border:          1px solid #808080;\n	border-spacing:  0px;\n	border-collapse: collapse;\n}\n\n.tdPrintDataBold {\n	color:			 black;\n	font-weight:     bold;\n	text-align:      left;\n	vertical-align:  middle;\n	border:          1px solid #808080;\n	border-spacing:  0px;\n	border-collapse: collapse;\n}\n\n/*  -------------------------- Menus ---------------------------*/\n\n.menuHolder {\n	border:			0px;\n	padding:		0px;\n	vertical-align:	top;\n	width:			210px !important;\n	float:          left;\n	margin-top:		10px;\n}\n\n/* move to top the same margin as .menu uses on to, so the first item won\'t be shifted */\n.menuContainer {\n	width:					210px;\n	border:					1px solid #006500;\n	border-radius:			4px 4px 4px 4px;\n	-moz-border-radius:		4px 4px 4px 4px;\n	-webkit-border-radius:	4px 4px 4px 4px;\n	box-shadow:				1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n	-moz-box-shadow:		1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n	-webkit-box-shadow:		1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n	padding: 0;\n	text-align: left;\n	margin: 0px;\n}\n\n.menu, .menuHover {\n	width:				210px !important;\n	background-color:	#006500;\n	border-bottom: 		1px solid white;\n	margin: 			0px;\n	padding:  			0px;\n	overflow: 			hidden;\n	list-style: 		none;\n}\n\n.firstMenu, .firstMenuHover {\n	*margin-bottom: -3px;\n}\n\n.menuText {\n	padding-top: 	7px;\n	padding-bottom:	2px;\n	padding-left:	10px;\n	font-family:   	Liberation sans, Arial, Sans-serif;\n	color: 			#FFFFFF;\n	font-size: 		10pt;\n	font-weight:	bold;\n	display:		block;\n	height:			20px;\n}\n\n.menuBullet {\n	display:		none;\n}\n\n.subMenu, .subMenuHover {\n	background-color: 		white;\n	background-image: 		url(\'block.png\');\n	background-position: 	9px 4px;\n	background-repeat: 		no-repeat;\n	border:					none;\n	width: 				210px;\n	padding: 1px 0;\n}\n\n.subMenuText {\n	font-family:   	Liberation sans, Arial, Sans-serif;\n	color: 			#3E3E3D;\n	font-size:		10pt;\n	margin-left:	5px;\n	padding-top:	1px;\n	padding-bottom:	1px;\n	width: 			180px;\n	display:		inline-block;\n}\n\n.subMenuBullet {\n	height:				3px;\n	width:				3px;\n	background-color:	#006500;\n	margin:				9px 1px 3px 11px;\n	font-size:          1px;\n	display:			inline-block;\n	vertical-align:		top;\n}\n\n.menuHover .menuText, .firstMenuHover .menuText, .lastMenuHover .menuText {\n	background-color:	#00B300;\n}\n\n.subMenuHover .subMenuText {\n	text-decoration: underline;\n}\n\n.firstMenu, .firstMenuHover {\n	border-radius:			3px 3px 0px 0px;\n	-moz-border-radius:		3px 3px 0px 0px;\n	-webkit-border-radius:	3px 3px 0px 0px;\n}\n\n.lastMenu, .lastMenuHover {\n	border-bottom: none;\n	border-radius:			0px 0px 3px 3px;\n	-moz-border-radius:		0px 0px 3px 3px;\n	-webkit-border-radius:	0px 0px 3px 3px;\n}\n\n.subMenuContainer {\n	margin: 0px;\n	padding: 0px;\n	border-top: 1px solid white;\n}\n\n.firstSubMenu {\n	padding-top: 6px;\n}\n\n.lastSubMenu {\n	padding-bottom: 6px;\n}\n\n/*  -------------------------- Links ---------------------------*/\n\na {\n	text-decoration: none;\n	color:	    	 blue;\n}\n\na.default {\n	text-decoration: underline !important;\n	color:	    	 blue !important;\n}\n\na.linkList, a.profileLink, a.adminProfileLink, a.operatorProfileLink {\n	color: blue;\n}\n\na.linkList:hover, a.profileLink:hover, a.adminProfileLink:hover, a.operatorProfileLink:hover {\n	color: red;\n}\n\n\n/*  ----------------------- Form fields ------------------------*/\n\n/* Buttons */\nbutton, .button, .linkButton, .ButtonDisabled {\n\n	background:				-moz-linear-gradient(center top, #faf4e2 0%, #FDCE7E 100%);\n	background:             -webkit-linear-gradient(top,  #faf4e2 0%,#FDCE7E 100%);\n	background:				-webkit-gradient(linear, center top, center bottom, color-stop(0%, #faf4e2), color-stop(100%, #FDCE7E));\n	background-color:		#fcdca6;\n	border:					1px solid #EC9A38;\n	border-radius:			4px 4px 4px 4px;\n	-moz-border-radius:		4px 4px 4px 4px;\n	-webkit-border-radius:	4px 4px 4px 4px;\n	text-shadow: 			1px 1px 2px #faf4e2;\n	color:					#414141;\n	font-family:    		Liberation sans, Arial, Sans-serif;\n	font-size:				9pt;\n	font-weight:			normal;\n	cursor:					pointer;\n	padding: 				5px 10px;\n}\n\n.ieold button, .ieold .button, .ieold .linkButton, .ieold .ButtonDisabled {\n  padding: 1px 0px !important;\n}\n\n.ie button, .ie .button, .ie .linkButton, .ie .ButtonDisabled {\n  padding: 4px 8px;\n  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#FAF4E2\', endColorstr=\'#FDCE7E\'); /* IE gradients */\n  background-color: transparent;\n}\n\n/* Disabled buttons */\n.ButtonDisabled {\n	background:				-moz-linear-gradient(center top, #FFFFFF, #DDDDDD 100%);\n	background:				-webkit-gradient(linear, center top, center bottom, color-stop(0%, #FFFFFF), color-stop(100%, #DDDDDD));\n	background-color:		#e9eef4;\n	color:					#888888;\n	border-color:			#cccccc;\n}\n\nbutton:hover, .button:hover, .linkButton:hover {\n	color:			#ff4800;\n	border:			1px solid #ff5b1a;\n}\n\n/* General inputs */\ninput, textarea, select, .radio, .printButton {\n	border: 		#CCCCCC 1px solid;\n	color: 			#3E3E3D;\n	font-family:   	Liberation sans, Arial, Sans-serif;\n	font-size: 		9pt;\n	font-weight:    normal;\n	margin: 		0px\n}\n\ninput, textarea, select, .radio, .checkbox, option {\n  background-color: white;\n}\n\n/* Hide mozilla inner button, when you click on virtual keyboard buttons it won\'t select the text*/\ninput::-moz-focus-inner {\n	border: none;\n}\n\n/* Select boxes */\nselect {\n	height: 22px;\n	background-color:white;\n	vertical-align: top;\n}\n\noption {\n	padding: 3px 6px 2px 2px;\n}\n\n/* Radios and checkboxes */\n.radio, .checkbox {\n	border: 1px solid #1e5180;\n}\n\n/* Enabled input boxes */\n.InputBoxEnabled {\n	background-color:	#FFFFFF;\n	color:				#3E3E3D;\n}\n\n/* Disabled input boxes */\n.InputBoxDisabled {\n	background-color:	#F5F5F5;\n	color: 				#3E3E3D;\n}\n\n/* Field sizes */\ninput.tiny, textarea.tiny, select.tiny {\n	width: 118px;\n}\ninput.small, textarea.small, select.small {\n	width: 168px;\n}\ninput.medium, textarea.medium, select.medium {\n	width: 218px;\n}\ninput.large, textarea.large, select.large {\n	width: 368px;\n}\ninput.full, textarea.full, select.full {\n	width: 98%;\n}\n\n/* Text fields padding */\ninput.tiny, textarea.tiny, input.small, textarea.small, input.medium, textarea.medium, input.large, textarea.large, input.full, textarea.full {\n	padding: 3px 2px;\n}\n\ninput {\n	padding: 3px 2px;\n}\n\n/* A div that looks like a field */\ndiv.fakeField, div.fakeFieldDisabled {\n	background-color:	#FFFFFF;\n	border:				#CCCCCC 1px solid;\n	color:				#3E3E3D;\n	font-family:    	Liberation sans, Arial, Sans-serif;\n	font-size:			9pt;\n	font-weight:		normal;\n	padding-left:		2px;\n	padding-right:		2px;\n	vertical-align:		top;\n	white-space:        normal;\n}\n\n/* A disabled div that looks like a field */\ndiv.fakeFieldDisabled {\n	background-color: #F5F5F5 !important;\n}\n\n/* Multi drop down definitions */\n.multiDropDownText {\n	color: 	     #3E3E3D;\n	font-family: Liberation sans, Arial, Sans-serif;\n	font-size: 	 9pt;\n}\n\n.multiDropDownLabel {\n	padding: 2px 4px 2px 0px !important;\n}\n\n\n.multiDropDown {\n	border: 	 1px solid #CCCCCC;\n	background:  white;\n	text-align: left;\n}\n\n.multiDropDownOption {\n	padding: 2px 2px 0px;\n}\n\n.multiDropDownDisabled {\n	border: 	 1px solid #CCCCCC;\n	background:  #F5F5F5;\n}\n\n.multiDropDownHover {\n	background:	#FFEED7;\n}\n\n/* Virtual keyboard definitions */\n.virtualKeyboardButton {\n	background:					-moz-linear-gradient(center top, #dce6f4 0%, #fcfefc 25%, #c4d6ec 100%);\n	background:					-webkit-gradient(linear, center top, center bottom, color-stop(0%, #dce6f4), color-stop(25%, #fcfefc), color-stop(100%, #c4d6ec));\n	background-color:			#dce6f4;\n	border:						1px solid #9CB3D8;\n	border-radius:				3px 3px 3px 3px;\n	-moz-border-radius:			3px 3px 3px 3px;\n	-webkit-border-radius:		3px 3px 3px 3px;\n	text-shadow: 				1px 1px 2px #faf4e2;\n	color: 	    				navy;\n	padding:					4px 4px 4px 4px;\n 	width:			            28px;\n   	margin:         		   	1px;\n   	cursor:            		   	pointer;\n}\n\n.ie .virtualKeyboardButton {\n	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#dce6f4\', endColorstr=\'#fcfefc\'); /* IE gradients */\n  	background-color: transparent;\n\n}\n\n.virtualKeyboardButtonHover {\n	background-color:			#f4faff;\n	background:					-moz-linear-gradient(center top, #f4faff 0%, #ffffff 25%, #e1f3ff 100%);\n	background:					-webkit-gradient(linear, center top, center bottom, color-stop(0%, #f4faff), color-stop(25%, #ffffff), color-stop(100%, #e1f3ff));\n}\n\n.ie .virtualKeyboardButtonHover {\n	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#f4faff\', endColorstr=\'#ffffff\'); /* IE gradients */\n  	background-color: transparent;\n}\n\n.virtualKeyboardContrastVeryLow {\n	color: #aac3db;\n}\n\n.virtualKeyboardContrastLow {\n	color: #90a5ba;\n}\n\n.virtualKeyboardContrastNormal {\n	color: #798b9c;\n}\n\n.virtualKeyboardContrastHigh {\n	color: #606e7b;\n}\n\n.virtualKeyboardContrastVeryHigh {\n	color: navy;\n}\n\n/* Fieldsets */\nfieldset {\n	border:	1px solid #008000;\n	margin:	5px 2px;\n}\n\n/* Fieldset legends */\nlegend {\n	font-weight: bold;\n	margin-left: 10px;\n}\n\n/* Labels on forms */\n.label {\n	text-align:     right;\n	font-weight:    bold;\n}\n\ntd.label {\n    padding-right:  4px !important;\n    padding-top: 7px !important;\n    padding-bottom: 7px !important;\n    vertical-align: top;\n}\nspan.label, span.lastLabel, span.inlineLabel {\n	font-weight: 	bold;\n	display: 		inline-block;\n}\n\nspan.label, span.lastLabel {\n	padding-top: 	3px !important;\n}\n\nspan.label, span.inlineLabel {\n	padding-right:	4px !important;\n}\n\n/* Labels that looks like headers */\n.headerLabel {\n	border: 			1px solid #FFFFFF;\n	background-color: 	#FFEED7;\n	color: 				#3E3E3D;\n	text-align:         right;\n	font-weight:        bold;\n    padding:            5px 5px 6px !important;\n}\n@-moz-document url-prefix() {\n    .headerLabel {\n        padding:            6px 5px 5px !important;\n    }\n}\n.headerField {\n	padding-left: 5px !important;\n}\n\n/* Decorated labels on forms */\n.decoratedLabel {\n	color:         red;\n	text-align:    right;\n	font-weight:   bold;\n	padding-right: 5px;\n}\n\n/* TDs that should be class label but have nested label spans */\n.nestedLabel {\n	text-align:    right;\n	padding-right: 0px;\n}\n\n/* Buttons on print pages */\n.printButton {\n	border:     black 1px solid;\n	color:      black;\n	background: #dddddd;\n}\n\n/* Horizontal rules */\nhr {\n	height:           0px;\n	border:           none;\n	border-top:       1px solid #008000;\n}\n\nhr.print {\n	height:           0px;\n	border:           none;\n	border-top:       1px solid black;\n}\n\n/* Image scroller (on profile or ad details) definitions */\n.imageContainer {\n	border:     1px solid #CCCCCC;\n	text-align: center;\n}\n\n.thumbnail {\n	margin: 1px;\n}\n\n.imageOnly {\n	margin: 0px !important;\n	padding: 0px !important;\n	border: none !important;\n}\n\n.imageContainer a {\n	color: #3E3E3D;\n	text-decoration: none;\n}\n\n.imageContainer a:hover {\n	color: red;\n}\n\n.imageIndex {\n}\n\n.imageRemove, .imageControls, .imageSetCaption, .imageDetails {\n	border-top: 1px solid #CCCCCC;\n}\n\n/* Image view popup definitions */\n.popupThumbnailContainer {\n	padding-top:    10px;\n	padding-bottom: 10px;\n	padding-left:   20px;\n	padding-right:  0px;\n	height:         80px;\n	width:          100%;\n	border-bottom:  1px solid #CCCCCC;\n	overflow:       auto;\n	overflow-y:     hidden;\n	text-align:     left;\n	white-space:    nowrap;\n}\n\n.popupThumbnail {\n	vertical-align: middle;\n	margin-right:   20px;\n}\n\n.popupImageContainer {\n	text-align:     center;\n	padding:        20px;\n	padding-bottom: 0px;\n}\n\n/* Autocompletion divs */\n.autoComplete {\n	position:         absolute;\n	background-color: white;\n	border: 	      1px solid #CCCCCC;\n	margin:           0px;\n	padding:          0px;\n	cursor:           default;\n	font-weight:      normal;\n	z-index: 		  1;\n}\n\n.autoComplete ul {\n	list-style-type: none;\n	margin:          0px;\n	padding:         0px;\n	overflow:        auto;\n	overflow-x:      hidden;\n}\n\n.autoComplete ul li {\n	background:  white;\n	color:       #3E3E3D;\n	white-space: nowrap;\n	text-align:  left;\n	padding:     2px;\n}\n\n.autoComplete ul li.selected {\n	background:	     #FFEED7;\n}\n\n.draggableList {\n	list-style-type:  none;\n	margin:           0px;\n	padding:          0px;\n	background-color: #F0F8FF;\n	border:           1px solid #CCCCCC;\n	padding-top:      10px;\n}\n\n.draggableList li {\n	margin-bottom:   10px;\n	cursor: move;\n}\n\n/*  ---------------- Page specific definitions -----------------*/\n\n/* Account history */\n\n.ClassColorCredit {\n	color: blue !important;\n}\n\n.ClassColorCredit a {\n	color: blue !important;\n}\n\n.ClassColorDebit {\n	color: red !important;\n}\n\n.ClassColorDebit a {\n	color: red !important;\n}\n\n\n/* Ad search */\n\n.productTitle, .productTitle a {\n	font-weight: bold;\n	color: red;\n	text-decoration: underline;\n}\n\n.productOwner {\n	font-weight: bold;\n	font-style: italic;\n}\n\n.productOwner a {\n	color:           blue;\n	text-decoration: underline;\n}\n\n.productDescription {\n}\n\nul.categoryLevel0 {\n	list-style-type: none;\n	margin-bottom: 10px;\n	padding-left: 20px;\n	margin-left: 0px;\n}\n\nul.categoryLevel1 {\n	list-style-type: square;\n	padding-left: 15px;\n	margin-bottom: 5px;\n	margin-left: 0px;\n}\n\nul.categoryLevel2 {\n	list-style-type: disc;\n	padding-left: 15px;\n	margin-left: 0px;\n}\n\nli.categoryLevel1 {\n	font-weight: bold;\n	padding-left: 0px;\n	color: #009a00;\n}\n\nli.categoryLevel2 {\n	font-weight: normal;\n	padding-left: 0px;\n	color: #009a00;\n}\n\nli.categoryLevel3 {\n	font-weight: normal;\n	padding-left: 0px;\n	color: #009a00;\n}\n\nspan.categoryLevel1Text, span.categoryLevel2Text, span.categoryLevel3Text {\n	color: #3E3E3D;\n}\n\nspan.categoryLevel1TextHover, span.categoryLevel2TextHover, span.categoryLevel3TextHover {\n	color: blue;\n	text-decoration: underline;\n}\n\nspan.categoryCountText{\n	color: #009a00;\n}\n\n/* Customized files list */\n.conflict {\n	color: red;\n}\n\n/* Messages */\n.unreadMessage {\n	font-weight: bold;\n}\n\n.readMessage {\n}\n\n.removedMessage {\n	font-style: italic;\n}\n\n.repliedMessage {\n}\n\ndiv.manualPage h1 {\n	font-size: 14pt;\n}\n\ndiv.manualPage h2 {\n	font-size: 12pt;\n}\n\ndiv.manualPage h3 {\n	font-size: 10pt;\n	margin: 0px;\n	padding: 0px;\n	margin-top: 20px;\n}\n\ndiv.manualPage a {\n	text-decoration: underline;\n	color: blue;\n}\n\na.manualLink {\n	color: #3E3E3D;\n}\n\na.manualLink:hover {\n	color: blue;\n	text-decoration: underline;\n}\n\n.alertNotification {\n	width: 		400px;\n	border: 	2px solid red;\n	padding: 	10px;\n	color: 		red;\n	font-size: 	11pt;\n}\n\nimg.quickAccessIcon {\n	border: none;\n	display: block;\n	margin-bottom: 5px;\n}\n\n.quickAccessLink {\n    background-color: white;\n    display: inline-block;\n    padding: 2px;\n    border: 1px solid white;\n    border-radius: 4px;\n    -moz-border-radius:	4px;\n	-webkit-border-radius: 4px;\n    width: 95%;\n}\n\n.quickAccessLink:hover {\n	background-color: #EBF2FA;\n	border: 1px solid #B0B0B0;\n}\n\n@media print {\n\n	.printButton {\n		display:none;\n	}\n}','C',NULL,NULL,'/*\n* Default light blue\n*/\n\n/*  --------------------------- Body ---------------------------*/\nbody, .bgBody {\n	margin-top:	    0px;\n	margin-left:    8px;\n	margin-right:   8px;\n	margin-bottom:  0px;\n	padding:        0px;\n	border:         0px;\n	font-family:    Liberation sans, Arial, Sans-serif;\n	font-size:	    9pt;\n	background: 	white;\n}\nbody.main {\n	background-color: #f5f5f5;\n	text-align: center;\n}\n\n.bodyPrint {\n	margin: 5px;\n	color:	black;\n}\n\n.bodyImage {\n	margin:     0px;\n	background: #F0F8FF;\n	overflow:   hidden;\n}\n\n/*  ---------------------- Global layout -----------------------*/\n\n/* Top-most table on the layout */\n.topTable {\n	width:  940px;\n}\n\n.topContainer {\n	margin: 16px auto;\n	width: 960px;\n}\n\n.topContainer>tr>td, .topContainer>tbody>tr>td {\n	border: 1px solid #dedede;\n	border-radius: 6px;\n	-moz-border-radius: 6px;\n	-webkit-border-radius: 6px;\n}\n.topContainerBorder {\n	border: 1px solid #c4c4c4;\n	border-radius: 6px;\n	-moz-border-radius: 6px;\n	-webkit-border-radius: 6px;\n	padding: 9px 9px 12px 9px;\n	background: white;\n	min-height: 600px;\n	overflow: auto;\n}\n.topBanner {\n	background: white url(top_background.jpg) no-repeat;\n	height: 129px;\n	margin-bottom: 10px;\n	position: relative;\n}\n.topBannerText {\n	font-size:   10pt;\n	font-weight: bold;\n	color: white;\n	position: absolute;\n	bottom: 8px;\n	left: 10px;\n}\n.minHeight {\n	height: 500px;\n}\n\n.standaloneContents {\n	width: 			716px;\n	margin-left: 	auto;\n	margin-right: 	auto;\n}\n\n/* System header bar */\n.headerBar {\n	border:  0px;\n	margin:  0px;\n}\n\n/* Bar that shows the logged user */\n.loginDataBar {\n	background:				-moz-linear-gradient(center top, #FFFFFF, #FFFFFF 50%, #EDEDED 100%);\n	background:				-webkit-gradient(linear, center top, center bottom, color-stop(0%, #FFFFFF), color-stop(50%, #FFFFFF), color-stop(100%, #EDEDED));\n	border:					1px solid #CCCCCC;\n	overflow:				hidden;\n	padding-right:			7px;\n	padding-top:			3px;\n	padding-bottom:			3px;\n	line-height:			12px;\n	text-align:				right;\n	background-color:		#F7F7F7;\n	-moz-border-radius: 	4px;\n	-webkit-border-radius:	4px;\n	border-radius: 			4px;\n}\n\n/* Span that shows data on the logged user bar */\n.loginData {\n	font-weight:	bold;\n	color:			#0067A3;\n	font-family:    Liberation sans, Arial, Sans-serif;\n	font-size:	    8pt;\n	padding-left:	5px;\n}\n\n/* Even rows on result lists */\n.ClassColor1 {\n	background-color: #ffffff;\n}\n\n/* Odd rows on result lists */\n.ClassColor2 {\n	background-color: #F1F7FE;\n}\n\n/* Rows when the mouse is over it */\n.ClassColorSelected {\n	background-color: #e5f0fe;\n	text-decoration: none;\n}\n\n.tdHeaderContents, .ClassColor1>td, .ClassColor2>td, .ClassColorSelected>td {\n	padding:    	4px 3px !important;\n	line-height: 	19px !important;\n}\n\n/* Messages that appear next to fields (like date format) */\n.fieldDecoration {\n	color: red !important;\n}\n\n/* Messages that appear at the bottom of the page */\n.footerNote {\n	font-weight: bold;\n	text-align:  center;\n	width:       100%;\n	color:       #0067a3;\n}\n\n/* Pagination text for search results */\n.pagination {\n}\n\n/* Pagination links */\n.paginationLink {\n	font-weight: bold;\n}\n\n/* Current page in pagination */\n.currentPage {\n	font-weight: bold;\n	color: red;\n}\n\n/* Contents on print windows */\n.printContent {\n	background-color: white;\n	border: none;\n}\n\n/* Title on print pages */\n.printTitle {\n	color:       black;\n	font-weight: bold;\n	font-size:   10pt;\n	text-align:  center;\n}\n\n/* Labels on print page */\n.printLabel {\n	color:       black;\n	font-weight: bold;\n	font-size:   9pt;\n	font-style:  italic;\n	text-align:  right;\n	vertical-align: top;\n}\n\n/* Column headers */\nth.printLabel {\n	text-align: center !important;\n}\n\n/* Data on print page */\n.printData {\n	color: black;\n	vertical-align: top;\n}\n\n/* Elements with border */\n.printBorder, .printBorder th, .printBorder td {\n	border: 1px solid black;\n	border-collapse: collapse;\n	padding: 1px 2px;\n}\n\n/*  -------------------------- Help ----------------------------*/\n\n.helpWindowBody {\n	margin:     0px;\n	cursor:     default;\n	background: #fff;\n}\n\n.helpWindowTable {\n	border:     0px;\n	width:      100%;\n	height:     100%;\n	background: #fff;\n}\n\n.helpWindowTableContent {\n	/*color:       navy;*/\n}\n\nbr.small {\n	font-size: 6px;\n}\n\n/*  ------------------------ Tables ----------------------------*/\n\n.defaultTable, .defaultTableCenter {\n	border:          0px;\n	border-spacing:  0px;\n	border-collapse: collapse;\n	padding:         0px;\n	width:	    	 100%;\n	empty-cells:     show;\n}\n\n.standAloneFixedWidth {\n	width:	    	 716px !important;\n}\n\n.bordered {\n	border-bottom:		1px solid #CCCCCC;\n	border-spacing:		0px;\n	border-collapse:	collapse;\n}\n\n.fullBordered {\n	border:				1px solid #CCCCCC;\n}\n\n.defaultTableCenter {\n	text-align: center;\n	vertical-align: middle;\n}\n\n.defaultTableContent, .defaultTableContentHidden {\n	width:					716px;\n	_width:					714px;\n	padding:				0px;\n	margin:					10px 0px 4px;\n	border-spacing:			0px;\n	float:					left;\n}\n\n.defaultTableContent {\n	border:					1px solid #CCCCCC;\n	border-radius:			4px 4px 4px 4px;\n	-moz-border-radius:		4px 4px 4px 4px;\n	-webkit-border-radius:	4px 4px 4px 4px;\n	box-shadow:				1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n	-moz-box-shadow:		1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n	-webkit-box-shadow:		1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n}\n\n.standaloneContents .defaultTableContent, .standaloneContents .defaultTableContentHidden {\n	width: 100%;\n}\n\ntable.nested, table.nested.td, table.nested.th {\n	margin:          0px;\n	padding:         0px;\n	border-collapse: collapse;\n	border-spacing:  0px;\n}\n\nform {\n	display: inline;\n	margin:  0px;\n}\n\ntd, pre, legend {\n	color: 			#0067a3;\n	font-family:    Liberation sans, Arial, Sans-serif;\n	font-size:		9pt;\n}\n\npre {\n	display:inline;\n}\n\n\n.tdHeaderTable {\n	background-color:		#ebf2fa;\n	border-top: 			1px solid white;\n	border-bottom: 			1px solid #CCCCCC;\n	border-radius:			4px 0px 0px 0px;\n	-moz-border-radius:		4px 0px 0px 0px;\n	-webkit-border-radius:	4px 0px 0px 0px;\n	color:					#0067a3;\n	padding-left:			10px;\n    padding-top: 			7px;\n    padding-bottom:			7px;\n    vertical-align: 		top;\n	font-size:				10pt;\n	text-align:				left;\n}\n\n.tdHelpIcon {\n	background-color:		#ebf2fa;\n	border-top: 			1px solid white;\n	border-bottom:			1px solid #CCCCCC;\n	border-radius:			0px 4px 0px 0px;\n	-moz-border-radius:		0px 4px 0px 0px;\n	-webkit-border-radius:	0px 4px 0px 0px;\n	padding-right:			9px;\n	padding-top: 			0px;\n	vertical-align: 		middle;\n}\n\n.ie .tdHelpIcon, .ie .tdHeaderTable {\n      border-top: none;\n}\n\n.tdHelpIcon img {\n	margin-left: 3px;\n}\n\n.innerBorder {\n}\n\n.bottomLeft {\n	height: 6px;\n}\n\n.bottomRight {\n	height: 6px;\n}\n\n.tdHeaderContents {\n	background-color:	#F5F5F5;\n	color:				#0067a3;\n	text-align:			center;\n	border:				1px solid #FFFFFF;\n	font-weight:		bold;\n	font-size: 			9pt;\n}\n\n.tdContentTable {\n	padding: 8px;\n}\n\n.tdContentTableForms {\n	padding: 5px;\n}\n\n.tdContentTableLists {\n	padding: 1px;\n}\n\n.tdContentTableLists table {\n	border-spacing: 1px;\n}\n\n.tdContentTableForms table {\n	border-spacing: 3px;\n}\n\n.tdContentTableLists table td, .tdContentTableLists table th {\n	padding: 3px 4px;\n	line-height: 18px;\n}\n\n.tdContentTableForms table td, .tdContentTableForms table th {\n	padding-top: 3px;\n	padding-left: 2px;\n	padding-right: 2px;\n	padding-bottom: 3px;\n}\n\n.tdContents {\n	background:		transparent;\n	padding:		0px;\n	padding-left:	14px;\n	border:			none;\n	float:			left;\n	text-align:		left;\n	width: 			716px;\n	color: 			#0067a3;\n}\n\n.tdContentsStandalone {\n	text-align: 	left;\n	padding-left: 	0px;\n	width: 			100%;\n}\n\n.tdContentsCenter {\n	background:	    #FFFFFF;\n	text-align:     center;\n	vertical-align: middle;\n}\n\n.loadingMessage {\n	border:				#EC9A38 1px solid;\n	background-color: 	#FFF4E6;\n	color: 	        	#0067a3;\n	font-family:    	Liberation sans, Arial, Sans-serif;\n	font-size:      	9pt;\n	text-align:     	center;\n	padding:			0px 8px;\n	line-height:        20px;\n}\n\n.tablePrint {\n	width:	    	 100%;\n	border:          1px solid #808080;\n	border-spacing:  0px;\n	border-collapse: collapse;\n}\n\n.tdPrintHeader {\n	color:			 black;\n	font-weight:     bold;\n	text-align:      center;\n	vertical-align:  middle;\n	border:          1px solid #808080;\n	border-spacing:  0px;\n	border-collapse: collapse;\n}\n\n.tdPrintData {\n	color:			 black;\n	text-align:      left;\n	vertical-align:  middle;\n	border:          1px solid #808080;\n	border-spacing:  0px;\n	border-collapse: collapse;\n}\n\n.tdPrintDataBold {\n	color:			 black;\n	font-weight:     bold;\n	text-align:      left;\n	vertical-align:  middle;\n	border:          1px solid #808080;\n	border-spacing:  0px;\n	border-collapse: collapse;\n}\n\n/*  -------------------------- Menus ---------------------------*/\n\n.menuHolder {\n	border:			0px;\n	padding:		0px;\n	vertical-align:	top;\n	width:			210px !important;\n	float:          left;\n	margin-top:		10px;\n}\n\n/* move to top the same margin as .menu uses on to, so the first item won\'t be shifted */\n.menuContainer {\n	width:					210px;\n	border:					1px solid #CCCCCC;\n	border-radius:			4px 4px 4px 4px;\n	-moz-border-radius:		4px 4px 4px 4px;\n	-webkit-border-radius:	4px 4px 4px 4px;\n	box-shadow:				1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n	-moz-box-shadow:		1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n	-webkit-box-shadow:		1px 3px 5px 1px rgba(0, 0, 0, 0.25);\n	padding: 0;\n	text-align: left;\n	margin: 0px;\n}\n\n.menu, .menuHover {\n	width:				210px !important;\n	background-color:	#ebf2fa;\n	border-top:			1px solid white;\n	border-bottom: 		1px solid #CCCCCC;\n	margin: 			0px;\n	padding:  			0px;\n	overflow: 			hidden;\n	list-style: 		none;\n}\n\n.firstMenu, .firstMenuHover {\n	*margin-bottom: -3px;\n}\n\n.menuText {\n	padding-top: 	7px;\n	padding-bottom:	2px;\n	padding-left:	10px;\n	font-family:    Liberation sans, Arial, Sans-serif;\n	color: 			#0067a3;\n	font-size: 		10pt;\n	display:		block;\n	height:			20px;\n}\n\n.menuBullet {\n	display:		none;\n}\n\n.subMenu, .subMenuHover {\n	background-color: 	white;\n	border:				none;\n	list-style: 		none;\n	width: 				210px;\n	padding: 1px 0;\n}\n\n.subMenuText {\n	font-family:    Liberation sans, Arial, Sans-serif;\n	color: 			#0067a3;\n	font-size:		10pt;\n	margin-left:	5px;\n	padding-top:	1px;\n	padding-bottom:	1px;\n	width: 			160px;\n	display:		inline-block;\n}\n\n.subMenuBullet {\n	height:				3px;\n	width:				3px;\n	background-color:	#0075AD;\n	margin:				9px 1px 3px 11px;\n	font-size:          1px;\n	display:			inline-block;\n	vertical-align:		top;\n}\n\n.menuHover .menuText, .firstMenuHover .menuText, .lastMenuHover .menuText {\n	background: 		-moz-linear-gradient(center top, #fff4db 0%, #fff4db 20%, #FCE1A2 100%);\n	background:         -webkit-linear-gradient(top,  #fff4db 0%, #fff4db 20%, #FCE1A2 100%);\n	background:			-webkit-gradient(linear, center top, center bottom, color-stop(0%, #fff4db), color-stop(20%, #fff4db), color-stop(100%, #FCE1A2));\n	background-color:	#fff4db;\n}\n\n.ie .menuHover .menuText, .ie .firstMenuHover .menuText, .ie .lastMenuHover .menuText {\n	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#fff4db\', endColorstr=\'#FCE1A2\'); /* IE gradients */\n  	background-color: transparent;\n\n}\n\n.subMenuHover .subMenuText {\n	text-decoration: underline;\n}\n\n.firstMenu, .firstMenuHover {\n	border-radius:			4px 4px 0px 0px;\n	-moz-border-radius:		4px 4px 0px 0px;\n	-webkit-border-radius:	4px 4px 0px 0px;\n}\n\n.lastMenu, .lastMenuHover {\n	border-bottom: none;\n	border-radius:			0px 0px 4px 4px;\n	-moz-border-radius:		0px 0px 4px 4px;\n	-webkit-border-radius:	0px 0px 4px 4px;\n}\n\n.subMenuContainer {\n	margin: 0px;\n	padding: 0px;\n	border-top: 1px solid #cccccc;\n}\n\n.firstSubMenu {\n	padding-top: 6px;\n}\n\n.lastSubMenu {\n	padding-bottom: 6px;\n}\n\n/*  -------------------------- Links ---------------------------*/\n\na {\n	text-decoration: none;\n	color:	    	 blue;\n}\n\na.default {\n	text-decoration: underline !important;\n	color:	    	 blue !important;\n}\n\na.linkList, a.profileLink, a.adminProfileLink, a.operatorProfileLink {\n	color: blue;\n}\n\na.linkList:hover, a.profileLink:hover, a.adminProfileLink:hover, a.operatorProfileLink:hover {\n	color: red;\n}\n\n\n/*  ----------------------- Form fields ------------------------*/\n\n/* Buttons */\nbutton, .button, .linkButton, .ButtonDisabled {\n\n	background:				-moz-linear-gradient(center top, #faf4e2 0%, #FDCE7E 100%);\n	background:             -webkit-linear-gradient(top,  #faf4e2 0%,#FDCE7E 100%);\n	background:				-webkit-gradient(linear, center top, center bottom, color-stop(0%, #faf4e2), color-stop(100%, #FDCE7E));\n	background-color:		#fcdca6;\n	border:					1px solid #EC9A38;\n	border-radius:			4px 4px 4px 4px;\n	-moz-border-radius:		4px 4px 4px 4px;\n	-webkit-border-radius:	4px 4px 4px 4px;\n	text-shadow: 			1px 1px 2px #faf4e2;\n	color:					#414141;\n	font-family:    		Liberation sans, Arial, Sans-serif;\n	font-size:				9pt;\n	font-weight:			normal;\n	cursor:					pointer;\n	padding: 				5px 10px;\n}\n\n.ieold button, .ieold .button, .ieold .linkButton, .ieold .ButtonDisabled {\n  padding: 1px 0px !important;\n}\n\n.ie button, .ie .button, .ie .linkButton, .ie .ButtonDisabled {\n  padding: 4px 8px;\n  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#FAF4E2\', endColorstr=\'#FDCE7E\'); /* IE gradients */\n  background-color: transparent;\n}\n\n/* Disabled buttons */\n.ButtonDisabled {\n	background:				-moz-linear-gradient(center top, #FFFFFF, #DDDDDD 100%);\n	background:				-webkit-gradient(linear, center top, center bottom, color-stop(0%, #FFFFFF), color-stop(100%, #DDDDDD));\n	background-color:		#e9eef4;\n	color:					#888888;\n	border-color:			#cccccc;\n}\n\nbutton:hover, .button:hover, .linkButton:hover {\n	color:			#ff4800;\n	border:			1px solid #ff5b1a;\n}\n\n/* General inputs */\ninput, textarea, select, .radio, .printButton {\n	border: 		#CCCCCC 1px solid;\n	color: 			#0067a3;\n	font-family:    Liberation sans, Arial, Sans-serif;\n	font-size: 		9pt;\n	font-weight:    normal;\n	margin: 		0px;\n}\ninput, textarea, select, .radio, .checkbox, option {\n  background-color: white;\n}\n\n\n/* Hide mozilla inner button, when you click on virtual keyboard buttons it won\'t select the text*/\ninput::-moz-focus-inner {\n	border: none;\n}\n\n/* Select boxes */\nselect {\n	height: 22px;\n	background-color:white;\n	vertical-align: top;\n}\noption {\n	padding: 3px 6px 2px 2px;\n}\n\n/* Radios and checkboxes */\n.radio, .checkbox {\n	border: 1px solid #1e5180;\n}\n\n/* Enabled input boxes */\n.InputBoxEnabled {\n	background-color:	#FFFFFF;\n	color:				#0067a3;\n}\n\n/* Disabled input boxes */\n.InputBoxDisabled {\n	background-color:	#F5F5F5;\n	color: 				#0067a3;\n}\n\n/* Field sizes */\ninput.tiny, textarea.tiny, select.tiny {\n	width: 118px;\n}\ninput.small, textarea.small, select.small {\n	width: 168px;\n}\ninput.medium, textarea.medium, select.medium {\n	width: 218px;\n}\ninput.large, textarea.large, select.large {\n	width: 368px;\n}\ninput.full, textarea.full, select.full {\n	width: 98%;\n}\n\n/* Text fields padding */\ninput.tiny, textarea.tiny, input.small, textarea.small, input.medium, textarea.medium, input.large, textarea.large, input.full, textarea.full {\n	padding: 3px 2px;\n\n}\n\ninput {\n	padding: 3px 2px;\n}\n\n/* A div that looks like a field */\ndiv.fakeField, div.fakeFieldDisabled {\n	background-color:	#FFFFFF;\n	border:				#CCCCCC 1px solid;\n	color:				#0067a3;\n	font-family:    	Liberation sans, Arial, Sans-serif;\n	font-size:			9pt;\n	font-weight:		normal;\n	padding-left:		2px;\n	padding-right:		2px;\n	vertical-align:		top;\n	white-space:        normal;\n}\n\n/* A disabled div that looks like a field */\ndiv.fakeFieldDisabled {\n	background-color: #F5F5F5 !important;\n}\n\n/* Multi drop down definitions */\n.multiDropDownText {\n	color: 	     #0067a3;\n	font-family: Liberation sans, Arial, Sans-serif;\n	font-size: 	 9pt;\n}\n\n.multiDropDownLabel {\n	padding: 2px 4px 2px 0px !important;\n}\n\n.multiDropDown {\n	border: 	 1px solid #CCCCCC;\n	background:  white;\n	text-align: left;\n}\n\n.multiDropDownOption {\n	padding: 2px 2px 0px;\n}\n\n.multiDropDownDisabled {\n	border: 	 1px solid #CCCCCC;\n	background:  #F5F5F5;\n}\n\n.multiDropDownHover {\n	background:	#e5f0fe;\n}\n\n/* Virtual keyboard definitions */\n.virtualKeyboardButton {\n	background:					-moz-linear-gradient(center top, #dce6f4 0%, #fcfefc 25%, #c4d6ec 100%);\n	background:					-webkit-gradient(linear, center top, center bottom, color-stop(0%, #dce6f4), color-stop(25%, #fcfefc), color-stop(100%, #c4d6ec));\n	background-color:			#dce6f4;\n	border:						1px solid #9CB3D8;\n	border-radius:				3px 3px 3px 3px;\n	-moz-border-radius:			3px 3px 3px 3px;\n	-webkit-border-radius:		3px 3px 3px 3px;\n	text-shadow: 				1px 1px 2px #faf4e2;\n	color: 	    				navy;\n	padding:					4px 4px 4px 4px;\n 	width:			            28px;\n   	margin:         		   	1px;\n   	cursor:            		   	pointer;\n}\n\n.ie .virtualKeyboardButton {\n	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#dce6f4\', endColorstr=\'#fcfefc\'); /* IE gradients */\n  	background-color: transparent;\n\n}\n\n.virtualKeyboardButtonHover {\n	background-color:			#f4faff;\n	background:					-moz-linear-gradient(center top, #f4faff 0%, #ffffff 25%, #e1f3ff 100%);\n	background:					-webkit-gradient(linear, center top, center bottom, color-stop(0%, #f4faff), color-stop(25%, #ffffff), color-stop(100%, #e1f3ff));\n}\n\n.ie .virtualKeyboardButtonHover {\n	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#f4faff\', endColorstr=\'#ffffff\'); /* IE gradients */\n  	background-color: transparent;\n}\n\n.virtualKeyboardContrastVeryLow {\n	color: #aac3db;\n}\n\n.virtualKeyboardContrastLow {\n	color: #90a5ba;\n}\n\n.virtualKeyboardContrastNormal {\n	color: #798b9c;\n}\n\n.virtualKeyboardContrastHigh {\n	color: #606e7b;\n}\n\n.virtualKeyboardContrastVeryHigh {\n	color: navy;\n}\n\n/* Fieldsets */\nfieldset {\n	border:	1px solid #9ab8d5;\n	margin:	5px 2px;\n}\n\n/* Fieldset legends */\nlegend {\n	font-weight: bold;\n	margin-left: 10px;\n}\n\n/* Labels on forms */\n.label {\n	text-align:     right;\n	font-weight:    bold;\n}\n\ntd.label {\n	padding-right:  4px !important;\n    padding-top: 7px !important;\n    padding-bottom: 7px !important;\n    vertical-align: top;\n}\n\nspan.label, span.lastLabel, span.inlineLabel {\n	font-weight: 	bold;\n	display: 		inline-block;\n}\n\nspan.label, span.lastLabel {\n	padding-top: 	3px !important;\n}\n\nspan.label, span.inlineLabel {\n	padding-right:	4px !important;\n}\n\n/* Labels that looks like headers */\n.headerLabel {\n	border: 			1px solid #FFFFFF;\n	background-color: 	#F5F5F5;\n	color: 				#0067a3;\n	text-align:         right;\n	font-weight:        bold;\n	padding:			5px 5px 6px !important;\n}\n@-moz-document url-prefix() {\n	.headerLabel {\n		padding:			6px 5px 5px !important;\n	}\n}\n.headerField {\n	padding-left: 5px !important;\n}\n\n/* Decorated labels on forms */\n.decoratedLabel {\n	color:         red;\n	text-align:    right;\n	font-weight:   bold;\n	padding-right: 5px;\n}\n\n/* TDs that should be class label but have nested label spans */\n.nestedLabel {\n	text-align:    right;\n	padding-right: 0px;\n}\n\n/* Buttons on print pages */\n.printButton {\n	border:     black 1px solid;\n	color:      black;\n	background: #dddddd;\n}\n\n/* Horizontal rules */\nhr {\n	height:           0px;\n	border:           none;\n	border-top:       1px solid #9ab8d5;\n}\n\nhr.print {\n	height:           0px;\n	border:           none;\n	border-top:       1px solid black;\n}\n\n/* Image scroller (on profile or ad details) definitions */\n.imageContainer {\n	border:     1px solid #CCCCCC;\n	text-align: center;\n}\n\n.thumbnail {\n	margin: 1px;\n}\n\n.imageOnly {\n	margin: 0px !important;\n	padding: 0px !important;\n	border: none !important;\n}\n\n.imageContainer a {\n	color: #0067a3;\n	text-decoration: none;\n}\n\n.imageContainer a:hover {\n	color: red;\n}\n\n.imageIndex {\n}\n\n.imageRemove, .imageControls, .imageSetCaption, .imageDetails {\n	border-top: 1px solid #CCCCCC;\n}\n\n/* Image view popup definitions */\n.popupThumbnailContainer {\n	padding-top:    10px;\n	padding-bottom: 10px;\n	padding-left:   20px;\n	padding-right:  0px;\n	height:         80px;\n	width:          100%;\n	border-bottom:  1px solid #CCCCCC;\n	overflow:       auto;\n	overflow-y:     hidden;\n	text-align:     left;\n	white-space:    nowrap;\n}\n\n.popupThumbnail {\n	vertical-align: middle;\n	margin-right:   20px;\n}\n\n.popupImageContainer {\n	text-align:     center;\n	padding:        20px;\n	padding-bottom: 0px;\n}\n\n/* Autocompletion divs */\n.autoComplete {\n	position:         absolute;\n	background-color: white;\n	border: 	      1px solid #CCCCCC;\n	margin:           0px;\n	padding:          0px;\n	cursor:           default;\n	font-weight:      normal;\n	z-index: 		  1;\n}\n\n.autoComplete ul {\n	list-style-type: none;\n	margin:          0px;\n	padding:         0px;\n	overflow:        auto;\n	overflow-x:      hidden;\n}\n\n.autoComplete ul li {\n	background:  white;\n	color:       #0067a3;\n	white-space: nowrap;\n	text-align:  left;\n	padding:     2px;\n}\n\n.autoComplete ul li.selected {\n	background:	     #e5f0fe;\n}\n\n.draggableList {\n	list-style-type:  none;\n	margin:           0px;\n	padding:          0px;\n	background-color: #F0F8FF;\n	border:           1px solid #CCCCCC;\n	padding-top:      10px;\n}\n\n.draggableList li {\n	margin-bottom:   10px;\n	cursor: move;\n}\n\n/*  ---------------- Page specific definitions -----------------*/\n\n/* Account history */\n\n.ClassColorCredit {\n	color: blue !important;\n}\n\n.ClassColorCredit a {\n	color: blue !important;\n}\n\n.ClassColorDebit {\n	color: red !important;\n}\n\n.ClassColorDebit a {\n	color: red !important;\n}\n\n\n/* Ad search */\n\n.productTitle, .productTitle a {\n	font-weight: bold;\n	color: red;\n	text-decoration: underline;\n}\n\n.productOwner {\n	font-weight: bold;\n	font-style: italic;\n}\n\n.productOwner a {\n	color:           blue;\n	text-decoration: underline;\n}\n\n.productDescription {\n}\n\nul.categoryLevel0 {\n	list-style-type: none;\n	margin-bottom: 10px;\n	padding-left: 20px;\n	margin-left: 0px;\n}\n\nul.categoryLevel1 {\n	list-style-type: square;\n	padding-left: 15px;\n	margin-bottom: 5px;\n	margin-left: 0px;\n}\n\nul.categoryLevel2 {\n	list-style-type: disc;\n	padding-left: 15px;\n	margin-left: 0px;\n}\n\nli.categoryLevel1 {\n	font-weight: bold;\n	padding-left: 0px;\n	color: #658DCF;\n}\n\nli.categoryLevel2 {\n	font-weight: normal;\n	padding-left: 0px;\n	color: #658DCF;\n}\n\nli.categoryLevel3 {\n	font-weight: normal;\n	padding-left: 0px;\n	color: #658DCF;\n}\n\nspan.categoryLevel1Text, span.categoryLevel2Text, span.categoryLevel3Text {\n	color: #0067a3;\n}\n\nspan.categoryLevel1TextHover, span.categoryLevel2TextHover, span.categoryLevel3TextHover {\n	color: blue;\n	text-decoration: underline;\n}\n\nspan.categoryCountText{\n	color: #658dcf;\n}\n\n/* Customized files list */\n.conflict {\n	color: red;\n}\n\n/* Messages */\n.unreadMessage {\n	font-weight: bold;\n}\n\n.readMessage {\n}\n\n.removedMessage {\n	font-style: italic;\n}\n\n.repliedMessage {\n}\n\ndiv.manualPage h1 {\n	font-size: 14pt;\n}\n\ndiv.manualPage h2 {\n	font-size: 12pt;\n}\n\ndiv.manualPage h3 {\n	font-size: 10pt;\n	margin: 0px;\n	padding: 0px;\n	margin-top: 20px;\n}\n\ndiv.manualPage a {\n	text-decoration: underline;\n	color: blue;\n}\n\na.manualLink {\n	color: #0067a3;\n}\n\na.manualLink:hover {\n	color: blue;\n	text-decoration: underline;\n}\n\n.alertNotification {\n	width: 		400px;\n	border: 	2px solid red;\n	padding: 	10px;\n	color: 		red;\n	font-size: 	11pt;\n}\n\nimg.quickAccessIcon {\n	border: none;\n	display: block;\n	margin-bottom: 5px;\n}\n\n.quickAccessLink {\n    background-color: white;\n    display: inline-block;\n    padding: 2px;\n    border: 1px solid white;\n    border-radius: 4px;\n    -moz-border-radius:	4px;\n	-webkit-border-radius: 4px;\n    width: 95%;\n}\n\n.quickAccessLink:hover {\n	background-color: #EBF2FA;\n	border: 1px solid #B0B0B0;\n}\n\n@media print {\n\n	.printButton {\n		display:none;\n	}\n}',NULL,NULL);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_broker_account_information_permissions`
--

DROP TABLE IF EXISTS `group_broker_account_information_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_broker_account_information_permissions` (
  `owner_group_id` int(11) NOT NULL,
  `account_type_id` int(11) NOT NULL,
  KEY `FKE9668F39461D0C55` (`account_type_id`),
  KEY `FKE9668F392E6F411B` (`owner_group_id`),
  CONSTRAINT `FKE9668F392E6F411B` FOREIGN KEY (`owner_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKE9668F39461D0C55` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_broker_account_information_permissions`
--

LOCK TABLES `group_broker_account_information_permissions` WRITE;
/*!40000 ALTER TABLE `group_broker_account_information_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_broker_account_information_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_buy_with_payment_obligations_from`
--

DROP TABLE IF EXISTS `group_buy_with_payment_obligations_from`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_buy_with_payment_obligations_from` (
  `owner_group_id` int(11) NOT NULL,
  `related_group_id` int(11) NOT NULL,
  KEY `FKD0447BADF0E43C82` (`related_group_id`),
  KEY `FKD0447BAD5D14BEFA` (`owner_group_id`),
  CONSTRAINT `FKD0447BAD5D14BEFA` FOREIGN KEY (`owner_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKD0447BADF0E43C82` FOREIGN KEY (`related_group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_buy_with_payment_obligations_from`
--

LOCK TABLES `group_buy_with_payment_obligations_from` WRITE;
/*!40000 ALTER TABLE `group_buy_with_payment_obligations_from` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_buy_with_payment_obligations_from` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_filters`
--

DROP TABLE IF EXISTS `group_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `login_page_name` varchar(20) DEFAULT NULL,
  `root_url` varchar(100) DEFAULT NULL,
  `container_url` varchar(100) DEFAULT NULL,
  `description` longtext,
  `show_in_profile` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_login_page_name` (`login_page_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_filters`
--

LOCK TABLES `group_filters` WRITE;
/*!40000 ALTER TABLE `group_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_filters_groups`
--

DROP TABLE IF EXISTS `group_filters_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_filters_groups` (
  `group_id` int(11) NOT NULL,
  `group_filter_id` int(11) NOT NULL,
  KEY `FKDB149C589D46A867` (`group_filter_id`),
  KEY `FKDB149C58B45926EE` (`group_id`),
  KEY `FKDB149C5825A5B3E8` (`group_id`),
  CONSTRAINT `FKDB149C5825A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKDB149C589D46A867` FOREIGN KEY (`group_filter_id`) REFERENCES `group_filters` (`id`),
  CONSTRAINT `FKDB149C58B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_filters_groups`
--

LOCK TABLES `group_filters_groups` WRITE;
/*!40000 ALTER TABLE `group_filters_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_filters_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_filters_viewable_by`
--

DROP TABLE IF EXISTS `group_filters_viewable_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_filters_viewable_by` (
  `group_id` int(11) NOT NULL,
  `group_filter_id` int(11) NOT NULL,
  KEY `FKB32047139D46A867` (`group_filter_id`),
  KEY `FKB3204713B45926EE` (`group_id`),
  CONSTRAINT `FKB3204713B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKB32047139D46A867` FOREIGN KEY (`group_filter_id`) REFERENCES `group_filters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_filters_viewable_by`
--

LOCK TABLES `group_filters_viewable_by` WRITE;
/*!40000 ALTER TABLE `group_filters_viewable_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_filters_viewable_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_guarantee_types`
--

DROP TABLE IF EXISTS `group_guarantee_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_guarantee_types` (
  `group_id` int(11) NOT NULL,
  `guarantee_type_id` int(11) NOT NULL,
  KEY `FK7D9DE2429383E848` (`guarantee_type_id`),
  KEY `FK7D9DE24225A5B3E8` (`group_id`),
  CONSTRAINT `FK7D9DE24225A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK7D9DE2429383E848` FOREIGN KEY (`guarantee_type_id`) REFERENCES `guarantee_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_guarantee_types`
--

LOCK TABLES `group_guarantee_types` WRITE;
/*!40000 ALTER TABLE `group_guarantee_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_guarantee_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_history_logs`
--

DROP TABLE IF EXISTS `group_history_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_history_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC08E903A47C8C3FD` (`element_id`),
  KEY `FKC08E903A25A5B3E8` (`group_id`),
  CONSTRAINT `FKC08E903A25A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKC08E903A47C8C3FD` FOREIGN KEY (`element_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_history_logs`
--

LOCK TABLES `group_history_logs` WRITE;
/*!40000 ALTER TABLE `group_history_logs` DISABLE KEYS */;
INSERT INTO `group_history_logs` VALUES (1,2,6,'2013-12-15 00:36:12','2013-12-15 00:37:32'),(2,2,5,'2013-12-15 00:37:32',NULL),(3,3,6,'2013-12-15 03:08:55','2013-12-15 03:11:01'),(4,3,9,'2013-12-15 03:11:01',NULL),(5,4,12,'2013-12-15 03:35:56',NULL);
/*!40000 ALTER TABLE `group_history_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_issue_certification_to`
--

DROP TABLE IF EXISTS `group_issue_certification_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_issue_certification_to` (
  `owner_group_id` int(11) NOT NULL,
  `related_group_id` int(11) NOT NULL,
  KEY `FK32219C86F0E43C82` (`related_group_id`),
  KEY `FK32219C865D14BEFA` (`owner_group_id`),
  CONSTRAINT `FK32219C865D14BEFA` FOREIGN KEY (`owner_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK32219C86F0E43C82` FOREIGN KEY (`related_group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_issue_certification_to`
--

LOCK TABLES `group_issue_certification_to` WRITE;
/*!40000 ALTER TABLE `group_issue_certification_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_issue_certification_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_operator_account_information_permissions`
--

DROP TABLE IF EXISTS `group_operator_account_information_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_operator_account_information_permissions` (
  `owner_group_id` int(11) NOT NULL,
  `account_type_id` int(11) NOT NULL,
  KEY `FKE831E404461D0C55` (`account_type_id`),
  KEY `FKE831E404CB78BB0` (`owner_group_id`),
  CONSTRAINT `FKE831E404CB78BB0` FOREIGN KEY (`owner_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKE831E404461D0C55` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_operator_account_information_permissions`
--

LOCK TABLES `group_operator_account_information_permissions` WRITE;
/*!40000 ALTER TABLE `group_operator_account_information_permissions` DISABLE KEYS */;
INSERT INTO `group_operator_account_information_permissions` VALUES (12,5);
/*!40000 ALTER TABLE `group_operator_account_information_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_view_account_information_permissions`
--

DROP TABLE IF EXISTS `group_view_account_information_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_view_account_information_permissions` (
  `owner_group_id` int(11) NOT NULL,
  `account_type_id` int(11) NOT NULL,
  KEY `FK25619205461D0C55` (`account_type_id`),
  KEY `FK256192055D14BEFA` (`owner_group_id`),
  CONSTRAINT `FK256192055D14BEFA` FOREIGN KEY (`owner_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK25619205461D0C55` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_view_account_information_permissions`
--

LOCK TABLES `group_view_account_information_permissions` WRITE;
/*!40000 ALTER TABLE `group_view_account_information_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_view_account_information_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_view_ads_permissions`
--

DROP TABLE IF EXISTS `group_view_ads_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_view_ads_permissions` (
  `owner_group_id` int(11) NOT NULL,
  `related_group_id` int(11) NOT NULL,
  KEY `FKBBD1639BF0E43C82` (`related_group_id`),
  KEY `FKBBD1639B5D14BEFA` (`owner_group_id`),
  CONSTRAINT `FKBBD1639B5D14BEFA` FOREIGN KEY (`owner_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKBBD1639BF0E43C82` FOREIGN KEY (`related_group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_view_ads_permissions`
--

LOCK TABLES `group_view_ads_permissions` WRITE;
/*!40000 ALTER TABLE `group_view_ads_permissions` DISABLE KEYS */;
INSERT INTO `group_view_ads_permissions` VALUES (9,5),(9,9);
/*!40000 ALTER TABLE `group_view_ads_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_view_profile_permissions`
--

DROP TABLE IF EXISTS `group_view_profile_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_view_profile_permissions` (
  `owner_group_id` int(11) NOT NULL,
  `related_group_id` int(11) NOT NULL,
  KEY `FK58BF4414F0E43C82` (`related_group_id`),
  KEY `FK58BF44145D14BEFA` (`owner_group_id`),
  CONSTRAINT `FK58BF44145D14BEFA` FOREIGN KEY (`owner_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK58BF4414F0E43C82` FOREIGN KEY (`related_group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_view_profile_permissions`
--

LOCK TABLES `group_view_profile_permissions` WRITE;
/*!40000 ALTER TABLE `group_view_profile_permissions` DISABLE KEYS */;
INSERT INTO `group_view_profile_permissions` VALUES (9,5),(9,9),(5,9),(5,5);
/*!40000 ALTER TABLE `group_view_profile_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `status` varchar(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `max_password_tries` int(11) DEFAULT NULL,
  `min_password_length` int(11) DEFAULT NULL,
  `max_password_length` int(11) DEFAULT NULL,
  `password_policy` varchar(1) NOT NULL,
  `deactivation_number` int(11) DEFAULT NULL,
  `deactivation_field` int(11) DEFAULT NULL,
  `password_expiration_number` int(11) DEFAULT NULL,
  `password_expiration_field` int(11) DEFAULT NULL,
  `transaction_password` varchar(1) DEFAULT NULL,
  `transaction_password_length` int(11) NOT NULL DEFAULT '4',
  `max_tp_tries` int(11) NOT NULL,
  `hide_currency_on_pmt` bit(1) NOT NULL,
  `root_url` varchar(100) DEFAULT NULL,
  `login_page_name` varchar(20) DEFAULT NULL,
  `container_url` varchar(100) DEFAULT NULL,
  `sms_charge_transfer_type_id` int(11) DEFAULT NULL,
  `sms_charge_amount` decimal(15,6) DEFAULT NULL,
  `sms_free_count` int(11) NOT NULL DEFAULT '0',
  `sms_additional_charged_count` int(11) NOT NULL DEFAULT '1',
  `sms_additional_charged_period_number` int(11) DEFAULT NULL,
  `sms_additional_charged_period_field` int(11) DEFAULT NULL,
  `sms_show_free_threshold` int(11) NOT NULL DEFAULT '50',
  `sms_context_class_name` varchar(255) DEFAULT NULL,
  `member_max_images_per_member` int(11) DEFAULT NULL,
  `member_max_ads_per_member` int(11) DEFAULT NULL,
  `member_max_ad_description_size` int(11) NOT NULL DEFAULT '2048',
  `member_max_ad_images_per_member` int(11) NOT NULL DEFAULT '3',
  `member_default_ad_publication_number` int(11) DEFAULT NULL,
  `member_default_ad_publication_field` int(11) DEFAULT NULL,
  `member_max_ad_publication_number` int(11) DEFAULT NULL,
  `member_max_ad_publication_field` int(11) DEFAULT NULL,
  `member_enable_permanent_ads` bit(1) NOT NULL DEFAULT b'0',
  `member_show_posweb_pmt_dsc` bit(1) NOT NULL DEFAULT b'0',
  `member_external_ad_publication` varchar(1) DEFAULT NULL,
  `member_send_password_by_email` bit(1) NOT NULL DEFAULT b'0',
  `member_view_loans_by_group` bit(1) NOT NULL DEFAULT b'0',
  `member_repay_loan_by_group` bit(1) NOT NULL DEFAULT b'0',
  `member_max_scheduling_payments` int(11) NOT NULL DEFAULT '0',
  `member_max_scheduling_period_number` int(11) DEFAULT NULL,
  `member_max_scheduling_period_field` int(11) DEFAULT NULL,
  `min_pin_length` int(11) DEFAULT NULL,
  `max_pin_length` int(11) DEFAULT NULL,
  `member_max_pin_tries` int(11) DEFAULT NULL,
  `member_pin_block_number` int(11) DEFAULT NULL,
  `member_pin_block_field` int(11) DEFAULT NULL,
  `member_expire_number` int(11) DEFAULT NULL,
  `member_expire_field` int(11) DEFAULT NULL,
  `member_max_pos_scheduling_payments` int(11) NOT NULL DEFAULT '0',
  `member_number_of_copies` int(11) NOT NULL DEFAULT '0',
  `member_result_page_size` int(11) NOT NULL DEFAULT '0',
  `member_allow_make_payment` bit(1) NOT NULL DEFAULT b'0',
  `member_expire_group_id` int(11) DEFAULT NULL,
  `member_active` bit(1) NOT NULL DEFAULT b'0',
  `initial_group_show` varchar(100) DEFAULT NULL,
  `initial_group` bit(1) NOT NULL DEFAULT b'0',
  `member_default_allow_charging_sms` bit(1) NOT NULL DEFAULT b'0',
  `member_default_accept_free_mailing` bit(1) NOT NULL DEFAULT b'0',
  `member_default_accept_paid_mailing` bit(1) NOT NULL DEFAULT b'0',
  `registration_agreement_id` int(11) DEFAULT NULL,
  `card_type_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_login_page_name` (`login_page_name`),
  KEY `FKB63DD9D4EAE0AB57` (`member_id`),
  KEY `FKB63DD9D433E01D0A` (`registration_agreement_id`),
  KEY `FKB63DD9D4935D704F` (`sms_charge_transfer_type_id`),
  KEY `FKB63DD9D46061A69` (`member_expire_group_id`),
  KEY `FKB63DD9D48595CD86` (`card_type_id`),
  CONSTRAINT `FKB63DD9D48595CD86` FOREIGN KEY (`card_type_id`) REFERENCES `card_types` (`id`),
  CONSTRAINT `FKB63DD9D433E01D0A` FOREIGN KEY (`registration_agreement_id`) REFERENCES `registration_agreements` (`id`),
  CONSTRAINT `FKB63DD9D46061A69` FOREIGN KEY (`member_expire_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKB63DD9D4935D704F` FOREIGN KEY (`sms_charge_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FKB63DD9D4EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'A','N','System administrators','Administrators with full permission on the system',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,50,NULL,NULL,NULL,2048,3,NULL,NULL,NULL,NULL,'\0','\0',NULL,'\0','\0','\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(2,'A','N','Account administrators','Administrators with permissions for account operations',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,50,NULL,NULL,NULL,2048,3,NULL,NULL,NULL,NULL,'\0','\0',NULL,'\0','\0','\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(3,'A','N','Disabled administrators','Administrators with no permissions',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,50,NULL,NULL,NULL,2048,3,NULL,NULL,NULL,NULL,'\0','\0',NULL,'\0','\0','\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(4,'A','R','Removed administrators','Administrators that were removed',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,50,NULL,NULL,NULL,2048,3,NULL,NULL,NULL,NULL,'\0','\0',NULL,'\0','\0','\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(5,'M','N','Full members','Members with all permissions',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,NULL,3,0,2048,3,1,2,3,2,'\0','\0','D','','','',36,3,1,4,4,0,NULL,NULL,0,5,6,2,5,'\0',NULL,'',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(6,'M','N','Inactive members','Members awaiting change to an active group',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,NULL,3,10,2048,3,1,2,3,2,'\0','\0','D','','','',0,NULL,NULL,4,4,0,NULL,NULL,0,5,6,2,5,'\0',NULL,'\0',NULL,'','\0','\0','\0',1,NULL,NULL),(7,'M','N','Disabled members','Members with no permissions',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,1,2,50,NULL,3,10,2048,3,1,2,3,2,'','\0','E','','','',36,3,1,4,4,3,1,5,NULL,NULL,6,2,5,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(8,'M','R','Removed members','Members that were removed from the system',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,1,2,50,NULL,3,10,2048,3,1,2,3,2,'','\0','E','','','',36,3,1,4,4,3,1,5,NULL,NULL,6,2,5,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(9,'B','N','Full brokers','Brokers with all permissions',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,NULL,3,10,2048,3,1,2,3,2,'','\0','E','','','',36,3,1,4,4,0,NULL,NULL,0,5,6,2,5,'\0',NULL,'',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(10,'B','N','Disabled brokers','Brokers with no permissions',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,1,2,50,NULL,3,10,2048,3,1,2,3,2,'','\0','E','','','',36,3,1,4,4,3,1,5,NULL,NULL,6,2,5,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(11,'B','R','Removed brokers','Brokers that were removed from the system',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,1,2,50,NULL,3,10,2048,3,1,2,3,2,'','\0','E','','','',36,3,1,4,4,3,1,5,NULL,NULL,6,2,5,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(12,'O','N','My Ops',NULL,3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,50,NULL,NULL,NULL,2048,3,NULL,NULL,NULL,NULL,'\0','\0',NULL,'\0','\0','\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,2);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_account_fees`
--

DROP TABLE IF EXISTS `groups_account_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_account_fees` (
  `group_id` int(11) NOT NULL,
  `account_fee_id` int(11) NOT NULL,
  KEY `FKE41C910ADA75B281` (`account_fee_id`),
  KEY `FKE41C910AB45926EE` (`group_id`),
  CONSTRAINT `FKE41C910AB45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKE41C910ADA75B281` FOREIGN KEY (`account_fee_id`) REFERENCES `account_fees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_account_fees`
--

LOCK TABLES `groups_account_fees` WRITE;
/*!40000 ALTER TABLE `groups_account_fees` DISABLE KEYS */;
INSERT INTO `groups_account_fees` VALUES (5,1),(9,1),(5,2),(9,2),(5,3);
/*!40000 ALTER TABLE `groups_account_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_channels`
--

DROP TABLE IF EXISTS `groups_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_channels` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `FKE6E149DBB45926EE` (`group_id`),
  KEY `FKE6E149DB9B71D578` (`channel_id`),
  CONSTRAINT `FKE6E149DB9B71D578` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `FKE6E149DBB45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_channels`
--

LOCK TABLES `groups_channels` WRITE;
/*!40000 ALTER TABLE `groups_channels` DISABLE KEYS */;
INSERT INTO `groups_channels` VALUES (1,9),(2,9),(3,9),(1,6),(1,5),(2,5),(3,5);
/*!40000 ALTER TABLE `groups_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_chargeback_transfer_types`
--

DROP TABLE IF EXISTS `groups_chargeback_transfer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_chargeback_transfer_types` (
  `group_id` int(11) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  KEY `FK895D5F9EA4766B0A` (`transfer_type_id`),
  KEY `FK895D5F9E659B479` (`group_id`),
  CONSTRAINT `FK895D5F9E659B479` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK895D5F9EA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_chargeback_transfer_types`
--

LOCK TABLES `groups_chargeback_transfer_types` WRITE;
/*!40000 ALTER TABLE `groups_chargeback_transfer_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_chargeback_transfer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_conversion_simulation_transfer_types`
--

DROP TABLE IF EXISTS `groups_conversion_simulation_transfer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_conversion_simulation_transfer_types` (
  `group_id` int(11) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  KEY `FK88FC75FFA4766B0A` (`transfer_type_id`),
  KEY `FK88FC75FF25A5B3E8` (`group_id`),
  CONSTRAINT `FK88FC75FF25A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK88FC75FFA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_conversion_simulation_transfer_types`
--

LOCK TABLES `groups_conversion_simulation_transfer_types` WRITE;
/*!40000 ALTER TABLE `groups_conversion_simulation_transfer_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_conversion_simulation_transfer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_default_channels`
--

DROP TABLE IF EXISTS `groups_default_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_default_channels` (
  `group_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  KEY `FK9B33E319B45926EE` (`group_id`),
  KEY `FK9B33E3199B71D578` (`channel_id`),
  CONSTRAINT `FK9B33E3199B71D578` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `FK9B33E319B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_default_channels`
--

LOCK TABLES `groups_default_channels` WRITE;
/*!40000 ALTER TABLE `groups_default_channels` DISABLE KEYS */;
INSERT INTO `groups_default_channels` VALUES (9,1),(9,2),(9,3),(6,1),(5,1),(5,2),(5,3);
/*!40000 ALTER TABLE `groups_default_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_documents`
--

DROP TABLE IF EXISTS `groups_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_documents` (
  `group_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FKD664EE0DD6DB8FB3` (`document_id`),
  KEY `FKD664EE0D659B479` (`group_id`),
  CONSTRAINT `FKD664EE0D659B479` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKD664EE0DD6DB8FB3` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_documents`
--

LOCK TABLES `groups_documents` WRITE;
/*!40000 ALTER TABLE `groups_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_from_transaction_fees`
--

DROP TABLE IF EXISTS `groups_from_transaction_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_from_transaction_fees` (
  `group_id` int(11) NOT NULL,
  `transaction_fee_id` int(11) NOT NULL,
  KEY `FK39737E38B45926EE` (`group_id`),
  KEY `FK39737E38E969E40E` (`transaction_fee_id`),
  CONSTRAINT `FK39737E38E969E40E` FOREIGN KEY (`transaction_fee_id`) REFERENCES `transaction_fees` (`id`),
  CONSTRAINT `FK39737E38B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_from_transaction_fees`
--

LOCK TABLES `groups_from_transaction_fees` WRITE;
/*!40000 ALTER TABLE `groups_from_transaction_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_from_transaction_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_member_record_types`
--

DROP TABLE IF EXISTS `groups_member_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_member_record_types` (
  `group_id` int(11) NOT NULL,
  `member_record_type_id` int(11) NOT NULL,
  KEY `FK201F85A5E46288C5` (`member_record_type_id`),
  KEY `FK201F85A525A5B3E8` (`group_id`),
  CONSTRAINT `FK201F85A525A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK201F85A5E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_member_record_types`
--

LOCK TABLES `groups_member_record_types` WRITE;
/*!40000 ALTER TABLE `groups_member_record_types` DISABLE KEYS */;
INSERT INTO `groups_member_record_types` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1);
/*!40000 ALTER TABLE `groups_member_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_payment_filters`
--

DROP TABLE IF EXISTS `groups_payment_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_payment_filters` (
  `group_id` int(11) NOT NULL,
  `payment_filter_id` int(11) NOT NULL,
  KEY `FK413E1E5725A5B3E8` (`group_id`),
  KEY `FK413E1E57A78BAF2E` (`payment_filter_id`),
  CONSTRAINT `FK413E1E57A78BAF2E` FOREIGN KEY (`payment_filter_id`) REFERENCES `payment_filters` (`id`),
  CONSTRAINT `FK413E1E5725A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_payment_filters`
--

LOCK TABLES `groups_payment_filters` WRITE;
/*!40000 ALTER TABLE `groups_payment_filters` DISABLE KEYS */;
INSERT INTO `groups_payment_filters` VALUES (5,1),(9,1),(5,2),(9,2),(5,3),(9,3),(5,4),(9,4),(5,5),(9,5),(5,6),(9,6),(1,7),(2,7),(1,8),(2,8),(1,9),(2,9),(1,10),(2,10),(1,11),(2,11),(1,12),(2,12),(1,13),(2,13),(1,14),(2,14),(1,15),(2,15),(1,16),(2,16),(1,17),(2,17),(1,18),(2,18),(1,19),(2,19),(1,20),(2,20),(1,21),(2,21),(1,22),(2,22),(1,23),(2,23),(1,24),(2,24),(1,25),(2,25),(1,26),(2,26);
/*!40000 ALTER TABLE `groups_payment_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_request_payment_channels`
--

DROP TABLE IF EXISTS `groups_request_payment_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_request_payment_channels` (
  `group_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  KEY `FK2975B9A4B45926EE` (`group_id`),
  KEY `FK2975B9A49B71D578` (`channel_id`),
  CONSTRAINT `FK2975B9A49B71D578` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `FK2975B9A4B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_request_payment_channels`
--

LOCK TABLES `groups_request_payment_channels` WRITE;
/*!40000 ALTER TABLE `groups_request_payment_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_request_payment_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_to_transaction_fees`
--

DROP TABLE IF EXISTS `groups_to_transaction_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_to_transaction_fees` (
  `group_id` int(11) NOT NULL,
  `transaction_fee_id` int(11) NOT NULL,
  KEY `FKBB60D4C7B45926EE` (`group_id`),
  KEY `FKBB60D4C7E969E40E` (`transaction_fee_id`),
  CONSTRAINT `FKBB60D4C7E969E40E` FOREIGN KEY (`transaction_fee_id`) REFERENCES `transaction_fees` (`id`),
  CONSTRAINT `FKBB60D4C7B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_to_transaction_fees`
--

LOCK TABLES `groups_to_transaction_fees` WRITE;
/*!40000 ALTER TABLE `groups_to_transaction_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_to_transaction_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_transfer_types`
--

DROP TABLE IF EXISTS `groups_transfer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_transfer_types` (
  `group_id` int(11) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  KEY `FKA930C8F0A4766B0A` (`transfer_type_id`),
  KEY `FKA930C8F025A5B3E8` (`group_id`),
  CONSTRAINT `FKA930C8F025A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKA930C8F0A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_transfer_types`
--

LOCK TABLES `groups_transfer_types` WRITE;
/*!40000 ALTER TABLE `groups_transfer_types` DISABLE KEYS */;
INSERT INTO `groups_transfer_types` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,14),(1,15),(1,16),(1,17),(1,22),(1,24),(9,13),(9,18),(9,19),(9,20),(9,29),(9,30),(5,30),(5,13),(5,29),(5,18),(5,20),(5,19);
/*!40000 ALTER TABLE `groups_transfer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_transfer_types_as_member`
--

DROP TABLE IF EXISTS `groups_transfer_types_as_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_transfer_types_as_member` (
  `group_id` int(11) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  KEY `FKFC716B8A4766B0A` (`transfer_type_id`),
  KEY `FKFC716B825A5B3E8` (`group_id`),
  KEY `FKFC716B885B3A90F` (`group_id`),
  KEY `FKFC716B83794D57D` (`group_id`),
  CONSTRAINT `FKFC716B83794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKFC716B825A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKFC716B885B3A90F` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKFC716B8A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_transfer_types_as_member`
--

LOCK TABLES `groups_transfer_types_as_member` WRITE;
/*!40000 ALTER TABLE `groups_transfer_types_as_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_transfer_types_as_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guarantee_logs`
--

DROP TABLE IF EXISTS `guarantee_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guarantee_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `status` varchar(2) NOT NULL,
  `guarantee_id` int(11) NOT NULL,
  `by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK22595062B1214C2` (`by_id`),
  KEY `FK225950629C0E817` (`guarantee_id`),
  CONSTRAINT `FK225950629C0E817` FOREIGN KEY (`guarantee_id`) REFERENCES `guarantees` (`id`),
  CONSTRAINT `FK22595062B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarantee_logs`
--

LOCK TABLES `guarantee_logs` WRITE;
/*!40000 ALTER TABLE `guarantee_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `guarantee_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guarantee_types`
--

DROP TABLE IF EXISTS `guarantee_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guarantee_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `model` varchar(2) NOT NULL,
  `authorized_by` varchar(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `pending_guarantee_expiration_number` int(11) DEFAULT NULL,
  `pending_guarantee_expiration_field` int(11) DEFAULT NULL,
  `payment_obligation_period_number` int(11) DEFAULT NULL,
  `payment_obligation_period_field` int(11) DEFAULT NULL,
  `credit_fee_payer` varchar(1) NOT NULL,
  `issue_fee_payer` varchar(1) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `credit_fee` decimal(15,6) NOT NULL DEFAULT '0.000000',
  `credit_fee_type` varchar(1) NOT NULL,
  `credit_fee_readonly` bit(1) NOT NULL,
  `issue_fee` decimal(15,6) NOT NULL DEFAULT '0.000000',
  `issue_fee_type` varchar(1) NOT NULL,
  `issue_fee_readonly` bit(1) NOT NULL,
  `loan_transfer_type_id` int(11) NOT NULL,
  `credit_fee_transfer_type_id` int(11) DEFAULT NULL,
  `issue_fee_transfer_type_id` int(11) DEFAULT NULL,
  `forward_transfer_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK43027402C0E7F6FA` (`currency_id`),
  KEY `FK4302740234403429` (`credit_fee_transfer_type_id`),
  KEY `FK43027402D757D44` (`forward_transfer_type_id`),
  KEY `FK43027402B7718679` (`loan_transfer_type_id`),
  KEY `FK43027402907BA249` (`issue_fee_transfer_type_id`),
  CONSTRAINT `FK43027402907BA249` FOREIGN KEY (`issue_fee_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK4302740234403429` FOREIGN KEY (`credit_fee_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK43027402B7718679` FOREIGN KEY (`loan_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK43027402C0E7F6FA` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `FK43027402D757D44` FOREIGN KEY (`forward_transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarantee_types`
--

LOCK TABLES `guarantee_types` WRITE;
/*!40000 ALTER TABLE `guarantee_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `guarantee_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guarantees`
--

DROP TABLE IF EXISTS `guarantees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guarantees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(2) NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `credit_fee` decimal(15,6) DEFAULT '0.000000',
  `credit_fee_type` varchar(1) DEFAULT NULL,
  `issue_fee` decimal(15,6) DEFAULT '0.000000',
  `issue_fee_type` varchar(1) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `registration_date` datetime NOT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `guarantee_type_id` int(11) NOT NULL,
  `certification_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `issuer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loan_id` (`loan_id`),
  KEY `FKA37612EB608B319E` (`buyer_id`),
  KEY `FKA37612EB9383E848` (`guarantee_type_id`),
  KEY `FKA37612EB40A58052` (`seller_id`),
  KEY `FKA37612EB205CEC57` (`certification_id`),
  KEY `FKA37612EBA5F0DAD8` (`issuer_id`),
  KEY `FKA37612EBF9B21025` (`loan_id`),
  CONSTRAINT `FKA37612EBF9B21025` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`),
  CONSTRAINT `FKA37612EB205CEC57` FOREIGN KEY (`certification_id`) REFERENCES `certifications` (`id`),
  CONSTRAINT `FKA37612EB40A58052` FOREIGN KEY (`seller_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKA37612EB608B319E` FOREIGN KEY (`buyer_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKA37612EB9383E848` FOREIGN KEY (`guarantee_type_id`) REFERENCES `guarantee_types` (`id`),
  CONSTRAINT `FKA37612EBA5F0DAD8` FOREIGN KEY (`issuer_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarantees`
--

LOCK TABLES `guarantees` WRITE;
/*!40000 ALTER TABLE `guarantees` DISABLE KEYS */;
/*!40000 ALTER TABLE `guarantees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `content_type` varchar(100) NOT NULL,
  `image_size` int(11) NOT NULL,
  `last_modified` datetime NOT NULL,
  `thumbnail_size` int(11) NOT NULL,
  `image` longblob NOT NULL,
  `thumbnail` longblob,
  `member_id` int(11) DEFAULT NULL,
  `order_number` smallint(6) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `ad_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_subclass_name` (`subclass`,`name`),
  KEY `FKB95A8278EAE0AB57` (`member_id`),
  KEY `FKB95A8278CAF74240` (`ad_id`),
  CONSTRAINT `FKB95A8278CAF74240` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`),
  CONSTRAINT `FKB95A8278EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'sys','active.gif','image/gif',565,'2013-12-14 18:15:35',565,'GIF89a\0\0ÆV\0jr\0x\0l\0ƒ\0.g.x”##—A|A\0¬\0!–!™\0®\0\0±\0\0²\066%%§²#¤#2›2\0¾\0*¡*À1¢1¾7 77¡7; ;¹\0Ê\0\0Ï\04®4½\0Ó\0\0Õ\0K¥K\0Ú\0\0Û\0\0Ý\0U¢U\0à\0Îh h\0é\0\0î\0R¸L\0ñ\0í\0ó\0p¦pu§u\nõ\n\0þ\0ƒ¦ƒ‹¯‹|Èyš¶šƒÆƒˆÄˆŒÃŒž·ž¼—Á——Æ—·É·¾Ï¾¶Ü¶¾Ý¾ÁÛÁÉ×ÉÆÞÆÍáÍ×â×ÐêÐÜïÜãñãâòâåñååòåèñèéñéìôìÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0y€‚ƒ„…†‡„Pˆ„N;1F‹R=M\nG†U>#O? JƒSC-$\'Q‚H3\rKB\Z7+„T4*	/85†.!2%&0/6‡A)(,\":ˆL!\"<‹\0@ã9DêIEðõö„\0;','GIF89a\0\0ÆV\0jr\0x\0l\0ƒ\0.g.x”##—A|A\0¬\0!–!™\0®\0\0±\0\0²\066%%§²#¤#2›2\0¾\0*¡*À1¢1¾7 77¡7; ;¹\0Ê\0\0Ï\04®4½\0Ó\0\0Õ\0K¥K\0Ú\0\0Û\0\0Ý\0U¢U\0à\0Îh h\0é\0\0î\0R¸L\0ñ\0í\0ó\0p¦pu§u\nõ\n\0þ\0ƒ¦ƒ‹¯‹|Èyš¶šƒÆƒˆÄˆŒÃŒž·ž¼—Á——Æ—·É·¾Ï¾¶Ü¶¾Ý¾ÁÛÁÉ×ÉÆÞÆÍáÍ×â×ÐêÐÜïÜãñãâòâåñååòåèñèéñéìôìÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0y€‚ƒ„…†‡„Pˆ„N;1F‹R=M\nG†U>#O? JƒSC-$\'Q‚H3\rKB\Z7+„T4*	/85†.!2%&0/6‡A)(,\":ˆL!\"<‹\0@ã9DêIEðõö„\0;',NULL,NULL,NULL,NULL),(2,'sys','calendar.gif','image/gif',154,'2013-12-14 18:15:35',154,'GIF89a\0\0ã\0fff•p\0­”JÊ—\0ÆªªÙ³?ÄÂÃÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with GIMP\0!ù\0\0\0,\0\0\0\0\0\0\02°È2! 9ÎÁ\0€$	ª‡ž-êÆ`ÜxnÀsÿÊ@šM§ãgF\Zh:Ÿ€\0;','GIF89a\0\0ã\0fff•p\0­”JÊ—\0ÆªªÙ³?ÄÂÃÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with GIMP\0!ù\0\0\0,\0\0\0\0\0\0\02°È2! 9ÎÁ\0€$	ª‡ž-êÆ`ÜxnÀsÿÊ@šM§ãgF\Zh:Ÿ€\0;',NULL,NULL,NULL,NULL),(3,'sys','captchaBackground.jpg','image/jpeg',8164,'2013-12-14 18:15:36',1277,'ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0ÿÛ\0CÿÀ\0\0<\0È\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0S\0		\0\0\0\0\0!1A\"Qa–¡Ò2BUVq‘”ÔTbr“	$35CRWduv’£±²´ÁÑÓáð7Fs¢¤ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0K\0	\0\0\0\0\0!1AQaÒq‘“¡Ñ\"RST’±2Bs²ÁÓ#bráð456DUc³3CƒñÿÚ\0\0\0?\0ý…Ù–›&Ï´äÊ´­‰2d[P&DŠqÇÂ\n”¥d’I$ždëÅ—bïÝG®Ô¢Ü•iK-6I- ’JI$bIÎcÑ‚Ý¼,ÛÓ(DÃ!Å€Ô\0F€\nà!Ëà]‹ò2Óôr?±§ÞM\\ïsg²Fì4r†ó{Ë½¢ücXŸ#m/Gcû\ZÐ]ë ?É3Ù#v5úzñûã½¢¼c>Ø¿#-?G#û\ZíÉËŸîLöHÝ\r½yGù×~5xÆÂÉ±‰	]¨TO$‹n?±¬òné/4ƒ5û¤nÆUn^Šùk½¢üaA­²¶^\0··ÖÖÔWmGOõ£K›¸v3â©³Zì>b9{­¦ë‡ÿ\0büc§îQnð•ÒÈêGéLÿ\0gJ‡ÖAú=žÍ¿Â¯½¨Žükñ6ÆÚl­¾¶HŸGmÇ_õ#\\¸38›5®Éäa¾Ûpá:çh¿LU“c¤”ªÊµ y¥VÜpGôzmUÙº‰42,ƒ÷HÝ…¢ñ^\"*&Ýí½ð.Åùiú9ØÖ99t=ÉžÉ±žPÞ?{w´^ôØ¿#-?G#û\Z99t=ÉžÉ°r†ñûÛ½¢÷ ð.Åùiú9ØÑÉË¡îLöHÝƒ”7ÞÝí½v/ÈËOÑÈþÆŽN]rg²Fì¡¼~öïh½è<±~FZ~ŽGö4rrè{“=’7`å\rã÷·{EïAà]‹ò2Óôr?±£“—CÜ™ì‘»(o½»Ú/z66E”…*ÉµBUïTm¨ø?Ñëcv.šSS\"Í>é±x¯	4òÇ;EïG¤{Ë”óqãÙ£:¬6„Û‘ùŸæk¤½ÔºÓOÛ‘d¨æR<#W/-àeJœtþâücjgR&1\n¡cZ¬.Za»àìbÛÅ#*JTï€9á8$F@$,´n-Þ²Èã¤\0æ<Z)Íõc”µë·&ÒJ\'Ã÷×ãþØ¿#-?G#û\ZmäåÐ÷&{$nÂŽPÞ?{w´^ôØ¿#-?G#û\Z99t=ÉžÉ°r†ñûÛ½¢÷ ð.Åùiú9ØÑÉË¡îLöHÝƒ”7ÞÝí½M»±ªR•ÙV™aüÛqðG`ýo´ú³§{åÝBp\"ÎJq?²GWÕÓ§ïMã–b¢mÚœß´^ô?þæ»kûßÙ‰Åÿ\0OS¾C\\?ôÙ~Å½ØŽr²ö{óÝ¢÷ ûší¯ïdz\'ý=†¸é²ý‹{°r²ö{óÝ¢÷¡Ÿ¸[}·Ð¬âd+Ï‰2%ŸSv$¨¶ÌvÝiÔÆYJÐ Œ¥@€AÁ\ZŒ_k›r¥ndû­H0•¥—H!¦Á!DBj8‚1nµæ¼óšQ·\'RTë`‚âÈ ¬TM#8ŠiE­ÖZ£ÒZn¯Tm¦©‘ÒÓmNZR”†À\0. 5æ*ÑE”ÊC˜\'ðˆô$ýg»<â”R¢{Ì*¦á¯#5º¯_Â¨9íiÇéIñ™Ã‡f× GC7UÎ…ŽŠ³RZÔp”dŸ \nÎ”\"ð[EtŽ]Ë‚J\"q´è7¼”7.à¬¹*ÀRiíÄl¾¡øD£ù¹Ÿ›VµÞ»·‚h§ÈIû z]:yæŠòÜ´lInY¼µkû=\Zû‡<LÐå &<Hˆ\0`¬3…ŸYÉÕ¥&X’M\Z@>¼ñ_ÌKyAªõÍ\nÉ¯Û#àvp;þÓˆ´Uª7R£¥¨‹ä¾•¿)R2=Zê‰äi„ë³ž„v763¤ä6IêOÑ¥	›BŽ8g[Î#I1#LIL–\Zxc‘[c#æ=c\\fY“›M@W<\r8ó\nªM!™SµÞ@SôÅ‡’&+ŠCñOoÌu\nµ.Ó­‚¹eTz§?AÓÓ×’¶²èº)¶¦I\nZ…¶¢J‘‚ëËPg&ø¥”œ‰f¢£ïŸ>µòñ®$êƒ¾|ú<¼kx±ªùóèòñ®3ÅlV*b¼Ô™Íºô8îÊm†K‹-ƒ•a eGä9ž¡ÏJä-	TÎ¶^>…Ey«Œr}‡TÊ‚>µ0çŽ®è-Í²¬]’ºïšnÑG ¼»\rØòPêçV”Ú“OfI%×\\yM¡)Fx‚ˆ>)V®;É;e·w\\qÅŒ“’j3ÓÑÉÖkJSå\nN}ûi\r!\'*¾–Á_K+P¦züá—^­ÅƒI®Æ„ÊkŒDm÷hÒe)¦–â›Ã¬-`=ú€Q\n	PJŠUŒ\Z‚Ê·×fN¡ð*Fq¬ðÛù¹æZSG1Ó«\ZƒÝÕQÍÁ|nnëßv<eíÝSlì\r¿­ÈªÖj÷5v‰õ‰æñX‹ˆ:”Çc®-×T•(¡	JŒtñy/£vâÓM”!\'(“J“B\0®âc•™b3e6µ©Àµ¨P\0\r\0¨$’@Ç\0‰QÙA”0ãÄ4Ü—‹q–ïŠpJROYÀ\'Ÿ-Gx÷¸ž2‡#]0ëÍ\niRˆÄg¾|úååã\\gŠÙ|ùôyx×²$ÛI’Ý5RHÂ¥ºH8ø)ä=|Z³®€³K§:ÏpÃçXŠ[*\nšÉõGÎ<jòúµ+ã“\r	ƒ^_VŽ90d&[”¥¹¿ùÿ\0ÙU^Ïà®j+~ÝI¹ˆÿ\0aïøÕ¤”òªKï[üb>}Rb©ŸÅìÿ\0`kÇ6_÷k?ÂŸUMÿ\0k_9ùÂ’R¥©(BTµ­@!	$ž —¥*Z€¤ÂbBENh³VßG¡°ÅZ¬Ê^­¸ž&ÛsšbƒÔ\0ýß”öuÒo»›rØ²ZLÌÊjùÄ™ß½¬èÌ5šzô^—m\'\Z24úßËPÓœì•5bD&\rA¢Õ<\\óù5ÍKÕ®1©˜\'ÉË«YcØ¡\nd¾óDtn­ø<}zÊ\\uÖ4S\r¯8ŽôUd¤\0èC£·<ÓþÚQåjN‰V{K5Í\r»š\Z°Ë“\"7Þ•†‘–×€Rö¼YòöÙË<µ¼6+»%ÆÅŽ…l?‘ÑÍ¬õ®Ia+Å-£Â!ŠuÇ\ZjÝe.¥2cº¦äÇ^Ð´œ)+I÷¤êœTàiÒ…à hAÑEÉ>ÊAF)8‚5BÒ&qsIIó‘¬	ôäB¥#Ú;K}¨ñ^yçZi°	Rf»ËºìÛéi±U(Ð¤Ç5–›AR\0ÄÂ­ÁJª[˜Vi\r@yÄ6äæÜJšeÕ¨%´8s”ñ)@Žàd$%­v­Ë\ZOy##M\riÏâ*!²JÓ’Ÿ{‹lúZ*3óUïˆ\\íÓ*ðjÿ\0VÞZ*¼£¾§£Ü¢¶_mõ{çQË	pö¬#åÔHÌ´H:¡ø=8\ZÈË91\'wÙò£[ùh×	¸•AßgÊ>Z5ÁÄªû‘¹÷Ó¶\rkk-m¶®Õn{Žˆ4[ðÔ¡µB¦´ñ<3ŸZŸôp °ÚQ[§…@$Ø\"þÙâê\"Ù.ä”ŒÙ?ÅžµógÓì]µ}4&Ôà(Œr>ÈÂ”9³æ0öD•¥JÜ-)K)ˆöœj¾òÑ®8•FÝö|£èÑå£\\J¢u·üJ-3?\n\"Ö>?ñÕõw”a±µ õãùÅwi§*ÐsŸå„,qøFžxØCÅÁÄ?á\Z8Ø8¸eîB‡ÜîýþEÕ;GÞÎj/~­Ê´>áßøÕ¦Š^™?½oñˆ ´ŸØªgñ{?Ø\Zò=—ýÚÏð§ä#Ô“Ú×Î~q`6†Ó_]Ã.?J–èé-©9Ë¿	`vã|ö\\ü\Z]±6ñu5\0Ñn“Ñ˜m®‘û·»BQµR¢ªæÐ:sœñf—Až–Tà\r¸âPHŽ‡<e \'?9ÇŸWïÐÓyÂº¢œœ¾]1¦¸AiÖÞ@q²Jx”•$¥IRI\nJæ ƒÌAæ4Òj\r!Æé1›/¡yÄŽŠÃ!`-`^PÉó.œlÙDM¼r³E=0©vªœæ;®ZXb“2£KiBm2¯3\r¸OD¬õc_àœŒ¤»ÎÙl*\\–ÅvþC|¤û¡àjvßëùÃ\\§\\Ô:EÃH|I¥×)¬Ê§¾8™uI?A\Z‰2¤8ØZs¼…´éJ³Œ!X$®_—[’ pE4Æ¼Ê?›­±ŒTÁ€<êM`×@ä3­BÓM+ŒTžèëuëu˜›¡BC‘ÕöØ»CÂKK!-H8íJ¸PIÂ‘Ø“ª¯„[–Dû#Ò.šF`z3qª,;•j%Ç“¸ƒŠyôŽœýzá‹iît©Ñ˜S«jz1¥Ž?œ?ËU\0™PÏI«¹(qFx˜èüjtøU6QÅ*#©RáJ%Æ\'•d$, «„•\0ŒòÎ¤7nð&Å¶Z™PÊJN#a\Zm¡ÃlDí{«77&¶Ò)”3÷ŽŠçˆãºSºŠƒzíÝÓ²ÛC@¾n×ÜjS´fcH±§ÓáP p=>tçÚC)KRÖž‰k+ZRÈñ–ôp‡wŸ°\\n]ykq%4¡¨¡& fÙ\\vc›½síIkUÌQ\r¶r«PkL@\0qÛH’à-øða±&B¥>ÄFÐô¥n-)J?9ê‚ò£4J‰£§¾¿ÅWûë>Y¶0eÖg¾¼þ½cÊŒc‰Tõçõëc0DkÅÁß^^µò£}yýz<¨ÆÜJ¢ÁÚ²Œ‹z’æAýH“ø$§ü5é§5år]_»N¬?(¬­†”Í¦âvüñ‡ò\rHxÈmÆ3ä\Z8È1†nã,½¾Ç.vmSû²õ¾«­ÍŸû—¡úê×”òzßãEhÝ—\n‹„ñ½&,fÙO•JJ@I×–lF\\™“—mªP@ä\0#Òö‹¨a×V¬À¨žaX¾öÃ4ûqºL¢GB#´îŠä¯ÆYÆ|ªùÎ½—våel„´ÂE‘’9õôžób·&&-%8ñÅJ5<Úºp‰KSèˆE?³·^üoý¹G”Š·gË¢0ì¶ãiºÉ‰‰¬¤ŽYHCC±iVyçUìÜÒ·J\rRœšÿ\01ü«¶&íJ-‹…,QJÊøk‡çýBUb˜‘X CR«AeiE2\\®™QIqž—£Q(AJˆ €y¥óNÉ»Æ TêÖ?(LãI™h´£D’H­\r4ç=q[·;z÷Çphõ-´ÚÍŒ¾lšíËÈ5mÅÜ)0Ø¦Ñ£:\n‘ }Ã!Ð’®pŒàœã„éi^YÙ¶Ì)*VJ 	H¡5:¡E`ÈJ<˜y*Jq	MI$h5ƒ\\Nö-©Å³-k2‹z¯A‹;ÎŸie°ž#óã:M.ÊeØKc0ŒÌ¾©™…8s“Xuë´pƒDh‚\rBejN¸i:^2&RëPŠçSŒ¸’•7\"yökŒÃ\rM0¦œJl1Õ‡Ý–y. ÑI5â>&Ú—ë\"ø¹öö²òŒëNã—Oynt—\nRàó) (!\Zò½§$¹	çVt:ç’™Lô’Ne\0zâßRg\"ld8…$å#\ZmŽäcÞÝÙˆf‰Ú…v¹­)¦Ýqt—Z	d+£	uµ¤òäI\\c‘ÕûbpQe¹f%s‹W\Z 	É ×FcR4žè¤­›øò­&Y´ñi4“M8JÄS¹Þ¶¯Ë‹nk}í*·oÁ‡9©q‘Ñ÷Õ6_bB[$ðøì¾Ú’IÂ›8$“RÞ«ºõÙµÕ,¥e&•IÖ½¸PÄÊÅi‹Çf‰”`kB5ùb…¶+°dr–—Ú‡Ç¯Q…(ƒd>Ø‰Å 1tTÝfKÁá0’––×“€‘äÎOùêmp.Âo]¦ é!¦À*¦s\\Ãehju\r±¼Ö‹–$°ÈÅjÍ³Y‰Z½¶9ðÔ(áê5M¦zÉmåºÒ•ƒ„ºÚ‰$ã%<+åÉCW]©ÁÙ“(eRô(qÚ	5\Zó¢ Òw®Ôaê¸rÓ¤Q¾[\"¬Ðn8ÕØOÉið*s Õ¡©aJ:#ÊfK*#‘(uµ§#¯í×˜§™™³çÃƒÓA óƒHµÛâm+”ÄTB×|6‘ùLoÅl‰›l+M:u1JÊ|€¶“ÅûSƒÉøÉWÓ«ß‚û`LÙ.K‹f£™_Ì¸¯ït‰jq.Óëñü©IæõêÎã„D²\'›×£Ždgn*ó·×ÐÇ]›Síþ½F¯£ ÜéñþË¿PýuEç“ûÖÿ\0Š£³°››\\¶©âDZr^Çá!¯þEŸÉª;‚ùTMZ²™B¡)\né	Ã¾‘xß¹…KÙOäçQ§YÇº±oŸa™L=\ZChz<†”‡Ùq9JÐ¡…<„¯N¡Š“QÂòÙ×®‡©6ÇtÖæÙö|Ì¥úâI”ËG­¶*\no¾1È²¡åÒWÅ®â\n2¤£Vø©^ø\\ÃÖSjË\\²T½xÓª´î‰h¶‚ÍÙKE›BÌŠú\"÷Âß©T§½ÒË›)~ýçÜ<Ô£êÖ$¤˜g!\'I;cIéçíòÜè\Z\0ÙŽ–B84AÇu¶ê¶ßCf4©Á§ÜuÞ£(WÎTàm\0v•˜ª‘KK›JW˜ÿ\0C¾8M,¢œâ·Ò¹J°6¾÷Üe˜tùÖm¾äØ“Ð÷\ZæÔEÍIyd4ÏÆpøÁ$<Û­ÊËÙn<@ óf9©·\\ ±—53h6ÅIJ)]yÏFzìÕtùb|SƒkdMˆÛ¡§=òxÒœgQ¤«) ë‡…\'%DG^¶`Ñ\Z …Ý-³awV&£é½lš]RaO$—Ò·b¨9L4ç9íÕ\rÂ$¢¼`}tƒó”]·aOØ!\'ì(ŽŒç6ÒÝi«Ó#eÎ%peYÕv±ŒLUQù®ê¹Å·\n“pí†åÞNÒiÍÇ¥T¶î›¤&!´„¶K’[O`$)DÔr ¤ç7µßáVÍjËKs©Pu\0\n€U08¡:tW‚¶8:œ~ÐRåTž-F´UAMt`\rF­4ë0îÁÐ¯­ìß«ß{·r„‹,ÝTXP-}µý0L‰û~œ§ËrGŠd:ü§_$‚R tÁg:Ç·ß.a4e)¨N°œÀ¤ÔÓhÛvŠ¹H7.ª¸N*¦•g lƒ¯d}\r­må¥]¦*—\"‹#a©%Óc¡—ã«±m¬°@89J±…ƒrO];»hI.ša@A ÿ\0F±UJ^[vRg( ’Açÿ\01¢‘Gö¯y\Z³*7Z¤ÌÚ2Ù¹k6íì‹~ym¿O˜¦W1–VâR¦J‹IÊøVÔ…Q×NØ–¸×ùwÍZ$ ‘ ¤àªjÏQ·M)Íã°Uzì&ždQÊ\0t…S]zŽÍ‡Îà~ˆ§s%™@—2}ÆÜû½mP6ÞÄˆôªÌé‡“l)®ÔùV”÷@ÉÁ#„Ü…ý»ReÔ¼i‚S‰>æ‘ZI\\Ç92SE	Ò¥`D@=Ï\\Ô{u\rÆ@‰}_U^ãº!1•3]RRä.:|Íô?“^Qµ¦µ-\'&1Y$ôšÅÊå‘Å6–ÛŠ\0Hæ‘>72#ß­Èhù¸ð}zk-¨B5J>œâ;iW#¶•n\rdq*\nÑU\Zldª2ˆ\n8í)ÀPó§\ZÝ[iwzÙCÇêü\'?VqÍ\r6Å’«FEMSÒÎ9ÇŽh¶Ñä1-†eEy©¤´—#¾ÊÂ´(e*I`‚uê$-¶“PqXŠyhSk)P¡í­£Xgn\'ý?¾¿‘Õ?îËÔnù„\'¾åßÀ¨}ºÿ\0âiO½oñˆhlM‰IƒC V¤…K©Tmˆî…©d!´8„(%)¸#$öçµÃû¡fÊXòÓNzN­”€($ÐlæøG¼³ÓSïK£Ñm´H­(xßÕx;~º-N©$¦Þ¯ÜSW)ò…2Aá’\0ËKX\räøÉZÓÍA^%›lÊµg¤8>¡ „æèÑÏÝ²Þrx–éé^p3ôþP¯¦ØWˆ Ñ\Z Ž*>ZªlöCðæ²¦ä5ÆRJOhP ¤Ž°A j¤…¦†6JŠQö¡ÜáO¹kÔ™÷îæî¦â[VõI¹t+î¹Rõ)¹-+--ô¥´®IAæêYÏY:Dô“³JsªZ!$áÓ¯¦°½©ôK ñ-%\n8F®ˆ±à\0\0\0\0 4¾ Ñ\Z ƒDð×ôVx{­´Ö;öE“-©a¦åÙü¥×~S|&¥>^ÉÓ’~Î-Þ	6{ÃFPùC¹ÚæSÇeNuË:ªœaXúÞ–;jærÏIôÇ!fT©Ðª0ktW˜f­Kx»rš.2TP¤) Ä…!kIÁe$(ìKfnÁ´Ñ4ÇÖNƒ˜ƒœqâ1†ëRÍ—µä.ïÕV¬ãH=97º×º\rÚd«omûžàB¼f²¦£_7.àÆ~Þ€¥rCHBd?ÃïƒjCy<‰Ç]½5ÃJ“£,é\ZM@=žè®åx1Jfªóà¶4\0B^¾#M¤Û÷vÖÈnN¬É¸ëL•>é¸åþ¹PªËuOK¡ÙÆë‹?6©‡Ü™}N,ÕJ5\'i‹P%´$%‰€j4=ÑE£50Ô[¤Ó¨(åS‘âõëŒf¦ôF ä 3û žzÜ†ÈŒ)¦ÈŽ9Ì—£¸ØRüdõÃ®%)ãS&Ò„ymvý\'kjê³7£!‹2|œÑ+ï¨­4Ç”y¶ñìaD“Åðœø¤”ÚW÷·g¤JMÙý“êì;w6hëºy>S,ŸÚãÖÚ6üùóßèó¦•\ZZ$Æ’Ò\\\";m¸Ú†R¤¨r ‚#¯WjBF ÅJ¦òTA\"\Z›€û†Â½’]$F¤)þ½F¯£i:ü.þCåÙj—ŽSïüB*·Ý%|Úôê]2ŸJµI¥³:æA¥©¶Ð’¢—À*ÂFp\0Ïf¼Éapñ{îü‹2ì²ÉKHJRVI	\0\nÑÁ4š/W‚›»lM8ó®8µ\ZÒ¤’iT1†®îo-Û¼¶’,Û‰šE\"˜‹‚QT›j;¬ÈSÐŸKÍ ©×ÆÑœ\0¢\"4¶Ôÿ\0¨‹íkJq.2ÀMAÁ.W].áfðCv¬¹ž5·&„bSLE4 CÁ=Ó7âR”þ”ÚG„•A‘“ÿ\0Ñ®‡ûäý–~þ¤oæ–î{G:Ó¹÷M_ŸÚ?P‘öï—±gá_êAæ–î{GzÓ¹ºjüø¦Ñú„´hóÿ\0|½‹?\nÿ\0R4·sÚ;ÖÈ=ÓWçÅ6Ô$}£GŸûåìYøWúy¥»žÑÞ´îAîš¿>)´~¡#í\Z<ÿ\0ß/bÏÂ¿ÔƒÍ-ÜöŽõ§rtÕùñM£õ	hÑçþù{~þ¤inç´w­;{¦¯ÏŠm¨HûF?÷ËØ³ð¯õ óKw=£½iÜƒÝ5~|ShýBGÚ4yÿ\0¾^ÅŸ…©š[¹íëNäé«óâ›Gê>Ñ£Ïýòö,ü+ýH<ÒÝÏhïZw ÷M_ŸÚ?P‘öï—±gá_êAæ–î{GzÓ¹ºÊ¦÷J]T;ºú™S¥O·è\"Ÿ%¦òŒZé–éZ’òQY.HPJyg$Æ-Î/¿0—m°R)è…žºVbKbÜë.Á—SL©D(×+šš!µeí\r¹b¸‡)\Zü’Ž¡R”ÒÇþ­\'L*¾V¢¾Â:Žô<\"Xé=Þ>E»*Q\ZK-µ\rHHåÒ6¢}JÖ†÷ÚDýTõèÐØ²¤ç=ÞÓáµWïzæ—íèå}¥ê§¨ïF>„”Ö{¼ ðÚ«÷½?óKöôr¾ÒõSÔw úSYîðƒÃj¯Þôÿ\0Í/ÛÑÊûKÕOQÞƒèIMg»Â\rª¿{Óÿ\04¿oG+í/U=Gz¡%5žï<6ªýïOüÒý½¯´½Tõè>„”Ö{¼ ðÚ«÷½?óKöõ¯+-Q=Gz0,91¤õÁ½*Š1éøÿ\0Ä¿oG+-Q=Gz3ô,¨Ò{¼!•sÆ‹vG\\j¤v’‡ATPR¯Y:Ü_L}”õèØXòÃIîð‡nÑÞ·nÍÓ] Ð.\n…vÛÊ>Þ»J%F„¥«½Ô„¡Ä$þãŒ HH$“-±¸d½Ö#<Saµ#@PQš‹¢´Ù»[ƒË¿l;Æ/)+ÒR@¯=RGM+¶%*Çt=ë[¤U(Ò©v»qjôçâÉr<\'Ã‰mÔ(¤—È\n8È#=‡K-Nïe­f=*ãL„:• •ÖŠ\ZUÂ+C…Aæ„R<X|ëo¡Ç\n ¡RšT\ZŠú#ÿÙ','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0\0d\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0õ´ºˆF Â:Â¦ŠXæl,õùGFÞ&™Ñ¿JÚH„Wù×‘EJz½F¯,tê\"Áñ*ÿ\0ß4ï³@z*þB´ì-ØSA ƒyºùRèsÝ÷öª¼„R?Ý¨¶ÇýÅüªÈ$wª—Å¢ŒÎ£!yqíëYN6WCÛ°ý±ÿ\0q*\nÀK+ùj#RÇ tª±]G.ìÖ’Imn.š8öL‘…møsÀ>£ó¬£5k–âïbÃ¼	ýÑ23\0 G‘ƒêqÅ;lÜ_Ê¢ßMÞav‘›€ `ÿ\0ë¥íPr²ÜQFò±q×¥Zò¢ÿ\0žIÿ\0|Š§hù‘¾•s5ÑE§™N÷3¯£A:á|½‡¹¢–øþýÝþ¦Šæ©nvtÂü¨f˜›b2g€*i&¹¸¹‰|ƒQ±gf`wð@\0Üç\'*¼ŠßKc\Zè¹pO½MöØÿ\0ºÿ\0®ŠmB\n72å&ì>xd™\n%Ä‘+0@2GÔŽ*L$6ÌÃKÈô\0Tmû¯ù\nŠi-gÇ›0Cõçš¾tO+/‘‘H@`A¨ªÿ\0mû¯ù\n>Û÷_ò¹ÐùYËÚÍä_ÜY1Ï•!QôíúVÔ×<–ÖöaŒÌØqƒ…\\Ié×ÌÝ>&¹pœqß ­µ”\0È#¸®u×C±ÅÉ&iHÄBá”£dçé×ùÔWWÖ’ÞÇ¤‘ÉòÆAÓ#Œžj‹;Ëp&žyeuR©¸\0¸\0AJGAÂœªBÎ1Z2\'£lÑ†qªäü½Òµ3šæŒŠF0iö:£ÛÎ¶²‚ñŸ¸Ãªû}*°õT}ÖEZ-ê+ïõËþïõ4U{»”yA¾íª5ÌÊ„_*?ÿÙ',NULL,NULL,NULL,NULL),(4,'sys','checked.gif','image/gif',364,'2013-12-14 18:15:36',364,'GIF89a\0\0¥7\0’’““””——˜˜žž%  (¢¢+££-¤¤.¥¥0¦¦2§§3©©7ªª8««:¬¬<­­=®®?¯¯A°°B±±D²²F³³H´´JµµK¶¶M··O¹¹SººU¼¼Y½½[¿¿_ÀÀaÁÁcÂÂeÇÇoËËxÍÍ|ÎÎ~ÏÏÑÑ…ÚÚšÝÝ¢àà©ââ®ãã±ää³çç»êêÃëëÆððÓòòÙóóÜõõáÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0?\0,\0\0\0\0\0\0\0pÀŸpH,\ZD\Z’8+y\"¬eÍ¤hÈ$ˆ–Ñfª4$ÊÓÄñ\ZÖRSºì‡’@B’±æøh\"F G($H1&K?	\n\0\'¢?#*©?.+¯´µDA\0;','GIF89a\0\0¥7\0’’““””——˜˜žž%  (¢¢+££-¤¤.¥¥0¦¦2§§3©©7ªª8««:¬¬<­­=®®?¯¯A°°B±±D²²F³³H´´JµµK¶¶M··O¹¹SººU¼¼Y½½[¿¿_ÀÀaÁÁcÂÂeÇÇoËËxÍÍ|ÎÎ~ÏÏÑÑ…ÚÚšÝÝ¢àà©ââ®ãã±ää³çç»êêÃëëÆððÓòòÙóóÜõõáÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0?\0,\0\0\0\0\0\0\0pÀŸpH,\ZD\Z’8+y\"¬eÍ¤hÈ$ˆ–Ñfª4$ÊÓÄñ\ZÖRSºì‡’@B’±æøh\"F G($H1&K?	\n\0\'¢?#*©?.+¯´µDA\0;',NULL,NULL,NULL,NULL),(5,'sys','conciliated.gif','image/gif',565,'2013-12-14 18:15:36',565,'GIF89a\0\0ÆV\0jr\0x\0l\0ƒ\0.g.x”##—A|A\0¬\0!–!™\0®\0\0±\0\0²\066%%§²#¤#2›2\0¾\0*¡*À1¢1¾7 77¡7; ;¹\0Ê\0\0Ï\04®4½\0Ó\0\0Õ\0K¥K\0Ú\0\0Û\0\0Ý\0U¢U\0à\0Îh h\0é\0\0î\0R¸L\0ñ\0í\0ó\0p¦pu§u\nõ\n\0þ\0ƒ¦ƒ‹¯‹|Èyš¶šƒÆƒˆÄˆŒÃŒž·ž¼—Á——Æ—·É·¾Ï¾¶Ü¶¾Ý¾ÁÛÁÉ×ÉÆÞÆÍáÍ×â×ÐêÐÜïÜãñãâòâåñååòåèñèéñéìôìÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0y€‚ƒ„…†‡„Pˆ„N;1F‹R=M\nG†U>#O? JƒSC-$\'Q‚H3\rKB\Z7+„T4*	/85†.!2%&0/6‡A)(,\":ˆL!\"<‹\0@ã9DêIEðõö„\0;','GIF89a\0\0ÆV\0jr\0x\0l\0ƒ\0.g.x”##—A|A\0¬\0!–!™\0®\0\0±\0\0²\066%%§²#¤#2›2\0¾\0*¡*À1¢1¾7 77¡7; ;¹\0Ê\0\0Ï\04®4½\0Ó\0\0Õ\0K¥K\0Ú\0\0Û\0\0Ý\0U¢U\0à\0Îh h\0é\0\0î\0R¸L\0ñ\0í\0ó\0p¦pu§u\nõ\n\0þ\0ƒ¦ƒ‹¯‹|Èyš¶šƒÆƒˆÄˆŒÃŒž·ž¼—Á——Æ—·É·¾Ï¾¶Ü¶¾Ý¾ÁÛÁÉ×ÉÆÞÆÍáÍ×â×ÐêÐÜïÜãñãâòâåñååòåèñèéñéìôìÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0y€‚ƒ„…†‡„Pˆ„N;1F‹R=M\nG†U>#O? JƒSC-$\'Q‚H3\rKB\Z7+„T4*	/85†.!2%&0/6‡A)(,\":ˆL!\"<‹\0@ã9DêIEðõö„\0;',NULL,NULL,NULL,NULL),(6,'sys','delete.gif','image/gif',1064,'2013-12-14 18:15:36',1064,'GIF89a\0\0ç¡\0þ\0\0ýþûùü\"þ$þ$þ%	þ)þ)÷/0ù3(þ5prþ< otù>+þ>\"þ?!rv„÷C0sw„sw…tx…tx†ty†ty‰ùN;ûVDýY8ˆ‹–ˆŒ—ùaJ‰Œ˜‰—‰˜Š–Š˜‹Ž˜‹˜Œš÷hQþjHî{jþwUøwgšŸ²› ±ø‚v÷…n §¸þ‘p÷“‹ì–š®±ÂÝ¡Ÿ°µÃþœ€³¹Èù ‘µ¹Êµ¼Êé©°»¾Éæ¯±¾ÂÒ¿ÃÎñ¯±ø± ÷³¨ÂÇÒÅÇÐÅÉÑÄÉ×ÅÉÕ÷·®í¹ÀÆËØû¹©ÇË×þ»§ÉÎÙËÐÞÌÐÜØÌÕÎÑÝÎÒÝÏÒÞÐÒÝËÕãèÊÑçÌÐÑÕàÑÖãÓØâÕÙâ×ÚããÕÞæ×ÛëÖ×ÛÝçÛàìþÕÈÚâðÞáìþ×ËØäñáâìáâíàãîâäëãçòþàÕæèíæèòáëöæéõçéóáíøæîùìî÷âóýóíðîïóìñøðòüìõýóóöòóûíöüóõùî÷ýóöûñ÷üíùýòøüõ÷û÷÷ùòùýìüþøøû÷ùûøùûóüþöûü÷ûýñþþóýþþùøøûþùûüùûýõýþùûþûüýþüûýýýüþþýþþþþþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0ì\0¥„Cð(;zðùÇ¡PAuJK!r\Zþ{”£A]\n5Rò¦!GˆŸaÊ$ÉHvütiÓ7`ÌØ ³ã&E‹ú¬q2‚LNgÔx’iZ¼PG\'È¨@P¡\n\Z2+Ei±BF‚˜qsáP‘ñ0!.wÒÀÉÀ0(D”ŒH8 €Á=læ`p\n\n:\00à;|ÿ½eÒà@BD\0  Of¿{\\Ô0$ˆQ“6ÚÔY¼1â\'Oš,ešt(\r”H‘EŠ&F\0ñA„†\0;','GIF89a\0\0ç¡\0þ\0\0ýþûùü\"þ$þ$þ%	þ)þ)÷/0ù3(þ5prþ< otù>+þ>\"þ?!rv„÷C0sw„sw…tx…tx†ty†ty‰ùN;ûVDýY8ˆ‹–ˆŒ—ùaJ‰Œ˜‰—‰˜Š–Š˜‹Ž˜‹˜Œš÷hQþjHî{jþwUøwgšŸ²› ±ø‚v÷…n §¸þ‘p÷“‹ì–š®±ÂÝ¡Ÿ°µÃþœ€³¹Èù ‘µ¹Êµ¼Êé©°»¾Éæ¯±¾ÂÒ¿ÃÎñ¯±ø± ÷³¨ÂÇÒÅÇÐÅÉÑÄÉ×ÅÉÕ÷·®í¹ÀÆËØû¹©ÇË×þ»§ÉÎÙËÐÞÌÐÜØÌÕÎÑÝÎÒÝÏÒÞÐÒÝËÕãèÊÑçÌÐÑÕàÑÖãÓØâÕÙâ×ÚããÕÞæ×ÛëÖ×ÛÝçÛàìþÕÈÚâðÞáìþ×ËØäñáâìáâíàãîâäëãçòþàÕæèíæèòáëöæéõçéóáíøæîùìî÷âóýóíðîïóìñøðòüìõýóóöòóûíöüóõùî÷ýóöûñ÷üíùýòøüõ÷û÷÷ùòùýìüþøøû÷ùûøùûóüþöûü÷ûýñþþóýþþùøøûþùûüùûýõýþùûþûüýþüûýýýüþþýþþþþþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0ì\0¥„Cð(;zðùÇ¡PAuJK!r\Zþ{”£A]\n5Rò¦!GˆŸaÊ$ÉHvütiÓ7`ÌØ ³ã&E‹ú¬q2‚LNgÔx’iZ¼PG\'È¨@P¡\n\Z2+Ei±BF‚˜qsáP‘ñ0!.wÒÀÉÀ0(D”ŒH8 €Á=læ`p\n\n:\00à;|ÿ½eÒà@BD\0  Of¿{\\Ô0$ˆQ“6ÚÔY¼1â\'Oš,ešt(\r”H‘EŠ&F\0ñA„†\0;',NULL,NULL,NULL,NULL),(7,'sys','dropdown.gif','image/gif',115,'2013-12-14 18:15:36',115,'GIF89a\r\0\0Â\0\0\0\0yyy™™™¶¶¶ÜÜÜôôôÿÿÿÿÿÿ!ù\n\0\0,\0\0\0\0\r\0\0\08Xº¬ÓpEªµa–Ë3å˜†ßèm#qàº‚*²o,—­}£•¾§¿ÔJ83ACcA’i:Ìç3\0;','GIF89a\r\0\0Â\0\0\0\0yyy™™™¶¶¶ÜÜÜôôôÿÿÿÿÿÿ!ù\n\0\0,\0\0\0\0\r\0\0\08Xº¬ÓpEªµa–Ë3å˜†ßèm#qàº‚*²o,—­}£•¾§¿ÔJ83ACcA’i:Ìç3\0;',NULL,NULL,NULL,NULL),(8,'sys','edit.gif','image/gif',1057,'2013-12-14 18:15:36',1057,'GIF89a\0\0çš\0ÄsOènˆŒ˜ês°…x”˜£•˜¤ü‚	–™¤–š¤—š¥—›¥˜›¥Ù‰[™œ¦ï‰0áTâ‘OŸ£²þ”ú“Ó—qº™ç +À£Ž©«¶þ \nßŸfª¬·þ£«®¹Ò¤Œ¬°¼ø£=Õ¦Ð©›Ò¨ó¤]±´¾±µÁþ®/µ¸Ãþ¸\0µ¹Äµ¹Æ¸¹¿Þ®˜ò±Uþ¶º»Áþ»à² Á¼Á»¾È¼¿ÉýÃÁÃÈûÈä¿‡þ¾FÑÀ¾þÂ;ÂÆÐôÉ;ýÎ\nûÏÑÃÃþÂNþÉ*ÇÈÍËÇÏþÒ÷ÍOùËYÌÍÒüÖ8ÛÌÈÏÑÖÏÑÚþÔMÐÒÛÏÒÞ×ÑÒþÔbÒÔÝþÛAÒÕààÒÊÚÓØÓÖÞÕ×ßúØ{ÖØßéÒÌ÷Ó£ÕÙâÖÙä×ÙâõØ™ûÞiØÚâûÛ~ÙÛãÚÜäÛÝã÷Ø³ÜßçÝàêÞàèáãëáãìåâèóãÓææçäæîäæïççèìåæûçºèèéöçÐééêèêðêêëèêñôèÞøêÓêìóñëëüêÓöêæìíòìîôîîïíïòïðòòòòñòøûóéööööøú÷øûøùûúúúýúöùûüúûüúûýûûûûûýûüýüýýþþþþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0å\0­¨¨æK\Z6¸ô¯á?5š\"bb”H%f8|1¢¤>?TLÐe#ÄŽ”Äép\0\0‹COFT„ä††\0$4‰ÙQ“2(40B	Ïˆ™’ñ`˜FÊ´„\nXÖ¬0úˆc&H[ªôAbŽ›8òÐA¤æR$?cž‰ð¦M-âÄ¹£¦R#<e¦¼a&‹“yéìéÛN\Z/„h¡…CŒB‹ú½‚á.“©˜(sR#&¤ !s†œ\ZQZr¨Ž¡Azýác#¶À,P\0b\0;','GIF89a\0\0çš\0ÄsOènˆŒ˜ês°…x”˜£•˜¤ü‚	–™¤–š¤—š¥—›¥˜›¥Ù‰[™œ¦ï‰0áTâ‘OŸ£²þ”ú“Ó—qº™ç +À£Ž©«¶þ \nßŸfª¬·þ£«®¹Ò¤Œ¬°¼ø£=Õ¦Ð©›Ò¨ó¤]±´¾±µÁþ®/µ¸Ãþ¸\0µ¹Äµ¹Æ¸¹¿Þ®˜ò±Uþ¶º»Áþ»à² Á¼Á»¾È¼¿ÉýÃÁÃÈûÈä¿‡þ¾FÑÀ¾þÂ;ÂÆÐôÉ;ýÎ\nûÏÑÃÃþÂNþÉ*ÇÈÍËÇÏþÒ÷ÍOùËYÌÍÒüÖ8ÛÌÈÏÑÖÏÑÚþÔMÐÒÛÏÒÞ×ÑÒþÔbÒÔÝþÛAÒÕààÒÊÚÓØÓÖÞÕ×ßúØ{ÖØßéÒÌ÷Ó£ÕÙâÖÙä×ÙâõØ™ûÞiØÚâûÛ~ÙÛãÚÜäÛÝã÷Ø³ÜßçÝàêÞàèáãëáãìåâèóãÓææçäæîäæïççèìåæûçºèèéöçÐééêèêðêêëèêñôèÞøêÓêìóñëëüêÓöêæìíòìîôîîïíïòïðòòòòñòøûóéööööøú÷øûøùûúúúýúöùûüúûüúûýûûûûûýûüýüýýþþþþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0å\0­¨¨æK\Z6¸ô¯á?5š\"bb”H%f8|1¢¤>?TLÐe#ÄŽ”Äép\0\0‹COFT„ä††\0$4‰ÙQ“2(40B	Ïˆ™’ñ`˜FÊ´„\nXÖ¬0úˆc&H[ªôAbŽ›8òÐA¤æR$?cž‰ð¦M-âÄ¹£¦R#<e¦¼a&‹“yéìéÛN\Z/„h¡…CŒB‹ú½‚á.“©˜(sR#&¤ !s†œ\ZQZr¨Ž¡Azýác#¶À,P\0b\0;',NULL,NULL,NULL,NULL),(9,'sys','edit_gray.gif','image/gif',1055,'2013-12-14 18:15:36',1055,'GIF89a\0\0ç\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~€€€‚‚‚ƒƒƒ„„„………†††‡‡‡ˆˆˆ‰‰‰ŠŠŠ‹‹‹ŒŒŒŽŽŽ‘‘‘’’’“““”””•••–––———˜˜˜™™™ššš›››œœœžžžŸŸŸ   ¡¡¡¢¢¢£££¤¤¤¥¥¥¦¦¦§§§¨¨¨©©©ªªª«««¬¬¬­­­®®®¯¯¯°°°±±±²²²³³³´´´µµµ¶¶¶···¸¸¸¹¹¹ººº»»»¼¼¼½½½¾¾¾¿¿¿ÀÀÀÁÁÁÂÂÂÃÃÃÄÄÄÅÅÅÆÆÆÇÇÇÈÈÈÉÉÉÊÊÊËËËÌÌÌÍÍÍÎÎÎÏÏÏÐÐÐÑÑÑÒÒÒÓÓÓÔÔÔÕÕÕÖÖÖ×××ØØØÙÙÙÚÚÚÛÛÛÜÜÜÝÝÝÞÞÞßßßàààáááâââãããäääåååæææçççèèèéééêêêëëëìììíííîîîïïïðððñññòòòóóóôôôõõõööö÷÷÷øøøùùùúúúûûûüüüýýýþþþÿÿÿ!þCreated with The GIMP\0!ù\n\0÷\0,\0\0\0\0\0\0\0ã\0«}ø-›4_¨Xéjw¯á½oÿ\"úÃ\'Ø1b´|9|1â>uÆr‘j„m#ÄŽû´k•éP.xOF¤Ç«D¥FE‹Ùñºa½HqJ«ÏŽÌ–íò4+[-£\re¶ƒvW(kàrÕÇñŸ>lÕŠÅšen®aéÎÉûÖo;mÒŽ‰\"7.›«\\æÌ¡û¶_:mÔtÅÚf-\Z+¼çÔñÅg®[¶RÇ®Q“Öj—;{ûVKõª6ÉÔh!‹Ù\Z¤iÝ´qgÎÔ‡üòµ;÷®:wìÔýzmŒ“ïM›4iÊ„	£×\0;','GIF89a\0\0ç\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~€€€‚‚‚ƒƒƒ„„„………†††‡‡‡ˆˆˆ‰‰‰ŠŠŠ‹‹‹ŒŒŒŽŽŽ‘‘‘’’’“““”””•••–––———˜˜˜™™™ššš›››œœœžžžŸŸŸ   ¡¡¡¢¢¢£££¤¤¤¥¥¥¦¦¦§§§¨¨¨©©©ªªª«««¬¬¬­­­®®®¯¯¯°°°±±±²²²³³³´´´µµµ¶¶¶···¸¸¸¹¹¹ººº»»»¼¼¼½½½¾¾¾¿¿¿ÀÀÀÁÁÁÂÂÂÃÃÃÄÄÄÅÅÅÆÆÆÇÇÇÈÈÈÉÉÉÊÊÊËËËÌÌÌÍÍÍÎÎÎÏÏÏÐÐÐÑÑÑÒÒÒÓÓÓÔÔÔÕÕÕÖÖÖ×××ØØØÙÙÙÚÚÚÛÛÛÜÜÜÝÝÝÞÞÞßßßàààáááâââãããäääåååæææçççèèèéééêêêëëëìììíííîîîïïïðððñññòòòóóóôôôõõõööö÷÷÷øøøùùùúúúûûûüüüýýýþþþÿÿÿ!þCreated with The GIMP\0!ù\n\0÷\0,\0\0\0\0\0\0\0ã\0«}ø-›4_¨Xéjw¯á½oÿ\"úÃ\'Ø1b´|9|1â>uÆr‘j„m#ÄŽû´k•éP.xOF¤Ç«D¥FE‹Ùñºa½HqJ«ÏŽÌ–íò4+[-£\re¶ƒvW(kàrÕÇñŸ>lÕŠÅšen®aéÎÉûÖo;mÒŽ‰\"7.›«\\æÌ¡û¶_:mÔtÅÚf-\Z+¼çÔñÅg®[¶RÇ®Q“Öj—;{ûVKõª6ÉÔh!‹Ù\Z¤iÝ´qgÎÔ‡üòµ;÷®:wìÔýzmŒ“ïM›4iÊ„	£×\0;',NULL,NULL,NULL,NULL),(10,'sys','help.gif','image/gif',1720,'2013-12-14 18:15:36',1720,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\" xmpMM:DocumentID=\"xmp.did:F80BDEE26A7F11E0B6BAF55348335066\" xmpMM:InstanceID=\"xmp.iid:F80BDEE16A7F11E0B6BAF55348335066\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:7EA9C5017F6AE011AAD1E8E1F522A2F4\" stRef:documentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>Lóz2\0\0êIDATxÚbþÿÿ?ÃcöÀ·ImÞ9ÿÄ0ÑŒ‹þüg\0€\0‹l8ú$ûë©¿ÿ@ÒEýþ_¸ùïÿÆ³¿ÿTß n\0±ößøVÒÖ°àþ–sç˜Nú6ÏÊD†åûßw÷î	‚n>¹š@03:ßùõÿÐµ¿ÿ\\þ÷ÿè­¿ÿçíz\rvSrûÅ®ºå·o03Øj21Ü{øŸÁJ•‰á—ÃÖó?ÿ³\0M:ðáËû{÷Ê&Bì‚Ñ_þ|g`;\rŠ¦Üÿ¯£.ÉÀÏÇÂpçþg†[÷åÎ­ÔŸ@p@«\Z€T._â ä°HÈA ‡r(ÈÁ ‡ƒ\räYS-9†ß¿ü­˜Àš6ûÇÀ/ü—añºk¦L&z’/_A$çoýVðî=Ã‹gÌ f3Ãëwÿºÿe(‹eÓ Àò	Lé²Ü¸ó…áÍ;^ï€’˜šÌtáÚÃ\\Ûÿo?ügˆödÓÀXcxûñÐ\'\r`o½˜£¦(7YE‘—áã§?Wn>gèËQd`ðp€†EŽ’,ÿd5%1aNNN°ø÷ï^½ýÎpëÞ†{?‚¦nƒ•‘ôdm\rA†/þþadÀ˜Yþ3ðüg¸zã=Ã±sOÁ1Ódƒ½¹|§„ˆ\0Ã«gŒ@Û€AfÍÄ \"ÅÈpöÆ†?üÓ×þ3||ÏÈ \"ÂÉ *Ìé5iÅMFse¤xnÝ``ø\r¤©kÿÁmÍfÂ{b5\r3dÀå·ïÿÚÿÉÈðñ#ª“Ò˜!ô¬¿(âüüÀP~»2¾äô…g²r~ÅÞ¼G`@©©ééEN\nÒRå*Šü13¼zýŸáÃˆb¢Œò@wîdxðôY\'0\0+0¢j	òbPR‚\nƒ’ø ÞOæP\0\0¸ZŠIýY?Î\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\" xmpMM:DocumentID=\"xmp.did:F80BDEE26A7F11E0B6BAF55348335066\" xmpMM:InstanceID=\"xmp.iid:F80BDEE16A7F11E0B6BAF55348335066\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:7EA9C5017F6AE011AAD1E8E1F522A2F4\" stRef:documentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>Lóz2\0\0êIDATxÚbþÿÿ?ÃcöÀ·ImÞ9ÿÄ0ÑŒ‹þüg\0€\0‹l8ú$ûë©¿ÿ@ÒEýþ_¸ùïÿÆ³¿ÿTß n\0±ößøVÒÖ°àþ–sç˜Nú6ÏÊD†åûßw÷î	‚n>¹š@03:ßùõÿÐµ¿ÿ\\þ÷ÿè­¿ÿçíz\rvSrûÅ®ºå·o03Øj21Ü{øŸÁJ•‰á—ÃÖó?ÿ³\0M:ðáËû{÷Ê&Bì‚Ñ_þ|g`;\rŠ¦Üÿ¯£.ÉÀÏÇÂpçþg†[÷åÎ­ÔŸ@p@«\Z€T._â ä°HÈA ‡r(ÈÁ ‡ƒ\räYS-9†ß¿ü­˜Àš6ûÇÀ/ü—añºk¦L&z’/_A$çoýVðî=Ã‹gÌ f3Ãëwÿºÿe(‹eÓ Àò	Lé²Ü¸ó…áÍ;^ï€’˜šÌtáÚÃ\\Ûÿo?ügˆödÓÀXcxûñÐ\'\r`o½˜£¦(7YE‘—áã§?Wn>gèËQd`ðp€†EŽ’,ÿd5%1aNNN°ø÷ï^½ýÎpëÞ†{?‚¦nƒ•‘ôdm\rA†/þþadÀ˜Yþ3ðüg¸zã=Ã±sOÁ1Ódƒ½¹|§„ˆ\0Ã«gŒ@Û€AfÍÄ \"ÅÈpöÆ†?üÓ×þ3||ÏÈ \"ÂÉ *Ìé5iÅMFse¤xnÝ``ø\r¤©kÿÁmÍfÂ{b5\r3dÀå·ïÿÚÿÉÈðñ#ª“Ò˜!ô¬¿(âüüÀP~»2¾äô…g²r~ÅÞ¼G`@©©ééEN\nÒRå*Šü13¼zýŸáÃˆb¢Œò@wîdxðôY\'0\0+0¢j	òbPR‚\nƒ’ø ÞOæP\0\0¸ZŠIýY?Î\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(11,'sys','icon.ico','image/x-ico',628,'2013-12-14 18:15:36',628,'GIF89a\0\0Æq\0µx8Àz.Ä€7µ‚PÓ ¾ƒF¾…KÜ…\"áˆ ºŽeÕ‹8×‹5åŠ æŠ ã(Ø•Kñ’ ò’ ò’!á–@ò”\"ò”#ò•&ð–*ò›%ó›3ÝžXó&óž8ðŸ?ò¡1ó£4ò¤/ó£7Ò©jÏ©‚Ó©}È«‹Ë«ó©3Ú­]ó¨HÉ®–ó«Dó«Nó­@ó¬OÕ±{õ¬Tó¯Bô®Mê¯kõ®YÎ´—ó±Kô°Uó°Yô°Wô°XÑµÛµsÎ¶ó¶>ó³]ô´Wó¶Tó·SëºTó¸Vì·xô·bó¼CóºXÑ½«ô½]è½Œó¼|óÁVäÁƒóÃYôÃfÜÆ§íÇ}åÇ—ôÈlôÉnôÆŽíÊ‰ÜÌ¾ôÌŠôÌ‹éÎ¢õÐ„ñÒ¯õÖ™òÕµõÙ£õÚ¥ïÛ¸ëÜÆöÜ«èÝÔìßÎïßÏóà½ñçÜòèÞòéß÷ìßùðçûù÷ýüûþýüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0¼€.8:†‡†9,‚Y`dbaZ)hi[`cq;`?7^¥fq5^S=/¥¥F2\\²N%\"²²WQR\\@+UPBADHJTUU<I(U6!lkÓ1MCOO-ppÓâ >G\'Ó\rãîÓ4îVEãLqp\nã_âÄ!1n‰À0ºÌˆpF \n ^‘à@›8oh(ƒ€;yjâ¸	ˆþ¸›`b\0wŒ>~\0;','GIF89a\0\0Æq\0µx8Àz.Ä€7µ‚PÓ ¾ƒF¾…KÜ…\"áˆ ºŽeÕ‹8×‹5åŠ æŠ ã(Ø•Kñ’ ò’ ò’!á–@ò”\"ò”#ò•&ð–*ò›%ó›3ÝžXó&óž8ðŸ?ò¡1ó£4ò¤/ó£7Ò©jÏ©‚Ó©}È«‹Ë«ó©3Ú­]ó¨HÉ®–ó«Dó«Nó­@ó¬OÕ±{õ¬Tó¯Bô®Mê¯kõ®YÎ´—ó±Kô°Uó°Yô°Wô°XÑµÛµsÎ¶ó¶>ó³]ô´Wó¶Tó·SëºTó¸Vì·xô·bó¼CóºXÑ½«ô½]è½Œó¼|óÁVäÁƒóÃYôÃfÜÆ§íÇ}åÇ—ôÈlôÉnôÆŽíÊ‰ÜÌ¾ôÌŠôÌ‹éÎ¢õÐ„ñÒ¯õÖ™òÕµõÙ£õÚ¥ïÛ¸ëÜÆöÜ«èÝÔìßÎïßÏóà½ñçÜòèÞòéß÷ìßùðçûù÷ýüûþýüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0¼€.8:†‡†9,‚Y`dbaZ)hi[`cq;`?7^¥fq5^S=/¥¥F2\\²N%\"²²WQR\\@+UPBADHJTUU<I(U6!lkÓ1MCOO-ppÓâ >G\'Ó\rãîÓ4îVEãLqp\nã_âÄ!1n‰À0ºÌˆpF \n ^‘à@›8oh(ƒ€;yjâ¸	ˆþ¸›`b\0wŒ>~\0;',NULL,NULL,NULL,NULL),(12,'sys','import.gif','image/gif',613,'2013-12-14 18:15:36',613,'GIF89a\0\0Æx\0\'­\'²(²\07¿;ÍDÒEÞGòTÚ8D³SõTöW÷\n_Ò^ùbú#_ÉeËIU«	hüNW¬IZ®%jÄ\nnýjúAb²I_°pþId²0mÒ3q¿wÿHmµ8józÿ{ÿCpÃ4wÌÿ7{ÐXrÔ>}à%„ÿ&…þE}ß(†ÿI|ÞO{ÜWyÙ.‰ÿE†×2ÿ[ƒÇf…º8ÿ=”ÿL“ïT’àC–ûlŒÐE™ÿGšÿJœÿUœÿ_œè\\îQ ÿT¢ÿZ¢÷z›ÐX¥ÿZ¦ÿ[¦ÿ…Âb¥ÿ]¨ÿq¡ûg­ÿi¯ÿl±ÿ–¨Ïp³ÿx°ÿt¶ÿu¶ÿw·ü™³Ù|»ÿ}¼ÿ¤µÍ“¶ú‹¼ÿ½ÿ‡Âÿ¨¹âŠÄþÇÿ£¿ú»½Ý Çÿ¢Éÿ¯ÅùÀÅæÁÅå¿ÊØÀÇçÀÈçºÌåÀÊè¶ÕÿÑÜë×ÜãËáÿßåôììîâïÿãðÿîîðìïõïðòÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0©€‚ƒ„…„	Š‹\0b…g(ts“”e…f0p›œpa…i/m¤¥mZ…j.d­­cL!\Z…l,\\·[?„q^)RRJ1\"\nqq;8FB<6-#Pv$ASQMG>6* r‚4@]WOH=3&5…E9`XN†ÜXÑ ‰¡?Vd|¡²DG„,­9Q…ˆ4¹)ááMFBwê\0;','GIF89a\0\0Æx\0\'­\'²(²\07¿;ÍDÒEÞGòTÚ8D³SõTöW÷\n_Ò^ùbú#_ÉeËIU«	hüNW¬IZ®%jÄ\nnýjúAb²I_°pþId²0mÒ3q¿wÿHmµ8józÿ{ÿCpÃ4wÌÿ7{ÐXrÔ>}à%„ÿ&…þE}ß(†ÿI|ÞO{ÜWyÙ.‰ÿE†×2ÿ[ƒÇf…º8ÿ=”ÿL“ïT’àC–ûlŒÐE™ÿGšÿJœÿUœÿ_œè\\îQ ÿT¢ÿZ¢÷z›ÐX¥ÿZ¦ÿ[¦ÿ…Âb¥ÿ]¨ÿq¡ûg­ÿi¯ÿl±ÿ–¨Ïp³ÿx°ÿt¶ÿu¶ÿw·ü™³Ù|»ÿ}¼ÿ¤µÍ“¶ú‹¼ÿ½ÿ‡Âÿ¨¹âŠÄþÇÿ£¿ú»½Ý Çÿ¢Éÿ¯ÅùÀÅæÁÅå¿ÊØÀÇçÀÈçºÌåÀÊè¶ÕÿÑÜë×ÜãËáÿßåôììîâïÿãðÿîîðìïõïðòÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0©€‚ƒ„…„	Š‹\0b…g(ts“”e…f0p›œpa…i/m¤¥mZ…j.d­­cL!\Z…l,\\·[?„q^)RRJ1\"\nqq;8FB<6-#Pv$ASQMG>6* r‚4@]WOH=3&5…E9`XN†ÜXÑ ‰¡?Vd|¡²DG„,­9Q…ˆ4¹)ááMFBwê\0;',NULL,NULL,NULL,NULL),(13,'sys','inactive.gif','image/gif',666,'2013-12-14 18:15:36',666,'GIF89a\0\0Ær\0³AA³DD³GG³IIë22ì22ï22î44ÂGGõ22ÎCCÅHHÊFFù22õ44ÆIIÃLLþ33ÉJJþ44ÍKKõ<<ÝJJö@@ÝKKù@@ÝMMëGGÝNNþ@@ÿCCÿDDõJJöQQöRRùQQþTTõXXÿUU÷YYÿ]]öaaøaaøbbôddûbbÿaaþbb¹º»¼½¾ðllñllÿggôooõooÃ……Ä……úooÿrrÿyyÿ~~ñ‘‘â˜˜ã˜˜ô‘‘ä˜˜å˜˜æ˜˜ç˜˜è˜˜é˜˜õ””ö””ý‘‘ÿ‘‘ù””ÿ––ÿ™™Ç¶¶ÿžžË¹¹÷§§ù§§ÿ³³ÿ´´ø»»ù»»ÿÈÈèÔÔéÔÔêÔÔÿÎÎÿÒÒÿÔÔòÛÛÿ××øÞÞÿææîîîþììÿííÿîîÿððÿòòþõõÿõõÿ÷÷ÿùùÿûûÿüüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0Þ€‚dJHGFCBbƒdDK’KA^„\ZZeœY]ƒdV_a_¨_`_U\\„OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .â?jrÙ\"Ü	4Eï>næl+é3C	/ÄggrØ´hÐÀ€!&t ††	4Ê:L8\0CŒ‚ ¤qáÁƒ‹4P<\\\0@å#L 0ÁR¥‰¤˜Ôå\n8s¦ ³7tÍac@OL\\vÔ˜1#*3\0;','GIF89a\0\0Ær\0³AA³DD³GG³IIë22ì22ï22î44ÂGGõ22ÎCCÅHHÊFFù22õ44ÆIIÃLLþ33ÉJJþ44ÍKKõ<<ÝJJö@@ÝKKù@@ÝMMëGGÝNNþ@@ÿCCÿDDõJJöQQöRRùQQþTTõXXÿUU÷YYÿ]]öaaøaaøbbôddûbbÿaaþbb¹º»¼½¾ðllñllÿggôooõooÃ……Ä……úooÿrrÿyyÿ~~ñ‘‘â˜˜ã˜˜ô‘‘ä˜˜å˜˜æ˜˜ç˜˜è˜˜é˜˜õ””ö””ý‘‘ÿ‘‘ù””ÿ––ÿ™™Ç¶¶ÿžžË¹¹÷§§ù§§ÿ³³ÿ´´ø»»ù»»ÿÈÈèÔÔéÔÔêÔÔÿÎÎÿÒÒÿÔÔòÛÛÿ××øÞÞÿææîîîþììÿííÿîîÿððÿòòþõõÿõõÿ÷÷ÿùùÿûûÿüüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0Þ€‚dJHGFCBbƒdDK’KA^„\ZZeœY]ƒdV_a_¨_`_U\\„OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .â?jrÙ\"Ü	4Eï>næl+é3C	/ÄggrØ´hÐÀ€!&t ††	4Ê:L8\0CŒ‚ ¤qáÁƒ‹4P<\\\0@å#L 0ÁR¥‰¤˜Ôå\n8s¦ ³7tÍac@OL\\vÔ˜1#*3\0;',NULL,NULL,NULL,NULL),(14,'sys','incomplete.gif','image/gif',666,'2013-12-14 18:15:36',666,'GIF89a\0\0Ær\0³AA³DD³GG³IIë22ì22ï22î44ÂGGõ22ÎCCÅHHÊFFù22õ44ÆIIÃLLþ33ÉJJþ44ÍKKõ<<ÝJJö@@ÝKKù@@ÝMMëGGÝNNþ@@ÿCCÿDDõJJöQQöRRùQQþTTõXXÿUU÷YYÿ]]öaaøaaøbbôddûbbÿaaþbb¹º»¼½¾ðllñllÿggôooõooÃ……Ä……úooÿrrÿyyÿ~~ñ‘‘â˜˜ã˜˜ô‘‘ä˜˜å˜˜æ˜˜ç˜˜è˜˜é˜˜õ””ö””ý‘‘ÿ‘‘ù””ÿ––ÿ™™Ç¶¶ÿžžË¹¹÷§§ù§§ÿ³³ÿ´´ø»»ù»»ÿÈÈèÔÔéÔÔêÔÔÿÎÎÿÒÒÿÔÔòÛÛÿ××øÞÞÿææîîîþììÿííÿîîÿððÿòòþõõÿõõÿ÷÷ÿùùÿûûÿüüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0Þ€‚dJHGFCBbƒdDK’KA^„\ZZeœY]ƒdV_a_¨_`_U\\„OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .â?jrÙ\"Ü	4Eï>næl+é3C	/ÄggrØ´hÐÀ€!&t ††	4Ê:L8\0CŒ‚ ¤qáÁƒ‹4P<\\\0@å#L 0ÁR¥‰¤˜Ôå\n8s¦ ³7tÍac@OL\\vÔ˜1#*3\0;','GIF89a\0\0Ær\0³AA³DD³GG³IIë22ì22ï22î44ÂGGõ22ÎCCÅHHÊFFù22õ44ÆIIÃLLþ33ÉJJþ44ÍKKõ<<ÝJJö@@ÝKKù@@ÝMMëGGÝNNþ@@ÿCCÿDDõJJöQQöRRùQQþTTõXXÿUU÷YYÿ]]öaaøaaøbbôddûbbÿaaþbb¹º»¼½¾ðllñllÿggôooõooÃ……Ä……úooÿrrÿyyÿ~~ñ‘‘â˜˜ã˜˜ô‘‘ä˜˜å˜˜æ˜˜ç˜˜è˜˜é˜˜õ””ö””ý‘‘ÿ‘‘ù””ÿ––ÿ™™Ç¶¶ÿžžË¹¹÷§§ù§§ÿ³³ÿ´´ø»»ù»»ÿÈÈèÔÔéÔÔêÔÔÿÎÎÿÒÒÿÔÔòÛÛÿ××øÞÞÿææîîîþììÿííÿîîÿððÿòòþõõÿõõÿ÷÷ÿùùÿûûÿüüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0Þ€‚dJHGFCBbƒdDK’KA^„\ZZeœY]ƒdV_a_¨_`_U\\„OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .â?jrÙ\"Ü	4Eï>næl+é3C	/ÄggrØ´hÐÀ€!&t ††	4Ê:L8\0CŒ‚ ¤qáÁƒ‹4P<\\\0@å#L 0ÁR¥‰¤˜Ôå\n8s¦ ³7tÍac@OL\\vÔ˜1#*3\0;',NULL,NULL,NULL,NULL),(15,'sys','message_read.gif','image/gif',1082,'2013-12-14 18:15:36',1082,'GIF89a\0\0ç°\0«iQ³mT´mTµpV¶pV·sX¸tXºvZºwZ¼z\\¾}^¿}_À€`ÁaÂƒbÃ„cÄ‡eÅ‡eÆŠg…˜ÖÈiÇlËk   Í“m®™¢¡¡¡Ñ“l¢¢¢Ó™rÒšr“¨ÝÒœwÔžtË¡Š™«ÞÍ¢‡Ô¡zÖ¡vØ¤x£±ÔÚ§zÙ§ ²áÌª™Ü«|Ù­ŠÞ¬‚ß®Ü®‰Ý®‹ß°ƒà°†á±¬¼åá´…Ê¹­àµŽäµŠáµ“ß·”â¶’¸À×ã¹•ÆÀÀæºŠá»•ÁÄÉè¼Œå½•ã¼ ·Çç»ÇÞå¾àÀ¢±Êíæ¿›æÁ™ÆÉÓËÉÎæÄ¤éÄžàÅ²ÁÎ×ÛÇºîÆŒ¿ÌìåÈ§ÔËÉÚÌÆÁÕâðÌ–äÎ¯ñÍ’ñÍ”ïÍ›ÚÐÆÓÓÓòÐ˜îÏ«íÑ­çÓµïÒ§ãÔ¿òÓìÑ¹ëÓ¶ëÒ½óÔžçÕºòÔ¢ÚÚÚô×¤ôØ¥íÙ¾ëÚ¿ôÙ¬ôÚ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõÝ­õÝ®ìÞÆÙàóìÞÖòÞÊîàËòßÉÌêÿ÷â·Üæöøä¹ðäÐñäÎðæÞðæàøèÀ÷çÊÖîÿúëÅ÷êÖúìÅùìÍúíÈ÷í×àòÿúîÏ÷ìãûïÏûðÑûñÒëòûûñÕüóÐúòáêöÿûôÞëöÿúóëüõÛúóíñöüþ÷Ûõ÷üþúÜþúàõúÿÿûäÿûçþýåÿüëÿýëýþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0þ\0ÿ	¨ÈŒk**J=ˆäq‘h¡¦%8Ô\nÔçÎœ+%¤å„T¡#>ž€9Ó¦\"ý‚–MS~¬ØX1âÃ„ÂÜ 2Êæ«Tž(5\Z„…’\ZjtJbé((¥Lµð óàŒVŸvü¹ºÏ”tò4¸Ðb•*Q2²`adˆ\n;yà,¸BªR˜:™eC¼l\\8ñ7S4®X\"óÂ\r1.˜(Ué‡ È§892CcKBDbò4\'H†ö|ÑQ…Àcmº$i!>qÐx©BDÀ,P\0Á	\0€†74hßÎ];‡7\0;','GIF89a\0\0ç°\0«iQ³mT´mTµpV¶pV·sX¸tXºvZºwZ¼z\\¾}^¿}_À€`ÁaÂƒbÃ„cÄ‡eÅ‡eÆŠg…˜ÖÈiÇlËk   Í“m®™¢¡¡¡Ñ“l¢¢¢Ó™rÒšr“¨ÝÒœwÔžtË¡Š™«ÞÍ¢‡Ô¡zÖ¡vØ¤x£±ÔÚ§zÙ§ ²áÌª™Ü«|Ù­ŠÞ¬‚ß®Ü®‰Ý®‹ß°ƒà°†á±¬¼åá´…Ê¹­àµŽäµŠáµ“ß·”â¶’¸À×ã¹•ÆÀÀæºŠá»•ÁÄÉè¼Œå½•ã¼ ·Çç»ÇÞå¾àÀ¢±Êíæ¿›æÁ™ÆÉÓËÉÎæÄ¤éÄžàÅ²ÁÎ×ÛÇºîÆŒ¿ÌìåÈ§ÔËÉÚÌÆÁÕâðÌ–äÎ¯ñÍ’ñÍ”ïÍ›ÚÐÆÓÓÓòÐ˜îÏ«íÑ­çÓµïÒ§ãÔ¿òÓìÑ¹ëÓ¶ëÒ½óÔžçÕºòÔ¢ÚÚÚô×¤ôØ¥íÙ¾ëÚ¿ôÙ¬ôÚ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõÝ­õÝ®ìÞÆÙàóìÞÖòÞÊîàËòßÉÌêÿ÷â·Üæöøä¹ðäÐñäÎðæÞðæàøèÀ÷çÊÖîÿúëÅ÷êÖúìÅùìÍúíÈ÷í×àòÿúîÏ÷ìãûïÏûðÑûñÒëòûûñÕüóÐúòáêöÿûôÞëöÿúóëüõÛúóíñöüþ÷Ûõ÷üþúÜþúàõúÿÿûäÿûçþýåÿüëÿýëýþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0þ\0ÿ	¨ÈŒk**J=ˆäq‘h¡¦%8Ô\nÔçÎœ+%¤å„T¡#>ž€9Ó¦\"ý‚–MS~¬ØX1âÃ„ÂÜ 2Êæ«Tž(5\Z„…’\ZjtJbé((¥Lµð óàŒVŸvü¹ºÏ”tò4¸Ðb•*Q2²`adˆ\n;yà,¸BªR˜:™eC¼l\\8ñ7S4®X\"óÂ\r1.˜(Ué‡ È§892CcKBDbò4\'H†ö|ÑQ…Àcmº$i!>qÐx©BDÀ,P\0Á	\0€†74hßÎ];‡7\0;',NULL,NULL,NULL,NULL),(16,'sys','message_removed.gif','image/gif',1090,'2013-12-14 18:15:36',1090,'GIF89a\0\0ç´\0²FF²GG³IHµKKµLL·OO¶QM¹SS¶VO¸WN½[[«iQ½_\\³mT´mTÀgbÀgdµpV¶pV·sXÃkf¸tXÃmeºvZºwZÅok¼z\\ÁsvÈqq¿}_Á{sÀ€aÁaÊ{pÂƒbÊ~mÌ|tÃ„cÄ‡eÅ‡eÅƒ‡ÆŠg…˜ÖË…‡ÇlÏ‡ÉŽlÏŽy   ®™¢¡¡¡Ñ“l¢¢¢Ó‘}¿•ŸÔ“‘“¨ÝÓ›vË¡Š™«ÞÙ~Í¢‡Ô¡zÖ¡vØš—ØœØ¤x£±ÔÚ§zÙ§ ²áÐ¦¬Û£¡Û¦—Ü«|ß§‹Ù­ŠÞ¬‚Ü®‰ß°ƒà°†ß­Ÿ¬¼åÊ¹­àµŽäµŠß·”¸À×ÆÀÀæºŠá»•ã¶®ÁÄÉè¼Œå½•·Çç»ÇÞàÀ¢±ÊíæÁ™ÆÉÓËÉÎæÄ¤éÄžàÅ²ÁÎ×îÆŒ¿ÌìåÈ§×ËÕÁÕâðÌ–äÎ¯ñÍ’ñÍ”ïÍ›ÚÐÆÓÓÓòÐ˜íÑ­çÓµïÒ§ãÔ¿òÓëÓ¶ëÒ½óÔžçÕºòÔ¢îÓÃÂàùÚÚÚô×¤íÙ¾ëÚ¿ôÙ¬ôÚ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõÝ­ìÞÆÙàóòÞÊîàËÌêÿ÷â¸ÜæöôáÒõâÊðäÐñäÎçåìöäÌðæÞ÷çÇðæàøèÀöêÕúëÅúíÈêï÷ûïÏëòûûðßéôýúóëñöüý÷Þõ÷üþúÜþúàõúÿýûäÿûäûùúýúúýþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0þ\0ÿ	ÉË*}*ˆêÌ˜F™\niaÂia)1Sø`’ôH‘!6>ÐDE&U¥/WÊÐÑóœ:<ýË†–ÍUÖH1²‡Š,êà€D­Y®NµA1iÑ0\'dàÀH,W£ŽØ°È•C%`ð€ €Ã\rM+Ø”ÆÉ!F `(1Õ¢@Ù°p)’ˆ¡0ˆÀRD ÌÌ@ä×BZ]Ê0 r Vwš\0òcŒ›(`°eÀƒN¡ò@y§Œ¢Xz%@JŽæTQ#Æˆ\0’õ©€%{ä¨éâ\0Æ\0	\\¤0!âƒ&Dh°@Æ \Z2Â‹žÆ €\0;','GIF89a\0\0ç´\0²FF²GG³IHµKKµLL·OO¶QM¹SS¶VO¸WN½[[«iQ½_\\³mT´mTÀgbÀgdµpV¶pV·sXÃkf¸tXÃmeºvZºwZÅok¼z\\ÁsvÈqq¿}_Á{sÀ€aÁaÊ{pÂƒbÊ~mÌ|tÃ„cÄ‡eÅ‡eÅƒ‡ÆŠg…˜ÖË…‡ÇlÏ‡ÉŽlÏŽy   ®™¢¡¡¡Ñ“l¢¢¢Ó‘}¿•ŸÔ“‘“¨ÝÓ›vË¡Š™«ÞÙ~Í¢‡Ô¡zÖ¡vØš—ØœØ¤x£±ÔÚ§zÙ§ ²áÐ¦¬Û£¡Û¦—Ü«|ß§‹Ù­ŠÞ¬‚Ü®‰ß°ƒà°†ß­Ÿ¬¼åÊ¹­àµŽäµŠß·”¸À×ÆÀÀæºŠá»•ã¶®ÁÄÉè¼Œå½•·Çç»ÇÞàÀ¢±ÊíæÁ™ÆÉÓËÉÎæÄ¤éÄžàÅ²ÁÎ×îÆŒ¿ÌìåÈ§×ËÕÁÕâðÌ–äÎ¯ñÍ’ñÍ”ïÍ›ÚÐÆÓÓÓòÐ˜íÑ­çÓµïÒ§ãÔ¿òÓëÓ¶ëÒ½óÔžçÕºòÔ¢îÓÃÂàùÚÚÚô×¤íÙ¾ëÚ¿ôÙ¬ôÚ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõÝ­ìÞÆÙàóòÞÊîàËÌêÿ÷â¸ÜæöôáÒõâÊðäÐñäÎçåìöäÌðæÞ÷çÇðæàøèÀöêÕúëÅúíÈêï÷ûïÏëòûûðßéôýúóëñöüý÷Þõ÷üþúÜþúàõúÿýûäÿûäûùúýúúýþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0þ\0ÿ	ÉË*}*ˆêÌ˜F™\niaÂia)1Sø`’ôH‘!6>ÐDE&U¥/WÊÐÑóœ:<ýË†–ÍUÖH1²‡Š,êà€D­Y®NµA1iÑ0\'dàÀH,W£ŽØ°È•C%`ð€ €Ã\rM+Ø”ÆÉ!F `(1Õ¢@Ù°p)’ˆ¡0ˆÀRD ÌÌ@ä×BZ]Ê0 r Vwš\0òcŒ›(`°eÀƒN¡ò@y§Œ¢Xz%@JŽæTQ#Æˆ\0’õ©€%{ä¨éâ\0Æ\0	\\¤0!âƒ&Dh°@Æ \Z2Â‹žÆ €\0;',NULL,NULL,NULL,NULL),(17,'sys','message_replied.gif','image/gif',1097,'2013-12-14 18:15:36',1097,'GIF89a\0\0çÉ\0C…;Bˆ9D‡;F‹:K>H“9K‘>M’?SŽNN”?]‹Y«iQn‹HQœ=L¡5[›ET >³mTZF´mTS¥9X¡AX¡BµpVU¦<¶pVZ£Cy’P]¢G·sXa¡P¸tX|•UºvZºwZf¥Rd¨L¼z\\¾}^¿}__¶>h¯L²†_t¨SÀ€`f´FÁag´HÂƒbd¹AÃ„cƒ¢we½DÅ‡ek¾F~®l”œ“ƒ¬m…˜Ö‡ªqŠ¦‚nÀHÇloÁIÆi™ž˜uÅM   Í“m®™¢uÆN¡¡¡»Ÿm¢¢¢yÊPÊœp{ÊQÒšr“¨ÝÒœw}ÎS¨±}ÐR–°ÃË¡Š~ÓUÍ¢‡Ô¡z|ÙR„ÕYƒ×W£±Ô…Ø]ˆÚ^Ü«|Ù^‡ÞY«ÃÙ­ŠÞ¬‚ß®Ü®‰ß°ƒà°†á±âbá´…ÄÂÊ¹­àµŽäµŠß·”¸À×æºŠá»•è¼Œå½•·Çç»ÇÞå¾àÀ¢±ÊíæÁ™ÆÉÓËÉÎéÄžàÅ²ÛÇºîÆŒ¿ÌìÉÑ¸åÈ§ øj¸Ø×ÍÖªÁÕâÍØµðÌ–ÆÙÄäÎ¯ñÍ’ñÍ”ïÍ›ÚÐÆÌÚ¹¾ÛÝ¿ÜÖÓÓÓòÐ˜îÏ«çÓµïÒ§ãÔ¿òÓëÓ¶ëÒ½óÔžçÕºòÔ¢ÚÚÚô×¤áÞµôØ¥íÙ¾ëÚ¿ôÙ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõÝ­õÝ®ìÞÆÙàóÔæäòÞÊîàË÷â·Üæöøä¹ðäÐÝêäñäÎðæÞðæàøèÀ÷êÂúëÅàòÿëòûúòáðõñêöÿëöÿúóëúóíñöüõ÷üõúÿÿüëÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0þ\0ÿ	‹Ž™6›*8¬U·FÉƒk¡¯<l4ÕŠÕê©AWü¶§Ø¬:pø<ÂÔÉÒ\"+Trý‹c\'™Mc®M\0À‰Ž\">&©ùC,™\"`Ç‚Ij@\0Õ<5Ž ùuG[ÂzªàÐ›R2†A†ˆƒ„W½\"=0r L©T.†x4â‰<V@yÂT*P\'† ñP…Pš.\\²(Ñ°æ/§CÐÀ\"Œ&BRDã‰%C6`ˆa£ÇÂðºt&£C–ä €‚†vÑZåÈ\r CšTÚá @(]²X‰ÊÔÐœ	CžÂ €\n,L”ÑáB„G>%9DŽ#èÓ£Oò) \0;','GIF89a\0\0çÉ\0C…;Bˆ9D‡;F‹:K>H“9K‘>M’?SŽNN”?]‹Y«iQn‹HQœ=L¡5[›ET >³mTZF´mTS¥9X¡AX¡BµpVU¦<¶pVZ£Cy’P]¢G·sXa¡P¸tX|•UºvZºwZf¥Rd¨L¼z\\¾}^¿}__¶>h¯L²†_t¨SÀ€`f´FÁag´HÂƒbd¹AÃ„cƒ¢we½DÅ‡ek¾F~®l”œ“ƒ¬m…˜Ö‡ªqŠ¦‚nÀHÇloÁIÆi™ž˜uÅM   Í“m®™¢uÆN¡¡¡»Ÿm¢¢¢yÊPÊœp{ÊQÒšr“¨ÝÒœw}ÎS¨±}ÐR–°ÃË¡Š~ÓUÍ¢‡Ô¡z|ÙR„ÕYƒ×W£±Ô…Ø]ˆÚ^Ü«|Ù^‡ÞY«ÃÙ­ŠÞ¬‚ß®Ü®‰ß°ƒà°†á±âbá´…ÄÂÊ¹­àµŽäµŠß·”¸À×æºŠá»•è¼Œå½•·Çç»ÇÞå¾àÀ¢±ÊíæÁ™ÆÉÓËÉÎéÄžàÅ²ÛÇºîÆŒ¿ÌìÉÑ¸åÈ§ øj¸Ø×ÍÖªÁÕâÍØµðÌ–ÆÙÄäÎ¯ñÍ’ñÍ”ïÍ›ÚÐÆÌÚ¹¾ÛÝ¿ÜÖÓÓÓòÐ˜îÏ«çÓµïÒ§ãÔ¿òÓëÓ¶ëÒ½óÔžçÕºòÔ¢ÚÚÚô×¤áÞµôØ¥íÙ¾ëÚ¿ôÙ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõÝ­õÝ®ìÞÆÙàóÔæäòÞÊîàË÷â·Üæöøä¹ðäÐÝêäñäÎðæÞðæàøèÀ÷êÂúëÅàòÿëòûúòáðõñêöÿëöÿúóëúóíñöüõ÷üõúÿÿüëÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0þ\0ÿ	‹Ž™6›*8¬U·FÉƒk¡¯<l4ÕŠÕê©AWü¶§Ø¬:pø<ÂÔÉÒ\"+Trý‹c\'™Mc®M\0À‰Ž\">&©ùC,™\"`Ç‚Ij@\0Õ<5Ž ùuG[ÂzªàÐ›R2†A†ˆƒ„W½\"=0r L©T.†x4â‰<V@yÂT*P\'† ñP…Pš.\\²(Ñ°æ/§CÐÀ\"Œ&BRDã‰%C6`ˆa£ÇÂðºt&£C–ä €‚†vÑZåÈ\r CšTÚá @(]²X‰ÊÔÐœ	CžÂ €\n,L”ÑáB„G>%9DŽ#èÓ£Oò) \0;',NULL,NULL,NULL,NULL),(18,'sys','message_unread.gif','image/gif',1044,'2013-12-14 18:15:36',1044,'GIF89a\0\0ç‘\0¬iRµnUµoU·rWºvZ¼y\\¼z\\¿}_ÁaÃ…cÄ…dÆˆfÆ‰fÈŒhÈŒiËk   Í”m¡¡¡Î–qÐ˜pÎ˜vÑšsÒ›rÓuÖžwÖŸyØŸwÕ¡x×¢w×¡}Ö£{Ø¤zÙ¦yÝ¦xÚ¨}Üª|Ý¬á«}Þ­~ß­ƒß¯ß¯†Þ¯Œá±ß±á³„å³„ãµƒãµ‹áµ’ä·†æ¹†æº‰ã¹™ñºyè¼ˆç¼“å½›é¾‹ëÀ‹ëÁçÁ¢çÂžûÁnúÆ{îÈ–èÈ¯îÉžÿÉuûÊÿÍôÎ™ÿÐ‡ÿÒ‰÷ÓðÓ±üÓ‘÷Ó¡óÔ«øÕ ÚÚÚÿÕ‘ðÕ¾ù×¢ÿ×“ÜÜÜÿÚœÿÜžÿß§óáÎúä¸ÿä±úåºõæÊÿåµûæ»ûç¼ûç½÷éÎÿê¼ÿêÀøìÌ÷ëÚûíÐùíØýîÈÿîÆúðÖùðÛÿðËùðáÿñÎýòÓûóÙýôÓÿôÏúòèÿôÖúóëüöÝúôïÿö×ýøÝÿúÜþùåýúãÿúáþúèÿûæÿûçþûíþûòÿüêÿýåÿüíÿüîÿýëþüõþü÷ÿýòÿýõÿþòÿþøÿÿþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0Ø\0ÿ	H° Áƒ…ôØQc†‹%F€à€ÁÂ„\nVxL¹³H¡A€üì™£f‘pÔñ‘Ò#G‰ñ¡#&•h4zc£L™tÂÄ€‚%Œ¥iÑ(K°TA\0¢BÆh0C§Ë$R•€p+žC<¨ÈðCD%G\n@ HŽ-‡úx‰ãæ‰	#E@ÁFÇ™C‚þèqSæ‹“@@èÀ8kÈpÉrEJ’ 7@øpB„(@pÀ\0\0Hˆ\"‚íÛ¸mÏFÈ»wÁ€\0;','GIF89a\0\0ç‘\0¬iRµnUµoU·rWºvZ¼y\\¼z\\¿}_ÁaÃ…cÄ…dÆˆfÆ‰fÈŒhÈŒiËk   Í”m¡¡¡Î–qÐ˜pÎ˜vÑšsÒ›rÓuÖžwÖŸyØŸwÕ¡x×¢w×¡}Ö£{Ø¤zÙ¦yÝ¦xÚ¨}Üª|Ý¬á«}Þ­~ß­ƒß¯ß¯†Þ¯Œá±ß±á³„å³„ãµƒãµ‹áµ’ä·†æ¹†æº‰ã¹™ñºyè¼ˆç¼“å½›é¾‹ëÀ‹ëÁçÁ¢çÂžûÁnúÆ{îÈ–èÈ¯îÉžÿÉuûÊÿÍôÎ™ÿÐ‡ÿÒ‰÷ÓðÓ±üÓ‘÷Ó¡óÔ«øÕ ÚÚÚÿÕ‘ðÕ¾ù×¢ÿ×“ÜÜÜÿÚœÿÜžÿß§óáÎúä¸ÿä±úåºõæÊÿåµûæ»ûç¼ûç½÷éÎÿê¼ÿêÀøìÌ÷ëÚûíÐùíØýîÈÿîÆúðÖùðÛÿðËùðáÿñÎýòÓûóÙýôÓÿôÏúòèÿôÖúóëüöÝúôïÿö×ýøÝÿúÜþùåýúãÿúáþúèÿûæÿûçþûíþûòÿüêÿýåÿüíÿüîÿýëþüõþü÷ÿýòÿýõÿþòÿþøÿÿþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0Ø\0ÿ	H° Áƒ…ôØQc†‹%F€à€ÁÂ„\nVxL¹³H¡A€üì™£f‘pÔñ‘Ò#G‰ñ¡#&•h4zc£L™tÂÄ€‚%Œ¥iÑ(K°TA\0¢BÆh0C§Ë$R•€p+žC<¨ÈðCD%G\n@ HŽ-‡úx‰ãæ‰	#E@ÁFÇ™C‚þèqSæ‹“@@èÀ8kÈpÉrEJ’ 7@øpB„(@pÀ\0\0Hˆ\"‚íÛ¸mÏFÈ»wÁ€\0;',NULL,NULL,NULL,NULL),(19,'sys','mobileLogo.gif','image/gif',628,'2013-12-14 18:15:36',628,'GIF89a\0\0Æq\0µx8Àz.Ä€7µ‚PÓ ¾ƒF¾…KÜ…\"áˆ ºŽeÕ‹8×‹5åŠ æŠ ã(Ø•Kñ’ ò’ ò’!á–@ò”\"ò”#ò•&ð–*ò›%ó›3ÝžXó&óž8ðŸ?ò¡1ó£4ò¤/ó£7Ò©jÏ©‚Ó©}È«‹Ë«ó©3Ú­]ó¨HÉ®–ó«Dó«Nó­@ó¬OÕ±{õ¬Tó¯Bô®Mê¯kõ®YÎ´—ó±Kô°Uó°Yô°Wô°XÑµÛµsÎ¶ó¶>ó³]ô´Wó¶Tó·SëºTó¸Vì·xô·bó¼CóºXÑ½«ô½]è½Œó¼|óÁVäÁƒóÃYôÃfÜÆ§íÇ}åÇ—ôÈlôÉnôÆŽíÊ‰ÜÌ¾ôÌŠôÌ‹éÎ¢õÐ„ñÒ¯õÖ™òÕµõÙ£õÚ¥ïÛ¸ëÜÆöÜ«èÝÔìßÎïßÏóà½ñçÜòèÞòéß÷ìßùðçûù÷ýüûþýüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0¼€.8:†‡†9,‚Y`dbaZ)hi[`cq;`?7^¥fq5^S=/¥¥F2\\²N%\"²²WQR\\@+UPBADHJTUU<I(U6!lkÓ1MCOO-ppÓâ >G\'Ó\rãîÓ4îVEãLqp\nã_âÄ!1n‰À0ºÌˆpF \n ^‘à@›8oh(ƒ€;yjâ¸	ˆþ¸›`b\0wŒ>~\0;','GIF89a\0\0Æq\0µx8Àz.Ä€7µ‚PÓ ¾ƒF¾…KÜ…\"áˆ ºŽeÕ‹8×‹5åŠ æŠ ã(Ø•Kñ’ ò’ ò’!á–@ò”\"ò”#ò•&ð–*ò›%ó›3ÝžXó&óž8ðŸ?ò¡1ó£4ò¤/ó£7Ò©jÏ©‚Ó©}È«‹Ë«ó©3Ú­]ó¨HÉ®–ó«Dó«Nó­@ó¬OÕ±{õ¬Tó¯Bô®Mê¯kõ®YÎ´—ó±Kô°Uó°Yô°Wô°XÑµÛµsÎ¶ó¶>ó³]ô´Wó¶Tó·SëºTó¸Vì·xô·bó¼CóºXÑ½«ô½]è½Œó¼|óÁVäÁƒóÃYôÃfÜÆ§íÇ}åÇ—ôÈlôÉnôÆŽíÊ‰ÜÌ¾ôÌŠôÌ‹éÎ¢õÐ„ñÒ¯õÖ™òÕµõÙ£õÚ¥ïÛ¸ëÜÆöÜ«èÝÔìßÎïßÏóà½ñçÜòèÞòéß÷ìßùðçûù÷ýüûþýüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0¼€.8:†‡†9,‚Y`dbaZ)hi[`cq;`?7^¥fq5^S=/¥¥F2\\²N%\"²²WQR\\@+UPBADHJTUU<I(U6!lkÓ1MCOO-ppÓâ >G\'Ó\rãîÓ4îVEãLqp\nã_âÄ!1n‰À0ºÌˆpF \n ^‘à@›8oh(ƒ€;yjâ¸	ˆþ¸›`b\0wŒ>~\0;',NULL,NULL,NULL,NULL),(20,'sys','mobileSplash_large.png','image/png',46151,'2013-12-14 18:15:36',1207,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0@\0\0@\0\0\0®nð\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0³éIDATxÚìÝ]l\\g~Øá3$‡Eï¬>¸bcQI[Ù&7ÑÊ ±®Ý&©¬\"q³6x¯\n«@rUH2\\8vïäÙ@?Ü¢RÑ¢ph·E”E±²šmáJ©H¤U×äÊÛHn8t\"™”´c“9\"§3¢+Ë%ñc>þä<Äh<çœáË¹8øù¼ïIåßÞš\0\0\0\0@TM†\0\0\0\0€È,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ð,\0\0\0\0Bk1\0\0uÔÜÝ_úÙ”ÉÎås¥\'ÅéüÜØa\0¸›€\0Pk©¶LËö}éÞ—æëÕ=ŠÓùÙÑÁÂð÷n]:i¬\0\0Ê§Où··\Z\0€šiÛs0ýíWRm™G¾s.Ÿ›þà\r\0@À\0¨‘¦Î¾öç—~.i«[—NÞ<õjq:o\0€Æ=2\0\05Ð²}ßúß]j½ZÉ†\0\0k†€\0PuÍÝýí/¼³˜iƒŸ±uö­ñÝeo\0°Ú	X\0\0U>ßÊdÛ_xg…;IµeÖ¿ø®Á\0\Zô„Ê\0\0TÕº½‡+rñTSgßìÓŒ\'\0Ð€,\0€*J÷4w÷Wjož=ø—SÝF\0h4-†\0\0XKš»û[²ýM½w_ôTœÎÏ\rßÊ\rÎŽÖøó´î®ð5S_öà…ÿrhgOÊß\Z\0h\0°4e²éo¿’îxàd½íûZw(Nço]:9sö­¹|®Ÿª¹»¿ôÁ*»Ïì®}çÞËä®–ÝèÏ\04\n\0XÝRm™ÖÝZwí_ä›Ó½¥Gaøx\r2VËöç+¾ÏôúÌ–\'ú‡ÿ÷É®L*Ýìï\04k`\0«Xswÿú—°Èzu·tï@iÃ–íûªúñZ²ýÕØí–\'û³Éð\'E_\0\0 AX\0ÀjUŽP/¾»ì9z©¶Lûï´í9XÅ3­Î¾jìvCOy·WòIaÖ·\0\0h\0°*¥{Öí=¼òý´î>P‘ýÜï«qUHa¶Ü°\0\0\Z€\0¬>ÍÝý¬Nó«bUþ4«:—_%·§Î?¹ò³€† `\0«ÌüÔ¿ÊîsÝÞÃïMÅÏªµBüÄø{¾6áë\0\04\0XeÖí=\\ÙyíÏWx\"aõnq81öÅž­\04\0XMš»û«tëÀ¦Î¾|ÏK•Ýgqº*‹T¦¾Ü­‹°\0€F `\0«Ië®Wª·ó\rÏ¼0RÉU¥fG«ñ9¯^ôM\0\0\ZŠ€\0¬\Z©¶L•.¿š×±9ûùc}Ul‡·.½_Ï9zî¤/\0ÐP,\0`Õ¨j½š·í™¡OŠù©ÊìíÖ¥Ê—¦«ï,â^²©Ã÷\0Xû,\0`ÕhÙþ|µ±åÉþÒÏá¿®ÌDÂât¾0|¼²ŸðãÓ_î0ÝìK\04\0X=\'.™lµ±¡§¯ôsüóŠ-Ž>ýÁ\\ÊýêÅÁËw,—_\0rh\0€UsâÒÙWƒ£tl.g²ËŸVì\"¬éÞ¨È®\n“ùsï½~÷+]_OùV\0\0\rqh\0\0îÖÑYXWòIa¶2;,Ÿúi&ž{ïõ#Cw¿Ò•ñç\0\Z‚€\0°°JÍ\",ùì‡¯Þ=õoÎ;tÏ²­\04\n\0`a•ºaI{krõÄ¡N]Æ¶…Éüýõ*Ýœô>nþ \0Ð(,\0€¯¸þÿ§é]›(Vp·;ºR?ûÏ¯ÿèÍ—\'Æs‹ßêêÅÁ¾þ[÷_½UÚ›Ë¯\0€Æ!`\0«Æìè`\rŽR˜ÌWc·éæäWÿvêúÿü“ßöì±CÌXW/þèÍ—^ÙÉÖN_\0 ´\0`µ˜Ëçš»«{ˆ««ØÈ2íåyFŠ—O/=6ôômy²¿ôsþ¾‡ónŒ•¥ñ Â•Ý˜ìì1y\0h,\0°jÜºô~ºw ª‡=²ªûÏnL2ëRg.³_´ª¥n®^\0\rÈB\0`Õ˜,Nç«zˆÑs\'«ý[dÚ“gw¤6?¶´­Ê3·¦Ô+\0 1	X\0ÀªQœÎßºTÅÀô‰{•ÕÞšìÙžêÿæ¢2Vº¹¼dû¯=•êÊø\n\0\0\rÊB\0`5™9ûVõf~xâÈÝÿÜÔQÝË6u”3V~*¹’/ßñ°ô¤0ûåÍ´\'™uI××u+\0\0\0XUæò¹™³oµî>Pñ=ž?yÏ\nî™öZüFåPU>¹\0\0d\n!\0°ÊÌœ?:76TÙ}&ógŽºçÅM\0 \0XeŠÓù©÷_­ìjî?þ—¿[˜üÊ³Ë‹O\0€\0¬>scC“ßÿî=ÉiÙÎ;tÏäÁ’ì&sú\0\0¢°\0°*Í\r}ôï^~âŸþQzýò9ŸŸ98zþÞ;n~líÏlÊd[¶ïkÙþ|ª-ÓÔÙWzevtp.Ÿ›=sëÒÉÊ^à\0°B©üÛ[\0°\ZMÍ$gF¿¶ç÷þÍ–\'û—±ù‘¡3Ç•~Þózº9yvGª½uÍŽ[Sgßº¿ÿZs÷­8/üäØÌù£2\0„€\0¬b¹ëÉ…‘â¶g¾õƒ›³‹Üª0™ÿé‰#:ºàÝÙ“Ên\\³#Ö¶çà\"ïáX^kì¿7;:èk\0Ô€\0¬nCŸ?+?ÙöÌ@÷Óûºwí{È›oŒ}têhîüÉ­Ÿ•ÝXXku¬Öí=œîXÒ&7O½Z>îk\0Ô—€\0¬zFŠ¹ë_þsË“ý÷O*¼zqðúÈÐÃ×}_Ûõªí¹×Zwí_Æ†¹ÿøÝ¯ßp\0PO\0°üüJéQ\\É¶v&}¯ÙzÕ²}_ûï,oÛÂdþô?öW¶|–nöE\0ê£É\0\0kÀŽ®¤ÿ›Ë\\y½´UiÛ5\\¯’Û—_-{ÛôúLçßÝæR±0ë‹\0Ô‡€\0¬›:ÊwÜÑ•Zü…B¥w–Þ_Úª´í\Z–îhÊdW²‡\'þáþ©Tfø“¢¯\0P-†\0\0X3n©r“Ê]O®ü¢xm\"Yð¢¡ÒÛ6u$]_Oue’F˜×²ýù•ìúLv×¾Ë§g7%k;ö\0AÏg\0°öd7–å)ù©äÖ\\29“LÍ”§\n®oMZš’L{ƒðmß·òt?]X?)þúS)_0\0 Öç3†\0\0XÃæ[U#_4ÔÔÙW‘ýtl.OBœšI®ä“®Œo\0PÛS\ZC\0\0°†¥Ú*S›6ô|Â®üÂJX\0@­	X\0\0,Áø„1\0\0jMÀ\0àÑ\n“ùù\'S3\0¨5\0`-›ªÈ~®|¹Ÿk.Â\0jKÀ\0XËŠÓù¹|nåû¹12d0€z°\0\0Ö¸[—N®|\'—O¿ó¼Å)$\0P[Î>\0\0Ö¸ÂOŽ­p7F†î¾+ÓnP€š°\0\0Ö¸¹|®0||%{8÷Þëwž«W\0@í	X\0\0kß\'ÿõ‰ñe®„uùôñ«ïüsS‡á\0jMÀ\0Xû6¥óño·0™_ê†7F†î¾üª$»1e<€\Z°\0\0\ZBÇçÃúæËKjXW/Þ³ÉæÇL!\0ê@À\0h;º’¹±¡ðìèùGß”°0™ÿðÄ‘Ý¼vf]~\0ÔA*ÿöV£\0\0ÐòSÉ™KÅÂl²åÉþ­Ïl{fàþ÷LŒç>>}üòŸ¿Í¬=©ìF£\0Ô€\0Ð@r×“#Å;ÿÜòdÇælGg6¹=apf2cdhÁ\r³ËË\0\0uÑb\0\0\ZGvc²¾5õç—¯ÃJnG«Ålµ£+µ£Ëà\0u#`\05ÕÜÝ_>É–§ó³Ÿ•~Î\r™šÙÔ‘<»#u!WÿüÑonoM¾Ý“*m\0PG\0PuM™lËö}éÞ—š:û|C¹dÞºô~aø¸áªöÖdÏöÔµ‰$w­˜»¾ð{6?–to´è\0‚5°\0€*jÊd[wH÷,òýÅéüä_ûŸÇ6¥óF¯f®M$“3ÉÔLùyº9É´\'_[W~\0„€\0TKÛžƒ­»,cÃ‰ñÜ_ü‡CM=¸£+ÕÞj \0\Z€\0Tá£-³þÅw4ap‘>:uôÜ{¯g7&2\0@ƒ³\0PaM}í/¼Ó”É®p?OìÝŸ^Ÿ9{ìÐ•|±÷q‹1\04ð¦!\0\0*(Õ–©H½š·í™Ý¯¼Y˜M.ŒKÃ\0Ð˜,\0 ’Ê3+T¯æm{fà—¿s°ô$w=Ñ°\0\0\Z“€\0TLÛžƒ+\\÷jAßúíƒzÊ»Õ°\0\0\Z“€\0Tè¬\"“]Þ=cÏ+oÎ?É]/?\0\0h¬SMC\0\0TDõêUÉ†ž¾mÏÌ?þ¤85c¼\0\Zˆ€\0Tâ”\"“M÷TõOìÝ?ÿ¤0›}b\"!\0@#m\Z\0`åª]¯’ÛaÍ¯„Ur%Ÿ\\›0ê\0\0BÀ\0* eûó58Jöé}wžç®¹\0 QX\0ÀJ¥Ú2Õ¸ùàý¾ñDÿç¹ëå¹„\0\04\0XñùDMêUÉÆž¯È,B\0€F9á4\0À\n5£F+½>s÷?Ç?7‹\0 !X\0ÀJ¥Ú25;Ö†».Âúì¦±\0h\0°š´ÞuV~Êx\0\04\0XMf&ówž[Ä\0 AX\0ÀJ§ó5;Ö‘!\0Ðh,\0`¥f?­QT*Læ6\0@°\0€•š«QÀºþÕË¯ÒÍÆ\0 !X\0ÀJ§óµiX£çOÞýÏL»±\0h\0P…áïÕà(£ç¾°ÚÓ\0 !X\0@Üºt²Ú‡¸zqpb<w÷+›Ky\0€F `\00—Ï†WõŸ¾wÿ]\0Ð,\0 2fÎ¾U½_½8xù««+cw\0€F!`\0•1—ÏU¯a{ïõ{^Ùö\ró\0\Z…€\0TÌô™#Õ¸á¹÷^¿1ò•Ýn~,ÙÔa¼\0\Z…€\0TÒä÷¿[Ù†uùôñN½çÅÞ_rù\0@°\0€J*Nç+Ø°.Ÿ>~öØ¡{^ÜÑ•Ê´i\0€\"`\06ß°fGW¸ŸO¹¿^ue’]Æ\0 ±X\0@åÍ7¬™³o•ž,có‰ñÜÞ|ù§|äž×3íÉÎ“\0\ZN*ÿöV£\0\0TIS&Ûºû@ºw`‘ï/Læ?úoGïOWÉík¯vö¤ÒÍ\0 áX\0@Õ]½™™ÚöÒ–_Ù·åÉþßP˜ÌçÎŸüôâàåÓÇ|ÃŽ®”™ƒ\0\0\rKÀ\0jaj&ú¤x%Ÿlèék]ŸéØœíèÌ^ÿ«¡ÂT~b,71ž{Ð†›+ßsÐªí\0\0¬Å\0\05ÐÞšüêÖÔµ‰$wm(7²¨M6?V¾ðjS‡Á\0ht\0P;›:JTïãÉ•|ríóâT!ÿü+oÈ´\'™u¥Ÿ©®L¹y\0@\"`\0µ—nN²K÷\0`Qš\0\0\0\0‘	X\0\0\0\0„&`\0\0\0š€\0\0\0@h\0\0\0\0¡	X\0\0\0\0„&`\0\0\0Z‹!\0\0Xóš:ûRm™æo”ÞyqöÓ¡ât~vtÐø\0\0Á	X\0\0kSSg_ú›ûš»÷4w÷?üscC³ŸÝºôþ­K\'\0P*ÿöV£\0\0°vNïÚ2-Û÷µîz¥©³o©Û§ó·.œ9ûÖ\\>g$€@g8\0ÀšÑ¶ç`úÛ¯Ü=Opy\nÃÇe,\0 \0ˆ¢©³¯%ÛßÔÙÛ”ÉÎ¯Ù4ÿzq:?764—ÏÍŽž™TUÔÜÝ¿nïáÒÐUpŸ3gßš>sÄØ\0u\'`\0uÖ”É¦{Zžzi‘ñenl¨0ü½ÂðñâtÞèÍk{îµÖ]û«±çÒhO½ÿjé§A\0êHÀ\0êw\"Ò–i{îµtïÀ2¶-Nç?96sþhƒg¬Ò®ñÝe,wµ¤¡¾yêUë»\0õ<ç°\0€ºhÝµ¿u÷®Ö4—ÏÝ<õêìè`cŽaSg_ûó‡«Z¯î(saø¸ï-\0P\0Póó¶Ìº½‡[¶ï«ÔgÎþàFÆ¦LvýË?Xùzí‹§a\0u;ó1\0@-ÍOy«`½Jn_ÌÕþÂ;µL9†±ö¿re³#\0Àâ	X\0@íToÁ¦rXùÇïŽN6JÃjáÚÌ¼GùF‡õ8.\0Ðà,\0 Fª½Üøc÷}í>s©X˜]ã#Ù¶ç`sw½þˆ…gç®û:\05%`\05Rƒ‹wºwíû¥ß8øßVÌO­Ý³·L¶u÷:~€\r=}sOÐ°\0€šž\0 Zwí¯ÍòIßúíƒÿNÿ™KÅµZXÖí=\\÷ÏP\Zä¿œìÖ°\0€š°\0€ªKµejyÑÐÓ¿ó‡…ÙäÂHñJ~­dsw½&Þã[ß9X\Za\r\0¨\r\0¨ºÖÝjy¿¼\r=}Ûž(=¹0²Öæ¶í9ä“”F¸csvø“µ<[\0ˆCÀ\0ª«|ùÕ®ý5>è·¾s°ô³0›üùÿ];kº7uö¹üêÎ —¯tË­ýUó€úŸ\0 ªj_¯J:6g»w•—ÜššI~~¥¸VFò•PŸ\'{{„óSkg„€°,\0 ºZžz©.ÇÝö÷æŸ|<–\\›X#Y“Uð/½>3_	K#l\"!\0PU\0PÍSÎ¾¦L¶.‡žo+óÖÀ%BÍÝýµ\\Gl±ƒüôƒ<ü×.Â\0ªyVi\0€êiÉÖsÍ¦-O~qôñÏWýEXõÉFa\0 2\0¨æ©Fgo~\'¯”ä®dÅulÎ¦×gÖÆ\0¡Ï…\0PÅS:Íœ·~ó—GÏ]OVõÍòš:ûb~°=}kc„€ÐçB†\0\0¨â©F]³KÇæ¯ä³U=Ç­¾)p‘ƒ|%ï+\0Tç\\È\0\0ÕjÝñ+¿0Ç­ò::³F\0¨6\0hù›«öŒ-êüÁ{¸\0¨Öé!\0\0\ZD~jµ~òP²=œ{\0ÕÐb\0€ê)NçCÅ—Âl’n^éNJ¿Ñ=—D?ËÍåsUÆÕòÏO%›:|ñ€\n°\0€*šjîî¯×Ñ\'ÆïJŸÝ\\f^iêìKs_s÷ž‡ü:³£ƒ³ŸÍŽž¹uédÅ‡qµüÅÝˆ\0¨\0¨¢¹|®¹»nGŸ_éUQM™lºw å©—sÀæîþrÞÚµ¿8¿uéäÌÙ·ªzYVc_ùóSÅ$Iùæ\0•%`\0U476\\Ç£_½8¸ìmSm™¶ç^K÷,oÛÒ†¥ÇìèàÍS¯V$c•v²˜ˆV{÷\\ævkÎ·\0¨<‹¸\0Ut+7XÇ£/;`µîÚßñO>X^½º[swi?m{®üw	;‹ðúÈï9\0Pm\0PEscCõšF7z~…¨¹\0Vª-³þÅwÛž{­‚kÏ·î>ÐñÝÜ³îûÒGr8àßwb<W˜Ìûž\0Õ&`\0Õuëgß«Ëq/ÿÙñ{^yäý›:ûÖ¿üƒj¬:_Þó‹ï®dÏ…¿<ð»’Iš\0\0K8›2\0@U†×þ ã¹û¯ÀÊ´?ô¬èvcªÞ:Só×v-{ZâÜØPq:ÜµN£çNú†\05 `\0Õ5—ÏÕ¾a}øÇGîqSÇïŽ7_¯*8mðAÖí=Ü²}ßò¶½u)V-*Læï¯„d\0€e°\0€ª›þàZ^=41ž»|zd¶ù±…ßŸjË´¿ðN\rêÕ¼u{/o=¬™óÇBýYs­2öÈyš\0\0Ë `\0UWœÎÏœ}«f‡;{ìÐý/¶·>p÷öÞ©ÞÌÁû¥Ú2éß|çêÍ%÷²¹±¡ÙÑ@kN-x™ÛÃçi\0,€\0ÔÂÌù£µ™÷á‰#®,žÝ¸ðÔ¶Ö]û«±jûÃµnÈÎ>}àçW–¼áô™·‚üA/Ÿ>>1¾Àý%yŸG\0€e°\0€\Z¹yêÕ¹±¡ªbôüÉŸ.tYPRX¼˜jË´î>P—Ñxbïþ_lØsa¤¸¤­fGƒ\\„µàåWš¤	\0°B\0P#Åéüä÷¿ûù\'ÕjX7F†Î,4y0¹]¯Ú[x½í¹×j¶ôÕý¾õÛs×“¥^‡uóÔ«uÿS~xâÈ‚—_ue¬à\0T…€\0ÔNq:å?}÷ÆHåÖÕ‹ƒúæË…É–ŠO7\'½/Vš2Ùtï@GcË“ý¥ÇÏ¯s×—°Õ\\>7ýÁuüØ¥?ßƒ.sëÊøŽ\0U!`\05µe]þ\'ÿêåÑó•\\ë£SGô€zU²£+µà­ñê[¯æ=±wéçð\'Å©™%l5sþèg?;Y—\\\Zä]æÖ•Yø27\0€•°\0€ZëÝüÙ™ý»çÞ{ýAÉiñJ{øñ¿(ïêAoèÊ$[;þO-O½T÷¡èÞµ¯cs¶0›\\È-m1¬«\'^­Æ…ltæØ¡wÛ7Ì\0ªEÀ\0j­½5Ù³=õÑ©£?|ý·.Ÿ>¾¼&óž8râž}ÈÅ\\™ödgÏÂU¥¹»¿)“0\ZÝOï+ýÿ<YÒDÂ-ëòƒo½\\ã†uöØ¡öæÇÜ\0¨¢æ?øÍ\rF\0¨±¶tÒÞšÊýM~ôüÉo7¬u_ÿFëúE-¡41žûðÄ‘3ÿþÐßüôÌ¦ô¶L{9“-8y°¤u×+ÍëéC1wkú¯þ×‰Ò“üÍ$»1Õ¼èÿ½ØÖ43øþ‰_úåP\Zº\Z|Î³Ç=¤6~»\'eþ \0P=©üÛ[\0P¹ëÉ…‘/§Îmèé›_×<Ýž)ý¼ûW/NŒçnŒž;¹àýïîñðzU²þÅw›»û#Ba2ÿý;çŸïìIe7.aÛ3—Šù¹Ìoú£ÒÐUõžyðµWÉí›<>èJ7\0€Š°\0€zÊO•+La¶’ûìÊ”{ÊCêUÉ×þÙå8ƒðÃ×k~2`{kòëO-¡MÍ$?þyyôžþ?œ_¾âJì!ë^%·oòøkO=b´\0VÈ\ZX\0@=eÚËù£+S™½¥›“¾ÇS¿ºõ=%ÈêWwÜ™;95“\\›XÂ†í­_\\útî½×ôæË‹¹6mI><qäN\\{GŽ6\0ÀÊ	X\0@¥›Ë¤ôXá\"JÙÉ³;RºçàÝR_‹°îž\0ø7¿XÚíïÜfñêÅÁ?ùýg+roÇ’Ë§—ööÓ?>òð·íìIY»\0¨C\0\0DÐ•)=R¹ëÉèõâøçKÛ6»1ÙÑµŠ¿{õú+ù¤ïñ¥mÞ÷xêÖlqþ&†:Zzl{fà‰½û—±0Va2ùôñÒs1WiØ—´b\0À²	X\0@ ·›Hjj¦Üq®ä‹ù©äAËcµ·&›;’M•§®¥)l¥ß½ôXjŒ»=‘ð‹†•Ü¾~ªôèØœí~z_÷®}{úÒ½Ãã‘¡«K‡¬Ô~ÿ_ÊÂí\0@ÍX\0@8í­åiq[;Ë}¤0›|vóÞ7¬íikS…dW“íìIµ4?ûò•‰ñÜüY¥ç›³ÙùŸóÿuf2?¿¸ÕÕ‹ƒK=ÖŽ®ÔŽ.ßS\0 v,\0 ´tsÒh«,¾Ì_¹ïñT¦=þd»:NŒç*²Ä{éÏ±³§b‹îÀÿcïþ‚£:òßŸªR	É\Z©%¢¥¢M‰Kˆæ¯™Eö5`{ðvcâÆ.Dì„Ã÷a#ìGÇ}Ø™Ž}Ü¹OÓ÷>L8âîCwÄÌÛ±wÃìì†›îÀc0öÚR4 þ!a\ZcJjBÕ¨…„JUu¥©¤ô©*Oé”ôýDQ’Å©s2ó9üò—À\"À\0\0XfÃÿÒmëP«œue¾ë÷–\\Gl1Öý™³cc×\Z\0\0…‹\0\0\0XuÑßyê|âcÏíøx,å8Ù——*-vöoN—ÃŸ3+ëcnÙà£d;\0\0X.°\0\0Àj”||Ï_±Ñ#\'“Q…j2iá˜«Ò»:F‡¾‡©±‰ìCè\n\0\0x,\0\0°\Z%¢¿óW÷Â™¨Jên¦ká§·tücJþ\\|B–üÝ\rÎÆµ¾ÕV€\0\0x,\0\0°\Z%¢‚¯x\"€5{ÀÒ åØP‘ÎÆ’7FÇcé%ŠcqçÉ„cff•;/§?º¢4´ª(eŒ\0\0\0!€\0\0V£É;ÿì8ÿ·ÎdŽ\0V±Ï¥ÏZ[¦ö7ô1\0\0\0@añÓ\0\0`J=}<ÃZf£C÷¢×2O# \0\0\0žC\0\0\0¬Rñ›ÿ}ÙÏ!Ò~jö7Y¾\0\0\0\0\0X¥&ïüsòñ½e<ø“Ç=gÿaö÷ËKè\0\0€çÀ\0\0«×Ó¯ÿ¯eüô[çþ!þäqÆ7+JYB\0\0‰\0\0\0X½&ïüs\"ú»eùèÑ¡{s¦_©í\0\0`\"€\0\0Vµñ³zú8ÿŸ{ñÿÃìô+±±Š>\0\0ÈD\0\0\0¬jÉÇ÷ÆÏþuž?´ë×?Ø3Gæ×º?sJ‹é\0\0€L°\0\0Àj7yçŸ\'®ýCÞ>®¯ýÔOÿ~Îÿªbý \0\0À`\0\0¤«¹ÇožÊÃÅ¾ï¾úßþvÎÿTQÊúA\0\0€¹À\0\0H?û×c7Üa\röüî‹ÿçßÍYúJ4Õ‘~\0\007X\0\0\0ÓÆÎþõSëÒÁûÚOŸ?z®vÖ–Ñ\0\0\0s#€\0\00-pJzþñ³¿ýÉèÐ=‹‡?yüÍÿûáÅüóý@i±³eéW\0\0\0óò=þ8L+\0\0\0hÝý©è“ŠÆ·þýÖ7ÿ}ð¥ŠÖ×~êêûÛù¯œ©¨ÙþÍ¾ŠR\Z\0\0`^°\0\0\02]ÿ>uoØ)[·±ùØÿ¹qç_fÆêk?Õõéß¿0™kOØ·¡‚&\0\0X,\0\0€9¨–¾T±qç_†výehç_.æ/Æ¾ïîk?½úÏ‹Y‡¸ãG>v\0\0x!X\0\0\0sÓ1,­¦ñ/*ÔTüRÅú­a~?ö}w|ìñ`Ïï†åÍü«MÁ@:÷ŠÂí\0\0\0‹A\0\0\0`^‘‡é’XÖ[QêìØHÝ+\0\0€Å*¢	\0\0\0æ®vÖ–ùn¤†þdí˜[6ø¶l i\0\0–€\0\0\0ÀB*JÓ»ÞvnßOMät¨\rNS¯´˜F\0\0X\ZX\0\0\0/¶±J^é0VäaêñØÒþn0]mÙ@è\n\0\0 K°\0\0\0K…±Æ&œû¡?¥:ñÄ¼?\\QêT”8~àÛPAË\0\0ä„\0\0\0ÀÒ”§kc…«}ò>žpFÆ§¿ÿdÂyéYŽÛ\0\0XD\0\0\0 {ÁÀL¬Š \0\0€Kü4\0\0\0\0\0\0¼Œ\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<­ˆ&\0\0¸gÌW6æ”Íþ~Ð‰—§†i ŸF|Uq¹ù¦”:£¥©QÚ\0\0\nX\0€\\©(Õ#Í¤SüØW)ßyä«Yü_¯HÅŠœ	™KËŒ:ý>5±65H«Vú7Þ÷…F|UêÞœ}÷ÉíJöP\0\0G\0\0°d“Nñ#Ì‡ùjÌœŽìLÏ«}™ój™QËÔZ½¡Í¥Šúë{ýÛÇ|eß}òŠø·Ê½Ö¸Aì\0\0x–ïñÇaZ\0°#¾ªûþÐ oãœ©î)MÊ¼Z^’Ñ\"g‚Ž\06æ+»\Zx=‹ûTn±–Äî2\0\0àA°\0\0/ðÈWõ×ËŸ§rhëë6ËŸÅkJ*×Õ-ü“c±‡ò&6Ô:¾È	vMê‘,`>#¾ª‹E‡3ò\"ËÊ«*«k3nI¹ïûïdÜzA\'þêä¤=\0\0¯!€\0˜Û˜¯,ê¯úêŽ[­¯Û<51®š!×‹K²þÄØÐÀèÈðÈ¼:ö0ý~¾Ÿ”9vMò^8y‹i6`š½\n7îÙ²£UîÐùþJ4Ò}ûzÛƒþ;æýE\0\0x\r,\0@¦G¾š»þÆûþÐœÿ5¸¦¤¦nóú©×³âÜÅ\'ÆûïÈ¼º¿¯{¾`–ª?-/z\ró•µ½££WeåUûW‘/t_:ÿ‰ÎÆ\n:ñ7â¿&Ï\0\0x,\0€1‰õ×ßõ7ÎY:G&ÃuõM2…›òb£#Ãý‘îHÏeµä0Cij´!yƒ0V¹‹E‡õ •Õµ}¸¤ŒÈØÐÀ¥óŸè[lC2º+ñ5­\n\0\0<‚\0\0 mÐ¿ñ¦×ìÕ‚Á5%¡ps¸q÷\"ó8Ü6:2|·çJ¤çòìœ¬ÒÔè+É«5É{ô&Vç-|%ðš¾múÞÏ²XÏ\ZøòÓ_è<¬W\'¿`_B\0\0à°\0`µ{ä«é\rl×‰Zeuí––ÖP}s.e­Ü3»p\"óíWW)ßƒÕ¦½è;yðØYGœåÎj?sR½¯HÅLž¡m\0€Ñ\0°jM:Å7»¢þúŒïËÔ·yï›I¹šO(Ü$¯ýwº:Î™a¬G¾š¶¢#áä­†Ä\r*ø`•ñUéè•ªO—Ë%]ÝSrL92á`\0\0à°\0`•\Zôoìì7w+s\n$t•qÂmžÆŠø·Fýõ-‰¬(Äj`†¡·ìhÍñhr}7É‘·%`\0€åG\0\0VI§¸3°?c“ÁÊêÚŽPèÊ¤ÃX×ÚOëÔq\'x%ðÚ_´%qT,¬lz	ðTÑº\\·Y#ÈqT%¬û¾Ð6ç\n-\0\0–Ÿ&\0€Õ6Ñý*ø®½’™êÎÖ£oÿ¨@£Wšœ¿\\…\\‹\\‘þ¦\\i[Ñ‘_]•jÒ)ÖëCáf+ÇÔÇó•Éñid\0\0°ìÈÀ€U¤7°½×¿ý¹ij}Ó¾C\'¼Y¦=;[ZZëÂMß¶ŸŽöuëx[Ñ‘WW7%{XytôÊ™J¥´rÌôqzfŽÏ^„\0\0`ÙÀ€Uaö²Áàš’}‡Nä¾ÚÈƒÊÊ«y?ÒsùZûiµJÜì’yxKâƒ+Ì˜¯L¿¯\\g)€egÄWE\0\0\0,;X\0°òM:Å‹›i\Zëë6ï;t¼¬|%/¬7î‘Ëlÿì¤®Šõ×ËTüÕÉ/(‰…•Ä`Ù\\SªßÇ}A\Z\0\0,;j`À\n7â«ú*ø®½Ú²£õà±VvôJ‘k|ûøGáÆ=ú;Ò‹SÓ+•­Jv¶2¹\0\0\0l!€\0+Ùˆ¯êbÑá¸3“@±ïÐñŽ®ªFK–—þ’\0\0\0Pp`ÀŠ•½\n®)yûÄséH«‡\\õ¾CÇõî„Ä°\0\0\0€ÂB\0\0V¦ÙÑ«ƒÇ>\\ÍË‚Â{¤ˆa\0\0\0…ˆ\0\0¬@Ñ«ÊêÚ·DQiŒÖÍÀ.F\0\0\0à}°\0`¥™tŠ;ûÍèÕÁc®†’í‹Q¹®¶õÈûúË¨¿¾7°f\0\0\0<Ž\0\0¬4‹ë=ƒkJö:,.¡Y´õu›Íšî½þí|54\0\0\0àe°\0`Eéì7£W«¼îÕ|Â{¶ìhÕ_^-zbX\0\0\0€—Ñ\0°bDýõòÒ_¶y¹¢W£#ÃOF†cCñ§ã±¡þ‰§ã?PY][\\\\úƒêÚ²òªe9ÉŽÆ<è¿#ïãN°3°Wâk†\0\0\0àM°\0`…ñUuöë/÷:¾¾ns>O >1íëêtÇŒŽ/üÃ*r¤É©ÖÔm®«oÊg0KšèóSÇ§‚k÷ý¡ÁÔÆšä=\0\0\0àA°\0`%P…Ûõ—áÆ=òÊÛ§Gz.Gz®dÄ¤–Dþ®¼º:Î–•W©õ}y¨Û%ŸµïÐ‰ö3\'Õ—Ò€o$‹œ	†\0\0\0à5°\0`%è\rl×¥¯*«kw¶ÍÃ‡Æ\'Æo_o»ÕùM|Ö\nÁÙ‚N¼<•NËZ¸búèÈpWÇYy…÷ÈU¸Æ\n…›BõMÑ¾ngj!a$°µ!qƒá\0\0\0x\r,\0(x|5ÿVýe~¶¼ÝÙÖÕqvÎÐUE*Vž\ZV–:£¥©Ñ90â«\Zó•=öUÊùËû¸4ÿk¤çr4ÒÕ¼÷­--­®^Èì¿£.¤×¿=”ì›ï„\0\0\0,X\0Pð¾ìÖï›÷¾åv©ØÐÀ¥óŸÄd|mj0”ì“?\0*O\rË«Æ™.;5èßxß’?u$+þtüZÛéh_÷¾CÇËÊ«\\º9òÖ–×º:Îª/{ýÛ[T\0\0\0€§À€Â–±x°iï›®~ÜíÎ¶km§ÍïxMò^CòFŽ‰Kr\ZçÞdâj$°õ®¿Q‡±ôßùüÔÇû…›\\º¨-;ZõBÈ¨¿>÷k\0\0\0`—Ÿ&\0€Â5éßõ7ê/÷:áêÇ]:*#zJö½ÿuKâ‚­ˆO‘3Ñ¸!Ç\'oéoÆŸŽ·Ÿ9é¹ìÒu‹K¶¶¼¦¿ŒúëZ\0\0\0€§À€v3°Kg*mÙÑêÞâÁøÄøç§>6CH©Ø«“_´$.¸±mŸs[âŠßŒ‹]:ª»ãœK˜Þ÷pÍtá03&\0\0\0À`@¡\Zó•é\\¡àš’æ½o¹ôAñ‰ñ/?ý…Yô*”ì{uò‹µ©AW/PŽß:ùYE*¦¿ÓÕqövg›Ÿ,.	7î™¾^\'8èßÈ\0\0\0\0¼ƒ\0\0ª^ÿvý~kËk.í<8;zÕ’¸àRâÕlò)&Ï„’}ú;×ÚN»´–P°Ä}_ˆ\0\0\0xEÜ  ™éWeåUîÕnÏØp°%qÁ\'å‡ÚP_ï¥ó§ä’××m¶û)•ëjå°£#ÃÎÔ–ˆNÎ{ŽøªîûC#NUÜÔß¦âåÎðÚä Ûùk=òÕ<ò×Œ9e2êÌïË%T¤b5É{tãÈµLúŠû*\'bµû~3[Ð‰—§†u¯•¦Få%—œŸè-²~6ª±ª†«ôøÂ?¯îDÕ¹¥Îè*ßÀAžZq\'(÷ûÂ·†¦\Z\0ä,\0(Hfú•{Ñ«kí§£}ÝúËe‰^évŒVÛg\'ß>þQYy•ÝO©«oº}=½DQ¦p2‘SÁ‹¥’Y_$°5ê«Ï÷Ló9÷ãOG6%{Â‰[ž†¨1w„Ì BÁ@\\F…\\‹7\'®r’Ò•ò§LÅçî‘ù¥gò*ü¡zÍ˜´W¤bkSé(dvƒIÿJçª?_®šo›TdVzVÞ¬øpŒ¾Aäîxa¸jÎÚlÒzÒn*ROÀ\0`,\0(<“N±.Ò\\Sb®}³(\ZéVÑe£WúÔÕQûNÅ°ì~ÄúºÍú’åƒ²ˆMô¶/ñ1ÉÏôúÓ?¼-qeyv¾iíÕ¢×y!ÿÖ¨¿~S²§!qÃ#7È}hÐ·ñ‘¿f1—°T*»G…´‚N¼&yomjpC2ÊD=Ï],£Tž„Ö»8rø,ªUš\ZU‘Ê•Ô¿nß òð”—ŠÔ;Sñ,Õ†…•­	\0ð X\0Px¢þz=ëØÚòšŸ¿tþýeCò†‚,¯N~ÑVtDåÑÄ\\k?½óÀQ‹Ç7·q\\j¶ŽüüÕÀës¦0”•W½4•,öddX-Qœig\'ØØ/³å–œW,Ú`rV³¿\\SR¹®njxŒ™Kgñ8™K-×<_OËåÏÅöxum°¸táŸ‰\rõÇŸŽÏ{§8Ai®¨#-–ÞÜ`C*Ê,ÝíÁ¹¤.ž¯£gáùîë¨oº7$£5©{7»Ýzs®×^ø¾0©xVÄÙ\ZÄ×&¥\r‰ö\0²C\0\0\nOÄ¿U¿ß²£Õ¸tþ=9‘É†G2kdÎ³;ñM[Ñõåíëm¡p“ÅbXæšÄ%­E\ZñU],:læ2×”„ÂÍáÆÝ³OïAÿh¤;ÒsY·°Z\Zé‘Ö £½R)~s¶slh@®Â¼™¦J;ä?†5æ+K‡ÏLÆ©¬®­\\W7U=­>¸¦ÔV.ÆèÈð“‘a¹äØÃ™ºÏûP‘¬Rÿh(ÕçåÅ¡…h1]¬¬5u›§ÞÔ.¾—¥[ãOÇ¦þì¿3_hæ¾?tß	}Øíå5³szár`uƒÈÝ!\røƒêÚââ’—Ê«¿F[žiÏî‘˜´ž¼™ó‘OÖ†é¼Åpò+p\0Kœ\0\0\nŠLátrP¸q›F#ÝºôUÐ‰{*9H&<\rÉºØµöÓvÊ,n1y¦ÙÑ«æ½omÙÑ:_×¬¯Û,/ù™Kç?Ñíõ×¯M\r.{r‡-3z%­qàÈûóÍc+×Õî<pT.äöõ¶®Ž³ê›yŽa=òÕ¤ÃFÏŠ£ÍîÍP¸y}]}îQÎ²©ù¼yˆ”?3L:ÔâÛ.CTzSÆ*5­sïâÞÀöùÊÒ)uõéèªÚ„!Ë»~*Î¥:·ÉI—\nVJçö÷uÏÎšŒø·ÊkC2º)ÙãñÝ]ÙºAÔ__ÿü7Ó·ÆTößÉNç->{ètR\0 Ÿ`@¹ï›YýnÜíÆG|ÛvZ¿oI\\ðZ\"ICâÆ o£Z¬{8ÐÝqÎbû.(›=?¼xMOƒkJûp1yÁâ’GÞ¿tþT¤ç²úÎwÝË^4º3°__‹LnåZ^!•ö—9pÛg\'Õ4Uº¦7°}[âŠ«§ªRræ]ÉtZnP}³á]óSÔ¼}td¸*¥.#’¥¦è„±²¶@èJg¸qO]¸ÉúNŠŠW†ÂM;¯ÓÉDþÜ³¯$®z3“è®¿Q\ZpvèJZoKKk~nù g*Ç­¿¯;\ZéÊhÃt¹±@ÜÈò‹¦€6f\0,X\0PHÌòíù ¶È<Mgx¶ì®ÌvôBÂ[ß,îä¶›]:!n‘Ó¾CÇãc*KÕÃzuò‹eŒè`ŠÄ-þZd(ÊÏùé/T+âßªJ›»tD[Í8õ9omymSãn—‚\Z;d–./™¥ß¾Þ&³t3ß$]uÈ¿Ñ;îÂ|ÑÉeébÝ¿ò`¼ÝÙf®™Uw<‹BÉ¾WW½ëñUÉÃ$£$ŸZ×Ü´÷Í<ß ÎTŽ›¼ä£¥\rïö\\1Ë¨î¾XtXò`\'Ô\0X@à?þëJZ\0\nÅ€ÿey©÷ÍûÞZ·áeëÑþÙ‰OLOÏ^M|tâl‡5Îø¤¯8æ[\'ï“‰Éñ\'\nÕ7Y9²LPåhò¦Ô}áÂ™»~Ø­\'‡­ïüYÌørã÷½×U›ËD.„å,ÏNæÒªêý_¼ýWK­UòRy (ø‡ïoéI©+ƒ¤Í;ŠÞÐa\\bØÙzô/Þú«õu›‹×”.×°”qøçÍcCý22Õ÷“N@-u¬HÅÜèÜGþ™ÈcóÞ·l¶»ãœz£¶Ë[3Þõ7~[t@ÝÝžêbùÜþhë¶]ådþ84 Ÿ“ÎTÀèû@CÀIV¦†–ýñ(\rx¥èµ§¾™è³<^ÙuPnê5ìXÆDµa:-kGkeu<iŸ<Æê÷oöH\0¼‰,\0($ƒ¾™y{]¸ÉúñÍ%û¼üá\r‰z7F9íôŒh‰—9é.ÁÔ‹#w2QÔï›÷¾•Ý	‹K~Üz´ýÌIõeg`ÿ“¿Î{JcêT2™a†²\Z][ZZ£}Ýª¢ó#_ÐâštŠ{ÛÍT\\£iï›áÆ=Þ™jM¥ÈÛ×Ûnu~£³uTšI8yËíÅ•…K•`ËX3èÁ.–“‘—<vº;Îé¦<‹nvÝ÷‡–1HîiÀŒMåTw¶]®ÕùÈF^ò¬èê8§žfîžü†=\0\0³À€BòÈ?=µS;FY?¾Î¹\rIO¯x’éMCâ†ÌvÔ—×ÚN<öAŽÇÔó(Qî¿p²­\'Šj‘Q.s¹õu›Õ§Ëaýó¿rÓ\\®ÕœCM±pãnÝŒƒ¾›R=¶BW¯›K¢Ôj²e\\=º03Œ¥+Ü;S‹+ùjv%¾f©TµýeÆVž;õTèêù¡>ÆºÖ~Z‡)¥sÛ‹ÞiI\\Èÿ-<é_,:lÞ#òkB\ZÐ•æ¶L-=ÞtÛvZ‡¥\r¿\n¾ûêäìQ\0Èà§	\0 PÈÿÖëÙ](Ülýøúïè)Ä†dÔûls\'{9y]\r=k‘ž™Ô˜µÉ¬™2³ár¯\"oÆŒ2’Œò3´tÚ‹®Mžõ¬^¿ÏÈÉåôÚ‹Þ1gær†oÿHšÝ›Ñ+M…±Þ>ñ‘Ù¤r!r9#¾*Ï|Ømn† ¶ìhýé{?ólôÊðç)W!×ÒØžÏÓáÔVtÄ¼G¤åñrôJ…›ä‘6ÛðbÑáŒ•Â\0\0À€‚aþß|]½ëgÂ7›’=Ñ&-‰ú}:bb<ëCÉßFºÔûÒÔè‹þ˜sÅP}®ñD3lôÈW“çè†­ô+}-zRmåÜd*k†6v¶=xìƒü¢ÎZåºZ9a³:•\\N[Ñ‘9·P\\m&â«×Í ­ô¬4×ÎG=Ôä<÷:.ç\\3sÂ½þíýruùiÃ+×ô`9\r9iÀ\ZÒ†rÂÞy_·¡Šr\0\0L°\0 `˜;ÄY©÷”)XJøÆ#ä<7$£Óž§ãmÏ*IeáÒùOô: PêÅÕÇõtQæÛVfÚáÆÝ3}‘Çi›\\ˆþ8+[[SÐ\\Ç¤¿¾3°_)§—ÎÔÈaµæ2R©XfŒC.m•ÏÏÕª73S/Tß”‘°V(äœúÞÏÌ3W±W·cXª\rÍèÕÁcz?smNéT¬ãUV×š÷HFM4\0ÀjF\0\0\nf¦§S~j\\˜ÝE#Ý:|³!- –iI\\Ð[%>è¿c–ñZ¼HÏåh_÷ôÐ‰‡·^øWtzÑK–RdÎ©£ùŒk˜k!ÍU<YÛÙæ,#z%ÓÚ·O|äFè6oääúÞÏ2æç«6†5»fSóÞ·y¿P¯æ\Zù%}`ÞDrunÇ°dé6TÑ«‚¾G¦òï>4ï‘«E¯³Þ\0 À€ÂQ\0ÈúñûŸ…oœ©ý¨eŠœ	s!aWÇÙ¥Ã’Ÿ¿tþ”þRŽ¶˜\r°rO/šMçMÈÁóVÿÅ\\½e%q#6Ô¯ÞäRF-#z%\'&ÓÚÂ\rmhS1ŽCÆàÕÃš½Úwèxîµä¼`ç£r-æ£Û½Ö]£Î_[Ñ+óÑ1,yš\0ÀjF\0\0\nƒÞÐ™Êã°~|½s\\ij´àö~ªIÞ\'gr¦.?u»³m‘·»ãœ½\n%û¹}XE*fýBž«€îåc\\ùjôâ£t\nXÎ¢øÄxìá€zŸõBÔÙÑ«}‡Ž¯€è•žŸ8ò¾Ù×r±«­^µ½R5›\ntÕÛ|7rzÄ>K¨t)†%w®Y*~ç£+ z¥ï‘ƒÇ>Ôuî¤ó\\\0àM°\0 0Œ83k(¬g`Å†fö,¨õƒÚ¶Ä3qìZÛé/?ýe4Ò½À_‘ÿúù©»:ÎêïT¤b¯$®.òu––ŽýåNæŸzÎ6èß˜‡\nÐfîY„+kƒFkdÀ\ZñU}ØXywtFÈ¦3°õ¬“2W½‰ÖçÃy+ÃtÎ ÃºØe½uè–­+¬\rÓqÞwÞ×_öú·ëP;\0`Õ*¢	\0  èùžYÄ–9¼ %qAf8ºâ¯\\”¼dYS·¹r]ù“£#ÃòŸtÌN_øîÉo³xPÿ¼þ¬ØÐ€­Ü™ˆ^k;íL-œ¹ï¹½œS\'þX)ßî<¿5‹±¤öSÓÓr9¥½RäÒbCý*aM­“:0yfÅ?ÊîúÍ°©4B!–l_y&ì<pT\'xÊU—:£\r‰V.ýü‘›×Üãr%5 \\—þ7†^ÿvsµ8\0`\"€\0…AÿãsF,Æ\n½æ+tHn+½:ùÅwÝfQ§øÓñh_w´¯{á¿NÞÚ–¸²¤Ï2—ö÷uÛ\n`Õ…›T\0Ë™*¯r\\`ÉŒZ‡ŠêŒªL¹0×¢fQëJÑk3C½º¶ÕHÁX‘ûðóO>V±ÔÇ¾J½K‡…eÄWe&\"­°•ƒs<X¦®NÇ°zýÛå¹±ÈEÊ3×Øº´ÀV†elhàÓù¹áþ²ò*y½T^YY]çêºÅ¦½oFz.«O—çUCòF.•õ\0\0…Ž\0\0\0sñ²rûëŒÌªÛ‹OAò&™ÿËü°7°}‘›¯¯M\r6$nd‘+$ŸÄU\0H¦X¶êOKÿVV×ªâ}h2Qì^<·ÿ`‹…ýÍ‰nMz×ß¨{-¸¦¤ 7¤[$µNêóO>V_Fü[CÉ¾‚+B·H*½NnÜ³²£Wú2cC·¯OWåëì#9˜ãM=èß¨ã¼ëë6ÛMa“[øvg[_wFÐÊôàùG–œÀ–­.E²äÑª#€òˆXÙ^\0ÀÂ`@!Lü|3µÖ×Ùß°Lg`¹Q˜<ÿÖ¦_übÄWõ×?òÕ˜Õv´ÒÔè†T4Ç`AMòžZ¥R¬­\"li5—mJö¸MÐû—UV×Z	ŒöG²_?˜Q‘zß¡nÄj=(cÔÍÀ.½+òJ¥Íôº|.•Û3þtÌüNpMiÞJžï<pTž±*91î¯½–cG}3¿šímÝ(Ï±îŽsKÝÅ5¶î¹,K-øµ~Û†÷\\k?:îLmm±Í!€\0«,\0(\0fFæ]vnÀ*wVNêGyjx[búrdÚ<æÌ\0¶UçkC*\Zu¦g’·¯·Ùš‡ê›óÀz¾|»Dsê»!¹´Ý\02*R‡ÂMy$±¡tXAæÆƒ³*ñ«ERëëê+«ëÜNkÚûf4Ò¥âÈª¶Qá–¢›\\”^Û«Òë\\ý¸øÄx´¯ëAŸ®26\'•=$½,7«½ÜúÎû¿ùÕß©(Œ4…Ü}Y—·“§™z¶•~u»³­«ã¬:Ã9U¤bEÎÄ¤S<ç?	¨_%¿ýÕÏ›÷¾Õd/¦6ýH7«gKúIî+c!\0¬Z°\0 \0˜ÁëYæ:‘‚.€µ€t=&Çþœ§&y¯Ô?ª’J¢‘®G­Ìå ¡ú&U·KæŠ.MØ¬°ÒihÏ\"’Ñ%-’\ZôoÌgEj™iGz®H—-0]7IUV×JÕ…›ÜK\nÛyàè—ŸþR½ï\rl_yIXfÍ&é_÷ZR­×[d\Z‘Îºtþ”Üt[ZZ]ª(/7õ¾C\'ÚÏœT_~Ø½Ô{dæf±½ò×™ªÒ•ÑbA\'.Ï·µ©ÁŠTlÎ4Õ_•Ú4ã¾/dîØÕq66Ô/k1 ¸¾®^Ÿžü6tãa\0(°\0 \0¸º}ø“‘˜9i¡µ—$”êëõ¥¾MU‹ï²•ÊTnÒ…çÓ¥‹-í\\fŽ(F!óv+SMsý`Mjieªoúg\n{ÿ¸õ¨{¹02\rîî8·@qŸ9Å\\{xúZÛiéß¦½oº|Q•ŒT:ä#_Íˆ¯j%UÂ2¦ë%Y\n»dný¶ýôwl˜ÚíANogëQ7V†ÂM:0w‚Ò&Ù•sÒéWS7osî\'–±l°45Ú¼ñÂøšŒOyÕ8÷¶9WäÕëŸéâhº~Ö/ûÐÖlÞqü5k+óZ\0\0/ä§	\0 €¸‘`NæWjõh÷˜ë€dhí°õÍÁ5Ós?³Þ-wýú}¥ÅzY¯”Ù¯Ýpiñ`lhàËOyéü©ù¢W2o_›\ZT)\'\\ãç§>¾ÝÙæÆnÙ1Ö1wÒ,t“N±9Þ\\*}%wßoõóÙÑ«tµ»d´!y£%qáÕÉ/Ôë•ÄU£™Ûø ÿÎçŸ||­ý´\'™ÎKzv_Kg÷/:WQn–Ü#Dr;èúkêÖ:ù™ü¹¤ì0õ·ÂÉ[3·ÛC¹Ý~Ÿçw\0À\"2°\0 \0,rC½¬\'0ê\réWY	°LÞt)w™ýZ	2¦W\Ze_¬çãÜ÷M\'qÈtÚJÖXlh ëõƒ½þínG7nw¶]k;=Gh#]›\Z”¶s‘¦Ê„J/’2r^âOÇåPÑ¾îÖw,o’šZ¢¨îÇAÿF\'qaeÜ#‘ÀV]ÝL›õüµøÄxÛ™“ž¯b&\ZNÞªIÝ›³gÍcr\rú6Ê-l–vº}½Mh1‡Hß×[[^Ó#ù-Kìeú}Gv—GYK¶£Nnùm‰+r+}Ø­º[Å°Þ>þ¿&\0\0¶\0…¤xý¥Uñ‰éÍ¹H¿Ê2î`$aEz¬íUW?“ˆdÖ«Ê*^3}òáf+Ç”	ÿLƒ¤–PÚL¿r#ºáLÕ÷Éˆ^©}*ß˜üµL¹Ó…Ìæ)1&?¶)Ù³+ñõ[ñz%qÕŒð>è¿#“óØÐ€ÝSÕw‚f¨¢p™éWÁ5%;[Ú~|KG˜Ñ+éÍ–Äé\\é»Å“Ÿ‘Ÿ<0yF†„™|{8ð›_ýõ.6— šƒ‘Ì(Ûª-¬sÔM§Ú-÷‡¡4£¾S¤\rõ~¶SüC\0¬^°\0 T®«³~Ì¶èÂb¬M\rêyr¤ç²­U3¡pÓÌ*B«,syZ¸q·• B4Ò¥§Á5É%À2Ó¯¬o^æÌªN]‘Š©EdKÚæ¯È™Ø”ìy#þëÙ‹¤ì8Ìô½ùöz+,2tuúÕÖ–×ì&4©è•ù“R+à²»‘LžiHÎÔ›‹?w#LiŽssü/†ð²íÕ¸¬œ]’òÔð®É¯gž6=—s_rû ¿Ï<>¿t\0`Õ\"€\0^çjw{“gÍŒk˜¹H¹öÙâ¾¸L¯)³DJ&ÀV<Fûf¶ó[Rú•œ‰«éWÑ+•²¤Ð•I-’ÚøF\'˜Xp˜µÃóvã»ÊŒ–n²-5™Ñ+éé\Zé ì¶öÓ\Z7Ì\"éâKç?±[ËÉêQý¤SœûhÉ]Ü´u(¹ÅÌd®km§¹)ä¼O˜gñqçùåŸ\0€Õ†\0\0xÝ˜“¯\0{“g+”ìÓ3Þ§j]ý^W­ÊÑ £Îˆ1W)æÂÌ°XRò‹YŸ>l;º‘±·Ú+‰«2©Î1º!j’÷2_~ú‹¥nk83„7âüBW”×ÚO›Ñ+é”%¥þ-@­05×Áµ9i·eÌ[{Iù•YG»æ£CØªâ›ÅG¢ù(È%/Éƒþ;f}=~Ý\0ÀjF\0\0V5v‰²¢È™Ð“çÑ‘áh¤ÛÊa+×Õê9¿­,3f´¥¥5÷f”o_|ß˜¯LG¯¬®µ»Ã¦LzÍ½ÕZ6%{l¼<5œÃjÿì¤õ[ÉbFÌryn°íhµÛ¿fªã®É¯í®,ËèâôÇYÝz2ë\'­/,\rQì‹E‡-Æ°ä¦Ë=†%·•YEËâ]\0(D°\0`U‹=ì§¬0WÞu!	+îs¯„5é›1#+1æ¤´&µ„˜AßLHÎJ(m¾IoF2ˆŽ©bÕŸØýˆB/V1Øì®w3û÷•ÄU7–•I›ëàº:ÎÚÊ³s¦¶#Ô·¶Úft‘Ñú•Ê­§Ÿò¹Xt¸7°ÝÖÁ¥kÌÒZKa©\ZgºÙåÚY?\0«,\0\0ìLwõT-Ú×mk®k–\r2#>ÙÑçùEL¹Ð3Ò _ÚúA#ªo¶Øf¬A:%÷½Õæëq3†%ÞÝq.ÇcšÃ¦Ü)ìbÕn6EÚÙj¸—•S“¼§Óñ§ã¹÷¯É½mF—êÀ;ïëý\"âN°×¿ý«¢ws)Î¥9{;^:J^‹IW|ÐçóO>6W‰ºt#\0\n,\0\0ì0\'Ò¶••WUV×êˆ@ŽSÊ»þÆ™ùsØB¬ô®‹º|ûR¢Wc¾2½*TßdqsºÑ‘a½¸L&½»_»×ãå©ám‰+úË®Ž³9t—I»~_è›*˜ñV+ƒM‰OŒßêüFévP£!qÃÜcÔì ™ÛŒfWáÎÖÉT®«=xìC3SnÏÎÀþ¯‚ïÊŸ9.^žÃ’füÍ¯þÎŒBfÜ¿ò_~úKy™? Í6#\0€\"š\0\0\0;3ÒdßwÝªDºÌÁv8jå°áÆ=×žžžèúCY¯†ËˆYZ?8¾YR\"Ì#_~o1ºáL¥ç˜§äö¤WºcÄW¥ËµŸ9ùö‰²ŽÇ™íYè«¥¬/VUžÛò2Ùçvÿ9\rÉýºƒ,k…›U£ZE¸˜2^æõNØ+»V¹®VÆmWÇY³²˜Z¶uêƒøÚä`MêžŒÉ,\Z\\ÚðÀäiCh&=(Ÿ%¯àš’Êuuú\'cCýºs5•{e«B?\0  ‘\0€5:º$Ó0[Ûšñ3…jÉ3c™’•˜ÑèÈ°ÎYêÌÖLÏ±Pézªß¸‘‡Nß–¸¢Lä®µÎî8Ò˜Y·§×˜ÊPØæúP3@Ù¼‘Ÿ›ÚLÂ²X	Ë\\Eh¶ØÌT¦?>°x™Áâ’Žþä½¿™½Þ3îïûCéœ¬¢wåõ]`÷ ãR³A[^I\\ÕKnõsR\r{õš½R;B½\0(°\0\0°ÆÌB2³irQV^¥w\n{ì«ó•ew½%\\pM‰•šSæ2É¥æ…=òOO×í¦çÜ5Ú<?Ñ\r=9×3óHÏå,Š%Í.<_Ð7‚î_çù0MŽbC:~”‡ô«9ÇR¿¥=FEº]d\0ËÌÒ\Z´·žÑ|Úì;tü\'ïýMóÞ·æ¼1åùño½xílðß´½³¤`–<Lž‘ŽËcÍimjPn«W\'¿°»¿$\0  ±„\0\0kdF-ó.5}ÐGæÛV6_«7Eû¦§Íƒ¾›RK®Z=â«Ò‘¯P¸ÙJÍ©¬Ë·Ë™¨…–ŽÕô«ŒSÚŒæ­ßU1,½Ð¬«ãìKå•‹¯\\>{·µ‚`á‹ûšYRùë_K™s°µi¦Ü†•ÕµªNy:ä—XìÉ¨å™é”¥‰q‹õã´²òª¦½oÊKž`ªòWl®l¯Ç¾JyEœ­N \Z&wÚ(pÀ¢ü§–Ä…ÉÄU¹^$jQ³¼‘Vªôq¨x\0˜\0\0¬jÁ5¥4‚]¡dß£Àôìýöõ¶}‡Ž[8f}³NÏ‰ø·f±íš.ÒäXÊˆÉº|{FtÃb\0ËLÏ©IÞ+r&òÝï¾\Z½NSõ×bbXrÎíŸ4w[{%qµÐïÝÅv”ýÏÂ¸¥©Ñ|.+“±¤ÃFÒSÒe¶Ò¥}T×Çà˜¯l1Q›µ©ÁûÎt}±h_—Ý3T®«UµüÔzáý}òçœ‹(U0+êÔ;Ïâø³¤=¥ûj\0–ú\0àm®Ör¶˜%”ìëõoWéNÑH×Î‰£¹§HÈdšºÔzÏ&½•XzA¢ý³,ßîL¥ƒ¹1—+=GS;â™1¬ØÐ@óÞ·æ\0ñ‰ñÛ×Ûnu~c–þÙ–¸Rèk¦Ìþ­q\'@™ÿ\n÷5©{:lô ÿN™¥°‘9þ¥ÝÀ’3¹éìRï»;Î¹\ZÀÒä¹!—¬>K:B•¬\Zœ«j•zFE}õ:˜%7£ôu¬\0\0¹#€\0…dbbÌ½ƒ/µ(/æJõõú¶;S%Šm¥HÔÕ7é\0MÔ_¿-±„Ç £^²g%ý*—òíÎT²†z\\Sb±\0–>¥ _®Ùò+‰«#¾*}·¯·I¯É\0X_·¹¸¸Dþ”¦{22<Õ€}ÑHWÆü¿%q¡Ð:SñýþÕµÖû×YŽ\0¥¹ŠPúÎVØ¨²ºÎ¼/“””	=KS»ä\'†5sÎëjå¥ÖQª`VìáÀ|™YéšY¾­j™¡œvMêžü™çìH\0ÀŠA\0\0\nIÌê¶Só…#•„¥ÞÛJ‘…›‚kJT¼ã¾/´ÍYB…x]¾ÝYÜ¢¶Ê¥|»cdèT®«sãîX›\\®®—™ùÉ3ý:Kºìöõ6y½0*±;ñÍÊ¨Wm>I,(Í§_þ»Xz¶\"S—öÀ^õôç2°œÅ¶Õ¦d\n`©\'L¨¾ÙJX‹<}	z™al¨Î_UrÎ÷PçT$+”ê#\'\0°ô_Ç\0\0Ï“ÉmÖ{Ï½Ì0-nï)Òh|5fFŒLÅU}—â)2©³R	(nÖ«åº¹ŠjÒ)ÖsÝÊêZ+Köt)¢ìj¥ët°JwÒsÊeÏ-‰©Xo`»¾Ò…5$o„·VLZÊ˜3ó°²¸D46Ô¯ï¯ei+y\\¨\'‰Ý¦®ã÷ùWÔãK\Z““éê8«*U-/s™áÂ5³T$+Hoþ°)ÙC½v\0À\"À€PêŒª9á\"M/=`™ÓÎBõ×ßõ7Î›SæsT9™8…“·de}>l¦HDz®X	`mÙÑj®\"\\›XT\0KŸ†c)ý*\ZéÎ¥VºYÁ½¸ØÚ±¡åLÏ™s\0Ô¤îÉ ”žš/ŒU‘ŠÉÏÈð[axm·˜~åXÒnËõÖïmE¥t…»ÒÙ·Æµ$.|Uô®zûz[åºÚ</$\\XFÍ¬þ¾îh¤+#-Kî‹ˆ«¼6$£r¿ä¿®\0 àÀ€LÅ_ú©RÅkJ2¦…>yîì_äTP~øf`—Ì ^I^µ»žEU†RM\Zé¹¼³ÕB)w™£êt¹tQö©’á/t×ß¨ß×Ù(ß~×¨•NÞÊåP$™·Ær82È\0Ø–¸\"/•hÞ_k“ƒ¥ÎèJM<Ñ¡ð—,®4”Ë•a—ŒúgÆÛzK‡­¬®ÍbM¢žWWåñ¥¾¼Ö~º²ºÎ››r¨e†M{ß”FëtËó0#’•NÈò‡ä™Ù¸A\0°\0?M\0\0ÞgNØ¬Ç°Ì:D…Ã\ZñUµ½3;z\\“®Ÿ­^³³Bäª¯^ëì·{2fpÇÜ /º{Ü	ê\n%øÊt\ZZ¨¾)÷Œ~Ñgë+R±,Ö`š[ÔÛ+ÜcN‰½¶OZ)”ì“É¹~eQù¾€¸ñ‰?Ù¿ÂM÷dÄZÔÌC4ïŽÚ”ìÑxãOÇ¿üôf˜Ïƒäù³¥¥õíã½}â£-;Zƒkž»ýå¹}±è°¼–Ô\0€U…,\0(\0é¬™‰Ó°Ý…9æ,bÌ)3—É™öÈäÇ\\®µ¾ns¸q÷œŽ£‘îþ¾n3®õ×O:Å-‰¶Â¡dŸÎ¸}½MmÚ•#9ˆ.õÕ¿pÏ2]JÜ±–~uÅœ?g‰0\ný×”ZdpxG¥EvÎóûå\n`åah-²hš&Ï«1ßa¤V1¬Ö#ï¯·×ì.©\\W»óÀQyÉ¸»ãœÙ¹|5mEGÂÉ[\r‰lV\0È@\0\03ÏÅú¿±?·\rVÁþÓ÷¤SÜØ¯§eåU} ¯pãž9×î…ÂMûÿÉ{cNöîûCó°dö¥wèK\'.Eºs?¦\\—.|.g+W½ðÏëýƒkJBõÍ¹Ÿ€ùeW¾}±—#‹ÃÁƒ,f<Y1ho¼­¯«Ïå!óêäzÍìTë—¶ò=ó@žÏò–uFÐ-âßÚVtdIEÁ\0\0«,\0(\0fV”ý%„Õ3Kç­zîy½íúäËÊ«Þ>ñÑbÒTœkgëÌ^÷ý!9”µé™±Šð®¥Y¥YªÙ,Ð>Ûˆ¯J/æ\n…›s/Â•cùvå…A·™éŠÈ¿<<RãÌ#2bXâÒùSòŠOŒÊ%È³Zý{ƒ™\\,Ï®‹E‡¿ì¦‹\0\Z,\0(\0¥©Ñ 3=-Ï(kaÂ_\\¢§\rš%§ñoÕ_xçý%k¶´´î;t\\Ùëßn«ÊSÃzbíë¶|4Wš+g{ný`½WÊ·»$]®\nßÈ›e\\YæÍÊe³cX‘žËŸòqa¥%®¯Ûü“÷þ&½ß…±ª]ìíEï¸õ\0\nX\0Pô*ÂØP¿õƒëUiš¥KM	™ÿd±0-Ü¸§yï[s0Gf¡(³€TÖÊÊ«trÙ#_Í³u\0KþJ(çX¹—o\nÛ%ù³Ì_S1,½fYÝ°_~úËKçO¹±w­{T•w3V~+µ¡²;\0À!€\0…Â¬rb}BbÎ\n®ìˆœ°>gµËUvÇiÚû¦ÎD[80´$’Q=w«ó+Ç7Î,«ôÍ½á £®f)ý*×òí\0ÜSäL´$.ÈK?p•ŠuêãîŽs´¢pöÊnµœ\0€\0\03áÅúÂ3€5èßXX-c–¬2Wf¡iï›úý]£­Y¥N‹ˆ?·R_Ù,Ç>ß*Âû¾™òXfÙ¬¬™gž{ùv\0³å^ÁMž6&Ï˜&Êc§«ãìo~õw…•µ¥¥õà±ôrÂ¸¼XtØÖ¿+\0\0\n,\0(æ„äAŸÝƒW®«Õó„ÂÊÀ’ùŒ>áõu›sÜ?>½e¡í`æ+El¬\"—„ž%U=öUÎžÔM:Å:°UY]›ûfúïè©¯ÌÙÞ«“ÛI@VVæ–¦F_ü\"#KEÏû«ŸÐ6…SÅÝ?4cXW¯S\0V3X\0PdN¢ë»Qš7žNê™3 âYfž”¹°.k5ÏB`ËIÇéø£	ÊÅ&#©jv²˜¹;¡¥ô«™¸›YgÇƒ˜ß./3hâ’e|@ée¹Þ\'÷éñ_7$odôˆ<‚.?õ?ÿñ?]k?\ZðøUT®«5cXòXîìç.€U‹\0\0v¡ÖÌJ´…÷¶ó}ª2Ã±©©\\WçÆ<Ùútwœ³pÀp“žÔ™«g÷`]ÎåÛã3+Í`\\vr_$µ°Ýˆ`ÅÈCuÿ1gù#ìº^^î&\\«NUäL4$nÌÆŠ?¿}½íóO>þí¯~îñHVFë¾?dk}7\0 àÀ€‚ñü*BËIX¡úf=Cˆú\n#€eÖ)·½rožJöé	d4Òe¥ ²Nšó•™+›2–Uæ>Ó6…“·r<Z¹ãJ€Ãb@Á¥±ú]`÷Å¢ÃíEïœ	þ»sÁ+ï¯^—©ø\n.ëc1ÎþƒêÚe¿3¹ÏâxûãCwƒG*Œõfü¿·$.èÍ@Ì>Ò‘¬KçOE#ÝH•ëjw˜©éÞØN¢%\0¬NE4\0\n3€Õé¶²I—U\n7«P…Š€ä˜h“f Í\0–]›’=½þt½ùøÓñh_Wî\'nÜ­CKÿV™ª÷æ¾„V–UÊüV¿·»~P&Ï¶/•W©p‰§¶*“iv$°õ®¿1cé™|™2úœûNè¦³Kîµ†Ä\rïßqYô¯­C—è÷ÒÅËÒVyHî›`²Hn^yÉã]ä}_(#ršNìí¹¬)¡ú&UR0÷òy¶ÈS~ëEûºÕís3°K?ñ\0\0«X\0P0JS£zz#ÿo}[t3ØaníçM2ûÒ•ž¬Ô)w›ú¹ÝÙ–ûÍì*sïÈˆëÌ‡\ZûfÇÕòíOì8tSx§J‘tÊWÁw{ýÛ_xJ|5‹Ø½2òJÜˆ.UV»²¶w©Ïãî³–¦j†ùò°=‚üÙ–¸òÆä¯w\'¾13CMòûåZÛi–é¹ì…í÷:1“&ì¯gGB\0X…ÈÀ€B\"óÇ]Ïæ]vÓŽÒÿÞ^]›ZÏ\"3j\'a©l&eKK«a7Bæ’Qt“F~Ð\'Ç=E]}“JŠ;ÁAÿÆšä½_•ž×¥7U4òV²c½|»K9&f&—†î]ãÍg·ª&Óo]d->1{~íXÄ¿UÎüÕÉ/VÌ&W:›#y¹Êœ™“àšR[‡Õ±¡<Ô¿7Éã¢Æ¹ç$.È£CÞìœ,çù´,¹ÅÔïˆåÊÌ’1°µåµ®Ž³Ó¿ýõ\r‰ü_\0¬*°\0 Ô¤îÝt¦gÅÖW:S‘ KçO©÷½í2—öf;ÈDK×)—i•Åvp5\"”ê»ïLgEz®äÀ’×ëûdþ)ÓÑçÊ·×{«|ût«¦&Œ\0G_î ˜1ËµÄLû.°ÛÌƒS;È+cÚ/Ííëêî8§GÝc_åÅ¢Ã…ÃªHÅt6¹ÆÜ£¨Ïºx³Šˆ-×*Q}QÎTU&[‡\rõ«7y¨?÷¯•©HÖ6çŠ4l:’å™Wj>GåiÐ3=¤Cáf¹é¬TÙ[Âo¨­·:¿‰?MgG}õ\r,\0X]`@!Q«U‚ZEhkr¨È[O§½œ„õfµcÓÞ7-Y‡¤©Ý˜(–úGUšC¤çòÎÖ£9vŸÌ¢ËžÕ~Šúë_I\\5·eå¼ÿ Ýòí:ºáÆ0—˜É¸Ý¤æÙËAºÀŒ^É¿õ÷çìhù¦\nlÝîl»ÖvZ}Sîî+E¯y6v¼¸ÿ¹œ‰¾ÅöÛŠQVV×ª\0VÜ	ŽøªòîÑ3[WäLøT8&—gÎ¤S|ß\Zôm”Á“‘E%·›<ÃåÉ³˜\'¹4©¼6%{ä€ü5ó¥e9S…ü\"Ï2³¤_Báæºú¦<¤eeÔj\\–a\0\0XFÔÀ€c.ã2ã¶˜ñ ÎÀ~¶€ÊPïí¦_9Æ¢§RgÔ“7Ã@VºoËŽV³¿ìnËèFùv3º1hu‰Yå³êdî½ŒƒÓ¼k¤ûà…aÊ--­oŸøH×÷‘ƒx¿ÝÖ&gb%±!k[ì™a£9S„\\5â«Ò7W¥½-cûõû,b»“N±Œ·³Á#ÊSqv°é±¯2âßz±èðWEï.¾Ñä&­IÞS¥²äÕ’¸ ·ÿ|§{8ÐÕqVÌºÝÙævµ,³V£þE\0\0X%`@y®øõ6ëÇ—)·ž(ÊtÈki5aÓ_þ¸õ¨Åƒ›“m—RÏ¬w_‘feNçr`Ikè¹è†dÔâ¢6Ý¶O¬Îuõ¸U:Ë28¯½nvÁ¾CÇùw+×Õî;tBÙëß^¸5ªÍHGF¯\\Ô,k\0Ë¼¹,f`™Ïœ¥&©]ÌUÃá¤6\nXê–¦Få©Õ’¸p`òÌ[ñÚø&œ¼5g0K×ÚNÿöW?oÿì¤Åòg³os3ÔËÿ\0ÀªB\0\0\nL‘3¡ƒ 2apcž°Óˆ\nÉDÚS“„ÎÀ~=±—™Lî«äLfcº´Ò-£û¢‘îXV^5;$ýÍœ—ó<—~•ê³Øz©”´€ÅÍ4Í˜¹ˆ/ŸƒÓLÒY|ôjº‘ÃMÍ{ß2o½Â}Fé.Öžr,.Ñ‘£ûþPžwlŒúl.Îó™³¤ yo`û•Àk\\Ê¨“»@F‘z™±}_ä’W«3³LžQ™Y’ÑÙµç£}Ý_~úKyYÌ¿{î2Ÿí„°\\ÕÐ\0\0Ë÷ÿ\0€BJöéu¿ÝÙf1àÙô V&?z³§«E¯¿ÿµªJßõ7ê<™˜-5@°´Édr0Ýw·çrî“a³ôþôwväº-cº¾x¤K½/MÊ¬ÕbT¤bÑgïûïØ\n˜Áý\'Wó9hÍ•­28y?›®ÜÑ\Zé¹l5+ÐjîÒÅ*Ð{8`±T_¨¾Iß¤Ò>›’yªtfnî\n7[<²^E»¤ˆ¹<	Íø¦Œ·­-¯ÉàÉhç&çMõXëê8g¶[Ð‰oK\\ÉñÌÓ™Y©¾Óç$Ò·Û}_(#L>ñóO>–_%vË:ÏWCãÿ\0`U!\0\nÏÚÔ Npˆöu»QsD¦:¯G&	‹ç9ßa6™ÝìÒ_î<pÔîîWS[ÂuëÉ¤{é>=YµÒ}¡úÌu]Î!¡h_—®-m7ýÊy>ÓämæhèeÐæ¹>Ž™Ø’õà—˜ÁÇÂ-ñcv±ÅJgË•dg~Vî›{j±¡}—->ýjÐ¿Ñ|†ê›~úÞÏä‰=_”p}ÝæƒÇ>Èh:9ˆÅö©IÞkI\\x+þOògF)ú®Ž³áõÜ—ê÷¬\"€U…\0\0¤†äÌöáÝçÜøˆGÞ×ËOû*—7†5â«2«·¨½Ûì~D´¯kfN˜ìsõrÌÌ‘»=¹¦B¤wæ2&ÕV6¶¿ÝÙæ^k”§†õ²#çeÅ––™èO>—àõ¶›+[sœæßômt\nSMj&e¯¿¯ÛÖaÕ¾ê½4¸Ý(Ì|äƒtn‘ÜYË»~PÂ7ý»ÌÑ’~P/\"Ámß¡ãæÐ2×bÛ¢ÖG¿1ùëW\'¿0ÃX‘žË.ý’\0¬6°\0  É<AÏôš#»dªvðØ‡úËeŒaÉì±­èH.Õ…£ß(GeN¿Ý`Ž±²¡™reîÒ•ØÐ€®½-§š‘Ra…^¡©–˜Y´f€ã®¿1ãsÄWeËvæ¶±€¹bÜW¨+¤dÌÌd‰ZQšÃÛå¸Çì\\»«áÌ{‘k–#­f¨tIOBùá‘¢èÞ&³kSƒoLþÚÜqµ«ã¬Û»\0VX\0P¨ò„5µ3ÚÌé±¯²­èHžëæö¶›-™Û›a5[ÒõÔõƒn„lLª²þèÜcXáÆ=:]nöŠÂ¥r¯|»9ÅÕïÍÜ·Ü™!<n‡\\3¶ÅÜ²£5÷òùÁg+¤\nzyÔ†Ôt¡³øÓñÜ7+ÐÖ×m6·Iu;F)]ð\\úU}³ÅgŽ&^äše]KÞ™\nH-õC÷:anáçj\nÛ¶Ä•<ü’\0¬*°\0 Pe$a¹´my¸q9M’c[Ñ‘Þ@>gM:Å‹›é*ze« ´É\\1—ŸÊÐæÔ.’ó*BçYmét$+·öqµ|»öÜ3{Ñ\rçù$¬¸¼Rôš«ýx3°ë±¯ROsAP3]Üg³‹›ŸQZ_\ng>‚Ìèäu¦²EÊ§YK^y+…åü÷:13zý»\\ð6$n¸”ˆ\0X`@3ƒ ]®ýû¶Ì”ûÀÜŽ½×¿½½èWÓCîú¿\n¾k~ÄT)bW¢Wñ‰qtâ’Ñ<ôÌëtÒƒþ;¹¯¯Qµ¥s¯0íjùvóòÍJöW:S‹øÌ4÷â­rdsçµtz‹Õñ©×™¢òÔ°¼°ØÅò(Ð¥îãNðjàu—.Á,•ci³ÙÌ<ÇE>sÌ¢þY¯…›Ì6·ÿ5ÂLÄ‹\r\r8\0\0ä€\0\003	ëAÿ+Õ”æ›1<ö¡.Íã<+‰%/ëa¬¨¿þ«¢wov™[¤Ë|5Ds!z¥f’:d³)ÙãÞþƒ³»oæŒ°¬ç¥ÒA¹W˜vµ|û|—owaFšI¯ÿ¹0“Åj¦î;t<÷ÅƒÓSý‰1õ¦<UØeƒt\04½ŠÐj7ï}KçÉ³ÈrNrL0\n®)±[wÏŒYË°ÈgÎ˜Sf>“³þt¹áµ¾#asÇŸŽY?þâwo\0¬\0°\0 °µ$.è÷×ÚOÛÍd1ÉäüíãéÄå‘¯æbÑá¯ŠÞ½ëoÌq!Úgð\\ðßfl%­ï¼¿óÀQ—®KZìVç7ÓŸåÄÃ‰[ù›Þ\'ûÌRî¹÷Ý#ïçx„Œº<®Ö3—Må¿ËlÛp“9VePÙ-–$cÕšØÝSwA0/è§“£´[i*F9QŠúëíÆ°ähfÐSž?¹ïìi2W\r/>Llk±¤\\‹¹ÖU.Ö½Ê†n<CÝY/\0ð>X\0PØÖ¦õò“øÓñ®Ž³®~œLäÞ>ñQÆ?þË´êf`×WEï¶½#{™ø-r:¤\n$ËôIþn[Ñ‘ˆ«™uåL%^ýô½ŸYÜ·~¶km§—%ýJ¢î»ÜSTrŸc›$··b”™­º±‡Ö‹¸ÉX5ƒJ2D¯^Ï½âAŽ#cU\'£N\\ŽÌv(w\n;Ëìâô>	V‹eìÁ\'O+Û¤ªþ5£WÍ{ß²»xÐÜ·Á\\JœO[ZZÍ	¥é\\*%æÆauŠ¢^†\0X%Šh\0(tÛ’WùkTèçöõ6³Ä‰*×Õ<öL³»:Îeû*uAk57+uFõ{s&3â«ÊˆUecÓÞ7íf=Ì\Z0«_å3ýJ	%ûô2´ÛmvçÉY0[ÃÕõƒÊ¦d^¥%Ãéà1ËãV8ôEÉg=öiHÞÈúÒ¢þúï»Í¡k7z•þ#Ê“Ÿrlyëbõt²xpu¿\\:J}ùÈWóUðÝm‰+Y÷¯!#T=ˆì¶‰™ŒfÖ1Ì³}‡NŒŽüB¥û¥cXÃ»ßX_µj†_²ô<×)Šno\0ð\Z2°\0 àÉÿÄ7$ffAmŸto!¡6Uëy-s‘y LÕK¦1ú½¼æ‹^×”lÙÑú“÷þfß¡ãnG¯¦¦¾ŸÌÌ$7òœ~åÌÊBZÞ\"ÇéeŒº|»ûÑ+g*PçP<è¿ãÆNš2Ì!*cReüÉ€\\|¶Žü¤*Í&7£4›Ýè•clØtâ…^Ku±¹Yõ:}Déé£‹E‡—Z×I­†ÎHDjÞû–õþÍH¿ZÒf7áH•ŠÓÅ°äÂ­×4”¾Ð”_Vé+)E\0°Tÿø¯+i\0(t•©¡Gþ\Z5õJ&&Gb~Ôðã<|®LHBõM[w¼V^¹¾xMéèŸ†åÓ³;NxÛžm»¾zèÄ´U•‡“ïî8÷}ïu=34«‰åõ7±/9àY½—ÖÕ7-×(ºÖþ›\'Ï\nKÿ8ÑžŸ-ðüNBÇ\ZFGbnä I“Ê\0{0pGÎI_±|èÀ+#¾ªQEú[¾Ì-ÿän’ÿ*?Öçoê,Ú/oäoÍLþ×”üÅÛµµ¥Õî©F#Ýwº§Çamò_ôn“{_‡	ÌÚF¹ß ê„ÊBijT§áüqh £Žž…§_u¼þðý-Ý¿ÒwrOÉ‡Žûþ,é¬IË0›ýåÇ†ý¾÷7töÞ\r4f”ÞÛó¿ýïÖOU´ö_ô]öJòê’bR1ÿ:ÝÑ56âA%/•ÿðåÆïÿ­jº¤Hv}ÅòeÎ[¼I§øÛÀýd¯Zú7‰»=Wt«!qC\'ù\0V–À\nÑ’¸Ð^ôŽJ‰öußîlÛÒÒšŸ—¨\"Öûœãé*àCL\'õO<—©šÞlË˜pÖ‹Ke2#¯õuõ2ùti{ÁL-<k¶Þru\\Mò^©z}e¤çòÎÖ£ùo\rg*1DO×¦ó¶6\'”ì»ëoT+Oå¢‘n7JžÉà\\_·ùÛöÓÑ¾çÊ0Ý÷‡î;¡¥æ£‡ê›~l»ª·rûúL\r²pòÖÊx4©ø—Š¼È0ëî8g}QžŒ™š÷~véü\'fÿÊ=ñm8[Àôièÿ4é›‹3¨êZnô¯™f¸Ôô«ô%$õX}Ðßge©øÔ’ð¿üô:û2âßzßjHÞØŒf—”:{¥­<Öl-lF¦k8[ÀjC\0\0V™µ$.\\	¼¦¾¼ÖvZf&®Ãš“\nK¹Zv=wñ‰ñ¶ÏNê/eª¶¼kµB©¾^ßt%¬HÏå¼EMfùöü¬Ô¶%®\\,:¬ÞÛvº¦n³!<–Ž¼ÿ ÿŽ\\iFk	=Uß$½ãÒmeF7df¾Öjòhúªè]õ¾«ãì¦ÆÝÖÃC2fTÿÎ®Í§,fqœôlóÞ7]ê_yìèr]ÎTúÕR`Æk¢‘.[q@ùMñÓ÷~Övæ¤n7µÒö»@|mr°&uo‘í_UÔ_ßÊ(Ü¾eG«­gš¹Mj:œ\0Xe`ÀÊQ“¼òõéÕ:mŸ<xìC™œÐ2ÌtƒŠTÌ¬ ¶,Â‰[3¥Ü¯·-K\0+ÏåÛ3¦åf†NWÇÙŽºôYëë6ËK>¥?Òíë^dÕ­ÊêÚpãžºp“«uÙ®µŸÖï—}LÚ•®Ó—¼¡yûg\'ß>þ‘Ký{ðØæØÐ€ÜGÒ¹³Ó?ç\\S\n7oÙÑêêÓR¶>ðò¸Îâ ’QU?öp@Žfk@‹Kû »ãœ™—\Zw‚Ó)ŠÏÎÙy>ˆ¦Œ9eªÜáœ\r›±hŽò¹M*\0Àƒ`ÀŠÒ’¸0â«R«câOÇ/ÿäà±—eIšg]:Jÿ~Ð‰ïJ|í_Æ¡ätäQ-åËsê\\þË·Ï·zlvÒ”iÿ––é¬iíØÐ€\\þ¨±ÜU%Êô;oiŒ23ŸI-É­æ”7…·¢¾z•›#WêÆBBMzM_—žUa¬é½ö&ÆäîÐÊêÚ©UÌ›óåFºõúPyìd½f¹&uOG”¤\ríÖ˜—ÙÔ¸[;g­}¢Z|•wë;ÉÆ\'Æ—1Î\0ðX\0°Ò¼:ùÅWÁwU,@fk_~úbXÚµöÓæÜl×ä×Ùˆ]°T,#ï¬+úý¦dOþ/_í¤y3°K}ÙöÙÉŸ¾÷³üZ•“µ¼½\Z03_VXúÕ³ÿãœhI\\ÐkEåzP]ëöZãÊuµ^HAÎØð4ëÇŽ<(ty)y”Ù9S¡Û}‡ŽËaû#Ýr|T]<•ÎfýÄœ©Ð¶Ž³/Ëc\n\0°ìØ…\0V\Z¿“XŸúÃü›’Sµ‹ÇŸüéßßz¹áÇÀjÿG™u^øL)ÓéEîò–¥Î¨ÚÿKÞÄ„÷äg+F5»þöÙâµµ©Áåªž±“¦Ú?oÚ¿\Z†e|b¼ý³“OF¦w£“öÿQ²wIGðø.„æ w|3)<ÒÅ?|¹±ä¥òß¿_ÿöuÿJK6\':r9`ÒÐmøäOÃnl8+Ÿu^–0½ûAhsEeÍÔ7Kä·Éœ?\\S\"?_ß¸gËŽÖWÕ7Y|I3þîìÕMÊÓ;?Û¤\0<…,\0XÊSÃ»&¿ÖÉäa9SÑ+³‚r(Ùçµ(\rÉéÍÝž+î-°Êp×H¿ZÞ61Ê •þ²»BÊ›®µÖy.*m_¬\\Ý#ßt¸-þt¼ýÌÉ·O|´²ŸK—Îb®YÞ=ùMŽ\'nÝõ7ê\rg]]q¬7åhrž{©âqÁ5¥yKp“ÛD§_…“·<’9\0È3?M\0\0+ÒÚÔ YfEÅ°âã«³5fG¯²®Aãž\rÉ¨Î)˜³{£g×rËØ2)Ý5ùµyb:	h¥’aiöõîÄ7EÎÄÊ¾äÝ“ßèèÃèÈðÊ~.Iÿš[^¾:ùEîý+GØ–˜	:·}v2ÿ\r¨Þæ-zõ ÿŽù˜ZÙA^\0À`ÀŠ•¦Q1¬EnËµ’twœó~ôJÍKõÆdÒMÑHw>T>E	ùôež¬M\r¾’¸ª¿ìê8›ÏX^žeD¯dX–§Vþí)clwâ«]Á±u÷úWbzQgüéxÛ™“+xÀÈØhûlæ7V|\00X\0°’ÍŽa}~êcµúc•9¤YÛ³Ñ+Å¬?¥÷,sÕ]c‚½\\Õ¯2lJö˜+3¢\0+idFžo|+ë7mÝÝ®FºËSÃ¯N~±²cX³£Wv×çšE ¤ÓÍýJ\"£\"=6ž-\\›\Z¤|;\0¬f°\0`…“Y“9W”™À—ŸþòvgÛŠ¿p™~êcséñè•šØëÄ\n™”º.—Îóz¶¾©\"óNúOÆl_&ç×ž•™_2¢r±æ¢°¥\n¦ìW³~bŒ=7Ž/ƒ-3¶þÉÇ±¡Ð¹ª*FÿZ¯.Wš\Z50c•ôŠÑvæ¤Ý\nb\0€‚Æ.„\0°ò•:£æ¾„ÎÔþ_\ZøáË+ukÂh¤ÛÜùË)„è•6èß8ýÎçüðG[Ýû ÞÎv°³5ùmE*æFØŠŽùÊF|UêËG÷¿—Þ¬	m.ôŸÿâüg¹-ŽL¹¯£þzõ¾²ºnÝ†—s?OýÏ±nNÞLo h[YêñÚÔ Œvõ\\’–ùþ÷ß–WÕTT®/Üþ–\'Ïƒþ¾<<y¤ƒNü¡ºUlh@î‘P}ÓÊx†§woüÍ?š…ÿjò¬ã\0P@`Àª°Æ9ù{™ê<õMoø5{ðûî…>]œsÚsáìíî8§7\\w¦2z\Z’…Q÷·\"»hTSzé£m»º÷Y—ÎŸRë¶d\ZÜœèð;	O5EFKæçøþÖº\r/—¼T^ ƒSfãçþÇ¶W•î»xE½—Æ±ÂˆÜºòèþ÷ê½Ü;:…Ó®ŒØºÜ³ß÷^—1éjÜÖ=³ãæn?y*SC÷Èƒþ¾P}ó\nˆó~ùé/ôT-YZ		z\0€\\À€ÕÂï$~”ìôÇ|ëÔwÔtñCk7¼\\¼¦t\\c¤ç²L õ’5·ÿW“gkæ3á+U}$TV^UY]çÒdûN÷tè¤6ù/µ©ñ`SlHEÍ;þäOßÿþÛ@QÐJ’Qž\'äÎ\\ù_ÿÓ¸ªÜÚQ½4”ú -;Zs?¦œª\nn–¦F]\rÁ¬qÆ×§þðÐW«Îß™Ê¶ëtV¤Rõï·m§uÿª °õ•ƒsÞ#fëÉÈðï»/HëÉ££@ã³ã¼Ö+ˆ\0\n,\0X]ªSNì¡¿V/\'‰=¸ÝÙæs|•Õu…ûïöªŒ±\\ˆ ØŒ¾:ùEÁ­:)sßõ7NOGÿ4üçMûÝø”ÎH×«÷;×8ãž±ÒƒzY¥ôï¾¿õ ¿o}ÝæB‰ºF#ÝígNšËƒN|ïäWRQ[1îû3æ‹OŒ×ÔmÎ1x\ZøîêWÓ7Q*jñ<ç$coc2ó¯ó•M_Î“?Ýé¾ %éåBìßÒÔèÞÄWy‹›K™k	å‰ô\\)Ä%·óÅy‰^\0X\0°ê”¥¿œüý¨¯B^ú›úïü¾ûB2‘(¸0–\n]uwœ{®ì´oL\\ß–¼âµeq‹!\'?â«R½#3ùP}³õT”Ñ‘a™%ª÷©˜Ç×WÊÊÝLÒ‘¾.ˆ¨«\Zœ=W¿2·Ø[›\ZÜ›øÊnÅ1•„õ¬scáÆ=¹­óÂgºžú–d—<1Ün(9ÿtÂç<òÕ˜­w·çÊKUž]æ,­ô»³ÿ_FÿnHF¥ó7¯L\reüË„œ›<Ò(]qÎ8oÁåÏ\0\\E\0\0V#™.Ö¦þE&<1ß:H&&Uk|ìOå•ë½ŸÞ2gèÊy–x¥·ó+È_Ï¾ä€ÿeÝ/Ö3ß½uEO½V¾}N*I\'éèå„Ž·£®ó\rÎ†ä–Äë%¥JQ½ŠP>1—$¬ØÐ€n–¦F›yk4¹g3\"•éÊî½×ô÷ÉåxjMÜèÈð·í¿‘†òNÜ¼,õXžê#¾*È¦Òïö\\	®)qi%²Å›eÎ8o‚§\0€â{üq˜V\0€UkÒ)Ž¶Þõ7Æeòõ¼P}S]¸)ÇT7È$\'Ú×u»³Í¬u¥T¤bÛW\n:t¥}Uô®šˆÊäó§ïý,X\\bñà¿ýÕÏGŸM¼ßŠÿS‘3Q(ÍòÈWÓØ¯§èÓƒ5%2P·´´.{ŒC\rÎîŽs£ÏÇ­Ô„¼%q¡4åVbNÔ_/-3Ë(¯zûÄGYŒU<[ßYË²zK=”zýÛ3¾_Y]+]¼ìO¤ýwäáíëÎsÿ.ž<Ï{Û3é2$Ò÷ÈŽV»O’Ez.Ïù$oHÞhHÜp\0\0x,\0@zÆx3°K/AÊ\r„ÂÍuõM¡ðòïÎt÷÷uG#]ñ§™›T©é•T*E¦ z¿³õ¨LÝ-ÎÀ¿üô—ê½•]ðò?\\ç‹º®¯ÛnÜªoÎÿ,]\rN™ÏþO28¥‘óW½XtX/Á«¬®=xìÃ%µCFôª\";0yf¹zyÌWÖØo®(ÔO¤pãyU®«ÍçùŒŽ÷Gºo_o›šÌ[ÿZy¤KÓ-ûó|\'¹wâ€\0\0\"€\0xq\\@Gjê6¯¯«Ïgee™.>è¿ó ¿oÎÙŽ³CWŠLÝ/VïCõMŽ¼oëÈ—ÎŸÒq–Â]k)Ãµ7°]¦èsW¢Òhò§«a58û#Ýƒýwæœ©Ø¦dOÞç˜¯¬½èÝ •ÕµûXdÄ†.ÿDG¯‚N\\ÆFyjxÙïéåÙa,uuSñJw#YÒ,ÒÅr¿ÌÎòþÃGÆC¯ûÂÿ2!ôüD{_ø$—QCâÆÊÈŸ\0¸„\0\0 3.pßºëo|ì[¨Hb:4P][V^%³ÇÊê:‹S øÄxìa¿ÌeÆ(žÙùÚ†dtS²g¥Nx:ûõÌóÀ;ïÛÊ˜æýŸÿðŸôôûÉ_úp]8êš®þ³®Nfé?x6\\sœ„?IÏÃûbCýó­–wpšqOuù[[^[xá˜‰Û×Ûþöîæ·‘üÌxU±øª·V¿93m`fÇÏ®“`_b`wÙM‚Á\"‡`÷äšcŽùCö˜kŽÎ)ð%ØMœCÆÀ¾ø%ëlÛ‹™1à™{ì™öè\"E2U,ŠÍ–Zj©EIÉÏ»¤n©¥ÉbÕWÏóÔþæ/f?êÒoçÄXÕÏø°L*_ðú[WßM÷?ÅÎçœ»xrósb¬J±\'¯V¯x‚Ìñ—³O–bg~Îž\\tÀ	°\08ó´çgÙÛ¿H˜7tÎYP½ÑžÎZîlÜ¹È@¢âD±:E,Î“qwÛK?¥8u|4z¿8u\\â6“£¤ñõ_mËøoÿÃ™×WþéÞýþ»ß¬¶¿:øÞÃÇË±bÅùù“ô‹¿È½ô_ëÙÙØnŒƒ­é‹³÷ÙSœuÏ<D?êv‹SñsÎÀgœoòpôó[|pKñwµß:‘è½°­\nNs\n•^Ø#Us7UE–ÓÑ‰{ö´ê¾Þß¿ÅjœJNVrXî|.m)v)ÅÒ}}å¥ûóê	2]À­û¯5^–	özÝ_+Ôz½ƒ§¿ü¸?¾½È“å£2çÕ0À	°\0x‰tûÓôá/²GgU@ÜŒÍÑÓâ¤±8u¼õ¶¦p}°w|ûE\'çOÒ/V×~p>ýüÃƒ<8‹çìwkpÁèùD¦ð[ƒÿü)ö$ûâ/ÒGÅíùIÖ|wnu/úS¦xl|˜½uñßLÌ]•[­Èž€ù`p	Ÿ¦?Í·ÅYÐ\rœ=nŽž\'9wGOŠ·•ú-ý5]‚pÑÇ·_ÜQÒ¨¨Ÿ§w®)x­Õòmø$`¨ñÒæÊêIÿáã7?Y¬KR>É¾XÝË+x_Ñ4í-VïºÃ¬•Ý“0_¹%\0àâÊ3Á“érqæS&Yi½Ê®˜\'6íd¯8Õ)6Š³bcùN\Z/âÃì­éùä£7çyA½wº½|cïŸ?¾é=þüaòóêÝâQZ,iùpMÊ‡ëeã×zÒ/õQ#ù¬|”Žöâw+ðåÁßü¤x8oçD<ÅÏò…aY³pO·ÙÝQ•ªOîåWŠ×«{¹¸s«´eé÷?ÅOúÆèñIÙD\\¬ÛA²öiö°¸-¶¯øû‰êÙQÜ–O™qnå¥€9Þ\0À«ž!W¿Q?ññê\\¨Ú>Jg9—ç‡£Þì	•ŸeoO·ßù1¯/Ûïu§\\ˆfŽŠ³èâmšgM¢^%\Z‹þ$}cø¸x«âæò¹yœ.JwA§÷EÓÑY{¡»ÃÉ¿o\'{+^Týò`šžÞ“W¿¨xñ\'/eàúl\0à\ZÎ…&ïŒ’Ó©ç˜í‡zðú—.2ÿ‚¦éUáÍáO,u2¶Væ€¯Œ›‹çã*îˆì…®¼\'÷;\0\"È,\0Äñ÷µßœnÿÆüÊ¯’ç¬åî\0`ù°\0 ŠrFþñ±¯©x›×W~ú«§¶_‚+©\0°jX\0Åõ•_ýôoßn?\Z)¿\0`Á°\0 „³·®©üªßë~øÁªíöhïáÐ< \0\0Œ\0\0nßQÒø»ÚoMßûô«þa·ÚV~\0À\"`ÀíûAíëýdr•úGo½3Çò«äDÿ ñí\0\0, \0Ü²Ô¾þ‹ìQµ]o¶þÉïýñ¿ø\'½··óYµýhø~{´gÁ\0X8¹%\0€«;J\ZŸf?OïLçXMÝ=iöªÛŸò‹ìÑÏ²·‹Ïš~ðwÿðO×6¶çøýèoþ×t[ù\0\0J€\0WòiúðgÙÛÓªþƒéöÝÑ“jc\'ÝžöNýÆïüËGo¾3Çïmoç³O>z¯ÚÞ=þï\0\0°XX\0ðŠÒµÔ¾~ºäêçüãßýÃ?yóíßžïwøã™ò«7†Ýe\0\0,(\0¼Štû¯ò?:]EUXÛØîŒÛ\0û½ƒ§¿üø¥_êÁë_ú§¿ÿÇwî½6ßïpoç³§Únöô\0°¸X\0pi§Ó«;÷_{óíß~ðú—NçPUßÓ_}|\"Ì*>emcûõ7ß™ïÐ«©Ùò«/è^\0`q	°\0àÒ~Pûú4½ª7[¿û‡zÎìªµíµy÷¾”ò+\0\0–‰\0\0.çÃì­éuëÍÖ¿ú“ÿ|M%TW¡ü\n\0€e’Y\0¸”¿Ï~sºýÏÿÝ\n˜^}òÑ{Ê¯\0\0X&,\0¸„tû ]«¶ß|û·ç>y}.~¤ü\n\0€å\"À€Kø4}8Ý~ý­w~‡<þÎ\'½WmoŽž*¿\0`	°\0à¦åW…‡¯)Ú·×ïu¿ÿíoNßýGƒïºË\0\0X,\0¸„éøöB½ÑŠöíýõ·¾Ñ?ìVÛ†ïß=q—\0°X\0°$~úƒw?|ÿÇÕv=éuð=k\0Àr`À2øä£÷¾ÿî³æÁ¯\rþ2Oz–\0€å À€Khö¦Ûý^7ÈwõôW¿û?ÿÛôÝGÃ÷îÎ\0`i°\0à6GO§ÛOŽ/öw»žþêãÿó?þëtôUñ~mð—î)\0\0–‰\0\0.av,úGÇ§nÑ¿óçßø³ÙôêŸýow\0\0KF€\0—°1úlÚEøÁãï<ýÕÇ·õô{Ýïû›ý­ÿ>ýH•^}\0Àò`Àå|yøÃéö_ë·2	ë“ÞûóoüÙOÿöÝéG¤W\0\0,±ôó?{Ó*\0À¥|;ÿ7Ÿ§wªí;÷_û½ý×6¶oæ¿ÞÛùìÿ}û›>ß½ø…á‡.;\0À`À¥í¤Û•ÿQ?©WïÖ›­¯|íþá?þýz£u}ÿé\'½÷Áãï~ðø;\'>þÕÁ÷Þ>v§\0\0°ÄX\0ð*NdX•Go½óú›ï<xýKs,ÈúðƒòÑ{½ÿã½ÏNüÕÝÑ“¯¾·1úÌÝ\0Àr`À+ÚI·¿[ûƒƒtíô_­mlß¹ÿÚ{¯w6îÛõfûÎ½×^úû½îÓ_~””ÅVïïí|öôW=ýå‹‡Ä·G{_þðÑð}÷\0\0«@€\0¯î(iü}í7?È¾r©Ïºsÿµz£]m÷{g¥T/$º\0`	°\0àªŽ’Æ‡Ù[ÅÛt²ûÜÕ“þÃáÏ\rß¿;zbÁ\0X5¹%\0€+¿šöÞ>.ÞÒµOÓ‡ÅÛNº}õ0«=ÚÛ=½;zR¼t\0Àjr\0sÒí=\Z½ÿ(™ô÷í¤Ûý¤^Þ¦å¬÷d²qÖç¶“½bcsô4õTZ\0À”\0\0®KU6%Š\0€+Ê,\0\0\0\0‘	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0Zn	`µÆáõ0IzC‹\0\0@p,¸­\'_Z¾ÍH[µ“ÿ¦øûÆe’ÙÙuczÃdxö_N~lt4LŽžÿho”G\0\0\0¼äÚÀ´Ž³¤,Mgs¥æÌö©Äjá“ µ^ðW/ÿáFÏ%\\3)Øsá×‰\0\0À²`Á9ÏãÈi6–šfR´ø¸Eº–¯Ì¤`g.ôlØádkT~pœpé‘\0\0XŽóEKÀ\n?ü\'qÉ¤woÚ¯¡;š½§Ž¯¤]ÃQÙ®XmôËQù‘q¶%ä\0\0ˆo	XfYZÖIM#ªÚqOK>µz„ÖóÇNÿ›igâ¸’ëYÂeP\0\0Àm`±øN¤Tõqgßò\rœâÚw‡Ïå›\'=Ó\Z®ñd®ÉL.Õ[\0\0\07sÆf	XUPU£ªÚýôúq“¿ÖÙñV·ªÕ’m\0\0\\1˜ãZ˜F–fédhº¦?\"k={”>—mMë¶ª¶Äî Üî\n¶\0\0\0.™Xnû1XfUe÷_UT¥õer¢nkkf—[ÅX‡ÃÉ°-[\0\0\0g`q³\'óq\\•ge]•@VÙqÑÖ*¶ŽFÉ`4*S­‘ò\0\0\0‰\0‹kTÅU,­•·Õø*«/yÖ_-ñ¹gKwfõG“[R-\0\0`Å°˜ß‰·¸\n®Éñ¸“©Öl­–ÑZ\0\0Àò`q…3ê<Më™¸\nní98öì¹w4n?ì\rGƒñ\\­ê]\0\0€Å\'ÀâbÆVå¨õúäú€–âíÑÇOÏsµ¦…ZÝQñ\0\0À¢žîXÎ<ndic<m],®i¡Öô\ZˆUqVÜ{8®Ø²H\0\0@p,¦‰¬†²í·üóÙ“|\Ziu\Z\0€€X«|çK¬€±i¤5­Ò\Z7ŽúÃ2ÛrÑC\0\0à¶	°VL+›Ì±j”#Ø­pÖ¾\")K´j“w«²¬Ãáèhœgé:\0\0n–\0kéïáñDçzVžŽš¼¼òžäÄxx%Z\0\0ÀMž”X‚%4-³je\ZkÚÏ$\'J´zCS´\0\0€k\"ÀZ\nÙ¸2¢9®±j)³nþÅ$Mò2ÌšLÑ\ZŽÊ²¬Ãay¡ÃjB<\0\0ÀUÎ9,ÁŸ.–¡U­œ¿®7¥LÕgZåY\0\0ÀÕ°ëî:­ZF°‹Cž\0\0\\\0+þ]$´–Ëé<«{<?Ë<x\0\0àEXaÏî²´-´Vc×™™ŸuTæY“ëv‡–\0\0HX±tjå öVf¦°Â¯Ki²^{v}ÃqŒUæY]Í†\0\0°Â\'\n–à–¯8)¶àôN²qjx–fC\0\0X1¬ÛPöËŒÇZu²$Ó!pág5<«j6,gÀF‡ÅY\0\0°ôX7hZi¥CàêÊâ¬$]7ÎN‚79\0\0–Ž\0ëšUÅVUn¥Ø\nà\Zw¶3“à»åøÑáxr–NC\0\0X|¬ëÑÈÒâTª­Ø\nà6´Æã«íê²†:\r\0`‘	°æªS›[åŠ­\0‚¼Ð/k8Ói8©Ìêé4\0€Å9®·W¥I`‘öØµ´cl\0\0,Ö+¯\\ú¬Þ\n€…szlÖáP˜\0\01	°.©1ž«²V3Ü\n`©Tc³„Y\0\0’\0ëb\ZãÐªS3Ü\n`ù	³\0\0 Ö¹äV\0+N˜\0\0°^DnÀi³aÖþÀÕ\0àÆ°fÈ­\0¸ ç¯fX†Yûƒähda\0\0à:°Ž¯\'h.;\0¯`|5Ã2ÌÚ®—Vf\r’ýal\0\0s²ÂVqÊ±.·`Ž/ªãW–õZr/)[§•Y\0\0ÀµWñ‡.Î.ÚãVA\0¸&¬ìL¯¶»ÃÑÁÀÀ,\0\0xe«`µ²t-O:Y’qÀÍ¾\0µÆÕ¾ÕÀ¬*Ì20\0\0.l¬<M7r£Ù¸}ÓY‰C\0\0¸„å\r°Ê“„¬Œ®Œ¸  ÙÃýA™dé1\0€3,c€Uµ\n®qÀ‚˜–eÍôºŽ!\0\0[¢\0+OÓõ<YÓ*À¿–M®c˜ý\0\03GÊËðCtjéš«\n°\\¦£ß•e\0°ò9ÀRrÀJ¼VÏ”eUÓ²ö.b\0Àj/äw­ä\n€ÕTMËÚ®—Ö4Ì\0€e·PV–¦›J®\0`\\–µ9~97îk0\0`yãÛtaA\0x¡,”eÝK’Þp´gî;\0\0K(|€µ^K7ò¤‘¹«\0à%\ZYÚ8žû®Á\0€%5Àª´oÔÊ_,\0—|Õ`\0ÀRá†ûŽtÀ¼Ì6N’,W0\0`ñD\n°tÀõiei++¯`Ø–aÖÞÀ¨,\0\0E€\0Ëµà&5²rZVñâ{4zV–\0\0Ýj€•§eÉÕºAW\0p;/ÄeùsñB<%ûã$«kT\0\0!]oç¿md“è\n\0¸uÙq’UØú\0@47`µ²t«^ÜZz\0ˆÈÐw\0\0â¹Á\0k½V^^Pt\0afè{9ñ]’\0Àí¹‘\0k½VV]™Ñ\0‹¨‘¥q’µ?í•s²\0\0àf]s€%º€¥QuÊkw`H\0\07æÚ,Ñ\0,ç±Cšn×“­¼¼páÎQÒS\0Àõ„ÎÿKŠ®\0`éM/\\ØŽöÆY\0\0pmæ\Z`‰®\0`Õ”³ÞÉÖ(ÙŒvz\0à:Ì)À]ÀJP¤ÉVž–}…½\0p\rÇ›Wý¢+\0`Ê w\0\0®Á¬V–Þkˆ®\0€SÇ½\00×ÌWù¤VVV]µ2Ë\0œi:è½7œd\0À+¹d€UýBµS³p\0ÀE5ÆUÛÛ£dw<!Ë w\0\0.éÂV6Ž®ÖEW\0À+ÉÒd3O7ó¤;í)È\0à.`¥wêÉF­<î\0¸¢V–¶\ZÉÖ(ÙŒvd\0ðr/°:µ²ðÊ¤v\0`ÎÇ i²•§å ÷ÁhoPÜZ\0\0Î<x<óo\ZY]™Ô\0\\«N-íÔÊ:,Y\0\0œáEV––¿ÝÌ­\0pS‡$ÇY»ƒrBVwhI\0\0xv´xòëãžAã®\0€[QŠ¬—Yåõ\nwÉPA\0ÀjËÒô™\0KÏ \0D>¾üqñ¦ \0`•µ²ôA#ÉÒI€U^gpKÏ \0Œ‚,\0€•µ™—¿ÔËËÂ«{õâÖ²\0\0A)È\0X)YZ¦UÚÌñà\Z&^\0‹AA\0ÀÒkŒÛóçÒª\\z\0,Y\0\0Ëj¦mð¹@+\0,*Y\0\0KãTÛà,\0°àd\0,ºV–Þ;Ù6øÜŸ%\0–ÄqAV²7í•\0\0„—Þ©\'[/I¨X\0ÀrÉÓâ\0(-Žö£½AqkI\0\0Â¹•…W­ìåÿÐZ\0Ë©SK;\n²\0\0­Ý«_ðê‚,\0`©ÍdÊYï\0\0Ü®l<Ãt½v‰c:‹\0¬„ª k{TÎzßQ\0pK\ZYúà¼yí/$À\0VI–&›yº™\'ÝádBÖP’\0pC.2¯ý…ŠÏI-\0°rZµ´5.ÈÚdõ†–\0à\Zåiú ™4²Wül\0¬®,MÖót=OzÃÑÞQ9!KA\0ÀÜmæéÖEçµ¿P®\0\0 ifi³‘ÜM’Ý£Ñî éšõ\00yšÞo&­ìª_ÆJ\0<SdÆI–Yï\0\0W°Y/‡^esøJf`\0œ>DJ“;ôN£œµ”ìY\0€KM¯jsûz–\0àLZÚ©%w“‚,³Þ\0^jRx5Ï’)\0ÀË‡_ÅqØf½œõþy?Ù7ë\0àEæ]xõìk!\0¸¨F-½?> Û=*[÷µ\0+¯\Zó-¼šR\0pyÏf½÷Ç³Þµ\0+,Ï®©ðêÙÿ`‘\0^õHêxÖ{wPÆXûGZ€USo×}Ø¥ƒ\0àªÚµ´]K†ã«þºgÖ;\0°Zµô^3id7ð_™\00\'Yš¬géz=9\ZŽ~Ý/²´\0KzØ“n7’ÍÆý‡Z\0æ~„••¿,ÞöF{GÉnß’\0\0Ë£“§Z×4¬ýÌÃ+Ë\0p‡w|’di-\0]ž•ÑÕuk?óÖB\0p½ÊÖÂFºÞ·ö´\0‹(Ýn–=ƒÙíäH*°\0\0nìÈ+Kïµ’{É¸µ°¯µ\0X­qÏ`žÝâ· À\0¸q“ÖÂÖqkáÀ’\0\0U¿~ëÜ~|$À\0¸%ekaýøª…Z€Xn·gð„<IÍÀ\0¸UõZz¿]nvûÉ^?Ž¬\n\0pkÚyypRÏâ|G*°\0\0\",¶Ç­…{ý2É:8²$\0ÀÊ³ôa;i…Ë‹X\0\0Ádi²ÑH7Ê«–IÖ¯{Z€8I·šÉv3æw\'À\0ˆ*Ï’­fy(ÙŒvúÉNOk!\0p-6\Zå°ö,î˜©<IÌÀ\0ˆ­‘§÷òä^{ÜZØ+‡d\0ÌE»8Ìh\'ZðoS\0ÀâX«§kõ²«l-<LzK\0¼¢<+£«âÐb!¾Y÷\0À‚™’µÓí’\0\\îX\"Ýn%[Íú–µ\0,¬¼–l·Óív9$ë×Ý²µÐ,\0à\\ãè*ô¸«õ¸ç\0\0^£–>XK$É~´×+Ç½\0œ°Ñ(ï•g‹ø½ç\n°\0\0–G5$ë~§’µs˜Y\0`<©½“4k‹û¨À\0X:³C²ª$ëÐ¸w\0XIí¼¬ºj/|þc\0ÀòÊkÉV-Ýj%‡ƒ2ÆÚ3î\0Vç0 Kï¶“æ’ü4îP\0€å×¬¥ÍNÙZxp4I²Œ{€eµ\\ÑÕägr·\0¬vž–MkÉ^o´×Ov-	\0,,-£«­ÖòýdZ\0VÒZ3]kNÆ½ïõÊš,\0`qeiz§UFWY¶”?Ÿ\n,\0€U>ØÍ’fºÑ,;\nwÇãÞ]¸\0ëÕ<MïŒ«®²e.Q`\00¾páV«÷^^¸°\'É€…xù^…èª’ë \0à™z–Üi•=‡ÇãÞû.\\\0ÁTÑÕ•ˆ®*f`\0ð\"ÍzÚ¬\'÷“™$k`U\0à–M¢«öêDW-„\0\0œ«™§Í<¹_]¸°—ì–³\0€¶ªÑUE€\0ÀÅ¬5ÒµFòp]’\07jµ£«Š\0\0€K:‘d}Þµ$\0p-êµt«l6W9ºª˜\0À«Zk¦kÍäþz²w8Úí·–\0æ£^Kïv’–•¨¨À\0àj²´8¼N‹#ìáH’\0WÕÌË†AÑÕóX\0\0Ì‰$\0®¢]Oï®·Vâ´<Iµ\00Wµ4Ùl§›íd8Lv{£½Ãrâ;\0p–ÍVz§“4•ÉÒ\0\0pm²¬<\"ß×díJ²\0àùÊ4Yo–UWõšÅ8Ÿ\0\0€9@—dÀT½V¾,Þé¸¼à	°\0\0¸A’,\0V\\9£½S¼\ZZ‰KÉ“DÔ\0ÀË¦s²FÉnW’Àò[o–ÑU»a%^\n,\0\0n•$€Ux¥»Ó1èê*X\0\0D:¾—d°4êµr@ûzË ««`\0ÌsIÖáè W&YÃ¡…`a”Ý‚kI»n%æ%OR) \0\0!ÕÒd«nµËíÝÃÑnW’@hYV¾ré¼*°\0\0XëÍt½YnTIÖA/é¬\n\0Qt\ZeíðfÛJ\\\0\0ešd>?Hv»’,\0nM–•/LÛkISÀr½ŠõÕB\0ÀjÖÓõäÁfrØOö{e˜Ul\0À½m¯%ëÍ2Ãâú	\0XøSˆÉYD0¾|a7ÙïY\0®Å³’+Úo”\0\0€eQ¯%ÛkåIÅpx<ô½kU\0˜%W·J€\0ÀÒ)N-6Ûi5Iw·ëò…\0\\é5¥¼°àšÞ.3°\0\0Xjëít}œdöGŸïúÀ…_AZéf§¸µäò+\0\0VB«ž¶¶’‡[“QY»ÝdÿÐª\0pR³žnu’ÍvRÓ*ˆB\0\0VÌì¨¬*Éêi0ðêP–\\muLgI!\0\0«*«%[kéÖZ¹½{0Úï·\ZVìµ K6Zéz+©úÍ‰J\0\0Êz¸•ö“ýC\r†\0+°ço•{þ–«\n.\0\0ÌhÖÇJ_Ÿ4·\Z–i?_îäåV‹F€\0\0/R^7½SCùã+þz¿¬É:ì[€…Tf_o—³®X@f`\0ÀKO{\ZéÃF¹Ñ?Jö{£Ýƒ2ÌR–°\0;ðz9ëp½•ÔUð,6÷\0\0\\Xqþ³•—¿Ã/”£²”eD4É­Ô[-\0\0¼’N3í4Ëþ 98í·É@YÀ­î™×Ûr«¥”ë \0€+iÔ’FgR–uØOvÊÊ¬®²,€›²1¾’ìF;ÉdKË,\0\0˜Ÿf£˜u«œµ?.ËÚ?,\'g0_õ¼¬·Ú×[±´\0À5È²âœ*­N«ûÉ~w´X†Yz®¢\n­:­¤Y·+E€\0\0×¬8ËjÖÓír{cv÷õ\\Tmü+2·j–¿`%	°\0\0àg_fzsÒcX•eu{à¤in¥I3°\0\0àvdµd½“®G¿÷ÆaV×À,€r¸U9”½“TWz…1X\0\0àlm+O·ÖÊíi˜µ{``°BZr7Øi–WÃ€SX\0\0Él˜uØ{V™%Ì–OÕ$Øi%mÃ­8_ž¤Z\0 ¤V³xKïn–ÛÝÞäR†Å†6C`¡uZ“+	¶[qQ*°\0\0`§y­Fzw¼]¶vG{‡Å­0X”Xº1kÕiY^\0\0\0MÙf¸žn­—Ûý£¤Û_Í°ëj†@,ã\Z«´\n­j:¹\0\0,²z^¼•u\r…Áp26k¯[æY\07¬–%ÍFºÖRiÅÜåIb\0\0,Ç©c-é´‹·ôþøÝjlÖøV§!p]êy9ÓªÕ0ÓŠk¥\0\0–T56«ÚËë°Wgö\\ÓxuÏÊ¬ZÅ†Þ@n†\0\0\0Vã„s£S¼=+Î:ì•ÅYU}Àù;*±j–±xYr7N!\0\0¬žV³xK·Žß€&U¤¬¸z^Öo¶Æs¬Æƒö,	·.—_\0Àª[koÏÎö»IïhÔ=,›\r÷ÔgÁ²«ee]U³‘6êI5Ê\nâ£\0\0Ï+N_;Iš¬OÞíöÊðÝÞhÿ é™‹íD\\eˆB€\0\0œk<¾œŸ•Ü™|¤j9ìõË­®‘ðûù[ËÒN»lläâ*—X\0\0À%\'Ãö³‰Á°L²zý¤4Úï&ƒAZpÊ¬ª–vZã\Z«¦ÙU,f\0\0àjŠ³å²ë°œ›ó,Õê›\r»‡É`(Õ‚9?ãZÍ$ËÒê‚€º¬ŠUà!\0\0\\ƒêŒúDªUÕj‡Ye°U‡\\N\ZWTÏ£´z65êI6_+I€\0\0Ü”ªV«°±–œ˜fRe[…rN|¿øs4ýHùÁ¾áñ,§µvyÛl¤Å³£*­J×„ÓÌÀ\0\0¨ÕÊÑZå©ûä/9QÙ?xÁÃIm×`ð,üRáÅ-j5«¡éiõð®—PÕëšþàRrù\0\0°xªº•Ó6OÕvM•ñÖád»ÛK†“Tktp8Ý–vñ*ÂV#­Õª²Ë¯ÐOÁœyF\0\0«¡–=Kfò¯3§?f\r‡³CèŸË¼±×=Bª¾ê1}ÌNž’LÁ-ÑB\0\0ð\"­ççm<Û|ÉITÿ¨Ú5ëTÃãÉ,y¾@ŒW¿×&-{³Ig?r¢wïô¿B’\0\0ÌUuÍ¸Y§\Z/QGp:›ý«~ÿüÏíÌá\':ç‹<_µô*²,mŸûÎ\Z¥\nV‰g;\0\0@`§ã°ËHXA`h!\0\0\0 4½¾\0\0\0\0„&À\0\0\0 ´<Iµ\0\0\0—\n,\0\0\0\0B3Ä\0\0\0€ÐT`\0\0\0š\0\0\0\0€Ð´\0\0\0š\n,\0\0\0\0BS\0\0\0@h¹ü\n\0\0\0€ÈT`\0\0\0šX\0\0\0\0„&À\0\0\0 4-„\0\0\0\0„¦\0\0\0€ÐT`\0\0\0š\n,\0\0\0\0BË`\0\0\0™B\0\0\0\0BÓB\0\0\0@h*°\0\0\0\0M\0\0\0\0¡	°\0\0\0\0M!\0\0\0\0¡©À\0\0\0 ´<IU`\0\0\0—\n,\0\0\0\0B`\0\0\0š!î\0\0\0\0„¦\0\0\0€ÐT`\0\0\0š\n,\0\0\0\0B`\0\0\0Zž¤Z\0\0\0ˆK\0\0\0\0¡â\0\0\0@h¹ø\n\0\0\0€È´\0\0\0šB\0\0\0\0BS\0\0\0@h*°\0\0\0\0M\0\0\0\0¡åIª\0\0\0€¸T`\0\0\0š\0\0\0\0€Ðq\0\0\0 4X\0\0\0\0„¦\0\0\0€ÐT`\0\0\0š\0\0\0\0€Ðò$ÕB\0\0\0@\\*°\0\0\0\0Íw\0\0\0\0BS\0\0\0@h*°\0\0\0\0M\0\0\0\0¡	°\0\0\0\0M!\0\0\0\0¡åò+\0\0\0\0\"S\0\0\0@hf`\0\0\0š\0\0\0\0€Ð´\0\0\0š\n,\0\0\0\0BS\0\0\0@h*°\0\0\0\0-W€\0\0\0@dZ\0\0\0M!\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„&À\0\0\0 4-„\0\0\0\0„¦\0\0\0€Ðò$U\0\0\0@\\*°\0\0\0\0M€\0\0\0@h†¸\0\0\0š\n,\0\0\0\0BS\0\0\0@h*°\0\0\0\0M€\0\0\0@hy’j!\0\0\0 .X\0\0\0\0„fˆ;\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„¦\0\0\0€ÐX\0\0\0\0„¦…\0\0\0€Ðrù\0\0\0\0‘©À\0\0\0 43°\0\0\0\0M€\0\0\0@hZ\0\0\0M\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„–\'©\n,\0\0\0\0âR\0\0\0@h,\0\0\0\0B3Ä\0\0\0€ÐT`\0\0\0š\n,\0\0\0\0BS\0\0\0@h,\0\0\0\0BÓB\0\0\0@h¹ü\n\0\0\0€ÈT`\0\0\0šX\0\0\0\0„&À\0\0\0 4-„\0\0\0\0„¦\0\0\0€ÐT`\0\0\0š\n,\0\0\0\0BËSX\0\0\0\0¦…\0\0\0€Ð´\0\0\0š\n,\0\0\0\0BS\0\0\0@h,\0\0\0\0BÓB\0\0\0@h*°\0\0\0\0-ORX\0\0\0\0Ä¥\0\0\0€ÐX\0\0\0\0„fˆ;\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„¦\0\0\0€ÐT`\0\0\0Z.¿\0\0\0 2-„\0\0\0\0„¦…\0\0\0€ÐT`\0\0\0š\n,\0\0\0\0BS\0\0\0@h,\0\0\0\0BÓB\0\0\0@h¹ü\n\0\0\0€ÈT`\0\0\0šX\0\0\0\0„&À\0\0\0 4-„\0\0\0\0„¦\0\0\0€ÐT`\0\0\0š\n,\0\0\0\0BË`\0\0\0™B\0\0\0\0BÓB\0\0\0@h*°\0\0\0\0M\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„&À\0\0\0 ´<Iµ\0\0\0—\n,\0\0\0\0B3Ä\0\0\0€ÐT`\0\0\0š\0\0\0\0€Ð´\0\0\0š\n,\0\0\0\0BS\0\0\0@h¹ü\n\0\0\0€È´\0\0\0šB\0\0\0\0BS\0\0\0@h*°\0\0\0\0M\0\0\0\0¡	°\0\0\0\0M!\0\0\0\0¡åò+\0\0\0\0\"S\0\0\0@hf`\0\0\0š\n,\0\0\0\0BS\0\0\0@h,\0\0\0\0BÓB\0\0\0@h*°\0\0\0\0-ORX\0\0\0\0Ä¥\0\0\0€ÐX\0\0\0\0„fˆ;\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„¦\0\0\0€ÐX\0\0\0\0„–\'©B\0\0\0\0âR\0\0\0@h†¸\0\0\0š\n,\0\0\0\0B`\0\0\0šB\0\0\0\0BËÅW\0\0\0\0D¦\0\0\0€Ðrù\0\0\0\0‘â\0\0\0@hZ\0\0\0M\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„&À\0\0\0 4-„\0\0\0\0„–Ë¯\0\0\0\0ˆL\0\0\0\0¡™\0\0\0@h*°\0\0\0\0M\0\0\0\0¡	°\0\0\0\0M!\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„–Ë¯\0\0\0\0ˆL!\0\0\0\0¡i!\0\0\0 4X\0\0\0\0„¦\0\0\0€ÐT`\0\0\0š\n,\0\0\0\0BS\0\0\0@h¹,\0\0\0\0\"ÓB\0\0\0@hZ\0\0\0M\0\0\0\0¡©À\0\0\0 4\0\0\0\0¡i!\0\0\0 4X\0\0\0\0„–\'©\n,\0\0\0\0âR\0\0\0@h,\0\0\0\0B3Ä\0\0\0€ÐT`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ÐX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€ÅÿgÇŽ\0\0\0\0ù[OcGa\0\0\0°&°\0\0\0\0XX\0\0\0\0¬	,\0\0\0\0Ö\0\0\0\0k\0\0\0€5\0\0\0ÀšÀ\0\0\0`M`\0\0\0°&°\0\0\0\0XX\0\0\0\0¬	,\0\0\0\0Ö\0\0\0\0k\0\0\0€5\0\0\0ÀšÀ\0\0\0`M`\0\0\0°&°\0\0\0\0XX\0\0\0\0¬	,\0\0\0\0Ö\0\0\0\0k\0\0\0€5\0\0\0ÀšÀ\0\0\0`M`\0\0\0°&°\0\0\0\0XX\0\0\0\0¬	,\0\0\0\0Ö\0\0\0\0k\0\0\0€5\0\0\0ÀšÀ\0\0\0`M`\0\0\0°&°\0\0\0\0XX\0\0\0\0¬	,\0\0\0\0Ö@€\0Žöü‘í\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0ÿ€\0\0~IDATxÚíœ[lL[Ç×šÙ3c¦--1¥E¯ã‘ƒH¤J¨Á!á˜¶Äƒ„xñ DHä ª\"9/\'dÒº%î	çx˜jEÄ¥Bµ.APÚÒÎìí›®ÚvÇL3\Zcönÿ_&+k¯µ÷žµ~ûÿ}ó­5“áÍû3,:3```\0``````\0``````–nGÆû¥\0Vw–´¾Þœ>ET×Ü¬n´d¦B*8LeKiÖñ5™zƒeÞ2/Y7ƒQÚjöj‰W*»uïùà¶ûP–æ¡\r¶½Ò9¶µR\'ƒ”tª¨”~ßAWH×œq1«‹Q„¢ÒãÎEê-¯Â	aDdŸ°Âx\"½.?Ii”²ò…“V¨\rHÅ,Ž #×|º¡^RJ\ZNVìÍK‘TRG‡–ÜBj©öÖfN]L	—H# ¬ïöcÌšdþ/R,ë»©CH¤o|§ŒÄuè†z\\Hë“Ã\r`V_ðÚ”òSëÇÀÑ‰Ñ_{cøæ™‹Üb1Ôû•%Hym¡	ßöžu$pÕE¹sXn_QÖiÑBÆ.yö´£Ãì%lZ½Y²ˆ•å›æø=¢þª±.áÔÜ«ÒÂEûÄµgÊ7äùOkïö¿yF^ñß¢~¢|ãl•*=íjÜ¨Êš¿’Ê©¯þÒæPê”þ,Ú­¶_;{”JAêAY¾Z×š õ¦t¼,Ë‹‹ö4ód?“ˆTMÙqÏß°„Œ!,ÉbÔEr•;®mT’ô^ÏüGÐL—ë©¼S}^{þýñ»E¯ù|e9TO][-1?Uþ(©²»\\>¸ÚØÊò^Îÿ¼eyÈÖ‚*7êš^°Jteî²SÚP{N{8døÈž„Màû÷ÌªÏ.®0¶²D¨ZæÞYczÖë\n*É‰Ô¨‹Ê¥A¥TUlUÉRInø’g|gwq—¶W|h\\“\n	Ð¤§Û	™¯¥Éð©Mƒæ3«8¸·´£E8Ù“Ó²×yƒûLdeyG¾Ë:˜¦)\rwß¿\'OxÕª½»xÚPUsÅ3&Æ°x¼þ×á=wf¬»NQ§¤4ŒùXÿ!ëo\'i\\°\"Zk&AŽ‹×~–á0a!\rX€XÆ³Ÿð<ÕÆúEWñùÙÛö¾‹gØ{˜é&H,¡ëEiüÒë`ÙMÜi‹ÁJkÑ+\rŸ\r«Ç:ê	ºoïe,‡•~3¦Hk­Iq$^kz¥F#”˜I_ßàó¬à[yÚÂÝŒÉfæiŽ74Iz|ŒÙ?‚W7Åy$9)š˜e²è9Lp—³“Ú£7ñzk-,‰Áø¨´Nj_Æ˜ÑPfâ>\rõ­¬0“ómo^–•‡Ï~ým»K¢¬°ëZ>.\'´ñK›ò¶‰}líîÂÁ)Ü9°Gy–ÉÚ«Öo+‘³¤Ôdc°h“Rn(+&° ,(ÊŠw€‡² ,Ä,(Êê­Ê‚²³âkø­```Á\0°\0+îöÖFWŽ#£N\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(21,'sys','mobileSplash_medium.png','image/png',26323,'2013-12-14 18:15:36',1351,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0ð¼Ô\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0fuIDATxÚìÝil]ç™\'ø»ˆÔ±(K¦Ê$S.[²(É%ÉëHÎÄñ–tÅñ\0¨ È4R@ÜÀ\0“d€ZPÒ@\'Ÿj&e \ZH\Zp¦‘ÉT¢®nØ®‚Øq2¶4–YeYT$+\"Ý&©ÒÎPÑÆíÎsùJ×´òÞËËMþý@Ð´t—sÞs.õüÏy—lÿSm\0\0àã!§	\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\04\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0Sož&\0à#ÿ0ÜúXþÆö|Ë}é‡{vë:ôS- \0\0p]©ßðÇu¿ÿµ\\CëØ?Ì·ÜßGú»/¼ò]1\0à:íªM+\0|Üÿ1˜ß°ðóßOµþ8÷m;ÿâŸj.€9Í\0\0ÕÃ¢?üûÜòö	Y·fk|—\0æ4ƒ€>îêïýf9Õ)Ì¿ï[\Z\r@\0\0`Š_/oÏ·ÜŸ¾jù²\r­õþ¸¢§d×}­ëtƒ#0Gé0«E¹_¿ákón}ì²?:ôÓ¡C?Ü·m’¯_ï7+}JÝ¢†¡ßûâ‘ƒ?\\!\0ÌAî\0\0ÌÖ_ÐËÛýáßÇ×•Õft²ÎüõâûÊ$o\\õÅ\'´róÖw>(;J\0\0\0µuy”þ÷¹†ÖxX\Z›[Í¿\r­ÙùÕ\\Æo¼¹=ªÿžS€\0\0À¤EÝ¿ðóß/¿4_ðÈ_W—²KZ\'³Ý§\n€\0\0À¤¤)ù+}Vd€ògò©•þs€\0\0ÀäÌÿÔ·«ë–“ßòíJ;åNwOrkOžqÄ\0\0\0ªþ¥ÜÐZu‡þŸ¼¿sÞ}e€‘þîÂ…þ*Þ«ïƒ@\0\0`²ª›“§ä†M[ß;RY¿ü¡C?­â:w\\œ~tžF\0\0\0&\0ÌÓ›Vßßu¼²n9¯ÿm¥ï2x¶¿\0\Z:h\0\0\0Õšä´<‹—ŸÞ}²‚›\0#ýÝ»Ÿ®è]Þ}ö{‘â\0\0Lî—rCëä_¤»Âéù/¼òÝGÊíÓß¹cÛ/†¿“uÈ\0\0\0f^¥“óüë¿Ü³{âÁ\0Qú¿þÃ?I?/¬Ï´.ÕÒ\0\0\0“0ÜóZM^çì@e¿¡®¿ëÿy2Šû3\'®>1hß/ÿÍ½ýß)ýÉ]·¸ü0\'ÍÓ\0³ÇHw¾¥ú§—fç<7Pñs×4gw¾½í¹Û\ZonoÝøØ¢e­‹—µF8{¢»ûíŸ^6ïç7g\rÿ\0\0˜¬ážU¯ÊéÆs-uùÌ·g;z]tŒ3Í<ì®¶ì\r‹+€¹J €Ydpß¶êVæJ:·_œsÙ\'ª|…öæìý¿—½êô>ë3·¯È>x‡ê`ns\0`vxýoçêÛU<ñÀ‹O—zð/¬«~¢¾¿aqvp8sú|q,Á¹bœ˜—3å?€\0\0ÀT€ÝOÏ»õÑ|Ëý=+JÿwŸý^ú9*õ…õ“ÝŒº|JÀõF €YçÜ?ý»ò\'æÏŒ.Íûêß=™ç\nmËÍÏÀ5¹\00ë.ôÿë¿¼ðóßoZ=ñ}€¾:vþðOJÃvgÛôü¹†Öú{¿9ïÖÇ²ó/,9Þ1¸ï¿Nr´\0UËö?Õ¦\0f¡w>(Ô­Ùºö‰o-^võåÏöxééwŸùÞØ?¼ÿ÷fÑ Ýù÷}+ªÿ«þÕH÷¹úwh\0\0€Ñú~8³óP¡ÿ\\¦eÃcM«ïo¼¹½~QCÝ¢†3Ç»Ïœè>¶ÿµîÝ?-uûIî¼9;{.ÿ/xä¯ÇŸÒ´p¡ÿÄ?|yþod\0\0\0€Kà\nGÊè)S—/®ä5{ªÿy·>¶ðóßŸða‘d}ÿómKô˜>Ì^iÕ­;oÎŽ?«ÏŠ†â\Z^³ªë™3™.^Ö:ô{_ì>åPLƒ€f»¨ì[—fôgŽü¦pn0sâ·Å?ŒH°¨¾8aüíä\'ý¬­Üòö\\Ck™^¹yëÏ_~zÙâìlÛ\0\0€™´¢!¾æÆüžóZ+XÄ ñæöÁáLçñB{³ÙK¦ƒ.@\0ÔXiÆÏò1\n\0@\0\0àããÜ@qÄ3\0\0\0sÏð±Ê–1N?œ>¯å\0\0\0æb\0èy­üwïþiúaa–\0\0˜ƒ\nú÷m+óÁ{/­dl \0\0€¹ªï¥ïž9Ñ=áÃ¼øtzØŠm \0\00g-(ôïûÏOŽŸ:wl{û¾“~n½Á \0\0\0sÙMCû^øÎD•å_E0xõïž|ý‡’þwÙ\'Ü\0˜>Ùþ§Ú´\0S¡ûTæ\n‹—µ6­¾ñò‹kÝÿZ|•Ó°0sß­Ùº¼Ö\0\0®/¹†Öì’ÖÂéî‘þîÏ^GØ×[¸ÖÿË>‘Ùt‹ê`ZÍÓ\0S\';¿¡nÍÖº5_Ì-oûçÃ=¯\rúÙà¾m…×ù¸­K3+\Z²]Ç#	Î\r|øç+\ZŠýþõü˜›Ü\0˜\"óïûVÝï-2Àµ0x¶ÿøkOÿåß¶,Í|L®‚Ÿ<SœïßŒŸ\0\0Àõõ»u~Ã¢?üûË®ú_Kß¯üŸÔ¶ätÛr-À”3ÀLVÿ¡ñæöOýÿå½¾%;]³¯<\0\0\0³ÔÂÏ¿üê¿”øß~pâ·\0\0\0`.©ßðÇù–û«xbÓêûWnÞÚ®8o¦f@\0\0˜#àÞoVýÜµO|+¾é/N	\0\0ÀlW·fë8sþLhñ²Ö–\rÅïq\0\0\0`ÖË·Ü7ÉWhÙX\0çÜ\0@\0\0˜ýàÆöI¾Ââe­é‡“¿u\0\0\0`–ÿJ]>Ù\0Ð´úâ\0âg4\'\0\0ÀÇÆ¹m\0€\0\00».ôOòÏökF\0\0€¹aäxÇ$_áÔš\0\0`n>6Ùò½ïR\0¨ËkN\0\0€Ùmpßä+tîØ–~hX¨9\0\0f·‘ãÃ=¯Uýô£û_+ÝXÑÕž\0\0\0³Ý…[õs÷>û½ÒÏ+\Z´%\0\0À¬7ÜóÚÀî§«xâŸ>ºÿâÝƒ¶å™…õÚ\0\0`.¸ðÊw÷m«è);¶½ýßI?Géû\ný\0\0\0æŽó/þéÀëåöÚûì÷^ÿáŸ¤Ÿëò™»nÉš€©“íªM+\0L…|Ëýóïûf|¿ÖŽî-ªÿRÏŸ¨ûï»5kþ\0\0€9ìX}û¹æGo\\õ‘pìÀkÛ·9Ñ]ú“eŸÈ¬¹Iõ€\0\00÷È¼w¤p¤?38|•¿¢¿my¶u©v`:ÌÓ\0Sma}æÎ›‹ãzOžÉœøíGþ|Ùbþ\0 \0\0\\§nX\\ü€d \0\0\0\0\0\0\0\0\0\0\0\0€¹Á `\0j&;¿¡nÍÖ|Ë}¹åí¹†Ö±5r¼cøXÇÐ¡Ÿ\rú©†˜ÉßÕÖ\0`ò¢â¯ßðµ¨þ\'|dáBÿà¿üp`÷Óñƒv\0\0>¿|ç7Ì»õ±â•ò^&îÙ9øëŸŽï˜[ûRï7ë7üqEÏŠêàõ¿àd\0\0\0®gQñG¹<þ•ò‘þî(Ž÷m›»³¼}á£ß«{úÐ¡ŸžñOÝ\n\0\0\0®Oó?õíò¯”ï8÷³?Íw¢î_ô‡Ÿß0™‰<û_–\0¦ï··&\0˜Q%/þò?UÔO&•×åôªŸ»Õ\r_\0\0`UÿQãVÑO&ž¸à‘¿>ò»_<70ëöháç¿_«ª=Z&¿ùÛƒÃÎ\0\0àºE|Õ½äÃ-Ÿÿ÷ïž_sòÌ,Ú£ú{¿yÙðåIZ¸nkwÃ£2\0€\0\00çÕoøãy·>6™W¨[Ô°éý›×~]è>5+ö(ßr¥sþ”ã÷þ—¿ëð\0@\0\0˜ÃÒ™“Æ›ÛWnÞº¯·Ðnæwjþ}ßœŠ—]¼¬uÙ¦­»Þ/8m\0\0€¹ªnÍÖZu”_ûÄ·‡3o½_˜Ùkä¹†Ö|ËýSôâ«ùã¿Ítwâ\0\0\0s5\0|±V/µxYkË†ÇÎ\rdÞ;2“×È\'ÙiÂ}l¼¹=vPG \0\0`þ†mhÌØß+5­.^zï:ž™ÁIæÝúè”¾~ëÆÇ¢úß×«#€\0\00ç~ÃÖ´úÏŒŽH?Ìàhà©ëÿ3vôgÜ\0\0\0æ˜ü5\0K/€#ý3s|\Z–ëZ¼¬8»hTÿG,\r \0\0|ÌÕ-ºX÷Ÿ›™ä5¿§q¥Ò]Ž#¿Ñ@\0\0à’Óç¯óœUŸ\\Oæi€¹âÌ‰îÒÏg27,žø)ù–ûçµÞŸ]ÒRZ¸w¸gçH÷pÏkñ}6ïìàpq¬óÂz‡@\0\0˜#†º_«É*`€ã–ìãO”[Þ^¿ákón}ìÊ^û¥Q¼#Ç;vÿpèÐOÊín_8=å™¡ïƒŽ÷qP\0\0\0\0æŽ¨°kû‚Ç¼6ác¢âŸÿ©o×­Ù:á##$,xä¯Gú¿yá•ïF(k¦þ¦ÁÀYƒ¦–1\0\0S¥p¡¿¶ ûíËôeŸ¸Êò-÷/þ·¯”SýøÏ@CëÂÏ?’@™3ü÷¼6¥VNÈ@\0\0˜¥vÿ°V/uæD÷Øî1ó®øýuÿ¢?üûêfê,ÿ¹Ã=;§´ÅÆ†\0\0€9fpß¶Zu›ÙûÌ÷>¬×ó™†…—WðùëIý{°¼½œ{4uÍ5aÈ@\0\0˜í.¼òÝÉ¿ÈÑý¯uîø°ò^Ñpyí>ÿSß®Á?	ËÛGîûöø+¤„¦¨­ºv|$]\\r\0\0\0æ€¡C?äUóÁ³ý¯ÿðOÆþIë\rÙ±ÿ»àþv­Öèmøý­‹í?7n¤Ùù·SÑP±›û_|ºô¿Wä\0€\0\00œñOÏ½[eˆ²øçóGcW\0ˆÊxì\n\0uk¶–fö¬‰;þðß¿õ~aœû\0Ã=¯•9kPEÞ}ö{ƒc¦\0ZÑuæ\0\0\0sÕéþ´{gÅ Uÿc»Å‡57}¤2®íRañ²Öß½{ëÎC…ñ#Mù«”ãèþ×Œ¹üŸ¹¢›\0\0À\\²°¾˜Þþ‡ï–=Ï}ÏîŸ>û\\Výß¾\";¶g|ny{i‰ß\ZjÙøXÿ¹Ì{G®ù€¨þ;ÿ¯/ÖhÎþØÇWÿã“—Uÿ–\0\0\0æ¶Ö¥™³o=5ýÞöu¹jéÿòßüÑ«÷äe‹W¸}ÅGY·æ‹S±©-«[ÔÐu¼0ÎzÃç:ölûÎä3@Tÿ?ÿ›?ºìu\"ç8a\0¦H¶ÿ©6­\00mÞù Ð}ªøCÓêûãkÑ²ÖÅË.^Â?vàµ3Ç»»wÿôªUuTÿwÞ|yY¼èÿ¾¶\0J\"ÝÿZÛòL{ó5kñ®ã™Þüš‡þä¿DZ¨aõ?þ› \0\0Ì1\0öõÆŸms¬º|ñŠx”ÅWZò¿wNÑFî}ö{ï>ó½xëG×ŽW‹¿ÕU89Ôpß×þ¦eÃcÕ½ÅeØ°0sß­Ùx_\0¦È<M\00ÍZ—§¸‰nLøà¨þgªC|¤”#ýãÇ½óæìÎCý¯þÝ“M«ï_û…oÅ÷r^¶sÇ¶½Ï|oìÔF¥¨sg«ê@\0\0¸î+Ý›³kš3=§¢Â.ôŸË\\vC`Ù\'Š!a6Œ…=ñÛÂ83rÆŽÜwkd€ÂÑý¯ÝÿG7··n|ìÆU÷_™Ïö=ðZZÑìª}œÒKYü@\0\0¸žc@ÛòøºX^§å·f[|úüÄ{‘2@lß¥i‹/k]¼üâð†StŒ?\\8rÎ]·¨þ\0€“ÙYþ–3V!2À·gß;’yïÈ‡«œ9Ñ}e\'Ÿ«ZÑP¼¢ç€\0\0ÀFú»§b€bù~übížîK”ãö™Ö¥Ê\ZÛ,ûDq„ÃØ…\0\0¸¦áž×r\r[§â•O}t²2-¬/^Ë$p¤?Ó}ªp­ð[ÑPLúü\0\0\0T\0vÖ­©}\08s¢»Ô•¿Š\Z=êûÒØ†“gŠ’F9/ûDñç%2zû\0\0\0TcèÐO¾ßPÛ—íÚ±­ôó$‹õÔ½G\'€Ù#§	\0æ®Â…þÈ\05ÙÎí€%43€\0\0À¬qá•ïF¨áxñé±³÷,ûDV#\0\0ÌQý¼þ·µzµ(ýß}ö{¥ÿ­Ë·0\0\0\03``÷Óƒû¶MþuÏö¿úwOŽ]±«e©Ö\0\0˜}.¼òÝ‘ã“|‘·ÿá;}cfÿ¬ËgV.×ÿ@\0\0`ö)\\è?û_îÞYå}€tí¿sÇGžÞ¶<»°^Ó\0\0ÌÖ0üòŸ¾ýßÛ‡§G÷¿öÂwþ g÷GfjXX\\Ù€ëO¶ÿ©6­\0pÝè>•ùõÙ–µO|kåæ‰;s¢{ï3ß»ìÂft%¯nÏZ®@\0\0`nd€w>(Ô-jhÝðXËÆÇšVÝ?}@ßG÷¿uÿØÿc«ÿ»nÉV±\00\0\0\03–öõ‡?ü“È\0‹—µ^µâkÙ\'2›nqíàz6O\0\\Z—f–-Î¾Ó]8ñÛ‹2x¶¿ïìxÕý·¯È¶-×x\0\0\0sÐÂúÌ}·fOžÉtŸ,tŸšà‘­K‹¥¿ÿ\0\0\0sÛ\r‹ã+»¦9I ÿ\\æÜ@áÜàÅ¿Z² ³¨>ÐÝ@\0\0àºR—Ï¬h(~e2öø¸³\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\00eæiàtvé¹ìâþlcü|2ÛtÕÇÔ—dNÅ7Œ­Ë.)œÒn\\UœKG³­q\"\rfëJ\'Ï\r…£M…î……3Ú`ÆeûŸjÓ\nðq3”©?™kŠ-¾RÝ_…(é\Z\n}ñ=\"Á¼Ì€V%Î«}ù=¹•ãœ3ë‡wŠ\0\00MÒ¥Ù¨Ï®ZôßØ|k|o\\~S}ýÂ+ÿv`à\\ßñÃñÃ±ÞCWþíŠ‘ž¦Bw|—>¶Ng—¾>ï¡ÁLñªÿâ%KãtŠïé¯Îœ>§M|Ÿë2ƒwïjéÔb\03E øX8škíÉ®<’k¹¬âoj¾õÆæ•Ë›ëê”ÿjQÉ-–tG{¥<¯|$Ó²\'Ÿ‰Â.¾n(ÕæÏê¿nþ‚\r›o[}×•éÚÿVÇ›/ÅÉ³\'_Ä€¦‘ní0#Ü€ë\\OnåÁÜºsÙÅé£>ki[Û¼²½¥­½foÑÕÑÛÙÑÓµwðÂùô\'\0n~Wøøøå¼/Ä9¶xÉÒO?ñõÒ…ÿ+\rœÿÅ3?è;~8Àæ¡çõ\0€),ý[V¶ß²ú®\ZÖýWÖv={ßÛ³=õÊèðýq:Óöäï‹ýÒ7\Z—Ý4áyòO?þËÈŠ-#qzh=\0\0¨ÓÙ¥ûòKóù´­¾«ýî‡Ç¹.[[Çzí}ó¥ÒP¶‘·\r¿klÀu,]þÓìžÏl-çñ]ûßzãåmñÃ#ƒÿèÄ\0˜~Æ\0Àõæ`~ÝÁÜº)ý“›o}ð‰[#\0D‘wæô©®Üª#Ù–õÃ;õº.EéŸî2Ý~ç–2Ÿ§åîÏ\r^8$×b40ÀôËÿÅ¿iÔ\npÝ”boÌ{øpî“™ÑÉ|îäËQ“ÕÏ_8#©#Þ=›Éöè½0œ+N\r™ÍÈ\0×Ÿ£¹ÖøJcËÖ¿~ðÞÙÓ§eÎ./Ö†\0ÓÌ\0¸NœÌ6½=ïSiÆµw?Ò~÷Ã³a«b3nY½iÇ?ê;~ø`n]lä¦¡Wõú¸Îbg1p.k®èYMÍÅ{DU¯AÀdä4\\zr+K“0>øÄ×gIõŸ,^²ôÑ­ßHýC\"\0Äveê²ë\'\0dŠ ~þM \0\0ÓäýÜê4Kãò›>ÿ•?OëyÍ66?žFˆög·ÏûìéìRî:	\0UÝ\0@\0\0ªt0¿n_~cft–ÏŸx²¢õ¼¦YÛê»ýÒ7êæ/ˆ’1‹û\0\0 \0\0•I3ý§Úzóg¿:›«ÿ¤qÙMÅ”2A¶Q_ \0\0€ÊªÿÔó§üù×gI¸ç3_ÊŒöJ÷.\0\0\0˜ÀéìÒ_å7eFûýO]õæô©©xÙ–¶ö\r[Oæh®ÕÑ€éd\ZP˜{†2õ»òfê/YúàOÖªÖ?Ö{èXogúáÊÜØ|k¼ÝÍ+[V®|_£Û×o‰wééìØ“¿ïÓ#GM\n\0\0pMûòÏe×Í_°ùs5è÷ßµÿ­®ý»®ZôUŒ£~ãåm-+Û£‚ŸätC÷|æKG{ÿrðBqwÖïtX@\0\0®âd¶©¸ªîèj_ËnšdéßñæK¥~>u™ÁFŽ.Éœj(ôÍ+/É/ÌœI³¼eëû³§3KOæš3u=ñ`Ã–Ç«Þ†ˆ.6?q\"v§e¤Ó\"Á\0 \0\0—ÊÔ§¿Q|ß¾~KÕ¯38p~ûó?*]õú{E¡§i¤ûÊGF(þ§iÊŒþípæh®µ+·*rH<ýg?y*2@Õ[Ò¶ú®tóá`~Ý½C?w|@\0\0>¢+¿*­»4™¿}\'ÿâ™^8?¯é¹cd×ÂÂ™òŸ9!¾\"\0D‰Ù½ý¹¾ã‡«Þžµw?ü‹gÅ«ÅKU´\0@uÌsÆP¦þýÜêÑ¢ù‘ÅKª\\I·kÿ[©ú¯Ën\Z~uãð+Õ•Ý7Žnz¡e¤3si`@uÛ“ÆgF×3vˆ`\Z¸\0sÆÁüºÁL]Ýü·ßYe—›c½‡R¥ÞPè«ºôóëc`ýðÎ…™3së\"dª½/»³{ûsG²-wdvUšˆú³38x m@qÈÄŒÎbt:»4NŒËþ0Ž‹;*:™mÊŒŽ~YR85§w$Š×Ç¾\0\0ðá?ðiìïªõT7óOß‰ÃÛ_øQªþïúy­jÖÛ†ß-†“ÑÐ¸ü¦*Æ4·µG\08—]…ì„µK´Ã‘\\K4E*ÝJVŒô4ºÓ‰i8ñ•ê­iÞ€x÷“¹¦xëØýRÍ7ŽTÆï‘”>¶‘ š+Úí\\fq:Í®ÌK§Â™ÈN©ÅÒ÷Yµ#iûÓ	P\n0ãýºÂ`\ZÙ?Ë„€\0\0sIW~Õd.ÿœãåŸ¤ž?5¬þK J«¨‰£Žo\\vS¥Óƒ.^²4ö+¶-Êšñë­£¹Ö=ùû®Z½E*8’iy?·zýðÎ©+Ú¢öz}ÞCãl@4Âšá·k¾ñ¾)óLXñ_~Ü3uÅÚ÷R™õßŠBO¤”ÃEâ¨•f[ã¸Œ_%_ù¬8™KOIScE´‹€7ƒ÷yÒ	p$Û’†\0Utô3ÙLœ™³jw\0\0(KOvR—ÿ÷¾ùbßñÃñCÍ«ÿ$Êîtaò—·=ú¥oTº‘Ëšõ\Z¿¸‰Ò?Ý‰´ÐÒ¶¶ye{$‡ÈñÄó½]ûßŠ\rˆ=öq*\nÜRõÐ¶ú®–¶öºùcúNî;ÞÛÛUœ\Z5ê­\Zn@ºÝ©æ²º?\"Vãò›êëÞØ\\lÆåÍW6xlÕà…sgNŸ:{ºïhï¡¾½±¢…»²«ºr«\"	´ˆ$p]Vqž\\ÙhÑb£\'Ló¢%¥!4)¬F<Ž#8¦ÝÎG‹=}*Z/wŠv{òÅÉ²¦¾ÚØ—ƒ¹u—}4.;F?Ó„¼c÷%>¿9~x`à\\|öÓ	0vw¦í¦ \0\0Õ8škMÀ-«7Uñô(‘ß{g{ü0§Çf€¨}£fŠ°±aóãµ}ñRõß²²ý÷7?>vtªá¢o[½iû?\Z¼P|ðæ¡çk»Q‹§ê?\n¯ÍŸýêØ\rˆÂ+¾\"D;§\rˆGÆL¦»E¼]W~UT±¥»\rñŽ‘yb7Ë¼Á’ÊÁGnÏ<œJÛØÂˆIQÆé´/¿ñ`~Ý-#ûÛ†\\1àZ-ÖÔ|ë8¡4þªÔªé‡ÔbiUìˆv‘¢zN]¿\Z\n}ÑhÓP7_VúÇ‰—rïø+oŒÝ—ô¹›	SRM»“’@¼EK¡óº9\0\0®G²-©ö­nòŸ½o¾”íú…ËÔmdD‹xý¨\'\"lÜ¾~KE›Z?A*à®•RõEö8ãŒ£îyð‰\'ö“§ú³QÚ¦Á	µR\Z}YõÙ|þ+þO?þËBª^Ù öw_nc©ò‹½¾ýÎ-“\\ô­TâÐD]ûÞží‘b;ãxEÅ®¶Í5ýâùU~S©ôF‹@8ÉÅªã@/.¾Î]ƒç{:÷¦5+âìJq4ZlŠîœÎ.·(ÝÁ¨í	¯Vl®®Ž÷÷¿ÕÓÙ§ÙÁìºžìÊ5#o_u%àº”ÿ‹Ó¨`–{{Þ§âû?Ý¸¼¹ÒçFÉÒ1\Z\0~xÇÅU½¦LÔCQ\reëûNNuF™~ÝñúÙÓ§–_µ¢z3ÿéxÍ(æ¶|î«ã¿Î‚EK²™lìòÉlSK¡³.3X“ýŠ\"é_ò›ã‡5Œ6Þ¯Ôü¼e+>•b<eE¡g~æ|Eo(Þ(ÂFìoft¾×Øå›o»3ö«†‡©~þÂß½yÕï­½?Ÿ¯+ö.DsEêh,œ¨tƒSå;ÛÔ|kEÕö±ÞÎ8LqBNþRz¼{|@\"ÆŒdò‘Ðâ¥F«zªÜ«ÖøèÅ)»yæt_œ«ñ¦éTFËe†kxtbGvÍ{àBvA*ý7î«ñ½¶\'@ñr@ã7ßöû)ÛÄ§5väpî“<n,ükmw\0€jDeÿ6Ç÷>ô¥(D*}ú¿ìxîtß±(¬o™ŽK¼‹2gck£Bjº4Á9vïxndxhÅHO”SWîþ¹Ûâ‡ŸøzT®¾Tj|\'Êš(¦£¯ÉNý:¿¾/»,vgóD	$3zÙ¸·«ãüÙßæ3#iÊ—¨Â_«{4]÷˜ñ©Ï-¾WqÄË/j£dO1 jñ¨8£#2]yfs\0ˆwêÿL¶!•Ë÷?òå)m´8¸)DÑ‡8ÎŠã¹›ªNWµ\'ß¡üšôFcn¿sK9çüd¢`4WìÑÙßžŠßÑŒñá]V8V«Ýf-Ál—&$¹qÜNÌ×ræô©žÎŽbm4r`z¶¶i¤;]ÅãåmQ…—UÃuu¤e‰›\nÝ×Úý4‚³œW‹VJ%Er¸VŸ¢Š”&`-þ¥–¶µñ½¢{â-J#Œ#fŒÓÑ¨¶¢¹Úï~øÑ/}#Z8þw_~cÔ så£ñ«ü¦4+T´UäÃ{>³uz\Z->ŒnýÆÚ»IG9\\:C&_ý—ººÅ™dÿ¥ŠRMœoÑzqîE–‹Ý9]š\0`•\0TñÜÞ®bõ_—œÎÞ½ë‡wÆ;FöØ½ý¹	!á_Fv­Yê/^-©ËõSq^ÑÑ	OjÐþ¹–ÒÌ?SÔbQö¥²;ªð¨,ÇÜœËnzð‰\'/ö¿´1³\\ldWnUúhLg¹\\’‚STÏqz”j÷É„™±]ª›ìk2â}ãH\0\0`&\reêÓ`Ðê†\0¦z§yl_ÔñiDi¼{Ú€qDHˆ¨¡¨VÅS\nïçVOþÕÒ‹ÄNQMV*¸£\nlz®a_µÑ¢îLWµg{±|óg¿:ýår)8•nžL&Íµ¦03þ0÷éÉ)ìÊ?P“h€\0\0T¬Ô¤Šœ£3‚û ×ª+|ùJó$¾ñò¶4ùJQ÷ÿâ™ÿ”Â„«w\rœ«hšGo˜DëU´pÒ•Òâ™Júÿë¹ÞC™Ñi—Ê¯þg¶-i¿ûáT€ÎæP*µ7ly|ËåRpŠ¢y2 êìÔÔñŸñÝ)e€âì@ùu~ÃõÊ4 0«Ì5UWý—ÊÐÌ´ßHÖ¿ªç½o¾x`Ï«-mk£HJ÷1Ò„ôipBªþÇ	zCáèÉlÓ±KûR¦–¶â”©‘1Žf[o)T?ùiªçÒŠcå?+mí„sDFûü*_\\Ø!ZfÆ+¿’âÐÓ}qÔbßcfÛBQïçV—†dÜ¾~ËlØ¤”~ñÌ\"oG)Á¯¢Õ6öå7¦>f[Êb>=`íÝìÞþ\\WnU$ùÉ,g\0@5Ng–¦´Šçþfôòÿ4/\\:æ—ËÀæ¡çæ×Ì­¼p¾x¥ÿŠ:<j‹	gO×Ñ£´\Z8_Ñòæ•íï½³=1UïE\Z€QÑåÿRV¹ad¼–ÊÔïÊ?V‹òqVuíw?Üw¢7Zä“kÍ˜™Cvi”Ë)¥Ô|±¹Ze€8¬[†^(s]­4hftÊ×*îÿD–îí]Økt¹ßÌè:ÙËš‹‘uùMÍmU®É*>;‘ŸãÃùÜïa\0€i5˜­«:\0”ßeêÜ6ünËHçÑlëÉlSÔ:©;MlRÔ”M…îr®.G<¨ËF¡¢¢+¾Q#Fo\ZUcuë—`n®dTnÏèÀëØÇñKÀˆFéÅïùÌ—f¼çÏ•b«ŽöþeZ)lö”€Q[gFo˜lØ2Ùê?ªÛ³§?rV4.ožÌDñ¥È\0çF—Û8üJ9ÏJ#Lâ^éÝŒø8t¼ùÒ™Ó—ŸØ¶#‚‹ŸöØ“Ò–Ç«Ø¯½ñôød\0\0€iviÐjöèÍŒ.Ð;³»µþ-…ý·dª¿ \'·2-0\\þ³\Z—Ý”zÅsï®¦Òåÿ+YÐ ôŽvmºê”¦ck\ZôÅÙdVx½ëíêèéìˆZvl-˜¶9N›–•UŽ]ŽgmØüø/o+.y;òîl¸	P“ÈÔwâpœHQ\"_Y:§hMWé:ÖcO¹ÔyæH®åh¡µœ®wé«h‚©ÁóÛŸÿQéFSDÍt—&}Ò£‰Š¡7³ôd®)Åæž®½Ñb•N-¡7v$^¡êü\0ÀH“ë_]xÛFD\Z[=\r‡HW1£Æº#³«Ò7ÊÔ/‹³MÕ—©²\\1Ò3~-›ÊÍª{±GSì}ó¥k\rH×€£øÛ½ã¹Uëˆv¨¢bŽª4]cž\r7ŠcRsÅF‹\n»ºÈ‡&N†ñ“ô?_‘ª¿p¾~Kä±x—}¹€¨­S¤¹¥’s¬TýÇ9vÇÈ®Ë?à…K?G°ü*¿iðBfÇó?ºç3[+Š¥ÀïR\0€éSšŠ»qysåNúaf»\0ÕÄ’Â©4¸kÿ®Š@ºŠ5V<·Ò±iúÿLqvÎ\n– ˆÚ1µù8MccÒª{±GYŸÞ(¼ØµËÞñd®étfiq.œßûæ‹‘6î«UÔÍ³§Hªþ‹]eî¬&2½·g{iUŠh«–‘Îh´ËŽQ”ØÓˆ‹qÂT}á<S¼A±õŸüW©sÿøÜÒi;Uþ\r‡Ø°Tý?t>‰DHx}ÞCýÙÆ7^Þ–©ðVp3\r(Ì^¥koU\\‰¼pîRÊ¸š\"Õ:Qý”¹ºp’†Bf.MæS‘£Ùtùÿ®ò?¶-ªÆÒÖ^³–½üI¦º©]¶í©RÌ¸wèçŸz6jÁ[FöGE[úºmøÝÃ¯<2ø·¼›eûÙOžšpM†«&¨t¦Ru¦”FÊ¶ßýpŸ…¨}SõŸZlóÐóÑ\\W&´h·;†w¥öŒF‹ì´ãùUÑhqÖ¥:;…–ñ÷+¾/ª¤»Ñ±Þâ©e}™³3¥±øé~T´Céº\0 \0\0Ì\05YæÒ%öò¥R,uæ©¨âL«7W²\0sOçÞÔíjœâìtvi*¦×ÞýpÕšg&~ŽÊ>\n»ñokDñI –îEýWi9[º8=³ëÂ–FÊVq{÷ŽçÒ^ÇA™°ÅJ\'Û§Ÿ­ºÑRP›[®%‰oª$Ž.ˆQiªH“v§xþ”—ÒXöÌuq\0àã\"])œ©9@§(d.­m\\i\0ÌÔU”Òåÿºù*êòÞžíi;Ç©ÏÒØß4Ø´ÒxãåŸ¤ê?ê¹´Ör9ÎÜ;ôóªËÙt}:ÍF5SJ‹þVüÄ®Ž”ã T4Œ!Ž`©Ñ\"BTzá¼”Uj²õXé´‰“¹¢H»³qø•t[£ÌÚmÅHÏõq\0€9)Mç_œÕçÒµÉrÔÕ/h½Šß“­ Pª8[Ú*èýEUªÎÇï›‘rHc#]¤¥ÓÊéü]ÛrvfE‹¥¾p•öþ8‘)Åà*1§F‹øEsz\n“gq\\ïä×¢¾2ÐFºˆy}ÞC¥‹”ËÌ\0ÓHƒÉ¬¡\0@5f¶ßÅlLêÊü~…×°SGö#¹–¡L}™ÍžúfTTq¦+ëiHî„µlE‹S-»÷Í3•tþ§œÝñüÊJ‘&“Á¹¤ÒD™‘â*íýÿÞ;Ûcg£ä­z\n£h´ôÜˆv•Þ9)Í›î&c`à\\Evóç¾Z7AœHûò9ïÊ<±—NÍ\0o¾tåiuÿ/žùOigÛF\\O·þ~fmÉ›)V]ÕMI~]j)tÉ´ôtvœ9}ªüf‰j{÷Žç¢è‰PNõœ.ÿW2mN©fšµl*g7\r¿úú¼‡¢õvoîžÏlð)Q¦Q\r3X¦{&ÍÎÆ¥í=¯fF¯aO&½ÄŽÇ9§D”Ë•öAJkQÇs¯u=Ím•n•/NËÏåÏãÆ)w.»8b@|5úš\nÝ‘ÇŸ³?e€=ùûú/4F¤Œ¯±]Ñ\"ì¥ÃÎä;†wù×+w\0`ôB±÷íUW,úxj\ZéNÅ\\êm_¦b/ ÑÎ<eÎTÅÚLÅé‰&\Zþ›ùpY·Š{ÿ—jÙIvÈŽú/\rˆ\r.ç’v§T§ÎÔ€ÓÙ¥éžI¥–dGdj>0Ém¸mäÝLå}ÏŠ\'ÃhhéÏ6^ë\n}jÕt¥\"£«oýƒ¯üYq–ªùÒ»Ì­Û>ï³/Õ}ñíü§ÞÏ­¾ÖýÃ”ÒôP)ã•¾Ja/ ú‡ë¼ÀÐÀÒRè<˜]ÅkE“è7¯l§Dý}.»xüZöh®µŠµ™ºöïÊL4ü7-ÑZE-[J“¯eSŠˆv8’k™pbøâ¬‘iÆ¡²×\\3å=\"‘\'?†5uëŠ-éíì¨hPxé@Gu~Õ[(éãàö8\\Å*\rÑ&îÉldå{ïè±ÈKqpdŠ!6JüFŽ.ÉœŠïc7 M§ÓÉ\\Sêí6vO¯ƒ¥\0¸®DÕr0·.j¦(‹Ë¿Hu[±Ûô…óG³­·Æ×˜.ÿ7.¿©üŠ3-Qœ™èòÿ‡ËºUXêõŽ^x®á|,ë‡wžË^\\jpàü•#’cwŠc…/Í84ƒýª»g;uq­ÜBOM6#\Zÿd¾©¸4XfkEOŒ)š1êì†^5Z4úâ@¼÷ÎörzdszÇWDât*ëíŒï	¹‹y#v¤´ZœNš2Ý~«€\0\0\\\'~gt¬ëoqT-©Ov×þ]õÒ‰ß!;©b–žÔiüá¿™K“¾WÑÿçèh-ÛTè®aÞ;ôó´@ìîíÅE…K-90p.jÇR¯ô*fª­tÏ¤ÒËÿ©Å2£w\0j²Ñøû2«¸Tß¸¬9\ZótæšÛgãžü}‘fÛï~xò£}Š·JVß•Žf)ôèM´¸u¾)«âÈŽ?`\0\0€:é¦Ë+-êG‡™–ÖžYQÆÍ¶fëR%´$s*MéSÝ%í\0Šuj%ÕX\n\0iZÆkurˆ—­b–ž‹ëL&(”Ó¾Wzc§bnÊ\0QzÉµÄÙ•¦\Z+-\'<ã“À\\JM•-äü›Ñz·†\'LqòœL]ßñÞŠÀâ‰VQˆ“ù`n]œ“o¼¼íÁ\'¾^Ã¦Îí#”îÄÛueWuåVÅ~µ¿ë\Z \0\0Óªt}îlå d(S?ƒÿºŸÎ.Ý—ß˜:r”¤Ê{òÅêç¶‘w+ísœº)GSQÇ‰¨Û¢\r£úy?·úZÓŒÍÒSæðßRXéqLCÀ£ú¬yÏì´8Ôé‘¥{ÆvOEfÃµáÒØÙºù+LMÅaµµ]Â6\Z$Nã³§+{Í].;ÿ/³fäí]ù¢4ïxó¥öÊ×‡.ëRBq|{\ZÀ‘2Þ+>;)	ÄÇó`~]ÓHwŸD@\0\0¦Ð@Ù³¶©<&€8\r¢²Ü“¿/ý…ï¢KC9£òHÆŽæZ£¯´ŸIÛÈ(\\zºönx¼üb½mõ]{ß|ñH¶åŽÌ®«–›GrÅdrKeóÿ_**æ	‹§s™bo–EK\Z+ÚÓt1{êÊñxå;†gi?R,©tÔÄÀh$«mî8Qœ²³ò{&ÅwK¶xS+NÎ8=ªXð¸\"Ñ˜ñuûú-‘Šâºö^(~Tã+>V·\r¿ën\0\0ÀKÓDØRá<è™âuÓâ°×b/êÂlylvªþ—ß´aóãWö}ïÚÿVÇ›/EH«(;Nä×—Î½åL·¬Þ5V4ÈéìÒ+Kê4Ih4ZùMýáðßÂÄ_]wöŠV‰\"I¥¶w\0RY<pá|uOÿFÜúá)¾ñò¶³§û¦è>À•IàžÏlŸÄtC +·*>±1µ\Z;ÌZÖ€Y-]W®n)€ÆeÍ™\ZÕL©úð‰\'¯:ò5\n÷G¿ôÆÑÁÊñàñ»I\\Y¥\Z%\"DùÏ*®í5úvQè\\ù·)\0¤Êôþèåÿ8FSW0õÕº;ûÇGZFcf½7þ#Kã­#£îx¡‚¥š\'©®~Áíë·üÁWþlíÝ¤†wåˆÏc™«\00 SåRA¡i´ø˜°ò˜\n]ùUç²‹£žØüÙ¯ŽÓE\'þ*âA)TôiÍÝÒ5ørŸ5z» Mõ3Vlmj¨Ûï¬`þŸ2‡ÿB9™¶”z:;þéÇYÎJm5Ô~÷ÃŸÿÊŸ·¬lOaøõyÉ\0 \0\03ã†‘â¥ßÒ´ŒI3Vte½&¢nx?·:~Xµþ	{¼Œ®iú¥T‚_Y—cIáTêã‘zá—©y´{Ï`¦î²÷J\\¼EPvwóž®Žtgff\'Êäz`Óð«Å‡.œãåm?ÛöT¥ËOF|#±oØòxºp €\0\0ÌŒR?æŠ®s\'M—ºTTXO^W~UTØuó”y5½8*±ª¬’fô/ÎÃSv‰(ñÓ5Î´àWIúßŠÆ_¾?z¶œá¿PÁÇv¤ûÓƒÏ¦TÉÇó?úçÿÕ{{¶O[§ Û×oyð‰¯ÇçW\0\0˜ó2)ë­ø2s]ý‚Ôù²bwªõdW¦bºüùyRÏûJ{+E‘”–Jxïíå?+ÝèÉ­,U6<ÒÝ[Vo*óEÎœ>ÕÓY¼4«ÿãŸ\'é‡Ô—¯üOýúá÷ý<ýˆÙ½ý¹ÿþôØñÂ*Š»U‹ß>ñdúHVÚ7\0€\ZHE@O×Þ*ž›®vOç€R1]ÑbºUKJ+ê-]Zä+Mú™¹4ü·qùMåOÑ3\rÃ“tgJûqEŠøU~ÓëóŠ¯(øÞÏ­NqŽjœ5Ë`Ÿ-€ÊoÅ?2À§‡ž-ÝÈœo¼¼mz’@ã²›R_ ø˜Ló-D`\Z˜f»(1»r«úŽ®b=à¶ÕwíÞþÜ`¦.*¼ééªžŠé›o­zå²ŠÜ2²?\Z§x=¾«£Ìé;ëêD³Dýt4ÛÚ’é,¤ŠKŠ+\n=sýìŠZ¿8¡êØ£³™Ø«}™Õ-ÓVCU¯„]W_\\8lœõw«K¶¥h1¢ý×ïÌï,.š‘mM©5’@\n±=ñY‹3ÿªmMR|\"zFÞ—ÛhbP\0€iuCáhqP`¦.þ%^\\á\"A¥b÷`nÝ4€sÙÅ)\0´•Ý—fòåQZ*áýýo•?óÊöh“¨¥Î,Žç¦ò·tg`âsiøo\Z„PþqŒ÷:ÖÛYQ­VÎR²UÛ“¿/¯”ÙÒÝ†4±R1S.ÓvïÐÏgjUàªWÂŽ²8v¡¶–:ŒU\ZkûNÎTuùÿJñù¼:4\\\\. ’ÀÉ\\ñ¼í;~8¾R¸tgùMñ½üÞwã»ç3[ÿùÇ•èË\0 \0\0Ó*þéjì½=Û«X%´ýî‡£ØM¥ùTg€_å6¥\"©ÒíœÌrWm#Næ›z:;Ê¿NQ!­’V,¤FËÄ–•íå×LiøoôÓpu|Ñ¥=ºêâe5©þã`mØrù‚ÊqÎìÞñÜà…ÌëóšÁ¢oÙ+yVšÊ©†]€¢úOT*]“xptá°2\0Ä§üqN6úæeVŒô\\Öòñ‡)	d†‹‹º<¾§m‹ÌSš* x[`e{s[û$oÄ¥AóÅÙ•M\0\0`\ZÅ?ùQ«U×(•ãQÏý*¿)ê‰q–#¤(DRùRÅ:¦“Yî*ÒÑÂÜ™H8ïïßUþ[·´­6‰VMÅÓ-e\'–‡ÿV˜¦¢¤+Vl½‡Ú3Wtøâ+Þ4ž[Ã*ü`~]ªþïùÌÖ«¦µøÃÆåÍ¿xæ‘\"*lz~FÎüØåØñt½|éK$‡Z¥¦“¹¦±¯\\¾££ù„\'vÔñûrÇŽ»H¹ô`n]„ÌMÃ¯^u/âeo>šòIlaJé‰)ìÞþ\\ãò›âPV4\"ÿ2‘\"â„/¶À°ßÄpý0æ€ÒÅæ÷öl¯âéÅë»£k|NÝ„¥¥£Bªâ6EºrYšó´â€4:Ï=¯–ÿ”4Eiªþ£qÊï>Ô;:/{]f°Ò\0ŽàÙÊun¾´6S\r£ZT–©Æ9XËn*MSÃw¯ôÌÏT¾FJM™1ã¼\')Í£•†ÔW–lG—ðÿNQ|pvåHÕêÓ¿öîGâ{\Zo¾}ÞgÇoÿ´0öÃ»îúù#ƒÿ¡mä@zÓhº4ƒÐ/o«nAñ±iÊ¯b\0€i•¾­nêºú6_œÐ#­xUs»æ=–þ½ç3[+}ni©£´êY5`´¼p¾üé€¢º-ÝKI“–)õ·®¢3UiJÇJë°T£G^«\n,Eµ¨/ÓY1~+¥wŸ¢ÓfB—æÀ­xŒ‹©)[ƒÜá6\ron«,\0ô8œº\0sàWùM¥qóð•?{të7|âëíw?ßÓÏ¥u²ËÒP\nŸzvËÐñ{#¥ŽFuËŠ•>&)\0À4HSF=QÑœ÷c‹ÈTÉíËo¬ùÕÜRue}Ž{G{Ô¤NÏÕmÀÂÂ™KóV²*ð¥ºåYN£c3ÿMJ½8*-gKY¥+·jòë`~]ºØœ`žPéVÉŒLZÊ„•V®iN§Ò¨ôÉ(-lWþ0ñ±:NÎkÝˆOM:¦ñÙŒZÿÊÏNš?e€·ç}ªÒ5¹â”‹$ððà]?¼3ýöØñüªHS€\0\0ÌŒ(ŽSÑy`Ï«ÕÍÿ}Ïg¶–®&Öê‚nêù“j¬µw?REçŸÌ¥%&9@9=½T —Š2£8ËïØFÕÃWŒôdªZÓ-mˆvžäÌ6§³KÓ¡²¾Ìñ¬¥‡Ë,ž‘Ó>ÝH)±|¥%ŸSg§Éœá©ÅV­ Ònô]—‹ÆR•?Î}³xÓÍŸýjêÂé½êOÇ§ŸM-ùÆËÛü:\0˜3Ú†Læ&@(]MŒJâíü§&yM7ªÉ×ç=TšI¦Š±¿©HJÝ$&\0JEyÇ›/•ù”(m£5šËîØ¹+•tUojÕkºÉ-¸_å7Uzø²´udÇ‘ÖæÊiŸZ»ŠFkÝÇ8ÉS]ÔbQ§;!å‹ š†.\\k±ˆØ°çÖNôÁ)¯É$ÀˆR‡_¹¸aª\0`ÆŒ½	PÝx¾ºúnýFºò}$×²cÞç¢6ª¢ ŒÚ%\n£íó>›ÑÞó™­UtýOR½EÞä§\'JÃ$¢R,ÿI4Eùë¥ê¿Šá¿%M…âDŠxªèŠzìDƒWw8Žr¤µt¼6î«µš\'~\Z”\Z­¢õžSÀKUûÁÜºêêæøt¤aÄÑø•¶Ø„kE§-Ê¹gizX|îªN€¥ÎHz\0Ì%mÃÅÉ=¢ú—ÏUý\"Q¬KÀÑNQý²îQU¤aŽ‘ñ°xð/ç}!]øo\\~Ó£_úFu=RI’Ìm#ïN¾qJÃ$z:Ë½Z[^þ …ª‡ÿŽ­ÀR/ ÷+¬eS9›RV´|¥UàØê¿Ø¬’ÉìKW‹ËœÌ¾æJVÑ\0dÃæÇKèË9Ã?RÁçV§îCq’´´U<ÿOš“*ÍOuU—h.w_FçòJÙ»úÆ=ˆéž[™ªëpÌrÖ€¹õ‰X3òö®üÅ¥yº:ª¨K.ÖÊmíM_ùó¨h‹#\n.kÊžÌÊLþbGšT%Ô³çý8—Y|:»4•,IÔÍíw?\\uéŸ\n‹Òåÿš¬¨•æ?©hÅ´ò/ë–FLv¬B¡óH¦¥¢eËÆÆ•³§ûö¾ùbê\n²~xg9+\'¤Ì–¦p¹Ö¬ÿãïxfÜ‘¬Óà–‘ýGr-inûJgâð‰\'ñÌúŽŽOÍmÙwož8j¦¾RéÚ4Ww·jÕ±í²yæ—·Å†íÉÜG¿ÒWˆýJ·-i¬ ïM?T·L \0\055îŠlOo¼ü“(â«îËOŒ\nþö;·ôtîŠ9õW.ö”ÈNTÂŽ®0:™Ò?‰B6ŠàºÌ`M.ÿ_,‘G¤Óª¨\'*éŠ—Ÿ\n}“\\Xª´lY„Ÿ**Ë8dQ½E¯ðú¼‡¢&‹óªë»Eµ\'I©×øè­_ª\"1N8’u\ZW¼*ÙûæK>qk¥çy)Ì­ëÉ®Œ“äZ]ÎŠËÉåVG£¥¼T]õ_f²-Np”«¬7NlOß‰Ã‘ÛccS7\r½Z~Ç¹t¨ŠéŒÒ˜õª×è\0\0 6Öï<™ûÂà…Ìöçôà_ŸÌKEy”fªåhï¡ß?Üw¢w`ôâåàÀ¹Ñ,Ì\\ZYéÆæ•µªª{º:RšÛ†ß­á¥å¨Î£RéÏ6F½^Ã\0P\Zþ[ÅìŸWŠÀ³\'_¼`ùSñ\\V6.oÞ½ý¹¨£&>™oÚ“¿|Õs™ÅcGx§yfª˜¡5Þ\"%Ã\Z^É®²Ñ†ßú5¶§Š_ièKå‘9£Yöå7ÆW´XœxK2ã\\´äØF«:/eF»Š•Ó±-MÏŸ•[þ¡Ù°ùñúú…±#±Á¿¬ûBœmÃ&Œñà8åÒÞÅ+TtÕ -f\\ÃU¨\0¨îs;`Wþ¨‡vïxnÂåœÊ,’¢Ü©ºOQE¢âyãåŸdF¯ìÖ¤¤+^0•×Å>Ó5\ZêZ\Zþ›:£ORÓïçVGJ‰FˆÂ´ŠW]£÷ëqôßÛ³½gt~Ì±½³><¦ÅŽ×¶­ÞTuÚ;z%;jåïþ?™_íw?|ËêMŠÃÄ/œ‹¯#™Ë—\nŽZ¼84üÎ-Õ<}\'Gužªÿñ“m”ÔÅ!+™ºÞ®ŽòG¢§ùå7E;^(ŽoŽ¯h™H2iÍ„RŒ¢([ßd[RéçCü®¨èÞ]|TÓ=ŠkÍe\0Àôi\ZénËèÊ­zïí¥åZç„Áó;^øQT`Qýl\Zzµæ¯ÅÐ¯òÅºªx‰}ý–š¼f\n\0Ñæ“Ÿª(¹cx×ëóê;~8êÑê¦OÍŒ^×O•}ñ:ý¥EgK¥œ“¼ÒÓÕ‘Š¿ØÚÙpæÜ1²ëd®)ªÞ¨}7ö«U¼B÷Å«2[G‡tŽ]•¹©ùÖ4!O÷dÆJÉ6Jÿ¶áåDÁô®ôDMcx\"i¤Á‘‹ŠI&7ÁÙRÅ] 4—Q|T¯5— \0\0Ó[\rï:—Y<zM´¸²Ï\\É\0ÛŸÿQêU²qè•ZÕÓý¥6Pu]uUQ[§\rNÓŒÖÄ\r…£ñj±‘QÃ5¯lŸdÑYJµÍi¥»4³dôgTÕqÎžëìxoÏ¤îT´Øhõ¿-*ë‡w–snß2²?Î!QÇWúù­«/^Î_{÷#={#ÌôèMo}åž6./^ ¨â‹s ÍeTóÛt€\0\0T/êŒsÙ‡F;“ÌÛ™.*—9ƒMuJuÕd&J*Ic&?ü÷2·\r¿{2ÛÇîÏüàÑ­ß¨¢ƒþ”Š­Jwiª˜mfêD´‹FëÉ­Ü½ý¹4|eöl[ñéNÑm#ï–ynG¤‰=*îÎŽçZV®­¢ÓQiÏØ¼:xá\\*ý\'¹G‘NÓ9PÎÝ`n±\0Ìé?pïÐÏÓQ[wU>»ü´½¢|q£¦œÒA¥QW¥\nìýI7HlvZƒ¶æAÓÊ¬iá‚bŸ¨Ù4ÛúØ+Ù38ûçU­~»tÂÏž­âÄN!<Nìrf\Zý0Ž¼›Ît¿eòR×¯ÉWÿc‡éOÅ:@\0\0j–vOb°)­þñÌ¦§úOÒ[¤éö\'UuîMAk2ü÷Ê Ç.^<ªíâ÷Y.ËiåôüNYëètÕâcOø_<óŸfCè-Uÿ±U‘O*=Ò‹8WÓ‹Ì}\'OÝ0}`6ÈÿÅ¿iÔ\n0ÇsüðM#ÿãBvÁéìÒ“G>8ÖÛycó­õóÎ’Í;Ö{è¥ÿöÏžî›¶ê?•b=¹•CÙúh‡É\\\r}ãÛÎŸým4ïM…ÿ1Û9?sþ™ÓÇs7={ö×;÷“«,Z2³9í_?8PÑ‘:™k:™mJ“çT¬º:â\\]˜9SÅùNøh´8ç{»:â/[ñÉ™j´ˆÜ{v¾N¹H&U\\,\'žËÚ‹²;>&-+Ûgö›Qê\0ö?\r½­íw,\0À,Í\0Åyú²Å¹ÿÎž>Õuà­ü¼º¬ŠJåžÏïúÿûÈðPwýr:\'Ls FkÜ~g•£E£J+:Ý9üzTêS´‹ý7þõ_s·>øõ¿D\0h\\Þ<‡rZ´óáÜ\'£×ÞýHùo\'F$«–BguCAÆf€H,¿9q8²S>?ošOïWþé‡|\'3:÷Ô¦áW«î*Ÿ‹R˜‘}{\Z¼òÏ?LÕä™´(8 \0\0³Wš°åh®5JÉ¨ŠŽõv¦¼fdcºö¿•DZF4¶êîá_Nób¢Q»¼Ÿ[UZ´@u%õž/DA¶°pfÕÈ¿Lé¦Fºˆp<{Ó…á\\oWG”€7¬øä´ÝÃ‰&Š¶{Çs)§mþÿ¢¶®`ãçå×ÄÑÈ\r7–ó”3§O¥«æm#\"ÿTzo9˜êæÓ}Ç~Ý±sÉÒ¦27 V§w¼oÚ‹ˆL“¼R^Ê\0ñš*5,¶})‰¸ûÆËÛÒiÕ¿Å¿@\0\0æ†¨z?9òëÔ¨x+`ÿ®éQíxáÿŽ·N•ÄêáwÖ¿YZ÷tÚÄ;F#œÉ6D[Åt1ñ¬·^ùo±·ìm,œ˜ê­Ð:Ò[_Qvxkdx8Jê)½û¸ÿí_¾öâßŸ<òA)§Uº³Qø¦v>ö·e¶óÁ=;ŽõªÉCQ7Ç9*·¢xÿäà;Óp¶Ç–G•üÞží¥¼T«^ò¥}9?00=ûrÙg¶§«¸¨\\±/ÓðÏ«fÀœíªM+Àõçd¶é`~]|OÿÛ¸ü¦Û×o©nªÁò«É(#Þ{g{iÜmqF”‰ÖCêFx}ÞCñÃ|åÏ*-¤J#;üÇéœåh®uOþ¾ÁÈ/£ëyW¥]¿¥æU`ß‰Ãq¤Òš¸),Ý6ünÕ…l©7ly|Âéùã­ö“§2£àT4aÎ8Îeÿ*·éHîâ²¾76ßºöî‡k>ÓÿèDŸ»JSÅé½føíšŸ±/q”>¹S´/¥ÏlOçÞŽ7_*}fkxP\0\0˜1 Xµ¬lO³Nrñ©’(¢$êíêèéìøð]fºô/y©î‹QL¯½û‘JÜýÙ¶§úŽŽ™þ‰ð‡2õ]ùUÅþK£1 å·HÍmí“LQ|÷vvDÝ_Z4*Jÿ¨ûÛ†L²-®Ï•[?Üó™­ãÜˆSeûè:Ð\r…¾ÍCÏ×ülÿU~Söâmíh«æ•íÕ­uY£Eéß;fF©\nG£JžÒõÑb_¢I#Ôv_JuÿÑøÌŽž	¥¤cwfá¬¯€\0\0TétviWnUqlÀ¥‚23zu¹qYsSó­‹–4¦^òeÞˆ2èìéSi}Ü¨çÆÎ³ÕdTÌQPÎ’2\"ê§_ÎûBü°ùs_­hE°Ø©þñ_Å÷ý|¦ÖÁM1 \'»²T¦B0Â@¸›WÖÍ_8a9h`àüoŽŽ‚¯ïDo©ÚËŒN@Ù6r ŽWM®aÇÖ¾>ï¡T|GÈl¿û‘Ë¶-š´ãÍ—Ò¬SÚÅüÊÐ–ÄM*ç<OgxZ^7Úml£­é‰Ó{ÚN‰øÌÆ\'wì¾ÄÇ¶©˜ÞË=.ûÌ¦¸~ÙšÁqÄ™ Ç?\0Àõ)ê‰#Ù–¨\'ÆÖ”c¥Tp­§_VAŽ­û›FºWzÊ™6~:¥ËÒQÿýÁWþ¬¢\'îÞñÜ{ïlùÓCÏÎ’£vY~ÿ¨³BVìT©¨ùj^ðEˆ/õÃ‰f_té~ETŸ¥ ØPèÛ8üÊTGÄ8ÃßÏ­Žv»ê©a ®þ*c¬ÇnçX±ÍÑbM…îI¶ãïKfÜEÇ9\"ÌÄÅwë|\0\0|,D%1àtvi¶1¾_«²GTBQ¥y‡fçµÃ¨GY÷…Øµr:¦_æ¿ÿð?DÔY3üö¬Z©¸ÎC¶)²RG—rÄ1Šƒ‡)~˜ê6‚ÊÁÜº«n^¼õm#ïNÏB—5Zj·kÐWUj±ih´Š>¶¥OnuŸÙ%™S7Œ©ûZÀ,1OÀÇÐÿÏÞ½ôÈ•žu\0ßS÷ê»=6šx¤Ì Ñ\0CD`Dl@B¬²eÉ‡àkðø\0°Dì ,ÂPÂCÄ\'Š!ƒã¾Õ¥«Šs©n·=m»»]Õ]uÞßO%»Üm·ÝÇuyþç}ž÷ä¥ÀƒY^‡=/Åª6ƒ“Ø~Ma‘WÍÙ¨ÆkÑ-ð¨ñQ^ýWs´Wûƒ?©:n¸T}£ü°Ÿ?òy9x6æw^,mó\nï¬ô¿áäýéò[U¡žý«Z³ñmÅê }9<<ÿ8/Bol]ø¼Èo+û¯ž¶NŸ¶Õ NÏY@\0\0nÔ¼Rœ…ûáGõøŽÇb&5¯þ¯ºñÑ£‡ß­ªÿo(ªÕê:M³•û·½”UVíq^óßó@ž³ÀÉ ~þ+û¥êôóU›ª)É°z§ÿ@\0\0¸ØIhÿ°ñ•Pžþ¿ê¾™ÿñ½¿å¹UMÒ\0\0\0ë!¯þ«îÿ¯~ã®úg«}*Ë	\0\0\0VÞãìƒGÙGù~í·¯Þý?ÿ}òïŽ$\0ueXO²÷ªÍÏ>2ßÖðtØô$¶\ZT×£½÷¥_¼ê¥sŸþã_‡uÿ\0\0¨yéÿƒìklâÃã‹~^ýã÷þèªËÙUßŸ:ý€\0\0pKg|¯ñ[g•ýýs=­vì9éÖ|ü¥÷?¾êÆÿ•-Oÿ¯ìuÍ\0@\0\0êïIö^Uýç¥ÿ×¿ù­«nésyy¨vÿüpò}‡\0\0àvü ûZUýÿÎþñRÿ¢³Óÿvÿ öì¬¨ý¸Wõýý›ßZê_ôèá\'Nÿ \0\0Ü²Ÿfòwßywy?¹ñhðÏÿ—ù_˜>vú\0\0à–µÚ½¥~ýï|ûÏÇÃA+Œyú]G\0\0 Î=üäñgŸ†²ù§7;t@\0\0\0nÙxt¼¼êÿ;ßþ‹P^ùëËÓ‡5\0\0Àmº3-:òŸþïOÎïô¿ðê{öôW&ÿäh \0\0Üv\0˜=©Úrþ¥Ò]”ñh—þgÕÿožüM3Œm\0ÒÑø“ßßu€ÕÔ\nã\'Ù{ûOÿçhÿéƒ>~û/øèá\'ûWöùOÿ;”?_üƒê€Ô¸°ºò\ZýóxÿqöAµUÿÇ¿ñ»>øÕV»{Õ¯óôg?ùñgŸæ_¤ê&ÊsÅ‡“ïëû MñÙŸ¾ï(\0«ìß\Z¿þ(ûèì—»ï¼»{÷K[{;ï¼Û.Ã@«ÓÛ½ûnõÙ¼Ä?*«üòÎÓ§?ûñ“ÿçx88*>œÚó\0\0`…Çf_y’½7­ë}…¼â0û,¯þ•þ\0\0\0°6>÷?Ïîï‡½qlå÷_ó;[a¼5û¿¼Üßž=½3{’ßwô\0 ˜\0ÖK^Êß™<yéƒ\'¡ý,Î÷3è…Cçø@\0\0êýB6Êƒã\0\0—á:\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0° M‡€Õx$Æâ6\ra4u0\0\0\0V :?»>Ûxá³þ‘%:™·—LgaüÂgy®˜žûÈ@Ì\0\0\0’-ë³Û§Í`ì¦+ø…†“WyÝï(²ÁéýáüÞìd:Ï%\0\0€µÑÍª96³çÅ}þCÛìÇ9çF7{e`˜ÎÂh6¿S./<	Ö\0\0€­_Ëš>fqÞ£Ä_†üðv_ÈñU	¡\\F˜Ç\0€\0Àuÿ¯Êâ¾*ô[±¨GÛå¬ZB(—^þ©V	ò00;HÈÓÂtæ°\0\0/ÖúÌý:¨š‹¾˜\rª	„óÁ@C\0 \0Ô\\^Ü7Ë1Üê¼~W­ŸØÿþ…Á`0­†\ræ­D–\0\0`myyj¿*÷Ëû	¸pù,X+\0\0€•®äòŠ¿UœæwvŸ§‚ê2Ãé¬*˜Z(\0\0€WÎæ—ÊjÅª·Ç!a™ÏàXËç³j¼x4MD\0@\0X’ê\'Sñ³´ûb$8[%8™VÙÀA\0€+ÊývŒF±§&~VýYþ…U‚je`2›\r&–\0@\0àòú©Û(6å´û>uH°ÅÏq§|¨º††Ób¶xtzyc\0@\0HN¹#gÑØSvø8Ôú¡~n‰à,h\0@Ñéæë\0 \0(ú!Ý<`~\0\0€5Sõô÷ýp­<PÍœ×#›§ÅUÉ4€\0°zßnýÆüd¿A^XÈsj³CcþË<TÍBÕE‹\0àvTE¿a“~X®nö¼YÈâ\0\0\07û•]\n½FQ÷·ò<[˜a ŒË+„\0\0¨Å¾Î~X1Y¬¢ø|r ê2F\0Àõiò5Ru\nUa ˜\r\r\0€\0pÉº¿hò1Ñk«¸,ñéX\0\0@Ý©‡£‰\0©\0u?¤Îf@ /¶šê~H×ù™£É¼GÈÖ¢\0P·\0ÐŒeÝo®8§ßˆýÓ­E¦³a¹,pb`\0\0Ö7\0dåÞá\rûxo~­Ø,Ã@50p¬G\0Ö+\0ôËºßu»€«ª¶ÏõM,\0Àª€ªÕg³¡ÅX€ªGh¯U€³0\0\0¬D\0(Z}šÅxÀâ_ÞbØ>!²,\0\0·\0œòn˜e\0¸\0à”?pË¯y§ËÓÙ|nøÈU‡\0–ðŽ7›aÃ†žÀÊÈâ|Yàn±‰ÐìpâÚ\0\0‹ÐÍŠSþ›6öVX;‹Õ¾Ã\Z„\0\0®O·°~¯ˆç\Z„ŽN/, A\0àuªKól5uû\0kìüUÆŽ&F\0\0.~¿,®Â³eo ^^\Z°—(\0@1ã»ÓÒèÔ\\5*°×’\0H8\0(ý”“À O\'áÀÄ0\0)\0¥?@7‹ÝvØ™…ÃÉìàÄ‚\0\05\r\0J€_ÃN3î4ÃÁ¤X¸˜\0\0µ	\0J€×¨6:™Í~>¶k\0k\0”þ\0—}Yñn;ì•WÈ“€¾ \0Ö,\0d±X×Þn:R\0Wpv%ƒÂ\0¬M\0°¯?ÀÛ«…÷fÅ„À¾Aa\0V6\0l6ŠžWóXˆ,†ífqVåh2¿†\0\0¬J\0èfEéßÍ\Z€Å«®+|bçP\0V!\0d1î™ô¸—ÞÓC-\0pÃÚÙi\0Ø.ßŠ´ûÜ¤óÏNì\nÀrm6â^«9ß±NÏÀmq)1\0–í\\³O3¾Ûqâ`%œ]Jl¿Ü9Ô‚\0\0ÑÎâÝVþcõ+m?\0+¦Yž¤Éo“Ù±	\0ÞNÙös¾æw…/€~ÉÞ´e\0×õŠ=~\0€ÕfË \0®áÅ¶\0`\r¹†\0\0—´Ý,Îý¿‚\0\0°VÎ/OŠYa\08“Åxï\r;|æÀ0À\Zê7c¿öfÅ¬ðþØ‚\0\0ÅZñÝö÷ø±\0°ÎòWùífÜn†Ñ´Ø<ôÈæ¡\0‰¾¥¿q™ßÛ´\0\0P,vÚEõT^Txäjb\0Éè6âýöå7÷×P#ù«ÿf7[ÅÕÄžÃÁ‰€z¿ìÇÝVØn]éi¨£fŒwÚ!¿Mfc›‡ÔP·ßé›C\\õ-Â\n\0@U³Â\'Ó²5h\\Ü`Ýe±(ýû×<•o\0 Í,lgq»UÌ\nç1àHkÀÚê7‹ê?»þI|CÀ\0)édñ^\'L;y(6h\rXÍò5¼ÛxÛ/£ 9Y›­rVx\ZÊ$ 5`µÅ½N1ì›- t×°fvÛq·åÕÄ´¬ n#Þí†v¶°×~+\0\0„n3v›åeªÖ ‡àö—÷ê†ÍÖb¿ª\0\0ž¿Óœk\r\Zk\r¸MÛí¢í\'[üÉúfˆV\0\0xQ«ö\Zq¯†“Ù³Q8k\r¸9½f¼Ó\rÆ’¾¼\0\0^­Óˆ÷z!¿ífG\'E\0`yšYqÖ«½Ü¿Ä\0\0o¶Õ‰[b Oû£0²(ÀBe1îtÂÎRz~¾\0\0à²ïOù›Sñ5š1àÐ\0À\"lµ‹®Ëfv3›\0\0ÀÕµñn/ä·ÃñìhlH\0àšzÍ¢ôïÞhM®€·°ÑŽíp/„ƒÑìpdH\0àÒexïoÜpé\Z\0Ôÿ\0¼½­vÜjŸ	ÃÐ\0À«Kÿ;½eOú¾6\0H\0\0,J1$Ð;Ýb6`8{64$\0pþE2îvó×É˜ô}}\0\0€…¿½da¯÷zÅ•ö‡y0$\0(ýo½ô?\0V\0\0XšN3všápX\r	Œ$ ÕÒ?[‘‘\0\0nD5.œ;,‡ò$\0P{[x§cû{^:\0X\0\0à&m¶ãf9.œ\'ƒ‘$\0ÔÓö*–þ§@\0àæe1luãV·HÏåÆA\'Ž\nP‡·ínÜí­fé\0\0àVß,w{Å›åÉ4%`}_ÍŠ—²ü–­úéu+\0\0¬È;R#ìöãn?œLŠËŠí$`}JÿþZ”þg\0\0V-	Tk“ðlX$±ËŠ+©Õ(\Zý7:ëRúŸ€h\0€Õ|gm†»Íxw#OfÏáp(	\0«¢Ó,Îúow×ñßn\0€ux£½·ò›$\0Üº^»81Ñk­ïw \0\0 	\0\\Âv/ÞÙ­lÝ¿CÀ\0¬chÅ{­po«>Íž›–¥ÕˆÛ½°Û_¯Fÿ×\0\0Xß$ÐœwâŽ\'áp(	\0‹ÔkÇínÈ«ÿz1@-´›ù-îmIà JcG¸Ž,›¸×V-¿?+\0\0ÔK«öúÅ;wžŽG³ƒa88*À%_@âîFØéÕ¦ÛçUÀ\n\0\0µ|#oæ·¸ÝÓò\ZÃy8\Z÷¾h»wú¡×Ná{µ\0@ÝeYñÖ^uñŠ$p0”€òLÁÙ)ÿ,oZ\0\0 %›Ý¸Y^¸§ØHô¨è²‘(¤y^ 5ØÛ(6H!`\0’ÔmÅîN¸¿S\rf??24IèwŠõÀÍnhdÉ+\0\0¤­\ZÞ(NN§a`T\0êúL{›EÝŸ?å“g\0JY#ìlÄâþÁ`v4Ç\Z„`íþf9Ý[Ó\r=¯\0\0€U£ó¡ãrY`è¨Àúäù,låÏâ²Õ‡‹€\0\0x…V3ìmÅ½­¢)èh8Oc†•­û{Ezßì9¯\0\0À%\n‹Í^¬ªŠá¸Ç–@Ý¿žÀ\0\0\\I·Ul\"tg3LgEØ?¶,\0· Õ,ê~ýý×	\0\0\0\\OŸ/äàà¸Îo›ÁÒäE¿Sœìoéd¹~\0\0\0ÞÚÙ´@®Œ³#£Ã° ²o«§ÉgQÀ\n\0\0,T¿›ßbØ™WI`0r`àÊ¹ºß‰[}uÿÂ\0\0°çG‡…¸¤n»xÖlõB§í`,\'\0D+\0\0°|FØêç2s“<”×\ZËó€0\0¡:Ùß°Ù/\Z~Xn\0\0\0n:d„<	äy\0,úû]½\0\0$B5@<˜Âpd7!j¨ÛvÜè†~GÑ‹@\0¬Œj€øòþ`”Ç€yÐ)ÄúFÜyÅß-zúµ÷¬F\0\0\0VR·]LCîlÎYfƒ2¸î«_ñwŠ°Óü+\0ÀZØèå·ùÛödZ,æy ¼±õn=©¶Za£låWñ¯A\0\0\0ÖN#;½ÚÀ©rC¡Ùh<ï2?À²‚h7dYìvæg÷»vê\\Ë\0`\0\0Ö_¿—ßž¿©O&U˜NŠ;y0Ð5Ä•kýâ1šyà¬ÊýVËQ©G\0\0\0j§Ñx9„rªx:\r‡ÇùÝYµåè`h­€¢¸Ï0v¬\nýò¾i]\0\0¨EÊ†^j\0ŸÌ×ÊlPÄƒ**<OrÂºÂ¼²ïwª*ÿì—åƒ€ \0H[«5oíè÷ª¼¹8È#A•òä0:9\rÃç±á4Kp#Ñ®3?aßjÆê¿²}:Œ›*s.Ÿ—€ú\0¸ª^ç‹{eMq>œ­6T™áxøÂRƒY…ÊÙúy}ßŽÆÙýçýFÏ¡âZ@\0\0–j£ÿªÏ¼¹\n)VÆ|p<¾ð·CÏ¯øÔ®×ÚÔjç×/£Û‰vÒñ¬|»e÷Ln2\0\0\0¬ª+î+ï¼&\\&\0x¦\0\0€\0\0\0\0Ô0\0¨ÿ\0 ¡\0 \0\0@2ì\0\0	±\0\0\0\0\0\0PÏ\0 þ\0€„€\0\0\0\0\0\0P?v\0€„X\0\0€¤@\0\0\0 Z€\0\0 !Z€\0\0@\0\0\0\0êH\0\0$Ä0\0\0$Ä\n\0\0\0$Ä\0\0\0\0\0\0@i\0€„\0€¤€ \0\0H\'\0(ÿ\0 ¡\0`\0\0\0\0\0\0 †ì\0\0	±\0\0$Ä\n\0\0\0$Ä\0\0\0\0\0\0@i\0€„\0€¤€ \0\0H† \0\0Hˆ\0\0\0\0\0\0€z\0õ?\0\0$\0$\0\0\0\0\0\0€ú±\0\0$Ä\n\0\0\0$\0Ôÿ\0\0P\0\0\0\0@\0\0\0\0êÇ0\0\0$Ä\n\0\0\0$\0¢\0\0\0\0©Ð\0\0	Ñ\0\0\0\0\0PGZ€\0\0 !†€\0 !V\0\0\0 !f\0\0\0@\0\0\0\0êH\0\0$Ä\n\0\0\0$\0ì\0\0ÉÐ\0\0	Ñ\0\0\0\0\0PGZ€\0\0 !†€\0 !V\0\0\0 !f\0\0\0@\0\0\0\0êH\0\0$Ä0\0\0$\0´\0\0@2´\0\0@B¬\0\0\0@B¬\0\0\0@BšÑ0\0\0¤\0´\0\0€\0\0\0\0Ô\0\0\0Hˆ\0\0\0H*\0¨ÿ\0 ¡\0 \0\0€\0\0\0\0Ô!`\0\0Hˆ\0\0\0\0\0\0€z\0õ?\0\0$\0$\0\0\0H†!`\0\0Hˆ\0\0\0\0\0\0€z\0õ?\0\0$\0$\0\0\0\0\0\0€ú±\0\0$Ä\n\0\0\0$\0¢\0\0\0\0©Ð\0\0	Ñ\0\0	±\0\0\0	±\0\0\0I\0CÀ\0\0-@\0\0-@\0\0 \0\0\0\0u¤\0\0b\0\0’\n\0Z€\0\0 Z€\0\0 !V\0\0\0 !V\0\0\0 !V\0\0\0 ©\0` \0\0H† \0\0Hˆ \0\0\0\0\0€:Ò\0\0	1\0\0I\0-@\0\0-@\0\0+\0\0\0 \0\0\0\0õ\0ê\0\0H(\0H\0\0\0CÀ\0\0f´\0\0\0é\0-@\0\0R\0Pÿ\0@B@\0\0\0\0\0\0¨»\0\0@B¬\0\0\0@R \n\0\0\0\n-@\0\0-@\0\0+\0\0\0+\0\0\0 \0\0\0\0õ\0ê\0\0H(\0H\0\0\0 \0\0\0\0õc \0\0Hˆ\0\0\0H*\0D\0\0\0R¡\0\0¢\0\0b\0\0\0b\0\0\0’\n\0†€\0 Z€\0\0 !Z€\0\0 !V\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0áÿ\0¦ÝöW%º\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0ÿ€\0\0IDATxÚíœmLSWÇÏé½méµ]2ÇK	o†èªq›3¨E6p/Æeóƒû #„ÑÙm~ÛLX–™%.ûâ¨–|Y|‰Jº‰h&¸¨f/Í§ÙÄ¡Ð©À(o}»;··é®ÌnYé¹åyBžœž{Ï½§?þÏsŸs.ÿQgD`‘™\0,€°\0ÀX€\0`,€°\0À\0`,€°\0 \0X\0`,€°\0ÀX\0`,€EíÌ0—°þÉt–^…±Tlh+¿§\rK‘”´iÂooÝGþ¾Ö1kvK\'_ñ8¦\nó^¹–¹¸]#—÷1×‰ŸòR±(±k]Îä©Ÿ %óH5Ï©Ã¥tªÚ˜{ï(„á©Šøñ{¿ù¬\r;T¶”¢H¤BY$CæÝ5P:DÊ«|¦t®Ùü9Àš!ÉO[oRX\'›Q$)À\n7mŠëÒ	åÒm†!-¥ƒû»Oí‡ö•dêª;„çNözÒÓysè1Séñ*£XFÀÓð/û{	ºdäØ˜õ=¥)K›ÔI¦ï»Ëg.Ä\nL]²¦c2FT\ZlÑ\0,€ÿ9KZRN¸F}Ë#Ûžúö³¯¾#.†â_Y\"©¦ƒµCÖe78­žÙþcäÃ³VÎe]b7mBèÊù#§„õ×^‰Vör:ÃX\0âéú·Š½§E wïô©O–\\a6–™Ä±_ÙªVûZ¥Wëdž.2÷jÎÖ›×xÏ’ÆÂ½«6l;G¬¹òÉUYO¾¸‹ø‚Ÿ?ÖP¡˜z¡¦.ÔÑn›Fj‘Ô/û‹‰/3»šHjÐºÌ==Y^c»E‰„ÔÕâ5\r–n‡¡R• xä‘vòßÖd?þúÄ÷Äpña‘æb¾ŸøŽöé¨îuâÑÈ5ÝPHÚ‰Ûšõh˜4–¿ÙÂ™»Zm•sÚ¢ëòÉOˆ?§Ü*Ma²ØSÂ¡6íÓê\nñÐ¢Œ|éØ¡»ôcfž)ìâ	œNÄç¸dg¶ÔüÙlNDV‰÷â_ycïU¦HˆµÄjñ:aóŽ÷‰¶æÿõÑ=ÄŸOxMðìËe5\rNœ:óú©ÝÄ_Ð½.ÒÖáÝf”ß±‹ sôÈ¾tµæè-=kÍB‚>Ð*úö¯2îü60_€ì—÷Ç[ª²=[Èi^O\nçÚ`¾IØh^áûæVOçKÛkª%Gyž_ïµK¸Df?\\l*ˆ2,«ÿë0‚’2,{ã‡\\P”Î.7œ”¾Ó¡´eD*6°ôüýæzË$^ðœç8,wnÏx›a!\r»`\0`Ñ“àÓÕ˜‰\0.)§üÈéžO°0Â™šÿTçb¬aPÖƒcý<k*î`i¼P…pÇX‚ïŸ”7,œ¥™³»†îÅOøÐïn9ÁšKLáÔ¸`ÀÊBklIÍ¬5Z©‘²HA×Kiœ-,±ùÛãhÚOËœ8§ja¨ ñ\r>N×…Ö3ã™ä$Jr–BIsšÀy)Aj]ÎXÝZ\n‹Er0\\°8Híæíàk(Ý(wš¥ö¦]Y3|™%YÁ–ÇËwü—Í$åôÃJÌ\"™šŠÅ…9ák­ñ	äšDcãÈí™e”%°–Cì¿þâDY*G†u*¤3 ´(¥Œ\Z¶\".J±\n(D† ¬ùš³@Y ,Y&xP(r(”¯	”Ê‚œ[ƒ¿u\0X\0`,€°\0ÀŠ¹ý	Ø¹kTðÚ€\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(22,'sys','mobileSplash_small.png','image/png',14855,'2013-12-14 18:15:36',1473,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0€\0\0€\0\0\0ƒ¯^t\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\09©IDATxÚìÝpSçïñsôË’…\rÆË	6%l @øµÚ„$Û¤™;-™›N&wg:ÓÞûWÒ?ÒîìÌÍþÑûß¶37Í_w»s›™›»Óî”îìMi7¡$$Mñò+@ø!°ql,Ë6	ù‡dI÷{ôalëèH–üóý\ZÇãàcéø‘|>çûœç<z»N\0\03ËF\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0K4°0è%^ç†ƒòYýoì‹#‰>?ÍÌÝ¿ÙÐÛu´0ß¹¶|ßµóõtú*£íG†þ89¢}\0@á•ì{SxÊoIùõó40q\r˜3Uvßn›·6§Ÿ’É”¾ê1ã[_§m9ˆkÀÀ,ÓK¼RÂ:Ö<“î@NŽ„bŸ¿=ÿ++½ÇÎ\rß5ß lÛ÷/¾ÿ‹GVÒÒ\00€qjÙß|:~ð”Šd×Î×K_þƒ|×Jœ%¡K½½®\r±8\rÀ\0î¥oéw~=aäÔýïzkM¾;~³¬Oä*õö0 €(îo¼iž¯ò]ûž7Í$êÊúDÑÁÐP”ö`\0÷†\\eÝÌ³ñ`Û@¹ÉñÀ	óGˆ\r†npC0@\0HqÔî¶¸å€§Ñ¤~žÇüÇ[?ü•ä.š €¤º—­oÜÑ—Ìô­DŸ?zêÃû†ÿÒ{oÉËËhr€\0£ð°Ùwï6¿uéÐOcƒÇYµýÕG?Y¾¨«¢æîfG¼×êuÙè`ÈnºÓ®U¶¿óþ?´rÓ3eUµêGçŽDúñYµ•ZcNƒ0€T\0N$GBY;¢%Dnø—/Éòh^¶Ë¾våÐ¥Ûs]•Î\0à>5Ý•kg–y\"Ïýæ§ò¹Üý=.móCú†š±þj‡ÍHe\00€‰FN¾/õy6Ì´AGó¡Àù#òÅ×–ZíC–ªwY.ã­¤Wóme½	\0,á~üUo¨~ÿÄÕbƒ¡K¿«õ¨qÑJon™j=zKö½éÜp?þ£ç=õ–/fË³¬\'¤]\rû|[Ÿ©nØíôxcC¡`Ë	©}Õ¨fãâî\ZÝi/|ú–~ç×“çšþòÄà¿~¯àO€\0æ¢ÐöÙõääÙ6j+µ\r5z1â°d×2]~¾ú›7ª¿úÀÀ\"*…%‰CCIK+ué+½E¼y·ìo>Í´ŠƒÔß×þ÷Ë›âÎ% ¸¸Ì’¸+›’f\"ùÌ×Pbé$`&þi\0ÄâF-€\0P`£íG2}K-Ä5`€\0Px‘ÿ˜zý†Ø`¨õè¯$}™;\Z €á/ÿ–ÿêoÞ˜°~ƒüïG?9ÒßUWÅ, è\r,R¡!íìWåµ»V7ìŽ†nøÕÍÇEºó\0Ì»o·£v·­jCr$”b_IôùçÎîI_¹™ì¿{ÿ_êª´GV’¾\0Ì[¶ªFÏŸM9ÕÔõßýx…Þ5wBn(ª\rÅŒ/ÊÝŒ½``>s¬yÆýôÏ2-5}ú?_~X»²ÒKS‹ø4&\0\nüGå­5I_á,õîúo¿¼,g¾€\0P0®¯›¤¯R¶¼¶áéï_¸‘ŒÅi0€\0Pãø3Q·ç ¤og\rÀ\0¦ÍîÛmqK)‚ås×í$À\0fTuÃîÉK €×í~\Z €€õy6bƒ¡	3A €ä)92Yhh¼®óÆf^mÀ\0\naää/¬”¿—ß{K¾¨­dÙ€\0P‰>ÿðÑ›osò7\"ý]—æ«¤Á€EÊA\0»rH>—ì{sòŒ’»§Þy#ØrÂi×[Í²ÀâÅ\\Ð@ÑþºJ¼¡‡¾ëXóÌX*…çŽt?¢–üÛ\\«s €Ë­ˆÖu+9Óúï\ZC®<NmåR½–žg€\0&€\0˜yÂ\0€\0\0`q`4°ÈNº½µŽ5ÏØ}»Ò#´“#¡xàähû‘D¨‹öf×€¿ªFûŠF‰@ù:ÞëNHøÍÜ_{‰·dß›&«%Æ®\ZùôÌä.0€â’Øsí|]Eï„Ì‹žúÅ”ž’ý¥ßùõäû’\'ôü×ïYŸÑ\Z\0ÌÕ¿±¯çù4Y\'X2OêN5wG‘È³KúZÜ˜fƒ°€â’ä3I_•Ðî§vË÷ÝX¼8äÞZ9ÈéŒAöyX÷òÚ00_•ìú‘­ªÑÊ–5Ïýý¥;¾bd°kçëY{ž\'gðÈŽ7CC¼€\0ÌÇ¿.o­„ŸÅ¥Þ‡üèd{²àû`2êÊDí®ƒE:!\0@\0Å•žÚ¢ú=¥è¼ÖSÈ}È/}•êÍÏ\\éNò:00ïø@Î™×°»³¯™g÷íÊ?€vwÝÖ†¢¼’\0,teËkcqcý†‚ý…[»=uõì1®÷pW0@\0?€«Œ…ûïìs~5¡N0½Ð@Q0%0‡[Nd¬G7t¬9 ­šÍ#5ä‰Ñö?™ß@,›åÁ7Œ[\rPóL¼7ç¹,\"}SL‰åXóLÙß|ê~úgòEz.-‰Uù_ùGù–Éh¯éÌ§4zŸ\rÀÀ<#åi®g¤b\0»¶|ßóü?NžÃòþßpjž\rIâB¤õ¶žàE``VÀòa}ûKï½¥¾Xy¯ÏØ¹á`É¾7­ü¬liÛ>Å=Ç±+¿Ë{ÿ»Î‘Ï¯$@\0óÍðŸ­..ÔÑ|(p~,ð¼žÔgUc¦ºvJeõ£¯J\'Þt”èóçtl9¡®{Ý¼Œ\0Ì7’ýÿò½Ø`(kÚû—Ÿª¯Y©«/Jv½žëÓ-}üGn$\'Ÿäú8²Ã§Þyc¬_ªó:00ÿ”Üñ·þï—M†7_þý[Ç~þ²\néåK´ÚÊÔ_¦·6×‰´´ÔCw—4N¸XNÿöFN#gêj´Ó~¿?@aqPt«âWÎþ¯—í¾Ýu{–-¯-«ªU£çÎI¼òz´m«ÇÊMó”Ì3øó?û÷¯ lu~ñ»³ÿGÛö_~nå¤öíh>”.Ç%ƒÀÀ¼$¶k~­çä©w2ÖÁuUZcÍýÔ4öl®â¡ÆÖ¨qó®º¬x\\š§ówÇ~Þµõ?ÿ½légnøO¾ó†ºô«ÊqÙ+\000¿=²R«­Ô;ú’·\"÷g·˜\\V¦ÕWé…\Zl,¶–š?r|\0‹ÚJm¨çä?ý–oË3¾­ÏH¡¬¶R‚[Nt6\ZßO>¾@\0ó›¤ìø2·bCÆµä[‘¤¦é“Ï\0<.ýÊÅ#j¸µ‰•^móCt>0\0ËÒÈS’:xy™~­\'Ùu{ê\r¤ð}d¥ÎÀ+€\0©ØG\\;_ÏãoéÏZ…Ku»¡Æè¦ŠªZY+wk¥.}YÙÄŽk\00°¸$úü‰PW®C±bƒ¡±Ù<œY¶tÚÇîwšÜS\r`fp00GEOý\"×iýðWê‹eKˆU€\0—Ø•C9Í\"9pÃ?y6i\00€œ\rýá¿Z\\OPÒ÷£Ÿ¿¬¾®«ÒÀÀ\0ò—	õÿæ{=²Ü5l9ñÑ½É,%zÓ³I˜ËôÐÛu´0—uÝÖ¾*ÝÕôíU7ìž½­G•¾¯WM¹ÅHf€\0P=!ÍXæ¨Ä[ùP£Óãu•z#ý]·oøÇ¯³äqi­&}@A\rEµLhHá[W¥sé €K,>6Fš”¼Œy`\0\0`	£ \0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0`‰ƒ&À,\në•!½bH/»¥W§ÿ%¦9½É‡•ÿõ$#-²,Lÿ¦iTslõ=6Ÿ4µüoyòöÊDÀ—è y¦‡Þ®£0Ã‚¶ÚÝ\'¡+Ñ+ÿ[QµÊéòÈg—Ë3~³þîèÈ°|ŽËÿJKNT\'»$•iÃ¼ÏxN9žÔJÊ}uMeå•ª‘ƒÝíÚHxçèGÆ4@\0caÖ^öu½^rWâvEÍ\Z_]£|Îúƒ‘ðíÞîöÞîŽ@çe	c©ØV\'Z–%ƒ4ié[]ÿèŽý/9]îô¿Ç¢ÃÇßw »eÏèûœÜ\00`ô^·5¨Úë‘Í{+–¯Êï¡:[>»vñø@ßM	àMñ“†uçìûî.Ýø­W~2ù[’ÁúíÛKî\\Ú\Zÿ”†f†ýïþº‚V@QÝÒ«Ï8¾´ÕnØþìîß{hífwiyÞVQUóõÆ]eå•_õ‡®>¬é\Z¥°Ås ‹Ž][ö¾ \r8ÅÀîp–¸[¯wÕ%ZmZœæf\0ƒ°P\\möm¶+jÖìßP]t,ˆº†ÇäÃæÃËg´ ^»sô#Æ™éÆ©¶I‡¿¯¾éô±C²\'4ÀÌà6$³ä²ï’ô•ªë‰PÀôMkÜþÔ—^‹{ë?q~[éE&ª}L^uUø–­š¶`Ìïô=åx2èÙ ÑûÈ¦½Å{¢Šå«$ƒËª–§#ƒMÄt\'\0ÀXøÎ:rí‰heó4Ié&O¤2X‚ŸÆ@\0c‘ºhßv?,¡˜÷Pçü2ØU^-ÁOû˜„…ØêåcÇž¬§ï@ÿÍÎ–Ïún¦çÜÐRW++ªVÕÔ5úê›Æß´j’Á;öüø½ºnkXhá…\0@\0cÒË®Ú·=²yo]Ãc–ÒºÓÿùñÃ‘ðmO2²,\\­EŒ¹\'“cBÊ;Î[¡êÓþÓÇ5mZ3k¯¨Y#›µ]ˆ1±\"\0‹ËUÛ6WyµäeÖ-cÑáÓÇ~èðKî6Å/M¸õ%ý¿jÖ31)‘÷<÷jÖªZžZ¶ìL¬[¿ÄË`.ã\Z0\næ–^Ýcó5n*k©*éûñ{¿v|¾-þ—£™Üx*…¬DéžÑ÷í¡ù‘þ›æ,O-Åw@¯çå\0@ŒÅ¢ÍnL¸‘µóY¥o¤ïKë³ÿ{’ÙøÔð“òƒ¾f~K±ìÀµÇÃzå”.g	A[­š•Â›¨NtMsÞ‰€­>½ª„Z.b:K\Z¤—‡\nk•nr&cåÚmy\nyü9;ç¨æ’ýW7§W¸RÔzVËAOêBCñÎëºsBªÖ“/Š½\0Œ™¦–ÜÑ°-ë–—ÏÍ)}Ó¥°ÊàæÞ•6ÙRuSËÎLx|É†³ŽÇåßÕâKò/Ñ¡Î¾›+Mñ“y\\3V÷:KÞ¤°7|»3¼N2X0×Ø —3ƒ˜fd†z@O‰»bùØ´‘ja¨›áÛmáÛêŒdeÒX‘bŽ‰¼úA½V~uf£¥®ÇÛÜ&’ú-ÚRƒìÔþOóde<iº€n¬±8öH5àøHhÚyºÛU¯ŸÚéŸ~0fßu[ƒ¦YË_9Jyº)~6#¯d¤Ûñ¾\nÿ™·?e–ÁU«bÁKÂò¸ãY›·ö‰ýÇßš,ûsüƒw¯EsLíÞ½Î¼Ûª³å³óÍ‡/iPB«Í¶QLZo]Ãc+jêÍïœŽE‡ƒÝíÝþ@çåÎ‘u’k\']AŸáè•ý—ßÂYâöÕ55¤öß¤‹BíoêW“•éïºåEßb4à\Zóv@’xmâ’œ\nð\'ó•ëê-”¿ÊÑ6ïãÄ¶.[/ºW7lËinË+ö­£îåÏ¿ôÚ„ëÓr¼Þ±ÿ¥æ÷ß•]Ê)¤ä’²õ‰g\'Ž“Sg‰ÇÊ†õJÙ+yÔ¼ÖÛ,ÎX\"ûï«k”ÚA	{99®–çÚ?7Ã¿åœ¦Í¾±Ó¶N^ˆÛŸ²~·˜Úÿ-{^túålìTwu~[Iè^´ïR\r(\'dßãw` ÿ¦ìÀÅãb[ü/,‡ócšÓJù+;§7>¹.Þz}¤áóæÃ{ž}5S‰3Ðwó¡qGs9R«[“§Lµ&q[ ¸sô#ë»!Á#?5ejÊJ5Ö/‹MÎW®Ú·•U=üÄžòž,L­H¡jîàHm®½úÓ!ggíË9Í–íOç=Õ¨\nByKœ>v¨9\\)\\è²¾§OºÊ«\'tiäDNžvì?(á-;p¼»Lv€R3‰QÐ(D\0ÛªÆË,÷u¶œõ&¦Ù_ª:¢F¬Ê\r¤¦‘Ï+û¬#¤¤DËô˜MÛŸRƒw¬ýeû¦ÌÝà	jXÖ”$z¥tó5ì>pðµéOÕ)üü+[QÓpÜñ¬äúÌôvHø•¬X+û?ý‰¾¥¼ôš´†$ºÅýWé+§/òƒÓo@)Ë7ï•ef\Z F!+àjÇÁ@çåµ…¨0¤NZ©NûmÙ¤Ù.¥¼|æèÚÄ¥Éý±&¤ê²eàNýú¸¥\nRõ»šúÃGuÛJáeq®+R3qþ@Ê¸‹-šS‹Y¯#ó´ÕJPÉÎË¯PÀý—G«¨Zuþ¸Ñ³u\"3Ù£óàÅZéô¶hËž\\.ÏÅ3šš†?jÀ˜7Ü´¼Æ|›ÞîöØÈp¡mRŸ\Z.ûø½_Ö¥ÆÝ¸\\îhtØVÓò™/Ñ1å,ý7MjôšúÆÎÁõñ³Chi|»ÛWOõ›ªC…Mß4•ˆ[b{ŠvŸ’”žOß4)¦%PO3:9Lº‚åÆûöì«L_¥qûSòÂ]D¾9ú{þ¨A\0cP}­+jê³p‡g…ºH©îJêZ×õyÿµc½ÞäÀ¦DËäc·¤¾<µœ˜°º{X’5kù(!\ZÓœ«3ßp%Ioœj$‚“êª}›ºp[¤×bËÞú»/öîÊéz¶Ejg)=åYŠ´ÿÒ2ò>¹Ú“—lÊsÙ‡ë¶†u›7r%çaÝþ`êœ/ÝÉQ×°-kË7mêãîv+o€\0ÆàÔVg‰Ç|³Høva‡©I²Öj–†tÉñTòÕä‚¥dsEÕªž ¯ZËrä\rêµ²¥I\0ÈÑ_ò~r­/éå*¯¶’^±èp ã²DQä^WvªÇ»>ëHcùî–=/|üÞÍ[zuÁûQ;íë,–ž²Û×.—3ž¾›ãö•ÁÞæç=6ŸùÙšæe u{÷êÔ¼%ò!½\"Ü8ÝÝ.{µcÿK&çaêbDèNEÖ·@\0cöê.íÞôæeu4œRÂõ	& åÑå¾/GMïç‘\nL2`‡éÈ£îÿäúIQ>öì}!kzIH\\>sTu×«Ù£ÔôR-Õç›K¾š—qÆ°U«®LÆ`ç×ÏÑfÛØ”­ôþ3ÊþË)ˆ´ùªdDÎºŒ‰½îTö„ºŒõ&>‡Øê\'wf¨yTLöáøûï&z¯ìŸ¶§Òt(Qv®wŸÄ³ùB™¥òàwø³Œù =ù‘¹Áðí¥³·B‘\n3É6“\0®©k<ü°ä«ÉH5JÖd@µd¼œj4Mz5O§¯.Ë­Ò§’”ªK´NžåÊ¸ï6±ñô±a©ŒÍ/ÁúêšZû¾Ôâ…lÀë¶g‰û‘Í{­ìÿÚÄ¥.Ã\'å¿ŽõÚYc\0WGìãðmóñSêþ®¶@dò!Yn^CKûoK\\š²¯%=¡ióûï˜tGøƒoT`&pfH$<Ë³H¤:ü&»¡ºIƒz­ÉƒeY}£Ixt¶œ<ŒVÍÓY—mžN)p%½6ÅO®Ÿ|TJaùwù®l#9gZ×«)-H~ñu›7/ßÕþïý ÓRTÕ‰®=£ïô¶IjþtMÛŸR6ù[.—ÙÅ9KèÑ}™cè@4”ˆE‡3?M¾~À˜ßœÉØ,>ûÊDÀ©Å®·˜s–Œ”\nXjÍ)¿+‘ åþêÌ=ÀrLWõë„—P—`0ï:V“tnˆŸ3ŸBM4m,¹ØòY¦m¢SEË4Ó×üÊëøý7¿Ò/\'Ûâè»é?ó¡é9DêÆ°ÜïÊ5&ØJÝ¦<ex§38Ò÷¥±\"Èƒgcj^R9yâ6$Ìº 1sfwª?us‹ä–É<Ò¾ú&).å>å­¨ªÖ¤Y…âä5êæº&óÝS“tf½V=~X¯”r³¢ªfÊk™ÝþÂÞ†”õÊ«–ºt-OjeÿÓó‰>²y¯II­nÓ&M©=Ðßmz\nõ˜ì§4æ©îjÕ±2Švüu}ÙÉà‹½»þøÏÿ .™†oKËil¿mô/ü©‚\0ÆB#±1»µ…ÄCgxQ¤f(F‰‚ëíSIî3ÏQ)%\'ŒáRC¨\ZLoÓ\Zè¿™Ó$kã—n\rWŸ>öÛÉSUq¼)q©€í&¼Æô—ô\ntø­?i]¼µmdc ã²I¯€œèL^VRÞ?7û²¬	-™úÄ‹k¤I¥¤UÏÊövMMÁ&j1Gù¼gô}cª®@ µUr`‹#\0ÆB5aÛ™§J¢Î–³&ÇýÕ\r5wø‡ô²	E¤Zô×dR¦áWjšùÐ!‰Šœ&`’Œß\Zÿ´¹Ï˜ŠdË½Ù¤åÙ¯·œ½|æ¨œpNc9_|i•Ù(wc™¿§ÿÌºÿòËvwúM^õKIë`yŠ¶ðmóÑìJÅòUÒ2ªYR“wHéÜ™\noµ¡ZÄ§1ù3`Ì[o.*+ÎÝA[mzö²Dö«wrÌ½Ø]-åLªRx9KÜÁxíêäE°TKò#&·¯L9üJÕýc¿¾IœêüÌõdBj¸Ô}5÷+B§[›hY/dù«š×ü63‰7Ùÿœ–c’í¯§bÛü=3tç)µ%ŒåÏ76_zÂƒ”Ý›üäÁµo;íÆ½RsgYeÀ@Žï¡dTÕæS:é`:MjA)ÎRë@Ô¨ÅÞÕ“‹ÍrÀ½jßvíâqUeÈà¦Î«ýz¡Í§Ÿ4¦Î0fºn²î¯¨Êr“´DÂ†Üo’V¬V†H‡SÁ__5Ó™ù‹›ÇMÞr¶Ô6’e°˜¼gÂw&>ï†ø¹S}•§Êc:Ì	k\ZfuTw†×Ia½>q–ŒyÆ£‡­ÁllL0¤,€Õz85\rû÷L?¯RÏ?|ªÛµuôS“(2®·”›°1ü§å³ñW%}Í‡:.ÇF†§ìøÒÊœ.OÖß(ïjòƒEÝ6dáU“³ŸünòÎÚ™<ù²…ü²ëãg/¶ÿ¾ÅÂÄ&™¨>jùPË*öÕ%Z-N·!aÚœª$ü²ïªVeº3$Wì[ËªÞûÜ«ãS_©O¼øƒêúGÏ9öeº•HÁ–&·ñH…4á˜€^o>XJêÉÃ¯,Xo¶žØ¹/62\\Œ‡Íx™ u/V å„1ëd¶7^Vu\r}ë•ŸH–<››Ï™¼s\0sŽ”›Æ¦j÷.ˆN“šÖQj—)«ŸG÷¼ ÕjÍgrÆ°2È4y\n)‚Óó9¨é\'Mæ‘–0&Nx\'–³Ämrµsô£Dï•?ýöíÓÇM?†åõ}âÅÆ½Æ=Äd0`ÌÞä@Ö2NÊS9ždÁóë¶©G3u]ª	­Ì«m_²C\"Óä¨-U‘T®A›1+–Êr“é\'¯]0nÍ{ýœÒòJÞBSŸÙ˜žÕ©[‰¤î¹úg‰á?z[Nª¦3áš¼E¼ôÚûkgÓø˜\\Fa*àÎÔTæ—}uM=Wû×kÓºÌfe9-[Ç¯„¥Ç‘àÌ4GŽÅò»ôÜ1G’¼7™~R\r¿Zì0)¸Í¯ŽªF3Ö´HæÓ\ZöuA}l(øØ­5‰BÞZceþ2ãd¨+Ÿ¡×U5ÓÜ=õûÊ©R X¾Ï \'gj•è¬„LñËºÜRKœO¹@\0cÎ‘<sÚcÝþGLs±qûS-ŸMóÐ&ycLGUß4ÍØ¨K´¶u.ßÍ8Šç‘Í{/%.I¶mÌ<þÙdøÕX\0k‘HtHË–Áy,\'é{Êñ¤TlrfóP*Å…ü:ŒþùM“&Ê›\Zá%ç&Ã\\%î\\/ðß²U«À3Ù&ª²6®[ÞÒz£qãä,¬½Ü÷eLsÊû¤:µ®CNa,[J~·]À €1o2Ø|Á]3êÐ¶2pä5hVêZµ»ù{0|{•v;kåted«œdÚgµ8Ò9û>óé\'¯]<.¿ŽÉ,r*õ¹mÁP­ÅµÇ§oÜ[ÿÄs¯ŽO—Þîößû\'§+Ô€^5Ê} ¯Ûd¸²|ërÇç9=lX«Ì:™†´Ûª©N¤äNÞéû¿¥ý×¦V@R³\ZskÄÑ=	ß­ö/ÏwøµÔåd9M±² ±:÷š0(®£0äÀ§¦2ßLŠàQ÷ò+ö­ù=‹ZÓÞ|Q¼Hª3<ëm©ê`-\'\r&§’‹r”7™~R\r¿ò%;²Væ£„$ìå‰†r¹M«Í¾Qjß=¦¯ÊÂ-{_è´­*ÐM_rn!qÞÛmö;Ê“JÅ©.™[<{\nØWo¶8£j±É·“É{@>–­jÇþƒO¼øƒ¦íOß]ºQÎE&Œï3fœŽ_Ú9úÑs±ßÈgßÐ…ž«–S“?þó?X¯ ¥Æúñw\ró€(åH}Ùt‰•jj½š<FcÉa×XÓþ¹WÍË_uxµ²¢\\Ö“U›ä½•áW*B¤‚4Û“ú¦œF¨IØHÄJöLÙ³*»mLæ¥×ìÅMÍ—@Ý“Ù%‹ØcóI`×˜®Ž,¯‹ÿ„\ZTN;‚ž\r’»’¾êB¯œÒxéµ²ª‡MF/ËK°>~ö›£¿—$.	µH›Ü„–6ë3§‚\0¬Z›¸”št7Ky!ÇM9zª:Æâý²Ù9û>É\'ùÁ¬óTŸ°•.n9.K¡Ü™yBÉEóé\'—ÍËßôuwúM6SŠu›o³m´r›–´†4žI‡ÅòšæGu²+Ðá™®rØ¸ýiu{˜•ý¿jß¦–-2ÙL2rÂY”ü º\01¡YœÒJÊ³ö¬ÈaTÃ‰ŽóÍ‡ùƒŒ…CŽk’gY‹àtK)sÜñ¬yÙ\'Ç\\Ùàç·oy¾.uù’ºªl\Zè»ieQ<%5+Ög™î]‘#»É|‡òƒæÃ¯Òä„ÀB€=%™jå¤D¶rmÇþ—Ìª·lÃ¾r¢VYt\\6{õë\Z%Ï9ö™ŸC¨K×–[ö¾`²™ZpÂÉMH¯È4™¼RªgÅJ7¸š‰eÌ¸o}ü¬±0»éé>pðµ•ë¿!qò¡ó»Rà¶Ù7ªJ>ä0*ÿ+ÿxÔùÙÀ×°ûùWþÖÊðµª®õ)‘%ZœZìzæ\"ØäI¥t6~5þˆ¯Ý[-ØÄžg_•d•“’Luä^Öìx.u.òC“º\\’^Ò«€3«ëåþl§VÆÄd©®`“ýWÃ¶\'¯¢8<W¦¾ýLus]jÅy·L²uªäÍ}vn \'ö¿ûë\nZ…âÑ\"£ºë‹ÞÈCku•d™\0Y6ðÕ7ÊAÓã­\n%J{bå7’©ËÃ7m‡Ý—|mãºÍ{·}ã?É6v{öûüíþ“›â\'ÕÀ]kg ñˆîýê®f>°kÊíóæÃ\r‰eÉ•g‘ìé¾3Z·Þì‘ùzÓîžàW×\"·lÕR,&4»ü |Èÿ^·5Hº8¼«ö=ÿ}ó~ømŸwwú7$ÎÉ¹Eúå$›¶?m{™N_¼ÚÀµÑ‡SÓ2Þ¹+¿ÚÃkíí	¨ýWõ®¼’ˆwlUí¶\r÷_Úöô±CuÉÖ	{\"í ïêš5™2¸Ú·¦ûF[çð2»–¨HöO¹ìŒß¾Ã³¢~Ó®ç2íÀW7Zo´]X—ø||ÇmH(0µV|óïf­rÒÍ#›ö¦/gšßojb ÿæå3Gë­¹®´6qé“p} Óï349ìåèl}ö+y–æpíµÇ·?e²YêræŒUz:ýW:¸l\\QµjÇ¦½Y;áUŽZ,Ís8µJFÔ¥Sc¼Xæ(½ÿÒ>ûª\'¼Ð[6ûŸõõ•ô•§›¼¨âØp¶þ›™º%ä‘|MvòÊg§mZôW­Ö¥ò[NA$Â¥%kÆ™uwøeX	0æÝ[**5è©¾²óÇç·`\\O*±Ýüþ»žá¯ò¸ùU-â+Ñ˜S\0KÆä4Qƒ<ËêDËå3ÎšúÆ¬ãÈêî­_+ar–x¬Ï#¡¦cÜ’¸TðWvCü\\p¤öô±ßîyöU+ûŸê	ï¾wöPcñ••ýïínß™a\"uç˜ùíæ[ö¼ Ï.›Éãt>xußÊILÖ©Í\0sWyòöÖÑOO¥ŒË#ƒóHßßûe\"ÔõW£å÷rX¿Ø]u*Íñé¶>Ôë~ß€^-»úü+k1rLQ-È¨f¥(Æ©•ñ²v8-®Å+¿£•Ëö“÷ß¤CuWHH›g°´[zs=‰¹|æ¨6®‹·ò‡ŒbcŠB ÷Œû\'óÑ¿Ó$‡W‰´Hß—ÛâÉov-ÀN-feìØ½\0>«î{Îõ‰¶þÅ1Ü/;\\Œ6QM!;6¹ó¶°/«œã6µÿòZ˜tc]Ó‰KÒÖ—?’Üµ>¥Ñy~á¸4`Þï%À:a¡X¼ÉÉ¯¾ˆx¯·]Zá[ã.-/øS:ýÍ¼ëuîŒde0”‰„n¿~G_¿õ‰¬[ªáWyŒ’µiñåÉÞÎáeoIŽGíþjûè\'ò,S7—­~ÝæÇ3“s‚«ç>‘ì1Â&¿µlp¥71¨ö­±28Îâþú‡wVÄ®7ÅÏdÚÿôIÀ-[uëmËW>\\VÐ…¤äítöÓ[»¶.ñ9¿ €1¿•hÃ«’_öÇÜ—ý—äø.GÌB¯%Ï||ÈæC9\\n‰ÿ‡<Ñ4PB¥=ùuóQ¾Šÿ³Ã=íÆ›ón“‡_ÜŒU¶}Ñbw8¥M¦¹çÒ°\'þZ²Sšb{<cúJ‰ßnßP^±\"Ó/¨ÆNË‰EÖ¡¿*ƒ;nÅ»o´y+VL3Óû/µ¯´ªyú*+p¼ôrë5]Óå×)È›JÞKgÿl¤o×±\0`Ì&9š«ÞöÞÁkþÓÃCw%²Þ¡”­\0ýÃéc‡FownNœZ“¸båme?Ãze0ÿzã.ó-¥ÐôÅZª’ù¯\0/;üP¢-\Z·]íê¿ÞrÖYâÎoU>iŠ¶‹Í²?‘¾/å,DšÂüIåÜŠdºáêôÇ‡J#íu	K×>%ƒåÔªwÈq¥µEJáŠªUy¼¦½-ç>±¸ÿ~yvM×ÚoÞ¾Þv)ïLßÍüß@êäcCü³˜1zèí:Z3@­\\{ÝÖÓœr¼öÕ5­¨©·>Hg ÿ¦1¨µå35Å„+¾Z\\ÀVÑ¾ë[¯üÄ¤¤3:½ß÷›£¿/È=*’ˆWì[oéÕòŒ5õj2)+¹+M!Õj Ã/ç\r«-uñV+×,åéN9žô5ìÞ²÷E%Ï?h9±sô£\\GoI£µÙ6ée²çj­¡¬±<]Pö¿Ã/¯fNû?™<¯<»ìƒd°š\ZÚúPvy)Õ;*62,%õúÄYî;Œ.h«íÑ}òY’XKÝâtyª3ZÚh ¿[Ž’r°^–ú’Öï¾ÍÉ9û¾‘êí¾f²Móïµ¼3ßáÖ™RDÎK¤MÔúE™\Zd|Sh©nØêdW®;J³ËI†VR.qår5k4:dLÑ5Þ?™wÃ\Zs@êµ=6Ÿ–ºß·´¼rÊTv^Í1©jhcéÀDÇô‡;MnÀÔÞS×Ä’ý±èÚIÜ•É€œ½ €±¸HA¦ÖàS3ÊÿªHN3&CÐ\"ê³Do®3läzÿÄñmµÆŽIéùÇþ	ª\"-Õ®\ZD}6vI+K/)¨~÷‚4Å„¸’ ”G+H©EeçÕ:aBJy\"ÉZù,Ev~cÈ­üjò¤ªegÒ+éµ•Ô³i\0ÈÔ…K·}ë•Ÿ˜lã?óaë™*ö;šÀôq006ÉpÖY;[>+Rï7\0XŒ®Ú¶SR›®ÇèôGÂ·-€¬˜Š‹¨Ì\rêµj™zgÒ¸èM„ô\nã‚¨Í÷ÄþƒæÓC^»p|Y2XŒ)ÀÀÂ4ª¹.Úw©1ºUÆ”„j¬\"µïž½/˜ßÿ£n‚Ú”`‚~\00`™¤ï-Ï×w¤ÉIÿ£ªQ\n[›£ßæ¨ZÆ@\0–„õJ©}÷ìiÂ\rÖç\0‘¨tø7%.Ñ˜\0\nˆAXXàÔÝ¨9­õ;ÁùæÃË’AÊ_\005ê*oþ3ôÝdŠ`\00g2–÷Ïv¶|vùÌÑMñ“~@\0¹©N\ZSg\\»x<·º9:|¾ùðéc‡ê­t>(–#ÄB¯€µØ¨îºÚÕoqíX‰ÞmŸŸ<ú›þ—›âg¬¯‘\09a.h,\nWíÛ:më´Ôàçêš5Æ\n²Þ}4Ð36b,“§nO’ªwmâ“õ €éR3aÝÒ«ÕL“7ð&Ô\"9ÕÉ.¢\0\0ÀÄ ,\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €Q8]sñÒ\0À‚>ÒÓ…á¶¥³SwÜûZ×&æ¨$«|ÖpâÿM$µX2ýÉhÂø—)·\0Àsä¨m\\¸:uÍ¦?»s!û§2uÚ&õE<y?§% £„4\0À³f6]—¸M¯î…Ø<©Ÿ˜ÓFÅsR‚Yý/Ù\0p!³V•³n®¹>XñO™ÍF\'U/÷X0§‹i\0\0<uÜªä[Q.Ä.Æ™Š>E0«y$1–Ê*¤\0‹.€%\'\\ºî¶Õ-#Šg¬bvÛHåáÄX\'öpœB\0h\0O\\—w®ô:¨Zy©cŠH¦J@\0ÏãªKB·Ä.Ÿ©qçe$«+Ê#‰¤º–Ì /\0ðœ]·M/±©!T¼~ó›º¢<¾ãZJäh\"K]E&Às%tKí¼`¿DžÇª>V%2\0ÀÅß¯Taä±Sé’Çc/\"iäq,uý˜)½\0ÀVj«tE…	$ˆS] c×¥&N$G(ŽÀÓ:°Rì\"GÆ¼{o—Ñd*Œãc£¬€\06}f£ ÑËì`FÞKKìú’ÔDr¬2Nç¢m\0Àä.fDª§Z/}0ŒãTÆ\0æ\Z=ôv¹‹…nj\0‹«V×wËä.fû>®›:=€k8Ál\\\0\\\0«z—;w1À%I<ç‚1€ùÀÝ¨w¹ó…Û¦«	2Uµ\ncÊb\0ó)€—HÉë`U]ÌÛ?…q}Ô”Å\0æA\0KÉ»Ä¡•Û¹…³,Œ£€¹ÀnÛXo3°€ËboêjJâ^õ Ô\0f1€—ØØŒÅ%}{ñò{ÔÜ[`æØ¦E/¬°˜©êJ§±rb„KÅ\0Š\ZÀ6]÷r¡xË¦»Æ.\'Ã£ÚÝ8½Ó\0\nÀD/ýÏH×¥ –»q#‰)ˆL+€‰^ WêF¦hb¬ €Ü˜è¦ÃeÓ—»´ÊäXAÌX-\0–XNá—:fL—-u“œË§\nbî$1€Ý6ã:7…eŒšvup$ž¼KA`|\0Ût}¹“)5€bþ©éÚR‡¾ÔaL­‰S‹Ý»Ãès–Â—Ë½ÀÌPzP‹–-uß„„oøÿm 5€YCA,*Æ Í±«½Z  0¼©ëP÷ºœ©€\nb\0E6ÕX+*``NÄƒÜC,îÔÜ\0“îï•\n¸‘Ææ¨áD22ªÝ¥%€ùZø.ujÞ©k]=ü^MÌi‰TAŠ1Ë40¯\n_»^%…oÆÙ5``þˆ&ŒZòÁ²KÀ/|+¤ðušo%¼‘¶æ™»£ÉÁQm®i`n¾n+3:ëáßo¢¹€yi4!œ¼3¾\00\nßå%Ú§ÅÍ	``þ‹&’w¢FAL×40[–8ôÍeZI	àÍ´°@Ü%#1º¦å²ëËÝš;çõôðáGi=`A‰%´Á˜QÓ5\r•1«s‰¶´$¿Ÿ&€…+\ZO†cZ8J×4PxKKŒôÆRFÀ[hF`‹Ä’ƒ©$0}‡¾¢Ôä_ë¼•ÆcBX2<¢\rq‘ÈK‰]_^ª¹3‹³þ,2£	£&–$aÕÀ\Z‡M_æÑÊ]|H	àm4,°HÄŽ0\\È\Z½%`	àÇh^`Ñ\'ñhòÎ°‘Ä×ÒŒ%=Z¥§XÉ®é:,vn§îNMß‰&%†ïŽÄ zµ\n·f³ïIôð·ÓÔ\0&RI\Z¦%°¸8íú²Òbt8OÀ;hp\0S“:82’¼•Ï4Gôºgì	õð¿ï¤ÙdKâ„vWjâ£w\ZX`<.£ÃyIÉ?- ÇšøîIŒÂëÑ½nÍãœ•\'—\0ÞÅK\0 ¯$&‰1/s8—½ÍNû,î…~7¯€i‘$¾›Jâ÷cn+qê•¥RøÎ…}!€0‰G’w‡IbÌ½’×¦-)1ªÞÇÜÙ)	à¿â¥P`#±dhH*c-Æl—˜õ’·Ì`UÌ;zóà=¼@\0Še4ntPß”H¦10£%ïRî-•\0ž³û¨‡? €_\"©…‡“w‡´Á(Ô(¢¥¥ú·¶Ä=÷÷Tx/¯€%5ñàˆ&aL5\ne‰[_â16Ï½®f“\0~œÀìˆÞc ŸÜõÌ»ÜÀGöñ\n˜eñ‘ÄƒÃÚ0W‹aÊn3r·´D>_Ï[0€¹WŽŒ•Åq®ã§C+OÕ»¥%ã’\0þ/+€9j$š\nãaùL/Rn—¾´ÌÝ×ûÍôðŸ¾Éë`–0ë¦&Œ|±[êÖËJ´%¥óº“™\0°@Ãx8f„ql”öXP¡[ê6¾^ä—ÔyÝÌ3îù;xI\0KD“‘a#1_Hi[âÒËÜFß²„îÂ­t3WÀG÷ó6\0° ŠãáhrxÄ¸~!çXëvéÆÉ“Ë]—c‘·‡ƒ·€…U»Œ£¼¶D_«HV_cf”÷æ\Zq+¹ë2º—i’Éð“´€EDbØHbcXur85/f4Æ…äiñØíFg²Ý–þzö\'çWs\rÀbât\Z¥ÆŠ°ƒã&äŠŽŽOådl\\HGÓ¼]F¬¦î»Uå¬¦U´¢ÔÃ»izLþ€R6.QÊøNÆ#åøËÌ±*éääÂ:ž0*ï¹ó;¦ÒTw[/(©±N®QRÀ¼ÈlÍc)³§$Q-èœR­ÒL\0\0²PãX\\¬À\0\0P\0@\0\0€â0]Ð\0\0P\0@\0\0€\"0]Ð\0\0P\0@\0\0\0\0€…À\\\0€\n\0\0\0\0)€é‚\0`æX§\0`*`\0€Y`ÝF+\0\00ÃH_\0\0f¥&ƒ\0 \0`qTÀ\\\0`˜QÐ\0\0À\0\0,Ž\0f&,\0\0¨€\0 €\0@‘˜.h\0\0¨€\0 €\0@‘˜.h\0\0¨€\0 €\0@‘˜.h\0\0¨€\0 €\0\0\0ÀÂ	`®\0@\0\0\0\0ŠÀtA\0@\0\0\0\0ŠÀtA\0@\0\0\0\0ŠÀ:]Ð\0\0P\0@\0\0\0\0€…À\\\0€\n\0\0\0\0)€é‚\0€\n\0\0\0\0)€é‚\0€\n\0\0\0\0)€é‚\0€\n\0\0\0\0À\0\0,œ\0æ\Z0\0\0TÀ\0\0,’\0¶Ñ\n\0\0Ìx\0S\0\0@\0À\"	`J`\0\0f>€\r\0\00\0\00\0\0(R\0Ó\r\0\00\0\00\0\0 €\0X8Ì5`\0\0¨€\0X¬À\0\0ÌBL4\0\0³ÀTÀ\0\0À\0\0,Ž\0¦\Z\0\0*`\0\0`\0\0P¤\0¦\Z\0\0*`\0\0`\0\0@\0\0°p˜kÀ\0\0P\0@\0\0€\"0]Ð\0\0P\0°Øh\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0äêÿ0\0Ö·wª°0ar\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0ÿ€\0\0ˆIDATxÚíœkLWÇÏ™Ýá±»Ð¥òª\nÛ®ÕE¬t	 \Zhú€¤/MClR?ÊÃÄ\r¥I?˜6ýÐ¤‰¸ ’@›Øb›ÛD*$ÐXR­(«+J€ ‚¼vgwzg—ÊòŠØ¸ììrNÈÉ;ÌËoþçÌ™;ÈØ‰h@[™1ˆ\0a!,„…°ÂBa!,„…°\"@Xa!,„…°ÂBXa!,„…ÂBXa!,™Î‹U2‘IkyãÔ…]ì‹ïÓ¦:ïÏÀ½ÕrƒÅÉèºiÖSOv¶oÇNè.¶’Ì­2“{qf°L¦\"š‡{ëKüïTJÈl\n•:©Öz*UÃ—1çL±=‡úPõÂþÆc)ü/0çŒÊGR–á ðÍÂ¤ž í§:Ã?gãê.2bé°³LŒ›t¯nYBA~™\'Ö‘HÚ5{t*ô™Î EX‹fÂnL£tøÔb9VÊ2),M%ç+\'¶¨ö_’¦±ƒö´÷[BcSÏŒÞ&‹/£¢4+^\"\"Úm„a=Q=åã¦rg?ÂZÂ&ÊôƒbT(X\"·¹q2L\rúP²4\\¢AXË÷sV@^;ËÎžeblX<¸òcÛŽ¿”ö6-î×„²¤Å<–«;óY)±³õw•&ÄšÝ¸òÃy¿€µ¢¬&6ý€›Wj’TIÛ\rû`K—6tý¸bcen‚¹Žv«\nþêëjºðæuEFú¡*ç±¿œÊI´Ö»Žv“MÙ™wÆÙn¨È}Ù\"Ûm,ßšô†T‰â`©!\0&½UYqYR¯iþtnuÁ¤{Si9ÔÀÂ´]:3\nZJÊ&Xÿ(Ë¬–ôC•®C™!€’¢{»MFóÔxFnE/ÑÝ#ÏQRWËÞ£cBÂ\no{}‚\'`wÝ´‚B]Ã÷ÎÍÞ¤Rê“\'ªÅÌ¯hcª<Fg¿c>µ¹õú<Y¤•K)¯|³†„ªxÚÖø1D¼GIù?L¾SûÛÉ}«ÚÜëöÅê»ÖíqMaÚÂ»´ÛZD}cÐƒñu«uFº¨æ=¢v_;7/÷¯sÌUœ»½k£&=å¾!&5ï;UA§ÃJ¶ÖRŸž]ÔÆ-À·DK	#C}¹ÁÌôTÖþOh{¨BZm>÷9õ-‘G¨¿¦ÉÎ:\\ÖÍè\rÕUsŒúQQEóõµ_ßbŒÁ…1­SM\rtÓHôîÒaÀd/¼•tø,mï°Ûl\\õNç®»Uï\Zò%šjñ!õ)¶ºÉ‰ÑÝ{Í\0½ßeïøÛ>Âñ¶«mM»ÞÊÈ}Í±7]øÉ¹‹òr6Z›ë7º;¥xêÿ:t2qÛòk~=_º½çK,J—µû$BWpy›£íE¤<ëY±ÿBe±•ñË˜<M\0Öcl—¹\Z¼ÐðA\Za!,„å“	^IˆFìJ~Wœ`L\0«¸f`±„Dðð¿^±ªy#‹3v˜ñ9X*–„(ŸþƒÏ@”ÿ»óüÅoƒE\\þ·¯Ûl˜=—8.À«7ÁZML©©9PsÞ¢5Îƒ¤–Ðš`ûdšÚ((9½”VÑIS4Ã¤ —Y)‰–w„!#Ç7ø$|öëR±s<X Ï?ã’³…œÓÑ;>ZE±chu5N”vQ‚\'ÈßèŽ‰tJMl Îçz!Œ°ì2wCV^e$ö¿Õã©iñŸÁ§Žaˆ>Xöq¥ƒW(kIT‘8•ËS‚¬‚(Ø(D˜¶ÀôXUp¼ü”èþ<áù\'¯³X%øŒqŽOæÕAîÞ‡`¹½(ex¤°be!¬\'…aˆÊBey<Á#,CCÃòC\n¨,Lð˜à1}Ðð[„…°ÂBXha!,Û¿€P™Â§Fþ\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(23,'sys','next.gif','image/gif',542,'2013-12-14 18:15:36',542,'GIF89a\0\0ÆH\0^¾#eÅ%hÅ&lË&mÊ)nË+oË+sÑ.vÑ0wÒ1wÒ1|Ø3}Ø4~Ø5~×6Ø6„Þ;†Þ;†ß=Œä@åAŽå_‡ÉRŒÖF•ëF–ëcÎ^“ØI›ñg“ÒKñKòb™Ýk˜ÖbœâP¤÷Q¤ø\\¡ëlœÛ\\¡ìQ¥øR¥øgŸãP¨ýR©ýSªýTªýk¥ç^°ÿf¯øf´ÿ«Úqºþ’³á–µáƒÂþ¥½â—Ëý™Ìü¨Íõ¬Óú´ÙýÈÜõÆâþÍáøÉäýÔáòÊäþÐæüÕêýëôýõõøÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0b€‚=:Fƒˆ‚<+7E‰ƒ;#.4Aƒ */%)-0?‚$.2C\n(,,9\0\r1D\Z!\'@5	\">6&BÖ83G‰\0;','GIF89a\0\0ÆH\0^¾#eÅ%hÅ&lË&mÊ)nË+oË+sÑ.vÑ0wÒ1wÒ1|Ø3}Ø4~Ø5~×6Ø6„Þ;†Þ;†ß=Œä@åAŽå_‡ÉRŒÖF•ëF–ëcÎ^“ØI›ñg“ÒKñKòb™Ýk˜ÖbœâP¤÷Q¤ø\\¡ëlœÛ\\¡ìQ¥øR¥øgŸãP¨ýR©ýSªýTªýk¥ç^°ÿf¯øf´ÿ«Úqºþ’³á–µáƒÂþ¥½â—Ëý™Ìü¨Íõ¬Óú´ÙýÈÜõÆâþÍáøÉäýÔáòÊäþÐæüÕêýëôýõõøÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0b€‚=:Fƒˆ‚<+7E‰ƒ;#.4Aƒ */%)-0?‚$.2C\n(,,9\0\r1D\Z!\'@5	\">6&BÖ83G‰\0;',NULL,NULL,NULL,NULL),(24,'sys','noPicture.gif','image/gif',2141,'2013-12-14 18:15:36',2141,'GIF89a<\06\0çè\0\Z !&(%)+(/1.2319:8<>;=?<>@=@A?ACABDACEBLGFEJLIJHJKILNKMRTRTQRWYXVZWYVZ\\Y_ZYZ_a_]`[`bg\\\\j[bd_^]bdac`cebchjhjglixkmjnlpjnqmoloqnmqpqzpp…trvrtqkr’tvszut{y}|{sz|yzy|~{}~‡ƒ~g‡¢ƒ€¤uz‚ƒŒ…ƒ‡†„ˆ„†ƒ‰„ƒ‚‚£W•¸†ˆ…Š‰ƒŒ‡ˆŠ‡ˆ‰’ŠŒ‰ˆ“a™¶ŒŽ‹Žrš§Ž˜‘”rš´‘“”‘¡•“—“•’’—™•—”–˜•^¢ú/ÀÛ—™–m íš›˜›˜©œšž›ŸŸœqªé¬˜ ¢Ÿ¥ ŸŸŸ¶¡£ ¦¡ §¢¡£¥¢]¿Ø§¤©¦¨¥§©¦§§½©«¨ª¬©¬¨º­«¯¬®«­¯¬°®²®°­·¯¨°²®°°º±³¯±±»³µ²Ÿ·ã´¶³··®µ·´¸µºÎ¬²¶¸µ·¹¶µº½¯»È¸º·¸¹Ã¶»¾»¹½³ºÐÁ·½¿¹¸·¼¿º¼¹¸¾À¼¾»¶¿Ç¹¿Á¿½Á½¿¼¶ÂÃ»ÀÂ¾Á½¼ÁÃÄ¿½ÀÂ¾ÁÃ¿ÆÁÀÂÄÁÃÅÂÄÆÃÏÂÃÅÇÄËÅÄÆÈÅÄÉÌÇÉÆÈÊÇ´ÌøÉËÈÇÍÏËÎÊÍÏËÎÐÌÏÑÎÐÒÏÑÓÐÒÔÑØÒÑÕÓ×ÓÕÒÙÓÒÔÖÓÑ×ÙÅÙòÕ×ÔÖØÕÔÙÛØÚÖÙÛ×ÚÜÙàÚÙÜÞÛâÜÛÝßÜÞàÝßáÞàâßáäàãåáããîèãâäæãåçäæèåçéæèêçëêáéëèêìéëîêíïëîðíïñîðòïñóðòôñóõòô÷óöøôôùüøú÷ùûøúüùûýúüÿûþÿü\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!ù\n\0ÿ\0,\0\0\0\0<\06\0\0þ\0ÿ	H° Áƒ*\\È°¡Ã‡~‹,Ö*P:Z%KX´oC\"‡ŒU¦“(S¦d…œH‘Üp*”Í›8k¢ìd‹ÛK‡âveêdS¥Q”7Qî÷S¡³L¤â´y*U*RIgÍ4JZSƒç’y\n•Éæ(”¸œm3¨Í˜­QdµžVî«Àp¸D•E*ëšCf®ân•5î«¸[¡Æ–í„+[Hg©“ÅUøe8Y™>íÍt¬i®¸ ,e’UW$±²ŠC1³ëlëd‘ÒÈjŽKª\ZëRdCå¢¸³‰sŸÍdûëÓá\'™>Ä%»¬1¨dAojìæY_¹åkìß·“Ã§þÿ”93“Ï†Ì3gR5ÐôL ¢}ýw¯­†à:¡%¾*¨™àrNA…ÈAF(–[&.-dŒ\'ê¹b8¨„¢‰&·¬öO!B¤QÇMì!Ì*cô0F‘ÃÕ^È0ôÊ\'Á9s^\'yb‡’¼PƒX Çp±@8¨°ÇA¾ì5\n*y¡fž ¤C”å‡#¨àBFX 	,P@@d€¢AÖìåI\'Þ8ãX·”C<SËPª$ÒÆ#+$\0D$p§™Œ	£&-\Z4„tB¡%Œp‚eª`ƒ\r*x€À\n6° B˜å‰0\n!6Ö\'þŒ$D @|d\"I&` C±ÄŒA„\nX DL(š}‚‹B¨@éI›iÑ\0¡Àš”uÇ\Z\Zl€	D(bl\nM äŒª–¤¢\'¯~ÎAd`AZCŒ\' À§#„šAQQ¥©^&\nIÛÉ€‘1Fª„Ž4¨<Â,(Ÿ¬Q„\rAÁÃ:È€BØŒ2V(¼Ë¬f„²|Î3y¼‚\n„Â!Æj01DC¨»0Ã	eï((WY„Š7áðqH–Œ”%\Z$­´ÒK#LAB×xM\n¹ò‰f™¬ePX`‘‰6ç´D$µDÑÁþL•,Ò½À€B\rÃv&L&ÄËÊ™Èg\Z[¤ñÈ5ás†*¼‘*ŽÀëÉ%f´b\n, ŒMðÊ¢.l“òlÄXh!‰3âDÃ+°Œ!!G¬	o&‚Ì°B\ný—‰^Ä(Mj¬7•Î„ã0¨¨b‰Iøð¼6=âqÌhSMž8ŽP8³tAd|¡E\"ÖœS\r1¯œ‚8q„›ÀË‰\"¥ ÆA˜‘y-Äe!«2†1\"\Zá˜F0PAASP!NBNb	Í¸¢	ŒM8‘8…Tç$Q9H´ðgÈ¯ˆa.b‚ÄÀ	NØÃ\'Ì†¸	$þLCÂQštÆ zPDô¸!2ÄAÀˆÕ@D\nT\0ƒ‘ÅM<ñ	*D&È¡VA°p‡>À! ¼PaŒI£€¼pˆ{’»üÃ¨ …\'JQŒmœb‹ŸXC‚”L,ð+ª€ÏQ>Ç‡7{Å2ìˆ‹³á„‹NsÈS”	!Ú…<*™†Hp•¢t\"_‡qŒ—œ#=›a…ÛB\rã¥D@?	Ç-úE““tÂ y6p‰©€Â•É%,·2šÞ$Ë0IU‚‹yÙ¥r’\r(`ŒeLÃ\ZÖF2|a¼~­l|¾ˆ™Q\nä0ó(JKÍá2!E;Þ%®?™ÊTÖ¦¦›\0Ãšö4È6˜xÆ37š©f@Že¬RŸü$Ë+–!Æ…Ñ¸À…-×Ã‹(‚£4\r©HG\Z’€\0\0;','GIF89a<\06\0çè\0\Z !&(%)+(/1.2319:8<>;=?<>@=@A?ACABDACEBLGFEJLIJHJKILNKMRTRTQRWYXVZWYVZ\\Y_ZYZ_a_]`[`bg\\\\j[bd_^]bdac`cebchjhjglixkmjnlpjnqmoloqnmqpqzpp…trvrtqkr’tvszut{y}|{sz|yzy|~{}~‡ƒ~g‡¢ƒ€¤uz‚ƒŒ…ƒ‡†„ˆ„†ƒ‰„ƒ‚‚£W•¸†ˆ…Š‰ƒŒ‡ˆŠ‡ˆ‰’ŠŒ‰ˆ“a™¶ŒŽ‹Žrš§Ž˜‘”rš´‘“”‘¡•“—“•’’—™•—”–˜•^¢ú/ÀÛ—™–m íš›˜›˜©œšž›ŸŸœqªé¬˜ ¢Ÿ¥ ŸŸŸ¶¡£ ¦¡ §¢¡£¥¢]¿Ø§¤©¦¨¥§©¦§§½©«¨ª¬©¬¨º­«¯¬®«­¯¬°®²®°­·¯¨°²®°°º±³¯±±»³µ²Ÿ·ã´¶³··®µ·´¸µºÎ¬²¶¸µ·¹¶µº½¯»È¸º·¸¹Ã¶»¾»¹½³ºÐÁ·½¿¹¸·¼¿º¼¹¸¾À¼¾»¶¿Ç¹¿Á¿½Á½¿¼¶ÂÃ»ÀÂ¾Á½¼ÁÃÄ¿½ÀÂ¾ÁÃ¿ÆÁÀÂÄÁÃÅÂÄÆÃÏÂÃÅÇÄËÅÄÆÈÅÄÉÌÇÉÆÈÊÇ´ÌøÉËÈÇÍÏËÎÊÍÏËÎÐÌÏÑÎÐÒÏÑÓÐÒÔÑØÒÑÕÓ×ÓÕÒÙÓÒÔÖÓÑ×ÙÅÙòÕ×ÔÖØÕÔÙÛØÚÖÙÛ×ÚÜÙàÚÙÜÞÛâÜÛÝßÜÞàÝßáÞàâßáäàãåáããîèãâäæãåçäæèåçéæèêçëêáéëèêìéëîêíïëîðíïñîðòïñóðòôñóõòô÷óöøôôùüøú÷ùûøúüùûýúüÿûþÿü\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!ù\n\0ÿ\0,\0\0\0\0<\06\0\0þ\0ÿ	H° Áƒ*\\È°¡Ã‡~‹,Ö*P:Z%KX´oC\"‡ŒU¦“(S¦d…œH‘Üp*”Í›8k¢ìd‹ÛK‡âveêdS¥Q”7Qî÷S¡³L¤â´y*U*RIgÍ4JZSƒç’y\n•Éæ(”¸œm3¨Í˜­QdµžVî«Àp¸D•E*ëšCf®ân•5î«¸[¡Æ–í„+[Hg©“ÅUøe8Y™>íÍt¬i®¸ ,e’UW$±²ŠC1³ëlëd‘ÒÈjŽKª\ZëRdCå¢¸³‰sŸÍdûëÓá\'™>Ä%»¬1¨dAojìæY_¹åkìß·“Ã§þÿ”93“Ï†Ì3gR5ÐôL ¢}ýw¯­†à:¡%¾*¨™àrNA…ÈAF(–[&.-dŒ\'ê¹b8¨„¢‰&·¬öO!B¤QÇMì!Ì*cô0F‘ÃÕ^È0ôÊ\'Á9s^\'yb‡’¼PƒX Çp±@8¨°ÇA¾ì5\n*y¡fž ¤C”å‡#¨àBFX 	,P@@d€¢AÖìåI\'Þ8ãX·”C<SËPª$ÒÆ#+$\0D$p§™Œ	£&-\Z4„tB¡%Œp‚eª`ƒ\r*x€À\n6° B˜å‰0\n!6Ö\'þŒ$D @|d\"I&` C±ÄŒA„\nX DL(š}‚‹B¨@éI›iÑ\0¡Àš”uÇ\Z\Zl€	D(bl\nM äŒª–¤¢\'¯~ÎAd`AZCŒ\' À§#„šAQQ¥©^&\nIÛÉ€‘1Fª„Ž4¨<Â,(Ÿ¬Q„\rAÁÃ:È€BØŒ2V(¼Ë¬f„²|Î3y¼‚\n„Â!Æj01DC¨»0Ã	eï((WY„Š7áðqH–Œ”%\Z$­´ÒK#LAB×xM\n¹ò‰f™¬ePX`‘‰6ç´D$µDÑÁþL•,Ò½À€B\rÃv&L&ÄËÊ™Èg\Z[¤ñÈ5ás†*¼‘*ŽÀëÉ%f´b\n, ŒMðÊ¢.l“òlÄXh!‰3âDÃ+°Œ!!G¬	o&‚Ì°B\ný—‰^Ä(Mj¬7•Î„ã0¨¨b‰Iøð¼6=âqÌhSMž8ŽP8³tAd|¡E\"ÖœS\r1¯œ‚8q„›ÀË‰\"¥ ÆA˜‘y-Äe!«2†1\"\Zá˜F0PAASP!NBNb	Í¸¢	ŒM8‘8…Tç$Q9H´ðgÈ¯ˆa.b‚ÄÀ	NØÃ\'Ì†¸	$þLCÂQštÆ zPDô¸!2ÄAÀˆÕ@D\nT\0ƒ‘ÅM<ñ	*D&È¡VA°p‡>À! ¼PaŒI£€¼pˆ{’»üÃ¨ …\'JQŒmœb‹ŸXC‚”L,ð+ª€ÏQ>Ç‡7{Å2ìˆ‹³á„‹NsÈS”	!Ú…<*™†Hp•¢t\"_‡qŒ—œ#=›a…ÛB\rã¥D@?	Ç-úE““tÂ y6p‰©€Â•É%,·2šÞ$Ë0IU‚‹yÙ¥r’\r(`ŒeLÃ\ZÖF2|a¼~­l|¾ˆ™Q\nä0ó(JKÍá2!E;Þ%®?™ÊTÖ¦¦›\0Ãšö4È6˜xÆ37š©f@Že¬RŸü$Ë+–!Æ…Ñ¸À…-×Ã‹(‚£4\r©HG\Z’€\0\0;',NULL,NULL,NULL,NULL),(25,'sys','pending.gif','image/gif',607,'2013-12-14 18:15:36',607,'GIF89a\0\0Æe\0®S\0³]·a\0¸b\0¸c\0·cÀg\0¸h ¸i Àm\0Í\0Í‚\0Â~@à†\0ÕŠÔ\0ÇˆPß\0Ü˜\0Ü›\0Ì“`í–\0Ü¡\0Ü¤\0ã£\0Ñžpå«\0ë¨\0ë­\0×¦`ë®\0ë°\0û¨\0ë±\0ë³\0ëµ\0Ö¨û­\0ó´\0ëº\0û²\0ÿ°\0þ±\0ë»\0ù´\0ë½\0õ¸\0ë¾\0û·\0ëÀ\0ÿ¶\0ÿ¸\0ÿº\0û½\0ÿ»\0áº`ÿ½\0æ¾@ÿ¿\0öÄ\0ÿÀ\0ÿÁ\0õÇ\0ÿÂ\0ÿÃ\0ÿÄ\0ÿÆ\0ÿÈ\0æÃ`ÿÉ\0ïÉ0ÿÊ\0æÃpÿÌ\0ûÑ\0ëÌPûÖ\0ûÛ\0ÿÙ\0ÿÚ\0ÿÜ\0ûà\0ÿÞ\0ÿß\0ÿà\0ÿá\0ðÔpÿâ\0ÿã\0ÿå\0ÿæ\0ÿç\0ÿé\0ÿê\0õÞ`êÓ¿ÿéÿé úæ@ÿî ôéßÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0£€‚ƒ„…†\0\0‡„_\0VF\0_‚•$9Š\Z$‡dH1Š\"d†a/Š!I	…^Y-ŠG&“„—`W+ŠC@œ‚žbZT\'ŠB=,¤¦7\\XRNEA:4­c[UP>.?83*\0K]YSO#ŠxØ‘¢‚\"\"Qš0Q²c‚\Z0P”\0Ñ\0\0	E3j$UÉP \0;','GIF89a\0\0Æe\0®S\0³]·a\0¸b\0¸c\0·cÀg\0¸h ¸i Àm\0Í\0Í‚\0Â~@à†\0ÕŠÔ\0ÇˆPß\0Ü˜\0Ü›\0Ì“`í–\0Ü¡\0Ü¤\0ã£\0Ñžpå«\0ë¨\0ë­\0×¦`ë®\0ë°\0û¨\0ë±\0ë³\0ëµ\0Ö¨û­\0ó´\0ëº\0û²\0ÿ°\0þ±\0ë»\0ù´\0ë½\0õ¸\0ë¾\0û·\0ëÀ\0ÿ¶\0ÿ¸\0ÿº\0û½\0ÿ»\0áº`ÿ½\0æ¾@ÿ¿\0öÄ\0ÿÀ\0ÿÁ\0õÇ\0ÿÂ\0ÿÃ\0ÿÄ\0ÿÆ\0ÿÈ\0æÃ`ÿÉ\0ïÉ0ÿÊ\0æÃpÿÌ\0ûÑ\0ëÌPûÖ\0ûÛ\0ÿÙ\0ÿÚ\0ÿÜ\0ûà\0ÿÞ\0ÿß\0ÿà\0ÿá\0ðÔpÿâ\0ÿã\0ÿå\0ÿæ\0ÿç\0ÿé\0ÿê\0õÞ`êÓ¿ÿéÿé úæ@ÿî ôéßÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0£€‚ƒ„…†\0\0‡„_\0VF\0_‚•$9Š\Z$‡dH1Š\"d†a/Š!I	…^Y-ŠG&“„—`W+ŠC@œ‚žbZT\'ŠB=,¤¦7\\XRNEA:4­c[UP>.?83*\0K]YSO#ŠxØ‘¢‚\"\"Qš0Q²c‚\Z0P”\0Ñ\0\0	E3j$UÉP \0;',NULL,NULL,NULL,NULL),(26,'sys','permissions.gif','image/gif',1061,'2013-12-14 18:15:36',1061,'GIF89a\0\0çŒ\0šWšX”Y*šYš[š\\š] š_!š`!ša\"šc#”f8Ýxæ—•’’¥æ‡–šæšš«››®³™ˆÿŒé•¨Ÿ£ÿÿ“ª£¥ÿ•\n½¡‰ÿ—Î¤Xÿšÿš\rÐ¥Y¨¨¸ÿœÝ¦;Ò§[ÿŸî¦Ó¨\\æ§2ÿ¡¬¬¼­­½ÿ¤ÿ¤ÿ¥æ¬4ÿ¦¯¯¿Ë¬‰ÿ¨°°Á±±Á²²¼ÿ«ÿ¬Û±aÿ­´´Äß°gÿ¯ÿ¯æ¶9µµÄÞ³cà±jÿ²Ç´©··Æÿ´\Z¹¹Éÿ¶ÿ·ººËÙ·Šÿ¹½½Ìÿ¼æ»kÿ½éÄ@ÿ¿ ÁÁÊÿÄ#ÄÄÒÿÇ%ÿÈ%ÆÆÑÿÉ&ÏÆºÿË&ÉÉÒÊÊÕñÐMîÔJÍÍØÎÎÖÎÎÚÿ×-ÿÙ.ÒÒÒÑÑÛÑÑÜÿÚ/ÒÒÜÛÓÇÓÓÝñÞpÙÙÚÿè6ÿé6ßßãààçòßÅäääÿöNææêÿ÷Oÿ÷Pÿ÷\\êêìíííòíçîîòïïñòïëññóòòôûóæôôôôôöôô÷õõ÷öööööø÷÷ùýýþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0é\0ÿ	ü—¨\r“\'O’¤I4°á¡+d!\"ôGÌ•C\rÿ-Zó%Ð˜,ªìÑ‚fQCEGîx¹á§Pr„(jhÈŸs\nšð¦…¡†…XÔ¡ÐðÁ™…\ZÚÀ&Â §ƒpÁÐg \")†ˆˆÂ5Ê‡&|ÐØÄž<xÒªÅcL4ÂÄ™Kw.œ2(hì0Eß¿jÌtùq¡ƒÀ\nA¶(Î’‹\'2VH¨p8†*Rœ()¢ÃÅ	(ÿ« Š$@rÀXAÂƒ†¢+”XR„G\'BpÈ`h#$@pÀ@\0`ä_@\0;','GIF89a\0\0çŒ\0šWšX”Y*šYš[š\\š] š_!š`!ša\"šc#”f8Ýxæ—•’’¥æ‡–šæšš«››®³™ˆÿŒé•¨Ÿ£ÿÿ“ª£¥ÿ•\n½¡‰ÿ—Î¤Xÿšÿš\rÐ¥Y¨¨¸ÿœÝ¦;Ò§[ÿŸî¦Ó¨\\æ§2ÿ¡¬¬¼­­½ÿ¤ÿ¤ÿ¥æ¬4ÿ¦¯¯¿Ë¬‰ÿ¨°°Á±±Á²²¼ÿ«ÿ¬Û±aÿ­´´Äß°gÿ¯ÿ¯æ¶9µµÄÞ³cà±jÿ²Ç´©··Æÿ´\Z¹¹Éÿ¶ÿ·ººËÙ·Šÿ¹½½Ìÿ¼æ»kÿ½éÄ@ÿ¿ ÁÁÊÿÄ#ÄÄÒÿÇ%ÿÈ%ÆÆÑÿÉ&ÏÆºÿË&ÉÉÒÊÊÕñÐMîÔJÍÍØÎÎÖÎÎÚÿ×-ÿÙ.ÒÒÒÑÑÛÑÑÜÿÚ/ÒÒÜÛÓÇÓÓÝñÞpÙÙÚÿè6ÿé6ßßãààçòßÅäääÿöNææêÿ÷Oÿ÷Pÿ÷\\êêìíííòíçîîòïïñòïëññóòòôûóæôôôôôöôô÷õõ÷öööööø÷÷ùýýþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0é\0ÿ	ü—¨\r“\'O’¤I4°á¡+d!\"ôGÌ•C\rÿ-Zó%Ð˜,ªìÑ‚fQCEGîx¹á§Pr„(jhÈŸs\nšð¦…¡†…XÔ¡ÐðÁ™…\ZÚÀ&Â §ƒpÁÐg \")†ˆˆÂ5Ê‡&|ÐØÄž<xÒªÅcL4ÂÄ™Kw.œ2(hì0Eß¿jÌtùq¡ƒÀ\nA¶(Î’‹\'2VH¨p8†*Rœ()¢ÃÅ	(ÿ« Š$@rÀXAÂƒ†¢+”XR„G\'BpÈ`h#$@pÀ@\0`ä_@\0;',NULL,NULL,NULL,NULL),(27,'sys','permissions_gray.gif','image/gif',1053,'2013-12-14 18:15:36',1053,'GIF89a\0\0ç<\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~€€€‚‚‚ƒƒƒ„„„………†††‡‡‡ˆˆˆ‰‰‰ŠŠŠ‹‹‹ŒŒŒŽŽŽ‘‘‘’’’“““”””•••–––———˜˜˜™™™ššš›››œœœžžžŸŸŸ   ¡¡¡¢¢¢£££¤¤¤¥¥¥¦¦¦§§§¨¨¨©©©ªªª«««¬¬¬­­­®®®¯¯¯°°°±±±²²²³³³´´´µµµ¶¶¶···¸¸¸¹¹¹ººº»»»¼¼¼½½½¾¾¾¿¿¿ÀÀÀÁÁÁÂÂÂÃÃÃÄÄÄÅÅÅÆÆÆÇÇÇÈÈÈÉÉÉÊÊÊËËËÌÌÌÍÍÍÎÎÎÏÏÏÐÐÐÑÑÑÒÒÒÓÓÓÔÔÔÕÕÕÖÖÖ×××ØØØÙÙÙÚÚÚÛÛÛÜÜÜÝÝÝÞÞÞßßßàààáááâââãããäääåååæææçççèèèéééêêêëëëìììíííîîîïïïðððñññòòòóóóôôôõõõööö÷÷÷øøøùùùúúúûûûüüüýýýþþþÿÿÿ!þCreated with The GIMP\0!ù\n\0þ\0,\0\0\0\0\0\0\0á\0ý	ôg\Z¯_¿vI³7°a=cÏäÙ£÷Î™±z\rýõ›¶,Þ³X®„©;&­_Ã{¹Ì)›åŽž­YßnÝkHOV;UáÊã”í=š®ÈujHIšªŸß•¢–‰žSz“Ž‰r7PÜ­V·T!Dˆª+[âòÂ†îœÙ³fÍ-ã%0V3npãÂÝU,§‚IÛËw/2[ N	ütë˜aÃÆˆõŠÕJÓ§Á°~ûÕk.Z¯X¥²ôØß§V”uÙ¢«•ªS¤$uþ´Š®Z²2§2%\n”¢Î¸Þ°Y£FM\Z4gÌ”)c—¿€\0;','GIF89a\0\0ç<\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~€€€‚‚‚ƒƒƒ„„„………†††‡‡‡ˆˆˆ‰‰‰ŠŠŠ‹‹‹ŒŒŒŽŽŽ‘‘‘’’’“““”””•••–––———˜˜˜™™™ššš›››œœœžžžŸŸŸ   ¡¡¡¢¢¢£££¤¤¤¥¥¥¦¦¦§§§¨¨¨©©©ªªª«««¬¬¬­­­®®®¯¯¯°°°±±±²²²³³³´´´µµµ¶¶¶···¸¸¸¹¹¹ººº»»»¼¼¼½½½¾¾¾¿¿¿ÀÀÀÁÁÁÂÂÂÃÃÃÄÄÄÅÅÅÆÆÆÇÇÇÈÈÈÉÉÉÊÊÊËËËÌÌÌÍÍÍÎÎÎÏÏÏÐÐÐÑÑÑÒÒÒÓÓÓÔÔÔÕÕÕÖÖÖ×××ØØØÙÙÙÚÚÚÛÛÛÜÜÜÝÝÝÞÞÞßßßàààáááâââãããäääåååæææçççèèèéééêêêëëëìììíííîîîïïïðððñññòòòóóóôôôõõõööö÷÷÷øøøùùùúúúûûûüüüýýýþþþÿÿÿ!þCreated with The GIMP\0!ù\n\0þ\0,\0\0\0\0\0\0\0á\0ý	ôg\Z¯_¿vI³7°a=cÏäÙ£÷Î™±z\rýõ›¶,Þ³X®„©;&­_Ã{¹Ì)›åŽž­YßnÝkHOV;UáÊã”í=š®ÈujHIšªŸß•¢–‰žSz“Ž‰r7PÜ­V·T!Dˆª+[âòÂ†îœÙ³fÍ-ã%0V3npãÂÝU,§‚IÛËw/2[ N	ütë˜aÃÆˆõŠÕJÓ§Á°~ûÕk.Z¯X¥²ôØß§V”uÙ¢«•ªS¤$uþ´Š®Z²2§2%\n”¢Î¸Þ°Y£FM\Z4gÌ”)c—¿€\0;',NULL,NULL,NULL,NULL),(28,'sys','preview.gif','image/gif',366,'2013-12-14 18:15:36',366,'GIF89a\0\0¥?\0\0\0\0/>N.@T9IZ9MZJLJ9QcBMcBQkAVeZq„ZqŒZuŒsusc}”c}œc‚œc‚¥k‚œk†¥kŠ¥kŠ­kŽ­s–½„–­„šµ{ž½{žÆ„ž½Œžµ„¢ÆŒ¢µ„¦ÆŒ¦ÆŒªÎ”ª½”®Î­ª­œ²Îœ¶Îµ²µµ¶µ­¾Ö­ÃÖ­ÃÞµÃÎµÇÖµÇÞµËÞÎ×çÖÛÞÖßçÖßïÖãïççïçë÷çï÷ïï÷÷÷÷÷÷ÿÿûÿÿÿÿ!ù\n\0?\0,\0\0\0\0\0\0\0‹ÀŸP(TÂ¤2PX,@™42)[íõa¨*ÇtÛõx´™`F —ÍÜƒE¦m	$ŠÙt>8xB\0)\"$~95wJ\0-{\"}3%„?*#2{lm\r&,(\Zšm\0DT›FG?¹°»?\0À+Â»Å\'ÈTÊÍÎSA\0;','GIF89a\0\0¥?\0\0\0\0/>N.@T9IZ9MZJLJ9QcBMcBQkAVeZq„ZqŒZuŒsusc}”c}œc‚œc‚¥k‚œk†¥kŠ¥kŠ­kŽ­s–½„–­„šµ{ž½{žÆ„ž½Œžµ„¢ÆŒ¢µ„¦ÆŒ¦ÆŒªÎ”ª½”®Î­ª­œ²Îœ¶Îµ²µµ¶µ­¾Ö­ÃÖ­ÃÞµÃÎµÇÖµÇÞµËÞÎ×çÖÛÞÖßçÖßïÖãïççïçë÷çï÷ïï÷÷÷÷÷÷ÿÿûÿÿÿÿ!ù\n\0?\0,\0\0\0\0\0\0\0‹ÀŸP(TÂ¤2PX,@™42)[íõa¨*ÇtÛõx´™`F —ÍÜƒE¦m	$ŠÙt>8xB\0)\"$~95wJ\0-{\"}3%„?*#2{lm\r&,(\Zšm\0DT›FG?¹°»?\0À+Â»Å\'ÈTÊÍÎSA\0;',NULL,NULL,NULL,NULL),(29,'sys','previous.gif','image/gif',542,'2013-12-14 18:15:36',542,'GIF89a\0\0ÆH\0^¾#eÅ%hÅ&lË&mÊ)nË+oË+sÑ.vÑ0wÒ1wÒ1|Ø3}Ø4~Ø5~×6Ø6„Þ;†Þ;†ß=Œä@åAŽå_‡ÉRŒÖF•ëF–ëcÎ^“ØI›ñg“ÒKñKòb™Ýk˜ÖbœâP¤÷Q¤ø\\¡ëlœÛ\\¡ìQ¥øR¥øgŸãP¨ýR©ýSªýTªýk¥ç^°ÿf¯øf´ÿ«Úqºþ’³á–µáƒÂþ¥½â—Ëý™Ìü¨Íõ¬Óú´ÙýÈÜõÆâþÍáøÉäýÔáòÊäþÐæüÕêýëôýõõøÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0b€‚‚F:=ƒˆE7+<‰‚A4.#;?0-)%/* C2.$9,,(\nD1\r\0‚@\'!\Zƒ>\"	5‚B&6Ö‚G38ˆ\0;','GIF89a\0\0ÆH\0^¾#eÅ%hÅ&lË&mÊ)nË+oË+sÑ.vÑ0wÒ1wÒ1|Ø3}Ø4~Ø5~×6Ø6„Þ;†Þ;†ß=Œä@åAŽå_‡ÉRŒÖF•ëF–ëcÎ^“ØI›ñg“ÒKñKòb™Ýk˜ÖbœâP¤÷Q¤ø\\¡ëlœÛ\\¡ìQ¥øR¥øgŸãP¨ýR©ýSªýTªýk¥ç^°ÿf¯øf´ÿ«Úqºþ’³á–µáƒÂþ¥½â—Ëý™Ìü¨Íõ¬Óú´ÙýÈÜõÆâþÍáøÉäýÔáòÊäþÐæüÕêýëôýõõøÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0b€‚‚F:=ƒˆE7+<‰‚A4.#;?0-)%/* C2.$9,,(\nD1\r\0‚@\'!\Zƒ>\"	5‚B&6Ö‚G38ˆ\0;',NULL,NULL,NULL,NULL),(30,'sys','print.gif','image/gif',1721,'2013-12-14 18:15:36',1721,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:2B010B4069DD11E0864E8F881E47E1D9\" xmpMM:InstanceID=\"xmp.iid:2B010B3F69DD11E0864E8F881E47E1D9\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8D7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>E¡Æ‘\0\0ëIDATxÚbüÿÿ?0311ý422j F˜ËçÏŸÿ_¹r… €@\"¿þüäîÏÿ®u‡~3¿~ýúïß¿ÿÙþ|dXÝ›É@p=0ÀÔÔÔÄyáéßÿo?ÿ\0Ë0þùóçÿ·oßÀ²\\\\\\,;wîdàà\0Ü»} €À¶€ð›OßÁÚÞ|úñ¿vÓ£ÿvÙ[ØAâ ºòððÜ•`xþ…•áÍWFIA†Óß×\\Ü<¹åçÏŸ»¸¹¹^>¹ÏðêùsˆK€Øû<ƒgH2Ü™i3Oíb`€ðþ3üýûÿß¼lsf€\0Âð:\0™ÆàÕ~ô×{`p¼ûòóÿçŸÿ§Lºý\rE3Óß‡ïYî¾cbà`fbh‹“æLLLä‡³´´ôÿ[?DY¼å˜€Ê_}e`âga‘«NKK;Æ\0\n©Ó§Oÿÿôé\n‰üc¹}û6Ã™3g¾|ùw˜„„˜>þ<#Ó…^½zÅ\0Œ 8¾xù\ZÃ½{÷ž<y	‡¤i\'ÿ²011ABà?###Ã¬tSF ÀPÂã	œ|ìÑLŒÎ 9 üÁðŸhØß¿ý?íH§uF@Á\"„}:}%Ÿ³ÿ\0ñïÿ\'üüèÎÿ?~ÿýöÙŸÿ-ÛýwªÜ¿YÈ`\"JRþs¸0ƒÄÆ²Ÿ	fÃáÛ?~ýûÇc\'ÆpèÌÃà¨¨¨Ï¿~ý*X³fÍ\\ÆÆÆÆKºbbbS§Ne dgg3Ü¹s‡aÒ¤IwY€)\\W]],¡§§Ç`bbÂðæÍ¬\ZEDDŽ9Â ((È`jjÊ\0L…Ê,ÀHcØ³gX(:-Zfÿøñƒáë×¯ÀüÅðñãG0ùYGG‡AHH¬dcrròL ,ÿþ­Ëi›Ï05ÉˆáÛ/H²ý÷œl~ÿýËðÙsÎ2ž2ìPÉJ‚É™\0\0 J“TÍ7LW\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:2B010B4069DD11E0864E8F881E47E1D9\" xmpMM:InstanceID=\"xmp.iid:2B010B3F69DD11E0864E8F881E47E1D9\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8D7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>E¡Æ‘\0\0ëIDATxÚbüÿÿ?0311ý422j F˜ËçÏŸÿ_¹r… €@\"¿þüäîÏÿ®u‡~3¿~ýúïß¿ÿÙþ|dXÝ›É@p=0ÀÔÔÔÄyáéßÿo?ÿ\0Ë0þùóçÿ·oßÀ²\\\\\\,;wîdàà\0Ü»} €À¶€ð›OßÁÚÞ|úñ¿vÓ£ÿvÙ[ØAâ ºòððÜ•`xþ…•áÍWFIA†Óß×\\Ü<¹åçÏŸ»¸¹¹^>¹ÏðêùsˆK€Øû<ƒgH2Ü™i3Oíb`€ðþ3üýûÿß¼lsf€\0Âð:\0™ÆàÕ~ô×{`p¼ûòóÿçŸÿ§Lºý\rE3Óß‡ïYî¾cbà`fbh‹“æLLLä‡³´´ôÿ[?DY¼å˜€Ê_}e`âga‘«NKK;Æ\0\n©Ó§Oÿÿôé\n‰üc¹}û6Ã™3g¾|ùw˜„„˜>þ<#Ó…^½zÅ\0Œ 8¾xù\ZÃ½{÷ž<y	‡¤i\'ÿ²011ABà?###Ã¬tSF ÀPÂã	œ|ìÑLŒÎ 9 üÁðŸhØß¿ý?íH§uF@Á\"„}:}%Ÿ³ÿ\0ñïÿ\'üüèÎÿ?~ÿýöÙŸÿ-ÛýwªÜ¿YÈ`\"JRþs¸0ƒÄÆ²Ÿ	fÃáÛ?~ýûÇc\'ÆpèÌÃà¨¨¨Ï¿~ý*X³fÍ\\ÆÆÆÆKºbbbS§Ne dgg3Ü¹s‡aÒ¤IwY€)\\W]],¡§§Ç`bbÂðæÍ¬\ZEDDŽ9Â ((È`jjÊ\0L…Ê,ÀHcØ³gX(:-Zfÿøñƒáë×¯ÀüÅðñãG0ùYGG‡AHH¬dcrròL ,ÿþ­Ëi›Ï05ÉˆáÛ/H²ý÷œl~ÿýËðÙsÎ2ž2ìPÉJ‚É™\0\0 J“TÍ7LW\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(31,'sys','quickAccess_accountInfo.png','image/png',3852,'2013-12-14 18:15:36',3852,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0®IDATxÚbüÿÿ?6ÀÂŸ>ù‡!\"8_w0ÞyŸÁ$f&ÃêU+á’Œ—úÿ_uâÅÿ“þýêc&Ì¦û¦*b\"Ü_¿}gøòõ;DËÿ™2ÿÝÝÝE@Ža€\0bÄéªWoÞÿçä`Cdfff`áåádx¤”áàîSßÕÓÁþAÿþþý?uÅ£ÿWŸýý¿zõ\Z°‹^¼xùŸéÇÏ_>î2L¬ŒoÞ¼»èÓ «®¤i¿:ôKxx¸*Ø…PW#”ƒÝih\0¤äqÆŸ¾0|þò•áÑú†/+Ö×[ùØ0ÈÆ¿ÿü»±!•aÁö—\nò\\ÂrX1„GD¡ØðíÛHd,\\¸ˆaÿ¾ßé«€!Ëð—l?Ãµ+—._¹qÿúù¢óÏŸ?ÿoe$ÿŸ8qâÿWßþƒñ¡c§þƒÄÑÃ\ZM¡™ÿ§Éüïg`àÀåQd@ŒD0Mš4i\'Ô‰10Qjƒlø\n.b\0/O$²\0/Ãf0ÆÀÁúzo\"ƒ’™Ã³koþ	«0ð«0 ¤u\rGÊ,ÌËç]b`Pd¸{ˆ‡ÁÕçCPp8}bµá5¯5ƒ‰ª7¯önq†—>1H	ãpÒ¦ÇL’ú×>°10cùùËï¬Ì,ö¬€E\"+‚Béû÷;ŸeÐ3±bø\rÌÊL@M¿ÿaPàýÍðùë7°úï?~0(+ÈF2µ¶¶ža3Ûo†¯_³*#Ë?†c›0pp°3Hˆ‰0HŠ‹0(ÉË€,xÃ0Ÿýÿ-ïÿ—CÕ_ûùù1DEE™ÖÕÕaMàTñÿ®ïÿ£f,ïˆIG €µª	m\"\nÂßnv7­$M¶¡¤?†T\ZÔJÄƒÒ‹?µH¡/B+”BA„â¡ô\"¹¨…êAÅ£7aÕ¢àQ©xP\ZD\"±b© ¤mÚÚu7Ù¼]çí&MUSèƒá=vyof¾ùæ›si§K(e}K¯A‘Eˆ„(¸;q\rQ„@gÆÁ«úW>Îî_ŽÚ²Ü0–Êž\Zdr ÕxÏ~|´utŸ‡M,<Ðþ3jÎ:\\M¿¨œV\\OÏÁ·ï–SÏð<¹Œh$†þÄ‹º¡aŒA\r*Í£(2|KSð{?Á/¼ÆoÁÆbêî¿QaìÂW=ŒL&S·ÎÃ-fó%<E5ŠŸï5\\¾3‡xß%Äºz18Ð@N=ÐÍ<rBé/YÌ¿,ÑÕÛAdY-D…‚Iô¶1yí*âgFÑ‹C¡ÞTD·3¸Æ©ÐºÇ\'Ÿ±ð§ûúÝ¢nCOF¬ˆFÚ+E.27¥ìæ&u‹Š6Ÿ\rƒäØ¤®~£H”h€=Èn´Àëõ:-ÈêÄPÊH7òôž›AEÀJBxóÖmÌÎÜ3sÓDmó‘&²\0ÐA»JRm®ÌC”ŠÔâŠï‡¤bô­ª\\[•ÇäìðØ¡ïáëã¡ãÇŽâÂÀ‰‰žS\'¯ì?p°µ¹¥Õ‰~}5O¥>$t]ŸÖ4\r\\dšƒG#þÖÙ˜¦ñ‘¼Ø½b>kóq’ìñ¬ÝöÔ;KÿgRèôÉë¡—#?^Í±ö€±›RñG\0Ú«%¦‰(ŠžþÛ™Ò*\nhY‹€\n1Aeã\n\rºÃ…\Zu¡	‰ºRwº0êÆÿVcb\"hL$jLPùX‘DQÀˆŸ\nÅ:åÓï›Ø*„Bô&w:o¦ïÝ¼;÷žsÞÇ\"5þ³©y*úåŸzmmmÓDùnïë÷Ü4ÈHªf£H\Zs¯!Ô§iQäTMþÚÆ\")+]ö«×3¾S©åFÓR\rr&ã4•BM(E5«‹Pt‚Ÿg2`‹¦âë¯#Ÿ_Ê÷Ü¢\"èÌöÉwŠ‚©B³üifí3Xf%Z;DØ§]dFé¢Õþ½os#æ$\\ºrF!;NlS))RãÛ“c°ÚÂ°¤&a$d…?¬Âg¯ûN]Awãé¸I³N«}ð#’³1„à}×‰ç-_àzàjò`I–Ë;:ˆk#sO‘yÃ9ül=„æ7Atõ`4eì«J iñb8dAHGZÚ ÜîWÈÏ/˜eŠhCMûa[QsÿH¡RŒù³°ÌQŒ¼b	&Í8ôü<<kD‰}çÎžÍfK<E¬14!¿ˆ‹_0ß¾…[ÖÃˆàÓw	‹8Žª\nHÏæÑHÆÊ‚<®YK;×&¶–[Ûæó`Ê\"Ó©Gaù^š¬Q1RÔQ¢˜_°@‡,g1ÚÚÛ‘·\"?®{YSNÐg’ÀÿPWW\'w^oo/ôB*¾ˆà}D•á(\Z2NŽHQéïÅ˜1Œ–\'Ñ×ó!FéJqÝ¿gÏîß**vÊƒÎÎN<xô¹‹P™(\0“ÃvY»˜tÄPô@t8°qSé_zšñq,È-<®”_NN|ß?Ñ!¹Vâ¶yŠ[Lìx@B>ä:$]4rzÇ™âS<¢x\\\0ÕÄQ’ªIH6ã®ë\Z´ûlAŽÜÈœÆá‰ý†»ÈÌ\\ªèÐÈ”û‘½<ÏÉRï‡Ë…´Ò‹ŠpÛuÛ¨äŒº(Œ0Mäÿ)âÅÃ;(/ß.=›7UWW¿ŽŠ²;ä)¼®rÝ«­UâÜ?y¢ïe ø°põê]3ìjŽó£««ëµÛíÞDr ­­MVÓ)ŠIN¾H«I[Yê.«2t¿Gàý4ÿZq4;çr{k«ª¬¬ÌÉqœ^Å·‹e¤¾¾>^–Ìd×xÝÁÑîrIjX%â¥TÞJ‘-zJzèÞJiø° ] ÅëfÅ	¸ê{Rkf‰õ‰ø%@sVÛT†Ÿ{ÛÛÞvm×uí¶ìæsˆ âÐ°™ð‘€Ã\"þ2òËàcbêã/MŒÆD‰Då3AÂñ	AÂ:\r¶ÁÆÆº±µëÖÝÞÛ{ë{no»v+Û˜›ñ$ooÏí½§ç=çýxž÷,:.ZìÆ¥¸C‰ï¿Àbÿ²1Z0Dˆè!-~Ôl(±I–å“ýƒÝÉu<¦&¿Oy?µ?yŸuxLéÇ—¶®†™¡4n(ñ¾EØ»Ûèë©D>²\ntóLÓñ$Kñ~F›Mâuã;—Ç“Kí¥u2$})bÉ”@ýûße]1Â²¶uÛN=MŠÄ—¢1ì´s×Kx~z¾Ov(9™ynÆü—‚#|–S\\§Ç©gP\"ð‡PzžP¬È«;´hšÇ¦) „gQ€ËâŠ2h¥[a²(‰hTÃíùo£õÆ(6×eÞù¶T7£Œ ˜ôª“–Æ<&¹¨Õÿ\0!AÂÀµq·WÂ„9“ƒBƒ	Õ•Ë(w¶Ì	KÎ;Í®\0¡³{QôÒÆIf“lˆ*÷ãÄß`E….â;ÚÚáWÂ°Ømzóáq;5†jjl2QX³8øó2/Ñ±‘{è¹}Í×@‰Y`µå!¤:qÕo#ð½ù‹Pãö@$sâiT%‚³¿F S_?AØ‡D\'ŠÐ„ÔYv€$Â{¡ÝGºI‰\n”,–\rGqøže|žRp=£¤q5K^ÄLv¸Mæ	fIp–ç@ËÈöõ`\"Æ‰ãG‘—_€uëÖÍ‰IÌìÄ3ì€žX÷gŽúL¹î¨°ØpäÈ)Ü“Ë°rÃ2Ê¹<µxu¥2§bœªÊi”\\bx\rîl…¾,ŠÜY¸Õ#ÂO»ZU»võŽþú^®«CqqÉ¼N((x’:¾gÌžXfpð\n¢·.âëŸ.`L¬ÛåBÄúÊkJ›/B8X)$Û¹8ëÑ“ª1Î˜ÂÆˆ ¯Ð‚dÆß…¨Y±\n§›š`±Záp8æeBv›)Ä»‚› ‘{Ú;–Ã>å—ãÙº((-„¬ÄéDššbÓ\'Ïr\'›<Ûéqâ‰ãô<GfYTéÏiÃÚµãF}}C¼–‹§í$d@\nl0¬EŠ(Æ310ÄðD\"lv‰éÃï÷CF¡ÆˆLeñpZb`GbŒ\n2aõâhÌ(æO+žK—Ú(¯Ð‚°äIE!†#X¬… 1zˆXrbé“ž®D’ÏFYÉÖ¨Üé×ÒÒ2rjrxòÄ™L>Åyèõ4vB‘¸jS`g˜\njº\ríàÜéëC>9´¸«7ËŠ’~:…ËGY½:…Ô)Qh\ZtfŽœÐÚçõâõ;Ð×{WÏCïÃ^:ˆÏ¢UuçË¦+ù.E\"CèžÃÿÝ.ÄµÅÆq§õ\nFA¬YS«kÌ\"^*Õe“Ë$ñß4=„jjæˆ)´‰ó^W\"®ÅÊåÕè¬]¿ÚÛÑv©	-6Ùo½îÔléÙ¢MÅ›‰Ud¥\rI#Ðß…»m­‰aÓæ-ô…j%n×Ñ¨š^ÑÌtxÂž1 5?y¢¥\ZvŠ¸„Å7žò¯éÑ´ºq÷ªzï[û²†]/‚î_oiÁÍÖV%Ï›+¸<>ä.ÉîuºsÈ´,ºÒŠ¬rrxò¨v^qvwv*.^ì8þüåj)µ`ÍÕ¨që™ùç©;ðø0ð3í¸è°›÷•7V}²ô@M®cˆOC6 XQñÙ—\'	\0íù  \0ÏUV®öz}¯y½¹µÙ.W‘(ZmÏkQ%\Zï…B—‚Áà™æææîõë×kñ¹ãéJs¡”ßÆAÌ¶›ß®j¬ú´êýš«Fñ¯£è€ÔÀíæ‰á®ëÚGÁ¾#—w/744èaM$ÏfÂü‡Uh¬Ž¹ÌDØD]–7«÷T~µâ@ÛÆ&~÷Ðõ÷¸Ñ,\rÞiUŽDñÙX¤qAÙB)`ŽÚMež\n³ÓÖÙI“ïC¸;ˆ«Í’¿í†zhHÁ÷”Ò\"ïýŸ«ô±¨ÊqñÛ³ì(~¬ý>¨àXñjþ%XeèàFÛ\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0®IDATxÚbüÿÿ?6ÀÂŸ>ù‡!\"8_w0ÞyŸÁ$f&ÃêU+á’Œ—úÿ_uâÅÿ“þýêc&Ì¦û¦*b\"Ü_¿}gøòõ;DËÿ™2ÿÝÝÝE@Ža€\0bÄéªWoÞÿçä`Cdfff`áåádx¤”áàîSßÕÓÁþAÿþþý?uÅ£ÿWŸýý¿zõ\Z°‹^¼xùŸéÇÏ_>î2L¬ŒoÞ¼»èÓ «®¤i¿:ôKxx¸*Ø…PW#”ƒÝih\0¤äqÆŸ¾0|þò•áÑú†/+Ö×[ùØ0ÈÆ¿ÿü»±!•aÁö—\nò\\ÂrX1„GD¡ØðíÛHd,\\¸ˆaÿ¾ßé«€!Ëð—l?Ãµ+—._¹qÿúù¢óÏŸ?ÿoe$ÿŸ8qâÿWßþƒñ¡c§þƒÄÑÃ\ZM¡™ÿ§Éüïg`àÀåQd@ŒD0Mš4i\'Ô‰10Qjƒlø\n.b\0/O$²\0/Ãf0ÆÀÁúzo\"ƒ’™Ã³koþ	«0ð«0 ¤u\rGÊ,ÌËç]b`Pd¸{ˆ‡ÁÕçCPp8}bµá5¯5ƒ‰ª7¯önq†—>1H	ãpÒ¦ÇL’ú×>°10cùùËï¬Ì,ö¬€E\"+‚Béû÷;ŸeÐ3±bø\rÌÊL@M¿ÿaPàýÍðùë7°úï?~0(+ÈF2µ¶¶ža3Ûo†¯_³*#Ë?†c›0pp°3Hˆ‰0HŠ‹0(ÉË€,xÃ0Ÿýÿ-ïÿ—CÕ_ûùù1DEE™ÖÕÕaMàTñÿ®ïÿ£f,ïˆIG €µª	m\"\nÂßnv7­$M¶¡¤?†T\ZÔJÄƒÒ‹?µH¡/B+”BA„â¡ô\"¹¨…êAÅ£7aÕ¢àQ©xP\ZD\"±b© ¤mÚÚu7Ù¼]çí&MUSèƒá=vyof¾ùæ›si§K(e}K¯A‘Eˆ„(¸;q\rQ„@gÆÁ«úW>Îî_ŽÚ²Ü0–Êž\Zdr ÕxÏ~|´utŸ‡M,<Ðþ3jÎ:\\M¿¨œV\\OÏÁ·ï–SÏð<¹Œh$†þÄ‹º¡aŒA\r*Í£(2|KSð{?Á/¼ÆoÁÆbêî¿QaìÂW=ŒL&S·ÎÃ-fó%<E5ŠŸï5\\¾3‡xß%Äºz18Ð@N=ÐÍ<rBé/YÌ¿,ÑÕÛAdY-D…‚Iô¶1yí*âgFÑ‹C¡ÞTD·3¸Æ©ÐºÇ\'Ÿ±ð§ûúÝ¢nCOF¬ˆFÚ+E.27¥ìæ&u‹Š6Ÿ\rƒäØ¤®~£H”h€=Èn´Àëõ:-ÈêÄPÊH7òôž›AEÀJBxóÖmÌÎÜ3sÓDmó‘&²\0ÐA»JRm®ÌC”ŠÔâŠï‡¤bô­ª\\[•ÇäìðØ¡ïáëã¡ãÇŽâÂÀ‰‰žS\'¯ì?p°µ¹¥Õ‰~}5O¥>$t]ŸÖ4\r\\dšƒG#þÖÙ˜¦ñ‘¼Ø½b>kóq’ìñ¬ÝöÔ;KÿgRèôÉë¡—#?^Í±ö€±›RñG\0Ú«%¦‰(ŠžþÛ™Ò*\nhY‹€\n1Aeã\n\rºÃ…\Zu¡	‰ºRwº0êÆÿVcb\"hL$jLPùX‘DQÀˆŸ\nÅ:åÓï›Ø*„Bô&w:o¦ïÝ¼;÷žsÞÇ\"5þ³©y*úåŸzmmmÓDùnïë÷Ü4ÈHªf£H\Zs¯!Ô§iQäTMþÚÆ\")+]ö«×3¾S©åFÓR\rr&ã4•BM(E5«‹Pt‚Ÿg2`‹¦âë¯#Ÿ_Ê÷Ü¢\"èÌöÉwŠ‚©B³üifí3Xf%Z;DØ§]dFé¢Õþ½os#æ$\\ºrF!;NlS))RãÛ“c°ÚÂ°¤&a$d…?¬Âg¯ûN]Awãé¸I³N«}ð#’³1„à}×‰ç-_àzàjò`I–Ë;:ˆk#sO‘yÃ9ül=„æ7Atõ`4eì«J iñb8dAHGZÚ ÜîWÈÏ/˜eŠhCMûa[QsÿH¡RŒù³°ÌQŒ¼b	&Í8ôü<<kD‰}çÎžÍfK<E¬14!¿ˆ‹_0ß¾…[ÖÃˆàÓw	‹8Žª\nHÏæÑHÆÊ‚<®YK;×&¶–[Ûæó`Ê\"Ó©Gaù^š¬Q1RÔQ¢˜_°@‡,g1ÚÚÛ‘·\"?®{YSNÐg’ÀÿPWW\'w^oo/ôB*¾ˆà}D•á(\Z2NŽHQéïÅ˜1Œ–\'Ñ×ó!FéJqÝ¿gÏîß**vÊƒÎÎN<xô¹‹P™(\0“ÃvY»˜tÄPô@t8°qSé_zšñq,È-<®”_NN|ß?Ñ!¹Vâ¶yŠ[Lìx@B>ä:$]4rzÇ™âS<¢x\\\0ÕÄQ’ªIH6ã®ë\Z´ûlAŽÜÈœÆá‰ý†»ÈÌ\\ªèÐÈ”û‘½<ÏÉRï‡Ë…´Ò‹ŠpÛuÛ¨äŒº(Œ0Mäÿ)âÅÃ;(/ß.=›7UWW¿ŽŠ²;ä)¼®rÝ«­UâÜ?y¢ïe ø°põê]3ìjŽó£««ëµÛíÞDr ­­MVÓ)ŠIN¾H«I[Yê.«2t¿Gàý4ÿZq4;çr{k«ª¬¬ÌÉqœ^Å·‹e¤¾¾>^–Ìd×xÝÁÑîrIjX%â¥TÞJ‘-zJzèÞJiø° ] ÅëfÅ	¸ê{Rkf‰õ‰ø%@sVÛT†Ÿ{ÛÛÞvm×uí¶ìæsˆ âÐ°™ð‘€Ã\"þ2òËàcbêã/MŒÆD‰Då3AÂñ	AÂ:\r¶ÁÆÆº±µëÖÝÞÛ{ë{no»v+Û˜›ñ$ooÏí½§ç=çýxž÷,:.ZìÆ¥¸C‰ï¿Àbÿ²1Z0Dˆè!-~Ôl(±I–å“ýƒÝÉu<¦&¿Oy?µ?yŸuxLéÇ—¶®†™¡4n(ñ¾EØ»Ûèë©D>²\ntóLÓñ$Kñ~F›Mâuã;—Ç“Kí¥u2$})bÉ”@ýûße]1Â²¶uÛN=MŠÄ—¢1ì´s×Kx~z¾Ov(9™ynÆü—‚#|–S\\§Ç©gP\"ð‡PzžP¬È«;´hšÇ¦) „gQ€ËâŠ2h¥[a²(‰hTÃíùo£õÆ(6×eÞù¶T7£Œ ˜ôª“–Æ<&¹¨Õÿ\0!AÂÀµq·WÂ„9“ƒBƒ	Õ•Ë(w¶Ì	KÎ;Í®\0¡³{QôÒÆIf“lˆ*÷ãÄß`E….â;ÚÚáWÂ°Ømzóáq;5†jjl2QX³8øó2/Ñ±‘{è¹}Í×@‰Y`µå!¤:qÕo#ð½ù‹Pãö@$sâiT%‚³¿F S_?AØ‡D\'ŠÐ„ÔYv€$Â{¡ÝGºI‰\n”,–\rGqøže|žRp=£¤q5K^ÄLv¸Mæ	fIp–ç@ËÈöõ`\"Æ‰ãG‘—_€uëÖÍ‰IÌìÄ3ì€žX÷gŽúL¹î¨°ØpäÈ)Ü“Ë°rÃ2Ê¹<µxu¥2§bœªÊi”\\bx\rîl…¾,ŠÜY¸Õ#ÂO»ZU»võŽþú^®«CqqÉ¼N((x’:¾gÌžXfpð\n¢·.âëŸ.`L¬ÛåBÄúÊkJ›/B8X)$Û¹8ëÑ“ª1Î˜ÂÆˆ ¯Ð‚dÆß…¨Y±\n§›š`±Záp8æeBv›)Ä»‚› ‘{Ú;–Ã>å—ãÙº((-„¬ÄéDššbÓ\'Ïr\'›<Ûéqâ‰ãô<GfYTéÏiÃÚµãF}}C¼–‹§í$d@\nl0¬EŠ(Æ310ÄðD\"lv‰éÃï÷CF¡ÆˆLeñpZb`GbŒ\n2aõâhÌ(æO+žK—Ú(¯Ð‚°äIE!†#X¬… 1zˆXrbé“ž®D’ÏFYÉÖ¨Üé×ÒÒ2rjrxòÄ™L>Åyèõ4vB‘¸jS`g˜\njº\ríàÜéëC>9´¸«7ËŠ’~:…ËGY½:…Ô)Qh\ZtfŽœÐÚçõâõ;Ð×{WÏCïÃ^:ˆÏ¢UuçË¦+ù.E\"CèžÃÿÝ.ÄµÅÆq§õ\nFA¬YS«kÌ\"^*Õe“Ë$ñß4=„jjæˆ)´‰ó^W\"®ÅÊåÕè¬]¿ÚÛÑv©	-6Ùo½îÔléÙ¢MÅ›‰Ud¥\rI#Ðß…»m­‰aÓæ-ô…j%n×Ñ¨š^ÑÌtxÂž1 5?y¢¥\ZvŠ¸„Å7žò¯éÑ´ºq÷ªzï[û²†]/‚î_oiÁÍÖV%Ï›+¸<>ä.ÉîuºsÈ´,ºÒŠ¬rrxò¨v^qvwv*.^ì8þüåj)µ`ÍÕ¨që™ùç©;ðø0ð3í¸è°›÷•7V}²ô@M®cˆOC6 XQñÙ—\'	\0íù  \0ÏUV®öz}¯y½¹µÙ.W‘(ZmÏkQ%\Zï…B—‚Áà™æææîõë×kñ¹ãéJs¡”ßÆAÌ¶›ß®j¬ú´êýš«Fñ¯£è€ÔÀíæ‰á®ëÚGÁ¾#—w/744èaM$ÏfÂü‡Uh¬Ž¹ÌDØD]–7«÷T~µâ@ÛÆ&~÷Ðõ÷¸Ñ,\rÞiUŽDñÙX¤qAÙB)`ŽÚMež\n³ÓÖÙI“ïC¸;ˆ«Í’¿í†zhHÁ÷”Ò\"ïýŸ«ô±¨ÊqñÛ³ì(~¬ý>¨àXñjþ%XeèàFÛ\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(32,'sys','quickAccess_contacts.png','image/png',3101,'2013-12-14 18:15:36',3101,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0Wù‡\0\0\0gAMA\0\0±üa\0\0\0sRGB\0®Îé\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0bKGD\0\0\0\0\0\0ùC»\0\0\0	pHYs\0\0\na\0\0\naüÌJ%\0\0\0	vpAg\0\0\00\0\0\00\0ÎîŒW\0\0	ÖIDAThÞí™[Œ]UÇkí½ÏýÌ½—¹t\n´”BÕÆN<€0%±¨ÄMˆI½$6\nú ¾™ø€!¾hHúDHx$ jB	†ˆ†iS°”I;-e`.ûœ™3g_¾åÃ¾œ}fÎ™zyÐ„~ÉÉÞ{í½×úß÷ÿ.k¸&×äš\\“kòqm Øèÿ5¨«H\0Ì*¥>4Æøñàþ\'N¼(\"æÿ]DÄ<þøã¯\0ûc(àK®ë>3yeA)ý¨ŸÃ¿9ž¾®£š\r×á$	BHcÀLx‚2ŽƒRêËÀ³vôFÖqœK–…c«FP4$\\‡„ç(<1\rcŠ4Î—¼§bÀuàá‘º\"Éy¢e.æ~\"Z)l[ñÜ›‹8:¶Še—\rŽÅT?ÄðÕÏöâ¦¹§t£BZ‡á&¢ª¯_G¸CÛ”›Ð\n­4YGãhY(vi|^®Ò®WDÀµÚ¶ÍÄåËŠEÛæíso“ËåØ·oïœ;ÇâÒ¾ïsôèÑÈÊ1ð:àähÒJ¶P@)…Ò\nK),0*¥H`pÅ 18¶…V:±.\nÐ\n­b\",Í™7Ï0°kÃ‡‘Ífæ…^`ii‰Ã‡“ËåðišlR ‰…-= ÑJaY¡{Uê^uÝeþìóè•I‚¶ªÛ1Ô×C>—I¸¾¯~ÑÑÑÁôÔTÃ¢1ˆR©„ã8!-ÌFàà\rÀÍÕ)°\"Ô<ÃüïBµ²LßÀ.†º»XZxŽÓµ£|bO?™ŒBaÐ!Ï#\0Ü|óÍôõõ1>>ŽˆpjôwÝuï¾ó.gÏžÅ÷}Ž9‚ïY§‰ÌU=–¥5–®ƒpÏ¿Œï®Ñµ­‡Éé)rÅ\"âù´­Ÿf½ÖC>›A©pq¥4Z‡±`ŒaçÎˆCCC%©ð¶·%÷<¿	ðºŒ©+³uÄR\nËÒÉKÓS“¿ÿóXÝ»qJŠÙ‰Küâ—§éÚïGÊê0]DÁ½U&IÃÄcZS\'\nê$6¶RÀŠ‚P[á 0Š=Æ4âz(;G×¶º©›ß ,TÄ´Ih|³u·Þð|š5›²P¡B¶RìèïEÄ#`ã»KPÚI[ÁÁŠé§âÃŸ`pý\0×¦k¬­(eÐ€D \\Oj(«ë~bi“·‰ž‘«×¥#¢:`i˜Êàºê%,w\rKÛ <¨.óöê\0#íÅÄ[’ÊÆl­øÕè‚ÀpçþÞ¿R¥³dsîƒUnßÓÆÂªÏëï-që®å¼Å™ñ\n{{ó<_(å4«µ€ÝÛshÕÙÂ¡5–Òh+Š­)‹Œ¯oCVç	ªK˜õe^|s’½CÛÉeœ¨=0Ñ\"¡•Œ	+óçné`ä@\'´VÌ,yìÞžS³p×þú:³Ô\\áÓ7”Xó„}}9ÄY[áhUo\ZZ‰&A¬ê1`iŠ‚ÒÖµ¶¸tá9n¼ñzÎ½7Î¤{½åa7V;1‚˜:¯c(d5Å¬FL\\©\rë®`iìÎ&¼èÊ\"ÆÐY°¨ºÂÞÞ<è,Úˆ¤ëlE!Ö\n[ƒµ	ðAgsô~ênžéEúúzÉfòTÖjtwØZ£¡¥¤t\0oœ_FŒ¡»äµgÖéïÊ0Ø“åâÌ:kµ0ÿïhwðÃîí¹MEË4)hÍ)¤UäK+<QÌÏÌQ}æ)ÚOüsé#Ê¶Evf…»_ú5Ý/ÿ†ógÿÎÄü\n®„Mp*ªn€¥‡o(SÈ„<80X ïhÆ§«ôw:¬T}»³Ô<¡¿3ƒˆ4Ì!&¾–¦Š³ßWŒ1OA€eiþú<m±þÐèþ`Œl±ˆåyXJa—Ë¨ÀÇqlŒí@.Ël×\0¾=7\rrÇ­=ø\"\rÕ“¦ÇÍ¹}sîÂ1ÃÎ=(¥îžÞ\0Æ²Xþéè_š¦¶RÁŸ›G;6–mc­,£íèÜ¶Ñ…mÜ~êþ\\ø\ZwÜÚSe@k’)) ˜r¾‘M€ã4k6Ô\0ÅUÚéØ4¾vÈyj±D 5µ¥%´m¡µ…m[h+üY¶í,ÓÞÓC_1@¦&Pjoâj­xk‘¶‚Å¶²¥ œ·˜_õ)8Š·.¯2²¿uO˜YöÑ:Š«3K.†\nÁõ…¥Õ\0O„¶¼n­@,ŠågŸBMNbJ%ìîmÌ~øŽRhK£-;VÀ²°³YÊ»¯gq~®ìß0Ü( ôufXXõ¨ºÂBÅ#ŸÕ¬T[CÞÑœ›XciÍ§£`áPÌiÞŸ­Ñ–ÓLÌ¹x¾àXŠ¹U0vå[Ç€ï‡M•m‡z™è—(¸a,>(%>nu½ëŠ:ãk‰³I*¿Ç»-1+E·tÖ1ÆàÂ®þÍc ¶œçºM\Z°\rÁ¶©)3M‚Tšä†À¬ïÂ{~’÷Sqð¯4sñÆ>mñÖ–iº@³ÌbR“™–óÄc›7ðéµD¶(d=ö™L¦©©«–ßU1 U§N±¦þ\\ú¶j¾Ž‰¶J±W]×åÁh®À7¾ù­ºæ,Õº7oa±ë§hÒ’‚4™«qNcØÚM&MW×æIû ijAAÓò~ƒgSk[*Ð¢jæsÙ$35×ó¨TÖêcÊê‰ÝSFQ@wg™ŒÓrÎõšËÌ•¹ÍŸ[¶\nâfe¿X(ðê«¯Œ?~üÅÅEãBíííùG}ôðÈÈÈ®…ÅåÈ´¦ˆzz:9yòä¥cÇŽ½Q©TÖ6ÎY.—í\'Ÿ|ò3Gî¹ç¦&g›õh®\rû†:°RY#bíez{{¿855õ.á—á²£T*}}eeåé+sQÈE‹Å†HmÆE„¾”ËåŸU*•ß³±Î)ÑÝÝÝŸœýíù‹—ÑJ%^\raÏ×µª’¸*NyA \\¸pá`±X<ÙÂÛï?ñÄ?Dšî›5ožïóÚk¯\r<xðt+\n}¯VsëÔÙ`”DÓ»çyI`‰A¶¯Ë+ãd2‰ÈŠïûßN¿\\©T¾#\"•{ïýÂ}³sFÄH@HrŒç’ ~=5=köÝ²ÿ˜ˆx«««ßOÏéûþwEÄËç?œ˜œ6\"‚~€IÃI´ƒeäá‡>uµoó§Òô»ðß~ï»\0´Ç“.,,Œ^íGyä-`$Ž€îh`Íÿ¡1Wÿ4<<|qtt­u—ˆ!üg§uŠÚZ`Bký’ˆÌ3::z=p\'Ð“Â—.æÒ8DßÜ[ˆÔh¸ýÁÇRÜÔµŠæt¶xg=ÂsM®ÉÇ^þ	 Zú“H*ç\0\0\0%tEXtcreate-date\02009-11-15T17:02:35-07:00…¦\0\0\0%tEXtdate:create\02010-01-11T09:31:26-07:00›kq\0\0\0%tEXtdate:modify\02010-01-11T09:31:26-07:00nÆÓÍ\0\0\0gtEXtLicense\0http://creativecommons.org/licenses/by-sa/3.0/ or http://creativecommons.org/licenses/LGPL/2.1/[<c\0\0\0%tEXtmodify-date\02009-06-03T09:58:17-06:00ØÕAD\0\0\0tEXtSource\0Oxygen Iconsì®è\0\0\0\'tEXtSource_URL\0http://www.oxygen-icons.org/ï7ªË\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0Wù‡\0\0\0gAMA\0\0±üa\0\0\0sRGB\0®Îé\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0bKGD\0\0\0\0\0\0ùC»\0\0\0	pHYs\0\0\na\0\0\naüÌJ%\0\0\0	vpAg\0\0\00\0\0\00\0ÎîŒW\0\0	ÖIDAThÞí™[Œ]UÇkí½ÏýÌ½—¹t\n´”BÕÆN<€0%±¨ÄMˆI½$6\nú ¾™ø€!¾hHúDHx$ jB	†ˆ†iS°”I;-e`.ûœ™3g_¾åÃ¾œ}fÎ™zyÐ„~ÉÉÞ{í½×úß÷ÿ.k¸&×äš\\“kòqm Øèÿ5¨«H\0Ì*¥>4Æøñàþ\'N¼(\"æÿ]DÄ<þøã¯\0ûc(àK®ë>3yeA)ý¨ŸÃ¿9ž¾®£š\r×á$	BHcÀLx‚2ŽƒRêËÀ³vôFÖqœK–…c«FP4$\\‡„ç(<1\rcŠ4Î—¼§bÀuàá‘º\"Éy¢e.æ~\"Z)l[ñÜ›‹8:¶Še—\rŽÅT?ÄðÕÏöâ¦¹§t£BZ‡á&¢ª¯_G¸CÛ”›Ð\n­4YGãhY(vi|^®Ò®WDÀµÚ¶ÍÄåËŠEÛæíso“ËåØ·oïœ;ÇâÒ¾ïsôèÑÈÊ1ð:àähÒJ¶P@)…Ò\nK),0*¥H`pÅ 18¶…V:±.\nÐ\n­b\",Í™7Ï0°kÃ‡‘Ífæ…^`ii‰Ã‡“ËåðišlR ‰…-= ÑJaY¡{Uê^uÝeþìóè•I‚¶ªÛ1Ô×C>—I¸¾¯~ÑÑÑÁôÔTÃ¢1ˆR©„ã8!-ÌFàà\rÀÍÕ)°\"Ô<ÃüïBµ²LßÀ.†º»XZxŽÓµ£|bO?™ŒBaÐ!Ï#\0Ü|óÍôõõ1>>ŽˆpjôwÝuï¾ó.gÏžÅ÷}Ž9‚ïY§‰ÌU=–¥5–®ƒpÏ¿Œï®Ñµ­‡Éé)rÅ\"âù´­Ÿf½ÖC>›A©pq¥4Z‡±`ŒaçÎˆCCC%©ð¶·%÷<¿	ðºŒ©+³uÄR\nËÒÉKÓS“¿ÿóXÝ»qJŠÙ‰Küâ—§éÚïGÊê0]DÁ½U&IÃÄcZS\'\nê$6¶RÀŠ‚P[á 0Š=Æ4âz(;G×¶º©›ß ,TÄ´Ih|³u·Þð|š5›²P¡B¶RìèïEÄ#`ã»KPÚI[ÁÁŠé§âÃŸ`pý\0×¦k¬­(eÐ€D \\Oj(«ë~bi“·‰ž‘«×¥#¢:`i˜Êàºê%,w\rKÛ <¨.óöê\0#íÅÄ[’ÊÆl­øÕè‚ÀpçþÞ¿R¥³dsîƒUnßÓÆÂªÏëï-që®å¼Å™ñ\n{{ó<_(å4«µ€ÝÛshÕÙÂ¡5–Òh+Š­)‹Œ¯oCVç	ªK˜õe^|s’½CÛÉeœ¨=0Ñ\"¡•Œ	+óçné`ä@\'´VÌ,yìÞžS³p×þú:³Ô\\áÓ7”Xó„}}9ÄY[áhUo\ZZ‰&A¬ê1`iŠ‚ÒÖµ¶¸tá9n¼ñzÎ½7Î¤{½åa7V;1‚˜:¯c(d5Å¬FL\\©\rë®`iìÎ&¼èÊ\"ÆÐY°¨ºÂÞÞ<è,Úˆ¤ëlE!Ö\n[ƒµ	ðAgsô~ênžéEúúzÉfòTÖjtwØZ£¡¥¤t\0oœ_FŒ¡»äµgÖéïÊ0Ø“åâÌ:kµ0ÿïhwðÃîí¹MEË4)hÍ)¤UäK+<QÌÏÌQ}æ)ÚOüsé#Ê¶Evf…»_ú5Ý/ÿ†ógÿÎÄü\n®„Mp*ªn€¥‡o(SÈ„<80X ïhÆ§«ôw:¬T}»³Ô<¡¿3ƒˆ4Ì!&¾–¦Š³ßWŒ1OA€eiþú<m±þÐèþ`Œl±ˆåyXJa—Ë¨ÀÇqlŒí@.Ël×\0¾=7\rrÇ­=ø\"\rÕ“¦ÇÍ¹}sîÂ1ÃÎ=(¥îžÞ\0Æ²Xþéè_š¦¶RÁŸ›G;6–mc­,£íèÜ¶Ñ…mÜ~êþ\\ø\ZwÜÚSe@k’)) ˜r¾‘M€ã4k6Ô\0ÅUÚéØ4¾vÈyj±D 5µ¥%´m¡µ…m[h+üY¶í,ÓÞÓC_1@¦&Pjoâj­xk‘¶‚Å¶²¥ œ·˜_õ)8Š·.¯2²¿uO˜YöÑ:Š«3K.†\nÁõ…¥Õ\0O„¶¼n­@,ŠågŸBMNbJ%ìîmÌ~øŽRhK£-;VÀ²°³YÊ»¯gq~®ìß0Ü( ôufXXõ¨ºÂBÅ#ŸÕ¬T[CÞÑœ›XciÍ§£`áPÌiÞŸ­Ñ–ÓLÌ¹x¾àXŠ¹U0vå[Ç€ï‡M•m‡z™è—(¸a,>(%>nu½ëŠ:ãk‰³I*¿Ç»-1+E·tÖ1ÆàÂ®þÍc ¶œçºM\Z°\rÁ¶©)3M‚Tšä†À¬ïÂ{~’÷Sqð¯4sñÆ>mñÖ–iº@³ÌbR“™–óÄc›7ðéµD¶(d=ö™L¦©©«–ßU1 U§N±¦þ\\ú¶j¾Ž‰¶J±W]×åÁh®À7¾ù­ºæ,Õº7oa±ë§hÒ’‚4™«qNcØÚM&MW×æIû ijAAÓò~ƒgSk[*Ð¢jæsÙ$35×ó¨TÖêcÊê‰ÝSFQ@wg™ŒÓrÎõšËÌ•¹ÍŸ[¶\nâfe¿X(ðê«¯Œ?~üÅÅEãBíííùG}ôðÈÈÈ®…ÅåÈ´¦ˆzz:9yòä¥cÇŽ½Q©TÖ6ÎY.—í\'Ÿ|ò3Gî¹ç¦&g›õh®\rû†:°RY#bíez{{¿855õ.á—á²£T*}}eeåé+sQÈE‹Å†HmÆE„¾”ËåŸU*•ß³±Î)ÑÝÝÝŸœýíù‹—ÑJ%^\raÏ×µª’¸*NyA \\¸pá`±X<ÙÂÛï?ñÄ?Dšî›5ožïóÚk¯\r<xðt+\n}¯VsëÔÙ`”DÓ»çyI`‰A¶¯Ë+ãd2‰ÈŠïûßN¿\\©T¾#\"•{ïýÂ}³sFÄH@HrŒç’ ~=5=köÝ²ÿ˜ˆx«««ßOÏéûþwEÄËç?œ˜œ6\"‚~€IÃI´ƒeäá‡>uµoó§Òô»ðß~ï»\0´Ç“.,,Œ^íGyä-`$Ž€îh`Íÿ¡1Wÿ4<<|qtt­u—ˆ!üg§uŠÚZ`Bký’ˆÌ3::z=p\'Ð“Â—.æÒ8DßÜ[ˆÔh¸ýÁÇRÜÔµŠæt¶xg=ÂsM®ÉÇ^þ	 Zú“H*ç\0\0\0%tEXtcreate-date\02009-11-15T17:02:35-07:00…¦\0\0\0%tEXtdate:create\02010-01-11T09:31:26-07:00›kq\0\0\0%tEXtdate:modify\02010-01-11T09:31:26-07:00nÆÓÍ\0\0\0gtEXtLicense\0http://creativecommons.org/licenses/by-sa/3.0/ or http://creativecommons.org/licenses/LGPL/2.1/[<c\0\0\0%tEXtmodify-date\02009-06-03T09:58:17-06:00ØÕAD\0\0\0tEXtSource\0Oxygen Iconsì®è\0\0\0\'tEXtSource_URL\0http://www.oxygen-icons.org/ï7ªË\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(33,'sys','quickAccess_makePayment.png','image/png',5142,'2013-12-14 18:15:36',5142,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0¸IDATxÚbüÿÿ?6ÀòöÃ†_¿~2°Ý™òŸA»ÐêÃÇwÇŽ?ö…	$+ú{óÿ‡9ö|R=Æ <AR\\†‡qÃÎy{¹9DœxtÔ¬>¼ùÂ ##ŸÒÀzðä¦ÿ[ö.ú•èùÿÝ™üÿ}‰¢(3± Œ@Œ8]õìÕ}0ce…ùÿ7Êañ‘i¼¼¼Œ, Áó«ÿ4}aÐc:ÏÀú™!3;ñ?ÃÊuþ¿xýàÿ«·ÿ·v×ý·I`\0™ÍÌá²çè™íÿ>¹ùßÍ×äÿ×;}–\Z\"s\0ˆñÍûç?}º•	hÆ?†;³\Z@‚îÓþýÿËÀÊÊ\Züû÷ïµp×Â¯¦ügTtfx÷ë7ÃAû}*ïÛëÅ~¤00±üfàã`¸vý»0D##CÅÚOÖ_üæ0¼ž6áÞ»ß¡uM’<âŸÞe˜9ó9Ã–õ‡Ê™%¸wüù÷m±²’2ƒ¸ˆÃÖ›BCÃöÙÌÀûÛƒ¡¡b3ß÷[S6M]{»%0E%\n÷_ó÷‘ÿãS}A¾÷}·7îÿìJÏÿ£\0 ’5€ã¤ŒÀ4ðæÝk¦Sµ\râÞ~üþÌðõÛ·½<ÜÜÎ0C9Ø¹˜uóž©úÿÿËÓúƒþoÜ¼þÿ¥+g~üüþú¬©ÿÙØØüPãAàíÿëŒÿvßÿÇÀ“uœAì|6ƒ“#Ã`ø;:Ø2—•ndaúõnÃ‡óËÞ)—1ð{1°\0“q1Ã½¿Yò*ÏæÍ_Îðëç†Û·osmøýç×ž½•ÔUÙ˜îØ0ÜÛ#Åðã-ƒfÑcNÖ{¯9·0|¹ªÀpüàu#†O¯ÿÏ-Kúÿúý“ÿËÖNâÿß¼úÿûïÿÒ\"þ;d3ü7	àùZ\rd8Óõ[g\\]ž¿zÈpäèq{7PÚfX²t1Ð	þ?Uehµ5ž©[°¥¾ëÈ²ŒÿÙþþûÃÀÅÉÉ \'¡É_œÊgøÿ[P´×Õ­®?åfm=ÁˆªÓ4ÿÞ²wáÿ˜$Ÿÿ<¼\\kÃœµ·NˆøO(r9YXX|AÎ¥JÒ\0@\\Õ†4…áçînw\ZÎïr:Ê$±†b¦bDý±™’E\Zè2²(	##„1°ÉÜÊÊ¢2ŠˆŠtÆ*rš”hSše›»w¶©Í}v®6	û“?¢‡‡sÎû¾Ïó>ÏYö…åŽy—ã%½€ØBÖ|úü>xzŽúÅ‹‡ïœkFVµ†×\'úÎÎû\Zñ¶-*ý(.*éŒØër¹¦çù^]ôŒ@€½äÑ´d%\"|œœ64Ì!)+,·Ý:Ä*¢‰£*™‹\'Ïº WDÀjv 7{3ÆL#ø4<ŠWú^Ô×5\\ù#\0^óÛæ¤0|°#H\n˜Sôp¬1ABÓ„\Z\"b}”T÷]†±G;‘–š‹¬\rJx< ­í&*Ê+Ðr¹‰Wß´p)fŒt˜Ä=à8X…ò<5Ôê‹à,nÈ’\'°¶ð9„¾9‡ÄAY=†`ÆIŒÎ€Pa4b¨Q8g§p¾ù8–…îÅ`#5eŸ„•5koßë(µrãHJHA¬|5”ép8ì`m“¯Šƒéó8´×4J‚ÀZ­HIUbÖmÃF•	a25vaŽcà2ÆCßó±šäú”L#½.{M—c†SEE‡ckŠ°+Â­»7æ6!>Ä³Áˆ%ÉdÈËÏ;m‚‘àì§¼(ÙQ‚Úªx¬7Ài“B§=üÅd=ðëqB |TYåvMå¾²]~/ÁŸt,MawLA@\Z‰°9.µªa¶IùÀ‘ƒuÐ\\oE_ßð,ßì–‡\'×G-í¶¢†^* åÀÊðNzFrý‰SµUa²HBÒÄ${Ÿ×\r@€«­íðz½ Ü|ºß¶äÄlª-rc|è=^jÛ±û¬žú[ð¢fÄtáñÓUºwüûkJýŒXÔDösx¯ø-Áÿ7þ¹Uü€kiêÃÏ¡…ê¡Pd–aå&Ê%uNÁ¡,Ìeà˜‚ÁéÔM`–mN¶L“é–l&[\"q8Ô\r/qš-›(,‚:ÀQ.sÞhE¹™\\zA)-¶öÞ½§ÓtKü1íÇ—ö4_¿ç;ï÷>—sž:€×Ó.¿_ÛM=Ï<\"vÜµC\'‹’èKîƒ¹U’ù»®rwÌ	!åš8ƒÁ°M,WŒ.ì¦9¡ã¥`ú4ªvýêæ‰Äýƒ§q¤{JJ-»q÷ÞÒ­‘‘R´·w\"%)Õ4/#ó\rªt‘N=1\0ïÂ{n˜Å÷‡ª!œOªÝààÍ²ò¯br³#$$þ¬?>46]@«R‚ÅK*ÂBÃVPb0?@ñîLX|LF`0K:#öÊ9™‰HÈ|§ö@Éä¡åÊYÈSäHš6·ûºaºFƒ³ž›K¹TŒ[·º°ó»o± {1sÎü‰cÔ”õg3üe‹(Û1DÌl¾¨†ÈGƒó¢z0Éðs6à¥àmpÞ›@îÍ\")QŽŽÎëñ;NŒŸî£THÑQ«Ùä/—§ŒàóyÆß÷è›6h\r˜ž(Ä9y|¼ørN ¸]ø:0N5Íó nMÄÛ…kèL€~õm\"Kîv³gÏÄ±êJê†¢Æ´©Íj×#1i‹”ì·Ð<’ïó#Ðk*‰é•RÀóA€PŠ©³ìxý£^\\_“éqª¾×•mHNž†šãUÐëI·²1\0¤ ÃV/)Õz.(:‘>\'áA	Pîž‡Ž]$jCéÇòà\'¤;8àEÌß¿ÅëŠ3gë ×ëÑÙÞ£6›¬ÝP\'d)Dù¥G\ZaµZ!“Å`Bh(f§¥AL‡n3ÛÑQ9ÖÎ…¹÷E}¹vuP?:áK¿ºd.]¾L¾}m\nÕÍž®Á•´l+×E3•ÊÖ†Šc¼¥““ˆ¸˜I‚Ñ×Oi—áA\ZÃ‡Ñu£Ã´»ø©É°ÛÜ<«FNž›w”¡«Àz’ ¸ÔÝ<¨5n¦Å/Ò0ðÕºž¦(i4B‚&‘Ñ˜‘öüàÈÒ©ºŽ¾ñ‹JA‡üZn.||©Œ<¨ÕýøâË­ÈKÎÇ‡EåP{;`¼üq¥û-þ9-Ì¹ÑÇ7æøéƒn†ÚÀÏEtDö,\'C1aå²UäWN8NH$ãÉéx”B÷£§G­Æ‚-›¶`ógÅäÕ½p<Ó†Û¿ùµ©»Lï<Ø¹ÉcwiO7v[­6X,6G7%”áÑÚv\rK/Gì”XìÿaºU*‡o¶ïÄÂü,ÏÙ¹ìtŒ–¾«EYÑJY8Û›ººvÓCâz\0ªêöºX	íÔå±Ç{¦´›¢pbœÍ--¨©=J¡7&Þ/Æªµ$+Çœ­½Vbé+û`´f1’åÌèVQP¨xÅ§[×—$OOX,vxó¹¬m§@f¡@eCœ,	:­½½·ðSÅ!Ü7›=V^8£SàÑz4kM©rÀC_ðåy3ië7®*ÏÉ~%ÂtÏìÑ(®ö˜V£AÃ¹F\nTC”—FpêÄ¥w]ŠâR&f	1T‡¿lCüÒúÇ<šù‡k!\rÙ¢eYe…Eo¦9ìNp¦wçÎ]Ô¬‡f@ç¨;ÑRHsÕ-£cæ«Ž<qà&\nh„§ÎŠß_U»Ï}¤f;#s†ž~[Hc2÷Âà?s=./…„IŠè3òðÓ	ÿÏTñ§\0íYkL[ç~|9¾_!°M!8ÐBiHsY.di3²&ÕÖti–iÕÔjÚ´òc?V­“¶i“ª6ê¦%ÝVEm´MI«TZ³\r.ƒd!@ ŒÃÅ˜»\r¶±±ïìý&B]Ã¦µ™4©ŸôÉs|Î{Ÿçý¹z‰ñ¾‹G±¶þ­EH®³d‚ÍªXg&Ì×¢ b´š¡ÍÑ‚ª%G…^‹àØ(‚3Ã­„ëV¼‚Ù;8NvtÌ=úvk{“%¡|“KJ­ëeê©L¦’ƒŒ¬·¤S*´Ðir!ýo5g\0Êj+Fæ±ã(Õ@ŠºD&ÿœa¯½ý¡ƒu_Z¹—„6G¢K¯·]oyÁéêõoY7¢Ò¾_(ÉjÚîw¿z§»ëÕéé)˜lß¶½Ÿâ%¥Ry‰øñSê“Â] áëy ÐðµèZX‰X%,œÉ±˜ˆòžŒ—ê—h¨ÁJ¨wàééÁþW.¯ßÑÿÓÖöFýBÀ‹Â‚B¢ÈväMÔo¤„X\n0âvaq1 Ìy=6]¶m,Fo_/Ü7Lò°³öÉÞM¶²K2™ì²Lª¸¯×™ÖW yãûË–=OáA\'\\»¨+^yó×¨²é0ç™…khÞdª}ZäÌ‡(T‹¡1ËEørý1””<†û£ƒ0\Zs Uk‘L¥0æÂø„›Â+)\'A\"–†AoDñ{FËot4!\n ¸ÈF¸Â‹Ö¶V\"»)œ:y\Z‹¡ù¥¶¿·—­«@êæ™€J­4p„ðÁ„³-]$—eÒóaÐjÈ\"¨÷åÁ•ß„”<N,¡MP€6G¡²L€\'Q!î+ÄÒx9ø¹H3&”Ú6¢ººŠÂÅD?) 0ÆÂÓéî\rt‘²(·U’aÆÑÙÕEPD†ž?Eˆ`×šþBø\'j¼úÝëæ@8fdì \Znpl(ÚÔÑ÷L	µÙEí.xÕ˜ßÐ‡Œ(Ñ&±ˆ%«”>ÅtMhAÄAªÊ@Q4\r£Õ…´zy1äé\"ŒLÜ@C‹–ümØµó0ÁE!<Q]¹î±\\¼ø>…•/žþ&Æ=#øÍïÎ’²dò~$‘¤3i»ô?MTe},Î!c\næé„c|Ò[ó¨}â‡àóL\"‘òÃR†¶Ì	‰a˜B#@$‰Ô Ÿ`Ów4PHP(x+Å¨¬¡kÎEŠŽÓ=9Xð¥Ñ|m““2œ>ùuÊ\'Îÿö¬PÉâ‰¢‘øéI¯Ÿçcò‡†D,•H2Ñ£<ÿãÇ€¥wàa­Š	Á×í;LÂ&PJ`œ=Øét¢½½„#8&ës$ˆŸ²Œ‚ò$l»|°nž‡L†tYA\nˆ‘Bb}jˆÎÑ«ÕFnâ—ï]ÅBÏlÐDòÅ¨<G	HFX.x&ÆÎ/g–pŸ| €„Å.Çí‰òÑ3N—ãÙ{ý}\"Ï´‹ØZe¥vì~òÂxÊb¶\n÷\Z¹B=fø˜“É„ªÑÒÒŒáû.x§½ *Añ]HV‹“µ¦ˆ‹êPQµ<&a.cóÖ4ô9ªYji-4œ¯o\\ücãTËb*È}ÕŒ-Ò{Ãë\n¾CB2ÁiÏ0r òLÝM­Öü µ­‰ëê¹MÕ!N¬Úƒ-ö\nœqœ¶’MÄ£6°z.Ôâà¢®áPm§g¤)á%ó®²×À`Èæš~¿Ÿ`ø|>ÂKaáwZ­VHÖŽÛð^\\Â‘ú/BgÄG¯]¢dŽC˜×%ÂR,ÏctÈ×âŸý^ÄŽ¡&Væd>iãú‚åœR\'Â³ÇÂ\\P‚LJŒ>Ç]tuß‚×7GÁ\0vÔÔÂ¾¹:2RJJÝheì!aÙuš<å#‚°ì¾X\"‚~W§œ…&š›[éy^RDƒ—¿õ’Ð~þ‹áöùv«RäEœ„%5˜LŒ°‘]Vp/m^°X–’	ÕòÜ»?ù3u¼zcìÅR\"ïÂB»–«P˜_DuÛHõÚƒ7Û¨¼\rQePb+±W¦”¹Ð,”?*ÌºŒ£°nÛÙsS3nbc”|Ñ–BIlÙRM‚¿Œ{÷zñÆÙŸÁðS2+Hhú]á4’H`¸#ÙíóðH¶Úî¬Åã«ÿ—Nüæ¹×ZwÔÖà£<	ÂÊßÊ‰\Z›ñF)ÛÙßr™l%Þ)XL\nŸgE0B\'y¨§÷\"KK°•–¡ 0—<°5§àb‘Å$å‹\nÏ?w’uQ¼sá>ºzå¦ã2)æg—ø~5ßZQ˜ó0le>ü–èã…f•E—”™¿vèé=§ö×í©)²XZ™I‰‹2V.—ËžÊbžQMö eú;”4èsa)(f,ŽîPÝíëÁ¦ãÛ/}³sS¸ðîÛ˜œòöc†YmZòXxöp¥Ú•£•y÷n+8¡3\Z\0\r¦íÏ<ÀV“TÂÂÝÞÐ\'Ž‘EÙ-Îr/FärÕZù®Ú=Õ\'Ù÷Ô¶š*½^kD2‘F‚ê0{9\'ãHIŽðKZàÍì»[¤†`‡A—‡Æ†R¨—~—Â‹mÒ\Z<Ÿ€£o¬ûÖ[uÛÿL‰ÉÌÔ°¢äuŽ¿òþC=ð0ž É*¥fÇr¥å–£‡ŽìýÊþ»+Š¬V\n)	Ã‡uO1eêjh0Žþ·†fƒ\'(3™¢¾\0ºo;ƒ¥Y\\~pâ=N¥Y¦|ü îÓQQV!IöT!_«Wî­Ý[ýÜ‘úu[ª*5j¥F°6;ðš™Cã_¯±¾‚ñ±iþF[÷e>\ZoÊV–”³l4Å†‚Ùäüß2é5^’f·†¶½¼¢ø™úc‡Žm©²?þûWfÛZoÿ*J·g_ÈŽ¼âÙjò™pÙÏò8dÕKâ5VÍ|ZNê?Wà¯À%á´}òí\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0¸IDATxÚbüÿÿ?6ÀòöÃ†_¿~2°Ý™òŸA»ÐêÃÇwÇŽ?ö…	$+ú{óÿ‡9ö|R=Æ <AR\\†‡qÃÎy{¹9DœxtÔ¬>¼ùÂ ##ŸÒÀzðä¦ÿ[ö.ú•èùÿÝ™üÿ}‰¢(3± Œ@Œ8]õìÕ}0ce…ùÿ7Êañ‘i¼¼¼Œ, Áó«ÿ4}aÐc:ÏÀú™!3;ñ?ÃÊuþ¿xýàÿ«·ÿ·v×ý·I`\0™ÍÌá²çè™íÿ>¹ùßÍ×äÿ×;}–\Z\"s\0ˆñÍûç?}º•	hÆ?†;³\Z@‚îÓþýÿËÀÊÊ\Züû÷ïµp×Â¯¦ügTtfx÷ë7ÃAû}*ïÛëÅ~¤00±üfàã`¸vý»0D##CÅÚOÖ_üæ0¼ž6áÞ»ß¡uM’<âŸÞe˜9ó9Ã–õ‡Ê™%¸wüù÷m±²’2ƒ¸ˆÃÖ›BCÃöÙÌÀûÛƒ¡¡b3ß÷[S6M]{»%0E%\n÷_ó÷‘ÿãS}A¾÷}·7îÿìJÏÿ£\0 ’5€ã¤ŒÀ4ðæÝk¦Sµ\râÞ~üþÌðõÛ·½<ÜÜÎ0C9Ø¹˜uóž©úÿÿËÓúƒþoÜ¼þÿ¥+g~üüþú¬©ÿÙØØüPãAàíÿëŒÿvßÿÇÀ“uœAì|6ƒ“#Ã`ø;:Ø2—•ndaúõnÃ‡óËÞ)—1ð{1°\0“q1Ã½¿Yò*ÏæÍ_Îðëç†Û·osmøýç×ž½•ÔUÙ˜îØ0ÜÛ#Åðã-ƒfÑcNÖ{¯9·0|¹ªÀpüàu#†O¯ÿÏ-Kúÿúý“ÿËÖNâÿß¼úÿûïÿÒ\"þ;d3ü7	àùZ\rd8Óõ[g\\]ž¿zÈpäèq{7PÚfX²t1Ð	þ?Uehµ5ž©[°¥¾ëÈ²ŒÿÙþþûÃÀÅÉÉ \'¡É_œÊgøÿ[P´×Õ­®?åfm=ÁˆªÓ4ÿÞ²wáÿ˜$Ÿÿ<¼\\kÃœµ·NˆøO(r9YXX|AÎ¥JÒ\0@\\Õ†4…áçînw\ZÎïr:Ê$±†b¦bDý±™’E\Zè2²(	##„1°ÉÜÊÊ¢2ŠˆŠtÆ*rš”hSše›»w¶©Í}v®6	û“?¢‡‡sÎû¾Ïó>ÏYö…åŽy—ã%½€ØBÖ|úü>xzŽúÅ‹‡ïœkFVµ†×\'úÎÎû\Zñ¶-*ý(.*éŒØër¹¦çù^]ôŒ@€½äÑ´d%\"|œœ64Ì!)+,·Ý:Ä*¢‰£*™‹\'Ïº WDÀjv 7{3ÆL#ø4<ŠWú^Ô×5\\ù#\0^óÛæ¤0|°#H\n˜Sôp¬1ABÓ„\Z\"b}”T÷]†±G;‘–š‹¬\rJx< ­í&*Ê+Ðr¹‰Wß´p)fŒt˜Ä=à8X…ò<5Ôê‹à,nÈ’\'°¶ð9„¾9‡ÄAY=†`ÆIŒÎ€Pa4b¨Q8g§p¾ù8–…îÅ`#5eŸ„•5koßë(µrãHJHA¬|5”ép8ì`m“¯Šƒéó8´×4J‚ÀZ­HIUbÖmÃF•	a25vaŽcà2ÆCßó±šäú”L#½.{M—c†SEE‡ckŠ°+Â­»7æ6!>Ä³Áˆ%ÉdÈËÏ;m‚‘àì§¼(ÙQ‚Úªx¬7Ài“B§=üÅd=ðëqB |TYåvMå¾²]~/ÁŸt,MawLA@\Z‰°9.µªa¶IùÀ‘ƒuÐ\\oE_ßð,ßì–‡\'×G-í¶¢†^* åÀÊðNzFrý‰SµUa²HBÒÄ${Ÿ×\r@€«­íðz½ Ü|ºß¶äÄlª-rc|è=^jÛ±û¬žú[ð¢fÄtáñÓUºwüûkJýŒXÔDösx¯ø-Áÿ7þ¹Uü€kiêÃÏ¡…ê¡Pd–aå&Ê%uNÁ¡,Ìeà˜‚ÁéÔM`–mN¶L“é–l&[\"q8Ô\r/qš-›(,‚:ÀQ.sÞhE¹™\\zA)-¶öÞ½§ÓtKü1íÇ—ö4_¿ç;ï÷>—sž:€×Ó.¿_ÛM=Ï<\"vÜµC\'‹’èKîƒ¹U’ù»®rwÌ	!åš8ƒÁ°M,WŒ.ì¦9¡ã¥`ú4ªvýêæ‰Äýƒ§q¤{JJ-»q÷ÞÒ­‘‘R´·w\"%)Õ4/#ó\rªt‘N=1\0ïÂ{n˜Å÷‡ª!œOªÝààÍ²ò¯br³#$$þ¬?>46]@«R‚ÅK*ÂBÃVPb0?@ñîLX|LF`0K:#öÊ9™‰HÈ|§ö@Éä¡åÊYÈSäHš6·ûºaºFƒ³ž›K¹TŒ[·º°ó»o± {1sÎü‰cÔ”õg3üe‹(Û1DÌl¾¨†ÈGƒó¢z0Éðs6à¥àmpÞ›@îÍ\")QŽŽÎëñ;NŒŸî£THÑQ«Ùä/—§ŒàóyÆß÷è›6h\r˜ž(Ä9y|¼ørN ¸]ø:0N5Íó nMÄÛ…kèL€~õm\"Kîv³gÏÄ±êJê†¢Æ´©Íj×#1i‹”ì·Ð<’ïó#Ðk*‰é•RÀóA€PŠ©³ìxý£^\\_“éqª¾×•mHNž†šãUÐëI·²1\0¤ ÃV/)Õz.(:‘>\'áA	Pîž‡Ž]$jCéÇòà\'¤;8àEÌß¿ÅëŠ3gë ×ëÑÙÞ£6›¬ÝP\'d)Dù¥G\ZaµZ!“Å`Bh(f§¥AL‡n3ÛÑQ9ÖÎ…¹÷E}¹vuP?:áK¿ºd.]¾L¾}m\nÕÍž®Á•´l+×E3•ÊÖ†Šc¼¥““ˆ¸˜I‚Ñ×Oi—áA\ZÃ‡Ñu£Ã´»ø©É°ÛÜ<«FNž›w”¡«Àz’ ¸ÔÝ<¨5n¦Å/Ò0ðÕºž¦(i4B‚&‘Ñ˜‘öüàÈÒ©ºŽ¾ñ‹JA‡üZn.||©Œ<¨ÕýøâË­ÈKÎÇ‡EåP{;`¼üq¥û-þ9-Ì¹ÑÇ7æøéƒn†ÚÀÏEtDö,\'C1aå²UäWN8NH$ãÉéx”B÷£§G­Æ‚-›¶`ógÅäÕ½p<Ó†Û¿ùµ©»Lï<Ø¹ÉcwiO7v[­6X,6G7%”áÑÚv\rK/Gì”XìÿaºU*‡o¶ïÄÂü,ÏÙ¹ìtŒ–¾«EYÑJY8Û›ººvÓCâz\0ªêöºX	íÔå±Ç{¦´›¢pbœÍ--¨©=J¡7&Þ/Æªµ$+Çœ­½Vbé+û`´f1’åÌèVQP¨xÅ§[×—$OOX,vxó¹¬m§@f¡@eCœ,	:­½½·ðSÅ!Ü7›=V^8£SàÑz4kM©rÀC_ðåy3ië7®*ÏÉ~%ÂtÏìÑ(®ö˜V£AÃ¹F\nTC”—FpêÄ¥w]ŠâR&f	1T‡¿lCüÒúÇ<šù‡k!\rÙ¢eYe…Eo¦9ìNp¦wçÎ]Ô¬‡f@ç¨;ÑRHsÕ-£cæ«Ž<qà&\nh„§ÎŠß_U»Ï}¤f;#s†ž~[Hc2÷Âà?s=./…„IŠè3òðÓ	ÿÏTñ§\0íYkL[ç~|9¾_!°M!8ÐBiHsY.di3²&ÕÖti–iÕÔjÚ´òc?V­“¶i“ª6ê¦%ÝVEm´MI«TZ³\r.ƒd!@ ŒÃÅ˜»\r¶±±ïìý&B]Ã¦µ™4©ŸôÉs|Î{Ÿçý¹z‰ñ¾‹G±¶þ­EH®³d‚ÍªXg&Ì×¢ b´š¡ÍÑ‚ª%G…^‹àØ(‚3Ã­„ëV¼‚Ù;8NvtÌ=úvk{“%¡|“KJ­ëeê©L¦’ƒŒ¬·¤S*´Ðir!ýo5g\0Êj+Fæ±ã(Õ@ŠºD&ÿœa¯½ý¡ƒu_Z¹—„6G¢K¯·]oyÁéêõoY7¢Ò¾_(ÉjÚîw¿z§»ëÕéé)˜lß¶½Ÿâ%¥Ry‰øñSê“Â] áëy ÐðµèZX‰X%,œÉ±˜ˆòžŒ—ê—h¨ÁJ¨wàééÁþW.¯ßÑÿÓÖöFýBÀ‹Â‚B¢ÈväMÔo¤„X\n0âvaq1 Ìy=6]¶m,Fo_/Ü7Lò°³öÉÞM¶²K2™ì²Lª¸¯×™ÖW yãûË–=OáA\'\\»¨+^yó×¨²é0ç™…khÞdª}ZäÌ‡(T‹¡1ËEørý1””<†û£ƒ0\Zs Uk‘L¥0æÂø„›Â+)\'A\"–†AoDñ{FËot4!\n ¸ÈF¸Â‹Ö¶V\"»)œ:y\Z‹¡ù¥¶¿·—­«@êæ™€J­4p„ðÁ„³-]$—eÒóaÐjÈ\"¨÷åÁ•ß„”<N,¡MP€6G¡²L€\'Q!î+ÄÒx9ø¹H3&”Ú6¢ººŠÂÅD?) 0ÆÂÓéî\rt‘²(·U’aÆÑÙÕEPD†ž?Eˆ`×šþBø\'j¼úÝëæ@8fdì \Znpl(ÚÔÑ÷L	µÙEí.xÕ˜ßÐ‡Œ(Ñ&±ˆ%«”>ÅtMhAÄAªÊ@Q4\r£Õ…´zy1äé\"ŒLÜ@C‹–ümØµó0ÁE!<Q]¹î±\\¼ø>…•/žþ&Æ=#øÍïÎ’²dò~$‘¤3i»ô?MTe},Î!c\næé„c|Ò[ó¨}â‡àóL\"‘òÃR†¶Ì	‰a˜B#@$‰Ô Ÿ`Ów4PHP(x+Å¨¬¡kÎEŠŽÓ=9Xð¥Ñ|m““2œ>ùuÊ\'Îÿö¬PÉâ‰¢‘øéI¯Ÿçcò‡†D,•H2Ñ£<ÿãÇ€¥wàa­Š	Á×í;LÂ&PJ`œ=Øét¢½½„#8&ës$ˆŸ²Œ‚ò$l»|°nž‡L†tYA\nˆ‘Bb}jˆÎÑ«ÕFnâ—ï]ÅBÏlÐDòÅ¨<G	HFX.x&ÆÎ/g–pŸ| €„Å.Çí‰òÑ3N—ãÙ{ý}\"Ï´‹ØZe¥vì~òÂxÊb¶\n÷\Z¹B=fø˜“É„ªÑÒÒŒáû.x§½ *Añ]HV‹“µ¦ˆ‹êPQµ<&a.cóÖ4ô9ªYji-4œ¯o\\ücãTËb*È}ÕŒ-Ò{Ãë\n¾CB2ÁiÏ0r òLÝM­Öü µ­‰ëê¹MÕ!N¬Úƒ-ö\nœqœ¶’MÄ£6°z.Ôâà¢®áPm§g¤)á%ó®²×À`Èæš~¿Ÿ`ø|>ÂKaáwZ­VHÖŽÛð^\\Â‘ú/BgÄG¯]¢dŽC˜×%ÂR,ÏctÈ×âŸý^ÄŽ¡&Væd>iãú‚åœR\'Â³ÇÂ\\P‚LJŒ>Ç]tuß‚×7GÁ\0vÔÔÂ¾¹:2RJJÝheì!aÙuš<å#‚°ì¾X\"‚~W§œ…&š›[éy^RDƒ—¿õ’Ð~þ‹áöùv«RäEœ„%5˜LŒ°‘]Vp/m^°X–’	ÕòÜ»?ù3u¼zcìÅR\"ïÂB»–«P˜_DuÛHõÚƒ7Û¨¼\rQePb+±W¦”¹Ð,”?*ÌºŒ£°nÛÙsS3nbc”|Ñ–BIlÙRM‚¿Œ{÷zñÆÙŸÁðS2+Hhú]á4’H`¸#ÙíóðH¶Úî¬Åã«ÿ—Nüæ¹×ZwÔÖà£<	ÂÊßÊ‰\Z›ñF)ÛÙßr™l%Þ)XL\nŸgE0B\'y¨§÷\"KK°•–¡ 0—<°5§àb‘Å$å‹\nÏ?w’uQ¼sá>ºzå¦ã2)æg—ø~5ßZQ˜ó0le>ü–èã…f•E—”™¿vèé=§ö×í©)²XZ™I‰‹2V.—ËžÊbžQMö eú;”4èsa)(f,ŽîPÝíëÁ¦ãÛ/}³sS¸ðîÛ˜œòöc†YmZòXxöp¥Ú•£•y÷n+8¡3\Z\0\r¦íÏ<ÀV“TÂÂÝÞÐ\'Ž‘EÙ-Îr/FärÕZù®Ú=Õ\'Ù÷Ô¶š*½^kD2‘F‚ê0{9\'ãHIŽðKZàÍì»[¤†`‡A—‡Æ†R¨—~—Â‹mÒ\Z<Ÿ€£o¬ûÖ[uÛÿL‰ÉÌÔ°¢äuŽ¿òþC=ð0ž É*¥fÇr¥å–£‡ŽìýÊþ»+Š¬V\n)	Ã‡uO1eêjh0Žþ·†fƒ\'(3™¢¾\0ºo;ƒ¥Y\\~pâ=N¥Y¦|ü îÓQQV!IöT!_«Wî­Ý[ýÜ‘úu[ª*5j¥F°6;ðš™Cã_¯±¾‚ñ±iþF[÷e>\ZoÊV–”³l4Å†‚Ùäüß2é5^’f·†¶½¼¢ø™úc‡Žm©²?þûWfÛZoÿ*J·g_ÈŽ¼âÙjò™pÙÏò8dÕKâ5VÍ|ZNê?Wà¯À%á´}òí\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(34,'sys','quickAccess_messages.png','image/png',5270,'2013-12-14 18:15:36',5270,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\" xmpMM:DocumentID=\"xmp.did:F20F5CD465B911E08F52CDC811356623\" xmpMM:InstanceID=\"xmp.iid:F20F5CD365B911E08F52CDC811356623\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:74BDB0A2B665E0118CE4B767506F182C\" stRef:documentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>^*|*\0\0ÈIDATxÚbøÿÿ?çÎ<+Ä`6#ˆ˜·då4\0–xÿâæA~	&FFF†çY®¿bØpK”áÿ—_E˜@²ËW®d`ä`cÐ–aføÈeÂðæË_ˆD³Ät†_10þùüÃðûï?€\0Ûy³ÎéIiFËAÄÜÅ+P\\•ÁÈÒ¹êòÿ$_½ã¼üŸè(†Õ×Ô…™vmšÏ fêÍÀÊÂÌÀR¡$ÊÊÀÂÁÄÀÃò›á÷ «\\¦1ð³þdøüò!ƒKPƒŒ/X@\01À\\…¦n¿óÿÒã/ÿ\'o¹ý/êZ” …Ê»×Oÿ\n\n0àŒ,ÜŒ`ïu­¾ü_KAˆáñ±…*ÚNl|w¯ïcHsFØz˜™á×¯ß-s›t*Þ\n\Z3ü“ÖdPpÉf8yí=Ã²ó¯•Âìþ]×úãÃÙ\r“,”™ÿ3°<?Í £nÌ`¯\'ÅðëÏ†›O>ƒb”a¦ÐÌÿÓdþ00H\0õ	Â\0%Ÿ–‚0Œ?ºêºB»0mInVAâÅºÔ¥NAtºõ	ú\Zõ\":wêÚ)Ò.¢(#)!è&š°«»ãî4»±*ÒsxgÞ?ÏüÃ.í÷]q=ïúÙãÆÛž·òÅ#¾•ÕØîÆ,µôæú`Î“oë0ÃÁÁùaùpK¬«³Q\"‰9Òi33i€¶0JG§çuw/ohÓ²Ùýs	å‡;H$ƒ©qÙùAðÆim1	HÄëÀmF1ŸGl)‡tfÕè2.ÞT´&n*€ ¤ ÄÂ=ëÐ¡’k9Då0n?L(AD‚qPEE õ\rÓ­Ö·Õì:0ªe~ÉFz:ˆ„ÈÛCaQ“Q(ÕÑ¦:º	U¢­\ZÆÂ<áP\\C7y!ËÁJŠ øTû%ö÷^¶;_/ññ^6“üó/Rq‰€½î°ëÕPã?¹;ÿ@iµÄ4EÑÓ×V[ÚBèL¡©X‹ZD¥|ÚÔ.\\è1qe‚‰1QjâÂˆ&6FâJ]7&Æ?v®HÔ`@1>Š­D¤J[ÅÒRÚß´tZ\"4x“—ÌÌ›Üóî½çÜû$.­ÐbM;–xü=µÜÐ\\8¶c!›œð~wjõì|ªwœt¬/º|\0Ô1qÖP§Gšª\rÐ¨Ò^’0ü5ˆ7&Ï¨uÌÝ›\'ê—7à÷M………Ò{éAùç[î³ä”(Åô„%^ˆÖùtl¯ŒÞMdje2o¯A–&kÚåûo~ø®{‚Šzç“‘ÞrFƒÉ™0\Z5é#‹QŽ\"þNÝµU`\rL^l‘¤v[U¤-ëÃHˆ0‡ÝfªV3Î^ôÀ²ÍŽ:×~Ô4WBIÄT\0³aã>|íF{k½”\Z1˜oA9^zµ8è4¡Í¥ÀgŸ±*E)tÊö«žKpì;\nS¥Ž}ÞŠÕtO 0èå±06CWOâ%»¨Zd°”Ã¶E6cÚO4žÍáj\0*¹ß¿Bà8œøâ±Y%‡JK@1¨3Ðú\0zUi).kJŽýãsxOe3!Sï…’43£œ¿r¯ß‚wÚ+G`/\'(£`FºXZ-HøG\'*DâIªq;­%¨ÛªÇÄÌú>°¸D»hz¢f#-Ç»ÖîB;Ü\rL\r>Çë‡c0™L`FÈéQBYpæíht·@¸‹KüªW°ÚÔ\ZöÎC¡X¡ôm@å<^3ÕÐaeñbý¢xwºt¼¥ÄÄó|*\r‚€\r›8ŸäôDçÙ\\ª?b=Mò ‡‚á?,÷´Þú+\0ëÕÖÛF„¿Ýµ×Ž½¾åî8IÓ&vb«\r¡J‚DRQP‚R‰ðR!„Dÿ@#Ä/õ„Äå•›<´D…PÑrU«*”‡(‰Úª®’âB“bÅŽ“øÇ·õ2g›8ns9Òø2»gÎ93s¾ù†SvÙÚXiõg.ei¹ ØZ÷ÊNSŒÁÖzW­]-–LG“9_\rŒrÌ;Ì+ÌÕTâÒýõ—«ÉÃðtZŽZÃ¹™YÿÙ@0tŒ¥ýŽf4­ñì±†\Z¬zºL¦<¹Ø¡h\n7|Ë‰Û¾…î÷_\Zôm£’v«þ•b	|Þ¾Rî¢£OQkv„åÁva|tz¢[ù1Ð‹|ñ’lÑ¹ma;­h±Y[´ôáE_<?7ýŸd1Sc¯ŸÙœ×l¬ÆÒFÃ9ÉØë¿ö‹„Ñå9O?ëX.¨‡ Á2à©ÃÍßÜÈ¤SÄ°²êË³wþ€wî^gZ\ZÐíq’û„°:<¨âMêuÕ+„9{Œh­ëÀÙéyjôcâÂ$šÛû`µvSÕA0p¸4uµ†,z{ºÊ3(¿:¯‡ÞT¡ýõ%W2¥{¡Æ¬Ã!§_~v’ký€™Ð‰!)uð\'ìTñËôMôõ8‹F2ôlâ–tË1è¶ª}QIé¿ÄtLÞzó5\\Ãhl+k\n¢ëÔ£Ñ÷lˆCÆhÂT \r+I#|‹	(¯Ñ¼O¯[p°£n*8Yª‚²\\\n^L)0hŽÅÖàhjÂ¾.4´íÊ«pRF8Í—Ð`ä`µØWõ8.ÿx36\"r5žêm‚A§QO²a¯ØÃåùo.ï¢[^/Ñ‚\ZÆ•\rU<îEyT›dèýµ4»d@\\Á§–àv:I›g±Ì-›¥49v‚4Z99\rêðÔ¨…¨&»ì´§B\'K Fî´tÑAƒ6ª^ƒˆožÇ[èù“•-pM\'˜²½ÓÈÒ}¬SWI3ã<êMlJ?ªú” \0.F§ç€ºS©Jƒá¾V\\žñc%žQÝ”‘·. çœ#j¢1ØðÝgà8H:lSLÄ\rIÑ=ùþëshnkµ\"ªèèÁP¯SÞ –\"©B6g‹¼‚Äçã°ÿÄÃvj“ÇIŸ¡®AQ…çÄ£aL_ÇcOŽR—¬”ˆ@Áì±ãÚ\\+±TY,ëŸœBç³¿£xWÞ})—ãï¼Ææ=0%d“q,-‡1üÌsLf•”•W‡©9ýæ§ßÿV}L{Ÿá«G^MŒèîøò…áÕŸ€iô¨Z0þûäºjë!ŠºŠð(CÎã0öÑük\ZÑ¨ë?AÆçîb}rg¢Ç‘8Òõg9•¶(j\ZâîBEÆ9%•[½rD±FýHü0‡ÞŽ¿òb\Z§ðÿŒ, †Óni2x\\RNê1vòZ¨„ý%@sÖ\ZÛT†ŸÓžv½¶§]Û±µ»•me™\"lA&A¢Æ‰Æî§¿¼%F5þ1Q£&^/ñ‚‰Cð‚ Ñ8Ä\0d\\\\Ë&c[7º¶ÛºÞÏ9¾ßéZF·l¢ù%§ýzzrÎû|ß{yž÷ÌáEiµE4\\éÚšÊ;éî/\rŒÄ¶Ÿ\Z{?—IõX•)”Â7Ðx‹äqõCnXYm½ÃP¦û‚\n$Ïòee¹	•Ns§ÏmëŒL¥gƒÏpœæ[£ 	Yå?Ò˜ÿ¼´úe5nÓMNó7‘É´ÑJ©Ïë2Ã!èÕ„iµˆoPF\Z\'ºvnd\nLi†žP¹ÛlsGH+ÿfþ\02Zïs™[hu÷…¢Ã¢Gm…vJòºy	ÕÜÇS9„\"IŒD’ÊXxbûX$ö:s±§·6Ø%Iòær¹¢!‘H$ÐÑÑ+¥`‹`<õ–W«m FÙ1ûÿm,ÐÈÙçç»¶ô\\‚–^WjÇg;w1®ke²ý¥ü‡1`·™IàE.¼„CSà¥jkNó†uÚ\ZÛ2©¬<¥•—ÌòPÖ‰­¿}¹Øo»Þz,±\0›WÔÇ*î D…U\"²ÏIKÀªFÇ†uûYeº¢nï‹ï=uëk¬ÐÌ@.ÕÆ6ÉBô/žÌO2õ \02Ÿ?–h5iˆN=²\nv/Ó©]t°ÚçgKN’õì×–µÞ|¯¯ß„Ý\'#h«M¢ÞÍ“4æH$qôøiœ8uŽ\0òp¹]°{1ÍÐPÚdŒsb‚Òäd.ÑLZ¥¾*Ï•©™vSpœž[Õ\rÅ`«×Š¡‹Sìo¢˜ÐÍÙƒâˆßzll\"\Z\Z; ¼½ï‡“øó`\Zê|°Ø½°×m &é‚Ï-Â.I“rêS“i	ÚX\ZÆd^gáD¾úËD7¶.*¼·™àÐ¶`”l­u›±y•\0¥hÖÚ*Íb—•bÑ)Ì-\rÎÚƒñþ\0ê–·\".®†Ç¿\\m1ŠÍÒ>«WŒÓ³[—™x˜…2¤$+¢I‘Äånx„q¼·í\0Ö¯ñcE½;ß>™Uä¨, 1¢\'d¢ûi±Ê/¢}…Q­+ÜŒxd6i4°dOÀ\'„¿‚g±êæ»\0Ïõ(w	ÈeÄh5ˆ§º-\nley\0“‘¤FÝ~‹è>íJ}­ÓiFÓN¬ß,ÝïÂÞ€kõð—Ëªñ‡ÇÜè\rUÖ·XiµuEÊ™“/Õ©Ü<‰ð2\09©\0$?úpâXªë\ZÁ‰~,«Hcä]Ì&hé:\rF2úÂ¤¸HYYŒœ*ét<§‚(ˆUÅŽÄ•Á(¸°æú•…£àíëñù‰1\'¡¥Ö‚»ÚíÅ~;ËØò<íjæB²|ISÎ0ƒ–}±y$\Zƒ\"Kä.V¬¤Ì2Ù¼êJ‘Ž™NÊˆ‘jLZˆ$²˜<dk åò;Â\\‹	.\nIÉŒL×ªHQ\\¬¬¶¡±Êª¶²NÆpàø|j=õóÇI^Ü)‹»4ãoU¾jÖüG&E:1ç&mKr?Ë¸ŒTaUZž»Œ¥p3-BÆ0´\\>NRÜÀe02<§«¢¨¹Ô~ÅJ¦’YœœÄG.Àç²¢~™fJç³c–ÙTJ}æÝÖas›£·o¹_oûÚ}; h€£Ò§\Zåwh¡×å]Eý˜…›õÍ€PIA™<¾?ºq1:;ÖmR•èe¹^Ïãºzš(UöNãû#C¨&aï¯(žt*`Á,TÐËL\"æÍMÍ8Ó¼\ZÎ÷aèðô]Ø°é6˜‚j [¥D¡ž‘%_N¦’ˆ‡‚ôC–R÷æ;ïƒVoPõú|ƒ¥Ùr-b»O“k…Ô]jòÚT %I¨Ô…Ô·	LíØóù.[ïÁÝ×\".·ãhO\'a×ù^X.ˆ•uhjn¥\"f¢ÀågÀË”¥ÒRSö\"D.#‘¶¯Û—gÙL»jq^¥¥mfñPé4aðâ4~9~5UÎ9Ì·àSÖàŒÅLÎý_Bßý#üzAì¹‰ÝÈhc0Œ–¡¥û6>ÿ*²´ÄÁ>ÿ<…ý]Û(êsäçD­‰Ci5<ô&3Ü^Ô5^‡æöMÅ‡æ¤+—_,²7•Ã(•+Ü;yžj°™øÎ¦Î–Wšk02Eß00ŠTg¼í9ˆ=N§_RN½ç`?{‹²†¦A\nè(÷¡UÿÐŠÞly²Ùnd†B@É¿b8º?ýî˜ôî[º¢ìõúÿg0B4ÌÚ|Î¤­qøyÁxî?ŒÄÀ~ÿ)5Ö{\\z!œÅäµéè5°@Q®ÊK	p~úxh­š{Í&ø\"ãò¯³Ø)Rê~ö\Z.áÕð7›ìX@Ô€ôÃ\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\" xmpMM:DocumentID=\"xmp.did:F20F5CD465B911E08F52CDC811356623\" xmpMM:InstanceID=\"xmp.iid:F20F5CD365B911E08F52CDC811356623\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:74BDB0A2B665E0118CE4B767506F182C\" stRef:documentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>^*|*\0\0ÈIDATxÚbøÿÿ?çÎ<+Ä`6#ˆ˜·då4\0–xÿâæA~	&FFF†çY®¿bØpK”áÿ—_E˜@²ËW®d`ä`cÐ–aføÈeÂðæË_ˆD³Ät†_10þùüÃðûï?€\0Ûy³ÎéIiFËAÄÜÅ+P\\•ÁÈÒ¹êòÿ$_½ã¼üŸè(†Õ×Ô…™vmšÏ fêÍÀÊÂÌÀR¡$ÊÊÀÂÁÄÀÃò›á÷ «\\¦1ð³þdøüò!ƒKPƒŒ/X@\01À\\…¦n¿óÿÒã/ÿ\'o¹ý/êZ” …Ê»×Oÿ\n\n0àŒ,ÜŒ`ïu­¾ü_KAˆáñ±…*ÚNl|w¯ïcHsFØz˜™á×¯ß-s›t*Þ\n\Z3ü“ÖdPpÉf8yí=Ã²ó¯•Âìþ]×úãÃÙ\r“,”™ÿ3°<?Í £nÌ`¯\'ÅðëÏ†›O>ƒb”a¦ÐÌÿÓdþ00H\0õ	Â\0%Ÿ–‚0Œ?ºêºB»0mInVAâÅºÔ¥NAtºõ	ú\Zõ\":wêÚ)Ò.¢(#)!è&š°«»ãî4»±*ÒsxgÞ?ÏüÃ.í÷]q=ïúÙãÆÛž·òÅ#¾•ÕØîÆ,µôæú`Î“oë0ÃÁÁùaùpK¬«³Q\"‰9Òi33i€¶0JG§çuw/ohÓ²Ùýs	å‡;H$ƒ©qÙùAðÆim1	HÄëÀmF1ŸGl)‡tfÕè2.ÞT´&n*€ ¤ ÄÂ=ëÐ¡’k9Då0n?L(AD‚qPEE õ\rÓ­Ö·Õì:0ªe~ÉFz:ˆ„ÈÛCaQ“Q(ÕÑ¦:º	U¢­\ZÆÂ<áP\\C7y!ËÁJŠ øTû%ö÷^¶;_/ññ^6“üó/Rq‰€½î°ëÕPã?¹;ÿ@iµÄ4EÑÓ×V[ÚBèL¡©X‹ZD¥|ÚÔ.\\è1qe‚‰1QjâÂˆ&6FâJ]7&Æ?v®HÔ`@1>Š­D¤J[ÅÒRÚß´tZ\"4x“—ÌÌ›Üóî½çÜû$.­ÐbM;–xü=µÜÐ\\8¶c!›œð~wjõì|ªwœt¬/º|\0Ô1qÖP§Gšª\rÐ¨Ò^’0ü5ˆ7&Ï¨uÌÝ›\'ê—7à÷M………Ò{éAùç[î³ä”(Åô„%^ˆÖùtl¯ŒÞMdje2o¯A–&kÚåûo~ø®{‚Šzç“‘ÞrFƒÉ™0\Z5é#‹QŽ\"þNÝµU`\rL^l‘¤v[U¤-ëÃHˆ0‡ÝfªV3Î^ôÀ²ÍŽ:×~Ô4WBIÄT\0³aã>|íF{k½”\Z1˜oA9^zµ8è4¡Í¥ÀgŸ±*E)tÊö«žKpì;\nS¥Ž}ÞŠÕtO 0èå±06CWOâ%»¨Zd°”Ã¶E6cÚO4žÍáj\0*¹ß¿Bà8œøâ±Y%‡JK@1¨3Ðú\0zUi).kJŽýãsxOe3!Sï…’43£œ¿r¯ß‚wÚ+G`/\'(£`FºXZ-HøG\'*DâIªq;­%¨ÛªÇÄÌú>°¸D»hz¢f#-Ç»ÖîB;Ü\rL\r>Çë‡c0™L`FÈéQBYpæíht·@¸‹KüªW°ÚÔ\ZöÎC¡X¡ôm@å<^3ÕÐaeñbý¢xwºt¼¥ÄÄó|*\r‚€\r›8ŸäôDçÙ\\ª?b=Mò ‡‚á?,÷´Þú+\0ëÕÖÛF„¿Ýµ×Ž½¾åî8IÓ&vb«\r¡J‚DRQP‚R‰ðR!„Dÿ@#Ä/õ„Äå•›<´D…PÑrU«*”‡(‰Úª®’âB“bÅŽ“øÇ·õ2g›8ns9Òø2»gÎ93s¾ù†SvÙÚXiõg.ei¹ ØZ÷ÊNSŒÁÖzW­]-–LG“9_\rŒrÌ;Ì+ÌÕTâÒýõ—«ÉÃðtZŽZÃ¹™YÿÙ@0tŒ¥ýŽf4­ñì±†\Z¬zºL¦<¹Ø¡h\n7|Ë‰Û¾…î÷_\Zôm£’v«þ•b	|Þ¾Rî¢£OQkv„åÁva|tz¢[ù1Ð‹|ñ’lÑ¹ma;­h±Y[´ôáE_<?7ýŸd1Sc¯ŸÙœ×l¬ÆÒFÃ9ÉØë¿ö‹„Ñå9O?ëX.¨‡ Á2à©ÃÍßÜÈ¤SÄ°²êË³wþ€wî^gZ\ZÐíq’û„°:<¨âMêuÕ+„9{Œh­ëÀÙéyjôcâÂ$šÛû`µvSÕA0p¸4uµ†,z{ºÊ3(¿:¯‡ÞT¡ýõ%W2¥{¡Æ¬Ã!§_~v’ký€™Ð‰!)uð\'ìTñËôMôõ8‹F2ôlâ–tË1è¶ª}QIé¿ÄtLÞzó5\\Ãhl+k\n¢ëÔ£Ñ÷lˆCÆhÂT \r+I#|‹	(¯Ñ¼O¯[p°£n*8Yª‚²\\\n^L)0hŽÅÖàhjÂ¾.4´íÊ«pRF8Í—Ð`ä`µØWõ8.ÿx36\"r5žêm‚A§QO²a¯ØÃåùo.ï¢[^/Ñ‚\ZÆ•\rU<îEyT›dèýµ4»d@\\Á§–àv:I›g±Ì-›¥49v‚4Z99\rêðÔ¨…¨&»ì´§B\'K Fî´tÑAƒ6ª^ƒˆožÇ[èù“•-pM\'˜²½ÓÈÒ}¬SWI3ã<êMlJ?ªú” \0.F§ç€ºS©Jƒá¾V\\žñc%žQÝ”‘·. çœ#j¢1ØðÝgà8H:lSLÄ\rIÑ=ùþëshnkµ\"ªèèÁP¯SÞ –\"©B6g‹¼‚Äçã°ÿÄÃvj“ÇIŸ¡®AQ…çÄ£aL_ÇcOŽR—¬”ˆ@Áì±ãÚ\\+±TY,ëŸœBç³¿£xWÞ})—ãï¼Ææ=0%d“q,-‡1üÌsLf•”•W‡©9ýæ§ßÿV}L{Ÿá«G^MŒèîøò…áÕŸ€iô¨Z0þûäºjë!ŠºŠð(CÎã0öÑük\ZÑ¨ë?AÆçîb}rg¢Ç‘8Òõg9•¶(j\ZâîBEÆ9%•[½rD±FýHü0‡ÞŽ¿òb\Z§ðÿŒ, †Óni2x\\RNê1vòZ¨„ý%@sÖ\ZÛT†ŸÓžv½¶§]Û±µ»•me™\"lA&A¢Æ‰Æî§¿¼%F5þ1Q£&^/ñ‚‰Cð‚ Ñ8Ä\0d\\\\Ë&c[7º¶ÛºÞÏ9¾ßéZF·l¢ù%§ýzzrÎû|ß{yž÷ÌáEiµE4\\éÚšÊ;éî/\rŒÄ¶Ÿ\Z{?—IõX•)”Â7Ðx‹äqõCnXYm½ÃP¦û‚\n$Ïòee¹	•Ns§ÏmëŒL¥gƒÏpœæ[£ 	Yå?Ò˜ÿ¼´úe5nÓMNó7‘É´ÑJ©Ïë2Ã!èÕ„iµˆoPF\Z\'ºvnd\nLi†žP¹ÛlsGH+ÿfþ\02Zïs™[hu÷…¢Ã¢Gm…vJòºy	ÕÜÇS9„\"IŒD’ÊXxbûX$ö:s±§·6Ø%Iòær¹¢!‘H$ÐÑÑ+¥`‹`<õ–W«m FÙ1ûÿm,ÐÈÙçç»¶ô\\‚–^WjÇg;w1®ke²ý¥ü‡1`·™IàE.¼„CSà¥jkNó†uÚ\ZÛ2©¬<¥•—ÌòPÖ‰­¿}¹Øo»Þz,±\0›WÔÇ*î D…U\"²ÏIKÀªFÇ†uûYeº¢nï‹ï=uëk¬ÐÌ@.ÕÆ6ÉBô/žÌO2õ \02Ÿ?–h5iˆN=²\nv/Ó©]t°ÚçgKN’õì×–µÞ|¯¯ß„Ý\'#h«M¢ÞÍ“4æH$qôøiœ8uŽ\0òp¹]°{1ÍÐPÚdŒsb‚Òäd.ÑLZ¥¾*Ï•©™vSpœž[Õ\rÅ`«×Š¡‹Sìo¢˜ÐÍÙƒâˆßzll\"\Z\Z; ¼½ï‡“øó`\Zê|°Ø½°×m &é‚Ï-Â.I“rêS“i	ÚX\ZÆd^gáD¾úËD7¶.*¼·™àÐ¶`”l­u›±y•\0¥hÖÚ*Íb—•bÑ)Ì-\rÎÚƒñþ\0ê–·\".®†Ç¿\\m1ŠÍÒ>«WŒÓ³[—™x˜…2¤$+¢I‘Äånx„q¼·í\0Ö¯ñcE½;ß>™Uä¨, 1¢\'d¢ûi±Ê/¢}…Q­+ÜŒxd6i4°dOÀ\'„¿‚g±êæ»\0Ïõ(w	ÈeÄh5ˆ§º-\nley\0“‘¤FÝ~‹è>íJ}­ÓiFÓN¬ß,ÝïÂÞ€kõð—Ëªñ‡ÇÜè\rUÖ·XiµuEÊ™“/Õ©Ü<‰ð2\09©\0$?úpâXªë\ZÁ‰~,«Hcä]Ì&hé:\rF2úÂ¤¸HYYŒœ*ét<§‚(ˆUÅŽÄ•Á(¸°æú•…£àíëñù‰1\'¡¥Ö‚»ÚíÅ~;ËØò<íjæB²|ISÎ0ƒ–}±y$\Zƒ\"Kä.V¬¤Ì2Ù¼êJ‘Ž™NÊˆ‘jLZˆ$²˜<dk åò;Â\\‹	.\nIÉŒL×ªHQ\\¬¬¶¡±Êª¶²NÆpàø|j=õóÇI^Ü)‹»4ãoU¾jÖüG&E:1ç&mKr?Ë¸ŒTaUZž»Œ¥p3-BÆ0´\\>NRÜÀe02<§«¢¨¹Ô~ÅJ¦’YœœÄG.Àç²¢~™fJç³c–ÙTJ}æÝÖas›£·o¹_oûÚ}; h€£Ò§\Zåwh¡×å]Eý˜…›õÍ€PIA™<¾?ºq1:;ÖmR•èe¹^Ïãºzš(UöNãû#C¨&aï¯(žt*`Á,TÐËL\"æÍMÍ8Ó¼\ZÎ÷aèðô]Ø°é6˜‚j [¥D¡ž‘%_N¦’ˆ‡‚ôC–R÷æ;ïƒVoPõú|ƒ¥Ùr-b»O“k…Ô]jòÚT %I¨Ô…Ô·	LíØóù.[ïÁÝ×\".·ãhO\'a×ù^X.ˆ•uhjn¥\"f¢ÀågÀË”¥ÒRSö\"D.#‘¶¯Û—gÙL»jq^¥¥mfñPé4aðâ4~9~5UÎ9Ì·àSÖàŒÅLÎý_Bßý#üzAì¹‰ÝÈhc0Œ–¡¥û6>ÿ*²´ÄÁ>ÿ<…ý]Û(êsäçD­‰Ci5<ô&3Ü^Ô5^‡æöMÅ‡æ¤+—_,²7•Ã(•+Ü;yžj°™øÎ¦Î–Wšk02Eß00ŠTg¼í9ˆ=N§_RN½ç`?{‹²†¦A\nè(÷¡UÿÐŠÞly²Ùnd†B@É¿b8º?ýî˜ôî[º¢ìõúÿg0B4ÌÚ|Î¤­qøyÁxî?ŒÄÀ~ÿ)5Ö{\\z!œÅäµéè5°@Q®ÊK	p~úxh­š{Í&ø\"ãò¯³Ø)Rê~ö\Z.áÕð7›ìX@Ô€ôÃ\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(35,'sys','quickAccess_placeAd.png','image/png',5352,'2013-12-14 18:15:36',5352,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0ŠIDATxÚbüÿÿ?6À\":::þ‡‡00³±0pqr1°°°00þüù“áæ­»ÿyyy~üøÆÀËËÃÀÆÆÎÀ\02êöƒ{ÿß~xÿÿÞºyó¿§·÷&Qû¶ï`8rèPÇoÛáûB^At cYyö+ª-êÿ\0ˆ§«Î;³ãÚÕ›î2r²êjª¬¬¬\"\"\"ŒŒ7oÝúÿŸ‰™á÷·¢¢ÂLÿŽ=ºˆåç\"bÂL<Ë.e¸tå*ÃŒÓã>òÝ¢5:æÚ\ZšZúúú×®ß\0»Š	æ\" PaÈSù œ®ÂXþüþÃpìøñ?²ò\nÌÏ_<eàçgàâï?€ðññ1|üø‘áã‡oß¾•Ûðõë·ÿ¾}aaøÏÈÈÀ´”H¯^³†aýÆÍ~.žªz\Z@ƒxÿcéå‹Wï>¼aøôîÃŸ?@Õtõt._½Êðþí[†å’ÛìveÈ+™ÈÄ2kÖ,‘ýû÷¿}õê5ëÿÿÙXXÿüû÷Ÿ‹‹ëÿû˜®˜>æyër—õ¼ÃýÂüÛx=\rt(rù€ø‰ ¤ÊY\Zˆ‚ð·»¹v7‚Æ,ÑfEñ\01ˆ`£ ¤²öØÇÒc+¶þZ\nb5…l ˆ ®š=²Î&ZX80Å›7Çûf¾7ÿî‹ŠÃ2ë¸¸¾²X–Ah¤x¸¯B–#DQÇáöîápm­­[ÓuXä%x½}\"ÄrO„¸pÝ4áöðxWU‚ØÄõF‡RéÒâE¢ÇM¯sk¤\0LCÅÀér¡nj%Æ±›Ív\rPÉÜ\'µÃ²ˆÌF¡Ž*åkDc}H$¦› OŠ§ë—¯/*sG¨(\nÊJ™†VDWw7âãcØÜÚÆÝ5žôP­\Z4iÎM-×ê”Ÿ@3Tgey/¯oè©\0Ò(\nkW(äó>{–BŸŸž±wp\0žcÐ€ÔÀüÂ$>ýx4]HçàßW÷˜t:½sœË%\r£ÎºÀ[¦” n½fÜ‡OƒE<5…ä¹<ñë£üTt³–¢¶³íRÃ¦÷wí¨¤šíû%\0måûÒTÅñïÝ»»Ÿ÷Nm¨#E›£–?ªëìEfDD‹² „ˆòEHD±zß›ˆ {ÓÄ0c)ˆBÃi¨étF ˆš¡™°é6µÅÜng·½è(tà¼¸÷yÎóœó=Ÿ³k-íÖøÏ&7hz;ñÐø\"oÎ/îîö£¦ª\Zmm>8Nø|>Ô×ŸC<ƒÛ]G8XÇ@0(ov»Ýøà÷ËÿÅârwÁn·ÃsÅ3/È9“qœ\"ÎÌÎ/HfÞŒðä55¤(´Z1H‡Ýhj\"¥däuFV&#7ìß÷g0ýu†¬çÕ`•Ž=ŒÎ7<O—*CbÛ&Í!ø1\0­NG‚K@¢ o»Þ7˜Ðñº\r\rç³•„^o@ËÝbª’R‚£´•§ÁÁn(DUµ6›í%EÏSz½^ôöözòó¥t2\rk‘±ÈÄãÇà+¡a÷¡òÄÌÎ-€U3ÐjõXYùýe¥èlkGrc÷?Â¡òr9`A~!@\rGÅ-«fÈ5P0Šçß—ç¡0é‘ØŠ¡ì`	¦¦ÂØVQû§X]dÁ;$ÊK‚jñit¥°™^Âqìlfvßç‘XÃ`ô£µõþEž4\ná7a¢†nÄ—‘iœ<%b-\ZÍ&H91ˆunL…\'ÁÒÁÑH×\ZÁ8MHe¤6YT	•ðZNÃdt¢ùÎífÆår	Ý==k@\0ËËK”\r\nmùƒA§íErkF^€(Ö\"4¢ï_¸ùä,÷J0qv€\0Gµ#%¥ˆcq=*bõçÊLö*šDº 1Gõ­¯¯ÏØßßoz5\\«¾¬*Ñ!Ò4ý«ZR˜\nùRéÙ™§F³´§NÎ]„\'§.»”Í yŒ<Bž”ó¾WTä¸³£eÏþ#\0õeÛTÆñÿ9íéÚu;ëÇÖ­]×\"\"#.4¨,ºš˜˜ÈHî€‘xçpaH–Ìcb/$ã…W€¡™%†(Ä€@¦À`ÙnÆúÍh»1úqÚÓ­Çÿ9+è%Á+.šÓžóö}Îû>ÿ÷ÿüž—ß‹^þ\0f£ÂT‰™îiºÌ¢ˆþXk5Ò€PaBiÉXÁ5~ˆÄCE#pœIÎ#-\ZWáYò‹Åâ~¿Ÿ€ÜÊ	WDÀðð0ñ¨aÃ‘H===D_ß^Â—û÷ä³wi#7±·¯#tZæjäŒþþ~`qq±›V§–Uœ={NîìÚ°%t“âälÜ¸Ñ099‰` ˆ¹ÈrÁ\0ñpÉ°£: s4É˜¹?[}sóf“±‚•ªîôÕ}V©J¡ˆ‘K#hóñyXíþ5h¦e8.˜VKZš=†Æ=nÖÓEÏ_ø¬±¡N—õÖºg¹õÅNº[ZwÛØˆÜ{I²@2Y ZXNˆ ÅBŽ/!‚†\n;\'±ÔÙ¸¥*VH-ÌÕê6QR\"¼‹fVWÀbc«·¿/si#/¼˜$ü>R‹YdÈ»DU­0‰\Z¦g¦qùÒ8\Zìp8d´u´ã1‰(ÐæÃøØÖw­G»ß÷¯Šô\nånv·éá¶õnÇ“BëºŒR¨Ñrtâ6œÆ&ñ»‰„çÃ«TÓèØ\rŒ#³Åñð	Üž˜4ŠÐ“\'9câ“ápÃžÝ»óFÁñxÚ„û‘Yâ|yn‡·5Xb”ž¢%ºY‹ei1á5v2iîwØïõy±…$9:2Š&öY’½Sn2ÔIR7/¿™õt»H&ô}:˜ÀG©\"›Véˆ¬j²H–²Š(WX¿é÷§Ø?|sä¬ÌSI-á¯[7qìØ1d¸¥;?Þ‰P(Ä9›éDŽ\'@!]È.–­fdò9äæ‹Ì@njÀ\"›¿d&aÀR\'¡{ëV$y^–™à¹¹HÏ?„ìtråí¸zí\nÒìE¦îNu\Z9ðù|ÞT*Å?š±ð(	EQH&ÏTá®w\"yHÙ\núÙ…?ØAõ˜pûÎßˆE£Hqb¿7m×Z<^×‚mÅœ9Áõëcèy/ddÚê	í5Ð¥\\AûÚ \'LâêŸW°©ë-¨Äöåå<U%A[®\ZÛ‘Igñ9O«ÕfÅ×ßîÁ™nZ…–€’Ob¼Ú‚Ov@.7¢#XŠÞí½Ÿ\nyÞèÀPøkP)É[Ócd›vß8\"Ñ·\'\nï7°éÐ9*:Çi)‡ßmlwB¿ ]y„ï¦†©>¡ÛÅªLm6›wjê.˜ R‘{NbžKW\n\n-b\r\nù\"ßn	ñ(­Âå ‘•‹Íaòì¥\rç ¿-ë‡ÙEëp/®i9lº?‹];wˆÂáÃ‡·\'‰£3÷î¹TµLÙSQ1jE°XDª¦ªIuz—³ÂŸWš#ƒ‹•JY˜èŒÙuå­dTd‡â°$å½áÆ÷¯÷!y~é‡ÃqHP¥¡T*y9©ô<þNA˜Ãáp+\r±é§?††´ÏÖ	Ë—³H™@ËéÐZïÂ	û†£[>øò+öÑé§5Y¬5 ÏSðu—læGG©q³|=·¥Y€‡Æe7£_ÍÞü\"ùÇU_¨è×ŠŠµ†,ú±Õj5TÉÖÐ¥úÂTñd±Ô=\r Ö‚Tÿ¶</=\rð\0íY[lT×]3÷ÎÜy?îØã±gÆ™±qh ã0Ä¥‰ÊO›¢å#?U¤¨ù¨úÛ©ü¶\rDJ©Ô¦¡)mš@¥Qy¥!¶PÇ./;vÀø…Ÿ{Œíf<®sf\n¦j¥¶‰*Õò•íñ½çî½ÏÞ{­µÏCçEÿó¬åÿü;\"¹Fd.¤—.vþÀlÖ^,Ê*LÊ¼­ß£`|†áß˜Ësrb,„BN,ŒFEU!/$Ž‰uTCNRAƒ’7˜5áã¼ÁP ƒò\ròeÅl„bø&þ\\šâÙlö§Á`ðõ¥(»wï–ÊQ<(@gb|b¿Ýå¬WMšžHÞÕ÷ìù‘—šÔ³lY½‡\rÎóæ›ÜÑXÔýÈWuÕ\\ƒƒ®öö®Úºz×Ñ£G\\ÄiÊ8ÝU®v·´~ì&F»ËÊË=oüâ\rO(Táíèèðž<qZ_L§õÁ!Þé{P_óøZýàoÞÒ/_îÒ#‘¨¾k×.äB?yê”ÞÜÜ¬Ó\rpmÕuý×¤P6KÔÎe¤0ä¢ M\rçIr$×ûö½*ùmOw7¦ˆ÷™Lªª ‹áÙo?ƒ\'›7âÜùs¨®‰ ‹¤buC£$ù|ýC7ä”óíß½–Î`ÕêUˆS€^»v66Q¬:q•2üƒ?Á†¦õìï“Ì3ŸF PFš–ð380€ŽÎNI2ùÿ\'(„H{CšFeáÍ\'Nh–ÿ¢‹	*wÃ¤i°ÛìÐ4“,7Èlaær²\'¦¬L…4å»Ñ¤2\0w!Ø­—ˆÙ‹Ùb£!‹rà¬*Šd¹Fò“»˜HÕ¨Ê5Eºyeé<!„›(ù3ÌB“Döúµ>ôôt¯Û¶mû\'÷k€6dó\"â˜u»ÍæÀ_;;Æi$æ“‚W#Ã+Ï‰@–IgÉW(ýSrš,34^Ð=7äXy™õ\\^ÉJg…D22\0¢f”B1Ñ(³Ìq‹jF:¿1·ÎXTR|—EðTU•ÏEkëPê/ÁÕîÜjÚ½ÄFAh+ÞÉÕuÝ‡\'Ö®\'¿¿+#X	saQ_9rÕqr~?’é$nE×ÀauaddˆbÃšê0\r(hµÂþäIšÜž¼…ë$Õ>O	œÒ‚ASøzî`jòî¤¡âó»Y2–ÄwÁ€[3ÓðØ]SQ	&ãq{^äÒ÷\nùzç]µ2R3_‹i7†‡$Côø<Œ †™±	Ô-¯#me¤Å–}$/¼ÏZH6Íè1bIîœˆ=D‡jÂbE?yñ‘Ãï£¾¾uËêI3’g\'R	¦Â]¤¼˜ÏéæNdpåêgèºÒ	»æDí²ëg5\Z{Lv§íí©×¯Yž~Çý6*=Q•5eþ€6y›rcvF*°Ûc“°:l²Åžm=ÇÈ$ð—¡¯»ZÀ	;™Ã£M\rêíÇÔì4ÊBAI6ÝT\Z“Ó“¨†á£T-&Ì-¤0::ŽSÇO£aí\Z´¶œ¡ƒvT…+)e¦±õ¹­Ã»¾Ãg7cavA6˜‰‘	Ü‘³ùºhÄÜßw=H£Fî;À(RønòùtLLN ¬$@žÆhÎŠ\"M!mÈ VWƒ@¨\n/]†¿2ˆ&Fehâ&ðÈ®!¢ÔÛ×G]µL¦”ÂíBƒ¤ãw˜J*Þï=lÛþ,ì^\'~öÚkT…PSé”¯„ÑŸŸãBÛYLŒŽÊ3›djƒ}C˜fPÅ3ÂªTƒÃáiôÃû°ô|ÞûÂ¦M›Ÿž†Ê‚Ä¼)n±Å¢È¢šO¤q­û*ü.Lz\03qŠ;*¡Ô8ò4ölGbåQ|Þ×»ÕN	œ¦BJRŒ{™M\n>imcÊ,àÐá#¨¯‹¢‰í6\r#PRÉ–jg—b=x¼…4eÜf¹þñS\'‘ea?õôS;·dê‰n–Ëe·<à\0Å¼¹½½=lTŒhhhø¯ =RUý/ÿ\'	„ËÑÈT‰ÖÖÂÎÖ*NéÆoM¡ãrÆ†‡¥¤N²¥&‡5÷%ÆãØ±clÏI„™Ž_]µ’Xd>PÄZ[[[,‹áâÅK”ß”zL«4ûwU¤š 3,\ZE,’-“2EBAÎXx‰|eáèMha™+V®]Càuèb†@Éæ`m›7-æ²8|â{8í›ÂX©^³&Òô|F…ÕhGÈRŽuŽ\nlÐ‚0åêà-ñr=/M`ó767_ºt±EîÀ–-[^Æ£°iÜÆzvP:þü¥.˜ŒœïìB™ÛsÛç/…Ý`B s±è»>»BÐbgçÉûº@ú›Ã7Y#l¯\n…	Ã£Cø´íÏ}„ä:Ö¶\\\nñQ\\øú‡‚ó`yÛ7q%Þ‹áÄã¾•Ø\ZHbÅx)úm¨†ðäÆ;iz‹\ZFÍ{÷îmŽˆáG:•b.zðÎïß%€-ÂÏ¾®¬@:¹(U¾™Lîrï4ªæSXQ÷þüá¸K<¬Yø~\Z;,¦÷R¢{FjlV04›éÄ]ÄgYÐy¿:ñäŸóC¯6C³ÇR˜?;×‹y¢3éfÒ³8=rKa+Y‰\nS‘ÞŠH,¶^¦ÐŽ;JH~‰DvÞ™›3\nî!rpRp\"«7›I)ŒR±ŽËÔG+VFÜ_ÀôÔmÙ»v©‚‰è=QK¢ÿå‡Š3¢5ÏÍÉÉ3}Ìõ¶á6˜ŸöÁìP0üJ7„G™EÖ‰ÂALFêy¡å›+Vã[å¸úúy8ìŽL\"±ðcÖÖCWW—…$©šÔóÁjÖ„ƒ¿þ3ˆâøG…\'‚A§•™™óÔÔ”…ŒÒÌ4UÚ·s¸Fsjë¼P]¤3$“=óˆFûÞ„,Ê?ÄID£9^2•ÇK´¯½BGû¸toYYÙðRYo|XgÿþýêÑ£Gm.¦‡“ÌWšVÛ_Žé–åYÖÁÇâOÉcø|ðj’Ü	²0šñr\"ýé÷_:×T\\2÷÷ëÑÄ†‚R”ÖÊËQ¼´âDÀPU¡~×è6=“ôjþ¸ˆlÕ¯ä²1Knl…#÷Ö«â»yßbqzðÀNQÜPEG´âHÃ\\üÌ¸$²Ù%#ŽTÑðì?›H|Üû¨h´aÉU$5÷®ÜÒˆ©<Ì¯¿¦‘1‹¦6Uð\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0ŠIDATxÚbüÿÿ?6À\":::þ‡‡00³±0pqr1°°°00þüù“áæ­»ÿyyy~üøÆÀËËÃÀÆÆÎÀ\02êöƒ{ÿß~xÿÿÞºyó¿§·÷&Qû¶ï`8rèPÇoÛáûB^At cYyö+ª-êÿ\0ˆ§«Î;³ãÚÕ›î2r²êjª¬¬¬\"\"\"ŒŒ7oÝúÿŸ‰™á÷·¢¢ÂLÿŽ=ºˆåç\"bÂL<Ë.e¸tå*ÃŒÓã>òÝ¢5:æÚ\ZšZúúú×®ß\0»Š	æ\" PaÈSù œ®ÂXþüþÃpìøñ?²ò\nÌÏ_<eàçgàâï?€ðññ1|üø‘áã‡oß¾•Ûðõë·ÿ¾}aaøÏÈÈÀ´”H¯^³†aýÆÍ~.žªz\Z@ƒxÿcéå‹Wï>¼aøôîÃŸ?@Õtõt._½Êðþí[†å’ÛìveÈ+™ÈÄ2kÖ,‘ýû÷¿}õê5ëÿÿÙXXÿüû÷Ÿ‹‹ëÿû˜®˜>æyër—õ¼ÃýÂüÛx=\rt(rù€ø‰ ¤ÊY\Zˆ‚ð·»¹v7‚Æ,ÑfEñ\01ˆ`£ ¤²öØÇÒc+¶þZ\nb5…l ˆ ®š=²Î&ZX80Å›7Çûf¾7ÿî‹ŠÃ2ë¸¸¾²X–Ah¤x¸¯B–#DQÇáöîápm­­[ÓuXä%x½}\"ÄrO„¸pÝ4áöðxWU‚ØÄõF‡RéÒâE¢ÇM¯sk¤\0LCÅÀér¡nj%Æ±›Ív\rPÉÜ\'µÃ²ˆÌF¡Ž*åkDc}H$¦› OŠ§ë—¯/*sG¨(\nÊJ™†VDWw7âãcØÜÚÆÝ5žôP­\Z4iÎM-×ê”Ÿ@3Tgey/¯oè©\0Ò(\nkW(äó>{–BŸŸž±wp\0žcÐ€ÔÀüÂ$>ýx4]HçàßW÷˜t:½sœË%\r£ÎºÀ[¦” n½fÜ‡OƒE<5…ä¹<ñë£üTt³–¢¶³íRÃ¦÷wí¨¤šíû%\0måûÒTÅñïÝ»»Ÿ÷Nm¨#E›£–?ªëìEfDD‹² „ˆòEHD±zß›ˆ {ÓÄ0c)ˆBÃi¨étF ˆš¡™°é6µÅÜng·½è(tà¼¸÷yÎóœó=Ÿ³k-íÖøÏ&7hz;ñÐø\"oÎ/îîö£¦ª\Zmm>8Nø|>Ô×ŸC<ƒÛ]G8XÇ@0(ov»Ýøà÷ËÿÅârwÁn·ÃsÅ3/È9“qœ\"ÎÌÎ/HfÞŒðä55¤(´Z1H‡Ýhj\"¥däuFV&#7ìß÷g0ýu†¬çÕ`•Ž=ŒÎ7<O—*CbÛ&Í!ø1\0­NG‚K@¢ o»Þ7˜Ðñº\r\rç³•„^o@ËÝbª’R‚£´•§ÁÁn(DUµ6›í%EÏSz½^ôöözòó¥t2\rk‘±ÈÄãÇà+¡a÷¡òÄÌÎ-€U3ÐjõXYùýe¥èlkGrc÷?Â¡òr9`A~!@\rGÅ-«fÈ5P0Šçß—ç¡0é‘ØŠ¡ì`	¦¦ÂØVQû§X]dÁ;$ÊK‚jñit¥°™^Âqìlfvßç‘XÃ`ô£µõþEž4\ná7a¢†nÄ—‘iœ<%b-\ZÍ&H91ˆunL…\'ÁÒÁÑH×\ZÁ8MHe¤6YT	•ðZNÃdt¢ùÎífÆår	Ý==k@\0ËËK”\r\nmùƒA§íErkF^€(Ö\"4¢ï_¸ùä,÷J0qv€\0Gµ#%¥ˆcq=*bõçÊLö*šDº 1Gõ­¯¯ÏØßßoz5\\«¾¬*Ñ!Ò4ý«ZR˜\nùRéÙ™§F³´§NÎ]„\'§.»”Í yŒ<Bž”ó¾WTä¸³£eÏþ#\0õeÛTÆñÿ9íéÚu;ëÇÖ­]×\"\"#.4¨,ºš˜˜ÈHî€‘xçpaH–Ìcb/$ã…W€¡™%†(Ä€@¦À`ÙnÆúÍh»1úqÚÓ­Çÿ9+è%Á+.šÓžóö}Îû>ÿ÷ÿüž—ß‹^þ\0f£ÂT‰™îiºÌ¢ˆþXk5Ò€PaBiÉXÁ5~ˆÄCE#pœIÎ#-\ZWáYò‹Åâ~¿Ÿ€ÜÊ	WDÀðð0ñ¨aÃ‘H===D_ß^Â—û÷ä³wi#7±·¯#tZæjäŒþþ~`qq±›V§–Uœ={NîìÚ°%t“âälÜ¸Ñ099‰` ˆ¹ÈrÁ\0ñpÉ°£: s4É˜¹?[}sóf“±‚•ªîôÕ}V©J¡ˆ‘K#hóñyXíþ5h¦e8.˜VKZš=†Æ=nÖÓEÏ_ø¬±¡N—õÖºg¹õÅNº[ZwÛØˆÜ{I²@2Y ZXNˆ ÅBŽ/!‚†\n;\'±ÔÙ¸¥*VH-ÌÕê6QR\"¼‹fVWÀbc«·¿/si#/¼˜$ü>R‹YdÈ»DU­0‰\Z¦g¦qùÒ8\Zìp8d´u´ã1‰(ÐæÃøØÖw­G»ß÷¯Šô\nånv·éá¶õnÇ“BëºŒR¨Ñrtâ6œÆ&ñ»‰„çÃ«TÓèØ\rŒ#³Åñð	Üž˜4ŠÐ“\'9câ“ápÃžÝ»óFÁñxÚ„û‘Yâ|yn‡·5Xb”ž¢%ºY‹ei1á5v2iîwØïõy±…$9:2Š&öY’½Sn2ÔIR7/¿™õt»H&ô}:˜ÀG©\"›Véˆ¬j²H–²Š(WX¿é÷§Ø?|sä¬ÌSI-á¯[7qìØ1d¸¥;?Þ‰P(Ä9›éDŽ\'@!]È.–­fdò9äæ‹Ì@njÀ\"›¿d&aÀR\'¡{ëV$y^–™à¹¹HÏ?„ìtråí¸zí\nÒìE¦îNu\Z9ðù|ÞT*Å?š±ð(	EQH&ÏTá®w\"yHÙ\núÙ…?ØAõ˜pûÎßˆE£Hqb¿7m×Z<^×‚mÅœ9Áõëcèy/ddÚê	í5Ð¥\\AûÚ \'LâêŸW°©ë-¨Äöåå<U%A[®\ZÛ‘Igñ9O«ÕfÅ×ßîÁ™nZ…–€’Ob¼Ú‚Ov@.7¢#XŠÞí½Ÿ\nyÞèÀPøkP)É[Ócd›vß8\"Ñ·\'\nï7°éÐ9*:Çi)‡ßmlwB¿ ]y„ï¦†©>¡ÛÅªLm6›wjê.˜ R‘{NbžKW\n\n-b\r\nù\"ßn	ñ(­Âå ‘•‹Íaòì¥\rç ¿-ë‡ÙEëp/®i9lº?‹];wˆÂáÃ‡·\'‰£3÷î¹TµLÙSQ1jE°XDª¦ªIuz—³ÂŸWš#ƒ‹•JY˜èŒÙuå­dTd‡â°$å½áÆ÷¯÷!y~é‡ÃqHP¥¡T*y9©ô<þNA˜Ãáp+\r±é§?††´ÏÖ	Ë—³H™@ËéÐZïÂ	û†£[>øò+öÑé§5Y¬5 ÏSðu—læGG©q³|=·¥Y€‡Æe7£_ÍÞü\"ùÇU_¨è×ŠŠµ†,ú±Õj5TÉÖÐ¥úÂTñd±Ô=\r Ö‚Tÿ¶</=\rð\0íY[lT×]3÷ÎÜy?îØã±gÆ™±qh ã0Ä¥‰ÊO›¢å#?U¤¨ù¨úÛ©ü¶\rDJ©Ô¦¡)mš@¥Qy¥!¶PÇ./;vÀø…Ÿ{Œíf<®sf\n¦j¥¶‰*Õò•íñ½çî½ÏÞ{­µÏCçEÿó¬åÿü;\"¹Fd.¤—.vþÀlÖ^,Ê*LÊ¼­ß£`|†áß˜Ësrb,„BN,ŒFEU!/$Ž‰uTCNRAƒ’7˜5áã¼ÁP ƒò\ròeÅl„bø&þ\\šâÙlö§Á`ðõ¥(»wï–ÊQ<(@gb|b¿Ýå¬WMšžHÞÕ÷ìù‘—šÔ³lY½‡\rÎóæ›ÜÑXÔýÈWuÕ\\ƒƒ®öö®Úºz×Ñ£G\\ÄiÊ8ÝU®v·´~ì&F»ËÊË=oüâ\rO(Táíèèðž<qZ_L§õÁ!Þé{P_óøZýàoÞÒ/_îÒ#‘¨¾k×.äB?yê”ÞÜÜ¬Ó\rpmÕuý×¤P6KÔÎe¤0ä¢ M\rçIr$×ûö½*ùmOw7¦ˆ÷™Lªª ‹áÙo?ƒ\'›7âÜùs¨®‰ ‹¤buC£$ù|ýC7ä”óíß½–Î`ÕêUˆS€^»v66Q¬:q•2üƒ?Á†¦õìï“Ì3ŸF PFš–ð380€ŽÎNI2ùÿ\'(„H{CšFeáÍ\'Nh–ÿ¢‹	*wÃ¤i°ÛìÐ4“,7Èlaær²\'¦¬L…4å»Ñ¤2\0w!Ø­—ˆÙ‹Ùb£!‹rà¬*Šd¹Fò“»˜HÕ¨Ê5Eºyeé<!„›(ù3ÌB“Döúµ>ôôt¯Û¶mû\'÷k€6dó\"â˜u»ÍæÀ_;;Æi$æ“‚W#Ã+Ï‰@–IgÉW(ýSrš,34^Ð=7äXy™õ\\^ÉJg…D22\0¢f”B1Ñ(³Ìq‹jF:¿1·ÎXTR|—EðTU•ÏEkëPê/ÁÕîÜjÚ½ÄFAh+ÞÉÕuÝ‡\'Ö®\'¿¿+#X	saQ_9rÕqr~?’é$nE×ÀauaddˆbÃšê0\r(hµÂþäIšÜž¼…ë$Õ>O	œÒ‚ASøzî`jòî¤¡âó»Y2–ÄwÁ€[3ÓðØ]SQ	&ãq{^äÒ÷\nùzç]µ2R3_‹i7†‡$Côø<Œ †™±	Ô-¯#me¤Å–}$/¼ÏZH6Íè1bIîœˆ=D‡jÂbE?yñ‘Ãï£¾¾uËêI3’g\'R	¦Â]¤¼˜ÏéæNdpåêgèºÒ	»æDí²ëg5\Z{Lv§íí©×¯Yž~Çý6*=Q•5eþ€6y›rcvF*°Ûc“°:l²Åžm=ÇÈ$ð—¡¯»ZÀ	;™Ã£M\rêíÇÔì4ÊBAI6ÝT\Z“Ó“¨†á£T-&Ì-¤0::ŽSÇO£aí\Z´¶œ¡ƒvT…+)e¦±õ¹­Ã»¾Ãg7cavA6˜‰‘	Ü‘³ùºhÄÜßw=H£Fî;À(RønòùtLLN ¬$@žÆhÎŠ\"M!mÈ VWƒ@¨\n/]†¿2ˆ&Fehâ&ðÈ®!¢ÔÛ×G]µL¦”ÂíBƒ¤ãw˜J*Þï=lÛþ,ì^\'~öÚkT…PSé”¯„ÑŸŸãBÛYLŒŽÊ3›djƒ}C˜fPÅ3ÂªTƒÃáiôÃû°ô|ÞûÂ¦M›Ÿž†Ê‚Ä¼)n±Å¢È¢šO¤q­û*ü.Lz\03qŠ;*¡Ô8ò4ölGbåQ|Þ×»ÕN	œ¦BJRŒ{™M\n>imcÊ,àÐá#¨¯‹¢‰í6\r#PRÉ–jg—b=x¼…4eÜf¹þñS\'‘ea?õôS;·dê‰n–Ëe·<à\0Å¼¹½½=lTŒhhhø¯ =RUý/ÿ\'	„ËÑÈT‰ÖÖÂÎÖ*NéÆoM¡ãrÆ†‡¥¤N²¥&‡5÷%ÆãØ±clÏI„™Ž_]µ’Xd>PÄZ[[[,‹áâÅK”ß”zL«4ûwU¤š 3,\ZE,’-“2EBAÎXx‰|eáèMha™+V®]Càuèb†@Éæ`m›7-æ²8|â{8í›ÂX©^³&Òô|F…ÕhGÈRŽuŽ\nlÐ‚0åêà-ñr=/M`ó767_ºt±EîÀ–-[^Æ£°iÜÆzvP:þü¥.˜ŒœïìB™ÛsÛç/…Ý`B s±è»>»BÐbgçÉûº@ú›Ã7Y#l¯\n…	Ã£Cø´íÏ}„ä:Ö¶\\\nñQ\\øú‡‚ó`yÛ7q%Þ‹áÄã¾•Ø\ZHbÅx)úm¨†ðäÆ;iz‹\ZFÍ{÷îmŽˆáG:•b.zðÎïß%€-ÂÏ¾®¬@:¹(U¾™Lîrï4ªæSXQ÷þüá¸K<¬Yø~\Z;,¦÷R¢{FjlV04›éÄ]ÄgYÐy¿:ñäŸóC¯6C³ÇR˜?;×‹y¢3éfÒ³8=rKa+Y‰\nS‘ÞŠH,¶^¦ÐŽ;JH~‰DvÞ™›3\nî!rpRp\"«7›I)ŒR±ŽËÔG+VFÜ_ÀôÔmÙ»v©‚‰è=QK¢ÿå‡Š3¢5ÏÍÉÉ3}Ìõ¶á6˜ŸöÁìP0üJ7„G™EÖ‰ÂALFêy¡å›+Vã[å¸úúy8ìŽL\"±ðcÖÖCWW—…$©šÔóÁjÖ„ƒ¿þ3ˆâøG…\'‚A§•™™óÔÔ”…ŒÒÌ4UÚ·s¸Fsjë¼P]¤3$“=óˆFûÞ„,Ê?ÄID£9^2•ÇK´¯½BGû¸toYYÙðRYo|XgÿþýêÑ£Gm.¦‡“ÌWšVÛ_Žé–åYÖÁÇâOÉcø|ðj’Ü	²0šñr\"ýé÷_:×T\\2÷÷ëÑÄ†‚R”ÖÊËQ¼´âDÀPU¡~×è6=“ôjþ¸ˆlÕ¯ä²1Knl…#÷Ö«â»yßbqzðÀNQÜPEG´âHÃ\\üÌ¸$²Ù%#ŽTÑðì?›H|Üû¨h´aÉU$5÷®ÜÒˆ©<Ì¯¿¦‘1‹¦6Uð\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(36,'sys','quickAccess_searchAds.png','image/png',5353,'2013-12-14 18:15:36',5353,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0‹IDATxÚbüÿÿ?6À\"®\\¾r—‰•‰õÏ/fff–ß~3;zTéÇÏßÜ¼\\ììÜœ,l¬l;vì`Ð5tgààe`˜ÔUÏ À\'ÈÀ6•¹ÁÐ1€A€ƒAJ\\”A\\L\nbÑÿ™2ÿ\n\n¤aƒa€\0bÄéªsçÎ–°±sä2þc`áäãþÉÁÊúOJJZ……«ûÐáýLll,¬¬@§²°f1Þ¹wïÿ½×2¦:¬3\'w\0-ddÈ/Èg`yûú\rƒ¤’\"ÃÕ÷<<¼j\ZZ\'Ožú:MûÕ÷Û·Ù³³³µ]@8]…°üýû‡áÔÉÓïŸ¿z)0Þ<yyy~>>†K—/3èêêÝ1ðãÇaaaÌ,@3||ÿ^@R^áåó~á¿þþcØ¿k#ƒ­\rÃçïß¾~ùÊpãê5.®oŒà‚œì,†Æži@µppÿòq†‡0œ:u’…‰™aåÊ•ŒQQQ\"ììì¯.œfx—Êà›˜4áÉÕÓsgNðë×wf6v`X®ÑšùšÌÿ~lž\n2@9Õ¼2ÆñÏïy~fÌül»£™‰Ÿ¼”ƒ—r@J9iR.‹HyÉÿà°ã$”ÛÆE#Í¢„¬v ”·CfóÄ˜ýöx¶]äÄSŸãçû}>/ß»DðÏ\'s®áììü\n§’D‰D@(!\\ˆÔD5J	\'4S;X­Ö\n9‘ø‚NŸ_öüüˆÙ™ŒŒŽ¢PQ‹F¡(…\"óž…Ibìëþ\r{eÈ“Ä@ã Bšœ+èJIPëjQm·K$°ö*\r:a4ä¡£½5j\"Ñ\Zë›`2[pt¸‡Í–m2›§•–—ÑÖ9\0£¥æÒZ´t\rcbbw—7èîîÅq0˜ýR(Š«ªª¿ùÕåf½Ø¾JÃø¼>°÷7|~¼Ãïß”Ò9pÆŽO‚09ZaÉ†!× {8AŠÊÈË!`,ŽµUï‚ìv»S{»;dlr\náÛ+W–Cÿ–ÄÊÜbbp9“pR´ÚX`xÁ¾Óià]ü´ßö”>—ËÕüó`~A°¯{øA“ùKÒø€Öjéi\"ŠÂß”RJSËÃ:˜P\nh4ˆÄD,j‹.ˆ .\\P\\ÄþŸ.ÁÄÔbL€¬ÀÆ°Ð€‘ HP ÈÃªIKÓB_¶Ó÷t®§cÂÂh\"‰ÞÉ™ÅÌ½÷Ü9ç{Ì¶±´Ý¡ÀrIÊ`vvv~Íñ•µY­lõ³ƒµž9Ë|Ábö%f6›Ù§¥U604ÈnÞ¸ÅúŸö3j){;9Í\\nëêºÏ,–&ÖÕÝÍ‚¡ÐVY¸T*…tZ$B,2ŠvêH’ó Rå ËŒ¬Þ¥iŽ(‰Ðäç#ž‘E3Q)&\"—S{8Â’DÏ•ÔÝ8ºFGF\Z­Öö)RV•œÉ¹îE,*ÐJ	±¸\0!,aîÃœœÜ·¹žç	òõàõzÂÜ;z—F±®É(mNI|?Bá ¨…¶ 0Ë¶:Ùiž›´i$\Z¢ÓÆð°÷1öÖ™Á×œGãÑ|ˆÄfú»—!òe)q*žD”óýô4Z;qÆÊ\n7ÀétÂÔp¤vËÊ<Ï3CEPVúžžh»|JuY&…c€›¢„ä”¸Nd-Cb_\'\\ëp8¾á¤åt%;0>1¯k/l6´_hGkK‹,Àò-KËË+\\\\Ð×ßë¥Û(¬®A\"AÊ‘¦I™Ÿ%ú’ÃJèÎ×ØU¾‡tL<U®—Œ(R¯ba•UFX,æ&…ÑhT©ÕjN \Z.-¯ ¹ù4ÆÇžøÁë€Ý¥$z Œ‚/£ž‹@\"²\0_0Œ<¥Š<$‰\r¿ŸÊÓåF’|D¤†/Úq¥£ãg·ÛÕ@ %×—Þ¹®¿Û©y3Y\nÛË1[ŽZm1VUku¥z9M(Ñ1“É4õ\'ÜËìå¸l„è¯Á†^²™«û½líËÚÉLCŽ¯Ðü\r‰~\'\r¿†2´¹þâWWƒãÓþUà_2ù‡\0ÜWëoSeÿî´§—ÓËÊ¶nŒéØ\nÝè²Šel01cÌ”K‚#øÅ$1Aÿ	10>øÉƒl3ñŒ1\'¹8Iœ@»¹±u+íF·uí9þÞS~0:>j“ÓÓ¦ïyŸ§Ïûü.Ïÿ„‹þÓdqÄ~ëûõžÙb9À\n ´‰8„—%×L’¤Ky’.K²aµåéZ ?[’H‚…D\"›Í---ý4€Ü¡sÅé¨œ™NáêW091p8L;iÃ­_zÅ( ¸77!{€3]¨®©,Eóëoàþý~lnjÂèèè.6X²¤aAÇÆ¢ŽãÇáv_2„|0Ä¦¦(_Yºð:ã¡U¼ôý2æ\Z76ÐŽßBcÃ$i[Š‹Ð™ÈÍÞ^ñ=ò¸M´t~sv]MMè\'Ùj…?ß+m¥àvù÷3|†	33Óköœµ[ O²Ê²ùÛ\"µP;\rÒ¯VK9SË\ZÙòäÝ?÷ÞDâá4³×DéÍ²Ø,VXè)²”«ÌõºI^¤o’é¡Ä @áÙÌÑa:lv&Ãuv‘HäÉ!•:ÛÕUY¿1¬([Éñ1¸<n\r!J,¤Ÿ*_YŽª«‘JÎØHtªƒhêq²ó° ˜taŽåÎ ¨¨è	’ÅÛµë×5›bS„ýKÆ’(()@ë—\'PVQ‡Mõ½eµd(4WY.ƒ¥Ð0ˆymž\r¢›çw“6~ðn»öìÆ‹löö6iÏž7s‚(*V††û‘™ÓðˆšpþÂ9ø·áÙHšÜœÂCš–Ô-¨X6„o»»qµçK“BÕª5hÚºûö¾…AŒŒæ2—¤RÞFM -[æG  ·\'[Oâ•Ýï¢¼1/…F\'>ä%Í+ËP¼•¨z.‡×…©d‚ŽÄ@*•Ä©ŽÓ¸}¯/_4¨ªç½ÇHv²+´´Æé$ŽÊÊJÄã>K¹Ä¾»\'è	8üá™ªzba/oiBm]>_>3NŸêDåê ÇŠŒ°BÍæ!óe£iGhm7èq\r›ÕÏ[Ì\rÂ¥¿À¾€W&\rÄÓ,§\\fuím­˜ˆM±MÄ‚ŽŽÔ®­ -5Ð+¿$>üÐÓƒèÝ;K\ZÑ$3ž§00s=cÂÁŒ¤|ª.À¯èp»ÝˆÔGÐ¸a=I…íL;‘eWi‹i¸Øª’@¾Y¢æææC\ZÕ]á,°cçNLOþŽÙy\rNj\Z‹å>–ˆK¾\\Éâ<ìü<ù$¦˜KiÆ½þÄÆ\'›|€‘áúñTŽMC¡PÃìì,Šƒ­Õn¶ä•Ž6¨´,z2ƒw//·’39Auùü·¨Y³–ÿÆ™Eä#7œªÊóTiwlp_f7<xðDAaáÞa‚ª†Ê»zjß~Ñ±¶¾¶ªÝj.LóL¦Äèµ.twŸ3í‰,s\Z’dXË,í†l•‘M“;Þ›‰Ç§ò¥žžž*ZÀíúÑ#Û\Z>vm¿õè#œûäHrÈíé_^RRWRV.9]*7I±ÏÆ9á÷ûçþÍ°yzÀwBù-g|®ÃÚ]†q¦ÎÐZ*Œî’Â}bâˆr„ß¿ÝÖ·´´øþa2ù»ËÔ\Z´¹¬‡æ£Ü¼3lÌv_)øàë%ªÕRl—^53ŸýP5>ãæŸ?….)@ë\ZõBì}Õ8fÇ¡cO©·K	ð‡\0íYkl“ç=Ÿãk|IlÇNâ\\\Z P.ÍÆ–Ð•@ƒJÇ:V4\Zh«iÚ~lê¶j·Òiš¦ý´Mê´^øÑvU ¶M‹ÊehZm rc%HâÄ‰\'v|ÿ¼ó¼VÔ“6*mÓ,}ñ%Ÿ_?Ïó>—sÎû‰ã¢ÿzÔòþ×0Þ.]R\rúÿhw8º Uš#G~‹Ý_z‚-¹ ðgÏžÅ§>M”§t¢D×8 x+1’`Ó	²L˜Jæg]]µz6˜	iÌd¸+‘S·hjÊ$ÓÀ3Üœ/7PW[{ÇP6¦’É×kjjö}Ì5²jžæó…û4J@ó[‡ÃÆ©ö‹_ýÝÝ{qýú8Þíû+&&\'¤Õ¶âùç§Ó…ööv\Z\\‹‹„FííjñgŸý6öîíÆ8ÇŒ¤T7—;vìPÊ§Ü+#H>«\rÕ=N§û÷ïÇ¡C‡Ô=¢–îÜ¹“vØF7Ñ»ÙY–ÐU¡y]GïŸzN—3â¯”HT\'ihqµÙ¢üT†È£µµU-.?&ÌóµH´*´ü#`SÞÇ¢óêþZ:væÌ´®)~O$D¹/6_\\ãâÄçÐõâýŒ¼|VË5dýÖÖ5œ™fë7¯_¯§C7îì€D_`™Àh¾Úç,¯(±šˆ%Ì\Z’‰%\\¾8€D\"É)nC2—$ì°¡÷x/‚L8¼G‡G±uë#ðy¼ÐE™4¸ÝLM¡åÛØwÛç:™†ü¬Â«ü”lñUT\n5á÷·’c\"4…2FZˆ†€´È\\s)!¼\"•Z-†d2¹^T¡»RHÁ6^“©Ãf1¡… ‡uõ\rjwD”Õäi%FX`ñ½/P‰U„-B©ÆÇo CØ®ç…ÝiJÀ2\Zh*¿cg\ZJ\n0F\nÁ‰h¥®)Þ\'õà!Ô÷Uùi†Îš)QŠ‹A‹Ì#AäÝ@{‡wq•cwÕìöãÔ©Óy|•\ns!<Fm}£<u5ß‡Rœ…0re”Ö£ŠN”»Ý°Úì*jz>Ë.BDdù|ÃÆ1C®x¸ç|•~”—;¡k¶â8;×\r*qM§±EU[«“Ó“˜¾9ƒâfòÍ¶¶¶\",®ð~þcE,žžž†\nO…ßÂŽ!r?óµ”¸¬ÀT\nÖ12šo¼vQNÂå©Åö|A²Àj5Âb1½ ºOžé˜f*å³Ø-Œ]b±^VL®>@ŽQ8ß5¬£—^}NŽa×ã_À÷ìFÿŸûaqÈYŒ	õËïÃªV#:7§CñbUMµó7o¾Yöäž=ñ»àN´ù|~-2;‡¹XHäau’Æ0¥zzÑ ,Üþf²ïNdP…4“ ”Ó›h\\9©ç‚jfâ„Dà˜Š5[ðHÍr²ù1?~Ë››‘XŠãG!P@s}#šêêñòëo º¦¹BvCR¹4æægQ˜Ës\'Ëq|¸©i9~¿©¾‰Ë÷ÞåÀ»çúöìxì1’¶ÚXñžF/»H¿ûm¤qìýÊ7°˜tÂêª c\'£›#Ÿ#Øv’/ÄÉÈQà1ÐVœŽqBbÿ_j7±óñ^´;·áwGc÷—»ú®t{‘¡¡ÒD:·?ŒPh\'ŽŸÂblžä¸nŒµcG×ÖmJKmZÞHŽn&ô|ÿ¶w&ñgÚ6m‘XŒG‘L§q“¹7K`dhNoÉ2Ö\nŒÍ‹Ü Z<A²9<ÉÝ£ÑQ¾Žð³©p1ò2Ë˜Ò`#ÉÂŽf² ^À&2­s}}°š¬È)ÙÀÀèŽ‘ñN!<\"ån ar“¿{¨¬F™­TÍžƒ¯D˜©d&ï^qW\røýþÀÆ¶í\"kû}µˆ.F`ÔL¸zmËkŠÎ™ÈžÊØ¾]\"Ï2mÌù\"%”LMÛbB/RDi.¬aÈÌ±³#g¸cîTšãZøÎ0›Â‰§Øarª3‰$/j·´B4éLBÐä…],ÃÎ6žÅ¹sïcÛ¶mèhß\\åt8±……åÀæŽÍÝþÊÊÃla!Jò›e‹Ë`íÆõè;{™¥(\"‰0<ÆÊä€T“?ç•×‹ZŽª\n‘<\nÕ]UG•©±Òm‰;6‰®íÛÑ¼b5C–ÎePá*W\'>Y¦““9)úEŽ;žç¢.2Éx‰9™&§–Ý\nÖÖ\ZÞ²åëü…Ÿ«ztÇ£ÏÈs‚¹çð\nÖáóûðNïI”Ú¬¸qíCô9©º	k\ZvÑ¾…Ö\nw&wò*[öktÞÒŠ?	]Vˆabä=îV+šV2òˆøU`4b,¢›‚›-TÄ²§)[sšt6Í\"gx¶pr„h]»v«J¡uëÖ¹È‘¡éiEÈçH—D6EÐ`ªdaMxGO£÷Æ Ö·w¢ÊW®\n¨¬ˆ?~…ßÔ%ŠÏ|8dtW.çÚShiYÍ2¤Š1ÍuÍ3¿šS\">ß¨C™ºr*£òˆ˜&•JªmÍåt¥WÆã	™G\r6l0hðˆ&ÈýT$i›™™q,E£¦B7ÍOl°[*ŸyZ‹86!Îtè?žðáaCå^¸«\ZØ&±Œ`N”\ryä82É8²‹³ˆÏMb|l¬Ðá|nvf–MW2NÊV”YÉ³‚Vl#šÒgù¹²…¼ü£ ØUUTPÕd4êœè9×õy½§­Vëk¼„R\ZS©”5N;/]r}ç›»½mú·î{n•Ëæb¬€ù³ÈMZ0þÂÁw\Z^üõBvÇŽ]=;;×NÃ[¸p%Ÿ-šÁPÐóúb:“7\Zï¯\\¹òLggç¤Ýn×ÿ]Ü‹úUò„!Ü¥EfNJ;Pl$VW™ù«Íûš~¶â{-n‹Îžx…­åÚ4Rcó>™ŒŒõë?¦//±3OÞZ´««KMLFB]‚o(Ô‹XG¤ bÐ¿JÀîD;è0ï]ÕÝôâšï¶¸lbøßBÀXÉñyœL…G.äÍáâÊôÓ÷IÝ+1Á˜+-©+o4.³]½Jã\'±t-†³\'S3—ò?Íâe/\rî?˜Rjüó°Âí0ìâÐ	Fæô¿„³x‹s\'õÂ\'øÃ÷jþz’\'&veÝ\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0‹IDATxÚbüÿÿ?6À\"®\\¾r—‰•‰õÏ/fff–ß~3;zTéÇÏßÜ¼\\ììÜœ,l¬l;vì`Ð5tgààe`˜ÔUÏ À\'ÈÀ6•¹ÁÐ1€A€ƒAJ\\”A\\L\nbÑÿ™2ÿ\n\n¤aƒa€\0bÄéªsçÎ–°±sä2þc`áäãþÉÁÊúOJJZ……«ûÐáýLll,¬¬@§²°f1Þ¹wïÿ½×2¦:¬3\'w\0-ddÈ/Èg`yûú\rƒ¤’\"ÃÕ÷<<¼j\ZZ\'Ožú:MûÕ÷Û·Ù³³³µ]@8]…°üýû‡áÔÉÓïŸ¿z)0Þ<yyy~>>†K—/3èêêÝ1ðãÇaaaÌ,@3||ÿ^@R^áåó~á¿þþcØ¿k#ƒ­\rÃçïß¾~ùÊpãê5.®oŒà‚œì,†Æži@µppÿòq†‡0œ:u’…‰™aåÊ•ŒQQQ\"ììì¯.œfx—Êà›˜4áÉÕÓsgNðë×wf6v`X®ÑšùšÌÿ~lž\n2@9Õ¼2ÆñÏïy~fÌül»£™‰Ÿ¼”ƒ—r@J9iR.‹HyÉÿà°ã$”ÛÆE#Í¢„¬v ”·CfóÄ˜ýöx¶]äÄSŸãçû}>/ß»DðÏ\'s®áììü\n§’D‰D@(!\\ˆÔD5J	\'4S;X­Ö\n9‘ø‚NŸ_öüüˆÙ™ŒŒŽ¢PQ‹F¡(…\"óž…Ibìëþ\r{eÈ“Ä@ã Bšœ+èJIPëjQm·K$°ö*\r:a4ä¡£½5j\"Ñ\Zë›`2[pt¸‡Í–m2›§•–—ÑÖ9\0£¥æÒZ´t\rcbbw—7èîîÅq0˜ýR(Š«ªª¿ùÕåf½Ø¾JÃø¼>°÷7|~¼Ãïß”Ò9pÆŽO‚09ZaÉ†!× {8AŠÊÈË!`,ŽµUï‚ìv»S{»;dlr\náÛ+W–Cÿ–ÄÊÜbbp9“pR´ÚX`xÁ¾Óià]ü´ßö”>—ËÕüó`~A°¯{øA“ùKÒø€Öjéi\"ŠÂß”RJSËÃ:˜P\nh4ˆÄD,j‹.ˆ .\\P\\ÄþŸ.ÁÄÔbL€¬ÀÆ°Ð€‘ HP ÈÃªIKÓB_¶Ó÷t®§cÂÂh\"‰ÞÉ™ÅÌ½÷Ü9ç{Ì¶±´Ý¡ÀrIÊ`vvv~Íñ•µY­lõ³ƒµž9Ë|Ábö%f6›Ù§¥U604ÈnÞ¸ÅúŸö3j){;9Í\\nëêºÏ,–&ÖÕÝÍ‚¡ÐVY¸T*…tZ$B,2ŠvêH’ó Rå ËŒ¬Þ¥iŽ(‰Ðäç#ž‘E3Q)&\"—S{8Â’DÏ•ÔÝ8ºFGF\Z­Öö)RV•œÉ¹îE,*ÐJ	±¸\0!,aîÃœœÜ·¹žç	òõàõzÂÜ;z—F±®É(mNI|?Bá ¨…¶ 0Ë¶:Ùiž›´i$\Z¢ÓÆð°÷1öÖ™Á×œGãÑ|ˆÄfú»—!òe)q*žD”óýô4Z;qÆÊ\n7ÀétÂÔp¤vËÊ<Ï3CEPVúžžh»|JuY&…c€›¢„ä”¸Nd-Cb_\'\\ëp8¾á¤åt%;0>1¯k/l6´_hGkK‹,Àò-KËË+\\\\Ð×ßë¥Û(¬®A\"AÊ‘¦I™Ÿ%ú’ÃJèÎ×ØU¾‡tL<U®—Œ(R¯ba•UFX,æ&…ÑhT©ÕjN \Z.-¯ ¹ù4ÆÇžøÁë€Ý¥$z Œ‚/£ž‹@\"²\0_0Œ<¥Š<$‰\r¿ŸÊÓåF’|D¤†/Úq¥£ãg·ÛÕ@ %×—Þ¹®¿Û©y3Y\nÛË1[ŽZm1VUku¥z9M(Ñ1“É4õ\'ÜËìå¸l„è¯Á†^²™«û½líËÚÉLCŽ¯Ðü\r‰~\'\r¿†2´¹þâWWƒãÓþUà_2ù‡\0ÜWëoSeÿî´§—ÓËÊ¶nŒéØ\nÝè²Šel01cÌ”K‚#øÅ$1Aÿ	10>øÉƒl3ñŒ1\'¹8Iœ@»¹±u+íF·uí9þÞS~0:>j“ÓÓ¦ïyŸ§Ïûü.Ïÿ„‹þÓdqÄ~ëûõžÙb9À\n ´‰8„—%×L’¤Ky’.K²aµåéZ ?[’H‚…D\"›Í---ý4€Ü¡sÅé¨œ™NáêW091p8L;iÃ­_zÅ( ¸77!{€3]¨®©,Eóëoàþý~lnjÂèèè.6X²¤aAÇÆ¢ŽãÇáv_2„|0Ä¦¦(_Yºð:ã¡U¼ôý2æ\Z76ÐŽßBcÃ$i[Š‹Ð™ÈÍÞ^ñ=ò¸M´t~sv]MMè\'Ùj…?ß+m¥àvù÷3|†	33Óköœµ[ O²Ê²ùÛ\"µP;\rÒ¯VK9SË\ZÙòäÝ?÷ÞDâá4³×DéÍ²Ø,VXè)²”«ÌõºI^¤o’é¡Ä @áÙÌÑa:lv&Ãuv‘HäÉ!•:ÛÕUY¿1¬([Éñ1¸<n\r!J,¤Ÿ*_YŽª«‘JÎØHtªƒhêq²ó° ˜taŽåÎ ¨¨è	’ÅÛµë×5›bS„ýKÆ’(()@ë—\'PVQ‡Mõ½eµd(4WY.ƒ¥Ð0ˆymž\r¢›çw“6~ðn»öìÆ‹löö6iÏž7s‚(*V††û‘™ÓðˆšpþÂ9ø·áÙHšÜœÂCš–Ô-¨X6„o»»qµçK“BÕª5hÚºûö¾…AŒŒæ2—¤RÞFM -[æG  ·\'[Oâ•Ýï¢¼1/…F\'>ä%Í+ËP¼•¨z.‡×…©d‚ŽÄ@*•Ä©ŽÓ¸}¯/_4¨ªç½ÇHv²+´´Æé$ŽÊÊJÄã>K¹Ä¾»\'è	8üá™ªzba/oiBm]>_>3NŸêDåê ÇŠŒ°BÍæ!óe£iGhm7èq\r›ÕÏ[Ì\rÂ¥¿À¾€W&\rÄÓ,§\\fuím­˜ˆM±MÄ‚ŽŽÔ®­ -5Ð+¿$>üÐÓƒèÝ;K\ZÑ$3ž§00s=cÂÁŒ¤|ª.À¯èp»ÝˆÔGÐ¸a=I…íL;‘eWi‹i¸Øª’@¾Y¢æææC\ZÕ]á,°cçNLOþŽÙy\rNj\Z‹å>–ˆK¾\\Éâ<ìü<ù$¦˜KiÆ½þÄÆ\'›|€‘áúñTŽMC¡PÃìì,Šƒ­Õn¶ä•Ž6¨´,z2ƒw//·’39Auùü·¨Y³–ÿÆ™Eä#7œªÊóTiwlp_f7<xðDAaáÞa‚ª†Ê»zjß~Ñ±¶¾¶ªÝj.LóL¦Äèµ.twŸ3í‰,s\Z’dXË,í†l•‘M“;Þ›‰Ç§ò¥žžž*ZÀíúÑ#Û\Z>vm¿õè#œûäHrÈíé_^RRWRV.9]*7I±ÏÆ9á÷ûçþÍ°yzÀwBù-g|®ÃÚ]†q¦ÎÐZ*Œî’Â}bâˆr„ß¿ÝÖ·´´øþa2ù»ËÔ\Z´¹¬‡æ£Ü¼3lÌv_)øàë%ªÕRl—^53ŸýP5>ãæŸ?….)@ë\ZõBì}Õ8fÇ¡cO©·K	ð‡\0íYkl“ç=Ÿãk|IlÇNâ\\\Z P.ÍÆ–Ð•@ƒJÇ:V4\Zh«iÚ~lê¶j·Òiš¦ý´Mê´^øÑvU ¶M‹ÊehZm rc%HâÄ‰\'v|ÿ¼ó¼VÔ“6*mÓ,}ñ%Ÿ_?Ïó>—sÎû‰ã¢ÿzÔòþ×0Þ.]R\rúÿhw8º Uš#G~‹Ý_z‚-¹ ðgÏžÅ§>M”§t¢D×8 x+1’`Ó	²L˜Jæg]]µz6˜	iÌd¸+‘S·hjÊ$ÓÀ3Üœ/7PW[{ÇP6¦’É×kjjö}Ì5²jžæó…û4J@ó[‡ÃÆ©ö‹_ýÝÝ{qýú8Þíû+&&\'¤Õ¶âùç§Ó…ööv\Z\\‹‹„FííjñgŸý6öîíÆ8ÇŒ¤T7—;vìPÊ§Ü+#H>«\rÕ=N§û÷ïÇ¡C‡Ô=¢–îÜ¹“vØF7Ñ»ÙY–ÐU¡y]GïŸzN—3â¯”HT\'ihqµÙ¢üT†È£µµU-.?&ÌóµH´*´ü#`SÞÇ¢óêþZ:væÌ´®)~O$D¹/6_\\ãâÄçÐõâýŒ¼|VË5dýÖÖ5œ™fë7¯_¯§C7îì€D_`™Àh¾Úç,¯(±šˆ%Ì\Z’‰%\\¾8€D\"É)nC2—$ì°¡÷x/‚L8¼G‡G±uë#ðy¼ÐE™4¸ÝLM¡åÛØwÛç:™†ü¬Â«ü”lñUT\n5á÷·’c\"4…2FZˆ†€´È\\s)!¼\"•Z-†d2¹^T¡»RHÁ6^“©Ãf1¡… ‡uõ\rjwD”Õäi%FX`ñ½/P‰U„-B©ÆÇo CØ®ç…ÝiJÀ2\Zh*¿cg\ZJ\n0F\nÁ‰h¥®)Þ\'õà!Ô÷Uùi†Îš)QŠ‹A‹Ì#AäÝ@{‡wq•cwÕìöãÔ©Óy|•\ns!<Fm}£<u5ß‡Rœ…0re”Ö£ŠN”»Ý°Úì*jz>Ë.BDdù|ÃÆ1C®x¸ç|•~”—;¡k¶â8;×\r*qM§±EU[«“Ó“˜¾9ƒâfòÍ¶¶¶\",®ð~þcE,žžž†\nO…ßÂŽ!r?óµ”¸¬ÀT\nÖ12šo¼vQNÂå©Åö|A²Àj5Âb1½ ºOžé˜f*å³Ø-Œ]b±^VL®>@ŽQ8ß5¬£—^}NŽa×ã_À÷ìFÿŸûaqÈYŒ	õËïÃªV#:7§CñbUMµó7o¾Yöäž=ñ»àN´ù|~-2;‡¹XHäau’Æ0¥zzÑ ,Üþf²ïNdP…4“ ”Ó›h\\9©ç‚jfâ„Dà˜Š5[ðHÍr²ù1?~Ë››‘XŠãG!P@s}#šêêñòëo º¦¹BvCR¹4æægQ˜Ës\'Ëq|¸©i9~¿©¾‰Ë÷ÞåÀ»çúöìxì1’¶ÚXñžF/»H¿ûm¤qìýÊ7°˜tÂêª c\'£›#Ÿ#Øv’/ÄÉÈQà1ÐVœŽqBbÿ_j7±óñ^´;·áwGc÷—»ú®t{‘¡¡ÒD:·?ŒPh\'ŽŸÂblžä¸nŒµcG×ÖmJKmZÞHŽn&ô|ÿ¶w&ñgÚ6m‘XŒG‘L§q“¹7K`dhNoÉ2Ö\nŒÍ‹Ü Z<A²9<ÉÝ£ÑQ¾Žð³©p1ò2Ë˜Ò`#ÉÂŽf² ^À&2­s}}°š¬È)ÙÀÀèŽ‘ñN!<\"ån ar“¿{¨¬F™­TÍžƒ¯D˜©d&ï^qW\røýþÀÆ¶í\"kû}µˆ.F`ÔL¸zmËkŠÎ™ÈžÊØ¾]\"Ï2mÌù\"%”LMÛbB/RDi.¬aÈÌ±³#g¸cîTšãZøÎ0›Â‰§Øarª3‰$/j·´B4éLBÐä…],ÃÎ6žÅ¹sïcÛ¶mèhß\\åt8±……åÀæŽÍÝþÊÊÃla!Jò›e‹Ë`íÆõè;{™¥(\"‰0<ÆÊä€T“?ç•×‹ZŽª\n‘<\nÕ]UG•©±Òm‰;6‰®íÛÑ¼b5C–ÎePá*W\'>Y¦““9)úEŽ;žç¢.2Éx‰9™&§–Ý\nÖÖ\ZÞ²åëü…Ÿ«ztÇ£ÏÈs‚¹çð\nÖáóûðNïI”Ú¬¸qíCô9©º	k\ZvÑ¾…Ö\nw&wò*[öktÞÒŠ?	]Vˆabä=îV+šV2òˆøU`4b,¢›‚›-TÄ²§)[sšt6Í\"gx¶pr„h]»v«J¡uëÖ¹È‘¡éiEÈçH—D6EÐ`ªdaMxGO£÷Æ Ö·w¢ÊW®\n¨¬ˆ?~…ßÔ%ŠÏ|8dtW.çÚShiYÍ2¤Š1ÍuÍ3¿šS\">ß¨C™ºr*£òˆ˜&•JªmÍåt¥WÆã	™G\r6l0hðˆ&ÈýT$i›™™q,E£¦B7ÍOl°[*ŸyZ‹86!Îtè?žðáaCå^¸«\ZØ&±Œ`N”\ryä82É8²‹³ˆÏMb|l¬Ðá|nvf–MW2NÊV”YÉ³‚Vl#šÒgù¹²…¼ü£ ØUUTPÕd4êœè9×õy½§­Vëk¼„R\ZS©”5N;/]r}ç›»½mú·î{n•Ëæb¬€ù³ÈMZ0þÂÁw\Z^üõBvÇŽ]=;;×NÃ[¸p%Ÿ-šÁPÐóúb:“7\Zï¯\\¹òLggç¤Ýn×ÿ]Ü‹úUò„!Ü¥EfNJ;Pl$VW™ù«Íûš~¶â{-n‹Îžx…­åÚ4Rcó>™ŒŒõë?¦//±3OÞZ´««KMLFB]‚o(Ô‹XG¤ bÐ¿JÀîD;è0ï]ÕÝôâšï¶¸lbøßBÀXÉñyœL…G.äÍáâÊôÓ÷IÝ+1Á˜+-©+o4.³]½Jã\'±t-†³\'S3—ò?Íâe/\rî?˜Rjüó°Âí0ìâÐ	Fæô¿„³x‹s\'õÂ\'øÃ÷jþz’\'&veÝ\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(37,'sys','quickAccess_searchMembers.png','image/png',7460,'2013-12-14 18:15:36',7460,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0fiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c061 64.140949, 2010/12/07-10:57:01        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\" xmpMM:DocumentID=\"xmp.did:13B7B8F2910611E0805AC0C5CCB6C632\" xmpMM:InstanceID=\"xmp.iid:13B7B8F1910611E0805AC0C5CCB6C632\" xmp:CreatorTool=\"Adobe Photoshop CS5.1 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:6E5F0BFC0491E011AF35AEC708FB1C4A\" stRef:documentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>…Üu]\0\0TIDATxÚbüÿÿ?N°yóf†ø¤Ôÿ-­í&01F!­aÈ°ºÄõ?\'óõïÿþhþcûÏ’xqû’Ò\'Ó/ÙDùö2œ8zùHÂ6²õ®¨¸(ƒƒô­+ç*Í¢¼9¡ÿgÊüOšùîŸKx½ãÿûþÿ­/þ@Œx]ô?¯°ø²ØrO5F#FÉ¿îÇ¤9->}üÂ–øæ0‰á¹Ç…\'æü?¿3¼ÿ÷™©tó¿VzRÿÙyþ*ÿúýö	ƒÀé?ŽŒ‡ÓlþO18È ðÿøß¶OÛ˜E„ÿí:ð €a–egg3üøñCSPPp·ºšš™™é=}C‡Â5ØÙÙ©¾zûþÖÆÆA%]†ßžï_¼k³‘ª²¿¸¨ƒ  ?£¶}-BDx[ÿµò­`âäcx}oÛXkuÆŸßŸ<{Æpúå­¿ÞcûNÊgÅB+ƒq>%S¾~zËð]ˆAXÝ”ÿéïŒÛ•1üdûÃÀÊÅú——›ƒñàå¥±ó#¾·]Mcxë¥Çà•ÇÀô÷Ã›{—,/îg`É(cø¿u)Ãÿ»÷/]ûÃ°FShæÿi2ÿÅÌ:üDœ&;ƒlLiÜÀsæ±´”oÿK2þÿùýÂH÷?@\0á;,\0îé´´4 æºº:ßÄÅÄ¥¤$líì14€=mccÃð÷ïß@ÌxëÎ}†«×oýåÉýÇjƒƒƒÓ»wïþ.*õaÑ±`øÿïßße›W²rrþý§(\'Æ ,$0AHP PÁ¬„ì¹Çÿ“àcfxüê-Ã³ëg^ß½Ì ÀÄúßUËìß±3ç^¿~WpèÜU°\r`\rwïÞe0’çbú,aË°áµÃ\'_æ†ù‡Y¸Åä˜\",½¹Èðíó—Ëp?(ûOc”4ûû]Í•ÁFŸá+ÿÛ%ë>»~¢‡áË·o\\Ÿ™>}üô¬AÜmcisêßO2¼ÿÁÈðá\'0]3³ó°¼}pâØŸYþþçþúÍÄfæ·nøòõ—$›ðç}V&ÂÜB\\L¬ÿþ2¤qþa½öò&C¾¾ƒáËÿ\rª<¼ML5FÜ_¿üb°Õbxñäƒ÷?ÖÿÎ)æZ{÷CVùln>nFQ~^¡OŸŽ°ð±ýü·\'$˜édÃ[†ÅÎÇ.ßºþÿÈC~Æ–wo~ÉÈÿÿ·ÐŸþ±%ƒ%0Qùþ?bÆò^Èke,¯I©0r$-Ï®}_”þÿvâŸÿ>.ÿÛ„…æ\0 ¬ZCÛ*Ãðó“ËéINÒ&f½$âÖ%M¨„â6dëœ(N­nèÝ-‚?JµÅ	**”ùc^/XÄ‰âÕ9ÚNç*s5N,ZïÊì\\Ú¥kÚ$Í’¬éÉ¹}Ÿ_”ŠHý±÷ç÷ã}Ÿ÷}.ßŠz©Êd™ÔÞÞ^$\'I?<t—Zä¿}}}!äm.«»ªò’e™x…Õ××‹Ñh¢Íæ\r55–Â-ÑKÐÓÓƒ±±1Åï÷—(¥¸óúVìºiœvÔ&ñævº45ÑiÚÜG¾NOÒB©Ìe©ÀëqAv¹¡©KB¹¬Ò[ïø§§ðï£££¤8Ÿvg²9ˆ–Š\rÍuÈÌ¦ŸŸƒÅ£PgÓÜÁgž=<|ÿ©ñ3Z6W¢†n2njhæ«õª€ÿä±’ÿ=Q44ÍèÞ³#úªKñ‰%S‚ û 	‚nfÙéâG7?ôfgúÄë‹b]°†;M€ºˆùäiNœ@41§“ÓçÙ÷)%+Ý­}Sû;]}]¶à5hKl‚@0•¦(ØLéì‡âÕÒ¹†*?”~IU‘-Íå‘FÁr¹jŠ3çÎûŸ~müo¯-Wàº6ÆÉ¯â·CŽ¯ƒS¤˜ÌÂtÔZ¢Û‘6 ek—çt~„˜¿ã¡DQæ~dL@²’eYâ)cí®õy«à™ÍÛÑÐÓ­{÷ö|wtŒŠò·÷!Ü\ZF$äGY§0\rQÑ-ÑN’EWFü35©Ë]Ãƒ“51 ˆv§\r«]¬J)‰|¥òY¡Âð¶­ì¯u¿[¤ßœQÐà%Ä/©M?‰-]#tYª\'ìŒ£TÁDºÉ7Êÿ:r€:e;quì&s©ßÑvq®Š\n,\\\0Ëä°˜šÅûÉ”Ó&Ý7nÙ ¡/5ìŸ»kû»ðÅ©õØÿÆÇh`?\"²¦	¾@D®·\\&ƒD¶­ÃŒ6†È\'e‹lÇ°ö×çš#Õx4é:ˆaÀÅ}³ihäeðª{â™Í]¡àø÷øü=OlMRI‘‰CaZÎÊY}4ýÀ‹î¸v½0ÏœŽ[šCj ÖFW7Ç=Ï³S7ª[–.ò-ò <³3³”ìb;ï]õóìÄBihÜ\n¾uûq]æD9PfSt°•>†åz~Çâžá!ë¥¶ü¡V\ZëìöuŠi*Ébñ·Wr~xJ–ÈŸ^­±MgøùÎ9ö‰ï·8‰ƒq.DN£: .[’ÑÖ¤¢ní´©R[èÖ\"!M½H¤R»¡‰‰q	Zû§¨j§\nªmÐŠ²JL¶4Ú¬U¡…”\0	‰Çö±Ï9¶Ï××Ùúƒ•Mëz$Ë?Žý½ß{y.ï7ÖµoÍEMß²6›SÓãóaÿ¾}Â›Gš›{{¿]€\r6PŸò¨¯¯/‹îs²ÕúpMMMI–å?Ô.ZôÒÚïw²T:Íc±¥ÿs€Û¸hxxp8Üjµ>Æ\ZDM&çýIâñøì«Y%û2¸\rÉ{÷î®\\¹ÒOŒH$\"2ÉÊJt&¦fÌ¡¡³nïÿ/QOOOÙ¹Í9r$`­°‡Ÿî»2T¦iÂ¼•›ºÊ\n·®±ÃÃÃL%^tUÛ‘L¥áõ¸áv8‡Ð@ŽâŽ%\"ÁôôtÐ,BKÈŽTVGžÈ²hq¢(T€Û<ÜÒ¶JFßi–87“\\çµÕAîu»¦\\.G¸dÒè?»îÎ%\Z!î)j>»T‘ÓtV(¡ÌNÂéÕ!ûkX‰&z÷k„–Èö\r“&MâŸ‹Pà\"c5¤“‰<Óôü,\n×\'§_íë½k«Ïã³šÊ$I ÌfÁnÅTm­YxkM.¶»§¼^?øì,niiÖÒÔA’ŒóŸ\\rz«VÐ;âà¾Î¿¿«•«EÆò¢Ôø,y^í°ë­‹Âþµvohããó&ý]¤sRW?ÇÅ/.a4Ç’h#ÆÇÆÙS;O|=ƒòÓ÷óï²Á‘¹Uã¥ðP´ír|V’‹ë+ðTVÆïkƒ:ãÔ%)*É8(SèDp*•†|žxºŸðô$úvŸ¤üÛóÉØ\\pë¶_L	leçr,‹U¡¥ÙwÀs×Â™Ç~Üþð±áŠüê‚š5f:›ƒ¦‘÷#ý€MÄKû~Û¨ô>ÿz€îîõC¬¶»ªó‡+¨|&ñ?#ááÈæMT×U%Ç=™¥\ròõæEg:<Ir™L+˜ÈÍq9Ö¥Ñét\'Ï\\½½DÛŽ^Ss¡Õºzi±F¿`Ô\\Hö¤AzâZP),Á©w¡ÖM#lÐhÚ®ÇoµS&*›˜T±ãw¿½¾xƒ§gfLn½¦ENÌ§éæy\Ze °\"Yòëù¼Ëï–gæõ\nL+%¦¦nrƒ|?7é½C¦„9Ï¨¹U·°¯¦hh\rü£´¤)LC!3³T@À„ü´VyáqVÀëóÂe¥\rÊ+[ü–‚Ïë÷Íj‚ë HP1\nyƒÓß\\ÑÂõeX*Ä÷®nÿ\'’ë×¼P³ýmlà#ÎÜ¡»YŠ€UžŸ!à° ±ÚˆO rNœ€C–Ö|ÂØäwo‰6Æ¬MU>Vï±âÞÈr2jõâ#!×ÛBâÖ´‹ôü/÷|Â5aÅ¯	ˆ#ãS\"ëqi>€á‡`§Û¨€NúvQöv~‡µ,¹þíXíúeÍ–w#Ü¾	kÝ‡Í­ŒË2Q7Gë+‰¹Ë3…B\rÁ||!Ñso ‹M£­)„SoF‰jK@†ƒ·ˆdãçæ?÷\'<PTJ|WsŒu?ôšâ—ÁÈ˜ýµŒ(JüQ¨*º1¼ˆK‘ˆ\'x3¡}ð\0ž?pŸ)Ïàøþ—1VCjrB‹ëŒ­¡gqa<º±Qø—úiRpÀ®~év\ZñOž°@€£+Û®Çø‰PÌ©îUçð=ýÂ:z­g€.wB¸ûI\\_üN¥ºxKÄkM?ˆ““ÑëÊø™^AS<&¿êyæ¯À|\nL¡¬œ3U§€:_ðýRzê`ûöMŸÞ@½\ní4-L—vò‘®Ÿr›Bv›&–Ð]|§ôÎ¦ã¯ô&?¥\Z¸þ?om‹þLPÉOß¸…&‚Í)\0Ò £ðr°‚žofóïoäÞÌÔ÷F±ûe÷žý+ÿ1yÒ‚‘ÿ`ÇçÿI©Î¿öŽXc‹×Nîê©s¹!—ˆÌUµDû+&æÄñI¼ŸÉzØ¡çéîuè:|0»½oÝ»/ÚÈJÛ$ƒ–ÎÇ^_oþ79Ükf+v^¶ØtcE­À–Ì*ÙÌ`\"ùÞ@&ûMU_\nPœµ\0GUáÿÜÇÞÇ¾³Ù<6ÉB	$y¤hEÅàµŽvÆi‹Se:Úê¤Ø‡Sµãû92V;X±”Åªƒ  AAP	I–G²ÙÍîf÷îãîÞ{Oÿ³øœ©™NugîœÙ»÷žï?ÿÿßwÎÿ¬{Ö¬YCàü|ëËW­ZÅ$0Ë†#‚TPÂƒƒœˆš),{ûm·B ²\Z*ÊÊ`ó–-DEàQx±ËÌš=û‡0yòdd‡$ƒþy;6<ãµŸõ`M¸\\è3Ýðz°5ºÝ9»]}Ãf“E¡“!(zÐ#ÂÔiç|\0.¿ür6A‚B‰â$§£@Ý‰D8oYEçHyŽvR|\n5É¡EA5‡ÃòûýàGçŽâö^žçï(äunÙò+­ï\rÀÌ™3¡½½êêê ££cggg*>Ëårq‡¨ª¦×•@M	³¸<N©Ù$&˜‰ãËsŸ–§Ó‘	 ­®\0¾ÓÎ?›¼¾í qØ%¢*6e$›¢M€CÝ=°ìªe´÷ða«W•yÂÙ—Þ÷Ý…õ—?Ó¦M#ë×¯§š¦›››\'\r\r!XÊÅGSÄ%øåe`mà*‚ê+¤Y°êŽC’ <G-ƒ˜ù©úÈ‰\'%WéÊa–MÑž¾!?.Ú¹ø¬)XNA¼Ù,NÃL´Mmî‰D÷e²¹÷-ÃLZ(“©¶…ôê¦hTaì—ôô·Ø¾};³ €\ZÂ†Q³ÙlÑ-§uZkK€eNõ[66f*\nji\0D‡›m¢®°ØïÅü¢‚Ò¶aßÇ:øö\n‘—þ\ZfÀa—Mec?úi\Z°	¢ÔF–Špe7çÄp¸CÝž¥*r?^dÝíóéÝ÷oûn)4~üøâ˜nnü==Ÿ8mVÝê‹ÏÂ÷QÂÔð˜òPeÉè³\0½ vWE°»—Z#.	y.æŸttÃ:§EÄ¢ÈMA\rdúÜv44‰ÞåP°{ùÀÏt‘Ã()+þŠŠ2£ïÄiñ¹\rW:œö—k*ËP¹ƒuËß\r\0+ÖdÆÀæ\ZüNñ£sB™Ïª¢rª,QE–‰Œ\0$|™àyÌ 3f‰y£`pùœ¶Ç7îœÁ1ÕÄÐl<´Qô–(Ú>¬}ìO@Mú\"ƒp¬¿rÔ¸é$hù,u90¾±R‰Qº£óÝÂóÕ+ÉoþôÖç¦žÿ:\0±Xâñ8d´Q8¿9ßýa÷=1Ý–­ìBÈôø¨ÀiJ\r@i=^\r`ú\Z@÷Ô‚¦TÀ©œ\nŸf`àô0‰D£ÿ¼è–ß½vÙ\r«anY¢ÅV^ÿ0ïðRN\'¡Fà(ä2 àåSœàs ÏÁä\n§Äb9‹}ÁãusŠ\"¦Íh~©ªº‚Lç\0æ¾±¾üy¯{Øòz½uÕc–4Î¿€8K‚¤gP†„\Z,ö~¯OBMÏ7r²i\nQ1_–Lœ¢›5eæê§žzòŠÒÒÒßÇu2Ñ!*¥5]@klƒÄÀša63›×Qôã…’­\\ö€fêd4™âT»BD›8ów?ªLnªÍŽ«¯ýö\"þ\"Çn½Þm+—/[z¯/Ð¨öëcà¬àD˜ÓB@BW\"¢å	-îR±|T\\JËe0A1bIx×qÓªš$kg·=ºuóß¢µ“¤\ZeøýJŠ_ÀnS ç ƒª-*õ|¿ZRƒl&K§œÝÀÎm>OÓ¯Ðð(GV$@ãÇ/Y|ÉO3R-±¼?‚¦Z\'Œª0ÇT6›8ÄÁº\'œ™19Ù·ˆ™MRQÅ‘á”—ŽÚ‚/.Ýþï7hj $¸U±x?`0\0xs6—Á&A8†¨¡o—Áa˜V*•Â6[è_Ìâä9ƒ-Ù7qËu/µOšÞtwe)!G_}˜Îjm ÙÀb¨›4t4<¤€Â¹È¾PÃF	YØ²yÁ( “Yf–Å¸a‘âËò©¤«ÉuÑd¼¾áqZå(°ç\0-&a dYHdr*FYÞ&ð†,¡°‘.LÏél¶’$ÐµëÞüêþJÍUÿ*ŽöÏ·Ÿ·®Ÿ®ùõ•wÊ%`ß~Tý¼U4S~	^*Jp—øPÿ8°óð8Q@_fÀà K%ôù:èØ,Î¦ ûˆ4WîwP®ªÜ©å‰hJ²\n›3\nõ\r…†áTx˜FF¢‹F ’Ž€‰Ì®(Íó3§D‹å—\Z£Â´T¬@jÒ^êx–ÀÓ‹Îû\"…üK;ù/gÂÜ-/^²|ÞÕÛÜÆËoZØÝõUŽ…x¿ùL²©ºÀ 80_L¿a*@<rÑœEJbDmA*y‹îci…²B ²Hh!`	\\¤RµÙ{²RFçEµ	2gî=ÝÅéè}u|¨€&Ü•ç Äã\"3|M|ê¦Y-µéPè|<Û/$×:Z¹ÐH4E^½x&RŸ¦PíÓ×Í½aÑ7¯\Z/¾n	1tõ¥èƒí6ÙS»Aé[\'ÖCZÔÖ)\rH±l×ŠÌ,òŒE)Ë}`\'Zšíi+ð™Çd@’hÑøìˆižîâ{·½	?i¨6r–Å¿œÈ¿~ŒŽ\"µRYcý Ñ¦‚E²:¥¨‡H6C¸LÎÐ£Â¶ž½›çÚÄx²Ë\'£àb/‘æÜþØWO†Â<Ý}8¬\"«²Ât;¼ÈIô~(!	èëïgiUqGAú´°Ñ†÷Š\\qŸ¯(³m<[)dr-N­Bvpù½»èÒ\Z?Q=N²34DjÎ½\0~|Õ*2fî\nhZ|4)*ÔàÄeôï„ù$R”Ã°Pp4Hƒª€+¥­Üs:|2™HîÇWê<ª+DØØi‘´NÀ‹Qlþày¸¾t3T\\³bsffµÀþ>€#ß‡dè0¸Jüà\rÔâ5œnxìBQ%SØ\nsØæÓ100\Z„ðáOèJGšTWÖWŽèy’Æºj¬v`ð²	¿¿…[ŠÝ¡s€íGa LÃà\Zæ{œm­¬ÚŒ\0–ž]]å”	h&•#³¼@Õøiþc ªct+äùÈa	ÄMG sé#Â(ñ#@»ƒº·Tô¸•ÛŠk†Í2šƒ4ekåº‡\'™×žÚöŽ·U\0¶IôvlÛŒÚm\nqˆnLL½w_\Z=ù&5\nìà¸<‚ÀŽÇ±ÿàÈ®âiGNçH¡`UP]ûï`ñÔÍo¿öÖœª·O­º·ö\rh}¦$Ëp´ ?F_ví…åíôØüÇ@ÐQ¸a±ñŽÊ»Z¨‰Á ·ÎßxÎ1¸k“ûzõp>ÖûŒ¡w?xü•Õ1×Š¥¶¿|tò•ã\nª*¡r¤Lðp¢¥=ð!Ð#](+e­˜‚£NÙ±LŽ(îq\00Wˆ™a¥3ìðˆ¸ñw¯aÌžÛyÓWÔ_3å¶É X%\0Ý½\0}CHÀŽ\n<Á¯…ƒg]‚¢áÔpV‹89©%¬¼ÖgäF`—Ú±·ÙñÀŠ[ÖÞÆ-yš°“²ï¿Ø°‰m/bßï[rÑ²z•¿+PY×$Ç1º¶5å ÆÆÔ!g\0 æó#N)‚ EYÒËÔÒÜÑX‚ôjé°`¨ü˜’:Á©Çw÷œ†Lÿ(ìÙ–>|Àüm´~v!´ë[v·½Ö(»€óMh—/ð•cŸã7›ÿíöÿãÜŸ¯þûŸ/»\Z_â‡òÊ±µ~E>ß/‰óË%©ÕFHÐ#pv	ó]dÅ‹ tÍä ¬¥O‡´ÌŽ£™ì3žï _!uøÐë&x]Üvl±kW¤\0›¼˜mwþ·C8ÜöÖv¸^q°°¡œ\'…wFÓà@yŽ¦¼ØL”qŒþ(‚xû~©,\n¬ôŠDÍG•ðqËU\ZBœ›\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0fiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c061 64.140949, 2010/12/07-10:57:01        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\" xmpMM:DocumentID=\"xmp.did:13B7B8F2910611E0805AC0C5CCB6C632\" xmpMM:InstanceID=\"xmp.iid:13B7B8F1910611E0805AC0C5CCB6C632\" xmp:CreatorTool=\"Adobe Photoshop CS5.1 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:6E5F0BFC0491E011AF35AEC708FB1C4A\" stRef:documentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>…Üu]\0\0TIDATxÚbüÿÿ?N°yóf†ø¤Ôÿ-­í&01F!­aÈ°ºÄõ?\'óõïÿþhþcûÏ’xqû’Ò\'Ó/ÙDùö2œ8zùHÂ6²õ®¨¸(ƒƒô­+ç*Í¢¼9¡ÿgÊüOšùîŸKx½ãÿûþÿ­/þ@Œx]ô?¯°ø²ØrO5F#FÉ¿îÇ¤9->}üÂ–øæ0‰á¹Ç…\'æü?¿3¼ÿ÷™©tó¿VzRÿÙyþ*ÿúýö	ƒÀé?ŽŒ‡ÓlþO18È ðÿøß¶OÛ˜E„ÿí:ð €a–egg3üøñCSPPp·ºšš™™é=}C‡Â5ØÙÙ©¾zûþÖÆÆA%]†ßžï_¼k³‘ª²¿¸¨ƒ  ?£¶}-BDx[ÿµò­`âäcx}oÛXkuÆŸßŸ<{Æpúå­¿ÞcûNÊgÅB+ƒq>%S¾~zËð]ˆAXÝ”ÿéïŒÛ•1üdûÃÀÊÅú——›ƒñàå¥±ó#¾·]Mcxë¥Çà•ÇÀô÷Ã›{—,/îg`É(cø¿u)Ãÿ»÷/]ûÃ°FShæÿi2ÿÅÌ:üDœ&;ƒlLiÜÀsæ±´”oÿK2þÿùýÂH÷?@\0á;,\0îé´´4 æºº:ßÄÅÄ¥¤$líì14€=mccÃð÷ïß@ÌxëÎ}†«×oýåÉýÇjƒƒƒÓ»wïþ.*õaÑ±`øÿïßße›W²rrþý§(\'Æ ,$0AHP PÁ¬„ì¹Çÿ“àcfxüê-Ã³ëg^ß½Ì ÀÄúßUËìß±3ç^¿~WpèÜU°\r`\rwïÞe0’çbú,aË°áµÃ\'_æ†ù‡Y¸Åä˜\",½¹Èðíó—Ëp?(ûOc”4ûû]Í•ÁFŸá+ÿÛ%ë>»~¢‡áË·o\\Ÿ™>}üô¬AÜmcisêßO2¼ÿÁÈðá\'0]3³ó°¼}pâØŸYþþçþúÍÄfæ·nøòõ—$›ðç}V&ÂÜB\\L¬ÿþ2¤qþa½öò&C¾¾ƒáËÿ\rª<¼ML5FÜ_¿üb°Õbxñäƒ÷?ÖÿÎ)æZ{÷CVùln>nFQ~^¡OŸŽ°ð±ýü·\'$˜édÃ[†ÅÎÇ.ßºþÿÈC~Æ–wo~ÉÈÿÿ·ÐŸþ±%ƒ%0Qùþ?bÆò^Èke,¯I©0r$-Ï®}_”þÿvâŸÿ>.ÿÛ„…æ\0 ¬ZCÛ*Ãðó“ËéINÒ&f½$âÖ%M¨„â6dëœ(N­nèÝ-‚?JµÅ	**”ùc^/XÄ‰âÕ9ÚNç*s5N,ZïÊì\\Ú¥kÚ$Í’¬éÉ¹}Ÿ_”ŠHý±÷ç÷ã}Ÿ÷}.ßŠz©Êd™ÔÞÞ^$\'I?<t—Zä¿}}}!äm.«»ªò’e™x…Õ××‹Ñh¢Íæ\r55–Â-ÑKÐÓÓƒ±±1Åï÷—(¥¸óúVìºiœvÔ&ñævº45ÑiÚÜG¾NOÒB©Ìe©ÀëqAv¹¡©KB¹¬Ò[ïø§§ðï£££¤8Ÿvg²9ˆ–Š\rÍuÈÌ¦ŸŸƒÅ£PgÓÜÁgž=<|ÿ©ñ3Z6W¢†n2njhæ«õª€ÿä±’ÿ=Q44ÍèÞ³#úªKñ‰%S‚ û 	‚nfÙéâG7?ôfgúÄë‹b]°†;M€ºˆùäiNœ@41§“ÓçÙ÷)%+Ý­}Sû;]}]¶à5hKl‚@0•¦(ØLéì‡âÕÒ¹†*?”~IU‘-Íå‘FÁr¹jŠ3çÎûŸ~müo¯-Wàº6ÆÉ¯â·CŽ¯ƒS¤˜ÌÂtÔZ¢Û‘6 ek—çt~„˜¿ã¡DQæ~dL@²’eYâ)cí®õy«à™ÍÛÑÐÓ­{÷ö|wtŒŠò·÷!Ü\ZF$äGY§0\rQÑ-ÑN’EWFü35©Ë]Ãƒ“51 ˆv§\r«]¬J)‰|¥òY¡Âð¶­ì¯u¿[¤ßœQÐà%Ä/©M?‰-]#tYª\'ìŒ£TÁDºÉ7Êÿ:r€:e;quì&s©ßÑvq®Š\n,\\\0Ëä°˜šÅûÉ”Ó&Ý7nÙ ¡/5ìŸ»kû»ðÅ©õØÿÆÇh`?\"²¦	¾@D®·\\&ƒD¶­ÃŒ6†È\'e‹lÇ°ö×çš#Õx4é:ˆaÀÅ}³ihäeðª{â™Í]¡àø÷øü=OlMRI‘‰CaZÎÊY}4ýÀ‹î¸v½0ÏœŽ[šCj ÖFW7Ç=Ï³S7ª[–.ò-ò <³3³”ìb;ï]õóìÄBihÜ\n¾uûq]æD9PfSt°•>†åz~Çâžá!ë¥¶ü¡V\ZëìöuŠi*Ébñ·Wr~xJ–ÈŸ^­±MgøùÎ9ö‰ï·8‰ƒq.DN£: .[’ÑÖ¤¢ní´©R[èÖ\"!M½H¤R»¡‰‰q	Zû§¨j§\nªmÐŠ²JL¶4Ú¬U¡…”\0	‰Çö±Ï9¶Ï××Ùúƒ•Mëz$Ë?Žý½ß{y.ï7ÖµoÍEMß²6›SÓãóaÿ¾}Â›Gš›{{¿]€\r6PŸò¨¯¯/‹îs²ÕúpMMMI–å?Ô.ZôÒÚïw²T:Íc±¥ÿs€Û¸hxxp8Üjµ>Æ\ZDM&çýIâñøì«Y%û2¸\rÉ{÷î®\\¹ÒOŒH$\"2ÉÊJt&¦fÌ¡¡³nïÿ/QOOOÙ¹Í9r$`­°‡Ÿî»2T¦iÂ¼•›ºÊ\n·®±ÃÃÃL%^tUÛ‘L¥áõ¸áv8‡Ð@ŽâŽ%\"ÁôôtÐ,BKÈŽTVGžÈ²hq¢(T€Û<ÜÒ¶JFßi–87“\\çµÕAîu»¦\\.G¸dÒè?»îÎ%\Z!î)j>»T‘ÓtV(¡ÌNÂéÕ!ûkX‰&z÷k„–Èö\r“&MâŸ‹Pà\"c5¤“‰<Óôü,\n×\'§_íë½k«Ïã³šÊ$I ÌfÁnÅTm­YxkM.¶»§¼^?øì,niiÖÒÔA’ŒóŸ\\rz«VÐ;âà¾Î¿¿«•«EÆò¢Ôø,y^í°ë­‹Âþµvohããó&ý]¤sRW?ÇÅ/.a4Ç’h#ÆÇÆÙS;O|=ƒòÓ÷óï²Á‘¹Uã¥ðP´ír|V’‹ë+ðTVÆïkƒ:ãÔ%)*É8(SèDp*•†|žxºŸðô$úvŸ¤üÛóÉØ\\pë¶_L	leçr,‹U¡¥ÙwÀs×Â™Ç~Üþð±áŠüê‚š5f:›ƒ¦‘÷#ý€MÄKû~Û¨ô>ÿz€îîõC¬¶»ªó‡+¨|&ñ?#ááÈæMT×U%Ç=™¥\ròõæEg:<Ir™L+˜ÈÍq9Ö¥Ñét\'Ï\\½½DÛŽ^Ss¡Õºzi±F¿`Ô\\Hö¤AzâZP),Á©w¡ÖM#lÐhÚ®ÇoµS&*›˜T±ãw¿½¾xƒ§gfLn½¦ENÌ§éæy\Ze °\"Yòëù¼Ëï–gæõ\nL+%¦¦nrƒ|?7é½C¦„9Ï¨¹U·°¯¦hh\rü£´¤)LC!3³T@À„ü´VyáqVÀëóÂe¥\rÊ+[ü–‚Ïë÷Íj‚ë HP1\nyƒÓß\\ÑÂõeX*Ä÷®nÿ\'’ë×¼P³ýmlà#ÎÜ¡»YŠ€UžŸ!à° ±ÚˆO rNœ€C–Ö|ÂØäwo‰6Æ¬MU>Vï±âÞÈr2jõâ#!×ÛBâÖ´‹ôü/÷|Â5aÅ¯	ˆ#ãS\"ëqi>€á‡`§Û¨€NúvQöv~‡µ,¹þíXíúeÍ–w#Ü¾	kÝ‡Í­ŒË2Q7Gë+‰¹Ë3…B\rÁ||!Ñso ‹M£­)„SoF‰jK@†ƒ·ˆdãçæ?÷\'<PTJ|WsŒu?ôšâ—ÁÈ˜ýµŒ(JüQ¨*º1¼ˆK‘ˆ\'x3¡}ð\0ž?pŸ)Ïàøþ—1VCjrB‹ëŒ­¡gqa<º±Qø—úiRpÀ®~év\ZñOž°@€£+Û®Çø‰PÌ©îUçð=ýÂ:z­g€.wB¸ûI\\_üN¥ºxKÄkM?ˆ““ÑëÊø™^AS<&¿êyæ¯À|\nL¡¬œ3U§€:_ðýRzê`ûöMŸÞ@½\ní4-L—vò‘®Ÿr›Bv›&–Ð]|§ôÎ¦ã¯ô&?¥\Z¸þ?om‹þLPÉOß¸…&‚Í)\0Ò £ðr°‚žofóïoäÞÌÔ÷F±ûe÷žý+ÿ1yÒ‚‘ÿ`ÇçÿI©Î¿öŽXc‹×Nîê©s¹!—ˆÌUµDû+&æÄñI¼ŸÉzØ¡çéîuè:|0»½oÝ»/ÚÈJÛ$ƒ–ÎÇ^_oþ79Ükf+v^¶ØtcE­À–Ì*ÙÌ`\"ùÞ@&ûMU_\nPœµ\0GUáÿÜÇÞÇ¾³Ù<6ÉB	$y¤hEÅàµŽvÆi‹Se:Úê¤Ø‡Sµãû92V;X±”Åªƒ  AAP	I–G²ÙÍîf÷îãîÞ{Oÿ³øœ©™NugîœÙ»÷žï?ÿÿßwÎÿ¬{Ö¬YCàü|ëËW­ZÅ$0Ë†#‚TPÂƒƒœˆš),{ûm·B ²\Z*ÊÊ`ó–-DEàQx±ËÌš=û‡0yòdd‡$ƒþy;6<ãµŸõ`M¸\\è3Ýðz°5ºÝ9»]}Ãf“E¡“!(zÐ#ÂÔiç|\0.¿ür6A‚B‰â$§£@Ý‰D8oYEçHyŽvR|\n5É¡EA5‡ÃòûýàGçŽâö^žçï(äunÙò+­ï\rÀÌ™3¡½½êêê ££cggg*>Ëårq‡¨ª¦×•@M	³¸<N©Ù$&˜‰ãËsŸ–§Ó‘	 ­®\0¾ÓÎ?›¼¾í qØ%¢*6e$›¢M€CÝ=°ìªe´÷ða«W•yÂÙ—Þ÷Ý…õ—?Ó¦M#ë×¯§š¦›››\'\r\r!XÊÅGSÄ%øåe`mà*‚ê+¤Y°êŽC’ <G-ƒ˜ù©úÈ‰\'%WéÊa–MÑž¾!?.Ú¹ø¬)XNA¼Ù,NÃL´Mmî‰D÷e²¹÷-ÃLZ(“©¶…ôê¦hTaì—ôô·Ø¾};³ €\ZÂ†Q³ÙlÑ-§uZkK€eNõ[66f*\nji\0D‡›m¢®°ØïÅü¢‚Ò¶aßÇ:øö\n‘—þ\ZfÀa—Mec?úi\Z°	¢ÔF–Špe7çÄp¸CÝž¥*r?^dÝíóéÝ÷oûn)4~üøâ˜nnü==Ÿ8mVÝê‹ÏÂ÷QÂÔð˜òPeÉè³\0½ vWE°»—Z#.	y.æŸttÃ:§EÄ¢ÈMA\rdúÜv44‰ÞåP°{ùÀÏt‘Ã()+þŠŠ2£ïÄiñ¹\rW:œö—k*ËP¹ƒuËß\r\0+ÖdÆÀæ\ZüNñ£sB™Ïª¢rª,QE–‰Œ\0$|™àyÌ 3f‰y£`pùœ¶Ç7îœÁ1ÕÄÐl<´Qô–(Ú>¬}ìO@Mú\"ƒp¬¿rÔ¸é$hù,u90¾±R‰Qº£óÝÂóÕ+ÉoþôÖç¦žÿ:\0±Xâñ8d´Q8¿9ßýa÷=1Ý–­ìBÈôø¨ÀiJ\r@i=^\r`ú\Z@÷Ô‚¦TÀ©œ\nŸf`àô0‰D£ÿ¼è–ß½vÙ\r«anY¢ÅV^ÿ0ïðRN\'¡Fà(ä2 àåSœàs ÏÁä\n§Äb9‹}ÁãusŠ\"¦Íh~©ªº‚Lç\0æ¾±¾üy¯{Øòz½uÕc–4Î¿€8K‚¤gP†„\Z,ö~¯OBMÏ7r²i\nQ1_–Lœ¢›5eæê§žzòŠÒÒÒßÇu2Ñ!*¥5]@klƒÄÀša63›×Qôã…’­\\ö€fêd4™âT»BD›8ów?ªLnªÍŽ«¯ýö\"þ\"Çn½Þm+—/[z¯/Ð¨öëcà¬àD˜ÓB@BW\"¢å	-îR±|T\\JËe0A1bIx×qÓªš$kg·=ºuóß¢µ“¤\ZeøýJŠ_ÀnS ç ƒª-*õ|¿ZRƒl&K§œÝÀÎm>OÓ¯Ðð(GV$@ãÇ/Y|ÉO3R-±¼?‚¦Z\'Œª0ÇT6›8ÄÁº\'œ™19Ù·ˆ™MRQÅ‘á”—ŽÚ‚/.Ýþï7hj $¸U±x?`0\0xs6—Á&A8†¨¡o—Áa˜V*•Â6[è_Ìâä9ƒ-Ù7qËu/µOšÞtwe)!G_}˜Îjm ÙÀb¨›4t4<¤€Â¹È¾PÃF	YØ²yÁ( “Yf–Å¸a‘âËò©¤«ÉuÑd¼¾áqZå(°ç\0-&a dYHdr*FYÞ&ð†,¡°‘.LÏél¶’$ÐµëÞüêþJÍUÿ*ŽöÏ·Ÿ·®Ÿ®ùõ•wÊ%`ß~Tý¼U4S~	^*Jp—øPÿ8°óð8Q@_fÀà K%ôù:èØ,Î¦ ûˆ4WîwP®ªÜ©å‰hJ²\n›3\nõ\r…†áTx˜FF¢‹F ’Ž€‰Ì®(Íó3§D‹å—\Z£Â´T¬@jÒ^êx–ÀÓ‹Îû\"…üK;ù/gÂÜ-/^²|ÞÕÛÜÆËoZØÝõUŽ…x¿ùL²©ºÀ 80_L¿a*@<rÑœEJbDmA*y‹îci…²B ²Hh!`	\\¤RµÙ{²RFçEµ	2gî=ÝÅéè}u|¨€&Ü•ç Äã\"3|M|ê¦Y-µéPè|<Û/$×:Z¹ÐH4E^½x&RŸ¦PíÓ×Í½aÑ7¯\Z/¾n	1tõ¥èƒí6ÙS»Aé[\'ÖCZÔÖ)\rH±l×ŠÌ,òŒE)Ë}`\'Zšíi+ð™Çd@’hÑøìˆižîâ{·½	?i¨6r–Å¿œÈ¿~ŒŽ\"µRYcý Ñ¦‚E²:¥¨‡H6C¸LÎÐ£Â¶ž½›çÚÄx²Ë\'£àb/‘æÜþØWO†Â<Ý}8¬\"«²Ât;¼ÈIô~(!	èëïgiUqGAú´°Ñ†÷Š\\qŸ¯(³m<[)dr-N­Bvpù½»èÒ\Z?Q=N²34DjÎ½\0~|Õ*2fî\nhZ|4)*ÔàÄeôï„ù$R”Ã°Pp4Hƒª€+¥­Üs:|2™HîÇWê<ª+DØØi‘´NÀ‹Qlþày¸¾t3T\\³bsffµÀþ>€#ß‡dè0¸Jüà\rÔâ5œnxìBQ%SØ\nsØæÓ100\Z„ðáOèJGšTWÖWŽèy’Æºj¬v`ð²	¿¿…[ŠÝ¡s€íGa LÃà\Zæ{œm­¬ÚŒ\0–ž]]å”	h&•#³¼@Õøiþc ªct+äùÈa	ÄMG sé#Â(ñ#@»ƒº·Tô¸•ÛŠk†Í2šƒ4ekåº‡\'™×žÚöŽ·U\0¶IôvlÛŒÚm\nqˆnLL½w_\Z=ù&5\nìà¸<‚ÀŽÇ±ÿàÈ®âiGNçH¡`UP]ûï`ñÔÍo¿öÖœª·O­º·ö\rh}¦$Ëp´ ?F_ví…åíôØüÇ@ÐQ¸a±ñŽÊ»Z¨‰Á ·ÎßxÎ1¸k“ûzõp>ÖûŒ¡w?xü•Õ1×Š¥¶¿|tò•ã\nª*¡r¤Lðp¢¥=ð!Ð#](+e­˜‚£NÙ±LŽ(îq\00Wˆ™a¥3ìðˆ¸ñw¯aÌžÛyÓWÔ_3å¶É X%\0Ý½\0}CHÀŽ\n<Á¯…ƒg]‚¢áÔpV‹89©%¬¼ÖgäF`—Ú±·ÙñÀŠ[ÖÞÆ-yš°“²ï¿Ø°‰m/bßï[rÑ²z•¿+PY×$Ç1º¶5å ÆÆÔ!g\0 æó#N)‚ EYÒËÔÒÜÑX‚ôjé°`¨ü˜’:Á©Çw÷œ†Lÿ(ìÙ–>|Àüm´~v!´ë[v·½Ö(»€óMh—/ð•cŸã7›ÿíöÿãÜŸ¯þûŸ/»\Z_â‡òÊ±µ~E>ß/‰óË%©ÕFHÐ#pv	ó]dÅ‹ tÍä ¬¥O‡´ÌŽ£™ì3žï _!uøÐë&x]Üvl±kW¤\0›¼˜mwþ·C8ÜöÖv¸^q°°¡œ\'…wFÓà@yŽ¦¼ØL”qŒþ(‚xû~©,\n¬ôŠDÍG•ðqËU\ZBœ›\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(38,'sys','quickAccess_updateProfile.png','image/png',5535,'2013-12-14 18:15:36',5535,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0AIDATxÚbøÿÿ?$\'\'o)(È³AŒŒŒ.dÐgºù_\\Û’AÒÈ—‘	¦º©©‰ñæÃ\'O/GÕá–TË`ücçÿÿÿþ0I943€$Bzö0,¹üÿÿÑ§ÿÿïÛWþÿÃ°QÊjzÿ?ü``¸÷ìƒã™N…%æ,\0Ä\0s•——Cccã¹Ó§N‚Åà–¿~ýú_º‡–¡ø‹}= >\\ÂQ…åÿí‹\'î=zâ³€ˆ¼9‡¯ÏgÚ{ü$CÃüÃj7qß›7ñÔßÿ;îÿÿÿöÝûÿÿï%,•\0õî+ÃÛ¯B¬ü»dþ…^\0#ÌU O‚@CCÓ­[·~pqq±²031ðòò1ØÙÙ-óõó‹©ea@@Åÿ®_¹Ä:«Ð›AŸŸA@A›áÛ‡!@©hx\"Û\0@1‘yuÑ¯ÿþúÉÀÁÎöŸ“‹‡/´bö\r¾5«˜v††¸Šñ32¾é±gøÉÈÆ W¼ùÀiéÞÓ/\ZÊuOFhpúµ‰©‰ˆ8#ƒÓ/µµrü¯ÖÎg`,e*{Ø;Nf¼øÊøçÉ;`H½ýÏpëÕŸKžg1DÌwÜ.=Çä×@ü €àÉ\0ÒÓÓ~üøÁ   ðEVV†GYE™50 è7Ì%Lè¡TÜÈÊÊúïÇ÷ïÜ÷îÝû÷âÙ‹/ëÖ­e†Éc«¤¤dí®=û×÷d3°óð122³0þyó\0.aÃ¹sgÞøÈðñÙ}†ÿ_?00þùÅôúÆ‰¿8m¸pùº^[‚ååg¯_3üøùœv^<~À •ÇðtS²=Ã—/ŸÿIKH0òóò‚ã1¡e%È¬@üÅIQË÷ýµ³âãâbxöâÃÍ{÷AŠA®ÿÐÖöH‹Àä[µ”Á!(ò?ó¿ÿoÎ\Z1\nŸÌðýcåœ]ë\"uNn=RÆ	Ö`Ÿ3›ÁÈÞ÷ß¿ßÿØØ˜µü,ƒ]^¼zÃ \'|‰a“Ã­ç9\r@¥/ÁNº|t\'ƒ¸(Ïÿ¿ÿ~ÿc`øõ—‘aë­or\"W¶Ä2,ùœÍVÔÚ	Š&°-×D†÷_˜¾]ùˆ?|ûÇ` üÆ³63W18ygƒã¬ÿ¾½a|ñê¯€0ÐüÿŒ?~ýgØüŠë¯s>‹_˜3CùO˜_PVu!M…aø9gÛÙÏÑýÔ²­²¦B”\r£ Òþ¶ðÂ;C»±ìç\"ê2ºHÊÐ4\"¢‚¢0\"4“@½0È‹ê¢èçÂŠÈŒ¦¶ŠÖæÜv¦m;;?½\'üñ…ÃÇy¾÷y¿çù˜éê4ÞÿVYY	ÇI’ä[¨ùó¼Nç2¸].íf M×®^™ß™E”––azÎ9ƒžm6b)P»ººÔ¼¼<äØ(pè‘#þBlø\'\"·p˜uw1ÂuîytaNü‚ªªªÐßßlVdFƒßÐ^·&Îˆ¥…À°:IE–³É±à³’Õ;gÅ/Qqq1¡¬W›j¼\n§çX‹Ù›5¼É#g\0’Us®,¦&•ñÀnÇ©ÞÅA$®n›ªkî¨8R¾âÝjgc‚\0³ÉÎ`\0Ë²P”Jj\"ÞÂ²¼FyQùkáS3ÁÈïäx<‰xB@ŽÕ1“¦œÊ²ŒšM§Ä†Û/N;§0Ò7Kkr^ˆ*ëÛ±Ü½B4º~Ý¦Ò<›Æ‡×OQ!ÜSG‰II28½K6ïUÞÅsÛÎ½Baöýû¿Z²>ÕÞ” äÚµ‚ì>q®Un6ú+ÜºÅ_qHU=Ogá9^ï:™#Œ;<ˆÐÃËã!”l÷±.Æ}¾Öî¼Ófáû\Z}‚ÓCŸPžŸßD)“3:¨¾ôB—5Ö¨>ChrM%Çße!q1é‰ë:V&\r«4&ÞŠü‚­ôfö¯ºï	<p4ûÎÅnQº¸6Âù\"—íò5	“SüÏH4$\";«!GçÈÒøèº ”£z#m¤o@ßuàG7ÅÃðí©ƒÏëÕ4BÔ?G‚-¼v+OÉULÙ…´Š)D\"ÄRÚã«\"’ñ²§…~’ð˜¶¡ÏÐ ^ÜDÛsù¹×ëõüÓe^T4?Bäë ÝEÑ›,Ç\\kÖÖ9œÎB›ÍÊêT	Rz\"“JD¡àçîðÈû[¯{nŒ­•ÏòTsí\0”WilTU>÷½73o¶.C[ètZ±[¶VZŠB „V’Ê¢@$(\rÔ4ÆÒ¸£‰$î±š`Œ¦h\"á‡4\"DRPƒ%6ˆ–8a±”2…™N§óæ-ó–ë¹cK(¥%}ÉM§¾{Ï9ßùÎwî8›oýš››™ñš¦1åv»}Ïçãººº^šû@õŽ%uK°Ë\r”/TVÍžícO©Û?œ‰ìæ\nQ©ÃáøÿÏx>£¾¾¾mæŒ™ˆeux½l6&Acc#”——Coo/Åb,àyÔö2ì`›ÝFórsiiY\':DòèÊ•£\"·“QE¹öööªH$B°ßï\'“³=0u’Ð;AÊÂ1¬FMÏµŽot°‘;ÕaÜ0%P]]½z÷îÝFVV¦MÐbðÌÂRÈ)©Àˆ)Xœ€97Ô5©x\rÚ÷-}aÆ¸5@_B0=E(xDS5X<+Ìµz£S% ÿ\"À##‰`‡ÐO6~°obó ³³âñxÔ0-Êä\"!«¨®:¨2vbÏ?àö—°â¶\rdäëy8Ô{oOÓ¸œ;wÎòºì­sK\'?__U@ósÝDFC¥Y£]þo[FHÉ$Gñ‰E€)¢Š¦ŸH©ÚY“lI5…‘wâœ!ý`=Ú2õ‡\rI¦n´`0ˆÇ…Ù|ré¢J§‘Òˆ­“ÃaOGÂ>]×©®%¹Ç^ß;Š¦w½€}kÏ‚`À{1Óã*Bºò.\'—7/°Rj²¿ñƒïr‡H3lNYçYwhË›Þ…ûµChMŒ©1œf@\0zz{‰¡(¨ƒ³‡ÒídšÉÞ‹GÆ£ŒIÓG^ùòòrˆ’LÀÏ®Õ?¹	å0ÊžžpbH²ƒ‰Aè¿Þ¹÷x­>¸ñä©--×ú¶n½¶¹¦¦’µÒ¨­xu\Zª%,¢Í¾oÎüšÇ¯œ>föäÌK$šT]$Z2å×|ë:º/¸¿íšR¤œ7ßy;´	Sw#Œž)‘çµ¶ŽJ‘5EUo°bAÜ_X`ºJ^Å+RÀWO€Ç.€ašåpƒæsg<õbDæZ½Õ¹ùH×Øöû/°Ù—¤´„ˆàéOÏ@üúy˜>{>\r¦ 9&Ø`”°qéD©‘¥88Oï‚ð)t¿ÁÉ~TÖBCp¾l=À¿`ãöéŒàÖ®/ÚJØb4\"]¹DLç›Ø¨—hÞ°^Lwp\nAŽ/¦,k‚ê\Z:ýh‚7 ¦¯Ã­)zþ7ØYuÊ\"MelûÄ£Ý,òüM; iiyÕBYµ=ˆ5Ä5J	X(óëW%ôrºá¾ëðþsÇ7àÐÿà4TÜlÎ`/b‘yóË4 »ýswQÑd‚uLƒ™¤‘>R¸\r(Š§»c0#óYÇ­5ô5‚w0pX\'íir\"<nŒPSWVŠëj<\"˜ªÎ¥7Ìœ;ÌaÈø#†–£¶,Šl¼œÀ™eAÊ íÅUµÊ0ø-l\"çÉôÍÄb[šIy‡Ž¶Åcpš\nèè%«’\r á“£ƒið-¾Ãt®iÞkh¾|D†ž-™(B†Q|-e#žm.\n:Ìá#£ÛÑ°<ÇOü–%Rþ:ø°òÅU˜ZÒ°¡åsL±[ôò~pˆ&[ndÚƒK&9í`Š<p¢‚ãd‡£5õ$Õ‰¸´(wõòEõäŸgŸ<²ýµƒ·¿üŽb7¯i˜ú\0(‰~î=Ó>ž¸·Þëqy˜kÐåà-%\Z¾Ò}âÊ…®Ö_w½q”±¤~ÕzzøÛ½ÆX’óŸ\0µY	l×þßÌÎÞÃëƒÚÆØÇ*Žb×˜@B¹ÓB*IhEDšªéU¥(B¨ZÔT	m¨TBZZ	¦\"mI	(¹(¦`‡b[¶‰ÅØ{xwggvg^¿7k7â,0òÈ{Ììüç÷ß{ÿC¼®&D®t,]º”„´ŠD\"œ	”ÍzÍAýöáÁÜ@{Èãñ×ãánwÂçó¶¸œ®#`&»Ð¨	•âý*Ÿ8NÌÅhú½÷\r]G¹õÚ$ÀU 7ôçåå6£ôIÇïÊ0D²®…‚RN»õ\ZóŠC™^ŸWòûýRnN.tÿ_ŽûºÄµ••U×tÀF7qk æææB¬)õEíííFNNŽ‚l0ËhT}J<;‘$|ã¡ìÉ‰$ëG%££›FŠŸM\\[99Åä|ÛådW¢Ó·Ì9sæÈ0Ê@ù<\nê]ÜÐÐ`€\nÚº»»a$ŒwºéÞq´°ª¢Ã%Ã ìd+#B\\›\"›Yùæ0øÍ2Ã­&S€öŒÖ_‡\r7å€ªª”ŸŸOÍÍÍÕÑh”Å1£Oœ)Ué»s‹ifÅp‹‘\'À}ÃKa©°oÂp±B\0G7À{]Ô›3KmöŒ™y·½@çÞÎ¤òûzûèèè°}[[›XÛ\"”%4Ì­°z€c:„ƒ±IÀþóÿ!»ý’S@²Ä×§»[‹Ö]6ç¸æmOäJNïEï¨É·7uuuìøñã\0ùä	Y±/÷cNýháæqHÔÒÅáSÈŠb3Š<Nz¢e[í.²yü$£ÔÄš˜ýº¦fè²/ƒq…äH¯4T«Þr€@Ð‡…úc/Aœ}£4/cž%Õ¸¬d»y†á»(9AuÐ;‹\"k¢$¨	[%e‚d!sÈ”ªÆ¸©J\\&CÕoo”A}so†ƒõÇµù§Zô‡µD¢vÁäô¨Œr·35Ò«§›Ú&NÙr@†¢bÄÉÓ‡	$’’‰hƒ·dFébL1¯éÀM²K¤·üqÅ|öøSùS/½ÑlcFiÙezSÖ	r9Vƒ+V$8 §Ÿc%F2©Éj0ðÀw~wøÍ«IË~½ÇP\0—;ø-sàþ<GÕ‰w(ŒÓ©sá_«qœŽhŽQ$×)\nY«{Bª¤t¸åcHdÊ–Œ÷oüÙ–÷WÌ\\j;P×BCt’<Äc /R—¶nÔÅ«·’/3“ÎzŸÜ¿äõgSUü€9¾ØGgÎuîý~(’Ð!©¹M@ªMfv_\"UA\n‰èIRzmÏJÂQ»¡%~òüë\r›ÆùmgÏ‡¤UE§Ðb§W­Z6*;ûûÁà»¿Ø¿ÿ·µõõ]Åe¿n<½p­Óˆ’ên=îšc{º(©©Õnw¥”Œ.Q\\*rÄÌÊþƒÒ…x’Âà˜	pØÁg°iU½ìä€Ø‹L®}ñÆšŠ‘™Ê©Ö°øÚ1  =[ž]»|y~Á3ñÞ^ÐT³D·ÎP,öñ”—_ž‡k¢×t`á³¯#Bèbâ 1mÐÚÆºÒ±ã×Œóe‡¼Õ)‘).™VÝíMÔÓTÏÊÛjAš#ÔoÈàÉIHÓÒ‹\nJ(ƒ42‹îá…¼ÀúzôéG§[?9]·ò­ÍëŽ*§o÷ŸY~¶«bõ´i“„8ã>ï‡G)ØÕEb« ®iý÷mÝ*öb\"×D!o)Oív·÷ðø;§Ý“_£Iø‚DÛ¸µ/)sƒ“]‘©´|,]NáÈ<ÒZŽQ~Ãkíiµhƒ$+V³KJÒrâ/¯¨fŽŠIEw”—ýeùì€¼¸ªžÈ¿ÅÑE]ú5µghgãI¨/‰=‹|ÿ>ež8{öW¢|„¼bî}²†ü¹y¬§«\Z3ÇTN?TñÕ‰)Ô·lÀX5l‡õ\nêÛŽSdñ†“$>#‹÷à>b†F%N•bÁ‹êé„tR¨`äh2´8ýa[-žö •ÙkùÔ’ÃPJ«QhÞ8œèh$j¯·Zá¬÷iÚ°÷<\'-º®fÛöZ±F=ØWÌ€Óíeíç>âzBýJÕ¬oª¨š ¸±,f‹I,½†2´WØ€óŸ¿Hc“]Ôi:hl±‡JŠ\n)Žá%8“††ž\\|”,ßK”õ£h.Äîß`ø\'Dç?…!¢ h•ôMëk¶tì5? Xõ«¢Ð]?¬¡EË–lsÑ»>xïÎ©wMËËv™á—ÍòLDÝŠ¼x-Q:êâ½”^?O¯¡›Vÿp4oR×¨X‰Àž9µ×hÔ°÷`øš!‡áŸ!ê±°e87½Â¾ÝöøªWg]ÎðAŠqÙ(Žöç[x8Ø7nþCË¦\rËvM)†VF[zAN	7âÍ>/ÜZd;ð˜N)R(—x,N>¹–ªóåâµ0´\0ÿkºT†n\Z5MZG}™séà;Mˆ^½p9Ã¯J%—›e+äîÌœê¬,Ÿˆ®J2Y¬H_(~I1á—…s<í  —\"ò)”Š\ZW©ÌoPõèïáËoõ¼BÔ´‹¨³BG½dø®ì•|ç¿m^úËjµ6½µJD~ÜŒ%ôñ‘Ý©ëæBŠÃM¿‹ôx¸ÈãÎ°ppB†ÒgÜ2ZðxÁTa¸™.›™^Ç°Y’Ã(“R:ð[’u#**C1È\\•D“€‚þ‰ï‘ö~7f,Â\\	–zS[™bþØÎçÄ±	ãoŒÝýãí,	qO¦²(·pÂß§NŸ\"¶R-=$ÛÁÚQFYai´I÷ø/ž*…h1“ Ú\Z² ò¶}˜þóõYT˜ÑNÑ±7ëpL¤þ`/:ÚëÌ`û†]Ÿ:!Œv¸}µ˜Ø™ú?ÈÜÜ_þ“¢Ú9s:M Q¼X²»Öä–.õçû|YÙ”árZÛ¢v›}>Ø¸N0‹a†p]%\rÃH†IE(ØÛr¦B\'Ý±¾ç{;÷ÕnZß<Èof/[IwüÆ¸vÕI<cÕ:òü\"ª|ì÷\"z²\Z\r¦rŠÆÒ’Ÿ/¦\'½Ö5¹åVŽ*ôøs<‚¤éñ~=é\\ø¬¥õíM+Z+«ª“_d”ž5¤Þ‹ÉÀÉ½üzÄû•Žÿ&$íÏ;_¥p\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0AIDATxÚbøÿÿ?$\'\'o)(È³AŒŒŒ.dÐgºù_\\Û’AÒÈ—‘	¦º©©‰ñæÃ\'O/GÕá–TË`ücçÿÿÿþ0I943€$Bzö0,¹üÿÿÑ§ÿÿïÛWþÿÃ°QÊjzÿ?ü``¸÷ìƒã™N…%æ,\0Ä\0s•——Cccã¹Ó§N‚Åà–¿~ýú_º‡–¡ø‹}= >\\ÂQ…åÿí‹\'î=zâ³€ˆ¼9‡¯ÏgÚ{ü$CÃüÃj7qß›7ñÔßÿ;îÿÿÿöÝûÿÿï%,•\0õî+ÃÛ¯B¬ü»dþ…^\0#ÌU O‚@CCÓ­[·~pqq±²031ðòò1ØÙÙ-óõó‹©ea@@Åÿ®_¹Ä:«Ð›AŸŸA@A›áÛ‡!@©hx\"Û\0@1‘yuÑ¯ÿþúÉÀÁÎöŸ“‹‡/´bö\r¾5«˜v††¸Šñ32¾é±gøÉÈÆ W¼ùÀiéÞÓ/\ZÊuOFhpúµ‰©‰ˆ8#ƒÓ/µµrü¯ÖÎg`,e*{Ø;Nf¼øÊøçÉ;`H½ýÏpëÕŸKžg1DÌwÜ.=Çä×@ü €àÉ\0ÒÓÓ~üøÁ   ðEVV†GYE™50 è7Ì%Lè¡TÜÈÊÊúïÇ÷ïÜ÷îÝû÷âÙ‹/ëÖ­e†Éc«¤¤dí®=û×÷d3°óð122³0þyó\0.aÃ¹sgÞøÈðñÙ}†ÿ_?00þùÅôúÆ‰¿8m¸pùº^[‚ååg¯_3üøùœv^<~À •ÇðtS²=Ã—/ŸÿIKH0òóò‚ã1¡e%È¬@üÅIQË÷ýµ³âãâbxöâÃÍ{÷AŠA®ÿÐÖöH‹Àä[µ”Á!(ò?ó¿ÿoÎ\Z1\nŸÌðýcåœ]ë\"uNn=RÆ	Ö`Ÿ3›ÁÈÞ÷ß¿ßÿØØ˜µü,ƒ]^¼zÃ \'|‰a“Ã­ç9\r@¥/ÁNº|t\'ƒ¸(Ïÿ¿ÿ~ÿc`øõ—‘aë­or\"W¶Ä2,ùœÍVÔÚ	Š&°-×D†÷_˜¾]ùˆ?|ûÇ` üÆ³63W18ygƒã¬ÿ¾½a|ñê¯€0ÐüÿŒ?~ýgØüŠë¯s>‹_˜3CùO˜_PVu!M…aø9gÛÙÏÑýÔ²­²¦B”\r£ Òþ¶ðÂ;C»±ìç\"ê2ºHÊÐ4\"¢‚¢0\"4“@½0È‹ê¢èçÂŠÈŒ¦¶ŠÖæÜv¦m;;?½\'üñ…ÃÇy¾÷y¿çù˜éê4ÞÿVYY	ÇI’ä[¨ùó¼Nç2¸].íf M×®^™ß™E”––azÎ9ƒžm6b)P»ººÔ¼¼<äØ(pè‘#þBlø\'\"·p˜uw1ÂuîytaNü‚ªªªÐßßlVdFƒßÐ^·&Îˆ¥…À°:IE–³É±à³’Õ;gÅ/Qqq1¡¬W›j¼\n§çX‹Ù›5¼É#g\0’Us®,¦&•ñÀnÇ©ÞÅA$®n›ªkî¨8R¾âÝjgc‚\0³ÉÎ`\0Ë²P”Jj\"ÞÂ²¼FyQùkáS3ÁÈïäx<‰xB@ŽÕ1“¦œÊ²ŒšM§Ä†Û/N;§0Ò7Kkr^ˆ*ëÛ±Ü½B4º~Ý¦Ò<›Æ‡×OQ!ÜSG‰II28½K6ïUÞÅsÛÎ½Baöýû¿Z²>ÕÞ” äÚµ‚ì>q®Un6ú+ÜºÅ_qHU=Ogá9^ï:™#Œ;<ˆÐÃËã!”l÷±.Æ}¾Öî¼Ófáû\Z}‚ÓCŸPžŸßD)“3:¨¾ôB—5Ö¨>ChrM%Çße!q1é‰ë:V&\r«4&ÞŠü‚­ôfö¯ºï	<p4ûÎÅnQº¸6Âù\"—íò5	“SüÏH4$\";«!GçÈÒøèº ”£z#m¤o@ßuàG7ÅÃðí©ƒÏëÕ4BÔ?G‚-¼v+OÉULÙ…´Š)D\"ÄRÚã«\"’ñ²§…~’ð˜¶¡ÏÐ ^ÜDÛsù¹×ëõüÓe^T4?Bäë ÝEÑ›,Ç\\kÖÖ9œÎB›ÍÊêT	Rz\"“JD¡àçîðÈû[¯{nŒ­•ÏòTsí\0”WilTU>÷½73o¶.C[ètZ±[¶VZŠB „V’Ê¢@$(\rÔ4ÆÒ¸£‰$î±š`Œ¦h\"á‡4\"DRPƒ%6ˆ–8a±”2…™N§óæ-ó–ë¹cK(¥%}ÉM§¾{Ï9ßùÎwî8›oýš››™ñš¦1åv»}Ïçãººº^šû@õŽ%uK°Ë\r”/TVÍžícO©Û?œ‰ìæ\nQ©ÃáøÿÏx>£¾¾¾mæŒ™ˆeux½l6&Acc#”——Coo/Åb,àyÔö2ì`›ÝFórsiiY\':DòèÊ•£\"·“QE¹öööªH$B°ßï\'“³=0u’Ð;AÊÂ1¬FMÏµŽot°‘;ÕaÜ0%P]]½z÷îÝFVV¦MÐbðÌÂRÈ)©Àˆ)Xœ€97Ô5©x\rÚ÷-}aÆ¸5@_B0=E(xDS5X<+Ìµz£S% ÿ\"À##‰`‡ÐO6~°obó ³³âñxÔ0-Êä\"!«¨®:¨2vbÏ?àö—°â¶\rdäëy8Ô{oOÓ¸œ;wÎòºì­sK\'?__U@ósÝDFC¥Y£]þo[FHÉ$Gñ‰E€)¢Š¦ŸH©ÚY“lI5…‘wâœ!ý`=Ú2õ‡\rI¦n´`0ˆÇ…Ù|ré¢J§‘Òˆ­“ÃaOGÂ>]×©®%¹Ç^ß;Š¦w½€}kÏ‚`À{1Óã*Bºò.\'—7/°Rj²¿ñƒïr‡H3lNYçYwhË›Þ…ûµChMŒ©1œf@\0zz{‰¡(¨ƒ³‡ÒídšÉÞ‹GÆ£ŒIÓG^ùòòrˆ’LÀÏ®Õ?¹	å0ÊžžpbH²ƒ‰Aè¿Þ¹÷x­>¸ñä©--×ú¶n½¶¹¦¦’µÒ¨­xu\Zª%,¢Í¾oÎüšÇ¯œ>föäÌK$šT]$Z2å×|ë:º/¸¿íšR¤œ7ßy;´	Sw#Œž)‘çµ¶ŽJ‘5EUo°bAÜ_X`ºJ^Å+RÀWO€Ç.€ašåpƒæsg<õbDæZ½Õ¹ùH×Øöû/°Ù—¤´„ˆàéOÏ@üúy˜>{>\r¦ 9&Ø`”°qéD©‘¥88Oï‚ð)t¿ÁÉ~TÖBCp¾l=À¿`ãöéŒàÖ®/ÚJØb4\"]¹DLç›Ø¨—hÞ°^Lwp\nAŽ/¦,k‚ê\Z:ýh‚7 ¦¯Ã­)zþ7ØYuÊ\"MelûÄ£Ý,òüM; iiyÕBYµ=ˆ5Ä5J	X(óëW%ôrºá¾ëðþsÇ7àÐÿà4TÜlÎ`/b‘yóË4 »ýswQÑd‚uLƒ™¤‘>R¸\r(Š§»c0#óYÇ­5ô5‚w0pX\'íir\"<nŒPSWVŠëj<\"˜ªÎ¥7Ìœ;ÌaÈø#†–£¶,Šl¼œÀ™eAÊ íÅUµÊ0ø-l\"çÉôÍÄb[šIy‡Ž¶Åcpš\nèè%«’\r á“£ƒið-¾Ãt®iÞkh¾|D†ž-™(B†Q|-e#žm.\n:Ìá#£ÛÑ°<ÇOü–%Rþ:ø°òÅU˜ZÒ°¡åsL±[ôò~pˆ&[ndÚƒK&9í`Š<p¢‚ãd‡£5õ$Õ‰¸´(wõòEõäŸgŸ<²ýµƒ·¿üŽb7¯i˜ú\0(‰~î=Ó>ž¸·Þëqy˜kÐåà-%\Z¾Ò}âÊ…®Ö_w½q”±¤~ÕzzøÛ½ÆX’óŸ\0µY	l×þßÌÎÞÃëƒÚÆØÇ*Žb×˜@B¹ÓB*IhEDšªéU¥(B¨ZÔT	m¨TBZZ	¦\"mI	(¹(¦`‡b[¶‰ÅØ{xwggvg^¿7k7â,0òÈ{Ììüç÷ß{ÿC¼®&D®t,]º”„´ŠD\"œ	”ÍzÍAýöáÁÜ@{Èãñ×ãánwÂçó¶¸œ®#`&»Ð¨	•âý*Ÿ8NÌÅhú½÷\r]G¹õÚ$ÀU 7ôçåå6£ôIÇïÊ0D²®…‚RN»õ\ZóŠC™^ŸWòûýRnN.tÿ_ŽûºÄµ••U×tÀF7qk æææB¬)õEíííFNNŽ‚l0ËhT}J<;‘$|ã¡ìÉ‰$ëG%££›FŠŸM\\[99Åä|ÛådW¢Ó·Ì9sæÈ0Ê@ù<\nê]ÜÐÐ`€\nÚº»»a$ŒwºéÞq´°ª¢Ã%Ã ìd+#B\\›\"›Yùæ0øÍ2Ã­&S€öŒÖ_‡\r7å€ªª”ŸŸOÍÍÍÕÑh”Å1£Oœ)Ué»s‹ifÅp‹‘\'À}ÃKa©°oÂp±B\0G7À{]Ô›3KmöŒ™y·½@çÞÎ¤òûzûèèè°}[[›XÛ\"”%4Ì­°z€c:„ƒ±IÀþóÿ!»ý’S@²Ä×§»[‹Ö]6ç¸æmOäJNïEï¨É·7uuuìøñã\0ùä	Y±/÷cNýháæqHÔÒÅáSÈŠb3Š<Nz¢e[í.²yü$£ÔÄš˜ýº¦fè²/ƒq…äH¯4T«Þr€@Ð‡…úc/Aœ}£4/cž%Õ¸¬d»y†á»(9AuÐ;‹\"k¢$¨	[%e‚d!sÈ”ªÆ¸©J\\&CÕoo”A}so†ƒõÇµù§Zô‡µD¢vÁäô¨Œr·35Ò«§›Ú&NÙr@†¢bÄÉÓ‡	$’’‰hƒ·dFébL1¯éÀM²K¤·üqÅ|öøSùS/½ÑlcFiÙezSÖ	r9Vƒ+V$8 §Ÿc%F2©Éj0ðÀw~wøÍ«IË~½ÇP\0—;ø-sàþ<GÕ‰w(ŒÓ©sá_«qœŽhŽQ$×)\nY«{Bª¤t¸åcHdÊ–Œ÷oüÙ–÷WÌ\\j;P×BCt’<Äc /R—¶nÔÅ«·’/3“ÎzŸÜ¿äõgSUü€9¾ØGgÎuîý~(’Ð!©¹M@ªMfv_\"UA\n‰èIRzmÏJÂQ»¡%~òüë\r›ÆùmgÏ‡¤UE§Ðb§W­Z6*;ûûÁà»¿Ø¿ÿ·µõõ]Åe¿n<½p­Óˆ’ên=îšc{º(©©Õnw¥”Œ.Q\\*rÄÌÊþƒÒ…x’Âà˜	pØÁg°iU½ìä€Ø‹L®}ñÆšŠ‘™Ê©Ö°øÚ1  =[ž]»|y~Á3ñÞ^ÐT³D·ÎP,öñ”—_ž‡k¢×t`á³¯#Bèbâ 1mÐÚÆºÒ±ã×Œóe‡¼Õ)‘).™VÝíMÔÓTÏÊÛjAš#ÔoÈàÉIHÓÒ‹\nJ(ƒ42‹îá…¼ÀúzôéG§[?9]·ò­ÍëŽ*§o÷ŸY~¶«bõ´i“„8ã>ï‡G)ØÕEb« ®iý÷mÝ*öb\"×D!o)Oív·÷ðø;§Ý“_£Iø‚DÛ¸µ/)sƒ“]‘©´|,]NáÈ<ÒZŽQ~Ãkíiµhƒ$+V³KJÒrâ/¯¨fŽŠIEw”—ýeùì€¼¸ªžÈ¿ÅÑE]ú5µghgãI¨/‰=‹|ÿ>ež8{öW¢|„¼bî}²†ü¹y¬§«\Z3ÇTN?TñÕ‰)Ô·lÀX5l‡õ\nêÛŽSdñ†“$>#‹÷à>b†F%N•bÁ‹êé„tR¨`äh2´8ýa[-žö •ÙkùÔ’ÃPJ«QhÞ8œèh$j¯·Zá¬÷iÚ°÷<\'-º®fÛöZ±F=ØWÌ€Óíeíç>âzBýJÕ¬oª¨š ¸±,f‹I,½†2´WØ€óŸ¿Hc“]Ôi:hl±‡JŠ\n)Žá%8“††ž\\|”,ßK”õ£h.Äîß`ø\'Dç?…!¢ h•ôMëk¶tì5? Xõ«¢Ð]?¬¡EË–lsÑ»>xïÎ©wMËËv™á—ÍòLDÝŠ¼x-Q:êâ½”^?O¯¡›Vÿp4oR×¨X‰Àž9µ×hÔ°÷`øš!‡áŸ!ê±°e87½Â¾ÝöøªWg]ÎðAŠqÙ(Žöç[x8Ø7nþCË¦\rËvM)†VF[zAN	7âÍ>/ÜZd;ð˜N)R(—x,N>¹–ªóåâµ0´\0ÿkºT†n\Z5MZG}™séà;Mˆ^½p9Ã¯J%—›e+äîÌœê¬,Ÿˆ®J2Y¬H_(~I1á—…s<í  —\"ò)”Š\ZW©ÌoPõèïáËoõ¼BÔ´‹¨³BG½dø®ì•|ç¿m^úËjµ6½µJD~ÜŒ%ôñ‘Ý©ëæBŠÃM¿‹ôx¸ÈãÎ°ppB†ÒgÜ2ZðxÁTa¸™.›™^Ç°Y’Ã(“R:ð[’u#**C1È\\•D“€‚þ‰ï‘ö~7f,Â\\	–zS[™bþØÎçÄ±	ãoŒÝýãí,	qO¦²(·pÂß§NŸ\"¶R-=$ÛÁÚQFYai´I÷ø/ž*…h1“ Ú\Z² ò¶}˜þóõYT˜ÑNÑ±7ëpL¤þ`/:ÚëÌ`û†]Ÿ:!Œv¸}µ˜Ø™ú?ÈÜÜ_þ“¢Ú9s:M Q¼X²»Öä–.õçû|YÙ”árZÛ¢v›}>Ø¸N0‹a†p]%\rÃH†IE(ØÛr¦B\'Ý±¾ç{;÷ÕnZß<Èof/[IwüÆ¸vÕI<cÕ:òü\"ª|ì÷\"z²\Z\r¦rŠÆÒ’Ÿ/¦\'½Ö5¹åVŽ*ôøs<‚¤éñ~=é\\ø¬¥õíM+Z+«ª“_d”ž5¤Þ‹ÉÀÉ½üzÄû•Žÿ&$íÏ;_¥p\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(39,'sys','save.gif','image/gif',1691,'2013-12-14 18:15:36',1691,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:8375AB4E69DB11E0B4219AE9E4956031\" xmpMM:InstanceID=\"xmp.iid:8375AB4D69DB11E0B4219AE9E4956031\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8B7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>\\×íÖ\0\0ÍIDATxÚbüÿÿ?0ˆÊEÿ#L„¥zÉ“ÿ?|c\0 ÈÇoþÿõ÷Õâ‡ÿÁjÙX˜&Kexýê%@\0ÁõÀ\0ÓÅßÿ§öžüÿòãïÿfY;þ1}úö‡A\\\\Š¡wÝ†¿0²|üú›W¶¬üß!×ÿ\0¶åâƒoÿüþ÷ÿÛÏ¿ÿß~ú\r¶qß…7ÿM3·&³€T~ûù!gâ)f&F& þýçƒ€€Ãÿ¿ÿæ€€ŒœgtZ\nÜ5.çíüÎ\0v¦YÖ®­ÿÿyýÿÿ¨ëùˆÿ2002  &óœ½³/=üñÿÇŸÿÿ_9ðßÿ7Ÿþüï:õŒ¡kO|døõû#X×§ïR}Ô„Á¡ÊÀðŸÿÿ¿%ÓÏ2p°21üøtPÂZO’ÁFK\0¨\0Èûû÷/ƒ˜˜$Ã? {¸€Žûû÷Ã·o?!ñô60°þ1ðÉ5Â–g9›¡oÕEˆ#ÿ¥0}òãÇo0Íƒ~ 	ñÀ\0ü÷÷78€Ö\0ÃäÓ¹ù‘ü\0 WŠåØˆ•€˜h1+Ì`X€œÂÌÄð÷Ç¯ß§¦y®K‚C:{Ï‹÷¿ýoXõòÿ7`8}FfJÏ‰ÿ¯€áLàˆ%«Go~þßuáÝÿ½Àˆ¶+Øý¤—	êdu \Z†Àà¥ŸOßþ20122p²3“ßw`bx÷ù/ÃO`Xï»ô‰áÍ§ßßüf‡†3Ø@I`ðýùÃ0ióK ÏDÅ%:V!Ð ƒA¶‚¤öãgPš€Ä\0 g¿ý\0\nU×EÊàM¥³¯2|ø4˜¨à@Òè°A KN?:ˆU³‰¬Ãï_¿¾¹ä/Â€¿ÿþßæEceN`\ne`0“·Çé®ßÀä²èÿ;p<JÎ„\0\0p¤Oå«®\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:8375AB4E69DB11E0B4219AE9E4956031\" xmpMM:InstanceID=\"xmp.iid:8375AB4D69DB11E0B4219AE9E4956031\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8B7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>\\×íÖ\0\0ÍIDATxÚbüÿÿ?0ˆÊEÿ#L„¥zÉ“ÿ?|c\0 ÈÇoþÿõ÷Õâ‡ÿÁjÙX˜&Kexýê%@\0ÁõÀ\0ÓÅßÿ§öžüÿòãïÿfY;þ1}úö‡A\\\\Š¡wÝ†¿0²|üú›W¶¬üß!×ÿ\0¶åâƒoÿüþ÷ÿÛÏ¿ÿß~ú\r¶qß…7ÿM3·&³€T~ûù!gâ)f&F& þýçƒ€€Ãÿ¿ÿæ€€ŒœgtZ\nÜ5.çíüÎ\0v¦YÖ®­ÿÿyýÿÿ¨ëùˆÿ2002  &óœ½³/=üñÿÇŸÿÿ_9ðßÿ7Ÿþüï:õŒ¡kO|døõû#X×§ïR}Ô„Á¡ÊÀðŸÿÿ¿%ÓÏ2p°21üøtPÂZO’ÁFK\0¨\0Èûû÷/ƒ˜˜$Ã? {¸€Žûû÷Ã·o?!ñô60°þ1ðÉ5Â–g9›¡oÕEˆ#ÿ¥0}òãÇo0Íƒ~ 	ñÀ\0ü÷÷78€Ö\0ÃäÓ¹ù‘ü\0 WŠåØˆ•€˜h1+Ì`X€œÂÌÄð÷Ç¯ß§¦y®K‚C:{Ï‹÷¿ýoXõòÿ7`8}FfJÏ‰ÿ¯€áLàˆ%«Go~þßuáÝÿ½Àˆ¶+Øý¤—	êdu \Z†Àà¥ŸOßþ20122p²3“ßw`bx÷ù/ÃO`Xï»ô‰áÍ§ßßüf‡†3Ø@I`ðýùÃ0ióK ÏDÅ%:V!Ð ƒA¶‚¤öãgPš€Ä\0 g¿ý\0\nU×EÊàM¥³¯2|ø4˜¨à@Òè°A KN?:ˆU³‰¬Ãï_¿¾¹ä/Â€¿ÿþßæEceN`\ne`0“·Çé®ßÀä²èÿ;p<JÎ„\0\0p¤Oå«®\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(40,'sys','systemLogo.gif','image/gif',3277,'2013-12-14 18:15:36',3816,'GIF89a \0+\0çÿ\0©e­n*ºm²r.Ãt²x8Èx½|8¯€IÎ|¸EÕ‚Îƒ,Ü‚ Á†I¼‰Rµ‹^äˆÀVÖŠ3ÒBëŽº–f¾–[Â•[½–aÅ•VË”QÂ•bÒ“LÎ•EÔ”@Í•KÓ”FÙ“Aá’4¸™h¶™nà’;î\'Û”:è’+ôã”-ê“&ð’é“/·œuÎ˜Zá˜7ó•!·ž}¿žgÐœJÎœPé˜)· r¾Ÿm¹¡m¶¡yÉo÷—%ñ™#¼¢h³¢…Ä¡]ö—.ßœAÃ¡c¶¢€È dÇ£YäŸ4ô›0¶¥ˆÈ¢rñž&óŸðž0¹¦ƒÎ¦OÒ¥P¾§yè¢/Î¦Vöž2Í£zÇ¦n¹¨‹Ô§Rä£Tê¢OÄªp×¨L¹ª“õ¢4ó¥ È«kÄªƒÚªGõ£=à©Aó¦,æ¥]Ü«Aâª:ò¦5Ò¬[ñ¦=õ¤FÆ­y½­•Ð¬hÔ­UÌ®hÎ«†Ì«Œß©pæ­5Ø¯Qô¨Gô¬&À°™â«lÑ¯wÖ°eó¬9â°FÑ²eõªPò¬Gì±1å²@ó±)Ú±tÃ´œ÷­Zô±=õ°Eó¯ZèµCñµ+ß¶WçµKíµ=ß¶^Ý¶dÇ·Ÿô³Nã¸SÖ¶Ò¹„ó·7÷³]óµVÇº§Ø·—ö´dò¼:óºQö¸_òºXõ»Kê¹ó½Dú·nè¾_ó»aÌ¿­ï¾SìÀ[ô¿NàÀ€ÝÁ†ø¼pÏÂ°ô¾qõÁVö¿kø½zéÂvâÁ—óÂlñÂrÜÃ§ÒÅ²îÄlñÅ_÷ÂzôÇaêÇ€ÖÈ¶ôÆ|øÅƒõÉjÖË¿áÊ³ïÊŠúÇŒÜÌ´çÌ–öÌs÷Ê†÷ËõÍôÍ‡ÛÐÃîÐùÌ•ôÒ„èÑºóÓ‹ùÐžßÔÇöÒ˜èÓÂõ×”õØœúÕ®äÙÌôÙ£ýÖªßÜÍùÛ³çÞ×÷Þ­óÝÆ÷ÞÁúÞ»øà¶åäÛìäÝñåØúåÀÿçÐìëâúêÑóëãûíÚñðæîñíûðãöñïúñê÷óäòôñÿóæõ÷ôÿöïý÷öúùðùû÷ÿüûûþúþÿüÿÿÿ!þCreated with GIMP\0!ù\n\0ÿ\0,\0\0\0\0 \0+\0\0þ\0ÿ	Ø-/X*\\È°¡Ã‡#JœH±¢E‡Á uÈñŸ;WÖ¸‰I²¤É“(Sª\\É²¥Ë—0YZså®ã7`1sêÜÉ³§O–¼È\r´Çë§Ñ£H“þ„eO`Q¥P£Jêêß·e=ÓÙcnª×¯I•}æ²\\×’éü©‡¬Û·:]¹b™NŸ¿}îJÒS«ÖÜ¿€Uv•­°áÃ…íò­uX_~KžL¹²åË˜3kÞÌù0(PØB‹-_µÄFs›çß1#¤cËžM»¶íÛ¸sëÞ=\Z”¦iÀƒŸ†-ßi:¬„C±áÐ£Öê’õVÏ¥kßÎ=ú3ëÏºþ‹ÏÝw´óèÓŸÇw‚fê™Ý²Eß–¬ûøïßb¦½/)J’K5à8óËb´Òß‚6è z¬(áÌ0J°òà…b¨	%Ìtèá‡.AŒØpŠ&‚°áD-´èbãÌ3Š‹.ö‚hrŠ-|`ÑÎi§ÁƒŠ¾€hä‘H&i¤ç¨uŽJF)å”RBI2Xf©e–¡ÁÀ	4†Iã7|M &+”0L?@¶yN´l)çœtÖ¹e§açž|ö™%%Š#è ƒ†¢Hg&ê¢cj9 h%ü$<’ž¶Nºªé¦œvê©§)áé¨¤–Ê©\"Šô¢êªŸ¨ñè«þ-œ1?Ä (ÎœvÏ$/`€A›ÀsÚ6\\¬jì±È&«,² ò¥Ä²ÐF+m²_ø±Ëµ±øáCB Ò¬‰ªÀTè\noœÖN(Ð8Bòœ†…\"±ìÒ’\\«¯¾¦ÈF¾û^kJa\\ ’¨ð.Íª¥ÄÂK\"pHb\nÄûš\"	 a0Æ«Ñƒ±ˆâj‹à£–4\r€ë2Tê.ˆ9ûð…Ê-dË9¯èËÐD«RÄ6æè!	Ñ±8’ƒÎ€³Î9Õä¢„©0Ý°?J0=t$;l2Ì6çlóË!8DâõÐªè `5æ€SÍ0X\\aÊÚ^»Úƒþ\Zf„ÏiDðòË[o³A¢\"lÂ-¬0	_›8²Êä“Ã±Z÷è@yoÛf?ÕQ	å[+Aù*©ü°I=múÏ!a¤rº#E€Óº?ç(!ùé”‹ÂD‹=&\"@^cÀààºð8_z° ¨“8ó-Œ€\n_íd`F\"¤t_DÎþÔ£C÷klÂæí®ñH÷O„Ú}÷:ØŽ¾?Îñþ*J°®V?ëÄËW=¦{ßûA£à…‰ü8\r.l…¼W¡à§aÜ£Vðçµh	T‹œç3t!|qÆ\Z<ñœñeÃ˜*¼q>˜ƒžðDûœCOÄáz|*¼°	sœfþwˆá ¨–jì€?À‚ÿüñ‹8ÔÐ˜è[…&F©E-kà£@ ¿Ö”\0yðFCà¢¬ƒ/o€&‚àCµ\00ŒøÃ&‘A˜˜¡Ãð	%€ÏÛøÁ0A\Zä\nsEP#Î¨,(‚ç6ñÈ(žÉ€”F>ÐÁjñyŒôÇ=2€<èáhÒ¥–uzôÇ&Æ€G<fAqáÓ,C…Ç11|8D-1ýùãƒ¤ÂåZ©\ZPá„ÀÁ&°<šE—¤¢˜\"°\0Á}r‹]ôÇ^å‚X°E¨Ô!VÐ‚Ò¨0€Ã»è øþÌ\'Þ€Š\" Ÿ±T>¡ Fµl#\nùÄgÞY.4Â‡\0R=¶ÑÏ#daÈÃ¶…ÉojñïôGóž5=®E(¨§á uµìã‹-@Á0°w„BØô¦…°Cp\ZP›á|ÉE\ZpZˆ4€ÐI5-^ñÇÓ\0­7€UGÅÔ­@.	Ôp‡=ÈaÕ3Yï4¯àÙ™ÐÅ,œ³àÛÇF°<ú‘± Í¡\rÀ@T›‚§¡²)\rZª–MØ¨v¨\'<ˆpÓ.(¡\Z|Ò¥ÄÊQm†i*óG<¶\0.<Dv3:ù²\rê)MRË+bà\"wêÌ]T˜ª\'X´È`ÈþC!‘ƒ7è\0\r6íi!ŽZcDEÃLÕ*Ü´iˆBm±DµÈ#•šª‹:¤y˜éUîhS>Dp¦\r´±‘Œu‘Úê7Ðè\r;Îw×¶è¬ôG?ÆI#àŒ÷(BnóZˆ1¼I½éºøÛ¢o¨Xðx¡\Z§yÃ9³y&ö\0iÞLn7s…	]u”6€0¹`zø#< ë\"\rtñ›ïþèŒ“¶(•ešPÙÚ—wyÃNmš†øúãShBÌZsˆ¸èå&ØÙØ3ý\rH¸H\0E£RÜŽ8†ëRsäâ\rX8„þ7êÈ7„·qÒ=`ZÚ_òãØ€^\0a¾¡Exr–‹@û?,d\0xÃÁáÞðuz\0ÁX ‚ðu¾¯’n‹,|š9h9	ßPY<fá¢@ÜŽPÁ™Hãù1Ñ³aÊ\0POãŒ·Òˆ2»‡9ÖQGú4Ðsü¤m´£Žù(‚M«–|lã‡F(Ï¡L;ÖE‹èõ<Ð\0!ØHµ\0ÞeO#-\'\nGEßëª}&¤Ûa«¥‘”ðÝÖ9ƒ”-\"_ïA\Z}à\r2R;ÞÐ®÷òy~o¢r•ÏT‡È¢Ch5>Gí¡M¸\0@†Å¬„a4÷.çF	þÞ¦óÅì0°‰v4uÛ1˜í|˜¿ð_à‘(¼Å‡8GbïÂóL8QšvQP\0\0”«ìhÌ¥H*s\0@ªaÕàxá‡\0‚4`kEÍà“ø¹˜P è\r3ÈóÑY %(GoQ.P/L%À€“5‚\rd `W‚ï²|ëQðp²Û¦9d±€\0\0\0sŽy¿Õ;Wü2Ä;Q\'8½¢Bÿ(Ð70	™œ6Z÷€,¶@h@* j&jï¸ÀþˆŠ‚ûþøÈ?SHý224ÕÒÐxòÁÕWÀãúu„G¿§žÏýäg¢ÈÓB¥ˆ€ãuÿQ:æÞ`‚ó»ÿ“*€Æ?ºú²8€M7ÿû»û‹?êZ	Æ·+d îÀe/S¹\'y& `3ðb§j×€&ê0Ô€€Øø~=`Áxð&x‚ÇWØ\rÐIÐ28ƒ4Xƒ6xƒ8˜ƒ:¸ƒ<Øƒ>øƒ@hƒBÐ ‚\0;','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0\0\0\0Š–*@\0\0¯IDATxÚíYyl×}þæÚÙûàòZñ)RuZ¤,:±d)°’Ú‘,ÅI‘?·E¸q“¦HÑÔª]	5´ˆanÿpÜÆÝÚIkK6\"+’¬ÈŠ*ë¢$Râ-’Kr¹Ë]î9³×ýÍ,-Š!)9µ%ž0ÔÌ›·óf~Ç÷û¾÷]×a4-3ñEmäð¢4MÍáN»õ³xÁ[ËÁ6lßÉ:—¼môñÆŸbðøéâtg»nõÞš;–ºMM5]ÛÿÆ¡ªã,¿äîvV—Â;•ØùvÝææŽ•nw#›kŽ2Bï·é™Ð.¾0rd¿fóÞìWtèódõ­†Îˆ($º «ù;ÆýMwúQ=ü«§†È¸ì¢y[%Ä%÷‚¯h§qü,þ¹›Á–¯ç_Ž,–Ü±èÇÎZô\nx½£W.:ˆ|oG—±þðz²%üKG —«äKÓ“AÔ”gïõc;%^UÉJjáû¬¬Æ]»ŽÇ%X¸iX­”)J‡{09GU™\nÍ[ùÿzMcO‘ÍkàXåN‚íöÖ2]g0-Àfåàu±Ÿš?XMÏh2îbÑEnðw®A:F´ï—Xêª‡.ÉÐ‹9Ô=®öH`Tz/=w‚«ßF5%6ÚY2¸‘eV`¡[l` X•­øfð®:¸jüð:}(ä$Ä“#°ûPááoÏŽXQ±b}cãQ[iùtê99$FI,6f!×s\'‘=÷dƒcØà¡œý`6º?úa½iûÄ\rB¤óñZ/›ýÊõ‹ËÖ-¨Ûþ×XÕÜ:w>²~ym]t <Ü‹‰Þÿ@]ù­\'9~#*ë[ÌãÈ«‡P_–øtB¾à¡JÐ”älo!=6	-•\0“Ë@ËË ø†ÃqóÊá«°äsHÑÿrN…Ë9LÄÒŒ;ŸBY Ñ¼Ž††ê;NŽ\0DêZï¡ß¹QÙ@dAz¡‰WQå¾ÅNa…ëÎ-síq[KÈ4xM1à\'Kô©Qè™Äê{ W·B:FÅ\\þÈ´¢û™»P,ÑTaÈž¹x,1.H«CËŒ3¦Fz:ø–æÏ•ˆÂ€€‹];°áËß‡ÃS†¥«;p®çTÏ#Ì5!©×À/ŒÂg•æ<7™SjaÑR¸cà˜RîæRÑ‰´â‡¢ÙÀSÆÚ˜4œB6AÁÂh¨“Cf@¥ú\"¬ÈkzŽ“X»‚È¦à°Á2så€\\ä!+nd5\n4§…ËÂÅ¥aå2°òÊâÙAöçÃ#”!Rúä8eBÎ¨°?³–{M*>ñ*Ä“OÂ&~4 §úŒ_áÃP›w?.6cÝg,%b6ƒÑ£Ï£9ß9K¥QD«ô.®\r`Íž\'Jp\'¥‘\n\0÷íÃšíè=ÿÄÔËdÔâŒÁXdíŸÇª¶/!“Nbêä>,q¥Ï¹·£¹ýØœ`9\ZÕºB!‡ÈÐyD‡ßÀROdVf]Äl1=£¤9ô¥Ö aÓ#(sûQÇˆC)æ1Ôõ\n–¹¯Ò¨R\0D³vHÞ=hhÛ\n^ÁÕ4•4g¢€}\r¿L¦3’ÓÐÆÇKVcdš\"+›Î`(u…ê\r×t‰¯i3‚Óê\'–’¼§Þ4ŒÑR‰(jåß-´¹ë;Tq|c?G÷ëûÐõ_#z,!o±Ó!bùú-ŽÙé†¡§&‘–Ux; ˆVÓàŒ.CÎ‘òíÁ†í_ƒË[EQ#h”¥ì./\Z×ŽÖGŠs„Û	\nuN-3úŠJ\Z]ñuXwÿ_¡2°”LÂ\"Çtd¼hC]ÓZ4~æ;JÔÑ¼I”&ù±bó.XˆÄ„ƒW¼|ÑÉaØ^4müeùÈ2žo…´Ð(ÔQ\n8U™ÆºV„<zvï{O¢Ü!|rPí[6;W^§-\\\\zu“¯£>ü<:ÑlHÈ¿oÞ¬v¸—Þ‡ât\ZêHC‘\0<þ€y¯÷ìT!&êÉè;ÈÙ7²ŒÎ·¿ýÒ·0üî·Ñæ¨9¶¡eFäåFªÎƒ,£oZòbíýß„hw­Š¸pø ó1èE×á—Í‘žòjø×ï…”åK\nXÞ¶²‚Ebjj÷P9ù:ŸÀðÀE³_ÐŒùŒc:µw”Ä`lnÐÎKŸÏ#¾I¥[WOPªêŸ‹¸®xjô»ÁØ\"C† ãXõR\rcF…‚ô\'°8\\ð4w {ÅM¼½_ërY*_ø 4›®â^ÒJv+Ùþ+íïC`T,óÄ05özXâ,¨à¯Ð˜ü<‡}9¡V›½Të‚=¨)¾‡5SBùMÊ€¨ªk‚¯¬\n“ŠN~!2¼÷î(«n€²ñ„Ã]ÈÅ.#~úEdº­ðé—aÕ(+â9£À-Œ\"óŒFž£âì1`Ëi¥ëªü0Î%”™0ýn>Vj™Ékç‚Ý‡<ç‚E™¿Ôæ—AZý„Ã0/ Né†/Ý§á®mSd.A—µ´JÍwm5“õ¡R:GÌL$\'•HƒJŒQ”ºHI¥G­’„|‚ %ƒSq~‚0T#1\0n^£ÁnÔ2)ê/\rv1SˆL™1à)^ô£ZìÂøàk˜(¯Beí\nT×Sö†L5bðâqh½Ý$ù¤y0}C‡˜Ðb¯€}ÛoŠánäŽ=MZEZŠl^8ø b%a-OÂ?ˆÌoƒMöÍ]nŽö€Ñ(I‘Û¨Ð†„8”©yÏ+4îÆ†­»ÌóKSÐG®À¦K`ßDvÓý°9(;\Z?-†h)‰¸Éso¢™¢G€|.=“‘TdÖŒHFäÁ:¨4~L^‚PZý¼||1•ff˜!LYÎ>“ÏÅ™ì&±ËÛf`^3ÄœyÞb?‹ð™\'Ñsi5òîMhZÕ_u\rìÄ×Ü»±¥kyk/ª´ÑÅm¹P§xÏwÁ.ûXÄU»‘¨û*TuqèÖ|\rLM;	Þ\n¾¬ÅÖ¯CÓçF‚;Ûþ+gÌsWfÝ×!µžgl&Õ)ÀŽQÇ6”œaãÂôÈµˆª‘/ >1`ž¯Ø¸\rn‚.³ÖÀ;eŽ³êYÄ&úM6dfXõ&äˆ¶jirV¨€‰øJ4þÁ3hÿò³Ò¾HìR[ˆùÂ®ý-ÁJEý*dTÿ,[Tk0£ŸD%±E¯>†¤ìÂ çï µü\r˜dÝO\"òóGpþ•ïb:4DŽeQNUô´Ü˜ø,¸“Õ°mÎ2»Øx¢/¡Ê3sßêš›OByë|MX‡pZCµ{Öçn*ÐS\'ŸC¦öÇpRÔ´ÞÆ—­E°û$±‘«ðVÔbmÇN3ØÝsæéS³óPq^Ü%-Í¨«wûÌ(í~Ëõ‘™×Uá›:\n)ñ8½åh¿ÿœÎÆÁMœ@Ò@ë}¯¿´:]”ÓD9sÐÊ¯s\nž\Z”aa:1=6ˆÊ¦Vøk—áüÀ^Œõ¾E,NCyÇŸÁå¯0‡ÇÏÁÀ$·+÷ì¤ÚeE¸<€‘wþF²²,¡lf3\nRøwwˆ2r–Ö‡¯ÑÀðåãðrlíß\0¿þÁØÊ EºÿÕÓ¦/ª—jÒÔ0²9Œ{îNJcö®új·<_U|þjø¶~iîü™£—ÿÖ®çáDâº]\rŽÉc˜\Z@EM3ŸA1Ÿ…7tdÎ~MM®Ã\'ÿM[ÿv\"m»ÿYy/lTèY¾ôÉ§¢%uh†AHæ¯\røa\n	óQn=Š#ÿ@Qð*ëZÐ¶ý‘ëx(¸Á­ý—;÷üD*•1t{ë¶}Uä@×W_D*C•ÕI,°ÊdjWN„¯8vC‡pOì^ò=­0WçÆ;Áø×ÁÈæH÷q„ý#šW5ÁºãYÂb·™5Œ³Eg#Ô>Âõé1ðË\0GZÁ¸W ±yé!Hê˜ù­­.ÞL7†º1Ñ©øÌÈQŠä³$èÆúÐwügð]z>%8ï…zWÕFš×›´6ØÖ¾—aAþ:&ÇÅO£·gµ!bÌ­HEƒ8ÿËEYß‹5ÑRÍÒDˆu›\'ÍÀ_y‰œ‘4µ¢ŸæŸ8…xÁAÏñ–„½«”\"gýæÀé\" ÍDvžØ	\\¬€@`sx¨þ°H\'\"øõOQÕó#8ôôâÎ šÇd^ºGW2óÜ¨~eŠÄ²H ù<Äú8öü»±¤{mLŠð|ú•=ðÛ²HèL\n ñ.Ä®v¢Ñ\ZD­ÁHsžFžuAˆ¢r\"˜|Š´IÖ¤º<¦wÓl°íÇXºz\näÄ~ú8ÖJû±ÐLDn‘eœPXt‹‡X’V•È(©9bP!wf¸\0E.-<åˆ‚ç+á°›H‰bf”Hï(\"·À>9OãíP8Íé¢9‰Œ(2}“D[¸qvâ—qS-à«`9¹Mä\"Êª%fE×µ1éð ”B:Õd“„=ûP-•Eä¸›)ãƒDÍàä7—…á%Ñù°zU›Ù\Z¸€Fù×XÌíf¦ñ¡Ò‘\rß\0·ðª#‹Þ7Œi$*nJÿ•sNcI	ýn‹‹ö*B”Šµ(Nœ»ù:UrSÿýM”íþg*ºNÄ†. ëµ}h(×ƒ¡C7?ñ“““@wîÞõ$,kšÙ ÉçóHœù\ZõOg©üV4®j=9dýŸîâúßÞ¯ÊÑ›élØ¦N`ìùÍ¸Jä¦ƒXíW!p·~‡­AëÁÐ±#6·œ M€šCnð]Ô¥OþþìÞl‹›¾õÏz\Zˆ[ž>›?þý6U¾yJú­9øAÂ¦jQó‰7¯·ç™ßÛ­tÞê‚Øñø9Æ×¼ß¬ÐÂò‡Ú¹Ê5;ó<·__„.MšîN»…»ƒFmvÀ•¯„¸ù;»˜²–Fÿÿ2n^Õ\'‰†®\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(41,'sys','view.gif','image/gif',1019,'2013-12-14 18:15:36',1019,'GIF89a\0\0çƒ\0\\AbL{tƒ~‚‰§}WŸc®€Lˆˆ˜ŒŒ”ˆŽ—Ž—Ž‘—“—‘– ‘—ž•–œ•—¢•›¤Õ‘0Á“e×’0Ø“/˜ž¦È—_ßš3Ñ_¾¤Œ¨«µ°©««¬¯¦®·Ã¨Š´ª«¬­±Óªa¬³¼×®c­´¼²²ºÌ®Š¯µ»Ò³qµ¶¹Ó´s±ºÁÚ¶mµºÀ´½Ã´¾Äº½Å»¿Ä½¾ÅÕ»£¹ÃÉ½ÂÆ»ÅÊß½•¾ÆË½ÇÌ¾ÈÍ¿ÈÎ¿ÉÎÆÈÉÄÊÌÂÌÐÉÉÍÃÌÎÃÍÐÉËÐÄÎÒÅÎÓÆÏÓóÌwÇÑÕÈÑÔÍÏÕÉÓ×ÐÐÖËÔ×õÐzõÐ{ÌÖÙÑÕÕÓÔ×Í×ÚÎØÚÕÖÚÐÙÛÒÚÝÑÛÜÒÛÜÙÚßÕÝßÕÞßÖÞàÖßà×àâØáâÙâãÚââÛâãßàåááâáâäÝååÞæçßççàçèàèèáèéâêêãêêæêêïèâæììçííðêåèííõìâëððìðñíññóïíññòöðêôñïöñíðôô÷ôñóööøùùÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0¿\0ÿý+£\nD*\\¸d=xä°qf¡À-j8Ñ¥H%2öXÜÀ‚‰š:X¾déòcŠÅ7®ÌÁãe\rš4cTXt°ã.mæÈ©#§ƒÅ=Œ\\!34Ï8!,Bx$Š˜7w	òÄ¢•Cª„q“Õ‚&ÿÍ° ›:R\0ÃNÚ<0Ñ„ƒ\nø¤µHCâVèçD‹\'&ÐY,Ð‡H$ ,P†$\0pØ§@\0\0;','GIF89a\0\0çƒ\0\\AbL{tƒ~‚‰§}WŸc®€Lˆˆ˜ŒŒ”ˆŽ—Ž—Ž‘—“—‘– ‘—ž•–œ•—¢•›¤Õ‘0Á“e×’0Ø“/˜ž¦È—_ßš3Ñ_¾¤Œ¨«µ°©««¬¯¦®·Ã¨Š´ª«¬­±Óªa¬³¼×®c­´¼²²ºÌ®Š¯µ»Ò³qµ¶¹Ó´s±ºÁÚ¶mµºÀ´½Ã´¾Äº½Å»¿Ä½¾ÅÕ»£¹ÃÉ½ÂÆ»ÅÊß½•¾ÆË½ÇÌ¾ÈÍ¿ÈÎ¿ÉÎÆÈÉÄÊÌÂÌÐÉÉÍÃÌÎÃÍÐÉËÐÄÎÒÅÎÓÆÏÓóÌwÇÑÕÈÑÔÍÏÕÉÓ×ÐÐÖËÔ×õÐzõÐ{ÌÖÙÑÕÕÓÔ×Í×ÚÎØÚÕÖÚÐÙÛÒÚÝÑÛÜÒÛÜÙÚßÕÝßÕÞßÖÞàÖßà×àâØáâÙâãÚââÛâãßàåááâáâäÝååÞæçßççàçèàèèáèéâêêãêêæêêïèâæììçííðêåèííõìâëððìðñíññóïíññòöðêôñïöñíðôô÷ôñóööøùùÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!þCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0¿\0ÿý+£\nD*\\¸d=xä°qf¡À-j8Ñ¥H%2öXÜÀ‚‰š:X¾déòcŠÅ7®ÌÁãe\rš4cTXt°ã.mæÈ©#§ƒÅ=Œ\\!34Ï8!,Bx$Š˜7w	òÄ¢•Cª„q“Õ‚&ÿÍ° ›:R\0ÃNÚ<0Ñ„ƒ\nø¤µHCâVèçD‹\'&ÐY,Ð‡H$ ,P†$\0pØ§@\0\0;',NULL,NULL,NULL,NULL),(42,'sty','login_form_icon.gif','image/gif',2059,'2013-12-14 18:15:36',2059,'GIF89a0\00\0çÿ\0j\\Aq`AtdD}bJteJ„bGƒbLxhH‹gM…iR}lL|mR‚oIpU’nS‚sW‚u_ŽrZ‰vP–rW•wZšvZŽ{T{O•ya‘{a~]Ÿz^’X•e~a•ƒa£c™…^›†Y¢ƒe†kšˆfœˆa¨„n£†nœ‰h¦‡i¦ˆpŒ¢Žf«Œn¨Œy«u¥‘j¥’p”–“±‘s©•m°’z¬•z¬—o®—j¬–™›˜·—y±™~®›x¶˜°›sŸœ²œ‡µ‚´Ÿw»œƒºžŠ¢¤¡¶£“»£ˆº¥|Á¢ˆ¦¨¥¼¦~»¥Ã¤‹°¨¡¿¨y¿§ŒÇ¦‡ª¬©³«¤¿«ˆÁ¬ƒÌ©„É©À¬œ·¯¨Ä­—¯±®ª±Æ²´±É²ƒÇ²‰Æ²Ñ¯Ç±›»³¬Ó°ŠÍ°œ®µÊË´…µ·´Ìµ†ËµŒ¹¸¯Éµ¤²¹ÎÖµ•Òµ¡Ê¸›ÛµŠÉ·¬Á¹²¹»¸Ï¸¢Ñ»’Îº©¼¾»º¾ÍÔ»Ÿ·¿ÔÞº”Î¼±à»Ö¾Ô¾•¾Á½¼ÁÃÊ¿²¹ÁÖÈÀ¹½ÁÑÀÂ¿Ý½£â¾˜×Àªé½“ÄÄ»×ÂŸÙÃšÄÆÃÍÅ¾ÚÃ­èÂ–ÑÆ¹ÜÆœÚÆ¢åÃ£ÄÈ×ÜÇ£èÄžëÄ™ÈÊÇÞÈžÇËÛÓÊÃáÊ íÇ›ìÇ¡áÉ³ãÊ®âÌ¢ÊÎÞÍÏÌîÊ¤ìÊªáÍ¼ãÏ«áÏ±ñÌ¦ÍÑáçÐ¦ðÍ­éÏ³ÒÒÜÚÒÊçÐ¹ÒÔÐìÐ®éÒ¨çÒ®òÏ¯éÔ°ÞÕÎïÓ±ÕÖàáÖÉîÔ·ìÕ¾é×¸àØÑòÖ´ØÙãíØ´ð×ºîÙÈäÛÔóÙ½ðÛ¶ÜÜçòÚÄïÜ¾ÝßÜÝÞèòÝ¹õÜ¿ßàêíßÌÙâêâàäõÞÇçáà÷ßÈáâìñáÈíáÔßäçâäáëâÛøàÉöáÐöãÄäåïòäÑíåÞëåäøãÒøåÆéæëæçòùæÇãéë÷æÎõçÔèêçìéîñéâæìîñëêïìñéîñíïëñîóóðõíòõôòöõó÷ðõøøõúò÷ú\0\0\0!þCreated with GIMP\0!ù\n\0ÿ\0,\0\0\0\00\00\0\0þ\0ÿ	H° Áƒ*L\nÉBÜðZH±â@^+L\0±ÂÆ\\ÌYyÔ*t,’%Ë#ØHÊü—Ã„\n)OØXr&N–\"FÞÍ©eÊ\n `üxâò:C+bsP\0ÃŠ¬züaŒQ)þA@CÕ­`d\"ˆ\0£È6L›P‚M±€5Ë–\rµpÙšÉR±¡Ý„H(ŒÊ»7¹sçÈV4áÏa„H<,>¶7\\¸È’›óPèòA-.FÝâœ\r\\8rîÎÆ#é‚ß¦`QÝ¬óãs€Es›à<3›67öìyö&FÅ	òµX/_æ|›ÝZô+úÀ_‹ªþKãÛ\Z_e±0y\'Xj“«^ÇÆ“o&\rX*nëÎã´¾´ÿÒ(L,ªäÍ3Þ˜±ôB1ÇCŒ.£PCÐ;¨$Ò‰-¶tI‚aÅC	®è¢K/ºÄ’Ê(óôÌ ƒPÄ;‘*ÏÐUËˆ£¸â£+£prÇ@ÞèÑÅT‰Lì0ƒ- ÅË#Š2Š(œPbFi%ò…B\rdÇŒ¶Ø•9C4Ò%l6È\rÉd‹AØq\Z,D’ãPó0’‹øá7Üñ@ƒ¨1C”Î@*QÍƒ)NA=ÜAÊ¡ÿ¨AÅ	±C\'QÅCM0“HñÃdL²©@þ_PqDBLÌ@êPæœšêª­’’L=ÿ|Ñ	uaëLìL37Áø¹*Œ¬O=ùtñÅ	)zkEðLÃÌ4Ú@“N2yÁ+-éÐÓÏ>_¨a\'BvŒZ;Å0£M:ê¨=õÀ“Ž5éì›O?w¡!	é1C$Y3K1ãÈCO>úðc±?þXÌ?ýø#løÂD\\aòÉW4ñA	2°„ùb3ãì{OÅþìÃ1Á<œ‚9°¡I+Â³K.°ä’KÑ­<F\r`;}ø2;òä³1Æ:cìµ×)„€CiàaI.Î´ãÎ6Â°	a4ƒR4Ë+àîËÏþ>|÷í·ß?çÅ\Z‚xK4ë Í.¡¼\rF1D]<Ÿ|«\rµ\ZóSqæœ‡-8á–°bŒ8â,“Kãx€!7Ý1ó\n4ÓLæúÔnûí·ÿ<v\Z‚XËè¥Ÿî¸Ü’TÏ,¾@£¼:þÜŒûóµë½ÿNºé¨Ç=wÝ¥óI1ÊC3N?òàýóÒóî»1èˆããÃoOÐ,§0þ4üÐ>ü÷ïÿé„ï–AºÅ¡Nu‘ãÞ?2q\nmxË~›F>&HÁ\nR0l8œ\0a±t(~@ ë’4¼ÁÓ€3àábPë0Œ¡1H¶ÂqÐƒÑ^êˆ§@0c×h0Ä) }ÁcãÐ†§Q&Æ®\"Ø]õ€çŠ°‡éÆ,2ˆ.zqo@\Z¼@Fj Š\Zô.:øÁÆ…‡ñW7¬Q_øbx´c1> ¶&€ÁlÖ‡1t¨½šæhšp6àah­ÐÄ#ðÀ†”ÁÀbX4 ´\0Dh‚Ä 9ˆÁ\nM pÐ0 \0·9p\0( ¸|\0 ð€,à—\n8€\0\0€â€BŽ8DÚP†-T\nÐ„Bª°…2ÔáŽ\0Å@\0;','GIF89a0\00\0çÿ\0j\\Aq`AtdD}bJteJ„bGƒbLxhH‹gM…iR}lL|mR‚oIpU’nS‚sW‚u_ŽrZ‰vP–rW•wZšvZŽ{T{O•ya‘{a~]Ÿz^’X•e~a•ƒa£c™…^›†Y¢ƒe†kšˆfœˆa¨„n£†nœ‰h¦‡i¦ˆpŒ¢Žf«Œn¨Œy«u¥‘j¥’p”–“±‘s©•m°’z¬•z¬—o®—j¬–™›˜·—y±™~®›x¶˜°›sŸœ²œ‡µ‚´Ÿw»œƒºžŠ¢¤¡¶£“»£ˆº¥|Á¢ˆ¦¨¥¼¦~»¥Ã¤‹°¨¡¿¨y¿§ŒÇ¦‡ª¬©³«¤¿«ˆÁ¬ƒÌ©„É©À¬œ·¯¨Ä­—¯±®ª±Æ²´±É²ƒÇ²‰Æ²Ñ¯Ç±›»³¬Ó°ŠÍ°œ®µÊË´…µ·´Ìµ†ËµŒ¹¸¯Éµ¤²¹ÎÖµ•Òµ¡Ê¸›ÛµŠÉ·¬Á¹²¹»¸Ï¸¢Ñ»’Îº©¼¾»º¾ÍÔ»Ÿ·¿ÔÞº”Î¼±à»Ö¾Ô¾•¾Á½¼ÁÃÊ¿²¹ÁÖÈÀ¹½ÁÑÀÂ¿Ý½£â¾˜×Àªé½“ÄÄ»×ÂŸÙÃšÄÆÃÍÅ¾ÚÃ­èÂ–ÑÆ¹ÜÆœÚÆ¢åÃ£ÄÈ×ÜÇ£èÄžëÄ™ÈÊÇÞÈžÇËÛÓÊÃáÊ íÇ›ìÇ¡áÉ³ãÊ®âÌ¢ÊÎÞÍÏÌîÊ¤ìÊªáÍ¼ãÏ«áÏ±ñÌ¦ÍÑáçÐ¦ðÍ­éÏ³ÒÒÜÚÒÊçÐ¹ÒÔÐìÐ®éÒ¨çÒ®òÏ¯éÔ°ÞÕÎïÓ±ÕÖàáÖÉîÔ·ìÕ¾é×¸àØÑòÖ´ØÙãíØ´ð×ºîÙÈäÛÔóÙ½ðÛ¶ÜÜçòÚÄïÜ¾ÝßÜÝÞèòÝ¹õÜ¿ßàêíßÌÙâêâàäõÞÇçáà÷ßÈáâìñáÈíáÔßäçâäáëâÛøàÉöáÐöãÄäåïòäÑíåÞëåäøãÒøåÆéæëæçòùæÇãéë÷æÎõçÔèêçìéîñéâæìîñëêïìñéîñíïëñîóóðõíòõôòöõó÷ðõøøõúò÷ú\0\0\0!þCreated with GIMP\0!ù\n\0ÿ\0,\0\0\0\00\00\0\0þ\0ÿ	H° Áƒ*L\nÉBÜðZH±â@^+L\0±ÂÆ\\ÌYyÔ*t,’%Ë#ØHÊü—Ã„\n)OØXr&N–\"FÞÍ©eÊ\n `üxâò:C+bsP\0ÃŠ¬züaŒQ)þA@CÕ­`d\"ˆ\0£È6L›P‚M±€5Ë–\rµpÙšÉR±¡Ý„H(ŒÊ»7¹sçÈV4áÏa„H<,>¶7\\¸È’›óPèòA-.FÝâœ\r\\8rîÎÆ#é‚ß¦`QÝ¬óãs€Es›à<3›67öìyö&FÅ	òµX/_æ|›ÝZô+úÀ_‹ªþKãÛ\Z_e±0y\'Xj“«^ÇÆ“o&\rX*nëÎã´¾´ÿÒ(L,ªäÍ3Þ˜±ôB1ÇCŒ.£PCÐ;¨$Ò‰-¶tI‚aÅC	®è¢K/ºÄ’Ê(óôÌ ƒPÄ;‘*ÏÐUËˆ£¸â£+£prÇ@ÞèÑÅT‰Lì0ƒ- ÅË#Š2Š(œPbFi%ò…B\rdÇŒ¶Ø•9C4Ò%l6È\rÉd‹AØq\Z,D’ãPó0’‹øá7Üñ@ƒ¨1C”Î@*QÍƒ)NA=ÜAÊ¡ÿ¨AÅ	±C\'QÅCM0“HñÃdL²©@þ_PqDBLÌ@êPæœšêª­’’L=ÿ|Ñ	uaëLìL37Áø¹*Œ¬O=ùtñÅ	)zkEðLÃÌ4Ú@“N2yÁ+-éÐÓÏ>_¨a\'BvŒZ;Å0£M:ê¨=õÀ“Ž5éì›O?w¡!	é1C$Y3K1ãÈCO>úðc±?þXÌ?ýø#løÂD\\aòÉW4ñA	2°„ùb3ãì{OÅþìÃ1Á<œ‚9°¡I+Â³K.°ä’KÑ­<F\r`;}ø2;òä³1Æ:cìµ×)„€CiàaI.Î´ãÎ6Â°	a4ƒR4Ë+àîËÏþ>|÷í·ß?çÅ\Z‚xK4ë Í.¡¼\rF1D]<Ÿ|«\rµ\ZóSqæœ‡-8á–°bŒ8â,“Kãx€!7Ý1ó\n4ÓLæúÔnûí·ÿ<v\Z‚XËè¥Ÿî¸Ü’TÏ,¾@£¼:þÜŒûóµë½ÿNºé¨Ç=wÝ¥óI1ÊC3N?òàýóÒóî»1èˆããÃoOÐ,§0þ4üÐ>ü÷ïÿé„ï–AºÅ¡Nu‘ãÞ?2q\nmxË~›F>&HÁ\nR0l8œ\0a±t(~@ ë’4¼ÁÓ€3àábPë0Œ¡1H¶ÂqÐƒÑ^êˆ§@0c×h0Ä) }ÁcãÐ†§Q&Æ®\"Ø]õ€çŠ°‡éÆ,2ˆ.zqo@\Z¼@Fj Š\Zô.:øÁÆ…‡ñW7¬Q_øbx´c1> ¶&€ÁlÖ‡1t¨½šæhšp6àah­ÐÄ#ðÀ†”ÁÀbX4 ´\0Dh‚Ä 9ˆÁ\nM pÐ0 \0·9p\0( ¸|\0 ð€,à—\n8€\0\0€â€BŽ8DÚP†-T\nÐ„Bª°…2ÔáŽ\0Å@\0;',NULL,NULL,NULL,NULL),(43,'sty','posweb_header_background.jpg','image/jpeg',765,'2013-12-14 18:15:36',690,'ÿØÿà\0JFIF\0\0H\0H\0\0ÿþ\0Created with GIMPÿÛ\0C\0ÿÛ\0CÿÀ\0\0\0\n\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\04\0\0\0\0\0\0\0\0\0!1A\"aQSq#b‘ðBR’ÁÕÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\"\0\0\0\0\0\0\0\0\0\01!QÿÚ\0\0\0?\0ö!€bi¾ì½bÏ4·fD>L5±4²n)ôkÅ\0™¡ÎPW¤Ãý?@’\ZI©ˆ±ó+¶XhÁ\0Òµ²6\0ØŠ[$@ƒ*&*EC‰p­—½ÓõDY!À-—HžÀâDLÔÏß4R\Zè©¹÷AIÊ»4Ž\"1Ÿt	¿D€ ^Þh\Zs£<îá™)ã\"$OÌï¢xHµÍ\n:±bÛD¶6½Òa9÷sQØòÝËÖVðWhó?¸òÛ»¶Ð)âÿ\0I„eÝíGþrOñ¾ˆû3úq“tÏ$L&._Jä¾¸â[~Šõ¯ù?‘@…îÜh`@¿k.\n‰\\¼mmw?Ùªµ6=¼B†ò2!Ï™¨o[f¦tÅæ¡ú@2\Z4¶Nr{gOZ\'8zÞ×1mDÆ6OÄõ¤ •äM	{ÆpŽ±ñ‡ûYp’5óŠ*u‰“ñô£”böE£Y7Öü\\×GO£Wb°Þ\' èËˆ,o¦-ŒCÞF)¯¨»\ZÑÏÊE†³0)—¨(F‡°Zm‡²£(ÿÙ','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0d\0\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ö*(¢ºŽp¢Š(QEÎm_zÛß¶ÿ\0â¨¬ìÑ]žÎ=ŽnvC¿ÞŠ­¾ŠÖÆw+ù”U_2ŠÓ”›•òh¢Š²ÿÙ',NULL,NULL,NULL,NULL),(48,'sty','top_background.jpg','image/jpeg',28986,'2013-12-15 02:25:28',1130,'ÿØÿà\0JFIF\0\0H\0H\0\0ÿá\0ŒExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0¬ \0\0\0\0\0\0\0\0\0\0\0ÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÂ\0\0¬\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0ú¤\0\rDUóç²å¡¶à\0\0\0\0\0\0\0\0smñ\\F8}\n*ÖÛåY§ŠÊóØW(Ì¬-*“9ªLã\0´ªS™X‹\nÂÂ°´ªK\n‚Ø¬,š‚Â°ÌÀNsX‹\nä²0‚Üè„·*“.f€—+ «’N\"3ÂëR—)FwqÛˆ¶8å3M™ÒŒ¨æoË}ÞŽ¹™ãRZ”ðKæ­z›t»U,½;–¶*±9cFHÌ²“<LŠpn¥hŒ«ŠgÊ2i!=ê>{úçœpâ¾“ùÇèJÑ–øçín“[Öy|ÛÒy¾[ÑÍCœÓhß#Ïç\rÅœõèêÖä);½^¯‰ˆî|“Þ|7ºxÇ³ÞåvW®º0+Í€„1! !HA0LH@I@A!„LäVgA&Q\'8³>¦®+˜Ï»Õêñ«“OCs…Ýùþ§_V_ï|õš–§.ß­óK&þ¯¬Ð=~¤óÍrûÕé\'»rï<Ý©·ÏO\\NýN?c3“›ëŽ»=¦kê#wbtL<¢·äžhl[$ÝŒL¨Åš\"dH#¢Ýz¿}cÁ¹ù{zùSÔæ}Jž€×~uq.u~¨ˆÐ½°£ès[gÃœÞ^KG_@CœñWøÌyû?qù3éDõ•Ù_GFŠ`¯0\0L0ÀL\0L0\00\0\000\00\0IfLYŠiŒ…1©ÅSæ{ï&ìmÃÝWËW³˜)ØLköìG6ºªßÇO3WNêb¼í]Vhãsëu©çgeF×ôÝ.½lûº÷<æí3ô¨àZ‹nô;:zI2Œ&è²oŒÕY­(….ó¾íÿ\0ªì¾Séz\\ä½;®ÞsO§æWƒúü	Ã¸Ãj·¯çï |,yAómŽ8}BWg_h\0\0\0\0\0\0\0Aãü>	òqz¶x§µïÐWezi£\"kÍ\0D0\0\0\00I0\0\0\0LL\01!\0NXÈÎKDÞúë”bEsÏ¦þ%°ömO8y£ªÚñÝe[»3µ’Ø±*,6†µöè¶ÛÚoI«Öû$r}zN\'šÖuŠN|í=W#êf(Žfba9çNI³,ØÕo[E§ê‘ò»|û¬[có>ÎáÜ°ûŸ—nÅí½Œd6\0/\'Õø†ÛÔwZ,p÷NÃç&º:¾„]€\0\0\0\0\0á¼¾2Å=¦©Ž~^ãÖ>böÝú{™Smx#?)èH„AáDdvÑ vQ‘ÑxD% vÙDDáD„½:ù6Î{w;Ò¾ã9ÛSzÚhÇp’QllÕf—èRPõšÈ67\0•»}–Ï)\'VËÌ:$õ§|ÏXsó»ò~¡Å¤[ª¼Õ»]Ée„&o²³TÅ5Ø­O=4ú}œž©´ñŽŠtí­Òµ^}Œëƒe–ªSêàiêò¿2ý_ÇáÏæzn«ÇóÅ?VË’¦~›×|ûºÓo¡ðî&ÖúÅ?þ‰µûG¸?ž«›;šÓµÒy•U®ÏÏ»Ó<´»Ï*÷+éæOhú}vi7Û_/ŠLü[ÅÁ‚€¼ /’ò€¼ /ŠBñp` /(Åä¼ /(Êò€b\nò€¼\\•ÂòŒM¦ã•èî9ý¿ µÓBÑƒ´)ØñõÙ¢êtÝ[jÆŸ¾<g3Þh­Õæz†‚täŸq(†·<+hîöyÖF=7AÄÍqíòå6ßÎ’c=Ñ«ºeí¯1Öx>±Uùüï¡G!ßyÏÓùncT{^%ÙQx¼—‹‡²§¸\0Qt‡	ä_Lçó¿	ôº5§íúí}í!¦Øx·¶‡ë½—ˆÏ/õ^¿ —‰ú÷NZåvÐ\0u|ŽVŒ¼&Eàd\\…Ái‘pbV‘x¤`ZF¦LÂä$Ä­d\\“äa`dXYÖÊ{49í»£TÆ÷]ò½ZÊØËÀ¥Ö§î,ËšT}M;8mƒ]~]Ç#ÛkªØÍG|ºüµB1Íöâ‡å|øö%´ò+ÚÛ¿Æ>¥\nÓáúìyO¦h¼ÿ\0K›ËsÎýÆ4,[EA¡`dX=nU§OcU:Øo£Y˜ÕšfÎ‹W~¢[T¬uu3ƒWéð6ËÂfýY)cEØ]ŽÉÝUPuÍNâkâ‘DgóÌE2.JÀÀ¸2,Jð3ƒàÀ¸1+0¸1+°3É|¬@À¸0.ÂàÌ.ŠÈÆJƒµcýw’i©Ùî\Z¿2¿{ØÑ]ÓÇ³Ç_\n¿‰Ø©LMÕ£iœïªrì\'¢¯?ïÓLlð²¾kk¦(Ëzç£U¥bpcôëz_óZžoµô/=ä&üÝ(¥~s0¸«\"Ò1…å§Þ@×è¸îÄ*\0°\0\0\0\0\0\0\0\0\0\0\0\0\0X2ù¸ \0\0\0\0\0 \0\"A$‚°@\0\0\0\0@@\0	€@à	ÕêBÛ/¼¶¶yà	\0B\0M€K0\'¢Ê\\\0R@€Lê	ÝÐEv\0FY@\"@A\0Oª»¿ÿÄ\01\0\0\0\0\0\0 !\"013@#$4AP526ÿÚ\0\0ø$^Ä&Ÿ‘A½?ØOä«gÃ¶9^ª<$ÝYŽÅÅÅÅÅÅ\rÔ;7PìPìPìPÝC±C±C±C±C±C±CuÅ\rÔ7PÝC±CuÅÅ\rÔ;;;;;;7XíPìP%˜ØÆTÌl\rf7P-‚· JPÊ³õŒ¬eaÇ–Ñ6çade@Ôd;Ö`ÖdF˜‚àØ÷Y0=ÉƒkF<¢æéŽÃ	Y˜ùŒ}F2dÔ2¡²š‡Ö¹\r–;7XìPìPìPD“\"õ¸±Lr^šÌ~ÆYãU°ç\\m›˜KvÅ1’ÔW?OþFFFFFdÇ`ß#`JÏ¦rGcoL6$3-+$¯#LŸP{-6mGm-øŽµU:V^ÒŒý	åâ(Ó…ý ÈØdgå°Aú±·¡ƒû-Úªw)w”ÈetñÞ¨¥¦¸UšæYôÈ…\"k[Þûl‡ä7‚²°‰6Ë2ÖÀë£UÎ+76ª¬(Öî{Ý±Õµæ’«jmš¶ç›õ/Ö\\±ieO]Êb*îœG.ôsôÿ\0uÚ’GrH¦È¼öH{£	§·(ÁºIHÉ%jhãYjlËC€ŒX«ûG¬*Òâl©’ãöp^\"‘-É„Ã‹ºa!6Í(ýÑ&=ÄY½´Hí>¨þ#†ÁÀXñHÂÛ	u`ž •Á˜È3öys´¶N[9HÍ£Î®{‘9#×–êN“Ö0%KTÞ!D¨7_ûò¤8í¿qQ¤rÌ™–ð9®96e3êö\'«]‚ÍdôYN‚§¢Dµ–¶©}àîãñš‡$Ûú9úñqˆÏé¯¤ysjJ¬‡=À‰r.qnx­@rH‚ÁÁ[“r’æf£Qù†Ÿ[\"- yâ|ÔJun$ÒMÖEé~²#R[V²þ^¤X>#R‡Õ“Çê#Í—\rºÊö£‚˜%ú-”8Ò	$žÀ‡ËÔÈýâ›9D›VìiXˆ®MvÜfÝ—iVÝ£siÑ1ßjZši¤²ÔJFb¡š5FKÕ~L8i†JªAÚZU&Ðš¥\"•\n\"`ÆöFü¦\Z&PÌI1)™‹r*Øz3¼d‘nÔ)1¦31!ÏÓÿ\0‰‘¸ÜdàtðÒì4*âbu{l%€ñøÉÄè®Ž¨ÏÉúÜÀ2@Á4lÂd­§šµ7<yçˆ°K[ŽIŽÊ<f}^«mù·jÙ%ò!ø¡¶}6±\\’ãQNm™¹›ÉŒ\n‹\'¦7üÄÂ”‹f\"ôÇÁÏ\ZK´EJíjœ–ÿ\0•ü,´“aUûâu¬¨’b¸äâ:Ç,GiLñàçéÿ\0Ã\"ÈÐhc\0ðj0D%ÿ\0!öšU=ƒmU*É&Ú-ÐhK‘ž8vŒ-ÇO©ÆzÛê3#¤‡Q²az¶].ÏvOšàÆ¬aÈ9–Í¥voî«ô ÑÌ#2IæUæË«#‘@p[+kX¨Ù$\r@Ü‘¨ufØ²§YO9ÊòbÙËHDëÄ¡[\\l­Â ”ë!¡\rKÕhKˆv®®Ä<lùÿ\0Ãé‘XGì9|˜¶3 2‡eB®¦fW£Ÿ§ÿ\0Ø\Z½Ð¾aÆ{\ZO°#\\WiXCÏ¸\ZŠ¢\r°`¢\Zm­S®F£Q¨4üÍÍ˜?:äÿ\0\\9ø	\n|ˆû¿%\"?Qøì(G¨… I\"UçÀXØ~A¶FJA¶¯l‡)vv/BíilKbIFhÙQ#!)\"õÇªÔ–Ñpí‹*bÍeqHÊª·BÒê>óÏ·«H»÷„$PÌž¯W?Oþ&Ã>™õ C°ˆ§!·ÎC„ÐrÑâT{Ôq¤-a¬ƒ2!…(xë0Û_ÔqÂ@èSÆÛz—R…Qe‘!¥<†™Õ\na*{ê°ìcqgfQ¢-„²}—†¬]Ý_[DD`Ò×Ò¤e.Ô!g«¢Ð‚F>)ÔÒcI™Æ.ÚrœÑr÷[°ªÿ\0?w8…]Ãº}\rÛÃâwŠUE;®Ïô’f˜þtçHtçÈ|çÈtçHt‘çÈ{ãÎ<éÎ<éÏ<éÏ<ùÏ<é#Î<ùÎ<ùÏ<éÏ<ùÎ<ùÎ<éÏ<ùÏ<ù#Ï<é#Ï<éÏ<ù#Ï’\nt•\Zò ¨d°té0š¤ j–IsŒyÒ{ŒVMG)i\"”êÏ’=ÊP÷IB¹æÛÚŸ°µj˜Šu2ÒKPT—IE&Y†|–	ÅîPîPìPqóH—|â]>LákØr„‹ÖZ$Ù>¡îG¸Éã({”¡îrýy=—†j¹‘*\"$¿nÅ¼eWØ×OjÆ³‡ÙYQò¹a.Ï—s[;hë¨¦Œíœ™“ƒ‰õ9bvQ„¿ñ~Ö}sösé‘ŸLŒüYõÏÇç\'`k\"ÎqK?L‚V¿Ï\"*cÙÁPïoR˜óa7°{U_tºžEÂn¢¨9nÒIÇ×(£‘6K=’H\"°ØnC³ ¶²1fášdBZ‚êœ3j­Ä›ÔÓz–~>M!¸tñË0¡qÈ7\'gÇÐú¦\Z]us<Ûrä	°äk“9><ŽO[îØuR-¡Å‘×Ùºÿ\0 ƒø¶çü‚;DŽKXänMÈ¥D°®¿mžWràÔVé­OˆËvìÔ8û—\n¯Ü&‰°Øddddl22226\r†FFFFFFFFFFFFFFFFFFFFFÃ####\"*ðþ~fx)RJÈÈ5à›í–¤Ñ+¡äô½‘·ÊEÌV—È]3[ÎÉQ\'è/¥-É}\nEÜ¤ ï\"ê:Ã2[L œ[l2€âµså¸ÜvÑÛõ(l}f\r“Yô‘!\'ôä|‡Èdl26½m+¸ƒÊj$?\nÎÎ!Ç«ky4;›\Z¨.XW;\\\'?,ß¢ä\rTº|¾E®¬—Î]‹MÛÆxü†¬­¨¤±kŒ¥\\ŠDi<&{¼¶\n»¾;I™žÚ+«dÌj¢Æ«™A•‘q?–—È))êTÑc¢a7ü=†Ãa°Øl6\r†Ã#a‘°Øl6\r†FFFÃa°Øl26\r†Ãa°Øl6†FFø2s±+<¶gƒØ8þ\'+mäšYxÚ–ÑÍ#ÿ\0IiJ’õ<\'Œø~dq–DŠ”E’ºô©Æu·Tá%¾¨Í¶¥6¦Ûm3ÂlLÂfJ<wòÁ(:Y&\\ìdÕM­A`H–ÇŸ°Øddl6\r†~˜nBE¥$—¥ñZÛËI·‘ø¤9œºW$Uå¼*6ù3îq^+Sü;é|-â.ÿ\0‡çÕ\nYòþ_k˜W1Ï¨nåßÖÞÔ[ÕòjÊ‡`HB[O¬ßðò223é‘ŸLŒúdg×###>™ôÏÚÈÈÈÈÈÈÏ¦}r2¨Øy*L¸§ž·pšK$¢\r¼¦¹ÏH&ÐÅh+u ÓhÊÁ>ÓƒU¶žù.¾ÞRM…dÁ\"4u™ÂeH“UR^¤Bœfñ]ñûA¤Ø4˜%P%4µ”Ê\n¡ÔÉA$’á$)ÐÅj]–JôÈÏÁŸ³Æ¡òF8ÿ\0­âÅCÂw›…¨Ó>Õ7ç½ÃÓ[s}Âêy#µU,SDøç…°Ødl6Œ†FFÃ###a‘°ÈØdddddl6\r†FFFÃa°Øl6†Ã#a°C¦ØfÀ°Óix8œf*Ÿ7\r-µÓ€¦æ–*Œ„ùJl´SÈp™T$(œiCCPQ\ZA˜‘%’ì×&½\r*e¯œÔÛ25ŸK+)šŸZÆÂ$³… ×ºr3°b¦_¹ŒM¯a‘°ÈØl6\r‚%ªKÊ°Dt¦Í…-\\W¹1ØÍœy	rÙ”5îM·*%¥ËÛ}±œSV,<‚³Žj~Ñ,›—Z4XÇp{´b\'îZn˜Ù)ÇRÑ´cm©ì<†dªÂBl’s}æ)²s˜J¤Z%<ÿ\0°ÈÈÈÈÈØdgÓ##########a°ÈÈÈÈÈÈÈÈÈÈÈÈØdddddddl6\r†Ãa°må2#¸‹VÊ“bÓ©ò[Ç’‚íŽá±úvî\Zž³Òd>²yÔ“Ò^&Û\'g.$40’ú#´\'#\ZS û‘°È5£±NçÖ‘#Eh;xü“R²226ŒŒŒˆ±$Bq5KR™e5‰¯¨sÁf­Ô°åR‘\\ºwÔÃõ®¿21¾nI¬yå1^qç1UÖË®5	5¯!Ç©ó~¡ç\rÊÎâUSæÉÃ[“æDyéŒÓ,£{T’:ÈNB\rÃy·WTeFš×ÒòklçªFFÃ##a‘°Ødl6\r†Ãa°Ødl226†Ãa°Øl26Œ†FFÃ#a°ÈÈÈZÌŠCË²•é\\†}™Ç}aµä¶†ÀÏ# œ1±4$haÂúcG&Óù<Œ‚Sf¹Iy†A«äûŠ¼ê&ÊtÕ2·(%C#a‘°Øddl\Zaç“éaÿ\0ès\'õþ#ûåû“ü<7ùŽøïà?€Â¿ø?‡ý¯úx=ù\r~Zö?ßÿ\0ÌÿÄ\0*\0\0\0\0\0\0\0\0\0!1 \"0@AQ23aBqÿÚ\0?=”¤þŒ¥(¿µ²Ë6,ãµlü)‹šÙ#SR{.×Ý®ö×l·\\Ý!Iú%iR/flù6zY³ª7|1ä2¯^~ãtGÃ¦Ò³¦Ž.§&«…þGKÓcÆÜ%Èæ‰;vG+^Å4ýó2GåF²«>sç>oÏeE#S”_gðe—:«ÔÕ2¨ÕP’BI\Z¢Uz˜¥|}§=Ú0s2ø®ÏúÙF¦‚‹ü4ÿ\0ˆò*¡N&ñý—}‘e³¥ÃÒ×$¨ðbèáÌmaÒenY8ÿ\0®8a*ÂjkÛ%~Hº•ýîVB«´Ø¾ÈŽ(AÜDèr²NÊì•‘Uðj†’õð$z0õ%ååDú<¸öü’ö.ù$½1¨Ú¢2¿ŽR¼¶c’ô‡èÞFò7‘¼äo#yÈÞFò7‘¼äo#y³É#É#yÈòHòH„X™,•èòHòHsg’F\'*ù‹ïi•®þL[?FKÇüÿ\06<Îäy%û<³ýöÉK‘ÁðŠxÿ\0\'–¤y$ßÊ)É¿Cœ—´,’ÿ\0±å¹\n/\'äP—(ÇG’^¾ÞÉ!rc‚2cÀÿ\0$qÆ%£ƒRMÄßöJfÅ>8J\nZz:¸K/Íkèè®ÇŽÙ»¶$—¡Å?c‹»:wÞ^ŸÛÝ©*d`’$ðm¯¿bÌ…4Ê~Ó5¿e6dŠˆØ¿fÉ>}]	l`œ1ãœ_åa¤«ì¥é–Ye–Ye–Ye–Ye–Ye–Ye˜§¯É–¿‰äfìò1edz†,äºŽ8%‘³cdÑb0õ:Ã“/S9z›öYežþ»÷÷˜þD—Â½ö—ÃÒÿ\0aÿÄ\0+\0\0\0\0\0\0\0\0\0\0!1 0@A\"BP#QaÑÿÚ\0?ä×{%Ä:ù™X×e\'À’ëDÍ;\'X\Z+ÌUî³–¬ÒÌwYÓÔwZù.ù>ÚSÍ$1æ«+\rŒÅI(lŒ ¯*Ñ‰ŽÔ…bë¿#µ¤ÊºT,¡PT\0ª•ê¼ª7^žFê¹2W*T©ÖQ¾Æ.i 4m´ìDØ™º©åÆÀ#³ý®üT‘æÄô>½¦š7Ù&Í¦UiäU*«¿ˆÁæaý?ÒTâ0O‘ƒüBë^‡‘±F¬Rk¯­ÎC.©„l<«ï:F°[(åd­ÌÃc­ìÍªÈvTYí|”Vsz ò},ÄzAçÚù, Òÿ\0k!Ù1ºùDÖ¥E‹Šg–0©$dCê(k¯IÑZ¾|Fyã!±šÂéMÈI\\4|Løöìäk%”\Zw@² ZnÐe,¢ïÌãœiö¬8‘Î=Ö\n[õÎmÜèôÑ4M•´S¤è|Žt¬pôšàñ˜~-ñ¶Vä~Ê4Xaûc¢Õ«ëŸ&~k¥(¶cð£ÄÿÄ\0I\0\0\0\0\0!1\"2AQ‘#aq’Ñ 3BR¡±á0PbrÁð4@‚¢Csñ$SÂ%cƒ£ÒÿÚ\0\0?ô.VTñp5e\"´4¯ÊnçFŠºŸÈËÉÌ;a÷õ;¢Â	KšZM‰¡ô	ŒLk1¬cXñc\ZÇŒkÖ<cXñc\ZÆ5Ö1¬cXÆ±ã\ZÇŒkÖ<cXñc\ZÆ5Ö1¬xÆ±cÆ5ŒkÖ<cXñc\ZÇŒk1¬cXÆ±c\ZÇŒkÖ<cXÆ±ŒLbc\ZÆ1<cXÆ±ŒOÖ<c\0›G²\n¨íc\ZÆ11¬cXÅî|cÖÿ\0tzñâ^<QüB|QüB|QüB|QséñG­þè×øÆ±ŒLbcXÆ&11­ž1‰ŒLbxÆ±ã\ZÇŒk1¬xÆ±cÆ5Œk1}þƒö\\HšÌ¸¶qQH¬#8 ™÷P^yâFV\0¼›)€†Ý/­ú8·)[¿‘nlºä¼Ì—HÛ\"Ùì¦Ü!É†çÒÇ:Î Ð/Á¨XmaeµX]6ÜªìûÙB/\n¼Œ^kø†—ò)[„6\\×	´t+\0S°·\ZãÃ+øG¬ø@ÓÃª5ÇÖOÅ<!NT¨Oiùÿ\0.¹·Ò\ner`V¹­;5ï?8·“›.OÌPÙµ™I\0\nuªîŽ}2¹§Ò›n¸³[öÃèq¬Ëû=P™f\Zç*¬Ö€¸)™•KH¦ºWXm«i»8ªêÖòÕFÒ*LeäiW¦Û”Q%.¦E_ÖÒÕ‹iFuÂh”o†ßÀ«¸Ã)ÕY¼Ò”Ë§H´’•TIm¼êÍô®|s¤\nŒÞrÑm\Z+\ZÈÝ±gÕ¶]ð©Ç“š	U›\"úÂÜ–Z¤\'Ò2”.¶¿\n¡ƒ8×6žqAµ&Îq\n!!Áò10âQÿ\0O>´4”LH_ñªìû¾ò#XqŠ•\n\r±­|cð‚UiÉy‹[ŽèªUdÅþÓåÀî<‹ö^x´\\OF¢Fíd(\Zë@¶ódR¢ŠßŽöµŸ_‰ØV…ö,F#ÆŸ8Ô>$ùÇªYá\0ÐŠ°Õ•Q}ú~‘z“ÞT`^×„ùÆ\r1¨?¥f?ÔOmñì¯àbýüƒÎ%«r³.›p\rERÒÒ| ˆj]-¸òÚm.<ðË\Z\rŽ¡KÎ1).Q}ê[B.¨ª}l*Y\"Á\n#Ý\"p+ÞÂ*bq\\Íkç\n¶—*0@>ÒBûŒK‘†l|£%v˜èåÕ2‰tY¢H\ZJúDÜŠÒPRm¥\'gîè¡¡Ïcó¥s•¼›(r”³ÝªLªæ\Z³ÍÁI¶\'¥\\¹Ép±H—ÊR\Zù´—[÷®‰§ÑueÓQ¸ßÓ‡NU§Í[ýbjjZÊÔ–Kˆ®êÃã4ó+•¤ÃX¹Öí¤ž°SðŽzãy¹yR´7_õ«hu\0)Ç•]ŸvÔX·_\0¶hhH­kòA\n²\'gD/ŠW~Â\rPÔÒº\r…¥TÝ\nRÈH¥`OæŒlÉ‹É<¸Õ;ŒY&×QÇë\0j—Ãª¡6”£xëìƒë;Éÿ\0ó\r…Ë´åT€a)S2ô7ÞÂ<¢«“•súP)KK÷þw-^qê;_œ1, ú\\w\n:¨ÌµjÅ²tap·E÷r^˜÷Ñ×›7m–Ï°\rÛlL8eU-‘²2ªØÊÌ…,­Éi‘§*ªÝNªÝßU%Œ’…çB¸¿gbG»Æà]º·eÂ„­JAB­\'màâÙ˜EÁÔc%É×Ü¶›7ÒèKiÕH ‰–êVÓæ¥\nÀFm©é„3±]¯j_¾ØrŠ*.,­J0™àµ%À›$5iÅ6[U SaçÜ˜y\"‰+¦Œ%”’@Úq14ðZ‡8E•\'d!±xBBbaÖ´sÂ…;!r†®´ºÖÔ-\n˜RåÁÒ‚±”%ÉS™6Ãˆmô\ZæÉ_âŒƒ8ÿ\0; K=­U…\n¹ßUB‹.¥Ð…XQA­îEv}Ñ‡ ³Õ‚7ÄÐZPÑ0«F±Jßìò\\‹¡YÖ‰J‘B`êzz¦PR¬ƒ}/Ž’_£?f”—»BÊB•\0FªÀ\0Ó[ô1‚îÿ\0¸#Õ#ÃÊ‰’ãI Ùë¡”ï&ØTm‹N8–Ó×R]\"½¥{IîXHüwÂy)C	öðƒD›;ãÛûœ`:Ê\\Aq[[Ö€§\0Cj_7tZµi§-…m=Æ2L«KS|Û&JŠ\n÷›nbþnèi¨$\n|?‘É’¬è³1k8kL\nOéâ™6â—œ™bÓ‡m\\ÇÃNþc0mÛS.›E!–ýšï¨ÀDŠ/ÍhØè¶ŽÞ¾Ev}Ëw¦í1°bŠ%kÚ •QVJÍÆø·¤”Â’´Ûl|!VUÂ´X†›Î¸6@»¶1\0c×¾&<˜F—ð…¡½\ZVna°7\ZÂ+mÐÞ•œá¿Œ_“‚»ÿ\01Òd²M)P¢ñŠ/%N]uR‘y¼ã`{ÍWõ\'Vßæaqük_ÕTÆŒä©ÿ\0æ*ßU~>–¢ð§™RNÐ«Ô˜´	íŽ‘ƒkjÑúÂK–G³fã\Z+m]Š‹K£Tà$Eþ’’°’(A…Kd¼°„ Ú\r0ò-$ÈQù\nÃ³ÕKrŠ•T©ÆÙu+±ýÇ¸AÉÌ$)Óœ}×Pn&Õ<ø\"Ô“Œ¡Srï\'2°3–MžÃB;iÌ ó‰ë)m\'Ù°Õ’Oe³á†šÊ<òŽ! ‹,—6VšÇ´ò«³îÅ$\\T1W[=ð–TR]$š‹ãCtièÕ¬[öEäž¿Kª(ÚjwÅ§4ŒL*›iÈ;y…ß“ø@”êäÒCv+uVD\Z´Ò¶ÒØWéÎÊ4@P!	÷h>–—Eh˜Îº€´l1˜–c0ôÇ²*¥“\\kÐÍ+~Èµqb>ÁJQ¢@©0ŸòY)Iü„æ–i¹zŽ½·ßº%ÝRzD6àxôŒ»‚mo¹DåcÕKsLÓ‹®&Ê–xJÐm%B ¿n§XCiÅF2„ËƒZy’Ë„û®Y§UÑi¹U>äÉ¤¼³xº‹EDªžÅ¢nÛHÎÿ\0ˆÚ•”–BÀ–ilY¢¶kwf<ªìû³KKnÑí1 Ý?¨ùÆ\nâcÚñµãWœb£Ú¢y4S˜;lÅ5ŽèªÍ:£DS‘jÚTy,¥ÌÙß\0)EJßßÛÂE­ôŒA‹UP?…wpZ³ù¨ai:V¶HxîµúÆ(0ßèî‹¹{bÂÓœGºb¬Ÿè\\ö’½Èà>ÅÙ\\˜ä³òn9æª˜--•þ\ZlÛù¶Ñ8Í’‡s.Z~ÇiÕ\rì‰Ìë‰Sm£6TÕEKª°UÃç\rÊÎ©!ÆÍÒånt{$v·fM•Žk0®ô«\rƒ¬á\r¶DÎ4‡´jW¤š(³fî³¿V$ƒ‡Ô¡Ò³ì¤¬\0Ø!…e¥lJTËÉ°á]}¥by]#“·à>qŠ<Î1oÀ|ãü\'Î1oÁõf¼Î1oÂ|ãü\'Î1oÁõŒ[ðŸ8ÖoÀ|ãüÎ1oÁõŒ[ðýcü\'Î1oÀ|ãüÎ1oÀ|ãü?XÅ¿Ö1oÀ|ãü\'Î1oÁõŒ[ð8ÖoÀ|ãüÎ1oÀ|ãY¿óŒ[ð8Å¿óŒ[ðýcüÎ5šð}c¼?XÅ¿Ö1kÀ|ã¼\'Î1oÂ|ãü\'Î1oÀ|ãü?XÅ¿Ö1oÁõŒ[ðý`\nµà>p§ÙÂ=žìðœ\"‚‡º1oÁõŒ[ð}cYº~_¬R Wª4s}éúÆ-øOœbßƒëM¿Ö›BÔk?`aÇJ««®*âê<1¬ØíOÖ/RUØŸ¬^GÙˆÄpŒG¼ˆVmH³Ö˜¼¶GåúÅëÍ+ñFnX¥j÷öF³~¬bß€ùÆ³~¬k7àúÆ-øœk5à>|¨fenËI¿rf¥WÒ%{©L!É5LÊ¥Ä/C(KœÙ?61á·7”‚fåÏE”2{¸ƒŠV=žø.s‡ËÉ,<ãÈUú®]vÄ¶O›S¬¾ãù¥-«‹/ ‹?<bc eU‡Rå]—XÃ}ÝXÝÕöª’˜2Ù;\'úÕûOnîÊÄ´†OR™ÜÃn/þÚ@+Yìý\"fl>ôžttY”¦­6\nŽƒg\\)¦Û9ÃœzzqÎ•ãøR/§\\JäþxÔ¬²}lÕ¢ãîo±£w+nª’NƒNºº¸ºbU»‘ïÈ~íO¡e7ü£H×Ð»Ñ¶òÒÚFøþ \ZïŠ²õz’¨×Tk×¶+i¥Ý…i7xÜbûIîX\"ãSÕ©VQº\r Œ#ÃÑÝ*Õ1¤fÐoÚ}þÁù—W›C:eT¿º%Ôã.®ve@1+¨¥icdV&9ÚË­Ë%!I–l\"Ú^4í0ÙÉ³îÚnªÍ8³0Ý0 š]Æ$æ›më@Øµ]4áÿ\01gh·4&:d[µÿ\0‰8~hÊHžvEÔ°’âf¶T•SÚ0‰öòš+9“ÕI‹\'F”­±ÕR¦AÎ -´¤\\;á)q.J)W$L6¡¶™m/¹¨Õt•ÝnYüâ–F‰\Z¸üà²ãÄ8Ð 2+HpKÌ´émE+	V©‚¦ÐôÚŠå‘lra3h,7KnlMbW&dàŽrò®>åée±íR“˜™~vp°Ú”µ@1R”FÂ\'Ü“EgæuCe”“@µõR´ë0–Ë.Ìú¦’³p¿oUxÂ˜ÊS3n©Zl©Õ0	;nµÆÆM°CíÛm™¦Âü6µ¾1/•ä™}aËs\rã˜ €¡^Å]Ùä(,)V†Úíä{ò»SÊR“vÞ[à†EFÕQ\0¢c8¾±tX¢…œmmä®ÈÍç3Ž{©ó‹\rÙhîEçŒ-N¤‰†&«Ú1…‘QdÐ&”¼ªÒ¥@Â–\\%\0Ò”¬%9±n—ÚÛµ¢N1¢¢:±¤ê#\Z˜Ö­}yJ©X¾ª1 šF’øBÒ›”F5‹þÕÉI‘i‡)h×Xa9*]‘9PÒ_X{Äg?ÌUÍÐs³ ’aÏdlC2¹É¦änÎ­ÝÇvØkü=’ò;Bu=LÝ]·ÀJ—.€Ho1/4_àQ­\')ÌË.K)$fÕ0¶ˆjdaE§³l)é†“2d0úP´êŠÙÇ)Z_8ë-z¤Ø!Æ{‹BL¬»LK ô“o ^êTÃ³\"äÿ\06p:\nh’¦ðÂ¾ô9”f‚™IfUTÐÞnºÊS-8š9\'£Bwßæ#üµéudüâUR(å›Dæë~èb^jY.!w37*›_C—›iä°4Œ¨fÍ£ZÞ¥ÒÕðìÛM¶Û® 6â‚Æm$‘ZW~˜’”~fj{øŒ¡fúR}žÓšDŒê©ÑJÌ%Ä\'G°]¶&2ÆNNNœ²A\rµrT=Ó°ˆó<înM¥‚’Þ“k@<SºÞTZ”žšBbÍÚO²¯{éŒ£*À}ÐQ0\ZË˜ß\r0ÝÍ´„Ž¡Èÿ\0ä?/»‚„$Å9(Uº^ÒO»Í3[)²*ƒvíð\rg&:½˜Jž\Zd`vE\nAŒ©tWxº5\\p\\!Å¶‘ÜÒp lc\nm§m^o¾µ6l¦µ¨‰wåb„ŸØ‡Y]l\r;P”Zd{Ÿ¬j6EJla&4ôP½´¾7üc\n¿(Ö¯Âmµ…ilßöö]B\\MkE\nò.q¹ûPB[Tº\\²6Ól?•§âœa¥‰>r,‚³†ŽÁžcÏ2ÊÒœ]«Klm6önÎLÉ,<‡æ(p\r§«ÌÂòT…6²×7B.RŽ6·“„Hd\\œŸýFwCCÄb^rrqÅÌ–¬Ì%½åâƒ°S¥B©\"„FPšÉÓ.&}ÊíšèK¼!J˜fÞQ’:m«â<ÇÎ’Ür³®1œl)4°àöÒvvC’™NQþ/ ´Öå~*ì0f%äÓ)þ!j‹	Y³i\'Ú¯´’#œHgS“§\\I˜Í\'8p5Gë:¹Å;6”Øm(Mwöò¡!) ÿ\0ä?/»·¤Å’tNØ®Ýûà hÙÖ&(ž<•Oxß¦`œU¦vƒ²q)Q¬^ŸŒhºžû¢ëÇUña\r¸„\re`LPJ¸ÚŽ²õ¢”ÝNÇ–hµÿ\0¸R8E—ëP¼Å\r;a\n\"Ï².…»Vö#g\\_Ðû\"Å1Û¿Ò­(7ª4—lîL8‹7[1uÝ‘|ní‚„S8\nŒShÄ$›Îfö†×f×nøuR,’êÅëYª»#üÛ+S«t¾%Æ«DüÌ9:ú¹ÔòÏ®XÔNÄ§pôS8Ï@þÿ\0ªÊó‰|©’Óeis¥–:¥*¹Dnßvv^Ó©¶…šBe¥­æ“ª²ªu_öí«å÷}Æ,œ7!v¾•Ç—pß¹Aœ÷œwG_\\atašCeX\nã„	§áTt²Í¯¬´–Ê¿¹ÑýB4h¯ÊbðGo%V{¢ÂG\r‘Eé£r¢­cî¿MM1d¥J#|thJ;£Idò}œÙI5I¾4xà8Æÿ\0–áÆvÑ´…ZŽp’u‡Ù<†)e£d­^öèH}A.\\fð’` …Y  ÃiK•¶«Dãû-^A)»Z˜ÒÐ¢QfÝª\\M*‹&]6–›$B^t)º¦ÕŠ_×Bðo‡Wê‘ibÉ¯ï¢VTlg.I¼C\nBê4EÛb3š‰¶M.¤K€ÛŠ.¹b–MÐàRÈ(¥­¶¢ýV±\"‘R¢4ów¤ÜaçÛ\nw6«iM/Ù„§JÑöláÛQêp•Ú!%y»Òq­!Å%W6«*¨¥ðú¥²Û$\'\nqÛÝ1aTh\n®›NÈÎ…(·bÝ ƒp…ºYo:z“Ñ§\\s7K$DÇûjù}ãi\n)0J.y:É‚§z4T¨,¶ci«é\Z¿Ø˜Àÿ\0lW6kÖ®L\"¢èúòaÂ.\'’çê…`M:¢Òzãt_‡%¿Ñ›9Ôo!§}äü}hµ·_”UjµÖ¨²•ç¹¡F“Õy‹JQR·Ÿ²| ¶¶œp¸\n«Q\\aä¸°¦Vþ¬áwÂ&Þq@¸êÔçvÁ%ê6´­|ŒOjÒ‘že‚ËtÂ»þ+,Â’3*AÒÁT‰ôgP¥L¨Gºï„<JœÖmH5¦5ï‡ó¡!°®Ž˜Ò‘”,¸‘ÎPáOùŒêlæCIi)Ú)X˜I^’Ë–ö-Ì©¶\\%µT!ûÙ\':æéP%xß%JONò¯Èšhü\"`¥Äo!Ôã‚iqáÉ6w:´¿³M¶É39þÑZÓå\rÌ)ÍÝi¨n=ñ.ëkJRØP õí½±(Ã«J’Ó¹Õ~,S\0¥Æÿ\0‰/ß[÷p»„?mayÇ\në¶\'–ŽœÕ\'vˆ9‹D›©Û¾&–¬ÓÁð””ª´¦è£b^Õmõá\0^sjù}át]Ö”R±¶tÑ#ÙMÃ’ÿ\0OL#t\\`ÔFêôj’A‹BWZÔmå»)…Pc¦uk¹_ö6ÙPåÉß‘§óNþs÷ÚSéLr²OiÿÄ\0)\0\0\0\0\0\0\0!1AQaq‘ ¡±ÁÑðñá0@ÿÚ\0\0?!ø.¶³Û×àÕYf½@ŽvÏþÑ¹¨äòÌÄÒ°Ç…=Ïƒ±Bý§¢?ªôWõz9ÉÓ™fþóõ:(ÿ\0Z~W®½ý^ªv;ùòßÍáÿ\03ÓŸÕéïëOêôö(?»×Jþ¼Á÷§ö\'õ`7óÌõØù“°¼Ë´÷¥¿šYùbm·ˆÝ¬ri›Výø¥†¦=‚nB¸½cgÞœ·æV~A–8^ò/&`ù”ZŸ4ˆ,µ…Oi·Bø‹´oˆä‡™äz’õ˜~IAŸzzoÓëY\0:ûòçô¡‰c,\'‹LþÜo›ûý=GÈnüÈ‘2\rëÍ›æoË(Ð×\Zïºåa@l?øQŒ)5Ç9\r\"Ê…¾ 2VLj±ŽUÐv×vï“¯Ì&½I}n/Mô›õÚiÒâôÒ_~‡MºíÓ^–q.~Ÿ.—<ååù˜‰rÈ¥BÀeM1<Ù¦’ËYP´¦¢U©io&Œ€åýA-‘Ž&zCw¡Øi´hÅxÏyU\'«í;l\n]íûÀ;eÑ\n¬‡šB¿+øˆ±­X_ìgh{éP¹2s\ZêŒÙ«\Z®#Œ%Ô».SYHÕÍj9ó7•çàÔJˆå·­“½C½¨Š¸å@æ,ö¹`ìmcMvÚ;¦ï%´\Zæ]â¢“_ÁV=pûAuâ,•ƒØ\ZÚQáù<w›Ç€­ûÀX¡©i\\¬|¢°\'›û3/mÕz§¼%Ño*„vƒ¹ˆ%]f{¯(~T³eŠíÊ~€6R²mÌId-zUì]`”LÃõ²¹·ÁÜëóXJé§FoiÖº*2ºmð‰ˆ»ôqÑÛ©Òº6Ž¼Ã2¸”;,mh°-KEµV7Ÿ:Y¨ª–¹PÁaKicŸ¬²nÄ«§‚µ·úŸ™‚5<áîÞQÈ™÷qíl«°€ø”üñÙR„L/7Ì2{¯ôY©÷ÛâîËíê~ÄÎ¬[ï4¤¸‹’@×à·Î?ps©{ÉG0>ò¶WÄœ¯\Z±\Z#Á\r…àfNT¦{Ë:*$úÊÄ×à­ÈðÞi²	W@½°z…T¿!zP(½\r½fDÁ…è¼EÍÆË‰5JÕ…1Ðë8·z8WÙCñ\Z›t×„ýG$GmCSWôË\r.ËØ‚\rÞºq˜]:·om1ýŠQ±]ï/Ê:ñjýî`ðÐRÚúûÃÕ ~K¡HQ¢‡óŒ›0àÇ1ÇŽ—\ršåÌfWpöN<;ßWÌ&¿ð`ß[ÍuÐø4>Ö=	}ƒn¡f-6©à•2å+írè\Z­Ã5—k\'Ú^e¶©ÚšK€ý»#Yx\ngÒ\rƒÏQ¸ŽÈ²D€9™¢<•Ä^ eÝ¹†áõL\0=;Ó‰x rcúõš4‘¹BýBZ¶%›ò`	«§#ÖÒ¼âV5%Ÿ**WhpÐû¤Õò1F/cÂ1ð?l×æi~Õë®}%Fh¾PKPn7ZtÂÇ¼Óçx}ã$™näO]ÄKŽeÚ¯1¶\nb¢!)‚âfo*º‡µ}»GÊQœ¸{SŽ0Ò™Wâo°)Vp—¶ìó‰…J–Œ:cHïÌ´Á.€h\ra»G.Ä·®Sz»J¡nx\nNkÂß­µ•f@*{þí4¤òëëi©‡€ýJºâÚ²›?\Zµ\Zÿ\01N@VŠ—ÅŒô<žñþançÄæîUWÞê»Ì6“ƒÆê#‰‡TC%r\Z4p:Œ…cXÂ±@¶õéó‰}nið_K¹u5—Óyræ³yrý£õ¹}/­Ëép®ÝC/¹\"^t®—;þ‘×MŠ‰Ž>4š:®îe7]|¨åcZaM{dÎÒÐ¸ÇÎ\'C*‹i¼9[Ì8Ó ŽÑ}Š¦‡ÞiÇLE{4‹?ëâv ˆŒtÐÀÅ¿$Ô½³˜£öPŽ *0{ì²§}mykï.H\0YneÄÉÇ¤P;Ç(!Ì)×¬òø%¾ä*ÁÉ\nSÃº\0ßË2ñÉ\rÖ4PL\\qoæ;ˆù”>Œ©®7­–Rlõù· Ótö…&¨÷»Q&ö¬0~çÿ\0ÿ\0B£N“ÅnîËÌ–tmdÞöE^ea¢\ZDsaX{š¾z|Ã§§MzzufÒ¾NºOO€•ÿ\0@¨$Épx³T-\rDf\"àÙ”ÆtTq{°rÄ}K“Xñ3õÏ„¬Pßa„º5¼¼Ë?Ÿ£W¢:óË´Ç¢ù…Ú= \\ ,kÛt(óþL@\\_¤WÐî:Áê†ØgÞ-ö+&‰F%ÊõH5ílohùHo´L(ñúÄ¦m4Á\ZDáûâ]NM\'j¥Hkp!ËIyNÐ9µåŸê!b‘À`·Û‘ÈÉNÆIŸúdïtÜJÞkòõœS›?ÅL5ˆê3Lu\\×!u’œDe@‰[Éw…\'ðTgÚ´;wÿ\0áM‘Y\04}S—‡žÖÙïHHi›W‚I*´ëó	·FiÕèô×­Ã£+«ð_[øw‡GS±§l–7d¦Äº™ó™{ïC†#~5þ\"k€“Ygê“7Mè‚\0(§Ä\Z¨Li®Žñr¦{£É~cŸi”jg¬!.9EGvH\\º 1Wh“@pég–¥Ò´cî\"ƒ¡X}0k´B„I˜°ß/8s,è€öCËICéÚi»7ï=7˜è\\ÌÙ=PÕY?I¨×[—üœ“´4c¾Ëaò\ZG,û›òJ@_\'øŒ††Irî×YåeÜj£Ôe–F¼&pS…],Û:|‘ºY¸7¶É/\0ç ±mÐ·5ÁkˆšptîA2ÛA3,=\Z|õËv©kÌ%SÚ2Õ±—Ae:Ÿ8ÿ\0ô¿×àõø/­Ì|™ëL	ç/Ú3}nê Ë²l1W”(}XÝá5*ÇîÁS÷ÞP\"\r-ý–y¾Ó²;ËúhœmÝâôð¡h‡ŽÚ4j2ÁÕ¾}/*Ë©qOñ›¥ÍÑà´¤’tÖùJ>Êh¯ÖcìG%úOófo@y²2€ï1ëºÓ=òÀ¶Ÿb[¯³YHæ=!\Zü%Àý—Çµ^0>Œ\0ht<Æ¾Ï ®±3ïæTCªYLHº(¶«æZV¦s€?!æW„Ø›/`µŒX„iK4ƒÎCŒØîÕ\Zš™hâ÷\ZìÌÄö\0;Š0üà„Ë¾Š8s¡„eò/€-¬búÖÝ‘eš|<pÌÎ]8`-Œ$_í>Å?¬ŸïþF«?ÓÏgõOyè¼\'ª9úÀAýr †yéáª`ÿ\0q<ö®›:À§Œ“”³ÛÇ÷3GåMXù˜2Üª`¸g»Þgåv°CXZ7Sv‡Ö·¹õ‚\ZõƒÅåCœr};˜òÙnëF_e-—P´-Ä·D‹Œ´TeV*mªyñ28bY‚º‹qïù†â;„}#M}°¿ìBø,‹ì\"RàÉ÷s‚€h¸^Y€‘‘“ùÝÞThÌùpº€ßƒqüÍg\nTnL³ý;‡Ñª9ž\0m-4*ÃÖ¯C+N!Ónõ›>YÐÇí‰µtæÖœvÕ5>—09µœ3´r¶-w¼1]P6m×V‚Ë™xâ^¼¦¢(M±ËsT)4h©õhæ¹= ÷gÇOÜñ.\\ô—Ú\\¾ÒåËí/¢åöžåÏI¦ÓM¥ö—.xAíÔ¾ÝKí\\ô—<\'¤£Ä¹}¥œKí5³3s/\\ÍE¾!Û—{hüËý]¦†eöµ^%ßžšf]öš´\'7Á¬.›.•ÚeÝì‹OrâÆ(€]—+Ì¾›én>u>±?¢ÛÂ×Öz£+\Z.QZÎ¼Ä°Ëx&o)Ó/x^à_ë8Rø—Úå—­ÍšÒÛ´Ñ4›ÃÒn\Za‰é	éÖ†„\ryÐåºõÝ~ºÖµŽÙ7j‰|1mØµˆ§´:\r’Òò÷)½öÛyW’S#Œº›=í´Ì”¿‡ó»ŽÚÇÇàì4cY¼q=®ëÛYnDÁj­Zd«°ÈŒL”\nJ„ÑÄ5.MA¤x—û- k£šípÐÆ¢å@µ†Ó\ZÂK7w2ÜëR®&È4u¼Â*(ï$–rÃ	È7%ˆ5ä5 ir§j$[´Y^¹“$Tn­PÞ½)³f›m®òÛ_d¾¢«÷]ôÃõqÑN—ámzÔøJŒ£ñx?ôÿ\0õ••ê×žštÙÝñ…Õ3Û¢ ®eb`Yh«;ÂõwðLŽ¹SŠÒ;âš!nJ‰30v®N¥´\\V\"¦ËÉù“Q4½ýb¡Y[¬pk\\(N•ó0Þóî½.V|6=W\rÎLÀÉ3\"g¡Ø5¸qA»t¼¥õSÐõ”IÞñà†ÀCÙ(Î¬ÂÝ\0¶“!U±Z«ô …ä& »dÂÃ¾/i~¥šÜ«É\\ez+)Ñ_€ô¬°d(wB‰´Ô®ÜÂjÁK}šÔ®ù0\ZSÀUw”åüå‚»­‡x[qkm\Z5ÈY%ˆ\'\"‹e#ÀSÁ0\n¤°î@Ì£P/¨i²s³pB|L„z\0¯XØ%ä‹±š&n¼Ënq/c!‹±—-²¤»ƒ¢£thƒœÝB¯»®\0Ã\n×ZæR> t»û{Œ«Ú%g©Vƒ€·[ˆÚáÝ@NRPnK~Ng	ì{WÁ\r¾jk†ÉàëÆÄ£)U–ÎŒ(ˆ)|È­Á ²ï4/æØ0äo9ÌUAº\n>?GËªø|!^Œ%=~NP‚0è¬c€Sákv™C\r£„ÂaÇAð.¸\"D07±Ÿ2¸uŽ«QÌ`æÐC6ƒik,ÀøÀ4vW1lÅé‹óx—çíMEÅ£‰Ø…Kò¥Uor<â7‡»¬ÀE(¦ÍæOF¼õØâ\rPd}þÒœ.‚®øÎ .*(Ð|Ía›RíÃ«Cúæfzcv}>ùšsƒlE{	†*dÛA)¬»é”wWûÞVúZ—©ÓQ¦’ª3ÈÜµW~½‰õ!£Ù-Š‘±„†ÅèäzB:ôíÐt)ñð‡(ÂÆÇ0+I¼Ž`ã³[ÜÀíüæF’ûÄƒÎ…‚ê9¨¤ÑAë¸Ô]µoB*ÅEÝë(f­v\"à®ëŸ]k×´\'8åt¨QÄÒÆ‘¸Ä—´?6®˜Õ\ZXÕZ¼›iz¥¾[[itðF?-bz\rZm–<f»h)ä7Äé7Vžôå¹\"Ô4—ÏL}:ƒ÷ü§—GŸEÞóÊe.yO)ë<§”¾òëyå<º<¥÷è²yKï/¼¾òûËï/¼Yrûõ<æ[Ï)çÑëÓréÖyO(Õ÷DMgJ04á²4I-/‰Y-uz½+?[&ƒ¼´mùhvvúÄ[,ÑÎ=F•ª[ñ\Z¤7¤ùq$–<ß²[ÿ\0U‘¸Ä7˜Dkƒ/¹°ühÁõò“>F£Ë¿”³³ºjñ¦Ä<	§TVÓˆÛ‰¹lý6Ã·y^ðÖ¹ï0¤B_;·>^p†®ô¿xº¥tÐ;#SÆñê«/W´¢\'¯™V5\'3ÊyKžSÊ_yrç—üTRXpÇf×5¸@ãƒ±,±÷X·h®ÅKWx`mk›øo¦Àã€Þ¶ÔC–ÊŠÎ®âðÑ­&>üaàÖ²¯˜ÖO4vÿ\0ƒ¯ØÊ0[¬SàLoëWàXõuO9“1\'ŸSd×ÑöBI:^ŽZõ=Åë>¾aÒ@»°K¨\rp;~ï.2éK0å¿9®C]^¦þ`{÷ˆÜùY\rËë \\œãóµ\rBÈZØ-Z{6O.jÊ]ÂÚýÓ‘œ‡Òæùã_ö=^1S»1›ÆæV3÷y®}Ž%L¾ôw‚  Ô`5`/ý¼ê¢-È³ï>z/@ï€#\0ªˆÑï\r1¹úŒÁ)uþÃ+ÍH:öa›F­Êó5ü§ÓðøÖõ\ZZÖ[,œ+Ü(ky–ÿ\0]ÐÞšRgHÜ“®\nÞ±ÜâZVÖN‚«7«4ŽLf³¼tÚÃ]„T¦§h¥M‹QEáWG1Å¥G’Š« »¯§²`\ZA²Lc.LD¨ön@¨ñV×‰‹BÂ…z±ß&ÑË»\0ÐUªí\Z‘¥±ÓNóM%ne‰zúJùêv\\cRU4ÝéUFMéžñc)…¡à\\\'BÚ«€Þ)sÜÕ¤qŒâ;]eÓS­Ùï„çKØÃJ}Ò‡é‚FÎxTÜš s{kºF’é_FVhzÀÂ®œÆïgÊi””ëÓ¯}}2“ß5Ç)O‡	mÐN¹Œ«5Ìe\ræžšqÐF}Ÿ¼JJJÜ§SÊhb@³þÊ\rÅ,ôQûû‰ÀVWì•‚ÀmMéƒí,¿Ð8¨¯N5‹2HaÌ6€lØ¤¨ˆ)åª>÷[õüÂ¾`Çº*n—â/mœ½¡6©ªîÃ ¡¡\rq+^t?7¬ùœ7‘3ýâ^Ì0ï…5•¹»ja3v¨PÒ70}¥˜Åï¤Á>2ù‘IT¸÷BSÑN”;õTñÐ!Uœ÷ –žVa„bkWAz-}vÚ¾ñlAa(Þ¨û1æYIÙvß—1‘@\"X\\ÌÀ¹ÀÜFÈðC! Å*.ýn$†œ6Tû¯YeMhI÷³Ú&uaégó+JÕ •«§mª\0÷ LóYeŸØ^ñ40°«\ZjÓ˜ãòÀÎšË®V¯F®èª^€ô+†ãlÉq«Ò\nÐÅQ§¬fÅé¼ó>CéµŽ\r\n%»Ûâßªùô	–Ú {ó›ëñVŒ¼çÞ!Õ²©ÝFYÉ•iTæ‹3›\0\ròŽ|“_Cÿ\0M ÑÔ:Ó¤|h=Ò·§Fú§K×ðÇ«àìiyzEuøNä1Ö¹o˜£HCi¦¡H¦RÛ(W-“qê\"k>¨Žƒ(ÉP…€h\"w%öJ^[’À+Eµ˜Æìb1+±`Õ0…ëÀö%ó[‰-q“—#_†|!¬\Z³¯íyÿ\0ÓtŸ±ç«ðŸø:ü;t7ë¼Ú:Í£6é¿RmðºÍæó[§WWÒ†ð—¦ý6CXÃ¤Ðô:á«7é³Ô::´3N~sêô43iÄÛàÞÿÚ\0\0\0\0\0\0óðüóÏ<óÏ\'Ö’E¶ÿ\0j“]óÿ\0w+yayCFyãru$»Úø2û5Ì˜<mK-Ý­w–¶¥L–ÉbI$’¡Ì8‹«éÎñÈï:Q\"-„²¦¥ñšß(áçM?ç­{L©yÇ\r¹âì¾ûÊ,ë-Ï¦½c˜Òßð\"-¢‚Õ”#ÞDé;ÆÞóÏ<óÏ8*šK|“ÏÞûÛœú÷_ÚM§\\[1²,ùÞoRmB?uówÓÏ<ó†ÒÞG?¦ãm=ãïøã\\»ûœN‚ògÖŠ‹Âþ³:1V»,çèù<¼È×^rÜKžå³`uë´}ÔYãí8ÔXþqHŸi‰šª?¾š[ÀÏtPGÿ\0<rã½8ëõÏ(›|Âëh¦ÿ\0{ºal6ƒ,‡]ú®‚ÓßêsId™2$D#¢\n‡²Úi$ò*%wÕE²I\rTÕt£‰vy2ìGï®ƒ\'y4À	ÈÀ°D…uñï<óÏ<óÏ<òïþûï¾ü?¿Œ8£x7ÿ\0àÿ\0ÀþÐžýü/ž\r÷¿ÿÄ\0(\0\0\0\0\0\0\0\0\0!1AQaqð ‘¡0@±ÑáÁÿÚ\0?IXóTKôbeEºŠß%}ÊÊÊÊû•÷+îWÜ¬¬¬¯¹_r²²²²„Ý*ïee²®ä<¦?!h6‚æ+Ä=bŽGcó2°?©ð5¹9S}Êû‹QôÂ|YM·Z_=È“<Ù#ÔdO$â‰ýÍÌ_aº{ÿ\0LŠÍžjJªdb:þàšIçù6·cÓýœ¤4QÚ*Øˆ™^ÃíQè+ÝD4Ì#˜†Ón\n£\nµ>{²|öj‡²E´6ÀÄÍ`­‰	Ž¬JËç¸èñÑÑVÄº\Zñ¡)Ô†ÄÔÙ”HÒ\"<|f*­+{\rw!éþÍ$ÐÓ™}02âÝFIÄXx!1ò:cvd,óÈ“&bžÌîO\0j•3‘\'$¡qð>}‹ßqßo°ÇÕk,/^åMRä§‘¿L(%L÷è¥Þµì‰F£Óý–Œè¤ÌœÀ(¢™9\nzDÆF`]®Q™´¾Â—½zCy+ÐNQ\\7¯m\\xaŒœp61×Ò‚Ó×ºþÉ’këši!+![²PÅ1æ<Ç˜ócÌy1æ<Ç˜ócÌyÏ!ä<Ç˜òAÊ2bð\rŽÑr1·h¸YQ…Eèö„ðÅ-²¶\r,™°RÌÛ;}Aå«8MžyÏÍRÇÄ$“xcP’üùýI`5k“æ~dIµ\næ´„¹á/çú\"Lùÿ\0)M¾…)JR”¥)JŠR”¥)JS’HFøyØÃ5†5¸—jÚ+S1©›­DC1X˜ùw(REHPÔù<¥*/ÐÜ(CzENoÂ5£R&¯£ò¿Áæ˜ÁÕøEe+)JÊR”°¥)YJR••”LÕeRRKçCû4Ìo`L(„Œ×±Æj´z¡µá1é[£ŸŽKŸÀ¬¥e­øF¶Óìt?™$ûÇq»bG\"zb<—Ú»ƒ–Ø<	¢Óék¡Í›DÖ¿AMéúûG¡oêïÓžŒ]W\"Ø÷ô#CO¡É±§O\"ÙÉÇC„mÑõþ#ÿÄ\0&\0\0\0\0\0\0\0\0\0\0!1A aq0@Q¡±ÑðÁÿÚ\0?Š±š¨½iQ¿¶¥.³¡	NŸ’k4½3TôÀ|ÔmåSÍƒ@ÙÁ8¥/Ìû\rŸ!˜®i´›L“M<dâ“É»÷4«ƒ½×°I—bó#uÑ«q#$›ð\'|£SLˆ„kÐbGXßQ©=ÆëP‘lv§R,š›‹1!&Â\\Øc8Â÷\r¬‰ÑÎGA6DÔL¶*dcìiîFF·éÎ\'ñÞæM…Kíþ˜«7„ëø”“o\nG;šbA	nqè¡¿IÙéßFô$–ÂD6Æ¢Dˆš%D Äd¸+™éjáŽÀ7™¿ëè$1ÍwÈÄåÑã‚+6yù\"®\n$&Gµù\'Ô¥)JR”¥)JR”¥)J&&1Jô¬]Ë«pní­%’wpò,!¥ez-±°mŽ<U_Ü	&öcz%£4oFmbCfÈC˜íûZCRézï°¢²\"¹Úûøù*$B$Ù˜[¤£1Ü1JZ°·(Š-Î–X]7¡°\ZÑì‹sø6Qº¢x~³›1+ ¥ÖëKéR”¥(Å+ñÏ‘l·Â?EF8*bO“aÇ‚*¡‰Q(E¬¡Ó‚åE†R”¦JÊÊÆßJÊÌ™+2Vgit½ºR”¥Ö”¥(èŠÃB…ç)t-&ÐÝ0%5[^à³qü¼éJ]w?Uïï‹GÒ„>çÿÄ\0)\0\0\0\0\0\0\0!1AQaq‘¡±ÁÑáð 0ñ@ÿÚ\0\0?ÿ\0ƒ$½,á@VÞ\n½‘:ˆ< (ZÀ{?ü/¥k—\n,AÖî¹KR¦T>â6‘ÿ\0…DZÍuÄJ‰v |Oý´ªþ)\'‹)o¼À”{L>~·‚ç	¼¥\0È½R’ðÈTïÍWÒòŒ½·«Äfñ{Ùç\nsó%ŽiSgzÜ©Ç©@3ƒºýÊÕ‚øpá<o\r¼ŠeµtË´ÖvÌxñwÊŸÈŠvz<Ç|­~G#ßhÓù²Æ³ù~åYz(%`÷†µþso[G(»ù°¦ûyFí£‚û†*Žª‹}ï\n–ÚeÌ-‡FÑ Ò‚ž·™‹m^TÞíb5¯u‰…øq~¶å¨º¨7*v¸ÀKæ®ß_Úë=?Ý¦áí*`x8ÅÜêfü˜Ôt¼«\Z£ó(…£¤üÊoHþå¼)¼?s•à?¼u•tr~±XZ4×î“nPþåS2ÐƒùƒGÉ	ÛYÖÇÉ¼WçÎ(~\\klyAÌ{T«KtµÅ_.ÚŽs†)—YqX—¨¡-ÕM¢;6¢‰¯µ¿pŠUíûŠ?&ƒÙEk	ç+6>RÝ\\£bÀh[ñ²>HÛÜš*ÍPläCQ•„ìNh(Ë-Öþ\r²šNTd¤‰eäI¡ÊØé-/œŒs€¡„<Q+¢<ÿ\0.—¢-‹nsNf_%	?YY¹ueï“1XÍŒ¡ó8ç3ÈžcNPµÛ\\TVî·,V+ÜÓ\Zé1V…w‚»¥\'ÉûK¥Ù,Ú[ñ.ËŠòY]#Î?tª¾¬r]ÔÑ¥‹¥Uõ`Ð5}˜\"8ŠÝJ“/PàÅy¯™nWX—‹ÙâíL¸‚¾.WSˆªÊs»‚éH.,¾I”å32Œ×¸h[;Q¶«Dì3˜;cól¡—.H Òº1`Nl‡x~`š  IU©:÷‹òàÈyåö|[4Én“§ùÀ4Ì£iAÊÀñ´Öª†Z%C›÷ŽR.N°1øË®©™®¢àùÎ[ÍF^Ã÷d´éª÷¸o¢³ú–žT~ÙŒ‡FÅÑE]ý%/s-­VUz‚®Ç¢dú™•êæ5ÑÉ5¸ÖŒB…n\ruôXp-I™Da´¿=aU¸vš‹ —â0S\'ysÑœDórì*¬Ü:œN7¸h|.[À`:v\nÐ³ƒ.)7®¶h¥/îk•í`f°tŠ]²Ô-†Dú‘µ¼_ÒôR¿>ðÉ´C¥o´o‰Y  Ê¿º#gìoŽ·3mk85c °D3œ6(ÑRñ©­Ö÷!5ÒÒLÌ²ìø©n|å­R¢å‰]t¸jø Ä¢ŠT€Å¿è(®xÉQA)Ú?5póäfVÞ™Â±\\ûÀÔ¥p\"¥+§\ZJËe—@…ÕN	ê‘°Ž(òÃ\0|Œ¢†BsfWóþ§Ic‚âQkŽ‘rVØ±O[¼HÐµ<JÈ™_ø‹’‹©Â±â*‚mª€ßŽó ¢½ Y-ØÄ½»˜¯/ÿ\0%ÚºFÜ5ˆ¸ê°ØÔ´`]+ox\'8ù–/˜JÛÞ Þ¸žæ54”Þ7±º¹{ë(°¸/0tÊ›bÚs—‰µÄK\r |Ë*>#rw7f ¡Vüý`Ž±·`´ëÑ=÷üÀ»*ß‚TÎ‡øÔ¢@»é³;>bbËž5/Éù|76¤ˆT9lËæWó±à›ÈáøŠXM*¹8r¯’)A±Âê&‰N(¡‘·§|·j†E£¾µø@»5P!@(•§Ã$m^h´²Mß]vjš¡iB<ãøÅM’™G¦, ˆŽ²ügq©‹KñQKm0<]{x„(•\'Çî(qM¥¸M¯pÙáüÍŸ´VÌ^ÃòÁ(öí_‘Ï‘W>ñ£˜âÚ}9EÜ5rÇÐÅ/ê	L˜èCWÞŒÅ(…q*©OÖ¥NN°œî*Ê æ:ªÒ®XÐSxMŸðÊ\"°eaJª²Î[G“‡ØÌ“&¥c	i…[HÖN¡£jÝ hdß¼Zi>¥¾Ì	`\0±©ìÊ”ªÀ+¬Þ·*^™¼|—÷	rU¥€09S\r’º!^^»®U\r’8V:²—°o,(îœÔSÇ-TZ½åÞ Š;,©T²tÁSmYaèD’†­B†I½ì¶yNvRlcÜ\\®˜WW…Âa4°œd\n±²ï‰‰pnVFMÂæÿ\0ÅL®ðº>WŸãýN‘ú\"¶	æ9»ã™èå¢+`˜Þc›¾9ÛÄTt¹fñ­ÅêWy¶¡T¹â6QUÚ_à–¢lœwæ^Àîô–¢lœwæcŒÅ£UÑó,bµ1XÏ‰j²Ê–K˜¬gÄÈlù˜³!tÇX–¹x˜2õ‰x¤fšÞe6/´ô¼D¶ÐŠ6W‚Qn%÷¹j8Ix¨6xÉ£„[\0ÎžGÐî–vaâr0}÷>YŒ°Òã%—(…W*×$ÇÖá¼ÂA¦Ëµ¤ßˆ@ÒZàÕÑ‚‰R¡7 ö–35JTZ=r‘wåçí¥ûX”X {3õ‡›Ù}cRaaàÊÖ°šV×qœD@Þ åÓËpå\0Õ‚µ•‚õ„|ÿ\0¥¥*ÝW-q7¢ðw§-æTŒŠà,Û þ¢wT-S]nÞ{$)i6Y‘Ÿ¦â…:‰-dù‰ê¿ë\"ÂýÉ¤°BÚSt]¬?d¨%Ï•mÇA‚À :ß‘PËQÏkŒVN1¹S9Áó@P÷* n\rÐR\0ÞùØ™UÊÔïÄÀU\rgâmãN3â\n®û¹If9Ip.˜Æc1CãQÇ[•ŒUÎ•¼s(¯äÄÉ¦\0Ù·v¡iºj,‰1L6µ+è,8ÌÄ©Ð-Üél^Q;œ.o©z7‹Ž+#>‰Wè‹ A—å5Ùö\'(Sº¶v–Â€B·ðÍÙPL!×]bR‚Ý•¡Î©½r…®6T©×co¬\0\0èN.œæNtœðƒT‹“­XPÌ±òãÄ/.æ3êe*¬V¿Êè¹åJ_°t^ø…A.r£X¼«SP°¨j…Uì`§KP[lRélq 4ã^W,\0ðª­r¢×Æ–,[&x¡©‹)g[þú©jëZ ¡––^y¸¨]—pPËK/<Ü\\ä9Ô{3\0í¬ÇaÏmK¬¶ØÆØYO‰¼è–½Ìrë0ñW –½Ìrë4ÊÃ¥KZE¬s¿37kê<Mu”¯öfn×Ôx‡¹iûf_3mJWXèÅ^núÆ#n•ƒ„–6ð\nÂ]ØÜ©îaÆaä÷í\râ[qŽ¬˜ –l¹·GsÅËo—–SgÜý4Ôöäo¨-ŽeIrY_ë€¦+•×0Ö„pº#t½§YœF@¢‚UkŽ7Æ%(ì±QXÅ³M’ÌÕ1nùów½àb§AÄ÷P¡½+‡Ò@°™M	`-Öy‡XÊÉ¢ 1’³Ä¡8Æ#˜à\'NZMÊYy5ˆ¥¥ÔpØ+CŒÞf@ÙßõÏÒZÎ!ãµ)—\\À;œÓ#•@=£µux¾bo,&ÂÏ™”9=×7—£ï0ÈÓÞ_:iÚÇCl`LhËÐ8ge·œšù§¾	~ö/ë×˜¥µy½ªŠË®Í-ÚÓˆê‰Ê€.ºªrÊÔ-V‚©ýÃGO[œ.±EÚÙ\Z½;DKë“4MÂ0q)“Þ£\n•+¨wg‹ŒÍ)£´Ñ¡°+Tt­åÿ\0ák´S¬%»Œ¸F–Â “5‰ˆÚÆ’¸%•À+8µ¥˜ìG\nEþ?Öé®º„«®e;|FíÃîn¡*ë˜–çuw€:SÚm›b·‚\n®7·¤pwÔ6ÁŠ…äÔJr°pØg*Mý%U¿HªúE=j-AW%û€½Ž‘jºø™Ðd`S{{æSX-–5Œ÷Ž)§Ä¸Žc+ÔÒ+ÛDÙŸ-êZ¼ôŒŒª!¦·Ý¦\r·Ã6è9\nê&3.K°P¼¸7º”b@(Æœ—æVx7¨O‡ÄñkjµìíÁ\0	¢¼ÿ\0³) 6{@¸Pàïnˆ”(Y3yÓŒø‹×\0»£/9ù•(N‹‚r|î_žG/îh„ö¸•,¨NhO÷IE‹d^Js¥ æÐóuKÜ7›kÇÂÎð^\".Š+Â”\r¥nãæS¡|•üDó[›šëWPêæoxV“Ñ-´”<+»YZ ñ]å|Ëîª&VKÚ’\"v\rã!Æ÷öC)ÅË­Ç ˆ=bE•ƒÎlŒÀS¾\"pU;Á|^Å2\0‘‚ïŽi%±“v÷¿¹—ó€qßðýcäÂšïf…å720z-€èó™Pk<\"žóG@òÓ§Ø\0\0Ý¹½ÄR[¤/mŒÙmÊœ»8ˆa?“Êà‡P\"-‘–\0 XÝD0©\\}$¡j•VÕ)ÆiüÃo +“q¼?øIç¶H-xK,ÔÝg=\nb—èM%!”:´\nþ+—ý›f(9‚÷™yV¢›­ô&(9‚÷˜µâX®¬º¢„Åƒ¹tôÏ¸7®X>™‚9©¡ºÏYw‡ˆ#ššÑžaË¹|ý¡‡™U·§<u\'.ò«n%‹îPZ¾àPTê<J^~±õ[–ÅÌFúÀ(†x€]yªR¢=`mT³kâ ¦¯„6úµ¨\Zí¸d»\Z^êü±Š\0ìU³®7\n\rÆ‘5ÞË£æ%ITƒ¥N×(e-\nz˜G0Ý\n´.lUÞn/‰i†0öéëÄÒR1ee©×g0½û:@£W*(Òý¢äÖ*jäÕàÑå…ÌÖÁå7ð 	©@\01ëéœKÖ™$y/2èÁlR@Qe°¬êûÅü\0¦–Þ÷¸wVåqõ›µÅVV\'E-aýv¨’§vŸe¦gw‹[É1«xJcÜ†£ ¬ì\\ÝÚdï.ÖêÐ–K¾Á0€ÖÙ )ZÁl³£Ç“øŽBçÛÚ_ c3þÓˆœ±cpsÛÜÈ„‡±Ô.Û{GÄÙáólûC¬ÉBßßÚÈïh.Äáæ\nZ‹3ytí€wN\\ð°7Î²H)-=¨e«J%\n]…K¶²$8ž¨œe‘ ƒ};íE80s‡ÉÐXV\"#ÿ\0}LqÝZºÊEÂ2¶NL‡g®5ïiò~VÐ,À„³Ý¨É¬ßðªÝrxo´³œÍµƒÔR·mÅµÒ¸–s™¶°zŠQo9™;f/š :Ë«rÀyXV2ß‰uË\n-<Käßy­ÛÄô…ž%òo¼Öâ?ªÅßÚb¶âe…ÇhvX§Z™aqÚ6„ÞûK/~’¨4EMÅ¯´V±Y+b-;»Á]£ÎsÚU.üvƒnsˆÂê€:ZK8¸t·ÅC‹.mÊ1·HäßÄ\0h‘ÏBB@Ñ}¡ŽÌdïM^£Hú—FåÉâÙúÆÁŽÖ?qPªÐ÷óP‰ÎDªéxaÓ!¿=eÃÔeþ¦h*3Å«èÄ²¥xPoÏL§3ÇZ\Z% E-ÓNWY½\'ÀäºGCÌgå‚YxéÝl6Îë‰º¦dÞV<ÓÈÀ\'P44¨5ññ\nÞÊÝ³³ËhÕlŽ+¡š|’ÔÝy–0½–ù_ˆ\\§º×¿ÔFps-0Sâ4Rí˜Ì\'ÓxÌEnäóÜ¶¹)N•«»E=´§g1B\0¦üóíÔp*,s™ð;ˆ”l=˜eôéä·ù‘†ÇVšŽÝaÑ8Ž±šÂ†°[k\06¨E\Zê%DÂ˜~~“`\rÚ®a–‰bÚE€°µ­êÁë%Ü9¦‹â¢´}iâ˜!5wX.§Q¹(†]Ø-ÛpäFvå±RQÐ\n@g¨F–Ygk#·$¸öÊaO–•êë-â+y!çywHDm’çøŒ¥Árõl†÷ß˜´VŸÝÜðöi4ÚQF½Ò“F¼!)Õ“V¸ÜXŒ“šû@:ž°¶6¨XÞ!Mbï\0;ÉÒÄ!;§´éë³!ˆÖau¥[™áˆê¨P±²„*I)%³ak¢|®ìí2¼4Ejs 0	ÈÈJ+2—Ë\Z}e–ãÿ\0Qûáþòì!¶¿¼m÷¡qYF€¿zmamÙ÷Uq[\nZÎ`À¨xù>Eh¸Žñ&¡°C¾€.B™!ø»ò+ÏHS¶uB.¶Kíqª•ÛÔ«sºWhUj±ö·÷ªÝ˜qóöÑª[B DïJ2*p)í_hÊÃzOÌ2€uÅ~²îômþó\0%oüejlëoÜµ+o¼ß®ÚÅÝp²—øE®n‡N[¬ã´*ÖdsW§9Íq*aÐù\nK÷\Zq¼Á×©Å‘æ²<8zçÛ:•-)üÊÄË\nË\r¾®Ü]zPŠñ[™h­½Ùr×Ë [#–‹A\r!úš‚,,Åãr2–Ù–á§u@LÁê¼’°Ýøh@¦_ýwCðcÃ—Ã6%ÒUZ¶nØ.ZŠ$ÎÏ3Ó¸P\"®{O!ò¶Ò’=­ÂkQ×+ô‹ÞE	NÂ„¡·‡ñÁÿ\0dUQ.u®ŒÂux±1Q·Gˆ*ªjk©]ïÖ5™~B!¾!—½æÒUrTr2²ïv–iôAØ¤²fÕËwQ£i™•Ý¦[Â\\â2SÚ¼slù…Œ”öƒ»¦e†n{c¹.ñ¤¸UTð\\Ró¦*zûEËffêÙ3~\Z”»ˆ«-O-r[ùÌ±µjÁ\0Øà9`êeù2úKloÁÄ·ú%Lô–M\']Ä[]¦[Û-Ü5Ÿ\Z—kè°-]:z”*…®jÀäßhÕÃC¡FóÝÜMö+rÈhGžŒJ-‹Ìö’Âëû\"|»„kLg³|Ëï ÒbñE\0Ý\Zi†”‘Èý‘j‘„ö–0è²iV=êüJo.\\°Í¾e-é±ó/	n”l%NX\0#“†-¸‡G1çBš·Ü50÷?oÜ@;Ê´}aV¬Ø¡¸í™Ó»¯XsE\Z­}ã×ªþ¦¨WÌ<AÝ‹[a\0©v\0b-·’6í1¿×óZð \0…HÙ„8«^0?@lF˜ª4ªZˆ(\r„%ÇrØšÅ¬Z]M(¤VP\"ÑDºERÜ¾JÆÙ^ðI=…zêÖPÙ‹#	3Ö–äBà»Í~n¬46Ô¼„àHËÐ×9›„Úb\ZíhQ”¢Ô!‰\'ºÙ;ÆbkŠŽ*ï)¼ŒcŠ{°#tDÎø†46ŒCv4d4q¼FŸ.}H[EÈF³ÄßÑ	u\0µ`Sq!¢¡j\0¶ ÚŒ¡6ÜÔQpâˆ™\\‹ØÒ\nNlZ® Œ8E\08ŒÅß)v4”PàÜÆu* ¢Í…(8ùë•\0\0\n½\Zþ®½ˆ¬]C$¢öƒWl‹}ÊwÌ§Ä¥aÁÖ!Öž‘4îWÇIAy¨jÔv2£‹í(î÷æ\0åe;±>.R÷îV²Ü¥eüÌºÊ7ò¾ ½åG›‰y•Õ4Du)Ü‰.ì”Þnoâw‰cÌ§XŽ¸˜¢÷ÍJåP¦\Z,1·J>ðmx 8¶!à¡ÛÕ_N%ÕŠ/¤Vm½nbCËUñ3©>b^GÄ6:’«—e®·XËbÝÅsTñ{Ž©uñ-G-Õä.&81«J®/rr„ ç+Wb;àÁÓ`WWœ»²LŒ4F®´­CN‚í¸]õ0´VÙ_Z:@w§µ¯é0”«°^j«¸°‹cKWˆQ•½s*Hv‘ÞÑ\'P®nSÜ‰¨ìMñ×¡À¶ÙÇ¡Áó0òDø÷„\'¼\n¯Ù*²\\½[ûTË»¶dêüßæmŸ§õL˜â¶¯¼[jfß G›_V$o=oÕ“jgšhã1òPÚù÷¹q6te­J‹	ê¢¥2\\³vÎ¥^·+3ÏëüÕ62‚Ì‚›ípEç³›€Þ†^ç›%”\n#{;©PØâjœ¼°6¹ H”âpµZ|û°¹!»F²±[‹Qr\r]y*œUM¨m&P Z+ÒÖÌÏã”‘QFšíÂ=ú˜¯…ñ!‹—hé2CDo¨U¥b,D\0PÃÖ.,\0ÙGlŽ”$gdµ’ãÑ\'\nê–é´.)3Lë<oX ¤¯–…Ž˜(U7hÈ=•S$[Òš*övDà‹DÈ Ñ_(OPÞXºT0†U\Zµ÷hª„2kd\r« VF†@Y”Í¿¤©!AN˜^é¸³ÓÒÕË@Ëü*N‹\n§®\"x¥š*I‘±.%K«x:ê#ôLTÔÍK‚¯>&Å;Db¦y÷ˆÎOºV%<ö˜œ™Bd¾jP7_£‰JÑè†à=ÁØ…ñPÙHm±í1Õz‰:T\nWIŽ«ÔKÉÖ!à/´]V<À\ræ+iÏ0ZP®fSFáEQd¤Û¤µ­i°Á‹†9§Ô\ræŸ0«ââ‹`\"L0!r±z7ñ1¬\n^õS­:¯PK/fGÓ‘ýÿ\0P°~ÞyoÓ}«õá°v;ïÜ¦ÿ\0 úˆ8˜BÌró¾jZíG!Ï¶•ØÊ¿9²û!\"Øc½ þL¡±º,ó²ù¸úâ›ƒ+|»æâÒWAÐÚÐE«Z»w{êÑ‡iÃÎðª’„ÖÝé¶] 89\Z.ÊbómP#Rc\0 °Ët,¬Z%\rhÆò·j†ñXB|1)]RÜ<*‹~\"YPQ]kêÔ\0V®Íy¨šì1ö\0æ~s1^Cí\r¹6%4‘©‡š=ÌùuJŒöÀSáGÝöÅf‹>ÒoÜÜ>¡[ÕYêXâ‚®ÉjquÒé~ F°ú…A	\Z <LíÓÓ!X=E5Xí)_Ùÿ\0#È$Ô‚X‚<$@€•g\\¤\Zåaª¬@Œ°-ÅP\0dvk‹&ˆP¤´ÁyšôqjK½^ÐÕŒ~†Ø¡D¼ÐR€«ZEYºwƒJ¤Š*„‹µ\0\0kS]ó8Ô‘”-t rËK¼œqh—øfÅb;\\FFÈ¨Ú®Ä‰&.`ƒâ»×ƒà‚Ì¹BâT5‘\ZS C£<ÊY’š	]ØÁŠËƒ…Ï­]ÔAÙpX],ý\0Áÿ\0RÌ//qU¶[ªV÷QXH€8JRßr…#S(GW¹ogâaÙæ=Ï˜ßTƒfeÉ—/(÷¬´¹¿-ÎçÚa¾Óæe’r¶c˜Érƒ9[7lBáÄ¿T\nï7…½ÅŽ÷æ5Z™¤É“w–L›~evbõwÜBeT\\—Uw!R\rÜaxzLb3eèacÐP(­.:f<GQYÐ1ï.DeZ¤ ¾s÷8Ì ¢¸aÁáyZ#ø=™YLl3x]‚SÃ¶d¶µ²¸ÁÄmKi#à§ænÂÎEù>±P5Y‡&Y†°&éÄÑßpv[ŸCÞ€;Ft”Z\Z—ÃAQ!tÖ|À{¡ðÈþbX®ÅÛÇH9à8L¢e5AŠÉ¹(ÊK\0ª÷å»Äq¶+pî~Šñ‰†‹.xCt’³¾Û1Avýf2×µÀF[é.DêîbFj½¯Úšv…»ÒñØ™«\\Z8§¯¸xðU\0‰N Övõ³CûoÌ¬ù*Õ¢€÷°íp€•\\0ôÿ\0q)T(.©½Ûr¿úþ®×ÞyO)sŸÏý6õÔ¬ZEVR~í‘ #°jôA<L™rµ´AW@æUq´®Æ]§edÞ?àö­GÌÎöNPiD3F€Y6ÝØ…ÊÊUV;*qv–ÕCçLò€ÖFhÿ\0¢åÒœ•ÖEQ9Èw©—$°j«¤\n^ñ\niô‹CÌÌ¢!í)Ê[¼MpžáCMw‰Ó<Ô™\"ÄÔN‰™Cfs¤™ƒ\Z],é\nš}@­ëÀ3ÒT[¬2ƒb\\Ë:1É«CÔ Ø—2‰edsÒ	>!£f;J.òñ2\Zo¦ {eFñˆÐ>%o\0õ18ø#dlø…Îéª•ØA^»ËÝPw¨îÎR†+ÆBÏÈ¦˜3\rŠû!~ôÆ®²deªúÊ–•\0¹èX9àF:*Y¤Eg>¥d—EKhü¥•t |	&!ŠîŸHò…†±1«É5	@±E£xîd³¼Î¨ØàuKÑÑ!LüÛcí2¯…\Zu§ðfDÔ1ò\rX‰lzÀý‘²ª¦­ž\"À4À˜x<uÑôkU(ëþÃRúåkÃóÛz!OÅá†]`Péäa›§B…×i_¿5µ5Çá@-Ñ¾RÅ•ŽŠ×è9 —˜!!ko’0áªNvÍÆ&Wì™¥…Ãä_Bè\Z¦’­3Ò/€«ÊoF¼õª¢ñÑõ\nÕÖz“7‰b“á)ÿ\0‰ƒw¨›ÍUvž$ÃÇ|XXl´Yn¸ëYIÁ\0Ãeì€êO%t]_‘˜~uç‰YF´»UÁÕìIŠ\"š\n¶àq:^*‡‘»†jfìÛ%M\"ÉuÌkgPñPX;¥k©¸cÒ?™O•¢•ªÜµYwp€Ø‡xZ-%ÅX\\\nØ\ni¸7‘~Q°É„Dþ¬Ñˆnîñ”QÓeÔ0räŒW]h,@4ØxI©ªèàv8Î÷œEÕ‡”Óræ]\"ì ¶	mièÌ2°J–€ÊÃƒ£Ò?”\'e¸\rÍÌë²t \0Ñ]\rÒ®áš!”Â…£¨lê(ì>`€:o5„,DaKm¡uP–8\"’‹Õ¼8„&Ôêíd\rõÃ(1.€¤ë5xõwŸ¹ô•Mß¨®ºé*Å} VÅ-ši}DªÝzˆ6µÍ’´§ÍJ?Òm 3±âRœzƒl§¨u>’‚gé\Zç´¼¾\"\ZáÕõ™¯P\'?H<åÞ¦ìü59®Ó3¹ÔÝŸ‚f¥¿$­•¸›V\rùžß\r}FýAê×F`ßÒvÇ¥ô”cTÿ\05\0wÁuô‰é~£ç}jdRã@0MM¼$ô\Z¨w[hwÆ_‡³d]uH»Wàù°4{ø4«¿“Œ\0¾“’^_Ýã˜–~€D* ºÑõ–n¼àýá².jÖ7¥iMÌör½ÖQêÍvƒõ»€IÚæü?&Å\'jýŸh÷he”|\'ÚÃÁeÍ‹êÃvæe°.½­À*¶Ãk×­çñÄvAû¸ÌÓè8bAžvxvùD¤ä6¯ó¨t–ï÷C]âÖV&’¾òìŸW	u««eö€CikGÅžÎ—tåš%`xˆè ‡»J|½¥Ò+@ÿ\08	ŸÛ¦Ÿ•ø‡Eç\n§U+Óé2_>%.Üœ\\ÒEz}%_ˆü­‹¶B	dl¦\\@¬hóƒ\'À£qÔ40åJ£jÖàgUz¤5à°]à£Fä±n–›Â6Ê´€+œK÷‡P£8\0ÊƒÓ,&¸2bˆ}2òì›{N,ãJ¤6uË\ZîJÚ5YR…	^úspP•©´öÍ‚¸ÐÞB Éx’ŠZ\n³žeîèÁ	M²†rUÝl\nVÑ2cÖk\0…a”Ãl‡Šk!Ûu×²Ý;Žh\Z…‰„¯8?OÊÌ P¶¢*­±FÆÁ H´ËzN‡©m–—j¥öf!-”¬h£&)@ƒ“¦à@QŒz3á‡Là‘‹¾ŠÍjô½”Î¶c í3£nï9µÃÜ:Ùm8ÚÑµ½°]±’Á@ÛÌK•µ×ÁÝÝËLCYÉ.æRFíf^µpaiP«¶½å³‹¾Œlé\"4¾õ`\\CT4L.Ç<¬l–1N˜d¹‚êî^ê¨ës>Þ#¥ßÞ\nê«¼Ï·‰q¶å:¾“ª#;©²ö‚£šw°Ì)NzÍAë6áïú•²î6ãé+y 1BC(¨¶?YV°Ç+.0#Õ¨¾Â%¶áE³”- äpÜ½öÈ-2Õ·Î/Th%ÖZHã*f`°ªèT¥Y‚.´ïÄá_|E.Ò;a_2«Ky¬%˜ÛOÞ+Æ÷iûÔm\nÇÉú‚P\'þ˜#ËP«eV–1ƒbQ¿°SA€D¤\n²\r&Ès\\¬Ïg¬·ó UCŽš7FžÐ,FãägÄJ†óXÿ\0tƒ¢á6G‚¦ž?`A]}-ÏæQ«Yu5QùÅÁN¤¢ägƒñ|Ôr2‘Ï\nenÃ¾¡2ÖS††žù?ûìñ?ßë‡0Û8Cs†\Z<i¹æi\r{‡3’yœ¾fˆê\Z‡Ûêsš#Hqü\ZGíCI«áóvN&ÑÚ;<ž#Ìû1ÒÀè{Ÿm÷gçûgÉ>®}É£ÇðàŽæmàþ\'ÙfžSw©ö³ü|Í¾ÿ\03ê?1Ò™÷#\rýÁÚ—–‚:óû&¸ßÃó>¦Â8y„9óOû:OÿÙ','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0\0d\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ö5ãøºk_9aŒÛÅ,`K¿r«ÙB£ibøÈc÷éZFß)o—z“¹šwpqÀ#ÔÂ¹­KIÑõ;~‹um¨K5¼ë2ÈÌ¾a\0G¹m*6.@ÇL‚ºm´Py0É¬k—3«•Yfœ}Å\nT|­÷X‚Äç\'ŠI³4mï&O6œ×M:#)ã¡\0áäî9áV—í6ÿ\0óÚ?ûìT\Z£éwX¶†wºY]yåiä(›ÜîcÉyêyõ$ñßoCFÆ5gÉkÇÚmÿ\0ç¼÷Ø£í0gýt÷Ø®ííèhû{ç½1öçp.mó>!ÿ\0Õñ‰ì»nNåI@ÚN@Ï<€0=kŒû{ú\Z|Z¤‘H²(É<ÑpUÎ‘n®¤·ÜÓˆ]›r¬Š‘G#Œgóú}nZÛê—á®¢[cÔX£\r–\rËätì?…q0ë°]ý¦8ÄÞb¾Ì\0ö= ÷öè*Ê-Ú).‡µ?\'ùààTÁÝF¢rÔôçtŠëç•ƒkà§œ\n¥{{5¬ñF±Ã*H8g˜+{ñƒŸóÐ×¥q-æJîØŽ9Ç\'üúÓÄ6ÚÄâkxdE‰B2Ê	Éõºt©œ¤ÚŠÒýG\ZÑ³“éÐï|ËcÏÚ ü\\Q\\\'ÛßÞŠÒæÝv?ÿÙ',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imported_ad_categories`
--

DROP TABLE IF EXISTS `imported_ad_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imported_ad_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_import_id` int(11) NOT NULL,
  `existing_parent_id` int(11) DEFAULT NULL,
  `imported_parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFC5711BDA69BAAC3` (`existing_parent_id`),
  KEY `FKFC5711BDB79265E7` (`ad_import_id`),
  KEY `FKFC5711BDA7E88FA0` (`imported_parent_id`),
  CONSTRAINT `FKFC5711BDA7E88FA0` FOREIGN KEY (`imported_parent_id`) REFERENCES `imported_ad_categories` (`id`),
  CONSTRAINT `FKFC5711BDA69BAAC3` FOREIGN KEY (`existing_parent_id`) REFERENCES `ad_categories` (`id`),
  CONSTRAINT `FKFC5711BDB79265E7` FOREIGN KEY (`ad_import_id`) REFERENCES `ad_imports` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imported_ad_categories`
--

LOCK TABLES `imported_ad_categories` WRITE;
/*!40000 ALTER TABLE `imported_ad_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `imported_ad_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imported_ads`
--

DROP TABLE IF EXISTS `imported_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imported_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL,
  `line_number` int(11) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `error_argument1` varchar(200) DEFAULT NULL,
  `error_argument2` varchar(200) DEFAULT NULL,
  `existing_category_id` int(11) DEFAULT NULL,
  `imported_category_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `permanent` bit(1) NOT NULL,
  `external_publication` bit(1) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `trade_type` varchar(1) DEFAULT NULL,
  `price` decimal(15,6) DEFAULT NULL,
  `publication_start` date DEFAULT NULL,
  `publication_end` date DEFAULT NULL,
  `description` longtext,
  `is_html` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA3AAB0F5FCABEF03` (`import_id`),
  KEY `FKA3AAB0F541A07D8C` (`imported_category_id`),
  KEY `FKA3AAB0F5D45742EF` (`existing_category_id`),
  KEY `FKA3AAB0F5FE01A09E` (`owner_id`),
  CONSTRAINT `FKA3AAB0F5FE01A09E` FOREIGN KEY (`owner_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKA3AAB0F541A07D8C` FOREIGN KEY (`imported_category_id`) REFERENCES `imported_ad_categories` (`id`),
  CONSTRAINT `FKA3AAB0F5D45742EF` FOREIGN KEY (`existing_category_id`) REFERENCES `ad_categories` (`id`),
  CONSTRAINT `FKA3AAB0F5FCABEF03` FOREIGN KEY (`import_id`) REFERENCES `ad_imports` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imported_ads`
--

LOCK TABLES `imported_ads` WRITE;
/*!40000 ALTER TABLE `imported_ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `imported_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imported_member_records`
--

DROP TABLE IF EXISTS `imported_member_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imported_member_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imported_member_id` int(11) DEFAULT NULL,
  `member_record_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK579F7038E46288C5` (`member_record_type_id`),
  KEY `FK579F703881B2B280` (`imported_member_id`),
  CONSTRAINT `FK579F703881B2B280` FOREIGN KEY (`imported_member_id`) REFERENCES `imported_members` (`id`),
  CONSTRAINT `FK579F7038E46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imported_member_records`
--

LOCK TABLES `imported_member_records` WRITE;
/*!40000 ALTER TABLE `imported_member_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `imported_member_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imported_members`
--

DROP TABLE IF EXISTS `imported_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imported_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `line_number` int(11) DEFAULT NULL,
  `error_argument1` varchar(200) DEFAULT NULL,
  `error_argument2` varchar(200) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `credit_limit` decimal(15,6) DEFAULT NULL,
  `upper_credit_limit` decimal(15,6) DEFAULT NULL,
  `initial_balance` decimal(15,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF8A856DE731AC71` (`import_id`),
  CONSTRAINT `FKF8A856DE731AC71` FOREIGN KEY (`import_id`) REFERENCES `member_imports` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imported_members`
--

LOCK TABLES `imported_members` WRITE;
/*!40000 ALTER TABLE `imported_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `imported_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_operations`
--

DROP TABLE IF EXISTS `index_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `entity_type` varchar(3) NOT NULL,
  `operation_type` varchar(3) NOT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_indexops_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_operations`
--

LOCK TABLES `index_operations` WRITE;
/*!40000 ALTER TABLE `index_operations` DISABLE KEYS */;
INSERT INTO `index_operations` VALUES (1,'2013-12-15 00:36:12','MBR','ADD',2),(2,'2013-12-15 00:37:32','MBR','ADD',2),(3,'2013-12-15 03:08:55','MBR','ADD',3),(4,'2013-12-15 03:11:01','MBR','ADD',3),(5,'2013-12-15 03:15:37','MBR','ADD',2),(6,'2013-12-15 03:35:56','OPR','ADD',4);
/*!40000 ALTER TABLE `index_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_text_aliases`
--

DROP TABLE IF EXISTS `info_text_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_text_aliases` (
  `info_text_id` int(11) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  KEY `FK83C54DDDB4F0D375` (`info_text_id`),
  CONSTRAINT `FK83C54DDDB4F0D375` FOREIGN KEY (`info_text_id`) REFERENCES `info_texts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_text_aliases`
--

LOCK TABLES `info_text_aliases` WRITE;
/*!40000 ALTER TABLE `info_text_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_text_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_texts`
--

DROP TABLE IF EXISTS `info_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_texts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(160) NOT NULL,
  `body` longtext,
  `enabled` bit(1) NOT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_texts`
--

LOCK TABLES `info_texts` WRITE;
/*!40000 ALTER TABLE `info_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_payments`
--

DROP TABLE IF EXISTS `invoice_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `transfer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1D3D3FFF2F78F3B3` (`transfer_id`),
  KEY `FK1D3D3FFFE9B959A1` (`invoice_id`),
  CONSTRAINT `FK1D3D3FFFE9B959A1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `FK1D3D3FFF2F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_payments`
--

LOCK TABLES `invoice_payments` WRITE;
/*!40000 ALTER TABLE `invoice_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_member_id` int(11) DEFAULT NULL,
  `to_member_id` int(11) DEFAULT NULL,
  `sent_by_id` int(11) DEFAULT NULL,
  `performed_by_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `status` varchar(1) NOT NULL,
  `description` longtext,
  `dest_type_id` int(11) DEFAULT NULL,
  `transfer_type_id` int(11) DEFAULT NULL,
  `transfer_id` bigint(20) DEFAULT NULL,
  `account_fee_log_id` int(11) DEFAULT NULL,
  `scheduled_payment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK25F222E6B3A79238` (`scheduled_payment_id`),
  KEY `FK25F222E62F78F3B3` (`transfer_id`),
  KEY `FK25F222E6A440355B` (`sent_by_id`),
  KEY `FK25F222E6A4766B0A` (`transfer_type_id`),
  KEY `FK25F222E69F954783` (`performed_by_id`),
  KEY `FK25F222E6C70B3BCA` (`dest_type_id`),
  KEY `FK25F222E66957A5AA` (`account_fee_log_id`),
  KEY `FK25F222E6823FB102` (`from_member_id`),
  KEY `FK25F222E69DCA1693` (`to_member_id`),
  CONSTRAINT `FK25F222E69DCA1693` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK25F222E62F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK25F222E66957A5AA` FOREIGN KEY (`account_fee_log_id`) REFERENCES `account_fee_logs` (`id`),
  CONSTRAINT `FK25F222E6823FB102` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK25F222E69F954783` FOREIGN KEY (`performed_by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK25F222E6A440355B` FOREIGN KEY (`sent_by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK25F222E6A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK25F222E6B3A79238` FOREIGN KEY (`scheduled_payment_id`) REFERENCES `scheduled_payments` (`id`),
  CONSTRAINT `FK25F222E6C70B3BCA` FOREIGN KEY (`dest_type_id`) REFERENCES `account_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_groups`
--

DROP TABLE IF EXISTS `loan_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_groups`
--

LOCK TABLES `loan_groups` WRITE;
/*!40000 ALTER TABLE `loan_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_payments`
--

DROP TABLE IF EXISTS `loan_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) NOT NULL,
  `payment_index` int(11) NOT NULL,
  `expiration_date` date NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `repaid_amount` decimal(15,6) NOT NULL,
  `status` varchar(1) NOT NULL,
  `repayment_date` datetime DEFAULT NULL,
  `external_transfer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAF53099C617A8174` (`external_transfer_id`),
  KEY `FKAF53099CF9B21025` (`loan_id`),
  CONSTRAINT `FKAF53099CF9B21025` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`),
  CONSTRAINT `FKAF53099C617A8174` FOREIGN KEY (`external_transfer_id`) REFERENCES `external_transfers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_payments`
--

LOCK TABLES `loan_payments` WRITE;
/*!40000 ALTER TABLE `loan_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` bigint(20) NOT NULL,
  `total_amount` decimal(15,6) NOT NULL,
  `loan_group_id` int(11) DEFAULT NULL,
  `type` varchar(1) NOT NULL,
  `grant_fee_value` decimal(15,6) DEFAULT NULL,
  `grant_fee_type` char(1) DEFAULT NULL,
  `monthly_interest` decimal(15,6) DEFAULT NULL,
  `expiration_fee_value` decimal(15,6) DEFAULT NULL,
  `expiration_fee_type` char(1) DEFAULT NULL,
  `expiration_daily_interest` decimal(15,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK625D9832F78F3B3` (`transfer_id`),
  KEY `FK625D98354774F2E` (`loan_group_id`),
  CONSTRAINT `FK625D98354774F2E` FOREIGN KEY (`loan_group_id`) REFERENCES `loan_groups` (`id`),
  CONSTRAINT `FK625D9832F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `remote_address` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK88A801BEA19267FC` (`user_id`),
  CONSTRAINT `FK88A801BEA19267FC` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_history`
--

LOCK TABLES `login_history` WRITE;
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
INSERT INTO `login_history` VALUES (1,1,'2013-12-14 18:17:31','0:0:0:0:0:0:0:1%0'),(2,1,'2013-12-15 00:25:46','0:0:0:0:0:0:0:1%0'),(3,1,'2013-12-15 00:29:18','0:0:0:0:0:0:0:1%0'),(4,1,'2013-12-15 00:29:26','0:0:0:0:0:0:0:1%0'),(5,1,'2013-12-15 00:36:53','0:0:0:0:0:0:0:1%0'),(6,2,'2013-12-15 00:38:32','0:0:0:0:0:0:0:1%0'),(7,1,'2013-12-15 00:40:16','0:0:0:0:0:0:0:1%0'),(8,1,'2013-12-15 01:30:18','0:0:0:0:0:0:0:1%0'),(9,1,'2013-12-15 02:23:57','0:0:0:0:0:0:0:1%0'),(10,1,'2013-12-15 03:07:49','0:0:0:0:0:0:0:1%0'),(11,3,'2013-12-15 03:20:52','0:0:0:0:0:0:0:1%0'),(12,1,'2013-12-15 03:30:04','0:0:0:0:0:0:0:1%0'),(13,2,'2013-12-15 03:33:47','0:0:0:0:0:0:0:1%0'),(14,2,'2013-12-15 03:38:31','0:0:0:0:0:0:0:1%0'),(15,2,'2013-12-15 03:40:12','0:0:0:0:0:0:0:1%0'),(16,2,'2013-12-15 03:48:49','0:0:0:0:0:0:0:1%0');
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_account_fee_logs`
--

DROP TABLE IF EXISTS `member_account_fee_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_account_fee_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `member_id` int(11) NOT NULL,
  `account_fee_log_id` int(11) DEFAULT NULL,
  `amount` decimal(15,6) DEFAULT NULL,
  `success` bit(1) NOT NULL,
  `recharge_attempt` int(11) NOT NULL DEFAULT '0',
  `transfer_id` bigint(20) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK74581F9F2F78F3B3` (`transfer_id`),
  KEY `FK74581F9FEAE0AB57` (`member_id`),
  KEY `FK74581F9FE9B959A1` (`invoice_id`),
  KEY `FK74581F9F6957A5AA` (`account_fee_log_id`),
  CONSTRAINT `FK74581F9F6957A5AA` FOREIGN KEY (`account_fee_log_id`) REFERENCES `account_fee_logs` (`id`),
  CONSTRAINT `FK74581F9F2F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK74581F9FE9B959A1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `FK74581F9FEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_account_fee_logs`
--

LOCK TABLES `member_account_fee_logs` WRITE;
/*!40000 ALTER TABLE `member_account_fee_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_account_fee_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_group_account_settings`
--

DROP TABLE IF EXISTS `member_group_account_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_group_account_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `default_type` bit(1) NOT NULL,
  `transaction_password_required` bit(1) NOT NULL,
  `hide_when_no_credit_limit` bit(1) NOT NULL,
  `default_credit_limit` decimal(15,6) NOT NULL,
  `default_upper_credit_limit` decimal(15,6) DEFAULT NULL,
  `initial_credit` decimal(15,6) DEFAULT NULL,
  `initial_credit_transfer_type_id` int(11) DEFAULT NULL,
  `low_units` decimal(15,6) DEFAULT NULL,
  `low_units_message` longtext,
  PRIMARY KEY (`id`),
  KEY `FK3D84E6FA797D2395` (`initial_credit_transfer_type_id`),
  KEY `FK3D84E6FAB45926EE` (`group_id`),
  KEY `FK3D84E6FAB93596D` (`type_id`),
  CONSTRAINT `FK3D84E6FAB93596D` FOREIGN KEY (`type_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `FK3D84E6FA797D2395` FOREIGN KEY (`initial_credit_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK3D84E6FAB45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_group_account_settings`
--

LOCK TABLES `member_group_account_settings` WRITE;
/*!40000 ALTER TABLE `member_group_account_settings` DISABLE KEYS */;
INSERT INTO `member_group_account_settings` VALUES (1,5,5,'','\0','\0','0.000000',NULL,'0.000000',23,'20.000000','You are reaching your credit limit'),(2,9,5,'','\0','\0','0.000000',NULL,'0.000000',23,'20.000000','You are reaching your credit limit');
/*!40000 ALTER TABLE `member_group_account_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_groups_custom_fields`
--

DROP TABLE IF EXISTS `member_groups_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_groups_custom_fields` (
  `custom_field_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `FKABBE5CA1A288505` (`custom_field_id`),
  KEY `FKABBE5CA17514938B` (`custom_field_id`),
  KEY `FKABBE5CA1B45926EE` (`group_id`),
  CONSTRAINT `FKABBE5CA1B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKABBE5CA17514938B` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`),
  CONSTRAINT `FKABBE5CA1A288505` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_groups_custom_fields`
--

LOCK TABLES `member_groups_custom_fields` WRITE;
/*!40000 ALTER TABLE `member_groups_custom_fields` DISABLE KEYS */;
INSERT INTO `member_groups_custom_fields` VALUES (1,5),(1,6),(1,9),(2,5),(2,6),(2,9),(3,5),(3,6),(3,9),(4,5),(4,6),(4,9),(5,5),(5,6),(5,9),(6,5),(6,6),(6,9),(7,5),(7,6),(7,9),(8,5),(8,6),(8,9),(9,5),(9,6),(9,9),(10,5),(10,6),(10,9),(13,7),(13,5),(13,6);
/*!40000 ALTER TABLE `member_groups_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_groups_default_sms_message_types`
--

DROP TABLE IF EXISTS `member_groups_default_sms_message_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_groups_default_sms_message_types` (
  `group_id` int(11) NOT NULL,
  `type` varchar(3) NOT NULL,
  KEY `FKCDC0F1B7B45926EE` (`group_id`),
  CONSTRAINT `FKCDC0F1B7B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_groups_default_sms_message_types`
--

LOCK TABLES `member_groups_default_sms_message_types` WRITE;
/*!40000 ALTER TABLE `member_groups_default_sms_message_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_groups_default_sms_message_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_groups_email_validation`
--

DROP TABLE IF EXISTS `member_groups_email_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_groups_email_validation` (
  `group_id` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  PRIMARY KEY (`group_id`,`type`),
  KEY `FK9FC60562B45926EE` (`group_id`),
  CONSTRAINT `FK9FC60562B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_groups_email_validation`
--

LOCK TABLES `member_groups_email_validation` WRITE;
/*!40000 ALTER TABLE `member_groups_email_validation` DISABLE KEYS */;
INSERT INTO `member_groups_email_validation` VALUES (5,'U');
/*!40000 ALTER TABLE `member_groups_email_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_groups_message_types`
--

DROP TABLE IF EXISTS `member_groups_message_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_groups_message_types` (
  `group_id` int(11) NOT NULL,
  `type` varchar(3) NOT NULL,
  KEY `FK348B579BB45926EE` (`group_id`),
  CONSTRAINT `FK348B579BB45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_groups_message_types`
--

LOCK TABLES `member_groups_message_types` WRITE;
/*!40000 ALTER TABLE `member_groups_message_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_groups_message_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_groups_sms_message_types`
--

DROP TABLE IF EXISTS `member_groups_sms_message_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_groups_sms_message_types` (
  `group_id` int(11) NOT NULL,
  `type` varchar(3) NOT NULL,
  KEY `FKCF01DA35B45926EE` (`group_id`),
  CONSTRAINT `FKCF01DA35B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_groups_sms_message_types`
--

LOCK TABLES `member_groups_sms_message_types` WRITE;
/*!40000 ALTER TABLE `member_groups_sms_message_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_groups_sms_message_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_imports`
--

DROP TABLE IF EXISTS `member_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `initial_credit_transfer_type_id` int(11) DEFAULT NULL,
  `initial_debit_transfer_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF21FF8C9123F9A53` (`by_id`),
  KEY `FKF21FF8C9C2D40D5B` (`account_type_id`),
  KEY `FKF21FF8C9A824C958` (`initial_debit_transfer_type_id`),
  KEY `FKF21FF8C9797D2395` (`initial_credit_transfer_type_id`),
  KEY `FKF21FF8C9B45926EE` (`group_id`),
  CONSTRAINT `FKF21FF8C9B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKF21FF8C9123F9A53` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKF21FF8C9797D2395` FOREIGN KEY (`initial_credit_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FKF21FF8C9A824C958` FOREIGN KEY (`initial_debit_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FKF21FF8C9C2D40D5B` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_imports`
--

LOCK TABLES `member_imports` WRITE;
/*!40000 ALTER TABLE `member_imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_pos`
--

DROP TABLE IF EXISTS `member_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(64) DEFAULT NULL,
  `pos_pin` varchar(64) DEFAULT NULL,
  `date` datetime NOT NULL,
  `allow_make_payment` bit(1) NOT NULL,
  `max_scheduling_payments` int(11) NOT NULL,
  `number_of_copies` int(11) NOT NULL,
  `result_page_size` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `pos_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB0148F2FF3ECFBC0` (`pos_id`),
  KEY `FKB0148F2FFE01A09E` (`owner_id`),
  CONSTRAINT `FKB0148F2FFE01A09E` FOREIGN KEY (`owner_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKB0148F2FF3ECFBC0` FOREIGN KEY (`pos_id`) REFERENCES `pos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_pos`
--

LOCK TABLES `member_pos` WRITE;
/*!40000 ALTER TABLE `member_pos` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_record_types`
--

DROP TABLE IF EXISTS `member_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_record_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `editable` bit(1) NOT NULL,
  `show_menu_item` bit(1) NOT NULL,
  `layout` varchar(1) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_record_types`
--

LOCK TABLES `member_record_types` WRITE;
/*!40000 ALTER TABLE `member_record_types` DISABLE KEYS */;
INSERT INTO `member_record_types` VALUES (1,'Remark','Remarks','\0','','F','Remarks');
/*!40000 ALTER TABLE `member_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_records`
--

DROP TABLE IF EXISTS `member_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_record_type_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  `by_id` int(11) NOT NULL,
  `modified_by_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBFDA159D2B1214C2` (`by_id`),
  KEY `FKBFDA159DE46288C5` (`member_record_type_id`),
  KEY `FKBFDA159D47C8C3FD` (`element_id`),
  KEY `FKBFDA159D41B97FCC` (`modified_by_id`),
  CONSTRAINT `FKBFDA159D41B97FCC` FOREIGN KEY (`modified_by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKBFDA159D2B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKBFDA159D47C8C3FD` FOREIGN KEY (`element_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKBFDA159DE46288C5` FOREIGN KEY (`member_record_type_id`) REFERENCES `member_record_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_records`
--

LOCK TABLES `member_records` WRITE;
/*!40000 ALTER TABLE `member_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_sms_status`
--

DROP TABLE IF EXISTS `member_sms_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_sms_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `free_sms_sent` int(11) NOT NULL,
  `free_sms_expiration` datetime DEFAULT NULL,
  `paid_sms_left` int(11) NOT NULL,
  `paid_sms_expiration` datetime DEFAULT NULL,
  `allow_charging_sms` bit(1) NOT NULL,
  `accept_free_mailing` bit(1) NOT NULL,
  `accept_paid_mailing` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`member_id`),
  KEY `FKCC65105DEAE0AB57` (`member_id`),
  CONSTRAINT `FKCC65105DEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_sms_status`
--

LOCK TABLES `member_sms_status` WRITE;
/*!40000 ALTER TABLE `member_sms_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_sms_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_sms_status_locks`
--

DROP TABLE IF EXISTS `member_sms_status_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_sms_status_locks` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_sms_status_locks`
--

LOCK TABLES `member_sms_status_locks` WRITE;
/*!40000 ALTER TABLE `member_sms_status_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_sms_status_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `creation_date` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `member_activation_date` datetime DEFAULT NULL,
  `hide_email` bit(1) NOT NULL DEFAULT b'0',
  `member_broker_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_email` (`email`),
  KEY `FK388EC91941F9CE53` (`member_broker_id`),
  KEY `FK388EC919EAE0AB57` (`member_id`),
  KEY `FK388EC91925A5B3E8` (`group_id`),
  CONSTRAINT `FK388EC91925A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK388EC91941F9CE53` FOREIGN KEY (`member_broker_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK388EC919EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'A','Administrator','2013-12-14 18:15:32',1,'admin@mail.nl',NULL,'\0',NULL,NULL),(2,'M','Roberto Andrade','2013-12-15 00:36:12',5,'roberto.andrade@gmail.com','2013-12-15 00:37:32','\0',3,NULL),(3,'M','One Thor Branch Manager','2013-12-15 03:08:55',9,'onethor@branch.acacia.br','2013-12-15 03:11:01','\0',NULL,NULL),(4,'O','Robertoperator','2013-12-15 03:35:56',12,'operator@robertoandrade.com',NULL,'\0',NULL,2);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_channels`
--

DROP TABLE IF EXISTS `members_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_channels` (
  `member_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  KEY `FK66F8B836EAE0AB57` (`member_id`),
  KEY `FK66F8B8369B71D578` (`channel_id`),
  CONSTRAINT `FK66F8B8369B71D578` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `FK66F8B836EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_channels`
--

LOCK TABLES `members_channels` WRITE;
/*!40000 ALTER TABLE `members_channels` DISABLE KEYS */;
INSERT INTO `members_channels` VALUES (3,1);
/*!40000 ALTER TABLE `members_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_loan_groups`
--

DROP TABLE IF EXISTS `members_loan_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_loan_groups` (
  `member_id` int(11) NOT NULL,
  `loan_group_id` int(11) NOT NULL,
  KEY `FKBE11EDDDEAE0AB57` (`member_id`),
  KEY `FKBE11EDDD54774F2E` (`loan_group_id`),
  CONSTRAINT `FKBE11EDDD54774F2E` FOREIGN KEY (`loan_group_id`) REFERENCES `loan_groups` (`id`),
  CONSTRAINT `FKBE11EDDDEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_loan_groups`
--

LOCK TABLES `members_loan_groups` WRITE;
/*!40000 ALTER TABLE `members_loan_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `members_loan_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_loans`
--

DROP TABLE IF EXISTS `members_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_loans` (
  `loan_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  KEY `FKAD520EDDEAE0AB57` (`member_id`),
  KEY `FKAD520EDDF9B21025` (`loan_id`),
  CONSTRAINT `FKAD520EDDF9B21025` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`),
  CONSTRAINT `FKAD520EDDEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_loans`
--

LOCK TABLES `members_loans` WRITE;
/*!40000 ALTER TABLE `members_loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `members_loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_pending_charge`
--

DROP TABLE IF EXISTS `members_pending_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_pending_charge` (
  `account_fee_log_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  KEY `FK265D1E42EAE0AB57` (`member_id`),
  KEY `FK265D1E426957A5AA` (`account_fee_log_id`),
  CONSTRAINT `FK265D1E426957A5AA` FOREIGN KEY (`account_fee_log_id`) REFERENCES `account_fee_logs` (`id`),
  CONSTRAINT `FK265D1E42EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_pending_charge`
--

LOCK TABLES `members_pending_charge` WRITE;
/*!40000 ALTER TABLE `members_pending_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `members_pending_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_categories`
--

DROP TABLE IF EXISTS `message_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_categories`
--

LOCK TABLES `message_categories` WRITE;
/*!40000 ALTER TABLE `message_categories` DISABLE KEYS */;
INSERT INTO `message_categories` VALUES (1,'Support'),(2,'Administration'),(3,'Loan request');
/*!40000 ALTER TABLE `message_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `subject` varchar(255) NOT NULL,
  `type` varchar(3) NOT NULL,
  `direction` varchar(1) NOT NULL,
  `is_read` bit(1) NOT NULL,
  `is_replied` bit(1) NOT NULL,
  `is_html` bit(1) NOT NULL,
  `removed_at` datetime DEFAULT NULL,
  `from_member_id` int(11) DEFAULT NULL,
  `to_member_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `body` longtext,
  `email_sent` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE475014C3F6F4BDC` (`category_id`),
  KEY `FKE475014C823FB102` (`from_member_id`),
  KEY `FKE475014C9DCA1693` (`to_member_id`),
  CONSTRAINT `FKE475014C9DCA1693` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKE475014C3F6F4BDC` FOREIGN KEY (`category_id`) REFERENCES `message_categories` (`id`),
  CONSTRAINT `FKE475014C823FB102` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages_to_groups`
--

DROP TABLE IF EXISTS `messages_to_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages_to_groups` (
  `message_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `FKE76064E5B45926EE` (`group_id`),
  KEY `FKE76064E52FA70115` (`message_id`),
  CONSTRAINT `FKE76064E52FA70115` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`),
  CONSTRAINT `FKE76064E5B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_to_groups`
--

LOCK TABLES `messages_to_groups` WRITE;
/*!40000 ALTER TABLE `messages_to_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages_to_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_preferences`
--

DROP TABLE IF EXISTS `notification_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member` int(11) DEFAULT NULL,
  `type` varchar(3) NOT NULL,
  `is_message` bit(1) NOT NULL,
  `is_email` bit(1) NOT NULL,
  `is_sms` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_np_member_type` (`member`,`type`),
  KEY `FK9BBCBDA45AA28D11` (`member`),
  CONSTRAINT `FK9BBCBDA45AA28D11` FOREIGN KEY (`member`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_preferences`
--

LOCK TABLES `notification_preferences` WRITE;
/*!40000 ALTER TABLE `notification_preferences` DISABLE KEYS */;
INSERT INTO `notification_preferences` VALUES (1,2,'mbr','','\0','\0'),(2,2,'a2m','','\0','\0'),(3,2,'a2g','','\0','\0'),(4,2,'acs','','\0','\0'),(5,2,'act','','\0','\0'),(6,2,'brk','','\0','\0'),(7,2,'pmt','','\0','\0'),(8,2,'ept','','\0','\0'),(9,2,'loa','','\0','\0'),(10,2,'ade','','\0','\0'),(11,2,'adi','','\0','\0'),(12,2,'inv','','\0','\0'),(13,2,'ref','','\0','\0'),(14,2,'tfb','','\0','\0'),(15,2,'cer','','\0','\0'),(16,2,'gua','','\0','\0'),(17,2,'pob','','\0','\0'),(18,3,'mbr','','\0','\0'),(19,3,'a2m','','\0','\0'),(20,3,'a2g','','\0','\0'),(21,3,'acs','','\0','\0'),(22,3,'act','','\0','\0'),(23,3,'brk','','\0','\0'),(24,3,'pmt','','\0','\0'),(25,3,'ept','','\0','\0'),(26,3,'loa','','\0','\0'),(27,3,'ade','','\0','\0'),(28,3,'adi','','\0','\0'),(29,3,'inv','','\0','\0'),(30,3,'ref','','\0','\0'),(31,3,'tfb','','\0','\0'),(32,3,'cer','','\0','\0'),(33,3,'gua','','\0','\0'),(34,3,'pob','','\0','\0');
/*!40000 ALTER TABLE `notification_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operator_groups_max_amount`
--

DROP TABLE IF EXISTS `operator_groups_max_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operator_groups_max_amount` (
  `group_id` int(11) NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`transfer_type_id`),
  KEY `FK14F01003A4766B0A` (`transfer_type_id`),
  KEY `FK14F0100363FBF3A4` (`group_id`),
  CONSTRAINT `FK14F0100363FBF3A4` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK14F01003A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operator_groups_max_amount`
--

LOCK TABLES `operator_groups_max_amount` WRITE;
/*!40000 ALTER TABLE `operator_groups_max_amount` DISABLE KEYS */;
/*!40000 ALTER TABLE `operator_groups_max_amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_history`
--

DROP TABLE IF EXISTS `password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(1) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF16E7AF0A19267FC` (`user_id`),
  CONSTRAINT `FKF16E7AF0A19267FC` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_history`
--

LOCK TABLES `password_history` WRITE;
/*!40000 ALTER TABLE `password_history` DISABLE KEYS */;
INSERT INTO `password_history` VALUES (1,4,'2013-12-15','L','FFD23A566D99EF5E99379031ACC123F44E98BA1E9C57B1CCFCBAC2EE7ABC0F8C');
/*!40000 ALTER TABLE `password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_filters`
--

DROP TABLE IF EXISTS `payment_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `show_in_account_history` bit(1) NOT NULL,
  `show_in_reports` bit(1) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `FK260516C2461D0C55` (`account_type_id`),
  CONSTRAINT `FK260516C2461D0C55` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_filters`
--

LOCK TABLES `payment_filters` WRITE;
/*!40000 ALTER TABLE `payment_filters` DISABLE KEYS */;
INSERT INTO `payment_filters` VALUES (1,5,'Member payments','','','Member payments'),(2,5,'Loan payments','','','Loan payments'),(3,5,'Taxes and fees','','','Taxes and fees'),(4,5,'Commission payments','','','Commission payments'),(5,5,'Voucher payments','','','Voucher payments'),(6,5,'System payments','','','System payments'),(7,1,'Community payments','','','Community payments'),(8,1,'Voucher payments','','','Voucher payments'),(9,1,'Organization payments','','','Organization payments'),(10,1,'Member payments','','','Member payments'),(11,2,'Voucher payments','','','Voucher payments'),(12,2,'Debit payments','','','Debit payments'),(13,2,'Organization payments','','','Organization payments'),(14,2,'Contribution payments','','','Contribution payments'),(15,2,'Liquidity tax payments','','','Liquidity tax payments'),(16,2,'Broker commission payments','','','Broker commission payments'),(17,2,'Loan payments','','','Loan payments'),(18,2,'Member payments','','','Member payments'),(19,3,'Debit payments','','','Debit payments'),(20,3,'Community payments','','','Community payments'),(21,3,'Organization payments','','','Organization payments'),(22,3,'Member payments','','','Member payments'),(23,4,'Debit payments','','','Debit payments'),(24,4,'Community payments','','','Community payments'),(25,4,'Voucher payments','','','Voucher payments'),(26,4,'Member payments','','','Member payments');
/*!40000 ALTER TABLE `payment_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_obligation_logs`
--

DROP TABLE IF EXISTS `payment_obligation_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_obligation_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `status` varchar(2) NOT NULL,
  `payment_obligation_id` int(11) NOT NULL,
  `by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6EE4F972B1214C2` (`by_id`),
  KEY `FK6EE4F973AEC8F84` (`payment_obligation_id`),
  CONSTRAINT `FK6EE4F973AEC8F84` FOREIGN KEY (`payment_obligation_id`) REFERENCES `payment_obligations` (`id`),
  CONSTRAINT `FK6EE4F972B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_obligation_logs`
--

LOCK TABLES `payment_obligation_logs` WRITE;
/*!40000 ALTER TABLE `payment_obligation_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_obligation_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_obligations`
--

DROP TABLE IF EXISTS `payment_obligations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_obligations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(2) NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `expiration_date` date NOT NULL,
  `max_publish_date` date NOT NULL,
  `registration_date` datetime NOT NULL,
  `description` longtext,
  `guarantee_id` int(11) DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK409CBDFCC0E7F6FA` (`currency_id`),
  KEY `FK409CBDFC29C0E817` (`guarantee_id`),
  KEY `FK409CBDFC608B319E` (`buyer_id`),
  KEY `FK409CBDFC40A58052` (`seller_id`),
  CONSTRAINT `FK409CBDFC40A58052` FOREIGN KEY (`seller_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK409CBDFC29C0E817` FOREIGN KEY (`guarantee_id`) REFERENCES `guarantees` (`id`),
  CONSTRAINT `FK409CBDFC608B319E` FOREIGN KEY (`buyer_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK409CBDFCC0E7F6FA` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_obligations`
--

LOCK TABLES `payment_obligations` WRITE;
/*!40000 ALTER TABLE `payment_obligations` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_obligations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_email_changes`
--

DROP TABLE IF EXISTS `pending_email_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_email_changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime NOT NULL,
  `member_id` int(11) NOT NULL,
  `by_id` int(11) DEFAULT NULL,
  `new_email` varchar(100) NOT NULL,
  `validation_key` varchar(64) NOT NULL,
  `last_email_date` datetime DEFAULT NULL,
  `remote_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4B7C40782B1214C2` (`by_id`),
  KEY `FK4B7C4078EAE0AB57` (`member_id`),
  CONSTRAINT `FK4B7C4078EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK4B7C40782B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_email_changes`
--

LOCK TABLES `pending_email_changes` WRITE;
/*!40000 ALTER TABLE `pending_email_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_email_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_members`
--

DROP TABLE IF EXISTS `pending_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `force_change_password` bit(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pin` varchar(64) DEFAULT NULL,
  `validation_key` varchar(64) NOT NULL,
  `hide_email` bit(1) NOT NULL DEFAULT b'0',
  `last_email_date` datetime DEFAULT NULL,
  `broker_id` int(11) DEFAULT NULL,
  `registration_agreement_id` int(11) DEFAULT NULL,
  `registration_agreement_date` datetime DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `remote_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK60337271EAE0AB57` (`member_id`),
  KEY `FK603372714B8741B8` (`broker_id`),
  KEY `FK6033727133E01D0A` (`registration_agreement_id`),
  KEY `FK60337271B45926EE` (`group_id`),
  CONSTRAINT `FK60337271B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK6033727133E01D0A` FOREIGN KEY (`registration_agreement_id`) REFERENCES `registration_agreements` (`id`),
  CONSTRAINT `FK603372714B8741B8` FOREIGN KEY (`broker_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK60337271EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_members`
--

LOCK TABLES `pending_members` WRITE;
/*!40000 ALTER TABLE `pending_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_denieds`
--

DROP TABLE IF EXISTS `permission_denieds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_denieds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK61FE25C8A19267FC` (`user_id`),
  CONSTRAINT `FK61FE25C8A19267FC` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_denieds`
--

LOCK TABLES `permission_denieds` WRITE;
/*!40000 ALTER TABLE `permission_denieds` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_denieds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `group_id` int(11) NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`group_id`,`permission`),
  KEY `FK4392F48425A5B3E8` (`group_id`),
  CONSTRAINT `FK4392F48425A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'AdminAdminPermission.ACCESS_CHANGE_PASSWORD'),(1,'AdminAdminPermission.ACCESS_DISCONNECT'),(1,'AdminAdminPermission.ACCESS_ENABLE_LOGIN'),(1,'AdminAdminPermission.ACCESS_TRANSACTION_PASSWORD'),(1,'AdminAdminPermission.ADMINS_CHANGE_GROUP'),(1,'AdminAdminPermission.ADMINS_CHANGE_PROFILE'),(1,'AdminAdminPermission.ADMINS_REGISTER'),(1,'AdminAdminPermission.ADMINS_REMOVE'),(1,'AdminAdminPermission.ADMINS_VIEW'),(1,'AdminAdminPermission.RECORDS_CREATE'),(1,'AdminAdminPermission.RECORDS_DELETE'),(1,'AdminAdminPermission.RECORDS_MODIFY'),(1,'AdminAdminPermission.RECORDS_VIEW'),(1,'AdminMemberPermission.ACCESS_CHANGE_CHANNELS_ACCESS'),(1,'AdminMemberPermission.ACCESS_CHANGE_PASSWORD'),(1,'AdminMemberPermission.ACCESS_CHANGE_PIN'),(1,'AdminMemberPermission.ACCESS_DISCONNECT'),(1,'AdminMemberPermission.ACCESS_ENABLE_LOGIN'),(1,'AdminMemberPermission.ACCESS_RESET_PASSWORD'),(1,'AdminMemberPermission.ACCESS_TRANSACTION_PASSWORD'),(1,'AdminMemberPermission.ACCESS_UNBLOCK_PIN'),(1,'AdminMemberPermission.ACCOUNTS_CREDIT_LIMIT'),(1,'AdminMemberPermission.ACCOUNTS_INFORMATION'),(1,'AdminMemberPermission.ACCOUNTS_SCHEDULED_INFORMATION'),(1,'AdminMemberPermission.ADS_IMPORT'),(1,'AdminMemberPermission.ADS_MANAGE'),(1,'AdminMemberPermission.ADS_VIEW'),(1,'AdminMemberPermission.BROKERINGS_CHANGE_BROKER'),(1,'AdminMemberPermission.BROKERINGS_VIEW_LOANS'),(1,'AdminMemberPermission.BROKERINGS_VIEW_MEMBERS'),(1,'AdminMemberPermission.BULK_ACTIONS_CHANGE_BROKER'),(1,'AdminMemberPermission.BULK_ACTIONS_CHANGE_CHANNELS'),(1,'AdminMemberPermission.BULK_ACTIONS_CHANGE_GROUP'),(1,'AdminMemberPermission.BULK_ACTIONS_GENERATE_CARD'),(1,'AdminMemberPermission.CARDS_BLOCK'),(1,'AdminMemberPermission.CARDS_CANCEL'),(1,'AdminMemberPermission.CARDS_CHANGE_CARD_SECURITY_CODE'),(1,'AdminMemberPermission.CARDS_GENERATE'),(1,'AdminMemberPermission.CARDS_UNBLOCK'),(1,'AdminMemberPermission.CARDS_UNBLOCK_SECURITY_CODE'),(1,'AdminMemberPermission.CARDS_VIEW'),(1,'AdminMemberPermission.GROUPS_MANAGE_ACCOUNT_SETTINGS'),(1,'AdminMemberPermission.GROUPS_MANAGE_MEMBER_CUSTOMIZED_FILES'),(1,'AdminMemberPermission.GROUPS_VIEW'),(1,'AdminMemberPermission.INVOICES_ACCEPT'),(1,'AdminMemberPermission.INVOICES_CANCEL'),(1,'AdminMemberPermission.INVOICES_DENY'),(1,'AdminMemberPermission.INVOICES_SEND'),(1,'AdminMemberPermission.INVOICES_VIEW'),(1,'AdminMemberPermission.LOANS_DISCARD'),(1,'AdminMemberPermission.LOANS_GRANT'),(1,'AdminMemberPermission.LOANS_MANAGE_EXPIRED_STATUS'),(1,'AdminMemberPermission.LOANS_REPAY'),(1,'AdminMemberPermission.LOANS_VIEW'),(1,'AdminMemberPermission.LOAN_GROUPS_MANAGE'),(1,'AdminMemberPermission.LOAN_GROUPS_VIEW'),(1,'AdminMemberPermission.MEMBERS_CHANGE_EMAIL'),(1,'AdminMemberPermission.MEMBERS_CHANGE_GROUP'),(1,'AdminMemberPermission.MEMBERS_CHANGE_NAME'),(1,'AdminMemberPermission.MEMBERS_CHANGE_PROFILE'),(1,'AdminMemberPermission.MEMBERS_IMPORT'),(1,'AdminMemberPermission.MEMBERS_MANAGE_PENDING'),(1,'AdminMemberPermission.MEMBERS_REGISTER'),(1,'AdminMemberPermission.MEMBERS_REMOVE'),(1,'AdminMemberPermission.MEMBERS_VIEW'),(1,'AdminMemberPermission.MESSAGES_MANAGE'),(1,'AdminMemberPermission.MESSAGES_SEND_TO_GROUP'),(1,'AdminMemberPermission.MESSAGES_SEND_TO_MEMBER'),(1,'AdminMemberPermission.MESSAGES_VIEW'),(1,'AdminMemberPermission.PAYMENTS_CHARGEBACK'),(1,'AdminMemberPermission.PAYMENTS_PAYMENT'),(1,'AdminMemberPermission.PREFERENCES_MANAGE_NOTIFICATIONS'),(1,'AdminMemberPermission.RECORDS_CREATE'),(1,'AdminMemberPermission.RECORDS_DELETE'),(1,'AdminMemberPermission.RECORDS_MODIFY'),(1,'AdminMemberPermission.RECORDS_VIEW'),(1,'AdminMemberPermission.REFERENCES_MANAGE'),(1,'AdminMemberPermission.REFERENCES_VIEW'),(1,'AdminMemberPermission.REPORTS_SHOW_ACCOUNT_INFORMATION'),(1,'AdminMemberPermission.REPORTS_VIEW'),(1,'AdminMemberPermission.SMS_MAILINGS_FREE_SMS_MAILINGS'),(1,'AdminMemberPermission.SMS_MAILINGS_PAID_SMS_MAILINGS'),(1,'AdminMemberPermission.SMS_MAILINGS_VIEW'),(1,'AdminMemberPermission.TRANSACTION_FEEDBACKS_MANAGE'),(1,'AdminMemberPermission.TRANSACTION_FEEDBACKS_VIEW'),(1,'AdminSystemPermission.ACCOUNTS_INFORMATION'),(1,'AdminSystemPermission.ACCOUNTS_MANAGE'),(1,'AdminSystemPermission.ACCOUNTS_SCHEDULED_INFORMATION'),(1,'AdminSystemPermission.ACCOUNTS_VIEW'),(1,'AdminSystemPermission.ACCOUNT_FEES_CHARGE'),(1,'AdminSystemPermission.ACCOUNT_FEES_VIEW'),(1,'AdminSystemPermission.ADMIN_GROUPS_MANAGE_ADMIN_CUSTOMIZED_FILES'),(1,'AdminSystemPermission.ADMIN_GROUPS_VIEW'),(1,'AdminSystemPermission.AD_CATEGORIES_FILE'),(1,'AdminSystemPermission.AD_CATEGORIES_MANAGE'),(1,'AdminSystemPermission.AD_CATEGORIES_VIEW'),(1,'AdminSystemPermission.ALERTS_MANAGE_MEMBER_ALERTS'),(1,'AdminSystemPermission.ALERTS_MANAGE_SYSTEM_ALERTS'),(1,'AdminSystemPermission.ALERTS_VIEW_MEMBER_ALERTS'),(1,'AdminSystemPermission.ALERTS_VIEW_SYSTEM_ALERTS'),(1,'AdminSystemPermission.CARD_TYPES_MANAGE'),(1,'AdminSystemPermission.CARD_TYPES_VIEW'),(1,'AdminSystemPermission.CHANNELS_MANAGE'),(1,'AdminSystemPermission.CHANNELS_VIEW'),(1,'AdminSystemPermission.CURRENCIES_MANAGE'),(1,'AdminSystemPermission.CURRENCIES_VIEW'),(1,'AdminSystemPermission.CUSTOMIZED_FILES_MANAGE'),(1,'AdminSystemPermission.CUSTOMIZED_FILES_VIEW'),(1,'AdminSystemPermission.CUSTOM_FIELDS_MANAGE'),(1,'AdminSystemPermission.CUSTOM_FIELDS_VIEW'),(1,'AdminSystemPermission.CUSTOM_IMAGES_MANAGE'),(1,'AdminSystemPermission.CUSTOM_IMAGES_VIEW'),(1,'AdminSystemPermission.ERROR_LOG_MANAGE'),(1,'AdminSystemPermission.ERROR_LOG_VIEW'),(1,'AdminSystemPermission.EXTERNAL_ACCOUNTS_CHECK_PAYMENT'),(1,'AdminSystemPermission.EXTERNAL_ACCOUNTS_DETAILS'),(1,'AdminSystemPermission.EXTERNAL_ACCOUNTS_MANAGE'),(1,'AdminSystemPermission.EXTERNAL_ACCOUNTS_MANAGE_PAYMENT'),(1,'AdminSystemPermission.EXTERNAL_ACCOUNTS_PROCESS_PAYMENT'),(1,'AdminSystemPermission.EXTERNAL_ACCOUNTS_VIEW'),(1,'AdminSystemPermission.GROUPS_MANAGE_ADMIN'),(1,'AdminSystemPermission.GROUPS_MANAGE_BROKER'),(1,'AdminSystemPermission.GROUPS_MANAGE_MEMBER'),(1,'AdminSystemPermission.GROUP_FILTERS_MANAGE'),(1,'AdminSystemPermission.GROUP_FILTERS_MANAGE_CUSTOMIZED_FILES'),(1,'AdminSystemPermission.GROUP_FILTERS_VIEW'),(1,'AdminSystemPermission.INFO_TEXTS_MANAGE'),(1,'AdminSystemPermission.INFO_TEXTS_VIEW'),(1,'AdminSystemPermission.LOAN_GROUPS_MANAGE'),(1,'AdminSystemPermission.LOAN_GROUPS_VIEW'),(1,'AdminSystemPermission.MEMBER_RECORD_TYPES_MANAGE'),(1,'AdminSystemPermission.MEMBER_RECORD_TYPES_VIEW'),(1,'AdminSystemPermission.MESSAGE_CATEGORIES_MANAGE'),(1,'AdminSystemPermission.MESSAGE_CATEGORIES_VIEW'),(1,'AdminSystemPermission.PAYMENTS_BLOCK_SCHEDULED'),(1,'AdminSystemPermission.PAYMENTS_CANCEL_SCHEDULED'),(1,'AdminSystemPermission.PAYMENTS_CHARGEBACK'),(1,'AdminSystemPermission.PAYMENTS_PAYMENT'),(1,'AdminSystemPermission.REGISTRATION_AGREEMENTS_MANAGE'),(1,'AdminSystemPermission.REGISTRATION_AGREEMENTS_VIEW'),(1,'AdminSystemPermission.REPORTS_CURRENT'),(1,'AdminSystemPermission.REPORTS_MEMBER_LIST'),(1,'AdminSystemPermission.REPORTS_SIMULATIONS'),(1,'AdminSystemPermission.REPORTS_STATISTICS'),(1,'AdminSystemPermission.SERVICE_CLIENTS_MANAGE'),(1,'AdminSystemPermission.SERVICE_CLIENTS_VIEW'),(1,'AdminSystemPermission.SETTINGS_FILE'),(1,'AdminSystemPermission.SETTINGS_MANAGE_ACCESS'),(1,'AdminSystemPermission.SETTINGS_MANAGE_ALERT'),(1,'AdminSystemPermission.SETTINGS_MANAGE_LOCAL'),(1,'AdminSystemPermission.SETTINGS_MANAGE_LOG'),(1,'AdminSystemPermission.SETTINGS_MANAGE_MAIL'),(1,'AdminSystemPermission.SETTINGS_VIEW'),(1,'AdminSystemPermission.STATUS_VIEW'),(1,'AdminSystemPermission.STATUS_VIEW_CONNECTED_ADMINS'),(1,'AdminSystemPermission.STATUS_VIEW_CONNECTED_BROKERS'),(1,'AdminSystemPermission.STATUS_VIEW_CONNECTED_MEMBERS'),(1,'AdminSystemPermission.TASKS_MANAGE_INDEXES'),(1,'AdminSystemPermission.TASKS_ONLINE_STATE'),(1,'AdminSystemPermission.THEMES_EXPORT'),(1,'AdminSystemPermission.THEMES_IMPORT'),(1,'AdminSystemPermission.THEMES_REMOVE'),(1,'AdminSystemPermission.THEMES_SELECT'),(1,'AdminSystemPermission.TRANSLATION_FILE'),(1,'AdminSystemPermission.TRANSLATION_MANAGE'),(1,'AdminSystemPermission.TRANSLATION_MANAGE_MAIL_TRANSLATION'),(1,'AdminSystemPermission.TRANSLATION_MANAGE_NOTIFICATION'),(1,'AdminSystemPermission.TRANSLATION_VIEW'),(1,'BasicPermission.BASIC_LOGIN'),(2,'AdminMemberPermission.ACCESS_CHANGE_CHANNELS_ACCESS'),(2,'AdminMemberPermission.ACCESS_CHANGE_PASSWORD'),(2,'AdminMemberPermission.ACCESS_CHANGE_PIN'),(2,'AdminMemberPermission.ACCESS_DISCONNECT'),(2,'AdminMemberPermission.ACCESS_ENABLE_LOGIN'),(2,'AdminMemberPermission.ACCESS_RESET_PASSWORD'),(2,'AdminMemberPermission.ACCESS_TRANSACTION_PASSWORD'),(2,'AdminMemberPermission.ACCESS_UNBLOCK_PIN'),(2,'AdminMemberPermission.ACCOUNTS_CREDIT_LIMIT'),(2,'AdminMemberPermission.ACCOUNTS_INFORMATION'),(2,'AdminMemberPermission.ACCOUNTS_SCHEDULED_INFORMATION'),(2,'AdminMemberPermission.ADS_MANAGE'),(2,'AdminMemberPermission.ADS_VIEW'),(2,'AdminMemberPermission.BROKERINGS_CHANGE_BROKER'),(2,'AdminMemberPermission.BROKERINGS_VIEW_LOANS'),(2,'AdminMemberPermission.BROKERINGS_VIEW_MEMBERS'),(2,'AdminMemberPermission.BULK_ACTIONS_CHANGE_BROKER'),(2,'AdminMemberPermission.BULK_ACTIONS_CHANGE_CHANNELS'),(2,'AdminMemberPermission.BULK_ACTIONS_CHANGE_GROUP'),(2,'AdminMemberPermission.BULK_ACTIONS_GENERATE_CARD'),(2,'AdminMemberPermission.CARDS_BLOCK'),(2,'AdminMemberPermission.CARDS_CANCEL'),(2,'AdminMemberPermission.CARDS_CHANGE_CARD_SECURITY_CODE'),(2,'AdminMemberPermission.CARDS_GENERATE'),(2,'AdminMemberPermission.CARDS_UNBLOCK'),(2,'AdminMemberPermission.CARDS_UNBLOCK_SECURITY_CODE'),(2,'AdminMemberPermission.CARDS_VIEW'),(2,'AdminMemberPermission.GROUPS_MANAGE_ACCOUNT_SETTINGS'),(2,'AdminMemberPermission.GROUPS_MANAGE_MEMBER_CUSTOMIZED_FILES'),(2,'AdminMemberPermission.GROUPS_VIEW'),(2,'AdminMemberPermission.INVOICES_ACCEPT'),(2,'AdminMemberPermission.INVOICES_CANCEL'),(2,'AdminMemberPermission.INVOICES_DENY'),(2,'AdminMemberPermission.INVOICES_SEND'),(2,'AdminMemberPermission.INVOICES_VIEW'),(2,'AdminMemberPermission.LOANS_DISCARD'),(2,'AdminMemberPermission.LOANS_GRANT'),(2,'AdminMemberPermission.LOANS_MANAGE_EXPIRED_STATUS'),(2,'AdminMemberPermission.LOANS_REPAY'),(2,'AdminMemberPermission.LOANS_VIEW'),(2,'AdminMemberPermission.LOAN_GROUPS_MANAGE'),(2,'AdminMemberPermission.LOAN_GROUPS_VIEW'),(2,'AdminMemberPermission.MEMBERS_CHANGE_EMAIL'),(2,'AdminMemberPermission.MEMBERS_CHANGE_GROUP'),(2,'AdminMemberPermission.MEMBERS_CHANGE_NAME'),(2,'AdminMemberPermission.MEMBERS_CHANGE_PROFILE'),(2,'AdminMemberPermission.MEMBERS_MANAGE_PENDING'),(2,'AdminMemberPermission.MEMBERS_REGISTER'),(2,'AdminMemberPermission.MEMBERS_REMOVE'),(2,'AdminMemberPermission.MEMBERS_VIEW'),(2,'AdminMemberPermission.MESSAGES_MANAGE'),(2,'AdminMemberPermission.MESSAGES_SEND_TO_GROUP'),(2,'AdminMemberPermission.MESSAGES_SEND_TO_MEMBER'),(2,'AdminMemberPermission.MESSAGES_VIEW'),(2,'AdminMemberPermission.PAYMENTS_CHARGEBACK'),(2,'AdminMemberPermission.PAYMENTS_PAYMENT'),(2,'AdminMemberPermission.PREFERENCES_MANAGE_NOTIFICATIONS'),(2,'AdminMemberPermission.RECORDS_CREATE'),(2,'AdminMemberPermission.RECORDS_DELETE'),(2,'AdminMemberPermission.RECORDS_MODIFY'),(2,'AdminMemberPermission.RECORDS_VIEW'),(2,'AdminMemberPermission.REFERENCES_MANAGE'),(2,'AdminMemberPermission.REFERENCES_VIEW'),(2,'AdminMemberPermission.REPORTS_SHOW_ACCOUNT_INFORMATION'),(2,'AdminMemberPermission.REPORTS_VIEW'),(2,'AdminMemberPermission.SMS_MAILINGS_FREE_SMS_MAILINGS'),(2,'AdminMemberPermission.SMS_MAILINGS_PAID_SMS_MAILINGS'),(2,'AdminMemberPermission.SMS_MAILINGS_VIEW'),(2,'AdminMemberPermission.TRANSACTION_FEEDBACKS_MANAGE'),(2,'AdminMemberPermission.TRANSACTION_FEEDBACKS_VIEW'),(2,'BasicPermission.BASIC_LOGIN'),(5,'BasicPermission.BASIC_INVITE_MEMBER'),(5,'BasicPermission.BASIC_LOGIN'),(5,'MemberPermission.ACCESS_CHANGE_CHANNELS_ACCESS'),(5,'MemberPermission.ACCESS_UNBLOCK_PIN'),(5,'MemberPermission.ACCOUNT_SCHEDULED_INFORMATION'),(5,'MemberPermission.CARDS_BLOCK'),(5,'MemberPermission.CARDS_CHANGE_CARD_SECURITY_CODE'),(5,'MemberPermission.CARDS_UNBLOCK'),(5,'MemberPermission.CARDS_VIEW'),(5,'MemberPermission.INVOICES_SEND_TO_MEMBER'),(5,'MemberPermission.INVOICES_VIEW'),(5,'MemberPermission.LOANS_REPAY'),(5,'MemberPermission.LOANS_VIEW'),(5,'MemberPermission.MESSAGES_MANAGE'),(5,'MemberPermission.MESSAGES_SEND_TO_ADMINISTRATION'),(5,'MemberPermission.MESSAGES_SEND_TO_MEMBER'),(5,'MemberPermission.MESSAGES_VIEW'),(5,'MemberPermission.PAYMENTS_BLOCK_SCHEDULED'),(5,'MemberPermission.PAYMENTS_PAYMENT_TO_MEMBER'),(5,'MemberPermission.PAYMENTS_PAYMENT_TO_SYSTEM'),(5,'MemberPermission.PAYMENTS_TICKET'),(5,'MemberPermission.PREFERENCES_MANAGE_NOTIFICATIONS'),(5,'MemberPermission.PROFILE_CHANGE_EMAIL'),(5,'MemberPermission.PROFILE_CHANGE_NAME'),(5,'MemberPermission.PROFILE_CHANGE_USERNAME'),(5,'MemberPermission.PROFILE_VIEW'),(5,'MemberPermission.REPORTS_VIEW'),(9,'BasicPermission.BASIC_LOGIN'),(9,'BrokerPermission.ACCOUNTS_INFORMATION'),(9,'BrokerPermission.ACCOUNTS_SCHEDULED_INFORMATION'),(9,'BrokerPermission.ADS_MANAGE'),(9,'BrokerPermission.ADS_VIEW'),(9,'BrokerPermission.CARDS_BLOCK'),(9,'BrokerPermission.CARDS_CANCEL'),(9,'BrokerPermission.CARDS_CHANGE_CARD_SECURITY_CODE'),(9,'BrokerPermission.CARDS_GENERATE'),(9,'BrokerPermission.CARDS_UNBLOCK'),(9,'BrokerPermission.CARDS_UNBLOCK_SECURITY_CODE'),(9,'BrokerPermission.CARDS_VIEW'),(9,'BrokerPermission.INVOICES_VIEW'),(9,'BrokerPermission.LOANS_VIEW'),(9,'BrokerPermission.LOAN_GROUPS_VIEW'),(9,'BrokerPermission.MEMBERS_CHANGE_EMAIL'),(9,'BrokerPermission.MEMBERS_CHANGE_PROFILE'),(9,'BrokerPermission.MEMBERS_MANAGE_CONTRACTS'),(9,'BrokerPermission.MEMBERS_MANAGE_DEFAULTS'),(9,'BrokerPermission.MEMBERS_MANAGE_PENDING'),(9,'BrokerPermission.MEMBERS_REGISTER'),(9,'BrokerPermission.MEMBER_ACCESS_CHANGE_CHANNELS_ACCESS'),(9,'BrokerPermission.MEMBER_ACCESS_CHANGE_PASSWORD'),(9,'BrokerPermission.MEMBER_ACCESS_CHANGE_PIN'),(9,'BrokerPermission.MEMBER_ACCESS_RESET_PASSWORD'),(9,'BrokerPermission.MEMBER_ACCESS_TRANSACTION_PASSWORD'),(9,'BrokerPermission.MEMBER_ACCESS_UNBLOCK_PIN'),(9,'BrokerPermission.MEMBER_PAYMENTS_AUTHORIZE'),(9,'BrokerPermission.MEMBER_RECORDS_CREATE'),(9,'BrokerPermission.MEMBER_RECORDS_DELETE'),(9,'BrokerPermission.MEMBER_RECORDS_MODIFY'),(9,'BrokerPermission.MEMBER_RECORDS_VIEW'),(9,'BrokerPermission.MESSAGES_SEND_TO_MEMBERS'),(9,'BrokerPermission.POS_ASSIGN'),(9,'BrokerPermission.POS_BLOCK'),(9,'BrokerPermission.POS_CHANGE_PARAMETERS'),(9,'BrokerPermission.POS_CHANGE_PIN'),(9,'BrokerPermission.POS_DISCARD'),(9,'BrokerPermission.POS_MANAGE'),(9,'BrokerPermission.POS_UNBLOCK_PIN'),(9,'BrokerPermission.POS_VIEW'),(9,'BrokerPermission.PREFERENCES_MANAGE_NOTIFICATIONS'),(9,'BrokerPermission.REFERENCES_MANAGE'),(9,'BrokerPermission.REPORTS_SHOW_ACCOUNT_INFORMATION'),(9,'BrokerPermission.REPORTS_VIEW'),(9,'BrokerPermission.SMS_MAILINGS_FREE_SMS_MAILINGS'),(9,'BrokerPermission.SMS_MAILINGS_PAID_SMS_MAILINGS'),(9,'MemberPermission.ACCESS_CHANGE_CHANNELS_ACCESS'),(9,'MemberPermission.ACCESS_UNBLOCK_PIN'),(9,'MemberPermission.ACCOUNT_SCHEDULED_INFORMATION'),(9,'MemberPermission.ADS_PUBLISH'),(9,'MemberPermission.ADS_VIEW'),(9,'MemberPermission.CARDS_BLOCK'),(9,'MemberPermission.CARDS_CHANGE_CARD_SECURITY_CODE'),(9,'MemberPermission.CARDS_UNBLOCK'),(9,'MemberPermission.CARDS_VIEW'),(9,'MemberPermission.INVOICES_SEND_TO_MEMBER'),(9,'MemberPermission.INVOICES_VIEW'),(9,'MemberPermission.LOANS_REPAY'),(9,'MemberPermission.LOANS_VIEW'),(9,'MemberPermission.MESSAGES_MANAGE'),(9,'MemberPermission.MESSAGES_SEND_TO_ADMINISTRATION'),(9,'MemberPermission.MESSAGES_SEND_TO_MEMBER'),(9,'MemberPermission.MESSAGES_VIEW'),(9,'MemberPermission.PAYMENTS_BLOCK_SCHEDULED'),(9,'MemberPermission.PAYMENTS_CHARGEBACK'),(9,'MemberPermission.PAYMENTS_PAYMENT_TO_MEMBER'),(9,'MemberPermission.PAYMENTS_PAYMENT_TO_SYSTEM'),(9,'MemberPermission.PAYMENTS_TICKET'),(9,'MemberPermission.PREFERENCES_MANAGE_AD_INTERESTS'),(9,'MemberPermission.PREFERENCES_MANAGE_NOTIFICATIONS'),(9,'MemberPermission.PROFILE_CHANGE_EMAIL'),(9,'MemberPermission.PROFILE_CHANGE_NAME'),(9,'MemberPermission.PROFILE_CHANGE_USERNAME'),(9,'MemberPermission.PROFILE_VIEW'),(9,'MemberPermission.REFERENCES_GIVE'),(9,'MemberPermission.REFERENCES_VIEW'),(9,'MemberPermission.REPORTS_SHOW_ACCOUNT_INFORMATION'),(9,'MemberPermission.REPORTS_VIEW'),(12,'BasicPermission.BASIC_LOGIN'),(12,'OperatorPermission.ACCOUNT_ACCOUNT_INFORMATION'),(12,'OperatorPermission.ACCOUNT_SCHEDULED_INFORMATION'),(12,'OperatorPermission.CONTACTS_MANAGE'),(12,'OperatorPermission.CONTACTS_VIEW'),(12,'OperatorPermission.MESSAGES_MANAGE'),(12,'OperatorPermission.MESSAGES_VIEW'),(12,'OperatorPermission.PAYMENTS_PAYMENT_TO_MEMBER'),(12,'OperatorPermission.PAYMENTS_PAYMENT_TO_SYSTEM'),(12,'OperatorPermission.REPORTS_VIEW_MEMBER');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos`
--

DROP TABLE IF EXISTS `pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_id` varchar(64) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `member_pos_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pos_id` (`pos_id`),
  KEY `FK1B25413A66F8B` (`member_pos_id`),
  CONSTRAINT `FK1B25413A66F8B` FOREIGN KEY (`member_pos_id`) REFERENCES `member_pos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos`
--

LOCK TABLES `pos` WRITE;
/*!40000 ALTER TABLE `pos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_logs`
--

DROP TABLE IF EXISTS `pos_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `pos_status` varchar(1) NOT NULL,
  `member_pos_status` varchar(1) DEFAULT NULL,
  `by_id` int(11) DEFAULT NULL,
  `pos_id` int(11) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2C0220BA2B1214C2` (`by_id`),
  KEY `FK2C0220BA2B3ED03` (`assigned_to`),
  KEY `FK2C0220BAF3ECFBC0` (`pos_id`),
  CONSTRAINT `FK2C0220BAF3ECFBC0` FOREIGN KEY (`pos_id`) REFERENCES `pos` (`id`),
  CONSTRAINT `FK2C0220BA2B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK2C0220BA2B3ED03` FOREIGN KEY (`assigned_to`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_logs`
--

LOCK TABLES `pos_logs` WRITE;
/*!40000 ALTER TABLE `pos_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `print_settings`
--

DROP TABLE IF EXISTS `print_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `printer_name` varchar(100) NOT NULL,
  `begin_doc_cmd` varchar(100) DEFAULT NULL,
  `end_doc_cmd` varchar(100) DEFAULT NULL,
  `payment_message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK35B1ED755AA28D11` (`member`),
  CONSTRAINT `FK35B1ED755AA28D11` FOREIGN KEY (`member`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `print_settings`
--

LOCK TABLES `print_settings` WRITE;
/*!40000 ALTER TABLE `print_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `print_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_parameters`
--

DROP TABLE IF EXISTS `rate_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `creation_value` decimal(15,6) NOT NULL,
  `enabled_since` datetime NOT NULL,
  `disabled_since` datetime DEFAULT NULL,
  `reinit_date` datetime DEFAULT NULL,
  `init_value` decimal(15,6) DEFAULT NULL,
  `init_date` datetime DEFAULT NULL,
  `interest` decimal(15,6) DEFAULT NULL,
  `base_malus` decimal(15,6) DEFAULT NULL,
  `minimal_d` decimal(15,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_date` (`date`),
  KEY `FK1169FEA9C0E7F6FA` (`currency_id`),
  CONSTRAINT `FK1169FEA9C0E7F6FA` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_parameters`
--

LOCK TABLES `rate_parameters` WRITE;
/*!40000 ALTER TABLE `rate_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_history`
--

DROP TABLE IF EXISTS `reference_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_member_id` int(11) NOT NULL,
  `to_member_id` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC9084FA0823FB102` (`from_member_id`),
  KEY `FKC9084FA09DCA1693` (`to_member_id`),
  CONSTRAINT `FKC9084FA09DCA1693` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKC9084FA0823FB102` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_history`
--

LOCK TABLES `reference_history` WRITE;
/*!40000 ALTER TABLE `reference_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refs`
--

DROP TABLE IF EXISTS `refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `from_member_id` int(11) NOT NULL,
  `to_member_id` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `date` datetime NOT NULL,
  `comments` longtext NOT NULL,
  `reply_comments_date` datetime DEFAULT NULL,
  `reply_comments` longtext,
  `admin_comments_date` datetime DEFAULT NULL,
  `admin_comments` longtext,
  `transfer_id` bigint(20) DEFAULT NULL,
  `scheduled_payment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK355A40B3A79238` (`scheduled_payment_id`),
  KEY `FK355A402F78F3B3` (`transfer_id`),
  KEY `FK355A40823FB102` (`from_member_id`),
  KEY `FK355A409DCA1693` (`to_member_id`),
  CONSTRAINT `FK355A409DCA1693` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK355A402F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK355A40823FB102` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK355A40B3A79238` FOREIGN KEY (`scheduled_payment_id`) REFERENCES `scheduled_payments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refs`
--

LOCK TABLES `refs` WRITE;
/*!40000 ALTER TABLE `refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_agreement_logs`
--

DROP TABLE IF EXISTS `registration_agreement_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_agreement_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `registration_agreement_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `remote_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK415CBF0AEAE0AB57` (`member_id`),
  KEY `FK415CBF0A33E01D0A` (`registration_agreement_id`),
  CONSTRAINT `FK415CBF0A33E01D0A` FOREIGN KEY (`registration_agreement_id`) REFERENCES `registration_agreements` (`id`),
  CONSTRAINT `FK415CBF0AEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_agreement_logs`
--

LOCK TABLES `registration_agreement_logs` WRITE;
/*!40000 ALTER TABLE `registration_agreement_logs` DISABLE KEYS */;
INSERT INTO `registration_agreement_logs` VALUES (1,3,1,'2013-12-15 03:08:55','0:0:0:0:0:0:0:1%0');
/*!40000 ALTER TABLE `registration_agreement_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_agreements`
--

DROP TABLE IF EXISTS `registration_agreements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_agreements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `contents` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_agreements`
--

LOCK TABLES `registration_agreements` WRITE;
/*!40000 ALTER TABLE `registration_agreements` DISABLE KEYS */;
INSERT INTO `registration_agreements` VALUES (1,'General Terms','<p>You need to accept terms before registering.</p>');
/*!40000 ALTER TABLE `registration_agreements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remarks`
--

DROP TABLE IF EXISTS `remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `writer_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `comments` longtext,
  `old_group_id` int(11) DEFAULT NULL,
  `new_group_id` int(11) DEFAULT NULL,
  `old_broker_id` int(11) DEFAULT NULL,
  `new_broker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK410DACF3BE3D3300` (`old_group_id`),
  KEY `FK410DACF3C5DFA5A0` (`old_broker_id`),
  KEY `FK410DACF33439FCD` (`subject_id`),
  KEY `FK410DACF3D1AF3726` (`writer_id`),
  KEY `FK410DACF3AE7A5DD9` (`new_broker_id`),
  KEY `FK410DACF3C5BE0FA7` (`new_group_id`),
  CONSTRAINT `FK410DACF3C5BE0FA7` FOREIGN KEY (`new_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK410DACF33439FCD` FOREIGN KEY (`subject_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK410DACF3AE7A5DD9` FOREIGN KEY (`new_broker_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK410DACF3BE3D3300` FOREIGN KEY (`old_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK410DACF3C5DFA5A0` FOREIGN KEY (`old_broker_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK410DACF3D1AF3726` FOREIGN KEY (`writer_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remarks`
--

LOCK TABLES `remarks` WRITE;
/*!40000 ALTER TABLE `remarks` DISABLE KEYS */;
INSERT INTO `remarks` VALUES (1,'G',2,1,'2013-12-15 00:37:32','approved first member',6,5,NULL,NULL),(2,'G',3,1,'2013-12-15 03:11:01','First branch',6,9,NULL,NULL),(3,'B',2,1,'2013-12-15 03:15:37','First individual client of this branch',NULL,NULL,NULL,3);
/*!40000 ALTER TABLE `remarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_payments`
--

DROP TABLE IF EXISTS `scheduled_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `status` varchar(1) NOT NULL,
  `by_id` int(11) DEFAULT NULL,
  `process_date` datetime DEFAULT NULL,
  `feedback_deadline` datetime DEFAULT NULL,
  `description` longtext,
  `reserve_amount` bit(1) NOT NULL,
  `show_to_receiver` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK943CF27F2B1214C2` (`by_id`),
  KEY `FK943CF27FDD5BFBFE` (`to_account_id`),
  KEY `FK943CF27F8799AF6F` (`from_account_id`),
  KEY `FK943CF27F9D63275E` (`type_id`),
  CONSTRAINT `FK943CF27F9D63275E` FOREIGN KEY (`type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK943CF27F2B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK943CF27F8799AF6F` FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK943CF27FDD5BFBFE` FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_payments`
--

LOCK TABLES `scheduled_payments` WRITE;
/*!40000 ALTER TABLE `scheduled_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduled_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_client_permissions`
--

DROP TABLE IF EXISTS `service_client_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_client_permissions` (
  `service_client_id` int(11) NOT NULL,
  `operation` varchar(50) NOT NULL,
  PRIMARY KEY (`service_client_id`,`operation`),
  KEY `FK6BF53FDABC65B77D` (`service_client_id`),
  CONSTRAINT `FK6BF53FDABC65B77D` FOREIGN KEY (`service_client_id`) REFERENCES `service_clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_client_permissions`
--

LOCK TABLES `service_client_permissions` WRITE;
/*!40000 ALTER TABLE `service_client_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_client_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_clients`
--

DROP TABLE IF EXISTS `service_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `hostname` varchar(100) NOT NULL,
  `address_begin` varchar(100) DEFAULT NULL,
  `address_end` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `credentials_required` bit(1) NOT NULL,
  `ignore_registration_validations` bit(1) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK55B6E7EEAE0AB57` (`member_id`),
  KEY `FK55B6E7E9B71D578` (`channel_id`),
  CONSTRAINT `FK55B6E7E9B71D578` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `FK55B6E7EEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_clients`
--

LOCK TABLES `service_clients` WRITE;
/*!40000 ALTER TABLE `service_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_clients_chargeback_payment_types`
--

DROP TABLE IF EXISTS `service_clients_chargeback_payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_clients_chargeback_payment_types` (
  `service_client_id` int(11) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  PRIMARY KEY (`service_client_id`,`transfer_type_id`),
  KEY `FKD8ECB3FDA4766B0A` (`transfer_type_id`),
  KEY `FKD8ECB3FDBC65B77D` (`service_client_id`),
  CONSTRAINT `FKD8ECB3FDBC65B77D` FOREIGN KEY (`service_client_id`) REFERENCES `service_clients` (`id`),
  CONSTRAINT `FKD8ECB3FDA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_clients_chargeback_payment_types`
--

LOCK TABLES `service_clients_chargeback_payment_types` WRITE;
/*!40000 ALTER TABLE `service_clients_chargeback_payment_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_clients_chargeback_payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_clients_do_payment_types`
--

DROP TABLE IF EXISTS `service_clients_do_payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_clients_do_payment_types` (
  `service_client_id` int(11) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  PRIMARY KEY (`service_client_id`,`transfer_type_id`),
  KEY `FKA83C5FEDA4766B0A` (`transfer_type_id`),
  KEY `FKA83C5FEDBC65B77D` (`service_client_id`),
  CONSTRAINT `FKA83C5FEDBC65B77D` FOREIGN KEY (`service_client_id`) REFERENCES `service_clients` (`id`),
  CONSTRAINT `FKA83C5FEDA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_clients_do_payment_types`
--

LOCK TABLES `service_clients_do_payment_types` WRITE;
/*!40000 ALTER TABLE `service_clients_do_payment_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_clients_do_payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_clients_manage_groups`
--

DROP TABLE IF EXISTS `service_clients_manage_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_clients_manage_groups` (
  `service_client_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`service_client_id`,`group_id`),
  KEY `FK5A4E59EDB45926EE` (`group_id`),
  KEY `FK5A4E59EDBC65B77D` (`service_client_id`),
  CONSTRAINT `FK5A4E59EDBC65B77D` FOREIGN KEY (`service_client_id`) REFERENCES `service_clients` (`id`),
  CONSTRAINT `FK5A4E59EDB45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_clients_manage_groups`
--

LOCK TABLES `service_clients_manage_groups` WRITE;
/*!40000 ALTER TABLE `service_clients_manage_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_clients_manage_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_clients_receive_payment_types`
--

DROP TABLE IF EXISTS `service_clients_receive_payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_clients_receive_payment_types` (
  `service_client_id` int(11) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  PRIMARY KEY (`service_client_id`,`transfer_type_id`),
  KEY `FK51FA69A3A4766B0A` (`transfer_type_id`),
  KEY `FK51FA69A3BC65B77D` (`service_client_id`),
  CONSTRAINT `FK51FA69A3BC65B77D` FOREIGN KEY (`service_client_id`) REFERENCES `service_clients` (`id`),
  CONSTRAINT `FK51FA69A3A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_clients_receive_payment_types`
--

LOCK TABLES `service_clients_receive_payment_types` WRITE;
/*!40000 ALTER TABLE `service_clients_receive_payment_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_clients_receive_payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL,
  `expiration_date` datetime NOT NULL,
  `pos_web` bit(1) DEFAULT NULL,
  `remote_addr` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`),
  KEY `FK53BFD09DA19267FC` (`user_id`),
  CONSTRAINT `FK53BFD09DA19267FC` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (10,'4F8B765C8AC3B8B55AE948A1944AA51D','2013-12-15 03:07:49','2013-12-15 04:30:00','\0','0:0:0:0:0:0:0:1%0',1);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'local','charset','UTF-8'),(2,'local','language','ENGLISH'),(3,'local','applicationUsername','Acacia Bank'),(4,'local','defaultExternalPaymentDescription','External payment'),(5,'local','chargebackDescription','Chargeback for payment at #date#\r\n#description#'),(6,'mailTranslation','invitationSubject','Invitation to join #system_name#'),(7,'mailTranslation','invitationMessage','The member #member# sent you an invitation to explore #system_name#.<br>To access the software, browse to #link# <br><br> Kind Regards,<br> The administration'),(8,'mailTranslation','activationSubject','Welcome to #system_name#'),(9,'mailTranslation','activationMessageWithoutPassword','Hello #member# <br><br> Your account on #system_name# has been activated.<br>You can now access the system with the login name #login#.<br><br>To access the software, #link# <br><br> Kind Regards,<br> The #system_name# team.'),(10,'mailTranslation','activationMessageWithPassword','Hello #member# <br><br> Your account on #system_name# has been activated.<br>You can now access the system with the login name #login# and the password #password#. This password is temporary, and should be changed after the first login.<br><br>To access the software, #link#<br><br> Kind Regards,<br> The #system_name# team.'),(11,'mailTranslation','resetPasswordSubject','#system_name# password reset'),(12,'mailTranslation','resetPasswordMessage','Hello #member#.<br><br>Your password has been reset on #system_name#.<br>You can now login as #login# with password #password#.<br>You will have to change your password on your next login.<br>To access the software, access #link# <br><br> Kind Regards,<br> The administration'),(13,'mailTranslation','mailValidationSubject','#system_name# e-mail validation'),(14,'mailTranslation','mailValidationMessage','Hello #member# <br><br> You have been registered on #system_name#, but first, the e-mail address entered must be validated.<br><br>In order to validate the registration, please click the link below:<br><br>#link#<br><br>Thanks for registering on #system_name#. If you haven\'t registered or wasn\'t expecting this mail, please, ignore it. <br><br> Kind Regards,<br> The administration'),(15,'message','loginBlockedMessage','You have reached the maximum number of wrong login tries.<br>Now, your login is temporarily blocked'),(16,'message','loginBlockedSubject','Your login is temporarily blocked'),(17,'message','loginBlockedSms','You have reached the maximum number of wrong login tries. Now, your login is temporarily blocked'),(18,'message','pinBlockedMessage','You have reached the maximum number of wrong PIN tries.<br>Now, your PIN is temporarily blocked.'),(19,'message','pinBlockedSubject','Your PIN is temporarily blocked'),(20,'message','pinBlockedSms','You have reached the maximum number of wrong PIN tries. Now, your PIN is temporarily blocked.'),(21,'message','posPinBlockedMessage','You have reached the maximum number of wrong PIN tries.<br>Now, your POS is temporarily blocked.'),(22,'message','posPinBlockedSubject','Your POS pin is temporarily blocked'),(23,'message','posPinBlockedSms','You have reached the maximum number of wrong PIN tries, and your POS is temporarily blocked.'),(24,'message','cardSecurityCodeBlockedMessage','You have reached the maximum number of wrong card security code tries.<br>Now, your card is temporarily blocked.'),(25,'message','cardSecurityCodeBlockedSubject','Your card security code is temporarily blocked'),(26,'message','cardSecurityCodeBlockedSms','You have reached the maximum number of wrong card security code tries,  your card is now temporarily blocked.'),(27,'message','brokeringExpirationMessage','The brokering relation between you and #member# (#login#) has expired'),(28,'message','brokeringExpirationSubject','Brokering relation expired'),(29,'message','brokeringExpirationSms','The brokering relation between you and #login# has expired'),(30,'message','brokeringRemovedMessage','The brokering relation between you and #member# (#login#) has been removed'),(31,'message','brokeringRemovedSubject','Brokering relation removed'),(32,'message','brokeringRemovedSms','The brokering relation between you and #login# has been removed'),(33,'message','removedFromBrokerGroupMessage','The administration removed you from the broker group'),(34,'message','removedFromBrokerGroupSubject','You were removed from the broker group'),(35,'message','removedFromBrokerGroupSms','The administration removed you from the broker group'),(36,'message','newCommissionContractMessage','The broker #broker# registered a new contract that is awaiting your approval:<br>Start date: #start_date#<br>End date: #end_date#<br>Amount: #amount#<br>#link# for more details'),(37,'message','newCommissionContractSubject','Broker commission contract registered'),(38,'message','newCommissionContractSms','The broker #broker_login# registered a new contract that is awaiting your approval. Start date: #start_date#, end date: #end_date#, amount: #amount#'),(39,'message','commissionContractAcceptedMessage','The member #member# accepted the broker commission contract:<br>Start date: #start_date#<br>End date: #end_date#<br>Amount: #amount#<br>#link# for more details'),(40,'message','commissionContractAcceptedSubject','Broker commission contract accepted'),(41,'message','commissionContractAcceptedSms','The member #login# accepted the broker commission contract. Start date: #start_date#, end date: #end_date#, amount: #amount#'),(42,'message','commissionContractCancelledMessage','The broker #broker# cancelled a broker commission contract:<br>Start date: #start_date#<br>End date: #end_date#<br>Amount: #amount#<br>#link# for more details'),(43,'message','commissionContractCancelledSubject','Broker commission contract cancelled'),(44,'message','commissionContractCancelledSms','The broker #broker_login# cancelled a broker commission contract. Start date: #start_date#, end date: #end_date#, amount: #amount#'),(45,'message','commissionContractDeniedMessage','The member #member# denied the broker commission contract:<br>Start date: #start_date#<br>End date: #end_date#<br>Amount: #amount#<br>#link# for more details'),(46,'message','commissionContractDeniedSubject','Broker commission contract denied'),(47,'message','commissionContractDeniedSms','The member #login# denied the broker commission contract. Start date: #start_date#, end date: #end_date#, amount: #amount#'),(48,'message','lowUnitsMessage','You are reaching the credit limit of #credit_limit#'),(49,'message','lowUnitsSubject','Low units notification'),(50,'message','lowUnitsSms','You are reaching the credit limit'),(51,'message','adExpirationMessage','Your ad with title \"#title#\" has expired.<br>#link# for more details'),(52,'message','adExpirationSubject','Your ad has expired'),(53,'message','adExpirationSms','Your ad expired. Title: #title#'),(54,'message','adInterestMessage','New ad published matching your interests, with title \"#title#\".<br>#link# for more details'),(55,'message','adInterestSubject','New ad published matching your interests'),(56,'message','adInterestSms','New ad published matching your interests, with title: #title#'),(57,'message','invoiceReceivedMessage','You have received an invoice from #member# (#login#).<br>#link# for more details'),(58,'message','invoiceReceivedSubject','You have received an invoice'),(59,'message','invoiceReceivedSms','You have received an invoice from #login#'),(60,'message','invoiceAcceptedMessage','#member# (#login#) has accepted your invoice with:<br>Date: #date#<br>Amount: #amount#<br>Description: #description#.<br>#link# for more details'),(61,'message','invoiceAcceptedSubject','Your invoice was accepted'),(62,'message','invoiceAcceptedSms','#login# has accepted your invoice with date: #date#, amount: #amount#'),(63,'message','invoiceCancelledMessage','#member# (#login#) has canceled the invoice with:<br>Date: #date#<br>Amount: #amount#<br>Description: #description#.<br>#link# for more details'),(64,'message','invoiceCancelledSubject','Your invoice was canceled'),(65,'message','invoiceCancelledSms','#login# has canceled the invoice with date: #date#, amount: #amount#'),(66,'message','invoiceDeniedMessage','#member# (#login#) has denied your invoice with:<br>Date: #date#<br>Amount: #amount#<br>Description: #description#.<br>#link# for more details'),(67,'message','invoiceDeniedSubject','Your invoice was denied'),(68,'message','invoiceDeniedSms','#login# has denied your invoice with date: #date#, amount: #amount#'),(69,'message','receivedInvoiceExpiredMessage','An invoice you received from #member# (#login#) of #amount# has expired.<br>#link# for more details'),(70,'message','receivedInvoiceExpiredSubject','An invoice you received has expired'),(71,'message','receivedInvoiceExpiredSms','An invoice you received from #login# of #amount# has expired'),(72,'message','sentInvoiceExpiredMessage','An invoice you sent to #member# (#login#) of #amount# has expired.<br>#link# for more details'),(73,'message','sentInvoiceExpiredSubject','An invoice you sent has expired'),(74,'message','sentInvoiceExpiredSms','An invoice you sent to #login# of #amount# has expired'),(75,'message','loanExpirationMessage','A loan granted at #grant_date# (#amount#) has expired.<br>#link# for more details'),(76,'message','loanExpirationSubject','Loan has expired'),(77,'message','loanExpirationSms','A loan granted at #grant_date# (#amount#) has expired'),(78,'message','loanGrantedMessage','A loan of #amount# has been granted.<br>#link# for more details'),(79,'message','loanGrantedSubject','Loan granted'),(80,'message','loanGrantedSms','A loan of #amount# has been granted'),(81,'message','paymentReceivedMessage','A payment of #amount# was received from #member# (#login#).<br>#link# for more details.'),(82,'message','paymentReceivedSubject','Payment received'),(83,'message','paymentReceivedSms','A payment of #amount# was received from #login#. Your balance is #available_balance#'),(84,'message','pendingPaymentReceivedMessage','A payment awaiting authorization of #amount# was received from #member# (#login#).<br>#link# for more details'),(85,'message','pendingPaymentReceivedSubject','A payment awaiting authorization was received'),(86,'message','pendingPaymentReceivedSms','A payment awaiting authorization of #amount# was received from #login#'),(87,'message','newPendingPaymentByReceiverMessage','A payment of #amount# was received from #member# (#login#), and you should authorize it.<br>#link# for more details'),(88,'message','newPendingPaymentByReceiverSubject','You have received a payment you should authorize'),(89,'message','newPendingPaymentByReceiverSms','A payment of #amount# was received from #login#, and you should authorize it'),(90,'message','newPendingPaymentByPayerMessage','A payment of #amount# that you performed to #member# (#login#) now needs your authorization to be processed.<br>#link# for more details'),(91,'message','newPendingPaymentByPayerSubject','A payment you have performed is now awaiting your authorization'),(92,'message','newPendingPaymentByPayerSms','A payment of #amount# that you performed to #login# now needs your authorization to be processed'),(93,'message','newPendingPaymentByBrokerMessage','A payment of #amount# was made by #member# (#login#), and you should authorize it.<br>#link# for more details'),(94,'message','newPendingPaymentByBrokerSubject','Payment authorization request'),(95,'message','newPendingPaymentByBrokerSms','A payment of #amount# was made by #login#, and you should authorize it'),(96,'message','pendingPaymentAuthorizedMessage','A payment submitted at #date# of #amount# was authorized.<br>#link# for more details'),(97,'message','pendingPaymentAuthorizedSubject','A pending payment has been authorized'),(98,'message','pendingPaymentAuthorizedSms','A payment submitted at #date# of #amount# was authorized'),(99,'message','pendingPaymentDeniedMessage','A payment submitted at #date# of #amount# was denied.<br>#link# for more details'),(100,'message','pendingPaymentDeniedSubject','A pending payment has been denied'),(101,'message','pendingPaymentDeniedSms','A payment submitted at #date# of #amount# was denied'),(102,'message','pendingPaymentCanceledMessage','A payment submitted at #date# of #amount# was canceled.<br>#link# for more details'),(103,'message','pendingPaymentCanceledSubject','A pending payment has been canceled'),(104,'message','pendingPaymentCanceledSms','A payment submitted at #date# of #amount# was canceled'),(105,'message','scheduledPaymentsCancelledToOtherMessage','All scheduled payments related to #member# (#login#) were cancelled because that member can not make/accept those payments.'),(106,'message','scheduledPaymentsCancelledToOtherSubject','Scheduled payments cancelled'),(107,'message','scheduledPaymentsCancelledToOtherSms','All scheduled payments related to #login# were cancelled.'),(108,'message','scheduledPaymentsCancelledMessage','Some of yours scheduled payments were cancelled because you no longer have the following accounts: #accounts#.'),(109,'message','scheduledPaymentsCancelledSubject','Scheduled payments cancelled'),(110,'message','scheduledPaymentsCancelledSms','Some of yours scheduled payments were cancelled.'),(111,'message','scheduledPaymentProcessedMessage','An scheduled payment to #member# (#login#) of #amount# was successfully processed.<br>#link# for more details'),(112,'message','scheduledPaymentProcessedSubject','Scheduled payment successful'),(113,'message','scheduledPaymentProcessedSms','An scheduled payment to #login# of #amount# was successfully processed'),(114,'message','scheduledPaymentFailedToPayerMessage','An scheduled payment to #member# (#login#) of #amount# has failed.<br>#link# for more details'),(115,'message','scheduledPaymentFailedToPayerSubject','Scheduled payment has failed'),(116,'message','scheduledPaymentFailedToPayerSms','An scheduled payment to #login# of #amount# has failed'),(117,'message','scheduledPaymentFailedToPayeeMessage','An scheduled payment from #member# (#login#) of #amount# has failed.<br>#link# for more details'),(118,'message','scheduledPaymentFailedToPayeeSubject','An incoming scheduled payment has failed'),(119,'message','scheduledPaymentFailedToPayeeSms','An scheduled payment from #login# of #amount# has failed'),(120,'message','externalChannelPaymentPerformedMessage','You performed a #channel# payment of #amount# to #member# (#login#).<br>#link# for more details'),(121,'message','externalChannelPaymentPerformedSubject','External channel payment performed'),(122,'message','externalChannelPaymentPerformedSms','You performed a #channel# payment of #amount# to #login#'),(123,'message','externalChannelPaymentRequestExpiredPayerMessage','The #channel# payment of #amount# requested by #toMemberName# (#toMemberUsername#) has expired.<br>#link# for more details'),(124,'message','externalChannelPaymentRequestExpiredPayerSubject','External channel payment request expired'),(125,'message','externalChannelPaymentRequestExpiredPayerSms','The #channel# payment of #amount# requested by #toMemberUsername# has expired'),(126,'message','externalChannelPaymentRequestExpiredReceiverMessage','The #channel# payment of #amount# you requested to #from_member# (#from_login#) has expired.<br>#link# for more details'),(127,'message','externalChannelPaymentRequestExpiredReceiverSubject','External channel payment request expired'),(128,'message','externalChannelPaymentRequestExpiredReceiverSms','The #channel# payment of #amount# you requested to #from_login# has expired'),(129,'message','referenceReceivedMessage','A reference was received from #member# (#login#).<br>#link# for more details'),(130,'message','referenceReceivedSubject','Reference received'),(131,'message','referenceReceivedSms','A reference was received from #login#'),(132,'message','transactionFeedbackReceivedMessage','A transaction feedback was received from #member# (#login#) for a payment of #amount# at #date#.<br>#link# for more details'),(133,'message','transactionFeedbackReceivedSubject','Transaction feedback received'),(134,'message','transactionFeedbackReceivedSms','A transaction feedback was received from #login# for a payment of #amount# at #date#. This feedback may be replied until #limit#'),(135,'message','transactionFeedbackReplyMessage','A transaction feedback from #member# (#login#) for a payment of #amount# at #date# received a reply.<br>#link# for more details'),(136,'message','transactionFeedbackReplySubject','Transaction feedback was replied'),(137,'message','transactionFeedbackReplySms','A transaction feedback from #login# for a payment of #amount# at #date# received a reply'),(138,'message','transactionFeedbackAdminCommentsMessage','A transaction feedback for a transaction with #member# (#login#) of #amount# at #date#.<br>#link# for more details'),(139,'message','transactionFeedbackAdminCommentsSubject','Transaction feedback was commented by the administration'),(140,'message','transactionFeedbackAdminCommentsSms','New transaction feedback for a transaction with #login# of #amount# at #date#'),(141,'message','transactionFeedbackRequestMessage','Please, give a transaction feedback for the payment to #member# (#login#) of #amount# at #date#.<br>You can give your feedback until #limit#.<br>#link# for more details'),(142,'message','transactionFeedbackRequestSubject','Transaction feedback'),(143,'message','transactionFeedbackRequestSms','Please, give a transaction feedback for the payment to #login# of #amount# at #date#. You can give your feedback until #limit#'),(144,'message','accountFeeReceivedMessage','#account_fee# of #amount# was received.<br>#link# for more details'),(145,'message','accountFeeReceivedSubject','#account_fee# received'),(146,'message','accountFeeReceivedSms','#account_fee# of #amount# was received'),(147,'message','maxTransactionPasswordTriesMessage','You have reached the maximum number of wrong transaction password tries.<br>Now, your transaction password is blocked and you must contact the administration.'),(148,'message','maxTransactionPasswordTriesSubject','Maximum number of wrong transaction password tries reached'),(149,'message','maxTransactionPasswordTriesSms','Maximum number of wrong transaction password tries. Your transaction password is blocked. Contact the administration.'),(150,'message','certificationIssuedMessage','A new certification of #amount# was issued by #issuer_member# (#issuer_login#).<br>#link# for more details'),(151,'message','certificationIssuedSubject','A new certification was issued'),(152,'message','certificationIssuedSms','A new certification of #amount# was issued by #issuer_login#'),(153,'message','certificationStatusChangedMessage','The status of certification of #amount# issued by #issuer_member# (#issuer_login#) has changed to \"#status#\".<br>#link# for more details'),(154,'message','certificationStatusChangedSubject','The status of certification has changed'),(155,'message','certificationStatusChangedSms','The status of the certification of #amount# issued by #issuer_login# has changed to \"#status#\"'),(156,'message','expiredCertificationMessage','The certification of #amount# issued to #buyer_member# (#buyerUserName#) has expired.<br>#link# for more details'),(157,'message','expiredCertificationSubject','A certification has expired'),(158,'message','expiredCertificationSms','The certification of #amount# issued to #buyer_login# has expired'),(159,'message','expiredGuaranteeMessage','The guarantee of #amount# issued to #buyer_member# (#buyer_login#) has expired.<br>#link# for more details'),(160,'message','expiredGuaranteeSubject','A guarantee has expired'),(161,'message','expiredGuaranteeSms','The guarantee of #amount# issued to #buyer_login# has expired'),(162,'message','buyerOnlyGuaranteeStatusChangedMessage','The status of the guarantee of #amount# issued by #issuer_member# (#issuer_login#) has changed to \"#status#\".<br>#link# for more details'),(163,'message','buyerOnlyGuaranteeStatusChangedSubject','The status of a guarantee has changed'),(164,'message','buyerOnlyGuaranteeStatusChangedSms','The status of the guarantee of #amount# issued by #issuer_login# has changed to \"#status#\"'),(165,'message','guaranteeStatusChangedMessage','The status of the guarantee of #amount# has changed to \"#status#\".<br>Issuer: #issuer_member# (#issuer_login#)<br>Buyer: #buyer_member# (#buyer_login#)<br>Seller: #seller_member# (#seller_login#)<br>#link# for more details'),(166,'message','guaranteeStatusChangedSubject','The status of a guarantee has changed'),(167,'message','guaranteeStatusChangedSms','The status of the guarantee of #amount# has changed to \"#status#\". issuer: #issuer_login#, buyer: #buyer_login#, seller: #seller_login#'),(168,'message','pendingBuyerOnlyGuaranteeIssuerMessage','A new guarantee was requested and is awaiting your authorization.<br>Buyer: #buyer_member# (#buyer_login#)<br>Amount: #amount#<br>#link# for more details'),(169,'message','pendingBuyerOnlyGuaranteeIssuerSubject','New pending guarantee awaiting authorization'),(170,'message','pendingBuyerOnlyGuaranteeIssuerSms','A new guarantee was requested and is awaiting your authorization. Buyer: #buyer_login#, amount: #amount#'),(171,'message','pendingGuaranteeIssuerMessage','A new guarantee was requested and is awaiting your authorization.<br>Buyer: #buyer_member# (#buyer_login#)<br>Seller: #seller_member# (#seller_login#)<br>Amount: #amount#<br>#link# for more details'),(172,'message','pendingGuaranteeIssuerSubject','New pending guarantee awaiting authorization'),(173,'message','pendingGuaranteeIssuerSms','A new guarantee was requested and is awaiting your authorization. Buyer: #buyer_login#, seller: #seller_login#, amount: #amount#'),(174,'message','paymentObligationRegisteredMessage','A new payment obligation of #amount# was issued by #buyer_member# (#buyer_login#).<br>#link# for more details'),(175,'message','paymentObligationRegisteredSubject','A new payment obligation was issued'),(176,'message','paymentObligationRegisteredSms','A new payment obligation of #amount# was issued by #buyer_login#.'),(177,'message','paymentObligationRejectedMessage','The payment obligation of #amount# was rejected by #seller_member# (#seller_login#). <br>#link# for more details'),(178,'message','paymentObligationRejectedSubject','A payment obligation was rejected'),(179,'message','paymentObligationRejectedSms','The payment obligation of #amount# was rejected by #seller_login#'),(180,'message','adminPendingBuyerOnlyGuaranteeMessage','A new guarantee was requested and is awaiting authorization.<br>Issuer: #issuer_member# (#issuer_login#)<br>Buyer: #buyer_member# (#buyer_login#)<br>Amount: #amount#<br>#link# for more details'),(181,'message','adminPendingBuyerOnlyGuaranteeSubject','New pending guarantee awaiting authorization'),(182,'message','adminPendingGuaranteeMessage','A new guarantee was requested and is awaiting authorization.<br>Issuer: #issuer_member# (#issuer_login#)<br>Buyer: #buyer_member# (#buyer_login#)<br>Seller: #seller_member# (#seller_login#)<br>Amount: #amount#<br>#link# for more details'),(183,'message','adminPendingGuaranteeSubject','New pending guarantee awaiting authorization'),(184,'message','adminApplicationErrorMessage','There was an application error on \'#path#\'.<br>#link# for more details'),(185,'message','adminApplicationErrorSubject','Application error'),(186,'message','adminPaymentFromSystemToMemberMessage','#payment_type# of #amount# to #member# (#login#).<br>#link# for more details'),(187,'message','adminPaymentFromSystemToMemberSubject','New payment from #from_account#'),(188,'message','adminPaymentFromMemberToSystemMessage','#payment_type# of #amount# from #member# (#login#).<br>#link# for more details'),(189,'message','adminPaymentFromMemberToSystemSubject','New payment to #to_account#'),(190,'message','adminPaymentFromSystemToSystemMessage','#payment_type# of #amount#.<br>#link# for more details'),(191,'message','adminPaymentFromSystemToSystemSubject','New payment between #from_account# and #to_account#'),(192,'message','adminNewPendingPaymentMessage','A payment of #amount# was made by #member# (#login#), and you should authorize it.<br>#link# for more details'),(193,'message','adminNewPendingPaymentSubject','Payment authorization request'),(194,'message','adminNewMemberMessage','#member# has registered in #group#.<br>#link# for more details'),(195,'message','adminNewMemberSubject','New member in #group#'),(196,'message','adminSystemAlertSubject','New system alert'),(197,'message','adminMemberAlertSubject','New member alert for #member# (#login#)'),(198,'message','adminSystemInvoiceMessage','New system invoice of #amount# from #member# (#login#).<br>#link# for more details'),(199,'message','adminSystemInvoiceSubject','New system invoice'),(200,'message','brokerRemovedRemarkComments','The broker #member# (#login#) has been removed'),(201,'message','messageMailSubjectPrefix','#system_name#:'),(202,'message','messageMailSuffixPlain','Please, do not reply this mail directly. Login to your #system_name# account to reply your messages'),(203,'message','messageMailSuffixHtml','<span style=\'font-size:smaller;color:SlateGray;\'>Please, do not reply to this mail directly. Login to your #system_name# account to reply your messages</span>'),(204,'message','smsMessagePrefix','#system_name#:'),(205,'log','traceFile','logs/cyclos_trace%g.log'),(206,'log','transactionFile','logs/cyclos_transactions%g.log'),(207,'log','accountFeeFile','logs/cyclos_account_fees%g.log'),(208,'log','scheduledTaskFile','logs/cyclos_scheduled_task%g.log'),(209,'log','webServiceFile','logs/cyclos_webservices%g.log'),(210,'log','restFile','logs/cyclos_rest%g.log'),(211,'local','applicationName','Acacia Bank Internet Banking'),(212,'local','rootUrl','http://localhost:8080/cyclos'),(213,'local','numberLocale','PERIOD_AS_DECIMAL'),(214,'local','precision','TWO'),(215,'local','highPrecision','FOUR'),(216,'local','decimalInputMethod','RTL'),(217,'local','datePattern','DD_MM_YYYY_SLASH'),(218,'local','timePattern','HH24_MM_SS'),(219,'local','timeZone',NULL),(220,'local','containerUrl',NULL),(221,'local','maxIteratorResults','1000'),(222,'local','maxPageResults','15'),(223,'local','maxAjaxResults','8'),(224,'local','maxUploadSize','5'),(225,'local','maxUploadUnits','MEGA_BYTES'),(226,'local','maxImageWidth','800'),(227,'local','maxImageHeight','600'),(228,'local','maxThumbnailWidth','100'),(229,'local','maxThumbnailHeight','100'),(230,'local','referenceLevels','5'),(231,'local','smsEnabled','false'),(232,'local','csvUseHeader','true'),(233,'local','csvRecordSeparator','LF'),(234,'local','csvValueSeparator','COMMA'),(235,'local','csvStringQuote','DOUBLE_QUOTE'),(236,'local','cyclosId',NULL),(237,'local','sendSmsWebServiceUrl',NULL),(238,'local','smsChannelName',NULL),(239,'local','smsCustomFieldId','0'),(240,'local','transactionNumber.prefix',NULL),(241,'local','transactionNumber.padLength','10'),(242,'local','transactionNumber.suffix',NULL),(243,'local','emailRequired','false'),(244,'local','emailUnique','false'),(245,'local','brokeringExpirationPeriod.number','0'),(246,'local','brokeringExpirationPeriod.field','YEARS'),(247,'local','deleteMessagesOnTrashAfter.number','30'),(248,'local','deleteMessagesOnTrashAfter.field','DAYS'),(249,'local','deletePendingRegistrationsAfter.number','7'),(250,'local','deletePendingRegistrationsAfter.field','DAYS'),(251,'local','memberSortOrder','CHRONOLOGICAL'),(252,'local','memberResultDisplay','NAME'),(253,'local','adDescriptionFormat','RICH'),(254,'local','messageFormat','RICH'),(255,'local','schedulingHour','0'),(256,'local','schedulingMinute','0'),(257,'local','transferListenerClass',NULL),(258,'local','maxChargebackTime.number','1'),(259,'local','maxChargebackTime.field','MONTHS'),(260,'local','showCountersInAdCategories','true'),(261,'access','virtualKeyboard','true'),(262,'access','virtualKeyboardTransactionPassword','false'),(263,'access','numericPassword','false'),(264,'access','allowOperatorLogin','true'),(265,'access','allowMultipleLogins','true'),(266,'access','usernameLength.min','4'),(267,'access','usernameLength.max','8'),(268,'access','adminTimeout.number','15'),(269,'access','adminTimeout.field','MINUTES'),(270,'access','administrationWhitelist','#Any host'),(271,'access','usernameGeneration','RANDOM'),(272,'access','generatedUsernameLength','8'),(273,'access','memberTimeout.number','10'),(274,'access','memberTimeout.field','MINUTES'),(275,'access','poswebTimeout.number','1'),(276,'access','poswebTimeout.field','DAYS'),(277,'access','transactionPasswordChars','ABCDEFGHIJ'),(278,'access','usernameRegex','^[\\w\\.]*$');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_logs`
--

DROP TABLE IF EXISTS `sms_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_member_id` int(11) NOT NULL,
  `charged_member_id` int(11) DEFAULT NULL,
  `sms_type_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `sms_mailing_id` int(11) DEFAULT NULL,
  `free_base_used` bit(1) NOT NULL,
  `message_type` varchar(3) DEFAULT NULL,
  `error_type` varchar(3) DEFAULT NULL,
  `arg0` varchar(150) DEFAULT NULL,
  `arg1` varchar(150) DEFAULT NULL,
  `arg2` varchar(150) DEFAULT NULL,
  `arg3` varchar(150) DEFAULT NULL,
  `arg4` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF9D930D5311F5E08` (`charged_member_id`),
  KEY `FKF9D930D552CC4E04` (`sms_mailing_id`),
  KEY `FKF9D930D5E0901629` (`target_member_id`),
  KEY `FKF9D930D5D76E1B90` (`sms_type_id`),
  CONSTRAINT `FKF9D930D5D76E1B90` FOREIGN KEY (`sms_type_id`) REFERENCES `sms_types` (`id`),
  CONSTRAINT `FKF9D930D5311F5E08` FOREIGN KEY (`charged_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKF9D930D552CC4E04` FOREIGN KEY (`sms_mailing_id`) REFERENCES `sms_mailings` (`id`),
  CONSTRAINT `FKF9D930D5E0901629` FOREIGN KEY (`target_member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_logs`
--

LOCK TABLES `sms_logs` WRITE;
/*!40000 ALTER TABLE `sms_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_mailings`
--

DROP TABLE IF EXISTS `sms_mailings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_mailings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `text` varchar(255) NOT NULL,
  `free` bit(1) NOT NULL,
  `sent_sms` int(11) NOT NULL,
  `finished` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9BFD1F2E2B1214C2` (`by_id`),
  KEY `FK9BFD1F2EEAE0AB57` (`member_id`),
  CONSTRAINT `FK9BFD1F2EEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK9BFD1F2E2B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_mailings`
--

LOCK TABLES `sms_mailings` WRITE;
/*!40000 ALTER TABLE `sms_mailings` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_mailings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_mailings_groups`
--

DROP TABLE IF EXISTS `sms_mailings_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_mailings_groups` (
  `sms_mailing_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `FKA3F5E80552CC4E04` (`sms_mailing_id`),
  KEY `FKA3F5E805B45926EE` (`group_id`),
  CONSTRAINT `FKA3F5E805B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKA3F5E80552CC4E04` FOREIGN KEY (`sms_mailing_id`) REFERENCES `sms_mailings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_mailings_groups`
--

LOCK TABLES `sms_mailings_groups` WRITE;
/*!40000 ALTER TABLE `sms_mailings_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_mailings_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_mailings_pending_to_send`
--

DROP TABLE IF EXISTS `sms_mailings_pending_to_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_mailings_pending_to_send` (
  `sms_mailing_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  KEY `FKAA585113EAE0AB57` (`member_id`),
  KEY `FKAA58511352CC4E04` (`sms_mailing_id`),
  CONSTRAINT `FKAA58511352CC4E04` FOREIGN KEY (`sms_mailing_id`) REFERENCES `sms_mailings` (`id`),
  CONSTRAINT `FKAA585113EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_mailings_pending_to_send`
--

LOCK TABLES `sms_mailings_pending_to_send` WRITE;
/*!40000 ALTER TABLE `sms_mailings_pending_to_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_mailings_pending_to_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_types`
--

DROP TABLE IF EXISTS `sms_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `order_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_types`
--

LOCK TABLES `sms_types` WRITE;
/*!40000 ALTER TABLE `sms_types` DISABLE KEYS */;
INSERT INTO `sms_types` VALUES (1,'REQUEST_PAYMENT',0),(2,'REQUEST_PAYMENT_ERROR',1),(3,'PAYMENT',2),(4,'PAYMENT_ERROR',3),(5,'ACCOUNT_DETAILS',4),(6,'ACCOUNT_DETAILS_ERROR',5),(7,'HELP',6),(8,'HELP_ERROR',7),(9,'INFO_TEXT',8),(10,'INFO_TEXT_ERROR',9),(11,'OPERATION_CONFIRMATION',10),(12,'GENERAL',11);
/*!40000 ALTER TABLE `sms_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `status` varchar(1) NOT NULL,
  `ticket` varchar(32) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `amount` decimal(15,6) DEFAULT NULL,
  `transfer_type_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `description` longtext,
  `from_member_id` int(11) DEFAULT NULL,
  `to_member_id` int(11) DEFAULT NULL,
  `transfer_id` bigint(20) DEFAULT NULL,
  `return_url` varchar(150) DEFAULT NULL,
  `client_address` varchar(40) DEFAULT NULL,
  `member_address` varchar(40) DEFAULT NULL,
  `trace_data` varchar(50) DEFAULT NULL,
  `from_channel_id` int(11) DEFAULT NULL,
  `to_channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_ticket` (`ticket`),
  KEY `FKB124F6E72F78F3B3` (`transfer_id`),
  KEY `FKB124F6E7C0E7F6FA` (`currency_id`),
  KEY `FKB124F6E7EFF3852D` (`from_channel_id`),
  KEY `FKB124F6E7A4766B0A` (`transfer_type_id`),
  KEY `FKB124F6E7823FB102` (`from_member_id`),
  KEY `FKB124F6E79DCA1693` (`to_member_id`),
  KEY `FKB124F6E745B5D1BC` (`to_channel_id`),
  CONSTRAINT `FKB124F6E745B5D1BC` FOREIGN KEY (`to_channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `FKB124F6E72F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FKB124F6E7823FB102` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKB124F6E79DCA1693` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKB124F6E7A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FKB124F6E7C0E7F6FA` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `FKB124F6E7EFF3852D` FOREIGN KEY (`from_channel_id`) REFERENCES `channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trace_numbers`
--

DROP TABLE IF EXISTS `trace_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trace_numbers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `trace_number` varchar(100) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trace_number` (`trace_number`,`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_numbers`
--

LOCK TABLES `trace_numbers` WRITE;
/*!40000 ALTER TABLE `trace_numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `trace_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_fees`
--

DROP TABLE IF EXISTS `transaction_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(1) NOT NULL,
  `payer` varchar(3) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `original_type_id` int(11) NOT NULL,
  `generated_type_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `from_all_groups` bit(1) NOT NULL,
  `to_all_groups` bit(1) NOT NULL,
  `description` longtext,
  `deduct_amount` bit(1) NOT NULL,
  `amount` decimal(15,6) DEFAULT NULL,
  `amount_type` varchar(1) NOT NULL,
  `max_fixed_value` decimal(15,6) DEFAULT NULL,
  `max_percentage_value` decimal(15,6) DEFAULT NULL,
  `initial_amount` decimal(15,6) DEFAULT NULL,
  `final_amount` decimal(15,6) DEFAULT NULL,
  `from_member_id` int(11) DEFAULT NULL,
  `receiver` varchar(3) DEFAULT NULL,
  `to_member_id` int(11) DEFAULT NULL,
  `h` decimal(15,6) DEFAULT NULL,
  `a_f_is_zero` decimal(15,6) DEFAULT NULL,
  `f1` decimal(15,6) DEFAULT NULL,
  `f_infinite` decimal(15,6) DEFAULT NULL,
  `f_minimal` decimal(15,6) DEFAULT NULL,
  `g_f_is_zero` decimal(15,6) DEFAULT NULL,
  `which_broker` varchar(1) DEFAULT NULL,
  `when_apply` varchar(1) DEFAULT NULL,
  `when_count` int(11) DEFAULT NULL,
  `all_broker_groups` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK1E50E66ED56AF6F0` (`original_type_id`),
  KEY `FK1E50E66E399E68AE` (`generated_type_id`),
  KEY `FK1E50E66E823FB102` (`from_member_id`),
  KEY `FK1E50E66E9DCA1693` (`to_member_id`),
  CONSTRAINT `FK1E50E66E9DCA1693` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK1E50E66E399E68AE` FOREIGN KEY (`generated_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK1E50E66E823FB102` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK1E50E66ED56AF6F0` FOREIGN KEY (`original_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_fees`
--

LOCK TABLES `transaction_fees` WRITE;
/*!40000 ALTER TABLE `transaction_fees` DISABLE KEYS */;
INSERT INTO `transaction_fees` VALUES (1,'S','src','\0',13,25,'Transaction tax','','','Tax over all member to member trades','\0','5.000000','F',NULL,NULL,NULL,NULL,NULL,'sys',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(2,'B','sys','\0',13,26,'Broker commission','','','Broker commission','\0','2.500000','P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'S','C',20,'');
/*!40000 ALTER TABLE `transaction_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_authorizations`
--

DROP TABLE IF EXISTS `transfer_authorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_authorizations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `by_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `action` varchar(1) NOT NULL,
  `comments` longtext,
  `show_to_member` bit(1) NOT NULL,
  `transfer_id` bigint(20) NOT NULL,
  `level_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2767B1EE2F78F3B3` (`transfer_id`),
  KEY `FK2767B1EE2B1214C2` (`by_id`),
  KEY `FK2767B1EE285878DA` (`level_id`),
  CONSTRAINT `FK2767B1EE285878DA` FOREIGN KEY (`level_id`) REFERENCES `authorization_levels` (`id`),
  CONSTRAINT `FK2767B1EE2B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK2767B1EE2F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_authorizations`
--

LOCK TABLES `transfer_authorizations` WRITE;
/*!40000 ALTER TABLE `transfer_authorizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_authorizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_types`
--

DROP TABLE IF EXISTS `transfer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_account_type_id` int(11) NOT NULL,
  `to_account_type_id` int(11) NOT NULL,
  `allowed_payment` bit(1) NOT NULL,
  `allowed_self_payment` bit(1) NOT NULL,
  `priority` bit(1) NOT NULL,
  `conciliable` bit(1) NOT NULL,
  `requires_authorization` bit(1) NOT NULL,
  `allows_scheduled_payments` bit(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `confirmation_message` longtext,
  `max_amount_per_day` decimal(15,6) DEFAULT NULL,
  `min_amount` decimal(15,6) DEFAULT NULL,
  `reserve_total_on_sched` bit(1) NOT NULL,
  `allow_cancel_sched` bit(1) NOT NULL,
  `allow_block_sched` bit(1) NOT NULL,
  `show_sched_to_dest` bit(1) NOT NULL,
  `allow_sms_notification` bit(1) NOT NULL,
  `requires_feedback` bit(1) NOT NULL,
  `transfer_listener_class` varchar(200) DEFAULT NULL,
  `feedback_enabled_since` date DEFAULT NULL,
  `feedback_expiration_time_number` int(11) DEFAULT NULL,
  `feedback_expiration_time_field` int(11) DEFAULT NULL,
  `feedback_reply_expiration_time_number` int(11) DEFAULT NULL,
  `feedback_reply_expiration_time_field` int(11) DEFAULT NULL,
  `default_feedback_comments` longtext,
  `default_feedback_level` tinyint(4) DEFAULT NULL,
  `fixed_destination_member_id` int(11) DEFAULT NULL,
  `tx_hierarchy_visibility` varchar(1) DEFAULT NULL,
  `loan_type` varchar(1) DEFAULT NULL,
  `loan_repayment_type_id` int(11) DEFAULT NULL,
  `loan_grant_fee_value` decimal(15,6) DEFAULT NULL,
  `loan_grant_fee_type` char(1) DEFAULT NULL,
  `loan_grant_fee_type_id` int(11) DEFAULT NULL,
  `loan_monthly_interest` decimal(15,6) DEFAULT NULL,
  `loan_monthly_interest_type_id` int(11) DEFAULT NULL,
  `loan_expiration_fee_value` decimal(15,6) DEFAULT NULL,
  `loan_expiration_fee_type` char(1) DEFAULT NULL,
  `loan_expiration_fee_type_id` int(11) DEFAULT NULL,
  `loan_expiration_daily_interest` decimal(15,6) DEFAULT NULL,
  `loan_exp_daily_interest_type_id` int(11) DEFAULT NULL,
  `loan_repayment_days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK76C39725EE8035AA` (`loan_monthly_interest_type_id`),
  KEY `FK76C397257001A91` (`to_account_type_id`),
  KEY `FK76C397256F2DE5C0` (`from_account_type_id`),
  KEY `FK76C39725C1BE25C0` (`loan_exp_daily_interest_type_id`),
  KEY `FK76C397252CF15203` (`loan_repayment_type_id`),
  KEY `FK76C39725C41609DB` (`fixed_destination_member_id`),
  KEY `FK76C39725987C1B73` (`loan_grant_fee_type_id`),
  KEY `FK76C397255CCE1A44` (`loan_expiration_fee_type_id`),
  CONSTRAINT `FK76C397255CCE1A44` FOREIGN KEY (`loan_expiration_fee_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK76C397252CF15203` FOREIGN KEY (`loan_repayment_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK76C397256F2DE5C0` FOREIGN KEY (`from_account_type_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `FK76C397257001A91` FOREIGN KEY (`to_account_type_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `FK76C39725987C1B73` FOREIGN KEY (`loan_grant_fee_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK76C39725C1BE25C0` FOREIGN KEY (`loan_exp_daily_interest_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK76C39725C41609DB` FOREIGN KEY (`fixed_destination_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK76C39725EE8035AA` FOREIGN KEY (`loan_monthly_interest_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_types`
--

LOCK TABLES `transfer_types` WRITE;
/*!40000 ALTER TABLE `transfer_types` DISABLE KEYS */;
INSERT INTO `transfer_types` VALUES (1,1,2,'\0','','\0','\0','\0','\0','Debit to community','From debit to community account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,3,'\0','','\0','\0','\0','\0','Voucher creation','Used to create vouchers',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,4,'\0','','\0','\0','\0','\0','Debit to organization','From debit to organization account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,2,1,'\0','','\0','\0','\0','\0','Community to debit','From community to debit account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,2,3,'\0','','\0','\0','\0','\0','Community to voucher','From community to voucher account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,2,4,'\0','','\0','\0','\0','\0','Community to organization','From community to organization account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,3,1,'\0','','\0','\0','\0','\0','Voucher destruction','Destroy vouchers',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,3,2,'\0','','\0','\0','\0','\0','Voucher to community','From voucher to community account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,3,4,'\0','','\0','\0','\0','\0','Voucher to organization','From voucher to organization account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,4,1,'\0','','\0','\0','\0','\0','Organization to debit','From organization to debit account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,4,2,'\0','','\0','\0','\0','\0','Organization to community','From organization to community account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,4,3,'\0','','\0','\0','\0','\0','Organization to voucher','From organization to voucher account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,5,5,'','\0','\0','\0','\0','','Trade transfer','Trades between members',NULL,'1000.000000',NULL,'\0','\0','\0','\0','\0','',NULL,'2013-12-14',2,3,2,3,'No comments have been assigned to this transaction',0,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1,5,'','\0','\0','\0','\0','\0','Debit to member','From debit to member account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,2,5,'','\0','\0','\0','\0','\0','Community to member','From community to member account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,3,5,'','\0','\0','\0','\0','\0','Voucher cashing','Create vouchers',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,4,5,'','\0','\0','\0','\0','\0','Organization to member','From organization to member account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,5,2,'','\0','\0','\0','\0','\0','Member to community','From member to community account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,5,3,'','\0','\0','\0','\0','\0','Voucher buying','Used by a member to buy vouchers',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,5,4,'','\0','\0','\0','\0','\0','Member to organization','From member to organization account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,5,1,'\0','\0','\0','\0','\0','\0','Loan repayment','Loan repayment\nTotal amount: #loanTotalAmount#',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,1,5,'','\0','\0','\0','\0','\0','Loan','Used when a loan is granted',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M','S',21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30),(23,1,5,'\0','\0','\0','\0','\0','\0','Initial credit','Initial credit on account activation',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,1,5,'','\0','\0','\0','\0','\0','Money deposit','When a member converts money into units, a payment of this type is performed',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,5,2,'\0','\0','\0','\0','\0','\0','Transaction tax payment','Transaction tax payment',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,2,5,'\0','\0','\0','\0','\0','\0','Broker commission payment','Broker commission payment',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,5,2,'\0','\0','\0','\0','\0','\0','Contribution payment','Units contribution payment',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,5,2,'\0','\0','\0','\0','\0','\0','Liquidity tax payment','Liquidity tax payment\n Period: #begin_date# - #end_date#',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,5,5,'','\0','\0','\0','\0','\0','Trade transfer from mobile','Trades between members from mobile service',NULL,'500.000000',NULL,'\0','\0','\0','\0','\0','',NULL,'2013-12-14',2,3,2,3,'No comments have been assigned to this transaction',0,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,5,5,'','\0','\0','\0','\0','\0','External trade transfer','External trade between members',NULL,'500.000000',NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `transfer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_types_channels`
--

DROP TABLE IF EXISTS `transfer_types_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_types_channels` (
  `transfer_type_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  KEY `FK6FBCF7AAA4766B0A` (`transfer_type_id`),
  KEY `FK6FBCF7AA9B71D578` (`channel_id`),
  CONSTRAINT `FK6FBCF7AA9B71D578` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `FK6FBCF7AAA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_types_channels`
--

LOCK TABLES `transfer_types_channels` WRITE;
/*!40000 ALTER TABLE `transfer_types_channels` DISABLE KEYS */;
INSERT INTO `transfer_types_channels` VALUES (13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(29,2),(29,3),(29,4),(30,5),(30,6);
/*!40000 ALTER TABLE `transfer_types_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_types_linked_custom_fields`
--

DROP TABLE IF EXISTS `transfer_types_linked_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_types_linked_custom_fields` (
  `field_id` int(11) NOT NULL,
  `transfer_type_id` int(11) NOT NULL,
  KEY `FKC990947BA4766B0A` (`transfer_type_id`),
  KEY `FKC990947B9C156375` (`field_id`),
  CONSTRAINT `FKC990947B9C156375` FOREIGN KEY (`field_id`) REFERENCES `custom_fields` (`id`),
  CONSTRAINT `FKC990947BA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_types_linked_custom_fields`
--

LOCK TABLES `transfer_types_linked_custom_fields` WRITE;
/*!40000 ALTER TABLE `transfer_types_linked_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_types_linked_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_types_payment_filters`
--

DROP TABLE IF EXISTS `transfer_types_payment_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_types_payment_filters` (
  `transfer_type_id` int(11) NOT NULL,
  `payment_filter_id` int(11) NOT NULL,
  KEY `FK466919A8A4766B0A` (`transfer_type_id`),
  KEY `FK466919A8A78BAF2E` (`payment_filter_id`),
  CONSTRAINT `FK466919A8A78BAF2E` FOREIGN KEY (`payment_filter_id`) REFERENCES `payment_filters` (`id`),
  CONSTRAINT `FK466919A8A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_types_payment_filters`
--

LOCK TABLES `transfer_types_payment_filters` WRITE;
/*!40000 ALTER TABLE `transfer_types_payment_filters` DISABLE KEYS */;
INSERT INTO `transfer_types_payment_filters` VALUES (29,1),(13,1),(30,1),(21,2),(22,2),(25,3),(27,3),(28,3),(26,4),(16,5),(19,5),(19,6),(18,6),(20,6),(1,7),(4,7),(2,8),(7,8),(3,9),(10,9),(23,10),(22,10),(14,10),(5,11),(8,11),(1,12),(4,12),(6,13),(11,13),(27,14),(28,15),(26,16),(21,17),(22,17),(18,18),(15,18),(2,19),(7,19),(5,20),(8,20),(9,21),(12,21),(16,22),(19,22),(3,23),(10,23),(6,24),(11,24),(9,25),(12,25),(17,26),(20,26);
/*!40000 ALTER TABLE `transfer_types_payment_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `emission_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `i_rate` decimal(15,6) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `process_date` datetime DEFAULT NULL,
  `feedback_deadline` datetime DEFAULT NULL,
  `by_id` int(11) DEFAULT NULL,
  `description` longtext,
  `parent_id` bigint(20) DEFAULT NULL,
  `chargedback_by_id` bigint(20) DEFAULT NULL,
  `chargeback_of_id` bigint(20) DEFAULT NULL,
  `transaction_fee_id` int(11) DEFAULT NULL,
  `loan_payment_id` int(11) DEFAULT NULL,
  `account_fee_log_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `transaction_number` varchar(100) DEFAULT NULL,
  `trace_number` varchar(100) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `trace_data` varchar(50) DEFAULT NULL,
  `external_transfer_id` int(11) DEFAULT NULL,
  `next_authorization_level_id` int(11) DEFAULT NULL,
  `scheduled_payment_id` int(11) DEFAULT NULL,
  `broker_commission_contract_id` int(11) DEFAULT NULL,
  `fee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trace_number` (`trace_number`,`client_id`),
  KEY `FK3EBE45E8B3A79238` (`scheduled_payment_id`),
  KEY `FK3EBE45E82B1214C2` (`by_id`),
  KEY `FK3EBE45E8617A8174` (`external_transfer_id`),
  KEY `FK3EBE45E8E735A8CE` (`loan_payment_id`),
  KEY `FK3EBE45E84B79F4AC` (`next_authorization_level_id`),
  KEY `FK3EBE45E88799AF6F` (`from_account_id`),
  KEY `FK3EBE45E81106EAD7` (`broker_commission_contract_id`),
  KEY `FK3EBE45E8E969E40E` (`transaction_fee_id`),
  KEY `FK3EBE45E89D63275E` (`type_id`),
  KEY `FK3EBE45E86957A5AA` (`account_fee_log_id`),
  KEY `FK3EBE45E8E846CE9F` (`chargedback_by_id`),
  KEY `FK3EBE45E8A822302A` (`receiver_id`),
  KEY `FK3EBE45E8DD5BFBFE` (`to_account_id`),
  KEY `FK3EBE45E8A899F6A3` (`chargeback_of_id`),
  KEY `FK3EBE45E8229B7694` (`parent_id`),
  KEY `FK3EBE45E8CF860F8D` (`fee_id`),
  CONSTRAINT `FK3EBE45E8CF860F8D` FOREIGN KEY (`fee_id`) REFERENCES `transaction_fees` (`id`),
  CONSTRAINT `FK3EBE45E81106EAD7` FOREIGN KEY (`broker_commission_contract_id`) REFERENCES `broker_commission_contracts` (`id`),
  CONSTRAINT `FK3EBE45E8229B7694` FOREIGN KEY (`parent_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK3EBE45E82B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK3EBE45E84B79F4AC` FOREIGN KEY (`next_authorization_level_id`) REFERENCES `authorization_levels` (`id`),
  CONSTRAINT `FK3EBE45E8617A8174` FOREIGN KEY (`external_transfer_id`) REFERENCES `external_transfers` (`id`),
  CONSTRAINT `FK3EBE45E86957A5AA` FOREIGN KEY (`account_fee_log_id`) REFERENCES `account_fee_logs` (`id`),
  CONSTRAINT `FK3EBE45E88799AF6F` FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK3EBE45E89D63275E` FOREIGN KEY (`type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK3EBE45E8A822302A` FOREIGN KEY (`receiver_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK3EBE45E8A899F6A3` FOREIGN KEY (`chargeback_of_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK3EBE45E8B3A79238` FOREIGN KEY (`scheduled_payment_id`) REFERENCES `scheduled_payments` (`id`),
  CONSTRAINT `FK3EBE45E8DD5BFBFE` FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK3EBE45E8E735A8CE` FOREIGN KEY (`loan_payment_id`) REFERENCES `loan_payments` (`id`),
  CONSTRAINT `FK3EBE45E8E846CE9F` FOREIGN KEY (`chargedback_by_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK3EBE45E8E969E40E` FOREIGN KEY (`transaction_fee_id`) REFERENCES `transaction_fees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translation_messages`
--

DROP TABLE IF EXISTS `translation_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translation_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_key` varchar(100) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `msg_key` (`msg_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4812 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translation_messages`
--

LOCK TABLES `translation_messages` WRITE;
/*!40000 ALTER TABLE `translation_messages` DISABLE KEYS */;
INSERT INTO `translation_messages` VALUES (1,'translationMessage.import.type.ONLY_NEW','Import new keys only (leaving all existing keys)'),(2,'ad.modified','Advertisement modified'),(3,'cardType.modified','The card type was modified'),(4,'message.type.ACCESS','Access alerts'),(5,'memberRecord.search.fromDate','Registration date'),(6,'settings.log.webServiceFile','Web services logfile path / name'),(7,'permission.operatorReports.showAccountInformation','Show account information'),(8,'permission.adminMemberGuarantees.registerGuarantees','Register guarantees'),(9,'reports.stats.finances.ComparePeriods.expenditure.title','Expenditure Compare Periods'),(10,'defaultBrokerCommission.error.maxValueExceeded','{0}: the amount cannot be higher than {1}'),(11,'group.customizedFiles.removed','The file is no longer customized for this group'),(12,'reference.summary.positivePercentage','Positive %'),(13,'transactionFee.whichBroker.SOURCE','Paying member\'s broker'),(14,'mailPreferences.messages','Messages'),(15,'smsMailing.new','Send a new SMS mailing'),(16,'reports.stats.taxes.medianPerMember','Amount per member'),(17,'receiptPrinter.error.printerNotFoundError','Printer not found: {0}.\n\nMake sure you have a generic text printer configured with that name.'),(18,'message.actionPerformed.MOVE_TO_TRASH','The messages were moved to trash'),(19,'customField.member.loanSearchAccess','Loan search for'),(20,'help.title.members','Members'),(21,'menu.admin.messages.messages','Messages'),(22,'sms.type.REQUEST_PAYMENT','Request payment'),(23,'reports.stats.general.payments','payments'),(24,'sms.type.PAYMENT_ERROR','Direct payment error'),(25,'settings.message.pendingPaymentAuthorized','Pending payment authorization'),(26,'permission.systemPayments.authorize','Authorize'),(27,'global.select.empty','Please select...'),(28,'menu.admin.personal.changePassword','Change Password'),(29,'loan.repayment.totalAmount','Total'),(30,'conversionSimulation.rates','Rates'),(31,'settings.unlimited','0 unlimited'),(32,'loan.expirationDailyInterestRepaymentType','Expiry interest repayment type'),(33,'currency.title.list','Currencies'),(34,'alert.system.NEGATIVE_VIRTUAL_RATED_BALANCE','A negative virtual rated balance has been encountered on a system account.'),(35,'pendingMember.search.date','Date'),(36,'settings.message.invoiceReceived','Invoice received'),(37,'menu.admin.contentManagement.styleImages','Style Sheet Images'),(38,'paymentObligationLog.date','Date'),(39,'customImage.system.incomplete','External payment: incomplete'),(40,'reports.members_reports.incoming','Incoming'),(41,'global.timePeriod.MINUTES','Minute(s)'),(42,'alert.member.cardSecurityCodeBlockedByTries','Card security code has been blocked for exceeding {0} tries, for card {1}'),(43,'serviceClient.password','HTTP password'),(44,'accountType.modified','The account type was modified'),(45,'settings.message.remark','Remark'),(46,'alert.member.NEW_PENDING','Pending'),(47,'externalAccountHistory.button.newPayment','New payment'),(48,'reports.stats.activity.whatToShow.DISTRIBUTION','Distribution'),(49,'payment.cancelOrDeny.transactionPassword','In order to cancel or deny this payment, you must supply your transaction password'),(50,'errorLog.title.view','Error log'),(51,'cardType.title.modify','Modify card type'),(52,'login.createMember','Register'),(53,'member.bulkActions.channelsNotChanged','No member matching the filter ({0}) was changed.'),(54,'reference.summary.last30days','Last 30 days'),(55,'theme.style.LOGIN','Login page'),(56,'customImage.title.new.style','New style sheet image'),(57,'mobile.home.logout','Logout'),(58,'settings.local.containerUrl','Global container page url'),(59,'mobile.credentials.TRANSACTION_PASSWORD','Tx Pwd'),(60,'settings.mailTranslation.title','Mail translation'),(61,'sms.error.type.NO_PHONE','No mobile phone set'),(62,'certification.cancel','Cancel'),(63,'externalAccount.action.new','New External Account'),(64,'settings.message.paymentObligationRejected','Payment obligation rejected'),(65,'receipt.transfer.installments','Installments:'),(66,'transactionPassword.description','You may now generate your personal transaction password.\nAfter clicking the button below, your password will be generated and displayed.\nMake sure you remember the transaction password.\nYou will only have the possiblity to view the password once.'),(67,'alert.system.APPLICATION_SHUTDOWN','Application shutdown'),(68,'disconnect.disconnected','The user has been disconnected'),(69,'settings.message.smsMessagePrefix','SMS message prefix'),(70,'paymentObligation.error.changeStatus','Can\'t change the payment obligation\'s status to: {0}'),(71,'reports.stats.error.initialAndFinalYearsRequired','Initial and final years required'),(72,'global.search.NORMAL','Simple'),(73,'menu.member.account','Account'),(74,'profile.action.invoiceAsMemberToMember','Invoice member to member'),(75,'paymentObligation.modified','The Payment obligation was modified'),(76,'global.show','Show'),(77,'alert.member.deniedInvoices','The member has denied {0} invoices'),(78,'permission.systemCustomImages','Customized images'),(79,'reports.stats.activity.whatToShow.SINGLE_PERIOD','Show one period'),(80,'memberImport.title.summary','Member import summary'),(81,'reports.stats.paymentFilters.nothingSelected','Error: No payment filter selected\n\nYou must choose at least one payment filter.'),(82,'payment.status.SCHEDULED','Scheduled'),(83,'changeGroup.error.move.hasOpenInvoices','The member cannot be moved because it has open invoices'),(84,'permission.memberGuarantees','Guarantees'),(85,'settings.local.brokeringExpiration','Brokering expiration'),(86,'paymentObligation.maxPublishDate','Published until'),(87,'reports.stats.taxes.relativeToGrossProduct','Relative to Gross Product'),(88,'serviceClient.error.empty.usernameOrPassword','Both HTTP username and password must be filled or empty'),(89,'brokering.error.memberAlreadyInBrokering','The member is already in the brokerings of this broker'),(90,'reports.stats.finances.singlePeriod.income.title','Income system account'),(91,'createOperator.action.saveAndNew','Save and insert a new operator'),(92,'reports.stats.activity.singlePeriod.numberTransactions.row2.short','all'),(93,'global.month.FEBRUARY','February'),(94,'notificationPreferences.modified','Notification preferences modified'),(95,'adInterest.removeSelected.confirm','Remove selected ad interests?'),(96,'creditLimit.title','Credit limit'),(97,'document.description','Description'),(98,'settings.message.general.title','General notifications'),(99,'account.type','Account'),(100,'invoice.denied','The invoice was denied'),(101,'permission.adminAdmins.register','Register'),(102,'payment.confirmation.header.scheduled','You are about to schedule following payment:'),(103,'posweb.client.card','Client card number'),(104,'global.weekDay.THURSDAY','Thursday'),(105,'errors.lessEquals','{0} must be less or equals than {1}'),(106,'group.inserted','The group was inserted'),(107,'brokerCommissionContract.startDate','Start date'),(108,'accountFee.groups','Groups'),(109,'settings.local.timePattern','Time format'),(110,'reports.stats.paymentFilters.maxItemsExceded','Too many payment filters selected.\nMaximum number is {0}'),(111,'ad.title.print','Advertisement search results'),(112,'permission.adminMemberPos.view','View'),(113,'accountFeeLog.status.INVOICE','Invoice'),(114,'cardType.cardSecurityCode.NOT_USED','Not used'),(115,'translationMessage.removeOne.confirm','Are you sure to remove this translation key?'),(116,'global.no.defined','No set'),(117,'member.creationDate','Registration date'),(118,'accountFee.chargeMode.VOLUME_PERCENTAGE','Positive volume percentage'),(119,'global.tooltip.preview','Preview'),(120,'group.title.modify.admin','Edit admin group settings'),(121,'reports.stats.activity.throughTime.grossProduct.col4','n All'),(122,'conversionSimulation.result.graph','Fee amount vs time'),(123,'contact.modified','The contact was modified'),(124,'reports.stats.activity.throughTime.grossProduct.col3','n with income'),(125,'reports.stats.activity.throughTime.grossProduct.col2','Gross Product All'),(126,'reports.stats.activity.throughTime.grossProduct.col1','Gross Product members with income'),(127,'loan.repayment.interest','Interest'),(128,'guarantee.myWithBuyerOnly','My guaratees with buyer only'),(129,'reports.stats.activity.histogram.grossProduct.yAxis','Number of members'),(130,'menu.member.broker.messageToMembers','Message to members'),(131,'card.manage','Manage card'),(132,'customField.loanGroup.showInSearch','Show in search'),(133,'member.search.selectGroups','Select groups'),(134,'conversionSimulation.dRate.targeted','Targeted D rate'),(135,'permission.systemExternalAccounts.view','View'),(136,'transferType.fixedDestinationMember.name','Fixed destination member full name'),(137,'transactionFee.title.broker.modify','Modify broker commission'),(138,'defaultBrokerCommission.validity.transactions','{0} transactions'),(139,'posweb.client.transactionPassword','Transaction password'),(140,'account.hideWhenNoCreditLimit','Hide when no credit limit'),(141,'changePin.error.pinsAreNotEqual','The pins are not equals'),(142,'menu.admin.bookkeeping.accounts','Manage External Accounts '),(143,'transfer.scheduling.SINGLE_FUTURE','Scheduled for future date'),(144,'reports.stats.activity.singlePeriod.grossProduct.row1.short','with income'),(145,'payment.statusGroup.CLOSED_WITH_ERRORS','Closed (partially paid)'),(146,'permission.systemReports.aRateConfigSimulation','A-Rate configuration simulation'),(147,'menu.member.account.memberInvoice','Member Invoice'),(148,'reports.stats.keydevelopments.numberOfMembers.numberOfNewMembers','Number of new members'),(149,'groupFilter.title.insert','Insert group filter'),(150,'customizedFile.type.APPLICATION_PAGE','Application pages'),(151,'home.operator.news.title','News (message board)'),(152,'permission.adminMemberRecords.modify','Modify'),(153,'infotext.aliases','Key'),(154,'accountFee.manual','Manual'),(155,'pos.actions.unblockPin','Unblock PIN'),(156,'serviceOperation.ADVERTISEMENTS','Search advertisements'),(157,'settings.log.traceLevel','Action log level'),(158,'fieldMapping.field.TYPE','Payment type'),(159,'defaultBrokerCommission.defaultCommissionAmount','Default commission amount'),(160,'session.lastLogin','Last login: {0}'),(161,'image.remove','Remove'),(162,'settings.local.chargebackDescription','Chargeback payment description'),(163,'conversionSimulation.graph','Plot in graph against time range'),(164,'smsMailing.groups','Groups'),(165,'loan.type.WITH_INTEREST','With fees'),(166,'permission.brokerLoans.view','View'),(167,'group.settings.smsAdditionalChargedPeriod','Additional SMS package expires after'),(168,'permission.operatorPayments.cancelScheduled','Cancel scheduled payment'),(169,'global.weekDay.SATURDAY','Saturday'),(170,'fieldMapping.title.new','New field mapping'),(171,'settings.message.adminPaymentFromSystemToMember','Payments from system to members'),(172,'settings.local.indexRebuildingPeriod','Rebuild search indexes every'),(173,'infoText.modified','The info text was modified'),(174,'ad.search.since','Published since last'),(175,'menu.member.account.transfersAwaitingAuthorization','To authorize'),(176,'paymentObligation.action.create','New Payment Obligation '),(177,'payment.confirmation.block','You are going to block this payment.\n\nPlease click OK to confirm'),(178,'theme.title.import','Import new theme'),(179,'payment.error.circularFees','The payment cannot be performed, as circular fees were detected.\n\nPlease, contact the administration.'),(180,'customizedFile.removeConfirmation','Stop customizing this file?'),(181,'pendingMember.updated','The pending member has been updated'),(182,'loan.confirmation.header.withAuthorization','You are about to submit the following loan to further authorization'),(183,'brokering.modified','Notes modified'),(184,'permission.operatorGuarantees.buyWithPaymentObligations','Buy with payment obligations from groups:'),(185,'settings.error.selectedSettingTypeNotInFile','Warning! The following types were not imported because they were not found in the file:\n{0}'),(186,'permission.memberGuarantees.issueCertifications','Issue certifications to'),(187,'permission.brokerMessages','Personal messages'),(188,'group.settings.groupAfterExpiration','Group after expiration'),(189,'settings.local.maxThumbnailWidth',''),(190,'guaranteeLog.status','Status'),(191,'member.operator','Operator'),(192,'posweb.client.cardSecurityCode','Security code'),(193,'loan.title.loanGroup.members','Loan group members'),(194,'memberRecordType.modified','The member record type was modified'),(195,'memberImport.status.BALANCE_LOWER_THAN_CREDIT_LIMIT','The balance is lower than the credit limit'),(196,'profile.action.changeGroup','Change permission group'),(197,'message.type.EXTERNAL_PAYMENT','Payments made via external channels'),(198,'transactionFee.fMinimal','minimal value'),(199,'reports.stats.taxes.numberOfTransactions','Transactions'),(200,'customField.groups','Enable field for groups'),(201,'adminTasks.indexes.type.Member','Members'),(202,'infotext.body','Body text'),(203,'global.timePeriod.DAYS','Day(s)'),(204,'permission.brokerCards.cancel','Cancel'),(205,'menu.member.preferences.adInterests','Ad interests'),(206,'guaranteeType.feePayers.SELLER','Seller'),(207,'permission.systemErrorLog.view','View'),(208,'transferAuthorization.error.alreadyAuthorized','You have already authorized this payment on an earlier level'),(209,'permission.adminMemberMessages.sendToGroup','Send to group'),(210,'group.settings.smsCustomContextInvalid','Invalid class for custom SMS context'),(211,'brokering.list.status','Status'),(212,'createMember.created.pending','The member has been created, but the e-mail needs to be verified in order to complete the activation'),(213,'alert.member.NEGATIVE_VIRTUAL_RATED_BALANCE','A negative virtual rated balance has been encountered.'),(214,'menu.admin.customFields.loanGroupFields','Loan Group Fields'),(215,'group.name','Name'),(216,'login.bottomText','Here the administration can put some additional text.\n(At the admin section: Translation - Application - login.bottomText)'),(217,'payment.action.block','Block'),(218,'creditLimit.modified','The credit limit was modified'),(219,'profile.modified','Profile modified'),(220,'permission.adminMemberDocuments','Documents'),(221,'permission.brokerCards.changeCardSecurityCode','Change code'),(222,'document.nature.MEMBER','Member'),(223,'changeGroup.current','Current group'),(224,'mobile.login.pin','PIN'),(225,'paymentObligation.status.PUBLISHED','Published'),(226,'authorizationLevel.adminGroups','Admin groups'),(227,'customField.validation.unique','Unique'),(228,'serviceClient.removeConfirmation','Are you sure to remove this client?'),(229,'reports.stats.activity.histogram.numberTransactions.yAxis','Number of members'),(230,'mailPreferences.systemInvoices','System invoices'),(231,'externalTransfer.status.INCOMPLETE_PENDING','Incomplete'),(232,'reports.stats.finances.ThroughTime.expenditure.title','Expenditure through time'),(233,'global.pagination.tooltip.next','Next page'),(234,'permission.adminMemberPos.changeParameters','Change parameters'),(235,'reports.stats.activity.singlePeriod.loginTimes.title','Login times per member (single period)'),(236,'member.bulkActions.changeChannels.confirmation','Are you sure to change access channels of all members matching the filters?'),(237,'group.defaultAcceptFreeMailing','Accept free mailings by default'),(238,'group.settings.passwordPolicy.NONE','No password enforcements'),(239,'member.activationDate','Activation date'),(240,'group.title.settings.advertisements','Advertisements settings'),(241,'settings.access.memberTimeout','Member session timeout'),(242,'group.settings.passwordPolicy.AVOID_OBVIOUS','Forbid obvious passwords'),(243,'settings.message.scheduledPaymentsCancelledToOther','Scheduled payments related to other member cancelled'),(244,'settings.local.maxImageHeight',''),(245,'settings.mail.smtpUseTLS','Use TLS'),(246,'guaranteeType.authorizedBy','Authorized by'),(247,'reports.stats.keydevelopments.throughTime.years.title','Developments through the time'),(248,'menu.admin.help.manual.stats','Manual statistics'),(249,'sms.type.OPERATION_CONFIRMATION.description','Operation confirmation'),(250,'payment.confirmation.header.withAuthorization','You are about to submit the following payment for further authorization:'),(251,'brokering.title.list.of','Registered members of {0}'),(252,'paymentFilter.title.modify','Modify payment filter for {0}'),(253,'adminTasks.indexes.type.all','All'),(254,'help.title.documents','Documents'),(255,'changeChannels.disableChannels','Disable channels'),(256,'group.settings.channels','Accessible channels'),(257,'channel.internalName','Internal name'),(258,'alert.member.SCHEDULED_PAYMENT_FAILED','Scheduled payment failed'),(259,'reports.stats.activity.singlePeriod.percentageNoTrade.row1','% of members not trading'),(260,'global.total','Total'),(261,'payment.calculatePayments','Calculate payments'),(262,'guarantee.expires','Expires'),(263,'brokering.title.list.my','Registered members'),(264,'defaultBrokerCommission.title','Commission settings of {0}'),(265,'authorizationLevel.authorizer.level','Level'),(266,'notificationPreferences.noPaidSmsLeft','You have no additional paid SMS messages left'),(267,'alert.search.date.begin','From date'),(268,'accountFee.amount','Amount'),(269,'permission.adminMemberAccess.changeChannelsAccess','Change channels access'),(270,'permission.adminMemberCards.cancel','Cancel'),(271,'reports.stats.activity.topten.grossProduct.col1','Gross Product'),(272,'transferType.requiresFeedback','Require transaction feedback'),(273,'reference.transactionFeedback.feedbackPeriodExpired','The feedback period has expired.'),(274,'settings.local.schedulingMinute','Scheduled tasks minute'),(275,'externalTransferProcess.error.noPaymentToConciliate','No possible payments to conciliate'),(276,'permission.adminMemberLoans.grantWithDate','Grant loan in past date'),(277,'menu.admin.accounts.authorizedPayments','Authorized payments'),(278,'settings.local.csv.stringQuote.DOUBLE_QUOTE','Double quote'),(279,'permission.systemAdCategories.file','Export / import to file'),(280,'login.error.alreadyConnected','You are already logged in'),(281,'settings.mail.title','Mail settings'),(282,'settings.local.adResultDisplay','Ad result list shows'),(283,'reports.stats.keydevelopments.throughTime.quarters.title','Developments through the time'),(284,'settings.action.IMPORT','Import'),(285,'permission.adminMemberReferences','References'),(286,'transactionFee.conditions','Conditions of applicability'),(287,'brokerCommissionContract.action.deny','Deny'),(288,'adCategory.import.confirmation','Are you sure to import the advertisement categories from the selected file?'),(289,'reports.stats.taxes.numberOfMembers','By number of members'),(290,'transactionPassword.error.pending','To access this page, you need your transaction password.\nGo to Menu: home and generate it in the uppermost window.'),(291,'admin.action.create.selectGroup','Select admin group'),(292,'profile.action.byBroker.title','Broker actions for {0}'),(293,'accountFeeLog.status.OPEN_INVOICE','Open invoice'),(294,'loanPayment.expirationDate','Expiry'),(295,'receipt.transfer.installment','{0}  {1}  {2}'),(296,'permission.adminMemberAccess.changePin','Change pin'),(297,'multiDropDown.noItemsMessage','No items selected'),(298,'customImage.system.edit','Edit icon'),(299,'reports.stats.activity.singlePeriod.numberTransactions.yAxis','n Transactions'),(300,'menu.member.account.simulateConversion','Simulate conversion'),(301,'brokerCommissionContract.removeConfirmation','Remove this broker commission contract?'),(302,'permission.memberMessages','Messages'),(303,'changePin.modified','The pin was modified'),(304,'permission.adminAdminAccess.disconnect','Disconnect'),(305,'message.messageBox.INBOX','Inbox'),(306,'member.brokerUsername','Broker login'),(307,'permission.memberPayments.cancelAuthorized','Cancel payment pending authorization'),(308,'alert.system.ACCOUNT_FEE_FINISHED_WITH_ERRORS','Account fee finished with errors'),(309,'changeBroker.title','Change broker for {0}'),(310,'alert.system.ADMIN_LOGIN_BLOCKED_BY_PERMISSION_DENIEDS','Admin login temporarily blocked by permission denied'),(311,'adminTasks.onlineState.confirmOffline','Setting the system offline will disconnect all logged users (except you) and prevent any user from logging in, except administrators with permission to set the system online again.\n\nAre you sure to set the system offline?'),(312,'permission.systemGuaranteeTypes.view','View'),(313,'group.nature','Type'),(314,'receiptPrinter.error.applet','The receipt printer applet could not be initialized.\n\nMake sure you have the Java plugin installed and the jZebra applet has been properly authorized to run.'),(315,'paymentObligationLog.by','Changed by'),(316,'accountType.currency','Currency'),(317,'menu.admin.accounts.scheduledPayments','Scheduled payments'),(318,'menu.operator.account.simulateConversion','Simulate conversion'),(319,'remark.writer','Changed by'),(320,'customField.size.LARGE','Large'),(321,'paymentFilter.removed','The payment filter was removed'),(322,'adInterest.title.modify','Modify ad interest'),(323,'loanPayment.summary.recoveredPayments','Recovered payments'),(324,'invoice.to','To'),(325,'guarantee.description','Description'),(326,'guaranteeType.authorizedBy.NONE','None'),(327,'payment.authorize.transactionPassword','In order to authorize or deny this payment, you must supply your transaction password'),(328,'payment.confirmation.other','You are going to pay {0} to {2}.{3}\n\nPlease, click OK to confirm.'),(329,'menu.member.home','Home'),(330,'permission.systemSettings.manageAccess','Manage access settings'),(331,'accountType.error.removing','The account cannot be removed because it have at least one transaction or invoice'),(332,'customField.ad.visibility.MEMBER','All users'),(333,'permission.brokerMemberAccess.unblockPin','Unblock pin'),(334,'webshop.error.paymentDisabled','Webshop payments are not enabled for this user'),(335,'permission.adminMemberRecords.create','Create'),(336,'alert.member.pinBlockedByTries','Pin has been blocked for exceeding {0} tries, on channel {1} at member {2}'),(337,'home.admin.status.connectedMembers','Number of connected members'),(338,'adminTasks.onlineState.setOffline','Set system offline'),(339,'customImage.system.permissions_gray','Permissions disabled icon'),(340,'document.nature.STATIC','Static'),(341,'settings.error.noFile','Please, select a file to import the settings'),(342,'externalTransferImport.imported','The transaction file was imported'),(343,'reports.stats.keydevelopments.numberOfTransactions.title','Developments in number of transactions'),(344,'alert.system.adminLoginBlockedByTries','The admin \'{0}\' login is temporarily blocked by exceeding maximum amount of tries. The remote IP address is {2}'),(345,'reports.stats.keydevelopments.numberOfMembers.numberOfMembers.short','All'),(346,'group.description','Description'),(347,'transactionFee.amount','Amount'),(348,'pos.status.UNASSIGNED','Unassigned'),(349,'group.settings.defaultAdPublicationTime.number','Default ad publication time (amount)'),(350,'permission.operatorReports.viewMember','View my reports'),(351,'invoice.acceptConfirmationMessage','Accept incoming invoice from {0} of {1}?{2}\n\nPlease click OK to confirm.'),(352,'reports.stats.activity.throughTime.nTraders','n Traders'),(353,'profile.pendingEmail.resent','The verification e-mail has been sent to {0}'),(354,'settings.local.changeConfirmationMessage','Changing language will replace the translations file.\nAny customized messages will be lost.\nDo you want to continue?'),(355,'payment.canceled','The payment was canceled'),(356,'paymentObligation.currency','Currency'),(357,'customField.validation.minLength','Min. length'),(358,'menu.member.account.requestPayment','External payment request'),(359,'certification.status.SUSPENDED','Suspended'),(360,'document.action.new.dynamic','New dynamic document'),(361,'guarantee.guaranteeType','Guarantee type'),(362,'settings.message.newPendingPaymentByPayer','New payment for payer to authorize'),(363,'loanPayment.title.print','Loan payments result'),(364,'guaranteeType.description','Description'),(365,'fieldMapping.action.new','Insert new field mapping'),(366,'permission.memberPayments.blockScheduled','Block scheduled payment'),(367,'reports.stats.keydevelopments.throughTime.years.xAxis','Years'),(368,'settings.log.accountFeeLevel','Account fee log level'),(369,'receipt.posweb.transactions.scheduledPayments','Scheduled payments'),(370,'settings.mail.accountDetails','Account details'),(371,'reports.current.remaining_open_loans','Remaining amount of open loans'),(372,'errorLog.loggedUser.none','No logged user'),(373,'pos.blockPos.confirmation','Block the POS?'),(374,'externalTransferImport.removed','The transaction import was removed'),(375,'reports.simulations.dRateConfigSimulation.endD','End at D ='),(376,'permission.memberProfile.changeEmail','Change own e-mail'),(377,'menu.admin.settings.mail','Mail Settings'),(378,'global.month.MARCH','March'),(379,'loan.title.printDetails','Loan details'),(380,'reference.title.paymentsAwaitingFeedback','Payments awaiting feedback'),(381,'memberImport.invalidFormat','Invalid file format'),(382,'settings.local.language.PORTUGUESE_BRAZIL','Portuguese (Brazil)'),(383,'permission.memberInvoices.sendToSystem','Send to system'),(384,'paymentObligation.error.certificationActiveNotExists','Can not create payment obligations. There is no active certification to the currency {0}.  '),(385,'accountType.change','Change account'),(386,'menu.operator.home','Home'),(387,'profile.action.viewAds','View advertisements'),(388,'translationMessage.title.search','Search translation key'),(389,'customImage.system.captchaBackground','Register password background image'),(390,'reference.title.summary.transactionFeedbacks.of','Summary {0}\'s transaction feedbacks'),(391,'guarantee.error.noIssuer','There is no possible issuer for this guarantee type'),(392,'card.internalKey','Key'),(393,'errors.periodBeginRequired','Begin date of {0} is required'),(394,'changeChannels.invalidChannelsSelection','Please check your channels selection. There is a chennel selected to be enable and disable at the same time: {0}.'),(395,'menu.member.guarantees.searchPaymentObligations','Payment Obligations'),(396,'settings.local.language.GREEK','Greek'),(397,'pos.actions','Actions'),(398,'cardType.cardSecurityCode','Card security code'),(399,'adCategory.error.removing','This category could not be removed.\\nProbably, there are advertisements that belongs to it.'),(400,'customField.member.access.NONE','None'),(401,'global.timePeriod.MILLIS','Millisecond(s)'),(402,'paymentFilter.modified','The payment filter was modified'),(403,'permission.operatorInvoices.view','View'),(404,'receipt.transfer.textBefore','----------------'),(405,'accountFee.inserted','The account fee was inserted'),(406,'groupFilter.title.list','Group filters'),(407,'error.session.timeout','Please login again to continue.'),(408,'ticket.fromChannel','Channel'),(409,'ad.search.tradeType.OFFER','Offers'),(410,'memberRecord.inserted','The member record was inserted'),(411,'memberPos.status','Status'),(412,'transactionFee.originalTransferType','Original transaction type'),(413,'reports.stats.keydevelopments.throughTime.quarters.xAxis','Quarters'),(414,'brokerCommissionContract.error.removing','The broker commission contract cannot be removed because it already has commissions paid'),(415,'fileMapping.numberFormat','Number format'),(416,'messageCategory.removeConfirmation','Remove the Message Category?'),(417,'group.account.removed','The group account was removed'),(418,'guarantee.title.searchGuarantees','Search guarantees'),(419,'account.initialCreditTransferType','Initial credit transaction type'),(420,'reports.stats.mockwarning','BEWARE: this is mock data. Real statistics will be provided in the next update.'),(421,'permission.systemThemes.remove','Remove'),(422,'help.title.passwords','Passwords'),(423,'loan.payments','Payments'),(424,'paymentRequest.error.noChannels','There is no channels to send a request payment.'),(425,'menu.member.search.members','Members'),(426,'permission.systemStatus.view','View system status'),(427,'group.settings.passwordPolicy','Password policy'),(428,'changePassword.passwordLengthRange','Choose a password with a length between {0} and {1} characters'),(429,'transactionFee.fromAllGroups','From all groups'),(430,'ad.view.lastAds','latest ads'),(431,'channel.modified','The channel was modified'),(432,'permission.operatorPayments.request','Request payments from other channels'),(433,'payment.error.manageFrom','The logged user doesn\'t have permissions to manage the member \'{0}\'.'),(434,'permission.memberPayments.authorize','Authorize payment'),(435,'settings.access.usernameGeneration','Login name generation'),(436,'payment.authorizeOnly.transactionPassword','In order to authorize this payment, you must enter your transaction password'),(437,'loan.status.EXPIRED','Expired'),(438,'message.title.view','Message details'),(439,'changeBroker.noBroker','None'),(440,'transferType.channels','Channels'),(441,'ad.search.price','Price range'),(442,'message.trashPurgeNotification','Messages left on trash after {0} {1} will be removed'),(443,'global.search.all.male','All'),(444,'reports.stats.finances.singlePeriod.expenditure.title','Expenditure system account'),(445,'reports.stats.paymentfilters','Payment filters'),(446,'posweb.bannerText','POS web'),(447,'permission.adminAdmins.view','View'),(448,'reports.members_reports.incoming_transactions','Credit transactions'),(449,'reports.simulations.aRateConfigSimulation.startA','Start from A ='),(450,'translationMessage.title.modify','Modify translation key'),(451,'fieldMapping.field.AMOUNT','Payment amount'),(452,'group.containerUrl','Container page url'),(453,'externalAccount.title.insert','Insert external account'),(454,'error.systemOffline','The system is currently offline'),(455,'fileMapping.decimalPlaces.error.required','Decimal places is required'),(456,'createAdmin.action.saveAndOpenProfile','Save and open profile'),(457,'currency.modified','The currency was modified'),(458,'customField.member.adSearchAccess','Advertisement search for'),(459,'payment.title.memberToSystem','Payment to system'),(460,'group.settings.emailValidation.BROKER','Broker'),(461,'guarantee.action.accept','Authorize'),(462,'menu.member.broker.listMembers','Members'),(463,'reports.simulations.aRate.config.graph','Fee percentage vs A-rate'),(464,'errorLog.search.noResults','No errors found'),(465,'member.bulkActions.changeChannels','Enable/disable channels '),(466,'settings.local.showCountersInAdCategories','Show counters in advertisement categories'),(467,'paymentRequest.sent','The payment request has been sent to {0}'),(468,'reports.simulations.aRateConfigSimulation.title','A-rate Configuration Simulation'),(469,'contact.removeConfirmation','Remove contact?'),(470,'conversionSimulation.dRate','D rate'),(471,'paymentObligation.removed','The payment obligation was removed.'),(472,'reports.current.references','References'),(473,'fileMapping.dateFormat','Date format'),(474,'guarantee.status.PENDING_ISSUER','Pending Issuer'),(475,'settings.message.transactionFeedbackAdminComments','Transaction feedback administration comments'),(476,'transfersAwaitingAuthorization.title','Transfers to authorize'),(477,'permission.operatorReferences.manageMemberReferences','Manage my references'),(478,'group.settings.initialGroupForRegisteredMembers','Initial group for registered members'),(479,'paymentObligation.selectPaymentObligations','Select payment obligations'),(480,'reports.members.ads','Ads'),(481,'payment.status.CANCELED','Canceled'),(482,'reports.current.system_account','System accounts'),(483,'accountFeeLog.date','Execution date'),(484,'login.action.loginAsOperator','Login as operator'),(485,'reports.members.ads.expired_ads','Expired ads'),(486,'card.activated','Card activated'),(487,'customizedFile.type','Type'),(488,'pos.posId','Identifier'),(489,'reports.current.n_adsaccount','Number of active members with active advertisements'),(490,'help.title.member_records','Member records'),(491,'message.action.MOVE_TO_TRASH','Move to trash'),(492,'activities.title.of','Reports of {0}'),(493,'mobile.login.title','Cyclos Login'),(494,'errors.invalid','{0} is invalid'),(495,'profile.action.sendInvoice','Send invoice'),(496,'certification.guarantees','Guarantees'),(497,'invoice.search.direction','Type'),(498,'smsLog.title.search','Search SMS messages logs to {0}'),(499,'permission.adminMemberTransactionFeedbacks.view','View'),(500,'memberRecordType.title.insert','New member record type'),(501,'reports.stats.activity.comparePeriods.loginTimes','Logins per member'),(502,'permission.systemPayments.cancel','Cancel'),(503,'reports.stats.transferTypeFilters','Transfer type filters'),(504,'settings.access.usernameGeneration.RANDOM','Generated random number'),(505,'activities.title.my','My reports'),(506,'settings.log.traceWritesOnly','Generate log only if data was changed'),(507,'reports.stats.finances.keyParams','Key parameters for finance statistics'),(508,'permission.adminMemberMessages','Messages'),(509,'multiDropDown.singleItemMessage','1 item selected'),(510,'transactionFee.fromFixedMember.username','Will be charged login name'),(511,'about.message','Information about the Cyclos project can be found at: <a href=\"{0}\"><u>{0}</u></a>'),(512,'externalTransferImport.error.importing.invalidMemberId','Invalid member identifier: {0}'),(513,'activities.brokering.commission.count','Commissioned transactions'),(514,'notificationPreferences.my.title.name','Notification preferences'),(515,'global.searchResults','Search results'),(516,'sms.type.REQUEST_PAYMENT_ERROR','Request payment error'),(517,'payment.error.upperCreditLimit','The payment cannot be performed. For more details please contact the administrator.'),(518,'group.title.new','Insert new group'),(519,'accountHistory.credits.count','Transactions received'),(520,'createMember.initialGroup.preface.public','Please, choose the group you want to participate'),(521,'customField.member.access.MEMBER','Member'),(522,'reports.stats.keydevelopments.numberOfAds.yAxis','Number'),(523,'registrationAgreement.name','Name'),(524,'reports.members.permission_groups','Permission groups'),(525,'customField.size.TINY','Tiny'),(526,'global.pixels','pixels'),(527,'transactionPassword.blocked','The transaction password is now blocked'),(528,'alert.member.DENIED_INVOICES','Member denied too many invoices'),(529,'permission.memberPayments.ticket','Generate external payment tickets'),(530,'loan.title.confirm','Loan confirmation'),(531,'permission.systemTranslation.manage','Manage'),(532,'guarantee.sellerUsername','Seller login'),(533,'payment.firstPaymentDate','First payment at'),(534,'group.account.error.minInitialCredit','The initial credit amount \'{0}\' must be greater o equal to the minimum amount configured in the transfer type: \'{1}\''),(535,'scheduledPayment.title.transfers','Scheduled payment transfers'),(536,'ad.title.insert','New advertisement'),(537,'brokerCommission.type.defaultCommission','Default commission'),(538,'permission.memberReports.view','View'),(539,'accountFee.chargeMode','Charge mode'),(540,'pos.updated','The POS was updated'),(541,'transactionFee.toFixedMember.username','Will receive login name'),(542,'adminTasks.indexes.type.Ad','Advertisements'),(543,'theme.action.select','Apply'),(544,'transfer.processDate','Processed at'),(545,'adCategory.error.cantActivateCategoryWithInactiveParent','A category cannot be activated if it\'s parent category is inactive'),(546,'customField.modified','The custom field was modified'),(547,'adInterest.priceRange','Price range'),(548,'permission.memberAccess','Access'),(549,'adImport.adsWithErrors','Advertisements with errors'),(550,'permission.brokerPreferences.manageNotifications','Manage notifications'),(551,'brokerCommissionContract.status.ACTIVE','Active'),(552,'group.settings.pinBlockTimeAfterMaxTries.number','Pin block time after max tries'),(553,'profile.pendingEmail.link','Resend verification e-mail'),(554,'createMember.assignBroker','Assign broker'),(555,'customField.ad.searchVisibility.NONE','None'),(556,'brokering.loans.count','Open loans'),(557,'mobile.payment.error.maxAmountPerDay','You have already reached the maximum amount today'),(558,'pendingMember.emailResent','The validation e-mail has been resent'),(559,'reports.stats.activity.comparePeriods.percentageNoTrade.row1','% of members not trading'),(560,'transferType.fixedDestinationMember.username','Fixed destination member login name'),(561,'guaranteeType.model','Model'),(562,'ad.search.keywords','Keywords'),(563,'permission.memberPreferences','Preferences'),(564,'ad.error.maxAds','Member {0} has exceeded the maximum allowed advertisements'),(565,'externalAccountHistory.period.end','To date'),(566,'brokerCommissionContract.error.notPendingStatus','It\'s just possible to save pending contracts'),(567,'permission.brokerMemberRecords.delete','Delete'),(568,'transferType.transactionHierarchyVisibility','Show parent / child transactions'),(569,'menu.admin.guarantees.searchCertifications','Certifications'),(570,'settings.message.adExpiration','Ad expiry'),(571,'memberImport.status.INVALID_CREDIT_LIMIT','Invalid credit limit: {0}'),(572,'groupFilter.rootUrl','Application root URL'),(573,'customField.ad.visibility.ADMIN','Administrators only'),(574,'card.action.activate','Activate'),(575,'fieldMapping.field','Field'),(576,'message.search.noResults','You have no messages for the given filters'),(577,'loan.repayment.manualDate','Repayment date'),(578,'cardType.removeConfirmation','Remove this card type?'),(579,'accountHistory.debits.amount','Sum of paid'),(580,'groupFilter.customizedFiles.title','Customized files'),(581,'memberImport.status.SUCCESS','Success'),(582,'reports.members_reports.total_amount','Total amount'),(583,'memberRecordType.removed','The member record type was removed'),(584,'permission.brokerAds.view','View'),(585,'permission.adminMembers.changeUsername','Change login name'),(586,'translationMessage.import.error.reading','Error while reading the properties file'),(587,'login.transactionPassword','Transaction password'),(588,'reports.simulations.aRate.config.combinedGraph.title','A-rate configuration curve'),(589,'menu.member.operators','Operators'),(590,'alert.system.applicationRestarted','Application started'),(591,'guarantee.editGuaranteeType','Edit guarantee type'),(592,'card.status.EXPIRED','Expired'),(593,'menu.member.personal.contacts','Contacts'),(594,'customImage.system.next','Next page icon'),(595,'customField.size.FULL','Full'),(596,'login.systemOffline','The system is currently offline.\nPlease, try again later.\nSorry for the inconvenience.'),(597,'reports.stats.keydevelopments.numberOfMembers','Number of members'),(598,'manual.action.printSection','Print current section'),(599,'invoice.search.direction.OUTGOING','Outgoing'),(600,'group.settings.passwordLength','Password length'),(601,'guarantee.amount','Amount'),(602,'loanGroup.title.view','Loan group details'),(603,'loan.repayment.error.upperCreditLimit','The loan cannot be repaid because it would make the receiving system account to have a balance beyond it\'s upper credit limit'),(604,'permission.systemExternalAccounts.managePayment','Manage payment'),(605,'ad.publicationPeriod.end','Expiry date'),(606,'memberImport.membersWithErrors','Members with errors'),(607,'changePassword.error.sameAsTransactionPasswordOrPin','The password can\'t be the same as transaction password or PIN'),(608,'messageCategory.removed','The message category was removed'),(609,'mobile.error.invalidUser','Invalid user for mobile service'),(610,'certification.error.changeStatus','Can\'t change the certification\'s status to: {0}'),(611,'reports.members_reports.system_invoices','System invoices'),(612,'memberImport.status.INVALID_CUSTOM_FIELD_VALUE_MAX_LENGTH','{0} is invalid: the maximum length is {1}.'),(613,'mobile.welcomeMessage','Please change the following translation key (At the admin section: Translation - Application): mobile.welcomeMessage'),(614,'settings.local.memberSortOrder.CHRONOLOGICAL','Chronological (on creation date)'),(615,'global.tooltip.exportCSV','Export to CSV'),(616,'ad.price','Price'),(617,'certification.inserted','The Certification was created'),(618,'settings.local.language.DUTCH','Dutch'),(619,'externalTransfer.status.PROCESSED','Processed'),(620,'alert.system.accountFeeFinished','Account fee {0} has finished'),(621,'settings.log.scheduledTaskLevel','Scheduled task log level'),(622,'smsMailing.search.noResults','There are no SMS mailings'),(623,'createMember.error.usernameAlreadyInUse','The given login name ({0}) is already in use'),(624,'loanPayment.summary.inProcessPayments','In process payments'),(625,'externalTransfer.status','Status'),(626,'reports.stats.activity.singlePeriod.numberTransactions.row1.short','traders'),(627,'translationMessage.imported','The properties file was imported'),(628,'memberRecord.action.new','Create new {0}'),(629,'loan.status.CLOSED','Closed'),(630,'reports.stats.activity.topten.numberTransactions','Number of transactions'),(631,'menu.member.personal.ads','Advertisements'),(632,'brokerCommissionContract.status.EXPIRED','Expired'),(633,'customField.allSelectedLabel','All selected label'),(634,'memberRecord.modified','The member record was modified'),(635,'settings.log.title','Log settings'),(636,'alert.system.NULL_IRATE','Unexpected null I-rate encountered'),(637,'permission.systemPayments.blockScheduled','Block scheduled payment'),(638,'paymentObligation.title.view','View payment obligation'),(639,'permission.module.type.MEMBER','Member permissions of {0}'),(640,'invoice.destination','Destination'),(641,'alert.system.ACCOUNT_FEE_FINISHED','Account fee finished'),(642,'member.bulkActions.changeBroker','Change broker'),(643,'alert.member.nullIRate','I-rate had unexpected null for account {1}. You may want to reinitialize the i-rate. '),(644,'menu.admin.cards','Cards'),(645,'memberImport.status.MISSING_CUSTOM_FIELD','{0} is missing'),(646,'menu.admin.alerts.member','Member Alerts'),(647,'menu.member.account.memberPayment','Member Payment'),(648,'changeGroup.error.remove.hasOpenInvoices','The member cannot be removed because it has open invoices'),(649,'group.settings.externalAdPublication.ENABLED','Enabled'),(650,'group.title.settings.brokering','Brokering settings'),(651,'permission.brokerSmsMailings.freeSmsMailings','Send free SMS mailings'),(652,'global.weekDay.WEDNESDAY','Wednesday'),(653,'transactionFee.aRateRelation','Relation between fee and A rate'),(654,'externalTransfer.member','Member'),(655,'customField.action.changeOrder','Change field order'),(656,'invite.message','Enter an e-mail address; this person receives an invitation to try out the software'),(657,'home.admin.status.connectedBrokers','Number of connected brokers'),(658,'group.active','Activate group'),(659,'smsLog.count','Sent SMSs'),(660,'accountFeeLog.acceptedInvoices','Accepted invoices'),(661,'smsLog.status','Status'),(662,'pos.pinUnblocked','The PIN was unblocked'),(663,'settings.type.LOG','Log settings'),(664,'errors.greaterThan','{0} must be greater than {1}'),(665,'mobile.payment.description','Description'),(666,'receiptPrinterSettings.beginOfDocCommand','Begin of document command'),(667,'brokering.memberAdded','The member was added'),(668,'permission.brokerMemberPayments.cancelAuthorizedAsMember','Cancel authorized payment as member'),(669,'loanGroup.action.create','Create loan group'),(670,'permission.adminMemberReports.showAccountInformation','Show account information'),(671,'reports.current.invoices.MEMBER.amount','Total sum of member invoices'),(672,'message.sendTo','Send to'),(673,'transactionFee.toFixedMember.name','Will receive full name'),(674,'alert.system.ACCOUNT_FEE_CANCELLED','Account fee cancelled'),(675,'group.settings.transactionPassword','Transaction password'),(676,'customImage.system.mobileLogo','Mobile logo'),(677,'profile.action.mail','Send e-mail'),(678,'login.password','Password'),(679,'permission.systemAccounts.authorizedInformation','View authorized payments'),(680,'adInterest.title.list','List of ad interests'),(681,'permission.adminMembers.remove','Permanently remove'),(682,'cardType.securityCodeBlockTime','Card security code block time'),(683,'loan.expirationFee','Expiry fee'),(684,'settings.local.maxChargebackTime','Max. time to chargeback'),(685,'loan.amount','Amount'),(686,'loan.repayment.paymentNumber','Payment number'),(687,'global.tooltip.view','View'),(688,'reports.current.presentation.result.at','State reports: Results on'),(689,'profile.action.paymentAsMemberToSystem','Payment member to system'),(690,'document.inserted','The document was inserted'),(691,'group.registrationAgreement','Registration agreement'),(692,'member.username','Account ID'),(693,'paymentObligation.expiration','Expiration'),(694,'paymentRequest.title.search','Search payment requests'),(695,'certification.login','Login'),(696,'card.status.PENDING','Pending'),(697,'channel.credentials.TRANSACTION_PASSWORD','Transaction password'),(698,'infoText.removeConfirmation','Remove this infotext?'),(699,'permission.memberAds.view','View'),(700,'pendingMember.title.search','Pending members'),(701,'reference.title.summary.references.of','Summary {0}\'s references'),(702,'accountType.title.list','Accounts'),(703,'accountFee.name','Name'),(704,'accountFee.invoiceMode','Send invoice'),(705,'reports.stats.activity.throughTime.grossProduct','Gross Product per member'),(706,'translationMessage.action.export','Export as properties file'),(707,'mobile.payment.transactionPassword','Trans. Pwd.'),(708,'fileMapping.nature.CUSTOM','Custom'),(709,'guaranteeType.feeType.FIXED','Fixed'),(710,'guaranteeType.authorizedBy.BOTH','Issuer and Administrator'),(711,'accountFeeLog.failedMembers','Errors'),(712,'fieldMapping.action.changeOrder','Change field mappings order'),(713,'currency.dRate.baseMalus','Base malus'),(714,'settings.mail.smtpServer','Hostname'),(715,'reports.simulations.aRate.config.combinedGraph.xAxis','A-rate relative to guarantee period'),(716,'pos.new','Insert new POS'),(717,'fileMapping.modified','File mapping modified'),(718,'transferType.title.modify','Modify transaction type'),(719,'transferType.defaultFeedbackLevel','Feedback level on expiration'),(720,'customField.size.SMALL','Small'),(721,'home.status.openInvoices','You have {0} open invoices'),(722,'posweb.error.notEnoughCredits','The payment couldn\'t be performed'),(723,'payment.confirmation.doExternal','Please, check the data above and click confirm to make the payment'),(724,'group.nature.OPERATOR','Operator'),(725,'paymentFilter.allPaymentFilters','All payment filters'),(726,'transferAuthorization.action.CANCEL','Canceled'),(727,'alert.member.accountActivationFailed','Activation of account {0} has failed'),(728,'group.settings.maxAdsPerMember','Max ads per member'),(729,'reports.stats.paymentFilters.noOverlap','Error: Overlapping payment filters\n\nPlease choose another set of payment filters.\n\nFor details see the help of the filter box.'),(730,'memberImport.status.INVALID_EMAIL','Invalid e-mail: {0}'),(731,'payment.error.maxAmountOnDayExceeded.at','You have already exceeded the maximum amount for transaction {0} at {1}.'),(732,'invoice.title.send.system','Send invoice to system'),(733,'profile.action.manageAds','Manage advertisements'),(734,'settings.local.numberLocale.COMMA_AS_DECIMAL','1.234,56'),(735,'permission.operatorPayments.cancelAuthorized','Cancel payment authorization'),(736,'settings.local.sms.customField','Custom field representing the mobile phone'),(737,'loan.discarded','The discarding was succesfully processed'),(738,'loan.status.OPEN','Open'),(739,'payment.title.brokerMemberToMember','Payment between members'),(740,'memberRecordType.name','Name'),(741,'remark.title','Remarks of {0}'),(742,'permission.brokerPreferences','Preferences'),(743,'brokerCommissionContract.status.SUSPENDED','Suspended'),(744,'permission.systemInfoTexts.manage','Manage'),(745,'reference.transactionFeedback.replyComments.saved','The transaction feedback reply was saved'),(746,'accountFee.description','Description'),(747,'adImport.status.INVALID_PUBLICATION_END','Invalid publication end date: {0}'),(748,'permission.adminMemberTransactionFeedbacks.manage','Manage'),(749,'changePin.pinLength','Choose a pin with {0} characters'),(750,'accountType.nature.SYSTEM','System'),(751,'notificationPreferences.freeSmsUsed','You have used {0} of {1} free SMS messages this month'),(752,'menu.admin.accessDevices.cards.search','Search cards'),(753,'currency.enableDRate','Enable D-rate'),(754,'reports.stats.activity.histogram.grossProduct.title','Gross Product per member, Histogram'),(755,'loan.grant.firstExpirationDate','First expiry date'),(756,'alert.system.newVersionOfStaticFile','There is a new version of a customized static file, {0}.\nPlease, check the customization in order to resolve possible conflicts'),(757,'permission.systemChannels.view','View'),(758,'certification.expires','Expires'),(759,'reports.stats.general.notUsed','not used'),(760,'authorizationLevel.adminGroups.none','None'),(761,'account.status','Status'),(762,'notificationPreferences.title.name','Notification preferences of {0}'),(763,'accountFeeLog.status','Status'),(764,'accountHistory.title.print','Transactions on {0}'),(765,'invoice.status.CANCELLED','Cancelled'),(766,'login.error','Invalid login. Please try again'),(767,'loan.paymentCount','Number of repayments'),(768,'permission.systemInfoTexts.view','View'),(769,'notificationPreferences.acceptFreeMailing','Accept free SMS mailings'),(770,'settings.message.newPendingPaymentByBroker','New payment for broker to authorize'),(771,'permission.adminMemberLoans.grant','Grant loan'),(772,'group.registrationAgreement.explanation','In order to proceed and use the software, you must accept the following registration agreement first:'),(773,'permission.systemGroups.manageBroker','Manage broker group'),(774,'brokering.title.addMember','Add member'),(775,'settings.local.limits','Limits'),(776,'alert.member.INITIAL_CREDIT_FAILED','Initial credit transaction failed'),(777,'changeGroup.old','Old group'),(778,'document.nature.DYNAMIC','Dynamic'),(779,'permission.adminMemberPos.unblockPin','Unblock PIN'),(780,'permission.memberLoans','Loans'),(781,'transfer.title.children','Generated transaction details'),(782,'certification.issuerName','Issuer name'),(783,'adImport.status.INVALID_PUBLICATION_START','Invalid publication start date: {0}'),(784,'reports.stats.general.p','p-value'),(785,'adImport.status.MAX_PUBLICATION_EXCEEDED','Max publication period exceeded'),(786,'scheduledPayment.title.details','Scheduled payment details'),(787,'memberRecord.title.flat','{0} for {1}'),(788,'fieldMapping.inserted','Field mapping inserted'),(789,'reports.members_reports.outgoing_transactions','Debit transactions'),(790,'global.quarter.SECOND','Second quarter'),(791,'certification.unlock','Unlock'),(792,'permission.brokerMemberSms','SMS logs'),(793,'permission.brokerAds.manage','Manage'),(794,'permission.systemAdCategories','Ad categories'),(795,'settings.message.scheduledPaymentFailedToPayer','Scheduled payment failed (to payer)'),(796,'cardType.showCardSecurityCode','Display the card security code'),(797,'reference.title.new.transactionFeedback','Set transaction feedback'),(798,'settings.message.scheduledPaymentFailedToPayee','Scheduled payment from invoice failed (to payee)'),(799,'permission.basic.login','Login'),(800,'changePassword.error.userBlocked','Your login has been temporarily blocked'),(801,'reports.current.invoices.SYSTEM_OUTGOING.amount','Sum of outgoing system invoices'),(802,'transactionPassword.error.blocked','Your transaction password is blocked.\nPlease, contact the administration.'),(803,'reports.stats.activity.comparePeriods.grossProduct','Gross Product per member'),(804,'permission.adminMemberPreferences','Preferences'),(805,'permission.memberPayments.request','Request payments from other channels'),(806,'externalAccountHistory.search.noResults','You have no transfers for the given filters'),(807,'guaranteeType.currency','Currency'),(808,'guarantee.amountToCharge','To charge'),(809,'reports.stats.keydevelopments.throughTime.quarters','Through quarters'),(810,'certification.modified','The Certification was modified'),(811,'loan.type.SINGLE_PAYMENT','Single payment'),(812,'paymentObligation.expire','Expired'),(813,'settings.message.removedFromBrokerGroup','Removed from broker group'),(814,'home.admin.jumpToProfile.title','Jump to member profile'),(815,'fieldMapping.field.IGNORED','Ignored'),(816,'pos.assigned','POS assigned to member {0}'),(817,'help.title.translation','Translation'),(818,'brokerCommissionContract.status','Status'),(819,'payment.error.noTransferType','There is no possible type for this payment.\nPlease, contact the administration.'),(820,'settings.local.transactionNumber','Transaction number'),(821,'permission.memberInvoices.view','View'),(822,'smsMailing.variables','Variables'),(823,'menu.member.search','Search'),(824,'permission.systemAccounts','Accounts'),(825,'conversionSimulation.aRate.present','Present A rate'),(826,'mobile.viewPayments.transactionNumber','Tx. Nr.'),(827,'permission.systemCustomImages.manage','Manage'),(828,'menu.member.operators.customFields','Custom fields'),(829,'loan.title.search.group','Loans of group {0}'),(830,'account.lowUnitsMessage','Low units message'),(831,'group.modified','The group was modified'),(832,'alert.system.RATE_INITIALIZATION_STARTED','rate initialization job started'),(833,'customField.payment.searchAccess','Show in search'),(834,'global.month.DECEMBER','December'),(835,'mobile.viewPayments.previous','Prev.'),(836,'group.title.modify.broker','Edit broker group settings'),(837,'sms.type.INFO_TEXT_ERROR','Info text error'),(838,'groupFilter.loginPageName','Login page name'),(839,'settings.mail.modified','The mail settings were modified'),(840,'image.details.hint','Fill in the image caption'),(841,'group.nature.MEMBER','Member'),(842,'message.action.MARK_AS_UNREAD','Mark as unread'),(843,'accountType.nature','Type'),(844,'reports.stats.activity.histogram.numberTransactions.title','Number of Transactions per member, Histogram'),(845,'ad.description','Description'),(846,'brokerCommissionContract.member','Member'),(847,'reports.stats.keydevelopments.numberOfAds.active','Active ads '),(848,'permission.systemCustomizedFiles.view','View'),(849,'customImage.system.message_read','Read message icon'),(850,'permission.systemTasks.manageIndexes','Manage indexes'),(851,'createMember.public.validated','Thanks for registering!\n\nYou can now login with the login name {0}'),(852,'adInterest.groupFilter','Community'),(853,'sms.type.HELP.description','Help'),(854,'smsMailing.type.FREE','Free'),(855,'group.title.settings.externalAccess','External access settings'),(856,'ad.status','Status'),(857,'accountType.all','All'),(858,'mobile.home.creditLimit','Limit: {0}'),(859,'reports.stats.taxes.maxMember','Maximum Amount for a member'),(860,'permission.adminMemberPayments.cancelAuthorizedAsMember','Cancel authorized payment as member'),(861,'customImage.removed','The image was removed'),(862,'settings.local.language','Language'),(863,'rates.reinit.maintainLast','Maintain past settings'),(864,'changeGroup.error.remove','This user cannot be permanently removed, because he has been active on the system.\nYou should move him to a removed group'),(865,'permission.systemTranslation.manageMailTranslation','Mail translation'),(866,'reports.members.ads.scheduled_ads','Scheduled ads'),(867,'webshop.payment.cancelConfirmation','Confirm'),(868,'customField.validation','Validation'),(869,'loanGroup.loanGroup','Loan group'),(870,'profile.member.brokerLink','Open profile'),(871,'guarantee.issuer','Issuer'),(872,'permission.systemAlerts.viewSystemAlerts','View system alerts'),(873,'permission.systemTasks.onlineState','Set system availability'),(874,'createMember.title.byBroker','Brokering - Create new member'),(875,'loan.summary.remainingAmount','Total remaining amount'),(876,'reports.current.n_actvads','Number of active advertisements'),(877,'externalTransferType.action.GENERATE_SYSTEM_PAYMENT','Generate payment to system'),(878,'permission.adminMembers.changeEmail','Change e-mail'),(879,'reports.stats.keydevelopments.numberOfAds.created.short','created'),(880,'reports.stats.activity.histogram.grossProduct.xAxis','Gross Product'),(881,'sms.type.HELP_ERROR.description','Help error'),(882,'transactionFee.initialAmount','Amount greater or equals'),(883,'payment.action.payNow','Pay now'),(884,'message.sendTo.GROUP','Group(s)'),(885,'changeGroup.operator.changed','The operator\'s group was changed'),(886,'reports.stats.finances.ThroughTime.income.yAxis','Income'),(887,'notificationPreferences.sms','SMS'),(888,'loan.summary.amount','Total amount'),(889,'menu.operator.account.scheduledPayments','Scheduled payments'),(890,'permission.adminMemberAds.view','View'),(891,'group.title.search','Search permission groups'),(892,'settings.access.externalPaymentPassword.LOGIN_PASSWORD','Login'),(893,'permission.brokerRemarks.manage','Manage'),(894,'permission.systemAccounts.information','View system accounts information'),(895,'accountFeeLog.payments','Payments'),(896,'settings.log.scheduledTaskFile','Scheduled task logfile path / name'),(897,'help.title.reports','Reports'),(898,'document.modified','The document was modified'),(899,'changePassword.error.mustBeNumeric','The password can only contain numbers'),(900,'cardType.cardSecurityCodeLength.min','Card security code min size'),(901,'accountFee.removed','The account fee was removed'),(902,'reports.simulations.aRate.config.graph.yAxis','Fee'),(903,'admin.id','Id'),(904,'settings.alert.givenVeryBadRefs','Given very bad references'),(905,'permission.systemTranslation.file','Import / export to file'),(906,'message.rootType.MEMBER','Member'),(907,'document.visibility.BROKER','Broker'),(908,'menu.admin.usersGroups.groups','Permission Groups'),(909,'transferType.allowBlockScheduledPayments','Allow payer to block scheduled payments'),(910,'ad.error.maxPublicationTimeExceeded','The maximum publication time has been exceeded'),(911,'creditLimit.new','New'),(912,'scheduledPayments.searchType.INCOMING','Incoming'),(913,'alert.system.INDEX_REBUILD_END','Search index rebuilding end'),(914,'help.title.connected_users','Connected Users'),(915,'certification.title.view','View Certification'),(916,'permission.operatorInvoices.sendToSystem','Send to system'),(917,'account.initialCredit','Initial credit'),(918,'transfer.scheduling','Scheduling'),(919,'menu.admin.ads.importAds','Import advertisements'),(920,'ad.status.PERMANENT','Permanent'),(921,'sms.type.REQUEST_PAYMENT_ERROR.description','Request payment error'),(922,'accountHistory.credits.amount','Sum of received'),(923,'loanGroup.removeFromMemberConfirmation','Remove the member from this loan group?'),(924,'card.updateCard.error.invalidTransactionPassword','Incorrect transaction password'),(925,'adImport.status.INVALID_CUSTOM_FIELD','{0} is invalid: {1}'),(926,'posweb.action.makePayment','Make payment (F3)'),(927,'loan.awaitingAuthorization','The loan has been submitted for further authorization'),(928,'accountOverview.error.noAccounts','You have no accounts'),(929,'infoText.title.edit','Edit info text'),(930,'customImage.system.dropdown','Dropdown icon'),(931,'customField.title.modify.loan','Modify loan custom field'),(932,'customImage.system.edit_gray','Edit empty icon'),(933,'permission.module.type.ADMIN_SYSTEM','System administration permissions of {0}'),(934,'reports.stats.activity.singlePeriod.numberTransactions.title','Number of Transactions per member (single period)'),(935,'invoice.invalid.paymentAmount','The invoice amount must be the same as the sum of each payment\'s amount'),(936,'settings.access.error.numericPassword.groupsRequireLetters','{0} cannot be enabled because there is at least one member group which enforces letters on passwords'),(937,'changeGroup.confirmRemove','Changing a member to group {0} will remove all\nadvertisements, contacts and references of this member.\n\nAre you sure?'),(938,'serviceClient.permissions','Permissions'),(939,'serviceClient.username','HTTP username'),(940,'conversionSimulation.useActualRates','Use actual rates'),(941,'customImage.title.system','System images'),(942,'customField.memberRecord.memberRecordType','Type'),(943,'global.datePattern.hour','hh'),(944,'reports.stats.finances.income','Income'),(945,'memberRecord.title.edit','Edit {0} for {1}'),(946,'menu.admin.alerts.alertHistory','Alerts History'),(947,'card.expirationPeriod.to','To'),(948,'authorizationLevel.authorizer.BROKER','Broker / admin'),(949,'reports.stats.activity.whatToShow.THROUGH_TIME','Through the time'),(950,'menu.admin.contentManagement.helpFiles','Help Files'),(951,'pin.unblocked','The pin has been unblocked'),(952,'group.customizedFiles.title.modify','Modify customized file for {0}'),(953,'cardType.cardSecurityCode.MANUAL','Manual'),(954,'currency.error.removing','The currency could not be removed, because there are account types associated with this currency'),(955,'adImport.title.details.error','Advertisements with import errors'),(956,'profile.pendingEmail','Change to {0} is pending confirmation'),(957,'transactionPassword.MANUAL','Manual'),(958,'externalTransferType.action.IGNORE','None'),(959,'order.save','Save'),(960,'permission.basic.inviteMember','Invite member'),(961,'settings.types','Types'),(962,'permission.systemThemes.export','Export'),(963,'remark.inserted','The remark was inserted'),(964,'channel.title.modify','Modify channel'),(965,'menu.operator.member.references','References'),(966,'reports.stats.taxes.paid.legend','Show statistics on taxes...'),(967,'createOperator.password','Password'),(968,'memberImport.status.INVALID_RECORD_TYPE','Invalid record type: {0}'),(969,'permission.memberCards.cancel','Cancel'),(970,'connectedUsers.nature','Show'),(971,'reports.stats.activity.throughTime.loginTimes.col1','Logins / member'),(972,'pos.title.search','Search POS'),(973,'infoText.enabled','Enabled'),(974,'permission.systemMessageCategories','Message categories'),(975,'externalAccount.inserted','The external account was inserted'),(976,'settings.neverExpiresMessage','0 never expires'),(977,'customizedFile.title.search.static','Customized static files'),(978,'ad.tradeType.SEARCH','Wants'),(979,'message.link.label','Click here'),(980,'reports.stats.keydevelopments.averageAmountPerTransaction','Median amount per transaction'),(981,'smsMailing.sendType.member','To member'),(982,'conversionSimulation.account','Take values from'),(983,'quickAccess.updateProfile','My profile'),(984,'customField.possibleValue.multipleValues','You may enter several values, one per line'),(985,'channel.enableSMS','For SMS channel configuration, go to '),(986,'guarantee.generatedLoan','Generated loan'),(987,'menu.member.broker.pendingMembers','Pending members'),(988,'reports.stats.activity.histogram.numberTransactions.xAxis','Number of Transactions'),(989,'brokerCommissionContract.action.cancel','Cancel'),(990,'customField.possibleValue.field','Field'),(991,'loan.queryStatus.RECOVERED','Recovered'),(992,'adCategory.import.file','File'),(993,'reports.stats.keydevelopments.numberOfAds.scheduled','Scheduled ads'),(994,'externalTransferType.transferType','Payment Type'),(995,'group.title.settings.registration','Registration settings'),(996,'fileMapping.removed','File mapping removed'),(997,'global.amount.type.FIXED','Fixed'),(998,'cardType.cardSecurityCodeLength.max','Card security code max size '),(999,'settings.local.title','Local settings'),(1000,'group.account.noResults','This group has no associated accounts'),(1001,'help.title.messages','Messages'),(1002,'customField.name','Name'),(1003,'conversionSimulation.result.input','Input'),(1004,'ad.title.view','Advertisement details'),(1005,'global.uploadLimit','max'),(1006,'reports.current.references.total','Total amount of references given'),(1007,'alert.title.member','Member alerts'),(1008,'permission.brokerAccounts.authorizedInformation','View authorized payments'),(1009,'category.status','Status'),(1010,'card.blockCard.confirmation','Block card?'),(1011,'permission.brokerMembers','Brokering'),(1012,'reports.stats.general.appliedFilters','Applied filters'),(1013,'guaranteeType.updated','Guarantee type updated'),(1014,'permission.adminMemberCards.unblockSecurityCode','Unblock card security code'),(1015,'profile.action.scheduledPayments','View scheduled payments'),(1016,'menu.admin.home','Home'),(1017,'customField.member.access.MEMBER_NOT_REGISTRATION','Member, not at registration'),(1018,'reports.stats.keydevelopments.periodType.THROUGH_TIME','Through time'),(1019,'certificationLog.status','Status'),(1020,'ad.status.SCHEDULED','Scheduled'),(1021,'group.settings.pinLength','Pin length'),(1022,'guarantee.sellerName','Seller name'),(1023,'creditLimit.upper','Upper'),(1024,'reports.members.references','References'),(1025,'permission.brokerPos.block','Block'),(1026,'webshop.payment.headerText','You are about to make payment with the amount of {0} to {1} ({2}).'),(1027,'menu.admin.contentManagement.manageTranslation','Translation File'),(1028,'adImport.status.MISSING_PUBLICATION_PERIOD','Missing publication period'),(1029,'accountFee.paymentDirection.TO_SYSTEM','Member to system'),(1030,'fieldMapping.modified','Field mapping modified'),(1031,'document.title.list','Custom document list'),(1032,'reports.members.ads.active_ads','Active ads'),(1033,'customField.member.access.REGISTRATION','Member registration'),(1034,'infotext.subject','Title'),(1035,'error.permissionDenied','You don\'t have sufficient permissions to perform this action'),(1036,'permission.modified','The permissions were modified'),(1037,'pos.title.modify','Modify POS'),(1038,'permission.brokerLoanGroups.view','View'),(1039,'settings.message.loanGranted','Loan grant'),(1040,'group.settings.defaultAdPublicationTime','Default ad publication time'),(1041,'customizedFile.title.customize.static','Customize static file'),(1042,'settings.local.csv.stringQuote.NONE','None'),(1043,'ad.search.withImagesOnly','With images only'),(1044,'adInterest.keywords','Keywords'),(1045,'settings.log.transactionLevel.DETAILED','Detailed'),(1046,'transactionFee.whichBroker','Will receive'),(1047,'loanPayment.status.REPAID','Repaid'),(1048,'reports.stats.comparedPeriods','Compared periods'),(1049,'mailPreferences.saved','The e-mail notification preferences were saved'),(1050,'permission.systemAdminGroups.view','View'),(1051,'reports.stats.finances.title','Statistics of finances...'),(1052,'memberImport.status.MISSING_EMAIL','Missing e-mail'),(1053,'posweb.client.pin','Client PIN'),(1054,'ad.title.categories','Browse by category'),(1055,'help.title.help_howto','Helps howto'),(1056,'menu.member.broker.registerMember','Register member'),(1057,'permission.systemCardTypes','Card Types'),(1058,'permission.adminMemberBulkActions.generateCard','Generate card'),(1059,'reports.stats.keydevelopments.throughTime.selectMonths','Select months and years'),(1060,'permission.brokerPos.assign','Assign'),(1061,'loanGroup.removeMemberConfirmation','Remove this member from the loan group?'),(1062,'creditLimit.normal','Lower'),(1063,'reports.transactions_report.transactions','{0}: {1} of {2} transactions'),(1064,'customField.size.DEFAULT','Default'),(1065,'customField.member.indexing.NONE','Do not include'),(1066,'transactionFee.allBrokerGroups','All broker groups'),(1067,'settings.access.poswebTimeout','PosWeb session timeout'),(1068,'settings.message.posPinBlocked','POS PIN blocked by invalid trials'),(1069,'reports.stats.activity.topten.grossProduct.title','Top ten of gross product per member'),(1070,'settings.mail.smtpPort','Port'),(1071,'global.add','Add'),(1072,'settings.mail.mailValidation','Public registration e-mail validation'),(1073,'scheduledPayment.transferNumber','{0} of {1}'),(1074,'alert.member.blockedPosUsed','Attempt to use blocked POS with id {0} from IP {1}'),(1075,'permission.adminMemberTransactionFeedbacks','Transaction feedbacks'),(1076,'createMember.newCaptcha','New code'),(1077,'profile.action.manageReferences','Manage references'),(1078,'guaranteeType.action.new','Create guarantee type'),(1079,'transactionFee.enabled','Enabled'),(1080,'permission.adminMemberInvoices.sendAsMemberToMember','Send as member to member'),(1081,'permission.systemMessageCategories.manage','Manage'),(1082,'permission.module.type.BASIC','Basic permissions of {0}'),(1083,'permission.adminMemberSmsMailings.freeSmsMailings','Send free mailings'),(1084,'brokerCommissionContract.accepted','The broker commission contract was accepted'),(1085,'translationMessage.import.confirmation','Are you sure to import keys from the selected file?'),(1086,'transferType.fields.action.new','Insert new custom field'),(1087,'customImage.system.checked','External payment: checked'),(1088,'theme.message.import','Import theme from a file'),(1089,'settings.log.transactionLevel.NORMAL','Normal'),(1090,'operator.group','Group'),(1091,'ad.tradeType.OFFER','Offer'),(1092,'global.quarter.FOURTH','Fourth quarter'),(1093,'transferType.transactionHierarchyVisibility.BROKER','To administrators and brokers'),(1094,'cardType.action.new','Insert new card type'),(1095,'posweb.searchTransactions.print','Click here or press F4 to print'),(1096,'cardType.title.insert','New card type'),(1097,'memberPos.allowMakePayment','Allow make payment'),(1098,'conversionSimulation.result.nofees','No fees found...'),(1099,'certification.status.CANCELLED','Canceled'),(1100,'group.settings.maxTransactionPasswordWrongTries','Max transaction password tries'),(1101,'virtualKeyboard.capsLock','Caps Lock'),(1102,'accountFeeLog.finishDate','Finished at'),(1103,'reports.stats.general.whatToShow','What to show?'),(1104,'customField.operator.visibility','Visibility to operator'),(1105,'alert.system.accountFeeRunning','Account fee {0} is running'),(1106,'profile.action.authorizedPayments','Authorized payments'),(1107,'reports.members.accounts.balances','Accounts balances'),(1108,'menu.admin.contentManagement.applicationPage','Application pages'),(1109,'menu.operator.logout','Logout'),(1110,'smsMailing.sent','The SMS mailing is now being sent'),(1111,'activities.rates.asFeePercentage','Resulting in present conversion fee of: '),(1112,'alert.member.GIVEN_VERY_BAD_REFS','Member gave too many \'very bad\' references'),(1113,'guarantee.buyerName','Buyer name'),(1114,'transferType.confirmationMessage','Confirmation message'),(1115,'payment.error.maxAmountOnDayExceeded','You have already exceeded the maximum amount today for transaction {0}.'),(1116,'receipt.transfer.scheduledFor','Scheduled for: {0}'),(1117,'receipt.posweb.transactions.member','{0}'),(1118,'reports.stats.keydevelopments.grossProduct.yAxis','Gross Product (units)'),(1119,'customField.payment.listAccess','Show in list results'),(1120,'permission.brokerDocuments.manageMember','Manage member individual documents'),(1121,'settings.local.transactionNumber.padLength','Identifier length'),(1122,'menu.admin.messages.smsMailings','SMS mailings'),(1123,'transactionPassword.title','Transaction password'),(1124,'group.customizedFiles.noResults','This group has no customized files'),(1125,'permission.adminMemberInvoices.denyAsMember','Deny invoice as member'),(1126,'payment.cancel.transactionPassword','In order to cancel this payment, you must supply your transaction password'),(1127,'activities.loans.amount','Total loan remaining amount'),(1128,'externalAccountHistory.button.toImportList','To import list'),(1129,'card.user.of','Cards of {0}'),(1130,'global.datePattern.minute','mm'),(1131,'permission.adminMemberBrokerings.viewLoans','View loan details in members list (print)'),(1132,'externalTransfer.lineNumber','Line number'),(1133,'settings.message.transactionFeedbackReply','Transaction feedback replied'),(1134,'accountFee.title.memberSearch','Members search'),(1135,'permission.adminMemberDocuments.details','View documents'),(1136,'authorizationLevel.authorizer.PAYER','Payer'),(1137,'mobile.home.availableBalance','Available: {0}'),(1138,'paymentObligation.next','Next'),(1139,'menu.admin.reports.current','State overview'),(1140,'externalAccountHistory.error.cannotMarkExternalTransferAsUnchecked','Only checked transfers can be marked as unchecked'),(1141,'generateCard.generateForMemberWithPendingCard','Generate for members with pending card?'),(1142,'menu.admin.contentManagement.systemImages','System Images'),(1143,'payment.status.FAILED','Failed'),(1144,'adImport.title.newCategories','New categories'),(1145,'customField.ad.searchVisibility.BASIC','Basic search'),(1146,'admin.lastLogin','Last login'),(1147,'paymentRequest.error.sending','The payment request could not be sent'),(1148,'permission.systemCustomImages.view','View'),(1149,'accountFeeLog.stillRunning','Still running...'),(1150,'smsMailing.type','Type'),(1151,'ticket.status.OK','Success'),(1152,'reports.stats.taxes.volume','Volume'),(1153,'accountFee.modified','The account fee was modified'),(1154,'changePassword.error.mustContainOnlyLettersOrNumbers','The login password only allows letters and number'),(1155,'permission.systemPayments','System payments'),(1156,'settings.local.datePattern','Date format'),(1157,'settings.local.maxThumbnailSize','Max. thumbnail size'),(1158,'menu.member.guarantees.searchCertifications','Certifications'),(1159,'paymentFilter.title','Payment filter'),(1160,'customField.title.insert.payment','New custom field for {0}'),(1161,'loanPayment.status.UNRECOVERABLE','Unrecoverable'),(1162,'accountFee.enabled','Enabled'),(1163,'permission.brokerAccounts.scheduledInformation','View scheduled payments'),(1164,'customizedFile.removed','The file is no longer customized'),(1165,'alert.system.RATE_INITIALIZATION_FAILED','Rate initialization job on currency {0} failed due to an encountered exception.'),(1166,'permission.brokerAccounts','Account'),(1167,'settings.log.webServiceLevel.OFF','Off'),(1168,'settings.access.modified','The access settings were modified'),(1169,'alert.system.INDEX_REBUILD_START','Search index rebuilding start'),(1170,'memberRecordType.description','Description'),(1171,'adCategory.name','Name'),(1172,'reports.stats.keydevelopments.numberOfAds.title','Developments in number of ads'),(1173,'permission.brokerMemberPayments.blockScheduledAsMember','Block scheduled payment as member'),(1174,'profile.action.disconnect','Disconnect logged user'),(1175,'receiptPrinterSettings.title.modify','Modify receipt printer settings'),(1176,'changePin.pinLengthRange','Choose a pin with a lenght between {0} and {1} characters'),(1177,'transactionFee.title.broker.insert','Insert broker commission'),(1178,'pos.unblockPos.confirmation','Activate the POS?'),(1179,'payment.error.sameAccount','The destination account must be different from the source account'),(1180,'group.settings.passwordPolicy.AVOID_OBVIOUS_LETTERS_NUMBERS_SPECIAL','Require letters, numbers and special'),(1181,'settings.mail.smtpUsername','Login name'),(1182,'permission.systemDocuments.view','View'),(1183,'loan.repaymentDays','Default repayment days'),(1184,'guarantee.allowLoanPayment','Allow loan payment'),(1185,'adCategory.parent','Parent'),(1186,'invoice.transferType','Payment type'),(1187,'reports.members_reports.transactions.accountTypesRequired','It\'s necessary to select at least one account type'),(1188,'accountHistory.period.begin','From date'),(1189,'customImage.system.mobileSplash_large','Mobile: large splash image'),(1190,'createMember.public.awaitingActivation','Thanks for registering!\n\nYour account has been created and needs\nto be activated by the administration.'),(1191,'reports.stats.keydevelopments.transactionAmount.highest.short','highest'),(1192,'loan.search.status','Filter'),(1193,'conversionSimulation.result.input.arate','Applied A-rate'),(1194,'changePassword.resetAndErrorSending','The password was reset, however, the mail could not be sent to member'),(1195,'profile.action.manageNotifications','Manage notifications'),(1196,'memberImport.status.INVALID_CUSTOM_FIELD','{0} is invalid: {1}'),(1197,'groupFilter.viewableBy','Viewable by'),(1198,'permission.brokerRemarks.view','View'),(1199,'reports.members_reports.account_type','Account type'),(1200,'alert.system.adminLoginBlockedByPermissionDenieds','The admin \'{0}\' login is temporarily blocked by exceeding the maximum amount of permission denied. The remote IP address is {2}'),(1201,'transferType.transferListenerClass','Invoke Java class'),(1202,'transferType.reserveTotalAmountOnScheduling','Reserve total amount on scheduled payments'),(1203,'loanGroup.description','Description'),(1204,'menu.admin.usersGroups.importMembers','Import members'),(1205,'reports.stats.keydevelopments.numberOfAds.active.short','active'),(1206,'externalAccount.modified','The external account was modified'),(1207,'paymentObligation.pack.details','You must select a payment obligation set that not exceed the maximun period'),(1208,'reports.stats.keydevelopments.throughTime.years','Through years'),(1209,'sms.type.INFO_TEXT','Info text'),(1210,'messageCategory.noMessageCategories','No message categories available!'),(1211,'createMember.public.awaitingMailValidation','Thanks for registering.\n\nIn order to validate the e-mail address you have entered, a mail is being sent to you, with instructions on how to proceed'),(1212,'global.send','Send'),(1213,'smsMailing.error.noMobilePhone','The selected member has no mobile phone'),(1214,'errors.maxLength','{0} cannot be greater than {1} characters'),(1215,'connectedUsers.remoteAddress','IP address'),(1216,'paymentObligation.seller','Seller'),(1217,'reports.members.references.received','Received references'),(1218,'global.month.SEPTEMBER','September'),(1219,'permission.operatorMessages','Messages'),(1220,'guaranteeType.error.invalidAuthorizedBy','Invalid authorizer for the selected model. Only Issuer or Both are accepted.'),(1221,'permission.adminMemberRecords.view','View'),(1222,'card.update.confirmation','Confirmation'),(1223,'menu.operator.member.transactionFeedbacks','Transaction feedbacks'),(1224,'global.print','Print'),(1225,'settings.mail.fromMail','From address'),(1226,'menu.operator.account.memberPayment','Member Payment'),(1227,'certificationLog.date','Date'),(1228,'smsMailing.type.PAID','Paid'),(1229,'transfer.ticket','Ticket'),(1230,'profile.admin.title.of','Admin profile of {0}'),(1231,'group.settings.passwordTries.deactivationTime.field','Deactivation time (unit) after max password tries'),(1232,'permission.brokerMemberAccess.resetPassword','Reset login password'),(1233,'authorizationLevel.authorizer.RECEIVER','Receiver'),(1234,'accountFee.action.new','Insert new account fee'),(1235,'guaranteeLog.date','Date'),(1236,'permission.operatorPayments.paymentToSelf','Self payments'),(1237,'permission.systemAdminPermissions.view','View'),(1238,'adImport.status.INVALID_PRICE','Invalid price: {0}'),(1239,'serviceOperation.ACCOUNT_DETAILS','Access account details'),(1240,'group.account.title','Group accounts'),(1241,'card.status.BLOCKED','Blocked'),(1242,'transfer.title.parent','Parent transaction details'),(1243,'externalAccountHistory.amountRange.begin','From amount'),(1244,'guaranteeType.disabled.tooltip','Guarantee type disabled'),(1245,'profile.admin.title.my','My admin profile'),(1246,'global.clear','Clear'),(1247,'changeGroup.new','New group'),(1248,'serviceClient.inserted','The web services client was inserted'),(1249,'profile.action.memberPos','Manage POS'),(1250,'global.pagination.single.page','{0} result(s)'),(1251,'menu.operator.account.memberInvoice','Member Invoice'),(1252,'customField.title.modify.operator','Modify operator custom field'),(1253,'theme.style.MOBILE','Mobile'),(1254,'settings.local.csv.valueSeparator','Value separator'),(1255,'activities.references.received','Received'),(1256,'reports.stats.general.submit','Show statistics'),(1257,'loan.repaymentDate','Repayment date'),(1258,'permission.adminMemberInvoices.acceptAsMember','Accept invoice as member'),(1259,'reference.level.select','Select value'),(1260,'message.rootType.ADMIN','Administration'),(1261,'infoText.removed','Infotext removed.'),(1262,'defaultBrokerCommission.noCustomizedByBroker','This commission was not customized by the broker yet and is subject to changes by administration'),(1263,'brokerCommissionContract.status.PENDING','Pending'),(1264,'settings.local.extra','Extra'),(1265,'permission.adminMemberLoans.view','View member loans'),(1266,'profile.member.hide','Hide'),(1267,'loan.status.IN_PROCESS','In Process'),(1268,'remark.comments','Comments'),(1269,'message.subject','Subject'),(1270,'mobile.payment.confirmation','Payment of {0} to {1}.{2}'),(1271,'customField.control.CHECKBOX','Check box'),(1272,'externalAccountHistory.period.begin','From date'),(1273,'permission.memberCards.unblock','Unblock'),(1274,'createAdmin.created','The administrator has been created'),(1275,'image.details.drag.hint','Drag images to set order, and fill in the caption on the fields'),(1276,'guaranteeType.fee.paidBy','Paid by '),(1277,'adminTasks.indexes.type.Operator','Operators'),(1278,'receipt.posweb.transactions.transfer','{0} {1} {2} {3}'),(1279,'reports.stats.finances.income.short','Income'),(1280,'transactionFee.when','When commission is paid'),(1281,'settings.neverDeleteMessage','0 never delete'),(1282,'menu.admin.accounts','Accounts'),(1283,'customField.memberRecord.brokerAccess','Broker access'),(1284,'changeGroup.member.changed.mailError','The member\'s group was changed, however, the activation mail could not be sent'),(1285,'element.search.keywords','Keywords'),(1286,'ad.view.categories','View categories'),(1287,'group.settings.defaultChannels','Default channels'),(1288,'group.settings.smsFree','Free SMS'),(1289,'reference.removeConfirmation','Remove reference?'),(1290,'global.params','Parameters'),(1291,'settings.imported','The settings were imported'),(1292,'ad.permanent','Not expirable'),(1293,'memberRecord.user','User'),(1294,'permission.memberCards','Cards'),(1295,'paymentFilter.title.insert','Insert payment filter for {0}'),(1296,'customizedFile.title.search.css','Customized style sheets'),(1297,'payment.denied','The payment has been denied'),(1298,'permission.operatorReferences','References'),(1299,'conversionSimulation.result.initialAmount','Amount to convert'),(1300,'certification.action.create','Create certification'),(1301,'reports.stats.keydevelopments.highestAmountPerTransaction.yAxis','Highest amount / trans.'),(1302,'card.cancelCard.confirmation','Cancel card?'),(1303,'guaranteeType.pendingGuaranteeExpiration.tooltip','Means the maximum time for an issuer/administrator to authorize a pending guarantee'),(1304,'permission.adminMemberMessages.sendToMember','Send to member'),(1305,'menu.member.broker','Brokering'),(1306,'global.min','Min.'),(1307,'memberImport.status.USERNAME_ALREADY_IN_USE','Username already in use: {0}'),(1308,'menu.admin.contentManagement.cssFiles','CSS Files'),(1309,'ticket.status','Status'),(1310,'activities.sinceActive','Member since'),(1311,'reports.members.ads.permanent_ads','Permanent ads'),(1312,'loanPayment.repaidAmount','Repaid'),(1313,'brokerCommissionContract.status.DENIED','Denied'),(1314,'accountFee.invoiceMode.ALWAYS','Always (do not automatically charge member)'),(1315,'settings.message.messageMailSuffixPlain','Plain text mail body suffix'),(1316,'memberPos.numberOfCopies','Number of receipts'),(1317,'accountType.title.modify.system','Modify system account type'),(1318,'menu.admin.settings.access','Access Settings'),(1319,'adImport.title.details.all','All imported advertisements'),(1320,'accountFee.chargeMode.BALANCE_PERCENTAGE','Positive balance percentage'),(1321,'reports.stats.activity.developments.title','Key developments in member activity'),(1322,'channel.credentials.LOGIN_PASSWORD','Login password'),(1323,'payment.confirmation.other.withAuthorization','This payment of {0} to {2} needs authorization and will stay in the pending status until it is authorized and processed.{3}\n\nPlease, click OK to confirm.'),(1324,'contactUs.title','Contact us'),(1325,'smsMailing.by','Sent by'),(1326,'settings.message.paymentReceived','Payment receiving'),(1327,'loan.repayment.repay','Repay'),(1328,'paymentFilter.showInReports','Show in reports'),(1329,'posweb.printSettings.title','Local print settings'),(1330,'loanGroup.member','Members'),(1331,'permission.adminMemberAccess.unblockPin','Unblock pin'),(1332,'menu.member.personal.cards','Cards'),(1333,'document.visibility.ADMIN','Administrators'),(1334,'reports.stats.keydevelopments.transactionAmount.median.short','Tx. amount'),(1335,'message.actionPerformed.RESTORE','The messages were restored'),(1336,'fileMapping.nature','Type'),(1337,'menu.admin.usersGroups.groupFilters','Group filters'),(1338,'help.title.loans','Loans'),(1339,'certification.amount','Amount'),(1340,'settings.local.adDescriptionFormat','Advertisement description format'),(1341,'customField.possibleValue.title.modify','Modify value'),(1342,'permission.memberAccount.simulateConversion','Simulate conversion'),(1343,'brokerCommission.stopConfirmation','Stopping this broker commission means to set it\'s value to 0 and close the broker contracts related to it. Are you sure?'),(1344,'customizedFile.action.customizeNew','Customize new file'),(1345,'about.version','<b>Application version:</b> {0}'),(1346,'permission.systemAdCategories.view','View'),(1347,'cardType.removed','The card type was removed'),(1348,'mobile.viewPayments.amount','Amount'),(1349,'defaultBrokerCommission.status.INACTIVE','Inactive'),(1350,'reports.members.presentation.list.result','Member lists result '),(1351,'memberImport.initialDebitTransferType','Payment type for negative balances'),(1352,'smsLog.type','Type'),(1353,'message.body','Body'),(1354,'message.actionPerformed.DELETE','The messages were removed'),(1355,'invoice.from','From'),(1356,'memberImport.title.import','Import members'),(1357,'changePassword.error.alreadyUsed','The given password was already used in past'),(1358,'alert.system.NEW_VERSION_OF_APPLICATION_PAGE','New version of application page'),(1359,'adCategory.active','Active'),(1360,'menu.admin.settings.adminTasks','System tasks'),(1361,'permission.adminMemberGroups.manageMemberCustomizedFiles','Manage customized files'),(1362,'customField.title.insert.operator','New operator custom field'),(1363,'messageCategory.action.new','Insert new message category'),(1364,'group.settings.maxAdPublicationTime.field','Max ad publication time (unit)'),(1365,'sms.type.GENERAL','General'),(1366,'transactionFee.removed','The transaction fee was removed '),(1367,'global.weekDay.TUESDAY','Tuesday'),(1368,'settings.local.csv.recordSeparator','Row break'),(1369,'invoice.accept.header.withAuthorization','You are about to accept an invoice and submit the following payment for further authorization:'),(1370,'payment.backToMemberProfile','To member profile'),(1371,'menu.member.account.selfPayment','Self Payment'),(1372,'adCategory.title.order.description','Drag the fields to change order'),(1373,'guaranteeType.title.modify','Modify guarantee type'),(1374,'permission.operatorPayments.poswebReceivePayment','Receive POSweb payment'),(1375,'permission.operatorMessages.sendToAdministration','Send to administration'),(1376,'manual.title.admin','Cyclos administration manual'),(1377,'errorLog.parameters','Parameters'),(1378,'serviceClient.action.new','New web services client'),(1379,'menu.admin.alerts.errorLog','Error log'),(1380,'group.title.settings.access','Access settings'),(1381,'permission.adminAdminRecords.manage','Manage'),(1382,'profile.action.invoiceFromSystem','Invoice system to member'),(1383,'loan.repayment.remainingAmount','Remaining'),(1384,'permission.systemCardTypes.manage','Manage card types'),(1385,'paymentObligation.description','Description'),(1386,'externalTransferImport.error.format.detailed','Error importing transactions: Invalid value on: \nLine: {0}\nColumn: {1}\nField: {2}\nValue: {3}'),(1387,'transactionPassword.status.user','Status'),(1388,'menu.admin.messages.infoTexts','Info texts'),(1389,'permission.systemAccounts.manage','Manage accounts'),(1390,'ad.removed','Advertisement removed'),(1391,'settings.local.sms','SMS'),(1392,'permission.adminMemberAccess.enableLogin','Reactivate disabled members (because of failed login attempts)'),(1393,'theme.author','Author'),(1394,'accountType.limitType.UNLIMITED','Unlimited'),(1395,'payment.confirmation.unblock','You are going to unblock this payment.\n\nPlease click OK to confirm'),(1396,'reports.stats.general.histogram','Histogram'),(1397,'permission.brokerMemberRecords.modify','Modify'),(1398,'brokerCommissionContract.removed','The broker commission contract was removed'),(1399,'pos.createAndAssign','The POS doesn\'t exists. Do you want create and assign it to the member? '),(1400,'adInterest.title.insert','New ad interest'),(1401,'errors.email','{0} is an invalid e-mail address'),(1402,'transferType.priority','Priority'),(1403,'rates.reinit.type','Type'),(1404,'permission.adminMembers','Members'),(1405,'guaranteeType.error.loanTransferType','Loan transaction type'),(1406,'reports.current.member_group_information','Member group information'),(1407,'memberRecord.title.search.member','Search {0} for {1}'),(1408,'transactionFee.aRateRelation.LINEAR','Linear'),(1409,'transferAuthorization.action.AUTHORIZE','Authorized'),(1410,'memberImport.group.select','Select a group for the imported members'),(1411,'profile.action.loanGroups','Loan groups'),(1412,'global.max','Max.'),(1413,'card.action.changeCardCode','Change security card code'),(1414,'posweb.target.username','Login (recipient)'),(1415,'settings.message.receivedInvoiceExpired','Received invoice expired'),(1416,'loan.error.noTransferType','There is no possible payment type to grant this loan'),(1417,'smsLog.type.SMS_OPERATION','SMS operation'),(1418,'smsMailing.member','Member'),(1419,'ad.search.tradeType.SEARCH','Wants'),(1420,'loanPayment.title.search','Search loan payments'),(1421,'accountFee.recurrence','Periodic'),(1422,'changePassword.passwordLength','Choose a password with {0} characters'),(1423,'settings.log.transactionFile','Transactions logfile path / name'),(1424,'accountFee.chargeMode.FIXED','Fixed amount'),(1425,'reports.nocheckboxes','You didn\'t select any checkboxes, so there is nothing to show!'),(1426,'permission.systemSettings','Settings'),(1427,'global.month.MAY','May'),(1428,'message.sendTo.ADMIN','Administration'),(1429,'group.settings','Edit settings'),(1430,'brokerCommissionContract.title.listByBroker','Commission contracts with {0}'),(1431,'externalTransferImport.period.end','To date'),(1432,'permission.systemExternalAccounts.checkPayment','Check payment'),(1433,'transactionFee.action.simple.new','Insert new transaction fee'),(1434,'menu.admin.help.manual','Manual'),(1435,'receipt.transfer.textAfter','----------------'),(1436,'member.email','E-Mail'),(1437,'permission.systemGroups.manageAdmin','Manage admin group'),(1438,'group.settings.maxAdPublicationTime.number','Max ad publication time (amount)'),(1439,'permission.brokerMemberAccess.changeChannelsAccess','Change channels access'),(1440,'permission.adminMemberReferences.manage','Manage'),(1441,'reference.direction.transactionFeedback.RECEIVED','Received feedbacks'),(1442,'menu.admin.reports','Reports'),(1443,'customField.payment.access.FROM_ACCOUNT','For the source account only'),(1444,'cardLog.status','Status'),(1445,'document.title.form','Parameters for {0}'),(1446,'payment.error.pendingProcess','The payment couldn\'t be performed as there are other payments from your account being processed now.\nPlease, try again later'),(1447,'invoice.payments','Payments'),(1448,'help.title.quickstart','Quick start'),(1449,'reference.summary.score','Score'),(1450,'profile.action.addContact','Add to contact list'),(1451,'channel.principals','User identification'),(1452,'settings.message.commissionContractAccepted','Commission contract accepted'),(1453,'transactionFee.title.simple.modify','Modify transaction fee'),(1454,'currency.title.modify','Modify currency'),(1455,'receipt.transfer.amount','Amount: {0}'),(1456,'reference.level.VERY_GOOD','Very good'),(1457,'posLog.date','Date'),(1458,'sms.type.PAYMENT.description','Direct payment'),(1459,'loanPayment.status.IN_PROCESS','In Process'),(1460,'permission.operatorAccount.accountInformation','View account information'),(1461,'loanGroup.title.of','Loan groups of {0}'),(1462,'settings.local.language.RUSSIAN','Russian'),(1463,'paymentFilter.name','Name'),(1464,'permission.systemInfoTexts','Info texts'),(1465,'errors.lessThan','{0} must be less than {1}'),(1466,'group.smsMessages','SMS allowed messages'),(1467,'loanGroup.memberRemoved','The member was removed from this loan group'),(1468,'global.today','Today'),(1469,'brokerCommissionContract.endDate','End date'),(1470,'certification.guaranteeType','Guarantee Type'),(1471,'paymentObligation.delete','Delete'),(1472,'translationMessage.action.new','Insert new key'),(1473,'transfer.chargeback','Charged back at'),(1474,'permission.systemRegistrationAgreements.manage','Manage'),(1475,'messageCategory.error.removing','The message category couldn\'t be removed becouse there are messages using it'),(1476,'reports.stats.Period','Period'),(1477,'permission.memberReports.showAccountInformation','Show account information'),(1478,'loanPayment.amount','Amount'),(1479,'customField.member.updateAccess','Editable by'),(1480,'brokerCommissionContract.title.modify','Modify broker commission contract'),(1481,'loanGroup.title.my','My loan groups'),(1482,'group.selectInitialGroup','Select when registering a member'),(1483,'smsMailing.sentSms','Messages sent'),(1484,'permission.adminMemberPayments.chargeback','Chargeback payment to member'),(1485,'transactionFee.maxAmount','Max. amount'),(1486,'permission.systemThemes.select','Set'),(1487,'activities.transactions.numberSell','Received - count'),(1488,'multiDropDown.multiItemsMessage','#items# items selected'),(1489,'createMember.registrationAgreementNotice','By clicking the button below you are accepting the registration agreement'),(1490,'reports.stats.keydevelopments.throughTime.MONTH','Each month'),(1491,'permission.adminMemberAccounts.creditLimit','Set credit limit'),(1492,'externalTransferType.inserted','The payment type was inserted'),(1493,'permission.brokerLoans','Loans'),(1494,'admin.creationDate','Registration date'),(1495,'menu.operator.member.ads','Advertisements'),(1496,'permission.operatorAccount','Member account'),(1497,'group.settings.viewLoansByGroup','View loans given to loan group'),(1498,'reports.stats.taxes.paid.notPaidLimit','Limit for \"not paid\"'),(1499,'changeGroup.admin.permanentlyRemoved','You cannot change the group because the administrator was permanently removed'),(1500,'creditLimit.current','Current'),(1501,'changeGroup.action.changeGroup','Change group'),(1502,'accountType.description','Description'),(1503,'account.dRate','D rate'),(1504,'externalTransfer.title.modify','Modify external transfer'),(1505,'activities.invoices.incoming.amount','Incoming amount'),(1506,'activities.transactions.averageSell','Received - average amount '),(1507,'loan.repayment.discard.loan','Discard loan'),(1508,'changePassword.title.of','Change login password of {0}'),(1509,'smsMailing.byBroker.all','Brokered members'),(1510,'invoice.totalAmount','Total amount'),(1511,'createMember.action.saveAndNew','Save and insert new member'),(1512,'permission.systemExternalAccounts.manage','Manage'),(1513,'member.search.noResults','No members were found'),(1514,'transferAuthorization.action.DENY','Denied'),(1515,'reports.stats.activity.throughTime.loginTimes','Logins per member '),(1516,'errorLog.title.details','Error details'),(1517,'settings.message.newPendingPaymentByReceiver','New payment for receiver to authorize'),(1518,'transactionFee.title.simple.list','Transaction fees'),(1519,'reports.stats.activity.whatToShow.COMPARE_PERIODS','Compare two periods'),(1520,'customField.control.MEMBER_AUTOCOMPLETE','Member autocomplete'),(1521,'group.customizedFiles.action.new','Customize new file'),(1522,'message.type.LOAN','Loan events'),(1523,'translationMessage.import.type.NEW_AND_MODIFIED','Import new and modified keys'),(1524,'payment.title.systemToMember','Payment system to member'),(1525,'reports.members_reports.outgoing','Outgoing'),(1526,'group.settings.passwordPolicy.AVOID_OBVIOUS_LETTERS_NUMBERS','Require letters and numbers'),(1527,'group.loginPageName','Login page name'),(1528,'changePassword.title.my','Change my login password'),(1529,'group.title.modify.operator','Edit operator group settings'),(1530,'group.isRemoved','Removed'),(1531,'translationMessage.title.insert','New translation key'),(1532,'invoice.error.noTransferType','There is no possible payment type.\nPlease, contact the administration.'),(1533,'memberImport.status.INVALID_CUSTOM_FIELD_VALUE_UNIQUE','{0} is invalid: {1} is not unique.'),(1534,'settings.local.csv.recordSeparator.LF','Unix (char 13)'),(1535,'transferType.feedbackReplyExpirationTime','Max feedback reply comments period'),(1536,'alert.system.RATE_INITIALIZATION_FINISHED','rate initialization job finished'),(1537,'card.expirationDate','Expiration date'),(1538,'reports.stats.general.allPaymentTypes','All payments'),(1539,'brokerCommissionContract.status.CANCELLED','Cancelled'),(1540,'adInterest.inserted','Ad interest inserted'),(1541,'payment.status.PROCESSED','Processed'),(1542,'invoice.cancelled','The invoice was cancelled'),(1543,'profile.action.paymentFromSystem','Payment system to member'),(1544,'settings.local.rootUrl','Application root URL'),(1545,'loan.repayment.error.partialInterestsAmount','The interests part of the loan payment must be repaid together.\nYou can either repay a partial amount up to {0} or the total remaining amount of {1}'),(1546,'reports.stats.finances.other','Other'),(1547,'accountHistory.finalBalance','Final balance'),(1548,'pos.createdAndAssigned','POS created and assigned to member {0}'),(1549,'group.invalidNature','Invalid group type'),(1550,'profile.action.simulateConversion','Simulate conversion'),(1551,'global.range.from','From'),(1552,'permission.adminMemberPayments.paymentAsMemberToSystem','Member to system payment'),(1553,'settings.message.body','Body'),(1554,'global.nothingSelected','Nothing selected'),(1555,'menu.admin.customFields.adminFields','Admin Fields'),(1556,'pos.actions.assign','Assign'),(1557,'menu.admin.contentManagement.translation','Application Translation'),(1558,'fileMapping.numberFormat.FIXED_POSITION','Fixed position'),(1559,'createMember.public.awaitingPassword','Thanks for registering!\n\nYour shall receive the password shortly by e-mail'),(1560,'serviceOperation.DO_PAYMENT','Perform payments'),(1561,'payment.confirmation.transactionPassword','In order to confirm this payment, you must supply your transaction password'),(1562,'customImage.system.save','Export as CSV icon'),(1563,'reports.current.invoices.SYSTEM_OUTGOING.count','Number of outgoing system invoices'),(1564,'transactionFee.subject.DESTINATION_BROKER','Broker of member receiving (destination)'),(1565,'message.html','HTML format'),(1566,'settings.message.adminMemberAlert','Member alerts'),(1567,'connectedUsers.title','Connected users'),(1568,'message.from','From'),(1569,'permission.systemGroupFilters.view','View'),(1570,'permission.brokerPos.unblockPin','Unblock PIN'),(1571,'settings.local.language.FRENCH','French'),(1572,'adCategory.title.import','Import advertisement categories'),(1573,'translationMessage.message','Value'),(1574,'ad.removeConfirmation','Remove advertisement?'),(1575,'alert.system.errorProcessingAccountStatus','Critical error processing account status. Payment details: at: {0}, from {1}, to {2}, amount {3}'),(1576,'loan.confirmation.header','You are about to grant the following loan:'),(1577,'global.weekDay.short.SUNDAY','Sun'),(1578,'errors.notAllowed','{0}'),(1579,'reports.stats.groupOfGroups','Group filter'),(1580,'memberImport.status.INVALID_RECORD_TYPE_FIELD','Invalid field on record type {0}: {1}'),(1581,'accountFee.title.modify','Modify account fee'),(1582,'memberRecord.title.insert','Insert {0} for {1}'),(1583,'activities.transactions.last30Days','Transactions last 30 days'),(1584,'fieldMapping.field.MEMBER_USERNAME','Username'),(1585,'createMember.title.public','Member registration'),(1586,'translationMessage.title.export','Export to properties file'),(1587,'reports.stats.finances.ThroughTime.income.title','Income through time'),(1588,'menu.member.broker.defaultBrokerCommissions','Commission settings'),(1589,'loan.grantDate','Grant'),(1590,'memberRecordType.label','Label (plural)'),(1591,'externalTransferImport.error.importing.invalidMemberUsername','Invalid member username: {0}'),(1592,'currency.action.new','New currency'),(1593,'permission.adminMemberReports.amounts','Show amounts'),(1594,'guarantee.model','Model'),(1595,'reports.stats.activity.singlePeriod.grossProduct','Gross Product per member'),(1596,'reports.simulations.aRate.config.graph.title','A-rate configuration curve'),(1597,'permission.brokerMemberRecords.create','Create'),(1598,'changeGroup.operator.title','Change group for operator {0}'),(1599,'reports.transactions_report.incoming','incoming'),(1600,'permission.adminMembers.view','View'),(1601,'home.status.hasPendingCommissionContracts','There are pending commission contracts. You won\'t be able to perform payments while they are pending'),(1602,'transactionPassword.title.manage','Manage transaction password of {0}'),(1603,'memberPos.resultPageSize','Result page size'),(1604,'guaranteeType.paymentObligationPeriod.tooltip','Window time between the newest and the oldest payment obligation'),(1605,'paymentObligation.removeConfirmation','Remove payment obligation?'),(1606,'guaranteeType.feePayers.BUYER','Buyer'),(1607,'permission.memberReports','Member reports'),(1608,'customField.title.order.memberRecord','Set custom field order for member record type {0}'),(1609,'authorizationLevel.authorizer.ADMIN','Admin'),(1610,'settings.import.confirmation','Are you sure to import the settings from the selected file?'),(1611,'mobile.payment.title.do','Do Payment'),(1612,'ticket.status.OK_PENDING','Success / Pending'),(1613,'customField.title.order.admin','Set administrator custom field order'),(1614,'profile.action.transactionFeedbacks','Transaction feedbacks'),(1615,'permission.adminMemberPayments.payment','System to Member payment'),(1616,'conversionSimulation.result.input.date','Applied conversion date'),(1617,'group.settings.smsChargeAmount','Additional SMS amount'),(1618,'menu.operator.member','Member Operations'),(1619,'profile.action.listBrokerCommissionContracts','Commission contracts'),(1620,'invoice.action.goToPayment','View payment details'),(1621,'changeGroup.member.confirmPermanentRemove','Remove member permanently?'),(1622,'group.settings.smsContextClassName','Custom SMS context class name'),(1623,'message.messageBox','Message box'),(1624,'customImage.system.mobileSplash_small','Mobile: small splash image'),(1625,'externalTransferImport.error.importing.invalidMemberField','Invalid member custom field value ({0}): {1}'),(1626,'reports.members_reports.details_level.TRANSACTIONS','Transactions'),(1627,'loanPayment.summary.total','Total'),(1628,'error.image.dimension','The image dimensions are too big.'),(1629,'currency.rates','Available rates for this currency'),(1630,'paymentObligation.cancel','Cancel'),(1631,'reports.stats.keydevelopments.numberOfAds.expired','Expired ads'),(1632,'menu.operator.guarantees.searchGuarantees','Guarantees'),(1633,'loan.type','Loan type'),(1634,'menu.operator.guarantees.searchPaymentObligations','Payment Obligations'),(1635,'reports.simulations.aRateConfigSimulation.transactionFee','TransactionFee (for default values)'),(1636,'settings.message.adminPendingGuarantee','Guarantee awaiting authorization'),(1637,'settings.local.csv.recordSeparator.CR','Macintosh (char 10)'),(1638,'createMember.initialGroup.title','Group selection'),(1639,'groupFilter.showInProfile','Show in profile'),(1640,'permission.adminMemberGroups.manageAccountSettings','Manage account settings'),(1641,'transfer.from','From'),(1642,'settings.title.translations.file','Import / export notifications and e-mails translations'),(1643,'settings.message.externalChannelPaymentRequestExpiredReceiver','External channel payment request expired receiver'),(1644,'customField.memberRecord.brokerAccess.NONE','None'),(1645,'loan.grant.error.upperCreditLimit','The loan cannot be grant because it would make the member account to have a balance beyond it\'s upper credit limit'),(1646,'payment.title.systemMemberToSystem','Payment from member {0} to system'),(1647,'image.noPicture.caption','No picture'),(1648,'externalTransferImport.period.begin','From date'),(1649,'document.formPage','Form page'),(1650,'memberRecordType.fields.action.new','Insert new custom field'),(1651,'brokerCommissionContract.title.view','Broker commission contract details'),(1652,'customizedFile.newContents','New contents'),(1653,'group.settings.defaultAdPublicationTime.field','Default ad publication time (unit)'),(1654,'pendingMember.title.profile','Pending member details'),(1655,'reports.stats.activity.topten.login.col1','Logins'),(1656,'alert.title','Title'),(1657,'card.activateWarning.confirmation','Warning: any other active card will be canceled. '),(1658,'reports.stats.finances.singlePeriod.overview.yAxis','Amount'),(1659,'loan.setExpiredStatus','Mark this loan as \'{0}\''),(1660,'login.form.text','If you are a registered member, you can login with your username and password below.'),(1661,'certification.issuer','Issuer'),(1662,'settings.local.language.CZECH','Czech'),(1663,'guaranteeType.transferType.select','Select transaction type'),(1664,'customField.memberRecord.showInList','Show in list'),(1665,'permission.operatorPayments.blockScheduled','Block scheduled payment'),(1666,'profile.member.title.of','Profile of {0}'),(1667,'help.title.ads_interest','Ads Interest'),(1668,'certificationLog.by','Changed by'),(1669,'menu.admin.contentManagement.customImages','Custom Images'),(1670,'customImage.system.active','Active icon'),(1671,'global.yes','Yes'),(1672,'pendingMember.title.print','Pending member search results'),(1673,'customImage.system.pay','Pay icon'),(1674,'profile.action.manageBrokerCommissions','Commissions settings'),(1675,'operator.noGroup','In order to create a new operator, you must first create at least one operator group'),(1676,'sms.type.HELP_ERROR','Help error'),(1677,'accountHistory.tooltip.viewGrouped','View group'),(1678,'pos.blocked','POS has been blocked'),(1679,'memberRecordType.layout.FLAT','Tiled'),(1680,'customImage.system.permissions','Permissions icon'),(1681,'loan.status.PENDING_AUTHORIZATION','Pending authorization'),(1682,'reference.direction.transactionFeedback.GIVEN','Given feedbacks'),(1683,'changePassword.currentPassword','Current login password'),(1684,'receiptPrinterSettings.helpMessage','Make sure to read the help file and <a href=\"{0}\">Cyclos Wiki</a> before adding a new printer.'),(1685,'permission.brokerDocuments','Documents'),(1686,'notificationPreferences.disableSms.confirmation','You are about to disable all SMS notifications and operations.\n\nAre you sure?'),(1687,'menu.admin.customFields.memberFields','Member Fields'),(1688,'guarantee.status','Status'),(1689,'profile.member.title.my','My profile'),(1690,'permission.operatorLoans','Loans'),(1691,'profile.action.accountsAction','Accounts'),(1692,'translationMessage.import.type.NEW_AND_EMPTY','Import new and empty keys only'),(1693,'certification.removed','The Certification was removed'),(1694,'loanPayment.status.RECOVERED','Recovered'),(1695,'menu.operator.account.transfersAuthorizations','Search authorizations'),(1696,'guaranteeType.authorizedBy.ADMIN','Admin'),(1697,'permission.adminMemberInvoices.send','Send invoice from profile'),(1698,'currency.removed','The currency was removed'),(1699,'currency.enableIRate','Enable I-rate'),(1700,'permission.brokerMemberPayments.authorize','Authorize'),(1701,'paymentObligation.logs','Payment obligation logs'),(1702,'selectChannels.channels','Channels'),(1703,'guarantee.removed','The guarantee was removed'),(1704,'settings.access.externalPaymentPassword.TRANSACTION_PASSWORD','Transaction password'),(1705,'infoText.empty.subject','No text defined for empty message.'),(1706,'externalTransferProcess.paymentDescription','{0}, of {1}'),(1707,'smsMailing.mailingType.INDIVIDUAL','Individual SMS'),(1708,'notificationPreferences.costPerMessage','The cost per message is {0}'),(1709,'memberPos.assign.memberWithoutAccount','The member doesn\'t have an account.'),(1710,'admin.email','E-Mail'),(1711,'alert.member.RECEIVED_VERY_BAD_REFS','Member received too many \'very bad\' references'),(1712,'member.title.bulkActions.filter','Member filter for bulk actions'),(1713,'receipt.posweb.transactions.header','{0} transactions'),(1714,'loanPayment.status.OPEN','Open'),(1715,'reports.stats.keydevelopments.throughTime.months.title','Developments through the time'),(1716,'menu.admin.contentManagement.documents','Documents'),(1717,'externalTransferType.modified','The payment type was modified'),(1718,'settings.message.admin.title','Administrator notifications'),(1719,'permission.brokerPos.changeParameters','Change parameters'),(1720,'fieldMapping.field.MEMBER_CUSTOM_FIELD','Member custom field'),(1721,'transactionPassword.reset','The transaction password was reset.\nThe user is now allowed to generate his transaction password'),(1722,'reference.transactionFeedback.saved','The transaction feedback was saved'),(1723,'reports.simulations.aRate.config.graph.xAxis','A-rate (days)'),(1724,'reference.title.details.transactionFeedback','Transaction feedback details'),(1725,'permission.memberCards.changeCardSecurityCode','Change code'),(1726,'permission.systemLoanGroups.manage','Manage'),(1727,'memberPos.status.ACTIVE','Active'),(1728,'settings.alert.alertNewPendingMembers','New pending activation members'),(1729,'permission.brokerPos.manage','Manage'),(1730,'changePassword.resetAndSend.confirmation','Are you sure to reset the member\'s password?'),(1731,'reference.inserted','Reference inserted'),(1732,'permission.memberAccount.authorizedInformation','View authorized payments'),(1733,'permission.memberCards.view','View'),(1734,'customField.possibleValue.removed','The value was removed'),(1735,'card.actions','Actions'),(1736,'memberImport.status','Status'),(1737,'help.title.account_history','Account History'),(1738,'menu.member.account.loanGroups','Loan groups'),(1739,'settings.type.MESSAGE','Notifications'),(1740,'permission.adminMemberLoans','Loans'),(1741,'permission.adminMemberBrokerings.changeBroker','Change broker'),(1742,'brokering.list.noResults','No registered members for the given filter'),(1743,'externalAccount.systemAccount','System account'),(1744,'group.settings.passwordExpiresAfter.field','Login password expires after (unit)'),(1745,'channel.action.new','Insert a new channel'),(1746,'mailPreferences.applicationErrors','Application errors'),(1747,'message.warning.messageNotReceivedByEmail','The message was sent internally, but not by e-mail'),(1748,'customField.title.modify.admin','Modify administrator custom field'),(1749,'alert.removeSelected.confirm','Remove selected alerts?'),(1750,'theme.import.error.reading','Error importing theme. The file is invalid.'),(1751,'conversionSimulation.result.percentage','Fee Percentage'),(1752,'permission.adminMemberGroups.view','View'),(1753,'createMember.passwordConfirmation','Confirm password'),(1754,'paymentObligation.conceal','Unpublish'),(1755,'reports.members.ads.expired','Expired'),(1756,'settings.log.maxFilesPerLog','Max. files per log'),(1757,'settings.local.cyclosId','Identification for external channels'),(1758,'pos.action.unassign','Unassign'),(1759,'fileMapping.negativeAmountValue','Negative character'),(1760,'externalAccountHistory.action.confirmDelete','Are you sure to permanently remove the external transfers?'),(1761,'adCategory.insertMultiple','You may enter several categories, one per line'),(1762,'loan.expirationFeeRepaymentType','Expiry fee repayment type'),(1763,'fileMapping.title','File Mapping'),(1764,'customField.member.indexing','Include in keywords search'),(1765,'settings.access.passwordLength','Password length'),(1766,'smsMailing.broker.all','My brokered members'),(1767,'permission.systemCurrencies','Currencies'),(1768,'accountFee.invoiceMode.NEVER','Never (may make member accounts go negative)'),(1769,'permission.systemAlerts','Alerts'),(1770,'global.timePeriod.HOURS','Hour(s)'),(1771,'posweb.client.name','Client name'),(1772,'rates.error.initializationAlreadyRunning','You tried to start a rate initialization job while there is already one running.'),(1773,'adInterest.adFields','Match the following ad fields'),(1774,'errors.numeric','Numeric errors'),(1775,'adImport.title.summary','Advertisement import summary'),(1776,'payment.status.PENDING','Pending authorization'),(1777,'reference.replyComments','Reply comments'),(1778,'guarantee.error.changeStatus','Can\'t change the guarantee\'s status to: {0}'),(1779,'alert.system.NEW_VERSION_OF_STATIC_FILE','New version of static file'),(1780,'account.isDefault','Is default'),(1781,'registrationAgreement.title.modify','Modify registration agreement'),(1782,'accountFee.day','Day'),(1783,'transactionFee.receiver','Will receive'),(1784,'scheduledPayments.totalRemaining','Total remaining'),(1785,'permission.systemGuaranteeTypes.manage','Manage'),(1786,'accountFeeLog.period','Period'),(1787,'loan.status','Filter'),(1788,'login.action.loginAsMember','Login as member'),(1789,'profile.action.transferAuthorizations','View payment authorizations'),(1790,'menu.member.personal.pos.memberPos','POS devices'),(1791,'customImage.system.calendar','Calendar icon'),(1792,'externalTransfer.date','Date'),(1793,'message.fromTo','From / To'),(1794,'reports.transactions_report.number','Number'),(1795,'reports.transactions_report.member_invoices','{0} of {1} member to members invoices'),(1796,'mailPreferences.newMembers','New registered members'),(1797,'createMember.error.registrationAgreementCheck','In order to continue, you must agree with the presented registration agreement'),(1798,'invoice.search.period.begin','Begin date'),(1799,'alert.system.ACCOUNT_FEE_RUNNING','Account fee running'),(1800,'brokerCommissionContract.error.contractNotFound','The commission contract could not be found. It\'s probably been removed.'),(1801,'customField.action.newPossibleValue','New possible value'),(1802,'paymentObligation.title.new','New payment obligation'),(1803,'currency.dRate.initDate','Initialization date for D-rate'),(1804,'posweb.title.receivePayment','Receive payment'),(1805,'transferType.allowCancelScheduledPayments','Allow payer to cancel scheduled payments'),(1806,'reports.stats.keydevelopments.throughTime','All selected items through time'),(1807,'global.month.JUNE','June'),(1808,'help.title.statistics','Statistics'),(1809,'permission.systemAdCategories.manage','Manage'),(1810,'changePassword.expired','Your password has expired.\nIn order to continue, you must change it.'),(1811,'reports.stats.keydevelopments.grossProduct.title','Developments in Gross Product (= sum of transaction amounts)'),(1812,'permission.memberAccount.scheduledInformation','View scheduled payments'),(1813,'reports.members.show_btn','Show report'),(1814,'permission.adminMemberMessages.manage','Manage'),(1815,'settings.local.language.SPANISH','Spanish'),(1816,'ticket.status.FAILED','Failed'),(1817,'fileMapping.noFileMapping.message','There is no file mapping for this account yet.\nClick here to configure it'),(1818,'permission.systemGroupFilters.manage','Manage'),(1819,'group.error.passwordPolicySpecialVirtualKeyboard','{0} cannot be set to require special characters because virtual keyboard is used for the login password'),(1820,'fieldMapping.orderModified','Field mappings order modified'),(1821,'externalTransferType.code','Code'),(1822,'adCategory.removeConfirmation','Remove category?'),(1823,'loan.member','Member name'),(1824,'about.title','About'),(1825,'transferType.title.insert','Insert transaction type'),(1826,'card.securityCode','Security code'),(1827,'adminTasks.indexes.type.Administrator','Administrators'),(1828,'manual.action.top','Top'),(1829,'paymentObligation.status.REJECTED','Rejected'),(1830,'group.registrationAgreement.forceAccept','Force accept on next login'),(1831,'activities.brokering.commission.amount','Total commission'),(1832,'channel.internalNameAlreadyInUse','The internal name is already in use'),(1833,'reports.stats.systemAccountFilter','System Account'),(1834,'reports.stats.keydevelopments.grossProduct','Gross Product'),(1835,'transfer.dRate','D-rate'),(1836,'global.system','System'),(1837,'global.month.JULY','July'),(1838,'errors.javaClass','{0} should be a valid java class name assignable to {1}'),(1839,'menu.member.help.manual','Manual'),(1840,'help.title.references','References'),(1841,'ad.category','Category'),(1842,'ticket.status.CANCELLED','Cancelled'),(1843,'adImport.confirm','Import'),(1844,'reports.simulations.choose','Choose Simulation'),(1845,'customizedFile.select.name','Select file'),(1846,'brokerCommission.notCharging','This commission type is not been charged'),(1847,'alert.member.transactionPasswordBlockedByTries','The transaction password was blocked by exceeding maximum amount of tries'),(1848,'transactionPassword.block.confirmMessage','Are you sure to block the member\'s transaction password? '),(1849,'settings.local.csv.valueSeparator.SEMICOLON','Semicolon'),(1850,'profile.action.advertisementsActions','Advertisements'),(1851,'activities.references','References'),(1852,'permission.module.type.ADMIN_ADMIN','Administrator administration permissions of {0}'),(1853,'groupFilter.removed','Group filter removed'),(1854,'accountFeeLog.count','Number'),(1855,'settings.message.accountFeeReceived','Account fee receiving'),(1856,'adCategory.path','Path'),(1857,'settings.message.scheduledPaymentProcessed','Scheduled payment successfully processed'),(1858,'profile.action.viewDocuments','Member documents'),(1859,'messageCategory.all','All categories'),(1860,'paymentObligation.title.searchPaymentObligations','Search payment obligations'),(1861,'message.sendTo.BROKERED_MEMBERS','My brokered members'),(1862,'reports.stats.period.periodMain','Main Period'),(1863,'payment.confirmation.self.withAuthorization','This payment of {0} from {1} to {2} needs authorization and will stay in the pending status until it is authorized and processed.{3}\n\nPlease, click OK to confirm.'),(1864,'group.copySettingsFrom','Copy settings from'),(1865,'accountFee.action.recharge','Recharge'),(1866,'reports.stats.keydevelopments.grossProduct.allTransactions.short','All'),(1867,'currency.aRate.initValue','Initialization value A-rate'),(1868,'message.type.REFERENCE','Received reference'),(1869,'settings.local.language.JAPANESE','Japanese'),(1870,'externalAccountHistory.amountRange.end','To amount'),(1871,'rates.reinit.warning','Note that reinitializing a rate is a process that can take hours. The application will be put offline if you start a rate initialization.'),(1872,'memberImport.successfulMembers','Successful members'),(1873,'reports.stats.keydevelopments.throughTime.months.xAxis','Months'),(1874,'posweb.client.any','Client'),(1875,'customField.type.DECIMAL','Decimal number'),(1876,'authorizationLevel.error.lowerLevelAmount','This level\'s amount cannot be lower than the previous one'),(1877,'settings.message.externalChannelPaymentPerformed','External channel payment performed'),(1878,'reports.simulations.aRateConfigSimulation.transferType','Transfertype (for default values)'),(1879,'member.bulkActions.changeGroup','Change group'),(1880,'groupFilter.customizedFiles.title.modify','Modify customized file for {0}'),(1881,'mailPreferences.payments','Payments'),(1882,'customImage.system.quickAccess_placeAd','Quick access: place ad'),(1883,'global.tooltip.help','Help'),(1884,'activities.transactions.total','Total of all transactions'),(1885,'account.creditLimit','Lower credit limit'),(1886,'scheduledPayment.date','Date'),(1887,'ad.price.unspecified','Unspecified'),(1888,'menu.admin.settings','Settings'),(1889,'accountFee.error.removing','This account fee cannot be removed because it was already charged'),(1890,'ticket.toChannel','Confirm channel'),(1891,'payment.awaitingAuthorization','Payment has been been submitted for authorization.\nIt will stay in the pending status until it is authorized and processed'),(1892,'permission.adminMemberBulkActions','Bulk actions'),(1893,'transferType.title.list','Transaction types'),(1894,'menu.admin.accessDevices.pos.search','Search POS'),(1895,'message.action.MARK_AS_READ','Mark as read'),(1896,'contact.error.alreadyExists','The given member is already in your contact list'),(1897,'certification.details','Details'),(1898,'transfer.amount','Amount'),(1899,'permission.systemPayments.cancelScheduled','Cancel scheduled payment'),(1900,'transferType.transactionHierarchyVisibility.MEMBER','To all users'),(1901,'settings.alert.modified','Alert settings modified'),(1902,'reports.current.member_account_information','Member accounts'),(1903,'transferType.maxAmountPerDay','Max amount per day'),(1904,'invoice.action.cancel','Cancel'),(1905,'sms.type.INFO_TEXT.description','Info text'),(1906,'reports.stats.activity.comparePeriods.numberTransactions','Number of Transactions per member'),(1907,'transfer.paymentEvery','Payment every'),(1908,'guaranteeType.feeType.VARIABLE_ACCORDING_TO_TIME','Annual %'),(1909,'sms.type.INFO_TEXT_ERROR.description','Info text error'),(1910,'fieldMapping.field.NEGATE_AMOUNT','Negative amount indicator'),(1911,'menu.admin.accounts.invoices','Manage Invoices'),(1912,'theme.title.export','Export current settings as theme'),(1913,'group.account.inserted','The group account was inserted'),(1914,'pos.removed','The POS was removed'),(1915,'ad.externalPublication','External publication'),(1916,'theme.styles','Styles in this theme'),(1917,'loan.repayment.error.enoughCredits','The account doesn\'t have enough credits to repay this loan'),(1918,'loan.expirationDate','Expiry'),(1919,'reports.stats.keydevelopments.numberOfMembers.numberOfDisappearedMembers','Number of disappeared members'),(1920,'settings.log.accountFeeLevel.STATUS','Status changes and errors'),(1921,'customField.control','Field type'),(1922,'menu.member.guarantees.searchGuarantees','Guarantees'),(1923,'permission.memberProfile.view','View'),(1924,'sms.type.ACCOUNT_DETAILS_ERROR','Account details error'),(1925,'memberImport.status.INVALID_BALANCE','Initial balance is invalid: {0}'),(1926,'accountHistory.conciliation.all','All'),(1927,'permission.systemCustomFields.manage','Manage'),(1928,'customField.member.visibilityAccess','Show in profile for'),(1929,'settings.local.maxUploadSize','Max. upload size'),(1930,'adInterest.type.SEARCH','Want'),(1931,'operator.title.search','Operators search'),(1932,'transactionPassword.error.permissionDenied','You don\'t have enough permissions to generate the transaction password'),(1933,'alert.date','Date'),(1934,'loan.openTransfer','Show the related payment'),(1935,'customField.payment.type','Type'),(1936,'changePin.error.invalidPassword','Incorrect password'),(1937,'permission.systemAlerts.manageSystemAlerts','Manage system alerts'),(1938,'global.weekDay.short.FRIDAY','Fri'),(1939,'permission.memberSms','SMS logs'),(1940,'permission.adminMemberAds.manage','Manage'),(1941,'permission.brokerReports','Reports'),(1942,'message.action.reply','Reply'),(1943,'customField.member.access.ADMIN','Administrator'),(1944,'permission.memberGuarantees.buyWithPaymentObligations','Buy with payment obligations from'),(1945,'message.rootType.all','All'),(1946,'guaranteeType.transferTypes','Transaction types'),(1947,'loan.setExpiredStatus.confirmation','Are you sure to change this loan\'s status?'),(1948,'brokerCommission.type','Type'),(1949,'loan.paymentDate','Payment'),(1950,'settings.log.accountFeeLevel.ERRORS','Errors only'),(1951,'customField.payment.enabled','Enabled'),(1952,'customField.removed','The custom field was removed'),(1953,'menu.operator.account.invoices','Invoices'),(1954,'reference.modified','Reference modified'),(1955,'settings.local.decimalInputMethod.RTL','Right to left (only numbers are typed)'),(1956,'member.bulkActions.generateCard.confirmation','Are you sure to generate cards to all members matching the filter?'),(1957,'adImport.status.UNKNOWN_ERROR','Unknown error'),(1958,'externalTransferType.removed','The payment type was removed'),(1959,'category.status.ACTIVE','Active'),(1960,'mobile.home.balance','Balance: {0}'),(1961,'reports.members_reports.details_level.SUMMARY','Summary'),(1962,'loan.monthlyInterest','Monthly interest'),(1963,'menu.admin.guarantees','Guarantees'),(1964,'payment.confirmation.self','You are going to transfer {0} from {1} to {2}.{3}\n\nPlease, click OK to confirm.'),(1965,'adImport.successfulAds','Successful advertisements'),(1966,'card.creationDate','Creation date'),(1967,'guarantee.issuerName','Issuer name'),(1968,'permission.brokerMembers.manageContracts','Manage commission contracts'),(1969,'group.removeConfirmation','Remove this group?'),(1970,'reports.stats.activity.topten.grossProduct','Gross Product'),(1971,'global.confirm','Confirm'),(1972,'menu.member.personal.messages','Messages'),(1973,'alert.member.PIN_BLOCKED_BY_TRIES','Pin blocked by invalid tries'),(1974,'reports.stats.keydevelopments.highestAmountPerTransaction.title','Developments in highest amount per transaction'),(1975,'alert.member.receivedVeryBadRefs','The member has received {0} very bad references'),(1976,'customizedFile.type.STATIC_FILE','Static'),(1977,'customImage.system.quickAccess_makePayment','Quick access: make payment'),(1978,'settings.local.timeZone','Time zone'),(1979,'alert.system.ADMIN_TRANSACTION_PASSWORD_BLOCKED_BY_TRIES','Admin transaction password blocked by tries'),(1980,'pin.error.blocked','Your PIN has been temporarily blocked, as you have exceeded the max tries'),(1981,'menu.admin.customFields.adFields','Ad Fields'),(1982,'pendingMember.removeConfirmation','Are you sure to remove this pending registration?\n\nPending registrations are automatically removed after {0}'),(1983,'certification.issuerUsername','Issuer login'),(1984,'permission.adminMembers.register','Register'),(1985,'errorLog.search.date.begin','Begin date'),(1986,'customField.possibleValue.enabled','Enabled'),(1987,'registrationAgreement.removeConfirmation','Are you sure to remove this registration agreement?'),(1988,'transactionFee.removeConfirmation','Remove this transaction fee? '),(1989,'theme.select.confirmationMessage','You are about to select a theme\nThis may overrite customizations on CSS files, or style sheet images.\nAre you sure?'),(1990,'webshop.payment.credentialsText','In order to confirm this payment, enter your username and {0} below and select Submit'),(1991,'reports.stats.general.graph','Graph'),(1992,'pendingMember.validationKey','Validation code'),(1993,'global.cancel','Cancel'),(1994,'menu.admin.contentManagement','Content Management'),(1995,'permission.brokerCards','Cards'),(1996,'serviceOperation.RECEIVE_PAYMENT','Receive payments'),(1997,'permission.operatorPayments.paymentToMember','Member payments'),(1998,'permission.adminMemberReferences.view','View'),(1999,'smsMailing.title.search','SMS mailings'),(2000,'certification.buyerName','Buyer name'),(2001,'loanPayment.status.DISCARDED','Externally repaid'),(2002,'reports.transactions_report.debits','debits'),(2003,'brokerCommissionContract.cancelConfirmation','Cancel this broker commission contract?'),(2004,'payment.invalid.paymentDates','The payment dates should be sorted and must be scheduled for future dates'),(2005,'mobile.home.title','Cyclos Home'),(2006,'menu.member.personal.manageExternalAccess','External access'),(2007,'reports.stats.keydevelopments.numberOfAds.expired.short','expired'),(2008,'global.timePeriod.YEARS','Year(s)'),(2009,'theme.version','Version'),(2010,'receipt.transfer.status','Status: {0}'),(2011,'reports.stats.activity.throughTime.numberTransactions.yAxis','n transactions'),(2012,'reports.members.accounts.upper_credits','Upper credit limits'),(2013,'settings.message.maxTransactionPasswordTries','Maximum transaction password attempts exceeded'),(2014,'reports.current.member_account','Member accounts'),(2015,'loanGroup.title.search','Search loan groups'),(2016,'guarantee.error.invalidGuarantee','The total fees amount must be less than the guarantee amount.'),(2017,'messageCategory.inserted','The message category was inserted'),(2018,'permission.adminMemberAccounts.simulateConversion','Simulate conversion'),(2019,'accountFee.removeConfirmation','Remove this account fee?'),(2020,'settings.action.EXPORT','Export'),(2021,'permission.adminMemberPayments.paymentAsMemberToSelf','Member self payment'),(2022,'permission.systemTranslation.view','View'),(2023,'permission.operatorContacts.view','View'),(2024,'permission.adminMemberInvoices.manage','Manage member invoices'),(2025,'permission.adminMemberGuarantees.viewCertifications','View certifications'),(2026,'receiptPrinterSettings.name','Display name'),(2027,'settings.local.identification','Cyclos instance identification'),(2028,'reference.comments','Comments'),(2029,'group.defaultAcceptPaidMailing','Accept paid mailings by default'),(2030,'accountType.removeConfirmation','Remove this account, as well as the transaction types?'),(2031,'ad.title','Title'),(2032,'group.registrationAgreement.none','Not used'),(2033,'settings.local.sms.enable','Enable'),(2034,'transactionFee.description','Description'),(2035,'permission.operatorPayments.poswebMakePayment','Make POSweb payment'),(2036,'serviceClient.modified','The web services client was modified'),(2037,'alert.member.expiredLoan','Expired loan'),(2038,'message.type.ACCOUNT','General account events'),(2039,'menu.admin.alerts.errorLogHistory','Error history'),(2040,'menu.admin.settings.file','Import / Export'),(2041,'references.removeConfirmation','Remove this reference?'),(2042,'account.defaultCreditLimit','Lower credit limit'),(2043,'defaultBrokerCommission.updated','Commission settings updated'),(2044,'profile.modified.emailPending','The profile has been modified, but a confirmation e-mail has been sent to {0} in order to confirm the new e-mail address'),(2045,'changePassword.error.mustIncludeLettersNumbersSpecial','The password must be composed of letters, numbers and special characters'),(2046,'guaranteeType.title.listGuaranteeTypes','Guarantee types'),(2047,'invoice.invalid.schedulingDate','The invoice scheduling date must be before {0}'),(2048,'settings.access.title','Access settings'),(2049,'profile.action.payment','Make payment'),(2050,'payment.recipientUsername','Login (recipient)'),(2051,'permission.memberOperators.manage','Manage operators'),(2052,'loanGroup.errorRemoving','The loan group could not be removed.\nMake sure it has no loans in order to remove it.'),(2053,'customizedFile.newContentsNotification','There is a new (original) version of this customized file. Review it\'s content and check \"resolve conflicts\" before saving.'),(2054,'reports.stats.general.members','Members'),(2055,'help.title.operators','Operators'),(2056,'permission.operatorPayments.ticket','Generate external payment tickets'),(2057,'scheduledPayments.totalAmount','Total amount'),(2058,'transfer.calculatePayments','Calculate'),(2059,'permission.adminAdminAccess.transactionPassword','Manage transaction password'),(2060,'createAdmin.action.saveAndNew','Save and insert new administrator'),(2061,'settings.local.chargebacks','Chargebacks'),(2062,'scheduledPayments.totalPaid','Total paid'),(2063,'profile.action.manageLoginPassword','Manage login password'),(2064,'permission.brokerPos','POS'),(2065,'global.selectNone','Select none'),(2066,'permission.systemReports.current','State report'),(2067,'permission.brokerMemberPayments.paymentAsMemberToSystem','Payment as member to system'),(2068,'permission.adminMemberAccounts','Accounts'),(2069,'menu.member.personal.transactionFeedbacks','Feedback transactions'),(2070,'channel.title.insert','New channel'),(2071,'transactionPassword.NOT_USED','Not used'),(2072,'alert.removed','The selected alert(s) have been removed'),(2073,'permission.adminMemberBulkActions.changeGroup','Change group'),(2074,'permission.systemAccounts.view','View account management'),(2075,'guaranteeType.expireTodayMessage','0 means must expire in the same day'),(2076,'permission.adminMemberPayments.paymentWithDate','Member payment in past date'),(2077,'accountFee.error.mustRechargeOldestLogFirst','This fee execution cannot be recharged because there is an older execution which also failed.\n\nPlease, recharge the older one first.'),(2078,'manual.title.member','Cyclos manual'),(2079,'translationMessage.inserted','The translation key has been inserted'),(2080,'permission.brokerInvoices.denyAsMember','Deny as member'),(2081,'permission.operatorReports.view','View others reports'),(2082,'loan.repayment.transactionPassword.discardOnly','In order to discard this loan payment, you must supply your transaction password'),(2083,'loanGroup.title.modify','Modify loan group'),(2084,'externalAccount.tooltip.import','Transaction file imports'),(2085,'mobile.home.viewPayments','View Payments'),(2086,'customImage.system.icon','Shortcut icon'),(2087,'pendingMember.removed','The pending registration was removed'),(2088,'webshop.confirm.text','Please, check the data above and click the submit button below to confirm the payment'),(2089,'global.search','Search'),(2090,'adImport.invalidFormat','Invalid file format'),(2091,'changePin.error.sameAsLoginOrTransactionPassword','The pin cannot be the same as login or transaction password'),(2092,'loan.queryStatus.CLOSED','Closed / repaid'),(2093,'error.sendingMail','There was an error while sending a mail to {0}'),(2094,'profile.action.manageExternalAccess','External access'),(2095,'groupFilter.inserted','Group filter inserted'),(2096,'serviceOperation.ACCESS','Access informations'),(2097,'loan.repaidAmount','Repaid amount'),(2098,'settings.message.messageMailSuffixHtml','HTML mail body suffix'),(2099,'externalTransferType.title.list','Payment type'),(2100,'invoice.status.EXPIRED','Expired'),(2101,'theme.error.notSelected','No theme selected'),(2102,'group.account.action.new','Associate new account'),(2103,'customField.size','Field size'),(2104,'changeGroup.error.remove.activeMember','An active member cannot be removed.\nTry to move it to a REMOVED group'),(2105,'reports.stats.keydevelopments.numberOfMembers.yAxis','Number'),(2106,'serviceClient.credentialsRequired','Credentials required'),(2107,'permission.basic','Basic'),(2108,'externalTransferImport.error.importing','There was an error while importing the transaction file'),(2109,'reports.members.references.given','Given references'),(2110,'reports.stats.accountFeeFilters','Account Fees'),(2111,'reports.stats.activity.developments.numberOfTransactions','Number of transactions'),(2112,'alert.system.NEW_VERSION_OF_HELP_FILE','New version of help file'),(2113,'general.error.indexedRecordNotFound','A record which had been indexed no longer exists.\n\nPlease, ask the administration to recreate the search indexes '),(2114,'accountFee.disabled','Disabled'),(2115,'permission.systemRegistrationAgreements.view','View'),(2116,'adInterest.removeOne.confirm','Remove ad interest?'),(2117,'permission.systemSettings.file','Export / import to file'),(2118,'fileMapping.decimalSeparator','Decimal separator'),(2119,'message.category.choose','Please, choose a category'),(2120,'memberRecordType.layout','Search results layout'),(2121,'guaranteeType.creditFee.readonly','Read only'),(2122,'errors.unique','{0} is not unique'),(2123,'menu.admin.accounts.systemPayment','System Payment'),(2124,'group.initialGroupShow','Show as'),(2125,'createMember.password','Password'),(2126,'transferType.enabled','Enabled'),(2127,'payment.chargeback.transactionPassword','In order to chargeback this payment, you must supply your transaction password '),(2128,'global.close','Close'),(2129,'menu.admin.settings.log','Log Settings'),(2130,'smsMailing.mailingType.PAID_TO_GROUP','Paid mailing to group'),(2131,'transactionFee.error.removing','The transaction fee could not be removed because it was already charged'),(2132,'payment.action.chargeback','Chargeback'),(2133,'operator.lastLogin','Last login'),(2134,'permission.brokerMessages.view','View'),(2135,'permission.systemGroups.manageMember','Manage member group'),(2136,'reports.stats.keydevelopments.grossProduct.allTransactions','For all transactions'),(2137,'customField.possibleValue.value','Value'),(2138,'reports.members_reports.details_level','Details level'),(2139,'profile.action.references','View & give references'),(2140,'guaranteeType.enabled.tooltip','Guarantee type enabled'),(2141,'message.title.search','Message list'),(2142,'conversionSimulation.date','Conversion date'),(2143,'message.to','To'),(2144,'transferType.availability','Availibility'),(2145,'smsMailing.stillSending','Still sending...'),(2146,'alert.member.givenVeryBadRefs','The member has given {0} very bad references'),(2147,'guarantee.status.REJECTED','Rejected'),(2148,'invoice.accepted.withAuthorization','The invoice was accepted, but the payment still needs authorization to be processed'),(2149,'member.broker','Broker'),(2150,'menu.admin.usersGroups','Users & Groups'),(2151,'reports.stats.general.transferType.chooseOne','Choose one transfer type'),(2152,'adImport.status.SUCCESS','Success'),(2153,'alert.system.negativeVirtualRatedBalance','A negative virtual rated balance has been encountered on system account {0}.\nThe virtual rated balance has been set to 0, but the cause for this error should be checked.'),(2154,'permission.systemInvoices','Invoices'),(2155,'document.visibility','Visibility'),(2156,'pos.error.removing','The POS could not be removed because it belongs to a member\n or has a log associated'),(2157,'notificationPreferences.selectAll','All'),(2158,'externalAccountHistory.error.cannotMarkExternalTransferAsChecked','Only valid pending transfers can be marked as checked'),(2159,'customField.title.list.member','Member custom fields'),(2160,'menu.admin.ads.categories.file','Import / export categories'),(2161,'accountFee.runMode','Run mode'),(2162,'messageCategory.title.modify','Modify message category'),(2163,'global.timePeriod.WEEKS','Week(s)'),(2164,'translationMessage.title.importExport','Import / export translation keys'),(2165,'adImport.totalAds','Total advertisements'),(2166,'invoice.amount','Amount'),(2167,'guaranteeLog.by','Changed by'),(2168,'customField.member.memberCanHide','Member can hide'),(2169,'paymentObligation.usedAmount','Used amount'),(2170,'member.groupFilters','Groups'),(2171,'notificationPreferences.paidSmsLeft','You have {0} paid SMS messages left (expire at {1})'),(2172,'menu.admin.alerts','Alerts'),(2173,'activities.ads','Products & services'),(2174,'certification.removeConfirmation','Remove Certification?'),(2175,'login.username','Account ID'),(2176,'settings.local.memberResultDisplay.NAME','Member name'),(2177,'ad.maxPicturesMessage','This advertisement already have the maximum allowed pictures'),(2178,'customField.memberRecord.showInSearch','Show in search'),(2179,'settings.access.virtualKeyboardTransactionPassword','Virtual keyboard for transaction password'),(2180,'profile.userAllowedToLogin','User is now allowed to login'),(2181,'conversionSimulation.transferType','Transfer type'),(2182,'settings.local.language.ENGLISH','English'),(2183,'menu.member.logout','Logout'),(2184,'customField.orderModified','The field order was modified'),(2185,'global.weekDay.SUNDAY','Sunday'),(2186,'customImage.title.new.custom','New custom image'),(2187,'paymentFilter.transferTypes','Transaction types'),(2188,'externalAccount.name','Name'),(2189,'externalTransferType.removeConfirmation','Remove payment type?'),(2190,'settings.message.commissionContractDenied','Commission contract denied'),(2191,'permission.adminAdmins.remove','Remove'),(2192,'permission.memberPayments','Payments'),(2193,'payment.authorized','The payment has been authorized'),(2194,'payment.title.confirm','Transaction confirmation'),(2195,'loan.queryStatus.AUTHORIZATION_DENIED','Authorization denied'),(2196,'alert.system.rateInitializationFinished','Rate initialization job on currency {0} finished for the following rates:\n{1}'),(2197,'permission.module.type.OPERATOR','Operator permissions of {0}'),(2198,'permission.memberDocuments','Documents'),(2199,'menu.operator.member.activities','Reports'),(2200,'transfer.paymentCount','Payment count'),(2201,'reports.stats.general.table','Table'),(2202,'quickAccess.searchAds','Search ads'),(2203,'menu.admin.ads.categories','Manage Categories'),(2204,'menu.admin.settings.message','Message Settings'),(2205,'error.rateParameters.creationExpirationSmallerThanEmission','Creation Value of D-rate must be greater than creation value of A-rate.'),(2206,'posLog.status','Status'),(2207,'reports.members_reports.transactions.transactionModeRequired','It\'s necessary to select debit or credit transactions'),(2208,'currency.symbol','Symbol'),(2209,'image.details.error','The image details could not be saved'),(2210,'message.action.RESTORE','Restore'),(2211,'invoice.date','Date'),(2212,'adCategory.title.modify','Modify advertisement category'),(2213,'loan.title.search','Search loans'),(2214,'reports.stats.chooseStatistics','Please choose reports to be shown'),(2215,'guarantee.title.guaranteeDetails','Guarantee details'),(2216,'changeBroker.changed','The broker was changed'),(2217,'memberImport.lineNumber','Line #'),(2218,'group.title.modify.member','Edit member group settings'),(2219,'permission.memberPreferences.manageReceiptPrinterSettings','Manage receipt printers'),(2220,'message.type.AD_INTEREST','Ad interests notifications'),(2221,'reports.stats.finances.ThroughTime.income','Income'),(2222,'reports.members.ads.active','Active'),(2223,'changePin.error.invalidTransactionPassword','Incorrect transaction password'),(2224,'externalTransferType.action.CONCILIATE_PAYMENT','Conciliate payment'),(2225,'channel.credentials.CARD_SECURITY_CODE','Card security code'),(2226,'permission.adminMemberPos.assign','Assign'),(2227,'conversionSimulation.result.graph.yAxis','Fee amount'),(2228,'customField.control.TEXT','Text box'),(2229,'reports.stats.activity.developments','Developments '),(2230,'permission.adminMemberReports','Activities report'),(2231,'channel.enableSMSLinkTo','notifications'),(2232,'adImport.status.INVALID_COLUMN','Invalid column: {0}'),(2233,'invoice.status.DENIED','Denied'),(2234,'transfer.channel','Payment through'),(2235,'mobile.viewPayments.related','User'),(2236,'memberImport.status.INVALID_UPPER_CREDIT_LIMIT','Invalid upper credit limit: {0}'),(2237,'guaranteeType.issueFee.readonly','Read only'),(2238,'reports.stats.taxes.paid.both','Both'),(2239,'paymentObligation.status.EXPIRED','Expired'),(2240,'message.error.memberCannotReceive','The message could not be sent because the member chose not to receive messages'),(2241,'settings.local.memberSortOrder','Sort order for member result lists'),(2242,'adCategory.imported','The categories were successfully imported'),(2243,'settings.message.adminNewMember','New member registration'),(2244,'permission.memberMessages.manage','Manage'),(2245,'group.customizedFiles.customized','The file is now customized for this group'),(2246,'adminTasks.indexes.status.CORRUPT','Corrupt'),(2247,'permission.systemReports.smsLogs','Sent SMS messages'),(2248,'registrationAgreement.title.accept','Registration agreement'),(2249,'changeGroup.admin.permanentlyRemovedMessage','The administrator has been permanently removed'),(2250,'transactionFee.fromGroups','From groups'),(2251,'reports.stats.activity.comparePeriods.grossProduct.yAxis','Gross Product'),(2252,'settings.message.title.edit','Edit notification'),(2253,'group.account.title.modify','Modify account settings for group {0}'),(2254,'customImage.system.message_unread','Unread message icon'),(2255,'createMember.initialGroup.preface.byBroker','Please, choose the group for the new member'),(2256,'permission.adminMemberCards','Cards'),(2257,'reports.stats.activity.topten.numberTransactions.title','Top ten of number of transactions per number'),(2258,'changeGroup.member.expired','Registration on group has expired'),(2259,'reports.members.accounts.credits','Lower credit limits'),(2260,'settings.local.memberSortOrder.ALPHABETICAL','Alphabetical'),(2261,'permission.adminMemberInvoices.acceptAsMemberFromSystem','Accept invoice from system as member'),(2262,'infoText.errorRemoving','The info text could not be removed'),(2263,'memberImport.file','CSV file'),(2264,'reports.stats.finances.balance','Balance'),(2265,'guaranteeType.registerGuarantee','Register guarantee'),(2266,'messageCategory.modified','The message category was modified'),(2267,'customField.parent','Parent field'),(2268,'brokerCommission.inserted','The broker commission was inserted '),(2269,'customImage.system.view','View icon'),(2270,'transactionFee.toGroups','To groups'),(2271,'infotext.active','Active'),(2272,'permission.memberMessages.sendToMember','Send to member'),(2273,'ticket.date','Date'),(2274,'document.visibility.MEMBER','Member'),(2275,'permission.adminAdminRecords.delete','Delete'),(2276,'global.title.results','Results'),(2277,'adminTasks.indexes.status.MISSING','Missing'),(2278,'externalTransferProcess.title','Process payments on {0}'),(2279,'sms.error.type.NO_SMS_LEFT','No messages left'),(2280,'transfer.submitDate','Submitted at'),(2281,'memberRecordType.title.list','Member record types'),(2282,'cardLog.date','Date'),(2283,'brokerCommissionContract.action.remove','Remove'),(2284,'reports.stats.general.selectMulti','Select one or more'),(2285,'transactionPassword.action.block','Block transaction password'),(2286,'groupFilter.customizedFiles.title.new','Customize new file for {0}'),(2287,'menu.admin.accessDevices.cardType.manage','Manage card types'),(2288,'permission.systemGroupFilters','Group filters'),(2289,'customField.type.STRING','String'),(2290,'settings.local.csv.useHeader','Show header'),(2291,'permission.systemStatus.viewConnectedOperators','View connected operators'),(2292,'permission.memberDocuments.view','View'),(2293,'accountType.action.new','Insert new account'),(2294,'guaranteeType.loanTransferType','Loan'),(2295,'customField.title.modify.payment','Modify custom field for {0}'),(2296,'account.defaultUpperCreditLimit','Upper credit limit'),(2297,'authorizationLevel.error.maxLevel','It\'s not possible to insert more than {0} authorization levels'),(2298,'changeGroup.member.permanentlyRemovedMessage','The member has been permanently removed'),(2299,'permission.operatorLoans.repay','Repay'),(2300,'reports.stats.keydevelopments.averageAmountPerTransaction.yAxis','Average amount / trans.'),(2301,'customField.control.RICH_EDITOR','Rich text editor'),(2302,'reports.stats.finances.overview','Overview'),(2303,'theme.theme','Theme'),(2304,'reports.members.print_btn','Print report'),(2305,'transferAuthorization.by','Performed by'),(2306,'adInterest.modified','Ad interest modified'),(2307,'group.settings.smsAdditionalCharged','Additional charged SMS package'),(2308,'customImage.system.quickAccess_contacts','Quick access: contacts'),(2309,'memberImport.accountType','Account type'),(2310,'conversionSimulation.aRate.targeted','Targeted A rate'),(2311,'brokerCommissionContract.startDate.to','To'),(2312,'memberImport.processed','The members were successfuly imported'),(2313,'reports.transactions_report.credits','credits'),(2314,'member.bulkActions.changeBroker.confirmation','Are you sure to change the broker of all members matching the filters?'),(2315,'mobile.payment.error.maxAmountPerDay.at','You have already reached the maximum amount at {1}'),(2316,'guaranteeType.error.removing','Error removing guarantee type. Should be exist a guarantee or certification using this one.'),(2317,'ad.print.since','Published since'),(2318,'reports.stats.general.period','Period'),(2319,'menu.admin.usersGroups.admins','Manage Admins'),(2320,'menu.member.broker.brokerCommissionContracts','Commission contracts'),(2321,'reports.stats.finances.singlePeriod.overview.title','Overview System account'),(2322,'accountType.title.new','New account'),(2323,'permission.operatorLoans.view','View'),(2324,'login.registration.title','Don\'t have a login name yet?'),(2325,'payment.status.BLOCKED','Blocked'),(2326,'error.accessDenied','Access Denied'),(2327,'manual.title.stats','Cyclos statistics manual'),(2328,'adminTasks.indexes.title','Manage indexes'),(2329,'transferType.invalidDestinationType','The currency of the destination account type can not be diferent from the currency of the source account type'),(2330,'customField.title.insert.ad','New advertisement custom field'),(2331,'settings.message.expiredGuarantee','Expired guarantee'),(2332,'reports.stats.general.nodata','Too little data (or no data at all) avaialble for this item. '),(2333,'changeBroker.suspendCommission','Suspend commission '),(2334,'settings.mailTranslation.modified','The mail translation was modified'),(2335,'adImport.file','CSV file'),(2336,'permission.adminMemberGuarantees.cancelCertificationsAsMember','Cancel certifications'),(2337,'loanPayment.summary.paymentsToReceive','Payments to receive'),(2338,'reports.stats.activity.title','Statistics of activities...'),(2339,'posweb.action.searchTransactions','Transactions'),(2340,'brokering.status.ACTIVE','Active'),(2341,'guarantee.validity','Validity'),(2342,'posLog.assignTo','Assign to'),(2343,'permission.systemChannels','Channels'),(2344,'invoice.cancelConfirmationMessage','Cancel outgoing invoice to {0} of {1}?\n\nPlease click OK to confirm.'),(2345,'errors.pageNotFound','The page you tried to access was not found'),(2346,'guarantee.issueFee','Issue fee'),(2347,'errorLog.path','Path'),(2348,'disconnect.error.notConnected','The user is no longer connected'),(2349,'reports.stats.keydevelopments.throughTime.months','Through months'),(2350,'reports.stats.activity.comparePeriods.loginTimes.yAxis','Logins / member'),(2351,'permission.adminAdminRecords','Administrator records'),(2352,'posLog.title','POS Log'),(2353,'customField.payment.access.TO_ACCOUNT','For the destination account only'),(2354,'menu.admin.reports.simulations','Simulations'),(2355,'guaranteeType.fee.value','Value'),(2356,'profile.action.message','Send message'),(2357,'reports.members_reports.member_groups','Member groups'),(2358,'loan.totalAmount','Total amount'),(2359,'transfer.commision.broker.notcommision','There are no commisions'),(2360,'registrationAgreement.contents','Contents'),(2361,'reports.stats.keydevelopments.throughTime.selectYears','Select years'),(2362,'loan.repayment.amountToRepaid','Amount'),(2363,'permission.systemServiceClients.manage','Manage'),(2364,'transferType.requiresAuthorization','Requires authorization'),(2365,'loan.group.personal','Personal'),(2366,'permission.adminMemberGuarantees.viewGuarantees','View guarantees'),(2367,'changePin.newPin','New pin'),(2368,'reference.from','From'),(2369,'customField.member.indexing.MEMBERS_ONLY','Members only'),(2370,'permission.systemReports.dRateConfigSimulation','D-rate configuration simulation'),(2371,'reports.current.invoices','Invoices'),(2372,'defaultBrokerCommission.validity.always','Always'),(2373,'loan.queryStatus.PENDING_AUTHORIZATION','Pending authorization'),(2374,'message.date','Date'),(2375,'reports.members.date.empty','Date and time must be informed'),(2376,'settings.log.modified','The log settings were modified'),(2377,'posweb.error.channelDisabled','The given member cannot access the posweb channel'),(2378,'accountFeeLog.neverRan','Never ran'),(2379,'currency.name','Name'),(2380,'paymentObligation.status.CANCELED','Canceled'),(2381,'customImage.error.wrongType','{0} must be of type {1}'),(2382,'error.iRateParameters.notOffLine','The I-rate has not been enabled, because the system must be set off-line,\n as this may be a heavy task on big databases.\n\n You can set the system off-line via the menu: settings > system tasks.'),(2383,'loan.firstExpirationDate','First expiry date'),(2384,'mailPreferences.systemAlert','System alerts'),(2385,'permission.adminMemberPayments','Member payments'),(2386,'createMember.public.errorSendingMail','Sorry, but there was an error while sending the e-mail to validate the account.\n\nPlease, try again later.'),(2387,'profile.action.invoices','View invoices'),(2388,'settings.message.cardSecurityCodeBlocked','Card security code blocked by invalid trials'),(2389,'menu.admin.usersGroups.pendingMembers','Pending members'),(2390,'transferType.removed','The transaction type was removed'),(2391,'adInterest.removed','Ad interest removed'),(2392,'guaranteeType.removed','The guarantee type was removed '),(2393,'profile.pendingEmailLastSent','Last e-mail sent at {0}'),(2394,'member.search.allGroupFilters','All group filters'),(2395,'category.order.alpha','Sort by alphabetical order'),(2396,'reports.current.n_schedads','Number of scheduled advertisements'),(2397,'card.action.unblock','Unblock'),(2398,'createMember.assignPassword','Assign password'),(2399,'help.title.content_management','Content Management'),(2400,'mobile.payment.amount','Amount'),(2401,'createMember.created','The member has been created'),(2402,'alert.system.nullIRate','I-rate had unexpected null for account {0}. You may want to reinitialize the i-rate.'),(2403,'member.bulkActions.error.emptyQuery','You should select at least one filter'),(2404,'theme.title.select','Theme selection'),(2405,'adCategory.children','Child categories'),(2406,'pos.status','Status'),(2407,'externalTransferImport.chooseFile','Transaction file'),(2408,'adInterest.type','Type'),(2409,'member.bulkActions.generateCard','Generate card'),(2410,'permission.memberReferences.view','View'),(2411,'alert.system.adminTransactionPasswordBlockedByTries','The transaction password of admin \'{0}\' is now blocked by exceeding maximum amount of tries ({1}). The remote IP address is {2}'),(2412,'smsMailing.mailingType.FREE_TO_GROUP','Free mailing to group'),(2413,'paymentObligation.buyerUsername','Buyer login'),(2414,'authorizationLevel.inserted','Authorization level inserted'),(2415,'memberImport.status.INVALID_USERNAME','Login name is invalid: {0}'),(2416,'error.loggedOut','You have been logged out from the system.'),(2417,'account.iRate','I rate'),(2418,'memberImport.initialCreditTransferType','Payment type for positive balances'),(2419,'scheduledPayments.searchType.OUTGOING','Outgoing'),(2420,'group.settings.pinBlockTimeAfterMaxTries','Pin block time after max tries'),(2421,'settings.log.scheduledTaskLevel.ERRORS','Errors only'),(2422,'permission.brokerMembers.changeEmail','Change e-mail'),(2423,'transactionFee.fInfinite','Value at infinite asymptote'),(2424,'customField.title.order.loanGroup','Set loan group custom field order'),(2425,'permission.adminMemberLoans.repayWithDate','Repay loan in past date'),(2426,'receiptPrinterSettings.new','Insert new'),(2427,'sms.type.REQUEST_PAYMENT.description','Request payment'),(2428,'connectedUsers.nature.select','Please, select user type'),(2429,'permission.memberInvoices.sendToMember','Send to member'),(2430,'customField.possibleValue.title.insert','Insert value'),(2431,'certification.status','Status'),(2432,'settings.action','Action'),(2433,'memberImport.initialDebitTransferType.empty','Ignore negative balances'),(2434,'member.generateCard.confirmation','Generate a card for {0}?'),(2435,'externalTransferType.action.GENERATE_MEMBER_PAYMENT','Generate payment to member'),(2436,'document.removed','The document was removed'),(2437,'session.loggedAs','Logged user: {0}'),(2438,'card.changeCardCode.confirmation','Change security card code?'),(2439,'payment.error.transferMinimum','The amount to transfer is less than the allowed minimum ({0}).'),(2440,'payment.chargedBack','The payment was charged back'),(2441,'guarantee.buyerUsername','Buyer login'),(2442,'customImage.system.mobileSplash_medium','Mobile: medium splash image'),(2443,'settings.access.generatedUsernameLength','Generated login length'),(2444,'certification.usedAmount','Used amount'),(2445,'menu.member.guarantees','Guarantees'),(2446,'payment.error.ratesRequiresLocksOnAllAccounts','With rates enabled, all accounts need to be locked.\nContact the organization in order to correctly set the needed cyclos properties for this. '),(2447,'settings.message.brokeringRemoved','Brokering manually removed'),(2448,'brokerCommission.action.unsuspend','Unsuspend'),(2449,'smsMailing.mailingType.FREE_FROM_BROKER','Free from broker'),(2450,'transfer.date','Date'),(2451,'card.status.securityCodeBlocked','Card security code is blocked'),(2452,'adImport.status.MISSING_TITLE','Missing title'),(2453,'guarantee.starts','Starts'),(2454,'memberRecordType.removeConfirmation','Remove this member record type?'),(2455,'errorLog.loggedUser','Logged user'),(2456,'posweb.target.name','Name (recipient)'),(2457,'settings.message.brokerRemovedRemarkComments','Broker removed remark'),(2458,'smsMailing.sendType.group','To group'),(2459,'memberRecord.search.noResults','No {0} were found'),(2460,'reference.action.remove','Remove'),(2461,'card.blocked','Card blocked'),(2462,'permission.brokerInvoices.sendAsMemberToSystem','Send as member to system'),(2463,'adImport.title.details.success','Advertisements successfully imported'),(2464,'receiptPrinterSettings.localPrinter','Print on this computer using'),(2465,'accountFee.chargeMode.NEGATIVE_BALANCE_PERCENTAGE','Negative balance percentage'),(2466,'adminTasks.indexes.status.ACTIVE','Active'),(2467,'customImage.title.custom','Custom images'),(2468,'accountFee.firstPeriodAfter','Enabled since'),(2469,'card.expirationPeriod.from','Expire from'),(2470,'memberRecordType.showMenuItem','Show menu item'),(2471,'transactionFee.chargeType.MIXED_A_D_RATES','Mixed A and D rates'),(2472,'permission.systemDocuments.manage','Manage'),(2473,'ad.title.of','Advertisements of {0}'),(2474,'transferType.loanParameters','Loan parameters'),(2475,'reports.stats.general.perMember','per member'),(2476,'accountType.limitType.LIMITED','Limited'),(2477,'loan.group.members','Members in group'),(2478,'changeGroup.operator.permanentlyRemovedMessage','The operator has been permanently removed'),(2479,'home.admin.status.systemUptime','Application uptime'),(2480,'alert.member.EXPIRED_LOAN','Expired loan'),(2481,'alert.system.maxIncorrectLoginAttempts','Maximum login attempts ({0}) with incorrect username reached from IP {1}'),(2482,'accountFee.freeBase','Free base'),(2483,'ad.title.my','My advertisements'),(2484,'fileMapping.columnSeparator','Column separator'),(2485,'brokerCommissionContract.search.noResults','No contracts were found'),(2486,'accountOverview.title.system','System accounts'),(2487,'externalTransferProcess.loanDescription','#{0}, at {1}, of {2}'),(2488,'infoText.nomatch.subject','No match for message with key: {0}.'),(2489,'profile.operator.title.of','Profile of {0}'),(2490,'global.weekDay.short.MONDAY','Mon'),(2491,'message.type.CERTIFICATION','Certifications'),(2492,'loanGroup.title.addMember','Add {0} to loan group'),(2493,'reports.transactions_report.system_to_member_invoices','{0} of system to member invoices: {1}'),(2494,'member.lastLogin','Last login'),(2495,'menu.operator.account.accountInformation','Account Information'),(2496,'group.rootUrl','Application root URL'),(2497,'accountFeeLog.fee','Account fee'),(2498,'permission.adminMemberGuarantees.acceptGuaranteesAsMember','Accept guarantees'),(2499,'reports.stats.activity.histogram.logins','Histogram of logins per member'),(2500,'transferAuthorization.authorizerAdmin','Authorizer'),(2501,'transfer.totalAmount','Total amount'),(2502,'reports.stats.activity.throughTime.numberTransactions','Number of Transactions per member'),(2503,'transfer.firstPaymentDate','First payment date'),(2504,'account.transactionPasswordRequired','Require transaction password'),(2505,'payment.title.memberToMember','Payment to member'),(2506,'transactionFee.whichBroker.DESTINATION','Receiving member\'s broker'),(2507,'account.status.ACTIVE','Active'),(2508,'reports.stats.general.graph.selectAll','Select all graphs'),(2509,'conversionSimulation.result.graph.subtitle','Conversion amount: {0}'),(2510,'payment.authorizeConfirmationMessage','You are going to authorize this payment.\n\nPlease click OK to confirm'),(2511,'mobile.viewPayments.title','View Payments'),(2512,'profile.operator.title.my','My profile'),(2513,'permission.memberPayments.paymentToSystem','System payments'),(2514,'reports.error.formDisplayError','Error displaying the form'),(2515,'theme.import.successful','The theme was successfully imported'),(2516,'settings.message.sms','SMS message'),(2517,'pos.pinChanged','The PIN was updated'),(2518,'card.group','Group'),(2519,'adCategory.alterOrder','Alter order'),(2520,'payment.confirmation.header','You are about to perform the following payment:'),(2521,'permission.adminMemberPayments.authorize','Authorize payments'),(2522,'permission.memberAccess.unblockPin','Unblock pin'),(2523,'reports.stats.taxes.paid.notPaid','Not Paid'),(2524,'permission.systemCurrencies.view','View'),(2525,'posweb.printReceipt','Payment successful. Click here or press F4 to print receipt'),(2526,'transactionPassword.action.reset','Reset transaction password'),(2527,'transactionFee.title.simple.insert','Insert transaction fee'),(2528,'message.action.confirmDelete','Are you sure to permanently remove the messages?'),(2529,'group.settings.emailValidation','E-mail validation'),(2530,'settings.message.adInterest','Ad interest'),(2531,'quickAccess.makePayment','Payment'),(2532,'global.weekDay.FRIDAY','Friday'),(2533,'customField.ad.visibility.WEB_SERVICE','Brokers and webservices'),(2534,'loan.title.details','Loan details'),(2535,'transactionPassword.generated','Your transaction password is:'),(2536,'alert.type.SYSTEM','System'),(2537,'settings.neverAlertMessage','0 never alerts'),(2538,'memberRecord.error.removing','Error removing {0}'),(2539,'customImage.system.quickAccess_searchMembers','Quick access: search members'),(2540,'settings.local.csv','CSV export'),(2541,'permission.adminMemberLoanGroups.view','View'),(2542,'reports.stats.activity.topten.andMore','(... and {0} more members with same score...)'),(2543,'transactionFee.gFIsZero','reaches 0% after x % of guarantee passed'),(2544,'error.systemOverloaded','The system is currently above it\'s capacity.\n\nPlease, try again in a few minutes.'),(2545,'home.status.paymentsAwaitingFeedback','You have {0} payments awaiting feedback'),(2546,'home.admin.status.unreadMessages','Unread messages'),(2547,'home.admin.status.systemAlerts','Number of system alerts'),(2548,'brokerCommissionContract.title.insert','Insert broker commission contract'),(2549,'translationMessage.import.type','What to do'),(2550,'customField.type.FLOAT','Decimal number'),(2551,'quickAccess.title','Quick access'),(2552,'errors.periodEndRequired','End date of {0} is required'),(2553,'permission.systemMemberRecordTypes.manage','Manage'),(2554,'loanPayment.status','Status'),(2555,'paymentFilter.removeConfirmation','Remove this payment filter?'),(2556,'connectedUsers.noOperators','There are no operators currently logged in'),(2557,'accountHistory.conciliation.conciliationStatus','Conciliation status'),(2558,'global.pagination.tooltip.previous','Previous page'),(2559,'transferAuthorization.title.list','Authorized transaction actions'),(2560,'permission.adminMemberPayments.cancelScheduledAsMember','Cancel scheduled payment as member'),(2561,'settings.log.webServiceLevel.ERRORS','Errors only'),(2562,'payment.newPayment','Make new payment'),(2563,'group.settings.passwordTries.deactivationTime','Deactivation time after max password tries'),(2564,'memberPos.changePin.notEqual','PIN are not equal'),(2565,'brokering.status','Status'),(2566,'mobile.error.inactiveUser','You have not been activated yet, contact the Administration'),(2567,'permission.adminMemberSms','SMS logs'),(2568,'pos.discardPos.confirmation','Discard POS?'),(2569,'guaranteeType.model.WITH_PAYMENT_OBLIGATION','With payment obligation'),(2570,'memberRecord.title.search.global','Search {0}'),(2571,'externalTransfer.removed','External transfer removed'),(2572,'memberImport.status.MISSING_NAME','Name is missing'),(2573,'alert.system.indexRebuildEnd','Search index rebuilding for {0} was finished at {1}'),(2574,'customImage.thumbnail','Thumbnail'),(2575,'transfer.title.details','Transaction details'),(2576,'authorizationLevel.title.list','Authorization levels'),(2577,'accountFeeLog.totalCollectedAmount','Total collected amount'),(2578,'settings.message.pinBlocked','PIN blocked by invalid trials'),(2579,'guaranteeType.issueFeeTransferType','Issue fee'),(2580,'adCategory.new','Insert new category'),(2581,'message.type.FROM_MEMBER','Messages from members'),(2582,'webshop.confirm.transactionPassword','In order to confirm this payment, please, supply your transaction password'),(2583,'brokerCommissionContract.denied','The broker commission contract was denied'),(2584,'notificationPreferences.acceptPaidMailing','Accept charged SMS mailings'),(2585,'customizedFile.name','File name'),(2586,'settings.message.member.title','Member notifications'),(2587,'externalTransferImport.title.import','Import transactions for {0}'),(2588,'transfersAwaitingAuthorization.onlyWithoutBroker','Only if brokers can\'t authorize'),(2589,'accountFeeLog.totalInvoices','Total invoices'),(2590,'menu.admin.settings.alert','Alert Settings'),(2591,'memberImport.status.MISSING_RECORD_FIELD','{0} is missing'),(2592,'createMember.public.alreadyExists','The login name is already in use, please choose another one.'),(2593,'account.status.INACTIVE','Inactive'),(2594,'mobile.viewPayments.date','Date'),(2595,'invoice.title.system','System invoices'),(2596,'global.month.OCTOBER','October'),(2597,'home.admin.status.refresh','Refresh'),(2598,'invoice.title.details','Invoice details'),(2599,'menu.operator.personal.profile','Profile'),(2600,'loan.repayment.discard.payment.confirmationMessage','Are you sure to discard this payment?'),(2601,'reference.removed','Reference removed'),(2602,'alert.system.rateInitializationStarted','Rate initialization job on currency {0} started for the following rates:\n{1}'),(2603,'changeGroup.title.history','History'),(2604,'reports.stats.keydevelopments.transactionAmount','Amount per transaction'),(2605,'accountType.limitType','Limit type'),(2606,'permission.brokerInvoices.cancelAsMember','Cancel as member'),(2607,'transfer.chargebackOf','Chargeback of'),(2608,'customizedFile.title.preview','Preview of {0}'),(2609,'transferType.error.hasPendingPayments','This payment type cannot have authorization removed because there are pending payments'),(2610,'customImage.system.conciliated','External payment: conciliated'),(2611,'guaranteeType.creditFee','Credit fee'),(2612,'reports.stats.finances.singlePeriod.income','Income'),(2613,'permission.brokerInvoices.acceptAsMemberFromSystem','Accept invoice from system as member'),(2614,'menu.member.account.systemPayment','System Payment'),(2615,'pos.actions.changeParameters','Change parameters'),(2616,'profile.action.byMember.title','Member actions for {0}'),(2617,'changePassword.resetAndSent','The password was reset and sent to member'),(2618,'invoice.denyConfirmationMessage','Deny incoming invoice from {0} of {1}?\n\nPlease click OK to confirm.'),(2619,'group.settings.cardType','Card type'),(2620,'guarantee.expirationTimeForIssuer','Expiration time for issuer'),(2621,'guarantee.listGuaranteeTypes','Guarantee types list'),(2622,'changePassword.resetAndSend','Reset password & send by e-mail'),(2623,'changePassword.newPasswordConfirmation','Confirm new password'),(2624,'customField.possibleValue.removeConfirmation','Remove this value?'),(2625,'changeGroup.member.changed','The member\'s group was changed'),(2626,'account.upperCreditLimit','Upper credit limit'),(2627,'message.category','Category'),(2628,'transferType.defaultFeedbackComments','Feedback comments on expiration'),(2629,'smsLog.messageType','Notification type'),(2630,'accountFee.title.insert','Insert account fee'),(2631,'permission.adminMemberAccounts.scheduledInformation','View scheduled payments'),(2632,'settings.local.language.CHINESE_SIMPLIFIED','Chinese (Simplified)'),(2633,'loan.repayment.transactionPassword.repayOnly','In order to repay this loan, you must supply your transaction password'),(2634,'externalTransfer.status.CHECKED','Checked'),(2635,'invoice.acceptConfirmationMessage.fees','If you accept the invoice, the following fees will be applied: '),(2636,'defaultBrokerCommission.status.SUSPENDED','Suspended'),(2637,'currency.error.pattern','must include #amount#, which will be replaced by the actual amount'),(2638,'customField.payment.access.BOTH_ACCOUNTS','For both accounts'),(2639,'global.datePattern.day','dd'),(2640,'errors.periodExpired','All the {0} period can\'t be before the current date'),(2641,'menu.member.account.systemInvoice','System Invoice'),(2642,'settings.message.paymentObligationRegistered','New payment obligation published'),(2643,'group.settings.maxAdPublicationTime','Max ad publication time'),(2644,'posweb.searchTransactions.title','Transactions list'),(2645,'permission.adminMembers.changeName','Change full name'),(2646,'reports.members_reports.system_invoices.paymentFilterRequired','To show system invoices, it\'s necessary to choose at least one payment filter'),(2647,'reports.stats.activity.throughTime.numberTransactions.title','Number of Transactions per member through the time'),(2648,'pos.title.insert','Insert POS'),(2649,'adInterest.title','Interest name'),(2650,'invite.sent','Invitation mail sent to {0}'),(2651,'paymentObligation.buyer','Buyer'),(2652,'adCategory.navigator.root','Main category'),(2653,'permission.systemServiceClients','Web services clients'),(2654,'customField.title.insert.loanGroup','New loan group custom field'),(2655,'sms.error.type.NOT_ENOUGH_FUNDS','Not enough funds'),(2656,'ad.search.action.toggleFilter','Filters'),(2657,'reports.stats.choose.miscellaneous','Miscellaneous statistics'),(2658,'settings.log.webServiceLevel.SIMPLE','Simple tracing (no parameters)'),(2659,'group.account.modified','The group account was modified'),(2660,'reports.stats.taxes.numberOfCharges','Charges'),(2661,'group.customizedFiles.modified','The file has been modified for this group'),(2662,'conversionSimulation.title.of','Conversion simulation for {0}'),(2663,'reports.stats.activity.comparePeriods.numberTransactions.row2.short','all'),(2664,'permission.memberSms.view','View'),(2665,'certification.title.search','Search Certifications'),(2666,'permission.systemErrorLog','Error log'),(2667,'menu.admin.contentManagement.manageThemes','Themes'),(2668,'brokerCommissionContract.title.list','Broker commission contracts'),(2669,'paymentObligation.pack.paymentObligationPeriod','Max. period between obligations:'),(2670,'invoice.accepted','The invoice was accepted'),(2671,'settings.message.loanExpiration','Loan expiry'),(2672,'rates.i','I-rate'),(2673,'brokerCommissionContract.action.accept','Accept'),(2674,'rates.reinitialize','Re-initialize rates'),(2675,'adImport.status.MISSING_DESCRIPTION','Missing description'),(2676,'home.admin.status.openInvoices','Open system invoices'),(2677,'rates.d','D-rate'),(2678,'icon.title.conciliated','Payment conciliated'),(2679,'rates.a','A-rate'),(2680,'channel.defaultPrincipal','Default user identification'),(2681,'transfer.fromOrTo','From / to'),(2682,'settings.message.pendingPaymentCanceled','Pending payment canceling'),(2683,'reports.stats.activity.comparePeriods.numberTransactions.row2','Number of Transactions over all members'),(2684,'conversionSimulation.title.my','Conversion simulation'),(2685,'reports.stats.activity.comparePeriods.numberTransactions.row1','Number of Transactions per trading member'),(2686,'invoice.status','Status'),(2687,'payment.recipient','Recipient'),(2688,'customImage.system.print','Print icon'),(2689,'settings.local.numberLocale','Number format'),(2690,'transferType.availability.DISABLED','Disabled'),(2691,'login.pin','Pin'),(2692,'help.title.access_devices','Access devices'),(2693,'contact.title.list','Contact list'),(2694,'guaranteeType.pendingGuaranteeExpiration','Max pending guarantee period'),(2695,'settings.local.deleteMessagesOnTrashAfter','Delete messages on trash after'),(2696,'settings.local.applicationName','Application name'),(2697,'guaranteeType.enabledGuaranteeType','Enabled'),(2698,'loan.repayment.transactionPassword.repayOrDiscard','In order to repay or discard this loan payment, you must supply your transaction password'),(2699,'settings.message.expiredCertification','Expired certification'),(2700,'createOperator.passwordConfirmation','Confirm password'),(2701,'brokerCommissionContract.brokerCommission','Commission type'),(2702,'settings.local.maxIteratorResults','Max. printed lines'),(2703,'changePassword.error.mustBeAlphaNumeric','The password can only contain letters or numbers'),(2704,'permission.brokerCards.view','View'),(2705,'paymentObligation.sellerUsername','Seller login'),(2706,'transfer.Conciliated','Conciliated'),(2707,'changeGroup.operator.confirmPermanentRemove','Remove operator permanently?'),(2708,'menu.admin.usersGroups.connectedUsers','Connected users'),(2709,'document.name','Name'),(2710,'invoice.action.deny','Deny'),(2711,'document.title.modify','Modify document'),(2712,'permission.adminMemberGuarantees','Guarantees'),(2713,'smsMailing.sendType','Send type'),(2714,'group.customizedFiles.title','Customized files'),(2715,'accountFeeLog.finished','Finished'),(2716,'group.settings.maxAdImagesPerMember','Max images per ad'),(2717,'permission.memberPayments.cancelScheduled','Cancel scheduled payment'),(2718,'member.title.search','Search members'),(2719,'reports.members.members','Members'),(2720,'global.tooltip.remove','Remove'),(2721,'externalTransferType.title.modify','Modify payment type'),(2722,'certification.title.modify','Modify Certification'),(2723,'memberPos.name','POS name'),(2724,'settings.local.emailUnique','E-mail should be unique'),(2725,'reference.level.NEUTRAL','Neutral'),(2726,'mobile.viewPayments.noPayment','You have no payments'),(2727,'customField.title.modify.member','Modify member custom field'),(2728,'externalAccountHistory.transferImport.title','Transactions of {0} imported at {1}'),(2729,'profile.action.paymentAsMemberToMember','Payment member to member'),(2730,'receipt.transfer.transactionNumber','Transaction nr: {0}'),(2731,'currency.dRate.initValue','Initialization value D-rate'),(2732,'paymentRequest.search.empty','You don\'t have any payment requests for the given filters'),(2733,'memberImport.title.details.success','Members successfully imported'),(2734,'member.loanGroups','Loan groups'),(2735,'reports.stats.general.maxItemsExceded','You\'ve exceeded the maximum of data you may request.\nRequesting this much may cause a too high load on the server.\nPlease limit your request; see help for details.\nMaximum number of datapoints is {0}; number presently requested was {1}.'),(2736,'reference.title.received','Received references for {0}'),(2737,'scheduledPayments.searchType','Search type'),(2738,'reports.stats.keydevelopments.numberOfMembers.title','Developments in number of members'),(2739,'brokerCommission.unsuspendConfirmation','Do you want to unsuspend this commission?'),(2740,'customizedFile.title.search.page','Customized application pages'),(2741,'reports.members_reports.include_no_traders','Include members without transactions'),(2742,'ad.search.noResults','No advertisements were found'),(2743,'paymentObligation.accept','Accept'),(2744,'menu.member.account.scheduledPayments','Scheduled payments'),(2745,'guarantee.title.authorizeGuarantee','Authorize guarantee'),(2746,'mobile.login.accessUsing','Use {0}'),(2747,'transferType.availability.PAYMENT','Payment to others'),(2748,'externalAccount.removeConfirmation','Remove this external account?'),(2749,'menu.admin.accounts.authorizedLoans','Authorized loans'),(2750,'transactionFee.action.broker.new','Insert new broker commission'),(2751,'currency.dRate.interest','Interest rate'),(2752,'menu.admin.guarantees.listGuaranteeTypes','Guarantee Types'),(2753,'menu.operator.member.contacts','Contacts'),(2754,'customImage.system.pending','External payment: pending'),(2755,'settings.log.transactionLevel.OFF','Off'),(2756,'group.settings.transactionPassword.length','Transaction password length'),(2757,'menu.contact','Contact'),(2758,'permission.operatorGuarantees.issueGuarantees','Use guarantee type'),(2759,'webshop.payment.enterPasswordText','Password'),(2760,'transactionFee.subject.DESTINATION','Member receiving (destination)'),(2761,'changePin.error.obvious','Pin is too simple. It cannot be sequential, nor equals to any profile field'),(2762,'login.redirectFromMessage','In order to proceed please login'),(2763,'loan.summary.loans','Loans'),(2764,'adInterest.new','Insert new ad interest'),(2765,'group.settings.emailValidation.ADMIN','Administrator'),(2766,'customField.description','Description'),(2767,'reports.stats.general.comparePeriods','Compare 2 periods'),(2768,'invoice.accept.header','You are about to accept an invoice and perform the following payment:'),(2769,'permission.adminMemberMessages.view','View'),(2770,'permission.adminAdminAccess.changePassword','Change login password'),(2771,'customField.member.access.MEMBER_NOT_OPERATOR','Member, not operator'),(2772,'payment.selectTransferType','Select the payment type'),(2773,'group.settings.passwordLength.min','Min password length'),(2774,'customField.internalName','Internal name'),(2775,'rates.error.rateNotEnabledForInit','You tried to initialize a rate, but that rate is not enabled. You must enable it first on the currency.'),(2776,'reports.current.balance_account','Balance of {0}'),(2777,'permission.adminMemberCards.changeCardSecurityCode','Change code'),(2778,'reference.feedbackComments','Buyer feedback'),(2779,'theme.remove.error','The theme could not be removed'),(2780,'profile.action.brokerSimulateConversion','Simulate conversion for members'),(2781,'reference.level.GOOD','Good'),(2782,'invoice.title.send.member','Send invoice to member '),(2783,'translationMessage.removed','The translation keys were removed'),(2784,'permission.operatorMessages.sendToMember','Send to member'),(2785,'customField.title.order.payment','Set custom field order for {0}'),(2786,'reports.stats.finances.ComparePeriods.income.yAxis','Income'),(2787,'loanGroup.memberAdded','The member was added to this loan group'),(2788,'reports.stats.activity.developments.logins','Logins'),(2789,'brokerCommission.removed','The broker commission was removed'),(2790,'scheduledPayments.title.list.of','Scheduled payments of {0}'),(2791,'settings.type.ALERT','Alert settings'),(2792,'errorLog.date','Date'),(2793,'menu.admin.personal.mailPreferences','E-Mail Notifications'),(2794,'loanPayment.search.discardedAmount','Discarded'),(2795,'admin.username','Login name'),(2796,'accountFee.hour','Hour'),(2797,'menu.operator.personal.changePassword','Change password'),(2798,'loanPayment.search.repaidAmount','Repaid'),(2799,'card.unblocked','Card unblocked'),(2800,'accountType.nature.MEMBER','Member'),(2801,'menu.admin.ads.search','Products & Services'),(2802,'sms.type.ACCOUNT_DETAILS','Account details'),(2803,'notificationPreferences.email','Email'),(2804,'customField.member.memberSearchAccess','Member search for'),(2805,'profile.action.loansActions','Loans'),(2806,'settings.message.transactionFeedbackRequest','Transaction feedback request'),(2807,'permission.adminMemberCards.generate','Generate'),(2808,'global.selectAll','Select all'),(2809,'translationMessage.modified','The translation key has been modified'),(2810,'reports.stats.activity.throughTime.grossProduct.yAxis','Gross Product'),(2811,'settings.message.scheduledPaymentsCancelled','Scheduled payments cancelled'),(2812,'reports.stats.activity.singlePeriod.numberTransactions.row2','Number of Transactions over all members'),(2813,'reports.stats.activity.singlePeriod.numberTransactions.row1','Number of Transactions per trading member'),(2814,'loan.repayment.repaidAmount','Repaid'),(2815,'quickAccess.contacts','Contacts'),(2816,'groupFilter.modified','Group filter modified'),(2817,'registrationAgreement.title.insert','New registration agreement'),(2818,'serviceClient.title.modify','Modify web services client'),(2819,'theme.message.export','Export theme to a file'),(2820,'settings.message.lowUnits','Low units'),(2821,'conversionSimulation.aRate','A rate'),(2822,'serviceClient.member','Restricted to member'),(2823,'loanGroup.error.memberAlreadyInList','The given member is already in this loan group'),(2824,'reference.title.new.general','Set new reference'),(2825,'receiptPrinterSettings.removed','The receipt printer settings were removed'),(2826,'smsLog.smsType','Reason'),(2827,'permission.adminAdminRemarks.view','View'),(2828,'conversionSimulation.result.graph.title','Fee amount time curve'),(2829,'sms.type.HELP','Help'),(2830,'login.form.title','Login'),(2831,'invoice.sendConfirmationMessage','Send an invoice to {0} of {1}?\n\nPlease click OK to confirm.'),(2832,'customizedFile.title.applicationPage','Customized application pages'),(2833,'customField.type.ENUMERATED','Enumerated'),(2834,'permission.systemAccountFees.view','View'),(2835,'adCategory.removed','The category was removed'),(2836,'reports.members_reports.account_type.selectAccountTypes','Select account types'),(2837,'pin.unblock.message','The pin is blocked by exceeding wrong tries'),(2838,'settings.access.usernameGeneration.NONE','Manual by member'),(2839,'pos.changeParameters.confirmation','Change POS parameters?'),(2840,'menu.member.search.ads','Products & Services'),(2841,'groupFilter.new','Insert new group filter'),(2842,'permission.memberLoans.repay','Repay'),(2843,'reports.simulations.dRateConfigSimulation.currency','Currency'),(2844,'infoText.end','Expiration'),(2845,'menu.logout.confirmationMessage','Please confirm to logout'),(2846,'accountFee.error.multipleVolumeFees','There are multiple  volume account fees over this account.\n\nPlease, contact the administration.'),(2847,'home.admin.status.connectedOperators','Number of connected operators'),(2848,'group.settings.passwordLength.max','Max password length'),(2849,'reports.stats.activity.paymentFilterRequired','To show that statistics, at least one payment filter is required'),(2850,'accountFee.runMode.MANUAL','Manual'),(2851,'reports.stats.activity.comparePeriods.grossProduct.title','Gross Product per member (comparing two periods)'),(2852,'adImport.processed','The advertisements were successfully imported'),(2853,'settings.message.externalChannelPaymentRequestExpiredPayer','External channel payment request expired payer'),(2854,'ad.status.EXPIRED','Expired'),(2855,'message.error.memberWontReceiveNotification','The selected member has chosen not to receive messages from other members'),(2856,'transfer.to','To'),(2857,'help.title.payments','Payments'),(2858,'group.settings.enablePermanentAds','Enable permanent advertisements'),(2859,'reports.simulations.dRate.config.graph.yAxis','Fee'),(2860,'posweb.action.receivePayment','Receive payment (F2)'),(2861,'loan.firstOpenPayment','First open payment'),(2862,'accountHistory.debits.count','Transactions paid'),(2863,'permission.adminMemberSms.view','View'),(2864,'adCategory.error.importing','There was an error importing the categories'),(2865,'serviceClient.name','Name'),(2866,'groupFilter.groups','Groups'),(2867,'settings.local.transferListenerClass','Java class for processed payments'),(2868,'permission.brokerPos.changePin','Change PIN'),(2869,'profile.action.invoiceAsMemberToSystem','Invoice member to system'),(2870,'pos.status.DISCARDED','Discarded'),(2871,'error.email','There was an error while sending the mail'),(2872,'customField.payment.type.OWNED','Owned'),(2873,'registrationAgreement.inserted','The registration agreement was inserted'),(2874,'customField.title.insert.loan','New loan custom field'),(2875,'menu.member.account.invoices','Invoices'),(2876,'paymentObligationLog.status','Status'),(2877,'invoice.sentBy','Sent by'),(2878,'alert.removeOne.confirm','Remove alert?'),(2879,'member.member','Member'),(2880,'global.search.ADVANCED','Advanced'),(2881,'reports.stats.keydevelopments.throughTime.QUARTER','Each quarter'),(2882,'loan.repayment.discard.payment','Discard payment'),(2883,'conversionSimulation.dRate.present','Present D rate'),(2884,'paymentObligation.amount','Amount'),(2885,'permission.systemMessageCategories.view','View'),(2886,'createAdmin.password','Password'),(2887,'customField.ad.indexed','Include in keywords search'),(2888,'member.bulkActions.cardGenerated','{0} cards were generated'),(2889,'transferType.allowsScheduledPayments','Allows scheduled payments'),(2890,'loan.status.RECOVERED','Recovered'),(2891,'group.settings.externalAdPublication.DISABLED','Disabled'),(2892,'permission.memberReceiptPrinterSettings','Receipt printer settings'),(2893,'loan.repaymentType','Repayment type'),(2894,'settings.access.externalPaymentPassword','Password'),(2895,'theme.removed','The theme was removed'),(2896,'changeGroup.admin.title','Change group of administrator {0}'),(2897,'menu.operator.account.requestPayment','Request payment'),(2898,'reports.stats.keydevelopments.averageAmountPerTransaction.title','Developments in median amount per transaction'),(2899,'notificationPreferences.costPerAdditionalMessages','{0} additional messages cost {1} with a validity of {2}'),(2900,'guaranteeType.paymentObligationList','Payment obligation list'),(2901,'member.action.create','Create member'),(2902,'settings.local.csv.valueSeparator.COMMA','Comma'),(2903,'transferType.allowSmsNotification','Allow SMS notification'),(2904,'menu.member.personal.commissionChargeStatus','Broker commissions'),(2905,'customizedFile.resolveConflict','Resolve conflict'),(2906,'smsLog.type.MAILING','Mailing'),(2907,'permission.adminMemberRecords','Member records'),(2908,'transactionFee.deductAmount','Deduction'),(2909,'changePassword.error.incorrect','Incorrect password'),(2910,'smsMailing.title.send','Send new SMS mailing'),(2911,'reports.members.ads.scheduled','Scheduled'),(2912,'currency.description','Description'),(2913,'transactionPassword.error.invalid','Invalid transaction password.\nTry again.'),(2914,'createMember.error.noPossibleGroup','There is no possible initial group'),(2915,'transactionFee.title.broker.list','Broker commissions'),(2916,'memberRecordType.error.removing','The member record type cannot be removed because there is at least one member record using it'),(2917,'errorLog.title.search','Search error log history'),(2918,'category.name','Category'),(2919,'receiptPrinterSettings.paymentAdditionalMessage','Additional message on payment receipts'),(2920,'permission.systemAlerts.viewMemberAlerts','View member alerts'),(2921,'group.settings.maxSchedulingPeriod','Max. scheduling period'),(2922,'message.type.BROKERING','Brokering events'),(2923,'accountFee.chargeMode.NEGATIVE_VOLUME_PERCENTAGE','Negative volume percentage'),(2924,'login.accessUsing','Access using {0}'),(2925,'permission.adminMemberAccounts.authorizedInformation','Search for authorized loan status'),(2926,'serviceOperation.INFO_TEXTS','Get info texts'),(2927,'externalTransferProcess.processed','The selected payments have been processed'),(2928,'menu.member.personal.changePassword','Change password'),(2929,'payment.error.pastDateWithRates','Payment in past is not possible if rates are enabled.\nThis is a configuration error; please contact a system admin.'),(2930,'settings.access.virtualKeyboardLogin','Virtual keyboard for login password'),(2931,'card.status','Status'),(2932,'rates.error.reinitValidation.reinitDateAfterEnableDate','The date you gave to start the reinitialization from is after the present enabling date of rates.\nYou must choose a date before enabling dates.'),(2933,'menu.admin.accounts.loanPayments','Loan Payments'),(2934,'menu.admin.personal.profile','Profile'),(2935,'transactionFee.chargeType','Charge type'),(2936,'serviceClient.removed','The web services client was removed'),(2937,'reference.title.given.my','Given'),(2938,'permission.systemReports.statistics','Statistics'),(2939,'settings.log.scheduledTaskLevel.INFO','Summarized execution'),(2940,'permission.operatorInvoices.sendToMember','Send to member'),(2941,'guarantee.currentIssueFeeValue','Issue fee charged'),(2942,'alert.system.APPLICATION_RESTARTED','Application restarted'),(2943,'group.settings.expireMembersAfter','Expire members after'),(2944,'group.settings.maxAdDescriptionSize','Max ad description size'),(2945,'alert.search.date.end','To date'),(2946,'group.account.updateAccountLimits','Update credit limit for existing members'),(2947,'profile.member.maxPictures','Maximum amount of pictures reached'),(2948,'permission.adminMembers.changeGroup','Change group'),(2949,'certification.logs','Logs'),(2950,'conversionSimulation.result.graph.xAxis','Date'),(2951,'settings.message.adminPaymentFromSystemToSystem','Payments from system to system'),(2952,'reports.stats.finances.singlePeriod.overview','Overview'),(2953,'memberPos.status.PENDING','Pending'),(2954,'reports.stats.activity.singlePeriod.grossProduct.yAxis','Gross Product'),(2955,'payment.nextAuthorizationLevel','The payment has been submitted for a higher level authorization'),(2956,'reports.stats.finances.expenditure.short','Expenditure'),(2957,'reports.stats.activity.throughTime.loginTimes.yAxis','Logins / member'),(2958,'transactionFee.name','Name'),(2959,'message.type.FROM_ADMIN_TO_GROUP','Mailings from administration'),(2960,'group.account.pendingAccounts','There are {0} accounts pending activation'),(2961,'permission.module.type.ADMIN_MEMBER','Member administration permissions of {0}'),(2962,'global.totalAmount','Total amount'),(2963,'adminTasks.indexes.rebuildAll','Rebuild all'),(2964,'guarantee.title.guaranteeList','Guarantee list'),(2965,'reports.stats.activity.comparePeriods.loginTimes.title','Logins per member (comparing two periods)'),(2966,'permission.brokerInvoices','Invoices'),(2967,'brokerCommission.modified','The broker commission was modified'),(2968,'alert.system.ACCOUNT_FEE_FAILED','Account fee failed'),(2969,'accountHistory.filter','Payment type'),(2970,'guarantee.creditFee','Credit fee'),(2971,'member.search.date','Activation'),(2972,'reference.level.VERY_BAD','Very bad'),(2973,'cardType.cardFormatNumber','Format number'),(2974,'payment.recipientName','Name (recipient)'),(2975,'customField.member.access.WEB_SERVICE','Web services'),(2976,'mobile.error.noDefaultAccount','You cannot login because the group {0} doesn\'t have a default account'),(2977,'reports.current.invoices.SYSTEM_INCOMING.amount','Sum of incoming system invoices'),(2978,'transactionFee.allowAnyAccount','Allow any account'),(2979,'memberPos.status.BLOCKED','Blocked'),(2980,'menu.member.account.accountInformation','Account Information'),(2981,'externalTransfer.title.new','New external transfer'),(2982,'authorizationLevel.amount','Amount'),(2983,'customizedFile.contents','Contents'),(2984,'loan.repayment.confirmationMessage','Are you sure to repay {0}?\n\nPlease, click OK to proceed'),(2985,'settings.log.traceLevel.OFF','Off'),(2986,'reports.stats.keydevelopments.numberOfTransactions','Number of transactions'),(2987,'createOperator.action.saveAndOpenProfile','Save and open operator profile'),(2988,'guarantee.status.PENDING_ADMIN','Pending Admin'),(2989,'home.status.newReferences','You received {0} new references since your last login'),(2990,'menu.member.personal.documents','Documents'),(2991,'adminTasks.indexes.confirmRebuild','Index rebuilding is performed in the background and can make searches by keywords fail to find results until it is complete.\n\nAre you sure?'),(2992,'permission.adminMemberAds.import','Import'),(2993,'groupFilter.removeConfirmation','Remove group filter?'),(2994,'permission.brokerSmsMailings.paidSmsMailings','Send paid SMS mailings'),(2995,'memberImport.status.INVALID_COLUMN','Invalid column: {0}'),(2996,'message.category.noCategory','No category'),(2997,'posweb.searchTransactions.noTransactions','No transactions on the given date'),(2998,'permission.adminMemberInvoices.cancel','Cancel invoice'),(2999,'invoice.action.accept','Accept'),(3000,'pos.actions.changePin','Change PIN'),(3001,'brokerCommissionContract.status.ACCEPTED','Accepted'),(3002,'reference.action.paymentsAwaitingFeedback','View payments awaiting feedback'),(3003,'reference.title.references.of','{0}\'s references'),(3004,'permission.adminAdminAccess','Access'),(3005,'loan.grant.setDate','Grant in past'),(3006,'fieldMapping.removed','Field mapping removed'),(3007,'permission.brokerAds','Products and services'),(3008,'customImage.system.delete','Delete icon'),(3009,'profile.action.personalMessages','Send personal message'),(3010,'certification.lock','Lock'),(3011,'alert.member.negativeVirtualRatedBalance','A negative virtual rated balance has been encountered on  account {0}. The virtual rated balance has been set to 0, but the cause for this error should be checked.'),(3012,'permission.operatorAccount.scheduledInformation','View scheduled payments'),(3013,'group.settings.repayLoanByGroup','Loan repayment permitted by any loan group member'),(3014,'permission.memberReferences','References'),(3015,'ticket.status.EXPIRED','Expired'),(3016,'permission.brokerCards.unblock','Unblock'),(3017,'error.aRateParameters.noFutureInitEmission','Init value and date will lead to future emission dates, which is not allowed.'),(3018,'menu.operator.account.selfPayment','Self Payment'),(3019,'adImport.status.INVALID_CATEGORY','Invalid category: {0}'),(3020,'reports.stats.keydevelopments.transactionAmount.yAxis','amount/transaction (units)'),(3021,'transactionFee.subject.SOURCE_BROKER','Broker of member paying (source)'),(3022,'loanGroup.action.grantLoan','Give loan'),(3023,'group.settings.hideCurrencyOnPayments','Hide currency (show only payment types)'),(3024,'settings.message.commissionContractCancelled','Commission contract cancelled'),(3025,'customField.title.list.admin','Administrator custom fields'),(3026,'menu.admin.customFields','Custom Fields'),(3027,'permission.systemInvoices.manage','Manage'),(3028,'posweb.action.printSettings','Print settings'),(3029,'paymentObligation.error.noActiveCertificationFound','No active certification found to {0} and issued by {1}    '),(3030,'currency.title.insert','New currency'),(3031,'card.search.noResults','No cards were found'),(3032,'transferAuthorization.comments','Comments'),(3033,'settings.mail.activationMessageWithoutPassword','Message when password is manually assigned'),(3034,'member.bulkActions.channelsChanged','The change was applied to {0} members. {1} members were not changed. '),(3035,'settings.alert.amountIncorrectLogin','Incorrect login attempts'),(3036,'scheduledPayment.parcels','Installments'),(3037,'permission.operatorAds','Ads'),(3038,'reports.transactions_report.outgoing','outgoing'),(3039,'transferType.inserted','The transaction type was inserted'),(3040,'home.admin.status.connectedAdmins','Number of connected admins'),(3041,'rates.reinit.enabledSince','Enabled since'),(3042,'permission.adminAdminRecords.modify','Modify'),(3043,'activities.invoices.incoming.count','Incoming count'),(3044,'permission.adminMemberInvoices.cancelAsMember','Cancel invoice as member'),(3045,'receipt.posweb.transactions.date','Date: {0}'),(3046,'permission.memberCards.activate','Ativate'),(3047,'permission.brokerMemberPayments.cancelScheduledAsMember','Cancel scheduled payment as member'),(3048,'permission.brokerReferences.manage','Manage'),(3049,'global.weekDay.MONDAY','Monday'),(3050,'reports.stats.taxes.paid.paid','Paid'),(3051,'channel.webServiceUrl','Web service url'),(3052,'accountFee.paymentDirection.TO_MEMBER','System to member'),(3053,'loanGroup.inserted','Loan group inserted '),(3054,'webshop.payment.enterPinText','PIN'),(3055,'payment.setDate','Pay in past'),(3056,'adImport.newCategories','New categories'),(3057,'permission.systemAccounts.scheduledInformation','View scheduled payments'),(3058,'customizedFile.title.search.help','Customized help files'),(3059,'global.hide','Hide'),(3060,'global.timePeriod.MONTHS','Month(s)'),(3061,'permission.operatorPayments','Payments'),(3062,'customField.ad.visibility','Visibile for'),(3063,'transfer.by','Performed by'),(3064,'adminTasks.indexRebuildEnqueued','The index rebuild has been enqueued.\nA system alert will be created when it\'s finished'),(3065,'message.brokeredMembers','Registered members'),(3066,'customField.memberRecord.brokerAccess.EDITABLE','Editable'),(3067,'posweb.title.makePayment','Make payment'),(3068,'help.title.home','Home'),(3069,'reports.stats.activity.histogram.logins.yAxis','Number of members'),(3070,'serviceOperation.WEBSHOP','Webshop payments'),(3071,'reports.stats.keydevelopments.numberOfMembers.numberOfMembers','Number of members'),(3072,'adImport.currency','Currency of imported ads'),(3073,'changePin.error.transactionPasswordPending','In order to define the pin, you need the transaction password, which can be generated in the <a class=\"default\" href=\"{0}\">home page</a>'),(3074,'settings.log.maxLengthPerFile','Max file size'),(3075,'alert.system.ERROR_PROCESSING_ACCOUNT_STATUS','Critical error processing account status'),(3076,'reports.stats.general.number','Number'),(3077,'settings.message.modified','The message settings were modified'),(3078,'payment.error.sameFromAntToInFee','This payment cannot be performed, as there would be a fee from / to the same account'),(3079,'currency.removeConfirmation','You are about to remove this currency.\nAre you sure?'),(3080,'customImage.choose','Choose an image'),(3081,'transfer.guarantee.details','Click here for details. '),(3082,'permission.brokerMemberSms.view','View'),(3083,'global.timePeriod.invalid','End date must be after start date.'),(3084,'registrationAgreement.modified','The registration agreement was modified'),(3085,'rates.error.pendingRateExists','You tried to initialize a rate, but a rate initialization is already pending.\nYou can only run one at a time.'),(3086,'permission.adminMemberPreferences.manageNotifications','Manage notifications'),(3087,'card.updateCard.error.blockedTransactionPassword','Blocked transaction password'),(3088,'image.removeConfirmation','Remove image?'),(3089,'global.month.APRIL','April'),(3090,'adminTasks.onlineState.title','System availability'),(3091,'theme.description','Description'),(3092,'externalTransferImport.error.importing.invalidTypeCode','Invalid payment type code: {0}'),(3093,'permission.systemCustomizedFiles','System-wide customized files'),(3094,'brokerCommission.stopped','The broker commission was stoped'),(3095,'profile.pendingEmail.confirmed','The e-mail change to {0} has been confirmed'),(3096,'paymentFilter.groups','Group visibility'),(3097,'receipt.transfer.header','{0} payment receipt'),(3098,'loanGroup.title.insert','New loan group'),(3099,'permission.adminMemberGuarantees.viewPaymentObligations','View payment obligations'),(3100,'memberRecord.modifiedBy','Modified by'),(3101,'help.title.settings','Settings'),(3102,'settings.local.timeZone.none','Don\'t compute time zone'),(3103,'document.action.new','Insert new document'),(3104,'settings.type.MAIL','Mail settings'),(3105,'guaranteeType.model.WITH_BUYER_ONLY','With buyer only'),(3106,'permission.memberCards.block','Block'),(3107,'permission.brokerInvoices.view','View'),(3108,'externalTransferImport.title.search','Search imports for {0}'),(3109,'currency.enableARate','Enable A-rate'),(3110,'permission.brokerDocuments.view','View'),(3111,'transactionFee.payer','Will be charged'),(3112,'customField.title.modify.memberRecord','Modify custom field for member record {0}'),(3113,'settings.message.buyerOnlyGuaranteeStatusChanged','Guarantee status changed (only buyer)'),(3114,'changeGroup.error.move.hasBalance','The member cannot be moved because it does not have a zero balance in {0}'),(3115,'customField.title.list.loanGroup','Loan group custom fields'),(3116,'customField.title.insert.admin','New administrator custom field'),(3117,'profile.action.accessActions','Access'),(3118,'message.messageBox.TRASH','Trash'),(3119,'reports.stats.activity.throughTime.nAll','n All'),(3120,'receipt.transfer.from','From: {0}'),(3121,'permission.brokerMemberPayments','Member payments'),(3122,'accountHistory.initialBalance','Initial balance'),(3123,'guaranteeType.authorizedBy.ISSUER','Issuer'),(3124,'channel.removeConfirmation','Are you sure to remove this channel?'),(3125,'fileMapping.headerLines','Header lines'),(3126,'menu.operator.search.members','Members'),(3127,'reports.current.number_open_loans','Number of open loans'),(3128,'memberImport.status.INVALID_RECORD_FIELD','Invalid value for {0}: {1}'),(3129,'loanPayment.title','Payments'),(3130,'transactionFee.value','Charge value'),(3131,'card.action.unblockSecurityCode','Unblock card security code'),(3132,'loan.queryStatus.OPEN','Open'),(3133,'menu.member.personal','Personal'),(3134,'activities.references.given','Given'),(3135,'remark.date','Date'),(3136,'reports.stats.activity.throughTime.percentageNoTrade.yAxis','% not trading'),(3137,'authorizationLevel.modified','Authorization level modified'),(3138,'certification.status.EXPIRED','Expired'),(3139,'reference.date','Date'),(3140,'reports.current.ads_information','Advertisements information'),(3141,'menu.admin.accounts.loans','Manage Loans'),(3142,'message.search.keywords','Keywords'),(3143,'group.title.list','Permission groups'),(3144,'changeBroker.current','Current broker'),(3145,'permission.adminMemberAccess.transactionPassword','Manage transaction password'),(3146,'help.title.account_management','Account management'),(3147,'permission.systemSettings.view','View settings'),(3148,'adCategory.orderModified','The ad category order was modified'),(3149,'theme.remove.confirmation','Are you sure to remove this theme from the system?'),(3150,'permission.brokerSmsMailings','SMS mailings'),(3151,'adminTasks.indexes.type.MemberRecord','Member records'),(3152,'brokering.title.print','Registered members'),(3153,'memberImport.accountType.empty','Don\'t import accounts'),(3154,'transfer.guarantee','Related guarantee'),(3155,'mobile.home.doPayment','Do Payment'),(3156,'settings.log.traceLevel.ERRORS','Errors only'),(3157,'message.title.send','Send message'),(3158,'externalAccount.description','Description'),(3159,'externalTransferImport.by','Performed by'),(3160,'rates.error.reinitValidation.noRateSpecified','No rate was specified.'),(3161,'channel.credentials.PIN','PIN'),(3162,'reports.stats.activity.singlePeriod.numberTransactions','Number of Transactions per member'),(3163,'message.type.TRANSACTION_FEEDBACK','Transaction feedbacks'),(3164,'global.quarter.THIRD','Third quarter'),(3165,'invoice.invalid.paymentDates','The payment dates should be sorted and must be scheduled for future dates'),(3166,'guaranteeType.creditFeeTransferType','Credit fee'),(3167,'permission.operatorReports','Reports'),(3168,'group.account.error.removing','The group account could not be removed, because at least one account has transactions or open invoices'),(3169,'certification.starts','Starts'),(3170,'home.admin.status.title','Application status'),(3171,'help.title.groups','Groups'),(3172,'message.type.AD_EXPIRATION','Ad expiration alert'),(3173,'loan.type.MULTI_PAYMENT','Multiple payments'),(3174,'memberRecord.removed','The {0} record was removed'),(3175,'activities.rates','Rates'),(3176,'permission.adminMemberBrokerings.viewMembers','View members list (as broker)'),(3177,'paymentFilter.title.list','Payment filters'),(3178,'card.status.CANCELED','Canceled'),(3179,'profile.error.changeEmailValidationFailed','You have attempted to change the e-mail, but the verification e-mail couldn\'t be sent'),(3180,'permission.operatorGuarantees','Guarantees'),(3181,'scheduledPayment.totalAmount','Total amount'),(3182,'mailPreferences.memberAlerts','Member alerts'),(3183,'customField.size.MEDIUM','Medium'),(3184,'settings.title.file','Import / export settings'),(3185,'reports.stats.activity.comparePeriods.numberTransactions.row1.short','traders'),(3186,'customImage.system.systemLogo','System logo'),(3187,'manual.action.printManual','Print whole manual'),(3188,'settings.local.deletePendingRegistrationsAfter','Maximum e-mail confirmation time for member registration'),(3189,'loanGroup.title.members','Members in this loan group'),(3190,'memberRecordType.editable','Editable'),(3191,'reports.stats.general.printable','Printable version'),(3192,'profile.action.preferencesActions','Preferences'),(3193,'brokerCommission.suspendTooltip','Suspend'),(3194,'receiptPrinterSettings.title.list','Receipt printer settings'),(3195,'externalTransferType.action','Action'),(3196,'externalTransfer.action.choose','Apply action to selected transfers...'),(3197,'customImage.system.inactive','Inactive icon'),(3198,'permission.memberGuarantees.sellWithPaymentObligations','Sell with payment obligations to groups'),(3199,'customImage.system.message_replied','Replied message icon'),(3200,'menu.member.personal.pos.editPos','Edit POS'),(3201,'selectChannels.title.of','Change access to channels of {0}'),(3202,'reports.stats.general.throughTheYears','Through the years'),(3203,'settings.message.pendingGuaranteeIssuer','Guarantee awaiting for authorization'),(3204,'notificationPreferences.message','Cyclos message'),(3205,'customizedFile.path','Path'),(3206,'settings.mail.activation','Activation mail'),(3207,'brokerCommission.error.suspending','Error suspending the broker commission!'),(3208,'message.type.PAYMENT','Payment events'),(3209,'global.loadingSystem','The application is being loaded. Please, wait...'),(3210,'menu.admin.reports.sms','SMS messages logs'),(3211,'menu.operator.account.systemInvoice','System Invoice'),(3212,'paymentObligation.requestGuaranteeOk','The guarantee was created in status {0}'),(3213,'selectChannels.title.my','Change my access to channels'),(3214,'adCategory.title.insert','New advertisement category'),(3215,'contact.title.add','Add new contact'),(3216,'activities.transactions.numberBuy','Paid - count'),(3217,'reference.adminComments','Administration comments'),(3218,'settings.access.usernameLength','Manual login length'),(3219,'registrationAgreement.title.list','Registration agreements'),(3220,'customImage.system.import','Import icon'),(3221,'permission.brokerMemberRecords.view','View'),(3222,'customField.type.INTEGER','Integer number'),(3223,'alert.member.LOGIN_BLOCKED_BY_TRIES','Member blocked by exceeding login attempts'),(3224,'customField.title.insert.member','New member custom field'),(3225,'errors.minLength','{0} cannot be less than {1} characters'),(3226,'group.settings.sendPasswordByEmail','Send password by e-mail'),(3227,'permission.adminMemberAccess.resetPassword','Reset login password'),(3228,'menu.admin.reports.members.list','Member lists'),(3229,'connectedUsers.disconnectToolTip','Disconnect user'),(3230,'permission.adminMemberSmsMailings','SMS mailings'),(3231,'reports.stats.activity.throughTime.numberTransactions.col4','n All'),(3232,'reports.stats.activity.throughTime.numberTransactions.col3','n Traders'),(3233,'permission.adminAdminRecords.create','Create'),(3234,'reports.stats.activity.throughTime.numberTransactions.col2','Number of Transactions All'),(3235,'group.settings.possibleInitialGroups','Possible initial groups'),(3236,'menu.admin.accounts.accountFees','Account Fees'),(3237,'createMember.error.mailSending','There was a problem while sending the validation e-mail.\nThe member was not registered.'),(3238,'reports.stats.activity.throughTime.numberTransactions.col1','Number of Transactions Traders'),(3239,'settings.local.highPrecision','High precision'),(3240,'defaultBrokerCommission.status','Status'),(3241,'permission.brokerMessages.sendToMembers','Send message to registered members'),(3242,'message.type.INVOICE','Invoice events'),(3243,'settings.alert.amountDeniedInvoices','Denied invoices'),(3244,'menu.admin.settings.local','Local Settings'),(3245,'loan.repayment.setDate','Repay in past'),(3246,'customizedFile.title.customize.page','Customize application page'),(3247,'profile.action.records','Records'),(3248,'card.activationDate','Activation date'),(3249,'brokerCommission.action.stop','Stop'),(3250,'adImport.status','Status'),(3251,'fieldMapping.title.order.description','Drag the fields to change order'),(3252,'pos.created','The POS was created'),(3253,'reports.stats.period.name','Name'),(3254,'reports.members.date.history','History'),(3255,'invoice.scheduledFor','Scheduled for'),(3256,'settings.log.traceLevel.SIMPLE','Simple tracing (no parameters)'),(3257,'groupFilter.customizedFiles.removeConfirmation','Stop customizing this file?'),(3258,'permission.systemSettings.manageMail','Manage mail settings'),(3259,'settings.log.accountFeeLevel.DETAILED','Detailed'),(3260,'remark.writer.administration','Administration'),(3261,'accountFee.runMode.SCHEDULED','Scheduled'),(3262,'smsLog.type.NOTIFICATION','Notification'),(3263,'permission.adminMemberAccounts.information','View information'),(3264,'profile.action.activities','View reports'),(3265,'adCategory.title.export','Export advertisement categories'),(3266,'changeGroup.error.remove.hasBalance','The member cannot be removed because it does not have a zero balance in {0}'),(3267,'permission.adminMemberAccess.disconnectOperator','Disconnect logged operator'),(3268,'home.status.unreadMessages','You have {0} unread messages'),(3269,'permission.systemExternalAccounts.processPayment','Process payment'),(3270,'customizedFile.customized','The file has been customized'),(3271,'smsMailing.mailingType.PAID_FROM_BROKER','Paid mailing from broker'),(3272,'group.settings.emailValidation.WEB_SERVICE','Web service'),(3273,'alert.member.loginBlockedByPermissionDenieds','The member login is temporarily blocked by exceeding the maximum amount of permission denied. The remote IP address is {1}'),(3274,'reports.stats.finances.singlePeriod.expenditure','Expenditure'),(3275,'accountFeeLog.rechargeFailed','Recharge (failed members)'),(3276,'loanGroup.modified','Loan group modified '),(3277,'createMember.captcha','Please, type the image characters below'),(3278,'changePin.title.of','Change pin of {0}'),(3279,'permission.brokerLoanGroups','Loan groups'),(3280,'menu.member.personal.brokerCommissionContracts','Commission contracts'),(3281,'menu.admin.contentManagement.staticFiles','Static Files'),(3282,'loan.grant.error.unsortedPayments','The loan payments are not correctly sorted by date'),(3283,'permission.adminMemberRecords.manage','Manage'),(3284,'memberPos.maxSchedulingPayments','Max scheduling payments'),(3285,'pos.assignPos.confirmation','Assign the POS to member?'),(3286,'mobile.payment.username','User'),(3287,'image.details.title','Set image order and caption'),(3288,'payment.title.asMemberToSelf','Transfer between accounts of {0}'),(3289,'operator.name','Operator Name'),(3290,'profile.action.allowLogin','Allow user to login now'),(3291,'permission.admin.managesGroups','Manages groups'),(3292,'changePin.title.my','Change my pin'),(3293,'group.error.removing','The group could\'t be removed.\nMake sure there are no users on it'),(3294,'reference.paymentsAwaitingFeedback.noResults','There are no payments currently awaiting feedback'),(3295,'externalTransfer.action.MARK_AS_CHECKED','Mark as checked'),(3296,'permission.systemCustomFields','Custom fields'),(3297,'memberImport.title.details.error','Members with import errors'),(3298,'permission.systemMemberPermissions.view','View'),(3299,'settings.local.language.ITALIAN','Italian'),(3300,'menu.member.operators.groups','Operator groups'),(3301,'reference.to','To'),(3302,'reference.title.received.my','Received'),(3303,'cardType.defaultExpiration','Expiration'),(3304,'permission.systemMemberRecordTypes.view','View'),(3305,'permission.adminAdminRecords.view','View'),(3306,'memberRecord.action.newBasedOnThis','Create new {0} based on this one'),(3307,'customField.payment.access.DESTINATION_MEMBER','For the destination member only'),(3308,'group.settings.maxPinWrongTries','Max pin wrong tries'),(3309,'errors.dateFormat','Invalid date. The correct format is {0}'),(3310,'reports.stats.finances.ComparePeriods.expenditure','Expenditure'),(3311,'externalTransfer.action.DELETE','Delete'),(3312,'paymentObligation.error.certificationAmountExceeded','The certification\'s remaining amount ({0}) corresponding to the buyer is exceeded by the total amount of the selected payment(s) obligation(s) ({1})'),(3313,'profile.action.memberSelfPayment','Self payment'),(3314,'loan.grant.paymentCount','Payment count'),(3315,'transactionFee.generatedTransferType','Generated transaction type'),(3316,'permission.brokerAccounts.brokerSimulateConversion','Simulate conversion for member'),(3317,'global.reset','Reset'),(3318,'theme.filename','File name'),(3319,'smsLog.search.noResults','No SMS logs found'),(3320,'menu.member.connectedOperators','Connected operators'),(3321,'reports.stats.keydevelopments.throughTime.selectQuarters','Select quarters and years'),(3322,'changePassword.error.obvious','The password is too simple. It cannot be sequential, nor equals to any profile field'),(3323,'externalAccount.title.list','External Accounts List'),(3324,'paymentObligation.reject','Reject'),(3325,'payment.manualDate','Payment date'),(3326,'payment.statusGroup.CLOSED_WITHOUT_ERRORS','Closed (entirely paid)'),(3327,'fieldMapping.field.DATE','Payment date'),(3328,'accountType.title.modify.member','Modify member account type'),(3329,'brokering.change.confirmation.withBroker','{1} already has {2} as broker.\nAre you sure to change the broker to {0}?'),(3330,'reference.summary.total','Total'),(3331,'customField.payment.access.NONE','Don\'t show'),(3332,'invoice.title.accept','Invoice accept confirmation'),(3333,'permission.adminMemberDocuments.manageMember','Manage member documents'),(3334,'reports.simulations.dRateConfigSimulation.startD','Start from D ='),(3335,'member.bulkActions.choose','Choose action'),(3336,'memberImport.sendActivationMail','Send activation e-mail'),(3337,'guaranteeType.issueFee','Issue fee'),(3338,'settings.local.csv.recordSeparator.CR_LF','DOS (char 10 + char 13)'),(3339,'permission.adminMemberPos.manage','Manage'),(3340,'externalTransfer.action.MARK_AS_UNCHECKED','Mark as unchecked'),(3341,'settings.message.adminAlerts','Subjects for alert notifications'),(3342,'pos.unblockPin.confirmation','Activate the pin?'),(3343,'help.title.custom_fields','Custom Fields'),(3344,'group.settings.smsChargeTransferType','SMS charge transfer type'),(3345,'reports.stats.keydevelopments.numberOfAds.scheduled.short','scheduled'),(3346,'loan.granted','The loan was successfully granted'),(3347,'reports.members.ads.permanent','Permanent'),(3348,'reports.current.presentation','State reports'),(3349,'groups.name','Name'),(3350,'guarantee.registerGuarantee','Register guarantee'),(3351,'settings.message.certificationIssued','New certification issued'),(3352,'permission.systemTranslation','Translation'),(3353,'card.title.print','Card search results'),(3354,'customField.valuesMoved','A total of {0} occurences were replaced from {1} to {2}'),(3355,'document.binaryFile','File'),(3356,'cardType.ignoreDayInExpirationDate','Ignore day in expiration'),(3357,'card.activateCard.confirmation','Activate card?'),(3358,'accountFeeLog.status.SKIPPED','Skipped'),(3359,'payment.statusGroup.OPEN','Open'),(3360,'home.admin.status.errors','Application errors'),(3361,'menu.about','About'),(3362,'authorizationLevel.removeConfirmation','Remove this authorization level?'),(3363,'externalTransfer.inserted','External transfer inserted'),(3364,'brokerCommission.action.suspend','Suspend'),(3365,'customField.title.order.description','Drag the fields to change order'),(3366,'menu.member.personal.sms','SMS history'),(3367,'reports.current.member_count_on_group','Members in {0} group'),(3368,'transactionFee.deductAmount.false','Do not deduct from total amount'),(3369,'customImage.system.help','Help icon'),(3370,'group.account.title.new','Add an account to group {0} '),(3371,'loan.grant.error.invalidAmount','The loan payments amount differs from total amount'),(3372,'groupFilter.containerUrl','Container page url'),(3373,'group.defaultAllowChargingSms','Allow charging for SMS by default'),(3374,'permission.systemGroups','Permission groups'),(3375,'global.count','Count'),(3376,'externalAccountHistory.title.summary','Transactions summary'),(3377,'accountFeeLog.status.ERROR','Error'),(3378,'transactionFee.f1','Value after 1 day'),(3379,'customField.member.showInPrint','Show in member print'),(3380,'login.memberUsername','Member login'),(3381,'reports.members_reports.credits','Credits'),(3382,'loan.status.REPAID','Repaid'),(3383,'permission.systemMemberPermissions.manage','Manage'),(3384,'receipt.posweb.transactions.noTransfers','No processed payments'),(3385,'currency.dRate.creationValue','D-Rate at unit creation'),(3386,'permission.adminMemberCards.block','Block'),(3387,'invoice.title.print','Invoice information'),(3388,'home.status.paymentsToAuthorize','There are {0} payments awaiting for your authorization'),(3389,'brokerCommissionContract.endDate.from','Ending from'),(3390,'transferType.showScheduledPaymentsToDestination','Show scheduled payments to destination'),(3391,'session.firstLogin','First time logged in'),(3392,'settings.local.maxImageSize','Max. image size'),(3393,'alert.system.indexRebuildStart','Search index rebuilding for {0} has started at {1}'),(3394,'reference.title.given','Given references by {0}'),(3395,'accountFeeLog.processedMembers','Processed members'),(3396,'customField.title.order.member','Set member custom field order'),(3397,'login.accessOptions','Access options'),(3398,'settings.access.allowMultipleLogins','Allow multiple logins for the same user'),(3399,'externalTransfer.type','Type'),(3400,'accountHistory.period.end','To date'),(3401,'customField.member.indexing.MEMBERS_AND_ADS','Both members and advertisements'),(3402,'transactionFee.toAllGroups','To all groups'),(3403,'transferType.action.new','Insert new transaction type'),(3404,'group.settings.passwordExpiresAfter.number','Login password expires after (amount)'),(3405,'transfer.hour','Hour'),(3406,'reports.stats.activity.singlePeriod.grossProduct.row2','Gross Product over all members'),(3407,'reports.stats.activity.singlePeriod.grossProduct.row1','Gross Product per earning member'),(3408,'rates.error.reinitValidation.noEditDuringRateReinit','You cannot start a new reinitialization job for rates if another is currently still running.'),(3409,'customField.operator.visibility.NOT_VISIBLE','Not visible'),(3410,'payment.action.cancel','Cancel payment'),(3411,'alert.system.accountFeeFinishedWithErrors','Account fee {0} has finished with {1} errors'),(3412,'scheduledPayments.title.list','Search scheduled payments'),(3413,'settings.local.csv.valueSeparator.TAB','Tabulation'),(3414,'fieldMapping.name','Name'),(3415,'conversionSimulation.result.name','Name'),(3416,'transfer.scheduledFor','Scheduled for'),(3417,'reports.stats.finances.ComparePeriods.income.title','Income Compare periods'),(3418,'paymentRequest.title.new.singleChannel','Request payment by {0}'),(3419,'permission.memberMessages.sendToAdministration','Send to administration'),(3420,'notificationPreferences.selectNone','None'),(3421,'transactionFee.aRateRelation.ASYMPTOTICAL','Asymptotical'),(3422,'payment.action.unblock','Unblock'),(3423,'general.error.csv.unknownColumn','Unknown column in CSV file: {0}'),(3424,'transfer.transactionNumber','Transaction number'),(3425,'notificationPreferences.enableSmsOperations','Enable SMS operations'),(3426,'groupFilter.customizedFiles.modified','The file has been modified for this group filter'),(3427,'invoice.performedBy','Performed by'),(3428,'permission.adminMemberSmsMailings.paidSmsMailings','Send paid mailings'),(3429,'settings.alert.receivedVeryBadRefs','Received very bad references'),(3430,'payment.actions','Actions'),(3431,'pos.status.ASSIGNED','Assigned'),(3432,'message.reply.subject','Re: {0}'),(3433,'menu.admin.alerts.system','System Alerts'),(3434,'loanGroup.action.viewLoans','View loans'),(3435,'changeGroup.error.remove.activeAdmin','An active admin cannot be removed.\nTry to move it to a REMOVED group'),(3436,'permission.adminMemberInvoices.deny','Deny invoice'),(3437,'category.status.INACTIVE','Inactive'),(3438,'memberImport.totalMembers','Total members'),(3439,'ad.publicationPeriod','Publication period'),(3440,'accountFee.title.history','Account fee history'),(3441,'image.caption','Caption'),(3442,'settings.type.LOCAL','Local settings'),(3443,'reports.stats.activity.throughTime.grossProduct.title','Gross Product per member through the time'),(3444,'card.new','Insert new card'),(3445,'cardType.cardSecurityCodeLength','Card security code length'),(3446,'reports.members.smsLog','Sent SMS messages'),(3447,'transactionFee.subject.FIXED_MEMBER','Fixed member'),(3448,'member.bulkActions.changeGroup.confirmation','Are you sure to change the group of all members matching the filters?'),(3449,'global.pagination.various.pages','{0} results. Jump to page:'),(3450,'smsLog.mailingType','Mailing type'),(3451,'account.reservedAmount','Reserved amount'),(3452,'reports.stats.general.graph.selectNone','Select no graphs'),(3453,'reports.stats.general.topten','Top ten'),(3454,'error.maxUploadSizeExceeded','Maximum upload size ({0}) exceeded'),(3455,'permission.adminMemberDocuments.manageStatic','Manage static documents'),(3456,'changePassword.error.mustIncludeLettersNumbers','The password must be composed of letters and numbers'),(3457,'paymentObligation.pack.totalAmount','Total Amount:'),(3458,'brokering.title.details','Member notes'),(3459,'menu.admin.accounts.details','System Accounts'),(3460,'brokerCommission.unsuspended','Tha broker commission was unsuspended'),(3461,'settings.mail.activationMessageWithPassword','Message when password is generated'),(3462,'loan.firstRepaymentDate','First repayment date'),(3463,'permission.adminMemberLoans.manageExpiredStatus','Manage expired loan status'),(3464,'errors.periodInvalidBounds','Begin date of {0} must be before end date'),(3465,'member.group','Permission group'),(3466,'infoText.validity','Validity'),(3467,'menu.operator.account.loans','Loans'),(3468,'error.unknownImageType','Unknown image type.\nRecognized formats are {0}'),(3469,'errors.greaterEquals','{0} must be greater than or equals to {1}'),(3470,'brokering.title.removeMember','Remove member'),(3471,'mobile.home','Home'),(3472,'adminTasks.indexes.type','Type'),(3473,'groupFilter.description','Description'),(3474,'menu.member.personal.references','References'),(3475,'guaranteeType.status','Status'),(3476,'settings.local.extraFunctions','Extra functions'),(3477,'alert.system.MAX_INCORRECT_LOGIN_ATTEMPTS','Max incorrect login attempts for invalid user'),(3478,'guarantee.authorizedBy','Authorized by'),(3479,'permission.systemExternalAccounts.process','Process Payment'),(3480,'permission.brokerMemberPayments.paymentAsMemberToSelf','Member self payment'),(3481,'guarantee.logs','Guarantee logs'),(3482,'mobile.credentials.LOGIN_PASSWORD','Password'),(3483,'permission.adminAdmins','Administrators'),(3484,'settings.local.charset','Character set'),(3485,'cardType.maxSecurityCodeTries','Max card security code error tries'),(3486,'receiptPrinterSettings.title.new','New receipt printer settings'),(3487,'card.member','Member'),(3488,'reports.stats.activity.comparePeriods.numberTransactions.yAxis','n Transactions'),(3489,'reports.stats.activity.topten.member','Member'),(3490,'customField.control.RADIO','Radio button'),(3491,'pos.status.PENDING','Pending'),(3492,'reports.members_reports.select_payment_filter','Select payment filter'),(3493,'profile.action.title','Actions for {0} '),(3494,'profile.userOnline','Is logged'),(3495,'permission.adminMemberGuarantees.cancelGuaranteesAsMember','Deny / Cancel guarantees'),(3496,'pos.unblocked','POS has been unblocked'),(3497,'menu.operator.help.manual','Manual'),(3498,'message.toGroups','To group(s)'),(3499,'reports.simulations.dRate.config.graph.title','D-rate configuration curve'),(3500,'general.error.accountStatusProcessing','Critical problem in account processing.\n\nPlease, contact the administration'),(3501,'loan.grant.manualDate','Grant date'),(3502,'guaranteeType.title.new','New guarantee type'),(3503,'settings.local.messageFormat','Message format'),(3504,'editCard.error.transactionPasswordPending','In order to edit your card, you need the transaction password, which can be generated in the <a class=\"default\" href=\"{0}\">home page</a>'),(3505,'reports.stats.groupfilter','Member filter'),(3506,'alert.member.NULL_IRATE','Unexpected null I-rate encountered'),(3507,'permission.adminMemberPos.changePin','Change PIN'),(3508,'settings.message.mail','Attributes for notifications sent by mail'),(3509,'certification.buyerUsername','Buyer login'),(3510,'translationMessage.import.file','Properties file'),(3511,'menu.member.broker.smsMailings','SMS mailings'),(3512,'permission.operatorGuarantees.issueCertifications','Issue certifications'),(3513,'menu.member.personal.profile','Profile'),(3514,'customField.possibleValue.default','Default'),(3515,'message.action.new','Send a new message'),(3516,'permission.memberPayments.chargeback','Chargeback received payment'),(3517,'customField.member.access.OTHER','Other members'),(3518,'brokerCommission.type.commissionContract','Commission contract'),(3519,'reference.feedbackReply','Seller reply'),(3520,'adminTasks.onlineState.setOnline','Set system online'),(3521,'externalTransferProcess.error.noLoanToDiscard','No open loan to be discarded'),(3522,'permission.systemReports','Reports'),(3523,'permission.brokerMembers.managePending','Manage pending members'),(3524,'permission.brokerCards.generate','Generate'),(3525,'error.queryParse','You have invalid keywords for the search'),(3526,'alert.type','Type'),(3527,'settings.message.subject','Subject'),(3528,'errorLog.removed','The selected error(s) have been removed'),(3529,'paymentObligation.pack.selection','To select a set of payment obligations you must filter by currency and buyer'),(3530,'permission.adminMemberPayments.paymentAsMemberToMember','Member to member payment'),(3531,'settings.file','File'),(3532,'permission.brokerMembers.changeProfile','Change profile'),(3533,'loan.queryStatus.ANY_OPEN','Any open'),(3534,'card.changeCardCode.newCode2','Confirm new card security code'),(3535,'permission.systemLoanGroups.view','View'),(3536,'card.changeCardCode.newCode1','New card security code'),(3537,'payment.title.brokerMemberToSystem','Payment from member {0} to system'),(3538,'customImage.system.previous','Previous page icon'),(3539,'conversionSimulation.result.total','Total'),(3540,'transferType.name','Name'),(3541,'menu.admin.guarantees.searchPaymentObligations','Payment Obligations'),(3542,'reports.current.show_btn','Show reports'),(3543,'customField.removeConfirmation','Remove this custom field?'),(3544,'reports.current.loans','Loans'),(3545,'receiptPrinterSettings.localPrinter.defaultBrowserPrinting','Default browser print'),(3546,'permission.adminMemberLoanGroups.manage','Manage'),(3547,'profile.action.manageLoans','View loans'),(3548,'brokering.status.PENDING','Awaiting activation'),(3549,'adminTasks.indexes.status','Status'),(3550,'customField.title.list.ad','Advertisement custom fields'),(3551,'guarantee.loan','View'),(3552,'ad.description.onlyNew','(only new ads are shown)'),(3553,'permission.systemStatus.viewConnectedAdmins','View connected admins'),(3554,'profile.action.viewBrokerings','Member list (as broker)'),(3555,'changePin.error.userBlocked','You have exceeded the allowed login password trials, and your login is now blocked'),(3556,'group.account.allAccountsOnGroup','All possible accounts are already associated the group '),(3557,'externalTransfer.status.COMPLETE_PENDING','Complete and pending'),(3558,'permission.brokerReports.showAccountInformation','Show account information'),(3559,'global.tooltip.edit','Modify'),(3560,'reports.simulations.choose.dRateConfig','D-rate configuration'),(3561,'loanPayment.summary.unrecoverablePayments','Unrecoverable payments'),(3562,'message.error.emailNotSent','The member could not receive message because of e-mail sending problems'),(3563,'menu.admin.translation.mails','E-Mails'),(3564,'permission.operatorAccount.simulateConversion','Simulate conversion'),(3565,'createAdmin.title','Register new administrator'),(3566,'card.action.block','Block'),(3567,'customizedFile.title.customize.help','Customize help file'),(3568,'activities.invoices','Invoices'),(3569,'loanGroup.removeConfirmation','Remove loan group?'),(3570,'mobile.home.reservedAmount','Reserved: {0}'),(3571,'changeGroup.error.move.hasOpenLoans','The member cannot be moved because it has unpaid loans'),(3572,'payment.title.memberToSelf','Transfer between my accounts'),(3573,'guarantee.inserted','Guarantee inserted'),(3574,'global.up','Up'),(3575,'transactionPassword.status.user.PENDING','Pending'),(3576,'guaranteeType.paymentObligationPeriod','Max period between obligations'),(3577,'externalTransfer.modified','External transfer modified'),(3578,'activities.brokering','Brokering'),(3579,'group.defaultSmsMessages','Default messages sent by SMS'),(3580,'accountFee.invoiceMode.NOT_ENOUGH_CREDITS','Only when member does not have enough credits'),(3581,'permission.adminAdminRemarks.manage','Manage'),(3582,'alert.system.ADMIN_LOGIN_BLOCKED_BY_TRIES','Max incorrect login attempts for admin'),(3583,'group.settings.showPosWebPaymentDescription','Show description field on PosWeb payment'),(3584,'invoice.error.sendingWithMultipleTransferTypesWithCustomFields','This invoice cannot be sent because there are multiple possible payment types with custom fields'),(3585,'menu.operator.guarantees.searchCertifications','Certifications'),(3586,'changeGroup.removedMember','The member is removed'),(3587,'transactionPassword.error.blockedByTrials','Your transaction password is now blocked.\nPlease, contact the administration.'),(3588,'message.messageBox.SENT','Sent items'),(3589,'alert.member.LOGIN_BLOCKED_BY_PERMISSION_DENIEDS','Member login temporarily blocked by permission denied'),(3590,'login.registration.text','You can register by clicking the button below.'),(3591,'reports.stats.activity.singlePeriod.grossProduct.title','Gross Product per member (single period)'),(3592,'reports.stats.taxes.singlePeriod.totalSum.title','Statistics on Taxes: Volume'),(3593,'memberRecordType.groups','Groups'),(3594,'reports.stats.activity.throughTime.loginTimes.title','Logins per member through the time'),(3595,'card.cardType','Card type'),(3596,'ad.tradeType','Type'),(3597,'accountFeeLog.status.PROCESSED','Processed'),(3598,'permission.operatorAds.publish','Publish'),(3599,'mobile.viewPayments.description','Desc.'),(3600,'accountFee.action.running','The account fee is now running'),(3601,'alert.member.ACCOUNT_ACTIVATION_FAILED','Activation of account failed'),(3602,'fieldMapping.removeConfirmation','Remove this field mapping?'),(3603,'permission.memberInvoices','Invoices'),(3604,'invoice.description','Description'),(3605,'certification.validity','Validity'),(3606,'permission.systemSettings.manageAlert','Manage alert settings'),(3607,'permission.systemAdminPermissions.manage','Manage'),(3608,'payment.title.sucessfulPayment','Successful payment'),(3609,'notificationPreferences.hasntEmail','You don\'t have an email address configured.'),(3610,'transactionFee.when.COUNT','Transactions'),(3611,'adImport.title.import','Import advertisements'),(3612,'customImage.system.quickAccess_messages','Quick access: messages'),(3613,'settings.message.sentInvoiceExpired','Sent invoice expired'),(3614,'adImport.status.TOO_MANY_CATEGORY_LEVELS','Too many category levels (max=3)'),(3615,'menu.operator.preferences.receiptPrinterSettings','Receipt printers'),(3616,'settings.log.scheduledTaskLevel.OFF','Off'),(3617,'changePin.error.transactionPasswordBlocked','In order to define the pin, you need the transaction password.\nHowever, your transaction password is blocked.\nPlease, contact the administration'),(3618,'group.settings.passwordExpiresAfter','Login password expires after'),(3619,'reports.simulations.dRate.config.graph.xAxis','D-rate (days)'),(3620,'member.id','Id'),(3621,'reference.level.BAD','Bad'),(3622,'serviceOperation.MANAGE_MEMBERS','Manage members'),(3623,'global.tooltip.permissions','Edit permissions'),(3624,'permission.adminMemberLoans.repay','Repay loan'),(3625,'paymentObligation.expirationDate','Expiration date'),(3626,'settings.message.newCommissionContract','New commission contract'),(3627,'loanPayment.status.EXPIRED','Expired'),(3628,'payment.title.systemMemberToMember','Payment from member {0} to another member'),(3629,'errorLog.stackTrace','Java error details'),(3630,'permission.systemChannels.manage','Manage'),(3631,'settings.access.allowOperatorLogin','Allow operator login'),(3632,'ticket.status.PENDING','Pending'),(3633,'transferType.description','Description'),(3634,'permission.adminMemberPos','POS'),(3635,'reports.stats.general.selectAny','Select none, one, or more'),(3636,'translationMessage.key','Key'),(3637,'customField.type.BOOLEAN','Boolean'),(3638,'smsMailing.error.variableNotFound','Couldn\'t find the following variables: {0}'),(3639,'permission.systemThemes','Themes'),(3640,'externalTransfer.comments','Import comments'),(3641,'customField.possibleValue.title','Values list'),(3642,'permission.adminMemberCards.unblock','Unblock'),(3643,'invoice.search.period.end','End date'),(3644,'global.ok','Ok'),(3645,'conversionSimulation.result.input.drate','Applied D-rate'),(3646,'sms.type.OPERATION_CONFIRMATION','Operation confirmation'),(3647,'guaranteeType.error.issueFeeTransferType','Issue fee transaction type is required'),(3648,'reports.members_reports.system_invoices.invoiceModeRequired','It\'s necessary to check at least one type (incoming / outgoing) of members invoices or system invoices'),(3649,'infoText.title.search','Search info texts'),(3650,'ad.new','Insert new advertisement'),(3651,'reports.stats.keydevelopments.transactionAmount.title','Developments in amount per transaction'),(3652,'paymentRequest.error.invalidChannel','The payment request could not be performed because the user {0} does not have the channel {1} enabled'),(3653,'profile.action.smsLogs','SMS logs'),(3654,'global.no','No'),(3655,'reports.simulations.aRate.config.combinedGraph','Fee percentage vs relative A-rate'),(3656,'menu.admin.accounts.transfersAwaitingAuthorization','To authorize'),(3657,'guarantee.action.deny','Deny'),(3658,'permission.operatorMessages.manage','Manage'),(3659,'help.title.guarantees','Guarantees'),(3660,'menu.operator.account.transfersAwaitingAuthorization','To authorize'),(3661,'payment.confirmation.deny','You are going to deny this payment.\n\nPlease click OK to confirm'),(3662,'reports.stats.activity.developments.percentageNoTraders','% of members not trading'),(3663,'externalTransferImport.date','Date'),(3664,'authorizationLevel.level','Level'),(3665,'payment.error.negativeFinalAmount','All applied fees are higher than your original transfer amount. Contact the administration on this.'),(3666,'memberImport.initialDebits','Initial debits'),(3667,'customField.validation.maxLength','Max. length'),(3668,'infoText.noMatch','Couldn\'t find any info text that matches the specified criteria.'),(3669,'memberPos.title','Member POS'),(3670,'customField.member.error.indexingVisibility','In order to include in keywords search, the field should be shown in profile for other members'),(3671,'scheduledPayment.amount','Amount'),(3672,'transferType.fields.action.link','Link existing custom field'),(3673,'paymentObligation.status.ACCEPTED','Accepted'),(3674,'mailPreferences.guarantees','Guarantees'),(3675,'card.changeSecurityCode.confirmation','Unblock card security code?'),(3676,'sms.type.PAYMENT_ERROR.description','Direct payment error'),(3677,'permission.adminMemberCards.activate','Activate'),(3678,'ad.status.ACTIVE','Active'),(3679,'ad.owner','Publisher'),(3680,'payment.error.authorizedInPast','It is not possible to perform an authorized payment in past date'),(3681,'brokerCommission.suspendConfirmation','Do you want to suspend this broker commission and the brokerÂ´s contracts related to it?'),(3682,'posweb.title.login','PosWeb login'),(3683,'messageCategory.title.insert','Insert new message category'),(3684,'brokering.change.confirmation','Are you sure to set {0} as broker of {1}?'),(3685,'menu.operator.account.systemPayment','System Payment'),(3686,'pos.description','Description'),(3687,'currency.pendingRateInitProgression','Rate reinitialization is being processed; currently processed up to'),(3688,'permission.brokerMemberRecords','Member records'),(3689,'invite.errorSending','Error sending mail to {0}'),(3690,'reports.stats.activity.throughTime.percentageNoTrade','Percentage of member not trading'),(3691,'externalTransferType.name','Name'),(3692,'permission.memberProfile.changeUsername','Change own login name'),(3693,'reports.stats.error.finalDateLesserThanInitialDate','Final date lesser than initial date'),(3694,'menu.admin.messages.messageCategory','Message Categories'),(3695,'message.rootType.SYSTEM','System'),(3696,'group.removed','The group was removed'),(3697,'sms.type.PAYMENT','Direct payment'),(3698,'payment.status.DENIED','Denied'),(3699,'changePin.newPinConfirmation','Confirm new pin'),(3700,'accountFee.action.cancel','Cancel'),(3701,'errors.passwords','Passwords are not Equal'),(3702,'permission.systemCardTypes.view','View card types'),(3703,'loan.status.DISCARDED','Externally repaid'),(3704,'reference.title.details.general','Reference details'),(3705,'global.error.nothingSelected','Nothing selected'),(3706,'externalTransfer.status.PENDING','Pending'),(3707,'fileMapping.className','Class name'),(3708,'settings.access.numericPassword','Numeric password'),(3709,'reports.stats.activity.histogram.logins.title','Logins per member, Histogram'),(3710,'reports.transactions_report.amount','Total amount'),(3711,'transfer.title.authorizations','Authorization actions'),(3712,'group.customizedFiles.removeConfirmation','Stop customizing this file?'),(3713,'global.weekDay.short.TUESDAY','Tue'),(3714,'memberRecordType.title.modify','Modify member record type'),(3715,'reports.stats.keydevelopments.title','Statistics of key developments...'),(3716,'customImage.name','Name'),(3717,'customField.type.DATE','Date'),(3718,'member.groupFilter','Group'),(3719,'menu.admin.bookkeeping.overview','External accounts'),(3720,'global.range','Range'),(3721,'smsMailing.systemName','System name'),(3722,'global.submit','Submit'),(3723,'reports.stats.activity.comparePeriods.grossProduct.row2.short','all'),(3724,'activities.loans.count','Open loans'),(3725,'memberImport.status.UNKNOWN_ERROR','Unknown error: {0}'),(3726,'guarantee.seller','Seller'),(3727,'invoice.error.noAccountType','There is no possible destination account type.\nPlease, contact the administration.'),(3728,'loanPayment.repaymentDate','Repayment'),(3729,'admin.group','Admin group'),(3730,'alert.member.BLOCKED_POS_USED','Attempt to use a POS device marked as blocked'),(3731,'group.settings.maxSchedulingPayments','Max. scheduling payments'),(3732,'customField.type','Data type'),(3733,'document.title.insert','Insert new document'),(3734,'invoice.sent','The invoice was sent'),(3735,'payment.error.relatesTo','The logged user is not related to member \'{0}\'.'),(3736,'generateCard.generateForMemberWithActiveCard','Generate for members with active card?'),(3737,'settings.message.value','Value'),(3738,'menu.admin.bookkeeping','Bookkeeping'),(3739,'settings.local.schedulingHour','Scheduled tasks hour'),(3740,'externalTransferType.title.insert','Insert payment type'),(3741,'brokerCommission.chargeStatus','Commissions charge status'),(3742,'permission.adminMemberInvoices.view','View member invoices'),(3743,'payment.title.systemToSystem','Transfer between system accounts'),(3744,'home.status.openLoans','You have {0} open loans'),(3745,'transactionFee.error.samePayerAndReceiver','Payer and receiver cannot be the same'),(3746,'permission.systemSettings.manageLog','Manage log settings'),(3747,'profile.action.grantLoan','Grant loan'),(3748,'smsMailing.text','Text'),(3749,'memberRecordType.action.new','Insert new member record type'),(3750,'createOperator.title','Create a new operator'),(3751,'help.title.registration','Member registration'),(3752,'permission.adminAdminRemarks','Remarks'),(3753,'reports.current.n_expads','Number of expired advertisements'),(3754,'transferType.to','To'),(3755,'createMember.captcha.invalid','You have not typed the image characters correctly'),(3756,'ad.category.choose','Choose a category'),(3757,'transactionFee.when.DAYS','Days'),(3758,'group.account.removeConfirmation','Remove the account from group?'),(3759,'payment.invalid.schedulingDate','The scheduling date must be before {0}'),(3760,'reports.stats.keyParams','Key Parameters'),(3761,'permission.memberProfile.changeName','Change own name'),(3762,'settings.local.dataDisplay','Data display'),(3763,'reports.stats.activity.throughTime.percentageNoTrade.title','Percentage of members not trading through the time'),(3764,'brokerCommissionContract.startDate.from','Starting from'),(3765,'settings.local.numberLocale.PERIOD_AS_DECIMAL','1,234.56'),(3766,'permission.adminMemberCards.view','View'),(3767,'menu.admin.settings.serviceClients','Web services clients'),(3768,'memberImport.status.MISSING_USERNAME','Username is missing'),(3769,'transactionFee.h','Maximum percentage'),(3770,'guarantee.removeConfirmation','Remove this guarantee?'),(3771,'changeGroup.member.title','Change group for member {0}'),(3772,'transferType.modified','The transaction type was modified'),(3773,'group.settings.maxImagesPerMember','Max profile images per member'),(3774,'transferType.conciliabled','Is conciliable'),(3775,'contactUs.message','In this page the administration can put some text and a mail address of the contact people of your organisation/project, by modifying the <i>contactUs.message</i> translation key.'),(3776,'externalAccount.title.overview','External accounts overview'),(3777,'transfer.relatedTransfers','Related transfers'),(3778,'permission.systemMemberRecordTypes','Member record types'),(3779,'certification.error.certificationActiveExists','An active certification issued to the selected buyer and with the same currency already exists.'),(3780,'customField.title.insert.memberRecord','New custom field for member record {0}'),(3781,'settings.message.certificationStatusChanged','Certification status changed'),(3782,'help.title.invoices','Invoices'),(3783,'serviceOperation.CHARGEBACK','Chargeback payments'),(3784,'memberPos.date','Assigned on'),(3785,'rates.reinit.reinit','Re-initialize?'),(3786,'accountHistory.conciliation.conciliated','Conciliated'),(3787,'externalTransferType.action.DISCARD_LOAN','Discard loan'),(3788,'payment.error.enoughCredits','Insufficient balance on {0}'),(3789,'alert.title.system','System alerts'),(3790,'transfer.chargeback.details','Show details'),(3791,'menu.member.personal.changePin','Change pin'),(3792,'guarantee.modified','The guarantee was modified'),(3793,'reports.stats.general.singlePeriod','One period'),(3794,'customField.operator.visibility.VISIBLE_NOT_EDITABLE','Visible and not editable'),(3795,'group.title.settings.notifications','Notification settings'),(3796,'webshop.error.ticket','Ticket not found'),(3797,'reference.summary.allTime','All time'),(3798,'group.settings.smsShowFreeThreshold','Show free SMS only if below'),(3799,'brokerCommissionContract.acceptConfirmation','Accept this broker commission contract?'),(3800,'paymentObligation.buyerName','Buyer name'),(3801,'menu.admin.translation.file','Import / Export'),(3802,'customField.operator.visibility.EDITABLE','Visible and editable'),(3803,'account.aRate','A rate'),(3804,'groupFilter.customizedFiles.action.new','Customize new file'),(3805,'settings.mail.subject','Subject'),(3806,'guarantee.automaticLoanAuthorization','Authorize loan automatically'),(3807,'permission.memberAdInterests.manage','Manage'),(3808,'permission.adminMemberInvoices','Member invoices'),(3809,'transferAuthorization.showToMember','Show to member'),(3810,'permission.brokerMemberAccess','Access'),(3811,'reports.stats.warning','Warning: Statistical calculations can be very heavy, and may take quite some time.  '),(3812,'permission.memberProfile','Member profile'),(3813,'externalTransferType.description','Description'),(3814,'externalTransferImport.error.format.general','Error importing transactions: {0}'),(3815,'receiptPrinterSettings.modified','The local print method was modified'),(3816,'loan.monthlyInterestRepaymentType','Monthly interest repayment type'),(3817,'loan.expirationDailyInterest','Expiry interest'),(3818,'loan.showProjection','Show'),(3819,'settings.access.loginRegex','Regular expression for login name'),(3820,'group.settings.smsCustomContext','Use a class to customize the SMS context'),(3821,'pos.remove.confirmation','Are you sure you want to remove this POS?'),(3822,'card.status.ACTIVE','Active'),(3823,'currency.dRate.minimalD','Minimal D'),(3824,'paymentFilter.description','Description'),(3825,'guarantee.emissionDate','Emission date'),(3826,'customField.ad.visibility.BROKER','Brokers and administrators'),(3827,'cardType.title.list','Card Types'),(3828,'permission.brokerCards.block','Block'),(3829,'mailPreferences.title','E-mail notifications'),(3830,'changePassword.modified','The password was modified'),(3831,'transferType.from','From'),(3832,'global.quarter.FIRST','First quarter'),(3833,'brokerCommissionContract.error.conflictingContract','There is already an active or pending contract whose period is conflicting whith this contract\'s period'),(3834,'smsLog.free','Free'),(3835,'cardType.cardSecurityCode.AUTOMATIC','Automatic'),(3836,'alert.system.applicationShutdown','Application shutdown'),(3837,'settings.message.setting','Setting name'),(3838,'settings.access.administrationWhitelist','Admin. access whitelist'),(3839,'posLog.memberPosStatus','Member POS status'),(3840,'guaranteeType.error.forwardTransferType','Forward transaction type is required'),(3841,'messageCategory.name','Name'),(3842,'permission.systemServiceClients.view','View'),(3843,'operator.email','E-mail'),(3844,'settings.log.restFile','REST services logfile path / name'),(3845,'reports.stats.activity.histogram.logins.xAxis','Logins / member'),(3846,'mailPreferences.newPendingPayments','New payment awaiting authorization'),(3847,'reports.current.n_permads','Number of permanent advertisements'),(3848,'payment.action.authorize','Authorize'),(3849,'accountFee.paymentDirection','Payment direction'),(3850,'reports.stats.choose.keydevelopments','Key developments'),(3851,'permission.adminMemberAccess.disconnect','Disconnect logged member'),(3852,'permission.systemAdminGroups.manageAdminCustomizedFiles','Manage customized files'),(3853,'transactionFee.chargeType.D_RATE','D-rate'),(3854,'permission.operatorReferences.view','View'),(3855,'adCategory.import.error.noFile','Please, select a file to import the categories'),(3856,'permission.adminMemberBrokerings','Brokerings'),(3857,'reports.stats.activity.developments.grossProduct','Gross Product'),(3858,'reports.stats.keydevelopments.numberOfAds','Number of ads'),(3859,'permission.brokerDocuments.viewMember','View member individual documents'),(3860,'reports.stats.activity.singlePeriod.loginTimes','Login times per member'),(3861,'guaranteeType.model.WITH_BUYER_AND_SELLER','With buyer and seller'),(3862,'customField.pattern','Input pattern'),(3863,'permission.adminMemberInvoices.sendAsMemberToSystem','Send as member to system'),(3864,'reports.stats.activity.singlePeriod.grossProduct.row2.short','all'),(3865,'notificationPreferences.smsHeading','SMS messages'),(3866,'reports.stats.general.sum','Sum'),(3867,'alert.system.rateInitializationFailed','Rate initialization job on currency {0} failed at transaction id {1} due to an exception raised.\nSee the error log for details.'),(3868,'brokerCommissionContract.endDate.to','to'),(3869,'paymentObligation.date','Date'),(3870,'menu.admin.usersGroups.membersBulkAction','Bulk actions'),(3871,'brokering.status.COMMISSION_COMPLETE','Commission ended'),(3872,'document.currentFileLink','{0} ({1})'),(3873,'permission.adminMemberLoans.discard','Discard loan'),(3874,'permission.adminMemberAccess.changePassword','Change login password'),(3875,'groupFilter.title.modify','Modify group filter'),(3876,'permission.operatorInvoices.manage','Manage'),(3877,'paymentFilter.showInAccountHistory','Show in account history'),(3878,'customField.type.MEMBER','Member'),(3879,'permission.systemExternalAccounts','External Accounts (bookkeeping)'),(3880,'authorizationLevel.error.adminGroupRequired','If the authorizer is an admin, it\'s necessary to choose admin groups'),(3881,'loan.queryStatus.ANY_CLOSED','Any closed'),(3882,'transferType.availability.SELF_PAYMENT','Self payment'),(3883,'global.back','Back'),(3884,'customField.moveValue.confirmation','You are going to replace all occurrences of {0} by {1}.\n\nPlease click OK to confirm'),(3885,'paymentRequest.title.new','Request payment'),(3886,'fileMapping.stringQuote','String quote'),(3887,'reports.stats.finances.expenditure','Expenditure'),(3888,'ad.category.title.order','Set ad category order'),(3889,'accountOverview.title.of','Accounts of {0}'),(3890,'paymentFilter.selectPaymentFilters','Select payment filters'),(3891,'group.settings.passwordTries.deactivationTime.number','Deactivation time (amount) after max password tries  '),(3892,'global.datePattern.year','yyyy'),(3893,'currency.aRate.creationValue','A-Rate at unit creation'),(3894,'reports.members.broker','Broker'),(3895,'serviceClient.address','Internet address'),(3896,'fileMapping.numberFormat.WITH_SEPARATOR','With separator'),(3897,'adImport.status.PUBLICATION_BEGIN_AFTER_END','Publication begin date is after the end date'),(3898,'group.details','Group details'),(3899,'adImport.lineNumber','Line #'),(3900,'receipt.transfer.date','Date: {0}'),(3901,'customImage.title.system.update','Update system image'),(3902,'settings.message.adminSystemInvoice','System invoice'),(3903,'loanPayment.date','Date'),(3904,'reports.stats.activity.topten.login','Logins'),(3905,'changeGroup.error.remove.activeOperator','The operator cannot be permanently removed because he/she has already been active on the system.\nInstaed of permanently removing, you can create a removed group and moving the operator to it'),(3906,'settings.message.adminSystemAlert','System alerts'),(3907,'scheduledPayments.title.print','Scheduled payments'),(3908,'permission.memberOperators','Operators'),(3909,'reports.transactions_report.member_to_system_invoices','{0} of member to system invoices'),(3910,'accountOverview.title.my','My accounts'),(3911,'menu.admin.usersGroups.messageToGroups','Group Message'),(3912,'settings.message.transactionFeedbackReceived','Transaction feedback received'),(3913,'receipt.transfer.to','To: {0}'),(3914,'guaranteeType.error.creditFeeTransferType','Credit fee transaction type is required'),(3915,'document.removeConfirmation','Remove document?'),(3916,'defaultBrokerCommission.title.my','Commission settings'),(3917,'transactionPassword.AUTOMATIC','Automatic'),(3918,'loan.calculate','Calculate'),(3919,'message.action.choose','Apply action to selected messages...'),(3920,'group.settings.passwordTries.maximum','Max password tries'),(3921,'settings.local.maxImageWidth',''),(3922,'guaranteeType.name','Name'),(3923,'menu.admin.translation.internalMessages','Notifications'),(3924,'guarantee.status.CANCELLED','Cancelled'),(3925,'guaranteeType.answerTodayMessage','0 means must answer in the day'),(3926,'notificationPreferences.disableSms','Disable SMS'),(3927,'invoice.search.direction.INCOMING','Incoming'),(3928,'receiptPrinter.error.ie','Local receipt printing is not supported under Microsoft Internet Explorer. Please, use a recent version of either Mozilla Firefox, Google Chrome or Opera.'),(3929,'customField.type.URL','URL'),(3930,'permission.systemAlerts.manageMemberAlerts','Manage member alerts'),(3931,'message.sent','The message was successfully sent'),(3932,'translationMessage.removeSelected.confirm','Please confirm to remove the selected translation key(s)?'),(3933,'brokerCommission.error.unsuspending','Error unsuspeding the broker commission!'),(3934,'loan.changedExpiredStatus','The loan has been marked as \'{0}\''),(3935,'reports.stats.activity.comparePeriods.percentageNoTrade.yAxis','% not trading'),(3936,'permission.brokerMembers.manageDefaults','Manage default commissions'),(3937,'invite.title','Invite'),(3938,'global.tooltip.print','Printable results'),(3939,'global.month.AUGUST','August'),(3940,'paymentObligation.status','Status'),(3941,'reports.stats.general.graph.allGraphs','Show all graphs'),(3942,'virtualKeyboard.contrast','Contrast'),(3943,'group.settings.externalAdPublication.ALLOW_CHOICE','Allow choice'),(3944,'permission.memberReferences.give','Give'),(3945,'settings.mail.resetPassword','Reset password mail'),(3946,'category.children','Subcategory'),(3947,'notificationPreferences.allowChargingSms','Allow charging for SMS message'),(3948,'certification.buyer','Buyer'),(3949,'quickAccess.searchMembers','Members'),(3950,'changeGroup.admin.changed','The administrator\'s group was changed'),(3951,'document.nature','Type'),(3952,'fileMapping.fields.title','File mapping fields'),(3953,'member.bulkActions.channelsChangedForAll','All members matching the filter ({0}) were changed.'),(3954,'memberImport.status.INVALID_CUSTOM_FIELD_VALUE_MIN_LENGTH','{0} is invalid: the minimum length is {1}.'),(3955,'customizedFile.type.HELP','Help'),(3956,'customizedFile.originalContents','Original contents'),(3957,'global.datePattern.second','ss'),(3958,'group.title.settings','Group settings'),(3959,'message.type','Type'),(3960,'fieldMapping.memberField','Member field'),(3961,'document.title.select.of','Print document for {0}'),(3962,'settings.log.webServiceLevel.DETAILED','Detailed tracing (detailed parameters)'),(3963,'customizedFile.type.STYLE','Style'),(3964,'paymentObligation.title.modify','Modify payment obligation'),(3965,'guarantee.status.WITHOUT_ACTION','Without action'),(3966,'brokering.loans.amount','Total loan remaining amount'),(3967,'alert.member.scheduledPaymentFailed','A scheduled payment of {0}, with type {1} has failed'),(3968,'permission.brokerReferences','References'),(3969,'guaranteeType.feeType.PERCENTAGE','%'),(3970,'permission.systemAccountFees','Account fees'),(3971,'receipt.posweb.transactions.scheduledPayment','{0} {1} {2} {3} {4}'),(3972,'invoice.destinationAccountType','Account destination'),(3973,'loan.title.search.of','Loans of {0}'),(3974,'global.amount.type.PERCENTAGE','%'),(3975,'changeBroker.title.history','History'),(3976,'fieldMapping.title.modify','Modify field mapping'),(3977,'group.settings.externalAdPublication','Advertisement external publication'),(3978,'customImage.system.quickAccess_accountInfo','Quick access: account information'),(3979,'permission.memberAds','Ads'),(3980,'document.title.select.my','Documents'),(3981,'login.error.blocked','Your login is now temporarily blocked'),(3982,'errorLog.removeSelected.confirm','Remove the selected error log entries?'),(3983,'changeChannels.enableChannels','Enable channels'),(3984,'admin.action.create','Create administrator'),(3985,'account.owner','Owner'),(3986,'customField.ad.showInSearch','Show in search'),(3987,'authorizationLevel.removed','Authorization level removed'),(3988,'settings.message.referenceReceived','Reference receiving'),(3989,'permission.memberLoans.view','View'),(3990,'permission.memberReceiptPrinterSettings.manage','Manage receipt printer'),(3991,'theme.style.MAIN','System'),(3992,'invoice.status.ACCEPTED','Accepted'),(3993,'permission.systemErrorLog.manage','Manage'),(3994,'pos.title','POS'),(3995,'customImage.system.preview','Preview icon'),(3996,'reports.members.date.current','Current Time'),(3997,'reports.simulations.dRateConfigSimulation.title','D-rate Configuration Simulation'),(3998,'loan.title.search.my','My loans'),(3999,'settings.message.guaranteeStatusChanged','Guarantee status changed'),(4000,'settings.log.scheduledTaskLevel.DETAILED','Detailed execution'),(4001,'payment.error.manageRelates','The logged user needs to manage one of the payment\'s parts and be related to the other.'),(4002,'guarantee.action.delete','Delete'),(4003,'paymentObligation.error.certificationValidityExceeded','One or more selected obligations expire after the certification\'s validity ({0} -  {1}).'),(4004,'guaranteeType.action.select','Register guarantee'),(4005,'document.action.new.member','New member document'),(4006,'cardLog.by','Changed by'),(4007,'loan.grant.confirmation.fees','If you grant this loan, the following fees will be applied:'),(4008,'permission.operatorInvoices','Invoices'),(4009,'error.ajax','There was an error while processing your request'),(4010,'mobile.login.password','Watchword'),(4011,'translationMessage.search.showOnlyEmpty','Only empty values'),(4012,'reports.stats.activity.singlePeriod.loginTimes.row1','Login times per member'),(4013,'memberPos.status.PIN_BLOCKED','Blocked PIN'),(4014,'guarantee.status.ACCEPTED','Accepted'),(4015,'member.bulkActions.brokerChanged','{0} members were changed to broker {2}.\n{1} members were not changed because they already had {2} as broker'),(4016,'menu.operator.personal','Personal'),(4017,'settings.log.traceLevel.DETAILED','Detailed tracing (including parameters)'),(4018,'settings.local.decimalInputMethod','Decimal numbers input method'),(4019,'group.customizedFiles.title.new','Customize new file for {0}'),(4020,'pos.actions.discard','Discard'),(4021,'loanPayment.summary.discardedPayments','Discarded payments'),(4022,'paymentObligation.title.selectPaymentObligation','Select payment obligations'),(4023,'receiptPrinterSettings.printerName','Local printer name'),(4024,'conversionSimulation.result.feelessAmount','Resulting amount'),(4025,'permission.adminMemberBrokerings.manageCommissions','Manage commissions'),(4026,'settings.local.csv.stringQuote.SINGLE_QUOTE','Single quote'),(4027,'image.file','File'),(4028,'pos.actions.block','Block'),(4029,'menu.operator.account','Account'),(4030,'reports.stats.activity.comparePeriods.grossProduct.row2','Gross Product over all members'),(4031,'reference.paymentDatails','Payment details'),(4032,'reports.stats.activity.comparePeriods.grossProduct.row1','Gross Product per member with income'),(4033,'rates.message.initializationAlreadyRunning','A Rate initialization job is currently running on this currency.\nThis means that the currency cannot be modified.\nWatch the system alerts to find out when the job is finished.'),(4034,'permission.brokerReports.view','View'),(4035,'transferType.minAmount','Min amount'),(4036,'reports.current.n_enabled','Number of enabled Members'),(4037,'reports.stats.activity.keyParams','Key parameters for activity'),(4038,'customField.member.access.BROKER','Broker'),(4039,'menu.member.account.transfersAuthorizations','Authorization history'),(4040,'permission.systemTranslation.manageNotification','Notification'),(4041,'pos.status.BLOCKED','Blocked'),(4042,'accountFee.lastExecution','Last execution'),(4043,'member.memberName','Member name'),(4044,'permission.systemLoanGroups','Loan groups'),(4045,'profile.action.manageCards','Manage cards'),(4046,'errorLog.removeOne.confirm','Remove this error log entry?'),(4047,'fileMapping.resetConfirmation','Reset file mapping?'),(4048,'errorLog.search.date.end','End data'),(4049,'permission.operatorGuarantees.sellWithPaymentObligations','Sell with payment obligations'),(4050,'cardType.error.removing','The card type could not be removed because it belongs to at least one group or there is at least one card associated'),(4051,'transactionFee.chargeType.FIXED','Fixed value'),(4052,'receiptPrinter.error.noConfiguration','No receipt printer configuration found'),(4053,'ad.inserted','Advertisement inserted'),(4054,'message.action.DELETE','Remove permanently'),(4055,'cardType.inserted','The card type was inserted'),(4056,'registrationAgreement.error.removing','The registration agreement could not be removed. \n\nIt is either in use by a group or already accepted by members in past'),(4057,'menu.admin.reports.members','Member reports'),(4058,'settings.error.importing','Error importing settings file'),(4059,'reports.current.invoices.MEMBER.count','Number of member invoices'),(4060,'image.removed','Image removed'),(4061,'memberImport.title.details.all','All imported members'),(4062,'permission.brokerMemberPayments.paymentAsMemberToMember','Payment as member to member'),(4063,'permission.brokerPos.view','View'),(4064,'menu.member.preferences.receiptPrinterSettings','Receipt printers'),(4065,'transfer.type','Transaction type'),(4066,'editCard.error.transactionPasswordBlocked','In order to edit  your card, you need the transaction password.\nHowever, your transaction password is blocked.\nPlease, contact the administration'),(4067,'admin.title.search','Search administrators'),(4068,'settings.message.messageMailSubjectPrefix','Mail subject prefix'),(4069,'channel.credentials','Credentials'),(4070,'global.datePattern.month','mm'),(4071,'infoText.title.new','New info text'),(4072,'permission.systemReports.memberList','Member lists'),(4073,'alert.title.search','Alerts history'),(4074,'customField.control.SELECT','Select box'),(4075,'settings.local.sms.sendSmsWebServiceUrl','Send SMS Web Service URL'),(4076,'permission.systemThemes.import','Import'),(4077,'pin.unblock.button','Unblock pin'),(4078,'payment.performed','The payment has been performed'),(4079,'reports.stats.choose.activity','Activity of members'),(4080,'customField.memberRecord.brokerAccess.READ_ONLY','Read only'),(4081,'adInterest.category','Ad category'),(4082,'settings.message.adminPendingBuyerOnlyGuarantee','Guarantee awaiting authorization (only buyer)'),(4083,'global.textFormat.PLAIN','Plain text'),(4084,'ad.publicationPeriod.begin','Publication date'),(4085,'reports.members_reports.account_type.all','All account types'),(4086,'mobile.credentials.PIN','PIN'),(4087,'reports.stats.activity.singlePeriod.percentageNoTrade.yAxis','% not trading'),(4088,'menu.operator.member.messages','Messages'),(4089,'help.title.advertisements','Advertisements'),(4090,'customImage.title.style','Style sheet images'),(4091,'receipt.posweb.transactions.transfers','Processed payments'),(4092,'message.type.GUARANTEE','Guarantees'),(4093,'loanGroup.name','Group name'),(4094,'menu.admin.reports.statistics','Statistical analysis'),(4095,'changeGroup.action.remove','Remove permanently'),(4096,'activities.brokering.numberMembers','Brokered members'),(4097,'accountType.inserted','The account type was inserted'),(4098,'adInterest.type.OFFER','Offer'),(4099,'menu.admin.personal','Personal'),(4100,'menu.member.preferences.notifications','Notifications'),(4101,'reports.stats.general.growth','Growth'),(4102,'reports.stats.activity.singlePeriod.percentageNoTrade','Percentage of members not trading'),(4103,'authorizationLevel.action.new','New authorization level'),(4104,'operator.username','Operator login'),(4105,'reports.stats.keydevelopments.highestAmountPerTransaction','Highest amount per transaction'),(4106,'menu.member.help','Help'),(4107,'message.rootType','Type'),(4108,'messageCategory.title.list','Message categories'),(4109,'permission.adminMemberReports.view','View'),(4110,'menu.admin.usersGroups.members','Manage Members'),(4111,'reports.stats.keydevelopments.throughTime.YEAR','Each year'),(4112,'serviceClient.channel','Channel'),(4113,'memberImport.initialCredits','Initial credits'),(4114,'transactionFee.inserted','The transaction fee was inserted '),(4115,'invoice.title.of','Invoices of {0}'),(4116,'menu.admin.accounts.transfersAuthorizations','Authorization history'),(4117,'permission.brokerRemarks','Remarks'),(4118,'permission.adminMemberInvoices.accept','Accept invoices'),(4119,'pos.actions.unblock','Unblock'),(4120,'home.status.title','Status'),(4121,'reports.members.accounts','Accounts'),(4122,'guarantee.paymentObligationList','Payment obligation list'),(4123,'settings.message.invoiceAccepted','Invoice accepted'),(4124,'changeBroker.old','Old broker'),(4125,'pos.unassigned','The POS was unassigned'),(4126,'menu.member.preferences','Preferences'),(4127,'transactionFee.invalidChargeValue',' {0} (Charge value)'),(4128,'operator.search.noResults','No matching operators found'),(4129,'global.weekDay.short.WEDNESDAY','Wed'),(4130,'global.percentPerDay','% / day'),(4131,'invoice.title.my','My invoices'),(4132,'customField.validation.required','Required'),(4133,'adImport.status.MISSING_OWNER','Missing owner member'),(4134,'externalTransferType.action.new','Insert new payment type'),(4135,'paymentObligation.inserted','The payment obligation was inserted'),(4136,'menu.admin.usersGroups.memberRecordTypes','Member record types'),(4137,'memberRecord.date','Created at'),(4138,'permission.adminMemberBulkActions.changeBroker','Change broker'),(4139,'externalTransferImport.error.removing','The transaction import could not be removed, because it has checked or processed transactions'),(4140,'sms.error.type.ALLOW_CHARGING_DISABLED','No free SMS left, adittional SMS charging is disabled'),(4141,'customField.title.list.operator','Operator custom fields'),(4142,'document.action.new.static','New static document'),(4143,'adCategory.inserted','The category was inserted'),(4144,'transfer.aRate','A-rate'),(4145,'settings.access.transactionPasswordChars','Possible characters in transaction password'),(4146,'permission.adminMemberRecords.delete','Delete'),(4147,'group.settings.defaultMailMessages','Default messages sent by mail'),(4148,'posweb.searchTransactions.title.scheduledPayments','Scheduled payments'),(4149,'transactionPassword.status.user.BLOCKED','Blocked'),(4150,'customImage.system.message_removed','Message on trash icon'),(4151,'reports.stats.activity.comparePeriods.numberTransactions.title','Number of Transactions per member (comparing two periods)'),(4152,'memberImport.status.INVALID_CREATION_DATE','Invalid creation date: {0}'),(4153,'reports.stats.period.periodCompared','Period to compare with'),(4154,'activities.invoices.outgoing.amount','Outgoing amount'),(4155,'global.month.JANUARY','January'),(4156,'permission.module.type.BROKER','Broker permissions of {0}'),(4157,'reports.stats.choose.balances','Balances'),(4158,'currency.pattern','Pattern'),(4159,'card.updateCard.error.userBlocked','You have exceeded the allowed login password trials, and your login is now blocked'),(4160,'error.general','An internal error in the Application occured'),(4161,'sms.type.GENERAL.description','General'),(4162,'permission.memberPreferences.manageAdInterests','Manage ad interests'),(4163,'guarantee.action.cancel','Cancel'),(4164,'translationMessage.import.error.noFile','Please, select the properties file'),(4165,'reports.members.download_btn','Download report'),(4166,'permission.systemPayments.payment','System payment'),(4167,'account.balance','Account balance'),(4168,'global.textFormat.RICH','Rich text'),(4169,'menu.operator.help','Help'),(4170,'serviceOperation.MEMBERS','Search members'),(4171,'login.operator.form.text','If you are a registered operator, you can login with the member\'s username, your username and password below.'),(4172,'reports.stats.finances.ComparePeriods.expenditure.yAxis','Expenditure'),(4173,'brokerCommissionContract.inserted','The broker commission contract was inserted'),(4174,'groupFilter.customizedFiles.noResults','This group filter has no customized files'),(4175,'reports.stats.keydevelopments.transactionAmount.median','Transaction amount'),(4176,'paymentObligation.error.maxPublicationDateAfterExpirationDate','The max. publication date can not be after the expiration date'),(4177,'guarantee.expiresTo','Expires to'),(4178,'quickAccess.messages','Messages'),(4179,'alert.system.ACCOUNT_FEE_RECOVERED','Account fee recovered'),(4180,'settings.local.memberResultDisplay.USERNAME','Member login name'),(4181,'member.action.create.selectGroup','Select member group'),(4182,'reports.stats.keydevelopments.throughTime.alert','You can only select the item \"through time\" in combination with other items.'),(4183,'settings.type.MAIL_TRANSLATION','E-mails'),(4184,'receiptPrinterSettings.remove.confirm','Are you sure to remove this receipt printer settings?'),(4185,'posweb.client.username','Client login'),(4186,'guaranteeType.status.ENABLED','Enabled'),(4187,'settings.message.pendingBuyerOnlyGuaranteeIssuer','Guarantee awaiting authorization (only buyer)'),(4188,'permission.adminMemberLoans.viewAuthorized','View authorized loans'),(4189,'loanGroup.removed','The loan group was removed'),(4190,'reports.stats.activity.topten.numberTransactions.col1','Number of transactions'),(4191,'receiptPrinterSettings.created','The receipt printer settings were created'),(4192,'permission.adminAdmins.changeProfile','Change profile'),(4193,'transactionPassword.error.generating','An error occurred while generating the transaction password.\nPlease, try again later'),(4194,'permission.operatorPayments.authorize','Authorize or deny'),(4195,'guaranteeType.status.DISABLED','Disabled'),(4196,'settings.local.decimalInputMethod.LTR','Left to right (the decimal separator must be typed)'),(4197,'document.currentFile','Current file'),(4198,'createMember.registrationAgreementButton','I accept the above registration agreement'),(4199,'loan.grant.confirmation.group','You are goint to grant a loan of {0} to group {1}, having {2} as responsible.{3}\n\nPlease, click OK to proceed'),(4200,'admin.name','Full name'),(4201,'loan.status.AUTHORIZATION_DENIED','Autorization denied'),(4202,'permission.adminMembers.managePending','Manage pending members'),(4203,'permission.operatorMessages.view','View'),(4204,'reports.stats.finances.ComparePeriods.income','Income'),(4205,'alert.system.newVersionOfHelpFile','There is a new version of a customized help file, {0}.\nPlease, check the customization in order to resolve possible conflicts'),(4206,'global.choose','Choose ...'),(4207,'loan.queryStatus.IN_PROCESS','In process'),(4208,'permission.memberAds.publish','Publish'),(4209,'global.preview','Preview'),(4210,'externalAccount.title.modify','Modify external account'),(4211,'guaranteeType.removeConfirmation','Remove guarantee type?'),(4212,'menu.admin.ads','Advertisements'),(4213,'permission.adminMembers.changeProfile','Change profile'),(4214,'profile.action.accountInformation','Account information'),(4215,'theme.title','Title'),(4216,'reports.stats.choose.finances','Finances'),(4217,'guarantee.issuerUsername','Issuer login'),(4218,'conversionSimulation.result','Conversion Simulation Results'),(4219,'memberImport.status.BALANCE_UPPER_THAN_CREDIT_LIMIT','The balance is upper than the credit limit'),(4220,'loan.grant.confirmation.member','You are goint to grant a loan of {0} to {1}.{2}\n\nPlease, click OK to proceed'),(4221,'profile.action.creditLimit','Set credit limit'),(4222,'settings.log.restLevel','REST services log level'),(4223,'transactionFee.chargeType.PERCENTAGE','Percentage'),(4224,'accountHistory.title.of','Search transactions of {0} on {1}'),(4225,'brokerCommissionContract.action.selectBrokerCommission','Select commission type'),(4226,'reports.print.limitation','The report has been limited to {0} rows.'),(4227,'paymentObligation.registrationDate','Registration date'),(4228,'sms.type.ACCOUNT_DETAILS.description','Account details'),(4229,'permission.adminMemberInvoices.acceptAsMemberFromMember','Accept invoice from member as member'),(4230,'loan.title.print','Loans search result'),(4231,'conversionSimulation.amount','Amount to convert'),(4232,'settings.local.maxAjaxResults','Max. Ajax results'),(4233,'customImage.removeConfirmation','Remove this image?'),(4234,'ad.title.search','Search for products and services'),(4235,'changePassword.oldPassword','Current password'),(4236,'reports.simulations.choose.aRateConfig','A-rate configuration'),(4237,'accountHistory.title.my','Search transactions on {1}'),(4238,'menu.admin.guarantees.searchGuarantees','Guarantees'),(4239,'image.details.success','The image details were successfully saved'),(4240,'registrationAgreement.removed','The registration agreement was removed'),(4241,'help.title.loan_groups','Loan groups'),(4242,'transferType.error.removing','This transaction type cannot be removed because there are related fees or transactions of this type '),(4243,'channel.removed','The channel was removed'),(4244,'group.title.settings.payments','Payment settings'),(4245,'smsLog.status.DELIVERED','Delivered'),(4246,'defaultBrokerCommission.validity','Validity'),(4247,'permission.brokerCards.unblockSecurityCode','Unblock card security code'),(4248,'customField.title.modify.loanGroup','Modify loan group custom field'),(4249,'payment.error.pendingCommissionContract','The payment could not be processed because there is a pending commission contract related to the commission: {0}'),(4250,'accountFee.title.logDetails','Account fee execution details'),(4251,'sms.type.ACCOUNT_DETAILS_ERROR.description','Account details error'),(4252,'image.details','Details'),(4253,'reports.simulations.aRateConfigSimulation.range.percentUnits','% of total guarantee period'),(4254,'reports.stats.taxes.totalSum','Total Sum'),(4255,'settings.local.internationalization','Internationalization'),(4256,'image.error.removing','The image could not be removed'),(4257,'brokerCommissionContract.denyConfirmation','Deny this broker commission contract?'),(4258,'reports.simulations.dRate.config.graph','Fee percentage vs D-rate'),(4259,'global.iRate.steps','steps'),(4260,'accountType.removed','The account was removed'),(4261,'transactionFee.finalAmount','Amount less or equals'),(4262,'card.updateCard.cardCodesAreNotEqual','The card codes are not equals'),(4263,'menu.admin.accessDevices','Access Devices'),(4264,'settings.message.invoiceCancelled','Invoice cancelled'),(4265,'pos.error.posIdExists','The identifier already exists. Please select another.'),(4266,'permission.brokerMembers.register','Register'),(4267,'reports.stats.transferTypeFilter','Transfer type filter'),(4268,'changePassword.forceChange','Force change on next login'),(4269,'changePin.error.mustBeNumeric','The pin can only contain numbers'),(4270,'settings.message.invoiceDenied','Invoice denied'),(4271,'help.title.transaction_feedback','Transaction feedback'),(4272,'channel.errorRemoving','The channel couldn\'t be removed'),(4273,'profile.action.brokeringActions','Brokering'),(4274,'transactionFee.brokerGroups','Broker groups'),(4275,'externalTransferProcess.confirmation','You are going to process the selected payments.\n\nAre you sure?'),(4276,'serviceClient.ignoreRegistrationValidations','Ignore e-mail and custom field validations'),(4277,'customizedFile.modified','The file was modified'),(4278,'help.title.bookkeeping','Bookkeeping'),(4279,'login.error.inactive','Your account has not yet been activated.\nPlease, contact the administration.'),(4280,'settings.message.adminNewPendingPayment','New payment for admin to authorize'),(4281,'reference.title.transactionFeedbacks.of','{0}\'s transaction feedbacks'),(4282,'transactionFee.deductAmount.true','Deduct from total amount'),(4283,'reports.stats.activity.comparePeriods.grossProduct.row1.short','with income'),(4284,'reports.simulations.aRateConfigSimulation.endA','End at A ='),(4285,'channel.displayName','Display name'),(4286,'registrationAgreement.new','Insert new registration agreement'),(4287,'reports.stats.activity.throughTime.percentageNoTrade.col1','Percentage not trading'),(4288,'brokerCommission.removeConfirmation','Remove this broker commission?'),(4289,'transactionPassword.status.user.NEVER_CREATED','Not generated'),(4290,'smsLog.title.searchMy','Search SMS history'),(4291,'permission.systemSettings.manageLocal','Manage local settings'),(4292,'card.action.cancel','Cancel'),(4293,'settings.mail.smtp','SMTP server parameters'),(4294,'help.title.user_management','User management'),(4295,'ad.title.modify','Modify advertisement'),(4296,'profile.member.addPicture','Add picture'),(4297,'permission.systemExternalAccounts.check','Check Payment'),(4298,'help.title.alerts_logs','Alerts & Logs'),(4299,'settings.access.error.virtualKeyboard.groupsRequireSpecial','{0} cannot be enabled because there is at least one group which requires special characters on passwords'),(4300,'reports.stats.keydevelopments.numberOfMembers.numberOfDisappearedMembers.short','Disappeared'),(4301,'reference.direction.general.RECEIVED','Received references'),(4302,'pos.search.noResults','No POS was found'),(4303,'theme.action.remove','Remove'),(4304,'authorizationLevel.error.removing','It\'s not possible to remove this authorization level because there are payments depending on it'),(4305,'reports.stats.keydevelopments.throughTime.title','Developments through the time'),(4306,'loan.repayment.amount','Amount'),(4307,'loanPayment.number','Number'),(4308,'transactionFee.when.ALWAYS','Always'),(4309,'document.documentPage','Document page'),(4310,'reports.members_reports.number','Number'),(4311,'ad.maxAdsMessage','Please delete one or more products & services to be able to create a new one'),(4312,'customField.moveValue','Replace occurrences by'),(4313,'groupFilter.customizedFiles.removed','The file is no longer customized for this group filter'),(4314,'externalTransferType.error.removing','The payment type could not be removed'),(4315,'settings.local.applicationUsername','Application username'),(4316,'changePin.error.blockedTransactionPassword','Blocked transaction password'),(4317,'permission.brokerMemberAccess.transactionPassword','Manage transaction password'),(4318,'payment.goToAccountHistory','Go to account history'),(4319,'transactionFee.fromFixedMember.name','Will be charged full name'),(4320,'customField.confirmUnhide','You have turned off the can hide checkbox for this field.\nSaving this field like this means that for all members\nexisting information in this field becomes visible for others.\n\nAre you sure?'),(4321,'transactionFee.modified','The transaction fee was modified'),(4322,'reports.stats.activity.comparePeriods.loginTimes.row1','Logins per member'),(4323,'paymentObligation.publish','Publish'),(4324,'fieldMapping.field.MEMBER_ID','Member internal identifier'),(4325,'accountFeeLog.skippedMembers','Skipped members'),(4326,'permission.adminMembers.import','Import'),(4327,'help.title.profiles','Profile'),(4328,'ad.publicationPeriod.permanent','Permanent'),(4329,'smsMailing.date','Date'),(4330,'adImport.status.INVALID_OWNER','Invalid owner member: {0}'),(4331,'settings.local.transactionNumber.suffix','Suffix'),(4332,'loanPayment.summary.receivedPayments','Received payments'),(4333,'adminTasks.onlineState.online','The system is currently <span class=\'fieldDecoration\'><b>online</b></span>'),(4334,'reference.level','Value'),(4335,'transactionPassword.reset.confirmMessage','Are you sure to reset the member\'s transaction password? '),(4336,'alert.system.NULL_RATE',''),(4337,'home.admin.status.systemUptime.message','{0} day(s), {1} hour(s)'),(4338,'reports.stats.transactionFeeFilters','Transaction Fees'),(4339,'accountFee.action.run','Run now'),(4340,'externalTransfer.status.TOTAL','Total'),(4341,'group.error.passwordPolicyNumeric','{0} cannot be set to force letters or special characters because the access settings defines the password as numeric'),(4342,'home.status.newPayments','You received {0} new payments since your last login'),(4343,'customImage.system.quickAccess_updateProfile','Quick access: update profile'),(4344,'brokerCommission.error.removing','The broker commission could not be removed because it was already charged or it was already customized by a broker'),(4345,'adCategory.modified','The category was modified'),(4346,'memberRecord.lastModified','Modified at'),(4347,'guarantee.issuedDate','Issued date'),(4348,'customImage.upload','Upload new'),(4349,'payment.confirmation.cancel','You are going to cancel this payment.\n\nPlease click OK to confirm'),(4350,'transactionFee.aRateParameters','A-rate parameters'),(4351,'menu.admin.externalAccounts.fileMappings','File Mappings'),(4352,'accountFeeLog.openInvoices','Open invoices'),(4353,'transferType.fields.title.list','Payment custom fields'),(4354,'loan.queryStatus.EXPIRED','Expired'),(4355,'permission.systemTasks','Adminstrative tasks'),(4356,'infoText.new','Create New'),(4357,'externalTransfer.amount','Amount'),(4358,'settings.message.adminApplicationError','Application errors'),(4359,'reports.stats.keydevelopments.transactionAmount.highest','highest'),(4360,'group.settings.maxAmountPerDay','Maximum amount per day per payment type'),(4361,'memberRecordType.fields.title.list','Custom fields'),(4362,'externalAccount.error.removing','The value was not removed because it is currently being used'),(4363,'transfer.title.print','Transaction information'),(4364,'operator.created','The operator has been successfully created'),(4365,'group.nature.BROKER','Broker'),(4366,'fileMapping.decimalSeparator.error.required','Decimal separator is required'),(4367,'group.permissions','Edit permissions'),(4368,'settings.mail.invitation','Invitation mail'),(4369,'ad.id','MemberId'),(4370,'brokerCommissionContract.broker','Broker'),(4371,'viewChannels.title.of','View channels of {0}'),(4372,'global.removeSelected','Remove selected'),(4373,'reports.stats.finances.ThroughTime.expenditure.yAxis','Expenditure'),(4374,'accountHistory.creditsDebitsBalance.amount','Transactions balance'),(4375,'brokerCommissionContract.modified','The broker commission contract was modified'),(4376,'pos.discarded','The POS was discarded'),(4377,'reports.stats.activity.singlePeriod.loginTimes.yAxis','Logins / member'),(4378,'reports.stats.keydevelopments.numberOfAds.created','Created ads '),(4379,'contact.removed','The contact was removed'),(4380,'transferType.isLoan','Is loan'),(4381,'transactionFee.chargeType.A_RATE','A-rate'),(4382,'message.type.PAYMENT_OBLIGATION','Payment obligations'),(4383,'transactionFee.subject.SOURCE','Member paying (source)'),(4384,'reports.stats.keydevelopments.periodType.COMPARED_PERIODS','Compared periods'),(4385,'memberImport.initialCreditTransferType.empty','Ignore positive balances'),(4386,'permission.adminMemberLoanGroups','Loan group membership'),(4387,'brokerCommission.suspended','The broker commission was suspended'),(4388,'payment.status','Status'),(4389,'permission.brokerMemberAccess.changePin','Change pin'),(4390,'permission.systemCustomizedFiles.manage','Manage'),(4391,'pendingMember.resendEmail','Resend validation email (last sent at {0})'),(4392,'permission.adminMemberPos.block','Block'),(4393,'permission.operatorReferences.manageMemberTransactionFeedbacks','Manage my transaction feedbacks'),(4394,'serviceClient.title.insert','Insert web services client'),(4395,'loan.repayment.transactionPassword.canPerformExpiredAction','In order to change the loan status, you must supply your transaction password'),(4396,'accountFeeLog.totalAmount','Total amount'),(4397,'guaranteeType.forwardTransferType','Forward'),(4398,'posLog.by','By'),(4399,'menu.member.account.loans','Loans'),(4400,'customField.action.new','New custom field'),(4401,'profile.action.changeBroker','Set broker'),(4402,'permission.systemStatus.viewConnectedMembers','View connected members'),(4403,'contact.notes','Notes'),(4404,'paymentObligation.sellerName','Seller name'),(4405,'icon.title.notConciliated','Payment not conciliated'),(4406,'paymentObligation.pack.details.title','Details'),(4407,'menu.admin.accounts.memberPayment','Member Payment'),(4408,'accountFee.nextExecution','Next execution'),(4409,'customField.payment.type.LINKED','Linked from {0}'),(4410,'permission.systemPayments.chargeback','Chargeback payment to system'),(4411,'externalAccountHistory.button.processPayments','Process payments'),(4412,'customizedFile.title.customize.css','Customize style sheet'),(4413,'transferType.feedbackExpirationTime','Max feedback period'),(4414,'operator.action.create','Create a new operator'),(4415,'settings.local.modified','The local settings were modified'),(4416,'payment.error.invalidTransferType','Invalid transaction type'),(4417,'settings.local.precision','Number precision'),(4418,'brokering.error.circularBrokering','Circular brokering:\nA member is assigned to him/herself as a broker.'),(4419,'transferType.removeConfirmation','Remove this transaction type?'),(4420,'changePassword.newPassword','New password'),(4421,'adImport.status.MISSING_CATEGORY','Missing category'),(4422,'theme.selected','The theme is now selected.\nYou may need to clear your browser\'s cache and reload the page in order to see the changes'),(4423,'authorizationLevel.title.edit','Edit authorization level'),(4424,'reports.stats.activity.histogram.grossProduct','Histogram of gross product'),(4425,'memberRecord.removeConfirmation','Remove this {0}?'),(4426,'paymentObligation.selectIssuer','Selected issuer:'),(4427,'card.changeSecurityCode.error.obvious','The security code is too simple. It cannot be sequential, nor equals to any profile field'),(4428,'settings.alert.idleInvoiceExpiration','Invoice expiration'),(4429,'settings.local.transactionNumber.prefix','Prefix'),(4430,'group.action.personalMessage','Send personal message to members'),(4431,'groupFilter.name','Name'),(4432,'permission.systemReports.simulations','Simulations'),(4433,'permission.adminMemberInvoices.sendAsMember','Send invoice as member'),(4434,'conversionSimulation.result.result','Result'),(4435,'cardSecurityCode.error.blocked','The card security code is now temporarily blocked'),(4436,'permission.systemAdminGroups','Admin groups'),(4437,'member.search.allGroups','All groups'),(4438,'guarantee.buyer','Buyer'),(4439,'menu.admin.customFields.loanFields','Loan Fields'),(4440,'adCategory.action.export','Export all categories to file'),(4441,'profile.action.managePasswords','Manage passwords'),(4442,'global.loading','Loading. Please wait...'),(4443,'reports.stats.filters','Filters...'),(4444,'admin.adminName','Admin name'),(4445,'reference.direction.general.GIVEN','Given references'),(4446,'menu.admin.accounts.memberInvoice','Member Invoice'),(4447,'menu.admin.translation.application','Application'),(4448,'errors.required','{0} is required'),(4449,'adminTasks.indexes.rebuild','Rebuild'),(4450,'loan.grantFeeRepaymentType','Grant fee repayment type'),(4451,'theme.select.message','Choose theme'),(4452,'member.brokerName','Broker name'),(4453,'currency.aRate.initDate','Initialization date for A-rate'),(4454,'permission.brokerCards.activate','Activate'),(4455,'settings.local.maxPageResults','Max. page results'),(4456,'permission.brokerInvoices.sendAsMemberToMember','Send as member to member'),(4457,'global.change','Change'),(4458,'conversionSimulation.result.amount','Amount'),(4459,'settings.log.accountFeeLevel.OFF','Off'),(4460,'permission.adminMemberSmsMailings.view','View'),(4461,'memberImport.group','Permission group'),(4462,'loan.description','Description'),(4463,'channel.title.list','Channels'),(4464,'loan.status.UNRECOVERABLE','Unrecoverable'),(4465,'paymentFilter.inserted','The payment filter was inserted'),(4466,'adminTasks.onlineState.offline','The system is currently <span class=\'fieldDecoration\'><b>offline</b></span>'),(4467,'activities.transactions.averageBuy','Paid - average amount'),(4468,'reference.transactionFeedback.role.SELLER','Payments received'),(4469,'fileMapping.decimalPlaces','Decimal places'),(4470,'settings.message.adminPaymentFromMemberToSystem','Payments from member to system'),(4471,'quickAccess.placeAd','Place ad'),(4472,'transactionPassword.generate','Get transation password'),(4473,'help.title.contacts','Contacts'),(4474,'settings.message.loginBlocked','Login blocked by invalid trials'),(4475,'customImage.uploaded','The image was uploaded, if it isn\'t displayed try refreshing the page.'),(4476,'reports.stats.paymentfilter','Payment filter'),(4477,'permission.operatorAccount.authorizedInformation','View authorized payments'),(4478,'memberRecord.by','Created by'),(4479,'externalAccount.removed','The external account was removed'),(4480,'permission.memberAccess.changeChannelsAccess','Change channels access'),(4481,'reports.stats.activity.topten.login.title','Top ten of logins'),(4482,'permission.systemAccountFees.charge','Charge'),(4483,'settings.message.brokeringExpiration','Brokering expiration'),(4484,'fieldMapping.order','Order'),(4485,'guarantee.registrationDate','Registration date'),(4486,'accountFeeLog.rechargingFailed','Recharging failed members...'),(4487,'group.initialGroup','Initial group'),(4488,'reports.stats.choose.taxes','taxes & fees'),(4489,'brokering.notes','Notes'),(4490,'card.cardCodeChanged','Card security code changed'),(4491,'defaultBrokerCommission.status.ACTIVE','Active'),(4492,'transfer.scheduling.MULTIPLE_FUTURE','Multiple scheduled payments'),(4493,'settings.type.ACCESS','Access settings'),(4494,'errors.notAllowed.loanInPast','Loan granting in the past is not possible if rates are enabled.\nThis is a configuration error; please contact a system admin.'),(4495,'channel.inserted','The channel was inserted'),(4496,'profile.neverLoggedOn','Never logged'),(4497,'permission.systemDocuments','Customized documents'),(4498,'serviceClient.noResults','There are no web services clients'),(4499,'menu.operator.search.ads','Products & Services'),(4500,'reports.stats.show','Show'),(4501,'serviceOperation.SMS','Send SMS messages'),(4502,'paymentObligation.history','History'),(4503,'memberImport.confirm','Import'),(4504,'reports.stats.keydevelopments.numberOfMembers.numberOfNewMembers.short','New'),(4505,'permission.memberPayments.paymentToMember','Member payments'),(4506,'customField.ad.searchVisibility','Search visibility'),(4507,'reports.stats.keydevelopments.numberOfTransactions.yAxis','Number'),(4508,'group.status','Status'),(4509,'member.name','Full name'),(4510,'accountFee.title.list','Account fees'),(4511,'posweb.client.loginPassword','Password'),(4512,'memberPos.title.noPos','No POS for member'),(4513,'brokerCommissionContract.cancelled','The broker commission contract was cancelled'),(4514,'currency.inserted','The currency was inserted'),(4515,'global.month.NOVEMBER','November'),(4516,'scheduledPayment.accountType','Account'),(4517,'pos.status.ACTIVE','Active'),(4518,'paymentObligation.status.REGISTERED','Registered'),(4519,'customField.ad.searchVisibility.ADVANCED','Advanced search'),(4520,'payment.confirmation.fees','The following fees will be applied if you accept:'),(4521,'permission.memberPayments.paymentToSelf','Self payment'),(4522,'permission.systemCurrencies.manage','Manage'),(4523,'reference.action.set','Set reference'),(4524,'accountFeeLog.amount','Amount'),(4525,'global.weekDay.short.THURSDAY','Thu'),(4526,'smsLog.date','Date'),(4527,'alert.type.MEMBER','Member'),(4528,'createAdmin.passwordConfirmation','Confirm password'),(4529,'groupFilter.customizedFiles.customized','The file is now customized for this group filter'),(4530,'reports.members_reports.debits','Debits'),(4531,'reports.members.presentation.result','Member report result'),(4532,'authorizationLevel.authorizer','Authorizer'),(4533,'transactionFee.aFIsZero','0% at A-rate = ...'),(4534,'card.title.search','Cards search'),(4535,'pos.error.unvailable','This POS is unvailable for assignement'),(4536,'pos.unassignPos.confirmation','Unassign POS from member?'),(4537,'settings.local.sms.channel','Operations channel'),(4538,'settings.local.memberResultDisplay','Member display name'),(4539,'permission.adminAdmins.changeGroup','Change group'),(4540,'contact.title.edit','Edit contact note'),(4541,'menu.admin.logout','Logout'),(4542,'account.availableBalance','Available balance'),(4543,'accountFeeLog.status.TRANSFER','Payment'),(4544,'customField.possibleValue.inserted','The value was inserted'),(4545,'menu.admin.usersGroups.registrationAgreements','Registration agreements'),(4546,'settings.log.traceFile','Action logfile path / name'),(4547,'customizedFile.select.type','Select type'),(4548,'changeGroup.admin.confirmPermanentRemove','Remove administrator permanently?'),(4549,'accountFee.action.run.confirmation','You are going to run an account fee.\n\nPlease click OK to confirm'),(4550,'customField.possibleValue.error.removing','The value was not removed because it is currently being used'),(4551,'permission.systemExternalAccounts.details','Details'),(4552,'quickAccess.accountInfo','Account(s)'),(4553,'translationMessage.import.type.REPLACE','Replace entire file'),(4554,'home.admin.status.memberAlerts','Number of member alerts'),(4555,'member.title.bulkActions.action','Action'),(4556,'payment.confirmation.appliedFees','Applied fees'),(4557,'transferAuthorization.date','Date'),(4558,'admin.adminUsername','Admin user name'),(4559,'error.validation','Invalid form submission'),(4560,'scheduledPayment.title.print','Scheduled payment information'),(4561,'settings.mail.smtpPassword','Password'),(4562,'group.nature.ADMIN','Admin'),(4563,'help.title.brokering','Brokering'),(4564,'sms.error.type.SEND_ERROR','Unknown error'),(4565,'reports.stats.general.year','year'),(4566,'card.created','Card has been created'),(4567,'guarantee.createGuarantee','Create guarantee'),(4568,'brokerCommission.error.stopping','Error stopping the broker commission!'),(4569,'posweb.action.logout','Logout (F10)'),(4570,'rates.reinit.date','Reinitialization date'),(4571,'createMember.title.byAdmin','Register new member'),(4572,'menu.admin.messages','Messages'),(4573,'admin.search.noResults','No administrators were found'),(4574,'changeBroker.new','New broker'),(4575,'message.sendTo.MEMBER','Member'),(4576,'externalAccount.memberAccount','Member account'),(4577,'settings.local.emailRequired','Obligatory e-mail for members'),(4578,'global.timePeriod.SECONDS','Second(s)'),(4579,'fieldMapping.title.order','Set field mappings order'),(4580,'error.image','The given image could not be uploaded'),(4581,'customField.title.order.operator','Set opeartor custom field order'),(4582,'menu.admin.cards.list','Search cards'),(4583,'reports.stats.throughTheTime','Through the time'),(4584,'global.weekDay.short.SATURDAY','Sat'),(4585,'virtualKeyboard.full','Full'),(4586,'payment.invalid.paymentAmount','The total payment amount must be the same as the sum of each payment\'s amount'),(4587,'externalTransferImport.noFile.message','Please, select the file to import'),(4588,'brokerCommissionContract.amount','Amount'),(4589,'permission.brokerMessages.manage','Manage'),(4590,'operator.action.create.selectGroup','Select group'),(4591,'webshop.payment.descriptionText','Product information:'),(4592,'reports.stats.activity.comparePeriods.percentageNoTrade.title','Percentage of members not trading (comparing two periods)'),(4593,'document.newFile','Upload file'),(4594,'member.title.print','Member search results'),(4595,'reports.stats.keydevelopments.throughTime.throughTime','Through time'),(4596,'guarantee.expiresFrom','Expires from'),(4597,'group.settings.emailValidation.USER','Public registration or user editing own profile'),(4598,'permission.systemCustomFields.view','View'),(4599,'customImage.system.noPicture','No picture'),(4600,'customField.validation.validatorClass','Validator class'),(4601,'reports.stats.chooseStatisticsCategories','Please choose one category of statistics to show'),(4602,'permission.systemStatus','System status'),(4603,'guarantee.name','Name'),(4604,'externalTransferProcess.error.noTransferTypeToPay','No possible payment types'),(4605,'createMember.action.saveAndOpenProfile','Save and open profile'),(4606,'customField.inserted','The custom field was inserted'),(4607,'transferType.error.minMaxPerDayAmount','The minimum amount must not exceed the maximum per day'),(4608,'reports.stats.keydevelopments.throughTime.show','Show'),(4609,'transfer.description','Description'),(4610,'reports.stats.activity.histogram.numberTransactions','Histogram of number of transactions'),(4611,'mobile.error.title','Error'),(4612,'menu.admin.translation','Translation'),(4613,'menu.operator.guarantees','Guarantees'),(4614,'global.search.all','All'),(4615,'mobile.payment.error.invalid','Invalid payment'),(4616,'mobile.payment.error.noTransferType','There is no possible transfer transfer type for mobile payment.\nPlease, contact the administration'),(4617,'guaranteeType.inserted','The guarantee type was inserted'),(4618,'posweb.searchTransactions.title.transactions','Processed payments'),(4619,'permission.brokerInvoices.acceptAsMemberFromMember','Accept invoice from member as member'),(4620,'permission.adminMemberAds','Products and services'),(4621,'settings.access.adminTimeout','Admin. session timeout'),(4622,'customField.control.TEXTAREA','Text area'),(4623,'reference.transactionFeedback.role.BUYER','Payments performed'),(4624,'accountType.name','Name'),(4625,'card.unblockCard.confirmation','Unblock card?'),(4626,'ad.result.by','Published by {0}'),(4627,'changePin.error.alreadyUsed','The given pin was already used in past'),(4628,'transferType.transactionHierarchyVisibility.ADMIN','Only to administrators'),(4629,'settings.local.language.GERMAN','German'),(4630,'customField.error.removing','The custom field could not be removed because it\'s already in use'),(4631,'group.title.settings.loans','Loan group settings'),(4632,'permission.brokerMembers.changeName','Change full name'),(4633,'reports.current.invoices.SYSTEM_INCOMING.count','Number of incoming system invoices'),(4634,'permission.adminMemberDocuments.manageDynamic','Manage dynamic documents'),(4635,'permission.systemGuaranteeTypes','Guarantee types'),(4636,'settings.log.accountFeeFile','Account fee logfile path / name'),(4637,'alert.member.invoiceIdleTimeExceeded','An invoice of {0}, sent at {1}, has exceeded the maximum idle time'),(4638,'theme.stylesToExport','Styles to export'),(4639,'memberPos.changePin.newPin2','Retype the PIN'),(4640,'createMember.created.mailError','The member has been created, however, the activation mail could not be sent'),(4641,'memberPos.changePin.newPin1','Type the PIN'),(4642,'loan.repayment.discard.loan.confirmationMessage','Are you sure to discard this loan?'),(4643,'loan.remainingAmount','Remaining amount'),(4644,'settings.alert.title','Alert settings'),(4645,'externalAccountHistory.error.cannotDeleteExternalTransfer','Pending transfers can be deleted'),(4646,'brokerCommissionContract.status.CLOSED','Closed'),(4647,'home.admin.status.cyclosVersion','Application version'),(4648,'permission.memberMessages.view','View'),(4649,'certification.status.SCHEDULED','Scheduled'),(4650,'notificationPreferences.allowChargingSmsPackage','Allow charging for SMS messages'),(4651,'alert.member.loginBlockedByTries','The user login is temporarily blocked by exceeding maximum amount of tries. The member IP address is {1}'),(4652,'mobile.viewPayments.next','Next'),(4653,'member.bulkActions.groupChanged','{0} members were changed to group {2}.\n{1} members were not changed because they were already on group {2}'),(4654,'guarantee.currentCreditFeeValue','Credit fee charged'),(4655,'serviceClient.title.list','Web services clients'),(4656,'menu.operator.search','Search'),(4657,'cardLog.title','Card log'),(4658,'menu.member.personal.activities','Reports'),(4659,'settings.local.csv.stringQuote','String quote'),(4660,'reports.current.presentation.result','State reports: Results'),(4661,'permission.adminMemberPayments.blockScheduledAsMember','Block scheduled payment as member'),(4662,'alert.member.INVOICE_IDLE_TIME_EXCEEDED','Expired system to member invoice'),(4663,'loanPayment.payment','Payment'),(4664,'loan.title.grant','Grant loan to {0}'),(4665,'permission.adminMemberAccess','Access'),(4666,'loanGroup.addMemberConfirmation','Add the member from to loan group?'),(4667,'alert.member.CARD_SECURITY_CODE_BLOCKED_BY_TRIES','Card security code blocked by invalid tries'),(4668,'translationMessage.title.import','Import from properties file'),(4669,'transfer.schedulingDetails','{0} of {1}, total of {2}'),(4670,'card.card','Card'),(4671,'loanPayment.search.period','Period'),(4672,'fieldMapping.field.DESCRIPTION','Payment description'),(4673,'loan.group.responsible','Responsible'),(4674,'permission.operatorContacts.manage','Manage'),(4675,'settings.log.webServiceLevel','Web services log level'),(4676,'alert.system.newVersionOfApplicationPage','There is a new version of a customized application page, {0}.\nPlease, check the customization in order to resolve possible conflicts'),(4677,'accountFee.noMatchingMembers','No members matched the search filters'),(4678,'ad.units','Units'),(4679,'selectChannels.selected','Access to channels modified'),(4680,'payment.confirmation.chargeback','You are going to chargeback this payment.\n\nPlease click OK to confirm'),(4681,'changeGroup.member.permanentlyRemoved','You cannot change the group because the member was permanently removed'),(4682,'accountFeeLog.status.ACCEPTED_INVOICE','Accepted invoice'),(4683,'adImport.status.MISSING_CUSTOM_FIELD','{0} is missing'),(4684,'profile.action.memberInfoActions','Member info'),(4685,'reports.members.account.header','Account: {0}'),(4686,'mobile.payment.error.notEnoughCredits','You do not have enough credits to perform the payment'),(4687,'settings.local.transactionNumber.enable','Enable'),(4688,'accountFee.transferType','Generated transaction type'),(4689,'reports.members_reports.transactions.memberGroupsRequired','It\'s necessary to select at least one member group'),(4690,'loan.queryStatus.UNRECOVERABLE','Unrecoverable'),(4691,'permission.operatorContacts','Contact list'),(4692,'menu.admin.usersGroups.loanGroups','Loan groups'),(4693,'reports.members_reports.transactions.paymentFilterRequired','It\'s necessary to choose at least one payment filter'),(4694,'loan.grantFee','Grant fee'),(4695,'permission.adminMemberBulkActions.changeChannels','Change access to channels'),(4696,'externalAccountHistory.title','Transactions of {0}'),(4697,'message.type.FROM_ADMIN_TO_MEMBER','Personal messages from administration'),(4698,'permission.adminAdminAccess.enableLogin','Reactivate disabled admins (because of failed login attempts)'),(4699,'permission.brokerMembers.changeUsername','Change login name'),(4700,'group.action.new','Insert new group'),(4701,'transactionFee.subject.SYSTEM','System account'),(4702,'externalTransferImport.removeConfirmation','Remove this transaction import?'),(4703,'permission.adminMemberGroups','Member groups'),(4704,'memberPos.changePin.confirmation','Change PIN?'),(4705,'brokerCommission.chargeStatus.noComissions','No commissions applicable to the member'),(4706,'guarantee.paymentObligations','Payment obligations'),(4707,'profile.action.remarks','Remarks'),(4708,'reports.members.presentation.list','Member lists'),(4709,'permission.brokerPos.discard','Discard'),(4710,'menu.member.account.authorizedPayments','Authorized payments'),(4711,'settings.message.pendingPaymentDenied','Pending payment denial'),(4712,'accountHistory.conciliation.notConciliated','Not conciliated'),(4713,'global.range.to','To'),(4714,'permission.memberAccount','Account'),(4715,'menu.admin.accounts.currencies','Manage Currencies'),(4716,'pos.error.noAssignPermission','You don\'t have access to assign a POS to a member'),(4717,'contact.inserted','The contact was inserted'),(4718,'receiptPrinterSettings.endOfDocCommand','End of document command'),(4719,'externalTransfer.description','Description'),(4720,'permission.systemInvoices.view','View'),(4721,'infoText.start','Activation'),(4722,'channel.credentials.DEFAULT','Login password then transaction password (if enabled)'),(4723,'brokerCommissionContract.action.new','New contract'),(4724,'paymentFilter.action.new','Insert new payment filter'),(4725,'transfer.number','Number'),(4726,'ad.addPicture','Add picture'),(4727,'certification.delete','Delete'),(4728,'card.number','Number'),(4729,'rates.error.notOnlineWhileRateInitsPending','The system cannot be set online while a currency still has a rate initialization job pending.\nWatch the system alerts to see when the job is finished.'),(4730,'invoice.status.OPEN','Open'),(4731,'permission.systemStatus.viewConnectedBrokers','View connected brokers'),(4732,'certification.title.new','New Certification'),(4733,'reports.stats.activity.comparePeriods.percentageNoTrade','Percentage of members not trading'),(4734,'scheduledPayment.transfer','Transfer'),(4735,'loanPayment.summary.count','Count'),(4736,'settings.local.maxThumbnailHeight',''),(4737,'settings.message.pendingPaymentReceived','Payment that awaits authorization receiving'),(4738,'channel.supportsPaymentRequest','Supports payment request'),(4739,'menu.admin.settings.channels','Channels'),(4740,'cardType.name','Name'),(4741,'reports.stats.activity.singlePeriod.percentageNoTrade.title','Percentage of members not trading (single period)'),(4742,'top.message','Open Source on-line banking software'),(4743,'customField.title.order.ad','Set advertisement custom field order'),(4744,'transfer.scheduling.IMMEDIATELY','Not scheduled (pay immediately)'),(4745,'customImage.system.quickAccess_searchAds','Quick access: search ads'),(4746,'invoice.accept.transactionPassword','In order to accept the invoice, you must supply your transaction password'),(4747,'customField.possibleValue.error.saving','Error saving value.\nMake sure that it doesn\'t exists already'),(4748,'pos.status.PIN_BLOCKED','PIN blocked'),(4749,'memberRecordType.layout.LIST','List'),(4750,'memberRecord.search.keywords','Keywords'),(4751,'error.rateParameters.initExpirationBeforeEmission','Combination of A-rate initialization values leads to a emission date which is after the expiration date following from D-rate initialization values.'),(4752,'externalTransferImport.error.importing.comments','Field {0} (column {1}) has an unexpected value: {2}'),(4753,'permission.brokerAccounts.information','View account information'),(4754,'permission.memberPreferences.manageNotifications','Manage notifications'),(4755,'alert.member.initialCreditFailed','Initial credit has failed for {0}'),(4756,'loan.repaid','The repayment was succesfully processed'),(4757,'settings.mail.message','Message'),(4758,'loan.confirmation.transactionPassword','In order to confirm this loan, you must supply your transaction password'),(4759,'changeGroup.error.remove.hasOpenLoans','The member cannot be removed because it has unpaid loans'),(4760,'menu.operator.account.loanGroups','Loan groups'),(4761,'reports.simulations.aRate.config.combinedGraph.yAxis','Fee'),(4762,'account.lowUnits','Low units alert'),(4763,'message.toMember','To member'),(4764,'infoText.inserted','The info text was inserted'),(4765,'permission.brokerMemberAccess.changePassword','Change login password'),(4766,'payment.action.deny','Deny'),(4767,'transferAuthorization.action','Action'),(4768,'transactionPassword.status.user.ACTIVE','Active'),(4769,'permission.operatorPayments.paymentToSystem','System payments'),(4770,'mobile.payment.title.confirm','Confirm Payment'),(4771,'payment.error.enoughCreditsOtherAccount','The payment cannot be performed as another involved account didn\'t have enough balance'),(4772,'customField.possibleValue.modified','The value was modified'),(4773,'home.member.news.title','News (message board)'),(4774,'loan.title.repayment','Loan repayment'),(4775,'customField.title.list.loan','Loan custom fields'),(4776,'activities.invoices.outgoing.count','Outgoing count'),(4777,'createMember.forceChangePassword','Force change on first login'),(4778,'memberRecordType.inserted','The member record type was inserted'),(4779,'menu.admin.accounts.manage','Manage Accounts'),(4780,'adCategory.title.list','Advertisement categories'),(4781,'fileMapping.nature.CSV','CSV'),(4782,'connectedUsers.loggedAt','Logged at'),(4783,'reports.members.presentation','Members transactions reports'),(4784,'permission.adminMemberPos.discard','Discard'),(4785,'reports.stats.taxes.title','Statistics of taxes & fees...'),(4786,'card.title.create','Create card for {0}'),(4787,'card.canceled','Card canceled'),(4788,'memberPos.assign.invalidMember','The typed member does not exists. Please insert another one.'),(4789,'customImage.size','Size'),(4790,'fileMapping.inserted','File mapping inserted'),(4791,'loan.group','Loan group'),(4792,'permission.memberGuarantees.issueGuarantees','Manage guarantees (as issuer)'),(4793,'permission.systemGroupFilters.manageCustomizedFiles','Manage customized files'),(4794,'settings.local.scheduledTasks','Scheduled tasks'),(4795,'reports.stats.finances.ThroughTime.expenditure','Expenditure'),(4796,'help.title.preferences','Preferences'),(4797,'channel.usePin','Use PIN'),(4798,'menu.admin.help','Help'),(4799,'permission.systemRegistrationAgreements','Registration agreements'),(4800,'reports.members_reports.members_invoices','Members invoices'),(4801,'menu.member.preferences.notification','Notifications'),(4802,'smsLog.status.ERROR','Error'),(4803,'customField.title.modify.ad','Modify advertisement custom field'),(4804,'transferAuthorization.title.list.of','Authorized transaction actions by {0}'),(4805,'certification.status.ACTIVE','Active'),(4806,'smsMailing.recipients','Recipients'),(4807,'card.securityCodeUnblocked','Card security code unblocked'),(4808,'alert.member.TRANSACTION_PASSWORD_BLOCKED_BY_TRIES','Transaction blocked by exceeding attempts'),(4809,'accountFeeLog.running','Running'),(4810,'tranasctionFee.count','Number of transactions of days'),(4811,'settings.log.transactionLevel','Transactions log level');
/*!40000 ALTER TABLE `translation_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username_change_logs`
--

DROP TABLE IF EXISTS `username_change_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username_change_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `by_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `previous_username` varchar(64) NOT NULL,
  `new_username` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6FF08EF52B1214C2` (`by_id`),
  KEY `FK6FF08EF5A19267FC` (`user_id`),
  CONSTRAINT `FK6FF08EF5A19267FC` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK6FF08EF52B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username_change_logs`
--

LOCK TABLES `username_change_logs` WRITE;
/*!40000 ALTER TABLE `username_change_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `username_change_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `subclass` varchar(1) NOT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `transaction_password` varchar(64) DEFAULT NULL,
  `transaction_password_status` varchar(1) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `password_date` datetime DEFAULT NULL,
  `password_blocked_until` datetime DEFAULT NULL,
  `pin` varchar(64) DEFAULT NULL,
  `pin_blocked_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_username` (`username`),
  KEY `FK6A68E082574AFDA` (`id`),
  CONSTRAINT `FK6A68E082574AFDA` FOREIGN KEY (`id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'A','5eT01Zl32L0uXY46nkA446Mdk6Iczz3I','admin','D482671592944A548F6A97F95F1C79952C4C3F28ED2C2C3CC01A4E64FE87781B',NULL,'N','2013-12-15 03:33:39','2013-12-14 18:15:32',NULL,NULL,NULL),(2,'M','lkHBxlwS3igqt9C1aNdkCpMl4ZFsrq1K','12345','614EA75C89E2AB4011E3BDB093121FB258A26956A475292F3CA3EB297581DC82',NULL,'N','2013-12-15 03:53:09','2013-12-15 00:36:12',NULL,NULL,NULL),(3,'M','vMYkkgPdVmSueTGLRSxtlR4HwoLXm3Kr','9107','3B27B632CC5F65DFA83C45AC902ACBDF7A863E91E45F1645CAF9A2FED6A4C79A',NULL,'N','2013-12-15 03:29:36','2013-12-15 03:08:55',NULL,NULL,NULL),(4,'O','raML7cX93fw5BRXs5GDwYUFp6zFkYudy','theop','FFD23A566D99EF5E99379031ACC123F44E98BA1E9C57B1CCFCBAC2EE7ABC0F8C',NULL,'N',NULL,'2013-12-15 03:40:31',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wrong_credential_attempts`
--

DROP TABLE IF EXISTS `wrong_credential_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wrong_credential_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `credential_type` varchar(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `member_pos_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK80BA49C13A66F8B` (`member_pos_id`),
  KEY `FK80BA49CA19267FC` (`user_id`),
  KEY `FK80BA49C293F7A45` (`card_id`),
  CONSTRAINT `FK80BA49C293F7A45` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`),
  CONSTRAINT `FK80BA49C13A66F8B` FOREIGN KEY (`member_pos_id`) REFERENCES `member_pos` (`id`),
  CONSTRAINT `FK80BA49CA19267FC` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wrong_credential_attempts`
--

LOCK TABLES `wrong_credential_attempts` WRITE;
/*!40000 ALTER TABLE `wrong_credential_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wrong_credential_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wrong_username_attempts`
--

DROP TABLE IF EXISTS `wrong_username_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wrong_username_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `remote_address` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_wua_remote_address` (`remote_address`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wrong_username_attempts`
--

LOCK TABLES `wrong_username_attempts` WRITE;
/*!40000 ALTER TABLE `wrong_username_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wrong_username_attempts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-15  4:25:39
