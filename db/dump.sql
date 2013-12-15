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
INSERT INTO `images` VALUES (1,'sys','active.gif','image/gif',565,'2013-12-14 18:15:35',565,'GIF89a\0\0�V\0jr\0x\0l\0�\0.g.x��#�#�A|A\0�\0!�!�\0�\0\0�\0\0�\06�6%�%��#�#2�2\0�\0*�*�1�1�7�77�7;�;�\0�\0\0�\04�4�\0�\0\0�\0K�K\0�\0\0�\0\0�\0U�U\0�\0�h�h\0�\0\0�\0R�L\0�\0�\0�\0p�pu�u\n�\n\0�\0������|�y����ƃ�Ĉ�Ì����������Ɨ�ɷ�Ͼ�ܶ�ݾ������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0y��������P��N;1F�R=M\nG�U>#O? J�SC-$\'Q�H3\rKB\Z7+�T4*	/85�.!2%&0/6�A)(,\":�L!\"<�\0@�9D�IE�����\0;','GIF89a\0\0�V\0jr\0x\0l\0�\0.g.x��#�#�A|A\0�\0!�!�\0�\0\0�\0\0�\06�6%�%��#�#2�2\0�\0*�*�1�1�7�77�7;�;�\0�\0\0�\04�4�\0�\0\0�\0K�K\0�\0\0�\0\0�\0U�U\0�\0�h�h\0�\0\0�\0R�L\0�\0�\0�\0p�pu�u\n�\n\0�\0������|�y����ƃ�Ĉ�Ì����������Ɨ�ɷ�Ͼ�ܶ�ݾ������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0y��������P��N;1F�R=M\nG�U>#O? J�SC-$\'Q�H3\rKB\Z7+�T4*	/85�.!2%&0/6�A)(,\":�L!\"<�\0@�9D�IE�����\0;',NULL,NULL,NULL,NULL),(2,'sys','calendar.gif','image/gif',154,'2013-12-14 18:15:35',154,'GIF89a\0\0�\0fff�p\0��Jʗ\0ƪ�ٳ?������������������������������!�Created with GIMP\0!�\0\0\0,\0\0\0\0\0\0\02��2!�9��\0�$	�����-��`�xn�s��@�M��gF\Zh:��\0;','GIF89a\0\0�\0fff�p\0��Jʗ\0ƪ�ٳ?������������������������������!�Created with GIMP\0!�\0\0\0,\0\0\0\0\0\0\02��2!�9��\0�$	�����-��`�xn�s��@�M��gF\Zh:��\0;',NULL,NULL,NULL,NULL),(3,'sys','captchaBackground.jpg','image/jpeg',8164,'2013-12-14 18:15:36',1277,'����\0JFIF\0\0H\0H\0\0��\0C\0��\0C��\0\0<\0�\0��\0\0\0\0\0\0\0\0\0\0\0\0\0	\n��\0S\0		\0\0\0\0\0!1A\"Qa���2BUVq���Tbr��	$35CRWduv����������7Fs����\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0K\0	\0\0\0\0\0!1AQa�q�����\"RST��2Bs���#br��456DUc�3C����\0\0\0?\0��ٖ��&ϴ�ʴ��2d[P&D�q��\n��d�I$�d�ŗb��G�ԢܕiK-6I-��JI$bI�c��ݼ,��(DÁ!ŀ�\0F�\n�!��]��2��r?���M\\�sg�F�4r��{˽��cX�#m/Gc�\Z�]�?�3�#v5�z��㽢�c>ؿ#-?G#�\Z��˟�L�Hݍ\r�yG��~5x��ɱ�	]�TO$�n?���n�/4�5��n�Un^��k���aA���^\0�����WmGO��K��v3⩳Z�>b9{�����\0b�c��Qn����G�L�\0gJ��A�=�Ϳ¯����k�6��l���H�Gm�_�#\\�38�5���a��p�:�h�LU�c���ʵ�y�V�pG�zmUٺ�42,��H݅��^\"*&����.��i�9��99t=ɞ���P�?{w�^�ؿ#-?G#�\Z99t=ɞ��r���۽����.��i�9���ˡ�L�H݃�7������v/��O���ƎN]rg�F���~��h��<�~FZ~�G�4rr�{�=�7`�\r���{E�A�]��2��r?����Cܙ쑻(o���/z66E���*ɵBU�Tm��?��cv.�SS\"�>���x�	4��;E�G�{˔�q����:�6�ۑ���k��Ժ�Oۑd��R<#W/-�eJ�t���cj��gR&1\n�cZ�.Za���b��#*JT�9�8$F@$,�n-޲��\0�<Z)��c���&�J\'�����ؿ#-?G#�\Zm����&{$nP�?{w�^�ؿ#-?G#�\Z99t=ɞ��r���۽����.��i�9���ˡ�L�H݃�7�����M���R��V�a���q�G`�o����{��Bp\"�Jq?�GW����M�b�mڜߴ^�?��k������\0OS�C\\?��~Ž؎r��{�ݢ������dz\'�=�����{�r��{�ݢ����[}�Ь�d+ω2%�Sv$���v�i��YJР��@�A�\Z�_k�r�nd��H0���H!��!DBj8�1n����Q�\'RT�`��� �TM#8�iE��Z��Zn�Tm�����mNZR���\0.�5�*ѝE��C�\'���$��g�<━R�{�*��#5��_¨9�i��I����f� GC7U΅���RZ�p�d� \nΔ\"�[Et�]��J\"q��7��7.ହ*�Ri��l���D�����V�޻��h��I� z]:y��ܴlInY��k�=\Z��<L�� &<H�\0`�3���Y�ե&X�M\Z@>��_�KyA����\nɯ�#�vp;�ӈ�U�7R����侕�)R2=Z��i�볞�v763��6I�Oѥ	�B�8g[�#I1#LIL�\Zxc�[c#�=c\\fY��M@W<\r8�\n�M!�S��@S�Ň�&+�C�Oo�u\n�.ӭ��eTz�?A�������)��I\nZ���J����Pg&�����f���>���$ꃾ|�<�k�x�������3�l�V*b�ԙͺ�8��m�K�-��a eG�9���J�-	Tζ^>�Ey��r}�Tʂ>�0玮�-Ͳ�]��n��G���\r��P��V�ړOfI%�\\yM�)Fx��>)V�;�;e�w\\q����j3����kJS�\nN}�i\r!\'*���_K+P�z���^�ŃI�Ƅ�k�Dm�h�e)���ì-`=��Q\n	PJ�U�\Z�ʷ�fN��*Fq������ZSG1ӫ\Z���Q��|nn��v<e��Sl�\r��Ȫ�j�5v�����X���:��c�-�T�(�	J�t�y/�v��M�!\'(�J�B\0��c��b3e6�����P\0\r\0�$�@�\0�Q�A�0��4ܗ�q��pJROY�\'�-Gx���2�#]0��\niR��g�|����\\g��|��yx��$�I��5RH¥�H8�)�=|Z����K�:�p��X�[*\n���G�<j���+�\r	��^_V�90d&[������\0�U^��j+~�I���\0a������K�[�b>}Rb�����\0`k�6_�k?��UM�\0k_9�R��(BT��@!	$����*Z���bBENh�V�G���Z��^���&�s�b��\0�ߔ�u�o��rزZL��j���߽���5�z�^�m\'\Z24���PӜ�5bD&\rA��<\\��5�K��1��\'�˫Ycء\n�d��Dtn��<}z�\\u�4S\r�8��Ud�\0�C��<����Q�jN�V{K5�\r���\Z�˓\"7ޕ���׀R��Y����<��6+�%����l?������Ia+�-��!�u�\Zj�e.�2c����^д�)+I���T�i҅�hA�E�>�AF)8�5B�&qsII󁑬	��B�#�;�K}��^y�Zi�	R�f�˺���i�U(���5��AR�\0�­�J�[��Vi\r@y�6���J�eը%�8s��)@��d$%�v��\ZO�y##M\ri��*!�JӒ�{�l�Z*3�U�\\��*�j�\0V�Z*��������_m�{�Q�	p��#��H̴H:��=8\Z��91\'w��[�h�	��A�g�>�Z5�Ī����Ӷ\rkk-m���n{��4[�ԡ�B���<3�Z��p���Q[���@$�\"����\"�.䔌�?Ş��g��]�}4&��(�r�>�9��0�D��J�-)K)���j��Ѯ8�F��|����\\J�u��J-3?\n\"�>?���w�a�� ����wi�*�s��,q�F�x�C���?�\Z8�8�e�B�����E�;G��j/~�ʴ>������^�?�o񈠴�تg�{?�\Z�=������#ԓ���~q`6��_]�.?J���-�9˿	`v�|��\\�\Z]�6�u5\0�n�јm������BQ�R����:s���f�A��T�\r��PH��<e \'?9ǟW���yº����]1��Ai��@q�Jx��$�IRI\nJ�� ��A�4�j\r!��1�/�yĎ��!`-`^P��.�l�DM�r�E=0�v���;�ZXb�2�KiBm2�3\r�OD��c_�������l*\\��v�C|����jv�����\\�\\�:E�H|I��)�ʧ�8�uI?A\Z�2�8�Zs�����J��!X$�_�[��p�E4Ƽ�?����T��<�M`�@�3�B�M+�T���u�u���BC���ػC�KK!-H8�J�PIؓ���[�D�#�.�F`z3q�,;�j%�����y��z�i�t�јS�jz1���?�?�U\0�P�I��(qFx���jt�U6Q�*#�R�J%Ə\'�d$,����\0��Τ7n�&ŶZ�P�JN#a\Zm��lD�{�77&��)�3�����S���z��Ӳ�C@�n���jS�fcH����P p=>t��C)KR֞�k+ZR����p�w��\\n]ykq%4���&�f�\\vc��s�IkU�Q\r�r�PkL@\0q�H��-��a�&B�>�F���n-)J?9��4J������W��>Y�0e�g����cʌc�T����c0Dk���^^��}y�z<���J��ڲ��z��A�H��$��5��5�r]_�N�?(����ͦ�v���\rHx�m�3�\Z8�1�n�,����.vmS������͟�����ה�z��Ehݗ\n���&,f�O�JJ@IזlF\\���m�P@�\0#����a�V����aX���4�q�L�GB#������Y�|��ν�v�el���E��9����b�&&-%8��J5<ںp�KS�E?��^�o��G����gˢ0��i�ɉ����YHCC�iVy�U����J\rR���\01���&�J-��,QJ��k���BUb��X�C�R�AeiE2\\���QIq���Q(AJ� �y��Nɻ� T��?(L�I�h��D�H�\r4�=q[�;z��ph�-��͌�l����5m��)0ئѣ:\n��}�!В�p�����i^Yٶ�)*VJ�	H�5:�E�`�J<�y*Jq	MI$h5�\\N�-�ų-k2�z�A�;Οie��#��:M.�e�Kc0�̾���8s�Xu�p�Dh�\rBej�N�i:^2&R��P��S����7\"y�k��\rM0��J�l1Շݖy. �I5�>&ڗ�\"�������N�Oynt��\nR��) (!\Z�$�	�Vt:�����L��Ne\0z��Rg\"ld8�$�#\Zm��c��وf�څv��)��qt�Z	d+�	u����I\\c���bpQe�f%s�W\Z�	� �FcR4�褭���&Y��i4�M8J�S�޶�ˋnk}�*�o��9�q����6_bB[$���ڒI8$�Rޫ��ٵ�,�e&�I���P���i��f��`kB5�b��+�dr��ڇ��Q�(�d>؉Š1tT�fK��0���ד����O��mp.�o]���!��*�s\\�ehju\r��֋�$���jͳY�Z��9��(��5M��z�m�ҕ���ډ$�%<+��CW]���ٝ�(eR�(q�	5\Z�� �w��a�rӤQ�[\"��n8��O�i�*s ա�aJ�:#�fK*#�(u��#��ט�����Ã�A �H���m+��TB�|6��Lo�l��l+M:u1J�|�����S����Wӫ߂�`L�.K�f��_����t�jq.�����I�����D�\'�ף�dgn*����]�S���F�������˿�P�u�E����\0������\\���DZr^��!��E�ɪ;��TMZ��B�)\n�	þ�x߹�K�O��Q�YǺ�o�a�L=\ZChz<����q9JС�<��N���Q��ٍ׮��6�t����|̥��I��G��*\no�1�����WŮ�\n2��V��^�\\��Sj�\\�T�xӪ��h����KE�B̊�\"��ߩT���˛)~���<ԣ��$���g!\'I;cI������\Z\0���B84A�u����Cf4����u��(W�T�m\0v�����KK�JW��\0C�8M,����ҹJ�6���e�t��m��ؓ��\Z��E�Iyd4��p��$<ۭ���n<@��f9��\\ ��53h6�IJ�)]y�Fz��t�b|S�kdM�ۡ�=�x��gQ��) 뇅\'%DG^��`�\Z ���-�awV&��l�]RaO$�ҷb��9L4�9��\r�$��`}t���]�aO�!\'�(���6��i��#e�%peY�v��LUQ����ŷ\n�p���N�i�ǥT���&!���K�[O`$)D�r���7���V�j�Ks�Pu\0\n�U08�:tW���8:�~�R�T�-F�UAMt`\rF�4�0��Я��߫�{�r��,�TXP-}��0L��~���r�G�d:��_$�R t�g:���.a4e)�N�������h�v��H7.��N*��g l��d}\r�m�]�*�\"�#a�%�c��㫱m��@89J���rO];�hI.��a@A��\0F�UJ^[vRg�(� �A��\01��G��y\Z�*7Z��ڝ2ٹk6��~ym�O��W1�V�R�J�I��VԐ�Q�Nؖ�ם�w�Z$�����j�Q�M)��Uz�&�dQ�\0t�S]z�����~��s%�@�2�}����mP6�Ĉ���釓l)���V��@��#�����ReԼi�S�>�ZI\\�92SE	ҥ`�D@=ύ\\�{u\r�@�}_U^�!1�3]RR�.:|��?�^Q���-\'&1Y$������6���\0H��>72#߭�h���}zk-�B5J>��;iW#��n\rdq*\n�U\Zld�2�\n8�)�P�\Z��[iwz�C���\'?Vq�\r6Œ�FEMS��9ǎh���1-�eEy����#���(e*I`�u�$-��PqX�yhSk)P��Xgn\'�?����?���n��\'�����}��\0�iO�o�hlM�I�C�V��K�Tm�d!�8�(%)�#$���Á��f�X��NzN����($�l��G���S�K��m��H�(x��x;~�-N�$�ޯ�SW)��2Aፒ\0�KX\r���Z��A^%�lʵg�8>� ��������rx���^p3��P���W� �\Z �*�>Z�l�C�沦�5�RJOhP ���A �j����6J�Q����O�kԙ�����[V�I�t+�R�)�-+--����IA��Y�Y:D���Js�Z!$�ӯ�����K �-%\n8�F����\0\0\0\0 4���\Z �D���Vx{���;�E�-�a������~�S|&�>^�Ӓ~�-�	6{�FP�C���S��eNu�:��aX�ޖ;j�r��I��!f�T�Ъ0ktW�f�Kx�r�.2TP�) ą!kI�e$(�Kfn���4��N����q�1��R͗��.��V��H=97�׺\r�d�om���B�f���_7.��~ހ�rCHBd?��jCy<��]�5�J��,�\ZM@=���x1Jf���4\0B�^�#M���v�ȁnN�ɸ�L�>����P��uOK�����?6��ܙ}N,�J5\'i�P%�$%��j4=�E�50�[���(�S����f��F � 3���z܆Ȍ)�Ȏ9̗���R�d�î%)�S&҄ymv�\'kj�7�!�2|��+鶴4ǔy���aD��������W��g�JM�����;w6h�y>S,�����6��������\ZZ$ƒ�\\�\";�m�چR��r �#�WjB�F �J��TA\"\Z����½�]$F�)��F��i:�.�C��j��S��B*��%|���]2�J��I��:�A���������*�Fp\0�f��ap�{���2��KHJRVI	\0\n���4�/W���lM8�8�\ZҤ�iT1���o-ۼ��,ۉ�E\"����QT�j;��SПK� ���ќ\0�\"4���\0���kJq.2�MA�.W].�f�Cv���5�&�bSLE4 C�=�7�R����G��A���\0Ѯ�����~��o��{G:ӹ�M_��?P���g�_�A��{Gzӹ�j��������h��\0|��?\n�\0R4�s�;֝�=�W��6��$}�G����Y�W��y����޴�A>)�~�#�\Z<�\0�/b�¿ԃ�-�����rt���M��	h����{~��in�w�;�{��ϊm�H�F�?��س�� �Kw=��i܃�5~|Sh�BG�4y�\0�^ş���[���N����G�>ѣ����,�+�H<���h�Zw �M_��?P���g�_�A��{Gzӹ�ʦ�J]T;���S�O��\"�%���Z��Z��QY.�HPJyg$�-�/�0�m�R)���VbKb��.��SL�D(�+��!�e�\r�b��)\Z����R�����\'L*�V���:��<\"X�=�>E�*Q\ZK-�\rHH��6�}Jֆ��D�T���ز��=���W�z����}�ꧨ�F>���{� �ګ��?�K��r���S�w��SY����j����\0�/����K�OQރ�IMg��\r��{��\04�oG+�/U=Gz�%5��<6���O�������T��>���{� �ګ��?�K���+-Q=Gz0,91�����*�1���\0ĿoG+-Q=Gz3�,��{�!�sƋvG\\j�v��ATPR�Y:�_L}����X��I���n�޷n��]��.\n�v�ʍ>޻J%F����Ԅ��$�㌠HH$�-��d��#<Sa�#@PQ������[�˿l;�/)+�R@�=RGM+�%*�t=�[�U(ҩv�qj����r<\'Ém�(���\n8�#=�K-N�e�f=*�L�:� ��֊\ZU�+C�A�R<X|�o��\n���R�T\Z��#��','����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0\0d\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0����F��:¦�X�l,��GF�&���J�H�W�בEJz��F�,t�\"��*�\0�4�@z*�B���-�SA���y��R�s������R?ݨ�������$w��Ţ�Σ!yq��YN6WC�۰���\0q*\n��K+�j#R� t��]G.�֒Imn.�8�L��m�s�>��5k���bü	��23\0�G���q�;l�_ʢ�M�av����`�\0��Pr��QF��qץZ��\0�I�\0|��h����s5�E��N�3��A:�|�������������nvt���f��b2g�*i&����|�Q�gf`w�@\0��\'*���Kc\Z�pO�M���\0��\0���mB\n72��&�>xd�\n%đ+0@2GԎ*L$6��K��\0Tm����\n�i-gǛ0�C�皾tO+/��H@`A���\0m����\n>��_����Y����_�Y1ϕ!Q���V��<���a���q��\\I����>&��p�qߠ���\0�#��u�C���&iH��Bᔣd�����WW֒��������A�#��j�;�p&�yeuR��\0�\0AJGA��B�1Z2\'�lцq����ҵ3�挊F0i�:��ζ���ê�}*��T}�EZ-�+������4U{��yA���5�ʄ_*?��',NULL,NULL,NULL,NULL),(4,'sys','checked.gif','image/gif',364,'2013-12-14 18:15:36',364,'GIF89a\0\0�7\0������������%��(��+��-��.��0��2��3��7��8��:��<��=��?��A��B��D��F��H��J��K��M��O��S��U��Y��[��_��a��c��e��o��x��|��~�ρ�х�ښ�ݢ�������������������������������������������������������!�Created with The GIMP\0!�\n\0?\0,\0\0\0\0\0\0\0p��pH,\Z�D\Z�8+y\"�eͤh�$���f�4$����\Z�R�S�쇒@B����h\"F G($H1&K?	\n\0\'�?#*�?.+���DA\0;','GIF89a\0\0�7\0������������%��(��+��-��.��0��2��3��7��8��:��<��=��?��A��B��D��F��H��J��K��M��O��S��U��Y��[��_��a��c��e��o��x��|��~�ρ�х�ښ�ݢ�������������������������������������������������������!�Created with The GIMP\0!�\n\0?\0,\0\0\0\0\0\0\0p��pH,\Z�D\Z�8+y\"�eͤh�$���f�4$����\Z�R�S�쇒@B����h\"F G($H1&K?	\n\0\'�?#*�?.+���DA\0;',NULL,NULL,NULL,NULL),(5,'sys','conciliated.gif','image/gif',565,'2013-12-14 18:15:36',565,'GIF89a\0\0�V\0jr\0x\0l\0�\0.g.x��#�#�A|A\0�\0!�!�\0�\0\0�\0\0�\06�6%�%��#�#2�2\0�\0*�*�1�1�7�77�7;�;�\0�\0\0�\04�4�\0�\0\0�\0K�K\0�\0\0�\0\0�\0U�U\0�\0�h�h\0�\0\0�\0R�L\0�\0�\0�\0p�pu�u\n�\n\0�\0������|�y����ƃ�Ĉ�Ì����������Ɨ�ɷ�Ͼ�ܶ�ݾ������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0y��������P��N;1F�R=M\nG�U>#O? J�SC-$\'Q�H3\rKB\Z7+�T4*	/85�.!2%&0/6�A)(,\":�L!\"<�\0@�9D�IE�����\0;','GIF89a\0\0�V\0jr\0x\0l\0�\0.g.x��#�#�A|A\0�\0!�!�\0�\0\0�\0\0�\06�6%�%��#�#2�2\0�\0*�*�1�1�7�77�7;�;�\0�\0\0�\04�4�\0�\0\0�\0K�K\0�\0\0�\0\0�\0U�U\0�\0�h�h\0�\0\0�\0R�L\0�\0�\0�\0p�pu�u\n�\n\0�\0������|�y����ƃ�Ĉ�Ì����������Ɨ�ɷ�Ͼ�ܶ�ݾ������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0y��������P��N;1F�R=M\nG�U>#O? J�SC-$\'Q�H3\rKB\Z7+�T4*	/85�.!2%&0/6�A)(,\":�L!\"<�\0@�9D�IE�����\0;',NULL,NULL,NULL,NULL),(6,'sys','delete.gif','image/gif',1064,'2013-12-14 18:15:36',1064,'GIF89a\0\0�\0�\0\0�����\"�$�$�%	�)�)�/0�3(�5pr�< ot��>+�>\"�?!rv��C0sw�sw�tx�tx�ty�ty��N;�VD�Y8�������aJ�������������������������hQ�jH�{j�wU�wg��������v��n�����p���얚���ݡ���������������ʵ��驰���毱��ҿ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0��C�(;z��ǐ�PAuJK!r\Z�{��A]\n5R�!G��a�$ɐHv�ti�7`�� ��&E���q2�LNg�x�iZ�P�G�\'Ȩ@P�\n\Z2+Ei�BF��qs��P��0!.w����0(D��H8 ��=l�`p\n�\n:\00�;|��e��@BD\0  Of�{\\�0$�Q�6��Y�1�\'O�,e�t(�\r��H�E�&F�\0�A��\0;','GIF89a\0\0�\0�\0\0�����\"�$�$�%	�)�)�/0�3(�5pr�< ot��>+�>\"�?!rv��C0sw�sw�tx�tx�ty�ty��N;�VD�Y8�������aJ�������������������������hQ�jH�{j�wU�wg��������v��n�����p���얚���ݡ���������������ʵ��驰���毱��ҿ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0��C�(;z��ǐ�PAuJK!r\Z�{��A]\n5R�!G��a�$ɐHv�ti�7`�� ��&E���q2�LNg�x�iZ�P�G�\'Ȩ@P�\n\Z2+Ei�BF��qs��P��0!.w����0(D��H8 ��=l�`p\n�\n:\00�;|��e��@BD\0  Of�{\\�0$�Q�6��Y�1�\'O�,e�t(�\r��H�E�&F�\0�A��\0;',NULL,NULL,NULL,NULL),(7,'sys','dropdown.gif','image/gif',115,'2013-12-14 18:15:36',115,'GIF89a\r\0\0�\0\0\0\0yyy������������������!�\n\0\0,\0\0\0\0\r\0\0\08X���pE��a��3����m#qຂ*�o,��}������J83ACcA�i:��3\0;','GIF89a\r\0\0�\0\0\0\0yyy������������������!�\n\0\0,\0\0\0\0\r\0\0\08X���pE��a��3����m#qຂ*�o,��}������J83ACcA�i:��3\0;',NULL,NULL,NULL,NULL),(8,'sys','edit.gif','image/gif',1057,'2013-12-14 18:15:36',1057,'GIF89a\0\0�\0�sO�n����s��x��������	���������������ى[����0�T�O�������ӗq����+��������\nߟf��������Ҥ������=զ�Щ�Ҩ��]��������/�����\0��ĵ�Ƹ��ޮ��U�������ಠ�����ȼ���������俇��F�����;�����;��\n�������N��*����������O��Y�����8�����������M�����������b�����A�����������������{�������ӣ����������ؙ��i�����~����������س�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0����K\Z6����?5�\"bb�H�%f8|1��>?TL�e#Ď���p\0\0�COFT�䆆\0$4��Q��2(40B	ψ����`�F���\nX֬0��c&H[��Ab��8��A��R$?c���M-�Ĺ��R#<e��a&��y����N\Z/�h��C�B�����.���(sR#&��!s���\ZQZr���Az��c#��,P�\0��b\0;','GIF89a\0\0�\0�sO�n����s��x��������	���������������ى[����0�T�O�������ӗq����+��������\nߟf��������Ҥ������=զ�Щ�Ҩ��]��������/�����\0��ĵ�Ƹ��ޮ��U�������ಠ�����ȼ���������俇��F�����;�����;��\n�������N��*����������O��Y�����8�����������M�����������b�����A�����������������{�������ӣ����������ؙ��i�����~����������س�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0����K\Z6����?5�\"bb�H�%f8|1��>?TL�e#Ď���p\0\0�COFT�䆆\0$4��Q��2(40B	ψ����`�F���\nX֬0��c&H[��Ab��8��A��R$?c���M-�Ĺ��R#<e��a&��y����N\Z/�h��C�B�����.���(sR#&��!s���\ZQZr���Az��c#��,P�\0��b\0;',NULL,NULL,NULL,NULL),(9,'sys','edit_gray.gif','image/gif',1055,'2013-12-14 18:15:36',1055,'GIF89a\0\0�\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�}�-�4_�X�jw��o�\"��\'��1b�|9|1�>u�r�j�m#Ď��k��P.xOF���D�FE����a�HqJ�ώ̖��4+[-�\re��vW(k�r���>lՊŚen�a�����o;mҎ�\"7.��\\�̡��_:m�t��f-\Z+�����g�[�RǮQ��j�;{�VK��6��h!��\Z�iݴqg�ԇ��;���:w���zm���M�4iʄ	��\0;','GIF89a\0\0�\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�}�-�4_�X�jw��o�\"��\'��1b�|9|1�>u�r�j�m#Ď��k��P.xOF���D�FE����a�HqJ�ώ̖��4+[-�\re��vW(k�r���>lՊŚen�a�����o;mҎ�\"7.��\\�̡��_:m�t��f-\Z+�����g�[�RǮQ��j�;{�VK��6��h!��\Z�iݴqg�ԇ��;���:w���zm���M�4iʄ	��\0;',NULL,NULL,NULL,NULL),(10,'sys','help.gif','image/gif',1720,'2013-12-14 18:15:36',1720,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0h���\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\" xmpMM:DocumentID=\"xmp.did:F80BDEE26A7F11E0B6BAF55348335066\" xmpMM:InstanceID=\"xmp.iid:F80BDEE16A7F11E0B6BAF55348335066\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:7EA9C5017F6AE011AAD1E8E1F522A2F4\" stRef:documentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>L�z2\0\0�IDATx�b���?�c���Im�9��0ь����g\0�\0�l8�$�멿�@�E��_����Ƴ��T� n\0����V�ְ���s�N��6��D�����w��	�n>��@03:����е��\\���譿���z\rvSr�����o03�j21�{���J�������?��\0M:����{��&B��_�|g`;\r������.�����p��g�[��έԟ@p@�\Z�T._����H�A ��r(�� ��\r�YS-9�߿�����6���/��a�k�L&z�/_A$�o�V��=Ëg� f3��w���e(�e� ��	L�ܸ���;^����t���\\��o?�g��d��Xcx���\'\r`o����(7YE����?Wn>g��Qd`�p��E��,�d5%1aNNN����^���p���{�?��n����dm\rA�/��ad��Y�3��g�z�=ñsO�1�d���|���\0ëg�@ۀAf�Ġ\"��p���?����3||�� \"�� *��5i�MF�se�xn�``�\r��k��m�f�{b5\r3d����������#��Ҙ!���(����P~�2���g�r~�޼G`@����EN�\n�R�*��13�z�����b���@�w�dx��Y\'0\0+0�j�	��bPR�\n��� �O�P\0\0�Z�I�Y?�\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0h���\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\" xmpMM:DocumentID=\"xmp.did:F80BDEE26A7F11E0B6BAF55348335066\" xmpMM:InstanceID=\"xmp.iid:F80BDEE16A7F11E0B6BAF55348335066\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:7EA9C5017F6AE011AAD1E8E1F522A2F4\" stRef:documentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>L�z2\0\0�IDATx�b���?�c���Im�9��0ь����g\0�\0�l8�$�멿�@�E��_����Ƴ��T� n\0����V�ְ���s�N��6��D�����w��	�n>��@03:����е��\\���譿���z\rvSr�����o03�j21�{���J�������?��\0M:����{��&B��_�|g`;\r������.�����p��g�[��έԟ@p@�\Z�T._����H�A ��r(�� ��\r�YS-9�߿�����6���/��a�k�L&z�/_A$�o�V��=Ëg� f3��w���e(�e� ��	L�ܸ���;^����t���\\��o?�g��d��Xcx���\'\r`o����(7YE����?Wn>g��Qd`�p��E��,�d5%1aNNN����^���p���{�?��n����dm\rA�/��ad��Y�3��g�z�=ñsO�1�d���|���\0ëg�@ۀAf�Ġ\"��p���?����3||�� \"�� *��5i�MF�se�xn�``�\r��k��m�f�{b5\r3d����������#��Ҙ!���(����P~�2���g�r~�޼G`@����EN�\n�R�*��13�z�����b���@�w�dx��Y\'0\0+0�j�	��bPR�\n��� �O�P\0\0�Z�I�Y?�\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(11,'sys','icon.ico','image/x-ico',628,'2013-12-14 18:15:36',628,'GIF89a\0\0�q\0�x8�z.Ā7��P� ��F��K܅\"� ��eՋ8׋5� � �(ؕK� � �!�@�\"�#�&�*�%�3ݞX�&�8�?�1�4�/�7ҩjϩ�ө}ȫ�˫��3ڭ]�Hɮ��D�N�@�Oձ{��T�B��M�k��Yδ��K��U�Y��W��Xѵ�۵sζ��>�]��W�T�S�T�V�x��b�C�Xѽ���]轌�|��V�����Y��f�Ƨ��}�Ǘ��l��n�Ǝ�ʉ�̾�̊�̋�΢�Є�ү�֙�յ�٣�ڥ�۸����ܫ��������������������������������������������������������������������������������!�Created with GIMP\0!�\n\0\0,\0\0\0\0\0\0\0��.8:���9,�Y`��dba�Z)�hi[`cq;�`?7^�fq5^S=/��F2\\�N%\"��WQR\\@+UPBADHJTUU<I(U6!lk�1MCOO-pp�� >G\'�\r���4�VE�Lqp\n�_��!1n��0�̈pF�\n ^��@�8oh(��;yj�	����`b\0w�>~\0;','GIF89a\0\0�q\0�x8�z.Ā7��P� ��F��K܅\"� ��eՋ8׋5� � �(ؕK� � �!�@�\"�#�&�*�%�3ݞX�&�8�?�1�4�/�7ҩjϩ�ө}ȫ�˫��3ڭ]�Hɮ��D�N�@�Oձ{��T�B��M�k��Yδ��K��U�Y��W��Xѵ�۵sζ��>�]��W�T�S�T�V�x��b�C�Xѽ���]轌�|��V�����Y��f�Ƨ��}�Ǘ��l��n�Ǝ�ʉ�̾�̊�̋�΢�Є�ү�֙�յ�٣�ڥ�۸����ܫ��������������������������������������������������������������������������������!�Created with GIMP\0!�\n\0\0,\0\0\0\0\0\0\0��.8:���9,�Y`��dba�Z)�hi[`cq;�`?7^�fq5^S=/��F2\\�N%\"��WQR\\@+UPBADHJTUU<I(U6!lk�1MCOO-pp�� >G\'�\r���4�VE�Lqp\n�_��!1n��0�̈pF�\n ^��@�8oh(��;yj�	����`b\0w�>~\0;',NULL,NULL,NULL,NULL),(12,'sys','import.gif','image/gif',613,'2013-12-14 18:15:36',613,'GIF89a\0\0�x\0\'�\'�(�\07�;�D�E�G�T�8D�S�T�W�\n_�^�b�#_�e�IU�	h�NW�IZ�%j�\nn�j�Ab�I_�p�Id�0m�3q�w�Hm�8j�z�{�Cp�4w��7{�Xr�>}�%��&��E}�(��I|�O{�Wy�.��E��2��[��f��8��=��L��T��C��l��E��G��J��U��_��\\��Q��T��Z��z��X��Z��[�����b��]��q��g��i��l�����p��x��t��u��w�����|��}����͓������������������������ݠ�����������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0�������	��\0b�g(ts��e�f0p��pa�i/m��mZ�j.d��cL!\Z�l,\\�[?�q^)RRJ1\"\nqq;8FB<6-#Pv$ASQMG>6* r�4@]WOH=3&5�E9`XN��X� ��?Vd|��DG�,�9Q��4�)��MFBw�\0;','GIF89a\0\0�x\0\'�\'�(�\07�;�D�E�G�T�8D�S�T�W�\n_�^�b�#_�e�IU�	h�NW�IZ�%j�\nn�j�Ab�I_�p�Id�0m�3q�w�Hm�8j�z�{�Cp�4w��7{�Xr�>}�%��&��E}�(��I|�O{�Wy�.��E��2��[��f��8��=��L��T��C��l��E��G��J��U��_��\\��Q��T��Z��z��X��Z��[�����b��]��q��g��i��l�����p��x��t��u��w�����|��}����͓������������������������ݠ�����������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0�������	��\0b�g(ts��e�f0p��pa�i/m��mZ�j.d��cL!\Z�l,\\�[?�q^)RRJ1\"\nqq;8FB<6-#Pv$ASQMG>6* r�4@]WOH=3&5�E9`XN��X� ��?Vd|��DG�,�9Q��4�)��MFBw�\0;',NULL,NULL,NULL,NULL),(13,'sys','inactive.gif','image/gif',666,'2013-12-14 18:15:36',666,'GIF89a\0\0�r\0�AA�DD�GG�II�22�22�22�44�GG�22�CC�HH�FF�22�44�II�LL�33�JJ�44�KK�<<�JJ�@@�KK�@@�MM�GG�NN�@@�CC�DD�JJ�QQ�RR�QQ�TT�XX�UU�YY�]]�aa�aa�bb�dd�bb�aa�bb�������������������ll�ll�gg�oo�ooÅ�ą��oo�rr�yy�~~�☘㘘���䘘嘘昘瘘蘘阘���������������������Ƕ����˹����������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0ހ�dJHGFCBb��dDK�KA^��\ZZe��Y]�dV_a_�_`_U\\�OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .�?jr�\"�	4E�>n�l+�3C	/�ggrشh���!&t ��	4�:L8\0C����q����4P<\\\0@�#L�0�R������\n8s� �7t�ac@OL\\vԘ1#*3\0;','GIF89a\0\0�r\0�AA�DD�GG�II�22�22�22�44�GG�22�CC�HH�FF�22�44�II�LL�33�JJ�44�KK�<<�JJ�@@�KK�@@�MM�GG�NN�@@�CC�DD�JJ�QQ�RR�QQ�TT�XX�UU�YY�]]�aa�aa�bb�dd�bb�aa�bb�������������������ll�ll�gg�oo�ooÅ�ą��oo�rr�yy�~~�☘㘘���䘘嘘昘瘘蘘阘���������������������Ƕ����˹����������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0ހ�dJHGFCBb��dDK�KA^��\ZZe��Y]�dV_a_�_`_U\\�OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .�?jr�\"�	4E�>n�l+�3C	/�ggrشh���!&t ��	4�:L8\0C����q����4P<\\\0@�#L�0�R������\n8s� �7t�ac@OL\\vԘ1#*3\0;',NULL,NULL,NULL,NULL),(14,'sys','incomplete.gif','image/gif',666,'2013-12-14 18:15:36',666,'GIF89a\0\0�r\0�AA�DD�GG�II�22�22�22�44�GG�22�CC�HH�FF�22�44�II�LL�33�JJ�44�KK�<<�JJ�@@�KK�@@�MM�GG�NN�@@�CC�DD�JJ�QQ�RR�QQ�TT�XX�UU�YY�]]�aa�aa�bb�dd�bb�aa�bb�������������������ll�ll�gg�oo�ooÅ�ą��oo�rr�yy�~~�☘㘘���䘘嘘昘瘘蘘阘���������������������Ƕ����˹����������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0ހ�dJHGFCBb��dDK�KA^��\ZZe��Y]�dV_a_�_`_U\\�OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .�?jr�\"�	4E�>n�l+�3C	/�ggrشh���!&t ��	4�:L8\0C����q����4P<\\\0@�#L�0�R������\n8s� �7t�ac@OL\\vԘ1#*3\0;','GIF89a\0\0�r\0�AA�DD�GG�II�22�22�22�44�GG�22�CC�HH�FF�22�44�II�LL�33�JJ�44�KK�<<�JJ�@@�KK�@@�MM�GG�NN�@@�CC�DD�JJ�QQ�RR�QQ�TT�XX�UU�YY�]]�aa�aa�bb�dd�bb�aa�bb�������������������ll�ll�gg�oo�ooÅ�ą��oo�rr�yy�~~�☘㘘���䘘嘘昘瘘蘘阘���������������������Ƕ����˹����������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0ހ�dJHGFCBb��dDK�KA^��\ZZe��Y]�dV_a_�_`_U\\�OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .�?jr�\"�	4E�>n�l+�3C	/�ggrشh���!&t ��	4�:L8\0C����q����4P<\\\0@�#L�0�R������\n8s� �7t�ac@OL\\vԘ1#*3\0;',NULL,NULL,NULL,NULL),(15,'sys','message_read.gif','image/gif',1082,'2013-12-14 18:15:36',1082,'GIF89a\0\0�\0�iQ�mT�mT�pV�pV�sX�tX�vZ�wZ�z\\�}^�}_��`��abÄcćeŇeƊg���ȍiǍlːk���͓m������ѓl���әrҚr���ҜwԞtˡ����͢�ԡz֡vؤx���ڧz٧���̪�ܫ|٭�ެ�߮ܮ�ݮ�߰�ఆ᱁���ᴅʹ�ൎ䵊ᵓ߷�ⶒ���㹕���溊ổ���輌录㼠�����徝������濛����������Ĥ�Ğ�Ų����Ǻ�ƌ����ȧ����������̖�ί�͒�͔�͛�������И�ϫ�ѭ�ӵ�ҧ�Կ�ӝ�ѹ�Ӷ�ҽ�Ԟ�պ�Ԣ����פ�إ�پ�ڿ�٬�ڬ�ڭ�������۪����ݭ�ݮ�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	�Ȍk**J=��q�h��%8�\n��Μ+%��T�#>��9Ӧ\"���MS~��X1�Ä�ܠ2��T�(5\Z���\ZjtJb�((�L�����V�v���ϔt�4��b�*Q2�`ad�\n;y�,��B�R�:�eC��l\\8�7S�4�X�\"��\r1.�(U釠ȧ892CcKBDb�4\'H��|�Q��cm�$i!>q�x�BD�,P�\0�	\0��74h��];�7\0;','GIF89a\0\0�\0�iQ�mT�mT�pV�pV�sX�tX�vZ�wZ�z\\�}^�}_��`��abÄcćeŇeƊg���ȍiǍlːk���͓m������ѓl���әrҚr���ҜwԞtˡ����͢�ԡz֡vؤx���ڧz٧���̪�ܫ|٭�ެ�߮ܮ�ݮ�߰�ఆ᱁���ᴅʹ�ൎ䵊ᵓ߷�ⶒ���㹕���溊ổ���輌录㼠�����徝������濛����������Ĥ�Ğ�Ų����Ǻ�ƌ����ȧ����������̖�ί�͒�͔�͛�������И�ϫ�ѭ�ӵ�ҧ�Կ�ӝ�ѹ�Ӷ�ҽ�Ԟ�պ�Ԣ����פ�إ�پ�ڿ�٬�ڬ�ڭ�������۪����ݭ�ݮ�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	�Ȍk**J=��q�h��%8�\n��Μ+%��T�#>��9Ӧ\"���MS~��X1�Ä�ܠ2��T�(5\Z���\ZjtJb�((�L�����V�v���ϔt�4��b�*Q2�`ad�\n;y�,��B�R�:�eC��l\\8�7S�4�X�\"��\r1.�(U釠ȧ892CcKBDb�4\'H��|�Q��cm�$i!>q�x�BD�,P�\0�	\0��74h��];�7\0;',NULL,NULL,NULL,NULL),(16,'sys','message_removed.gif','image/gif',1090,'2013-12-14 18:15:36',1090,'GIF89a\0\0�\0�FF�GG�IH�KK�LL�OO�QM�SS�VO�WN�[[�iQ�_\\�mT�mT�gb�gd�pV�pV�sX�kf�tX�me�vZ�wZ�ok�z\\�sv�qq�}_�{s��a��a�{pb�~m�|tÄcćeŇeŃ�Ɗg���˅�Ǎlχ�Ɏlώy���������ѓl���ӑ}���ԓ����ӛvˡ����ٝ~͢�ԡz֡vؚ�؜�ؤx���ڧz٧���Ц�ۣ�ۦ�ܫ|ߧ�٭�ެ�ܮ�߰�ఆ߭����ʹ�ൎ䵊߷�������溊ổ㶮���輌录���������������������Ĥ�Ğ�Ų����ƌ����ȧ�������̖�ί�͒�͔�͛�������И�ѭ�ӵ�ҧ�Կ�ӝ�Ӷ�ҽ�Ԟ�պ�Ԣ����������פ�پ�ڿ�٬�ڬ�ڭ�������۪����ݭ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	��*}*��̘F�\nia�ia)1S�`��H�!6>�DE&U�/W�����:<�����U��H1���,���D�Y�N�A1iѐ0\'d��H,W��ذȍ�C%`�����\rM+����!F `(1բ@��p)���0��RD����@�׏BZ]�0�r Vw�\0�c��(`�e��N��@y���Xz%@J��TQ#ƈ\0�����%{���\0�\0	\\�0!�&Dh�@� \Z2���Ơ�\0;','GIF89a\0\0�\0�FF�GG�IH�KK�LL�OO�QM�SS�VO�WN�[[�iQ�_\\�mT�mT�gb�gd�pV�pV�sX�kf�tX�me�vZ�wZ�ok�z\\�sv�qq�}_�{s��a��a�{pb�~m�|tÄcćeŇeŃ�Ɗg���˅�Ǎlχ�Ɏlώy���������ѓl���ӑ}���ԓ����ӛvˡ����ٝ~͢�ԡz֡vؚ�؜�ؤx���ڧz٧���Ц�ۣ�ۦ�ܫ|ߧ�٭�ެ�ܮ�߰�ఆ߭����ʹ�ൎ䵊߷�������溊ổ㶮���輌录���������������������Ĥ�Ğ�Ų����ƌ����ȧ�������̖�ί�͒�͔�͛�������И�ѭ�ӵ�ҧ�Կ�ӝ�Ӷ�ҽ�Ԟ�պ�Ԣ����������פ�پ�ڿ�٬�ڬ�ڭ�������۪����ݭ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	��*}*��̘F�\nia�ia)1S�`��H�!6>�DE&U�/W�����:<�����U��H1���,���D�Y�N�A1iѐ0\'d��H,W��ذȍ�C%`�����\rM+����!F `(1բ@��p)���0��RD����@�׏BZ]�0�r Vw�\0�c��(`�e��N��@y���Xz%@J��TQ#ƈ\0�����%{���\0�\0	\\�0!�&Dh�@� \Z2���Ơ�\0;',NULL,NULL,NULL,NULL),(17,'sys','message_replied.gif','image/gif',1097,'2013-12-14 18:15:36',1097,'GIF89a\0\0��\0C�;B�9D�;F�:K�>H�9K�>M�?S�NN�?]�Y�iQn�HQ�=L�5[�ET�>�mTZ�F�mTS�9X�AX�B�pVU�<�pVZ�Cy�P]�G�sXa�P�tX|�U�vZ�wZf�Rd�L�z\\�}^�}__�>h�L��_t�S��`f�F��ag�Hbd�AÄc��we�DŇek�F~�l�����m��և�q���n�HǍlo�IƏi���u�M���͓m���u�N�����m���y�Pʜp{�QҚr���Ҝw}�S��}�R���ˡ�~�U͢�ԡz|�R��Y��W��ԅ�]��^ܫ|��^��Y�Ï٭�ެ�߮ܮ�߰�ఆ᱁��bᴅ�ʹ�ൎ䵊߷����溊ổ輌录�����徝����������������Ğ�Ų�Ǻ�ƌ����Ѹ�ȧ��j����֪����ص�̖����ί�͒�͔�͛����ڹ��ݿ������И�ϫ�ӵ�ҧ�Կ�ӝ�Ӷ�ҽ�Ԟ�պ�Ԣ����פ�޵�إ�پ�ڿ�٬�ڭ�������۪����ݭ�ݮ�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	���6�*8��U�F��k��<l4Պ���AW���ج:p�<����\"+Tr��c\'�Mc�M\0���\">&��C,�\"`ǂIj@\0�<5���uG[�z���ЛR2��A����W�\"=0r�L�T.�x�4��<V@y�T*P\'� �P�P�.\\�(Ѱ�/�C��\"�&BRD�%C6`�a�Ǐ��t&�C�䠀���v�Z��\r�C�T��@(]�X���М	C�� �\n,L���B�G>%9D�#�ӣO�) \0;','GIF89a\0\0��\0C�;B�9D�;F�:K�>H�9K�>M�?S�NN�?]�Y�iQn�HQ�=L�5[�ET�>�mTZ�F�mTS�9X�AX�B�pVU�<�pVZ�Cy�P]�G�sXa�P�tX|�U�vZ�wZf�Rd�L�z\\�}^�}__�>h�L��_t�S��`f�F��ag�Hbd�AÄc��we�DŇek�F~�l�����m��և�q���n�HǍlo�IƏi���u�M���͓m���u�N�����m���y�Pʜp{�QҚr���Ҝw}�S��}�R���ˡ�~�U͢�ԡz|�R��Y��W��ԅ�]��^ܫ|��^��Y�Ï٭�ެ�߮ܮ�߰�ఆ᱁��bᴅ�ʹ�ൎ䵊߷����溊ổ輌录�����徝����������������Ğ�Ų�Ǻ�ƌ����Ѹ�ȧ��j����֪����ص�̖����ί�͒�͔�͛����ڹ��ݿ������И�ϫ�ӵ�ҧ�Կ�ӝ�Ӷ�ҽ�Ԟ�պ�Ԣ����פ�޵�إ�پ�ڿ�٬�ڭ�������۪����ݭ�ݮ�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	���6�*8��U�F��k��<l4Պ���AW���ج:p�<����\"+Tr��c\'�Mc�M\0���\">&��C,�\"`ǂIj@\0�<5���uG[�z���ЛR2��A����W�\"=0r�L�T.�x�4��<V@y�T*P\'� �P�P�.\\�(Ѱ�/�C��\"�&BRD�%C6`�a�Ǐ��t&�C�䠀���v�Z��\r�C�T��@(]�X���М	C�� �\n,L���B�G>%9D�#�ӣO�) \0;',NULL,NULL,NULL,NULL),(18,'sys','message_unread.gif','image/gif',1044,'2013-12-14 18:15:36',1044,'GIF89a\0\0�\0�iR�nU�oU�rW�vZ�y\\�z\\�}_��aÅcądƈfƉfȌhȌiːk���͔m���ΖqИpΘvњsқrӝu֞w֟y؟wաxעwס}֣{ؤz٦yݦxڨ}ܪ|ݬ�}ޭ~߭�߯�߯�ޯ�᱁߱�᳄峄㵃㵋ᵒ䷆湆溉㹙�y輈缓彛龋������������n��{�Ȗ�ȯ�ɞ��u�����Ι�Ї�҉�ӝ�ӱ�ӑ�ӡ�ԫ�ՠ����Ց�վ�ע�ד����ڜ�ܞ�ߧ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	H�������Qc��%F����\nVxL��H�A��왣f�p���#G��#&�h4zc�L�t�Ā�%��i�(K�TA\0��B��h0C��$R��p+�C<���CD%G\n@ H�-��x���	#E@�FǙC���qS拓@@���8k�p�rEJ� 7@�p�B�(@p�\0�\0H�\"��۸m�FȻw��\0;','GIF89a\0\0�\0�iR�nU�oU�rW�vZ�y\\�z\\�}_��aÅcądƈfƉfȌhȌiːk���͔m���ΖqИpΘvњsқrӝu֞w֟y؟wաxעwס}֣{ؤz٦yݦxڨ}ܪ|ݬ�}ޭ~߭�߯�߯�ޯ�᱁߱�᳄峄㵃㵋ᵒ䷆湆溉㹙�y輈缓彛龋������������n��{�Ȗ�ȯ�ɞ��u�����Ι�Ї�҉�ӝ�ӱ�ӑ�ӡ�ԫ�ՠ����Ց�վ�ע�ד����ڜ�ܞ�ߧ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	H�������Qc��%F����\nVxL��H�A��왣f�p���#G��#&�h4zc�L�t�Ā�%��i�(K�TA\0��B��h0C��$R��p+�C<���CD%G\n@ H�-��x���	#E@�FǙC���qS拓@@���8k�p�rEJ� 7@�p�B�(@p�\0�\0H�\"��۸m�FȻw��\0;',NULL,NULL,NULL,NULL),(19,'sys','mobileLogo.gif','image/gif',628,'2013-12-14 18:15:36',628,'GIF89a\0\0�q\0�x8�z.Ā7��P� ��F��K܅\"� ��eՋ8׋5� � �(ؕK� � �!�@�\"�#�&�*�%�3ݞX�&�8�?�1�4�/�7ҩjϩ�ө}ȫ�˫��3ڭ]�Hɮ��D�N�@�Oձ{��T�B��M�k��Yδ��K��U�Y��W��Xѵ�۵sζ��>�]��W�T�S�T�V�x��b�C�Xѽ���]轌�|��V�����Y��f�Ƨ��}�Ǘ��l��n�Ǝ�ʉ�̾�̊�̋�΢�Є�ү�֙�յ�٣�ڥ�۸����ܫ��������������������������������������������������������������������������������!�Created with GIMP\0!�\n\0\0,\0\0\0\0\0\0\0��.8:���9,�Y`��dba�Z)�hi[`cq;�`?7^�fq5^S=/��F2\\�N%\"��WQR\\@+UPBADHJTUU<I(U6!lk�1MCOO-pp�� >G\'�\r���4�VE�Lqp\n�_��!1n��0�̈pF�\n ^��@�8oh(��;yj�	����`b\0w�>~\0;','GIF89a\0\0�q\0�x8�z.Ā7��P� ��F��K܅\"� ��eՋ8׋5� � �(ؕK� � �!�@�\"�#�&�*�%�3ݞX�&�8�?�1�4�/�7ҩjϩ�ө}ȫ�˫��3ڭ]�Hɮ��D�N�@�Oձ{��T�B��M�k��Yδ��K��U�Y��W��Xѵ�۵sζ��>�]��W�T�S�T�V�x��b�C�Xѽ���]轌�|��V�����Y��f�Ƨ��}�Ǘ��l��n�Ǝ�ʉ�̾�̊�̋�΢�Є�ү�֙�յ�٣�ڥ�۸����ܫ��������������������������������������������������������������������������������!�Created with GIMP\0!�\n\0\0,\0\0\0\0\0\0\0��.8:���9,�Y`��dba�Z)�hi[`cq;�`?7^�fq5^S=/��F2\\�N%\"��WQR\\@+UPBADHJTUU<I(U6!lk�1MCOO-pp�� >G\'�\r���4�VE�Lqp\n�_��!1n��0�̈pF�\n ^��@�8oh(��;yj�	����`b\0w�>~\0;',NULL,NULL,NULL,NULL),(20,'sys','mobileSplash_large.png','image/png',46151,'2013-12-14 18:15:36',1207,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0@\0\0@\0\0\0�n�\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0��IDATx���]l\\g~��3$�E�>�bcQI[�&7�� ���&��\"q�6�x�\n�@rUH2�\\8v���@?ܢRѢph�E�E���m�J�H�U����Hn8t\"���c�9\"�3�+�%�c>��<�h<��˹8����I��ޚ\0\0\0\0@TM�\0\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0B�\0\0\0\0M�\0\0\0 4\0\0\0��,\0\0\0\0Bk1\0\0u���_�ٔ���s�\'����ؐa\0���\0Pk��L��}�ޗ���=���������n]:i�\0\0ʧO���\Z\0��i�s0��WRm�G�s.����\r\0@�\0���ξ���~.i�[�N�<�jq:o\0��=�2\0\05в}���]j�ZɆ\0\0k��\0Pu����/���i���u����eo\0��	X\0\0U>��d�_xg�;I�eֿ���\0\Z��\0\0Tպ��+r�TSg����\'\0Ѐ,\0�*J�4w�Wjo�=��S�F\0h4-�\0\0XK���[��M��w_�T��ύ\r��\rΎ�����5S_����rhgO��\Z\0h\0�4e��o���x�d���Zw(N�o]:9s���|��������*���}��������\04\n\0X�Rm���Zw�_�ӽ�Ga�x\r2V���+����̖\'����ɮL*���\04k`\0�Xsw�����zu�t�@iÖ�����Z�����\'����\'E_\0\0�AX\0�jU�P/���9z��L���9X�3�ξj�vCOy�W�Iaַ\0\0h\0�*�{��=�����>P���qUHa�ܰ\0\0\Z��\0�>����N�bU�4�:�_%���?����� `\0���Կ��s����M�Ϫ�B���{�6��\0\04\0Xe��=\\��y��Wx\"a�nq81�Ş��\04\0XM����t���ξ|�K��gq�*�T��ܭ��\0�F `\0�I�W���\r��0R�U�fG��9�^�M\0\0\Z��\0�\Z��L�.��ױ9��c}�Ul��.�_��9z�/\0�P,\0`ըj���홁�O������֥ʗ���,�^����\0X�,\0`�h��|�������΅�D��t�0|������_�0��K\04\0X=\'.�l������s��-�>��\\������w,�_\0�rh\0�Us���W��tl.g�˟V�\"��ިȮ\n��s�~�+]_O�V\0\0\rqh\0\0���YXW�Ia�2;,��i&�{��#Cw�ҕ��\0\Z��\0��J�\",�쇯�=�o�;t����\04\n\0`a��aI{kr�ġ�N]ƶ�����*ݜ�>n� \0�(,\0�������]�(Vp�;�R?�ϯ��͗\'�s��������[�_�Uڛ˯\0��!`\0����`\r�R��Wc����W�v��������C��XW/��͗^ٍ��N_\0���\0`���皻�{�����2��yF��O/=6��my���s����n�����ݘ��1y\0h,\0�jܺ�~�w���=����nL2�Rg.�_���n�^\0\r�B\0`՘,N�z��s\'��[dړgw�6?����3���+\0�1	X\0��Q��ߺT�����{��ޚ�ٞ���2V���d��=����\n\0\0\r�B\0`5�9�V�f~x������Q�˝6u�3V~*��/����0��ʹ\'�uI��u+\0\0\0XU�򹙳o��>P�=��?y�\n��Z�F�PU>���\0\0d\n!\0��̜?:76T�}&�g����M\0 \0Xe�����_��j�?���[����ˋO\0��\0�>scC����=�i��;t�����&s�\0\0��\0�*͍\r}��^~��Qz��9��98z��;n~l��l�d[��k��|�-���Wzevtp.��=s����^�\0�B���[�\0�\ZM�$gF�����͖\'�������3��~��z�9yvG��u͎[Sgߺ��Zs��8�/������2\0��\0�b��Ʌ��g�������ܪ0���#�:���ٓ�n\\�#ֶ��\"��X^k��7;:�k\0ԝ�\0�nC�?+?���@����w�{țo�}t�h�������XXku���=��X�&7O�Z>�k\0ԗ�\0�zF���_�s˓��O*�zq������}_�����Zw�_Ɔ���ݯ�p\0PO\0���J�Q\\��v&}���zղ}_��,o��d��?�W�|�n�E\0��\0\0k�������\\y��Ui�5\\��ۗ_-{���L����R�0�\0ԇ�\0��:�w�ѕZ��B�w��_ڪ��\Z��h�dW��\'����Tf����\0P-�\0\0X3n�r��]O���xm\"Y���6u$]_Oue�F�ײ�����Lv׾˧�g7%k;�\0A�g\0��d7��)�����\\29�L͔�\n�oMZ��L{���m߷�t?]X?)��S)_0\0���3�\0\0X��[U#_4���W��tl.OB��I�䓮�o\0P�S\ZC\0\0����*S�6�|®��JX\0@�	X\0\0,���1\0\0jM�\0��\n���\'S3\0�5\0`-���~��|��k.�\0jK�\0Xˊ���|n���12d0�z�\0\0ָ[�N�|\'�O���)$\0P[�>\0\0ָ�O��p7F��+�nP���\0\0ָ�|�0||%{8���w��W\0@�	X\0\0k�\'�����e��u�����sS��\0jM�\0X�6���o�0�_�7F����$�1e<�\Z�\0\0\ZB������KjXW/޳���L!\0�@�\0h;���������Gߔ�0���đ��vf]~\0�A*��V�\0\0��SəK��l������l{f���L��>>}���ͬ�=��F�\0ԁ�\0�@rד#�;���d��lGg6�=apf2cdh�\r���\0\0u�b\0\0\ZGvc��5�����JnG��l��+����\0u#`\05���_>ɖ���~΍\r���ԑ<�#u!W���onoM�ݓ*m\0PG\0PuM�l��}�ޗ�:�|C�d�޺�~a��᪁��d��Ե�$w�����{6?�to��\0�5�\0�*j�d[wH�,������_���6��F�f�M$�3��L�y�9ɴ\'_[W~\0��\0TK۞���,cÉ��_��CM=��+��j \0\Z��\0T��-���w4ap�>:u��{�g7&2\0@��\0PaM�}�/�Ӕɮp?O�ݟ^�9{�Е|��q�1\04��!\0\0*(Ֆ�H���홁ݯ�Y�M.�K�\0И,\0���3+T��m{f���s��$w=Ѱ\0\0\Z��\0TL۞�+\\�jA���zʻհ\0\0\Z��\0T�\"�]�=c�+o�?�]/?\0\0h�SMC\0\0TD��UɆ��m��?��85c�\0\Z��\0T�\"�M�T�O��?��0�}b\"!\0@#�m\Z\0`�]���aͯ�Ur%�\\�0�\0\0�B�\0*�e��58J��}w�箹\0�QX\0�J��2ո�����D����幄\0\04\0X��DM�U�ƞ��,B\0�F9�4\0�\n5�F+�>s�?�?7�\0�!X\0�J��25;ֆ�.��즱\0h\0����uV~�x\0\04\0XMf&�w�[�\0�AX\0�J��5;֍�!\0�h,\0`�f?�QT*L�6\0@�\0����Q����˯���\0�!X\0�J��iX��O���L��\0h\0P�����(�����\0�!X\0@ܺt�ڇ�zqpb<w�+�Ky\0�F `\00����W���w�]\0�,\0�2fξU��_�8x���+cw\0�F!`\0�1��U�a�{��{^��\r�\0\Z��\0T���#ո��^�1��n~,��a�\0\Z��\0T����[نu���N����_r�\0@�\0�J*N�+ذ.�>~�ء{^�ѕʴi\0�\"`\06߰fGW��O��^ue�]�\0��X\0@��7���o��,c��܏�|��|��3����\0\ZN*��V�\0\0TIS&ۺ�@�w`��/L�?�oG�OW��k�v����\0��X\0@�]�����Җ_ٷ����P���Ο�������|Î����\0\0\rK�\0jaj&��x%�l��k]��؜���^����T~b,71�{І�+�sЪ�\0\0���\0\05�ޚ���Ե�$wm(7��M6?V��jS��\0ht\0P;�:J�T��ɕ|r���T!��+oȴ\'�u����L�y\0@\"`\0��nN�K�\0`Q�\0\0\0\0�	X\0\0\0\0�&`\0\0\0��\0\0\0@h\0\0\0\0�	X\0\0\0\0�&`\0\0\0Z�!\0\0X�:�Rm��o��yq�ӡ�t~vt��\0\0�	X\0\0kSSg_������4w�?��scC��ݺ���K\'�\0P*��V�\0\0�vN��2-����z���o����.��9��\\>g$�@g8\0��Ѷ�`�ۯ�=Opy\n��e,\0 \0�����%����۔�ί�4�zq:?764��͎��TU��ݿn����Up�3gߚ>s��\0u\'`\0u֔ɦ{Z�zi��enl�0������t���k{��]�����hO��j�A\0�H�\0�w\"Җi{�t��2�-N�?96s�h�g�����e,w����y�U�\0�<��\0��hݵ�u����4���<����`c�aSg_��Z��(�sa���-\0P\0P��̺��[���g�����FƦLv��?X�z틧a\0u;�1\0@-�Oy�`�Jn_����;�L9����re�#\0��	X\0@�To��rX���N6J�j����G�F��8.\0��,\0�F����c��}�>s�X�]�#ٶ�`sw����g��:\05%`\05R��w�w����8��V�O�ݳ�L�u��:~�\r=}sOа\0���\0�Zw���I����N��KŵZX��=\\��P\Z俜�ְ\0���\0��K�ejy��ӿ����H�J~��dsw�&��[�9X\Za\r\0�\r\0����jy��\r=}۞(=�0�����9䓔F�csv���<[\0�C�\0��|�ծ�5>跾s���0����];k�7u����� ��t˭�U����\0��j_�J:6g�w��ܚ�I~~��VF�P�\'{{��Skg���,\0��Z�z�.�����|<�\\�X#Y�U�/�>3_	K#l\"!\0PU\0P�S�ξ�L�.��o+���%B����\\Gl�����<��.�\0�yVi\0��i��sͦ-O~q���W�EX��Fa\0 2\0��Fgo�~\'����d�ulΦ�g��\0�υ\0P�S�:���~�G�]OV���:�b~��=}kc����B�\0\0��F]�K���U=ǭ�)p��|%�+\0T�\\�\0\0�j��+�0ǭ�::�F\0�6\0h�����-���{�\0���!\0\0\ZD~j�~�P�=�{\0��b\0��)N�Cŗ�l�n^�NJ��=�D?���sU����O%�:|��\n�\0�*�j����\'��J��\\f^i��Ks_s����:�����͎��u�dŇq���݈\0�\0���|���nG�_�UQM�l�w�婗s����r�ڵ�8��u���ٷ�zYVc_��S�$I��\0�%`\0U476\\ǣ_�8��mSm���^K�,o�҆������S�V$c�v���V{�\\�vkη\0�<��\0Ut+7Xǣ/;`�����O>X^��[swi?m{��w	;���Ȑ�9\0Pm\0PEscC��F7z~����\0V�-���w۞{��kϷ�>���ܳ���Gr8��wb<W����\0�&`\0�u�g߫�q/���{^y���:�ֿ��j�:_���dυ�<����I�\0\0K8�2\0@U���������ʴ?���vc��:S��v-{Z���Pq:ܵN��N��\05 `\0�5��վa}��G�qS��7_�*8m�A��=ܲ}��u)V-*L�﯄d\0�e�\0������Z^=41��|z�d����ߟj˴��N\r�ռu{/o=����B�Ys�2��y�\0\0� `\0UW��Ϝ}�f�;{���/��>p��ީ������2��|���%�������@kN-x����i\0,��\0���������#�,�ݸ�Զ�]���j�õn��>}��W��������A/�>>1���%y�G\0�e�\0�\Z�y�չ���b��ɟ.tYPRX��j˴�>P��xb��_l�sa����fG�\\����W��	\0�B\0P#��������\'�jX7F��,4y0�]��[x���j�������sד�^�u�ԫu�S~x�Ȃ�_ue��\0T��\0�Nq:�?}��H��Ջ���˅���O7\'��/V�2�t�@Gc˓���ϯsח��\\>7��u�إ?߃.s����\0U!`\05�e]�\'�����\\�SG�zU��+����[��=�w���\'ũ�%l5s��g?;Y�\\\Z�]�֕Y�27\0���\0�Z���ٙ����{�A�i�J{��(��Ao��$[;�O-O�T���޵�cs�0�\\�-m1��\'^�ƅl�t�ءw�7�\0�E�\0j��5ٳ=�ѩ�?|��.�>���&��8r��}��\\��dg��U����)��0\Z�O�+��<Y�D�-��o�\\�u�ء�����\0���?��\rF\0���t�ޚ��M~��ɏo7�u_�F��E-�41���đ3����������L{9�-8y��u�+���C1wk���׉ғ��$�1ռ�����43���_��P\Z�\Z|γ�=�6~�\'e� \0P=���[�\0P��Ʌ�/��m��_�<ݞ)����W/N��n���;�������zU���w���#Ba2��;���Ie7.a�3�����o����U��y�W��<>�J7\0���\0�z�O�+La����ʔ{�C�U�����8����k~2`{k��O-�M�$?�yy����?�_��J�!�^%�o��kO=b�\0V�\ZX\0@=e����+S�������S���=%��Wwܙ;95�\\�X�_\\�t����ˋ�6mI><q�N\\{�G�6\0��	X\0@������X�\"Jٍɳ;R����R_���\0�7�X����f����?��g+roǒ˧�����?>����IY�\0��C\0\0DЕ)=R��������K�6�1�ѵ��{��+����m��x��lq�&��:Zzl{f������0Va2����s1Wiؗ�b\0��	X\0@ ��Hjj��q�����A�c��&�;�M�����)l�߽�Xj��=�����ܾ~���؜�~z_��}{����㍑��K����~�_���\0@�X\0@8��iq[;�}�0�|v��7��ikS�dW���I�4?�����Y����������uf2?���Ջ�K=֎�Ԏ.�S\0�v,\0 �ts�h�,���_���T�=�d��:N��*��{�ϱ��b����c����:�ߟ�R	�\Z�%���M�K�毙E�5`{�vc��.D���a#�G�}ؙ�}ܹO��>L8��Cw��۱w��솛��c0��R4 �!a�\ZcJjBը��JUu�����*O���DQ�ũs2�9���\"�\0\0Xf���m�P��ue����\\Gl1����cc�\Z\0\0��\0\0\0Xu��y�|�c���x,�8ٗ�*-v�oN�ß3+�cn��d;\0\0X.�\0\0�j�||�_��#\'�Q�j2i��һ:F��������C�\n\0\0x,\0\0�\Z%���W��J�n�k᧷t�cJ�\\|B���\r�Ƶ��V�\0\0x,\0\0�\Z%���x\"�5{�Ҡ��P��ƒ7�F��c�%�cq�Ʉcff�;/�?��4��(e�\0\0\0!�\0\0V��;��8���d�\0V�ϥ�Z[��7�1\0\0\0@a��\0\0`J=}<�Zf�C���2O#�\0\0\0�C\0\0\0�R��}��!�~j�7Y�\0\0��\0\0\0X�&��s��e<����=g�a���K�\0\0���\0\0��ӯ��e��[��!��q�7+JYB\0\0��\0\0\0X�&��s\"��e��ѡ{s�_��\0\0`\"�\0\0V���z�8��{�����+���>\0\0�D\0\0\0�j������u�?���?�3G�׺?sJ��\0\0�L�\0\0�j7y�\'��C�>���ԍO�~���b� \0\0�`\0\0����o���ž����v��TQ��A\0\0���\0\0H?��c7܍a\r�������Y�J4Ց~\0\007X\0\0\0������S�����O��?z�v֖�\0\0\0s#�\0\00-pJz������=���?y���������@i��e�W\0\0\0��=�8L+\0\0\0h���蓊Ʒ���7�}����~�����������;�R\Z\0\0`^�\0\0\02]�>uo�)[������q�_f��k?���߿0�kOط��&\0\0X,\0\0�9���T�q�_�v�eh�_.�/ƾ��k?��ϋY���G>v\0\0x!X\0\0\0s�1,���/*�T�R���a~?�}w|��`������M�@:����\0\0\0�A\0\0\0`^���X�[Q���H�+\0\0��*�	\0\0\0��v֖�n���d�[6��l�i\0\0��\0\0\0�B*Jӻ�vn�O�M�t�\rNS����F\0\0X\ZX\0\0\0/��J^�0V�a�����n0�]m�@�\n\0\0 K�\0\0\0K���&�����?��:�ļ?\\Q�T�8~��PA�\0\0�\0\0\0�Ҕ�kc��}�>�pFƧ��d�y�Y��\0\0XD\0\0\0 {��L���\0\0�K�4\0\0\0\0\0\0��\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<�\0\0\0\0\0\0\0<��&\0\0�g�W6���~Љ���i �F|Uq����:���Q�\0\0\nX\0�\\�(�#ͤS��W)�y�Y�_�HŊ�	�Kˌ:�>5�65H�V�7���F|U�ޜ}���J�P\0\0G\0\0�d�N�#�̇�j̜��Lϫ}��j�Q��Z��́����{���|e�}���ʽ֐�A�\0\0x����aZ\0�#����Рo㜩�)M�ʼZ^��\"g��\06�+�\Zx=��Tn����2\0\0�A�\0\0/��W��˟�rh��6˟�kJ*��-��c���&6�:��	vM��,`>#���E�3�\"�ʫ*�k3nI����d�zA\'����=\0\0�!�\0�ۘ�,ꯏ���[���<51���!��K���������ȼ:�0�~���9vM�^8y�i6`��\n7�ٲ�U����J4�}�zۃ�;��E\0\0x\r,\0@�G�������М�5����n��������\'���ȼ���{�`��?-/z\r����We�U�W�/�t_:����\n:�7�&�\0\0x,\0�1�����7�Y:G&�u�M2���b�#����H�e��0Cij�!y�0V��E����յ�}����������[lC2�+�5�\n\0\0<�\0\0 mп���Ղ�5%�ps�q�\"�8�6:2|��J���윬���+ɫ5�{�&V�-|%�m��ϲX�\Z���_�<�W\'�`_B\0\0��\0`�{��\rl׉Zeu햖�P}s.e��3�p�\"��WW)߃զ���;y��YG���j?sR��H�L��m\0��\0�jM:�7�������Էy�I��O(�$��w�:Ιa�G����#�䭆�\r*�`��U�蕪O�˝%]�SrL92�`\0\0��\0`�\Z�o��7w+s\n$t�q��m�Ɗ��F��-��(�j`����h��hr}7ɑ�%`\0��G\0\0V�I��3�?c����ڝ�P�ʤ�X��O��q\'x%��_�%q�T,�lz	�TѺ\\�Y�#�qT%����6�\n-\0\0���&\0��6��*�������֣o��@�W���\\�\\�\\���\\i[ё_]��j�)��C�f+������id\0\0�����U�7��׿��ij}ӾC\'�Y�=;[ZZ��M߶���u�x[ёWW7%{Xyt�ʙJ��r��qzf��^�\0\0`���Ua������}�N��ȃ�ʫy?�s�Z�i�J��yxK��+̘�L��\\g)�eg�WE\0\0\0,;X\0��M:���i\Z��6�;t��|%/�7��l�줮����T���/(����`�\\S���}A\Z\0\0,;j`�\n7��*���ڲ���Vv�J�k|��G��=�;��S�+��Jv�2�\0\0\0l!�\0+و��b��3�@�������F�K����\0\0\0Pp`����\n�)y��s�H��\\��C���İ\0\0\0��B\0\0V��ѫ��>\\�˂{��a\0\0\0��\0\0�@ѫ��ڷ�DQi�����.F\0\0\0�}�\0`��t�;�����c����Q�������˨��7��f\0\0\0<�\0\0�4��=�kJ�:,.�Y��u�͚���|54\0\0\0�e�\0`E��7�W����|{��h�_^-z�bX\0\0\0���\0�bD����_�y��W�#�OF�cC�㱡����?PY][\\\\���ڲ�e9ɝ��<�#��N�3�W�k�\0\0\0�M�\0`��Uu��/�:��ns>O >1���t���/��*r�ɩ��m��o�g0K���Sǧ�k�����ƚ�=\0\0\0�A�\0`%P������=��ۧGz.Gz�dĤ�D����:Ζ�W��}y��%���Љ�3\'՗Ҁo$��	�\0\0\0�5�\0`%�\rlץ�*�kw��Ç�\'�o_o���M|�\n�قN�<�N�Z�b���pW�Yy���U��\n��B�MѾngj!a$��!q��\0\0\0x\r,\0(x�|5�V�e~������qv��UE*V�\ZV�:����9�0�\Z�=�U�����4�k��r4�ռ��--��^ȏ쿣.�׿=���\0\0\0,X\0P�������v�������d|mj0��?\0*O\r˫ƙ.;5��x��?u$+�t�Z��h_��C��ʫ\\�9�֖׺:Ϊ/{��[T\0\0\0�����x�i~��ζkm����xM�^C�F��Kr�\Z��d�j$����Q������������\\��-;Z�BȨ�>�k\0\0\0`��&\0��5���7�/�:���]:*#zJ���uK₭�O�3ѐ�!�\'o�oƟ���9���u�K��������Z\0\0\0����v3�Kg*m����������>6CH�ث�_�$.��m�s[�ߌ�]:���K���p�t�03&\0\0\0�`@�\Z��\\�����o��A��/?��Y�*��{u򋵩AW/P��:�YE*����q�vg��,.	7^\'8���\0\0\0\0��\0\0�^�v�~k�k.�<8;zՒ��R��l�)&τ�}�;��N���P��}_�\0\0\0xE�� ��We�U��n��p�%q�\'��P_�����m��)��j尣#��Ԗ�N�{�����C#NU������������k=��<�׌9e2����%T�b5�{t�ȵL���*\'�b���~3[Љ���u���F�%����-�~6��������?��Dչ���*��A�Zq\'(��·��\Z�\0�,\0(Hf��{ѫk�}���e�^�v�V�g\'�>�QYy��O��o�}=�DQ�p2�S����Y_$�5���L�9����OG6%{[����1w�̠B�@\\F�\\�7\'�r�ҕ�L�����g�*��z͘�W�bkS�(dv�I�J�?_��o�TdVzVެ�p��A��xa�j��l�z�n*RO�\0`,\0(<�N�.�\\Sb�}�(\Z�V�e�W���Q�NŰ�~������僲�M��/�1�����?�-qeyv�i�բ�y!�֨�~S��!q�#7�}hз�f1��T*�G���N�&yomjpC2�D=�],�T��ֻ8�r�,�U�\ZU�ʕԿn� �𔗊�;S�,Ն���	\0� X\0Px��z=������t��eC��,�N~�VtD���\\k?���Q��7�q\\j�������s�0��W�4�,�ddX-Q�ig\'��/�喜W,�`rV��\\SR��njx��K�g�8�K-�<_O�����xum��t៉\r�ǟ��{�8Ai��#-���`C*�,�����.���g�����o�7$�5�{7��zs��^��0�xV��\Z��&�\r��\0�C\0\0\nOĿU�߲�Ս��t�=9�ɆG2kdγ;�M[�����m�p��bX��%�E\Z�U],:l�2ה�����ݳO�A��h�;�sY��Z\Z�֠��R)~s�slh@�¼��J;�?�5�+K��LƩ���\\W7U=�>���V.����a��������P��R�h(���š�h1]��5u����.���[�OǦ��3_h�?t�	}���5�sz�r`u���!\r�����⒗ʫ�F[�i�������Oֆ��p�+p\0K�\0\0\n�L�trP�q��F#ݺ�UЉ{*9H&<\r��ص��v�,n1y��ѫ�om��:_׬��,/��K�?���ׯM\r.{r�-3z%�q�����c+���<pT.��������y�a=�դ�Fϊ����P�y}]}�Qβ���y��?3L:���.CTzS�*5�s��������)u���ڄ!˻~*Υ:��I��\nVJ���u�Κ����kC2�)����]ٺA�__��7ӷ�T���N�->{�tR\0 �`@���Y�n���G|�vZ�oI\\�Z\"IC�Ơo�Z�{8��q�b�.(�=?�xMO�kJ�p1y��G޿t�T����w���^4�3�__�Ln�Z^!����9p�g\'�4U��7�}[⊫��Rr�]�tZn�P}��]�SԼ}td�*�.#���脱��@�Jg�qO]���N��W��M;����D��ܳ�$�z3�访Q\Zpv�JZoKKk~n� g*ǭ��;\Z��h�t��@���򋦀6f\0,X\0PH���� ��<Mgx���v�B�[��,��䶛�]:!n�ӾC��c*K��zu�e��`���-�Zd(����/T+�ߪJ��tD[͍8�9omymS�n��\Z;d�./��߾�&�t3�$]uȿ�;��|��e�bݿ�`���f��Uw�<�BɾWW���U��$�$�Z�ܴ��<� �T���䣥\r��\\1˨�XtX�`\'�\0X@�?��JZ\0\nŀ�ey�����Z��e�����OLO�^M|t�l�5����8�[\'��\'\n�7Y9�LP�h��}����~ح\'����Y��r����U��D.���,�N�Ҫ��_��WK�U�Ry�(���o�I�+���;���a\\b��z�/����u��ה.װ��q���cC�22���N@-u�H����G���c�޷l���z����[3��7~[t@�ݞ�b���h�]�d�84����T���@C�IV�����(\rx�赧���<�^�uPn�5�X�D�a:-kGkeu�<i�<���o�H\0��,\0($���y{]�����%�����\r�z7F9��h��9�.�ԋ#w2Q������	�K~�z���I�eg`����{Jc�T2�a��\Z][ZZ�}ݪ��#_����t�{��T\\�i���=��jM�����nu~��uT�I8y��ŕ�K�`�X3��.����<v�;���<�nv����1�H�i��M�Tw�]����F^���8��f���=\0\0���B��?=�S;FY?�ι\rIO�x��MC��vԗ��N<�A����(Q��p��\'�j�Q.s��u�է�a��r�\\�՜CM�p�n݌����R=�BW��K��j�e\\=�03��+�;S�+�jv%�f�T��e�V�;�T����>ƺ�~Z�)�sۋ�iI\\��-<�_,:l�#�kB\ZЍ��L-=��t�vZ��\r�\n�����Q\0��	\0�P�����](�l�����)Ćd��ls\'{9y]\r=k���Ԙ����2��r�\"oƌ2���3�tڋ�M���^������ڋ�1g�r�o�H�ݛ�+M���>�٤r!r9#�*�|�mn� ��h��{?�l����)W!��؞�Ӑ��VtļG���r�J����6��b�ጕ�\0\0���a��|]��g�7��=�&-��}:bb<�C�ߍF���������s�P}��D3l��W��膭�+}-zRm��d*k�6v�=x����Z�Z9a�:�\\N[ё9�P\\m&�⫁�͠���4��G=���<�:.�\\3s½�흁�ru�i�+���`9\r9i�\Z҆r��y_���r�\0\0L�\0�`�;�Y���)XJ��#�<7$�����m�*Ie���O�:�P�����tQ��Vf����3}��i�\\��8+[[S�\\Ǥ��3�_)�����a��2R�Xf�C.m���ժ73S/Tߔ��V(�����3W�W�cX�\r����cz?smN�T��UVך�HFM4\0�jF\0\0\nf��S~j\\��E#�:|�!-��iI\\�[%>�c��Z�H��h_��Љ��^�Wtz�K�R�dΩ���k�k!�U<Y���,#z%�ڷO|�F�6o�����2��6�5�fS�޷y�P��\Z�%�}`�Drunǰd�6Tѫ��G���>4E���\0���Q\0������o����e��	s!aW�٥Ò��t���R���\r�rO/�M�M���V��\\�e%q#6ԯ��RF-#z%\'&���\rmhS1�C���Ú��w�x��`灣r-�۽�]��_[�+��1,y��\0�jF\0\0\n��Й��~|�s\\ij���~�I�\'gr�.�?u��m�����\n%��}XE*f�B�����c\\�j��t\nX����x��z��B��ѫ}����蕞�8���r���^��R5�\nt��|7rz�>K�t)�%w�Y*~灣+ z��>�u��\\\0�M�\0�0�83k(�g`ņf�,���ڶ�3q�Z��/?�e4ҽ�_�������:���T�b�$�.�u�����N�z�6�ߘ�\n�f�Y�+k�Fkd�\Z�U}؝XywtFȦ3����2W�����y+�tΠú�e�u��+�\r�q�w��_����P;\0`�*�	\0� ���YĖ9��%qAf8��\\��dYS��r]����#��t�N_���o�xP�����Ѐ����^k;�L-������S\'�X)��<�5����S��r9��R��bC�*aM��:0yf�?���Ͱ�4B!�l_y&�<pT\'x�U�:�\r�V.�������r%5�\\��7�^�vs�8\0`\"�\0�A��sF,�\n��+tHn+�:��w��fQ����h_w��{�N�ږ����2���u�\n`Յ�T\0˙*�r\\`ɌZ��ꌪL�0עfQ�J�k3C����H�X����O>V��ǾJ�K��e�We&\"����s<X��Nǰz��幱�E�3�غ��V�elh���������*y�T^YY]��Ŧ�oFz.�O��UC�F.��\0\0��\0\0\0s�r��̪ۋOA�&�����7�}����M\r6$nd�+$��U\0H�X��OK�VVת��}h2Q�^�<��`���͉nMz�ߨ{-����7�[$�N��O>V_F�[Cɾ�+B�H*�Nnܳ��W�2cC��OW���#9��M=�ߨ���6�Ma�[�vg[_wF�����G�����.E��Ѫ#��X�^\0��`@!L�|3�����߰Lg`�Q�<�֦_��b�W��?�՘�v����T4�`AM�Z�R��\"li5�mJ��M���UV�Z	��G�_?�Q�zߡn�j=(c����.�+�J����|.��3�t��NpMi�J��<pT��*91����cG}3���m�(ϱ�sK��5��,K-��~ۆ�\\k?:�Lmm��!�\0�,\0(\0fF�]vn�*wVN�Gyjx[b�rd�<��\0�U�kC*\Zu�g����ٚ�����z�|��Ds�!���\02*R��My$��tXA�ƃ�*�ER���+���Nk��f4ҥ�Ȫ�Qᖢ��\\�^۫��\\����x���A��26\'�=$�,7����������ߩ(�4��}Y�����z��~u�����:�9U�bE�ĤS<�?	�_%���ϛ���d/�6�H7�gK�I�+c!\0�Z�\0�\0���Y�:��.���t=&����&y��?��J����G�́� ��&U�K�.Mج��ih�\"��%-�\Z�o�gEj�iGz�H�-0]7IUV�JՅ��K\n�y�藟�R��\rl_yIXf�&�_�ZR��[d\Z���t���t[ZZ]�(/7��C\'�ϜT_~ؽ�{d�f���י�ҕ�bA\'.Ϸ����Tl�4�_��4�/d���q66�/k1 ���^���6t�a\0(�\0�\0��}����9i���$������MU�ﲕ�Tn҅�ӥ�-�\\f�(�F!�v+SMs�`Mjie�o�g\n{����{�02\r��8�@q�9�\\{x�Z�i�ߦ�o�|Q��T:�#_͈�j%U�2��%Y\n�d�n����wl����ANog�Q7V��M:0w��&ٕs��WS7os�\'��l�45ڐ������Oy�8��9W�����h�~�/��֍l�q��5k+�Z\0\0/�	\0����`N�Wj�h���dh����5�s?�ލ-w���}���zY��ٯ�pi�`lh��Oy�����W2o_�\ZT)\'\\��>�����n�1�1w�,t�N�9�\\*}%w�o���ѫt��d�!y�%q���/���U���������||���\'��Kzv_Kg�/:WQn��#Dr;��k��:������0����[3��C��~��w\0�\"2�\0�\0,rC��\'0�\r�WY�	�L�t)w��Z	2�W\Ze_�����M\'q�t�J�Xlh ������nG7nw�]k;=Gh#]�\Z���s��ʄJ/�2r^�O��PѾ��w,o��Z����A�F\'qae�#��V]�L������xۙ���b&\ZNުIݛ�g�cr\r�6�-l�v�}�Mh1�H��[[^�#�-K�e��}��G�v�GYK��Nn�m�+r+}ح�[Ű�>��&\0\0���\0��x���U��͹H��2�`$aEz��UW?��d֫ʝ*^3}��f+ǔ	�L���P��L�r#��L��Ɉ^�}*ߘ��L�Ӆ��)1&?�)ٳ+��[�z%qՌ�>�#���Ѐ�S՝w�f��p��W�5%;[��~|�KG��+�͖��\\�������<0yF���|{8�_���.6������(��-�s�M��-���4��S�\r�~�S�C\0�^�\0��T���~����b�M\r�yr�粭U3�p��*B�,syZ�q�� B4ҥ��5�%�2ӯ�o^�̪N]���EdK��șؔ�y#��ً��8�����z+,2tu��֖��&4����R+಻�L�iH�ԛ�?w#Li�ss�/�������]����ɯg�6=�s_r����<>�t\0`�\"�\0^�jw{�g͌k��H���⾸L�)�DJ&�V<F�f��[R������W�+���ЕI-�ڝ�F\'�Xp����v�ʌ�n�-5��+��\Z����\Z7�\"��K�?�[���Q��S��h�]��u(���d�km��)�O�g�q���\0�Ն\0\0xݘ��\0{�g+���3��j]�^W��Ѡ�Έ1W)��̰XR�Y�>l;�����+��2��1�!j��2_~���nk83�7��BW���O��+�%��-@�05����9i�e�[{I��YG��Cت��G��(�%/Ƀ�;f}=~�\0�jF\0\0V5v���șГ�ё�h���a+���9��,3f���5�f�o_|ߘ�LG�����æLzͽ�Z6%{l�<5��j���[�bF�ryn��h�ۿf��ɯ�,�����Y�z2�\'�/,\rQ�E�-ư��=�%��YE��]\0(D�\0`U�=��0W�u!	+�s��5��1#+1椴&���A�LH�J(m�IoF2���b՟���B/V�1��w3����U7��I���:��ʳs��#Է��ft����ʭ���Xt�7�����k��ZK�a�\Zg����Y?\0�,\0\0�Lw�T-��mk�k�\r2#>����EL��3Ҡ_��A#�o��f�A:%�����q3�%���q.�c�æ�)�b�n6E��j���S��������ɽmF���;���\"�N�׿���ws)Υ9{;^:J^�IW|���O>6W��t#\0\n,\0\0�0\'Ҷ��WUV��@�Sʻ�ƙ�s�B�����|�R�Wc�2�*T�dqs�ёa��L&��_�����m�+�ˮ��9t�I�~_�*��V+�M�O����F�vP�!q��c���یfW����T��=x�C3Sn�������ʟ9.^�Òf�ͯ�ΌBfܿ�_~�Ky�? �6#\0�\"�\0\0\0;3�d�w�ݪD���v8j���=������CY��ˈYZ?8�YR\"�#_�~o1��L�瘧���W�c�W����9������Ǚ�Y諥�/VU���2��v�9\r������,k��U�ZE��2^��N�+�V��V�mW�Y���Z�uꃁ���`Mꞌ�,\Z\\����iC�h&=(�%�����uu�\'cC��s5�{e�B?\0����\0�5:�$�0[���3�j�3c������Ȱ�Y���LϱP�z�ߐ���Nߖ��L������8ҘY��ט�P���P3@ِ�����L²X	�\\Eh���T�?>�x��⒝��使���3���C霬�w��]`���R�A[^I\\�Kn�sR\r{���R;B�\0(�\0\0���B2�irQV^�w\n{��ew�%\\pM���S�2ɥ�=�OO����5�<?�\r=9�3�H��,�%�.<_�7��_��0M�bC:~����9�R��=FE��]d\0���\Z����|��;t�\'��M�޷�1���o�x�l�ߴ���`�<L����c�imjPn�W\'����$\0����\0\0kdF-�.5}�G��V6_�7E���̓���RK�Z=�ґ�P��Jͩ�˷˙��������Sڐ���U1,�Ь���K啋�\\>{���`����Y�R��_K���s��i�܆�յ�Ny:�X�ɨ�锥�q��㴲򪦽o�K�`��Wl�l�ǾJyE��N �\Z&w��(p������ą��U�^$jQ���V��q�x\0��\0\0�j�5�4�]�dߣ�������}��[8f}�Nω��f��.��Xʈɺ|{Ft�b\0�LϩI�+r&���\Z�NS��bbXr�ퟝ4w[{%q�����v���¸���|.+����F�S�e���}T�ǝ���l1Q������t}�h_��3T��U���z��}�看(U0+��;�����=��j\0��\0�m��r��%����oW�N�H�Ή���H�d���z�&��XzA����,��L���1�+=GS;�1���@�޷�\0�����nu~c��ٖ�R�k����q\'@��\n�5�{:l���N����9�����3���R�;ι\Z���!��>K:B��\Z��j�zFE}�:�%7��u�\0\0�#�\0�dbb̽�/�(/�J����;S%�m�H��7�\0M�_�-��Ǡ�^�g%�*����T��z\\Sb�\0�>��_���+��#�*}����I��\0X_����D���{22<Հ}�HW���%q��:S���յ���Y�\0���P��Vب��μ/���	=KS��\'�5s��j��Q�`V���|�Y�Y��j���vM�����H\0��A\0\0\nI��S��#�����J����kJT��/��YB�x]��Yܢ�ʥ|�cd�T��s��X�\\�������3���:K����6y�0*�;��ʨWm>I,(ͧ_��Xz�\"S���^���2��Ŷզd�\n`�\'L��ٍJX�<}	z�al��_Ur���P�T$+��#\'\0��_�\0\0ϓ�m�{Ͻ��0-n�)�h�|5fF�L�U}��)2��R	(n֫���j�)�s���Z+K�t)��j��t�Jw�sʝe�-��Xo`��҅5$o��VLZʘ3󰲸D46ԯ�ei+y\\�\'�������W��K\Z����8�*U-/s���5�T$+Ho��)�C�v\0�\"��Pꌪ9�\"M/=`���B����7ΛS�sT9�8���de}>l�HDz�X	`m��j�\"\\�XT\0K��c)�*\Z�ΥV�Y��������Lϙs\0Ԥ�� ���/�U������[axm��~�X�n����mE��t���ٷ��$.|U��z�z[��</$\\XFͬ���h�+#-K��6$�r�修\0����L�_���R�kJ2���>y��_�TP~�f`�̠^I^���EU�RM\Z鹼��B)w���t�tQ����/t�ߨ���(�~ר�N���P$���r82�\0ؖ�\"/�h�_k�����JM<ѡ�,�4�˕a���g��zK�����bM��WW�񥾼�~���Λ�r�e�M{ߔF�t��0#��N���ِ�A\0�\0?M\0\0�gNجǰ�:D��\Z�U��3;z\\����^��B䪯^��{2fp�� /�{�	�\n%��t\ZZ��)��~�g�+R�,�`�[��+�cN���OZ)��ɹ~eQ������?�ٿ�M�d�Z���C4�ڔ��x�Oǿ��f�σ���������}�-;Z�k����}�谼��\0�U�,\0(\0����Ӱ݅9�,b�)3�������\\���ns�q��������n3���O:�-����d�Ώ�}�Mmڕ#9�.�տp�2]Jܱ�~uŜ?g�0\n�הZdpxG��Ev����\n`�ah-�h�&ϫ1�a�V1��#ﯷ��.�\\W���Qy����ٹ�|5mEG��[\r�lV\0�@\0\03�����?�\rV�����S�د�e�U�} �p�9���M���{cN���C�d��w�K\'.E�s?�\\�.|.g+W������kJB�͹���eW�}���#����,f<Y1ho������!���z��T뗶�=�@����uF�-���VtdIE�\0\0�,\0(\0fV��%��3K�z�y������ʫ�>��b�T�kg��^��!9��陱��Y�Y��,�>ۈ�J/�\n��s/c�v�A���ȿ<<R��#2bX���S�O��%ȳZ�{��\\,Ϯ�E��즋\0\Z,\0(\0��Ѡ3=-�(ka�_\\��\r��%��o�_x��%k����;t\\���n��S�zb��|4W�+g{n�`�Wʷ�$]�\n�țe\\Y���e�cX��˟�qa�%�������&�߅��]��E��\0\nX\0P�*��P����Ui���KM	��d�0-ܸ�y�[s0Gf�(��T��ʫtr�#_��u\0K�J(�X��o\n��%���_S1,�fYݰ_~��K�O��w�{T�w3V~+���;\0�!�\0�¬rb}Bb�\n�순�>g��Uv�i����D[80�$�Q�=w��+�7�,��ͽ���f)�*���\0�S�L�$.�K?p��u���s��p��n���\0�\0\03����3�5��XX-c��2Wf�i���]��Y�N��?�R_�,�>�*�����Xf٬��g�{�v\0��^�M�6&Ϙ&�c����o~�w���������r¸�Xt�ֿ+\0\0\n,\0(��A�݃W����������>��u�s�?>�e��`�+El�\"���%U=�UΞ�M:�:�UY]��f��詯̐�����I@VV斦F_��\"#KE�����6�S��?4cXW�S\0V3X\0PdN���Q�7�N�3 �Yf����.k5�B`ˁI����	��&#�jv���;�������Ygǃ��./3h�e|@�e��\'���_7$od�<�.�?�?��?]k?\Z��UT��5cX�X���.�U�\0\0v���J�����}�2ñ��\\W��<��tw��p�p��ԙ�g�`]����3+�`\\vr_$��݈`��Cu�1g�#�^^�&\\�NU�L4$n�Ɗ?�}���O>��~��HVF�?dk}7\0�������*B�IX��f=C��\n#�e�)��ro�J��	d4�e���N��+�2�U�>�6���r<Z��J��b@����]`�Ţ��E�	��s�+�^���\n.�c1�����e�3���x��Cw�G*��f���$.��@�>ґ�K�OE#�H��jw�����N�%\0�NE4\0\n3����I�U\n7�P����h�f�͍\0�]��=��t�����h_W�\'nܭCK�V����澄V�U��V���~P&϶/�W�p���*�iv$����1c�|�2���N観K�\r��qY���C�������VyH�`�Hn^y��]�}_(#r�N��)��&UR0��y��S~�E����s3�K?�\0\0�X\0P0JS�zz#�o}[t3�an��M2�ҕ���)w����ٖ���*s�Ȉ�̇\Z�f����O�8tSx�J�t�W�w{��_xJ�|5�ؽ2�J܈.UV���w����j���=��ٖ����w\'�13CM���Z�i������:1�&�gGB\0X����B\"�ǁ]��]vӎ���^]�Z�\"3j�\'a�l&eKK�a7B��Qt�F~�\'�=E]}�J��;�A�ƚ�_��ץ7U4�V�c�|�K9&f&���]��g��&�o]d->1{~�XĿU����/V�&�W:�#y�ʜ����R[�ձ�<Կ7��ƹ�$.ȣC��,���,������̒1��嵮��ӿ��\r��_\0�*�\0��Ԥ��t�g��W:S��K�O�����2��f;�DK�)�i��vp5\"���Lg�Ez�������d�)���ʷ�{�|�t��&�\0G_�1˵�L�.��̃S;�+c�/�����8�G�c_�ŢÅêH�t6��ܣ�Ϻx���-�*Q}Q�TU&[��\r��7y�?����H�6�4l:���Wj>G�i�3=�C�f��T�[�o���:��?MgG}�\r,\0X]`@!Q�U�ZEhkr��[O������f�c��7-Y���ݘ(��GU�C����֣9v�̢˞�~���_I\\5�e������:��Ɛ0��ɸݤ���A���^�������h��\nl��l��vZ}S��+E�y6v���������ۊQVVת\0V�	�����с3[W�L�T8&�gΤS|�\Z�m����E%��<��ɳ�\'�4��6%{䀏�5�e9S��\"�2��_B����<�ee�j\\�a\0\0XF���c.�2������~���P��_9Ƣ�Rgԍ�7�@V�oˎV���n��F�v3�1hu�Y峍�d�Ӽk����a�--�o��H����x���&gb%�!k[�a�9S�\\5��7W��-c���,b��N�����#�Sqv�鱯2��z���WE�.���&�I�S���Ւ� ��|�{8��qV̺���v�,�V��E\0\0X%`@�y���6�Ǘ)��(�t�ki5a�_����Ń��m�RϬw_��feN�r`Ik��d��6ݶO��u��U:�28��nv��C��w+���;tB���^�5��HGF��\\�,k\0˼�,f`�Ϝ�&�]�U���6\nX���F�Ւ�p`��[�ڝ�&��5g0K��N��W?o����g�os3���\0��B\0\0\nL�3�� 2apc��ӈ\n�D�S����~=���L��Lfc���-�����XV^5;$�͜��<�~���z������4͘���/���L�Y|�j���M�{�2o��}F�.��r,.ё���P�wl��l.Ν󙳤�yo`���k\\ʨ��@F�z��}_�W�3�L�Q�Y��ٵ�}�_~�KyY̿{�2�터\\��\0\0���\0�BJ��u���f1����V&?z���E�����J��7�<��-5@���dr0�w��r�a����wv�-c��x�K�/M�ʬ�bT�b�g����\n���\'W�9h͕�28y?����\Z�l5+�j���*�{8`�T_��Iߤ�>��y�tfn�\n7[<�^E����<	������-����h�&�M�X��8g�[ЉoK\\���әY�����$ҷ�}_(#L>��O>�_%v�:�WC��\0`U!\0\n��ԠNp��u�QsD�:�G&	��9�a6����_�<p���WS[�u�ɤ{��>=Y��}���u]�!�h_��-m7��y>��m�h�e��>��ؒ�������-�cv��Jg˕dg~V�{j��}�->�jп�|��~����=_�p}���>�h:9����I�kI\\x+�O�gF)�����������\"�U�\0\0�����������G���O�*�7�5�2������~D��kfN��s�r�̑�=��B�w�2&�V6�����^k�����#��eŖ���O>�����+[s����mt\nSMj&e�����aվ��4��(�|�tn��Y˻~P�7���ђ~P/\"�mߡ���2�bۢ�G�1��W\'�0�X���.��\0�6�\0� �<A���#�d�v�؇��e�a�챭�H.Յ��(GeN��`�����re�ҕ��Ѐ��-���Ra�^����Y�f�㮿1�s�We�v涱���b�W�+�d��d�Z�Q������\\����{�k�#��f�tIOB�ᐑ���&�kS�oL���q���ۻ\0VX\0P��5�3��鱯���H������-�ۛa5[��ԍ��n�lL�����cX��=:]n��¥r�|�9����ܷܙ!<n�\\3��ܲ�5����g+�\nzyԆ�t������7+���m6�Iu;F)]�\\�U}��g�&^�e]Kޙ\nH-�C�:an��j\n۶ĕ<��\0�*�\0�Pe$a��my�q�9M�c[ё�@>gM:����*ze� ��\\1������.��*B�Ym�t$+��q�|���3{�\r��$���R����x3�뱯R�OsAP3]�g�����QZ_\ng>����u���EʧYK^y+����:13z��\\��6$n���\0X�`@3� ]����̔��܎�׿���W�C���\n�k~�T)bW�W�q�t���<����t҃�;���Q��s�0�j�v���J�W:S���4��rds�tz���י��԰�����(Х��N�j�u�.�,�ci���<�E>s̢�Y����6��5�Lċ\r\r8\0\0�\0\003	�A�+Ք�1<��.��<+�%/�a������wov�[��|5Ds!z�f�:d�)�������o������A�W�v�|�|�owaF�I���0�Łj��;t<�Ń�S��1��<U�e�t\04���j7�}K�ɳȍrNrL0\n�)�[wόYˍ��gΘSf>���t�ᵾ#asǟ�Y?��wo\0�\0�\0���$.����O��d1�������呯�b�ᯊ޽�o�q!��g�\\��fl�%�＿��Q��KZ�V�7ӟ��É[���\'��R��݁#��x���<��3�M���l�p�9VeP�-�$c����SwA0/觓��[i*F9Q����ư�hf�S�?���i2W\r/>Llk��\\���U.ֽʆn<C�Y/\0�>X\0P�֦����񮎳�~�L��>�Q�?�˴�f`�WE��#{��-r:�\n$��I�n[ё���u�L%^����Yܷ~�km��%�J���STr�c��$��b������֋��X5�J2D�^Ͻ�A�#cU\'�N\\��v(w\n;����>	V��e��\'O+ۤ��5�W�{߲�x�ܷ�\\J�O[ZZ�	��\\*%��au��^�\0X%�h\0(tےW�kT����6�ĉ*��<��L��:�e�*uAk57+uF�{s&3�ʈUe�c��7�f=�\Z0�_�3�J	%��2�۝mv��Y0[����ʦd�^�%���1��V8�E�g=�iH���Ң����͡k7z��#ʓ�rly�b�t�xpu�\\:J}��W�U��m�+Y��!#T=�춉��f�1̳}�N���B���cX�û�X_�j�_��<�)�no\0�\Z2�\0�����7$ffAm��to!�6U�y-s�y�L�K�1����^הl������fߡ�nG�������$7�~���BZ�\"��e��|���+g*P�P<���N�2��!*cRe�ɀ\\|����*�&7�4���cl�t�^Ku��Y��:}D�飋E��Z�I���HDj������H�Zҍf7�H���Ű�­�4����_V�+)E\0�T����+i\0(t���G�\Z5�J&&Gb~���<|�LHB�M[w�V^��xM�蟆�ӳ;Nx۞m��z���U�����8�}�u=34����7�/9�Y����7-�(����\'�\nK�8ў�-��NB�\ZFGbn�I��\0{0pG�I_�|��+#��QE�[��-��n��*?��o�,�/o�o�L�ה��������F#�w���am�_�n�{_�	��F�� ���BijT���qh �����_u�����-ݿ�wrOɇ���,��I��0���ǆ���7t��\r4f�������OU��_�]�J��bR1�:��56�A%/��������j��Hv}��e�[�I�����d�Z�7��=Wt�!qC\'�\0V��\nђ��^�J��u��l��Қ����\"�����*�CL\'�O<����l˘p��Ke2#��u�2�ti{�L-�<k��ru\\M�^�z}e����֣�o\rg*1DOצ�6\'���oT+O���n7J���\\_�����Ѿ��0����;��棇�~l���r��L\r�p���x4������0��8g}Q�����~v��\'f��=�m�8[���i��4����3��Zn���f�����%$�X}��ge��Ԓ����:�2��z�jH�ؐ�f��:{��<�l-l�F�k�8[�jC\0\0V��$.\\	�����vZf&�Ú�\nK�Zv=w���N�/e���k�B��^�t%�H��EMf����Զ%�\\,:���v��n�!<�������\\iFk	=U�$���meF7df��j�h���]���������C2fT�ήͧ,fq��l��7]�_y��r]�T��R�`�k��.[q@�M���~�v�n7����@|mr�&uo��_U�_��(ܾeG��g��Mj:�\0Xe`��Q������:m��<x�C���2�t��T̬ �,[3�ܯ�-K\0+���3��f�NW�ٝ���Y��6�K>�?���^dխ���p㞺p��uٮ����}Lڕ�ӗ��y�g\'�>��K�{����Ѐ�Gҹ��?�\\S\n7o�����R�>���� �QU?�p@�fk@�K���㜙�\Zw��)����y>���9e���\r��h��M*\0��`��Ғ�0�R�c�O�/�����eI�g]:J�~Љ�J|�_���t�Q-��s�\\�˷��zlvҔi����i��Ѐ\\����U%��;oi�23�I-ɭ�7����z��#W��BBMzM_��Ua���&������کƯ��F���Py�d�f�&uOG��\r�֘��Ը[;g�}�Z|�w�;��\'Ɨ1�\0�X\0�Ҽ:��W�wU,@fk_~�bXڵ����l���و]�T,#��+���dO�/_�y3�K}���ɟ����Z�����\Z03_VX�ճ��hI\\�kE�zP]��Z��u�^HA���4�ǎ<(ty)y�ٍ9S��}���a�#�r|T]<��f�Ĝ�ж��/�c\n\0��؅\0V\Z��X������S��ǟ����z��ǁ�j�G��u^�L)��E���Ψ��Kޏ����g+F5����⵵��������?oڿ\Z�e|b����OF�w����Q�wIG��.�� w|3)<��?|����߿_��u�JK6\':r9`��m��O�nl8+�u^�0��AhsEe��7K�ɜ?\\S\"?_߸gˎ�W��7Y|I3����M��;?ۤ\0<�,\0X��Sû&����a9S�+��r(��(\r�����ݞ+�-��p�H�Z�61ʠ����Bʛ����y.*m_�\\�#�t�-�t���ɷO|���K��b�Y�=�M�\'n��7�\rg]]q�7�hr�{��q�5�yKp��D�_���<�9\0�3?M\0\0+��ԠYfEŰ�㫳5fG���A�\rɨ�)���{��g�r��2)�5��yb:	h��ai����7E��ʾ�ݓ��������~.I��[^�:�E��+Gؖ�	:�}v2�\r���-z������Z�A^\0�`����Q1�En˵�tw��~�J�K��d�M�Hw>T>E	��e���M\r�������8��X^�eD�dX��V��)clw��]��u��WbzQg��xۙ�+x���h�l�7V|�\00X\0��͎a}~�c��c��9�Y۳�+Ŭ?��,s�]c��\\կ2lJ��+3�\0+idF�o|+�7m�ݮF��SïN~��cX��Wv��E�����J\"�\"=6�-\\�\Z�|;\0�f�\0`��Y�9W�������vgۊ�p��~�cs��蕚���\n����.���z���\"�N�O�l_&�מ��_2�r�械�\n��W�~b�=7�/�-3���Ǳ��й�*F�Z�.W�\Z50c���v��\nb\0���.�\0��:�澄���_\Z��ˍ+uk�h�����)��6��8�����G[�����v���5�mE*�Fؐ����F|U��G���ެ	m.�����g�-�L����z����n݆�s?O���nN�Lo h[Y���Ԡ�v�\\�����ߖW�TT�/���\'σ��<<y��N���Ulh@�P}��x��wo��?���j��\0P@`����9�{��<�Mo�5{����>]�s�s����8�7\\w�2z\Z��Q��\"�hTSz�m���Y�ΟR�d\Zܜ��;	O5EFK����ֺ\r/��T^��Sf�����W��xE��Ʊܺ������;:�Ӯ�غܳ��^�1�j��=���n?y*SC�ȃ��P}�\n��~��/�T-Y�Z		z\0�\\�����$~����|��w�t�Ck7�\\��t\\c��L ��5��W�gk�3�+U}$TV^UY]��d�N�t�6�/���`SlHE�;��O����@Q�J�Q�\'��\\�_�Ӎ����Q�4���-;Zs?���\nn��F]\r��q�ק���W��ߙʶ�tV�R��m�u�������s�#f�����/H�ɣ�@���+�\0\n,\0X]�SN졿V/\'�=����s|��u�������\\� ؐ��:�E��:)s��7NOG�4��M�����H׫�;�8��҃zY��������o}��B��F#��gN���N|��WRQ[1��3�O���m�1x\Z���W�7Q*j�<�$coc2��M_Γ?�� %��B�������Wy��K�k	���\\)�%���y�^\0X\0�ꔥ������B^�������B2�(�0�\n]uw�{��oL\\ߖ��eq�!\'?�R�#3�P}��T�ёa�%������W���Lґ�.���\Z�=W�2��[�\Zܛ��n�1����sc��=����g����d�<1�n(9�t���<�՘�w���KU�]�,�����_F�nHF��7�L\re�˄��<�(]q�8o���\0\\E\0\0V#�.֦�E&<1�:H&&Uk|�O�뽟�2g��y�x���+�_Ͼ��e�/�3߽uEO�V�}N*I\'��儎����\rΆ䍖��%�J�Q��P>1�$��Ѐn��F�yk4�g3\"���������xjM�������Nܼ,�X��#�*�Ȧ���\\	�)qi%�śe�8o��\0��{�q�V\0�Uk�)����7�e���P}S]�)�T7�$\'��u��ͬu�T�b�W\n:t�}U���������,X\\b�����G�M�ߊ�S�3Q(���W�د��Ӂ�5%2P���.{�C\r��s��ǭԄ�%q�4�VbN�_/-3�(�z��GY�U<[�Y˲zK=�z��3�_Y]+]��O��w�����s�.�<�{�3�2$��ȎV�O�Ez.��$oH�hH�p\0\0x,\0@z�x3�K/A�\r���u�M������t��uG#]��T��T*E��z����L�-������꽕]��?\\狺���n��o��,]\rN����O28���W�XtX/����=x��%�CF��\";0yf�zy�W��o�(�O�p�yU��������G�o_o���[�Zy�K�-��|�\'�w�\0\0\"�\0xq\\@Gj�6����gee�.>��o�َ�CW�L�/V�C�M��o�ȗΟ�q��]k)õ7�]��sW��h�a58�#݃�w���ئdO�瘯���� �յ��XdĆ.��DG��N\\�Fyjx�����a,uuS�Jw#Y�,��r������G�C����2!���D{_�$�QC���ȟ\0��\0\0 3.p���o|�[�Hb:4P][V^%����:�S���x�a��e�(���چdtS�g�Nx:�����;��ʘ�����������_�p]8ꚮ���Nf�?x6\\s��?I���bC����wp�qOu�[[^[x��������淑��xU����V�93m`f�Ϯ�`_b`w�M��\"�`��c��C��k��)�%�M�C����%�lۋ�1���{���\"E2U,�͖Zj�EI����n���b�W��ԏ��/f?��o��X����L*_��[W�M�?��眻x�r�sb�J�\'�V�x����O�bg~Ξ\\t�	�\08��g�ۿH��7t�YP�ў�Z�lܹ�@��D�:E,��qw�K?�8u|4z�8u\\�6�����_m��o����W������߬��:����˱b��������_����n��������S�u�<D?�v�S�s��g�o�p��[|pK�w��:�轰�\nN�s\n�^��#�Us7UE��щ{����߿�j�JNVrX�|.m)v)��}�}����	2]����5^�	�z�_�+�z������?��ȓ��2��0�	�\0x��t����/�GgU@܌���⤱8u����p}�w|�E\'�O�/V�~p>����<8���wkp���D��[���)�$��/�G���I�|wnu/�S�xl|��u��L�]�[�Ȟ��`p	��?���Y�\r�=n��\'9wGO����-�5]�p�Ƿ_�QҨ���w�)x���m�$`������I����7?Y�KR>ɾX��+x_�4�-V�ì�ݓ0_�%\0���3����rq�S&Yi����\'6�d�8�)6���bc�N\Z/������7�yA�w��|c�?��=��a�����QZ,i�pMʇ�e��z�/��Q#��|����w�+������x8o�D<���aY�pO���Q��O��W�׫{��s��e��?�O����I�D\\��A��i���-�������QܖO�qn��9�\0���!W�Q?���\\��>Jg�9�燣��	��eoO����1�/��u�\\�f�����m�gM��^%\Z��$}c��x����y��.JwA��E��Y{���ɿo\'{+^T��`��ޓW��x�\'/�e��l\0�\Z΅&ө��z���.2����U���O,u2�V怯�����*�셮�\'�;\0\"�,\0����ߜn���ʯ�����\0`��\0 �rF�����x��W~�����_�+�\0�jX\0���_��oߝn?\Z)�\0`��\0 ���������~������h���< \0\0�\0\0n�Q����oMߝ����a��V~\0�\"`���A���dr��Go�3���D����\0\0, \0ܲԾ���Q�]o��������\'����Y��h�~{�g�\0X8�%\0��;J\Z�f?O�L�XM�=i��������ϲ��Ϛ~�w��O�6������o��t[�\0\0J�\0W�i��g���������ѓjc\'ݞ�N�����Go�3��mo�O>z���=���\0\0�XX\0��ҵԾ~���������?y��ߞ�w���7���e\0\0,(\0���t���?:]EUX����\0��������_���_�����w�6��po���n���\0��X\0pi�ӫ;�_{���~���N�PU��_}|\"�*>emc��7ߙ�Ы���/�^\0`q	�\0��~P��4��7[���z�쪵��y����+\0\0��\0\0.����u��ֿ���|M%TW��\n\0�e�Y\0����~s�����\n�^}��{ʯ\0\0X&,\0���t� ]���|���>y}.~��\n\0��\"��K�4}8�~��w~�<��\'�Wmo��*�\0`	�\0���W���)ڷ��u���oN��G���\0\0X,\0�����B�ъ�������?�Vۏ���=q�\0�X\0�$~��w?|���v=�u�=k\0�r`�2���������\r�2Oz�\0�� ��Kh�����^7�w��W��?����G����\0`i�\0�6GO��O�/�w�������?��t�U�~m��)\0\0��\0\0.av,�G��n������������ow\0\0KF�\0��1�l�E����<��Ƿ���{�������>�H�^}\0��`��|y����_��2	듏���o��O����G�W\0\0,���?{�*\0��|;�7��w��;�_����6�o������}��>߽���.;\0�`������Q?�W�֛��|���?��z�u}��\'�����~��;\'>�����>v�\0\0��X\0�*NdX�Go�����<x�Ks,������{��㽝�N���ѓ���1���\0�r`�+�I��[���t��_�ml߹�ڝ{�w6���f�ν�^�����_~���V���|��W=�勇ķG{_����}�\0\0�@�\0��(i�}�7?Ⱦr�Ϻs��z�]m�{g�T/$�\0`	�\0઎�Ƈ�[��t���Փ����\r߿;zb�\0X5�%\0�+����>.�ҵOӇ��N�}�0�=��=�;zR�t\0�jr\0s��=\Z��(�������^ަ���d�q�經�bcs�4�TZ\0��\0\0�KU6%�\0�+�,\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0Zn	`����0IzC�\0\0@p,��\'_Z��H[�������e���ucz�dx�_�N~lt4L���ho�G\0\0\0��������,Mgs������jᝓ��^�W/��F�%\\3)�s�׉\0\0��`�9Ϗ��i6��fR����E���̤`g.�l��dkT~p�p�\0\0X��EK�\n?�\'qɤwoگ�;�������]�QٮXm�ˍQ��q�%�\0\0�o	XfYZ�IM#��q�OK>�z�����N��ig⸒�Y�eP\0\0�m`��N�T�qg��\r���w���\'=�\Z��d��L.�[\0\0\07s�f	XUPU�������q�����V��Ւm\0\0\\1��Z�F�f�dh��?\"k={�>�mM붪�����\n�\0\0\0.�Xn�1XfUe�_UT���er�nkkf�[�X��ɰ-[\0\0\0g`q�\'�q\\�ge]�@V�q��*��F�`4*S���\0\0\0�\0�kT�U�,�����*�/y�_-�gKwf�G�[R-\0\0`���߉��\n�������l���Z\0\0��`q�3�<M뙸\nn�98��w4n?�\rG��\\��]\0\0��\'��b�V�����������O�s���Z݁Q�\0\0����X�<ndic<m]�,�i���\Z�UqV�{8�زH\0\0@p,���������ٓ|\Ziu\Z\0��X�|�K���i�5��\Z7���2�r�C\0\0�	�VL+�̱j�#حp־\")K�j�w������h�g�:\0\0n�\0k����D�zV��������xx%Z\0\0�M��X�%4-�je\Z�k��$\'J�zCS�\0\0�k\"�Z\nٸ2�9��j)�n��$M�2̚L�\Z�ʲ��ay��jB<\0\0�U�9,��.��U����7�L�gZ�Y\0\0�����:�ZF��C�\0\0\\�\0+�]$����<�{<?�<x\0\0�EXa�-�Vc�י��uT�Y��v��\0\0HX�tj� �Vf��¯Ki�^{v}�q�U�Y]͆\0\0��\'\n�����8)���N�qjx�fC\0\0X1��P�ˌ�Zu�$�!p�g5<�j6,g��F��Y\0\0��X7hZi�C����$]7�N�79\0\0��\0�U�VUn��\n�\Zw�3������xr�NC\0\0X|������T���\n�6�����겆:\r\0`�	��S�[劭\0��Ѝ/k8�i8����4\0��9��W�I`��ص�cl\0\0,�+�\\���\n��szl��P�\0\01	�.�1���V3�\n`�Tc��Y\0\0�\0�b\Z�ЪS3�\n`�	�\0\0 ֹ�V\0+N�\0\0�^Dn�i�a����\0���fȭ\0���fX�Y���hda\0\0�:���\'h.;\0�`|5�2�ڮ�Vf\r��al\0\0s��Vqʱ.�`�/��W��Zr/)[��Y\0\0���W�.�.��VA\0�&���L��������,\0\0xe�`��t-O:Y�q�;\0��վ���*�20\0\0.l�<M7r���}ӁY�C\0\0���\r�ʓ������ ����A�d�1\0�3,c�U�\n�q����e����!\0\0[�\0+O��<Y�*���M�c��\0\03G���Ctj隫\n�\\��ߕe\0��9�Rr�J�VϔeUӲ�.b\0�j/�w��\n��TM�ڮ��4�\0�e�PV���J�\0`\\��9~97�k0\0`y���taA\0x�,��e�K��p�g�;\0\0K(|��^K7򤑹�\0�%\ZY�8����\0�%5���o��_,\0�|�`\0�R���t���6N�,W0\0`�D\n�t��iei++�`��a����,\0\0E�\0˵�&5�rZV��{4zV�\0\0��j���e�պAW\0p;/�e�s�B<%��$�kT\0\0!]o�md��\n\0�u�q�U��\0@47`��t�^�Zz\0���w\0\0��\0k�V^^Pt\0af�{9�]�\0��\0k�VV]��\0�����q��?��s�\0\0�f]s�%���Qu��kw`H\0\07��,�\0,�C�nד���p��Q�S�\0�����K��\0`�M/\\����Y\0\0pm�\Z`��\0`Ք����(��v�z\0�:�)�]�JP��V��}��\0p\rǛW��+\0`ʠw\0\0���V��k��\0�S��\00��W��VVV]�2�\0�i:�7�d\0�+�d�U�B�S�p\0�E5�U�ۣdw<!ˠw\0\0.��V6���EW\0�+��d3O7�;�)�\0�.`�w��F�<�\0��V��\Z��(��vd\0�r/�:���ʤv\0`�� i������hoP�Z\0\0�<x<�o\ZY]��\0\\�N-���:,Y\0\0��EV����̭\0pS�$�Y��rBVwhI\0\0xv�x���A�\0�[Q���Y��\nw�PA\0�j�����\0K� \0D>��q� \0`����A#��I�U^gpK� \0��,\0���������«{��ֲ\0\0A)�\0X)YZ�U�����\Z&^\0�AA\0��k����Ҫ\\z\0,Y\0\0�j�m�@+\0,*Y\0\0K�T��,\0��d\0,�V��;�6���%\0��qAV�7��\0\0��ީ\'[/I�X\0�r���\0(-�����AqkI\0\0����W�����Z\0˩SK;\n�\0\0�ݫ_��,\0`��d�Y�\0\0ܮl<�t�v�c:�\0��� k{T�z�Q�\0pK\ZY��y�/$�\0VI�&�y��\'��dB�P�\0pC.2�����I-\0�rZ��5.��d���\0�\Z�i���4�W�l\0��,M��t=Oz���Q9!KA\0��m���E絿P�\0\0 ifi���M�ݣ�� ��\00y��o&��_�J\0<Sd��I�Y�\0\0W�Y/�^es�Jf`\0�>DJ�;��N������Y\0�KM��js�z�\0�L�Zک%w��,��\0^jRx5ϒ)\0���_�q�f����y?�7�\0�E�]x��k!\0��F-�?> �=*[��\0+�\Z�-��R�\0py�f��ǳ޵\0+,Ϯ�����`�\0^�H�x�{wP�X�GZ�USo�}إ�\0�ڵ�]K����g�;\0�Z��^3id7�_��\00\'Y��g�z=9\Z�~�/��\0Kzؓn7��ƍ��Z\0�~�����,���F{G�nߒ\0\0ˣ��Z�4����+�\0p��w�|�di-\0]����uk?��B\0p����F�����\0�(�n�=����H*�\0\0n��+Kﵒ{ɸ����\0X�q�`��� �\0�q����qk���\0\0U�~��~|$�\0�%eka����Z�Xn�g��<I��\0�U�Zz�]n�v��^?��\n\0pk�yypR��|G*�\0\0\",�ǭ�{�2�:8�$\0��ʳ�a;i�ˋX\0\0�di��H7ʫ�I֯{Z�8I���v3�w\'�\0�*ϒ�fy(��v��NOk!\0p-6\Z��,<I��\0�������^{�Z�+�d\0�E�8�h\'�Z�oS\0��X��k���l-<LzK\0��<+����b!�Y�\0��������\0\\�X\"�n%[����\0,���l���v9$��ݲ�А,\0�\\��*������\0\0^��>XK$�~��+ǽ\0���(�g����\n�\0\0�G5$�~���s�Y\0`<���4k����\0X:�C��$�иw\0XI��j/|�c\0���k�V-�j%��2��3�\0V�0 Kﶓ���4�P\0��׬��N�Zxp4I��{�e�\\���gr�\0��v��Mk�^o��Ov-	\0,�,-������dZ\0V�Z3]kNƽ��ʚ,\0`qeiz�UFWY��?�\n,\0�U>�͒�f��,;\nw���]�\0��<M��e.Q`\00�p�V��^^��\'���x�^�誒� \0��z��i�=�����.\\\0�T�՝���*f`\0�\"�zڬ\'���$k`U\0��M����DW-�\0\0�����<�_]������\0����UE�\0�Ŭ5ҵF�p]�\07j����\0\0�K:�d}޵$\0p-�t��l6W9����\0��Zk�k���z�w8����\0�^K�v�������\0�j��8�N�#��H�\0W��ˆA���X\0\0̉$\0��]O��V�<I�\00W�4�l���d8Lv{���r�;\0p��Vz��4����\0\0pm��<\"��d�J�\0���4Yo�UW���8�\0\0�9@�d�T�V�,�鸼�	�\0\0�A�,\0V\\9��S�\ZZ�KɓD�\0��˦s�F�nW���[o��U�a%^�\n,\0\0n�$�Ux���1��*X\0\0D:��d�4�r@�zˠ��`\0�sI���W&Yá�`a�݂kI�n%�%OR) \0\0!��d��n������nW�@hYV�r��*�\0\0X��t�YnTI�A/��\n\0Qt\Ze��f�J\\\0\0e�d�>?Hv��,\0nM��/L�kIS�r����B\0�j�����fr�O�{e�Ul\0���m�%��2���	\0X�S��YD0�|a7��Y\0�ų�+�o�\0\0�eQ�%�k�I�px<��kU\0�%W�J�\0��)N-6�i5Iw���\0\\�5������.3�\0\0Xj��t}�d�G�����_AZ�f�����+\0\0VB������[�QY��d�Ъ\0pR��nu��vR�*�B\0\0V�쨬�*��i0��P�\\muLg�I!\0\0�*�%[k��Z��{0���\ZV� K6Z�z+��͉J\0\0��z�����C\r�\0+��o�{����\n.\0\0�h��J_�4�\Z�i?_���V�F�\0\0/R^7�SC��+�z���:�[��T�f_o���X@f`\0�KO{\Z��F��?J�{�݃2�R��\0;�z9�p���U�,6�\0\0\\Xq������/����eD4ɭ�[-\0\0��N3�4ˍ� 98���@Y�����r���� \0�+iԒFgR�u�Ov�ʬ��,���1���F;�dK�,\0\0��f��u����?.��?,\'g0_������[��\0�5Ȳ�*�N���~w�X�Yz��\n�:��Y�+E�\0\0׬8�j���r{c�v��\\Tm�+�2�j��`%	�\0\0�g_�fzs�cX�eu{�in�I3�\0\0�vd�d����G����aV��,�r�U9���TWz�1X\0\0�lm+O����i��{``�BZ�r7�i�WÀSX\0\0�l�u�{V�%��O�$�i%mí8_��Z\0 �V�xK�n�����R�ņ6C`�uZ�+	�[qQ*�\0\0`�y�Fzw�]�vG{�ŭ0X��X�1k�iY^�\0\0\0M�f��n�������_Ͱ�j�@,�\Z��\n�j:�\0\0,�z^��u\r��p26k�[�Y\07��%�F��Ri���Ib\0\0,ǩc-鴋�����jl��V�!p]�y9Ӫ�0ӊk�\0\0�T56����Wg�\\�xu�ʬZņ�@n�\0\0\0V�s�S�=+�:��YU}��;�*�j��xYr7N!\0\0��V�xK����&U���z^�o��s�ƃ�,	�.�_\0��[ko����I�h�=,�\r��g���ee]U��6�I5�\n��\0\0�+N_;I��O�������h� ����D\\e�B�\0\0�k<����ܙ|�j9���������[��N�ll��*�X\0\0�%\'Ý�����L�z��4��&��AZpʬ��vZ�\Z���U,�f\0\0�j���발��,�ꏛ\r���`(Ղ9?�Z�$��ꂀ����U�!\0\0\\���D�U�j�Ye�U�\\N\ZWTϣ�z65�I6_+I�\0\0ܔ�V������fRe[�rN|��s4�H�����,��vy�l�ų�*�J�����\0\0����Z���/9Q�?x��Im�`�,�R��-j5���i���P����Rr�\0\0�x����6O�vM����d��K��Tktp8ݖv�*�V#�ժ��˯АO��yF\0\0���=Kf�3�?f\r��C�˼��=B���1}��N��L�-�B\0\0�\"���m<�|�IT���5�T���,y�@�W��&-{�Ig?r�w���B�\0\0�Uu͸Y�\Z/QGp:���~������\':�<_��*�,m���\Z�\nV�g;\0\0@`���HXA`h!\0\0\0 4��\0\0\0\0�&�\0\0\0 �<I�\0\0\0�\n,\0\0\0\0B3�\0\0\0��T`\0\0\0�\0\0\0\0�д\0\0\0�\n,\0\0\0\0BS�\0\0\0@h��\n\0\0\0��T`\0\0\0�X\0\0\0\0�&�\0\0\0 4-�\0\0\0\0��\0\0\0��T`\0\0\0�\n,\0\0\0\0B�`\0\0\0�B\0\0\0\0B�B\0\0\0@h*�\0\0\0\0M\0\0\0\0�	�\0\0\0\0M!\0\0\0\0���\0\0\0 �<IU`\0\0\0�\n,\0\0\0\0B`\0\0\0�!�\0\0\0\0��\0\0\0��T`\0\0\0�\n,\0\0\0\0B`\0\0\0Z��Z\0\0\0�K\0\0\0\0��\0\0\0@h��\n\0\0\0�ȴ\0\0\0�B\0\0\0\0BS�\0\0\0@h*�\0\0\0\0M\0\0\0\0��I�\0\0\0��T`\0\0\0�\0\0\0\0��q\0\0\0 4X\0\0\0\0��\0\0\0��T`\0\0\0�\0\0\0\0���$�B\0\0\0@\\*�\0\0\0\0�w\0\0\0\0BS�\0\0\0@h*�\0\0\0\0M\0\0\0\0�	�\0\0\0\0M!\0\0\0\0���+\0\0\0\0\"S�\0\0\0@hf`\0\0\0�\0\0\0\0�д\0\0\0�\n,\0\0\0\0BS�\0\0\0@h*�\0\0\0\0-W�\0\0\0@dZ\0\0\0M!\0\0\0\0���\0\0\0 4X\0\0\0\0�&�\0\0\0 4-�\0\0\0\0��\0\0\0���$U�\0\0\0@\\*�\0\0\0\0M�\0\0\0@h��\0\0\0�\n,\0\0\0\0BS�\0\0\0@h*�\0\0\0\0M�\0\0\0@hy�j!\0\0\0 .X\0\0\0\0�f�;\0\0\0\0���\0\0\0 4X\0\0\0\0��\0\0\0��X\0\0\0\0���\0\0\0��r�\0\0\0\0���\0\0\0 43�\0\0\0\0M�\0\0\0@hZ\0\0\0M\0\0\0\0���\0\0\0 4X\0\0\0\0��\'�\n,\0\0\0\0�R�\0\0\0@h,\0\0\0\0B3�\0\0\0��T`\0\0\0�\n,\0\0\0\0BS�\0\0\0@h,\0\0\0\0B�B\0\0\0@h��\n\0\0\0��T`\0\0\0�X\0\0\0\0�&�\0\0\0 4-�\0\0\0\0��\0\0\0��T`\0\0\0�\n,\0\0\0\0B�SX\0\0\0\0��\0\0\0�д\0\0\0�\n,\0\0\0\0BS�\0\0\0@h,\0\0\0\0B�B\0\0\0@h*�\0\0\0\0-ORX\0\0\0\0ĥ\0\0\0��X\0\0\0\0�f�;\0\0\0\0���\0\0\0 4X\0\0\0\0��\0\0\0��T`\0\0\0Z.�\0\0\0 2-�\0\0\0\0���\0\0\0��T`\0\0\0�\n,\0\0\0\0BS�\0\0\0@h,\0\0\0\0B�B\0\0\0@h��\n\0\0\0��T`\0\0\0�X\0\0\0\0�&�\0\0\0 4-�\0\0\0\0��\0\0\0��T`\0\0\0�\n,\0\0\0\0B�`\0\0\0�B\0\0\0\0B�B\0\0\0@h*�\0\0\0\0M\0\0\0\0���\0\0\0 4X\0\0\0\0�&�\0\0\0 �<I�\0\0\0�\n,\0\0\0\0B3�\0\0\0��T`\0\0\0�\0\0\0\0�д\0\0\0�\n,\0\0\0\0BS�\0\0\0@h��\n\0\0\0�ȴ\0\0\0�B\0\0\0\0BS�\0\0\0@h*�\0\0\0\0M\0\0\0\0�	�\0\0\0\0M!\0\0\0\0���+\0\0\0\0\"S�\0\0\0@hf`\0\0\0�\n,\0\0\0\0BS�\0\0\0@h,\0\0\0\0B�B\0\0\0@h*�\0\0\0\0-ORX\0\0\0\0ĥ\0\0\0��X\0\0\0\0�f�;\0\0\0\0���\0\0\0 4X\0\0\0\0��\0\0\0��X\0\0\0\0��\'�B\0\0\0\0�R�\0\0\0@h��\0\0\0�\n,\0\0\0\0B`\0\0\0�B\0\0\0\0B��W\0\0\0\0D�\0\0\0��r�\0\0\0\0��\0\0\0@hZ\0\0\0M\0\0\0\0���\0\0\0 4X\0\0\0\0�&�\0\0\0 4-�\0\0\0\0��˯\0\0\0\0�L\0\0\0\0���\0\0\0@h*�\0\0\0\0M\0\0\0\0�	�\0\0\0\0M!\0\0\0\0���\0\0\0 4X\0\0\0\0��˯\0\0\0\0�L!\0\0\0\0�i!\0\0\0 4X\0\0\0\0��\0\0\0��T`\0\0\0�\n,\0\0\0\0BS�\0\0\0@h�,\0\0\0\0\"�B\0\0\0@hZ\0\0\0M\0\0\0\0���\0\0\0 4\0\0\0\0�i!\0\0\0 4X\0\0\0\0��\'�\n,\0\0\0\0�R�\0\0\0@h,\0\0\0\0B3�\0\0\0��T`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M�\0\0\0@h,\0\0\0\0B`\0\0\0�\0\0\0\0��X\0\0\0\0�&�\0\0\0 4\0\0\0\0�	�\0\0\0\0M���gǎ\0\0\0\0�[OcGa\0\0\0�&�\0\0\0\0XX\0\0\0\0�	,\0\0\0\0�\0\0\0\0k\0\0\0�5�\0\0\0���\0\0\0`M`\0\0\0�&�\0\0\0\0XX\0\0\0\0�	,\0\0\0\0�\0\0\0\0k\0\0\0�5�\0\0\0���\0\0\0`M`\0\0\0�&�\0\0\0\0XX\0\0\0\0�	,\0\0\0\0�\0\0\0\0k\0\0\0�5�\0\0\0���\0\0\0`M`\0\0\0�&�\0\0\0\0XX\0\0\0\0�	,\0\0\0\0�\0\0\0\0k\0\0\0�5�\0\0\0���\0\0\0`M`\0\0\0�&�\0\0\0\0XX\0\0\0\0�	,\0\0\0\0�@�\0������\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0��\0\0~IDATx��[lL[�ך�3c�--1�E����H�J��!ፘ�ă�x� DH䠪\"9/\'dҺ%�	�x�jEĥB�.AP����훮�v�L3\Zc�n�_&+k�����~��}�5����3,:3```\0``````\0``````�nG���\0Vw���ޜ>ET���n�d�B*8LeKi��5�z�e�2/Y7�Q�j�j�W*�u����P��\r���ҝ9��R\'��t���~�AWHלq1��Q�����E�-��	aDd���x\"�.?Ii���V�\rH�,� #�|��^RJ\ZNV��K�TRG���Bj���fN]L	�H#����c̚d�/R,뻩CH�o|���u�z\\H��\r`V_�ڔ�S���щ�_{c�晋�b1���%Hym�	���u$p�E�sXn_Q�i�B�.y�����%lZ�Y������=����.��ܫ��E�ĵg�7��Ok���yF^�ߢ~�|�l�*=�jܨʚ���ʩ����P��,ڭ�_;{�JA�AY�Zך ��t�,ˋ��4�d?��TM�q�߰��!,�b��Er�;�mT��^��G�L�멼S}^{���E���|e9TO][-1?U�(���\\>�����^���ey�ւ*7�^�Jte��S�P{N{8d����M������.�0��D�Z��Ycz��\n*ɉ�����A�TUlU�RIn��g|gwq��W|h\\�\n	Ф��	�����M��3�8�����E8ٓӲ�y��LdeyG���:��)\rw߿\'Oxժ��x�PUs�3&ưx����=wf��NQ���4��X�!�o\'i\\�\"Zk&A���~��0a!\rX�XƳ��<���EW�������g�{��&H,��Ei���`�M�i��J�k�+\r��\r��:�	�o�e,��~3�Hk�Iq$^kz�F#��I_����[y��݌�f�i�74Iz|�ٝ?�W7�y$9)��e��9Lp���ڣ7�zk-,�����Nj_Ƙ�Pf�>\r���0��mo^����~�m�K����Z>.\'��K��}l����)�9�Gy��ګ�o+����dc�h�Rn(+&��,(ʊw����,�,(��ʂ���k��```�\0�\0+���FW��#�N\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(21,'sys','mobileSplash_medium.png','image/png',26323,'2013-12-14 18:15:36',1351,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0���\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0fuIDATx���il]�\'�����(K��$S.[�(�%��H���t��\0� �4R@��\0�d�ZP�@\'�j&e�\ZH\Zp���T��nخ���q2�4�YeYT$+\"�&���P����s�J״����M��@дt�s�s.���y�l�Sm\0\0��!�	\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\04\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0So�&\0�#�0��X���|�}��{v�:�S- \0\0p]����u���\\C��?̷��G��/��]1\0�:���M+\0|��1�߰���O��8�m;��j.�9�\0\0�â?�����	Y�fk|�\0�4��>����f9�)̿�[\Z\r@\0\0`�_/oϷܟ�j��\r������d�}��t�#0G�0�E�_��k�n}�?:�ӡC?ܷm��_�7+}Jݢ����⑃?\\!\0�A�\0\0��_�������ו�ft��������$o\\��\'�r��w>(;J\0\0\0�uy������xX\Z�[Ϳ\r����\\�o��=���S�\0\0��Eݿ���/�4_��_W��KZ\'��ݧ\n�\0\0���)�+}Vd��g��s�\0\0����Է�떓���J;�NwOrkO�q�\0\0\0�����Zu�����s�}e�����*ޫ�@\0\0`������M[�;RY���C?��:w\\�~t�F\0\0\0&\0��ӛV��u��n9��m��2x��\0\Z:h\0\0\0՚�<����}���\0#������]�}�{���\0\0L�rC��_�����/���G���߹cہ/���u�\0\0\0f^����돿ܳ{��\0Q����?I?/�ϴ.��\0\0\0�0��ZM^��@e�������y2��3\'�>1h�/�����)��]���0\'��\0��Hw�����f�<7P�s�4gw����\Zono��آe����F8{����^6��7g\r�\0\0��ឝU����s-u���g;z]t�3�<쮶�\r�+��J �Ydp߶�V�J:�_��s�\'�|����������>�3���>x��`ns\0`vx�o���U<���O�z�/��~���aqvp8s�|q,���b���3�?�\0\0�T��Oϻ��|��=+J�w��^�9*����݌�|J��F �Y��?���\'�ό.����=��\nm����5�\00�.��돿����oZ=�}��:v��OJ�vg�������{�9��ǲ�/,9�1��Nr�\0U��?զ\0f�w>(ԭٺ��o-^v����x��w����?���f� ���}+�����H���wh\0\0���~8��P��\\�e�cM��o���~QCݢ�3ǻϜ�>�����?-u�I�9;{.�/x�ǟҴp���?|y�od\0\0\0�K��\nG��)S�/��5{��y�>���ߟ�a�d}��mK��>�^iխ;oΎ?�ϊ��\Z^����3�.^�:�{_�>�PL��f���[�f��g���pn0s��?�H���8a���\'������\\Ck�^�y��_~z���l�\0\0����!������Z+XĠ�����L��B{��K��.@\0�Xi���1\n\0@\0\0����@q�3\0\0\0s��ʖ1N?�>��\0\0\0�b\0�y��w��i�aa��\0\0��\n��m+��{/�dl \0\0�����9�=����tz؊m \0\00g-(����O��:wl{���~n���\0\0\0s�MC�^��D��_E0x��|����w�\'�\0�>���ڴ\0S��T�\n���6����k��Z|�Ӱ0s߭ٺ��\0\0�/�����������^G��[����>��t��`Z��\0S\';��n�ֺ5_�-o���=�\r���m�����K3+\Z�]�#	�\r|��+\Z���������\0�\"���V��-2��0x���kO��߶,�|L���<S��ߌ�\0\0����u~â?��ˮ�_K����Զ�t�r-��3�LV�����O��彾%;]��<\0\0\0������꿔��~p�\0\0\0`.��������xb���Wn���8o�f@\0\0�#��oV�ܵO|+��/N�	\0\0�lW�f�8s�Lh�֖\r���q\0\0\0`�˷�7�Wh�X\0��\0@\0\0�����I���e�釓�u\0\0\0`��J]>�\0д��\0�g4\'\0\0��ƹm\0�\0\00�.�O���kF\0\0��a�x�$_���\0\0`n>6���R\0��kN\0\0��mp���+t�ؖ~hX�9\0\0f����=�U����_+�Xѐ՞\0\0\0�݅�[�s�>����+\Z�%\0\0��7����x��>���݃�噅��\0\0`.���w�m��)�;����I?G��\n�\0\0\0��/����������^�៤���nɚ�����M+\0L�|�����f|����-��Rϟ���5k�\0\0�9�X}���Go\\��p��k�۷�9�]��e�Ȭ�I��\0\00��ȼw�p�?38|�����my�u�v`:��\0Sma}�Λ��zO�ɜ��G�|�b�\0 \0\0\\�nX\\��d \0\0\0\0\0\0\0\0\0\0\0\0��� `\0j&;��n��|�}���ֱ5r�c�X�С�\r��������\0`�����\'|d�B���p`���v\0\0>�|�7̻����^&��9�럎�[�R�7�7�qEϊ������d\0\0\0�gQ�G�<�����(��m����}�߫{�С���O�\n\0\0\0�O�?��򯔏�8��?��w��_����0��<��_�\0�ﷷ&\0�Q%/��?U�O&��������\r_\0\0`U�Q�V�O&�����>�_<70��h��_��=Z&��ۃ��\0\0�E|ս��-����_s��,ڣ�{�y���IZ�nkwã2\0�\0\00��o��y�>6�W�[԰����~]�>5+�(�r�s���������\0@\0\0������ƛ�Wn޺���n�wj�}ߜ��]��u٦���/8m\0\0���n��Zu�_�ķ�3o�_��k乆�|��S������tw�\0\0\0s5\0|�V/�xYkˆ��\rd�;2���\'ٝi�}l��=vPG \0\0`��mh����+5�.^z�:���I����蔾~��Ǣ��׫#�\0\00�~�ִ�ό�H?��h���3v��g�\0\0\0���5\0K/�#�3s�|\Z��Z��8�hT�G,\r \0\0|��-�X�����5��q��]�#��@\0\0������U�\\O�i���̉���g27,��)����ޟ]�RZ�w�g�H�p�k�}6���pq���z�@\0\0�#��_��*`�����O�[�^��k�n}��^��Q�#�;v�p��O��n_8=噡�qP\0\0\0\0推�k����6�c����o׭�:�##$,x�G��y��F(k������Y���1\0\0S�p��������e����-�/����S���@C���?�@�3���6��VN�@\0\0��v��V/u�D���1���u��?���f�,���=;���Ɔ\0\0�9fp߶Zu�����>��󙆅�W���I�{����{4u�5a�@\0\0��.���ɿ����u����^�py�>�S߮�?	��G����+������v|$]\\r\0\0\0怡C?��U�������O��I�\rٱ����v���m������?7n����S�P���_|���W�\0�\0\00��OϽ[e�����GcW\0��x�\n\0uk��f���;��߿�~a��\0�=��9kPE�}�{�c�\0Zѐu�\0\0\0s����{g� U�c�Ň57}�2��Ra��߽{��C��#M��������������\0\0�\\���������=�}��>�\\V�߾\";�g|ny{i��\Zj��X���{G�����;��/�h����W�㓗U��\0\0\0�֥��o=5�ޏ�u�j�����ѫ��e�W�}�GY��S��-�[��u�0�zÍ�:�l���3@T�?��?��u\"�8a\0�H���6�\00m����}��C����kѲ���.^�?v�3ǻ�w���UuT�w�|yY�����\0J\"���Z��L{�5k��������DZ�a�?�� \0\0�1\0��Ɵms��|�x��WZ�wN�F�}�{�>�x�G׎W���U89�p����e�cս�eذ0s߭�x_\0��<M\00�Z�����nL���g�C|��#��ǽ����C���ݓM��_��o��r^�sǶ��|o��F��sg��@\0\0��+ݛ�k�3=���.���\\vC`�\'�!a6��=���83rƎ�wkd�������G�7��n|��U�_���=�ZZ��}��KY�@\0\0��c@����X^��f[|���{�2@l��i�/k]�����St�?\\8r�]���\0����Y��3V!2��g�;�y�ȇ��9�}e\'��Z�P����\0\0�F���b�b�~�b��K����֥�\Zې,�Dq��؅�\0\0����r\r[��O}t�2-�/^ˏ$p�?�}�p��[�PL��\0\0\0T\0v֭�}\08s��ԕ��\Z=���؆�g��F9/�D��%2z�\0\0\0Tc��O����Pۗ�ڱ���$��ԽG\'��#�	\0���\05����%43�\0\0��q��F��x�鱳�,�DV#\0\0�Q�����z�(��}�{���ˏ�0\0\0\03``�Ӄ��M�u����wO�]��e��\0\0�}.��ݑ��|����;}cf���gV.��@\0\0`�)\\�?��_��Y�}�t�s�G�޶<��^�\0\0��0����ۇ�G����w��g�GfjXX\\���O���6�\0p��>���ٖ�O|k��;s�{�3߻��ft%�n�Z�@\0\0`nd�w>(�-jh��X��ǚV�?�}@�G��u���c���n�V�\00\0\0\03����?���\0���^��k�\'2�nq��z6O\0\\Z�f�-ξ�]8�ۋ2x����x����ȶ-�x\0\0\0s����}�fO��t�,t�����K����\0\0\0s�\r��+��9I��\\��@���ſZ� ��>��@\0\0�R�Ϭh(~e2����\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\00e�i�tv����lc�|2�t����dN�7���.)��n\\U�KG��q\"\rf�J\'�\r��M�3�`�e��j�\n�q3��?�k�-�R�_�(�\Z\n}�=\"��̀V%Ϋ}��=���3�w�\0\00Mҥ٨ϮZ���|k|o\\~S}��+�v`�\\����ñ�CW�튑��Bw|�>�Ng��>��L���%K�t���Μ>�M|���2�w�j��b\03E �X8�k�ɮ<�k���oj���敍˛����jQɝ-�t�G{�<�|$Ӳ\'���.�n(����n��\r�o[}ו����VǛ/�ɳ\'_Ā��n�0#���\\On��ܺs����>ki[ۼ�����fo������ӵw����\'\0n~W����/�9�x��O?��҅�+\r���3?�;~8����\0�),�[V�߲��\Z��W�v=�{�۳=�����q:������7\Z��4�y�O?��Ȋ-#�qzh=\0\0���٥��K��������ǹ.[[�z�}��P����\r�kl�u,]�����l-��]��z��m��#����\0�~�\0���`~��ܺ)���o}��[#\0D�w����ܪ#ٖ��;��.E��2�~�2�����\r^8$�b40����ſi�\npݔbo�{�p��|���Q���_8#�#�=�����0�+N\r���\0ן����Jc�ֿ~���ӧe�./ֆ\0��\0�N��6�=�SiƵw?�~�óa�b3nY�i�?�;~�`n]l䦡W����bg1p.k��YM��{DU�A�d�4\\zr+K�0>���gI��,^��ѭ�H�C\"\0�ve���\'\0d��~�M \0\0�����4K��>��?O�y�66?�F��g������R�:	\0U�\0@\0\0�t0�n_~cft���x�����Y����7��/��1��\0\0 \0\0�I3���z�g�:����q�MŔ2A�Q_ \0\0�ʪ������gI��3_ʌ�J�.\0\0\0�����_�7eF��O]�����xٖ��\r[O�h�����d\ZP�{�2���f�/Y��O֪�?�{�Xog�����|k�ݍ�+[V��|_���o�w���ؓ���#GM\n\0\0pM���e��_��s5��ߵ������Z�U��~��m-+ۣ���tC�|�KG{�r�Bqw��tX@\0\0��d������j_��n�d����K�~>u��F�.ɜj(��+/�/̜I��e�����3KO�3u=��`Öǫކ�.6?q\"v�e��\"�\0 \0\0��ԧ��Q|߾~Kկ38p~��?*]���{E��i���GF(���iʌ��p�h��+�*rH<�g?y*2@�[Ҷ��t��`~ݽC?w|@\0\0>�+�*��4���}\'��^8?��cd���9!�\"\0D��ٽ���㇫ޞ�w?��gū�KU�\0@u�s�P�����Ѣ���K�\\I�k�[����n\Z~u��+Օ�7�nz�e�3si`@uۓ�gF�3v�`\Z�\0s�����L]����Ye��c��R��P諺���c`��΅�3s�\"d��/��{�sG�-wdvU�����38x m@q�Č�bt:�4N���0��;*:�mʌ�~YR85�w$���Ǿ\0\0��?�i���T7�O߉��_�Q����y�j�ۆ�-���и��*�4��G\08�]�섵K�Ñ\\K4E*�JV��4���i8��iހx����x���R�7�T��>�� �+��\\fq:ͮ�K��N����Y�#i��	P\n0����`\Z�?˄�\0\0sIW~�d.���埤�?5��K J�����o\\vS�Ӄ.^�4�+�-ʚ�뭣��=���Z�E*8�iy?�z��Ω+ڢ�z}�C�l@4�k��)�LX�_~�3u���R��ߊBO����E⨕�f[㸌_%_��8�KOIScE���7��y�	p$ے�\0Ut�3�L���jw\0\0(KOvR�����b����Cͫ�$��ta򍗷=��oT���˚��\Z����?����Ҷ�ye{$���ā��]�ߊ\r�=�q*\n�R�ж�������c�N�;���U�\Z5�\Zn@���沺?\"V������\\l����W6xl���sgN�:{��h��������r�\"	���$p]V�q�\\�h�b�\'L�%��!4)�F<�#8���G��=}*Z/w�v{��ɲ���ؗ��u�}4.;F?ӄ�c�%>�9~x`�\\|��	0vw�� \0\0�8�kM�-�7U��(��{g{�0��f��}�f���a��}�R�߲���7?>vt��o[�i�?\Z�P|���k�Q���?\n�͟���\r��+�\"D;�\r�G�L��E�]W~UT���\r�yb7˼����Gn�<�J��IQ��/��`~�-#�ۆ\\1�Z�-��|�8�4��Ԫ��biU�v��zN]�\Z\n}�h�P7_V�ǉ�r��+o�ݗ���	SRM���@�EK��9\0\0�G�-���n�o�������mdD�x��\'\"lܾ~KE�Z?A*கR�E�8㌣�y��\'������Qڦ�	�R\Z�}Y��|�+�O?��B�^� �w_nc�򋽾��-�\\��T��D]�ޞ�b;�xE����5���U~S��F�@8�Ū�@/.��]��{:��5+��Jq4Zl����.��(����	�Vl������������캞��5#o_u%ດ��Ө`�{{ާ��?ݸ����F��1\Z\0~x��U��L�CQ\re��NNuF�~����ӧ�_��z3��x�(�|��΂EK��l���lSK��.3X���\"�_��5�6ޯ���e+>�b<eE�g~�|Eo(�(�F�oft����o�3�����~��߽y�ﭽ?��+�.DsE�h,��t�S�;��|kE�����8LqBN�Rz�{|@\"ƌd����F�z�ܫ����)�y�t_����T�F�e�kxtbGv�{�BvA*�7��\'@�r@�7���)�ħ5v�p�<n,�kmw\0�jDe�6��>��(D*}���x�t߱(�o��K��2gck�Bj�4�9v�xndxh�HO�SW�������zT��Tj|\'ʚ(����N�:��/�,vg�D	$3zٸ�������3#i����_�{4]�����-�Wq��/j�dO1 j�8��#2]yfs\0�w���L�!���?��)m�8�)D��8Ί㹛�NW�\'ߡ���Fcn�sK9��d�`4W���ߞ��ь��]V8V��f-��l�&$�q�N��r����Ύbm4r`z��i�;]���mQ��U�uu�e��\n����4���W�VJ%Er�V����&`-������{�-J#�#f��Ѩ�����~��/}#Z8�w_~cԠs����4+T�U��{>�uz\Z->��n��ڻIG9\\:C&_������d���RM�o�zq�E���9�]�\0`�\0T��ޮb�_���޽�w�;F�ؽ��	!�_Fv�Y�/^-���Sq^��	Oj������?S�bQ���;��,�ܜ��nz��\'/���1�\\ldWnU�hLg�\\��ST�qz�j�Ʉ��]���k2�}�H\0\0`&\re��`��\0�z�yl_��iDi�{ڀqDH������V�S\n��VO��ҋ�NQMV*����\nlz�a_�Ѣ�LW�g{�|�g�:��r)8�n�L&͵�03�0��Ɂ)��?P�h�\0\0T�ԍ����3���ת+|�J�$���4�JQ������w\r��h�Go�D�U�pҕ���J����C��i�ʯ�g��-i���T���P*�7ly|��Rp��y2 ��������)e���@�u~���4�0���5UW����̴�H�����o�x`ϫ-mk�HJ�1҄�ipB���	zC���lӱK�R���┩�1�f[o)T?�i��Ҋc�?+m�sDF��*_\\�!Zf�+�����}q�b�cf�BQ��V��dܾ~�lؤ�~��\"oG)����6��7�>f[�b>=`�ݏ���\\WnU$��,g\0@5Ng������f���4/\\:�������̭�p�x���:<j�	gO�ѣ�\Z8_����ｳ=1U�E\Z�Q���RV�ad������?�V��qV�u�w?�w�7Z�k�͘��Cvi��)��|��Ze�8�[�^(s]�4�hft��*��D���]�kt����:ٍ˚��u�M�mU��*>;�������a\0�i5���:\0��e��6�n�H��l��lS�:�;MlRԔM��r�.G<��F���+�Q#Fo\ZUcu��`n�dTn�������K��F����̗f��ϕb����eZ)l���Q[gFo�l�2��?�۳�?rV4.o�́D��\0�F���8�J9�J#L�^�݌�8t��ҙӗ���#������Җǫد����d\0\0�ivi�j���͌.�;����-���d���\'�2-0\\��\Z�ݔz�s������+Y� �vm�ꔦck\Z���dVx��������Zvl-��9N���U�]�gm���/o+.y;��l�	P���w�p�HQ\"_Y:�hMW�:�cO��y�H��h����w��h�����۟�Q�FSD�t�&}ң���7��d�)�枮��b�N-�7v$^���\0�H��_]x�FD\Z[=\r�HW1�ƺ#���7��/��M՗��\\1�3~-��ͪ{�GS�}�k\r�H׀��۽�U��v��b��4]c�\r7�cRs�F�\n����&N����?_���p�~K�x�}�����S����s�T��9v�Ȯ�?��K?G��*�i�Bf��?��3[+����R\0��S���qys�N�af�\0�Ē©4�k���@��5V<�ұi��Lqv�\n� ��1��8Mccҍ��{�GY��(�ص���d��tfiq.���拑6�U�ͳ�H���]e�&2��g{iU�h����h�ˎQ��ӈ�q�T}�<S�A����W�s�����i;U�\r�ذT��?t>�DHx}�C���7^ޖ��Vp3\r(�^�koU\\��p�R���\"�:Q����p��Bf.M�S���t����?�-����^����I���]��R̸w��z6j�[F�GE[��m�ݍï<2������e��O��pM��&�t�Ru��Fʶ��p���}S��Zl����\\W&�h�;�w���F����U�hq֥:;����+�/���ѱ��e}��3����~T�C�\0 \0\0́\05Y��%��R,u橨�L�7W�\0sO����j���tvi*����p��g&~��>\n��okD�I ��E�Wi9[�8=��F�Vq{����^�A���J\'ۧ����RP�[�%��o�$�.�Qi��H�v�x����X��uq\0��\"])��9@�(d.�m\\i\0��U������*��ޞ�i;ǩ����4ش�x�埤�?깴�r9��;����t}:�F5SJ��V�Į���T4�!�`��\"BTzἔUj��X鴉���H��q��t[����m�H��q\0�9)M�_���ҵ�r��/h��ߓ��P�8[�*��EU���rHc#]������]�rvfE���p���8�)��*1�F��Esz�\n�gq\\��ע�2�F��y}�C�����\0�H�ɬ�\0@5f���lL���~�װSG�#���L}�͞�fTTq�+�iHlE�S-���3�t��������J�&������D���*����;�cg��z\n�h��܈v��9)���&�c`�\\E�v��Z7A�H��9��<��N��\0o�t�iu�/��Oig�F\\O����~fmɛ)V]�MI~]j)tɴ�tv�9}��f�j{����PN��.�W2mN�f���l*g7\r�������vo��l��)Q�Q\r3X�{&�����=�fF�aO&�Ď�9�D�˕�AJkQ�s�u=�m�n�/N������)w.�8b@|5��\nݑǟ�?e�=���/4F����]�\"�Ý��;�w���+w\0`�B���UW,�xj\Z�N�\\�m_�b/���<e�T��L��&\Z���pY��{��j�IvȎ�/\r�\r.�v�T�����٥�I���dGdj>0�m�m��L�}ϊ\'�hh��6^�\n}j�t��\"��o����Yq���һ̭�>�/�}�����ϭ���Ô��P)㕾Ja/��������R�<�]�kE��7�l��D�}.�x�Z�h���������L4�7-�ZE-[J��eS��v8�k�pb�⬑iơ��\\3�=\"�\'?�5u�-���hPx�@Gu~�[(�����8\\�*\r�&��l�d�{�蝱�Kqp�d�!6J�F�.ɜ��c7 M���\\S��6vO���\0��D�r0�.j�(�˿Hu[����G����ט.�7.����3-Q������˺UX���^x��|,�w��^\\jp���#�cw�c�/�84����g;uq��BOM6#\Z�d���4XfkEO�)�1����^5Z4��@����rzd�sz�WD�t*���	��y#v��Z�N��2�~��\0\0\\\'~gt��oqT-�Ov��]�҉��!;�b���i�ῙK��W����h-�T�a�;��@����E�K-90p.j�R��*f��tϤ�����2�w\0j����2��T߸�9\Z�t��g��}�f��~x�}��JVߕ�f)���M��u�)����Ȏ?`\0\0��:��+-�G�����YQ�Ͷf�R%�$s*M�S�%�\0�uj%�X\n\0iZ�kur���b����L&(�ӾWzc�bn�\0Qzɵ�ٕ�\Z+-\'<��\\JM�-����z��\'Lq�L]��ފ��VQ���`n]��o����\'�^æ��#����ueWu�V�~����\Z \0\0Ӫt}�l��d(S?�����.ݗߘ:r���{���綑w+�s��)GSQǉ�ۢ\r��y?��Zӌ���S���RX�qLC����y��8�鑥{�vOEfõ���ٺ�+LM�a��]�6\Z$N㳧+{�].;�/�f��]��4�x���ׇ.�RBq|{\Z��2�+>;)	���`~]�Hw�D@\0\0��@ٳ���<&�8\r��ܓ�/���KC9��H���Z����I�ȁ(\\z��nx��b�m�]{�|�H��̮���Gr�drKe��_**�	��s�bo�EK\Z+��t1{���x�;�gi?�R,�t���h$�m�8Q����{&�wK�xS+N�8=�X�\"ј�u��-�����^(~T�+>V�\r��n\0\0�KӏD�R�<��u���b/��lylv���ߴa��W�}���VǛ/EH�(;N���ν�L���5V4����+K�4Ih4Z�M������_]w��V�\"I��w\0RY<p�|uO�F���)��򶳧���>��I���l���tC�+�*>�1�\Z;�Z��Y-]W�n)��e͙\Z�L����\'�:�5\n�G���������I\\Y��\Z%\"D��*��5�vQ�\\��)\0�������8FSW0�պ;��GZFcf��7�#K�#��x����\'��~�����W�l�ݏ��w���c��\00 S�RA�i�����\n]�U粋����ٯ��E\'�*�A)T�i���5�r�5z� M�3Vlmj���`��2��B9���z:;���Y�Jm5�~�ß�ʟ��lOa��y�\0 \0\03㆑��Ҵ�I3�Vte�&�nx?�:~X���	{���i��T�_Y��cI�T��zᗩy�{�`���J\\�EPvw󞮎tgff\'��z`����.���m?��T��OF|#�o��x�p �\0\0̌R?抮s\'M��TTXO^W~UT�u��y5�8*����f�/��Sv�(��5δ�WI�ߊ�_�?z����P��v��ӃϦT���?����{{�O[����oy�����W\0\0��2)��2s]�����bw��dW�b���yR��J{+E���Jx���?+��ɭ,U6<��[Vo*�EΜ>��Y�4���\'�ԗ��O�����<���ٽ�������*��U��>�d�HV�7\0�\ZHE@O��*���vO��R1]�b�UKJ+�-]Z�+M���4��q�M�O�3\r��tgJ�qE��U~�����(��ϭNq�j�5�`�-��o�?2����-�Ȝo��mz�@㲛R_���L�-D`\Z�f�(1�r����b=��w����`�.*��骞���o�z岊�2�?\Z�x=�����;��D�D�t4�ڒ�,��K�+\n=s��Z�8������ث}���-�VCU��]W_\\8l��w�K��h1�������,.��mM�5�@\n�=�Y�3��mMR|\"zFޗ�hbP\0�iuC�hqP`�.�%^\\�\"A�b�`n�4�s��)\0��ݗf��QZ*���o�?���h���΍,���tg`�si�o\Z�P�q��:��YQ�V�R�Uۓ�/����݆4�R1S�.�v���gjU�W�8v����:�U\Zk�N�Tu��J����:4\\\\. ���\\��;~8�R�tg�M���w��3[������\0 \0\0�*��j�=۫X%���M��Tg�_�6�\"����rWm#N�z:;ʿNQ!��V,�F�Ė����Li�o��pu|ѥ=���e5���`m�r���q��������������o�+yV�ʩ�]���OT*]�xpt�2\0���qN6��eV��\\���)	d����<��m��S�*�x[`e{s[�$oĥA��ٕM\0\0`\Z�?�Q�U�(��Q��*�)�q�#��(DR�R�:��Y�*���ܙH8���U�[����6�VM��-e\'���V����+Vl���3Wt��+�4�[�*�`~]�����֫������Ϳx��\"*lz~F������t�|�K$�Z�������\\�����\'v���rǎ�H��`n]��Mï^u/�eo>��IlaJ�)���\\���PV4\"�2�\"�/�����p�0������l����뻣k|N݄���B��6E�rY���4:ρ=����4Ei���q��>�;:/{]f��\0�����un��6S\r�ZT���9X��n*MS�w����T�FJM�1�\')ͣ���W�lG���NQ|pv�H��ӿ��G�{\Zo�}�g�o��0�û���#����m�@z�h�4��/o�nA�iʯb\0�i���nꏺ�6_��#�xUs��=�����3[+}ni����Y5`��p��逢�-�KI���)����3UiJ�J�T�G^�\n,E��/�Y1~+�w���fB����x���)[���6\ron�,\0��8��\0�s�W�M�q��?{t�7|���w?��ϥu���P\n�zv���{#����Fuˊ�>&)\0�4HSF=Qќ�c��T���o����Rue}�{G{ԤN��m��K�V�*���YN�c3�MJ�8*-gKY�+�j��`~]�؜`�P�VɌLZʄ�V�iN�Ҩ��(-lW�0�:N�k��OM:��ٌZ���N��?e���}��5�┋$���]?�3�������HS�\0\0̌(�S�y`ϫ���}�g���&��n���j��w?RE�̥%&9@9=�T���2�8��؝F��W��d�Z�-�m�v���6��Kӡ����񬥇��,���>�H)�|�%�Sg�ɜ��V���n�]����R�?�}�x�͟�j����Oǧ�M-�����:\0�3چL�&@(]M�J����&yM7����=T�I�����HJ�$&\0JEyǛ/���(m�5�����+�tUoj�k���-�_�7Uz���udǑ���i�Z��Fk��8�S�]��bQ�;!� ��.\\k��ذ��N��)��$��R�_��a�\0`ƌ�	P�x����n�F��}$ײc��6�����%\n���>����Ut�OR�E��\'J�$�R,�I4E���꿊�%M��D�x�芝z�D�Ww8�r��t�6�\'~\Z�\Z����S�KU��ܺ����t�a�����؄kE�-ʹgizX|�N���Hz\0�%m���=����U�\"Q�K��NQ���QU�a���x�/�}!]�o\\~ӣ_�Fu=RI���m#�N�qJ�$z:˽Z[^���������R/��+�eS9�RV�|�U��������KW�˜̾�J�V�\0�d���K��9�?R��V��Cq���U<�O��*�OuU�h.w_F��Jٻ��=��[���p�r�����X3����ťy�:��K.��m�M_��h�#\n.kʞ��L�bG�T%����8�Y|:�4�,I���w?\\u�\n���������?�hŴ�/�FLv�B��H���e��ƕ������b�\n�~xg9+\'�̖�p�֬���xfܑ������Gr-in�Jg���\'�����O�m�wo�8j��R��4Ww�jձ�y捗�ņ���G��W��J�-i� �M?T�L \0\055�lOo���(���O�\n��;��t9�W.���NT�0:��?�B6���`M.�_,�G�Ӫ�\'*銗�\n}�\\X��lY��**�8dQ�E������&���E�\'I�����_�\"1N8�u\ZW�*����K>qk��y)̭�ɮ���Z]Ί���VG���T]�_f�-Np���7NlO߉Ñ�ccS7\r�Z~ǹt���Ҙ����\0\0�6��<����������_��KEy�f���h��?�w�w`�������,�\\ZY��敵��{�:R��ۆ߭��ΣR��6F�^�\0P\Z�[��W���\'_�`�S�\\V6.o޽����&>�oړ�|�s��cGx�yf���5�\"%�\Z^ɮ�цߍ�5���_i�K�9�Y��7�W�X�xK2�\\���F�:/eF���ӱ-Mϟ�[��ٰ������#�����B��m�&���8����+Tt� -f\\�U�\0��s;`W����v�xn���,��ܩ�OQE��y��dF��֤�+^0���>�5\Z�Z\Z��:�OR���VGJ�F�´�W]���q��۳�gt~̱��><���׶��Tu�;z%;j����?�_�w?|��M���/����#�˗\n�Z�84��-՝<}\'Gu����m���!+��ޮ��G�����7E;^(�o��h�H2ḯR��([ߏd[R��C�����]|T�=�k�e\0��i\Z�n��ʭz���Z����;^�QT`Q�l\Zz���Я�ź�x�}����f\n\0�擟�(�cx����;~8���O͌^�O�}�:��EgK������Ց�����p��1��d�)�ި}7��U�B���2[G�t�]�����4!O�d�J�6J����D����DMcx\"i�����I&7��R�]�4�Q|T�5� \0\0�[\r�:�Y<zM����\\�\0۟�Q�U�q�Z����6Pu]uUQ[�\rNӌ��\r���j��Q�5�l�d�YJ��i��4�d�gT�q����xoϤ�T��h��-�*�w�sn�2�?΁!Q�W����/^�_{�#=�{#����Mo}�6./^ ���s �eT��t�\0\0T/�sهF;�̍ۙ.*�9�MuJu�d&J*Ic&?��2�\r�{2������ѭߨ������Jwi��mf�D��F�ɭܽ��4|e�l[��N�m#�ynG��=*�Ύ�ZV����Qi�ؼ:x�\\*�\'�G�N�9P��`n�\0��?p����Q[wU>�����|q����A�QW�\n��I7HlvZ���A�ʬi�b���4���+�38��U�~�t�Ϟ���N!<N�rf\Z�0���΁t�e�Rׯ�W�c��Oŝ:@\0\0j�vOb��)�������O�[���\'Uu�MAk2��ʠ�.^<����Y�.�i���NY��t��cO�_<�fC�-U��U�O*=��8WӋ�}\'O�0}`6��ſi�\n0�s��M#��Bv���ғG>8��yc���Β�;�{���Ϟ�?�b=��C��h��\\\r}��Ο�m4�M��1�9?s����s7�={��;���,Z2�9�_?8Pё:�k:�mJ��T���:�\\]�9S���N�h�8�{�:�/[�əj���{v��N�H&U\\,�\'��ڋ�;>&-+�g��Q�\0�?\r���w,\0�,�\0�y��Ź�Ξ>�u������J垝�������Pw�r:\'Ls Fk�~g��E�J+:�9�zT�S����7��_s�>���D\0h\\�<�rZ����\'�����H�o\'F$��BguCA�f�H,�9q8�S>?o�O�W��|\'3:�Ԧ�W��*��R��}{\Z���?L�䙴(8 \0\0�W���h�5Jɨ���v��fdc����DZF4����_N�b�Q���[UZ�@u%���/DA��pf�ȿL�F��p<{Ӆ�\\oWG��7����É&���{�s)�m�����`�������\r�7��3�O���m#\"�Tzo9����}�~ݱs�Ҧ27�V�w�oڋ�L��R^�\0�*5,��})�������iտſ@\0\0憨z?9����x+`���Q�x����N����w��YZ�t��;F#��6D�[�t1�^�o����m,��ꭍ�:�[_Qvxkdx8J�)�����_���ߟ<�A)�U��Q��v>��e���=;����CQ7�9*��x���;�p�ǖG��ޞ�T�^�}9?00=�r�g�����\\�/��ϫf�����M+���d��`~]|O�۸����o�n����(#�{g{i�mqF���C��Fx}�C��|��*-�J#;����h�uO����/��yW�]���U`߉�q�Қ�),�6�nՅl��7ly|�������2��T4a�8�e�*��H�Ⲿ76ߺ��k>���D��JS��f�횟�/q�>�S�/��lO�ގ7_*}fkxP\0\0�1�X��lO�Nr�(�$��������]f��/y��QL����J��ٶ���������2�]�U��K�1 �H�m�LQ|�vvD�_Z4*J���ۆL��-�ϕ[?�����Se��:�\r���C���l�U~S��m�h���խ�uY�E��;fF�\nG�J����b_�I#�v_Ju���̎�	��cwfᬯ�\0\0T�tviWnUql���23zu�qYsS󭋖4�^�e��2���Si}ܨ��γ�dT�QPΒ2\"�_��B���s_�hE�ة��_���|���M1�\'��T�B0�@��W��_8a9h`��o�����Do��ˌN@�6r �WM�a�־>�T|G�l���˶-���͗Ҭ�S�������čM*�<OgxZ^7�ml����{�N����\'w��Ƕ����=.�̦�~ٚ�qę��?\0��)�#ٖ�\'�֔c�Tp��_VA����F�Wzʙ6~:���Q���W���\'����{�l���C�Β�vY~����BV�T���j^�E�/�Éf_t�~ET����P��8��TG�8��ϭ�v��a���*c��n�X���bM��I���Kf�E�9\"���w�|�\0\0|,D%1�tvi�1�_��GTBQ�y�f�èGY��صr:�_���?D�Y3���Z���C�)�RG�r�1���)~��6���ܺ�n^��m#�N�B�5Zj�k�WUj�ih��>��Onu��%�S7����Z�,1O�����޽�ȕ�u\0�S��=6�x�̠�\0C�D`Dl@B��eɇ�k��\0�D� ,�P�C�\'�!��ե��s�n�=m��]�]u��O%��m���uy��}�����Y^�=/Ū6���~Ma�W�٨�k�-��Q^�Ws�W��?�:n�T}����?�y9x6�w^,m�\n��������[U����Z��m��}9<<�8/Bol]���o+����N����N�Y@\0\0nԼR����G����b&5�����ѣ�߭��o�(���:M������UV�q^����@�������~�+�����U��)ɰz��@\0\0��Ih���P���꾙���UM�\0\0\0�!������~���g�}*�	\0\0\0V���G�G���~���?�}��$\0ueXO�����>2���t��$�\ZTף���_��s���_�u�\0\0�y����kl���~^�������U�ߟ:��\0\0pKg|��[g���s=�v�9��|���?�����-O���u�\0@\0\0��I�^U���׿���n�syy��v��p�}�\0\0�v� �ZU�����R�����v��������W�����Z�_���\'N� \0\0ܲ�f�w�ywy�?��h������_�>v�\0\0���ڽ�~��|����A+�y�]G\0\0��=���g�����7;t@\0\0\0n�xt����;���P^���Ӈ5\0\0�m�3-:���O������{��W&��h \0\0�v\0�=��r���]��h���g��o��M3�m\0������u���\n�\'�{�O��h��>~�/���\'�W��O�;��?_�����Ը���\Z��x�q�A�U�ǿ�>��V�{կ��g?��g��_��&�sŇ���� M�ٟ��(\0���\Z��(��엻［{�K[{;��.�@��۽�n�ټ�?*����ӧ?����x88*>���\0\0`�Ǎf_y��7��}���0�,����\0\0\0�6>��?��ql��_�;[a�5����ߞ=�3{��w�\0 �\0�K^�ߙ<y�\'��,��3�C��@\0\0��B6ʃ��\0\0��:\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0� M���x$��6\ra4u0\0\0\0V�:?��>�x���%:���Lga��gy�����@�\0\0\0�-�ۧ�`��+����Wy��(��������d:�%\0\0���ͪ96���}�C���9�F7{e`���h6�S./<	�\0\0��_˚>fqލ��_���v_��U	�\\F��\0�\0�u����*�[��G�召ZB(�^���V	�00;H���t�\0\0/�����:�����\r�	���@C\0 \0�\\^�7�1��~W�������`0��\r�D�\0\0`myyj�*���	�p�,X+\0\0�����U��wv����2��*�Z(\0\0�W����jŪ��!a���X�珳j�x4�MD\0@\0X��\'S���b$8[%8�V��A\0�+��v��F��&~V�Y��U�je`2�\r&�\0@\0�����(6��>uH���q�|�����b�xtzyc\0@\0HN�#g��Sv�8���~n��,h\0@����\0 \0(�!�<`~\0\0�5S����p�<P���#����U�4�\0�z�n���d�A^X�sj�Cc��<T�B�E�\0�vTE�a�~X�n��Y��\0\0\07���]\n�FQ���<[�a ��+�\0\0��ž�~X1Y���|r��2F\0��i�5Ru\nUa��\r�\r\0�\0pɺ�h�1�k��,��X\0\0@������\0�\0u?��f@ /���~H�����ɼG�֢\0P�\0Ќe�o�8�߈�ӭE���a�,pb`\0\0�7\0d���\r�xo~��,�@50p�G\0�+\0�˺�u�������M,\0�����g���X��Gh�U��0\0\0�D\0(Z}��x��_�b�>!�,\0\0�\0��n�e\0��\0��?p˯y����|n��U�\0���7�aÆ�����|Y�n����p��\0\0��͊S��6�VX;�վ�\Z�\0\0�O��~���\Z��N/,�A\0�u�K�l5u�\0k��UƎ&F\0\0.~�,�³eo�^^\Z��(\0@1�����\\5*�ג\0H8\0(����� O\'���0\0)\0�?@7��vؙ�����Ă\0\05\r\0J�_�N3�4���X��\0\0�	\0J�ר6:��~>�k\0k\0��\0�}Y��n;�Wȓ�� \0�,\0d�X��n:R\0Wpv%��\0�M\0��?�۫��fń��Aa\0V6\0l6��W�X�,��fqV�h2��\0\0�J\0�fE���\Z�ū�+|b�P\0V!\0d1������ӝC-\0p���i\0�.ߊ��ܤ��N�\n�rm6�^�9߱N��mq)1\0��\\�O3��q�`%�]Jl��9Ԃ\0\0����V�c�+m?\0+�Y���o�ٱ	\0�N��s��w�/�~�޴e\0���=~\0��f� \0��Ŷ\0`\r��\0\0���,����\0\0�V�/O�Ya\08��x�\r;|��0�\Z�7c��fŬ��؂\0\0�Z������\0���W��f�n�Ѵ�<���\0����q��۴\0\0P�,v�E�T^Tx�jb\0��6����7��P#���f7[��Ğ�����z����V�n]�i��f�w�!�Mfc���P����C\\�-�\n\0@�U��\'Ӳ5h\\�`�e�(���<�o\0 �,lgq�U�\n�1�Hk���7��?��I|C�\0)�d�^\'L;y(6h\rX��5��x�/� 9Y��rVx\Z�$�5`�ŽN1�-�t���fv�q���Ĵ��n#��v���~+\0\0�n3v��e�֠��������b��\0\0��Ӝk\r\Zk\r�M���\'[���f�V\0\0xQ��\Zq���ٳQ8k\r�9�f��\r�ƒ��\0\0^�ӈ�z!��fG\'E\0`y�Yq���ܿ�\0\0o�Չ[�b O��0�(�Be1�t��Rz~�\0\0��O��S�5�1�А\0�\"l����fv3�\0\0�յ�n/����hlH\0��z͢���hM����ю�p/����pdH\0��ex�o�p�\Z\0��\0���v�j�	�А\0��K�;�eO��6\0H\0\0,J1$Ѝ;�b6`8{64$\0p�E2�v�����}}\0\0����da��zŕ��y0$\0(�o��?\0V\0\0X�N3v�ᝍpX\r	�$ ��?[��\0\0nD5.�;,��$\0P{[�x�c�{^:\0X\0\0�&m��f9.�\'���$\0���*���@\0��e1lu�V�H���A\'�\nP���n��f�\0\0�V�,w{ś��4%`}_͊�������u+\0\0��;R#���n?�L�ˊ�$`}J��Z��g\0\0V-	Tk��lX$��ˊ+��(\Z�7:�R���h\0��|gm���xw#Of��p(	\0���,��ow���n\0�ux����$\0ܺ^�81�k��w \0\0 	\0\\�v/���lݿC�\0�ch�{�po�>͞���Ո۽��_�F��\0\0X�$Мw�\'�p(	\0��k��nȫ�z1@-���-�mI�JcG��,�����V-�?+\0\0�K����;w��G��a88*�%_@��F��զ��U�\n\0\0�|#o淸���\Z�y8\Z��h�w���N�{�\0@�eY��^u��$p0���L��)�,�oZ\0\0 %�ݸY^���H�����(�y^ 5��(6H�!`\0��m��N��S\rf??24I�w����nhd�+\0\0��\Z�(NN�a`T\0��L�{�Eݟ?�g\0JY#�lĝ����`v4�\Z�`��f9�[�\r=�\0\0�U����rY`�����,l���Շ��\0\0x�V3�mŽ��)�h8Oc����{Ez��9�\0\0�%\n��^����ǖ@ݿ��\0\0\\I�Ul\"tg3LgE�?�,\0���,�~���	\0\0\0\\O�/����o����E�S��o�d�~\0\0\0��ٴ@���#�ð ��o���gQ�\n\0\0,T���bؙ�WI`0r`�ʹ�߉[}u��\0\0��G����n�x�l�B��`,\'\0D+\0\0�|�F���2s�<��\Z��0\0�:�ߍ���/\Z~Xn\0\0\0n:d��<	�y\0,��]�\0\0$B5@<��pd7!j���v��~G��@\0��j�����`�ǀy�)��F�y��-z����F\0\0\0VR�]LC�l�Yf�2���_�w����+\0�Z������dZ,�y����n=��Za�l�W�A\0\0\0�N#;����rC��h<�2?���h7dY�v�g��v�\\�\0`\0\0�_��ߞ��O&U��N�;y0�5ĕk��1��y���V�Q�G\0\0\0j��x9�r�x:\r����Y���`h�����0�v�\n��i]\0\0�E�ʍ�^j\0����lPă**<Orº¼��w�*��僁� \0H[�5o������8�#A���0:9�\r���4Kp#Ѯ3?a�j�꿲}:��*s.����\0��^�{eMq>��6T��x��R�Y����y}ߎ������Fϡ�Z@\0\0�j���ϼ�\n)V�|p<��Cϯ������j��/�ۉv��|�e�Ln2\0\0\0��+�+�&\\&\0x�\0\0�\0\0\0\0�0\0��\0 �\0 \0\0@2�\0\0	�\0\0\0\0\0\0P�\0��\0���\0\0\0\0\0\0P?v\0��X\0\0��@\0\0\0 Z�\0\0 !Z�\0\0@\0\0\0\0�H\0\0$�0\0\0$�\n\0\0\0$�\0\0\0\0\0\0@i\0��\0��� \0\0H\'\0(�\0 �\0`\0\0\0\0\0\0���\0\0	�\0\0$�\n\0\0\0$�\0\0\0\0\0\0@i\0��\0��� \0\0H� \0\0H�\0\0\0\0\0\0�z\0�?\0\0$\0$\0\0\0\0\0\0���\0\0$�\n\0\0\0$\0��\0\0�P\0�\0\0\0@\0\0\0\0��0\0\0$�\n\0\0\0$\0�\0\0\0\0��\0\0	�\0\0\0\0\0PGZ�\0\0 !��\0 !V\0\0\0 !f\0\0\0@\0\0\0\0�H\0\0$�\n\0\0\0$\0�\0\0��\0\0	�\0\0\0\0\0PGZ�\0\0 !��\0 !V\0\0\0 !f\0\0\0@\0\0\0\0�H\0\0$�0\0\0$\0�\0\0@2�\0\0@B�\0\0\0@B�\0\0\0@B��0\0\0�\0�\0\0�\0\0\0\0Ԑ\0\0\0H�\0\0\0H*\0��\0 �\0 \0\0�\0\0\0\0ԏ!`\0\0H�\0\0\0\0\0\0�z\0�?\0\0$\0$\0\0\0H�!`\0\0H�\0\0\0\0\0\0�z\0�?\0\0$\0$\0\0\0\0\0\0���\0\0$�\n\0\0\0$\0�\0\0\0\0��\0\0	�\0\0	�\0\0\0	�\0\0\0I\0C�\0\0�-@\0\0�-@\0\0 \0\0\0\0u�\0\0b\0\0�\n\0Z�\0\0 Z�\0\0 !V\0\0\0 !V\0\0\0 !V\0\0\0 �\0` \0\0H� \0\0H� \0\0\0\0\0�:�\0\0	1\0\0I\0-@\0\0�-@\0\0�+\0\0\0 \0\0\0\0�\0�\0\0H(\0H\0\0\0�C�\0\0��f�\0\0\0�\0-@\0\0�R\0P�\0@B@\0\0\0\0\0\0��\0\0@B�\0\0\0@R \n\0\0\0�\n-@\0\0�-@\0\0�+\0\0\0�+\0\0\0 \0\0\0\0�\0�\0\0H(\0H\0\0\0 \0\0\0\0�c \0\0H�\0\0\0H*\0D\0\0\0R�\0\0�\0\0b\0\0\0b\0\0\0�\n\0��\0 Z�\0\0 !Z�\0\0 !V\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0��\0���W%�\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0��\0\0IDATx��mLSW���m�]2�K	o��q�3�E6p/�e���#���m~�LX��%.�⨖�|Y|�J��h&��f/���ġЩ�(o}�;����nY��yB���{Ͻ�?��s�s.�QgD`��\0,��\0�X�\0`,��\0�\0`,��\0 \0X\0`,��\0�X\0`,�E��0����t�^��Tlh+��\rK���i�oo�G���1kvK\'_�8�\n�^�����]#��1����R�(�k]�䩟 %�H5ϩåt�ژ{�(������{����\r;T���H�BY$C��5P:Dʫ|�t���9��!�O[oRX\'�Q$)�\n7m���	��m�!-����O���d�;��N�z��ys�1S��*�XF���/�{	�d�ؘ�=�)K��I���g.�\nL]��c2FT\Zl�\0,��9KZRN�F}��#۞�����#.��_Y\"����C�e78����c�óV�e]b7mB���#����^�V�r:�X\0�������E�w���O�\\a6��ı_٪V�Z�W�d�.2�j�֛�xϒƍ½�6l;G����UYO������?��P��z��.��n�Fj��/���/3��Hjк�==Y^c��E�����5\r�n��R� x�v���d?������p�a��b�������u���5�PHډۚ�h�4����Zm�s�ڢ���O�?��*Ma���S¡6���\n�Т�|�ء��cf�)��	�N��dg����lNDV���_yc�U�H���j�:a��������=ğOxM���e5\rN�:�����_н.����f�߱� s�Ⱦt���-=k�B�>�*���2��60_����[��=[�i^O\n��`�I�h^���VO�K�k�%Gy�_�K�Df?\\l*�2,���0��2,{�\\�P��.7���ӡ�eD*6�����z�$^��8,wn�x�a!\r�`\0`ѓ��՘�\0.)����O�0��T�b�aPփc�<k*�`i�P�p�X��7,��������O���n9��KL�Ը`��BklIͬ5Z���HA�Ki�-,����h�O˜8�ja���\r>N���3��$Jr�BIs��y)Aj]�X�Z\n�Er0\\�8H����k�(�(w����]Y3|�%Y����w���$���J�\"���Ņ9�k��	�Dc���e�%��C���DY*G�u*�3��(��\Z�\".J�\n(D������@Y�,Y&xP(r(��	�ʂ�[��u\0X\0`,��\0����	عkT�ڀ\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(22,'sys','mobileSplash_small.png','image/png',14855,'2013-12-14 18:15:36',1473,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0��^t\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\09�IDATx���pS���s�˒��\r��	6%l @��ڐ�$ۤ�;-��N&wg:���W�?��������߶37�_w�s��������Mi7�$$M��+@�!�ql,�6	��dI�{�al��H����\Z���c���|>����<�z�N\0\03�F\0\0@\0\0@\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\00\0\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\00\0\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\00\0\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\00\0\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\00\0\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �\0\0\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �\0\0\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0K4�0�%^熃�Y�o�#�>?��ݿ���u�0߹�|ߵ��t�*��G���89�}\0@��{Sx�oI���40q\r�3�U�v�n��6���ɔ��1�[_�m�9�k��,�K�R�:�<��@N��b��=�++���\r�5ߠl��/���GV��\00�qj��|:~�d���K_��|�J�%�K���\r�8�\r�\0�o�w~=a����zkM�;~��O�*��0 �(�o�i���]��7�$���D���P��`\0��\\e�̳�`�@����	�G�\r�npC0@\0Hq�倧Ѥ~�����[?���.� �����o�ї���D�?z������{o���hr�\0����w�6�u��Oc��Y���G?Y������fG���u��`�n��ӮU����?�r�3eU��G�D���Y��Zc�N�0�T\0N$GBY;�%Dn��/��h^����v�Х�s]��\0�>5ݕkg�y\"����ܝ�=.m�C�����j��He\00��FN�/�y6̴AG���#��זZ�C��wY.㭤W�me��	\0,�~�Uo�~���b��K����q�Jon�j=zK����p?���=��/f���\'�]\r�|[��n���xcC�`�	�}ըf���\Z�i/|��~�ד�����~��O�\0�А������6j+�\r5z1�d׏2]~���7�����\"*�%�CCI�K+u�+�E�y��o>ʹ�������˛��%������+���f\"���Pb�$`&�i\0��F-�\0P`��G2}K-��5`�\0Px���z���`���$}�;\Z ��/����oޘ�~���G?9��UW�,��\r,R�!��W嵻V7��n����E��\0��o��v��jCr$�b_I�����I_���{�_ꪴGV��\0�[��Fρ�M9�����x��5wBn(�\rŌ/�݌�``>s�y����2-5}�?_~X���KS��4�&\0\n�G�5I_�,���o��,g��\0P0������R������_����i0�\0P��3Q�砤og\r�\0����mqK)��s��$��\0fTu���K ���~\Z ���y6b��	3A ��)92Yhh����f^m�\0\na��/�����{K���d��\0P�>����os�7\"�]�櫤��E�A\0�rH>��{s�����y#�r�i�[Ͳ���\\�@���J�����X��X*��t�?����\\�s �˭��u+9���\ZC�<Nm�R���g�\0&�\0�y�\0�\0\0`q`4��N����5��}��#��#�x��h��D���f׀���F��F�@�:��NH���_{��dߛ&�%Ʈ\Z����.0���s�|]E�̋��������������\'�����Y��\Z\0�տ����4Y\'X2O�N5wG�ȳK�Zܘf�����3I_���v���X�8��Z9��A�yX���00_�������ʖ5����;�bd�k��Y{�\'g�Ȏ7CC��\0�ǿ.o���ō��އ��d{���`2��D�E:!\0@\0ŕ�ڢ�=���S�}�/}����\\�N�:00��@Ιװ�����g���?�vw�ֆ���\0,te�kcqc�����[�=u��1��pW0@\0?�������s~5�N0��@Q0%0�[Nd�G7t�9 ���#5���?��@,���7�[�\rP�L�7�,\"}SL��X�L��|�~�g�Ez.-�U�_�G���h��̧4z�\r��<#�i�g�b\0��|���?N�����pj�\rI�B������E``V���a}�K･�Xy��ع�`ɾ7���li�>�=Ǳ+��{������$@\0���..��|(p~,��gUc��vJe���J\'�t����t�l9��{ݼ�\0�7�����`(kڝ�����Y��/Jv����-}�Gn$\'���8�ç�yc�_��:00������M�7_��[�~��\n��K����_��6׉��ԍCw�4N��XN��FN�#g�j��~�?@aqPt��W������u{�-�-��U����I��z�m���M���3��?����lu~��G��_~n����h>�.�%����$�k�~���w2��uUZc���4�l���֨q󮺐�x\\���w�~޵�?��l��gn�O�����q�+\000�=�R���;���\"�g���\\V��W�\Zl,���?r|\0��Jm���?��o�3���H���R�[Nt6\Z�O>�@\0���2�bCƵ�[�����\0<.���#j����^m�Ct>0\0���S�:xy�~�\'�u{�\r��}d���+�\0��G\\;_��o��Z�Ku������ZY+wk�.}Y�Ďk\00��$���PW�C�b����<�Y�t���w��S\r`fp00GEO�\"�i��W�eK�U�\0��ؕC9�\"9p�?y6i\00��\r��Z\\OP������������\0�	���{=��5l9�ѽ�,%zӳI�����u�0�u�־*����U7���G���WM��Hf�\0P=!�X��[�P���u�z#�]�o�ǯ��qi��&}@A\rE�LhH�[W�s� �K,>6�F����y`\0\0`	��\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0`��&�,\n�!�bH/��W��%�9������$#-�,L��iTsl�=6�4��oy���D���y���ޮ�0Â���\'�+�+�[Q�����g��3~�����Ȱ|����JKNT\'�$�iü�xN9��J�}uMe啪�����Hx��G�4@\0ca�^��u�^rW�vE�\Z_]�|�����������@�e	c��V\'Z�%�4i�[]���/9]���Ǣ���w��e�����\00`�^�5����{+����:[>�v��@�M	�M��u����.���W~2�[�����K�\\�\Z���f������V@Q�ҫ�8���n�����{h�fwiyޏVQU���]e�_����>��\Z���s���][�� \r8Ł��p��[�w�%ZmZ��f\0��P\\m��m��+j���P]t,���������g��^�s�#���Ʃ�I�������C�\'4���6$�������P��Mk��ԁ�^�{�?q~[��E&�}L^uU�����`���=�x2�� ��Ȧ��{���$�˪��#�M�t\'�\0�X��:r�he��4I�&O�2X���@\0c��h�v?,���P��2�U^-�O�������cǞ���@��Ζ��n����RW++�V��5���ߴj��;�����nkX�h�\0@\0c�ˮڷ=�yo]�c�Һ����Ñ�mO2�,\\�E��\'�cB�;�[������5mZ3k��Y#��]�1�\"\0��U�6Wy��e�-c����~��K�6�/M��%��j��31)��<�j֪Z�Z��L�[���`.�\Z0\n�^�c�5n*k�*���{�v|�-������x*��D����������,O-�w@���\0@�Ţ�nL����Y�o��K��{�������f~K������z�.g	A[����NtMsމ��>���Z.b:K\Z���\nk�nr&c��my\ny�9;���W7�W�R�zV�AO�BC�����sB�֓/��\0�����Ѱ-떗��)}ӥ����ޕ6�RuS��Lx|Ɇ�������K�/ѡξ�+�M�y\\3V�:Kޤ�7|�3�N2X0�ؐ �3��fd�z@O��b�ش�ja����m���de�X�b����A�V~uf������&��-�R����O�de<i��n��8�H5��Hh�y���U��ځ�~0f�u[��Y�_9Jy�)~6�#�d���\n���?e��U�b�K���Y������ߚ,�s��w�Es�L�޽��۪���͇/iPB�ͶQLZo]�c+j��E������@��Αu�k\']A�������Y���55��ߤ�B�o�W�������E�b4�\Z�v@�xm⒜\n�\'���-����6��Ķ.[/�W7l�in�+�����Ͽ�ڄ��r�ޱ����ߕ]�)�䒲��g\'��Sg�����J�+y�Լ��,�X\"��k���A	{99����?7��圦;�ӶN^�۟�~����-{^t��l�Twu~[I�^��R\r(\'d��w`�������b[�/,��c��J�+;�7>�.�z}�����{�}5S�3�w�qGs9R�[��L�&q[ �s�#�!�#?5ej�J5�/�M�W�ڷ�U=�Ğ�,L�H�j��Hm����!gg��9͖�O�=ը\nByK�>v�9\\)\\�貾�O�ʫ\'ti�DN�v�?(�-;p��Lv�R3�Q�(D\0۪���,�u���&��_�:�F��\r����+���#��D���M۟R�w��e�����	jX֔$z�t�5�>p��O�)��+[Q�p������vH���X+�?���������$���W�+�/��o@)���7�ef\Z�F!+�j��@�嵅�0�NZ�N�m٤�.��|���ĥ���&��e�N����\nR�����Gu�J�eq�+R3q�@ʸ�-�S�Y�#���JP��˯P���G��Zu��ѳ�u\"3�����Z���h˞\\.��3���?j��7ܴ��|������p�mR�\Z.���_֥�ݸ\\�ht�V��/�1�,�7Mj��������Ch�i|��WO���C�M�4��[b{�v����O�4)�%PO3:9L�������L_�q�S��]D�9�{��A\0cP}�+j�p�g��H��J�Z��y��c������D��c���<�����{X�5k�(!\ZӜ�3�p%Io�j$���}��p[��b����/����z�Ej�g)=�Y����2�>����l�sه붆u�7r%�aݝ�`�/��Qװ-k�7m���v+o�\0���Vg��|�H�va��I��j��t��T��䂥dsEժ���Z�r�\r굲�I\0��_�~r�/��*���^��p��DQ�^Wv�ǻ>�Hc��=/|���[zu��Q;��,�����.�3������������=6��ُ��e u{��Լ%�!�\"�8��.{�c�K&�a�bD�NEַ@\0c���.����eu4�R��	& ���/GM��\nL2`��ȣ����IQ>��}!kzIH\\>sTu׫٣��R�-��K���qƍ�U��L�`����f�ؔ���3���)����dDκ����T�������&��>���\'wf�yTL�����&z�썟���t(Qv�w�ĳ�B����w���� =�������B�\n3�6�\0��k<����H5J�d@�d��j4Mz5O��.˭ҧ����K�N��ʸ�6����a���/���Z����l��g����{����ĥ.�\'忎��Yc\0WG���m��S����@d�!Yn^CK�oK\\���%=�i����tG��oT`&pfH$<˳H�:�&���I�z�ɃeY}�Ixt���<�V��Y�m�N)p%�6�O����|TJa�w��l#9gZ׫)-H~�u�7/����� �RTՉ�=����Ij�tM۟R�6�[.���9K��}�c�@4��E�3�?M�~��ߜ��,>��D��Ů���s���\nXj�)�+� ����=�rLW���P�`0�:V�tn��3�BM4m,���Y�m�SE�4�������7��/\'����?��9D�ư���5&�Jݦ<ex�38����\"ȃgcj^R9y�6$���1sfw�?us���<Ҿ�&).�>孨�֤Y���5��&��S�tf�V=~X��r���f�k����ކ��ʫ��t-Oje���>�y�II�n�&M�=��mz\n���4��j��2��v�u}�����������.��oK�i�l�m�/���\0�B#�1����Cgx�Q�f(F�����SI��3�Q)%\'��RC�\ZLo�\Z这�$�k�n\rW�>���SUq�)q���&�����\nt��?i]��mdc��I����L^VR�?7���	-��ċk�I��U���vMM�&j1G��g�}c��@ �Ur`�#�\0�B5a�ۙ�J�Ζ�&���\r�5w����	E�Z��dR��Wj����!���&`���\Z���Ϙ�d˽٤�ٯ���|樜pNc9��_|i��(wc����̺���vw�M^�KI�`y���m���J��U�2�YR��wH�ܙ\no��Zħ1�3`�[o.*+��A[mz��D��wr̽�]-�L�Rx9K��x���E�TK�#&��L9�J��c��I�����dBj��}5�+B�[�hY/d�����63�7����c��b��=3t�)�%���76_z�ݛ����o;�ƽRsgYe�@��dT��S:�`:MjA)�R�@Ԩ������r��j�v��qUe��Ϋ�z�ͧ�4��0f�n���r��D�o�V�V�H�S�__5ә����M�r��6�e���g�w&>���S}����c:�	k\ZfuTw��Ia�>q��yƣ���llL0�,��z85\r��L?�R�?|�۵u�S�(2�����1����W%}͇:.�F�����ʜ.O��(�j�E�6d�U����n��ڙ<�������g/������&��>j�P�*��%Z-N�!a���$���Ve�3$W�[˪��ܫ�S_�O�����G�9�e��H��&��H�4���^o>XJ��ï,Xo��ع/62\\���x� u/V��1�d�7^Vu\r�}땟H�<��ϙ�s\0s���Ʀj�.�N���Qj�)��G�� �j��grư2��4y\n)���9��\'M摖0&Nx\'���mr�s��D�?�����M?���}��ƽ�=�d0`���@�2N�S9�d����G3u]�	�̫m_�C\"��-U�T�A�1+��r��\'�]0n��{����J�BS�٘�թ[����g��?z[N��3ᚼE��ڐ�kg����\\Fa*���T旁}uM=W��kӺ�fe9-[ǯ������4�G�����1G��7�~R\r�Z��0)�ͯ��F3ִH��\Z��uA}l(�ح5�B�Zce�2�d�+���U5��=��ʩR X�� \'gj���L�˺�RK�O�@\0cΑ<s�cݝ�GLs�q�S�-�M��&ycLGU�4�بK��u.��8���{/%.I�m�<��d��X\0k�HtH˖�y,�\'�{��Tlrf�P*ō��:���M�&�ʛ\Z�%�&Ý\\%�\\/�߲U��3�&��6�[ށ�z�q��,����eLs���:��CNa,[J~�]�� �1o2�|�]3�ж2p�5hV�Z����{0|{�v;k�ted��d�g�8�9�>��\'�]<.���,r*���m�P�ŵ�ǧo�[��s��O�������\'�+Ԁ^5�}���d��|�r��9=lX��:���۪�N��N������צV@R��\Zskč�=	߭�/�w����d9M�� �:��0(��0����2�L��Q��+���=�Z��|Q�H�3<�m��`-\'\r&���r�7�~R\r��%;�V�棄$�剆r�M�;Qj�=����-{_购*�M_rn!q��m�;ʓJũ.�[<{�\n�Wo�8�j�ɷ��{@>��j���O�����O�]�Q�E&��3f��_�9��s���g�Ѕ���S�?��?X������w\r�(�H}�t��jj��<Fc�a�X���W��_ux���\\֓U�何�W*B��4ۓ���F�I�H�J�Lٳ*�mL����M͗@�ݐ��%��c�I`ט��,����\ZTN;��\r�����B���x鵲��MF/�K�>~�����$.	�H�܄�6�3��\0�Z����t7Ky!�M9z�:�����9�>�\'����T���.n9.K�ܙy�B�E��\'������uw�M6�S�u�o�m�r����4��I����Gu�+�Ꮩ�rظ�iu{����jߦ�-2�L2r�Y����\01�Y���Jʳ���aTÉ��͇����C�k�gY��tK)s��y�\'�\\���oy�.u�����l\Z�ieQ<%5+�g��]�#��|���ï���B�=%�j�D�rm���̪�lþr�VYt\\6{��\Z%�9���C�K��[��`��Zp��MH��4��R�g�J7���e��o}���0���>p��!q��R��7�J>�0*�+�x����װ��W��������)�%Z�Z�z�\"��I�t6~5����[-�Ğg_�d���Lu�^��x.u.�C��\\�^ҫ�3����l�V��d��`��Wö\'��8�<W���Lus]j�y�L�u���}vn \'����\nZ���\"�����Cku�d�\0Y6��7�A��\n%J{b�7����7m���|m��{�}�?�6v{��������\'��]kg�����f>�k�����\r�eɐ�g���3Z�����z���W�\"�l�R,&4���|��^�5H�8���=�}�~�m�ww�7$�ɹE��$��?m{�N_����чS�2޹+���k��	��W�����wlU�\r�_����Cu��	{\"� ��5�2�ڷ��F[��2���H�O���߾ó�~Ӯ�2��W7Zo�]X��||�mH(0�V|��f�r��#���/g��ojb����3G�����6q�p}���349���l}�+y��p���?e�Y�r��Uz:�W:�l\\Q�jǦ�Y;�U�Z,�s8�JFԥSc�X�(���>��\'��[6�������������p�����%�|Mv��g�m�Z�W�֥�[NA$¥%�kƙuw�eX	0��[**5詾����`\\O*���������U-�+јS\0K��4Q�<��D��3Κ�Ƭ����_+ar�x��#��cܒ�T�WvC�\\p������y�U+���	�w�Pc����nߙa\"u����[�� �.���t>xu��IL֩�\0sWy����OO���#��Hߏ��e\"��W���rX��]�u*����>��~߀^-���+k1�r�LQ-Ȩf�(Ʃ��v8-��+�������ߤCuWHH�g��[zs=��|�6����bc�B����\'�ѿ�$�W��Hߗ���ov-�N-fe�ؽ\0>��{�������1�/;\\�6QM!;6��/���6���Z�tc]ӉK�֗?�ܵ>��y~�4`��%�:a�X�Ɂɯ��x��]Z�[�.-/�S:����u�de0���n�~G_����[��Wy���i������eoI�G��j��\'�,S7��~���3��s���>��1�&��lp�71����28�����wVĮ7��d���I�-[u�m�W>\\VЅ���t��[��.�9� �1��hë�_��ܗ����.G�B�%�||��C9\\n���<�4PB�=�u�Q�����=�ƛ�n��_܌U�}�bw8�M���Ұ\'��Z�S�b{<c�J��n�P^�\"�/��NˉE֡�*�;nŻo�y+VL3��/����y�*+�p��r�5]���)țJ�Kg�l�oױ\0`�&9������k���Cw%�ޡ��\0���c�FownN�Z��b�me?�ze0�z�.�-����Z����\0/;�P�-\Z�]���r�Y��oU>i���Ͳ?��/�,D���I�܊d����ǇJ#�u	K�>%��Ԫw�q��EJኪUy���-�>���~yvM��o޾�v)�L����@��cC���1z��:Z3@�\\{��Ӝr���5����>Hg���1���35ń+�Z\\�VѾ�[��Ĥ�3:������/�=*��W�[o���5��j2)+�+M!�j��/�\r�-u�V+�,��N9��5�޲��E%�?h9�s��\\GoI���6�e��j����<]P���/�fN�?�<�<��d��\Z��Pvy)�;*62,%���Y�;�.h���}�Y�XK��ty�3�Z�h��[��r�^�������9������f�M����3��֙RD�K�M��E�\Zd|Sh�n��dW�;J��I�VR.q�r5k4:dL�5�?�w�\Zs@�=6���߷��r�Tv^�1�jhc��D��;Mn���S�Ē����Iܕɀ�� ���HA���S3���HN3&C�\"�Do�3l�z���m�ƎI����	�\"-ծ\ZD}6vI+K/)�~��4ń�� �G+H�Ee��:aBJy\"�Z�,Ev~cȭ�j�eg�+鵕Գi\0ȍԅK�}땟�l�?�a�*�;���q006�p�Y;[>+R�7\0X��ڶSR�����G·-�������\r�j�zgҸ�M��\nエ�������C^�p|Y2X�)���4��.�w�1�UƔ�j�\"�/����n�ڔ`�~\00`���-��w��I���Q\n[����Z���@\0���J�}��i�\r��\0��t�7%.ј\0\n�AXX��ݨ9��;����˒A�_\00�5�*o�3��d�`\00�g2���v�|v���M�~@\0��N\ZSg\\�x<��9:|����c���t>(�#�B���ب���oq�X��m��<������g���\09a.h,\nW��:m�����5�\n��}4�36b,��nO��wm��� ���R3a�ҫ�L�7�&�\"9��.�\0\0�� ,\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �Q8]s��\0��>���ᶥ�Sw��Z�&�$�|�p��M$�X2��h���)�\0�s��m\\�:uͦ?��s!��2uڏ&��E<y?�%���4\0��f6]��M���<����F��sR�Y�/�\0p!�V��n��>X�O��F\'U/�X0��i\0\0<uܪ�[Q.�.ƙ�>E0�y$1��*�\0�.�%\'\\���-#�g�bv�H���X\'�p�B\0h\0�O\\��w��:�Zy�c�H�J@\0��KB��.��q�e$�+�#����� /\0�]�M/��!T�~󛺢<��ZJ�h\"K]E&��s%tK�`�D��Ǫ>V%2\0��߯Ta�S��c/\"i�q,u��)�\0�Vj�tE�	$�S] c׏�&N$G(���:�R�\"G��{o��d*��c���\06}f�����`F�KK�����Dr�2N��m\0��.fD��Z/}0��T�\0�\Z=�v����nj\0��V�w��.f��>��:=�k8�l\\\0\\\0�z�;w1��%I<�1���ݨw���ۦ�	2U�\nc�b\0�)��H��`U]��?�q}Ԕ�\0�A\0Kɻġ�۹��,�������n�Xo3���bo�jJ�^� �\0f1���،�%}{��{��[`�ئ�E/�����J��rb�K�\0�\Z�6]�r�x�˦��.\'ã��8��\0\n�D/���Hץ ���q#�)�L+��^ W�F�hb� ������eӗ����XA�X-\0�XN�:fL�-u����\nb�$�1��6�:7�e��vup$��KA`|\0�t}��)5�b����R���aL��S�����s�˽��PzP��-u߄�o��m�5�YCA,*� ͱ��Z� 0���P�����\nb\0E6�X+*``Nă�C,���\0���\n�����D22���%��Z�.ujީk]=�^M�i�TA�1�40�\n_�^%�o��5``��&��Z���K�/|+��u�o%���晻���Qm��i`n�n+3:���o���yi4!��3�\00\n��%����	``��&�w�FAL�40[�8���eZI	�ʹ�@܍%#1������ݚ;�����Gi=`A�%���Q�5\r�1�s���$��&���+\ZO�cZ8J�4PxKK����RF�[hF`��Ē��$0}�����_����cB�X2<�\rq��K�]_^��3���,2�	�&�$a��\Z�M_���]|H	�m4,�H�č�0\\�\Z�%`	��h^`�\'�h�ΰ���Ҍ%=Z��Xɮ�:�,vn��NM��&%�� z�\n�f��I�����\0&RI\Z�%��8����bt8O�;hp\0S�:82����4G��g�	����dK�vWj��w\ZX`<.��yI�?- ǚ��I���ѽn�㜕\'�\0��K\0 �$&�1/s8���N�,�~7��i�$��J��cn+qꕥR�΅}!�0�G�w�Ib̽�צ-)1�����)	��P`#�dhH*c-�l������`U�;z��=�@\0�e4ntP��H�10�%�R��-�\0�����? �_\"����w���(�(�������=��Tx/��%5���&aL5\ne�[_�16Ͻ�f�\0~��숍�c ���̻��G��\n�e�ă��0W�a�n3r��D>_�[0��W����q���C+Oջ�%��\0�/+�9j$�\n�a�L/Rn������������`�0�&�|�[���J�%�󺓙\0�@�x8f�ql��XP�[�6�^��y��3��;xI\0K�D��a#�1_Hi[����F߲��­t3W�G��6\0�����hrxĸ~!��X��v��ɓ�]�c�������U�����D_�HV_cf���\Zq+��2��i����EDb�HbcXur85/f4ƅ�i����Fg�ݖ�z�\'�Ws\r�b�t\Z�Ɗ���&䊎�O�dl\\HGӼ]F���U嬦�U���ûizL��R6.Q��N�#���̱*����:�0*��;��Tw�[/(���N�QR���l�c)��$Q-��R��L\0\0�P�X\\��\0\0P\0@\0\0��0]�\0\0P\0@\0\0�\"0]�\0\0P\0@\0\0\0\0���\\\0�\n\0\0\0\0)��\0`�X�\0`*`\0�Y`�F+\0\00�H_\0\0f�&�\0�\0`qT�\\\0`�Q�\0\0�\0\0,�\0f&,\0\0��\0 �\0@��.h\0\0��\0 �\0@��.h\0\0��\0 �\0@��.h\0\0��\0 �\0\0\0��	`�\0@\0\0\0\0��tA\0@\0\0\0\0��tA\0@\0\0\0\0��:]�\0\0P\0@\0\0\0\0���\\\0�\n\0\0\0\0)��\0�\n\0\0\0\0)��\0�\n\0\0\0\0)��\0�\n\0\0\0\0�\0\0,�\0�\Z0\0\0T�\0\0,�\0��\n\0\0�x\0S\0\0@\0�\"	`J`\0\0f>�\r\0\00\0\00\0\0(R\0�\r\0\00\0\00\0\0 �\0X8�5`\0\0��\0X��\0\0�BL4\0\0��T�\0\0�\0\0,�\0�\Z\0\0*`\0\0`\0\0P�\0�\Z\0\0*`\0\0`\0\0@\0\0�p�k�\0\0P\0@\0\0�\"0]�\0\0P\0��h\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\00\0\00\0\0 �\0 �\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0���0\0ַw��0ar\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0��\0\0�IDATx��kLW�ϝ��ᱻХ�\nۮ�E�t	 \Zh���/MClR?���\r�I?�6�Ф�� �@��b��D*$�XR�(�+J�� ��vgwzg���ظ��rN�ɝ;̝�o��̙;�؉h@[�1�\0a!,����Ba!,���\"@Xa!,����BXa!,���BXa!,�΋U2�Iky�ԅ]��Ӧ:�����r����i�SOv��o�N�.��̭2�{qf�L�\"��{�K��TJ�l\n�:��z*U×1�L�=��P����c)��/0��GR����¤���:�?g��.2b��L��t�nYBA~�\'��H�5{t*��� EX�f�nL�t��b9V�2),M%�+�\'���_�������[BcS���&�/��4+^\"\"�m�a�=Q=��rg?�Z�&���bT(X\"��q2L\r�P�4\\�AX��sV@^;�ΞeblX<���c�����6-�ׄ���<��;�Y�)���w�&Ěݸ��y�����&6���Wj�TI�\r�`K�6t��bcen���v�\n���j���uEF��*籿��I�ֻ�v�Mٙw��n��}�\"�m,ߚ�T���`�!\0&�UYqYR�i�tnu��{Si9��´]:3\nZJ�&X�(����C��C�!���{�MF��xFnE/��#�QRW�ޣcB�\no{}�\'`wݴ�B]����ޤR�\'��̯hc�<Fg�c>����<Y���K)�|����x���1D�GI�?L�S���}����������qMa�»��ZD}c���u�uF���=�v_;7/��s�U���k�&=��!&5�;UA��J��R��]��-��DK	#C}����T��Oh{�BZm>�9�-�G�����:\\���\r�Us��QQE���_�b���1�SM\rt�H���a�d/��t�,m���l\\�N箻U�\Z�%�j�!�)��ɉ��{��\0��e���>�񶫝mM����}ͱ7]�ɹ��r6Z��7�;�x��:t2q��k~=_���K,J���$BWpy���E�<�Y��Be���˘<M\0�cl��\Z���A\Za!,��	^I�F��J~W�`L\0��f`��D��^��y#�3v��9X*��(����@������o�E\\����l�=�8.��7�ZML��9Psޢ5΃��К`�d��((9��V�IS4ä �Y)��w�!#�7�$|��R�s<X� �?㒳����;>ZE�chu5N�vQ�\'�����tJMl�΍�z!���2wCV^e$����i����a�>X�q��W(kIT�8��S���(�(D����XUp�����<��\'��X%��q�O��A�އ`��(ex��be!�\'��a��Bey<�#,CC���C\n�,L��1}��[����BXha!,�ۿ�P�§F�\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(23,'sys','next.gif','image/gif',542,'2013-12-14 18:15:36',542,'GIF89a\0\0�H\0^�#e�%h�&l�&m�)n�+o�+s�.v�0w�1w�1|�3}�4~�5~�6�6��;��;��=��@��A��_��R��F��F��c��^��I��g��K��K��b��k��b��P��Q��\\��l��\\��Q��R��g��P��R��S��T��k��^��f��f�����q����ᖵ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0b��=:F���<+7E��;#.4A� */%)-0?�$.2C\n(,,9\0\r1D\Z!\'@�5	\">�6&B�83G��\0;','GIF89a\0\0�H\0^�#e�%h�&l�&m�)n�+o�+s�.v�0w�1w�1|�3}�4~�5~�6�6��;��;��=��@��A��_��R��F��F��c��^��I��g��K��K��b��k��b��P��Q��\\��l��\\��Q��R��g��P��R��S��T��k��^��f��f�����q����ᖵ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0b��=:F���<+7E��;#.4A� */%)-0?�$.2C\n(,,9\0\r1D\Z!\'@�5	\">�6&B�83G��\0;',NULL,NULL,NULL,NULL),(24,'sys','noPicture.gif','image/gif',2141,'2013-12-14 18:15:36',2141,'GIF89a<\06\0��\0\Z !&(%)+(/1.2319:8<>;=?<>@=@A?ACABDACEBLGFEJLIJHJKILNKMRTRTQRWYXVZWYVZ\\Y_ZYZ_a_]`[`bg\\\\j[bd_^]bdac`cebchjhjglixkmjnlpjnqmoloqnmqpqzpp�trvrtqkr�tvszut{y}|{sz|yzy|~{}~����~g������uz������������������W�����������������������a��������r��������r�����������������������^��/�ۗ��m�횛�������������q�鬝����������������������]�ا�������������������������������������������������������㴶����������ά������������ȸ����ö����������������������������ǹ����������û�¾�����Ŀ��¾�ÿ��������������������������������Ǵ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!�\n\0�\0,\0\0\0\0<\06\0\0�\0�	H����*\\Ȱ�Ç~�,�*P�:�Z%KX�oC\"��U��(S�d��H��p�*�͛8k��d��K��ve�dS�Q�7Q��S��L���y*U*RIg�4JZS��y\n���(���m3�͘�Qd��V��p�D�E*�Cf��n�5[�Ɩ�+[Hg���U�e8Y�>��t�i���,e�UW$���C1��l�d���j�K�\Z�RdC������s��d����\'�>�%��1�dAoj��Y_��k�߷�ç���93�φ�3gR5��L��}�w����:�%�*���rNA��AF(��[&.-d�\'�b8����&���O!B�Q�M�!�*c�0F���^�0��\'�9s^\'yb���P�X��p�@8���A��5\n*y�f� �C���#��BFX �	,P@@d��A���I\'�8�X��C<S�P�$��#+$�\0D$p���	�&-\Z4�tB�%�p�e�`�\r*x��\n6��B���0\n!6�\'��$D @|d\"I&�`�C����A�\nX DL(�}��B�@�I�i�\0����u�\Z\Zl�	D(bl\nM 䌪����\'�~�Ad`AZC�\'���#��AQQ��^&\nI�ɀ�1F���4�<�,(��Q�\rA��:ȀB،2V(��ˬf���|�3y��\n��!ƍj01DC��0�	e�(�(WY���7��qH���%\Z$���K#LAB�xM\n��f��ePX`��6�D$�D���L�,����B\r�v&L&��ʙ�g\Z[���5�s�*��*����%f�b\n, �M�ʢ�.l��l�Xh!�3�D�+��!!G�	o&�̰B\n���^�(Mj�7�΄�0��b�I���6=�q�hSM�8�P8��tAd|�E\"֜S\r1���8q���ˉ\"���A��y-�e!�2�1\"\Z�F0PAASP!N�BNb	͸�	�M8�8�T�$Q9H��g���a.b���	N��\'̆�	$�LC�Q�t� zPD��!2�A���@D\nT\0���M<�	*D&ȡVA�p�>�! �Pa�I���p�{����� �\'JQ�m�b��XC���L,�+���Q>Ǉ�7{�2숋�ᄋNs�S�	!څ<*��Hp��t\"_�q���#=�a��B\r�D@?	�-�E��t� y6p�������%,�2��$�0IU��y٥r�\r(`�eL�\Z֐F2|a�~�l|����Q\n�0�(JK��2!E;�%�?��T֦��\0Ú�4�6�x�37��f@�e�R��$�+�!ƅ����-�Ë(��4\r�HG\Z��\0\0;','GIF89a<\06\0��\0\Z !&(%)+(/1.2319:8<>;=?<>@=@A?ACABDACEBLGFEJLIJHJKILNKMRTRTQRWYXVZWYVZ\\Y_ZYZ_a_]`[`bg\\\\j[bd_^]bdac`cebchjhjglixkmjnlpjnqmoloqnmqpqzpp�trvrtqkr�tvszut{y}|{sz|yzy|~{}~����~g������uz������������������W�����������������������a��������r��������r�����������������������^��/�ۗ��m�횛�������������q�鬝����������������������]�ا�������������������������������������������������������㴶����������ά������������ȸ����ö����������������������������ǹ����������û�¾�����Ŀ��¾�ÿ��������������������������������Ǵ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!�\n\0�\0,\0\0\0\0<\06\0\0�\0�	H����*\\Ȱ�Ç~�,�*P�:�Z%KX�oC\"��U��(S�d��H��p�*�͛8k��d��K��ve�dS�Q�7Q��S��L���y*U*RIg�4JZS��y\n���(���m3�͘�Qd��V��p�D�E*�Cf��n�5[�Ɩ�+[Hg���U�e8Y�>��t�i���,e�UW$���C1��l�d���j�K�\Z�RdC������s��d����\'�>�%��1�dAoj��Y_��k�߷�ç���93�φ�3gR5��L��}�w����:�%�*���rNA��AF(��[&.-d�\'�b8����&���O!B�Q�M�!�*c�0F���^�0��\'�9s^\'yb���P�X��p�@8���A��5\n*y�f� �C���#��BFX �	,P@@d��A���I\'�8�X��C<S�P�$��#+$�\0D$p���	�&-\Z4�tB�%�p�e�`�\r*x��\n6��B���0\n!6�\'��$D @|d\"I&�`�C����A�\nX DL(�}��B�@�I�i�\0����u�\Z\Zl�	D(bl\nM 䌪����\'�~�Ad`AZC�\'���#��AQQ��^&\nI�ɀ�1F���4�<�,(��Q�\rA��:ȀB،2V(��ˬf���|�3y��\n��!ƍj01DC��0�	e�(�(WY���7��qH���%\Z$���K#LAB�xM\n��f��ePX`��6�D$�D���L�,����B\r�v&L&��ʙ�g\Z[���5�s�*��*����%f�b\n, �M�ʢ�.l��l�Xh!�3�D�+��!!G�	o&�̰B\n���^�(Mj�7�΄�0��b�I���6=�q�hSM�8�P8��tAd|�E\"֜S\r1���8q���ˉ\"���A��y-�e!�2�1\"\Z�F0PAASP!N�BNb	͸�	�M8�8�T�$Q9H��g���a.b���	N��\'̆�	$�LC�Q�t� zPD��!2�A���@D\nT\0���M<�	*D&ȡVA�p�>�! �Pa�I���p�{����� �\'JQ�m�b��XC���L,�+���Q>Ǉ�7{�2숋�ᄋNs�S�	!څ<*��Hp��t\"_�q���#=�a��B\r�D@?	�-�E��t� y6p�������%,�2��$�0IU��y٥r�\r(`�eL�\Z֐F2|a�~�l|����Q\n�0�(JK��2!E;�%�?��T֦��\0Ú�4�6�x�37��f@�e�R��$�+�!ƅ����-�Ë(��4\r�HG\Z��\0\0;',NULL,NULL,NULL,NULL),(25,'sys','pending.gif','image/gif',607,'2013-12-14 18:15:36',607,'GIF89a\0\0�e\0�S\0�]�a\0�b\0�c\0�c�g\0�h �i �m\0�\0͂\0�~@��\0ՊԐ\0ǈPߍ\0ܘ\0ܛ\0̓`�\0ܡ\0ܤ\0�\0ўp�\0�\0�\0צ`�\0�\0��\0�\0�\0�\0֨��\0�\0�\0��\0��\0��\0�\0��\0�\0��\0�\0��\0��\0��\0��\0��\0��\0��\0�`��\0�@��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��`��\0��0��\0��p��\0��\0��P��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��p��\0��\0��\0��\0��\0��\0��\0��`�ӿ���� ��@�� ������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0�������\0\0��_\0VF\0_���$9�\Z$�dH1�\"d�a/�!I	��^Y-�G&���`W+�C@���bZT\'�B=,��7\\XRNEA:4�c[UP>.?83*\0K]YSO#�xؐ���\"\"Q�0Q�c��\Z0P�\0�\0\0	E3j$U�P \0;','GIF89a\0\0�e\0�S\0�]�a\0�b\0�c\0�c�g\0�h �i �m\0�\0͂\0�~@��\0ՊԐ\0ǈPߍ\0ܘ\0ܛ\0̓`�\0ܡ\0ܤ\0�\0ўp�\0�\0�\0צ`�\0�\0��\0�\0�\0�\0֨��\0�\0�\0��\0��\0��\0�\0��\0�\0��\0�\0��\0��\0��\0��\0��\0��\0��\0�`��\0�@��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��`��\0��0��\0��p��\0��\0��P��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��p��\0��\0��\0��\0��\0��\0��\0��`�ӿ���� ��@�� ������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0�������\0\0��_\0VF\0_���$9�\Z$�dH1�\"d�a/�!I	��^Y-�G&���`W+�C@���bZT\'�B=,��7\\XRNEA:4�c[UP>.?83*\0K]YSO#�xؐ���\"\"Q�0Q�c��\Z0P�\0�\0\0	E3j$U�P \0;',NULL,NULL,NULL,NULL),(26,'sys','permissions.gif','image/gif',1061,'2013-12-14 18:15:36',1061,'GIF89a\0\0�\0�W�X�Y*�Y�[�\\�] �_!�`!�a\"�c#�f8�x������������������������������������\n�����ΤX����\rХY�����ݦ;ҧ[���Ө\\�2���������������4�����ˬ����������������۱a�����߰g�����9���޳c�j��Ǵ������\Z����������ٷ���������k����@�� �����#�����%��%�����&�ƺ��&��������M��J�����������-��.�����������/�����������p�����6��6��������������N�����O��P��\\���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	���\r�\'O��I4��+d!\"�G̕C\r�-Z�%И,��тfQCEG�x��Pr�(jh��s\n�𦅡��Xԡ�����\Z��& ��p��g \")����5ʇ&|��č�<xҪ�cL�4�ęKw.�2(h�0E�߿j�t�q���\nA�(Β�\'2VH�p8�*R�()���	(����$@r�XA��+�XR�G�\'Bp�`��h#$@p�@\0`�_@\0;','GIF89a\0\0�\0�W�X�Y*�Y�[�\\�] �_!�`!�a\"�c#�f8�x������������������������������������\n�����ΤX����\rХY�����ݦ;ҧ[���Ө\\�2���������������4�����ˬ����������������۱a�����߰g�����9���޳c�j��Ǵ������\Z����������ٷ���������k����@�� �����#�����%��%�����&�ƺ��&��������M��J�����������-��.�����������/�����������p�����6��6��������������N�����O��P��\\���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	���\r�\'O��I4��+d!\"�G̕C\r�-Z�%И,��тfQCEG�x��Pr�(jh��s\n�𦅡��Xԡ�����\Z��& ��p��g \")����5ʇ&|��č�<xҪ�cL�4�ęKw.�2(h�0E�߿j�t�q���\nA�(Β�\'2VH�p8�*R�()���	(����$@r�XA��+�XR�G�\'Bp�`��h#$@p�@\0`�_@\0;',NULL,NULL,NULL,NULL),(27,'sys','permissions_gray.gif','image/gif',1053,'2013-12-14 18:15:36',1053,'GIF89a\0\0�<\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	�g�\Z�_�vI�7�a=c��٣�Ι�z\r����,޳X���;&�_�{��)�厞�Y�n�kHOV;U����=���ujHI���ߕ����Sz���r7PܭV�T!D��+[���ٳf�-�%0V3np����U,���I��w/2[�N	�t�a�ƈ���Jӧ��~��k.Z�X����ߧV�u٢���S�$u����Z�2�2%\n��θްY�FM\Z4g̔)c���\0;','GIF89a\0\0�<\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0�	�g�\Z�_�vI�7�a=c��٣�Ι�z\r����,޳X���;&�_�{��)�厞�Y�n�kHOV;U����=���ujHI���ߕ����Sz���r7PܭV�T!D��+[���ٳf�-�%0V3np����U,���I��w/2[�N	�t�a�ƈ���Jӧ��~��k.Z�X����ߧV�u٢���S�$u����Z�2�2%\n��θްY�FM\Z4g̔)c���\0;',NULL,NULL,NULL,NULL),(28,'sys','preview.gif','image/gif',366,'2013-12-14 18:15:36',366,'GIF89a\0\0�?\0\0\0\0/>N.@T9IZ9MZJLJ9QcBMcBQkAVeZq�Zq�Zu�susc}�c}�c��c��k��k��k��k��k��s��������{��{�Ƅ�������ƌ����ƌ�ƌ�Δ����έ����Μ�ε�������֭�֭�޵�ε�ֵ�޵�����������������������������������������!�\n\0?\0,\0\0\0\0\0\0\0���P(T¤2P�X,�@�42)[��a�*�t��x���`F ��܃E�m�	$��t>8xB\0)\"$~95wJ\0-{\"}3%�?*#2{lm\r&,(\Z�m\0DT�FG?���?\0�+»�\'�T���SA\0;','GIF89a\0\0�?\0\0\0\0/>N.@T9IZ9MZJLJ9QcBMcBQkAVeZq�Zq�Zu�susc}�c}�c��c��k��k��k��k��k��s��������{��{�Ƅ�������ƌ����ƌ�ƌ�Δ����έ����Μ�ε�������֭�֭�޵�ε�ֵ�޵�����������������������������������������!�\n\0?\0,\0\0\0\0\0\0\0���P(T¤2P�X,�@�42)[��a�*�t��x���`F ��܃E�m�	$��t>8xB\0)\"$~95wJ\0-{\"}3%�?*#2{lm\r&,(\Z�m\0DT�FG?���?\0�+»�\'�T���SA\0;',NULL,NULL,NULL,NULL),(29,'sys','previous.gif','image/gif',542,'2013-12-14 18:15:36',542,'GIF89a\0\0�H\0^�#e�%h�&l�&m�)n�+o�+s�.v�0w�1w�1|�3}�4~�5~�6�6��;��;��=��@��A��_��R��F��F��c��^��I��g��K��K��b��k��b��P��Q��\\��l��\\��Q��R��g��P��R��S��T��k��^��f��f�����q����ᖵ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0b���F:=��E7+<��A4.#;�?0-)%/* C2.$9,,(\nD1\r\0�@\'!\Z�>\"	5��B&6ւG38��\0;','GIF89a\0\0�H\0^�#e�%h�&l�&m�)n�+o�+s�.v�0w�1w�1|�3}�4~�5~�6�6��;��;��=��@��A��_��R��F��F��c��^��I��g��K��K��b��k��b��P��Q��\\��l��\\��Q��R��g��P��R��S��T��k��^��f��f�����q����ᖵ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0\0,\0\0\0\0\0\0\0b���F:=��E7+<��A4.#;�?0-)%/* C2.$9,,(\nD1\r\0�@\'!\Z�>\"	5��B&6ւG38��\0;',NULL,NULL,NULL,NULL),(30,'sys','print.gif','image/gif',1721,'2013-12-14 18:15:36',1721,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0h���\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:2B010B4069DD11E0864E8F881E47E1D9\" xmpMM:InstanceID=\"xmp.iid:2B010B3F69DD11E0864E8F881E47E1D9\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8D7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>E�Ƒ\0\0�IDATx�b���?0311�422j F���ϟ�_�r� �@\"��������u�~3�~���߿���|dXݛ�@p=0�����y����o?�\0�0������o���\\\\\\,;w�d��\0ܻ}� �����O����|��vӣ�v�[�A� ������`x�����WFIA����\\�<����ϟ����^>�����s�K�؍�<�gH2ܙi3O�b`���3����߼lsf�\0��:\0����~��{`p���������L��\rE3�߇�Y�cb�`fbh���LLL�������[?DY�����_}e`��ga���NKK;�\0\n�ӧO����\n��c�}�6Ù3g�|�w����>�<#Ӆ^�z�\0� 8�x�\Zý{��<y	��i\'��011AB�?###ìtSF �P��	�|��L�� 9 ���h�߿�?�H�uF@�\"�}:�}%����\0���\'���Ώ�?~���ٟ�-��w�ܿY�`\"JR�s�0�����	f���?~��ǐc\'�p���ਨ�Ͽ~�*X�f�\\����K����bbbS�Ne dgg3ܹs�aҤIwY�)\\W]],����`bb�����\ZEDD�9� ((�`jj�\0L��,�HcسgX(:-Zf�����ׯ������G0�YGG�AHH�dcrr�L�,����i��05Ɉ��/H����l~�����s�2�2�P�J�ə\0\0 J�T�7LW\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0h���\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:2B010B4069DD11E0864E8F881E47E1D9\" xmpMM:InstanceID=\"xmp.iid:2B010B3F69DD11E0864E8F881E47E1D9\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8D7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>E�Ƒ\0\0�IDATx�b���?0311�422j F���ϟ�_�r� �@\"��������u�~3�~���߿���|dXݛ�@p=0�����y����o?�\0�0������o���\\\\\\,;w�d��\0ܻ}� �����O����|��vӣ�v�[�A� ������`x�����WFIA����\\�<����ϟ����^>�����s�K�؍�<�gH2ܙi3O�b`���3����߼lsf�\0��:\0����~��{`p���������L��\rE3�߇�Y�cb�`fbh���LLL�������[?DY�����_}e`��ga���NKK;�\0\n�ӧO����\n��c�}�6Ù3g�|�w����>�<#Ӆ^�z�\0� 8�x�\Zý{��<y	��i\'��011AB�?###ìtSF �P��	�|��L�� 9 ���h�߿�?�H�uF@�\"�}:�}%����\0���\'���Ώ�?~���ٟ�-��w�ܿY�`\"JR�s�0�����	f���?~��ǐc\'�p���ਨ�Ͽ~�*X�f�\\����K����bbbS�Ne dgg3ܹs�aҤIwY�)\\W]],����`bb�����\ZEDD�9� ((�`jj�\0L��,�HcسgX(:-Zf�����ׯ������G0�YGG�AHH�dcrr�L�,����i��05Ɉ��/H����l~�����s�2�2�P�J�ə\0\0 J�T�7LW\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(31,'sys','quickAccess_accountInfo.png','image/png',3852,'2013-12-14 18:15:36',3852,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0�IDATx�b���?6���>��!\"8_w0�y��$f&��U+ᒌ���_u��������c&�̦��*b\"�_�}g���;D���2����E@�a�\0b��Wo����`Cdfff`���dx�����S�����A����?uţ�W����z�\Z��^�x�����_>�2L��o޼�������i�:�Kxx�*؅PW#���ih\0��qƏ��0|������/+��[���0�ƿ����!�a���\n�\\�rX1�GD�����Hd,\\��a�����!��l?õ+�._�q�����ϟ?�oe$��8q��W����c������\ZM�������g`���Qd@�D0M�4i\'ԉ10Qj�l�\n.b\0/O$�\0/�f0����zo\"���óko�	�0�0��u\rG�,���]b`Pd�{�����CPp8}b������5�5���7��nq��>1H	�pҦ�L���>�10c������,���E\"+�B���;�e�3�b�\r��L@M��aP������7���?~0(+�F2����a3�o��_�*#�?�c�0pp�3H��0H��0(�ˀ,x�0�����-���C�_���1DEE����aM�T������f,�IG ���	m\"\n��nv7�$M���?�T\Z�Jăҋ?�H�/B+�BA���\"����A�ţ7aբ�Q�xP\ZD\"�b���m��u7ټ]��&MUS��=vyof���si�K(e}K�A�E���(�;q\rQ�@g����W>��_�ڲܝ0�ʞ\Zdr �x�~|�ut��M,<��3j�:\\M���V\\O�����S��<��h$��ċ��a�A\r*ͣ(2|KS�{?�/��o��b��Qa��W=�L&S���-f�%<E5���5\\�3�x�%ĺz18�@N=��<rB�/Y̿��,���AdY-D��I��1y�*�gF��C��TD�3������\'������ݢnCOF��F�+E.27���&u��6�\r��ؤ�~�H�h�=�n����:-���P�H7����AE�JBx��m���3s�Dm��&�\0�A�JRm��C�������b���\\[�����ء�����ǎ������S\'��?p����Չ~}5�O�>$t]��4\r\\d��G#��٘��ؽb>k�q������;K�gR���롗#?^ͱ����R�G\0ګ%��(���ۙ��*�\nhY��\n�1Ae�\n\r�Å\Zu�	��Rw�0���Vcb\"hL$jLP�X�DQ���\n�:����*�B�&w:o��ݼ;��s��\"5���y*��zmmm�D�n����4�H�f�H\Zs�!��iQ�TM�����\")+]���3�S��F�R\rr&�4�BM(E5��Pt��g2`���됯#�_��ܢ\"����w���B���if�3Xf%Z;Dا]dF����os#�$\\�rF!;Nl�S))R�ۓc��°�&a$d�?��g��N]Aw��I�N�}�#��1��}׉�-_�z�j�`I��;:�k#sO�y�9�l=��7At�`4e�J�i�b8d�AHGZ� ��W��/�e�hCM�a[Qs�H�R�����Q��b	&�8��<<kD�}�Ξ��fK<E�14!����_0߾�[�����w	�8��\nH���H�ʂ<�YK;�&��[���`�\"өGa�^��Q1R�Q��_�@�,g1��ۑ�\"?�{YSN�g���PWW\'w^oo/�B*����}D��(\Z2N�HQ���Ř1��\'����!F�Jqݿg���**vʃ��N<x����P�(\0��vY��t�P�@t8�qS�_z��q,�-<��_NN|�?�!�V�y�[L�x@�B>�:�$]4rzǙ�S<�x\\\0��Q��IH6��\Z��lA��Ȝ��������\\���Ȕ���<��R�˅�ҋ�p�uۨ䌺(�0M��)���;(/�.=�7�UWW����;�)��rݫ�U��?y��e ��p��]3�j�󣫫����Dr���MV�)�IN�H�I[Y�.�2t�G��4�Zq4;�r{k������q�^ŷ�e���>^��d�x����rIjX%��T�J�-zJz��Ji�� ]���f�	��{R�kf����%@sV�T��{���vm�u���s��������\"�2���cb��/M��D���D�3A�	A�:�\r���ƺ�������{�{no�v+ۘ��$oo���=��x��,:.Z�ƥ�C���b��1Z0D��!-~�l(�I������u<�&�Oy?�?y�uxL��������4n(�Eػ���D>�\nt�L��$K�~F�M�u�;�ǓK�u2$})bɔ@����e]1�²�u�N=M�ė�1�s�Kx~z�Ov(9�yn����#|�S\\�ǩgP\"���Pz�P�ȫ;�h��Ǧ)��gQ����2h�[a�(�hT���o���(6�eލ��T7�� ������<&����\0!A����q�W9��B�	Օ�(w��	K�;ͮ\0���{Q���If�l�*����`E�.�;����W°�m�z��q;5�jjl2QX�8��2/ѱ�{�}��@�Y`��!�:q�o#���P��@$s�iT%����F��S_?A؇D\'�Є�Yv�$�{���G�I�\n�,�\rGq��e|�Rp=��q5K^�Lv�M�	fIp��@����`\"Ɖ�G��_�u��͉I���3쀞X�g��L��p��)ܓ˰r�2��<�xu�2�b����i�\\b�x\r�l��,��Y��#�O�ZU�v����^��CqqɼN((x�:�g̞Xfp�\n��.��.`L����B���kJ��/B8X)$۹8�ѓ�1Θ��� �Ђ�d�ߝ��Y�\n���`�Z�p8�eBv��)Ļ�� �{�;�Ï>��ٺ�((-����D��b�\'�r\'�<��q���<GfYT��i�ڵ�F}}C�����$d@\nl0�E�(�310��D\"lv�����C�F�ƈLe�pZb`Gb�\n2a��h�(�O+�K��(�Ђ��IE!�#X�� 1z�Xrb铞�D��FY�֨�����2rjrx���L>�y��4vB��jS`g�\nj�\r�����C>9����7ˊ�~:�ːGY�:���)Qh\Ztf��������;��{W�C��^:�ϢUu�˦+�.E\"C����.����q��\nFA�YS�k�\"^*�e��$��4=�jj��)���^W\"������]�����v�	-6�o���l�٢Mś�Ud�\rI#�߅�m��a��-��j%n�Ѩ�^��tx1�5?y��\Zv�����7���Ѵ�q��z�[���]/��_oi���V%ϛ+�<>�.���u�sȴ,�Ҋ�rrx�v^qvwv*.^�8���j)�`�Ր�q����;��0�3�谛��7V}��@M�c�OC6 XQ�ٗ\'	\0����\0�UV��z}�y����.W�(Zm�kQ%\Z��B������������k���Js����A̶�߮j�������F����������G��#�w/744�aM$�f���Uh����D�D�]�7��T~��@���&~������,\r�iU�D��X�qA�B)`��Me�\n����I��C�;��͒��zhH����\"��������q�۳�(~��>��X��j�%Xe��F�\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0�IDATx�b���?6���>��!\"8_w0�y��$f&��U+ᒌ���_u��������c&�̦��*b\"�_�}g���;D���2����E@�a�\0b��Wo����`Cdfff`���dx�����S�����A����?uţ�W����z�\Z��^�x�����_>�2L��o޼�������i�:�Kxx�*؅PW#���ih\0��qƏ��0|������/+��[���0�ƿ����!�a���\n�\\�rX1�GD�����Hd,\\��a�����!��l?õ+�._�q�����ϟ?�oe$��8q��W����c������\ZM�������g`���Qd@�D0M�4i\'ԉ10Qj�l�\n.b\0/O$�\0/�f0����zo\"���óko�	�0�0��u\rG�,���]b`Pd�{�����CPp8}b������5�5���7��nq��>1H	�pҦ�L���>�10c������,���E\"+�B���;�e�3�b�\r��L@M��aP������7���?~0(+�F2����a3�o��_�*#�?�c�0pp�3H��0H��0(�ˀ,x�0�����-���C�_���1DEE����aM�T������f,�IG ���	m\"\n��nv7�$M���?�T\Z�Jăҋ?�H�/B+�BA���\"����A�ţ7aբ�Q�xP\ZD\"�b���m��u7ټ]��&MUS��=vyof���si�K(e}K�A�E���(�;q\rQ�@g����W>��_�ڲܝ0�ʞ\Zdr �x�~|�ut��M,<��3j�:\\M���V\\O�����S��<��h$��ċ��a�A\r*ͣ(2|KS�{?�/��o��b��Qa��W=�L&S���-f�%<E5���5\\�3�x�%ĺz18�@N=��<rB�/Y̿��,���AdY-D��I��1y�*�gF��C��TD�3������\'������ݢnCOF��F�+E.27���&u��6�\r��ؤ�~�H�h�=�n����:-���P�H7����AE�JBx��m���3s�Dm��&�\0�A�JRm��C�������b���\\[�����ء�����ǎ������S\'��?p����Չ~}5�O�>$t]��4\r\\d��G#��٘��ؽb>k�q������;K�gR���롗#?^ͱ����R�G\0ګ%��(���ۙ��*�\nhY��\n�1Ae�\n\r�Å\Zu�	��Rw�0���Vcb\"hL$jLP�X�DQ���\n�:����*�B�&w:o��ݼ;��s��\"5���y*��zmmm�D�n����4�H�f�H\Zs�!��iQ�TM�����\")+]���3�S��F�R\rr&�4�BM(E5��Pt��g2`���됯#�_��ܢ\"����w���B���if�3Xf%Z;Dا]dF����os#�$\\�rF!;Nl�S))R�ۓc��°�&a$d�?��g��N]Aw��I�N�}�#��1��}׉�-_�z�j�`I��;:�k#sO�y�9�l=��7At�`4e�J�i�b8d�AHGZ� ��W��/�e�hCM�a[Qs�H�R�����Q��b	&�8��<<kD�}�Ξ��fK<E�14!����_0߾�[�����w	�8��\nH���H�ʂ<�YK;�&��[���`�\"өGa�^��Q1R�Q��_�@�,g1��ۑ�\"?�{YSN�g���PWW\'w^oo/�B*����}D��(\Z2N�HQ���Ř1��\'����!F�Jqݿg���**vʃ��N<x����P�(\0��vY��t�P�@t8�qS�_z��q,�-<��_NN|�?�!�V�y�[L�x@�B>�:�$]4rzǙ�S<�x\\\0��Q��IH6��\Z��lA��Ȝ��������\\���Ȕ���<��R�˅�ҋ�p�uۨ䌺(�0M��)���;(/�.=�7�UWW����;�)��rݫ�U��?y��e ��p��]3�j�󣫫����Dr���MV�)�IN�H�I[Y�.�2t�G��4�Zq4;�r{k������q�^ŷ�e���>^��d�x����rIjX%��T�J�-zJz��Ji�� ]���f�	��{R�kf����%@sV�T��{���vm�u���s��������\"�2���cb��/M��D���D�3A�	A�:�\r���ƺ�������{�{no�v+ۘ��$oo���=��x��,:.Z�ƥ�C���b��1Z0D��!-~�l(�I������u<�&�Oy?�?y�uxL��������4n(�Eػ���D>�\nt�L��$K�~F�M�u�;�ǓK�u2$})bɔ@����e]1�²�u�N=M�ė�1�s�Kx~z�Ov(9�yn����#|�S\\�ǩgP\"���Pz�P�ȫ;�h��Ǧ)��gQ����2h�[a�(�hT���o���(6�eލ��T7�� ������<&����\0!A����q�W9��B�	Օ�(w��	K�;ͮ\0���{Q���If�l�*����`E�.�;����W°�m�z��q;5�jjl2QX�8��2/ѱ�{�}��@�Y`��!�:q�o#���P��@$s�iT%����F��S_?A؇D\'�Є�Yv�$�{���G�I�\n�,�\rGq��e|�Rp=��q5K^�Lv�M�	fIp��@����`\"Ɖ�G��_�u��͉I���3쀞X�g��L��p��)ܓ˰r�2��<�xu�2�b����i�\\b�x\r�l��,��Y��#�O�ZU�v����^��CqqɼN((x�:�g̞Xfp�\n��.��.`L����B���kJ��/B8X)$۹8�ѓ�1Θ��� �Ђ�d�ߝ��Y�\n���`�Z�p8�eBv��)Ļ�� �{�;�Ï>��ٺ�((-����D��b�\'�r\'�<��q���<GfYT��i�ڵ�F}}C�����$d@\nl0�E�(�310��D\"lv�����C�F�ƈLe�pZb`Gb�\n2a��h�(�O+�K��(�Ђ��IE!�#X�� 1z�Xrb铞�D��FY�֨�����2rjrx���L>�y��4vB��jS`g�\nj�\r�����C>9����7ˊ�~:�ːGY�:���)Qh\Ztf��������;��{W�C��^:�ϢUu�˦+�.E\"C����.����q��\nFA�YS�k�\"^*�e��$��4=�jj��)���^W\"������]�����v�	-6�o���l�٢Mś�Ud�\rI#�߅�m��a��-��j%n�Ѩ�^��tx1�5?y��\Zv�����7���Ѵ�q��z�[���]/��_oi���V%ϛ+�<>�.���u�sȴ,�Ҋ�rrx�v^qvwv*.^�8���j)�`�Ր�q����;��0�3�谛��7V}��@M�c�OC6 XQ�ٗ\'	\0����\0�UV��z}�y����.W�(Zm�kQ%\Z��B������������k���Js����A̶�߮j�������F����������G��#�w/744�aM$�f���Uh����D�D�]�7��T~��@���&~������,\r�iU�D��X�qA�B)`��Me�\n����I��C�;��͒��zhH����\"��������q�۳�(~��>��X��j�%Xe��F�\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(32,'sys','quickAccess_contacts.png','image/png',3101,'2013-12-14 18:15:36',3101,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0gAMA\0\0���a\0\0\0sRGB\0���\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0��\0\0u0\0\0�`\0\0:�\0\0p��Q<\0\0\0bKGD\0\0\0\0\0\0�C�\0\0\0	pHYs\0\0\na\0\0\na��J%\0\0\0	vpAg\0\0\00\0\0\00\0��W\0\0	�IDATh��[�]U�k���̽��t\n��B��N�<�0%���M�I�$6\n������!�hH�DHx$ jB	���iS��I;-e`.����3g_��þ�}fΙzyЄ~���{������.k�&��\\�k�qm����5��H\0�*�>4�����\'N�(\"��]D�<���\0�c(�K��>3yeA)���ÿ9������\r��$	BHc�Lx�2��R����v�F�q��K��c�FP4$\\���(<1\rc��4Η��b�u�ᑺ\"�y�e.�~\"Z)l[�ܛ�8:��e�\r���T?���������t�BZ��&���_G�C�����\n�4YG�hY(vi|^�ҮWD��ڶ�����E���so���طo�;�����s�����1�:��h�J�P@)��\nK),0*�H`pŠ18��V:�.\n�\n�b\",͙7�0�kÇ��f�^`ii�Ç����i�lR ��-=��JaY�{U�^u�e����I����1��C>�I���~������Tâ1�R���8!-�F��\r���)�\"�<���B��L��.���XZx�ӵ�|bO?���Ba�!�#\0�|�����1>>��pj�w�u��.gϞ��}�9���Y���U=��5���pϿ��ѵ����)r�\"�����f��C>�A�pq�4Z��`�a�Ν�CCC%���%�<�	���+�u�R\n���K�S����XݻqJ��ىK�◧���G��0]D��U&I��cZS\'\n�$6�R���P[� 0�=��4�z(;G׶���ߠ,�T��Ih|�u���|�5��P�B�R���E�#`��KP�I[�����ß`p�\0��k��(eЀD�\\Oj(��~bi��������#�:`i����%,w\rK۠<�.���\0#���[���l������p��޿R��ds�Un���ª���-q��ř�\n{{�<_(�4�����sh����5��h+��)���oCV�	�K��e^|s��C��e��=0�\"���	+��n�`�@\'��V�,y�ޞS�p���:��\\��7�X�}}9�Y[�hUo\ZZ�&A��1`i��������t�9n��zν7Τ{��a7V;1��:�c(d5ŬFL\\�\r�`i��&���\"��Y������<�,ڈ��lE!��\n[��	�Ags�~�n��E��z�f�T�jtw�Z����t\0o�_F���䐵g����0ؓ���:k�0��hw����ME�4)h�)�U�K+<Q���Q}�)�O�s�#ʶEvf��_�5�/���g����\n��Mp*�n���o(SȄ<80X �hƧ��w:�T}���<��3��4�!&������W�1OA�ei���<m�����`�l���yXJa�˨��ql��@.�l�\0��=7\rrǭ=�\"\rՓ��͹}s���1��=(����\0ƲX���_���R���G;6�mc�,���ܶхm�~��\\�\Zw��Se@k�)) ��r��M��4k6�\0�U���4�vȝy�j�D�5��%�m���m[h+�Y���,���C_1@�&Pjo�j�xk���Ŷ�������_�)8��.�2���uO�Y��:��3K.�\n������\0O���n�@,��g�BMNbJ%��m�~��RhK�-;V����Yʻ�gq~����0ܝ(��ufXX����B�#�լT[C�ќ�Xciͧ�`�P�iޟ�і�L̹x��X��U0v�[ǀ�M�m�z��(�a,>�(�%>nu���:��k��I*�ǻ-1+E�t�1��®���c ���M\Z�\r���)3M�T������{~��Sq�4s��>m�֍�i�@��bR�����c�7��D�(d�=��L������U1 U�N����\\��j����J�W]���h��7�����,պ7oa��hҒ�4��qNc��M&MW��I��ijAA��~�gSk[*Тj�s�$35��T��c���SFQ@wg���r����̕�͟[�\n�fe�X(�ꫯ�?~����E�B����G}����Ȯ�������zz:9y��cǎ�Q�T�6�Y.��\'�|�3G�福&g��h�\r���:�RY#b�ez{{�855�.�፲�T*}}ee��+sQ�E�ņHm�E�������U*�����)���ݟ���������J%^\raύ׵���*NyA \\�p�`�X<����?��?D�5o����k�\r<x�t+\n���}�Vs���`�D���yI`�A���+�d2�Ȋ���N�\\�T�#\"�{���}�sF�H@Hr�璠~=5=k�ݲ���x����O����wE���?���6\"�~�I�I���e��>u�o�������~��\0�Ǔ.,,�^�Gy�-`$���h`���1W�4<<|qtt�u��!�g�u��Z`Bk����3::z=p\'Г.��8D��[��h�����R�Ե��t�xg=�sM���^�	�Z��H*�\0\0\0%tEXtcreate-date\02009-11-15T17:02:35-07:00���\0\0\0%tEXtdate:create\02010-01-11T09:31:26-07:00�kq\0\0\0%tEXtdate:modify\02010-01-11T09:31:26-07:00n���\0\0\0gtEXtLicense\0http://creativecommons.org/licenses/by-sa/3.0/ or http://creativecommons.org/licenses/LGPL/2.1/[�<c\0\0\0%tEXtmodify-date\02009-06-03T09:58:17-06:00��AD\0\0\0tEXtSource\0Oxygen Icons���\0\0\0\'tEXtSource_URL\0http://www.oxygen-icons.org/�7��\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0gAMA\0\0���a\0\0\0sRGB\0���\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0��\0\0u0\0\0�`\0\0:�\0\0p��Q<\0\0\0bKGD\0\0\0\0\0\0�C�\0\0\0	pHYs\0\0\na\0\0\na��J%\0\0\0	vpAg\0\0\00\0\0\00\0��W\0\0	�IDATh��[�]U�k���̽��t\n��B��N�<�0%���M�I�$6\n������!�hH�DHx$ jB	���iS��I;-e`.����3g_��þ�}fΙzyЄ~���{������.k�&��\\�k�qm����5��H\0�*�>4�����\'N�(\"��]D�<���\0�c(�K��>3yeA)���ÿ9������\r��$	BHc�Lx�2��R����v�F�q��K��c�FP4$\\���(<1\rc��4Η��b�u�ᑺ\"�y�e.�~\"Z)l[�ܛ�8:��e�\r���T?���������t�BZ��&���_G�C�����\n�4YG�hY(vi|^�ҮWD��ڶ�����E���so���طo�;�����s�����1�:��h�J�P@)��\nK),0*�H`pŠ18��V:�.\n�\n�b\",͙7�0�kÇ��f�^`ii�Ç����i�lR ��-=��JaY�{U�^u�e����I����1��C>�I���~������Tâ1�R���8!-�F��\r���)�\"�<���B��L��.���XZx�ӵ�|bO?���Ba�!�#\0�|�����1>>��pj�w�u��.gϞ��}�9���Y���U=��5���pϿ��ѵ����)r�\"�����f��C>�A�pq�4Z��`�a�Ν�CCC%���%�<�	���+�u�R\n���K�S����XݻqJ��ىK�◧���G��0]D��U&I��cZS\'\n�$6�R���P[� 0�=��4�z(;G׶���ߠ,�T��Ih|�u���|�5��P�B�R���E�#`��KP�I[�����ß`p�\0��k��(eЀD�\\Oj(��~bi��������#�:`i����%,w\rK۠<�.���\0#���[���l������p��޿R��ds�Un���ª���-q��ř�\n{{�<_(�4�����sh����5��h+��)���oCV�	�K��e^|s��C��e��=0�\"���	+��n�`�@\'��V�,y�ޞS�p���:��\\��7�X�}}9�Y[�hUo\ZZ�&A��1`i��������t�9n��zν7Τ{��a7V;1��:�c(d5ŬFL\\�\r�`i��&���\"��Y������<�,ڈ��lE!��\n[��	�Ags�~�n��E��z�f�T�jtw�Z����t\0o�_F���䐵g����0ؓ���:k�0��hw����ME�4)h�)�U�K+<Q���Q}�)�O�s�#ʶEvf��_�5�/���g����\n��Mp*�n���o(SȄ<80X �hƧ��w:�T}���<��3��4�!&������W�1OA�ei���<m�����`�l���yXJa�˨��ql��@.�l�\0��=7\rrǭ=�\"\rՓ��͹}s���1��=(����\0ƲX���_���R���G;6�mc�,���ܶхm�~��\\�\Zw��Se@k�)) ��r��M��4k6�\0�U���4�vȝy�j�D�5��%�m���m[h+�Y���,���C_1@�&Pjo�j�xk���Ŷ�������_�)8��.�2���uO�Y��:��3K.�\n������\0O���n�@,��g�BMNbJ%��m�~��RhK�-;V����Yʻ�gq~����0ܝ(��ufXX����B�#�լT[C�ќ�Xciͧ�`�P�iޟ�і�L̹x��X��U0v�[ǀ�M�m�z��(�a,>�(�%>nu���:��k��I*�ǻ-1+E�t�1��®���c ���M\Z�\r���)3M�T������{~��Sq�4s��>m�֍�i�@��bR�����c�7��D�(d�=��L������U1 U�N����\\��j����J�W]���h��7�����,պ7oa��hҒ�4��qNc��M&MW��I��ijAA��~�gSk[*Тj�s�$35��T��c���SFQ@wg���r����̕�͟[�\n�fe�X(�ꫯ�?~����E�B����G}����Ȯ�������zz:9y��cǎ�Q�T�6�Y.��\'�|�3G�福&g��h�\r���:�RY#b�ez{{�855�.�፲�T*}}ee��+sQ�E�ņHm�E�������U*�����)���ݟ���������J%^\raύ׵���*NyA \\�p�`�X<����?��?D�5o����k�\r<x�t+\n���}�Vs���`�D���yI`�A���+�d2�Ȋ���N�\\�T�#\"�{���}�sF�H@Hr�璠~=5=k�ݲ���x����O����wE���?���6\"�~�I�I���e��>u�o�������~��\0�Ǔ.,,�^�Gy�-`$���h`���1W�4<<|qtt�u��!�g�u��Z`Bk����3::z=p\'Г.��8D��[��h�����R�Ե��t�xg=�sM���^�	�Z��H*�\0\0\0%tEXtcreate-date\02009-11-15T17:02:35-07:00���\0\0\0%tEXtdate:create\02010-01-11T09:31:26-07:00�kq\0\0\0%tEXtdate:modify\02010-01-11T09:31:26-07:00n���\0\0\0gtEXtLicense\0http://creativecommons.org/licenses/by-sa/3.0/ or http://creativecommons.org/licenses/LGPL/2.1/[�<c\0\0\0%tEXtmodify-date\02009-06-03T09:58:17-06:00��AD\0\0\0tEXtSource\0Oxygen Icons���\0\0\0\'tEXtSource_URL\0http://www.oxygen-icons.org/�7��\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(33,'sys','quickAccess_makePayment.png','image/png',5142,'2013-12-14 18:15:36',5142,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0�IDATx�b���?6�����_�~2�ݙ�A�����wǎ?��	$+�{���9�|R=� <�AR\\��q��y{�9D�xtԬ>��� ##���z���[�.�����ݙ��}��(3� �@�8]���}0ce���7�a�i����, ���4}a�c:�����!3;�?��u��x��������v���I`\0��������>��������;}�\Z\"s\0�����?}��	h�?�;�\Z@����������\Z����p�����gTtfx��7�A�}*����~�00��f��`�v��0D##C��O�_��0��6��޻��uM�<���e�9�9Ö��ʙ%�w���m���2������BC������ۃ��b3ߝ�[S6M]{�%0E%\n�_�����S}A��}�7���J���\0 �5�����4���k�S�\r��~�����۷�<���0C9ع��u���������oܼ���+g�~�����������P�A�����v�����u�A�|6���#�`�;:�2��nda��nÇ���)�1�{1�\0�q1ý�Y�*���_�����۷os�m���מ���U����0��#����-�f�cN�{�9�0|���p��u#�O���-K��������N��߼������\"�;d3�7	��Z\rd8��[g\\]��z�p��q{7P�fX�t1�	�?Ueh�5��[����Ȳ����������� \'�ɐ_��g��[P��խ�?�fm=����4�޲w���$��<�\\kÜ��N��O(r9YXX|AΥJ�\0@\\Ն4����nw\Z��r:�$��b�b�D����E\Z�2�(	##�1����ʢ2���t�*r��hS�e��w���}v�6	��?���s�����>�Y���y��%���B�|��>xz��ŋ��kFV���\'����\Z�-*�(.*����r����^]�@���Ѵd%\"|���64�!)+,��:�*���*����\'Ϻ WD�jv 7{3�L#�4<�W�^��5\\�#\0^���0|�#H\n�S�p�1ABӄ\Z\"b}��T�]��G;�����\rJx<����&*�+�r��Wߴp)f�t��=�8X��<5���,nȒ\'���9��9��AY=�`�I�΀Pa4b�Q8g�p��8����`#5e���5ko��(�r�HJHA�|5��p8�`m�������8��4�J��Z�HIUb�m�F�	a25va�c�2�C�����L#�.{M�c�SEE�ck���+­�7�6!>ĳ��%��d���;m���짼(�Q�ڪx�7�i�B��=��d=��qB |TY�vM徲]~/��t,MawLA@\Z��9.��a�I����u�\\oE_��,�얇\'�G-��^*�����NzFr��S�Ua�HB��${��\r�@�����z� �|�߶��l�-rc|�=^j۱����[��f�t���U�w��kJ��X�D�sx��-��7��U��k�i��ϡ��Pd�a�&�%uN��,�e������M�`�mN�L��l&[\"q8�\r/q�-�(,�:�Q.s�hE��\\zA)-��޽��tK�1�Ǘ�4_��;��>�s�:���.�_�M=�<\"vܵC\'���KU����rw�	!�8���M,W��.�9��`�4�v�������q�{JJ-�q��ҭ��R��w\"%)�4/#�\r�t�N=1\0��{n������!��O����Ͳ�br�#$$��?>46]@�R���K*�B�VPb0?@��LX|LF`0K:#���9��H�|��@����Y�S�H�6���a�F����K�T�[����o� {�1s���cԔ�g3�e�(�1D�l����G��z0��s6��mpޛ@��\")Q�����;N����TH�Q���/�����y�����6h\r��(�9y|��rN �]�:0N5��nM�ۅk�L�~�m\"K�v�g�ı�Jꆢƴ��j�#1i����<���#�k*���R��A�P����x��^\\_��q��וmHN����U��I��1\0���V/)�z.(:�>\'�A	P�]$jC����\'�;8�E�߿���3g�����ޣ6���P\'d)D��G\Za�Z!��`Bh(f��AL�n3��Q9�΅��E}�vuP?:�K��d.]�L�}m\n�͞����l+�E3��ֆ�c�������I���Oi��A\Z����u�ô���ɰ�ܐ<�FN��w�����z�����<�5n��/�0�պ��(i4B�&�ј�����ҩ����JA��Zn.||��<�����˭�K�ǇE�P{;`��q��-�9-̹��7���n���ϏEtD�,\'C1a�U�WN8NH$���x�B���G�Ƃ-��`�g��սp<ӆۿ����L�<ع�cwiO7v[�6X,6�G�7%����v\rK/G�X��a�U*��o�����,�ٹ�t����EY�JY8ۛ��v�C�z\0����X	����{����pb��--��=J�7&�/ƪ�$+����Vb�+�`�f1����VQP�xŧ[ח$OOX,vx�m�@f�@eC�,	:�����S�!�7�=�V^8�S��z4kM�r�C_��y3i�7�*��~%�t���(���V�AùF\nTC��Fp�ĥw]��R&f	1T��lC����<���k!\r٢eYe�Eo�9�Np�w��]ԝ��f@�;�RHs�-�c��<q�&\nh��Ί�_U��}�f�;#s��~[Hc2���?s=./��I��3���	��T�\0�YkL[�~|9�_!�M!8�BiHsY.di3�&��ti�i��jڴ��c?V���i��6�%�VEm�MI�TZ�\r.�d!�@ ��Ř�\r�������&B]æ��4����s|�{�����z����G����EH��d�ͪXg&�ע b����т�%G�^���(�3í��V���;8Nvt�=�vk{�%��|�KJ��e�L��������S*��ir!�o5g\0�j+F��(�@��D&��a�����u_Z���6G�K��]oy����oY7�Ҿ_(�j���w�z������)�l߶���%�Ry���S��] ��y ���ZX�X%�,�ɱ���������h��J�w�����W.�������F�B��B��v�M�o��X\n0�vaq1 �y=6]�m,Fo_/�7L����M��K2��L���י�W y��˖=O�A\'\\��+^y�ר��0癅kh�d�}Z�̇(T��1�E�r�1��<����0\Zs�Uk�L�0������+)\'A\"��AoD�{F�ot4!\n���F�ֶV\"�)�:y\Z����������@�晀J�4p�����-]$�e��a�j�\"�����߄�<N,�MP�6G��L�\'Q!�+��x9��H3&��6������D?)�0�����\rt��(�U�a����EPD��?E�`ך�B�\'j������@8fd�\Znpl(����L	��E�.x���Ї�(�&��%��>�tMhA�A��@Q4\r����zy1��\"�L�@C���mص�0�E!<Q]��\\��>��/��&�=#���Β�d�~$��3i��?MTe},�!c\n��c|�[�}����L\"���R���	�a�B#@$��� �`Ӑw4PHP(x+Ũ��k�E���=9X��|m��2�>�u�\'����P�������I���c򇆐D,�H2��<��ǀ�w�a��	���;L�&PJ`�=��t�����#8&�s$������$l�|�n��L�tYA\n���Bb}j�����Fn��]�B�l�D�Ũ<G	HFX.x&��/g�p�|����.����3N���{�}\"ϴ��Ze�v�~��x�b�\n�\Z��B=f���Ʉ���Ҍ��.x���*A�]HV�������PQ�<&a.c��4�9�Yji-4��o\\�c�T�b*�}Ռ-�{��띝\n�CB2�i�0r �L�M���������M�!N�ڃ-�\n��q���Mģ6�z.�����Pm�g�)�%���`��~��`�|>�Ka�wZ�VH֎��^\\�/Bg��G��]�d�C��%�R,�ct�����^Ď�&V�d>i�����R\'³Ǐ�\\P�LJ�>�]tu߂�7G�\0v��¾�:�2RJJ�he�!a�u�<�#���X\"�~W����&��[�y^RD������~�����v�R�E��%5��L���]Vp/m^�X��	��ܻ?�3u�zc��R\"��B���P�_Du�H�ڃ7ۨ�\rQePb+�W����,�?*̺���n��sS3nbc�|��BIl�RM���{�z��ٟ��S2+Hh�]�4�H`�#����H�������N���Zw���<	���ʉ\Z��F)���r�l%�)XL\n��gE0B\'y���\"KK�����0�<�5��b��$�\n�?w�uQ�s�>�z���2)�g��~5��ZQ��0le>����f�E����v��=����)�XZ�I��2V.����b�QM��e�;�4�sa)(f,��P���������/}�sS���ۘ���c�YmZ�Xx�p�ڕ��y�n+8�3\Z\0�\r���<�V�T�����\'��E�-�r/F�r�Z���=�\'��Զ�*�^kD2�F��0{9\'�HI��KZ���[���`�A��ƆR��~�m�\Z<���o���[u��L���԰��u����C=�0� �*�f�r�喣�������+��V\n)	��uO1e�jh0����f�\'(3���\0�o;���Y\\�~p�=�N�Y�|����QQV!I�T!_�W��[�ܑ�u[�*5j�F�6;𚝙C�_�����i�F[�e>\Zo�V���l4ņ�����2�5^�f���������c��m��?��Wf�Zo�*�J�g_Ȏ���j�p���8d�K�5V�|ZN�?W���%�}��\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0�IDATx�b���?6�����_�~2�ݙ�A�����wǎ?��	$+�{���9�|R=� <�AR\\��q��y{�9D�xtԬ>��� ##���z���[�.�����ݙ��}��(3� �@�8]���}0ce���7�a�i����, ���4}a�c:�����!3;�?��u��x��������v���I`\0��������>��������;}�\Z\"s\0�����?}��	h�?�;�\Z@����������\Z����p�����gTtfx��7�A�}*����~�00��f��`�v��0D##C��O�_��0��6��޻��uM�<���e�9�9Ö��ʙ%�w���m���2������BC������ۃ��b3ߝ�[S6M]{�%0E%\n�_�����S}A��}�7���J���\0 �5�����4���k�S�\r��~�����۷�<���0C9ع��u���������oܼ���+g�~�����������P�A�����v�����u�A�|6���#�`�;:�2��nda��nÇ���)�1�{1�\0�q1ý�Y�*���_�����۷os�m���מ���U����0��#����-�f�cN�{�9�0|���p��u#�O���-K��������N��߼������\"�;d3�7	��Z\rd8��[g\\]��z�p��q{7P�fX�t1�	�?Ueh�5��[����Ȳ����������� \'�ɐ_��g��[P��խ�?�fm=����4�޲w���$��<�\\kÜ��N��O(r9YXX|AΥJ�\0@\\Ն4����nw\Z��r:�$��b�b�D����E\Z�2�(	##�1����ʢ2���t�*r��hS�e��w���}v�6	��?���s�����>�Y���y��%���B�|��>xz��ŋ��kFV���\'����\Z�-*�(.*����r����^]�@���Ѵd%\"|���64�!)+,��:�*���*����\'Ϻ WD�jv 7{3�L#�4<�W�^��5\\�#\0^���0|�#H\n�S�p�1ABӄ\Z\"b}��T�]��G;�����\rJx<����&*�+�r��Wߴp)f�t��=�8X��<5���,nȒ\'���9��9��AY=�`�I�΀Pa4b�Q8g�p��8����`#5e���5ko��(�r�HJHA�|5��p8�`m�������8��4�J��Z�HIUb�m�F�	a25va�c�2�C�����L#�.{M�c�SEE�ck���+­�7�6!>ĳ��%��d���;m���짼(�Q�ڪx�7�i�B��=��d=��qB |TY�vM徲]~/��t,MawLA@\Z��9.��a�I����u�\\oE_��,�얇\'�G-��^*�����NzFr��S�Ua�HB��${��\r�@�����z� �|�߶��l�-rc|�=^j۱����[��f�t���U�w��kJ��X�D�sx��-��7��U��k�i��ϡ��Pd�a�&�%uN��,�e������M�`�mN�L��l&[\"q8�\r/q�-�(,�:�Q.s�hE��\\zA)-��޽��tK�1�Ǘ�4_��;��>�s�:���.�_�M=�<\"vܵC\'���KU����rw�	!�8���M,W��.�9��`�4�v�������q�{JJ-�q��ҭ��R��w\"%)�4/#�\r�t�N=1\0��{n������!��O����Ͳ�br�#$$��?>46]@�R���K*�B�VPb0?@��LX|LF`0K:#���9��H�|��@����Y�S�H�6���a�F����K�T�[����o� {�1s���cԔ�g3�e�(�1D�l����G��z0��s6��mpޛ@��\")Q�����;N����TH�Q���/�����y�����6h\r��(�9y|��rN �]�:0N5��nM�ۅk�L�~�m\"K�v�g�ı�Jꆢƴ��j�#1i����<���#�k*���R��A�P����x��^\\_��q��וmHN����U��I��1\0���V/)�z.(:�>\'�A	P�]$jC����\'�;8�E�߿���3g�����ޣ6���P\'d)D��G\Za�Z!��`Bh(f��AL�n3��Q9�΅��E}�vuP?:�K��d.]�L�}m\n�͞����l+�E3��ֆ�c�������I���Oi��A\Z����u�ô���ɰ�ܐ<�FN��w�����z�����<�5n��/�0�պ��(i4B�&�ј�����ҩ����JA��Zn.||��<�����˭�K�ǇE�P{;`��q��-�9-̹��7���n���ϏEtD�,\'C1a�U�WN8NH$���x�B���G�Ƃ-��`�g��սp<ӆۿ����L�<ع�cwiO7v[�6X,6�G�7%����v\rK/G�X��a�U*��o�����,�ٹ�t����EY�JY8ۛ��v�C�z\0����X	����{����pb��--��=J�7&�/ƪ�$+����Vb�+�`�f1����VQP�xŧ[ח$OOX,vx�m�@f�@eC�,	:�����S�!�7�=�V^8�S��z4kM�r�C_��y3i�7�*��~%�t���(���V�AùF\nTC��Fp�ĥw]��R&f	1T��lC����<���k!\r٢eYe�Eo�9�Np�w��]ԝ��f@�;�RHs�-�c��<q�&\nh��Ί�_U��}�f�;#s��~[Hc2���?s=./��I��3���	��T�\0�YkL[�~|9�_!�M!8�BiHsY.di3�&��ti�i��jڴ��c?V���i��6�%�VEm�MI�TZ�\r.�d!�@ ��Ř�\r�������&B]æ��4����s|�{�����z����G����EH��d�ͪXg&�ע b����т�%G�^���(�3í��V���;8Nvt�=�vk{�%��|�KJ��e�L��������S*��ir!�o5g\0�j+F��(�@��D&��a�����u_Z���6G�K��]oy����oY7�Ҿ_(�j���w�z������)�l߶���%�Ry���S��] ��y ���ZX�X%�,�ɱ���������h��J�w�����W.�������F�B��B��v�M�o��X\n0�vaq1 �y=6]�m,Fo_/�7L����M��K2��L���י�W y��˖=O�A\'\\��+^y�ר��0癅kh�d�}Z�̇(T��1�E�r�1��<����0\Zs�Uk�L�0������+)\'A\"��AoD�{F�ot4!\n���F�ֶV\"�)�:y\Z����������@�晀J�4p�����-]$�e��a�j�\"�����߄�<N,�MP�6G��L�\'Q!�+��x9��H3&��6������D?)�0�����\rt��(�U�a����EPD��?E�`ך�B�\'j������@8fd�\Znpl(����L	��E�.x���Ї�(�&��%��>�tMhA�A��@Q4\r����zy1��\"�L�@C���mص�0�E!<Q]��\\��>��/��&�=#���Β�d�~$��3i��?MTe},�!c\n��c|�[�}����L\"���R���	�a�B#@$��� �`Ӑw4PHP(x+Ũ��k�E���=9X��|m��2�>�u�\'����P�������I���c򇆐D,�H2��<��ǀ�w�a��	���;L�&PJ`�=��t�����#8&�s$������$l�|�n��L�tYA\n���Bb}j�����Fn��]�B�l�D�Ũ<G	HFX.x&��/g�p�|����.����3N���{�}\"ϴ��Ze�v�~��x�b�\n�\Z��B=f���Ʉ���Ҍ��.x���*A�]HV�������PQ�<&a.c��4�9�Yji-4��o\\�c�T�b*�}Ռ-�{��띝\n�CB2�i�0r �L�M���������M�!N�ڃ-�\n��q���Mģ6�z.�����Pm�g�)�%���`��~��`�|>�Ka�wZ�VH֎��^\\�/Bg��G��]�d�C��%�R,�ct�����^Ď�&V�d>i�����R\'³Ǐ�\\P�LJ�>�]tu߂�7G�\0v��¾�:�2RJJ�he�!a�u�<�#���X\"�~W����&��[�y^RD������~�����v�R�E��%5��L���]Vp/m^�X��	��ܻ?�3u�zc��R\"��B���P�_Du�H�ڃ7ۨ�\rQePb+�W����,�?*̺���n��sS3nbc�|��BIl�RM���{�z��ٟ��S2+Hh�]�4�H`�#����H�������N���Zw���<	���ʉ\Z��F)���r�l%�)XL\n��gE0B\'y���\"KK�����0�<�5��b��$�\n�?w�uQ�s�>�z���2)�g��~5��ZQ��0le>����f�E����v��=����)�XZ�I��2V.����b�QM��e�;�4�sa)(f,��P���������/}�sS���ۘ���c�YmZ�Xx�p�ڕ��y�n+8�3\Z\0�\r���<�V�T�����\'��E�-�r/F�r�Z���=�\'��Զ�*�^kD2�F��0{9\'�HI��KZ���[���`�A��ƆR��~�m�\Z<���o���[u��L���԰��u����C=�0� �*�f�r�喣�������+��V\n)	��uO1e�jh0����f�\'(3���\0�o;���Y\\�~p�=�N�Y�|����QQV!I�T!_�W��[�ܑ�u[�*5j�F�6;𚝙C�_�����i�F[�e>\Zo�V���l4ņ�����2�5^�f���������c��m��?��Wf�Zo�*�J�g_Ȏ���j�p���8d�K�5V�|ZN�?W���%�}��\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(34,'sys','quickAccess_messages.png','image/png',5270,'2013-12-14 18:15:36',5270,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\" xmpMM:DocumentID=\"xmp.did:F20F5CD465B911E08F52CDC811356623\" xmpMM:InstanceID=\"xmp.iid:F20F5CD365B911E08F52CDC811356623\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:74BDB0A2B665E0118CE4B767506F182C\" stRef:documentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>^*|*\0\0�IDATx�b���?��<+�`6#���d�4\0�x���A~	&FFF��Y��b�pK����_E�@��W�d`�`cЖaf��e����_�D��t�_10�������?�\0�y�΁�IiF�A���+P\\���ҹ���$_�����(���ԅ�vm�Ϡf�������R�$��������򏁏������\\�1��d���!�KP��/X@\01�\\��n�����/�\'o��/�Z���ʻ�O�\n\n0��,܌`�u���_KA���*�Nl|w��cHsF�z���ׯߐ�-s�t*�\n\Z3���dPp�f8y�=ò������]א����\r�,���3�<?� �n�`�\'������O>�b��a������d�00H\0�	�\0%���0�?��B�0mInVA�źԥNAt��	�\Z�\":w��)�.�(#)!�&������4��*�sxg�?���.��]q=�����۞���#������,����`Γo�0����a�pK���Q\"�9�i33i��0JG��uw/ohӲ��s	�;H$��q��A��im1	�H���mF1�Gl)�tf��2.�T��&n*������=�С�k9D�0n?L(AD�qPEE��\rӭַ��:0�e~�Fz:����CaQ�Q(�Ѧ:�	U��\Z��<�P\\�C7y!��J���T�%��^�;�_/��^�6���/Rq������P�?�;�@i��4E���V[�B�L��X�ZD�|��.\\�1qe��1Qj�&6F�J]7&ƍ?v�H�`@1>��D�J[��R�ߴtZ\"4x���̛������$.��bM;�x�=���\\8�c!���~wj��|�w�t�/�|\0�1q�P�G��\rШ�^�0�5�7&Ϩu�ݛ\'�7��M����{�A��[��(��%^���tl����Mdje2o�A�&k���o~��{��z瓑�rF�ə0\Z5�#�Q�\"��N�ݵU`\rL^l��v[U�-��H�0��f�V3�^���͎:�~�4WBI�T\0�a�>|�F{k��\Z1�oA9^z�8�4�ͥ��g��*E)t����Kp�;\nS���}���tO 0�吱06CWO�%��Zd��öE�6c�O4���j\0*�߿B�8���Y%�JK@1�3��\0zUi).kJ���sxOe3!S����43���r�߂w�+G`/\'(�`F�XZ-H�G\'*D�I�q;�%�۪����>��D�hz�f#�-����B;�\rL\r>��c0�L`F��QB�Yp��ht�@��K��W���\Z��C�X��m@�<^3��ae�b���xw�t�����|*\r��\r�8���D��\\�?�b=M򠇂�?,����+\0����F��ݵ׎����8I�&vb�\r�J�DRQP�R��R!�D�@#�/������<�D�P�rU�*��(�ڪ���B�bŎ��Ƿ�2g�8ns9��2�g�93s���Sv��Xi�g.ei���Z��NS���zW�]-�LG�9_\r�r�;�+��T�ҁ�������tZ�Zù�Y��@0t����f4��챆\Z�z�L�<���h\n7|ˉ۾���_\Z�m��v���b	|޾ROQkv���va|tz�[��1Ћ|�l�ѹma;�h�Y[���E_<?7��d1S�c��ٜ�l���F�9��������9O?�X.�� �2�����ȤSİ��˳w��w�^gZ\Z��q����:<��M�u�+�9{�h�����yj�c��$���`�vS��A0p�4u��,z{��3(�:���T����%W2�{�Ƭ�!�_~v�k����Љ!)u�\'�T���M��8�F2�l�t�1趪}QI���tL�z�5\\�hl+k\n��ԣ��l�C�h�T�\r+I#|�	(�ѼO�[p��n*8Y���\\\n^L)0h����hj¾.4��ʫpRF8���`�`��W�8.�x36\"r5��m�A�QO�a�����o.�[^/т\Zƕ\rU<�EyT�d���4�d@\\����v:I�g��-��49v�4Z99\r��Ԩ��&����B\'K F�t�A�6�^��o��[����-pM\'����Ӎ��}�SWI3�<�MlJ?��� \0.F�瀺S�J��V\\��c%�Qݔ��. ��#j�1���g��8H:lSL�\rI�=���shnk�\"����P�S� �\"�B6g���������vj��I���AQ��ģaL_�cO�R����@����\\+�TY,럜B糿�xW�})��！��=0%d�q,-�1��s�Lf���W��9����V}L{��G^M�������՟�i��Z0���j�!����(C��0���k\ZѨ�?A���b}rg�Ǒ8ҏ�g9��(j\Z��BE�9%��[�rD�F�H�0�ގ��b\Z����,� ��ni2x\\RN�1v�Z���%@s�\Z�T��Ӟv����]۱���m�e�\"lA&A������%F5�1Q�&^/���C�� �8�\0d\\\\�&c[7��ۺ��9���ZF�l���%��zzr��|�{y����Ei�E4\\�ښ�;��/\r�Ķ�\Z{?�I�X��)��7�x��q�CnXYm��P���\n$��ee�	�Ns��m�L�g��p��[� �	Y�?Ҙ����e5n�MN�7�ɴ�J���2�!�Մi��oPF\Z\'�vnd\nLi��P��lsGH+�f�\02Z�s�[hu���âGm�vJ�y	���S9�\"I�D��Xxb�X$�:s���6�%I��r��!�H$���+�`�`<��W�m F�1��m,����绶�\\���^Wj�g;w1�ke�����1`��I�E.��CS��jkN�u�\Z�2���<�����P։���}��o��z,�\0�W��*�D�U\"��IK���Fǆu�Ye��n��=u�k���@.��6�B�/��O2� \02�?�h5i�N=�\nv/ө]t���gKN���ז��|��߄�\'#h�M��͓4�H$q��i�8u�\0�p�]�{1��P�d�sb���d.�LZ��*ϕ��vSp��[�\r�`�׊��S�o����ف���zll\"\Z\Z�;�����`\Z�|�ؽ��m &��-�.I�r�S�i	�X\Z�d^g�D���D7�.*������`�l�u��y�\0�h��*�b���b�)�-\r�ڃ��\0ꖷ\".��ǿ\\m�1���>�W�ӳ[��x��2�$+�I���nx�q���\0֯�cE�;�>�U�, 1�\'d��i��/�}�Q�+܌xd6i4�dO�\'���g���\0��(w	�e�h5���-\nley\0���F�~���>�J}��iF�N��,���ހk��˪����\rUַXi�uEʙ�/թ�<��2\09�\0$?�p�X��\Z��~,�Hc�]�&h�:\rF2�¤�HYY��*�t<��(�UŎĕ�(�������������1\'��ւ����~;���<�j�B�|IS�0��}�y$\Z�\"K�.V���2ټ�J���Nʈ�jLZ�$��<dk ��;�\\�	.\nIɌLא�HQ\\�����ʪ��N�p��|j=���I^�)���4�oU�j��G&E:1�&mKr?˸��TaU�Z����p3-B�0�\\>NR��e02<������~�J��Y���G.�粢~�fJ�c��TJ}���as���o�_o��};�h��ҧ\Z�wh���]E������̀PIA�<��?�q1:�;�mR��e�^��z�(U��N��#C�&a�(�t*`�,T��L\"��M�8Ӽ\Z��a���]ذ�6��j [�D���%_N������C�R��;�VoP��|���r-b�O�k��]j��T %I�ԅԷ�	L����.[����\".��hO\'a��^X.��uhjn�\"f���g�˔�ҐRS�\"D.#�����g�L�jq^��mf�P�4a��4~9~5U�9̷�S����L��_B��#��zA�����hc0�����6>�*����>�<��]�(�s��D��Ci5<�&3�^�5^���MŇ�+�_,��7��(�+�;y�j���ΦΖW�k02E�00�Tg���9�=N�_RN��`?{����A\n�(��U�Њ�ly��nd�B@ɿb8�?����[������g0B4��|Τ�q�y�x�?���~�)5�{\\z!�����5�@Q��K	p~�xh��{�&�\"����)R�~�\Z.���7��X@Ԁ��\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\" xmpMM:DocumentID=\"xmp.did:F20F5CD465B911E08F52CDC811356623\" xmpMM:InstanceID=\"xmp.iid:F20F5CD365B911E08F52CDC811356623\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:74BDB0A2B665E0118CE4B767506F182C\" stRef:documentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>^*|*\0\0�IDATx�b���?��<+�`6#���d�4\0�x���A~	&FFF��Y��b�pK����_E�@��W�d`�`cЖaf��e����_�D��t�_10�������?�\0�y�΁�IiF�A���+P\\���ҹ���$_�����(���ԅ�vm�Ϡf�������R�$��������򏁏������\\�1��d���!�KP��/X@\01�\\��n�����/�\'o��/�Z���ʻ�O�\n\n0��,܌`�u���_KA���*�Nl|w��cHsF�z���ׯߐ�-s�t*�\n\Z3���dPp�f8y�=ò������]א����\r�,���3�<?� �n�`�\'������O>�b��a������d�00H\0�	�\0%���0�?��B�0mInVA�źԥNAt��	�\Z�\":w��)�.�(#)!�&������4��*�sxg�?���.��]q=�����۞���#������,����`Γo�0����a�pK���Q\"�9�i33i��0JG��uw/ohӲ��s	�;H$��q��A��im1	�H���mF1�Gl)�tf��2.�T��&n*������=�С�k9D�0n?L(AD�qPEE��\rӭַ��:0�e~�Fz:����CaQ�Q(�Ѧ:�	U��\Z��<�P\\�C7y!��J���T�%��^�;�_/��^�6���/Rq������P�?�;�@i��4E���V[�B�L��X�ZD�|��.\\�1qe��1Qj�&6F�J]7&ƍ?v�H�`@1>��D�J[��R�ߴtZ\"4x���̛������$.��bM;�x�=���\\8�c!���~wj��|�w�t�/�|\0�1q�P�G��\rШ�^�0�5�7&Ϩu�ݛ\'�7��M����{�A��[��(��%^���tl����Mdje2o�A�&k���o~��{��z瓑�rF�ə0\Z5�#�Q�\"��N�ݵU`\rL^l��v[U�-��H�0��f�V3�^���͎:�~�4WBI�T\0�a�>|�F{k��\Z1�oA9^z�8�4�ͥ��g��*E)t����Kp�;\nS���}���tO 0�吱06CWO�%��Zd��öE�6c�O4���j\0*�߿B�8���Y%�JK@1�3��\0zUi).kJ���sxOe3!S����43���r�߂w�+G`/\'(�`F�XZ-H�G\'*D�I�q;�%�۪����>��D�hz�f#�-����B;�\rL\r>��c0�L`F��QB�Yp��ht�@��K��W���\Z��C�X��m@�<^3��ae�b���xw�t�����|*\r��\r�8���D��\\�?�b=M򠇂�?,����+\0����F��ݵ׎����8I�&vb�\r�J�DRQP�R��R!�D�@#�/������<�D�P�rU�*��(�ڪ���B�bŎ��Ƿ�2g�8ns9��2�g�93s���Sv��Xi�g.ei���Z��NS���zW�]-�LG�9_\r�r�;�+��T�ҁ�������tZ�Zù�Y��@0t����f4��챆\Z�z�L�<���h\n7|ˉ۾���_\Z�m��v���b	|޾ROQkv���va|tz�[��1Ћ|�l�ѹma;�h�Y[���E_<?7��d1S�c��ٜ�l���F�9��������9O?�X.�� �2�����ȤSİ��˳w��w�^gZ\Z��q����:<��M�u�+�9{�h�����yj�c��$���`�vS��A0p�4u��,z{��3(�:���T����%W2�{�Ƭ�!�_~v�k����Љ!)u�\'�T���M��8�F2�l�t�1趪}QI���tL�z�5\\�hl+k\n��ԣ��l�C�h�T�\r+I#|�	(�ѼO�[p��n*8Y���\\\n^L)0h����hj¾.4��ʫpRF8���`�`��W�8.�x36\"r5��m�A�QO�a�����o.�[^/т\Zƕ\rU<�EyT�d���4�d@\\����v:I�g��-��49v�4Z99\r��Ԩ��&����B\'K F�t�A�6�^��o��[����-pM\'����Ӎ��}�SWI3�<�MlJ?��� \0.F�瀺S�J��V\\��c%�Qݔ��. ��#j�1���g��8H:lSL�\rI�=���shnk�\"����P�S� �\"�B6g���������vj��I���AQ��ģaL_�cO�R����@����\\+�TY,럜B糿�xW�})��！��=0%d�q,-�1��s�Lf���W��9����V}L{��G^M�������՟�i��Z0���j�!����(C��0���k\ZѨ�?A���b}rg�Ǒ8ҏ�g9��(j\Z��BE�9%��[�rD�F�H�0�ގ��b\Z����,� ��ni2x\\RN�1v�Z���%@s�\Z�T��Ӟv����]۱���m�e�\"lA&A������%F5�1Q�&^/���C�� �8�\0d\\\\�&c[7��ۺ��9���ZF�l���%��zzr��|�{y����Ei�E4\\�ښ�;��/\r�Ķ�\Z{?�I�X��)��7�x��q�CnXYm��P���\n$��ee�	�Ns��m�L�g��p��[� �	Y�?Ҙ����e5n�MN�7�ɴ�J���2�!�Մi��oPF\Z\'�vnd\nLi��P��lsGH+�f�\02Z�s�[hu���âGm�vJ�y	���S9�\"I�D��Xxb�X$�:s���6�%I��r��!�H$���+�`�`<��W�m F�1��m,����绶�\\���^Wj�g;w1�ke�����1`��I�E.��CS��jkN�u�\Z�2���<�����P։���}��o��z,�\0�W��*�D�U\"��IK���Fǆu�Ye��n��=u�k���@.��6�B�/��O2� \02�?�h5i�N=�\nv/ө]t���gKN���ז��|��߄�\'#h�M��͓4�H$q��i�8u�\0�p�]�{1��P�d�sb���d.�LZ��*ϕ��vSp��[�\r�`�׊��S�o����ف���zll\"\Z\Z�;�����`\Z�|�ؽ��m &��-�.I�r�S�i	�X\Z�d^g�D���D7�.*������`�l�u��y�\0�h��*�b���b�)�-\r�ڃ��\0ꖷ\".��ǿ\\m�1���>�W�ӳ[��x��2�$+�I���nx�q���\0֯�cE�;�>�U�, 1�\'d��i��/�}�Q�+܌xd6i4�dO�\'���g���\0��(w	�e�h5���-\nley\0���F�~���>�J}��iF�N��,���ހk��˪����\rUַXi�uEʙ�/թ�<��2\09�\0$?�p�X��\Z��~,�Hc�]�&h�:\rF2�¤�HYY��*�t<��(�UŎĕ�(�������������1\'��ւ����~;���<�j�B�|IS�0��}�y$\Z�\"K�.V���2ټ�J���Nʈ�jLZ�$��<dk ��;�\\�	.\nIɌLא�HQ\\�����ʪ��N�p��|j=���I^�)���4�oU�j��G&E:1�&mKr?˸��TaU�Z����p3-B�0�\\>NR��e02<������~�J��Y���G.�粢~�fJ�c��TJ}���as���o�_o��};�h��ҧ\Z�wh���]E������̀PIA�<��?�q1:�;�mR��e�^��z�(U��N��#C�&a�(�t*`�,T��L\"��M�8Ӽ\Z��a���]ذ�6��j [�D���%_N������C�R��;�VoP��|���r-b�O�k��]j��T %I�ԅԷ�	L����.[����\".��hO\'a��^X.��uhjn�\"f���g�˔�ҐRS�\"D.#�����g�L�jq^��mf�P�4a��4~9~5U�9̷�S����L��_B��#��zA�����hc0�����6>�*����>�<��]�(�s��D��Ci5<�&3�^�5^���MŇ�+�_,��7��(�+�;y�j���ΦΖW�k02E�00�Tg���9�=N�_RN��`?{����A\n�(��U�Њ�ly��nd�B@ɿb8�?����[������g0B4��|Τ�q�y�x�?���~�)5�{\\z!�����5�@Q��K	p~�xh��{�&�\"����)R�~�\Z.���7��X@Ԁ��\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(35,'sys','quickAccess_placeAd.png','image/png',5352,'2013-12-14 18:15:36',5352,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0�IDATx�b���?6�\":::���00��0pqr1���00�����死�yyy~������������\02���{��~x��޺y󿧷�&�Q���`8r�P�o����B^At cYy�+�-��\0���Ν;���՛�2r��j����\"\"\"��7o������������L��=����\"b�L<�.e�t�*Ì��>�ݢ5:��\Z�Z���׮�\0��	�\" Pa�S� ���X����p���?��\n��_<e��g���?����1|�����o߾�������}a�a�������H�^��a���~.��z\Z@�x��c��W�>�a���ß?@�t�t._�����[����ve�+���2k�,�����}��5����XX�������������>�y�r���������x=\rt(r�������Y\Z��𷻹v7��,�fE��\01�`���������c+���Z\nb5��l� ����=��&ZX80ś7��f�7�����2븸��X�Ah�x��B�#DQ�����pm��[�uX�%x�}\"�rO��p�4���xWU����F�R���E��M�sk��\0LC���r�nj%Ʊ��v\r�P��\'�ò��F��*�kDc}H$���O�����/*sG�(\n�J��VDWw7��c�����5��P�\Z4i�M-�ꔟ@3Tgey/�o蝩\0�(\nkW(��>{�B����wp\0�c������$>�x4]H���W��t:�s��%\r�����[����n�f܇O�E<5��<���T�t��������Ræ�w������%\0m���T���ݏ����N�m�#E���?���EfDD�� ���EHD�zߛ� {��0c)�B�i��tF�������6���ng���(t༸�y���=��k-����&7hz;����\"o�/������\Zmm>8�N�|>�ןC<��]G8X�@0(ov���������rw�n��s�3/�9�q�\"���/Hfތ��55�(�Z1H��hj\"�d�uFV&#7���g0�u����`��=��7<O�*Cb�&�!�1\0�NG�K@��o�ށ7���\r\r糕�^o@��b��R�������n(DU�6��%E�Sz�^���z��t2\rk�������+�a������-�U3�j�XY���e��lkGrc�?¡�r9`A~!@\rG�-�f�5P0��ߗ�0�؊��`	����VQ��X]d�;$�K�j�it���^�q�lfv��X��`�����E�4\n�7a��nė�i�<%b-\Z�&H91�unL�\'����H�\Z�8MHe�6YT	��ZN�dt����f��r	�==k�@\0��K�\r\nm���A��ErkF^�(�\"4��_���,�J0qv�\0G�#%���cq=*b���L�*�D��1G��������oz5\\���*�!�4��ZR�\n�R�ٙ��F���N�]�\'��.��� y�<B���WT丳�e��#\0�e�T���9���u;��֭]�\"\"#.4�,�����Hx�paH��cb/$�W����%�(Ā@��`�n���h�1�q�ӭ��9+�%�+.�Ӟ��}��>������ߋ^�\0f��T���i�̢��Xk5ҀPaBi�X�5~��CE#p�I�#-\ZW�Y���~�����	WD���0�aÑH===D_�^���wi#7���#tZ��j���~`qq��V��U�={N��ڰ�%t���lܸ�099�` ���r�\0�pɰ��:�s4ɘ�?[}s�f��������}V�J���K#h���yX��5h�e8�.�VKZ�=��=n��E�_�����N��ֺg���N�[Zw����{I�@2Y ZXN���B�/!��\n;\'��ٸ�*VH-����6QR\"��fVW�bc���/si#/��$�>R�YdȻDU�0�\Z�g�q��8\Z�p8d�u��1�(������w�G������\n�nv����nǓB�뺌R��rt�6��&񻉄�ëT���\r��#�����	ܞ�4�Г\'9c��pÞݻ�F��xڄ��Y�|yn��5�Xb����%�Y�ei1�5v2i�w����y��$9:2�&�Y��Sn2�IR7/���t��H&�}:��G�\"�V���j�H���(WX�����?|s���SI-�[7q��1d��;?މP(�9��D�\'@!]�.��fd�9����@nj�\"��d&�a�R\'�{�V$y^��๹H�?��tr��z�\n��E��Nu\Z9��|�T*�?���(	EQH&�T�w\"yH�\n�م?�A��p��߈E�Hqb�7m�Z<^ׂm��9���c�y/dd��	�5Х\\A�� \'L��W���-�����<U%A[�\ZۑIg�9O��f������nZ����Ob�ڂOv@.7�#X���\ny���P�kP)�[�cd�v�8\"��\'�\n�7���9*:�i)��mlwB� ]y����>��ŪLm6�wj�.��R�{�Nb�KW\n\n-b\r\n�\"�n	�(��堑���a���\r� �-���E�p/�i9l�?�];w���Ç�\'��3��T�L��SQ1jE�XD���Iuz����W�#���JY���u�dTd��$������!y~���qHP��T*y9��<�NA���p+\r��?�����	˗�H�@���Z��	���[>��+���5Y�5��S�u�l�GG�q�|=��Y���e7�_���\"��U_��׊���,���j5T��Х��T�d��=\r�ւT��</=\r��\0�Y[lT�]3���y?���gƏ��qh��0ĥ��O����#?U���������\rDJ�Ԧ�)m�@�Qy�!��P�./;v����{��f<��sf\n�j���*��������{���C�E�����;\"��Fd.��.v��l�^,�*Lʼ�����`|��ߘ�srb,�BN,�FEU!/$��uTCNRA��7�5���P���\r�e�l�b�&�\\���l���`���(�w��Q<(@gb|b���WM��H��������ԳlY��\r�����X���Wu�\\������ںz�ѣG\\�i�8�U�v��~�&F����=o��\rO(T�����<qZ_L����!���{P_��Z��o��/_��#���k�.��B?y���ܬ�\r�pm�u���P6K��e�0� M\r�Ir$����*�mOw7����L�� ���o?�\'�7���s������buC�$�|�C7���߽����`��U�S�^�v66Q�:q�2��?�������3�F PF���380���NI2��\'(�H{C�Fe���\'N�h����	*wäi����4�,�7�la�r�\'��L�4�Ѥ2\0w!ح��ً�b�!�r�*�d�F��Hը�5E�ye�<!��(�3�B�D���>��t�۶m�\'�k�6d�\"��u����_;;�i$擂W#�+��@�Ig�W(�Sr�,34^�=�7�Xy��\\^�Jg�D22\0�f�B1�(��q�jF:�1��XTR|�E�TU��Ek�P�/����jڽ�FAh+���u݇\'֮\'��+#X	saQ_9r�qr~?��$n�E��auadd�bÁ��0\r(h����I�ܞ���$�>O	���AS�z��`j������Y2��w��[3���]SQ	&�q{^���\n��z�]�2R3_�i7��$C��<�����	�-�#me���}$/��ZH6��1bI=D�j�bE?y���u��I3�g\'R	���]�������Ndp��g��	��D��g5\Z{Lv���ׯY�~��6*=Q�5e��6y�rcvF*��c��:l�Şm=��$𗡯�Z�	;�ãM\r�����4�BAI6�T\Z�ӓ���T-&�-�0::�S�O�a�\Z�����vT�+)e����������g7cavA6���	�����h���w=H�F�;�(R�n��tLLN��$@��hΊ\"M!m� VW�@�\n/]��2�&Feh�&�Ȯ!����G]�L����B���w�J*��=l��,�^\'~��kT�PS���џ���B�YL���3�dj�}C�fP�3��T���i�����|��¦M����ʂļ)n�ŢȢ�O�q��*�.Lz\03q�;*��8�4�lGb�Q|����N	��BJR�{�M\n>imc�,���#������6\r#PRɖjg�b=x��4e�f���S\'�ea?��S;�d�n��e�<�\0ż���=lT�hhh�� =RU�/�\'	����T������*N��oM��rƆ���N��&�5�%��رcl�I���_]��Xd>Pč��Z[[[,����K�ߔzL�4�wU�� 3,\ZE,�-�2EBA�Xx�|e��Mha�+V�]C�u�b�@��`m�7-�8|�{8��X�^�&��|F��hG�R�u�\nlЂ0���-�r=/M`�767_�t�E���-[^���i��zvP:���.�����B��s��/��`�B�s��>�B�bg����@���7Y#l�\n��	ãC����}��:֐�\\\n�Q\\�����`y�7q%ދ���㾕�\ZHb�x)�m����ƍ;iz�\Z�F�{��m���G:�b.z����%�-�Ͼ��@:�(U��L�r�4��SXQ�����K<��Y�~\Z;,���R�{FjlV04���]�gY�y�:���C�6C���R�?;��y�3�fҳ8=r�Ka+Y�\nS�ފH,�^�Ў;JH�~�Dvޙ�3\n�!rpRp\"��7�I)�R����G+VF�_���mٻ�v����=QK�����3�5����3}����6�����P0�J7�G�E։�ALF�y��+V�[卸��y8�L\"��c��CWW��$�����jք���3���G�\'�A������Ԕ����4Uڷs�Fsj�P]�3$�=��F�ބ,��?�ID�9^2��K���BG��toYY��RYo|Xg����ѣGm.����W�V۝_���Yց���O�c�|��j��	�0��r\"���_:�T\\2����Ć�R����Q���D�PU�~��6=��j����lկ�1Knl�#�֫�y�bqz��NQ�PEG��H�\\�̸$��%#�T���?�H|���h�a�U$5���҈�<̯���1��6U�\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0�IDATx�b���?6�\":::���00��0pqr1���00�����死�yyy~������������\02���{��~x��޺y󿧷�&�Q���`8r�P�o����B^At cYy�+�-��\0���Ν;���՛�2r��j����\"\"\"��7o������������L��=����\"b�L<�.e�t�*Ì��>�ݢ5:��\Z�Z���׮�\0��	�\" Pa�S� ���X����p���?��\n��_<e��g���?����1|�����o߾�������}a�a�������H�^��a���~.��z\Z@�x��c��W�>�a���ß?@�t�t._�����[����ve�+���2k�,�����}��5����XX�������������>�y�r���������x=\rt(r�������Y\Z��𷻹v7��,�fE��\01�`���������c+���Z\nb5��l� ����=��&ZX80ś7��f�7�����2븸��X�Ah�x��B�#DQ�����pm��[�uX�%x�}\"�rO��p�4���xWU����F�R���E��M�sk��\0LC���r�nj%Ʊ��v\r�P��\'�ò��F��*�kDc}H$���O�����/*sG�(\n�J��VDWw7��c�����5��P�\Z4i�M-�ꔟ@3Tgey/�o蝩\0�(\nkW(��>{�B����wp\0�c������$>�x4]H���W��t:�s��%\r�����[����n�f܇O�E<5��<���T�t��������Ræ�w������%\0m���T���ݏ����N�m�#E���?���EfDD�� ���EHD�zߛ� {��0c)�B�i��tF�������6���ng���(t༸�y���=��k-����&7hz;����\"o�/������\Zmm>8�N�|>�ןC<��]G8X�@0(ov���������rw�n��s�3/�9�q�\"���/Hfތ��55�(�Z1H��hj\"�d�uFV&#7���g0�u����`��=��7<O�*Cb�&�!�1\0�NG�K@��o�ށ7���\r\r糕�^o@��b��R�������n(DU�6��%E�Sz�^���z��t2\rk�������+�a������-�U3�j�XY���e��lkGrc�?¡�r9`A~!@\rG�-�f�5P0��ߗ�0�؊��`	����VQ��X]d�;$�K�j�it���^�q�lfv��X��`�����E�4\n�7a��nė�i�<%b-\Z�&H91�unL�\'����H�\Z�8MHe�6YT	��ZN�dt����f��r	�==k�@\0��K�\r\nm���A��ErkF^�(�\"4��_���,�J0qv�\0G�#%���cq=*b���L�*�D��1G��������oz5\\���*�!�4��ZR�\n�R�ٙ��F���N�]�\'��.��� y�<B���WT丳�e��#\0�e�T���9���u;��֭]�\"\"#.4�,�����Hx�paH��cb/$�W����%�(Ā@��`�n���h�1�q�ӭ��9+�%�+.�Ӟ��}��>������ߋ^�\0f��T���i�̢��Xk5ҀPaBi�X�5~��CE#p�I�#-\ZW�Y���~�����	WD���0�aÑH===D_�^���wi#7���#tZ��j���~`qq��V��U�={N��ڰ�%t���lܸ�099�` ���r�\0�pɰ��:�s4ɘ�?[}s�f��������}V�J���K#h���yX��5h�e8�.�VKZ�=��=n��E�_�����N��ֺg���N�[Zw����{I�@2Y ZXN���B�/!��\n;\'��ٸ�*VH-����6QR\"��fVW�bc���/si#/��$�>R�YdȻDU�0�\Z�g�q��8\Z�p8d�u��1�(������w�G������\n�nv����nǓB�뺌R��rt�6��&񻉄�ëT���\r��#�����	ܞ�4�Г\'9c��pÞݻ�F��xڄ��Y�|yn��5�Xb����%�Y�ei1�5v2i�w����y��$9:2�&�Y��Sn2�IR7/���t��H&�}:��G�\"�V���j�H���(WX�����?|s���SI-�[7q��1d��;?މP(�9��D�\'@!]�.��fd�9����@nj�\"��d&�a�R\'�{�V$y^��๹H�?��tr��z�\n��E��Nu\Z9��|�T*�?���(	EQH&�T�w\"yH�\n�م?�A��p��߈E�Hqb�7m�Z<^ׂm��9���c�y/dd��	�5Х\\A�� \'L��W���-�����<U%A[�\ZۑIg�9O��f������nZ����Ob�ڂOv@.7�#X���\ny���P�kP)�[�cd�v�8\"��\'�\n�7���9*:�i)��mlwB� ]y����>��ŪLm6�wj�.��R�{�Nb�KW\n\n-b\r\n�\"�n	�(��堑���a���\r� �-���E�p/�i9l�?�];w���Ç�\'��3��T�L��SQ1jE�XD���Iuz����W�#���JY���u�dTd��$������!y~���qHP��T*y9��<�NA���p+\r��?�����	˗�H�@���Z��	���[>��+���5Y�5��S�u�l�GG�q�|=��Y���e7�_���\"��U_��׊���,���j5T��Х��T�d��=\r�ւT��</=\r��\0�Y[lT�]3���y?���gƏ��qh��0ĥ��O����#?U���������\rDJ�Ԧ�)m�@�Qy�!��P�./;v����{��f<��sf\n�j���*��������{���C�E�����;\"��Fd.��.v��l�^,�*Lʼ�����`|��ߘ�srb,�BN,�FEU!/$��uTCNRA��7�5���P���\r�e�l�b�&�\\���l���`���(�w��Q<(@gb|b���WM��H��������ԳlY��\r�����X���Wu�\\������ںz�ѣG\\�i�8�U�v��~�&F����=o��\rO(T�����<qZ_L����!���{P_��Z��o��/_��#���k�.��B?y���ܬ�\r�pm�u���P6K��e�0� M\r�Ir$����*�mOw7����L�� ���o?�\'�7���s������buC�$�|�C7���߽����`��U�S�^�v66Q�:q�2��?�������3�F PF���380���NI2��\'(�H{C�Fe���\'N�h����	*wäi����4�,�7�la�r�\'��L�4�Ѥ2\0w!ح��ً�b�!�r�*�d�F��Hը�5E�ye�<!��(�3�B�D���>��t�۶m�\'�k�6d�\"��u����_;;�i$擂W#�+��@�Ig�W(�Sr�,34^�=�7�Xy��\\^�Jg�D22\0�f�B1�(��q�jF:�1��XTR|�E�TU��Ek�P�/����jڽ�FAh+���u݇\'֮\'��+#X	saQ_9r�qr~?��$n�E��auadd�bÁ��0\r(h����I�ܞ���$�>O	���AS�z��`j������Y2��w��[3���]SQ	&�q{^���\n��z�]�2R3_�i7��$C��<�����	�-�#me���}$/��ZH6��1bI=D�j�bE?y���u��I3�g\'R	���]�������Ndp��g��	��D��g5\Z{Lv���ׯY�~��6*=Q�5e��6y�rcvF*��c��:l�Şm=��$𗡯�Z�	;�ãM\r�����4�BAI6�T\Z�ӓ���T-&�-�0::�S�O�a�\Z�����vT�+)e����������g7cavA6���	�����h���w=H�F�;�(R�n��tLLN��$@��hΊ\"M!m� VW�@�\n/]��2�&Feh�&�Ȯ!����G]�L����B���w�J*��=l��,�^\'~��kT�PS���џ���B�YL���3�dj�}C�fP�3��T���i�����|��¦M����ʂļ)n�ŢȢ�O�q��*�.Lz\03q�;*��8�4�lGb�Q|����N	��BJR�{�M\n>imc�,���#������6\r#PRɖjg�b=x��4e�f���S\'�ea?��S;�d�n��e�<�\0ż���=lT�hhh�� =RU�/�\'	����T������*N��oM��rƆ���N��&�5�%��رcl�I���_]��Xd>Pč��Z[[[,����K�ߔzL�4�wU�� 3,\ZE,�-�2EBA�Xx�|e��Mha�+V�]C�u�b�@��`m�7-�8|�{8��X�^�&��|F��hG�R�u�\nlЂ0���-�r=/M`�767_�t�E���-[^���i��zvP:���.�����B��s��/��`�B�s��>�B�bg����@���7Y#l�\n��	ãC����}��:֐�\\\n�Q\\�����`y�7q%ދ���㾕�\ZHb�x)�m����ƍ;iz�\Z�F�{��m���G:�b.z����%�-�Ͼ��@:�(U��L�r�4��SXQ�����K<��Y�~\Z;,���R�{FjlV04���]�gY�y�:���C�6C���R�?;��y�3�fҳ8=r�Ka+Y�\nS�ފH,�^�Ў;JH�~�Dvޙ�3\n�!rpRp\"��7�I)�R����G+VF�_���mٻ�v����=QK�����3�5����3}����6�����P0�J7�G�E։�ALF�y��+V�[卸��y8�L\"��c��CWW��$�����jք���3���G�\'�A������Ԕ����4Uڷs�Fsj�P]�3$�=��F�ބ,��?�ID�9^2��K���BG��toYY��RYo|Xg����ѣGm.����W�V۝_���Yց���O�c�|��j��	�0��r\"���_:�T\\2����Ć�R����Q���D�PU�~��6=��j����lկ�1Knl�#�֫�y�bqz��NQ�PEG��H�\\�̸$��%#�T���?�H|���h�a�U$5���҈�<̯���1��6U�\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(36,'sys','quickAccess_searchAds.png','image/png',5353,'2013-12-14 18:15:36',5353,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0�IDATx�b���?6�\"�\\�r���������/fff��~3;zT����ܼ\\��ܜ,l�l;v�`�5tg��e`��U� �\'��6�����1�A���AJ\\�A\\L\nb���2�\n\n��a�a�\0b��s�Ζ��s�2�c`��������OJJZ���������Lll,��@���f1޹w����2�:�3\'w\0-dd�/�g`y��\r���\"���<<�j\ZZ\'O��:M���۷ٳ����]@8]����������z)0�<yyy~>>�K�/3����1��Ǐaaa�,@3||�^@R^����~����cؿk#���\r�����~��p��5.�o�����,�ƞi@�pp��q���0�:u�����a�ʕ�QQQ\"��쯝.�fx������4������sgN���wf6v`X�������~l�\n2@9ռ2����y~f��l���������r@J9iR.�Hy����$���E#́���v���Cf�Ę��x�]��S����}>/��D��\'s�����\n��D�D@(!\\��D5J	\'4S;X��\n9���N�_����ٙ����PQ�F�(�\"��Ib���\r{e���@�B��+�JIP�jQm�K$���*\r:a4䡣�5j\"�\Z�`2[pt��͖m2�������9\0����Z�t\rcbbw�7����q0��R(��������f�ؾJ���>��7|~���ߔ�9p��O�09ZaɆ!נ{8A����!`,��U��v�S{�;dlr\n��+W�C�����bb�p9�pR��X`x���i�]�����>�����`~A��{�A��K�����j�i\"��ߔRJS��:�P\nh4��D,j�.��.\\P\\����.���bL����ưЀ� HP��êIK�B_���t��c��h\"��ə�̽��9�{̶��ݡ�rI�`vvv~��Y�l�����9�|�b�%f6�٧�U604�n޸����3j){;9�\\n���,�&���͂��VY�T*�tZ$B,2�v�H��R� ˌ�ޥi�(����#��E3Q)&\"�S{8Dϕ��8�FGF\Z���)RV��ɹ�E,*�J	��\0!,a�Ü�ܷ���	����z��;z�F���(mNI|?B� ����0˶:�i���i$\Z�����1�֙�לG��|��f����!�e)q*�D�����4Z;q��\n�7��t��p�v��<�3CEPV���h�|�JuY&�c����䔸Nd-Cb_\'\\�p8���t%;0>1�k/l6�_hGkK�,��-�K��+\\\\�����(��A\"Aʑ�I��%���J����U��tL�<U���(R�ba�UFX,�&��hT��jN \Z.-����4�Ǟ����ݥ$z���/���@\"�\0_0�<��<$�\r������F�|D��/�q���g��Ձ@�%ח�޹��۩y3Y\n��1[�Zm1VUku�z9�M�(�1��4�\'����l����^������l����LC����\r�~\'\r��2����WW����U�_2��\0�W�oSe�����ʶn���\n�貊el01c̔K�#��$1A�	10>���l3��1\'�8�I�@���u+�F��u�9��S~0:>j��Ӧ�y�����.������dq�~�����b9�\n ��8��%�L��Ky�.K�a���Z�?[�H��D\"��---�4�ܡs�騜�N��W091�p8L;ií_z�( �77!{�3�]���,E��o���~lnj����.6X��aA�Ƣ��Ǐ�v_2�|0Ħ��(_Y���:��U���2�\Z76Ў�Bc�$i[��Й���^�=�M�t~sv]MM�\'�j�?�+m��v���3|��	33�k���[�O�ʲ��\"�P;\rүVK9S�\Z����?��D��4��D�Ͳ�,VX�)������I^�o����@����a:lv&�uv�H��!�:��UY�1�([���1�<n\r!J,��*_Y����Jΐ�Ht��h��q�� �ta��Π���	��۵��5�bS��Kƒ(()@�\'PVQ�M���e�d(4WY.���0�ym�\r���w�6~�n���Ƌl���6iϞ7s�(*V���������p��9����H�ܜ�C���-�X6�o��q��K�Bժ5hں������A����2��R�FM�-[�G���\'[O��1/�F\'>�%�+�P���z.�ׅ�d���@*�ĩ�Ӹ}�/_4����Hv�+����$���J��>K�ľ��\'�	8�ᙪzba/oiBm]>_>3N��D�� Ǌ��B��!�e�iGhm7�q\r���[�\r¥����W&\r��,�\\fu�m���M�MĂ��Ԯ� -5�+�$>��Ӄ��;K\Z�$3��00s=c����|�.���p�݈�Gиa=I��L;�eWi�i�ت��@�Y����C\Z�]�,�c�NLO���y\rNj\Z���>��K��\\��<���<�$��Kiƽ���\'�|�����T�MC�P���,����n�䕎6��,z2�w//��39Au����Y������E�#7����Tiwlp_f7<x�DAa��a����ʻzj�~ѱ�����j.L�L���.tw�3�,s\Z�dX�,�l��M�;ޛ�ǧ򥞞�*Z����#�\Z>vm���#���Hr���_^RRWRV.9]*7I���9�������yz��wB�-g|��ڝ]�q���Z*���}b�r�߿݁ַ����a2����\Z�����ܼ3l�v_)���%��Rl�^53��P5>��?�.)@�\Z�B�}�8fǡcO��K	��\0�Ykl��=��k|Il�N�\\\Z��P.�ƖЕ@�J�:V4\Zh�i�~l�j��i�����M��^��vU��M��ehZm rc%H�ĉ\'v|���V��6*m�,}�%�_?��>�s�����z����0�.]R\r��hw8��U�#G~��_z�-� �gϞŧ>M��t�D�8�x+1�`�	�L��J�g]]�z6�	i�d�+�S�hj�$��3��/7PW[{�P�6����kjj�}��5�j����4J@�[��Ʃ��_���{q��8���+&&\'�������Ӆ��v\Z\\���F��j�g��6����8ǌ�T7�;v�Pʧ�+#H>�\r�=N����ǡC��=���ܹ�v��F7с��Y��U�y]G�zN�3��HT\'ihq�٢�T�ȣ��U-.?&��H�*��#`S�Ǣ���Z:v����)~O$D�/6_\\����������|V�5d���5��f��7�_��C7��D_`��h���,�(���%�\Z��%\\�8�D\"�)nC2�$찡�x/�L�8�G�G�u�#�y��E�4��LM����w��:����«��l�UT\n5�����c\"4�2FZ�����\\s)!�\"�Z-�d2�^T��RH�6^���f1�� �u�\rjwD����i%FX`�/P�U�-B���o Cخ��iJ�2\Zh*�cg\ZJ\n0F\n��h���)�\'��!��U�i�Κ)Q��A��#A��@{�wq�cw����ԩ�y|�\ns�!<Fm}�<u5߇R��0re�֣�N��ݰ��*jz>�.BDd�|��1C�x��|�~��;�k��8;�\r*qM��EU[��ӓ��9��f�Ͷ��\",��~�cE,�����\nO��!r?󵔸��T\n�12�o�v�QN��ŏ�|�A��j5�b1���O��f*��-�]b�^VL�>@�Q8ߏ5���^}N��a��_���F���aq�Y�	���êV#:7�C�bUM��7o�Y��=��N��|~-2;��XH�au��0�zzѠ,��f��NdP�4�� �ӛh\\9��jf�D���5[�H�r��1?~˛��X��G�!P@s}#������o����BvCR�4��gQ��s\'�q�|��i9~���������������x�1���X�F/�H��m�q���7��t�� c\'��#�#�v�/���Q�1�V��qBb�_j7���^�;��wGc�����t{����D:�?�Ph\'���bl��n��cG��mJKmZ�H�n&��|��w&�g�6m�X�G�L�q��7K`dhNo�2�\n���ܠZ<A�9<�ݣ�Q���p1�2˘�`#��f� ^�&2�s}}����)���莑�N!<\"�n ar��{��F��T͞��D��d&�^qW\r����ƶ�\"k�}��.F`�L�zm��k�ΙȞ�ؾ]\"�2m��\"%�LM�bB/RDi.�a�̱�#g�c�T��Z��0���ar�3�$/j��B�4�LB���],��6�Źs�c۶m�h�\\�t8�������������la!J�e��`����;{��(\"�0<��䀁T�?�׋Z��\n�<\n�]UG�����m�;6����Ѽb5C��eP�*W\'>Y���9)�E�;��.2�x�9�&���\n��\Z޲������ztǣ��s����\n�����N�I�ڬ�q�C��9��	k\ZvѾ��\nw&w�*[��k�t�Ҋ?	�]V�ab�=�V+�V2���U`4b,����-T���)[s�t6�\"gx�pr�h]�v�J�u�ֹȑ��iE��H�D6�E�`�daMxGO��� ַw��W�\n���?~���%��|8�dtW.���ShiY�2��1�u�3��S\">ߨC��r*��&�J�m��t�W��	�G\r6l0h��&��T$i���q,E��B7�Ol�[*�yZ�86!�t�?���aC�^��\Z�&��`N�\ry�82�8�����Mb|l���|nvf�MW2N�V�Yɳ�Vl#��g������� �UUT�P�d4��9���y���V�k��R\ZS��5�N;/]r�}盻�m���{n���b������MZ0���w\Z^��Bvǎ]=;;�N�[�p%�-��P���b:�7\Z��\\��Lgg��n��]���U�!ܥEfNJ;Pl$VW������~��{-n�Ξx����4Rc�>�����?�//�3O�Z���KMLFB]�o(ԋXG��bпJ��D;�0�]����ﶸlb��B�X��y�L�G.���������I�+1��+-�+o4.�]�J�\'�t-��\'S3��?���e/\r�?�Rj������0���	F�����x�s\'��\'���j�z�\'&ve�\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0�IDATx�b���?6�\"�\\�r���������/fff��~3;zT����ܼ\\��ܜ,l�l;v�`�5tg��e`��U� �\'��6�����1�A���AJ\\�A\\L\nb���2�\n\n��a�a�\0b��s�Ζ��s�2�c`��������OJJZ���������Lll,��@���f1޹w����2�:�3\'w\0-dd�/�g`y��\r���\"���<<�j\ZZ\'O��:M���۷ٳ����]@8]����������z)0�<yyy~>>�K�/3����1��Ǐaaa�,@3||�^@R^����~����cؿk#���\r�����~��p��5.�o�����,�ƞi@�pp��q���0�:u�����a�ʕ�QQQ\"��쯝.�fx������4������sgN���wf6v`X�������~l�\n2@9ռ2����y~f��l���������r@J9iR.�Hy����$���E#́���v���Cf�Ę��x�]��S����}>/��D��\'s�����\n��D�D@(!\\��D5J	\'4S;X��\n9���N�_����ٙ����PQ�F�(�\"��Ib���\r{e���@�B��+�JIP�jQm�K$���*\r:a4䡣�5j\"�\Z�`2[pt��͖m2�������9\0����Z�t\rcbbw�7����q0��R(��������f�ؾJ���>��7|~���ߔ�9p��O�09ZaɆ!נ{8A����!`,��U��v�S{�;dlr\n��+W�C�����bb�p9�pR��X`x���i�]�����>�����`~A��{�A��K�����j�i\"��ߔRJS��:�P\nh4��D,j�.��.\\P\\����.���bL����ưЀ� HP��êIK�B_���t��c��h\"��ə�̽��9�{̶��ݡ�rI�`vvv~��Y�l�����9�|�b�%f6�٧�U604�n޸����3j){;9�\\n���,�&���͂��VY�T*�tZ$B,2�v�H��R� ˌ�ޥi�(����#��E3Q)&\"�S{8Dϕ��8�FGF\Z���)RV��ɹ�E,*�J	��\0!,a�Ü�ܷ���	����z��;z�F���(mNI|?B� ����0˶:�i���i$\Z�����1�֙�לG��|��f����!�e)q*�D�����4Z;q��\n�7��t��p�v��<�3CEPV���h�|�JuY&�c����䔸Nd-Cb_\'\\�p8���t%;0>1�k/l6�_hGkK�,��-�K��+\\\\�����(��A\"Aʑ�I��%���J����U��tL�<U���(R�ba�UFX,�&��hT��jN \Z.-����4�Ǟ����ݥ$z���/���@\"�\0_0�<��<$�\r������F�|D��/�q���g��Ձ@�%ח�޹��۩y3Y\n��1[�Zm1VUku�z9�M�(�1��4�\'����l����^������l����LC����\r�~\'\r��2����WW����U�_2��\0�W�oSe�����ʶn���\n�貊el01c̔K�#��$1A�	10>���l3��1\'�8�I�@���u+�F��u�9��S~0:>j��Ӧ�y�����.������dq�~�����b9�\n ��8��%�L��Ky�.K�a���Z�?[�H��D\"��---�4�ܡs�騜�N��W091�p8L;ií_z�( �77!{�3�]���,E��o���~lnj����.6X��aA�Ƣ��Ǐ�v_2�|0Ħ��(_Y���:��U���2�\Z76Ў�Bc�$i[��Й���^�=�M�t~sv]MM�\'�j�?�+m��v���3|��	33�k���[�O�ʲ��\"�P;\rүVK9S�\Z����?��D��4��D�Ͳ�,VX�)������I^�o����@����a:lv&�uv�H��!�:��UY�1�([���1�<n\r!J,��*_Y����Jΐ�Ht��h��q�� �ta��Π���	��۵��5�bS��Kƒ(()@�\'PVQ�M���e�d(4WY.���0�ym�\r���w�6~�n���Ƌl���6iϞ7s�(*V���������p��9����H�ܜ�C���-�X6�o��q��K�Bժ5hں������A����2��R�FM�-[�G���\'[O��1/�F\'>�%�+�P���z.�ׅ�d���@*�ĩ�Ӹ}�/_4����Hv�+����$���J��>K�ľ��\'�	8�ᙪzba/oiBm]>_>3N��D�� Ǌ��B��!�e�iGhm7�q\r���[�\r¥����W&\r��,�\\fu�m���M�MĂ��Ԯ� -5�+�$>��Ӄ��;K\Z�$3��00s=c����|�.���p�݈�Gиa=I��L;�eWi�i�ت��@�Y����C\Z�]�,�c�NLO���y\rNj\Z���>��K��\\��<���<�$��Kiƽ���\'�|�����T�MC�P���,����n�䕎6��,z2�w//��39Au����Y������E�#7����Tiwlp_f7<x�DAa��a����ʻzj�~ѱ�����j.L�L���.tw�3�,s\Z�dX�,�l��M�;ޛ�ǧ򥞞�*Z����#�\Z>vm���#���Hr���_^RRWRV.9]*7I���9�������yz��wB�-g|��ڝ]�q���Z*���}b�r�߿݁ַ����a2����\Z�����ܼ3l�v_)���%��Rl�^53��P5>��?�.)@�\Z�B�}�8fǡcO��K	��\0�Ykl��=��k|Il�N�\\\Z��P.�ƖЕ@�J�:V4\Zh�i�~l�j��i�����M��^��vU��M��ehZm rc%H�ĉ\'v|���V��6*m�,}�%�_?��>�s�����z����0�.]R\r��hw8��U�#G~��_z�-� �gϞŧ>M��t�D�8�x+1�`�	�L��J�g]]�z6�	i�d�+�S�hj�$��3��/7PW[{�P�6����kjj�}��5�j����4J@�[��Ʃ��_���{q��8���+&&\'�������Ӆ��v\Z\\���F��j�g��6����8ǌ�T7�;v�Pʧ�+#H>�\r�=N����ǡC��=���ܹ�v��F7с��Y��U�y]G�zN�3��HT\'ihq�٢�T�ȣ��U-.?&��H�*��#`S�Ǣ���Z:v����)~O$D�/6_\\����������|V�5d���5��f��7�_��C7��D_`��h���,�(���%�\Z��%\\�8�D\"�)nC2�$찡�x/�L�8�G�G�u�#�y��E�4��LM����w��:����«��l�UT\n5�����c\"4�2FZ�����\\s)!�\"�Z-�d2�^T��RH�6^���f1�� �u�\rjwD����i%FX`�/P�U�-B���o Cخ��iJ�2\Zh*�cg\ZJ\n0F\n��h���)�\'��!��U�i�Κ)Q��A��#A��@{�wq�cw����ԩ�y|�\ns�!<Fm}�<u5߇R��0re�֣�N��ݰ��*jz>�.BDd�|��1C�x��|�~��;�k��8;�\r*qM��EU[��ӓ��9��f�Ͷ��\",��~�cE,�����\nO��!r?󵔸��T\n�12�o�v�QN��ŏ�|�A��j5�b1���O��f*��-�]b�^VL�>@�Q8ߏ5���^}N��a��_���F���aq�Y�	���êV#:7�C�bUM��7o�Y��=��N��|~-2;��XH�au��0�zzѠ,��f��NdP�4�� �ӛh\\9��jf�D���5[�H�r��1?~˛��X��G�!P@s}#������o����BvCR�4��gQ��s\'�q�|��i9~���������������x�1���X�F/�H��m�q���7��t�� c\'��#�#�v�/���Q�1�V��qBb�_j7���^�;��wGc�����t{����D:�?�Ph\'���bl��n��cG��mJKmZ�H�n&��|��w&�g�6m�X�G�L�q��7K`dhNo�2�\n���ܠZ<A�9<�ݣ�Q���p1�2˘�`#��f� ^�&2�s}}����)���莑�N!<\"�n ar��{��F��T͞��D��d&�^qW\r����ƶ�\"k�}��.F`�L�zm��k�ΙȞ�ؾ]\"�2m��\"%�LM�bB/RDi.�a�̱�#g�c�T��Z��0���ar�3�$/j��B�4�LB���],��6�Źs�c۶m�h�\\�t8�������������la!J�e��`����;{��(\"�0<��䀁T�?�׋Z��\n�<\n�]UG�����m�;6����Ѽb5C��eP�*W\'>Y���9)�E�;��.2�x�9�&���\n��\Z޲������ztǣ��s����\n�����N�I�ڬ�q�C��9��	k\ZvѾ��\nw&w�*[��k�t�Ҋ?	�]V�ab�=�V+�V2���U`4b,����-T���)[s�t6�\"gx�pr�h]�v�J�u�ֹȑ��iE��H�D6�E�`�daMxGO��� ַw��W�\n���?~���%��|8�dtW.���ShiY�2��1�u�3��S\">ߨC��r*��&�J�m��t�W��	�G\r6l0h��&��T$i���q,E��B7�Ol�[*�yZ�86!�t�?���aC�^��\Z�&��`N�\ry�82�8�����Mb|l���|nvf�MW2N�V�Yɳ�Vl#��g������� �UUT�P�d4��9���y���V�k��R\ZS��5�N;/]r�}盻�m���{n���b������MZ0���w\Z^��Bvǎ]=;;�N�[�p%�-��P���b:�7\Z��\\��Lgg��n��]���U�!ܥEfNJ;Pl$VW������~��{-n�Ξx����4Rc�>�����?�//�3O�Z���KMLFB]�o(ԋXG��bпJ��D;�0�]����ﶸlb��B�X��y�L�G.���������I�+1��+-�+o4.�]�J�\'�t-��\'S3��?���e/\r�?�Rj������0���	F�����x�s\'��\'���j�z�\'&ve�\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(37,'sys','quickAccess_searchMembers.png','image/png',7460,'2013-12-14 18:15:36',7460,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0fiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c061 64.140949, 2010/12/07-10:57:01        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\" xmpMM:DocumentID=\"xmp.did:13B7B8F2910611E0805AC0C5CCB6C632\" xmpMM:InstanceID=\"xmp.iid:13B7B8F1910611E0805AC0C5CCB6C632\" xmp:CreatorTool=\"Adobe Photoshop CS5.1 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:6E5F0BFC0491E011AF35AEC708FB1C4A\" stRef:documentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>��u]\0\0TIDATx�b���?N�y�f�����-��&01F!�aȰ���?\'�����h�c���xq���\'ӝ/�D��2�8z�H�6�����(����+�*́��9��g��O���Kx�������/�@�x]�?�����rO5F#Fɿ���9->}�����0��ǅ\'��?�3������t�VzR��y�*����	���?����l�O18Ƞ���߶OۘE���:� �a�egg3���CSPPp��������=}C��5��٩�z�����A%]����_�k��������� ?��}-BDx[���`��cx}oۍXkuƟ��<{�p�孿�c�N�g�B+��q>%S�~z���]�AXݔ������1�d����������������#��]Mcx��������Û{�,/�g`�(c��u)����/]�ðFSh��i2���:�D�&;�lLi��s汴�o�K2������H�?@\0�;,\0�鴴4�杺�:������$l��14�=mcc�����@�x��}���o�����j���ӻw��.*�a�ѱ`�����e�W�rr���(\'� ,$0AHP�P����Ǐ���cfx��-ó�g^߽� ����U��߱3�^�~Wp��U�\r`\rw��e0��b�,a˰��\'_���Y���\",��������p?(�Oc�4���]͕�F���+��%�>�~���˷o\\��>}���A�mcis��O2������\'0]3���}p���Y�������f�n����$���}V&��B\\L���2�q�a���&C������\r�<�ML5F�_��b��bx����?���)�Z{�CV�ln>nFQ~^�O�������\'$��d�[����.ߺ���C~Ɩwo~�����Н���%�%0Q��?b��^�ke,�I�0r$-Ϯ}_���v��>.�ۄ��\0��ZC�*�����IN�&f�$��%M���6d�(N�n��-�?J��	**��c^/Xĉ⍍�9�N�*s5N,Z���\\ڥk�$͒��ɹ}�_��H������}��}.ߊz��d����^$\'I?<t�Z�}}}!�m.����e�x���׋�h���\r55��-�K��Ӄ��1����(����V�i�v�&��v�45�i��G�NO�B��e���qAv���KB���[����������8�vg�9���\r�u�̦����ţPg���g�=<|���3Z6W��n2njh���������=Q44��޳#��K�%S� � 	�nf���G7?�fg���b]��;M�����iN�@41��ӏ����)%+ݭ}S�;�]}]��5h�K�l�@0��(�L����ҹ�*?�~IU�-���F�r�j�3����~m�o�-W�6�ɯ��C���S�����t�Z�ۑ6� ek��t~����DQ�~dL@��eY�)c��y�������ӭ{��|wt����!�\ZF$�GY�0\rQ�-�N�EWF�35��]Ã�51 �v�\r�]�J)�|��Y����u�[�ߜQ��%�/�M?�-]#tY�\'�쌣T�D��7��:r�:e;qu�&s���vq��\n,\\\0�䰘���ɔ�&�7n٠��/5쟻k���ũ�����h`?\"��	�@D��\\&�D��Ì6��\'e�lǰ���#�x4�:�a��}�ih�e�{�͏]������=OlMRI��CaZ��Y}�4������v�0Ϝ�[�Cj �FW7�=ϳS7�[�.�-�<��3���b;�]����Bih�\n�u�q]�D9PfSt��>��z~���!륶��V\Z���u�i*�b�Wr~xJ�ȟ�^��M�g���9���8��q.DN�:�.[�����n�R[��\"!M�H�R����q	Z���j�\n�mЊ�JL��4ڬU���\0	�����9���������M�z$�?����{y.�7ֵo�EM߲6��S���a��}G���{{�]�\r6P�򨯯/��s���pMMMI��?�.Z����w�T:�c���s�۸hxxp8�j�>�\ZDM&��I����Y%��2�\r�{���\\��O��H$\"2��Jt&�f̡��n���/QOOOٹ�9r$`����2T�i¼����\n������L%^tUۑL�����v8��@��%\"����t�,BKȎTVG�Ȳhq�(T��<�ҶJF�i�87�\\��A�u��\\.G�d��?���%\Z!�)j>�T��tV(��N���!�kX�&z�k����\r�&M���P�\"c5���<�����,\n�\'�_��k������$I��f�n�Tm��YxkM.����^?��,nii���A���\\rz�V�;��������E����,y^��뭋���voh���&�]�sRW?��/.a4ǒh#����S;O|=���������U��P��r|V���+�TV��k�:��%)*�8(S�Dp*��|�x����$�v�������\\p�_�L	le�r,�U���w��s��~�����ꂚ5f:�����#��M�K�~���>�z����C�����+�|&�?#����MT�U%�=��\r���E�g:<Ir�L+���q9�֥��t\'�\\��Dێ�^Ss�պz�i�F�`�\\H��Az�ZP),��w��M#l�hڮ�o��S&*��T��w���x��gfLn���EŅ��y\Ze �\"Y������g��\nL+%��nr�|?7�C��9Ϩ�U����hh\r�����)LC!3�T@�����Vy�qV����e�\r�+[�������j��HP1\ny���\\���e�X*���n�\'��׼P��ml�#�ܡ�Y��U���!ఠ�ځ�O�rN��C��|���wo�6ƬMU>V����r2j��#!��B�ִ���/�|�5aů	�#�S\"�qi>���`�ۨ�N�vQ�v~��,���X��e͐�w#ܾ	k݇ͭ��2�Q7G�+����3�B\r�||!�so��M��)�SoF�jK@����d���?�\'<PTJ|Ws�u?����Ș���(J�Q�*�1��K��\'x3�}�\0�?p�)�����1VCjrB�����gqa<���Q���iRp��~�v\Z�O��@��+ۮǏ���P̩�U��=��:z�g�.wB��I\\_�N��xK�kM?��������^AS<�&��y��|\nL���3U��:_��Rz�`��M��@�\n�4-L�v򑮟r�Bv��&��]|��Φ��&?�\Z��?om��LP�O���&��)\0� ��r���of��o�����F��e���+�1y҂����`���I�ο��Xc��N��s�!���U�D�+&�ā�I���zء���u�:|0��oݻ/��J�$����^_o�79�kf+�v^��tcE����*��`\"��@&��MU_\nP��\0GU������Ǿ��<6�B	$y�hE����v�i�Se:��؇S���92V;X��Ū� �AAP	I�G����f�����{O�������Nugٻ���?���w���{֬YC��|��W�Z�$0ˆ#�TP����)�,{�m�B��\Z*��`�-DE�Qx��̚=��0y�dd�$��y;6<�㵟�`M�\\�3��z�5��9�]}�f�E��!(z�#��i�|\0.��r6A�B��$��@��D8oYE�Hy�vR|\n�5ɡEA5������G���^���(�un��+��\r�̙3�����ꠣ�cggg*>��rq�����ו@M	��<N��$&����s���ӑ	���\0���?���� q�%�*6�e$��M�C�=��e���a�W�y�ٗ��݅��?ӦM#�ׯ������\'\r\r!X��GS�%��e�`m�*��+�Y���C� <G-�����ȉ\'%W��a�Mў�!?.ڹ��)XNA�ف,N�L�Mm��D�e���-�LZ(������hTa����ؾ};� �\ZQ��l�-�uZkK�eN�[66f*\nji\0D��m���������Ҷa��:��\n���\Z�f�a�Mec?�i\Z�	��F��pe7��p�C���*r?^d������o�n)4~���nn�==�8mV�����Q����Pe��\0��vWE����Z#.	y.�tt�:�Eĝ��MA\rd��v44���P�{���t��()+���2���i�\rW:���k*�P��u��\r\0+�d���\Z�N�sB����r�,QE���\0$|���y̠3f�y�`p����7��1����l<�Q��(�>�}�O@M�\"�p��rԸ�$h�,u9�0��R�Q�������+�o���禞�:\0�X��8d�Q8�9��a�=1ݖ��B������iJ\r@i=^\r`�\Z@�Ԃ�T���\n�f`��0�D����߽v�\r�anY��V^�0��RN�\'�F�(�2 ��S��s����\n��b9�}��us�\"��h~����L�\0�����y�{��z�u�c�4ο�8K��gP��\Z,�~�OBM�7r�i\nQ1_�L���5e�꧞z������u2�!*�5]@kl����a63��Q�ㅒ�\\��f�d4��T�BD�8�w?�Ln�͎����\"�\"�n��m+�/[z�/Ш��c��D��B@BW\"��	-�R�|T\\J�e0A1bIx�qӪ�$kg�=�u�ߢ���\Ze��J�_�nS�� ��-�*��|��ZR�l&K�����m>Oӯ��(GV$�@�Ǐ/Y|�O3R-��?��Z\'��0�T6�8���\'��19�����MRQőᔗ�ڂ/.���7hj $�U�x?`0\0xs6��&A8���o��a�V*��6[�_���9�-�7q�u/�O��twe)!G_}��jm ��b��4t4<��¹ȾP�F	Yزy�( �Yf�Ÿa���򩤫�u�d���qZ�(��\0-&a dY�Hdr*FY�&��,���.L��l��$е�����J�U�*��Ϸ��������w�%`�~T��U4S~	^*Jp��P�8���8Q@_�f�� K%��:��,Φ���4W�wP��ܩ�hJ�\n�3\n�\r���Tx�FF��F ����̮(��3�D��\Z�´T�@j�^�x��Ӌ��\"��K;�/�g��-/^�|������oZ���U��x��L���� 80_L�a*@<rќEJbDmA*�y��ci��B �Hh!`	\\�R��{�RF�E�	2g�=����}u|��&ܕ���\"3|M|��Y-��P�|<�/$�:Z��H4E^�x�&R��P���ͽa�7�\Z/�n	1t����6�S�A�[\'�CZ��)\rH�l���,�E)�}`\'Z��i+��d@�h���i���{��	?i�6r�ſ���~��\"�RYc��Ѧ�E�:���H6C�L���¶������x��\'��b/����؍WO��<�}8��\"���t;��I��~(!	���giUqGA���ц��\\q��(�m<[)dr-N�Bvp�����\Z?Q=N�34Djν\0~|�*2f�\nhZ|4)*���e���$R���Pp4H���+���s:|2�H��W�<�+D��i��N��Ql��y��t3T\\�bsf�f���>�#߇d�0�J��\r��5�nx�BQ%S�\ns���100\Z���O�JG�TW�W��y�ƺj�v`�	���[�ݡ�s��Ga�L��\Z�{�m��ڌ\0��]]�	h&�#��@��i�c��ct+���a	�MG s�#�(�#@����T�����k��2��4ek庇\'�מ����U\0�I�vlی�m\nq�nLL�w_\Z=��&5\n���<���Ǳ��Ȯ�iGN�H�`UP�]��`���o��֜��O����\rh}�$�p��?F_v텍������@�Q�a��ʻZ��� ���x�1�k��z�p>����w?x���1׊���|t��\n�*��r�L�p��=�!�#](+e����NٱL��(�q\00W��a�3�����w�a���y�W�_3�ɠX%\0ݽ\0}C�H��\n<����g]����pV�8�9�%���g�F`�ڱ������[����-y�����ذ�m/b��[rѲz��+PY�$�1���5�����!g\0 ��#N)� EY������X��j�`����:���w���L�(�ٖ>|��m��~v!��[v���(���Mh�/�c��7������ܟ����/�\Z_��ʱ�~E>�/���%��FH�#pv	�]dŋ t��� ��O��̎���3���_!u���&x]�vl�kW�\0���mw��C8���v�^q����\'�wF��@y����L�q��(�x�~�,\n���D�G��q�U\ZB��\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0fiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c061 64.140949, 2010/12/07-10:57:01        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\" xmpMM:DocumentID=\"xmp.did:13B7B8F2910611E0805AC0C5CCB6C632\" xmpMM:InstanceID=\"xmp.iid:13B7B8F1910611E0805AC0C5CCB6C632\" xmp:CreatorTool=\"Adobe Photoshop CS5.1 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:6E5F0BFC0491E011AF35AEC708FB1C4A\" stRef:documentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>��u]\0\0TIDATx�b���?N�y�f�����-��&01F!�aȰ���?\'�����h�c���xq���\'ӝ/�D��2�8z�H�6�����(����+�*́��9��g��O���Kx�������/�@�x]�?�����rO5F#Fɿ���9->}�����0��ǅ\'��?�3������t�VzR��y�*����	���?����l�O18Ƞ���߶OۘE���:� �a�egg3���CSPPp��������=}C��5��٩�z�����A%]����_�k��������� ?��}-BDx[���`��cx}oۍXkuƟ��<{�p�孿�c�N�g�B+��q>%S�~z���]�AXݔ������1�d����������������#��]Mcx��������Û{�,/�g`�(c��u)����/]�ðFSh��i2���:�D�&;�lLi��s汴�o�K2������H�?@\0�;,\0�鴴4�杺�:������$l��14�=mcc�����@�x��}���o�����j���ӻw��.*�a�ѱ`�����e�W�rr���(\'� ,$0AHP�P����Ǐ���cfx��-ó�g^߽� ����U��߱3�^�~Wp��U�\r`\rw��e0��b�,a˰��\'_���Y���\",��������p?(�Oc�4���]͕�F���+��%�>�~���˷o\\��>}���A�mcis��O2������\'0]3���}p���Y�������f�n����$���}V&��B\\L���2�q�a���&C������\r�<�ML5F�_��b��bx����?���)�Z{�CV�ln>nFQ~^�O�������\'$��d�[����.ߺ���C~Ɩwo~�����Н���%�%0Q��?b��^�ke,�I�0r$-Ϯ}_���v��>.�ۄ��\0��ZC�*�����IN�&f�$��%M���6d�(N�n��-�?J��	**��c^/Xĉ⍍�9�N�*s5N,Z���\\ڥk�$͒��ɹ}�_��H������}��}.ߊz��d����^$\'I?<t�Z�}}}!�m.����e�x���׋�h���\r55��-�K��Ӄ��1����(����V�i�v�&��v�45�i��G�NO�B��e���qAv���KB���[����������8�vg�9���\r�u�̦����ţPg���g�=<|���3Z6W��n2njh���������=Q44��޳#��K�%S� � 	�nf���G7?�fg���b]��;M�����iN�@41��ӏ����)%+ݭ}S�;�]}]��5h�K�l�@0��(�L����ҹ�*?�~IU�-���F�r�j�3����~m�o�-W�6�ɯ��C���S�����t�Z�ۑ6� ek��t~����DQ�~dL@��eY�)c��y�������ӭ{��|wt����!�\ZF$�GY�0\rQ�-�N�EWF�35��]Ã�51 �v�\r�]�J)�|��Y����u�[�ߜQ��%�/�M?�-]#tY�\'�쌣T�D��7��:r�:e;qu�&s���vq��\n,\\\0�䰘���ɔ�&�7n٠��/5쟻k���ũ�����h`?\"��	�@D��\\&�D��Ì6��\'e�lǰ���#�x4�:�a��}�ih�e�{�͏]������=OlMRI��CaZ��Y}�4������v�0Ϝ�[�Cj �FW7�=ϳS7�[�.�-�<��3���b;�]����Bih�\n�u�q]�D9PfSt��>��z~���!륶��V\Z���u�i*�b�Wr~xJ�ȟ�^��M�g���9���8��q.DN�:�.[�����n�R[��\"!M�H�R����q	Z���j�\n�mЊ�JL��4ڬU���\0	�����9���������M�z$�?����{y.�7ֵo�EM߲6��S���a��}G���{{�]�\r6P�򨯯/��s���pMMMI��?�.Z����w�T:�c���s�۸hxxp8�j�>�\ZDM&��I����Y%��2�\r�{���\\��O��H$\"2��Jt&�f̡��n���/QOOOٹ�9r$`����2T�i¼����\n������L%^tUۑL�����v8��@��%\"����t�,BKȎTVG�Ȳhq�(T��<�ҶJF�i�87�\\��A�u��\\.G�d��?���%\Z!�)j>�T��tV(��N���!�kX�&z�k����\r�&M���P�\"c5���<�����,\n�\'�_��k������$I��f�n�Tm��YxkM.����^?��,nii���A���\\rz�V�;��������E����,y^��뭋���voh���&�]�sRW?��/.a4ǒh#����S;O|=���������U��P��r|V���+�TV��k�:��%)*�8(S�Dp*��|�x����$�v�������\\p�_�L	le�r,�U���w��s��~�����ꂚ5f:�����#��M�K�~���>�z����C�����+�|&�?#����MT�U%�=��\r���E�g:<Ir�L+���q9�֥��t\'�\\��Dێ�^Ss�պz�i�F�`�\\H��Az�ZP),��w��M#l�hڮ�o��S&*��T��w���x��gfLn���EŅ��y\Ze �\"Y������g��\nL+%��nr�|?7�C��9Ϩ�U����hh\r�����)LC!3�T@�����Vy�qV����e�\r�+[�������j��HP1\ny���\\���e�X*���n�\'��׼P��ml�#�ܡ�Y��U���!ఠ�ځ�O�rN��C��|���wo�6ƬMU>V����r2j��#!��B�ִ���/�|�5aů	�#�S\"�qi>���`�ۨ�N�vQ�v~��,���X��e͐�w#ܾ	k݇ͭ��2�Q7G�+����3�B\r�||!�so��M��)�SoF�jK@����d���?�\'<PTJ|Ws�u?����Ș���(J�Q�*�1��K��\'x3�}�\0�?p�)�����1VCjrB�����gqa<���Q���iRp��~�v\Z�O��@��+ۮǏ���P̩�U��=��:z�g�.wB��I\\_�N��xK�kM?��������^AS<�&��y��|\nL���3U��:_��Rz�`��M��@�\n�4-L�v򑮟r�Bv��&��]|��Φ��&?�\Z��?om��LP�O���&��)\0� ��r���of��o�����F��e���+�1y҂����`���I�ο��Xc��N��s�!���U�D�+&�ā�I���zء���u�:|0��oݻ/��J�$����^_o�79�kf+�v^��tcE����*��`\"��@&��MU_\nP��\0GU������Ǿ��<6�B	$y�hE����v�i�Se:��؇S���92V;X��Ū� �AAP	I�G����f�����{O�������Nugٻ���?���w���{֬YC��|��W�Z�$0ˆ#�TP����)�,{�m�B��\Z*��`�-DE�Qx��̚=��0y�dd�$��y;6<�㵟�`M�\\�3��z�5��9�]}�f�E��!(z�#��i�|\0.��r6A�B��$��@��D8oYE�Hy�vR|\n�5ɡEA5������G���^���(�un��+��\r�̙3�����ꠣ�cggg*>��rq�����ו@M	��<N��$&����s���ӑ	���\0���?���� q�%�*6�e$��M�C�=��e���a�W�y�ٗ��݅��?ӦM#�ׯ������\'\r\r!X��GS�%��e�`m�*��+�Y���C� <G-�����ȉ\'%W��a�Mў�!?.ڹ��)XNA�ف,N�L�Mm��D�e���-�LZ(������hTa����ؾ};� �\ZQ��l�-�uZkK�eN�[66f*\nji\0D��m���������Ҷa��:��\n���\Z�f�a�Mec?�i\Z�	��F��pe7��p�C���*r?^d������o�n)4~���nn�==�8mV�����Q����Pe��\0��vWE����Z#.	y.�tt�:�Eĝ��MA\rd��v44���P�{���t��()+���2���i�\rW:���k*�P��u��\r\0+�d���\Z�N�sB����r�,QE���\0$|���y̠3f�y�`p����7��1����l<�Q��(�>�}�O@M�\"�p��rԸ�$h�,u9�0��R�Q�������+�o���禞�:\0�X��8d�Q8�9��a�=1ݖ��B������iJ\r@i=^\r`�\Z@�Ԃ�T���\n�f`��0�D����߽v�\r�anY��V^�0��RN�\'�F�(�2 ��S��s����\n��b9�}��us�\"��h~����L�\0�����y�{��z�u�c�4ο�8K��gP��\Z,�~�OBM�7r�i\nQ1_�L���5e�꧞z������u2�!*�5]@kl����a63��Q�ㅒ�\\��f�d4��T�BD�8�w?�Ln�͎����\"�\"�n��m+�/[z�/Ш��c��D��B@BW\"��	-�R�|T\\J�e0A1bIx�qӪ�$kg�=�u�ߢ���\Ze��J�_�nS�� ��-�*��|��ZR�l&K�����m>Oӯ��(GV$�@�Ǐ/Y|�O3R-��?��Z\'��0�T6�8���\'��19�����MRQőᔗ�ڂ/.���7hj $�U�x?`0\0xs6��&A8���o��a�V*��6[�_���9�-�7q�u/�O��twe)!G_}��jm ��b��4t4<��¹ȾP�F	Yزy�( �Yf�Ÿa���򩤫�u�d���qZ�(��\0-&a dY�Hdr*FY�&��,���.L��l��$е�����J�U�*��Ϸ��������w�%`�~T��U4S~	^*Jp��P�8���8Q@_�f�� K%��:��,Φ���4W�wP��ܩ�hJ�\n�3\n�\r���Tx�FF��F ����̮(��3�D��\Z�´T�@j�^�x��Ӌ��\"��K;�/�g��-/^�|������oZ���U��x��L���� 80_L�a*@<rќEJbDmA*�y��ci��B �Hh!`	\\�R��{�RF�E�	2g�=����}u|��&ܕ���\"3|M|��Y-��P�|<�/$�:Z��H4E^�x�&R��P���ͽa�7�\Z/�n	1t����6�S�A�[\'�CZ��)\rH�l���,�E)�}`\'Z��i+��d@�h���i���{��	?i�6r�ſ���~��\"�RYc��Ѧ�E�:���H6C�L���¶������x��\'��b/����؍WO��<�}8��\"���t;��I��~(!	���giUqGA���ц��\\q��(�m<[)dr-N�Bvp�����\Z?Q=N�34Djν\0~|�*2f�\nhZ|4)*���e���$R���Pp4H���+���s:|2�H��W�<�+D��i��N��Ql��y��t3T\\�bsf�f���>�#߇d�0�J��\r��5�nx�BQ%S�\ns���100\Z���O�JG�TW�W��y�ƺj�v`�	���[�ݡ�s��Ga�L��\Z�{�m��ڌ\0��]]�	h&�#��@��i�c��ct+���a	�MG s�#�(�#@����T�����k��2��4ek庇\'�מ����U\0�I�vlی�m\nq�nLL�w_\Z=��&5\n���<���Ǳ��Ȯ�iGN�H�`UP�]��`���o��֜��O����\rh}�$�p��?F_v텍������@�Q�a��ʻZ��� ���x�1�k��z�p>����w?x���1׊���|t��\n�*��r�L�p��=�!�#](+e����NٱL��(�q\00W��a�3�����w�a���y�W�_3�ɠX%\0ݽ\0}C�H��\n<����g]����pV�8�9�%���g�F`�ڱ������[����-y�����ذ�m/b��[rѲz��+PY�$�1���5�����!g\0 ��#N)� EY������X��j�`����:���w���L�(�ٖ>|��m��~v!��[v���(���Mh�/�c��7������ܟ����/�\Z_��ʱ�~E>�/���%��FH�#pv	�]dŋ t��� ��O��̎���3���_!u���&x]�vl�kW�\0���mw��C8���v�^q����\'�wF��@y����L�q��(�x�~�,\n���D�G��q�U\ZB��\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(38,'sys','quickAccess_updateProfile.png','image/png',5535,'2013-12-14 18:15:36',5535,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0AIDATx�b���?$\'\'o)(��A���.d�g��_\\ےA�ȗ�	��������\'O/G��T�`�c�����0I943�$Bz�0,����ѧ����W����Q�jz�?�``�����N�%�,\0�\0s���Ccc�ӧN�����~��_������}= >\\�Q����\'�=zⳀ��9���g�{�$C���j7q��7����;����������%�,�\0��+�ۯB���d��^\0#�U O�@CCӭ[�~pqq��031���1���-����ea@@���_��:�ЛA���A@A��ۇ!@�hx\"�\0@1�yuѯ������������/�b�\r�5��v�����32��g���� W����i���/\Z�uO�Fh�p������8#��/���r����g`,e�*{�;Nf������;`H���p�՟K�g1D�w�.=���@� ���\0���~���   �EVV�GYE�50 �7�%L�T����������������ً/�֭e��c���d�=���d3���122�0�y�\0.�aùsg������}��_?00�����Ɖ�8m�p��^[���g�_3����v^<~�����tS�=×/��IKH0����1�e%��@��IQ���������bx����{�A�A�����H����[���!(�?��o�\Z1\n����c�]�\"uNn=R�	�`�3�����߿���ؘ��,�]^�z� \'|��a�í�9\r@�/�N�|t\'��(����~�c`����a�or\"W��2,��͐V��	�&�-�D��_��]��?|��` �Ƴ63W18yg������a|����0����?~�g����s>�_�3C�O�_PVu!M�a�9g�����Բ���B�\r� �����;C����\"�2�H��4\"���0\"4�@�0ȋ���Ȍ������v�m;;?�\'����y��y������4��VYY	��I��[���N�2�].�f �M׮^�ߙE���az�9��m6b)P���Լ�<��(p�#�Bl�\'\"��p�uw1�u�ytaN�������ߏlVdF���^�&Έ����:IE��ɱು��;g�/Qqq1��W�j�\n��X���5��#g\0�Us�,�&���nǩ��A$�n��k��8R���jgc�\0���`\0˲P�Jj\"�²�FyQ�k�S3����x<�xB@��1���ʲ��M�Ć�/N�;����0�7Kkr^�*�۱ܽB4�~ݦҏ<�Ƈ�OQ!�SG�II28�K6�U��s���Ba����Z�>������ڵ��>q�Un6�+ܺ�_qHU=Og�9^�:�#�;<�����!�l��.�}����f��\Z}��C�P���D)�3:���B�5��>ChrM%��e!q1��:V&\r�4&ފ����f�����	<�p4���nQ��6��\"���5	�S��H4$\";�!G����� ��z#m�o@�u�G7�������4B�?G�-�v+O�ULم��)D\"�R��\"�񲧅~�𘶡�Р^�D�s�������e^T4?B�� �Eћ,�\\k��9��B����T	Rz\"�JD�������[�{n������T�s�\0�WilTU>��73o�.C[�tZ�[�VZ�B��V�ʢ@$(\r�4�Ҹ��$`��h\"�4\"DRP�%6��8a��2��N���-��cK(�%}�M��{�9���w�8�o������1��v�}���㺺�^��@��%uK��\r�/TV���cO��?����\nQ������x>����m挙�eux�l6&Acc#���Coo/��b,�y��2�`��F�rsiiY\':D��ʕ�\"��QE�����H$B���\'��=0u��;A��1�FMϵ�ot��;�a�0%P]]�z���FVV�M�b���R�)���)X��9�7�5�x\r��-}aƸ5@_B0=E(xDS5X<+̵z�S%��\"�##�`��O6~�ob󠳳��x�0-��\"!���:�2vb�?������\rd��y8�{oOӸ�;w���sK\'?__U@�s�DFC�Y�]�o[FH�$G�E�)�����H��Y�lI5��w�!�`=�2��\rI�n�`0����|r�J��҈���aOG�>]ש�%��^�;��w��}kς`�{1��*B��.\'�7/�Rj����r�H3lNY�Yw�h˛ޅ��ChM��1�f�@\0zz{��(������d��ދGƣ�I�G^���r��L�Ϯ�?�	�0ʞ�pbH���A�޹�x�>���--���n�������Ҩ�xu\Z��%,�;o���ǯ�>f��́K$�T�]$Z2��|�:�/����R��7�y;�	Sw#��)��絶�J�5EUo�bA�_X`�J^�+R�WO��.�a���p��sg<�bD�Z�չ�H����/����������O�@��y�>{>\r��9&�`��q�D���88O��)t���~T�BCp�l=��`����֮/�J�b4\"]�DL�����hް^Lwp\nA�/�,k���\Z:�h�7���í)z�7�Yu�\"Mel�ģ�,��M; iiy�BY�=�5�5J	X(��W%�r�����s�7����4T�l�`/b�y��4���swQ�d�uL�����>R�\r(���c0#�Yǭ5�5�w0pX\'�ir\"<n�PSWV��j<\"��Υ7̜;�a��#����,�l����eAʠ��U��0�-l\"�����b[�Iy����cp�\n��%��\r ᓣ�i�-��t�i�kh�|D��-�(B�Q|-e#�m.\n:��#��Ѱ<�O���%R�:�����U�ZҰ��sL�[��~p�&[ndڃK&9�`�<p����d��5�$����(w��E��g�<��������b7�i��\0(�~�=�>�����qy�k���-%\Z��}�ʅ��_w�q���~�zz�۽�X��\0�Y	l������������*�bט@B��B*IhED���U�(B�Z�T	m�TBZZ	�\"mI	(��(�`�b[�����{xwggvg^�7k7�,0��{������{�C��&D�t,]�����D\"�	��z�A����ܐ@{������nw��󶸜�#`&���	���*��8N���h���\r]G���$�U 7����6��I���0D����RN��\Z�C��^�W���RnN.t�_���ĵ��U�t�F7qk����B�)����E���FNN��l0�hT}J<;�$|㡍�ɉ$�G%���F��M\\[�99��|���dW�ӷ́9s��0�@�<\n�]���`�\nں��a$�w���q�����%� �d+#B\\�\"�Y��0��2Ý�&S����_�\r7倪����O�����h��1�O�)U�s�if�p��\'�}�Ka��o�p�B\0G7�{]ԛ3Km���y��@��Τ��z����}[[�X�\"�%4�̭�z�c:���I�����!���S@��ק��[��]6��mO�JN�E�ɷ7uuu����\0��	Y�/�cN�h��qH����SȊb3�<Nz�e[�.�y�$��Ě�����f�/�q��H�4T��r�@Ї��c/A�}�4/c�%ո�d�y���(9Au�;�\"k�$�	[%e�d!sȔ�Ƹ�J\\&C�oo�A}so���ǵ��Z�D�v�����r�35�����&N�r@��b��Ӈ	$���h��dF��bL1���M�K���q�|��S�S/��lcFi�ezS�	r9V�+V$8 ��c�%F2��j0��w~w���I�~��P\0�;�-s��<GՉw(�өs��_�q���h�Q$�)\nY�{B��t��cHdʖ��o�ٖ�W̝\\j;P�BCt�<�c�/R��nԁū��/3�Νz�����gSU��9��Gg�u��~(��!��M@�Mfv_\"UA\n��IRzm�J�Q��%~���\r���mgχ��UE��b�W�Z6*;����໿ؿ�����]�e�n<�p�ӈ��n=�c{�(���n�w���.Q\\*r�����҅x����	p��g�iU���؋L��}�ƚ���ʩְ��1  =[�]�|y~�3��^�T�D��P,��_��k��t`ᳯ#�B�b�1m��ƺұ�׌�e���)�).�V��M��T���jA�#�o���IH�ҋ\nJ(�42��ᅏ���z��G�[?9]����*�o��Y~��b��i��8�>�G)��Eb� �i��m�*�b\"�D!o)O�v����;�ݓ_��I��D۸�/)s��]���|,�]N��<�Z�Q~�k�i�h�$+V�KJ�r�/��f��IEw���e�쀼���ȿ��E]��5�ghg�I�/��=�|�>e�8{�W�|���b�}����y���\Z3�TN?T�Չ)Էl�X5l��\n�ێSd���$>#���>b�F%N�b����tR�`�h2�8�a[-��� ��k�Ԓ�PJ�Qh�8��h$j��Z��iڰ�<\'-��f��Z�F=�Ẁ��e��>�zB�Jլo��� ��,f��I,��2�W؀�Hc�]�i:hl��J�\n)��%8����\\|�,�K���h.���`�\'D�?�!��h��M�k�t�5?�X����]?��E˖�lsѻ>x�ΩwM��v�����LD݊�x-Q:�⽔^?O���V�p4oRרX���9��h԰�`��!��!거e87�¾����Wg]��A�q�(���[x8�7n�C˦\r�vM)�VF[zAN	7��>/�Zd;�N)�R(�x,N>������0�\0�k�T�n\Z5MZG}�s��;M�^�p9ïJ%��e+��̜�,���J2Y�H_(~I1ᗅs<��\"�)��\ZW��oP�����o��BԴ���BG�d���|�m^��j�6��JD~܌%��ݩ��B��M���x���ΰppB��g�2Z�x�Ta��.��^ǰY��(�R:�[�u#**C1�\\�D���������~�7f,�\\	��zS[�b������	�o�����,	qO��(�p�ߧN�\"�R-=$���QFYai�I���/�*�h1���\Z���}����YT��Nѱ7�pL��`/:���`��]�:!�v�}��ؙ�?���_����9s:M Q�X�����.���|Yٔ�rZۢv�}>ظN0��a�p]%\r�H��I�E(��r�B\'ݱ��{;��nZ�<�of/[Iw�Ƹv�I<c�:��\"�|��\"z�\Z\r�r��Ғ�/�\'��5��V�*��s<����~=�\\�����M+Z+���_d���5��ދ��ɽ�z�����&$��;_�p\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 �\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0AIDATx�b���?$\'\'o)(��A���.d�g��_\\ےA�ȗ�	��������\'O/G��T�`�c�����0I943�$Bz�0,����ѧ����W����Q�jz�?�``�����N�%�,\0�\0s���Ccc�ӧN�����~��_������}= >\\�Q����\'�=zⳀ��9���g�{�$C���j7q��7����;����������%�,�\0��+�ۯB���d��^\0#�U O�@CCӭ[�~pqq��031���1���-����ea@@���_��:�ЛA���A@A��ۇ!@�hx\"�\0@1�yuѯ������������/�b�\r�5��v�����32��g���� W����i���/\Z�uO�Fh�p������8#��/���r����g`,e�*{�;Nf������;`H���p�՟K�g1D�w�.=���@� ���\0���~���   �EVV�GYE�50 �7�%L�T����������������ً/�֭e��c���d�=���d3���122�0�y�\0.�aùsg������}��_?00�����Ɖ�8m�p��^[���g�_3����v^<~�����tS�=×/��IKH0����1�e%��@��IQ���������bx����{�A�A�����H����[���!(�?��o�\Z1\n����c�]�\"uNn=R�	�`�3�����߿���ؘ��,�]^�z� \'|��a�í�9\r@�/�N�|t\'��(����~�c`����a�or\"W��2,��͐V��	�&�-�D��_��]��?|��` �Ƴ63W18yg������a|����0����?~�g����s>�_�3C�O�_PVu!M�a�9g�����Բ���B�\r� �����;C����\"�2�H��4\"���0\"4�@�0ȋ���Ȍ������v�m;;?�\'����y��y������4��VYY	��I��[���N�2�].�f �M׮^�ߙE���az�9��m6b)P���Լ�<��(p�#�Bl�\'\"��p�uw1�u�ytaN�������ߏlVdF���^�&Έ����:IE��ɱು��;g�/Qqq1��W�j�\n��X���5��#g\0�Us�,�&���nǩ��A$�n��k��8R���jgc�\0���`\0˲P�Jj\"�²�FyQ�k�S3����x<�xB@��1���ʲ��M�Ć�/N�;����0�7Kkr^�*�۱ܽB4�~ݦҏ<�Ƈ�OQ!�SG�II28�K6�U��s���Ba����Z�>������ڵ��>q�Un6�+ܺ�_qHU=Og�9^�:�#�;<�����!�l��.�}����f��\Z}��C�P���D)�3:���B�5��>ChrM%��e!q1��:V&\r�4&ފ����f�����	<�p4���nQ��6��\"���5	�S��H4$\";�!G����� ��z#m�o@�u�G7�������4B�?G�-�v+O�ULم��)D\"�R��\"�񲧅~�𘶡�Р^�D�s�������e^T4?B�� �Eћ,�\\k��9��B����T	Rz\"�JD�������[�{n������T�s�\0�WilTU>��73o�.C[�tZ�[�VZ�B��V�ʢ@$(\r�4�Ҹ��$`��h\"�4\"DRP�%6��8a��2��N���-��cK(�%}�M��{�9���w�8�o������1��v�}���㺺�^��@��%uK��\r�/TV���cO��?����\nQ������x>����m挙�eux�l6&Acc#���Coo/��b,�y��2�`��F�rsiiY\':D��ʕ�\"��QE�����H$B���\'��=0u��;A��1�FMϵ�ot��;�a�0%P]]�z���FVV�M�b���R�)���)X��9�7�5�x\r��-}aƸ5@_B0=E(xDS5X<+̵z�S%��\"�##�`��O6~�ob󠳳��x�0-��\"!���:�2vb�?������\rd��y8�{oOӸ�;w���sK\'?__U@�s�DFC�Y�]�o[FH�$G�E�)�����H��Y�lI5��w�!�`=�2��\rI�n�`0����|r�J��҈���aOG�>]ש�%��^�;��w��}kς`�{1��*B��.\'�7/�Rj����r�H3lNY�Yw�h˛ޅ��ChM��1�f�@\0zz{��(������d��ދGƣ�I�G^���r��L�Ϯ�?�	�0ʞ�pbH���A�޹�x�>���--���n�������Ҩ�xu\Z��%,�;o���ǯ�>f��́K$�T�]$Z2��|�:�/����R��7�y;�	Sw#��)��絶�J�5EUo�bA�_X`�J^�+R�WO��.�a���p��sg<�bD�Z�չ�H����/����������O�@��y�>{>\r��9&�`��q�D���88O��)t���~T�BCp�l=��`����֮/�J�b4\"]�DL�����hް^Lwp\nA�/�,k���\Z:�h�7���í)z�7�Yu�\"Mel�ģ�,��M; iiy�BY�=�5�5J	X(��W%�r�����s�7����4T�l�`/b�y��4���swQ�d�uL�����>R�\r(���c0#�Yǭ5�5�w0pX\'�ir\"<n�PSWV��j<\"��Υ7̜;�a��#����,�l����eAʠ��U��0�-l\"�����b[�Iy����cp�\n��%��\r ᓣ�i�-��t�i�kh�|D��-�(B�Q|-e#�m.\n:��#��Ѱ<�O���%R�:�����U�ZҰ��sL�[��~p�&[ndڃK&9�`�<p����d��5�$����(w��E��g�<��������b7�i��\0(�~�=�>�����qy�k���-%\Z��}�ʅ��_w�q���~�zz�۽�X��\0�Y	l������������*�bט@B��B*IhED���U�(B�Z�T	m�TBZZ	�\"mI	(��(�`�b[�����{xwggvg^�7k7�,0��{������{�C��&D�t,]�����D\"�	��z�A����ܐ@{������nw��󶸜�#`&���	���*��8N���h���\r]G���$�U 7����6��I���0D����RN��\Z�C��^�W���RnN.t�_���ĵ��U�t�F7qk����B�)����E���FNN��l0�hT}J<;�$|㡍�ɉ$�G%���F��M\\[�99��|���dW�ӷ́9s��0�@�<\n�]���`�\nں��a$�w���q�����%� �d+#B\\�\"�Y��0��2Ý�&S����_�\r7倪����O�����h��1�O�)U�s�if�p��\'�}�Ka��o�p�B\0G7�{]ԛ3Km���y��@��Τ��z����}[[�X�\"�%4�̭�z�c:���I�����!���S@��ק��[��]6��mO�JN�E�ɷ7uuu����\0��	Y�/�cN�h��qH����SȊb3�<Nz�e[�.�y�$��Ě�����f�/�q��H�4T��r�@Ї��c/A�}�4/c�%ո�d�y���(9Au�;�\"k�$�	[%e�d!sȔ�Ƹ�J\\&C�oo�A}so���ǵ��Z�D�v�����r�35�����&N�r@��b��Ӈ	$���h��dF��bL1���M�K���q�|��S�S/��lcFi�ezS�	r9V�+V$8 ��c�%F2��j0��w~w���I�~��P\0�;�-s��<GՉw(�өs��_�q���h�Q$�)\nY�{B��t��cHdʖ��o�ٖ�W̝\\j;P�BCt�<�c�/R��nԁū��/3�Νz�����gSU��9��Gg�u��~(��!��M@�Mfv_\"UA\n��IRzm�J�Q��%~���\r���mgχ��UE��b�W�Z6*;����໿ؿ�����]�e�n<�p�ӈ��n=�c{�(���n�w���.Q\\*r�����҅x����	p��g�iU���؋L��}�ƚ���ʩְ��1  =[�]�|y~�3��^�T�D��P,��_��k��t`ᳯ#�B�b�1m��ƺұ�׌�e���)�).�V��M��T���jA�#�o���IH�ҋ\nJ(�42��ᅏ���z��G�[?9]����*�o��Y~��b��i��8�>�G)��Eb� �i��m�*�b\"�D!o)O�v����;�ݓ_��I��D۸�/)s��]���|,�]N��<�Z�Q~�k�i�h�$+V�KJ�r�/��f��IEw���e�쀼���ȿ��E]��5�ghg�I�/��=�|�>e�8{�W�|���b�}����y���\Z3�TN?T�Չ)Էl�X5l��\n�ێSd���$>#���>b�F%N�b����tR�`�h2�8�a[-��� ��k�Ԓ�PJ�Qh�8��h$j��Z��iڰ�<\'-��f��Z�F=�Ẁ��e��>�zB�Jլo��� ��,f��I,��2�W؀�Hc�]�i:hl��J�\n)��%8����\\|�,�K���h.���`�\'D�?�!��h��M�k�t�5?�X����]?��E˖�lsѻ>x�ΩwM��v�����LD݊�x-Q:�⽔^?O���V�p4oRרX���9��h԰�`��!��!거e87�¾����Wg]��A�q�(���[x8�7n�C˦\r�vM)�VF[zAN	7��>/�Zd;�N)�R(�x,N>������0�\0�k�T�n\Z5MZG}�s��;M�^�p9ïJ%��e+��̜�,���J2Y�H_(~I1ᗅs<��\"�)��\ZW��oP�����o��BԴ���BG�d���|�m^��j�6��JD~܌%��ݩ��B��M���x���ΰppB��g�2Z�x�Ta��.��^ǰY��(�R:�[�u#**C1�\\�D���������~�7f,�\\	��zS[�b������	�o�����,	qO��(�p�ߧN�\"�R-=$���QFYai�I���/�*�h1���\Z���}����YT��Nѱ7�pL��`/:���`��]�:!�v�}��ؙ�?���_����9s:M Q�X�����.���|Yٔ�rZۢv�}>ظN0��a�p]%\r�H��I�E(��r�B\'ݱ��{;��nZ�<�of/[Iw�Ƹv�I<c�:��\"�|��\"z�\Z\r�r��Ғ�/�\'��5��V�*��s<����~=�\\�����M+Z+���_d���5��ދ��ɽ�z�����&$��;_�p\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(39,'sys','save.gif','image/gif',1691,'2013-12-14 18:15:36',1691,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0h���\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:8375AB4E69DB11E0B4219AE9E4956031\" xmpMM:InstanceID=\"xmp.iid:8375AB4D69DB11E0B4219AE9E4956031\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8B7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>\\���\0\0�IDATx�b���?0���E�#L��zɓ�?|c\0 ���o��������j�X�&Kex��%@\0���\0�������������fY;�1}���A\\\\��w���0�|����W����!��\0���o������Ͽ��~�\r�q߅7�M3�&��T~���!g�)f&F& ���������������gtZ\n�5�.����\0v�Y֮���y���������2002 �&󜽳/=���ǟ��_9���7�����:���kO|d���#Xק�R}Ԅ��������%��2p�21��tP�ZO��FK\0�\0����/���$�?�{������÷o?!��60��1��5��g9��o�E�#��0}���o0��~�	��\0���78��\0��ӹ���\0�W��������h1+�`X�������ǯ���y�K�C:{ύ����oX���7`8}FfJω����L��%�Go~��u�������+����	�du�\Z�����O��20122p�3���w`bx��/�O`X���ͧ���f��3�@I`����0i�K��D�%:V!� �A������gP���\0�g��\0\nU�E��M���2|�4���@���A KN?:�U�����_����/�����EceN`\ne`0�����������;p<J΄\0\0p��O嫮\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0h���\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:8375AB4E69DB11E0B4219AE9E4956031\" xmpMM:InstanceID=\"xmp.iid:8375AB4D69DB11E0B4219AE9E4956031\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8B7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>\\���\0\0�IDATx�b���?0���E�#L��zɓ�?|c\0 ���o��������j�X�&Kex��%@\0���\0�������������fY;�1}���A\\\\��w���0�|����W����!��\0���o������Ͽ��~�\r�q߅7�M3�&��T~���!g�)f&F& ���������������gtZ\n�5�.����\0v�Y֮���y���������2002 �&󜽳/=���ǟ��_9���7�����:���kO|d���#Xק�R}Ԅ��������%��2p�21��tP�ZO��FK\0�\0����/���$�?�{������÷o?!��60��1��5��g9��o�E�#��0}���o0��~�	��\0���78��\0��ӹ���\0�W��������h1+�`X�������ǯ���y�K�C:{ύ����oX���7`8}FfJω����L��%�Go~��u�������+����	�du�\Z�����O��20122p�3���w`bx��/�O`X���ͧ���f��3�@I`����0i�K��D�%:V!� �A������gP���\0�g��\0\nU�E��M���2|�4���@���A KN?:�U�����_����/�����EceN`\ne`0�����������;p<J΄\0\0p��O嫮\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(40,'sys','systemLogo.gif','image/gif',3277,'2013-12-14 18:15:36',3816,'GIF89a�\0+\0��\0�e�n*�m�r.�t�x8�x�|8��I�|�EՂ΃,܂ ��I��R��^���V֊3ҍB���f��[[��aŕV˔QbғLΕEԔ@͕KӔFٓA�4��h��n��;�\'۔:�+���-�&��/��uΘZ�7�!��}��gМJΜP�)��r��m��m��yɝo��%�#��h���ġ]��.ߜAác���ȠdǣY�4��0���Ȣr�&��0���ΦOҥP��y�/ΦV��2ͣzǦn���ԧR�T�OĪpרL�����4� ȫkĪ�ڪG��=�A�,�]ܫA�:�5Ҭ[�=��Fƭy���ЬhԭU̮hΫ�̫�ߩp�5دQ��G��&����lѯwְe�9�FѲe��P�G�1�@�)ڱtô���Z��=��E�Z�C�+߶W�K�=߶^ݶdǷ���N�Sֶ�ҹ��7��]�VǺ�ط���d�:�Q��_�X��K깁�D��n�_�a̿��S��[��N��������p�°��q��V��k��z��v�����l��r�ç�Ų��l��_��z��a�ǀ�ȶ��|�Ń��j�˿�ʳ�ʊ�ǌ�̴�̖��s�ʆ�ˍ�́�͇����Ѝ�̕�҄�Ѻ�Ӌ�О����Ҙ����ה�؜�ծ����٣�֪����۳����ޭ�������޻��������������������������������������������������������������������������������!�Created with GIMP\0!�\n\0�\0,\0\0\0\0�\0+\0\0�\0�	�-/X*\\Ȱ�Ç#J�H��E���u��;Wָ�I��ɓ(S�\\ɲ�˗0YZs��7`1s��ɳ�O���\r���ѣH���eO`Q�P�J���߷e=��cn�ׯI�}�\\ג������۷:]�b�N��}�J�S��ܿ�Uv����Å��uX_~K�L���˘3k���0(P�B��-_��Fs���1#�c˞M���۸s��=\Z��i����-�i:��C��У���Vϥk��=�3�Ϻ����w���ӟ�w�f�ݲEߖ�����b��/)J�K5�8��b��߂6� z�(��0J����b�	%�t��.A��p�&���D-��b��3��.���hr�-|`��i������h�H&i��u�JF)�RBI2Xf�e����	4�I�7|M &�+�0L?@�yN�l)�tֹe�a�|��%%�#蠃��Hg&�cj9�h%�$<���N��馜v��)�騤�ʩ\"���ꪟ����-�1?��(Μv�$/`�A��s�6\\�j��&�,���Ĳ�F+m�_��˵���CB ������T��\no��N(�8B򜆅\"����\\�����F��^kJa\\ ���.ͪ���K\"pHb\n���\"	 a0��у���j��ࣖ4\r��2�T�.�9����-d��9����D�R�6��!	ѱ8��΀��9�䢄�0ݰ?J0=t$;l2�6�l��!8D��Ъ� `5�S�0X\\a��^�ڃ�\Zf��iD���[o�A�\"l�-�0	_�8���ñ�Z��@yo�f?�Q	�[+A�*���I=m��!a�r�#E�Ӻ?�(!�锋�D�=�&\"@^c����8_z����8�-��\n_�d`F\"�t_D��ԣC�kl����H�O��}�:؎�?���*J��V?���W=�{��A�����8\r.l��W���aܣV��h	T���3t!|q�\Z<���eØ*�q>����D��CO��z|*��	s�f�w�� ��j�?�����8����[�&F�E-k�@ �֔\0y�FC���/o�&��C�\00���&�A�����	%�����0A\Z�\nsEP#Ψ,(��6��(�ɀ�F>��j�y���=2�<��hҥ�u�z��&ƀG<fAq��,C��11|8D-1��������Z�\ZP����&�<��E����\"�\0�}r�]��^�X�E��!VЂ��0���û����\'ހ�\"���T>� F�l#\n��g�Y�.4��\0R=���#da��ö��oj���G�5=�E(��� u���-@�0�w�B�����Cp\ZP��|�E\ZpZ�4��I5-^���\0�7�UG�ԭ@.	�p�=�a�3Y�4��ٙ��,�����F�<��� ͡\r�@T�����)\rZ��M؁�v�\'<�p�.(�\Z|ҥ��Qm�i*�G<�\0.<Dv3:��\r�)MR�+b�\"w��]T��\'X��`��C!��7�\0\r6�i!�ZcDE�L�*ܴi�Bm��D��#�����:�y��U�hS>Dp�\r����u���7��\r;�w׶���G?�I#����(Bn�Z�1�I����ۢo��X��x�\Z�y�9�y&�\0i�Ln7s�	]u�6�0�`z�#<��\"\rt���茓�(�e�P���wy�Nm�����ShB�Zs����&���3�\rH�H\0�E�R܎8��Rs��\rX8��7�ȏ7��q�=`Z�_��؀^\0a��Exr��@�?,d\0x�����uz\0�X ��u���n�,|�9h9	�PY<f�@܎P��H���1ѳa�\0PO㌷҈2��9�QG��4�s��m����(�M��|l��F(ϡ�L;�E���<�\0!�H�\0�eO#-\'\nGE��}&��a�������9��-\"_�A\Z}�\r2R;�Ю��y~o�r��T�ȢCh5>G��M�\0@�Ŭ�a4�.�F	������0��v4u�1���|���_��(�Ň8Gb���L8Q�vQP\0\0���h�̥H*s\0@�a��x��\0�4`kE�������P��\r3���Y�%(GoQ.P/L%���5�\rd�`W��|�Q�p�ۦ9d��\0\0\0s�y��;W�2�;Q\'8��B�(�70	��6Z��,�@h@*�j�&j�����������?SH�224���x��ՁW���u�G������g���B����u�Q:��`����*��?���8�M7�����?�Z	Ʒ+d ��e/S�\'y& `3�b�j׀&�0Ԁ�؁�~=`�x��&x��W�\r��I�28�4X�6x�8��:��<؃>��@h�B�� �\0;','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0\0\0\0��*@\0\0�IDATx��Yyl�}�������Z�)RuZ�,:�d)��ڑ,�I�?�E�q��H�Ԫ]	�5��an�p�ƍ��IkK6\"+��Ȋ*�$R�-�Kr��]�9����,-�!)9�%��0�̛��f~�����]�a4-3�Em����4M��N����x�[��6l��:��m��Ɵb����tg�n�ޚ;��MM5]������,���vV��;���v��掕nw#�k�2B���.�0rd�f���Wt��d���Έ($����;��Mw�Q=����ȸ�y[%�%���h�q�,�������_�,�ܱ���Z�\nx��W.:�|oG����z�%�KG����KӓAԔg��c;%^UɐJj�����]���%X�iX��)J�{09GU�\n�[��zMcO��k�X�N����2]g0-�f��u���?XM�h2�bѝEn��w�A:F��Xꪇ.�Ћ9�=��H`Tz/=�w���F5%6�Y2��eV`�[l` X����f�:�j��:}(�$��#��P��o��XQ�b}c�Q[i�t�99$FI,6f!�s\'�=�d�c������`6�?�a�i��\r�B���Z/��������-����X��:w>�~ym]t <܋���@]��\'9~#*�[��ȫ�P_��tB��JД�lo!=6	-�\0��@�ˠ���q��᫰�sH��rN��9L�Ҍ;�BY�Ѽ����;N�\0D�Z�߹Q�@dAz��WQ��Na���-s�q[K�4xM1�\'K��Q���{�W�B:F�\\�������P,�TaȞ�x,1.H�Cˌ3�Fz:���ϕ���];���߇�S���;p��T�#�5!���/��g��<7�Sja�R�c��R��Rщ�⇢��S�ژ4�B6A��h��Cf@��\"��kz��X����Ȧ��2s�\\�!+nd5\n4����ťa�2�����A���#�!R��8eBΨ�?���{M*>�*ēO�&~4 ���_��P�w?.6c�g,%b6�ѣϣ9�9K�QD��.�\r`͞\'Jp\'��\n�\0��Ú��=����d���Xd�Ǫ�/!�Nb��>,q�Ϲ����؜`9\ZպB!���yD���ROdVf]�l1=��9��֠a�#(s�Q��C)��1��\n���ҨR\0D�vH�=hh�\n^��4�4g��}\r�L�3�����KVcd�\"+��`(u��\r�t��i3���\'�����4��R�(j�ߐ-���;Tq|c?G�����_�#�z,!o��!b��-������&��Ux; �V���.C�������_��[EQ#h���./\Z���G�s��	\nuN-3��J\Z]�uXw�_�2��L�\"�td�hC]�Z4~�;J�ѼI�&��b�.X�Ą�W�|��a؝^4m�e��2�o���(�Q\n8U�ƺV�<zv�{O��!|rP�[6;W^�-\\\\zu���>�<:�lH��o��v��އ�t\Z�HC�\0<��y���T!&���;��7��η��ҷ0����9��eF��F�΃,�oZ�b��߄hw����p���1�E��͑��j���K\nX޶���Ebjj�P9�:����E�_�Ќ��c:�w��`ln��K��#�I�[WOP�����xj���\"C� �X�R\rcF���\'�8\\�4w {�M��_�rY*_� 4���^�Jv+���+��C`T,��05�zX�,��И�<�}9�V��T�=�)��5SB�Mʀ��k���\n��N~!2���(�n�����]��.#~�Ed����a�(+�9��-�\"�F����1`�i�돪�0�%��0�n>Vj��k�݇<�E����AZ���0�/�N�/ݧ�mSd.A����J�wm5���R:G�L$\'�H�J�Q��HI�G���|���%�Sq~�0T#1\0n^��n�2)�/\rv1S�L�1�)^��Z����k�(�Be�\nT�S��L5b��qh��$��y0}C���b��}�o��n�=MZEZ�l^8��b%a-O�?�́o�M��]n����(I�ۨІ�8��y�+4�Ɔ����KS��G���K`�Dv���9(;\Z?-�h)���so���G��|.=��Td֌HF��:�4~L^��P�Z��||1�ff�!LY�>��ř�&���f`^3Ĝy�b?��\'�si5��MhZ�_u\r���ܻ��kyk/����m�P�x�w�.�X�U����*Tuq��|\rLM;	�\n���֯C��F�;ۏ�+g�sWf��!��gl&�)��Q�6��a���ȵ���/ >1`��ظ\rn�.�֍�;e���Y�&�M6dfX�&䈶jirV����J4��3h��ҾH�R[��®�-�JE�*dT�,[Tk0��D%�E�>��� ��\r�d��O\"��Gp���b:4D�eQNU��ܘ�,��հm�2��x��/��3s�ꁚ�OBy�|MX�pZC�{��n*�S\'�C���pRԴ�Ɨ�E��$����V�bm�N3��s��S��Pq^܏%-ͨ�w��(�~�����U�:\n)�8��h������M�@�@�}���:]��D9s�ʯs\n�\Z�aa:1=6�ʦV�k����^���E,NCyǟ��0�����$�+���eE�<��w��F��,�lf3\nR�ww�2r�և�������rl��\0�����ʠE�����/����j��0�9�{�NJc���j�<_U|�j��~i������֮��D�]\r��c�\Z@EM3�A1��7td�~MM��\'�M[�v\"m��Yy/lT�Y�����%uh�AH�\r�a\n	�Qn=��#�@Q�*�Zж���x�(������;��D*�1t{�}U�@�W_D*C��I,��djWN��8vC�pO�^�=�0W���;������H�q��#�W5���Y�b��5��Eg#�>���1��\0GZ��W �y��!H����.�L7��1�ѩ���Q��$����w�g�]z>%8zW�F�כ�6�־�aA�:&��O��g�!b���HE�8��EYߋ5�R��D�u�\'��_y���4����8�x�A�����\"g����\"��Dv��	\\���@�`sx���H\'\"��OQ��#8���Π��d^�GW2�ܨ~e�ĲH �<��8�����{mL��|��=�۲H�L\n��.Įv��\ZD����Hs�F�uA��r\"�|��I֤�<�w�l���X�z\n��~�8�J���LDn�e�PXt��X�V��(�9bP!wf�\0E.-<�刂�+ᰛH�bf�H�(\"��>9O��P8��9��(2}�D�[�qv�qS-��`9�M�\"ʪ%fE׵1�� �B:�d��=�P-�E丛)�D���7���%���zU��\Z��F��X��f���ґ\r�\0��#��7�i$*nJ���sNc�I	�n���*B���(N���:UrS��M���g*�NĆ.��}h(����C7?񓓓@w���$,k�� ���H��\Z�Og��V4�j=9d������ޯ�ћ�lئN`��͐�J䦃X�W!p�~��A��б#6���M��Cn�]ԥO����l�����z\Z�[�>�?��6U�yJ��9�A¦jQ�7�����ۭt�����9�׼߬���ڹ�5;�<�__�.M��N����Fmv������;����F��2n^�\'���\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL),(41,'sys','view.gif','image/gif',1019,'2013-12-14 18:15:36',1019,'GIF89a\0\0�\0�\\A�bL{t�~���}W�c��L���������������������������������Ց0��eג0ؓ/���ȗ_ߚ3ѝ_���������������è�������Ӫa���׮c������̮����ҳq���Ӵs���ڶm�����ô�ĺ�Ż�Ľ��ջ���ɽ�ƻ��߽���˽�̾�Ϳ�ο����������������������������������w��������������������z��{���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0��+�\nD*\\�d=x�qf��-j8��H%2�X�����:X�d��c��7����e\r�4cTXt��.m�ȩ#���=�\\!34�8!,Bx$��7w	�Ģ�C��q���&�Ͱ �:R\0��N�<0ф�\n���HC�V��D�\'&�Y,ЇH$�,P��$\0pا@\0\0;','GIF89a\0\0�\0�\\A�bL{t�~���}W�c��L���������������������������������Ց0��eג0ؓ/���ȗ_ߚ3ѝ_���������������è�������Ӫa���׮c������̮����ҳq���Ӵs���ڶm�����ô�ĺ�Ż�Ľ��ջ���ɽ�ƻ��߽���˽�̾�Ϳ�ο����������������������������������w��������������������z��{���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�Created with The GIMP\0!�\n\0�\0,\0\0\0\0\0\0\0�\0��+�\nD*\\�d=x�qf��-j8��H%2�X�����:X�d��c��7����e\r�4cTXt��.m�ȩ#���=�\\!34�8!,Bx$��7w	�Ģ�C��q���&�Ͱ �:R\0��N�<0ф�\n���HC�V��D�\'&�Y,ЇH$�,P��$\0pا@\0\0;',NULL,NULL,NULL,NULL),(42,'sty','login_form_icon.gif','image/gif',2059,'2013-12-14 18:15:36',2059,'GIF89a0\00\0��\0j\\Aq`AtdD}bJteJ�bG�bLxhH�gM�iR}lL|mR�oIpU�nS�sW�u_�rZ�vP�rW�wZ�vZ�{T�{O�ya�{a�~]�z^�X�e�~a��a�c��^��Y��e��k��f��a��n��n��h��i��p�����f��n��y��u��j��p�����s��m��z��z��o��j��������y��~��x����s�����������w�����������������|��������~���ä������y���Ǧ�������������̩�ɩ�������ĭ������Ʋ��ɲ�ǲ�Ʋ�ѯ�Ǳ����Ӱ�Ͱ����˴����̵�˵����ɵ����ֵ�ҵ�ʸ�۵�ɷ�������ϸ�ѻ�κ�������Ի����޺�μ�໏־�Ծ�������ʿ�����������¿ݽ�⾘���齓�Ļ��Ú����ž�í��ƹ�Ɯ�Ƣ�ã����ǣ�Ğ�ę����Ȟ�������ʠ�Ǜ�ǡ�ɳ�ʮ�̢�������ʤ�ʪ�ͼ�ϫ�ϱ�̦����Ц�ͭ�ϳ�������й����Ю�Ҩ�Ү�ϯ�԰����ӱ�������Է�վ�׸����ִ����ش�׺�������ٽ�۶�������ܾ�������ݹ�ܿ������������������������������������������������������������������������������������������������������������������������������������\0\0\0!�Created with GIMP\0!�\n\0�\0,\0\0\0\00\00\0\0�\0�	H����*L\n�B��ZH��@^+L\0��Ə\\�Yy�*t,�%�#�H���Ä\n)O�Xr&N�\"F���e�\n `�x��:C+bsP\0Ê�z�a�Q)�A@Cխ`d\"�\0�ȏ6L�P�M��5˖\r�pٚ�R��݄H(�ʻ7�s��V4��a�H<,>�7\\�Ȓ��P��A-.F��\r\\8r���#��ߦ`Qݬ��s�E�s��<3�67��y�&F�	��X/_�|��Z�+��_���K��\Z_e�0y\'Xj��^�Ɠo&\rX*n�������(L,���3ޘ��B1�C�.�PC�;�$҉-�tI�a�C	��K/�Ē�(��� �P�;�*��Uˈ���+�pr�@����T�L�0�- ��#�2�(�PbFi%�B\rdǌ���9C4�%l6�\r�d�A�q�\Z,D��P�0����7��@��1C��@*Q̓)N��A=�Aʡ��A�	�C\'Q�CM0�H��dL��@�_PqDBL�@�P朚ꪭ��L=�|�	ua�L�L37���*��O=�t��	)zkE�L��4�@�N2y�+-����>_�a\'Bv�Z;�0�M:�=����5��O?w�!	�1C$Y3K1��CO>��c�?�X̏?��#l���D\\a��W4�A	2���b3��{O����1�<��9��I+��K.��Kѭ<F\r`;}�2;��1�:c��)��Ci�aI.δ��6°	a4�R4�+�����>|���?��\Z�xK4��.��\rF1D]�<�|�\r�\Z�Sq朇-8ᖰb�8�,�K�x�!7�1�\n4�L����n���<v\Z�X�襟�ܒT�,�@��:�܌�����N���=w���I1�C3N?�������1����oO�,�0�4��>�������A�šNu���?2q\nmx�~�F>&H�\nR0l8�\0a�t(~�@ ��4��Ӏ3��bP�0��1H��qЃ�^ꈧ@�0c�h0�)��}�c�І�Q�&Ʈ\"�]��������,2��.zqo@\Z�@Fj �\Z�.:��ƅ���W7�Q_�bx�c1> �&��l��1t����h�p6�ah���#������bX4 ��\0Dh�� 9��\nM p�0 \0�9p\0(��|\0 ��,��\n8�\0\0��B�8D�P�-T\nЄB���2���\0�@\0;','GIF89a0\00\0��\0j\\Aq`AtdD}bJteJ�bG�bLxhH�gM�iR}lL|mR�oIpU�nS�sW�u_�rZ�vP�rW�wZ�vZ�{T�{O�ya�{a�~]�z^�X�e�~a��a�c��^��Y��e��k��f��a��n��n��h��i��p�����f��n��y��u��j��p�����s��m��z��z��o��j��������y��~��x����s�����������w�����������������|��������~���ä������y���Ǧ�������������̩�ɩ�������ĭ������Ʋ��ɲ�ǲ�Ʋ�ѯ�Ǳ����Ӱ�Ͱ����˴����̵�˵����ɵ����ֵ�ҵ�ʸ�۵�ɷ�������ϸ�ѻ�κ�������Ի����޺�μ�໏־�Ծ�������ʿ�����������¿ݽ�⾘���齓�Ļ��Ú����ž�í��ƹ�Ɯ�Ƣ�ã����ǣ�Ğ�ę����Ȟ�������ʠ�Ǜ�ǡ�ɳ�ʮ�̢�������ʤ�ʪ�ͼ�ϫ�ϱ�̦����Ц�ͭ�ϳ�������й����Ю�Ҩ�Ү�ϯ�԰����ӱ�������Է�վ�׸����ִ����ش�׺�������ٽ�۶�������ܾ�������ݹ�ܿ������������������������������������������������������������������������������������������������������������������������������������\0\0\0!�Created with GIMP\0!�\n\0�\0,\0\0\0\00\00\0\0�\0�	H����*L\n�B��ZH��@^+L\0��Ə\\�Yy�*t,�%�#�H���Ä\n)O�Xr&N�\"F���e�\n `�x��:C+bsP\0Ê�z�a�Q)�A@Cխ`d\"�\0�ȏ6L�P�M��5˖\r�pٚ�R��݄H(�ʻ7�s��V4��a�H<,>�7\\�Ȓ��P��A-.F��\r\\8r���#��ߦ`Qݬ��s�E�s��<3�67��y�&F�	��X/_�|��Z�+��_���K��\Z_e�0y\'Xj��^�Ɠo&\rX*n�������(L,���3ޘ��B1�C�.�PC�;�$҉-�tI�a�C	��K/�Ē�(��� �P�;�*��Uˈ���+�pr�@����T�L�0�- ��#�2�(�PbFi%�B\rdǌ���9C4�%l6�\r�d�A�q�\Z,D��P�0����7��@��1C��@*Q̓)N��A=�Aʡ��A�	�C\'Q�CM0�H��dL��@�_PqDBL�@�P朚ꪭ��L=�|�	ua�L�L37���*��O=�t��	)zkE�L��4�@�N2y�+-����>_�a\'Bv�Z;�0�M:�=����5��O?w�!	�1C$Y3K1��CO>��c�?�X̏?��#l���D\\a��W4�A	2���b3��{O����1�<��9��I+��K.��Kѭ<F\r`;}�2;��1�:c��)��Ci�aI.δ��6°	a4�R4�+�����>|���?��\Z�xK4��.��\rF1D]�<�|�\r�\Z�Sq朇-8ᖰb�8�,�K�x�!7�1�\n4�L����n���<v\Z�X�襟�ܒT�,�@��:�܌�����N���=w���I1�C3N?�������1����oO�,�0�4��>�������A�šNu���?2q\nmx�~�F>&H�\nR0l8�\0a�t(~�@ ��4��Ӏ3��bP�0��1H��qЃ�^ꈧ@�0c�h0�)��}�c�І�Q�&Ʈ\"�]��������,2��.zqo@\Z�@Fj �\Z�.:��ƅ���W7�Q_�bx�c1> �&��l��1t����h�p6�ah���#������bX4 ��\0Dh�� 9��\nM p�0 \0�9p\0(��|\0 ��,��\n8�\0\0��B�8D�P�-T\nЄB���2���\0�@\0;',NULL,NULL,NULL,NULL),(43,'sty','posweb_header_background.jpg','image/jpeg',765,'2013-12-14 18:15:36',690,'����\0JFIF\0\0H\0H\0\0��\0Created with GIMP��\0C\0��\0C��\0\0�\0\n\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n��\04\0\0\0\0\0\0\0\0\0!1A\"aQSq#b��BR������\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\"\0\0\0\0\0\0\0\0\0\01!Q��\0\0\0?\0�!�bi��b�4�fD>L5�4�n)�k�\0���PW���?@�\ZI����+�Xh�\0ҵ�6\0؊�[$@�*&*EC�p�����DY!�-�H���DL���4R\Z詹�AIʻ4�\"1��t	�D� ^�h\Zs�<��)�\"$O��xH��\n:�b�D�6��a9�sQ�����V�Wh�?��ۻ��)��\0I�e��G�rO�����3�q�t�$L&._J侸�[~����?�@���h`@�k.\n�\\�mmw?٪�6=�B��2!ϙ��o[f�t���@2�\Z4�Nr{gOZ\'8z��1mD�6O������M	{�p����Yp�5�*u�������b��E�Y�7��\\�GO�Wb��\' �ˈ,o��-�C�F)���\Z���E��0)��(F��Zm���(��','����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0d\0\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�*(���p��(QE�m_z�߶�\0⨬��]��=�nvC�ފ�����w+��U_2�Ӕ���h�����',NULL,NULL,NULL,NULL),(48,'sty','top_background.jpg','image/jpeg',28986,'2013-12-15 02:25:28',1130,'����\0JFIF\0\0H\0H\0\0��\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0��\0\0\0\0\0\0\0�\0\0\0\0��\0C\0\n\n\n\r\r��\0C		\r\r��\0\0��\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\Z\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0��\0\rDU��叡���\0\0\0\0\0\0\0\0sm�\\F8}\n*���Y�����W(̬-*�9�L�\0��S�X�\n�°��K\n�ج,��°��NsX�\n�0��脷*�.f��+���N\"3��R�)Fwqۈ��8�3M�Ҍ��o�}�����RZ��K�z�t�U,�;��*�9cFH̲�<L�pn�h���g�2i!=�>{��p⾓���Jі���n�[�y|��y�[��C��h�#��\rŜ�����);�^����|��|7�xǳ��vW��0+���1! !HA0LH@I@A!�L�VgA&Q\'8�>��+�ϻ�����OCs�����_V�_�|����.߭�K&����=~���r���\'�r�<ݩ��O\\N�N?c3��뎻=�k�#wbtL<���hl[$݌L�Ś\"�dH#��z��}c���{z�S��}J���~uq.u~��н����s[gÜ�^KG_@C��W��y�?q�3�D���_GF�`�0\0L0�L\0L0\00\0\000\00\0I�fLY�i��1��S�{�&�m��W�W��)�Lk��G6����O3WN�b��]Vh�s�u��geF���.�l���<��3���Z�n�;:zI2�&�o��Y�(�.���\0��S�z\\�;��sO��W���	ø�j����|,y�A�m�8}BWg_h\0\0\0\0\0\0\0A��>	�qz�x����Wezi�\"k�\0D�0\0\0\00I0\0\0\0LL\01!\0NX��KD����bEs���%��mO8y������e[�3��ر*,�6������oI���$r}zN\'��u�N|�=W#�f(�fba9�NI�,؝�o[E���|��[c�>��ܰ���n��d6\0/\'�����wZ,p�N��&�:��]�\0\0\0\0\0Ἶ2�=���~^��>b���{�Smx#?)�H�A�Ddv�� vQ��xD% v��DD��D��:�6�{w;Ҿ�9�Sz�h�p�Qll�f��RP���6�7\0��}��)\'V��:$��|�Xs���~�Ť[��ջ]�e�&o��T�5حO=4�}�����t�ҵ^}��e��S��i��2�_����zn����?V˒�~��|���o���&���?�����G�?�����;�ӵ�y�U��ϻ�<���*�+��Oh�}vi7�_/�L�[������/�򀼠/�B�p`�/(�传/(��b\n�\\���M����9�� ��Bу�)���٢�t�[jƟ�<g3�h���z��t�q(��<+h��y�F=7A��q���6�Βc=ѫ�e�1�x>�U���G!�y���ncT{^%�Qx�������\0Qt�	�_L��	��5�����}�!��x���뽗��/�^������NZ�v�\0u|�V��&E�d\\���i��pbV��x�`ZF�L��$ĭd\\��a`dXY��{49�T��]�Z������֧�,˚T}M;8m�]~]�#�k��͐G|���B1����|��%���+�۝��>�\n����yO�h��\0K��s����4,[EA�`dX=nU�OcU:�o�Y�՚f΋W~�[T�uu3�W��6��f��Y)cE�]���UPu�N�k�Dg��E2.J���2,J�3����1+0�1+�3�|�@��0.���.���J��c�w�i���\Z�2�{��]�ǳ�_\n��ةLMգi��r�\'��?��Ll�kk�(�z�U�bpc��z_�Z�o��/=�&��(��~s0��\"�1����@����*\0�\0\0\0\0\0\0\0\0\0\0\0\0\0X2�� \0\0\0\0\0 \0\"A$��@\0\0\0\0@@\0�	�@�	��B�/���y�	\0B\0M�K0\'��\\\0R@�L�	ݝ�Ev\0FY@\"@A\0O�����\01\0\0\0\0\0\0 !\"013@#$4AP526��\0\0�$^č&��A�?�O��gö�9^�<$�Y�������\r�;7P�P�P�P�C�C�C�C�C�C�Cu�\r�7P�C�Cu��\r�;;;;;;7X�P�P%���T�l\rf7P-�� JPʳ���eaǖ�6�ade@�d;�`�dF������Y0=ɃkF<����	Y����}F2d�2�������\r�;7X�P�P�PD�\"���Lr^��~�Y�U��\\m��Kv�1�ԏW?O�FFFFFd�`�#`JϦrGcoL6$3-+$�#L�P{-6mGm-���U:V^�����	��(������dg�A������-ڪw)w��et�ި���U��Y�ȅ\"k�[��l��7�����6ˍ2���U�+76��(��{�ݱյ撫jm������/�\\�ieO]�b*�G.�s��\0u���GrH�ȼ�H{�	��(��IH�%jh�Yjl�C��X��G�*��l����p^\"�-ɄË�a!6�(��&=�Y��H�>��#���X�H��	u`� �����3�ys��N[9Hͣή{�9#ז�N��0%KT�!D�7_��8�qQ�r̙��9�96e3��\'�]��d�YN���D����}����$��9��q���鯤ysjJ��=��r.qnx�@rH���[�r��f�Q���[\"-�y�|�Jun$�M�E�~�#R[V��^�X>#R�����#͗\r������%�-�8Ґ	$��������9D�V�iX��Mv�fݗiVݣsi�1�jZ�i���JFb��5FK�~L8i�J�A�ZU&К�\"�\n\"`��F��\Z&�P�I1)��r*�z3�d�n�)1�31!���\0����d��t���4*�bu{l%�����Đ讎������2@��4l�d����7<y爰K[�I��<f}^�m��j�%�!���}6��\\��QNm���Ɍ\n�\'�7���f\"����\ZK�EJ�j���\0��,��aU��u���b���:�,GiL�����\0�\"��hc\0�j0D%�\0�!��U=�mU*�&�-�hK��8v�-ǐO��z��3#��Q�az�].�vO���Ƭa�9�ͥvo�����#2I�U�˫#�@p[+kX��$\r@���ufز�YO9��b��HD�ġ[\\l�� ��!�\rK�hK�v���<l��\0��XG�9|��3�2�eB��fW����\0��\Z�оa�{\ZO�#\\WiXCϸ\Z��\r�`�\Z�m�S�F�Q�4���͘?:��\0\\9�	\n|���%\"?Q��(G�� I\"U��X�~A�FJA��l�)vv/B�ilKbIFh�Q#!)\"�ǪԖ�p�*b�eqHʪ�B��>�Ϸ�H���$P̞�W?O�&�>�� C���!��C��r��T{�q�-a��2!�(x�0�_�q�@�S��z�R�Qe�!�<���\na*{��cqgfQ�-��}���]�_[DD`��Ҥe.�!g��ЂF>)��cI��.�r��r�[���\0?w8��]ú}\r���w�UE;����f��t��Ht���|���t��Ht���{�ΐ<�ΐ<�ϐ<�ϐ<�ϐ<�#ΐ<�ΐ<�ϐ<�ϐ<�ΐ<�ΐ<�ϐ<�ϐ<�#ϐ<�#ϐ<�ϐ<�#ϒ\nt�\Z�d�t�0���j�Is�y�{��VMG)i\"��ϒ=�P�IB��ۍڟ��j��u2�KPT�IE&Y��|�	��P�P�Pq�H�|�]>L�k�r���Z$�>��G���({���r�y=��j��*\"$�nżeW��OjƳ��YQ��a.ϗs[;h먦�휙����9bvQ���~�}s�s鑟L��Y����\'`�k\"�qK?L�V��\"*c��P�oR��a7�{U_t��E�n��9n�I��(��6K=�H\"���nC� ��1f�dBZ��3j�ěԐ�z�~>M!�t��0�q�7\'g����\Z]us<�r�	��k�9><�O[��uR-�ő��ٺ�\0 �������;D�KX�nMȥD���m�Wr��V�O��v��8���\n��&���ddddl22226\r�FFFFFFFFFFFFFFFFFFFFF�####\"*��~fx)R�J��5��햤�+�������E�V��]3[��Q\'�/�-�}\nEܤ��\"�:�2[�L �[l2��s��v���(l}f\r�Y��!\'��|��dl26��m+���j$?\n΍�!ǫky4;�\Z�.XW;\\\'?,ߢ�\rT�|�E����]�M��x�������k��\\�Di<&{��\n��;I����+�d�j�ƫ�A��q?���))�T�c�a7�=��a��l6\r��#a���l6\r�FFF�a��l26\r��a��l6��FF�2s�+<�g��8�\'+m�Yx����#�\0IiJ��<\'���~dq�D��E�����u�T�%���Ͷ�6��m3�lL�fJ<w���(:Y&\\�dՐM�A`H�ǟ��ddl6\r�~�nBE�$���Z��I����9��W$U�*6�3�q^+S�;�|-�.�\0���\nY��_k�W1��n�����[��jʇ`HB[O����223鑟L��dg�###>����������Ϧ}r2��y*L����p�K$�\r����H&��h+u �h��>ӃU���.��RM�d�\"4u��eH�UR^�B�f�]��A��4�%P%4���\n���A$��$)��j]�J������ơ�F8�\0���C�w����>�7���[s}��y#�U,SD�����dl6���FF�###a����dddddl6\r�FFF�a��l6���#a�C��f���ix8�f*�7\r-�Ӏ�斍*���Jl�S�p�T$(�iCCPQ\ZA��%���&�\r*e����25�K+)��Z��$�� ׺r3�b��_��M�a����l6\r�%�KʰDt�ͅ-\\W�1�͜y	rٔ5�M�*%���}��SV,<���j~�,��Z4X�p{�b\'�Zn��)�R��cm��<�d��Bl�s}�)�s�J�Z%�<�\0�������dg�##########a��������������dddddddl6\r��a�m�2#��V���bө�[ǒ����v�\Z���d>�yԓ�^&�\'g.$40���#��\'#\ZS ����5��N�֑#�Eh;x���R�226�����$Bq5KR�e5���s�f�԰�R�\\�w�����21�nI�y�1^q�1U���5	5�!ǩ��~��\r���US���[��Dy��,�{T�:�NB\r�y�WTeF����kl��FF�##a���dl6\r��a��dl226���a��l26���FF�#a����Z̊C����\\�}��}a������# �1�4$ha��cG&��<���Sf�Iy��A������&�t�2�(%C#a���ddl\Za��a�\0�s\'��#�����<7�����?�¿�?����x=�\r~Z�?��\0���\0*\0\0\0\0\0\0\0\0\0!1 \"0@AQ23aBq��\0?=�����(����6,�l��)���#SR�{.�ݮ��l�\\�!I�%iR/fl�6zY��7|1�2�^~�tGæҳ��.�&����GK�c��%��;vG+^�4��2G�F��>s�>o�eE#S�_g�e�:����2���P�BI\Z�Uz��|}�=�0s2�����F����4�\0��*�N&���}�e�����$��b���ma�enY8�\0�8a*�jk�%~H����VB���ؾȎ(A�D�r�N�앑U�j����$z0�%��D�<�����.�$�1�ڢ2��R��c����F�7����o#y��F�7����o#y��#�#y��H�H��X�,���H�Hsg�F\'*���i���L[?FK����\06<΍�y%�<���ɍK����x�\0\'��y$��)ɿC���,��\0��\n/\'�P�(ǍG�^���!rc�2c���\0$q�%��RM���Jfŝ>8J\nZz:�K/�k��ǎ���$���?c��:w�^����*d`�$��m��b̅4�~�5�e6d��ؿf�>}]	l`�1�_�a����Ye�Ye�Ye�Ye�Ye�Ye���ɖ���f��1edz�,于8%��cd�b0�:Ó/S9z��Ye�������D�½�����\0a��\0+\0\0\0\0\0\0\0\0\0\0!1 0@A\"BP#Qa���\0?��{%�:��X�e\'���D�;\'X\Z+�U�����wY��wZ�.�>�S�$1�+\r��I(l����*щ�ԅb�#��ʺT,�PT\0��꼪7^�F�2W*T��Q��.i �4m��Dؙ�����#����T����>���7�&ͦUi�U*�����a�?�T�0O���B�^���F�Rk���C.��l<��:F�[�(�d���c��ͪ�vTY�|�Vsz �},�zA���,���\0k!�1���D֥E��g�0�$dC�(k�I�Z�|Fy�!����M�I\\4|L����k%�\Zw@� Zn�e,�����i��8��=�\n[��m����4M��S��|�t�p����~-�V�~�4Xa�c�ի�&~k�(�c����\0I\0\0\0\0\0!1\"2AQ�#aq��� 3BR���0Pbr��4@��Cs�$S�%c�����\0\0?�.VT�p5e\"�4��n�F�������;a��;��	K�ZM���	�Lk1�cX�c\Zǌk�<cX�c\Z�5��1�cXƱ�\Zǌk�<cX�c\Z�5��1�xƱ�c�5�k�<cX�c\Zǌk1�cXƱ�c\Zǌk�<cXƱ�Lbc\Z�1<cXƱ�O�<c\0�G�\n��c\Z�11�cX��|c��\0tz��^<Q�B|Q�B|Q�B|Qs��G�����Ʊ�LbcX�&11��1��LbxƱ�\Zǌk1�xƱ�c�5�k1}���\\H�̸��qQH�#8���P^y�FV\0��)���/��8�)[��nl��̗Hۍ\"���!Ɇ���:Π�/��Xmae�X]6ܪ���B/\n��^k����)[�6\\�	�t+\0S��\Z��+�G��@�ê5��O�<!NT�Oi��\0.���\ner`V��;5�?8���.O�Pٵ�I\0\nu���}2��қn��[���q�ˍ�=P�f\Z�*�ր�)��KH��WXm�i�8�����F�*Le�iW�۔Q%.�E_��ՋiFu�h�o������)�Y�����H���TIm�����|s�\n��r��m\Z+\Z���gն]�Ǔ�	U�\"��ܖZ�\'�2�.��\n��8�6�qA�&�q\n!!��10�Q�\0O>�4�LH_������#Xq��\n\r��|c��Ui�y�[��Ud�������<���^x�\\OF�F�d(\Z�@��dR�������_��V��,F#Ɵ8�>$�ǪY�\0Њ��ՕQ}�~�z��T`^ׄ��\r1�?�f?�Om���b����%�r�.�p\rER��| �j]-���m.<��\Z\r��K�1).Q�}�[B.��}l*Y\"�\n#�\"p+ޏ�*bq\\�k�\n��*0@>�B��K��l|�%v����2�tY�H\ZJ�D܊�PRm�\'g�萡��c�s���(r����L��\Z���I�\'�\\��p�H��R\Z���[�����ue�Q��ӇNU��[�bjjZ�ԖK�����4�+���X������S��z�y�yR�7_��hu\0)Ǖ]�v�X�_\0�hhH��k�A\n�\'gD/�W~\rP�Һ\r��T�\nR�H�`O�l����<��;�Y&�Q��\0j�ê�6��x���;��\0�\r�˴�T�a)S2�7��<����s�P)KK��w-^q�;_�1,��\\w\n:�̵jŲt�ap�E�r^�����7m�ϰ\r�lL8eU-��2���̅,��i��*��N���U%����B���gbG���]��e��JAB�\'m��٘E��c%��ܶ�7��Ki�H����V��\n�Fm��3�]�j_��r�*.,�J0��%��$5i�6[U�Sa�ܘy\"�+��%��@�q14�Z�8E�\'d!�xBBbaִs;!r������-\n�R��҂��%�S�6Èm�\Z��_�⌐�8�\0;�K=�U�\n��UB�.�ЅXQA��Ev}ч����7��ZP�0��F�J���\\��Y։J�B`�zz�PR��}/��_�?f���B�B�\0F��\0�[�1���\0�#�#�ʉ��I �롔�&�Tm�N8���R]\"��{I�XH�wy)C	���D�;����`:�\\Aq[[ր�\0Cj_7tZ�i�-�m=�2L�KS|�&J�\n��nb�n�i�$\n|?�ɒ��1k8kL\nO���6◜�bӇm\\��N�c0m�S.�E!�����D�/�h�趎޾Ev}�w��1�b�%k���QVJ��������l|!VU´X��θ�6@��1\0c׾&<�F�����\ZVna�7\Z�+m�ޕ�ῌ_����\01�d�M)P��/%N]uR�y��`{�W��\'V��aq�k_�Tƌ��\0�*�U~>����R�NЫԘ�	펑�kj���K��G�f�\Z+m]��K�T�$E�����(A�Kd��� �\r0�-$�Q�\nó�Kr��T���u+��ǸA��$)Ӝ}�Pn&�<�\"ԓ��Sr�\'2�3��M��B;i� ��)m\'ٰՒOe����<�!��,�6V�Ǵ���$\\T1�W[=�TR]$���Cti�լ[�E䞿K�(�jwŧ4�L*�i�;y�ߓ�@����Cv+uVD\Z�Ҷ��W���4@P!	�h>��Eh�κ��l1��c0��ǲ*��\\k��+~ȵqb>�JQ�@�0��Y)I���i�z���ߺ%�RzD6�x􌻂mo�D�c�KsLӋ�&ʖxJ�m%B���n�XCi�F2�˃Zy�˄��Y�U�i�U>�ɤ��x��ED��Ţn�H��\0�ڕ��B��ilY��kwf<����KKn��1��?���\n�c����W�b�ڢy4S�;l�5���:�DS�j�Ty,����\0)EJ����E��A�UP?�wp�Z���ai:V��Hx���(0��{b�ӜG�b���\\�����>��\\���n9�檘--��\Zl����8͒�s.Z~�i�\r���Sm�6T�EK��U��\r�Ω!����nt{$v��fM��k0����\r���\r�D�4��jW��(�f��V$��ԡ��줬\0�!�e�lJT�ɰ�]}�by]#���>q�<�1o�|��\'�1o���f��1o�|��\'�1o���[�8�o�|���1o���[��c�\'�1o�|���1o�|��?Xſ�1o�|��\'�1o���[�8�o�|���1o�|�Y��[�8ſ�[��c��5��}c�?Xſ�1k�|��\'�1o�|��\'�1o�|��?Xſ�1o���[��`\n��>p���=�����\"���1o���[�}cY�~_�R�W�4s}���-�O�b߃�M���B�k?`a�J���*��<1���O�/RU؟�^G���p�G��VmH�֘��G�����+�FnX�j��F�~�b߀�Ƴ~�k7���-��k5�>|�fen�I�rf�W�%{�L!�5Lʥ�/C(K��?�61��7��f��E�2{���V=��.s���,<��U��]�vĶO�S�����-��/ �?<bc eU�R�]�X�}�X�������2�;\'�Ս�On��Ĵ�OR���n/��@+Y��\"fl>��ttY���6\n��g\\)��9ÜzzqΕ��R/�\\J��xԬ�}lբ��o��w+n��N�N����bU����~�O�e7��H�лѶ���F�� \Z�z���Tk׶+i�݅i7x�b�I�X\"�S��VQ�\r �#���*�1�f�o�}����W�C:eT��%��.�ve@1+��icdV&9�˭�%!I�l\"ڏ^4�0�ɳ��n��8�0�0 �]�$�m�@ص]4��\01�gh�4&:d[��\0�8~h�H��vE԰��f�T�S�0���+9��I�\'F����R�A� -��\\;�)q.J)W$L6���m/���t��nY��F�\Z�����8� �2+HpK̴�mE+	V��������lra3h,7KnlMbW&d��r��>��e��R���~vp����@1R�F�\'ܓEg�uCe��@��R��0��.�����p�oUx�S3n�Zl��0	;n���M�C��m���6��1/��}a�s\r� ��^�]��(,)V����{��S�R�v�[��EF՝Q\0�c8��tX���mm����3�{��\r�h�E�-N�����&��1��Qd�&���ҥ@\\%\0Ҕ�%9�n�����N1��:���#\Z�֭}yJ�X��1��F��Bқ�F5����I�i�)h�Xa9*]�9P�_X{�g?�U��s� �a�dlC2�ɦ�nέ��v�k�=��;Bu=L�]��J�.�Ho1/�4_�Q�\')��.K)$f�0��jdaE��l)醓2d0�P�����)Z_8�-z��!�{�BL��LK���o ^�TÍ�\"��\06p:\nh���¾�9�f��IfUT��n���S-8�9\'�Bw��#���ud��UR(�D��~�b^jY.!w37*�_C��i�4��fͣZޥ�����M�ۮ 6��m$�ZW~���~fj{���f�R�}���D���J�%�\'G�]�&2�NNN��A\r�rT=Ӱ��<�nM���ޓk@<S��TZ���Bb��O��{���*�}�Q0\Z˘�\r0�ʹ������\0�?/���$�9(U�^�O��3[)�*�v��\rg&:��J�\Zd`vE\nA��tWx�5\\p\\!Ŷ���p�lc\nm�m^o��6l����w�b��؇Y]l\r;P�Zd{��j6EJ�la&4�P���7�c\n�(֯�m��il���]B\\MkE\n�.q��PB[T�\\�6�l?���a��>r,������c�2���]�Klm6�n�L�,<��(p\r�����T�6��7B.R�6���Hd\\���FwCC�b^rrq�̖��%��⃰S��B�\"�FP���.&}���K�!J�f�Q�:m��<����r��1�l)4����vvC��NQ�/����~*�0f%��)�!j�	Y�i\'گ��#�HgS��\\I��\'8p5G�:��;�6��m(Mw���!)��\0�?/���ŒtNخ���h��&(�<�Ox��`�U�v��q)Q�^��h������U�a\r��\re`LPJ�ڎ������N��h��\0�R8E��P��\r;a\n\"ϲ.��V�#g\\_��\"�1ۿҭ(7�4�l�L8�7[1uݑ|n킄S8\n�Sh�$��f���f�n�uR,����Y��#��+S�t�%ƫD��9:����ϮX�Nħp�S8�@��\0����|���eis��:�*�Dn�vv^ө���Be��擪��u_����}�,�7!v���Ǘp��A���wG_\\ata�CeX\n�	��Tt�ͯ��������B4h��b�Go%V{��G\r�E�r��c��MM1d�J#|thJ;�Id�}��I5I�4x�8ƍ�\0���vѴ�Z�p�u��<�)e�d�^��H}A.\\f�`��Y  �iK���D��-^A)�Z��ТQfݪ\\M*�&]6��$B^t)��Պ_�B�o�W�ibɯ��VTlg.I�C\nB�4E�b3���M.�K�ۊ.�b�M��R�(�����V�\"�R�4�w��a��\nw6�iM/ل�J��l��Q�p��!%y��q�!�%W6�*�������$\'\nq��1aTh\n��N�΅(�bݠ�p��Yo:z�ѧ\\s7K$D��j�}�i\n)0J.y:ɂ�z4T�,�ci��\Z�ؘ��\0lW6k֮L\"����a�.\'���`M:�ҍz�t_�%���9�o!�}��}h��_�Uj�֨�����F��y�JQR���| ���p�\n�Q\\a丰�V���w�&�q@����v�%�6��|�Ojґ�e��t»�+,3*A��T��gP�L�G�<J��mH5�5��!����ґ�,���P�O���l�CIi)�)X�I^�˖�-̩�\\%�T�!��\':��P%x�%JON��Țh�\"`��o!��iq��6w:����M��39��Z��\r�)��i�n=�.�kJR�P ����(ëJ�ӹ�~,S\0���\0�/�[�p��?may�\n�\'����\'v�9�D��۾&����𔔪��萣�b^�m��\0^sj�}�t]֔R��t�#�MÒ�\0OL#t\\`�F��j�A�BWZ�m廐)�Pc�uk�_�6��P��ߑ��N�s���S�Lr�Oi���\0)\0\0\0\0\0\0\0!1AQaq�� �������0@��\0\0?!�.������Yf�@�v��ѹ�����Ұ�ǅ=σ�B���?��W�z9�әf���:(�\0Z~W���^�v;������\03ӟ����O���(?��J������\'�`�7��������������Y�bm����ri�V�����=�nB��cgޜ��V~A�8^�/&`��Z�4�,��Oi�B���o�䇙��z���~IA�zzo��Y\0:������c,\'�L��o���=G�n�ȑ2\r�͛�o�(��\Z��a@l?�Q�)5�9\r\"ʅ��2VLj��U�v�v�&�I}n/M����i����_~�M���^�q.~�.�<�����rȥB�eM1<٦��YP���U�io&����A-��&zCw��i�h�x�yU\'��;l�\n]���;e�\n���B�+����X_�gh{�P�2s\Z�٫\Z�#�%��.SYH��j9�7����J�巭��C�����@�,��`�mcMv�;��%�\Z�]⢓_�V=p�Au�,���\Z�Q��<w�ǀ���X��i\\�|��\'��3/m�z��%�o*�v���%]f{�(~T�e���~�6R�m�Id-zU�]`�L���������XJ�Foiֺ*2�m�����q�۩Һ6���2��;,mh��-KE�V7�:Y�����P��aKic���nī���������5<���Qș�q�l��������R�L/7�2{��Y��������~�ά[�4����@���?ps�{�G0>�WĜ�\Z�\Z#�\r��fN�T�{�:*$��������i�	W@��z�T�!zP(�\r�fD���E��ˉ5JՅ1��8�z8W�C�\Z�tׄ�G$GmCSW��\r.�؂\r��q�]:�om1��Q�]�/�:�j��`��R����� ~K�HQ�����0��1���\r���fWp�N<;�W�&��`�[�u��4>�=	}�n�f�-6���2�+�r�\Z�Í5�k\'�^e��ښK���#Yx\ng�\r��Q��ȲD�9��<��^ eݹ���L\0=;Ӊx rc���4��B�BZ�%��`	��#�Ҽ�V5%�**Whp������1F/c1�?l��i~��}%Fh�PKPn7Zt�Ǽ��x}�$�n�O]�K�eگ1�\nb�!)��fo*���}�G�Q��{S�0ҙW�o�)Vp����J��:�cH�̴�.�h\ra�G.ķ�Sz�J�nx\nNk�߭��f@*{��4����i����J��ڲ�?\Z�\Z��\01N@V��Ō�<���an����UW���6����#��TC%r\Z4p:��cX±@����}ni�_K�u5��yr�yr����}/���p���C/�\"^t��;���M���>4��:��e7]|��cZaM{d��и��\'C*�i��9[�8Ӡ���}����i�LE{4�?��v���t���ſ$Խ����P� *0{첧}myk�.H\0Yne��ǤP;�(!�)׬��%��*��\nSÏ�\0��2��\r�4PL\\qo�;���>���7��Rl��� �t��&���Q&��0~���\0�\0B�N��n��̝�tmd��E^ea�\ZDsaX{��z|ç�MzzufҾN�OO���\0@�$�px�T-\rDf\"�ٔ�tTq{�r�}K�X�3�τ�P�a��5���?��W��:�˴Ǣ���=�\\ ,k�t(��L@\\_�W��:���g�-�+&�F%��H5�loh�Ho�L(��Ħm4�\ZD���]NM\'j�Hkp!�IyNЍ9����!b��`��ۑ��N�I��d�t�J�k���S�?�L5��3Lu\\�!u��De@�[�w�\'�Tgڴ;w�\0�M�Y\04}S������HHi�W�I�*���	�Fi���׭ã+��_[�w�GS��l�7d�ĺ��{�C�#~5�\"k��Yg��7M�\0(��\Z�Li���r�{��~c�i�jg�!.9EGvH\\��1Wh�@p�g��Ҵc�\"��X}0k�B�I���/8s,���C�IC��i�7�=7��\\��=P�Y?I��[�����4c��a�\ZG,���J@_\'����Ir��Y�e�j��e�F��&pS�],�:|��Y�7��/\0� �m��5�k��pt�A2�A3,=\Z|��v�k�%S�2���Ae:�8�\0��������/��|��L	�/�3}n� ˲l1W�(}X��5*���S��P\"\r-��y�Ӳ;��h�m����h���4j2�վ}/*˩qO�������t��J>�h��c�G%�O�fo@y��2��1��=����b[��YH�=!\Z�%�����^0>�\0ht<ƾ� ��3��TC�YLH�(���ZV�s�?!�W���/`��X�iK4��C����\Z��h��\Z����\0;�0���˾�8s��e�/�-�b��ݑe�|<p��]8`-�$_�>�?����F��?��g�Oy��\'�9��A�r �y��`�\0q<���:���������3G�MX��2ܪ`�g��g�v�CXZ7Sv�������\Z����C�r};���n�F_e-�P�-ķD���TeV*m�y�28bY���q����;�}#M}���B�,��\"R����s��h�^Y��������Th��p��߃q��g\nTnL��;�Ѫ9�\0m-4*�֯C+N!�n��>Y��퉵t�֜v�5>�09��3��r�-w�1]P6m�V�˙x�^���(M��sT)4h��h��= �g�O��.\\���\\�����/������I��M���.xA�Ծ�K�\\��<\'��Ĺ}��K�5�3s/\\�E�!ۗ{h���]��e��^%ߞ�f]���\'7��.�.��e���Or��(�]�+�̾��n>u>�?�����z�+\Z.QZμİ�x&o)�/x^�_�8R��ځ��͚�۴�4���n\Za���	�ֆ�\r�y�����~�ֵ�ِ7j�|1mص���:\r�����)���yW�S#���=�̔�����������4cY�q=���YnD�j�Zd��ȌL�\nJ���5.MA�x��- k���p�Ƣ�@���\Z�K7w2��R�&�4u��*(�$��r�	�7%�5�5�ir�j$[�Y^��$Tn�P��)�f�m���_d�����]���q�N��mz��J���x?��\0����מ�t�����3ۢ �eb`Yh�;��w�L��S��;�!nJ�30v�N��\\V\"�����Q4��b�Y[�pk\\(N��0���.V|6=W\r�L��3\"g��5�qA�t���S���I�����C�(����\0��!U�Z�� ��&��d�þ/i~��ܫ�\\ez+)�_�����d(wB��Ԯ��j�K}�Ԯ�0\ZS�Uw���傻��x[qkm\Z5�Y�%�\'\"�e#�S�0�\n���@̣P/�i�s�pB|L��z\0�X�%䋱��&n��nq/c!���-������th���B���\0�\n�Z�R>�t��{���%g�V���[����@NRPnK~Ng	�{W�\r�jk�����ģ)U�����(�)|ȭ����4/��0�o9�UA�\n>�?G˪�|!^�%=~�NP�0�c�S�kv�C\r���a�A�.�\"D07��2�u��Q�`��C6�ik,���4vW1l���x���MEţ���K�Uor<�7����E(���OF����\rPd}�Ҝ.���� .*(�|�a�R�ëC��fzcv}>��s�lE{	�*d��A)���wW��V�Z���Q���3�ܵW~���!��-��������zB:���t)���(���0+I���`�[�����F��ă΅��9���A��]�oB*�E��(f�v\"���]k״\'8�t�Q��Ƒ�ė�?6���\ZX�Z��iz��[[it�F?-bz\rZm�<f��h)�7��7V��幝\"�4���L}:�����G�E���e.yO)�<�����y�<�<���yK�/������/�Yr��<�[�)����r��yO(��DMgJ04�4I-/�Y-uz�+?[&���m�hvv��[,��=F��[�\Z�7���q$�<߲[�\0U����7�Dk�/���h���>F�˿����j��<	�TVӈۉ�l�6���y^�ֹ�0�B_;�>^p����x��t��;#S���/W��\'��V5\'3�yK�S�_yr��TRXp�f�5�@ヱ,��X�h��KWx`mk��o���޶�C�ʊή��ѭ&>�a�ֲ���O4v�\0����0[�S�Lo�W�X�uO9�1\'�Sd���BI:^��Z�=��>�a�@��K�\rp;~�.2�K0��9�C]^��`�{����Y\r�� \\���\rB�Z�-Z{6O.j�]���ӑ������_�=^1S�1���V3�y�}�%L���w�� �`5`/���-ȳ�>z/@�#\0����\r1����)u��+�H:�a�F���5�������\ZZ�[,�+�(ky��\0]�ޚRgHܓ�\n����ZV�N��7�4�Lf��t��]�T��h�M�QE�WG1ťG��������`\ZA�Lc.LD��n@��V׉�Bz��&�˻\0�U��\Z����N�M%ne�z�J��v\\cRU4��UFM��c)����\\\'B����)s�դq��;]e�S�����K��J}҇�F��xTܚ s�{k�F��_FVhz�®���g�i���ӯ}}2��5�)O�	m�N���5�e\r枚q�F}��JJJܧS�hb@��ʁ\r�,�Q����V�W앂�mM��,��8��N5�2Ha�6�lؤ��)���>�[��¾`Ǻ*n��/m���6���à��\rq+^t?7���7�3��^�0�5���ja3v�P�70}�����>2��IT��BS�N�;�T��!U�� ��Va�bkWAz-}vھ�lAa(ި�1�YI�vߗ1�@\"X\\�����F��C! �*.�n$��6T��YeMhI���&ua�g�+Jՠ���m��\0��L�Ye��^�40��\ZjӘ���ΚˮV�F��^��+��l�q��\n��Q��f���>C���\r\n%���ߪ��	�ڠ{���V����!ղ��FY��iT�3�\0\r�|�_C�\0M ��:Ӥ|h=ҷ�F���K��ǫ��iyzEu�N�1��o��HCi��H�R�(W-�q�\"k>���(�P��h\"�w�%�J^[��+E����b1+�`�0����%�[�-q��#_�|!�\Z���y�\0�t�����:�;t7��:ͣ6�Rm����[�WW҆��6CXä��:�7��::�3N~s��43i������\0\0\0\0\0\0�����<��\'֒E��\0j�]��\0w+yayCFy�ru$����2�5̘<mK-ݭw���L��bI$���8�������:Q�\"-�������(��M?�{L��y�\r�����,�-Ϧ�c����\"-��Ք#�D�;����<��8*�K|����ۜ��_�M�\\[1�,��oRmB�?u�w��<���G?��m=����\\���N��g֊����:1V�,���<���^r�K��`u�}�Y��8�X��qH�i���?��[��tPG�\0<r�8���(�|��h��\0{�al6�,�]�������sId�2$D#�\n���i$�*%w�E�I\rT�t��vy2�G�\'y4�	���D�u��<��<��<������?��8�x7�\0���\0��О��/�\r����\0(\0\0\0\0\0\0\0\0\0!1AQaq�� ��0@������\0?IX�TK�beE���%}�������+�Wܬ����_r������*�ee���<�?!h6��+�=b�Gc�2�?���5�9S}���Q��|YM�Z_=ȓ<�#�dO$����_a�{�\0L�͞jJ�db�:����I��6�c����4Q�*؈�^��Q�+�D4�#���n\n�\n�>{�|�j��E�6���`��	��J������Vĺ\Z�)Ԇ��ٔH�\"<|f*�+{\rw!���$�ә}02��FI�Xx!1�:cvd,�ȓ&�b���O\0j�3�\'$�q�>}��q�o���k,/^�MR䧑�L(%L��޵�F������̜�(��9\nzD�F`]��Q����zCy+�NQ\\7�m\\xa��p61�҂�׺�ɒk�i!+![�Pŏ1�<ǘ�c�y�1�<ǘ�c�y�!�<ǘ�A�2b�\r��r1�h�YQ�E�����-��\r,��R��;}A�8M�y��R��$�xcP����I`5k��~dI�\n洄���/��\"L��\0�)M��)JR��)J�R��)JS�HF�y��5�5��j�+�S1����DC1X��w(REHP��<�*/��(CzENo�5�R&��������Ee+)J�R���)YJR���L�eRRK�C�4�o`L�(��ױ�j�z���1�[���K����e��F�ӏ�t?��$��q�bG\"zb<�����؝<	���k�͛DֿAM���G�o��Ӟ�]W\"���#CO�ɱ�O\"���C�m���#��\0&\0\0\0\0\0\0\0\0\0\0!1A aq0@Q��������\0?�����iQ���.��	N��k4�3T��|�m�S̓@��8�/��\r�!��i��L��M<d�ɻ�4���װI�b�#uѫq#$��\'|�SL��k�bGX�Q�=��P�lv�R,���1!&�\\�c8��\r����GA6D�L�*dc�i�FF���\'���M�K����7�����o\nG;��bA	nq衿I���F�$��D6ƢD��%D��d�+��j��7����$1�w�����+6y�\"��\n$&G��\'ԥ)JR��)JR��)J&&1J��]˫pn�%�wp�,!�ez-��m�<U_�	&�cz%�4�oFmbCf�C���ZCR�zﰢ�\"�����*$B$٘[��1�1JZ��(�-ΖX]7��\Z��s�6Q��x~��1+����K�R��(�+��ϑl��?EF8*bO�aǂ*��Q(E��ӂ��E��R��J����J�̙+2Vg�it��R��֔�(��B��)t-&��0%5[^�q���J]w?U��G҄>����\0)\0\0\0\0\0\0\0!1AQaq�������� 0�@��\0\0?�\0�$�,�@V�\n��:�<�(Z�{?�/�k�\n,A��KR�T>�6��\0�DZ�u�J�v |O����)\'�)o���{L>~���	��\0ȽR���T��W�򌽷��f�{��\ns�%��iSgzܩǩ@3����Ղ�p�<o\r��e�t˴�v�x�wʟȊvz<Ǐ|�~G#�h���Ƴ�~�Yz(%`����so[G(�����yF���*���}�\n��e�-�F� ������m^T��b5�u���q~����7*v���K��_��=?ݦ��*`x8���f���t��\Z��(�����oH��)�?s��?�u�tr~�XZ4��nP��S2Ѓ��G�	�Y��ɼW��(~\\klyA�{T�Kt��_.�ڎs�)�YqX���-�M�;6�����p�U���?&��Ek	�+6>R�\\�b��h[�>H�ܚ*�Pl�CQ���Nh(�-֏�\r��NTd��e�I����-/��s���<Q+�<�\0.��-�nsNf_%	?YY�ue�1X͌��8�3ȞcN�P��\\TV�,V+��\Z�1V�w���\'��K��,�[�.ˊ�Y]#�?t���r]�ѥ��U�`�5}�\"8��J�/P��y��nWX�����L���.WS���s���H.,�I��32�׸h[;Q��D�3�;c�l��.H Һ1`Nl��x~�`�� IU�:�����y��|[4�n����4̣iA���֪�Z%C���R.N�1�ˮ��������[�F�^��d����o������T~ٌ�F��E]�%/s-�VUz����d�����5��5�֌B�n\ru�Xp-I�Da��=aU�v�����0S\'ysќD�r�*��:�N�7�h|.[�`:v\nг��.)7��h�/�k��`f�t�]��-�D�����_��R�>�ɴC�o�o�Y�����#g�o��3mk85c �D3��6(�R���!5�ҏL̲����n|�R��]t�j� ���T�ſ�(�x�QA)�?5p��fVޙ±\\����p\"�+�\ZJ�e�@��N	ꑰ�(��\0|���BsfW���Ic��Qk��rVرO[��Hе<J��_�����±�*�m��ߎ� ���Y-�Ľ���/�\0%ںF�5����Դ`]+ox\'8��/�J�� ޸��54��7���{�(���/0tʛb�s����K\r |�*>#�rw7f��V��`���`���=����*߂T·�Ԣ@��;>bb˞5/��|76��T9l��W�������XM*�8r��)A���&�N(����|�j�E����@��5P!@(���$m^h��M�]vj��iB<���M��G�, ����gq���K�QKm0<]{x�(�\'��(qM��M�p���͟�V�^���(��_�ϑW>��񏣘��}9E�5r���/�	L��CWތ�(�q*�O֥NN���*� �:�ҮX�Sx�M���\"�eaJ���[G���̓&�c	i�[H�N��j� hd߼Zi>���	�`\0���ʔ��+�޷*^��|��	rU��09S\r��!�^^��U\r�8V:���o,(��S�-�TZ��� ��;,�T�t�SmYa�D���B�I��yNvRlc�\\��WW��a4��d\n��pnVFM���\0�L��>W���N��\"�	��9����+`��c��9���Tt�f���Wy��T��6QU�_���l�w�^�����l�w�c�ţU��,b�1Xωj�ʖK��g��l���!t�X��x�2��x�f��e6/���D�Њ6W�Qn%��j8Ix�6xɣ�[\0ΞG��va�r0}�>Y����%�(�W*�$����A�˵�߈@�Z��т�R�7���35JTZ=r�w����X�X {3����}cRaa��ְ�V�q�D@�����p�\0Ղ�����|�\0��*�W-q7��w�-�T���,۠��wT-S]n�{�$)i6Y����:�-d����\"��ɤ�B�St]�?d�%ϕm�A�� :��P�Q�k�VN1�S9��@P�* n\r�R\0��ؙU�����U\rg�m�N3�\n���If9Ip.��c1C�Q�[��UΕ�s(����ɦ\0ٷv�i�j,�1L6�+�,8�ĩ�-��l^Q;�.o�z7��+#�>�W苠A��5��\'(S��v�B����PL!�]bR�ݕ�Ω�r��6T��co�\0\0�N.��Nt���T���XP̱���/.�3�e*�V����J_�t^��A�.r�X��SP��j�U�`�KP[lR�lq�4�^W,\0�r��Ɩ,[&x���)g[����j�Z ���^y��]�pP�K/<�\\�9�{3\0��a�mK�����YO��薽�r�0�W����r�4�åKZE�s�37k�<Mu���fn��x��i�f_3mJWX��^n��#n����6�\n�]����a�a���\r�[q��� �l��Gs��o��Sg��4���o�-�eIrY_뀦+��0քp�#t���Y�F@��Uk�7�%(�QXųM���1n��w���b�A��P��+��@��M	`-�y�X�ɢ 1��ġ8�#��\'NZM�Yy5����p�+C��f@���ρ�Z�!��)�\\�;��#�@=��ux��bo,&�ϙ�9=�7���0���_:i��Cl`Lh��8ge������	~�/�ט��y���ˮ�-�ӈꉏ�ʀ.��r��-V����GO[�.�E��\Z�;DK�4M�0q)�ޣ\n�+�wg���)��ѡ�+Tt���\0�k�S�%���F�� �5���ƒ�%��+8����G\nE�?�������e;|F���n�*똖�uw�:S�m�b��\n�7��pw�6�����Jr�p�g*M�%U�H��E=j-AW%�����j����d`S{{�SX-�5���)�ĸ�c+��+�Dٟ-�Z�􌌪!����\r��6�9\n�&3.K�P��7��b@(����Vx7�O���kj����\0	���\0�)��6{@�P��n��(Y3yӌ���\0��/9��(N��r|�_�G/�h����,��NhO�IE�d^Js�����uK�7�k����^\".�+\r�n��S�|��D�[���WP���oxV���-��<�+�YZ �]�|��&VKڒ\"v\r�!���C)�˭Ǡ�=bE���l��S�\"pU;�|^��2\0���i%���v�����q���c��f��720z-���Pk<\"��G@�ӧ�\0\0ݹ��R[�/m��mʜ�8�a?����P\"-��\0�X�D�0�\\}$�j�V�)�i��o�+�q�?�I�H-xK,��g=\nb��M%!�:�\n�+���f(9���yV����&(9�����X�����Ń�t�ϸ7�X>��9����Yw��#��ўa˹|����U��<u\'.�n%��PZ��PT�<J^~��[���F��(�x�]y�R�=`mT�k⠦��6����\Z�d�\Z^�����\0�U��7\n\rƑ5�ˣ�%IT��N�(e-\nz�G0�\n�.lU�n/�i�0�����R1ee��g0��:�@�W*(�����*j���������7��	�@\01���K֙$y/2��lR@Qe������\0�����wV�q����VV\'E-a��v���v�e�gw�[�1�xJc������\\��d�.��ЖK��0��ف�)Z�l��Ǔ��B���_ c3�ӈ��cps��Ȅ���.��{G����l�C��B�����h.���\nZ�3yt��wN\\�7βH)-=�e�J%\n]�K��$8���e���};�E80s���XV\"#�\0}L�q�Z��E�2�NL��g�5�i�~V�,���ݨɬ���rx�o���͵��R�m��Ҹ�s���z�Qo9�;f/� :��r�yXV2߉u�\n-<K��y�����%�o���?����b��e��hvX�Z�aq�6���K/~��4EMů�V�Y+b-;���]��s�U.�v�ns���:ZK8�t��C�.m�1�H�߁�\0h��BB@�}���d�M^�H��F���������?qP����P��D��xa�!�=e��e��h*3ū�Ĳ�xPo�L�3�Z\Z%��E-�NWY�\'���GC�g�Yx��l6�뉺�d�V<���\'P44�5��\n��݁���h�l�+��|���y�0���_�\\��׿�Fps-0S�4R��\'�x�En��ܶ�)N���E=��g1B\0�����p*,s��;��l=�e��������V���a�8����[k\06�E\Z�%D~~�`\rڮa��b�E�������%�9��⢴}i�!5wX.�Q�(�]�-�p�Fv�RQ�\n@g�F�Ygk#�$���aO����-�+y!�ywHDm������r�l�����V�����i4�QF�ғF�!)ՓV��X����@:����6�X�!Mb�\0;���!;����!���au�[����P���*I)%�ak�|���2�4Ejs�0	��J+2��\Z}e���\0Q�����!���m��qYF��zmam��Uq[\nZ�`��x��>Eh���&��C��.B�!���+�HS�uB.�K�q�����s��WhUj�����ݘq�����Ѫ[B�D�J2*p)�_h��zO�2�u�~���m��\0%o�ejl�oܵ+o������p���E�n�N[��*�dsW�9�q*a��\nK�\Zq��שő�<8z��:�-)����\n�\r����]zP��[�h���r�ˠ[#��A\r!���,�,��r2�ٖ�u@L�꼒���h@�_�wC�c×�6%�UZ�n�.Z�$��3ӸP\"�{O!�Ғ�=��kQ�+��E	N������\0dUQ.u���ux��1Q�G�*�jk�]��5�~B!�!����UrTr2��v�i�Aؤ�f��wQ�i��ݦ[�\\�2S��sl��������e�n{c�.�UT�\\R��*z�E�ff��3~\Z����-O-r[�̱�j�\0��9`�e�2�Klo�ķ�%�L��M\']ĝ��[]�[�-�5�\Z�k萰-]:z�*��j���h�ÍC�F���M�+r�hG��J-�������\"|��kLg�|���b�E\0�\Z�i������j�����0�iV=��Jo.\\�;e-��/	n�l%NX\0#��-��G1�B���50�?o�@;ʴ}aV�ء��ӻ�XsE\Z�}������W�<A݋[a\0�v\0b-��6�1���Z�\0�Hل8�^0?@lF��4�Z�(\r�%�rؚŬZ]M(�VP\"�D�ER��J��^�I=�z��Pً#	3֖�B��~n�46Լ��H���9���b\Z�hQ���!�\'��;��bk��*�)��c�{�#tD���46�Cv4d4q�F�.}H[E�F����	u\0�`Sq!��j�\0� ڌ�6��Qp⁈�\\���\nNlZ� �8E\08���)v4�P���u* �ͅ(8��\0\0\n�\Z�����]C$���Wl�}�w̧ĥa��!֞�4�W�IAy�jԍv2���(���\0�e;�>.R��V�ܥe�̺ʏ7� ��G��y��4Du)܉.��no�w�çX������J�P�\Z,1�J>�mx�8�!���_N%Պ/�Vm�nbC�U�3�>b^G�6:���e��X�b��sT�{��u�-G-��.&�81��J�/r�r���+Wb;���`WW�����L�4F���CN���]�0�V�_Z:@w����0���^j����cKW�Q��s*Hv���\'P�nS܉��M�ס���ǡ��0�D���\'�\n��*�\\�[�T���d����m���L�⶯�[jfߠG�_V$o=o��jg�h�1�P����q6t�e�J�	���2\\�v���^�+3����62�̂��pE糛�ކ^�%�\n#{;�P��j���6��H��p�Z|���!�F���[�Qr\r]y*�UM�m&P�Z+�������QF���=�����!��h�2CDo�U�b,D\0P�֐.,\0�Gl��$gd����\'\n���.)3L�<oX�������(U7h�=�S$[Қ*�vD��D� �_(OP�X�T0�U\Z��h��2kd\r� VF�@Y�Ϳ��!AN�^鸳����@��*N�\n��\"x��*�I��.%K��x:�#��LT��K��>&�;Db�y���O�V%<����Bd�jP7_��J���=�؅�P�Hm��1�z�:T\nWI���K��!�/�]V<�\r�+i�0ZP�fSF�EQd�ۤ��i����9��\r�0���`\"L0!r�z7�1�\n^�S�:�PK/fGӑ��\0P�~�yo�}����v;����\0 ��8�B�r�jZ�G!϶��ʿ9��!\"�c���L���,����⛃+|����WA���E�Z�w{�чi��𪒄���]�89\Z.�b�mP#Rc�\0����t,�Z%\rh��j��XB|1)]R�<*�~\"YPQ]k��\0V��y���1�\0�~s1^C��\r�6%4����=��uJ���S�G���f�>�o��>�[�Y�X₮�jqu��~ F���A	\Z�<L���!X=E5X�)_��\0#�$ԂX�<$@��g\\�\Z�a��@��-�P\0dvk�&�P���y��qjK�^�Ռ~�ءD��R��ZEY�w�J��*���\0\0kS]�8ԏ��-t r�K��qh��f�b;\\FFȨڮĉ&.`�⻁׃��̹B�T5�\ZS C�<�Y��	]���˃���]�A�pX],�\0��\0R�//qU�[�V�QXH�8JR�r�#S(GW�og�a��=Ϙ�T�feɗ/(�����-���a���e�r�c��r�9[7lB�ĿT\n�7��Ŏ��5Z��ɓw�L�~evb�w�BeT\\�Uw!R\r�axzLb3e�ac�P(�.:f<GQY�1�.DeZ����s�8� ��a��yZ#�=�YLl3x]�Söd������mKi#��n��E�>�P5Y��&Y��&����pv[�Cހ;Ft�Z\Z��AQ!t�|��{����bX����H9�8L��e5A���(�K\0����q�+p�~�񉆋.xCt������1Av�f2׵�F[�.D��bFj����v����ؙ�\\Z8���x�U\0�N �v��C��o̬�*բ����p��\\0���\0q)T(.���r������yO)s���6��ԬZE�VR~� #�j�A<L�r��AW@�Uq���]�ed�?���G���NPiD3F�Y6�؅��UV;*qv��C�L��Fh�\0������EQ9�w��$�j��\n^�\ni�C���!�)�[�Mp��CMw��<��\"��N��Cfs���\Z�],�\n�}@���3�T[�2�b\\�:1��CԠؗ2��eds�	�>!�f;J.��2\Zo��{eF��>%o\0�18�#dl���骕�A^���Pw���R�+�B�Ȧ�3\r��!~�Ʈ�de��ʖ�\0��X9�F:*Y�Eg>�d�EKh���t�|	&!��H򅆱1��5	@�E�x�d��Ψ��uK��!L��c�2��\Zu��fD�1�\rX�lz����������\"�4��x<u��kU(����R��k���z!O��]`P��a��B��i_�5�5��@-ѾRŕ����9���!!ko�0�Nv��&W�����_B�\Z���3�/���oF�������\n��z�7�b��)�\0���w���Uv�$��|XXl�Yn��YI�\0�e��O%t]_��~u�YF��U���I�\"�\n��q:^*����jf��%M\"�u�kgP�PX;�k��c�?�O����ܵYwp�؇xZ-%�X\\\n�\ni�7�~Q�ɄD��шn����Q�e�0r�W]h,@4�x�I����v8���EՇ��r�]\"젶	mi��2�J���Ã��?�\'e�\r���t�\0�]\rҮ�!���l�(�>`�:o5��,DaKm�uP�8\"��ռ8�&���d\r��(1.���5x�w����Mߨ���*�} V�-�i}D��z�6�͒���J?�m 3��R�z�l��u>��g�\Z���\"\Z�����P\'?H<�ަ��59��3��ݟ�f��$����V\r���\r}F�A��F`��vǥ��cT�\05\0w�u��~��}jdR�@0MM�$��\Z�w[hw�_��d]uH�W���4{�4����\0���^_���~�D* ����n����.j�7�iM��r��Q��v����I���?&�\'j��h�he�|\'���e͋��v�e�.���*��k׭���vA�����8bA�vxv�D��6���t���C]��V&����W	u��e��CikGŞΗt�%`x��� ��J|���+@�\08	�ۦ����E�\n�U+��2_>%.��\\�Ez}%_�����B	dl��\\@�h��\'��q��40�J�j��gUz�5�]�F�n����6ʴ�+��K��P�8\0ʃ�,&�2b�}2��{N,�J�6u�\Z�J�5YR�	^�spP����͂���B �x��Z\n��e���	M��rU�l\nV�2c�k\0�a��l��k!�uײ�;�h�\Z����8?O�̠P��*��F�� H��zN��m��j��f!-��h�&)@����@Q�z3�L������j���ζc �3��n�9���:�m8�ѵ��]���@��K�������˝LCY�.�RF�f^�paiP���峋��l�\"4��`\\CT4L.�<�l�1N�d����^��s>�#���\n꫼Ϸ�q��:����#;������w��)Nz�A�6������6��+y 1BC(��?YV��+.0#ը��%��E��- �pܽ��-2շ�/Th%�Z�H�*f`���T�Y�.����_|E.�;a_2�Ky��%��O�+��i��m\n����P\'��#�P�eV�1�bQ��SA�D�\n�\r&��s\\��g����U�C��7F��,F��g�J��X�\0t���6G���?`A]}-��Q�Yu5Q���N���g��|�r2��\nenþ�2�S����?���?��0�8Cs�\Z<i��i\r{�3�y��f��\Z���s�#Hq�\ZG�CI���vN&��;<�#��1���{�m�g��g�>�}ɣ������m��\'�f�Sw����|;�\03�?1���#\r�������:��&����>��8y�9��O�:O��','����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0\0d\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�5���k_9a���,`K�r��B�ib��c��ZF�)o�z���wpq�#�¹�KI��;�~�um�K5��2�̾a\0G�m*6.@�L���m�Py0ɬk�3��Yf�}�\nT|��X���\'��I�4m�&O6��M:#)�\0���9�V��6�\0��?��T\Z���wX��w�Y]y�i�(���c�y�y�$��oCF�5g�k���m�\0��أ�0g�t�خ���h�{�1��p.m�>!�\0���nN�I@�N@�<�0=k��{�\Z|Z��H�(�<�pUΑn����ӈ]�r���G#�g��}nZ��ᮢ[c�X�\r�\r��t�?�q0�]��8��b��\0�= ���*��-�).���?\'���T��F�r���t��畃k���\n�{{5��F��*H8g�+{�����q-�J���9�\'����6���kxdE�B2�	���t���ڊ��G\Zѳ����|�c�ڠ�\\Q\\\'��ފ���v?��',NULL,NULL,NULL,NULL);
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
INSERT INTO `translation_messages` VALUES (1,'translationMessage.import.type.ONLY_NEW','Import new keys only (leaving all existing keys)'),(2,'ad.modified','Advertisement modified'),(3,'cardType.modified','The card type was modified'),(4,'message.type.ACCESS','Access alerts'),(5,'memberRecord.search.fromDate','Registration date'),(6,'settings.log.webServiceFile','Web services logfile path / name'),(7,'permission.operatorReports.showAccountInformation','Show account information'),(8,'permission.adminMemberGuarantees.registerGuarantees','Register guarantees'),(9,'reports.stats.finances.ComparePeriods.expenditure.title','Expenditure Compare Periods'),(10,'defaultBrokerCommission.error.maxValueExceeded','{0}: the amount cannot be higher than {1}'),(11,'group.customizedFiles.removed','The file is no longer customized for this group'),(12,'reference.summary.positivePercentage','Positive %'),(13,'transactionFee.whichBroker.SOURCE','Paying member\'s broker'),(14,'mailPreferences.messages','Messages'),(15,'smsMailing.new','Send a new SMS mailing'),(16,'reports.stats.taxes.medianPerMember','Amount per member'),(17,'receiptPrinter.error.printerNotFoundError','Printer not found: {0}.\n\nMake sure you have a generic text printer configured with that name.'),(18,'message.actionPerformed.MOVE_TO_TRASH','The messages were moved to trash'),(19,'customField.member.loanSearchAccess','Loan search for'),(20,'help.title.members','Members'),(21,'menu.admin.messages.messages','Messages'),(22,'sms.type.REQUEST_PAYMENT','Request payment'),(23,'reports.stats.general.payments','payments'),(24,'sms.type.PAYMENT_ERROR','Direct payment error'),(25,'settings.message.pendingPaymentAuthorized','Pending payment authorization'),(26,'permission.systemPayments.authorize','Authorize'),(27,'global.select.empty','Please select...'),(28,'menu.admin.personal.changePassword','Change Password'),(29,'loan.repayment.totalAmount','Total'),(30,'conversionSimulation.rates','Rates'),(31,'settings.unlimited','0 unlimited'),(32,'loan.expirationDailyInterestRepaymentType','Expiry interest repayment type'),(33,'currency.title.list','Currencies'),(34,'alert.system.NEGATIVE_VIRTUAL_RATED_BALANCE','A negative virtual rated balance has been encountered on a system account.'),(35,'pendingMember.search.date','Date'),(36,'settings.message.invoiceReceived','Invoice received'),(37,'menu.admin.contentManagement.styleImages','Style Sheet Images'),(38,'paymentObligationLog.date','Date'),(39,'customImage.system.incomplete','External payment: incomplete'),(40,'reports.members_reports.incoming','Incoming'),(41,'global.timePeriod.MINUTES','Minute(s)'),(42,'alert.member.cardSecurityCodeBlockedByTries','Card security code has been blocked for exceeding {0} tries, for card {1}'),(43,'serviceClient.password','HTTP password'),(44,'accountType.modified','The account type was modified'),(45,'settings.message.remark','Remark'),(46,'alert.member.NEW_PENDING','Pending'),(47,'externalAccountHistory.button.newPayment','New payment'),(48,'reports.stats.activity.whatToShow.DISTRIBUTION','Distribution'),(49,'payment.cancelOrDeny.transactionPassword','In order to cancel or deny this payment, you must supply your transaction password'),(50,'errorLog.title.view','Error log'),(51,'cardType.title.modify','Modify card type'),(52,'login.createMember','Register'),(53,'member.bulkActions.channelsNotChanged','No member matching the filter ({0}) was changed.'),(54,'reference.summary.last30days','Last 30 days'),(55,'theme.style.LOGIN','Login page'),(56,'customImage.title.new.style','New style sheet image'),(57,'mobile.home.logout','Logout'),(58,'settings.local.containerUrl','Global container page url'),(59,'mobile.credentials.TRANSACTION_PASSWORD','Tx Pwd'),(60,'settings.mailTranslation.title','Mail translation'),(61,'sms.error.type.NO_PHONE','No mobile phone set'),(62,'certification.cancel','Cancel'),(63,'externalAccount.action.new','New External Account'),(64,'settings.message.paymentObligationRejected','Payment obligation rejected'),(65,'receipt.transfer.installments','Installments:'),(66,'transactionPassword.description','You may now generate your personal transaction password.\nAfter clicking the button below, your password will be generated and displayed.\nMake sure you remember the transaction password.\nYou will only have the possiblity to view the password once.'),(67,'alert.system.APPLICATION_SHUTDOWN','Application shutdown'),(68,'disconnect.disconnected','The user has been disconnected'),(69,'settings.message.smsMessagePrefix','SMS message prefix'),(70,'paymentObligation.error.changeStatus','Can\'t change the payment obligation\'s status to: {0}'),(71,'reports.stats.error.initialAndFinalYearsRequired','Initial and final years required'),(72,'global.search.NORMAL','Simple'),(73,'menu.member.account','Account'),(74,'profile.action.invoiceAsMemberToMember','Invoice member to member'),(75,'paymentObligation.modified','The Payment obligation was modified'),(76,'global.show','Show'),(77,'alert.member.deniedInvoices','The member has denied {0} invoices'),(78,'permission.systemCustomImages','Customized images'),(79,'reports.stats.activity.whatToShow.SINGLE_PERIOD','Show one period'),(80,'memberImport.title.summary','Member import summary'),(81,'reports.stats.paymentFilters.nothingSelected','Error: No payment filter selected\n\nYou must choose at least one payment filter.'),(82,'payment.status.SCHEDULED','Scheduled'),(83,'changeGroup.error.move.hasOpenInvoices','The member cannot be moved because it has open invoices'),(84,'permission.memberGuarantees','Guarantees'),(85,'settings.local.brokeringExpiration','Brokering expiration'),(86,'paymentObligation.maxPublishDate','Published until'),(87,'reports.stats.taxes.relativeToGrossProduct','Relative to Gross Product'),(88,'serviceClient.error.empty.usernameOrPassword','Both HTTP username and password must be filled or empty'),(89,'brokering.error.memberAlreadyInBrokering','The member is already in the brokerings of this broker'),(90,'reports.stats.finances.singlePeriod.income.title','Income system account'),(91,'createOperator.action.saveAndNew','Save and insert a new operator'),(92,'reports.stats.activity.singlePeriod.numberTransactions.row2.short','all'),(93,'global.month.FEBRUARY','February'),(94,'notificationPreferences.modified','Notification preferences modified'),(95,'adInterest.removeSelected.confirm','Remove selected ad interests?'),(96,'creditLimit.title','Credit limit'),(97,'document.description','Description'),(98,'settings.message.general.title','General notifications'),(99,'account.type','Account'),(100,'invoice.denied','The invoice was denied'),(101,'permission.adminAdmins.register','Register'),(102,'payment.confirmation.header.scheduled','You are about to schedule following payment:'),(103,'posweb.client.card','Client card number'),(104,'global.weekDay.THURSDAY','Thursday'),(105,'errors.lessEquals','{0} must be less or equals than {1}'),(106,'group.inserted','The group was inserted'),(107,'brokerCommissionContract.startDate','Start date'),(108,'accountFee.groups','Groups'),(109,'settings.local.timePattern','Time format'),(110,'reports.stats.paymentFilters.maxItemsExceded','Too many payment filters selected.\nMaximum number is {0}'),(111,'ad.title.print','Advertisement search results'),(112,'permission.adminMemberPos.view','View'),(113,'accountFeeLog.status.INVOICE','Invoice'),(114,'cardType.cardSecurityCode.NOT_USED','Not used'),(115,'translationMessage.removeOne.confirm','Are you sure to remove this translation key?'),(116,'global.no.defined','No set'),(117,'member.creationDate','Registration date'),(118,'accountFee.chargeMode.VOLUME_PERCENTAGE','Positive volume percentage'),(119,'global.tooltip.preview','Preview'),(120,'group.title.modify.admin','Edit admin group settings'),(121,'reports.stats.activity.throughTime.grossProduct.col4','n All'),(122,'conversionSimulation.result.graph','Fee amount vs time'),(123,'contact.modified','The contact was modified'),(124,'reports.stats.activity.throughTime.grossProduct.col3','n with income'),(125,'reports.stats.activity.throughTime.grossProduct.col2','Gross Product All'),(126,'reports.stats.activity.throughTime.grossProduct.col1','Gross Product members with income'),(127,'loan.repayment.interest','Interest'),(128,'guarantee.myWithBuyerOnly','My guaratees with buyer only'),(129,'reports.stats.activity.histogram.grossProduct.yAxis','Number of members'),(130,'menu.member.broker.messageToMembers','Message to members'),(131,'card.manage','Manage card'),(132,'customField.loanGroup.showInSearch','Show in search'),(133,'member.search.selectGroups','Select groups'),(134,'conversionSimulation.dRate.targeted','Targeted D rate'),(135,'permission.systemExternalAccounts.view','View'),(136,'transferType.fixedDestinationMember.name','Fixed destination member full name'),(137,'transactionFee.title.broker.modify','Modify broker commission'),(138,'defaultBrokerCommission.validity.transactions','{0} transactions'),(139,'posweb.client.transactionPassword','Transaction password'),(140,'account.hideWhenNoCreditLimit','Hide when no credit limit'),(141,'changePin.error.pinsAreNotEqual','The pins are not equals'),(142,'menu.admin.bookkeeping.accounts','Manage External Accounts '),(143,'transfer.scheduling.SINGLE_FUTURE','Scheduled for future date'),(144,'reports.stats.activity.singlePeriod.grossProduct.row1.short','with income'),(145,'payment.statusGroup.CLOSED_WITH_ERRORS','Closed (partially paid)'),(146,'permission.systemReports.aRateConfigSimulation','A-Rate configuration simulation'),(147,'menu.member.account.memberInvoice','Member Invoice'),(148,'reports.stats.keydevelopments.numberOfMembers.numberOfNewMembers','Number of new members'),(149,'groupFilter.title.insert','Insert group filter'),(150,'customizedFile.type.APPLICATION_PAGE','Application pages'),(151,'home.operator.news.title','News (message board)'),(152,'permission.adminMemberRecords.modify','Modify'),(153,'infotext.aliases','Key'),(154,'accountFee.manual','Manual'),(155,'pos.actions.unblockPin','Unblock PIN'),(156,'serviceOperation.ADVERTISEMENTS','Search advertisements'),(157,'settings.log.traceLevel','Action log level'),(158,'fieldMapping.field.TYPE','Payment type'),(159,'defaultBrokerCommission.defaultCommissionAmount','Default commission amount'),(160,'session.lastLogin','Last login: {0}'),(161,'image.remove','Remove'),(162,'settings.local.chargebackDescription','Chargeback payment description'),(163,'conversionSimulation.graph','Plot in graph against time range'),(164,'smsMailing.groups','Groups'),(165,'loan.type.WITH_INTEREST','With fees'),(166,'permission.brokerLoans.view','View'),(167,'group.settings.smsAdditionalChargedPeriod','Additional SMS package expires after'),(168,'permission.operatorPayments.cancelScheduled','Cancel scheduled payment'),(169,'global.weekDay.SATURDAY','Saturday'),(170,'fieldMapping.title.new','New field mapping'),(171,'settings.message.adminPaymentFromSystemToMember','Payments from system to members'),(172,'settings.local.indexRebuildingPeriod','Rebuild search indexes every'),(173,'infoText.modified','The info text was modified'),(174,'ad.search.since','Published since last'),(175,'menu.member.account.transfersAwaitingAuthorization','To authorize'),(176,'paymentObligation.action.create','New Payment Obligation '),(177,'payment.confirmation.block','You are going to block this payment.\n\nPlease click OK to confirm'),(178,'theme.title.import','Import new theme'),(179,'payment.error.circularFees','The payment cannot be performed, as circular fees were detected.\n\nPlease, contact the administration.'),(180,'customizedFile.removeConfirmation','Stop customizing this file?'),(181,'pendingMember.updated','The pending member has been updated'),(182,'loan.confirmation.header.withAuthorization','You are about to submit the following loan to further authorization'),(183,'brokering.modified','Notes modified'),(184,'permission.operatorGuarantees.buyWithPaymentObligations','Buy with payment obligations from groups:'),(185,'settings.error.selectedSettingTypeNotInFile','Warning! The following types were not imported because they were not found in the file:\n{0}'),(186,'permission.memberGuarantees.issueCertifications','Issue certifications to'),(187,'permission.brokerMessages','Personal messages'),(188,'group.settings.groupAfterExpiration','Group after expiration'),(189,'settings.local.maxThumbnailWidth',''),(190,'guaranteeLog.status','Status'),(191,'member.operator','Operator'),(192,'posweb.client.cardSecurityCode','Security code'),(193,'loan.title.loanGroup.members','Loan group members'),(194,'memberRecordType.modified','The member record type was modified'),(195,'memberImport.status.BALANCE_LOWER_THAN_CREDIT_LIMIT','The balance is lower than the credit limit'),(196,'profile.action.changeGroup','Change permission group'),(197,'message.type.EXTERNAL_PAYMENT','Payments made via external channels'),(198,'transactionFee.fMinimal','minimal value'),(199,'reports.stats.taxes.numberOfTransactions','Transactions'),(200,'customField.groups','Enable field for groups'),(201,'adminTasks.indexes.type.Member','Members'),(202,'infotext.body','Body text'),(203,'global.timePeriod.DAYS','Day(s)'),(204,'permission.brokerCards.cancel','Cancel'),(205,'menu.member.preferences.adInterests','Ad interests'),(206,'guaranteeType.feePayers.SELLER','Seller'),(207,'permission.systemErrorLog.view','View'),(208,'transferAuthorization.error.alreadyAuthorized','You have already authorized this payment on an earlier level'),(209,'permission.adminMemberMessages.sendToGroup','Send to group'),(210,'group.settings.smsCustomContextInvalid','Invalid class for custom SMS context'),(211,'brokering.list.status','Status'),(212,'createMember.created.pending','The member has been created, but the e-mail needs to be verified in order to complete the activation'),(213,'alert.member.NEGATIVE_VIRTUAL_RATED_BALANCE','A negative virtual rated balance has been encountered.'),(214,'menu.admin.customFields.loanGroupFields','Loan Group Fields'),(215,'group.name','Name'),(216,'login.bottomText','Here the administration can put some additional text.\n(At the admin section: Translation - Application - login.bottomText)'),(217,'payment.action.block','Block'),(218,'creditLimit.modified','The credit limit was modified'),(219,'profile.modified','Profile modified'),(220,'permission.adminMemberDocuments','Documents'),(221,'permission.brokerCards.changeCardSecurityCode','Change code'),(222,'document.nature.MEMBER','Member'),(223,'changeGroup.current','Current group'),(224,'mobile.login.pin','PIN'),(225,'paymentObligation.status.PUBLISHED','Published'),(226,'authorizationLevel.adminGroups','Admin groups'),(227,'customField.validation.unique','Unique'),(228,'serviceClient.removeConfirmation','Are you sure to remove this client?'),(229,'reports.stats.activity.histogram.numberTransactions.yAxis','Number of members'),(230,'mailPreferences.systemInvoices','System invoices'),(231,'externalTransfer.status.INCOMPLETE_PENDING','Incomplete'),(232,'reports.stats.finances.ThroughTime.expenditure.title','Expenditure through time'),(233,'global.pagination.tooltip.next','Next page'),(234,'permission.adminMemberPos.changeParameters','Change parameters'),(235,'reports.stats.activity.singlePeriod.loginTimes.title','Login times per member (single period)'),(236,'member.bulkActions.changeChannels.confirmation','Are you sure to change access channels of all members matching the filters?'),(237,'group.defaultAcceptFreeMailing','Accept free mailings by default'),(238,'group.settings.passwordPolicy.NONE','No password enforcements'),(239,'member.activationDate','Activation date'),(240,'group.title.settings.advertisements','Advertisements settings'),(241,'settings.access.memberTimeout','Member session timeout'),(242,'group.settings.passwordPolicy.AVOID_OBVIOUS','Forbid obvious passwords'),(243,'settings.message.scheduledPaymentsCancelledToOther','Scheduled payments related to other member cancelled'),(244,'settings.local.maxImageHeight',''),(245,'settings.mail.smtpUseTLS','Use TLS'),(246,'guaranteeType.authorizedBy','Authorized by'),(247,'reports.stats.keydevelopments.throughTime.years.title','Developments through the time'),(248,'menu.admin.help.manual.stats','Manual statistics'),(249,'sms.type.OPERATION_CONFIRMATION.description','Operation confirmation'),(250,'payment.confirmation.header.withAuthorization','You are about to submit the following payment for further authorization:'),(251,'brokering.title.list.of','Registered members of {0}'),(252,'paymentFilter.title.modify','Modify payment filter for {0}'),(253,'adminTasks.indexes.type.all','All'),(254,'help.title.documents','Documents'),(255,'changeChannels.disableChannels','Disable channels'),(256,'group.settings.channels','Accessible channels'),(257,'channel.internalName','Internal name'),(258,'alert.member.SCHEDULED_PAYMENT_FAILED','Scheduled payment failed'),(259,'reports.stats.activity.singlePeriod.percentageNoTrade.row1','% of members not trading'),(260,'global.total','Total'),(261,'payment.calculatePayments','Calculate payments'),(262,'guarantee.expires','Expires'),(263,'brokering.title.list.my','Registered members'),(264,'defaultBrokerCommission.title','Commission settings of {0}'),(265,'authorizationLevel.authorizer.level','Level'),(266,'notificationPreferences.noPaidSmsLeft','You have no additional paid SMS messages left'),(267,'alert.search.date.begin','From date'),(268,'accountFee.amount','Amount'),(269,'permission.adminMemberAccess.changeChannelsAccess','Change channels access'),(270,'permission.adminMemberCards.cancel','Cancel'),(271,'reports.stats.activity.topten.grossProduct.col1','Gross Product'),(272,'transferType.requiresFeedback','Require transaction feedback'),(273,'reference.transactionFeedback.feedbackPeriodExpired','The feedback period has expired.'),(274,'settings.local.schedulingMinute','Scheduled tasks minute'),(275,'externalTransferProcess.error.noPaymentToConciliate','No possible payments to conciliate'),(276,'permission.adminMemberLoans.grantWithDate','Grant loan in past date'),(277,'menu.admin.accounts.authorizedPayments','Authorized payments'),(278,'settings.local.csv.stringQuote.DOUBLE_QUOTE','Double quote'),(279,'permission.systemAdCategories.file','Export / import to file'),(280,'login.error.alreadyConnected','You are already logged in'),(281,'settings.mail.title','Mail settings'),(282,'settings.local.adResultDisplay','Ad result list shows'),(283,'reports.stats.keydevelopments.throughTime.quarters.title','Developments through the time'),(284,'settings.action.IMPORT','Import'),(285,'permission.adminMemberReferences','References'),(286,'transactionFee.conditions','Conditions of applicability'),(287,'brokerCommissionContract.action.deny','Deny'),(288,'adCategory.import.confirmation','Are you sure to import the advertisement categories from the selected file?'),(289,'reports.stats.taxes.numberOfMembers','By number of members'),(290,'transactionPassword.error.pending','To access this page, you need your transaction password.\nGo to Menu: home and generate it in the uppermost window.'),(291,'admin.action.create.selectGroup','Select admin group'),(292,'profile.action.byBroker.title','Broker actions for {0}'),(293,'accountFeeLog.status.OPEN_INVOICE','Open invoice'),(294,'loanPayment.expirationDate','Expiry'),(295,'receipt.transfer.installment','{0}  {1}  {2}'),(296,'permission.adminMemberAccess.changePin','Change pin'),(297,'multiDropDown.noItemsMessage','No items selected'),(298,'customImage.system.edit','Edit icon'),(299,'reports.stats.activity.singlePeriod.numberTransactions.yAxis','n Transactions'),(300,'menu.member.account.simulateConversion','Simulate conversion'),(301,'brokerCommissionContract.removeConfirmation','Remove this broker commission contract?'),(302,'permission.memberMessages','Messages'),(303,'changePin.modified','The pin was modified'),(304,'permission.adminAdminAccess.disconnect','Disconnect'),(305,'message.messageBox.INBOX','Inbox'),(306,'member.brokerUsername','Broker login'),(307,'permission.memberPayments.cancelAuthorized','Cancel payment pending authorization'),(308,'alert.system.ACCOUNT_FEE_FINISHED_WITH_ERRORS','Account fee finished with errors'),(309,'changeBroker.title','Change broker for {0}'),(310,'alert.system.ADMIN_LOGIN_BLOCKED_BY_PERMISSION_DENIEDS','Admin login temporarily blocked by permission denied'),(311,'adminTasks.onlineState.confirmOffline','Setting the system offline will disconnect all logged users (except you) and prevent any user from logging in, except administrators with permission to set the system online again.\n\nAre you sure to set the system offline?'),(312,'permission.systemGuaranteeTypes.view','View'),(313,'group.nature','Type'),(314,'receiptPrinter.error.applet','The receipt printer applet could not be initialized.\n\nMake sure you have the Java plugin installed and the jZebra applet has been properly authorized to run.'),(315,'paymentObligationLog.by','Changed by'),(316,'accountType.currency','Currency'),(317,'menu.admin.accounts.scheduledPayments','Scheduled payments'),(318,'menu.operator.account.simulateConversion','Simulate conversion'),(319,'remark.writer','Changed by'),(320,'customField.size.LARGE','Large'),(321,'paymentFilter.removed','The payment filter was removed'),(322,'adInterest.title.modify','Modify ad interest'),(323,'loanPayment.summary.recoveredPayments','Recovered payments'),(324,'invoice.to','To'),(325,'guarantee.description','Description'),(326,'guaranteeType.authorizedBy.NONE','None'),(327,'payment.authorize.transactionPassword','In order to authorize or deny this payment, you must supply your transaction password'),(328,'payment.confirmation.other','You are going to pay {0} to {2}.{3}\n\nPlease, click OK to confirm.'),(329,'menu.member.home','Home'),(330,'permission.systemSettings.manageAccess','Manage access settings'),(331,'accountType.error.removing','The account cannot be removed because it have at least one transaction or invoice'),(332,'customField.ad.visibility.MEMBER','All users'),(333,'permission.brokerMemberAccess.unblockPin','Unblock pin'),(334,'webshop.error.paymentDisabled','Webshop payments are not enabled for this user'),(335,'permission.adminMemberRecords.create','Create'),(336,'alert.member.pinBlockedByTries','Pin has been blocked for exceeding {0} tries, on channel {1} at member {2}'),(337,'home.admin.status.connectedMembers','Number of connected members'),(338,'adminTasks.onlineState.setOffline','Set system offline'),(339,'customImage.system.permissions_gray','Permissions disabled icon'),(340,'document.nature.STATIC','Static'),(341,'settings.error.noFile','Please, select a file to import the settings'),(342,'externalTransferImport.imported','The transaction file was imported'),(343,'reports.stats.keydevelopments.numberOfTransactions.title','Developments in number of transactions'),(344,'alert.system.adminLoginBlockedByTries','The admin \'{0}\' login is temporarily blocked by exceeding maximum amount of tries. The remote IP address is {2}'),(345,'reports.stats.keydevelopments.numberOfMembers.numberOfMembers.short','All'),(346,'group.description','Description'),(347,'transactionFee.amount','Amount'),(348,'pos.status.UNASSIGNED','Unassigned'),(349,'group.settings.defaultAdPublicationTime.number','Default ad publication time (amount)'),(350,'permission.operatorReports.viewMember','View my reports'),(351,'invoice.acceptConfirmationMessage','Accept incoming invoice from {0} of {1}?{2}\n\nPlease click OK to confirm.'),(352,'reports.stats.activity.throughTime.nTraders','n Traders'),(353,'profile.pendingEmail.resent','The verification e-mail has been sent to {0}'),(354,'settings.local.changeConfirmationMessage','Changing language will replace the translations file.\nAny customized messages will be lost.\nDo you want to continue?'),(355,'payment.canceled','The payment was canceled'),(356,'paymentObligation.currency','Currency'),(357,'customField.validation.minLength','Min. length'),(358,'menu.member.account.requestPayment','External payment request'),(359,'certification.status.SUSPENDED','Suspended'),(360,'document.action.new.dynamic','New dynamic document'),(361,'guarantee.guaranteeType','Guarantee type'),(362,'settings.message.newPendingPaymentByPayer','New payment for payer to authorize'),(363,'loanPayment.title.print','Loan payments result'),(364,'guaranteeType.description','Description'),(365,'fieldMapping.action.new','Insert new field mapping'),(366,'permission.memberPayments.blockScheduled','Block scheduled payment'),(367,'reports.stats.keydevelopments.throughTime.years.xAxis','Years'),(368,'settings.log.accountFeeLevel','Account fee log level'),(369,'receipt.posweb.transactions.scheduledPayments','Scheduled payments'),(370,'settings.mail.accountDetails','Account details'),(371,'reports.current.remaining_open_loans','Remaining amount of open loans'),(372,'errorLog.loggedUser.none','No logged user'),(373,'pos.blockPos.confirmation','Block the POS?'),(374,'externalTransferImport.removed','The transaction import was removed'),(375,'reports.simulations.dRateConfigSimulation.endD','End at D ='),(376,'permission.memberProfile.changeEmail','Change own e-mail'),(377,'menu.admin.settings.mail','Mail Settings'),(378,'global.month.MARCH','March'),(379,'loan.title.printDetails','Loan details'),(380,'reference.title.paymentsAwaitingFeedback','Payments awaiting feedback'),(381,'memberImport.invalidFormat','Invalid file format'),(382,'settings.local.language.PORTUGUESE_BRAZIL','Portuguese (Brazil)'),(383,'permission.memberInvoices.sendToSystem','Send to system'),(384,'paymentObligation.error.certificationActiveNotExists','Can not create payment obligations. There is no active certification to the currency {0}.  '),(385,'accountType.change','Change account'),(386,'menu.operator.home','Home'),(387,'profile.action.viewAds','View advertisements'),(388,'translationMessage.title.search','Search translation key'),(389,'customImage.system.captchaBackground','Register password background image'),(390,'reference.title.summary.transactionFeedbacks.of','Summary {0}\'s transaction feedbacks'),(391,'guarantee.error.noIssuer','There is no possible issuer for this guarantee type'),(392,'card.internalKey','Key'),(393,'errors.periodBeginRequired','Begin date of {0} is required'),(394,'changeChannels.invalidChannelsSelection','Please check your channels selection. There is a chennel selected to be enable and disable at the same time: {0}.'),(395,'menu.member.guarantees.searchPaymentObligations','Payment Obligations'),(396,'settings.local.language.GREEK','Greek'),(397,'pos.actions','Actions'),(398,'cardType.cardSecurityCode','Card security code'),(399,'adCategory.error.removing','This category could not be removed.\\nProbably, there are advertisements that belongs to it.'),(400,'customField.member.access.NONE','None'),(401,'global.timePeriod.MILLIS','Millisecond(s)'),(402,'paymentFilter.modified','The payment filter was modified'),(403,'permission.operatorInvoices.view','View'),(404,'receipt.transfer.textBefore','----------------'),(405,'accountFee.inserted','The account fee was inserted'),(406,'groupFilter.title.list','Group filters'),(407,'error.session.timeout','Please login again to continue.'),(408,'ticket.fromChannel','Channel'),(409,'ad.search.tradeType.OFFER','Offers'),(410,'memberRecord.inserted','The member record was inserted'),(411,'memberPos.status','Status'),(412,'transactionFee.originalTransferType','Original transaction type'),(413,'reports.stats.keydevelopments.throughTime.quarters.xAxis','Quarters'),(414,'brokerCommissionContract.error.removing','The broker commission contract cannot be removed because it already has commissions paid'),(415,'fileMapping.numberFormat','Number format'),(416,'messageCategory.removeConfirmation','Remove the Message Category?'),(417,'group.account.removed','The group account was removed'),(418,'guarantee.title.searchGuarantees','Search guarantees'),(419,'account.initialCreditTransferType','Initial credit transaction type'),(420,'reports.stats.mockwarning','BEWARE: this is mock data. Real statistics will be provided in the next update.'),(421,'permission.systemThemes.remove','Remove'),(422,'help.title.passwords','Passwords'),(423,'loan.payments','Payments'),(424,'paymentRequest.error.noChannels','There is no channels to send a request payment.'),(425,'menu.member.search.members','Members'),(426,'permission.systemStatus.view','View system status'),(427,'group.settings.passwordPolicy','Password policy'),(428,'changePassword.passwordLengthRange','Choose a password with a length between {0} and {1} characters'),(429,'transactionFee.fromAllGroups','From all groups'),(430,'ad.view.lastAds','latest ads'),(431,'channel.modified','The channel was modified'),(432,'permission.operatorPayments.request','Request payments from other channels'),(433,'payment.error.manageFrom','The logged user doesn\'t have permissions to manage the member \'{0}\'.'),(434,'permission.memberPayments.authorize','Authorize payment'),(435,'settings.access.usernameGeneration','Login name generation'),(436,'payment.authorizeOnly.transactionPassword','In order to authorize this payment, you must enter your transaction password'),(437,'loan.status.EXPIRED','Expired'),(438,'message.title.view','Message details'),(439,'changeBroker.noBroker','None'),(440,'transferType.channels','Channels'),(441,'ad.search.price','Price range'),(442,'message.trashPurgeNotification','Messages left on trash after {0} {1} will be removed'),(443,'global.search.all.male','All'),(444,'reports.stats.finances.singlePeriod.expenditure.title','Expenditure system account'),(445,'reports.stats.paymentfilters','Payment filters'),(446,'posweb.bannerText','POS web'),(447,'permission.adminAdmins.view','View'),(448,'reports.members_reports.incoming_transactions','Credit transactions'),(449,'reports.simulations.aRateConfigSimulation.startA','Start from A ='),(450,'translationMessage.title.modify','Modify translation key'),(451,'fieldMapping.field.AMOUNT','Payment amount'),(452,'group.containerUrl','Container page url'),(453,'externalAccount.title.insert','Insert external account'),(454,'error.systemOffline','The system is currently offline'),(455,'fileMapping.decimalPlaces.error.required','Decimal places is required'),(456,'createAdmin.action.saveAndOpenProfile','Save and open profile'),(457,'currency.modified','The currency was modified'),(458,'customField.member.adSearchAccess','Advertisement search for'),(459,'payment.title.memberToSystem','Payment to system'),(460,'group.settings.emailValidation.BROKER','Broker'),(461,'guarantee.action.accept','Authorize'),(462,'menu.member.broker.listMembers','Members'),(463,'reports.simulations.aRate.config.graph','Fee percentage vs A-rate'),(464,'errorLog.search.noResults','No errors found'),(465,'member.bulkActions.changeChannels','Enable/disable channels '),(466,'settings.local.showCountersInAdCategories','Show counters in advertisement categories'),(467,'paymentRequest.sent','The payment request has been sent to {0}'),(468,'reports.simulations.aRateConfigSimulation.title','A-rate Configuration Simulation'),(469,'contact.removeConfirmation','Remove contact?'),(470,'conversionSimulation.dRate','D rate'),(471,'paymentObligation.removed','The payment obligation was removed.'),(472,'reports.current.references','References'),(473,'fileMapping.dateFormat','Date format'),(474,'guarantee.status.PENDING_ISSUER','Pending Issuer'),(475,'settings.message.transactionFeedbackAdminComments','Transaction feedback administration comments'),(476,'transfersAwaitingAuthorization.title','Transfers to authorize'),(477,'permission.operatorReferences.manageMemberReferences','Manage my references'),(478,'group.settings.initialGroupForRegisteredMembers','Initial group for registered members'),(479,'paymentObligation.selectPaymentObligations','Select payment obligations'),(480,'reports.members.ads','Ads'),(481,'payment.status.CANCELED','Canceled'),(482,'reports.current.system_account','System accounts'),(483,'accountFeeLog.date','Execution date'),(484,'login.action.loginAsOperator','Login as operator'),(485,'reports.members.ads.expired_ads','Expired ads'),(486,'card.activated','Card activated'),(487,'customizedFile.type','Type'),(488,'pos.posId','Identifier'),(489,'reports.current.n_adsaccount','Number of active members with active advertisements'),(490,'help.title.member_records','Member records'),(491,'message.action.MOVE_TO_TRASH','Move to trash'),(492,'activities.title.of','Reports of {0}'),(493,'mobile.login.title','Cyclos Login'),(494,'errors.invalid','{0} is invalid'),(495,'profile.action.sendInvoice','Send invoice'),(496,'certification.guarantees','Guarantees'),(497,'invoice.search.direction','Type'),(498,'smsLog.title.search','Search SMS messages logs to {0}'),(499,'permission.adminMemberTransactionFeedbacks.view','View'),(500,'memberRecordType.title.insert','New member record type'),(501,'reports.stats.activity.comparePeriods.loginTimes','Logins per member'),(502,'permission.systemPayments.cancel','Cancel'),(503,'reports.stats.transferTypeFilters','Transfer type filters'),(504,'settings.access.usernameGeneration.RANDOM','Generated random number'),(505,'activities.title.my','My reports'),(506,'settings.log.traceWritesOnly','Generate log only if data was changed'),(507,'reports.stats.finances.keyParams','Key parameters for finance statistics'),(508,'permission.adminMemberMessages','Messages'),(509,'multiDropDown.singleItemMessage','1 item selected'),(510,'transactionFee.fromFixedMember.username','Will be charged login name'),(511,'about.message','Information about the Cyclos project can be found at: <a href=\"{0}\"><u>{0}</u></a>'),(512,'externalTransferImport.error.importing.invalidMemberId','Invalid member identifier: {0}'),(513,'activities.brokering.commission.count','Commissioned transactions'),(514,'notificationPreferences.my.title.name','Notification preferences'),(515,'global.searchResults','Search results'),(516,'sms.type.REQUEST_PAYMENT_ERROR','Request payment error'),(517,'payment.error.upperCreditLimit','The payment cannot be performed. For more details please contact the administrator.'),(518,'group.title.new','Insert new group'),(519,'accountHistory.credits.count','Transactions received'),(520,'createMember.initialGroup.preface.public','Please, choose the group you want to participate'),(521,'customField.member.access.MEMBER','Member'),(522,'reports.stats.keydevelopments.numberOfAds.yAxis','Number'),(523,'registrationAgreement.name','Name'),(524,'reports.members.permission_groups','Permission groups'),(525,'customField.size.TINY','Tiny'),(526,'global.pixels','pixels'),(527,'transactionPassword.blocked','The transaction password is now blocked'),(528,'alert.member.DENIED_INVOICES','Member denied too many invoices'),(529,'permission.memberPayments.ticket','Generate external payment tickets'),(530,'loan.title.confirm','Loan confirmation'),(531,'permission.systemTranslation.manage','Manage'),(532,'guarantee.sellerUsername','Seller login'),(533,'payment.firstPaymentDate','First payment at'),(534,'group.account.error.minInitialCredit','The initial credit amount \'{0}\' must be greater o equal to the minimum amount configured in the transfer type: \'{1}\''),(535,'scheduledPayment.title.transfers','Scheduled payment transfers'),(536,'ad.title.insert','New advertisement'),(537,'brokerCommission.type.defaultCommission','Default commission'),(538,'permission.memberReports.view','View'),(539,'accountFee.chargeMode','Charge mode'),(540,'pos.updated','The POS was updated'),(541,'transactionFee.toFixedMember.username','Will receive login name'),(542,'adminTasks.indexes.type.Ad','Advertisements'),(543,'theme.action.select','Apply'),(544,'transfer.processDate','Processed at'),(545,'adCategory.error.cantActivateCategoryWithInactiveParent','A category cannot be activated if it\'s parent category is inactive'),(546,'customField.modified','The custom field was modified'),(547,'adInterest.priceRange','Price range'),(548,'permission.memberAccess','Access'),(549,'adImport.adsWithErrors','Advertisements with errors'),(550,'permission.brokerPreferences.manageNotifications','Manage notifications'),(551,'brokerCommissionContract.status.ACTIVE','Active'),(552,'group.settings.pinBlockTimeAfterMaxTries.number','Pin block time after max tries'),(553,'profile.pendingEmail.link','Resend verification e-mail'),(554,'createMember.assignBroker','Assign broker'),(555,'customField.ad.searchVisibility.NONE','None'),(556,'brokering.loans.count','Open loans'),(557,'mobile.payment.error.maxAmountPerDay','You have already reached the maximum amount today'),(558,'pendingMember.emailResent','The validation e-mail has been resent'),(559,'reports.stats.activity.comparePeriods.percentageNoTrade.row1','% of members not trading'),(560,'transferType.fixedDestinationMember.username','Fixed destination member login name'),(561,'guaranteeType.model','Model'),(562,'ad.search.keywords','Keywords'),(563,'permission.memberPreferences','Preferences'),(564,'ad.error.maxAds','Member {0} has exceeded the maximum allowed advertisements'),(565,'externalAccountHistory.period.end','To date'),(566,'brokerCommissionContract.error.notPendingStatus','It\'s just possible to save pending contracts'),(567,'permission.brokerMemberRecords.delete','Delete'),(568,'transferType.transactionHierarchyVisibility','Show parent / child transactions'),(569,'menu.admin.guarantees.searchCertifications','Certifications'),(570,'settings.message.adExpiration','Ad expiry'),(571,'memberImport.status.INVALID_CREDIT_LIMIT','Invalid credit limit: {0}'),(572,'groupFilter.rootUrl','Application root URL'),(573,'customField.ad.visibility.ADMIN','Administrators only'),(574,'card.action.activate','Activate'),(575,'fieldMapping.field','Field'),(576,'message.search.noResults','You have no messages for the given filters'),(577,'loan.repayment.manualDate','Repayment date'),(578,'cardType.removeConfirmation','Remove this card type?'),(579,'accountHistory.debits.amount','Sum of paid'),(580,'groupFilter.customizedFiles.title','Customized files'),(581,'memberImport.status.SUCCESS','Success'),(582,'reports.members_reports.total_amount','Total amount'),(583,'memberRecordType.removed','The member record type was removed'),(584,'permission.brokerAds.view','View'),(585,'permission.adminMembers.changeUsername','Change login name'),(586,'translationMessage.import.error.reading','Error while reading the properties file'),(587,'login.transactionPassword','Transaction password'),(588,'reports.simulations.aRate.config.combinedGraph.title','A-rate configuration curve'),(589,'menu.member.operators','Operators'),(590,'alert.system.applicationRestarted','Application started'),(591,'guarantee.editGuaranteeType','Edit guarantee type'),(592,'card.status.EXPIRED','Expired'),(593,'menu.member.personal.contacts','Contacts'),(594,'customImage.system.next','Next page icon'),(595,'customField.size.FULL','Full'),(596,'login.systemOffline','The system is currently offline.\nPlease, try again later.\nSorry for the inconvenience.'),(597,'reports.stats.keydevelopments.numberOfMembers','Number of members'),(598,'manual.action.printSection','Print current section'),(599,'invoice.search.direction.OUTGOING','Outgoing'),(600,'group.settings.passwordLength','Password length'),(601,'guarantee.amount','Amount'),(602,'loanGroup.title.view','Loan group details'),(603,'loan.repayment.error.upperCreditLimit','The loan cannot be repaid because it would make the receiving system account to have a balance beyond it\'s upper credit limit'),(604,'permission.systemExternalAccounts.managePayment','Manage payment'),(605,'ad.publicationPeriod.end','Expiry date'),(606,'memberImport.membersWithErrors','Members with errors'),(607,'changePassword.error.sameAsTransactionPasswordOrPin','The password can\'t be the same as transaction password or PIN'),(608,'messageCategory.removed','The message category was removed'),(609,'mobile.error.invalidUser','Invalid user for mobile service'),(610,'certification.error.changeStatus','Can\'t change the certification\'s status to: {0}'),(611,'reports.members_reports.system_invoices','System invoices'),(612,'memberImport.status.INVALID_CUSTOM_FIELD_VALUE_MAX_LENGTH','{0} is invalid: the maximum length is {1}.'),(613,'mobile.welcomeMessage','Please change the following translation key (At the admin section: Translation - Application): mobile.welcomeMessage'),(614,'settings.local.memberSortOrder.CHRONOLOGICAL','Chronological (on creation date)'),(615,'global.tooltip.exportCSV','Export to CSV'),(616,'ad.price','Price'),(617,'certification.inserted','The Certification was created'),(618,'settings.local.language.DUTCH','Dutch'),(619,'externalTransfer.status.PROCESSED','Processed'),(620,'alert.system.accountFeeFinished','Account fee {0} has finished'),(621,'settings.log.scheduledTaskLevel','Scheduled task log level'),(622,'smsMailing.search.noResults','There are no SMS mailings'),(623,'createMember.error.usernameAlreadyInUse','The given login name ({0}) is already in use'),(624,'loanPayment.summary.inProcessPayments','In process payments'),(625,'externalTransfer.status','Status'),(626,'reports.stats.activity.singlePeriod.numberTransactions.row1.short','traders'),(627,'translationMessage.imported','The properties file was imported'),(628,'memberRecord.action.new','Create new {0}'),(629,'loan.status.CLOSED','Closed'),(630,'reports.stats.activity.topten.numberTransactions','Number of transactions'),(631,'menu.member.personal.ads','Advertisements'),(632,'brokerCommissionContract.status.EXPIRED','Expired'),(633,'customField.allSelectedLabel','All selected label'),(634,'memberRecord.modified','The member record was modified'),(635,'settings.log.title','Log settings'),(636,'alert.system.NULL_IRATE','Unexpected null I-rate encountered'),(637,'permission.systemPayments.blockScheduled','Block scheduled payment'),(638,'paymentObligation.title.view','View payment obligation'),(639,'permission.module.type.MEMBER','Member permissions of {0}'),(640,'invoice.destination','Destination'),(641,'alert.system.ACCOUNT_FEE_FINISHED','Account fee finished'),(642,'member.bulkActions.changeBroker','Change broker'),(643,'alert.member.nullIRate','I-rate had unexpected null for account {1}. You may want to reinitialize the i-rate. '),(644,'menu.admin.cards','Cards'),(645,'memberImport.status.MISSING_CUSTOM_FIELD','{0} is missing'),(646,'menu.admin.alerts.member','Member Alerts'),(647,'menu.member.account.memberPayment','Member Payment'),(648,'changeGroup.error.remove.hasOpenInvoices','The member cannot be removed because it has open invoices'),(649,'group.settings.externalAdPublication.ENABLED','Enabled'),(650,'group.title.settings.brokering','Brokering settings'),(651,'permission.brokerSmsMailings.freeSmsMailings','Send free SMS mailings'),(652,'global.weekDay.WEDNESDAY','Wednesday'),(653,'transactionFee.aRateRelation','Relation between fee and A rate'),(654,'externalTransfer.member','Member'),(655,'customField.action.changeOrder','Change field order'),(656,'invite.message','Enter an e-mail address; this person receives an invitation to try out the software'),(657,'home.admin.status.connectedBrokers','Number of connected brokers'),(658,'group.active','Activate group'),(659,'smsLog.count','Sent SMSs'),(660,'accountFeeLog.acceptedInvoices','Accepted invoices'),(661,'smsLog.status','Status'),(662,'pos.pinUnblocked','The PIN was unblocked'),(663,'settings.type.LOG','Log settings'),(664,'errors.greaterThan','{0} must be greater than {1}'),(665,'mobile.payment.description','Description'),(666,'receiptPrinterSettings.beginOfDocCommand','Begin of document command'),(667,'brokering.memberAdded','The member was added'),(668,'permission.brokerMemberPayments.cancelAuthorizedAsMember','Cancel authorized payment as member'),(669,'loanGroup.action.create','Create loan group'),(670,'permission.adminMemberReports.showAccountInformation','Show account information'),(671,'reports.current.invoices.MEMBER.amount','Total sum of member invoices'),(672,'message.sendTo','Send to'),(673,'transactionFee.toFixedMember.name','Will receive full name'),(674,'alert.system.ACCOUNT_FEE_CANCELLED','Account fee cancelled'),(675,'group.settings.transactionPassword','Transaction password'),(676,'customImage.system.mobileLogo','Mobile logo'),(677,'profile.action.mail','Send e-mail'),(678,'login.password','Password'),(679,'permission.systemAccounts.authorizedInformation','View authorized payments'),(680,'adInterest.title.list','List of ad interests'),(681,'permission.adminMembers.remove','Permanently remove'),(682,'cardType.securityCodeBlockTime','Card security code block time'),(683,'loan.expirationFee','Expiry fee'),(684,'settings.local.maxChargebackTime','Max. time to chargeback'),(685,'loan.amount','Amount'),(686,'loan.repayment.paymentNumber','Payment number'),(687,'global.tooltip.view','View'),(688,'reports.current.presentation.result.at','State reports: Results on'),(689,'profile.action.paymentAsMemberToSystem','Payment member to system'),(690,'document.inserted','The document was inserted'),(691,'group.registrationAgreement','Registration agreement'),(692,'member.username','Account ID'),(693,'paymentObligation.expiration','Expiration'),(694,'paymentRequest.title.search','Search payment requests'),(695,'certification.login','Login'),(696,'card.status.PENDING','Pending'),(697,'channel.credentials.TRANSACTION_PASSWORD','Transaction password'),(698,'infoText.removeConfirmation','Remove this infotext?'),(699,'permission.memberAds.view','View'),(700,'pendingMember.title.search','Pending members'),(701,'reference.title.summary.references.of','Summary {0}\'s references'),(702,'accountType.title.list','Accounts'),(703,'accountFee.name','Name'),(704,'accountFee.invoiceMode','Send invoice'),(705,'reports.stats.activity.throughTime.grossProduct','Gross Product per member'),(706,'translationMessage.action.export','Export as properties file'),(707,'mobile.payment.transactionPassword','Trans. Pwd.'),(708,'fileMapping.nature.CUSTOM','Custom'),(709,'guaranteeType.feeType.FIXED','Fixed'),(710,'guaranteeType.authorizedBy.BOTH','Issuer and Administrator'),(711,'accountFeeLog.failedMembers','Errors'),(712,'fieldMapping.action.changeOrder','Change field mappings order'),(713,'currency.dRate.baseMalus','Base malus'),(714,'settings.mail.smtpServer','Hostname'),(715,'reports.simulations.aRate.config.combinedGraph.xAxis','A-rate relative to guarantee period'),(716,'pos.new','Insert new POS'),(717,'fileMapping.modified','File mapping modified'),(718,'transferType.title.modify','Modify transaction type'),(719,'transferType.defaultFeedbackLevel','Feedback level on expiration'),(720,'customField.size.SMALL','Small'),(721,'home.status.openInvoices','You have {0} open invoices'),(722,'posweb.error.notEnoughCredits','The payment couldn\'t be performed'),(723,'payment.confirmation.doExternal','Please, check the data above and click confirm to make the payment'),(724,'group.nature.OPERATOR','Operator'),(725,'paymentFilter.allPaymentFilters','All payment filters'),(726,'transferAuthorization.action.CANCEL','Canceled'),(727,'alert.member.accountActivationFailed','Activation of account {0} has failed'),(728,'group.settings.maxAdsPerMember','Max ads per member'),(729,'reports.stats.paymentFilters.noOverlap','Error: Overlapping payment filters\n\nPlease choose another set of payment filters.\n\nFor details see the help of the filter box.'),(730,'memberImport.status.INVALID_EMAIL','Invalid e-mail: {0}'),(731,'payment.error.maxAmountOnDayExceeded.at','You have already exceeded the maximum amount for transaction {0} at {1}.'),(732,'invoice.title.send.system','Send invoice to system'),(733,'profile.action.manageAds','Manage advertisements'),(734,'settings.local.numberLocale.COMMA_AS_DECIMAL','1.234,56'),(735,'permission.operatorPayments.cancelAuthorized','Cancel payment authorization'),(736,'settings.local.sms.customField','Custom field representing the mobile phone'),(737,'loan.discarded','The discarding was succesfully processed'),(738,'loan.status.OPEN','Open'),(739,'payment.title.brokerMemberToMember','Payment between members'),(740,'memberRecordType.name','Name'),(741,'remark.title','Remarks of {0}'),(742,'permission.brokerPreferences','Preferences'),(743,'brokerCommissionContract.status.SUSPENDED','Suspended'),(744,'permission.systemInfoTexts.manage','Manage'),(745,'reference.transactionFeedback.replyComments.saved','The transaction feedback reply was saved'),(746,'accountFee.description','Description'),(747,'adImport.status.INVALID_PUBLICATION_END','Invalid publication end date: {0}'),(748,'permission.adminMemberTransactionFeedbacks.manage','Manage'),(749,'changePin.pinLength','Choose a pin with {0} characters'),(750,'accountType.nature.SYSTEM','System'),(751,'notificationPreferences.freeSmsUsed','You have used {0} of {1} free SMS messages this month'),(752,'menu.admin.accessDevices.cards.search','Search cards'),(753,'currency.enableDRate','Enable D-rate'),(754,'reports.stats.activity.histogram.grossProduct.title','Gross Product per member, Histogram'),(755,'loan.grant.firstExpirationDate','First expiry date'),(756,'alert.system.newVersionOfStaticFile','There is a new version of a customized static file, {0}.\nPlease, check the customization in order to resolve possible conflicts'),(757,'permission.systemChannels.view','View'),(758,'certification.expires','Expires'),(759,'reports.stats.general.notUsed','not used'),(760,'authorizationLevel.adminGroups.none','None'),(761,'account.status','Status'),(762,'notificationPreferences.title.name','Notification preferences of {0}'),(763,'accountFeeLog.status','Status'),(764,'accountHistory.title.print','Transactions on {0}'),(765,'invoice.status.CANCELLED','Cancelled'),(766,'login.error','Invalid login. Please try again'),(767,'loan.paymentCount','Number of repayments'),(768,'permission.systemInfoTexts.view','View'),(769,'notificationPreferences.acceptFreeMailing','Accept free SMS mailings'),(770,'settings.message.newPendingPaymentByBroker','New payment for broker to authorize'),(771,'permission.adminMemberLoans.grant','Grant loan'),(772,'group.registrationAgreement.explanation','In order to proceed and use the software, you must accept the following registration agreement first:'),(773,'permission.systemGroups.manageBroker','Manage broker group'),(774,'brokering.title.addMember','Add member'),(775,'settings.local.limits','Limits'),(776,'alert.member.INITIAL_CREDIT_FAILED','Initial credit transaction failed'),(777,'changeGroup.old','Old group'),(778,'document.nature.DYNAMIC','Dynamic'),(779,'permission.adminMemberPos.unblockPin','Unblock PIN'),(780,'permission.memberLoans','Loans'),(781,'transfer.title.children','Generated transaction details'),(782,'certification.issuerName','Issuer name'),(783,'adImport.status.INVALID_PUBLICATION_START','Invalid publication start date: {0}'),(784,'reports.stats.general.p','p-value'),(785,'adImport.status.MAX_PUBLICATION_EXCEEDED','Max publication period exceeded'),(786,'scheduledPayment.title.details','Scheduled payment details'),(787,'memberRecord.title.flat','{0} for {1}'),(788,'fieldMapping.inserted','Field mapping inserted'),(789,'reports.members_reports.outgoing_transactions','Debit transactions'),(790,'global.quarter.SECOND','Second quarter'),(791,'certification.unlock','Unlock'),(792,'permission.brokerMemberSms','SMS logs'),(793,'permission.brokerAds.manage','Manage'),(794,'permission.systemAdCategories','Ad categories'),(795,'settings.message.scheduledPaymentFailedToPayer','Scheduled payment failed (to payer)'),(796,'cardType.showCardSecurityCode','Display the card security code'),(797,'reference.title.new.transactionFeedback','Set transaction feedback'),(798,'settings.message.scheduledPaymentFailedToPayee','Scheduled payment from invoice failed (to payee)'),(799,'permission.basic.login','Login'),(800,'changePassword.error.userBlocked','Your login has been temporarily blocked'),(801,'reports.current.invoices.SYSTEM_OUTGOING.amount','Sum of outgoing system invoices'),(802,'transactionPassword.error.blocked','Your transaction password is blocked.\nPlease, contact the administration.'),(803,'reports.stats.activity.comparePeriods.grossProduct','Gross Product per member'),(804,'permission.adminMemberPreferences','Preferences'),(805,'permission.memberPayments.request','Request payments from other channels'),(806,'externalAccountHistory.search.noResults','You have no transfers for the given filters'),(807,'guaranteeType.currency','Currency'),(808,'guarantee.amountToCharge','To charge'),(809,'reports.stats.keydevelopments.throughTime.quarters','Through quarters'),(810,'certification.modified','The Certification was modified'),(811,'loan.type.SINGLE_PAYMENT','Single payment'),(812,'paymentObligation.expire','Expired'),(813,'settings.message.removedFromBrokerGroup','Removed from broker group'),(814,'home.admin.jumpToProfile.title','Jump to member profile'),(815,'fieldMapping.field.IGNORED','Ignored'),(816,'pos.assigned','POS assigned to member {0}'),(817,'help.title.translation','Translation'),(818,'brokerCommissionContract.status','Status'),(819,'payment.error.noTransferType','There is no possible type for this payment.\nPlease, contact the administration.'),(820,'settings.local.transactionNumber','Transaction number'),(821,'permission.memberInvoices.view','View'),(822,'smsMailing.variables','Variables'),(823,'menu.member.search','Search'),(824,'permission.systemAccounts','Accounts'),(825,'conversionSimulation.aRate.present','Present A rate'),(826,'mobile.viewPayments.transactionNumber','Tx. Nr.'),(827,'permission.systemCustomImages.manage','Manage'),(828,'menu.member.operators.customFields','Custom fields'),(829,'loan.title.search.group','Loans of group {0}'),(830,'account.lowUnitsMessage','Low units message'),(831,'group.modified','The group was modified'),(832,'alert.system.RATE_INITIALIZATION_STARTED','rate initialization job started'),(833,'customField.payment.searchAccess','Show in search'),(834,'global.month.DECEMBER','December'),(835,'mobile.viewPayments.previous','Prev.'),(836,'group.title.modify.broker','Edit broker group settings'),(837,'sms.type.INFO_TEXT_ERROR','Info text error'),(838,'groupFilter.loginPageName','Login page name'),(839,'settings.mail.modified','The mail settings were modified'),(840,'image.details.hint','Fill in the image caption'),(841,'group.nature.MEMBER','Member'),(842,'message.action.MARK_AS_UNREAD','Mark as unread'),(843,'accountType.nature','Type'),(844,'reports.stats.activity.histogram.numberTransactions.title','Number of Transactions per member, Histogram'),(845,'ad.description','Description'),(846,'brokerCommissionContract.member','Member'),(847,'reports.stats.keydevelopments.numberOfAds.active','Active ads '),(848,'permission.systemCustomizedFiles.view','View'),(849,'customImage.system.message_read','Read message icon'),(850,'permission.systemTasks.manageIndexes','Manage indexes'),(851,'createMember.public.validated','Thanks for registering!\n\nYou can now login with the login name {0}'),(852,'adInterest.groupFilter','Community'),(853,'sms.type.HELP.description','Help'),(854,'smsMailing.type.FREE','Free'),(855,'group.title.settings.externalAccess','External access settings'),(856,'ad.status','Status'),(857,'accountType.all','All'),(858,'mobile.home.creditLimit','Limit: {0}'),(859,'reports.stats.taxes.maxMember','Maximum Amount for a member'),(860,'permission.adminMemberPayments.cancelAuthorizedAsMember','Cancel authorized payment as member'),(861,'customImage.removed','The image was removed'),(862,'settings.local.language','Language'),(863,'rates.reinit.maintainLast','Maintain past settings'),(864,'changeGroup.error.remove','This user cannot be permanently removed, because he has been active on the system.\nYou should move him to a removed group'),(865,'permission.systemTranslation.manageMailTranslation','Mail translation'),(866,'reports.members.ads.scheduled_ads','Scheduled ads'),(867,'webshop.payment.cancelConfirmation','Confirm'),(868,'customField.validation','Validation'),(869,'loanGroup.loanGroup','Loan group'),(870,'profile.member.brokerLink','Open profile'),(871,'guarantee.issuer','Issuer'),(872,'permission.systemAlerts.viewSystemAlerts','View system alerts'),(873,'permission.systemTasks.onlineState','Set system availability'),(874,'createMember.title.byBroker','Brokering - Create new member'),(875,'loan.summary.remainingAmount','Total remaining amount'),(876,'reports.current.n_actvads','Number of active advertisements'),(877,'externalTransferType.action.GENERATE_SYSTEM_PAYMENT','Generate payment to system'),(878,'permission.adminMembers.changeEmail','Change e-mail'),(879,'reports.stats.keydevelopments.numberOfAds.created.short','created'),(880,'reports.stats.activity.histogram.grossProduct.xAxis','Gross Product'),(881,'sms.type.HELP_ERROR.description','Help error'),(882,'transactionFee.initialAmount','Amount greater or equals'),(883,'payment.action.payNow','Pay now'),(884,'message.sendTo.GROUP','Group(s)'),(885,'changeGroup.operator.changed','The operator\'s group was changed'),(886,'reports.stats.finances.ThroughTime.income.yAxis','Income'),(887,'notificationPreferences.sms','SMS'),(888,'loan.summary.amount','Total amount'),(889,'menu.operator.account.scheduledPayments','Scheduled payments'),(890,'permission.adminMemberAds.view','View'),(891,'group.title.search','Search permission groups'),(892,'settings.access.externalPaymentPassword.LOGIN_PASSWORD','Login'),(893,'permission.brokerRemarks.manage','Manage'),(894,'permission.systemAccounts.information','View system accounts information'),(895,'accountFeeLog.payments','Payments'),(896,'settings.log.scheduledTaskFile','Scheduled task logfile path / name'),(897,'help.title.reports','Reports'),(898,'document.modified','The document was modified'),(899,'changePassword.error.mustBeNumeric','The password can only contain numbers'),(900,'cardType.cardSecurityCodeLength.min','Card security code min size'),(901,'accountFee.removed','The account fee was removed'),(902,'reports.simulations.aRate.config.graph.yAxis','Fee'),(903,'admin.id','Id'),(904,'settings.alert.givenVeryBadRefs','Given very bad references'),(905,'permission.systemTranslation.file','Import / export to file'),(906,'message.rootType.MEMBER','Member'),(907,'document.visibility.BROKER','Broker'),(908,'menu.admin.usersGroups.groups','Permission Groups'),(909,'transferType.allowBlockScheduledPayments','Allow payer to block scheduled payments'),(910,'ad.error.maxPublicationTimeExceeded','The maximum publication time has been exceeded'),(911,'creditLimit.new','New'),(912,'scheduledPayments.searchType.INCOMING','Incoming'),(913,'alert.system.INDEX_REBUILD_END','Search index rebuilding end'),(914,'help.title.connected_users','Connected Users'),(915,'certification.title.view','View Certification'),(916,'permission.operatorInvoices.sendToSystem','Send to system'),(917,'account.initialCredit','Initial credit'),(918,'transfer.scheduling','Scheduling'),(919,'menu.admin.ads.importAds','Import advertisements'),(920,'ad.status.PERMANENT','Permanent'),(921,'sms.type.REQUEST_PAYMENT_ERROR.description','Request payment error'),(922,'accountHistory.credits.amount','Sum of received'),(923,'loanGroup.removeFromMemberConfirmation','Remove the member from this loan group?'),(924,'card.updateCard.error.invalidTransactionPassword','Incorrect transaction password'),(925,'adImport.status.INVALID_CUSTOM_FIELD','{0} is invalid: {1}'),(926,'posweb.action.makePayment','Make payment (F3)'),(927,'loan.awaitingAuthorization','The loan has been submitted for further authorization'),(928,'accountOverview.error.noAccounts','You have no accounts'),(929,'infoText.title.edit','Edit info text'),(930,'customImage.system.dropdown','Dropdown icon'),(931,'customField.title.modify.loan','Modify loan custom field'),(932,'customImage.system.edit_gray','Edit empty icon'),(933,'permission.module.type.ADMIN_SYSTEM','System administration permissions of {0}'),(934,'reports.stats.activity.singlePeriod.numberTransactions.title','Number of Transactions per member (single period)'),(935,'invoice.invalid.paymentAmount','The invoice amount must be the same as the sum of each payment\'s amount'),(936,'settings.access.error.numericPassword.groupsRequireLetters','{0} cannot be enabled because there is at least one member group which enforces letters on passwords'),(937,'changeGroup.confirmRemove','Changing a member to group {0} will remove all\nadvertisements, contacts and references of this member.\n\nAre you sure?'),(938,'serviceClient.permissions','Permissions'),(939,'serviceClient.username','HTTP username'),(940,'conversionSimulation.useActualRates','Use actual rates'),(941,'customImage.title.system','System images'),(942,'customField.memberRecord.memberRecordType','Type'),(943,'global.datePattern.hour','hh'),(944,'reports.stats.finances.income','Income'),(945,'memberRecord.title.edit','Edit {0} for {1}'),(946,'menu.admin.alerts.alertHistory','Alerts History'),(947,'card.expirationPeriod.to','To'),(948,'authorizationLevel.authorizer.BROKER','Broker / admin'),(949,'reports.stats.activity.whatToShow.THROUGH_TIME','Through the time'),(950,'menu.admin.contentManagement.helpFiles','Help Files'),(951,'pin.unblocked','The pin has been unblocked'),(952,'group.customizedFiles.title.modify','Modify customized file for {0}'),(953,'cardType.cardSecurityCode.MANUAL','Manual'),(954,'currency.error.removing','The currency could not be removed, because there are account types associated with this currency'),(955,'adImport.title.details.error','Advertisements with import errors'),(956,'profile.pendingEmail','Change to {0} is pending confirmation'),(957,'transactionPassword.MANUAL','Manual'),(958,'externalTransferType.action.IGNORE','None'),(959,'order.save','Save'),(960,'permission.basic.inviteMember','Invite member'),(961,'settings.types','Types'),(962,'permission.systemThemes.export','Export'),(963,'remark.inserted','The remark was inserted'),(964,'channel.title.modify','Modify channel'),(965,'menu.operator.member.references','References'),(966,'reports.stats.taxes.paid.legend','Show statistics on taxes...'),(967,'createOperator.password','Password'),(968,'memberImport.status.INVALID_RECORD_TYPE','Invalid record type: {0}'),(969,'permission.memberCards.cancel','Cancel'),(970,'connectedUsers.nature','Show'),(971,'reports.stats.activity.throughTime.loginTimes.col1','Logins / member'),(972,'pos.title.search','Search POS'),(973,'infoText.enabled','Enabled'),(974,'permission.systemMessageCategories','Message categories'),(975,'externalAccount.inserted','The external account was inserted'),(976,'settings.neverExpiresMessage','0 never expires'),(977,'customizedFile.title.search.static','Customized static files'),(978,'ad.tradeType.SEARCH','Wants'),(979,'message.link.label','Click here'),(980,'reports.stats.keydevelopments.averageAmountPerTransaction','Median amount per transaction'),(981,'smsMailing.sendType.member','To member'),(982,'conversionSimulation.account','Take values from'),(983,'quickAccess.updateProfile','My profile'),(984,'customField.possibleValue.multipleValues','You may enter several values, one per line'),(985,'channel.enableSMS','For SMS channel configuration, go to '),(986,'guarantee.generatedLoan','Generated loan'),(987,'menu.member.broker.pendingMembers','Pending members'),(988,'reports.stats.activity.histogram.numberTransactions.xAxis','Number of Transactions'),(989,'brokerCommissionContract.action.cancel','Cancel'),(990,'customField.possibleValue.field','Field'),(991,'loan.queryStatus.RECOVERED','Recovered'),(992,'adCategory.import.file','File'),(993,'reports.stats.keydevelopments.numberOfAds.scheduled','Scheduled ads'),(994,'externalTransferType.transferType','Payment Type'),(995,'group.title.settings.registration','Registration settings'),(996,'fileMapping.removed','File mapping removed'),(997,'global.amount.type.FIXED','Fixed'),(998,'cardType.cardSecurityCodeLength.max','Card security code max size '),(999,'settings.local.title','Local settings'),(1000,'group.account.noResults','This group has no associated accounts'),(1001,'help.title.messages','Messages'),(1002,'customField.name','Name'),(1003,'conversionSimulation.result.input','Input'),(1004,'ad.title.view','Advertisement details'),(1005,'global.uploadLimit','max'),(1006,'reports.current.references.total','Total amount of references given'),(1007,'alert.title.member','Member alerts'),(1008,'permission.brokerAccounts.authorizedInformation','View authorized payments'),(1009,'category.status','Status'),(1010,'card.blockCard.confirmation','Block card?'),(1011,'permission.brokerMembers','Brokering'),(1012,'reports.stats.general.appliedFilters','Applied filters'),(1013,'guaranteeType.updated','Guarantee type updated'),(1014,'permission.adminMemberCards.unblockSecurityCode','Unblock card security code'),(1015,'profile.action.scheduledPayments','View scheduled payments'),(1016,'menu.admin.home','Home'),(1017,'customField.member.access.MEMBER_NOT_REGISTRATION','Member, not at registration'),(1018,'reports.stats.keydevelopments.periodType.THROUGH_TIME','Through time'),(1019,'certificationLog.status','Status'),(1020,'ad.status.SCHEDULED','Scheduled'),(1021,'group.settings.pinLength','Pin length'),(1022,'guarantee.sellerName','Seller name'),(1023,'creditLimit.upper','Upper'),(1024,'reports.members.references','References'),(1025,'permission.brokerPos.block','Block'),(1026,'webshop.payment.headerText','You are about to make payment with the amount of {0} to {1} ({2}).'),(1027,'menu.admin.contentManagement.manageTranslation','Translation File'),(1028,'adImport.status.MISSING_PUBLICATION_PERIOD','Missing publication period'),(1029,'accountFee.paymentDirection.TO_SYSTEM','Member to system'),(1030,'fieldMapping.modified','Field mapping modified'),(1031,'document.title.list','Custom document list'),(1032,'reports.members.ads.active_ads','Active ads'),(1033,'customField.member.access.REGISTRATION','Member registration'),(1034,'infotext.subject','Title'),(1035,'error.permissionDenied','You don\'t have sufficient permissions to perform this action'),(1036,'permission.modified','The permissions were modified'),(1037,'pos.title.modify','Modify POS'),(1038,'permission.brokerLoanGroups.view','View'),(1039,'settings.message.loanGranted','Loan grant'),(1040,'group.settings.defaultAdPublicationTime','Default ad publication time'),(1041,'customizedFile.title.customize.static','Customize static file'),(1042,'settings.local.csv.stringQuote.NONE','None'),(1043,'ad.search.withImagesOnly','With images only'),(1044,'adInterest.keywords','Keywords'),(1045,'settings.log.transactionLevel.DETAILED','Detailed'),(1046,'transactionFee.whichBroker','Will receive'),(1047,'loanPayment.status.REPAID','Repaid'),(1048,'reports.stats.comparedPeriods','Compared periods'),(1049,'mailPreferences.saved','The e-mail notification preferences were saved'),(1050,'permission.systemAdminGroups.view','View'),(1051,'reports.stats.finances.title','Statistics of finances...'),(1052,'memberImport.status.MISSING_EMAIL','Missing e-mail'),(1053,'posweb.client.pin','Client PIN'),(1054,'ad.title.categories','Browse by category'),(1055,'help.title.help_howto','Helps howto'),(1056,'menu.member.broker.registerMember','Register member'),(1057,'permission.systemCardTypes','Card Types'),(1058,'permission.adminMemberBulkActions.generateCard','Generate card'),(1059,'reports.stats.keydevelopments.throughTime.selectMonths','Select months and years'),(1060,'permission.brokerPos.assign','Assign'),(1061,'loanGroup.removeMemberConfirmation','Remove this member from the loan group?'),(1062,'creditLimit.normal','Lower'),(1063,'reports.transactions_report.transactions','{0}: {1} of {2} transactions'),(1064,'customField.size.DEFAULT','Default'),(1065,'customField.member.indexing.NONE','Do not include'),(1066,'transactionFee.allBrokerGroups','All broker groups'),(1067,'settings.access.poswebTimeout','PosWeb session timeout'),(1068,'settings.message.posPinBlocked','POS PIN blocked by invalid trials'),(1069,'reports.stats.activity.topten.grossProduct.title','Top ten of gross product per member'),(1070,'settings.mail.smtpPort','Port'),(1071,'global.add','Add'),(1072,'settings.mail.mailValidation','Public registration e-mail validation'),(1073,'scheduledPayment.transferNumber','{0} of {1}'),(1074,'alert.member.blockedPosUsed','Attempt to use blocked POS with id {0} from IP {1}'),(1075,'permission.adminMemberTransactionFeedbacks','Transaction feedbacks'),(1076,'createMember.newCaptcha','New code'),(1077,'profile.action.manageReferences','Manage references'),(1078,'guaranteeType.action.new','Create guarantee type'),(1079,'transactionFee.enabled','Enabled'),(1080,'permission.adminMemberInvoices.sendAsMemberToMember','Send as member to member'),(1081,'permission.systemMessageCategories.manage','Manage'),(1082,'permission.module.type.BASIC','Basic permissions of {0}'),(1083,'permission.adminMemberSmsMailings.freeSmsMailings','Send free mailings'),(1084,'brokerCommissionContract.accepted','The broker commission contract was accepted'),(1085,'translationMessage.import.confirmation','Are you sure to import keys from the selected file?'),(1086,'transferType.fields.action.new','Insert new custom field'),(1087,'customImage.system.checked','External payment: checked'),(1088,'theme.message.import','Import theme from a file'),(1089,'settings.log.transactionLevel.NORMAL','Normal'),(1090,'operator.group','Group'),(1091,'ad.tradeType.OFFER','Offer'),(1092,'global.quarter.FOURTH','Fourth quarter'),(1093,'transferType.transactionHierarchyVisibility.BROKER','To administrators and brokers'),(1094,'cardType.action.new','Insert new card type'),(1095,'posweb.searchTransactions.print','Click here or press F4 to print'),(1096,'cardType.title.insert','New card type'),(1097,'memberPos.allowMakePayment','Allow make payment'),(1098,'conversionSimulation.result.nofees','No fees found...'),(1099,'certification.status.CANCELLED','Canceled'),(1100,'group.settings.maxTransactionPasswordWrongTries','Max transaction password tries'),(1101,'virtualKeyboard.capsLock','Caps Lock'),(1102,'accountFeeLog.finishDate','Finished at'),(1103,'reports.stats.general.whatToShow','What to show?'),(1104,'customField.operator.visibility','Visibility to operator'),(1105,'alert.system.accountFeeRunning','Account fee {0} is running'),(1106,'profile.action.authorizedPayments','Authorized payments'),(1107,'reports.members.accounts.balances','Accounts balances'),(1108,'menu.admin.contentManagement.applicationPage','Application pages'),(1109,'menu.operator.logout','Logout'),(1110,'smsMailing.sent','The SMS mailing is now being sent'),(1111,'activities.rates.asFeePercentage','Resulting in present conversion fee of: '),(1112,'alert.member.GIVEN_VERY_BAD_REFS','Member gave too many \'very bad\' references'),(1113,'guarantee.buyerName','Buyer name'),(1114,'transferType.confirmationMessage','Confirmation message'),(1115,'payment.error.maxAmountOnDayExceeded','You have already exceeded the maximum amount today for transaction {0}.'),(1116,'receipt.transfer.scheduledFor','Scheduled for: {0}'),(1117,'receipt.posweb.transactions.member','{0}'),(1118,'reports.stats.keydevelopments.grossProduct.yAxis','Gross Product (units)'),(1119,'customField.payment.listAccess','Show in list results'),(1120,'permission.brokerDocuments.manageMember','Manage member individual documents'),(1121,'settings.local.transactionNumber.padLength','Identifier length'),(1122,'menu.admin.messages.smsMailings','SMS mailings'),(1123,'transactionPassword.title','Transaction password'),(1124,'group.customizedFiles.noResults','This group has no customized files'),(1125,'permission.adminMemberInvoices.denyAsMember','Deny invoice as member'),(1126,'payment.cancel.transactionPassword','In order to cancel this payment, you must supply your transaction password'),(1127,'activities.loans.amount','Total loan remaining amount'),(1128,'externalAccountHistory.button.toImportList','To import list'),(1129,'card.user.of','Cards of {0}'),(1130,'global.datePattern.minute','mm'),(1131,'permission.adminMemberBrokerings.viewLoans','View loan details in members list (print)'),(1132,'externalTransfer.lineNumber','Line number'),(1133,'settings.message.transactionFeedbackReply','Transaction feedback replied'),(1134,'accountFee.title.memberSearch','Members search'),(1135,'permission.adminMemberDocuments.details','View documents'),(1136,'authorizationLevel.authorizer.PAYER','Payer'),(1137,'mobile.home.availableBalance','Available: {0}'),(1138,'paymentObligation.next','Next'),(1139,'menu.admin.reports.current','State overview'),(1140,'externalAccountHistory.error.cannotMarkExternalTransferAsUnchecked','Only checked transfers can be marked as unchecked'),(1141,'generateCard.generateForMemberWithPendingCard','Generate for members with pending card?'),(1142,'menu.admin.contentManagement.systemImages','System Images'),(1143,'payment.status.FAILED','Failed'),(1144,'adImport.title.newCategories','New categories'),(1145,'customField.ad.searchVisibility.BASIC','Basic search'),(1146,'admin.lastLogin','Last login'),(1147,'paymentRequest.error.sending','The payment request could not be sent'),(1148,'permission.systemCustomImages.view','View'),(1149,'accountFeeLog.stillRunning','Still running...'),(1150,'smsMailing.type','Type'),(1151,'ticket.status.OK','Success'),(1152,'reports.stats.taxes.volume','Volume'),(1153,'accountFee.modified','The account fee was modified'),(1154,'changePassword.error.mustContainOnlyLettersOrNumbers','The login password only allows letters and number'),(1155,'permission.systemPayments','System payments'),(1156,'settings.local.datePattern','Date format'),(1157,'settings.local.maxThumbnailSize','Max. thumbnail size'),(1158,'menu.member.guarantees.searchCertifications','Certifications'),(1159,'paymentFilter.title','Payment filter'),(1160,'customField.title.insert.payment','New custom field for {0}'),(1161,'loanPayment.status.UNRECOVERABLE','Unrecoverable'),(1162,'accountFee.enabled','Enabled'),(1163,'permission.brokerAccounts.scheduledInformation','View scheduled payments'),(1164,'customizedFile.removed','The file is no longer customized'),(1165,'alert.system.RATE_INITIALIZATION_FAILED','Rate initialization job on currency {0} failed due to an encountered exception.'),(1166,'permission.brokerAccounts','Account'),(1167,'settings.log.webServiceLevel.OFF','Off'),(1168,'settings.access.modified','The access settings were modified'),(1169,'alert.system.INDEX_REBUILD_START','Search index rebuilding start'),(1170,'memberRecordType.description','Description'),(1171,'adCategory.name','Name'),(1172,'reports.stats.keydevelopments.numberOfAds.title','Developments in number of ads'),(1173,'permission.brokerMemberPayments.blockScheduledAsMember','Block scheduled payment as member'),(1174,'profile.action.disconnect','Disconnect logged user'),(1175,'receiptPrinterSettings.title.modify','Modify receipt printer settings'),(1176,'changePin.pinLengthRange','Choose a pin with a lenght between {0} and {1} characters'),(1177,'transactionFee.title.broker.insert','Insert broker commission'),(1178,'pos.unblockPos.confirmation','Activate the POS?'),(1179,'payment.error.sameAccount','The destination account must be different from the source account'),(1180,'group.settings.passwordPolicy.AVOID_OBVIOUS_LETTERS_NUMBERS_SPECIAL','Require letters, numbers and special'),(1181,'settings.mail.smtpUsername','Login name'),(1182,'permission.systemDocuments.view','View'),(1183,'loan.repaymentDays','Default repayment days'),(1184,'guarantee.allowLoanPayment','Allow loan payment'),(1185,'adCategory.parent','Parent'),(1186,'invoice.transferType','Payment type'),(1187,'reports.members_reports.transactions.accountTypesRequired','It\'s necessary to select at least one account type'),(1188,'accountHistory.period.begin','From date'),(1189,'customImage.system.mobileSplash_large','Mobile: large splash image'),(1190,'createMember.public.awaitingActivation','Thanks for registering!\n\nYour account has been created and needs\nto be activated by the administration.'),(1191,'reports.stats.keydevelopments.transactionAmount.highest.short','highest'),(1192,'loan.search.status','Filter'),(1193,'conversionSimulation.result.input.arate','Applied A-rate'),(1194,'changePassword.resetAndErrorSending','The password was reset, however, the mail could not be sent to member'),(1195,'profile.action.manageNotifications','Manage notifications'),(1196,'memberImport.status.INVALID_CUSTOM_FIELD','{0} is invalid: {1}'),(1197,'groupFilter.viewableBy','Viewable by'),(1198,'permission.brokerRemarks.view','View'),(1199,'reports.members_reports.account_type','Account type'),(1200,'alert.system.adminLoginBlockedByPermissionDenieds','The admin \'{0}\' login is temporarily blocked by exceeding the maximum amount of permission denied. The remote IP address is {2}'),(1201,'transferType.transferListenerClass','Invoke Java class'),(1202,'transferType.reserveTotalAmountOnScheduling','Reserve total amount on scheduled payments'),(1203,'loanGroup.description','Description'),(1204,'menu.admin.usersGroups.importMembers','Import members'),(1205,'reports.stats.keydevelopments.numberOfAds.active.short','active'),(1206,'externalAccount.modified','The external account was modified'),(1207,'paymentObligation.pack.details','You must select a payment obligation set that not exceed the maximun period'),(1208,'reports.stats.keydevelopments.throughTime.years','Through years'),(1209,'sms.type.INFO_TEXT','Info text'),(1210,'messageCategory.noMessageCategories','No message categories available!'),(1211,'createMember.public.awaitingMailValidation','Thanks for registering.\n\nIn order to validate the e-mail address you have entered, a mail is being sent to you, with instructions on how to proceed'),(1212,'global.send','Send'),(1213,'smsMailing.error.noMobilePhone','The selected member has no mobile phone'),(1214,'errors.maxLength','{0} cannot be greater than {1} characters'),(1215,'connectedUsers.remoteAddress','IP address'),(1216,'paymentObligation.seller','Seller'),(1217,'reports.members.references.received','Received references'),(1218,'global.month.SEPTEMBER','September'),(1219,'permission.operatorMessages','Messages'),(1220,'guaranteeType.error.invalidAuthorizedBy','Invalid authorizer for the selected model. Only Issuer or Both are accepted.'),(1221,'permission.adminMemberRecords.view','View'),(1222,'card.update.confirmation','Confirmation'),(1223,'menu.operator.member.transactionFeedbacks','Transaction feedbacks'),(1224,'global.print','Print'),(1225,'settings.mail.fromMail','From address'),(1226,'menu.operator.account.memberPayment','Member Payment'),(1227,'certificationLog.date','Date'),(1228,'smsMailing.type.PAID','Paid'),(1229,'transfer.ticket','Ticket'),(1230,'profile.admin.title.of','Admin profile of {0}'),(1231,'group.settings.passwordTries.deactivationTime.field','Deactivation time (unit) after max password tries'),(1232,'permission.brokerMemberAccess.resetPassword','Reset login password'),(1233,'authorizationLevel.authorizer.RECEIVER','Receiver'),(1234,'accountFee.action.new','Insert new account fee'),(1235,'guaranteeLog.date','Date'),(1236,'permission.operatorPayments.paymentToSelf','Self payments'),(1237,'permission.systemAdminPermissions.view','View'),(1238,'adImport.status.INVALID_PRICE','Invalid price: {0}'),(1239,'serviceOperation.ACCOUNT_DETAILS','Access account details'),(1240,'group.account.title','Group accounts'),(1241,'card.status.BLOCKED','Blocked'),(1242,'transfer.title.parent','Parent transaction details'),(1243,'externalAccountHistory.amountRange.begin','From amount'),(1244,'guaranteeType.disabled.tooltip','Guarantee type disabled'),(1245,'profile.admin.title.my','My admin profile'),(1246,'global.clear','Clear'),(1247,'changeGroup.new','New group'),(1248,'serviceClient.inserted','The web services client was inserted'),(1249,'profile.action.memberPos','Manage POS'),(1250,'global.pagination.single.page','{0} result(s)'),(1251,'menu.operator.account.memberInvoice','Member Invoice'),(1252,'customField.title.modify.operator','Modify operator custom field'),(1253,'theme.style.MOBILE','Mobile'),(1254,'settings.local.csv.valueSeparator','Value separator'),(1255,'activities.references.received','Received'),(1256,'reports.stats.general.submit','Show statistics'),(1257,'loan.repaymentDate','Repayment date'),(1258,'permission.adminMemberInvoices.acceptAsMember','Accept invoice as member'),(1259,'reference.level.select','Select value'),(1260,'message.rootType.ADMIN','Administration'),(1261,'infoText.removed','Infotext removed.'),(1262,'defaultBrokerCommission.noCustomizedByBroker','This commission was not customized by the broker yet and is subject to changes by administration'),(1263,'brokerCommissionContract.status.PENDING','Pending'),(1264,'settings.local.extra','Extra'),(1265,'permission.adminMemberLoans.view','View member loans'),(1266,'profile.member.hide','Hide'),(1267,'loan.status.IN_PROCESS','In Process'),(1268,'remark.comments','Comments'),(1269,'message.subject','Subject'),(1270,'mobile.payment.confirmation','Payment of {0} to {1}.{2}'),(1271,'customField.control.CHECKBOX','Check box'),(1272,'externalAccountHistory.period.begin','From date'),(1273,'permission.memberCards.unblock','Unblock'),(1274,'createAdmin.created','The administrator has been created'),(1275,'image.details.drag.hint','Drag images to set order, and fill in the caption on the fields'),(1276,'guaranteeType.fee.paidBy','Paid by '),(1277,'adminTasks.indexes.type.Operator','Operators'),(1278,'receipt.posweb.transactions.transfer','{0} {1} {2} {3}'),(1279,'reports.stats.finances.income.short','Income'),(1280,'transactionFee.when','When commission is paid'),(1281,'settings.neverDeleteMessage','0 never delete'),(1282,'menu.admin.accounts','Accounts'),(1283,'customField.memberRecord.brokerAccess','Broker access'),(1284,'changeGroup.member.changed.mailError','The member\'s group was changed, however, the activation mail could not be sent'),(1285,'element.search.keywords','Keywords'),(1286,'ad.view.categories','View categories'),(1287,'group.settings.defaultChannels','Default channels'),(1288,'group.settings.smsFree','Free SMS'),(1289,'reference.removeConfirmation','Remove reference?'),(1290,'global.params','Parameters'),(1291,'settings.imported','The settings were imported'),(1292,'ad.permanent','Not expirable'),(1293,'memberRecord.user','User'),(1294,'permission.memberCards','Cards'),(1295,'paymentFilter.title.insert','Insert payment filter for {0}'),(1296,'customizedFile.title.search.css','Customized style sheets'),(1297,'payment.denied','The payment has been denied'),(1298,'permission.operatorReferences','References'),(1299,'conversionSimulation.result.initialAmount','Amount to convert'),(1300,'certification.action.create','Create certification'),(1301,'reports.stats.keydevelopments.highestAmountPerTransaction.yAxis','Highest amount / trans.'),(1302,'card.cancelCard.confirmation','Cancel card?'),(1303,'guaranteeType.pendingGuaranteeExpiration.tooltip','Means the maximum time for an issuer/administrator to authorize a pending guarantee'),(1304,'permission.adminMemberMessages.sendToMember','Send to member'),(1305,'menu.member.broker','Brokering'),(1306,'global.min','Min.'),(1307,'memberImport.status.USERNAME_ALREADY_IN_USE','Username already in use: {0}'),(1308,'menu.admin.contentManagement.cssFiles','CSS Files'),(1309,'ticket.status','Status'),(1310,'activities.sinceActive','Member since'),(1311,'reports.members.ads.permanent_ads','Permanent ads'),(1312,'loanPayment.repaidAmount','Repaid'),(1313,'brokerCommissionContract.status.DENIED','Denied'),(1314,'accountFee.invoiceMode.ALWAYS','Always (do not automatically charge member)'),(1315,'settings.message.messageMailSuffixPlain','Plain text mail body suffix'),(1316,'memberPos.numberOfCopies','Number of receipts'),(1317,'accountType.title.modify.system','Modify system account type'),(1318,'menu.admin.settings.access','Access Settings'),(1319,'adImport.title.details.all','All imported advertisements'),(1320,'accountFee.chargeMode.BALANCE_PERCENTAGE','Positive balance percentage'),(1321,'reports.stats.activity.developments.title','Key developments in member activity'),(1322,'channel.credentials.LOGIN_PASSWORD','Login password'),(1323,'payment.confirmation.other.withAuthorization','This payment of {0} to {2} needs authorization and will stay in the pending status until it is authorized and processed.{3}\n\nPlease, click OK to confirm.'),(1324,'contactUs.title','Contact us'),(1325,'smsMailing.by','Sent by'),(1326,'settings.message.paymentReceived','Payment receiving'),(1327,'loan.repayment.repay','Repay'),(1328,'paymentFilter.showInReports','Show in reports'),(1329,'posweb.printSettings.title','Local print settings'),(1330,'loanGroup.member','Members'),(1331,'permission.adminMemberAccess.unblockPin','Unblock pin'),(1332,'menu.member.personal.cards','Cards'),(1333,'document.visibility.ADMIN','Administrators'),(1334,'reports.stats.keydevelopments.transactionAmount.median.short','Tx. amount'),(1335,'message.actionPerformed.RESTORE','The messages were restored'),(1336,'fileMapping.nature','Type'),(1337,'menu.admin.usersGroups.groupFilters','Group filters'),(1338,'help.title.loans','Loans'),(1339,'certification.amount','Amount'),(1340,'settings.local.adDescriptionFormat','Advertisement description format'),(1341,'customField.possibleValue.title.modify','Modify value'),(1342,'permission.memberAccount.simulateConversion','Simulate conversion'),(1343,'brokerCommission.stopConfirmation','Stopping this broker commission means to set it\'s value to 0 and close the broker contracts related to it. Are you sure?'),(1344,'customizedFile.action.customizeNew','Customize new file'),(1345,'about.version','<b>Application version:</b> {0}'),(1346,'permission.systemAdCategories.view','View'),(1347,'cardType.removed','The card type was removed'),(1348,'mobile.viewPayments.amount','Amount'),(1349,'defaultBrokerCommission.status.INACTIVE','Inactive'),(1350,'reports.members.presentation.list.result','Member lists result '),(1351,'memberImport.initialDebitTransferType','Payment type for negative balances'),(1352,'smsLog.type','Type'),(1353,'message.body','Body'),(1354,'message.actionPerformed.DELETE','The messages were removed'),(1355,'invoice.from','From'),(1356,'memberImport.title.import','Import members'),(1357,'changePassword.error.alreadyUsed','The given password was already used in past'),(1358,'alert.system.NEW_VERSION_OF_APPLICATION_PAGE','New version of application page'),(1359,'adCategory.active','Active'),(1360,'menu.admin.settings.adminTasks','System tasks'),(1361,'permission.adminMemberGroups.manageMemberCustomizedFiles','Manage customized files'),(1362,'customField.title.insert.operator','New operator custom field'),(1363,'messageCategory.action.new','Insert new message category'),(1364,'group.settings.maxAdPublicationTime.field','Max ad publication time (unit)'),(1365,'sms.type.GENERAL','General'),(1366,'transactionFee.removed','The transaction fee was removed '),(1367,'global.weekDay.TUESDAY','Tuesday'),(1368,'settings.local.csv.recordSeparator','Row break'),(1369,'invoice.accept.header.withAuthorization','You are about to accept an invoice and submit the following payment for further authorization:'),(1370,'payment.backToMemberProfile','To member profile'),(1371,'menu.member.account.selfPayment','Self Payment'),(1372,'adCategory.title.order.description','Drag the fields to change order'),(1373,'guaranteeType.title.modify','Modify guarantee type'),(1374,'permission.operatorPayments.poswebReceivePayment','Receive POSweb payment'),(1375,'permission.operatorMessages.sendToAdministration','Send to administration'),(1376,'manual.title.admin','Cyclos administration manual'),(1377,'errorLog.parameters','Parameters'),(1378,'serviceClient.action.new','New web services client'),(1379,'menu.admin.alerts.errorLog','Error log'),(1380,'group.title.settings.access','Access settings'),(1381,'permission.adminAdminRecords.manage','Manage'),(1382,'profile.action.invoiceFromSystem','Invoice system to member'),(1383,'loan.repayment.remainingAmount','Remaining'),(1384,'permission.systemCardTypes.manage','Manage card types'),(1385,'paymentObligation.description','Description'),(1386,'externalTransferImport.error.format.detailed','Error importing transactions: Invalid value on: \nLine: {0}\nColumn: {1}\nField: {2}\nValue: {3}'),(1387,'transactionPassword.status.user','Status'),(1388,'menu.admin.messages.infoTexts','Info texts'),(1389,'permission.systemAccounts.manage','Manage accounts'),(1390,'ad.removed','Advertisement removed'),(1391,'settings.local.sms','SMS'),(1392,'permission.adminMemberAccess.enableLogin','Reactivate disabled members (because of failed login attempts)'),(1393,'theme.author','Author'),(1394,'accountType.limitType.UNLIMITED','Unlimited'),(1395,'payment.confirmation.unblock','You are going to unblock this payment.\n\nPlease click OK to confirm'),(1396,'reports.stats.general.histogram','Histogram'),(1397,'permission.brokerMemberRecords.modify','Modify'),(1398,'brokerCommissionContract.removed','The broker commission contract was removed'),(1399,'pos.createAndAssign','The POS doesn\'t exists. Do you want create and assign it to the member? '),(1400,'adInterest.title.insert','New ad interest'),(1401,'errors.email','{0} is an invalid e-mail address'),(1402,'transferType.priority','Priority'),(1403,'rates.reinit.type','Type'),(1404,'permission.adminMembers','Members'),(1405,'guaranteeType.error.loanTransferType','Loan transaction type'),(1406,'reports.current.member_group_information','Member group information'),(1407,'memberRecord.title.search.member','Search {0} for {1}'),(1408,'transactionFee.aRateRelation.LINEAR','Linear'),(1409,'transferAuthorization.action.AUTHORIZE','Authorized'),(1410,'memberImport.group.select','Select a group for the imported members'),(1411,'profile.action.loanGroups','Loan groups'),(1412,'global.max','Max.'),(1413,'card.action.changeCardCode','Change security card code'),(1414,'posweb.target.username','Login (recipient)'),(1415,'settings.message.receivedInvoiceExpired','Received invoice expired'),(1416,'loan.error.noTransferType','There is no possible payment type to grant this loan'),(1417,'smsLog.type.SMS_OPERATION','SMS operation'),(1418,'smsMailing.member','Member'),(1419,'ad.search.tradeType.SEARCH','Wants'),(1420,'loanPayment.title.search','Search loan payments'),(1421,'accountFee.recurrence','Periodic'),(1422,'changePassword.passwordLength','Choose a password with {0} characters'),(1423,'settings.log.transactionFile','Transactions logfile path / name'),(1424,'accountFee.chargeMode.FIXED','Fixed amount'),(1425,'reports.nocheckboxes','You didn\'t select any checkboxes, so there is nothing to show!'),(1426,'permission.systemSettings','Settings'),(1427,'global.month.MAY','May'),(1428,'message.sendTo.ADMIN','Administration'),(1429,'group.settings','Edit settings'),(1430,'brokerCommissionContract.title.listByBroker','Commission contracts with {0}'),(1431,'externalTransferImport.period.end','To date'),(1432,'permission.systemExternalAccounts.checkPayment','Check payment'),(1433,'transactionFee.action.simple.new','Insert new transaction fee'),(1434,'menu.admin.help.manual','Manual'),(1435,'receipt.transfer.textAfter','----------------'),(1436,'member.email','E-Mail'),(1437,'permission.systemGroups.manageAdmin','Manage admin group'),(1438,'group.settings.maxAdPublicationTime.number','Max ad publication time (amount)'),(1439,'permission.brokerMemberAccess.changeChannelsAccess','Change channels access'),(1440,'permission.adminMemberReferences.manage','Manage'),(1441,'reference.direction.transactionFeedback.RECEIVED','Received feedbacks'),(1442,'menu.admin.reports','Reports'),(1443,'customField.payment.access.FROM_ACCOUNT','For the source account only'),(1444,'cardLog.status','Status'),(1445,'document.title.form','Parameters for {0}'),(1446,'payment.error.pendingProcess','The payment couldn\'t be performed as there are other payments from your account being processed now.\nPlease, try again later'),(1447,'invoice.payments','Payments'),(1448,'help.title.quickstart','Quick start'),(1449,'reference.summary.score','Score'),(1450,'profile.action.addContact','Add to contact list'),(1451,'channel.principals','User identification'),(1452,'settings.message.commissionContractAccepted','Commission contract accepted'),(1453,'transactionFee.title.simple.modify','Modify transaction fee'),(1454,'currency.title.modify','Modify currency'),(1455,'receipt.transfer.amount','Amount: {0}'),(1456,'reference.level.VERY_GOOD','Very good'),(1457,'posLog.date','Date'),(1458,'sms.type.PAYMENT.description','Direct payment'),(1459,'loanPayment.status.IN_PROCESS','In Process'),(1460,'permission.operatorAccount.accountInformation','View account information'),(1461,'loanGroup.title.of','Loan groups of {0}'),(1462,'settings.local.language.RUSSIAN','Russian'),(1463,'paymentFilter.name','Name'),(1464,'permission.systemInfoTexts','Info texts'),(1465,'errors.lessThan','{0} must be less than {1}'),(1466,'group.smsMessages','SMS allowed messages'),(1467,'loanGroup.memberRemoved','The member was removed from this loan group'),(1468,'global.today','Today'),(1469,'brokerCommissionContract.endDate','End date'),(1470,'certification.guaranteeType','Guarantee Type'),(1471,'paymentObligation.delete','Delete'),(1472,'translationMessage.action.new','Insert new key'),(1473,'transfer.chargeback','Charged back at'),(1474,'permission.systemRegistrationAgreements.manage','Manage'),(1475,'messageCategory.error.removing','The message category couldn\'t be removed becouse there are messages using it'),(1476,'reports.stats.Period','Period'),(1477,'permission.memberReports.showAccountInformation','Show account information'),(1478,'loanPayment.amount','Amount'),(1479,'customField.member.updateAccess','Editable by'),(1480,'brokerCommissionContract.title.modify','Modify broker commission contract'),(1481,'loanGroup.title.my','My loan groups'),(1482,'group.selectInitialGroup','Select when registering a member'),(1483,'smsMailing.sentSms','Messages sent'),(1484,'permission.adminMemberPayments.chargeback','Chargeback payment to member'),(1485,'transactionFee.maxAmount','Max. amount'),(1486,'permission.systemThemes.select','Set'),(1487,'activities.transactions.numberSell','Received - count'),(1488,'multiDropDown.multiItemsMessage','#items# items selected'),(1489,'createMember.registrationAgreementNotice','By clicking the button below you are accepting the registration agreement'),(1490,'reports.stats.keydevelopments.throughTime.MONTH','Each month'),(1491,'permission.adminMemberAccounts.creditLimit','Set credit limit'),(1492,'externalTransferType.inserted','The payment type was inserted'),(1493,'permission.brokerLoans','Loans'),(1494,'admin.creationDate','Registration date'),(1495,'menu.operator.member.ads','Advertisements'),(1496,'permission.operatorAccount','Member account'),(1497,'group.settings.viewLoansByGroup','View loans given to loan group'),(1498,'reports.stats.taxes.paid.notPaidLimit','Limit for \"not paid\"'),(1499,'changeGroup.admin.permanentlyRemoved','You cannot change the group because the administrator was permanently removed'),(1500,'creditLimit.current','Current'),(1501,'changeGroup.action.changeGroup','Change group'),(1502,'accountType.description','Description'),(1503,'account.dRate','D rate'),(1504,'externalTransfer.title.modify','Modify external transfer'),(1505,'activities.invoices.incoming.amount','Incoming amount'),(1506,'activities.transactions.averageSell','Received - average amount '),(1507,'loan.repayment.discard.loan','Discard loan'),(1508,'changePassword.title.of','Change login password of {0}'),(1509,'smsMailing.byBroker.all','Brokered members'),(1510,'invoice.totalAmount','Total amount'),(1511,'createMember.action.saveAndNew','Save and insert new member'),(1512,'permission.systemExternalAccounts.manage','Manage'),(1513,'member.search.noResults','No members were found'),(1514,'transferAuthorization.action.DENY','Denied'),(1515,'reports.stats.activity.throughTime.loginTimes','Logins per member '),(1516,'errorLog.title.details','Error details'),(1517,'settings.message.newPendingPaymentByReceiver','New payment for receiver to authorize'),(1518,'transactionFee.title.simple.list','Transaction fees'),(1519,'reports.stats.activity.whatToShow.COMPARE_PERIODS','Compare two periods'),(1520,'customField.control.MEMBER_AUTOCOMPLETE','Member autocomplete'),(1521,'group.customizedFiles.action.new','Customize new file'),(1522,'message.type.LOAN','Loan events'),(1523,'translationMessage.import.type.NEW_AND_MODIFIED','Import new and modified keys'),(1524,'payment.title.systemToMember','Payment system to member'),(1525,'reports.members_reports.outgoing','Outgoing'),(1526,'group.settings.passwordPolicy.AVOID_OBVIOUS_LETTERS_NUMBERS','Require letters and numbers'),(1527,'group.loginPageName','Login page name'),(1528,'changePassword.title.my','Change my login password'),(1529,'group.title.modify.operator','Edit operator group settings'),(1530,'group.isRemoved','Removed'),(1531,'translationMessage.title.insert','New translation key'),(1532,'invoice.error.noTransferType','There is no possible payment type.\nPlease, contact the administration.'),(1533,'memberImport.status.INVALID_CUSTOM_FIELD_VALUE_UNIQUE','{0} is invalid: {1} is not unique.'),(1534,'settings.local.csv.recordSeparator.LF','Unix (char 13)'),(1535,'transferType.feedbackReplyExpirationTime','Max feedback reply comments period'),(1536,'alert.system.RATE_INITIALIZATION_FINISHED','rate initialization job finished'),(1537,'card.expirationDate','Expiration date'),(1538,'reports.stats.general.allPaymentTypes','All payments'),(1539,'brokerCommissionContract.status.CANCELLED','Cancelled'),(1540,'adInterest.inserted','Ad interest inserted'),(1541,'payment.status.PROCESSED','Processed'),(1542,'invoice.cancelled','The invoice was cancelled'),(1543,'profile.action.paymentFromSystem','Payment system to member'),(1544,'settings.local.rootUrl','Application root URL'),(1545,'loan.repayment.error.partialInterestsAmount','The interests part of the loan payment must be repaid together.\nYou can either repay a partial amount up to {0} or the total remaining amount of {1}'),(1546,'reports.stats.finances.other','Other'),(1547,'accountHistory.finalBalance','Final balance'),(1548,'pos.createdAndAssigned','POS created and assigned to member {0}'),(1549,'group.invalidNature','Invalid group type'),(1550,'profile.action.simulateConversion','Simulate conversion'),(1551,'global.range.from','From'),(1552,'permission.adminMemberPayments.paymentAsMemberToSystem','Member to system payment'),(1553,'settings.message.body','Body'),(1554,'global.nothingSelected','Nothing selected'),(1555,'menu.admin.customFields.adminFields','Admin Fields'),(1556,'pos.actions.assign','Assign'),(1557,'menu.admin.contentManagement.translation','Application Translation'),(1558,'fileMapping.numberFormat.FIXED_POSITION','Fixed position'),(1559,'createMember.public.awaitingPassword','Thanks for registering!\n\nYour shall receive the password shortly by e-mail'),(1560,'serviceOperation.DO_PAYMENT','Perform payments'),(1561,'payment.confirmation.transactionPassword','In order to confirm this payment, you must supply your transaction password'),(1562,'customImage.system.save','Export as CSV icon'),(1563,'reports.current.invoices.SYSTEM_OUTGOING.count','Number of outgoing system invoices'),(1564,'transactionFee.subject.DESTINATION_BROKER','Broker of member receiving (destination)'),(1565,'message.html','HTML format'),(1566,'settings.message.adminMemberAlert','Member alerts'),(1567,'connectedUsers.title','Connected users'),(1568,'message.from','From'),(1569,'permission.systemGroupFilters.view','View'),(1570,'permission.brokerPos.unblockPin','Unblock PIN'),(1571,'settings.local.language.FRENCH','French'),(1572,'adCategory.title.import','Import advertisement categories'),(1573,'translationMessage.message','Value'),(1574,'ad.removeConfirmation','Remove advertisement?'),(1575,'alert.system.errorProcessingAccountStatus','Critical error processing account status. Payment details: at: {0}, from {1}, to {2}, amount {3}'),(1576,'loan.confirmation.header','You are about to grant the following loan:'),(1577,'global.weekDay.short.SUNDAY','Sun'),(1578,'errors.notAllowed','{0}'),(1579,'reports.stats.groupOfGroups','Group filter'),(1580,'memberImport.status.INVALID_RECORD_TYPE_FIELD','Invalid field on record type {0}: {1}'),(1581,'accountFee.title.modify','Modify account fee'),(1582,'memberRecord.title.insert','Insert {0} for {1}'),(1583,'activities.transactions.last30Days','Transactions last 30 days'),(1584,'fieldMapping.field.MEMBER_USERNAME','Username'),(1585,'createMember.title.public','Member registration'),(1586,'translationMessage.title.export','Export to properties file'),(1587,'reports.stats.finances.ThroughTime.income.title','Income through time'),(1588,'menu.member.broker.defaultBrokerCommissions','Commission settings'),(1589,'loan.grantDate','Grant'),(1590,'memberRecordType.label','Label (plural)'),(1591,'externalTransferImport.error.importing.invalidMemberUsername','Invalid member username: {0}'),(1592,'currency.action.new','New currency'),(1593,'permission.adminMemberReports.amounts','Show amounts'),(1594,'guarantee.model','Model'),(1595,'reports.stats.activity.singlePeriod.grossProduct','Gross Product per member'),(1596,'reports.simulations.aRate.config.graph.title','A-rate configuration curve'),(1597,'permission.brokerMemberRecords.create','Create'),(1598,'changeGroup.operator.title','Change group for operator {0}'),(1599,'reports.transactions_report.incoming','incoming'),(1600,'permission.adminMembers.view','View'),(1601,'home.status.hasPendingCommissionContracts','There are pending commission contracts. You won\'t be able to perform payments while they are pending'),(1602,'transactionPassword.title.manage','Manage transaction password of {0}'),(1603,'memberPos.resultPageSize','Result page size'),(1604,'guaranteeType.paymentObligationPeriod.tooltip','Window time between the newest and the oldest payment obligation'),(1605,'paymentObligation.removeConfirmation','Remove payment obligation?'),(1606,'guaranteeType.feePayers.BUYER','Buyer'),(1607,'permission.memberReports','Member reports'),(1608,'customField.title.order.memberRecord','Set custom field order for member record type {0}'),(1609,'authorizationLevel.authorizer.ADMIN','Admin'),(1610,'settings.import.confirmation','Are you sure to import the settings from the selected file?'),(1611,'mobile.payment.title.do','Do Payment'),(1612,'ticket.status.OK_PENDING','Success / Pending'),(1613,'customField.title.order.admin','Set administrator custom field order'),(1614,'profile.action.transactionFeedbacks','Transaction feedbacks'),(1615,'permission.adminMemberPayments.payment','System to Member payment'),(1616,'conversionSimulation.result.input.date','Applied conversion date'),(1617,'group.settings.smsChargeAmount','Additional SMS amount'),(1618,'menu.operator.member','Member Operations'),(1619,'profile.action.listBrokerCommissionContracts','Commission contracts'),(1620,'invoice.action.goToPayment','View payment details'),(1621,'changeGroup.member.confirmPermanentRemove','Remove member permanently?'),(1622,'group.settings.smsContextClassName','Custom SMS context class name'),(1623,'message.messageBox','Message box'),(1624,'customImage.system.mobileSplash_small','Mobile: small splash image'),(1625,'externalTransferImport.error.importing.invalidMemberField','Invalid member custom field value ({0}): {1}'),(1626,'reports.members_reports.details_level.TRANSACTIONS','Transactions'),(1627,'loanPayment.summary.total','Total'),(1628,'error.image.dimension','The image dimensions are too big.'),(1629,'currency.rates','Available rates for this currency'),(1630,'paymentObligation.cancel','Cancel'),(1631,'reports.stats.keydevelopments.numberOfAds.expired','Expired ads'),(1632,'menu.operator.guarantees.searchGuarantees','Guarantees'),(1633,'loan.type','Loan type'),(1634,'menu.operator.guarantees.searchPaymentObligations','Payment Obligations'),(1635,'reports.simulations.aRateConfigSimulation.transactionFee','TransactionFee (for default values)'),(1636,'settings.message.adminPendingGuarantee','Guarantee awaiting authorization'),(1637,'settings.local.csv.recordSeparator.CR','Macintosh (char 10)'),(1638,'createMember.initialGroup.title','Group selection'),(1639,'groupFilter.showInProfile','Show in profile'),(1640,'permission.adminMemberGroups.manageAccountSettings','Manage account settings'),(1641,'transfer.from','From'),(1642,'settings.title.translations.file','Import / export notifications and e-mails translations'),(1643,'settings.message.externalChannelPaymentRequestExpiredReceiver','External channel payment request expired receiver'),(1644,'customField.memberRecord.brokerAccess.NONE','None'),(1645,'loan.grant.error.upperCreditLimit','The loan cannot be grant because it would make the member account to have a balance beyond it\'s upper credit limit'),(1646,'payment.title.systemMemberToSystem','Payment from member {0} to system'),(1647,'image.noPicture.caption','No picture'),(1648,'externalTransferImport.period.begin','From date'),(1649,'document.formPage','Form page'),(1650,'memberRecordType.fields.action.new','Insert new custom field'),(1651,'brokerCommissionContract.title.view','Broker commission contract details'),(1652,'customizedFile.newContents','New contents'),(1653,'group.settings.defaultAdPublicationTime.field','Default ad publication time (unit)'),(1654,'pendingMember.title.profile','Pending member details'),(1655,'reports.stats.activity.topten.login.col1','Logins'),(1656,'alert.title','Title'),(1657,'card.activateWarning.confirmation','Warning: any other active card will be canceled. '),(1658,'reports.stats.finances.singlePeriod.overview.yAxis','Amount'),(1659,'loan.setExpiredStatus','Mark this loan as \'{0}\''),(1660,'login.form.text','If you are a registered member, you can login with your username and password below.'),(1661,'certification.issuer','Issuer'),(1662,'settings.local.language.CZECH','Czech'),(1663,'guaranteeType.transferType.select','Select transaction type'),(1664,'customField.memberRecord.showInList','Show in list'),(1665,'permission.operatorPayments.blockScheduled','Block scheduled payment'),(1666,'profile.member.title.of','Profile of {0}'),(1667,'help.title.ads_interest','Ads Interest'),(1668,'certificationLog.by','Changed by'),(1669,'menu.admin.contentManagement.customImages','Custom Images'),(1670,'customImage.system.active','Active icon'),(1671,'global.yes','Yes'),(1672,'pendingMember.title.print','Pending member search results'),(1673,'customImage.system.pay','Pay icon'),(1674,'profile.action.manageBrokerCommissions','Commissions settings'),(1675,'operator.noGroup','In order to create a new operator, you must first create at least one operator group'),(1676,'sms.type.HELP_ERROR','Help error'),(1677,'accountHistory.tooltip.viewGrouped','View group'),(1678,'pos.blocked','POS has been blocked'),(1679,'memberRecordType.layout.FLAT','Tiled'),(1680,'customImage.system.permissions','Permissions icon'),(1681,'loan.status.PENDING_AUTHORIZATION','Pending authorization'),(1682,'reference.direction.transactionFeedback.GIVEN','Given feedbacks'),(1683,'changePassword.currentPassword','Current login password'),(1684,'receiptPrinterSettings.helpMessage','Make sure to read the help file and <a href=\"{0}\">Cyclos Wiki</a> before adding a new printer.'),(1685,'permission.brokerDocuments','Documents'),(1686,'notificationPreferences.disableSms.confirmation','You are about to disable all SMS notifications and operations.\n\nAre you sure?'),(1687,'menu.admin.customFields.memberFields','Member Fields'),(1688,'guarantee.status','Status'),(1689,'profile.member.title.my','My profile'),(1690,'permission.operatorLoans','Loans'),(1691,'profile.action.accountsAction','Accounts'),(1692,'translationMessage.import.type.NEW_AND_EMPTY','Import new and empty keys only'),(1693,'certification.removed','The Certification was removed'),(1694,'loanPayment.status.RECOVERED','Recovered'),(1695,'menu.operator.account.transfersAuthorizations','Search authorizations'),(1696,'guaranteeType.authorizedBy.ADMIN','Admin'),(1697,'permission.adminMemberInvoices.send','Send invoice from profile'),(1698,'currency.removed','The currency was removed'),(1699,'currency.enableIRate','Enable I-rate'),(1700,'permission.brokerMemberPayments.authorize','Authorize'),(1701,'paymentObligation.logs','Payment obligation logs'),(1702,'selectChannels.channels','Channels'),(1703,'guarantee.removed','The guarantee was removed'),(1704,'settings.access.externalPaymentPassword.TRANSACTION_PASSWORD','Transaction password'),(1705,'infoText.empty.subject','No text defined for empty message.'),(1706,'externalTransferProcess.paymentDescription','{0}, of {1}'),(1707,'smsMailing.mailingType.INDIVIDUAL','Individual SMS'),(1708,'notificationPreferences.costPerMessage','The cost per message is {0}'),(1709,'memberPos.assign.memberWithoutAccount','The member doesn\'t have an account.'),(1710,'admin.email','E-Mail'),(1711,'alert.member.RECEIVED_VERY_BAD_REFS','Member received too many \'very bad\' references'),(1712,'member.title.bulkActions.filter','Member filter for bulk actions'),(1713,'receipt.posweb.transactions.header','{0} transactions'),(1714,'loanPayment.status.OPEN','Open'),(1715,'reports.stats.keydevelopments.throughTime.months.title','Developments through the time'),(1716,'menu.admin.contentManagement.documents','Documents'),(1717,'externalTransferType.modified','The payment type was modified'),(1718,'settings.message.admin.title','Administrator notifications'),(1719,'permission.brokerPos.changeParameters','Change parameters'),(1720,'fieldMapping.field.MEMBER_CUSTOM_FIELD','Member custom field'),(1721,'transactionPassword.reset','The transaction password was reset.\nThe user is now allowed to generate his transaction password'),(1722,'reference.transactionFeedback.saved','The transaction feedback was saved'),(1723,'reports.simulations.aRate.config.graph.xAxis','A-rate (days)'),(1724,'reference.title.details.transactionFeedback','Transaction feedback details'),(1725,'permission.memberCards.changeCardSecurityCode','Change code'),(1726,'permission.systemLoanGroups.manage','Manage'),(1727,'memberPos.status.ACTIVE','Active'),(1728,'settings.alert.alertNewPendingMembers','New pending activation members'),(1729,'permission.brokerPos.manage','Manage'),(1730,'changePassword.resetAndSend.confirmation','Are you sure to reset the member\'s password?'),(1731,'reference.inserted','Reference inserted'),(1732,'permission.memberAccount.authorizedInformation','View authorized payments'),(1733,'permission.memberCards.view','View'),(1734,'customField.possibleValue.removed','The value was removed'),(1735,'card.actions','Actions'),(1736,'memberImport.status','Status'),(1737,'help.title.account_history','Account History'),(1738,'menu.member.account.loanGroups','Loan groups'),(1739,'settings.type.MESSAGE','Notifications'),(1740,'permission.adminMemberLoans','Loans'),(1741,'permission.adminMemberBrokerings.changeBroker','Change broker'),(1742,'brokering.list.noResults','No registered members for the given filter'),(1743,'externalAccount.systemAccount','System account'),(1744,'group.settings.passwordExpiresAfter.field','Login password expires after (unit)'),(1745,'channel.action.new','Insert a new channel'),(1746,'mailPreferences.applicationErrors','Application errors'),(1747,'message.warning.messageNotReceivedByEmail','The message was sent internally, but not by e-mail'),(1748,'customField.title.modify.admin','Modify administrator custom field'),(1749,'alert.removeSelected.confirm','Remove selected alerts?'),(1750,'theme.import.error.reading','Error importing theme. The file is invalid.'),(1751,'conversionSimulation.result.percentage','Fee Percentage'),(1752,'permission.adminMemberGroups.view','View'),(1753,'createMember.passwordConfirmation','Confirm password'),(1754,'paymentObligation.conceal','Unpublish'),(1755,'reports.members.ads.expired','Expired'),(1756,'settings.log.maxFilesPerLog','Max. files per log'),(1757,'settings.local.cyclosId','Identification for external channels'),(1758,'pos.action.unassign','Unassign'),(1759,'fileMapping.negativeAmountValue','Negative character'),(1760,'externalAccountHistory.action.confirmDelete','Are you sure to permanently remove the external transfers?'),(1761,'adCategory.insertMultiple','You may enter several categories, one per line'),(1762,'loan.expirationFeeRepaymentType','Expiry fee repayment type'),(1763,'fileMapping.title','File Mapping'),(1764,'customField.member.indexing','Include in keywords search'),(1765,'settings.access.passwordLength','Password length'),(1766,'smsMailing.broker.all','My brokered members'),(1767,'permission.systemCurrencies','Currencies'),(1768,'accountFee.invoiceMode.NEVER','Never (may make member accounts go negative)'),(1769,'permission.systemAlerts','Alerts'),(1770,'global.timePeriod.HOURS','Hour(s)'),(1771,'posweb.client.name','Client name'),(1772,'rates.error.initializationAlreadyRunning','You tried to start a rate initialization job while there is already one running.'),(1773,'adInterest.adFields','Match the following ad fields'),(1774,'errors.numeric','Numeric errors'),(1775,'adImport.title.summary','Advertisement import summary'),(1776,'payment.status.PENDING','Pending authorization'),(1777,'reference.replyComments','Reply comments'),(1778,'guarantee.error.changeStatus','Can\'t change the guarantee\'s status to: {0}'),(1779,'alert.system.NEW_VERSION_OF_STATIC_FILE','New version of static file'),(1780,'account.isDefault','Is default'),(1781,'registrationAgreement.title.modify','Modify registration agreement'),(1782,'accountFee.day','Day'),(1783,'transactionFee.receiver','Will receive'),(1784,'scheduledPayments.totalRemaining','Total remaining'),(1785,'permission.systemGuaranteeTypes.manage','Manage'),(1786,'accountFeeLog.period','Period'),(1787,'loan.status','Filter'),(1788,'login.action.loginAsMember','Login as member'),(1789,'profile.action.transferAuthorizations','View payment authorizations'),(1790,'menu.member.personal.pos.memberPos','POS devices'),(1791,'customImage.system.calendar','Calendar icon'),(1792,'externalTransfer.date','Date'),(1793,'message.fromTo','From / To'),(1794,'reports.transactions_report.number','Number'),(1795,'reports.transactions_report.member_invoices','{0} of {1} member to members invoices'),(1796,'mailPreferences.newMembers','New registered members'),(1797,'createMember.error.registrationAgreementCheck','In order to continue, you must agree with the presented registration agreement'),(1798,'invoice.search.period.begin','Begin date'),(1799,'alert.system.ACCOUNT_FEE_RUNNING','Account fee running'),(1800,'brokerCommissionContract.error.contractNotFound','The commission contract could not be found. It\'s probably been removed.'),(1801,'customField.action.newPossibleValue','New possible value'),(1802,'paymentObligation.title.new','New payment obligation'),(1803,'currency.dRate.initDate','Initialization date for D-rate'),(1804,'posweb.title.receivePayment','Receive payment'),(1805,'transferType.allowCancelScheduledPayments','Allow payer to cancel scheduled payments'),(1806,'reports.stats.keydevelopments.throughTime','All selected items through time'),(1807,'global.month.JUNE','June'),(1808,'help.title.statistics','Statistics'),(1809,'permission.systemAdCategories.manage','Manage'),(1810,'changePassword.expired','Your password has expired.\nIn order to continue, you must change it.'),(1811,'reports.stats.keydevelopments.grossProduct.title','Developments in Gross Product (= sum of transaction amounts)'),(1812,'permission.memberAccount.scheduledInformation','View scheduled payments'),(1813,'reports.members.show_btn','Show report'),(1814,'permission.adminMemberMessages.manage','Manage'),(1815,'settings.local.language.SPANISH','Spanish'),(1816,'ticket.status.FAILED','Failed'),(1817,'fileMapping.noFileMapping.message','There is no file mapping for this account yet.\nClick here to configure it'),(1818,'permission.systemGroupFilters.manage','Manage'),(1819,'group.error.passwordPolicySpecialVirtualKeyboard','{0} cannot be set to require special characters because virtual keyboard is used for the login password'),(1820,'fieldMapping.orderModified','Field mappings order modified'),(1821,'externalTransferType.code','Code'),(1822,'adCategory.removeConfirmation','Remove category?'),(1823,'loan.member','Member name'),(1824,'about.title','About'),(1825,'transferType.title.insert','Insert transaction type'),(1826,'card.securityCode','Security code'),(1827,'adminTasks.indexes.type.Administrator','Administrators'),(1828,'manual.action.top','Top'),(1829,'paymentObligation.status.REJECTED','Rejected'),(1830,'group.registrationAgreement.forceAccept','Force accept on next login'),(1831,'activities.brokering.commission.amount','Total commission'),(1832,'channel.internalNameAlreadyInUse','The internal name is already in use'),(1833,'reports.stats.systemAccountFilter','System Account'),(1834,'reports.stats.keydevelopments.grossProduct','Gross Product'),(1835,'transfer.dRate','D-rate'),(1836,'global.system','System'),(1837,'global.month.JULY','July'),(1838,'errors.javaClass','{0} should be a valid java class name assignable to {1}'),(1839,'menu.member.help.manual','Manual'),(1840,'help.title.references','References'),(1841,'ad.category','Category'),(1842,'ticket.status.CANCELLED','Cancelled'),(1843,'adImport.confirm','Import'),(1844,'reports.simulations.choose','Choose Simulation'),(1845,'customizedFile.select.name','Select file'),(1846,'brokerCommission.notCharging','This commission type is not been charged'),(1847,'alert.member.transactionPasswordBlockedByTries','The transaction password was blocked by exceeding maximum amount of tries'),(1848,'transactionPassword.block.confirmMessage','Are you sure to block the member\'s transaction password? '),(1849,'settings.local.csv.valueSeparator.SEMICOLON','Semicolon'),(1850,'profile.action.advertisementsActions','Advertisements'),(1851,'activities.references','References'),(1852,'permission.module.type.ADMIN_ADMIN','Administrator administration permissions of {0}'),(1853,'groupFilter.removed','Group filter removed'),(1854,'accountFeeLog.count','Number'),(1855,'settings.message.accountFeeReceived','Account fee receiving'),(1856,'adCategory.path','Path'),(1857,'settings.message.scheduledPaymentProcessed','Scheduled payment successfully processed'),(1858,'profile.action.viewDocuments','Member documents'),(1859,'messageCategory.all','All categories'),(1860,'paymentObligation.title.searchPaymentObligations','Search payment obligations'),(1861,'message.sendTo.BROKERED_MEMBERS','My brokered members'),(1862,'reports.stats.period.periodMain','Main Period'),(1863,'payment.confirmation.self.withAuthorization','This payment of {0} from {1} to {2} needs authorization and will stay in the pending status until it is authorized and processed.{3}\n\nPlease, click OK to confirm.'),(1864,'group.copySettingsFrom','Copy settings from'),(1865,'accountFee.action.recharge','Recharge'),(1866,'reports.stats.keydevelopments.grossProduct.allTransactions.short','All'),(1867,'currency.aRate.initValue','Initialization value A-rate'),(1868,'message.type.REFERENCE','Received reference'),(1869,'settings.local.language.JAPANESE','Japanese'),(1870,'externalAccountHistory.amountRange.end','To amount'),(1871,'rates.reinit.warning','Note that reinitializing a rate is a process that can take hours. The application will be put offline if you start a rate initialization.'),(1872,'memberImport.successfulMembers','Successful members'),(1873,'reports.stats.keydevelopments.throughTime.months.xAxis','Months'),(1874,'posweb.client.any','Client'),(1875,'customField.type.DECIMAL','Decimal number'),(1876,'authorizationLevel.error.lowerLevelAmount','This level\'s amount cannot be lower than the previous one'),(1877,'settings.message.externalChannelPaymentPerformed','External channel payment performed'),(1878,'reports.simulations.aRateConfigSimulation.transferType','Transfertype (for default values)'),(1879,'member.bulkActions.changeGroup','Change group'),(1880,'groupFilter.customizedFiles.title.modify','Modify customized file for {0}'),(1881,'mailPreferences.payments','Payments'),(1882,'customImage.system.quickAccess_placeAd','Quick access: place ad'),(1883,'global.tooltip.help','Help'),(1884,'activities.transactions.total','Total of all transactions'),(1885,'account.creditLimit','Lower credit limit'),(1886,'scheduledPayment.date','Date'),(1887,'ad.price.unspecified','Unspecified'),(1888,'menu.admin.settings','Settings'),(1889,'accountFee.error.removing','This account fee cannot be removed because it was already charged'),(1890,'ticket.toChannel','Confirm channel'),(1891,'payment.awaitingAuthorization','Payment has been been submitted for authorization.\nIt will stay in the pending status until it is authorized and processed'),(1892,'permission.adminMemberBulkActions','Bulk actions'),(1893,'transferType.title.list','Transaction types'),(1894,'menu.admin.accessDevices.pos.search','Search POS'),(1895,'message.action.MARK_AS_READ','Mark as read'),(1896,'contact.error.alreadyExists','The given member is already in your contact list'),(1897,'certification.details','Details'),(1898,'transfer.amount','Amount'),(1899,'permission.systemPayments.cancelScheduled','Cancel scheduled payment'),(1900,'transferType.transactionHierarchyVisibility.MEMBER','To all users'),(1901,'settings.alert.modified','Alert settings modified'),(1902,'reports.current.member_account_information','Member accounts'),(1903,'transferType.maxAmountPerDay','Max amount per day'),(1904,'invoice.action.cancel','Cancel'),(1905,'sms.type.INFO_TEXT.description','Info text'),(1906,'reports.stats.activity.comparePeriods.numberTransactions','Number of Transactions per member'),(1907,'transfer.paymentEvery','Payment every'),(1908,'guaranteeType.feeType.VARIABLE_ACCORDING_TO_TIME','Annual %'),(1909,'sms.type.INFO_TEXT_ERROR.description','Info text error'),(1910,'fieldMapping.field.NEGATE_AMOUNT','Negative amount indicator'),(1911,'menu.admin.accounts.invoices','Manage Invoices'),(1912,'theme.title.export','Export current settings as theme'),(1913,'group.account.inserted','The group account was inserted'),(1914,'pos.removed','The POS was removed'),(1915,'ad.externalPublication','External publication'),(1916,'theme.styles','Styles in this theme'),(1917,'loan.repayment.error.enoughCredits','The account doesn\'t have enough credits to repay this loan'),(1918,'loan.expirationDate','Expiry'),(1919,'reports.stats.keydevelopments.numberOfMembers.numberOfDisappearedMembers','Number of disappeared members'),(1920,'settings.log.accountFeeLevel.STATUS','Status changes and errors'),(1921,'customField.control','Field type'),(1922,'menu.member.guarantees.searchGuarantees','Guarantees'),(1923,'permission.memberProfile.view','View'),(1924,'sms.type.ACCOUNT_DETAILS_ERROR','Account details error'),(1925,'memberImport.status.INVALID_BALANCE','Initial balance is invalid: {0}'),(1926,'accountHistory.conciliation.all','All'),(1927,'permission.systemCustomFields.manage','Manage'),(1928,'customField.member.visibilityAccess','Show in profile for'),(1929,'settings.local.maxUploadSize','Max. upload size'),(1930,'adInterest.type.SEARCH','Want'),(1931,'operator.title.search','Operators search'),(1932,'transactionPassword.error.permissionDenied','You don\'t have enough permissions to generate the transaction password'),(1933,'alert.date','Date'),(1934,'loan.openTransfer','Show the related payment'),(1935,'customField.payment.type','Type'),(1936,'changePin.error.invalidPassword','Incorrect password'),(1937,'permission.systemAlerts.manageSystemAlerts','Manage system alerts'),(1938,'global.weekDay.short.FRIDAY','Fri'),(1939,'permission.memberSms','SMS logs'),(1940,'permission.adminMemberAds.manage','Manage'),(1941,'permission.brokerReports','Reports'),(1942,'message.action.reply','Reply'),(1943,'customField.member.access.ADMIN','Administrator'),(1944,'permission.memberGuarantees.buyWithPaymentObligations','Buy with payment obligations from'),(1945,'message.rootType.all','All'),(1946,'guaranteeType.transferTypes','Transaction types'),(1947,'loan.setExpiredStatus.confirmation','Are you sure to change this loan\'s status?'),(1948,'brokerCommission.type','Type'),(1949,'loan.paymentDate','Payment'),(1950,'settings.log.accountFeeLevel.ERRORS','Errors only'),(1951,'customField.payment.enabled','Enabled'),(1952,'customField.removed','The custom field was removed'),(1953,'menu.operator.account.invoices','Invoices'),(1954,'reference.modified','Reference modified'),(1955,'settings.local.decimalInputMethod.RTL','Right to left (only numbers are typed)'),(1956,'member.bulkActions.generateCard.confirmation','Are you sure to generate cards to all members matching the filter?'),(1957,'adImport.status.UNKNOWN_ERROR','Unknown error'),(1958,'externalTransferType.removed','The payment type was removed'),(1959,'category.status.ACTIVE','Active'),(1960,'mobile.home.balance','Balance: {0}'),(1961,'reports.members_reports.details_level.SUMMARY','Summary'),(1962,'loan.monthlyInterest','Monthly interest'),(1963,'menu.admin.guarantees','Guarantees'),(1964,'payment.confirmation.self','You are going to transfer {0} from {1} to {2}.{3}\n\nPlease, click OK to confirm.'),(1965,'adImport.successfulAds','Successful advertisements'),(1966,'card.creationDate','Creation date'),(1967,'guarantee.issuerName','Issuer name'),(1968,'permission.brokerMembers.manageContracts','Manage commission contracts'),(1969,'group.removeConfirmation','Remove this group?'),(1970,'reports.stats.activity.topten.grossProduct','Gross Product'),(1971,'global.confirm','Confirm'),(1972,'menu.member.personal.messages','Messages'),(1973,'alert.member.PIN_BLOCKED_BY_TRIES','Pin blocked by invalid tries'),(1974,'reports.stats.keydevelopments.highestAmountPerTransaction.title','Developments in highest amount per transaction'),(1975,'alert.member.receivedVeryBadRefs','The member has received {0} very bad references'),(1976,'customizedFile.type.STATIC_FILE','Static'),(1977,'customImage.system.quickAccess_makePayment','Quick access: make payment'),(1978,'settings.local.timeZone','Time zone'),(1979,'alert.system.ADMIN_TRANSACTION_PASSWORD_BLOCKED_BY_TRIES','Admin transaction password blocked by tries'),(1980,'pin.error.blocked','Your PIN has been temporarily blocked, as you have exceeded the max tries'),(1981,'menu.admin.customFields.adFields','Ad Fields'),(1982,'pendingMember.removeConfirmation','Are you sure to remove this pending registration?\n\nPending registrations are automatically removed after {0}'),(1983,'certification.issuerUsername','Issuer login'),(1984,'permission.adminMembers.register','Register'),(1985,'errorLog.search.date.begin','Begin date'),(1986,'customField.possibleValue.enabled','Enabled'),(1987,'registrationAgreement.removeConfirmation','Are you sure to remove this registration agreement?'),(1988,'transactionFee.removeConfirmation','Remove this transaction fee? '),(1989,'theme.select.confirmationMessage','You are about to select a theme\nThis may overrite customizations on CSS files, or style sheet images.\nAre you sure?'),(1990,'webshop.payment.credentialsText','In order to confirm this payment, enter your username and {0} below and select Submit'),(1991,'reports.stats.general.graph','Graph'),(1992,'pendingMember.validationKey','Validation code'),(1993,'global.cancel','Cancel'),(1994,'menu.admin.contentManagement','Content Management'),(1995,'permission.brokerCards','Cards'),(1996,'serviceOperation.RECEIVE_PAYMENT','Receive payments'),(1997,'permission.operatorPayments.paymentToMember','Member payments'),(1998,'permission.adminMemberReferences.view','View'),(1999,'smsMailing.title.search','SMS mailings'),(2000,'certification.buyerName','Buyer name'),(2001,'loanPayment.status.DISCARDED','Externally repaid'),(2002,'reports.transactions_report.debits','debits'),(2003,'brokerCommissionContract.cancelConfirmation','Cancel this broker commission contract?'),(2004,'payment.invalid.paymentDates','The payment dates should be sorted and must be scheduled for future dates'),(2005,'mobile.home.title','Cyclos Home'),(2006,'menu.member.personal.manageExternalAccess','External access'),(2007,'reports.stats.keydevelopments.numberOfAds.expired.short','expired'),(2008,'global.timePeriod.YEARS','Year(s)'),(2009,'theme.version','Version'),(2010,'receipt.transfer.status','Status: {0}'),(2011,'reports.stats.activity.throughTime.numberTransactions.yAxis','n transactions'),(2012,'reports.members.accounts.upper_credits','Upper credit limits'),(2013,'settings.message.maxTransactionPasswordTries','Maximum transaction password attempts exceeded'),(2014,'reports.current.member_account','Member accounts'),(2015,'loanGroup.title.search','Search loan groups'),(2016,'guarantee.error.invalidGuarantee','The total fees amount must be less than the guarantee amount.'),(2017,'messageCategory.inserted','The message category was inserted'),(2018,'permission.adminMemberAccounts.simulateConversion','Simulate conversion'),(2019,'accountFee.removeConfirmation','Remove this account fee?'),(2020,'settings.action.EXPORT','Export'),(2021,'permission.adminMemberPayments.paymentAsMemberToSelf','Member self payment'),(2022,'permission.systemTranslation.view','View'),(2023,'permission.operatorContacts.view','View'),(2024,'permission.adminMemberInvoices.manage','Manage member invoices'),(2025,'permission.adminMemberGuarantees.viewCertifications','View certifications'),(2026,'receiptPrinterSettings.name','Display name'),(2027,'settings.local.identification','Cyclos instance identification'),(2028,'reference.comments','Comments'),(2029,'group.defaultAcceptPaidMailing','Accept paid mailings by default'),(2030,'accountType.removeConfirmation','Remove this account, as well as the transaction types?'),(2031,'ad.title','Title'),(2032,'group.registrationAgreement.none','Not used'),(2033,'settings.local.sms.enable','Enable'),(2034,'transactionFee.description','Description'),(2035,'permission.operatorPayments.poswebMakePayment','Make POSweb payment'),(2036,'serviceClient.modified','The web services client was modified'),(2037,'alert.member.expiredLoan','Expired loan'),(2038,'message.type.ACCOUNT','General account events'),(2039,'menu.admin.alerts.errorLogHistory','Error history'),(2040,'menu.admin.settings.file','Import / Export'),(2041,'references.removeConfirmation','Remove this reference?'),(2042,'account.defaultCreditLimit','Lower credit limit'),(2043,'defaultBrokerCommission.updated','Commission settings updated'),(2044,'profile.modified.emailPending','The profile has been modified, but a confirmation e-mail has been sent to {0} in order to confirm the new e-mail address'),(2045,'changePassword.error.mustIncludeLettersNumbersSpecial','The password must be composed of letters, numbers and special characters'),(2046,'guaranteeType.title.listGuaranteeTypes','Guarantee types'),(2047,'invoice.invalid.schedulingDate','The invoice scheduling date must be before {0}'),(2048,'settings.access.title','Access settings'),(2049,'profile.action.payment','Make payment'),(2050,'payment.recipientUsername','Login (recipient)'),(2051,'permission.memberOperators.manage','Manage operators'),(2052,'loanGroup.errorRemoving','The loan group could not be removed.\nMake sure it has no loans in order to remove it.'),(2053,'customizedFile.newContentsNotification','There is a new (original) version of this customized file. Review it\'s content and check \"resolve conflicts\" before saving.'),(2054,'reports.stats.general.members','Members'),(2055,'help.title.operators','Operators'),(2056,'permission.operatorPayments.ticket','Generate external payment tickets'),(2057,'scheduledPayments.totalAmount','Total amount'),(2058,'transfer.calculatePayments','Calculate'),(2059,'permission.adminAdminAccess.transactionPassword','Manage transaction password'),(2060,'createAdmin.action.saveAndNew','Save and insert new administrator'),(2061,'settings.local.chargebacks','Chargebacks'),(2062,'scheduledPayments.totalPaid','Total paid'),(2063,'profile.action.manageLoginPassword','Manage login password'),(2064,'permission.brokerPos','POS'),(2065,'global.selectNone','Select none'),(2066,'permission.systemReports.current','State report'),(2067,'permission.brokerMemberPayments.paymentAsMemberToSystem','Payment as member to system'),(2068,'permission.adminMemberAccounts','Accounts'),(2069,'menu.member.personal.transactionFeedbacks','Feedback transactions'),(2070,'channel.title.insert','New channel'),(2071,'transactionPassword.NOT_USED','Not used'),(2072,'alert.removed','The selected alert(s) have been removed'),(2073,'permission.adminMemberBulkActions.changeGroup','Change group'),(2074,'permission.systemAccounts.view','View account management'),(2075,'guaranteeType.expireTodayMessage','0 means must expire in the same day'),(2076,'permission.adminMemberPayments.paymentWithDate','Member payment in past date'),(2077,'accountFee.error.mustRechargeOldestLogFirst','This fee execution cannot be recharged because there is an older execution which also failed.\n\nPlease, recharge the older one first.'),(2078,'manual.title.member','Cyclos manual'),(2079,'translationMessage.inserted','The translation key has been inserted'),(2080,'permission.brokerInvoices.denyAsMember','Deny as member'),(2081,'permission.operatorReports.view','View others reports'),(2082,'loan.repayment.transactionPassword.discardOnly','In order to discard this loan payment, you must supply your transaction password'),(2083,'loanGroup.title.modify','Modify loan group'),(2084,'externalAccount.tooltip.import','Transaction file imports'),(2085,'mobile.home.viewPayments','View Payments'),(2086,'customImage.system.icon','Shortcut icon'),(2087,'pendingMember.removed','The pending registration was removed'),(2088,'webshop.confirm.text','Please, check the data above and click the submit button below to confirm the payment'),(2089,'global.search','Search'),(2090,'adImport.invalidFormat','Invalid file format'),(2091,'changePin.error.sameAsLoginOrTransactionPassword','The pin cannot be the same as login or transaction password'),(2092,'loan.queryStatus.CLOSED','Closed / repaid'),(2093,'error.sendingMail','There was an error while sending a mail to {0}'),(2094,'profile.action.manageExternalAccess','External access'),(2095,'groupFilter.inserted','Group filter inserted'),(2096,'serviceOperation.ACCESS','Access informations'),(2097,'loan.repaidAmount','Repaid amount'),(2098,'settings.message.messageMailSuffixHtml','HTML mail body suffix'),(2099,'externalTransferType.title.list','Payment type'),(2100,'invoice.status.EXPIRED','Expired'),(2101,'theme.error.notSelected','No theme selected'),(2102,'group.account.action.new','Associate new account'),(2103,'customField.size','Field size'),(2104,'changeGroup.error.remove.activeMember','An active member cannot be removed.\nTry to move it to a REMOVED group'),(2105,'reports.stats.keydevelopments.numberOfMembers.yAxis','Number'),(2106,'serviceClient.credentialsRequired','Credentials required'),(2107,'permission.basic','Basic'),(2108,'externalTransferImport.error.importing','There was an error while importing the transaction file'),(2109,'reports.members.references.given','Given references'),(2110,'reports.stats.accountFeeFilters','Account Fees'),(2111,'reports.stats.activity.developments.numberOfTransactions','Number of transactions'),(2112,'alert.system.NEW_VERSION_OF_HELP_FILE','New version of help file'),(2113,'general.error.indexedRecordNotFound','A record which had been indexed no longer exists.\n\nPlease, ask the administration to recreate the search indexes '),(2114,'accountFee.disabled','Disabled'),(2115,'permission.systemRegistrationAgreements.view','View'),(2116,'adInterest.removeOne.confirm','Remove ad interest?'),(2117,'permission.systemSettings.file','Export / import to file'),(2118,'fileMapping.decimalSeparator','Decimal separator'),(2119,'message.category.choose','Please, choose a category'),(2120,'memberRecordType.layout','Search results layout'),(2121,'guaranteeType.creditFee.readonly','Read only'),(2122,'errors.unique','{0} is not unique'),(2123,'menu.admin.accounts.systemPayment','System Payment'),(2124,'group.initialGroupShow','Show as'),(2125,'createMember.password','Password'),(2126,'transferType.enabled','Enabled'),(2127,'payment.chargeback.transactionPassword','In order to chargeback this payment, you must supply your transaction password '),(2128,'global.close','Close'),(2129,'menu.admin.settings.log','Log Settings'),(2130,'smsMailing.mailingType.PAID_TO_GROUP','Paid mailing to group'),(2131,'transactionFee.error.removing','The transaction fee could not be removed because it was already charged'),(2132,'payment.action.chargeback','Chargeback'),(2133,'operator.lastLogin','Last login'),(2134,'permission.brokerMessages.view','View'),(2135,'permission.systemGroups.manageMember','Manage member group'),(2136,'reports.stats.keydevelopments.grossProduct.allTransactions','For all transactions'),(2137,'customField.possibleValue.value','Value'),(2138,'reports.members_reports.details_level','Details level'),(2139,'profile.action.references','View & give references'),(2140,'guaranteeType.enabled.tooltip','Guarantee type enabled'),(2141,'message.title.search','Message list'),(2142,'conversionSimulation.date','Conversion date'),(2143,'message.to','To'),(2144,'transferType.availability','Availibility'),(2145,'smsMailing.stillSending','Still sending...'),(2146,'alert.member.givenVeryBadRefs','The member has given {0} very bad references'),(2147,'guarantee.status.REJECTED','Rejected'),(2148,'invoice.accepted.withAuthorization','The invoice was accepted, but the payment still needs authorization to be processed'),(2149,'member.broker','Broker'),(2150,'menu.admin.usersGroups','Users & Groups'),(2151,'reports.stats.general.transferType.chooseOne','Choose one transfer type'),(2152,'adImport.status.SUCCESS','Success'),(2153,'alert.system.negativeVirtualRatedBalance','A negative virtual rated balance has been encountered on system account {0}.\nThe virtual rated balance has been set to 0, but the cause for this error should be checked.'),(2154,'permission.systemInvoices','Invoices'),(2155,'document.visibility','Visibility'),(2156,'pos.error.removing','The POS could not be removed because it belongs to a member\n or has a log associated'),(2157,'notificationPreferences.selectAll','All'),(2158,'externalAccountHistory.error.cannotMarkExternalTransferAsChecked','Only valid pending transfers can be marked as checked'),(2159,'customField.title.list.member','Member custom fields'),(2160,'menu.admin.ads.categories.file','Import / export categories'),(2161,'accountFee.runMode','Run mode'),(2162,'messageCategory.title.modify','Modify message category'),(2163,'global.timePeriod.WEEKS','Week(s)'),(2164,'translationMessage.title.importExport','Import / export translation keys'),(2165,'adImport.totalAds','Total advertisements'),(2166,'invoice.amount','Amount'),(2167,'guaranteeLog.by','Changed by'),(2168,'customField.member.memberCanHide','Member can hide'),(2169,'paymentObligation.usedAmount','Used amount'),(2170,'member.groupFilters','Groups'),(2171,'notificationPreferences.paidSmsLeft','You have {0} paid SMS messages left (expire at {1})'),(2172,'menu.admin.alerts','Alerts'),(2173,'activities.ads','Products & services'),(2174,'certification.removeConfirmation','Remove Certification?'),(2175,'login.username','Account ID'),(2176,'settings.local.memberResultDisplay.NAME','Member name'),(2177,'ad.maxPicturesMessage','This advertisement already have the maximum allowed pictures'),(2178,'customField.memberRecord.showInSearch','Show in search'),(2179,'settings.access.virtualKeyboardTransactionPassword','Virtual keyboard for transaction password'),(2180,'profile.userAllowedToLogin','User is now allowed to login'),(2181,'conversionSimulation.transferType','Transfer type'),(2182,'settings.local.language.ENGLISH','English'),(2183,'menu.member.logout','Logout'),(2184,'customField.orderModified','The field order was modified'),(2185,'global.weekDay.SUNDAY','Sunday'),(2186,'customImage.title.new.custom','New custom image'),(2187,'paymentFilter.transferTypes','Transaction types'),(2188,'externalAccount.name','Name'),(2189,'externalTransferType.removeConfirmation','Remove payment type?'),(2190,'settings.message.commissionContractDenied','Commission contract denied'),(2191,'permission.adminAdmins.remove','Remove'),(2192,'permission.memberPayments','Payments'),(2193,'payment.authorized','The payment has been authorized'),(2194,'payment.title.confirm','Transaction confirmation'),(2195,'loan.queryStatus.AUTHORIZATION_DENIED','Authorization denied'),(2196,'alert.system.rateInitializationFinished','Rate initialization job on currency {0} finished for the following rates:\n{1}'),(2197,'permission.module.type.OPERATOR','Operator permissions of {0}'),(2198,'permission.memberDocuments','Documents'),(2199,'menu.operator.member.activities','Reports'),(2200,'transfer.paymentCount','Payment count'),(2201,'reports.stats.general.table','Table'),(2202,'quickAccess.searchAds','Search ads'),(2203,'menu.admin.ads.categories','Manage Categories'),(2204,'menu.admin.settings.message','Message Settings'),(2205,'error.rateParameters.creationExpirationSmallerThanEmission','Creation Value of D-rate must be greater than creation value of A-rate.'),(2206,'posLog.status','Status'),(2207,'reports.members_reports.transactions.transactionModeRequired','It\'s necessary to select debit or credit transactions'),(2208,'currency.symbol','Symbol'),(2209,'image.details.error','The image details could not be saved'),(2210,'message.action.RESTORE','Restore'),(2211,'invoice.date','Date'),(2212,'adCategory.title.modify','Modify advertisement category'),(2213,'loan.title.search','Search loans'),(2214,'reports.stats.chooseStatistics','Please choose reports to be shown'),(2215,'guarantee.title.guaranteeDetails','Guarantee details'),(2216,'changeBroker.changed','The broker was changed'),(2217,'memberImport.lineNumber','Line #'),(2218,'group.title.modify.member','Edit member group settings'),(2219,'permission.memberPreferences.manageReceiptPrinterSettings','Manage receipt printers'),(2220,'message.type.AD_INTEREST','Ad interests notifications'),(2221,'reports.stats.finances.ThroughTime.income','Income'),(2222,'reports.members.ads.active','Active'),(2223,'changePin.error.invalidTransactionPassword','Incorrect transaction password'),(2224,'externalTransferType.action.CONCILIATE_PAYMENT','Conciliate payment'),(2225,'channel.credentials.CARD_SECURITY_CODE','Card security code'),(2226,'permission.adminMemberPos.assign','Assign'),(2227,'conversionSimulation.result.graph.yAxis','Fee amount'),(2228,'customField.control.TEXT','Text box'),(2229,'reports.stats.activity.developments','Developments '),(2230,'permission.adminMemberReports','Activities report'),(2231,'channel.enableSMSLinkTo','notifications'),(2232,'adImport.status.INVALID_COLUMN','Invalid column: {0}'),(2233,'invoice.status.DENIED','Denied'),(2234,'transfer.channel','Payment through'),(2235,'mobile.viewPayments.related','User'),(2236,'memberImport.status.INVALID_UPPER_CREDIT_LIMIT','Invalid upper credit limit: {0}'),(2237,'guaranteeType.issueFee.readonly','Read only'),(2238,'reports.stats.taxes.paid.both','Both'),(2239,'paymentObligation.status.EXPIRED','Expired'),(2240,'message.error.memberCannotReceive','The message could not be sent because the member chose not to receive messages'),(2241,'settings.local.memberSortOrder','Sort order for member result lists'),(2242,'adCategory.imported','The categories were successfully imported'),(2243,'settings.message.adminNewMember','New member registration'),(2244,'permission.memberMessages.manage','Manage'),(2245,'group.customizedFiles.customized','The file is now customized for this group'),(2246,'adminTasks.indexes.status.CORRUPT','Corrupt'),(2247,'permission.systemReports.smsLogs','Sent SMS messages'),(2248,'registrationAgreement.title.accept','Registration agreement'),(2249,'changeGroup.admin.permanentlyRemovedMessage','The administrator has been permanently removed'),(2250,'transactionFee.fromGroups','From groups'),(2251,'reports.stats.activity.comparePeriods.grossProduct.yAxis','Gross Product'),(2252,'settings.message.title.edit','Edit notification'),(2253,'group.account.title.modify','Modify account settings for group {0}'),(2254,'customImage.system.message_unread','Unread message icon'),(2255,'createMember.initialGroup.preface.byBroker','Please, choose the group for the new member'),(2256,'permission.adminMemberCards','Cards'),(2257,'reports.stats.activity.topten.numberTransactions.title','Top ten of number of transactions per number'),(2258,'changeGroup.member.expired','Registration on group has expired'),(2259,'reports.members.accounts.credits','Lower credit limits'),(2260,'settings.local.memberSortOrder.ALPHABETICAL','Alphabetical'),(2261,'permission.adminMemberInvoices.acceptAsMemberFromSystem','Accept invoice from system as member'),(2262,'infoText.errorRemoving','The info text could not be removed'),(2263,'memberImport.file','CSV file'),(2264,'reports.stats.finances.balance','Balance'),(2265,'guaranteeType.registerGuarantee','Register guarantee'),(2266,'messageCategory.modified','The message category was modified'),(2267,'customField.parent','Parent field'),(2268,'brokerCommission.inserted','The broker commission was inserted '),(2269,'customImage.system.view','View icon'),(2270,'transactionFee.toGroups','To groups'),(2271,'infotext.active','Active'),(2272,'permission.memberMessages.sendToMember','Send to member'),(2273,'ticket.date','Date'),(2274,'document.visibility.MEMBER','Member'),(2275,'permission.adminAdminRecords.delete','Delete'),(2276,'global.title.results','Results'),(2277,'adminTasks.indexes.status.MISSING','Missing'),(2278,'externalTransferProcess.title','Process payments on {0}'),(2279,'sms.error.type.NO_SMS_LEFT','No messages left'),(2280,'transfer.submitDate','Submitted at'),(2281,'memberRecordType.title.list','Member record types'),(2282,'cardLog.date','Date'),(2283,'brokerCommissionContract.action.remove','Remove'),(2284,'reports.stats.general.selectMulti','Select one or more'),(2285,'transactionPassword.action.block','Block transaction password'),(2286,'groupFilter.customizedFiles.title.new','Customize new file for {0}'),(2287,'menu.admin.accessDevices.cardType.manage','Manage card types'),(2288,'permission.systemGroupFilters','Group filters'),(2289,'customField.type.STRING','String'),(2290,'settings.local.csv.useHeader','Show header'),(2291,'permission.systemStatus.viewConnectedOperators','View connected operators'),(2292,'permission.memberDocuments.view','View'),(2293,'accountType.action.new','Insert new account'),(2294,'guaranteeType.loanTransferType','Loan'),(2295,'customField.title.modify.payment','Modify custom field for {0}'),(2296,'account.defaultUpperCreditLimit','Upper credit limit'),(2297,'authorizationLevel.error.maxLevel','It\'s not possible to insert more than {0} authorization levels'),(2298,'changeGroup.member.permanentlyRemovedMessage','The member has been permanently removed'),(2299,'permission.operatorLoans.repay','Repay'),(2300,'reports.stats.keydevelopments.averageAmountPerTransaction.yAxis','Average amount / trans.'),(2301,'customField.control.RICH_EDITOR','Rich text editor'),(2302,'reports.stats.finances.overview','Overview'),(2303,'theme.theme','Theme'),(2304,'reports.members.print_btn','Print report'),(2305,'transferAuthorization.by','Performed by'),(2306,'adInterest.modified','Ad interest modified'),(2307,'group.settings.smsAdditionalCharged','Additional charged SMS package'),(2308,'customImage.system.quickAccess_contacts','Quick access: contacts'),(2309,'memberImport.accountType','Account type'),(2310,'conversionSimulation.aRate.targeted','Targeted A rate'),(2311,'brokerCommissionContract.startDate.to','To'),(2312,'memberImport.processed','The members were successfuly imported'),(2313,'reports.transactions_report.credits','credits'),(2314,'member.bulkActions.changeBroker.confirmation','Are you sure to change the broker of all members matching the filters?'),(2315,'mobile.payment.error.maxAmountPerDay.at','You have already reached the maximum amount at {1}'),(2316,'guaranteeType.error.removing','Error removing guarantee type. Should be exist a guarantee or certification using this one.'),(2317,'ad.print.since','Published since'),(2318,'reports.stats.general.period','Period'),(2319,'menu.admin.usersGroups.admins','Manage Admins'),(2320,'menu.member.broker.brokerCommissionContracts','Commission contracts'),(2321,'reports.stats.finances.singlePeriod.overview.title','Overview System account'),(2322,'accountType.title.new','New account'),(2323,'permission.operatorLoans.view','View'),(2324,'login.registration.title','Don\'t have a login name yet?'),(2325,'payment.status.BLOCKED','Blocked'),(2326,'error.accessDenied','Access Denied'),(2327,'manual.title.stats','Cyclos statistics manual'),(2328,'adminTasks.indexes.title','Manage indexes'),(2329,'transferType.invalidDestinationType','The currency of the destination account type can not be diferent from the currency of the source account type'),(2330,'customField.title.insert.ad','New advertisement custom field'),(2331,'settings.message.expiredGuarantee','Expired guarantee'),(2332,'reports.stats.general.nodata','Too little data (or no data at all) avaialble for this item. '),(2333,'changeBroker.suspendCommission','Suspend commission '),(2334,'settings.mailTranslation.modified','The mail translation was modified'),(2335,'adImport.file','CSV file'),(2336,'permission.adminMemberGuarantees.cancelCertificationsAsMember','Cancel certifications'),(2337,'loanPayment.summary.paymentsToReceive','Payments to receive'),(2338,'reports.stats.activity.title','Statistics of activities...'),(2339,'posweb.action.searchTransactions','Transactions'),(2340,'brokering.status.ACTIVE','Active'),(2341,'guarantee.validity','Validity'),(2342,'posLog.assignTo','Assign to'),(2343,'permission.systemChannels','Channels'),(2344,'invoice.cancelConfirmationMessage','Cancel outgoing invoice to {0} of {1}?\n\nPlease click OK to confirm.'),(2345,'errors.pageNotFound','The page you tried to access was not found'),(2346,'guarantee.issueFee','Issue fee'),(2347,'errorLog.path','Path'),(2348,'disconnect.error.notConnected','The user is no longer connected'),(2349,'reports.stats.keydevelopments.throughTime.months','Through months'),(2350,'reports.stats.activity.comparePeriods.loginTimes.yAxis','Logins / member'),(2351,'permission.adminAdminRecords','Administrator records'),(2352,'posLog.title','POS Log'),(2353,'customField.payment.access.TO_ACCOUNT','For the destination account only'),(2354,'menu.admin.reports.simulations','Simulations'),(2355,'guaranteeType.fee.value','Value'),(2356,'profile.action.message','Send message'),(2357,'reports.members_reports.member_groups','Member groups'),(2358,'loan.totalAmount','Total amount'),(2359,'transfer.commision.broker.notcommision','There are no commisions'),(2360,'registrationAgreement.contents','Contents'),(2361,'reports.stats.keydevelopments.throughTime.selectYears','Select years'),(2362,'loan.repayment.amountToRepaid','Amount'),(2363,'permission.systemServiceClients.manage','Manage'),(2364,'transferType.requiresAuthorization','Requires authorization'),(2365,'loan.group.personal','Personal'),(2366,'permission.adminMemberGuarantees.viewGuarantees','View guarantees'),(2367,'changePin.newPin','New pin'),(2368,'reference.from','From'),(2369,'customField.member.indexing.MEMBERS_ONLY','Members only'),(2370,'permission.systemReports.dRateConfigSimulation','D-rate configuration simulation'),(2371,'reports.current.invoices','Invoices'),(2372,'defaultBrokerCommission.validity.always','Always'),(2373,'loan.queryStatus.PENDING_AUTHORIZATION','Pending authorization'),(2374,'message.date','Date'),(2375,'reports.members.date.empty','Date and time must be informed'),(2376,'settings.log.modified','The log settings were modified'),(2377,'posweb.error.channelDisabled','The given member cannot access the posweb channel'),(2378,'accountFeeLog.neverRan','Never ran'),(2379,'currency.name','Name'),(2380,'paymentObligation.status.CANCELED','Canceled'),(2381,'customImage.error.wrongType','{0} must be of type {1}'),(2382,'error.iRateParameters.notOffLine','The I-rate has not been enabled, because the system must be set off-line,\n as this may be a heavy task on big databases.\n\n You can set the system off-line via the menu: settings > system tasks.'),(2383,'loan.firstExpirationDate','First expiry date'),(2384,'mailPreferences.systemAlert','System alerts'),(2385,'permission.adminMemberPayments','Member payments'),(2386,'createMember.public.errorSendingMail','Sorry, but there was an error while sending the e-mail to validate the account.\n\nPlease, try again later.'),(2387,'profile.action.invoices','View invoices'),(2388,'settings.message.cardSecurityCodeBlocked','Card security code blocked by invalid trials'),(2389,'menu.admin.usersGroups.pendingMembers','Pending members'),(2390,'transferType.removed','The transaction type was removed'),(2391,'adInterest.removed','Ad interest removed'),(2392,'guaranteeType.removed','The guarantee type was removed '),(2393,'profile.pendingEmailLastSent','Last e-mail sent at {0}'),(2394,'member.search.allGroupFilters','All group filters'),(2395,'category.order.alpha','Sort by alphabetical order'),(2396,'reports.current.n_schedads','Number of scheduled advertisements'),(2397,'card.action.unblock','Unblock'),(2398,'createMember.assignPassword','Assign password'),(2399,'help.title.content_management','Content Management'),(2400,'mobile.payment.amount','Amount'),(2401,'createMember.created','The member has been created'),(2402,'alert.system.nullIRate','I-rate had unexpected null for account {0}. You may want to reinitialize the i-rate.'),(2403,'member.bulkActions.error.emptyQuery','You should select at least one filter'),(2404,'theme.title.select','Theme selection'),(2405,'adCategory.children','Child categories'),(2406,'pos.status','Status'),(2407,'externalTransferImport.chooseFile','Transaction file'),(2408,'adInterest.type','Type'),(2409,'member.bulkActions.generateCard','Generate card'),(2410,'permission.memberReferences.view','View'),(2411,'alert.system.adminTransactionPasswordBlockedByTries','The transaction password of admin \'{0}\' is now blocked by exceeding maximum amount of tries ({1}). The remote IP address is {2}'),(2412,'smsMailing.mailingType.FREE_TO_GROUP','Free mailing to group'),(2413,'paymentObligation.buyerUsername','Buyer login'),(2414,'authorizationLevel.inserted','Authorization level inserted'),(2415,'memberImport.status.INVALID_USERNAME','Login name is invalid: {0}'),(2416,'error.loggedOut','You have been logged out from the system.'),(2417,'account.iRate','I rate'),(2418,'memberImport.initialCreditTransferType','Payment type for positive balances'),(2419,'scheduledPayments.searchType.OUTGOING','Outgoing'),(2420,'group.settings.pinBlockTimeAfterMaxTries','Pin block time after max tries'),(2421,'settings.log.scheduledTaskLevel.ERRORS','Errors only'),(2422,'permission.brokerMembers.changeEmail','Change e-mail'),(2423,'transactionFee.fInfinite','Value at infinite asymptote'),(2424,'customField.title.order.loanGroup','Set loan group custom field order'),(2425,'permission.adminMemberLoans.repayWithDate','Repay loan in past date'),(2426,'receiptPrinterSettings.new','Insert new'),(2427,'sms.type.REQUEST_PAYMENT.description','Request payment'),(2428,'connectedUsers.nature.select','Please, select user type'),(2429,'permission.memberInvoices.sendToMember','Send to member'),(2430,'customField.possibleValue.title.insert','Insert value'),(2431,'certification.status','Status'),(2432,'settings.action','Action'),(2433,'memberImport.initialDebitTransferType.empty','Ignore negative balances'),(2434,'member.generateCard.confirmation','Generate a card for {0}?'),(2435,'externalTransferType.action.GENERATE_MEMBER_PAYMENT','Generate payment to member'),(2436,'document.removed','The document was removed'),(2437,'session.loggedAs','Logged user: {0}'),(2438,'card.changeCardCode.confirmation','Change security card code?'),(2439,'payment.error.transferMinimum','The amount to transfer is less than the allowed minimum ({0}).'),(2440,'payment.chargedBack','The payment was charged back'),(2441,'guarantee.buyerUsername','Buyer login'),(2442,'customImage.system.mobileSplash_medium','Mobile: medium splash image'),(2443,'settings.access.generatedUsernameLength','Generated login length'),(2444,'certification.usedAmount','Used amount'),(2445,'menu.member.guarantees','Guarantees'),(2446,'payment.error.ratesRequiresLocksOnAllAccounts','With rates enabled, all accounts need to be locked.\nContact the organization in order to correctly set the needed cyclos properties for this. '),(2447,'settings.message.brokeringRemoved','Brokering manually removed'),(2448,'brokerCommission.action.unsuspend','Unsuspend'),(2449,'smsMailing.mailingType.FREE_FROM_BROKER','Free from broker'),(2450,'transfer.date','Date'),(2451,'card.status.securityCodeBlocked','Card security code is blocked'),(2452,'adImport.status.MISSING_TITLE','Missing title'),(2453,'guarantee.starts','Starts'),(2454,'memberRecordType.removeConfirmation','Remove this member record type?'),(2455,'errorLog.loggedUser','Logged user'),(2456,'posweb.target.name','Name (recipient)'),(2457,'settings.message.brokerRemovedRemarkComments','Broker removed remark'),(2458,'smsMailing.sendType.group','To group'),(2459,'memberRecord.search.noResults','No {0} were found'),(2460,'reference.action.remove','Remove'),(2461,'card.blocked','Card blocked'),(2462,'permission.brokerInvoices.sendAsMemberToSystem','Send as member to system'),(2463,'adImport.title.details.success','Advertisements successfully imported'),(2464,'receiptPrinterSettings.localPrinter','Print on this computer using'),(2465,'accountFee.chargeMode.NEGATIVE_BALANCE_PERCENTAGE','Negative balance percentage'),(2466,'adminTasks.indexes.status.ACTIVE','Active'),(2467,'customImage.title.custom','Custom images'),(2468,'accountFee.firstPeriodAfter','Enabled since'),(2469,'card.expirationPeriod.from','Expire from'),(2470,'memberRecordType.showMenuItem','Show menu item'),(2471,'transactionFee.chargeType.MIXED_A_D_RATES','Mixed A and D rates'),(2472,'permission.systemDocuments.manage','Manage'),(2473,'ad.title.of','Advertisements of {0}'),(2474,'transferType.loanParameters','Loan parameters'),(2475,'reports.stats.general.perMember','per member'),(2476,'accountType.limitType.LIMITED','Limited'),(2477,'loan.group.members','Members in group'),(2478,'changeGroup.operator.permanentlyRemovedMessage','The operator has been permanently removed'),(2479,'home.admin.status.systemUptime','Application uptime'),(2480,'alert.member.EXPIRED_LOAN','Expired loan'),(2481,'alert.system.maxIncorrectLoginAttempts','Maximum login attempts ({0}) with incorrect username reached from IP {1}'),(2482,'accountFee.freeBase','Free base'),(2483,'ad.title.my','My advertisements'),(2484,'fileMapping.columnSeparator','Column separator'),(2485,'brokerCommissionContract.search.noResults','No contracts were found'),(2486,'accountOverview.title.system','System accounts'),(2487,'externalTransferProcess.loanDescription','#{0}, at {1}, of {2}'),(2488,'infoText.nomatch.subject','No match for message with key: {0}.'),(2489,'profile.operator.title.of','Profile of {0}'),(2490,'global.weekDay.short.MONDAY','Mon'),(2491,'message.type.CERTIFICATION','Certifications'),(2492,'loanGroup.title.addMember','Add {0} to loan group'),(2493,'reports.transactions_report.system_to_member_invoices','{0} of system to member invoices: {1}'),(2494,'member.lastLogin','Last login'),(2495,'menu.operator.account.accountInformation','Account Information'),(2496,'group.rootUrl','Application root URL'),(2497,'accountFeeLog.fee','Account fee'),(2498,'permission.adminMemberGuarantees.acceptGuaranteesAsMember','Accept guarantees'),(2499,'reports.stats.activity.histogram.logins','Histogram of logins per member'),(2500,'transferAuthorization.authorizerAdmin','Authorizer'),(2501,'transfer.totalAmount','Total amount'),(2502,'reports.stats.activity.throughTime.numberTransactions','Number of Transactions per member'),(2503,'transfer.firstPaymentDate','First payment date'),(2504,'account.transactionPasswordRequired','Require transaction password'),(2505,'payment.title.memberToMember','Payment to member'),(2506,'transactionFee.whichBroker.DESTINATION','Receiving member\'s broker'),(2507,'account.status.ACTIVE','Active'),(2508,'reports.stats.general.graph.selectAll','Select all graphs'),(2509,'conversionSimulation.result.graph.subtitle','Conversion amount: {0}'),(2510,'payment.authorizeConfirmationMessage','You are going to authorize this payment.\n\nPlease click OK to confirm'),(2511,'mobile.viewPayments.title','View Payments'),(2512,'profile.operator.title.my','My profile'),(2513,'permission.memberPayments.paymentToSystem','System payments'),(2514,'reports.error.formDisplayError','Error displaying the form'),(2515,'theme.import.successful','The theme was successfully imported'),(2516,'settings.message.sms','SMS message'),(2517,'pos.pinChanged','The PIN was updated'),(2518,'card.group','Group'),(2519,'adCategory.alterOrder','Alter order'),(2520,'payment.confirmation.header','You are about to perform the following payment:'),(2521,'permission.adminMemberPayments.authorize','Authorize payments'),(2522,'permission.memberAccess.unblockPin','Unblock pin'),(2523,'reports.stats.taxes.paid.notPaid','Not Paid'),(2524,'permission.systemCurrencies.view','View'),(2525,'posweb.printReceipt','Payment successful. Click here or press F4 to print receipt'),(2526,'transactionPassword.action.reset','Reset transaction password'),(2527,'transactionFee.title.simple.insert','Insert transaction fee'),(2528,'message.action.confirmDelete','Are you sure to permanently remove the messages?'),(2529,'group.settings.emailValidation','E-mail validation'),(2530,'settings.message.adInterest','Ad interest'),(2531,'quickAccess.makePayment','Payment'),(2532,'global.weekDay.FRIDAY','Friday'),(2533,'customField.ad.visibility.WEB_SERVICE','Brokers and webservices'),(2534,'loan.title.details','Loan details'),(2535,'transactionPassword.generated','Your transaction password is:'),(2536,'alert.type.SYSTEM','System'),(2537,'settings.neverAlertMessage','0 never alerts'),(2538,'memberRecord.error.removing','Error removing {0}'),(2539,'customImage.system.quickAccess_searchMembers','Quick access: search members'),(2540,'settings.local.csv','CSV export'),(2541,'permission.adminMemberLoanGroups.view','View'),(2542,'reports.stats.activity.topten.andMore','(... and {0} more members with same score...)'),(2543,'transactionFee.gFIsZero','reaches 0% after x % of guarantee passed'),(2544,'error.systemOverloaded','The system is currently above it\'s capacity.\n\nPlease, try again in a few minutes.'),(2545,'home.status.paymentsAwaitingFeedback','You have {0} payments awaiting feedback'),(2546,'home.admin.status.unreadMessages','Unread messages'),(2547,'home.admin.status.systemAlerts','Number of system alerts'),(2548,'brokerCommissionContract.title.insert','Insert broker commission contract'),(2549,'translationMessage.import.type','What to do'),(2550,'customField.type.FLOAT','Decimal number'),(2551,'quickAccess.title','Quick access'),(2552,'errors.periodEndRequired','End date of {0} is required'),(2553,'permission.systemMemberRecordTypes.manage','Manage'),(2554,'loanPayment.status','Status'),(2555,'paymentFilter.removeConfirmation','Remove this payment filter?'),(2556,'connectedUsers.noOperators','There are no operators currently logged in'),(2557,'accountHistory.conciliation.conciliationStatus','Conciliation status'),(2558,'global.pagination.tooltip.previous','Previous page'),(2559,'transferAuthorization.title.list','Authorized transaction actions'),(2560,'permission.adminMemberPayments.cancelScheduledAsMember','Cancel scheduled payment as member'),(2561,'settings.log.webServiceLevel.ERRORS','Errors only'),(2562,'payment.newPayment','Make new payment'),(2563,'group.settings.passwordTries.deactivationTime','Deactivation time after max password tries'),(2564,'memberPos.changePin.notEqual','PIN are not equal'),(2565,'brokering.status','Status'),(2566,'mobile.error.inactiveUser','You have not been activated yet, contact the Administration'),(2567,'permission.adminMemberSms','SMS logs'),(2568,'pos.discardPos.confirmation','Discard POS?'),(2569,'guaranteeType.model.WITH_PAYMENT_OBLIGATION','With payment obligation'),(2570,'memberRecord.title.search.global','Search {0}'),(2571,'externalTransfer.removed','External transfer removed'),(2572,'memberImport.status.MISSING_NAME','Name is missing'),(2573,'alert.system.indexRebuildEnd','Search index rebuilding for {0} was finished at {1}'),(2574,'customImage.thumbnail','Thumbnail'),(2575,'transfer.title.details','Transaction details'),(2576,'authorizationLevel.title.list','Authorization levels'),(2577,'accountFeeLog.totalCollectedAmount','Total collected amount'),(2578,'settings.message.pinBlocked','PIN blocked by invalid trials'),(2579,'guaranteeType.issueFeeTransferType','Issue fee'),(2580,'adCategory.new','Insert new category'),(2581,'message.type.FROM_MEMBER','Messages from members'),(2582,'webshop.confirm.transactionPassword','In order to confirm this payment, please, supply your transaction password'),(2583,'brokerCommissionContract.denied','The broker commission contract was denied'),(2584,'notificationPreferences.acceptPaidMailing','Accept charged SMS mailings'),(2585,'customizedFile.name','File name'),(2586,'settings.message.member.title','Member notifications'),(2587,'externalTransferImport.title.import','Import transactions for {0}'),(2588,'transfersAwaitingAuthorization.onlyWithoutBroker','Only if brokers can\'t authorize'),(2589,'accountFeeLog.totalInvoices','Total invoices'),(2590,'menu.admin.settings.alert','Alert Settings'),(2591,'memberImport.status.MISSING_RECORD_FIELD','{0} is missing'),(2592,'createMember.public.alreadyExists','The login name is already in use, please choose another one.'),(2593,'account.status.INACTIVE','Inactive'),(2594,'mobile.viewPayments.date','Date'),(2595,'invoice.title.system','System invoices'),(2596,'global.month.OCTOBER','October'),(2597,'home.admin.status.refresh','Refresh'),(2598,'invoice.title.details','Invoice details'),(2599,'menu.operator.personal.profile','Profile'),(2600,'loan.repayment.discard.payment.confirmationMessage','Are you sure to discard this payment?'),(2601,'reference.removed','Reference removed'),(2602,'alert.system.rateInitializationStarted','Rate initialization job on currency {0} started for the following rates:\n{1}'),(2603,'changeGroup.title.history','History'),(2604,'reports.stats.keydevelopments.transactionAmount','Amount per transaction'),(2605,'accountType.limitType','Limit type'),(2606,'permission.brokerInvoices.cancelAsMember','Cancel as member'),(2607,'transfer.chargebackOf','Chargeback of'),(2608,'customizedFile.title.preview','Preview of {0}'),(2609,'transferType.error.hasPendingPayments','This payment type cannot have authorization removed because there are pending payments'),(2610,'customImage.system.conciliated','External payment: conciliated'),(2611,'guaranteeType.creditFee','Credit fee'),(2612,'reports.stats.finances.singlePeriod.income','Income'),(2613,'permission.brokerInvoices.acceptAsMemberFromSystem','Accept invoice from system as member'),(2614,'menu.member.account.systemPayment','System Payment'),(2615,'pos.actions.changeParameters','Change parameters'),(2616,'profile.action.byMember.title','Member actions for {0}'),(2617,'changePassword.resetAndSent','The password was reset and sent to member'),(2618,'invoice.denyConfirmationMessage','Deny incoming invoice from {0} of {1}?\n\nPlease click OK to confirm.'),(2619,'group.settings.cardType','Card type'),(2620,'guarantee.expirationTimeForIssuer','Expiration time for issuer'),(2621,'guarantee.listGuaranteeTypes','Guarantee types list'),(2622,'changePassword.resetAndSend','Reset password & send by e-mail'),(2623,'changePassword.newPasswordConfirmation','Confirm new password'),(2624,'customField.possibleValue.removeConfirmation','Remove this value?'),(2625,'changeGroup.member.changed','The member\'s group was changed'),(2626,'account.upperCreditLimit','Upper credit limit'),(2627,'message.category','Category'),(2628,'transferType.defaultFeedbackComments','Feedback comments on expiration'),(2629,'smsLog.messageType','Notification type'),(2630,'accountFee.title.insert','Insert account fee'),(2631,'permission.adminMemberAccounts.scheduledInformation','View scheduled payments'),(2632,'settings.local.language.CHINESE_SIMPLIFIED','Chinese (Simplified)'),(2633,'loan.repayment.transactionPassword.repayOnly','In order to repay this loan, you must supply your transaction password'),(2634,'externalTransfer.status.CHECKED','Checked'),(2635,'invoice.acceptConfirmationMessage.fees','If you accept the invoice, the following fees will be applied: '),(2636,'defaultBrokerCommission.status.SUSPENDED','Suspended'),(2637,'currency.error.pattern','must include #amount#, which will be replaced by the actual amount'),(2638,'customField.payment.access.BOTH_ACCOUNTS','For both accounts'),(2639,'global.datePattern.day','dd'),(2640,'errors.periodExpired','All the {0} period can\'t be before the current date'),(2641,'menu.member.account.systemInvoice','System Invoice'),(2642,'settings.message.paymentObligationRegistered','New payment obligation published'),(2643,'group.settings.maxAdPublicationTime','Max ad publication time'),(2644,'posweb.searchTransactions.title','Transactions list'),(2645,'permission.adminMembers.changeName','Change full name'),(2646,'reports.members_reports.system_invoices.paymentFilterRequired','To show system invoices, it\'s necessary to choose at least one payment filter'),(2647,'reports.stats.activity.throughTime.numberTransactions.title','Number of Transactions per member through the time'),(2648,'pos.title.insert','Insert POS'),(2649,'adInterest.title','Interest name'),(2650,'invite.sent','Invitation mail sent to {0}'),(2651,'paymentObligation.buyer','Buyer'),(2652,'adCategory.navigator.root','Main category'),(2653,'permission.systemServiceClients','Web services clients'),(2654,'customField.title.insert.loanGroup','New loan group custom field'),(2655,'sms.error.type.NOT_ENOUGH_FUNDS','Not enough funds'),(2656,'ad.search.action.toggleFilter','Filters'),(2657,'reports.stats.choose.miscellaneous','Miscellaneous statistics'),(2658,'settings.log.webServiceLevel.SIMPLE','Simple tracing (no parameters)'),(2659,'group.account.modified','The group account was modified'),(2660,'reports.stats.taxes.numberOfCharges','Charges'),(2661,'group.customizedFiles.modified','The file has been modified for this group'),(2662,'conversionSimulation.title.of','Conversion simulation for {0}'),(2663,'reports.stats.activity.comparePeriods.numberTransactions.row2.short','all'),(2664,'permission.memberSms.view','View'),(2665,'certification.title.search','Search Certifications'),(2666,'permission.systemErrorLog','Error log'),(2667,'menu.admin.contentManagement.manageThemes','Themes'),(2668,'brokerCommissionContract.title.list','Broker commission contracts'),(2669,'paymentObligation.pack.paymentObligationPeriod','Max. period between obligations:'),(2670,'invoice.accepted','The invoice was accepted'),(2671,'settings.message.loanExpiration','Loan expiry'),(2672,'rates.i','I-rate'),(2673,'brokerCommissionContract.action.accept','Accept'),(2674,'rates.reinitialize','Re-initialize rates'),(2675,'adImport.status.MISSING_DESCRIPTION','Missing description'),(2676,'home.admin.status.openInvoices','Open system invoices'),(2677,'rates.d','D-rate'),(2678,'icon.title.conciliated','Payment conciliated'),(2679,'rates.a','A-rate'),(2680,'channel.defaultPrincipal','Default user identification'),(2681,'transfer.fromOrTo','From / to'),(2682,'settings.message.pendingPaymentCanceled','Pending payment canceling'),(2683,'reports.stats.activity.comparePeriods.numberTransactions.row2','Number of Transactions over all members'),(2684,'conversionSimulation.title.my','Conversion simulation'),(2685,'reports.stats.activity.comparePeriods.numberTransactions.row1','Number of Transactions per trading member'),(2686,'invoice.status','Status'),(2687,'payment.recipient','Recipient'),(2688,'customImage.system.print','Print icon'),(2689,'settings.local.numberLocale','Number format'),(2690,'transferType.availability.DISABLED','Disabled'),(2691,'login.pin','Pin'),(2692,'help.title.access_devices','Access devices'),(2693,'contact.title.list','Contact list'),(2694,'guaranteeType.pendingGuaranteeExpiration','Max pending guarantee period'),(2695,'settings.local.deleteMessagesOnTrashAfter','Delete messages on trash after'),(2696,'settings.local.applicationName','Application name'),(2697,'guaranteeType.enabledGuaranteeType','Enabled'),(2698,'loan.repayment.transactionPassword.repayOrDiscard','In order to repay or discard this loan payment, you must supply your transaction password'),(2699,'settings.message.expiredCertification','Expired certification'),(2700,'createOperator.passwordConfirmation','Confirm password'),(2701,'brokerCommissionContract.brokerCommission','Commission type'),(2702,'settings.local.maxIteratorResults','Max. printed lines'),(2703,'changePassword.error.mustBeAlphaNumeric','The password can only contain letters or numbers'),(2704,'permission.brokerCards.view','View'),(2705,'paymentObligation.sellerUsername','Seller login'),(2706,'transfer.Conciliated','Conciliated'),(2707,'changeGroup.operator.confirmPermanentRemove','Remove operator permanently?'),(2708,'menu.admin.usersGroups.connectedUsers','Connected users'),(2709,'document.name','Name'),(2710,'invoice.action.deny','Deny'),(2711,'document.title.modify','Modify document'),(2712,'permission.adminMemberGuarantees','Guarantees'),(2713,'smsMailing.sendType','Send type'),(2714,'group.customizedFiles.title','Customized files'),(2715,'accountFeeLog.finished','Finished'),(2716,'group.settings.maxAdImagesPerMember','Max images per ad'),(2717,'permission.memberPayments.cancelScheduled','Cancel scheduled payment'),(2718,'member.title.search','Search members'),(2719,'reports.members.members','Members'),(2720,'global.tooltip.remove','Remove'),(2721,'externalTransferType.title.modify','Modify payment type'),(2722,'certification.title.modify','Modify Certification'),(2723,'memberPos.name','POS name'),(2724,'settings.local.emailUnique','E-mail should be unique'),(2725,'reference.level.NEUTRAL','Neutral'),(2726,'mobile.viewPayments.noPayment','You have no payments'),(2727,'customField.title.modify.member','Modify member custom field'),(2728,'externalAccountHistory.transferImport.title','Transactions of {0} imported at {1}'),(2729,'profile.action.paymentAsMemberToMember','Payment member to member'),(2730,'receipt.transfer.transactionNumber','Transaction nr: {0}'),(2731,'currency.dRate.initValue','Initialization value D-rate'),(2732,'paymentRequest.search.empty','You don\'t have any payment requests for the given filters'),(2733,'memberImport.title.details.success','Members successfully imported'),(2734,'member.loanGroups','Loan groups'),(2735,'reports.stats.general.maxItemsExceded','You\'ve exceeded the maximum of data you may request.\nRequesting this much may cause a too high load on the server.\nPlease limit your request; see help for details.\nMaximum number of datapoints is {0}; number presently requested was {1}.'),(2736,'reference.title.received','Received references for {0}'),(2737,'scheduledPayments.searchType','Search type'),(2738,'reports.stats.keydevelopments.numberOfMembers.title','Developments in number of members'),(2739,'brokerCommission.unsuspendConfirmation','Do you want to unsuspend this commission?'),(2740,'customizedFile.title.search.page','Customized application pages'),(2741,'reports.members_reports.include_no_traders','Include members without transactions'),(2742,'ad.search.noResults','No advertisements were found'),(2743,'paymentObligation.accept','Accept'),(2744,'menu.member.account.scheduledPayments','Scheduled payments'),(2745,'guarantee.title.authorizeGuarantee','Authorize guarantee'),(2746,'mobile.login.accessUsing','Use {0}'),(2747,'transferType.availability.PAYMENT','Payment to others'),(2748,'externalAccount.removeConfirmation','Remove this external account?'),(2749,'menu.admin.accounts.authorizedLoans','Authorized loans'),(2750,'transactionFee.action.broker.new','Insert new broker commission'),(2751,'currency.dRate.interest','Interest rate'),(2752,'menu.admin.guarantees.listGuaranteeTypes','Guarantee Types'),(2753,'menu.operator.member.contacts','Contacts'),(2754,'customImage.system.pending','External payment: pending'),(2755,'settings.log.transactionLevel.OFF','Off'),(2756,'group.settings.transactionPassword.length','Transaction password length'),(2757,'menu.contact','Contact'),(2758,'permission.operatorGuarantees.issueGuarantees','Use guarantee type'),(2759,'webshop.payment.enterPasswordText','Password'),(2760,'transactionFee.subject.DESTINATION','Member receiving (destination)'),(2761,'changePin.error.obvious','Pin is too simple. It cannot be sequential, nor equals to any profile field'),(2762,'login.redirectFromMessage','In order to proceed please login'),(2763,'loan.summary.loans','Loans'),(2764,'adInterest.new','Insert new ad interest'),(2765,'group.settings.emailValidation.ADMIN','Administrator'),(2766,'customField.description','Description'),(2767,'reports.stats.general.comparePeriods','Compare 2 periods'),(2768,'invoice.accept.header','You are about to accept an invoice and perform the following payment:'),(2769,'permission.adminMemberMessages.view','View'),(2770,'permission.adminAdminAccess.changePassword','Change login password'),(2771,'customField.member.access.MEMBER_NOT_OPERATOR','Member, not operator'),(2772,'payment.selectTransferType','Select the payment type'),(2773,'group.settings.passwordLength.min','Min password length'),(2774,'customField.internalName','Internal name'),(2775,'rates.error.rateNotEnabledForInit','You tried to initialize a rate, but that rate is not enabled. You must enable it first on the currency.'),(2776,'reports.current.balance_account','Balance of {0}'),(2777,'permission.adminMemberCards.changeCardSecurityCode','Change code'),(2778,'reference.feedbackComments','Buyer feedback'),(2779,'theme.remove.error','The theme could not be removed'),(2780,'profile.action.brokerSimulateConversion','Simulate conversion for members'),(2781,'reference.level.GOOD','Good'),(2782,'invoice.title.send.member','Send invoice to member '),(2783,'translationMessage.removed','The translation keys were removed'),(2784,'permission.operatorMessages.sendToMember','Send to member'),(2785,'customField.title.order.payment','Set custom field order for {0}'),(2786,'reports.stats.finances.ComparePeriods.income.yAxis','Income'),(2787,'loanGroup.memberAdded','The member was added to this loan group'),(2788,'reports.stats.activity.developments.logins','Logins'),(2789,'brokerCommission.removed','The broker commission was removed'),(2790,'scheduledPayments.title.list.of','Scheduled payments of {0}'),(2791,'settings.type.ALERT','Alert settings'),(2792,'errorLog.date','Date'),(2793,'menu.admin.personal.mailPreferences','E-Mail Notifications'),(2794,'loanPayment.search.discardedAmount','Discarded'),(2795,'admin.username','Login name'),(2796,'accountFee.hour','Hour'),(2797,'menu.operator.personal.changePassword','Change password'),(2798,'loanPayment.search.repaidAmount','Repaid'),(2799,'card.unblocked','Card unblocked'),(2800,'accountType.nature.MEMBER','Member'),(2801,'menu.admin.ads.search','Products & Services'),(2802,'sms.type.ACCOUNT_DETAILS','Account details'),(2803,'notificationPreferences.email','Email'),(2804,'customField.member.memberSearchAccess','Member search for'),(2805,'profile.action.loansActions','Loans'),(2806,'settings.message.transactionFeedbackRequest','Transaction feedback request'),(2807,'permission.adminMemberCards.generate','Generate'),(2808,'global.selectAll','Select all'),(2809,'translationMessage.modified','The translation key has been modified'),(2810,'reports.stats.activity.throughTime.grossProduct.yAxis','Gross Product'),(2811,'settings.message.scheduledPaymentsCancelled','Scheduled payments cancelled'),(2812,'reports.stats.activity.singlePeriod.numberTransactions.row2','Number of Transactions over all members'),(2813,'reports.stats.activity.singlePeriod.numberTransactions.row1','Number of Transactions per trading member'),(2814,'loan.repayment.repaidAmount','Repaid'),(2815,'quickAccess.contacts','Contacts'),(2816,'groupFilter.modified','Group filter modified'),(2817,'registrationAgreement.title.insert','New registration agreement'),(2818,'serviceClient.title.modify','Modify web services client'),(2819,'theme.message.export','Export theme to a file'),(2820,'settings.message.lowUnits','Low units'),(2821,'conversionSimulation.aRate','A rate'),(2822,'serviceClient.member','Restricted to member'),(2823,'loanGroup.error.memberAlreadyInList','The given member is already in this loan group'),(2824,'reference.title.new.general','Set new reference'),(2825,'receiptPrinterSettings.removed','The receipt printer settings were removed'),(2826,'smsLog.smsType','Reason'),(2827,'permission.adminAdminRemarks.view','View'),(2828,'conversionSimulation.result.graph.title','Fee amount time curve'),(2829,'sms.type.HELP','Help'),(2830,'login.form.title','Login'),(2831,'invoice.sendConfirmationMessage','Send an invoice to {0} of {1}?\n\nPlease click OK to confirm.'),(2832,'customizedFile.title.applicationPage','Customized application pages'),(2833,'customField.type.ENUMERATED','Enumerated'),(2834,'permission.systemAccountFees.view','View'),(2835,'adCategory.removed','The category was removed'),(2836,'reports.members_reports.account_type.selectAccountTypes','Select account types'),(2837,'pin.unblock.message','The pin is blocked by exceeding wrong tries'),(2838,'settings.access.usernameGeneration.NONE','Manual by member'),(2839,'pos.changeParameters.confirmation','Change POS parameters?'),(2840,'menu.member.search.ads','Products & Services'),(2841,'groupFilter.new','Insert new group filter'),(2842,'permission.memberLoans.repay','Repay'),(2843,'reports.simulations.dRateConfigSimulation.currency','Currency'),(2844,'infoText.end','Expiration'),(2845,'menu.logout.confirmationMessage','Please confirm to logout'),(2846,'accountFee.error.multipleVolumeFees','There are multiple  volume account fees over this account.\n\nPlease, contact the administration.'),(2847,'home.admin.status.connectedOperators','Number of connected operators'),(2848,'group.settings.passwordLength.max','Max password length'),(2849,'reports.stats.activity.paymentFilterRequired','To show that statistics, at least one payment filter is required'),(2850,'accountFee.runMode.MANUAL','Manual'),(2851,'reports.stats.activity.comparePeriods.grossProduct.title','Gross Product per member (comparing two periods)'),(2852,'adImport.processed','The advertisements were successfully imported'),(2853,'settings.message.externalChannelPaymentRequestExpiredPayer','External channel payment request expired payer'),(2854,'ad.status.EXPIRED','Expired'),(2855,'message.error.memberWontReceiveNotification','The selected member has chosen not to receive messages from other members'),(2856,'transfer.to','To'),(2857,'help.title.payments','Payments'),(2858,'group.settings.enablePermanentAds','Enable permanent advertisements'),(2859,'reports.simulations.dRate.config.graph.yAxis','Fee'),(2860,'posweb.action.receivePayment','Receive payment (F2)'),(2861,'loan.firstOpenPayment','First open payment'),(2862,'accountHistory.debits.count','Transactions paid'),(2863,'permission.adminMemberSms.view','View'),(2864,'adCategory.error.importing','There was an error importing the categories'),(2865,'serviceClient.name','Name'),(2866,'groupFilter.groups','Groups'),(2867,'settings.local.transferListenerClass','Java class for processed payments'),(2868,'permission.brokerPos.changePin','Change PIN'),(2869,'profile.action.invoiceAsMemberToSystem','Invoice member to system'),(2870,'pos.status.DISCARDED','Discarded'),(2871,'error.email','There was an error while sending the mail'),(2872,'customField.payment.type.OWNED','Owned'),(2873,'registrationAgreement.inserted','The registration agreement was inserted'),(2874,'customField.title.insert.loan','New loan custom field'),(2875,'menu.member.account.invoices','Invoices'),(2876,'paymentObligationLog.status','Status'),(2877,'invoice.sentBy','Sent by'),(2878,'alert.removeOne.confirm','Remove alert?'),(2879,'member.member','Member'),(2880,'global.search.ADVANCED','Advanced'),(2881,'reports.stats.keydevelopments.throughTime.QUARTER','Each quarter'),(2882,'loan.repayment.discard.payment','Discard payment'),(2883,'conversionSimulation.dRate.present','Present D rate'),(2884,'paymentObligation.amount','Amount'),(2885,'permission.systemMessageCategories.view','View'),(2886,'createAdmin.password','Password'),(2887,'customField.ad.indexed','Include in keywords search'),(2888,'member.bulkActions.cardGenerated','{0} cards were generated'),(2889,'transferType.allowsScheduledPayments','Allows scheduled payments'),(2890,'loan.status.RECOVERED','Recovered'),(2891,'group.settings.externalAdPublication.DISABLED','Disabled'),(2892,'permission.memberReceiptPrinterSettings','Receipt printer settings'),(2893,'loan.repaymentType','Repayment type'),(2894,'settings.access.externalPaymentPassword','Password'),(2895,'theme.removed','The theme was removed'),(2896,'changeGroup.admin.title','Change group of administrator {0}'),(2897,'menu.operator.account.requestPayment','Request payment'),(2898,'reports.stats.keydevelopments.averageAmountPerTransaction.title','Developments in median amount per transaction'),(2899,'notificationPreferences.costPerAdditionalMessages','{0} additional messages cost {1} with a validity of {2}'),(2900,'guaranteeType.paymentObligationList','Payment obligation list'),(2901,'member.action.create','Create member'),(2902,'settings.local.csv.valueSeparator.COMMA','Comma'),(2903,'transferType.allowSmsNotification','Allow SMS notification'),(2904,'menu.member.personal.commissionChargeStatus','Broker commissions'),(2905,'customizedFile.resolveConflict','Resolve conflict'),(2906,'smsLog.type.MAILING','Mailing'),(2907,'permission.adminMemberRecords','Member records'),(2908,'transactionFee.deductAmount','Deduction'),(2909,'changePassword.error.incorrect','Incorrect password'),(2910,'smsMailing.title.send','Send new SMS mailing'),(2911,'reports.members.ads.scheduled','Scheduled'),(2912,'currency.description','Description'),(2913,'transactionPassword.error.invalid','Invalid transaction password.\nTry again.'),(2914,'createMember.error.noPossibleGroup','There is no possible initial group'),(2915,'transactionFee.title.broker.list','Broker commissions'),(2916,'memberRecordType.error.removing','The member record type cannot be removed because there is at least one member record using it'),(2917,'errorLog.title.search','Search error log history'),(2918,'category.name','Category'),(2919,'receiptPrinterSettings.paymentAdditionalMessage','Additional message on payment receipts'),(2920,'permission.systemAlerts.viewMemberAlerts','View member alerts'),(2921,'group.settings.maxSchedulingPeriod','Max. scheduling period'),(2922,'message.type.BROKERING','Brokering events'),(2923,'accountFee.chargeMode.NEGATIVE_VOLUME_PERCENTAGE','Negative volume percentage'),(2924,'login.accessUsing','Access using {0}'),(2925,'permission.adminMemberAccounts.authorizedInformation','Search for authorized loan status'),(2926,'serviceOperation.INFO_TEXTS','Get info texts'),(2927,'externalTransferProcess.processed','The selected payments have been processed'),(2928,'menu.member.personal.changePassword','Change password'),(2929,'payment.error.pastDateWithRates','Payment in past is not possible if rates are enabled.\nThis is a configuration error; please contact a system admin.'),(2930,'settings.access.virtualKeyboardLogin','Virtual keyboard for login password'),(2931,'card.status','Status'),(2932,'rates.error.reinitValidation.reinitDateAfterEnableDate','The date you gave to start the reinitialization from is after the present enabling date of rates.\nYou must choose a date before enabling dates.'),(2933,'menu.admin.accounts.loanPayments','Loan Payments'),(2934,'menu.admin.personal.profile','Profile'),(2935,'transactionFee.chargeType','Charge type'),(2936,'serviceClient.removed','The web services client was removed'),(2937,'reference.title.given.my','Given'),(2938,'permission.systemReports.statistics','Statistics'),(2939,'settings.log.scheduledTaskLevel.INFO','Summarized execution'),(2940,'permission.operatorInvoices.sendToMember','Send to member'),(2941,'guarantee.currentIssueFeeValue','Issue fee charged'),(2942,'alert.system.APPLICATION_RESTARTED','Application restarted'),(2943,'group.settings.expireMembersAfter','Expire members after'),(2944,'group.settings.maxAdDescriptionSize','Max ad description size'),(2945,'alert.search.date.end','To date'),(2946,'group.account.updateAccountLimits','Update credit limit for existing members'),(2947,'profile.member.maxPictures','Maximum amount of pictures reached'),(2948,'permission.adminMembers.changeGroup','Change group'),(2949,'certification.logs','Logs'),(2950,'conversionSimulation.result.graph.xAxis','Date'),(2951,'settings.message.adminPaymentFromSystemToSystem','Payments from system to system'),(2952,'reports.stats.finances.singlePeriod.overview','Overview'),(2953,'memberPos.status.PENDING','Pending'),(2954,'reports.stats.activity.singlePeriod.grossProduct.yAxis','Gross Product'),(2955,'payment.nextAuthorizationLevel','The payment has been submitted for a higher level authorization'),(2956,'reports.stats.finances.expenditure.short','Expenditure'),(2957,'reports.stats.activity.throughTime.loginTimes.yAxis','Logins / member'),(2958,'transactionFee.name','Name'),(2959,'message.type.FROM_ADMIN_TO_GROUP','Mailings from administration'),(2960,'group.account.pendingAccounts','There are {0} accounts pending activation'),(2961,'permission.module.type.ADMIN_MEMBER','Member administration permissions of {0}'),(2962,'global.totalAmount','Total amount'),(2963,'adminTasks.indexes.rebuildAll','Rebuild all'),(2964,'guarantee.title.guaranteeList','Guarantee list'),(2965,'reports.stats.activity.comparePeriods.loginTimes.title','Logins per member (comparing two periods)'),(2966,'permission.brokerInvoices','Invoices'),(2967,'brokerCommission.modified','The broker commission was modified'),(2968,'alert.system.ACCOUNT_FEE_FAILED','Account fee failed'),(2969,'accountHistory.filter','Payment type'),(2970,'guarantee.creditFee','Credit fee'),(2971,'member.search.date','Activation'),(2972,'reference.level.VERY_BAD','Very bad'),(2973,'cardType.cardFormatNumber','Format number'),(2974,'payment.recipientName','Name (recipient)'),(2975,'customField.member.access.WEB_SERVICE','Web services'),(2976,'mobile.error.noDefaultAccount','You cannot login because the group {0} doesn\'t have a default account'),(2977,'reports.current.invoices.SYSTEM_INCOMING.amount','Sum of incoming system invoices'),(2978,'transactionFee.allowAnyAccount','Allow any account'),(2979,'memberPos.status.BLOCKED','Blocked'),(2980,'menu.member.account.accountInformation','Account Information'),(2981,'externalTransfer.title.new','New external transfer'),(2982,'authorizationLevel.amount','Amount'),(2983,'customizedFile.contents','Contents'),(2984,'loan.repayment.confirmationMessage','Are you sure to repay {0}?\n\nPlease, click OK to proceed'),(2985,'settings.log.traceLevel.OFF','Off'),(2986,'reports.stats.keydevelopments.numberOfTransactions','Number of transactions'),(2987,'createOperator.action.saveAndOpenProfile','Save and open operator profile'),(2988,'guarantee.status.PENDING_ADMIN','Pending Admin'),(2989,'home.status.newReferences','You received {0} new references since your last login'),(2990,'menu.member.personal.documents','Documents'),(2991,'adminTasks.indexes.confirmRebuild','Index rebuilding is performed in the background and can make searches by keywords fail to find results until it is complete.\n\nAre you sure?'),(2992,'permission.adminMemberAds.import','Import'),(2993,'groupFilter.removeConfirmation','Remove group filter?'),(2994,'permission.brokerSmsMailings.paidSmsMailings','Send paid SMS mailings'),(2995,'memberImport.status.INVALID_COLUMN','Invalid column: {0}'),(2996,'message.category.noCategory','No category'),(2997,'posweb.searchTransactions.noTransactions','No transactions on the given date'),(2998,'permission.adminMemberInvoices.cancel','Cancel invoice'),(2999,'invoice.action.accept','Accept'),(3000,'pos.actions.changePin','Change PIN'),(3001,'brokerCommissionContract.status.ACCEPTED','Accepted'),(3002,'reference.action.paymentsAwaitingFeedback','View payments awaiting feedback'),(3003,'reference.title.references.of','{0}\'s references'),(3004,'permission.adminAdminAccess','Access'),(3005,'loan.grant.setDate','Grant in past'),(3006,'fieldMapping.removed','Field mapping removed'),(3007,'permission.brokerAds','Products and services'),(3008,'customImage.system.delete','Delete icon'),(3009,'profile.action.personalMessages','Send personal message'),(3010,'certification.lock','Lock'),(3011,'alert.member.negativeVirtualRatedBalance','A negative virtual rated balance has been encountered on  account {0}. The virtual rated balance has been set to 0, but the cause for this error should be checked.'),(3012,'permission.operatorAccount.scheduledInformation','View scheduled payments'),(3013,'group.settings.repayLoanByGroup','Loan repayment permitted by any loan group member'),(3014,'permission.memberReferences','References'),(3015,'ticket.status.EXPIRED','Expired'),(3016,'permission.brokerCards.unblock','Unblock'),(3017,'error.aRateParameters.noFutureInitEmission','Init value and date will lead to future emission dates, which is not allowed.'),(3018,'menu.operator.account.selfPayment','Self Payment'),(3019,'adImport.status.INVALID_CATEGORY','Invalid category: {0}'),(3020,'reports.stats.keydevelopments.transactionAmount.yAxis','amount/transaction (units)'),(3021,'transactionFee.subject.SOURCE_BROKER','Broker of member paying (source)'),(3022,'loanGroup.action.grantLoan','Give loan'),(3023,'group.settings.hideCurrencyOnPayments','Hide currency (show only payment types)'),(3024,'settings.message.commissionContractCancelled','Commission contract cancelled'),(3025,'customField.title.list.admin','Administrator custom fields'),(3026,'menu.admin.customFields','Custom Fields'),(3027,'permission.systemInvoices.manage','Manage'),(3028,'posweb.action.printSettings','Print settings'),(3029,'paymentObligation.error.noActiveCertificationFound','No active certification found to {0} and issued by {1}    '),(3030,'currency.title.insert','New currency'),(3031,'card.search.noResults','No cards were found'),(3032,'transferAuthorization.comments','Comments'),(3033,'settings.mail.activationMessageWithoutPassword','Message when password is manually assigned'),(3034,'member.bulkActions.channelsChanged','The change was applied to {0} members. {1} members were not changed. '),(3035,'settings.alert.amountIncorrectLogin','Incorrect login attempts'),(3036,'scheduledPayment.parcels','Installments'),(3037,'permission.operatorAds','Ads'),(3038,'reports.transactions_report.outgoing','outgoing'),(3039,'transferType.inserted','The transaction type was inserted'),(3040,'home.admin.status.connectedAdmins','Number of connected admins'),(3041,'rates.reinit.enabledSince','Enabled since'),(3042,'permission.adminAdminRecords.modify','Modify'),(3043,'activities.invoices.incoming.count','Incoming count'),(3044,'permission.adminMemberInvoices.cancelAsMember','Cancel invoice as member'),(3045,'receipt.posweb.transactions.date','Date: {0}'),(3046,'permission.memberCards.activate','Ativate'),(3047,'permission.brokerMemberPayments.cancelScheduledAsMember','Cancel scheduled payment as member'),(3048,'permission.brokerReferences.manage','Manage'),(3049,'global.weekDay.MONDAY','Monday'),(3050,'reports.stats.taxes.paid.paid','Paid'),(3051,'channel.webServiceUrl','Web service url'),(3052,'accountFee.paymentDirection.TO_MEMBER','System to member'),(3053,'loanGroup.inserted','Loan group inserted '),(3054,'webshop.payment.enterPinText','PIN'),(3055,'payment.setDate','Pay in past'),(3056,'adImport.newCategories','New categories'),(3057,'permission.systemAccounts.scheduledInformation','View scheduled payments'),(3058,'customizedFile.title.search.help','Customized help files'),(3059,'global.hide','Hide'),(3060,'global.timePeriod.MONTHS','Month(s)'),(3061,'permission.operatorPayments','Payments'),(3062,'customField.ad.visibility','Visibile for'),(3063,'transfer.by','Performed by'),(3064,'adminTasks.indexRebuildEnqueued','The index rebuild has been enqueued.\nA system alert will be created when it\'s finished'),(3065,'message.brokeredMembers','Registered members'),(3066,'customField.memberRecord.brokerAccess.EDITABLE','Editable'),(3067,'posweb.title.makePayment','Make payment'),(3068,'help.title.home','Home'),(3069,'reports.stats.activity.histogram.logins.yAxis','Number of members'),(3070,'serviceOperation.WEBSHOP','Webshop payments'),(3071,'reports.stats.keydevelopments.numberOfMembers.numberOfMembers','Number of members'),(3072,'adImport.currency','Currency of imported ads'),(3073,'changePin.error.transactionPasswordPending','In order to define the pin, you need the transaction password, which can be generated in the <a class=\"default\" href=\"{0}\">home page</a>'),(3074,'settings.log.maxLengthPerFile','Max file size'),(3075,'alert.system.ERROR_PROCESSING_ACCOUNT_STATUS','Critical error processing account status'),(3076,'reports.stats.general.number','Number'),(3077,'settings.message.modified','The message settings were modified'),(3078,'payment.error.sameFromAntToInFee','This payment cannot be performed, as there would be a fee from / to the same account'),(3079,'currency.removeConfirmation','You are about to remove this currency.\nAre you sure?'),(3080,'customImage.choose','Choose an image'),(3081,'transfer.guarantee.details','Click here for details. '),(3082,'permission.brokerMemberSms.view','View'),(3083,'global.timePeriod.invalid','End date must be after start date.'),(3084,'registrationAgreement.modified','The registration agreement was modified'),(3085,'rates.error.pendingRateExists','You tried to initialize a rate, but a rate initialization is already pending.\nYou can only run one at a time.'),(3086,'permission.adminMemberPreferences.manageNotifications','Manage notifications'),(3087,'card.updateCard.error.blockedTransactionPassword','Blocked transaction password'),(3088,'image.removeConfirmation','Remove image?'),(3089,'global.month.APRIL','April'),(3090,'adminTasks.onlineState.title','System availability'),(3091,'theme.description','Description'),(3092,'externalTransferImport.error.importing.invalidTypeCode','Invalid payment type code: {0}'),(3093,'permission.systemCustomizedFiles','System-wide customized files'),(3094,'brokerCommission.stopped','The broker commission was stoped'),(3095,'profile.pendingEmail.confirmed','The e-mail change to {0} has been confirmed'),(3096,'paymentFilter.groups','Group visibility'),(3097,'receipt.transfer.header','{0} payment receipt'),(3098,'loanGroup.title.insert','New loan group'),(3099,'permission.adminMemberGuarantees.viewPaymentObligations','View payment obligations'),(3100,'memberRecord.modifiedBy','Modified by'),(3101,'help.title.settings','Settings'),(3102,'settings.local.timeZone.none','Don\'t compute time zone'),(3103,'document.action.new','Insert new document'),(3104,'settings.type.MAIL','Mail settings'),(3105,'guaranteeType.model.WITH_BUYER_ONLY','With buyer only'),(3106,'permission.memberCards.block','Block'),(3107,'permission.brokerInvoices.view','View'),(3108,'externalTransferImport.title.search','Search imports for {0}'),(3109,'currency.enableARate','Enable A-rate'),(3110,'permission.brokerDocuments.view','View'),(3111,'transactionFee.payer','Will be charged'),(3112,'customField.title.modify.memberRecord','Modify custom field for member record {0}'),(3113,'settings.message.buyerOnlyGuaranteeStatusChanged','Guarantee status changed (only buyer)'),(3114,'changeGroup.error.move.hasBalance','The member cannot be moved because it does not have a zero balance in {0}'),(3115,'customField.title.list.loanGroup','Loan group custom fields'),(3116,'customField.title.insert.admin','New administrator custom field'),(3117,'profile.action.accessActions','Access'),(3118,'message.messageBox.TRASH','Trash'),(3119,'reports.stats.activity.throughTime.nAll','n All'),(3120,'receipt.transfer.from','From: {0}'),(3121,'permission.brokerMemberPayments','Member payments'),(3122,'accountHistory.initialBalance','Initial balance'),(3123,'guaranteeType.authorizedBy.ISSUER','Issuer'),(3124,'channel.removeConfirmation','Are you sure to remove this channel?'),(3125,'fileMapping.headerLines','Header lines'),(3126,'menu.operator.search.members','Members'),(3127,'reports.current.number_open_loans','Number of open loans'),(3128,'memberImport.status.INVALID_RECORD_FIELD','Invalid value for {0}: {1}'),(3129,'loanPayment.title','Payments'),(3130,'transactionFee.value','Charge value'),(3131,'card.action.unblockSecurityCode','Unblock card security code'),(3132,'loan.queryStatus.OPEN','Open'),(3133,'menu.member.personal','Personal'),(3134,'activities.references.given','Given'),(3135,'remark.date','Date'),(3136,'reports.stats.activity.throughTime.percentageNoTrade.yAxis','% not trading'),(3137,'authorizationLevel.modified','Authorization level modified'),(3138,'certification.status.EXPIRED','Expired'),(3139,'reference.date','Date'),(3140,'reports.current.ads_information','Advertisements information'),(3141,'menu.admin.accounts.loans','Manage Loans'),(3142,'message.search.keywords','Keywords'),(3143,'group.title.list','Permission groups'),(3144,'changeBroker.current','Current broker'),(3145,'permission.adminMemberAccess.transactionPassword','Manage transaction password'),(3146,'help.title.account_management','Account management'),(3147,'permission.systemSettings.view','View settings'),(3148,'adCategory.orderModified','The ad category order was modified'),(3149,'theme.remove.confirmation','Are you sure to remove this theme from the system?'),(3150,'permission.brokerSmsMailings','SMS mailings'),(3151,'adminTasks.indexes.type.MemberRecord','Member records'),(3152,'brokering.title.print','Registered members'),(3153,'memberImport.accountType.empty','Don\'t import accounts'),(3154,'transfer.guarantee','Related guarantee'),(3155,'mobile.home.doPayment','Do Payment'),(3156,'settings.log.traceLevel.ERRORS','Errors only'),(3157,'message.title.send','Send message'),(3158,'externalAccount.description','Description'),(3159,'externalTransferImport.by','Performed by'),(3160,'rates.error.reinitValidation.noRateSpecified','No rate was specified.'),(3161,'channel.credentials.PIN','PIN'),(3162,'reports.stats.activity.singlePeriod.numberTransactions','Number of Transactions per member'),(3163,'message.type.TRANSACTION_FEEDBACK','Transaction feedbacks'),(3164,'global.quarter.THIRD','Third quarter'),(3165,'invoice.invalid.paymentDates','The payment dates should be sorted and must be scheduled for future dates'),(3166,'guaranteeType.creditFeeTransferType','Credit fee'),(3167,'permission.operatorReports','Reports'),(3168,'group.account.error.removing','The group account could not be removed, because at least one account has transactions or open invoices'),(3169,'certification.starts','Starts'),(3170,'home.admin.status.title','Application status'),(3171,'help.title.groups','Groups'),(3172,'message.type.AD_EXPIRATION','Ad expiration alert'),(3173,'loan.type.MULTI_PAYMENT','Multiple payments'),(3174,'memberRecord.removed','The {0} record was removed'),(3175,'activities.rates','Rates'),(3176,'permission.adminMemberBrokerings.viewMembers','View members list (as broker)'),(3177,'paymentFilter.title.list','Payment filters'),(3178,'card.status.CANCELED','Canceled'),(3179,'profile.error.changeEmailValidationFailed','You have attempted to change the e-mail, but the verification e-mail couldn\'t be sent'),(3180,'permission.operatorGuarantees','Guarantees'),(3181,'scheduledPayment.totalAmount','Total amount'),(3182,'mailPreferences.memberAlerts','Member alerts'),(3183,'customField.size.MEDIUM','Medium'),(3184,'settings.title.file','Import / export settings'),(3185,'reports.stats.activity.comparePeriods.numberTransactions.row1.short','traders'),(3186,'customImage.system.systemLogo','System logo'),(3187,'manual.action.printManual','Print whole manual'),(3188,'settings.local.deletePendingRegistrationsAfter','Maximum e-mail confirmation time for member registration'),(3189,'loanGroup.title.members','Members in this loan group'),(3190,'memberRecordType.editable','Editable'),(3191,'reports.stats.general.printable','Printable version'),(3192,'profile.action.preferencesActions','Preferences'),(3193,'brokerCommission.suspendTooltip','Suspend'),(3194,'receiptPrinterSettings.title.list','Receipt printer settings'),(3195,'externalTransferType.action','Action'),(3196,'externalTransfer.action.choose','Apply action to selected transfers...'),(3197,'customImage.system.inactive','Inactive icon'),(3198,'permission.memberGuarantees.sellWithPaymentObligations','Sell with payment obligations to groups'),(3199,'customImage.system.message_replied','Replied message icon'),(3200,'menu.member.personal.pos.editPos','Edit POS'),(3201,'selectChannels.title.of','Change access to channels of {0}'),(3202,'reports.stats.general.throughTheYears','Through the years'),(3203,'settings.message.pendingGuaranteeIssuer','Guarantee awaiting for authorization'),(3204,'notificationPreferences.message','Cyclos message'),(3205,'customizedFile.path','Path'),(3206,'settings.mail.activation','Activation mail'),(3207,'brokerCommission.error.suspending','Error suspending the broker commission!'),(3208,'message.type.PAYMENT','Payment events'),(3209,'global.loadingSystem','The application is being loaded. Please, wait...'),(3210,'menu.admin.reports.sms','SMS messages logs'),(3211,'menu.operator.account.systemInvoice','System Invoice'),(3212,'paymentObligation.requestGuaranteeOk','The guarantee was created in status {0}'),(3213,'selectChannels.title.my','Change my access to channels'),(3214,'adCategory.title.insert','New advertisement category'),(3215,'contact.title.add','Add new contact'),(3216,'activities.transactions.numberBuy','Paid - count'),(3217,'reference.adminComments','Administration comments'),(3218,'settings.access.usernameLength','Manual login length'),(3219,'registrationAgreement.title.list','Registration agreements'),(3220,'customImage.system.import','Import icon'),(3221,'permission.brokerMemberRecords.view','View'),(3222,'customField.type.INTEGER','Integer number'),(3223,'alert.member.LOGIN_BLOCKED_BY_TRIES','Member blocked by exceeding login attempts'),(3224,'customField.title.insert.member','New member custom field'),(3225,'errors.minLength','{0} cannot be less than {1} characters'),(3226,'group.settings.sendPasswordByEmail','Send password by e-mail'),(3227,'permission.adminMemberAccess.resetPassword','Reset login password'),(3228,'menu.admin.reports.members.list','Member lists'),(3229,'connectedUsers.disconnectToolTip','Disconnect user'),(3230,'permission.adminMemberSmsMailings','SMS mailings'),(3231,'reports.stats.activity.throughTime.numberTransactions.col4','n All'),(3232,'reports.stats.activity.throughTime.numberTransactions.col3','n Traders'),(3233,'permission.adminAdminRecords.create','Create'),(3234,'reports.stats.activity.throughTime.numberTransactions.col2','Number of Transactions All'),(3235,'group.settings.possibleInitialGroups','Possible initial groups'),(3236,'menu.admin.accounts.accountFees','Account Fees'),(3237,'createMember.error.mailSending','There was a problem while sending the validation e-mail.\nThe member was not registered.'),(3238,'reports.stats.activity.throughTime.numberTransactions.col1','Number of Transactions Traders'),(3239,'settings.local.highPrecision','High precision'),(3240,'defaultBrokerCommission.status','Status'),(3241,'permission.brokerMessages.sendToMembers','Send message to registered members'),(3242,'message.type.INVOICE','Invoice events'),(3243,'settings.alert.amountDeniedInvoices','Denied invoices'),(3244,'menu.admin.settings.local','Local Settings'),(3245,'loan.repayment.setDate','Repay in past'),(3246,'customizedFile.title.customize.page','Customize application page'),(3247,'profile.action.records','Records'),(3248,'card.activationDate','Activation date'),(3249,'brokerCommission.action.stop','Stop'),(3250,'adImport.status','Status'),(3251,'fieldMapping.title.order.description','Drag the fields to change order'),(3252,'pos.created','The POS was created'),(3253,'reports.stats.period.name','Name'),(3254,'reports.members.date.history','History'),(3255,'invoice.scheduledFor','Scheduled for'),(3256,'settings.log.traceLevel.SIMPLE','Simple tracing (no parameters)'),(3257,'groupFilter.customizedFiles.removeConfirmation','Stop customizing this file?'),(3258,'permission.systemSettings.manageMail','Manage mail settings'),(3259,'settings.log.accountFeeLevel.DETAILED','Detailed'),(3260,'remark.writer.administration','Administration'),(3261,'accountFee.runMode.SCHEDULED','Scheduled'),(3262,'smsLog.type.NOTIFICATION','Notification'),(3263,'permission.adminMemberAccounts.information','View information'),(3264,'profile.action.activities','View reports'),(3265,'adCategory.title.export','Export advertisement categories'),(3266,'changeGroup.error.remove.hasBalance','The member cannot be removed because it does not have a zero balance in {0}'),(3267,'permission.adminMemberAccess.disconnectOperator','Disconnect logged operator'),(3268,'home.status.unreadMessages','You have {0} unread messages'),(3269,'permission.systemExternalAccounts.processPayment','Process payment'),(3270,'customizedFile.customized','The file has been customized'),(3271,'smsMailing.mailingType.PAID_FROM_BROKER','Paid mailing from broker'),(3272,'group.settings.emailValidation.WEB_SERVICE','Web service'),(3273,'alert.member.loginBlockedByPermissionDenieds','The member login is temporarily blocked by exceeding the maximum amount of permission denied. The remote IP address is {1}'),(3274,'reports.stats.finances.singlePeriod.expenditure','Expenditure'),(3275,'accountFeeLog.rechargeFailed','Recharge (failed members)'),(3276,'loanGroup.modified','Loan group modified '),(3277,'createMember.captcha','Please, type the image characters below'),(3278,'changePin.title.of','Change pin of {0}'),(3279,'permission.brokerLoanGroups','Loan groups'),(3280,'menu.member.personal.brokerCommissionContracts','Commission contracts'),(3281,'menu.admin.contentManagement.staticFiles','Static Files'),(3282,'loan.grant.error.unsortedPayments','The loan payments are not correctly sorted by date'),(3283,'permission.adminMemberRecords.manage','Manage'),(3284,'memberPos.maxSchedulingPayments','Max scheduling payments'),(3285,'pos.assignPos.confirmation','Assign the POS to member?'),(3286,'mobile.payment.username','User'),(3287,'image.details.title','Set image order and caption'),(3288,'payment.title.asMemberToSelf','Transfer between accounts of {0}'),(3289,'operator.name','Operator Name'),(3290,'profile.action.allowLogin','Allow user to login now'),(3291,'permission.admin.managesGroups','Manages groups'),(3292,'changePin.title.my','Change my pin'),(3293,'group.error.removing','The group could\'t be removed.\nMake sure there are no users on it'),(3294,'reference.paymentsAwaitingFeedback.noResults','There are no payments currently awaiting feedback'),(3295,'externalTransfer.action.MARK_AS_CHECKED','Mark as checked'),(3296,'permission.systemCustomFields','Custom fields'),(3297,'memberImport.title.details.error','Members with import errors'),(3298,'permission.systemMemberPermissions.view','View'),(3299,'settings.local.language.ITALIAN','Italian'),(3300,'menu.member.operators.groups','Operator groups'),(3301,'reference.to','To'),(3302,'reference.title.received.my','Received'),(3303,'cardType.defaultExpiration','Expiration'),(3304,'permission.systemMemberRecordTypes.view','View'),(3305,'permission.adminAdminRecords.view','View'),(3306,'memberRecord.action.newBasedOnThis','Create new {0} based on this one'),(3307,'customField.payment.access.DESTINATION_MEMBER','For the destination member only'),(3308,'group.settings.maxPinWrongTries','Max pin wrong tries'),(3309,'errors.dateFormat','Invalid date. The correct format is {0}'),(3310,'reports.stats.finances.ComparePeriods.expenditure','Expenditure'),(3311,'externalTransfer.action.DELETE','Delete'),(3312,'paymentObligation.error.certificationAmountExceeded','The certification\'s remaining amount ({0}) corresponding to the buyer is exceeded by the total amount of the selected payment(s) obligation(s) ({1})'),(3313,'profile.action.memberSelfPayment','Self payment'),(3314,'loan.grant.paymentCount','Payment count'),(3315,'transactionFee.generatedTransferType','Generated transaction type'),(3316,'permission.brokerAccounts.brokerSimulateConversion','Simulate conversion for member'),(3317,'global.reset','Reset'),(3318,'theme.filename','File name'),(3319,'smsLog.search.noResults','No SMS logs found'),(3320,'menu.member.connectedOperators','Connected operators'),(3321,'reports.stats.keydevelopments.throughTime.selectQuarters','Select quarters and years'),(3322,'changePassword.error.obvious','The password is too simple. It cannot be sequential, nor equals to any profile field'),(3323,'externalAccount.title.list','External Accounts List'),(3324,'paymentObligation.reject','Reject'),(3325,'payment.manualDate','Payment date'),(3326,'payment.statusGroup.CLOSED_WITHOUT_ERRORS','Closed (entirely paid)'),(3327,'fieldMapping.field.DATE','Payment date'),(3328,'accountType.title.modify.member','Modify member account type'),(3329,'brokering.change.confirmation.withBroker','{1} already has {2} as broker.\nAre you sure to change the broker to {0}?'),(3330,'reference.summary.total','Total'),(3331,'customField.payment.access.NONE','Don\'t show'),(3332,'invoice.title.accept','Invoice accept confirmation'),(3333,'permission.adminMemberDocuments.manageMember','Manage member documents'),(3334,'reports.simulations.dRateConfigSimulation.startD','Start from D ='),(3335,'member.bulkActions.choose','Choose action'),(3336,'memberImport.sendActivationMail','Send activation e-mail'),(3337,'guaranteeType.issueFee','Issue fee'),(3338,'settings.local.csv.recordSeparator.CR_LF','DOS (char 10 + char 13)'),(3339,'permission.adminMemberPos.manage','Manage'),(3340,'externalTransfer.action.MARK_AS_UNCHECKED','Mark as unchecked'),(3341,'settings.message.adminAlerts','Subjects for alert notifications'),(3342,'pos.unblockPin.confirmation','Activate the pin?'),(3343,'help.title.custom_fields','Custom Fields'),(3344,'group.settings.smsChargeTransferType','SMS charge transfer type'),(3345,'reports.stats.keydevelopments.numberOfAds.scheduled.short','scheduled'),(3346,'loan.granted','The loan was successfully granted'),(3347,'reports.members.ads.permanent','Permanent'),(3348,'reports.current.presentation','State reports'),(3349,'groups.name','Name'),(3350,'guarantee.registerGuarantee','Register guarantee'),(3351,'settings.message.certificationIssued','New certification issued'),(3352,'permission.systemTranslation','Translation'),(3353,'card.title.print','Card search results'),(3354,'customField.valuesMoved','A total of {0} occurences were replaced from {1} to {2}'),(3355,'document.binaryFile','File'),(3356,'cardType.ignoreDayInExpirationDate','Ignore day in expiration'),(3357,'card.activateCard.confirmation','Activate card?'),(3358,'accountFeeLog.status.SKIPPED','Skipped'),(3359,'payment.statusGroup.OPEN','Open'),(3360,'home.admin.status.errors','Application errors'),(3361,'menu.about','About'),(3362,'authorizationLevel.removeConfirmation','Remove this authorization level?'),(3363,'externalTransfer.inserted','External transfer inserted'),(3364,'brokerCommission.action.suspend','Suspend'),(3365,'customField.title.order.description','Drag the fields to change order'),(3366,'menu.member.personal.sms','SMS history'),(3367,'reports.current.member_count_on_group','Members in {0} group'),(3368,'transactionFee.deductAmount.false','Do not deduct from total amount'),(3369,'customImage.system.help','Help icon'),(3370,'group.account.title.new','Add an account to group {0} '),(3371,'loan.grant.error.invalidAmount','The loan payments amount differs from total amount'),(3372,'groupFilter.containerUrl','Container page url'),(3373,'group.defaultAllowChargingSms','Allow charging for SMS by default'),(3374,'permission.systemGroups','Permission groups'),(3375,'global.count','Count'),(3376,'externalAccountHistory.title.summary','Transactions summary'),(3377,'accountFeeLog.status.ERROR','Error'),(3378,'transactionFee.f1','Value after 1 day'),(3379,'customField.member.showInPrint','Show in member print'),(3380,'login.memberUsername','Member login'),(3381,'reports.members_reports.credits','Credits'),(3382,'loan.status.REPAID','Repaid'),(3383,'permission.systemMemberPermissions.manage','Manage'),(3384,'receipt.posweb.transactions.noTransfers','No processed payments'),(3385,'currency.dRate.creationValue','D-Rate at unit creation'),(3386,'permission.adminMemberCards.block','Block'),(3387,'invoice.title.print','Invoice information'),(3388,'home.status.paymentsToAuthorize','There are {0} payments awaiting for your authorization'),(3389,'brokerCommissionContract.endDate.from','Ending from'),(3390,'transferType.showScheduledPaymentsToDestination','Show scheduled payments to destination'),(3391,'session.firstLogin','First time logged in'),(3392,'settings.local.maxImageSize','Max. image size'),(3393,'alert.system.indexRebuildStart','Search index rebuilding for {0} has started at {1}'),(3394,'reference.title.given','Given references by {0}'),(3395,'accountFeeLog.processedMembers','Processed members'),(3396,'customField.title.order.member','Set member custom field order'),(3397,'login.accessOptions','Access options'),(3398,'settings.access.allowMultipleLogins','Allow multiple logins for the same user'),(3399,'externalTransfer.type','Type'),(3400,'accountHistory.period.end','To date'),(3401,'customField.member.indexing.MEMBERS_AND_ADS','Both members and advertisements'),(3402,'transactionFee.toAllGroups','To all groups'),(3403,'transferType.action.new','Insert new transaction type'),(3404,'group.settings.passwordExpiresAfter.number','Login password expires after (amount)'),(3405,'transfer.hour','Hour'),(3406,'reports.stats.activity.singlePeriod.grossProduct.row2','Gross Product over all members'),(3407,'reports.stats.activity.singlePeriod.grossProduct.row1','Gross Product per earning member'),(3408,'rates.error.reinitValidation.noEditDuringRateReinit','You cannot start a new reinitialization job for rates if another is currently still running.'),(3409,'customField.operator.visibility.NOT_VISIBLE','Not visible'),(3410,'payment.action.cancel','Cancel payment'),(3411,'alert.system.accountFeeFinishedWithErrors','Account fee {0} has finished with {1} errors'),(3412,'scheduledPayments.title.list','Search scheduled payments'),(3413,'settings.local.csv.valueSeparator.TAB','Tabulation'),(3414,'fieldMapping.name','Name'),(3415,'conversionSimulation.result.name','Name'),(3416,'transfer.scheduledFor','Scheduled for'),(3417,'reports.stats.finances.ComparePeriods.income.title','Income Compare periods'),(3418,'paymentRequest.title.new.singleChannel','Request payment by {0}'),(3419,'permission.memberMessages.sendToAdministration','Send to administration'),(3420,'notificationPreferences.selectNone','None'),(3421,'transactionFee.aRateRelation.ASYMPTOTICAL','Asymptotical'),(3422,'payment.action.unblock','Unblock'),(3423,'general.error.csv.unknownColumn','Unknown column in CSV file: {0}'),(3424,'transfer.transactionNumber','Transaction number'),(3425,'notificationPreferences.enableSmsOperations','Enable SMS operations'),(3426,'groupFilter.customizedFiles.modified','The file has been modified for this group filter'),(3427,'invoice.performedBy','Performed by'),(3428,'permission.adminMemberSmsMailings.paidSmsMailings','Send paid mailings'),(3429,'settings.alert.receivedVeryBadRefs','Received very bad references'),(3430,'payment.actions','Actions'),(3431,'pos.status.ASSIGNED','Assigned'),(3432,'message.reply.subject','Re: {0}'),(3433,'menu.admin.alerts.system','System Alerts'),(3434,'loanGroup.action.viewLoans','View loans'),(3435,'changeGroup.error.remove.activeAdmin','An active admin cannot be removed.\nTry to move it to a REMOVED group'),(3436,'permission.adminMemberInvoices.deny','Deny invoice'),(3437,'category.status.INACTIVE','Inactive'),(3438,'memberImport.totalMembers','Total members'),(3439,'ad.publicationPeriod','Publication period'),(3440,'accountFee.title.history','Account fee history'),(3441,'image.caption','Caption'),(3442,'settings.type.LOCAL','Local settings'),(3443,'reports.stats.activity.throughTime.grossProduct.title','Gross Product per member through the time'),(3444,'card.new','Insert new card'),(3445,'cardType.cardSecurityCodeLength','Card security code length'),(3446,'reports.members.smsLog','Sent SMS messages'),(3447,'transactionFee.subject.FIXED_MEMBER','Fixed member'),(3448,'member.bulkActions.changeGroup.confirmation','Are you sure to change the group of all members matching the filters?'),(3449,'global.pagination.various.pages','{0} results. Jump to page:'),(3450,'smsLog.mailingType','Mailing type'),(3451,'account.reservedAmount','Reserved amount'),(3452,'reports.stats.general.graph.selectNone','Select no graphs'),(3453,'reports.stats.general.topten','Top ten'),(3454,'error.maxUploadSizeExceeded','Maximum upload size ({0}) exceeded'),(3455,'permission.adminMemberDocuments.manageStatic','Manage static documents'),(3456,'changePassword.error.mustIncludeLettersNumbers','The password must be composed of letters and numbers'),(3457,'paymentObligation.pack.totalAmount','Total Amount:'),(3458,'brokering.title.details','Member notes'),(3459,'menu.admin.accounts.details','System Accounts'),(3460,'brokerCommission.unsuspended','Tha broker commission was unsuspended'),(3461,'settings.mail.activationMessageWithPassword','Message when password is generated'),(3462,'loan.firstRepaymentDate','First repayment date'),(3463,'permission.adminMemberLoans.manageExpiredStatus','Manage expired loan status'),(3464,'errors.periodInvalidBounds','Begin date of {0} must be before end date'),(3465,'member.group','Permission group'),(3466,'infoText.validity','Validity'),(3467,'menu.operator.account.loans','Loans'),(3468,'error.unknownImageType','Unknown image type.\nRecognized formats are {0}'),(3469,'errors.greaterEquals','{0} must be greater than or equals to {1}'),(3470,'brokering.title.removeMember','Remove member'),(3471,'mobile.home','Home'),(3472,'adminTasks.indexes.type','Type'),(3473,'groupFilter.description','Description'),(3474,'menu.member.personal.references','References'),(3475,'guaranteeType.status','Status'),(3476,'settings.local.extraFunctions','Extra functions'),(3477,'alert.system.MAX_INCORRECT_LOGIN_ATTEMPTS','Max incorrect login attempts for invalid user'),(3478,'guarantee.authorizedBy','Authorized by'),(3479,'permission.systemExternalAccounts.process','Process Payment'),(3480,'permission.brokerMemberPayments.paymentAsMemberToSelf','Member self payment'),(3481,'guarantee.logs','Guarantee logs'),(3482,'mobile.credentials.LOGIN_PASSWORD','Password'),(3483,'permission.adminAdmins','Administrators'),(3484,'settings.local.charset','Character set'),(3485,'cardType.maxSecurityCodeTries','Max card security code error tries'),(3486,'receiptPrinterSettings.title.new','New receipt printer settings'),(3487,'card.member','Member'),(3488,'reports.stats.activity.comparePeriods.numberTransactions.yAxis','n Transactions'),(3489,'reports.stats.activity.topten.member','Member'),(3490,'customField.control.RADIO','Radio button'),(3491,'pos.status.PENDING','Pending'),(3492,'reports.members_reports.select_payment_filter','Select payment filter'),(3493,'profile.action.title','Actions for {0} '),(3494,'profile.userOnline','Is logged'),(3495,'permission.adminMemberGuarantees.cancelGuaranteesAsMember','Deny / Cancel guarantees'),(3496,'pos.unblocked','POS has been unblocked'),(3497,'menu.operator.help.manual','Manual'),(3498,'message.toGroups','To group(s)'),(3499,'reports.simulations.dRate.config.graph.title','D-rate configuration curve'),(3500,'general.error.accountStatusProcessing','Critical problem in account processing.\n\nPlease, contact the administration'),(3501,'loan.grant.manualDate','Grant date'),(3502,'guaranteeType.title.new','New guarantee type'),(3503,'settings.local.messageFormat','Message format'),(3504,'editCard.error.transactionPasswordPending','In order to edit your card, you need the transaction password, which can be generated in the <a class=\"default\" href=\"{0}\">home page</a>'),(3505,'reports.stats.groupfilter','Member filter'),(3506,'alert.member.NULL_IRATE','Unexpected null I-rate encountered'),(3507,'permission.adminMemberPos.changePin','Change PIN'),(3508,'settings.message.mail','Attributes for notifications sent by mail'),(3509,'certification.buyerUsername','Buyer login'),(3510,'translationMessage.import.file','Properties file'),(3511,'menu.member.broker.smsMailings','SMS mailings'),(3512,'permission.operatorGuarantees.issueCertifications','Issue certifications'),(3513,'menu.member.personal.profile','Profile'),(3514,'customField.possibleValue.default','Default'),(3515,'message.action.new','Send a new message'),(3516,'permission.memberPayments.chargeback','Chargeback received payment'),(3517,'customField.member.access.OTHER','Other members'),(3518,'brokerCommission.type.commissionContract','Commission contract'),(3519,'reference.feedbackReply','Seller reply'),(3520,'adminTasks.onlineState.setOnline','Set system online'),(3521,'externalTransferProcess.error.noLoanToDiscard','No open loan to be discarded'),(3522,'permission.systemReports','Reports'),(3523,'permission.brokerMembers.managePending','Manage pending members'),(3524,'permission.brokerCards.generate','Generate'),(3525,'error.queryParse','You have invalid keywords for the search'),(3526,'alert.type','Type'),(3527,'settings.message.subject','Subject'),(3528,'errorLog.removed','The selected error(s) have been removed'),(3529,'paymentObligation.pack.selection','To select a set of payment obligations you must filter by currency and buyer'),(3530,'permission.adminMemberPayments.paymentAsMemberToMember','Member to member payment'),(3531,'settings.file','File'),(3532,'permission.brokerMembers.changeProfile','Change profile'),(3533,'loan.queryStatus.ANY_OPEN','Any open'),(3534,'card.changeCardCode.newCode2','Confirm new card security code'),(3535,'permission.systemLoanGroups.view','View'),(3536,'card.changeCardCode.newCode1','New card security code'),(3537,'payment.title.brokerMemberToSystem','Payment from member {0} to system'),(3538,'customImage.system.previous','Previous page icon'),(3539,'conversionSimulation.result.total','Total'),(3540,'transferType.name','Name'),(3541,'menu.admin.guarantees.searchPaymentObligations','Payment Obligations'),(3542,'reports.current.show_btn','Show reports'),(3543,'customField.removeConfirmation','Remove this custom field?'),(3544,'reports.current.loans','Loans'),(3545,'receiptPrinterSettings.localPrinter.defaultBrowserPrinting','Default browser print'),(3546,'permission.adminMemberLoanGroups.manage','Manage'),(3547,'profile.action.manageLoans','View loans'),(3548,'brokering.status.PENDING','Awaiting activation'),(3549,'adminTasks.indexes.status','Status'),(3550,'customField.title.list.ad','Advertisement custom fields'),(3551,'guarantee.loan','View'),(3552,'ad.description.onlyNew','(only new ads are shown)'),(3553,'permission.systemStatus.viewConnectedAdmins','View connected admins'),(3554,'profile.action.viewBrokerings','Member list (as broker)'),(3555,'changePin.error.userBlocked','You have exceeded the allowed login password trials, and your login is now blocked'),(3556,'group.account.allAccountsOnGroup','All possible accounts are already associated the group '),(3557,'externalTransfer.status.COMPLETE_PENDING','Complete and pending'),(3558,'permission.brokerReports.showAccountInformation','Show account information'),(3559,'global.tooltip.edit','Modify'),(3560,'reports.simulations.choose.dRateConfig','D-rate configuration'),(3561,'loanPayment.summary.unrecoverablePayments','Unrecoverable payments'),(3562,'message.error.emailNotSent','The member could not receive message because of e-mail sending problems'),(3563,'menu.admin.translation.mails','E-Mails'),(3564,'permission.operatorAccount.simulateConversion','Simulate conversion'),(3565,'createAdmin.title','Register new administrator'),(3566,'card.action.block','Block'),(3567,'customizedFile.title.customize.help','Customize help file'),(3568,'activities.invoices','Invoices'),(3569,'loanGroup.removeConfirmation','Remove loan group?'),(3570,'mobile.home.reservedAmount','Reserved: {0}'),(3571,'changeGroup.error.move.hasOpenLoans','The member cannot be moved because it has unpaid loans'),(3572,'payment.title.memberToSelf','Transfer between my accounts'),(3573,'guarantee.inserted','Guarantee inserted'),(3574,'global.up','Up'),(3575,'transactionPassword.status.user.PENDING','Pending'),(3576,'guaranteeType.paymentObligationPeriod','Max period between obligations'),(3577,'externalTransfer.modified','External transfer modified'),(3578,'activities.brokering','Brokering'),(3579,'group.defaultSmsMessages','Default messages sent by SMS'),(3580,'accountFee.invoiceMode.NOT_ENOUGH_CREDITS','Only when member does not have enough credits'),(3581,'permission.adminAdminRemarks.manage','Manage'),(3582,'alert.system.ADMIN_LOGIN_BLOCKED_BY_TRIES','Max incorrect login attempts for admin'),(3583,'group.settings.showPosWebPaymentDescription','Show description field on PosWeb payment'),(3584,'invoice.error.sendingWithMultipleTransferTypesWithCustomFields','This invoice cannot be sent because there are multiple possible payment types with custom fields'),(3585,'menu.operator.guarantees.searchCertifications','Certifications'),(3586,'changeGroup.removedMember','The member is removed'),(3587,'transactionPassword.error.blockedByTrials','Your transaction password is now blocked.\nPlease, contact the administration.'),(3588,'message.messageBox.SENT','Sent items'),(3589,'alert.member.LOGIN_BLOCKED_BY_PERMISSION_DENIEDS','Member login temporarily blocked by permission denied'),(3590,'login.registration.text','You can register by clicking the button below.'),(3591,'reports.stats.activity.singlePeriod.grossProduct.title','Gross Product per member (single period)'),(3592,'reports.stats.taxes.singlePeriod.totalSum.title','Statistics on Taxes: Volume'),(3593,'memberRecordType.groups','Groups'),(3594,'reports.stats.activity.throughTime.loginTimes.title','Logins per member through the time'),(3595,'card.cardType','Card type'),(3596,'ad.tradeType','Type'),(3597,'accountFeeLog.status.PROCESSED','Processed'),(3598,'permission.operatorAds.publish','Publish'),(3599,'mobile.viewPayments.description','Desc.'),(3600,'accountFee.action.running','The account fee is now running'),(3601,'alert.member.ACCOUNT_ACTIVATION_FAILED','Activation of account failed'),(3602,'fieldMapping.removeConfirmation','Remove this field mapping?'),(3603,'permission.memberInvoices','Invoices'),(3604,'invoice.description','Description'),(3605,'certification.validity','Validity'),(3606,'permission.systemSettings.manageAlert','Manage alert settings'),(3607,'permission.systemAdminPermissions.manage','Manage'),(3608,'payment.title.sucessfulPayment','Successful payment'),(3609,'notificationPreferences.hasntEmail','You don\'t have an email address configured.'),(3610,'transactionFee.when.COUNT','Transactions'),(3611,'adImport.title.import','Import advertisements'),(3612,'customImage.system.quickAccess_messages','Quick access: messages'),(3613,'settings.message.sentInvoiceExpired','Sent invoice expired'),(3614,'adImport.status.TOO_MANY_CATEGORY_LEVELS','Too many category levels (max=3)'),(3615,'menu.operator.preferences.receiptPrinterSettings','Receipt printers'),(3616,'settings.log.scheduledTaskLevel.OFF','Off'),(3617,'changePin.error.transactionPasswordBlocked','In order to define the pin, you need the transaction password.\nHowever, your transaction password is blocked.\nPlease, contact the administration'),(3618,'group.settings.passwordExpiresAfter','Login password expires after'),(3619,'reports.simulations.dRate.config.graph.xAxis','D-rate (days)'),(3620,'member.id','Id'),(3621,'reference.level.BAD','Bad'),(3622,'serviceOperation.MANAGE_MEMBERS','Manage members'),(3623,'global.tooltip.permissions','Edit permissions'),(3624,'permission.adminMemberLoans.repay','Repay loan'),(3625,'paymentObligation.expirationDate','Expiration date'),(3626,'settings.message.newCommissionContract','New commission contract'),(3627,'loanPayment.status.EXPIRED','Expired'),(3628,'payment.title.systemMemberToMember','Payment from member {0} to another member'),(3629,'errorLog.stackTrace','Java error details'),(3630,'permission.systemChannels.manage','Manage'),(3631,'settings.access.allowOperatorLogin','Allow operator login'),(3632,'ticket.status.PENDING','Pending'),(3633,'transferType.description','Description'),(3634,'permission.adminMemberPos','POS'),(3635,'reports.stats.general.selectAny','Select none, one, or more'),(3636,'translationMessage.key','Key'),(3637,'customField.type.BOOLEAN','Boolean'),(3638,'smsMailing.error.variableNotFound','Couldn\'t find the following variables: {0}'),(3639,'permission.systemThemes','Themes'),(3640,'externalTransfer.comments','Import comments'),(3641,'customField.possibleValue.title','Values list'),(3642,'permission.adminMemberCards.unblock','Unblock'),(3643,'invoice.search.period.end','End date'),(3644,'global.ok','Ok'),(3645,'conversionSimulation.result.input.drate','Applied D-rate'),(3646,'sms.type.OPERATION_CONFIRMATION','Operation confirmation'),(3647,'guaranteeType.error.issueFeeTransferType','Issue fee transaction type is required'),(3648,'reports.members_reports.system_invoices.invoiceModeRequired','It\'s necessary to check at least one type (incoming / outgoing) of members invoices or system invoices'),(3649,'infoText.title.search','Search info texts'),(3650,'ad.new','Insert new advertisement'),(3651,'reports.stats.keydevelopments.transactionAmount.title','Developments in amount per transaction'),(3652,'paymentRequest.error.invalidChannel','The payment request could not be performed because the user {0} does not have the channel {1} enabled'),(3653,'profile.action.smsLogs','SMS logs'),(3654,'global.no','No'),(3655,'reports.simulations.aRate.config.combinedGraph','Fee percentage vs relative A-rate'),(3656,'menu.admin.accounts.transfersAwaitingAuthorization','To authorize'),(3657,'guarantee.action.deny','Deny'),(3658,'permission.operatorMessages.manage','Manage'),(3659,'help.title.guarantees','Guarantees'),(3660,'menu.operator.account.transfersAwaitingAuthorization','To authorize'),(3661,'payment.confirmation.deny','You are going to deny this payment.\n\nPlease click OK to confirm'),(3662,'reports.stats.activity.developments.percentageNoTraders','% of members not trading'),(3663,'externalTransferImport.date','Date'),(3664,'authorizationLevel.level','Level'),(3665,'payment.error.negativeFinalAmount','All applied fees are higher than your original transfer amount. Contact the administration on this.'),(3666,'memberImport.initialDebits','Initial debits'),(3667,'customField.validation.maxLength','Max. length'),(3668,'infoText.noMatch','Couldn\'t find any info text that matches the specified criteria.'),(3669,'memberPos.title','Member POS'),(3670,'customField.member.error.indexingVisibility','In order to include in keywords search, the field should be shown in profile for other members'),(3671,'scheduledPayment.amount','Amount'),(3672,'transferType.fields.action.link','Link existing custom field'),(3673,'paymentObligation.status.ACCEPTED','Accepted'),(3674,'mailPreferences.guarantees','Guarantees'),(3675,'card.changeSecurityCode.confirmation','Unblock card security code?'),(3676,'sms.type.PAYMENT_ERROR.description','Direct payment error'),(3677,'permission.adminMemberCards.activate','Activate'),(3678,'ad.status.ACTIVE','Active'),(3679,'ad.owner','Publisher'),(3680,'payment.error.authorizedInPast','It is not possible to perform an authorized payment in past date'),(3681,'brokerCommission.suspendConfirmation','Do you want to suspend this broker commission and the broker´s contracts related to it?'),(3682,'posweb.title.login','PosWeb login'),(3683,'messageCategory.title.insert','Insert new message category'),(3684,'brokering.change.confirmation','Are you sure to set {0} as broker of {1}?'),(3685,'menu.operator.account.systemPayment','System Payment'),(3686,'pos.description','Description'),(3687,'currency.pendingRateInitProgression','Rate reinitialization is being processed; currently processed up to'),(3688,'permission.brokerMemberRecords','Member records'),(3689,'invite.errorSending','Error sending mail to {0}'),(3690,'reports.stats.activity.throughTime.percentageNoTrade','Percentage of member not trading'),(3691,'externalTransferType.name','Name'),(3692,'permission.memberProfile.changeUsername','Change own login name'),(3693,'reports.stats.error.finalDateLesserThanInitialDate','Final date lesser than initial date'),(3694,'menu.admin.messages.messageCategory','Message Categories'),(3695,'message.rootType.SYSTEM','System'),(3696,'group.removed','The group was removed'),(3697,'sms.type.PAYMENT','Direct payment'),(3698,'payment.status.DENIED','Denied'),(3699,'changePin.newPinConfirmation','Confirm new pin'),(3700,'accountFee.action.cancel','Cancel'),(3701,'errors.passwords','Passwords are not Equal'),(3702,'permission.systemCardTypes.view','View card types'),(3703,'loan.status.DISCARDED','Externally repaid'),(3704,'reference.title.details.general','Reference details'),(3705,'global.error.nothingSelected','Nothing selected'),(3706,'externalTransfer.status.PENDING','Pending'),(3707,'fileMapping.className','Class name'),(3708,'settings.access.numericPassword','Numeric password'),(3709,'reports.stats.activity.histogram.logins.title','Logins per member, Histogram'),(3710,'reports.transactions_report.amount','Total amount'),(3711,'transfer.title.authorizations','Authorization actions'),(3712,'group.customizedFiles.removeConfirmation','Stop customizing this file?'),(3713,'global.weekDay.short.TUESDAY','Tue'),(3714,'memberRecordType.title.modify','Modify member record type'),(3715,'reports.stats.keydevelopments.title','Statistics of key developments...'),(3716,'customImage.name','Name'),(3717,'customField.type.DATE','Date'),(3718,'member.groupFilter','Group'),(3719,'menu.admin.bookkeeping.overview','External accounts'),(3720,'global.range','Range'),(3721,'smsMailing.systemName','System name'),(3722,'global.submit','Submit'),(3723,'reports.stats.activity.comparePeriods.grossProduct.row2.short','all'),(3724,'activities.loans.count','Open loans'),(3725,'memberImport.status.UNKNOWN_ERROR','Unknown error: {0}'),(3726,'guarantee.seller','Seller'),(3727,'invoice.error.noAccountType','There is no possible destination account type.\nPlease, contact the administration.'),(3728,'loanPayment.repaymentDate','Repayment'),(3729,'admin.group','Admin group'),(3730,'alert.member.BLOCKED_POS_USED','Attempt to use a POS device marked as blocked'),(3731,'group.settings.maxSchedulingPayments','Max. scheduling payments'),(3732,'customField.type','Data type'),(3733,'document.title.insert','Insert new document'),(3734,'invoice.sent','The invoice was sent'),(3735,'payment.error.relatesTo','The logged user is not related to member \'{0}\'.'),(3736,'generateCard.generateForMemberWithActiveCard','Generate for members with active card?'),(3737,'settings.message.value','Value'),(3738,'menu.admin.bookkeeping','Bookkeeping'),(3739,'settings.local.schedulingHour','Scheduled tasks hour'),(3740,'externalTransferType.title.insert','Insert payment type'),(3741,'brokerCommission.chargeStatus','Commissions charge status'),(3742,'permission.adminMemberInvoices.view','View member invoices'),(3743,'payment.title.systemToSystem','Transfer between system accounts'),(3744,'home.status.openLoans','You have {0} open loans'),(3745,'transactionFee.error.samePayerAndReceiver','Payer and receiver cannot be the same'),(3746,'permission.systemSettings.manageLog','Manage log settings'),(3747,'profile.action.grantLoan','Grant loan'),(3748,'smsMailing.text','Text'),(3749,'memberRecordType.action.new','Insert new member record type'),(3750,'createOperator.title','Create a new operator'),(3751,'help.title.registration','Member registration'),(3752,'permission.adminAdminRemarks','Remarks'),(3753,'reports.current.n_expads','Number of expired advertisements'),(3754,'transferType.to','To'),(3755,'createMember.captcha.invalid','You have not typed the image characters correctly'),(3756,'ad.category.choose','Choose a category'),(3757,'transactionFee.when.DAYS','Days'),(3758,'group.account.removeConfirmation','Remove the account from group?'),(3759,'payment.invalid.schedulingDate','The scheduling date must be before {0}'),(3760,'reports.stats.keyParams','Key Parameters'),(3761,'permission.memberProfile.changeName','Change own name'),(3762,'settings.local.dataDisplay','Data display'),(3763,'reports.stats.activity.throughTime.percentageNoTrade.title','Percentage of members not trading through the time'),(3764,'brokerCommissionContract.startDate.from','Starting from'),(3765,'settings.local.numberLocale.PERIOD_AS_DECIMAL','1,234.56'),(3766,'permission.adminMemberCards.view','View'),(3767,'menu.admin.settings.serviceClients','Web services clients'),(3768,'memberImport.status.MISSING_USERNAME','Username is missing'),(3769,'transactionFee.h','Maximum percentage'),(3770,'guarantee.removeConfirmation','Remove this guarantee?'),(3771,'changeGroup.member.title','Change group for member {0}'),(3772,'transferType.modified','The transaction type was modified'),(3773,'group.settings.maxImagesPerMember','Max profile images per member'),(3774,'transferType.conciliabled','Is conciliable'),(3775,'contactUs.message','In this page the administration can put some text and a mail address of the contact people of your organisation/project, by modifying the <i>contactUs.message</i> translation key.'),(3776,'externalAccount.title.overview','External accounts overview'),(3777,'transfer.relatedTransfers','Related transfers'),(3778,'permission.systemMemberRecordTypes','Member record types'),(3779,'certification.error.certificationActiveExists','An active certification issued to the selected buyer and with the same currency already exists.'),(3780,'customField.title.insert.memberRecord','New custom field for member record {0}'),(3781,'settings.message.certificationStatusChanged','Certification status changed'),(3782,'help.title.invoices','Invoices'),(3783,'serviceOperation.CHARGEBACK','Chargeback payments'),(3784,'memberPos.date','Assigned on'),(3785,'rates.reinit.reinit','Re-initialize?'),(3786,'accountHistory.conciliation.conciliated','Conciliated'),(3787,'externalTransferType.action.DISCARD_LOAN','Discard loan'),(3788,'payment.error.enoughCredits','Insufficient balance on {0}'),(3789,'alert.title.system','System alerts'),(3790,'transfer.chargeback.details','Show details'),(3791,'menu.member.personal.changePin','Change pin'),(3792,'guarantee.modified','The guarantee was modified'),(3793,'reports.stats.general.singlePeriod','One period'),(3794,'customField.operator.visibility.VISIBLE_NOT_EDITABLE','Visible and not editable'),(3795,'group.title.settings.notifications','Notification settings'),(3796,'webshop.error.ticket','Ticket not found'),(3797,'reference.summary.allTime','All time'),(3798,'group.settings.smsShowFreeThreshold','Show free SMS only if below'),(3799,'brokerCommissionContract.acceptConfirmation','Accept this broker commission contract?'),(3800,'paymentObligation.buyerName','Buyer name'),(3801,'menu.admin.translation.file','Import / Export'),(3802,'customField.operator.visibility.EDITABLE','Visible and editable'),(3803,'account.aRate','A rate'),(3804,'groupFilter.customizedFiles.action.new','Customize new file'),(3805,'settings.mail.subject','Subject'),(3806,'guarantee.automaticLoanAuthorization','Authorize loan automatically'),(3807,'permission.memberAdInterests.manage','Manage'),(3808,'permission.adminMemberInvoices','Member invoices'),(3809,'transferAuthorization.showToMember','Show to member'),(3810,'permission.brokerMemberAccess','Access'),(3811,'reports.stats.warning','Warning: Statistical calculations can be very heavy, and may take quite some time.  '),(3812,'permission.memberProfile','Member profile'),(3813,'externalTransferType.description','Description'),(3814,'externalTransferImport.error.format.general','Error importing transactions: {0}'),(3815,'receiptPrinterSettings.modified','The local print method was modified'),(3816,'loan.monthlyInterestRepaymentType','Monthly interest repayment type'),(3817,'loan.expirationDailyInterest','Expiry interest'),(3818,'loan.showProjection','Show'),(3819,'settings.access.loginRegex','Regular expression for login name'),(3820,'group.settings.smsCustomContext','Use a class to customize the SMS context'),(3821,'pos.remove.confirmation','Are you sure you want to remove this POS?'),(3822,'card.status.ACTIVE','Active'),(3823,'currency.dRate.minimalD','Minimal D'),(3824,'paymentFilter.description','Description'),(3825,'guarantee.emissionDate','Emission date'),(3826,'customField.ad.visibility.BROKER','Brokers and administrators'),(3827,'cardType.title.list','Card Types'),(3828,'permission.brokerCards.block','Block'),(3829,'mailPreferences.title','E-mail notifications'),(3830,'changePassword.modified','The password was modified'),(3831,'transferType.from','From'),(3832,'global.quarter.FIRST','First quarter'),(3833,'brokerCommissionContract.error.conflictingContract','There is already an active or pending contract whose period is conflicting whith this contract\'s period'),(3834,'smsLog.free','Free'),(3835,'cardType.cardSecurityCode.AUTOMATIC','Automatic'),(3836,'alert.system.applicationShutdown','Application shutdown'),(3837,'settings.message.setting','Setting name'),(3838,'settings.access.administrationWhitelist','Admin. access whitelist'),(3839,'posLog.memberPosStatus','Member POS status'),(3840,'guaranteeType.error.forwardTransferType','Forward transaction type is required'),(3841,'messageCategory.name','Name'),(3842,'permission.systemServiceClients.view','View'),(3843,'operator.email','E-mail'),(3844,'settings.log.restFile','REST services logfile path / name'),(3845,'reports.stats.activity.histogram.logins.xAxis','Logins / member'),(3846,'mailPreferences.newPendingPayments','New payment awaiting authorization'),(3847,'reports.current.n_permads','Number of permanent advertisements'),(3848,'payment.action.authorize','Authorize'),(3849,'accountFee.paymentDirection','Payment direction'),(3850,'reports.stats.choose.keydevelopments','Key developments'),(3851,'permission.adminMemberAccess.disconnect','Disconnect logged member'),(3852,'permission.systemAdminGroups.manageAdminCustomizedFiles','Manage customized files'),(3853,'transactionFee.chargeType.D_RATE','D-rate'),(3854,'permission.operatorReferences.view','View'),(3855,'adCategory.import.error.noFile','Please, select a file to import the categories'),(3856,'permission.adminMemberBrokerings','Brokerings'),(3857,'reports.stats.activity.developments.grossProduct','Gross Product'),(3858,'reports.stats.keydevelopments.numberOfAds','Number of ads'),(3859,'permission.brokerDocuments.viewMember','View member individual documents'),(3860,'reports.stats.activity.singlePeriod.loginTimes','Login times per member'),(3861,'guaranteeType.model.WITH_BUYER_AND_SELLER','With buyer and seller'),(3862,'customField.pattern','Input pattern'),(3863,'permission.adminMemberInvoices.sendAsMemberToSystem','Send as member to system'),(3864,'reports.stats.activity.singlePeriod.grossProduct.row2.short','all'),(3865,'notificationPreferences.smsHeading','SMS messages'),(3866,'reports.stats.general.sum','Sum'),(3867,'alert.system.rateInitializationFailed','Rate initialization job on currency {0} failed at transaction id {1} due to an exception raised.\nSee the error log for details.'),(3868,'brokerCommissionContract.endDate.to','to'),(3869,'paymentObligation.date','Date'),(3870,'menu.admin.usersGroups.membersBulkAction','Bulk actions'),(3871,'brokering.status.COMMISSION_COMPLETE','Commission ended'),(3872,'document.currentFileLink','{0} ({1})'),(3873,'permission.adminMemberLoans.discard','Discard loan'),(3874,'permission.adminMemberAccess.changePassword','Change login password'),(3875,'groupFilter.title.modify','Modify group filter'),(3876,'permission.operatorInvoices.manage','Manage'),(3877,'paymentFilter.showInAccountHistory','Show in account history'),(3878,'customField.type.MEMBER','Member'),(3879,'permission.systemExternalAccounts','External Accounts (bookkeeping)'),(3880,'authorizationLevel.error.adminGroupRequired','If the authorizer is an admin, it\'s necessary to choose admin groups'),(3881,'loan.queryStatus.ANY_CLOSED','Any closed'),(3882,'transferType.availability.SELF_PAYMENT','Self payment'),(3883,'global.back','Back'),(3884,'customField.moveValue.confirmation','You are going to replace all occurrences of {0} by {1}.\n\nPlease click OK to confirm'),(3885,'paymentRequest.title.new','Request payment'),(3886,'fileMapping.stringQuote','String quote'),(3887,'reports.stats.finances.expenditure','Expenditure'),(3888,'ad.category.title.order','Set ad category order'),(3889,'accountOverview.title.of','Accounts of {0}'),(3890,'paymentFilter.selectPaymentFilters','Select payment filters'),(3891,'group.settings.passwordTries.deactivationTime.number','Deactivation time (amount) after max password tries  '),(3892,'global.datePattern.year','yyyy'),(3893,'currency.aRate.creationValue','A-Rate at unit creation'),(3894,'reports.members.broker','Broker'),(3895,'serviceClient.address','Internet address'),(3896,'fileMapping.numberFormat.WITH_SEPARATOR','With separator'),(3897,'adImport.status.PUBLICATION_BEGIN_AFTER_END','Publication begin date is after the end date'),(3898,'group.details','Group details'),(3899,'adImport.lineNumber','Line #'),(3900,'receipt.transfer.date','Date: {0}'),(3901,'customImage.title.system.update','Update system image'),(3902,'settings.message.adminSystemInvoice','System invoice'),(3903,'loanPayment.date','Date'),(3904,'reports.stats.activity.topten.login','Logins'),(3905,'changeGroup.error.remove.activeOperator','The operator cannot be permanently removed because he/she has already been active on the system.\nInstaed of permanently removing, you can create a removed group and moving the operator to it'),(3906,'settings.message.adminSystemAlert','System alerts'),(3907,'scheduledPayments.title.print','Scheduled payments'),(3908,'permission.memberOperators','Operators'),(3909,'reports.transactions_report.member_to_system_invoices','{0} of member to system invoices'),(3910,'accountOverview.title.my','My accounts'),(3911,'menu.admin.usersGroups.messageToGroups','Group Message'),(3912,'settings.message.transactionFeedbackReceived','Transaction feedback received'),(3913,'receipt.transfer.to','To: {0}'),(3914,'guaranteeType.error.creditFeeTransferType','Credit fee transaction type is required'),(3915,'document.removeConfirmation','Remove document?'),(3916,'defaultBrokerCommission.title.my','Commission settings'),(3917,'transactionPassword.AUTOMATIC','Automatic'),(3918,'loan.calculate','Calculate'),(3919,'message.action.choose','Apply action to selected messages...'),(3920,'group.settings.passwordTries.maximum','Max password tries'),(3921,'settings.local.maxImageWidth',''),(3922,'guaranteeType.name','Name'),(3923,'menu.admin.translation.internalMessages','Notifications'),(3924,'guarantee.status.CANCELLED','Cancelled'),(3925,'guaranteeType.answerTodayMessage','0 means must answer in the day'),(3926,'notificationPreferences.disableSms','Disable SMS'),(3927,'invoice.search.direction.INCOMING','Incoming'),(3928,'receiptPrinter.error.ie','Local receipt printing is not supported under Microsoft Internet Explorer. Please, use a recent version of either Mozilla Firefox, Google Chrome or Opera.'),(3929,'customField.type.URL','URL'),(3930,'permission.systemAlerts.manageMemberAlerts','Manage member alerts'),(3931,'message.sent','The message was successfully sent'),(3932,'translationMessage.removeSelected.confirm','Please confirm to remove the selected translation key(s)?'),(3933,'brokerCommission.error.unsuspending','Error unsuspeding the broker commission!'),(3934,'loan.changedExpiredStatus','The loan has been marked as \'{0}\''),(3935,'reports.stats.activity.comparePeriods.percentageNoTrade.yAxis','% not trading'),(3936,'permission.brokerMembers.manageDefaults','Manage default commissions'),(3937,'invite.title','Invite'),(3938,'global.tooltip.print','Printable results'),(3939,'global.month.AUGUST','August'),(3940,'paymentObligation.status','Status'),(3941,'reports.stats.general.graph.allGraphs','Show all graphs'),(3942,'virtualKeyboard.contrast','Contrast'),(3943,'group.settings.externalAdPublication.ALLOW_CHOICE','Allow choice'),(3944,'permission.memberReferences.give','Give'),(3945,'settings.mail.resetPassword','Reset password mail'),(3946,'category.children','Subcategory'),(3947,'notificationPreferences.allowChargingSms','Allow charging for SMS message'),(3948,'certification.buyer','Buyer'),(3949,'quickAccess.searchMembers','Members'),(3950,'changeGroup.admin.changed','The administrator\'s group was changed'),(3951,'document.nature','Type'),(3952,'fileMapping.fields.title','File mapping fields'),(3953,'member.bulkActions.channelsChangedForAll','All members matching the filter ({0}) were changed.'),(3954,'memberImport.status.INVALID_CUSTOM_FIELD_VALUE_MIN_LENGTH','{0} is invalid: the minimum length is {1}.'),(3955,'customizedFile.type.HELP','Help'),(3956,'customizedFile.originalContents','Original contents'),(3957,'global.datePattern.second','ss'),(3958,'group.title.settings','Group settings'),(3959,'message.type','Type'),(3960,'fieldMapping.memberField','Member field'),(3961,'document.title.select.of','Print document for {0}'),(3962,'settings.log.webServiceLevel.DETAILED','Detailed tracing (detailed parameters)'),(3963,'customizedFile.type.STYLE','Style'),(3964,'paymentObligation.title.modify','Modify payment obligation'),(3965,'guarantee.status.WITHOUT_ACTION','Without action'),(3966,'brokering.loans.amount','Total loan remaining amount'),(3967,'alert.member.scheduledPaymentFailed','A scheduled payment of {0}, with type {1} has failed'),(3968,'permission.brokerReferences','References'),(3969,'guaranteeType.feeType.PERCENTAGE','%'),(3970,'permission.systemAccountFees','Account fees'),(3971,'receipt.posweb.transactions.scheduledPayment','{0} {1} {2} {3} {4}'),(3972,'invoice.destinationAccountType','Account destination'),(3973,'loan.title.search.of','Loans of {0}'),(3974,'global.amount.type.PERCENTAGE','%'),(3975,'changeBroker.title.history','History'),(3976,'fieldMapping.title.modify','Modify field mapping'),(3977,'group.settings.externalAdPublication','Advertisement external publication'),(3978,'customImage.system.quickAccess_accountInfo','Quick access: account information'),(3979,'permission.memberAds','Ads'),(3980,'document.title.select.my','Documents'),(3981,'login.error.blocked','Your login is now temporarily blocked'),(3982,'errorLog.removeSelected.confirm','Remove the selected error log entries?'),(3983,'changeChannels.enableChannels','Enable channels'),(3984,'admin.action.create','Create administrator'),(3985,'account.owner','Owner'),(3986,'customField.ad.showInSearch','Show in search'),(3987,'authorizationLevel.removed','Authorization level removed'),(3988,'settings.message.referenceReceived','Reference receiving'),(3989,'permission.memberLoans.view','View'),(3990,'permission.memberReceiptPrinterSettings.manage','Manage receipt printer'),(3991,'theme.style.MAIN','System'),(3992,'invoice.status.ACCEPTED','Accepted'),(3993,'permission.systemErrorLog.manage','Manage'),(3994,'pos.title','POS'),(3995,'customImage.system.preview','Preview icon'),(3996,'reports.members.date.current','Current Time'),(3997,'reports.simulations.dRateConfigSimulation.title','D-rate Configuration Simulation'),(3998,'loan.title.search.my','My loans'),(3999,'settings.message.guaranteeStatusChanged','Guarantee status changed'),(4000,'settings.log.scheduledTaskLevel.DETAILED','Detailed execution'),(4001,'payment.error.manageRelates','The logged user needs to manage one of the payment\'s parts and be related to the other.'),(4002,'guarantee.action.delete','Delete'),(4003,'paymentObligation.error.certificationValidityExceeded','One or more selected obligations expire after the certification\'s validity ({0} -  {1}).'),(4004,'guaranteeType.action.select','Register guarantee'),(4005,'document.action.new.member','New member document'),(4006,'cardLog.by','Changed by'),(4007,'loan.grant.confirmation.fees','If you grant this loan, the following fees will be applied:'),(4008,'permission.operatorInvoices','Invoices'),(4009,'error.ajax','There was an error while processing your request'),(4010,'mobile.login.password','Watchword'),(4011,'translationMessage.search.showOnlyEmpty','Only empty values'),(4012,'reports.stats.activity.singlePeriod.loginTimes.row1','Login times per member'),(4013,'memberPos.status.PIN_BLOCKED','Blocked PIN'),(4014,'guarantee.status.ACCEPTED','Accepted'),(4015,'member.bulkActions.brokerChanged','{0} members were changed to broker {2}.\n{1} members were not changed because they already had {2} as broker'),(4016,'menu.operator.personal','Personal'),(4017,'settings.log.traceLevel.DETAILED','Detailed tracing (including parameters)'),(4018,'settings.local.decimalInputMethod','Decimal numbers input method'),(4019,'group.customizedFiles.title.new','Customize new file for {0}'),(4020,'pos.actions.discard','Discard'),(4021,'loanPayment.summary.discardedPayments','Discarded payments'),(4022,'paymentObligation.title.selectPaymentObligation','Select payment obligations'),(4023,'receiptPrinterSettings.printerName','Local printer name'),(4024,'conversionSimulation.result.feelessAmount','Resulting amount'),(4025,'permission.adminMemberBrokerings.manageCommissions','Manage commissions'),(4026,'settings.local.csv.stringQuote.SINGLE_QUOTE','Single quote'),(4027,'image.file','File'),(4028,'pos.actions.block','Block'),(4029,'menu.operator.account','Account'),(4030,'reports.stats.activity.comparePeriods.grossProduct.row2','Gross Product over all members'),(4031,'reference.paymentDatails','Payment details'),(4032,'reports.stats.activity.comparePeriods.grossProduct.row1','Gross Product per member with income'),(4033,'rates.message.initializationAlreadyRunning','A Rate initialization job is currently running on this currency.\nThis means that the currency cannot be modified.\nWatch the system alerts to find out when the job is finished.'),(4034,'permission.brokerReports.view','View'),(4035,'transferType.minAmount','Min amount'),(4036,'reports.current.n_enabled','Number of enabled Members'),(4037,'reports.stats.activity.keyParams','Key parameters for activity'),(4038,'customField.member.access.BROKER','Broker'),(4039,'menu.member.account.transfersAuthorizations','Authorization history'),(4040,'permission.systemTranslation.manageNotification','Notification'),(4041,'pos.status.BLOCKED','Blocked'),(4042,'accountFee.lastExecution','Last execution'),(4043,'member.memberName','Member name'),(4044,'permission.systemLoanGroups','Loan groups'),(4045,'profile.action.manageCards','Manage cards'),(4046,'errorLog.removeOne.confirm','Remove this error log entry?'),(4047,'fileMapping.resetConfirmation','Reset file mapping?'),(4048,'errorLog.search.date.end','End data'),(4049,'permission.operatorGuarantees.sellWithPaymentObligations','Sell with payment obligations'),(4050,'cardType.error.removing','The card type could not be removed because it belongs to at least one group or there is at least one card associated'),(4051,'transactionFee.chargeType.FIXED','Fixed value'),(4052,'receiptPrinter.error.noConfiguration','No receipt printer configuration found'),(4053,'ad.inserted','Advertisement inserted'),(4054,'message.action.DELETE','Remove permanently'),(4055,'cardType.inserted','The card type was inserted'),(4056,'registrationAgreement.error.removing','The registration agreement could not be removed. \n\nIt is either in use by a group or already accepted by members in past'),(4057,'menu.admin.reports.members','Member reports'),(4058,'settings.error.importing','Error importing settings file'),(4059,'reports.current.invoices.MEMBER.count','Number of member invoices'),(4060,'image.removed','Image removed'),(4061,'memberImport.title.details.all','All imported members'),(4062,'permission.brokerMemberPayments.paymentAsMemberToMember','Payment as member to member'),(4063,'permission.brokerPos.view','View'),(4064,'menu.member.preferences.receiptPrinterSettings','Receipt printers'),(4065,'transfer.type','Transaction type'),(4066,'editCard.error.transactionPasswordBlocked','In order to edit  your card, you need the transaction password.\nHowever, your transaction password is blocked.\nPlease, contact the administration'),(4067,'admin.title.search','Search administrators'),(4068,'settings.message.messageMailSubjectPrefix','Mail subject prefix'),(4069,'channel.credentials','Credentials'),(4070,'global.datePattern.month','mm'),(4071,'infoText.title.new','New info text'),(4072,'permission.systemReports.memberList','Member lists'),(4073,'alert.title.search','Alerts history'),(4074,'customField.control.SELECT','Select box'),(4075,'settings.local.sms.sendSmsWebServiceUrl','Send SMS Web Service URL'),(4076,'permission.systemThemes.import','Import'),(4077,'pin.unblock.button','Unblock pin'),(4078,'payment.performed','The payment has been performed'),(4079,'reports.stats.choose.activity','Activity of members'),(4080,'customField.memberRecord.brokerAccess.READ_ONLY','Read only'),(4081,'adInterest.category','Ad category'),(4082,'settings.message.adminPendingBuyerOnlyGuarantee','Guarantee awaiting authorization (only buyer)'),(4083,'global.textFormat.PLAIN','Plain text'),(4084,'ad.publicationPeriod.begin','Publication date'),(4085,'reports.members_reports.account_type.all','All account types'),(4086,'mobile.credentials.PIN','PIN'),(4087,'reports.stats.activity.singlePeriod.percentageNoTrade.yAxis','% not trading'),(4088,'menu.operator.member.messages','Messages'),(4089,'help.title.advertisements','Advertisements'),(4090,'customImage.title.style','Style sheet images'),(4091,'receipt.posweb.transactions.transfers','Processed payments'),(4092,'message.type.GUARANTEE','Guarantees'),(4093,'loanGroup.name','Group name'),(4094,'menu.admin.reports.statistics','Statistical analysis'),(4095,'changeGroup.action.remove','Remove permanently'),(4096,'activities.brokering.numberMembers','Brokered members'),(4097,'accountType.inserted','The account type was inserted'),(4098,'adInterest.type.OFFER','Offer'),(4099,'menu.admin.personal','Personal'),(4100,'menu.member.preferences.notifications','Notifications'),(4101,'reports.stats.general.growth','Growth'),(4102,'reports.stats.activity.singlePeriod.percentageNoTrade','Percentage of members not trading'),(4103,'authorizationLevel.action.new','New authorization level'),(4104,'operator.username','Operator login'),(4105,'reports.stats.keydevelopments.highestAmountPerTransaction','Highest amount per transaction'),(4106,'menu.member.help','Help'),(4107,'message.rootType','Type'),(4108,'messageCategory.title.list','Message categories'),(4109,'permission.adminMemberReports.view','View'),(4110,'menu.admin.usersGroups.members','Manage Members'),(4111,'reports.stats.keydevelopments.throughTime.YEAR','Each year'),(4112,'serviceClient.channel','Channel'),(4113,'memberImport.initialCredits','Initial credits'),(4114,'transactionFee.inserted','The transaction fee was inserted '),(4115,'invoice.title.of','Invoices of {0}'),(4116,'menu.admin.accounts.transfersAuthorizations','Authorization history'),(4117,'permission.brokerRemarks','Remarks'),(4118,'permission.adminMemberInvoices.accept','Accept invoices'),(4119,'pos.actions.unblock','Unblock'),(4120,'home.status.title','Status'),(4121,'reports.members.accounts','Accounts'),(4122,'guarantee.paymentObligationList','Payment obligation list'),(4123,'settings.message.invoiceAccepted','Invoice accepted'),(4124,'changeBroker.old','Old broker'),(4125,'pos.unassigned','The POS was unassigned'),(4126,'menu.member.preferences','Preferences'),(4127,'transactionFee.invalidChargeValue',' {0} (Charge value)'),(4128,'operator.search.noResults','No matching operators found'),(4129,'global.weekDay.short.WEDNESDAY','Wed'),(4130,'global.percentPerDay','% / day'),(4131,'invoice.title.my','My invoices'),(4132,'customField.validation.required','Required'),(4133,'adImport.status.MISSING_OWNER','Missing owner member'),(4134,'externalTransferType.action.new','Insert new payment type'),(4135,'paymentObligation.inserted','The payment obligation was inserted'),(4136,'menu.admin.usersGroups.memberRecordTypes','Member record types'),(4137,'memberRecord.date','Created at'),(4138,'permission.adminMemberBulkActions.changeBroker','Change broker'),(4139,'externalTransferImport.error.removing','The transaction import could not be removed, because it has checked or processed transactions'),(4140,'sms.error.type.ALLOW_CHARGING_DISABLED','No free SMS left, adittional SMS charging is disabled'),(4141,'customField.title.list.operator','Operator custom fields'),(4142,'document.action.new.static','New static document'),(4143,'adCategory.inserted','The category was inserted'),(4144,'transfer.aRate','A-rate'),(4145,'settings.access.transactionPasswordChars','Possible characters in transaction password'),(4146,'permission.adminMemberRecords.delete','Delete'),(4147,'group.settings.defaultMailMessages','Default messages sent by mail'),(4148,'posweb.searchTransactions.title.scheduledPayments','Scheduled payments'),(4149,'transactionPassword.status.user.BLOCKED','Blocked'),(4150,'customImage.system.message_removed','Message on trash icon'),(4151,'reports.stats.activity.comparePeriods.numberTransactions.title','Number of Transactions per member (comparing two periods)'),(4152,'memberImport.status.INVALID_CREATION_DATE','Invalid creation date: {0}'),(4153,'reports.stats.period.periodCompared','Period to compare with'),(4154,'activities.invoices.outgoing.amount','Outgoing amount'),(4155,'global.month.JANUARY','January'),(4156,'permission.module.type.BROKER','Broker permissions of {0}'),(4157,'reports.stats.choose.balances','Balances'),(4158,'currency.pattern','Pattern'),(4159,'card.updateCard.error.userBlocked','You have exceeded the allowed login password trials, and your login is now blocked'),(4160,'error.general','An internal error in the Application occured'),(4161,'sms.type.GENERAL.description','General'),(4162,'permission.memberPreferences.manageAdInterests','Manage ad interests'),(4163,'guarantee.action.cancel','Cancel'),(4164,'translationMessage.import.error.noFile','Please, select the properties file'),(4165,'reports.members.download_btn','Download report'),(4166,'permission.systemPayments.payment','System payment'),(4167,'account.balance','Account balance'),(4168,'global.textFormat.RICH','Rich text'),(4169,'menu.operator.help','Help'),(4170,'serviceOperation.MEMBERS','Search members'),(4171,'login.operator.form.text','If you are a registered operator, you can login with the member\'s username, your username and password below.'),(4172,'reports.stats.finances.ComparePeriods.expenditure.yAxis','Expenditure'),(4173,'brokerCommissionContract.inserted','The broker commission contract was inserted'),(4174,'groupFilter.customizedFiles.noResults','This group filter has no customized files'),(4175,'reports.stats.keydevelopments.transactionAmount.median','Transaction amount'),(4176,'paymentObligation.error.maxPublicationDateAfterExpirationDate','The max. publication date can not be after the expiration date'),(4177,'guarantee.expiresTo','Expires to'),(4178,'quickAccess.messages','Messages'),(4179,'alert.system.ACCOUNT_FEE_RECOVERED','Account fee recovered'),(4180,'settings.local.memberResultDisplay.USERNAME','Member login name'),(4181,'member.action.create.selectGroup','Select member group'),(4182,'reports.stats.keydevelopments.throughTime.alert','You can only select the item \"through time\" in combination with other items.'),(4183,'settings.type.MAIL_TRANSLATION','E-mails'),(4184,'receiptPrinterSettings.remove.confirm','Are you sure to remove this receipt printer settings?'),(4185,'posweb.client.username','Client login'),(4186,'guaranteeType.status.ENABLED','Enabled'),(4187,'settings.message.pendingBuyerOnlyGuaranteeIssuer','Guarantee awaiting authorization (only buyer)'),(4188,'permission.adminMemberLoans.viewAuthorized','View authorized loans'),(4189,'loanGroup.removed','The loan group was removed'),(4190,'reports.stats.activity.topten.numberTransactions.col1','Number of transactions'),(4191,'receiptPrinterSettings.created','The receipt printer settings were created'),(4192,'permission.adminAdmins.changeProfile','Change profile'),(4193,'transactionPassword.error.generating','An error occurred while generating the transaction password.\nPlease, try again later'),(4194,'permission.operatorPayments.authorize','Authorize or deny'),(4195,'guaranteeType.status.DISABLED','Disabled'),(4196,'settings.local.decimalInputMethod.LTR','Left to right (the decimal separator must be typed)'),(4197,'document.currentFile','Current file'),(4198,'createMember.registrationAgreementButton','I accept the above registration agreement'),(4199,'loan.grant.confirmation.group','You are goint to grant a loan of {0} to group {1}, having {2} as responsible.{3}\n\nPlease, click OK to proceed'),(4200,'admin.name','Full name'),(4201,'loan.status.AUTHORIZATION_DENIED','Autorization denied'),(4202,'permission.adminMembers.managePending','Manage pending members'),(4203,'permission.operatorMessages.view','View'),(4204,'reports.stats.finances.ComparePeriods.income','Income'),(4205,'alert.system.newVersionOfHelpFile','There is a new version of a customized help file, {0}.\nPlease, check the customization in order to resolve possible conflicts'),(4206,'global.choose','Choose ...'),(4207,'loan.queryStatus.IN_PROCESS','In process'),(4208,'permission.memberAds.publish','Publish'),(4209,'global.preview','Preview'),(4210,'externalAccount.title.modify','Modify external account'),(4211,'guaranteeType.removeConfirmation','Remove guarantee type?'),(4212,'menu.admin.ads','Advertisements'),(4213,'permission.adminMembers.changeProfile','Change profile'),(4214,'profile.action.accountInformation','Account information'),(4215,'theme.title','Title'),(4216,'reports.stats.choose.finances','Finances'),(4217,'guarantee.issuerUsername','Issuer login'),(4218,'conversionSimulation.result','Conversion Simulation Results'),(4219,'memberImport.status.BALANCE_UPPER_THAN_CREDIT_LIMIT','The balance is upper than the credit limit'),(4220,'loan.grant.confirmation.member','You are goint to grant a loan of {0} to {1}.{2}\n\nPlease, click OK to proceed'),(4221,'profile.action.creditLimit','Set credit limit'),(4222,'settings.log.restLevel','REST services log level'),(4223,'transactionFee.chargeType.PERCENTAGE','Percentage'),(4224,'accountHistory.title.of','Search transactions of {0} on {1}'),(4225,'brokerCommissionContract.action.selectBrokerCommission','Select commission type'),(4226,'reports.print.limitation','The report has been limited to {0} rows.'),(4227,'paymentObligation.registrationDate','Registration date'),(4228,'sms.type.ACCOUNT_DETAILS.description','Account details'),(4229,'permission.adminMemberInvoices.acceptAsMemberFromMember','Accept invoice from member as member'),(4230,'loan.title.print','Loans search result'),(4231,'conversionSimulation.amount','Amount to convert'),(4232,'settings.local.maxAjaxResults','Max. Ajax results'),(4233,'customImage.removeConfirmation','Remove this image?'),(4234,'ad.title.search','Search for products and services'),(4235,'changePassword.oldPassword','Current password'),(4236,'reports.simulations.choose.aRateConfig','A-rate configuration'),(4237,'accountHistory.title.my','Search transactions on {1}'),(4238,'menu.admin.guarantees.searchGuarantees','Guarantees'),(4239,'image.details.success','The image details were successfully saved'),(4240,'registrationAgreement.removed','The registration agreement was removed'),(4241,'help.title.loan_groups','Loan groups'),(4242,'transferType.error.removing','This transaction type cannot be removed because there are related fees or transactions of this type '),(4243,'channel.removed','The channel was removed'),(4244,'group.title.settings.payments','Payment settings'),(4245,'smsLog.status.DELIVERED','Delivered'),(4246,'defaultBrokerCommission.validity','Validity'),(4247,'permission.brokerCards.unblockSecurityCode','Unblock card security code'),(4248,'customField.title.modify.loanGroup','Modify loan group custom field'),(4249,'payment.error.pendingCommissionContract','The payment could not be processed because there is a pending commission contract related to the commission: {0}'),(4250,'accountFee.title.logDetails','Account fee execution details'),(4251,'sms.type.ACCOUNT_DETAILS_ERROR.description','Account details error'),(4252,'image.details','Details'),(4253,'reports.simulations.aRateConfigSimulation.range.percentUnits','% of total guarantee period'),(4254,'reports.stats.taxes.totalSum','Total Sum'),(4255,'settings.local.internationalization','Internationalization'),(4256,'image.error.removing','The image could not be removed'),(4257,'brokerCommissionContract.denyConfirmation','Deny this broker commission contract?'),(4258,'reports.simulations.dRate.config.graph','Fee percentage vs D-rate'),(4259,'global.iRate.steps','steps'),(4260,'accountType.removed','The account was removed'),(4261,'transactionFee.finalAmount','Amount less or equals'),(4262,'card.updateCard.cardCodesAreNotEqual','The card codes are not equals'),(4263,'menu.admin.accessDevices','Access Devices'),(4264,'settings.message.invoiceCancelled','Invoice cancelled'),(4265,'pos.error.posIdExists','The identifier already exists. Please select another.'),(4266,'permission.brokerMembers.register','Register'),(4267,'reports.stats.transferTypeFilter','Transfer type filter'),(4268,'changePassword.forceChange','Force change on next login'),(4269,'changePin.error.mustBeNumeric','The pin can only contain numbers'),(4270,'settings.message.invoiceDenied','Invoice denied'),(4271,'help.title.transaction_feedback','Transaction feedback'),(4272,'channel.errorRemoving','The channel couldn\'t be removed'),(4273,'profile.action.brokeringActions','Brokering'),(4274,'transactionFee.brokerGroups','Broker groups'),(4275,'externalTransferProcess.confirmation','You are going to process the selected payments.\n\nAre you sure?'),(4276,'serviceClient.ignoreRegistrationValidations','Ignore e-mail and custom field validations'),(4277,'customizedFile.modified','The file was modified'),(4278,'help.title.bookkeeping','Bookkeeping'),(4279,'login.error.inactive','Your account has not yet been activated.\nPlease, contact the administration.'),(4280,'settings.message.adminNewPendingPayment','New payment for admin to authorize'),(4281,'reference.title.transactionFeedbacks.of','{0}\'s transaction feedbacks'),(4282,'transactionFee.deductAmount.true','Deduct from total amount'),(4283,'reports.stats.activity.comparePeriods.grossProduct.row1.short','with income'),(4284,'reports.simulations.aRateConfigSimulation.endA','End at A ='),(4285,'channel.displayName','Display name'),(4286,'registrationAgreement.new','Insert new registration agreement'),(4287,'reports.stats.activity.throughTime.percentageNoTrade.col1','Percentage not trading'),(4288,'brokerCommission.removeConfirmation','Remove this broker commission?'),(4289,'transactionPassword.status.user.NEVER_CREATED','Not generated'),(4290,'smsLog.title.searchMy','Search SMS history'),(4291,'permission.systemSettings.manageLocal','Manage local settings'),(4292,'card.action.cancel','Cancel'),(4293,'settings.mail.smtp','SMTP server parameters'),(4294,'help.title.user_management','User management'),(4295,'ad.title.modify','Modify advertisement'),(4296,'profile.member.addPicture','Add picture'),(4297,'permission.systemExternalAccounts.check','Check Payment'),(4298,'help.title.alerts_logs','Alerts & Logs'),(4299,'settings.access.error.virtualKeyboard.groupsRequireSpecial','{0} cannot be enabled because there is at least one group which requires special characters on passwords'),(4300,'reports.stats.keydevelopments.numberOfMembers.numberOfDisappearedMembers.short','Disappeared'),(4301,'reference.direction.general.RECEIVED','Received references'),(4302,'pos.search.noResults','No POS was found'),(4303,'theme.action.remove','Remove'),(4304,'authorizationLevel.error.removing','It\'s not possible to remove this authorization level because there are payments depending on it'),(4305,'reports.stats.keydevelopments.throughTime.title','Developments through the time'),(4306,'loan.repayment.amount','Amount'),(4307,'loanPayment.number','Number'),(4308,'transactionFee.when.ALWAYS','Always'),(4309,'document.documentPage','Document page'),(4310,'reports.members_reports.number','Number'),(4311,'ad.maxAdsMessage','Please delete one or more products & services to be able to create a new one'),(4312,'customField.moveValue','Replace occurrences by'),(4313,'groupFilter.customizedFiles.removed','The file is no longer customized for this group filter'),(4314,'externalTransferType.error.removing','The payment type could not be removed'),(4315,'settings.local.applicationUsername','Application username'),(4316,'changePin.error.blockedTransactionPassword','Blocked transaction password'),(4317,'permission.brokerMemberAccess.transactionPassword','Manage transaction password'),(4318,'payment.goToAccountHistory','Go to account history'),(4319,'transactionFee.fromFixedMember.name','Will be charged full name'),(4320,'customField.confirmUnhide','You have turned off the can hide checkbox for this field.\nSaving this field like this means that for all members\nexisting information in this field becomes visible for others.\n\nAre you sure?'),(4321,'transactionFee.modified','The transaction fee was modified'),(4322,'reports.stats.activity.comparePeriods.loginTimes.row1','Logins per member'),(4323,'paymentObligation.publish','Publish'),(4324,'fieldMapping.field.MEMBER_ID','Member internal identifier'),(4325,'accountFeeLog.skippedMembers','Skipped members'),(4326,'permission.adminMembers.import','Import'),(4327,'help.title.profiles','Profile'),(4328,'ad.publicationPeriod.permanent','Permanent'),(4329,'smsMailing.date','Date'),(4330,'adImport.status.INVALID_OWNER','Invalid owner member: {0}'),(4331,'settings.local.transactionNumber.suffix','Suffix'),(4332,'loanPayment.summary.receivedPayments','Received payments'),(4333,'adminTasks.onlineState.online','The system is currently <span class=\'fieldDecoration\'><b>online</b></span>'),(4334,'reference.level','Value'),(4335,'transactionPassword.reset.confirmMessage','Are you sure to reset the member\'s transaction password? '),(4336,'alert.system.NULL_RATE',''),(4337,'home.admin.status.systemUptime.message','{0} day(s), {1} hour(s)'),(4338,'reports.stats.transactionFeeFilters','Transaction Fees'),(4339,'accountFee.action.run','Run now'),(4340,'externalTransfer.status.TOTAL','Total'),(4341,'group.error.passwordPolicyNumeric','{0} cannot be set to force letters or special characters because the access settings defines the password as numeric'),(4342,'home.status.newPayments','You received {0} new payments since your last login'),(4343,'customImage.system.quickAccess_updateProfile','Quick access: update profile'),(4344,'brokerCommission.error.removing','The broker commission could not be removed because it was already charged or it was already customized by a broker'),(4345,'adCategory.modified','The category was modified'),(4346,'memberRecord.lastModified','Modified at'),(4347,'guarantee.issuedDate','Issued date'),(4348,'customImage.upload','Upload new'),(4349,'payment.confirmation.cancel','You are going to cancel this payment.\n\nPlease click OK to confirm'),(4350,'transactionFee.aRateParameters','A-rate parameters'),(4351,'menu.admin.externalAccounts.fileMappings','File Mappings'),(4352,'accountFeeLog.openInvoices','Open invoices'),(4353,'transferType.fields.title.list','Payment custom fields'),(4354,'loan.queryStatus.EXPIRED','Expired'),(4355,'permission.systemTasks','Adminstrative tasks'),(4356,'infoText.new','Create New'),(4357,'externalTransfer.amount','Amount'),(4358,'settings.message.adminApplicationError','Application errors'),(4359,'reports.stats.keydevelopments.transactionAmount.highest','highest'),(4360,'group.settings.maxAmountPerDay','Maximum amount per day per payment type'),(4361,'memberRecordType.fields.title.list','Custom fields'),(4362,'externalAccount.error.removing','The value was not removed because it is currently being used'),(4363,'transfer.title.print','Transaction information'),(4364,'operator.created','The operator has been successfully created'),(4365,'group.nature.BROKER','Broker'),(4366,'fileMapping.decimalSeparator.error.required','Decimal separator is required'),(4367,'group.permissions','Edit permissions'),(4368,'settings.mail.invitation','Invitation mail'),(4369,'ad.id','MemberId'),(4370,'brokerCommissionContract.broker','Broker'),(4371,'viewChannels.title.of','View channels of {0}'),(4372,'global.removeSelected','Remove selected'),(4373,'reports.stats.finances.ThroughTime.expenditure.yAxis','Expenditure'),(4374,'accountHistory.creditsDebitsBalance.amount','Transactions balance'),(4375,'brokerCommissionContract.modified','The broker commission contract was modified'),(4376,'pos.discarded','The POS was discarded'),(4377,'reports.stats.activity.singlePeriod.loginTimes.yAxis','Logins / member'),(4378,'reports.stats.keydevelopments.numberOfAds.created','Created ads '),(4379,'contact.removed','The contact was removed'),(4380,'transferType.isLoan','Is loan'),(4381,'transactionFee.chargeType.A_RATE','A-rate'),(4382,'message.type.PAYMENT_OBLIGATION','Payment obligations'),(4383,'transactionFee.subject.SOURCE','Member paying (source)'),(4384,'reports.stats.keydevelopments.periodType.COMPARED_PERIODS','Compared periods'),(4385,'memberImport.initialCreditTransferType.empty','Ignore positive balances'),(4386,'permission.adminMemberLoanGroups','Loan group membership'),(4387,'brokerCommission.suspended','The broker commission was suspended'),(4388,'payment.status','Status'),(4389,'permission.brokerMemberAccess.changePin','Change pin'),(4390,'permission.systemCustomizedFiles.manage','Manage'),(4391,'pendingMember.resendEmail','Resend validation email (last sent at {0})'),(4392,'permission.adminMemberPos.block','Block'),(4393,'permission.operatorReferences.manageMemberTransactionFeedbacks','Manage my transaction feedbacks'),(4394,'serviceClient.title.insert','Insert web services client'),(4395,'loan.repayment.transactionPassword.canPerformExpiredAction','In order to change the loan status, you must supply your transaction password'),(4396,'accountFeeLog.totalAmount','Total amount'),(4397,'guaranteeType.forwardTransferType','Forward'),(4398,'posLog.by','By'),(4399,'menu.member.account.loans','Loans'),(4400,'customField.action.new','New custom field'),(4401,'profile.action.changeBroker','Set broker'),(4402,'permission.systemStatus.viewConnectedMembers','View connected members'),(4403,'contact.notes','Notes'),(4404,'paymentObligation.sellerName','Seller name'),(4405,'icon.title.notConciliated','Payment not conciliated'),(4406,'paymentObligation.pack.details.title','Details'),(4407,'menu.admin.accounts.memberPayment','Member Payment'),(4408,'accountFee.nextExecution','Next execution'),(4409,'customField.payment.type.LINKED','Linked from {0}'),(4410,'permission.systemPayments.chargeback','Chargeback payment to system'),(4411,'externalAccountHistory.button.processPayments','Process payments'),(4412,'customizedFile.title.customize.css','Customize style sheet'),(4413,'transferType.feedbackExpirationTime','Max feedback period'),(4414,'operator.action.create','Create a new operator'),(4415,'settings.local.modified','The local settings were modified'),(4416,'payment.error.invalidTransferType','Invalid transaction type'),(4417,'settings.local.precision','Number precision'),(4418,'brokering.error.circularBrokering','Circular brokering:\nA member is assigned to him/herself as a broker.'),(4419,'transferType.removeConfirmation','Remove this transaction type?'),(4420,'changePassword.newPassword','New password'),(4421,'adImport.status.MISSING_CATEGORY','Missing category'),(4422,'theme.selected','The theme is now selected.\nYou may need to clear your browser\'s cache and reload the page in order to see the changes'),(4423,'authorizationLevel.title.edit','Edit authorization level'),(4424,'reports.stats.activity.histogram.grossProduct','Histogram of gross product'),(4425,'memberRecord.removeConfirmation','Remove this {0}?'),(4426,'paymentObligation.selectIssuer','Selected issuer:'),(4427,'card.changeSecurityCode.error.obvious','The security code is too simple. It cannot be sequential, nor equals to any profile field'),(4428,'settings.alert.idleInvoiceExpiration','Invoice expiration'),(4429,'settings.local.transactionNumber.prefix','Prefix'),(4430,'group.action.personalMessage','Send personal message to members'),(4431,'groupFilter.name','Name'),(4432,'permission.systemReports.simulations','Simulations'),(4433,'permission.adminMemberInvoices.sendAsMember','Send invoice as member'),(4434,'conversionSimulation.result.result','Result'),(4435,'cardSecurityCode.error.blocked','The card security code is now temporarily blocked'),(4436,'permission.systemAdminGroups','Admin groups'),(4437,'member.search.allGroups','All groups'),(4438,'guarantee.buyer','Buyer'),(4439,'menu.admin.customFields.loanFields','Loan Fields'),(4440,'adCategory.action.export','Export all categories to file'),(4441,'profile.action.managePasswords','Manage passwords'),(4442,'global.loading','Loading. Please wait...'),(4443,'reports.stats.filters','Filters...'),(4444,'admin.adminName','Admin name'),(4445,'reference.direction.general.GIVEN','Given references'),(4446,'menu.admin.accounts.memberInvoice','Member Invoice'),(4447,'menu.admin.translation.application','Application'),(4448,'errors.required','{0} is required'),(4449,'adminTasks.indexes.rebuild','Rebuild'),(4450,'loan.grantFeeRepaymentType','Grant fee repayment type'),(4451,'theme.select.message','Choose theme'),(4452,'member.brokerName','Broker name'),(4453,'currency.aRate.initDate','Initialization date for A-rate'),(4454,'permission.brokerCards.activate','Activate'),(4455,'settings.local.maxPageResults','Max. page results'),(4456,'permission.brokerInvoices.sendAsMemberToMember','Send as member to member'),(4457,'global.change','Change'),(4458,'conversionSimulation.result.amount','Amount'),(4459,'settings.log.accountFeeLevel.OFF','Off'),(4460,'permission.adminMemberSmsMailings.view','View'),(4461,'memberImport.group','Permission group'),(4462,'loan.description','Description'),(4463,'channel.title.list','Channels'),(4464,'loan.status.UNRECOVERABLE','Unrecoverable'),(4465,'paymentFilter.inserted','The payment filter was inserted'),(4466,'adminTasks.onlineState.offline','The system is currently <span class=\'fieldDecoration\'><b>offline</b></span>'),(4467,'activities.transactions.averageBuy','Paid - average amount'),(4468,'reference.transactionFeedback.role.SELLER','Payments received'),(4469,'fileMapping.decimalPlaces','Decimal places'),(4470,'settings.message.adminPaymentFromMemberToSystem','Payments from member to system'),(4471,'quickAccess.placeAd','Place ad'),(4472,'transactionPassword.generate','Get transation password'),(4473,'help.title.contacts','Contacts'),(4474,'settings.message.loginBlocked','Login blocked by invalid trials'),(4475,'customImage.uploaded','The image was uploaded, if it isn\'t displayed try refreshing the page.'),(4476,'reports.stats.paymentfilter','Payment filter'),(4477,'permission.operatorAccount.authorizedInformation','View authorized payments'),(4478,'memberRecord.by','Created by'),(4479,'externalAccount.removed','The external account was removed'),(4480,'permission.memberAccess.changeChannelsAccess','Change channels access'),(4481,'reports.stats.activity.topten.login.title','Top ten of logins'),(4482,'permission.systemAccountFees.charge','Charge'),(4483,'settings.message.brokeringExpiration','Brokering expiration'),(4484,'fieldMapping.order','Order'),(4485,'guarantee.registrationDate','Registration date'),(4486,'accountFeeLog.rechargingFailed','Recharging failed members...'),(4487,'group.initialGroup','Initial group'),(4488,'reports.stats.choose.taxes','taxes & fees'),(4489,'brokering.notes','Notes'),(4490,'card.cardCodeChanged','Card security code changed'),(4491,'defaultBrokerCommission.status.ACTIVE','Active'),(4492,'transfer.scheduling.MULTIPLE_FUTURE','Multiple scheduled payments'),(4493,'settings.type.ACCESS','Access settings'),(4494,'errors.notAllowed.loanInPast','Loan granting in the past is not possible if rates are enabled.\nThis is a configuration error; please contact a system admin.'),(4495,'channel.inserted','The channel was inserted'),(4496,'profile.neverLoggedOn','Never logged'),(4497,'permission.systemDocuments','Customized documents'),(4498,'serviceClient.noResults','There are no web services clients'),(4499,'menu.operator.search.ads','Products & Services'),(4500,'reports.stats.show','Show'),(4501,'serviceOperation.SMS','Send SMS messages'),(4502,'paymentObligation.history','History'),(4503,'memberImport.confirm','Import'),(4504,'reports.stats.keydevelopments.numberOfMembers.numberOfNewMembers.short','New'),(4505,'permission.memberPayments.paymentToMember','Member payments'),(4506,'customField.ad.searchVisibility','Search visibility'),(4507,'reports.stats.keydevelopments.numberOfTransactions.yAxis','Number'),(4508,'group.status','Status'),(4509,'member.name','Full name'),(4510,'accountFee.title.list','Account fees'),(4511,'posweb.client.loginPassword','Password'),(4512,'memberPos.title.noPos','No POS for member'),(4513,'brokerCommissionContract.cancelled','The broker commission contract was cancelled'),(4514,'currency.inserted','The currency was inserted'),(4515,'global.month.NOVEMBER','November'),(4516,'scheduledPayment.accountType','Account'),(4517,'pos.status.ACTIVE','Active'),(4518,'paymentObligation.status.REGISTERED','Registered'),(4519,'customField.ad.searchVisibility.ADVANCED','Advanced search'),(4520,'payment.confirmation.fees','The following fees will be applied if you accept:'),(4521,'permission.memberPayments.paymentToSelf','Self payment'),(4522,'permission.systemCurrencies.manage','Manage'),(4523,'reference.action.set','Set reference'),(4524,'accountFeeLog.amount','Amount'),(4525,'global.weekDay.short.THURSDAY','Thu'),(4526,'smsLog.date','Date'),(4527,'alert.type.MEMBER','Member'),(4528,'createAdmin.passwordConfirmation','Confirm password'),(4529,'groupFilter.customizedFiles.customized','The file is now customized for this group filter'),(4530,'reports.members_reports.debits','Debits'),(4531,'reports.members.presentation.result','Member report result'),(4532,'authorizationLevel.authorizer','Authorizer'),(4533,'transactionFee.aFIsZero','0% at A-rate = ...'),(4534,'card.title.search','Cards search'),(4535,'pos.error.unvailable','This POS is unvailable for assignement'),(4536,'pos.unassignPos.confirmation','Unassign POS from member?'),(4537,'settings.local.sms.channel','Operations channel'),(4538,'settings.local.memberResultDisplay','Member display name'),(4539,'permission.adminAdmins.changeGroup','Change group'),(4540,'contact.title.edit','Edit contact note'),(4541,'menu.admin.logout','Logout'),(4542,'account.availableBalance','Available balance'),(4543,'accountFeeLog.status.TRANSFER','Payment'),(4544,'customField.possibleValue.inserted','The value was inserted'),(4545,'menu.admin.usersGroups.registrationAgreements','Registration agreements'),(4546,'settings.log.traceFile','Action logfile path / name'),(4547,'customizedFile.select.type','Select type'),(4548,'changeGroup.admin.confirmPermanentRemove','Remove administrator permanently?'),(4549,'accountFee.action.run.confirmation','You are going to run an account fee.\n\nPlease click OK to confirm'),(4550,'customField.possibleValue.error.removing','The value was not removed because it is currently being used'),(4551,'permission.systemExternalAccounts.details','Details'),(4552,'quickAccess.accountInfo','Account(s)'),(4553,'translationMessage.import.type.REPLACE','Replace entire file'),(4554,'home.admin.status.memberAlerts','Number of member alerts'),(4555,'member.title.bulkActions.action','Action'),(4556,'payment.confirmation.appliedFees','Applied fees'),(4557,'transferAuthorization.date','Date'),(4558,'admin.adminUsername','Admin user name'),(4559,'error.validation','Invalid form submission'),(4560,'scheduledPayment.title.print','Scheduled payment information'),(4561,'settings.mail.smtpPassword','Password'),(4562,'group.nature.ADMIN','Admin'),(4563,'help.title.brokering','Brokering'),(4564,'sms.error.type.SEND_ERROR','Unknown error'),(4565,'reports.stats.general.year','year'),(4566,'card.created','Card has been created'),(4567,'guarantee.createGuarantee','Create guarantee'),(4568,'brokerCommission.error.stopping','Error stopping the broker commission!'),(4569,'posweb.action.logout','Logout (F10)'),(4570,'rates.reinit.date','Reinitialization date'),(4571,'createMember.title.byAdmin','Register new member'),(4572,'menu.admin.messages','Messages'),(4573,'admin.search.noResults','No administrators were found'),(4574,'changeBroker.new','New broker'),(4575,'message.sendTo.MEMBER','Member'),(4576,'externalAccount.memberAccount','Member account'),(4577,'settings.local.emailRequired','Obligatory e-mail for members'),(4578,'global.timePeriod.SECONDS','Second(s)'),(4579,'fieldMapping.title.order','Set field mappings order'),(4580,'error.image','The given image could not be uploaded'),(4581,'customField.title.order.operator','Set opeartor custom field order'),(4582,'menu.admin.cards.list','Search cards'),(4583,'reports.stats.throughTheTime','Through the time'),(4584,'global.weekDay.short.SATURDAY','Sat'),(4585,'virtualKeyboard.full','Full'),(4586,'payment.invalid.paymentAmount','The total payment amount must be the same as the sum of each payment\'s amount'),(4587,'externalTransferImport.noFile.message','Please, select the file to import'),(4588,'brokerCommissionContract.amount','Amount'),(4589,'permission.brokerMessages.manage','Manage'),(4590,'operator.action.create.selectGroup','Select group'),(4591,'webshop.payment.descriptionText','Product information:'),(4592,'reports.stats.activity.comparePeriods.percentageNoTrade.title','Percentage of members not trading (comparing two periods)'),(4593,'document.newFile','Upload file'),(4594,'member.title.print','Member search results'),(4595,'reports.stats.keydevelopments.throughTime.throughTime','Through time'),(4596,'guarantee.expiresFrom','Expires from'),(4597,'group.settings.emailValidation.USER','Public registration or user editing own profile'),(4598,'permission.systemCustomFields.view','View'),(4599,'customImage.system.noPicture','No picture'),(4600,'customField.validation.validatorClass','Validator class'),(4601,'reports.stats.chooseStatisticsCategories','Please choose one category of statistics to show'),(4602,'permission.systemStatus','System status'),(4603,'guarantee.name','Name'),(4604,'externalTransferProcess.error.noTransferTypeToPay','No possible payment types'),(4605,'createMember.action.saveAndOpenProfile','Save and open profile'),(4606,'customField.inserted','The custom field was inserted'),(4607,'transferType.error.minMaxPerDayAmount','The minimum amount must not exceed the maximum per day'),(4608,'reports.stats.keydevelopments.throughTime.show','Show'),(4609,'transfer.description','Description'),(4610,'reports.stats.activity.histogram.numberTransactions','Histogram of number of transactions'),(4611,'mobile.error.title','Error'),(4612,'menu.admin.translation','Translation'),(4613,'menu.operator.guarantees','Guarantees'),(4614,'global.search.all','All'),(4615,'mobile.payment.error.invalid','Invalid payment'),(4616,'mobile.payment.error.noTransferType','There is no possible transfer transfer type for mobile payment.\nPlease, contact the administration'),(4617,'guaranteeType.inserted','The guarantee type was inserted'),(4618,'posweb.searchTransactions.title.transactions','Processed payments'),(4619,'permission.brokerInvoices.acceptAsMemberFromMember','Accept invoice from member as member'),(4620,'permission.adminMemberAds','Products and services'),(4621,'settings.access.adminTimeout','Admin. session timeout'),(4622,'customField.control.TEXTAREA','Text area'),(4623,'reference.transactionFeedback.role.BUYER','Payments performed'),(4624,'accountType.name','Name'),(4625,'card.unblockCard.confirmation','Unblock card?'),(4626,'ad.result.by','Published by {0}'),(4627,'changePin.error.alreadyUsed','The given pin was already used in past'),(4628,'transferType.transactionHierarchyVisibility.ADMIN','Only to administrators'),(4629,'settings.local.language.GERMAN','German'),(4630,'customField.error.removing','The custom field could not be removed because it\'s already in use'),(4631,'group.title.settings.loans','Loan group settings'),(4632,'permission.brokerMembers.changeName','Change full name'),(4633,'reports.current.invoices.SYSTEM_INCOMING.count','Number of incoming system invoices'),(4634,'permission.adminMemberDocuments.manageDynamic','Manage dynamic documents'),(4635,'permission.systemGuaranteeTypes','Guarantee types'),(4636,'settings.log.accountFeeFile','Account fee logfile path / name'),(4637,'alert.member.invoiceIdleTimeExceeded','An invoice of {0}, sent at {1}, has exceeded the maximum idle time'),(4638,'theme.stylesToExport','Styles to export'),(4639,'memberPos.changePin.newPin2','Retype the PIN'),(4640,'createMember.created.mailError','The member has been created, however, the activation mail could not be sent'),(4641,'memberPos.changePin.newPin1','Type the PIN'),(4642,'loan.repayment.discard.loan.confirmationMessage','Are you sure to discard this loan?'),(4643,'loan.remainingAmount','Remaining amount'),(4644,'settings.alert.title','Alert settings'),(4645,'externalAccountHistory.error.cannotDeleteExternalTransfer','Pending transfers can be deleted'),(4646,'brokerCommissionContract.status.CLOSED','Closed'),(4647,'home.admin.status.cyclosVersion','Application version'),(4648,'permission.memberMessages.view','View'),(4649,'certification.status.SCHEDULED','Scheduled'),(4650,'notificationPreferences.allowChargingSmsPackage','Allow charging for SMS messages'),(4651,'alert.member.loginBlockedByTries','The user login is temporarily blocked by exceeding maximum amount of tries. The member IP address is {1}'),(4652,'mobile.viewPayments.next','Next'),(4653,'member.bulkActions.groupChanged','{0} members were changed to group {2}.\n{1} members were not changed because they were already on group {2}'),(4654,'guarantee.currentCreditFeeValue','Credit fee charged'),(4655,'serviceClient.title.list','Web services clients'),(4656,'menu.operator.search','Search'),(4657,'cardLog.title','Card log'),(4658,'menu.member.personal.activities','Reports'),(4659,'settings.local.csv.stringQuote','String quote'),(4660,'reports.current.presentation.result','State reports: Results'),(4661,'permission.adminMemberPayments.blockScheduledAsMember','Block scheduled payment as member'),(4662,'alert.member.INVOICE_IDLE_TIME_EXCEEDED','Expired system to member invoice'),(4663,'loanPayment.payment','Payment'),(4664,'loan.title.grant','Grant loan to {0}'),(4665,'permission.adminMemberAccess','Access'),(4666,'loanGroup.addMemberConfirmation','Add the member from to loan group?'),(4667,'alert.member.CARD_SECURITY_CODE_BLOCKED_BY_TRIES','Card security code blocked by invalid tries'),(4668,'translationMessage.title.import','Import from properties file'),(4669,'transfer.schedulingDetails','{0} of {1}, total of {2}'),(4670,'card.card','Card'),(4671,'loanPayment.search.period','Period'),(4672,'fieldMapping.field.DESCRIPTION','Payment description'),(4673,'loan.group.responsible','Responsible'),(4674,'permission.operatorContacts.manage','Manage'),(4675,'settings.log.webServiceLevel','Web services log level'),(4676,'alert.system.newVersionOfApplicationPage','There is a new version of a customized application page, {0}.\nPlease, check the customization in order to resolve possible conflicts'),(4677,'accountFee.noMatchingMembers','No members matched the search filters'),(4678,'ad.units','Units'),(4679,'selectChannels.selected','Access to channels modified'),(4680,'payment.confirmation.chargeback','You are going to chargeback this payment.\n\nPlease click OK to confirm'),(4681,'changeGroup.member.permanentlyRemoved','You cannot change the group because the member was permanently removed'),(4682,'accountFeeLog.status.ACCEPTED_INVOICE','Accepted invoice'),(4683,'adImport.status.MISSING_CUSTOM_FIELD','{0} is missing'),(4684,'profile.action.memberInfoActions','Member info'),(4685,'reports.members.account.header','Account: {0}'),(4686,'mobile.payment.error.notEnoughCredits','You do not have enough credits to perform the payment'),(4687,'settings.local.transactionNumber.enable','Enable'),(4688,'accountFee.transferType','Generated transaction type'),(4689,'reports.members_reports.transactions.memberGroupsRequired','It\'s necessary to select at least one member group'),(4690,'loan.queryStatus.UNRECOVERABLE','Unrecoverable'),(4691,'permission.operatorContacts','Contact list'),(4692,'menu.admin.usersGroups.loanGroups','Loan groups'),(4693,'reports.members_reports.transactions.paymentFilterRequired','It\'s necessary to choose at least one payment filter'),(4694,'loan.grantFee','Grant fee'),(4695,'permission.adminMemberBulkActions.changeChannels','Change access to channels'),(4696,'externalAccountHistory.title','Transactions of {0}'),(4697,'message.type.FROM_ADMIN_TO_MEMBER','Personal messages from administration'),(4698,'permission.adminAdminAccess.enableLogin','Reactivate disabled admins (because of failed login attempts)'),(4699,'permission.brokerMembers.changeUsername','Change login name'),(4700,'group.action.new','Insert new group'),(4701,'transactionFee.subject.SYSTEM','System account'),(4702,'externalTransferImport.removeConfirmation','Remove this transaction import?'),(4703,'permission.adminMemberGroups','Member groups'),(4704,'memberPos.changePin.confirmation','Change PIN?'),(4705,'brokerCommission.chargeStatus.noComissions','No commissions applicable to the member'),(4706,'guarantee.paymentObligations','Payment obligations'),(4707,'profile.action.remarks','Remarks'),(4708,'reports.members.presentation.list','Member lists'),(4709,'permission.brokerPos.discard','Discard'),(4710,'menu.member.account.authorizedPayments','Authorized payments'),(4711,'settings.message.pendingPaymentDenied','Pending payment denial'),(4712,'accountHistory.conciliation.notConciliated','Not conciliated'),(4713,'global.range.to','To'),(4714,'permission.memberAccount','Account'),(4715,'menu.admin.accounts.currencies','Manage Currencies'),(4716,'pos.error.noAssignPermission','You don\'t have access to assign a POS to a member'),(4717,'contact.inserted','The contact was inserted'),(4718,'receiptPrinterSettings.endOfDocCommand','End of document command'),(4719,'externalTransfer.description','Description'),(4720,'permission.systemInvoices.view','View'),(4721,'infoText.start','Activation'),(4722,'channel.credentials.DEFAULT','Login password then transaction password (if enabled)'),(4723,'brokerCommissionContract.action.new','New contract'),(4724,'paymentFilter.action.new','Insert new payment filter'),(4725,'transfer.number','Number'),(4726,'ad.addPicture','Add picture'),(4727,'certification.delete','Delete'),(4728,'card.number','Number'),(4729,'rates.error.notOnlineWhileRateInitsPending','The system cannot be set online while a currency still has a rate initialization job pending.\nWatch the system alerts to see when the job is finished.'),(4730,'invoice.status.OPEN','Open'),(4731,'permission.systemStatus.viewConnectedBrokers','View connected brokers'),(4732,'certification.title.new','New Certification'),(4733,'reports.stats.activity.comparePeriods.percentageNoTrade','Percentage of members not trading'),(4734,'scheduledPayment.transfer','Transfer'),(4735,'loanPayment.summary.count','Count'),(4736,'settings.local.maxThumbnailHeight',''),(4737,'settings.message.pendingPaymentReceived','Payment that awaits authorization receiving'),(4738,'channel.supportsPaymentRequest','Supports payment request'),(4739,'menu.admin.settings.channels','Channels'),(4740,'cardType.name','Name'),(4741,'reports.stats.activity.singlePeriod.percentageNoTrade.title','Percentage of members not trading (single period)'),(4742,'top.message','Open Source on-line banking software'),(4743,'customField.title.order.ad','Set advertisement custom field order'),(4744,'transfer.scheduling.IMMEDIATELY','Not scheduled (pay immediately)'),(4745,'customImage.system.quickAccess_searchAds','Quick access: search ads'),(4746,'invoice.accept.transactionPassword','In order to accept the invoice, you must supply your transaction password'),(4747,'customField.possibleValue.error.saving','Error saving value.\nMake sure that it doesn\'t exists already'),(4748,'pos.status.PIN_BLOCKED','PIN blocked'),(4749,'memberRecordType.layout.LIST','List'),(4750,'memberRecord.search.keywords','Keywords'),(4751,'error.rateParameters.initExpirationBeforeEmission','Combination of A-rate initialization values leads to a emission date which is after the expiration date following from D-rate initialization values.'),(4752,'externalTransferImport.error.importing.comments','Field {0} (column {1}) has an unexpected value: {2}'),(4753,'permission.brokerAccounts.information','View account information'),(4754,'permission.memberPreferences.manageNotifications','Manage notifications'),(4755,'alert.member.initialCreditFailed','Initial credit has failed for {0}'),(4756,'loan.repaid','The repayment was succesfully processed'),(4757,'settings.mail.message','Message'),(4758,'loan.confirmation.transactionPassword','In order to confirm this loan, you must supply your transaction password'),(4759,'changeGroup.error.remove.hasOpenLoans','The member cannot be removed because it has unpaid loans'),(4760,'menu.operator.account.loanGroups','Loan groups'),(4761,'reports.simulations.aRate.config.combinedGraph.yAxis','Fee'),(4762,'account.lowUnits','Low units alert'),(4763,'message.toMember','To member'),(4764,'infoText.inserted','The info text was inserted'),(4765,'permission.brokerMemberAccess.changePassword','Change login password'),(4766,'payment.action.deny','Deny'),(4767,'transferAuthorization.action','Action'),(4768,'transactionPassword.status.user.ACTIVE','Active'),(4769,'permission.operatorPayments.paymentToSystem','System payments'),(4770,'mobile.payment.title.confirm','Confirm Payment'),(4771,'payment.error.enoughCreditsOtherAccount','The payment cannot be performed as another involved account didn\'t have enough balance'),(4772,'customField.possibleValue.modified','The value was modified'),(4773,'home.member.news.title','News (message board)'),(4774,'loan.title.repayment','Loan repayment'),(4775,'customField.title.list.loan','Loan custom fields'),(4776,'activities.invoices.outgoing.count','Outgoing count'),(4777,'createMember.forceChangePassword','Force change on first login'),(4778,'memberRecordType.inserted','The member record type was inserted'),(4779,'menu.admin.accounts.manage','Manage Accounts'),(4780,'adCategory.title.list','Advertisement categories'),(4781,'fileMapping.nature.CSV','CSV'),(4782,'connectedUsers.loggedAt','Logged at'),(4783,'reports.members.presentation','Members transactions reports'),(4784,'permission.adminMemberPos.discard','Discard'),(4785,'reports.stats.taxes.title','Statistics of taxes & fees...'),(4786,'card.title.create','Create card for {0}'),(4787,'card.canceled','Card canceled'),(4788,'memberPos.assign.invalidMember','The typed member does not exists. Please insert another one.'),(4789,'customImage.size','Size'),(4790,'fileMapping.inserted','File mapping inserted'),(4791,'loan.group','Loan group'),(4792,'permission.memberGuarantees.issueGuarantees','Manage guarantees (as issuer)'),(4793,'permission.systemGroupFilters.manageCustomizedFiles','Manage customized files'),(4794,'settings.local.scheduledTasks','Scheduled tasks'),(4795,'reports.stats.finances.ThroughTime.expenditure','Expenditure'),(4796,'help.title.preferences','Preferences'),(4797,'channel.usePin','Use PIN'),(4798,'menu.admin.help','Help'),(4799,'permission.systemRegistrationAgreements','Registration agreements'),(4800,'reports.members_reports.members_invoices','Members invoices'),(4801,'menu.member.preferences.notification','Notifications'),(4802,'smsLog.status.ERROR','Error'),(4803,'customField.title.modify.ad','Modify advertisement custom field'),(4804,'transferAuthorization.title.list.of','Authorized transaction actions by {0}'),(4805,'certification.status.ACTIVE','Active'),(4806,'smsMailing.recipients','Recipients'),(4807,'card.securityCodeUnblocked','Card security code unblocked'),(4808,'alert.member.TRANSACTION_PASSWORD_BLOCKED_BY_TRIES','Transaction blocked by exceeding attempts'),(4809,'accountFeeLog.running','Running'),(4810,'tranasctionFee.count','Number of transactions of days'),(4811,'settings.log.transactionLevel','Transactions log level');
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
