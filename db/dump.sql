CREATE DATABASE  IF NOT EXISTS `cyclos3` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cyclos3`;
-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: 46.231.201.113    Database: cyclos3
-- ------------------------------------------------------
-- Server version	5.5.32

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
INSERT INTO `group_filters_groups` VALUES (9,1);
/*!40000 ALTER TABLE `group_filters_groups` ENABLE KEYS */;
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
  CONSTRAINT `FK4B7C40782B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK4B7C4078EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_operations`
--

LOCK TABLES `index_operations` WRITE;
/*!40000 ALTER TABLE `index_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_operations` ENABLE KEYS */;
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
  CONSTRAINT `FK60B0F30E123F9A53` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK60B0F30EEAEDFACC` FOREIGN KEY (`account_id`) REFERENCES `external_accounts` (`id`)
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
  CONSTRAINT `FK20F3219A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK20F3219EAEDFACC` FOREIGN KEY (`account_id`) REFERENCES `external_accounts` (`id`)
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
  CONSTRAINT `FKA3AAB0F541A07D8C` FOREIGN KEY (`imported_category_id`) REFERENCES `imported_ad_categories` (`id`),
  CONSTRAINT `FKA3AAB0F5D45742EF` FOREIGN KEY (`existing_category_id`) REFERENCES `ad_categories` (`id`),
  CONSTRAINT `FKA3AAB0F5FCABEF03` FOREIGN KEY (`import_id`) REFERENCES `ad_imports` (`id`),
  CONSTRAINT `FKA3AAB0F5FE01A09E` FOREIGN KEY (`owner_id`) REFERENCES `members` (`id`)
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
  CONSTRAINT `FK178B03D73A7A3` FOREIGN KEY (`category_id`) REFERENCES `ad_categories` (`id`),
  CONSTRAINT `FK178B0C0E7F6FA` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `FK178B0FE01A09E` FOREIGN KEY (`owner_id`) REFERENCES `members` (`id`)
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
  CONSTRAINT `FKF21FF8C9123F9A53` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKF21FF8C9797D2395` FOREIGN KEY (`initial_credit_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FKF21FF8C9A824C958` FOREIGN KEY (`initial_debit_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FKF21FF8C9B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
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
INSERT INTO `error_log_entry_parameters` VALUES (1,'','fromQuickAccess'),(1,'0','memberId'),(1,'true','singleAccount'),(1,'5','typeId'),(2,'','from'),(2,'true','selectMember'),(4,'11140','message(id)'),(4,'pt_BR:about.message','message(key)'),(4,'en_US','message(locale)'),(4,'<!-- InformaÃ§Ãµes sobre o projeto Cyclos podem ser encontradas em: <a href=\"{0}\"><u>{0}</u></a> -->','message(value)'),(4,'11140','messageId'),(4,'true','validation');
/*!40000 ALTER TABLE `error_log_entry_parameters` ENABLE KEYS */;
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
  CONSTRAINT `FK374B1C701C7906A6` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `FK374B1C703794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
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
  CONSTRAINT `FK295A0B0A141FB961` FOREIGN KEY (`file_mapping_id`) REFERENCES `file_mappings` (`id`),
  CONSTRAINT `FK295A0B0AACBA9282` FOREIGN KEY (`member_field_id`) REFERENCES `custom_fields` (`id`),
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
  CONSTRAINT `FKA37612EB205CEC57` FOREIGN KEY (`certification_id`) REFERENCES `certifications` (`id`),
  CONSTRAINT `FKA37612EB40A58052` FOREIGN KEY (`seller_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKA37612EB608B319E` FOREIGN KEY (`buyer_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKA37612EB9383E848` FOREIGN KEY (`guarantee_type_id`) REFERENCES `guarantee_types` (`id`),
  CONSTRAINT `FKA37612EBA5F0DAD8` FOREIGN KEY (`issuer_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKA37612EBF9B21025` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`)
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
  CONSTRAINT `FKE7A59DDA99B38EF5` FOREIGN KEY (`system_account_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `FKE7A59DDAE6699C5F` FOREIGN KEY (`member_account_id`) REFERENCES `account_types` (`id`),
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
  CONSTRAINT `FKBB60D4C7B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKBB60D4C7E969E40E` FOREIGN KEY (`transaction_fee_id`) REFERENCES `transaction_fees` (`id`)
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
  CONSTRAINT `FKBFDA159D2B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKBFDA159D41B97FCC` FOREIGN KEY (`modified_by_id`) REFERENCES `members` (`id`),
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
  CONSTRAINT `FK413E1E5725A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK413E1E57A78BAF2E` FOREIGN KEY (`payment_filter_id`) REFERENCES `payment_filters` (`id`)
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
  CONSTRAINT `FK3D84E6FA797D2395` FOREIGN KEY (`initial_credit_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK3D84E6FAB45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK3D84E6FAB93596D` FOREIGN KEY (`type_id`) REFERENCES `account_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_group_account_settings`
--

LOCK TABLES `member_group_account_settings` WRITE;
/*!40000 ALTER TABLE `member_group_account_settings` DISABLE KEYS */;
INSERT INTO `member_group_account_settings` VALUES (1,5,5,'','\0','\0',0.000000,NULL,0.000000,23,100.000000,'Minimum balance limit reached'),(2,9,5,'','\0','\0',0.000000,NULL,0.000000,23,20.000000,'You are reaching your credit limit');
/*!40000 ALTER TABLE `member_group_account_settings` ENABLE KEYS */;
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
  CONSTRAINT `FKB124F6E72F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FKB124F6E745B5D1BC` FOREIGN KEY (`to_channel_id`) REFERENCES `channels` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'local','charset','UTF-8'),(2,'local','language','PORTUGUESE_BRAZIL'),(4,'local','defaultExternalPaymentDescription','External payment'),(205,'log','traceFile','logs/cyclos_trace%g.log'),(206,'log','transactionFile','logs/cyclos_transactions%g.log'),(207,'log','accountFeeFile','logs/cyclos_account_fees%g.log'),(208,'log','scheduledTaskFile','logs/cyclos_scheduled_task%g.log'),(209,'log','webServiceFile','logs/cyclos_webservices%g.log'),(210,'log','restFile','logs/cyclos_rest%g.log'),(211,'local','applicationName','Acacia Bank Internet Banking'),(212,'local','rootUrl','http://localhost:8080/cyclos'),(213,'local','numberLocale','PERIOD_AS_DECIMAL'),(214,'local','precision','TWO'),(215,'local','highPrecision','FOUR'),(216,'local','decimalInputMethod','RTL'),(217,'local','datePattern','DD_MM_YYYY_SLASH'),(218,'local','timePattern','HH24_MM_SS'),(219,'local','timeZone',NULL),(220,'local','containerUrl',NULL),(221,'local','maxIteratorResults','1000'),(222,'local','maxPageResults','15'),(223,'local','maxAjaxResults','8'),(224,'local','maxUploadSize','5'),(225,'local','maxUploadUnits','MEGA_BYTES'),(226,'local','maxImageWidth','800'),(227,'local','maxImageHeight','600'),(228,'local','maxThumbnailWidth','100'),(229,'local','maxThumbnailHeight','100'),(230,'local','referenceLevels','5'),(231,'local','smsEnabled','false'),(232,'local','csvUseHeader','true'),(233,'local','csvRecordSeparator','LF'),(234,'local','csvValueSeparator','COMMA'),(235,'local','csvStringQuote','DOUBLE_QUOTE'),(236,'local','cyclosId',NULL),(237,'local','sendSmsWebServiceUrl',NULL),(238,'local','smsChannelName',NULL),(239,'local','smsCustomFieldId','0'),(240,'local','transactionNumber.prefix',NULL),(241,'local','transactionNumber.padLength','10'),(242,'local','transactionNumber.suffix',NULL),(243,'local','emailRequired','true'),(244,'local','emailUnique','true'),(245,'local','brokeringExpirationPeriod.number','0'),(246,'local','brokeringExpirationPeriod.field','YEARS'),(247,'local','deleteMessagesOnTrashAfter.number','30'),(248,'local','deleteMessagesOnTrashAfter.field','DAYS'),(249,'local','deletePendingRegistrationsAfter.number','7'),(250,'local','deletePendingRegistrationsAfter.field','DAYS'),(251,'local','memberSortOrder','CHRONOLOGICAL'),(252,'local','memberResultDisplay','NAME'),(253,'local','adDescriptionFormat','RICH'),(254,'local','messageFormat','RICH'),(255,'local','schedulingHour','0'),(256,'local','schedulingMinute','0'),(257,'local','transferListenerClass',NULL),(258,'local','maxChargebackTime.number','1'),(259,'local','maxChargebackTime.field','MONTHS'),(260,'local','showCountersInAdCategories','true'),(261,'access','virtualKeyboard','true'),(262,'access','virtualKeyboardTransactionPassword','true'),(263,'access','numericPassword','true'),(264,'access','allowOperatorLogin','false'),(265,'access','allowMultipleLogins','true'),(266,'access','usernameLength.min','4'),(267,'access','usernameLength.max','8'),(268,'access','adminTimeout.number','15'),(269,'access','adminTimeout.field','MINUTES'),(270,'access','administrationWhitelist','#Any host'),(271,'access','usernameGeneration','RANDOM'),(272,'access','generatedUsernameLength','8'),(273,'access','memberTimeout.number','10'),(274,'access','memberTimeout.field','MINUTES'),(275,'access','poswebTimeout.number','1'),(276,'access','poswebTimeout.field','DAYS'),(277,'access','transactionPasswordChars','ABCDEFGHIJ'),(278,'access','usernameRegex','^[\\w\\.]*$'),(279,'local','applicationUsername','A AdministraÃ§Ã£o'),(280,'local','chargebackDescription','Estorno de pagamento realizado em #date#\r\n#description#'),(281,'mailTranslation','invitationSubject','Convite para participar do #system_name#'),(282,'mailTranslation','invitationMessage','O usuÃ¡rio #member# enviou a vocÃª um convite para que vocÃª tambÃ©m se cadastre no #system_name#.<br>Para acessar o sistema, acesse #link#'),(283,'mailTranslation','activationSubject','Bem vindo ao #system_name#'),(284,'mailTranslation','activationMessageWithoutPassword','OlÃ¡ #member#, <br><br> Sua conta no #system_name# foi ativada.<br>VocÃª pode acessar o sistema com o usuÃ¡rio #login#.<br><br>Para acessar o sistema, #link#.<br><br>SaudaÃ§Ãµes,<br>Equipe do #system_name#.'),(285,'mailTranslation','activationMessageWithPassword','OlÃ¡ #member#,  <br><br>Sua conta no #system_name# foi ativada.<br>VocÃª pode acessar o sistema com o usuÃ¡rio #login# e senha #password#. Esta senha Ã© temporÃ¡ria e deverÃ¡ ser alterada no primeiro login.<br><br>Para acessar o sistema, #link#.<br><br>SaudaÃ§Ãµes,<br>Equipe do #system_name#.'),(286,'mailTranslation','resetPasswordSubject','#system_name# - Nova senha'),(287,'mailTranslation','resetPasswordMessage','OlÃ¡ #member#,<br><br>Sua senha foi recriada.<br>VocÃª agora pode acessar o sistema como #login#, utilizando a senha #password#.<br>VocÃª deverÃ¡ alterar a senha no prÃ³ximo acesso.<br>Para ir ao sistema, acesse #link#'),(288,'mailTranslation','mailValidationSubject','ValidaÃ§Ã£o de e-mail do #system_name#'),(289,'mailTranslation','mailValidationMessage','OlÃ¡ #member#, <br><br> VocÃª se cadastrou no #system_name#, mas antes de poder utilizÃ¡-lo, vocÃª deve validar seu endereÃ§o de e-mail.<br><br>Para validar o cadastro, por favor, clique no link abaixo:<br><br>#link#<br><br>Obrigado por cadastrar-se no #system_name#. Se vocÃª nÃ£o cadastrou-se ou nÃ£o estava esperando este e-mail, por favor, desconsidere-o'),(290,'message','loginBlockedMessage','VocÃª atingiu o nÃºmero mÃ¡ximo de tentativas de acesso.<br>Agora, o seu acesso estÃ¡ temporariamente bloqueado'),(291,'message','loginBlockedSubject','O seu acesso estÃ¡ temporariamente bloqueado'),(292,'message','loginBlockedSms','VocÃª atingiu o nÃºmero mÃ¡ximo de tentativas de acesso. Agora, o seu acesso estÃ¡ temporariamente bloqueado'),(293,'message','pinBlockedMessage','VocÃª alcanÃ§ou o limite de tentativas da senha externa (PIN).<br>Ela ficarÃ¡ temporariamente bloqueada'),(294,'message','pinBlockedSubject','Sua senha externa (PIN) foi bloqueada'),(295,'message','pinBlockedSms','VocÃª alcanÃ§ou o limite de tentativas da senha externa (PIN). Ela ficarÃ¡ temporariamente bloqueada'),(296,'message','posPinBlockedMessage','VocÃª atingiu o nÃºmero mÃ¡ximo de tentativas invÃ¡lidas do PIN do POS.<br>Agora, o seu dispositivo POS estÃ¡ temporariamente bloqueado.'),(297,'message','posPinBlockedSubject','O PIN do seu dispositivo POS foi bloqueado'),(298,'message','posPinBlockedSms','VocÃª atingiu o nÃºmero mÃ¡ximo de tentativas invÃ¡lidas do PIN do POS, e o dispositivo foi temporariamente bloqueado.'),(299,'message','cardSecurityCodeBlockedMessage','VocÃª atingiu o nÃºmero mÃ¡ximo de tentativas invÃ¡lidas do cÃ³digo de seguranÃ§a.<br>Agora, o seu cartÃ£o estÃ¡ temporariamente bloqueado.'),(300,'message','cardSecurityCodeBlockedSubject','O cÃ³digo de seguranÃ§a do seu cartÃ£o foi bloqueado'),(301,'message','cardSecurityCodeBlockedSms','VocÃª atingiu o nÃºmero mÃ¡ximo de tentativas invÃ¡lidas do cÃ³digo de seguranÃ§a, e o cartÃ£o foi temporariamente bloqueado.'),(302,'message','brokeringExpirationMessage','A relaÃ§Ã£o de corretagem entre vocÃª e #member# (#login#) venceu'),(303,'message','brokeringExpirationSubject','Corretagem vencida'),(304,'message','brokeringExpirationSms','A relaÃ§Ã£o de corretagem entre vocÃª e #login# expirou'),(305,'message','brokeringRemovedMessage','A relaÃ§Ã£o de corretagem entre vocÃª e #member# (#login#) foi removida'),(306,'message','brokeringRemovedSubject','Corretagem removida'),(307,'message','brokeringRemovedSms','A relaÃ§Ã£o de corretagem entre vocÃª e #login# foi removida'),(308,'message','removedFromBrokerGroupMessage','A administraÃ§Ã£o removeu vocÃª do grupo de corretores'),(309,'message','removedFromBrokerGroupSubject','VocÃª nÃ£o Ã© mais corretor'),(310,'message','removedFromBrokerGroupSms','A administraÃ§Ã£o removeu vocÃª do grupo de corretor'),(311,'message','newCommissionContractMessage','O corretor #broker# cadastrou um novo contrato de comissÃ£o que precisa de sua aprovaÃ§Ã£o:<br>Data de inÃ­cio: #start_date#<br>Data de tÃ©rmino: #end_date#<br>CommissÃ£o: #amount#<br>#link# para mais detalhes'),(312,'message','newCommissionContractSubject','Contrato de commissÃ£o de corretor registrado'),(313,'message','newCommissionContractSms','O corretor #broker_login# registrou um novo contrato que esta aguardando a sua aprovaÃ§Ã£o. Data inicial: #start_date#, data final: #end_date#, valor: #amount#'),(314,'message','commissionContractAcceptedMessage','O membro #member# aceitou o contrato de comissÃ£o:<br>Data de inÃ­cio: #start_date#<br>Data de tÃ©rmino: #end_date#<br>CommissÃ£o: #amount#<br>#link# para mais detalhes'),(315,'message','commissionContractAcceptedSubject','Contrato de commissÃ£o de corretor aceito'),(316,'message','commissionContractAcceptedSms','O membro #login# aceitou o contrato de comissÃ£o. Data inicial: #start_date#, data final: #end_date#, valor: #amount#'),(317,'message','commissionContractCancelledMessage','O corretor #broker# cancelou o contrato de comissÃ£o:<br>Data de inÃ­cio: #start_date#<br>Data de tÃ©rmino: #end_date#<br>CommissÃ£o: #amount#<br>#link# para mais detalhes'),(318,'message','commissionContractCancelledSubject','Contrato de commissÃ£o de corretor cancelado'),(319,'message','commissionContractCancelledSms','O corretor #broker_login# cancelou um contrato de comissÃ£o. Data inicial: #start_date#, data final: #end_date#, valor: #amount#'),(320,'message','commissionContractDeniedMessage','O membro #member# negou o contrato de comissÃ£o:<br>Data de inÃ­cio: #start_date#<br>Data de tÃ©rmino: #end_date#<br>CommissÃ£o: #amount#<br>#link# para mais detalhes'),(321,'message','commissionContractDeniedSubject','Contrato de commissÃ£o de corretor negado'),(322,'message','commissionContractDeniedSms','O membro #login# negou o contrato de comissÃ£o. Data inicial: #start_date#, data final: #end_date#, valor: #amount#'),(323,'message','lowUnitsMessage','VocÃª estÃ¡ chegando perto do seu limite de crÃ©dito, de #credit_limit#'),(324,'message','lowUnitsSubject','NotificaÃ§Ã£o de poucas unidades'),(325,'message','lowUnitsSms','VocÃª estÃ¡ chegando perto do seu limite de crÃ©dito, de #credit_limit#'),(326,'message','adExpirationMessage','Seu anÃºncio com tÃ­tulo \"#title#\" venceu.<br>#link# para mais detalhes'),(327,'message','adExpirationSubject','AnÃºncio vencido'),(328,'message','adExpirationSms','Seu anÃºncio venceu. TÃ­tulo: #title#'),(329,'message','adInterestMessage','Novo anÃºncio publicado que coincide com seus interesses, cujo tÃ­tulo Ã© \"#title#\".<br>#link# para mais detalhes'),(330,'message','adInterestSubject','AnÃºncio publicado que coincide com seus interesses'),(331,'message','adInterestSms','Novo anÃºncio publicado que coincide com seus interesses. TÃ­tulo: \"#title#\"'),(332,'message','invoiceReceivedMessage','VocÃª recebeu uma fatura eletrÃ´nica de #member# (#login#).<br>#link# para mais detalhes'),(333,'message','invoiceReceivedSubject','Fatura recebida'),(334,'message','invoiceReceivedSms','VocÃª recebeu uma fatura eletrÃ´nica de #member# (#login#)'),(335,'message','invoiceAcceptedMessage','#member# (#login#) aceitou sua fatura eletrÃ´nica com:<br>Data: #date#<br>Valor: #amount#<br>DescriÃ§Ã£o: #description#.<br>#link# para mais detalhes'),(336,'message','invoiceAcceptedSubject','Fatura aceita'),(337,'message','invoiceAcceptedSms','#member# (#login#) aceitou sua fatura eletrÃ´nica com data: #date#, valor: #amount#, descriÃ§Ã£o: #description#'),(338,'message','invoiceCancelledMessage','#member# (#login#) cancelou sua fatura eletrÃ´nica com:<br>Data: #date#<br>Valor: #amount#<br>DescriÃ§Ã£o: #description#.<br>#link# para mais detalhes'),(339,'message','invoiceCancelledSubject','Fatura cancelada'),(340,'message','invoiceCancelledSms','#member# (#login#) cancelou sua fatura eletrÃ´nica com data: #date#, valor: #amount#, descriÃ§Ã£o: #description#'),(341,'message','invoiceDeniedMessage','#member# (#login#) negou sua fatura eletrÃ´nica com:<br>Data: #date#<br>Valor: #amount#<br>DescriÃ§Ã£o: #description#.<br>#link# para mais detalhes'),(342,'message','invoiceDeniedSubject','Fatura negada'),(343,'message','invoiceDeniedSms','#member# (#login#) negou sua fatura eletrÃ´nica com data: #date#, valor: #amount#, descriÃ§Ã£o: #description#'),(344,'message','receivedInvoiceExpiredMessage','Uma fatura eletrÃ´nica que vocÃª recebeu de #member# (#login#) de #amount#.<br>#link# para mais detalhes'),(345,'message','receivedInvoiceExpiredSubject','Uma fatura eletrÃ´nica que vocÃª recebeu venceu'),(346,'message','receivedInvoiceExpiredSms','Uma fatura eletrÃ´nica que vocÃª recebeu de #member# (#login#) de #amount#'),(347,'message','sentInvoiceExpiredMessage','Uma fatura eletrÃ´nica que vocÃª enviou para #member# (#login#) de #amount#.<br>#link# para mais detalhes'),(348,'message','sentInvoiceExpiredSubject','Uma fatura eletrÃ´nica que vocÃª enviou venceu'),(349,'message','sentInvoiceExpiredSms','Uma fatura eletrÃ´nica que vocÃª enviou para #member# (#login#) de #amount#'),(350,'message','loanExpirationMessage','Um emprÃ©stimo concedido em #grant_date# (#amount#) venceu.<br>#link# para mais detalhes'),(351,'message','loanExpirationSubject','EmprÃ©stimo vencido'),(352,'message','loanExpirationSms','Um emprÃ©stimo concedido em #grant_date# (#amount#) venceu'),(353,'message','loanGrantedMessage','Um emprÃ©stimo com valor de #amount# foi concedido.<br>#link# para mais detalhes'),(354,'message','loanGrantedSubject','EmprÃ©stimo concedido'),(355,'message','loanGrantedSms','Um emprÃ©stimo com valor de #amount# foi concedido'),(356,'message','paymentReceivedMessage','Um pagamento de #amount# foi recebido de #member# (#login#).<br>#link# para mais detalhes'),(357,'message','paymentReceivedSubject','Pagamento recebido'),(358,'message','paymentReceivedSms','Um pagamento de #amount# foi recebido de #member# (#login#). Saldo: #available_balance#.'),(359,'message','pendingPaymentReceivedMessage','Um pagamento de #amount#, que necessita de autorizaÃ§Ã£o, foi submetido por #member# (#login#).<br>#link# para mais detalhes'),(360,'message','pendingPaymentReceivedSubject','Um pagamento que requer autorizaÃ§Ã£o foi recebido'),(361,'message','pendingPaymentReceivedSms','Um pagamento de #amount#, que necessita de autorizaÃ§Ã£o, foi submetido por #member# (#login#)'),(362,'message','newPendingPaymentByReceiverMessage','VocÃª recebeu um pagamento de #amount# de #member# (#login#), e vocÃª deve autorizÃ¡-lo.<br>#link# para mais detalhes'),(363,'message','newPendingPaymentByReceiverSubject','VocÃª recebeu um pagamento e deve autorizÃ¡-lo'),(364,'message','newPendingPaymentByReceiverSms','VocÃª recebeu um pagamento de #amount# de #member# (#login#), e vocÃª deve autorizÃ¡-lo'),(365,'message','newPendingPaymentByPayerMessage','Um pagamento de #amount# que vocÃª realizou para #member# (#login#) agora precisa de sua autorizaÃ§Ã£o para ser processado.<br>#link# para maiores detalhes'),(366,'message','newPendingPaymentByPayerSubject','Um pagamento que vocÃª realizou necessita de sua autorizaÃ§Ã£o'),(367,'message','newPendingPaymentByPayerSms','Um pagamento de #amount# que vocÃª realizou para #member# (#login#) agora precisa de sua autorizaÃ§Ã£o para ser processado'),(368,'message','newPendingPaymentByBrokerMessage','Um pagamento de #amount# foi realizado por #member# (#login#), e vocÃª deve autorizÃ¡-lo.<br>#link# para mais detalhes'),(369,'message','newPendingPaymentByBrokerSubject','SolicitaÃ§Ã£o de autorizaÃ§Ã£o para pagamento'),(370,'message','newPendingPaymentByBrokerSms','Um pagamento de #amount# foi realizado por #member# (#login#), e vocÃª deve autorizÃ¡-lo'),(371,'message','pendingPaymentAuthorizedMessage','Pagamento submetido em #date# de #amount# foi autorizado.<br>#link# para mais detalhes'),(372,'message','pendingPaymentAuthorizedSubject','Pagamento pendente foi autorizado'),(373,'message','pendingPaymentAuthorizedSms','Pagamento submetido em #date# de #amount# foi autorizado'),(374,'message','pendingPaymentDeniedMessage','Pagamento submetido em #date# de #amount# foi negado.<br>#link# para mais detalhes'),(375,'message','pendingPaymentDeniedSubject','Pagamento pendente foi negado'),(376,'message','pendingPaymentDeniedSms','Pagamento submetido em #date# de #amount# foi negado'),(377,'message','pendingPaymentCanceledMessage','Pagamento submetido em #date# de #amount# foi cancelado.<br>#link# para mais detalhes'),(378,'message','pendingPaymentCanceledSubject','Pagamento pendente foi cancelado'),(379,'message','pendingPaymentCanceledSms','Pagamento submetido em #date# de #amount# foi cancelado'),(380,'message','scheduledPaymentsCancelledToOtherMessage','All scheduled payments related to #member# (#login#) were cancelled because that member can not make/accept those payments.'),(381,'message','scheduledPaymentsCancelledToOtherSubject','Scheduled payments cancelled'),(382,'message','scheduledPaymentsCancelledToOtherSms','All scheduled payments related to #login# were cancelled.'),(383,'message','scheduledPaymentsCancelledMessage','Some of yours scheduled payments were cancelled because you no longer have the following accounts: #accounts#.'),(384,'message','scheduledPaymentsCancelledSubject','Scheduled payments cancelled'),(385,'message','scheduledPaymentsCancelledSms','Some of yours scheduled payments were cancelled.'),(386,'message','scheduledPaymentProcessedMessage','Um pagamento agendado para #member# (#login#) de #amount# for processado com sucesso.<br>#link# para mais detalhes'),(387,'message','scheduledPaymentProcessedSubject','Pagamento agendado processado'),(388,'message','scheduledPaymentProcessedSms','Um pagamento agendado para #member# (#login#) de #amount# for processado com sucesso'),(389,'message','scheduledPaymentFailedToPayerMessage','Um pagamento agendado de #member# (#login#) de #amount# falhou.<br>#link# para mais detalhes'),(390,'message','scheduledPaymentFailedToPayerSubject','Pagamento agendado falhou'),(391,'message','scheduledPaymentFailedToPayerSms','Um pagamento agendado de #member# (#login#) de #amount# falhou'),(392,'message','scheduledPaymentFailedToPayeeMessage','Um pagamento agendado de #member# (#login#) de #amount# falhou.<br>#link# para mais detalhes'),(393,'message','scheduledPaymentFailedToPayeeSubject','Pagamento recebido falhou'),(394,'message','scheduledPaymentFailedToPayeeSms','Um pagamento agendado de #member# (#login#) de #amount# falhou'),(395,'message','externalChannelPaymentPerformedMessage','VocÃª realizou um pagamento por #channel# de #amount# para #member# (#login#). <br>#link# para mais detalhes'),(396,'message','externalChannelPaymentPerformedSubject','Pagamento realizado por canal externo'),(397,'message','externalChannelPaymentPerformedSms','VocÃª realizou um pagamento por #channel# de #amount# para #member# (#login#)'),(398,'message','externalChannelPaymentRequestExpiredPayerMessage','A solicitaÃ§Ã£o de pagamento por #channel# no valor de #amount# realizada por #toMemberName# (#toMemberUsername#) venceu.<br>#link# para mais detalhes'),(399,'message','externalChannelPaymentRequestExpiredPayerSubject','SolicitaÃ§Ã£o de pagamento por canal externo venceu'),(400,'message','externalChannelPaymentRequestExpiredPayerSms','A solicitaÃ§Ã£o de pagamento por #channel# no valor de #amount# realizada por #toMemberName# (#toMemberUsername#) venceu'),(401,'message','externalChannelPaymentRequestExpiredReceiverMessage','A solicitaÃ§Ã£o de pagamento por #channel# no valor de  #amount# solicitada por vocÃª para #from_member# (#from_login#) venceu.<br>#link# para mais detalhes'),(402,'message','externalChannelPaymentRequestExpiredReceiverSubject','SolicitaÃ§Ã£o de pagamento por canal externo venceu'),(403,'message','externalChannelPaymentRequestExpiredReceiverSms','A solicitaÃ§Ã£o de pagamento por #channel# no valor de #amount# solicitada por vocÃª para #from_member# (#from_login#) venceu'),(404,'message','referenceReceivedMessage','Uma referÃªncia foi dada pelo membro #member# (#login#).<br>#link# para mais detalhes'),(405,'message','referenceReceivedSubject','ReferÃªncia recebida'),(406,'message','referenceReceivedSms','Uma referÃªncia foi recebida de #login#'),(407,'message','transactionFeedbackReceivedMessage','VocÃª recebeu a qualificaÃ§Ã£o da transaÃ§Ã£o realizada com #member# (#login#) de #amount# em #date#.<br>#link# para mais detalhes'),(408,'message','transactionFeedbackReceivedSubject','QualificaÃ§Ã£o de transaÃ§Ã£o recebida'),(409,'message','transactionFeedbackReceivedSms','Uma qualificaÃ§Ã£o de transaÃ§Ã£o foi recebida desde #login# par ao pagamento de #amount# em #date#. Esta qualificaÃ§Ã£o pode ser replicada atÃ© #limit#'),(410,'message','transactionFeedbackReplyMessage','A qualificaÃ§Ã£o da transaÃ§Ã£o com #member# (#login#) de #amount# em #date# recebeu uma rÃ©plica.<br>#link# para mais detalhes'),(411,'message','transactionFeedbackReplySubject','RÃ©plica de qualificaÃ§Ã£o de transaÃ§Ã£o'),(412,'message','transactionFeedbackReplySms','Uma qualificaÃ§Ã£o de transaÃ§Ã£o desde #login# para o pagamento de #amount# em #date# recebeu uma resposta'),(413,'message','transactionFeedbackAdminCommentsMessage','A qualificaÃ§Ã£o da transaÃ§Ã£o com #member# (#login#) de #amount# em #date# recebeu comentÃ¡rios da administraÃ§Ã£o.<br>#link# para mais detalhes'),(414,'message','transactionFeedbackAdminCommentsSubject','ComentÃ¡rios da administraÃ§Ã£o de qualificaÃ§Ã£o de transaÃ§Ã£o'),(415,'message','transactionFeedbackAdminCommentsSms','Nova qualificaÃ§Ã£o de transaÃ§Ã£o para a transaÃ§Ã£o com #login# de #amount# em #date#'),(416,'message','transactionFeedbackRequestMessage','Por favor, qualifique a transaÃ§Ã£o com #member# (#login#) de #amount# em #date#.<br>VocÃª tem atÃ© o dia #limit# para qualificar esta transaÃ§Ã£o.<br>#link# para maiores detalhes'),(417,'message','transactionFeedbackRequestSubject','Qualificar transaÃ§Ã£o'),(418,'message','transactionFeedbackRequestSms','Por favor, de uma qualificaÃ§Ã£o para a transaÃ§Ã£o com #login# de #amount# em #date#. VocÃª pode dar sua qualificaÃ§Ã£o atÃ© #limit#'),(419,'message','accountFeeReceivedMessage','#account_fee#, no valor de #amount# foi recebido.<br>#link# para mais detalhes'),(420,'message','accountFeeReceivedSubject','#account_fee# recebido'),(421,'message','accountFeeReceivedSms','#account_fee# de #amount# recebido'),(422,'message','maxTransactionPasswordTriesMessage','VocÃª atingiu o limite de tentativas da senha de transaÃ§Ã£o.<br>Agora, sua senha de transaÃ§Ã£o estÃ¡ bloqueada.<br>Por favor, contate a administraÃ§Ã£o.'),(423,'message','maxTransactionPasswordTriesSubject','Limite de tentativas de senha de transaÃ§Ã£o excedido'),(424,'message','maxTransactionPasswordTriesSms','VocÃª atingiu o limite de tentativas da senha de transaÃ§Ã£o. Sua senha de transaÃ§Ã£o estÃ¡ bloqueada. Contate a administraÃ§Ã£o.'),(425,'message','certificationIssuedMessage','Uma nova certificaÃ§Ã£o de #amount# foi emitida por #issuer_member# (#issuer_login#).<br>#link# para mais detalhes'),(426,'message','certificationIssuedSubject','Uma nova certificaÃ§Ã£o foi emitida'),(427,'message','certificationIssuedSms','Uma nova certificaÃ§Ã£o de #amount# foi emitida por #issuer_login#'),(428,'message','certificationStatusChangedMessage','O estado da certificaÃ§Ã£o de #amount# emitida por #issuer_member# (#issuer_login#) mudou para \"#status#\".<br>#link# para mais detalhes'),(429,'message','certificationStatusChangedSubject','O estado da certificaÃ§Ã£o mudou'),(430,'message','certificationStatusChangedSms','O estado da certificaÃ§Ã£o de #amount# emitida por #issuer_login# foi alterado para\"#status#\"'),(431,'message','expiredCertificationMessage','Uma certificaÃ§Ã£o de #amount# emitida por #buyer_member# (#buyerUserName#) venceu.<br>#link# para mais detalhes'),(432,'message','expiredCertificationSubject','Uma certificaÃ§Ã£o venceu'),(433,'message','expiredCertificationSms','A certificaÃ§Ã£o de #amount# emitida para #buyer_login# expirou'),(434,'message','expiredGuaranteeMessage','A garantia de #amount# emitida por #buyer_member# (#buyer_login#) venceu.<br>#link# para mais detalhes'),(435,'message','expiredGuaranteeSubject','Uma garantia venceu'),(436,'message','expiredGuaranteeSms','A garantia de #amount# emitida para #buyer_login# expirou'),(437,'message','buyerOnlyGuaranteeStatusChangedMessage','O estado da garantia de #amount# emitida por #issuer_member# (#issuer_login#) mudou para \"#status#\".<br>#link# para mais detalhes'),(438,'message','buyerOnlyGuaranteeStatusChangedSubject','O estado de uma garantia mudou'),(439,'message','buyerOnlyGuaranteeStatusChangedSms','O estado da garantia de #amount# emitida por #issuer_login# foi alterada para \"#status#\"'),(440,'message','guaranteeStatusChangedMessage','O estado da garantia de #amount# mudou para \"#status#\".<br>Emissor: #issuer_member# (#issuer_login#)<br>Comprador: #buyer_member# (#buyer_login#)<br>Vendedor: #seller_member# (#seller_login#)<br>#link# para mais detalhes'),(441,'message','guaranteeStatusChangedSubject','O estado de uma garantia mudou'),(442,'message','guaranteeStatusChangedSms','O estado da garantia de #amount# foi alterado para \"#status#\". emissor: #issuer_login#, comprador: #buyer_login#, vendedor: #seller_login#'),(443,'message','pendingBuyerOnlyGuaranteeIssuerMessage','Uma nova garantia foi solicitada e estÃ¡ aguardando sua autorizaÃ§Ã£o.<br>Comprador: #buyer_member# (#buyer_login#)<br>Valor: #amount#<br>#link# para mais detalhes'),(444,'message','pendingBuyerOnlyGuaranteeIssuerSubject','Nova garantia pendente aguardando autorizaÃ§Ã£o'),(445,'message','pendingBuyerOnlyGuaranteeIssuerSms','Uma nova garantia foi solicitada e esta aguardando a sua autorizaÃ§Ã£o. Comprador: #buyer_login#,  valor: #amount#'),(446,'message','pendingGuaranteeIssuerMessage','Uma nova garantia foi solicitada e estÃ¡ aguardando sua autorizaÃ§Ã£o.<br>Comprador: #buyer_member# (#buyer_login#)<br>Vendedor: #seller_member# (#seller_login#)<br>Valor: #amount#<br>#link# para mais detalhes'),(447,'message','pendingGuaranteeIssuerSubject','Nova garantia pendente aguardando autorizaÃ§Ã£o'),(448,'message','pendingGuaranteeIssuerSms','Uma nova garantia foi solicitada e esta aguardando a sua autorizaÃ§Ã£o. Comprador: #buyer_login#, vendedor: #seller_login#, valor: #amount#'),(449,'message','paymentObligationRegisteredMessage','Uma nova obrigaÃ§Ã£o de pagamento de #amount# foi emitida por #buyer_member# (#buyer_login#).<br>#link# para mais detalhes'),(450,'message','paymentObligationRegisteredSubject','Uma nova obrigaÃ§Ã£o de pagamento foi emitida'),(451,'message','paymentObligationRegisteredSms','Uma nova obrigaÃ§Ã£o de pagamento de #amount# foi emitida por #buyer_login#.'),(452,'message','paymentObligationRejectedMessage','A obrigaÃ§Ã£o de pagamento de #amount# foi rejeitada por #seller_member# (#seller_login#). <br>#link# para mais detalhes'),(453,'message','paymentObligationRejectedSubject','Uma obrigaÃ§Ã£o de pagamento foi rejeitada'),(454,'message','paymentObligationRejectedSms','A obrigaÃ§Ã£o de pagamento de #amount# foi rejeitada por #seller_login#'),(455,'message','adminPendingBuyerOnlyGuaranteeMessage','Uma nova garantia foi solicitada e estÃ¡ aguardando autorizaÃ§Ã£o.<br>Emissor: #issuer_member# (#issuer_login#)<br>Comprador: #buyer_member# (#buyer_login#)<br>Valor: #amount#<br>#link# para mais detalhes'),(456,'message','adminPendingBuyerOnlyGuaranteeSubject','Nova garantia pendente aguardando autorizaÃ§Ã£o'),(457,'message','adminPendingGuaranteeMessage','Uma nova garantia foi solicitada e estÃ¡ aguardando autorizaÃ§Ã£o.<br>Emissor: #issuer_member# (#issuer_login#)<br>Comprador: #buyer_member# (#buyer_login#)<br>Vendedor: #seller_member# (#seller_login#)<br>Valor: #amount#<br>#link# para mais detalhes'),(458,'message','adminPendingGuaranteeSubject','Nova garantia pendente aguardando autorizaÃ§Ã£o'),(459,'message','adminApplicationErrorMessage','Houve um erro da aplicaÃ§Ã£o no caminho \'#path#\'.<br>#link# para mais detalhes'),(460,'message','adminApplicationErrorSubject','Erro na aplicaÃ§Ã£o'),(461,'message','adminPaymentFromSystemToMemberMessage','#payment_type# de #amount# para #member# (#login#).<br>#link# para mais detalhes'),(462,'message','adminPaymentFromSystemToMemberSubject','Novo pagamento a partir de #from_account#'),(463,'message','adminPaymentFromMemberToSystemMessage','#payment_type# de #amount# para #member# (#login#).<br>#link# para mais detalhes'),(464,'message','adminPaymentFromMemberToSystemSubject','Novo pagamento para #to_account#'),(465,'message','adminPaymentFromSystemToSystemMessage','#payment_type# de #amount#.<br>#link# para mais detalhes'),(466,'message','adminPaymentFromSystemToSystemSubject','Novo pagamento entre #from_account# e #to_account#'),(467,'message','adminNewPendingPaymentMessage','Um pagamento de #amount# foi realizado por #member# (#login#), e vocÃª deve autorizÃ¡-lo.<br>#link# para mais detalhes'),(468,'message','adminNewPendingPaymentSubject','SolicitaÃ§Ã£o de autorizaÃ§Ã£o de pagamento'),(469,'message','adminNewMemberMessage','#member# cadastrou-se em #group#.<br>#link# para mais detalhes'),(470,'message','adminNewMemberSubject','Novo membro em #group#'),(471,'message','adminSystemAlertSubject','Novo alerta de sistema'),(472,'message','adminMemberAlertSubject','Novo alerta do membro #member# (#login#)'),(473,'message','adminSystemInvoiceMessage','Nova fatura de sistema de #amount# enviada por #member# (#login#).<br>#link# para mais detalhes'),(474,'message','adminSystemInvoiceSubject','Nova fatura de sistema'),(475,'message','brokerRemovedRemarkComments','O corretor #member# (#login#) foi removido'),(476,'message','messageMailSubjectPrefix','#system_name#:'),(477,'message','messageMailSuffixPlain','Por favor, nÃ£o responda este e-mail. VocÃª pode entrar na sua conta do Cyclos em #link# para responder suas mensagens'),(478,'message','messageMailSuffixHtml','<span style=\'font-size:smaller;color:SlateGray;\'>Por favor, nÃ£o responda este e-mail. VocÃª pode entrar na sua conta do #link# para responder suas mensagens</span>'),(479,'message','smsMessagePrefix','#system_name#:');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
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
  CONSTRAINT `FK8C2BD41DB0A99719` FOREIGN KEY (`parent_id`) REFERENCES `custom_field_possible_values` (`id`),
  CONSTRAINT `FK8C2BD41DD6C28FF7` FOREIGN KEY (`field_id`) REFERENCES `custom_fields` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_possible_values`
--

LOCK TABLES `custom_field_possible_values` WRITE;
/*!40000 ALTER TABLE `custom_field_possible_values` DISABLE KEYS */;
INSERT INTO `custom_field_possible_values` VALUES (1,2,NULL,'Male','','\0'),(2,2,NULL,'Female','','\0'),(4,14,NULL,'personal','','\0'),(5,14,NULL,'corporate','','\0'),(6,15,NULL,'Brazil','','\0'),(7,16,6,'Acre','','\0'),(8,16,6,'Alagoas','','\0'),(9,16,6,'AmapÃ¡','','\0'),(10,16,6,'Amazonas','','\0'),(11,16,6,'Bahia','','\0'),(12,16,6,'CearÃ¡','','\0'),(13,16,6,'Distrito Federal','','\0'),(14,16,6,'EspÃ­rito Santo','','\0'),(15,16,6,'GoiÃ¡s','','\0'),(16,16,6,'MaranhÃ£o','','\0'),(17,16,6,'Mato Grosso','','\0'),(18,16,6,'Mato Grosso do Sul','','\0'),(19,16,6,'Minas Gerais','','\0'),(20,16,6,'ParanÃ¡','','\0'),(21,16,6,'ParaÃ­ba','','\0'),(22,16,6,'ParÃ¡','','\0'),(23,16,6,'Pernambuco','','\0'),(24,16,6,'PiauÃ­','','\0'),(25,16,6,'Rio de Janeiro','','\0'),(26,16,6,'Rio Grande do Norte','','\0'),(27,16,6,'Rio Grande do Sul','','\0'),(28,16,6,'RondÃ´nia','','\0'),(29,16,6,'RoraÃ­ma','','\0'),(30,16,6,'Santa Catarina','','\0'),(31,16,6,'Sergipe','','\0'),(32,16,6,'SÃ£o Paulo','','\0'),(33,16,6,'Tocantins','','\0'),(34,29,NULL,'Brazil','','\0'),(35,30,34,'Acre','','\0'),(36,30,34,'Alagoas','','\0'),(37,30,34,'AmapÃ¡','','\0'),(38,30,34,'Amazonas','','\0'),(39,30,34,'Bahia','','\0'),(40,30,34,'CearÃ¡','','\0'),(41,30,34,'Distrito Federal','','\0'),(42,30,34,'EspÃ­rito Santo','','\0'),(43,30,34,'GoiÃ¡s','','\0'),(44,30,34,'MaranhÃ£o','','\0'),(45,30,34,'Mato Grosso','','\0'),(46,30,34,'Mato Grosso do Sul','','\0'),(47,30,34,'Minas Gerais','','\0'),(48,30,34,'ParanÃ¡','','\0'),(49,30,34,'ParaÃ­ba','','\0'),(50,30,34,'ParÃ¡','','\0'),(51,30,34,'Pernambuco','','\0'),(52,30,34,'PiauÃ­','','\0'),(53,30,34,'Rio de Janeiro','','\0'),(54,30,34,'Rio Grande do Norte','','\0'),(55,30,34,'Rio Grande do Sul','','\0'),(56,30,34,'RondÃ´nia','','\0'),(57,30,34,'RoraÃ­ma','','\0'),(58,30,34,'Santa Catarina','','\0'),(59,30,34,'Sergipe','','\0'),(60,30,34,'SÃ£o Paulo','','\0'),(61,30,34,'Tocantins','','\0');
/*!40000 ALTER TABLE `custom_field_possible_values` ENABLE KEYS */;
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
  CONSTRAINT `FKEA45ED05123F9A53` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKEA45ED053317FFBA` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_limit_logs`
--

LOCK TABLES `account_limit_logs` WRITE;
/*!40000 ALTER TABLE `account_limit_logs` DISABLE KEYS */;
INSERT INTO `account_limit_logs` VALUES (1,2,'2013-12-15 00:42:49',1,0.000000,NULL),(2,4,'2013-12-15 00:51:23',1,0.000000,NULL),(3,2,'2013-12-15 01:03:18',1,0.000000,NULL),(4,2,'2013-12-15 01:03:54',1,0.000000,NULL);
/*!40000 ALTER TABLE `account_limit_logs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'sys','active.gif','image/gif',565,'2013-12-14 18:15:35',565,'GIF89a\0\0ÆV\0jr\0x\0l\0ƒ\0.g.x”##—A|A\0¬\0!–!™\0®\0\0±\0\0²\066%%§²#¤#2›2\0¾\0*¡*À1¢1¾7 77¡7; ;¹\0Ê\0\0Ï\04®4½\0Ó\0\0Õ\0K¥K\0Ú\0\0Û\0\0İ\0U¢U\0à\0Îh h\0é\0\0î\0R¸L\0ñ\0í\0ó\0p¦pu§u\nõ\n\0ş\0ƒ¦ƒ‹¯‹|Èyš¶šƒÆƒˆÄˆŒÃŒ·¼—Á——Æ—·É·¾Ï¾¶Ü¶¾İ¾ÁÛÁÉ×ÉÆŞÆÍáÍ×â×ĞêĞÜïÜãñãâòâåñååòåèñèéñéìôìÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0y€‚ƒ„…†‡„Pˆ„N;1F‹R=M\nG†U>#O? JƒSC-$\'Q‚H3\rKB\Z7+„T4*	/85†.!2%&0/6‡A)(,\":ˆL!\"<‹\0@ã9DêIEğõö„\0;','GIF89a\0\0ÆV\0jr\0x\0l\0ƒ\0.g.x”##—A|A\0¬\0!–!™\0®\0\0±\0\0²\066%%§²#¤#2›2\0¾\0*¡*À1¢1¾7 77¡7; ;¹\0Ê\0\0Ï\04®4½\0Ó\0\0Õ\0K¥K\0Ú\0\0Û\0\0İ\0U¢U\0à\0Îh h\0é\0\0î\0R¸L\0ñ\0í\0ó\0p¦pu§u\nõ\n\0ş\0ƒ¦ƒ‹¯‹|Èyš¶šƒÆƒˆÄˆŒÃŒ·¼—Á——Æ—·É·¾Ï¾¶Ü¶¾İ¾ÁÛÁÉ×ÉÆŞÆÍáÍ×â×ĞêĞÜïÜãñãâòâåñååòåèñèéñéìôìÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0y€‚ƒ„…†‡„Pˆ„N;1F‹R=M\nG†U>#O? JƒSC-$\'Q‚H3\rKB\Z7+„T4*	/85†.!2%&0/6‡A)(,\":ˆL!\"<‹\0@ã9DêIEğõö„\0;',NULL,NULL,NULL,NULL),(2,'sys','calendar.gif','image/gif',154,'2013-12-14 18:15:35',154,'GIF89a\0\0ã\0fff•p\0­”JÊ—\0ÆªªÙ³?ÄÂÃÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with GIMP\0!ù\0\0\0,\0\0\0\0\0\0\02°È2! 9ÎÁ\0€$	ª‡-êÆ`ÜxnÀsÿÊ@šM§ãgF\Zh:Ÿ€\0;','GIF89a\0\0ã\0fff•p\0­”JÊ—\0ÆªªÙ³?ÄÂÃÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with GIMP\0!ù\0\0\0,\0\0\0\0\0\0\02°È2! 9ÎÁ\0€$	ª‡-êÆ`ÜxnÀsÿÊ@šM§ãgF\Zh:Ÿ€\0;',NULL,NULL,NULL,NULL),(3,'sys','captchaBackground.jpg','image/jpeg',8164,'2013-12-14 18:15:36',1277,'ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0ÿÛ\0CÿÀ\0\0<\0È\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0S\0		\0\0\0\0\0!1A\"Qa–¡Ò2BUVq‘”ÔTbr“	$35CRWduv’£±²´ÁÑÓáğ7Fs¢¤ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0K\0	\0\0\0\0\0!1AQaÒq‘“¡Ñ\"RST’±2Bs²ÁÓ#bráğ456DUc³3CƒñÿÚ\0\0\0?\0ı…Ù–›&Ï´äÊ´­‰2d[P&DŠqÇÂ\n”¥d’I$dëÅ—bïİG®Ô¢Ü•iK-6I- ’JI$bIÎcÑ‚İ¼,ÛÓ(DÃ!Å€Ô\0F€\nà!Ëà]‹ò2Óôr?±§ŞM\\ïsg²Fì4r†ó{Ë½¢ücXŸ#m/Gcû\ZĞ]ë ?É3Ù#v5úzñûã½¢¼c>Ø¿#-?G#û\ZíÉËŸîLöHİ\r½yGù×~5xÆÂÉ±‰	]¨TO$‹n?±¬òné/4ƒ5û¤nÆUn^Šùk½¢üaA­²¶^\0··ÖÖÔWmGOõ£K›¸v3â©³Zì>b9{­¦ë‡ÿ\0büc§îQnğ•ÒÈêGéLÿ\0gJ‡ÖAú=Í¿Â¯½¨ükñ6ÆÚl­¾¶HŸGmÇ_õ#\\¸38›5®Éäa¾Ûpá:çh¿LU“c¤”ªÊµ y¥VÜpGôzmUÙº‰42,ƒ÷Hİ…¢ñ^\"*&İí½ğ.Åùiú9ØÖ99t=ÉÉ±PŞ?{w´^ôØ¿#-?G#û\Z99t=ÉÉ°r†ñûÛ½¢÷ ğ.Åùiú9ØÑÉË¡îLöHİƒ”7Şİí½v/ÈËOÑÈşÆN]rg²Fì¡¼~öïh½è<±~FZ~Gö4rrè{“=’7`å\rã÷·{EïAà]‹ò2Óôr?±£“—CÜ™ì‘»(o½»Ú/z66E”…*ÉµBUïTm¨ø?Ñëcv.šSS\"Í>é±x¯	4òÇ;EïG¤{Ë”óqãÙ£:¬6„Û‘ùŸæk¤½ÔºÓOÛ‘d¨æR<#W/-àeJœtşâücjgR&1\n¡cZ¬.Za»àìbÛÅ#*JTï€9á8$F@$,´n-Ş²Èã¤\0æ<Z)Íõc”µë·&ÒJ\'Ã÷×ãşØ¿#-?G#û\ZmäåĞ÷&{$nÂPŞ?{w´^ôØ¿#-?G#û\Z99t=ÉÉ°r†ñûÛ½¢÷ ğ.Åùiú9ØÑÉË¡îLöHİƒ”7Şİí½M»±ªR•ÙV™aüÛqğG`ıo´ú³§{åİBp\"ÎJq?²GWÕÓ§ïMã–b¢mÚœß´^ô?şæ»kûßÙ‰Åÿ\0OS¾C\\?ôÙ~Å½Ør²ö{óİ¢÷ ûší¯ïdz\'ı=†¸é²ı‹{°r²ö{óİ¢÷¡Ÿ¸[}·Ğ¬âd+Ï‰2%ŸSv$¨¶ÌvİiÔÆYJĞ Œ¥@€AÁ\ZŒ_k›r¥ndû­H0•¥—H!¦Á!DBj8‚1nµæ¼óšQ·\'RTë`‚âÈ ¬TM#8ŠiE­ÖZ£ÒZn¯Tm¦©‘ÒÓmNZR”†À\0. 5æ*ÑE”ÊC˜\'ğˆô$ıg»<â”R¢{Ì*¦á¯#5º¯_Â¨9íiÇéIñ™Ã‡f× GC7UÎ…Š³RZÔp”dŸ \nÎ”\"ğ[Et]Ë‚J\"q´è7¼”7.à¬¹*ÀRiíÄl¾¡øD£ù¹Ÿ›VµŞ»·‚h§ÈIû z]:yæŠòÜ´lInY¼µkû=\Zû‡<LĞå &<Hˆ\0`¬3…ŸYÉÕ¥&X’M\Z@>¼ñ_ÌKyAªõÍ\nÉ¯Û#àvp;şÓˆ´Uª7R£¥¨‹ä¾•¿)R2=Zê‰äi„ë³„v763¤ä6IêOÑ¥	›B8g[Î#I1#LIL–\Zxc‘[c#æ=c\\fY“›M@W<\r8ó\nªM!™SµŞ@SôÅ‡’&+ŠCñOoÌu\nµ.Ó­‚¹eTz§?AÓÓ×’¶²èº)¶¦I\nZ…¶¢J‘‚ëËPg&ø¥”œ‰f¢£ïŸ>µòñ®$êƒ¾|ú<¼kx±ªùóèòñ®3ÅlV*b¼Ô™Íºô8îÊm†K‹-ƒ•a eGä9¡ÏJä-	TÎ¶^>…Ey«Œr}‡TÊ‚>µ0ç®è-Í²¬]’ºïšnÑG ¼»\rØòPêçV”Ú“OfI%×\\yM¡)Fx‚ˆ>)V®;É;e·w\\qÅŒ“’j3ÓÑÉÖkJSå\nN}ûi\r!\'*¾–Á_K+P¦züá—^­ÅƒI®Æ„ÊkŒDm÷hÒe)¦–â›Ã¬-`=ú€Q\n	PJŠUŒ\Z‚Ê·×fN¡ğ*Fq¬ğÛù¹æZSG1Ó«\ZƒİÕQÍÁ|nnëßv<eíİSlì\r¿­ÈªÖj÷5v‰õ‰æñX‹ˆ:”Çc®-×T•(¡	JŒtñy/£vâÓM”!\'(“J“B\0®âc•™b3e6µ©Àµ¨P\0\r\0¨$’@Ç\0‰QÙA”0ãÄ4Ü—‹q–ïŠpJROYÀ\'Ÿ-Gx÷¸2‡#]0ëÍ\niRˆÄg¾|úååã\\gŠÙ|ùôyx×²$ÛI’İ5RHÂ¥ºH8ø)ä=|Z³®€³K§:ÏpÃçXŠ[*\nšÉõGÎ<jòúµ+ã“\r	ƒ^_V90d&[”¥¹¿ùÿ\0ÙU^Ïà®j+~İI¹ˆÿ\0aïøÕ¤”òªKï[üb>}Rb©ŸÅìÿ\0`kÇ6_÷k?ÂŸUMÿ\0k_9ùÂ’R¥©(BTµ­@!	$ —¥*Z€¤ÂbBENh³VßG¡°ÅZ¬Ê^­¸&ÛsšbƒÔ\0ıß”öuÒo»›rØ²ZLÌÊjùÄ™ß½¬èÌ5šzô^—m\'\Z24úßËPÓœì•5bD&\rA¢Õ<\\óù5ÍKÕ®1©˜\'ÉË«YcØ¡\nd¾óDtn­ø<}zÊ\\uÖ4S\r¯8ôUd¤\0èC£·<ÓşÚQåjN‰V{K5Í\r»š\Z°Ë“\"7Ş•†‘–×€Rö¼YòöÙË<µ¼6+»%ÆÅ…l?‘ÑÍ¬õ®Ia+Å-£Â!ŠuÇ\Zjİe.¥2cº¦äÇ^Ğ´œ)+I÷¤êœTàiÒ…à hAÑEÉ>ÊAF)8‚5BÒ&qsIIó‘¬	ôäB¥#Ú;K}¨ñ^yçZi°	Rf»ËºìÛéi±U(Ğ¤Ç5–›AR\0ÄÂ­ÁJª[˜Vi\r@yÄ6äæÜJšeÕ¨%´8s”ñ)@àd$%­v­Ë\ZOy##M\riÏâ*!²JÓ’Ÿ{‹lúZ*3óUïˆ\\íÓ*ğjÿ\0VŞZ*¼£¾§£Ü¢¶_mõ{çQË	pö¬#åÔHÌ´H:¡ø=8\ZÈË91\'wÙò£[ùh×	¸•AßgÊ>Z5ÁÄªû‘¹÷Ó¶\rkk-m¶®Õn{ˆ4[ğÔ¡µB¦´ñ<3ŸZŸôp °ÚQ[§…@$Ø\"şÙâê\"Ù.ä”ŒÙ?ÅµógÓì]µ}4&Ôà(Œr>ÈÂ”9³æ0öD•¥JÜ-)K)ˆöœj¾òÑ®8•Fİö|£èÑå£\\J¢u·üJ-3?\n\"Ö>?ñÕõw”a±µ õãùÅwi§*ĞsŸå„,qøFxØCÅÁÄ?á\Z8Ø8¸eîB‡ÜîışEÕ;GŞÎj/~­Ê´>áßøÕ¦Š^™?½oñˆ ´ŸØªgñ{?Ø\Zò=—ıÚÏğ§ä#Ô“Ú×Î~q`6†Ó_]Ã.?J–èé-©9Ë¿	`vã|ö\\ü\Z]±6ñu5\0Ñn“Ñ˜m®‘û·»BQµR¢ªæĞ:sœñf—A–Tà\r¸âPH‡<e \'?9ÇŸWïĞÓyÂº¢œœ¾]1¦¸AiÖŞ@q²Jx”•$¥IRI\nJæ ƒÌAæ4Òj\r!Æé1›/¡yÄŠÃ!`-`^PÉó.œlÙDM¼r³E=0©vªœæ;®ZXb“2£KiBm2¯3\r¸OD¬õc_àœŒ¤»ÎÙl*\\–ÅvşC|¤û¡àjvßëùÃ\\§\\Ô:EÃH|I¥×)¬Ê§¾8™uI?A\Z‰2¤8ØZs¼…´éJ³Œ!X$®_—[’ pE4Æ¼Ê?›­±ŒTÁ€<êM`×@ä3­BÓM+ŒTèëuëu˜›¡BC‘ÕöØ»CÂKK!-H8íJ¸PIÂ‘Ø“ª¯„[–Dû#Ò.šF`z3qª,;•j%Ç“¸ƒŠyôœızá‹iît©Ñ˜S«jz1¥?œ?ËU\0™PÏI«¹(qFx˜èüjtøU6QÅ*#©RáJ%Æ\'•d$, «„•\0ŒòÎ¤7nğ&Å¶Z™PÊJN#a\Zm¡ÃlDí{«77&¶Ò)”3÷ŠçˆãºSºŠƒzíİÓ²ÛC@¾n×ÜjS´fcH±§ÓáP p=>tçÚC)KRÖ‰k+ZRÈñ–ôp‡wŸ°\\n]ykq%4¡¨¡& fÙ\\vc›½síIkUÌQ\r¶r«PkL@\0qÛH’à-øğa±&B¥>ÄFĞô¥n-)J?9ê‚ò£4J‰£§¾¿ÅWûë>Y¶0eÖg¾¼ş½cÊŒc‰Tõçõëc0DkÅÁß^^µò£}yız<¨ÆÜJ¢ÁÚ²Œ‹z’æAıH“ø$§ü5é§5år]_»N¬?(¬­†”Í¦âvüñ‡ò\rHxÈmÆ3ä\Z8È1†nã,½¾Ç.vmSû²õ¾«­ÍŸû—¡úê×”òzßãEhİ—\n‹„ñ½&,fÙO•JJ@I×–lF\\™“—mªP@ä\0#Òö‹¨a×V¬À¨aX¾öÃ4ûqºL¢GB#´îŠä¯ÆYÆ|ªùÎ½—våel„´ÂE‘’9õôób·&&-%8ñÅJ5<Úºp‰KSèˆE?³·^üoı¹G”Š·gË¢0ì¶ãiºÉ‰‰¬¤YHCC±iVyçUìÜÒ·J\rRœšÿ\01ü«¶&íJ-‹…,QJÊøk‡çıBUb˜‘X CR«AeiE2\\®™QIq—£Q(AJˆ €y¥óNÉ»Æ TêÖ?(LãI™h´£D’H­\r4ç=q[·;z÷Çphõ-´ÚÍŒ¾lšíËÈ5mÅÜ)0Ø¦Ñ£:\n‘ }Ã!Ğ’®pŒàœã„éi^YÙ¶Ì)*VJ 	H¡5:¡E`ÈJ<˜y*Jq	MI$h5ƒ\\Nö-©Å³-k2‹z¯A‹;ÎŸie°#óã:M.ÊeØKc0ŒÌ¾©™…8s“Xuë´pƒDh‚\rBejN¸i:^2&RëPŠçSŒ¸’•7\"yökŒÃ\rM0¦œJl1Õ‡İ–y. ÑI5â>&Ú—ë\"ø¹öö²òŒëNã—Oynt—\nRàó) (!\Zò½§$¹	çVt:ç’™Lô’Ne\0zâßRg\"ld8…$å#\ZmäcŞİÙˆf‰Ú…v¹­)¦İqt—Z	d+£	uµ¤òäI\\c‘ÕûbpQe¹f%s‹W\Z 	É ×FcR4è¤­›øò­&Y´ñi4“M8JÄS¹Ş¶¯Ë‹nk}í*·oÁ‡9©q‘Ñ÷Õ6_bB[$ğøì¾Ú’IÂ›8$“RŞ«ºõÙµÕ,¥e&•IÖ½¸PÄÊÅi‹Çf‰”`kB5ùb…¶+°dr–—Ú‡Ç¯Q…(ƒd>Ø‰Å 1tTİfKÁá0’––×“€‘äÎOùêmp.Âo]¦ é!¦À*¦s\\Ãehju\r±¼Ö‹–$°ÈÅjÍ³Y‰Z½¶9ğÔ(áê5M¦zÉmåºÒ•ƒ„ºÚ‰$ã%<+åÉCW]©ÁÙ“(eRô(qÚ	5\Zó¢ Òw®Ôaê¸rÓ¤Q¾[\"¬Ğn8ÕØOÉiğ*s Õ¡©aJ:#ÊfK*#‘(uµ§#¯í×˜§™™³çÃƒÓA óƒHµÛâm+”ÄTB×|6‘ùLoÅl‰›l+M:u1JÊ|€¶“ÅûSƒÉøÉWÓ«ß‚û`LÙ.K‹f£™_Ì¸¯ït‰jq.Óëñü©IæõêÎã„D²\'›×£dgn*ó·×ĞÇ]›Síş½F¯£ ÜéñşË¿PıuEç“ûÖÿ\0Š£³°››\\¶©âDZr^Çá!¯şEŸÉª;‚ùTMZ²™B¡)\né	Ã¾‘xß¹…KÙOäçQ§YÇº±oŸa™L=\ZChz<†”‡Ùq9JĞ¡…<„¯N¡Š“QÂòÙ×®‡©6ÇtÖæÙö|Ì¥úâI”ËG­¶*\no¾1È²¡åÒWÅ®â\n2¤£Vø©^ø\\ÃÖSjË\\²T½xÓª´î‰h¶‚ÍÙKE›BÌŠú\"÷Âß©T§½ÒË›)~ıçÜ<Ô£êÖ$¤˜g!\'I;cIéçíòÜè\Z\0Ù–B84AÇu¶ê¶ßCf4©Á§ÜuŞ£(WÎTàm\0v•˜ª‘KK›JW˜ÿ\0C¾8M,¢œâ·Ò¹J°6¾÷Üe˜tùÖm¾äØ“Ğ÷\ZæÔEÍIyd4ÏÆpøÁ$<Û­ÊËÙn<@ óf9©·\\ ±—53h6ÅIJ)]yÏFzìÕtùb|SƒkdMˆÛ¡§=òxÒœgQ¤«) ë‡…\'%DG^¶`Ñ\Z …İ-³awV&£é½lš]RaO$—Ò·b¨9L4ç9íÕ\rÂ$¢¼`}tƒó”]·aOØ!\'ì(Œç6Òİi«Ó#eÎ%peYÕv±ŒLUQù®ê¹Å·\n“pí†åŞNÒiÍÇ¥T¶î›¤&!´„¶K’[O`$)DÔr ¤ç7µßáVÍjËKs©Pu\0\n€U08¡:tW‚¶8:œ~ĞRåT-F´UAMt`\rF­4ë0îÁĞ¯­ìß«ß{·r„‹,İTXP-}µı0L‰û~œ§ËrGŠd:ü§_$‚R tÁg:Ç·ß.a4e)¨N°œÀ¤ÔÓhÛvŠ¹H7.ª¸N*¦•g lƒ¯d}\r­må¥]¦*—\"‹#a©%Óc¡—ã«±m¬°@89J±…ƒrO];»hI.ša@A ÿ\0F±UJ^[vRg( ’Açÿ\01¢‘Gö¯y\Z³*7Z¤ÌÚ2Ù¹k6íì‹~ym¿O˜¦W1–VâR¦J‹IÊøVÔ…Q×NØ–¸×ùwÍZ$ ‘ ¤àªjÏQ·M)Íã°Uzì&dQÊ\0t…S]zÍ‡Îà~ˆ§s%™@—2}ÆÜû½mP6ŞÄˆôªÌé‡“l)®ÔùV”÷@ÉÁ#„Ü…ı»ReÔ¼i‚S‰>æ‘ZI\\Ç92SE	Ò¥`D@=Ï\\Ô{u\rÆ@‰}_U^ãº!1•3]RRä.:|Íô?“^Qµ¦µ-\'&1Y$ôšÅÊå‘Å6–ÛŠ\0Hæ‘>72#ß­Èhù¸ğ}zk-¨B5J>œâ;iW#¶•n\rdq*\nÑU\Zldª2ˆ\n8í)ÀPó§\Zİ[iwzÙCÇêü\'?VqÍ\r6Å’«FEMSÒÎ9Çh¶Ñä1-†eEy©¤´—#¾ÊÂ´(e*I`‚uê$-¶“PqXŠyhSk)P¡í­£Xgn\'ı?¾¿‘Õ?îËÔnù„\'¾åßÀ¨}ºÿ\0âiO½oñˆhlM‰IƒC V¤…K©Tmˆî…©d!´8„(%)¸#$öçµÃû¡fÊXòÓNzN­”€($ĞlæøG¼³ÓSïK£Ñm´H­(xßÕx;~º-N©$¦Ş¯ÜSW)ò…2Aá’\0ËKX\räøÉZÓÍA^%›lÊµg¤8>¡ „æèÑÏİ²Şrx–éé^p3ôşP¯¦ØWˆ Ñ\Z *>ZªlöCğæ²¦ä5ÆRJOhP ¤°A j¤…¦†6JŠQö¡ÜáO¹kÔ™÷îæî¦â[VõI¹t+î¹Rõ)¹-+--ô¥´®IAæêYÏY:Dô“³JsªZ!$áÓ¯¦°½©ôK ñ-%\n8F®ˆ±à\0\0\0\0 4¾ Ñ\Z ƒDğ×ôVx{­´Ö;öE“-©a¦åÙü¥×~S|&¥>^ÉÓ’~Î-Ş	6{ÃFPùC¹ÚæSÇeNuË:ªœaXúŞ–;jærÏIôÇ!fT©Ğª0ktW˜f­Kx»rš.2TP¤) Ä…!kIÁe$(ìKfnÁ´Ñ4ÇÖNƒ˜ƒœqâ1†ëRÍ—µä.ïÕV¬ãH=97º×º\rÚd«omûàB¼f²¦£_7.àÆ~Ş€¥rCHBd?ÃïƒjCy<‰Ç]½5ÃJ“£,é\ZM@=è®åx1Jfªóà¶4\0B^¾#M¤Û÷vÖÈnN¬É¸ëL•>é¸åş¹PªËuOK¡ÙÆë‹?6©‡Ü™}N,ÕJ5\'i‹P%´$%‰€j4=ÑE£50Ô[¤Ó¨(åS‘âõëŒf¦ôF ä 3û zÜ†ÈŒ)¦È9Ì—£¸ØRüdõÃ®%)ãS&Ò„ymvı\'kjê³7£!‹2|œÑ+ï¨­4Ç”y¶ñìaD“Åğœø¤”ÚW÷·g¤JMÙı“êì;w6hëºy>S,ŸÚãÖÚ6üùóßèó¦•\ZZ$Æ’Ò\\\";m¸Ú†R¤¨r ‚#¯WjBF ÅJ¦òTA\"\Z›€û†Â½’]$F¤)ş½F¯£i:ü.şCåÙj—SïüB*·İ%|Úôê]2ŸJµI¥³:æA¥©¶Ğ’¢—À*ÂFp\0Ïf¼Éapñ{îü‹2ì²ÉKHJRVI	\0\nÑÁ4š/W‚›»lM8ó®8µ\ZÒ¤’iT1†®îo-Û¼¶’,Û‰šE\"˜‹‚QT›j;¬ÈSĞŸKÍ ©×ÆÑœ\0¢\"4¶Ôÿ\0¨‹íkJq.2ÀMAÁ.W].áfğCv¬¹5·&„bSLE4 CÁ=Ó7âR”ş”ÚG„•A‘“ÿ\0Ñ®‡ûäı–~ş¤oæ–î{G:Ó¹÷M_ŸÚ?P‘öï—±gá_êAæ–î{GzÓ¹ºjüø¦Ñú„´hóÿ\0|½‹?\nÿ\0R4·sÚ;ÖÈ=ÓWçÅ6Ô$}£GŸûåìYøWúy¥»ÑŞ´îAîš¿>)´~¡#í\Z<ÿ\0ß/bÏÂ¿ÔƒÍ-Üöõ§rtÕùñM£õ	hÑçşù{~ş¤inç´w­;{¦¯ÏŠm¨HûF?÷ËØ³ğ¯õ óKw=£½iÜƒİ5~|ShıBGÚ4yÿ\0¾^ÅŸ…©š[¹íëNäé«óâ›Gê>Ñ£Ïıòö,ü+ıH<ÒİÏhïZw ÷M_ŸÚ?P‘öï—±gá_êAæ–î{GzÓ¹ºÊ¦÷J]T;ºú™S¥O·è\"Ÿ%¦òŒZé–éZ’òQY.HPJyg$Æ-Î/¿0—m°R)è…ºVbKbÜë.Á—SL©D(×+šš!µeí\r¹b¸‡)\Zü’¡R”ÒÇş­\'L*¾V¢¾Â:ô<\"Xé=Ş>E»*Q\ZK-µ\rHHåÒ6¢}JÖ†÷ÚDıTõèĞØ²¤ç=ŞÓáµWïzæ—íèå}¥ê§¨ïF>„”Ö{¼ ğÚ«÷½?óKöôr¾ÒõSÔw úSYîğƒÃj¯Şôÿ\0Í/ÛÑÊûKÕOQŞƒèIMg»Â\rª¿{Óÿ\04¿oG+í/U=Gz¡%5ï<6ªıïOüÒı½¯´½Tõè>„”Ö{¼ ğÚ«÷½?óKöõ¯+-Q=Gz0,91¤õÁ½*Š1éøÿ\0Ä¿oG+-Q=Gz3ô,¨Ò{¼!•sÆ‹vG\\j¤v’‡ATPR¯Y:Ü_L}”õèØXòÃIîğ‡nÑŞ·nÍÓ] Ğ.\n…vÛÊ>Ş»J%F„¥«½Ô„¡Ä$şãŒ HH$“-±¸d½Ö#<Saµ#@PQš‹¢´Ù»[ƒË¿l;Æ/)+ÒR@¯=RGM+¶%*Çt=ë[¤U(Ò©v»qjôçâÉr<\'Ã‰mÔ(¤—È\n8È#=‡K-Nïe­f=*ãL„:• •ÖŠ\ZUÂ+C…Aæ„R<X|ëo¡Ç\n ¡RšT\ZŠú#ÿÙ','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0\0d\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0õ´ºˆF Â:Â¦ŠXæl,õùGFŞ&™Ñ¿JÚH„Wù×‘EJz½F¯,tê\"Áñ*ÿ\0ß4ï³@z*şB´ì-ØSA ƒyºùRèsİ÷öª¼„R?İ¨¶ÇıÅüªÈ$wª—Å¢ŒÎ£!yqíëYN6WCÛ°ı±ÿ\0q*\nÀK+ùj#RÇ tª±]G.ìÖ’Imn.š8öL‘…møsÀ>£ó¬£5k–âïbÃ¼	ıÑ23\0 G‘ƒêqÅ;lÜ_Ê¢ßMŞav‘›€ `ÿ\0ë¥íPr²ÜQFò±q×¥Zò¢ÿ\0Iÿ\0|Š§hù‘¾•s5ÑE§™N÷3¯£A:á|½‡¹¢–øşıİş¦Šæ©nvtÂü¨f˜›b2g€*i&¹¸¹‰|ƒQ±gf`wğ@\0Üç\'*¼ŠßKc\Zè¹pO½MöØÿ\0ºÿ\0®ŠmB\n72å&ì>xd™\n%Ä‘+0@2GÔ*L$6ÌÃKÈô\0Tmû¯ù\nŠi-gÇ›0Cõçš¾tO+/‘‘H@`A¨ªÿ\0mû¯ù\n>Û÷_ò¹ĞùYËÚÍä_ÜY1Ï•!QôíúVÔ×<–ÖöaŒÌØqƒ…\\Ié×Ìİ>&¹pœqß ­µ”\0È#¸®u×C±ÅÉ&iHÄBá”£dçé×ùÔWWÖ’ŞÇ¤‘ÉòÆAÓ#Œj‹;Ëp&yeuR©¸\0¸\0AJGAÂœªBÎ1Z2\'£lÑ†qªäü½Òµ3šæŒŠF0iö:£ÛÎ¶²‚ñŸ¸Ãªû}*°õT}ÖEZ-ê+ïõËşïõ4U{»”yA¾íª5ÌÊ„_*?ÿÙ',NULL,NULL,NULL,NULL),(4,'sys','checked.gif','image/gif',364,'2013-12-14 18:15:36',364,'GIF89a\0\0¥7\0’’““””——˜˜%  (¢¢+££-¤¤.¥¥0¦¦2§§3©©7ªª8««:¬¬<­­=®®?¯¯A°°B±±D²²F³³H´´JµµK¶¶M··O¹¹SººU¼¼Y½½[¿¿_ÀÀaÁÁcÂÂeÇÇoËËxÍÍ|ÎÎ~ÏÏÑÑ…ÚÚšİİ¢àà©ââ®ãã±ää³çç»êêÃëëÆğğÓòòÙóóÜõõáÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0?\0,\0\0\0\0\0\0\0pÀŸpH,\ZD\Z’8+y\"¬eÍ¤hÈ$ˆ–Ñfª4$ÊÓÄñ\ZÖRSºì‡’@B’±æøh\"F G($H1&K?	\n\0\'¢?#*©?.+¯´µDA\0;','GIF89a\0\0¥7\0’’““””——˜˜%  (¢¢+££-¤¤.¥¥0¦¦2§§3©©7ªª8««:¬¬<­­=®®?¯¯A°°B±±D²²F³³H´´JµµK¶¶M··O¹¹SººU¼¼Y½½[¿¿_ÀÀaÁÁcÂÂeÇÇoËËxÍÍ|ÎÎ~ÏÏÑÑ…ÚÚšİİ¢àà©ââ®ãã±ää³çç»êêÃëëÆğğÓòòÙóóÜõõáÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0?\0,\0\0\0\0\0\0\0pÀŸpH,\ZD\Z’8+y\"¬eÍ¤hÈ$ˆ–Ñfª4$ÊÓÄñ\ZÖRSºì‡’@B’±æøh\"F G($H1&K?	\n\0\'¢?#*©?.+¯´µDA\0;',NULL,NULL,NULL,NULL),(5,'sys','conciliated.gif','image/gif',565,'2013-12-14 18:15:36',565,'GIF89a\0\0ÆV\0jr\0x\0l\0ƒ\0.g.x”##—A|A\0¬\0!–!™\0®\0\0±\0\0²\066%%§²#¤#2›2\0¾\0*¡*À1¢1¾7 77¡7; ;¹\0Ê\0\0Ï\04®4½\0Ó\0\0Õ\0K¥K\0Ú\0\0Û\0\0İ\0U¢U\0à\0Îh h\0é\0\0î\0R¸L\0ñ\0í\0ó\0p¦pu§u\nõ\n\0ş\0ƒ¦ƒ‹¯‹|Èyš¶šƒÆƒˆÄˆŒÃŒ·¼—Á——Æ—·É·¾Ï¾¶Ü¶¾İ¾ÁÛÁÉ×ÉÆŞÆÍáÍ×â×ĞêĞÜïÜãñãâòâåñååòåèñèéñéìôìÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0y€‚ƒ„…†‡„Pˆ„N;1F‹R=M\nG†U>#O? JƒSC-$\'Q‚H3\rKB\Z7+„T4*	/85†.!2%&0/6‡A)(,\":ˆL!\"<‹\0@ã9DêIEğõö„\0;','GIF89a\0\0ÆV\0jr\0x\0l\0ƒ\0.g.x”##—A|A\0¬\0!–!™\0®\0\0±\0\0²\066%%§²#¤#2›2\0¾\0*¡*À1¢1¾7 77¡7; ;¹\0Ê\0\0Ï\04®4½\0Ó\0\0Õ\0K¥K\0Ú\0\0Û\0\0İ\0U¢U\0à\0Îh h\0é\0\0î\0R¸L\0ñ\0í\0ó\0p¦pu§u\nõ\n\0ş\0ƒ¦ƒ‹¯‹|Èyš¶šƒÆƒˆÄˆŒÃŒ·¼—Á——Æ—·É·¾Ï¾¶Ü¶¾İ¾ÁÛÁÉ×ÉÆŞÆÍáÍ×â×ĞêĞÜïÜãñãâòâåñååòåèñèéñéìôìÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0y€‚ƒ„…†‡„Pˆ„N;1F‹R=M\nG†U>#O? JƒSC-$\'Q‚H3\rKB\Z7+„T4*	/85†.!2%&0/6‡A)(,\":ˆL!\"<‹\0@ã9DêIEğõö„\0;',NULL,NULL,NULL,NULL),(6,'sys','delete.gif','image/gif',1064,'2013-12-14 18:15:36',1064,'GIF89a\0\0ç¡\0ş\0\0ışûùü\"ş$ş$ş%	ş)ş)÷/0ù3(ş5prş< otù>+ş>\"ş?!rv„÷C0sw„sw…tx…tx†ty†ty‰ùN;ûVDıY8ˆ‹–ˆŒ—ùaJ‰Œ˜‰—‰˜Š–Š˜‹˜‹˜Œš÷hQşjHî{jşwUøwgšŸ²› ±ø‚v÷…n §¸ş‘p÷“‹ì–š®±Âİ¡Ÿ°µÃşœ€³¹Èù ‘µ¹Êµ¼Êé©°»¾Éæ¯±¾ÂÒ¿ÃÎñ¯±ø± ÷³¨ÂÇÒÅÇĞÅÉÑÄÉ×ÅÉÕ÷·®í¹ÀÆËØû¹©ÇË×ş»§ÉÎÙËĞŞÌĞÜØÌÕÎÑİÎÒİÏÒŞĞÒİËÕãèÊÑçÌĞÑÕàÑÖãÓØâÕÙâ×ÚããÕŞæ×ÛëÖ×ÛİçÛàìşÕÈÚâğŞáìş×ËØäñáâìáâíàãîâäëãçòşàÕæèíæèòáëöæéõçéóáíøæîùìî÷âóıóíğîïóìñøğòüìõıóóöòóûíöüóõùî÷ıóöûñ÷üíùıòøüõ÷û÷÷ùòùıìüşøøû÷ùûøùûóüşöûü÷ûıñşşóışşùøøûşùûüùûıõışùûşûüışüûıııüşşışşşşşÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0ì\0¥„Cğ(;zğùÇ¡PAuJK!r\Zş{”£A]\n5Rò¦!GˆŸaÊ$ÉHvütiÓ7`ÌØ ³ã&E‹ú¬q2‚LNgÔx’iZ¼PG\'È¨@P¡\n\Z2+Ei±BF‚˜qsáP‘ñ0!.wÒÀÉÀ0(D”ŒH8 €Á=læ`p\n\n:\00à;|ÿ½eÒà@BD\0  Of¿{\\Ô0$ˆQ“6ÚÔY¼1â\'Oš,ešt(\r”H‘EŠ&F\0ñA„†\0;','GIF89a\0\0ç¡\0ş\0\0ışûùü\"ş$ş$ş%	ş)ş)÷/0ù3(ş5prş< otù>+ş>\"ş?!rv„÷C0sw„sw…tx…tx†ty†ty‰ùN;ûVDıY8ˆ‹–ˆŒ—ùaJ‰Œ˜‰—‰˜Š–Š˜‹˜‹˜Œš÷hQşjHî{jşwUøwgšŸ²› ±ø‚v÷…n §¸ş‘p÷“‹ì–š®±Âİ¡Ÿ°µÃşœ€³¹Èù ‘µ¹Êµ¼Êé©°»¾Éæ¯±¾ÂÒ¿ÃÎñ¯±ø± ÷³¨ÂÇÒÅÇĞÅÉÑÄÉ×ÅÉÕ÷·®í¹ÀÆËØû¹©ÇË×ş»§ÉÎÙËĞŞÌĞÜØÌÕÎÑİÎÒİÏÒŞĞÒİËÕãèÊÑçÌĞÑÕàÑÖãÓØâÕÙâ×ÚããÕŞæ×ÛëÖ×ÛİçÛàìşÕÈÚâğŞáìş×ËØäñáâìáâíàãîâäëãçòşàÕæèíæèòáëöæéõçéóáíøæîùìî÷âóıóíğîïóìñøğòüìõıóóöòóûíöüóõùî÷ıóöûñ÷üíùıòøüõ÷û÷÷ùòùıìüşøøû÷ùûøùûóüşöûü÷ûıñşşóışşùøøûşùûüùûıõışùûşûüışüûıııüşşışşşşşÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0ì\0¥„Cğ(;zğùÇ¡PAuJK!r\Zş{”£A]\n5Rò¦!GˆŸaÊ$ÉHvütiÓ7`ÌØ ³ã&E‹ú¬q2‚LNgÔx’iZ¼PG\'È¨@P¡\n\Z2+Ei±BF‚˜qsáP‘ñ0!.wÒÀÉÀ0(D”ŒH8 €Á=læ`p\n\n:\00à;|ÿ½eÒà@BD\0  Of¿{\\Ô0$ˆQ“6ÚÔY¼1â\'Oš,ešt(\r”H‘EŠ&F\0ñA„†\0;',NULL,NULL,NULL,NULL),(7,'sys','dropdown.gif','image/gif',115,'2013-12-14 18:15:36',115,'GIF89a\r\0\0Â\0\0\0\0yyy™™™¶¶¶ÜÜÜôôôÿÿÿÿÿÿ!ù\n\0\0,\0\0\0\0\r\0\0\08Xº¬ÓpEªµa–Ë3å˜†ßèm#qàº‚*²o,—­}£•¾§¿ÔJ83ACcA’i:Ìç3\0;','GIF89a\r\0\0Â\0\0\0\0yyy™™™¶¶¶ÜÜÜôôôÿÿÿÿÿÿ!ù\n\0\0,\0\0\0\0\r\0\0\08Xº¬ÓpEªµa–Ë3å˜†ßèm#qàº‚*²o,—­}£•¾§¿ÔJ83ACcA’i:Ìç3\0;',NULL,NULL,NULL,NULL),(8,'sys','edit.gif','image/gif',1057,'2013-12-14 18:15:36',1057,'GIF89a\0\0çš\0ÄsOènˆŒ˜ês°…x”˜£•˜¤ü‚	–™¤–š¤—š¥—›¥˜›¥Ù‰[™œ¦ï‰0áTâ‘OŸ£²ş”ú“Ó—qº™ç +À£©«¶ş \nßŸfª¬·ş£«®¹Ò¤Œ¬°¼ø£=Õ¦Ğ©›Ò¨ó¤]±´¾±µÁş®/µ¸Ãş¸\0µ¹Äµ¹Æ¸¹¿Ş®˜ò±Uş¶º»Áş»à² Á¼Á»¾È¼¿ÉıÃÁÃÈûÈä¿‡ş¾FÑÀ¾şÂ;ÂÆĞôÉ;ıÎ\nûÏÑÃÃşÂNşÉ*ÇÈÍËÇÏşÒ÷ÍOùËYÌÍÒüÖ8ÛÌÈÏÑÖÏÑÚşÔMĞÒÛÏÒŞ×ÑÒşÔbÒÔİşÛAÒÕààÒÊÚÓØÓÖŞÕ×ßúØ{ÖØßéÒÌ÷Ó£ÕÙâÖÙä×ÙâõØ™ûŞiØÚâûÛ~ÙÛãÚÜäÛİã÷Ø³ÜßçİàêŞàèáãëáãìåâèóãÓææçäæîäæïççèìåæûçºèèéöçĞééêèêğêêëèêñôèŞøêÓêìóñëëüêÓöêæìíòìîôîîïíïòïğòòòòñòøûóéööööøú÷øûøùûúúúıúöùûüúûüúûıûûûûûıûüıüıışşşşÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0å\0­¨¨æK\Z6¸ô¯á?5š\"bb”H%f8|1¢¤>?TLĞe#Ä”Äép\0\0‹COFT„ä††\0$4‰ÙQ“2(40B	Ïˆ™’ñ`˜FÊ´„\nXÖ¬0úˆc&H[ªôAb›8òĞA¤æR$?c‰ğ¦M-âÄ¹£¦R#<e¦¼a&‹“yéìéÛN\Z/„h¡…CŒB‹ú½‚á.“©˜(sR#&¤ !s†œ\ZQZr¨¡Azıác#¶À,P\0b\0;','GIF89a\0\0çš\0ÄsOènˆŒ˜ês°…x”˜£•˜¤ü‚	–™¤–š¤—š¥—›¥˜›¥Ù‰[™œ¦ï‰0áTâ‘OŸ£²ş”ú“Ó—qº™ç +À£©«¶ş \nßŸfª¬·ş£«®¹Ò¤Œ¬°¼ø£=Õ¦Ğ©›Ò¨ó¤]±´¾±µÁş®/µ¸Ãş¸\0µ¹Äµ¹Æ¸¹¿Ş®˜ò±Uş¶º»Áş»à² Á¼Á»¾È¼¿ÉıÃÁÃÈûÈä¿‡ş¾FÑÀ¾şÂ;ÂÆĞôÉ;ıÎ\nûÏÑÃÃşÂNşÉ*ÇÈÍËÇÏşÒ÷ÍOùËYÌÍÒüÖ8ÛÌÈÏÑÖÏÑÚşÔMĞÒÛÏÒŞ×ÑÒşÔbÒÔİşÛAÒÕààÒÊÚÓØÓÖŞÕ×ßúØ{ÖØßéÒÌ÷Ó£ÕÙâÖÙä×ÙâõØ™ûŞiØÚâûÛ~ÙÛãÚÜäÛİã÷Ø³ÜßçİàêŞàèáãëáãìåâèóãÓææçäæîäæïççèìåæûçºèèéöçĞééêèêğêêëèêñôèŞøêÓêìóñëëüêÓöêæìíòìîôîîïíïòïğòòòòñòøûóéööööøú÷øûøùûúúúıúöùûüúûüúûıûûûûûıûüıüıışşşşÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0å\0­¨¨æK\Z6¸ô¯á?5š\"bb”H%f8|1¢¤>?TLĞe#Ä”Äép\0\0‹COFT„ä††\0$4‰ÙQ“2(40B	Ïˆ™’ñ`˜FÊ´„\nXÖ¬0úˆc&H[ªôAb›8òĞA¤æR$?c‰ğ¦M-âÄ¹£¦R#<e¦¼a&‹“yéìéÛN\Z/„h¡…CŒB‹ú½‚á.“©˜(sR#&¤ !s†œ\ZQZr¨¡Azıác#¶À,P\0b\0;',NULL,NULL,NULL,NULL),(9,'sys','edit_gray.gif','image/gif',1055,'2013-12-14 18:15:36',1055,'GIF89a\0\0ç\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~€€€‚‚‚ƒƒƒ„„„………†††‡‡‡ˆˆˆ‰‰‰ŠŠŠ‹‹‹ŒŒŒ‘‘‘’’’“““”””•••–––———˜˜˜™™™ššš›››œœœŸŸŸ   ¡¡¡¢¢¢£££¤¤¤¥¥¥¦¦¦§§§¨¨¨©©©ªªª«««¬¬¬­­­®®®¯¯¯°°°±±±²²²³³³´´´µµµ¶¶¶···¸¸¸¹¹¹ººº»»»¼¼¼½½½¾¾¾¿¿¿ÀÀÀÁÁÁÂÂÂÃÃÃÄÄÄÅÅÅÆÆÆÇÇÇÈÈÈÉÉÉÊÊÊËËËÌÌÌÍÍÍÎÎÎÏÏÏĞĞĞÑÑÑÒÒÒÓÓÓÔÔÔÕÕÕÖÖÖ×××ØØØÙÙÙÚÚÚÛÛÛÜÜÜİİİŞŞŞßßßàààáááâââãããäääåååæææçççèèèéééêêêëëëìììíííîîîïïïğğğñññòòòóóóôôôõõõööö÷÷÷øøøùùùúúúûûûüüüııışşşÿÿÿ!şCreated with The GIMP\0!ù\n\0÷\0,\0\0\0\0\0\0\0ã\0«}ø-›4_¨Xéjw¯á½oÿ\"úÃ\'Ø1b´|9|1â>uÆr‘j„m#Äû´k•éP.xOF¤Ç«D¥FE‹Ùñºa½HqJ«ÏÌ–íò4+[-£\re¶ƒvW(kàrÕÇñŸ>lÕŠÅšen®aéÎÉûÖo;mÒ‰\"7.›«\\æÌ¡û¶_:mÔtÅÚf-\Z+¼çÔñÅg®[¶RÇ®Q“Öj—;{ûVKõª6ÉÔh!‹Ù\Z¤iİ´qgÎÔ‡üòµ;÷®:wìÔızmŒ“ïM›4iÊ„	£×\0;','GIF89a\0\0ç\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~€€€‚‚‚ƒƒƒ„„„………†††‡‡‡ˆˆˆ‰‰‰ŠŠŠ‹‹‹ŒŒŒ‘‘‘’’’“““”””•••–––———˜˜˜™™™ššš›››œœœŸŸŸ   ¡¡¡¢¢¢£££¤¤¤¥¥¥¦¦¦§§§¨¨¨©©©ªªª«««¬¬¬­­­®®®¯¯¯°°°±±±²²²³³³´´´µµµ¶¶¶···¸¸¸¹¹¹ººº»»»¼¼¼½½½¾¾¾¿¿¿ÀÀÀÁÁÁÂÂÂÃÃÃÄÄÄÅÅÅÆÆÆÇÇÇÈÈÈÉÉÉÊÊÊËËËÌÌÌÍÍÍÎÎÎÏÏÏĞĞĞÑÑÑÒÒÒÓÓÓÔÔÔÕÕÕÖÖÖ×××ØØØÙÙÙÚÚÚÛÛÛÜÜÜİİİŞŞŞßßßàààáááâââãããäääåååæææçççèèèéééêêêëëëìììíííîîîïïïğğğñññòòòóóóôôôõõõööö÷÷÷øøøùùùúúúûûûüüüııışşşÿÿÿ!şCreated with The GIMP\0!ù\n\0÷\0,\0\0\0\0\0\0\0ã\0«}ø-›4_¨Xéjw¯á½oÿ\"úÃ\'Ø1b´|9|1â>uÆr‘j„m#Äû´k•éP.xOF¤Ç«D¥FE‹Ùñºa½HqJ«ÏÌ–íò4+[-£\re¶ƒvW(kàrÕÇñŸ>lÕŠÅšen®aéÎÉûÖo;mÒ‰\"7.›«\\æÌ¡û¶_:mÔtÅÚf-\Z+¼çÔñÅg®[¶RÇ®Q“Öj—;{ûVKõª6ÉÔh!‹Ù\Z¤iİ´qgÎÔ‡üòµ;÷®:wìÔızmŒ“ïM›4iÊ„	£×\0;',NULL,NULL,NULL,NULL),(10,'sys','help.gif','image/gif',1720,'2013-12-14 18:15:36',1720,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\" xmpMM:DocumentID=\"xmp.did:F80BDEE26A7F11E0B6BAF55348335066\" xmpMM:InstanceID=\"xmp.iid:F80BDEE16A7F11E0B6BAF55348335066\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:7EA9C5017F6AE011AAD1E8E1F522A2F4\" stRef:documentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>Lóz2\0\0êIDATxÚbşÿÿ?ÃcöÀ·ImŞ9ÿÄ0ÑŒ‹şüg\0€\0‹l8ú$ûë©¿ÿ@ÒEış_¸ùïÿÆ³¿ÿTß n\0±ößøVÒÖ°àş–sç˜Nú6ÏÊD†åûßw÷î	‚n>¹š@03:ßùõÿĞµ¿ÿ\\ş÷ÿè­¿ÿçíz\rvSrûÅ®ºå·o03Øj21Ü{øŸÁJ•‰á—ÃÖó?ÿ³\0M:ğáËû{÷Ê&Bì‚Ñ_ş|g`;\rŠ¦Üÿ¯£.ÉÀÏÇÂpçşg†[÷åÎ­ÔŸ@p@«\Z€T._â ä°HÈA ‡r(ÈÁ ‡ƒ\räYS-9†ß¿ü­˜Àš6ûÇÀ/ü—añºk¦L&z’/_A$çoıVğî=Ã‹gÌ f3Ãëwÿºÿe(‹eÓ Àò	Lé²Ü¸ó…áÍ;^ï€’˜šÌtáÚÃ\\Ûÿo?ügˆödÓÀXcxûñĞ\'\r`o½˜£¦(7YE‘—áã§?Wn>gèËQd`ğp€†E’,ÿd5%1aNNN°ø÷ï^½ıÎpëŞ†{?‚¦nƒ•‘ôdm\rA†/şşadÀ˜Yş3ğüg¸zã=Ã±sOÁ1Ódƒ½¹|§„ˆ\0Ã«gŒ@Û€AfÍÄ \"ÅÈpöÆ†?üÓ×ş3||ÏÈ \"ÂÉ *Ìé5iÅMFse¤xnİ``ø\r¤©kÿÁmÍfÂ{b5\r3dÀå·ïÿÚÿÉÈğñ#ª“Ò˜!ô¬¿(âüüÀP~»2¾äô…g²r~ÅŞ¼G`@©©ééEN\nÒRå*Šü13¼zıŸáÃˆb¢Œò@wîdxğôY\'0\0+0¢j	òbPR‚\nƒ’ø ŞOæP\0\0¸ZŠIıY?Î\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\" xmpMM:DocumentID=\"xmp.did:F80BDEE26A7F11E0B6BAF55348335066\" xmpMM:InstanceID=\"xmp.iid:F80BDEE16A7F11E0B6BAF55348335066\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:7EA9C5017F6AE011AAD1E8E1F522A2F4\" stRef:documentID=\"xmp.did:35B04DA3E169E011993EB1ED6CAC606E\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>Lóz2\0\0êIDATxÚbşÿÿ?ÃcöÀ·ImŞ9ÿÄ0ÑŒ‹şüg\0€\0‹l8ú$ûë©¿ÿ@ÒEış_¸ùïÿÆ³¿ÿTß n\0±ößøVÒÖ°àş–sç˜Nú6ÏÊD†åûßw÷î	‚n>¹š@03:ßùõÿĞµ¿ÿ\\ş÷ÿè­¿ÿçíz\rvSrûÅ®ºå·o03Øj21Ü{øŸÁJ•‰á—ÃÖó?ÿ³\0M:ğáËû{÷Ê&Bì‚Ñ_ş|g`;\rŠ¦Üÿ¯£.ÉÀÏÇÂpçşg†[÷åÎ­ÔŸ@p@«\Z€T._â ä°HÈA ‡r(ÈÁ ‡ƒ\räYS-9†ß¿ü­˜Àš6ûÇÀ/ü—añºk¦L&z’/_A$çoıVğî=Ã‹gÌ f3Ãëwÿºÿe(‹eÓ Àò	Lé²Ü¸ó…áÍ;^ï€’˜šÌtáÚÃ\\Ûÿo?ügˆödÓÀXcxûñĞ\'\r`o½˜£¦(7YE‘—áã§?Wn>gèËQd`ğp€†E’,ÿd5%1aNNN°ø÷ï^½ıÎpëŞ†{?‚¦nƒ•‘ôdm\rA†/şşadÀ˜Yş3ğüg¸zã=Ã±sOÁ1Ódƒ½¹|§„ˆ\0Ã«gŒ@Û€AfÍÄ \"ÅÈpöÆ†?üÓ×ş3||ÏÈ \"ÂÉ *Ìé5iÅMFse¤xnİ``ø\r¤©kÿÁmÍfÂ{b5\r3dÀå·ïÿÚÿÉÈğñ#ª“Ò˜!ô¬¿(âüüÀP~»2¾äô…g²r~ÅŞ¼G`@©©ééEN\nÒRå*Šü13¼zıŸáÃˆb¢Œò@wîdxğôY\'0\0+0¢j	òbPR‚\nƒ’ø ŞOæP\0\0¸ZŠIıY?Î\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(11,'sys','icon.ico','image/x-ico',628,'2013-12-14 18:15:36',628,'GIF89a\0\0Æq\0µx8Àz.Ä€7µ‚PÓ ¾ƒF¾…KÜ…\"áˆ ºeÕ‹8×‹5åŠ æŠ ã(Ø•Kñ’ ò’ ò’!á–@ò”\"ò”#ò•&ğ–*ò›%ó›3İXó&ó8ğŸ?ò¡1ó£4ò¤/ó£7Ò©jÏ©‚Ó©}È«‹Ë«ó©3Ú­]ó¨HÉ®–ó«Dó«Nó­@ó¬OÕ±{õ¬Tó¯Bô®Mê¯kõ®YÎ´—ó±Kô°Uó°Yô°Wô°XÑµÛµsÎ¶ó¶>ó³]ô´Wó¶Tó·SëºTó¸Vì·xô·bó¼CóºXÑ½«ô½]è½Œó¼|óÁVäÁƒóÃYôÃfÜÆ§íÇ}åÇ—ôÈlôÉnôÆíÊ‰ÜÌ¾ôÌŠôÌ‹éÎ¢õĞ„ñÒ¯õÖ™òÕµõÙ£õÚ¥ïÛ¸ëÜÆöÜ«èİÔìßÎïßÏóà½ñçÜòèŞòéß÷ìßùğçûù÷ıüûşıüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0¼€.8:†‡†9,‚Y`dbaZ)hi[`cq;`?7^¥fq5^S=/¥¥F2\\²N%\"²²WQR\\@+UPBADHJTUU<I(U6!lkÓ1MCOO-ppÓâ >G\'Ó\rãîÓ4îVEãLqp\nã_âÄ!1n‰À0ºÌˆpF \n ^‘à@›8oh(ƒ€;yjâ¸	ˆş¸›`b\0wŒ>~\0;','GIF89a\0\0Æq\0µx8Àz.Ä€7µ‚PÓ ¾ƒF¾…KÜ…\"áˆ ºeÕ‹8×‹5åŠ æŠ ã(Ø•Kñ’ ò’ ò’!á–@ò”\"ò”#ò•&ğ–*ò›%ó›3İXó&ó8ğŸ?ò¡1ó£4ò¤/ó£7Ò©jÏ©‚Ó©}È«‹Ë«ó©3Ú­]ó¨HÉ®–ó«Dó«Nó­@ó¬OÕ±{õ¬Tó¯Bô®Mê¯kõ®YÎ´—ó±Kô°Uó°Yô°Wô°XÑµÛµsÎ¶ó¶>ó³]ô´Wó¶Tó·SëºTó¸Vì·xô·bó¼CóºXÑ½«ô½]è½Œó¼|óÁVäÁƒóÃYôÃfÜÆ§íÇ}åÇ—ôÈlôÉnôÆíÊ‰ÜÌ¾ôÌŠôÌ‹éÎ¢õĞ„ñÒ¯õÖ™òÕµõÙ£õÚ¥ïÛ¸ëÜÆöÜ«èİÔìßÎïßÏóà½ñçÜòèŞòéß÷ìßùğçûù÷ıüûşıüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0¼€.8:†‡†9,‚Y`dbaZ)hi[`cq;`?7^¥fq5^S=/¥¥F2\\²N%\"²²WQR\\@+UPBADHJTUU<I(U6!lkÓ1MCOO-ppÓâ >G\'Ó\rãîÓ4îVEãLqp\nã_âÄ!1n‰À0ºÌˆpF \n ^‘à@›8oh(ƒ€;yjâ¸	ˆş¸›`b\0wŒ>~\0;',NULL,NULL,NULL,NULL),(12,'sys','import.gif','image/gif',613,'2013-12-14 18:15:36',613,'GIF89a\0\0Æx\0\'­\'²(²\07¿;ÍDÒEŞGòTÚ8D³SõTöW÷\n_Ò^ùbú#_ÉeËIU«	hüNW¬IZ®%jÄ\nnıjúAb²I_°pşId²0mÒ3q¿wÿHmµ8józÿ{ÿCpÃ4wÌÿ7{ĞXrÔ>}à%„ÿ&…şE}ß(†ÿI|ŞO{ÜWyÙ.‰ÿE†×2ÿ[ƒÇf…º8ÿ=”ÿL“ïT’àC–ûlŒĞE™ÿGšÿJœÿUœÿ_œè\\îQ ÿT¢ÿZ¢÷z›ĞX¥ÿZ¦ÿ[¦ÿ…Âb¥ÿ]¨ÿq¡ûg­ÿi¯ÿl±ÿ–¨Ïp³ÿx°ÿt¶ÿu¶ÿw·ü™³Ù|»ÿ}¼ÿ¤µÍ“¶ú‹¼ÿ½ÿ‡Âÿ¨¹âŠÄşÇÿ£¿ú»½İ Çÿ¢Éÿ¯ÅùÀÅæÁÅå¿ÊØÀÇçÀÈçºÌåÀÊè¶ÕÿÑÜë×ÜãËáÿßåôììîâïÿãğÿîîğìïõïğòÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0©€‚ƒ„…„	Š‹\0b…g(ts“”e…f0p›œpa…i/m¤¥mZ…j.d­­cL!\Z…l,\\·[?„q^)RRJ1\"\nqq;8FB<6-#Pv$ASQMG>6* r‚4@]WOH=3&5…E9`XN†ÜXÑ ‰¡?Vd|¡²DG„,­9Q…ˆ4¹)ááMFBwê\0;','GIF89a\0\0Æx\0\'­\'²(²\07¿;ÍDÒEŞGòTÚ8D³SõTöW÷\n_Ò^ùbú#_ÉeËIU«	hüNW¬IZ®%jÄ\nnıjúAb²I_°pşId²0mÒ3q¿wÿHmµ8józÿ{ÿCpÃ4wÌÿ7{ĞXrÔ>}à%„ÿ&…şE}ß(†ÿI|ŞO{ÜWyÙ.‰ÿE†×2ÿ[ƒÇf…º8ÿ=”ÿL“ïT’àC–ûlŒĞE™ÿGšÿJœÿUœÿ_œè\\îQ ÿT¢ÿZ¢÷z›ĞX¥ÿZ¦ÿ[¦ÿ…Âb¥ÿ]¨ÿq¡ûg­ÿi¯ÿl±ÿ–¨Ïp³ÿx°ÿt¶ÿu¶ÿw·ü™³Ù|»ÿ}¼ÿ¤µÍ“¶ú‹¼ÿ½ÿ‡Âÿ¨¹âŠÄşÇÿ£¿ú»½İ Çÿ¢Éÿ¯ÅùÀÅæÁÅå¿ÊØÀÇçÀÈçºÌåÀÊè¶ÕÿÑÜë×ÜãËáÿßåôììîâïÿãğÿîîğìïõïğòÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0©€‚ƒ„…„	Š‹\0b…g(ts“”e…f0p›œpa…i/m¤¥mZ…j.d­­cL!\Z…l,\\·[?„q^)RRJ1\"\nqq;8FB<6-#Pv$ASQMG>6* r‚4@]WOH=3&5…E9`XN†ÜXÑ ‰¡?Vd|¡²DG„,­9Q…ˆ4¹)ááMFBwê\0;',NULL,NULL,NULL,NULL),(13,'sys','inactive.gif','image/gif',666,'2013-12-14 18:15:36',666,'GIF89a\0\0Ær\0³AA³DD³GG³IIë22ì22ï22î44ÂGGõ22ÎCCÅHHÊFFù22õ44ÆIIÃLLş33ÉJJş44ÍKKõ<<İJJö@@İKKù@@İMMëGGİNNş@@ÿCCÿDDõJJöQQöRRùQQşTTõXXÿUU÷YYÿ]]öaaøaaøbbôddûbbÿaaşbb¹º»¼½¾ğllñllÿggôooõooÃ……Ä……úooÿrrÿyyÿ~~ñ‘‘â˜˜ã˜˜ô‘‘ä˜˜å˜˜æ˜˜ç˜˜è˜˜é˜˜õ””ö””ı‘‘ÿ‘‘ù””ÿ––ÿ™™Ç¶¶ÿË¹¹÷§§ù§§ÿ³³ÿ´´ø»»ù»»ÿÈÈèÔÔéÔÔêÔÔÿÎÎÿÒÒÿÔÔòÛÛÿ××øŞŞÿææîîîşììÿííÿîîÿğğÿòòşõõÿõõÿ÷÷ÿùùÿûûÿüüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0Ş€‚dJHGFCBbƒdDK’KA^„\ZZeœY]ƒdV_a_¨_`_U\\„OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .â?jrÙ\"Ü	4Eï>næl+é3C	/ÄggrØ´hĞÀ€!&t ††	4Ê:L8\0CŒ‚ ¤qáÁƒ‹4P<\\\0@å#L 0ÁR¥‰¤˜Ôå\n8s¦ ³7tÍac@OL\\vÔ˜1#*3\0;','GIF89a\0\0Ær\0³AA³DD³GG³IIë22ì22ï22î44ÂGGõ22ÎCCÅHHÊFFù22õ44ÆIIÃLLş33ÉJJş44ÍKKõ<<İJJö@@İKKù@@İMMëGGİNNş@@ÿCCÿDDõJJöQQöRRùQQşTTõXXÿUU÷YYÿ]]öaaøaaøbbôddûbbÿaaşbb¹º»¼½¾ğllñllÿggôooõooÃ……Ä……úooÿrrÿyyÿ~~ñ‘‘â˜˜ã˜˜ô‘‘ä˜˜å˜˜æ˜˜ç˜˜è˜˜é˜˜õ””ö””ı‘‘ÿ‘‘ù””ÿ––ÿ™™Ç¶¶ÿË¹¹÷§§ù§§ÿ³³ÿ´´ø»»ù»»ÿÈÈèÔÔéÔÔêÔÔÿÎÎÿÒÒÿÔÔòÛÛÿ××øŞŞÿææîîîşììÿííÿîîÿğğÿòòşõõÿõõÿ÷÷ÿùùÿûûÿüüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0Ş€‚dJHGFCBbƒdDK’KA^„\ZZeœY]ƒdV_a_¨_`_U\\„OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .â?jrÙ\"Ü	4Eï>næl+é3C	/ÄggrØ´hĞÀ€!&t ††	4Ê:L8\0CŒ‚ ¤qáÁƒ‹4P<\\\0@å#L 0ÁR¥‰¤˜Ôå\n8s¦ ³7tÍac@OL\\vÔ˜1#*3\0;',NULL,NULL,NULL,NULL),(14,'sys','incomplete.gif','image/gif',666,'2013-12-14 18:15:36',666,'GIF89a\0\0Ær\0³AA³DD³GG³IIë22ì22ï22î44ÂGGõ22ÎCCÅHHÊFFù22õ44ÆIIÃLLş33ÉJJş44ÍKKõ<<İJJö@@İKKù@@İMMëGGİNNş@@ÿCCÿDDõJJöQQöRRùQQşTTõXXÿUU÷YYÿ]]öaaøaaøbbôddûbbÿaaşbb¹º»¼½¾ğllñllÿggôooõooÃ……Ä……úooÿrrÿyyÿ~~ñ‘‘â˜˜ã˜˜ô‘‘ä˜˜å˜˜æ˜˜ç˜˜è˜˜é˜˜õ””ö””ı‘‘ÿ‘‘ù””ÿ––ÿ™™Ç¶¶ÿË¹¹÷§§ù§§ÿ³³ÿ´´ø»»ù»»ÿÈÈèÔÔéÔÔêÔÔÿÎÎÿÒÒÿÔÔòÛÛÿ××øŞŞÿææîîîşììÿííÿîîÿğğÿòòşõõÿõõÿ÷÷ÿùùÿûûÿüüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0Ş€‚dJHGFCBbƒdDK’KA^„\ZZeœY]ƒdV_a_¨_`_U\\„OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .â?jrÙ\"Ü	4Eï>næl+é3C	/ÄggrØ´hĞÀ€!&t ††	4Ê:L8\0CŒ‚ ¤qáÁƒ‹4P<\\\0@å#L 0ÁR¥‰¤˜Ôå\n8s¦ ³7tÍac@OL\\vÔ˜1#*3\0;','GIF89a\0\0Ær\0³AA³DD³GG³IIë22ì22ï22î44ÂGGõ22ÎCCÅHHÊFFù22õ44ÆIIÃLLş33ÉJJş44ÍKKõ<<İJJö@@İKKù@@İMMëGGİNNş@@ÿCCÿDDõJJöQQöRRùQQşTTõXXÿUU÷YYÿ]]öaaøaaøbbôddûbbÿaaşbb¹º»¼½¾ğllñllÿggôooõooÃ……Ä……úooÿrrÿyyÿ~~ñ‘‘â˜˜ã˜˜ô‘‘ä˜˜å˜˜æ˜˜ç˜˜è˜˜é˜˜õ””ö””ı‘‘ÿ‘‘ù””ÿ––ÿ™™Ç¶¶ÿË¹¹÷§§ù§§ÿ³³ÿ´´ø»»ù»»ÿÈÈèÔÔéÔÔêÔÔÿÎÎÿÒÒÿÔÔòÛÛÿ××øŞŞÿææîîîşììÿííÿîîÿğğÿòòşõõÿõõÿ÷÷ÿùùÿûûÿüüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0Ş€‚dJHGFCBbƒdDK’KA^„\ZZeœY]ƒdV_a_¨_`_U\\„OXcq[XX[qcXL\\I,QSmrpWWprmM=<H%@@Nkroorg\'		5G .â?jrÙ\"Ü	4Eï>næl+é3C	/ÄggrØ´hĞÀ€!&t ††	4Ê:L8\0CŒ‚ ¤qáÁƒ‹4P<\\\0@å#L 0ÁR¥‰¤˜Ôå\n8s¦ ³7tÍac@OL\\vÔ˜1#*3\0;',NULL,NULL,NULL,NULL),(15,'sys','message_read.gif','image/gif',1082,'2013-12-14 18:15:36',1082,'GIF89a\0\0ç°\0«iQ³mT´mTµpV¶pV·sX¸tXºvZºwZ¼z\\¾}^¿}_À€`ÁaÂƒbÃ„cÄ‡eÅ‡eÆŠg…˜ÖÈiÇlËk   Í“m®™¢¡¡¡Ñ“l¢¢¢Ó™rÒšr“¨İÒœwÔtË¡Š™«ŞÍ¢‡Ô¡zÖ¡vØ¤x£±ÔÚ§zÙ§ ²áÌª™Ü«|Ù­ŠŞ¬‚ß®Ü®‰İ®‹ß°ƒà°†á±¬¼åá´…Ê¹­àµäµŠáµ“ß·”â¶’¸À×ã¹•ÆÀÀæºŠá»•ÁÄÉè¼Œå½•ã¼ ·Çç»ÇŞå¾àÀ¢±Êíæ¿›æÁ™ÆÉÓËÉÎæÄ¤éÄàÅ²ÁÎ×ÛÇºîÆŒ¿ÌìåÈ§ÔËÉÚÌÆÁÕâğÌ–äÎ¯ñÍ’ñÍ”ïÍ›ÚĞÆÓÓÓòĞ˜îÏ«íÑ­çÓµïÒ§ãÔ¿òÓìÑ¹ëÓ¶ëÒ½óÔçÕºòÔ¢ÚÚÚô×¤ôØ¥íÙ¾ëÚ¿ôÙ¬ôÚ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõİ­õİ®ìŞÆÙàóìŞÖòŞÊîàËòßÉÌêÿ÷â·Üæöøä¹ğäĞñäÎğæŞğæàøèÀ÷çÊÖîÿúëÅ÷êÖúìÅùìÍúíÈ÷í×àòÿúîÏ÷ìãûïÏûğÑûñÒëòûûñÕüóĞúòáêöÿûôŞëöÿúóëüõÛúóíñöüş÷Ûõ÷üşúÜşúàõúÿÿûäÿûçşıåÿüëÿıëışÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0ş\0ÿ	¨ÈŒk**J=ˆäq‘h¡¦%8Ô\nÔçÎœ+%¤å„T¡#>€9Ó¦\"ı‚–MS~¬ØX1âÃ„ÂÜ 2Êæ«T(5\Z„…’\ZjtJbé((¥Lµğ óàŒVŸvü¹ºÏ”tò4¸Ğb•*Q2²`adˆ\n;yà,¸BªR˜:™eC¼l\\8ñ7S4®X\"óÂ\r1.˜(Ué‡ È§892CcKBDbò4\'H†ö|ÑQ…Àcmº$i!>qĞx©BDÀ,P\0Á	\0€†74hßÎ];‡7\0;','GIF89a\0\0ç°\0«iQ³mT´mTµpV¶pV·sX¸tXºvZºwZ¼z\\¾}^¿}_À€`ÁaÂƒbÃ„cÄ‡eÅ‡eÆŠg…˜ÖÈiÇlËk   Í“m®™¢¡¡¡Ñ“l¢¢¢Ó™rÒšr“¨İÒœwÔtË¡Š™«ŞÍ¢‡Ô¡zÖ¡vØ¤x£±ÔÚ§zÙ§ ²áÌª™Ü«|Ù­ŠŞ¬‚ß®Ü®‰İ®‹ß°ƒà°†á±¬¼åá´…Ê¹­àµäµŠáµ“ß·”â¶’¸À×ã¹•ÆÀÀæºŠá»•ÁÄÉè¼Œå½•ã¼ ·Çç»ÇŞå¾àÀ¢±Êíæ¿›æÁ™ÆÉÓËÉÎæÄ¤éÄàÅ²ÁÎ×ÛÇºîÆŒ¿ÌìåÈ§ÔËÉÚÌÆÁÕâğÌ–äÎ¯ñÍ’ñÍ”ïÍ›ÚĞÆÓÓÓòĞ˜îÏ«íÑ­çÓµïÒ§ãÔ¿òÓìÑ¹ëÓ¶ëÒ½óÔçÕºòÔ¢ÚÚÚô×¤ôØ¥íÙ¾ëÚ¿ôÙ¬ôÚ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõİ­õİ®ìŞÆÙàóìŞÖòŞÊîàËòßÉÌêÿ÷â·Üæöøä¹ğäĞñäÎğæŞğæàøèÀ÷çÊÖîÿúëÅ÷êÖúìÅùìÍúíÈ÷í×àòÿúîÏ÷ìãûïÏûğÑûñÒëòûûñÕüóĞúòáêöÿûôŞëöÿúóëüõÛúóíñöüş÷Ûõ÷üşúÜşúàõúÿÿûäÿûçşıåÿüëÿıëışÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0ş\0ÿ	¨ÈŒk**J=ˆäq‘h¡¦%8Ô\nÔçÎœ+%¤å„T¡#>€9Ó¦\"ı‚–MS~¬ØX1âÃ„ÂÜ 2Êæ«T(5\Z„…’\ZjtJbé((¥Lµğ óàŒVŸvü¹ºÏ”tò4¸Ğb•*Q2²`adˆ\n;yà,¸BªR˜:™eC¼l\\8ñ7S4®X\"óÂ\r1.˜(Ué‡ È§892CcKBDbò4\'H†ö|ÑQ…Àcmº$i!>qĞx©BDÀ,P\0Á	\0€†74hßÎ];‡7\0;',NULL,NULL,NULL,NULL),(16,'sys','message_removed.gif','image/gif',1090,'2013-12-14 18:15:36',1090,'GIF89a\0\0ç´\0²FF²GG³IHµKKµLL·OO¶QM¹SS¶VO¸WN½[[«iQ½_\\³mT´mTÀgbÀgdµpV¶pV·sXÃkf¸tXÃmeºvZºwZÅok¼z\\ÁsvÈqq¿}_Á{sÀ€aÁaÊ{pÂƒbÊ~mÌ|tÃ„cÄ‡eÅ‡eÅƒ‡ÆŠg…˜ÖË…‡ÇlÏ‡ÉlÏy   ®™¢¡¡¡Ñ“l¢¢¢Ó‘}¿•ŸÔ“‘“¨İÓ›vË¡Š™«ŞÙ~Í¢‡Ô¡zÖ¡vØš—ØœØ¤x£±ÔÚ§zÙ§ ²áĞ¦¬Û£¡Û¦—Ü«|ß§‹Ù­ŠŞ¬‚Ü®‰ß°ƒà°†ß­Ÿ¬¼åÊ¹­àµäµŠß·”¸À×ÆÀÀæºŠá»•ã¶®ÁÄÉè¼Œå½•·Çç»ÇŞàÀ¢±ÊíæÁ™ÆÉÓËÉÎæÄ¤éÄàÅ²ÁÎ×îÆŒ¿ÌìåÈ§×ËÕÁÕâğÌ–äÎ¯ñÍ’ñÍ”ïÍ›ÚĞÆÓÓÓòĞ˜íÑ­çÓµïÒ§ãÔ¿òÓëÓ¶ëÒ½óÔçÕºòÔ¢îÓÃÂàùÚÚÚô×¤íÙ¾ëÚ¿ôÙ¬ôÚ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõİ­ìŞÆÙàóòŞÊîàËÌêÿ÷â¸ÜæöôáÒõâÊğäĞñäÎçåìöäÌğæŞ÷çÇğæàøèÀöêÕúëÅúíÈêï÷ûïÏëòûûğßéôıúóëñöüı÷Şõ÷üşúÜşúàõúÿıûäÿûäûùúıúúışÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0ş\0ÿ	ÉË*}*ˆêÌ˜F™\niaÂia)1Sø`’ôH‘!6>ĞDE&U¥/WÊĞÑóœ:<ıË†–ÍUÖH1²‡Š,êà€D­Y®NµA1iÑ0\'dàÀH,W£Ø°È•C%`ğ€ €Ã\rM+Ø”ÆÉ!F `(1Õ¢@Ù°p)’ˆ¡0ˆÀRD ÌÌ@ä×BZ]Ê0 r Vwš\0òcŒ›(`°eÀƒN¡ò@y§Œ¢Xz%@JæTQ#Æˆ\0’õ©€%{ä¨éâ\0Æ\0	\\¤0!âƒ&Dh°@Æ \Z2Â‹Æ €\0;','GIF89a\0\0ç´\0²FF²GG³IHµKKµLL·OO¶QM¹SS¶VO¸WN½[[«iQ½_\\³mT´mTÀgbÀgdµpV¶pV·sXÃkf¸tXÃmeºvZºwZÅok¼z\\ÁsvÈqq¿}_Á{sÀ€aÁaÊ{pÂƒbÊ~mÌ|tÃ„cÄ‡eÅ‡eÅƒ‡ÆŠg…˜ÖË…‡ÇlÏ‡ÉlÏy   ®™¢¡¡¡Ñ“l¢¢¢Ó‘}¿•ŸÔ“‘“¨İÓ›vË¡Š™«ŞÙ~Í¢‡Ô¡zÖ¡vØš—ØœØ¤x£±ÔÚ§zÙ§ ²áĞ¦¬Û£¡Û¦—Ü«|ß§‹Ù­ŠŞ¬‚Ü®‰ß°ƒà°†ß­Ÿ¬¼åÊ¹­àµäµŠß·”¸À×ÆÀÀæºŠá»•ã¶®ÁÄÉè¼Œå½•·Çç»ÇŞàÀ¢±ÊíæÁ™ÆÉÓËÉÎæÄ¤éÄàÅ²ÁÎ×îÆŒ¿ÌìåÈ§×ËÕÁÕâğÌ–äÎ¯ñÍ’ñÍ”ïÍ›ÚĞÆÓÓÓòĞ˜íÑ­çÓµïÒ§ãÔ¿òÓëÓ¶ëÒ½óÔçÕºòÔ¢îÓÃÂàùÚÚÚô×¤íÙ¾ëÚ¿ôÙ¬ôÚ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõİ­ìŞÆÙàóòŞÊîàËÌêÿ÷â¸ÜæöôáÒõâÊğäĞñäÎçåìöäÌğæŞ÷çÇğæàøèÀöêÕúëÅúíÈêï÷ûïÏëòûûğßéôıúóëñöüı÷Şõ÷üşúÜşúàõúÿıûäÿûäûùúıúúışÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0ş\0ÿ	ÉË*}*ˆêÌ˜F™\niaÂia)1Sø`’ôH‘!6>ĞDE&U¥/WÊĞÑóœ:<ıË†–ÍUÖH1²‡Š,êà€D­Y®NµA1iÑ0\'dàÀH,W£Ø°È•C%`ğ€ €Ã\rM+Ø”ÆÉ!F `(1Õ¢@Ù°p)’ˆ¡0ˆÀRD ÌÌ@ä×BZ]Ê0 r Vwš\0òcŒ›(`°eÀƒN¡ò@y§Œ¢Xz%@JæTQ#Æˆ\0’õ©€%{ä¨éâ\0Æ\0	\\¤0!âƒ&Dh°@Æ \Z2Â‹Æ €\0;',NULL,NULL,NULL,NULL),(17,'sys','message_replied.gif','image/gif',1097,'2013-12-14 18:15:36',1097,'GIF89a\0\0çÉ\0C…;Bˆ9D‡;F‹:K>H“9K‘>M’?SNN”?]‹Y«iQn‹HQœ=L¡5[›ET >³mTZF´mTS¥9X¡AX¡BµpVU¦<¶pVZ£Cy’P]¢G·sXa¡P¸tX|•UºvZºwZf¥Rd¨L¼z\\¾}^¿}__¶>h¯L²†_t¨SÀ€`f´FÁag´HÂƒbd¹AÃ„cƒ¢we½DÅ‡ek¾F~®l”œ“ƒ¬m…˜Ö‡ªqŠ¦‚nÀHÇloÁIÆi™˜uÅM   Í“m®™¢uÆN¡¡¡»Ÿm¢¢¢yÊPÊœp{ÊQÒšr“¨İÒœw}ÎS¨±}ĞR–°ÃË¡Š~ÓUÍ¢‡Ô¡z|ÙR„ÕYƒ×W£±Ô…Ø]ˆÚ^Ü«|Ù^‡ŞY«ÃÙ­ŠŞ¬‚ß®Ü®‰ß°ƒà°†á±âbá´…ÄÂÊ¹­àµäµŠß·”¸À×æºŠá»•è¼Œå½•·Çç»ÇŞå¾àÀ¢±ÊíæÁ™ÆÉÓËÉÎéÄàÅ²ÛÇºîÆŒ¿ÌìÉÑ¸åÈ§ øj¸Ø×ÍÖªÁÕâÍØµğÌ–ÆÙÄäÎ¯ñÍ’ñÍ”ïÍ›ÚĞÆÌÚ¹¾Ûİ¿ÜÖÓÓÓòĞ˜îÏ«çÓµïÒ§ãÔ¿òÓëÓ¶ëÒ½óÔçÕºòÔ¢ÚÚÚô×¤áŞµôØ¥íÙ¾ëÚ¿ôÙ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõİ­õİ®ìŞÆÙàóÔæäòŞÊîàË÷â·Üæöøä¹ğäĞİêäñäÎğæŞğæàøèÀ÷êÂúëÅàòÿëòûúòáğõñêöÿëöÿúóëúóíñöüõ÷üõúÿÿüëÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0ş\0ÿ	‹™6›*8¬U·FÉƒk¡¯<l4ÕŠÕê©AWü¶§Ø¬:pø<ÂÔÉÒ\"+Trı‹c\'™Mc®M\0À‰\">&©ùC,™\"`Ç‚Ij@\0Õ<5 ùuG[ÂzªàĞ›R2†A†ˆƒ„W½\"=0r L©T.†x4â‰<V@yÂT*P\'† ñP…Pš.\\²(Ñ°æ/§CĞÀ\"Œ&BRDã‰%C6`ˆa£ÇÂğºt&£C–ä €‚†vÑZåÈ\r CšTÚá @(]²X‰ÊÔĞœ	CÂ €\n,L”ÑáB„G>%9D#èÓ£Oò) \0;','GIF89a\0\0çÉ\0C…;Bˆ9D‡;F‹:K>H“9K‘>M’?SNN”?]‹Y«iQn‹HQœ=L¡5[›ET >³mTZF´mTS¥9X¡AX¡BµpVU¦<¶pVZ£Cy’P]¢G·sXa¡P¸tX|•UºvZºwZf¥Rd¨L¼z\\¾}^¿}__¶>h¯L²†_t¨SÀ€`f´FÁag´HÂƒbd¹AÃ„cƒ¢we½DÅ‡ek¾F~®l”œ“ƒ¬m…˜Ö‡ªqŠ¦‚nÀHÇloÁIÆi™˜uÅM   Í“m®™¢uÆN¡¡¡»Ÿm¢¢¢yÊPÊœp{ÊQÒšr“¨İÒœw}ÎS¨±}ĞR–°ÃË¡Š~ÓUÍ¢‡Ô¡z|ÙR„ÕYƒ×W£±Ô…Ø]ˆÚ^Ü«|Ù^‡ŞY«ÃÙ­ŠŞ¬‚ß®Ü®‰ß°ƒà°†á±âbá´…ÄÂÊ¹­àµäµŠß·”¸À×æºŠá»•è¼Œå½•·Çç»ÇŞå¾àÀ¢±ÊíæÁ™ÆÉÓËÉÎéÄàÅ²ÛÇºîÆŒ¿ÌìÉÑ¸åÈ§ øj¸Ø×ÍÖªÁÕâÍØµğÌ–ÆÙÄäÎ¯ñÍ’ñÍ”ïÍ›ÚĞÆÌÚ¹¾Ûİ¿ÜÖÓÓÓòĞ˜îÏ«çÓµïÒ§ãÔ¿òÓëÓ¶ëÒ½óÔçÕºòÔ¢ÚÚÚô×¤áŞµôØ¥íÙ¾ëÚ¿ôÙ¬ôÚ­ëÛÂÂåÿõÛªîÛÂõİ­õİ®ìŞÆÙàóÔæäòŞÊîàË÷â·Üæöøä¹ğäĞİêäñäÎğæŞğæàøèÀ÷êÂúëÅàòÿëòûúòáğõñêöÿëöÿúóëúóíñöüõ÷üõúÿÿüëÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0ş\0ÿ	‹™6›*8¬U·FÉƒk¡¯<l4ÕŠÕê©AWü¶§Ø¬:pø<ÂÔÉÒ\"+Trı‹c\'™Mc®M\0À‰\">&©ùC,™\"`Ç‚Ij@\0Õ<5 ùuG[ÂzªàĞ›R2†A†ˆƒ„W½\"=0r L©T.†x4â‰<V@yÂT*P\'† ñP…Pš.\\²(Ñ°æ/§CĞÀ\"Œ&BRDã‰%C6`ˆa£ÇÂğºt&£C–ä €‚†vÑZåÈ\r CšTÚá @(]²X‰ÊÔĞœ	CÂ €\n,L”ÑáB„G>%9D#èÓ£Oò) \0;',NULL,NULL,NULL,NULL),(18,'sys','message_unread.gif','image/gif',1044,'2013-12-14 18:15:36',1044,'GIF89a\0\0ç‘\0¬iRµnUµoU·rWºvZ¼y\\¼z\\¿}_ÁaÃ…cÄ…dÆˆfÆ‰fÈŒhÈŒiËk   Í”m¡¡¡Î–qĞ˜pÎ˜vÑšsÒ›rÓuÖwÖŸyØŸwÕ¡x×¢w×¡}Ö£{Ø¤zÙ¦yİ¦xÚ¨}Üª|İ¬á«}Ş­~ß­ƒß¯ß¯†Ş¯Œá±ß±á³„å³„ãµƒãµ‹áµ’ä·†æ¹†æº‰ã¹™ñºyè¼ˆç¼“å½›é¾‹ëÀ‹ëÁçÁ¢çÂûÁnúÆ{îÈ–èÈ¯îÉÿÉuûÊÿÍôÎ™ÿĞ‡ÿÒ‰÷ÓğÓ±üÓ‘÷Ó¡óÔ«øÕ ÚÚÚÿÕ‘ğÕ¾ù×¢ÿ×“ÜÜÜÿÚœÿÜÿß§óáÎúä¸ÿä±úåºõæÊÿåµûæ»ûç¼ûç½÷éÎÿê¼ÿêÀøìÌ÷ëÚûíĞùíØıîÈÿîÆúğÖùğÛÿğËùğáÿñÎıòÓûóÙıôÓÿôÏúòèÿôÖúóëüöİúôïÿö×ıøİÿúÜşùåıúãÿúáşúèÿûæÿûçşûíşûòÿüêÿıåÿüíÿüîÿıëşüõşü÷ÿıòÿıõÿşòÿşøÿÿşÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0Ø\0ÿ	H° Áƒ…ôØQc†‹%F€à€ÁÂ„\nVxL¹³H¡A€üì™£f‘pÔñ‘Ò#G‰ñ¡#&•h4zc£L™tÂÄ€‚%Œ¥iÑ(K°TA\0¢BÆh0C§Ë$R•€p+C<¨ÈğCD%G\n@ H-‡úx‰ãæ‰	#E@ÁFÇ™C‚şèqSæ‹“@@èÀ8kÈpÉrEJ’ 7@øpB„(@pÀ\0\0Hˆ\"‚íÛ¸mÏFÈ»wÁ€\0;','GIF89a\0\0ç‘\0¬iRµnUµoU·rWºvZ¼y\\¼z\\¿}_ÁaÃ…cÄ…dÆˆfÆ‰fÈŒhÈŒiËk   Í”m¡¡¡Î–qĞ˜pÎ˜vÑšsÒ›rÓuÖwÖŸyØŸwÕ¡x×¢w×¡}Ö£{Ø¤zÙ¦yİ¦xÚ¨}Üª|İ¬á«}Ş­~ß­ƒß¯ß¯†Ş¯Œá±ß±á³„å³„ãµƒãµ‹áµ’ä·†æ¹†æº‰ã¹™ñºyè¼ˆç¼“å½›é¾‹ëÀ‹ëÁçÁ¢çÂûÁnúÆ{îÈ–èÈ¯îÉÿÉuûÊÿÍôÎ™ÿĞ‡ÿÒ‰÷ÓğÓ±üÓ‘÷Ó¡óÔ«øÕ ÚÚÚÿÕ‘ğÕ¾ù×¢ÿ×“ÜÜÜÿÚœÿÜÿß§óáÎúä¸ÿä±úåºõæÊÿåµûæ»ûç¼ûç½÷éÎÿê¼ÿêÀøìÌ÷ëÚûíĞùíØıîÈÿîÆúğÖùğÛÿğËùğáÿñÎıòÓûóÙıôÓÿôÏúòèÿôÖúóëüöİúôïÿö×ıøİÿúÜşùåıúãÿúáşúèÿûæÿûçşûíşûòÿüêÿıåÿüíÿüîÿıëşüõşü÷ÿıòÿıõÿşòÿşøÿÿşÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0Ø\0ÿ	H° Áƒ…ôØQc†‹%F€à€ÁÂ„\nVxL¹³H¡A€üì™£f‘pÔñ‘Ò#G‰ñ¡#&•h4zc£L™tÂÄ€‚%Œ¥iÑ(K°TA\0¢BÆh0C§Ë$R•€p+C<¨ÈğCD%G\n@ H-‡úx‰ãæ‰	#E@ÁFÇ™C‚şèqSæ‹“@@èÀ8kÈpÉrEJ’ 7@øpB„(@pÀ\0\0Hˆ\"‚íÛ¸mÏFÈ»wÁ€\0;',NULL,NULL,NULL,NULL),(19,'sys','mobileLogo.gif','image/gif',628,'2013-12-14 18:15:36',628,'GIF89a\0\0Æq\0µx8Àz.Ä€7µ‚PÓ ¾ƒF¾…KÜ…\"áˆ ºeÕ‹8×‹5åŠ æŠ ã(Ø•Kñ’ ò’ ò’!á–@ò”\"ò”#ò•&ğ–*ò›%ó›3İXó&ó8ğŸ?ò¡1ó£4ò¤/ó£7Ò©jÏ©‚Ó©}È«‹Ë«ó©3Ú­]ó¨HÉ®–ó«Dó«Nó­@ó¬OÕ±{õ¬Tó¯Bô®Mê¯kõ®YÎ´—ó±Kô°Uó°Yô°Wô°XÑµÛµsÎ¶ó¶>ó³]ô´Wó¶Tó·SëºTó¸Vì·xô·bó¼CóºXÑ½«ô½]è½Œó¼|óÁVäÁƒóÃYôÃfÜÆ§íÇ}åÇ—ôÈlôÉnôÆíÊ‰ÜÌ¾ôÌŠôÌ‹éÎ¢õĞ„ñÒ¯õÖ™òÕµõÙ£õÚ¥ïÛ¸ëÜÆöÜ«èİÔìßÎïßÏóà½ñçÜòèŞòéß÷ìßùğçûù÷ıüûşıüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0¼€.8:†‡†9,‚Y`dbaZ)hi[`cq;`?7^¥fq5^S=/¥¥F2\\²N%\"²²WQR\\@+UPBADHJTUU<I(U6!lkÓ1MCOO-ppÓâ >G\'Ó\rãîÓ4îVEãLqp\nã_âÄ!1n‰À0ºÌˆpF \n ^‘à@›8oh(ƒ€;yjâ¸	ˆş¸›`b\0wŒ>~\0;','GIF89a\0\0Æq\0µx8Àz.Ä€7µ‚PÓ ¾ƒF¾…KÜ…\"áˆ ºeÕ‹8×‹5åŠ æŠ ã(Ø•Kñ’ ò’ ò’!á–@ò”\"ò”#ò•&ğ–*ò›%ó›3İXó&ó8ğŸ?ò¡1ó£4ò¤/ó£7Ò©jÏ©‚Ó©}È«‹Ë«ó©3Ú­]ó¨HÉ®–ó«Dó«Nó­@ó¬OÕ±{õ¬Tó¯Bô®Mê¯kõ®YÎ´—ó±Kô°Uó°Yô°Wô°XÑµÛµsÎ¶ó¶>ó³]ô´Wó¶Tó·SëºTó¸Vì·xô·bó¼CóºXÑ½«ô½]è½Œó¼|óÁVäÁƒóÃYôÃfÜÆ§íÇ}åÇ—ôÈlôÉnôÆíÊ‰ÜÌ¾ôÌŠôÌ‹éÎ¢õĞ„ñÒ¯õÖ™òÕµõÙ£õÚ¥ïÛ¸ëÜÆöÜ«èİÔìßÎïßÏóà½ñçÜòèŞòéß÷ìßùğçûù÷ıüûşıüÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0¼€.8:†‡†9,‚Y`dbaZ)hi[`cq;`?7^¥fq5^S=/¥¥F2\\²N%\"²²WQR\\@+UPBADHJTUU<I(U6!lkÓ1MCOO-ppÓâ >G\'Ó\rãîÓ4îVEãLqp\nã_âÄ!1n‰À0ºÌˆpF \n ^‘à@›8oh(ƒ€;yjâ¸	ˆş¸›`b\0wŒ>~\0;',NULL,NULL,NULL,NULL),(20,'sys','mobileSplash_large.png','image/png',46151,'2013-12-14 18:15:36',1207,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0@\0\0@\0\0\0®nğ\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0³éIDATxÚìİ]l\\g~Øá3$‡Eï¬>¸bcQI[Ù&7ÑÊ ±®İ&©¬\"q³6x¯\n«@rUH2\\8vïäÙ@?Ü¢RÑ¢ph·E”E±²šmáJ©H¤U×äÊÛHn8t\"™”´c“9\"§3¢+Ë%ñc>şä<Äh<çœáË¹8øù¼ïIåßŞš\0\0\0\0@TM†\0\0\0\0€È,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0B°\0\0\0\0MÀ\0\0\0 4\0\0\0€Ğ,\0\0\0\0Bk1\0\0uÔÜİ_úÙ”ÉÎås¥\'ÅéüÜØa\0¸›€\0Pk©¶LËö}éŞ—æëÕ=ŠÓùÙÑÁÂğ÷n]:i¬\0\0Ê§Où··\Z\0€šiÛs0ıíWRm™G¾s.Ÿ›şà\r\0@À\0¨‘¦Î¾öç—~.i«[—NŞ<õjq:o\0€Æ=2\0\05Ğ²}ßúß]j½ZÉ†\0\0k†€\0PuÍİıí/¼³˜iƒŸ±uö­ñİeo\0°Ú	X\0\0U>ßÊdÛ_xg…;IµeÖ¿ø®Á\0\Zô„Ê\0\0TÕº½‡+rñTSgßìÓŒ\'\0Ğ€,\0€*J÷4w÷Wjo=ø—SİF\0h4-†\0\0XKš»û[²ıM½w_ôTœÎÏ\rßÊ\rÎÖøó´î®ğ5S_öà…ÿrhgOÊß\Z\0h\0°4e²éo¿’îxàd½íûZw(Nço]:9sö­¹|®Ÿª¹»¿ôÁ*»Ïì®}çŞËä®–İèÏ\04\n\0XİRm™ÖİZwí_ä›Ó½¥Gaøx\r2VËöç+¾ÏôúÌ–\'ú‡ÿ÷É®L*İìï\04k`\0«Xswÿú—°Èzu·tï@iÃ–íûªúñZ²ıÕØí–\'û³Éğ\'E_\0\0 AX\0ÀjUP/¾»ì9z©¶Lûï´í9XÅ3­Î¾jìvCOy·WòIaÖ·\0\0h\0°*¥{Öí=¼òı´î>P‘ıÜï«qUHa¶Ü°\0\0\Z€\0¬>Íİı¬Nó«bUş4«:—_%·§Î?¹ò³€† `\0«ÌüÔ¿ÊîsİŞÃïMÅÏªµBüÄø{¾6áë\0\04\0XeÖí=\\ÙyíÏWx\"aõnq81öÅ­\04\0XMš»û«tëÀ¦Î¾|ÏK•İgqº*‹T¦¾Ü­‹°\0€F `\0«Ië®Wª·ó\rÏ¼0RÉU¥fG«ñ9¯^ôM\0\0\ZŠ€\0¬\Z©¶L•.¿š×±9ûùc}Ul‡·.½_Ï9zî¤/\0ĞP,\0`Õ¨j½š·í™¡OŠù©ÊìíÖ¥Ê—¦«ï,â^²©Ã÷\0Xû,\0`ÕhÙş|µ±åÉşÒÏá¿®ÌDÂât¾0|¼²ŸğãÓ_î0İìK\04\0X=\'.™lµ±¡§¯ôsüóŠ->ıÁ\\ÊıêÅÁËw,—_\0rh\0€UsâÒÙWƒ£tl.g²ËŸVì\"¬éŞ¨È®\n“ùsï½~÷+]_OùV\0\0\rqh\0\0îÖÑYXWòIa¶2;,Ÿúi&{ïõ#Cw¿Ò•ñç\0\Z‚€\0°°JÍ\",ùì‡¯Ş=õoÎ;tÏ²­\04\n\0`a•ºaI{krõÄ¡N]Æ¶…Éüıõ*İœô>nş \0Ğ(,\0€¯¸şÿ§é]›(Vp·;ºR?ûÏ¯ÿèÍ—\'Æs‹ßêêÅÁ¾ş[÷_½UÚ›Ë¯\0€Æ!`\0«Æìè`\rR˜ÌWc·éæäWÿvêúÿü“ßöì±CÌXW/şèÍ—^ÙÉÖN_\0 ´\0`µ˜Ëçš»«{ˆ««ØÈ2íåyFŠ—O/=6ôômy²¿ôsş¾‡ónŒ•¥ñ Â•İ˜ìì1y\0h,\0°jÜºô~ºw ª‡=²ªûÏnL2ëRg.³_´ª¥n®^\0\rÈB\0`Õ˜,Nç«zˆÑs\'«ı[dÚ“gw¤6?¶´­Ê3·¦Ô+\0 1	X\0ÀªQœÎßºTÅÀô‰{•ÕŞšìÙêÿæ¢2Vº¹¼dû¯=•êÊø\n\0\0\rÊB\0`5™9ûVõf~xâÈİÿÜÔQİË6u”3V~*¹’/ßñ°ô¤0ûåÍ´\'™uI××u+\0\0\0XUæò¹™³oµî>Pñ=?yÏ\nî™öZüFåPU>¹\0\0d\n!\0°ÊÌœ?:76TÙ}&ógºçÅM\0 \0XeŠÓù©÷_­ìjî?ş—¿[˜üÊ³Ë‹O\0€\0¬>scC“ßÿî=ÉiÙÎ;tÏäÁ’ì&sú\0\0¢°\0°*Í\r}ôï^~âŸşQzıò9ŸŸ98zşŞ;n~líÏlÊd[¶ïkÙş|ª-ÓÔÙWzevtp.Ÿ›=sëÒÉÊ^à\0°B©üÛ[\0°\ZMÍ$gF¿¶ç÷şÍ–\'û—±ù‘¡3Ç•~Şózº9yvGª½uÍ[Sgßº¿ÿZs÷­8/üäØÌù£2\0„€\0¬b¹ëÉ…‘â¶g¾õƒ›³‹Üª0™ÿé‰#:ºàİÙ“Ên\\³#Ö¶çà\"ïáX^kì¿7;:èk\0Ô€\0¬nCŸ?+?ÙöÌ@÷Óûºwí{È›oŒ}têhîüÉ­Ÿ•İXXku¬Öí=œîXÒ&7O½Z>îk\0Ô—€\0¬zFŠ¹ë_şsË“ı÷O*¼zqğúÈĞÃ×}_Ûõªí¹×Zwí_Æ†¹ÿøİ¯ßp\0PO\0°üüJéQ\\É¶v&}¯ÙzÕ²}_ûï,oÛÂdşô?öW¶|–nöE\0ê£É\0\0kÀ®¤ÿ›Ë\\y½´UiÛ5\\¯’Û—_-{ÛôúLçßİæR±0ë‹\0Ô‡€\0¬›:ÊwÜÑ•Zü…B¥w–Ş_Úª´í\Z–îhÊdW²‡\'şáş©Tfø“¢¯\0P-†\0\0X3n©r“Ê]O®ü¢xm\"Yğ¢¡ÒÛ6u$]_Oue’F˜×²ıù•ìúLv×¾Ë§g7%k;ö\0AÏg\0°öd7–å)ù©äÖ\\29“LÍ”§\n®oMZš’L{ƒğmß·òt?]X?)şúS)_0\0 Öç3†\0\0XÃæ[U#_4ÔÔÙW‘ıtl.OBœšI®ä“®Œo\0PÛS\ZC\0\0°†¥Ú*S›6ô|Â®üÂJX\0@­	X\0\0,Áø„1\0\0jMÀ\0àÑ\n“ùù\'S3\0¨5\0`-›ªÈ~®|¹Ÿk.Â\0jKÀ\0XËŠÓù¹|nåû¹12d0€z°\0\0Ö¸[—N®|\'—O¿ó¼Å)$\0P[Î>\0\0Ö¸ÂO­p7F†î¾+ÓnP€š°\0\0Ö¸¹|®0||%{8÷Şëw«W\0@í	X\0\0kß\'ÿõ‰ñe®„uùôñ«ïüsS‡á\0jMÀ\0Xû6¥óño·0™_ê†7F†î¾üª$»1e<€\Z°\0\0\ZBÇçÃúæËKjXW/Ş³ÉæÇL!\0ê@À\0h;º’¹±¡ğìèùGß”°0™ÿğÄ‘İ¼vf]~\0ÔA*ÿöV£\0\0ĞòSÉ™KÅÂl²åÉş­Ïl{fàş÷LŒç>>}üòŸ¿Í¬=©ìF£\0Ô€\0Ğ@r×“#Å;ÿÜòdÇælGg6¹=apf2cdhÁ\r³ËË\0\0uÑb\0\0\ZGvc²¾5õç—¯ÃJnG«Ålµ£+µ£Ëà\0u#`\05ÕÜİ_>É–§ó³Ÿ•~Î\r™šÙÔ‘<»#u!WÿüÑonoM¾İ“*m\0PG\0PuM™lËö}éŞ—š:û|C¹dŞºô~aø¸áªöÖdÏöÔµ‰$w­˜»¾ğ{6?–to´è\0‚5°\0€*jÊd[wH÷,òıÅéüä_ûŸÇ6¥óF¯f®M$“3ÉÔLùyº9É´\'_[W~\0„€\0TKÛƒ­»,cÃ‰ñÜ_ü‡CM=¸£+ÕŞj \0\Z€\0Tá£-³şÅw4ap‘>:uôÜ{¯g7&2\0@ƒ³\0PaM}í/¼Ó”É®p?OìİŸ^Ÿ9{ìĞ•|±÷q‹1\04ğ¦!\0\0*(Õ–©H½š·í™İ¯¼Y˜M.ŒKÃ\0Ğ˜,\0 ’Ê3+T¯æm{fà—¿s°ô$w=Ñ°\0\0\Z“€\0TLÛƒ+\\÷jAßúíƒzÊ»Õ°\0\0\Z“€\0Tè¬\"“]Ş=cÏ+oÎ?É]/?\0\0h¬SMC\0\0TDõêUÉ†¾mÏÌ?ş¤85c¼\0\Zˆ€\0Tâ”\"“M÷TõOìİ?ÿ¤0›}b\"!\0@#m\Z\0`åª]¯’ÛaÍ¯„Ur%Ÿ\\›0ê\0\0BÀ\0* eûó58Jöé}wç®¹\0 QX\0ÀJ¥Ú2Õ¸ùàı¾ñDÿç¹ëå¹„\0\04\0XñùDMêUÉÆ¯È,B\0€F9á4\0À\n5£F+½>s÷?Ç?7‹\0 !X\0ÀJ¥Ú25;Ö†».Âúì¦±\0h\0°š´ŞuV~Êx\0\04\0XMf&ów[Ä\0 AX\0ÀJ§ó5;Ö‘!\0Ğh,\0`¥f?­QT*Læ6\0@°\0€•š«QÀºşÕË¯ÒÍÆ\0 !X\0ÀJ§óµiX£çOŞıÏL»±\0h\0P…áïÕà(£ç¾°ÚÓ\0 !X\0@Üºt²Ú‡¸zqpb<w÷+›Ky\0€F `\00—Ï†WõŸ¾wÿ]\0Ğ,\0 2fÎ¾U½_½8xù««+cw\0€F!`\0•1—ÏU¯a{ïõ{^Ùö\ró\0\Z…€\0TÌô™#Õ¸á¹÷^¿1ò•İn~,ÙÔa¼\0\Z…€\0TÒä÷¿[Ù†uùôñN½çÅŞ_rù\0@°\0€J*Nç+Ø°.Ÿ>~öØ¡{^ÜÑ•Ê´i\0€\"`\06ß°fGW¸ŸO¹¿^ue’]Æ\0 ±X\0@åÍ7¬™³o•,có‰ñÜŞ|ù§|ä×3íÉÎ“\0\ZN*ÿöV£\0\0TIS&Ûºû@ºw`‘ï/Læ?úoGïOWÉík¯vö¤ÒÍ\0 áX\0@Õ]½™™ÚöÒ–_Ù·åÉşßP˜ÌçÎŸüôâàåÓÇ|Ã®”™ƒ\0\0\rKÀ\0jaj&ú¤x%Ÿlèék]ŸéØœíèÌ^ÿ«¡ÂT~b,71{Ğ†›+ßsĞªí\0\0¬Å\0\05ĞŞšüêÖÔµ‰$wm(7²¨M6?V¾ğjS‡Á\0ht\0P;›:JTïãÉ•|ríóâT!ÿü+oÈ´\'™u¥Ÿ©®L¹y\0@\"`\0µ—nN²K÷\0`Qš\0\0\0\0‘	X\0\0\0\0„&`\0\0\0š€\0\0\0@h\0\0\0\0¡	X\0\0\0\0„&`\0\0\0Z‹!\0\0Xóš:ûRm™æo”ŞyqöÓ¡ât~vtĞø\0\0Á	X\0\0kSSg_ú›ûš»÷4w÷?üscC³Ÿİºôş­K\'\0P*ÿöV£\0\0°vNïÚ2-Û÷µîz¥©³o©Û§ó·.œ9ûÖ\\>g$€@g8\0ÀšÑ¶ç`úÛ¯Ü=Opy\nÃÇe,\0 \0ˆ¢©³¯%ÛßÔÙÛ”ÉÎ¯Ù4ÿzq:?764—ÏÍ™TUÔÜİ¿nïáÒĞUpŸ3gßš>sÄØ\0u\'`\0uÖ”É¦{Zzi‘ñenl¨0ü½ÂğñâtŞèÍk{îµÖ]û«±çÒhO½ÿjé§A\0êHÀ\0êw\"Ò–i{îµtïÀ2¶-Nç?96sşhƒg¬Ò®ñİe,wµ¤¡¾yêUë»\0õ<ç°\0€ºhİµ¿u÷®Ö4—Ïİ<õêìè`caSg_ûó‡«Z¯î(saø¸ï-\0P\0Póó¶Ìº½‡[¶ï«ÔgÎşàFÆ¦LvıË?Xùzí‹§a\0u;ó1\0@-ÍOy«`½Jn_ÌÕşÂ;µL9†±ö¿re³#\0Àâ	X\0@íToÁ¦rXùÇïN6JÃjáÚÌ¼GùF‡õ8.\0Ğà,\0 Fª½Üøc÷}í>s©X˜]ã#Ù¶ç`sw½şˆ…gç®û:\05%`\05Rƒ‹wºwíû¥ß8øßVÌO­İ³·L¶u÷:~€\r=}sOĞ°\0€š\0 Zwí¯ÍòIßúíƒÿNÿ™KÅµZXÖí=\\÷ÏP\Zä¿œìÖ°\0€š°\0€ªKµejyÑĞÓ¿ó‡…ÙäÂHñJ~­dsw½&Şã[ß9X\Za\r\0¨\r\0¨ºÖİjy¿¼\r=}Û(=¹0²Öæ¶í9ä“”F¸csvø“µ<[\0ˆCÀ\0ª«|ùÕ®ı5>è·¾s°ô³0›üùÿ];kº7uö¹üêÎ —¯tË­ıUó€úŸ\0 ªj_¯J:6g»w•—ÜššI~~¥¸VFò•PŸ\'{{„óSkg„€°,\0 ºZz©.Çİö÷æŸ|<–\\›X#Y“Uğ/½>3_	K#l\"!\0PU\0PÍSÎ¾¦L¶.‡o+óÖÀ%BÍİıµ\\Gl±ƒüôƒ<ü×.Â\0ªyVi\0€êiÉÖsÍ¦-O~qôñÏWıEXõÉFa\0 2\0¨æ©Fgo~\'¯”ä®dÅulÎ¦×gÖÆ\0¡Ï…\0PÅS:Íœ·~ó—GÏ]OVõÍòš:ûb~°=}kc„€ĞçB†\0\0¨â©F]³KÇæ¯ä³U=Ç­¾)p‘ƒ|%ï+\0Tç\\È\0\0Õjİñ+¿0Ç­ò::³F\0¨6\0hù›«öŒ-êüÁ{¸\0¨Öé!\0\0\ZD~jµ~òP²=œ{\0ÕĞb\0€ê)NçCÅ—Âl’n^éNJ¿Ñ=—D?ËÍåsUÆÕòÏO%›:|ñ€\n°\0€*šjîî¯×Ñ\'ÆïJŸİ\\f^iêìKs_s÷‡ü:³£ƒ³ŸÍ¹uédÅ‡qµüÅİˆ\0¨\0¨¢¹|®¹»nGŸ_éUQM™lºw å©—sÀæîşrŞÚµ¿8¿uéäÌÙ·ªzYVc_ùóSÅ$Iùæ\0•%`\0U476\\Ç£_½8¸ìmSm™¶ç^K÷,oÛÒ†¥ÇìèàÍS¯V$c•v²˜ˆV{÷\\ævkÎ·\0¨<‹¸\0Ut+7XÇ£/;`µîÚßñO>X^½º[swi?m{®üw	;‹ğúÈï9\0Pm\0PEscCõšF7z~…¨¹\0Vª-³şÅwÛ{­‚kÏ·î>ĞñİÜ³îûÒGr8àßwb<W˜Ìû\0Õ&`\0Õuëgß«Ëq/ÿÙñ{^yäı›:ûÖ¿üƒj¬:_Şó‹ï®dÏ…¿<ğ»’Iš\0\0K8›2\0@U†×ş ã¹û¯ÀÊ´?ô¬èvcªŞ:Só×v-{ZâÜØPq:ÜµN£çNú†\05 `\0Õ5—ÏÕ¾a}øÇGîqSÇï7_¯*8mğAÖí=Ü²}ßò¶½u)V-*Læï¯„d\0€e°\0€ª›şàZ^=41»|zd¶ù±…ßŸjË´¿ğN\rêÕ¼u{/o=¬™óÇBıYs­2öÈyš\0\0Ë `\0UWœÎÏœ}«f‡;{ìĞı/¶·>p÷öŞ©ŞÌÁû¥Ú2éß|çêÍ%÷²¹±¡ÙÑ@kN-x™ÛÃçi\0,€\0ÔÂÌù£µ™÷á‰#®,İ¸ğÔ¶Ö]û«±jûÃµnÈÎ>}àçW–¼áô™·‚üA/Ÿ>>1¾Àı%yŸG\0€e°\0€\Z¹yêÕ¹±¡ªbôüÉŸ.tYPRX¼˜jË´î>P—Ñxbïş_lØsa¤¸¤­fGƒ\\„µàåWš¤	\0°B\0P#Åéüä÷¿ûù\'ÕjX7F†Î,4y0¹]¯Ú[x½í¹×j¶ôÕı¾õÛs×“¥^‡uóÔ«uÿS~xâÈ‚—_ue¬à\0T…€\0ÔNq:å?}÷ÆHåÖÕ‹ƒúæË…É–ŠO7\'½/Vš2Ùtï@GcË“ı¥ÇÏ¯s×—°Õ\\>7ıÁuüØ¥?ßƒ.sëÊø\0U!`\05µe]ş\'ÿêåÑó•\\ë£SGô€zU²£+µà­ñê[¯æ=±wéçğ\'Å©™%l5sşèg?;Y—\\\Zä]æÖ•Yø27\0€•°\0€ZëİüÙ™ı»çŞ{ıAÉiñJ{øñ¿(ïêAoèÊ$[;şO-O½T÷¡èŞµ¯cs¶0›\\È-m1¬«\'^­Æ…ltæØ¡wÛ7Ì\0ªEÀ\0j­½5Ù³=õÑ©£?|ı·.Ÿ>¾¼&ó8râ}ÈÅ\\™ödgÏÂU¥¹»¿)“0\ZİOï+ıÿ<YÒDÂ-ëòƒo½\\ã†uöØ¡öæÇÜ\0¨¢æ?øÍ\rF\0¨±¶tÒŞšÊıM~ôüÉo7¬u_ÿFëúE-¡41ûğÄ‘3ÿşĞßüôÌ¦ô¶L{9“-8y°¤u×+ÍëéC1wkú¯ş×‰Ò“üÍ$»1Õ¼èÿ½ØÖ43øş‰_úåP\Zº\Z|Î³Ç=¤6~»\'eş \0P=©üÛ[\0P¹ëÉ…‘/§Îmèé›_×<İ)ı¼ûW/NŒçnŒ;¹àıïîñğzU²şÅw›»û#Ba2ÿı;çŸïìIe7.aÛ3—Šù¹Ìoú£ÒĞUõyğµWÉí›<>èJ7\0€Š°\0€zÊO•+La¶’ûìÊ”{ÊCêUÉ×şÙå8ƒğÃ×k~2`{kòëO-¡MÍ$?şyyôş?œ_¾âJì!ë^%·oòøkO=b´\0VÈ\ZX\0@=eÚËù£+S™½¥›“¾ÇS¿ºõ=%ÈêWwÜ™;95“\\›XÂ†í­_\\útî½×ôæË‹¹6mI><qäN\\{G6\0ÀÊ	X\0@¥›Ë¤ôXá\"JÙÉ³;RºçàİR_‹°î\0ø7¿XÚíïÜfñêÅÁ?ùıg+roÇ’Ë§—ööÓ?>òğ·íìIY»\0¨C\0\0DĞ•)=R¹ëÉèõâøçKÛ6»1ÙÑµŠ¿{õú+ù¤ïñ¥mŞ÷xêÖlqş&†:Zzl{fà‰½û—±0Va2ùôñÒs1WiØ—´b\0À²	X\0@ ·›Hjj¦Üq®ä‹ù©äAËcµ·&›;’M•§®¥)l¥ß½ôXjŒ»=‘ğ‹†•Ü¾~ªôèØœí~z_÷®}{úÒ½Ãã‘¡«K‡¬Ô~ÿ_ÊÂí\0@ÍX\0@8í­åiq[;Ë}¤0›|vóŞ7¬íikS…dW“íìIµ4?ûò•‰ñÜüY¥ç›³ÙùŸóÿuf2?¿¸ÕÕ‹ƒK=Ö®Ô.ßS\0 v,\0 ´tsÒh«,¾Ì_¹ïñT¦=şd»:NŒç*²Ä{éÏ±³§b‹îÀÿcïş‚£:òßŸªR	É\Z©%¢¥¢M‰Kˆæ¯™Eö5`{ğvcâÆ.Dì„Ã÷a#ìGÇ}Ø™}Ü¹OÓ÷>L8âîCwÄÌÛ±wÃìì†›îÀc0öÚR4 ş!a\ZcJjBÕ¨…„JUu¥©¤ô©*Oé”ôıDQ’Å©s2ó9üò—À\"À\0\0XfÃÿÒmëP«œue¾ë÷–\\Gl1Öı™³cc×\Z\0\0…‹\0\0\0XuÑßyê|âcÏíøx,å8Ù——*-vöoN—ÃŸ3+ëcnÙà£d;\0\0X.°\0\0Àj”||Ï_±Ñ#\'“Q…j2iá˜«Ò»:F‡¾‡©±‰ìCè\n\0\0x,\0\0°\Z%¢¿óW÷Â™¨Jên¦ká§·tücJş\\|B–üİ\rÎÆµ¾ÕV€\0\0x,\0\0°\Z%¢‚¯x\"€5{ÀÒ åØP‘ÎÆ’7FÇcé%ŠcqçÉ„cff•;/§?º¢4´ª(eŒ\0\0\0!€\0\0V£É;ÿì8ÿ·Îd\0V±Ï¥ÏZ[¦ö7ô1\0\0\0@añÓ\0\0`J=}<ÃZf£C÷¢×2O# \0\0\0C\0\0\0¬Rñ›ÿ}ÙÏ!Ò~jö7Y¾\0\0\0\0\0X¥&ïüsòñ½e<ø“Ç=gÿaö÷ËKè\0\0€çÀ\0\0«×Ó¯ÿ¯eüô[çş!şäqÆ7+JYB\0\0‰\0\0\0X½&ïüs\"ú»eùèÑ¡{s¦_©í\0\0`\"€\0\0Vµñ³zú8ÿŸ{ñÿÃìô+±±Š>\0\0ÈD\0\0\0¬jÉÇ÷ÆÏşu?´ë×?Ø3Gæ×º?sJ‹é\0\0€L°\0\0Àj7yçŸ\'®ıCŞ>®¯ıÔOÿ~Îÿªbı \0\0À`\0\0¤«¹ÇoÊÃÅ¾ï¾úßşvÎÿTQÊúA\0\0€¹À\0\0H?û×c7Üa\röüî‹ÿçßÍYúJ4Õ‘~\0\007X\0\0\0ÓÆÎşõSëÒÁûÚOŸ?z®vÖ–Ñ\0\0\0s#€\0\00-pJzşñ³¿ıÉèĞ=‹‡?yüÍÿûáÅüóı@i±³eéW\0\0\0óò=ş8L+\0\0\0hİı©è“ŠÆ·şıÖ7ÿ}ğ¥ŠÖ×~êêûÛù¯œ©¨ÙşÍ¾ŠR\Z\0\0`^°\0\0\02]ÿ>uoØ)[·±ùØÿ¹qç_fÆêk?Õõéß¿0™kOØ·¡‚&\0\0X,\0\0€9¨–¾T±qç_†vıehç_.æ/Æ¾ïîk?½úÏ‹Y‡¸ãG>v\0\0x!X\0\0\0sÓ1,­¦ñ/*ÔTüRÅú­a~?ö}w|ìñ`Ïï†åÍü«MÁ@:÷ŠÂí\0\0\0‹A\0\0\0`^‘‡é’XÖ[QêìØHİ+\0\0€Å*¢	\0\0\0æ®vÖ–ùn¤†şdí˜[6ø¶l i\0\0–€\0\0\0ÀB*JÓ»ŞvnßOMät¨\rNS¯´˜F\0\0X\ZX\0\0\0/¶±J^é0VäaêñØÒşn0]mÙ@è\n\0\0 K°\0\0\0K…±Æ&œû¡?¥:ñÄ¼?\\QêT”8~àÛPAË\0\0ä„\0\0\0ÀÒ”§kc…«}ò>pFÆ§¿ÿdÂyéYÛ\0\0XD\0\0\0 {ÁÀL¬Š \0\0€Kü4\0\0\0\0\0\0¼Œ\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<\0\0\0\0\0\0\0<­ˆ&\0\0¸gÌW6æ”Íş~Ğ‰—§†i ŸF|Uq¹ù¦”:£¥©QÚ\0\0\nX\0€\\©(Õ#Í¤SüØW)ßyä«Yü_¯HÅŠœ	™KËŒ:ı>5±65H«Vú7Ş÷…F|UêŞœ}÷ÉíJöP\0\0G\0\0°d“Nñ#Ì‡ùjÌœìLÏ«}™ój™QËÔZ½¡Í¥Šúë{ıÛÇ|eß}òŠø·Ê½Ö¸Aì\0\0x–ïñÇaZ\0°#¾ªûşĞ oãœ©î)MÊ¼Z^’Ñ\"g‚\06æ+»\Zx=‹ûTn±–Äî2\0\0àA°\0\0/ğÈWõ×ËŸ§rhëë6ËŸÅkJ*×Õ-ü“c±‡ò&6Ô:¾È	vMê‘,`>#¾ª‹E‡3ò\"ËÊ«*«k3nI¹ïûïdÜzA\'şêä¤=\0\0¯!€\0˜Û˜¯,ê¯úê[­¯Û<51®š!×‹K²şÄØĞÀèÈğÈ¼:ö0ı~¾Ÿ”9vMò^8y‹i6`š½\n7îÙ²£UîĞùşJ4Ò}ûzÛƒş;æıE\0\0x\r,\0@¦G¾š»şÆûşĞœÿ5¸¦¤¦nóú©×³âÜÅ\'ÆûïÈ¼º¿¯{¾`–ª?-/z\ró•µ½££WeåUûW‘/t_:ÿ‰ÎÆ\n:ñ7â¿&Ï\0\0x,\0€1‰õ×ßõ7ÎY:G&ÃuõM2…›òb£#Ãı‘îHÏeµä0Cij´!yƒ0V¹‹E‡õ •Õµ}¸¤ŒÈØĞÀ¥óŸè[lC2º+ñ5­\n\0\0<‚\0\0 mĞ¿ñ¦×ìÕ‚Á5%¡ps¸q÷\"ó8Ü6:2|·çJ¤çòìœ¬ÒÔè+É«5É{ô&Vç-|%ğš¾múŞÏ²XÏ\ZøòÓ_è<¬W\'¿`_B\0\0à°\0`µ{ä«é\rl×‰Zeuí––ÖP}s.e­Ü3»p\"óíWW)ßƒÕ¦½è;yğØYGœåÎj?sR½¯HÅL¡m\0€Ñ\0°jM:Å7»¢şúŒïËÔ·yï›I¹šO(Ü$¯ıwº:Î™a¬G¾š¶¢#áä­†Ä\r*ø`•ñUéè•ªO—Ë%]İSrL92á`\0\0à°\0`•\Zôoìì7w+s\n$t•qÂmÆŠø·Fıõ-‰¬(Äj`†¡·ìhÍñhr}7É‘·%`\0€åG\0\0VI§¸3°?c“ÁÊêÚPèÊ¤ÃX×ÚOëÔq\'x%ğÚ_´%qT,¬lz	ğTÑº\\·Y#ÈqT%¬û¾Ğ6ç\n-\0\0–Ÿ&\0€Õ6Ñı*ø®½’™êÎÖ£oÿ¨@£Wšœ¿\\…\\‹\\‘ş¦\\i[Ñ‘_]•jÒ)ÖëCáf+ÇÔÇó•Éñid\0\0°ìÈÀ€U¤7°½×¿ı¹ij}Ó¾C\'¼Y¦=;[ZZëÂMß¶Ÿöuëx[Ñ‘WW7%{XytôÊ™J¥´rÌôqzfÏ^„\0\0`ÙÀ€Uaö²Áàš’}‡Nä¾ÚÈƒÊÊ«y?ÒsùZûiµJÜì’yxKâƒ+Ì˜¯L¿¯\\g)€egÄWE\0\0\0,;X\0°òM:Å‹›i\Zëë6ï;t¼¬|%/¬7î‘Ëlÿì¤®Šõ×ËTüÕÉ/(‰…•Ä`Ù\\SªßÇ}A\Z\0\0,;j`À\n7â«ú*ø®½Ú²£õà±VvôJ‘k|ûøGáÆ=ú;Ò‹SÓ+•­Jv¶2¹\0\0\0l!€\0+Ùˆ¯êbÑá¸3“@±ïĞñ®ªFK–—ş’\0\0\0Pp`ÀŠ•½\n®)yûÄséH«‡\\õ¾CÇõî„Ä°\0\0\0€ÂB\0\0V¦ÙÑ«ƒÇ>\\ÍË‚Â{¤ˆa\0\0\0…ˆ\0\0¬@Ñ«ÊêÚ·DQiŒÖÍÀ.F\0\0\0à}°\0`¥™tŠ;ûÍèÕÁc®†’í‹Q¹®¶õÈûúË¨¿¾7°f\0\0\0<\0\0¬4‹ë=ƒkJö:,.¡Y´õu›Íšî½şí|54\0\0\0àe°\0`Eéì7£W«¼îÕ|Â{¶ìhÕ_^-zbX\0\0\0€—Ñ\0°bDıõòÒ_¶y¹¢W£#ÃOF†cCñ§ã±¡ş‰§ã?PY][\\\\úƒêÚ²òªe9ÉÆ<è¿#ïãN°3°Wâk†\0\0\0àM°\0`…ñUuöë/÷:¾¾ns>O >1íëêtÇŒ/üÃ*r¤É©ÖÔm®«oÊg0KšèóSÇ§‚k÷ı¡ÁÔÆšä=\0\0\0àA°\0`%P…Ûõ—áÆ=òÊÛ§Gz.Gz®dÄ¤–Dş®¼º:Î–•W©õ}y¨Û%ŸµïĞ‰ö3\'Õ—Ò€o$‹œ	†\0\0\0à5°\0`%è\rl×¥¯*«kw¶ÍÃ‡Æ\'Æo_o»ÕùM|Ö\nÁÙ‚N¼<•NËZ¸búèÈpWÇYy…÷ÈU¸Æ\n…›BõMÑ¾ngj!a$°µ!qƒá\0\0\0x\r,\0(x|5ÿVıe~¶¼İÙÖÕqvÎĞUE*V\ZV–:£¥©Ñ90â«\Zó•=öUÊùËû¸4ÿk¤çr4ÒÕ¼÷­--­®^Èì¿£.¤×¿=”ì›ï„\0\0\0,X\0Pğ¾ìÖï›÷¾åv©ØĞÀ¥óŸÄd|mj0”ì“?\0*O\rË«Æ™.;5èßxß’?u$+ştüZÛéh_÷¾CÇËÊ«\\º9òÖ–×º:Îª/{ıÛ[T\0\0\0€§À€Â–±x°iï›®~ÜíÎ¶km§ÍïxMò^CòF‰Kr\ZçŞdâj$°õ®¿Q‡±ôßùüÔÇû…›\\º¨-;ZõBÈ¨¿>÷k\0\0\0`—Ÿ&\0€Â5éßõ7ê/÷:áêÇ]:*#zJö½ÿuKâ‚­ˆO‘3Ñ¸!Ç\'oéoÆŸ·Ÿ9é¹ìÒu‹K¶¶¼¦¿ŒúëZ\0\0\0€§À€v3°Kg*mÙÑêŞâÁøÄøç§>6CH©Ø«“_´$.¸±mŸs[âŠßŒ‹]:ª»ãœK˜Ş÷pÍtá03&\0\0\0À`@¡\Zó•é\\¡àš’æ½o¹ôAñ‰ñ/?ı…Yô*”ì{uò‹µ©AW/Pß:ùYE*¦¿ÓÕqövg›Ÿ,.	7î™¾^\'8èßÈ\0\0\0\0¼ƒ\0\0ª^ÿvı~kËk.í<8;zÕ’¸àRâÕlò)&Ï„’}ú;×ÚN»´–P°Ä}_ˆ\0\0\0xEÜ  ™éWeåUîÕnÏØp°%qÁ\'å‡ÚP_ï¥ó§ä’××m¶û)•ëjå°£#ÃÎÔ–ˆNÎ{øªîûC#NUÜÔß¦âåÎğÚä Ûùk=òÕ<ò×Œ9e2êÌïË%T¤b5É{tãÈµLúŠû*\'bµû~3[Ğ‰—§†u¯•¦Få%—œŸè-²~6ª±ª†«ôøÂ?¯îDÕ¹¥Îè*ßÀAZq\'(÷ûÂ·†¦\Z\0ä,\0(Hfú•{Ñ«kí§£}İúËe‰^évŒVÛg\'ß>şQYy•İO©«oº}=½DQ¦p2‘SÁ‹¥’Y_$°5ê«Ï÷Ló9÷ãOG6%{Â‰[†¨1w„Ì BÁ@\\F…\\‹7\'®r’Ò•ò§LÅçî‘ù¥gò*ü¡zÍ˜´W¤bkSé(dvƒIÿJçª?_®šo›TdVzVŞ¬øpŒ¾Aäîxa¸jÎÚlÒzÒn*ROÀ\0`,\0(<“N±.Ò\\Sb®}³(\ZéVÑe£WúÔÕQûNÅ°ì~ÄúºÍú’åƒ²ˆMô¶/ñ1ÉÏôúÓ?¼-qeyv¾iíÕ¢×y!ÿÖ¨¿~S²§!qÃ#7È}hĞ·ñ‘¿f1—°T*»G…´‚N¼&yomjpC2ÊD=Ï],£T„Ö»8rø,ªUš\ZU‘Ê•Ô¿nß òğ”—ŠÔ;Sñ,Õ†…•­	\0ğ X\0Px¢şz=ëØÚòšŸ¿tşıeCò†‚,¯N~ÑVtDåÑÄ\\k?½óÀQ‹Ç7·q\\j¶üüÕÀës¦0”•W½4•,öddX-Qœig\'ØØ/³å–œW,Ú`rV³¿\\SR¹®njxŒ™Kgñ8™K-×<_OËåÏÅöxum°¸táŸ‰\rõÇŸÏ{§8Ai®¨#-–ŞÜ`C*Ê,İíÁ¹¤.¯£gáùîë¨oº7$£5©{7»İzs®×^ø¾0©xVÄÙ\ZÄ×&¥\r‰ö\0²C\0\0\nOÄ¿U¿ß²£Õ¸tş=9‘É†G2kdÎ³;ñM[Ñõåíëm¡p“ÅbXæšÄ%­E\ZñU],:læ2×”„ÂÍáÆİ³OïAÿh¤;ÒsY·°Z\Zé‘Ö £½R)~s¶slh@®Â¼™¦J;ä?†5æ+K‡ÏLÆ©¬®­\\W7U=­>¸¦ÔV.ÆèÈğ“‘a¹äØÃ™ºÏûP‘¬Rÿh(ÕçåÅ¡…h1]¬¬5u›§ŞÔ.¾—¥[ãOÇ¦şì¿3_hæ¾?tß	}Øíå5³szár`uƒÈİ!\røƒêÚââ’—Ê«¿F[iÏî‘˜´¼™ó‘OÖ†é¼Åpò+p\0Kœ\0\0\nŠLátrP¸q›F#İºôUĞ‰{*9H&<\rÉºØµöÓvÊ,n1y¦ÙÑ«æ½omÙÑ:_×¬¯Û,/ù™Kç?Ñíõ×¯M\r.{r‡-3z%­qàÈûóÍc+×Õî<pT.äöõ¶®³ê›ya=òÕ¤ÃFÏŠ£ÍîÍP¸y}]}îQÎ²©ù¼yˆ”?3L:ÔâÛ.CTzSÆ*5­sïâŞÀöùÊÒ)uõéèªÚ„!Ë»~*Î¥:·ÉI—\nVJçö÷uÏÎšŒø·ÊkC2º)Ùãñİ]ÙºAÔ__ÿü7Ó·ÆTößÉNç->{ètR\0 Ÿ`@¹ï›YınÜíÆG|ÛvZ¿oI\\ğZ\"ICâÆ o£Z¬{8ĞİqÎbû.(›=?¼xMOƒkJûp1yÁâ’GŞ¿tşT¤ç²úÎwİË^4º3°__‹LnåZ^!•ö—9pÛg\'Õ4Uº¦7°}[âŠ«§ªRræ]ÉtZnP}³á]óSÔ¼}td¸*¥.#’¥¦è„±²¶@èJg¸qO]¸ÉúNŠŠW†ÂM;¯ÓÉDşÜ³¯$®z3“è®¿Q\ZpvèJZoKKk~nù g*Ç­¿¯;\ZéÊhÃt¹±@ÜÈò‹¦€6f\0,X\0PHÌòíù ¶È<Mgx¶ì®ÌvôBÂ[ß,îä¶›]:!n‘Ó¾CÇãc*KÕÃzuò‹eŒè`ŠÄ-şZd(ÊÏùé/T+âßªJ›»tD[Í8õ9omymSãn—‚\Z;d–./™¥ß¾Ş&³t3ß$]uÈ¿Ñ;îÂ|ÑÉeébİ¿ò`¼İÙf®™Uw<‹BÉ¾WW½ëñUÉÃ$£$ŸZ×Ü´÷Í<ß ÎT›¼ä£¥\rïö\\1Ë¨î¾XtXò`\'Ô\0X@à?şëJZ\0\nÅ€ÿey©÷ÍûŞZ·áeëÑşÙ‰OLOÏ^M|tâl‡5Îø¤¯8æ[\'ï“‰Éñ\'\nÕ7Y9²LPåhò¦Ô}áÂ™»~Ø­\'‡­ïüYÌørã÷½×U›ËD.„å,ÏNæÒªêı_¼ıWK­UòRy (ø‡ïoéI©+ƒ¤Í;ŠŞĞa\\bØÙzô/Şú«õu›‹×”.×°”qøçÍcCı22Õ÷“N@-u¬HÅÜèÜGş™ÈcóŞ·l¶»ãœz£¶Ë[3Şõ7~[t@İİêbùÜşhë¶]ådş84 Ÿ“ÎTÀèû@CÀIV¦†–ıñ(\rx¥èµ§¾™è³<^ÙuPnê5ìXÆDµa:-kGkeu<iŸ<Æê÷oöH\0¼‰,\0($ƒ¾™y{]¸ÉúñÍ%û¼üá\r‰z7F9íôŒh‰—9é.ÁÔ‹#w2QÔï›÷¾•İ	‹K~Üz´ıÌIõeg`ÿ“¿Î{JcêT2™a†²\Z][ZZ£}İª¢ó#_ĞâštŠ{ÛÍT\\£iï›áÆ=Ş™jM¥ÈÛ×Ûnu~£³uTšI8yËíÅ•…K•`ËX3èÁ.–“‘—<vº;Îé¦<‹nvİ÷‡–1HîiÀŒMåTw¶]®ÕùÈF^ò¬èê8§fîü†=\0\0³À€BòÈ?=µS;FY?¾Î¹\rIO¯x’éMCâ†ÌvÔ—×ÚN<öAÇÔó(Qî¿p²­\'Šj‘Q.s¹õu›Õ§Ëaıó¿rÓ\\®ÕœCM±pãnİŒƒ¾›R=¶BW¯›K¢Ôj²e\\=º03Œ¥+Ü;S‹+ùjv%¾f©TµıeÆV;õTèêù¡>ÆºÖ~Z‡)¥sÛ‹ŞiI\\Èÿ-<é_,:lŞ#òkB\ZĞ•æ¶L-=ŞtÛvZ‡¥\r¿\n¾ûêäìQ\0Èà§	\0 PÈÿÖëÙ](Ülıøúïè)Ä†dÔûls\'{9y]\r=k‘™Ô˜µÉ¬™2³ár¯\"oÆŒ2’Œò3´tÚ‹®Mõ¬^¿ÏÈÉåôÚ‹Ş1gær†oÿHšİ›Ñ+M…±Ş>ñ‘Ù¤r!r9#¾*Ï|Ømn† ¶ìhıé{?ólôÊğç)W!×ÒØÏÓáÔVtÄ¼G¤åñrôJ…›ä‘6ÛğbÑáŒ•Â\0\0À€‚aşß|]½ëgÂ7›’=Ñ&-‰ú}:bb<ëCÉßFºÔûÒÔè‹ş˜sÅP}®ñD3lôÈW“çè†­ô+}-zRmåÜd*k†6v¶=xìƒü¢ÎZåºZ9a³:•\\N[Ñ‘9·P\\m&â«×Í ­ô¬4×ÎG=Ôä<÷:.ç\\3sÂ½şíıruùiÃ+×ô`9\r9iÀ\ZÒ†rÂŞy_·¡Šr\0\0L°\0 `˜;ÄY©÷”)XJøÆ#ä<7$£Ó§ãmÏ*IeáÒùOô: PêÅÕÇõtQæÛVfÚáÆİ3}‘Çi›\\ˆş8+[[SĞ\\Ç¤¿¾3°_)§—ÎÔÈaµæ2R©XfŒC.m•ÏÏÕª73S/Tß”‘°V(äœúŞÏÌ3W±W·cXª\rÍèÕÁcz?smNéT¬ãUV×š÷HFM4\0ÀjF\0\0\nf¦§S~j\\˜İE#İ:|³!- –iI\\Ğ[%>è¿c–ñZ¼HÏåh_÷ôĞ‰‡·^øWtzÑK–RdÎ©£ùŒk˜k!ÍU<YÛÙæ,#z%ÓÚ·O|äFè6oääúŞÏ2æç«6†5»fSóŞ·y¿P¯æ\Zù%}`ŞDrunÇ°dé6TÑ«‚¾G¦òï>4ï‘«E¯³Ş\0 À€ÂQ\0ÈúñûŸ…oœ©ı¨eŠœ	s!aWÇÙ¥Ã’Ÿ¿tş”şR¶˜\r°rO/šMçMÈÁóVÿÅ\\½e%q#6Ô¯ŞäRF-#z%\'&ÓÚÂ\rmhS1CÆàÕÃš½Úwèxîµä¼`ç£r-æ£Û½Ö]£Î_[Ñ+óÑ1,yš\0ÀjF\0\0\nƒŞĞ™Êã°~|½s\\ij´àö~ªIŞ\'gr¦.?u»³m‘·»ãœ½\n%û¹}XE*fıB«€îåc\\ùjôâ£t\nXÎ¢øÄxìá€zŸõBÔÙÑ«}‡¯€è•Ÿ8ò¾Ù×r±«­^µ½R5›\ntÕÛ|7rzÄ>K¨t)†%w®Y*~ç£+ z¥ï‘ƒÇ>Ôuî¤ó\\\0àM°\0 0Œ83k(¬g`Å†fö,¨õƒÚ¶Ä3qìZÛé/?ıe4Ò½À_‘ÿúù©»:ÎêïT¤b¯$®.òu––ıåNæŸzÎ6èß˜‡\nĞfîY„+kƒFkdÀ\ZñU}ØXywtFÈ¦3°õ¬“2W½‰ÖçÃy+ÃtÎ ÃºØe½uè–­+¬\rÓqŞwŞ×_öú·ëP;\0`Õ*¢	\0  èùYÄ–9¼ %qAf8ºâ¯\\”¼dYS·¹r]ù“£#ÃòŸtÌN_øîÉo³xPÿ¼ş¬ØĞ€­Ü™ˆ^k;íL-œ¹ï¹½œS\'şX)ßî<¿5‹±¤öSÓÓr9¥½RäÒbCı*aM­“:0yfÅ?ÊîúÍ°©4B!–l_y&ì<pT\'xÊU—:£\r‰V.ıü‘›×Üãr%5 \\—ş7†^ÿvsµ8\0`\"€\0…AÿãsF,Æ\n½æ+tHn+½:ùÅwİfQ§øÓñh_w´¯{á¿NŞÚ–¸²¤Ï2—ö÷uÛ\n`Õ…›T\0Ë™*¯r\\`ÉŒZ‡ŠêŒªL¹0×¢fQëJÑk3C½º¶ÕHÁX‘ûğóO>V±ÔÇ¾J½K‡…eÄWe&\"­°•ƒs<X¦®NÇ°zıÛå¹±ÈEÊ3×Øº´ÀV†elhàÓù¹áş²ò*y½T^YY]çêºÅ¦½oFz.«O—çUCòF.•õ\0\0…\0\0\0sñ²rûëŒÌªÛ‹OAò&™ÿËü°7°}‘›¯¯M\r6$nd‘+$ŸÄU\0H¦X¶êOKÿVV×ªâ}h2Qì^<·ÿ`‹…ıÍ‰nMz×ß¨{-¸¦¤ 7¤[$µNêóO>V_Fü[CÉ¾‚+B·H*½NnÜ³²£Wú2cC·¯OWåëì#9˜ãM=èß¨ã¼ëë6ÛMa“[øvg[_wFĞÊôàùG–œÀ–­.E²äÑª#€òˆXÙ^\0ÀÂ`@!Lü|3µÖ×Ùß°Lg`¹Q˜<ÿÖ¦_übÄWõ×?òÕ˜Õv´ÒÔè†T4Ç`AMòZ¥R¬­\"li5—mJö¸MĞû—UV×Z	ŒöG²_?˜Q‘zß¡nÄj=(cÔÍÀ.½+òJ¥Íôº|.•Û3ştÌüNpMiŞJï<pT±*91î¯½–cG}3¿šímİ(Ï±îsKİÅ5¶î¹,K-øµ~Û†÷\\k?:îLmm±Í!€\0«,\0(\0fFæ]vnÀ*wVNêGyjx[búrdÚ<æÌ\0¶UçkC*\Zu¦g’·¯·Ùš‡ê›óÀz¾|»Dsê»!¹´İ\02*R‡ÂMy$±¡tXAæÆƒ³*ñ«ERëëê+«ëÜNkÚûf4Ò¥âÈª¶Qá–¢›\\”^Û«Òë\\ı¸øÄx´¯ëAŸ®26\'•=$½,7«½ÜúÎû¿ùÕß©(Œ4…Ü}Y—·“§™z¶•~u»³­«ã¬:Ã9U¤bEÎÄ¤S<ç?	¨_%¿ıÕÏ›÷¾Õd/¦6ıH7«gKúIî+c!\0¬Z°\0 \0˜ÁëYæ:‘‚.€µ€t=&Çşœ§&y¯Ô?ª’J¢‘®G­Ìå ¡ú&U·KæŠ.MØ¬°ÒihÏ\"’Ñ%-’\ZôoÌgEj™iGz®H—-0]7IUV×JÕ…›ÜK\nÛyàè—ŸşR½ï\rl_yIXfÍ&é_÷ZR­×[d\Z‘Îºtş”Üt[ZZ]ª(/7õ¾C\'ÚÏœT_~Ø½Ô{dæf±½ò×™ªÒ•ÑbA\'.Ï·µ©ÁŠTlÎ4Õ_•Ú4ã¾/dîØÕq66Ô/k1 ¸¾®^Ÿü6tãa\0(°\0 \0¸º}ø“‘˜9i¡µ—$”êëõ¥¾MU‹ï²•ÊTnÒ…çÓ¥‹-í\\f(F!óv+SMsı`Mjieªoúg\n{ÿ¸õ¨{¹02\rîî8·@qŸ9Å\\{xúZÛiéß¦½oº|Q•ŒT:ä#_Íˆ¯j%UÂ2¦ë%Y\n»dnı¶ıôwl˜ÚíANogëQ7V†ÂM:0w‚Ò&Ù•sÒéWS7osî\'–±l°45Ú¼ñÂøšŒOyÕ8÷¶9WäÕëŸéâhº~Ö/ûĞÖlŞqü5k+óZ\0\0/ä§	\0 €¸‘`NæWjõh÷˜ë€dhí°õÍÁ5Ós?³Ş-wıú}¥ÅzY¯”Ù¯İpiñ`lhàËOyéü©ù¢W2o_›\ZT)\'\\ãç§>¾İÙæÆnÙ1Ö1wÒ,t“N±9Ş\\*}%wßoõóÙÑ«tµ»d´!y£%qáÕÉ/Ôë•ÄU£™Ûø ÿÎçŸ||­ı´\'™ÎKzv_Kg÷/:WQn–Ü#Dr;èúkêÖ:ù™ü¹¤ì0õ·ÂÉ[3·ÛC¹İ~Ÿçw\0À\"2°\0 \0,rC½¬\'0ê\réWY	°LŞt)w™ıZ	2¦W\Ze_¬çãÜ÷M\'qÈtÚJÖXlh ëõƒ½şínG7nw¶]k;=Gh#]›\Z”¶s‘¦Ê„J/’2r^âOÇåPÑ¾îÖw,o’šZ¢¨îÇAÿF\'qaeÜ#‘ÀV]İL›õüµøÄxÛ™“¯b&\ZNŞªIİ›³gÍcr\rú6Ê-l–vº}½Mh1‡Hß×[[^Ó#ù-Kìeú}Gv—GYK¶£Nnùm‰+r+}Ø­º[Å°Ş>ş¿&\0\0¶\0…¤xı¥Uñ‰éÍ¹H¿Ê2î`$aEz¬íUW?“ˆdÖ«Ê*^3}òáf+Ç”	ÿLƒ¤–PÚL¿r#ºáLÕ÷Éˆ^©}*ß˜üµL¹Ó…Ìæ)1&?¶)Ù³+ñõ[ñz%qÕŒğ>è¿#“óØĞ€İSÕw‚f¨¢p™éWÁ5%;[Ú~|KG˜Ñ+éÍ–Äé\\é»Å“Ÿ‘Ÿ<0yF†„™|{8ğ›_ıõ.6— šƒ‘Ì(Ûª-¬sÔM§Ú-÷‡¡4£¾S¤\rõ~¶SüC\0¬^°\0 T®«³~Ì¶èÂb¬M\rêyr¤ç²­U3¡pÓÌ*B«,syZ¸q·• B4Ò¥§Á5É%À2Ó¯¬o^æÌªN]‘Š©EdKÚæ¯È™Ø”ìy#şëÙ‹¤ì8Ìô½ùöz+,2tuúÕÖ–×ì&4©è•ù“R+à²»‘LiHÎÔ›‹?w#Lissü/†ğ²íÕ¸¬œ]’òÔğ®É¯g6=—s_rû ¿Ï<>¿t\0`Õ\"€\0^çjw{“gÍŒk˜¹H¹öÙâ¾¸L¯)³DJ&ÀV<Fûf¶ó[Rú•œ‰«éWÑ+•²¤Ğ•I-’ÚøF\'˜Xp˜µÃóvã»ÊŒ–n²-5™Ñ+éé\Zé ì¶öÓ\Z7Ì\"éâKç?±[ËÉêQı¤SœûhÉ]Ü´u(¹ÅÌd®km§¹)ä¼O˜gñqçùåŸ\0€Õ†\0\0xİ˜“¯\0{“g+”ìÓ3Ş§j]ı^W­ÊÑ £Îˆ1W)æÂÌ°XRò‹YŸ>l;º‘±·Ú+‰«2©Î1º!j’÷2_~ú‹¥nk83„7âüBW”×ÚO›Ñ+é”%¥ş-@­05×Áµ9i·eÌ[{Iù•YG»æ£CØªâ›ÅG¢ù(È%/Éƒş;f}=~İ\0ÀjF\0\0V5v‰²¢È™Ğ“çÑ‘áh¤ÛÊa+×Õê9¿­,3f´¥¥5÷f”o_|ß˜¯LG¯¬®µ»Ã¦LzÍ½ÕZ6%{l¼<5œÃjÿì¤õ[ÉbFÌryn°íhµÛ¿fªã®É¯í®,ËèâôÇYİz2ë\'­/,\rQì‹E‡-Æ°ä¦Ë=†%·•YEËâ]\0(D°\0`U‹=ì§¬0WŞu!	+îs¯„5é›1#+1æ¤´&µ„˜AßLHÎJ(m¾IoF2ˆ©bÕŸØıˆB/V1Øì®w3û÷•ÄU7–•I›ëàº:ÎÚÊ³s¦¶#Ô·¶Úft‘Ñú•Ê­§Ÿò¹Xt¸7°İÖÁ¥kÌÒZKa©\ZgºÙåÚY?\0«,\0\0ìLwõT-Ú×mk®k–\r2#>ÙÑçùEL¹Ğ3Ò _ÚúA#ªo¶Øf¬A:%÷½Õæëq3†%Şİq.ÇcšÃ¦Ü)ìbÕn6EÚÙj¸—•S“¼§Óñ§ã¹÷¯É½mF—êÀ;ïëı\"âN°×¿ı«¢ws)Î¥9{;^:J^‹IW|ĞçóO>6W‰ºt#\0\n,\0\0ì0\'Ò¶••WUV×êˆ@SÊ»şÆ™ùsØB¬ô®‹º|ûR¢Wc¾2½*TßdqsºÑ‘a½¸L&½»_»×ãå©ám‰+úË®³9t—I»~_è›*˜ñV+ƒM‰OŒßêüFévP£!qÃÜcÔì ™ÛŒfWáÎÖÉT®«=xìC3SnÏÎÀş¯‚ïÊŸ9.^Ã’füÍ¯şÎŒBfÜ¿ò_~úKy™? Í6#\0€\"š\0\0\0;3ÒdßwİªDºÌÁv8jå°áÆ=×èúCY¯†ËˆYZ?8¾YR\"Ì#_~o1ºáL¥ç˜§äö¤WºcÄW¥ËµŸ9ùö‰²Ç™íYè«¥¬/VUÛò2Ùçvÿ9\rÉıºƒ,k…›U£ZE¸˜2^æõNØ+»V¹®VÆmWÇY³²˜Z¶uêƒøÚä`MêŒÉ,\Z\\ÚğÀäiCh&=(Ÿ%¯àš’Êuuú\'cCıºs5•{e«B?\0  ‘\0€5:º$Ó0[Ûšñ3…jÉ3c™’•˜ÑèÈ°ÎYêÌÖLÏ±Pézªß¸‘‡Nß–¸¢Lä®µÎî8Ò˜Y·§×˜ÊPØæúP3@Ù¼‘Ÿ›ÚLÂ²X	Ë\\Eh¶ØÌT¦?>°x™Áâ’şä½¿™½Ş3îïûCéœ¬¢wåõ]`÷ ãR³A[^I\\ÕKnõsR\r{õš½R;B½\0(°\0\0°ÆÌB2³irQV^¥w\n{ì«ó•ew½%\\pM‰•šSæ2É¥æ…=òOO×í¦çÜ5Ú<?Ñ\r=9×3óHÏå,Š%Í.<_Ğ7‚î_çù0MbC:~”‡ô«9ÇR¿¥=FEº]d\0ËÌÒ\Z´·Ñ|Úì;tü\'ïıMóŞ·æ¼1åùño½xílğß´½³¤`–<L‘ËcÍimjPn«W\'¿°»¿$\0  ±„\0\0kdF-ó.5}ĞGæÛV6_«7Eû¦§Íƒ¾›RK®Z=â«Ò‘¯P¸ÙJÍ©¬Ë·Ë™¨…–Õô«ŒSÚŒæ­ßU1,½Ğ¬«ãìKå•‹¯\\>{·µ‚`á‹ûšYRùë_K™s°µi¦Ü†•ÕµªNy:ä—XìÉ¨å™é”¥‰q‹õã´²òª¦½oÊK`ªòWl®l¯Ç¾JyEœ­N \Z&wÚ(pÀ¢ü§–Ä…ÉÄU¹^$jQ³¼‘Vªôq¨x\0˜\0\0¬jÁ5¥4‚]¡dß£Àôìıöõ¶}‡[8f}³NÏ‰ø·f±íš.ÒäXÊˆÉº|{FtÃb\0ËLÏ©IŞ+r&òİï¾\Z½NSõ×bbXrÎíŸ4w[{%qµĞïİÅv”ıÏÂ¸¥©Ñ|.+“±¤ÃFÒSÒe¶Ò¥}T×Çà˜¯l1Q›µ©ÁûÎt}±h_—İ3T®«UµüÔzáı}òçœ‹(U0+êÔ;Ïâø³¤=¥ûj\0–ú\0àm®Ör¶˜%”ìëõoWéNÑH×Î‰£¹§HÈdšºÔzÏ&½•XzA¢ı³,ßîL¥ƒ¹1—+=GS;â™1¬ØĞ@óŞ·æ\0ñ‰ñÛ×Ûnu~c–şÙ–¸Rèk¦Ìş­q\'@™ÿ\n÷5©{:lô ÿN™¥°‘9ş¥İÀ’3¹éìRï»;Î¹\ZÀÒä¹!—¬>K:B•¬\Zœ«j•zFE}õ:˜%7£ôu¬\0\0¹#€\0…dbbÌ½ƒ/µ(/æJõõú¶;S%Šm¥HÔÕ7é\0MÔ_¿-±„Ç £^²g%ı*—òíÎT²†z\\Sb±\0–>¥ _®Ùò+‰«#¾*}·¯·I¯É\0X_·¹¸¸Dş”¦{22<Õ€}ÑHWÆü¿%q¡Ğ:SñışÕµÖû×Y\0¥¹ŠPúÎVØ¨²ºÎ¼/“””	=KS»ä\'†5sÎëjå¥ÖQª`VìáÀ|™YéšY¾­j™¡œvMêü™çìH\0ÀŠA\0\0\nIÌê¶Só…#•„¥ŞÛJ‘…›‚kJT¼ã¾/´ÍYB…x]¾İYÜ¢¶Ê¥|»cdèT®«sãîX›\\®®—™ùÉ3ı:Kºìöõ6y½0*±;ñÍÊ¨Wm>I,(Í§_ş»Xz¶\"S—öÀ^õôç2°œÅ¶Õ¦d\n`©\'L¨¾ÙJX‹<}	z™al¨Î_UrÎ÷PçT$+”ê#\'\0°ô_Ç\0\0Ï“ÉmÖ{Ï½Ì0-nï)Òh|5fFŒLÅU}—â)2©³R	(nÖ«åº¹ŠjÒ)ÖsİÊêZ+Köt)¢ìj¥ët°JwÒsÊeÏ-‰©Xo`»¾Ò…5$o„·VLZÊ˜3ó°²¸D46Ô¯ï¯ei+y\\¨\'‰İ¦®ã÷ùWÔãK\Z““éê8«*U-/s™áÂ5³T$+Hoş°)ÙC½v\0À\"À€PêŒª9á\"M/=`™ÓÎBõ×ßõ7Î›SæsT9™8…“·de}>l¦HDz®X	`mÙÑj®\"\\›XT\0KŸ†c)ı*\ZéÎ¥VºYÁ½¸ØÚ±¡åLÏ™s\0Ô¤îÉ ”š/ŒU‘ŠÉÏÈğ[axm·˜~åXÒnËõÖïmE¥t…»ÒÙ·Æµ$.|Uô®zûz[åºÚ</$\\XFÍ¬ş¾îh¤+#-Kî‹ˆ«¼6$£r¿ä¿®\0 àÀ€LÅ_ú©RÅkJ2¦…>yîì_äTP~øf`—Ì ^I^µ»EU†RM\Zé¹¼³ÕB)w™£êt¹tQö©’á/t×ß¨ß×Ù(ß~×¨•NŞÊåP$™·Ær82È\0Ø–¸\"/•hŞ_k“ƒ¥ÎèJM<Ñ¡ğ—,®4”Ë•a—ŒúgÆÛzK‡­¬®ÍbM¢WWåñ¥¾¼Ö~º²ºÎ››r¨e†M{ß”FëtËó0#’•NÈò‡ä™Ù¸A\0°\0?M\0\0ŞgNØ¬Ç°Ì:D…Ã\ZñUµ½3;z\\“®Ÿ­^³³Bäª¯^ëì·{2fpÇÜ /º{Ü	ê\n%øÊt\ZZ¨¾)÷Œ~Ñgë+R±,Ö`š[ÔÛ+ÜcN‰½¶OZ)”ì“É¹~eQù¾€¸ñ‰?Ù¿ÂM÷dÄZÔÌC4ïÚ”ìÑxãOÇ¿üôf˜Ïƒäù³¥¥õíã½}â£-;Zƒk»ıå¹}±è°¼–Ô\0€U…,\0(\0é¬™‰Ó°İ…9æ,bÌ)3—É™öÈäÇ\\®µ¾ns¸q÷œ£‘îş¾n3®õ×O:Å-‰¶Â¡dŸÎ¸}½MmÚ•#9ˆ.õÕ¿pÏ2]JÜ±–~uÅœ?g‰0\nı×”ZdpxG¥EvÎóûå\n`åah-²hš&Ï«1ßa¤V1¬Ö#ï¯·×ì.©\\W»óÀQyÉ¸»ãœÙ¹|5mEGÂÉ[\r‰lV\0È@\0\03ÏÅú¿±?·\rVÁşÓ÷¤SÜØ¯§eåU} ¯pã9×î…ÂMûÿÉ{cNöîûCó°dö¥wèK\'.Eºs?¦\\—.|.g+W½ğÏëıƒkJBõÍ¹Ÿ€ùeW¾}±—#‹ÃÁƒ,f<Y1ho¼­¯«Ïå!óêäzÍìTë—¶ò=ó@Ïò–uFĞ-âßÚVtdIEÁ\0\0«,\0(\0fV”ı%„Õ3Kç­zîy½íúäËÊ«Ş>ñÑbÒTœkgëÌ^÷ı!9”µé™±Šğ®¥Y¥YªÙ,Ğ>Ûˆ¯J/æ\n…›s/Â•cùvå…A·™éŠÈ¿<<RãÌ#2bXâÒùSòŠOŒÊ%È³Zı{ƒ™\\,Ï®‹E‡¿ì¦‹\0\Z,\0(\0¥©Ñ 3=-Ï(kaÂ_\\¢§\rš%§ñoÕ_xçı%k¶´´î;t\\Ùëßn«ÊSÃzbíë¶|4Wš+g{nı`½WÊ·»$]®\nßÈ›e\\YæÍÊe³cX‘ËŸòqa¥%®¯Ûü“÷ş&½ß…±ª]ìíEï¸õ\0\nX\0Pô*ÂØP¿õƒëUiš¥KM	™ÿd±0-Ü¸§yï[s0Gf¡(³€TÖÊÊ«trÙ#_Í³u\0KşJ(çX¹—o\nÛ%ù³Ì_S1,½fYİ°_~úËKçO¹±w­{T•w3V~+µ¡²;\0À!€\0…Â¬rb}BbÎ\n®ìˆœ°>gµËUvÇiÚû¦ÎD[80´$’Q=w«ó+Ç7Î,«ôÍ½á £®f)ı*×òí\0ÜSäL´$.ÈK?p•Šuêãîs´¢pöÊnµœ\0€\0\03áÅúÂ3€5èßXX-c–¬2Wf¡iï›úı]£­Y¥N‹ˆ?·R_Ù,Ç>ß*Âû¾™òXfÙ¬¬™g{ùv\0³å^ÁM6&Ï˜&Êc§«ãìo~õw…•µ¥¥õà±ôrÂ¸¼XtØÖ¿+\0\0\n,\0(æ„äAŸİƒW®«Õó„ÂÊÀ’ùŒ>áõu›sÜ?>½e¡í`æ+El¬\"—„%U=öUÎÔM:Å:°UY]›ûfúïè©¯ÌÙŞ«“ÛI@VVæ–¦F_ü\"#KEÏû«ŸĞ6…SÅİ?4cXW¯S\0V3X\0PdN¢ë»Qš7Nê™3 âYf”¹°.k5ÏB`ËIÇéø£	ÊÅ&#©jv²˜¹;¡¥ô«™¸›YgÇƒ˜ß./3hâ’e|@ée¹Ş\'÷éñ_7$odôˆ<‚.?õ?ÿñ?]k?\ZğøUT®«5cXòXîìç.€U‹\0\0v¡ÖÌJ´…÷¶ó}ª2Ã±©©\\WçÆ<Ùútwœ³pÀp“Ô™«g÷`]ÎåÛã3+Í`\\vr_$µ°İˆ`ÅÈCuÿ1gù#ìº^^î&\\«NUäL4$nÌÆŠ?¿}½íóO>şí¯~îñHVFë¾?dk}7\0 àÀ€‚ñü*BËIX¡úf=Cˆú\n#€eÖ)·½roJöé	d4Òe¥ ²Nšó•™+›2–Uæ>Ó6…“·r<Z¹ãJ€Ãb@Á¥±ú]`÷Å¢ÃíEïœ	ş»sÁ+ï¯^—©ø\n.ëc1ÎşƒêÚe¿3¹ÏâxûãCwƒG*Œõfü¿·$.èÍ@Ì>Ò‘¬KçOE#İH•ëjw˜©éŞØN¢%\0¬NE4\0\n3€Õé¶²I—U\n7«P…Š€ä˜h“f Í\0–]›’=½şt½ùøÓñh_Wî\'nÜ­CKÿV™ª÷æ¾„V–UÊüV¿·»~P&Ï¶/•W©p‰§¶*“iv$°õ®¿1cé™|™2úœûNè¦³Kîµ†Ä\rïßqYô¯­C—è÷ÒÅËÒVyHî›`²Hn^yÉã]ä}_(#ršNìí¹¬)¡ú&UR0÷òy¶ÈS~ëEûºÕís3°K?ñ\0\0«X\0P0JS£zz#ÿo}[t3ØaníçM2ûÒ•¬Ô)w›ú¹İÙ–ûÍì*sïÈˆëÌ‡\ZûfÇÕòíOì8tSx§J‘tÊWÁw{ıÛ_xJ|5‹Ø½2òJÜˆ.UV»²¶w©Ïãî³–¦j†ùò°=‚üÙ–¸òÆä¯w\'¾13CMòûåZÛi–é¹ì…í÷:1“&ì¯gGB\0X…ÈÀ€B\"óÇ]Ïæ]vÓÒÿŞ^]›ZÏ\"3j\'a©l&eKK«a7Bæ’Qt“F~Ğ\'Ç=E]}“JŠ;ÁAÿÆšä½_•×¥7U4òV²c½|»K9&f&—†î]ãÍg·ª&Óo]d->1{~íXÄ¿UÎüÕÉ/VÌ&W:›#y¹Êœ™“àšR[‡Õ±¡<Ô¿7Éã¢Æ¹ç$.È£CŞìœ,çù´,¹ÅÔïˆåÊÌ’1°µåµ®³Ó¿ıõ\r‰ü_\0¬*°\0 Ô¤îİt¦gÅÖW:S‘ KçO©÷½í2—öf;ÈDK×)—i•Åvp5\"”ê»ïLgEz®äÀ’×ëûdş)ÓÑçÊ·×{«|ût«¦&Œ\0G_î ˜1ËµÄLû.°ÛÌƒS;È+cÚ/Ííëêî8§Gİc_åÅ¢Ã…ÃªHÅt6¹ÆÜ£¨Ïºx³Šˆ-×*Q}QÎTU&[‡\rõ«7y¨?÷¯•©HÖ6çŠ4l:’å™Wj>GåiĞ3=¤Cáf¹é¬TÙ[Âo¨­·:¿‰?MgG}õ\r,\0X]`@!Q«U‚ZEhkr¨È[O§½œ„õfµcÓŞ7-Y‡¤©İ˜(–úGUšC¤çòÎÖ£9vŸÌ¢ËÕ~Šúë_I\\5·eå¼ÿ İòí:ºáÆ0—˜É¸İ¤æÙËAºÀŒ^É¿õ÷çìhù¦\nlİîl»ÖvZ}Sîî+E¯y6v¼¸ÿ¹œ‰¾ÅöÛŠQVV×ª\0VÜ	øªòîÑ3[WäLøT8&—gÎ¤S|ß\Zôm”Á“‘E%·›<ÃåÉ³˜\'¹4©¼6%{ä€ü5ó¥e9S…ü\"Ï2³¤_Báæºú¦<¤eeÔj\\–a\0\0XFÔÀ€c.ã2ã¶˜ñ ÎÀ~¶€ÊPïí¦_9Æ¢§RgÔ“7Ã@VºoËV³¿ìnËèFùv3º1hu‰Yå³êdî½ŒƒÓ¼k¤ûà…aÊ--­oŸøH×÷‘ƒx¿İÖ&gb%±!k[ì™a£9S„\\5â«Ò7W¥½-cûõû,b»“N±Œ·³Á#ÊSqv°é±¯2âßz±èğWEï.¾Ñä&­IŞS¥²äÕ’¸ ·ÿ|§{8ĞÕqVÌºİÙævµ,³V£şE\0\0X%`@y®øõ6ëÇ—)·(ÊtÈki5aÓ_ş¸õ¨Åƒ›“m—RÏ¬w_‘feNçr`Ikè¹è†dÔâ¢6İ¶O¬Îuõ¸U:Ë28¯½nvÁ¾CÇùw+×Õî;tBÙëß^¸5ªÍHGF¯\\Ô,k\0Ë¼¹,f`™Ïœ¥&©]ÌUÃá¤6\nXê–¦Få©Õ’¸p`òÌ[ñÚø&œ¼5g0K×ÚNÿöW?oÿì¤Åòg³os3ÔËÿ\0ÀªB\0\0\nL‘3¡ƒ 2apc°Óˆ\nÉDÚS“„ÎÀ~=±—™Lî«äLfcº´Ò-£û¢‘îXV^5;$ıÍœ—ó<—~•ê³Øz©”´€ÅÍ4Í˜¹ˆ/ŸƒÓLÒY|ôjº‘ÃMÍ{ß2o½Â}Fé.Ör,.Ñ‘£ûşPwlŒúl.Îó™³¤ yo`û•Àk\\Ê¨“»@F‘z™±}_ä’W«3³LQ™Y’ÑÙµç£}İ_~úKyYÌ¿{î2Ÿí„°\\ÕĞ\0\0Ë÷ÿ\0€BJöéu¿İÙf1àÙô V&?z³§«E¯¿ÿµªJßõ7ê<™˜-5@°´Édr0İw·çrî“a³ôşôwväº-cº¾x¤K½/MÊ¬ÕbT¤bÑgïûïØ\n˜Áı\'Wó9hÍ•­28y?›®ÜÑ\Zé¹l5+ĞjîÒÅ*Ğ{8`±T_¨¾Iß¤Ò>›’yªtfnî\n7[<²^E»¤ˆ¹<	Íø¦Œ·­-¯ÉàÉhç&çMõXëê8g¶[Ğ‰oK\\ÉñÌÓ™Y©¾Óç$Ò·Û}_(#L>ñóO>–_%vË:ÏWCãÿ\0`U!\0\nÏÚÔ Npˆöu»QsD¦:¯G&	‹ç9ßa6™İìÒ_î<pÔîîWS[ÂuëÉ¤{é>=YµÒ}¡úÌu]Î!¡h_—®-m7ıÊy>ÓämæhèeĞæ¹>™Ø’õà—˜ÁÇÂ-ñcv±ÅJgË•dg~Vî›{j±¡}—->ıjĞ¿Ñ|†ê›~úŞÏä‰=_”p}İæƒÇ>Èh:9ˆÅö©IŞkI\\x+şOògF)ú®³áõÜ—ê÷¬\"€U…\0\0¤†äÌöáİçÜøˆGŞ×ËOû*—7†5â«2«·¨½Ûì~D´¯kfN˜ìsõrÌÌ‘»=¹¦B¤wæ2&ÕV6¶¿İÙæ^k”§†õ²#çeÅ––™èO>—àõ¶›+[sœæßômt\nSMj&e¯¿¯ÛÖaÕ¾ê½4¸İ(Ì|äƒtn‘ÜYË»~PÂ7ı»ÌÑ’~P/\"Ámß¡ãæĞ2×bÛ¢ÖG¿1ùëW\'¿0ÃX‘Ë.ı’\0¬6°\0  É<AÏôš#»dªvğØ‡úËeŒaÉì±­èH.Õ…£ß(GeN¿İ`±²¡™reîÒ•ØĞ€®½-§š‘Ra…^¡©–˜Y´f€ã®¿1ãsÄWeËvæ¶±€¹bÜW¨+¤dÌÌd‰ZQšÃÛå¸Çì\\»«áÌ{‘k–#­f¨tIOBùá‘¢èŞ&³kSƒoLşÚÜqµ«ã¬Û»\0VX\0P¨ò„5µ3ÚÌé±¯²­èHëæö¶›-™Û›a5[ÒõÔõƒn„lLª²şèÜcXáÆ=:]nöŠÂ¥r¯|»9ÅÕïÍÜ·Ü™!<n‡\\3¶ÅÜ²£5÷òùÁg+¤\nzyÔ†Ôt¡³øÓñÜ7+ĞÖ×m6·Iu;F)]ğ\\úU}³Åg&^äše]KŞ™\nH-õC÷:anáçj\nÛ¶Ä•<ü’\0¬*°\0 Pe$a¹´my¸q9M’c[Ñ‘Ş@>gM:Å‹›é*ze« ´É\\1—ŸÊĞæÔ.’ó*BçYmét$+·öqµ|»öÜ3{Ñ\rçù$¬¸¼Rôš«ıx3°ë±¯ROsAP3]Üg³‹›ŸQZ_\ng>‚Ìèäu¦²EÊ§YK^y+…åü÷:13zı»\\ğ6$n¸”ˆ\0X`@3ƒ ]®ıû¶Ì”ûÀÜ½×¿½½èWÓCîú¿\n¾k~ÄT)bW¢Wñ‰qtâ’Ñ<ôÌëtÒƒş;¹¯¯Qµ¥s¯0íjùvóòÍJöW:S‹øÌ4÷â­rdsçµtz‹Õñ©×™¢òÔ°¼°ØÅò(Ğ¥îãNğjàu—.Á,•ci³ÙÌ<ÇE>sÌ¢şY¯…›Ì6·ÿ5ÂLÄ‹\r\r8\0\0ä€\0\003	ëAÿ+Õ”æ›1<ö¡.Íã<+‰%/ëa¬¨¿ş«¢wov™[¤Ë|5Ds!z¥f’:d³)ÙãŞşƒ³»oæŒ°¬ç¥ÒA¹W˜vµ|û|—owaFšI¯ÿ¹0“Åj¦î;t<÷ÅƒÓSı‰1õ¦<UØeƒt\04½ŠĞj7ï}KçÉ³ÈrNrL0\n®)±[wÏŒYË°ÈgÎ˜Sf>“³şt¹áµ¾#asÇŸY?şâwo\0¬\0°\0 °µ$.è÷×ÚOÛÍd1ÉäüíãéÄå‘¯æbÑá¯ŠŞ½ëoÌq!Úgğ\\ğßfl%­ï¼¿óÀQ—®KZìVç7ÓŸåÄÃ‰[ù›Ş\'ûÌRî¹÷İ#ïçx„Œº<®Ö3—Må¿ËlÛp“9VePÙ-–$cÕšØİSwA0/è§“£´[i*F9QŠúëíÆ°ähfĞS?¹ïìi2W\r/>Llk±¤\\‹¹ÖU.Ö½Ê†n<CİY/\0ğ>X\0PØÖ¦õò“øÓñ®³®~œLäŞ>ñQÆ?şË´êf`×WEï¶½#{™ø-r:¤\n$ËôIşn[Ñ‘ˆ«™uåL%^ıô½ŸYÜ·~¶km§—%ıJ¢î»ÜSTrŸc›$··b”™­º±‡Ö‹¸ÉX5ƒJ2D¯^Ï½âA#cU\'£N\\Ìv(w\n;Ëìâô>	V‹eìÁ\'O+Û¤ªş5£WÍ{ß²»xĞÜ·Á\\JœO[ZZÍ	¥é\\*%æÆauŠ¢^†\0X%Šh\0(tÛ’WùkTèçöõ6³Ä‰*×Õ<öL³»:Îeû*uAk57+uFõ{s&3â«ÊˆUecÓŞ7íf=Ì\Z0«_å3ıJ	%ûô2´ÛmvçÉY0[ÃÕõƒÊ¦d^¥%Ãéà1ËãV8ôEÉg=öiHŞÈúÒ¢şúï»Í¡k7z•ş#Ê“Ÿrlyëbõt²xpu¿\\:J}ùÈWóUğİm‰+Y÷¯!#T=ˆì¶‰™ŒfÖ1Ì³}‡NŒüB¥û¥cXÃ»ßX_µj†_²ô<×)Šno\0ğ\Z2°\0 àÉÿÄ7$ffAmŸto!¡6Uëy-s‘y LÕK¦1ú½¼æ‹^×”lÙÑú“÷şfß¡ãnG¯¦¦¾ŸÌÌ$7òœ~åÌÊBZŞ\"ÇéeŒº|»ûÑ+g*PçP<è¿ãÆNš2Ì!*cReüÉ€\\|¶ü¤*Í&7£4›İè•clØtâ…^Ku±¹Yõ:}Déé£‹E‡—Z×I­†ÎHDjŞû–õşÍH¿ZÒf7áH•ŠÓÅ°äÂ­×4”¾Ğ”_Vé+)E\0°Tÿø¯+i\0(t•©¡Gş\Z5õJ&&Gb~Ôğã<|®LHBõM[w¼V^¹¾xMéèŸ†åÓ³;NxÛm»¾zèÄ´U•‡“ïî8÷}ïu=34«‰åõ7±/9àY½—ÖÕ7-×(ºÖş›\'Ï\nKÿ8ÑŸ-ğüNBÇ\ZFGbnä I“Ê\0{0pGÎI_±|èÀ+#¾ªQEú[¾Ì-ÿän’ÿ*?Öçoê,Ú/oäoÍLş×”üÅÛµµ¥Õî©F#İwº§Çamò_ôn“{_‡	ÌÚF¹ß ê„ÊBijT§áüqh £…§_u¼şğı-İ¿ÒwrOÉ‡ûş,é¬IË0›ıåÇ†ı¾÷7töŞ\r4f”ŞÛó¿ıïÖOU´ö_ô]öJòê’bR1ÿ:İÑ56âA%/•ÿğåÆïÿ­jº¤Hv}ÅòeÎ[¼I§øÛÀıd¯Zú7‰»=Wt«!qC\'ù\0V–À\nÑ’¸Ğ^ôJ‰öußîlÛÒÒšŸ—¨\"Öûœãé*àCL\'õO<—©šŞlË˜pÖ‹Ke2#¯õuõ2ùti{ÁL-<k¶Şru\\Mò^©z}e¤çòÎÖ£ùo\rg*1DO×¦ó¶6\'”ì»ëoT+Oå¢‘n7JÉà\\_·ùÛöÓÑ¾çÊ0İ÷‡î;¡¥æ£‡ê›~l»ª·rûúL\r²pòÖÊx4©ø—Š¼È0ëî8g}QŒ™š÷~véü\'fÿÊ=ñm8[Àôièÿ4é›‹3¨êZnô¯™f¸Ôô«ô%$õX}Ğßge©øÔ’ğ¿üô:û2âßzßjHŞØŒf—”:{¥­<Öl-lF¦k8[ÀjC\0\0V™µ$.\\	¼¦¾¼ÖvZf&®Ãš“\nK¹Zv=wñ‰ñ¶ÏNê/eª¶¼kµB©¾^ßt%¬HÏå¼EMfùöü¬Ô¶%®\\,:¬ŞÛvº¦n³!<–¼ÿ ÿ\\iFk	=Uß$½ãÒmeF7df¾Öjòhúªè]õ¾«ãì¦ÆİÖÃC2fTÿÎ®Í§,fqœôlóŞ7]ê_yìèr]ÎTúÕR`Æk¢‘.[q@ùMñÓ÷~Övæ¤n7µÒö»@|mr°&uo‘í_UÔ_ßÊ(Ü¾eG«­gš¹Mj:œ\0Xe`ÀÊQ“¼òõéÕ:mŸ<xìC™œĞ2ÌtƒŠTÌ¬ ¶,Â‰[3¥Ü¯·-K\0+ÏåÛ3¦åf†NWÇÙºôYëë6ËK>¥?Òíë^dÕ­ÊêÚpãºp“«uÙ®µŸÖï—}LÚ•®Ó—¼¡yûg\'ß>ş‘Kı{ğØæØĞ€ÜGÒ¹³Ó?ç\\S\n7oÙÑêêÓR¶>ğò¸Îâ ’QU?öp@fk@‹Kû »ãœ™—\Zw‚Ó)ŠÏÎÙy>ˆ¦Œ9eªÜáœ\r›±hò¹M*\0Àƒ`ÀŠÒ’¸0â«R«câOÇ/ÿäà±—eIšg]:Jÿ~Ğ‰ïJ|í_Æ¡ätäQ-åËsê\\şË·Ï·zlvÒ”iÿ––é¬iíØĞ€\\ş¨±ÜU%Êô;oiŒ23ŸI-É­æ”7…·¢¾z•›#WêÆBBMzM_—Ua¬é½ö&ÆäîĞÊêÚ©UÌ›óåFºõúPyìd½f¹&uOG”¤\ríÖ˜—ÙÔ¸[;g­}¢Z|•wë;ÉÆ\'Æ—1Î\0ğX\0°Ò¼:ùÅWÁwU,@fk_~úbXÚµöÓæÜl×ä×Ùˆ]°T,#ï¬+úı¦dOş/_í¤y3°K}ÙöÙÉŸ¾÷³üZ•“µ¼½\Z03_VXúÕ³ÿãœhI\\ĞkEåzP]ëöZãÊuµ^HAÎØğ4ëÇ<(ty)y”Ù9S¡Û}‡Ëaû#İr|T]<•ÎfıÄœ©Ğ¶³/Ëc\n\0°ìØ…\0V\Z¿“XŸúÃü›’Sµ‹ÇŸüéßßz¹áÇÀjÿG™u^øL)ÓéEîò–¥Î¨ÚÿKŞÄ„÷äg+F5»şöÙâµµ©Áåª±“¦Ú?oÚ¿\Z†e|b¼ı³“OF¦w£“öÿQ²wIGğø.„æ w|3)<ÒÅ?|¹±ä¥òß¿_ÿöuÿJK6\':r9`ÒĞmøäOÃnl8+Ÿu^–0½ûAhsEeÍÔ7Kä·Éœ?\\S\"?_ß¸gËÖWÕ7Y|I3şîìÕMÊÓ;?Û¤\0<…,\0XÊSÃ»&¿ÖÉäa9SÑ+³‚r(Ùçµ(\rÉéÍİ+î-°Êp×H¿ZŞ61Ê •ş²»BÊ›®µÖy.*m_¬\\İ#ßt¸-şt¼ıÌÉ·O|´²ŸK—Îb®YŞ=ùM\'nİõ7ê\rg]]q¬7åhr{©âqÁ5¥yKp“ÛD§_…“·<’9\0È3?M\0\0+ÒÚÔ YfEÅ°âã«³5fG¯²®Aã\rÉ¨Î)˜³{£g×rËØ2)İ5ùµyb:	h¥’aiöõîÄ7EÎÄÊ¾äİ“ßèèÃèÈğÊ~.Iÿš[^¾:ùEîı+GØ–˜	:·}v2ÿ\r¨Şæ-zõ ÿù˜ZÙA^\0À`ÀŠ•¦Q1¬EnËµ’twœó~ôJÍKõÆdÒMÑHw>T>E	ùôe¬M\r¾’¸ª¿ìê8›ÏX^eD¯dX–§Vşí)clwâ«]Á±u÷úWbzQgüéxÛ™“+xÀÈØhûlæ7V|\00X\0°’Ía}~êcµúc•9¤YÛ³Ñ+Å¬?¥÷,sÕ]c‚½\\Õ¯2lJö˜+3¢\0+idFo|+ë7mİİ®FºËSÃ¯N~±²cX³£Wv×çšE ¤ÓÍıJ\"£\"=6-\\›\Z¤|;\0¬f°\0`…“Y“9W”™À—ŸşòvgÛŠ¿p™~êcséñè•šØëÄ\n™”º.—Îóz¶¾©\"óNúOÆl_&ç×•™_2¢r±æ¢°¥\n¦ìW³~bŒ=7/ƒ-3¶şÉÇ±¡Ğ¹ª*FÿZ¯.Wš\Z50c•ôŠÑvæ¤İ\nb\0€‚Æ.„\0°ò•:£æ¾„ÎÔş_\ZøáË+ukÂh¤ÛÜùË)„è•6èß8ıÎçüğG[İû ŞÎv°³5ùmE*æFØŠùÊF|UêËG÷¿—Ş¬	m.ôŸÿâüg¹-L¹¯£şzõ¾²ºnİ†—s?OıÏ±nNŞLo h[YêñÚÔ Œvõ\\’–ùş÷ß–WÕTT®/Üş–\'Ïƒş¾<<y¤ƒNü¡ºUlh@î‘P}ÓÊx†§woüÍ?š…ÿjò¬ã\0P@`Àª°Æ9ù{™ê<õMoø5{ğûî…>]œsÚsáìíî8§7\\w¦2z\Z’…Q÷·\"»hTSzé£m»º÷Y—ÎŸRë¶d\ZÜœèğ;	O5EFKæçøşÖº\r/—¼T^ ƒSfãçşÇ¶W•î»xE½—Æ±ÂˆÜºòèş÷ê½Ü;:…Ó®ŒØºÜ³ß÷^—1éjÜÖ=³ãæn?y*SC÷Èƒş¾P}ó\nˆó~ùé/ôT-YZ		z\0€\\À€ÕÂï$~”ìôÇ|ëÔwÔtñCk7¼\\¼¦t\\c¤ç²L õ’5·ÿW“gkæ3á+U}$TV^UY]çÒdûN÷tè¤6ù/µ©ñ`SlHEÍ;şäOßÿşÛ@QĞJ’Q\'äÎ\\ù_ÿÓ¸ªÜÚQ½4”ú -;Zs?¦œª\nn–¦F]\rÁ¬qÆ×§şğĞW«Îß™Ê¶ëtV¤Rõï·m§uÿª °õ•ƒsŞ#fëÉÈğï»/HëÉ££@ã³ã¼Ö+ˆ\0\n,\0X]ªSNì¡¿V/\'‰=¸İÙæs|•Õu…ûïöªŒ±\\ˆ ØŒ¾:ùEÁ­:)sßõ7NOGÿ4üçMûİø”ÎH×«÷;×8ã±ÒƒzY¥ôï¾¿õ ¿o}İæB‰ºF#İígNšËƒN|ïäWRQ[1îû3æ‹OŒ×ÔmÎ1x\ZøîêWÓ7Q*jñ<ç$coc2ó¯ó•M_Î“?İé¾ %éåBìßÒÔèŞÄWy‹›K™k	å‰ô\\)Ä%·óÅy‰^\0X\0°ê”¥¿œüı¨¯B^ú›úïü¾ûB2‘(¸0–\n]uwœ{®ì´oL\\ß–¼âµeq‹!\'?â«R½#3ùP}³õT”Ñ‘a™%ª÷©˜Ç×WÊÊİLÒ‘¾.ˆ¨«\Zœ=W¿2·Ø[›\ZÜ›øÊnÅ1•„õ¬scáÆ=¹­óÂgºú–d—<1Ün(9ÿtÂç<òÕ˜­w·çÊKU]æ,­ô»³ÿ_FÿnHF¥ó7¯L\reüË„œ›<Ò(]qÎ8oÁåÏ\0\\E\0\0V#™.Ö¦şE&<1ß:H&&Uk|ìOå•ë½ŸŞ2gèÊy–x¥·ó+È_Ï¾ä€ÿeİ/Ö3ß½uEO½V¾}N*I\'éèå„·£®ó\rÎ†ä–Äë%¥JQ½ŠP>1—$¬ØĞ€n–¦F›yk4¹g3\"•éÊî½×ô÷ÉåxjMÜèÈğ·í¿‘†òNÜ¼,õXê#¾*È¦Òïö\\	®)qi%²Å›eÎ8o‚§\0€â{üq˜V\0€UkÒ)¶Şõ7Æeòõ¼P}S]¸)ÇT7È$\'Ú×u»³Í¬u¥T¤bÛW\n:t¥}Uô®šˆÊäó§ïı,X\\bñà¿ıÕÏGŸM¼ßŠÿS‘3Q(ÍòÈWÓØ¯§èÓƒ5%2P·´´.{ŒC\rÎîs£ÏÇ­Ô„¼%q¡4åVbNÔ_/-3Ë(¯zûÄGYŒU<[ßYË²zK=”zıÛ3¾_Y]+]¼ìO¤ıwäáíëÎsÿ.<Ï{Û3é2$Ò÷ÈV»O’Ez.Ïù$oHŞhHÜp\0\0x,\0@zÆx3°K/AÊ\r„ÂÍuõM¡ğòïÎt÷÷uG#]ñ§™›T©é•T*E¦ z¿³õ¨Lİ-ÎÀ¿üô—ê½•]ğò?\\ç‹º®¯ÛnÜªoÎÿ,]\rN™ÏşO28¥‘óW½XtX/Á«¬®=xìÃ%µCFôª\";0yf¹zyÌWÖØo®(ÔO¤pãyU®«ÍçùŒ÷Gºo_o›šÌ[ÿZy¤KÓ-ûó|\'¹wâ€\0\0\"€\0xq\\@Gjê6¯¯«Ïgee™.>è¿ó ¿oÎÙ³CWŠLİ/VïCõM¼oëÈ—ÎŸÒq–Â]k)Ãµ7°]¦èsW¢Òhò§«a58û#İƒıwæœ©Ø¦dOŞç˜¯¬½èİ •ÕµûXdÄ†.ÿDG¯‚N\\ÆFyjxÙïéåÙa,uuSñJw#YÒ,ÒÅr¿ÌÎòşÃGÆC¯ûÂÿ2!ôüD{_ø$—QCâÆÊÈŸ\0¸„\0\0 3.pßºëo|ì[¨Hb:4P][V^%³ÇÊê:‹S øÄxìa¿ÌeÆ(ÙùÚ†dtS²g¥Nx:ûõÌóÀ;ïÛÊ˜æıŸÿğŸôôûÉ_úp]8êš®ş³®Nfé?x6\\sœ„?IÏÃûbCıó­–wpšqOuù[[^[xá˜‰Û×Ûşöîæ·‘üÌxU±øª·V¿93m`fÇÏ®“`_b`wÙM‚Á\"‡`÷äšcùCö˜kÎ)ğ%ØMœCÆÀ¾ø%ëlÛ‹™1à™{ì™öè\"E2U,ŠÍ–Zj©EIÉÏ»¤n©¥ÉbÕWÏóÔşæ/f?êÒoçÄXÕÏø°L*_ğú[WßM÷?ÅÎçœ»xrósb¬J±\'¯V¯x‚Ìñ—³O–bg~Î\\tÀ	°\08ó´çgÙÛ¿H˜7tÎYP½ÑÎZîlÜ¹È@¢âD±:E,Î“qwÛK?¥8u|4z¿8u\\â6“£¤ñõ_mËøoÿÃ™×WşéŞış»ß¬¶¿:øŞÃÇË±bÅùù“ô‹¿È½ô_ëÙÙØnŒƒ­é‹³÷ÙSœuÏ<D?êv‹SñsÎÀgœoòpôó[|pKñwµß:‘è½°­\nNs\n•^Ø#Us7UE–ÓÑ‰{ö´ê¾Şß¿ÅjœJNVrXî|.m)v)ÅÒ}}å¥ûóê	2]À­û¯5^–	özİ_+Ôz½ƒ§¿ü¸?¾½È“å£2çÕ0À	°\0x‰tûÓôá/²GgU@ÜŒÍÑÓâ¤±8u¼õ¶¦p}°w|ûE\'çOÒ/V×~p>ıüÃƒ<8‹çìwkpÁèùD¦ğ[ƒÿü)ö$ûâ/ÒGÅíùIÖ|wnu/úS¦xl|˜½uñßLÌ]•[­È€ù`p	Ÿ¦?Í·ÅYĞ\rœ=n\'9wGOŠ·•ú-ı5]‚pÑÇ·_ÜQÒ¨¨Ÿ§w®)x­Õòmø$`¨ñÒæÊêIÿáã7?Y¬KR>É¾XİË+x_Ñ4í-VïºÃ¬•İ“0_¹%\0àâÊ3Á“érqæS&Yi½Ê®˜\'6íd¯8Õ)6Š³bcùN\Z/âÃì­éùä£7çyA½wº½|cïŸ?¾é=şüaòóêİâQZ,iùpMÊ‡ëeã×zÒ/õQ#ù¬|”öâw+ğåÁßü¤x8oçD<ÅÏò…aY³pO·ÙİQ•ªOîåWŠ×«{¹¸s«´eé÷?ÅOúÆèñIÙD\\¬ÛA²öiö°¸-¶¯øû‰êÙQÜ–O™qnå¥€9Ş\0À«!W¿Q?ññê\\¨Ú>Jg9—ç‡£Şì	•ŸeoO·ßù1¯/Ûïu§\\ˆfŠ³èâmšgM¢^%\Z‹ş$}cø¸x«âæò¹yœ.JwA§÷EÓÑY{¡»ÃÉ¿o\'{+^Tıò`šŞ“W¿¨xñ\'/eàúl\0à\ZÎ…&ïŒ’Ó©ç˜í‡zğú—.2ÿ‚¦éUáÍáO,u2¶Væ€¯Œ›‹çã*îˆì…®¼\'÷;\0\"È,\0Äñ÷µßœnÿÆüÊ¯’ç¬åî\0`ù°\0 ŠrFşñ±¯©x›×W~ú«§¶_‚+©\0°jX\0Åõ•_ıôoßn?\Z)¿\0`Á°\0 „³·®©üªßë~øÁªíöhïáĞ< \0\0Œ\0\0nßQÒø»ÚoMßûô«şa·ÚV~\0À\"`ÀíûAíëıdr•úGo½3Çò«äDÿ ñí\0\0, \0Ü²Ô¾ş‹ìQµ]o¶şÉïıñ¿ø\'½··óYµıhø~{´gÁ\0X8¹%\0€«;J\ZŸf?OïLçXMİ=iöªÛŸò‹ìÑÏ²·‹Ïš~ğwÿğO×6¶çøıèoş×t[ù\0\0J€\0WòiúğgÙÛÓªşƒéöİÑ“jc\'İöNıÆïüËGo¾3Çïmoç³O>z¯ÚŞ=şï\0\0°XX\0ğŠÒµÔ¾~ºäêçüãßıÃ?yóíßïwøã™ò«7†İe\0\0,(\0¼Štû¯ò?:]EUXÛØîŒÛ\0û½ƒ§¿üø¥_êÁë_ú§¿ÿÇwî½6ßïpoç³§Únöô\0°¸X\0pi§Ó«;÷_{óíß~ğú—NçPUßÓ_}|\"Ì*>emcûõ7ß™ïĞ«©Ùò«/è^\0`q	°\0àÒ~Pûú4½ª7[¿û‡zÎìªµíµy÷¾”ò+\0\0–‰\0\0.çÃì­éuëÍÖ¿ú“ÿ|M%TW¡ü\n\0€e’Y\0¸”¿Ï~sºıÏÿİ\n˜^}òÑ{Ê¯\0\0X&,\0¸„tû ]«¶ß|û·ç>y}.~¤ü\n\0€å\"À€Kø4}8İ~ı­w~‡<şÎ\'½Wmo*¿\0`	°\0à¦åW…‡¯)Ú·×ïu¿ÿíoNßıGƒïºË\0\0X,\0¸„éøöB½ÑŠöíıõ·¾Ñ?ìVÛ†ïß=q—\0°X\0°$~úƒw?|ÿÇÕv=éuğ=k\0Àr`À2øä£÷¾ÿî³æÁ¯\rş2Oz–\0€å À€Khö¦Ûı^7ÈwõôW¿û?ÿÛôİGÃ÷îÎ\0`i°\0à6GO§ÛO/öw»şêãÿó?şëtôUñ~mğ—î)\0\0–‰\0\0.av,úGÇ§nÑ¿óçßø³ÙôêŸıow\0\0KF€\0—°1úlÚEøÁãï<ıÕÇ·õô{İïû›ı­ÿ>ıH•^}\0Àò`Àå|yøÃéö_ë·2	ë“ŞûóoüÙOÿöİéG¤W\0\0,±ôó?{Ó*\0À¥|;ÿ7Ÿ§wªí;÷_û½ı×6¶oæ¿ŞÛùìÿ}û›>ß½ø…á‡.;\0À`À¥í¤Û•ÿQ?©WïÖ›­¯|íşá?şız£u}ÿé\'½÷Áãï~ğø;\'>şÕÁ÷Ş>v§\0\0°ÄX\0ğ*NdX•Go½óú›ï<xıKs,ÈúğƒòÑ{½ÿã½ÏNüÕİÑ“¯¾·1úÌİ\0Àr`À+ÚI·¿[ûƒƒtíô_­mlß¹ÿÚ{¯w6îÛõfûÎ½×^úû½îÓ_~””ÅVïïí|öôW=ıå‹‡Ä·G{_şğÑğ}÷\0\0«@€\0¯î(iü}í7?È¾r©Ïºsÿµz£]m÷{g¥T/$º\0`	°\0àª’Æ‡Ù[ÅÛt²ûÜÕ“şÃáÏ\rß¿;zbÁ\0X5¹%\0€+¿šöŞ>.ŞÒµOÓ‡ÅÛNº}õ0«=ÚÛ=½;zR¼t\0Àjr\0sÒí=\Z½ÿ(™ô÷í¤Ûı¤^Ş¦å¬÷d²qÖç¶“½bcsô4õTZ\0À”\0\0®KU6%Š\0€+Ê,\0\0\0\0‘	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0Zn	`µÆáõ0IzC‹\0\0@p,¸­\'_Z¾ÍH[µ“ÿ¦øûÆe’ÙÙuczÃdxö_N~lt4Lÿho”G\0\0\0¼äÚÀ´³¤,Mgs¥æÌö©Äjá“ µ^ğW/ÿáFÏ%\\3)Øsá×‰\0\0À²`Á9ÏãÈi6–šfR´ø¸Eº–¯Ì¤`g.ôlØádkT~pœpé‘\0\0XóEKÀ\n?ü\'qÉ¤woÚ¯¡;š½§¯¤]ÃQÙ®XmôËQù‘q¶%ä\0\0ˆo	XfYZÖIM#ªÚqOK>µz„ÖóÇNÿ›igâ¸’ëYÂeP\0\0Àm`±øN¤Tõqgßò\rœâÚw‡Ïå›\'=Ó\Z®ñd®ÉL.Õ[\0\0\07sÆf	XUPU£ªÚıôúq“¿ÖÙñV·ªÕ’m\0\0\\1˜ãZ˜F–fédhº¦?\"k={”>—mMë¶ª¶Äî Üî\n¶\0\0\0.™Xnû1XfUe÷_UT¥õer¢nkkf—[ÅX‡ÃÉ°-[\0\0\0g`q³\'óq\\•ge]•@VÙqÑÖ*¶FÉ`4*S­‘ò\0\0\0‰\0‹kTÅU,­•·Õø*«/yÖ_-ñ¹gKwfõG“[R-\0\0`Å°˜ß‰·¸\n®Éñ¸“©Öl­–ÑZ\0\0Àò`q…3ê<Më™¸\nní98öì¹w4n?ì\rGƒñ\\­ê]\0\0€Å\'ÀâbÆVå¨õúäú€–âíÑÇOÏsµ¦…ZİQñ\0\0À¢îXÎ<ndic<m],®i¡Öô\ZˆUqVÜ{8®Ø²H\0\0@p,¦‰¬†²í·üóÙ“|\Ziu\Z\0€€X«|çK¬€±i¤5­Ò\Z7úÃ2ÛrÑC\0\0à¶	°VL+›Ì±j”#Ø­pÖ¾\")K´j“w«²¬Ãáèhœgé:\0\0n–\0kéïáñDçzVš¼¼òäÄxx%Z\0\0ÀM”X‚%4-³je\ZkÚÏ$\'J´zCS´\0\0€k\"ÀZ\nÙ¸2¢9®±j)³nşÅ$Mò2ÌšLÑ\ZÊ²¬Ãay¡ÃjB<\0\0ÀUÎ9,ÁŸ.–¡U­œ¿®7¥LÕgZåY\0\0ÀÕ°ëî:­ZF°‹C\0\0\\\0+ş]$´–Ëé<«{<?Ë<x\0\0àEXaÏî²´-´Vc×™™ŸuTæY“ëv‡–\0\0HX±tjå öVf¦°Â¯Ki²^{v}ÃqŒUæY]Í†\0\0°Â\'\n–à–¯8)¶àôN²qjx–fC\0\0X1¬ÛPöËŒÇZu²$Ó!pág5<«j6,gÀF‡ÅY\0\0°ôX7hZi¥CàêÊâ¬$]7ÎN‚79\0\0–\0ëšUÅVUn¥Ø\nà\Zw¶3“à»åøÑáxr–NC\0\0X|¬ëÑÈÒâTª­Ø\nà6´Æã«íê²†:\r\0`‘	°æªS›[åŠ­\0‚¼Ğ/k8Ói8©Ìêé4\0€Å9®·W¥I`‘öØµ´cl\0\0,Ö+¯\\ú¬Ş\n€…szlÖáP˜\0\01	°.©1«²V3Ü\n`©Tc³„Y\0\0’\0ëb\ZãĞªS3Ü\n`ù	³\0\0 Ö¹äV\0+N˜\0\0°^DnÀi³aÖşÀÕ\0àÆ°fÈ­\0¸ ç¯fX†Yûƒähda\0\0à:°¯\'h.;\0¯`|5Ã2ÌÚ®—Vf\r’ıal\0\0s²ÂVqÊ±.·`/ªãW–õZr/)[§•Y\0\0ÀµWñ‡.Î.ÚãVA\0¸&¬ìL¯¶»ÃÑÁÀÀ,\0\0xe«`µ²t-O:Y’qÀÍ¾\0µÆÕ¾ÕÀ¬*Ì20\0\0.l¬<M7r£Ù¸}ÓY‰C\0\0¸„å\r°Ê“„¬Œ®Œ¸  ÙÃıA™dé1\0€3,c€Uµ\n®qÀ‚˜–eÍôº!\0\0[¢\0+OÓõ<YÓ*À¿–M®c˜ı\0\03GÊËğCtjéš«\n°\\¦£ß•e\0°ò9ÀRrÀJ¼VÏ”eUÓ²ö.b\0Àj/äw­ä\n€ÕTMËÚ®—Ö4Ì\0€e·PV–¦›J®\0`\\–µ9~97îk0\0`yãÛtaA\0x¡,”eİK’Şp´gî;\0\0K(|€µ^K7ò¤‘¹«\0à%\ZYÚ8û®Á\0€%5Àª´oÔÊ_,\0—|Õ`\0ÀRá†ûtÀ¼Ì6N’,W0\0`ñD\n°tÀõiei++¯`Ø–aÖŞÀ¨,\0\0E€\0Ëµà&5²rZVñâ{4zV–\0\0İj€•§eÉÕºAW\0p;/ÄeùsñB<%ûã$«kT\0\0!]oç¿md“è\n\0¸uÙq’UØú\0@47`µ²t«^ÜZz\0ˆÈĞw\0\0â¹Á\0k½V^^Pt\0afè{9ñ]’\0Àí¹‘\0k½VV]™Ñ\0‹¨‘¥q’µ?í•s²\0\0àf]s€%º€¥QuÊkw`H\0\07æÚ,Ñ\0,ç±Cšn×“­¼¼páÎQÒS\0Àõ„ÎÿKŠ®\0`éM/\\ØöÆY\0\0pmæ\Z`‰®\0`Õ”³ŞÉÖ(ÙŒvz\0à:Ì)À]ÀJP¤ÉV–}…½\0p\rÇ›Wı¢+\0`Ê w\0\0®Á¬V–Şkˆ®\0€SÇ½\00×ÌWù¤VVV]µ2Ë\0œi:è½7œd\0À+¹d€UıBµS³p\0ÀE5ÆUÛÛ£dw<!Ë w\0\0.éÂV6®ÖEW\0À+ÉÒd3O7ó¤;í)È\0à.`¥wêÉF­<î\0¸¢V–¶\ZÉÖ(ÙŒvd\0ğr/°:µ²ğÊ¤v\0`ÎÇ i²•§å ÷ÁhoPÜZ\0\0Î<x<óo\ZY]™Ô\0\\«N-íÔÊ:,Y\0\0œáEV––¿İÌ­\0pS‡$ÇY»ƒrBVwhI\0\0xv´xòëãAã®\0€[QŠ¬—Yåõ\nwÉPA\0ÀjËÒô™\0KÏ \0D>¾üqñ¦ \0`•µ²ôA#ÉÒI€U^gpKÏ \0Œ‚,\0€•µ™—¿ÔËËÂ«{õâÖ²\0\0A)È\0X)YZ¦UÚÌñà\Z&^\0‹AA\0ÀÒkŒÛóçÒª\\z\0,Y\0\0Ëj¦mğ¹@+\0,*Y\0\0KãTÛà,\0°àd\0,ºV–Ş;Ù6øÜŸ%\0–ÄqAV²7í•\0\0„—Ş©\'[/I¨X\0ÀrÉÓâ\0(-ö£½AqkI\0\0Â¹•…W­ìåÿĞZ\0Ë©SK;\n²\0\0­İ«_ğê‚,\0`©ÍdÊYï\0\0Ü®l<Ãt½v‰c:‹\0¬„ª k{TÎzßQ\0pK\ZYúà¼yí/$À\0VI–&›yº™\'İádBÖP’\0pC.2¯ı…ŠÏI-\0°rZµ´5.ÈÚdõ†–\0à\Zåiú ™4²Wül\0¬®,MÖót=OzÃÑŞQ9!KA\0ÀÜmæéÖEçµ¿P®\0\0 ifi³‘ÜM’İ£Ñî éšõ\00yšŞo&­ìª_ÆJ\0<SdÆI–Yï\0\0W°Y/‡^esøJf`\0œ>DJ“;ôN£œµ”ìY\0€KM¯jsûz–\0àLZÚ©%w“‚,³Ş\0^jRx5Ï’)\0ÀË‡_ÅqØf½œõşy?Ù7ë\0àEæ]xõìk!\0¸¨F-½?> Û=*[÷µ\0+¯\Zó-¼šR\0pyÏf½÷Ç³Şµ\0+,Ï®©ğêÙÿ`‘\0^õHêxÖ{wPÆXûGZ€USo×}Ø¥ƒ\0àªÚµ´]K†ã«şºgÖ;\0°Zµô^3id7ğ_™\00\'Yš¬géz=9\Z~İ/²´\0KzØ“n7’ÍÆı‡Z\0æ~„••¿,ŞöF{GÉnß’\0\0Ë£“§Z×4¬ıÌÃ+Ë\0p‡w|’di-\0]•ÑÕuk?óÖB\0p½ÊÖÂFºŞ·ö´\0‹(İn–=ƒÙíäH*°\0\0nìÈ+Kïµ’{É¸µ°¯µ\0X­qÏ`İâ· À\0¸q“ÖÂÖqkáÀ’\0\0U¿~ëÜ~|$À\0¸%ekaıøª…Z€Xn·gğ„<IÍÀ\0¸UõZz¿]nvûÉ^?¬\n\0pkÚyypRÏâ|G*°\0\0\",¶Ç­…{ı2É:8²$\0ÀÊ³ôa;i…Ë‹X\0\0Ádi²ÑH7Ê«–IÖ¯{Z€8I·šÉv3æw\'À\0ˆ*Ï’­fy(ÙŒvúÉNOk!\0p-6\Zå°ö,î˜©<IÌÀ\0ˆ­‘§÷òä^{ÜZØ+‡d\0ÌE»8Ìh\'ZğoS\0ÀâX«§kõ²«l-<LzK\0¼¢<+£«âĞb!¾Y÷\0À‚™’µÓí’\0\\îX\"İn%[Íú–µ\0,¬¼–l·Óív9$ë×İ²µĞ,\0à\\ãè*ô¸«õ¸ç\0\0^£–>XK$É~´×+Ç½\0œ°Ñ(ï•g‹ø½ç\n°\0\0–G5$ë~§’µs˜Y\0`<©½“4k‹û¨À\0X:³C²ª$ëĞ¸w\0XIí¼¬ºj/|şc\0ÀòÊkÉV-İj%‡ƒ2ÆÚ3î\0Vç0 Kï¶“æ’ü4îP\0€å×¬¥ÍNÙZxp4I²Œ{€eµ\\ÑÕägr·\0¬v–MkÉ^o´×Ov-	\0,,-£«­ÖòıdZ\0VÒZ3]kNÆ½ïõÊš,\0`qeiz§UFWY¶”?Ÿ\n,\0€U>ØÍ’fºÑ,;\nwÇãŞ]¸\0ëÕ<MïŒ«®²e.Q`\00¾páV«÷^^¸°\'É€…xù^…èª’ë \0à™z–Üi•=‡ÇãŞû.\\\0ÁTÑÕ•ˆ®*f`\0ğ\"ÍzÚ¬\'÷“™$k`U\0à–M¢«öêDW-„\0\0œ«™§Í<¹_]¸°—ì–³\0€¶ªÑUE€\0ÀÅ¬5ÒµFòp]’\07jµ£«Š\0\0€K:‘d}Şµ$\0p-êµt«l6W9ºª˜\0À«Zk¦kÍäşz²w8Úí·–\0æ£^Kïv’–•¨¨À\0àj²´8¼N‹#ìáH’\0WÕÌË†AÑÕóX\0\0Ì‰$\0®¢]Oï®·Vâ´<Iµ\00Wµ4Ùl§›íd8Lv{£½Ãrâ;\0p–ÍVz§“4•ÉÒ\0\0pm²¬<\"ß×díJ²\0àùÊ4Yo–UWõšÅ8Ÿ\0\0€9@—dÀT½V¾,Şé¸¼à	°\0\0¸A’,\0V\\9£½S¼\ZZ‰KÉ“DÔ\0ÀË¦s²FÉnW’Àò[o–ÑU»a%^\n,\0\0n•$€Ux¥»Ó1èê*X\0\0D:¾—d°4êµr@ûzË ««`\0ÌsIÖáè W&YÃ¡…`a”İ‚kI»n%æ%OR) \0\0!ÕÒd«nµËíİÃÑnW’@hYV¾ré¼*°\0\0XëÍt½YnTIÖA/é¬\n\0Qt\ZeíğfÛJ\\\0\0ešd>?Hv»’,\0nM–•/LÛkISÀr½ŠõÕB\0ÀjÖÓõäÁfrØOö{e˜Ul\0À½m¯%ëÍ2Ãâú	\0XøSˆÉYD0¾|a7ÙïY\0®Å³’+Úo”\0\0€eQ¯%ÛkåIÅpx<ô½kU\0˜%W·J€\0ÀÒ)N-6Ûi5Iw·ëò…\0\\é5¥¼°àšŞ.3°\0\0Xjëít}œdöGŸïúÀ…_AZéf§¸µäò+\0\0VB«¶¶’‡[“QY»İdÿĞª\0pR³nu’ÍvRÓ*ˆB\0\0VÌì¨¬*Éêi0ğêP–\\muLgI!\0\0«*«%[kéÖZ¹½{0Úï·\ZVìµ K6Zéz+©úÍ‰J\0\0Êz¸•ö“ıC\r†\0+°ço•{ş–«\n.\0\0ÌhÖÇJ_Ÿ4·\Z–i?_îäåV‹F€\0\0/R^7½SCùã+şz¿¬É:ì[€…Tf_o—³®X@f`\0ÀKO{\ZéÃF¹Ñ?Jö{£İƒ2ÌR–°\0;ğz9ëp½•ÔUğ,6÷\0\0\\Xqş³•—¿Ã/”£²”eD4É­Ô[-\0\0¼’N3í4Ëş 98í·É@YÀ­î™×Ûr«¥”ë \0€+iÔ’FgR–uØOvÊÊ¬®²,€›²1¾’ìF;ÉdKË,\0\0˜Ÿf£˜u«œµ?.ËÚ?,\'g0_õ¼¬·Ú×[±´\0À5È²âœ*­N«ûÉ~w´X†Yz®¢\n­:­¤Y·+E€\0\0×¬8ËjÖÓír{cv÷õ\\Tmü+2·j–¿`%	°\0\0àg_fzsÒcX•eu{à¤in¥I3°\0\0àvdµd½“®G¿÷ÆaV×À,€r¸U9”½“TWz…1X\0\0àlm+O·ÖÊíi˜µ{``°BZr7Øi–WÃ€SX\0\0Él˜uØ{V™%Ì–OÕ$Øi%mÃ­8_¤Z\0 ¤V³xKïn–ÛİŞäR†Å†6C`¡uZ“+	¶[qQ*°\0\0`§y­Fzw¼]¶vG{‡Å­0X”Xº1kÕiY^\0\0\0MÙf¸n­—Ûı£¤Û_Í°ëj†@,ã\Z«´\n­j:¹\0\0,²z^¼•u\r…Áp26k¯[æY\07¬–%ÍFºÖRiÅÜåIb\0\0,Ç©c-é´‹·ôşøİjlÖøV§!p]êy9ÓªÕ0ÓŠk¥\0\0–T56«ÚËë°Wgö\\ÓxuÏÊ¬ZÅ†Ş@n†\0\0\0Vã„s£S¼=+Î:ì•ÅYU}Àù;*±j–±xYr7N!\0\0¬V³xK·ß€&U¤¬¸z^Öo¶Æs¬Æƒö,	·.—_\0Àª[koÏÎö»IïhÔ=,›\r÷ÔgÁ²«ee]U³‘6êI5Ê\nâ£\0\0Ï+N_;Iš¬OŞíöÊğİŞhÿ é™‹íD\\eˆB€\0\0œk<¾œŸ•Ü™|¤j9ìõË­®‘ğûù[ËÒN»lläâ*—X\0\0À%\'Ãö³‰Á°L²zı¤4Úï&ƒAZpÊ¬ª–vZã\Z«¦ÙU,f\0\0àjŠ³å²ë°œ›ó,Õê›\r»‡É`(Õ‚9?ãZÍ$ËÒê‚€º¬ŠUà!\0\0\\ƒêŒúDªUÕj‡Ye°U‡\\N\ZWTÏ£´z65êI6_+I€\0\0Ü”ªV«°±–œ˜fRe[…rN|¿øs4ıHùÁ¾áñ,§µvyÛl¤Å³£*­J×„ÓÌÀ\0\0¨ÕÊÑZå©ûä/9QÙ?xÁÃIm×`ğ,üRáÅ-j5«¡éiõğ®—PÕëšşàRrù\0\0°xªº•Ó6OÕvM•ñÖád»ÛK†“Tktp8İ–vñ*ÂV#­Õª²Ë¯ĞOÁœyF\0\0«¡–=Kfò¯3§?f\r‡³CèŸË¼±×=Bª¾ê1}ÌN’LÁ-ÑB\0\0ğ\"­ççm<Û|ÉITÿ¨Ú5ëTÃãÉ,y¾@ŒW¿×&-{³Ig?r¢wïô¿B’\0\0ÌUuÍ¸Y§\Z/QGp:›ı«~ÿüÏíÌá\':ç‹<_µô*²,mŸûÎ\Z¥\nV‰g;\0\0@`§ã°ËHXA`h!\0\0\0 4½¾\0\0\0\0„&À\0\0\0 ´<Iµ\0\0\0—\n,\0\0\0\0B3Ä\0\0\0€ĞT`\0\0\0š\0\0\0\0€Ğ´\0\0\0š\n,\0\0\0\0BS\0\0\0@h¹ü\n\0\0\0€ÈT`\0\0\0šX\0\0\0\0„&À\0\0\0 4-„\0\0\0\0„¦\0\0\0€ĞT`\0\0\0š\n,\0\0\0\0BË`\0\0\0™B\0\0\0\0BÓB\0\0\0@h*°\0\0\0\0M\0\0\0\0¡	°\0\0\0\0M!\0\0\0\0¡©À\0\0\0 ´<IU`\0\0\0—\n,\0\0\0\0B`\0\0\0š!î\0\0\0\0„¦\0\0\0€ĞT`\0\0\0š\n,\0\0\0\0B`\0\0\0Z¤Z\0\0\0ˆK\0\0\0\0¡â\0\0\0@h¹ø\n\0\0\0€È´\0\0\0šB\0\0\0\0BS\0\0\0@h*°\0\0\0\0M\0\0\0\0¡åIª\0\0\0€¸T`\0\0\0š\0\0\0\0€Ğq\0\0\0 4X\0\0\0\0„¦\0\0\0€ĞT`\0\0\0š\0\0\0\0€Ğò$ÕB\0\0\0@\\*°\0\0\0\0Íw\0\0\0\0BS\0\0\0@h*°\0\0\0\0M\0\0\0\0¡	°\0\0\0\0M!\0\0\0\0¡åò+\0\0\0\0\"S\0\0\0@hf`\0\0\0š\0\0\0\0€Ğ´\0\0\0š\n,\0\0\0\0BS\0\0\0@h*°\0\0\0\0-W€\0\0\0@dZ\0\0\0M!\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„&À\0\0\0 4-„\0\0\0\0„¦\0\0\0€Ğò$U\0\0\0@\\*°\0\0\0\0M€\0\0\0@h†¸\0\0\0š\n,\0\0\0\0BS\0\0\0@h*°\0\0\0\0M€\0\0\0@hy’j!\0\0\0 .X\0\0\0\0„fˆ;\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„¦\0\0\0€ĞX\0\0\0\0„¦…\0\0\0€Ğrù\0\0\0\0‘©À\0\0\0 43°\0\0\0\0M€\0\0\0@hZ\0\0\0M\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„–\'©\n,\0\0\0\0âR\0\0\0@h,\0\0\0\0B3Ä\0\0\0€ĞT`\0\0\0š\n,\0\0\0\0BS\0\0\0@h,\0\0\0\0BÓB\0\0\0@h¹ü\n\0\0\0€ÈT`\0\0\0šX\0\0\0\0„&À\0\0\0 4-„\0\0\0\0„¦\0\0\0€ĞT`\0\0\0š\n,\0\0\0\0BËSX\0\0\0\0¦…\0\0\0€Ğ´\0\0\0š\n,\0\0\0\0BS\0\0\0@h,\0\0\0\0BÓB\0\0\0@h*°\0\0\0\0-ORX\0\0\0\0Ä¥\0\0\0€ĞX\0\0\0\0„fˆ;\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„¦\0\0\0€ĞT`\0\0\0Z.¿\0\0\0 2-„\0\0\0\0„¦…\0\0\0€ĞT`\0\0\0š\n,\0\0\0\0BS\0\0\0@h,\0\0\0\0BÓB\0\0\0@h¹ü\n\0\0\0€ÈT`\0\0\0šX\0\0\0\0„&À\0\0\0 4-„\0\0\0\0„¦\0\0\0€ĞT`\0\0\0š\n,\0\0\0\0BË`\0\0\0™B\0\0\0\0BÓB\0\0\0@h*°\0\0\0\0M\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„&À\0\0\0 ´<Iµ\0\0\0—\n,\0\0\0\0B3Ä\0\0\0€ĞT`\0\0\0š\0\0\0\0€Ğ´\0\0\0š\n,\0\0\0\0BS\0\0\0@h¹ü\n\0\0\0€È´\0\0\0šB\0\0\0\0BS\0\0\0@h*°\0\0\0\0M\0\0\0\0¡	°\0\0\0\0M!\0\0\0\0¡åò+\0\0\0\0\"S\0\0\0@hf`\0\0\0š\n,\0\0\0\0BS\0\0\0@h,\0\0\0\0BÓB\0\0\0@h*°\0\0\0\0-ORX\0\0\0\0Ä¥\0\0\0€ĞX\0\0\0\0„fˆ;\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„¦\0\0\0€ĞX\0\0\0\0„–\'©B\0\0\0\0âR\0\0\0@h†¸\0\0\0š\n,\0\0\0\0B`\0\0\0šB\0\0\0\0BËÅW\0\0\0\0D¦\0\0\0€Ğrù\0\0\0\0‘â\0\0\0@hZ\0\0\0M\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„&À\0\0\0 4-„\0\0\0\0„–Ë¯\0\0\0\0ˆL\0\0\0\0¡™\0\0\0@h*°\0\0\0\0M\0\0\0\0¡	°\0\0\0\0M!\0\0\0\0¡©À\0\0\0 4X\0\0\0\0„–Ë¯\0\0\0\0ˆL!\0\0\0\0¡i!\0\0\0 4X\0\0\0\0„¦\0\0\0€ĞT`\0\0\0š\n,\0\0\0\0BS\0\0\0@h¹,\0\0\0\0\"ÓB\0\0\0@hZ\0\0\0M\0\0\0\0¡©À\0\0\0 4\0\0\0\0¡i!\0\0\0 4X\0\0\0\0„–\'©\n,\0\0\0\0âR\0\0\0@h,\0\0\0\0B3Ä\0\0\0€ĞT`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€\0\0\0@h,\0\0\0\0B`\0\0\0š\0\0\0\0€ĞX\0\0\0\0„&À\0\0\0 4\0\0\0\0¡	°\0\0\0\0M€ÅÿgÇ\0\0\0\0ù[OcGa\0\0\0°&°\0\0\0\0XX\0\0\0\0¬	,\0\0\0\0Ö\0\0\0\0k\0\0\0€5\0\0\0ÀšÀ\0\0\0`M`\0\0\0°&°\0\0\0\0XX\0\0\0\0¬	,\0\0\0\0Ö\0\0\0\0k\0\0\0€5\0\0\0ÀšÀ\0\0\0`M`\0\0\0°&°\0\0\0\0XX\0\0\0\0¬	,\0\0\0\0Ö\0\0\0\0k\0\0\0€5\0\0\0ÀšÀ\0\0\0`M`\0\0\0°&°\0\0\0\0XX\0\0\0\0¬	,\0\0\0\0Ö\0\0\0\0k\0\0\0€5\0\0\0ÀšÀ\0\0\0`M`\0\0\0°&°\0\0\0\0XX\0\0\0\0¬	,\0\0\0\0Ö@€\0öü‘í\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0ÿ€\0\0~IDATxÚíœ[lL[Ç×šÙ3c¦--1¥E¯ã‘ƒH¤J¨Á!á˜¶Äƒ„xñ DHä ª\"9/\'dÒº%î	çx˜jEÄ¥Bµ.APÚÒÎìí›®ÚvÇL3\Zcönÿ_&+k¯µ÷µ~ûÿ}ó­5“áÍû3,:3```\0``````\0``````–nGÆû¥\0Vw–´¾Şœ>ET×Ü¬n´d¦B*8LeKiÖñ5™zƒeŞ2/Y7ƒQÚjöj‰W*»uïùà¶ûP–æ¡\r¶½Ò9¶µR\'ƒ”tª¨”~ßAWH×œq1«‹Q„¢ÒãÎEê-¯Â	aDdŸ°Âx\"½.?Ii”²ò…“V¨\rHÅ, #×|º¡^RJ\ZNVìÍK‘TRG‡–ÜBj©öÖfN]L	—H# ¬ïöcÌšdş/R,ë»©CH¤o|§ŒÄuè†z\\Hë“Ã\r`V_ğÚ”òSëÇÀÑ‰Ñ_{cøæ™‹Üb1Ôû•%Hym¡	ßöu$pÕE¹sXn_QÖiÑBÆ.yö´£Ãì%lZ½Y²ˆ•å›æø=¢şª±.áÔÜ«ÒÂEûÄµgÊ7äùOkïö¿yF^ñß¢~¢|ãl•*=íjÜ¨Êš¿’Ê©¯şÒæPê”ş,Ú­¶_;{”JAêAY¾Z×š õ¦t¼,Ë‹‹ö4ód?“ˆTMÙqÏß°„Œ!,ÉbÔEr•;®mT’ô^ÏüGĞL—ë©¼S}^{şıñ»E¯ù|e9TO][-1?Uş(©²»\\>¸ÚØÊò^Îÿ¼eyÈÖ‚*7êš^°Jteî²SÚP{N{8døÈ„Màû÷ÌªÏ.®0¶²D¨ZæŞYczÖë\n*É‰Ô¨‹Ê¥A¥TUlUÉRInø’g|gwq—¶W|h\\“\n	Ğ¤§Û	™¯¥Éğ©Mƒæ3«8¸·´£E8Ù“Ó²×yƒûLdeyG¾Ë:˜¦)\rwß¿\'OxÕª½»xÚPUsÅ3&Æ°x¼ş×á=wf¬»NQ§¤4ŒùXÿ!ëo\'i\\°\"Zk&A‹×~–á0a!\rX€XÆ³Ÿğ<ÕÆúEWñùÙÛö¾‹gØ{˜é&H,¡ëEiüÒë`ÙMÜi‹ÁJkÑ+\rŸ\r«Ç:ê	ºoïe,‡•~3¦Hk­Iq$^kz¥F#”˜I_ßàó¬à[yÚÂİŒÉfæi74Iz|ŒÙ?‚W7Åy$9)š˜e²è9Lp—³“Ú£7ñzk-,‰Áø¨´Nj_Æ˜ÑPfâ>\rõ­¬0“ómo^–•‡Ï~ım»K¢¬°ëZ>.\'´ñK›ò¶‰}líîÂÁ)Ü9°Gy–ÉÚ«Öo+‘³¤Ôdc°h“Rn(+&° ,(ÊŠw€‡² ,Ä,(Êê­Ê‚²³âkø­```Á\0°\0+îöÖFW#£N\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(21,'sys','mobileSplash_medium.png','image/png',26323,'2013-12-14 18:15:36',1351,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0ğ¼Ô\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0fuIDATxÚìİil]ç™\'ø»ˆÔ±(K¦Ê$S.[²(É%ÉëHÎÄñ–tÅñ\0¨ È4R@ÜÀ\0“d€ZPÒ@\'Ÿj&e \ZH\Zp¦‘ÉT¢®nØ®‚Øq2¶4–YeYT$+\"İ&©ÒÎPÑÆíÎsùJ×´òŞËËMşı@Ğ´t—sŞs.õüÏy—lÿSm\0\0àã!§	\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\04\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0So&\0à#ÿ0ÜúXşÆö|Ë}é‡{vë:ôS- \0\0p]©ßğÇu¿ÿµ\\CëØ?Ì·ÜßGú»/¼ò]1\0à:íªM+\0|Üÿ1˜ß°ğóßOµş8÷m;ÿâŸj.€9Í\0\0ÕÃ¢?üûÜòö	Y·fk|—\0æ4ƒ€>îêïıf9Õ)Ì¿ï[\Z\r@\0\0`Š_/oÏ·ÜŸ¾jù²\r­õş¸¢§d×}­ëtƒ#0Gé0«E¹_¿ákón}ì²?:ôÓ¡C?Ü·m’¯_ï7+}Jİ¢†¡ßûâ‘ƒ?\\!\0ÌAî\0\0ÌÖ_ĞËÛıáßÇ×•Õft²ÎüõâûÊ$o\\õÅ\'´róÖw>(;J\0\0\0µuy”ş÷¹†ÖxX\Z›[Í¿\r­ÙùÕ\\Æo¼¹=ªÿS€\0\0À¤Eİ¿ğóß/¿4_ğÈ_W—²KZ\'³İ§\n€\0\0À¤¤)ù+}Vd€ògò©•şs€\0\0ÀäÌÿÔ·«ë–“ßòíJ;åNwOrkOqÄ\0\0\0ªş¥ÜĞZu‡şŸ¼¿sŞ}e€‘şîÂ…ş*Ş«ïƒ@\0\0`²ª›“§ä†M[ß;RY¿ü¡C?­â:w\\œ~tF\0\0\0&\0ÌÓ›Vßßu¼²n9¯ÿm¥ï2x¶¿\0\Z:h\0\0\0Õšä´<‹—ŸŞ}²‚›\0#ıİ»Ÿ®è]Ş}ö{‘â\0\0Lî—rCëä_¤»Âéù/¼òİGÊíÓß¹cÛ/†¿“uÈ\0\0\0f^¥“óüë¿Ü³{âÁ\0Qú¿şÃ?I?/¬Ï´.ÕÒ\0\0\0“0ÜóZM^çì@e¿¡®¿ëÿy2Šû3\'®>1hß/ÿÍ½ıß)ıÉ]·¸ü0\'ÍÓ\0³ÇHw¾¥ú§—fç<7Pñs×4gw¾½í¹Û\ZonoİøØ¢e­‹—µF8{¢»ûíŸ^6ïç7g\rÿ\0\0˜¬áU¯ÊéÆs-uùÌ·g;z]tŒ3Í<ì®¶ì\r‹+€¹J €Ydpß¶êVæJ:·_œsÙ\'ª|…öæìı¿—½êô>ë3·¯È>x‡ê`ns\0`vxıoçêÛU<ñÀ‹O—zğ/¬«~¢¾¿aqvp8sú|q,Á¹bœ˜—3å?€\0\0ÀT€İOÏ»õÑ|Ëı=+JÿwŸı^ú9*õ…õ“İŒº|JÀõF €YçÜ?ı»ò\'æÏŒ.Íûêß=™ç\nmËÍÏÀ5¹\00ë.ôÿë¿¼ğóßoZ=ñ}€¾:vşğOJÃvgÛôü¹†Öú{¿9ïÖÇ²ó/,9Ş1¸ï¿Nr´\0UËö?Õ¦\0f¡w>(Ô­Ùºö‰o-^võåÏöxééwŸùŞØ?¼ÿ÷fÑ İù÷}+ªÿ«şÕH÷¹úwh\0\0€Ñú~8³óP¡ÿ\\¦eÃcM«ïo¼¹½~QCİ¢†3Ç»Ïœè>¶ÿµîİ?-uûIî¼9;{.ÿ/xä¯ÇŸÒ´p¡ÿÄ?|yşod\0\0\0€Kà\nGÊè)S—/®ä5{ªÿy·>¶ğóßŸğa‘d}ÿómKô˜>Ì^iÕ­;oÎ?«ÏŠ†â\Z^³ªë™3™.^Ö:ô{_ì>åPLƒ€f»¨ì[—fôgü¦pn0sâ·Å?ŒH°¨¾8aüíä\'ı¬­Üòö\\Ck™^¹yëÏ_~zÙâìlÛ\0\0€™´¢!¾æÆüóZ+XÄ ñæöÁáLçñB{³ÙK¦ƒ.@\0ÔXiÆÏò1\n\0@\0\0àããÜ@qÄ3\0\0\0sÏğ±Ê–1N?œ>¯å\0\0\0æb\0èy­üwïşiúaa–\0\0˜ƒ\nú÷m+óÁ{/­dl \0\0€¹ªï¥ï9Ñ=áÃ¼øtzØŠm \0\00g-(ôïûÏOŸ:wl{û¾“~n½Á \0\0\0sÙMCû^øÎD•å_E0xõï|ı‡’şwÙ\'Ü\0˜>Ùş§Ú´\0S¡ûTæ\n‹—µ6­¾ñò‹kİÿZ|•Ó°0sß­Ùº¼Ö\0\0®/¹†Öì’ÖÂéî‘şîÏ^GØ×[¸ÖÿË>‘Ùt‹ê`ZÍÓ\0S\';¿¡nÍÖº5_Ì-oûçÃ=¯\rúÙà¾m…×ù¸­K3+\Z²]Ç#	Î\r|øç+\ZŠışõü˜›Ü\0˜\"óïûVİï-2Àµ0x¶ÿøkOÿåß¶,Í|L®‚Ÿ<SœïßŒŸ\0\0Àõõ»u~Ã¢?üûË®ú_Kß¯üŸÔ¶ätÛr-À”3ÀLVÿ¡ñæöOıÿå½¾%;]³¯<\0\0\0³ÔÂÏ¿üê¿”øß~pâ·\0\0\0`.©ßğÇù–û«xbÓêûWnŞÚ®8o¦f@\0\0˜#àŞoVıÜµO|+¾é/N	\0\0ÀlW·fë8sşLhñ²Ö–\rÅïq\0\0\0`ÖË·Ü7ÉWhÙX\0çÜ\0@\0\0˜ıàÆöI¾Ââe­é‡“¿u\0\0\0`–ÿJ]>Ù\0Ğ´úâ\0âg4\'\0\0ÀÇÆ¹m\0€\0\00».ôOòÏökF\0\0€¹aäxÇ$_áÔš\0\0`n>6Ùò½ïR\0¨ËkN\0\0€Ùmpßä+tîØ–~hX¨9\0\0f·‘ãÃ=¯Uıô£û_+İXÑÕ\0\0\0³İ…[õs÷>û½ÒÏ+\Z´%\0\0À¬7ÜóÚÀî§«xâŸ>ºÿâİƒ¶å™…õÚ\0\0`.¸ğÊw÷m«è);¶½ıßI?Géû\nı\0\0\0æó/şéÀëåöÚûì÷^ÿáŸ¤Ÿëò™»nÉš€©“íªM+\0L…|Ëıóïûf|¿Öî-ªÿRÏŸ¨ûï»5kş\0\0€9ìX}û¹æGo\\õ‘pìÀkÛ·9Ñ]ú“eŸÈ¬¹Iõ€\0\00÷È¼w¤p¤?38|•¿¢¿my¶u©v`:ÌÓ\0Sma}æÎ›‹ãzOÉœøíGş|Ùbş\0 \0\0\\§nX\\ü€d \0\0\0\0\0\0\0\0\0\0\0\0€¹Á `\0j&;¿¡nÍÖ|Ë}¹åí¹†Ö±5r¼cøXÇĞ¡Ÿ\rú©†˜ÉßÕÖ\0`ò¢â¯ßğµ¨ş\'|dáBÿà¿üp`÷Óñƒv\0\0>¿|ç7Ì»õ±â•ò^&îÙ9øëŸï˜[ûRï7ë7üqEÏŠêàõ¿àd\0\0\0®gQñG¹<ş•ò‘şî(÷m›»³¼}á£ß«{úĞ¡ŸñOİ\n\0\0\0®Oó?õíò¯”ï8÷³?Íw¢î_ô‡Ÿß0™‰<û_–\0¦ï··&\0˜Q%/şò?UÔO&•×åôªŸ»Õ\r_\0\0`UÿQãVÑO&¸à‘¿>ò»_<70ëöháç¿_«ª=Z&¿ùÛƒÃÎ\0\0àºE|Õ½äÃ-Ÿÿ÷ï_sòÌ,Ú£ú{¿yÙğåIZ¸nkwÃ£2\0€\0\00çÕoøãy·>6™W¨[Ô°éı›×~]è>5+ö(ßr¥sş”ã÷ş—¿ëğ\0@\0\0˜ÃÒ™“Æ›ÛWnŞº¯·Ğnæwjş}ßœŠ—]¼¬uÙ¦­»Ş/8m\0\0€¹ªnÍÖZu”_ûÄ·‡3o½_˜Ùkä¹†Ö|ËıSôâ«ùã¿Ítwâ\0\0\0s5\0|±V/µxYkË†ÇÎ\rdŞ;2“×È\'ÙiÂ}l¼¹=vPG \0\0`ş†mhÌØß+5­.^zï:™ÁIæİúè”¾~ëÆÇ¢úß×«#€\0\00ç~ÃÖ´úÏŒH?Ìàhà©ëÿ3vôgÜ\0\0\0æ˜ü5\0K/€#ı3s|\Z–ëZ¼¬8»hTÿG,\r \0\0|ÌÕ-ºX÷Ÿ›™ä5¿§q¥Ò]#¿Ñ@\0\0à’Óç¯óœUŸ\\Oæi€¹âÌ‰îÒÏg27,ø)ù–ûçµŞŸ]ÒRZ¸w¸gçH÷pÏkñ}6ïìàpq¬óÂz‡@\0\0˜#†º_«É*`€ã–ìãO”[Ş^¿ákón}ìÊ^û¥Q¼#Ç;vÿpèĞOÊín_8=å™¡ïƒ÷qP\0\0\0\0æ¨°kû‚Ç¼6ác¢âŸÿ©o×­Ù:á##$,xä¯Gú¿yá•ïF(k¦ş¦ÁÀYƒ¦–1\0\0S¥p¡¿¶ ûíËôeŸ¸Êò-÷/ş·¯”SıøÏ@CëÂÏ?’@™3ü÷¼6¥VNÈ@\0\0˜¥vÿ°V/uæD÷Øî1ó®øıuÿ¢?üûêfê,ÿ¹Ã=;§´ÅÆ†\0\0€9fpß¶Zu›ÙûÌ÷>¬×ó™†…—WğùëIı{°¼½œ{4uÍ5aÈ@\0\0˜í.¼òİÉ¿ÈÑı¯uîø°ò^Ñpyí>ÿSß®Á?	ËÛGîûöø+¤„¦¨­ºv|$]\\r\0\0\0æ€¡C?äUóÁ³ı¯ÿğOÆşIë\rÙ±ÿ»àşv­Öèmøı­‹í?7n¤Ùù·SÑP±›û_|ºô¿Wä\0€\0\00œñOÏ½[eˆ²øçóGcW\0ˆÊxì\n\0uk¶–fö¬‰;şğß¿õ~aœû\0Ã=¯•9kPEŞ}ö{ƒc¦\0ZÑuæ\0\0\0sÕéş´{gÅ Uÿc»Å‡57}¤2®íRañ²Öß½{ëÎC…ñ#Mù«”ãèş×Œ¹üŸ¹¢›\0\0À\\²°¾˜Şş‡ï–=Ï}ÏîŸ>û\\Vıß¾\";¶g|ny{i‰ß\ZjÙøXÿ¹Ì{G®ù€¨ş;ÿ¯/ÖhÎşØÇWÿã“—Uÿ–\0\0\0æ¶Ö¥™³o=5ıŞöu¹jéÿòßüÑ«÷äe‹W¸}ÅGY·æ‹S±©-«[ÔĞu¼0ÎzÃç:ölûÎä3@Tÿ?ÿ›?ºìu\"ç8a\0¦H¶ÿ©6­\00mŞù Ğ}ªøCÓêûãkÑ²ÖÅË.^Â?vàµ3Ç»»wÿôªUuTÿwŞ|yY¼èÿ¾¶\0J\"İÿZÛòL{ó5kñ®ã™Şüš‡şä¿DZ¨aõ?ş› \0\0Ì1\0öõÆŸms¬º|ñŠx”ÅWZò¿wNÑFî}ö{ï>ó½xëG×W‹¿ÕU89Ôpß×ş¦eÃcÕ½ÅeØ°0sß­Ùx_\0¦È<M\00ÍZ—§¸‰nLøà¨şgªC|¤”#ıãÇ½óæìÎCı¯şİ“M«ï_û…oÅ÷r^¶sÇ¶½Ï|oìÔF¥¨sg«ê@\0\0¸î+İ›³kš3=§¢Â.ôŸË\\vC`Ù\'Š!a6Œ…=ñÛÂ83rÆÜwkd€ÂÑı¯İÿG7··n|ìÆU÷_™Ïö=ğZZÑìª}œÒKYü@\0\0¸c@ÛòøºX^§å·f[|úüÄ{‘2@lß¥i‹/k]¼üâğ†StŒ?\\8rÎ]·¨ş\0€“ÙYş–3V!2À·gß;’yïÈ‡«œ9Ñ}e\'Ÿ«ZÑP¼¢ç€\0\0ÀFú»§b€bù~übíîK”ãö™Ö¥Ê\ZÛ,ûDq„ÃØ…\0\0¸¦á×r\r[§â•O}t²2-¬/^Ë$p¤?Ó}ªp­ğ[ÑPLúü\0\0\0T\0vÖ­©}\08s¢»Ô•¿Š\Z=êûÒØ†“gŠ’F9/ûDñç%2zû\0\0\0TcèĞO¾ßPÛ—íÚ±­ôó$‹õÔ½G\'€Ù#§	\0æ®Â…şÈ\05ÙÎí€%43€\0\0À¬qá•ïF¨áxñé±³÷,ûDV#\0\0ÌQı¼ş·µzµ(ıß}ö{¥ÿ­Ë·0\0\0\03``÷Óƒû¶MşuÏö¿úwO]±«e©Ö\0\0˜}.¼òİ‘ã“|‘·ÿá;}cfÿ¬ËgV.×ÿ@\0\0`ö)\\è?û_îŞYå}€tí¿sÇGŞ¶<»°^Ó\0\0ÌÖ0üòŸ¾ıßÛ‡§G÷¿öÂwş g÷GfjXX\\Ù€ëO¶ÿ©6­\0pİè>•ùõÙ–µO|kåæ‰;s¢{ï3ß»ìÂft%¯nÏZ®@\0\0`nd€w>(Ô-jhİğXËÆÇšVİ?}@ßG÷¿uÿØÿc«ÿ»nÉV±\00\0\0\03–öõ‡?ü“È\0‹—µ^µâkÙ\'2›nqíàz6O\0\\Z—f–-Î¾Ó]8ñÛ‹2x¶¿ïìxÕı·¯È¶-×x\0\0\0sĞÂúÌ}·fOÉtŸ,tŸšà‘­K‹¥¿ÿ\0\0\0sÛ\r‹ã+»¦9I ÿ\\æÜ@áÜàÅ¿Z² ³¨>Ğİ@\0\0àºR—Ï¬h(~e2öø¸³\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\00eæiàtvé¹ìâşlcü|2ÛtÕÇÔ—dNÅ7Œ­Ë.)œÒn\\UœKG³­q\"\rfëJ\'Ï\r…£M…î……3Ú`ÆeûŸjÓ\nğq3”©?™kŠ-¾Rİ_…(é\Z\n}ñ=\"Á¼Ì€V%Î«}ù=¹•ãœ3ë‡wŠ\0\00MÒ¥Ù¨Ï®ZôßØ|k|o\\~S}ıÂ+ÿv`à\\ßñÃñÃ±ŞCWşíŠ‘¦Bw|—>¶Ng—¾>ï¡ÁLñªÿâ%KãtŠïé¯Îœ>§M|Ÿë2ƒwïjéÔb\03E øX8škíÉ®<’k¹¬âoj¾õÆæ•Ë›ëê”ÿjQÉ-–tG{¥<¯|$Ó²\'Ÿ‰Â.¾n(ÕæÏê¿nş‚\r›o[}×•éÚÿVÇ›/ÅÉ³\'_Ä€¦‘ní0#Ü€ë\\OnåÁÜºsÙÅé£>ki[Û¼²½¥­½foÑÕÑÛÙÑÓµwğÂùô\'\0n~Wøøøå¼/Ä9¶xÉÒO?ñõÒ…ÿ+\rœÿÅ3?è;~8Àæ¡çõ\0€),ı[V¶ß²ú®\ZÖıWÖv={ßÛ³=õÊèğıq:Óöäï‹ıÒ7\Z—İ4áyòO?şËÈŠ-#qzh=\0\0¨ÓÙ¥ûòKóù´­¾«ıî‡Ç¹.[[Çzí}ó¥ÒP¶‘·\r¿klÀu,]şÓìÏl-çñ]ûßzãåmñÃ#ƒÿèÄ\0˜~Æ\0Àõæ`~İÁÜº)ı“›o}ğ‰[#\0D‘wæô©®Üª#Ù–õÃ;õº.EéŸî2İ~ç–2Ÿ§åîÏ\r^8$×b40ÀôËÿÅ¿iÔ\npİ”boÌ{øpî“™ÑÉ|îäËQ“ÕÏ_8#©#Ş=›Éöè½0œ+N\r™ÍÈ\0×Ÿ£¹ÖøJcËÖ¿~ğŞÙÓ§eÎ./Ö†\0ÓÌ\0¸NœÌ6½=ïSiÆµw?Ò~÷Ã³a«b3nY½iÇ?ê;~ø`n]lä¦¡Wõú¸Îbg1p.k®èYMÍÅ{DU¯AÀdä4\\zr+K“0>øÄ×gIõŸ,^²ôÑ­ßHıC\"\0Äveê²ë\'\0dŠ ~şM \0\0ÓäıÜê4Kãò›>ÿ•?OëyÍ66?Fˆög·ÏûìéìRî:	\0Uİ\0@\0\0ªt0¿n_~cft–ÏŸx²¢õ¼¦YÛê»ıÒ7êæ/ˆ’1‹û\0\0 \0\0•I3ı§Úzóg¿:›«ÿ¤qÙMÅ”2A¶Q_ \0\0€ÊªÿÔó§üù×gI¸ç3_ÊŒöJ÷.\0\0\0˜ÀéìÒ_å7eFûıO]õæô©©xÙ–¶ö\r[Oæh®ÕÑ€éd\ZP˜{†2õ»òfê/YúàOÖªÖ?Ö{èXogúáÊÜØ|k¼İÍ+[V®|_£Û×o‰wééìØ“¿ïÓ#GM\n\0\0pMûòÏe×Í_°ùs5è÷ßµÿ­®ı»®ZôUŒ£~ãåm-+Û£‚ŸätC÷|æKG{ÿrğBqwÖïtX@\0\0®âd¶©¸ªîèj_ËnšdéßñæK¥~>u™ÁF.Éœj(ôÍ+/É/ÌœI³¼eëû³§3KOæš3u=ñ`Ã–Ç«Ş†ˆ.6?q\"v§e¤Ó\"Á\0 \0\0—ÊÔ§¿Q|ß¾~KÕ¯38p~ûó?*]õú{E¡§i¤ûÊGF(ş§iÊŒşípæh®µ+·*rH<ıg?y*2@Õ[Ò¶ú®tóá`~İ½C?w|@\0\0>¢+¿*­»4™¿}\'ÿâ™^8?¯é¹cd×ÂÂ™òŸ9!¾\"\0D‰Ù½ı¹¾ã‡«Şµw?ü‹gÅ«ÅKU´\0@uÌsÆP¦şıÜêÑ¢ù‘ÅKª\\I·kÿ[©ú¯Ën\Z~uãğ+Õ•İ7nz¡e¤3si`@uÛ“ÆgF×3vˆ`\Z¸\0sÆÁüºÁL]İü·ßYe—›c½‡R¥ŞPè«ºôóëc`ığÎ…™3së\"dª½/»³{ûsG²-wdvUšˆú³38x m@qÈÄŒÎbt:»4NŒËş0‹;*:™mÊŒ~YR85§w$Š×Ç¾\0\0ğá?ğiìïªõT7óOß‰ÃÛ_øQªşïúy­jÖÛ†ß-†“ÑĞ¸ü¦*Æ4·µG\08—]…ì„µK´Ã‘\\K4E*İJVŒô4ºÓ‰i8ñ•ê­iŞ€x÷“¹¦xëØıRÍ7TÆï‘”>¶‘ š+Úí\\fq:Í®ÌK§Â™ÈN©ÅÒ÷Yµ#iûÓ	P\n0ãıºÂ`\ZÙ?Ë„€\0\0sIW~Õd.ÿœãåŸ¤?5¬şK J«¨‰£o\\vS¥Óƒ.^²4ö+¶-Êšñë­£¹Ö=ùû®Z½E*8’iy?·zığÎ©+Ú¢öz}ŞCãl@4Âšá·k¾ñ¾)óLXñ_~Ü3uÅÚ÷R™õßŠBO¤”ÃEâ¨•f[ã¸Œ_%_ù¬8™KOIScE´‹€7ƒ÷yÒ	p$Û’†\0Utô3ÙLœ™³jw\0\0(KOvR—ÿ÷¾ùbßñÃñCÍ«ÿ$Êîtaò—·=ú¥oTº‘Ëšõ\Z¿¸‰Ò?İ‰´ĞÒ¶¶ye{$‡ÈñÄó½]ûßŠ\rˆ=öq*\nÜRõĞ¶ú®–¶öºùcúNî;ŞÛÛUœ\Z5ê­\Zn@ºİ©æ²º?\"Vãò›êëŞØ\\lÆåÍW6xlÕà…sgNŸ:{ºïhï¡¾½±¢…»²«ºr«\"	´ˆ$p]Vq\\ÙhÑb£\'Ló¢%¥!4)¬F<#8¦İÎG‹=}*Z/wŠv{òÅÉ²¦¾ÚØ—ƒ¹u—}4.;F?Ó„¼c÷%>¿9~x`à\\|öÓ	0vw¦í¦ \0\0Õ8škMÀ-«7Uñô(‘ß{g{ü0§Çf€¨}£fŠ°±aóãµ}ñRõß²²ı÷7?>vtªá¢o[½iû?\Z¼P|ğæ¡çk»Q‹§ê?\n¯ÍŸıêØ\rˆÂ+¾\"D;§\rˆGÆL¦»E¼]W~UT±¥»\rñ‘yb7Ë¼Á’ÊÁGnÏ<œJÛØÂˆIQÆé´/¿ñ`~İ-#ûÛ†\\1àZ-ÖÔ|ë8¡4şªÔªé‡ÔbiUìˆv‘¢zN]¿\Z\n}ÑhÓP7_VúÇ‰—rïø+oŒİ—ô¹›	SRM»“’@¼EK¡óº9\0\0®G²-©ö­nòŸ½o¾”íú…ËÔmdD‹xı¨\'\"lÜ¾~KE›Z?A*à®•RõEö8ãŒ£îyğ‰\'ö“§ú³QÚ¦Á	µR\Z}YõÙ|ş+şO?şËBª^Ù öw_nc©ò‹½¾ıÎ-“\\ô­TâĞD]ûŞí‘b;ãxEÅ®¶Í5ıâùU~S©ôF‹@8ÉÅªã@/.¾Î]ƒç{:÷¦5+âìJq4ZlŠîœÎ.·(İÁ¨í	¯Vl®®÷÷¿ÕÓÙ§ÙÁìºìÊ5#o_u%àº”ÿ‹Ó¨`–{{Ş§âû?İ¸¼¹ÒçFÉÒ1\Z\0~xÇÅU½¦LÔCQ\reëûNNuF™~İñúÙÓ§–_µ¢z3ÿéxÍ(æ¶|î«ã¿Î‚EK²™lìòÉlSK¡³.3X“ıŠ\"é_ò›ã‡5Œ6Ş¯Ôü¼e+>•b<eE¡g~æ|Eo(Ş(ÂFìoft¾×Øå›o»3ö«†‡©~şÂß½yÕï­½?Ÿ¯+ö.DsEêh,œ¨tƒSå;ÛÔ|kEÕö±ŞÎ8LqBNşRz¼{|@\"ÆŒdò‘Ğâ¥F«zªÜ«ÖøèÅ)»yæt_œ«ñ¦éTFËe†kxtbGvÍ{àBvA*ı7î«ñ½¶\'@ñr@ã7ßöû)ÛÄ§5väpî“<n,ükmw\0€jDeÿ6Ç÷>ô¥(D*}ú¿ìxîtß±(¬o™K¼‹2gck£Bjº4Á9vïxndxhÅHO”SWîş¹Ûâ‡ŸøzT®¾Tj|\'Êš(¦£¯ÉNı:¿¾/»,vgóD	$3zÙ¸·«ãüÙßæ3#iÊ—¨Â_«{4]÷˜ñ©Ï-¾WqÄË/j£dO1 jñ¨8£#2]yfs\0ˆwêÿL¶!•Ë÷?òå)m´8¸)DÑ‡8ÎŠã¹›ªNWµ\'ß¡üšôFcn¿sK9çüd¢`4WìÑÙßŠßÑŒñá]V8V«İf-Ál—&$¹qÜNÌ×ræô©Îbm4r`z¶¶i¤;]ÅãåmQ…—UÃuu¤e‰›\nİ×Úı4‚³œW‹VJ%Er¸VŸ¢Š”&`-ş¥–¶µñ½¢{â-J#Œ#fŒÓÑ¨¶¢¹Úï~øÑ/}#Z8şw_~cÔ så£ñ«ü¦4+T´UäÃ{>³uz\Z->ŒnıÆÚ»IG9\\:C&_ı—ººÅ™dÿ¥ŠRMœoÑzqîE–‹İ9]š\0`•\0TñÜŞ®bõ_—œÎŞ½ë‡wÆ;FöØ½ı¹	!á_Fv­Yê/^-©ËõSq^ÑÑ	OjĞş¹–ÒÌ?SÔbQö¥²;ªğ¨,ÇÜœËnzğ‰\'/ö¿´1³\\ldWnUúhLg¹\\’‚STÏqz”j÷É„™±]ª›ìk2â}ãH\0\0`&\reêÓ`Ğê†\0¦z§yl_ÔñiDi¼{Ú€qDHˆ¨¡¨VÅS\nïçVOşÕÒ‹ÄNQMV*¸£\nlz®a_µÑ¢îLWµg{±|óg¿:ıår)8•nL&Íµ¦03ş0÷éÉ)ìÊ?P“h€\0\0T¬Ô¤Šœ£3‚û ×ª+|ùJó$¾ñò¶4ùJQ÷ÿâ™ÿ”Â„«w\rœ«hšGo˜DëU´pÒ•Òâ™Júÿë¹ŞC™Ñi—Ê¯şg¶-i¿ûáT€ÎæP*µ7ly|ËåRpŠ¢y2 êìÔÔñŸñİ)e€âì@ùu~ÃõÊ4 0«Ì5UWı—ÊĞÌ´ßHÖ¿ªç½o¾x`Ï«-mk£HJ÷1Ò„ôipBªşÇ	zCáèÉlÓ±KûR¦–¶â”©‘1f[o)T?ùiªçÒŠcå?+mí„sDFûü*_\\Ø!ZfÆ+¿’âĞÓ}qÔbßcfÛBQïçV—†dÜ¾~ËlØ¤”~ñÌ\"oG)Á¯¢Õ6öå7¦>f[Êb>=`íİìŞş\\WnU$ùÉ,g\0@5Ng–¦´Šçşfôòÿ4/\\:æ—ËÀæ¡çæ×Ì­¼p¾x¥ÿŠ:<j‹	gO×Ñ£´\Z8_Ñòæ•íï½³=1UïE\Z€QÑåÿRV¹ad¼–ÊÔïÊ?V‹òqVuíw?Üw¢7Zä“kÍ˜™Cvi”Ë)¥Ô|±¹Ze€8¬[†^(s]­4hftÊ×*îÿD–îí]Økt¹ßÌè:ÙËš‹‘uùMÍmU®É*>;‘ŸãÃùÜïa\0€i5˜­«:\0”ßeêÜ6ünËHçÑlëÉlSÔ:©;MlRÔ”M…îr®.G<¨ËF¡¢¢+¾Q#Fo\ZUcuë—`n®dTnÏèÀëØÇñKÀˆFéÅïùÌ—f¼çÏ•b«öşeZ)lö”€Q[gFo˜lØ2Ùê?ªÛ³§?rV4.oÌDñ¥È\0çF—Û8üJ9ÏJ#Lâ^éİŒø8t¼ùÒ™Ó—ŸØ¶#‚‹ŸöØ“Ò–Ç«Ø¯½ñôød\0\0€iviĞjöèÍŒ.Ğ;³»µş-…ı·dª¿ \'·2-0\\ş³\Z—İ”zÅsï®¦Òåÿ+YĞ ôvmºê”¦ck\ZôÅÙdVx½ëíêèéìˆZvl-˜¶9N›–•U]gmØüø/o+.y;òîl¸	P“ÈÔwâpœHQ\"_Y:§hMWé:ÖcO¹ÔyæH®åh¡µœ®wé«h‚©ÁóÛŸÿQéFSDÍt—&}Ò£‰Š¡7³ôd®)Åæ®½Ñb•N-¡7v$^¡êü\0ÀH“ë_]xÛFD\Z[=\r‡HW1£Æº#³«Ò7ÊÔ/‹³MÕ—©²\\1Ò3~-›ÊÍª{±GSì}ó¥k\rH×€£øÛ½ã¹Uëˆv¨¢bª4]c\r7ŠcRsÅF‹\n»ºÈ‡&N†ñ“ô?_‘ª¿p¾~Kä±x—}¹€¨­S¤¹¥’s¬TıÇ9vÇÈ®Ë?à…K?G°ü*¿iğBfÇó?ºç3[+Š¥ÀïR\0€éSšŠ»qysåNúaf»\0ÕÄ’Â©4¸kÿ®Š@ºŠ5V<·Ò±iúÿLqvÎ\n– ˆÚ1µù8MccÒª{±GYŸŞ(¼ØµËŞñd®étfiq.œßûæ‹‘6î«UÔÍ³§Hªş‹]eî¬&2½·g{iUŠh«–‘Îh´ËQ”ØÓˆ‹qÂT}á<S¼A±õŸüW©sÿøÜÒi;Uş\r‡Ø°Tı?t>‰DHx}ŞCıÙÆ7^Ş–©ğVp3\r(Ì^¥koU\\‰¼pîRÊ¸š\"Õ:Qı”¹ºp’†Bf.MæS‘£Ùtùÿ®ò?¶-ªÆÒÖ^³–½üI¦º©]¶í©RÌ¸wèçŸz6jÁ[FöGE[úºmøİÃ¯<2ø·¼›eûÙOšpM†«&¨t¦Ru¦”FÊ¶ßıpŸ…¨}SõŸZlóĞóÑ\\W&´h·;†w¥öŒF‹ì´ãùUÑhqÖ¥:;…–ñ÷+¾/ª¤»Ñ±Şâ©e}™³3¥±øé~T´Céº\0 \0\0Ì\05YæÒ%öò¥R,uæ©¨âL«7W²\0sOçŞÔíjœâìtvi*¦×ŞıpÕšg&~Ê>\n»ñokDñI –îEıWi9[º8=³ëÂ–FÊVq{÷çÒ^ÇA™°ÅJ\'Û§Ÿ­ºÑRP›[®%‰oª$.ˆQiªH“v§xş”—ÒXöÌuq\0àã\"])œ©9@§(d.­m\\i\0ÌÔU”Òåÿºù*êòŞíi;Ç©ÏÒØß4Ø´ÒxãåŸ¤ê?ê¹´Ör9ÎÜ;ôóªËÙt}:ÍF5SJ‹şVüÄ®”ã T4Œ!`©Ñ\"BTzá¼”Uj²õXé´‰“¹¢H»³qø•t[£ÌÚmÅHÏõq\0€9)Mç_œÕçÒµÉrÔÕ/h½Šß“­ Pª8[Ú*èıEUªÎÇï›‘rHc#]¤¥ÓÊéü]ÛrvfE‹¥¾p•öş8‘)Åà*1§F‹øEsz\n“gq\\ïä×¢¾2ĞFºˆy}ŞC¥‹”ËÌ\0ÓHƒÉ¬¡\0@5f¶ßÅlLêÊü~…×°SGö#¹–¡L}™ÍúfTTq¦+ëiHî„µlE‹S-»÷Í3•tş§œİñüÊJ‘&“Á¹¤ÒD™‘â*íıÿŞ;Ûcg£ä­z\n£h´ôÜˆv•Ş9)Í›î&c`à\\Evóç¾Z7AœHûò9ïÊ<±—NÍ\0o¾tåiuÿ/ùOigÛF\\O·ş~fmÉ›)V]ÕMI~]j)tÉ´ôtvœ9}ªüf‰j{÷ç¢è‰PNõœ.ÿW2mN©fšµl*g7\r¿úú¼‡¢õvoîÏlğ)Q¦Q\r3X¦{&ÍÎÆ¥í=¯fF¯aO&½ÄÇ9§D”Ë•öAJkQÇs¯u=Ím•n•/NËÏåÏãÆ)w.»8b@|5úš\nİ‘ÇŸ³?e€=ùûú/4F¤Œ¯±]Ñ\"ì¥ÃÎä;†wù×+w\0`ôB±÷íUW,úxj\ZéNÅ\\êm_¦b/ ÑÎ<eÎTÅÚLÅé‰&\Zş›ùpY·Š{ÿ—jÙIvÈú/\rˆ\r.ç’v§T§ÎÔ€ÓÙ¥éI¥–dGdj>0Ém¸mäİLå}ÏŠ\'ÃhhéÏ6^ë\n}jÕt¥\"£«oıƒ¯üYq–ªùÒ»Ì­Û>ï³/Õ}ñíü§ŞÏ­¾ÖıÃ”ÒôP)ã•¾Ja/ ú‡ë¼ÀĞÀÒRè<˜]ÅkE“è7¯l§Dı}.»xüZöh®µŠµ™ºöïÊL4ü7-ÑZE-[J“¯eSŠˆv8’k™pbøâ¬‘iÆ¡²×\\3å=\"‘\'?†5uëŠ-éíì¨hPxé@Gu~Õ[(éãàö8\\Å*\rÑ&îÉldå{ïè±ÈKqpdŠ!6JüF.ÉœŠïc7 M§ÓÉ\\Sêí6vO¯ƒ¥\0¸®DÕr0·.j¦(‹Ë¿Hu[±Ûô…óG³­·Æ×˜.ÿ7.¿©üŠ3-Qœ™èòÿ‡ËºUXêõ^x®á|,ë‡wË^\\jpàü•#’cwŠc…/Í84ƒıª»g;uq­ÜBOM6#\Zÿd¾©¸4XfkEOŒ)š1êì†^5Z4úâ@¼÷ÎörzdszÇWDât*ëíŒï	¹‹y#v¤´ZœNš2İ~«€\0\0\\\'~gt¬ëoqT-©Ov×ş]õÒ‰ß!;©b–Ôiüá¿™K“¾WÑÿçèh-ÛTè®aŞ;ôó´@ìîíÅE…K-90p.jÇR¯ô*fª­tÏ¤ÒËÿ©Å2£w\0j²Ñøû2«¸Tß¸¬9\ZótæšÛgãü}‘fÛï~xò£}Š·JVß•f)ôèM´¸u¾)«âÈ?`\0\0€:é¦Ë+-êG‡™–ÖYQÆÍ¶fëR%´$s*MéSİ%í\0Šuj%ÕX\n\0iZÆkurˆ—­b–‹ëL&(”Ó¾Wzc§bnÊ\0QzÉµÄÙ•¦\Z+-\'<ã“À\\JM•-äü›Ñz·†\'LqòœL]ßñŞŠÀâ‰VQˆ“ù`n]œ“o¼¼íÁ\'¾^Ã¦Îí#”îÄÛueWuåVÅ~µ¿ë\Z \0\0Óªt}îlå d(S?ƒÿºŸÎ.İ—ß˜:r”¤Ê{òÅêç¶‘w+ísœº)GSQÇ‰¨Û¢\r£úy?·úZÓŒÍÒSæğßRXéqLCÀ£ú¬yÏì´8Ôé‘¥{ÆvOEfÃµáÒØÙºù+LMÅaµµ]Â6\Z$Nã³§+{Í].;ÿ/³fäí]ù¢4ïxó¥öÊ×‡.ëRBq|{\ZÀ‘2Ş+>;)	ÄÇó`~]ÓHwŸD@\0\0¦Ğ@Ù³¶©<&€8\r¢²Ü“¿/ı…ï¢KC9£òHÆæZ£¯´ŸIÛÈ(\\zºönx¼üb½mõ]{ß|ñH¶åÌ®«–›GrÅdrKeóÿ_**æ	‹§s™bo–EK\Z+ÚÓt1{êÊñxå;†gi?R,©tÔÄÀh$«mî8Qœ²³ò{&ÅwK¶xS+NÎ8=ªXğ¸\"Ñ˜ñuûú-‘Šâºö^(~Tã+>V·\r¿ën\0\0ÀKÓDØRá<è™âuÓâ°×b/êÂlylvªş—ß´aóãWö}ïÚÿVÇ›/EH«(;Nä×—Î½åL·¬Ş5V4ÈéìÒ+Kê4Ih4ZùMıáğßÂÄ_]wöŠV‰\"I¥¶w\0RY<pá|uOÿFÜúá)¾ñò¶³§û¦è>À•IàÏlŸÄtC +·*>±1µ\Z;ÌZÖ€Y-]W®n)€ÆeÍ™\ZÕL©úğ‰\'¯:ò5\n÷G¿ôÆÑÁÊñàñ»I\\Y¥\Z%\"DùÏ*®í5úvQè\\ù·)\0¤Êôşèåÿ8FSW0õÕº;ûÇGZFcf½7ş#Kã­#£îx¡‚¥š\'©®~Áíë·üÁWşlíİ¤†wåˆÏc™«\00 SåRA¡i´ø˜°ò˜\n]ùUç²‹£ØüÙ¯ÓE\'ş*âA)TôiÍİÒ5ørŸ5z» Mõ3Vlmj¨Ûï¬`şŸ2‡ÿB9™¶”z:;şéÇYÎJm5Ô~÷ÃŸÿÊŸ·¬lOaøõyÉ\0 \0\03ã†‘â¥ßÒ´ŒI3Vte½&¢nx?·:~Xµş	{¼Œ®iú¥T‚_Y—cIáTêã‘zá—©y´{Ï`¦î²÷J\\¼EPvwó®tgff\'Êäz`Óğ«Å‡.œãåm?ÛöT¥ËOF|#±oØòxºp €\0\0ÌŒR?æŠ®s\'M—ºTTXO^W~UTØuó”y5½8*±ª¬’fô/ÎÃSv‰(ñÓ5Î´àWIúßŠÆ_¾?z¶œá¿PÁÇv¤ûÓƒÏ¦TÉÇó?úçÿÕ{{¶O[§ Û×oyğ‰¯ÇçW\0\0˜ó2)ë­ø2s]ı‚Ôù²bwªõdW¦bºüùyRÏûJ{+E‘”–Jxïíå?+İèÉ­,U6<Òİ[Vo*óEÎœ>ÕÓY¼4«ÿãŸ\'é‡Ô—¯üOıúá÷ı<ıˆÙ½ı¹ÿşôØñÂ*Š»U‹ß>ñdúHVÚ7\0€\ZHE@O×Ş*›®vOç€R1]ÑbºUKJ+ê-]Zä+Mú™¹4ü·qùMåOÑ3\rÃ“tgJûqEŠøU~ÓëóŠ¯(øŞÏ­Nqjœ5Ë`Ÿ-€ÊoÅ?2À§‡-İÈœo¼¼mz’@ã²›R_ ø˜Ló-D`\Z˜f»(1»r«ú®b=à¶ÕwíŞşÜ`¦.*¼ééªŠé›o­zå²ŠÜ2²?\Z§x=¾«£Ìé;ëêD³Dıt4ÛÚ’é,¤ŠKŠ+\n=sıìŠZ¿8¡êØ£³™Ø«}™Õ-ÓVCU¯„]W_\\8lœõw«K¶¥h1¢ı×ïÌï,.š‘mM©5’@\n±=ñY‹3ÿªmMR|\"zFŞ—ÛhbP\0€iuCáhqP`¦.ş%^\\á\"A¥b÷`nİ4€sÙÅ)\0´•İ—fòåQZ*áııo•?óÊöh“¨¥Î,ç¦ò·tg`âsiøo\Z„PşqŒ÷:ÖÛYQ­VÎR²UÛ“¿/¯”ÙÒİ†4±R1S.ÓvïĞÏgjUàªWÂ²8v¡¶–:ŒU\ZkûNÎTuùÿJñù¼:4\\\\. ’ÀÉ\\ñ¼í;~8¾R¸tgùMñ½üŞwã»ç3[ÿùÇ•èË\0 \0\0Ó*şéjì½=Û«X%´ıî‡£ØM¥ùTg€_å6¥\"©ÒíœÌrWm#Næ›z:;Ê¿NQ!­’V,¤FËÄ–•íå×LiøoôÓpu|Ñ¥=ºêâe5©şã`mØrù‚ÊqÎìŞñÜà…ÌëóšÁ¢oÙ+yVšÊ©†]€¢úOT*]“xptá°2\0Ä§üqN6úæeVŒô\\Öòñ‡)	d†‹‹º<¾§m‹ÌSš* x[`e{s[û$oÄ¥AóÅÙ•M\0\0`\ZÅ?ùQ«U×(•ãQÏı*¿)ê‰q–#¤(DRùRÅ:¦“Yî*ÒÑÂÜ™H8ïïßUş[·´­6‰VMÅÓ-e\'–‡ÿV˜¦¢¤+Vl½‡Ú3Wtøâ+Ş4[Ã*ü`~]ªşïùÌÖ«¦µøÃÆåÍ¿xæ‘\"*lz~FÎüØåØñt½|éK$‡Z¥¦“¹¦±¯\\¾££ù„\'vÔñûrÇ»H¹ô`n]„ÌMÃ¯^u/âeo>šòIlaJé‰)ìŞş\\ãò›âPV4\"ÿ2‘\"â„/¶À°ßÄpı0æ€ÒÅæ÷öl¯âéÅë»£k|Nİ„¥¥£Bªâ6EºrYšó´â€4:Ï=¯–ÿ”4Eiªş£qÊï>Ô;:/{]f°Ò\0àÙÊun¾´6S\r£ZT–©Æ9XËn*MSÃw¯ôÌÏT¾FJM™1ã¼\')Í£•†ÔW–lG—ğÿNQ|pvåHÕêÓ¿öîGâ{\Zo¾}ŞgÇoÿ´0öÃ»îúù#ƒÿ¡mä@zÓhº4ƒĞ/o«nAñ±iÊ¯b\0€i•¾­nêºú6_œĞ#­xUs»æ=–ş½ç3[+}ni©£´êY5`´¼p¾üé€¢º-İKI“–)õ·®¢3UiJÇJë°T£G^«\n,Eµ¨/ÓY1~+¥wŸ¢ÓfB—æÀ­xŒ‹©)[ƒÜá6\ron«,\0ô8œº\0sàWùM¥qóğ•?{të7|âëíw?ßÓÏ¥u²ËÒP\nŸzvËĞñ{#¥FuËŠ•>&)\0À4HSF=QÑœ÷c‹ÈTÉíËo¬ùÕÜRue}{G{Ô¤NÏÕmÀÂÂ™KóV²*ğ¥ºåYN£c3ÿMJ½8*-gKY¥+·jòë`~]ºØœ`PéVÉŒLZÊ„•V®iN§Ò¨ôÉ(-lWş0ñ±:NÎkİˆOM:¦ñÙŒZÿÊÏNš?e€·ç}ªÒ5¹â”‹$ğğà]?¼3ıöØñüªHS€\0\0ÌŒ(SÑy`Ï«ÕÍÿ}Ïg¶–®&Öê‚nêù“j¬µw?REçŸÌ¥%&9@9=½T —Š2£8ËïØFÕÃWŒôdªZÓ-mˆväÌ6§³KÓ¡²¾Ìñ¬¥‡Ë,‘Ó>İH)±|¥%ŸSg§Éœá©ÅV­ Ònô]—‹ÆR•?Î}³xÓÍŸıjêÂé½êOÇ§ŸM-ùÆËÛü:\0˜3Ú†Læ&@(]MŒJâíü§&yM7ªÉ×ç=TšI¦Š±¿©HJİ$&\0JEyÇ›/•ù”(m£5šËîØ¹+•tUojÕkºÉ-¸_å7Uzø²´udÇ‘ÖæÊiŸZ»ŠFkİÇ8ÉS]ÔbQ§;!å‹ š†.\\k±ˆØ°çÖNôÁ)¯É$ÀˆR‡_¹¸aª\0`ÆŒ½	Pİx¾ºúnıFºò}$×²cŞç¢6ª¢ ŒÚ%\n£íó>›ÑŞó™­UtıOR½EŞä§\'JÃ$¢R,ÿI4Eùë¥ê¿Šá¿%M…âDŠxªèŠzìDƒWw8r¤µt¼6î«µš\'~\Z”\Z­¢õSÀKUûÁÜºêêæøt¤aÄÑø•¶Ø„kE§-Ê¹gizX|îªN€¥ÎHz\0Ì%mÃÅÉ=¢ú—ÏUı\"Q¬KÀÑNQı²îQU¤a‘ñ°xğ/ç}!]øo\\~Ó£_úFu=RI’Ìm#ïN¾qJÃ$z:Ë½Z[^ş …ª‡ÿ­ÀR/ ÷+¬eS9›RV´|¥UàØê¿Ø¬’ÉìKW‹ËœÌ¾æJVÑ\0dÃæÇKèË9Ã?RÁçV§îCq’´´U<ÿOš“*ÍOuU—h.w_FçòJÙ»úÆ=ˆé[™ªëpÌrÖ€¹õ‰X3òö®üÅ¥yº:ª¨K.ÖÊmíM_ùó¨h‹#\n.kÊÌÊLşbGšT%Ô³çı8—Y|:»4•,IÔÍíw?\\uéŸ\n‹Òåÿš¬¨•æ?©hÅ´ò/ë–FLv¬B¡óH¦¥¢eËÆÆ•³§ûö¾ùbê\n²~xg9+\'¤Ì–¦p¹Ö¬ÿãïxfÜ‘¬Óà–‘ıGr-inûJgâğ‰\'ñÌúOÍmÙwo8j¦¾RéÚ4Ww·jÕ±í²yæ—·Å†íÉÜG¿ÒWˆıJ·-i¬ ïM?T·L \0\055îŠlOo¼ü“(â«îËOŒ\nşö;·ôtîŠ9õW.ö”ÈNTÂ®0:™Ò?‰B6ŠàºÌ`M.ÿ_,‘G¤Óª¨\'*éŠ—Ÿ\n}“\\Xª´lY„Ÿ**Ë8dQ½E¯ğú¼‡¢&‹óªë»Eµ\'I©×øè­_ª\"1N8’u\ZW¼*ÙûæK>qk¥çy)Ì­ëÉ®Œ“äZ]ÎŠËÉåVG£¥¼T]õ_f²-Np”«¬7NlOß‰Ã‘ÛccS7\r½Z~Ç¹t¨ŠéŒÒ˜õª×è\0\0 6Öï<™ûÂà…Ìöçôà_ŸÌKEy”fªåhï¡ß?Üw¢w`ôâåàÀ¹Ñ,Ì\\ZYéÆæ•µªª{º:RšÛ†ß­á¥å¨Î£RéÏ6F½^Ã\0P\Zş[ÅìŸWŠÀ³\'_¼`ùSñ\\V6.oŞ½ı¹¨£&>™oÚ“¿|Õs™ÅcGx§yfª˜¡5Ş\"%Ã\Z^É®²Ñ†ßú5¶§Š_ièKå‘9£Yöå7ÆW´XœxK2ã\\´äØF«:/eF»Š•Ó±-MÏŸ•[ş¡Ù°ùñúú…±#±Á¿¬ûBœmÃ&Œñà8åÒŞÅ+TtÕ -f\\ÃU¨\0¨îs;`Wş¨‡vïxnÂåœÊ,’¢Ü©ºOQE¢âyãåŸdF¯ìÖ¤¤+^0•×Å>Ó5\ZêZ\Zş›:£ORÓïçVGJ‰FˆÂ´ŠW]£÷ëqôßÛ³½gt~Ì±½³><¦Å×¶­ŞTuÚ;z%;jåïş?™_íw?|ËêMŠÃÄ/œ‹¯#™Ë—\nZ¼84üÎ-Õ<}\'Guªÿñ“m”ÔÅ!+™ºŞ®òG¢§ùå7E;^(o¯h™H2iÍ„RŒ¢([ßd[RéçCü®¨èŞ]|TÓ=ŠkÍe\0Àôi\ZénËèÊ­zïí¥åZç„Áó;^øQT`Qıl\Zzµæ¯ÅĞ¯òÅºªx‰}ı–š¼f\n\0Ñæ“Ÿª(¹cx×ëóê;~8êÑê¦OÍŒ^×O•}ñ:ı¥EgK¥œ“¼ÒÓÕ‘Š¿ØÚÙpæÜ1²ëd®)ªŞ¨}7ö«U¼B÷Å«2[G‡t]•¹©ùÖ4!O÷dÆJÉ6Jÿ¶áåDÁô®ôDMcx\"i¤Á‘‹ŠI&7ÁÙRÅ] 4—Q|T¯5— \0\0Ó[\rï:—Y<zM´¸²Ï\\É\0ÛŸÿQêU²qè•ZÕÓı¥6Pu]uUQ[§\rNÓŒÖÄ\r…£ñj±‘QÃ5¯lŸdÑYJµÍi¥»4³dôgTÕqÎëìxoÏ¤îT´Øhõ¿-*ë‡w–snß2²?Î!QÇWúù­«/^Î_{÷#={#ÌôèMo}å6./^ ¨â‹s ÍeTóÛt€\0\0T/êŒsÙ‡F;“ÌÛ™.*—9ƒMuJuÕd&J*Ic&?ü÷2·\r¿{2ÛÇîÏüàÑ­ß¨¢ƒş”Š­Jwiª˜mfêD´‹FëÉ­Ü½ı¹4|eöl[ñéNÑm#ï–ynG¤‰=*îÎçZV®­¢ÓQiÏØ¼:xá\\*ı\'¹G‘NÓ9PÎİ`n±\0Ìé?pïĞÏÓQ[wU>»ü´½¢|q£¦œÒA¥QW¥\nìıI7HlvZƒ¶æAÓÊ¬iá‚bŸ¨Ù4ÛúØ+Ù38ûçU­~»tÂÏ­âÄN!<Nìrf\Zı0¼›Ît¿eòR×¯ÉWÿc‡éOÅ:@\0\0j–vOb°)­şñÌ¦§úOÒ[¤éö\'UuîMAk2ü÷Ê Ç.^<ªíâ÷Y.ËiåôüNYëètÕâcOø_<óŸfCè-Uÿ±U‘O*=Ò‹8WÓ‹Ì}\'Oİ0}`6ÈÿÅ¿iÔ\n0ÇsüğM#ÿãBvÁéìÒ“G>8ÖÛycó­õóÎ’Í;Ö{è¥ÿöÏî›¶ê?•b=¹•CÙúh‡É\\\r}ãÛÎŸım4ïM…ÿ1Û9?sş™ÓÇs7={ö×;÷“«,Z2³9í_?8PÑ‘:™k:™mJ“çT¬º:â\\]˜9SÅùNøh´8ç{»:â/[ñÉ™j´ˆÜ{v¾N¹H&U\\,\'ËÚ‹²;>&-+Ûgö›Qê\0ö?\r½­íw,\0À,Í\0Åyú²Å¹ÿÎ>Õuà­ü¼º¬ŠJåÏïúÿûÈğPwır:\'Ls FkÜ~g•£E£J+:İ9üzTêS´‹ı7şõ_s·>øõ¿D\0h\\Ş<‡rZ´óáÜ\'£×ŞıHùo\'F$«–BguCAÆf€H,¿9q8²S>?ošOïWşé‡|\'3:÷Ô¦áW«î*Ÿ‹R˜‘}{\Z¼òÏ?LÕä™´(8 \0\0³Wš°åh®5JÉ¨Šõv¦¼fdcºö¿•DZF4¶êîá_Nób¢Q»¼Ÿ[UZ´@u%õ/DA¶°pfÕÈ¿Lé¦Fºˆp<{Ó…á\\oWG”€7¬øä´İÃ‰&Š¶{Çs)§mşÿ¢¶®`ãçå×ÄÑÈ\r7–ó”3§O¥«æm#\"ÿTzo9˜êæÓ}Ç~İ±sÉÒ¦27 V§w¼oÚ‹ˆL“¼R^Ê\0ñš*5,¶})‰¸ûÆËÛÒiÕ¿Å¿@\0\0æ†¨z?9òëÔ¨x+`ÿ®éQíxáÿ·N•ÄêáwÖ¿YZ÷tÚÄ;F#œÉ6D[Åt1ñ¬·^ùo±·ìm,œ˜ê­Ğ:Ò[_Qvxkdx8Jê)½û¸ÿí_¾öâßŸ<òA)§Uº³Qø¦v>ö·e¶óÁ=;õªÉCQ7Ç9*·¢xÿäà;Óp¶Ç–G•üŞí¥¼T«^ò¥}9?00=ûrÙg¶§«¸¨\\±/ÓğÏ«fÀœíªM+Àõçd¶é`~]|OÿÛ¸ü¦Û×o©nªÁò«É(#Ş{g{iÜmqF”‰ÖCêFx}ŞCñÃ|åÏ*-¤J#;üÇéœåh®uOş¾ÁÈ/£ëyW¥]¿¥æU`ß‰Ãq¤Òš¸),İ6ünÕ…l©7ly|Âéùã­ö“§2£àT4aÎ8Îeÿ*·éHîâ²¾76ßºöî‡k>ÓÿèDŸ»JSÅé½føíšŸ±/q”>¹S´/¥ÏlOçŞ7_*}fkxP\0\0˜1 Xµ¬lO³Nrñ©’(¢$êíêèéìøğ]fºô/y©î‹QL¯½û‘JÜıÙ¶§ú™ş‰ğ‡2õ]ùUÅşK£1 å·HÍmí“LQ|÷vvDİ_Z4*Jÿ¨ûÛ†L²-®Ï•[?Üó™­ãÜˆSeûè:Ğ\r…¾ÍCÏ×ülÿU~Söâmíh«æ•íÕ­uY£Eéß;fF©\nG£JÒõÑb_¢I#Ôv_JuÿÑøÌ	¥¤cwfá¬¯€\0\0TétviWnUqlÀ¥‚23zu¹qYsSó­‹–4¦^òeŞˆ2èìéSi}Ü¨çÆÎ³ÕdTÌQPÎ’2\"ê§_ÎûBü°ùs_­hE°Ø©şñ_Å÷ı|¦ÖÁM1 \'»²T¦B0Â@¸›WÖÍ_8a9h`àüo‚¯ïDo©ÚËŒN@Ù6r WM®aÇÖ¾>ï¡T|GÈl¿û‘Ë¶-š´ãÍ—Ò¬SÚÅüÊĞ–ÄM*ç<OgxZ^7Úml£­é‰Ó{ÚN‰øÌÆ\'wì¾ÄÇ¶©˜ŞË=.ûÌ¦¸~ÙšÁqÄ™ Ç?\0Àõ)ê‰#Ù–¨\'ÆÖ”c¥Tp­§_VA­û›FºWzÊ™6~:¥ËÒQÿıÁWş¬¢\'îŞñÜ{ïlùÓCÏÎ’£vY~ÿ¨³BVìT©¨ùj^ğEˆ/õÃ‰f_té~ETŸ¥ ØPèÛ8üÊTGÄ8ÃßÏ­v»ê©a ®ş*c¬ÇnçX±ÍÑbM…îI¶ãïKfÜEÇ9\"ÌÄÅwë|\0\0|,D%1àtvi¶1¾_«²GTBQ¥y‡fçµÃ¨GY÷…Øµr:¦_æ¿ÿğ?DÔY3üö¬Z©¸ÎC¶)²RG—rÄ1Šƒ‡)~˜ê6‚ÊÁÜº«n^¼õm#ïNÏB—5Zj·kĞWUj±ih´Š>¶¥OnuŸÙ%™S7Œ©ûZÀ,1OÀÇĞÿÏŞ½ôÈ•u\0ßS÷ê»=6šx¤Ì Ñ\0CD`Dl@B¬²eÉ‡àkğø\0°Dì ,ÂPÂCÄ\'Š!ƒã¾Õ¥«Šs©n·=m»»]Õ]uŞßO%»Üm·İÇuyşç}÷ä¥ÀƒY^‡=/Åª6ƒ“Ø~Ma‘WÍÙ¨ÆkÑ-ğ¨ñQ^ıWs´Wûƒ?©:n¸T}£ü°Ÿ?òy9x6æw^,mó\nï¬ô¿áäıéò[U¡ı«Z³ñmÅê }9<<ÿ8/Bol]ø¼Èo+û¯¶NŸ¶Õ NÏY@\0\0nÔ¼Rœ…ûáGõøÇb&5¯ş¯ºñÑ£‡ß­ªÿo(ªÕê:M³•û·½”UVíq^óßó@³ÀÉ ~ş+û¥êôóU›ª)É°z§ÿ@\0\0¸ØIhÿ°ñ•Pş¿ê¾™ÿñ½¿å¹UMÒ\0\0\0ë!¯ş«îÿ¯~ã®úg«}*Ë	\0\0\0VŞãìƒGÙGù~í·¯Şı?ÿ}òï$\0ueXO²÷ªÍÏ>2ßÖğtØô$¶\ZT×£½÷¥_¼ê¥sŸşã_‡uÿ\0\0¨yéÿƒìklâÃã‹~^ıã÷şèªËÙUßŸ:ı€\0\0pKg|¯ñ[g•ııs=­vì9éÖ|ü¥÷?¾êÆÿ•-Oÿ¯ìuÍ\0@\0\0êïIö^Uıç¥ÿ×¿ù­«nésyy¨vÿüpò}‡\0\0àvü ûZUıÿÎşñRÿ¢³Óÿvÿ öì¬¨ı¸Wõıı›ßZê_ôèá\'Nÿ \0\0Ü²Ÿfòwßywy?¹ñhğÏÿ—ù_˜>vú\0\0à–µÚ½¥~ıï|ûÏÇÃA+Œyú]G\0\0 Î=üäñgŸ†²ù§7;t@\0\0\0nÙxt¼¼êÿ;ßş‹P^ùëËÓ‡5\0\0Àmº3-:òŸşïOÎïô¿ğê{öôW&ÿäh \0\0Üv\0˜=©Úrş¥Ò]”ñh—şgÕÿoüM3Œm\0ÒÑø“ßßu€ÕÔ\nã\'Ù{ûOÿçhÿéƒ>~û/øèá\'ûWöùOÿ;”?_üƒê€Ô¸°ºò\ZıóxÿqöAµUÿÇ¿ñ»>øÕV»{Õ¯óôg?ùñgŸæ_¤ê&ÊsÅ‡“ïëû MñÙŸ¾ï(\0«ìß\Z¿ş(ûèì—»ï¼»{÷K[{;ï¼Û.Ã@«ÓÛ½ûnõÙ¼Ä?*«üòÎÓ§?ûñ“ÿçx88*>œÚó\0\0`…Çf_y’½7­ë}…¼â0û,¯ş•ş\0\0\0°6>÷?Ïîï‡½qlå÷_ó;[a¼5û¿¼Üß=½3{’ßwô\0 ˜\0ÖK^Êß™<yéƒ\'¡ı,Î÷3è…Cçø@\0\0êıB6Êƒã\0\0—á:\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0° M‡€Õx$Æâ6\ra4u0\0\0\0V :?»>Ûxá³ş‘%:™·—LgaüÂgy®˜ûÈ@Ì\0\0\0’-ë³Û§Í`ì¦+ø…†“Wyİï(²ÁéıáüŞìd:Ï%\0\0€µÑÍª96³çÅ}şCÛìÇ9çF7{e`˜ÎÂh6¿S./<	Ö\0\0€­_Ëš>fqŞ£Ä_†üğv_ÈñU	¡\\F˜Ç\0€\0Àuÿ¯Êâ¾*ô[±¨GÛå¬ZB(—^ş©V	ò00;HÈÓÂtæ°\0\0/ÖúÌı:¨š‹¾˜\rª	„óÁ@C\0 \0Ô\\^Ü7Ë1Üê¼~W­ŸØÿş…Á`0­†\ræ­D–\0\0`myyj¿*÷Ëû	¸pù,X+\0\0€•®äòŠ¿UœæwvŸ§‚ê2Ãé¬*˜Z(\0\0€WÎæ—ÊjÅª·Ç!a™ÏàXËç³j¼x4MD\0@\0X’ê\'Sñ³´ûb$8[%8™VÙÀA\0€+ÊıvŒF±§&~VıYş…U‚je`2›\r&–\0@\0àòú©Û(6å´û>uH°ÅÏq§|¨º††Ób¶xtzyc\0@\0HN¹#gÑØSvø8Ôú¡~n‰à,h\0@Ñéæë\0 \0(ú!İ<`~\0\0€5Sõô÷ıp­<PÍœ×#›§ÅUÉ4€\0°zßnıÆüd¿A^XÈsj³CcşË<TÍBÕE‹\0àvTE¿a“~X®nö¼YÈâ\0\0\07û•]\n½FQ÷·ò<[˜a ŒË+„\0\0¨Å¾Î~X1Y¬¢ø|r ê2F\0Àõiò5Ru\nUa ˜\r\r\0€\0pÉº¿hò1Ñk«¸,ñéX\0\0@İ©‡£‰\0©\0u?¤Îf@ /¶šê~H×ù™£É¼GÈÖ¢\0P·\0ĞŒeİo®8§ßˆıÓ­E¦³a¹,pb`\0\0Ö7\0dåŞá\rûxo~­Ø,Ã@50p¬G\0Ö+\0ôËºßu»€«ª¶ÏõM,\0Àª€ªÕg³¡ÅX€ªGh¯U€³0\0\0¬D\0(Z}šÅxÀâ_ŞbØ>!²,\0\0·\0œòn˜e\0¸\0à”?pË¯y§ËÓÙ|nøÈU‡\0–ğ7›aÃ†ÀÊÈâ|Yàn±‰ĞìpâÚ\0\0‹ĞÍŠSş›6öVX;‹Õ¾Ã\Z„\0\0®O·°~¯ˆç\Z„N/, A\0àuªKól5uû\0kìüUÆ&F\0\0.~¿,®Â³eo ^^\Z°—(\0@1ã»ÓÒèÔ\\5*°×’\0H8\0(ı”“À O\'áÀÄ0\0)\0¥?@7‹İvØ™…ÃÉìàÄ‚\0\05\r\0J€_ÃN3î4ÃÁ¤X¸˜\0\0µ	\0J€×¨6:™Í~>¶k\0k\0”ş\0—}Yñn;ì•WÈ“€¾ \0Ö,\0d±X×Şn:R\0Wpv%ƒÂ\0¬M\0°¯?ÀÛ«…÷fÅ„À¾Aa\0V6\0l6ŠWóXˆ,†ífqVåh2¿†\0\0¬J\0èfEéßÍ\Z€Å«®+|bçP\0V!\0d1î™ô¸—ŞÓC-\0pÃÚÙi\0Ø.ßŠ´ûÜ¤óÏNì\nÀrm6â^«9ß±NÏÀmq)1\0–í\\³O3¾Ûqâ`%œ]Jl¿Ü9Ô‚\0\0ÑÎâİVşcõ+m?\0+¦Y¤Éo“Ù±	\0ŞNÙös¾æw…/€~ÉŞ´e\0×õŠ=~\0€ÕfË \0®áÅ¶\0`\r¹†\0\0—´İ,Îı¿‚\0\0°VÎ/OŠYa\08“Åxï\r;|æÀ0À\Zê7c¿öfÅ¬ğşØ‚\0\0ÅZñİö÷ø±\0°ÎòWùífÜn†Ñ´Ø<ôÈæ¡\0‰¾¥¿q™ßÛ´\0\0P,vÚEõT^Txäjb\0Éè6âıöå7÷×P#ù«ÿf7[ÅÕÄÃÁ‰€z¿ìÇİVØn]éi¨£fŒwÚ!¿Mfc›‡ÔP·ßé›C\\õ-Â\n\0@U³Â\'Ó²5h\\Ü`İe±(ıû×<•o\0 Í,lgq»UÌ\nç1àHkÀÚê7‹ê?»şI|CÀ\0)édñ^\'L;y(6h\rXÍò5¼ÛxÛ/£ 9Y›­rVx\ZÊ$ 5`µÅ½N1ì›- t×°fvÛq·åÕÄ´¬ n#Şí†v¶°×~+\0\0„n3v›åeªÖ ‡àö—÷ê†ÍÖb¿ª\0\0¿Óœk\r\Zk\r¸MÛí¢í\'[üÉúfˆV\0\0xQ«ö\Zq¯†“Ù³Q8k\r¸9½f¼Ó\rÆ’¾¼\0\0^­Óˆ÷z!¿ífG\'E\0`yšYqÖ«½Ü¿Ä\0\0o¶Õ‰[b Oû£0²(ÀBe1îtÂÎRz~¾\0\0à²ïOù›Sñ5š1àĞ\0À\"lµ‹®Ëfv3›\0\0ÀÕµñn/ä·ÃñìhlH\0àšzÍ¢ôïŞhM®€·°Ñíp/„ƒÑìpdH\0àÒexïoÜpé\Z\0Ôÿ\0¼½­vÜjŸ	ÃĞ\0À«Kÿ;½eOú¾6\0H\0\0,J1$Ğ;İb6`8{64$\0pşE2îvó×É˜ô}}\0\0€…¿½da¯÷zÅ•ö‡y0$\0(ıo½ô?\0V\0\0XšN3všápX\r	Œ$ ÕÒ?[‘‘\0\0nD5.œ;,‡ò$\0P{[x§cû{^:\0X\0\0à&m¶ãf9.œ\'ƒ‘$\0ÔÓö*–ş§@\0àæe1luãV·HÏåÆA\'\nP‡·ínÜí­fé\0\0àVß,w{Å›åÉ4%`}_ÍŠ—²ü–­úéu+\0\0¬È;R#ìöãn?œLŠËŠí$`}JÿşZ”şg\0\0V-	Tk“ğlX$±ËŠ+©Õ(\Zı7:ëRúŸ€h\0€Õ|gm†»Íxw#OfÏáp(	\0«¢Ó,Îúow×ñßn\0€ux£½·ò›$\0Üº^»81Ñk­ïw \0\0 	\0\\Âv/ŞÙ­lİ¿CÀ\0¬chÅ{­po«>Í›–¥ÕˆÛ½°Û_¯Fÿ×\0\0Xß$Ğœwâ\'áp(	\0‹ÔkÇínÈ«ÿz1@-´›ù-îmIà JcG¸,›¸×V-¿?+\0\0ÔK«öúÅ;wG³ƒa88*À%_@âîFØéÕ¦ÛçUÀ\n\0\0µ|#oæ·¸İÓò\ZÃy8\Z÷¾h»wú¡×Ná{µ\0@İeYñÖ^uñŠ$p0”€òLÁÙ)ÿ,oZ\0\0 %›İ¸Y^¸§ØHô¨è²‘(¤y^ 5ØÛ(6H!`\0’ÔmÅîN¸¿S\rf??24IèwŠõÀÍnhdÉ+\0\0¤­\ZŞ(NN§a`T\0êúL{›EİŸ?å“g\0JY#ìlÄâşÁ`v4Ç\Z„`íşf9İ[Ó\r=¯\0\0€U£ó¡ãrY`è¨Àúäù,låÏâ²Õ‡‹€\0\0x…V3ìmÅ½­¢)èh8Oc†•­û{Ezßì9¯\0\0À%\n‹Í^¬ªŠá¸Ç–@İ¿À\0\0\\I·Ul\"tg3LgEØ?¶,\0· Õ,ê~ıı×	\0\0\0\\OŸ/äàà¸Îo›ÁÒäE¿Sœìoéd¹~\0\0\0ŞÚÙ´@®Œ³#£Ã° ²o«§ÉgQÀ\n\0\0,T¿›ßbØ™WI`0r`àÊ¹ºß‰[}uÿÂ\0\0°çG‡…¸¤n»xÖlõB§í`,\'\0D+\0\0°|FØêç2s“<”×\ZËó€0\0¡:Ùß°Ù/\Z~Xn\0\0\0n:d„<	äy\0,úû]½\0\0$B5@<˜Âpd7!j¨ÛvÜè†~GÑ‹@\0¬Œj€øòş`”Ç€yĞ)ÄúFÜyÅß-zúµ÷¬F\0\0\0VR·]LCîlÎYfƒ2¸î«_ñwŠ°Óü+\0ÀZØèå·ùÛödZ,æy ¼±õn=©¶Za£låWñ¯A\0\0\0ÖN#;½ÚÀ©rC¡Ùh<ï2?À²‚h7dYìvæg÷»vê\\Ë\0`\0\0Ö_¿—ß¿©O&U˜NŠ;y0Ğ5Ä•kıâ1šyà¬ÊıVËQ©G\0\0\0j§Ñx9„rªx:\r‡ÇùİYµåè`h­€¢¸Ï0v¬\nıò¾i]\0\0¨EÊ†^j\0ŸÌ×ÊlPÄƒ**<OrÂºÂ¼²ïwª*ÿì—åƒ€ \0H[«5oíè÷ª¼¹8È#A•òä0:9\rÃç±á4Kp#Ñ®3?aßjÆê¿²}:Œ›*s.Ÿ—€ú\0¸ª^ç‹{eMq>œ­6T™áxøÂRƒY…ÊÙúy}ßÆÙıçıFÏ¡âZ@\0\0–j£ÿªÏ¼¹\n)VÆ|p<¾ğ·CÏ¯øÔ®×ÚÔjç×/£Û‰vÒñ¬|»e÷Ln2\0\0\0¬ª+î+ï¼&\\&\0x¦\0\0€\0\0\0\0Ô0\0¨ÿ\0 ¡\0 \0\0@2ì\0\0	±\0\0\0\0\0\0PÏ\0 ş\0€„€\0\0\0\0\0\0P?v\0€„X\0\0€¤@\0\0\0 Z€\0\0 !Z€\0\0@\0\0\0\0êH\0\0$Ä0\0\0$Ä\n\0\0\0$Ä\0\0\0\0\0\0@i\0€„\0€¤€ \0\0H\'\0(ÿ\0 ¡\0`\0\0\0\0\0\0 †ì\0\0	±\0\0$Ä\n\0\0\0$Ä\0\0\0\0\0\0@i\0€„\0€¤€ \0\0H† \0\0Hˆ\0\0\0\0\0\0€z\0õ?\0\0$\0$\0\0\0\0\0\0€ú±\0\0$Ä\n\0\0\0$\0Ôÿ\0\0P\0\0\0\0@\0\0\0\0êÇ0\0\0$Ä\n\0\0\0$\0¢\0\0\0\0©Ğ\0\0	Ñ\0\0\0\0\0PGZ€\0\0 !†€\0 !V\0\0\0 !f\0\0\0@\0\0\0\0êH\0\0$Ä\n\0\0\0$\0ì\0\0ÉĞ\0\0	Ñ\0\0\0\0\0PGZ€\0\0 !†€\0 !V\0\0\0 !f\0\0\0@\0\0\0\0êH\0\0$Ä0\0\0$\0´\0\0@2´\0\0@B¬\0\0\0@B¬\0\0\0@BšÑ0\0\0¤\0´\0\0€\0\0\0\0Ô\0\0\0Hˆ\0\0\0H*\0¨ÿ\0 ¡\0 \0\0€\0\0\0\0Ô!`\0\0Hˆ\0\0\0\0\0\0€z\0õ?\0\0$\0$\0\0\0H†!`\0\0Hˆ\0\0\0\0\0\0€z\0õ?\0\0$\0$\0\0\0\0\0\0€ú±\0\0$Ä\n\0\0\0$\0¢\0\0\0\0©Ğ\0\0	Ñ\0\0	±\0\0\0	±\0\0\0I\0CÀ\0\0-@\0\0-@\0\0 \0\0\0\0u¤\0\0b\0\0’\n\0Z€\0\0 Z€\0\0 !V\0\0\0 !V\0\0\0 !V\0\0\0 ©\0` \0\0H† \0\0Hˆ \0\0\0\0\0€:Ò\0\0	1\0\0I\0-@\0\0-@\0\0+\0\0\0 \0\0\0\0õ\0ê\0\0H(\0H\0\0\0CÀ\0\0f´\0\0\0é\0-@\0\0R\0Pÿ\0@B@\0\0\0\0\0\0¨»\0\0@B¬\0\0\0@R \n\0\0\0\n-@\0\0-@\0\0+\0\0\0+\0\0\0 \0\0\0\0õ\0ê\0\0H(\0H\0\0\0 \0\0\0\0õc \0\0Hˆ\0\0\0H*\0D\0\0\0R¡\0\0¢\0\0b\0\0\0b\0\0\0’\n\0†€\0 Z€\0\0 !Z€\0\0 !V\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0áÿ\0¦İöW%º\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0ÿ€\0\0IDATxÚíœmLSWÇÏé½méµ]2ÇK	o†èªq›3¨E6p/Æeóƒû #„ÑÙm~ÛLX–™%.ûâ¨–|Y|‰Jº‰h&¸¨f/Í§ÙÄ¡Ğ©À(o}»;··é®ÌnYé¹åyBœ{Ï½§?şÏsŸs.ÿQgD`‘™\0,€°\0ÀX€\0`,€°\0À\0`,€°\0 \0X\0`,€°\0ÀX\0`,€EíÌ0—°şÉt–^…±Tlh+¿§\rK‘”´iÂooİGş¾Ö1kvK\'_ñ8¦\nó^¹–¹¸]#—÷1×‰ŸòR±(±k]Îä©Ÿ %óH5Ï©Ã¥tªÚ˜{ï(„á©Šøñ{¿ù¬\r;T¶”¢H¤BY$Cæİ5P:DÊ«|¦t®Ùü9Àš!ÉO[oRX\'›Q$)À\n7mŠëÒ	åÒm†!-¥ƒû»Oí‡ö•dêª;„çNözÒÓysè1Séñ*£XFÀÓğ/û{	ºdäØ˜õ=¥)K›ÔI¦ï»Ëg.Ä\nL]²¦c2FT\ZlÑ\0,€ÿ9KZRN¸F}Ë#Ûúö³¯¾#.†â_Y\"©¦ƒµCÖe78­ÙşcäÃ³VÎe]b7mBèÊù#§„õ×^‰Vör:ÃX\0âéú·Š½§E wïô©O–\\a6–™Ä±_ÙªVûZ¥Wëd.2÷jÎÖ›×xÏ’ÆÂ½«6l;G¬¹òÉUYO¾¸‹ø‚Ÿ?ÖP¡˜z¡¦.ÔÑn›Fj‘Ô/û‹‰/3»šHjĞºÌ==Y^c»E‰„ÔÕâ5\r–n‡¡R• xä‘vòßÖd?şúÄ÷Äpña‘æb¾Ÿøöé¨îuâÑÈ5İPHÚ‰Ûšõh˜4–¿ÙÂ™»Zm•sÚ¢ëòÉOˆ?§Ü*Ma²ØSÂ¡6íÓê\nñĞ¢Œ|éØ¡»ôcf)ìâ	œNÄç¸dg¶ÔüÙlNDV‰÷â_ycïU¦HˆµÄjñ:aó÷‰¶æÿõÑ=ÄŸOxMğìËe5\rNœ:óú©İÄ_Ğ½.ÒÖáİf”ß±‹ sôÈ¾tµæè-=kÍB‚>Ğ*úö¯2îü60_€ì—÷Ç[ª²=[Èi^O\nçÚ`¾IØh^áûæVOçKÛkª%Gy_ïµK¸Df?\\l*ˆ2,«ÿë0‚’2,{ã‡\\P”Î.7œ”¾Ó¡´eD*6°ôüıæzË$^ğœç8,wnÏx›a!\r»`\0`Ñ“àÓÕ˜‰\0.)§üÈéO°0Â™šÿTçb¬aPÖƒcı<k*î`i¼P…pÇX‚ïŸ”7,œ¥™³»†îÅOøĞïn9ÁšKLáÔ¸`ÀÊBklIÍ¬5Z©‘²HA×Kiœ-,±ùÛãhÚOËœ8§ja¨ ñ\r>N×…Ö3ã™ä$Jr–BIsšÀy)Aj]ÎXİZ\n‹Er0\\°8Híæíàk(İ(wš¥ö¦]Y3|™%YÁ–ÇËwü—Í$åôÃJÌ\"™šŠÅ…9ák­ñ	äšDcãÈí™e”%°–Cì¿şâDY*G†u*¤3 ´(¥Œ\Z¶\".J±\n(D† ¬ùš³@Y ,Y&xP(r(”¯	”Ê‚œ[ƒ¿u\0X\0`,€°\0ÀŠ¹ı	Ø¹kTğÚ€\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(22,'sys','mobileSplash_small.png','image/png',14855,'2013-12-14 18:15:36',1473,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0€\0\0€\0\0\0ƒ¯^t\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\09©IDATxÚìİpSçïñsôË’…\rÆË	6%l @øµÚ„$Û¤™;-™›N&wg:ÓŞûWÒ?ÒîìÌÍşÑûß¶37Í_w»s›™›»Óî”îìMi7¡$$Mñò+@ø!°ql,Ë6	ù‡dI÷{ôalëèH–üóı\ZÇãàcéø‘|>çûœç<z»N\0\03ËF\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0K4°0è%^ç†ƒòYıoì‹#‰>?ÍÌİ¿ÙĞÛu´0ß¹¶|ßµóõtú*£íG†ş89¢}\0@á•ì{SxÊoIùõó40q\r˜3Uvßn›·6§Ÿ’É”¾ê1ã[_§m9ˆkÀÀ,ÓK¼RÂ:Ö<“î@N„bŸ¿=ÿ++½ÇÎ\rß5ß lÛ÷/¾ÿ‹GVÒÒ\00€qjÙß|:~ğ”Šd×Î×K_şƒ|×Jœ%¡K½½®\r±8\rÀ\0î¥oéw~=aäÔıïzkM¾;~³¬Oä*õö0 €(îo¼i¯ò]û7Í$êÊúDÑÁĞP”ö`\0÷†\\eİÌ³ñ`Û@¹ÉñÀ	óGˆ\r†npC0@\0HqÔî¶¸å€§Ñ¤~ÇüÇ[?ü•ä.š €¤º—­oÜÑ—Ìô­DŸ?zêÃû†ÿÒ{oÉËËhr€\0£ğ°Ùwï6¿uéĞOcƒÇYµıÕG?Y¾¨«¢æîfG¼×êuÙè`ÈnºÓ®U¶¿óş?´rÓ3eUµêGçDúñYµ•ZcNƒ0€T\0N$GBY;¢%Dnø—/Éòh^¶Ë¾våĞ¥Ûs]•Î\0à>5İ•kg–y\"Ïıæ§ò¹Üı=.móCú†š±şj‡ÍHe\00€‰FN¾/õy6Ì´AGó¡Àù#òÅ×–ZíC–ªwY.ã­¤Wóme½	\0,á~üUo¨~ÿÄÕbƒ¡K¿«õ¨qÑJon™j=zKö½éÜp?ş£ç=õ–/fË³¬\'¤]\rû|[Ÿ©nØíôxcC¡`Ë	©}Õ¨fãâî\Zİi/|ú–~ç×“çšşòÄà¿~¯àO€\0æ¢ĞöÙõääÙ6j+µ\r5z1â°d×2]~¾ú›7ª¿úÀÀ\"*…%‰CCIK+ué+½E¼y·ìo>Í´ŠƒÔß×ş÷Ë›âÎ% ¸¸Ì’¸+›’f\"ùÌ×Pbé$`&şi\0ÄâF-€\0P`£íG2}K-Ä5`€\0Px‘ÿ˜zı†Ø`¨õè¯$}™;\Z €á/ÿ–ÿêoŞ˜°~ƒüïG?9ÒßUWÅ, è\r,R¡!íìWåµ»V7ì†nøÕÍÇEºó\0Ì»o·£v·­jCr$”b_IôùçÎîI_¹™ì¿{ÿ_êª´GV’¾\0Ì[¶ªFÏŸM9ÕÔõßıx…Ş5wBn(ª\rÅŒ/ÊİŒ½``>s¬yÆıôÏ2-5}ú?_~X»²ÒKS‹ø4&\0\nüGå­5I_á,õîúo¿¼,g¾€\0P0®¯›¤¯R¶¼¶áéï_¸‘ŒÅi0€\0Pãø3Q·ç ¤og\rÀ\0¦ÍîÛmqK)‚ås×í$À\0fTuÃîÉK €×í~\Z €€õy6bƒ¡	3A €ä)92Yhh¼®óÆf^mÀ\0\naää/¬”¿—ß{K¾¨­dÙ€\0P‰>ÿğÑ›osò7\"ı]—æ«¤Á€EÊA\0»rH>—ì{sòŒ’»§Şy#ØrÂi×[Í²ÀâÅ\\Ğ@ÑşºJ¼¡‡¾ëXóÌX*…çt?¢–üÛ\\«s €Ë­ˆÖu+9Óúï\ZC®<NmåR½–g€\0&€\0˜yÂ\0€\0\0`q`4°ÈNº½µ5ÏØ}»Ò#´“#¡xàähû‘D¨‹öf×€¿ªFûŠF‰@ù:ŞëNHøÍÜ_{‰·dß›&«%Æ®\ZùôÌä.0€â’Øsí|]Eï„Ì‹úÅ”’ı¥ßùõäû’\'ôü×ïYŸÑ\Z\0ÌÕ¿±¯çù4Y\'X2OêN5wG‘È³KúZÜ˜fƒ°€â’ä3I_•Ğî§vË÷İX¼8äŞZ9ÈéŒAöyX÷òÚ00_•ìú‘­ªÑÊ–5Ïıı¥;¾bd°kçëY{\'gğÈ7CC¼€\0ÌÇ¿.o­„ŸÅ¥Ş‡üèd{²àû`2êÊDí®ƒE:!\0@\0Å•Ú¢ú=¥è¼ÖSÈ}È/}•êÍÏ\\éNò:00ïø@Î™×°»³¯™g÷íÊ?€vwİÖ†¢¼’\0,teËkcqcı†‚ı…[»=uõì1®÷pW0@\0?€«Œ…ûïìs~5¡N0½Ğ@Q0%0‡[Nd¬G7t¬9 ­šÍ#5ä‰Ñö?™ß@,›åÁ7Œ[\rPóL¼7ç¹,\"}SL‰åXóLÙß|ê~úgòEz.-‰Uù_ùGù–Éh¯éÌ§4zŸ\rÀÀ<#åi®g¤b\0»¶|ßóü?NÃòşßpj\rIâB¤õ¶àE``VÀòa}ûKï½¥¾Xy¯ÏØ¹á`É¾7­ü¬liÛ>Å=Ç±+¿Ë{ÿ»Î‘Ï¯$@\0óÍğŸ­..ÔÑ|(p~,ğ¼ÔgUc¦ºvJeõ£¯J\'Şt”èóçtl9¡®{İ¼Œ\0Ì7’ıÿò½Ø`(kÚû—Ÿª¯Y©«/Jv½ëÓ-}üGn$\'Ÿäú8²Ã§Şyc¬_ªó:00ÿ”Üñ·şï—M†7_şı[Ç~ş²\néåK´ÚÊÔ_¦·6×‰´´ÔCw—4N¸XNÿöFN#gêj´Ó~¿?@aqPt«âWÎş¯—í¾İu{–-¯-«ªU£çÎI¼òz´m«ÇÊMó”Ì3øó?û÷¯ lu~ñ»³ÿGÛö_~nå¤öíh>”.Ç%ƒÀÀ¼$¶k~­çä©w2ÖÁuUZcÍıÔ4öl®â¡ÆÖ¨qó®º¬x\\š§ówÇ~Şµõ?ÿ½légnøO¾ó†ºô«ÊqÙ+\000¿=²R«­Ô;ú’·\"÷g·˜\\V¦ÕWé…\Zl,¶–š?r|\0‹ÚJm¨çä?ı–oË3¾­ÏH¡¬¶R‚[Nt6\ZßO>¾@\0ó›¤ìø2·bCÆµä[‘¤¦é“Ï\0<.ıÊÅ#j¸µ‰•^móCt>0\0ËÒÈS’:xy™~­\'Ùu{ê\r¤ğ}d¥ÎÀ+€\0©ØG\\;_ÏãoéÏZ…Ku»¡Æè¦ŠªZY+wk¥.}YÙÄk\00°¸$úü‰PW®C±bƒ¡±Ù<œY¶tÚÇîwšÜS\r`fp00GEOı\"×iığWê‹eKˆU€\0—Ø•C9Í\"9pÃ?y6i\00€œ\rıá¿Z\\OPÒ÷£Ÿ¿¬¾®«ÒÀÀ\0ò—	õÿæ{=²Ü5l9ñÑ½É,%zÓ³I˜ËôĞÛu´0—uİÖ¾*İÕôíU7ì½­G•¾¯WM¹ÅHf€\0P=!ÍXæ¨Ä[ùP£Óãu•z#ı]·oøÇ¯³äqi­&}@A\rEµLhHá[W¥sé €K,>6Fš”¼Œy`\0\0`	£ \0 €\0 €\0\0\0\0\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0`‰ƒ&À,\në•!½bH/»¥W§ÿ%¦9½É‡•ÿõ$#-²,Lÿ¦iTslõ=6Ÿ4µüoyòöÊDÀ—è y¦‡Ş®£0Ã‚¶Úİ\'¡+Ñ+ÿ[QµÊéòÈg—Ë3~³şîèÈ°|ËÿJKNT\'»$•iÃ¼ÏxN9ÔJÊ}uMeå•ª‘ƒİíÚHxçèGÆ4@\0caÖ^öu½^rWâvEÍ\Z_]£|Îúƒ‘ğíŞîöŞî@çe	c©ØV\'Z–%ƒ4ié[]ÿèı/9]îô¿Ç¢ÃÇßw »eÏèûœÜ\00`ô^·5¨Úë‘Í{+–¯Êï¡:[>»vñø@ßM	àMñ“†uçìûî.İø­W~2ù[’ÁúíÛKî\\Ú\Zÿ”†f†ıïşº‚V@QİÒ«Ï8¾´ÕnØşìîß{hífwiyŞVQUóõÆ]eå•_õ‡®>¬é\Z¥°Ås ‹][ö¾ \r8ÅÀîp–¸[¯wÕ%ZmZœæf\0ƒ°P\\möm¶+jÖìßP]t,ˆº†ÇäÃæÃËg´ ^»sô#Æ™éÆ©¶I‡¿¯¾éô±C²\'4ÀÌà6$³ä²ï’ô•ªë‰PÀôMkÜşÔ—^‹{ë?q~[éE&ª}L^uUø–­š¶`Ìïô=åx2èÙ ÑûÈ¦½Å{¢Šå«$ƒËª–§#ƒMÄt\'\0ÀXøÎ:rí‰heó4Ié&O¤2X‚ŸÆ@\0c‘ºhßv?,¡˜÷Pçü2ØU^-ÁOû˜„…ØêåcÇ¬§ï@ÿÍÎ–Ïún¦çÜĞRW++ªVÕÔ5úê›Æß´j’Á;öüø½ºnkXhá…\0@\0cÒË®Ú·=²yo]Ãc–ÒºÓÿùñÃ‘ğmO2²,\\­EŒ¹\'“cBÊ;Î[¡êÓşÓÇ5mZ3k¯¨Y#›µ]ˆ1±\"\0‹ËUÛ6WyµäeÖ-cÑáÓÇ~èğKî6Å/M¸õ%ı¿jÖ31)‘÷<÷jÖªZZ¶ìL¬[¿ÄË`.ã\Z0\næ–^İcó5n*k©*éûñ{¿v|¾-ş—£™Üx*…¬DéÑ÷í¡ù‘ş›æ,O-Åw@¯çå\0@ŒÅ¢ÍnL¸‘µóY¥o¤ïKë³ÿ{’ÙøÔğ“òƒ¾f~K±ìÀµÇÃzå”.g	A[­š•Â›¨NtMsŞ‰€­>½ª„Z.b:K\Z¤—‡\nk•nr&cåÚmy\nyü9;ç¨æ’ıW7§W¸RÔzVËAOêBCñÎëºsBªÖ“/Š½\0Œ™¦–ÜÑ°-ë–—ÏÍ)}Ó¥°ÊàæŞ•6ÙRuSËÎLx|É†³ÇåßÕâKò/Ñ¡Î¾›+Mñ“y\\3V÷:KŞ¤°7|»3¼N2X0×Ø —3ƒ˜fd†z@O‰»bùØ´‘ja¨›áÛmáÛêŒdeÒX‘b‰¼úA½V~uf£¥®ÇÛÜ&’ú-ÚRƒìÔşOóde<iº€n¬±8öH5àøHhÚyºÛU¯ŸÚéŸ~0fßu[ƒ¦YË_9Jyº)~6#¯d¤Ûñ¾\nÿ™·?e–ÁU«bÁKÂò¸ãY›·ö‰ıÇßš,ûsüƒw¯EsLíŞ½Î¼Ûª³å³óÍ‡/iPB«Í¶QLZo]Ãc+jêÍïœE‡ƒİíİş@çåÎ‘u’k\']AŸáè•ı—ßÂYâöÕ55¤öß¤‹BíoêW“•éïºåEßb4à\Zóv@’xmâ’œ\nğ\'ó•ëê-”¿ÊÑ6ïãÄ¶.[/ºW7lËinË+ö­£îåÏ¿ôÚ„ëÓr¼Ş±ÿ¥æ÷ß•]Ê)¤ä’²õ‰g\'“Sg‰ÇÊ†õJÙ+yÔ¼ÖÛ,ÎX\"ûï«k”ÚA	{99®–çÚ?7Ã¿åœ¦Í¾±Ó¶N^ˆÛŸ²~·˜Úÿ-{^túålìTwu~[Iè^´ïR\r(\'dßãw` ÿ¦ìÀÅãb[ü/,‡ócšÓJù+;§7>¹.Şz}¤áóæÃ{}5S‰3Ğwó¡qGs9R«[“§Lµ&q[ ¸sô#ë»!Á#?5ejÊJ5Ö/‹MÎW®Ú·•U=üÄò,L­H¡jîàHm®½úÓ!ggíË9Í–íOç=Õ¨\nByKœ>v¨9\\)\\è²¾§OºÊ«\'tiäDNvì?(á-;p¼»Lv€R3‰QĞ(D\0ÛªÆË,÷u¶œõ&¦Ù_ª:¢F¬Ê\r¤¦‘Ï+û¬#¤¤DËô˜MÛŸRƒw¬ıeû¦Ìİà	jXÖ”$z¥tó5ì>pğµéOÕ)üü+[QÓpÜñ¬äúÌôvHø•¬X+û?ı‰¾¥¼ôš´†$ºÅıWé+§/òƒÓo@)Ë7ï•ef\Z F!+àjÇÁ@çåµ…¨0¤NZ©NûmÙ¤Ù.¥¼|æèÚÄ¥Éı±&¤ê²eàNıú¸¥\nRõ»šúÃGuÛJáeq®+R3qş@Ê¸‹-šS‹Y¯#ó´ÕJPÉÎË¯PÀı—G«¨Zuş¸Ñ³u\"3Ù£óàÅZéô¶hË\\.ÏÅ3šš†?jÀ˜7Ü´¼Æ|›ŞîöØÈp¡mRŸ\Z.ûø½_Ö¥Æİ¸\\îhtØVÓò™/Ñ1å,ı7MjôšúÆÎÁõñ³Chi|»ÛWOõ›ªC…Mß4•ˆ[b{ŠvŸ’”Oß4)¦%PO3:9Lº‚åÆûöì«L_¥qûSòÂ]D¾9ú{ş¨A\0cP}­+jê³p‡g…ºH©îJêZ×õyÿµc½ŞäÀ¦DËäc·¤¾<µœ˜°º{X’5kù(!\ZÓœ«3ßp%Ioœj$‚“êª}›ºp[¤×bËŞú»/öîÊéz¶Ejg)=åYŠ´ÿÒ2ò>¹Ú“—lÊsÙ‡ë¶†u›7r%çaİş`êœ/İÉQ×°-kË7mêãîv+o€\0ÆàÔVg‰Ç|³Høva‡©I²Öj–†tÉñTòÕä‚¥dsEÕª ¯ZËrä\rêµ²¥I\0ÈÑ_ò~r­/éå*¯¶’^±èp ã²DQä^WvªÇ»>ëHcùî–=/|üŞÍ[zuÁûQ;íë,–²Û×.—3¾›ãö•ÁŞæç=6ŸùÙšæe u{÷êÔ¼%ò!½\"Ü8İİ.{µcÿK&çaêbDèNEÖ·@\0cöê.íŞôæeu4œRÂõ	& åÑå¾/GMïç‘\nL2`‡éÈ£îÿäúIQ>öì}!kzIH\\>sTu×«Ù£ÔôR-Õç›K¾š—qÆ°U«®LÆ`ç×ÏÑfÛØ”­ôş3ÊşË)ˆ´ùªdDÎºŒ‰½îTö„ºŒõ&>‡Øê\'wf¨yTLöáøûï&z¯ìŸ¶§Òt(Qv®wŸÄ³ùB™¥òàwø³Œù =ù‘¹Áğí¥³·B‘\n3É6“\0®©k<ü°ä«ÉH5JÖd@µd¼œj4Mz5O§¯.Ë­Ò§’”ªK´NåÊ¸ï6±ñô±a©ŒÍ/ÁúêšZû¾Ôâ…lÀë¶g‰û‘Í{­ìÿÚÄ¥.Ã\'å¿õÚYc\0WGìãğmóñSêş®¶@dò!Yn^CKûoK\\š²¯%=¡ióûï˜tGøƒoT`&pfH$<Ë³H¤:ü&»¡ºIƒz­ÉƒeY}£Ixt¶œ<ŒVÍÓY—mN)p%½6ÅO®Ÿ|TJaùwù®l#9gZ×«)-H~ñu›7/ßÕşïı ÓRTÕ‰®=£ïô¶IjştMÛŸR6ù[.—ÙÅ9KèÑ}™cè@4”ˆE‡3?M¾~À˜ßœÉØ,>ûÊDÀ©Å®·˜s–Œ”\nXjÍ)¿+‘ åşêÌ=ÀrLWõë„—P—`0ï:V“tnˆŸ3ŸBM4m,¹ØòY¦m¢SEË4Ó×üÊëøı7¿Ò/\'Ûâè»é?ó¡é9DêÆ°ÜïÊ5&ØJİ¦<ex§38Ò÷¥±\"Èƒgcj^R9yâ6$Ìº 1sfwª?us‹ä–É<Ò¾ú&).å>å­¨ªÖ¤Y…âä5êæº&óİS“tf½V=~X¯”r³¢ªfÊk™İşÂŞ†”õÊ«–ºt-OjeÿÓó‰>²y¯II­nÓ&M©=Ğßmz\nõ˜ì§4æ©îjÕ±2Švüu}ÙÉà‹½»şøÏÿ .™†oKËil¿mô/ü©‚\0ÆB#±1»µ…ÄCgxQ¤f(F‰‚ëíSIî3ÏQ)%\'ŒáRC¨\ZLoÓ\Zè¿™Ó$kã—n\rWŸ>öÛÉSUq¼)q©€í&¼Æô—ô\ntø­?i]¼µmdc ã²I¯€œèL^VRŞ?7û²¬	-™úÄ‹k¤I¥¤UÏÊövMMÁ&j1Gù¼gô}cª®@ µUr`‹#\0ÆB5aÛ™§J¢Î–³&ÇıÕ\r5wø‡ô²	E¤Zô×dR¦áWjšùĞ!‰Šœ&`’Œß\Zÿ´¹Ï˜ŠdË½Ù¤åÙ¯·œ½|æ¨œpNc9_|i•Ù(wc™¿§ÿÌºÿòËvwúM^õKIë`yŠ¶ğmóÑìJÅòUÒ2ªYR“wHéÜ™\noµ¡ZÄ§1ù3`Ì[o.*+ÎİA[mzö²Dö«wrÌ½Ø]-åLªRx9KÜÁxíêäE°TKò#&·¯L9üJÕıc¿¾IœêüÌõdBj¸Ô}5÷+B§[›hY/dù«š×ü63‰7Ùÿœ–c’í¯§bÛü=3tç)µ%ŒåÏ76_zÂƒ”İ›üäÁµo;íÆ½RsgYeÀ@ï¡dTÕæS:é`:MjA)ÎRë@Ô¨ÅŞÕ“‹ÍrÀ½jßvíâqUeÈà¦Î«ız¡Í§Ÿ4¦Î0fºn²î¯¨Êr“´DÂ†Üo’V¬V†H‡SÁ__5Ó™ù‹›ÇMŞr¶Ô6’e°˜¼gÂw&>ï†ø¹S}•§Êc:Ì	k\ZfuTw†×Ia½>q–ŒyÆ£‡­ÁllL0¤,€Õz85\rû÷L?¯RÏ?|ªÛµuôS“(2®·”›°1ü§å³ñW%}Í‡:.ÇF†§ìøÒÊœ.OÖß(ïjòƒEİ6dáU“³ŸünòÎÚ™<ù²…ü²ëãg/¶ÿ¾ÅÂÄ&™¨>jùPË*öÕ%Z-N·!aÚœª$ü²ïªVeº3$Wì[ËªŞûÜ«ãS_©O¼øƒêúGÏ9öeº•HÁ–&·ñH…4á˜€^o>XJêÉÃ¯,Xo¶Ø¹/62\\Œ‡Íx™ u/V å„1ëd¶7^Vu\r}ë•ŸH–<››Ï™¼s\0s”›Æ¦j÷.ˆN“šÖQj—)«ŸG÷¼ ÕjÍgrÆ°2È4y\n)‚Óó9¨é\'Mæ‘–0&Nx\'–³Ämrµsô£Dï•?ıöíÓÇM?†åõ}âÅÆ½Æ=Äd0`ÌŞä@Ö2NÊS9dÁóë¶©G3u]ª	­Ì«m_²C\"Óä¨-U‘T®A›1+–Êr“é\'¯]0nÍ{ıœÒòJŞBSŸÙ˜Õ©[‰¤î¹úg‰á?z[Nª¦3áš¼E¼ôÚûkgÓø˜\\Fa*àÎÔTæ—}uM=Wû×kÓºÌfe9-[Ç¯„¥Ç‘àÌ4GÅò»ôÜ1G’¼7™~R\r¿Zì0)¸Í¯ªF3Ö´HæÓ\ZöuA}l(øØ­5‰BŞZceş2ãd¨+Ÿ¡×U5ÓÜ=õûÊ©R X¾Ï \'gj•è¬„LñËºÜRKœO¹@\0cÎ‘<sÚcİşGLs±qûS-ŸMóĞ&ycLGUß4ÍØ¨K´¶u.ßÍ8Šç‘Í{/%.I¶mÌ<şÙdøÕX\0k‘HtHË–Áy,\'é{Êñ¤TlrfóP*Å…ü:ŒşùM“&Ê›\Zá%ç&Ã\\%î\\/ğß²U«À3Ù&ª²6®[ŞÒz£qãä,¬½Ü÷eLsÊû¤:µ®CNa,[J~·]À €1o2Ø|Á]3êĞ¶2pä5hVêZµ»ù{0|{•v;kåted«œdÚgµ8Ò9û>óé\'¯]<.¿É,r*õ¹mÁP­ÅµÇ§oÜ[ÿÄs¯O—Şîößû\'§+Ô€^5Ê} ¯Ûd¸²|ërÇç9=lX«Ì:™†´Ûª©N¤äNŞéû¿¥ı×¦V@R³\ZskÄÑ=	ß­ö/ÏwøµÔåd9M±² ±:÷š0(®£0äÀ§¦2ßLŠàQ÷ò+ö­ù=‹ZÓŞ|Q¼Hª3<ëm©ê`-\'\r&§’‹r”7™~R\r¿ò%;²Væ£„$ìå‰†r¹M«Í¾Qjß=¦¯ÊÂ-{_è´­*ĞM_rn!qŞÛmö;Ê“JÅ©.™[<{\nØWo¶8£j±É·“É{@>–­jÇşƒO¼øƒ¦íOß]ºQÎE&Œï3fœ_Ú9úÑs±ßÈgßĞ…«–S“?şó?X¯ ¥Æúñw\ró€(åH}Ùt‰•jj½š<FcÉa×XÓş¹WÍË_uxµ²¢\\Ö“U›ä½•áW*B¤‚4Û“ú¦œF¨IØHÄJöLÙ³*»mLæ¥×ìÅMÍ—@İ“Ù%‹ØcóI`×˜®,¯‹ÿ„\ZTN;‚\r’»’¾êB¯œÒxéµ²ª‡MF/ËK°>~ö›£¿—$.	µH›Ü„–6ë3§‚\0¬Z›¸”št7Ky!ÇM9zª:Æâı²Ù9û>É\'ùÁ¬óTŸ°•.n9.K¡Ü™yBÉEóé\'—ÍËßôuwúM6SŠu›o³m´r›–´†4I‡ÅòšæGu²+Ğá™®rØ¸ıiu{˜•ı¿jß¦–-2ÙL2rÂY”ü º\01¡YœÒJÊ³ö¬ÈaTÃ‰óÍ‡ùƒŒ…Ck’gY‹àtK)sÜñ¬yÙ\'Ç\\Ùàç·oy¾.uù’ºªl\Zè»ieQ<%5+Ög™î]‘#»É|‡òƒæÃ¯Òä„ÀB€=%™jå¤D¶rmÇş—Ìª·lÃ¾r¢VYt\\6{õë\Z%Ï9ö™ŸC¨K×–[ö¾`²™ZpÂÉMH¯È4™¼RªgÅJ7¸š‰eÌ¸o}ü¬±0»éé>pğµ•ë¿!qò¡ó»Rà¶Ù7ªJ>ä0*ÿ+ÿxÔùÙÀ×°ûùWşÖÊğµª®õ)‘%ZœZìzæ\"ØäI¥t6~5şˆ¯İ[-ØÄg_•d•“’Luä^Öìx.u.òC“º\\’^Ò«€3«ëåşl§VÆÄd©®`“ıWÃ¶\'¯¢8<W¦¾ıLus]jÅy·L²uªäÍ}vn \'ö¿ûë\nZ…âÑ\"£ºë‹ŞÈCku•d™\0Y6ğÕ7ÊAÓã­\n%J{bå7’©ËÃ7m‡İ—|mãºÍ{·}ã?É6v{öûüíş“›â\'ÕÀ]kg ñˆîıê®f>°kÊíóæÃ\r‰eÉ•g‘ìé¾3Z·Şì‘ùzÓîàW×\"·lÕR,&4»ü |Èÿ^·5Hº8¼«ö=ÿ}ó~ømŸwwú7$ÎÉ¹Eúå$›¶?m{™N_¼ÚÀµÑ‡SÓ2Ş¹+¿ÚÃkíí	¨ıWõ®¼’ˆwlUí¶\r÷_Úöô±CuÉÖ	{\"í ïêš5™2¸Ú·¦ûF[çğ2»–¨HöO¹ìŒß¾Ã³¢~Ó®ç2íÀW7Zo´]X—ø||ÇmH(0µV|óïf­rÒÍ#›ö¦/gšßojb ÿæå3Gë­¹®´6qé“p} Óï349ìåèl}ö+y–æpíµÇ·?e²YêræŒUz:ıW:¸l\\QµjÇ¦½Y;áUZ,Ís8µJFÔ¥Sc¼Xæ(½ÿÒ>ûª\'¼Ğ[6ûŸõõ•ô•§›¼¨âØp¶ş›™º%ä‘|MvòÊg§mZôW­Ö¥ò[NA$Â¥%kÆ™uwøeX	0æİ[**5è©¾²óÇç·`\\O*±İüş»á¯ò¸ùU-â+Ñ˜S\0KÆä4Qƒ<ËêDËå3ÎšúÆ¬ãÈêî­_+ar–x¬Ï#¡¦cÜ’¸TğWvCü\\p¤öô±ßîyöU+ûŸê	ï¾wöPcñ••ıïínß™a\"uç˜ùíæ[ö¼ Ï.›Éãt>xußÊILÖ©Í\0sWyòöÖÑOO¥ŒË#ƒóHßßûe\"ÔõW£å÷rX¿Ø]u*Íñé¶>Ôë~ß€^-»úü+k1rLQ-È¨f¥(Æ©•ñ²v8-®Å+¿£•Ëö“÷ß¤CuWHH›g°´[zs=‰¹|æ¨6®‹·ò‡ŒbcŠB ÷Œû\'óÑ¿Ó$‡W‰´Hß—ÛâÉov-ÀN-feìØ½\0>«î{Îõ‰¶şÅ1Ü/;\\Œ6QM!;6¹ó¶°/«œã6µÿòZ˜tc]Ó‰KÒÖ—?’Üµ>¥Ñy~á¸4`Şï%À:a¡X¼ÉÉ¯¾ˆx¯·]Zá[ã.-/øS:ıÍ¼ëuîŒde0”‰„n¿~G_¿õ‰¬[ªáWyŒ’µiñåÉŞÎáeoIGíşjûè\'ò,S7—­~İæÇ3“s‚«ç>‘ì1Â&¿µlp¥71¨ö­±28Îâşú‡wVÄ®7ÅÏdÚÿôIÀ-[uëmËW>\\VĞ…¤äítöÓ[»¶.ñ9¿ €1¿•hÃ«’_öÇÜ—ı—äø.GÌB¯%Ï||ÈæC9\\n‰ÿ‡<Ñ4PB¥=ùuóQ¾Šÿ³Ã=íÆ›ón“‡_ÜŒU¶}Ñbw8¥M¦¹çÒ°\'şZ²Sšb{<cúJ‰ßnßP^±\"Ó/¨ÆNË‰EÖ¡¿*ƒ;nÅ»o´y+VL3Óû/µ¯´ªyú*+p¼ôrë5]Óå×)È›JŞKgÿl¤o×±\0`Ì&9š«ŞöŞÁkşÓÃCw%²Ş¡”­\0ıÃéc‡FownNœZ“¸båme?Ãze0ÿzã.ó-¥ĞôÅZª’ù¯\0/;üP¢-\Z·]íê¿ŞrÖYâÎoU>iŠ¶‹Í²?‘¾/å,DšÂüIåÜŠdºáêôÇ‡J#íu	K×>%ƒåÔªwÈq¥µEJáŠªUy¼¦½-ç>±¸ÿ~yvM×ÚoŞ¾Şv)ïLßÍüß@êäcCü³˜1zèí:Z3@­\\{İÖÓœr¼öÕ5­¨©·>Hg ÿ¦1¨µå35Å„+¾Z\\ÀVÑ¾ë[¯üÄ¤¤3:½ß÷›£¿/È=*’ˆWì[oéÕòŒ5õj2)+¹+M!Õj Ã/ç\r«-uñV+×,åéN9ô5ìŞ²÷E%Ï?h9±sô£\\GoI£µÙ6ée²çj­¡¬±<]Pö¿Ã/¯fNû?™<¯<»ìƒd°š\ZÚúPvy)Õ;*62,%õúÄYî;Œ.h«íÑ}òY’XKİâtyª3ZÚh ¿[’r°^–ú’Öï¾ÍÉ9û¾‘êí¾f²Móïµ¼3ßáÖ™RDÎK¤MÔúE™\Zd|Sh©nØêdW®;J³ËI†VR.qår5k4:dLÑ5Ş?™wÃ\Zs@êµ=6Ÿ–ºß·´¼rÊTv^Í1©jhcéÀDÇô‡;MnÀÔŞS×Ä’ı±èÚIÜ•É€œ½ €±¸HA¦ÖàS3ÊÿªHN3&CĞ\"ê³Do®3läzÿÄñmµÆIéùÇş	ª\"-Õ®\ZD}6vI+K/)¨~÷‚4Å„¸’ ”G+H©EeçÕ:aBJy\"ÉZù,Ev~cÈ­üjò¤ªegÒ+éµ•Ô³i\0ÈÔ…K·}ë•Ÿ˜lã?óaë™*ö;šÀôq006ÉpÖY;[>+Rï7\0XŒ®Ú¶SR›®ÇèôGÂ·-€¬˜Š‹¨Ì\rêµj™zgÒ¸èM„ô\nã‚¨Í÷ÄşƒæÓC^»p|Y2XŒ)ÀÀÂ4ª¹.Úw©1ºUÆ”„j¬\"µï½/˜ßÿ£n‚Ú”`‚~\00`™¤ï-Ï×w¤ÉIÿ£ªQ\n[›£ßæ¨ZÆ@\0–„õJ©}÷ìiÂ\rÖç\0‘¨tø7%.Ñ˜\0\nˆAXXàÔİ¨9­õ;ÁùæÃË’AÊ_\005ê*oş3ôİdŠ`\00g2–÷Ïv¶|vùÌÑMñ“~@\0¹©N\ZSg\\»x<·º9:|¾ùğéc‡ê­t>(–#ÄB¯€µØ¨îºÚÕoqíX‰ŞmŸŸ<ú›ş—›âg¬¯‘\09a.h,\nWíÛ:më´Ôàçêš5Æ\n²Ş}4Ğ36b,“§nO’ªwmâ“õ €éR3aİÒ«ÕL“7ğ&Ô\"9ÕÉ.¢\0\0ÀÄ ,\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €Q8]sñÒ\0À‚>ÒÓ…á¶¥³SwÜûZ×&æ¨$«|ÖpâÿM$µX2ıÉhÂø—)·\0Àsä¨m\\¸:uÍ¦?»s!û§2uÚ&õE<y?§% £„4\0À³f6]—¸M¯î…Ø<©Ÿ˜ÓFÅsR‚Yı/Ù\0p!³V•³n®¹>XñO™ÍF\'U/÷X0§‹i\0\0<uÜªä[Q.Ä.Æ™Š>E0«y$1–Ê*¤\0‹.€%\'\\ºî¶Õ-#Šg¬bvÛHåáÄX\'öpœB\0h\0O\\—w®ô:¨Zy©cŠH¦J@\0ÏãªKB·Ä.Ÿ©qçe$«+Ê#‰¤º–Ì /\0ğœ]·M/±©!T¼~ó›º¢<¾ãZJäh\"K]E&Às%tKí¼`¿DÇª>V%2\0ÀÅß¯Taä±Sé’Çc/\"iäq,uı˜)½\0ÀVj«tE…	$ˆS] c×¥&N$G(ÀÓ:°Rì\"GÆ¼{o—Ñd*Œãc£¬€\06}f£ ÑËì`FŞKKìú’ÔDr¬2Nç¢m\0Àä.fDª§Z/}0ŒãTÆ\0æ\Z=ôv¹‹…nj\0‹«V×wËä.fû>®›:=€k8Ál\\\0\\\0«z—;w1À%I<ç‚1€ùÀİ¨w¹ó…Û¦«	2Uµ\ncÊb\0ó)€—HÉë`U]ÌÛ?…q}Ô”Å\0æA\0KÉ»Ä¡•Û¹…³,Œ£€¹ÀnÛXo3°€ËboêjJâ^õ Ô\0f1€—ØØŒÅ%}{ñò{ÔÜ[`æØ¦E/¬°˜©êJ§±rb„KÅ\0Š\ZÀ6]÷r¡xË¦»Æ.\'Ã£Úİ8½Ó\0\nÀD/ıÏH×¥ –»q#‰)ˆL+€‰^ WêF¦hb¬ €Ü˜è¦ÃeÓ—»´ÊäXAÌX-\0–XNá—:fL—-u“œË§\nbî$1€İ6ã:7…eŒšvup$¼KA`|\0Ût}¹“)5€bş©éÚR‡¾ÔaL­‰S‹İ»Ãès–Â—Ë½ÀÌPzP‹–-uß„„oøÿm 5€YCA,*Æ Í±«½Z  0¼©ëP÷ºœ©€\nb\0E6ÕX+*``NÄƒÜC,îÔÜ\0“îï•\n¸‘Ææ¨áD22ªİ¥%€ùZø.ujŞ©k]=ü^MÌi‰TAŠ1Ë40¯\n_»^%…oÆÙ5``şˆ&ŒZòÁ²KÀ/|+¤ğušo%¼‘¶æ™»£ÉÁQm®i`n¾n+3:ëáßo¢¹€yi4!œ¼3¾\00\nßå%Ú§ÅÍ	``ş‹&’w¢FAL×40[–8ôÍeZI	àÍ´°@Ü%#1º¦å²ëËİš;çõôğáGi=`A‰%´Á˜QÓ5\r•1«s‰¶´$¿Ÿ&€…+\ZO†cZ8J×4PxKKŒôÆRFÀ[hF`‹Ä’ƒ©$0}‡¾¢Ôä_ë¼•ÆcBX2<¢\rq‘ÈK‰]_^ª¹3‹³ş,2£	£&–$aÕÀ\Z‡M_æÑÊ]|H	àm4,°HÄ0\\È\Z½%`	àÇh^`Ñ\'ñhòÎ°‘Ä×ÒŒ%=Z¥§XÉ®é:,vn§îNMß‰&%†ïÄ zµ\n·f³ïIôğ·ÓÔ\0&RI\Z¦%°¸8íú²Òbt8OÀ;hp\0S“:82’¼•Ï4Gôºgì	õğ¿ï¤ÙdKâ„vWjâ£w\ZX`<.£ÃyIÉ?- ÇšøîIŒÂëÑ½nÍãœ•\'—\0ŞÅK\0 ¯$&‰1/s8—½ÍNû,î…~7¯€i‘$¾›Jâ÷cn+qê•¥RøÎ…}!€0‰G’w‡IbÌ½’×¦-)1ªŞÇÜÙ)	à¿â¥P`#±dhH*c-Æl—˜õ’·Ì`UÌ;zóà=¼@\0Še4ntPß”H¦10£%ïRî-•\0³û¨‡? €_\"©…‡“w‡´Á(Ô(¢¥¥ú·¶Ä=÷÷Tx/¯€%5ñàˆ&aL5\ne‰[_â16Ï½®f“\0~œÀìˆŞc ŸÜõÌ»ÜÀGöñ\n˜eñ‘ÄƒÃÚ0W‹aÊn3r·´D>_Ï[0€¹WŒ•Åq®ã§C+OÕ»¥%ã’\0ş/+€9j$š\nãaùL/Rn—¾´Ìİ×ûÍôğŸ¾Éë`–0ë¦&Œ|±[êÖËJ´%¥óº“™\0°@Ãx8f„ql”öXP¡[ê6¾^ä—ÔyİÌ3îù;xI\0KD“‘a#1_Hi[âÒËÜFß²„îÂ­t3WÀG÷ó6\0° ŠãáhrxÄ¸~!çXëvéÆÉ“Ë]—c‘·‡ƒ·€…U»Œ£¼¶D_«HV_cf”÷æ\Zq+¹ë2º—i’Éğ“´€EDbØHbcXur85/f4Æ…äiñØíFg²İ–şzö\'çWs\rÀbât\Z¥ÆŠ°ƒã&äŠOådl\\HGÓ¼]F¬¦î»Uå¬¦U´¢ÔÃ»izLş€R6.QÊøNÆ#åøËÌ±*éääÂ:0*ï¹ó;¦ÒTw[/(©±N®QRÀ¼ÈlÍc)³§$Q-èœR­ÒL\0\0²PãX\\¬À\0\0P\0@\0\0€â0]Ğ\0\0P\0@\0\0€\"0]Ğ\0\0P\0@\0\0\0\0€…À\\\0€\n\0\0\0\0)€é‚\0`æX§\0`*`\0€Y`İF+\0\00ÃH_\0\0f¥&ƒ\0 \0`qTÀ\\\0`˜QĞ\0\0À\0\0,\0f&,\0\0¨€\0 €\0@‘˜.h\0\0¨€\0 €\0@‘˜.h\0\0¨€\0 €\0@‘˜.h\0\0¨€\0 €\0\0\0ÀÂ	`®\0@\0\0\0\0ŠÀtA\0@\0\0\0\0ŠÀtA\0@\0\0\0\0ŠÀ:]Ğ\0\0P\0@\0\0\0\0€…À\\\0€\n\0\0\0\0)€é‚\0€\n\0\0\0\0)€é‚\0€\n\0\0\0\0)€é‚\0€\n\0\0\0\0À\0\0,œ\0æ\Z0\0\0TÀ\0\0,’\0¶Ñ\n\0\0Ìx\0S\0\0@\0À\"	`J`\0\0f>€\r\0\00\0\00\0\0(R\0Ó\r\0\00\0\00\0\0 €\0X8Ì5`\0\0¨€\0X¬À\0\0ÌBL4\0\0³ÀTÀ\0\0À\0\0,\0¦\Z\0\0*`\0\0`\0\0P¤\0¦\Z\0\0*`\0\0`\0\0@\0\0°p˜kÀ\0\0P\0@\0\0€\"0]Ğ\0\0P\0°Øh\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0À\0\0À\0\0€\0\0€\0\0€\0\0\00\0\00\0\0 €\0 €\0\0\0\0\0\0`\0\0`\0\0`\0\0@\0\0@\0\0\0\0\0\0\0äêÿ0\0Ö·wª°0ar\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0ÿ€\0\0ˆIDATxÚíœkLWÇÏ™İá±»Ğ¥òª\nÛ®ÕE¬t	 \Zhú€¤/MClR?ÊÃÄ\r¥I?˜6ıĞ¤‰¸ ’@›Øb›ÛD*$ĞXR­(«+J€ ‚¼vgwzg—ÊòŠØ¸ììrNÈÉ;ÌËoşçÌ™;ÈØ‰h@[™1ˆ\0a!,„…°ÂBa!,„…°\"@Xa!,„…°ÂBXa!,„…ÂBXa!,™Î‹U2‘IkyãÔ…]ì‹ïÓ¦:ïÏÀ½ÕrƒÅÉèºiÖSOv¶oÇNè.¶’Ì­2“{qf°L¦\"š‡{ëKüïTJÈl\n•:©Öz*UÃ—1çL±=‡úPõÂşÆc)ü/0çŒÊGR–á ğÍÂ¤ í§:Ã?gãê.2bé°³LŒ›t¯nYBA~™\'Ö‘HÚ5{t*ô™Î EX‹fÂnL£tøÔb9VÊ2),M%ç+\'¶¨ö_’¦±ƒö´÷[BcSÏŒŞ&‹/£¢4+^\"\"Úm„a=Q=åã¦rg?ÂZÂ&ÊôƒbT(X\"·¹q2L\rúP²4\\¢AXË÷sV@^;ËÎeblX<¸òcÛ¿”ö6-î×„²¤Å<–«;óY)±³õw•&Äšİ¸òÃy¿€µ¢¬&6ı€›Wj’TIÛ\rû`K—6tı¸bcen‚¹v«\nşêëjºğæuEFú¡*ç±¿œÊI´Ö»v“MÙ™wÆÙn¨È}Ù\"Ûm,ßšô†T‰â`©!\0&½UYqYR¯iştnuÁ¤{Si9ÔÀÂ´]:3\nZJÊ&Xÿ(Ë¬–ôC•®C™!€’¢{»MFóÔxFnE/Ñİ#ÏQRWËŞ£cBÂ\no{}‚\'`wİ´‚B]Ã÷ÎÍŞ¤Rê“\'ªÅÌ¯hcª<Fg¿c>µ¹õú<Y¤•K)¯|³†„ªxÚÖø1D¼GIù?L¾SûÛÉ}«ÚÜëöÅê»ÖíqMaÚÂ»´ÛZD}cĞƒñu«uFº¨æ=¢v_;7/÷¯sÌUœ»½k£&=å¾!&5ï;UA§ÃJ¶ÖRŸ]ÔÆ-À·DK	#C}¹ÁÌôTÖşOh{¨BZm>÷9õ-‘G¨¿¦ÉÎ:\\ÖÍè\rÕUsŒúQQEóõµ_ßbŒÁ…1­SM\rtÓHôîÒaÀd/¼•tø,mï°Ûl\\õNç®»Uï\Zò%šjñ!õ)¶ºÉ‰Ñİ{Í\0½ßeïøÛ>Âñ¶«mM»ŞÊÈ}Í±7]øÉ¹‹òr6Z›ë7º;¥xêÿ:t2qÛòk~=_º½çK,J—µû$BWpy›£íE¤<ëY±ÿBe±•ñË˜<M\0Öcl—¹\Z¼ĞğA\Za!,„å“	^IˆFìJ~Wœ`L\0«¸f`±„Dğğ¿^±ªy#‹3v˜ñ9X*–„(ŸşƒÏ@”ÿ»óüÅoƒE\\ş·¯Ûl˜=—8.À«7ÁZML©©9PsŞ¢5Îƒ¤–Ğš`ûdšÚ((9½”VÑIS4Ã¤ —Y)‰–w„!#Ç7ø$|öëR±s<X Ï?ã’³…œÓÑ;>ZE±chu5N”vQ‚\'Èßè‰tJMl Îçz!Œ°ì2wCV^e$ö¿Õã©iñŸÁ§aˆ>Xöq¥ƒW(kIT‘8•ËS‚¬‚(Ø(D˜¶ÀôXUp¼ü”èş<áù\'¯³X%øŒqOæÕAîŞ‡`¹½(ex¤°be!¬\'…aˆÊBey<Á#,CCÃòC\n¨,Lğ˜à1}Ğğ[„…°ÂBXha!,Û¿€P™Â§Fş\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(23,'sys','next.gif','image/gif',542,'2013-12-14 18:15:36',542,'GIF89a\0\0ÆH\0^¾#eÅ%hÅ&lË&mÊ)nË+oË+sÑ.vÑ0wÒ1wÒ1|Ø3}Ø4~Ø5~×6Ø6„Ş;†Ş;†ß=Œä@åAå_‡ÉRŒÖF•ëF–ëcÎ^“ØI›ñg“ÒKñKòb™İk˜ÖbœâP¤÷Q¤ø\\¡ëlœÛ\\¡ìQ¥øR¥øgŸãP¨ıR©ıSªıTªık¥ç^°ÿf¯øf´ÿ«Úqºş’³á–µáƒÂş¥½â—Ëı™Ìü¨Íõ¬Óú´ÙıÈÜõÆâşÍáøÉäıÔáòÊäşĞæüÕêıëôıõõøÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0b€‚=:Fƒˆ‚<+7E‰ƒ;#.4Aƒ */%)-0?‚$.2C\n(,,9\0\r1D\Z!\'@5	\">6&BÖ83G‰\0;','GIF89a\0\0ÆH\0^¾#eÅ%hÅ&lË&mÊ)nË+oË+sÑ.vÑ0wÒ1wÒ1|Ø3}Ø4~Ø5~×6Ø6„Ş;†Ş;†ß=Œä@åAå_‡ÉRŒÖF•ëF–ëcÎ^“ØI›ñg“ÒKñKòb™İk˜ÖbœâP¤÷Q¤ø\\¡ëlœÛ\\¡ìQ¥øR¥øgŸãP¨ıR©ıSªıTªık¥ç^°ÿf¯øf´ÿ«Úqºş’³á–µáƒÂş¥½â—Ëı™Ìü¨Íõ¬Óú´ÙıÈÜõÆâşÍáøÉäıÔáòÊäşĞæüÕêıëôıõõøÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0b€‚=:Fƒˆ‚<+7E‰ƒ;#.4Aƒ */%)-0?‚$.2C\n(,,9\0\r1D\Z!\'@5	\">6&BÖ83G‰\0;',NULL,NULL,NULL,NULL),(24,'sys','noPicture.gif','image/gif',2141,'2013-12-14 18:15:36',2141,'GIF89a<\06\0çè\0\Z !&(%)+(/1.2319:8<>;=?<>@=@A?ACABDACEBLGFEJLIJHJKILNKMRTRTQRWYXVZWYVZ\\Y_ZYZ_a_]`[`bg\\\\j[bd_^]bdac`cebchjhjglixkmjnlpjnqmoloqnmqpqzpp…trvrtqkr’tvszut{y}|{sz|yzy|~{}~‡ƒ~g‡¢ƒ€¤uz‚ƒŒ…ƒ‡†„ˆ„†ƒ‰„ƒ‚‚£W•¸†ˆ…Š‰ƒŒ‡ˆŠ‡ˆ‰’ŠŒ‰ˆ“a™¶Œ‹rš§˜‘”rš´‘“”‘¡•“—“•’’—™•—”–˜•^¢ú/ÀÛ—™–m íš›˜›˜©œš›ŸŸœqªé¬˜ ¢Ÿ¥ ŸŸŸ¶¡£ ¦¡ §¢¡£¥¢]¿Ø§¤©¦¨¥§©¦§§½©«¨ª¬©¬¨º­«¯¬®«­¯¬°®²®°­·¯¨°²®°°º±³¯±±»³µ²Ÿ·ã´¶³··®µ·´¸µºÎ¬²¶¸µ·¹¶µº½¯»È¸º·¸¹Ã¶»¾»¹½³ºĞÁ·½¿¹¸·¼¿º¼¹¸¾À¼¾»¶¿Ç¹¿Á¿½Á½¿¼¶ÂÃ»ÀÂ¾Á½¼ÁÃÄ¿½ÀÂ¾ÁÃ¿ÆÁÀÂÄÁÃÅÂÄÆÃÏÂÃÅÇÄËÅÄÆÈÅÄÉÌÇÉÆÈÊÇ´ÌøÉËÈÇÍÏËÎÊÍÏËÎĞÌÏÑÎĞÒÏÑÓĞÒÔÑØÒÑÕÓ×ÓÕÒÙÓÒÔÖÓÑ×ÙÅÙòÕ×ÔÖØÕÔÙÛØÚÖÙÛ×ÚÜÙàÚÙÜŞÛâÜÛİßÜŞàİßáŞàâßáäàãåáããîèãâäæãåçäæèåçéæèêçëêáéëèêìéëîêíïëîğíïñîğòïñóğòôñóõòô÷óöøôôùüøú÷ùûøúüùûıúüÿûşÿü\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!ù\n\0ÿ\0,\0\0\0\0<\06\0\0ş\0ÿ	H° Áƒ*\\È°¡Ã‡~‹,Ö*P:Z%KX´oC\"‡ŒU¦“(S¦d…œH‘Üp*”Í›8k¢ìd‹ÛK‡âveêdS¥Q”7Qî÷S¡³L¤â´y*U*RIgÍ4JZSƒç’y\n•Éæ(”¸œm3¨Í˜­QdµVî«Àp¸D•E*ëšCf®ân•5î«¸[¡Æ–í„+[Hg©“ÅUøe8Y™>íÍt¬i®¸ ,e’UW$±²ŠC1³ëlëd‘ÒÈjKª\ZëRdCå¢¸³‰sŸÍdûëÓá\'™>Ä%»¬1¨dAojìæY_¹åkìß·“Ã§şÿ”93“Ï†Ì3gR5ĞôL ¢}ıw¯­†à:¡%¾*¨™àrNA…ÈAF(–[&.-dŒ\'ê¹b8¨„¢‰&·¬öO!B¤QÇMì!Ì*cô0F‘ÃÕ^È0ôÊ\'Á9s^\'yb‡’¼PƒX Çp±@8¨°ÇA¾ì5\n*y¡f ¤C”å‡#¨àBFX 	,P@@d€¢AÖìåI\'Ş8ãX·”C<SËPª$ÒÆ#+$\0D$p§™Œ	£&-\Z4„tB¡%Œp‚eª`ƒ\r*x€À\n6° B˜å‰0\n!6Ö\'şŒ$D @|d\"I&` C±ÄŒA„\nX DL(š}‚‹B¨@éI›iÑ\0¡Àš”uÇ\Z\Zl€	D(bl\nM äŒª–¤¢\'¯~ÎAd`AZCŒ\' À§#„šAQQ¥©^&\nIÛÉ€‘1Fª„4¨<Â,(Ÿ¬Q„\rAÁÃ:È€BØŒ2V(¼Ë¬f„²|Î3y¼‚\n„Â!Æj01DC¨»0Ã	eï((WY„Š7áğqH–Œ”%\Z$­´ÒK#LAB×xM\n¹ò‰f™¬ePX`‘‰6ç´D$µDÑÁşL•,Ò½À€B\rÃv&L&ÄËÊ™Èg\Z[¤ñÈ5ás†*¼‘*ÀëÉ%f´b\n, ŒMğÊ¢.l“òlÄXh!‰3âDÃ+°Œ!!G¬	o&‚Ì°B\nı—‰^Ä(Mj¬7•Î„ã0¨¨b‰Iøğ¼6=âqÌhSM8P8³tAd|¡E\"ÖœS\r1¯œ‚8q„›ÀË‰\"¥ ÆA˜‘y-Äe!«2†1\"\Zá˜F0PAASP!NBNb	Í¸¢	ŒM8‘8…Tç$Q9H´ğgÈ¯ˆa.b‚ÄÀ	NØÃ\'Ì†¸	$şLCÂQštÆ zPDô¸!2ÄAÀˆÕ@D\nT\0ƒ‘ÅM<ñ	*D&È¡VA°p‡>À! ¼PaŒI£€¼pˆ{’»üÃ¨ …\'JQŒmœb‹ŸXC‚”L,ğ+ª€ÏQ>Ç‡7{Å2ìˆ‹³á„‹NsÈS”	!Ú…<*™†Hp•¢t\"_‡qŒ—œ#=›a…ÛB\rã¥D@?	Ç-úE““tÂ y6p‰©€Â•É%,·2šŞ$Ë0IU‚‹yÙ¥r’\r(`ŒeLÃ\ZÖF2|a¼~­l|¾ˆ™Q\nä0ó(JKÍá2!E;Ş%®?™ÊTÖ¦¦›\0Ãšö4È6˜xÆ37š©f@e¬RŸü$Ë+–!Æ…Ñ¸À…-×Ã‹(‚£4\r©HG\Z’€\0\0;','GIF89a<\06\0çè\0\Z !&(%)+(/1.2319:8<>;=?<>@=@A?ACABDACEBLGFEJLIJHJKILNKMRTRTQRWYXVZWYVZ\\Y_ZYZ_a_]`[`bg\\\\j[bd_^]bdac`cebchjhjglixkmjnlpjnqmoloqnmqpqzpp…trvrtqkr’tvszut{y}|{sz|yzy|~{}~‡ƒ~g‡¢ƒ€¤uz‚ƒŒ…ƒ‡†„ˆ„†ƒ‰„ƒ‚‚£W•¸†ˆ…Š‰ƒŒ‡ˆŠ‡ˆ‰’ŠŒ‰ˆ“a™¶Œ‹rš§˜‘”rš´‘“”‘¡•“—“•’’—™•—”–˜•^¢ú/ÀÛ—™–m íš›˜›˜©œš›ŸŸœqªé¬˜ ¢Ÿ¥ ŸŸŸ¶¡£ ¦¡ §¢¡£¥¢]¿Ø§¤©¦¨¥§©¦§§½©«¨ª¬©¬¨º­«¯¬®«­¯¬°®²®°­·¯¨°²®°°º±³¯±±»³µ²Ÿ·ã´¶³··®µ·´¸µºÎ¬²¶¸µ·¹¶µº½¯»È¸º·¸¹Ã¶»¾»¹½³ºĞÁ·½¿¹¸·¼¿º¼¹¸¾À¼¾»¶¿Ç¹¿Á¿½Á½¿¼¶ÂÃ»ÀÂ¾Á½¼ÁÃÄ¿½ÀÂ¾ÁÃ¿ÆÁÀÂÄÁÃÅÂÄÆÃÏÂÃÅÇÄËÅÄÆÈÅÄÉÌÇÉÆÈÊÇ´ÌøÉËÈÇÍÏËÎÊÍÏËÎĞÌÏÑÎĞÒÏÑÓĞÒÔÑØÒÑÕÓ×ÓÕÒÙÓÒÔÖÓÑ×ÙÅÙòÕ×ÔÖØÕÔÙÛØÚÖÙÛ×ÚÜÙàÚÙÜŞÛâÜÛİßÜŞàİßáŞàâßáäàãåáããîèãâäæãåçäæèåçéæèêçëêáéëèêìéëîêíïëîğíïñîğòïñóğòôñóõòô÷óöøôôùüøú÷ùûøúüùûıúüÿûşÿü\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!ù\n\0ÿ\0,\0\0\0\0<\06\0\0ş\0ÿ	H° Áƒ*\\È°¡Ã‡~‹,Ö*P:Z%KX´oC\"‡ŒU¦“(S¦d…œH‘Üp*”Í›8k¢ìd‹ÛK‡âveêdS¥Q”7Qî÷S¡³L¤â´y*U*RIgÍ4JZSƒç’y\n•Éæ(”¸œm3¨Í˜­QdµVî«Àp¸D•E*ëšCf®ân•5î«¸[¡Æ–í„+[Hg©“ÅUøe8Y™>íÍt¬i®¸ ,e’UW$±²ŠC1³ëlëd‘ÒÈjKª\ZëRdCå¢¸³‰sŸÍdûëÓá\'™>Ä%»¬1¨dAojìæY_¹åkìß·“Ã§şÿ”93“Ï†Ì3gR5ĞôL ¢}ıw¯­†à:¡%¾*¨™àrNA…ÈAF(–[&.-dŒ\'ê¹b8¨„¢‰&·¬öO!B¤QÇMì!Ì*cô0F‘ÃÕ^È0ôÊ\'Á9s^\'yb‡’¼PƒX Çp±@8¨°ÇA¾ì5\n*y¡f ¤C”å‡#¨àBFX 	,P@@d€¢AÖìåI\'Ş8ãX·”C<SËPª$ÒÆ#+$\0D$p§™Œ	£&-\Z4„tB¡%Œp‚eª`ƒ\r*x€À\n6° B˜å‰0\n!6Ö\'şŒ$D @|d\"I&` C±ÄŒA„\nX DL(š}‚‹B¨@éI›iÑ\0¡Àš”uÇ\Z\Zl€	D(bl\nM äŒª–¤¢\'¯~ÎAd`AZCŒ\' À§#„šAQQ¥©^&\nIÛÉ€‘1Fª„4¨<Â,(Ÿ¬Q„\rAÁÃ:È€BØŒ2V(¼Ë¬f„²|Î3y¼‚\n„Â!Æj01DC¨»0Ã	eï((WY„Š7áğqH–Œ”%\Z$­´ÒK#LAB×xM\n¹ò‰f™¬ePX`‘‰6ç´D$µDÑÁşL•,Ò½À€B\rÃv&L&ÄËÊ™Èg\Z[¤ñÈ5ás†*¼‘*ÀëÉ%f´b\n, ŒMğÊ¢.l“òlÄXh!‰3âDÃ+°Œ!!G¬	o&‚Ì°B\nı—‰^Ä(Mj¬7•Î„ã0¨¨b‰Iøğ¼6=âqÌhSM8P8³tAd|¡E\"ÖœS\r1¯œ‚8q„›ÀË‰\"¥ ÆA˜‘y-Äe!«2†1\"\Zá˜F0PAASP!NBNb	Í¸¢	ŒM8‘8…Tç$Q9H´ğgÈ¯ˆa.b‚ÄÀ	NØÃ\'Ì†¸	$şLCÂQštÆ zPDô¸!2ÄAÀˆÕ@D\nT\0ƒ‘ÅM<ñ	*D&È¡VA°p‡>À! ¼PaŒI£€¼pˆ{’»üÃ¨ …\'JQŒmœb‹ŸXC‚”L,ğ+ª€ÏQ>Ç‡7{Å2ìˆ‹³á„‹NsÈS”	!Ú…<*™†Hp•¢t\"_‡qŒ—œ#=›a…ÛB\rã¥D@?	Ç-úE““tÂ y6p‰©€Â•É%,·2šŞ$Ë0IU‚‹yÙ¥r’\r(`ŒeLÃ\ZÖF2|a¼~­l|¾ˆ™Q\nä0ó(JKÍá2!E;Ş%®?™ÊTÖ¦¦›\0Ãšö4È6˜xÆ37š©f@e¬RŸü$Ë+–!Æ…Ñ¸À…-×Ã‹(‚£4\r©HG\Z’€\0\0;',NULL,NULL,NULL,NULL),(25,'sys','pending.gif','image/gif',607,'2013-12-14 18:15:36',607,'GIF89a\0\0Æe\0®S\0³]·a\0¸b\0¸c\0·cÀg\0¸h ¸i Àm\0Í\0Í‚\0Â~@à†\0ÕŠÔ\0ÇˆPß\0Ü˜\0Ü›\0Ì“`í–\0Ü¡\0Ü¤\0ã£\0Ñpå«\0ë¨\0ë­\0×¦`ë®\0ë°\0û¨\0ë±\0ë³\0ëµ\0Ö¨û­\0ó´\0ëº\0û²\0ÿ°\0ş±\0ë»\0ù´\0ë½\0õ¸\0ë¾\0û·\0ëÀ\0ÿ¶\0ÿ¸\0ÿº\0û½\0ÿ»\0áº`ÿ½\0æ¾@ÿ¿\0öÄ\0ÿÀ\0ÿÁ\0õÇ\0ÿÂ\0ÿÃ\0ÿÄ\0ÿÆ\0ÿÈ\0æÃ`ÿÉ\0ïÉ0ÿÊ\0æÃpÿÌ\0ûÑ\0ëÌPûÖ\0ûÛ\0ÿÙ\0ÿÚ\0ÿÜ\0ûà\0ÿŞ\0ÿß\0ÿà\0ÿá\0ğÔpÿâ\0ÿã\0ÿå\0ÿæ\0ÿç\0ÿé\0ÿê\0õŞ`êÓ¿ÿéÿé úæ@ÿî ôéßÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0£€‚ƒ„…†\0\0‡„_\0VF\0_‚•$9Š\Z$‡dH1Š\"d†a/Š!I	…^Y-ŠG&“„—`W+ŠC@œ‚bZT\'ŠB=,¤¦7\\XRNEA:4­c[UP>.?83*\0K]YSO#ŠxØ‘¢‚\"\"Qš0Q²c‚\Z0P”\0Ñ\0\0	E3j$UÉP \0;','GIF89a\0\0Æe\0®S\0³]·a\0¸b\0¸c\0·cÀg\0¸h ¸i Àm\0Í\0Í‚\0Â~@à†\0ÕŠÔ\0ÇˆPß\0Ü˜\0Ü›\0Ì“`í–\0Ü¡\0Ü¤\0ã£\0Ñpå«\0ë¨\0ë­\0×¦`ë®\0ë°\0û¨\0ë±\0ë³\0ëµ\0Ö¨û­\0ó´\0ëº\0û²\0ÿ°\0ş±\0ë»\0ù´\0ë½\0õ¸\0ë¾\0û·\0ëÀ\0ÿ¶\0ÿ¸\0ÿº\0û½\0ÿ»\0áº`ÿ½\0æ¾@ÿ¿\0öÄ\0ÿÀ\0ÿÁ\0õÇ\0ÿÂ\0ÿÃ\0ÿÄ\0ÿÆ\0ÿÈ\0æÃ`ÿÉ\0ïÉ0ÿÊ\0æÃpÿÌ\0ûÑ\0ëÌPûÖ\0ûÛ\0ÿÙ\0ÿÚ\0ÿÜ\0ûà\0ÿŞ\0ÿß\0ÿà\0ÿá\0ğÔpÿâ\0ÿã\0ÿå\0ÿæ\0ÿç\0ÿé\0ÿê\0õŞ`êÓ¿ÿéÿé úæ@ÿî ôéßÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0£€‚ƒ„…†\0\0‡„_\0VF\0_‚•$9Š\Z$‡dH1Š\"d†a/Š!I	…^Y-ŠG&“„—`W+ŠC@œ‚bZT\'ŠB=,¤¦7\\XRNEA:4­c[UP>.?83*\0K]YSO#ŠxØ‘¢‚\"\"Qš0Q²c‚\Z0P”\0Ñ\0\0	E3j$UÉP \0;',NULL,NULL,NULL,NULL),(26,'sys','permissions.gif','image/gif',1061,'2013-12-14 18:15:36',1061,'GIF89a\0\0çŒ\0šWšX”Y*šYš[š\\š] š_!š`!ša\"šc#”f8İxæ—•’’¥æ‡–šæšš«››®³™ˆÿŒé•¨Ÿ£ÿÿ“ª£¥ÿ•\n½¡‰ÿ—Î¤Xÿšÿš\rĞ¥Y¨¨¸ÿœİ¦;Ò§[ÿŸî¦Ó¨\\æ§2ÿ¡¬¬¼­­½ÿ¤ÿ¤ÿ¥æ¬4ÿ¦¯¯¿Ë¬‰ÿ¨°°Á±±Á²²¼ÿ«ÿ¬Û±aÿ­´´Äß°gÿ¯ÿ¯æ¶9µµÄŞ³cà±jÿ²Ç´©··Æÿ´\Z¹¹Éÿ¶ÿ·ººËÙ·Šÿ¹½½Ìÿ¼æ»kÿ½éÄ@ÿ¿ ÁÁÊÿÄ#ÄÄÒÿÇ%ÿÈ%ÆÆÑÿÉ&ÏÆºÿË&ÉÉÒÊÊÕñĞMîÔJÍÍØÎÎÖÎÎÚÿ×-ÿÙ.ÒÒÒÑÑÛÑÑÜÿÚ/ÒÒÜÛÓÇÓÓİñŞpÙÙÚÿè6ÿé6ßßãààçòßÅäääÿöNææêÿ÷Oÿ÷Pÿ÷\\êêìíííòíçîîòïïñòïëññóòòôûóæôôôôôöôô÷õõ÷öööööø÷÷ùıışÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0é\0ÿ	ü—¨\r“\'O’¤I4°á¡+d!\"ôGÌ•C\rÿ-Zó%Ğ˜,ªìÑ‚fQCEGîx¹á§Pr„(jhÈŸs\nšğ¦…¡†…XÔ¡ĞğÁ™…\ZÚÀ&Â §ƒpÁĞg \")†ˆˆÂ5Ê‡&|ĞØÄ<xÒªÅcL4ÂÄ™Kw.œ2(hì0Eß¿jÌtùq¡ƒÀ\nA¶(Î’‹\'2VH¨p8†*Rœ()¢ÃÅ	(ÿ« Š$@rÀXAÂƒ†¢+”XR„G\'BpÈ`h#$@pÀ@\0`ä_@\0;','GIF89a\0\0çŒ\0šWšX”Y*šYš[š\\š] š_!š`!ša\"šc#”f8İxæ—•’’¥æ‡–šæšš«››®³™ˆÿŒé•¨Ÿ£ÿÿ“ª£¥ÿ•\n½¡‰ÿ—Î¤Xÿšÿš\rĞ¥Y¨¨¸ÿœİ¦;Ò§[ÿŸî¦Ó¨\\æ§2ÿ¡¬¬¼­­½ÿ¤ÿ¤ÿ¥æ¬4ÿ¦¯¯¿Ë¬‰ÿ¨°°Á±±Á²²¼ÿ«ÿ¬Û±aÿ­´´Äß°gÿ¯ÿ¯æ¶9µµÄŞ³cà±jÿ²Ç´©··Æÿ´\Z¹¹Éÿ¶ÿ·ººËÙ·Šÿ¹½½Ìÿ¼æ»kÿ½éÄ@ÿ¿ ÁÁÊÿÄ#ÄÄÒÿÇ%ÿÈ%ÆÆÑÿÉ&ÏÆºÿË&ÉÉÒÊÊÕñĞMîÔJÍÍØÎÎÖÎÎÚÿ×-ÿÙ.ÒÒÒÑÑÛÑÑÜÿÚ/ÒÒÜÛÓÇÓÓİñŞpÙÙÚÿè6ÿé6ßßãààçòßÅäääÿöNææêÿ÷Oÿ÷Pÿ÷\\êêìíííòíçîîòïïñòïëññóòòôûóæôôôôôöôô÷õõ÷öööööø÷÷ùıışÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0é\0ÿ	ü—¨\r“\'O’¤I4°á¡+d!\"ôGÌ•C\rÿ-Zó%Ğ˜,ªìÑ‚fQCEGîx¹á§Pr„(jhÈŸs\nšğ¦…¡†…XÔ¡ĞğÁ™…\ZÚÀ&Â §ƒpÁĞg \")†ˆˆÂ5Ê‡&|ĞØÄ<xÒªÅcL4ÂÄ™Kw.œ2(hì0Eß¿jÌtùq¡ƒÀ\nA¶(Î’‹\'2VH¨p8†*Rœ()¢ÃÅ	(ÿ« Š$@rÀXAÂƒ†¢+”XR„G\'BpÈ`h#$@pÀ@\0`ä_@\0;',NULL,NULL,NULL,NULL),(27,'sys','permissions_gray.gif','image/gif',1053,'2013-12-14 18:15:36',1053,'GIF89a\0\0ç<\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~€€€‚‚‚ƒƒƒ„„„………†††‡‡‡ˆˆˆ‰‰‰ŠŠŠ‹‹‹ŒŒŒ‘‘‘’’’“““”””•••–––———˜˜˜™™™ššš›››œœœŸŸŸ   ¡¡¡¢¢¢£££¤¤¤¥¥¥¦¦¦§§§¨¨¨©©©ªªª«««¬¬¬­­­®®®¯¯¯°°°±±±²²²³³³´´´µµµ¶¶¶···¸¸¸¹¹¹ººº»»»¼¼¼½½½¾¾¾¿¿¿ÀÀÀÁÁÁÂÂÂÃÃÃÄÄÄÅÅÅÆÆÆÇÇÇÈÈÈÉÉÉÊÊÊËËËÌÌÌÍÍÍÎÎÎÏÏÏĞĞĞÑÑÑÒÒÒÓÓÓÔÔÔÕÕÕÖÖÖ×××ØØØÙÙÙÚÚÚÛÛÛÜÜÜİİİŞŞŞßßßàààáááâââãããäääåååæææçççèèèéééêêêëëëìììíííîîîïïïğğğñññòòòóóóôôôõõõööö÷÷÷øøøùùùúúúûûûüüüııışşşÿÿÿ!şCreated with The GIMP\0!ù\n\0ş\0,\0\0\0\0\0\0\0á\0ı	ôg\Z¯_¿vI³7°a=cÏäÙ£÷Î™±z\rıõ›¶,Ş³X®„©;&­_Ã{¹Ì)›å­YßnİkHOV;UáÊã”í=š®ÈujHIšªŸß•¢–‰Sz“‰r7PÜ­V·T!Dˆª+[âòÂ†îœÙ³fÍ-ã%0V3npãÂİU,§‚IÛËw/2[ N	ütë˜aÃÆˆõŠÕJÓ§Á°~ûÕk.Z¯X¥²ôØß§V”uÙ¢«•ªS¤$uş´Š®Z²2§2%\n”¢Î¸Ş°Y£FM\Z4gÌ”)c—¿€\0;','GIF89a\0\0ç<\0\0\0\0			\n\n\n\r\r\r\Z\Z\Z   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~€€€‚‚‚ƒƒƒ„„„………†††‡‡‡ˆˆˆ‰‰‰ŠŠŠ‹‹‹ŒŒŒ‘‘‘’’’“““”””•••–––———˜˜˜™™™ššš›››œœœŸŸŸ   ¡¡¡¢¢¢£££¤¤¤¥¥¥¦¦¦§§§¨¨¨©©©ªªª«««¬¬¬­­­®®®¯¯¯°°°±±±²²²³³³´´´µµµ¶¶¶···¸¸¸¹¹¹ººº»»»¼¼¼½½½¾¾¾¿¿¿ÀÀÀÁÁÁÂÂÂÃÃÃÄÄÄÅÅÅÆÆÆÇÇÇÈÈÈÉÉÉÊÊÊËËËÌÌÌÍÍÍÎÎÎÏÏÏĞĞĞÑÑÑÒÒÒÓÓÓÔÔÔÕÕÕÖÖÖ×××ØØØÙÙÙÚÚÚÛÛÛÜÜÜİİİŞŞŞßßßàààáááâââãããäääåååæææçççèèèéééêêêëëëìììíííîîîïïïğğğñññòòòóóóôôôõõõööö÷÷÷øøøùùùúúúûûûüüüııışşşÿÿÿ!şCreated with The GIMP\0!ù\n\0ş\0,\0\0\0\0\0\0\0á\0ı	ôg\Z¯_¿vI³7°a=cÏäÙ£÷Î™±z\rıõ›¶,Ş³X®„©;&­_Ã{¹Ì)›å­YßnİkHOV;UáÊã”í=š®ÈujHIšªŸß•¢–‰Sz“‰r7PÜ­V·T!Dˆª+[âòÂ†îœÙ³fÍ-ã%0V3npãÂİU,§‚IÛËw/2[ N	ütë˜aÃÆˆõŠÕJÓ§Á°~ûÕk.Z¯X¥²ôØß§V”uÙ¢«•ªS¤$uş´Š®Z²2§2%\n”¢Î¸Ş°Y£FM\Z4gÌ”)c—¿€\0;',NULL,NULL,NULL,NULL),(28,'sys','preview.gif','image/gif',366,'2013-12-14 18:15:36',366,'GIF89a\0\0¥?\0\0\0\0/>N.@T9IZ9MZJLJ9QcBMcBQkAVeZq„ZqŒZuŒsusc}”c}œc‚œc‚¥k‚œk†¥kŠ¥kŠ­k­s–½„–­„šµ{½{Æ„½Œµ„¢ÆŒ¢µ„¦ÆŒ¦ÆŒªÎ”ª½”®Î­ª­œ²Îœ¶Îµ²µµ¶µ­¾Ö­ÃÖ­ÃŞµÃÎµÇÖµÇŞµËŞÎ×çÖÛŞÖßçÖßïÖãïççïçë÷çï÷ïï÷÷÷÷÷÷ÿÿûÿÿÿÿ!ù\n\0?\0,\0\0\0\0\0\0\0‹ÀŸP(TÂ¤2PX,@™42)[íõa¨*ÇtÛõx´™`F —ÍÜƒE¦m	$ŠÙt>8xB\0)\"$~95wJ\0-{\"}3%„?*#2{lm\r&,(\Zšm\0DT›FG?¹°»?\0À+Â»Å\'ÈTÊÍÎSA\0;','GIF89a\0\0¥?\0\0\0\0/>N.@T9IZ9MZJLJ9QcBMcBQkAVeZq„ZqŒZuŒsusc}”c}œc‚œc‚¥k‚œk†¥kŠ¥kŠ­k­s–½„–­„šµ{½{Æ„½Œµ„¢ÆŒ¢µ„¦ÆŒ¦ÆŒªÎ”ª½”®Î­ª­œ²Îœ¶Îµ²µµ¶µ­¾Ö­ÃÖ­ÃŞµÃÎµÇÖµÇŞµËŞÎ×çÖÛŞÖßçÖßïÖãïççïçë÷çï÷ïï÷÷÷÷÷÷ÿÿûÿÿÿÿ!ù\n\0?\0,\0\0\0\0\0\0\0‹ÀŸP(TÂ¤2PX,@™42)[íõa¨*ÇtÛõx´™`F —ÍÜƒE¦m	$ŠÙt>8xB\0)\"$~95wJ\0-{\"}3%„?*#2{lm\r&,(\Zšm\0DT›FG?¹°»?\0À+Â»Å\'ÈTÊÍÎSA\0;',NULL,NULL,NULL,NULL),(29,'sys','previous.gif','image/gif',542,'2013-12-14 18:15:36',542,'GIF89a\0\0ÆH\0^¾#eÅ%hÅ&lË&mÊ)nË+oË+sÑ.vÑ0wÒ1wÒ1|Ø3}Ø4~Ø5~×6Ø6„Ş;†Ş;†ß=Œä@åAå_‡ÉRŒÖF•ëF–ëcÎ^“ØI›ñg“ÒKñKòb™İk˜ÖbœâP¤÷Q¤ø\\¡ëlœÛ\\¡ìQ¥øR¥øgŸãP¨ıR©ıSªıTªık¥ç^°ÿf¯øf´ÿ«Úqºş’³á–µáƒÂş¥½â—Ëı™Ìü¨Íõ¬Óú´ÙıÈÜõÆâşÍáøÉäıÔáòÊäşĞæüÕêıëôıõõøÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0b€‚‚F:=ƒˆE7+<‰‚A4.#;?0-)%/* C2.$9,,(\nD1\r\0‚@\'!\Zƒ>\"	5‚B&6Ö‚G38ˆ\0;','GIF89a\0\0ÆH\0^¾#eÅ%hÅ&lË&mÊ)nË+oË+sÑ.vÑ0wÒ1wÒ1|Ø3}Ø4~Ø5~×6Ø6„Ş;†Ş;†ß=Œä@åAå_‡ÉRŒÖF•ëF–ëcÎ^“ØI›ñg“ÒKñKòb™İk˜ÖbœâP¤÷Q¤ø\\¡ëlœÛ\\¡ìQ¥øR¥øgŸãP¨ıR©ıSªıTªık¥ç^°ÿf¯øf´ÿ«Úqºş’³á–µáƒÂş¥½â—Ëı™Ìü¨Íõ¬Óú´ÙıÈÜõÆâşÍáøÉäıÔáòÊäşĞæüÕêıëôıõõøÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0\0,\0\0\0\0\0\0\0b€‚‚F:=ƒˆE7+<‰‚A4.#;?0-)%/* C2.$9,,(\nD1\r\0‚@\'!\Zƒ>\"	5‚B&6Ö‚G38ˆ\0;',NULL,NULL,NULL,NULL),(30,'sys','print.gif','image/gif',1721,'2013-12-14 18:15:36',1721,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:2B010B4069DD11E0864E8F881E47E1D9\" xmpMM:InstanceID=\"xmp.iid:2B010B3F69DD11E0864E8F881E47E1D9\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8D7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>E¡Æ‘\0\0ëIDATxÚbüÿÿ?0311ı422j F˜ËçÏŸÿ_¹r… €@\"¿şüäîÏÿ®u‡~3¿~ıúïß¿ÿÙş|dXİ›É@p=0ÀÔÔÔÄyáéßÿo?ÿ\0Ë0şùóçÿ·oßÀ²\\\\\\,;wîdàà\0Ü»} €À¶€ğ›OßÁÚŞ|úñ¿vÓ£ÿvÙ[ØAâ ºòğğÜ•`xş…•áÍWFIA†Óß×\\Ü<¹åçÏŸ»¸¹¹^>¹ÏğêùsˆK€Øû<ƒgH2Ü™i3Oíb`€ğş3üıûÿß¼lsf€\0Âğ:\0™ÆàÕ~ô×{`p¼ûòóÿçŸÿ§Lºı\rE3Óß‡ïYî¾cbà`fbh‹“æLLLä‡³´´ôÿ[?DY¼å˜€Ê_}e`âga‘«NKK;Æ\0\n©Ó§Oÿÿôé\n‰üc¹}û6Ã™3g¾|ùw˜„„˜>ş<#Ó…^½zÅ\0Œ 8¾xù\ZÃ½{÷<y	‡¤i\'ÿ²011ABà?###Ã¬tSF ÀPÂã	œ|ìÑLŒÎ 9 üÁğŸhØß¿ı?íH§uF@Á\"„}:}%Ÿ³ÿ\0ñïÿ\'üüèÎÿ?~ÿıöÙŸÿ-ÛıwªÜ¿YÈ`\"JRşs¸0ƒÄÆ²Ÿ	fÃáÛ?~ıûÇc\'ÆpèÌÃà¨¨¨Ï¿~ı*X³fÍ\\ÆÆÆÆKºbbbS§Ne dgg3Ü¹s‡aÒ¤IwY€)\\W]],¡§§Ç`bbÂğæÍ¬\ZEDD9Â ((È`jjÊ\0L…Ê,ÀHcØ³gX(:-Zfÿøñƒáë×¯ÀüÅğñãG0ùYGG‡AHH¬dcrròL ,ÿş­Ëi›Ï05ÉˆáÛ/H²ı÷œl~ÿıËğÙsÎ22ìPÉJ‚É™\0\0 J“TÍ7LW\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:2B010B4069DD11E0864E8F881E47E1D9\" xmpMM:InstanceID=\"xmp.iid:2B010B3F69DD11E0864E8F881E47E1D9\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8D7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8C7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>E¡Æ‘\0\0ëIDATxÚbüÿÿ?0311ı422j F˜ËçÏŸÿ_¹r… €@\"¿şüäîÏÿ®u‡~3¿~ıúïß¿ÿÙş|dXİ›É@p=0ÀÔÔÔÄyáéßÿo?ÿ\0Ë0şùóçÿ·oßÀ²\\\\\\,;wîdàà\0Ü»} €À¶€ğ›OßÁÚŞ|úñ¿vÓ£ÿvÙ[ØAâ ºòğğÜ•`xş…•áÍWFIA†Óß×\\Ü<¹åçÏŸ»¸¹¹^>¹ÏğêùsˆK€Øû<ƒgH2Ü™i3Oíb`€ğş3üıûÿß¼lsf€\0Âğ:\0™ÆàÕ~ô×{`p¼ûòóÿçŸÿ§Lºı\rE3Óß‡ïYî¾cbà`fbh‹“æLLLä‡³´´ôÿ[?DY¼å˜€Ê_}e`âga‘«NKK;Æ\0\n©Ó§Oÿÿôé\n‰üc¹}û6Ã™3g¾|ùw˜„„˜>ş<#Ó…^½zÅ\0Œ 8¾xù\ZÃ½{÷<y	‡¤i\'ÿ²011ABà?###Ã¬tSF ÀPÂã	œ|ìÑLŒÎ 9 üÁğŸhØß¿ı?íH§uF@Á\"„}:}%Ÿ³ÿ\0ñïÿ\'üüèÎÿ?~ÿıöÙŸÿ-ÛıwªÜ¿YÈ`\"JRşs¸0ƒÄÆ²Ÿ	fÃáÛ?~ıûÇc\'ÆpèÌÃà¨¨¨Ï¿~ı*X³fÍ\\ÆÆÆÆKºbbbS§Ne dgg3Ü¹s‡aÒ¤IwY€)\\W]],¡§§Ç`bbÂğæÍ¬\ZEDD9Â ((È`jjÊ\0L…Ê,ÀHcØ³gX(:-Zfÿøñƒáë×¯ÀüÅğñãG0ùYGG‡AHH¬dcrròL ,ÿş­Ëi›Ï05ÉˆáÛ/H²ı÷œl~ÿıËğÙsÎ22ìPÉJ‚É™\0\0 J“TÍ7LW\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(31,'sys','quickAccess_accountInfo.png','image/png',3852,'2013-12-14 18:15:36',3852,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0®IDATxÚbüÿÿ?6ÀÂŸ>ù‡!\"8_w0ŞyŸÁ$f&ÃêU+á’Œ—úÿ_uâÅÿ“şıêc&Ì¦û¦*b\"Ü_¿}gøòõ;DËÿ™2ÿİİİE@a€\0bÄéªWoŞÿçä`Cdfff`áåádx¤”áàîSßÕÓÁşAÿşşı?uÅ£ÿWŸıı¿zõ\Z°‹^¼xùŸéÇÏ_>î2L¬ŒoŞ¼»èÓ «®¤i¿:ôKxx¸*Ø…PW#”ƒİih\0¤äqÆŸ¾0|şò•áÑú†/+Ö×[ùØ0ÈÆ¿ÿü»±!•aÁö—\nò\\ÂrX1„GD¡ØğíÛHd,\\¸ˆaÿ¾ßé«€!Ëğ—l?Ãµ+—._¹qÿúù¢óÏŸ?ÿoe$ÿŸ8qâÿWßşƒñ¡c§şƒÄÑÃ\ZM¡™ÿ§Éüïg`àÀåQd@ŒD0Mš4i\'Ô‰10Qjƒlø\n.b\0/O$²\0/Ãf0ÆÀÁúzo\"ƒ’™Ã³koş	«0ğ«0 ¤u\rGÊ,ÌËç]b`Pd¸{ˆ‡ÁÕçCPp8}bµá5¯5ƒ‰ª7¯önq†—>1H	ãpÒ¦ÇL’ú×>°10cùùËï¬Ì,ö¬€E\"+‚Béû÷;ŸeĞ3±bø\rÌÊL@M¿ÿaPàıÍğùë7°úï?~0(+ÈF2µ¶¶a3Ûo†¯_³*#Ë?†c›0pp°3Hˆ‰0HŠ‹0(ÉË€,xÃ0Ÿıÿ-ïÿ—CÕ_ûùù1DEE™ÖÕÕaMàTñÿ®ïÿ£f,ïˆIG €µª	m\"\nÂßnv7­$M¶¡¤?†T\ZÔJÄƒÒ‹?µH¡/B+”BA„â¡ô\"¹¨…êAÅ£7aÕ¢àQ©xP\ZD\"±b© ¤mÚÚu7Ù¼]çí&MUSèƒá=vyof¾ùæ›si§K(e}K¯A‘Eˆ„(¸;q\rQ„@gÆÁ«úW>Îî_Ú²Ü0–Ê\Zdr ÕxÏ~|´utŸ‡M,<Ğş3jÎ:\\M¿¨œV\\OÏÁ·ï–SÏğ<¹Œh$†şÄ‹º¡aŒA\r*Í£(2|KSğ{?Á/¼ÆoÁÆbêî¿QaìÂW=ŒL&S·ÎÃ-fó%<E5ŠŸï5\\¾3‡xß%Äºz18Ğ@N=ĞÍ<rBé/YÌ¿,ÑÕÛAdY-D…‚Iô¶1yí*âgFÑ‹C¡ŞTD·3¸Æ©ĞºÇ\'Ÿ±ğ§ûúİ¢nCOF¬ˆFÚ+E.27¥ìæ&u‹Š6Ÿ\rƒäØ¤®~£H”h€=Èn´Àëõ:-ÈêÄPÊH7òô›AEÀJBxóÖmÌÎÜ3sÓDmó‘&²\0ĞA»JRm®ÌC”ŠÔâŠï‡¤bô­ª\\[•ÇäìğØ¡ïáëã¡ãÇâÂÀ‰‰S\'¯ì?p°µ¹¥Õ‰~}5O¥>$t]ŸÖ4\r\\dšƒG#şÖÙ˜¦ñ‘¼Ø½b>kóq’ìñ¬İöÔ;KÿgRèôÉë¡—#?^Í±ö€±›RñG\0Ú«%¦‰(ŠşÛ™Ò*\nhY‹€\n1Aeã\n\rºÃ…\Zu¡	‰ºRwº0êÆÿVcb\"hL$jLPùX‘DQÀˆŸ\nÅ:åÓï›Ø*„Bô&w:o¦ïİ¼;÷sŞÇ\"5ş³©y*úåŸzmmmÓDùnïë÷Ü4ÈHªf£H\Zs¯!Ô§iQäTMşÚÆ\")+]ö«×3¾S©åFÓR\rr&ã4•BM(E5«‹Pt‚Ÿg2`‹¦âë¯#Ÿ_Ê÷Ü¢\"èÌöÉwŠ‚©B³üifí3Xf%Z;DØ§]dFé¢Õş½os#æ$\\ºrF!;NlS))RãÛ“c°ÚÂ°¤&a$d…?¬Âg¯ûN]Awãé¸I³N«}ğ#’³1„à}×‰ç-_àzàjò`I–Ë;:ˆk#sO‘yÃ9ül=„æ7Atõ`4eì«J iñb8dAHGZÚ ÜîWÈÏ/˜eŠhCMûa[QsÿH¡RŒù³°ÌQŒ¼b	&Í8ôü<<kD‰}çÎÍfK<E¬14!¿ˆ‹_0ß¾…[ÖÃˆàÓw	‹8ª\nHÏæÑHÆÊ‚<®YK;×&¶–[Ûæó`Ê\"Ó©Gaù^š¬Q1RÔQ¢˜_°@‡,g1ÚÚÛ‘·\"?®{YSNĞg’ÀÿPWW\'w^oo/ôB*¾ˆà}D•á(\Z2NHQéïÅ˜1Œ–\'Ñ×ó!FéJqİ¿gÏîß**vÊƒÎÎN<xô¹‹P™(\0“ÃvY»˜tÄPô@t8°qSé_zšñq,È-<®”_NN|ß?Ñ!¹Vâ¶yŠ[Lìx@B>ä:$]4rzÇ™âS<¢x\\\0ÕÄQ’ªIH6ã®ë\Z´ûlAÜÈœÆá‰ı†»ÈÌ\\ªèĞÈ”û‘½<ÏÉRï‡Ë…´Ò‹ŠpÛuÛ¨äŒº(Œ0Mäÿ)âÅÃ;(/ß.=›7UWW¿Š²;ä)¼®rİ«­UâÜ?y¢ïe ø°põê]3ìjó£««ëµÛíŞDr ­­MVÓ)ŠIN¾H«I[Yê.«2t¿Gàı4ÿZq4;çr{k«ª¬¬ÌÉqœ^Å·‹e¤¾¾>^–Ìd×xİÁÑîrIjX%â¥TŞJ‘-zJzèŞJiø° ] ÅëfÅ	¸ê{Rkf‰õ‰ø%@sVÛT†Ÿ{ÛÛŞvm×uí¶ìæsˆ âĞ°™ğ‘€Ã\"ş2òËàcbêã/MŒÆD‰Då3AÂñ	AÂ:\r¶ÁÆÆº±µëÖİŞÛ{ë{no»v+Û˜›ñ$ooÏí½§ç=çıx÷,:.ZìÆ¥¸C‰ï¿Àbÿ²1Z0Dˆè!-~Ôl(±I–å“ıƒİÉu<¦&¿Oy?µ?yŸuxLéÇ—¶®†™¡4n(ñ¾EØ»Ûèë©D>²\ntóLÓñ$Kñ~F›Mâuã;—Ç“Kí¥u2$})bÉ”@ıûße]1Â²¶uÛN=MŠÄ—¢1ì´s×Kx~z¾Ov(9™ynÆü—‚#|–S\\§Ç©gP\"ğ‡PzP¬È«;´hšÇ¦) „gQ€ËâŠ2h¥[a²(‰hTÃíùo£õÆ(6×eŞù¶T7£Œ ˜ôª“–Æ<&¹¨Õÿ\0!AÂÀµq·WÂ„9“ƒBƒ	Õ•Ë(w¶Ì	KÎ;Í®\0¡³{QôÒÆIf“lˆ*÷ãÄß`E….â;ÚÚáWÂ°Ømzóáq;5†jjl2QX³8øó2/Ñ±‘{è¹}Í×@‰Y`µå!¤:qÕo#ğ½ù‹Pãö@$sâiT%‚³¿F S_?AØ‡D\'ŠĞ„ÔYv€$Â{¡İGºI‰\n”,–\rGqøe|Rp=£¤q5K^ÄLv¸Mæ	fIp–ç@ËÈöõ`\"Æ‰ãG‘—_€uëÖÍ‰IÌìÄ3ì€X÷gúL¹î¨°ØpäÈ)Ü“Ë°rÃ2Ê¹<µxu¥2§bœªÊi”\\bx\rîl…¾,ŠÜY¸Õ#ÂO»ZU»võşú^®«CqqÉ¼N((x’:¾gÌXfpğ\n¢·.âëŸ.`L¬ÛåBÄúÊkJ›/B8X)$Û¹8ëÑ“ª1Î˜ÂÆˆ ¯Ğ‚dÆß…¨Y±\n§›š`±Záp8æeBv›)Ä»‚› ‘{Ú;–Ã>å—ãÙº((-„¬ÄéDššbÓ\'Ïr\'›<Ûéqâ‰ãô<GfYTéÏiÃÚµãF}}C¼–‹§í$d@\nl0¬EŠ(Æ310ÄğD\"lv‰éÃï÷CF¡ÆˆLeñpZb`GbŒ\n2aõâhÌ(æO+K—Ú(¯Ğ‚°äIE!†#X¬… 1zˆXrbé“®D’ÏFYÉÖ¨Üé×ÒÒ2rjrxòÄ™L>Åyèõ4vB‘¸jS`g˜\njº\ríàÜéëC>9´¸«7ËŠ’~:…ËGY½:…Ô)Qh\ZtfœĞÚçõâõ;Ğ×{WÏCïÃ^:ˆÏ¢UuçË¦+ù.E\"CèÃÿİ.ÄµÅÆq§õ\nFA¬YS«kÌ\"^*Õe“Ë$ñß4=„jjæˆ)´‰ó^W\"®ÅÊåÕè¬]¿ÚÛÑv©	-6Ùo½îÔléÙ¢MÅ›‰Ud¥\rI#Ğß…»m­‰aÓæ-ô…j%n×Ñ¨š^ÑÌtxÂ1 5?y¢¥\ZvŠ¸„Å7ò¯éÑ´ºq÷ªzï[û²†]/‚î_oiÁÍÖV%Ï›+¸<>ä.ÉîuºsÈ´,ºÒŠ¬rrxò¨v^qvwv*.^ì8şüåj)µ`ÍÕ¨që™ùç©;ğø0ğ3í¸è°›÷•7V}²ô@M®cˆOC6 XQñÙ—\'	\0íù  \0ÏUV®öz}¯y½¹µÙ.W‘(ZmÏkQ%\Zï…B—‚Áà™æææîõë×kñ¹ãéJs¡”ßÆAÌ¶›ß®j¬ú´êıš«Fñ¯£è€ÔÀíæ‰á®ëÚGÁ¾#—w/744èaM$ÏfÂü‡Uh¬¹ÌDØD]–7«÷T~µâ@ÛÆ&~÷Ğõ÷¸Ñ,\rŞiUDñÙX¤qAÙB)`ÚMe\n³ÓÖÙI“ïC¸;ˆ«Í’¿í†zhHÁ÷”Ò\"ïıŸ«ô±¨ÊqñÛ³ì(~¬ı>¨àXñjş%XeèàFÛ\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0®IDATxÚbüÿÿ?6ÀÂŸ>ù‡!\"8_w0ŞyŸÁ$f&ÃêU+á’Œ—úÿ_uâÅÿ“şıêc&Ì¦û¦*b\"Ü_¿}gøòõ;DËÿ™2ÿİİİE@a€\0bÄéªWoŞÿçä`Cdfff`áåádx¤”áàîSßÕÓÁşAÿşşı?uÅ£ÿWŸıı¿zõ\Z°‹^¼xùŸéÇÏ_>î2L¬ŒoŞ¼»èÓ «®¤i¿:ôKxx¸*Ø…PW#”ƒİih\0¤äqÆŸ¾0|şò•áÑú†/+Ö×[ùØ0ÈÆ¿ÿü»±!•aÁö—\nò\\ÂrX1„GD¡ØğíÛHd,\\¸ˆaÿ¾ßé«€!Ëğ—l?Ãµ+—._¹qÿúù¢óÏŸ?ÿoe$ÿŸ8qâÿWßşƒñ¡c§şƒÄÑÃ\ZM¡™ÿ§Éüïg`àÀåQd@ŒD0Mš4i\'Ô‰10Qjƒlø\n.b\0/O$²\0/Ãf0ÆÀÁúzo\"ƒ’™Ã³koş	«0ğ«0 ¤u\rGÊ,ÌËç]b`Pd¸{ˆ‡ÁÕçCPp8}bµá5¯5ƒ‰ª7¯önq†—>1H	ãpÒ¦ÇL’ú×>°10cùùËï¬Ì,ö¬€E\"+‚Béû÷;ŸeĞ3±bø\rÌÊL@M¿ÿaPàıÍğùë7°úï?~0(+ÈF2µ¶¶a3Ûo†¯_³*#Ë?†c›0pp°3Hˆ‰0HŠ‹0(ÉË€,xÃ0Ÿıÿ-ïÿ—CÕ_ûùù1DEE™ÖÕÕaMàTñÿ®ïÿ£f,ïˆIG €µª	m\"\nÂßnv7­$M¶¡¤?†T\ZÔJÄƒÒ‹?µH¡/B+”BA„â¡ô\"¹¨…êAÅ£7aÕ¢àQ©xP\ZD\"±b© ¤mÚÚu7Ù¼]çí&MUSèƒá=vyof¾ùæ›si§K(e}K¯A‘Eˆ„(¸;q\rQ„@gÆÁ«úW>Îî_Ú²Ü0–Ê\Zdr ÕxÏ~|´utŸ‡M,<Ğş3jÎ:\\M¿¨œV\\OÏÁ·ï–SÏğ<¹Œh$†şÄ‹º¡aŒA\r*Í£(2|KSğ{?Á/¼ÆoÁÆbêî¿QaìÂW=ŒL&S·ÎÃ-fó%<E5ŠŸï5\\¾3‡xß%Äºz18Ğ@N=ĞÍ<rBé/YÌ¿,ÑÕÛAdY-D…‚Iô¶1yí*âgFÑ‹C¡ŞTD·3¸Æ©ĞºÇ\'Ÿ±ğ§ûúİ¢nCOF¬ˆFÚ+E.27¥ìæ&u‹Š6Ÿ\rƒäØ¤®~£H”h€=Èn´Àëõ:-ÈêÄPÊH7òô›AEÀJBxóÖmÌÎÜ3sÓDmó‘&²\0ĞA»JRm®ÌC”ŠÔâŠï‡¤bô­ª\\[•ÇäìğØ¡ïáëã¡ãÇâÂÀ‰‰S\'¯ì?p°µ¹¥Õ‰~}5O¥>$t]ŸÖ4\r\\dšƒG#şÖÙ˜¦ñ‘¼Ø½b>kóq’ìñ¬İöÔ;KÿgRèôÉë¡—#?^Í±ö€±›RñG\0Ú«%¦‰(ŠşÛ™Ò*\nhY‹€\n1Aeã\n\rºÃ…\Zu¡	‰ºRwº0êÆÿVcb\"hL$jLPùX‘DQÀˆŸ\nÅ:åÓï›Ø*„Bô&w:o¦ïİ¼;÷sŞÇ\"5ş³©y*úåŸzmmmÓDùnïë÷Ü4ÈHªf£H\Zs¯!Ô§iQäTMşÚÆ\")+]ö«×3¾S©åFÓR\rr&ã4•BM(E5«‹Pt‚Ÿg2`‹¦âë¯#Ÿ_Ê÷Ü¢\"èÌöÉwŠ‚©B³üifí3Xf%Z;DØ§]dFé¢Õş½os#æ$\\ºrF!;NlS))RãÛ“c°ÚÂ°¤&a$d…?¬Âg¯ûN]Awãé¸I³N«}ğ#’³1„à}×‰ç-_àzàjò`I–Ë;:ˆk#sO‘yÃ9ül=„æ7Atõ`4eì«J iñb8dAHGZÚ ÜîWÈÏ/˜eŠhCMûa[QsÿH¡RŒù³°ÌQŒ¼b	&Í8ôü<<kD‰}çÎÍfK<E¬14!¿ˆ‹_0ß¾…[ÖÃˆàÓw	‹8ª\nHÏæÑHÆÊ‚<®YK;×&¶–[Ûæó`Ê\"Ó©Gaù^š¬Q1RÔQ¢˜_°@‡,g1ÚÚÛ‘·\"?®{YSNĞg’ÀÿPWW\'w^oo/ôB*¾ˆà}D•á(\Z2NHQéïÅ˜1Œ–\'Ñ×ó!FéJqİ¿gÏîß**vÊƒÎÎN<xô¹‹P™(\0“ÃvY»˜tÄPô@t8°qSé_zšñq,È-<®”_NN|ß?Ñ!¹Vâ¶yŠ[Lìx@B>ä:$]4rzÇ™âS<¢x\\\0ÕÄQ’ªIH6ã®ë\Z´ûlAÜÈœÆá‰ı†»ÈÌ\\ªèĞÈ”û‘½<ÏÉRï‡Ë…´Ò‹ŠpÛuÛ¨äŒº(Œ0Mäÿ)âÅÃ;(/ß.=›7UWW¿Š²;ä)¼®rİ«­UâÜ?y¢ïe ø°põê]3ìjó£««ëµÛíŞDr ­­MVÓ)ŠIN¾H«I[Yê.«2t¿Gàı4ÿZq4;çr{k«ª¬¬ÌÉqœ^Å·‹e¤¾¾>^–Ìd×xİÁÑîrIjX%â¥TŞJ‘-zJzèŞJiø° ] ÅëfÅ	¸ê{Rkf‰õ‰ø%@sVÛT†Ÿ{ÛÛŞvm×uí¶ìæsˆ âĞ°™ğ‘€Ã\"ş2òËàcbêã/MŒÆD‰Då3AÂñ	AÂ:\r¶ÁÆÆº±µëÖİŞÛ{ë{no»v+Û˜›ñ$ooÏí½§ç=çıx÷,:.ZìÆ¥¸C‰ï¿Àbÿ²1Z0Dˆè!-~Ôl(±I–å“ıƒİÉu<¦&¿Oy?µ?yŸuxLéÇ—¶®†™¡4n(ñ¾EØ»Ûèë©D>²\ntóLÓñ$Kñ~F›Mâuã;—Ç“Kí¥u2$})bÉ”@ıûße]1Â²¶uÛN=MŠÄ—¢1ì´s×Kx~z¾Ov(9™ynÆü—‚#|–S\\§Ç©gP\"ğ‡PzP¬È«;´hšÇ¦) „gQ€ËâŠ2h¥[a²(‰hTÃíùo£õÆ(6×eŞù¶T7£Œ ˜ôª“–Æ<&¹¨Õÿ\0!AÂÀµq·WÂ„9“ƒBƒ	Õ•Ë(w¶Ì	KÎ;Í®\0¡³{QôÒÆIf“lˆ*÷ãÄß`E….â;ÚÚáWÂ°Ømzóáq;5†jjl2QX³8øó2/Ñ±‘{è¹}Í×@‰Y`µå!¤:qÕo#ğ½ù‹Pãö@$sâiT%‚³¿F S_?AØ‡D\'ŠĞ„ÔYv€$Â{¡İGºI‰\n”,–\rGqøe|Rp=£¤q5K^ÄLv¸Mæ	fIp–ç@ËÈöõ`\"Æ‰ãG‘—_€uëÖÍ‰IÌìÄ3ì€X÷gúL¹î¨°ØpäÈ)Ü“Ë°rÃ2Ê¹<µxu¥2§bœªÊi”\\bx\rîl…¾,ŠÜY¸Õ#ÂO»ZU»võşú^®«CqqÉ¼N((x’:¾gÌXfpğ\n¢·.âëŸ.`L¬ÛåBÄúÊkJ›/B8X)$Û¹8ëÑ“ª1Î˜ÂÆˆ ¯Ğ‚dÆß…¨Y±\n§›š`±Záp8æeBv›)Ä»‚› ‘{Ú;–Ã>å—ãÙº((-„¬ÄéDššbÓ\'Ïr\'›<Ûéqâ‰ãô<GfYTéÏiÃÚµãF}}C¼–‹§í$d@\nl0¬EŠ(Æ310ÄğD\"lv‰éÃï÷CF¡ÆˆLeñpZb`GbŒ\n2aõâhÌ(æO+K—Ú(¯Ğ‚°äIE!†#X¬… 1zˆXrbé“®D’ÏFYÉÖ¨Üé×ÒÒ2rjrxòÄ™L>Åyèõ4vB‘¸jS`g˜\njº\ríàÜéëC>9´¸«7ËŠ’~:…ËGY½:…Ô)Qh\ZtfœĞÚçõâõ;Ğ×{WÏCïÃ^:ˆÏ¢UuçË¦+ù.E\"CèÃÿİ.ÄµÅÆq§õ\nFA¬YS«kÌ\"^*Õe“Ë$ñß4=„jjæˆ)´‰ó^W\"®ÅÊåÕè¬]¿ÚÛÑv©	-6Ùo½îÔléÙ¢MÅ›‰Ud¥\rI#Ğß…»m­‰aÓæ-ô…j%n×Ñ¨š^ÑÌtxÂ1 5?y¢¥\ZvŠ¸„Å7ò¯éÑ´ºq÷ªzï[û²†]/‚î_oiÁÍÖV%Ï›+¸<>ä.ÉîuºsÈ´,ºÒŠ¬rrxò¨v^qvwv*.^ì8şüåj)µ`ÍÕ¨që™ùç©;ğø0ğ3í¸è°›÷•7V}²ô@M®cˆOC6 XQñÙ—\'	\0íù  \0ÏUV®öz}¯y½¹µÙ.W‘(ZmÏkQ%\Zï…B—‚Áà™æææîõë×kñ¹ãéJs¡”ßÆAÌ¶›ß®j¬ú´êıš«Fñ¯£è€ÔÀíæ‰á®ëÚGÁ¾#—w/744èaM$ÏfÂü‡Uh¬¹ÌDØD]–7«÷T~µâ@ÛÆ&~÷Ğõ÷¸Ñ,\rŞiUDñÙX¤qAÙB)`ÚMe\n³ÓÖÙI“ïC¸;ˆ«Í’¿í†zhHÁ÷”Ò\"ïıŸ«ô±¨ÊqñÛ³ì(~¬ı>¨àXñjş%XeèàFÛ\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(32,'sys','quickAccess_contacts.png','image/png',3101,'2013-12-14 18:15:36',3101,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0Wù‡\0\0\0gAMA\0\0±üa\0\0\0sRGB\0®Îé\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0bKGD\0\0\0\0\0\0ùC»\0\0\0	pHYs\0\0\na\0\0\naüÌJ%\0\0\0	vpAg\0\0\00\0\0\00\0ÎîŒW\0\0	ÖIDAThŞí™[Œ]UÇkí½ÏıÌ½—¹t\n´”BÕÆN<€0%±¨ÄMˆI½$6\nú ¾™ø€!¾hHúDHx$ jB	†ˆ†iS°”I;-e`.ûœ™3g_¾åÃ¾œ}fÎ™zyĞ„~ÉÉŞ{í½×úß÷ÿ.k¸&×äš\\“kòqm Øèÿ5¨«H\0Ì*¥>4Æøñàş\'N¼(\"æÿ]DÄ<şøã¯\0ûc(àK®ë>3yeA)ı¨ŸÃ¿9¾®£š\r×á$	BHcÀLx‚2ƒRêËÀ³vôFÖqœK–…c«FP4$\\‡„ç(<1\rcŠ4Î—¼§bÀuàá‘º\"Éy¢e.æ~\"Z)l[ñÜ›‹8:¶Še—\rÅT?ÄğÕÏöâ¦¹§t£BZ‡á&¢ª¯_G¸CÛ”›Ğ\n­4YGãhY(vi|^®Ò®WDÀµÚ¶ÍÄåËŠEÛæíso“ËåØ·oïœ;ÇâÒ¾ïsôèÑÈÊ1ğ:àähÒJ¶P@)…Ò\nK),0*¥H`pÅ 18¶…V:±.\nĞ\n­b\",Í™7Ï0°kÃ‡‘Ífæ…^`ii‰Ã‡“ËåğišlR ‰…-= ÑJaY¡{Uê^uİeşìóè•I‚¶ªÛ1Ô×C>—I¸¾¯~ÑÑÑÁôÔTÃ¢1ˆR©„ã8!-ÌFàà\rÀÍÕ)°\"Ô<ÃüïBµ²LßÀ.†º»XZxÓµ£|bO?™ŒBaĞ!Ï#\0Ü|óÍôõõ1>>ˆpjôwİuï¾ó.gÏÅ÷}9‚ïY§‰ÌU=–¥5–®ƒpÏ¿Œï®Ñµ­‡Éé)rÅ\"âù´­Ÿf½ÖC>›A©pq¥4Z‡±`ŒaçÎˆCCC%©ğ¶·%÷<¿	ğºŒ©+³uÄR\nËÒÉKÓS“¿ÿóXİ»qJŠÙ‰Küâ—§éÚïGÊê0]DÁ½U&IÃÄcZS\'\nê$6¶RÀŠ‚P[á 0Š=Æ4âz(;G×¶º©›ß ,TÄ´Ih|³u·Şğ|š5›²P¡B¶RìèïEÄ#`ã»KPÚI[ÁÁŠé§âÃŸ`pı\0×¦k¬­(eĞ€D \\Oj(«ë~bi“·‰‘«×¥#¢:`i˜Êàºê%,w\rKÛ <¨.óöê\0#íÅÄ[’ÊÆl­øÕè‚ÀpçşŞ¿R¥³dsîƒUnßÓÆÂªÏëï-që®å¼Å™ñ\n{{ó<_(å4«µ€İÛshÕÙÂ¡5–Òh+Š­)‹Œ¯oCVç	ªK˜õe^|s’½CÛÉeœ¨=0Ñ\"¡•Œ	+óçné`ä@\'´VÌ,yìŞS³p×şú:³Ô\\áÓ7”Xó„}}9ÄY[áhUo\ZZ‰&A¬ê1`iŠ‚ÒÖµ¶¸tá9n¼ñzÎ½7Î¤{½åa7V;1‚˜:¯c(d5Å¬FL\\©\rë®`iìÎ&¼èÊ\"ÆĞY°¨ºÂŞŞ<è,Úˆ¤ëlE!Ö\n[ƒµ	ğAgsô~ênéEúúzÉfòTÖjtwØZ£¡¥¤t\0oœ_FŒ¡»äµgÖéïÊ0Ø“åâÌ:kµ0ÿïhwğÃîí¹MEË4)hÍ)¤UäK+<QÌÏÌQ}æ)ÚOüsé#Ê¶Evf…»_ú5İ/ÿ†ógÿÎÄü\n®„Mp*ªn€¥‡o(SÈ„<80X ïhÆ§«ôw:¬T}»³Ô<¡¿3ƒˆ4Ì!&¾–¦Š³ßWŒ1OA€eişú<m±şĞèş`Œl±ˆåyXJa—Ë¨ÀÇqlŒí@.Ël×\0¾=7\rrÇ­=ø\"\rÕ“¦ÇÍ¹}sîÂ1ÃÎ=(¥îŞ\0Æ²Xşéè_š¦¶RÁŸ›G;6–mc­,£íèÜ¶Ñ…mÜ~êş\\ø\ZwÜÚSe@k’)) ˜r¾‘M€ã4k6Ô\0ÅUÚéØ4¾vÈyj±D 5µ¥%´m¡µ…m[h+üY¶í,ÓŞÓC_1@¦&Pjoâj­xk‘¶‚Å¶²¥ œ·˜_õ)8Š·.¯2²¿uO˜YöÑ:Š«3K.†\nÁõ…¥Õ\0O„¶¼n­@,ŠågŸBMNbJ%ìîmÌ~øRhK£-;VÀ²°³YÊ»¯gq~®ìß0Ü( ôufXXõ¨ºÂBÅ#ŸÕ¬T[CŞÑœ›XciÍ§£`áPÌiŞŸ­Ñ–ÓLÌ¹x¾àXŠ¹U0vå[Ç€ï‡M•m‡z™è—(¸a,>(%>nu½ëŠ:ãk‰³I*¿Ç»-1+E·tÖ1ÆàÂ®şÍc ¶œçºM\Z°\rÁ¶©)3M‚Tšä†À¬ïÂ{~’÷Sqğ¯4sñÆ>mñÖ–iº@³ÌbR“™–óÄc›7ğéµD¶(d=ö™L¦©©«–ßU1 U§N±¦ş\\ú¶j¾‰¶J±W]×åÁh®À7¾ù­ºæ,Õº7oa±ë§hÒ’‚4™«qNcØÚM&MW×æIû ijAAÓò~ƒgSk[*Ğ¢jæsÙ$35×ó¨TÖêcÊê‰İSFQ@wg™ŒÓrÎõšËÌ•¹ÍŸ[¶\nâfe¿X(ğê«¯Œ?~üÅÅEãBíííùG}ôğÈÈÈ®…ÅåÈ´¦ˆzz:9yòä¥cÇ½Q©TÖ6ÎY.—í\'Ÿ|ò3Gî¹ç¦&g›õh®\rû†:°RY#bíez{{¿855õ.á—á²£T*}}eeåé+sQÈE‹Å†HmÆE„¾”ËåŸU*•ß³±Î)ÑİİİŸœıíù‹—ÑJ%^\raÏ×µª’¸*NyA \\¸pá`±X<ÙÂÛï?ñÄ?Dšî›5oïóÚk¯\r<xğt+\n}¯VsëÔÙ`”DÓ»çyI`‰A¶¯Ë+ãd2‰ÈŠïûßN¿\\©T¾#\"•{ïıÂ}³sFÄH@HrŒç’ ~=5=köİ²ÿ˜ˆx«««ßOÏéûşwEÄËç?œ˜œ6\"‚~€IÃI´ƒeäá‡>uµoó§Òô»ğß~ï»\0´Ç“.,,Œ^íGyä-`$€îh`Íÿ¡1Wÿ4<<|qtt­u—ˆ!üg§uŠÚZ`Bkı’ˆÌ3::z=p\'Ğ“Â—.æÒ8DßÜ[ˆÔh¸ıÁÇRÜÔµŠæt¶xg=ÂsM®ÉÇ^ş	 Zú“H*ç\0\0\0%tEXtcreate-date\02009-11-15T17:02:35-07:00…¦\0\0\0%tEXtdate:create\02010-01-11T09:31:26-07:00›kq\0\0\0%tEXtdate:modify\02010-01-11T09:31:26-07:00nÆÓÍ\0\0\0gtEXtLicense\0http://creativecommons.org/licenses/by-sa/3.0/ or http://creativecommons.org/licenses/LGPL/2.1/[<c\0\0\0%tEXtmodify-date\02009-06-03T09:58:17-06:00ØÕAD\0\0\0tEXtSource\0Oxygen Iconsì®è\0\0\0\'tEXtSource_URL\0http://www.oxygen-icons.org/ï7ªË\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0Wù‡\0\0\0gAMA\0\0±üa\0\0\0sRGB\0®Îé\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0bKGD\0\0\0\0\0\0ùC»\0\0\0	pHYs\0\0\na\0\0\naüÌJ%\0\0\0	vpAg\0\0\00\0\0\00\0ÎîŒW\0\0	ÖIDAThŞí™[Œ]UÇkí½ÏıÌ½—¹t\n´”BÕÆN<€0%±¨ÄMˆI½$6\nú ¾™ø€!¾hHúDHx$ jB	†ˆ†iS°”I;-e`.ûœ™3g_¾åÃ¾œ}fÎ™zyĞ„~ÉÉŞ{í½×úß÷ÿ.k¸&×äš\\“kòqm Øèÿ5¨«H\0Ì*¥>4Æøñàş\'N¼(\"æÿ]DÄ<şøã¯\0ûc(àK®ë>3yeA)ı¨ŸÃ¿9¾®£š\r×á$	BHcÀLx‚2ƒRêËÀ³vôFÖqœK–…c«FP4$\\‡„ç(<1\rcŠ4Î—¼§bÀuàá‘º\"Éy¢e.æ~\"Z)l[ñÜ›‹8:¶Še—\rÅT?ÄğÕÏöâ¦¹§t£BZ‡á&¢ª¯_G¸CÛ”›Ğ\n­4YGãhY(vi|^®Ò®WDÀµÚ¶ÍÄåËŠEÛæíso“ËåØ·oïœ;ÇâÒ¾ïsôèÑÈÊ1ğ:àähÒJ¶P@)…Ò\nK),0*¥H`pÅ 18¶…V:±.\nĞ\n­b\",Í™7Ï0°kÃ‡‘Ífæ…^`ii‰Ã‡“ËåğišlR ‰…-= ÑJaY¡{Uê^uİeşìóè•I‚¶ªÛ1Ô×C>—I¸¾¯~ÑÑÑÁôÔTÃ¢1ˆR©„ã8!-ÌFàà\rÀÍÕ)°\"Ô<ÃüïBµ²LßÀ.†º»XZxÓµ£|bO?™ŒBaĞ!Ï#\0Ü|óÍôõõ1>>ˆpjôwİuï¾ó.gÏÅ÷}9‚ïY§‰ÌU=–¥5–®ƒpÏ¿Œï®Ñµ­‡Éé)rÅ\"âù´­Ÿf½ÖC>›A©pq¥4Z‡±`ŒaçÎˆCCC%©ğ¶·%÷<¿	ğºŒ©+³uÄR\nËÒÉKÓS“¿ÿóXİ»qJŠÙ‰Küâ—§éÚïGÊê0]DÁ½U&IÃÄcZS\'\nê$6¶RÀŠ‚P[á 0Š=Æ4âz(;G×¶º©›ß ,TÄ´Ih|³u·Şğ|š5›²P¡B¶RìèïEÄ#`ã»KPÚI[ÁÁŠé§âÃŸ`pı\0×¦k¬­(eĞ€D \\Oj(«ë~bi“·‰‘«×¥#¢:`i˜Êàºê%,w\rKÛ <¨.óöê\0#íÅÄ[’ÊÆl­øÕè‚ÀpçşŞ¿R¥³dsîƒUnßÓÆÂªÏëï-që®å¼Å™ñ\n{{ó<_(å4«µ€İÛshÕÙÂ¡5–Òh+Š­)‹Œ¯oCVç	ªK˜õe^|s’½CÛÉeœ¨=0Ñ\"¡•Œ	+óçné`ä@\'´VÌ,yìŞS³p×şú:³Ô\\áÓ7”Xó„}}9ÄY[áhUo\ZZ‰&A¬ê1`iŠ‚ÒÖµ¶¸tá9n¼ñzÎ½7Î¤{½åa7V;1‚˜:¯c(d5Å¬FL\\©\rë®`iìÎ&¼èÊ\"ÆĞY°¨ºÂŞŞ<è,Úˆ¤ëlE!Ö\n[ƒµ	ğAgsô~ênéEúúzÉfòTÖjtwØZ£¡¥¤t\0oœ_FŒ¡»äµgÖéïÊ0Ø“åâÌ:kµ0ÿïhwğÃîí¹MEË4)hÍ)¤UäK+<QÌÏÌQ}æ)ÚOüsé#Ê¶Evf…»_ú5İ/ÿ†ógÿÎÄü\n®„Mp*ªn€¥‡o(SÈ„<80X ïhÆ§«ôw:¬T}»³Ô<¡¿3ƒˆ4Ì!&¾–¦Š³ßWŒ1OA€eişú<m±şĞèş`Œl±ˆåyXJa—Ë¨ÀÇqlŒí@.Ël×\0¾=7\rrÇ­=ø\"\rÕ“¦ÇÍ¹}sîÂ1ÃÎ=(¥îŞ\0Æ²Xşéè_š¦¶RÁŸ›G;6–mc­,£íèÜ¶Ñ…mÜ~êş\\ø\ZwÜÚSe@k’)) ˜r¾‘M€ã4k6Ô\0ÅUÚéØ4¾vÈyj±D 5µ¥%´m¡µ…m[h+üY¶í,ÓŞÓC_1@¦&Pjoâj­xk‘¶‚Å¶²¥ œ·˜_õ)8Š·.¯2²¿uO˜YöÑ:Š«3K.†\nÁõ…¥Õ\0O„¶¼n­@,ŠågŸBMNbJ%ìîmÌ~øRhK£-;VÀ²°³YÊ»¯gq~®ìß0Ü( ôufXXõ¨ºÂBÅ#ŸÕ¬T[CŞÑœ›XciÍ§£`áPÌiŞŸ­Ñ–ÓLÌ¹x¾àXŠ¹U0vå[Ç€ï‡M•m‡z™è—(¸a,>(%>nu½ëŠ:ãk‰³I*¿Ç»-1+E·tÖ1ÆàÂ®şÍc ¶œçºM\Z°\rÁ¶©)3M‚Tšä†À¬ïÂ{~’÷Sqğ¯4sñÆ>mñÖ–iº@³ÌbR“™–óÄc›7ğéµD¶(d=ö™L¦©©«–ßU1 U§N±¦ş\\ú¶j¾‰¶J±W]×åÁh®À7¾ù­ºæ,Õº7oa±ë§hÒ’‚4™«qNcØÚM&MW×æIû ijAAÓò~ƒgSk[*Ğ¢jæsÙ$35×ó¨TÖêcÊê‰İSFQ@wg™ŒÓrÎõšËÌ•¹ÍŸ[¶\nâfe¿X(ğê«¯Œ?~üÅÅEãBíííùG}ôğÈÈÈ®…ÅåÈ´¦ˆzz:9yòä¥cÇ½Q©TÖ6ÎY.—í\'Ÿ|ò3Gî¹ç¦&g›õh®\rû†:°RY#bíez{{¿855õ.á—á²£T*}}eeåé+sQÈE‹Å†HmÆE„¾”ËåŸU*•ß³±Î)ÑİİİŸœıíù‹—ÑJ%^\raÏ×µª’¸*NyA \\¸pá`±X<ÙÂÛï?ñÄ?Dšî›5oïóÚk¯\r<xğt+\n}¯VsëÔÙ`”DÓ»çyI`‰A¶¯Ë+ãd2‰ÈŠïûßN¿\\©T¾#\"•{ïıÂ}³sFÄH@HrŒç’ ~=5=köİ²ÿ˜ˆx«««ßOÏéûşwEÄËç?œ˜œ6\"‚~€IÃI´ƒeäá‡>uµoó§Òô»ğß~ï»\0´Ç“.,,Œ^íGyä-`$€îh`Íÿ¡1Wÿ4<<|qtt­u—ˆ!üg§uŠÚZ`Bkı’ˆÌ3::z=p\'Ğ“Â—.æÒ8DßÜ[ˆÔh¸ıÁÇRÜÔµŠæt¶xg=ÂsM®ÉÇ^ş	 Zú“H*ç\0\0\0%tEXtcreate-date\02009-11-15T17:02:35-07:00…¦\0\0\0%tEXtdate:create\02010-01-11T09:31:26-07:00›kq\0\0\0%tEXtdate:modify\02010-01-11T09:31:26-07:00nÆÓÍ\0\0\0gtEXtLicense\0http://creativecommons.org/licenses/by-sa/3.0/ or http://creativecommons.org/licenses/LGPL/2.1/[<c\0\0\0%tEXtmodify-date\02009-06-03T09:58:17-06:00ØÕAD\0\0\0tEXtSource\0Oxygen Iconsì®è\0\0\0\'tEXtSource_URL\0http://www.oxygen-icons.org/ï7ªË\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(33,'sys','quickAccess_makePayment.png','image/png',5142,'2013-12-14 18:15:36',5142,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0¸IDATxÚbüÿÿ?6ÀòöÃ†_¿~2°İ™òŸA»ĞêÃÇwÇ?ö…	$+ú{óÿ‡9ö|R=Æ <AR\\†‡qÃÎy{¹9DœxtÔ¬>¼ùÂ ##ŸÒÀzğä¦ÿ[ö.ú•èùÿİ™üÿ}‰¢(3± Œ@Œ8]õìÕ}0ce…ùÿ7Êañ‘i¼¼¼Œ, Áó«ÿ4}aĞc:ÏÀú™!3;ñ?ÃÊuş¿xıàÿ«·ÿ·v×ı·I`\0™ÍÌá²çè™íÿ>¹ùßÍ×äÿ×;}–\Z\"s\0ˆñÍûç?}º•	hÆ?†;³\Z@‚îÓşıÿËÀÊÊ\Züû÷ïµp×Â¯¦ügTtfx÷ë7ÃAû}*ïÛëÅ~¤00±üfàã`¸vı»0D##CÅÚOÖ_üæ0¼6áŞ»ß¡uM’<âŸŞe˜9ó9Ã–õ‡Ê™%¸wüù÷m±²’2ƒ¸ˆÃÖ›BCÃöÙÌÀûÛƒ¡¡b3ß÷[S6M]{»%0E%\n÷_ó÷‘ÿãS}A¾÷}·7îÿìJÏÿ£\0 ’5€ã¤ŒÀ4ğæİk¦Sµ\râŞ~üşÌğõÛ·½<ÜÜÎ0C9Ø¹˜uó©úÿÿËÓúƒşoÜ¼şÿ¥+g~üüşú¬©ÿÙØØüPãAàíÿëŒÿvßÿÇÀ“uœAì|6ƒ“#Ã`ø;:Ø2—•ndaúõnÃ‡óËŞ)—1ğ{1°\0“q1Ã½¿Yò*ÏæÍ_Îğëç†Û·osmøıç×½•ÔUÙ˜îØ0ÜÛ#Åğã-ƒfÑcNÖ{¯9·0|¹ªÀpüàu#†O¯ÿÏ-Kúÿúı“ÿËÖNâÿß¼úÿûïÿÒ\"ş;d3ü7	àùZ\rd8Óõ[g\\]¿zÈpäèq{7PÚfX²t1Ğ	ş?Uehµ5©[°¥¾ëÈ²ŒÿÙşşûÃÀÅÉÉ \'¡É_œÊgøÿ[P´×Õ­®?åfm=ÁˆªÓ4ÿŞ²wáÿ˜$Ÿÿ<¼\\kÃœµ·NˆøO(r9YXX|AÎ¥JÒ\0@\\Õ†4…áçînw\ZÎïr:Ê$±†b¦bDı±™’E\Zè2²(	##„1°ÉÜÊÊ¢2ŠˆŠtÆ*rš”hSše›»w¶©Í}v®6	û“?¢‡‡sÎû¾Ïó>ÏYö…åy—ã%½€ØBÖ|úü>xzúÅ‹‡ïœkFVµ†×\'úÎÎû\Zñ¶-*ı(.*éŒØër¹¦çù^]ôŒ@€½äÑ´d%\"|œœ64Ì!)+,·İ:Ä*¢‰£*™‹\'Ïº WDÀjv 7{3ÆL#ø4<ŠWú^Ô×5\\ù#\0^óÛæ¤0|°#H\n˜Sôp¬1ABÓ„\Z\"b}”T÷]†±G;‘–š‹¬\rJx< ­í&*Ê+Ğr¹‰Wß´p)fŒt˜Ä=à8X…ò<5Ôê‹à,nÈ’\'°¶ğ9„¾9‡ÄAY=†`ÆIŒÎ€Pa4b¨Q8g§p¾ù8–…îÅ`#5eŸ„•5koßë(µrãHJHA¬|5”ép8ì`m“¯Šƒéó8´×4J‚ÀZ­HIUbÖmÃF•	a25vacà2ÆCßó±šäú”L#½.{M—c†SEE‡ckŠ°+Â­»7æ6!>Ä³Áˆ%ÉdÈËÏ;m‚‘àì§¼(ÙQ‚Úªx¬7Ài“B§=üÅd=ğëqB |TYåvMå¾²]~/ÁŸt,MawLA@\Z‰°9.µªa¶IùÀ‘ƒuĞ\\oE_ßğ,ßì–‡\'×G-í¶¢†^* åÀÊğNzFrı‰SµUa²HBÒÄ${Ÿ×\r@€«­íğz½ Ü|ºß¶äÄlª-rc|è=^jÛ±û¬ú[ğ¢fÄtáñÓUºwüûkJıŒXÔDösx¯ø-Áÿ7ş¹Uü€kiêÃÏ¡…ê¡Pd–aå&Ê%uNÁ¡,Ìeà˜‚ÁéÔM`–mN¶L“é–l&[\"q8Ô\r/qš-›(,‚:ÀQ.sŞhE¹™\\zA)-¶öŞ½§ÓtKü1íÇ—ö4_¿ç;ï÷>—s:€×Ó.¿_ÛM=Ï<\"vÜµC\'‹’èKîƒ¹U’ù»®rwÌ	!åš8ƒÁ°M,WŒ.ì¦9¡ã¥`ú4ªvıêæ‰Äıƒ§q¤{JJ-»q÷ŞÒ­‘‘R´·w\"%)Õ4/#ó\rªt‘N=1\0ïÂ{n˜Å÷‡ª!œOªİààÍ²ò¯br³#$$ş¬?>46]@«R‚ÅK*ÂBÃVPb0?@ñîLX|LF`0K:#öÊ9™‰HÈ|§ö@Éä¡åÊYÈSäHš6·ûºaºFƒ³›K¹TŒ[·º°ó»o± {1sÎü‰cÔ”õg3üe‹(Û1DÌl¾¨†ÈGƒó¢z0Éğs6à¥àmpŞ›@îÍ\")QÎëñ;NŒŸî£THÑQ«Ùä/—§ŒàóyÆß÷è›6h\r˜(Ä9y|¼ørN ¸]ø:0N5Íó nMÄÛ…kèL€~õm\"Kîv³gÏÄ±êJê†¢Æ´©Íj×#1i‹”ì·Ğ<’ïó#Ğk*‰é•RÀóA€PŠ©³ìxı£^\\_“éqª¾×•mHN†šãUĞëI·²1\0¤ ÃV/)Õz.(:‘>\'áA	Pî‡]$jCéÇòà\'¤;8àEÌß¿ÅëŠ3gë ×ëÑÙŞ£6›¬İP\'d)Dù¥G\ZaµZ!“Å`Bh(f§¥AL‡n3ÛÑQ9ÖÎ…¹÷E}¹vuP?:áK¿ºd.]¾L¾}m\nÕÍ®Á•´l+×E3•ÊÖ†Šc¼¥““ˆ¸˜I‚Ñ×Oi—áA\ZÃ‡Ñu£Ã´»ø©É°ÛÜ<«FN›w”¡«Àz’ ¸Ôİ<¨5n¦Å/Ò0ğÕº¦(i4B‚&‘Ñ˜‘öüàÈÒ©º¾ñ‹JA‡üZn.||©Œ<¨ÕıøâË­ÈKÎÇ‡EåP{;`¼üq¥û-ş9-Ì¹ÑÇ7æøéƒn†ÚÀÏEtDö,\'C1aå²UäWN8NH$ãÉéx”B÷£§G­Æ‚-›¶`ógÅäÕ½p<Ó†Û¿ùµ©»Lï<Ø¹ÉcwiO7v[­6X,6G7%”áÑÚv\rK/Gì”XìÿaºU*‡o¶ïÄÂü,ÏÙ¹ìtŒ–¾«EYÑJY8Û›ººvÓCâz\0ªêöºX	íÔå±Ç{¦´›¢pbœÍ--¨©=J¡7&Ş/Æªµ$+Çœ­½Vbé+û`´f1’åÌèVQP¨xÅ§[×—$OOX,vxó¹¬m§@f¡@eCœ,	:­½½·ğSÅ!Ü7›=V^8£SàÑz4kM©rÀC_ğåy3ië7®*ÏÉ~%ÂtÏìÑ(®ö˜V£AÃ¹F\nTC”—FpêÄ¥w]ŠâR&f	1T‡¿lCüÒúÇ<šù‡k!\rÙ¢eYe…Eo¦9ìNp¦wçÎ]Ô¬‡f@ç¨;ÑRHsÕ-£cæ«<qà&\nh„§ÎŠß_U»Ï}¤f;#s†~[Hc2÷Âà?s=./…„IŠè3òğÓ	ÿÏTñ§\0íYkL[ç~|9¾_!°M!8ĞBiHsY.di3²&ÕÖti–iÕÔjÚ´òc?V­“¶i“ª6ê¦%İVEm´MI«TZ³\r.ƒd!@ ŒÃÅ˜»\r¶±±ïìı&B]Ã¦µ™4©ŸôÉs|Î{Ÿçı¹z‰ñ¾‹G±¶ş­EH®³d‚ÍªXg&Ì×¢ b´š¡ÍÑ‚ª%G…^‹àØ(‚3Ã­„ëV¼‚Ù;8NvtÌ=úvk{“%¡|“KJ­ëeê©L¦’ƒŒ¬·¤S*´Ğir!ıo5g\0Êj+Fæ±ã(Õ@ŠºD&ÿœa¯½ı¡ƒu_Z¹—„6G¢K¯·]oyÁéêõoY7¢Ò¾_(ÉjÚîw¿z§»ëÕéé)˜lß¶½Ÿâ%¥Ry‰øñSê“Â] áëy ĞğµèZX‰X%,œÉ±˜ˆòŒ—ê—h¨ÁJ¨wàééÁşW.¯ßÑÿÓÖöFıBÀ‹Â‚B¢ÈväMÔo¤„X\n0âvaq1 Ìy=6]¶m,Fo_/Ü7Lò°³öÉŞM¶²K2™ì²Lª¸¯×™ÖW yãûË–=OáA\'\\»¨+^yó×¨²é0ç™…khŞdª}ZäÌ‡(T‹¡1ËEørı1””<†û£ƒ0\Zs Uk‘L¥0æÂø„›Â+)\'A\"–†AoDñ{FËot4!\n ¸ÈF¸Â‹Ö¶V\"»)œ:y\Z‹¡ù¥¶¿·—­«@êæ™€J­4p„ğÁ„³-]$—eÒóaĞjÈ\"¨÷åÁ•ß„”<N,¡MP€6G¡²L€\'Q!î+ÄÒx9ø¹H3&”Ú6¢ººŠÂÅD?) 0ÆÂÓéî\rt‘²(·U’aÆÑÙÕEPD†?Eˆ`×šşBø\'j¼úİëæ@8fdì \Znpl(ÚÔÑ÷L	µÙEí.xÕ˜ßĞ‡Œ(Ñ&±ˆ%«”>ÅtMhAÄAªÊ@Q4\r£Õ…´zy1äé\"ŒLÜ@C‹–ümØµó0ÁE!<Q]¹î±\\¼ø>…•/ş&Æ=#øÍïÎ’²dò~$‘¤3i»ô?MTe},Î!c\næé„c|Ò[ó¨}â‡àóL\"‘òÃR†¶Ì	‰a˜B#@$‰Ô Ÿ`Ów4PHP(x+Å¨¬¡kÎEŠÓ=9Xğ¥Ñ|m““2œ>ùuÊ\'Îÿö¬PÉâ‰¢‘øéI¯Ÿçcò‡†D,•H2Ñ£<ÿãÇ€¥wàa­Š	Á×í;LÂ&PJ`œ=Øét¢½½„#8&ës$ˆŸ²Œ‚ò$l»|°n‡L†tYA\nˆ‘Bb}jˆÎÑ«ÕFnâ—ï]ÅBÏlĞDòÅ¨<G	HFX.x&ÆÎ/g–pŸ| €„Å.Çí‰òÑ3N—ãÙ{ı}\"Ï´‹ØZe¥vì~òÂxÊb¶\n÷\Z¹B=fø˜“É„ªÑÒÒŒáû.x§½ *Añ]HV‹“µ¦ˆ‹êPQµ<&a.cóÖ4ô9ªYji-4œ¯o\\ücãTËb*È}ÕŒ-Ò{Ãë\n¾CB2ÁiÏ0r òLİM­Öü µ­‰ëê¹MÕ!N¬Úƒ-ö\nœqœ¶’MÄ£6°z.Ôâà¢®áPm§g¤)á%ó®²×À`Èæš~¿Ÿ`ø|>ÂKaáwZ­VHÖÛğ^\\Â‘ú/BgÄG¯]¢dC˜×%ÂR,ÏctÈ×âŸı^Ä¡&Væd>iãú‚åœR\'Â³ÇÂ\\P‚LJŒ>Ç]tuß‚×7GÁ\0vÔÔÂ¾¹:2RJJİheì!aÙuš<å#‚°ì¾X\"‚~W§œ…&š›[éy^RDƒ—¿õ’Ğ~ş‹áöùv«RäEœ„%5˜LŒ°‘]Vp/m^°X–’	ÕòÜ»?ù3u¼zcìÅR\"ïÂB»–«P˜_DuÛHõÚƒ7Û¨¼\rQePb+±W¦”¹Ğ,”?*ÌºŒ£°nÛÙsS3nbc”|Ñ–BIlÙRM‚¿Œ{÷zñÆÙŸÁğS2+Hhú]á4’H`¸#ÙíóğH¶Úî¬Åã«ÿ—Nüæ¹×ZwÔÖà£<	ÂÊßÊ‰\Z›ñF)ÛÙßr™l%Ş)XL\nŸgE0B\'y¨§÷\"KK°•–¡ 0—<°5§àb‘Å$å‹\nÏ?w’uQ¼sá>ºzå¦ã2)æg—ø~5ßZQ˜ó0le>ü–èã…f•E—”™¿vèé=§ö×í©)²XZ™I‰‹2V.—ËÊbQMö eú;”4èsa)(f,îPİíëÁ¦ãÛ/}³sS¸ğîÛ˜œòöc†YmZòXxöp¥Ú•£•y÷n+8¡3\Z\0\r¦íÏ<ÀV“TÂÂİŞĞ\'‘EÙ-Îr/FärÕZù®Ú=Õ\'Ù÷Ô¶š*½^kD2‘F‚ê0{9\'ãHIğKZàÍì»[¤†`‡A—‡Æ†R¨—~—Â‹mÒ\Z<Ÿ€£o¬ûÖ[uÛÿL‰ÉÌÔ°¢äu¿òşC=ğ0 É*¥fÇr¥å–£‡ìıÊş»+Š¬V\n)	Ã‡uO1eêjh0ş·†fƒ\'(3™¢¾\0ºo;ƒ¥Y\\~pâ=N¥Y¦|ü îÓQQV!IöT!_«Wî­İ[ıÜ‘úu[ª*5j¥F°6;ğš™Cã_¯±¾‚ñ±işF[÷e>\ZoÊV–”³l4Å†‚Ùäüß2é5^’f·†¶½¼¢ø™úc‡m©²?şûWfÛZoÿ*J·g_È¼âÙjò™pÙÏò8dÕKâ5VÍ|ZNê?Wà¯À%á´}òí\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0¸IDATxÚbüÿÿ?6ÀòöÃ†_¿~2°İ™òŸA»ĞêÃÇwÇ?ö…	$+ú{óÿ‡9ö|R=Æ <AR\\†‡qÃÎy{¹9DœxtÔ¬>¼ùÂ ##ŸÒÀzğä¦ÿ[ö.ú•èùÿİ™üÿ}‰¢(3± Œ@Œ8]õìÕ}0ce…ùÿ7Êañ‘i¼¼¼Œ, Áó«ÿ4}aĞc:ÏÀú™!3;ñ?ÃÊuş¿xıàÿ«·ÿ·v×ı·I`\0™ÍÌá²çè™íÿ>¹ùßÍ×äÿ×;}–\Z\"s\0ˆñÍûç?}º•	hÆ?†;³\Z@‚îÓşıÿËÀÊÊ\Züû÷ïµp×Â¯¦ügTtfx÷ë7ÃAû}*ïÛëÅ~¤00±üfàã`¸vı»0D##CÅÚOÖ_üæ0¼6áŞ»ß¡uM’<âŸŞe˜9ó9Ã–õ‡Ê™%¸wüù÷m±²’2ƒ¸ˆÃÖ›BCÃöÙÌÀûÛƒ¡¡b3ß÷[S6M]{»%0E%\n÷_ó÷‘ÿãS}A¾÷}·7îÿìJÏÿ£\0 ’5€ã¤ŒÀ4ğæİk¦Sµ\râŞ~üşÌğõÛ·½<ÜÜÎ0C9Ø¹˜uó©úÿÿËÓúƒşoÜ¼şÿ¥+g~üüşú¬©ÿÙØØüPãAàíÿëŒÿvßÿÇÀ“uœAì|6ƒ“#Ã`ø;:Ø2—•ndaúõnÃ‡óËŞ)—1ğ{1°\0“q1Ã½¿Yò*ÏæÍ_Îğëç†Û·osmøıç×½•ÔUÙ˜îØ0ÜÛ#Åğã-ƒfÑcNÖ{¯9·0|¹ªÀpüàu#†O¯ÿÏ-Kúÿúı“ÿËÖNâÿß¼úÿûïÿÒ\"ş;d3ü7	àùZ\rd8Óõ[g\\]¿zÈpäèq{7PÚfX²t1Ğ	ş?Uehµ5©[°¥¾ëÈ²ŒÿÙşşûÃÀÅÉÉ \'¡É_œÊgøÿ[P´×Õ­®?åfm=ÁˆªÓ4ÿŞ²wáÿ˜$Ÿÿ<¼\\kÃœµ·NˆøO(r9YXX|AÎ¥JÒ\0@\\Õ†4…áçînw\ZÎïr:Ê$±†b¦bDı±™’E\Zè2²(	##„1°ÉÜÊÊ¢2ŠˆŠtÆ*rš”hSše›»w¶©Í}v®6	û“?¢‡‡sÎû¾Ïó>ÏYö…åy—ã%½€ØBÖ|úü>xzúÅ‹‡ïœkFVµ†×\'úÎÎû\Zñ¶-*ı(.*éŒØër¹¦çù^]ôŒ@€½äÑ´d%\"|œœ64Ì!)+,·İ:Ä*¢‰£*™‹\'Ïº WDÀjv 7{3ÆL#ø4<ŠWú^Ô×5\\ù#\0^óÛæ¤0|°#H\n˜Sôp¬1ABÓ„\Z\"b}”T÷]†±G;‘–š‹¬\rJx< ­í&*Ê+Ğr¹‰Wß´p)fŒt˜Ä=à8X…ò<5Ôê‹à,nÈ’\'°¶ğ9„¾9‡ÄAY=†`ÆIŒÎ€Pa4b¨Q8g§p¾ù8–…îÅ`#5eŸ„•5koßë(µrãHJHA¬|5”ép8ì`m“¯Šƒéó8´×4J‚ÀZ­HIUbÖmÃF•	a25vacà2ÆCßó±šäú”L#½.{M—c†SEE‡ckŠ°+Â­»7æ6!>Ä³Áˆ%ÉdÈËÏ;m‚‘àì§¼(ÙQ‚Úªx¬7Ài“B§=üÅd=ğëqB |TYåvMå¾²]~/ÁŸt,MawLA@\Z‰°9.µªa¶IùÀ‘ƒuĞ\\oE_ßğ,ßì–‡\'×G-í¶¢†^* åÀÊğNzFrı‰SµUa²HBÒÄ${Ÿ×\r@€«­íğz½ Ü|ºß¶äÄlª-rc|è=^jÛ±û¬ú[ğ¢fÄtáñÓUºwüûkJıŒXÔDösx¯ø-Áÿ7ş¹Uü€kiêÃÏ¡…ê¡Pd–aå&Ê%uNÁ¡,Ìeà˜‚ÁéÔM`–mN¶L“é–l&[\"q8Ô\r/qš-›(,‚:ÀQ.sŞhE¹™\\zA)-¶öŞ½§ÓtKü1íÇ—ö4_¿ç;ï÷>—s:€×Ó.¿_ÛM=Ï<\"vÜµC\'‹’èKîƒ¹U’ù»®rwÌ	!åš8ƒÁ°M,WŒ.ì¦9¡ã¥`ú4ªvıêæ‰Äıƒ§q¤{JJ-»q÷ŞÒ­‘‘R´·w\"%)Õ4/#ó\rªt‘N=1\0ïÂ{n˜Å÷‡ª!œOªİààÍ²ò¯br³#$$ş¬?>46]@«R‚ÅK*ÂBÃVPb0?@ñîLX|LF`0K:#öÊ9™‰HÈ|§ö@Éä¡åÊYÈSäHš6·ûºaºFƒ³›K¹TŒ[·º°ó»o± {1sÎü‰cÔ”õg3üe‹(Û1DÌl¾¨†ÈGƒó¢z0Éğs6à¥àmpŞ›@îÍ\")QÎëñ;NŒŸî£THÑQ«Ùä/—§ŒàóyÆß÷è›6h\r˜(Ä9y|¼ørN ¸]ø:0N5Íó nMÄÛ…kèL€~õm\"Kîv³gÏÄ±êJê†¢Æ´©Íj×#1i‹”ì·Ğ<’ïó#Ğk*‰é•RÀóA€PŠ©³ìxı£^\\_“éqª¾×•mHN†šãUĞëI·²1\0¤ ÃV/)Õz.(:‘>\'áA	Pî‡]$jCéÇòà\'¤;8àEÌß¿ÅëŠ3gë ×ëÑÙŞ£6›¬İP\'d)Dù¥G\ZaµZ!“Å`Bh(f§¥AL‡n3ÛÑQ9ÖÎ…¹÷E}¹vuP?:áK¿ºd.]¾L¾}m\nÕÍ®Á•´l+×E3•ÊÖ†Šc¼¥““ˆ¸˜I‚Ñ×Oi—áA\ZÃ‡Ñu£Ã´»ø©É°ÛÜ<«FN›w”¡«Àz’ ¸Ôİ<¨5n¦Å/Ò0ğÕº¦(i4B‚&‘Ñ˜‘öüàÈÒ©º¾ñ‹JA‡üZn.||©Œ<¨ÕıøâË­ÈKÎÇ‡EåP{;`¼üq¥û-ş9-Ì¹ÑÇ7æøéƒn†ÚÀÏEtDö,\'C1aå²UäWN8NH$ãÉéx”B÷£§G­Æ‚-›¶`ógÅäÕ½p<Ó†Û¿ùµ©»Lï<Ø¹ÉcwiO7v[­6X,6G7%”áÑÚv\rK/Gì”XìÿaºU*‡o¶ïÄÂü,ÏÙ¹ìtŒ–¾«EYÑJY8Û›ººvÓCâz\0ªêöºX	íÔå±Ç{¦´›¢pbœÍ--¨©=J¡7&Ş/Æªµ$+Çœ­½Vbé+û`´f1’åÌèVQP¨xÅ§[×—$OOX,vxó¹¬m§@f¡@eCœ,	:­½½·ğSÅ!Ü7›=V^8£SàÑz4kM©rÀC_ğåy3ië7®*ÏÉ~%ÂtÏìÑ(®ö˜V£AÃ¹F\nTC”—FpêÄ¥w]ŠâR&f	1T‡¿lCüÒúÇ<šù‡k!\rÙ¢eYe…Eo¦9ìNp¦wçÎ]Ô¬‡f@ç¨;ÑRHsÕ-£cæ«<qà&\nh„§ÎŠß_U»Ï}¤f;#s†~[Hc2÷Âà?s=./…„IŠè3òğÓ	ÿÏTñ§\0íYkL[ç~|9¾_!°M!8ĞBiHsY.di3²&ÕÖti–iÕÔjÚ´òc?V­“¶i“ª6ê¦%İVEm´MI«TZ³\r.ƒd!@ ŒÃÅ˜»\r¶±±ïìı&B]Ã¦µ™4©ŸôÉs|Î{Ÿçı¹z‰ñ¾‹G±¶ş­EH®³d‚ÍªXg&Ì×¢ b´š¡ÍÑ‚ª%G…^‹àØ(‚3Ã­„ëV¼‚Ù;8NvtÌ=úvk{“%¡|“KJ­ëeê©L¦’ƒŒ¬·¤S*´Ğir!ıo5g\0Êj+Fæ±ã(Õ@ŠºD&ÿœa¯½ı¡ƒu_Z¹—„6G¢K¯·]oyÁéêõoY7¢Ò¾_(ÉjÚîw¿z§»ëÕéé)˜lß¶½Ÿâ%¥Ry‰øñSê“Â] áëy ĞğµèZX‰X%,œÉ±˜ˆòŒ—ê—h¨ÁJ¨wàééÁşW.¯ßÑÿÓÖöFıBÀ‹Â‚B¢ÈväMÔo¤„X\n0âvaq1 Ìy=6]¶m,Fo_/Ü7Lò°³öÉŞM¶²K2™ì²Lª¸¯×™ÖW yãûË–=OáA\'\\»¨+^yó×¨²é0ç™…khŞdª}ZäÌ‡(T‹¡1ËEørı1””<†û£ƒ0\Zs Uk‘L¥0æÂø„›Â+)\'A\"–†AoDñ{FËot4!\n ¸ÈF¸Â‹Ö¶V\"»)œ:y\Z‹¡ù¥¶¿·—­«@êæ™€J­4p„ğÁ„³-]$—eÒóaĞjÈ\"¨÷åÁ•ß„”<N,¡MP€6G¡²L€\'Q!î+ÄÒx9ø¹H3&”Ú6¢ººŠÂÅD?) 0ÆÂÓéî\rt‘²(·U’aÆÑÙÕEPD†?Eˆ`×šşBø\'j¼úİëæ@8fdì \Znpl(ÚÔÑ÷L	µÙEí.xÕ˜ßĞ‡Œ(Ñ&±ˆ%«”>ÅtMhAÄAªÊ@Q4\r£Õ…´zy1äé\"ŒLÜ@C‹–ümØµó0ÁE!<Q]¹î±\\¼ø>…•/ş&Æ=#øÍïÎ’²dò~$‘¤3i»ô?MTe},Î!c\næé„c|Ò[ó¨}â‡àóL\"‘òÃR†¶Ì	‰a˜B#@$‰Ô Ÿ`Ów4PHP(x+Å¨¬¡kÎEŠÓ=9Xğ¥Ñ|m““2œ>ùuÊ\'Îÿö¬PÉâ‰¢‘øéI¯Ÿçcò‡†D,•H2Ñ£<ÿãÇ€¥wàa­Š	Á×í;LÂ&PJ`œ=Øét¢½½„#8&ës$ˆŸ²Œ‚ò$l»|°n‡L†tYA\nˆ‘Bb}jˆÎÑ«ÕFnâ—ï]ÅBÏlĞDòÅ¨<G	HFX.x&ÆÎ/g–pŸ| €„Å.Çí‰òÑ3N—ãÙ{ı}\"Ï´‹ØZe¥vì~òÂxÊb¶\n÷\Z¹B=fø˜“É„ªÑÒÒŒáû.x§½ *Añ]HV‹“µ¦ˆ‹êPQµ<&a.cóÖ4ô9ªYji-4œ¯o\\ücãTËb*È}ÕŒ-Ò{Ãë\n¾CB2ÁiÏ0r òLİM­Öü µ­‰ëê¹MÕ!N¬Úƒ-ö\nœqœ¶’MÄ£6°z.Ôâà¢®áPm§g¤)á%ó®²×À`Èæš~¿Ÿ`ø|>ÂKaáwZ­VHÖÛğ^\\Â‘ú/BgÄG¯]¢dC˜×%ÂR,ÏctÈ×âŸı^Ä¡&Væd>iãú‚åœR\'Â³ÇÂ\\P‚LJŒ>Ç]tuß‚×7GÁ\0vÔÔÂ¾¹:2RJJİheì!aÙuš<å#‚°ì¾X\"‚~W§œ…&š›[éy^RDƒ—¿õ’Ğ~ş‹áöùv«RäEœ„%5˜LŒ°‘]Vp/m^°X–’	ÕòÜ»?ù3u¼zcìÅR\"ïÂB»–«P˜_DuÛHõÚƒ7Û¨¼\rQePb+±W¦”¹Ğ,”?*ÌºŒ£°nÛÙsS3nbc”|Ñ–BIlÙRM‚¿Œ{÷zñÆÙŸÁğS2+Hhú]á4’H`¸#ÙíóğH¶Úî¬Åã«ÿ—Nüæ¹×ZwÔÖà£<	ÂÊßÊ‰\Z›ñF)ÛÙßr™l%Ş)XL\nŸgE0B\'y¨§÷\"KK°•–¡ 0—<°5§àb‘Å$å‹\nÏ?w’uQ¼sá>ºzå¦ã2)æg—ø~5ßZQ˜ó0le>ü–èã…f•E—”™¿vèé=§ö×í©)²XZ™I‰‹2V.—ËÊbQMö eú;”4èsa)(f,îPİíëÁ¦ãÛ/}³sS¸ğîÛ˜œòöc†YmZòXxöp¥Ú•£•y÷n+8¡3\Z\0\r¦íÏ<ÀV“TÂÂİŞĞ\'‘EÙ-Îr/FärÕZù®Ú=Õ\'Ù÷Ô¶š*½^kD2‘F‚ê0{9\'ãHIğKZàÍì»[¤†`‡A—‡Æ†R¨—~—Â‹mÒ\Z<Ÿ€£o¬ûÖ[uÛÿL‰ÉÌÔ°¢äu¿òşC=ğ0 É*¥fÇr¥å–£‡ìıÊş»+Š¬V\n)	Ã‡uO1eêjh0ş·†fƒ\'(3™¢¾\0ºo;ƒ¥Y\\~pâ=N¥Y¦|ü îÓQQV!IöT!_«Wî­İ[ıÜ‘úu[ª*5j¥F°6;ğš™Cã_¯±¾‚ñ±işF[÷e>\ZoÊV–”³l4Å†‚Ùäüß2é5^’f·†¶½¼¢ø™úc‡m©²?şûWfÛZoÿ*J·g_È¼âÙjò™pÙÏò8dÕKâ5VÍ|ZNê?Wà¯À%á´}òí\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(34,'sys','quickAccess_messages.png','image/png',5270,'2013-12-14 18:15:36',5270,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\" xmpMM:DocumentID=\"xmp.did:F20F5CD465B911E08F52CDC811356623\" xmpMM:InstanceID=\"xmp.iid:F20F5CD365B911E08F52CDC811356623\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:74BDB0A2B665E0118CE4B767506F182C\" stRef:documentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>^*|*\0\0ÈIDATxÚbøÿÿ?çÎ<+Ä`6#ˆ˜·då4\0–xÿâæA~	&FFF†çY®¿bØpK”áÿ—_E˜@²ËW®d`ä`cĞ–aføÈeÂğæË_ˆD³Ät†_10şùüÃğûï?€\0Ûy³ÎéIiFËAÄÜÅ+P\\•ÁÈÒ¹êòÿ$_½ã¼üŸè(†Õ×Ô…™vmšÏ fêÍÀÊÂÌÀR¡$ÊÊÀÂÁÄÀÃò›á÷ «\\¦1ğ³şdøüò!ƒKPƒŒ/X@\01À\\…¦n¿óÿÒã/ÿ\'o¹ı/êZ” …Ê»×Oÿ\n\n0àŒ,ÜŒ`ïu­¾ü_KAˆáñ±…*ÚNl|w¯ïcHsFØz˜™á×¯ß-s›t*Ş\n\Z3ü“ÖdPpÉf8yí=Ã²ó¯•Âìş]×úãÃÙ\r“,”™ÿ3°<?Í £nÌ`¯\'ÅğëÏ†›O>ƒb”a¦ĞÌÿÓdş00H\0õ	Â\0%Ÿ–‚0Œ?ºêºB»0mInVAâÅºÔ¥NAtºõ	ú\Zõ\":wêÚ)Ò.¢(#)!è&š°«»ãî4»±*ÒsxgŞ?ÏüÃ.í÷]q=ïúÙãÆÛ·òÅ#¾•ÕØîÆ,µôæú`Î“oë0ÃÁÁùaùpK¬«³Q\"‰9Òi33i€¶0JG§çuw/ohÓ²Ùıs	å‡;H$ƒ©qÙùAğÆim1	HÄëÀmF1ŸGl)‡tfÕè2.ŞT´&n*€ ¤ ÄÂ=ëĞ¡’k9Då0n?L(AD‚qPEE õ\rÓ­Ö·Õì:0ªe~ÉFz:ˆ„ÈÛCaQ“Q(ÕÑ¦:º	U¢­\ZÆÂ<áP\\C7y!ËÁJŠ øTû%ö÷^¶;_/ññ^6“üó/Rq‰€½î°ëÕPã?¹;ÿ@iµÄ4EÑÓ×V[ÚBèL¡©X‹ZD¥|ÚÔ.\\è1qe‚‰1QjâÂˆ&6FâJ]7&Æ?v®HÔ`@1>Š­D¤J[ÅÒRÚß´tZ\"4x“—ÌÌ›Üóî½çÜû$.­ĞbM;–xü=µÜĞ\\8¶c!›œğ~wjõì|ªwœt¬/º|\0Ô1qÖP§Gšª\rĞ¨Ò^’0ü5ˆ7&Ï¨uÌİ›\'ê—7à÷M………Ò{éAùç[î³ä”(Åô„%^ˆÖùtl¯ŒŞMdje2o¯A–&kÚåûo~ø®{‚Šzç“‘ŞrFƒÉ™0\Z5é#‹Q\"şNİµU`\rL^l‘¤v[U¤-ëÃHˆ0‡İfªV3Î^ôÀ²Í:×~Ô4WBIÄT\0³aã>|íF{k½”\Z1˜oA9^zµ8è4¡Í¥ÀgŸ±*E)tÊö«Kpì;\nS¥}ŞŠÕtO 0èå±06CWOâ%»¨Zd°”Ã¶E6cÚO4Íáj\0*¹ß¿Bà8œøâ±Y%‡JK@1¨3Ğú\0zUi).kJıãsxOe3!Sï…’43£œ¿r¯ß‚wÚ+G`/\'(£`FºXZ-HøG\'*DâIªq;­%¨ÛªÇÄÌú>°¸D»hz¢f#-Ç»ÖîB;Ü\rL\r>Çë‡c0™L`FÈéQBYpæíht·@¸‹KüªW°ÚÔ\ZöÎC¡X¡ôm@å<^3ÕĞaeñbı¢xwºt¼¥ÄÄó|*\r‚€\r›8ŸäôDçÙ\\ª?b=Mò ‡‚á?,÷´Şú+\0ëÕÖÛF„¿İµ×½¾åî8IÓ&vb«\r¡J‚DRQP‚R‰ğR!„Dÿ@#Ä/õ„Äå•›<´D…PÑrU«*”‡(‰Úª®’âB“bÅ“øÇ·õ2g›8ns9Òø2»gÎ93s¾ù†SvÙÚXiõg.ei¹ ØZ÷ÊNSŒÁÖzW­]-–LG“9_\rŒrÌ;Ì+ÌÕTâÒıõ—«ÉÃğtZZÃ¹™YÿÙ@0tŒ¥ıf4­ñì±†\Z¬zºL¦<¹Ø¡h\n7|Ë‰Û¾…î÷_\Zôm£’v«ş•b	|Ş¾Rî¢£OQkv„åÁva|tz¢[ù1Ğ‹|ñ’lÑ¹ma;­h±Y[´ôáE_<?7ıŸd1Sc¯ŸÙœ×l¬ÆÒFÃ9ÉØë¿ö‹„Ñå9O?ëX.¨‡ Á2à©ÃÍßÜÈ¤SÄ°²êË³wş€wî^gZ\ZĞíq’û„°:<¨âMêuÕ+„9{Œh­ëÀÙéyjôcâÂ$šÛû`µvSÕA0p¸4uµ†,z{ºÊ3(¿:¯‡ŞT¡ıõ%W2¥{¡Æ¬Ã!§_~v’kı€™Ğ‰!)uğ\'ìTñËôMôõ8‹F2ôlâ–tË1è¶ª}QIé¿ÄtLŞzó5\\Ãhl+k\n¢ëÔ£Ñ÷lˆCÆhÂT \r+I#|‹	(¯Ñ¼O¯[p°£n*8Yª‚²\\\n^L)0hÅÖàhjÂ¾.4´íÊ«pRF8Í—Ğ`ä`µØWõ8.ÿx36\"r5êm‚A§QO²a¯ØÃåùo.ï¢[^/Ñ‚\ZÆ•\rU<îEyT›dèıµ4»d@\\Á§–àv:I›g±Ì-›¥49v‚4Z99\rêğÔ¨…¨&»ì´§B\'K Fî´tÑAƒ6ª^ƒˆoÇ[èù“•-pM\'˜²½ÓÈÒ}¬SWI3ã<êMlJ?ªú” \0.F§ç€ºS©Jƒá¾V\\ñc%Qİ”‘·. çœ#j¢1Øğİgà8H:lSLÄ\rIÑ=ùşëshnkµ\"ªèèÁP¯SŞ –\"©B6g‹¼‚Äçã°ÿÄÃvj“ÇIŸ¡®AQ…çÄ£aL_ÇcOR—¬”ˆ@Áì±ãÚ\\+±TY,ëŸœBç³¿£xWŞ})—ãï¼Ææ=0%d“q,-‡1üÌsLf•”•W‡©9ıæ§ßÿV}L{Ÿá«G^MŒèîøò…áÕŸ€iô¨Z0şûäºjë!ŠºŠğ(CÎã0öÑük\ZÑ¨ë?AÆçîb}rg¢Ç‘8Òõg9•¶(j\ZâîBEÆ9%•[½rD±FıHü0‡Ş¿òb\Z§ğÿŒ, †Óni2x\\RNê1vòZ¨„ı%@sÖ\ZÛT†ŸÓv½¶§]Û±µ»•me™\"lA&A¢Æ‰Æî§¿¼%F5ş1Q£&^/ñ‚‰Cğ‚ Ñ8Ä\0d\\\\Ë&c[7º¶ÛºŞÏ9¾ßéZF·l¢ù%§ızzrÎû|ß{y÷ÌáEiµE4\\éÚšÊ;éî/\rŒÄ¶Ÿ\Z{?—IõX•)”Â7Ğx‹äqõCnXYm½ÃP¦û‚\n$Ïòee¹	•Ns§ÏmëŒL¥gƒÏpœæ[£ 	Yå?Ò˜ÿ¼´úe5nÓMNó7‘É´ÑJ©Ïë2Ã!èÕ„iµˆoPF\Z\'ºvnd\nLi†P¹ÛlsGH+ÿfş\02Zïs™[hu÷…¢Ã¢Gm…vJòºy	ÕÜÇS9„\"IŒD’ÊXxbûX$ö:s±§·6Ø%Iòær¹¢!‘H$ĞÑÑ+¥`‹`<õ–W«m FÙ1ûÿm,ĞÈÙçç»¶ô\\‚–^WjÇg;w1®ke²ı¥ü‡1`·™IàE.¼„CSà¥jkNó†uÚ\ZÛ2©¬<¥•—ÌòPÖ‰­¿}¹Øo»Şz,±\0›WÔÇ*î D…U\"²ÏIKÀªFÇ†uûYeº¢nï‹ï=uëk¬ĞÌ@.ÕÆ6ÉBô/ÌO2õ \02Ÿ?–h5iˆN=²\nv/Ó©]t°ÚçgKN’õì×–µŞ|¯¯ß„İ\'#h«M¢ŞÍ“4æH$qôøiœ8u\0òp¹]°{1ÍĞPÚdŒsb‚Òäd.ÑLZ¥¾*Ï•©™vSpœ[Õ\rÅ`«×Š¡‹Sìo¢˜ĞÍÙƒâˆßzll\"\Z\Z; ¼½ï‡“øó`\Zê|°Ø½°×m &é‚Ï-Â.I“rêS“i	ÚX\ZÆd^gáD¾úËD7¶.*¼·™àĞ¶`”l­u›±y•\0¥hÖÚ*Íb—•bÑ)Ì-\rÎÚƒñş\0ê–·\".®†Ç¿\\m1ŠÍÒ>«WŒÓ³[—™x˜…2¤$+¢I‘Äånx„q¼·í\0Ö¯ñcE½;ß>™Uä¨, 1¢\'d¢ûi±Ê/¢}…Q­+ÜŒxd6i4°dOÀ\'„¿‚g±êæ»\0Ïõ(w	ÈeÄh5ˆ§º-\nley\0“‘¤Fİ~‹è>íJ}­ÓiFÓN¬ß,İïÂŞ€kõğ—Ëªñ‡ÇÜè\rUÖ·XiµuEÊ™“/Õ©Ü<‰ğ2\09©\0$?úpâXªë\ZÁ‰~,«Hcä]Ì&hé:\rF2úÂ¤¸HYYŒœ*ét<§‚(ˆUÅÄ•Á(¸°æú•…£àíëñù‰1\'¡¥Ö‚»ÚíÅ~;ËØò<íjæB²|ISÎ0ƒ–}±y$\Zƒ\"Kä.V¬¤Ì2Ù¼êJ‘™NÊˆ‘jLZˆ$²˜<dk åò;Â\\‹	.\nIÉŒL×ªHQ\\¬¬¶¡±Êª¶²NÆpàø|j=õóÇI^Ü)‹»4ãoU¾jÖüG&E:1ç&mKr?Ë¸ŒTaUZ»Œ¥p3-BÆ0´\\>NRÜÀe02<§«¢¨¹Ô~ÅJ¦’YœœÄG.Àç²¢~™fJç³c–ÙTJ}æİÖas›£·o¹_oûÚ}; h€£Ò§\Zåwh¡×å]Eı˜…›õÍ€PIA™<¾?ºq1:;ÖmR•èe¹^Ïãºzš(UöNãû#C¨&aï¯(t*`Á,TĞËL\"æÍMÍ8Ó¼\ZÎ÷aèğô]Ø°é6˜‚j [¥D¡‘%_N¦’ˆ‡‚ôC–R÷æ;ïƒVoPõú|ƒ¥Ùr-b»O“k…Ô]jòÚT %I¨Ô…Ô·	LíØóù.[ïÁİ×\".·ãhO\'a×ù^X.ˆ•uhjn¥\"f¢ÀågÀË”¥ÒRSö\"D.#‘¶¯Û—gÙL»jq^¥¥mfñPé4ağâ4~9~5UÎ9Ì·àSÖàŒÅLÎı_Bßı#üzAì¹‰İÈhc0Œ–¡¥û6>ÿ*²´ÄÁ>ÿ<…ı]Û(êsäçD­‰Ci5<ô&3Ü^Ô5^‡æöMÅ‡æ¤+—_,²7•Ã(•+Ü;yj°™øÎ¦Î–Wšk02Eß00ŠTg¼í9ˆ=N§_RN½ç`?{‹²†¦A\nè(÷¡UÿĞŠŞly²Ùnd†B@É¿b8º?ıî˜ôî[º¢ìõúÿg0B4ÌÚ|Î¤­qøyÁxî?ŒÄÀ~ÿ)5Ö{\\z!œÅäµéè5°@Q®ÊK	p~úxh­š{Í&ø\"ãò¯³Ø)Rê~ö\Z.áÕğ7›ìX@Ô€ôÃ\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\" xmpMM:DocumentID=\"xmp.did:F20F5CD465B911E08F52CDC811356623\" xmpMM:InstanceID=\"xmp.iid:F20F5CD365B911E08F52CDC811356623\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:74BDB0A2B665E0118CE4B767506F182C\" stRef:documentID=\"xmp.did:D35CBAD1E4D5DF11B1929CB5A4CCE04B\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>^*|*\0\0ÈIDATxÚbøÿÿ?çÎ<+Ä`6#ˆ˜·då4\0–xÿâæA~	&FFF†çY®¿bØpK”áÿ—_E˜@²ËW®d`ä`cĞ–aføÈeÂğæË_ˆD³Ät†_10şùüÃğûï?€\0Ûy³ÎéIiFËAÄÜÅ+P\\•ÁÈÒ¹êòÿ$_½ã¼üŸè(†Õ×Ô…™vmšÏ fêÍÀÊÂÌÀR¡$ÊÊÀÂÁÄÀÃò›á÷ «\\¦1ğ³şdøüò!ƒKPƒŒ/X@\01À\\…¦n¿óÿÒã/ÿ\'o¹ı/êZ” …Ê»×Oÿ\n\n0àŒ,ÜŒ`ïu­¾ü_KAˆáñ±…*ÚNl|w¯ïcHsFØz˜™á×¯ß-s›t*Ş\n\Z3ü“ÖdPpÉf8yí=Ã²ó¯•Âìş]×úãÃÙ\r“,”™ÿ3°<?Í £nÌ`¯\'ÅğëÏ†›O>ƒb”a¦ĞÌÿÓdş00H\0õ	Â\0%Ÿ–‚0Œ?ºêºB»0mInVAâÅºÔ¥NAtºõ	ú\Zõ\":wêÚ)Ò.¢(#)!è&š°«»ãî4»±*ÒsxgŞ?ÏüÃ.í÷]q=ïúÙãÆÛ·òÅ#¾•ÕØîÆ,µôæú`Î“oë0ÃÁÁùaùpK¬«³Q\"‰9Òi33i€¶0JG§çuw/ohÓ²Ùıs	å‡;H$ƒ©qÙùAğÆim1	HÄëÀmF1ŸGl)‡tfÕè2.ŞT´&n*€ ¤ ÄÂ=ëĞ¡’k9Då0n?L(AD‚qPEE õ\rÓ­Ö·Õì:0ªe~ÉFz:ˆ„ÈÛCaQ“Q(ÕÑ¦:º	U¢­\ZÆÂ<áP\\C7y!ËÁJŠ øTû%ö÷^¶;_/ññ^6“üó/Rq‰€½î°ëÕPã?¹;ÿ@iµÄ4EÑÓ×V[ÚBèL¡©X‹ZD¥|ÚÔ.\\è1qe‚‰1QjâÂˆ&6FâJ]7&Æ?v®HÔ`@1>Š­D¤J[ÅÒRÚß´tZ\"4x“—ÌÌ›Üóî½çÜû$.­ĞbM;–xü=µÜĞ\\8¶c!›œğ~wjõì|ªwœt¬/º|\0Ô1qÖP§Gšª\rĞ¨Ò^’0ü5ˆ7&Ï¨uÌİ›\'ê—7à÷M………Ò{éAùç[î³ä”(Åô„%^ˆÖùtl¯ŒŞMdje2o¯A–&kÚåûo~ø®{‚Šzç“‘ŞrFƒÉ™0\Z5é#‹Q\"şNİµU`\rL^l‘¤v[U¤-ëÃHˆ0‡İfªV3Î^ôÀ²Í:×~Ô4WBIÄT\0³aã>|íF{k½”\Z1˜oA9^zµ8è4¡Í¥ÀgŸ±*E)tÊö«Kpì;\nS¥}ŞŠÕtO 0èå±06CWOâ%»¨Zd°”Ã¶E6cÚO4Íáj\0*¹ß¿Bà8œøâ±Y%‡JK@1¨3Ğú\0zUi).kJıãsxOe3!Sï…’43£œ¿r¯ß‚wÚ+G`/\'(£`FºXZ-HøG\'*DâIªq;­%¨ÛªÇÄÌú>°¸D»hz¢f#-Ç»ÖîB;Ü\rL\r>Çë‡c0™L`FÈéQBYpæíht·@¸‹KüªW°ÚÔ\ZöÎC¡X¡ôm@å<^3ÕĞaeñbı¢xwºt¼¥ÄÄó|*\r‚€\r›8ŸäôDçÙ\\ª?b=Mò ‡‚á?,÷´Şú+\0ëÕÖÛF„¿İµ×½¾åî8IÓ&vb«\r¡J‚DRQP‚R‰ğR!„Dÿ@#Ä/õ„Äå•›<´D…PÑrU«*”‡(‰Úª®’âB“bÅ“øÇ·õ2g›8ns9Òø2»gÎ93s¾ù†SvÙÚXiõg.ei¹ ØZ÷ÊNSŒÁÖzW­]-–LG“9_\rŒrÌ;Ì+ÌÕTâÒıõ—«ÉÃğtZZÃ¹™YÿÙ@0tŒ¥ıf4­ñì±†\Z¬zºL¦<¹Ø¡h\n7|Ë‰Û¾…î÷_\Zôm£’v«ş•b	|Ş¾Rî¢£OQkv„åÁva|tz¢[ù1Ğ‹|ñ’lÑ¹ma;­h±Y[´ôáE_<?7ıŸd1Sc¯ŸÙœ×l¬ÆÒFÃ9ÉØë¿ö‹„Ñå9O?ëX.¨‡ Á2à©ÃÍßÜÈ¤SÄ°²êË³wş€wî^gZ\ZĞíq’û„°:<¨âMêuÕ+„9{Œh­ëÀÙéyjôcâÂ$šÛû`µvSÕA0p¸4uµ†,z{ºÊ3(¿:¯‡ŞT¡ıõ%W2¥{¡Æ¬Ã!§_~v’kı€™Ğ‰!)uğ\'ìTñËôMôõ8‹F2ôlâ–tË1è¶ª}QIé¿ÄtLŞzó5\\Ãhl+k\n¢ëÔ£Ñ÷lˆCÆhÂT \r+I#|‹	(¯Ñ¼O¯[p°£n*8Yª‚²\\\n^L)0hÅÖàhjÂ¾.4´íÊ«pRF8Í—Ğ`ä`µØWõ8.ÿx36\"r5êm‚A§QO²a¯ØÃåùo.ï¢[^/Ñ‚\ZÆ•\rU<îEyT›dèıµ4»d@\\Á§–àv:I›g±Ì-›¥49v‚4Z99\rêğÔ¨…¨&»ì´§B\'K Fî´tÑAƒ6ª^ƒˆoÇ[èù“•-pM\'˜²½ÓÈÒ}¬SWI3ã<êMlJ?ªú” \0.F§ç€ºS©Jƒá¾V\\ñc%Qİ”‘·. çœ#j¢1Øğİgà8H:lSLÄ\rIÑ=ùşëshnkµ\"ªèèÁP¯SŞ –\"©B6g‹¼‚Äçã°ÿÄÃvj“ÇIŸ¡®AQ…çÄ£aL_ÇcOR—¬”ˆ@Áì±ãÚ\\+±TY,ëŸœBç³¿£xWŞ})—ãï¼Ææ=0%d“q,-‡1üÌsLf•”•W‡©9ıæ§ßÿV}L{Ÿá«G^MŒèîøò…áÕŸ€iô¨Z0şûäºjë!ŠºŠğ(CÎã0öÑük\ZÑ¨ë?AÆçîb}rg¢Ç‘8Òõg9•¶(j\ZâîBEÆ9%•[½rD±FıHü0‡Ş¿òb\Z§ğÿŒ, †Óni2x\\RNê1vòZ¨„ı%@sÖ\ZÛT†ŸÓv½¶§]Û±µ»•me™\"lA&A¢Æ‰Æî§¿¼%F5ş1Q£&^/ñ‚‰Cğ‚ Ñ8Ä\0d\\\\Ë&c[7º¶ÛºŞÏ9¾ßéZF·l¢ù%§ızzrÎû|ß{y÷ÌáEiµE4\\éÚšÊ;éî/\rŒÄ¶Ÿ\Z{?—IõX•)”Â7Ğx‹äqõCnXYm½ÃP¦û‚\n$Ïòee¹	•Ns§ÏmëŒL¥gƒÏpœæ[£ 	Yå?Ò˜ÿ¼´úe5nÓMNó7‘É´ÑJ©Ïë2Ã!èÕ„iµˆoPF\Z\'ºvnd\nLi†P¹ÛlsGH+ÿfş\02Zïs™[hu÷…¢Ã¢Gm…vJòºy	ÕÜÇS9„\"IŒD’ÊXxbûX$ö:s±§·6Ø%Iòær¹¢!‘H$ĞÑÑ+¥`‹`<õ–W«m FÙ1ûÿm,ĞÈÙçç»¶ô\\‚–^WjÇg;w1®ke²ı¥ü‡1`·™IàE.¼„CSà¥jkNó†uÚ\ZÛ2©¬<¥•—ÌòPÖ‰­¿}¹Øo»Şz,±\0›WÔÇ*î D…U\"²ÏIKÀªFÇ†uûYeº¢nï‹ï=uëk¬ĞÌ@.ÕÆ6ÉBô/ÌO2õ \02Ÿ?–h5iˆN=²\nv/Ó©]t°ÚçgKN’õì×–µŞ|¯¯ß„İ\'#h«M¢ŞÍ“4æH$qôøiœ8u\0òp¹]°{1ÍĞPÚdŒsb‚Òäd.ÑLZ¥¾*Ï•©™vSpœ[Õ\rÅ`«×Š¡‹Sìo¢˜ĞÍÙƒâˆßzll\"\Z\Z; ¼½ï‡“øó`\Zê|°Ø½°×m &é‚Ï-Â.I“rêS“i	ÚX\ZÆd^gáD¾úËD7¶.*¼·™àĞ¶`”l­u›±y•\0¥hÖÚ*Íb—•bÑ)Ì-\rÎÚƒñş\0ê–·\".®†Ç¿\\m1ŠÍÒ>«WŒÓ³[—™x˜…2¤$+¢I‘Äånx„q¼·í\0Ö¯ñcE½;ß>™Uä¨, 1¢\'d¢ûi±Ê/¢}…Q­+ÜŒxd6i4°dOÀ\'„¿‚g±êæ»\0Ïõ(w	ÈeÄh5ˆ§º-\nley\0“‘¤Fİ~‹è>íJ}­ÓiFÓN¬ß,İïÂŞ€kõğ—Ëªñ‡ÇÜè\rUÖ·XiµuEÊ™“/Õ©Ü<‰ğ2\09©\0$?úpâXªë\ZÁ‰~,«Hcä]Ì&hé:\rF2úÂ¤¸HYYŒœ*ét<§‚(ˆUÅÄ•Á(¸°æú•…£àíëñù‰1\'¡¥Ö‚»ÚíÅ~;ËØò<íjæB²|ISÎ0ƒ–}±y$\Zƒ\"Kä.V¬¤Ì2Ù¼êJ‘™NÊˆ‘jLZˆ$²˜<dk åò;Â\\‹	.\nIÉŒL×ªHQ\\¬¬¶¡±Êª¶²NÆpàø|j=õóÇI^Ü)‹»4ãoU¾jÖüG&E:1ç&mKr?Ë¸ŒTaUZ»Œ¥p3-BÆ0´\\>NRÜÀe02<§«¢¨¹Ô~ÅJ¦’YœœÄG.Àç²¢~™fJç³c–ÙTJ}æİÖas›£·o¹_oûÚ}; h€£Ò§\Zåwh¡×å]Eı˜…›õÍ€PIA™<¾?ºq1:;ÖmR•èe¹^Ïãºzš(UöNãû#C¨&aï¯(t*`Á,TĞËL\"æÍMÍ8Ó¼\ZÎ÷aèğô]Ø°é6˜‚j [¥D¡‘%_N¦’ˆ‡‚ôC–R÷æ;ïƒVoPõú|ƒ¥Ùr-b»O“k…Ô]jòÚT %I¨Ô…Ô·	LíØóù.[ïÁİ×\".·ãhO\'a×ù^X.ˆ•uhjn¥\"f¢ÀågÀË”¥ÒRSö\"D.#‘¶¯Û—gÙL»jq^¥¥mfñPé4ağâ4~9~5UÎ9Ì·àSÖàŒÅLÎı_Bßı#üzAì¹‰İÈhc0Œ–¡¥û6>ÿ*²´ÄÁ>ÿ<…ı]Û(êsäçD­‰Ci5<ô&3Ü^Ô5^‡æöMÅ‡æ¤+—_,²7•Ã(•+Ü;yj°™øÎ¦Î–Wšk02Eß00ŠTg¼í9ˆ=N§_RN½ç`?{‹²†¦A\nè(÷¡UÿĞŠŞly²Ùnd†B@É¿b8º?ıî˜ôî[º¢ìõúÿg0B4ÌÚ|Î¤­qøyÁxî?ŒÄÀ~ÿ)5Ö{\\z!œÅäµéè5°@Q®ÊK	p~úxh­š{Í&ø\"ãò¯³Ø)Rê~ö\Z.áÕğ7›ìX@Ô€ôÃ\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(35,'sys','quickAccess_placeAd.png','image/png',5352,'2013-12-14 18:15:36',5352,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0ŠIDATxÚbüÿÿ?6À\":::ş‡‡00³±0pqr1°°°00şüù“áæ­»ÿyyy~üøÆÀËËÃÀÆÆÎÀ\02êöƒ{ÿß~xÿÿŞºyó¿§·÷&Qû¶ï`8rèPÇoÛáûB^At cYyö+ª-êÿ\0ˆ§«Î;³ãÚÕ›î2r²êjª¬¬¬\"\"\"ŒŒ7oİúÿŸ‰™á÷·¢¢ÂLÿ=ºˆåç\"bÂL<Ë.e¸tå*ÃŒÓã>òİ¢5:æÚ\ZšZúúú×®ß\0»Š	æ\" PaÈSù œ®ÂXşüşÃpìøñ?²ò\nÌÏ_<eàçgàâï?€ğññ1|üø‘áã‡oß¾•Ûğõë·ÿ¾}aaøÏÈÈÀ´”H¯^³†aıÆÍ~.ªz\Z@ƒxÿcéå‹Wï>¼aøôîÃŸ?@Õtõt._½Êğşí[†å’ÛìveÈ+™ÈÄ2kÖ,‘ıû÷¿}õê5ëÿÿÙXXÿüû÷Ÿ‹‹ëÿû˜®˜>æyër—õ¼ÃıÂüÛx=\rt(rù€ø‰ ¤ÊY\Zˆ‚ğ·»¹v7‚Æ,ÑfEñ\01ˆ`£ ¤²öØÇÒc+¶şZ\nb5…l ˆ ®š=²Î&ZX80Å›7Çûf¾7ÿî‹ŠÃ2ë¸¸¾²X–Ah¤x¸¯B–#DQÇáöîápm­­[ÓuXä%x½}\"ÄrO„¸pİ4áöğxWU‚ØÄõF‡RéÒâE¢ÇM¯sk¤\0LCÅÀér¡nj%Æ±›Ív\rPÉÜ\'µÃ²ˆÌF¡*åkDc}H$¦› OŠ§ë—¯/*sG¨(\nÊJ™†VDWw7âãcØÜÚÆİ5ôP­\Z4iÎM-×ê”Ÿ@3Tgey/¯oè©\0Ò(\nkW(äó>{–BŸŸ±wp\0cĞ€ÔÀüÂ$>ıx4]HçàßW÷˜t:½sœË%\r£ÎºÀ[¦” n½fÜ‡OƒE<5…ä¹<ñë£üTt³–¢¶³íRÃ¦÷wí¨¤šíû%\0måûÒTÅñïİ»»Ÿ÷Nm¨#E›£–?ªëìEfDD‹² „ˆòEHD±zß›ˆ {ÓÄ0c)ˆBÃi¨étF ˆš¡™°é6µÅÜng·½è(tà¼¸÷yÎóœó=Ÿ³k-íÖøÏ&7hz;ñĞø\"oÎ/îîö£¦ª\Zmm>8Nø|>Ô×ŸC<ƒÛ]G8XÇ@0(ov»İøà÷ËÿÅârwÁn·ÃsÅ3/È9“qœ\"ÎÌÎ/HfŞŒğä55¤(´Z1H‡İhj\"¥däuFV&#7ìß÷g0ıu†¬çÕ`•=ŒÎ7<O—*CbÛ&Í!ø1\0­NG‚K@¢ o»Ş7˜Ğñº\r\rç³•„^o@Ëİbª’R‚£´•§ÁÁn(DUµ6›í%EÏSz½^ôöözòó¥t2\rk‘±ÈÄãÇà+¡a÷¡òÄÌÎ-€U3ĞjõXYùıe¥èlkGrc÷?Â¡òr9`A~!@\rGÅ-«fÈ5P0Šçß—ç¡0é‘ØŠ¡ì`	¦¦ÂØVQû§X]dÁ;$ÊK‚jñit¥°™^Âqìlfvßç‘XÃ`ô£µõşE4\ná7a¢†nÄ—‘iœ<%b-\ZÍ&H91ˆunL…\'ÁÒÁÑH×\ZÁ8MHe¤6YT	•ğZNÃdt¢ùÎífÆår	İ==k@\0ËËK”\r\nmùƒA§íErkF^€(Ö\"4¢ï_¸ùä,÷J0qv€\0Gµ#%¥ˆcq=*bõçÊLö*šDº 1Gõ­¯¯ÏØßßoz5\\«¾¬*Ñ!Ò4ı«ZR˜\nùRéÙ™§F³´§NÎ]„\'§.»”Í yŒ<B”ó¾WTä¸³£eÏş#\0õeÛTÆñÿ9íéÚu;ëÇÖ­]×\"\"#.4¨,ºš˜˜ÈHî€‘xçpaH–Ìcb/$ã…W€¡™%†(Ä€@¦À`ÙnÆúÍh»1úqÚÓ­Çÿ9+è%Á+.šÓóö}Îû>ÿ÷ÿü—ß‹^ş\0f£ÂT‰™îiºÌ¢ˆşXk5Ò€PaBiÉXÁ5~ˆÄCE#pœIÎ#-\ZWáYò‹Åâ~¿Ÿ€ÜÊ	WDÀğğ0ñ¨aÃ‘H===D_ß^Â—û÷ä³wi#7±·¯#tZæjäŒşş~`qq±›V§–Uœ={NîìÚ°%t“âälÜ¸Ñ099‰` ˆ¹ÈrÁ\0ñpÉ°£: s4É˜¹?[}sóf“±‚•ªîôÕ}V©J¡ˆ‘K#hóñyXíş5h¦e8.˜VKZš=†Æ=nÖÓEÏ_ø¬±¡N—õÖºg¹õÅNº[ZwÛØˆÜ{I²@2Y ZXNˆ ÅB/!‚†\n;\'±ÔÙ¸¥*VH-ÌÕê6QR\"¼‹fVWÀbc«·¿/si#/¼˜$ü>R‹YdÈ»DU­0‰\Z¦g¦qùÒ8\Zìp8d´u´ã1‰(ĞæÃøØÖw­G»ß÷¯Šô\nånv·éá¶õnÇ“BëºŒR¨Ñrtâ6œÆ&ñ»‰„çÃ«TÓèØ\rŒ#³Åñğ	Ü˜4ŠĞ“\'9câ“ápÃİ»óFÁñxÚ„û‘Yâ|yn‡·5Xb”¢%ºY‹ei1á5v2iîwØïõy±…$9:2Š&öY’½Sn2ÔIR7/¿™õt»H&ô}:˜ÀG©\"›Véˆ¬j²H–²Š(WX¿é÷§Ø?|sä¬ÌSI-á¯[7qìØ1d¸¥;?Ş‰P(Ä9›éD\'@!]È.–­fdò9äæ‹Ì@njÀ\"›¿d&aÀR\'¡{ëV$y^–™à¹¹HÏ?„ìtråí¸zí\nÒìE¦îNu\Z9ğù|ŞT*Å?š±ğ(	EQH&ÏTá®w\"yHÙ\núÙ…?ØAõ˜pûÎßˆE£Hqb¿7m×Z<^×‚mÅœ9Áõëcèy/ddÚê	í5Ğ¥\\AûÚ \'LâêŸW°©ë-¨Äöåå<U%A[®\ZÛ‘Igñ9O«ÕfÅ×ßîÁ™nZ…–€’Ob¼Ú‚Ov@.7¢#XŠŞí½Ÿ\nyŞèÀPøkP)É[Ócd›vß8\"Ñ·\'\nï7°éĞ9*:Çi)‡ßmlwB¿ ]y„ï¦†©>¡ÛÅªLm6›wjê.˜ R‘{NbKW\n\n-b\r\nù\"ßn	ñ(­Âå ‘•‹Íaòì¥\rç ¿-ë‡ÙEëp/®i9lº?‹];wˆÂáÃ‡·\'‰£3÷î¹TµLÙSQ1jE°XDª¦ªIuz—³ÂŸWš#ƒ‹•JY˜èŒÙuå­dTd‡â°$å½áÆ÷¯÷!y~é‡ÃqHP¥¡T*y9©ô<şNA˜Ãáp+\r±é§?††´ÏÖ	Ë—³H™@ËéĞZïÂ	û†£[>øò+öÑé§5Y¬5 ÏSğu—læGG©q³|=·¥Y€‡Æe7£_ÍŞü\"ùÇU_¨è×ŠŠµ†,ú±Õj5TÉÖĞ¥úÂTñd±Ô=\r Ö‚Tÿ¶</=\rğ\0íY[lT×]3÷ÎÜy?îØã±gÆ™±qh ã0Ä¥‰ÊO›¢å#?U¤¨ù¨úÛ©ü¶\rDJ©Ô¦¡)mš@¥Qy¥!¶PÇ./;vÀø…Ÿ{Œíf<®sf\n¦j¥¶‰*Õò•íñ½çî½ÏŞ{­µÏCçEÿó¬åÿü;\"¹Fd.¤—.vşÀlÖ^,Ê*LÊ¼­ß£`|†áß˜Ësrb,„BN,ŒFEU!/$‰uTCNRAƒ’7˜5áã¼ÁP ƒò\ròeÅl„bø&ş\\šâÙlö§Á`ğõ¥(»wï–ÊQ<(@gb|b¿İå¬WMšHŞÕ÷ìù‘—šÔ³lY½‡\rÎóæ›ÜÑXÔıÈWuÕ\\ƒƒ®öö®Úºz×Ñ£G\\ÄiÊ8İU®v·´~ì&F»ËÊË=oüâ\rO(Táíèèğ<qZ_L§õÁ!Şé{P_óøZıàoŞÒ/_îÒ#‘¨¾k×.äB?yê”ŞÜÜ¬Ó\rpmÕuı×¤P6KÔÎe¤0ä¢ M\rçIr$×ûö½*ùmOw7¦ˆ÷™Lªª ‹áÙo?ƒ\'›7âÜùs¨®‰ ‹¤buC£$ù|ıC7ä”óíß½–Î`ÕêUˆS€^»v66Q¬:q•2üƒ?Á†¦õìï“Ì3ŸF PFš–ğ380€ÎNI2ùÿ\'(„H{CšFeáÍ\'Nh–ÿ¢‹	*wÃ¤i°ÛìĞ4“,7Èlaær²\'¦¬L…4å»Ñ¤2\0w!Ø­—ˆÙ‹Ùb£!‹rà¬*Šd¹Fò“»˜HÕ¨Ê5Eºyeé<!„›(ù3ÌB“Döúµ>ôôt¯Û¶mû\'÷k€6dó\"â˜u»ÍæÀ_;;Æi$æ“‚W#Ã+Ï‰@–IgÉW(ıSrš,34^Ğ=7äXy™õ\\^ÉJg…D22\0¢f”B1Ñ(³Ìq‹jF:¿1·ÎXTR|—EğTU•ÏEkëPê/ÁÕîÜjÚ½ÄFAh+ŞÉÕuİ‡\'Ö®\'¿¿+#X	saQ_9rÕqr~?’é$nE×ÀauaddˆbÃšê0\r(hµÂşäIšÜ¼…ë$Õ>O	œÒ‚ASøzî`jòî¤¡âó»Y2–ÄwÁ€[3ÓğØ]SQ	&ãq{^äÒ÷\nùzç]µ2R3_‹i7†‡$Côø<Œ †™±	Ô-¯#me¤Å–}$/¼ÏZH6Íè1bIîœˆ=D‡jÂbE?yñ‘Ãï£¾¾uËêI3’g\'R	¦Â]¤¼˜ÏéæNdpåêgèºÒ	»æDí²ëg5\Z{Lv§íí©×¯Y~Çı6*=Q•5eş€6y›rcvF*°Ûc“°:l²Åm=ÇÈ$ğ—¡¯»ZÀ	;™Ã£M\rêíÇÔì4ÊBAI6İT\Z“Ó“¨†á£T-&Ì-¤0::SÇO£aí\Z´¶œ¡ƒvT…+)e¦±õ¹­Ã»¾Ãg7cavA6˜‰‘	Ü‘³ùºhÄÜßw=H£Fî;À(RønòùtLLN ¬$@ÆhÎŠ\"M!mÈ VWƒ@¨\n/]†¿2ˆ&Fehâ&ğÈ®!¢ÔÛ×G]µL¦”ÂíBƒ¤ãw˜J*Şï=lÛş,ì^\'~öÚkT…PSé”¯„ÑŸŸãBÛYLŒÊ3›djƒ}C˜fPÅ3ÂªTƒÃáiôÃû°ô|ŞûÂ¦M›Ÿ†Ê‚Ä¼)n±Å¢È¢šO¤q­û*ü.Lz\03qŠ;*¡Ô8ò4ölGbåQ|Ş×»ÕN	œ¦BJRŒ{™M\n>imcÊ,àĞá#¨¯‹¢‰í6\r#PRÉ–jg—b=x¼…4eÜf¹şñS\'‘ea?õôS;·dê‰n–Ëe·<à\0Å¼¹½½=lTŒhhhø¯ =RUı/ÿ\'	„ËÑÈT‰ÖÖÂÎÖ*NéÆoM¡ãrÆ†‡¥¤N²¥&‡5÷%ÆãØ±clÏI„™_]µ’Xd>PÄZ[[[,‹áâÅK”ß”zL«4ûwU¤š 3,\ZE,’-“2EBAÎXx‰|eáèMha™+V®]Càuèb†@Éæ`m›7-æ²8|â{8í›ÂX©^³&Òô|F…ÕhGÈRu\nlĞ‚0åêà-ñr=/M`ó767_ºt±EîÀ–-[^Æ£°iÜÆzvP:şü¥.˜ŒœïìB™ÛsÛç/…İ`B s±è»>»BĞbgçÉûº@ú›Ã7Y#l¯\n…	Ã£Cø´íÏ}„ä:Ö¶\\\nñQ\\øú‡‚ó`yÛ7q%Ş‹áÄã¾•Ø\ZHbÅx)úm¨†ğäÆ;iz‹\ZFÍ{÷îmˆáG:•b.zğÎïß%€-ÂÏ¾®¬@:¹(U¾™Lîrï4ªæSXQ÷şüá¸K<¬Yø~\Z;,¦÷R¢{FjlV04›éÄ]ÄgYĞy¿:ñäŸóC¯6C³ÇR˜?;×‹y¢3éfÒ³8=rKa+Y‰\nS‘ŞŠH,¶^¦Ğ;JH~‰DvŞ™›3\nî!rpRp\"«7›I)ŒR±ËÔG+VFÜ_ÀôÔmÙ»v©‚‰è=QK¢ÿå‡Š3¢5ÏÍÉÉ3}Ìõ¶á6˜ŸöÁìP0üJ7„G™EÖ‰ÂALFêy¡å›+Vã[å¸úúy8ìL\"±ğcÖÖCWW—…$©šÔóÁjÖ„ƒ¿ş3ˆâøG…\'‚A§•™™óÔÔ”…ŒÒÌ4UÚ·s¸Fsjë¼P]¤3$“=óˆFûŞ„,Ê?ÄID£9^2•ÇK´¯½BGû¸toYYÙğRYo|XgÿşıêÑ£Gm.¦‡“ÌWšVÛ_é–åYÖÁÇâOÉcø|ğj’Ü	²0šñr\"ıé÷_:×T\\2÷÷ëÑÄ†‚R”ÖÊËQ¼´âDÀPU¡~×è6=“ôjş¸ˆlÕ¯ä²1Knl…#÷Ö«â»yßbqzğÀNQÜPEG´âHÃ\\üÌ¸$²Ù%#TÑğì?›H|Üû¨h´aÉU$5÷®ÜÒˆ©<Ì¯¿¦‘1‹¦6Uğ\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0ŠIDATxÚbüÿÿ?6À\":::ş‡‡00³±0pqr1°°°00şüù“áæ­»ÿyyy~üøÆÀËËÃÀÆÆÎÀ\02êöƒ{ÿß~xÿÿŞºyó¿§·÷&Qû¶ï`8rèPÇoÛáûB^At cYyö+ª-êÿ\0ˆ§«Î;³ãÚÕ›î2r²êjª¬¬¬\"\"\"ŒŒ7oİúÿŸ‰™á÷·¢¢ÂLÿ=ºˆåç\"bÂL<Ë.e¸tå*ÃŒÓã>òİ¢5:æÚ\ZšZúúú×®ß\0»Š	æ\" PaÈSù œ®ÂXşüşÃpìøñ?²ò\nÌÏ_<eàçgàâï?€ğññ1|üø‘áã‡oß¾•Ûğõë·ÿ¾}aaøÏÈÈÀ´”H¯^³†aıÆÍ~.ªz\Z@ƒxÿcéå‹Wï>¼aøôîÃŸ?@Õtõt._½Êğşí[†å’ÛìveÈ+™ÈÄ2kÖ,‘ıû÷¿}õê5ëÿÿÙXXÿüû÷Ÿ‹‹ëÿû˜®˜>æyër—õ¼ÃıÂüÛx=\rt(rù€ø‰ ¤ÊY\Zˆ‚ğ·»¹v7‚Æ,ÑfEñ\01ˆ`£ ¤²öØÇÒc+¶şZ\nb5…l ˆ ®š=²Î&ZX80Å›7Çûf¾7ÿî‹ŠÃ2ë¸¸¾²X–Ah¤x¸¯B–#DQÇáöîápm­­[ÓuXä%x½}\"ÄrO„¸pİ4áöğxWU‚ØÄõF‡RéÒâE¢ÇM¯sk¤\0LCÅÀér¡nj%Æ±›Ív\rPÉÜ\'µÃ²ˆÌF¡*åkDc}H$¦› OŠ§ë—¯/*sG¨(\nÊJ™†VDWw7âãcØÜÚÆİ5ôP­\Z4iÎM-×ê”Ÿ@3Tgey/¯oè©\0Ò(\nkW(äó>{–BŸŸ±wp\0cĞ€ÔÀüÂ$>ıx4]HçàßW÷˜t:½sœË%\r£ÎºÀ[¦” n½fÜ‡OƒE<5…ä¹<ñë£üTt³–¢¶³íRÃ¦÷wí¨¤šíû%\0måûÒTÅñïİ»»Ÿ÷Nm¨#E›£–?ªëìEfDD‹² „ˆòEHD±zß›ˆ {ÓÄ0c)ˆBÃi¨étF ˆš¡™°é6µÅÜng·½è(tà¼¸÷yÎóœó=Ÿ³k-íÖøÏ&7hz;ñĞø\"oÎ/îîö£¦ª\Zmm>8Nø|>Ô×ŸC<ƒÛ]G8XÇ@0(ov»İøà÷ËÿÅârwÁn·ÃsÅ3/È9“qœ\"ÎÌÎ/HfŞŒğä55¤(´Z1H‡İhj\"¥däuFV&#7ìß÷g0ıu†¬çÕ`•=ŒÎ7<O—*CbÛ&Í!ø1\0­NG‚K@¢ o»Ş7˜Ğñº\r\rç³•„^o@Ëİbª’R‚£´•§ÁÁn(DUµ6›í%EÏSz½^ôöözòó¥t2\rk‘±ÈÄãÇà+¡a÷¡òÄÌÎ-€U3ĞjõXYùıe¥èlkGrc÷?Â¡òr9`A~!@\rGÅ-«fÈ5P0Šçß—ç¡0é‘ØŠ¡ì`	¦¦ÂØVQû§X]dÁ;$ÊK‚jñit¥°™^Âqìlfvßç‘XÃ`ô£µõşE4\ná7a¢†nÄ—‘iœ<%b-\ZÍ&H91ˆunL…\'ÁÒÁÑH×\ZÁ8MHe¤6YT	•ğZNÃdt¢ùÎífÆår	İ==k@\0ËËK”\r\nmùƒA§íErkF^€(Ö\"4¢ï_¸ùä,÷J0qv€\0Gµ#%¥ˆcq=*bõçÊLö*šDº 1Gõ­¯¯ÏØßßoz5\\«¾¬*Ñ!Ò4ı«ZR˜\nùRéÙ™§F³´§NÎ]„\'§.»”Í yŒ<B”ó¾WTä¸³£eÏş#\0õeÛTÆñÿ9íéÚu;ëÇÖ­]×\"\"#.4¨,ºš˜˜ÈHî€‘xçpaH–Ìcb/$ã…W€¡™%†(Ä€@¦À`ÙnÆúÍh»1úqÚÓ­Çÿ9+è%Á+.šÓóö}Îû>ÿ÷ÿü—ß‹^ş\0f£ÂT‰™îiºÌ¢ˆşXk5Ò€PaBiÉXÁ5~ˆÄCE#pœIÎ#-\ZWáYò‹Åâ~¿Ÿ€ÜÊ	WDÀğğ0ñ¨aÃ‘H===D_ß^Â—û÷ä³wi#7±·¯#tZæjäŒşş~`qq±›V§–Uœ={NîìÚ°%t“âälÜ¸Ñ099‰` ˆ¹ÈrÁ\0ñpÉ°£: s4É˜¹?[}sóf“±‚•ªîôÕ}V©J¡ˆ‘K#hóñyXíş5h¦e8.˜VKZš=†Æ=nÖÓEÏ_ø¬±¡N—õÖºg¹õÅNº[ZwÛØˆÜ{I²@2Y ZXNˆ ÅB/!‚†\n;\'±ÔÙ¸¥*VH-ÌÕê6QR\"¼‹fVWÀbc«·¿/si#/¼˜$ü>R‹YdÈ»DU­0‰\Z¦g¦qùÒ8\Zìp8d´u´ã1‰(ĞæÃøØÖw­G»ß÷¯Šô\nånv·éá¶õnÇ“BëºŒR¨Ñrtâ6œÆ&ñ»‰„çÃ«TÓèØ\rŒ#³Åñğ	Ü˜4ŠĞ“\'9câ“ápÃİ»óFÁñxÚ„û‘Yâ|yn‡·5Xb”¢%ºY‹ei1á5v2iîwØïõy±…$9:2Š&öY’½Sn2ÔIR7/¿™õt»H&ô}:˜ÀG©\"›Véˆ¬j²H–²Š(WX¿é÷§Ø?|sä¬ÌSI-á¯[7qìØ1d¸¥;?Ş‰P(Ä9›éD\'@!]È.–­fdò9äæ‹Ì@njÀ\"›¿d&aÀR\'¡{ëV$y^–™à¹¹HÏ?„ìtråí¸zí\nÒìE¦îNu\Z9ğù|ŞT*Å?š±ğ(	EQH&ÏTá®w\"yHÙ\núÙ…?ØAõ˜pûÎßˆE£Hqb¿7m×Z<^×‚mÅœ9Áõëcèy/ddÚê	í5Ğ¥\\AûÚ \'LâêŸW°©ë-¨Äöåå<U%A[®\ZÛ‘Igñ9O«ÕfÅ×ßîÁ™nZ…–€’Ob¼Ú‚Ov@.7¢#XŠŞí½Ÿ\nyŞèÀPøkP)É[Ócd›vß8\"Ñ·\'\nï7°éĞ9*:Çi)‡ßmlwB¿ ]y„ï¦†©>¡ÛÅªLm6›wjê.˜ R‘{NbKW\n\n-b\r\nù\"ßn	ñ(­Âå ‘•‹Íaòì¥\rç ¿-ë‡ÙEëp/®i9lº?‹];wˆÂáÃ‡·\'‰£3÷î¹TµLÙSQ1jE°XDª¦ªIuz—³ÂŸWš#ƒ‹•JY˜èŒÙuå­dTd‡â°$å½áÆ÷¯÷!y~é‡ÃqHP¥¡T*y9©ô<şNA˜Ãáp+\r±é§?††´ÏÖ	Ë—³H™@ËéĞZïÂ	û†£[>øò+öÑé§5Y¬5 ÏSğu—læGG©q³|=·¥Y€‡Æe7£_ÍŞü\"ùÇU_¨è×ŠŠµ†,ú±Õj5TÉÖĞ¥úÂTñd±Ô=\r Ö‚Tÿ¶</=\rğ\0íY[lT×]3÷ÎÜy?îØã±gÆ™±qh ã0Ä¥‰ÊO›¢å#?U¤¨ù¨úÛ©ü¶\rDJ©Ô¦¡)mš@¥Qy¥!¶PÇ./;vÀø…Ÿ{Œíf<®sf\n¦j¥¶‰*Õò•íñ½çî½ÏŞ{­µÏCçEÿó¬åÿü;\"¹Fd.¤—.vşÀlÖ^,Ê*LÊ¼­ß£`|†áß˜Ësrb,„BN,ŒFEU!/$‰uTCNRAƒ’7˜5áã¼ÁP ƒò\ròeÅl„bø&ş\\šâÙlö§Á`ğõ¥(»wï–ÊQ<(@gb|b¿İå¬WMšHŞÕ÷ìù‘—šÔ³lY½‡\rÎóæ›ÜÑXÔıÈWuÕ\\ƒƒ®öö®Úºz×Ñ£G\\ÄiÊ8İU®v·´~ì&F»ËÊË=oüâ\rO(Táíèèğ<qZ_L§õÁ!Şé{P_óøZıàoŞÒ/_îÒ#‘¨¾k×.äB?yê”ŞÜÜ¬Ó\rpmÕuı×¤P6KÔÎe¤0ä¢ M\rçIr$×ûö½*ùmOw7¦ˆ÷™Lªª ‹áÙo?ƒ\'›7âÜùs¨®‰ ‹¤buC£$ù|ıC7ä”óíß½–Î`ÕêUˆS€^»v66Q¬:q•2üƒ?Á†¦õìï“Ì3ŸF PFš–ğ380€ÎNI2ùÿ\'(„H{CšFeáÍ\'Nh–ÿ¢‹	*wÃ¤i°ÛìĞ4“,7Èlaær²\'¦¬L…4å»Ñ¤2\0w!Ø­—ˆÙ‹Ùb£!‹rà¬*Šd¹Fò“»˜HÕ¨Ê5Eºyeé<!„›(ù3ÌB“Döúµ>ôôt¯Û¶mû\'÷k€6dó\"â˜u»ÍæÀ_;;Æi$æ“‚W#Ã+Ï‰@–IgÉW(ıSrš,34^Ğ=7äXy™õ\\^ÉJg…D22\0¢f”B1Ñ(³Ìq‹jF:¿1·ÎXTR|—EğTU•ÏEkëPê/ÁÕîÜjÚ½ÄFAh+ŞÉÕuİ‡\'Ö®\'¿¿+#X	saQ_9rÕqr~?’é$nE×ÀauaddˆbÃšê0\r(hµÂşäIšÜ¼…ë$Õ>O	œÒ‚ASøzî`jòî¤¡âó»Y2–ÄwÁ€[3ÓğØ]SQ	&ãq{^äÒ÷\nùzç]µ2R3_‹i7†‡$Côø<Œ †™±	Ô-¯#me¤Å–}$/¼ÏZH6Íè1bIîœˆ=D‡jÂbE?yñ‘Ãï£¾¾uËêI3’g\'R	¦Â]¤¼˜ÏéæNdpåêgèºÒ	»æDí²ëg5\Z{Lv§íí©×¯Y~Çı6*=Q•5eş€6y›rcvF*°Ûc“°:l²Åm=ÇÈ$ğ—¡¯»ZÀ	;™Ã£M\rêíÇÔì4ÊBAI6İT\Z“Ó“¨†á£T-&Ì-¤0::SÇO£aí\Z´¶œ¡ƒvT…+)e¦±õ¹­Ã»¾Ãg7cavA6˜‰‘	Ü‘³ùºhÄÜßw=H£Fî;À(RønòùtLLN ¬$@ÆhÎŠ\"M!mÈ VWƒ@¨\n/]†¿2ˆ&Fehâ&ğÈ®!¢ÔÛ×G]µL¦”ÂíBƒ¤ãw˜J*Şï=lÛş,ì^\'~öÚkT…PSé”¯„ÑŸŸãBÛYLŒÊ3›djƒ}C˜fPÅ3ÂªTƒÃáiôÃû°ô|ŞûÂ¦M›Ÿ†Ê‚Ä¼)n±Å¢È¢šO¤q­û*ü.Lz\03qŠ;*¡Ô8ò4ölGbåQ|Ş×»ÕN	œ¦BJRŒ{™M\n>imcÊ,àĞá#¨¯‹¢‰í6\r#PRÉ–jg—b=x¼…4eÜf¹şñS\'‘ea?õôS;·dê‰n–Ëe·<à\0Å¼¹½½=lTŒhhhø¯ =RUı/ÿ\'	„ËÑÈT‰ÖÖÂÎÖ*NéÆoM¡ãrÆ†‡¥¤N²¥&‡5÷%ÆãØ±clÏI„™_]µ’Xd>PÄZ[[[,‹áâÅK”ß”zL«4ûwU¤š 3,\ZE,’-“2EBAÎXx‰|eáèMha™+V®]Càuèb†@Éæ`m›7-æ²8|â{8í›ÂX©^³&Òô|F…ÕhGÈRu\nlĞ‚0åêà-ñr=/M`ó767_ºt±EîÀ–-[^Æ£°iÜÆzvP:şü¥.˜ŒœïìB™ÛsÛç/…İ`B s±è»>»BĞbgçÉûº@ú›Ã7Y#l¯\n…	Ã£Cø´íÏ}„ä:Ö¶\\\nñQ\\øú‡‚ó`yÛ7q%Ş‹áÄã¾•Ø\ZHbÅx)úm¨†ğäÆ;iz‹\ZFÍ{÷îmˆáG:•b.zğÎïß%€-ÂÏ¾®¬@:¹(U¾™Lîrï4ªæSXQ÷şüá¸K<¬Yø~\Z;,¦÷R¢{FjlV04›éÄ]ÄgYĞy¿:ñäŸóC¯6C³ÇR˜?;×‹y¢3éfÒ³8=rKa+Y‰\nS‘ŞŠH,¶^¦Ğ;JH~‰DvŞ™›3\nî!rpRp\"«7›I)ŒR±ËÔG+VFÜ_ÀôÔmÙ»v©‚‰è=QK¢ÿå‡Š3¢5ÏÍÉÉ3}Ìõ¶á6˜ŸöÁìP0üJ7„G™EÖ‰ÂALFêy¡å›+Vã[å¸úúy8ìL\"±ğcÖÖCWW—…$©šÔóÁjÖ„ƒ¿ş3ˆâøG…\'‚A§•™™óÔÔ”…ŒÒÌ4UÚ·s¸Fsjë¼P]¤3$“=óˆFûŞ„,Ê?ÄID£9^2•ÇK´¯½BGû¸toYYÙğRYo|XgÿşıêÑ£Gm.¦‡“ÌWšVÛ_é–åYÖÁÇâOÉcø|ğj’Ü	²0šñr\"ıé÷_:×T\\2÷÷ëÑÄ†‚R”ÖÊËQ¼´âDÀPU¡~×è6=“ôjş¸ˆlÕ¯ä²1Knl…#÷Ö«â»yßbqzğÀNQÜPEG´âHÃ\\üÌ¸$²Ù%#TÑğì?›H|Üû¨h´aÉU$5÷®ÜÒˆ©<Ì¯¿¦‘1‹¦6Uğ\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(36,'sys','quickAccess_searchAds.png','image/png',5353,'2013-12-14 18:15:36',5353,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0‹IDATxÚbüÿÿ?6À\"®\\¾r—‰•‰õÏ/fff–ß~3;zTéÇÏßÜ¼\\ììÜœ,l¬l;vì`Ğ5tgààe`˜ÔUÏ À\'ÈÀ6•¹ÁĞ1€A€ƒAJ\\”A\\L\nbÑÿ™2ÿ\n\n¤aƒa€\0bÄéªsçÎ–°±sä2şc`áäãşÉÁÊúOJJZ……«ûĞáıLll,¬¬@§²°f1Ş¹wïÿ½×2¦:¬3\'w\0-ddÈ/Èg`yûú\rƒ¤’\"ÃÕ÷<<¼j\ZZ\'Oú:MûÕ÷Û·Ù³³³µ]@8]…°üıû‡áÔÉÓïŸ¿z)0Ş<yyy~>>†K—/3èêêİ1ğãÇaaaÌ,@3||ÿ^@R^áåó~á¿şşcØ¿k#ƒ­\rÃçïß¾~ùÊpãê5.®oŒà‚œì,†Æi@µppÿòq†‡0œ:u’…‰™aåÊ•ŒQQQ\"ììì¯.œfx—Êà›˜4áÉÕÓsgNğë×wf6v`X®ÑšùšÌÿ~l\n2@9Õ¼2ÆñÏïy~fÌül»£™‰Ÿ¼”ƒ—r@J9iR.‹HyÉÿà°ã$”ÛÆE#Í¢„¬v ”·CfóÄ˜ıöx¶]äÄSŸãçû}>/ß»DğÏ\'s®áììü\n§’D‰D@(!\\ˆÔD5J	\'4S;X­Ö\n9‘ø‚NŸ_öüüˆÙ™ŒŒ¢PQ‹F¡(…\"ó…Ibìëş\r{eÈ“Ä@ã Bšœ+èJIPëjQm·K$°ö*\r:a4ä¡£½5j\"Ñ\Zë›`2[pt¸‡Í–m2›§•–—ÑÖ9\0£¥æÒZ´t\rcbbw—7èîîÅq0˜ıR(Š«ªª¿ùÕåf½Ø¾JÃø¼>°÷7|~¼Ãïß”Ò9pÆO‚09ZaÉ†!× {8AŠÊÈË!`,µUï‚ìv»S{»;dlr\náÛ+W–Cÿ–ÄÊÜbbp9“pR´ÚX`xÁ¾Óià]ü´ßö”>—ËÕüó`~A°¯{øA“ùKÒø€Öjéi\"ŠÂß”RJSËÃ:˜P\nh4ˆÄD,j‹.ˆ .\\P\\ÄşŸ.ÁÄÔbL€¬ÀÆ°Ğ€‘ HP ÈÃªIKÓB_¶Ó÷t®§cÂÂh\"‰ŞÉ™ÅÌ½÷Ü9ç{Ì¶±´İ¡ÀrIÊ`vvv~Íñ•µY­lõ³ƒµ9Ë|Ábö%f6›Ù§¥U604ÈnŞ¸ÅúŸö3j){;9Í\\nëêºÏ,–&ÖÕİÍ‚¡ĞVY¸T*…tZ$B,2ŠvêH’ó Rå ËŒ¬Ş¥i(‰Ğäç#‘E3Q)&\"—S{8Â’DÏ•Ôİ8ºFGF\Z­Öö)RV•œÉ¹îE,*ĞJ	±¸\0!,aîÃœœÜ·¹ç	òõàõzÂÜ;z—F±®É(mNI|?Bá ¨…¶ 0Ë¶:Ùi›´i$\Z¢ÓÆğ°÷1öÖ™Á×œGãÑ|ˆÄfú»—!òe)q*D”óıô4Z;qÆÊ\n7ÀétÂÔp¤vËÊ<Ï3CEPVúh»|JuY&…c€›¢„ä”¸Nd-Cb_\'\\ëp8¾á¤åt%;0>1¯k/l6´_hGkK‹,Àò-KËË+\\\\Ğ×ßë¥Û(¬®A\"AÊ‘¦I™Ÿ%ú’ÃJèÎ×ØU¾‡tL<U®—Œ(R¯ba•UFX,æ&…ÑhT©ÕjN \Z.-¯ ¹ù4ÆÇøÁë€İ¥$z Œ‚/£‹@\"²\0_0Œ<¥Š<$‰\r¿ŸÊÓåF’|D¤†/Úq¥£ãg·ÛÕ@ %×—Ş¹®¿Û©y3Y\nÛË1[Zm1VUku¥z9M(Ñ1“É4õ\'ÜËìå¸l„è¯Á†^²™«û½líËÚÉLC¯Ğü\r‰~\'\r¿†2´¹şâWWƒãÓşUà_2ù‡\0ÜWëoSeÿî´§—ÓËÊ¶nŒéØ\nİè²Šel01cÌ”K‚#øÅ$1Aÿ	10>øÉƒl3ñŒ1\'¹8Iœ@»¹±u+íF·uí9şŞS~0:>j“ÓÓ¦ïyŸ§Ïûü.Ïÿ„‹şÓdqÄ~ëûõÙb9À\n ´‰8„—%×L’¤Ky’.K²aµåéZ ?[’H‚…D\"›Í---ı4€Ü¡sÅé¨œ™NáêW091p8L;iÃ­_zÅ( ¸77!{€3]¨®©,Eóëoàşı~lnjÂèèè.6X²¤aAÇÆ¢ãÇáv_2„|0Ä¦¦(_Yºğ:ã¡U¼ôı2æ\Z76ĞßBcÃ$i[Š‹Ğ™ÈÍŞ^ñ=ò¸M´t~sv]MMè\'Ùj…?ß+m¥àvù÷3|†	33Óköœµ[ O²Ê²ùÛ\"µP;\rÒ¯VK9SË\ZÙòäİ?÷ŞDâá4³×DéÍ²Ø,VXè)²”«ÌõºI^¤o’é¡Ä @áÙÌÑa:lv&Ãuv‘HäÉ!•:ÛÕUY¿1¬([Éñ1¸<n\r!J,¤Ÿ*_Yª«‘JÎØHtªƒhêq²ó° ˜taåÎ ¨¨è	’ÅÛµë×5›bS„ıKÆ’(()@ë—\'PVQ‡Mõ½eµd(4WY.ƒ¥Ğ0ˆym\r¢›çw“6~ğn»öìÆ‹löö6iÏ7s‚(*V††û‘™ÓğˆšpşÂ9ø·áÙHšÜœÂCš–Ô-¨X6„o»»qµçK“BÕª5hÚºûö¾…AŒŒæ2—¤RŞFM -[æG  ·\'[Oâ•İï¢¼1/…F\'>ä%Í+ËP¼•¨z.‡×…©d‚Ä@*•Ä©Ó¸}¯/_4¨ªç½ÇHv²+´´Æé$ÊÊJÄã>K¹Ä¾»\'è	8üá™ªzba/oiBm]>_>3NŸêDåê ÇŠŒ°BÍæ!óe£iGhm7èq\r›ÕÏ[Ì\rÂ¥¿À¾€W&\rÄÓ,§\\fuím­˜ˆM±MÄ‚Ô®­ -5Ğ+¿$>üĞÓƒèİ;K\ZÑ$3§00s=cÂÁŒ¤|ª.À¯èp»İˆÔGĞ¸a=I…íL;‘eWi‹i¸Øª’@¾Y¢æææC\ZÕ]á,°cçNLOşÙy\rNj\Z‹å>–ˆK¾\\Éâ<ìü<ù$¦˜KiÆ½şÄÆ\'›|€‘áúñTMC¡PÃìì,Šƒ­Õn¶ä•6¨´,z2ƒw//·’39Auùü·¨Y³–ÿÆ™Eä#7œªÊóTiwlp_f7<xğDAaáŞa‚ª†Ê»zjß~Ñ±¶¾¶ªİj.LóL¦Äèµ.twŸ3í‰,s\Z’dXË,í†l•‘M“;Ş›‰Ç§ò¥*ZÀíúÑ#Û\Z>vm¿õè#œûäHrÈíé_^RRWRV.9]*7I±ÏÆ9á÷ûçşÍ°yzÀwBù-g|®ÃÚ]†q¦ÎĞZ*Œî’Â}bâˆr„ß¿İÖ·´´øşa2ù»ËÔ\Z´¹¬‡æ£Ü¼3lÌv_)øàë%ªÕRl—^53ŸıP5>ãæŸ?….)@ë\ZõBì}Õ8fÇ¡cO©·K	ğ‡\0íYkl“ç=Ÿãk|IlÇNâ\\\Z P.ÍÆ–Ğ•@ƒJÇ:V4\Zh«iÚ~lê¶j·Òiš¦ı´Mê´^øÑvU ¶M‹ÊehZm rc%HâÄ‰\'v|ÿ¼ó¼VÔ“6*mÓ,}ñ%Ÿ_?Ïó>—sÎû‰ã¢ÿzÔòş×0Ş.]R\rúÿhw8º Uš#G~‹İ_z‚-¹ ğgÏÅ§>M”§t¢D×8 x+1’`Ó	²L˜Jæg]]µz6˜	iÌd¸+‘S·hjÊ$ÓÀ3Üœ/7PW[{ÇP6¦’É×kjjö}Ì5²jæó…û4J@ó[‡ÃÆ©ö‹_ıİİ{qıú8Şíû+&&\'¤Õ¶âùç§Ó…ööv\Z\\‹‹„FííjñgŸı6öîíÆ8ÇŒ¤T7—;vìPÊ§Ü+#H>«\rÕ=N§û÷ïÇ¡C‡Ô=¢–îÜ¹“vØF7Ñ»ÙY–ĞU¡y]GïŸzN—3â¯”HT\'ihqµÙ¢üT†È£µµU-.?&ÌóµH´*´ü#`SŞÇ¢óêşZ:væÌ´®)~O$D¹/6_\\ãâÄçĞõâıŒ¼|VË5dıÖÖ5œ™fë7¯_¯§C7îì€D_`™Àh¾Úç,¯(±šˆ%Ì\Z’‰%\\¾8€D\"É)nC2—$ì°¡÷x/‚L8¼G‡G±uë#ğy¼ĞE™4¸İLM¡åÛØwÛç:™†ü¬Â«ü”lñUT\n5á÷·’c\"4…2FZˆ†€´È\\s)!¼\"•Z-†d2¹^T¡»RHÁ6^“©Ãf1¡… ‡uõ\rjwD”Õäi%FX`ñ½/P‰U„-B©ÆÇo CØ®ç…İiJÀ2\Zh*¿cg\ZJ\n0F\nÁ‰h¥®)Ş\'õà!Ô÷Uùi†Îš)QŠ‹A‹Ì#Aäİ@{‡wq•cwÕìöãÔ©Óy|•\ns!<Fm}£<u5ß‡Rœ…0re”Ö£ŠN”»İ°Úì*jz>Ë.BDdù|ÃÆ1C®x¸ç|•~”—;¡k¶â8;×\r*qM§±EU[«“Ó“˜¾9ƒâfòÍ¶¶¶\",®ğ~şcE,†\nO…ßÂ!r?óµ”¸¬ÀT\nÖ12šo¼vQNÂå©Åö|A²Àj5Âb1½ ºOé˜f*å³Ø-Œ]b±^VL®>@Q8ß5¬£—^}Na×ã_À÷ìFÿŸûaqÈYŒ	õËïÃªV#:7§CñbUMµó7o¾Yöä=ñ»àN´ù|~-2;‡¹XHäau’Æ0¥zzÑ ,Üşf²ïNdP…4“ ”Ó›h\\9©ç‚jfâ„Dà˜Š5[ğHÍr²ù1?~Ë››‘XŠãG!P@s}#šêêñòëo º¦¹BvCR¹4æægQ˜Ës\'Ëq|¸©i9~¿©¾‰Ë÷ŞåÀ»çúöìxì1’¶ÚXñF/»H¿ûm¤qìıÊ7°˜tÂêª c\'£›#Ÿ#Øv’/ÄÉÈQà1ĞVœqBbÿ_j7±óñ^´;·áwGc÷—»ú®t{‘¡¡ÒD:·?ŒPh\'ŸÂblä¸nŒµcG×ÖmJKmZŞHn&ô|ÿ¶w&ñgÚ6m‘XŒG‘L§q“¹7K`dhNoÉ2Ö\nŒÍ‹Ü Z<A²9<Éİ£ÑQ¾ğ³©p1ò2Ë˜Ò`#ÉÂf² ^À&2­s}}°š¬È)ÙÀÀè‘ñN!<\"ån ar“¿{¨¬F™­TÍƒ¯D˜©d&ï^qW\røışÀÆ¶í\"kû}µˆ.F`ÔL¸zmËkŠÎ™ÈÊØ¾]\"Ï2mÌù\"%”LMÛbB/RDi.¬aÈÌ±³#g¸cîTšãZøÎ0›Â‰§Øarª3‰$/j·´B4éLBĞä…],ÃÎ6Å¹sïcÛ¶mèhß\\åt8±……åÀæÍİşÊÊÃla!Jò›e‹Ë`íÆõè;{™¥(\"‰0<ÆÊä€T“?ç•×‹Zª\n‘<\nÕ]UG•©±Òm‰;6‰®íÛÑ¼b5C–ÎePá*W\'>Y¦““9)úE;ç¢.2Éx‰9™&§–İ\nÖÖ\ZŞ²åëü…Ÿ«ztÇ£ÏÈs‚¹çğ\nÖáóûğNïI”Ú¬¸qíCô9©º	k\ZvÑ¾…Ö\nw&wò*[öktŞÒŠ?	]Vˆabä=îV+šV2òˆøU`4b,¢›‚›-TÄ²§)[sšt6Í\"gx¶pr„h]»v«J¡uëÖ¹È‘¡éiEÈçH—D6EĞ`ªdaMxGO£÷Æ Ö·w¢ÊW®\n¨¬ˆ?~…ßÔ%ŠÏ|8dtW.çÚShiYÍ2¤Š1ÍuÍ3¿šS\">ß¨C™ºr*£òˆ˜&•JªmÍåt¥WÆã	™G\r6l0hğˆ&ÈıT$i›™™q,E£¦B7ÍOl°[*ŸyZ‹86!Îtè?ğáaCå^¸«\ZØ&±Œ`N”\ryä82É8²‹³ˆÏMb|l¬Ğá|nvf–MW2NÊV”YÉ³‚Vl#šÒgù¹²…¼ü£ ØUUTPÕd4êœè9×õy½§­Vëk¼„R\ZS©”5N;/]r}ç›»½mú·î{n•Ëæb¬€ù³ÈMZ0şÂÁw\Z^üõBvÇ]=;;×NÃ[¸p%Ÿ-šÁPĞóúb:“7\Zï¯\\¹òLggç¤İn×ÿ]Ü‹úUò„!Ü¥EfNJ;Pl$VW™ù«Íûš~¶â{-n‹Îx…­åÚ4Rcó>™ŒŒõë?¦//±3OŞZ´««KMLFB]‚o(Ô‹XG¤ bĞ¿JÀîD;è0ï]Õİôâšï¶¸lbøßBÀXÉñyœL…G.äÍáâÊôÓ÷Iİ+1Á˜+-©+o4.³]½Jã\'±t-†³\'S3—ò?Íâe/\rî?˜Rjüó°Âí0ìâĞ	Fæô¿„³x‹s\'õÂ\'øÃ÷jşz’\'&veİ\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0‹IDATxÚbüÿÿ?6À\"®\\¾r—‰•‰õÏ/fff–ß~3;zTéÇÏßÜ¼\\ììÜœ,l¬l;vì`Ğ5tgààe`˜ÔUÏ À\'ÈÀ6•¹ÁĞ1€A€ƒAJ\\”A\\L\nbÑÿ™2ÿ\n\n¤aƒa€\0bÄéªsçÎ–°±sä2şc`áäãşÉÁÊúOJJZ……«ûĞáıLll,¬¬@§²°f1Ş¹wïÿ½×2¦:¬3\'w\0-ddÈ/Èg`yûú\rƒ¤’\"ÃÕ÷<<¼j\ZZ\'Oú:MûÕ÷Û·Ù³³³µ]@8]…°üıû‡áÔÉÓïŸ¿z)0Ş<yyy~>>†K—/3èêêİ1ğãÇaaaÌ,@3||ÿ^@R^áåó~á¿şşcØ¿k#ƒ­\rÃçïß¾~ùÊpãê5.®oŒà‚œì,†Æi@µppÿòq†‡0œ:u’…‰™aåÊ•ŒQQQ\"ììì¯.œfx—Êà›˜4áÉÕÓsgNğë×wf6v`X®ÑšùšÌÿ~l\n2@9Õ¼2ÆñÏïy~fÌül»£™‰Ÿ¼”ƒ—r@J9iR.‹HyÉÿà°ã$”ÛÆE#Í¢„¬v ”·CfóÄ˜ıöx¶]äÄSŸãçû}>/ß»DğÏ\'s®áììü\n§’D‰D@(!\\ˆÔD5J	\'4S;X­Ö\n9‘ø‚NŸ_öüüˆÙ™ŒŒ¢PQ‹F¡(…\"ó…Ibìëş\r{eÈ“Ä@ã Bšœ+èJIPëjQm·K$°ö*\r:a4ä¡£½5j\"Ñ\Zë›`2[pt¸‡Í–m2›§•–—ÑÖ9\0£¥æÒZ´t\rcbbw—7èîîÅq0˜ıR(Š«ªª¿ùÕåf½Ø¾JÃø¼>°÷7|~¼Ãïß”Ò9pÆO‚09ZaÉ†!× {8AŠÊÈË!`,µUï‚ìv»S{»;dlr\náÛ+W–Cÿ–ÄÊÜbbp9“pR´ÚX`xÁ¾Óià]ü´ßö”>—ËÕüó`~A°¯{øA“ùKÒø€Öjéi\"ŠÂß”RJSËÃ:˜P\nh4ˆÄD,j‹.ˆ .\\P\\ÄşŸ.ÁÄÔbL€¬ÀÆ°Ğ€‘ HP ÈÃªIKÓB_¶Ó÷t®§cÂÂh\"‰ŞÉ™ÅÌ½÷Ü9ç{Ì¶±´İ¡ÀrIÊ`vvv~Íñ•µY­lõ³ƒµ9Ë|Ábö%f6›Ù§¥U604ÈnŞ¸ÅúŸö3j){;9Í\\nëêºÏ,–&ÖÕİÍ‚¡ĞVY¸T*…tZ$B,2ŠvêH’ó Rå ËŒ¬Ş¥i(‰Ğäç#‘E3Q)&\"—S{8Â’DÏ•Ôİ8ºFGF\Z­Öö)RV•œÉ¹îE,*ĞJ	±¸\0!,aîÃœœÜ·¹ç	òõàõzÂÜ;z—F±®É(mNI|?Bá ¨…¶ 0Ë¶:Ùi›´i$\Z¢ÓÆğ°÷1öÖ™Á×œGãÑ|ˆÄfú»—!òe)q*D”óıô4Z;qÆÊ\n7ÀétÂÔp¤vËÊ<Ï3CEPVúh»|JuY&…c€›¢„ä”¸Nd-Cb_\'\\ëp8¾á¤åt%;0>1¯k/l6´_hGkK‹,Àò-KËË+\\\\Ğ×ßë¥Û(¬®A\"AÊ‘¦I™Ÿ%ú’ÃJèÎ×ØU¾‡tL<U®—Œ(R¯ba•UFX,æ&…ÑhT©ÕjN \Z.-¯ ¹ù4ÆÇøÁë€İ¥$z Œ‚/£‹@\"²\0_0Œ<¥Š<$‰\r¿ŸÊÓåF’|D¤†/Úq¥£ãg·ÛÕ@ %×—Ş¹®¿Û©y3Y\nÛË1[Zm1VUku¥z9M(Ñ1“É4õ\'ÜËìå¸l„è¯Á†^²™«û½líËÚÉLC¯Ğü\r‰~\'\r¿†2´¹şâWWƒãÓşUà_2ù‡\0ÜWëoSeÿî´§—ÓËÊ¶nŒéØ\nİè²Šel01cÌ”K‚#øÅ$1Aÿ	10>øÉƒl3ñŒ1\'¹8Iœ@»¹±u+íF·uí9şŞS~0:>j“ÓÓ¦ïyŸ§Ïûü.Ïÿ„‹şÓdqÄ~ëûõÙb9À\n ´‰8„—%×L’¤Ky’.K²aµåéZ ?[’H‚…D\"›Í---ı4€Ü¡sÅé¨œ™NáêW091p8L;iÃ­_zÅ( ¸77!{€3]¨®©,Eóëoàşı~lnjÂèèè.6X²¤aAÇÆ¢ãÇáv_2„|0Ä¦¦(_Yºğ:ã¡U¼ôı2æ\Z76ĞßBcÃ$i[Š‹Ğ™ÈÍŞ^ñ=ò¸M´t~sv]MMè\'Ùj…?ß+m¥àvù÷3|†	33Óköœµ[ O²Ê²ùÛ\"µP;\rÒ¯VK9SË\ZÙòäİ?÷ŞDâá4³×DéÍ²Ø,VXè)²”«ÌõºI^¤o’é¡Ä @áÙÌÑa:lv&Ãuv‘HäÉ!•:ÛÕUY¿1¬([Éñ1¸<n\r!J,¤Ÿ*_Yª«‘JÎØHtªƒhêq²ó° ˜taåÎ ¨¨è	’ÅÛµë×5›bS„ıKÆ’(()@ë—\'PVQ‡Mõ½eµd(4WY.ƒ¥Ğ0ˆym\r¢›çw“6~ğn»öìÆ‹löö6iÏ7s‚(*V††û‘™ÓğˆšpşÂ9ø·áÙHšÜœÂCš–Ô-¨X6„o»»qµçK“BÕª5hÚºûö¾…AŒŒæ2—¤RŞFM -[æG  ·\'[Oâ•İï¢¼1/…F\'>ä%Í+ËP¼•¨z.‡×…©d‚Ä@*•Ä©Ó¸}¯/_4¨ªç½ÇHv²+´´Æé$ÊÊJÄã>K¹Ä¾»\'è	8üá™ªzba/oiBm]>_>3NŸêDåê ÇŠŒ°BÍæ!óe£iGhm7èq\r›ÕÏ[Ì\rÂ¥¿À¾€W&\rÄÓ,§\\fuím­˜ˆM±MÄ‚Ô®­ -5Ğ+¿$>üĞÓƒèİ;K\ZÑ$3§00s=cÂÁŒ¤|ª.À¯èp»İˆÔGĞ¸a=I…íL;‘eWi‹i¸Øª’@¾Y¢æææC\ZÕ]á,°cçNLOşÙy\rNj\Z‹å>–ˆK¾\\Éâ<ìü<ù$¦˜KiÆ½şÄÆ\'›|€‘áúñTMC¡PÃìì,Šƒ­Õn¶ä•6¨´,z2ƒw//·’39Auùü·¨Y³–ÿÆ™Eä#7œªÊóTiwlp_f7<xğDAaáŞa‚ª†Ê»zjß~Ñ±¶¾¶ªİj.LóL¦Äèµ.twŸ3í‰,s\Z’dXË,í†l•‘M“;Ş›‰Ç§ò¥*ZÀíúÑ#Û\Z>vm¿õè#œûäHrÈíé_^RRWRV.9]*7I±ÏÆ9á÷ûçşÍ°yzÀwBù-g|®ÃÚ]†q¦ÎĞZ*Œî’Â}bâˆr„ß¿İÖ·´´øşa2ù»ËÔ\Z´¹¬‡æ£Ü¼3lÌv_)øàë%ªÕRl—^53ŸıP5>ãæŸ?….)@ë\ZõBì}Õ8fÇ¡cO©·K	ğ‡\0íYkl“ç=Ÿãk|IlÇNâ\\\Z P.ÍÆ–Ğ•@ƒJÇ:V4\Zh«iÚ~lê¶j·Òiš¦ı´Mê´^øÑvU ¶M‹ÊehZm rc%HâÄ‰\'v|ÿ¼ó¼VÔ“6*mÓ,}ñ%Ÿ_?Ïó>—sÎû‰ã¢ÿzÔòş×0Ş.]R\rúÿhw8º Uš#G~‹İ_z‚-¹ ğgÏÅ§>M”§t¢D×8 x+1’`Ó	²L˜Jæg]]µz6˜	iÌd¸+‘S·hjÊ$ÓÀ3Üœ/7PW[{ÇP6¦’É×kjjö}Ì5²jæó…û4J@ó[‡ÃÆ©ö‹_ıİİ{qıú8Şíû+&&\'¤Õ¶âùç§Ó…ööv\Z\\‹‹„FííjñgŸı6öîíÆ8ÇŒ¤T7—;vìPÊ§Ü+#H>«\rÕ=N§û÷ïÇ¡C‡Ô=¢–îÜ¹“vØF7Ñ»ÙY–ĞU¡y]GïŸzN—3â¯”HT\'ihqµÙ¢üT†È£µµU-.?&ÌóµH´*´ü#`SŞÇ¢óêşZ:væÌ´®)~O$D¹/6_\\ãâÄçĞõâıŒ¼|VË5dıÖÖ5œ™fë7¯_¯§C7îì€D_`™Àh¾Úç,¯(±šˆ%Ì\Z’‰%\\¾8€D\"É)nC2—$ì°¡÷x/‚L8¼G‡G±uë#ğy¼ĞE™4¸İLM¡åÛØwÛç:™†ü¬Â«ü”lñUT\n5á÷·’c\"4…2FZˆ†€´È\\s)!¼\"•Z-†d2¹^T¡»RHÁ6^“©Ãf1¡… ‡uõ\rjwD”Õäi%FX`ñ½/P‰U„-B©ÆÇo CØ®ç…İiJÀ2\Zh*¿cg\ZJ\n0F\nÁ‰h¥®)Ş\'õà!Ô÷Uùi†Îš)QŠ‹A‹Ì#Aäİ@{‡wq•cwÕìöãÔ©Óy|•\ns!<Fm}£<u5ß‡Rœ…0re”Ö£ŠN”»İ°Úì*jz>Ë.BDdù|ÃÆ1C®x¸ç|•~”—;¡k¶â8;×\r*qM§±EU[«“Ó“˜¾9ƒâfòÍ¶¶¶\",®ğ~şcE,†\nO…ßÂ!r?óµ”¸¬ÀT\nÖ12šo¼vQNÂå©Åö|A²Àj5Âb1½ ºOé˜f*å³Ø-Œ]b±^VL®>@Q8ß5¬£—^}Na×ã_À÷ìFÿŸûaqÈYŒ	õËïÃªV#:7§CñbUMµó7o¾Yöä=ñ»àN´ù|~-2;‡¹XHäau’Æ0¥zzÑ ,Üşf²ïNdP…4“ ”Ó›h\\9©ç‚jfâ„Dà˜Š5[ğHÍr²ù1?~Ë››‘XŠãG!P@s}#šêêñòëo º¦¹BvCR¹4æægQ˜Ës\'Ëq|¸©i9~¿©¾‰Ë÷ŞåÀ»çúöìxì1’¶ÚXñF/»H¿ûm¤qìıÊ7°˜tÂêª c\'£›#Ÿ#Øv’/ÄÉÈQà1ĞVœqBbÿ_j7±óñ^´;·áwGc÷—»ú®t{‘¡¡ÒD:·?ŒPh\'ŸÂblä¸nŒµcG×ÖmJKmZŞHn&ô|ÿ¶w&ñgÚ6m‘XŒG‘L§q“¹7K`dhNoÉ2Ö\nŒÍ‹Ü Z<A²9<Éİ£ÑQ¾ğ³©p1ò2Ë˜Ò`#ÉÂf² ^À&2­s}}°š¬È)ÙÀÀè‘ñN!<\"ån ar“¿{¨¬F™­TÍƒ¯D˜©d&ï^qW\røışÀÆ¶í\"kû}µˆ.F`ÔL¸zmËkŠÎ™ÈÊØ¾]\"Ï2mÌù\"%”LMÛbB/RDi.¬aÈÌ±³#g¸cîTšãZøÎ0›Â‰§Øarª3‰$/j·´B4éLBĞä…],ÃÎ6Å¹sïcÛ¶mèhß\\åt8±……åÀæÍİşÊÊÃla!Jò›e‹Ë`íÆõè;{™¥(\"‰0<ÆÊä€T“?ç•×‹Zª\n‘<\nÕ]UG•©±Òm‰;6‰®íÛÑ¼b5C–ÎePá*W\'>Y¦““9)úE;ç¢.2Éx‰9™&§–İ\nÖÖ\ZŞ²åëü…Ÿ«ztÇ£ÏÈs‚¹çğ\nÖáóûğNïI”Ú¬¸qíCô9©º	k\ZvÑ¾…Ö\nw&wò*[öktŞÒŠ?	]Vˆabä=îV+šV2òˆøU`4b,¢›‚›-TÄ²§)[sšt6Í\"gx¶pr„h]»v«J¡uëÖ¹È‘¡éiEÈçH—D6EĞ`ªdaMxGO£÷Æ Ö·w¢ÊW®\n¨¬ˆ?~…ßÔ%ŠÏ|8dtW.çÚShiYÍ2¤Š1ÍuÍ3¿šS\">ß¨C™ºr*£òˆ˜&•JªmÍåt¥WÆã	™G\r6l0hğˆ&ÈıT$i›™™q,E£¦B7ÍOl°[*ŸyZ‹86!Îtè?ğáaCå^¸«\ZØ&±Œ`N”\ryä82É8²‹³ˆÏMb|l¬Ğá|nvf–MW2NÊV”YÉ³‚Vl#šÒgù¹²…¼ü£ ØUUTPÕd4êœè9×õy½§­Vëk¼„R\ZS©”5N;/]r}ç›»½mú·î{n•Ëæb¬€ù³ÈMZ0şÂÁw\Z^üõBvÇ]=;;×NÃ[¸p%Ÿ-šÁPĞóúb:“7\Zï¯\\¹òLggç¤İn×ÿ]Ü‹úUò„!Ü¥EfNJ;Pl$VW™ù«Íûš~¶â{-n‹Îx…­åÚ4Rcó>™ŒŒõë?¦//±3OŞZ´««KMLFB]‚o(Ô‹XG¤ bĞ¿JÀîD;è0ï]Õİôâšï¶¸lbøßBÀXÉñyœL…G.äÍáâÊôÓ÷Iİ+1Á˜+-©+o4.³]½Jã\'±t-†³\'S3—ò?Íâe/\rî?˜Rjüó°Âí0ìâĞ	Fæô¿„³x‹s\'õÂ\'øÃ÷jşz’\'&veİ\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(37,'sys','quickAccess_searchMembers.png','image/png',7460,'2013-12-14 18:15:36',7460,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0fiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c061 64.140949, 2010/12/07-10:57:01        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\" xmpMM:DocumentID=\"xmp.did:13B7B8F2910611E0805AC0C5CCB6C632\" xmpMM:InstanceID=\"xmp.iid:13B7B8F1910611E0805AC0C5CCB6C632\" xmp:CreatorTool=\"Adobe Photoshop CS5.1 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:6E5F0BFC0491E011AF35AEC708FB1C4A\" stRef:documentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>…Üu]\0\0TIDATxÚbüÿÿ?N°yóf†ø¤Ôÿ-­í&01F!­aÈ°ºÄõ?\'óõïÿşhşcûÏ’xqû’Ò\'Ó/ÙDùö2œ8zùHÂ6²õ®¨¸(ƒƒô­+ç*Í¢¼9¡ÿgÊüOšùîŸKx½ãÿûşÿ­/ş@Œx]ô?¯°ø²ØrO5F#FÉ¿îÇ¤9->}üÂ–øæ0‰á¹Ç…\'æü?¿3¼ÿ÷™©tó¿VzRÿÙyş*ÿúıö	ƒÀé?Œ‡ÓlşO18È ğÿøß¶OÛ˜E„ÿí:ğ €a–egg3üøñCSPPp·ºšš™™é=}C‡Â5ØÙÙ©¾zûşÖÆÆA%]†ßï_¼k³‘ª²¿¸¨ƒ  ?£¶}-BDx[ÿµò­`âäcx}oÛXkuÆŸßŸ<{Æpúå­¿ŞcûNÊgÅB+ƒq>%S¾~zËğ]ˆAXİ”ÿéïŒÛ•1üdûÃÀÊÅú——›ƒñàå¥±ó#¾·]Mcxë¥Çà•ÇÀô÷Ã›{—,/îg`É(cø¿u)Ãÿ»÷/]ûÃ°FShæÿi2ÿÅÌ:üDœ&;ƒlLiÜÀsæ±´”oÿK2şÿùıÂH÷?@\0á;,\0îé´´4 æºº:ßÄÅÄ¥¤$líì14€=mccÃğ÷ïß@ÌxëÎ}†«×oıåÉıÇjƒƒƒÓ»wïş.*õaÑ±`øÿïßße›W²rrşı§(\'Æ ,$0AHP PÁ¬„ì¹Çÿ“àcfxüê-Ã³ëg^ß½Ì ÀÄúßUËìß±3ç^¿~WpèÜU°\r`\rwïŞe0’çbú,aË°áµÃ\'_æ†ù‡Y¸Åä˜\",½¹Èğíó—Ëp?(ûOc”4ûû]Í•ÁFŸá+ÿÛ%ë>»~¢‡áË·o\\Ÿ™>}üô¬AÜmcisêßO2¼ÿÁÈğá\'0]3³ó°¼}pâØŸYşşçşúÍÄfæ·nøòõ—$›ğç}V&ÂÜB\\L¬ÿş2¤qşa½öò&C¾¾ƒáËÿ\rª<¼ML5FÜ_¿üb°Õbxñäƒ÷?ÖÿÎ)æZ{÷CVùln>nFQ~^¡OŸ°ğ±ıü·\'$˜édÃ[†ÅÎÇ.ßºşÿÈC~Æ–wo~ÉÈÿÿ·ĞŸş±%ƒ%0Qùş?bÆò^Èke,¯I©0r$-Ï®}_”şÿvâŸÿ>.ÿÛ„…æ\0 ¬ZCÛ*Ãğó“ËéINÒ&f½$âÖ%M¨„â6dëœ(N­nèİ-‚?JµÅ	**”ùc^/XÄ‰âÕ9ÚNç*s5N,ZïÊì\\Ú¥kÚ$Í’¬éÉ¹}Ÿ_”ŠHı±÷ç÷ã}Ÿ÷}.ßŠz©Êd™ÔŞŞ^$\'I?<t—Zä¿}}}!äm.«»ªò’e™x…Õ××‹Ñh¢Íæ\r55–Â-ÑKĞÓÓƒ±±1Åï÷—(¥¸óúVìºiœvÔ&ñævº45ÑiÚÜG¾NOÒB©Ìe©ÀëqAv¹¡©KB¹¬Ò[ïø§§ğï£££¤8Ÿvg²9ˆ–Š\rÍuÈÌ¦ŸŸƒÅ£PgÓÜÁg=<|ÿ©ñ3Z6W¢†n2njhæ«õª€ÿä±’ÿ=Q44ÍèŞ³#úªKñ‰%S‚ û 	‚nfÙéâG7?ôfgúÄë‹b]°†;M€ºˆùäiNœ@41§“ÓçÙ÷)%+İ­}Sû;]}]¶à5hKl‚@0•¦(ØLéì‡âÕÒ¹†*?”~IU‘-Íå‘FÁr¹jŠ3çÎûŸ~müo¯-Wàº6ÆÉ¯â·C¯ƒS¤˜ÌÂtÔZ¢Û‘6 ek—çt~„˜¿ã¡DQæ~dL@²’eYâ)cí®õy«à™ÍÛÑĞÓ­{÷ö|wtŒŠò·÷!Ü\ZF$äGY§0\rQÑ-ÑN’EWFü35©Ë]Ãƒ“51 ˆv§\r«]¬J)‰|¥òY¡Âğ¶­ì¯u¿[¤ßœQĞà%Ä/©M?‰-]#tYª\'ìŒ£TÁDºÉ7Êÿ:r€:e;quì&s©ßÑvq®Š\n,\\\0Ëä°˜šÅûÉ”Ó&İ7nÙ ¡/5ìŸ»kû»ğÅ©õØÿÆÇh`?\"²¦	¾@D®·\\&ƒD¶­ÃŒ6†È\'e‹lÇ°ö×çš#Õx4é:ˆaÀÅ}³ihäeğª{â™Í]¡àø÷øü=OlMRI‘‰CaZÎÊY}4ıÀ‹î¸v½0Ïœ[šCj ÖFW7Ç=Ï³S7ª[–.ò-ò <³3³”ìb;ï]õóìÄBihÜ\n¾uûq]æD9PfSt°•>†åz~Çâá!ë¥¶ü¡V\ZëìöuŠi*Ébñ·Wr~xJ–ÈŸ^­±MgøùÎ9ö‰ï·8‰ƒq.DN£: .[’ÑÖ¤¢ní´©R[èÖ\"!M½H¤R»¡‰‰q	Zû§¨j§\nªmĞŠ²JL¶4Ú¬U¡…”\0	‰Çö±Ï9¶Ï××Ùúƒ•Mëz$Ë?ı½ß{y.ï7ÖµoÍEMß²6›SÓãóaÿ¾}Â›Gš›{{¿]€\r6PŸò¨¯¯/‹îs²ÕúpMMMI–å?Ô.ZôÒÚïw²T:Íc±¥ÿs€Û¸hxxp8Üjµ>Æ\ZDM&çıIâñøì«Y%û2¸\rÉ{÷î®\\¹ÒOŒH$\"2ÉÊJt&¦fÌ¡¡³nïÿ/QOOOÙ¹Í9r$`­°‡Ÿî»2T¦iÂ¼•›ºÊ\n·®±ÃÃÃL%^tUÛ‘L¥áõ¸áv8‡Ğ@â%\"ÁôôtĞ,BKÈTVGÈ²hq¢(T€Û<ÜÒ¶JFßi–87“\\çµÕAîu»¦\\.G¸dÒè?»îÎ%\Z!î)j>»T‘ÓtV(¡ÌNÂéÕ!ûkX‰&z÷k„–Èö\r“&MâŸ‹Pà\"c5¤“‰<Óôü,\n×\'§_íë½k«Ïã³šÊ$I ÌfÁnÅTm­YxkM.¶»§¼^?øì,niiÖÒÔA’ŒóŸ\\rz«VĞ;âà¾Î¿¿«•«EÆò¢Ôø,y^í°ë­‹Âşµvohããó&ı]¤sRW?ÇÅ/.a4Ç’h#ÆÇÆÙS;O|=ƒòÓ÷óï²Á‘¹Uã¥ğP´ír|V’‹ë+ğTVÆïkƒ:ãÔ%)*É8(SèDp*•†|xºŸğô$úvŸ¤üÛóÉØ\\pë¶_L	leçr,‹U¡¥ÙwÀs×Â™Ç~Üşğ±áŠüê‚š5f:›ƒ¦‘÷#ı€MÄKû~Û¨ô>ÿz€îîõC¬¶»ªó‡+¨|&ñ?#ááÈæMT×U%Ç=™¥\ròõæEg:<Ir™L+˜ÈÍq9Ö¥Ñét\'Ï\\½½DÛ^Ss¡Õºzi±F¿`Ô\\Hö¤AzâZP),Á©w¡ÖM#lĞhÚ®ÇoµS&*›˜T±ãw¿½¾xƒ§gfLn½¦ENÌ§éæy\Ze °\"Yòëù¼Ëï–gæõ\nL+%¦¦nrƒ|?7é½C¦„9Ï¨¹U·°¯¦hh\rü£´¤)LC!3³T@À„ü´VyáqVÀëóÂe¥\rÊ+[ü–‚Ïë÷Íj‚ë HP1\nyƒÓß\\ÑÂõeX*Ä÷®nÿ\'’ë×¼P³ımlà#ÎÜ¡»YŠ€UŸ!à° ±ÚˆO rNœ€C–Ö|ÂØäwo‰6Æ¬MU>Vï±âŞÈr2jõâ#!×ÛBâÖ´‹ôü/÷|Â5aÅ¯	ˆ#ãS\"ëqi>€á‡`§Û¨€NúvQöv~‡µ,¹şíXíúeÍ–w#Ü¾	kİ‡Í­ŒË2Q7Gë+‰¹Ë3…B\rÁ||!Ñso ‹M£­)„SoF‰jK@†ƒ·ˆdãçæ?÷\'<PTJ|WsŒu?ôšâ—ÁÈ˜ıµŒ(JüQ¨*º1¼ˆK‘ˆ\'x3¡}ğ\0?pŸ)Ïàøş—1VCjrB‹ëŒ­¡gqa<º±Qø—úiRpÀ®~év\ZñO°@€£+Û®Çø‰PÌ©îUçğ=ıÂ:z­g€.wB¸ûI\\_üN¥ºxKÄkM?ˆ““ÑëÊø™^AS<&¿êyæ¯À|\nL¡¬œ3U§€:_ğıRzê`ûöMŸŞ@½\ní4-L—vò‘®Ÿr›Bv›&–Ğ]|§ôÎ¦ã¯ô&?¥\Z¸ş?om‹şLPÉOß¸…&‚Í)\0Ò £ğr°‚ofóïoäŞÌÔ÷F±ûe÷ı+ÿ1yÒ‚‘ÿ`ÇçÿI©Î¿öXc‹×Nîê©s¹!—ˆÌUµDû+&æÄñI¼ŸÉzØ¡çéîuè:|0»½oİ»/ÚÈJÛ$ƒ–ÎÇ^_oş79Ükf+v^¶ØtcE­À–Ì*ÙÌ`\"ùŞ@&ûMU_\nPœµ\0GUáÿÜÇŞÇ¾³Ù<6ÉB	$y¤hEÅàµvÆi‹Se:Úê¤Ø‡Sµãû92V;X±”Åªƒ  AAP	I–G²ÙÍîf÷îãîŞ{Oÿ³øœ©™NugîœÙ»÷ï?ÿÿßwÎÿ¬{Ö¬YCàü|ëËW­ZÅ$0Ë†#‚TPÂƒƒœˆš),{ûm·B ²\Z*ÊÊ`ó–-DEàQx±ËÌš=û‡0yòdd‡$ƒşy;6<ãµŸõ`M¸\\è3İğz°5ºİ9»]}Ãf“E¡“!(zĞ#ÂÔiç|\0.¿ür6A‚B‰â$§£@İ‰D8oYEçHyvR|\n5É¡EA5‡ÃòûıàGçâö^çï(äunÙò+­ï\rÀÌ™3¡½½êêê ££cggg*>Ëårq‡¨ª¦×•@M	³¸<N©Ù$&˜‰ãËsŸ–§Ó‘	 ­®\0¾ÓÎ?›¼¾í qØ%¢*6e$›¢M€Cİ=°ìªe´÷ğa«W•yÂÙ—Ş÷İ…õ—?Ó¦M#ë×¯§š¦›››\'\r\r!XÊÅGSÄ%øåe`mà*‚ê+¤Y°êC’ <G-ƒ˜ù©úÈ‰\'%WéÊa–MÑ¾!?.Ú¹ø¬)XNA¼Ù,NÃL´Mmî‰D÷e²¹÷-ÃLZ(“©¶…ôê¦hTaì—ôô·Ø¾};³ €\ZÂ†Q³ÙlÑ-§uZkK€eNõ[66f*\nji\0D‡›m¢®°ØïÅü¢‚Ò¶aßÇ:øö\n‘—ş\ZfÀa—Mec?úi\Z°	¢ÔF–Špe7çÄp¸Cİ¥*r?^dİíóéİ÷oûn)4~üøâ˜nnü==Ÿ8mVİê‹ÏÂ÷QÂÔğ˜òPeÉè³\0½ vWE°»—Z#.	y.æŸttÃ:§EÄ¢ÈMA\rdúÜv44‰ŞåP°{ùÀÏt‘Ã()+şŠŠ2£ïÄiñ¹\rW:œö—k*ËP¹ƒuËß\r\0+ÖdÆÀæ\ZüNñ£sB™Ïª¢rª,QE–‰Œ\0$|™àyÌ 3f‰y£`pùœ¶Ç7îœÁ1ÕÄĞl<´Qô–(Ú>¬}ìO@Mú\"ƒp¬¿rÔ¸é$hù,u90¾±R‰Qº£óİÂóÕ+ÉoşôÖç¦ÿ:\0±Xâñ8d´Q8¿9ßıa÷=1İ–­ìBÈôø¨ÀiJ\r@i=^\r`ú\Z@÷Ô‚¦TÀ©œ\nŸf`àô0‰D£ÿ¼è–ß½vÙ\r«anY¢ÅV^ÿ0ïğRN\'¡Fà(ä2 àåSœàs ÏÁä\n§Äb9‹}ÁãusŠ\"¦Íh~©ªº‚Lç\0æ¾±¾üy¯{Øòz½uÕc–4Î¿€8K‚¤gP†„\Z,ö~¯OBMÏ7r²i\nQ1_–Lœ¢›5eæê§zòŠÒÒÒßÇu2Ñ!*¥5]@klƒÄÀša63›×Qôã…’­\\ö€fêd4™âT»BD›8ów?ªLnªÍ«¯ıö\"ş\"Çn½Şm+—/[z¯/Ğ¨öëcà¬àD˜ÓB@BW\"¢å	-îR±|T\\JËe0A1bIx×qÓªš$kg·=ºuóß¢µ“¤\ZeøıJŠ_ÀnS ç ƒª-*õ|¿ZRƒl&K§œİÀÎm>OÓ¯Ğğ(GV$@ãÇ/Y|ÉO3R-±¼?‚¦Z\'Œª0ÇT6›8ÄÁº\'œ™19Ù·ˆ™MRQÅ‘á”—Ú‚/.İşï7hj $¸U±x?`0\0xs6—Á&A8†¨¡o—Áa˜V*•Â6[è_Ìâä9ƒ-Ù7qËu/µOšŞtwe)!G_}˜Îjm ÙÀb¨›4t4<¤€Â¹È¾PÃF	YØ²yÁ( “Yf–Å¸a‘âËò©¤«ÉuÑd¼¾áqZå(°ç\0-&a dYHdr*FYŞ&ğ†,¡°‘.LÏél¶’$ĞµëŞüêşJÍUÿ*öÏ·Ÿ·®Ÿ®ùõ•wÊ%`ß~Tı¼U4S~	^*Jp—øPÿ8°óğ8Q@_fÀà K%ôù:èØ,Î¦ ûˆ4WîwP®ªÜ©å‰hJ²\n›3\nõ\r…†áTx˜FF¢‹F ’€‰Ì®(Íó3§D‹å—\Z£Â´T¬@jÒ^êx–ÀÓ‹Îû\"…üK;ù/gÂÜ-/^²|ŞÕÛÜÆËoZØİõU…x¿ùL²©ºÀ 80_L¿a*@<rÑœEJbDmA*y‹îci…²B ²Hh!`	\\¤RµÙ{²RFçEµ	2gî=İÅéè}u|¨€&Ü•ç Äã\"3|M|ê¦Y-µéPè|<Û/$×:Z¹ĞH4E^½x&RŸ¦PíÓ×Í½aÑ7¯\Z/¾n	1tõ¥èƒí6ÙS»Aé[\'ÖCZÔÖ)\rH±l×ŠÌ,òŒE)Ë}`\'Zšíi+ğ™Çd@’hÑøìˆiîâ{·½	?i¨6r–Å¿œÈ¿~Œ\"µRYcı Ñ¦‚E²:¥¨‡H6C¸LÎĞ£Â¶½›çÚÄx²Ë\'£àb/‘æÜşØWO†Â<İ}8¬\"«²Ât;¼ÈIô~(!	èëïgiUqGAú´°Ñ†÷Š\\qŸ¯(³m<[)dr-N­Bvpù½»èÒ\Z?Q=N²34DjÎ½\0~|Õ*2fî\nhZ|4)*ÔàÄeôï„ù$R”Ã°Pp4Hƒª€+¥­Üs:|2™HîÇWê<ª+DØØi‘´NÀ‹Qlşày¸¾t3T\\³bsffµÀş>€#ß‡dè0¸Jüà\rÔâ5œnxìBQ%SØ\nsØæÓ100\Z„ğáOèJGšTWÖWèy’Æºj¬v`ğ²	¿¿…[Šİ¡s€íGa LÃà\Zæ{œm­¬ÚŒ\0–]]å”	h&•#³¼@Õøişc ªct+äùÈa	ÄMG sé#Â(ñ#@»ƒº·Tô¸•ÛŠk†Í2šƒ4ekåº‡\'™×Úö·U\0¶IôvlÛŒÚm\nqˆnLL½w_\Z=ù&5\nìà¸<‚ÀÇ±ÿàÈ®âiGNçH¡`UP]ûï`ñÔÍo¿öÖœª·O­º·ö\rh}¦$Ëp´ ?F_ví…åíôØüÇ@ĞQ¸a±ñÊ»Z¨‰Á ·ÎßxÎ1¸k“ûzõp>ÖûŒ¡w?xü•Õ1×Š¥¶¿|tò•ã\nª*¡r¤Lğp¢¥=ğ!Ğ#](+e­˜‚£NÙ±L(îq\00Wˆ™a¥3ìğˆ¸ñw¯aÌÛyÓWÔ_3å¶É X%\0İ½\0}CHÀ\n<Á¯…ƒg]‚¢áÔpV‹89©%¬¼ÖgäF`—Ú±·ÙñÀŠ[ÖŞÆ-yš°“²ï¿Ø°‰m/bßï[rÑ²z•¿+PY×$Ç1º¶5å ÆÆÔ!g\0 æó#N)‚ EYÒËÔÒÜÑX‚ôjé°`¨ü˜’:Á©Çw÷œ†Lÿ(ìÙ–>|Àüm´~v!´ë[v·½Ö(»€óMh—/ğ•cŸã7›ÿíöÿãÜŸ¯şûŸ/»\Z_â‡òÊ±µ~E>ß/‰óË%©ÕFHĞ#pv	ó]dÅ‹ tÍä ¬¥O‡´Ì£™ì3ï _!uøĞë&x]Üvl±kW¤\0›¼˜mwş·C8ÜöÖv¸^q°°¡œ\'…wFÓà@y¦¼ØL”qŒş(‚xû~©,\n¬ôŠDÍG•ğqËU\ZBœ›\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0fiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c061 64.140949, 2010/12/07-10:57:01        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\" xmpMM:DocumentID=\"xmp.did:13B7B8F2910611E0805AC0C5CCB6C632\" xmpMM:InstanceID=\"xmp.iid:13B7B8F1910611E0805AC0C5CCB6C632\" xmp:CreatorTool=\"Adobe Photoshop CS5.1 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:6E5F0BFC0491E011AF35AEC708FB1C4A\" stRef:documentID=\"xmp.did:ED5C82979246E011876FC40818535BD5\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>…Üu]\0\0TIDATxÚbüÿÿ?N°yóf†ø¤Ôÿ-­í&01F!­aÈ°ºÄõ?\'óõïÿşhşcûÏ’xqû’Ò\'Ó/ÙDùö2œ8zùHÂ6²õ®¨¸(ƒƒô­+ç*Í¢¼9¡ÿgÊüOšùîŸKx½ãÿûşÿ­/ş@Œx]ô?¯°ø²ØrO5F#FÉ¿îÇ¤9->}üÂ–øæ0‰á¹Ç…\'æü?¿3¼ÿ÷™©tó¿VzRÿÙyş*ÿúıö	ƒÀé?Œ‡ÓlşO18È ğÿøß¶OÛ˜E„ÿí:ğ €a–egg3üøñCSPPp·ºšš™™é=}C‡Â5ØÙÙ©¾zûşÖÆÆA%]†ßï_¼k³‘ª²¿¸¨ƒ  ?£¶}-BDx[ÿµò­`âäcx}oÛXkuÆŸßŸ<{Æpúå­¿ŞcûNÊgÅB+ƒq>%S¾~zËğ]ˆAXİ”ÿéïŒÛ•1üdûÃÀÊÅú——›ƒñàå¥±ó#¾·]Mcxë¥Çà•ÇÀô÷Ã›{—,/îg`É(cø¿u)Ãÿ»÷/]ûÃ°FShæÿi2ÿÅÌ:üDœ&;ƒlLiÜÀsæ±´”oÿK2şÿùıÂH÷?@\0á;,\0îé´´4 æºº:ßÄÅÄ¥¤$líì14€=mccÃğ÷ïß@ÌxëÎ}†«×oıåÉıÇjƒƒƒÓ»wïş.*õaÑ±`øÿïßße›W²rrşı§(\'Æ ,$0AHP PÁ¬„ì¹Çÿ“àcfxüê-Ã³ëg^ß½Ì ÀÄúßUËìß±3ç^¿~WpèÜU°\r`\rwïŞe0’çbú,aË°áµÃ\'_æ†ù‡Y¸Åä˜\",½¹Èğíó—Ëp?(ûOc”4ûû]Í•ÁFŸá+ÿÛ%ë>»~¢‡áË·o\\Ÿ™>}üô¬AÜmcisêßO2¼ÿÁÈğá\'0]3³ó°¼}pâØŸYşşçşúÍÄfæ·nøòõ—$›ğç}V&ÂÜB\\L¬ÿş2¤qşa½öò&C¾¾ƒáËÿ\rª<¼ML5FÜ_¿üb°Õbxñäƒ÷?ÖÿÎ)æZ{÷CVùln>nFQ~^¡OŸ°ğ±ıü·\'$˜édÃ[†ÅÎÇ.ßºşÿÈC~Æ–wo~ÉÈÿÿ·ĞŸş±%ƒ%0Qùş?bÆò^Èke,¯I©0r$-Ï®}_”şÿvâŸÿ>.ÿÛ„…æ\0 ¬ZCÛ*Ãğó“ËéINÒ&f½$âÖ%M¨„â6dëœ(N­nèİ-‚?JµÅ	**”ùc^/XÄ‰âÕ9ÚNç*s5N,ZïÊì\\Ú¥kÚ$Í’¬éÉ¹}Ÿ_”ŠHı±÷ç÷ã}Ÿ÷}.ßŠz©Êd™ÔŞŞ^$\'I?<t—Zä¿}}}!äm.«»ªò’e™x…Õ××‹Ñh¢Íæ\r55–Â-ÑKĞÓÓƒ±±1Åï÷—(¥¸óúVìºiœvÔ&ñævº45ÑiÚÜG¾NOÒB©Ìe©ÀëqAv¹¡©KB¹¬Ò[ïø§§ğï£££¤8Ÿvg²9ˆ–Š\rÍuÈÌ¦ŸŸƒÅ£PgÓÜÁg=<|ÿ©ñ3Z6W¢†n2njhæ«õª€ÿä±’ÿ=Q44ÍèŞ³#úªKñ‰%S‚ û 	‚nfÙéâG7?ôfgúÄë‹b]°†;M€ºˆùäiNœ@41§“ÓçÙ÷)%+İ­}Sû;]}]¶à5hKl‚@0•¦(ØLéì‡âÕÒ¹†*?”~IU‘-Íå‘FÁr¹jŠ3çÎûŸ~müo¯-Wàº6ÆÉ¯â·C¯ƒS¤˜ÌÂtÔZ¢Û‘6 ek—çt~„˜¿ã¡DQæ~dL@²’eYâ)cí®õy«à™ÍÛÑĞÓ­{÷ö|wtŒŠò·÷!Ü\ZF$äGY§0\rQÑ-ÑN’EWFü35©Ë]Ãƒ“51 ˆv§\r«]¬J)‰|¥òY¡Âğ¶­ì¯u¿[¤ßœQĞà%Ä/©M?‰-]#tYª\'ìŒ£TÁDºÉ7Êÿ:r€:e;quì&s©ßÑvq®Š\n,\\\0Ëä°˜šÅûÉ”Ó&İ7nÙ ¡/5ìŸ»kû»ğÅ©õØÿÆÇh`?\"²¦	¾@D®·\\&ƒD¶­ÃŒ6†È\'e‹lÇ°ö×çš#Õx4é:ˆaÀÅ}³ihäeğª{â™Í]¡àø÷øü=OlMRI‘‰CaZÎÊY}4ıÀ‹î¸v½0Ïœ[šCj ÖFW7Ç=Ï³S7ª[–.ò-ò <³3³”ìb;ï]õóìÄBihÜ\n¾uûq]æD9PfSt°•>†åz~Çâá!ë¥¶ü¡V\ZëìöuŠi*Ébñ·Wr~xJ–ÈŸ^­±MgøùÎ9ö‰ï·8‰ƒq.DN£: .[’ÑÖ¤¢ní´©R[èÖ\"!M½H¤R»¡‰‰q	Zû§¨j§\nªmĞŠ²JL¶4Ú¬U¡…”\0	‰Çö±Ï9¶Ï××Ùúƒ•Mëz$Ë?ı½ß{y.ï7ÖµoÍEMß²6›SÓãóaÿ¾}Â›Gš›{{¿]€\r6PŸò¨¯¯/‹îs²ÕúpMMMI–å?Ô.ZôÒÚïw²T:Íc±¥ÿs€Û¸hxxp8Üjµ>Æ\ZDM&çıIâñøì«Y%û2¸\rÉ{÷î®\\¹ÒOŒH$\"2ÉÊJt&¦fÌ¡¡³nïÿ/QOOOÙ¹Í9r$`­°‡Ÿî»2T¦iÂ¼•›ºÊ\n·®±ÃÃÃL%^tUÛ‘L¥áõ¸áv8‡Ğ@â%\"ÁôôtĞ,BKÈTVGÈ²hq¢(T€Û<ÜÒ¶JFßi–87“\\çµÕAîu»¦\\.G¸dÒè?»îÎ%\Z!î)j>»T‘ÓtV(¡ÌNÂéÕ!ûkX‰&z÷k„–Èö\r“&MâŸ‹Pà\"c5¤“‰<Óôü,\n×\'§_íë½k«Ïã³šÊ$I ÌfÁnÅTm­YxkM.¶»§¼^?øì,niiÖÒÔA’ŒóŸ\\rz«VĞ;âà¾Î¿¿«•«EÆò¢Ôø,y^í°ë­‹Âşµvohããó&ı]¤sRW?ÇÅ/.a4Ç’h#ÆÇÆÙS;O|=ƒòÓ÷óï²Á‘¹Uã¥ğP´ír|V’‹ë+ğTVÆïkƒ:ãÔ%)*É8(SèDp*•†|xºŸğô$úvŸ¤üÛóÉØ\\pë¶_L	leçr,‹U¡¥ÙwÀs×Â™Ç~Üşğ±áŠüê‚š5f:›ƒ¦‘÷#ı€MÄKû~Û¨ô>ÿz€îîõC¬¶»ªó‡+¨|&ñ?#ááÈæMT×U%Ç=™¥\ròõæEg:<Ir™L+˜ÈÍq9Ö¥Ñét\'Ï\\½½DÛ^Ss¡Õºzi±F¿`Ô\\Hö¤AzâZP),Á©w¡ÖM#lĞhÚ®ÇoµS&*›˜T±ãw¿½¾xƒ§gfLn½¦ENÌ§éæy\Ze °\"Yòëù¼Ëï–gæõ\nL+%¦¦nrƒ|?7é½C¦„9Ï¨¹U·°¯¦hh\rü£´¤)LC!3³T@À„ü´VyáqVÀëóÂe¥\rÊ+[ü–‚Ïë÷Íj‚ë HP1\nyƒÓß\\ÑÂõeX*Ä÷®nÿ\'’ë×¼P³ımlà#ÎÜ¡»YŠ€UŸ!à° ±ÚˆO rNœ€C–Ö|ÂØäwo‰6Æ¬MU>Vï±âŞÈr2jõâ#!×ÛBâÖ´‹ôü/÷|Â5aÅ¯	ˆ#ãS\"ëqi>€á‡`§Û¨€NúvQöv~‡µ,¹şíXíúeÍ–w#Ü¾	kİ‡Í­ŒË2Q7Gë+‰¹Ë3…B\rÁ||!Ñso ‹M£­)„SoF‰jK@†ƒ·ˆdãçæ?÷\'<PTJ|WsŒu?ôšâ—ÁÈ˜ıµŒ(JüQ¨*º1¼ˆK‘ˆ\'x3¡}ğ\0?pŸ)Ïàøş—1VCjrB‹ëŒ­¡gqa<º±Qø—úiRpÀ®~év\ZñO°@€£+Û®Çø‰PÌ©îUçğ=ıÂ:z­g€.wB¸ûI\\_üN¥ºxKÄkM?ˆ““ÑëÊø™^AS<&¿êyæ¯À|\nL¡¬œ3U§€:_ğıRzê`ûöMŸŞ@½\ní4-L—vò‘®Ÿr›Bv›&–Ğ]|§ôÎ¦ã¯ô&?¥\Z¸ş?om‹şLPÉOß¸…&‚Í)\0Ò £ğr°‚ofóïoäŞÌÔ÷F±ûe÷ı+ÿ1yÒ‚‘ÿ`ÇçÿI©Î¿öXc‹×Nîê©s¹!—ˆÌUµDû+&æÄñI¼ŸÉzØ¡çéîuè:|0»½oİ»/ÚÈJÛ$ƒ–ÎÇ^_oş79Ükf+v^¶ØtcE­À–Ì*ÙÌ`\"ùŞ@&ûMU_\nPœµ\0GUáÿÜÇŞÇ¾³Ù<6ÉB	$y¤hEÅàµvÆi‹Se:Úê¤Ø‡Sµãû92V;X±”Åªƒ  AAP	I–G²ÙÍîf÷îãîŞ{Oÿ³øœ©™NugîœÙ»÷ï?ÿÿßwÎÿ¬{Ö¬YCàü|ëËW­ZÅ$0Ë†#‚TPÂƒƒœˆš),{ûm·B ²\Z*ÊÊ`ó–-DEàQx±ËÌš=û‡0yòdd‡$ƒşy;6<ãµŸõ`M¸\\è3İğz°5ºİ9»]}Ãf“E¡“!(zĞ#ÂÔiç|\0.¿ür6A‚B‰â$§£@İ‰D8oYEçHyvR|\n5É¡EA5‡ÃòûıàGçâö^çï(äunÙò+­ï\rÀÌ™3¡½½êêê ££cggg*>Ëårq‡¨ª¦×•@M	³¸<N©Ù$&˜‰ãËsŸ–§Ó‘	 ­®\0¾ÓÎ?›¼¾í qØ%¢*6e$›¢M€Cİ=°ìªe´÷ğa«W•yÂÙ—Ş÷İ…õ—?Ó¦M#ë×¯§š¦›››\'\r\r!XÊÅGSÄ%øåe`mà*‚ê+¤Y°êC’ <G-ƒ˜ù©úÈ‰\'%WéÊa–MÑ¾!?.Ú¹ø¬)XNA¼Ù,NÃL´Mmî‰D÷e²¹÷-ÃLZ(“©¶…ôê¦hTaì—ôô·Ø¾};³ €\ZÂ†Q³ÙlÑ-§uZkK€eNõ[66f*\nji\0D‡›m¢®°ØïÅü¢‚Ò¶aßÇ:øö\n‘—ş\ZfÀa—Mec?úi\Z°	¢ÔF–Špe7çÄp¸Cİ¥*r?^dİíóéİ÷oûn)4~üøâ˜nnü==Ÿ8mVİê‹ÏÂ÷QÂÔğ˜òPeÉè³\0½ vWE°»—Z#.	y.æŸttÃ:§EÄ¢ÈMA\rdúÜv44‰ŞåP°{ùÀÏt‘Ã()+şŠŠ2£ïÄiñ¹\rW:œö—k*ËP¹ƒuËß\r\0+ÖdÆÀæ\ZüNñ£sB™Ïª¢rª,QE–‰Œ\0$|™àyÌ 3f‰y£`pùœ¶Ç7îœÁ1ÕÄĞl<´Qô–(Ú>¬}ìO@Mú\"ƒp¬¿rÔ¸é$hù,u90¾±R‰Qº£óİÂóÕ+ÉoşôÖç¦ÿ:\0±Xâñ8d´Q8¿9ßıa÷=1İ–­ìBÈôø¨ÀiJ\r@i=^\r`ú\Z@÷Ô‚¦TÀ©œ\nŸf`àô0‰D£ÿ¼è–ß½vÙ\r«anY¢ÅV^ÿ0ïğRN\'¡Fà(ä2 àåSœàs ÏÁä\n§Äb9‹}ÁãusŠ\"¦Íh~©ªº‚Lç\0æ¾±¾üy¯{Øòz½uÕc–4Î¿€8K‚¤gP†„\Z,ö~¯OBMÏ7r²i\nQ1_–Lœ¢›5eæê§zòŠÒÒÒßÇu2Ñ!*¥5]@klƒÄÀša63›×Qôã…’­\\ö€fêd4™âT»BD›8ów?ªLnªÍ«¯ıö\"ş\"Çn½Şm+—/[z¯/Ğ¨öëcà¬àD˜ÓB@BW\"¢å	-îR±|T\\JËe0A1bIx×qÓªš$kg·=ºuóß¢µ“¤\ZeøıJŠ_ÀnS ç ƒª-*õ|¿ZRƒl&K§œİÀÎm>OÓ¯Ğğ(GV$@ãÇ/Y|ÉO3R-±¼?‚¦Z\'Œª0ÇT6›8ÄÁº\'œ™19Ù·ˆ™MRQÅ‘á”—Ú‚/.İşï7hj $¸U±x?`0\0xs6—Á&A8†¨¡o—Áa˜V*•Â6[è_Ìâä9ƒ-Ù7qËu/µOšŞtwe)!G_}˜Îjm ÙÀb¨›4t4<¤€Â¹È¾PÃF	YØ²yÁ( “Yf–Å¸a‘âËò©¤«ÉuÑd¼¾áqZå(°ç\0-&a dYHdr*FYŞ&ğ†,¡°‘.LÏél¶’$ĞµëŞüêşJÍUÿ*öÏ·Ÿ·®Ÿ®ùõ•wÊ%`ß~Tı¼U4S~	^*Jp—øPÿ8°óğ8Q@_fÀà K%ôù:èØ,Î¦ ûˆ4WîwP®ªÜ©å‰hJ²\n›3\nõ\r…†áTx˜FF¢‹F ’€‰Ì®(Íó3§D‹å—\Z£Â´T¬@jÒ^êx–ÀÓ‹Îû\"…üK;ù/gÂÜ-/^²|ŞÕÛÜÆËoZØİõU…x¿ùL²©ºÀ 80_L¿a*@<rÑœEJbDmA*y‹îci…²B ²Hh!`	\\¤RµÙ{²RFçEµ	2gî=İÅéè}u|¨€&Ü•ç Äã\"3|M|ê¦Y-µéPè|<Û/$×:Z¹ĞH4E^½x&RŸ¦PíÓ×Í½aÑ7¯\Z/¾n	1tõ¥èƒí6ÙS»Aé[\'ÖCZÔÖ)\rH±l×ŠÌ,òŒE)Ë}`\'Zšíi+ğ™Çd@’hÑøìˆiîâ{·½	?i¨6r–Å¿œÈ¿~Œ\"µRYcı Ñ¦‚E²:¥¨‡H6C¸LÎĞ£Â¶½›çÚÄx²Ë\'£àb/‘æÜşØWO†Â<İ}8¬\"«²Ât;¼ÈIô~(!	èëïgiUqGAú´°Ñ†÷Š\\qŸ¯(³m<[)dr-N­Bvpù½»èÒ\Z?Q=N²34DjÎ½\0~|Õ*2fî\nhZ|4)*ÔàÄeôï„ù$R”Ã°Pp4Hƒª€+¥­Üs:|2™HîÇWê<ª+DØØi‘´NÀ‹Qlşày¸¾t3T\\³bsffµÀş>€#ß‡dè0¸Jüà\rÔâ5œnxìBQ%SØ\nsØæÓ100\Z„ğáOèJGšTWÖWèy’Æºj¬v`ğ²	¿¿…[Šİ¡s€íGa LÃà\Zæ{œm­¬ÚŒ\0–]]å”	h&•#³¼@Õøişc ªct+äùÈa	ÄMG sé#Â(ñ#@»ƒº·Tô¸•ÛŠk†Í2šƒ4ekåº‡\'™×Úö·U\0¶IôvlÛŒÚm\nqˆnLL½w_\Z=ù&5\nìà¸<‚ÀÇ±ÿàÈ®âiGNçH¡`UP]ûï`ñÔÍo¿öÖœª·O­º·ö\rh}¦$Ëp´ ?F_ví…åíôØüÇ@ĞQ¸a±ñÊ»Z¨‰Á ·ÎßxÎ1¸k“ûzõp>ÖûŒ¡w?xü•Õ1×Š¥¶¿|tò•ã\nª*¡r¤Lğp¢¥=ğ!Ğ#](+e­˜‚£NÙ±L(îq\00Wˆ™a¥3ìğˆ¸ñw¯aÌÛyÓWÔ_3å¶É X%\0İ½\0}CHÀ\n<Á¯…ƒg]‚¢áÔpV‹89©%¬¼ÖgäF`—Ú±·ÙñÀŠ[ÖŞÆ-yš°“²ï¿Ø°‰m/bßï[rÑ²z•¿+PY×$Ç1º¶5å ÆÆÔ!g\0 æó#N)‚ EYÒËÔÒÜÑX‚ôjé°`¨ü˜’:Á©Çw÷œ†Lÿ(ìÙ–>|Àüm´~v!´ë[v·½Ö(»€óMh—/ğ•cŸã7›ÿíöÿãÜŸ¯şûŸ/»\Z_â‡òÊ±µ~E>ß/‰óË%©ÕFHĞ#pv	ó]dÅ‹ tÍä ¬¥O‡´Ì£™ì3ï _!uøĞë&x]Üvl±kW¤\0›¼˜mwş·C8ÜöÖv¸^q°°¡œ\'…wFÓà@y¦¼ØL”qŒş(‚xû~©,\n¬ôŠDÍG•ğqËU\ZBœ›\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(38,'sys','quickAccess_updateProfile.png','image/png',5535,'2013-12-14 18:15:36',5535,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0AIDATxÚbøÿÿ?$\'\'o)(È³AŒŒŒ.dĞgºù_\\Û’AÒÈ—‘	¦º©©‰ñæÃ\'O/GÕá–TË`ücçÿÿÿş0I943€$Bzö0,¹üÿÿÑ§ÿÿïÛWşÿÃ°QÊjzÿ?ü``¸÷ìƒã™N…%æ,\0Ä\0s•——Cccã¹Ó§N‚Åà–¿~ıú_º‡–¡ø‹}= >\\ÂQ…åÿí‹\'î=zâ³€ˆ¼9‡¯ÏgÚ{ü$CÃüÃj7qß›7ñÔßÿ;îÿÿÿöİûÿÿï%,•\0õî+ÃÛ¯B¬ü»dş…^\0#ÌU O‚@CCÓ­[·~pqq±²031ğòò1ØÙÙ-óõó‹©ea@@Åÿ®_¹Ä:«Ğ›AŸŸA@A›áÛ‡!@©hx\"Û\0@1‘yuÑ¯ÿşúÉÀÁÎöŸ“‹‡/´bö\r¾5«˜v††¸Šñ32¾é±gøÉÈÆ W¼ùÀiéŞÓ/\ZÊuOFhpúµ‰©‰ˆ8#ƒÓ/µµrü¯ÖÎg`,e*{Ø;Nf¼øÊøçÉ;`H½ıÏpëÕŸKg1DÌwÜ.=Çä×@ü €àÉ\0ÒÓÓ~üøÁ   ğEVV†GYE™50 è7Ì%Lè¡TÜÈÊÊúïÇ÷ïÜ÷îİû÷âÙ‹/ëÖ­e†Éc«¤¤dí®=û×÷d3°óğ122³0şyó\0.aÃ¹sgŞøÈğñÙ}†ÿ_?00şùÅôúÆ‰¿8m¸pùº^[‚ååg¯_3üøùœv^<~À •ÇğtS²=Ã—/ŸÿIKH0òóò‚ã1¡e%È¬@üÅIQË÷ıµ³âãâbxöâÃÍ{÷AŠA®ÿĞÖöH‹Àä[µ”Á!(ò?ó¿ÿoÎ\Z1\nŸÌğıcåœ]ë\"uNn=RÆ	Ö`Ÿ3›ÁÈŞ÷ß¿ßÿØØ˜µü,ƒ]^¼zÃ \'|‰a“Ã­ç9\r@¥/ÁNº|t\'ƒ¸(Ïÿ¿ÿ~ÿc`øõ—‘aë­or\"W¶Ä2,ùœÍVÔÚ	Š&°-×D†÷_˜¾]ùˆ?|ûÇ` üÆ³63W18ygƒã¬ÿ¾½a|ñê¯€0ĞüÿŒ?~ıgØüŠë¯s>‹_˜3CùO˜_PVu!M…aø9gÛÙÏÑıÔ²­²¦B”\r£ Òş¶ğÂ;C»±ìç\"ê2ºHÊĞ4\"¢‚¢0\"4“@½0È‹ê¢èçÂŠÈŒ¦¶ŠÖæÜv¦m;;?½\'üñ…ÃÇy¾÷y¿çù˜éê4ŞÿVYY	ÇI’ä[¨ùó¼Nç2¸].íf M×®^™ß™E”––azÎ9ƒm6b)P»ººÔ¼¼<äØ(pè‘#şBlø\'\"·p˜uw1ÂuîytaNü‚ªªªĞßßlVdFƒßĞ^·&Îˆ¥…À°:IE–³É±à³’Õ;gÅ/Qqq1¡¬W›j¼\n§çX‹Ù›5¼É#g\0’Us®,¦&•ñÀnÇ©ŞÅA$®n›ªkî¨8R¾âİjgc‚\0³ÉÎ`\0Ë²P”Jj\"ŞÂ²¼FyQùkáS3ÁÈïäx<‰xB@Õ1“¦œÊ²ŒšM§Ä†Û/N;§0Ò7Kkr^ˆ*ëÛ±Ü½B4º~İ¦Ò<›Æ‡×OQ!ÜSG‰II28½K6ïUŞÅsÛÎ½Baöıû¿Z²>ÕŞ” äÚµ‚ì>q®Un6ú+ÜºÅ_qHU=Ogá9^ï:™#Œ;<ˆĞÃËã!”l÷±.Æ}¾Öî¼Ófáû\Z}‚ÓCŸPŸßD)“3:¨¾ôB—5Ö¨>ChrM%Çße!q1é‰ë:V&\r«4&ŞŠü‚­ôfö¯ºï	<p4ûÎÅnQº¸6Âù\"—íò5	“SüÏH4$\";«!GçÈÒøèº ”£z#m¤o@ßuàG7ÅÃğí©ƒÏëÕ4BÔ?G‚-¼v+OÉULÙ…´Š)D\"ÄRÚã«\"’ñ²§…~’ğ˜¶¡ÏĞ ^ÜDÛsù¹×ëõüÓe^T4?Bäë İEÑ›,Ç\\kÖÖ9œÎB›ÍÊêT	Rz\"“JD¡àçîğÈû[¯{nŒ­•ÏòTsí\0”WilTU>÷½73o¶.C[ètZ±[¶VZŠB „V’Ê¢@$(\rÔ4ÆÒ¸£‰$î±š`Œ¦h\"á‡4\"DRPƒ%6ˆ–8a±”2…™N§óæ-ó–ë¹cK(¥%}ÉM§¾{Ï9ßùÎwî8›oıš››™ñš¦1åv»}Ïçãººº^šû@õ%uK°Ë\r”/TVÍícO©Û?œ‰ìæ\nQ©ÃáøÿÏx>£¾¾¾mæŒ™ˆeux½l6&Acc#”——Coo/Åb,àyÔö2ì`›İFórsiiY\':DòèÊ•£\"·“QE¹öööªH$B°ßï\'“³=0u’Ğ;AÊÂ1¬FMÏµot°‘;ÕaÜ0%P]]½z÷îİFVV¦MĞbğÌÂRÈ)©Àˆ)Xœ€97Ô5©x\rÚ÷-}aÆ¸5@_B0=E(xDS5X<+Ìµz£S% ÿ\"À##‰`‡ĞO6~°obó ³³âñxÔ0-Êä\"!«¨®:¨2vbÏ?àö—°â¶\rdäëy8Ô{oOÓ¸œ;wÎòºì­sK\'?__U@ósİDFC¥Y£]şo[FHÉ$Gñ‰E€)¢Š¦ŸH©ÚY“lI5…‘wâœ!ı`=Ú2õ‡\rI¦n´`0ˆÇ…Ù|ré¢J§‘Òˆ­“ÃaOGÂ>]×©®%¹Ç^ß;Š¦w½€}kÏ‚`À{1Óã*Bºò.\'—7/°Rj²¿ñƒïr‡H3lNYçYwhË›Ş…ûµChMŒ©1œf@\0zz{‰¡(¨ƒ³‡ÒídšÉŞ‹GÆ£ŒIÓG^ùòòrˆ’LÀÏ®Õ?¹	å0ÊpbH²ƒ‰Aè¿Ş¹÷x­>¸ñä©--×ú¶n½¶¹¦¦’µÒ¨­xu\Zª%,¢Í¾oÎüšÇ¯œ>föäÌK$šT]$Z2å×|ë:º/¸¿íšR¤œ7ßy;´	Sw#Œ)‘çµ¶J‘5EUo°bAÜ_X`ºJ^Å+RÀWO€Ç.€ašåpƒæsg<õbDæZ½Õ¹ùH×Øöû/°Ù—¤´„ˆàéOÏ@üúy˜>{>\r¦ 9&Ø`”°qéD©‘¥88Oï‚ğ)t¿ÁÉ~TÖBCp¾l=À¿`ãöéŒàÖ®/ÚJØb4\"]¹DLç›Ø¨—hŞ°^Lwp\nA/¦,k‚ê\Z:ıh‚7 ¦¯Ã­)zş7ØYuÊ\"MelûÄ£İ,òüM; iiyÕBYµ=ˆ5Ä5J	X(óëW%ôrºá¾ëğşsÇ7àĞÿà4TÜlÎ`/b‘yóË4 »ıswQÑd‚uLƒ™¤‘>R¸\r(Š§»c0#óYÇ­5ô5‚w0pX\'íir\"<nŒPSWVŠëj<\"˜ªÎ¥7Ìœ;ÌaÈø#†–£¶,Šl¼œÀ™eAÊ íÅUµÊ0ø-l\"çÉôÍÄb[šIy‡¶Åcpš\nèè%«’\r á“£ƒiğ-¾Ãt®iŞkh¾|D†-™(B†Q|-e#m.\n:Ìá#£ÛÑ°<ÇOü–%Rş:ø°òÅU˜ZÒ°¡åsL±[ôò~pˆ&[ndÚƒK&9í`Š<p¢‚ãd‡£5õ$Õ‰¸´(wõòEõäŸgŸ<²ıµƒ·¿üb7¯i˜ú\0(‰~î=Ó>¸·Şëqy˜kĞåà-%\Z¾Ò}âÊ…®Ö_w½q”±¤~ÕzzøÛ½ÆX’óŸ\0µY	l×şßÌÎŞÃëƒÚÆØÇ*b×˜@B¹ÓB*IhEDšªéU¥(B¨ZÔT	m¨TBZZ	¦\"mI	(¹(¦`‡b[¶‰ÅØ{xwggvg^¿7k7â,0òÈ{Ììüç÷ß{ÿC¼®&D®t,]º”„´ŠD\"œ	”ÍzÍAıöáÁÜ@{Èãñ×ãánwÂçó¶¸œ®#`&»Ğ¨	•âı*Ÿ8NÌÅhú½÷\r]G¹õÚ$ÀU 7ôçåå6£ôIÇïÊ0D²®…‚RN»õ\ZóŠC™^ŸWòûıRnN.tÿ_ûºÄµ••U×tÀF7qk æææB¬)õEíííFNN‚l0ËhT}J<;‘$|ã¡ìÉ‰$ëG%££›FŠŸM\\[99Åä|ÛådW¢Ó·Ì9sæÈ0Ê@ù<\nê]ÜĞĞ`€\nÚº»»a$ŒwºéŞq´°ª¢Ã%Ã ìd+#B\\›\"›Yùæ0øÍ2Ã­&S€öŒÖ_‡\r7å€ªª”ŸŸOÍÍÍÕÑh”Å1£Oœ)Ué»s‹ifÅp‹‘\'À}ÃKa©°oÂp±B\0G7À{]Ô›3KmöŒ™y·½@çŞÎ¤òûzûèèè°}[[›XÛ\"”%4Ì­°z€c:„ƒ±IÀşóÿ!»ı’S@²Ä×§»[‹Ö]6ç¸æmOäJNïEï¨É·7uuuìøñã\0ùä	Y±/÷cNıháæqHÔÒÅáSÈŠb3Š<Nz¢e[í.²yü$£ÔÄš˜ıº¦fè²/ƒq…äH¯4T«Şr€@Ğ‡…úc/Aœ}£4/c%Õ¸¬d»y†á»(9AuĞ;‹\"k¢$¨	[%e‚d!sÈ”ªÆ¸©J\\&CÕoo”A}so†ƒõÇµù§Zô‡µD¢vÁäô¨Œr·35Ò«§›Ú&NÙr@†¢bÄÉÓ‡	$’’‰hƒ·dFébL1¯éÀM²K¤·üqÅ|öøSùS/½ÑlcFiÙezSÖ	r9Vƒ+V$8 §Ÿc%F2©Éj0ğÀw~wøÍ«IË~½ÇP\0—;ø-sàş<GÕ‰w(ŒÓ©sá_«qœhQ$×)\nY«{Bª¤t¸åcHdÊ–Œ÷oüÙ–÷WÌ\\j;P×BCt’<Äc /R—¶nÔÅ«·’/3“ÎzŸÜ¿äõgSUü€9¾ØGgÎuîı~(’Ğ!©¹M@ªMfv_\"UA\n‰èIRzmÏJÂQ»¡%~òüë\r›ÆùmgÏ‡¤UE§Ğb§W­Z6*;ûûÁà»¿Ø¿ÿ·µõõ]Åe¿n<½p­Óˆ’ên=îšc{º(©©Õnw¥”Œ.Q\\*rÄÌÊşƒÒ…x’Âà˜	pØÁg°iU½ìä€Ø‹L®}ñÆšŠ‘™Ê©Ö°øÚ1  =[]»|y~Á3ñŞ^ĞT³D·ÎP,öñ”—_‡k¢×t`á³¯#Bèbâ 1mĞÚÆºÒ±ã×Œóe‡¼Õ)‘).™VİíMÔÓTÏÊÛjAš#ÔoÈàÉIHÓÒ‹\nJ(ƒ42‹îá…¼ÀúzôéG§[?9]·ò­Íë*§o÷ŸY~¶«bõ´i“„8ã>ï‡G)ØÕEb« ®iı÷mİ*öb\"×D!o)Oív·÷ğø;§İ“_£Iø‚DÛ¸µ/)sƒ“]‘©´|,]NáÈ<ÒZQ~Ãkíiµhƒ$+V³KJÒrâ/¯¨fŠIEw”—ıeùì€¼¸ªÈ¿ÅÑE]ú5µghgãI¨/‰=‹|ÿ>e8{öW¢|„¼bî}²†ü¹y¬§«\Z3ÇTN?TñÕ‰)Ô·lÀX5l‡õ\nêÛSdñ†“$>#‹÷à>b†F%N•bÁ‹êé„tR¨`äh2´8ıa[-ö •ÙkùÔ’ÃPJ«QhŞ8œèh$j¯·Zá¬÷iÚ°÷<\'-º®fÛöZ±F=ØWÌ€Óíeíç>âzBıJÕ¬oª¨š ¸±,f‹I,½†2´WØ€óŸ¿Hc“]Ôi:hl±‡JŠ\n)á%8“††\\|”,ßK”õ£h.Äîß`ø\'Dç?…!¢ h•ôMëk¶tì5? Xõ«¢Ğ]?¬¡EË–lsÑ»>xïÎ©wMËËv™á—ÍòLDİŠ¼x-Q:êâ½”^?O¯¡›Vÿp4oR×¨X‰À9µ×hÔ°÷`øš!‡áŸ!ê±°e87½Â¾İöøªWg]ÎğAŠqÙ(öç[x8Ø7nşCË¦\rËvM)†VF[zAN	7âÍ>/ÜZd;ğ˜N)R(—x,N>¹–ªóåâµ0´\0ÿkºT†n\Z5MZG}™séà;Mˆ^½p9Ã¯J%—›e+äîÌœê¬,Ÿˆ®J2Y¬H_(~I1á—…s<í  —\"ò)”Š\ZW©ÌoPõèïáËoõ¼BÔ´‹¨³BG½dø®ì•|ç¿m^úËjµ6½µJD~ÜŒ%ôñ‘İ©ëæBŠÃM¿‹ôx¸ÈãÎ°ppB†ÒgÜ2ZğxÁTa¸™.›™^Ç°Y’Ã(“R:ğ[’u#**C1È\\•D“€‚ş‰ï‘ö~7f,Â\\	–zS[™bşØÎçÄ±	ãoŒİıãí,	qO¦²(·pÂß§NŸ\"¶R-=$ÛÁÚQFYai´I÷ø/*…h1“ Ú\Z² ò¶}˜şóõYT˜ÑNÑ±7ëpL¤ş`/:ÚëÌ`û†]Ÿ:!Œv¸}µ˜Ø™ú?ÈÜÜ_ş“¢Ú9s:M Q¼X²»Öä–.õçû|YÙ”árZÛ¢v›}>Ø¸N0‹a†p]%\rÃH†IE(ØÛr¦B\'İ±¾ç{;÷ÕnZß<Èof/[IwüÆ¸vÕI<cÕ:òü\"ª|ì÷\"z²\Z\r¦rŠÆÒ’Ÿ/¦\'½Ö5¹åV*ôøs<‚¤éñ~=é\\ø¬¥õíM+Z+«ª“_d”5¤Ş‹ÉÀÉ½üzÄû•ÿ&$íÏ;_¥p\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0 É\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0AIDATxÚbøÿÿ?$\'\'o)(È³AŒŒŒ.dĞgºù_\\Û’AÒÈ—‘	¦º©©‰ñæÃ\'O/GÕá–TË`ücçÿÿÿş0I943€$Bzö0,¹üÿÿÑ§ÿÿïÛWşÿÃ°QÊjzÿ?ü``¸÷ìƒã™N…%æ,\0Ä\0s•——Cccã¹Ó§N‚Åà–¿~ıú_º‡–¡ø‹}= >\\ÂQ…åÿí‹\'î=zâ³€ˆ¼9‡¯ÏgÚ{ü$CÃüÃj7qß›7ñÔßÿ;îÿÿÿöİûÿÿï%,•\0õî+ÃÛ¯B¬ü»dş…^\0#ÌU O‚@CCÓ­[·~pqq±²031ğòò1ØÙÙ-óõó‹©ea@@Åÿ®_¹Ä:«Ğ›AŸŸA@A›áÛ‡!@©hx\"Û\0@1‘yuÑ¯ÿşúÉÀÁÎöŸ“‹‡/´bö\r¾5«˜v††¸Šñ32¾é±gøÉÈÆ W¼ùÀiéŞÓ/\ZÊuOFhpúµ‰©‰ˆ8#ƒÓ/µµrü¯ÖÎg`,e*{Ø;Nf¼øÊøçÉ;`H½ıÏpëÕŸKg1DÌwÜ.=Çä×@ü €àÉ\0ÒÓÓ~üøÁ   ğEVV†GYE™50 è7Ì%Lè¡TÜÈÊÊúïÇ÷ïÜ÷îİû÷âÙ‹/ëÖ­e†Éc«¤¤dí®=û×÷d3°óğ122³0şyó\0.aÃ¹sgŞøÈğñÙ}†ÿ_?00şùÅôúÆ‰¿8m¸pùº^[‚ååg¯_3üøùœv^<~À •ÇğtS²=Ã—/ŸÿIKH0òóò‚ã1¡e%È¬@üÅIQË÷ıµ³âãâbxöâÃÍ{÷AŠA®ÿĞÖöH‹Àä[µ”Á!(ò?ó¿ÿoÎ\Z1\nŸÌğıcåœ]ë\"uNn=RÆ	Ö`Ÿ3›ÁÈŞ÷ß¿ßÿØØ˜µü,ƒ]^¼zÃ \'|‰a“Ã­ç9\r@¥/ÁNº|t\'ƒ¸(Ïÿ¿ÿ~ÿc`øõ—‘aë­or\"W¶Ä2,ùœÍVÔÚ	Š&°-×D†÷_˜¾]ùˆ?|ûÇ` üÆ³63W18ygƒã¬ÿ¾½a|ñê¯€0ĞüÿŒ?~ıgØüŠë¯s>‹_˜3CùO˜_PVu!M…aø9gÛÙÏÑıÔ²­²¦B”\r£ Òş¶ğÂ;C»±ìç\"ê2ºHÊĞ4\"¢‚¢0\"4“@½0È‹ê¢èçÂŠÈŒ¦¶ŠÖæÜv¦m;;?½\'üñ…ÃÇy¾÷y¿çù˜éê4ŞÿVYY	ÇI’ä[¨ùó¼Nç2¸].íf M×®^™ß™E”––azÎ9ƒm6b)P»ººÔ¼¼<äØ(pè‘#şBlø\'\"·p˜uw1ÂuîytaNü‚ªªªĞßßlVdFƒßĞ^·&Îˆ¥…À°:IE–³É±à³’Õ;gÅ/Qqq1¡¬W›j¼\n§çX‹Ù›5¼É#g\0’Us®,¦&•ñÀnÇ©ŞÅA$®n›ªkî¨8R¾âİjgc‚\0³ÉÎ`\0Ë²P”Jj\"ŞÂ²¼FyQùkáS3ÁÈïäx<‰xB@Õ1“¦œÊ²ŒšM§Ä†Û/N;§0Ò7Kkr^ˆ*ëÛ±Ü½B4º~İ¦Ò<›Æ‡×OQ!ÜSG‰II28½K6ïUŞÅsÛÎ½Baöıû¿Z²>ÕŞ” äÚµ‚ì>q®Un6ú+ÜºÅ_qHU=Ogá9^ï:™#Œ;<ˆĞÃËã!”l÷±.Æ}¾Öî¼Ófáû\Z}‚ÓCŸPŸßD)“3:¨¾ôB—5Ö¨>ChrM%Çße!q1é‰ë:V&\r«4&ŞŠü‚­ôfö¯ºï	<p4ûÎÅnQº¸6Âù\"—íò5	“SüÏH4$\";«!GçÈÒøèº ”£z#m¤o@ßuàG7ÅÃğí©ƒÏëÕ4BÔ?G‚-¼v+OÉULÙ…´Š)D\"ÄRÚã«\"’ñ²§…~’ğ˜¶¡ÏĞ ^ÜDÛsù¹×ëõüÓe^T4?Bäë İEÑ›,Ç\\kÖÖ9œÎB›ÍÊêT	Rz\"“JD¡àçîğÈû[¯{nŒ­•ÏòTsí\0”WilTU>÷½73o¶.C[ètZ±[¶VZŠB „V’Ê¢@$(\rÔ4ÆÒ¸£‰$î±š`Œ¦h\"á‡4\"DRPƒ%6ˆ–8a±”2…™N§óæ-ó–ë¹cK(¥%}ÉM§¾{Ï9ßùÎwî8›oıš››™ñš¦1åv»}Ïçãººº^šû@õ%uK°Ë\r”/TVÍícO©Û?œ‰ìæ\nQ©ÃáøÿÏx>£¾¾¾mæŒ™ˆeux½l6&Acc#”——Coo/Åb,àyÔö2ì`›İFórsiiY\':DòèÊ•£\"·“QE¹öööªH$B°ßï\'“³=0u’Ğ;AÊÂ1¬FMÏµot°‘;ÕaÜ0%P]]½z÷îİFVV¦MĞbğÌÂRÈ)©Àˆ)Xœ€97Ô5©x\rÚ÷-}aÆ¸5@_B0=E(xDS5X<+Ìµz£S% ÿ\"À##‰`‡ĞO6~°obó ³³âñxÔ0-Êä\"!«¨®:¨2vbÏ?àö—°â¶\rdäëy8Ô{oOÓ¸œ;wÎòºì­sK\'?__U@ósİDFC¥Y£]şo[FHÉ$Gñ‰E€)¢Š¦ŸH©ÚY“lI5…‘wâœ!ı`=Ú2õ‡\rI¦n´`0ˆÇ…Ù|ré¢J§‘Òˆ­“ÃaOGÂ>]×©®%¹Ç^ß;Š¦w½€}kÏ‚`À{1Óã*Bºò.\'—7/°Rj²¿ñƒïr‡H3lNYçYwhË›Ş…ûµChMŒ©1œf@\0zz{‰¡(¨ƒ³‡ÒídšÉŞ‹GÆ£ŒIÓG^ùòòrˆ’LÀÏ®Õ?¹	å0ÊpbH²ƒ‰Aè¿Ş¹÷x­>¸ñä©--×ú¶n½¶¹¦¦’µÒ¨­xu\Zª%,¢Í¾oÎüšÇ¯œ>föäÌK$šT]$Z2å×|ë:º/¸¿íšR¤œ7ßy;´	Sw#Œ)‘çµ¶J‘5EUo°bAÜ_X`ºJ^Å+RÀWO€Ç.€ašåpƒæsg<õbDæZ½Õ¹ùH×Øöû/°Ù—¤´„ˆàéOÏ@üúy˜>{>\r¦ 9&Ø`”°qéD©‘¥88Oï‚ğ)t¿ÁÉ~TÖBCp¾l=À¿`ãöéŒàÖ®/ÚJØb4\"]¹DLç›Ø¨—hŞ°^Lwp\nA/¦,k‚ê\Z:ıh‚7 ¦¯Ã­)zş7ØYuÊ\"MelûÄ£İ,òüM; iiyÕBYµ=ˆ5Ä5J	X(óëW%ôrºá¾ëğşsÇ7àĞÿà4TÜlÎ`/b‘yóË4 »ıswQÑd‚uLƒ™¤‘>R¸\r(Š§»c0#óYÇ­5ô5‚w0pX\'íir\"<nŒPSWVŠëj<\"˜ªÎ¥7Ìœ;ÌaÈø#†–£¶,Šl¼œÀ™eAÊ íÅUµÊ0ø-l\"çÉôÍÄb[šIy‡¶Åcpš\nèè%«’\r á“£ƒiğ-¾Ãt®iŞkh¾|D†-™(B†Q|-e#m.\n:Ìá#£ÛÑ°<ÇOü–%Rş:ø°òÅU˜ZÒ°¡åsL±[ôò~pˆ&[ndÚƒK&9í`Š<p¢‚ãd‡£5õ$Õ‰¸´(wõòEõäŸgŸ<²ıµƒ·¿üb7¯i˜ú\0(‰~î=Ó>¸·Şëqy˜kĞåà-%\Z¾Ò}âÊ…®Ö_w½q”±¤~ÕzzøÛ½ÆX’óŸ\0µY	l×şßÌÎŞÃëƒÚÆØÇ*b×˜@B¹ÓB*IhEDšªéU¥(B¨ZÔT	m¨TBZZ	¦\"mI	(¹(¦`‡b[¶‰ÅØ{xwggvg^¿7k7â,0òÈ{Ììüç÷ß{ÿC¼®&D®t,]º”„´ŠD\"œ	”ÍzÍAıöáÁÜ@{Èãñ×ãánwÂçó¶¸œ®#`&»Ğ¨	•âı*Ÿ8NÌÅhú½÷\r]G¹õÚ$ÀU 7ôçåå6£ôIÇïÊ0D²®…‚RN»õ\ZóŠC™^ŸWòûıRnN.tÿ_ûºÄµ••U×tÀF7qk æææB¬)õEíííFNN‚l0ËhT}J<;‘$|ã¡ìÉ‰$ëG%££›FŠŸM\\[99Åä|ÛådW¢Ó·Ì9sæÈ0Ê@ù<\nê]ÜĞĞ`€\nÚº»»a$ŒwºéŞq´°ª¢Ã%Ã ìd+#B\\›\"›Yùæ0øÍ2Ã­&S€öŒÖ_‡\r7å€ªª”ŸŸOÍÍÍÕÑh”Å1£Oœ)Ué»s‹ifÅp‹‘\'À}ÃKa©°oÂp±B\0G7À{]Ô›3KmöŒ™y·½@çŞÎ¤òûzûèèè°}[[›XÛ\"”%4Ì­°z€c:„ƒ±IÀşóÿ!»ı’S@²Ä×§»[‹Ö]6ç¸æmOäJNïEï¨É·7uuuìøñã\0ùä	Y±/÷cNıháæqHÔÒÅáSÈŠb3Š<Nz¢e[í.²yü$£ÔÄš˜ıº¦fè²/ƒq…äH¯4T«Şr€@Ğ‡…úc/Aœ}£4/c%Õ¸¬d»y†á»(9AuĞ;‹\"k¢$¨	[%e‚d!sÈ”ªÆ¸©J\\&CÕoo”A}so†ƒõÇµù§Zô‡µD¢vÁäô¨Œr·35Ò«§›Ú&NÙr@†¢bÄÉÓ‡	$’’‰hƒ·dFébL1¯éÀM²K¤·üqÅ|öøSùS/½ÑlcFiÙezSÖ	r9Vƒ+V$8 §Ÿc%F2©Éj0ğÀw~wøÍ«IË~½ÇP\0—;ø-sàş<GÕ‰w(ŒÓ©sá_«qœhQ$×)\nY«{Bª¤t¸åcHdÊ–Œ÷oüÙ–÷WÌ\\j;P×BCt’<Äc /R—¶nÔÅ«·’/3“ÎzŸÜ¿äõgSUü€9¾ØGgÎuîı~(’Ğ!©¹M@ªMfv_\"UA\n‰èIRzmÏJÂQ»¡%~òüë\r›ÆùmgÏ‡¤UE§Ğb§W­Z6*;ûûÁà»¿Ø¿ÿ·µõõ]Åe¿n<½p­Óˆ’ên=îšc{º(©©Õnw¥”Œ.Q\\*rÄÌÊşƒÒ…x’Âà˜	pØÁg°iU½ìä€Ø‹L®}ñÆšŠ‘™Ê©Ö°øÚ1  =[]»|y~Á3ñŞ^ĞT³D·ÎP,öñ”—_‡k¢×t`á³¯#Bèbâ 1mĞÚÆºÒ±ã×Œóe‡¼Õ)‘).™VİíMÔÓTÏÊÛjAš#ÔoÈàÉIHÓÒ‹\nJ(ƒ42‹îá…¼ÀúzôéG§[?9]·ò­Íë*§o÷ŸY~¶«bõ´i“„8ã>ï‡G)ØÕEb« ®iı÷mİ*öb\"×D!o)Oív·÷ğø;§İ“_£Iø‚DÛ¸µ/)sƒ“]‘©´|,]NáÈ<ÒZQ~Ãkíiµhƒ$+V³KJÒrâ/¯¨fŠIEw”—ıeùì€¼¸ªÈ¿ÅÑE]ú5µghgãI¨/‰=‹|ÿ>e8{öW¢|„¼bî}²†ü¹y¬§«\Z3ÇTN?TñÕ‰)Ô·lÀX5l‡õ\nêÛSdñ†“$>#‹÷à>b†F%N•bÁ‹êé„tR¨`äh2´8ıa[-ö •ÙkùÔ’ÃPJ«QhŞ8œèh$j¯·Zá¬÷iÚ°÷<\'-º®fÛöZ±F=ØWÌ€Óíeíç>âzBıJÕ¬oª¨š ¸±,f‹I,½†2´WØ€óŸ¿Hc“]Ôi:hl±‡JŠ\n)á%8“††\\|”,ßK”õ£h.Äîß`ø\'Dç?…!¢ h•ôMëk¶tì5? Xõ«¢Ğ]?¬¡EË–lsÑ»>xïÎ©wMËËv™á—ÍòLDİŠ¼x-Q:êâ½”^?O¯¡›Vÿp4oR×¨X‰À9µ×hÔ°÷`øš!‡áŸ!ê±°e87½Â¾İöøªWg]ÎğAŠqÙ(öç[x8Ø7nşCË¦\rËvM)†VF[zAN	7âÍ>/ÜZd;ğ˜N)R(—x,N>¹–ªóåâµ0´\0ÿkºT†n\Z5MZG}™séà;Mˆ^½p9Ã¯J%—›e+äîÌœê¬,Ÿˆ®J2Y¬H_(~I1á—…s<í  —\"ò)”Š\ZW©ÌoPõèïáËoõ¼BÔ´‹¨³BG½dø®ì•|ç¿m^úËjµ6½µJD~ÜŒ%ôñ‘İ©ëæBŠÃM¿‹ôx¸ÈãÎ°ppB†ÒgÜ2ZğxÁTa¸™.›™^Ç°Y’Ã(“R:ğ[’u#**C1È\\•D“€‚ş‰ï‘ö~7f,Â\\	–zS[™bşØÎçÄ±	ãoŒİıãí,	qO¦²(·pÂß§NŸ\"¶R-=$ÛÁÚQFYai´I÷ø/*…h1“ Ú\Z² ò¶}˜şóõYT˜ÑNÑ±7ëpL¤ş`/:ÚëÌ`û†]Ÿ:!Œv¸}µ˜Ø™ú?ÈÜÜ_ş“¢Ú9s:M Q¼X²»Öä–.õçû|YÙ”árZÛ¢v›}>Ø¸N0‹a†p]%\rÃH†IE(ØÛr¦B\'İ±¾ç{;÷ÕnZß<Èof/[IwüÆ¸vÕI<cÕ:òü\"ª|ì÷\"z²\Z\r¦rŠÆÒ’Ÿ/¦\'½Ö5¹åV*ôøs<‚¤éñ~=é\\ø¬¥õíM+Z+«ª“_d”5¤Ş‹ÉÀÉ½üzÄû•ÿ&$íÏ;_¥p\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(39,'sys','save.gif','image/gif',1691,'2013-12-14 18:15:36',1691,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:8375AB4E69DB11E0B4219AE9E4956031\" xmpMM:InstanceID=\"xmp.iid:8375AB4D69DB11E0B4219AE9E4956031\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8B7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>\\×íÖ\0\0ÍIDATxÚbüÿÿ?0ˆÊEÿ#L„¥zÉ“ÿ?|c\0 ÈÇoşÿõ÷Õâ‡ÿÁjÙX˜&Kexıê%@\0ÁõÀ\0ÓÅßÿ§öüÿòãïÿfY;ş1}úö‡A\\\\Š¡wİ†¿0²|üú›W¶¬üß!×ÿ\0¶åâƒoÿüş÷ÿÛÏ¿ÿß~ú\r¶qß…7ÿM3·&³€T~ûù!gâ)f&F& şıçƒ€€Ãÿ¿ÿæ€€ŒœgtZ\nÜ5.çíüÎ\0v¦YÖ®­ÿÿyıÿÿ¨ëùˆÿ2002  &óœ½³/=üñÿÇŸÿÿ_9ğßÿ7Ÿşüï:õŒ¡kO|døõû#X×§ïR}Ô„Á¡ÊÀğŸÿÿ¿%ÓÏ2p°21üøtPÂZO’ÁFK\0¨\0Èûû÷/ƒ˜˜$Ã? {¸€ûû÷Ã·o?!ñô60°ş1ğÉ5Â–g9›¡oÕEˆ#ÿ¥0}òãÇo0Íƒ~ 	ñÀ\0ü÷÷78€Ö\0ÃäÓ¹ù‘ü\0 WŠåØˆ•€˜h1+Ì`X€œÂÌÄğ÷Ç¯ß§¦y®K‚C:{Ï‹÷¿ıoXõòÿ7`8}FfJÏ‰ÿ¯€áLàˆ%«Go~şßuáİÿ½Àˆ¶+Øı¤—	êdu \Z†Àà¥ŸOßş20122p²3“ßw`bx÷ù/ÃO`Xï»ô‰áÍ§ßßüf‡†3Ø@I`ğıùÃ0ióK ÏDÅ%:V!Ğ ƒA¶‚¤öãgPš€Ä\0 g¿ı\0\nU×EÊàM¥³¯2|ø4˜¨à@Òè°A KN?:ˆU³‰¬Ãï_¿¾¹ä/Â€¿ÿşßæEceN`\ne`0“·Çé®ßÀä²èÿ;p<JÎ„\0\0p¤Oå«®\0\0\0\0IEND®B`‚','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0hôÏ÷\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0diTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\" xmpMM:DocumentID=\"xmp.did:8375AB4E69DB11E0B4219AE9E4956031\" xmpMM:InstanceID=\"xmp.iid:8375AB4D69DB11E0B4219AE9E4956031\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:8B7BB47ADB69E011910CA28F37913800\" stRef:documentID=\"xmp.did:8A7BB47ADB69E011910CA28F37913800\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>\\×íÖ\0\0ÍIDATxÚbüÿÿ?0ˆÊEÿ#L„¥zÉ“ÿ?|c\0 ÈÇoşÿõ÷Õâ‡ÿÁjÙX˜&Kexıê%@\0ÁõÀ\0ÓÅßÿ§öüÿòãïÿfY;ş1}úö‡A\\\\Š¡wİ†¿0²|üú›W¶¬üß!×ÿ\0¶åâƒoÿüş÷ÿÛÏ¿ÿß~ú\r¶qß…7ÿM3·&³€T~ûù!gâ)f&F& şıçƒ€€Ãÿ¿ÿæ€€ŒœgtZ\nÜ5.çíüÎ\0v¦YÖ®­ÿÿyıÿÿ¨ëùˆÿ2002  &óœ½³/=üñÿÇŸÿÿ_9ğßÿ7Ÿşüï:õŒ¡kO|døõû#X×§ïR}Ô„Á¡ÊÀğŸÿÿ¿%ÓÏ2p°21üøtPÂZO’ÁFK\0¨\0Èûû÷/ƒ˜˜$Ã? {¸€ûû÷Ã·o?!ñô60°ş1ğÉ5Â–g9›¡oÕEˆ#ÿ¥0}òãÇo0Íƒ~ 	ñÀ\0ü÷÷78€Ö\0ÃäÓ¹ù‘ü\0 WŠåØˆ•€˜h1+Ì`X€œÂÌÄğ÷Ç¯ß§¦y®K‚C:{Ï‹÷¿ıoXõòÿ7`8}FfJÏ‰ÿ¯€áLàˆ%«Go~şßuáİÿ½Àˆ¶+Øı¤—	êdu \Z†Àà¥ŸOßş20122p²3“ßw`bx÷ù/ÃO`Xï»ô‰áÍ§ßßüf‡†3Ø@I`ğıùÃ0ióK ÏDÅ%:V!Ğ ƒA¶‚¤öãgPš€Ä\0 g¿ı\0\nU×EÊàM¥³¯2|ø4˜¨à@Òè°A KN?:ˆU³‰¬Ãï_¿¾¹ä/Â€¿ÿşßæEceN`\ne`0“·Çé®ßÀä²èÿ;p<JÎ„\0\0p¤Oå«®\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(40,'sys','systemLogo.gif','image/gif',3277,'2013-12-14 18:15:36',3816,'GIF89a \0+\0çÿ\0©e­n*ºm²r.Ãt²x8Èx½|8¯€IÎ|¸EÕ‚Îƒ,Ü‚ Á†I¼‰Rµ‹^äˆÀVÖŠ3ÒBëº–f¾–[Â•[½–aÅ•VË”QÂ•bÒ“LÎ•EÔ”@Í•KÓ”FÙ“Aá’4¸™h¶™nà’;î\'Û”:è’+ôã”-ê“&ğ’é“/·œuÎ˜Zá˜7ó•!·}¿gĞœJÎœPé˜)· r¾Ÿm¹¡m¶¡yÉo÷—%ñ™#¼¢h³¢…Ä¡]ö—.ßœAÃ¡c¶¢€È dÇ£YäŸ4ô›0¶¥ˆÈ¢rñ&óŸğ0¹¦ƒÎ¦OÒ¥P¾§yè¢/Î¦Vö2Í£zÇ¦n¹¨‹Ô§Rä£Tê¢OÄªp×¨L¹ª“õ¢4ó¥ È«kÄªƒÚªGõ£=à©Aó¦,æ¥]Ü«Aâª:ò¦5Ò¬[ñ¦=õ¤FÆ­y½­•Ğ¬hÔ­UÌ®hÎ«†Ì«Œß©pæ­5Ø¯Qô¨Gô¬&À°™â«lÑ¯wÖ°eó¬9â°FÑ²eõªPò¬Gì±1å²@ó±)Ú±tÃ´œ÷­Zô±=õ°Eó¯ZèµCñµ+ß¶WçµKíµ=ß¶^İ¶dÇ·Ÿô³Nã¸SÖ¶Ò¹„ó·7÷³]óµVÇº§Ø·—ö´dò¼:óºQö¸_òºXõ»Kê¹ó½Dú·nè¾_ó»aÌ¿­ï¾SìÀ[ô¿NàÀ€İÁ†ø¼pÏÂ°ô¾qõÁVö¿kø½zéÂvâÁ—óÂlñÂrÜÃ§ÒÅ²îÄlñÅ_÷ÂzôÇaêÇ€ÖÈ¶ôÆ|øÅƒõÉjÖË¿áÊ³ïÊŠúÇŒÜÌ´çÌ–öÌs÷Ê†÷ËõÍôÍ‡ÛĞÃîĞùÌ•ôÒ„èÑºóÓ‹ùĞßÔÇöÒ˜èÓÂõ×”õØœúÕ®äÙÌôÙ£ıÖªßÜÍùÛ³çŞ×÷Ş­óİÆ÷ŞÁúŞ»øà¶åäÛìäİñåØúåÀÿçĞìëâúêÑóëãûíÚñğæîñíûğãöñïúñê÷óäòôñÿóæõ÷ôÿöïı÷öúùğùû÷ÿüûûşúşÿüÿÿÿ!şCreated with GIMP\0!ù\n\0ÿ\0,\0\0\0\0 \0+\0\0ş\0ÿ	Ø-/X*\\È°¡Ã‡#JœH±¢E‡Á uÈñŸ;WÖ¸‰I²¤É“(Sª\\É²¥Ë—0YZså®ã7`1sêÜÉ³§O–¼È\r´Çë§Ñ£H“ş„eO`Q¥P£Jêêß·e=ÓÙcnª×¯I•}æ²\\×’éü©‡¬Û·:]¹b™NŸ¿}îJÒS«ÖÜ¿€Uv•­°áÃ…íò­uX_~KL¹²åË˜3kŞÌù0(PØB‹-_µÄFs›çß1#¤cËM»¶íÛ¸sëŞ=\Z”¦iÀƒŸ†-ßi:¬„C±áĞ£Öê’õVÏ¥kßÎ=ú3ëÏºş‹Ïİw´óèÓŸÇw‚fê™İ²Eß–¬ûøïßb¦½/)J’K5à8óËb´Òß‚6è z¬(áÌ0J°òà…b¨	%Ìtèá‡.AŒØpŠ&‚°áD-´èbãÌ3Š‹.ö‚hrŠ-|`ÑÎi§ÁƒŠ¾€hä‘H&i¤ç¨uJF)å”RBI2Xf©e–¡ÁÀ	4†Iã7|M &+”0L?@¶yN´l)çœtÖ¹e§aç|ö™%%Š#è ƒ†¢Hg&ê¢cj9 h%ü$<’¶Nºªé¦œvê©§)áé¨¤–Ê©\"Šô¢êªŸ¨ñè«ş-œ1?Ä (ÎœvÏ$/`€A›ÀsÚ6\\¬jì±È&«,² ò¥Ä²ĞF+m²_ø±Ëµ±øáCB Ò¬‰ªÀTè\noœÖN(Ğ8Bòœ†…\"±ìÒ’\\«¯¾¦ÈF¾û^kJa\\ ’¨ğ.Íª¥ÄÂK\"pHb\nÄûš\"	 a0Æ«Ñƒ±ˆâj‹à£–4\r€ë2Tê.ˆ9ûğ…Ê-dË9¯èËĞD«RÄ6æè!	Ñ±8’ƒÎ€³Î9Õä¢„©0İ°?J0=t$;l2Ì6çlóË!8DâõĞªè `5æ€SÍ0X\\aÊÚ^»Úƒş\Zf„ÏiDğòË[o³A¢\"lÂ-¬0	_›8²Êä“Ã±Z÷è@yoÛf?ÕQ	å[+Aù*©ü°I=múÏ!a¤rº#E€Óº?ç(!ùé”‹ÂD‹=&\"@^cÀààºğ8_z° ¨“8ó-Œ€\n_íd`F\"¤t_DÎşÔ£C÷klÂæí®ñH÷O„Ú}÷:Ø¾?Îñş*J°®V?ëÄËW=¦{ßûA£à…‰ü8\r.l…¼W¡à§aÜ£Vğçµh	T‹œç3t!|qÆ\Z<ñœñeÃ˜*¼q>˜ƒğDûœCOÄáz|*¼°	sœfşwˆá ¨–jì€?À‚ÿüñ‹8ÔĞ˜è[…&F©E-kà£@ ¿Ö”\0yğFCà¢¬ƒ/o€&‚àCµ\00ŒøÃ&‘A˜˜¡Ãğ	%€ÏÛøÁ0A\Zä\nsEP#Î¨,(‚ç6ñÈ(É€”F>ĞÁjñyŒôÇ=2€<èáhÒ¥–uzôÇ&Æ€G<fAqáÓ,C…Ç11|8D-1ıùãƒ¤ÂåZ©\ZPá„ÀÁ&°<šE—¤¢˜\"°\0Á}r‹]ôÇ^å‚X°E¨Ô!VĞ‚Ò¨0€Ã»è øşÌ\'Ş€Š\" Ÿ±T>¡ Fµl#\nùÄgŞY.4Â‡\0R=¶ÑÏ#daÈÃ¶…ÉojñïôGó5=®E(¨§á uµìã‹-@Á0°w„BØô¦…°Cp\ZP›á|ÉE\ZpZˆ4€ĞI5-^ñÇÓ\0­7€UGÅÔ­@.	Ôp‡=ÈaÕ3Yï4¯àÙ™ĞÅ,œ³àÛÇF°<ú‘± Í¡\rÀ@T›‚§¡²)\rZª–MØ¨v¨\'<ˆpÓ.(¡\Z|Ò¥ÄÊQm†i*óG<¶\0.<Dv3:ù²\rê)MRË+bà\"wêÌ]T˜ª\'X´È`ÈşC!‘ƒ7è\0\r6íi!ZcDEÃLÕ*Ü´iˆBm±DµÈ#•šª‹:¤y˜éUîhS>Dp¦\r´±‘Œu‘Úê7Ğè\r;Îw×¶è¬ôG?ÆI#àŒ÷(BnóZˆ1¼I½éºøÛ¢o¨Xğx¡\Z§yÃ9³y&ö\0iŞLn7s…	]u”6€0¹`zø#< ë\"\rtñ›ïşèŒ“¶(•ešPÙÚ—wyÃNmš†øúãShBÌZsˆ¸èå&ØÙØ3ı\rH¸H\0E£RÜ8†ëRsäâ\rX8„ş7êÈ7„·qÒ=`ZÚ_òãØ€^\0a¾¡Exr–‹@û?,d\0xÃÁáŞğuz\0ÁX ‚ğu¾¯’n‹,|š9h9	ßPY<fá¢@ÜPÁ™Hãù1Ñ³aÊ\0POãŒ·Òˆ2»‡9ÖQGú4Ğsü¤m´£ù(‚M«–|lã‡F(Ï¡L;ÖE‹èõ<Ğ\0!ØHµ\0ŞeO#-\'\nGEßëª}&¤Ûa«¥‘”ğİÖ9ƒ”-\"_ïA\Z}à\r2R;ŞĞ®÷òy~o¢r•ÏT‡È¢Ch5>Gí¡M¸\0@†Å¬„a4÷.çF	şŞ¦óÅì0°‰v4uÛ1˜í|˜¿ğ_à‘(¼Å‡8GbïÂóL8QšvQP\0\0”«ìhÌ¥H*s\0@ªaÕàxá‡\0‚4`kEÍà“ø¹˜P è\r3ÈóÑY %(GoQ.P/L%À€“5‚\rd `W‚ï²|ëQğp²Û¦9d±€\0\0\0sy¿Õ;Wü2Ä;Q\'8½¢Bÿ(Ğ70	™œ6Z÷€,¶@h@* j&jï¸ÀşˆŠ‚ûşøÈ?SHı224ÕÒĞxòÁÕWÀãúu„G¿§Ïıäg¢ÈÓB¥ˆ€ãuÿQ:æŞ`‚ó»ÿ“*€Æ?ºú²8€M7ÿû»û‹?êZ	Æ·+d îÀe/S¹\'y& `3ğb§j×€&ê0Ô€€Øø~=`Áxğ&x‚ÇWØ\rĞIĞ28ƒ4Xƒ6xƒ8˜ƒ:¸ƒ<Øƒ>øƒ@hƒBĞ ‚\0;','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0\0\0\0Š–*@\0\0¯IDATxÚíYyl×}şæÚÙûàòZñ)RuZ¤,:±d)°’Ú‘,ÅI‘?·E¸q“¦HÑÔª]	5´ˆanÿpÜÆİÚIkK6\"+’¬ÈŠ*ë¢$Râ-’Kr¹Ë]î9³×ıÍ,-Š!)9µ%0ÔÌ›·óf~Ç÷û¾÷]×a4-3ñEmäğ¢4MÍáN»õ³xÁ[ËÁ6lßÉ:—¼môñÆŸbğøéâtg»nõŞš;–ºMM5]ÛÿÆ¡ªã,¿äîvV—Â;•Øùvİææ•nw#›k2Bï·é™Ğ.¾0rd¿fóŞìWtèódõ­†Îˆ($º «ù;ÆıMwúQ=ü«§†È¸ì¢y[%Ä%÷‚¯h§qü,ş¹›Á–¯ç_,–Ü±èÇÎZô\nx½£W.:ˆ|oG—±şğz²%üKG —«äKÓ“AÔ”gïõc;%^UÉJjáû¬¬Æ]»Ç%X¸iX­”)J‡{09GU™\nÍ[ùÿzMcO‘ÍkàXåN‚íöÖ2]g0-Àfåàu±Ÿš?XMÏh2îbÑEnğw®A:F´ï—Xêª‡.ÉĞ‹9Ô=®öH`Tz/=w‚«ßF5%6ÚY2¸‘eV`¡[l` X•­øfğ®:¸jüğ:}(ä$Ä“#°ûPááoÏXQ±b}cãQ[iùtê99$FI,6f!×s\'‘=÷dƒcØà¡œı`6º?úa½iûÄ\rB¤óñZ/›ıÊõ‹ËÖ-¨Ûş×XÕÜ:w>²~ym]t <Ü‹‰Şÿ@]ù­\'9~#*ë[ÌãÈ«‡P_–øtB¾à¡JĞ”älo!=6	-•\0“Ë@ËË ø†ÃqóÊá«°äsHÑÿrN…Ë9LÄÒŒ;ŸBY Ñ¼††ê;N\0DêZï¡ß¹QÙ@dAz¡‰WQå¾ÅNa…ëÎ-síq[KÈ4xM1à\'Kô©Qè™Äê{ W·B:FÅ\\şÈ´¢û™»P,ÑTaÈ¹x,1.H«CËŒ3¦Fz:ø–æÏ•ˆÂ€€‹];°áËß‡ÃS†¥«;p®çTÏ#Ì5!©×À/ŒÂg•æ<7™SjaÑR¸cà˜RîæRÑ‰´â‡¢ÙÀSÆÚ˜4œB6AÁÂh¨“Cf@¥ú\"¬Èkz“X»‚È¦à°Á2så€\\ä!+nd5\n4§…ËÂÅ¥aå2°òÊâÙAöçÃ#”!Rúä8eBÎ¨°?³–{M*>ñ*Ä“OÂ&~4 §úŒ_áÃP›w?.6cİg,%b6ƒÑ£Ï£9ß9K¥QD«ô.®\r`Í\'Jp\'¥‘\n\0÷íÃšíè=ÿÄÔËdÔâŒÁXdíŸÇª¶/!“Nbêä>,q¥Ï¹·£¹ıØœ`9\ZÕºB!‡ÈĞyD‡ßÀROdVf]Äl1=£¤9ô¥Ö aÓ#(sûQÇˆC)æ1Ôõ\n–¹¯Ò¨R\0D³vHŞ=hhÛ\n^ÁÕ4•4g¢€}\r¿L¦3’ÓĞÆÇKVcdš\"+›Î`(u…ê\r×t‰¯i3‚Óê\'–’¼§Ş4ŒÑR‰(jåß-´¹ë;Tq|c?G÷ëûĞõ_#z,!o±Ó!bùú-Ùé†¡§&‘–Ux; ˆVÓàŒ.CÎ‘òíÁ†í_ƒË[EQ#h”¥ì./\Z×ÖGŠs„Û	\nuN-3úŠJ\Z]ñuXwÿ_¡2°”LÂ\"Çtd¼hC]ÓZ4~æ;JÔÑ¼I”&ù±bó.XˆÄ„ƒW¼|ÑÉaØ^4müeùÈ2o…´Ğ(ÔQ\n8U™ÆºV„<zvï{O¢Ü!|rPí[6;W^§-\\\\zu“¯£>ü<:ÑlHÈ¿oŞ¬v¸—Ş‡ât\ZêHC‘\0<ş€y¯÷ìT!&êÉè;ÈÙ7²ŒÎ·¿ıÒ·0üî·Ñæ¨9¶¡eFäåFªÎƒ,£oZòbíıß„hw­Š¸pø ó1èE×á—Í‘òjø×ï…”åK\nXŞ¶²‚Ebjj÷P9ù:ŸÀğÀE³_ĞŒùŒc:µw”Ä`lnĞÎKŸÏ#¾I¥[WOPªêŸ‹¸®xjô»ÁØ\"C† ãXõR\rcF…‚ô\'°8\\ğ4w {ÅM¼½_ërY*_ø 4›®â^ÒJv+Ùş+íïC`T,óÄ05özXâ,¨à¯Ğ˜ü<‡}9¡V›½Të‚=¨)¾‡5SBùMÊ€¨ªk‚¯¬\n“ŠN~!2¼÷î(«n€²ñ„Ã]ÈÅ.#~úEdº­ğé—aÕ(+â9£À-Œ\"óŒF£âì1`Ëi¥ëªü0Î%”™0ın>Vj™Ékç‚İ‡<ç‚E™¿Ôæ—AZı„Ã0/ Né†/İ§á®mSd.A—µ´JÍwm5“õ¡R:GÌL$\'•HƒJŒQ”ºHI¥G­’„|‚ %ƒSq~‚0T#1\0n^£ÁnÔ2)ê/\rv1SˆL™1à)^ô£ZìÂøàk˜(¯Beí\nT×Sö†L5bğâqh½İ$ù¤y0}C‡˜Ğb¯€}ÛoŠánä=MZEZŠl^8ø b%a-OÂ?ˆÌoƒMöÍ]nö€Ñ(I‘Û¨Ğ†„8”©yÏ+4îÆ†­»ÌóKSĞG®À¦K`ßDvÓı°9(;\Z?-†h)‰¸Éso¢™¢G€|.=“‘TdÖŒHFäÁ:¨4~L^‚PZı¼||1•ff˜!LYÎ>“ÏÅ™ì&±ËÛf`^3ÄœyŞb?‹ğ™\'Ñsi5òîMhZÕ_u\rìÄ×Ü»±¥kyk/ª´ÑÅm¹P§xÏwÁ.ûXÄU»‘¨û*TuqèÖ|\rLM;	Ş\n¾¬ÅÖ¯CÓçF‚;Ûş+gÌsWfİ×!µgl&Õ)ÀQÇ6”œaãÂôÈµˆª‘/ >1`¯Ø¸\rn‚.³ÖÀ;e³êYÄ&úM6dfXõ&äˆ¶jirV¨€‰øJ4şÁ3hÿò³Ò¾HìR[ˆùÂ®ı-ÁJEı*dTÿ,[Tk0£ŸD%±E¯>†¤ìÂ çï µü\r˜dİO\"òóGpş•ïb:4DeQNUô´Ü˜ø,¸“Õ°mÎ2»Øx¢/¡Ê3sßêš›OByë|MX‡pZCµ{Öçn*ĞS\'ŸC¦öÇpRÔ´ŞÆ—­E°û$±‘«ğVÔbmÇN3ØİsæéS³óPq^Ü%-Í¨«wûÌ(í~Ëõ‘™×Uá›:\n)ñ8½åh¿ÿœÎÆÁMœ@Ò@ë}¯¿´:]”ÓD9sĞÊ¯s\n\Z”aa:1=6ˆÊ¦Vøk—áüÀ^Œõ¾E,NCyÇŸÁå¯0‡ÇÏÁÀ$·+÷ì¤ÚeE¸<€‘wşF²²,¡lf3\nRøwwˆ2r–Ö‡¯ÑÀğåãğrlíß\0¿şÁØÊ EºÿÕÓ¦/ª—jÒÔ0²9Œ{îNJcö®új·<_U|şjø¶~iîü™£—ÿÖ®çáDâº]\rÉc˜\Z@EM3ŸA1Ÿ…7tdÎ~MM®Ã\'ÿM[ÿv\"m»ÿYy/lTèY¾ôÉ§¢%uh†AHæ¯\røa\n	óQn=Š#ÿ@Qğ*ëZĞ¶ı‘ëx(¸Á­ı—;÷üD*•1t{ë¶}Uä@×W_D*C•ÕI,°ÊdjWN„¯8vC‡pOì^ò=­0WçÆ;Áø×ÁÈæH÷q„ı#šW5ÁºãYÂb·™5Œ³Eg#Ô>Âõé1ğË\0GZÁ¸W ±yé!Hê˜ù­­.ŞL7†º1Ñ©øÌÈQŠä³$èÆúĞwügğ]z>%8ï…zWÕFš×›´6ØÖ¾—aAş:&ÇÅO£·gµ!bÌ­HEƒ8ÿËEYß‹5ÑRÍÒDˆu›\'ÍÀ_y‰œ‘4µ¢ŸæŸ8…xÁAÏñ–„½«”\"gıæÀé\" ÍDvØ	\\¬€@`sx¨ş°H\'\"øõOQÕó#8ôôâÎ šÇd^ºGW2óÜ¨~eŠÄ²H ù<Äú8öü»±¤{mLŠğ|ú•=ğÛ²HèL\n ñ.Ä®v¢Ñ\ZD­ÁHsFuAˆ¢r\"˜|Š´IÖ¤º<¦wÓl°íÇXºz\näÄ~ú8ÖJû±ĞLDn‘eœPXt‹‡X’V•È(©9bP!wf¸\0E.-<åˆ‚ç+á°›H‰bf”Hï(\"·À>9OãíP8Íé¢9‰Œ(2}“D[¸qvâ—qS-à«`9¹Mä\"Êª%fE×µ1éğ ”B:Õd“„=ûP-•Eä¸›)ãƒDÍàä7—…á%Ñù°zU›Ù\Z¸€Fù×XÌíf¦ñ¡Ò‘\rß\0·ğª#‹Ş7Œi$*nJÿ•sNcI	ın‹‹ö*B”Šµ(Nœ»ù:UrSÿıM”íşg*ºNÄ†. ëµ}h(×ƒ¡C7?ñ“““@wîŞõ$,kšÙ ÉçóHœù\ZõOg©üV4®j=9dıŸîâúßŞ¯ÊÑ›élØ¦N`ìùÍ¸Jä¦ƒXíW!p·~‡­AëÁĞ±#6·œ M€šCnğ]Ô¥OşşìŞl‹›¾õÏz\Zˆ[>›?şı6U¾yJú­9øAÂ¦jQó‰7¯·ç™ßÛ­tŞê‚Øñø9Æ×¼ß¬ĞÂò‡Ú¹Ê5;ó<·__„.MšîN»…»ƒFmvÀ•¯„¸ù;»˜²–Fÿÿ2n^Õ\'‰†®\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL),(41,'sys','view.gif','image/gif',1019,'2013-12-14 18:15:36',1019,'GIF89a\0\0çƒ\0\\AbL{tƒ~‚‰§}WŸc®€Lˆˆ˜ŒŒ”ˆ——‘—“—‘– ‘—•–œ•—¢•›¤Õ‘0Á“e×’0Ø“/˜¦È—_ßš3Ñ_¾¤Œ¨«µ°©««¬¯¦®·Ã¨Š´ª«¬­±Óªa¬³¼×®c­´¼²²ºÌ®Š¯µ»Ò³qµ¶¹Ó´s±ºÁÚ¶mµºÀ´½Ã´¾Äº½Å»¿Ä½¾ÅÕ»£¹ÃÉ½ÂÆ»ÅÊß½•¾ÆË½ÇÌ¾ÈÍ¿ÈÎ¿ÉÎÆÈÉÄÊÌÂÌĞÉÉÍÃÌÎÃÍĞÉËĞÄÎÒÅÎÓÆÏÓóÌwÇÑÕÈÑÔÍÏÕÉÓ×ĞĞÖËÔ×õĞzõĞ{ÌÖÙÑÕÕÓÔ×Í×ÚÎØÚÕÖÚĞÙÛÒÚİÑÛÜÒÛÜÙÚßÕİßÕŞßÖŞàÖßà×àâØáâÙâãÚââÛâãßàåááâáâäİååŞæçßççàçèàèèáèéâêêãêêæêêïèâæììçííğêåèííõìâëğğìğñíññóïíññòöğêôñïöñíğôô÷ôñóööøùùÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0¿\0ÿı+£\nD*\\¸d=xä°qf¡À-j8Ñ¥H%2öXÜÀ‚‰š:X¾déòcŠÅ7®ÌÁãe\rš4cTXt°ã.mæÈ©#§ƒÅ=Œ\\!34Ï8!,Bx$Š˜7w	òÄ¢•Cª„q“Õ‚&ÿÍ° ›:R\0ÃNÚ<0Ñ„ƒ\nø¤µHCâVèçD‹\'&ĞY,Ğ‡H$ ,P†$\0pØ§@\0\0;','GIF89a\0\0çƒ\0\\AbL{tƒ~‚‰§}WŸc®€Lˆˆ˜ŒŒ”ˆ——‘—“—‘– ‘—•–œ•—¢•›¤Õ‘0Á“e×’0Ø“/˜¦È—_ßš3Ñ_¾¤Œ¨«µ°©««¬¯¦®·Ã¨Š´ª«¬­±Óªa¬³¼×®c­´¼²²ºÌ®Š¯µ»Ò³qµ¶¹Ó´s±ºÁÚ¶mµºÀ´½Ã´¾Äº½Å»¿Ä½¾ÅÕ»£¹ÃÉ½ÂÆ»ÅÊß½•¾ÆË½ÇÌ¾ÈÍ¿ÈÎ¿ÉÎÆÈÉÄÊÌÂÌĞÉÉÍÃÌÎÃÍĞÉËĞÄÎÒÅÎÓÆÏÓóÌwÇÑÕÈÑÔÍÏÕÉÓ×ĞĞÖËÔ×õĞzõĞ{ÌÖÙÑÕÕÓÔ×Í×ÚÎØÚÕÖÚĞÙÛÒÚİÑÛÜÒÛÜÙÚßÕİßÕŞßÖŞàÖßà×àâØáâÙâãÚââÛâãßàåááâáâäİååŞæçßççàçèàèèáèéâêêãêêæêêïèâæììçííğêåèííõìâëğğìğñíññóïíññòöğêôñïöñíğôô÷ôñóööøùùÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ!şCreated with The GIMP\0!ù\n\0ÿ\0,\0\0\0\0\0\0\0¿\0ÿı+£\nD*\\¸d=xä°qf¡À-j8Ñ¥H%2öXÜÀ‚‰š:X¾déòcŠÅ7®ÌÁãe\rš4cTXt°ã.mæÈ©#§ƒÅ=Œ\\!34Ï8!,Bx$Š˜7w	òÄ¢•Cª„q“Õ‚&ÿÍ° ›:R\0ÃNÚ<0Ñ„ƒ\nø¤µHCâVèçD‹\'&ĞY,Ğ‡H$ ,P†$\0pØ§@\0\0;',NULL,NULL,NULL,NULL),(42,'sty','login_form_icon.gif','image/gif',2059,'2013-12-14 18:15:36',2059,'GIF89a0\00\0çÿ\0j\\Aq`AtdD}bJteJ„bGƒbLxhH‹gM…iR}lL|mR‚oIpU’nS‚sW‚u_rZ‰vP–rW•wZšvZ{T{O•ya‘{a~]Ÿz^’X•e~a•ƒa£c™…^›†Y¢ƒe†kšˆfœˆa¨„n£†nœ‰h¦‡i¦ˆpŒ¢f«Œn¨Œy«u¥‘j¥’p”–“±‘s©•m°’z¬•z¬—o®—j¬–™›˜·—y±™~®›x¶˜°›sŸœ²œ‡µ‚´Ÿw»œƒºŠ¢¤¡¶£“»£ˆº¥|Á¢ˆ¦¨¥¼¦~»¥Ã¤‹°¨¡¿¨y¿§ŒÇ¦‡ª¬©³«¤¿«ˆÁ¬ƒÌ©„É©À¬œ·¯¨Ä­—¯±®ª±Æ²´±É²ƒÇ²‰Æ²Ñ¯Ç±›»³¬Ó°ŠÍ°œ®µÊË´…µ·´Ìµ†ËµŒ¹¸¯Éµ¤²¹ÎÖµ•Òµ¡Ê¸›ÛµŠÉ·¬Á¹²¹»¸Ï¸¢Ñ»’Îº©¼¾»º¾ÍÔ»Ÿ·¿ÔŞº”Î¼±à»Ö¾Ô¾•¾Á½¼ÁÃÊ¿²¹ÁÖÈÀ¹½ÁÑÀÂ¿İ½£â¾˜×Àªé½“ÄÄ»×ÂŸÙÃšÄÆÃÍÅ¾ÚÃ­èÂ–ÑÆ¹ÜÆœÚÆ¢åÃ£ÄÈ×ÜÇ£èÄëÄ™ÈÊÇŞÈÇËÛÓÊÃáÊ íÇ›ìÇ¡áÉ³ãÊ®âÌ¢ÊÎŞÍÏÌîÊ¤ìÊªáÍ¼ãÏ«áÏ±ñÌ¦ÍÑáçĞ¦ğÍ­éÏ³ÒÒÜÚÒÊçĞ¹ÒÔĞìĞ®éÒ¨çÒ®òÏ¯éÔ°ŞÕÎïÓ±ÕÖàáÖÉîÔ·ìÕ¾é×¸àØÑòÖ´ØÙãíØ´ğ×ºîÙÈäÛÔóÙ½ğÛ¶ÜÜçòÚÄïÜ¾İßÜİŞèòİ¹õÜ¿ßàêíßÌÙâêâàäõŞÇçáà÷ßÈáâìñáÈíáÔßäçâäáëâÛøàÉöáĞöãÄäåïòäÑíåŞëåäøãÒøåÆéæëæçòùæÇãéë÷æÎõçÔèêçìéîñéâæìîñëêïìñéîñíïëñîóóğõíòõôòöõó÷ğõøøõúò÷ú\0\0\0!şCreated with GIMP\0!ù\n\0ÿ\0,\0\0\0\00\00\0\0ş\0ÿ	H° Áƒ*L\nÉBÜğZH±â@^+L\0±ÂÆ\\ÌYyÔ*t,’%Ë#ØHÊü—Ã„\n)OØXr&N–\"FŞÍ©eÊ\n `üxâò:C+bsP\0ÃŠ¬züaŒQ)şA@CÕ­`d\"ˆ\0£È6L›P‚M±€5Ë–\rµpÙšÉR±¡İ„H(ŒÊ»7¹sçÈV4áÏa„H<,>¶7\\¸È’›óPèòA-.Fİâœ\r\\8rîÎÆ#é‚ß¦`Qİ¬óãs€Es›à<3›67öìyö&FÅ	òµX/_æ|›İZô+úÀ_‹ªşKãÛ\Z_e±0y\'Xj“«^ÇÆ“o&\rX*nëÎã´¾´ÿÒ(L,ªäÍ3Ş˜±ôB1ÇCŒ.£PCĞ;¨$Ò‰-¶tI‚aÅC	®è¢K/ºÄ’Ê(óôÌ ƒPÄ;‘*ÏĞUËˆ£¸â£+£prÇ@ŞèÑÅT‰Lì0ƒ- ÅË#Š2Š(œPbFi%ò…B\rdÇŒ¶Ø•9C4Ò%l6È\rÉd‹AØq\Z,D’ãPó0’‹øá7Üñ@ƒ¨1C”Î@*QÍƒ)NA=ÜAÊ¡ÿ¨AÅ	±C\'QÅCM0“HñÃdL²©@ş_PqDBLÌ@êPæœšêª­’’L=ÿ|Ñ	uaëLìL37Áø¹*Œ¬O=ùtñÅ	)zkEğLÃÌ4Ú@“N2yÁ+-éĞÓÏ>_¨a\'BvŒZ;Å0£M:ê¨=õÀ“5éì›O?w¡!	é1C$Y3K1ãÈCO>úğc±?şXÌ?ıø#løÂD\\aòÉW4ñA	2°„ùb3ãì{OÅşìÃ1Á<œ‚9°¡I+Â³K.°ä’KÑ­<F\r`;}ø2;òä³1Æ:cìµ×)„€CiàaI.Î´ãÎ6Â°	a4ƒR4Ë+àîËÏş>|÷í·ß?çÅ\Z‚xK4ë Í.¡¼\rF1D]<Ÿ|«\rµ\ZóSqæœ‡-8á–°bŒ8â,“Kãx€!7İ1ó\n4ÓLæúÔnûí·ÿ<v\Z‚XËè¥Ÿî¸Ü’TÏ,¾@£¼:şÜŒûóµë½ÿNºé¨Ç=wİ¥óI1ÊC3N?òàıóÒóî»1èˆããÃoOĞ,§0ş4üĞ>ü÷ïÿé„ï–AºÅ¡Nu‘ãŞ?2q\nmxË~›F>&HÁ\nR0l8œ\0a±t(~@ ë’4¼ÁÓ€3àábPë0Œ¡1H¶ÂqĞƒÑ^êˆ§@0c×h0Ä) }ÁcãĞ†§Q&Æ®\"Ø]õ€çŠ°‡éÆ,2ˆ.zqo@\Z¼@Fj Š\Zô.:øÁÆ…‡ñW7¬Q_øbx´c1> ¶&€ÁlÖ‡1t¨½šæhšp6àah­ĞÄ#ğÀ†”ÁÀbX4 ´\0Dh‚Ä 9ˆÁ\nM pĞ0 \0·9p\0( ¸|\0 ğ€,à—\n8€\0\0€â€B8DÚP†-T\nĞ„Bª°…2Ôá\0Å@\0;','GIF89a0\00\0çÿ\0j\\Aq`AtdD}bJteJ„bGƒbLxhH‹gM…iR}lL|mR‚oIpU’nS‚sW‚u_rZ‰vP–rW•wZšvZ{T{O•ya‘{a~]Ÿz^’X•e~a•ƒa£c™…^›†Y¢ƒe†kšˆfœˆa¨„n£†nœ‰h¦‡i¦ˆpŒ¢f«Œn¨Œy«u¥‘j¥’p”–“±‘s©•m°’z¬•z¬—o®—j¬–™›˜·—y±™~®›x¶˜°›sŸœ²œ‡µ‚´Ÿw»œƒºŠ¢¤¡¶£“»£ˆº¥|Á¢ˆ¦¨¥¼¦~»¥Ã¤‹°¨¡¿¨y¿§ŒÇ¦‡ª¬©³«¤¿«ˆÁ¬ƒÌ©„É©À¬œ·¯¨Ä­—¯±®ª±Æ²´±É²ƒÇ²‰Æ²Ñ¯Ç±›»³¬Ó°ŠÍ°œ®µÊË´…µ·´Ìµ†ËµŒ¹¸¯Éµ¤²¹ÎÖµ•Òµ¡Ê¸›ÛµŠÉ·¬Á¹²¹»¸Ï¸¢Ñ»’Îº©¼¾»º¾ÍÔ»Ÿ·¿ÔŞº”Î¼±à»Ö¾Ô¾•¾Á½¼ÁÃÊ¿²¹ÁÖÈÀ¹½ÁÑÀÂ¿İ½£â¾˜×Àªé½“ÄÄ»×ÂŸÙÃšÄÆÃÍÅ¾ÚÃ­èÂ–ÑÆ¹ÜÆœÚÆ¢åÃ£ÄÈ×ÜÇ£èÄëÄ™ÈÊÇŞÈÇËÛÓÊÃáÊ íÇ›ìÇ¡áÉ³ãÊ®âÌ¢ÊÎŞÍÏÌîÊ¤ìÊªáÍ¼ãÏ«áÏ±ñÌ¦ÍÑáçĞ¦ğÍ­éÏ³ÒÒÜÚÒÊçĞ¹ÒÔĞìĞ®éÒ¨çÒ®òÏ¯éÔ°ŞÕÎïÓ±ÕÖàáÖÉîÔ·ìÕ¾é×¸àØÑòÖ´ØÙãíØ´ğ×ºîÙÈäÛÔóÙ½ğÛ¶ÜÜçòÚÄïÜ¾İßÜİŞèòİ¹õÜ¿ßàêíßÌÙâêâàäõŞÇçáà÷ßÈáâìñáÈíáÔßäçâäáëâÛøàÉöáĞöãÄäåïòäÑíåŞëåäøãÒøåÆéæëæçòùæÇãéë÷æÎõçÔèêçìéîñéâæìîñëêïìñéîñíïëñîóóğõíòõôòöõó÷ğõøøõúò÷ú\0\0\0!şCreated with GIMP\0!ù\n\0ÿ\0,\0\0\0\00\00\0\0ş\0ÿ	H° Áƒ*L\nÉBÜğZH±â@^+L\0±ÂÆ\\ÌYyÔ*t,’%Ë#ØHÊü—Ã„\n)OØXr&N–\"FŞÍ©eÊ\n `üxâò:C+bsP\0ÃŠ¬züaŒQ)şA@CÕ­`d\"ˆ\0£È6L›P‚M±€5Ë–\rµpÙšÉR±¡İ„H(ŒÊ»7¹sçÈV4áÏa„H<,>¶7\\¸È’›óPèòA-.Fİâœ\r\\8rîÎÆ#é‚ß¦`Qİ¬óãs€Es›à<3›67öìyö&FÅ	òµX/_æ|›İZô+úÀ_‹ªşKãÛ\Z_e±0y\'Xj“«^ÇÆ“o&\rX*nëÎã´¾´ÿÒ(L,ªäÍ3Ş˜±ôB1ÇCŒ.£PCĞ;¨$Ò‰-¶tI‚aÅC	®è¢K/ºÄ’Ê(óôÌ ƒPÄ;‘*ÏĞUËˆ£¸â£+£prÇ@ŞèÑÅT‰Lì0ƒ- ÅË#Š2Š(œPbFi%ò…B\rdÇŒ¶Ø•9C4Ò%l6È\rÉd‹AØq\Z,D’ãPó0’‹øá7Üñ@ƒ¨1C”Î@*QÍƒ)NA=ÜAÊ¡ÿ¨AÅ	±C\'QÅCM0“HñÃdL²©@ş_PqDBLÌ@êPæœšêª­’’L=ÿ|Ñ	uaëLìL37Áø¹*Œ¬O=ùtñÅ	)zkEğLÃÌ4Ú@“N2yÁ+-éĞÓÏ>_¨a\'BvŒZ;Å0£M:ê¨=õÀ“5éì›O?w¡!	é1C$Y3K1ãÈCO>úğc±?şXÌ?ıø#løÂD\\aòÉW4ñA	2°„ùb3ãì{OÅşìÃ1Á<œ‚9°¡I+Â³K.°ä’KÑ­<F\r`;}ø2;òä³1Æ:cìµ×)„€CiàaI.Î´ãÎ6Â°	a4ƒR4Ë+àîËÏş>|÷í·ß?çÅ\Z‚xK4ë Í.¡¼\rF1D]<Ÿ|«\rµ\ZóSqæœ‡-8á–°bŒ8â,“Kãx€!7İ1ó\n4ÓLæúÔnûí·ÿ<v\Z‚XËè¥Ÿî¸Ü’TÏ,¾@£¼:şÜŒûóµë½ÿNºé¨Ç=wİ¥óI1ÊC3N?òàıóÒóî»1èˆããÃoOĞ,§0ş4üĞ>ü÷ïÿé„ï–AºÅ¡Nu‘ãŞ?2q\nmxË~›F>&HÁ\nR0l8œ\0a±t(~@ ë’4¼ÁÓ€3àábPë0Œ¡1H¶ÂqĞƒÑ^êˆ§@0c×h0Ä) }ÁcãĞ†§Q&Æ®\"Ø]õ€çŠ°‡éÆ,2ˆ.zqo@\Z¼@Fj Š\Zô.:øÁÆ…‡ñW7¬Q_øbx´c1> ¶&€ÁlÖ‡1t¨½šæhšp6àah­ĞÄ#ğÀ†”ÁÀbX4 ´\0Dh‚Ä 9ˆÁ\nM pĞ0 \0·9p\0( ¸|\0 ğ€,à—\n8€\0\0€â€B8DÚP†-T\nĞ„Bª°…2Ôá\0Å@\0;',NULL,NULL,NULL,NULL),(43,'sty','posweb_header_background.jpg','image/jpeg',765,'2013-12-14 18:15:36',690,'ÿØÿà\0JFIF\0\0H\0H\0\0ÿş\0Created with GIMPÿÛ\0C\0ÿÛ\0CÿÀ\0\0\0\n\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\04\0\0\0\0\0\0\0\0\0!1A\"aQSq#b‘ğBR’ÁÕÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\"\0\0\0\0\0\0\0\0\0\01!QÿÚ\0\0\0?\0ö!€bi¾ì½bÏ4·fD>L5±4²n)ôkÅ\0™¡ÎPW¤Ãı?@’\ZI©ˆ±ó+¶XhÁ\0Òµ²6\0ØŠ[$@ƒ*&*EC‰p­—½ÓõDY!À-—HÀâDLÔÏß4R\Zè©¹÷AIÊ»4\"1Ÿt	¿D€ ^Şh\Zs£<îá™)ã\"$OÌï¢xHµÍ\n:±bÛD¶6½Òa9÷sQØòİËÖVğWhó?¸òÛ»¶Ğ)âÿ\0I„eİíGşrOñ¾ˆû3úq“tÏ$L&._Jä¾¸â[~Šõ¯ù?‘@…îÜh`@¿k.\n‰\\¼mmw?Ùªµ6=¼B†ò2!Ï™¨o[f¦tÅæ¡ú@2\Z4¶Nr{gOZ\'8zŞ×1mDÆ6OÄõ¤ •äM	{Æp±ñ‡ûYp’5óŠ*u‰“ñô£”böE£Y7Öü\\×GO£Wb°Ş\' èËˆ,o¦-ŒCŞF)¯¨»\ZÑÏÊE†³0)—¨(F‡°Zm‡²£(ÿÙ','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0d\0\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ö*(¢ºp¢Š(QEÎm_zÛß¶ÿ\0â¨¬ìÑ]Î=nvC¿ŞŠ­¾ŠÖÆw+ù”U_2ŠÓ”›•òh¢Š²ÿÙ',NULL,NULL,NULL,NULL),(48,'sty','top_background.jpg','image/jpeg',28986,'2013-12-15 02:25:28',1130,'ÿØÿà\0JFIF\0\0H\0H\0\0ÿá\0ŒExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0¬ \0\0\0\0\0\0\0\0\0\0\0ÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÂ\0\0¬\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0ú¤\0\rDUóç²å¡¶à\0\0\0\0\0\0\0\0smñ\\F8}\n*ÖÛåY§ŠÊóØW(Ì¬-*“9ªLã\0´ªS™X‹\nÂÂ°´ªK\n‚Ø¬,š‚Â°ÌÀNsX‹\nä²0‚Üè„·*“.f€—+ «’N\"3ÂëR—)FwqÛˆ¶8å3M™ÒŒ¨æoË}Ş¹™ãRZ”ğKæ­z›t»U,½;–¶*±9cFHÌ²“<LŠpn¥hŒ«ŠgÊ2i!=ê>{úçœpâ¾“ùÇèJÑ–øçín“[Öy|ÛÒy¾[ÑÍCœÓhß#Ïç\rÅœõèêÖä);½^¯‰ˆî|“Ş|7ºxÇ³ŞåvW®º0+Í€„1! !HA0LH@I@A!„LäVgA&Q\'8³>¦®+˜Ï»Õêñ«“OCs…İùş§_V_ï|õš–§.ß­óK&ş¯¬Ğ=~¤óÍrûÕé\'»rï<İ©·ÏO\\NıN?c3“›ë»=¦kê#wbtL<¢·ähl[$İŒL¨Åš\"dH#¢İz¿}cÁ¹ù{zùSÔæ}J€×~uq.u~¨ˆĞ½°£ès[gÃœŞ^KG_@CœñWøÌyû?qù3éDõ•Ù_GFŠ`¯0\0L0ÀL\0L0\00\0\000\00\0IfLYŠiŒ…1©ÅSæ{ï&ìmÃİWËW³˜)ØLköìG6ºªßÇO3WNêb¼í]Vhãsëu©çgeF×ôİ.½lûº÷<æí3ô¨àZ‹nô;:zI2Œ&è²oŒÕY­(….ó¾íÿ\0ªì¾Séz\\ä½;®ŞsO§æWƒúü	Ã¸Ãj·¯çï |,yAóm8}BWg_h\0\0\0\0\0\0\0Aãü>	òqz¶x§µïĞWezi£\"kÍ\0D0\0\0\00I0\0\0\0LL\01!\0NXÈÎKDŞúë”bEsÏ¦ş%°ömO8y£ªÚñİe[»3µ’Ø±*,6†µöè¶ÛÚoI«Öû$r}zN\'šÖuŠN|í=W#êf(fba9çNI³,ØÕo[E§ê‘ò»|û¬[có>ÎáÜ°ûŸ—nÅí½Œd6\0/\'Õø†ÛÔwZ,p÷NÃç&º:¾„]€\0\0\0\0\0á¼¾2Å=¦©~^ãÖ>böİú{™Smx#?)èH„AáDdvÑ vQ‘ÑxD% vÙDDáD„½:ù6Î{w;Ò¾ã9ÛSzÚhÇp’QllÕf—èRPõšÈ67\0•»}–Ï)\'VËÌ:$õ§|ÏXsó»ò~¡Å¤[ª¼Õ»]Ée„&o²³TÅ5Ø­O=4ú}œ©´ñŠtí­Òµ^}Œëƒe–ªSêàiêò¿2ı_ÇáÏæzn«ÇóÅ?VË’¦~›×|ûºÓo¡ğî&ÖúÅ?ş‰µûG¸?«›;šÓµÒy•U®ÏÏ»Ó<´»Ï*÷+éæOhú}vi7Û_/ŠLü[ÅÁ‚€¼ /’ò€¼ /ŠBñp` /(Åä¼ /(Êò€b\nò€¼\\•ÂòŒM¦ã•èî9ı¿ µÓBÑƒ´)ØñõÙ¢êtİ[jÆŸ¾<g3Şh­Õæz†‚täŸq(†·<+hîöyÖF=7AÄÍqíòå6ßÎ’c=Ñ«ºeí¯1Öx>±Uùüï¡G!ßyÏÓùncT{^%ÙQx¼—‹‡²§¸\0Qt‡	ä_Lçó¿	ôº5§íúí}í!¦Øx·¶‡ë½—ˆÏ/õ^¿ —‰ú÷NZåvĞ\0u|VŒ¼&Eàd\\…Ái‘pbV‘x¤`ZF¦LÂä$Ä­d\\“äa`dXYÖÊ{49í»£TÆ÷]ò½ZÊØËÀ¥Ö§î,ËšT}M;8mƒ]~]Ç#ÛkªØÍG|ºüµB1Íöâ‡å|øö%´ò+ÚÛ¿Æ>¥\nÓáúìyO¦h¼ÿ\0K›ËsÎıÆ4,[EA¡`dX=nU§OcU:Øo£Y˜ÕšfÎ‹W~¢[T¬uu3ƒWéğ6ËÂfıY)cEØ]ÉİUPuÍNâkâ‘DgóÌE2.JÀÀ¸2,Jğ3ƒàÀ¸1+0¸1+°3É|¬@À¸0.ÂàÌ.ŠÈÆJƒµcıw’i©Ùî\Z¿2¿{ØÑ]ÓÇ³Ç_\n¿‰Ø©LMÕ£iœïªrì\'¢¯?ïÓLlğ²¾kk¦(Ëzç£U¥bpcôëz_óZoµô/=ä&üİ(¥~s0¸«\"Ò1…å§Ş@×è¸îÄ*\0°\0\0\0\0\0\0\0\0\0\0\0\0\0X2ù¸ \0\0\0\0\0 \0\"A$‚°@\0\0\0\0@@\0	€@à	ÕêBÛ/¼¶¶yà	\0B\0M€K0\'¢Ê\\\0R@€Lê	İĞEv\0FY@\"@A\0Oª»¿ÿÄ\01\0\0\0\0\0\0 !\"013@#$4AP526ÿÚ\0\0ø$^Ä&Ÿ‘A½?ØOä«gÃ¶9^ª<$İYÅÅÅÅÅÅ\rÔ;7PìPìPìPİC±C±C±C±C±C±CuÅ\rÔ7PİC±CuÅÅ\rÔ;;;;;;7XíPìP%˜ØÆTÌl\rf7P-‚· JPÊ³õŒ¬eaÇ–Ñ6çade@Ôd;Ö`ÖdF˜‚àØ÷Y0=ÉƒkF<¢æéÃ	Y˜ùŒ}F2dÔ2¡²š‡Ö¹\r–;7XìPìPìPD“\"õ¸±Lr^šÌ~ÆYãU°ç\\m›˜KvÅ1’ÔW?OşFFFFFdÇ`ß#`JÏ¦rGcoL6$3-+$¯#LŸP{-6mGm-øµU:V^ÒŒı	åâ(Ó…ı ÈØdgå°Aú±·¡ƒû-Úªw)w”ÈetñŞ¨¥¦¸UšæYôÈ…\"k[Şûl‡ä7‚²°‰6Ë2ÖÀë£UÎ+76ª¬(Öî{İ±Õµæ’«jmš¶ç›õ/Ö\\±ieO]Êb*îœG.ôsôÿ\0uÚ’GrH¦È¼öH{£	§·(ÁºIHÉ%jhãYjlËC€ŒX«ûG¬*Òâl©’ãöp^\"‘-É„Ã‹ºa!6Í(ıÑ&=ÄY½´Hí>¨ş#†ÁÀXñHÂÛ	u` •Á˜È3öys´¶N[9HÍ£Î®{‘9#×–êN“Ö0%KTŞ!D¨7_ûò¤8í¿qQ¤rÌ™–ğ9®96e3êö\'«]‚ÍdôYN‚§¢Dµ–¶©}àîãñš‡$Ûú9úñqˆÏé¯¤ysjJ¬‡=À‰r.qnx­@rH‚ÁÁ[“r’æf£Qù†Ÿ[\"- yâ|ÔJun$ÒMÖEé~²#R[V²ş^¤X>#R‡Õ“Çê#Í—\rºÊö£‚˜%ú-”8Ò	$À‡ËÔÈıâ›9D›VìiXˆ®MvÜfİ—iVİ£siÑ1ßjZši¤²ÔJFb¡š5FKÕ~L8i†JªAÚZU&Ğš¥\"•\n\"`ÆöFü¦\Z&PÌI1)™‹r*Øz3¼d‘nÔ)1¦31!ÏÓÿ\0‰‘¸ÜdàtğÒì4*âbu{l%€ñøÉÄè®¨ÏÉúÜÀ2@Á4lÂd­§šµ7<yçˆ°K[IÊ<f}^«mù·jÙ%ò!ø¡¶}6±\\’ãQNm™¹›ÉŒ\n‹\'¦7üÄÂ”‹f\"ôÇÁÏ\ZK´EJíjœ–ÿ\0•ü,´“aUûâu¬¨’b¸äâ:Ç,GiLñàçéÿ\0Ã\"ÈĞhc\0ğj0D%ÿ\0!öšU=ƒmU*É&Ú-ĞhK‘8vŒ-ÇO©ÆzÛê3#¤‡Q²az¶].ÏvOšàÆ¬aÈ9–Í¥voî«ô ÑÌ#2IæUæË«#‘@p[+kX¨Ù$\r@Ü‘¨ufØ²§YO9ÊòbÙËHDëÄ¡[\\l­Â ”ë!¡\rKÕhKˆv®®Ä<lùÿ\0Ãé‘XGì9|˜¶3 2‡eB®¦fW£Ÿ§ÿ\0Ø\Z½Ğ¾aÆ{\ZO°#\\WiXCÏ¸\ZŠ¢\r°`¢\Zm­S®F£Q¨4üÍÍ˜?:äÿ\0\\9ø	\n|ˆû¿%\"?Qøì(G¨… I\"UçÀXØ~A¶FJA¶¯l‡)vv/BíilKbIFhÙQ#!)\"õÇªÔ–Ñpí‹*bÍeqHÊª·BÒê>óÏ·«H»÷„$PÌ¯W?Oş&Ã>™õ C°ˆ§!·ÎC„ĞrÑâT{Ôq¤-a¬ƒ2!…(xë0Û_ÔqÂ@èSÆÛz—R…Qe‘!¥<†™Õ\na*{ê°ìcqgfQ¢-„²}—†¬]İ_[DD`Ò×Ò¤e.Ô!g«¢Ğ‚F>)ÔÒcI™Æ.ÚrœÑr÷[°ªÿ\0?w8…]Ãº}\rÛÃâwŠUE;®Ïô’f˜ştçHtçÈ|çÈtçHt‘çÈ{ãÎ<éÎ<éÏ<éÏ<ùÏ<é#Î<ùÎ<ùÏ<éÏ<ùÎ<ùÎ<éÏ<ùÏ<ù#Ï<é#Ï<éÏ<ù#Ï’\nt•\Zò ¨d°té0š¤ j–IsŒyÒ{ŒVMG)i\"”êÏ’=ÊP÷IB¹æÛÚŸ°µj˜Šu2ÒKPT—IE&Y†|–	ÅîPîPìPqóH—|â]>LákØr„‹ÖZ$Ù>¡îG¸Éã({”¡îrıy=—†j¹‘*\"$¿nÅ¼eWØ×OjÆ³‡ÙYQò¹a.Ï—s[;hë¨¦Œíœ™“ƒ‰õ9bvQ„¿ñ~Ö}sösé‘ŸLŒüYõÏÇç\'`k\"ÎqK?L‚V¿Ï\"*cÙÁPïoR˜óa7°{U_tºEÂn¢¨9nÒIÇ×(£‘6K=’H\"°ØnC³ ¶²1fášdBZ‚êœ3j­Ä›ÔÓz–~>M!¸tñË0¡qÈ7\'gÇĞú¦\Z]us<Ûrä	°äk“9><O[îØuR-¡Å‘×Ùºÿ\0 ƒø¶çü‚;DKXänMÈ¥D°®¿mWràÔVé­OˆËvìÔ8û—\n¯Ü&‰°Øddddl22226\r†FFFFFFFFFFFFFFFFFFFFFÃ####\"*ğş~fx)RJÈÈ5à›í–¤Ñ+¡äô½‘·ÊEÌV—È]3[ÎÉQ\'è/¥-É}\nEÜ¤ ï\"ê:Ã2[L œ[l2€âµså¸ÜvÑÛõ(l}f\r“Yô‘!\'ôä|‡Èdl26½m+¸ƒÊj$?\nÎÎ!Ç«ky4;›\Z¨.XW;\\\'?,ß¢ä\rTº|¾E®¬—Î]‹MÛÆxü†¬­¨¤±kŒ¥\\ŠDi<&{¼¶\n»¾;I™Ú+«dÌj¢Æ«™A•‘q?–—È))êTÑc¢a7ü=†Ãa°Øl6\r†Ã#a‘°Øl6\r†FFFÃa°Øl26\r†Ãa°Øl6†FFø2s±+<¶gƒØ8ş\'+mäšYxÚ–ÑÍ#ÿ\0IiJ’õ<\'Œø~dq–DŠ”E’ºô©Æu·Tá%¾¨Í¶¥6¦Ûm3ÂlLÂfJ<wòÁ(:Y&\\ìdÕM­A`H–ÇŸ°Øddl6\r†~˜nBE¥$—¥ñZÛËI·‘ø¤9œºW$Uå¼*6ù3îq^+Sü;é|-â.ÿ\0‡çÕ\nYòş_k˜W1Ï¨nåßÖŞÔ[ÕòjÊ‡`HB[O¬ßğò223é‘ŸLŒúdg×###>™ôÏÚÈÈÈÈÈÈÏ¦}r2¨Øy*L¸§·pšK$¢\r¼¦¹ÏH&ĞÅh+u ÓhÊÁ>ÓƒU¶ù.¾ŞRM…dÁ\"4u™ÂeH“UR^¤Bœfñ]ñûA¤Ø4˜%P%4µ”Ê\n¡ÔÉA$’á$)ĞÅj]–JôÈÏÁŸ³Æ¡òF8ÿ\0­âÅCÂw›…¨Ó>Õ7ç½ÃÓ[s}Âêy#µU,SDøç…°Ødl6Œ†FFÃ###a‘°ÈØdddddl6\r†FFFÃa°Øl6†Ã#a°C¦ØfÀ°Óix8œf*Ÿ7\r-µÓ€¦æ–*Œ„ùJl´SÈp™T$(œiCCPQ\ZA˜‘%’ì×&½\r*e¯œÔÛ25ŸK+)šŸZÆÂ$³… ×ºr3°b¦_¹ŒM¯a‘°ÈØl6\r‚%ªKÊ°Dt¦Í…-\\W¹1ØÍœy	rÙ”5îM·*%¥ËÛ}±œSV,<‚³j~Ñ,›—Z4XÇp{´b\'îZn˜Ù)ÇRÑ´cm©ì<†dªÂBl’s}æ)²s˜J¤Z%<ÿ\0°ÈÈÈÈÈØdgÓ##########a°ÈÈÈÈÈÈÈÈÈÈÈÈØdddddddl6\r†Ãa°må2#¸‹VÊ“bÓ©ò[Ç’‚íá±úvî\Z³Òd>²yÔ“Ò^&Û\'g.$40’ú#´\'#\ZS û‘°È5£±NçÖ‘#Eh;xü“R²226ŒŒŒˆ±$Bq5KR™e5‰¯¨sÁf­Ô°åR‘\\ºwÔÃõ®¿21¾nI¬yå1^qç1UÖË®5	5¯!Ç©ó~¡ç\rÊÎâUSæÉÃ[“æDyéŒÓ,£{T’:ÈNB\rÃy·WTeFš×ÒòklçªFFÃ##a‘°Ødl6\r†Ãa°Ødl226†Ãa°Øl26Œ†FFÃ#a°ÈÈÈZÌŠCË²•é\\†}™Ç}aµä¶†ÀÏ# œ1±4$haÂúcG&Óù<Œ‚Sf¹Iy†A«äûŠ¼ê&ÊtÕ2·(%C#a‘°Øddl\Zaç“éaÿ\0ès\'õş#ûåû“ü<7ùøïà?€Â¿ø?‡ı¯úx=ù\r~Zö?ßÿ\0ÌÿÄ\0*\0\0\0\0\0\0\0\0\0!1 \"0@AQ23aBqÿÚ\0?=”¤şŒ¥(¿µ²Ë6,ãµlü)‹šÙ#SR{.×İ®ö×l·\\İ!Iú%iR/flù6zY³ª7|1ä2¯^~ãtGÃ¦Ò³¦.§&«…şGKÓcÆÜ%Èæ‰;vG+^Å4ıó2GåF²«>sç>oÏeE#S”_gğe—:«ÔÕ2¨ÕP’BI\Z¢Uz˜¥|}§=Ú0s2ø®ÏúÙF¦‚‹ü4ÿ\0ˆò*¡N&ñı—}‘e³¥ÃÒ×$¨ğbèáÌmaÒenY8ÿ\0®8a*ÂjkÛ%~Hº•ıîVB«´Ø¾È(AÜDèr²NÊì•‘Uğj†’õğ$z0õ%ååDú<¸öü’ö.ù$½1¨Ú¢2¿R¼¶c’ô‡èŞFò7‘¼äo#yÈŞFò7‘¼äo#y³É#É#yÈòHòH„X™,•èòHòHsg’F\'*ù‹ïi•®şL[?FKÇüÿ\06<Îäy%û<³ıöÉK‘ÁğŠxÿ\0\'–¤y$ßÊ)É¿Cœ—´,’ÿ\0±å¹\n/\'äP—(ÇG’^¾ŞÉ!rc‚2cÀÿ\0$qÆ%£ƒRMÄßöJfÅ>8J\nZz:¸K/Íkèè®ÇÙ»¶$—¡Å?c‹»:wŞ^ŸÛİ©*d`’$ğm¯¿bÌ…4Ê~Ó5¿e6dŠˆØ¿fÉ>}]	l`œ1ãœ_åa¤«ì¥é–Ye–Ye–Ye–Ye–Ye–Ye˜§¯É–¿‰äfìò1edz†,äº8%‘³cdÑb0õ:Ã“/S9z›öYeş»÷÷˜şD—Â½ö—ÃÒÿ\0aÿÄ\0+\0\0\0\0\0\0\0\0\0\0!1 0@A\"BP#QaÑÿÚ\0?ä×{%Ä:ù™X×e\'À’ëDÍ;\'X\Z+ÌUî³–¬ÒÌwYÓÔwZù.ù>ÚSÍ$1æ«+\rŒÅI(lŒ ¯*Ñ‰Ô…bë¿#µ¤ÊºT,¡PT\0ª•ê¼ª7^Fê¹2W*T©ÖQ¾Æ.i 4m´ìDØ™º©åÆÀ#³ı®üT‘æÄô>½¦š7Ù&Í¦UiäU*«¿ˆÁæaı?ÒTâ0O‘ƒüBë^‡‘±F¬Rk¯­ÎC.©„l<«ï:F°[(åd­ÌÃc­ìÍªÈvTYí|”Vsz ò},ÄzAçÚù, Òÿ\0k!Ù1ºùDÖ¥E‹Šg–0©$dCê(k¯IÑZ¾|Fyã!±šÂéMÈI\\4|Løöìäk%”\Zw@² ZnĞe,¢ïÌãœiö¬8‘Î=Ö\n[õÎmÜèôÑ4M•´S¤è|t¬pôšàñ˜~-ñ¶Vä~Ê4Xaûc¢Õ«ëŸ&~k¥(¶cğ£ÄÿÄ\0I\0\0\0\0\0!1\"2AQ‘#aq’Ñ 3BR¡±á0PbrÁğ4@‚¢Csñ$SÂ%cƒ£ÒÿÚ\0\0?ô.VTñp5e\"´4¯ÊnçFŠºŸÈËÉÌ;a÷õ;¢Â	KšZM‰¡ô	ŒLk1¬cXñc\ZÇŒkÖ<cXñc\ZÆ5Ö1¬cXÆ±ã\ZÇŒkÖ<cXñc\ZÆ5Ö1¬xÆ±cÆ5ŒkÖ<cXñc\ZÇŒk1¬cXÆ±c\ZÇŒkÖ<cXÆ±ŒLbc\ZÆ1<cXÆ±ŒOÖ<c\0›G²\n¨íc\ZÆ11¬cXÅî|cÖÿ\0tzñâ^<QüB|QüB|QüB|QséñG­şè×øÆ±ŒLbcXÆ&11­1‰ŒLbxÆ±ã\ZÇŒk1¬xÆ±cÆ5Œk1}şƒö\\HšÌ¸¶qQH¬#8 ™÷P^yâFV\0¼›)€†İ/­ú8·)[¿‘nlºä¼Ì—HÛ\"Ùì¦Ü!É†çÒÇ:Î Ğ/Á¨XmaeµX]6ÜªìûÙB/\n¼Œ^kø†—ò)[„6\\×	´t+\0S°·\ZãÃ+øG¬ø@ÓÃª5ÇÖOÅ<!NT¨Oiùÿ\0.¹·Ò\ner`V¹­;5ï?8·“›.OÌPÙµ™I\0\nuªî}2¹§Ò›n¸³[öÃèq¬Ëû=P™f\Zç*¬Ö€¸)™•KH¦ºWXm«i»8ªêÖòÕFÒ*LeäiW¦Û”Q%.¦E_ÖÒÕ‹iFuÂh”o†ßÀ«¸Ã)ÕY¼Ò”Ë§H´’•TIm¼êÍô®|s¤\nŒŞrÑm\Z+\ZÈİ±gÕ¶]ğ©Ç“š	U›\"úÂÜ–Z¤\'Ò2”.¶¿\n¡ƒ8×6qAµ&Îq\n!!Áò10âQÿ\0O>´4”LH_ñªìû¾ò#XqŠ•\n\r±­|cğ‚UiÉy‹[èªUdÅşÓåÀî<‹ö^x´\\OF¢Fíd(\Zë@¶ódR¢ŠßöµŸ_‰ØV…ö,F#ÆŸ8Ô>$ùÇªYá\0ĞŠ°Õ•Q}ú~‘z“ŞT`^×„ùÆ\r1¨?¥f?ÔOmñì¯àbıüƒÎ%«r³.›p\rERÒÒ| ˆj]-¸òÚm.<ğË\Z\r¡KÎ1).Q}ê[B.¨ª}l*Y\"Á\n#İ\"p+ŞÂ*bq\\Íkç\n¶—*0@>ÒBûŒK‘†l|£%v˜èåÕ2‰tY¢H\ZJúDÜŠÒPRm¥\'gîè¡¡Ïcó¥s•¼›(r”³İªLªæ\Z³ÍÁI¶\'¥\\¹Ép±H—ÊR\Zù´—[÷®‰§ÑueÓQ¸ßÓ‡NU§Í[ıbjjZÊÔ–Kˆ®êÃã4ó+•¤ÃX¹Öí¤°Sğzãy¹yR´7_õ«hu\0)Ç•]ŸvÔX·_\0¶hhH­kòA\n²\'gD/ŠW~Â\rPÔÒº\r…¥Tİ\nRÈH¥`OæŒlÉ‹É<¸Õ;ŒY&×QÇë\0j—Ãª¡6”£xëìƒë;Éÿ\0ó\r…Ë´åT€a)S2ô7ŞÂ<¢«“•súP)KK÷şw-^qê;_œ1, ú\\w\n:¨ÌµjÅ²tap·E÷r^˜÷Ñ×›7m–Ï°\rÛlL8eU-‘²2ªØÊÌ…,­Éi‘§*ªİNªİßU%Œ’…çB¸¿gbG»Æà]º·eÂ„­JAB­\'màâÙ˜EÁÔc%É×Ü¶›7ÒèKiÕH ‰–êVÓæ¥\nÀFm©é„3±]¯j_¾ØrŠ*.,­J0™àµ%À›$5iÅ6[U SaçÜ˜y\"‰+¦Œ%”’@Úq14ğZ‡8E•\'d!±xBBbaÖ´sÂ…;!r†®´ºÖÔ-\n˜RåÁÒ‚±”%ÉS™6Ãˆmô\ZæÉ_âŒƒ8ÿ\0; K=­U…\n¹ßUB‹.¥Ğ…XQA­îEv}Ñ‡ ³Õ‚7ÄĞZPÑ0«F±Jßìò\\‹¡YÖ‰J‘B`êzz¦PR¬ƒ}/’_£?f”—»BÊB•\0FªÀ\0Ó[ô1‚îÿ\0¸#Õ#ÃÊ‰’ãI Ùë¡”ï&ØTm‹N8–Ó×R]\"½¥{IîXHüwÂy)C	öğƒD›;ãÛûœ`:Ê\\Aq[[Ö€§\0Cj_7tZµi§-…m=Æ2L«KS|Û&JŠ\n÷›nbşnèi¨$\n|?‘É’¬è³1k8kL\nOéâ™6â—œ™bÓ‡m\\ÇÃNşc0mÛS.›E!–ıšï¨ÀDŠ/ÍhØè¶Ş¾Ev}Ëw¦í1°bŠ%kÚ •QVJÍÆø·¤”Â’´Ûl|!VUÂ´X†›Î¸6@»¶1\0c×¾&<˜F—ğ…¡½\ZVna°7\ZÂ+mĞŞ•œá¿Œ_“‚»ÿ\01Òd²M)P¢ñŠ/%N]uR‘y¼ã`{ÍWõ\'Vßæaqük_ÕTÆŒä©ÿ\0æ*ßU~>–¢ğ§™RNĞ«Ô˜´	í‘ƒkjÑúÂK–G³fã\Z+m]Š‹K£Tà$Eş’’°’(A…Kd¼°„ Ú\r0ò-$ÈQù\nÃ³ÕKrŠ•T©ÆÙu+±ıÇ¸AÉÌ$)Óœ}×Pn&Õ<ø\"Ô“Œ¡Srï\'2°3–MÃB;iÌ ó‰ë)m\'Ù°Õ’Oe³á†šÊ<ò! ‹,—6VšÇ´ò«³îÅ$\\T1W[=ğ–TR]$š‹ãCtièÕ¬[öEä¿Kª(ÚjwÅ§4ŒL*›iÈ;y…ß“ø@”êäÒCv+uVD\Z´Ò¶ÒØWéÎÊ4@P!	÷h>–—Eh˜Îº€´l1˜–c0ôÇ²*¥“\\kĞÍ+~Èµqb>ÁJQ¢@©0ŸòY)Iü„æ–i¹z½·ßº%İRzD6àxôŒ»‚mo¹DåcÕKsLÓ‹®&Ê–xJĞm%B ¿n§XCiÅF2„ËƒZy’Ë„û®Y§UÑi¹U>äÉ¤¼³xº‹EDªÅ¢nÛHÎÿ\0ˆÚ•”–BÀ–ilY¢¶kwf<ªìû³KKnÑí1 İ?¨ùÆ\nâcÚñµãWœb£Ú¢y4S˜;lÅ5èªÍ:£DS‘jÚTy,¥ÌÙß\0)EJßßÛÂE­ôŒA‹UP?…wpZ³ù¨ai:V¶HxîµúÆ(0ßèî‹¹{bÂÓœGºb¬Ÿè\\ö’½Èà>ÅÙ\\˜ä³òn9æª˜--•ş\ZlÛù¶Ñ8Í’‡s.Z~ÇiÕ\rì‰Ìë‰Sm£6TÕEKª°UÃç\rÊÎ©!ÆÍÒånt{$v·fM•k0®ô«\rƒ¬á\r¶DÎ4‡´jW¤š(³fî³¿V$ƒ‡Ô¡Ò³ì¤¬\0Ø!…e¥lJTËÉ°á]}¥by]#“·à>qŠ<Î1oÀ|ãü\'Î1oÁõf¼Î1oÂ|ãü\'Î1oÁõŒ[ğŸ8ÖoÀ|ãüÎ1oÁõŒ[ğıcü\'Î1oÀ|ãüÎ1oÀ|ãü?XÅ¿Ö1oÀ|ãü\'Î1oÁõŒ[ğ8ÖoÀ|ãüÎ1oÀ|ãY¿óŒ[ğ8Å¿óŒ[ğıcüÎ5šğ}c¼?XÅ¿Ö1kÀ|ã¼\'Î1oÂ|ãü\'Î1oÀ|ãü?XÅ¿Ö1oÁõŒ[ğı`\nµà>p§ÙÂ=ìğœ\"‚‡º1oÁõŒ[ğ}cYº~_¬R Wª4s}éúÆ-øOœbßƒëM¿Ö›BÔk?`aÇJ««®*âê<1¬ØíOÖ/RUØŸ¬^GÙˆÄpŒG¼ˆVmH³Ö˜¼¶GåúÅëÍ+ñFnX¥j÷öF³~¬bß€ùÆ³~¬k7àúÆ-øœk5à>|¨fenËI¿rf¥WÒ%{©L!É5LÊ¥Ä/C(KœÙ?61á·7”‚fåÏE”2{¸ƒŠV=ø.s‡ËÉ,<ãÈUú®]vÄ¶O›S¬¾ãù¥-«‹/ ‹?<bc eU‡Rå]—XÃ}İXİÕöª’˜2Ù;\'úÕûOnîÊÄ´†OR™ÜÃn/şÚ@+Yìı\"fl>ôttY”¦­6\nƒg\\)¦Û9ÃœzzqÎ•ãøR/§\\JäşxÔ¬²}lÕ¢ãîo±£w+nª’NƒNºº¸ºbU»‘ïÈ~íO¡e7ü£H×Ğ»Ñ¶òÒÚFøş \ZïŠ²õz’¨×Tk×¶+i¥İ…i7xÜbûIîX\"ãSÕ©VQº\r Œ#ÃÑİ*Õ1¤fĞoÚ}şÁù—W›C:eT¿º%Ôã.®ve@1+¨¥icdV&9ÚË­Ë%!I–l\"Ú^4í0ÙÉ³îÚnªÍ8³0İ0 š]Æ$æ›më@Øµ]4áÿ\01gh·4&:d[µÿ\0‰8~hÊHvEÔ°’âf¶T•SÚ0‰öòš+9“ÕI‹\'F”­±ÕR¦AÎ -´¤\\;á)q.J)W$L6¡¶™m/¹¨Õt•İnYüâ–F‰\Z¸üà²ãÄ8Ğ 2+HpKÌ´émE+	V©‚¦ĞôÚŠå‘lra3h,7KnlMbW&dàrò®>åée±íR“˜™~vp°Ú”µ@1R”FÂ\'Ü“EgæuCe”“@µõR´ë0–Ë.Ìú¦’³p¿oUxÂ˜ÊS3n©Zl©Õ0	;nµÆÆM°CíÛm™¦Âü6µ¾1/•ä™}aËs\rã˜ €¡^Å]Ùä(,)V†Úíä{ò»SÊR“vŞ[à†EFÕQ\0¢c8¾±tX¢…œmmä®ÈÍç3{©ó‹\rÙhîEçŒ-N¤‰†&«Ú1…‘QdĞ&”¼ªÒ¥@Â–\\%\0Ò”¬%9±n—ÚÛµ¢N1¢¢:±¤ê#\Z˜Ö­}yJ©X¾ª1 šF’øBÒ›”F5‹şÕÉI‘i‡)h×Xa9*]‘9PÒ_X{Äg?ÌUÍĞs³ ’aÏdlC2¹É¦änÎ­İÇvØkü=’ò;Bu=Lİ]·ÀJ—.€Ho1/4_àQ­\')ÌË.K)$fÕ0¶ˆjdaE§³l)é†“2d0úP´êŠÙÇ)Z_8ë-z¤Ø!Æ{‹BL¬»LK ô“o ^êTÃ³\"äÿ\06p:\nh’¦ğÂ¾ô9”f‚™IfUTĞŞnºÊS-8š9\'£Bwßæ#üµéudüâUR(å›Dæë~èb^jY.!w37*›_C—›iä°4Œ¨fÍ£ZŞ¥ÒÕğìÛM¶Û® 6â‚Æm$‘ZW~˜’”~fj{øŒ¡fúR}ÓšDŒê©ÑJÌ%Ä\'G°]¶&2ÆNNNœ²A\rµrT=Ó°ˆó<înM¥‚’Ş“k@<SºŞTZ”šBbÍÚO²¯{éŒ£*À}ĞQ0\ZË˜ß\r0İÍ´„¡Èÿ\0ä?/»‚„$Å9(Uº^ÒO»Í3[)²*ƒvíğ\rg&:½˜J\Zd`vE\nAŒ©tWxº5\\p\\!Å¶‘ÜÒp lc\nm§m^o¾µ6l¦µ¨‰wåb„ŸØ‡Y]l\r;P”Zd{Ÿ¬j6EJla&4ôP½´¾7üc\n¿(Ö¯Âmµ…ilßöö]B\\MkE\nò.q¹ûPB[Tº\\²6Ól?•§âœa¥‰>r,‚³†ÁcÏ2ÊÒœ]«Klm6önÎLÉ,<‡æ(p\r§«ÌÂòT…6²×7B.R6·“„Hd\\œŸıFwCCÄb^rrqÅÌ–¬Ì%½åâƒ°S¥B©\"„FPšÉÓ.&}ÊíšèK¼!J˜fŞQ’:m«â<ÇÎ’Ür³®1œl)4°àöÒvvC’™NQş/ ´Öå~*ì0f%äÓ)ş!j‹	Y³i\'Ú¯´’#œHgS“§\\I˜Í\'8p5Gë:¹Å;6”Øm(Mwöò¡!) ÿ\0ä?/»·¤Å’tNØ®İûà hÙÖ&(<•Oxß¦`œU¦vƒ²q)Q¬^ŸŒhºû¢ëÇUña\r¸„\re`LPJ¸Ú²õ¢”İNÇ–hµÿ\0¸R8E—ëP¼Å\r;a\n\"Ï².…»Vö#g\\_Ğû\"Å1Û¿Ò­(7ª4—lîL8‹7[1uİ‘|ní‚„S8\nŒShÄ$›Îfö†×f×nøuR,’êÅëYª»#üÛ+S«t¾%Æ«DüÌ9:ú¹ÔòÏ®XÔNÄ§pôS8Ï@şÿ\0ªÊó‰|©’Óeis¥–:¥*¹Dnßvv^Ó©¶…šBe¥­æ“ª²ªu_öí«å÷}Æ,œ7!v¾•Ç—pß¹Aœ÷œwG_\\atašCeX\nã„	§áTt²Í¯¬´–Ê¿¹ÑıB4h¯ÊbğGo%V{¢ÂG\r‘Eé£r¢­cî¿MM1d¥J#|thJ;£Idò}œÙI5I¾4xà8Æÿ\0–áÆvÑ´…Zp’u‡Ù<†)e£d­^öèH}A.\\fğ’` …Y  ÃiK•¶«Dãû-^A)»Z˜ÒĞ¢Qfİª\\M*‹&]6–›$B^t)º¦ÕŠ_×Bğo‡Wê‘ibÉ¯ï¢VTlg.I¼C\nBê4EÛb3š‰¶M.¤K€ÛŠ.¹b–MĞàRÈ(¥­¶¢ıV±\"‘R¢4ów¤ÜaçÛ\nw6«iM/Ù„§JÑöláÛQêp•Ú!%y»Òq­!Å%W6«*¨¥ğú¥²Û$\'\nqÛİ1aTh\n®›NÈÎ…(·bİ ƒp…ºYo:z“Ñ§\\s7K$DÇûjù}ãi\n)0J.y:É‚§z4T¨,¶ci«é\Z¿Ø˜Àÿ\0lW6kÖ®L\"¢èúòaÂ.\'’çê…`M:¢Òzãt_‡%¿Ñ›9Ôo!§}äü}hµ·_”UjµÖ¨²•ç¹¡F“Õy‹JQR·Ÿ²| ¶¶œp¸\n«Q\\aä¸°¦Vş¬áwÂ&Şq@¸êÔçvÁ%ê6´­|ŒOjÒ‘e‚ËtÂ»ş+,Â’3*AÒÁT‰ôgP¥L¨Gºï„<JœÖmH5¦5ï‡ó¡!°®˜Ò‘”,¸‘ÎPáOùŒêlæCIi)Ú)X˜I^’Ë–ö-Ì©¶\\%µT!ûÙ\':æéP%xß%JONò¯Èšhü\"`¥Äo!Ôã‚iqáÉ6w:´¿³M¶É39şÑZÓå\rÌ)Íİi¨n=ñ.ëkJRØP õí½±(Ã«J’Ó¹Õ~,S\0¥Æÿ\0‰/ß[÷p»„?mayÇ\në¶\'–œÕ\'vˆ9‹D›©Û¾&–¬ÓÁğ””ª´¦è£b^Õmõá\0^sjù}át]Ö”R±¶tÑ#ÙMÃ’ÿ\0OL#t\\`ÔFêôj’A‹BWZÔmå»)…Pc¦uk¹_ö6ÙPåÉß‘§óNşs÷ÚSéLr²OiÿÄ\0)\0\0\0\0\0\0\0!1AQaq‘ ¡±ÁÑğñá0@ÿÚ\0\0?!ø.¶³Û×àÕYf½@vÏşÑ¹¨äòÌÄÒ°Ç…=Ïƒ±Bı§¢?ªôWõz9ÉÓ™fşóõ:(ÿ\0Z~W®½ı^ªv;ùòßÍáÿ\03ÓŸÕéïëOêôö(?»×Jş¼Á÷§ö\'õ`7óÌõØù“°¼Ë´÷¥¿šYùbm·ˆİ¬ri›Vıø¥†¦=‚nB¸½cgŞœ·æV~A–8^ò/&`ù”ZŸ4ˆ,µ…Oi·Bø‹´oˆä‡™äz’õ˜~IAŸzzoÓëY\0:ûòçô¡‰c,\'‹LşÜo›ûı=GÈnüÈ‘2\rëÍ›æoË(Ğ×\Zïºåa@l?øQŒ)5Ç9\r\"Ê…¾ 2VLj±UĞv×vï“¯Ì&½I}n/Mô›õÚiÒâôÒ_~‡MºíÓ^–q.~Ÿ.—<ååù˜‰rÈ¥BÀeM1<Ù¦’ËYP´¦¢U©io&Œ€åıA-‘&zCw¡Øi´hÅxÏyU\'«í;l\n]íûÀ;eÑ\n¬‡šB¿+øˆ±­X_ìgh{éP¹2s\ZêŒÙ«\Z®#Œ%Ô».SYHÕÍj9ó7•çàÔJˆå·­“½C½¨Š¸å@æ,ö¹`ìmcMvÚ;¦ï%´\Zæ]â¢“_ÁV=pûAuâ,•ƒØ\ZÚQáù<w›Ç€­ûÀX¡©i\\¬|¢°\'›û3/mÕz§¼%Ño*„vƒ¹ˆ%]f{¯(~T³eŠíÊ~€6R²mÌId-zUì]`”LÃõ²¹·ÁÜëóXJé§FoiÖº*2ºmğ‰ˆ»ôqÑÛ©Òº6¼Ã2¸”;,mh°-KEµV7Ÿ:Y¨ª–¹PÁaKicŸ¬²nÄ«§‚µ·úŸ™‚5<áîŞQÈ™÷qíl«°€ø”üñÙR„L/7Ì2{¯ôY©÷ÛâîËíê~ÄÎ¬[ï4¤¸‹’@×à·Î?ps©{ÉG0>ò¶WÄœ¯\Z±\Z#Á\r…àfNT¦{Ë:*$úÊÄ×à­ÈğŞi²	W@½°z…T¿!zP(½\r½fDÁ…è¼EÍÆË‰5JÕ…1Ğë8·z8WÙCñ\Z›t×„ıG$GmCSWôË\r.ËØ‚\rŞºq˜]:·om1ıŠQ±]ï/Ê:ñjıî`ğĞRÚúûÃÕ ~K¡HQ¢‡óŒ›0àÇ1Ç—\ršåÌfWpöN<;ßWÌ&¿ğ`ß[ÍuĞø4>Ö=	}ƒn¡f-6©à•2å+írè\Z­Ã5—k\'Ú^e¶©ÚšK€ı»#Yx\ngÒ\rƒÏQ¸È²D€9™¢<•Ä^ eİ¹†áõL\0=;Ó‰x rcúõš4‘¹BıBZ¶%›ò`	«§#ÖÒ¼âV5%Ÿ**WhpĞû¤Õò1F/cÂ1ğ?l×æi~Õë®}%Fh¾PKPn7ZtÂÇ¼Óçx}ã$™näO]ÄKeÚ¯1¶\nb¢!)‚âfo*º‡µ}»GÊQœ¸{S0Ò™Wâo°)Vp—¶ìó‰…J–Œ:cHïÌ´Á.€h\ra»G.Ä·®Sz»J¡nx\nNkÂß­µ•f@*{şí4¤òëëi©‡€ıJºâÚ²›?\Zµ\Zÿ\01N@VŠ—ÅŒô<ñşançÄæîUWŞê»Ì6“ƒÆê#‰‡TC%r\Z4p:Œ…cXÂ±@¶õéó‰}niğ_K¹u5—Óyræ³yrı£õ¹}/­Ëép®İC/¹\"^t®—;ş‘×MŠ‰>4š:®îe7]|¨åcZaM{dÎÒĞ¸ÇÎ\'C*‹i¼9[Ì8Ó Ñ}Š¦‡ŞiÇLE{4‹?ëâv ˆŒtĞÀÅ¿$Ô½³˜£öP *0{ì²§}mykï.H\0YneÄÉÇ¤P;Ç(!Ì)×¬òø%¾ä*ÁÉ\nSÃº\0ßË2ñÉ\rÖ4PL\\qoæ;ˆù”>Œ©®7­–Rlõù· Ótö…&¨÷»Q&ö¬0~çÿ\0ÿ\0B£N“ÅnîËÌ–tmdŞöE^ea¢\ZDsaX{š¾z|Ã§§MzzufÒ¾NºOO€•ÿ\0@¨$Épx³T-\rDf\"àÙ”ÆtTq{°rÄ}K“Xñ3õÏ„¬Pßa„º5¼¼Ë?Ÿ£W¢:óË´Ç¢ù…Ú= \\ ,kÛt(óşL@\\_¤WĞî:Áê†ØgŞ-ö+&‰F%ÊõH5ílohùHo´L(ñúÄ¦m4Á\ZDáûâ]NM\'j¥Hkp!ËIyNĞ9µåŸê!b‘À`·Û‘ÈÉNÆIŸúdïtÜJŞkòõœS›?ÅL5ˆê3Lu\\×!u’œDe@‰[Éw…\'ğTgÚ´;wÿ\0áM‘Y\04}S—‡ÖÙïHHi›W‚I*´ëó	·FiÕèô×­Ã£+«ğ_[øw‡GS±§l–7d¦Äº™ó™{ïC†#~5ş\"k€“Ygê“7Mè‚\0(§Ä\Z¨Li®ñr¦{£É~cŸi”jg¬!.9EGvH\\º 1Wh“@pég–¥Ò´cî\"ƒ¡X}0k´B„I˜°ß/8s,è€öCËICéÚi»7ï=7˜è\\ÌÙ=PÕY?I¨×[—üœ“´4c¾Ëaò\ZG,û›òJ@_\'øŒ††Irî×YåeÜj£Ôe–F¼&pS…],Û:|‘ºY¸7¶É/\0ç ±mĞ·5ÁkˆšptîA2ÛA3,=\Z|õËv©kÌ%SÚ2Õ±—Ae:Ÿ8ÿ\0ô¿×àõø/­Ì|™ëL	ç/Ú3}nê Ë²l1W”(}Xİá5*ÇîÁS÷ŞP\"\r-ı–y¾Ó²;Ëúhœmİâôğ¡h‡Ú4j2ÁÕ¾}/*Ë©qOñ›¥ÍÑà´¤’tÖùJ>Êh¯ÖcìG%úOófo@y²2€ï1ëºÓ=òÀ¶Ÿb[¯³YHæ=!\Zü%Àı—Çµ^0>Œ\0ht<Æ¾Ï ®±3ïæTCªYLHº(¶«æZV¦s€?!æW„Ø›/`µŒX„iK4ƒÎCŒØîÕ\Zš™hâ÷\ZìÌÄö\0;Š0üà„Ë¾Š8s¡„eò/€-¬búÖİ‘eš|<pÌÎ]8`-Œ$_í>Å?¬ŸïşF«?ÓÏgõOyè¼\'ª9úÀAır †yéáª`ÿ\0q<ö®›:À§Œ“”³ÛÇ÷3GåMXù˜2Üª`¸g»Şgåv°CXZ7Sv‡Ö·¹õ‚\ZõƒÅåCœr};˜òÙnëF_e-—P´-Ä·D‹Œ´TeV*mªyñ28bY‚º‹qïù†â;„}#M}°¿ìBø,‹ì\"RàÉ÷s‚€h¸^Y€‘‘“ùİŞThÌùpº€ßƒqüÍg\nTnL³ı;‡Ñª9\0m-4*ÃÖ¯C+N!Ónõ›>YĞÇí‰µtæÖœvÕ5>—09µœ3´r¶-w¼1]P6m×V‚Ë™xâ^¼¦¢(M±ËsT)4h©õhæ¹= ÷gÇOÜñ.\\ô—Ú\\¾ÒåËí/¢åöåÏI¦ÓM¥ö—.xAíÔ¾İKí\\ô—<\'¤£Ä¹}¥œKí5³3s/\\ÍE¾!Û—{hüËı]¦†eöµ^%ßšf]öš´\'7Á¬.›.•Úeİì‹OrâÆ(€]—+Ì¾›én>u>±?¢ÛÂ×Öz£+\Z.QZÎ¼Ä°Ëx&o)Ó/x^à_ë8Rø—Úå—­ÍšÒÛ´Ñ4›ÃÒn\Za‰é	éÖ†„\ryĞåºõİ~ºÖµÙ7j‰|1mØµˆ§´:\r’Òò÷)½öÛyW’S#Œº›=í´Ì”¿‡ó»ÚÇÇàì4cY¼q=®ëÛYnDÁj­Zd«°ÈŒL”\nJ„ÑÄ5.MA¤x—û- k£šípĞÆ¢å@µ†Ó\ZÂK7w2ÜëR®&È4u¼Â*(ï$–rÃ	È7%ˆ5ä5 ir§j$[´Y^¹“$Tn­PŞ½)³f›m®òÛ_d¾¢«÷]ôÃõqÑN—ámzÔøJŒ£ñx?ôÿ\0õ••ê×štÙİñ…Õ3Û¢ ®eb`Yh«;ÂõwğL¹SŠÒ;âš!nJ‰30v®N¥´\\V\"¦ËÉù“Q4½ıb¡Y[¬pk\\(N•ó0Şóî½.V|6=W\rÎLÀÉ3\"g¡Ø5¸qA»t¼¥õSĞõ”IŞñà†ÀCÙ(Î¬Âİ\0¶“!U±Z«ô …ä& »dÂÃ¾/i~¥šÜ«É\\ez+)Ñ_€ô¬°d(wB‰´Ô®ÜÂjÁK}šÔ®ù0\ZSÀUw”åüå‚»­‡x[qkm\Z5ÈY%ˆ\'\"‹e#ÀSÁ0\n¤°î@Ì£P/¨i²s³pB|L„z\0¯XØ%ä‹±š&n¼Ënq/c!‹±—-²¤»ƒ¢£thƒœİB¯»®\0Ã\n×ZæR> t»û{Œ«Ú%g©Vƒ€·[ˆÚáİ@NRPnK~Ng	ì{WÁ\r¾jk†ÉàëÆÄ£)U–ÎŒ(ˆ)|È­Á ²ï4/æØ0äo9ÌUAº\n>?GËªø|!^Œ%=~NP‚0è¬c€Sákv™C\r£„ÂaÇAğ.¸\"D07±Ÿ2¸u«QÌ`æĞC6ƒik,ÀøÀ4vW1lÅé‹óx—çíMEÅ£‰Ø…Kò¥Uor<â7‡»¬ÀE(¦ÍæOF¼õØâ\rPd}şÒœ.‚®øÎ .*(Ğ|Ía›RíÃ«Cúæfzcv}>ùšsƒlE{	†*dÛA)¬»é”wWûŞVúZ—©ÓQ¦’ª3ÈÜµW~½‰õ!£Ù-Š‘±„†ÅèäzB:ôíĞt)ñğ‡(ÂÆÇ0+I¼`ã³[ÜÀíüæF’ûÄƒÎ…‚ê9¨¤ÑAë¸Ô]µoB*ÅEİë(f­v\"à®ëŸ]k×´\'8åt¨QÄÒÆ‘¸Ä—´?6®˜Õ\ZXÕZ¼›iz¥¾[[itğF?-bz\rZm–<f»h)ä7Äé7Vôå¹\"Ô4—ÏL}:ƒ÷ü§—GŸEŞóÊe.yO)ë<§”¾òëyå<º<¥÷è²yKï/¼¾òûËï/¼Yrûõ<æ[Ï)çÑëÓréÖyO(Õ÷DMgJ04á²4I-/‰Y-uz½+?[&ƒ¼´mùhvvúÄ[,ÑÎ=F•ª[ñ\Z¤7¤ùq$–<ß²[ÿ\0U‘¸Ä7˜Dkƒ/¹°ühÁõò“>F£Ë¿”³³ºjñ¦Ä<	§TVÓˆÛ‰¹lı6Ã·y^ğÖ¹ï0¤B_;·>^p†®ô¿xº¥tĞ;#SÆñê«/W´¢\'¯™V5\'3ÊyKSÊ_yrç—üTRXpÇf×5¸@ãƒ±,±÷X·h®ÅKWx`mk›øo¦Àã€Ş¶ÔC–ÊŠÎ®âğÑ­&>üaàÖ²¯˜ÖO4vÿ\0ƒ¯ØÊ0[¬SàLoëWàXõuO9“1\'ŸSd×ÑöBI:^Zõ=Åë>¾aÒ@»°K¨\rp;~ï.2éK0å¿9®C]^¦ş`{÷ˆÜùY\rËë \\œãóµ\rBÈZØ-Z{6O.jÊ]ÂÚıÓ‘œ‡Òæùã_ö=^1S»1›ÆæV3÷y®}%L¾ôw‚  Ô`5`/ı¼ê¢-È³ï>z/@ï€#\0ªˆÑï\r1¹úŒÁ)uşÃ+ÍH:öa›F­Êó5ü§ÓğøÖõ\ZZÖ[,œ+Ü(ky–ÿ\0]ĞŞšRgHÜ“®\nŞ±ÜâZVÖN‚«7«4Lf³¼tÚÃ]„T¦§h¥M‹QEáWG1Å¥G’Š« »¯§²`\ZA²Lc.LD¨ön@¨ñV×‰‹BÂ…z±ß&ÑË»\0ĞUªí\Z‘¥±ÓNóM%ne‰zúJùêv\\cRU4İéUFMéñc)…¡à\\\'BÚ«€Ş)sÜÕ¤qŒâ;]eÓS­Ùï„çKØÃJ}Ò‡é‚FÎxTÜš s{kºF’é_FVhzÀÂ®œÆïgÊi””ëÓ¯}}2“ß5Ç)O‡	mĞN¹Œ«5Ìe\ræšqĞF}Ÿ¼JJJÜ§SÊhb@³şÊ\rÅ,ôQûû‰ÀVWì•‚ÀmMéƒí,¿Ğ8¨¯N5‹2HaÌ6€lØ¤¨ˆ)åª>÷[õüÂ¾`Çº*n—â/mœ½¡6©ªîÃ ¡¡\rq+^t?7¬ùœ7‘3ıâ^Ì0ï…5•¹»ja3v¨PÒ70}¥˜Åï¤Á>2ù‘IT¸÷BSÑN”;õTñĞ!Uœ÷ –Va„bkWAz-}vÚ¾ñlAa(Ş¨û1æYIÙvß—1‘@\"X\\ÌÀ¹ÀÜFÈğC! Å*.ın$†œ6Tû¯YeMhI÷³Ú&uaégó+JÕ •«§mª\0÷ LóYeŸØ^ñ40°«\ZjÓ˜ãòÀÎšË®V¯F®èª^€ô+†ãlÉq«Ò\nĞÅQ§¬fÅé¼ó>Céµ\r\n%»Ûâßªùô	–Ú {ó›ëñVŒ¼çŞ!Õ²©İFYÉ•iTæ‹3›\0\rò|“_Cÿ\0M ÑÔ:Ó¤|h=Ò·§Fú§K×ğÇ«àìiyzEuøNä1Ö¹o˜£HCi¦¡H¦RÛ(W-“qê\"k>¨ƒ(ÉP…€h\"w%öJ^[’À+Eµ˜Æìb1+±`Õ0…ëÀö%ó[‰-q“—#_†|!¬\Z³¯íyÿ\0ÓtŸ±ç«ğŸø:ü;t7ë¼Ú:Í£6é¿RmğºÍæó[§WWÒ†ğ—¦ı6CXÃ¤Ğô:á«7é³Ô::´3N~sêô43iÄÛàŞÿÚ\0\0\0\0\0\0óğüóÏ<óÏ\'Ö’E¶ÿ\0j“]óÿ\0w+yayCFyãru$»Úø2û5Ì˜<mK-İ­w–¶¥L–ÉbI$’¡Ì8‹«éÎñÈï:Q\"-„²¦¥ñšß(áçM?ç­{L©yÇ\r¹âì¾ûÊ,ë-Ï¦½c˜Òßğ\"-¢‚Õ”#ŞDé;ÆŞóÏ<óÏ8*šK|“ÏŞûÛœú÷_ÚM§\\[1²,ùŞoRmB?uówÓÏ<ó†ÒŞG?¦ãm=ãïøã\\»ûœN‚ògÖŠ‹Âş³:1V»,çèù<¼È×^rÜKå³`uë´}ÔYãí8ÔXşqHŸi‰šª?¾š[ÀÏtPGÿ\0<rã½8ëõÏ(›|Âëh¦ÿ\0{ºal6ƒ,‡]ú®‚ÓßêsId™2$D#¢\n‡²Úi$ò*%wÕE²I\rTÕt£‰vy2ìGï®ƒ\'y4À	ÈÀ°D…uñï<óÏ<óÏ<òïşûï¾ü?¿Œ8£x7ÿ\0àÿ\0ÀşĞıü/\r÷¿ÿÄ\0(\0\0\0\0\0\0\0\0\0!1AQaqğ ‘¡0@±ÑáÁÿÚ\0?IXóTKôbeEºŠß%}ÊÊÊÊû•÷+îWÜ¬¬¬¯¹_r²²²²„İ*ïee²®ä<¦?!h6‚æ+Ä=bGcó2°?©ğ5¹9S}Êû‹QôÂ|YM·Z_=È“<Ù#ÔdO$â‰ıÍÌ_aº{ÿ\0LŠÍjJªdb:şàšIçù6·cÓıœ¤4QÚ*Øˆ™^ÃíQè+İD4Ì#˜†Ón\n£\nµ>{²|öj‡²E´6ÀÄÍ`­‰	¬JËç¸èñÑÑVÄº\Zñ¡)Ô†ÄÔÙ”HÒ\"<|f*­+{\rw!éşÍ$ĞÓ™}02âİFIÄXx!1ò:cvd,óÈ“&bÌîO\0j•3‘\'$¡qğ>}‹ßqßo°ÇÕk,/^åMRä§‘¿L(%L÷è¥Şµì‰F£Óı–Œè¤ÌœÀ(¢™9\nzDÆF`]®Q™´¾Â—½zCy+ĞNQ\\7¯m\\xaŒœp61×Ò‚Ó×ºşÉ’këši!+![²PÅ1æ<Ç˜ócÌy1æ<Ç˜ócÌyÏ!ä<Ç˜òAÊ2bğ\rÑr1·h¸YQ…Eèö„ğÅ-²¶\r,™°RÌÛ;}Aå«8MyÏÍRÇÄ$“xcP’üùıI`5k“æ~dIµ\næ´„¹á/çú\"Lùÿ\0)M¾…)JR”¥)JŠR”¥)JS’HFøyØÃ5†5¸—jÚ+S1©›­DC1X˜ùw(REHPÔù<¥*/ĞÜ(CzENoÂ5£R&¯£ò¿Áæ˜ÁÕøEe+)JÊR”°¥)YJR••”LÕeRRKçCû4Ìo`L(„Œ×±Æj´z¡µá1é[£ŸKŸÀ¬¥e­øF¶Óìt?™$ûÇq»bG\"zb<—Ú»ƒ–Ø<	¢Óék¡Í›DÖ¿AMéúûG¡oêïÓŒ]W\"Ø÷ô#CO¡É±§O\"ÙÉÇC„mÑõş#ÿÄ\0&\0\0\0\0\0\0\0\0\0\0!1A aq0@Q¡±ÑğÁÿÚ\0?Š±š¨½iQ¿¶¥.³¡	NŸ’k4½3TôÀ|ÔmåSÍƒ@ÙÁ8¥/Ìû\rŸ!˜®i´›L“M<dâ“É»÷4«ƒ½×°I—bó#uÑ«q#$›ğ\'|£SLˆ„kĞbGXßQ©=ÆëP‘lv§R,š›‹1!&Â\\Øc8Â÷\r¬‰ÑÎGA6DÔL¶*dcìiîFF·éÎ\'ñŞæM…Kíş˜«7„ëø”“o\nG;šbA	nqè¡¿IÙéßFô$–ÂD6Æ¢Dˆš%D Äd¸+™éjáÀ7™¿ëè$1ÍwÈÄåÑã‚+6yù\"®\n$&Gµù\'Ô¥)JR”¥)JR”¥)J&&1Jô¬]Ë«pní­%’wpò,!¥ez-±°m<U_Ü	&öcz%£4oFmbCfÈC˜íûZCRézï°¢²\"¹Úûøù*$B$Ù˜[¤£1Ü1JZ°·(Š-Î–X]7¡°\ZÑì‹sø6Qº¢x~³›1+ ¥ÖëKéR”¥(Å+ñÏ‘l·Â?EF8*bO“aÇ‚*¡‰Q(E¬¡Ó‚åE†R”¦JÊÊÆßJÊÌ™+2Vgit½ºR”¥Ö”¥(èŠÃB…ç)t-&Ğİ0%5[^à³qü¼éJ]w?Uïï‹GÒ„>çÿÄ\0)\0\0\0\0\0\0\0!1AQaq‘¡±ÁÑáğ 0ñ@ÿÚ\0\0?ÿ\0ƒ$½,á@VŞ\n½‘:ˆ< (ZÀ{?ü/¥k—\n,AÖî¹KR¦T>â6‘ÿ\0…DZÍuÄJ‰v |Oı´ªş)\'‹)o¼À”{L>~·‚ç	¼¥\0È½R’ğÈTïÍWÒòŒ½·«Äfñ{Ùç\nsó%iSgzÜ©Ç©@3ƒºıÊÕ‚øpá<o\r¼ŠeµtË´ÖvÌxñwÊŸÈŠvz<Ç|­~G#ßhÓù²Æ³ù~åYz(%`÷†µşso[G(»ù°¦ûyFí£‚û†*ª‹}ï\n–ÚeÌ-‡FÑ Ò‚·™‹m^TŞíb5¯u‰…øq~¶å¨º¨7*v¸ÀKæ®ß_Úë=?İ¦áí*`x8ÅÜêfü˜Ôt¼«\Z£ó(…£¤üÊoHşå¼)¼?s•à?¼u•tr~±XZ4×î“nPşåS2ĞƒùƒGÉ	ÛYÖÇÉ¼WçÎ(~\\klyAÌ{T«KtµÅ_.Ús†)—YqX—¨¡-ÕM¢;6¢‰¯µ¿pŠUíûŠ?&ƒÙEk	ç+6>Rİ\\£bÀh[ñ²>HÛÜš*ÍPläCQ•„ìNh(Ë-Öş\r²šNTd¤‰eäI¡ÊØé-/œŒs€¡„<Q+¢<ÿ\0.—¢-‹nsNf_%	?YY¹ueï“1XÍŒ¡ó8ç3ÈcNPµÛ\\TVî·,V+ÜÓ\Zé1V…w‚»¥\'ÉûK¥Ù,Ú[ñ.ËŠòY]#Î?tª¾¬r]ÔÑ¥‹¥Uõ`Ğ5}˜\"8ŠİJ“/PàÅy¯™nWX—‹ÙâíL¸‚¾.WSˆªÊs»‚éH.,¾I”å32Œ×¸h[;Q¶«Dì3˜;cól¡—.H Òº1`Nl‡x~`š  IU©:÷‹òàÈyåö|[4Én“§ùÀ4Ì£iAÊÀñ´Öª†Z%C›÷R.N°1øË®©™®¢àùÎ[ÍF^Ã÷d´éª÷¸o¢³ú–T~ÙŒ‡FÅÑE]ı%/s-­VUz‚®Ç¢dú™•êæ5ÑÉ5¸ÖŒB…n\ruôXp-I™Da´¿=aU¸vš‹ —â0S\'ysÑœDórì*¬Ü:œN7¸h|.[À`:v\nĞ³ƒ.)7®¶h¥/îk•í`f°tŠ]²Ô-†Dú‘µ¼_ÒôR¿>ğÉ´C¥o´o‰Y  Ê¿º#gìo·3mk85c °D3œ6(ÑRñ©­Ö÷!5ÒÒLÌ²ìø©n|å­R¢å‰]t¸jø Ä¢ŠT€Å¿è(®xÉQA)Ú?5póäfVŞ™Â±\\ûÀÔ¥p\"¥+§\ZJËe—@…ÕN	ê‘°(òÃ\0|Œ¢†BsfWóş§Ic‚âQk‘rVØ±O[¼HĞµ<JÈ™_ø‹’‹©Â±â*‚mª€ßó ¢½ Y-ØÄ½»˜¯/ÿ\0%ÚºFÜ5ˆ¸ê°ØÔ´`]+ox\'8ù–/˜JÛŞ Ş¸æ54”Ş7±º¹{ë(°¸/0tÊ›bÚs—‰µÄK\r |Ë*>#rw7f ¡Vüı`±·`´ëÑ=÷üÀ»*ß‚TÎ‡øÔ¢@»é³;>bbË5/Éù|76¤ˆT9lËæWó±à›ÈáøŠXM*¹8r¯’)A±Âê&‰N(¡‘·§|·j†E£¾µø@»5P!@(•§Ã$m^h´²Mß]vjš¡iB<ãøÅM’™G¦, ˆ²ügq©‹KñQKm0<]{x„(•\'Çî(qM¥¸M¯pÙáüÍŸ´VÌ^ÃòÁ(öí_‘Ï‘W>ñ£˜âÚ}9EÜ5rÇĞÅ/ê	L˜èCWŞŒÅ(…q*©OÖ¥NN°œî*Ê æ:ªÒ®XĞSxMŸğÊ\"°eaJª²Î[G“‡ØÌ“&¥c	i…[HÖN¡£jİ hdß¼Zi>¥¾Ì	`\0±©ìÊ”ªÀ+¬Ş·*^™¼|—÷	rU¥€09S\r’º!^^»®U\r’8V:²—°o,(îœÔSÇ-TZ½åŞ Š;,©T²tÁSmYaèD’†­B†I½ì¶yNvRlcÜ\\®˜WW…Âa4°œd\n±²ï‰‰pnVFMÂæÿ\0ÅL®ğº>WŸãıN‘ú\"¶	æ9»ã™èå¢+`˜Şc›¾9ÛÄTt¹fñ­ÅêWy¶¡T¹â6QUÚ_à–¢lœwæ^Àîô–¢lœwæcŒÅ£UÑó,bµ1XÏ‰j²Ê–K˜¬gÄÈlù˜³!tÇX–¹x˜2õ‰x¤fšŞe6/´ô¼D¶ĞŠ6W‚Qn%÷¹j8Ix¨6xÉ£„[\0ÎGĞî–vaâr0}÷>YŒ°Òã%—(…W*×$ÇÖá¼ÂA¦Ëµ¤ßˆ@ÒZàÕÑ‚‰R¡7 ö–35JTZ=r‘wåçí¥ûX”X {3õ‡›Ù}cRaaàÊÖ°šV×qœD@Ş åÓËpå\0Õ‚µ•‚õ„|ÿ\0¥¥*İW-q7¢ğw§-æTŒŠà,Û ş¢wT-S]nŞ{$)i6Y‘Ÿ¦â…:‰-dù‰ê¿ë\"ÂıÉ¤°BÚSt]¬?d¨%Ï•mÇA‚À :ß‘PËQÏkŒVN1¹S9Áó@P÷* n\rĞR\0ŞùØ™UÊÔïÄÀU\rgâmãN3â\n®û¹If9Ip.˜Æc1CãQÇ[•ŒUÎ•¼s(¯äÄÉ¦\0Ù·v¡iºj,‰1L6µ+è,8ÌÄ©Ğ-Üél^Q;œ.o©z7‹+#>‰Wè‹ A—å5Ùö\'(Sº¶v–Â€B·ğÍÙPL!×]bR‚İ•¡Î©½r…®6T©×co¬\0\0èN.œæNtœğƒT‹“­XPÌ±òãÄ/.æ3êe*¬V¿Êè¹åJ_°t^ø…A.r£X¼«SP°¨j…Uì`§KP[lRélq 4ã^W,\0ğª­r¢×Æ–,[&x¡©‹)g[şú©jëZ ¡––^y¸¨]—pPËK/<Ü\\ä9Ô{3\0í¬ÇaÏmK¬¶ØÆØYO‰¼è–½Ìrë0ñW –½Ìrë4ÊÃ¥KZE¬s¿37kê<Mu”¯öfn×Ôx‡¹iûf_3mJWXèÅ^núÆ#n•ƒ„–6ğ\nÂ]ØÜ©îaÆaä÷í\râ[q¬˜ –l¹·GsÅËo—–SgÜı4Ôöäo¨-eIrY_ë€¦+•×0Ö„pº#t½§YœF@¢‚Uk7Æ%(ì±QXÅ³M’ÌÕ1nùów½àb§AÄ÷P¡½+‡Ò@°™M	`-Öy‡XÊÉ¢ 1’³Ä¡8Æ#˜à\'NZMÊYy5ˆ¥¥ÔpØ+CŒŞf@ÙßõÏÒZÎ!ãµ)—\\À;œÓ#•@=£µux¾bo,&ÂÏ™”9=×7—£ï0ÈÓŞ_:iÚÇCl`LhËĞ8ge·œšù§¾	~ö/ë×˜¥µy½ªŠË®Í-ÚÓˆê‰Ê€.ºªrÊÔ-V‚©ıÃGO[œ.±EÚÙ\Z½;DKë“4MÂ0q)“Ş£\n•+¨wg‹ŒÍ)£´Ñ¡°+Tt­åÿ\0ák´S¬%»Œ¸F–Â “5‰ˆÚÆ’¸%•À+8µ¥˜ìG\nEş?Öé®º„«®e;|FíÃîn¡*ë˜–çuw€:SÚm›b·‚\n®7·¤pwÔ6ÁŠ…äÔJr°pØg*Mı%U¿HªúE=j-AW%û€½‘jºø™Ğd`S{{æSX-–5Œ÷)§Ä¸c+ÔÒ+ÛDÙŸ-êZ¼ôŒŒª!¦·İ¦\r·Ã6è9\nê&3.K°P¼¸7º”b@(Æœ—æVx7¨O‡ÄñkjµìíÁ\0	¢¼ÿ\0³) 6{@¸Pàïnˆ”(Y3yÓŒø‹×\0»£/9ù•(N‹‚r|î_G/îh„ö¸•,¨NhO÷IE‹d^Js¥ æĞóuKÜ7›kÇÂÎğ^\".Š+Â”\r¥nãæS¡|•üDó[›šëWPêæoxV“Ñ-´”<+»YZ ñ]å|Ëîª&VKÚ’\"v\rã!Æ÷öC)ÅË­Ç ˆ=bE•ƒÎlŒÀS¾\"pU;Á|^Å2\0‘‚ïi%±“v÷¿¹—ó€qßğıcäÂšïf…å720z-€èó™Pk<\"óG@òÓ§Ø\0\0İ¹½ÄR[¤/mŒÙmÊœ»8ˆa?“Êà‡P\"-‘–\0 XİD0©\\}$¡j•VÕ)ÆiüÃo +“q¼?øIç¶H-xK,Ôİg=\nb—èM%!”:´\nş+—ı›f(9‚÷™yV¢›­ô&(9‚÷˜µâX®¬º¢„Åƒ¹tôÏ¸7®X>™‚9©¡ºÏYw‡ˆ#ššÑaË¹|ı¡‡™U·§<u\'.ò«n%‹îPZ¾àPTê<J^~±õ[–ÅÌFúÀ(†x€]yªR¢=`mT³kâ ¦¯„6úµ¨\Zí¸d»\Z^êü±Š\0ìU³®7\n\rÆ‘5ŞË£æ%ITƒ¥N×(e-\nz˜G0İ\n´.lUŞn/‰i†0öéëÄÒR1ee©×g0½û:@£W*(Òı¢äÖ*jäÕàÑå…ÌÖÁå7ğ 	©@\01ëéœKÖ™$y/2èÁlR@Qe°¬êûÅü\0¦–Ş÷¸wVåqõ›µÅVV\'E-aıv¨’§vŸe¦gw‹[É1«xJcÜ†£ ¬ì\\İÚdï.ÖêĞ–K¾Á0€ÖÙ )ZÁl³£Ç“øBçÛÚ_ c3şÓˆœ±cpsÛÜÈ„‡±Ô.Û{GÄÙáólûC¬ÉBßßÚÈïh.Äáæ\nZ‹3ytí€wN\\ğ°7Î²H)-=¨e«J%\n]…K¶²$8¨œe‘ ƒ};íE80s‡ÉĞXV\"#ÿ\0}LqİZºÊEÂ2¶NL‡g®5ïiò~VĞ,À„³İ¨É¬ßğªİrxo´³œÍµƒÔR·mÅµÒ¸–s™¶°zŠQo9™;f/š :Ë«rÀyXV2ß‰uË\n-<Käßy­ÛÄô…%òo¼Öâ?ªÅßÚb¶âe…ÇhvX§Z™aqÚ6„ŞûK/~’¨4EMÅ¯´V±Y+b-;»Á]£ÎsÚU.üvƒnsˆÂê€:ZK8¸t·ÅC‹.mÊ1·HäßÄ\0h‘ÏBB@Ñ}¡ÌdïM^£Hú—FåÉâÙúÆÁÖ?qPªĞ÷óP‰ÎDªéxaÓ!¿=eÃÔeş¦h*3Å«èÄ²¥xPoÏL§3ÇZ\Z% E-ÓNWY½\'ÀäºGCÌgå‚Yxéİl6Îë‰º¦dŞV<ÓÈÀ\'P44¨5ññ\nŞÊİ³³ËhÕl+¡š|’Ôİy–0½–ù_ˆ\\§º×¿ÔFps-0Sâ4Rí˜Ì\'ÓxÌEnäóÜ¶¹)N•«»E=´§g1B\0¦üóíÔp*,s™ğ;ˆ”l=˜eôéä·ù‘†ÇVšİaÑ8±šÂ†°[k\06¨E\Zê%DÂ˜~~“`\rÚ®a–‰bÚE€°µ­êÁë%Ü9¦‹â¢´}iâ˜!5wX.§Q¹(†]Ø-ÛpäFvå±RQĞ\n@g¨F–Ygk#·$¸öÊaO–•êë-â+y!çywHDm’çøŒ¥Árõl†÷ß˜´VŸİÜğöi4ÚQF½Ò“F¼!)Õ“V¸ÜXŒ“šû@:°¶6¨XŞ!Mbï\0;ÉÒÄ!;§´éë³!ˆÖau¥[™áˆê¨P±²„*I)%³ak¢|®ìí2¼4Ejs 0	ÈÈJ+2—Ë\Z}e–ãÿ\0Qûáşòì!¶¿¼m÷¡qYF€¿zmamÙ÷Uq[\nZÎ`À¨xù>Eh¸ñ&¡°C¾€.B™!ø»ò+ÏHS¶uB.¶Kíqª•ÛÔ«sºWhUj±ö·÷ªİ˜qóöÑª[B DïJ2*p)í_hÊÃzOÌ2€uÅ~²îômşó\0%oüejlëoÜµ+o¼ß®ÚÅİp²—øE®n‡N[¬ã´*ÖdsW§9Íq*aĞù\nK÷\Zq¼Á×©Å‘æ²<8zçÛ:•-)üÊÄË\nË\r¾®Ü]zPŠñ[™h­½Ùr×Ë [#–‹A\r!úš‚,,Åãr2–Ù–á§u@LÁê¼’°İøh@¦_ıwCğcÃ—Ã6%ÒUZ¶nØ.ZŠ$ÎÏ3Ó¸P\"®{O!ò¶Ò’=­ÂkQ×+ô‹ŞE	NÂ„¡·‡ñÁÿ\0dUQ.u®ŒÂux±1Q·Gˆ*ªjk©]ïÖ5™~B!¾!—½æÒUrTr2²ïv–iôAØ¤²fÕËwQ£i™•İ¦[Â\\â2SÚ¼slù…Œ”öƒ»¦e†n{c¹.ñ¤¸UTğ\\Ró¦*zûEËffêÙ3~\Z”»ˆ«-O-r[ùÌ±µjÁ\0Øà9`êeù2úKloÁÄ·ú%Lô–M\']Ä[]¦[Û-Ü5Ÿ\Z—kè°-]:z”*…®jÀäßhÕÃC¡FóİÜMö+rÈhGŒJ-‹Ìö’Âëû\"|»„kLg³|Ëï ÒbñE\0İ\Zi†”‘Èı‘j‘„ö–0è²iV=êüJo.\\°Í¾e-é±ó/	n”l%NX\0#“†-¸‡G1çBš·Ü50÷?oÜ@;Ê´}aV¬Ø¡¸í™Ó»¯XsE\Z­}ã×ªş¦¨WÌ<Aİ‹[a\0©v\0b-·’6í1¿×óZğ \0…HÙ„8«^0?@lF˜ª4ªZˆ(\r„%ÇrØšÅ¬Z]M(¤VP\"ÑDºERÜ¾JÆÙ^ğI=…zêÖPÙ‹#	3Ö–äBà»Í~n¬46Ô¼„àHËĞ×9›„Úb\ZíhQ”¢Ô!‰\'ºÙ;ÆbkŠ*ï)¼ŒcŠ{°#tDÎø†46ŒCv4d4q¼FŸ.}H[EÈF³ÄßÑ	u\0µ`Sq!¢¡j\0¶ ÚŒ¡6ÜÔQpâˆ™\\‹ØÒ\nNlZ® Œ8E\08ŒÅß)v4”PàÜÆu* ¢Í…(8ùë•\0\0\n½\Zş®½ˆ¬]C$¢öƒWl‹}ÊwÌ§Ä¥aÁÖ!Ö‘4îWÇIAy¨jÔv2£‹í(î÷æ\0åe;±>.R÷îV²Ü¥eüÌºÊ7ò¾ ½åG›‰y•Õ4Du)Ü‰.ì”Şnoâw‰cÌ§X¸˜¢÷ÍJåP¦\Z,1·J>ğmx 8¶!à¡ÛÕ_N%ÕŠ/¤Vm½nbCËUñ3©>b^GÄ6:’«—e®·XËbİÅsTñ{©uñ-G-Õä.&81«J®/rr„ ç+Wb;àÁÓ`WWœ»²LŒ4F®´­CN‚í¸]õ0´VÙ_Z:@w§µ¯é0”«°^j«¸°‹cKWˆQ•½s*Hv‘ŞÑ\'P®nSÜ‰¨ìMñ×¡À¶ÙÇ¡Áó0òDø÷„\'¼\n¯Ù*²\\½[ûTË»¶dêüßæmŸ§õL˜â¶¯¼[jfß G›_V$o=oÕ“jgšhã1òPÚù÷¹q6te­J‹	ê¢¥2\\³vÎ¥^·+3ÏëüÕ62‚Ì‚›ípEç³›€Ş†^ç›%”\n#{;©PØâjœ¼°6¹ H”âpµZ|û°¹!»F²±[‹Qr\r]y*œUM¨m&P Z+ÒÖÌÏã”‘QFšíÂ=ú˜¯…ñ!‹—hé2CDo¨U¥b,D\0PÃÖ.,\0ÙGl”$gdµ’ãÑ\'\nê–é´.)3Lë<oX ¤¯–…˜(U7hÈ=•S$[Òš*övDà‹DÈ Ñ_(OPŞXºT0†U\Zµ÷hª„2kd\r« VF†@Y”Í¿¤©!AN˜^é¸³ÓÒÕË@Ëü*N‹\n§®\"x¥š*I‘±.%K«x:ê#ôLTÔÍK‚¯>&Å;Db¦y÷ˆÎOºV%<ö˜œ™Bd¾jP7_£‰JÑè†à=ÁØ…ñPÙHm±í1Õz‰:T\nWI«ÔKÉÖ!à/´]V<À\ræ+iÏ0ZP®fSFáEQd¤Û¤µ­i°Á‹†9§Ô\ræŸ0«ââ‹`\"L0!r±z7ñ1¬\n^õS­:¯PK/fGÓ‘ıÿ\0P°~ŞyoÓ}«õá°v;ïÜ¦ÿ\0 úˆ8˜BÌró¾jZíG!Ï¶•ØÊ¿9²û!\"Øc½ şL¡±º,ó²ù¸úâ›ƒ+|»æâÒWAĞÚĞE«Z»w{êÑ‡iÃÎğª’„Öİé¶] 89\Z.ÊbómP#Rc\0 °Ët,¬Z%\rhÆò·j†ñXB|1)]RÜ<*‹~\"YPQ]kêÔ\0V®Íy¨šì1ö\0æ~s1^Cí\r¹6%4‘©‡š=ÌùuJŒöÀSáGİöÅf‹>ÒoÜÜ>¡[ÕYêXâ‚®ÉjquÒé~ F°ú…A	\Z <LíÓÓ!X=E5Xí)_Ùÿ\0#È$Ô‚X‚<$@€•g\\¤\Zåaª¬@Œ°-ÅP\0dvk‹&ˆP¤´ÁyšôqjK½^ĞÕŒ~†Ø¡D¼ĞR€«ZEYºwƒJ¤Š*„‹µ\0\0kS]ó8Ô‘”-t rËK¼œqh—øfÅb;\\FFÈ¨Ú®Ä‰&.`ƒâ»×ƒà‚Ì¹BâT5‘\ZS C£<ÊY’š	]ØÁŠËƒ…Ï­]ÔAÙpX],ı\0Áÿ\0RÌ//qU¶[ªV÷QXH€8JRßr…#S(GW¹ogâaÙæ=Ï˜ßTƒfeÉ—/(÷¬´¹¿-ÎçÚa¾Óæe’r¶c˜Érƒ9[7lBáÄ¿T\nï7…½Å÷æ5Z™¤É“w–L›~evbõwÜBeT\\—Uw!R\rÜaxzLb3eèacĞP(­.:f<GQYĞ1ï.DeZ¤ ¾s÷8Ì ¢¸aÁáyZ#ø=™YLl3x]‚SÃ¶d¶µ²¸ÁÄmKi#à§ænÂÎEù>±P5Y‡&Y†°&éÄÑßpv[ŸCŞ€;Ft”Z\Z—ÃAQ!tÖ|À{¡ğÈşbX®ÅÛÇH9à8L¢e5AŠÉ¹(ÊK\0ª÷å»Äq¶+pî~Šñ‰†‹.xCt’³¾Û1Avıf2×µÀF[é.DêîbFj½¯Úšv…»ÒñØ™«\\Z8§¯¸xğU\0‰N Övõ³CûoÌ¬ù*Õ¢€÷°íp€•\\0ôÿ\0q)T(.©½Ûr¿úş®×ŞyO)sŸÏı6õÔ¬ZEVR~í‘ #°jôA<L™rµ´AW@æUq´®Æ]§edŞ?àö­GÌÎöNPiD3F€Y6İØ…ÊÊUV;*qv–ÕCçLò€ÖFhÿ\0¢åÒœ•ÖEQ9Èw©—$°j«¤\n^ñ\niô‹CÌÌ¢!í)Ê[¼MpáCMw‰Ó<Ô™\"ÄÔN‰™Cfs¤™ƒ\Z],é\nš}@­ëÀ3ÒT[¬2ƒb\\Ë:1É«CÔ Ø—2‰edsÒ	>!£f;J.òñ2\Zo¦ {eFñˆĞ>%o\0õ18ø#dlø…Îéª•ØA^»ËİPw¨îÎR†+ÆBÏÈ¦˜3\rŠû!~ôÆ®²deªúÊ–•\0¹èX9àF:*Y¤Eg>¥d—EKhü¥•t |	&!ŠîŸHò…†±1«É5	@±E£xîd³¼Î¨ØàuKÑÑ!LüÛcí2¯…\Zu§ğfDÔ1ò\rX‰lzÀı‘²ª¦­\"À4À˜x<uÑôkU(ëşÃRúåkÃóÛz!OÅá†]`Péäa›§B…×i_¿5µ5Çá@-Ñ¾RÅ•Š×è9 —˜!!ko’0áªNvÍÆ&Wì™¥…Ãä_Bè\Z¦’­3Ò/€«ÊoF¼õª¢ñÑõ\nÕÖz“7‰b“á)ÿ\0‰ƒw¨›ÍUv$ÃÇ|XXl´Yn¸ëYIÁ\0Ãeì€êO%t]_‘˜~uç‰YF´»UÁÕìIŠ\"š\n¶àq:^*‡‘»†jfìÛ%M\"ÉuÌkgPñPX;¥k©¸cÒ?™O•¢•ªÜµYwp€Ø‡xZ-%ÅX\\\nØ\ni¸7‘~Q°É„Dş¬Ñˆnîñ”QÓeÔ0räŒW]h,@4ØxI©ªèàv8Î÷œEÕ‡”Óræ]\"ì ¶	mièÌ2°J–€ÊÃƒ£Ò?”\'e¸\rÍÌë²t \0Ñ]\rÒ®áš!”Â…£¨lê(ì>`€:o5„,DaKm¡uP–8\"’‹Õ¼8„&Ôêíd\rõÃ(1.€¤ë5xõwŸ¹ô•Mß¨®ºé*Å} VÅ-ši}Dªİzˆ6µÍ’´§ÍJ?Òm 3±âRœzƒl§¨u>’‚gé\Zç´¼¾\"\ZáÕõ™¯P\'?H<åŞ¦ìü59®Ó3¹ÔİŸ‚f¥¿$­•¸›V\rùß\r}FıAê×F`ßÒvÇ¥ô”cTÿ\05\0wÁuô‰é~£ç}jdRã@0MM¼$ô\Z¨w[hwÆ_‡³d]uH»Wàù°4{ø4«¿“Œ\0¾“’^_İã˜–~€D* ºÑõ–n¼àıá².jÖ7¥iMÌör½ÖQêÍvƒõ»€IÚæü?&Å\'jıŸh÷he”|\'ÚÃÁeÍ‹êÃvæe°.½­À*¶Ãk×­çñÄvAû¸ÌÓè8bAvxvùD¤ä6¯ó¨t–ï÷C]âÖV&’¾òìŸW	u««eö€CikGÅÎ—tåš%`xˆè ‡»J|½¥Ò+@ÿ\08	ŸÛ¦Ÿ•ø‡Eç\n§U+Óé2_>%.Üœ\\ÒEz}%_ˆü­‹¶B	dl¦\\@¬hóƒ\'À£qÔ40åJ£jÖàgUz¤5à°]à£Fä±n–›Â6Ê´€+œK÷‡P£8\0ÊƒÓ,&¸2bˆ}2òì›{N,ãJ¤6uË\ZîJÚ5YR…	^úspP•©´öÍ‚¸ĞŞB Éx’ŠZ\n³eîèÁ	M²†rUİl\nVÑ2cÖk\0…a”Ãl‡Šk!Ûu×²İ;h\Z…‰„¯8?OÊÌ P¶¢*­±FÆÁ H´ËzN‡©m–—j¥öf!-”¬h£&)@ƒ“¦à@QŒz3á‡Là‘‹¾ŠÍjô½”Î¶c í3£nï9µÃÜ:Ùm8ÚÑµ½°]±’Á@ÛÌK•µ×ÁİİËLCYÉ.æRFíf^µpaiP«¶½å³‹¾Œlé\"4¾õ`\\CT4L.Ç<¬l–1N˜d¹‚êî^ê¨ës>Ş#¥ßŞ\nê«¼Ï·‰q¶å:¾“ª#;©²ö‚£šw°Ì)NzÍAë6áïú•²î6ãé+y 1BC(¨¶?YV°Ç+.0#Õ¨¾Â%¶áE³”- äpÜ½öÈ-2Õ·Î/Th%ÖZHã*f`°ªèT¥Y‚.´ïÄá_|E.Ò;a_2«Ky¬%˜ÛOŞ+Æ÷iûÔm\nÇÉú‚P\'ş˜#ËP«eV–1ƒbQ¿°SA€D¤\n²\r&Ès\\¬Ïg¬·ó UCš7FĞ,FãägÄJ†óXÿ\0tƒ¢á6G‚¦?`A]}-ÏæQ«Yu5QùÅÁN¤¢ägƒñ|Ôr2‘Ï\nenÃ¾¡2ÖS††ù?ûìñ?ßë‡0Û8Cs†\Z<i¹æi\r{‡3’yœ¾fˆê\Z‡Ûêsš#Hqü\ZGíCI«áóvN&ÑÚ;<#Ìû1ÒÀè{Ÿm÷gçûgÉ>®}É£Çğàæmàş\'ÙfSw©ö³ü|Í¾ÿ\03ê?1Ò™÷#\rıÁÚ—–‚:óû&¸ßÃó>¦Â8y„9óOû:OÿÙ','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0\0d\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ö5ãøºk_9aŒÛÅ,`K¿r«ÙB£ibøÈc÷éZFß)o—z“¹šwpqÀ#ÔÂ¹­KIÑõ;~‹um¨K5¼ë2ÈÌ¾a\0G¹m*6.@ÇL‚ºm´Py0É¬k—3«•Yfœ}Å\nT|­÷X‚Äç\'ŠI³4mï&O6œ×M:#)ã¡\0áäî9áV—í6ÿ\0óÚ?ûìT\Z£éwX¶†wºY]yåiä(›ÜîcÉyêyõ$ñßoCFÆ5gÉkÇÚmÿ\0ç¼÷Ø£í0gıt÷Ø®ííèhû{ç½1öçp.mó>!ÿ\0Õñ‰ì»nNåI@ÚN@Ï<€0=kŒû{ú\Z|Z¤‘H²(É<ÑpUÎ‘n®¤·ÜÓˆ]›r¬Š‘G#Œgóú}nZÛê—á®¢[cÔX£\r–\rËätì?…q0ë°]ı¦8ÄŞb¾Ì\0ö= ÷öè*Ê-Ú).‡µ?\'ùààTÁİF¢rÔôçtŠëç•ƒkà§œ\n¥{{5¬ñF±Ã*H8g˜+{ñƒŸóĞ×¥q-æJîØ9Ç\'üúÓÄ6ÚÄâkxdE‰B2Ê	Éõºt©œ¤ÚŠÒıG\ZÑ³“éĞï|ËcÏÚ ü\\Q\\\'ÛßŞŠÒæİv?ÿÙ',NULL,NULL,NULL,NULL),(49,'sys','logo.gif','image/gif',2689,'2013-12-23 05:25:10',2615,'GIF89a˜\0\0÷\0\0U¢uW£vW¤wX£wY¥wY£xZ£xY¤xY¥yZ¤xZ¥xZ¤y[¤yZ¥y[¥yZ¦y[¥z[§z\\¤y\\¤z\\¥z]¥z]¥{^¥{]§{^¦{[§|]¦|_¦|\\¨|^©}^ª~`§}a§~c§a©~c©€b«€eªfª‚c­‚f­‚f®„j«ƒi­…k­†l­‡n®‰p¯Šs¯Œn°‰q°‹s±Œr±t±v³u´y´’{´’}¶•¸–¸—¹™‚¸™ƒº™…º›„»œ†»œ†¼œ‰¼Š¾Ÿ‹¾ ½¡Œ¿¡¿£À¢Á¤’Á¦“Â§•Ã¦•Âª•Ä©™Æ«šÆ¬Æ®È¯ŸÉ±¡Å¯¢Ê²£Ë´¥Ë¶£Ì´¤Ìµ¦Í¶¦Î·¨Î¸«Ï»³Ì½ºÍ¿¬Ğ»®Ò½°Ò¾³Ô¿²ÔÁµÕÂ·ÖÄºÒÂ¹ÖÅ½ÔÅºØÇ½ÚÉ½ÚÊÁØËÁÙÍÁÜÌÄÜÎÅŞÏÆßĞÊÛÒÈßÑÌÜÔÒÛÔÉáÓËáÕÍâÖÌãÖÍã×Îä×ÒåÚÓäÛÖåİÕçÜÖèİ×èŞÙéßÚêáÚëáİëâİìãßíåâéäáîæâìèåîééîëäğéæñëèğêéòìêóîíòïëôîìôïíõğîõñïöòñòñğöóóöôòøõôùööù÷÷úøùúùúúúùüúúüûûıüüıüüşıışşşÿşÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!ù	\0\0­\0,\0\0\0\0˜\0\0\0ş\0[	jŠ¢*hÊP 9x±HÕÂU{’¸xÃj¡BU›ä4Ù±£‡0	[ıiÂ$’ÇV¡ªäˆ‘ò¥ÀO]¤É¡ÃÉ\ZI©lšú²£…&¨Ô±h³ROUµi¥ÓÂRzœDåñM\0ÙT•F\09^Pè€ÀÇR!,ÈÊf©/&Ğ°!Â\\[¥9°\0ĞK9_ˆµ)PÒ€.Æla`€S/\r`p ÇS*ÜaêÑPJQ±` I!¨Ò\\\nªÕD!=P•:\"™Buj¥9 <bAÃƒL/Eåà*T¦4%2ÄT†ş¢âi!Ş)1`À¥+SVx³j¡*\'9B,ĞQWá©L@z)Ò\0j­¨R…´&);X H}IâA%60ğAMIÒG1Ö[oü±@g}E\0\\¨$PˆG‹”PIs$„\"\"&1‚‘â%4\0z€ ‰XPÉBÿ1à\0ytHª2ƒ¦bŠŒõEª|¡ÀØgD\0I¸èQ\' tJsõ7Ğ\"$Ğˆˆ­¸‘€ŒöY&„-fS$0à…ŸX°€èÍqƒ*u,@L¾€“’â@Š<På•´¦Š\0²éB¢¨ –!4\0¦Bÿ•|0@â)©¨Ä¸Ôp`•ˆo W™ Ö”º©ÙJ$8EŠ”`0À¼¡rÃ­h’]\n™¢‚>À@]*d`•R<¹¤k8ˆ	•Â‚(|¢Ğ@p¡bƒg­ĞÁÙ\Z›¢C(pøRtĞÇB†”)20 ‚ƒbÀ^À_`Â°QbÁ&	òà$t©P‡t—†à«@‰PPeP I(\"ğÇ˜*L¼ªŠDPæ@cD[\0[ˆ‰@›(ºÃ)…Â.`&â\Zx0qoLTaÑĞ	„Å$8@\Zcìà@(+´\n:t·@Ü¶Lé\'ş\02‚ƒ­Ô\\¥	L0HœœM› pÈœ\Z°Û@e4€Ó\"®2FL©@R5dç\Z<0ã@Œn+5;hp00%¼™bBE½Ÿœâ!P&\'¬·BÜ‹TÀî“ Lj¾Ñ$¥dO	\n \0•@`@À\0—rÂÙ—b\n(€… XÀÀ\nZ3†º‚Œ&Ùg‚Æó$\ZÀ€*\\çU\0ü@šF$`¦P(šÃ€µ4dè$¨<ÂfQ¹X ˆ$\0ßÏ\Z³`À\n €\019(€ÿÂS!`\0ŒÀş\0ÔFµVŒâA\0mÂ5(\r<(À?À\0ä¬06QÏÇÆƒd n\n\Z\0.@F€CŠNq>…DÂ(À\rDq	|Ê	 !0\0êyDøÂ ÑC,b\r	pS\Z€`ÁY	j\rø°‡;b;3p\0|¥Š,\0bL>‰,`bcàƒ\0‘ˆEœ¡NNp%À€-ÔJ\nÀ\nTa{\0„!¡ì‡6¨0\"	\'% s\0a‚®T\0«ŒâàÀ%ìC”â*,ğÇ:\'Ñ&¡°\0ğ\"‡8€V­XÅ\n=Øê\0ÿÈ*Ì`‚ú	¤$X@	–8Ht –µÚƒ`è¡úRH*t §µ\"™_X+1çX@šVr€ÒÎ,6bĞ£\n,\0|ˆŠ;1¦Há@êÈ\0ôgAJ“ˆ`¤\0\Z¶¢-X©}¦\0Üá%•@\0{jÕ†,@	êĞÃŠ5 »`ís‡	@€ ½(<şaS‹ˆ€#^\"ˆ$ –iD\Z°‡±\"«HÅ†„”,ÀBEà9°”)¨cÀb™)¤\':Ï\0ãEE	9kÍ)K¹JP`7¨3êUÜ¡\0g½#ş–$EÀà¤H \'×¨ Œ*Ş@\0ğ\0ˆD#ü±U\"áÑè\Zp\03¤ˆoÀ\0	J¢\rCprfUHçTˆ(HÀ\0´[›1‚&(¡ˆ* \0VP+Ò`Å‰çX\0tØØ…±¼!gw¼@(Uq†Fšà¨XD°õUt!\"ˆ®*Ñ(ÀÀÀ²	U $[È%N@‚©U\r-H@:0¡E¬CH@ˆV€âfpQKEad\" €, ½Ü¡.¦ A~_ÂŠ7„ n`ÅÊğ34€`p$8A(/ú†$©’H„=c²	E(¢§\n… ¨p98\"ckD#Ô”\n7\'\"½ªøD\Z’PCT¢·mND½\Z˜—l¢˜èÄ©ªç;la\ndˆÄ7„ˆ¸½¤ô-±*ñŞÚPbÓ¬ØD$\"ÑÛ\rXXD@\0\0;','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0\0\0\0”Ec\0\0	şIDATxÚXiL›é¦R[©jUµªTi·?Z5©*µ«´[©ª´Š’ôß6Rû/$ÙØ¶©ín6›ƒ#›\\$!!ä\"äâ†å4÷á€sØæ4Œ\r6Øà|Æ÷5yÁ1&é\'Y€ß÷›wŞyfy†¸¸¨§_3gêïBÁ@5˜æ£×à—jƒví{ĞSé¹p¶!®w>‡ñ¥Y\'®ï\ríõ‚7¾onRï£½Z\\A\\ŒgÅÎß•.NB¾¸\ní=€³‚¸Úş¤“@ëƒòÜ+mùĞ¡€èw\rüJ|‘´NÔÜ‚q½âŞñpNw§«.µ<†«hïFçÈ»A·j´£o[îª±.AfóC¸Øú´İ¾Èµ@00š#*‚%ŞL÷úm¬ó:”ƒÀ;l^úİã÷Âã¾J¸\'*†—Úc²­$µÏÀ‹Á:Ğ¯\Z7ûïøó/·=…#¥ç0(ww9ú¢Yâ-óéM¹h äË*˜1i`T7\r\r“İ°Ì›U‘{çWtñYÏà¿•—!©4x·} nŸ»2«£\0^ÕÁÄÒ,³7‚öÚgúaÎ¢c¾™•ä&Ÿ\n|ôûj‹Nš*¸‡‹ÓàQ_9¬í\01Ú,ÜÁ¢T–H*ÓÂKòÿDí-ø²æ:èy“rSÀJ—_„ágÚ87¹îC@şSy	¾©»\rZëò‚ò³èóòª\0Ïd€¸|–¸Ç«®‚31@<>_Æ=Q	¼–Àâà&]>×ğË648cÔ¨÷WBNw1.Iƒù=DUÇ\'yâr4z\rVö3qïyæW– yªš}@èVÉ(›şZ·{]I÷Ñ¡Ì–‡àòy{·³ƒïå&¥@éps´?µ!p2‚]öHiX¼`;;¦5+’eÃ-€À|ÿ{Ï1±—¤Ã vb“mÃª¹4³9M‡ĞwÊöh@b¢*NÚ‡çÒİ~³	ÁêM€œÁ$?^•Å\0qz<	Õãp»ë5è­†ı[œuûİ»ÛS­\\8²¨ĞB@òÅÕ”q_E”¼\'±ü<”Ó…÷Ò‚@„ª(©,²E…`´sa@”f­\"í=Çıd;;T!ÈBYcTPüõWÛóAe^ø¦NŞ18mÓıÌXvš8J4ÊÈ /†já3dÊ0@X1Òj¬ª—y“˜‚AÇ;ßÓqÀ7z²ş6£cJ¶4ü‰{D÷,\nÓ‚;p+Ä`[I2¨Yâ¯¹êXÕ§0Ì§¤\"!×•yşÙ/°Œ+ÏƒiÒ«ñP“=Ş÷áô¹ë/¶>‘zxŸL7½÷tıøº.ÔğÅ{çFÕ¼–5\0°- X¹”¥¯p_DĞ~([œê»ƒ<¥¾Á…ä²ópûzä£_51@õU@õ¸p÷¬yı\0²»^ùĞ¯„öñN{Âí7¯0X±\0@Ö•ö§¬J´Ürg$ YÂìüà%¼\'­ß¾\0µY÷ihõáÍ’Ç¾½\n\ZdÏË.€l£GÆ|$ØT‰Z<\0¿÷z½ñE²&†<‚ ÃËÿˆöÔŒw2@:•ƒï÷ÿZ² ·PP°\\>ß^\nÂ?1åºÙ°h‡]„¨ŞˆBœKYZ2Ü~×î±ïzˆ=cT?3‰ïştÉf>y\n3ğDíMÊÀ¡íIÇpÑ$õ†sMÀbç|hãïá^³¶Deøü™şÏ²XJVüîw!@Î·=†:ù›ÓÆù_V_‡ÃEip\r+vÕ½v”ö<¬ÙBYD«\'jn\"Õ¥±3°êmqø8/W‹e?±<Ë>/¥õ,{‰CtR7Şå¡Àt)%ïÄj·ï\"n$j˜0¬Û+–6±à0He!BßIş?@doQš’Î`ß@àÙSgŸ§3q³©sÎ+¨Ğßµê²w“:$:¥jaÔŠ©K%g˜İ¡X´N‹!™±Ş+…zHfë#¨µìdbgÕTu²6¨G‘°»\\û^\rÕo¤ä4)z¦/·=A_Ó@ÇT[(Ëærˆ¿®»µBhœê–é> jJFGS^·ˆÁ¨ñ$…2YsĞï÷Ø.€”¡MyP;.j\\t¡6üPL*Ï“İÊ\0ÒÊ?éw!Êb*}KY\näüëÏÑç7Ì×”…¨Â(à{™ÚÊŒ¥²hŸ#øùN§r¨ô`q\n¼–\n˜m—×S@Ê©PÒ€ş¿E/´\"sP|Èİ†4%ÙKwBtq*‡bFLğÍë-ÛÈÑÊ+€R7c‰àd0š³:lo›ºé¤/T€Í\r+%Ì½^¿7é\n–eÜ\"g`N`òP6‘T´{œÛ6õ1ÌV\"úûŠÑV¦Jºf%(k§‰K/#Gcæ}º=Ñ†Ê\n5u¬°Ò\'âJš{6áõûÄÔ4tóÚ:è›(‹7s‡\"š:›»æÇoOw»É§ïw«¥$ë×<Î‘óTÒ*%…h])~D€İEB´§µ.ù¨OğÄ0±T–ÁfJ–.Lì ‘€â9¢Ÿ&›o(ÃŞŒÖ<˜ÒÏõ‡z=‡ãƒ¡ù	)*qlnGq}7éfºT¯zXÕ7Nû!(â\'[øŠ©«è€ŒâÁ”4P™x~§İeO¢á,¢j¡3\"ì}7 ¤ßÛ©©S¯Y§¬ëré)	:«!-Ê‡?Q?\"Ÿ±?ñï_l@W¹„\rÙ‹Ï¯èŒn•T{õ§f„ä÷WpV¢ÇµŸGØı±Æ¢—…ÔV0øb\0²‘àŸPBRˆÈ1ÈJ2ÚüÁ fBHşPõ¡$ïgTæEHGÃ~<$†RÒ¯¹‰ÄU§í&}‡Cælc\nkœhNÄ¹#mŒš6œB9ˆ”²?Æ0ñ6]’6—×ævTÑ$LTFÁÍ\rcJ¡j¬H…­Ï!’\\ºõ7¸wÔc¯»ßSH›ûcU\'\r¡9İë oêmQÍ\ršq6ùSR\ZîÒ¤ux\\@ƒ±ËëVEÛE:\0òiKŒJTEv¢a6ÀÙ¢\"H=~ÍŸ*d½Ò!“Z‰òc’’˜š:gWµôšÂ…Ê!”«¼–2Š2kÊ¨ş«xn%æKx$®À\0³!Òjç½!—‚;F°hÖ¡Œ\0DJWÅÎçŒ-)Ù¿²Qt! s+zŸ[Ş³N5¦\\!\n\0œ7Àívï ê3ğæ˜ú\"•T‘éÌç÷÷G%GgWµÃ<ç)VıW@ª‘ï¡jB\ZfâÀ#D:bt‹j\rÁ /*`‘7íÜFiîFõ¯‹â\0e:@]^Wø_\'¸şùÆŸ*“zÕÿ\0_µÚøj×‡\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
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
  CONSTRAINT `FKDABC45D47514938B` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`),
  CONSTRAINT `FKDABC45D49B71D578` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_fees`
--

LOCK TABLES `account_fees` WRITE;
/*!40000 ALTER TABLE `account_fees` DISABLE KEYS */;
INSERT INTO `account_fees` VALUES (1,'Contribution','FA','S','S','\0',5.000000,5,'C','Periodical units contribution',NULL,1,3,NULL,27,1,2),(2,'Liquidity tax','VP','S','S','\0',1.000000,5,'N','Liquidity tax',NULL,1,1,NULL,28,1,2),(3,'Registration','FA','M','S','',24.700000,5,'C',NULL,'2013-12-15 04:11:07',NULL,NULL,NULL,18,NULL,NULL),(4,'Adhoc','FA','M','S','',1.000000,5,'C',NULL,'2013-12-16 01:23:20',NULL,NULL,NULL,27,NULL,NULL);
/*!40000 ALTER TABLE `account_fees` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (1,'member','birthday','Birthday',5,'date','text','S','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(2,'member','gender','Gender',1,'enum','radio','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(3,'member','address','Address',9,'string','text','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','\0','','A',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(4,'member','postalCode','Postal code',13,'string','text','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(7,'member','phone','Phone',14,'string','text','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(8,'member','mobilePhone','Mobile phone',15,'string','text','L','\0','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(9,'member','fax','Fax',16,'string','text','L','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O','M','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(11,'pmt','identifier','Identifier',0,'string','text','S','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','\0',NULL,NULL,NULL,'\0','\0',NULL,22,'','F','N','\0',NULL,'\0','\0',NULL),(12,'record','comments','Comments',0,'string','textarea','F','','\0',NULL,NULL,NULL,NULL,NULL,'Remark comments',NULL,NULL,NULL,NULL,NULL,NULL,'\0','\0',NULL,NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',1,'\0','','E'),(13,'member','Broker','Branch',18,'member','member','D','','\0',0,0,NULL,NULL,NULL,'Branch association',NULL,'R','R','B','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(14,'member','account_type','Account Type',17,'enum','radio','D','','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','\0','\0','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(15,'member','country','Country',6,'enum','select','D','','\0',0,0,NULL,'Select One',NULL,NULL,NULL,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(16,'member','state','State',7,'enum','select','D','','\0',0,0,NULL,'Select One',NULL,NULL,15,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(17,'member','city','City',8,'string','text','L','','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','\0','\0','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(18,'member','address1','Address1',10,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(19,'member','address2','Address2',11,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(20,'member','address3','Address3',12,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(23,'member','personal_id','Personal ID',4,'string','text','L','','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(24,'member','company_tax_id','Company Tax Id',19,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(25,'member','company_name','Company Name',20,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(26,'member','company_address_1','Company Address1',21,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(27,'member','company_address_2','Company Address2',22,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(28,'member','company_address_3','Company Address3',23,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(29,'member','company_country','Company Country',24,'enum','select','D','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(30,'member','company_state','Company State',25,'enum','select','D','\0','\0',0,0,NULL,NULL,NULL,NULL,29,'R','R','N','N','N','\0','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(31,'member','mother_name','Mother\'s Name',2,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(32,'member','father_name','Father\'s Name',3,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(33,'member','company_city','Company CIty',26,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(34,'member','company_postal_code','Company Postal Code',27,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(35,'member','company_phone','Company Phone',28,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL),(36,'member','company_fax','Company Fax',29,'string','text','L','\0','\0',0,0,NULL,NULL,NULL,NULL,NULL,'R','R','N','N','N','','','N',NULL,NULL,'\0','\0',NULL,NULL,'',NULL,NULL,'\0',NULL,'\0','\0',NULL);
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
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
  CONSTRAINT `FKA83C5FEDA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FKA83C5FEDBC65B77D` FOREIGN KEY (`service_client_id`) REFERENCES `service_clients` (`id`)
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
  CONSTRAINT `FKD8DBB56D3D73A7A3` FOREIGN KEY (`category_id`) REFERENCES `ad_categories` (`id`),
  CONSTRAINT `FKD8DBB56D9D46A867` FOREIGN KEY (`group_filter_id`) REFERENCES `group_filters` (`id`),
  CONSTRAINT `FKD8DBB56DC0E7F6FA` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `FKD8DBB56DEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKD8DBB56DFE01A09E` FOREIGN KEY (`owner_id`) REFERENCES `members` (`id`)
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
  CONSTRAINT `FKDE2D6053A3365C11` FOREIGN KEY (`contact_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKDE2D6053FE01A09E` FOREIGN KEY (`owner_id`) REFERENCES `members` (`id`)
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
INSERT INTO `groups_channels` VALUES (1,5),(2,5),(3,5),(1,6),(1,9),(2,9),(3,9);
/*!40000 ALTER TABLE `groups_channels` ENABLE KEYS */;
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
  CONSTRAINT `FK2C0220BA2B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK2C0220BA2B3ED03` FOREIGN KEY (`assigned_to`) REFERENCES `members` (`id`),
  CONSTRAINT `FK2C0220BAF3ECFBC0` FOREIGN KEY (`pos_id`) REFERENCES `pos` (`id`)
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
  CONSTRAINT `FKFC5711BDA69BAAC3` FOREIGN KEY (`existing_parent_id`) REFERENCES `ad_categories` (`id`),
  CONSTRAINT `FKFC5711BDA7E88FA0` FOREIGN KEY (`imported_parent_id`) REFERENCES `imported_ad_categories` (`id`),
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
  CONSTRAINT `FKDFC12DBF3F6F4BDC` FOREIGN KEY (`category_id`) REFERENCES `message_categories` (`id`),
  CONSTRAINT `FKDFC12DBF659B479` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `can_view_message_categories`
--

LOCK TABLES `can_view_message_categories` WRITE;
/*!40000 ALTER TABLE `can_view_message_categories` DISABLE KEYS */;
INSERT INTO `can_view_message_categories` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(5,2),(5,3),(5,1),(9,1),(9,2),(9,3);
/*!40000 ALTER TABLE `can_view_message_categories` ENABLE KEYS */;
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
  CONSTRAINT `FKAD520EDDEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKAD520EDDF9B21025` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`)
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
  CONSTRAINT `FK6FF08EF52B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK6FF08EF5A19267FC` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
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
  CONSTRAINT `FK8AE18A1529C0E817` FOREIGN KEY (`guarantee_id`) REFERENCES `guarantees` (`id`),
  CONSTRAINT `FK8AE18A152F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK8AE18A1554774F2E` FOREIGN KEY (`loan_group_id`) REFERENCES `loan_groups` (`id`),
  CONSTRAINT `FK8AE18A15629CF4CC` FOREIGN KEY (`pending_member_id`) REFERENCES `pending_members` (`id`),
  CONSTRAINT `FK8AE18A15726DC538` FOREIGN KEY (`member_record_id`) REFERENCES `member_records` (`id`),
  CONSTRAINT `FK8AE18A1573D9F3D7` FOREIGN KEY (`operator_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK8AE18A1581B2B280` FOREIGN KEY (`imported_member_id`) REFERENCES `imported_members` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_values`
--

LOCK TABLES `custom_field_values` WRITE;
/*!40000 ALTER TABLE `custom_field_values` DISABLE KEYS */;
INSERT INTO `custom_field_values` VALUES (1,'member',1,'02/03/1981',NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'member',2,NULL,1,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'member',3,'4959 SW 33rd Way',NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'member',4,'33312',NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'member',7,'305-349-3387',NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'member',8,'305-342-2557',NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'member',9,NULL,NULL,NULL,2,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'member',1,'15/12/2013',NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'member',2,NULL,1,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'member',3,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'member',4,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'member',7,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'member',8,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'member',9,NULL,NULL,NULL,3,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `custom_field_values` ENABLE KEYS */;
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
  CONSTRAINT `FKB32047139D46A867` FOREIGN KEY (`group_filter_id`) REFERENCES `group_filters` (`id`),
  CONSTRAINT `FKB3204713B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
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
  CONSTRAINT `FK80BA49C13A66F8B` FOREIGN KEY (`member_pos_id`) REFERENCES `member_pos` (`id`),
  CONSTRAINT `FK80BA49C293F7A45` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`),
  CONSTRAINT `FK80BA49CA19267FC` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wrong_credential_attempts`
--

LOCK TABLES `wrong_credential_attempts` WRITE;
/*!40000 ALTER TABLE `wrong_credential_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wrong_credential_attempts` ENABLE KEYS */;
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
  CONSTRAINT `FK8E3E931385B3A90F` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK8E3E9313CA99FDAA` FOREIGN KEY (`transaction_fee_id`) REFERENCES `transaction_fees` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_filters`
--

LOCK TABLES `group_filters` WRITE;
/*!40000 ALTER TABLE `group_filters` DISABLE KEYS */;
INSERT INTO `group_filters` VALUES (1,'Branches','branches',NULL,NULL,NULL,'\0');
/*!40000 ALTER TABLE `group_filters` ENABLE KEYS */;
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
INSERT INTO `transfer_types_channels` VALUES (13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(29,2),(29,3),(29,4),(30,1),(30,6),(30,5);
/*!40000 ALTER TABLE `transfer_types_channels` ENABLE KEYS */;
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
  CONSTRAINT `FK1AEDD3F397ECA054` FOREIGN KEY (`cancelled_by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK1AEDD3F3F096D933` FOREIGN KEY (`brokering_id`) REFERENCES `brokerings` (`id`),
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
  CONSTRAINT `FK591542F9608B319E` FOREIGN KEY (`buyer_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK591542F99383E848` FOREIGN KEY (`guarantee_type_id`) REFERENCES `guarantee_types` (`id`),
  CONSTRAINT `FK591542F9A5F0DAD8` FOREIGN KEY (`issuer_id`) REFERENCES `members` (`id`)
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
  CONSTRAINT `FKB8B2A2743C9C4AF3` FOREIGN KEY (`import_id`) REFERENCES `external_transfer_imports` (`id`),
  CONSTRAINT `FKB8B2A274D64E2913` FOREIGN KEY (`type_id`) REFERENCES `external_transfer_types` (`id`),
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
  CONSTRAINT `FKE475014C3F6F4BDC` FOREIGN KEY (`category_id`) REFERENCES `message_categories` (`id`),
  CONSTRAINT `FKE475014C823FB102` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKE475014C9DCA1693` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'2013-12-16 00:29:10','You have received an invoice','inv','I','','\0','',NULL,NULL,2,NULL,'You have received an invoice from Acacia Bank (Acacia Bank Internet Banking).<br><a class=\"default\" href=\"http://localhost:8080/cyclos/do/redirectFromMessage?userId=2&path=%2Fdo%2Fmember%2FinvoiceDetails%3FinvoiceId%3D1\">Click here</a> for more details',''),(2,'2013-12-16 00:46:52','Payment received','pmt','I','','\0','',NULL,NULL,2,NULL,'A payment of $30.00 was received from Acacia Bank (Acacia Bank Internet Banking).<br><a class=\"default\" href=\"http://localhost:8080/cyclos/do/redirectFromMessage?userId=2&path=%2Fdo%2Fmember%2FviewTransaction%3FtransferId%3D1\">Click here</a> for more details.',''),(3,'2013-12-16 00:48:24','Low units notification','act','I','','\0','',NULL,NULL,2,NULL,'You are reaching your credit limit',''),(4,'2013-12-16 01:20:00','A payment awaiting authorization was received','pmt','I','\0','\0','',NULL,NULL,3,NULL,'A payment awaiting authorization of $5.00 was received from Roberto Andrade (12345).<br><a class=\"default\" href=\"http://localhost:8080/cyclos/do/redirectFromMessage?userId=3&path=%2Fdo%2Fmember%2FviewTransaction%3FtransferId%3D5\">Click here</a> for more details',''),(5,'2013-12-16 01:20:00','Payment authorization request','brk','I','\0','\0','',NULL,NULL,3,NULL,'A payment of $5.00 was made by Roberto Andrade (12345), and you should authorize it.<br><a class=\"default\" href=\"http://localhost:8080/cyclos/do/redirectFromMessage?userId=3&path=%2Fdo%2Fmember%2FviewTransaction%3FtransferId%3D5\">Click here</a> for more details',''),(6,'2013-12-16 01:25:19','You have received an invoice','inv','I','\0','\0','',NULL,NULL,2,NULL,'You have received an invoice from Acacia Bank (Acacia Bank Internet Banking).<br><a class=\"default\" href=\"http://localhost:8080/cyclos/do/redirectFromMessage?userId=2&path=%2Fdo%2Fmember%2FinvoiceDetails%3FinvoiceId%3D2\">Click here</a> for more details',''),(7,'2013-12-16 03:33:35','Payment received','pmt','I','','\0','',NULL,NULL,2,NULL,'A payment of $200.00 was received from Acacia Bank (Acacia Bank Internet Banking).<br><a class=\"default\" href=\"http://localhost:8080/cyclos/do/redirectFromMessage?userId=2&path=%2Fdo%2Fmember%2FviewTransaction%3FtransferId%3D7\">Click here</a> for more details.','');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
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
INSERT INTO `groups_transfer_types` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,14),(1,15),(1,16),(1,17),(1,22),(1,24),(5,30),(5,13),(5,29),(5,18),(5,20),(5,19),(9,13),(9,18),(9,19),(9,20),(9,29),(9,30);
/*!40000 ALTER TABLE `groups_transfer_types` ENABLE KEYS */;
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
  CONSTRAINT `FKF9D930D5311F5E08` FOREIGN KEY (`charged_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKF9D930D552CC4E04` FOREIGN KEY (`sms_mailing_id`) REFERENCES `sms_mailings` (`id`),
  CONSTRAINT `FKF9D930D5D76E1B90` FOREIGN KEY (`sms_type_id`) REFERENCES `sms_types` (`id`),
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
  CONSTRAINT `FKD0252B6BA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FKD0252B6BFB43CB21` FOREIGN KEY (`preference_id`) REFERENCES `admin_notification_preferences` (`id`)
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
  CONSTRAINT `FKD8ECB3FDA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FKD8ECB3FDBC65B77D` FOREIGN KEY (`service_client_id`) REFERENCES `service_clients` (`id`)
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
  CONSTRAINT `FKB63DD9D433E01D0A` FOREIGN KEY (`registration_agreement_id`) REFERENCES `registration_agreements` (`id`),
  CONSTRAINT `FKB63DD9D46061A69` FOREIGN KEY (`member_expire_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKB63DD9D48595CD86` FOREIGN KEY (`card_type_id`) REFERENCES `card_types` (`id`),
  CONSTRAINT `FKB63DD9D4935D704F` FOREIGN KEY (`sms_charge_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FKB63DD9D4EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'A','N','System administrators','Administrators with full permission on the system',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,50,NULL,NULL,NULL,2048,3,NULL,NULL,NULL,NULL,'\0','\0',NULL,'\0','\0','\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(2,'A','N','Account administrators','Administrators with permissions for account operations',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,50,NULL,NULL,NULL,2048,3,NULL,NULL,NULL,NULL,'\0','\0',NULL,'\0','\0','\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(3,'A','N','Disabled administrators','Administrators with no permissions',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,50,NULL,NULL,NULL,2048,3,NULL,NULL,NULL,NULL,'\0','\0',NULL,'\0','\0','\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(4,'A','R','Removed administrators','Administrators that were removed',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,50,NULL,NULL,NULL,2048,3,NULL,NULL,NULL,NULL,'\0','\0',NULL,'\0','\0','\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(5,'M','N','Full members','Members with all permissions',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,NULL,3,0,2048,3,1,2,3,2,'\0','\0','D','','','',36,3,1,4,4,0,NULL,NULL,0,5,6,2,5,'\0',NULL,'',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(6,'M','N','Inactive members','Members awaiting change to an active group',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,NULL,3,10,2048,3,1,2,3,2,'\0','\0','D','','','',0,NULL,NULL,4,4,0,NULL,NULL,0,5,6,2,5,'\0',NULL,'\0','New Individual Member','','\0','\0','\0',1,NULL,NULL),(7,'M','N','Disabled members','Members with no permissions',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,1,2,50,NULL,3,10,2048,3,1,2,3,2,'','\0','E','','','',36,3,1,4,4,3,1,5,NULL,NULL,6,2,5,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(8,'M','R','Removed members','Members that were removed from the system',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,1,2,50,NULL,3,10,2048,3,1,2,3,2,'','\0','E','','','',36,3,1,4,4,3,1,5,NULL,NULL,6,2,5,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(9,'B','N','Full brokers','Brokers with all permissions',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,NULL,3,10,2048,3,1,2,3,2,'','\0','E','','','',36,3,1,4,4,0,NULL,NULL,0,5,6,2,5,'\0',NULL,'','Branch','\0','\0','\0','\0',NULL,NULL,NULL),(10,'B','N','Disabled brokers','Brokers with no permissions',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,1,2,50,NULL,3,10,2048,3,1,2,3,2,'','\0','E','','','',36,3,1,4,4,3,1,5,NULL,NULL,6,2,5,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(11,'B','R','Removed brokers','Brokers that were removed from the system',3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,1,2,50,NULL,3,10,2048,3,1,2,3,2,'','\0','E','','','',36,3,1,4,4,3,1,5,NULL,NULL,6,2,5,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,NULL),(12,'O','N','My Ops',NULL,3,4,12,'N',10,12,0,2,'N',4,3,'\0',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,50,NULL,NULL,NULL,2048,3,NULL,NULL,NULL,NULL,'\0','\0',NULL,'\0','\0','\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,'\0',NULL,'\0','\0','\0','\0',NULL,NULL,2);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_history`
--

LOCK TABLES `login_history` WRITE;
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
INSERT INTO `login_history` VALUES (1,1,'2013-12-14 18:17:31','0:0:0:0:0:0:0:1%0'),(2,1,'2013-12-15 00:25:46','0:0:0:0:0:0:0:1%0'),(3,1,'2013-12-15 00:29:18','0:0:0:0:0:0:0:1%0'),(4,1,'2013-12-15 00:29:26','0:0:0:0:0:0:0:1%0'),(5,1,'2013-12-15 00:36:53','0:0:0:0:0:0:0:1%0'),(6,2,'2013-12-15 00:38:32','0:0:0:0:0:0:0:1%0'),(7,1,'2013-12-15 00:40:16','0:0:0:0:0:0:0:1%0'),(8,1,'2013-12-15 01:30:18','0:0:0:0:0:0:0:1%0'),(9,1,'2013-12-15 02:23:57','0:0:0:0:0:0:0:1%0'),(10,1,'2013-12-15 03:07:49','0:0:0:0:0:0:0:1%0'),(11,3,'2013-12-15 03:20:52','0:0:0:0:0:0:0:1%0'),(12,1,'2013-12-15 03:30:04','0:0:0:0:0:0:0:1%0'),(13,2,'2013-12-15 03:33:47','0:0:0:0:0:0:0:1%0'),(14,2,'2013-12-15 03:38:31','0:0:0:0:0:0:0:1%0'),(15,2,'2013-12-15 03:40:12','0:0:0:0:0:0:0:1%0'),(16,2,'2013-12-15 03:48:49','0:0:0:0:0:0:0:1%0'),(17,1,'2013-12-15 12:13:36','0:0:0:0:0:0:0:1%0'),(18,1,'2013-12-15 12:25:00','0:0:0:0:0:0:0:1%0'),(19,1,'2013-12-15 12:42:18','0:0:0:0:0:0:0:1%0'),(20,1,'2013-12-16 00:27:50','0:0:0:0:0:0:0:1%0'),(21,2,'2013-12-16 00:33:49','0:0:0:0:0:0:0:1%0'),(22,2,'2013-12-16 00:46:58','0:0:0:0:0:0:0:1%0'),(23,2,'2013-12-16 00:59:35','0:0:0:0:0:0:0:1%0'),(24,2,'2013-12-16 01:17:58','0:0:0:0:0:0:0:1%0'),(25,2,'2013-12-16 01:42:01','0:0:0:0:0:0:0:1%0'),(26,1,'2013-12-16 01:53:30','0:0:0:0:0:0:0:1%0'),(27,2,'2013-12-16 02:03:37','0:0:0:0:0:0:0:1%0'),(28,2,'2013-12-16 02:17:16','0:0:0:0:0:0:0:1%0'),(29,1,'2013-12-16 02:24:51','0:0:0:0:0:0:0:1%0'),(30,1,'2013-12-16 02:44:13','0:0:0:0:0:0:0:1%0'),(31,2,'2013-12-16 03:12:21','0:0:0:0:0:0:0:1%0'),(32,1,'2013-12-16 03:23:14','0:0:0:0:0:0:0:1%0'),(33,1,'2013-12-16 03:28:38','0:0:0:0:0:0:0:1%0'),(34,2,'2013-12-16 03:33:47','0:0:0:0:0:0:0:1%0'),(35,2,'2013-12-16 04:11:13','0:0:0:0:0:0:0:1%0'),(36,1,'2013-12-16 04:12:13','0:0:0:0:0:0:0:1%0'),(37,1,'2013-12-16 04:51:45','0:0:0:0:0:0:0:1%0'),(38,1,'2013-12-16 05:49:49','0:0:0:0:0:0:0:1%0'),(39,1,'2013-12-16 05:50:39','0:0:0:0:0:0:0:1%0'),(40,1,'2013-12-16 05:51:21','0:0:0:0:0:0:0:1%0'),(41,1,'2013-12-23 05:26:33','127.0.0.1'),(42,1,'2013-12-23 05:30:33','0:0:0:0:0:0:0:1'),(43,1,'2013-12-23 05:59:26','0:0:0:0:0:0:0:1'),(44,2,'2013-12-23 19:13:29','0:0:0:0:0:0:0:1'),(45,1,'2013-12-23 19:13:59','0:0:0:0:0:0:0:1'),(46,2,'2013-12-23 19:19:04','0:0:0:0:0:0:0:1'),(47,1,'2013-12-23 19:22:42','0:0:0:0:0:0:0:1'),(48,2,'2013-12-23 19:31:44','0:0:0:0:0:0:0:1'),(49,2,'2013-12-23 20:02:53','0:0:0:0:0:0:0:1'),(50,1,'2013-12-25 16:54:56','0:0:0:0:0:0:0:1'),(51,1,'2013-12-26 03:11:32','0:0:0:0:0:0:0:1'),(52,1,'2013-12-26 03:30:50','0:0:0:0:0:0:0:1'),(53,1,'2013-12-26 03:42:15','0:0:0:0:0:0:0:1'),(54,1,'2013-12-26 05:45:55','0:0:0:0:0:0:0:1'),(55,1,'2013-12-26 06:13:56','0:0:0:0:0:0:0:1'),(56,1,'2013-12-26 06:41:12','0:0:0:0:0:0:0:1'),(57,1,'2013-12-27 05:38:35','172.16.2.67'),(58,1,'2013-12-27 05:54:32','172.16.2.67'),(59,2,'2013-12-27 04:14:10','127.0.0.1'),(60,2,'2013-12-27 06:15:08','172.16.2.67'),(61,2,'2013-12-27 04:22:18','0:0:0:0:0:0:0:1'),(62,2,'2013-12-27 04:22:59','0:0:0:0:0:0:0:1'),(63,1,'2013-12-27 04:24:11','0:0:0:0:0:0:0:1'),(64,2,'2013-12-27 04:58:37','0:0:0:0:0:0:0:1'),(65,1,'2013-12-27 04:59:27','0:0:0:0:0:0:0:1'),(66,2,'2013-12-27 05:20:20','127.0.0.1'),(67,1,'2013-12-27 05:21:03','127.0.0.1'),(68,1,'2013-12-27 05:23:04','127.0.0.1'),(69,1,'2013-12-27 05:30:48','127.0.0.1'),(70,1,'2013-12-27 05:36:17','127.0.0.1'),(71,1,'2013-12-27 05:55:26','127.0.0.1'),(72,1,'2013-12-27 08:04:28','172.16.2.67');
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;
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
INSERT INTO `accounts` VALUES (1,'S','2013-12-14 18:15:32','2013-12-27','Debit/Loan account',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'S','2013-12-14 18:15:32','2013-12-27','Acacia International Master account',2,0.000000,NULL,NULL,NULL,NULL,NULL),(3,'S','2013-12-14 18:15:32','2013-12-27','Voucher account',3,0.000000,NULL,NULL,NULL,NULL,NULL),(4,'S','2013-12-14 18:15:32','2013-12-27','One Thor account',4,0.000000,NULL,NULL,NULL,NULL,NULL),(5,'M','2013-12-15 00:37:32','2013-12-27','12345',5,0.000000,NULL,2,'A','2013-12-16 00:48:24',NULL),(7,'M','2013-12-15 03:11:01','2013-12-27','91072989',5,0.000000,NULL,3,'A',NULL,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
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
  CONSTRAINT `FKB0148F2FF3ECFBC0` FOREIGN KEY (`pos_id`) REFERENCES `pos` (`id`),
  CONSTRAINT `FKB0148F2FFE01A09E` FOREIGN KEY (`owner_id`) REFERENCES `members` (`id`)
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
-- Table structure for table `translation_messages`
--

DROP TABLE IF EXISTS `translation_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translation_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_key` varchar(100) NOT NULL,
  `value` longtext,
  `locale` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `msg_key` (`msg_key`)
) ENGINE=InnoDB AUTO_INCREMENT=14439 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translation_messages`
--

LOCK TABLES `translation_messages` WRITE;
/*!40000 ALTER TABLE `translation_messages` DISABLE KEYS */;
INSERT INTO `translation_messages` VALUES (9628,'pt_BR:receipt.transfer.transactionNumber','No de transaÃ§Ã£o: {0}',NULL),(9629,'pt_BR:group.title.settings.loans','ConfiguraÃ§Ãµes de emprÃ©stimos',NULL),(9630,'pt_BR:guaranteeType.transferTypes','Tipos de pagamento',NULL),(9631,'pt_BR:paymentObligation.requestGuaranteeOk','A garantia foi gerada com sucesso, e possui estado {0}',NULL),(9632,'pt_BR:reports.members_reports.incoming_transactions','TransaÃ§Ãµes de crÃ©dito',NULL),(9633,'pt_BR:account.aRate','Ãndice-A',NULL),(9634,'pt_BR:help.title.bookkeeping','Contabilidade',NULL),(9635,'pt_BR:reports.members_reports.system_invoices','Faturas eletrÃ´nicas de sistema',NULL),(9636,'pt_BR:message.type.ACCOUNT','Eventos gerais de conta',NULL),(9637,'pt_BR:transactionFee.title.simple.list','Taxas de transaÃ§Ã£o',NULL),(9638,'pt_BR:memberImport.title.details.success','Membros importados com sucesso',NULL),(9639,'pt_BR:customField.payment.enabled','Habilitado',NULL),(9640,'pt_BR:reports.error.formDisplayError','Erro ao exibir o formulÃ¡rio',NULL),(9641,'pt_BR:alert.member.NEGATIVE_VIRTUAL_RATED_BALANCE','Um balanÃ§o negativo virtual de indices foi encontrado.',NULL),(9642,'pt_BR:customField.possibleValue.multipleValues','VocÃª pode digitar vÃ¡rios valores, um por linha',NULL),(9643,'pt_BR:permission.adminMemberLoans.viewAuthorized','Ver emprÃ©stimos autorizados',NULL),(9644,'pt_BR:global.show','Exibir',NULL),(9645,'pt_BR:guarantee.title.authorizeGuarantee','Autorizar garantia',NULL),(9646,'pt_BR:externalAccount.removeConfirmation','Remover essa conta externa?',NULL),(9647,'pt_BR:createMember.title.public','Cadastro de membro',NULL),(9648,'pt_BR:permission.systemReports.dRateConfigSimulation','SimulaÃ§Ã£o da configuraÃ§Ã£o do Ã­ndice-D',NULL),(9649,'pt_BR:externalTransferImport.error.importing.invalidMemberField','Campo personalizado invÃ¡lido ({0}): {1}',NULL),(9650,'pt_BR:guarantee.buyerName','Nome do comprador',NULL),(9651,'pt_BR:help.title.operators','Operadores',NULL),(9652,'pt_BR:scheduledPayments.title.list.of','Pagamentos agendados de {0}',NULL),(9653,'pt_BR:help.title.alerts_logs','Alertas e registros',NULL),(9654,'pt_BR:group.settings.possibleInitialGroups','Grupos iniciais possÃ­veis',NULL),(9655,'pt_BR:profile.action.invoiceAsMemberToMember','Fatura de membro para membro',NULL),(9656,'pt_BR:transferType.description','DescriÃ§Ã£o',NULL),(9657,'pt_BR:settings.local.language.ITALIAN','Italiano',NULL),(9658,'pt_BR:mobile.home.title','Cyclos',NULL),(9659,'pt_BR:group.settings.emailValidation','ValidaÃ§Ã£o do e-mail',NULL),(9660,'pt_BR:customField.type.BOOLEAN','Booleano',NULL),(9661,'pt_BR:transactionFee.subject.DESTINATION','Membro que estÃ¡ recebendo (destino)',NULL),(9662,'pt_BR:transfer.schedulingDetails','{0} de {1}, total de {2}',NULL),(9663,'pt_BR:pos.discarded','O POS foi descartado',NULL),(9664,'pt_BR:conversionSimulation.date','Data de conversÃ£o',NULL),(9665,'pt_BR:group.settings.maxPinWrongTries','No. mÃ¡x. de tentativas de PIN',NULL),(9666,'pt_BR:transferType.availability','Disponibilidade',NULL),(9667,'pt_BR:transactionFee.receiver','Quem irÃ¡ receber',NULL),(9668,'pt_BR:accountFee.chargeMode.VOLUME_PERCENTAGE','Percentual sobre volume positivo',NULL),(9669,'pt_BR:group.settings.passwordPolicy.AVOID_OBVIOUS','Proibir senhas Ã³bvias',NULL),(9670,'pt_BR:reports.stats.general.graph','GrÃ¡fico',NULL),(9671,'pt_BR:pendingMember.validationKey','CÃ³digo de validaÃ§Ã£o',NULL),(9672,'pt_BR:invoice.title.system','Faturas eletrÃ´nicas de sistema',NULL),(9673,'pt_BR:memberImport.status.UNKNOWN_ERROR','Erro desconhecido: {0}',NULL),(9674,'pt_BR:global.month.OCTOBER','Outubro',NULL),(9675,'pt_BR:fieldMapping.title.order.description','Arraste os campos para alterar a ordem',NULL),(9676,'pt_BR:memberImport.initialDebitTransferType','Tipo de pagamento para saldos negativos',NULL),(9677,'pt_BR:webshop.confirm.text','Por favor, confira os dados acima e confirme a operaÃ§Ã£o',NULL),(9678,'pt_BR:serviceClient.password','Senha HTTP',NULL),(9679,'pt_BR:image.details.hint','Preencha a legenda da imagem',NULL),(9680,'pt_BR:sms.type.OPERATION_CONFIRMATION.description','ConfirmaÃ§Ã£o de operaÃ§Ã£o',NULL),(9681,'pt_BR:defaultBrokerCommission.defaultCommissionAmount','Valor padrÃ£o da comissÃ£o',NULL),(9682,'pt_BR:home.admin.status.systemAlerts','NÃºmero de avisos de sistema',NULL),(9683,'pt_BR:permission.adminMemberRecords','Registros de membro',NULL),(9684,'pt_BR:quickAccess.title','Acesso rÃ¡pido',NULL),(9685,'pt_BR:accountType.nature','Tipo',NULL),(9686,'pt_BR:reports.members.ads.scheduled','Agendado',NULL),(9687,'pt_BR:groupFilter.inserted','Filtro de grupos inserido',NULL),(9688,'pt_BR:translationMessage.import.type','O que fazer',NULL),(9689,'pt_BR:accountType.title.modify.member','Modificar tipo de conta de membro',NULL),(9690,'pt_BR:customImage.size','Tamanho',NULL),(9691,'pt_BR:accountFee.chargeMode.NEGATIVE_BALANCE_PERCENTAGE','Percentual sobre saldo negativo',NULL),(9692,'pt_BR:permission.systemSettings.manageMail','Gerenciar configuraÃ§Ãµes de e-mail',NULL),(9693,'pt_BR:accountFee.modified','A taxa de conta foi modificada',NULL),(9694,'pt_BR:currency.dRate.initDate','Data de inÃ­cio para o Ã­ndice-D',NULL),(9695,'pt_BR:reports.stats.keydevelopments.transactionAmount.yAxis','Valor/transaÃ§Ã£o (unidades)',NULL),(9696,'pt_BR:settings.local.csv.useHeader','Exibir cabeÃ§alho',NULL),(9697,'pt_BR:reports.current.references.total','Quantidade total de referÃªncias dadas',NULL),(9698,'pt_BR:memberImport.sendActivationMail','Enviar o e-mail de ativaÃ§Ã£o',NULL),(9699,'pt_BR:paymentFilter.title','Filtro de pagamentos',NULL),(9700,'pt_BR:invoice.destination','Destino',NULL),(9701,'pt_BR:externalTransferType.title.insert','Inserir tipo de pagamento',NULL),(9702,'pt_BR:errors.numeric','{0} deve conter apenas nÃºmeros',NULL),(9703,'pt_BR:reports.stats.activity.histogram.grossProduct.xAxis','Produto bruto',NULL),(9704,'pt_BR:profile.action.scheduledPayments','Ver pagamentos agendados',NULL),(9705,'pt_BR:customField.orderModified','A ordem dos campos foi modificada',NULL),(9706,'pt_BR:accountFee.day','Dia',NULL),(9707,'pt_BR:brokering.status.ACTIVE','Ativo',NULL),(9708,'pt_BR:card.manage','Gerenciar cartÃ£o',NULL),(9709,'pt_BR:loanPayment.search.discardedAmount','Descartado',NULL),(9710,'pt_BR:permission.memberGuarantees.issueCertifications','Emitir certificaÃ§Ãµes',NULL),(9711,'pt_BR:brokerCommissionContract.action.new','Novo contrato',NULL),(9712,'pt_BR:receiptPrinterSettings.name','Nome de exibiÃ§Ã£o',NULL),(9713,'pt_BR:guaranteeType.fee.value','Valor',NULL),(9714,'pt_BR:permission.systemExternalAccounts.view','Visualizar',NULL),(9715,'pt_BR:authorizationLevel.error.removing','NÃ£o Ã© possÃ­vel remover este nÃ­vel de autorizaÃ§Ã£o pois hÃ¡ pagamentos dependentes dele',NULL),(9716,'pt_BR:settings.local.csv.stringQuote.DOUBLE_QUOTE','Aspas duplas',NULL),(9717,'pt_BR:global.selectNone','Nenhum',NULL),(9718,'pt_BR:permission.brokerLoanGroups.view','Ver',NULL),(9719,'pt_BR:sms.type.ACCOUNT_DETAILS_ERROR.description','Erro dos detalhes da conta',NULL),(9720,'pt_BR:menu.admin.contentManagement.manageThemes','Temas',NULL),(9721,'pt_BR:accountFee.invoiceMode.NEVER','Nunca (o saldo da conta do membro pode ficar negativo)',NULL),(9722,'pt_BR:changeGroup.old','Grupo anterior',NULL),(9723,'pt_BR:reports.stats.error.initialAndFinalYearsRequired','Ã‰ obrigatÃ³rio informar os anos inicial e final',NULL),(9724,'pt_BR:profile.error.changeEmailValidationFailed','VocÃª tentou alterar o e-mail, mas o e-mail de verificaÃ§Ã£o nÃ£o pÃ´de ser enviado',NULL),(9725,'pt_BR:alert.system.nullIrate','Indice I tem um valor nulo inesperado para a conta {0}. VocÃª pode querer reinicializar o indice I.',NULL),(9726,'pt_BR:errors.periodExpired','O perÃ­odo completo de {0} deve ser apÃ³s a data de hoje',NULL),(9727,'pt_BR:posweb.searchTransactions.title.transactions','Pagamentos processados',NULL),(9728,'pt_BR:guarantee.error.changeStatus','NÃ£o foi possÃ­vel alterar o estado da garantia para {0}',NULL),(9729,'pt_BR:group.title.modify.member','ConfiguraÃ§Ãµes de grupo de membros',NULL),(9730,'pt_BR:group.settings.maxImagesPerMember','No. mÃ¡x. de imagens de perfil por membro',NULL),(9731,'pt_BR:payment.statusGroup.CLOSED_WITH_ERRORS','Fechado (parcial)',NULL),(9732,'pt_BR:permission.systemTasks','Tarefas administrativas',NULL),(9733,'pt_BR:reports.current.invoices.MEMBER.amount','Soma total de faturas eletrÃ´nicas de membro',NULL),(9734,'pt_BR:guaranteeType.error.removing','Erro ao excluir o tipo de garantia. Possivelmente exista alguma garantia ou certificaÃ§Ã£o utilizando-o',NULL),(9735,'pt_BR:reports.stats.general.period','PerÃ­odo',NULL),(9736,'pt_BR:help.title.reports','RelatÃ³rios',NULL),(9737,'pt_BR:reference.removed','ReferÃªncia removida',NULL),(9738,'pt_BR:settings.local.decimalInputMethod.RTL','Direita para a esquerda (somente nÃºmeros sÃ£o digitados)',NULL),(9739,'pt_BR:group.account.pendingAccounts','Existem {0} contas em ativaÃ§Ã£o',NULL),(9740,'pt_BR:registrationAgreement.title.insert','Novo termo de adesÃ£o',NULL),(9741,'pt_BR:externalAccount.tooltip.import','ImportaÃ§Ãµes de arquivos de transaÃ§Ãµes',NULL),(9742,'pt_BR:menu.operator.personal.profile','Perfil',NULL),(9743,'pt_BR:adminTasks.indexes.rebuildAll','Reconstruir todos',NULL),(9744,'pt_BR:reports.members_reports.credits','CrÃ©ditos',NULL),(9745,'pt_BR:global.change','Alterar',NULL),(9746,'pt_BR:loan.repaidAmount','Valor pago',NULL),(9747,'pt_BR:transfer.dRate','Ã­ndice-D',NULL),(9748,'pt_BR:memberRecordType.showMenuItem','Exibir item de menu',NULL),(9749,'pt_BR:scheduledPayments.totalPaid','Total pago',NULL),(9750,'pt_BR:customImage.system.active','Ãcone ativo',NULL),(9751,'pt_BR:pendingMember.title.print','Resultado da busca de membros pendentes',NULL),(9752,'pt_BR:reports.stats.activity.comparePeriods.grossProduct.row2','Produto bruto sobre todos membros',NULL),(9753,'pt_BR:settings.mail.activation','E-mail de ativaÃ§Ã£o',NULL),(9754,'pt_BR:reports.stats.activity.comparePeriods.grossProduct.row1','Produto bruto por membro com entradas',NULL),(9755,'pt_BR:transactionFee.generatedTransferType','Tipo de transaÃ§Ã£o gerado',NULL),(9756,'pt_BR:cardLog.date','Data',NULL),(9757,'pt_BR:brokerCommissionContract.brokerCommission','Tipo de comissÃ£o',NULL),(9758,'pt_BR:profile.action.invoices','Ver faturas eletrÃ´nicas',NULL),(9759,'pt_BR:accountType.limitType.LIMITED','Limitado',NULL),(9760,'pt_BR:paymentObligation.error.maxPublicationDateAfterExpirationDate','A data limite de publicaÃ§Ã£o nÃ£o pode ser posterior Ã  data de vencimento',NULL),(9761,'pt_BR:global.tooltip.view','Visualizar',NULL),(9762,'pt_BR:permission.brokerInvoices.sendAsMemberToSystem','Enviar como membro para sistema',NULL),(9763,'pt_BR:permission.adminMemberPayments.paymentAsMemberToMember','Pagamentos de membros para membros',NULL),(9764,'pt_BR:permission.systemServiceClients.view','Ver',NULL),(9765,'pt_BR:customImage.system.conciliated','Pagamento externo conciliado',NULL),(9766,'pt_BR:translationMessage.inserted','A chave de traduÃ§Ã£o foi inserida',NULL),(9767,'pt_BR:reports.stats.general.nodata','Poucos dados (ou nenhum dado) disponÃ­vel para este item.',NULL),(9768,'pt_BR:card.status.PENDING','Pendente',NULL),(9769,'pt_BR:reports.stats.activity.title','EstatÃ­sticas de atividades',NULL),(9770,'pt_BR:menu.admin.customFields.loanGroupFields','Grupo de emprÃ©stimos',NULL),(9771,'pt_BR:changeBroker.noBroker','Nenhum',NULL),(9772,'pt_BR:conversionSimulation.dRate','Ãndice-D',NULL),(9773,'pt_BR:reports.stats.choose.keydevelopments','Progressos-chave',NULL),(9774,'pt_BR:reports.stats.activity.comparePeriods.numberTransactions.yAxis','no. transaÃ§Ãµes',NULL),(9775,'pt_BR:permission.adminMemberPreferences.manageNotifications','Gerenciar notificaÃ§Ãµes',NULL),(9776,'pt_BR:reference.title.references.of','ReferÃªncias de {0}',NULL),(9777,'pt_BR:loan.monthlyInterestRepaymentType','Tipo de pagamento para juros mensais',NULL),(9778,'pt_BR:customField.action.new','Novo campo customizado',NULL),(9779,'pt_BR:permission.adminAdminRecords','Registros de administradores',NULL),(9780,'pt_BR:settings.title.translations.file','Importar / exportar traduÃ§Ãµes de notificaÃ§Ã£o e de e-mail',NULL),(9781,'pt_BR:payment.error.maxAmountOnDayExceeded.at','VocÃª jÃ¡ excedeu o valor mÃ¡ximo para esse tipo de pagamento ({0}) no dia {1}',NULL),(9782,'pt_BR:group.account.title','Contas de grupo',NULL),(9783,'pt_BR:payment.denied','O pagamento foi negado',NULL),(9784,'pt_BR:general.error.csv.unknownColumn','Coluna invÃ¡lida no arquivo CSV: {0}',NULL),(9785,'pt_BR:menu.admin.accounts.manage','Gerenciar contas',NULL),(9786,'pt_BR:transfer.Conciliated','Conciliado',NULL),(9787,'pt_BR:guarantee.amount','Valor',NULL),(9788,'pt_BR:settings.message.certificationIssued','CertificaÃ§Ã£o emitida',NULL),(9789,'pt_BR:operator.action.create','Criar um novo operador',NULL),(9790,'pt_BR:reports.stats.keydevelopments.numberOfMembers','NÃºmero de membros',NULL),(9791,'pt_BR:settings.mail.message','Mensagem',NULL),(9792,'pt_BR:reports.current.n_expads','NÃºmero de anÃºncios vencidos',NULL),(9793,'pt_BR:reports.stats.activity.singlePeriod.percentageNoTrade.row1','% de membros que nÃ£o transacionam',NULL),(9794,'pt_BR:message.title.view','Detalhes da mensagem',NULL),(9795,'pt_BR:reports.stats.keydevelopments.numberOfTransactions.yAxis','NÃºmero',NULL),(9796,'pt_BR:reports.stats.activity.topten.grossProduct.col1','Produto bruto',NULL),(9797,'pt_BR:group.settings.smsCustomContextInvalid','A classe customizada para o contexto SMS Ã© invÃ¡lida',NULL),(9798,'pt_BR:transactionFee.when.DAYS','Dias',NULL),(9799,'pt_BR:settings.alert.modified','ConfiguraÃ§Ãµes de alerta modificadas',NULL),(9800,'pt_BR:pos.actions.unblockPin','Desbloquear Pin',NULL),(9801,'pt_BR:brokerCommissionContract.title.modify','Modificar contrato de comissÃ£o de corretor',NULL),(9802,'pt_BR:reports.stats.activity.throughTime.nTraders','no. Membros negociando',NULL),(9803,'pt_BR:group.containerUrl','URL da pÃ¡gina container',NULL),(9804,'pt_BR:permission.adminMemberInvoices.manage','Gerenciar faturas eletrÃ´nicas de membro',NULL),(9805,'pt_BR:activities.rates.asFeePercentage','Resultando na presente taxa de conversÃ£o:',NULL),(9806,'pt_BR:alert.member.GIVEN_VERY_BAD_REFS','O membro deu muitas referÃªncias de valor \'muito ruim\'',NULL),(9807,'pt_BR:profile.member.hide','Ocultar',NULL),(9808,'pt_BR:group.customizedFiles.modified','O arquivo foi modificado para esse grupo',NULL),(9809,'pt_BR:transferType.confirmationMessage','Mensagem de confirmaÃ§Ã£o',NULL),(9810,'pt_BR:brokerCommission.removeConfirmation','Remover essa comissÃ£o de corretor?',NULL),(9811,'pt_BR:smsLog.type.NOTIFICATION','NotificaÃ§Ã£o',NULL),(9812,'pt_BR:changeGroup.member.title','Alterar grupo do membro {0}',NULL),(9813,'pt_BR:externalAccountHistory.title.summary','SumÃ¡rio das transaÃ§Ãµes',NULL),(9814,'pt_BR:createAdmin.created','O administrador foi criado',NULL),(9815,'pt_BR:adImport.totalAds','NÃºmero total de anÃºncios',NULL),(9816,'pt_BR:guarantee.buyerUsername','UsuÃ¡rio do comprador',NULL),(9817,'pt_BR:cardType.cardSecurityCodeLength','Comprimento do cÃ³digo de seguranÃ§a',NULL),(9818,'pt_BR:menu.admin.alerts','Alertas',NULL),(9819,'pt_BR:transactionPassword.generated','Sua senha de transaÃ§Ã£o Ã©:',NULL),(9820,'pt_BR:reports.stats.taxes.paid.notPaidLimit','Limitar para \"nÃ£o pagas\"',NULL),(9821,'pt_BR:message.link.label','Clique aqui',NULL),(9822,'pt_BR:account.owner','ProprietÃ¡rio',NULL),(9823,'pt_BR:conversionSimulation.dRate.present','Ãndice-D atual',NULL),(9824,'pt_BR:home.admin.status.openInvoices','Faturas abertas para sistema',NULL),(9825,'pt_BR:card.securityCodeUnblocked','CÃ³digo de seguranÃ§a desbloqueado',NULL),(9826,'pt_BR:reports.stats.finances.ComparePeriods.income.yAxis','Entrada',NULL),(9827,'pt_BR:permission.systemPayments.blockScheduled','Bloquear pagamento agendado',NULL),(9828,'pt_BR:customField.member.loanSearchAccess','Busca por emprÃ©stimo',NULL),(9829,'pt_BR:reports.stats.activity.throughTime.numberTransactions.yAxis','NÃºmero de transaÃ§Ãµes',NULL),(9830,'pt_BR:reports.stats.activity.singlePeriod.grossProduct.title','Produto bruto por membro (perÃ­odo simples)',NULL),(9831,'pt_BR:payment.recipient','DestinatÃ¡rio',NULL),(9832,'pt_BR:guaranteeType.authorizedBy.ADMIN','AdministraÃ§Ã£o',NULL),(9833,'pt_BR:reports.stats.taxes.paid.paid','Pagas',NULL),(9834,'pt_BR:permission.systemPayments.authorize','Autorizar',NULL),(9835,'pt_BR:paymentFilter.inserted','O filtro de pagamentos foi inserido',NULL),(9836,'pt_BR:reference.action.remove','Remover',NULL),(9837,'pt_BR:accountFeeLog.date','Data',NULL),(9838,'pt_BR:paymentObligation.conceal','Conciliar',NULL),(9839,'pt_BR:settings.local.applicationName','Nome do aplicativo',NULL),(9840,'pt_BR:contact.modified','O contato foi modificado',NULL),(9841,'pt_BR:alert.title.member','Avisos de membros',NULL),(9842,'pt_BR:adCategory.insertMultiple','VocÃª pode digitar vÃ¡rias categorias, uma por linha',NULL),(9843,'pt_BR:permission.systemExternalAccounts','Contas externas',NULL),(9844,'pt_BR:adminTasks.indexes.type.Ad','AnÃºncios',NULL),(9845,'pt_BR:menu.member.personal.references','ReferÃªncias',NULL),(9846,'pt_BR:smsMailing.recipients','DestinatÃ¡rios',NULL),(9847,'pt_BR:settings.local.csv.recordSeparator.LF','Unix (char 13)',NULL),(9848,'pt_BR:groupFilter.customizedFiles.removed','O arquivo nÃ£o estÃ¡ mais customizado para este filtro de grupos',NULL),(9849,'pt_BR:customField.title.insert.payment','Novo campo de {0}',NULL),(9850,'pt_BR:reports.stats.general.allPaymentTypes','Todos os pagamento',NULL),(9851,'pt_BR:permission.operatorAccount.authorizedInformation','Ver pagamentos autorizados',NULL),(9852,'pt_BR:pos.pinUnblocked','O pin foi desbloqueado',NULL),(9853,'pt_BR:loanPayment.status.UNRECOVERABLE','IrrecuperÃ¡vel',NULL),(9854,'pt_BR:paymentFilter.transferTypes','Tipos de transaÃ§Ã£o',NULL),(9855,'pt_BR:transactionFee.fromFixedMember.name','Nome completo de origem',NULL),(9856,'pt_BR:memberImport.status.INVALID_CUSTOM_FIELD','{0} Ã© invÃ¡lido: {1}',NULL),(9857,'pt_BR:group.settings.maxSchedulingPeriod','MÃ¡x. de tempo para agendamento',NULL),(9858,'pt_BR:accountHistory.conciliation.conciliationStatus','Estado conciliaÃ§Ã£o',NULL),(9859,'pt_BR:reference.title.new.transactionFeedback','Qualificar transaÃ§Ã£o',NULL),(9860,'pt_BR:connectedUsers.nature.select','Por favor, selecione o tipo de usuÃ¡rio',NULL),(9861,'pt_BR:accountHistory.creditsDebitsBalance.amount','BalanÃ§o de transaÃ§Ãµes',NULL),(9862,'pt_BR:transferType.maxAmountPerDay','Valor mÃ¡ximo por dia',NULL),(9863,'pt_BR:customField.size.TINY','Muito Pequeno',NULL),(9864,'pt_BR:document.nature.MEMBER','Membro',NULL),(9865,'pt_BR:reports.stats.general.table','Tabela',NULL),(9866,'pt_BR:settings.message.adminSystemAlert','Alertas de sistema',NULL),(9867,'pt_BR:menu.admin.settings.message','Config. de mensagem',NULL),(9868,'pt_BR:reference.level.GOOD','Bom',NULL),(9869,'pt_BR:message.date','Data',NULL),(9870,'pt_BR:externalAccountHistory.search.noResults','VocÃª nÃ£o tem transaÃ§Ãµes para os filtros indicados',NULL),(9871,'pt_BR:menu.admin.accounts.invoices','Gerenciar faturas',NULL),(9872,'pt_BR:image.removed','Imagem removida',NULL),(9873,'pt_BR:changeGroup.error.remove.activeMember','Um membro ativo nÃ£o pode ser removido.\nTente movÃª-lo para um group do tipo REMOVIDO',NULL),(9874,'pt_BR:paymentObligation.reject','Rejeitar',NULL),(9875,'pt_BR:rates.error.pendingRateExists','VocÃª tentou inicializar um indice, mas uma inicializaÃ§Ã£o de indice jÃ¡ esta pendente.\nVocÃª pode executar apenas uma de cada vez.',NULL),(9876,'pt_BR:transfer.type','Tipo de transaÃ§Ã£o',NULL),(9877,'pt_BR:adImport.status.INVALID_COLUMN','Coluna invÃ¡lida: {0}',NULL),(9878,'pt_BR:member.loanGroups','Grupos de emprÃ©stimos',NULL),(9879,'pt_BR:brokering.loans.count','EmprÃ©stimos em aberto',NULL),(9880,'pt_BR:reports.stats.finances.ComparePeriods.expenditure.yAxis','SaÃ­das',NULL),(9881,'pt_BR:invoice.search.direction.INCOMING','Entrada',NULL),(9882,'pt_BR:payment.statusGroup.CLOSED_WITHOUT_ERRORS','Fechado (completo)',NULL),(9883,'pt_BR:permission.adminMemberAccess.changePin','Alterar senha externa',NULL),(9884,'pt_BR:alert.system.NEW_VERSION_OF_HELP_FILE','Nova versÃ£o de arquivo de ajuda',NULL),(9885,'pt_BR:externalAccount.action.new','Inserir nova conta externa',NULL),(9886,'pt_BR:externalTransferType.code','CÃ³digo',NULL),(9887,'pt_BR:theme.import.successful','O tema foi importado com sucesso',NULL),(9888,'pt_BR:transferType.title.insert','Inserir tipo de transaÃ§Ã£o',NULL),(9889,'pt_BR:customField.member.access.OTHER','Outros membros',NULL),(9890,'pt_BR:creditLimit.normal','Inferior',NULL),(9891,'pt_BR:help.title.custom_fields','Campos customizados',NULL),(9892,'pt_BR:menu.member.account.simulateConversion','Simular conversÃ£o',NULL),(9893,'pt_BR:loan.repayment.transactionPassword.discardOnly','Para descartar esta parcela de emprÃ©stimo, vocÃª deve fornecer sua senha de transaÃ§Ã£o',NULL),(9894,'pt_BR:accountHistory.initialBalance','Saldo inicial',NULL),(9895,'pt_BR:permission.adminAdminAccess.disconnect','Desconectar',NULL),(9896,'pt_BR:permission.brokerCards.generate','Gerar',NULL),(9897,'pt_BR:paymentObligation.modified','A obrigaÃ§Ã£o de pagamento foi alterada com sucesso',NULL),(9898,'pt_BR:quickAccess.makePayment','Pagamento',NULL),(9899,'pt_BR:mobile.viewPayments.related','UsuÃ¡rio',NULL),(9900,'pt_BR:global.confirm','Confirmar',NULL),(9901,'pt_BR:externalAccountHistory.amountRange.begin','Apartir de',NULL),(9902,'pt_BR:permission.adminMemberReports.amounts','Exibir valores',NULL),(9903,'pt_BR:reports.members_reports.details_level','NÃ­vel de detalhamento',NULL),(9904,'pt_BR:receipt.transfer.status','Status: {0}',NULL),(9905,'pt_BR:memberImport.title.summary','SumÃ¡rio da importaÃ§Ã£o de membros',NULL),(9906,'pt_BR:group.settings.passwordPolicy.AVOID_OBVIOUS_LETTERS_NUMBERS_SPECIAL','Requerer letras, nÃºmeros e especiais',NULL),(9907,'pt_BR:errorLog.parameters','ParÃ¢metros requeridos',NULL),(9908,'pt_BR:remark.inserted','A observaÃ§Ã£o foi inserida',NULL),(9909,'pt_BR:home.admin.status.errors','Erros do aplicativo',NULL),(9910,'pt_BR:quickAccess.contacts','Contatos',NULL),(9911,'pt_BR:loan.repayment.confirmationMessage','VocÃª tem certeza de que quer pagar {0}?\n\nPor favor, clique em OK para prosseguir',NULL),(9912,'pt_BR:groupFilter.title.modify','Modificar filtro de grupos',NULL),(9913,'pt_BR:groupFilter.modified','Filtro de grupos modificado',NULL),(9914,'pt_BR:customField.size.FULL','Completo',NULL),(9915,'pt_BR:accountOverview.title.system','Contas de sistema',NULL),(9916,'pt_BR:memberImport.status.INVALID_COLUMN','Coluna invÃ¡lida: {0}',NULL),(9917,'pt_BR:alert.system.ACCOUNT_FEE_RUNNING','Taxa de conta iniciada',NULL),(9918,'pt_BR:permission.adminMemberCards','CartÃµes',NULL),(9919,'pt_BR:serviceClient.member','Restrito ao membro',NULL),(9920,'pt_BR:ad.tradeType.OFFER','Oferta',NULL),(9921,'pt_BR:externalTransferType.removed','Remover tipo de pagamento?',NULL),(9922,'pt_BR:reference.title.summary.transactionFeedbacks.of','QualificaÃ§Ãµes de transaÃ§Ãµes de {0}',NULL),(9923,'pt_BR:loan.repayment.transactionPassword.repayOrDiscard','Para pagar ou descartar esta parcela de emprÃ©stimo, vocÃª deve fornecer sua senha de transaÃ§Ã£o',NULL),(9924,'pt_BR:reports.stats.activity.topten.member','Membro',NULL),(9925,'pt_BR:settings.action.IMPORT','Importar',NULL),(9926,'pt_BR:accountOverview.title.of','Contas de {0}',NULL),(9927,'pt_BR:translationMessage.title.importExport','Importar / exportar chaves de traduÃ§Ã£o',NULL),(9928,'pt_BR:help.title.account_management','GerÃªncia de contas',NULL),(9929,'pt_BR:profile.modified','Perfil modificado',NULL),(9930,'pt_BR:menu.member.broker.messageToMembers','Mensagem para membros',NULL),(9931,'pt_BR:payment.title.memberToMember','Pagamento para membro',NULL),(9932,'pt_BR:conversionSimulation.dRate.targeted','Ãndice-D desejado',NULL),(9933,'pt_BR:customField.memberRecord.showInSearch','Exibir em buscas',NULL),(9934,'pt_BR:permission.memberCards.activate','Ativar',NULL),(9935,'pt_BR:customImage.system.mobileSplash_small','Mobile: Imagem inicial pequena',NULL),(9936,'pt_BR:mobile.welcomeMessage','Por favor altere a seguinte chave de traduÃ§Ã£o (Na sessÃ£o de administraÃ§Ã£o: TraduÃ§Ã£o - AplicaÃ§Ã£o): mobile.welcomeMessage',NULL),(9937,'pt_BR:admin.search.noResults','Nenhum administrador foi encontrado',NULL),(9938,'pt_BR:channel.internalNameAlreadyInUse','O nome interno jÃ¡ esta em uso',NULL),(9939,'pt_BR:certification.issuerUsername','UsuÃ¡rio do emissor',NULL),(9940,'pt_BR:loan.status.OPEN','Aberto',NULL),(9941,'pt_BR:accountOverview.title.my','Minhas contas',NULL),(9942,'pt_BR:memberRecordType.title.list','Tipos de registro de membro',NULL),(9943,'pt_BR:menu.operator.account.scheduledPayments','Pagamentos agendados',NULL),(9944,'pt_BR:permission.systemAlerts.manageMemberAlerts','Gerenciar avisos de membro',NULL),(9945,'pt_BR:category.status','Estado',NULL),(9946,'pt_BR:settings.local.csv.recordSeparator.CR','Macintosh (char 10)',NULL),(9947,'pt_BR:permission.adminMemberLoans.view','Ver emprÃ©stimos de membros',NULL),(9948,'pt_BR:loan.queryStatus.AUTHORIZATION_DENIED','AutorizaÃ§Ã£o negada',NULL),(9949,'pt_BR:permission.brokerPos.manage','Gerenciar',NULL),(9950,'pt_BR:menu.admin.home','PÃ¡gina principal',NULL),(9951,'pt_BR:receiptPrinter.error.noConfiguration','A configuraÃ§Ã£o de impressora de recibos nÃ£o foi encontrada',NULL),(9952,'pt_BR:member.search.selectGroups','Selecione os grupos',NULL),(9953,'pt_BR:loanPayment.status.DISCARDED','Descartado',NULL),(9954,'pt_BR:message.action.confirmDelete','Confirma a remoÃ§Ã£o permanente da mensagem?',NULL),(9955,'pt_BR:permission.memberPayments.chargeback','Estornar pagamento recebido',NULL),(9956,'pt_BR:changeChannels.invalidChannelsSelection','Por favor verifique os canais selecionados. Existe um canal selecionado para ser ativado e desativado ao mesmo tempo: {0}.',NULL),(9957,'pt_BR:permission.operatorGuarantees','Garantias',NULL),(9958,'pt_BR:payment.confirmation.header.withAuthorization','VocÃª estÃ¡ prestes a submeter o seguinte pagamento para posterior autorizaÃ§Ã£o:',NULL),(9959,'pt_BR:settings.local.decimalInputMethod','MÃ©todo de digitaÃ§Ã£o de nÃºmeros decimais',NULL),(9960,'pt_BR:customImage.system.systemLogo','Logotipo do sistema',NULL),(9961,'pt_BR:member.bulkActions.channelsChanged','As alteraÃ§Ãµes foram aplicadas a {0} membros. {1} membros nÃ£o foram modificados.',NULL),(9962,'pt_BR:paymentObligation.pack.paymentObligationPeriod','PerÃ­odo mÃ¡ximo entre os vencimentos das obrigaÃ§Ãµes de pagamento:',NULL),(9963,'pt_BR:account.status.INACTIVE','Inativa',NULL),(9964,'pt_BR:accountFee.chargeMode.BALANCE_PERCENTAGE','Percentual sobre saldo positivo',NULL),(9965,'pt_BR:pos.status.DISCARDED','Descartado',NULL),(9966,'pt_BR:customField.size.LARGE','Grande',NULL),(9967,'pt_BR:activities.invoices.incoming.count','No. de entradas',NULL),(9968,'pt_BR:loan.summary.amount','Valor total',NULL),(9969,'pt_BR:loan.queryStatus.CLOSED','Fechado / quitado',NULL),(9970,'pt_BR:permission.memberInvoices.sendToSystem','Enviar para sistema',NULL),(9971,'pt_BR:menu.admin.translation','TraduÃ§Ã£o',NULL),(9972,'pt_BR:permission.brokerReferences.manage','Gerenciar',NULL),(9973,'pt_BR:settings.local.language.JAPANESE','JaponÃªs',NULL),(9974,'pt_BR:guaranteeType.inserted','O tipo de garantia foi inserido com sucesso',NULL),(9975,'pt_BR:permission.brokerMemberSms.view','Ver',NULL),(9976,'pt_BR:category.status.INACTIVE','Inativa',NULL),(9977,'pt_BR:accountFee.title.history','HistÃ³rico da taxa de conta',NULL),(9978,'pt_BR:theme.error.notSelected','Nenhum tema selecionado',NULL),(9979,'pt_BR:document.nature.STATIC','EstÃ¡tico',NULL),(9980,'pt_BR:externalTransferImport.error.importing.comments','O campo {0} (coluna {1}) possui valor invÃ¡lido: {2}',NULL),(9981,'pt_BR:guaranteeType.creditFee','Taxa de crÃ©dito',NULL),(9982,'pt_BR:accountFee.enabled','Habilitada',NULL),(9983,'pt_BR:reports.simulations.aRateConfigSimulation.title','SimulaÃ§Ã£o da configuraÃ§Ã£o do Ã­ndice-A',NULL),(9984,'pt_BR:adImport.status.MAX_PUBLICATION_EXCEEDED','PerÃ­odo mÃ¡ximo de publicaÃ§Ã£o excedido',NULL),(9985,'pt_BR:memberPos.changePin.notEqual','PIN nÃ£o sÃ£o iguais',NULL),(9986,'pt_BR:transfer.scheduling','Agendamento',NULL),(9987,'pt_BR:payment.confirmation.block','VocÃª estÃ¡ prestes a bloquear este pagamento.\n\nPor favor, clique em OK para confirmar',NULL),(9988,'pt_BR:customImage.system.quickAccess_accountInfo','Acesso rÃ¡pido: informaÃ§Ãµes de conta',NULL),(9989,'pt_BR:menu.member.preferences.adInterests','Interesse em anÃºncios',NULL),(9990,'pt_BR:serviceOperation.MANAGE_MEMBERS','Gerenciar membros',NULL),(9991,'pt_BR:ad.status.PERMANENT','Permanente',NULL),(9992,'pt_BR:reports.members.presentation.list.result','Resultado da lista de membros',NULL),(9993,'pt_BR:permission.systemAccountFees.charge','Cobrar',NULL),(9994,'pt_BR:settings.message.paymentReceived','Pagamento recebido',NULL),(9995,'pt_BR:alert.system.indexRebuildEnd','A reconstruÃ§Ã£o dos Ã­ndices de busca para {0} foi concluÃ­da em {1}',NULL),(9996,'pt_BR:ad.addPicture','Adicionar imagem',NULL),(9997,'pt_BR:customImage.system.quickAccess_updateProfile','Acesso rÃ¡pido: atualizar perfil',NULL),(9998,'pt_BR:memberRecordType.layout','Layout do resultado da busca',NULL),(9999,'pt_BR:adInterest.title.list','Lista de interesses em anÃºncios',NULL),(10000,'pt_BR:group.settings.initialGroupForRegisteredMembers','Grupo inicial para usuÃ¡rios registrados',NULL),(10001,'pt_BR:reports.stats.paymentFilters.nothingSelected','Erro: Nenhum filtro de pagamentos selecionado\n\nVocÃª deve selecionar pelo menos um filtro de pagamentos.',NULL),(10002,'pt_BR:createMember.created','O membro foi criado',NULL),(10003,'pt_BR:reports.members_reports.outgoing_transactions','TransaÃ§Ãµes de dÃ©bito',NULL),(10004,'pt_BR:reports.stats.general.selectAny','Selecione nenhum, um ou mais',NULL),(10005,'pt_BR:mobile.viewPayments.noPayment','VocÃª nÃ£o tem pagamentos',NULL),(10006,'pt_BR:memberImport.status.INVALID_RECORD_TYPE','O tipo registro Ã© invÃ¡lido: {0}',NULL),(10007,'pt_BR:creditLimit.current','Atual',NULL),(10008,'pt_BR:loan.repaymentDays','Dias de pagamento padrÃ£o',NULL),(10009,'pt_BR:customField.title.insert.ad','Novo campo customizado de anÃºncio',NULL),(10010,'pt_BR:card.action.unblockSecurityCode','Desbloquear cÃ³digo de seguranÃ§a',NULL),(10011,'pt_BR:cardType.name','Nome',NULL),(10012,'pt_BR:ad.error.maxAds','O membro {0} excedeu o nÃºmero mÃ¡ximo de anÃºncios',NULL),(10013,'pt_BR:loan.search.status','Filtro',NULL),(10014,'pt_BR:customField.possibleValue.title','Lista de valores',NULL),(10015,'pt_BR:card.number','NÃºmero',NULL),(10016,'pt_BR:permission.adminMemberSms.view','Ver',NULL),(10017,'pt_BR:pendingMember.updated','O membro pendente foi atualizado',NULL),(10018,'pt_BR:sms.type.OPERATION_CONFIRMATION','ConfirmaÃ§Ã£o de operaÃ§Ã£o',NULL),(10019,'pt_BR:permission.brokerPos.changePin','Alterar senha externa',NULL),(10020,'pt_BR:paymentObligation.buyer','Comprador',NULL),(10021,'pt_BR:alert.member.EXPIRED_LOAN','EmprÃ©stimo expirado',NULL),(10022,'pt_BR:group.title.settings.advertisements','ConfiguraÃ§Ãµes de anÃºncios',NULL),(10023,'pt_BR:reports.stats.keydevelopments.numberOfTransactions','NÃºmero de transaÃ§Ãµes',NULL),(10024,'pt_BR:changePassword.error.alreadyUsed','A senha informada jÃ¡ foi utilizada no passado',NULL),(10025,'pt_BR:permission.adminMemberTransactionFeedbacks.view','Ver',NULL),(10026,'pt_BR:customField.payment.type.OWNED','PrÃ³prio',NULL),(10027,'pt_BR:permission.brokerPos.changeParameters','Alterar parÃ¢metros',NULL),(10028,'pt_BR:registrationAgreement.inserted','O termo de adesÃ£o foi inserido',NULL),(10029,'pt_BR:rates.message.initializationAlreadyRunning','Uma tarefa de inicializaÃ§Ã£o de indices esta sendo executada nesta moeda.\n Isto significa que a moeda nÃ£o pode ser modificada.\nObserver os alertas de sistema para ver quando a tarefa estiver concluida.',NULL),(10030,'pt_BR:top.message','Sistema de cÃ³digo aberto para comÃ©rcio bancÃ¡rio',NULL),(10031,'pt_BR:profile.action.viewAds','Ver anÃºncios',NULL),(10032,'pt_BR:paymentObligation.status.REGISTERED','Nova',NULL),(10033,'pt_BR:reports.current.member_group_information','InformaÃ§Ãµes do grupo do membro',NULL),(10034,'pt_BR:loan.repayment.discard.payment','Pagamento de descarte',NULL),(10035,'pt_BR:smsMailing.sent','A mensagem de difusÃ£o estÃ¡ sendo enviada',NULL),(10036,'pt_BR:paymentFilter.modified','O filtro de pagamentos foi modificado',NULL),(10037,'pt_BR:ad.units','Unidades',NULL),(10038,'pt_BR:pos.actions.changeParameters','Alterar parÃ¢metros',NULL),(10039,'pt_BR:brokering.list.status','Estado',NULL),(10040,'pt_BR:mobile.viewPayments.title','Ver Pagamentos',NULL),(10041,'pt_BR:reports.simulations.aRate.config.graph','Porcentagem da taxa vs Ã­ndice-A',NULL),(10042,'pt_BR:permission.systemStatus.viewConnectedMembers','Ver membros conectados',NULL),(10043,'pt_BR:transferType.fields.action.link','Relacionar campo existente',NULL),(10044,'pt_BR:transactionFee.invalidChargeValue',' {0} (Valor da taxa)',NULL),(10045,'pt_BR:guaranteeType.authorizedBy','Autorizada por',NULL),(10046,'pt_BR:group.invalidNature','Tipo de grupo invÃ¡lido',NULL),(10047,'pt_BR:accountFee.lastExecution','Ãšltima execuÃ§Ã£o',NULL),(10048,'pt_BR:reports.stats.keydevelopments.numberOfAds.yAxis','NÃºmero',NULL),(10049,'pt_BR:errorLog.search.date.end','AtÃ©',NULL),(10050,'pt_BR:card.canceled','CartÃ£o cancelado',NULL),(10051,'pt_BR:profile.action.remarks','ObservaÃ§Ãµes',NULL),(10052,'pt_BR:paymentFilter.title.modify','Modificar filtro de pagamentos para {0}',NULL),(10053,'pt_BR:customImage.error.wrongType','{0} deve ser do tipo {1}',NULL),(10054,'pt_BR:mailPreferences.systemAlert','Alertas de sistema',NULL),(10055,'pt_BR:image.details','Detalhes',NULL),(10056,'pt_BR:customizedFile.resolveConflict','Resolver conflitos',NULL),(10057,'pt_BR:reports.transactions_report.member_to_system_invoices','{0} faturas eletrÃ´nicas de membro para sistema',NULL),(10058,'pt_BR:fileMapping.removed','Mapeamento de arquivo removido',NULL),(10059,'pt_BR:changePassword.error.incorrect','Senha incorreta',NULL),(10060,'pt_BR:reference.action.paymentsAwaitingFeedback','Ver pagamentos aguardando qualificaÃ§Ã£o',NULL),(10061,'pt_BR:reports.stats.activity.singlePeriod.grossProduct.row2','Produto bruto sobre todos membros',NULL),(10062,'pt_BR:invoice.amount','Valor',NULL),(10063,'pt_BR:reports.stats.activity.singlePeriod.grossProduct.row1','Produto bruto por membro com rendimentos',NULL),(10064,'pt_BR:member.activationDate','Data de ativaÃ§Ã£o',NULL),(10065,'pt_BR:permission.systemCustomFields','Campos customizados',NULL),(10066,'pt_BR:brokerCommissionContract.startDate.to','atÃ©',NULL),(10067,'pt_BR:global.datePattern.month','mm',NULL),(10068,'pt_BR:group.settings.defaultAdPublicationTime','Tempo de publicaÃ§Ã£o padrÃ£o do anÃºncio',NULL),(10069,'pt_BR:activities.ads','Produtos e serviÃ§os',NULL),(10070,'pt_BR:group.settings.pinBlockTimeAfterMaxTries.number','Tempo de bloqueio do PIN apÃ³s tentativas invÃ¡lidas',NULL),(10071,'pt_BR:admin.lastLogin','Ãšltimo acesso',NULL),(10072,'pt_BR:permission.systemCardTypes.view','Ver tipos de cartÃ£o',NULL),(10073,'pt_BR:login.username','Nome de usuÃ¡rio',NULL),(10074,'pt_BR:loan.repaymentDate','Data do pagamento',NULL),(10075,'pt_BR:permission.adminAdmins.changeProfile','Alterar perfil',NULL),(10076,'pt_BR:memberImport.lineNumber','NÂº linha',NULL),(10077,'pt_BR:reference.title.details.general','Detalhes da referÃªncia',NULL),(10078,'pt_BR:smsMailing.type','Tipo',NULL),(10079,'pt_BR:settings.message.subject','Assunto',NULL),(10080,'pt_BR:menu.member.guarantees.searchCertifications','CertificaÃ§Ãµes',NULL),(10081,'pt_BR:settings.access.numericPassword','Senha numÃ©rica',NULL),(10082,'pt_BR:createMember.assignPassword','Atribuir senha',NULL),(10083,'pt_BR:guarantee.issuer','Emissor',NULL),(10084,'pt_BR:card.updateCard.error.userBlocked','VocÃª excedeu o mÃ¡ximo de tentativas da senha de login e sua sessÃ£o estÃ¡ bloqueada agora',NULL),(10085,'pt_BR:receipt.posweb.transactions.scheduledPayments','Pagamentos agendados',NULL),(10086,'pt_BR:profile.action.transferAuthorizations','Ver autorizaÃ§Ãµes de pagamentos',NULL),(10087,'pt_BR:permission.systemPayments.payment','Pagamento de sistema',NULL),(10088,'pt_BR:customField.title.insert.loanGroup','Novo campo customizado de grupo de emprÃ©stimos',NULL),(10089,'pt_BR:reports.members.members','Membros',NULL),(10090,'pt_BR:certification.expires','Vencimento',NULL),(10091,'pt_BR:brokerCommissionContract.inserted','O contrato de comissÃ£o de corretor foi inserido',NULL),(10092,'pt_BR:currency.action.new','Nova moeda',NULL),(10093,'pt_BR:authorizationLevel.inserted','NÃ­vel de autorizaÃ§Ã£o inserido',NULL),(10094,'pt_BR:brokering.status.PENDING','Aguardando ativaÃ§Ã£o',NULL),(10095,'pt_BR:messageCategory.title.modify','Modificar a categoria de mensagem',NULL),(10096,'pt_BR:document.title.list','Lista de documentos customizados',NULL),(10097,'pt_BR:settings.local.sms.enable','Habilitado',NULL),(10098,'pt_BR:fieldMapping.removed','Mapeamento de campo removido',NULL),(10099,'pt_BR:customField.member.access.REGISTRATION','Cadastro pelo membro',NULL),(10100,'pt_BR:pos.status.PIN_BLOCKED','PIN bloqueado',NULL),(10101,'pt_BR:permission.modified','As permissÃµes foram modificadas',NULL),(10102,'pt_BR:permission.brokerAds','Produtos e serviÃ§os',NULL),(10103,'pt_BR:ad.view.categories','Ver categorias',NULL),(10104,'pt_BR:paymentObligation.usedAmount','Valor utilizado',NULL),(10105,'pt_BR:reports.members.presentation.list','Lista de membros',NULL),(10106,'pt_BR:loanPayment.expirationDate','Vencimento',NULL),(10107,'pt_BR:pendingMember.removeConfirmation','Confirma a remoÃ§Ã£o deste cadastro pendente?\n\nOs cadastros pendentes sÃ£o removidos automaticamente apÃ³s {0}',NULL),(10108,'pt_BR:guarantee.currentIssueFeeValue','Taxa de emissÃ£o cobrada',NULL),(10109,'pt_BR:customField.title.insert.member','Novo campo customizado de membro',NULL),(10110,'pt_BR:loanPayment.summary.paymentsToReceive','Parcelas a receber',NULL),(10111,'pt_BR:adInterest.keywords','Palavras-chave',NULL),(10112,'pt_BR:permission.systemAdminGroups.manageAdminCustomizedFiles','Gerenciar arquivos customizados',NULL),(10113,'pt_BR:serviceOperation.RECEIVE_PAYMENT','Receber pagamentos',NULL),(10114,'pt_BR:group.settings.emailValidation.USER','Cadastro pÃºblico ou usuÃ¡rio editando seu perfil',NULL),(10115,'pt_BR:transactionFee.chargeType.PERCENTAGE','Porcentagem',NULL),(10116,'pt_BR:adminTasks.indexes.type.Administrator','Administradores',NULL),(10117,'pt_BR:payment.recipientUsername','Nome de usuÃ¡rio (destinatÃ¡rio)',NULL),(10118,'pt_BR:currency.dRate.interest','Taxa de juros',NULL),(10119,'pt_BR:payment.nextAuthorizationLevel','O pagamento foi submetido para um nÃ­vel de autorizaÃ§Ã£o superior',NULL),(10120,'pt_BR:reports.stats.activity.throughTime.grossProduct.title','Produto bruto por membro ao longo do tempo',NULL),(10121,'pt_BR:permission.memberAccess.changeChannelsAccess','Alterar acesso a canais',NULL),(10122,'pt_BR:permission.memberPreferences.manageNotifications','Gerenciar notificaÃ§Ãµes',NULL),(10123,'pt_BR:settings.local.limits','Limites',NULL),(10124,'pt_BR:customField.payment.access.TO_ACCOUNT','Somente na conta de destino',NULL),(10125,'pt_BR:reports.stats.activity.singlePeriod.numberTransactions.row1.short','membros que transacionam',NULL),(10126,'pt_BR:sms.type.ACCOUNT_DETAILS.description','Detalhes da conta',NULL),(10127,'pt_BR:customImage.system.message_replied','Ãcone de mensagem respondida',NULL),(10128,'pt_BR:createMember.registrationAgreementNotice','Ao clicar no botÃ£o abaixo, vocÃª concorda com os termos de adesÃ£o',NULL),(10129,'pt_BR:settings.message.sms','Mensagem SMS',NULL),(10130,'pt_BR:permission.brokerRemarks','ObservaÃ§Ãµes',NULL),(10131,'pt_BR:loanPayment.summary.unrecoverablePayments','Parcelas irrecuperÃ¡veis',NULL),(10132,'pt_BR:guaranteeType.enabledGuaranteeType','Ativar',NULL),(10133,'pt_BR:reports.members.ads.permanent','Permanente',NULL),(10134,'pt_BR:card.changeSecurityCode.confirmation','Desbloquear cÃ³digo de seguranÃ§a?',NULL),(10135,'pt_BR:changePin.error.obvious','A senha externa (PIN) Ã© muito simples. Ela nÃ£o pode ser sequencial ou igual a qualquer campo do perfil',NULL),(10136,'pt_BR:mobile.payment.error.noTransferType','NÃ£o hÃ¡ um tipo de transaÃ§Ã£o para pagamentos mÃ³veis.\nPor favor, contate a administraÃ§Ã£o',NULL),(10137,'pt_BR:customField.description','DescriÃ§Ã£o',NULL),(10138,'pt_BR:reports.stats.keydevelopments.throughTime.QUARTER','Cada trimestre',NULL),(10139,'pt_BR:alert.system.newVersionOfHelpFile','Existe uma nova versÃ£o do arquivo de ajuda {0}, que foi customizado.\nPor favor, verifique para resolver possÃ­veis conflitos',NULL),(10140,'pt_BR:fieldMapping.inserted','Mapeamento de campo inserido',NULL),(10141,'pt_BR:transactionFee.allowAnyAccount','Permitir qualquer conta',NULL),(10142,'pt_BR:guarantee.error.invalidGuarantee','O valor total de todas as taxas deve ser menor do que o da garantia',NULL),(10143,'pt_BR:permission.systemExternalAccounts.manage','Gerenciar',NULL),(10144,'pt_BR:customImage.system.permissions_gray','Ãcone de permissÃµes desabilitado',NULL),(10145,'pt_BR:brokerCommissionContract.status.ACTIVE','Ativo',NULL),(10146,'pt_BR:profile.action.accountInformation','InformaÃ§Ãµes de conta',NULL),(10147,'pt_BR:home.admin.status.refresh','Atualizar',NULL),(10148,'pt_BR:translationMessage.import.error.reading','Erro durante a leitura do arquivo de propriedades',NULL),(10149,'pt_BR:guarantee.status.PENDING_ADMIN','Pendente pela administraÃ§Ã£o',NULL),(10150,'pt_BR:menu.member.personal.documents','Documentos',NULL),(10151,'pt_BR:permission.operatorContacts.view','Ver',NULL),(10152,'pt_BR:fileMapping.nature','Tipo',NULL),(10153,'pt_BR:group.settings.sendPasswordByEmail','Enviar senha por e-mail',NULL),(10154,'pt_BR:notificationPreferences.costPerAdditionalMessages','{0} mensagens adicionais custam {1}',NULL),(10155,'pt_BR:accountFee.firstPeriodAfter','Inicio cobranza',NULL),(10156,'pt_BR:payment.confirmation.other','VocÃª irÃ¡ pagar {0} para {2}.{3}\n\nPor favor, clique em OK para confirmar',NULL),(10157,'pt_BR:accountType.error.removing','A conta nÃ£o pode ser removida porque ela tem ao menos uma transaÃ§Ã£o',NULL),(10158,'pt_BR:help.title.preferences','PreferÃªncias',NULL),(10159,'pt_BR:transferType.loanParameters','ParÃ¢metros do emprÃ©stimo',NULL),(10160,'pt_BR:accountFeeLog.fee','Taxa de conta',NULL),(10161,'pt_BR:member.brokerUsername','Nome de usuÃ¡rio do corretor',NULL),(10162,'pt_BR:transfer.ticket','Ticket',NULL),(10163,'pt_BR:permission.brokerMemberPayments.paymentAsMemberToSelf','Member self payment',NULL),(10164,'pt_BR:permission.brokerDocuments.manageMember','Gerenciar documentos individuais de membro',NULL),(10165,'pt_BR:transferType.feedbackReplyExpirationTime','Tempo limite para rÃ©plica de qualificaÃ§Ã£o',NULL),(10166,'pt_BR:card.updateCard.cardCodesAreNotEqual','As senhas do cartÃ£o nÃ£o sÃ£o idÃªnticas',NULL),(10167,'pt_BR:menu.admin.usersGroups.pendingMembers','Membros pendentes',NULL),(10168,'pt_BR:reports.current.presentation.result','RelatÃ³rio do estado atual: Resultados',NULL),(10169,'pt_BR:scheduledPayments.searchType','Tipo de procura',NULL),(10170,'pt_BR:login.operator.form.text','Se vocÃª Ã© um operador cadastrado, pode acessar o sistema com seu nome de usuÃ¡rio e senha.',NULL),(10171,'pt_BR:permission.adminMembers.changeUsername','Alterar o nome de usuÃ¡rio',NULL),(10172,'pt_BR:externalTransferProcess.confirmation','VocÃª estÃ¡ a ponto de processar os pagamentos selecionados.\n\nDeseja continuar?',NULL),(10173,'pt_BR:fileMapping.columnSeparator','Separador de colunas',NULL),(10174,'pt_BR:group.customizedFiles.action.new','Personalizar novo arquivo',NULL),(10175,'pt_BR:group.settings.maxSchedulingPayments','MÃ¡x. de parcelas agendadas',NULL),(10176,'pt_BR:infoText.enabled','Habilitado',NULL),(10177,'pt_BR:permission.brokerCards.unblock','Desbloquear',NULL),(10178,'pt_BR:paymentFilter.removed','O filtro de pagamentos foi removido',NULL),(10179,'pt_BR:memberPos.maxSchedulingPayments','Agendamento mÃ¡ximo para pagamento',NULL),(10180,'pt_BR:customField.title.insert.loan','Novo campo customizado de emprÃ©stimo',NULL),(10181,'pt_BR:reports.members_reports.outgoing','De saÃ­da',NULL),(10182,'pt_BR:guarantee.description','DescriÃ§Ã£o',NULL),(10183,'pt_BR:paymentObligation.currency','Moeda',NULL),(10184,'pt_BR:global.weekDay.short.MONDAY','Seg',NULL),(10185,'pt_BR:changeGroup.new','Novo grupo',NULL),(10186,'pt_BR:createMember.error.usernameAlreadyInUse','O nome de usuÃ¡rio escolhido ({0}) jÃ¡ existe',NULL),(10187,'pt_BR:reports.stats.activity.comparePeriods.percentageNoTrade.title','Percentual de membros que nÃ£o realizam transaÃ§Ãµes (comparando dois perÃ­odos)',NULL),(10188,'pt_BR:manual.title.admin','Manual de administraÃ§Ã£o do Cyclos',NULL),(10189,'pt_BR:receiptPrinterSettings.modified','O mÃ©todo de impressÃ£o local foi modificado',NULL),(10190,'pt_BR:brokerCommissionContract.status.EXPIRED','Expirado',NULL),(10191,'pt_BR:payment.action.chargeback','Estornar',NULL),(10192,'pt_BR:settings.error.noFile','Por favor, selecione um arquivo para importar as configuraÃ§Ãµes',NULL),(10193,'pt_BR:adImport.adsWithErrors','AnÃºncios com erro',NULL),(10194,'pt_BR:transferAuthorization.comments','ComentÃ¡rios',NULL),(10195,'pt_BR:menu.admin.accounts.transfersAwaitingAuthorization','Aguardando autorizaÃ§Ã£o',NULL),(10196,'pt_BR:menu.member.search','Procurar',NULL),(10197,'pt_BR:alert.type.SYSTEM','Sistema',NULL),(10198,'pt_BR:sms.type.PAYMENT_ERROR','Erro no pagamento direto',NULL),(10199,'pt_BR:group.settings.smsCustomContext','Classe customizada para o contexto SMS',NULL),(10200,'pt_BR:profile.action.paymentFromSystem','Pagamento de sistema para membro',NULL),(10201,'pt_BR:transactionFee.amount','Valor',NULL),(10202,'pt_BR:profile.action.references','Ver e dar referÃªncias',NULL),(10203,'pt_BR:pos.status.UNASSIGNED','NÃ£o atribuÃ­do',NULL),(10204,'pt_BR:settings.message.invoiceCancelled','Fatura eletrÃ´nica cancelada',NULL),(10205,'pt_BR:settings.local.sms','SMS',NULL),(10206,'pt_BR:message.subject','Assunto',NULL),(10207,'pt_BR:permission.brokerMembers.register','Cadastrar',NULL),(10208,'pt_BR:adCategory.navigator.root','Principal',NULL),(10209,'pt_BR:guarantee.status.REJECTED','Rejeitada',NULL),(10210,'pt_BR:alert.system.RATE_INITIALIZATION_FAILED','tarefa de inicializaÃ§Ã£o de indice {0} falhou devido a uma exceÃ§Ã£o encontrada.',NULL),(10211,'pt_BR:paymentFilter.groups','Visibilidade de grupo',NULL),(10212,'pt_BR:memberImport.invalidFormat','Formato invÃ¡lido de arquivo',NULL),(10213,'pt_BR:payment.confirmation.header','VocÃª estÃ¡ prestes a realizar o seguinte pagamento:',NULL),(10214,'pt_BR:permission.systemAccounts.authorizedInformation','Ver pagamentos autorizados',NULL),(10215,'pt_BR:permission.systemInvoices','Faturas eletrÃ´nicas',NULL),(10216,'pt_BR:transactionFee.originalTransferType','Tipo de transaÃ§Ã£o original',NULL),(10217,'pt_BR:settings.message.adInterest','Interesse em anÃºncio',NULL),(10218,'pt_BR:permission.memberPreferences.manageReceiptPrinterSettings','Gerenciar impressoras de recibo',NULL),(10219,'pt_BR:memberImport.status.MISSING_USERNAME','O nome de usuÃ¡rio estÃ¡ faltando',NULL),(10220,'pt_BR:currency.enableARate','Ativar Ã­ndice-A',NULL),(10221,'pt_BR:transactionFee.payer','Quem irÃ¡ pagar',NULL),(10222,'pt_BR:errors.periodBeginRequired','A data de inÃ­cio de {0} Ã© obrigatÃ³ria',NULL),(10223,'pt_BR:customField.payment.access.NONE','NÃ£o exibir',NULL),(10224,'pt_BR:settings.message.adminPaymentFromSystemToMember','Pagamentos de sistema para membros',NULL),(10225,'pt_BR:order.save','Salvar',NULL),(10226,'pt_BR:contact.notes','Notas',NULL),(10227,'pt_BR:memberRecord.error.removing','Erro ao remover registro de {0}',NULL),(10228,'pt_BR:reports.members.references.given','ReferÃªncias dadas',NULL),(10229,'pt_BR:memberImport.status.USERNAME_ALREADY_IN_USE','O nome de usuÃ¡rio jÃ¡ estÃ¡ em uso: {0}',NULL),(10230,'pt_BR:payment.action.payNow','Pagar agora',NULL),(10231,'pt_BR:externalTransferType.action.GENERATE_SYSTEM_PAYMENT','Gerar pagamento para o sistema',NULL),(10232,'pt_BR:authorizationLevel.level','NÃ­vel',NULL),(10233,'pt_BR:transactionFee.value','Cobrar valor',NULL),(10234,'pt_BR:reports.stats.error.finalDateLesserThanInitialDate','Data inicial maior do que a data final!',NULL),(10235,'pt_BR:reports.stats.activity.throughTime.grossProduct','Produto bruto por membro',NULL),(10236,'pt_BR:ad.print.since','Publicado desde',NULL),(10237,'pt_BR:guaranteeType.creditFee.readonly','Somente leitura',NULL),(10238,'pt_BR:help.title.access_devices','Access devices',NULL),(10239,'pt_BR:menu.member.personal','Pessoal',NULL),(10240,'pt_BR:permission.memberPayments','Pagamentos',NULL),(10241,'pt_BR:permission.operatorPayments.request','Solicitar pagmentos de outros canais',NULL),(10242,'pt_BR:memberRecord.action.newBasedOnThis','Criar novo registro de {0} baseado neste',NULL),(10243,'pt_BR:adImport.currency','Moeda dos anÃºncios',NULL),(10244,'pt_BR:permission.memberPayments.authorize','Autorizar pagamento',NULL),(10245,'pt_BR:message.fromTo','De / Para',NULL),(10246,'pt_BR:contactUs.title','Contate-nos',NULL),(10247,'pt_BR:menu.admin.ads.categories','Gerenciar categorias',NULL),(10248,'pt_BR:menu.admin.reports','RelatÃ³rios',NULL),(10249,'pt_BR:permission.brokerCards.unblockSecurityCode','Desbloquear cÃ³digo de seguranÃ§a',NULL),(10250,'pt_BR:reports.transactions_report.transactions','{0}: {1} de {2} transaÃ§Ãµes',NULL),(10251,'pt_BR:changeBroker.current','Corretor atual',NULL),(10252,'pt_BR:menu.member.search.members','Membros',NULL),(10253,'pt_BR:guaranteeType.error.invalidAuthorizedBy','O autorizador Ã© invÃ¡lido para o modelo selecionado. Somente Emissor ou Ambos sÃ£o permitidos',NULL),(10254,'pt_BR:theme.description','DescriÃ§Ã£o',NULL),(10255,'pt_BR:transactionPassword.title.manage','Gerenciar senha de transaÃ§Ã£o de {0}',NULL),(10256,'pt_BR:settings.local.extraFunctions','FunÃ§Ãµes adicionais',NULL),(10257,'pt_BR:guarantee.automaticLoanAuthorization','Autorizar o emprÃ©stimo automaticamente',NULL),(10258,'pt_BR:registrationAgreement.modified','O termo de adesÃ£o foi modificado',NULL),(10259,'pt_BR:menu.contact','Contato',NULL),(10260,'pt_BR:error.session.timeout','A sua sessÃ£o expirou!\nPor favor faÃ§a um novo login.',NULL),(10261,'pt_BR:brokerCommission.action.suspend','Suspender',NULL),(10262,'pt_BR:channel.principals','IdentificaÃ§Ã£o do usuÃ¡rio',NULL),(10263,'pt_BR:pos.discardPos.confirmation','Descartar POS?',NULL),(10264,'pt_BR:memberRecord.inserted','O registro de membro foi inserido',NULL),(10265,'pt_BR:group.title.search','Buscar grupos de permissÃ£o',NULL),(10266,'pt_BR:accountFee.action.cancel','Cancelar',NULL),(10267,'pt_BR:certification.inserted','A certificaÃ§Ã£o foi criada com sucesso',NULL),(10268,'pt_BR:profile.pendingEmail.confirmed','A mudanÃ§a de e-mail para {0} foi confirmada',NULL),(10269,'pt_BR:group.account.removed','A conta do grupo foi removida',NULL),(10270,'pt_BR:loanGroup.title.of','Grupos de emprÃ©stimos de {0}',NULL),(10271,'pt_BR:accountFee.removed','A taxa de conta foi removida',NULL),(10272,'pt_BR:paymentFilter.name','Nome',NULL),(10273,'pt_BR:guarantee.title.guaranteeList','Lista de garantias',NULL),(10274,'pt_BR:alert.removeOne.confirm','Remover aviso?',NULL),(10275,'pt_BR:settings.message.pinBlocked','Senha externa (PIN) bloqueada por excesso de tentativas invÃ¡lidas',NULL),(10276,'pt_BR:certification.starts','InÃ­cio',NULL),(10277,'pt_BR:home.status.paymentsToAuthorize','Existem {0} pagamentos aguardando sua autorizaÃ§Ã£o',NULL),(10278,'pt_BR:permission.brokerInvoices.view','Ver',NULL),(10279,'pt_BR:reports.stats.finances.singlePeriod.income.title','Entrada conta de sistema',NULL),(10280,'pt_BR:menu.admin.accessDevices','Dispositivos de acesso',NULL),(10281,'pt_BR:transferAuthorization.authorizerAdmin','Autorizador',NULL),(10282,'pt_BR:customField.title.insert.admin','Novo campo customizado de administrador',NULL),(10283,'pt_BR:mobile.error.noDefaultAccount','VocÃª nÃ£o pode entrar porque o grupo {0} nÃ£o tem uma conta padrÃ£o',NULL),(10284,'pt_BR:adInterest.adFields','Monitorar os seguintes campos do anÃºncio',NULL),(10285,'pt_BR:memberRecord.removed','O registro de {0} foi removido',NULL),(10286,'pt_BR:customImage.title.system.update','Atualizar imagem de sistema',NULL),(10287,'pt_BR:card.status.CANCELED','Cancelado',NULL),(10288,'pt_BR:accountFeeLog.totalInvoices','Faturas totais',NULL),(10289,'pt_BR:reports.current.presentation.result.at','RelatÃ³rio de estado: Resultados em',NULL),(10290,'pt_BR:profile.action.paymentAsMemberToSystem','Pagamento de membro para sistema',NULL),(10291,'pt_BR:loanPayment.amount','Valor',NULL),(10292,'pt_BR:loanGroup.title.my','Meus grupos de emprÃ©stimos',NULL),(10293,'pt_BR:smsMailing.sentSms','Mensagens enviadas',NULL),(10294,'pt_BR:cardType.ignoreDayInExpirationDate','Ignorar o dia na expiraÃ§Ã£o',NULL),(10295,'pt_BR:changeGroup.admin.title','Alterar o grupo do administrador {0}',NULL),(10296,'pt_BR:global.tooltip.preview','PrÃ©-visualizar',NULL),(10297,'pt_BR:group.error.passwordPolicyNumeric','{0} nÃ£o pode obrigar letras ou caracteres especiais porque as configuraÃ§Ãµes de acesso definem a senha como numÃ©rica',NULL),(10298,'pt_BR:contact.removeConfirmation','Remover contato?',NULL),(10299,'pt_BR:transferType.channels','Canais',NULL),(10300,'pt_BR:reports.current.references','ReferÃªncias',NULL),(10301,'pt_BR:reference.to','Para',NULL),(10302,'pt_BR:transactionFee.fromGroups','Dos grupos',NULL),(10303,'pt_BR:changeGroup.operator.permanentlyRemovedMessage','O membro foi removido permanentemente',NULL),(10304,'pt_BR:permission.brokerMemberPayments.paymentAsMemberToMember','Pagamento como membro para membro',NULL),(10305,'pt_BR:permission.adminMemberReferences.view','Ver',NULL),(10306,'pt_BR:permission.adminMemberPayments.paymentAsMemberToSelf','Member self payment',NULL),(10307,'pt_BR:connectedUsers.nature','Exibir',NULL),(10308,'pt_BR:posweb.action.receivePayment','Receber pagamento (F2)',NULL),(10309,'pt_BR:card.status.BLOCKED','Bloqueado',NULL),(10310,'pt_BR:profile.action.grantLoan','Conceder emprÃ©stimo',NULL),(10311,'pt_BR:guarantee.title.guaranteeDetails','Detalhes da garantia',NULL),(10312,'pt_BR:customField.ad.visibility.WEB_SERVICE','Corretores e clientes de serviÃ§o web',NULL),(10313,'pt_BR:message.type.PAYMENT','Pagamentos recebidos',NULL),(10314,'pt_BR:changePassword.resetAndSent','A senha foi reiniciada e enviada para o membro',NULL),(10315,'pt_BR:brokerCommission.inserted','A comissÃ£o de corretor foi inserida',NULL),(10316,'pt_BR:permission.systemSettings.view','Ver configuraÃ§Ãµes',NULL),(10317,'pt_BR:changePassword.resetAndSend','Reiniciar senha e enviar por e-mail',NULL),(10318,'pt_BR:memberImport.accountType.empty','NÃ£o importar contas',NULL),(10319,'pt_BR:transferAuthorization.title.list.of','AÃ§Ãµes sobre transaÃ§Ãµes autorizadas de {0}',NULL),(10320,'pt_BR:brokerCommissionContract.modified','O contrato de comissÃ£o de corretor foi modificado',NULL),(10321,'pt_BR:settings.log.traceLevel.ERRORS','Apenas erros',NULL),(10322,'pt_BR:brokering.status.COMMISSION_COMPLETE','ComissÃµes encerradas',NULL),(10323,'pt_BR:profile.action.sendInvoice','Enviar fatura eletrÃ´nica',NULL),(10324,'pt_BR:permission.adminMemberPos.assign','Atribuir',NULL),(10325,'pt_BR:changePin.error.blockedTransactionPassword','Senha de transaÃ§Ã£o bloqueada',NULL),(10326,'pt_BR:global.add','Adicionar',NULL),(10327,'pt_BR:adImport.status.INVALID_PUBLICATION_END','A data de fim de publicaÃ§Ã£o Ã© invÃ¡lida: {0}',NULL),(10328,'pt_BR:menu.member.account.invoices','Faturas eletrÃ´nicas',NULL),(10329,'pt_BR:help.title.groups','Grupos',NULL),(10330,'pt_BR:posweb.error.channelDisabled','O membro especificado nÃ£o pode acessar o canal POS-Web',NULL),(10331,'pt_BR:webshop.payment.headerText','Um pagamento de {0} foi solicitado por {1} ({2})',NULL),(10332,'pt_BR:reports.stats.paymentFilters.noOverlap','Erro: Filtros de pagamentos sobrepostos\n\nPor favor selecione outro conjunto de filtros de pagamentos.\n\nPara mais detalhes, consulte a ajuda na janela dos filtros.',NULL),(10333,'pt_BR:customizedFile.originalContents','ConteÃºdo original',NULL),(10334,'pt_BR:reports.stats.keydevelopments.numberOfAds.scheduled','AnÃºncios agendados',NULL),(10335,'pt_BR:guarantee.status.WITHOUT_ACTION','Vencida',NULL),(10336,'pt_BR:accountType.all','Todas',NULL),(10337,'pt_BR:fieldMapping.title.new','Novo mapeamento de campo',NULL),(10338,'pt_BR:generateCard.generateForMemberWithPendingCard','Gerar para membros com cartÃ£o pendente?',NULL),(10339,'pt_BR:guaranteeType.forwardTransferType','Tipo de pagamento de encaminhamento',NULL),(10340,'pt_BR:reports.stats.taxes.medianPerMember','Quantidade por membro',NULL),(10341,'pt_BR:message.type.INVOICE','Eventos de ordens de pagamento',NULL),(10342,'pt_BR:loan.granted','O emprÃ©stimo foi concedido com sucesso',NULL),(10343,'pt_BR:permission.systemTranslation.manage','Gerenciar',NULL),(10344,'pt_BR:reports.stats.keydevelopments.transactionAmount.title','Progressos em valores por transaÃ§Ã£o',NULL),(10345,'pt_BR:transactionFee.when','Quando a comissÃ£o Ã© paga',NULL),(10346,'pt_BR:global.pagination.various.pages','{0} resultados. Pular para a pÃ¡gina:',NULL),(10347,'pt_BR:permission.memberMessages.manage','Gerenciar',NULL),(10348,'pt_BR:transfer.fromOrTo','De / para',NULL),(10349,'pt_BR:group.customizedFiles.customized','Agora o arquivo estÃ¡ customizado para o grupo',NULL),(10350,'pt_BR:permission.systemReports.smsLogs','Mensagens SMS enviadas',NULL),(10351,'pt_BR:menu.admin.accounts','Contas',NULL),(10352,'pt_BR:notificationPreferences.selectNone','Nenhum',NULL),(10353,'pt_BR:pos.actions.assign','Atribuir',NULL),(10354,'pt_BR:groupFilter.removed','Filtro de grupos removido',NULL),(10355,'pt_BR:profile.pendingEmailLastSent','Ãšltimo e-mail enviado em {0}',NULL),(10356,'pt_BR:menu.admin.accounts.memberPayment','Pagamento para membro',NULL),(10357,'pt_BR:messageCategory.all','Todas categorias',NULL),(10358,'pt_BR:errorLog.removeSelected.confirm','Remover os logs de erros selecionados?',NULL),(10359,'pt_BR:accountType.nature.MEMBER','Membro',NULL),(10360,'pt_BR:group.registrationAgreement.explanation','Para prosseguir e poder utilizar o sistema, vocÃª deve primeiro concordar com o seguite termo de adesÃ£o:',NULL),(10361,'pt_BR:externalTransfer.action.choose','Executar aÃ§Ã£o com as transferÃªncias selecionadas',NULL),(10362,'pt_BR:reports.current.invoices.SYSTEM_OUTGOING.amount','Soma de faturas eletrÃ´nicas de saÃ­da do sistema',NULL),(10363,'pt_BR:registrationAgreement.name','Nome',NULL),(10364,'pt_BR:payment.error.invalidTransferType','Tipo de transaÃ§Ã£o invÃ¡lido',NULL),(10365,'pt_BR:changePassword.resetAndSend.confirmation','VocÃª tem certeza de que deseja reiniciar a senha do membro?',NULL),(10366,'pt_BR:settings.alert.receivedVeryBadRefs','ReferÃªncias \"PÃ©ssimo\" recebidas',NULL),(10367,'pt_BR:menu.admin.cards','CartÃµes',NULL),(10368,'pt_BR:brokering.error.circularBrokering','Corretagem circular',NULL),(10369,'pt_BR:reports.members.print_btn','Imprimir relatÃ³rio',NULL),(10370,'pt_BR:infoText.end','ExpiraÃ§Ã£o',NULL),(10371,'pt_BR:invoice.scheduledFor','Agendado para',NULL),(10372,'pt_BR:group.settings.passwordTries.maximum','No. mÃ¡x. de tentativas de senha',NULL),(10373,'pt_BR:brokerCommissionContract.error.conflictingContract','JÃ¡ existe um contrato ativo ou pendente cujo perÃ­odo Ã© conflitante com o perÃ­odo desse contrato',NULL),(10374,'pt_BR:global.uploadLimit','mÃ¡x',NULL),(10375,'pt_BR:permission.brokerAccounts.brokerSimulateConversion','Simular conversÃ£o para membro',NULL),(10376,'pt_BR:global.timePeriod.DAYS','Dia(s)',NULL),(10377,'pt_BR:reports.stats.keydevelopments.transactionAmount.median','MÃ©diano',NULL),(10378,'pt_BR:permission.systemStatus.viewConnectedBrokers','Ver corretores conectados',NULL),(10379,'pt_BR:reports.stats.keydevelopments.throughTime.quarters.title','Progresso ao longo do tempo',NULL),(10380,'pt_BR:createMember.error.noPossibleGroup','NÃ£o hÃ¡ grupo inicial possivel',NULL),(10381,'pt_BR:customField.size.SMALL','Pequeno',NULL),(10382,'pt_BR:permission.memberProfile','Perfil de membro',NULL),(10383,'pt_BR:settings.local.numberLocale','Formato de nÃºmero',NULL),(10384,'pt_BR:reference.direction.general.GIVEN','ReferÃªncias dadas',NULL),(10385,'pt_BR:errors.lessThan','{0} deve ser menor que {1}',NULL),(10386,'pt_BR:settings.message.brokeringExpiration','Vencimento da corretagem',NULL),(10387,'pt_BR:settings.access.usernameLength','Tamanho do nome de usuÃ¡rio manual',NULL),(10388,'pt_BR:loan.queryStatus.EXPIRED','Vencido',NULL),(10389,'pt_BR:menu.admin.accounts.memberInvoice','Enviar fatura para membro',NULL),(10390,'pt_BR:creditLimit.new','Novo',NULL),(10391,'pt_BR:account.creditLimit','Limite de crÃ©dito inferior',NULL),(10392,'pt_BR:group.customizedFiles.title.new','Personalizar novo arquivo para {0}',NULL),(10393,'pt_BR:createMember.captcha','Por favor, digite os caracteres da imagem abaixo',NULL),(10394,'pt_BR:help.title.help_howto','HOWTOs de ajudas',NULL),(10395,'pt_BR:settings.log.maxLengthPerFile','Tamanho mÃ¡x. do arquivo',NULL),(10396,'pt_BR:transactionPassword.action.block','Bloquear senha de transaÃ§Ã£o',NULL),(10397,'pt_BR:settings.mail.invitation','E-mail de convite',NULL),(10398,'pt_BR:accountFee.chargeMode','Modo de cobranÃ§a',NULL),(10399,'pt_BR:createMember.error.mailSending','Ocorreu um erro ao enviar o email de validaÃ§Ã£o.\n O membro nÃ£o foi criado.',NULL),(10400,'pt_BR:settings.message.setting','Nome da configuraÃ§Ã£o',NULL),(10401,'pt_BR:paymentObligation.pack.totalAmount','Valor total:1',NULL),(10402,'pt_BR:permission.brokerCards.view','Ver',NULL),(10403,'pt_BR:customField.title.modify.payment','Modificar campo de {0}',NULL),(10404,'pt_BR:defaultBrokerCommission.status','Estado',NULL),(10405,'pt_BR:rates.error.initializationAlreadyRunning','VocÃª tentou iniciar uma tarefa de inicializaÃ§Ã£o de indice enquanto jÃ¡ existe uma sendo executada.',NULL),(10406,'pt_BR:adInterest.priceRange','Intervalo de preÃ§o',NULL),(10407,'pt_BR:rates.i','Indice-I',NULL),(10408,'pt_BR:permission.brokerMemberAccess.changePassword','Alterar senha',NULL),(10409,'pt_BR:settings.message.removedFromBrokerGroup','Removido do grupo de corretores',NULL),(10410,'pt_BR:rates.d','Indice-D',NULL),(10411,'pt_BR:reports.stats.activity.comparePeriods.grossProduct.row1.short','com entradas',NULL),(10412,'pt_BR:group.error.removing','O grupo nÃ£o pode ser removido.\nCertifique-se de que nÃ£o hÃ¡ usuÃ¡rios nele',NULL),(10413,'pt_BR:rates.a','Indice-A',NULL),(10414,'pt_BR:group.customizedFiles.title','Arquivos customizados',NULL),(10415,'pt_BR:payment.action.authorize','Autorizar',NULL),(10416,'pt_BR:alert.system.APPLICATION_RESTARTED','AplicaÃ§Ã£o reiniciada',NULL),(10417,'pt_BR:permission.adminMemberInvoices.sendAsMemberToMember','Enviar como membro para membro',NULL),(10418,'pt_BR:permission.systemChannels','Canais',NULL),(10419,'pt_BR:reports.stats.activity.comparePeriods.numberTransactions.title','NÃºmero de transaÃ§Ãµes por membro (comparando dois perÃ­odos)',NULL),(10420,'pt_BR:remark.writer','Alterada por',NULL),(10421,'pt_BR:manual.action.printSection','Imprimir a seÃ§Ã£o atual',NULL),(10422,'pt_BR:menu.admin.customFields','Campos customizados',NULL),(10423,'pt_BR:settings.log.traceLevel.SIMPLE','Rastreamento simples (sem parÃ¢metros)',NULL),(10424,'pt_BR:externalTransfer.action.MARK_AS_UNCHECKED','Marcar como nÃ£o conferido',NULL),(10425,'pt_BR:group.settings.externalAdPublication','PublicaÃ§Ã£o externa de anÃºncios',NULL),(10426,'pt_BR:global.quarter.FOURTH','Quarto trimestre',NULL),(10427,'pt_BR:loan.expirationDate','Vencimento',NULL),(10428,'pt_BR:customField.control','Tipo de campo',NULL),(10429,'pt_BR:cardType.title.insert','Novo tipo de cartÃ£o',NULL),(10430,'pt_BR:guaranteeType.model.WITH_BUYER_AND_SELLER','Com comprador e vendedor',NULL),(10431,'pt_BR:paymentRequest.search.empty','Nenhuma solicitaÃ§Ã£o de pagamento para os filtros selecionados',NULL),(10432,'pt_BR:brokerCommissionContract.action.selectBrokerCommission','Selecione o tipo de comissÃ£o',NULL),(10433,'pt_BR:group.isRemoved','Removido',NULL),(10434,'pt_BR:scheduledPayments.totalRemaining','Total restante',NULL),(10435,'pt_BR:document.currentFileLink','{0} ({1})',NULL),(10436,'pt_BR:reports.stats.finances.ThroughTime.income.yAxis','Entrada',NULL),(10437,'pt_BR:reports.stats.keydevelopments.numberOfTransactions.title','AvanÃ§os no nÃºmero de transaÃ§Ãµes',NULL),(10438,'pt_BR:transactionFee.gFIsZero','alcanÃ§a 0% apÃ³s x % da garantia passar',NULL),(10439,'pt_BR:menu.member.operators','Operadores',NULL),(10440,'pt_BR:theme.message.export','Exportar tema para um arquivo',NULL),(10441,'pt_BR:pos.createAndAssign','O POS nÃ£o existe. Deseja criÃ¡-lo e associar ao membro?',NULL),(10442,'pt_BR:pos.pinChanged','O pin foi alterado',NULL),(10443,'pt_BR:settings.message.title.edit','Editar notificaÃ§Ã£o',NULL),(10444,'pt_BR:paymentRequest.title.new','Solicitar pagamento',NULL),(10445,'pt_BR:infoText.removed','Mensagem informativa removida.',NULL),(10446,'pt_BR:menu.member.guarantees.searchPaymentObligations','ObrigaÃ§Ãµes de pagamento',NULL),(10447,'pt_BR:permission.adminMemberReferences.manage','Gerenciar',NULL),(10448,'pt_BR:permission.admin.managesGroups','Gerenciar grupos',NULL),(10449,'pt_BR:transferAuthorization.action.AUTHORIZE','Autorizado',NULL),(10450,'pt_BR:cardLog.title','Log do cartÃ£o',NULL),(10451,'pt_BR:transactionPassword.block.confirmMessage','VocÃª tem certeza de que deseja bloquear a senha de transaÃ§Ã£o do membro?',NULL),(10452,'pt_BR:reports.stats.finances.ComparePeriods.income.title','Entradas (comparaÃ§Ã£o de perÃ­odos)',NULL),(10453,'pt_BR:permission.systemMemberPermissions.manage','Gerenciar',NULL),(10454,'pt_BR:customField.removed','O campo customizado foi removido',NULL),(10455,'pt_BR:reports.stats.activity.throughTime.numberTransactions.title','NÃºmero de transaÃ§Ãµes por membro ao longo do tempo',NULL),(10456,'pt_BR:permission.adminMemberInvoices.acceptAsMemberFromMember','Aceitar fatura eletrÃ´nica de membro como membro',NULL),(10457,'pt_BR:mobile.home.balance','Saldo: {0}',NULL),(10458,'pt_BR:settings.message.expiredCertification','CertificaÃ§Ã£o expirada',NULL),(10459,'pt_BR:payment.status.FAILED','Falhado',NULL),(10460,'pt_BR:guarantee.paymentObligationList','ObrigaÃ§Ãµes de pagamento',NULL),(10461,'pt_BR:permission.basic.login','Acesso',NULL),(10462,'pt_BR:externalTransfer.action.DELETE','Apagar',NULL),(10463,'pt_BR:customField.title.list.admin','Campos customizados de administrador',NULL),(10464,'pt_BR:guaranteeType.error.creditFeeTransferType','O tipo de pagamento para a taxa de crÃ©dito Ã© obrigatÃ³rio',NULL),(10465,'pt_BR:registrationAgreement.error.removing','Erro ao removed o termo de adesÃ£o.\n\nEle pode estar em uso por algum grupo ou jÃ¡ ter sido aceito no passado',NULL),(10466,'pt_BR:settings.access.error.numericPassword.groupsRequireLetters','{0} nÃ£o pode ser ativado pois existe ao menos um grupo de membros que obriga letras na senha',NULL),(10467,'pt_BR:brokering.change.confirmation','VocÃª deseja definir {0} como corretor de {1}?',NULL),(10468,'pt_BR:memberRecord.modified','O registro de membro foi modificado',NULL),(10469,'pt_BR:menu.member.connectedOperators','Operadores conectados',NULL),(10470,'pt_BR:externalTransferType.action.new','Inserir novo tipo de pagamento',NULL),(10471,'pt_BR:settings.mail.smtpUsername','Nome de usuÃ¡rio',NULL),(10472,'pt_BR:mobile.payment.description','DescriÃ§Ã£o',NULL),(10473,'pt_BR:alert.system.accountFeeFinishedWithErrors','Taxa de conta {0} concluÃ­da com {1} erros',NULL),(10474,'pt_BR:customField.title.list.operator','Campos customizados de operador',NULL),(10475,'pt_BR:translationMessage.removeSelected.confirm','Deseja realmente remover a(s) chave(s) de traduÃ§Ã£o selecionada(s)?',NULL),(10476,'pt_BR:loan.grantFee','Taxa de concessÃ£o',NULL),(10477,'pt_BR:groupFilter.customizedFiles.title.modify','Modificar arquivo customizado para {0}',NULL),(10478,'pt_BR:guarantee.model','Modelo',NULL),(10479,'pt_BR:document.title.form','ParÃ¢metros para {0}',NULL),(10480,'pt_BR:receipt.transfer.header','{0}: recibo de pagamento',NULL),(10481,'pt_BR:paymentObligation.status','Estado',NULL),(10482,'pt_BR:transactionFee.aRateRelation.ASYMPTOTICAL','AssimptÃ³tica',NULL),(10483,'pt_BR:memberRecord.modifiedBy','Modificado por',NULL),(10484,'pt_BR:virtualKeyboard.contrast','Contraste',NULL),(10485,'pt_BR:mobile.viewPayments.description','Desc.',NULL),(10486,'pt_BR:error.iRateParameters.notOffLine','O indice-I nÃ£o foi ativado, o sistema deve ser definido como indisponivel,\n pois pode ser uma tarefa pesada em banco de dados grandes.\n\n VocÃª pode definir o sistema como indisponivel atravÃ©s do menu: configuraÃ§Ãµes > tarefas de sistema.',NULL),(10487,'pt_BR:transfer.title.authorizations','AÃ§Ãµes de autorizaÃ§Ã£o',NULL),(10488,'pt_BR:fieldMapping.removeConfirmation','Remover este mapeamento de campo?',NULL),(10489,'pt_BR:profile.action.loansActions','EmprÃ©stimos',NULL),(10490,'pt_BR:reports.stats.keydevelopments.throughTime.quarters.xAxis','Trimestres',NULL),(10491,'pt_BR:receiptPrinterSettings.removed','A configuraÃ§Ã£o de impressora de recibos foi removida',NULL),(10492,'pt_BR:pos.actions','AÃ§Ãµes',NULL),(10493,'pt_BR:webshop.payment.enterPinText','Senha externa (PIN)',NULL),(10494,'pt_BR:group.settings.groupAfterExpiration','Grupo apÃ³s a expiraÃ§Ã£o',NULL),(10495,'pt_BR:fileMapping.fields.title','Campos de arquivos mapeados',NULL),(10496,'pt_BR:translationMessage.modified','A chave de traduÃ§Ã£o foi modificada',NULL),(10497,'pt_BR:adCategory.new','Inserir nova categoria',NULL),(10498,'pt_BR:customizedFile.type.HELP','Ajuda',NULL),(10499,'pt_BR:fileMapping.headerLines','Linhas do cabeÃ§alho',NULL),(10500,'pt_BR:loan.repayment.repaidAmount','Pago',NULL),(10501,'pt_BR:alert.member.BLOCKED_POS_USED','Tentativa de utilizar um dispositivo POS marcado como bloqueado',NULL),(10502,'pt_BR:createAdmin.password','Senha',NULL),(10503,'pt_BR:fieldMapping.memberField','Campo de membro',NULL),(10504,'pt_BR:document.title.select.of','Imprimir documento para {0}',NULL),(10505,'pt_BR:brokering.memberAdded','O membro foi adicionado',NULL),(10506,'pt_BR:card.activateCard.confirmation','Ativar cartÃ£o?',NULL),(10507,'pt_BR:group.settings.cardType','Tipo de cartÃ£o',NULL),(10508,'pt_BR:help.title.loans','EmprÃ©stimos',NULL),(10509,'pt_BR:reports.stats.finances.ComparePeriods.expenditure.title','SaÃ­da ComparaÃ§Ã£o de PerÃ­odos',NULL),(10510,'pt_BR:transfer.chargeback','Estornado em',NULL),(10511,'pt_BR:customField.control.MEMBER_AUTOCOMPLETE','Auto-completar de membro',NULL),(10512,'pt_BR:pendingMember.title.search','Membros pendentes',NULL),(10513,'pt_BR:permission.adminMemberGuarantees.acceptGuaranteesAsMember','Aceitar garantias',NULL),(10514,'pt_BR:reference.inserted','ReferÃªncia inserida',NULL),(10515,'pt_BR:reference.title.new.general','Definir referÃªncia',NULL),(10516,'pt_BR:loanGroup.description','DescriÃ§Ã£o',NULL),(10517,'pt_BR:smsMailing.sendType.group','Para grupo',NULL),(10518,'pt_BR:loanGroup.removeFromMemberConfirmation','Remover o membro deste grupo de emprÃ©stimos?',NULL),(10519,'pt_BR:accountFee.title.insert','Inserir taxa de conta',NULL),(10520,'pt_BR:member.action.create','Criar membro',NULL),(10521,'pt_BR:settings.local.schedulingHour','Hora das tarefas agendadas',NULL),(10522,'pt_BR:loan.grant.error.invalidAmount','O valor dos pagamentos do emprÃ©stimo difere do valor total',NULL),(10523,'pt_BR:cardType.removed','O tipo de cartÃ£o foi removido',NULL),(10524,'pt_BR:ad.status.EXPIRED','Vencido',NULL),(10525,'pt_BR:channel.action.new','Inserir um novo canal',NULL),(10526,'pt_BR:brokerCommission.chargeStatus','Estado de cobranÃ§a das comissÃµes',NULL),(10527,'pt_BR:document.title.select.my','Imprimir documento',NULL),(10528,'pt_BR:brokerCommission.modified','A comissÃ£o de corretor foi modificada',NULL),(10529,'pt_BR:reports.stats.general.number','NÃºmero',NULL),(10530,'pt_BR:settings.local.memberSortOrder.CHRONOLOGICAL','Cronologico (data de criaÃ§Ã£o)',NULL),(10531,'pt_BR:customField.member.showInPrint','Exibir na impressÃ£o do membro',NULL),(10532,'pt_BR:customField.type.ENUMERATED','Enumerado',NULL),(10533,'pt_BR:serviceClient.error.empty.usernameOrPassword','Ambos usuÃ¡rio e senha HTTP devem ser preenchidos ou vazios',NULL),(10534,'pt_BR:permission.adminMemberBrokerings.manageCommissions','Gerenciar comissÃµes',NULL),(10535,'pt_BR:permission.brokerAccounts.authorizedInformation','Ver pagamentos autorizados',NULL),(10536,'pt_BR:currency.description','DescriÃ§Ã£o',NULL),(10537,'pt_BR:invoice.totalAmount','Valor total',NULL),(10538,'pt_BR:alert.system.indexRebuildStart','A reconstruÃ§Ã£o dos Ã­ndices de busca para {0} foi iniciada em {1}',NULL),(10539,'pt_BR:adminTasks.onlineState.title','Disponibilidade do sistema',NULL),(10540,'pt_BR:sms.type.GENERAL','Geral',NULL),(10541,'pt_BR:notificationPreferences.hasntEmail','VocÃª nÃ£o tem e-mail configurado.',NULL),(10542,'pt_BR:accountFeeLog.processedMembers','Membros processados',NULL),(10543,'pt_BR:customField.title.order.member','Ajustar ordem de campo customizado de membro',NULL),(10544,'pt_BR:menu.admin.contentManagement.helpFiles','Arquivos de ajuda',NULL),(10545,'pt_BR:global.min','MÃ­n.',NULL),(10546,'pt_BR:channel.credentials.PIN','Senha externa (PIN)',NULL),(10547,'pt_BR:settings.local.timeZone.none','NÃ£o utilizar fuso horÃ¡rio',NULL),(10548,'pt_BR:group.settings.passwordTries.deactivationTime.field','Tempo de desativaÃ§Ã£o (unid.) apÃ³s no. mÃ¡x. de tentativas de senha',NULL),(10549,'pt_BR:alert.system.MAX_INCORRECT_LOGIN_ATTEMPTS','MÃ¡ximo de tentativas de login com usuÃ¡rio invÃ¡lido',NULL),(10550,'pt_BR:permission.adminMemberAccess.enableLogin','Permitir automaticamente o acesso de membros desativados (por tentativas de senha)',NULL),(10551,'pt_BR:group.loginPageName','Nome na pÃ¡gina de login',NULL),(10552,'pt_BR:fieldMapping.field.NEGATE_AMOUNT','Indicador de valor negativo',NULL),(10553,'pt_BR:home.admin.status.title','Estado do sistema',NULL),(10554,'pt_BR:permission.systemExternalAccounts.process','Processar Pagamentos',NULL),(10555,'pt_BR:fileMapping.numberFormat.FIXED_POSITION','PosiÃ§Ã£o fixa',NULL),(10556,'pt_BR:login.form.text','Se vocÃª Ã© um usuÃ¡rio cadastrado, pode acessar o sistema com seu nome de usuÃ¡rio e senha.',NULL),(10557,'pt_BR:sms.type.INFO_TEXT','Mensagem informativa',NULL),(10558,'pt_BR:card.changeCardCode.confirmation','Alterar senha do cartÃ£o?',NULL),(10559,'pt_BR:posweb.client.name','Nome do cliente',NULL),(10560,'pt_BR:profile.operator.title.of','Perfil de {0}',NULL),(10561,'pt_BR:permission.memberCards.block','Bloquear',NULL),(10562,'pt_BR:reports.stats.finances.ComparePeriods.expenditure','SaÃ­da',NULL),(10563,'pt_BR:reports.stats.paymentFilters.maxItemsExceded','Muitos filtros de pagamentos selecionados.\nO nÃºmero mÃ¡ximo Ã© {0}',NULL),(10564,'pt_BR:loanGroup.title.addMember','Adicionar {0} ao grupo de emprÃ©stimos',NULL),(10565,'pt_BR:loan.type.MULTI_PAYMENT','Pagamentos mÃºltiplos',NULL),(10566,'pt_BR:permission.adminMemberRecords.delete','Apagar',NULL),(10567,'pt_BR:groupFilter.customizedFiles.title.new','Personalizar novo arquivo para {0}',NULL),(10568,'pt_BR:payment.title.systemMemberToMember','Pagamento do membro {0} para outro membro',NULL),(10569,'pt_BR:notificationPreferences.freeSmsUsed','VocÃª utilizou {0} de {1} mensagens SMS gratuitas este mÃªs',NULL),(10570,'pt_BR:accountHistory.debits.count','NÂº de dÃ©bitos',NULL),(10571,'pt_BR:settings.access.allowOperatorLogin','Permitir acesso de operadores',NULL),(10572,'pt_BR:customizedFile.title.preview','PrÃ©-visualizaÃ§Ã£o de {0}',NULL),(10573,'pt_BR:card.expirationDate','Data de expiraÃ§Ã£o',NULL),(10574,'pt_BR:transfer.firstPaymentDate','Data da 1Âª parcela',NULL),(10575,'pt_BR:group.settings.externalAdPublication.ENABLED','Habilidata',NULL),(10576,'pt_BR:reference.paymentDatails','Detalhes do pagamento',NULL),(10577,'pt_BR:groupFilter.customizedFiles.removeConfirmation','Deixar de customizar esse arquivo?',NULL),(10578,'pt_BR:adInterest.inserted','Interesse em anÃºncios inserido',NULL),(10579,'pt_BR:customField.size.MEDIUM','MÃ©dio',NULL),(10580,'pt_BR:errors.greaterEquals','{0} deve ser maior ou igual a {1}',NULL),(10581,'pt_BR:groupFilter.title.list','Filtros de grupos',NULL),(10582,'pt_BR:profile.operator.title.my','Meu perfil',NULL),(10583,'pt_BR:menu.operator.personal.changePassword','Alterar Senha',NULL),(10584,'pt_BR:permission.adminMemberInvoices.denyAsMember','Rejeitar fatura eletrÃ´nica como membro',NULL),(10585,'pt_BR:guarantee.listGuaranteeTypes','Tipos de garantia',NULL),(10586,'pt_BR:group.nature.OPERATOR','Operador',NULL),(10587,'pt_BR:authorizationLevel.authorizer.level','NÃ­vel',NULL),(10588,'pt_BR:selectChannels.title.of','Mudar acesso de {0} aos canais',NULL),(10589,'pt_BR:editCard.error.transactionPasswordPending','Para editar seu cartÃ£o, Ã© necessÃ¡ria a senha de transaÃ§Ã£o, que pode ser gerada na <a class=\"default\" href=\"{0}\">pÃ¡gina inicial</a>',NULL),(10590,'pt_BR:certification.status.EXPIRED','Vencida',NULL),(10591,'pt_BR:paymentObligationLog.status','Estado',NULL),(10592,'pt_BR:customField.member.memberSearchAccess','Busca por membros',NULL),(10593,'pt_BR:brokerCommissionContract.action.cancel','Cancelar',NULL),(10594,'pt_BR:settings.error.importing','Erro ao importar o arquivo de configuraÃ§Ã£o',NULL),(10595,'pt_BR:menu.member.personal.brokerCommissionContracts','Contratos de comissÃ£o',NULL),(10596,'pt_BR:profile.action.title','AÃ§Ãµes para {0}',NULL),(10597,'pt_BR:card.updateCard.error.invalidTransactionPassword','Senha de transaÃ§Ã£o incorreta',NULL),(10598,'pt_BR:permission.adminMemberAds.manage','Gerenciar',NULL),(10599,'pt_BR:global.month.MAY','Maio',NULL),(10600,'pt_BR:accountHistory.title.print','TransaÃ§Ãµes de {0}',NULL),(10601,'pt_BR:selectChannels.title.my','Mudar o meu acesso aos canais',NULL),(10602,'pt_BR:adCategory.title.insert','Nova categoria de anÃºncio',NULL),(10603,'pt_BR:memberRecordType.name','Nome',NULL),(10604,'pt_BR:permission.brokerMemberAccess','Acesso',NULL),(10605,'pt_BR:theme.style.MOBILE','Dispositivo mÃ³vel',NULL),(10606,'pt_BR:reference.adminComments','ComentÃ¡rios da administraÃ§Ã£o',NULL),(10607,'pt_BR:permission.operatorMessages.manage','Gerenciar',NULL),(10608,'pt_BR:login.accessUsing','Acessar usando {0}',NULL),(10609,'pt_BR:externalTransfer.status.PENDING','Pendente',NULL),(10610,'pt_BR:transactionPassword.error.generating','Ocorreu um erro durante a geraÃ§Ã£o da senha de transaÃ§Ã£o.\nPor favor, tente novamente mais tarde.',NULL),(10611,'pt_BR:settings.message.messageMailSubjectPrefix','Prefixo para o assunto',NULL),(10612,'pt_BR:reports.stats.taxes.numberOfMembers','Por nÃºmero de membros',NULL),(10613,'pt_BR:reports.stats.keydevelopments.transactionAmount.highest','Mais alta',NULL),(10614,'pt_BR:menu.admin.usersGroups.loanGroups','Grupos de emprÃ©stimo',NULL),(10615,'pt_BR:global.search.all.male','Todos',NULL),(10616,'pt_BR:brokerCommissionContract.error.notPendingStatus','SÃ³ Ã© possÃ­vel salvar contratos pendentes',NULL),(10617,'pt_BR:menu.admin.bookkeeping.overview','Contas externas',NULL),(10618,'pt_BR:invoice.invalid.paymentDates','As datas das parcelas devem estar ordenadas e devem ser em datas futuras',NULL),(10619,'pt_BR:message.type.FROM_ADMIN_TO_MEMBER','Mensagens da administraÃ§Ã£o',NULL),(10620,'pt_BR:group.account.error.removing','A conta nÃ£o pÃ´de ser removida do grupo, porque ela tem pelo menos uma transaÃ§Ã£o ou fatura eletrÃ´nica em aberto',NULL),(10621,'pt_BR:menu.operator.guarantees','Garantias',NULL),(10622,'pt_BR:transactionFee.deductAmount','DeduÃ§Ã£o',NULL),(10623,'pt_BR:invoice.payments','Parcelas',NULL),(10624,'pt_BR:reference.level.NEUTRAL','Neutro',NULL),(10625,'pt_BR:help.title.transaction_feedback','QualificaÃ§Ã£o de transaÃ§Ãµes',NULL),(10626,'pt_BR:ad.removed','AnÃºncio removido',NULL),(10627,'pt_BR:sms.type.PAYMENT_ERROR.description','Erro no pagamento direto',NULL),(10628,'pt_BR:profile.action.brokeringActions','Corretagem',NULL),(10629,'pt_BR:alert.member.receivedVeryBadRefs','O membro recebeu {0} referÃªncias \"PÃ©ssimo\"',NULL),(10630,'pt_BR:infoText.validity','Validade',NULL),(10631,'pt_BR:adCategory.name','Nome',NULL),(10632,'pt_BR:scheduledPayment.totalAmount','Valor total',NULL),(10633,'pt_BR:reports.stats.activity.singlePeriod.numberTransactions.row2','NÃºmero de transaÃ§Ãµes sobre todos os membros',NULL),(10634,'pt_BR:reports.simulations.aRateConfigSimulation.startA','Iniciar a partir de A =',NULL),(10635,'pt_BR:menu.admin.customFields.adFields','AnÃºncio',NULL),(10636,'pt_BR:reports.stats.activity.singlePeriod.numberTransactions.row1','NÃºmero de transaÃ§Ãµes por membro que transaciona',NULL),(10637,'pt_BR:permission.adminMembers.register','Cadastrar',NULL),(10638,'pt_BR:permission.brokerMemberSms','Registros de SMS',NULL),(10639,'pt_BR:permission.operatorAccount.accountInformation','Ver informaÃ§Ãµes de conta',NULL),(10640,'pt_BR:theme.select.confirmationMessage','VocÃª estÃ¡ a ponto de selecionar um tema.\nIsto pode substituir customizaÃ§Ãµes em arquivos de estilo e / ou imagens.\nVocÃª deseja continuar?',NULL),(10641,'pt_BR:settings.log.transactionLevel.DETAILED','Detalhado',NULL),(10642,'pt_BR:mobile.error.inactiveUser','VocÃª ainda nÃ£o foi ativado, contate a administraÃ§Ã£o',NULL),(10643,'pt_BR:serviceOperation.INFO_TEXTS','Obter mensagens infomativas',NULL),(10644,'pt_BR:permission.adminMemberSms','Registros de SMS',NULL),(10645,'pt_BR:document.visibility','Visibilidade',NULL),(10646,'pt_BR:fileMapping.dateFormat','Formato da data',NULL),(10647,'pt_BR:global.max','MÃ¡x.',NULL),(10648,'pt_BR:transactionPassword.action.reset','Limpar senha de transaÃ§Ã£o',NULL),(10649,'pt_BR:pos.updated','O POS foi atualizado',NULL),(10650,'pt_BR:permission.adminMemberPayments.payment','Pagamento de sistema para membros',NULL),(10651,'pt_BR:transferType.reserveTotalAmountOnScheduling','Reservar valor total em pagamentos agendados',NULL),(10652,'pt_BR:menu.member.broker','Corretagem',NULL),(10653,'pt_BR:permission.systemExternalAccounts.managePayment','Gerenciar pagamentos',NULL),(10654,'pt_BR:reports.transactions_report.amount','Valor total',NULL),(10655,'pt_BR:menu.admin.personal.profile','Perfil',NULL),(10656,'pt_BR:serviceClient.title.list','Clientes de serviÃ§os web',NULL),(10657,'pt_BR:memberPos.name','Nome POS',NULL),(10658,'pt_BR:adCategory.title.export','Exportar categorias de anÃºncio',NULL),(10659,'pt_BR:member.groupFilters','Comunidades',NULL),(10660,'pt_BR:reports.members.accounts','Contas',NULL),(10661,'pt_BR:settings.message.modified','As configuraÃ§Ãµes de mensagem foram modificadas',NULL),(10662,'pt_BR:reports.members_reports.member_groups','Grupos de membros',NULL),(10663,'pt_BR:global.timePeriod.invalid','Data final deve ser apÃ³s a data inicial.',NULL),(10664,'pt_BR:settings.local.maxThumbnailHeight','',NULL),(10665,'pt_BR:fieldMapping.field.IGNORED','Ignorar',NULL),(10666,'pt_BR:global.quarter.SECOND','Segundo trimestre',NULL),(10667,'pt_BR:menu.admin.alerts.errorLog','Erros de aplicaÃ§Ã£o',NULL),(10668,'pt_BR:menu.admin.settings.alert','Config. de alertas',NULL),(10669,'pt_BR:permission.operatorReferences.manageMemberTransactionFeedbacks','Gerenciar minhas qualificaÃ§Ãµes de transaÃ§Ã£o',NULL),(10670,'pt_BR:accountFee.invoiceMode.NOT_ENOUGH_CREDITS','Apenas quando o membro nÃ£o possui crÃ©ditos suficientes',NULL),(10671,'pt_BR:settings.message.adminPendingGuarantee','Garantia pendente de autorizaÃ§Ã£o do administrador',NULL),(10672,'pt_BR:alert.system.ADMIN_LOGIN_BLOCKED_BY_TRIES','MÃ¡ximo de tentativas de login de administrador',NULL),(10673,'pt_BR:groupFilter.removeConfirmation','Remover filtro de grupos?',NULL),(10674,'pt_BR:translationMessage.import.file','Arquivo de propriedades',NULL),(10675,'pt_BR:paymentObligation.error.certificationValidityExceeded','Algumas das obrigaÃ§Ãµes de pagamento selecionadas possuem data de vencimento posterior Ã  validade da certificaÃ§Ã£o ({0} - {1}).',NULL),(10676,'pt_BR:menu.member.broker.smsMailings','SMS de difusÃ£o',NULL),(10677,'pt_BR:group.defaultAllowChargingSms','Permitir cobrar por mensagens por padrÃ£o',NULL),(10678,'pt_BR:mobile.payment.username','UsuÃ¡rio',NULL),(10679,'pt_BR:permission.brokerMemberAccess.resetPassword','Reiniciar senha',NULL),(10680,'pt_BR:paymentFilter.removeConfirmation','Remover o filtro de pagamentos',NULL),(10681,'pt_BR:group.registrationAgreement.none','NÃ£o utilizado',NULL),(10682,'pt_BR:permission.adminMemberSmsMailings.paidSmsMailings','Enviar mensagens pagas',NULL),(10683,'pt_BR:translationMessage.import.confirmation','VocÃª tem certeza de que deseja importar as chaves do arquivo selecionado?',NULL),(10684,'pt_BR:image.details.error','Os detalhes da imagem nÃ£o puderam ser salvos',NULL),(10685,'pt_BR:transactionPassword.error.blockedByTrials','Agora a sua senha de transaÃ§Ã£o estÃ¡ bloqueada.\nPor favor, contate a administraÃ§Ã£o',NULL),(10686,'pt_BR:changeGroup.title.history','HistÃ³rico',NULL),(10687,'pt_BR:reports.stats.activity.throughTime.loginTimes','Acessos por membro',NULL),(10688,'pt_BR:group.title.settings.externalAccess','ConfiguraÃ§Ãµes de acesso externo',NULL),(10689,'pt_BR:memberImport.status.INVALID_CREATION_DATE','A data de criaÃ§Ã£o Ã© invÃ¡lida: {0}',NULL),(10690,'pt_BR:settings.log.traceLevel.OFF','Desligado',NULL),(10691,'pt_BR:reports.stats.activity.comparePeriods.loginTimes','Acessos por membro',NULL),(10692,'pt_BR:activities.brokering','Corretagem',NULL),(10693,'pt_BR:brokerCommission.action.stop','Interromper',NULL),(10694,'pt_BR:memberRecord.title.search.global','Busca de {0}',NULL),(10695,'pt_BR:brokerCommission.chargeStatus.noComissions','NÃ£o hÃ¡ comissÃµes aplicÃ¡veis ao membro',NULL),(10696,'pt_BR:serviceOperation.MEMBERS','Busca de membros',NULL),(10697,'pt_BR:scheduledPayments.title.print','Pagamentos agendados',NULL),(10698,'pt_BR:accountHistory.conciliation.notConciliated','NÃ£o conciliado',NULL),(10699,'pt_BR:permission.adminMemberDocuments.details','Ver documentos',NULL),(10700,'pt_BR:message.category.noCategory','Nenhuma categoria',NULL),(10701,'pt_BR:permission.operatorGuarantees.buyWithPaymentObligations','Comprar com obrigaÃ§Ãµes de pagamento',NULL),(10702,'pt_BR:pos.title.search','Busca de POS',NULL),(10703,'pt_BR:permission.adminMembers.changeEmail','Alterar o e-mail',NULL),(10704,'pt_BR:transferType.name','Nome',NULL),(10705,'pt_BR:reports.stats.keydevelopments.numberOfAds.title','AvanÃ§os no nÃºmero de anÃºncios',NULL),(10706,'pt_BR:permission.adminMemberPos.discard','Descartar',NULL),(10707,'pt_BR:certificationLog.by','Alterado por',NULL),(10708,'pt_BR:permission.adminAdminAccess','Acesso',NULL),(10709,'pt_BR:global.month.DECEMBER','Dezembro',NULL),(10710,'pt_BR:menu.admin.contentManagement.translation','TraduÃ§Ã£o do sistema',NULL),(10711,'pt_BR:sms.type.HELP_ERROR','Erro na ajuda',NULL),(10712,'pt_BR:reference.summary.positivePercentage','% Positivo',NULL),(10713,'pt_BR:customField.removeConfirmation','Remover esse campo customizado?',NULL),(10714,'pt_BR:payment.confirmation.transactionPassword','Para confirmar este pagamento, vocÃª deve fornecer sua senha de transaÃ§Ã£o',NULL),(10715,'pt_BR:remark.writer.administration','AdministraÃ§Ã£o',NULL),(10716,'pt_BR:accountFee.runMode.SCHEDULED','Agendado',NULL),(10717,'pt_BR:permission.memberAccount','Conta',NULL),(10718,'pt_BR:permission.systemReports.current','Estado atual',NULL),(10719,'pt_BR:menu.admin.settings.serviceClients','Clientes de serviÃ§os',NULL),(10720,'pt_BR:brokerCommission.error.removing','A comissÃ£o de corretor nÃ£o pÃ´de ser removida porque ela jÃ¡ foi cobrada ou jÃ¡ foi customizada por um corretor',NULL),(10721,'pt_BR:cardType.cardSecurityCodeLength.min','Tamanho mÃ­nimo do cÃ³digo de seguranÃ§a',NULL),(10722,'pt_BR:rates.error.notOnlineWhileRateInitsPending','O sistema nÃ£o pode ser definido como disponivel enquanto uma moeda ainda possuir uma tarefa de inicializaÃ§Ã£o de indice pendente.\nObserver os alertas de sistema para ver quando a tarefa estiver concluida.',NULL),(10723,'pt_BR:scheduledPayments.searchType.OUTGOING','SaÃ­da',NULL),(10724,'pt_BR:guaranteeType.expireTodayMessage','0 vencimento no mesmo dia',NULL),(10725,'pt_BR:permission.memberReferences','ReferÃªncias',NULL),(10726,'pt_BR:reference.summary.total','Total',NULL),(10727,'pt_BR:remark.comments','ComentÃ¡rios',NULL),(10728,'pt_BR:permission.systemMemberRecordTypes','Tipos de registro de membro',NULL),(10729,'pt_BR:ad.error.maxPublicationTimeExceeded','O tempo mÃ¡ximo de publicaÃ§Ã£o foi excedido',NULL),(10730,'pt_BR:admin.username','Nome de usuÃ¡rio',NULL),(10731,'pt_BR:settings.local.csv.valueSeparator.SEMICOLON','Ponto-e-vÃ­rgula',NULL),(10732,'pt_BR:customField.name','Nome',NULL),(10733,'pt_BR:reference.direction.general.RECEIVED','ReferÃªncias recebidas',NULL),(10734,'pt_BR:permission.memberMessages.sendToAdministration','Enviar para a administraÃ§Ã£o',NULL),(10735,'pt_BR:permission.brokerPreferences.manageNotifications','Administrar notificaÃ§Ãµes',NULL),(10736,'pt_BR:createAdmin.title','Cadastrar novo administrador',NULL),(10737,'pt_BR:card.action.block','Bloquear',NULL),(10738,'pt_BR:invoice.sent','A fatura eletrÃ´nica foi enviada',NULL),(10739,'pt_BR:reports.stats.keydevelopments.throughTime.years','Ao longo dos anos',NULL),(10740,'pt_BR:reports.stats.general.singlePeriod','Um perÃ­odo',NULL),(10741,'pt_BR:posweb.action.printSettings','PreferÃªncias de impressÃ£o',NULL),(10742,'pt_BR:payment.title.asMemberToSelf','TransferÃªncia entre contas de {0}',NULL),(10743,'pt_BR:permission.memberSms.view','Ver',NULL),(10744,'pt_BR:permission.systemErrorLog','Erros de aplicaÃ§Ã£o',NULL),(10745,'pt_BR:memberImport.status.INVALID_RECORD_TYPE_FIELD','O campo do tipo de registro {0} Ã© invÃ¡lido: {1}',NULL),(10746,'pt_BR:group.title.settings.notifications','ConfiguraÃ§Ãµes de notificaÃ§Ã£o',NULL),(10747,'pt_BR:permission.module.type.ADMIN_SYSTEM','PermissÃµes de administraÃ§Ã£o de sistema de {0}',NULL),(10748,'pt_BR:document.visibility.BROKER','Corretor',NULL),(10749,'pt_BR:transactionFee.whichBroker.SOURCE','Corretor do membro que estÃ¡ pagando',NULL),(10750,'pt_BR:customField.valuesMoved','Um total de {0} ocorrÃªncias foram substituÃ­das de {1} para {2}',NULL),(10751,'pt_BR:guarantee.issuerUsername','UsuÃ¡rio do emissor',NULL),(10752,'pt_BR:help.title.connected_users','UsuÃ¡rios conectados',NULL),(10753,'pt_BR:permission.adminMemberMessages.sendToMember','Enviar para membro',NULL),(10754,'pt_BR:conversionSimulation.result.input.arate','Ã¬ndice-A aplicado',NULL),(10755,'pt_BR:menu.admin.contentManagement.documents','Documentos',NULL),(10756,'pt_BR:help.title.quickstart','InÃ­cio rÃ¡pido',NULL),(10757,'pt_BR:infotext.subject','Texto',NULL),(10758,'pt_BR:alert.system.negativeVirtualRatedBalance','Um balanÃ§o negativo virtual de indices foi encontrado na conta de sistema {0}.\nO balanÃ§o de indices virtuais foi definido para 0, mas a causa para este erro deve ser verificada.',NULL),(10759,'pt_BR:transfer.submitDate','Submetido em',NULL),(10760,'pt_BR:pos.title.modify','Modify POS',NULL),(10761,'pt_BR:paymentObligation.selectPaymentObligations','Selecionar obrigaÃ§Ãµes de pagamento',NULL),(10762,'pt_BR:reports.print.limitation','O relatÃ³rio esta sendo limitado em {0} linhas.',NULL),(10763,'pt_BR:global.amount.type.PERCENTAGE','Porcentagem',NULL),(10764,'pt_BR:permission.brokerMemberPayments.cancelAuthorizedAsMember','Cancelar pagamento autorizado como membro',NULL),(10765,'pt_BR:customImage.system.help','Ãcone de ajuda',NULL),(10766,'pt_BR:loanPayment.summary.receivedPayments','Parcelas recebidos',NULL),(10767,'pt_BR:loan.awaitingAuthorization','O emprÃ©stimo foi submetido para posterior autorizaÃ§Ã£o',NULL),(10768,'pt_BR:reports.stats.activity.singlePeriod.percentageNoTrade','Percentual de membros que nÃ£o transacionam',NULL),(10769,'pt_BR:permission.systemGroups','Grupos de permissÃ£o',NULL),(10770,'pt_BR:guaranteeType.paymentObligationPeriod.tooltip','Representa o perÃ­odo mÃ¡ximo de tempo entre a obrigaÃ§Ã£o de pagamento mais recente e a mais antiga',NULL),(10771,'pt_BR:customField.payment.type.LINKED','Relacionado de {0}',NULL),(10772,'pt_BR:smsLog.smsType','RazÃ£o',NULL),(10773,'pt_BR:memberImport.status','Estado',NULL),(10774,'pt_BR:permission.operatorGuarantees.issueCertifications','Emitir certificaÃ§Ãµes',NULL),(10775,'pt_BR:accountFeeLog.status.PROCESSED','Processado',NULL),(10776,'pt_BR:customField.member.access.WEB_SERVICE','Web services',NULL),(10777,'pt_BR:paymentObligation.error.changeStatus','NÃ£o foi possÃ­vel alterar o estado da obrigaÃ§Ã£o de pagamento para: {0}',NULL),(10778,'pt_BR:permission.operatorPayments','Pagamentos',NULL),(10779,'pt_BR:changePassword.error.obvious','A senha Ã© muito simples. Ela nÃ£o pode ser sequencial ou igual a qualquer campo do perfil',NULL),(10780,'pt_BR:alert.system.NEW_VERSION_OF_STATIC_FILE','Nova versÃ£o de arquivo estÃ¡tico',NULL),(10781,'pt_BR:changePassword.error.mustIncludeLettersNumbers','A senha deve conter letras e nÃºmeros',NULL),(10782,'pt_BR:account.initialCredit','CrÃ©dito inicial',NULL),(10783,'pt_BR:transferType.removeConfirmation','Remover esse tipo de transaÃ§Ã£o?',NULL),(10784,'pt_BR:payment.title.sucessfulPayment','Pagamento bem sucedido',NULL),(10785,'pt_BR:memberRecord.removeConfirmation','Remover este registro de {0}?',NULL),(10786,'pt_BR:mailPreferences.newPendingPayments','Novo pagamento aguardando autorizaÃ§Ã£o',NULL),(10787,'pt_BR:createMember.public.awaitingActivation','Obrigado por cadastrar-se!\n\nSua conta foi criada e precisa\nser ativada pela administraÃ§Ã£o',NULL),(10788,'pt_BR:permission.memberAccount.simulateConversion','Simular conversÃ£o',NULL),(10789,'pt_BR:cardType.maxSecurityCodeTries','No. mÃ¡x. de tentativas do cÃ³digo de seguranÃ§a',NULL),(10790,'pt_BR:permission.adminMemberInvoices.cancel','Cancelar fatura eletrÃ´nica',NULL),(10791,'pt_BR:transfer.amount','Valor',NULL),(10792,'pt_BR:global.quarter.THIRD','Terceiro trimestre',NULL),(10793,'pt_BR:pos.action.unassign','Desatribuir',NULL),(10794,'pt_BR:transactionPassword.MANUAL','Manualmente',NULL),(10795,'pt_BR:global.send','Enviar',NULL),(10796,'pt_BR:adInterest.modified','Interesse em anÃºncios modificado',NULL),(10797,'pt_BR:loan.amount','Valor',NULL),(10798,'pt_BR:customField.member.memberCanHide','O membro pode ocultar',NULL),(10799,'pt_BR:permission.brokerCards.activate','Ativar',NULL),(10800,'pt_BR:currency.removeConfirmation','VocÃª estÃ¡ prestes a remover esta moeda.\nVocÃª tem certeza?',NULL),(10801,'pt_BR:brokerCommissionContract.denyConfirmation','Negar este contrato de comissÃ£o de corretor?',NULL),(10802,'pt_BR:certification.removeConfirmation','VocÃª tem certeza que deseja excluir esta certificaÃ§Ã£o?',NULL),(10803,'pt_BR:ad.price','PreÃ§o',NULL),(10804,'pt_BR:permission.systemTranslation','TraduÃ§Ã£o',NULL),(10805,'pt_BR:notificationPreferences.smsHeading','Mensagens SMS',NULL),(10806,'pt_BR:alert.system.APPLICATION_SHUTDOWN','AplicaÃ§Ã£o finalizada',NULL),(10807,'pt_BR:settings.message.smsMessagePrefix','Prefixo das mensagens SMS',NULL),(10808,'pt_BR:reports.stats.general.graph.selectAll','Selecionar todos os grÃ¡ficos',NULL),(10809,'pt_BR:loanPayment.title','Pagamentos',NULL),(10810,'pt_BR:reports.stats.activity.topten.login.col1','Acessos',NULL),(10811,'pt_BR:cardType.cardSecurityCodeLength.max','Tamanho mÃ¡xido do cÃ³digo de seguranÃ§a',NULL),(10812,'pt_BR:alert.member.nullIRate','Indice-I possui valor nulo inesperado para a conta {1}. VocÃª pode querer reinicializar o Ã­ndice-I',NULL),(10813,'pt_BR:infotext.body','DescriÃ§Ã£o',NULL),(10814,'pt_BR:reference.from','De',NULL),(10815,'pt_BR:permission.memberLoans.repay','Pagar',NULL),(10816,'pt_BR:reports.stats.activity.topten.numberTransactions','NÃºmero de transaÃ§Ãµes',NULL),(10817,'pt_BR:reports.stats.period.name','Nome',NULL),(10818,'pt_BR:smsMailing.sendType.member','Para membro',NULL),(10819,'pt_BR:translationMessage.removeOne.confirm','VocÃª tem certeza de que deseja remover essa chave de traduÃ§Ã£o?',NULL),(10820,'pt_BR:fileMapping.resetConfirmation','Reiniciar mapeamento de arquivo?',NULL),(10821,'pt_BR:admin.creationDate','Data de criaÃ§Ã£o',NULL),(10822,'pt_BR:group.settings.defaultAdPublicationTime.field','Tempo de publicaÃ§Ã£o padrÃ£o do anÃºncio (unid.)',NULL),(10823,'pt_BR:permission.operatorInvoices.manage','Gerenciar',NULL),(10824,'pt_BR:group.settings.hideCurrencyOnPayments','Ocultar moeda (mostrar somente os tipos de pagamento)',NULL),(10825,'pt_BR:brokerCommissionContract.status.PENDING','Pendente',NULL),(10826,'pt_BR:authorizationLevel.authorizer.RECEIVER','Vendedor',NULL),(10827,'pt_BR:loan.queryStatus.RECOVERED','Recuperado',NULL),(10828,'pt_BR:paymentObligation.sellerUsername','UsuÃ¡rio do comprador',NULL),(10829,'pt_BR:permission.systemAdminPermissions.view','Ver',NULL),(10830,'pt_BR:customField.moveValue.confirmation','VocÃª estÃ¡ prestes a substituir as ocorrÃªncias de {0} por {1}.\n\nPor favor, clique em OK para confirmar',NULL),(10831,'pt_BR:login.redirectFromMessage','Para continuar, por favor faÃ§a um novo login.',NULL),(10832,'pt_BR:currency.dRate.creationValue','Ãndice-D na criaÃ§Ã£o da unidade',NULL),(10833,'pt_BR:adInterest.removeSelected.confirm','Remover interesse em anÃºncios selecionados?',NULL),(10834,'pt_BR:permission.adminMemberGuarantees','Garantias',NULL),(10835,'pt_BR:paymentObligation.pack.details.title','Detalhes',NULL),(10836,'pt_BR:paymentFilter.selectPaymentFilters','Selecione os filtros de pagamento',NULL),(10837,'pt_BR:operator.noGroup','Para poder criar um operador, vocÃª deve primeiro criar ao menos um grupo de operadores',NULL),(10838,'pt_BR:global.reset','Reiniciar',NULL),(10839,'pt_BR:global.loadingSystem','Carregando a aplicaÃ§Ã£o. Por favor, aguarde...',NULL),(10840,'pt_BR:customizedFile.customized','O arquivo foi customizado',NULL),(10841,'pt_BR:permission.systemPayments.chargeback','Estornar pagamento para o sistema',NULL),(10842,'pt_BR:transactionFee.error.samePayerAndReceiver','Pagador e recebedor nÃ£o podem ser iguais',NULL),(10843,'pt_BR:groupFilter.viewableBy','VisualizÃ¡vel por',NULL),(10844,'pt_BR:activities.references.given','Dada',NULL),(10845,'pt_BR:permission.adminMemberLoanGroups.view','Ver',NULL),(10846,'pt_BR:reports.stats.activity.topten.andMore','(... e mais {0} membros com os mesmos pontos...)',NULL),(10847,'pt_BR:reference.direction.transactionFeedback.GIVEN','QualificaÃ§Ãµes dadas',NULL),(10848,'pt_BR:reports.simulations.aRate.config.graph.yAxis','Taxa',NULL),(10849,'pt_BR:authorizationLevel.modified','NÃ­vel de autorizaÃ§Ã£o modificado',NULL),(10850,'pt_BR:settings.message.body','Corpo',NULL),(10851,'pt_BR:guarantee.status','Estado',NULL),(10852,'pt_BR:reports.stats.activity.topten.numberTransactions.col1','NÃºmero de transaÃ§Ãµes',NULL),(10853,'pt_BR:brokerCommissionContract.title.insert','Inserir contrato de comisÃ£o de corretor',NULL),(10854,'pt_BR:reports.members.references','ReferÃªncias',NULL),(10855,'pt_BR:permission.adminMemberRecords.modify','Modificar',NULL),(10856,'pt_BR:permission.brokerPos.block','Bloquear',NULL),(10857,'pt_BR:brokering.title.details','Notas do membro',NULL),(10858,'pt_BR:settings.alert.idleInvoiceExpiration','Vencimento da fatura eletrÃ´nica',NULL),(10859,'pt_BR:invoice.title.send.member','Enviar fatura eletrÃ´nica para membro',NULL),(10860,'pt_BR:menu.operator.member.messages','Mensagens',NULL),(10861,'pt_BR:menu.operator.account.transfersAuthorizations','Busca de autorizaÃ§Ãµes',NULL),(10862,'pt_BR:permission.systemReports.simulations','SimulaÃ§Ãµes',NULL),(10863,'pt_BR:customField.ad.searchVisibility','Visibilidade na busca',NULL),(10864,'pt_BR:conversionSimulation.result.graph','Valor da taxa vs tempo',NULL),(10865,'pt_BR:profile.action.allowLogin','Permitir acesso do usuÃ¡rio agora',NULL),(10866,'pt_BR:changeGroup.operator.title','Alterar grupo do operador {0}',NULL),(10867,'pt_BR:brokerCommissionContract.title.listByBroker','Contratos de comissÃ£o com {0}',NULL),(10868,'pt_BR:menu.admin.guarantees.searchPaymentObligations','ObrigaÃ§Ãµes de pagamento',NULL),(10869,'pt_BR:notificationPreferences.disableSms','Desativar SMS',NULL),(10870,'pt_BR:payment.error.authorizedInPast','NÃ£o Ã© possÃ­vel realizar um pagamento autorizado no passado',NULL),(10871,'pt_BR:settings.message.paymentObligationRejected','ObrigaÃ§Ã£o de pagamento negada',NULL),(10872,'pt_BR:settings.local.chargebackDescription','DescriÃ§Ã£o do pagamento de estorno',NULL),(10873,'pt_BR:paymentObligation.status.EXPIRED','Vencida',NULL),(10874,'pt_BR:settings.message.messageMailSuffixPlain','Sufixo para o corpo de e-mails somente texto',NULL),(10875,'pt_BR:guaranteeType.updated','O tipo de garantia foi modificado com sucesso',NULL),(10876,'pt_BR:customizedFile.title.search.page','PÃ¡ginas do aplicativo customizadas',NULL),(10877,'pt_BR:profile.action.viewBrokerings','Lista de membros (como corretor)',NULL),(10878,'pt_BR:reports.stats.keydevelopments.numberOfAds.scheduled.short','Agendado',NULL),(10879,'pt_BR:ticket.status.OK','Sucesso',NULL),(10880,'pt_BR:settings.mail.fromMail','EndereÃ§o de origem',NULL),(10881,'pt_BR:settings.local.indexRebuildingPeriod','Reconstruir Ã­ndices de busca a cada',NULL),(10882,'pt_BR:externalAccount.description','DescriÃ§Ã£o',NULL),(10883,'pt_BR:accountFeeLog.count','NÃºmero',NULL),(10884,'pt_BR:transactionFee.whichBroker','Quem irÃ¡ receber',NULL),(10885,'pt_BR:settings.mail.activationMessageWithoutPassword','Mensagem quando a senha Ã© atribuÃ­da manualmente',NULL),(10886,'pt_BR:posweb.client.transactionPassword','Senha de transaÃ§Ã£o',NULL),(10887,'pt_BR:accountType.title.list','Contas',NULL),(10888,'pt_BR:profile.admin.title.of','Perfil de administrador de {0}',NULL),(10889,'pt_BR:accountFee.invoiceMode','Enviar fatura eletrÃ´nica',NULL),(10890,'pt_BR:permission.adminMemberAccess.unblockPin','Desbloquear senha externa (PIN)',NULL),(10891,'pt_BR:reports.members.accounts.credits','Limite de crÃ©dito inferior das contas',NULL),(10892,'pt_BR:permission.systemCardTypes','Tipos de CartÃ£o',NULL),(10893,'pt_BR:transfer.scheduling.SINGLE_FUTURE','Agendado para uma data futura',NULL),(10894,'pt_BR:settings.message.commissionContractAccepted','Contrato de comissÃ£o aceito',NULL),(10895,'pt_BR:fieldMapping.modified','Mapeamento de campo modificado',NULL),(10896,'pt_BR:menu.member.account.memberInvoice','Fatura para membro',NULL),(10897,'pt_BR:login.error','Acesso invÃ¡lido. Por favor, tente novamente',NULL),(10898,'pt_BR:menu.admin.accessDevices.cardType.manage','Gerenciar tipos de cartÃ£o',NULL),(10899,'pt_BR:permission.memberCards.changeCardSecurityCode','Alterar cÃ³digo',NULL),(10900,'pt_BR:reports.stats.taxes.relativeToGrossProduct','Relativas a produto bruto',NULL),(10901,'pt_BR:global.count','Quantidade',NULL),(10902,'pt_BR:transactionFee.toFixedMember.name','Nome de completo de destino',NULL),(10903,'pt_BR:profile.admin.title.my','Meu perfil de administrador',NULL),(10904,'pt_BR:global.yes','Sim',NULL),(10905,'pt_BR:contact.title.add','Adicionar novo contato',NULL),(10906,'pt_BR:brokerCommissionContract.status.DENIED','Negado',NULL),(10907,'pt_BR:guaranteeType.title.new','Novo tipo de garantia',NULL),(10908,'pt_BR:adImport.status.MISSING_OWNER','O membro estÃ¡ faltando',NULL),(10909,'pt_BR:customizedFile.contents','ConteÃºdo',NULL),(10910,'pt_BR:card.action.unblock','Desbloquear',NULL),(10911,'pt_BR:alert.member.NULL_IRATE','Valor nulo para indice-I inesperado foi encontrado',NULL),(10912,'pt_BR:permission.systemAccounts.scheduledInformation','Ver pagamentos agendados',NULL),(10913,'pt_BR:member.title.bulkActions.action','AÃ§Ã£o',NULL),(10914,'pt_BR:defaultBrokerCommission.status.INACTIVE','Desativada',NULL),(10915,'pt_BR:externalTransferType.action','AÃ§Ã£o',NULL),(10916,'pt_BR:permission.adminMemberBrokerings.changeBroker','Alterar corretor',NULL),(10917,'pt_BR:global.tooltip.help','Ajuda',NULL),(10918,'pt_BR:customImage.system.inactive','Ãcone inativo',NULL),(10919,'pt_BR:mailPreferences.saved','As preferÃªncias de notificaÃ§Ã£o por e-mail foram salvas',NULL),(10920,'pt_BR:message.rootType.ADMIN','AdministraÃ§Ã£o',NULL),(10921,'pt_BR:settings.message.lowUnits','Poucas unidades',NULL),(10922,'pt_BR:reports.stats.general.topten','Os dez maiores',NULL),(10923,'pt_BR:operator.lastLogin','Ãšltimo acesso',NULL),(10924,'pt_BR:menu.admin.settings','ConfiguraÃ§Ãµes',NULL),(10925,'pt_BR:customizedFile.removeConfirmation','Parar de customizar esse arquivo?',NULL),(10926,'pt_BR:customImage.system.checked','Pagamento externo conferido',NULL),(10927,'pt_BR:customField.memberRecord.brokerAccess.EDITABLE','EditÃ¡vel',NULL),(10928,'pt_BR:brokerCommission.error.stopping','Erro ao tentar interromper a comissÃ£o de corretor!',NULL),(10929,'pt_BR:reports.stats.choose.balances','Saldos',NULL),(10930,'pt_BR:reference.feedbackReply','RÃ©plica do vendedor',NULL),(10931,'pt_BR:menu.member.guarantees.searchGuarantees','Garantias',NULL),(10932,'pt_BR:transferType.error.hasPendingPayments','Este tipo de pagamento nÃ£o pode deixar de ser autorizado, pois existem pagamentos pendentes de autorizaÃ§Ã£o',NULL),(10933,'pt_BR:invoice.accept.header.withAuthorization','VocÃª estÃ¡ prestes a aceitar uma fatura e submeter o seguinte pagamento para autorizaÃ§Ã£o:',NULL),(10934,'pt_BR:memberPos.allowMakePayment','Permitir fazer pagamento',NULL),(10935,'pt_BR:smsLog.type','Tipo',NULL),(10936,'pt_BR:brokering.title.removeMember','Remover membro',NULL),(10937,'pt_BR:customField.possibleValue.title.modify','Modificar valor',NULL),(10938,'pt_BR:transactionFee.chargeType.FIXED','Valor fixo',NULL),(10939,'pt_BR:invite.title','Convite',NULL),(10940,'pt_BR:errors.maxLength','{0} nÃ£o pode ser maior do que {1} caracteres',NULL),(10941,'pt_BR:group.title.modify.admin','ConfiguraÃ§Ãµes de grupo de administradores',NULL),(10942,'pt_BR:externalTransfer.inserted','TranferÃªncia externa inserida',NULL),(10943,'pt_BR:accountFee.runMode','Modo de execuÃ§Ã£o',NULL),(10944,'pt_BR:accountFee.description','DescriÃ§Ã£o',NULL),(10945,'pt_BR:payment.invalid.schedulingDate','A data da parcela deve ser anterior a {0}',NULL),(10946,'pt_BR:accountFee.runMode.MANUAL','Manual',NULL),(10947,'pt_BR:payment.chargedBack','O pagamento foi estornado',NULL),(10948,'pt_BR:message.messageBox','Caixa de mensagens',NULL),(10949,'pt_BR:reports.stats.keydevelopments.numberOfAds','NÃºmero de anÃºncios',NULL),(10950,'pt_BR:contactUs.message','Nesta pÃ¡gina, a administraÃ§Ã£o pode colocar algum texto e endereÃ§o de correio eletrÃ´nico das pessoas de contato. Para isso, alterar a chave de traduÃ§Ã£o <i>contactUs.message</i>.',NULL),(10951,'pt_BR:receiptPrinterSettings.printerName','Nome da impressora local',NULL),(10952,'pt_BR:accountFee.nextExecution','PrÃ³xima execuÃ§Ã£o',NULL),(10953,'pt_BR:createMember.error.registrationAgreementCheck','Para continuar, vocÃª deve concordar com o termo de adesÃ£o',NULL),(10954,'pt_BR:messageCategory.name','Nome',NULL),(10955,'pt_BR:errorLog.loggedUser','UsuÃ¡rio conectado',NULL),(10956,'pt_BR:payment.authorized','O pagamento foi autorizado',NULL),(10957,'pt_BR:settings.message.receivedInvoiceExpired','Fatura eletrÃ´nica recebida expirada',NULL),(10958,'pt_BR:settings.local.messageFormat','Formato das mensagens',NULL),(10959,'pt_BR:loan.grant.confirmation.group','VocÃª estÃ¡ prestes a conceder um emprÃ©stimo de {0} para o grupo {1}, tendo {2} como responsÃ¡vel.{3}\n\nPor favor, clique em OK para prosseguir',NULL),(10960,'pt_BR:settings.local.precision','PrecisÃ£o numÃ©rica',NULL),(10961,'pt_BR:invoice.title.accept','ConfirmaÃ§Ã£o de aceitaÃ§Ã£o de fatura',NULL),(10962,'pt_BR:loan.repayment.error.partialInterestsAmount','Os juros relativos ao pagamento do emprÃ©stimo devem ser pagos conjuntamente.\nVocÃª pode pagar um valor parcial de atÃ© {0} ou o valor total restante de {1}',NULL),(10963,'pt_BR:groupFilter.title.insert','Inserir filtro de grupos',NULL),(10964,'pt_BR:menu.admin.reports.current','Estado geral',NULL),(10965,'pt_BR:permission.memberAccount.scheduledInformation','Ver pagamentos agendados',NULL),(10966,'pt_BR:reports.stats.activity.comparePeriods.percentageNoTrade','Percentual de membros que nÃ£o transacionam',NULL),(10967,'pt_BR:menu.member.personal.profile','Perfil',NULL),(10968,'pt_BR:menu.member.personal.changePin','Alterar o PIN',NULL),(10969,'pt_BR:accountFeeLog.stillRunning','Ainda em execuÃ§Ã£o...',NULL),(10970,'pt_BR:adCategory.action.export','Exportar todas as categorias para aquivo',NULL),(10971,'pt_BR:permission.memberLoans','EmprÃ©stimos',NULL),(10972,'pt_BR:reports.stats.taxes.volume','Volume',NULL),(10973,'pt_BR:reports.stats.choose.finances','FinanÃ§as',NULL),(10974,'pt_BR:permission.adminMemberInvoices.acceptAsMember','Aceitar fatura eletrÃ´nica como membro',NULL),(10975,'pt_BR:loan.confirmation.header.withAuthorization','VocÃª estÃ¡ prestes a submeter este emprÃ©stimo para posterior autorizaÃ§Ã£o:',NULL),(10976,'pt_BR:settings.local.datePattern','Formato da data',NULL),(10977,'pt_BR:receiptPrinterSettings.title.modify','Modificar configuraÃ§Ã£o de impressora de recibos',NULL),(10978,'pt_BR:permission.systemGuaranteeTypes','Tipos de garantias',NULL),(10979,'pt_BR:brokerCommissionContract.action.deny','Negar',NULL),(10980,'pt_BR:customField.payment.access.FROM_ACCOUNT','Somente na conta de origem',NULL),(10981,'pt_BR:posweb.action.searchTransactions','TransaÃ§Ãµes',NULL),(10982,'pt_BR:permission.memberReports.showAccountInformation','Exibir informaÃ§Ãµes de conta',NULL),(10983,'pt_BR:message.brokeredMembers','Membros registrados',NULL),(10984,'pt_BR:permission.adminMemberInvoices','Faturas eletrÃ´nicas de membros',NULL),(10985,'pt_BR:reports.simulations.aRate.config.combinedGraph','Porcentagem da taxa vs Ã­ndice-A relativo',NULL),(10986,'pt_BR:member.group','Grupo de permissÃ£o',NULL),(10987,'pt_BR:adImport.confirm','Importar',NULL),(10988,'pt_BR:permission.brokerLoanGroups','Grupos de emprÃ©stimos',NULL),(10989,'pt_BR:message.messageBox.SENT','Itens enviados',NULL),(10990,'pt_BR:member.bulkActions.groupChanged','{0} membros foram alterados para o grupo {2}.\n{1} membros nÃ£o foram alterados, pois jÃ¡ estavam no grupo {2}',NULL),(10991,'pt_BR:errors.dateFormat','Data invÃ¡lida. O formato correto Ã© {0}',NULL),(10992,'pt_BR:reports.stats.keydevelopments.throughTime.MONTH','Cada mÃªs',NULL),(10993,'pt_BR:memberRecordType.groups','Grupos',NULL),(10994,'pt_BR:reports.stats.general.throughTheYears','Ao longo do tempo',NULL),(10995,'pt_BR:reports.stats.activity.comparePeriods.loginTimes.row1','Acessos por membro',NULL),(10996,'pt_BR:transferType.from','De',NULL),(10997,'pt_BR:menu.member.personal.activities','RelatÃ³rios',NULL),(10998,'pt_BR:payment.title.brokerMemberToSystem','Pagamento do membro {0} para o sistema',NULL),(10999,'pt_BR:settings.local.maxAjaxResults','No. mÃ¡x. de resultados de Ajax',NULL),(11000,'pt_BR:help.title.account_history','HistÃ³rico de conta',NULL),(11001,'pt_BR:menu.member.broker.defaultBrokerCommissions','ConfiguraÃ§Ãµes de comissÃµes',NULL),(11002,'pt_BR:memberImport.totalMembers','NÃºmero total de membros',NULL),(11003,'pt_BR:loanGroup.addMemberConfirmation','Adicionar o membro ao grupo de emprÃ©stimos?',NULL),(11004,'pt_BR:permission.adminMemberMessages.sendToGroup','Enviar para grupo',NULL),(11005,'pt_BR:transactionFee.removed','A taxa de transaÃ§Ã£o foi removida',NULL),(11006,'pt_BR:translationMessage.title.import','Importar a partir de arquivo de propriedades',NULL),(11007,'pt_BR:login.memberUsername','UsuÃ rio do Membro',NULL),(11008,'pt_BR:customField.validation.required','ObrigatÃ³rio',NULL),(11009,'pt_BR:guaranteeType.currency','Moeda',NULL),(11010,'pt_BR:registrationAgreement.removed','O termo de adesÃ£o foi removido',NULL),(11011,'pt_BR:certification.modified','A certificaÃ§Ã£o foi alterada com sucesso',NULL),(11012,'pt_BR:menu.admin.usersGroups.connectedUsers','UsuÃ¡rios conectados',NULL),(11013,'pt_BR:transferType.fixedDestinationMember.username','Nome de login do membro fixo de destino',NULL),(11014,'pt_BR:group.title.settings.payments','ConfiguraÃ§Ãµes de pagamentos',NULL),(11015,'pt_BR:reference.title.received.my','ReferÃªncias recebidas',NULL),(11016,'pt_BR:guarantee.allowLoanPayment','Permitir pagamento de emprÃ©stimo',NULL),(11017,'pt_BR:help.title.translation','TraduÃ§Ã£o',NULL),(11018,'pt_BR:activities.brokering.numberMembers','Membros agenciados',NULL),(11019,'pt_BR:translationMessage.import.type.NEW_AND_MODIFIED','Importar chaves novas e modificadas',NULL),(11020,'pt_BR:payment.confirmation.chargeback','VocÃª estÃ¡ prestes a estornar este pagamento.\n\nPor favor, clique em OK para confirmar',NULL),(11021,'pt_BR:transactionPassword.error.pending','Para acessar essa pÃ¡gina, vocÃª precisa de sua senha de transaÃ§Ã£o.',NULL),(11022,'pt_BR:permission.operatorPayments.poswebReceivePayment','Receber pagamento POSweb',NULL),(11023,'pt_BR:permission.adminMemberReports.view','Ver',NULL),(11024,'pt_BR:accountFeeLog.status.OPEN_INVOICE','Fatura em aberto',NULL),(11025,'pt_BR:posweb.printReceipt','Pagamento efetuado. Clique aqui ou tecle F4 para imprimir o recibo',NULL),(11026,'pt_BR:menu.admin.translation.mails','E-Mails',NULL),(11027,'pt_BR:externalTransfer.status.INCOMPLETE_PENDING','Incompleto',NULL),(11028,'pt_BR:adCategory.import.error.noFile','Por favor, selecione um arquivo para importar as categorias',NULL),(11029,'pt_BR:permission.adminMemberPos.changeParameters','Alterar parÃ¢metros',NULL),(11030,'pt_BR:memberRecordType.title.modify','Modificar tipo de registro de membro',NULL),(11031,'pt_BR:customField.parent','Campo pai',NULL),(11032,'pt_BR:settings.local.deletePendingRegistrationsAfter','Tempo mÃ¡ximo para confirmaÃ§Ã£o de e-mail no cadastro de membros',NULL),(11033,'pt_BR:loanGroup.removeConfirmation','Remover grupo de emprÃ©stimos?',NULL),(11034,'pt_BR:settings.mail.modified','As configuraÃ§Ãµes de e-mail foram modificadas',NULL),(11035,'pt_BR:menu.operator.search.ads','Produtos e ServiÃ§os',NULL),(11036,'pt_BR:member.bulkActions.cardGenerated','{0} cartÃµes foram gerados',NULL),(11037,'pt_BR:loanGroup.member','Membros',NULL),(11038,'pt_BR:transactionFee.chargeType','Tipo de cobranÃ§a',NULL),(11039,'pt_BR:customField.type.URL','EndereÃ§o web',NULL),(11040,'pt_BR:ticket.toChannel','Canal de pagamento',NULL),(11041,'pt_BR:permission.systemThemes','Temas',NULL),(11042,'pt_BR:menu.admin.contentManagement.applicationPage','PÃ¡ginas da aplicaÃ§Ã£o',NULL),(11043,'pt_BR:guaranteeLog.by','Alterado por',NULL),(11044,'pt_BR:reports.stats.general.maxItemsExceded','VocÃª excedeu o mÃ¡ximo de dados que vocÃª pode solicitar.\nEssa solicitaÃ§Ã£o pode causar uma sobrecarga no servidor.\nPor favor limite a sua solicitaÃ§Ã£o; consulte a ajuda para mais detalhes.\nO nÃºmero mÃ¡ximo de pontos de dados Ã© {0}; o nÃºmero solicitado foi {1}.',NULL),(11045,'pt_BR:loan.payments','Pagamentos',NULL),(11046,'pt_BR:global.tooltip.print','Resultados para impressÃ£o',NULL),(11047,'pt_BR:adInterest.groupFilter','Comunidade',NULL),(11048,'pt_BR:menu.member.account.scheduledPayments','Pagamentos agendados',NULL),(11049,'pt_BR:pos.unblockPin.confirmation','Ativar o PIN?',NULL),(11050,'pt_BR:reports.stats.keydevelopments.numberOfAds.active','AnÃºncios ativos',NULL),(11051,'pt_BR:menu.operator.account.memberInvoice','Fatura para Membro',NULL),(11052,'pt_BR:permission.memberReferences.view','Ver',NULL),(11053,'pt_BR:alert.member.invoiceIdleTimeExceeded','Uma fatura de {0}, enviada em {1}, excedeu o tempo mÃ¡ximo de inatividade',NULL),(11054,'pt_BR:transactionFee.f1','Valor apÃ³s 1 dia',NULL),(11055,'pt_BR:permission.brokerInvoices','Faturas eletrÃ´nicas',NULL),(11056,'pt_BR:guarantee.registerGuarantee','Criar garantia',NULL),(11057,'pt_BR:transactionFee.title.broker.list','ComissÃµes de corretores',NULL),(11058,'pt_BR:group.settings.defaultMailMessages','Mensagens enviadas por mail por padrÃ£o',NULL),(11059,'pt_BR:customField.validation','ValidaÃ§Ã£o',NULL),(11060,'pt_BR:transferAuthorization.action.CANCEL','Cancelado',NULL),(11061,'pt_BR:message.search.keywords','Palavras-chave',NULL),(11062,'pt_BR:customImage.system.message_removed','Ãcone de mensagem na lixeira',NULL),(11063,'pt_BR:cardType.cardFormatNumber','Formato de nÃºmero',NULL),(11064,'pt_BR:ad.publicationPeriod','PerÃ­odo de publicaÃ§Ã£o',NULL),(11065,'pt_BR:permission.adminMemberCards.unblockSecurityCode','Desbloquear cÃ³digo de seguranÃ§a',NULL),(11066,'pt_BR:account.availableBalance','Saldo disponÃ­vel',NULL),(11067,'pt_BR:externalAccountHistory.period.begin','A partir da data',NULL),(11068,'pt_BR:guaranteeType.title.listGuaranteeTypes','Tipos de garantia',NULL),(11069,'pt_BR:authorizationLevel.amount','Valor',NULL),(11070,'pt_BR:certificationLog.date','Data',NULL),(11071,'pt_BR:reports.current.remaining_open_loans','Valor restante de emprÃ©stimos em aberto',NULL),(11072,'pt_BR:home.status.newReferences','VocÃª recebeu {0} novas referÃªncias desde o Ãºltimo login',NULL),(11073,'pt_BR:reports.stats.finances.income.short','Entrada',NULL),(11074,'pt_BR:adminTasks.onlineState.setOffline','Tornar o sistema indisponÃ­vel',NULL),(11075,'pt_BR:reports.stats.finances.ThroughTime.income.title','Entrada (atravÃ©s do tempo)',NULL),(11076,'pt_BR:scheduledPayment.amount','Valor',NULL),(11077,'pt_BR:accountFee.action.new','Inserir nova taxa de conta',NULL),(11078,'pt_BR:member.generateCard.confirmation','Gerar cartÃ£o para {0}?',NULL),(11079,'pt_BR:permission.memberProfile.changeEmail','Alterar o prÃ³prio e-mail',NULL),(11080,'pt_BR:accountFeeLog.payments','Pagamentos',NULL),(11081,'pt_BR:loan.title.search.of','EmprÃ©stimos de {0}',NULL),(11082,'pt_BR:alert.system.ACCOUNT_FEE_RECOVERED','Taxa de conta recuperada',NULL),(11083,'pt_BR:permission.systemExternalAccounts.details','Detalhes',NULL),(11084,'pt_BR:transfer.scheduling.IMMEDIATELY','NÃ£o agendar (pagar imediatamente)',NULL),(11085,'pt_BR:adImport.status.MISSING_CUSTOM_FIELD','{0} estÃ¡ faltando',NULL),(11086,'pt_BR:transfer.title.parent','Detalhes da transaÃ§Ã£o mÃ£e',NULL),(11087,'pt_BR:customizedFile.name','Nome do arquivo',NULL),(11088,'pt_BR:invoice.acceptConfirmationMessage','Aceitar fatura eletrÃ´nica vinda de {0} de {1}?{2}\n\nPor favor, clique em OK para confirmar.',NULL),(11089,'pt_BR:profile.action.accessActions','Acesso',NULL),(11090,'pt_BR:fieldMapping.name','Nome',NULL),(11091,'pt_BR:settings.local.maxImageSize','Tamanho mÃ¡x. das imagens',NULL),(11092,'pt_BR:customImage.system.captchaBackground','Imagem de fundo da confirmaÃ§Ã£o de registro',NULL),(11093,'pt_BR:customImage.system.delete','Ãcone remover',NULL),(11094,'pt_BR:permission.brokerSmsMailings.freeSmsMailings','Enviar mensagens de difusÃ£o gratuitas',NULL),(11095,'pt_BR:alert.system.newVersionOfStaticFile','Existe uma nova versÃ£o do arquivo estÃ¡tico {0}, que foi customizado.\nPor favor, verifique para resolver possÃ­veis conflitos',NULL),(11096,'pt_BR:login.pin','Senha externa',NULL),(11097,'pt_BR:manual.title.member','Manual do Cyclos',NULL),(11098,'pt_BR:menu.operator.search.members','Membros',NULL),(11099,'pt_BR:conversionSimulation.result.feelessAmount','Valor restante',NULL),(11100,'pt_BR:loan.title.search.my','Meus emprÃ©stimos',NULL),(11101,'pt_BR:message.rootType.SYSTEM','Sistema',NULL),(11102,'pt_BR:adImport.status.INVALID_OWNER','Membro invÃ¡lido: {0}',NULL),(11103,'pt_BR:reports.members.ads.scheduled_ads','AnÃºncios agendados',NULL),(11104,'pt_BR:loanGroup.title.members','Membros deste grupo de emprÃ©stimos',NULL),(11105,'pt_BR:authorizationLevel.adminGroups.none','Nenhum',NULL),(11106,'pt_BR:message.type.FROM_ADMIN_TO_GROUP','Mensagens para grupos',NULL),(11107,'pt_BR:adminTasks.onlineState.online','O sistema estÃ¡ <b>disponÃ­vel</b>',NULL),(11108,'pt_BR:guaranteeType.status','Estado',NULL),(11109,'pt_BR:loan.queryStatus.ANY_OPEN','Qualquer aberto',NULL),(11110,'pt_BR:admin.id','Identificador',NULL),(11111,'pt_BR:error.accessDenied','Acesso negado',NULL),(11112,'pt_BR:manual.title.stats','Manual de estatÃ­sticas do Cyclos',NULL),(11113,'pt_BR:adminTasks.indexes.status.ACTIVE','Ativo',NULL),(11114,'pt_BR:fieldMapping.title.order','Definir ordem dos mapeamentos de campos',NULL),(11115,'pt_BR:settings.message.messageMailSuffixHtml','Sufixo para o corpo de e-mails HTML',NULL),(11116,'pt_BR:permission.memberPayments.cancelAuthorized','Cancelar pagamento pendente (autorizado)',NULL),(11117,'pt_BR:paymentFilter.title.insert','Inserir filtro de pagamentos para {0}',NULL),(11118,'pt_BR:help.title.references','ReferÃªncias',NULL),(11119,'pt_BR:permission.brokerMembers.manageContracts','Gerenciar contratos de comissÃµes',NULL),(11120,'pt_BR:serviceClient.username','Nome de usuÃ¡rio HTTP',NULL),(11121,'pt_BR:externalTransfer.status.TOTAL','Total',NULL),(11122,'pt_BR:adminTasks.indexes.status','Estado',NULL),(11123,'pt_BR:ad.tradeType','Tipo',NULL),(11124,'pt_BR:permission.brokerInvoices.acceptAsMemberFromMember','Aceitar fatura eletrÃ´nica de membro como membo',NULL),(11125,'pt_BR:message.messageBox.INBOX','Caixa de entrada',NULL),(11126,'pt_BR:guarantee.validity','Validade',NULL),(11127,'pt_BR:reports.members_reports.details_level.SUMMARY','Resumo',NULL),(11128,'pt_BR:guarantee.issueFee','Taxa de emissÃ£o',NULL),(11129,'pt_BR:menu.admin.usersGroups.groupFilters','Filtros de grupos',NULL),(11130,'pt_BR:editCard.error.transactionPasswordBlocked','Para editar seu cartÃ£o, Ã© necessÃ¡ria a senha de transaÃ§Ã£o.\nNo entanto, sua senha de transaÃ§Ã£o estÃ¡ bloqueada.\nPor favor, contate a administraÃ§Ã£o',NULL),(11131,'pt_BR:activities.references','ReferÃªncias',NULL),(11132,'pt_BR:permission.brokerSmsMailings','Mensagens SMS de difusÃ£o',NULL),(11133,'pt_BR:paymentObligation.title.modify','Modificar obrigaÃ§Ã£o de pagamento',NULL),(11134,'pt_BR:registrationAgreement.removeConfirmation','VocÃª confirma a exclusÃ£o deste termo de adesÃ£o?',NULL),(11135,'pt_BR:menu.admin.settings.access','Config. de acesso',NULL),(11136,'pt_BR:rates.reinit.enabledSince','Ativado desde',NULL),(11137,'pt_BR:accountFee.disabled','Desabilitada',NULL),(11138,'pt_BR:adImport.title.details.all','Todos os anÃºncios importados',NULL),(11139,'pt_BR:invoice.status','Estado',NULL),(11140,'pt_BR:about.message','InformaÃ§Ãµes sobre o projeto Cyclos podem ser encontradas em: <a href=\"{0}\"><u>{0}</u></a>',NULL),(11141,'pt_BR:infotext.active','Ativo',NULL),(11142,'pt_BR:permission.adminMemberPayments.authorize','Autorizar pagamentos',NULL),(11143,'pt_BR:posweb.printSettings.title','PreferÃªncias de impressÃ£o',NULL),(11144,'pt_BR:invoice.destinationAccountType','Conta de destino',NULL),(11145,'pt_BR:payment.error.relatesTo','O usuÃ¡rio conectado nÃ£o esta relacionado ao membro \'{0}\'.',NULL),(11146,'pt_BR:menu.member.personal.cards','CartÃµes',NULL),(11147,'pt_BR:reference.title.details.transactionFeedback','Detalhes da qualificaÃ§Ã£o de transaÃ§Ã£o',NULL),(11148,'pt_BR:alert.date','Data',NULL),(11149,'pt_BR:settings.local.memberResultDisplay.NAME','Nome do membro',NULL),(11150,'pt_BR:messageCategory.title.insert','Inserir nova categoria de mensagem',NULL),(11151,'pt_BR:global.pixels','pixels',NULL),(11152,'pt_BR:help.title.registration','Cadastro de membros',NULL),(11153,'pt_BR:customField.ad.visibility','VisÃ­vel para',NULL),(11154,'pt_BR:account.initialCreditTransferType','Tipo de transaÃ§Ã£o para crÃ©dito inicial',NULL),(11155,'pt_BR:group.settings.maxTransactionPasswordWrongTries','No. mÃ¡x. de tentativas de senha de transaÃ§Ã£o',NULL),(11156,'pt_BR:mailPreferences.memberAlerts','Alertas de membro',NULL),(11157,'pt_BR:externalTransferType.removeConfirmation','Remover tipo de pagamento?',NULL),(11158,'pt_BR:mobile.viewPayments.amount','Valor',NULL),(11159,'pt_BR:changeGroup.removedMember','O membro foi removido',NULL),(11160,'pt_BR:authorizationLevel.removeConfirmation','Remover esse nÃ­vel de autorizaÃ§Ã£o?',NULL),(11161,'pt_BR:reports.stats.keyParams','ParÃ¢metros chave',NULL),(11162,'pt_BR:global.nothingSelected','Nada selecionado',NULL),(11163,'pt_BR:error.maxUploadSizeExceeded','Tamanho mÃ¡ximo de arquivo ({0}) excedido',NULL),(11164,'pt_BR:reports.stats.taxes.paid.notPaid','NÃ£o pagas',NULL),(11165,'pt_BR:permission.adminAdminRecords.manage','Gerenciar',NULL),(11166,'pt_BR:customField.title.modify.loanGroup','Modificar campo customizado de grupo de emprÃ©stimos',NULL),(11167,'pt_BR:permission.systemInvoices.manage','Gerenciar',NULL),(11168,'pt_BR:permission.systemCurrencies.view','Ver',NULL),(11169,'pt_BR:adCategory.import.file','Arquivo',NULL),(11170,'pt_BR:menu.admin.accounts.details','Contas de sistema',NULL),(11171,'pt_BR:global.weekDay.short.TUESDAY','Ter',NULL),(11172,'pt_BR:conversionSimulation.result.input.date','Data de conversÃ£o aplicada',NULL),(11173,'pt_BR:mobile.viewPayments.next','Prox.',NULL),(11174,'pt_BR:messageCategory.action.new','Inserir nova categoria de mensagem',NULL),(11175,'pt_BR:externalAccountHistory.action.confirmDelete','Remover transaÃ§Ã£o externa permanentemente?',NULL),(11176,'pt_BR:adInterest.removed','Interesse em anÃºncios removido',NULL),(11177,'pt_BR:reports.simulations.aRateConfigSimulation.range.percentUnits','% do perÃ­odo total da garantia',NULL),(11178,'pt_BR:permission.memberInvoices','Faturas eletrÃ´nicas',NULL),(11179,'pt_BR:menu.operator.account.loans','EmprÃ©stimos',NULL),(11180,'pt_BR:reports.stats.activity.singlePeriod.loginTimes','Acessos por membro',NULL),(11181,'pt_BR:guaranteeType.title.modify','Modificar tipo de garantia',NULL),(11182,'pt_BR:receipt.posweb.transactions.date','Data: {0}',NULL),(11183,'pt_BR:errorLog.loggedUser.none','Nenhum usuÃ¡rio conectado',NULL),(11184,'pt_BR:permission.operatorPayments.poswebMakePayment','Fazer pagamento POSweb',NULL),(11185,'pt_BR:authorizationLevel.title.edit','Editar nÃ­vel de autorizaÃ§Ã£o',NULL),(11186,'pt_BR:home.admin.status.unreadMessages','Mensagens nÃ£o lidas',NULL),(11187,'pt_BR:settings.local.numberLocale.COMMA_AS_DECIMAL','1.234,56',NULL),(11188,'pt_BR:menu.admin.settings.mail','Config. de e-mail',NULL),(11189,'pt_BR:permission.operatorPayments.cancelAuthorized','Cancelar pagamento pendente',NULL),(11190,'pt_BR:externalTransferType.action.GENERATE_MEMBER_PAYMENT','Gerar pagamento para o membro',NULL),(11191,'pt_BR:customField.member.adSearchAccess','Busca por anÃºncio',NULL),(11192,'pt_BR:group.settings.externalAdPublication.ALLOW_CHOICE','Permitir escolha',NULL),(11193,'pt_BR:member.bulkActions.changeChannels','Ativar/desativar canais',NULL),(11194,'pt_BR:customizedFile.title.search.help','Arquivos de ajuda customizados',NULL),(11195,'pt_BR:reports.transactions_report.member_invoices','{0} de {1} faturas eletrÃ´nicas de membro para membro',NULL),(11196,'pt_BR:settings.local.highPrecision','Alta precisÃ£o',NULL),(11197,'pt_BR:memberImport.title.details.all','Todos os membros importados',NULL),(11198,'pt_BR:transferAuthorization.title.list','AÃ§Ãµes sobre transaÃ§Ãµes autorizadas',NULL),(11199,'pt_BR:error.permissionDenied','VocÃª nÃ£o tem permissÃµes suficientes para executar essa aÃ§Ã£o',NULL),(11200,'pt_BR:guarantee.error.noIssuer','NÃ£o hÃ¡ emissores possÃ­veis para este tipo de garantia',NULL),(11201,'pt_BR:adInterest.new','Inserir novo interesse em anÃºncios',NULL),(11202,'pt_BR:invoice.action.deny','Negar',NULL),(11203,'pt_BR:memberImport.status.MISSING_RECORD_FIELD','{0} estÃ¡ faltando',NULL),(11204,'pt_BR:smsMailing.sendType','Tipo de envio',NULL),(11205,'pt_BR:menu.member.preferences.notification','NotificaÃ§Ã£o',NULL),(11206,'pt_BR:permission.adminAdminRemarks','ObservaÃ§Ãµes',NULL),(11207,'pt_BR:settings.local.maxPageResults','No. mÃ¡x. de resultados por pÃ¡gina',NULL),(11208,'pt_BR:card.action.changeCardCode','Alterar senha do cartÃ£o',NULL),(11209,'pt_BR:memberImport.status.MISSING_NAME','O nome estÃ¡ faltando',NULL),(11210,'pt_BR:permission.systemGroups.manageAdmin','Gerenciar grupos de administradores',NULL),(11211,'pt_BR:global.percentPerDay','% / dia',NULL),(11212,'pt_BR:transactionPassword.description','Agora vocÃª pode gerar a sua senha pessoal de transaÃ§Ã£o.\nApÃ³s clicar no botÃ£o abaixo, sua senha serÃ¡ gerada e exibida.\nCertifique-se de memorizar a sua senha de transaÃ§Ã£o.\nVocÃª sÃ³ terÃ¡ uma oportunidade de ver a senha de transaÃ§Ã£o.',NULL),(11213,'pt_BR:certification.buyerUsername','UsuÃ¡rio do comprador',NULL),(11214,'pt_BR:pos.remove.confirmation','VocÃª realmente deseja excluir esse POS?',NULL),(11215,'pt_BR:currency.dRate.minimalD','D mÃ­nimo',NULL),(11216,'pt_BR:member.title.search','Busca de membros',NULL),(11217,'pt_BR:reports.members.date.history','HistÃ³rico',NULL),(11218,'pt_BR:payment.performed','O pagamento foi realizado',NULL),(11219,'pt_BR:channel.credentials.CARD_SECURITY_CODE','CÃ³digo de seguranÃ§a do cartÃ£o',NULL),(11220,'pt_BR:theme.title.export','Exportar definiÃ§Ãµes atuais como tema',NULL),(11221,'pt_BR:permission.systemThemes.import','Importar',NULL),(11222,'pt_BR:ad.search.tradeType.SEARCH','Demanda',NULL),(11223,'pt_BR:pos.blocked','POS foi bloqueado',NULL),(11224,'pt_BR:permission.adminMemberAccounts.authorizedInformation','Ver pagamentos autorizados',NULL),(11225,'pt_BR:transactionPassword.AUTOMATIC','Automaticamente',NULL),(11226,'pt_BR:fileMapping.numberFormat','Formato de nÃºmero',NULL),(11227,'pt_BR:changePassword.modified','A senha foi modificada',NULL),(11228,'pt_BR:transferType.priority','Prioridade',NULL),(11229,'pt_BR:loan.grant.paymentCount','No.de pagamentos',NULL),(11230,'pt_BR:permission.brokerInvoices.cancelAsMember','Cancelar como membro',NULL),(11231,'pt_BR:profile.action.manageBrokerCommissions','ConfiguraÃ§Ãµes de comissÃµes',NULL),(11232,'pt_BR:settings.message.loginBlocked','Login bloqueado por excesso de tentativas',NULL),(11233,'pt_BR:smsLog.search.noResults','Nenhum registro de SMS encontrado',NULL),(11234,'pt_BR:menu.admin.accounts.loans','Gerenciar emprÃ©stimos',NULL),(11235,'pt_BR:posweb.target.name','Nome (destinatÃ¡rio)',NULL),(11236,'pt_BR:guarantee.removeConfirmation','VocÃª tem certeza que deseja remover esta garantia?',NULL),(11237,'pt_BR:payment.confirmation.other.withAuthorization','Este pagamento de {0} para {2} precisa de autorizaÃ§Ã£o e ficarÃ¡ pendente atÃ© que seja autorizado e processado.{3}\n\nPor favor, clique em OK para confirmar.',NULL),(11238,'pt_BR:receipt.transfer.textAfter','----------------',NULL),(11239,'pt_BR:group.account.error.minInitialCredit','',NULL),(11240,'pt_BR:permission.systemCustomizedFiles','Arquivos customizados do sistema',NULL),(11241,'pt_BR:global.month.JANUARY','Janeiro',NULL),(11242,'pt_BR:settings.mail.smtpPort','Porta',NULL),(11243,'pt_BR:fieldMapping.field.DATE','data do pagamento',NULL),(11244,'pt_BR:theme.remove.confirmation','Tem certeza que deseja remover este tema?',NULL),(11245,'pt_BR:global.range','PerÃ­odo',NULL),(11246,'pt_BR:adCategory.imported','As categorias foram importadas com sucesso',NULL),(11247,'pt_BR:payment.confirmation.deny','VocÃª estÃ¡ prestes a negar este pagamento.\n\nPor favor, clique em OK para confirmar',NULL),(11248,'pt_BR:operator.username','UsuÃ¡rio do operador',NULL),(11249,'pt_BR:errorLog.search.date.begin','De',NULL),(11250,'pt_BR:reports.stats.transferTypeFilters','Filtros de tipos de transaÃ§Ãµes',NULL),(11251,'pt_BR:paymentFilter.action.new','Inserir novo filtro de pagamentos',NULL),(11252,'pt_BR:payment.error.manageFrom','O usuÃ¡rio conectado nÃ£o possui permissÃµes para gerenciar o membro \'{0}\'.',NULL),(11253,'pt_BR:externalTransferImport.by','Realizado por',NULL),(11254,'pt_BR:accountFee.recurrence','FreqÃ¼Ãªncia',NULL),(11255,'pt_BR:accountFeeLog.rechargeFailed','Cobrar (membros que falharam)',NULL),(11256,'pt_BR:customImage.system.previous','Ãcone de pÃ¡gina anterior',NULL),(11257,'pt_BR:transactionFee.enabled','Habilitada',NULL),(11258,'pt_BR:permission.basic','BÃ¡sico',NULL),(11259,'pt_BR:card.unblocked','CartÃ£o desbloqueado',NULL),(11260,'pt_BR:customField.ad.searchVisibility.NONE','Nenhuma',NULL),(11261,'pt_BR:reports.stats.activity.topten.grossProduct.title','Os dez maiores em produto bruto por membro',NULL),(11262,'pt_BR:menu.admin.usersGroups.members','Gerenciar membros',NULL),(11263,'pt_BR:quickAccess.messages','Mensagens',NULL),(11264,'pt_BR:reports.stats.keydevelopments.throughTime.throughTime','Ao longo do tempo',NULL),(11265,'pt_BR:loan.group.members','Membros no grupo',NULL),(11266,'pt_BR:permission.adminAdmins.register','Cadastrar',NULL),(11267,'pt_BR:brokerCommissionContract.broker','Corretor',NULL),(11268,'pt_BR:payment.confirmation.self.withAuthorization','Esta transferÃªncia de {0} da {1} para a {2} precisa de autorizaÃ§Ã£o e ficarÃ¡ pendente atÃ© que seja autorizada e processada.{3}\n\nPor favor, clique em OK para confirmar',NULL),(11269,'pt_BR:adCategory.path','Caminho',NULL),(11270,'pt_BR:customField.payment.access.BOTH_ACCOUNTS','Em ambas as contas',NULL),(11271,'pt_BR:message.type.PAYMENT_OBLIGATION','ObrigaÃ§Ãµes de pagamento',NULL),(11272,'pt_BR:permission.systemAdminGroups.view','Ver',NULL),(11273,'pt_BR:permission.systemInfoTexts','Mensagens informativas',NULL),(11274,'pt_BR:reference.modified','ReferÃªncia modificada',NULL),(11275,'pt_BR:memberImport.status.MISSING_EMAIL','O e-mail estÃ¡ faltando',NULL),(11276,'pt_BR:notificationPreferences.costPerMessage','O custo por mensagem enviada Ã© de {0}',NULL),(11277,'pt_BR:reports.members.permission_groups','Grupos de permissÃµes',NULL),(11278,'pt_BR:permission.adminMemberPos.block','Bloquear',NULL),(11279,'pt_BR:global.weekDay.short.WEDNESDAY','Qua',NULL),(11280,'pt_BR:changePin.error.userBlocked','VocÃª excedeu o mÃ¡ximo de tentativas da senha de login e sua sessÃ£o estÃ¡ bloqueada agora',NULL),(11281,'pt_BR:smsLog.status','Estado',NULL),(11282,'pt_BR:conversionSimulation.useActualRates','Usar Ã­ndices atuais',NULL),(11283,'pt_BR:activities.invoices.incoming.amount','Valor de entrada',NULL),(11284,'pt_BR:menu.member.operators.groups','Grupos de operadores',NULL),(11285,'pt_BR:manual.action.printManual','Imprimir todo o manual',NULL),(11286,'pt_BR:activities.transactions.averageSell','Recebidas - valor mÃ©dio',NULL),(11287,'pt_BR:loan.expirationDailyInterest','Juros de vencimento',NULL),(11288,'pt_BR:memberRecordType.editable','EditÃ¡vel',NULL),(11289,'pt_BR:transferAuthorization.showToMember','Mostrar para o membro',NULL),(11290,'pt_BR:reports.members_reports.total_amount','Quantidade total',NULL),(11291,'pt_BR:customField.type.MEMBER','Membro',NULL),(11292,'pt_BR:fieldMapping.field.MEMBER_CUSTOM_FIELD','Campo customizado',NULL),(11293,'pt_BR:currency.title.modify','Modificar moeda',NULL),(11294,'pt_BR:group.account.title.new','Adicionar uma conta ao grupo {0}',NULL),(11295,'pt_BR:brokerCommissionContract.error.contractNotFound','O contrato de comissÃ£o nÃ£o pode ser encontrado, Ã© provÃ¡vel que tenha sido removido.',NULL),(11296,'pt_BR:permission.brokerCards.block','Bloquear',NULL),(11297,'pt_BR:global.weekDay.short.THURSDAY','Qui',NULL),(11298,'pt_BR:changeChannels.enableChannels','Ativar canais',NULL),(11299,'pt_BR:customImage.system.quickAccess_contacts','Acesso rÃ¡pido: contatos',NULL),(11300,'pt_BR:fileMapping.stringQuote','Delimitador de texto',NULL),(11301,'pt_BR:authorizationLevel.authorizer','Quem autoriza',NULL),(11302,'pt_BR:permission.operatorAds.publish','Publicar',NULL),(11303,'pt_BR:changePin.error.pinsAreNotEqual','As senhas externas nÃ£o sÃ£o idÃªnticas',NULL),(11304,'pt_BR:permission.operatorAccount','Conta de membro',NULL),(11305,'pt_BR:menu.admin.bookkeeping.accounts','Administrar contas externas',NULL),(11306,'pt_BR:global.datePattern.year','aaaa',NULL),(11307,'pt_BR:adInterest.type','Tipo',NULL),(11308,'pt_BR:account.defaultCreditLimit','Limite de crÃ©dito inferior',NULL),(11309,'pt_BR:externalAccountHistory.period.end','AtÃ© a data',NULL),(11310,'pt_BR:accountFeeLog.status.TRANSFER','Pagamento',NULL),(11311,'pt_BR:error.loggedOut','VocÃª foi desconectado do sistema',NULL),(11312,'pt_BR:loanPayment.repaymentDate','Pagamento',NULL),(11313,'pt_BR:alert.member.TRANSACTION_PASSWORD_BLOCKED_BY_TRIES','Senha de transaÃ§Ã£o bloqueada por excesso de tentativas',NULL),(11314,'pt_BR:customImage.system.import','Ãcone de importaÃ§Ã£o',NULL),(11315,'pt_BR:permission.adminMemberPayments.blockScheduledAsMember','Bloquear pagamento agendado como membro',NULL),(11316,'pt_BR:reports.stats.keydevelopments.grossProduct.yAxis','Produto bruto (unidades)',NULL),(11317,'pt_BR:conversionSimulation.result.percentage','Porcentagem',NULL),(11318,'pt_BR:transferType.action.new','Inserir novo tipo de transaÃ§Ã£o',NULL),(11319,'pt_BR:paymentObligation.next','PrÃ³ximo',NULL),(11320,'pt_BR:transfer.calculatePayments','Calcular',NULL),(11321,'pt_BR:permission.adminMemberGuarantees.viewCertifications','Ver certificaÃ§Ãµes',NULL),(11322,'pt_BR:settings.message.adminAlerts','Assunto para notificaÃ§Ãµes de alertas',NULL),(11323,'pt_BR:groupFilter.customizedFiles.title','Arquivos customizados',NULL),(11324,'pt_BR:memberImport.initialDebitTransferType.empty','Ignorar saldos negativos',NULL),(11325,'pt_BR:loan.title.details','Detalhes do emprÃ©stimo',NULL),(11326,'pt_BR:permission.operatorReferences.view','Visualizar',NULL),(11327,'pt_BR:settings.type.MAIL_TRANSLATION','E-mail',NULL),(11328,'pt_BR:infoText.empty.subject','Nenhuma informaÃ§Ã£o encontrada',NULL),(11329,'pt_BR:alert.system.ADMIN_LOGIN_BLOCKED_BY_PERMISSION_DENIEDS','O mÃ¡ximo de permissÃµes negadas foi alcanÃ§ado por um administrador',NULL),(11330,'pt_BR:receiptPrinter.error.ie','A impressÃ£o local de recibos nÃ£o Ã© suportada no Microsoft Internet Explorer. Por favor, utilize uma versÃ£o recente do Mozilla Firefox, Google Chrome ou Opera',NULL),(11331,'pt_BR:menu.admin.customFields.adminFields','Administrador',NULL),(11332,'pt_BR:reports.current.presentation','RelatÃ³rio do estado atual',NULL),(11333,'pt_BR:settings.local.csv','ExportaÃ§Ã£o para arquivos CSV',NULL),(11334,'pt_BR:permission.brokerReports.view','Ver',NULL),(11335,'pt_BR:paymentObligation.action.create','Criar obrigaÃ§Ã£o de pagamento',NULL),(11336,'pt_BR:menu.admin.settings.local','Config. locais',NULL),(11337,'pt_BR:loan.status','Estado',NULL),(11338,'pt_BR:alert.system.applicationRestarted','AplicaÃ§Ã£o iniciada',NULL),(11339,'pt_BR:invoice.search.direction.OUTGOING','SaÃ­da',NULL),(11340,'pt_BR:permission.systemGuaranteeTypes.manage','Gerenciar',NULL),(11341,'pt_BR:accountFeeLog.status.SKIPPED','NÃ£o cobrado',NULL),(11342,'pt_BR:customizedFile.title.customize.css','Personalizar folha de estilo',NULL),(11343,'pt_BR:reference.comments','ComentÃ¡rios',NULL),(11344,'pt_BR:externalAccount.memberAccount','Conta de membro',NULL),(11345,'pt_BR:customizedFile.removed','O arquivo nÃ£o estÃ¡ mais customizado',NULL),(11346,'pt_BR:group.registrationAgreement.forceAccept','ForÃ§ar a aceitaÃ§Ã£o no prÃ³ximo login',NULL),(11347,'pt_BR:message.to','Para',NULL),(11348,'pt_BR:loanPayment.status','Estado',NULL),(11349,'pt_BR:paymentFilter.showInAccountHistory','Exibir no histÃ³rico da conta',NULL),(11350,'pt_BR:mailPreferences.messages','Mensagens',NULL),(11351,'pt_BR:reports.stats.activity.comparePeriods.numberTransactions.row2.short','Todos os membros',NULL),(11352,'pt_BR:invoice.sentBy','Enviado por',NULL),(11353,'pt_BR:payment.newPayment','Fazer novo pagamento',NULL),(11354,'pt_BR:image.error.removing','A imagem nÃ£o pÃ´de ser removida',NULL),(11355,'pt_BR:global.weekDay.short.SATURDAY','Sab',NULL),(11356,'pt_BR:profile.action.activities','Ver relatÃ³rios',NULL),(11357,'pt_BR:payment.invalid.paymentAmount','O valor total do pagamento deve ser igual ao valor da soma das parcelas',NULL),(11358,'pt_BR:conversionSimulation.result.result','Resultado',NULL),(11359,'pt_BR:loan.member','Nome do membro',NULL),(11360,'pt_BR:pin.unblock.message','A senha externa (PIN) estÃ¡ bloqueada por excesso de tentativas invÃ¡lidas',NULL),(11361,'pt_BR:about.title','Sobre',NULL),(11362,'pt_BR:externalTransfer.status.PROCESSED','Processado',NULL),(11363,'pt_BR:menu.admin.customFields.loanFields','EmprÃ©stimo',NULL),(11364,'pt_BR:reports.stats.finances.expenditure','SaÃ­da',NULL),(11365,'pt_BR:sms.type.REQUEST_PAYMENT','SolicitaÃ§Ã£o de pagamento',NULL),(11366,'pt_BR:receiptPrinter.error.printerNotFoundError','Impressora nÃ£o encontrada: {0}.\n\nCertifique-se que exista no sistema operacional uma impressora de textos genÃ©rica com esse nome.',NULL),(11367,'pt_BR:menu.admin.translation.application','AplicaÃ§Ã£o',NULL),(11368,'pt_BR:pendingMember.removed','O cadastro pendente foi removido',NULL),(11369,'pt_BR:transfer.channel','Pagamento atravÃ©s de',NULL),(11370,'pt_BR:menu.member.preferences.receiptPrinterSettings','Impressoras de recibo',NULL),(11371,'pt_BR:loan.grant.confirmation.member','VocÃª estÃ¡ prestes a conceder um emprÃ©stimo de {0} para {1}.{2}\n\nPor favor, clique em OK para prosseguir',NULL),(11372,'pt_BR:translationMessage.message','Valor',NULL),(11373,'pt_BR:errors.pageNotFound','A pÃ¡gina que vocÃª tentou acessar nÃ£o pÃ´de ser encontrada',NULL),(11374,'pt_BR:menu.admin.guarantees.searchCertifications','CertificaÃ§Ãµes',NULL),(11375,'pt_BR:permission.adminMemberDocuments','Documentos',NULL),(11376,'pt_BR:reports.stats.choose.activity','Atividade dos membros',NULL),(11377,'pt_BR:activities.brokering.commission.amount','ComissÃ£o total',NULL),(11378,'pt_BR:settings.local.csv.stringQuote.NONE','Nenhuma',NULL),(11379,'pt_BR:login.error.inactive','Sua conta ainda nÃ£o foi ativada.\nPor favor, contate a administraÃ§Ã£o',NULL),(11380,'pt_BR:conversionSimulation.result.amount','Valor',NULL),(11381,'pt_BR:ad.category','Categoria',NULL),(11382,'pt_BR:customizedFile.type.APPLICATION_PAGE','PÃ¡ginas do aplicativo',NULL),(11383,'pt_BR:alert.system.ACCOUNT_FEE_FINISHED','Taxa de conta concluÃ­da',NULL),(11384,'pt_BR:accountFee.paymentDirection.TO_MEMBER','De sistema para membro',NULL),(11385,'pt_BR:help.title.payments','Pagamentos',NULL),(11386,'pt_BR:activities.transactions.averageBuy','Pagas - valor mÃ©dio',NULL),(11387,'pt_BR:alert.member.NEW_PENDING','Pendente',NULL),(11388,'pt_BR:menu.member.account.memberPayment','Pagamento para membro',NULL),(11389,'pt_BR:currency.removed','A moeda foi removida',NULL),(11390,'pt_BR:loan.firstRepaymentDate','Primeira data de pagamento',NULL),(11391,'pt_BR:posweb.searchTransactions.title.scheduledPayments','Pagamentos agendados',NULL),(11392,'pt_BR:permission.systemServiceClients.manage','Gerenciar',NULL),(11393,'pt_BR:menu.admin.reports.statistics','AnÃ¡lise estatÃ­stica',NULL),(11394,'pt_BR:customImage.removeConfirmation','Remover essa imagem?',NULL),(11395,'pt_BR:invoice.status.ACCEPTED','Aceita',NULL),(11396,'pt_BR:loan.group.personal','Pessoal',NULL),(11397,'pt_BR:guaranteeType.paymentObligationPeriod','PerÃ­odo entre obrigaÃ§Ãµes de pagamento',NULL),(11398,'pt_BR:scheduledPayments.title.list','Procurar pagamentos agendados',NULL),(11399,'pt_BR:card.unblockCard.confirmation','Desbloquear cartÃ£o?',NULL),(11400,'pt_BR:reports.stats.keydevelopments.numberOfMembers.yAxis','NÃºmero',NULL),(11401,'pt_BR:externalAccountHistory.error.cannotMarkExternalTransferAsUnchecked','Apenas pagamentos conferidos podem ser marcadas como nÃ£o conferidos',NULL),(11402,'pt_BR:global.month.SEPTEMBER','Setembro',NULL),(11403,'pt_BR:adminTasks.indexes.type','Tipo',NULL),(11404,'pt_BR:externalTransferImport.date','Data',NULL),(11405,'pt_BR:guarantee.action.delete','Remover',NULL),(11406,'pt_BR:groupFilter.description','DescriÃ§Ã£o',NULL),(11407,'pt_BR:authorizationLevel.action.new','Novo nÃ­vel de autorizaÃ§Ã£o',NULL),(11408,'pt_BR:ad.removeConfirmation','Remover anÃºncio?',NULL),(11409,'pt_BR:createOperator.title','Criar um novo operador',NULL),(11410,'pt_BR:permission.brokerMemberRecords','Registros de membros',NULL),(11411,'pt_BR:transactionFee.action.broker.new','Inserir nova comissÃ£o de corretor',NULL),(11412,'pt_BR:paymentFilter.description','DescriÃ§Ã£o',NULL),(11413,'pt_BR:permission.operatorPayments.paymentToMember','Pagamento para membros',NULL),(11414,'pt_BR:externalAccountHistory.amountRange.end','Para quantia',NULL),(11415,'pt_BR:permission.operatorMessages.sendToMember','Enviar para outros membros',NULL),(11416,'pt_BR:reports.stats.keydevelopments.throughTime.YEAR','Cada ano',NULL),(11417,'pt_BR:permission.adminMemberBrokerings.viewLoans','Ver dados de emprÃ©stimos na impressÃ£o da lista de membros',NULL),(11418,'pt_BR:invoice.action.goToPayment','Ver detalhes do pagamento',NULL),(11419,'pt_BR:brokerCommissionContract.cancelConfirmation','Cancelar este contrato de comissÃ£o de corretor?',NULL),(11420,'pt_BR:permission.systemSettings.manageAlert','Gerenciar configuraÃ§Ãµes de aviso',NULL),(11421,'pt_BR:profile.userAllowedToLogin','O usuÃ¡rio estÃ¡ autorizado a entrar agora',NULL),(11422,'pt_BR:settings.message.invoiceDenied','Fatura eletrÃ´nica negada',NULL),(11423,'pt_BR:reports.stats.keydevelopments.numberOfAds.created.short','Criado',NULL),(11424,'pt_BR:externalTransferImport.period.begin','Desde o dia',NULL),(11425,'pt_BR:serviceClient.inserted','O cliente de serviÃ§os web foi inserido',NULL),(11426,'pt_BR:smsLog.messageType','NotificaÃ§Ã£o',NULL),(11427,'pt_BR:mobile.error.invalidUser','UsuÃ¡rio invÃ¡lido para serviÃ§o mÃ³vel',NULL),(11428,'pt_BR:payment.status.SCHEDULED','Agendado',NULL),(11429,'pt_BR:customImage.system.quickAccess_placeAd','Acesso rÃ¡pido: cadastrar anÃºncio',NULL),(11430,'pt_BR:settings.local.schedulingMinute','Minuto das tarefas agendadas',NULL),(11431,'pt_BR:member.bulkActions.choose','Selecione a aÃ§Ã£o',NULL),(11432,'pt_BR:reference.level.select','Selecione um valor',NULL),(11433,'pt_BR:guarantee.logs','Detalhes das alteraÃ§Ãµes',NULL),(11434,'pt_BR:adCategory.children','Categorias filhas',NULL),(11435,'pt_BR:brokerCommissionContract.cancelled','O contrato de comissÃ£o de corretor foi cancelado',NULL),(11436,'pt_BR:group.error.passwordPolicySpecialVirtualKeyboard','{0} nÃ£o pode obrigar caracteres especiais porque o teclado virtual estÃ¡ em uso para a senha de login',NULL),(11437,'pt_BR:cardType.error.removing','O tipo de cartÃ£o nÃ£o pode ser removido porque pertence a pelo menos um grupo ou possui pelo menos um cartÃ£o associado',NULL),(11438,'pt_BR:about.version','<b>VersÃ£o da aplicaÃ§Ã£o:</b> {0}',NULL),(11439,'pt_BR:loan.status.IN_PROCESS','Em processo',NULL),(11440,'pt_BR:customField.title.modify.memberRecord','Modificar campo customizado para registro de membro {0}',NULL),(11441,'pt_BR:permission.adminMemberBulkActions.changeBroker','Alterar corretor',NULL),(11442,'pt_BR:alert.member.accountActivationFailed','AtivaÃ§Ã£o da conta {0} falhou',NULL),(11443,'pt_BR:settings.access.generatedUsernameLength','Comprimento do nome de usuÃ¡rio gerado',NULL),(11444,'pt_BR:brokerCommission.unsuspended','A comissÃ£o de corretor foi reaberta',NULL),(11445,'pt_BR:admin.action.create.selectGroup','Selecione o grupo de administrador',NULL),(11446,'pt_BR:permission.module.type.BROKER','PermissÃµes de corretor de {0}',NULL),(11447,'pt_BR:permission.systemCurrencies.manage','Gerenciar',NULL),(11448,'pt_BR:permission.adminMemberGroups.manageMemberCustomizedFiles','Gerenciar arquivos customizados',NULL),(11449,'pt_BR:webshop.error.ticket','TÃ­quete de pagamento nÃ£o encontrado',NULL),(11450,'pt_BR:memberImport.title.details.error','Membros com erro de importaÃ§Ã£o',NULL),(11451,'pt_BR:reports.stats.general.sum','Soma',NULL),(11452,'pt_BR:error.image.dimension','Â­As dimensÃµes da imagem sÃ£o muito grandes',NULL),(11453,'pt_BR:invoice.error.noAccountType','NÃ£o hÃ¡ tipo de conta destino possÃ­vel.\nPor favor, contate a administraÃ§Ã£o',NULL),(11454,'pt_BR:menu.member.personal.ads','AnÃºncios',NULL),(11455,'pt_BR:settings.message.referenceReceived','ReferÃªncia recebida',NULL),(11456,'pt_BR:customizedFile.newContents','Novo conteÃºdo',NULL),(11457,'pt_BR:pos.error.removing','O POS nÃ£o pode ser removido porque pertence a um membro ou existe um log associado',NULL),(11458,'pt_BR:menu.operator.account.transfersAwaitingAuthorization','Aguardando autorizaÃ§Ã£o',NULL),(11459,'pt_BR:settings.local.memberResultDisplay','Exibir na lista de resultados de membros',NULL),(11460,'pt_BR:message.sent','A mensagem foi enviada com sucesso',NULL),(11461,'pt_BR:permission.adminAdmins.changeGroup','Alterar grupo',NULL),(11462,'pt_BR:customField.possibleValue.inserted','O valor foi inserido',NULL),(11463,'pt_BR:guarantee.issuedDate','Data de emissÃ£o',NULL),(11464,'pt_BR:group.settings.smsFree','Mensagens SMS gratuitas',NULL),(11465,'pt_BR:payment.title.confirm','ConfirmaÃ§Ã£o de transaÃ§Ã£o',NULL),(11466,'pt_BR:permission.memberPreferences.manageAdInterests','Gerenciar interesses em anÃºncios',NULL),(11467,'pt_BR:profile.action.memberSelfPayment','Self payment',NULL),(11468,'pt_BR:accountFee.action.run.confirmation','VocÃª estÃ¡ prestes a executar uma cobranÃ§a de taxa de conta.\n\nPor favor, clique em OK para confirmar',NULL),(11469,'pt_BR:memberPos.status.PIN_BLOCKED','PIN bloqueado',NULL),(11470,'pt_BR:rates.reinitialize','Reinicializar Ã­ndices',NULL),(11471,'pt_BR:global.textFormat.PLAIN','Texto puro',NULL),(11472,'pt_BR:permission.memberCards','CartÃµes',NULL),(11473,'pt_BR:transferType.defaultFeedbackLevel','Valor da qualificaÃ§Ã£o quando expirado',NULL),(11474,'pt_BR:permission.adminMemberInvoices.send','Enviar fatura eletrÃ´nica a partir do perfil',NULL),(11475,'pt_BR:authorizationLevel.authorizer.PAYER','Comprador',NULL),(11476,'pt_BR:brokerCommissionContract.amount','Valor',NULL),(11477,'pt_BR:transfer.title.print','InformaÃ§Ãµes da transaÃ§Ã£o',NULL),(11478,'pt_BR:settings.local.csv.valueSeparator','Separador de valores',NULL),(11479,'pt_BR:global.quarter.FIRST','Primeiro trimestre',NULL),(11480,'pt_BR:reports.members_reports.number','NÃºmero',NULL),(11481,'pt_BR:webshop.payment.descriptionText','A seguinte descriÃ§Ã£o foi informada:',NULL),(11482,'pt_BR:customImage.title.style','Imagens de folha de estilo',NULL),(11483,'pt_BR:menu.member.logout','Sair',NULL),(11484,'pt_BR:permission.brokerDocuments','Documentos',NULL),(11485,'pt_BR:memberRecordType.action.new','Inserir novo tipo de registro de membro',NULL),(11486,'pt_BR:contact.title.list','Lista de contatos',NULL),(11487,'pt_BR:activities.sinceActive','Membro desde',NULL),(11488,'pt_BR:externalAccount.title.overview','Contas externas',NULL),(11489,'pt_BR:memberImport.status.INVALID_EMAIL','O e-mail Ã© invÃ¡lido: {0}',NULL),(11490,'pt_BR:loan.setExpiredStatus','Marcar este emprÃ©stimo como \'{0}\'',NULL),(11491,'pt_BR:permission.adminMemberPos.manage','Gerenciar',NULL),(11492,'pt_BR:guaranteeType.status.DISABLED','Inativo',NULL),(11493,'pt_BR:accountFee.error.mustRechargeOldestLogFirst','Esta execuÃ§Ã£o da taxa nÃ£o pode ser cobrada agora porque existe uma execuÃ§Ã£o mais antiga que tambÃ©m falhou.\n\nPor favor, tente rodar a mais antiga primeiro.',NULL),(11494,'pt_BR:permission.adminMembers.import','Importar',NULL),(11495,'pt_BR:guaranteeType.pendingGuaranteeExpiration.tooltip','Representa o perÃ­odo mÃ¡ximo de resposta do emissor/administrador a uma garantia pendente',NULL),(11496,'pt_BR:ad.publicationPeriod.permanent','Permanente',NULL),(11497,'pt_BR:externalTransferProcess.loanDescription','NÂº {0}, em {1} de {2}',NULL),(11498,'pt_BR:memberImport.status.INVALID_CUSTOM_FIELD_VALUE_MIN_LENGTH','{0} Ã© invalido: o tamanho minimo Ã© {1}.',NULL),(11499,'pt_BR:menu.member.account.transfersAwaitingAuthorization','Aguardando autorizaÃ§Ã£o',NULL),(11500,'pt_BR:settings.message.externalChannelPaymentPerformed','Pagamento efetuado pelo canal externo',NULL),(11501,'pt_BR:group.status','Estado',NULL),(11502,'pt_BR:accountHistory.period.end','Data final',NULL),(11503,'pt_BR:alert.member.RECEIVED_VERY_BAD_REFS','O membro recebeu muitas referÃªncias de valor \'muito ruim\'',NULL),(11504,'pt_BR:message.type','Tipo',NULL),(11505,'pt_BR:reports.simulations.aRate.config.graph.title','Curva de configuraÃ§Ã£o do Ã­ndice-A',NULL),(11506,'pt_BR:transactionFee.inserted','A taxa de transaÃ§Ã£o foi inserida',NULL),(11507,'pt_BR:home.operator.news.title','NotÃ­cias (quadro de mensagens)',NULL),(11508,'pt_BR:changeGroup.member.expired','A participaÃ§Ã£o no grupo expirou',NULL),(11509,'pt_BR:reports.members_reports.system_invoices.invoiceModeRequired','Ã‰ necessÃ¡rio selecionar pelo menos um tipo (entrada / saÃ­da) de faturas eletrÃ´nicas de membro ou sistema',NULL),(11510,'pt_BR:reports.stats.activity.histogram.logins','Histograma de acessos por membro',NULL),(11511,'pt_BR:errors.javaClass','{0} deve ser um nome vÃ¡lido de uma classe java atribuÃ­vel a {1}',NULL),(11512,'pt_BR:permission.systemInfoTexts.manage','Gerenciar',NULL),(11513,'pt_BR:guarantee.loan','Exibir',NULL),(11514,'pt_BR:loan.changedExpiredStatus','O emprÃ©stimo foi marcado como \'{0}\'',NULL),(11515,'pt_BR:serviceOperation.CHARGEBACK','Estornar pagamentos',NULL),(11516,'pt_BR:loan.totalAmount','Valor total',NULL),(11517,'pt_BR:customField.member.indexing.MEMBERS_ONLY','Somente membros',NULL),(11518,'pt_BR:operator.action.create.selectGroup','Selecione o grupo',NULL),(11519,'pt_BR:accountFee.freeBase','Base livre',NULL),(11520,'pt_BR:certification.removed','A certificaÃ§Ã£o foi removida',NULL),(11521,'pt_BR:payment.error.enoughCredits','Saldo insuficiente: {0}',NULL),(11522,'pt_BR:transactionFee.aRateParameters','ParÃ¢metros do Ã­ndice-A',NULL),(11523,'pt_BR:profile.action.listBrokerCommissionContracts','Contratos de comissÃ£o',NULL),(11524,'pt_BR:permission.systemCustomFields.view','Ver',NULL),(11525,'pt_BR:transferType.fields.title.list','Campos customizados',NULL),(11526,'pt_BR:home.admin.status.cyclosVersion','VersÃ£o do Cyclos',NULL),(11527,'pt_BR:transfer.chargeback.details','Exibir detalhes',NULL),(11528,'pt_BR:login.registration.text','VocÃª pode se cadastrar clicando no botÃ£o abaixo.',NULL),(11529,'pt_BR:card.changeCardCode.newCode2','ConfirmaÃ§Ã£o',NULL),(11530,'pt_BR:card.changeCardCode.newCode1','Novo cÃ³digo de seguranÃ§a',NULL),(11531,'pt_BR:guarantee.currentCreditFeeValue','Taxa de crÃ©dito cobrada',NULL),(11532,'pt_BR:changePassword.resetAndErrorSending','A senha foi reiniciada, porÃ©m, o e-mail nÃ£o pÃ´de ser enviado ao membro',NULL),(11533,'pt_BR:group.settings.maxAmountPerDay','Valor mÃ¡ximo por dia por tipo de pagamento',NULL),(11534,'pt_BR:changeGroup.admin.changed','O grupo do administrador foi alterado',NULL),(11535,'pt_BR:paymentObligation.buyerName','Nome do comprador',NULL),(11536,'pt_BR:menu.admin.translation.file','Importar / Exportar',NULL),(11537,'pt_BR:externalTransferImport.error.importing.invalidMemberId','Identificador de membro invÃ¡lido: {0}',NULL),(11538,'pt_BR:currency.dRate.baseMalus','Malus base',NULL),(11539,'pt_BR:permission.adminMemberLoans.grant','Conceder emprÃ©stimo',NULL),(11540,'pt_BR:global.weekDay.TUESDAY','TerÃ§a-feira',NULL),(11541,'pt_BR:settings.message.cardSecurityCodeBlocked','CÃ³digo de seguranÃ§a do cartÃ£o bloqueado por tentativas invÃ¡lidas',NULL),(11542,'pt_BR:reference.transactionFeedback.role.SELLER','Pagamentos recebidos',NULL),(11543,'pt_BR:global.datePattern.second','ss',NULL),(11544,'pt_BR:guarantee.action.cancel','Cancelar',NULL),(11545,'pt_BR:adInterest.type.SEARCH','Demanda',NULL),(11546,'pt_BR:messageCategory.noMessageCategories','NÃ£o hÃ¡ categorias de mensagem disponÃ­veis!',NULL),(11547,'pt_BR:member.id','Identificador',NULL),(11548,'pt_BR:reports.stats.general.growth','Crescimento',NULL),(11549,'pt_BR:permission.systemGuaranteeTypes.view','Ver',NULL),(11550,'pt_BR:card.created','O cartÃ£o foi criado',NULL),(11551,'pt_BR:theme.import.error.reading','Erro ao importar o tema. Arquivo invÃ¡lido.',NULL),(11552,'pt_BR:permission.adminMemberGuarantees.cancelGuaranteesAsMember','Negar / Cancelar garantias',NULL),(11553,'pt_BR:reports.members.references.received','ReferÃªncias recebidas',NULL),(11554,'pt_BR:reports.stats.activity.topten.login.title','Os dez maiores em acessos',NULL),(11555,'pt_BR:posLog.date','Data',NULL),(11556,'pt_BR:permission.operatorMessages.sendToAdministration','Enviar para a administraÃ§Ã£o',NULL),(11557,'pt_BR:loan.summary.loans','EmprÃ©stimos',NULL),(11558,'pt_BR:translationMessage.title.search','Procurar chaves de traduÃ§Ã£o',NULL),(11559,'pt_BR:menu.operator.account.memberPayment','Pagamento para Membro',NULL),(11560,'pt_BR:settings.local.scheduledTasks','Tarefas agendadas',NULL),(11561,'pt_BR:settings.type.MESSAGE','NotificaÃ§Ãµes',NULL),(11562,'pt_BR:conversionSimulation.result.name','Nome',NULL),(11563,'pt_BR:profile.action.manageAds','Gerenciar anÃºncios',NULL),(11564,'pt_BR:changePin.error.mustBeNumeric','A senha externa (PIN) pode conter apenas nÃºmeros',NULL),(11565,'pt_BR:group.settings.pinBlockTimeAfterMaxTries','Tempo de bloqueio do PIN apÃ³s tentativas invÃ¡lidas',NULL),(11566,'pt_BR:permission.systemAlerts.viewMemberAlerts','Ver avisos de membro',NULL),(11567,'pt_BR:permission.adminMemberRecords.create','Criar',NULL),(11568,'pt_BR:accountFee.paymentDirection','Sentido do pagamento',NULL),(11569,'pt_BR:permission.brokerMemberAccess.transactionPassword','Gerenciar senha de transaÃ§Ã£o',NULL),(11570,'pt_BR:reports.members.accounts.upper_credits','Limite de crÃ©dito superior das contas',NULL),(11571,'pt_BR:transactionPassword.error.blocked','A sua senha de transaÃ§Ã£o estÃ¡ bloqueada.\nPor favor, contate a administraÃ§Ã£o',NULL),(11572,'pt_BR:posweb.target.username','Nome de usuÃ¡rio (destinatÃ¡rio)',NULL),(11573,'pt_BR:permission.adminMemberPreferences','PreferÃªncias',NULL),(11574,'pt_BR:permission.memberPayments.paymentToMember','Pagamento para membro',NULL),(11575,'pt_BR:permission.memberPayments.request','Solicitar pagamentos de outros canais',NULL),(11576,'pt_BR:login.action.loginAsMember','Acessar como membro',NULL),(11577,'pt_BR:settings.mail.smtpUseTLS','Usar TLS',NULL),(11578,'pt_BR:permission.systemTasks.manageIndexes','Gerenciar Ã­ndices de busca',NULL),(11579,'pt_BR:permission.operatorContacts.manage','Gerenciar',NULL),(11580,'pt_BR:group.customizedFiles.removed','O arquivo nÃ£o estÃ¡ mais customizado para este grupo',NULL),(11581,'pt_BR:guarantee.status.ACCEPTED','Aceita',NULL),(11582,'pt_BR:mailPreferences.newMembers','Novos membros cadastrados',NULL),(11583,'pt_BR:card.cardCodeChanged','Senha do cartÃ£o alterada',NULL),(11584,'pt_BR:pin.unblocked','A senha externa (PIN) foi desbloqueada',NULL),(11585,'pt_BR:paymentObligation.selectIssuer','Emissor selecionado:',NULL),(11586,'pt_BR:smsMailing.broker.all','Meus membros registrados',NULL),(11587,'pt_BR:customField.operator.visibility.VISIBLE_NOT_EDITABLE','VisÃ­vel e nÃ£o editÃ¡vel',NULL),(11588,'pt_BR:translationMessage.import.type.NEW_AND_EMPTY','Importar chaves novas e vazias',NULL),(11589,'pt_BR:settings.log.accountFeeLevel.DETAILED','Detalhado',NULL),(11590,'pt_BR:permission.systemCardTypes.manage','Gerenciar tipos de cartÃ£o',NULL),(11591,'pt_BR:customField.control.RADIO','Seletor',NULL),(11592,'pt_BR:menu.admin.help.manual','Manual',NULL),(11593,'pt_BR:cardSecurityCode.error.blocked','O cÃ³digo de seguranÃ§a do cartÃ£o agora estÃ¡ temporariamente bloqueado',NULL),(11594,'pt_BR:reports.simulations.aRateConfigSimulation.endA','Termina em A =',NULL),(11595,'pt_BR:menu.operator.help.manual','Manual',NULL),(11596,'pt_BR:permission.operatorInvoices.sendToMember','Enviar para membro',NULL),(11597,'pt_BR:profile.action.managePasswords','Gerenciar senhas',NULL),(11598,'pt_BR:adCategory.error.cantActivateCategoryWithInactiveParent','Uma categoria nÃ£o pode ser ativada se sua categoria mÃ£e estÃ¡ inativa',NULL),(11599,'pt_BR:settings.message.newPendingPaymentByBroker','Novo pagamento para o corretor autorizar',NULL),(11600,'pt_BR:serviceOperation.SMS','Enviar mensagens SMS',NULL),(11601,'pt_BR:currency.symbol','SÃ­mbolo',NULL),(11602,'pt_BR:reports.current.n_enabled','NÃºmero de membros ativos',NULL),(11603,'pt_BR:fieldMapping.orderModified','Ordem do mapeamento de campo modificada',NULL),(11604,'pt_BR:reports.members.download_btn','Baixar relatÃ³rio',NULL),(11605,'pt_BR:group.title.settings','ConfiguraÃ§Ãµes de grupo',NULL),(11606,'pt_BR:reports.stats.groupfilter','Filtro de membro',NULL),(11607,'pt_BR:accountType.title.new','Nova conta',NULL),(11608,'pt_BR:reports.stats.finances.expenditure.short','SaÃ­da',NULL),(11609,'pt_BR:payment.error.ratesRequiresLocksOnAllAccounts','Com indices ativados, todas as contas tÃªm de ser bloqueadas.\nContate a organizaÃ§Ã£o para que configure corretamente as propriedades necessÃ¡rias do cyclos.',NULL),(11610,'pt_BR:externalTransfer.date','Data',NULL),(11611,'pt_BR:customizedFile.newContentsNotification','HÃ¡ uma nova versÃ£o (original) deste arquivo customizado. Confira o seu conteÃºdo e selecione \"resolver conflitos\" antes de salvÃ¡-lo.',NULL),(11612,'pt_BR:guarantee.starts','InÃ­cio',NULL),(11613,'pt_BR:loan.queryStatus.ANY_CLOSED','Qualquer fechado',NULL),(11614,'pt_BR:translationMessage.title.modify','Modificar chave de traduÃ§Ã£o',NULL),(11615,'pt_BR:reference.direction.transactionFeedback.RECEIVED','QualificaÃ§Ãµes recebidas',NULL),(11616,'pt_BR:reference.date','Data',NULL),(11617,'pt_BR:menu.admin.accounts.loanPayments','Pagamentos de emprÃ©stimo',NULL),(11618,'pt_BR:settings.message.accountFeeReceived','Taxa de conta recebida',NULL),(11619,'pt_BR:adminTasks.onlineState.offline','O sistema estÃ¡ <b>indisponÃ­vel</b>',NULL),(11620,'pt_BR:guaranteeType.status.ENABLED','Ativo',NULL),(11621,'pt_BR:permission.memberAds','AnÃºncios',NULL),(11622,'pt_BR:reference.action.set','Definir referÃªncia',NULL),(11623,'pt_BR:help.title.statistics','EstatÃ­sticas',NULL),(11624,'pt_BR:externalAccountHistory.transferImport.title','TransaÃ§Ãµes de {0} para a importaÃ§Ã£o realizada em {1}',NULL),(11625,'pt_BR:pos.status','Estado',NULL),(11626,'pt_BR:permission.adminMemberLoans.grantWithDate','Conceder emprÃ©stimo em data no passado',NULL),(11627,'pt_BR:reports.simulations.aRate.config.graph.xAxis','Ã­ndice-A (dias)',NULL),(11628,'pt_BR:reports.simulations.choose','Escolher simulaÃ§Ã£o',NULL),(11629,'pt_BR:customizedFile.select.name','Selecione o arquivo',NULL),(11630,'pt_BR:reports.stats.keydevelopments.grossProduct.allTransactions','Para todas as transaÃ§Ãµes',NULL),(11631,'pt_BR:createOperator.action.saveAndOpenProfile','Salvar e abrir o perfil do operador',NULL),(11632,'pt_BR:loanGroup.title.search','Procurar grupos de emprÃ©stimos',NULL),(11633,'pt_BR:smsLog.status.DELIVERED','Enviada',NULL),(11634,'pt_BR:reports.stats.keydevelopments.numberOfAds.created','AnÃºncios criados',NULL),(11635,'pt_BR:permission.brokerInvoices.denyAsMember','Negar como membro',NULL),(11636,'pt_BR:help.title.settings','ConfiguraÃ§Ãµes',NULL),(11637,'pt_BR:guarantee.status.PENDING_ISSUER','Pendente pelo emissor',NULL),(11638,'pt_BR:settings.action.EXPORT','Exportar',NULL),(11639,'pt_BR:ad.title.view','Detalhes do anÃºncio',NULL),(11640,'pt_BR:receipt.transfer.installments','Parcelas:',NULL),(11641,'pt_BR:document.action.new','Inserir novo documento',NULL),(11642,'pt_BR:posweb.searchTransactions.noTransactions','NÃ£o hÃ¡ pagamentos na data especificada',NULL),(11643,'pt_BR:document.removeConfirmation','Remover documento?',NULL),(11644,'pt_BR:changeGroup.admin.permanentlyRemovedMessage','O administrador foi removido permanentemente',NULL),(11645,'pt_BR:accountFeeLog.rechargingFailed','Cobrando novamente os membros que falharam...',NULL),(11646,'pt_BR:loan.paymentDate','Pagamento',NULL),(11647,'pt_BR:accountFee.action.recharge','Repetir cobranÃ§a',NULL),(11648,'pt_BR:category.children','Sub categoria',NULL),(11649,'pt_BR:adCategory.removed','A categoria foi removida',NULL),(11650,'pt_BR:menu.operator.account.accountInformation','InformaÃ§Ãµes de Conta',NULL),(11651,'pt_BR:permission.brokerLoans','EmprÃ©stimos',NULL),(11652,'pt_BR:settings.local.memberSortOrder.ALPHABETICAL','AlfabÃ©tico',NULL),(11653,'pt_BR:adImport.status.INVALID_CUSTOM_FIELD','{0} Ã© invÃ¡lido: {1}',NULL),(11654,'pt_BR:serviceClient.modified','O cliente de serviÃ§os web foi modificado',NULL),(11655,'pt_BR:customField.title.list.ad','Campos customizados de anÃºncio',NULL),(11656,'pt_BR:alert.member.negativeVirtualRatedBalance','Um balanÃ§o negativo virtual de indices foi encontrado na conta {0}. O balanÃ§o de indices virtuais foi definido para 0, mas a causa para este erro deve ser verificada.',NULL),(11657,'pt_BR:permission.systemCustomImages','Imagens customizadas',NULL),(11658,'pt_BR:help.title.brokering','Corretagem',NULL),(11659,'pt_BR:loan.type.SINGLE_PAYMENT','Pagamento Ãºnico',NULL),(11660,'pt_BR:externalTransferImport.error.importing','Ocorreu um erro ao importar o arquivo de transaÃ§Ãµes',NULL),(11661,'pt_BR:menu.admin.accessDevices.pos.search','Busca pos',NULL),(11662,'pt_BR:permission.adminMemberAds.import','Importar',NULL),(11663,'pt_BR:invoice.accept.transactionPassword','Para aceitar a fatura, vocÃª deve fornecer sua senha de transaÃ§Ã£o',NULL),(11664,'pt_BR:errorLog.title.details','Detalhes do erro',NULL),(11665,'pt_BR:customizedFile.modified','O arquivo foi modificado',NULL),(11666,'pt_BR:adImport.processed','Os anÃºncios foram importados com sucesso',NULL),(11667,'pt_BR:posweb.action.logout','Desconectar (F10)',NULL),(11668,'pt_BR:settings.log.modified','As configuraÃ§Ãµes de log foram modificadas',NULL),(11669,'pt_BR:permission.systemTranslation.file','Importar / exportar para arquivo',NULL),(11670,'pt_BR:authorizationLevel.authorizer.BROKER','Corretor / administrador',NULL),(11671,'pt_BR:settings.mail.resetPassword','E-mail de reinicializaÃ§Ã£o da senha',NULL),(11672,'pt_BR:permission.brokerDocuments.viewMember','Ver documentos individuais de membro',NULL),(11673,'pt_BR:payment.chargeback.transactionPassword','Para estornar este pagamento, vocÃª deve fornecer sua senha de transaÃ§Ã£o',NULL),(11674,'pt_BR:invoice.acceptConfirmationMessage.fees','Se vocÃª aceitar a fatura eletrÃ´nica, As seguintes taxas serÃ£o aplicadas:',NULL),(11675,'pt_BR:serviceClient.name','Nome',NULL),(11676,'pt_BR:paymentObligation.registrationDate','Data de criaÃ§Ã£o',NULL),(11677,'pt_BR:adminTasks.onlineState.setOnline','Tornar o sistema disponÃ­vel',NULL),(11678,'pt_BR:multiDropDown.singleItemMessage','1 item selecionado',NULL),(11679,'pt_BR:error.rateParameters.creationExpirationSmallerThanEmission','Valor de criaÃ§Ã£o do indice-D deve ser maior que o valor de criaÃ§Ã£o do indice-A.',NULL),(11680,'pt_BR:card.title.search','Busca de cartÃµes',NULL),(11681,'pt_BR:reports.members_reports.debits','DÃ©bitos',NULL),(11682,'pt_BR:customField.possibleValue.modified','O valor foi modificado',NULL),(11683,'pt_BR:virtualKeyboard.full','Completo',NULL),(11684,'pt_BR:menu.admin.logout','Sair',NULL),(11685,'pt_BR:externalTransfer.modified','TranferÃªncia externa modificada',NULL),(11686,'pt_BR:transactionFee.subject.SOURCE','Membro que estÃ¡ pagando (origem)',NULL),(11687,'pt_BR:loanGroup.title.modify','Modificar grupo de emprÃ©stimos',NULL),(11688,'pt_BR:activities.invoices.outgoing.count','No. de saÃ­das',NULL),(11689,'pt_BR:settings.log.accountFeeLevel.STATUS','MudanÃ§as de estado e erros',NULL),(11690,'pt_BR:settings.local.rootUrl','URL raiz da aplicaÃ§Ã£o',NULL),(11691,'pt_BR:permission.brokerReferences','ReferÃªncias',NULL),(11692,'pt_BR:mobile.payment.amount','Valor',NULL),(11693,'pt_BR:adImport.invalidFormat','Formato invÃ¡lido de arquivo',NULL),(11694,'pt_BR:memberImport.status.INVALID_BALANCE','O saldo Ã© invÃ¡lido: {0}',NULL),(11695,'pt_BR:adImport.status.INVALID_CATEGORY','Categoria invÃ¡lida: {0}',NULL),(11696,'pt_BR:pos.createdAndAssigned','POS criado e associado ao membro {0}',NULL),(11697,'pt_BR:changePin.newPinConfirmation','Confirmar a nova senha externa (PIN)',NULL),(11698,'pt_BR:reports.current.member_count_on_group','Membros no grupo {0}',NULL),(11699,'pt_BR:scheduledPayment.date','Data',NULL),(11700,'pt_BR:alert.system.rateInitializationFinished','Tarefa de inicializaÃ§Ã£o de indices na moeda {0} finalizada para os seguintes indices:\n{1}',NULL),(11701,'pt_BR:accountFee.hour','Hora',NULL),(11702,'pt_BR:global.error.nothingSelected','Nada selecionado',NULL),(11703,'pt_BR:reports.simulations.aRateConfigSimulation.transactionFee','Taxa de transaÃ§Ã£o (para valores padrÃ£o)',NULL),(11704,'pt_BR:changePassword.error.mustBeAlphaNumeric','A senha pode conter apenas letras ou nÃºmeros',NULL),(11705,'pt_BR:home.admin.status.memberAlerts','NÃºmero de avisos de membro',NULL),(11706,'pt_BR:alert.system.adminTransactionPasswordBlockedByTries','A senha de transaÃ§Ã£o do administrador {0} agora estÃ¡ bloqueada por exceder a quantidade mÃ¡xima de tentativas ({1}). O endereÃ§o IP remoto Ã© {2}',NULL),(11707,'pt_BR:customField.ad.showInSearch','Exibir em buscas',NULL),(11708,'pt_BR:brokerCommissionContract.action.accept','Aceitar',NULL),(11709,'pt_BR:accountFee.action.running','A cobranÃ§a da taxa de conta estÃ¡ sendo executada',NULL),(11710,'pt_BR:permission.memberLoans.view','Ver',NULL),(11711,'pt_BR:loan.repaymentType','Tipo de pagamento',NULL),(11712,'pt_BR:notificationPreferences.disableSms.confirmation','VocÃª tem certeza que deseja desativar todas as notificaÃ§Ãµes e operaÃ§Ãµes por SMS?',NULL),(11713,'pt_BR:reports.stats.activity.singlePeriod.grossProduct.row2.short','Todos',NULL),(11714,'pt_BR:reports.stats.keydevelopments.numberOfMembers.numberOfNewMembers','NÃºmero de novos membros',NULL),(11715,'pt_BR:pos.actions.block','Bloquear',NULL),(11716,'pt_BR:reports.stats.keydevelopments.throughTime.years.title','Progresso ao longo do tempo',NULL),(11717,'pt_BR:settings.title.file','Importar / exportar configuraÃ§Ãµes',NULL),(11718,'pt_BR:transfersAwaitingAuthorization.title','Pagamentos aguardando autorizaÃ§Ã£o',NULL),(11719,'pt_BR:settings.message.scheduledPaymentsCancelled','',NULL),(11720,'pt_BR:settings.message.newPendingPaymentByPayer','Novo pagamento para o pagante autorizar',NULL),(11721,'pt_BR:brokerCommissionContract.endDate.from','Terminando a partir de',NULL),(11722,'pt_BR:certification.details','Detalhes',NULL),(11723,'pt_BR:payment.error.manageRelates','O usuÃ¡rio logado precisa precisa gerenciar uma das partes do pagamento e estar relacionado com a outra.',NULL),(11724,'pt_BR:guaranteeType.action.select','Cadastrar garantia',NULL),(11725,'pt_BR:rates.reinit.date','Data de reinicializaÃ§Ã£o',NULL),(11726,'pt_BR:defaultBrokerCommission.noCustomizedByBroker','Essa comisssÃ£o nÃ£o foi customizada pelo corretor ainda e estÃ¡ sujeita a mudanÃ§as pela administraÃ§Ã£o',NULL),(11727,'pt_BR:transactionFee.when.COUNT','TransaÃ§Ãµes',NULL),(11728,'pt_BR:invoice.action.cancel','Cancelar',NULL),(11729,'pt_BR:permission.operatorInvoices','Faturas eletrÃ´nicas',NULL),(11730,'pt_BR:theme.title.select','Escolha de tema',NULL),(11731,'pt_BR:accountType.inserted','O tipo de conta foi inserido',NULL),(11732,'pt_BR:transfer.paymentEvery','Parcela a cada',NULL),(11733,'pt_BR:transactionFee.aRateRelation.LINEAR','Linear',NULL),(11734,'pt_BR:brokering.status','Estado',NULL),(11735,'pt_BR:member.memberName','Nome do membro',NULL),(11736,'pt_BR:group.settings.passwordTries.deactivationTime','Tempo de desativaÃ§Ã£o apÃ³s no. mÃ¡x. de tentativas de senha',NULL),(11737,'pt_BR:settings.log.accountFeeLevel.ERRORS','Apenas erros',NULL),(11738,'pt_BR:conversionSimulation.result.graph.yAxis','Valor da taxa',NULL),(11739,'pt_BR:card.expirationPeriod.from','Expira de',NULL),(11740,'pt_BR:cardType.inserted','O tipo de cartÃ£o foi inserido',NULL),(11741,'pt_BR:customizedFile.path','EndereÃ§o',NULL),(11742,'pt_BR:memberRecordType.label','RÃ³tulo (plural)',NULL),(11743,'pt_BR:customField.ad.visibility.ADMIN','Somente administradores',NULL),(11744,'pt_BR:loan.remainingAmount','Valor restante',NULL),(11745,'pt_BR:card.group','Grupo',NULL),(11746,'pt_BR:settings.alert.title','ConfiguraÃ§Ãµes de alerta',NULL),(11747,'pt_BR:settings.local.language.PORTUGUESE_BRAZIL','PortuguÃªs (Brasil)',NULL),(11748,'pt_BR:payment.title.systemToSystem','TransferÃªncia entre contas de sistema',NULL),(11749,'pt_BR:alert.title','TÃ­tulo',NULL),(11750,'pt_BR:settings.local.csv.valueSeparator.TAB','TabulaÃ§Ã£o',NULL),(11751,'pt_BR:menu.operator.search','Buscar',NULL),(11752,'pt_BR:menu.member.broker.pendingMembers','Membros pendentes',NULL),(11753,'pt_BR:permission.adminMemberPos','POS',NULL),(11754,'pt_BR:sms.type.REQUEST_PAYMENT_ERROR.description','Erro na solicitaÃ§Ã£o de pagamento',NULL),(11755,'pt_BR:certification.title.view','Detalhes da certificaÃ§Ã£o',NULL),(11756,'pt_BR:memberPos.date','AtribuÃ­do ao membro em',NULL),(11757,'pt_BR:operator.title.search','Pesquisa de operadores',NULL),(11758,'pt_BR:global.timePeriod.MILLIS','Milisegundo(s)',NULL),(11759,'pt_BR:externalTransferType.transferType','Tipo de pagamento',NULL),(11760,'pt_BR:group.title.settings.registration','ConfiguraÃ§Ãµes de registro',NULL),(11761,'pt_BR:createMember.captcha.invalid','VocÃª nÃ£o digitou corretamente os caracteres da imagem',NULL),(11762,'pt_BR:reports.stats.activity.singlePeriod.grossProduct','Produto bruto por membro',NULL),(11763,'pt_BR:reports.stats.general.graph.allGraphs','Exibir todos os grÃ¡ficos',NULL),(11764,'pt_BR:externalTransfer.comments','ComentÃ¡rios da importaÃ§Ã£o',NULL),(11765,'pt_BR:permission.systemLoanGroups','Grupos de emprÃ©stimos',NULL),(11766,'pt_BR:menu.admin.personal.changePassword','Alterar senha',NULL),(11767,'pt_BR:conversionSimulation.result.input','Entrada',NULL),(11768,'pt_BR:permission.adminMemberBulkActions.changeGroup','Alterar grupo',NULL),(11769,'pt_BR:groupFilter.new','Inserir novo filtro de grupos',NULL),(11770,'pt_BR:invoice.search.period.end','AtÃ©',NULL),(11771,'pt_BR:reports.stats.activity.comparePeriods.grossProduct.yAxis','Produto bruto',NULL),(11772,'pt_BR:posLog.assignTo','AtribuÃ­do para',NULL),(11773,'pt_BR:externalTransferImport.removeConfirmation','Remover esta importaÃ§Ã£o de transaÃ§Ãµes?',NULL),(11774,'pt_BR:message.type.EXTERNAL_PAYMENT','Pagamentos realizados por canais externos',NULL),(11775,'pt_BR:payment.error.sameFromAntToInFee','Este pagamento nÃ£o pode ser realizado porque geraria uma cobranÃ§a de taxa de / para a mesma conta',NULL),(11776,'pt_BR:message.error.memberWontReceiveNotification','O membro selecionado optou por nÃ£o receber mensagens de outros membros',NULL),(11777,'pt_BR:permission.brokerInvoices.sendAsMemberToMember','Enviar como membro para membro',NULL),(11778,'pt_BR:certification.logs','Detalhes das alteraÃ§Ãµes',NULL),(11779,'pt_BR:card.activationDate','Data de ativaÃ§Ã£o',NULL),(11780,'pt_BR:settings.local.applicationUsername','Nome de usuÃ¡rio do aplicativo',NULL),(11781,'pt_BR:brokerCommission.type','Tipo',NULL),(11782,'pt_BR:customField.size','Tamanho do campo',NULL),(11783,'pt_BR:ad.search.noResults','Nenhum anÃºncio foi encontrado',NULL),(11784,'pt_BR:settings.local.language.GERMAN','AlemÃ£o',NULL),(11785,'pt_BR:alert.system.accountFeeFinished','A taxa de conta {0} foi concluÃ­da',NULL),(11786,'pt_BR:menu.admin.guarantees','Garantias',NULL),(11787,'pt_BR:mobile.payment.error.maxAmountPerDay','VocÃª jÃ¡ atingiu o valor mÃ¡ximo hoje',NULL),(11788,'pt_BR:permission.systemChannels.manage','Gerenciar',NULL),(11789,'pt_BR:customField.title.list.loanGroup','Campos customizados de grupo de emprÃ©stimos',NULL),(11790,'pt_BR:createMember.created.mailError','O membro foi criado, porÃ©m, o e-mail de ativaÃ§Ã£o nÃ£o pÃ´de ser enviado',NULL),(11791,'pt_BR:defaultBrokerCommission.status.SUSPENDED','Suspensa',NULL),(11792,'pt_BR:payment.authorizeOnly.transactionPassword','Para autorizar este pagamento, vocÃª deve informar sua senha de transaÃ§Ã£o',NULL),(11793,'pt_BR:home.status.title','Quadro de notificaÃ§Ãµes',NULL),(11794,'pt_BR:message.category','Categoria',NULL),(11795,'pt_BR:permission.memberMessages.view','Ver',NULL),(11796,'pt_BR:account.status.ACTIVE','Ativa',NULL),(11797,'pt_BR:certification.status.SCHEDULED','Agendada',NULL),(11798,'pt_BR:admin.email','E-Mail',NULL),(11799,'pt_BR:theme.filename','Nome do arquivo',NULL),(11800,'pt_BR:customField.validation.unique','Ãšnico',NULL),(11801,'pt_BR:settings.local.csv.stringQuote','Delimiador de texto',NULL),(11802,'pt_BR:reports.stats.activity.throughTime.percentageNoTrade.col1','Percentual sem transaÃ§Ãµes',NULL),(11803,'pt_BR:alert.system.NEW_VERSION_OF_APPLICATION_PAGE','Nova versÃ£o de pÃ¡gina de aplicaÃ§Ã£o',NULL),(11804,'pt_BR:settings.log.transactionLevel.NORMAL','Normal',NULL),(11805,'pt_BR:menu.member.broker.registerMember','Cadastrar membro',NULL),(11806,'pt_BR:operator.email','E-mail',NULL),(11807,'pt_BR:settings.access.memberTimeout','Tempo de expiraÃ§Ã£o da sessÃ£o do membro',NULL),(11808,'pt_BR:externalAccount.inserted','A conta externa foi inserida',NULL),(11809,'pt_BR:permission.memberMessages.sendToMember','Enviar para outro membro',NULL),(11810,'pt_BR:externalTransferType.name','Nome',NULL),(11811,'pt_BR:settings.local.modified','As configuraÃ§Ãµes locais foram modificadas',NULL),(11812,'pt_BR:settings.local.maxImageHeight','',NULL),(11813,'pt_BR:memberRecord.date','Criado em',NULL),(11814,'pt_BR:memberImport.initialCredits','CrÃ©ditos',NULL),(11815,'pt_BR:fieldMapping.field.DESCRIPTION','DescriÃ§Ã£o',NULL),(11816,'pt_BR:pos.title.insert','Inserir POS',NULL),(11817,'pt_BR:document.currentFile','Arquivo atual',NULL),(11818,'pt_BR:settings.local.brokeringExpiration','Vencimento da corretagem',NULL),(11819,'pt_BR:adInterest.title','TÃ­tulo descritivo',NULL),(11820,'pt_BR:image.details.title','Ajustar ordem e legenda da imagem',NULL),(11821,'pt_BR:brokerCommissionContract.action.remove','Remover',NULL),(11822,'pt_BR:menu.member.personal.commissionChargeStatus','Estado da cobranÃ§a de commissÃµes',NULL),(11823,'pt_BR:certification.lock','Suspender',NULL),(11824,'pt_BR:customImage.system.pay','Ãcone de pagamento',NULL),(11825,'pt_BR:loanPayment.summary.discardedPayments','Parcelas descartadas',NULL),(11826,'pt_BR:connectedUsers.noOperators','NÃ£o hÃ¡ operadores conectados no momento',NULL),(11827,'pt_BR:memberRecordType.fields.title.list','Campos customizados',NULL),(11828,'pt_BR:transactionFee.description','DescriÃ§Ã£o',NULL),(11829,'pt_BR:member.search.allGroups','Todos os grupos',NULL),(11830,'pt_BR:reports.members.account.header','Conta: {0}',NULL),(11831,'pt_BR:ad.category.title.order','Definir a ordem das categorias',NULL),(11832,'pt_BR:externalTransferImport.error.format.detailed','Erro importando transaÃ§Ãµes: Valor invÃ¡lido: \nLinha: {0}\nColuma: {1}\nCampo: {2}\nValor: {3}',NULL),(11833,'pt_BR:settings.type.ALERT','Config. de alertas',NULL),(11834,'pt_BR:general.error.accountStatusProcessing','Erro crÃ­tico no processamento das contas.\n\nPor favor, contacte a administraÃ§Ã£o',NULL),(11835,'pt_BR:invoice.accepted','A fatura eletrÃ´nica foi aceita',NULL),(11836,'pt_BR:currency.aRate.initDate','Data de inicializaÃ§Ã£o para Ã­ndice-A',NULL),(11837,'pt_BR:brokerCommissionContract.accepted','O contrato de comissÃ£o de corretor foi aceito',NULL),(11838,'pt_BR:loan.queryStatus.UNRECOVERABLE','IrrecuperÃ¡vel',NULL),(11839,'pt_BR:mobile.payment.error.maxAmountPerDay.at','VocÃª jÃ¡ atingiu o valor mÃ¡ximo no dia {1}',NULL),(11840,'pt_BR:customField.validation.maxLength','Tamanho mÃ¡ximo',NULL),(11841,'pt_BR:brokerCommissionContract.startDate','Data de inÃ­cio',NULL),(11842,'pt_BR:permission.brokerMembers','Corretagem',NULL),(11843,'pt_BR:guaranteeType.pendingGuaranteeExpiration','Prazo de resposta para garantias pendentes',NULL),(11844,'pt_BR:permission.memberReceiptPrinterSettings.manage','Gerenciar impressÃ£o de recibos',NULL),(11845,'pt_BR:adImport.status.MISSING_PUBLICATION_PERIOD','O perÃ­odo de publicaÃ§Ã£o estÃ¡ faltando',NULL),(11846,'pt_BR:serviceOperation.ADVERTISEMENTS','Busca de anÃºncios',NULL),(11847,'pt_BR:cardType.cardSecurityCode.NOT_USED','NÃ£o utilizado',NULL),(11848,'pt_BR:reports.stats.keydevelopments.throughTime.years.xAxis','Anos',NULL),(11849,'pt_BR:paymentObligation.logs','Detalhes das alteraÃ§Ãµes',NULL),(11850,'pt_BR:certification.guarantees','Garantias',NULL),(11851,'pt_BR:externalTransferProcess.error.noTransferTypeToPay','NÃ£o hÃ¡ tipos de pagamento possÃ­veis',NULL),(11852,'pt_BR:invoice.search.direction','Tipo',NULL),(11853,'pt_BR:settings.local.chargebacks','Estorno de pagamentos',NULL),(11854,'pt_BR:profile.action.manageExternalAccess','Acesso externo',NULL),(11855,'pt_BR:settings.action','AÃ§Ã£o',NULL),(11856,'pt_BR:permission.adminMemberGuarantees.viewGuarantees','Ver garantias',NULL),(11857,'pt_BR:paymentObligation.sellerName','Nome do comprador',NULL),(11858,'pt_BR:customField.loanGroup.showInSearch','Exibir nas buscas',NULL),(11859,'pt_BR:settings.access.usernameGeneration.NONE','Manual pelo membro',NULL),(11860,'pt_BR:profile.action.authorizedPayments','Pagamentos autorizados',NULL),(11861,'pt_BR:loanGroup.removed','O grupo de emprÃ©stimos foi removido',NULL),(11862,'pt_BR:reports.members.accounts.balances','BalanÃ§os das contas',NULL),(11863,'pt_BR:transactionFee.title.broker.modify','Modificar comissÃ£o de corretor',NULL),(11864,'pt_BR:profile.action.byBroker.title','AÃ§Ãµes de corretor para {0}',NULL),(11865,'pt_BR:loan.title.repayment','Pagamento de emprÃ©stimo',NULL),(11866,'pt_BR:settings.access.title','ConfiguraÃ§Ãµes de acesso',NULL),(11867,'pt_BR:receiptPrinterSettings.created','A configuraÃ§Ã£o de impressora de recibos foi criada',NULL),(11868,'pt_BR:permission.systemInvoices.view','Ver',NULL),(11869,'pt_BR:transferType.transactionHierarchyVisibility.ADMIN','Somente para administradores',NULL),(11870,'pt_BR:loanGroup.inserted','Grupo de emprÃ©stimos inserido',NULL),(11871,'pt_BR:customImage.thumbnail','Miniatura',NULL),(11872,'pt_BR:menu.member.personal.pos.editPos','Editar pos',NULL),(11873,'pt_BR:fieldMapping.action.changeOrder','Alterar ordem de mapeamento dos campos',NULL),(11874,'pt_BR:general.error.indexedRecordNotFound','Um registro indexado nÃ£o foi encontrado.\n\nPor favor, peÃ§a Ã  administraÃ§Ã£o para recriar os Ã­ndices de busca',NULL),(11875,'pt_BR:loan.calculate','Calcular',NULL),(11876,'pt_BR:serviceClient.noResults','NÃ£o hÃ¡ clientes de serviÃ§os web',NULL),(11877,'pt_BR:infoText.new','Criar novo',NULL),(11878,'pt_BR:permission.adminMemberTransactionFeedbacks','QualificaÃ§Ãµes de transaÃ§Ã£o',NULL),(11879,'pt_BR:guarantee.sellerUsername','UsuÃ¡rio do vendedor',NULL),(11880,'pt_BR:payment.firstPaymentDate','Primeiro pagamento em',NULL),(11881,'pt_BR:transferType.conciliabled','ConciliÃ¡vel',NULL),(11882,'pt_BR:customField.size.DEFAULT','PadrÃ£o',NULL),(11883,'pt_BR:transfer.relatedTransfers','TransaÃ§Ãµes relacionadas',NULL),(11884,'pt_BR:account.type','Conta',NULL),(11885,'pt_BR:registrationAgreement.title.list','Termos de adesÃ£o',NULL),(11886,'pt_BR:currency.aRate.creationValue','Ãndice-A na criaÃ§Ã£o da unidade',NULL),(11887,'pt_BR:invoice.title.details','Detalhes da fatura eletrÃ´nica',NULL),(11888,'pt_BR:defaultBrokerCommission.validity.always','Sempre',NULL),(11889,'pt_BR:paymentObligation.publish','Publicar',NULL),(11890,'pt_BR:changeGroup.member.changed','O grupo do membro foi alterado',NULL),(11891,'pt_BR:paymentFilter.allPaymentFilters','Todos os filtros de pagamento',NULL),(11892,'pt_BR:tranasctionFee.count','NÃºmero de transaÃ§Ãµes ou dias',NULL),(11893,'pt_BR:connectedUsers.disconnectToolTip','Desconectar usuÃ¡rio',NULL),(11894,'pt_BR:infoText.inserted','A mensagem informativa foi inserida',NULL),(11895,'pt_BR:settings.message.pendingPaymentAuthorized','Pagamento pendente autorizado',NULL),(11896,'pt_BR:accountType.limitType','Tipo de limite',NULL),(11897,'pt_BR:menu.admin.guarantees.listGuaranteeTypes','Tipos de garantias',NULL),(11898,'pt_BR:customImage.choose','Escolha uma imagem',NULL),(11899,'pt_BR:loan.expirationDailyInterestRepaymentType','Tipo de pagamento para juros de vencimento',NULL),(11900,'pt_BR:permission.adminMemberInvoices.accept','Aceitar fatura eletrÃ´nica',NULL),(11901,'pt_BR:loan.queryStatus.IN_PROCESS','Em processo',NULL),(11902,'pt_BR:settings.message.maxTransactionPasswordTries','Excedido o no. mÃ¡x. de tentativas de senha de transaÃ§Ã£o',NULL),(11903,'pt_BR:settings.local.maxImageWidth','',NULL),(11904,'pt_BR:global.month.APRIL','Abril',NULL),(11905,'pt_BR:authorizationLevel.authorizer.ADMIN','Administrador',NULL),(11906,'pt_BR:reference.summary.allTime','Desde o inÃ­cio',NULL),(11907,'pt_BR:webshop.error.paymentDisabled','O pagamento para loja virtual nÃ£o estÃ¡ ativo para este usuÃ¡rio',NULL),(11908,'pt_BR:global.params','ParÃ¢metros',NULL),(11909,'pt_BR:transactionPassword.generate','Obter senha de transaÃ§Ã£o',NULL),(11910,'pt_BR:profile.action.transactionFeedbacks','QualificaÃ§Ãµes de transaÃ§Ãµes',NULL),(11911,'pt_BR:transfer.commision.broker.notcommision','NÃ£o existe comissÃµes',NULL),(11912,'pt_BR:reports.stats.activity.singlePeriod.percentageNoTrade.yAxis','% membros que nÃ£o transacionam',NULL),(11913,'pt_BR:invoice.title.print','InformaÃ§Ãµes da fatura eletrÃ´nica',NULL),(11914,'pt_BR:memberImport.processed','Os membros foram importados com sucesso',NULL),(11915,'pt_BR:reports.stats.keydevelopments.throughTime.show','Mostrar',NULL),(11916,'pt_BR:payment.status.PENDING','Aguardando autorizaÃ§Ã£o',NULL),(11917,'pt_BR:adImport.title.summary','SumÃ¡rio da importaÃ§Ã£o de anÃºncios',NULL),(11918,'pt_BR:permission.memberReceiptPrinterSettings','ConfiguraÃ§Ã£o da impressÃ£o de recibos',NULL),(11919,'pt_BR:conversionSimulation.result','Resultados da simulaÃ§Ã£o de conversÃ£o',NULL),(11920,'pt_BR:settings.access.externalPaymentPassword','Senha solicitada no pagamento externo',NULL),(11921,'pt_BR:reports.stats.finances.singlePeriod.expenditure.title','SaÃ­da conta de sistema',NULL),(11922,'pt_BR:notificationPreferences.paidSmsLeft','VocÃª tem {0} mensagens SMS pagas restantes (vencimento em {1})',NULL),(11923,'pt_BR:login.accessOptions','OpÃ§Ãµes de acesso',NULL),(11924,'pt_BR:message.search.noResults','VocÃª nÃ£o possui mensagens para os filtros selecionados',NULL),(11925,'pt_BR:memberRecord.lastModified','Modificado em',NULL),(11926,'pt_BR:memberRecordType.removed','O tipo de registro de membro foi removido',NULL),(11927,'pt_BR:permission.operatorGuarantees.issueGuarantees','Emitir garantias',NULL),(11928,'pt_BR:group.account.removeConfirmation','Remover conta do grupo?',NULL),(11929,'pt_BR:loan.queryStatus.PENDING_AUTHORIZATION','Pendente de autorizaÃ§Ã£o',NULL),(11930,'pt_BR:settings.local.csv.valueSeparator.COMMA','VÃ­rgula',NULL),(11931,'pt_BR:ticket.status','Estado',NULL),(11932,'pt_BR:menu.admin.contentManagement.staticFiles','Arquivos estÃ¡ticos',NULL),(11933,'pt_BR:quickAccess.accountInfo','Extrato(s)',NULL),(11934,'pt_BR:externalTransferImport.error.removing','A importaÃ§Ã£o de transaÃ§Ãµes nÃ£o pode ser removido porque possui transaÃ§Ãµes conferidas ou processadas',NULL),(11935,'pt_BR:createMember.password','Senha',NULL),(11936,'pt_BR:memberPos.assign.invalidMember','O membro digitado nÃ£o existe. Por favor escolha outro.',NULL),(11937,'pt_BR:pos.search.noResults','Nenhum pos encontrado',NULL),(11938,'pt_BR:permission.adminMemberAccounts.scheduledInformation','Ver pagamentos agendados',NULL),(11939,'pt_BR:certification.title.search','Busca de certificaÃ§Ãµes',NULL),(11940,'pt_BR:permission.adminMemberPayments.cancelAuthorizedAsMember','Cancelar pagamento autorizado como membro',NULL),(11941,'pt_BR:reports.current.invoices.SYSTEM_INCOMING.count','NÃºmero de faturas eletrÃ´nicas de entrada no sistema',NULL),(11942,'pt_BR:conversionSimulation.amount','Valor a converter',NULL),(11943,'pt_BR:settings.local.transactionNumber.padLength','Tamanho do identificador',NULL),(11944,'pt_BR:smsMailing.by','Enviado por',NULL),(11945,'pt_BR:errors.notAllowed.loanInPast','EmprÃ©stimos concedidos no passado nÃ£o sÃ£o possÃ­veis caso os Ã­ndices estejam ativados.\nIsto Ã© um erro de configuraÃ§Ã£o; por favor contate o administrador do sistema.',NULL),(11946,'pt_BR:externalAccountHistory.button.toImportList','Ir para importaÃ§Ã£o de lista',NULL),(11947,'pt_BR:settings.message.newPendingPaymentByReceiver','Novo pagamento para o recebedor autorizar',NULL),(11948,'pt_BR:accountType.modified','O tipo de conta foi modificado',NULL),(11949,'pt_BR:ad.publicationPeriod.end','Data de vencimento',NULL),(11950,'pt_BR:changePassword.expired','Sua senha expirou.\n\nPara continuar vocÃª deve mudÃ¡-la.',NULL),(11951,'pt_BR:permission.systemInfoTexts.view','Ver',NULL),(11952,'pt_BR:transferType.error.removing','Esse tipo de transaÃ§Ã£o nÃ£o pode ser removida porque ainda existem transaÃ§Ãµes desse tipo',NULL),(11953,'pt_BR:reports.current.n_permads','NÃºmero de anÃºncios permanentes',NULL),(11954,'pt_BR:cardType.modified','O tipo de cartÃ£o foi modificado',NULL),(11955,'pt_BR:group.settings.passwordPolicy.NONE','NÃ£o reforÃ§ar senha',NULL),(11956,'pt_BR:brokerCommissionContract.title.view','Detalhes do contrato de comissÃ£o de corretor',NULL),(11957,'pt_BR:pendingMember.resendEmail','Re-enviar e-mail (o Ãºltimo foi dia {0})',NULL),(11958,'pt_BR:permission.systemAccountFees','Taxas de conta',NULL),(11959,'pt_BR:externalTransferProcess.paymentDescription','{0}, de {1}',NULL),(11960,'pt_BR:accountFee.title.logDetails','Detalhes da execuÃ§Ã£o da taxa de conta',NULL),(11961,'pt_BR:global.tooltip.exportCSV','Exportar para CSV',NULL),(11962,'pt_BR:reports.stats.keydevelopments.grossProduct.title','Progressos no produto bruto (= soma dos valores das transaÃ§Ãµes)',NULL),(11963,'pt_BR:scheduledPayment.accountType','Conta',NULL),(11964,'pt_BR:reports.stats.activity.comparePeriods.numberTransactions','NÃºmero de transaÃ§Ãµes por membro',NULL),(11965,'pt_BR:permission.memberDocuments','Documentos',NULL),(11966,'pt_BR:smsLog.type.MAILING','SMS de difusÃ£o',NULL),(11967,'pt_BR:receiptPrinterSettings.remove.confirm','VocÃª tem certeza que deseja excluir esta configuraÃ§Ã£o de impressora de recibos?',NULL),(11968,'pt_BR:customField.memberRecord.showInList','Exibir nas listas',NULL),(11969,'pt_BR:transfer.guarantee','Garantias relacionadas',NULL),(11970,'pt_BR:ad.maxPicturesMessage','O anÃºncio jÃ¡ tem o nÃºmero mÃ¡ximo de imagens permitidas',NULL),(11971,'pt_BR:memberImport.initialCreditTransferType','Tipo de pagamento para saldos positivos',NULL),(11972,'pt_BR:reports.stats.activity.developments','Progressos',NULL),(11973,'pt_BR:global.search.NORMAL','Simples',NULL),(11974,'pt_BR:settings.local.language.GREEK','Grego',NULL),(11975,'pt_BR:payment.setDate','Pagar no passado',NULL),(11976,'pt_BR:smsMailing.mailingType.FREE_FROM_BROKER','DifusÃ£o gratuita de corretor',NULL),(11977,'pt_BR:externalTransferType.description','DescriÃ§Ã£o',NULL),(11978,'pt_BR:brokering.change.confirmation.withBroker','{1} jÃ¡ possui {2} como corretor.\nVocÃª deseja alterar o corretor para {0}?',NULL),(11979,'pt_BR:settings.log.scheduledTaskLevel.ERRORS','Apenas erros',NULL),(11980,'pt_BR:pos.unassignPos.confirmation','Desatribuir POS do membro?',NULL),(11981,'pt_BR:global.weekDay.SUNDAY','Domingo',NULL),(11982,'pt_BR:reports.members.date.current','Estado atual',NULL),(11983,'pt_BR:transactionFee.brokerGroups','Grupos de corretores',NULL),(11984,'pt_BR:reports.stats.general.payments','pagamentos',NULL),(11985,'pt_BR:permission.operatorPayments.authorize','Autorizar ou negar',NULL),(11986,'pt_BR:settings.local.csv.recordSeparator.CR_LF','DOS (char 10 + char 13)',NULL),(11987,'pt_BR:settings.local.decimalInputMethod.LTR','Esquerda para a direita (deve-se digitar o separador decimal)',NULL),(11988,'pt_BR:permission.memberInvoices.sendToMember','Enviar para membro',NULL),(11989,'pt_BR:loan.grant.confirmation.fees','Se vocÃª conceder esse emprÃ©stimo, as seguintes taxas serÃ£o aplicadas:',NULL),(11990,'pt_BR:customField.possibleValue.title.insert','Inserir valor',NULL),(11991,'pt_BR:guaranteeType.model.WITH_PAYMENT_OBLIGATION','Com obrigaÃ§Ãµes de pagamento',NULL),(11992,'pt_BR:error.rateParameters.initExpirationBeforeEmission','CombinaÃ§Ã£o dos valores de inicializaÃ§Ã£o do indice-A levam a uma data de emissÃ£o que Ã© posterior a data de expiraÃ§Ã£o seguinte dos valores de inicializaÃ§Ã£o do  Ã­ndice-D.',NULL),(11993,'pt_BR:transactionFee.subject.SYSTEM','Conta de sistema',NULL),(11994,'pt_BR:reports.members.ads.active','Ativo',NULL),(11995,'pt_BR:permission.systemStatus','Estado do sistema',NULL),(11996,'pt_BR:menu.admin.alerts.member','Avisos de membro',NULL),(11997,'pt_BR:pos.removed','O POS foi removido',NULL),(11998,'pt_BR:group.copySettingsFrom','Copiar configuraÃ§Ãµes de',NULL),(11999,'pt_BR:permission.adminMembers.managePending','Gerenciar membros pendentes',NULL),(12000,'pt_BR:transfer.paymentCount','NÂº de parcelas',NULL),(12001,'pt_BR:quickAccess.searchAds','Procurar anÃºncios',NULL),(12002,'pt_BR:message.type.REFERENCE','ReferÃªncia recebida',NULL),(12003,'pt_BR:alert.system.applicationShutdown','AplicaÃ§Ã£o finalizada',NULL),(12004,'pt_BR:permission.adminMemberCards.cancel','Cancelar',NULL),(12005,'pt_BR:global.weekDay.WEDNESDAY','Quarta-feira',NULL),(12006,'pt_BR:help.title.home','InÃ­cio',NULL),(12007,'pt_BR:customField.title.modify.operator','Modificar campo customizado de operador',NULL),(12008,'pt_BR:paymentObligation.title.searchPaymentObligations','Busca de obrigaÃ§Ãµes de pagamento',NULL),(12009,'pt_BR:reports.stats.systemAccountFilter','Conta de sistema',NULL),(12010,'pt_BR:customImage.system.mobileSplash_medium','Mobile: Imagem inicial media',NULL),(12011,'pt_BR:document.title.modify','Modificar documento',NULL),(12012,'pt_BR:reports.stats.keydevelopments.numberOfMembers.numberOfNewMembers.short','Novo',NULL),(12013,'pt_BR:permission.systemAdCategories.file','Exportar / importar para arquivo',NULL),(12014,'pt_BR:brokerCommissionContract.status','Estado',NULL),(12015,'pt_BR:theme.style.LOGIN','PÃ¡gina de login',NULL),(12016,'pt_BR:group.settings.passwordPolicy','PolÃ­tica de senha',NULL),(12017,'pt_BR:transactionFee.chargeType.D_RATE','Ãndice-D',NULL),(12018,'pt_BR:reports.stats.activity.throughTime.percentageNoTrade','Percentual de membros que nÃ£o transacionam',NULL),(12019,'pt_BR:settings.mailTranslation.title','TraduÃ§Ã£o dos e-mails',NULL),(12020,'pt_BR:transactionFee.name','Nome',NULL),(12021,'pt_BR:guaranteeType.authorizedBy.NONE','NÃ£o necessita autorizaÃ§Ã£o',NULL),(12022,'pt_BR:settings.message.externalChannelPaymentRequestExpiredReceiver','SolicitaÃ§Ã£o de pagamento pelo canal externo expirada pelo recebedor',NULL),(12023,'pt_BR:group.account.title.modify','Modificar configuraÃ§Ãµes de conta para o grupo {0}',NULL),(12024,'pt_BR:permission.adminAdminRecords.delete','Apagar',NULL),(12025,'pt_BR:settings.local.emailRequired','E-mail obrigatÃ³rio para membros',NULL),(12026,'pt_BR:customImage.system.pending','Pagamento externo pendente',NULL),(12027,'pt_BR:createMember.public.awaitingMailValidation','Obrigado por cadastrar-se.\n\nPara validar seu endereÃ§o de e-mail, um mail estÃ¡ sendo enviado, com instruÃ§Ãµes sobre como prosseguir',NULL),(12028,'pt_BR:guarantee.creditFee','Taxa de crÃ©dito',NULL),(12029,'pt_BR:global.up','Subir',NULL),(12030,'pt_BR:invoice.status.DENIED','Negada',NULL),(12031,'pt_BR:reference.transactionFeedback.saved','A qualificaÃ§Ã£o foi salva',NULL),(12032,'pt_BR:permission.systemGroups.manageBroker','Gerenciar grupos de corretores',NULL),(12033,'pt_BR:reports.stats.general.transferType.chooseOne','Escolha um tipo de transferÃªncia',NULL),(12034,'pt_BR:externalTransferImport.imported','O arquivo foi importado com sucesso',NULL),(12035,'pt_BR:menu.member.preferences','OpÃ§Ãµes',NULL),(12036,'pt_BR:loanGroup.name','Nome do grupo',NULL),(12037,'pt_BR:customImage.system.message_read','Ãcone de mensagem lida',NULL),(12038,'pt_BR:permission.adminMemberPos.unblockPin','Desbloquear senha externa',NULL),(12039,'pt_BR:reports.stats.keydevelopments.numberOfMembers.title','AvanÃ§os no nÃºmero de membros',NULL),(12040,'pt_BR:alert.system.maxIncorrectLoginAttempts','O no. mÃ¡ximo de tentativas de acesso ({0}) com nome de usuÃ¡rio incorreto foi atingido a partir do IP {1}',NULL),(12041,'pt_BR:document.visibility.MEMBER','Membro',NULL),(12042,'pt_BR:alert.system.ADMIN_TRANSACTION_PASSWORD_BLOCKED_BY_TRIES','Senha de transaÃ§Ã£o de administrador bloqueada pelo nÃºmero de tentativas invÃ¡lidas',NULL),(12043,'pt_BR:group.settings.smsAdditionalChargedPeriod','PerÃ­odo de expiraÃ§Ã£o do pacote pago',NULL),(12044,'pt_BR:customImage.system.noPicture','Sem imagens',NULL),(12045,'pt_BR:reference.feedbackComments','QualificaÃ§Ã£o do comprador',NULL),(12046,'pt_BR:sms.error.type.NO_SMS_LEFT','Sem mensgens disponÃ­veis',NULL),(12047,'pt_BR:changePin.newPin','Nova senha externa (PIN)',NULL),(12048,'pt_BR:reports.members.ads.permanent_ads','AnÃºncios permanentes',NULL),(12049,'pt_BR:permission.operatorReports.showAccountInformation','Exibir informaÃ§Ãµes da conta',NULL),(12050,'pt_BR:global.cancel','Cancelar',NULL),(12051,'pt_BR:externalAccount.error.removing','A conta externa nÃ£o foi removida porque estÃ¡ sendo usada atualmente',NULL),(12052,'pt_BR:quickAccess.searchMembers','Procurar membros',NULL),(12053,'pt_BR:group.account.inserted','A conta de grupo foi inserida',NULL),(12054,'pt_BR:group.permissions','Editar as permissÃµes',NULL),(12055,'pt_BR:ad.externalPublication','PublicaÃ§Ã£o externa',NULL),(12056,'pt_BR:transactionFee.whichBroker.DESTINATION','Corretor do membro que estÃ¡ recebendo',NULL),(12057,'pt_BR:guaranteeType.feeType.VARIABLE_ACCORDING_TO_TIME','% anual',NULL),(12058,'pt_BR:settings.message.general.title','NotificaÃ§Ãµes gerais',NULL),(12059,'pt_BR:pos.unassigned','O POS foi desatribuÃ­do do membro',NULL),(12060,'pt_BR:customField.control.TEXTAREA','Ãrea de texto',NULL),(12061,'pt_BR:settings.mail.smtpServer','Nome do host',NULL),(12062,'pt_BR:home.admin.status.connectedMembers','NÃºmero de membros conectados',NULL),(12063,'pt_BR:payment.confirmation.cancel','VocÃª estÃ¡ prestes a cancelar este pagamento.\n\nPor favor, clique em OK para confirmar',NULL),(12064,'pt_BR:theme.select.message','Escolha o tema',NULL),(12065,'pt_BR:customizedFile.type.STYLE','Estilo',NULL),(12066,'pt_BR:permission.adminMemberBulkActions','AÃ§Ãµes em massa',NULL),(12067,'pt_BR:profile.action.memberPos','Gerenciar POS',NULL),(12068,'pt_BR:home.status.openInvoices','VocÃª tem {0} fatura(s) eletrÃ´nica(s) em aberto',NULL),(12069,'pt_BR:permission.adminMemberPos.view','Ver',NULL),(12070,'pt_BR:permission.brokerRemarks.manage','Gerenciar',NULL),(12071,'pt_BR:permission.adminAdminAccess.transactionPassword','Gerenciar senha de transaÃ§Ã£o',NULL),(12072,'pt_BR:group.settings.externalAdPublication.DISABLED','Desabilitada',NULL),(12073,'pt_BR:settings.message.scheduledPaymentsCancelledToOther','',NULL),(12074,'pt_BR:reports.stats.keydevelopments.throughTime.selectMonths','Selecione meses e anos',NULL),(12075,'pt_BR:transfer.aRate','Ãndice-A',NULL),(12076,'pt_BR:fieldMapping.title.modify','Modificar mapeamento de campo',NULL),(12077,'pt_BR:payment.confirmation.fees','As seguintes taxas serÃ£o aplicadas se vocÃª aceitar:',NULL),(12078,'pt_BR:brokerCommission.stopConfirmation','Interromper a cobranÃ§a dessa comissÃ£o de corretor significa ajustar seu valor para 0 e fechar todos os contratos relativos a ela. \nVocÃª tem certeza de que deseja fazer isso?',NULL),(12079,'pt_BR:settings.alert.givenVeryBadRefs','ReferÃªncias \"PÃ©ssimo\" dadas',NULL),(12080,'pt_BR:memberRecordType.title.insert','Novo tipo de registro de membro',NULL),(12081,'pt_BR:permission.systemCustomImages.manage','Gerenciar',NULL),(12082,'pt_BR:permission.systemSettings.manageLocal','Gerenciar configuraÃ§Ãµes de local',NULL),(12083,'pt_BR:menu.member.account.requestPayment','Solicitar pagamento',NULL),(12084,'pt_BR:changePin.title.of','Alterar a senha externa (PIN) de {0}',NULL),(12085,'pt_BR:guaranteeType.fee.paidBy','Pago por',NULL),(12086,'pt_BR:customField.action.newPossibleValue','Novo valor possÃ­vel',NULL),(12087,'pt_BR:transferType.invalidDestinationType','A moeda da conta de destino nÃ£o pode ser diferente da moeda da conta de origem',NULL),(12088,'pt_BR:customImage.uploaded','A imagem foi enviada, caso nÃ£o seja exibida recarregue a pÃ¡gina.',NULL),(12089,'pt_BR:permission.adminMemberAccess','Acesso',NULL),(12090,'pt_BR:theme.remove.error','O tema nÃ£o pÃ´de ser removido',NULL),(12091,'pt_BR:settings.log.transactionLevel','NÃ­vel do log de transaÃ§Ãµes',NULL),(12092,'pt_BR:customField.title.insert.operator','Novo campo customizado de operador',NULL),(12093,'pt_BR:global.ok','Ok',NULL),(12094,'pt_BR:account.dRate','Ãndice-D',NULL),(12095,'pt_BR:conversionSimulation.aRate','Ãndice-A',NULL),(12096,'pt_BR:category.status.ACTIVE','Ativa',NULL),(12097,'pt_BR:paymentObligation.error.certificationAmountExceeded','Valor excedido para a certificaÃ§Ã£o em {0}',NULL),(12098,'pt_BR:settings.log.webServiceLevel','NÃ­vel de log de serviÃ§os web',NULL),(12099,'pt_BR:changePin.title.my','Alterar a minha senha externa (PIN)',NULL),(12100,'pt_BR:global.no','NÃ£o',NULL),(12101,'pt_BR:group.nature','Tipo',NULL),(12102,'pt_BR:accountFee.manual','Manual',NULL),(12103,'pt_BR:adImport.successfulAds','AnÃºncios ok',NULL),(12104,'pt_BR:certification.title.new','Nova certificaÃ§Ã£o',NULL),(12105,'pt_BR:profile.action.changeBroker','Selecionar corretor',NULL),(12106,'pt_BR:payment.action.block','Bloquear',NULL),(12107,'pt_BR:settings.type.ACCESS','Config. de acesso',NULL),(12108,'pt_BR:creditLimit.modified','O limite de crÃ©dito foi modificado',NULL),(12109,'pt_BR:permission.memberReports.view','Ver',NULL),(12110,'pt_BR:defaultBrokerCommission.error.maxValueExceeded','{0}: o valor nÃ£o pode ser maior do que {1}',NULL),(12111,'pt_BR:paymentRequest.error.noChannels','NÃ£o existe nenhum canal para enviar uma solicitaÃ§Ã£o de pagamento.',NULL),(12112,'pt_BR:smsMailing.groups','Grupos',NULL),(12113,'pt_BR:reports.stats.keydevelopments.transactionAmount.highest.short','Mais alta',NULL),(12114,'pt_BR:changeGroup.operator.confirmPermanentRemove','Remover o operador permanentemente?',NULL),(12115,'pt_BR:member.brokerName','Nome do corretor',NULL),(12116,'pt_BR:document.removed','O documento foi removido',NULL),(12117,'pt_BR:session.loggedAs','UsuÃ¡rio: {0}',NULL),(12118,'pt_BR:sms.type.GENERAL.description','Geral',NULL),(12119,'pt_BR:customField.title.insert.memberRecord','Novo campo customizado para registro de membro {0}',NULL),(12120,'pt_BR:guarantee.createGuarantee','Criar garantia',NULL),(12121,'pt_BR:memberImport.confirm','Importar',NULL),(12122,'pt_BR:guaranteeType.feeType.PERCENTAGE','%',NULL),(12123,'pt_BR:invoice.status.CANCELLED','Cancelada',NULL),(12124,'pt_BR:externalAccountHistory.title','TransaÃ§Ãµes de {0}',NULL),(12125,'pt_BR:memberPos.numberOfCopies','NÃºmero de cÃ³pias',NULL),(12126,'pt_BR:accountHistory.title.of','TransaÃ§Ãµes de {0} em {1}',NULL),(12127,'pt_BR:ad.result.by','Publicado por {0}',NULL),(12128,'pt_BR:permission.brokerCards','CartÃµes',NULL),(12129,'pt_BR:customImage.system.incomplete','Pagamento externo nÃ£o conciliado',NULL),(12130,'pt_BR:payment.manualDate','Data de pagamento',NULL),(12131,'pt_BR:permission.adminMemberGroups','Grupos de membros',NULL),(12132,'pt_BR:notificationPreferences.acceptFreeMailing','Receber mensagens SMS de difusÃ£o gratuitas',NULL),(12133,'pt_BR:guarantee.paymentObligations','ObrigaÃ§Ãµes de pagamento',NULL),(12134,'pt_BR:reports.stats.taxes.paid.legend','Exibir estatÃ­sticas de taxas',NULL),(12135,'pt_BR:settings.message.adExpiration','Vencimento do anÃºncio',NULL),(12136,'pt_BR:reports.stats.keydevelopments.highestAmountPerTransaction','Maior valor por transaÃ§Ã£o',NULL),(12137,'pt_BR:messageCategory.removeConfirmation','Remover categoria de mensagem?',NULL),(12138,'pt_BR:permission.brokerPos.discard','Descartar',NULL),(12139,'pt_BR:posweb.client.cardSecurityCode','CÃ³digo de seguranÃ§a',NULL),(12140,'pt_BR:permission.brokerPos.view','Ver',NULL),(12141,'pt_BR:accountFeeLog.amount','Valor',NULL),(12142,'pt_BR:accountHistory.title.my','TransaÃ§Ãµes de {1}',NULL),(12143,'pt_BR:externalTransfer.description','DescriÃ§Ã£o',NULL),(12144,'pt_BR:reports.stats.activity.comparePeriods.grossProduct','Produto bruto por membro',NULL),(12145,'pt_BR:certification.issuerName','Nome do emissor',NULL),(12146,'pt_BR:externalAccountHistory.error.cannotDeleteExternalTransfer','Apenas pagamentos pendentes podem ser deletados',NULL),(12147,'pt_BR:pos.error.unvailable','Esse POS nÃ£o estÃ¡ disponÃ­vel para ser associado a um membro',NULL),(12148,'pt_BR:adminTasks.indexes.type.Member','Membros',NULL),(12149,'pt_BR:channel.internalName','Nome interno',NULL),(12150,'pt_BR:reports.stats.activity.whatToShow.DISTRIBUTION','DistribuiÃ§Ã£o',NULL),(12151,'pt_BR:permission.systemErrorLog.view','Ver',NULL),(12152,'pt_BR:externalTransferImport.period.end','AtÃ© o dia',NULL),(12153,'pt_BR:reports.stats.keydevelopments.throughTime.quarters','Ao longo dos trimestres',NULL),(12154,'pt_BR:alert.member.PIN_BLOCKED_BY_TRIES','Senha externa (PIN) bloqueado por tentativas invÃ¡lidas',NULL),(12155,'pt_BR:reports.stats.activity.developments.numberOfTransactions','NÃºmero de transaÃ§Ãµes',NULL),(12156,'pt_BR:reports.members.date.empty','Data e hora deve ser informada',NULL),(12157,'pt_BR:customField.possibleValue.field','Campo',NULL),(12158,'pt_BR:receiptPrinterSettings.title.new','Nova configuraÃ§Ã£o de impressora de recibos',NULL),(12159,'pt_BR:alert.system.rateInitializationStarted','Tarefa de inicializaÃ§Ã£o de indice na moeda {0} iniciado para os seguintes indices: \n{1}\nVeja a mensagem enviada para vocÃª.',NULL),(12160,'pt_BR:brokerCommissionContract.status.ACCEPTED','Aceito',NULL),(12161,'pt_BR:menu.member.personal.contacts','Contatos',NULL),(12162,'pt_BR:customField.possibleValue.enabled','Ativo',NULL),(12163,'pt_BR:settings.access.usernameGeneration','GeraÃ§Ã£o de nome de usuÃ¡rio',NULL),(12164,'pt_BR:group.settings.passwordLength','Tamanho da senha',NULL),(12165,'pt_BR:member.bulkActions.error.emptyQuery','VocÃª deve selecionar ao menos um filtro',NULL),(12166,'pt_BR:brokerCommission.type.commissionContract','Contrato de comissÃ£o',NULL),(12167,'pt_BR:reports.members.ads.expired_ads','AnÃºncios vencidos',NULL),(12168,'pt_BR:menu.admin.settings.channels','Channels',NULL),(12169,'pt_BR:permission.memberAds.publish','Publicar',NULL),(12170,'pt_BR:reports.stats.paymentfilter','Filtro de pagamentos',NULL),(12171,'pt_BR:externalAccount.title.modify','Modificar conta externa',NULL),(12172,'pt_BR:help.title.advertisements','AnÃºncios',NULL),(12173,'pt_BR:reports.stats.activity.keyParams','ParÃ¢metros-chave para a atividade',NULL),(12174,'pt_BR:member.lastLogin','Ãšltimo acesso',NULL),(12175,'pt_BR:transactionPassword.error.permissionDenied','VocÃª nÃ£o tem pemissÃµes suficientes para gerar a senha de transaÃ§Ã£o',NULL),(12176,'pt_BR:customField.member.access.BROKER','Corretor',NULL),(12177,'pt_BR:changeGroup.action.remove','Remover permanentemente',NULL),(12178,'pt_BR:mailPreferences.systemInvoices','Faturas de sistema',NULL),(12179,'pt_BR:guarantee.amountToCharge','A ser cobrado',NULL),(12180,'pt_BR:global.pagination.tooltip.next','PrÃ³xima pÃ¡gina',NULL),(12181,'pt_BR:memberRecord.search.keywords','Palavras-chave',NULL),(12182,'pt_BR:paymentObligation.expire','Vencimento',NULL),(12183,'pt_BR:reports.current.n_schedads','NÃºmero de anÃºncios agendados',NULL),(12184,'pt_BR:group.defaultAcceptFreeMailing','Aceitar SMS de difusÃ£o gratuitos por padrÃ£o',NULL),(12185,'pt_BR:profile.action.payment','Fazer pagamento',NULL),(12186,'pt_BR:ad.title','TÃ­tulo',NULL),(12187,'pt_BR:changePassword.newPasswordConfirmation','Confirme a nova senha',NULL),(12188,'pt_BR:currency.inserted','A moeda foi inserida',NULL),(12189,'pt_BR:loan.status.REPAID','Pago',NULL),(12190,'pt_BR:permission.brokerMemberPayments.blockScheduledAsMember','Bloquear pagamento agendado como membro',NULL),(12191,'pt_BR:settings.local.language.DUTCH','HolandÃªs',NULL),(12192,'pt_BR:pos.status.ACTIVE','Ativo',NULL),(12193,'pt_BR:member.broker','Corretor',NULL),(12194,'pt_BR:session.firstLogin','Primeiro acesso',NULL),(12195,'pt_BR:groupFilter.groups','Grupos',NULL),(12196,'pt_BR:alert.type.MEMBER','Membro',NULL),(12197,'pt_BR:mobile.payment.title.confirm','Confirmar Pagamento',NULL),(12198,'pt_BR:menu.member.broker.brokerCommissionContracts','Contratos de comissÃµes',NULL),(12199,'pt_BR:sms.type.INFO_TEXT_ERROR','Erro em mensagem informativa',NULL),(12200,'pt_BR:alert.system.rateInitializationFailed','Tarefa de inicializaÃ§Ã£o de indice na moeda {0} falhou na transaÃ§Ã£o nÂº {1} devido a uma exceÃ§Ã£o levantada.\nVeja os logs de erros para detalhes.',NULL),(12201,'pt_BR:settings.message.pendingPaymentCanceled','Pagamento pendente cancelado',NULL),(12202,'pt_BR:guaranteeType.removed','O tipo de garantia foi excluÃ­do',NULL),(12203,'pt_BR:operator.search.noResults','Nenhum operador encontrado',NULL),(12204,'pt_BR:group.settings.passwordTries.deactivationTime.number','Tempo de desativaÃ§Ã£o (qtde.) apÃ³s no. mÃ¡x. de tentativas de senha',NULL),(12205,'pt_BR:changeChannels.disableChannels','Desativar canais',NULL),(12206,'pt_BR:permission.module.type.MEMBER','PermissÃµes de membro de {0}',NULL),(12207,'pt_BR:receiptPrinterSettings.new','Criar novo',NULL),(12208,'pt_BR:paymentObligation.pack.selection','Para selecionar um conjunto de obrigaÃ§Ãµes de pagamento, vocÃª deve filtrar por moeda e comprador',NULL),(12209,'pt_BR:posweb.client.loginPassword','Senha',NULL),(12210,'pt_BR:reports.members.presentation','RelatÃ³rios de transaÃ§Ãµes de membro',NULL),(12211,'pt_BR:externalTransfer.status.COMPLETE_PENDING','Completo e pendente',NULL),(12212,'pt_BR:permission.systemLoanGroups.view','Ver',NULL),(12213,'pt_BR:transfersAwaitingAuthorization.onlyWithoutBroker','Somente se corretores nÃ£o puderem autorizar',NULL),(12214,'pt_BR:menu.admin.alerts.errorLogHistory','HistÃ³rico de erros',NULL),(12215,'pt_BR:reports.stats.keydevelopments.numberOfAds.active.short','Ativo',NULL),(12216,'pt_BR:customField.member.visibilityAccess','Exibir no perfil para',NULL),(12217,'pt_BR:smsMailing.title.send','Enviar nova mensagem SMS de difusÃ£o',NULL),(12218,'pt_BR:loanPayment.title.search','Procurar pagamentos de emprÃ©stimo',NULL),(12219,'pt_BR:group.settings.maxAdPublicationTime.number','Tempo mÃ¡x. de publicaÃ§Ã£o do anÃºncio (qtde.)',NULL),(12220,'pt_BR:invoice.status.EXPIRED','Vencida',NULL),(12221,'pt_BR:reports.stats.taxes.totalSum','Soma total',NULL),(12222,'pt_BR:permission.adminMemberInvoices.cancelAsMember','Cancelar fatura eletrÃ´nica como membro',NULL),(12223,'pt_BR:customField.inserted','O campo customizado foi inserido',NULL),(12224,'pt_BR:transferAuthorization.action.DENY','Negado',NULL),(12225,'pt_BR:transfer.description','DescriÃ§Ã£o',NULL),(12226,'pt_BR:changePin.error.sameAsLoginOrTransactionPassword','A senha externa (PIN) nÃ£o pode ser igual Ã s senhas de login ou transaÃ§Ã£o',NULL),(12227,'pt_BR:settings.message.remark','ComentÃ¡rio',NULL),(12228,'pt_BR:settings.message.transactionFeedbackRequest','RequisiÃ§Ã£o para qualificar de transaÃ§Ã£o',NULL),(12229,'pt_BR:receiptPrinterSettings.localPrinter','Imprimir neste computador com',NULL),(12230,'pt_BR:createMember.public.awaitingPassword','Obrigado por cadastrar-se!\n\nVocÃª receberÃ¡ sua senha por e-mail em alguns instantes',NULL),(12231,'pt_BR:changeGroup.error.remove','Este usuÃ¡rio nÃ£o pode ser removido permanentemente, pois jÃ¡ esteve ativo no sistema.\nVocÃª pode movÃª-lo para um grupo removido.',NULL),(12232,'pt_BR:posLog.status','Estado',NULL),(12233,'pt_BR:transfer.from','De',NULL),(12234,'pt_BR:account.hideWhenNoCreditLimit','Ocultar quando nÃ£o hÃ¡ limite de crÃ©dito',NULL),(12235,'pt_BR:settings.local.adResultDisplay','Exibir resultado da lista de anÃºncios',NULL),(12236,'pt_BR:profile.action.manageReferences','Gerenciar referÃªncias',NULL),(12237,'pt_BR:group.account.allAccountsOnGroup','Todas as contas possÃ­veis jÃ¡ estÃ£o associadas ao grupo',NULL),(12238,'pt_BR:transactionFee.modified','A taxa de transaÃ§Ã£o foi modificada',NULL),(12239,'pt_BR:memberRecord.search.fromDate','Data de criaÃ§Ã£o',NULL),(12240,'pt_BR:sms.error.type.NO_PHONE','NÃ£o foi definido o telefone celular',NULL),(12241,'pt_BR:reports.stats.general.appliedFilters','Filtros usados',NULL),(12242,'pt_BR:group.initialGroupShow','Mostrar como',NULL),(12243,'pt_BR:customImage.system.mobileLogo','Logotipo de acesso mÃ³vel',NULL),(12244,'pt_BR:disconnect.disconnected','O usuÃ¡rio foi desconectado',NULL),(12245,'pt_BR:theme.stylesToExport','Estilos exportados',NULL),(12246,'pt_BR:reports.stats.activity.histogram.logins.yAxis','NÃºmero de membros',NULL),(12247,'pt_BR:posweb.searchTransactions.print','Clique aqui ou aperte F4 para imprimir',NULL),(12248,'pt_BR:global.datePattern.day','dd',NULL),(12249,'pt_BR:profile.action.simulateConversion','Simular conversÃ£o',NULL),(12250,'pt_BR:alert.search.date.end','AtÃ© a data',NULL),(12251,'pt_BR:smsLog.mailingType','Tipo de difusÃ£o',NULL),(12252,'pt_BR:home.status.newPayments','VocÃª recebeu {0} novos pagamentos desde o Ãºltimo login',NULL),(12253,'pt_BR:customField.operator.visibility','Visibilidade para o operador',NULL),(12254,'pt_BR:menu.admin.usersGroups','UsuÃ¡rios e grupos',NULL),(12255,'pt_BR:permission.adminMemberAccounts.creditLimit','Ajustar limite de crÃ©dito',NULL),(12256,'pt_BR:reports.stats.activity.throughTime.loginTimes.yAxis','Acessos / membro',NULL),(12257,'pt_BR:settings.message.adminMemberAlert','Alertas de membros',NULL),(12258,'pt_BR:menu.admin.ads.importAds','Importar anÃºncios',NULL),(12259,'pt_BR:defaultBrokerCommission.status.ACTIVE','Ativa',NULL),(12260,'pt_BR:externalTransfer.amount','Valor',NULL),(12261,'pt_BR:group.selectInitialGroup','Selecionar ao registrar um membro',NULL),(12262,'pt_BR:message.type.CERTIFICATION','CertificaÃ§Ãµes',NULL),(12263,'pt_BR:transactionFee.maxAmount','Valor mÃ¡ximo',NULL),(12264,'pt_BR:payment.recipientName','Nome completo (destinatÃ¡rio)',NULL),(12265,'pt_BR:customField.title.order.memberRecord','Ajustar ordem de campo customizado para registro de membro {0}',NULL),(12266,'pt_BR:global.search.all','Todas',NULL),(12267,'pt_BR:menu.operator.member.ads','AnÃºncios',NULL),(12268,'pt_BR:loanPayment.summary.count','Qtde.',NULL),(12269,'pt_BR:menu.admin.messages.smsMailings','SMS de difusÃ£o',NULL),(12270,'pt_BR:profile.action.paymentAsMemberToMember','Pagamento de membro para membro',NULL),(12271,'pt_BR:group.customizedFiles.noResults','O grupo nÃ£o tem arquivos customizados',NULL),(12272,'pt_BR:smsMailing.mailingType.PAID_FROM_BROKER','DifusÃ£o paga de corretor',NULL),(12273,'pt_BR:global.weekDay.THURSDAY','Quinta-feira',NULL),(12274,'pt_BR:alert.member.pinBlockedByTries','A senha externa (PIN) foi bloqueada por exceder {0} tentativas no canal {1}, no membro {2}',NULL),(12275,'pt_BR:memberImport.status.INVALID_RECORD_FIELD','Valor invÃ¡lido para {0}: {1}',NULL),(12276,'pt_BR:permission.brokerCards.cancel','Cancelar',NULL),(12277,'pt_BR:customImage.title.system','Imagens de sistema',NULL),(12278,'pt_BR:settings.log.webServiceLevel.DETAILED','Rastreamento detalhado (inclusive parÃ¢metros)',NULL),(12279,'pt_BR:brokerCommission.unsuspendConfirmation','Deseja liberar essa comissÃ£o que estava suspensa?',NULL),(12280,'pt_BR:global.totalAmount','Valor total',NULL),(12281,'pt_BR:reports.stats.activity.throughTime.loginTimes.col1','Acessos / membro',NULL),(12282,'pt_BR:fieldMapping.field.MEMBER_ID','Identificador',NULL),(12283,'pt_BR:accountFeeLog.skippedMembers','Membros nÃ£o cobrados',NULL),(12284,'pt_BR:group.description','DescriÃ§Ã£o',NULL),(12285,'pt_BR:card.expirationPeriod.to','AtÃ©',NULL),(12286,'pt_BR:member.action.create.selectGroup','Selecione o grupo de membro',NULL),(12287,'pt_BR:pos.status.PENDING','Pendente',NULL),(12288,'pt_BR:settings.log.scheduledTaskLevel','NÃ­vel do log de tarefas agendadas',NULL),(12289,'pt_BR:profile.action.brokerSimulateConversion','Simular conversÃ£o para membros',NULL),(12290,'pt_BR:profile.userOnline','Conectado',NULL),(12291,'pt_BR:member.search.date','AtivaÃ§Ã£o',NULL),(12292,'pt_BR:guaranteeType.error.issueFeeTransferType','O tipo de pagamento para a taxa de emissÃ£o Ã© obrigatÃ³rio',NULL),(12293,'pt_BR:paymentObligation.expirationDate','Data de vencimento',NULL),(12294,'pt_BR:loan.repayment.interest','Juros',NULL),(12295,'pt_BR:permission.adminMemberAccess.changeChannelsAccess','Alterar acesso a canais',NULL),(12296,'pt_BR:message.action.RESTORE','Restaurar',NULL),(12297,'pt_BR:certification.status.SUSPENDED','Suspensa',NULL),(12298,'pt_BR:settings.local.maxThumbnailSize','Tamanho mÃ¡x. de miniatura das imagens',NULL),(12299,'pt_BR:permission.systemMemberPermissions.view','Ver',NULL),(12300,'pt_BR:ticket.date','Data',NULL),(12301,'pt_BR:settings.neverAlertMessage','0 nunca avisa',NULL),(12302,'pt_BR:changePin.error.alreadyUsed','A senha externa (PIN) informada jÃ¡ foi utilizada no passado',NULL),(12303,'pt_BR:member.bulkActions.changeBroker','Alterar corretor',NULL),(12304,'pt_BR:group.title.list','Grupos de permissÃ£o',NULL),(12305,'pt_BR:payment.status','Estado',NULL),(12306,'pt_BR:settings.log.webServiceLevel.ERRORS','Apenas erros',NULL),(12307,'pt_BR:message.action.new','Nova mensagem',NULL),(12308,'pt_BR:adCategory.alterOrder','Alterar ordem',NULL),(12309,'pt_BR:externalTransferImport.removed','A importaÃ§Ã£o de transaÃ§Ãµes foi removida',NULL),(12310,'pt_BR:permission.operatorMessages.view','Ver',NULL),(12311,'pt_BR:settings.log.accountFeeFile','EnderÃ§o/nome do arquivo de log de taxas de conta',NULL),(12312,'pt_BR:loan.grant.setDate','Conceder no passado',NULL),(12313,'pt_BR:member.bulkActions.changeChannels.confirmation','VocÃª tem certeza que quer mudar os canais de acesso para todos os membros incluidos no resultado deste filtro?',NULL),(12314,'pt_BR:memberPos.changePin.newPin2','Confirme o PIN',NULL),(12315,'pt_BR:memberPos.changePin.newPin1','Digite o PIN',NULL),(12316,'pt_BR:currency.title.insert','Nova moeda',NULL),(12317,'pt_BR:card.search.noResults','Nenhum cartÃ£o foi encontrado',NULL),(12318,'pt_BR:settings.local.showCountersInAdCategories','Exibir contadores nas categorias de anÃºncio',NULL),(12319,'pt_BR:certification.delete','Excluir',NULL),(12320,'pt_BR:global.weekDay.FRIDAY','Sexta-feira',NULL),(12321,'pt_BR:payment.actions','AÃ§Ãµes',NULL),(12322,'pt_BR:permission.systemDocuments.view','Ver',NULL),(12323,'pt_BR:loan.type.WITH_INTEREST','Com taxas',NULL),(12324,'pt_BR:global.amount.type.FIXED','Fixo',NULL),(12325,'pt_BR:global.weekDay.SATURDAY','SÃ¡bado',NULL),(12326,'pt_BR:payment.error.maxAmountOnDayExceeded','VocÃª jÃ¡ excedeu o valor mÃ¡ximo para esse tipo de pagamento hoje ({0})',NULL),(12327,'pt_BR:webshop.confirm.transactionPassword','Para confirmar este pagament, por favor, informe sua senha de transaÃ§Ã£o',NULL),(12328,'pt_BR:defaultBrokerCommission.title','ConfiguraÃ§Ãµes de comissÃ£o de {0}',NULL),(12329,'pt_BR:theme.theme','Tema',NULL),(12330,'pt_BR:channel.webServiceUrl','URL para o serviÃ§o web',NULL),(12331,'pt_BR:customField.member.access.NONE','Nenhum',NULL),(12332,'pt_BR:loan.grant.error.upperCreditLimit','O emprÃ©stimo nÃ£o pÃ´de ser concedido porque ele poderia deixar a conta do membro com saldo maior do que o permitido pelo seu limite de crÃ©dito superior',NULL),(12333,'pt_BR:theme.selected','O tema foi selecionado.\nVocÃª pode ter que limpar o cache de seu navegador e recarregar a pÃ¡gina para poder visualizar as modificaÃ§Ãµes',NULL),(12334,'pt_BR:group.customizedFiles.removeConfirmation','Deixar de customizar esse arquivo?',NULL),(12335,'pt_BR:group.settings.pinLength','Tamanho da senha externa',NULL),(12336,'pt_BR:registrationAgreement.new','Novo termo de adesÃ£o',NULL),(12337,'pt_BR:transferType.requiresFeedback','Requer qualificaÃ§Ã£o de transaÃ§Ãµes',NULL),(12338,'pt_BR:conversionSimulation.result.graph.title','Curva de tempo do valor da taxa',NULL),(12339,'pt_BR:infoText.errorRemoving','Esta mensagem informativa nÃ£o pode ser removida.',NULL),(12340,'pt_BR:reports.current.invoices.MEMBER.count','NÃºmero de faturas eletrÃ´nicas de membro',NULL),(12341,'pt_BR:card.activateWarning.confirmation','AtenÃ§Ã£o: qualquer outro cartÃ£o ativo serÃ¡ cancelado.',NULL),(12342,'pt_BR:settings.message.externalChannelPaymentRequestExpiredPayer','SolicitaÃ§Ã£o de pagamento pelo canal externo expirada pelo pagador',NULL),(12343,'pt_BR:transactionFee.fMinimal','valor mÃ­nimo',NULL),(12344,'pt_BR:global.loading','Carregando. Por favor, aguarde...',NULL),(12345,'pt_BR:externalTransferImport.noFile.message','Selecione o arquivo para importaÃ§Ã£o',NULL),(12346,'pt_BR:guaranteeType.transferType.select','Selecione o tipo de pagamento',NULL),(12347,'pt_BR:profile.member.addPicture','Adicionar imagem',NULL),(12348,'pt_BR:permission.operatorContacts','Lista de contatos',NULL),(12349,'pt_BR:member.bulkActions.generateCard.confirmation','VocÃª tem certeza que deseja gerar cartÃµes para todos os membros que satisfazem ao filtro?',NULL),(12350,'pt_BR:menu.admin.accounts.currencies','Gerenciar moedas',NULL),(12351,'pt_BR:permission.systemThemes.remove','Remover',NULL),(12352,'pt_BR:externalAccount.removed','A conta externa foi removida',NULL),(12353,'pt_BR:settings.access.usernameGeneration.RANDOM','NÃºmero aleatÃ³rio gerado',NULL),(12354,'pt_BR:customField.validation.validatorClass','Classe validadora',NULL),(12355,'pt_BR:loan.status.PENDING_AUTHORIZATION','Pendente de autorizaÃ§Ã£o',NULL),(12356,'pt_BR:ad.search.withImagesOnly','Somente com imagens',NULL),(12357,'pt_BR:permission.systemAdCategories','Categorias de anÃºncios',NULL),(12358,'pt_BR:permission.memberReports','RelatÃ³rios de membro',NULL),(12359,'pt_BR:transferType.error.minMaxPerDayAmount','',NULL),(12360,'pt_BR:guaranteeType.authorizedBy.BOTH','Ambos',NULL),(12361,'pt_BR:guarantee.inserted','A garantia foi criada com sucesso',NULL),(12362,'pt_BR:group.action.personalMessage','Enviar mensagem pessoal para membros',NULL),(12363,'pt_BR:reports.stats.activity.comparePeriods.grossProduct.title','Produto bruto por membro (comparando dois perÃ­odos)',NULL),(12364,'pt_BR:message.trashPurgeNotification','Mensagens deixadas na lixeira por {0} {1} serÃ£o removidas',NULL),(12365,'pt_BR:global.timePeriod.MINUTES','Minuto(s)',NULL),(12366,'pt_BR:reports.stats.transferTypeFilter','Filtro de tipos de transaÃ§Ãµes',NULL),(12367,'pt_BR:fileMapping.inserted','Mapeamento de arquivo inserido',NULL),(12368,'pt_BR:global.system','Sistema',NULL),(12369,'pt_BR:alert.system.ACCOUNT_FEE_CANCELLED','Taxa de conta cancelada',NULL),(12370,'pt_BR:permission.systemAdminGroups','Grupos de administradores',NULL),(12371,'pt_BR:accountType.action.new','Inserir nova conta',NULL),(12372,'pt_BR:channel.supportsPaymentRequest','Permite requisiÃ§Ã£o de pagamento',NULL),(12373,'pt_BR:document.binaryFile','Arquivo',NULL),(12374,'pt_BR:receipt.posweb.transactions.transfers','Pagamentos processados',NULL),(12375,'pt_BR:customImage.system.message_unread','Ãcone de mensagem nÃ£o lida',NULL),(12376,'pt_BR:currency.modified','A moeda foi modificada',NULL),(12377,'pt_BR:customField.confirmUnhide','VocÃª desmarcou a opÃ§Ã£o de ocultaÃ§Ã£o para este campo.\nSalvar este campo significa que para todos os membros\na informaÃ§Ã£o existente neste campo serÃ¡ visivel.\n\nVocÃª tem certeza?',NULL),(12378,'pt_BR:channel.credentials.DEFAULT','PadrÃ£o (senha de login e depois senha de transaÃ§Ã£o)',NULL),(12379,'pt_BR:menu.member.preferences.notifications','NotificaÃ§Ãµes',NULL),(12380,'pt_BR:reports.stats.activity.comparePeriods.numberTransactions.row1.short','membros que transacionam',NULL),(12381,'pt_BR:transferType.transactionHierarchyVisibility.BROKER','Para administradores e corretores',NULL),(12382,'pt_BR:payment.confirmation.doExternal','Por favor, verifique os dados acima e clique em confirmar para fazer o pagamento',NULL),(12383,'pt_BR:group.settings.maxAdPublicationTime','Tempo mÃ¡x. de publicaÃ§Ã£o do anÃºncio',NULL),(12384,'pt_BR:transactionFee.deductAmount.true','Deduzir do valor total',NULL),(12385,'pt_BR:smsMailing.mailingType.INDIVIDUAL','Mensagem individual',NULL),(12386,'pt_BR:menu.member.broker.listMembers','Membros',NULL),(12387,'pt_BR:customField.memberRecord.brokerAccess.NONE','Nenhum',NULL),(12388,'pt_BR:guaranteeType.action.new','Novo tipo de garantia',NULL),(12389,'pt_BR:reports.members_reports.account_type','Tipo de conta',NULL),(12390,'pt_BR:brokering.title.list.of','Membros registrados de {0}',NULL),(12391,'pt_BR:settings.log.webServiceLevel.SIMPLE','Rastreamento simples (sem parÃ¢metros)',NULL),(12392,'pt_BR:reports.stats.keydevelopments.periodType.COMPARED_PERIODS','ComparaÃ§Ã£o entre perÃ­odos',NULL),(12393,'pt_BR:transfer.chargebackOf','Estorno de',NULL),(12394,'pt_BR:pos.title','POS',NULL),(12395,'pt_BR:loan.title.loanGroup.members','Membros do grupo de emprÃ©stimos',NULL),(12396,'pt_BR:permission.systemMessageCategories.view','Ver',NULL),(12397,'pt_BR:error.email','Houve um erro durante o envio do e-mail',NULL),(12398,'pt_BR:menu.admin.usersGroups.importMembers','Importar membros',NULL),(12399,'pt_BR:transactionFee.aFIsZero','0% em Ã­ndice-A = ...',NULL),(12400,'pt_BR:receiptPrinterSettings.paymentAdditionalMessage','Mensagem adicional em recibos de pagamento',NULL),(12401,'pt_BR:loan.queryStatus.OPEN','Aberto',NULL),(12402,'pt_BR:reports.current.system_account','Contas de sistema',NULL),(12403,'pt_BR:group.settings.channels','Acesso aos canais',NULL),(12404,'pt_BR:adImport.lineNumber','NÂº linha',NULL),(12405,'pt_BR:profile.action.invoiceAsMemberToSystem','Fatura de membro para sistema',NULL),(12406,'pt_BR:adImport.status.MISSING_DESCRIPTION','A descriÃ§Ã£o estÃ¡ faltando',NULL),(12407,'pt_BR:group.active','Ativar grupo',NULL),(12408,'pt_BR:customField.possibleValue.removed','O valor foi removido',NULL),(12409,'pt_BR:smsLog.count','SMS enviados',NULL),(12410,'pt_BR:brokering.title.list.my','Membros registrados',NULL),(12411,'pt_BR:permission.operatorPayments.blockScheduled','Bloquear pagamento agendado',NULL),(12412,'pt_BR:externalTransferType.action.DISCARD_LOAN','Descartar emprÃ©stimo',NULL),(12413,'pt_BR:settings.type.MAIL','Config. de e-mail',NULL),(12414,'pt_BR:customField.modified','O campo customizado foi modificado',NULL),(12415,'pt_BR:createMember.public.validated','Obrigado por cadastrar-se.\n\nVocÃª pode acessar o sistema com o login {0}',NULL),(12416,'pt_BR:card.title.create','Criar cartÃ£o para {0}',NULL),(12417,'pt_BR:receipt.transfer.to','Para: {0}',NULL),(12418,'pt_BR:virtualKeyboard.capsLock','Caixa alta',NULL),(12419,'pt_BR:accountFeeLog.finishDate','ConcluÃ­do em',NULL),(12420,'pt_BR:settings.access.externalPaymentPassword.LOGIN_PASSWORD','Senha de acesso',NULL),(12421,'pt_BR:alert.search.date.begin','A partir da data',NULL),(12422,'pt_BR:createMember.created.pending','O membro foi criado, mas  o e-mail deve ser verificado para completar a ativaÃ§Ã£o',NULL),(12423,'pt_BR:mailPreferences.applicationErrors','Erros de aplicaÃ§Ã£o',NULL),(12424,'pt_BR:customizedFile.title.search.css','Folhas de estilo customizadas',NULL),(12425,'pt_BR:permission.adminMemberCards.view','Ver',NULL),(12426,'pt_BR:reports.stats.taxes.maxMember','Quantidade mÃ¡xima para um membro',NULL),(12427,'pt_BR:changeGroup.member.permanentlyRemoved','VocÃª nÃ£o pode alterar o grupo porque o membro foi permanentemente removido',NULL),(12428,'pt_BR:payment.status.BLOCKED','Bloqueado',NULL),(12429,'pt_BR:customField.member.access.MEMBER_NOT_OPERATOR','Membro, nÃ£o operador',NULL),(12430,'pt_BR:customField.operator.visibility.EDITABLE','VisÃ­vel e editÃ¡vel',NULL),(12431,'pt_BR:group.settings.defaultAdPublicationTime.number','Tempo de publicaÃ§Ã£o padrÃ£o do anÃºncio (qtde.)',NULL),(12432,'pt_BR:permission.adminMemberGroups.view','Ver',NULL),(12433,'pt_BR:createMember.passwordConfirmation','Confirme a senha',NULL),(12434,'pt_BR:paymentRequest.title.new.singleChannel','Solicitar pagamento por {0}',NULL),(12435,'pt_BR:customField.title.list.loan','Campos customizados de emprÃ©stimo',NULL),(12436,'pt_BR:accountType.title.modify.system','Modificar tipo de conta de sistema',NULL),(12437,'pt_BR:paymentObligation.status.PUBLISHED','Publicada',NULL),(12438,'pt_BR:global.month.AUGUST','Agosto',NULL),(12439,'pt_BR:permission.adminMemberMessages','Mensagens',NULL),(12440,'pt_BR:createMember.initialGroup.preface.byBroker','Por favor, selecione o grupo para o novo membro',NULL),(12441,'pt_BR:card.action.activate','Ativar',NULL),(12442,'pt_BR:image.remove','Remover',NULL),(12443,'pt_BR:permission.operatorLoans','EmprÃ©stimos',NULL),(12444,'pt_BR:invoice.performedBy','Efetuado por',NULL),(12445,'pt_BR:groupFilter.customizedFiles.noResults','O filtro de grupos nÃ£o tem arquivos customizados',NULL),(12446,'pt_BR:customImage.system.edit','Ãcone editar',NULL),(12447,'pt_BR:pos.status.ASSIGNED','AtribuÃ­do',NULL),(12448,'pt_BR:certification.buyer','Comprador',NULL),(12449,'pt_BR:sms.type.REQUEST_PAYMENT_ERROR','Erro na solicitaÃ§Ã£o de pagamento',NULL),(12450,'pt_BR:payment.error.upperCreditLimit','O pagamento nÃ£o pÃ´de ser realizado. Para mais detalhes contate a administraÃ§Ã£o.',NULL),(12451,'pt_BR:certification.cancel','Cancelar',NULL),(12452,'pt_BR:accountFeeLog.totalAmount','Valor total',NULL),(12453,'pt_BR:profile.action.message','Enviar mensagem',NULL),(12454,'pt_BR:settings.message.transactionFeedbackReply','RÃ©plica de qualificaÃ§Ã£o de transaÃ§Ã£o',NULL),(12455,'pt_BR:menu.member.account.loans','EmprÃ©stimos',NULL),(12456,'pt_BR:reports.simulations.dRateConfigSimulation.endD','Terminar em D =',NULL),(12457,'pt_BR:reports.stats.keydevelopments.numberOfAds.expired.short','Vencido',NULL),(12458,'pt_BR:reports.stats.keydevelopments.throughTime.months','Ao longo dos meses',NULL),(12459,'pt_BR:settings.type.LOCAL','Config. locais',NULL),(12460,'pt_BR:customField.payment.access.DESTINATION_MEMBER','Somente para o membro de destino',NULL),(12461,'pt_BR:reports.stats.keydevelopments.periodType.THROUGH_TIME','Ao longo do tempo',NULL),(12462,'pt_BR:loanGroup.title.view','Detalhes do grupo de emprÃ©stimos',NULL),(12463,'pt_BR:icon.title.notConciliated','NÃ£o conciliado',NULL),(12464,'pt_BR:message.title.send','Enviar mensagem',NULL),(12465,'pt_BR:menu.admin.usersGroups.groups','Grupos de permissÃ£o',NULL),(12466,'pt_BR:customField.title.modify.ad','Modificar campo customizado de anÃºncio',NULL),(12467,'pt_BR:certification.status.ACTIVE','Atica',NULL),(12468,'pt_BR:global.selectAll','Selecionar tudo',NULL),(12469,'pt_BR:conversionSimulation.result.graph.xAxis','Data',NULL),(12470,'pt_BR:receipt.posweb.transactions.transfer','{0} {1} {2} {3}',NULL),(12471,'pt_BR:group.settings.showPosWebPaymentDescription','Exibir o campo de descriÃ§Ã£o de pagamentos via PosWeb',NULL),(12472,'pt_BR:notificationPreferences.title.name','PreferÃªncias de notificaÃ§Ã£o de {0}',NULL),(12473,'pt_BR:settings.log.webServiceFile','EndereÃ§o/nome do arquivo de log de serviÃ§os web',NULL),(12474,'pt_BR:customField.ad.visibility.BROKER','Corretores e administradores',NULL),(12475,'pt_BR:accountFeeLog.neverRan','Nunca executada',NULL),(12476,'pt_BR:accountHistory.credits.amount','Total de crÃ©ditos',NULL),(12477,'pt_BR:changeGroup.member.changed.mailError','O grupo do membro foi alterado, porÃ©m, o e-mail de ativaÃ§Ã£o nÃ£o pÃ´de ser enviado',NULL),(12478,'pt_BR:posweb.title.login','Acesso ao POS-Web',NULL),(12479,'pt_BR:fileMapping.noFileMapping.message','NÃ£o existe ainda o mapeamento de arquivo para esta conta.\nClique aqui para configurÃ¡-lo',NULL),(12480,'pt_BR:certification.title.modify','Modificar certificaÃ§Ã£o',NULL),(12481,'pt_BR:global.search.ADVANCED','AvanÃ§ada',NULL),(12482,'pt_BR:settings.access.modified','As configuraÃ§Ãµes de acesso foram modificadas',NULL),(12483,'pt_BR:admin.action.create','Criar administrador',NULL),(12484,'pt_BR:settings.local.emailUnique','E-mail deve ser Ãºnico',NULL),(12485,'pt_BR:menu.admin.accounts.authorizedLoans','EmprÃ©stimos autorizados',NULL),(12486,'pt_BR:customField.title.modify.loan','Modificar campo customizado de emprÃ©stimo',NULL),(12487,'pt_BR:invoice.invalid.paymentAmount','O valor total da fatura deve ser igual ao valor da soma das parcelas',NULL),(12488,'pt_BR:invoice.cancelConfirmationMessage','Cancelar fatura eletrÃ´nica para {0} de {1}\n\nPor favor, clique em OK para confirmar',NULL),(12489,'pt_BR:permission.operatorAccount.scheduledInformation','Ver pagamentos agendados',NULL),(12490,'pt_BR:scheduledPayment.title.print','InformaÃ§Ãµes do pagamento agendado',NULL),(12491,'pt_BR:paymentObligation.status.REJECTED','Rejeitada',NULL),(12492,'pt_BR:customField.possibleValue.removeConfirmation','Remover esse valor?',NULL),(12493,'pt_BR:permission.adminMembers.changeProfile','Alterar perfil',NULL),(12494,'pt_BR:menu.member.account.selfPayment','TransferÃªncia entre contas prÃ³prias',NULL),(12495,'pt_BR:document.description','DescriÃ§Ã£o',NULL),(12496,'pt_BR:permission.systemRegistrationAgreements.view','Ver',NULL),(12497,'pt_BR:alert.member.INITIAL_CREDIT_FAILED','Erro na concessÃ£o de crÃ©dito inicial',NULL),(12498,'pt_BR:login.error.alreadyConnected','VocÃª jÃ¡ estÃ¡ conectado',NULL),(12499,'pt_BR:changePin.pinLengthRange','Escolha uma senha externa (PIN) com tamanho entre {0} e {1} caracteres',NULL),(12500,'pt_BR:settings.message.transactionFeedbackAdminComments','ComentÃ¡rios da administraÃ§Ã£o sobre uma qualificaÃ§Ã£o de transaÃ§Ã£o',NULL),(12501,'pt_BR:login.form.title','Acesso',NULL),(12502,'pt_BR:reports.stats.finances.income','Entrada',NULL),(12503,'pt_BR:loan.repayment.transactionPassword.repayOnly','Para pagar este emprÃ©stimo vocÃª deve fornecer sua senha de transaÃ§Ã£o',NULL),(12504,'pt_BR:permission.brokerAccounts.information','Ver informaÃ§Ãµes de conta',NULL),(12505,'pt_BR:transactionPassword.status.user','Estado',NULL),(12506,'pt_BR:card.title.print','Resultado da pesquisa de cartÃµes',NULL),(12507,'pt_BR:permission.adminMemberPayments.paymentAsMemberToSystem','Pagamentos de membros para sistema',NULL),(12508,'pt_BR:receipt.transfer.installment','{0}  {1}  {2}',NULL),(12509,'pt_BR:permission.adminMemberMessages.view','Ver',NULL),(12510,'pt_BR:reports.stats.general.histogram','Histograma',NULL),(12511,'pt_BR:permission.adminMemberBrokerings','Corretagens',NULL),(12512,'pt_BR:member.groupFilter','Comunidade',NULL),(12513,'pt_BR:ad.title.of','AnÃºncios de {0}',NULL),(12514,'pt_BR:global.tooltip.remove','Remover',NULL),(12515,'pt_BR:guarantee.name','Nome',NULL),(12516,'pt_BR:reports.stats.activity.histogram.numberTransactions.yAxis','NÃºmero de membros',NULL),(12517,'pt_BR:settings.message.paymentObligationRegistered','ObrigaÃ§Ã£o de pagamento cadastrada',NULL),(12518,'pt_BR:pos.actions.discard','Descartar',NULL),(12519,'pt_BR:loan.status.UNRECOVERABLE','IrrecuperÃ¡vel',NULL),(12520,'pt_BR:permission.brokerMessages','Mensagens pessoais',NULL),(12521,'pt_BR:permission.basic.inviteMember','Convidar membro',NULL),(12522,'pt_BR:guarantee.guaranteeType','Tipo de garantia',NULL),(12523,'pt_BR:fileMapping.decimalPlaces','NÃºmero de casas decimais',NULL),(12524,'pt_BR:loanPayment.title.print','Resultado dos pagamentos de emprÃ©stimo',NULL),(12525,'pt_BR:externalAccount.modified','A conta externa foi modificada',NULL),(12526,'pt_BR:reports.stats.throughTheTime','Ao longo do tempo',NULL),(12527,'pt_BR:fieldMapping.action.new','Inserir novo mapeamento de campo',NULL),(12528,'pt_BR:group.rootUrl','URL raiz da aplicaÃ§Ã£o',NULL),(12529,'pt_BR:brokerCommissionContract.member','Membro',NULL),(12530,'pt_BR:reports.stats.activity.singlePeriod.percentageNoTrade.title','Percentual de membros que nÃ£o transacionam (perÃ­odo simples)',NULL),(12531,'pt_BR:card.card','CartÃ£o',NULL),(12532,'pt_BR:reports.stats.activity.singlePeriod.numberTransactions.yAxis','no. de transaÃ§Ãµes',NULL),(12533,'pt_BR:menu.member.account.accountInformation','InformaÃ§Ãµes de conta',NULL),(12534,'pt_BR:ad.title.my','Meus anÃºncios',NULL),(12535,'pt_BR:customImage.title.new.style','Nova imagem de folha de estilo',NULL),(12536,'pt_BR:settings.local.containerUrl','URL da pÃ¡gina container global',NULL),(12537,'pt_BR:memberImport.membersWithErrors','Membros com erro',NULL),(12538,'pt_BR:paymentObligation.seller','Comprador',NULL),(12539,'pt_BR:payment.selectTransferType','Selecione o tipo de transaÃ§Ã£o',NULL),(12540,'pt_BR:card.update.confirmation','ConfirmaÃ§Ã£o',NULL),(12541,'pt_BR:global.total','Total',NULL),(12542,'pt_BR:conversionSimulation.aRate.present','Ãndice-A atual',NULL),(12543,'pt_BR:permission.adminMemberLoanGroups.manage','Gerenciar',NULL),(12544,'pt_BR:selectChannels.selected','Acesso aos canais modificado',NULL),(12545,'pt_BR:creditLimit.title','Limite de crÃ©dito',NULL),(12546,'pt_BR:translationMessage.removed','A chave de traduÃ§Ã£o foi removida',NULL),(12547,'pt_BR:sms.type.INFO_TEXT_ERROR.description','Erro em mensagem informativa',NULL),(12548,'pt_BR:accountFee.transferType','Tipo de transaÃ§Ã£o gerado',NULL),(12549,'pt_BR:menu.member.operators.customFields','Campos customizados',NULL),(12550,'pt_BR:mobile.payment.error.invalid','Pagamento invÃ¡lido',NULL),(12551,'pt_BR:invoice.accept.header','VocÃª estÃ¡ prestes a aceitar uma fatura e realizar o seguinte pagamento:',NULL),(12552,'pt_BR:menu.member.guarantees','Garantias',NULL),(12553,'pt_BR:alert.member.deniedInvoices','O membro tem {0} faturas eletrÃ´nicas negadas',NULL),(12554,'pt_BR:externalTransferImport.chooseFile','Arquivo de transaÃ§Ãµes',NULL),(12555,'pt_BR:paymentObligation.history','HistÃ³rico',NULL),(12556,'pt_BR:settings.access.adminTimeout','Tempo de expiraÃ§Ã£o da sessÃ£o do administrador',NULL),(12557,'pt_BR:sms.type.HELP_ERROR.description','Erro na ajuda',NULL),(12558,'pt_BR:errors.lessEquals','{0} deve ser menor ou igual a {1}',NULL),(12559,'pt_BR:reports.stats.keydevelopments.grossProduct','Produto bruto',NULL),(12560,'pt_BR:accountFee.groups','Grupos',NULL),(12561,'pt_BR:group.settings.smsAdditionalCharged','NÃºmero de mensagens adicionais no pacote pago',NULL),(12562,'pt_BR:conversionSimulation.aRate.targeted','Ãndice-A desejado',NULL),(12563,'pt_BR:permission.memberGuarantees','Garantias',NULL),(12564,'pt_BR:theme.version','VersÃ£o',NULL),(12565,'pt_BR:reports.transactions_report.credits','CrÃ©ditos',NULL),(12566,'pt_BR:global.no.defined','NÃ£o definido',NULL),(12567,'pt_BR:adInterest.category','Categoria de anÃºncios',NULL),(12568,'pt_BR:defaultBrokerCommission.title.my','ConfiguraÃ§Ãµes de comissÃ£o',NULL),(12569,'pt_BR:notificationPreferences.allowChargingSms','Autorizar cobranÃ§a por mensagem SMS',NULL),(12570,'pt_BR:menu.about','Sobre',NULL),(12571,'pt_BR:guaranteeType.answerTodayMessage','0 deve ser respondida hoje',NULL),(12572,'pt_BR:settings.local.language.RUSSIAN','Russo',NULL),(12573,'pt_BR:group.title.settings.brokering','ConfiguraÃ§Ãµes de corretagem',NULL),(12574,'pt_BR:memberPos.title','POS do membro',NULL),(12575,'pt_BR:loanGroup.memberAdded','O membro foi adicionado a esse grupo de emprÃ©stimos',NULL),(12576,'pt_BR:customField.action.changeOrder','Alterar ordem dos campos',NULL),(12577,'pt_BR:permission.adminMemberSmsMailings.freeSmsMailings','Enviar mensagens gratuitas',NULL),(12578,'pt_BR:message.actionPerformed.MOVE_TO_TRASH','As mensagens foram movidas para a lixeira',NULL),(12579,'pt_BR:loanGroup.modified','Grupo de emprÃ©stimos modificado',NULL),(12580,'pt_BR:menu.admin.personal','Pessoal',NULL),(12581,'pt_BR:alert.title.system','Avisos de sistema',NULL),(12582,'pt_BR:settings.message.scheduledPaymentProcessed','Pagamento agendado: processamento bem sucedido',NULL),(12583,'pt_BR:guaranteeType.error.loanTransferType','O tipo de pagamento para o emprÃ©stimo Ã© obrigatÃ³rio',NULL),(12584,'pt_BR:settings.log.accountFeeLevel','NÃ­vel do log de taxas de conta',NULL),(12585,'pt_BR:webshop.payment.cancelConfirmation','Confirmar',NULL),(12586,'pt_BR:accountFeeLog.acceptedInvoices','Faturas aceitas',NULL),(12587,'pt_BR:customField.member.updateAccess','EditÃ¡vel por',NULL),(12588,'pt_BR:serviceClient.title.modify','Modificar cliente de serviÃ§os web',NULL),(12589,'pt_BR:global.tooltip.edit','Modificar',NULL),(12590,'pt_BR:reports.stats.finances.ThroughTime.expenditure','SaÃ­da',NULL),(12591,'pt_BR:menu.admin.ads.search','Produtos e serviÃ§os',NULL),(12592,'pt_BR:permission.memberReferences.give','Dar',NULL),(12593,'pt_BR:pos.description','DescriÃ§Ã£o',NULL),(12594,'pt_BR:reports.simulations.choose.dRateConfig','ConfiguraÃ§Ã£o do Ãndice-D',NULL),(12595,'pt_BR:settings.message.brokeringRemoved','Corretagem removida manualmente',NULL),(12596,'pt_BR:fileMapping.modified','Mapeamento de arquivo modificado',NULL),(12597,'pt_BR:multiDropDown.multiItemsMessage','#items# itens selecionados',NULL),(12598,'pt_BR:global.hide','Ocultar',NULL),(12599,'pt_BR:reports.stats.comparedPeriods','ComparaÃ§Ã£o entre perÃ­odos',NULL),(12600,'pt_BR:activities.invoices','Faturas eletrÃ´nicas',NULL),(12601,'pt_BR:reports.stats.keydevelopments.transactionAmount','Valor por transaÃ§Ã£o',NULL),(12602,'pt_BR:pos.assigned','POS atribuÃ­do ao membro {0}',NULL),(12603,'pt_BR:pos.actions.unblock','Desbloquear',NULL),(12604,'pt_BR:accountFee.noMatchingMembers','Nenhum membro coincide com os filtros da pesquisa',NULL),(12605,'pt_BR:group.settings.viewLoansByGroup','Ver emprÃ©stimos cedidos ao grupo de emprÃ©stimos',NULL),(12606,'pt_BR:accountFee.error.multipleVolumeFees','Existem mais de uma taxas sobre volume transacionado para esta conta.\n\nPor favor, contate a administraÃ§Ã£o',NULL),(12607,'pt_BR:brokerCommissionContract.status.SUSPENDED','Suspenso',NULL),(12608,'pt_BR:session.lastLogin','Ãšltimo acesso: {0}',NULL),(12609,'pt_BR:permission.adminMembers.remove','Remover permanentemente',NULL),(12610,'pt_BR:changePassword.error.mustBeNumeric','A senha pode conter apenas nÃºmeros',NULL),(12611,'pt_BR:cardType.securityCodeBlockTime','Tempo de bloqueio da senha de seguranÃ§a',NULL),(12612,'pt_BR:settings.access.poswebTimeout','Tempo de expiraÃ§Ã£o da sessÃ£o PosWeb',NULL),(12613,'pt_BR:customImage.system.quickAccess_messages','Acesso rÃ¡pido: mensagens',NULL),(12614,'pt_BR:card.status.ACTIVE','Ativo',NULL),(12615,'pt_BR:sms.error.type.SEND_ERROR','Erro desconhecido',NULL),(12616,'pt_BR:document.inserted','O documento foi inserido',NULL),(12617,'pt_BR:infoText.modified','A mensagem informativa foi modificada',NULL),(12618,'pt_BR:loanPayment.repaidAmount','Pago',NULL),(12619,'pt_BR:infoText.start','AtivaÃ§Ã£o',NULL),(12620,'pt_BR:guarantee.action.accept','Autorizar',NULL),(12621,'pt_BR:alert.removed','Os avisos selecionados foram removidos',NULL),(12622,'pt_BR:adCategory.inserted','A categoria foi inserida',NULL),(12623,'pt_BR:reports.stats.activity.throughTime.percentageNoTrade.yAxis','% dos que nÃ£o estÃ£o transacionando',NULL),(12624,'pt_BR:global.timePeriod.SECONDS','Segundo(s)',NULL),(12625,'pt_BR:global.search','Procurar',NULL),(12626,'pt_BR:translationMessage.title.insert','Nova chave de traduÃ§Ã£o',NULL),(12627,'pt_BR:alert.member.ACCOUNT_ACTIVATION_FAILED','AtivaÃ§Ã£o de conta falhou',NULL),(12628,'pt_BR:createAdmin.passwordConfirmation','Confirme a senha',NULL),(12629,'pt_BR:reports.stats.activity.throughTime.nAll','no. Todos',NULL),(12630,'pt_BR:menu.operator.member.references','ReferÃªncias',NULL),(12631,'pt_BR:invoice.description','DescriÃ§Ã£o',NULL),(12632,'pt_BR:global.preview','PrÃ©-visualizar',NULL),(12633,'pt_BR:payment.status.CANCELED','Cancelado',NULL),(12634,'pt_BR:permission.systemErrorLog.manage','Gerenciar',NULL),(12635,'pt_BR:adCategory.error.importing','Houve um erro ao importar as categorias',NULL),(12636,'pt_BR:permission.operatorAds','AnÃºncios',NULL),(12637,'pt_BR:currency.enableDRate','Ativar Ã­ndice-D',NULL),(12638,'pt_BR:pos.error.noAssignPermission','VocÃª nÃ£o ter permissÃ£o para associar um POS a um membro',NULL),(12639,'pt_BR:permission.brokerLoans.view','Ver',NULL),(12640,'pt_BR:reports.current.member_account_information','Contas de membro',NULL),(12641,'pt_BR:menu.admin.ads','AnÃºncios',NULL),(12642,'pt_BR:help.title.documents','Documentos',NULL),(12643,'pt_BR:reports.members_reports.select_payment_filter','Selecione filtro de pagamentos',NULL),(12644,'pt_BR:reports.stats.finances.ThroughTime.expenditure.yAxis','SaÃ­da',NULL),(12645,'pt_BR:reports.stats.activity.singlePeriod.loginTimes.yAxis','Acessos / membro',NULL),(12646,'pt_BR:message.toGroups','Para grupo(s)',NULL),(12647,'pt_BR:connectedUsers.loggedAt','Conectado em',NULL),(12648,'pt_BR:smsMailing.text','Texto',NULL),(12649,'pt_BR:accountFeeLog.status','Estado',NULL),(12650,'pt_BR:guaranteeType.feePayers.SELLER','Vendedor',NULL),(12651,'pt_BR:error.systemOverloaded','O sistema estÃ¡ acima de sua capacidade no momento.\n\nPor favor, tente novamente em alguns minutos.',NULL),(12652,'pt_BR:member.bulkActions.brokerChanged','{0} membros foram alterados para o corretor {2}.\n{1} membros nÃ£o foram alterados, pois jÃ¡ possuÃ­am {2} como corretor',NULL),(12653,'pt_BR:transactionFee.fromAllGroups','De todos os grupos',NULL),(12654,'pt_BR:reference.level.BAD','Ruim',NULL),(12655,'pt_BR:adImport.status.INVALID_PUBLICATION_START','A data de inÃ­cio de publicaÃ§Ã£o Ã© invÃ¡lida: {0}',NULL),(12656,'pt_BR:settings.log.traceLevel.DETAILED','Rastreamento detalhado (inclusive parÃ¢metros)',NULL),(12657,'pt_BR:adImport.status','Estado',NULL),(12658,'pt_BR:transferType.to','Para',NULL),(12659,'pt_BR:changePassword.passwordLengthRange','Escolha uma senha com tamanho entre {0} e {1} caracteres',NULL),(12660,'pt_BR:customField.type.FLOAT','NÃºmero decimal',NULL),(12661,'pt_BR:guaranteeType.paymentObligationList','ObrigaÃ§Ãµes de pagamento',NULL),(12662,'pt_BR:loan.firstOpenPayment','Primeiro pagamento em aberto',NULL),(12663,'pt_BR:changeGroup.member.permanentlyRemovedMessage','O membro foi permanentemente removido',NULL),(12664,'pt_BR:errorLog.stackTrace','Detalhes de erro java',NULL),(12665,'pt_BR:transactionFee.removeConfirmation','Remover essa taxa de transaÃ§Ã£o?',NULL),(12666,'pt_BR:reports.stats.paymentfilters','Filtros de pagamentos',NULL),(12667,'pt_BR:errors.unique','{0} nÃ£o Ã© Ãºnico',NULL),(12668,'pt_BR:permission.adminMemberGuarantees.cancelCertificationsAsMember','Cancelar certificaÃ§Ãµes',NULL),(12669,'pt_BR:group.settings.maxAdsPerMember','No. mÃ¡x. de anÃºncios por membro',NULL),(12670,'pt_BR:externalTransferType.action.IGNORE','Ignorar',NULL),(12671,'pt_BR:permission.adminMemberAds','Produtos e serviÃ§os',NULL),(12672,'pt_BR:remark.date','Data',NULL),(12673,'pt_BR:permission.brokerPos.unblockPin','Desbloquear senha externa',NULL),(12674,'pt_BR:reports.stats.keydevelopments.throughTime.months.title','Progresso ao longo do tempo',NULL),(12675,'pt_BR:authorizationLevel.adminGroups','Groupos de administradores',NULL),(12676,'pt_BR:changeGroup.admin.permanentlyRemoved','VocÃª nÃ£o pode alterar o grupo porque o administrador foi permanentemente removido',NULL),(12677,'pt_BR:settings.local.sms.customField','Campo de perfil que representa o telefone celular',NULL),(12678,'pt_BR:memberRecordType.layout.LIST','Lista',NULL),(12679,'pt_BR:payment.title.memberToSystem','Pagamento para o sistema',NULL),(12680,'pt_BR:permission.systemMessageCategories','Categorias de mensagens',NULL),(12681,'pt_BR:externalTransferProcess.error.noLoanToDiscard','NÃ£o hÃ¡ emprÃ©stimos abertos para o descarte',NULL),(12682,'pt_BR:serviceClient.action.new','Novo cliente de serviÃ§os web',NULL),(12683,'pt_BR:translationMessage.title.export','Exportar para arquivo de propriedades',NULL),(12684,'pt_BR:accountFee.title.memberSearch','Busca de membros',NULL),(12685,'pt_BR:certification.unlock','Ativar',NULL),(12686,'pt_BR:reports.members_reports.transactions.memberGroupsRequired','Ã‰ necessÃ¡rio selecionar pelo menos um grupo de membros',NULL),(12687,'pt_BR:customizedFile.title.search.static','Arquivos estÃ¡ticos customizados',NULL),(12688,'pt_BR:transfer.title.details','Detalhes da transaÃ§Ã£o',NULL),(12689,'pt_BR:rates.error.reinitValidation.noEditDuringRateReinit','VocÃª nÃ£o pode iniciar uma nova tarefa de reinicializaÃ§Ã£o para indices caso outra ainda esteja sendo executada.',NULL),(12690,'pt_BR:permission.systemAlerts.manageSystemAlerts','Gerenciar avisos de sistema',NULL),(12691,'pt_BR:payment.action.cancel','Cancelar pagamento',NULL),(12692,'pt_BR:reports.members_reports.account_type.all','Todos os tipos de conta',NULL),(12693,'pt_BR:member.bulkActions.changeBroker.confirmation','VocÃª tem certeza que deseja mudar o corretor de todos os membros que satisfazem ao filtro?',NULL),(12694,'pt_BR:menu.member.personal.changePassword','Alterar senha',NULL),(12695,'pt_BR:transferAuthorization.action','AÃ§Ã£o',NULL),(12696,'pt_BR:permission.systemTranslation.view','Ver',NULL),(12697,'pt_BR:invite.sent','E-mail de convite enviado para {0}',NULL),(12698,'pt_BR:loan.grant.firstExpirationDate','Primeira data de vencimento',NULL),(12699,'pt_BR:loan.status.RECOVERED','Recuperado',NULL),(12700,'pt_BR:channel.usePin','Usar PIN',NULL),(12701,'pt_BR:permission.systemChannels.view','Ver',NULL),(12702,'pt_BR:permission.systemTranslation.manageMailTranslation','TraduÃ§Ã£o de e-mails',NULL),(12703,'pt_BR:permission.brokerReports','RelatÃ³rios',NULL),(12704,'pt_BR:permission.memberAccess','Acesso',NULL),(12705,'pt_BR:guarantee.expires','Vencimento',NULL),(12706,'pt_BR:permission.systemReports.statistics','EstatÃ­sticas',NULL),(12707,'pt_BR:permission.brokerMemberAccess.changeChannelsAccess','Alterar acesso a canais',NULL),(12708,'pt_BR:reports.current.n_adsaccount','NÃºmero de membros ativos com anÃºncios ativos',NULL),(12709,'pt_BR:pos.new','Criar novo POS',NULL),(12710,'pt_BR:guaranteeType.name','Nome',NULL),(12711,'pt_BR:group.settings.maxAdDescriptionSize','Tamanho mÃ¡x. para descriÃ§Ã£o do anÃºncio',NULL),(12712,'pt_BR:loanPayment.search.period','PerÃ­odo',NULL),(12713,'pt_BR:card.updateCard.error.blockedTransactionPassword','Senha de transaÃ§Ã£o bloqueada',NULL),(12714,'pt_BR:reports.stats.activity.topten.grossProduct','Produto bruto',NULL),(12715,'pt_BR:permission.adminMembers.changeGroup','Alterar grupo',NULL),(12716,'pt_BR:accountFee.amount','Valor',NULL),(12717,'pt_BR:memberRecordType.removeConfirmation','Remover este tipo de registro de membro?',NULL),(12718,'pt_BR:settings.message.pendingGuaranteeIssuer','Garantia pendente de autorizaÃ§Ã£o do emissor',NULL),(12719,'pt_BR:smsMailing.variables','Variaveis',NULL),(12720,'pt_BR:card.changeSecurityCode.error.obvious','O cÃ³digo de seguranÃ§a Ã© muito simples. Ele nÃ£o pode ser sequencial ou igual a qualquer campo do perfil',NULL),(12721,'pt_BR:accountType.currency','Moeda',NULL),(12722,'pt_BR:customImage.system.quickAccess_makePayment','Acesso rÃ¡pido: fazer pagamento',NULL),(12723,'pt_BR:adminTasks.indexes.type.all','Todos',NULL),(12724,'pt_BR:permission.module.type.ADMIN_MEMBER','PermissÃµes de administraÃ§Ã£o de membros de {0}',NULL),(12725,'pt_BR:reports.stats.activity.throughTime.numberTransactions.col4','no. Todos',NULL),(12726,'pt_BR:reports.stats.activity.throughTime.numberTransactions.col3','no. Membros negociando',NULL),(12727,'pt_BR:reports.stats.activity.throughTime.numberTransactions.col2','NÃºmero de transaÃ§Ãµes Todos',NULL),(12728,'pt_BR:reports.stats.activity.throughTime.numberTransactions.col1','NÃºmero de transaÃ§Ãµes',NULL),(12729,'pt_BR:smsMailing.new','Enviar novo',NULL),(12730,'pt_BR:group.removeConfirmation','Remover esse grupo?',NULL),(12731,'pt_BR:errorLog.title.search','Procurar logs de erro no histÃ³rico',NULL),(12732,'pt_BR:permission.memberOperators.manage','Gerenciar operadores',NULL),(12733,'pt_BR:permission.operatorAccount.simulateConversion','Simular conversÃ£o',NULL),(12734,'pt_BR:invite.errorSending','Erro ao enviar e-mail para {0}',NULL),(12735,'pt_BR:scheduledPayment.transferNumber','{0} de {1}',NULL),(12736,'pt_BR:settings.log.traceWritesOnly','Gerar log somente se algum dado foi modificado',NULL),(12737,'pt_BR:profile.member.maxPictures','Quantidade mÃ¡xima de imagens atingida',NULL),(12738,'pt_BR:menu.admin.usersGroups.memberRecordTypes','Tipos de registro de membro',NULL),(12739,'pt_BR:adCategory.import.confirmation','Tem certeza que deseja importar as categorias de anÃºncio do arquivo selecionado?',NULL),(12740,'pt_BR:reports.simulations.dRate.config.graph.yAxis','Taxa',NULL),(12741,'pt_BR:permission.brokerRemarks.view','Ver',NULL),(12742,'pt_BR:reports.stats.activity.singlePeriod.grossProduct.row1.short','com entradas',NULL),(12743,'pt_BR:scheduledPayment.title.details','Detalhes do pagamento agendado',NULL),(12744,'pt_BR:alert.type','Tipo',NULL),(12745,'pt_BR:settings.access.transactionPasswordChars','Caracteres possÃ­veis na senha de transaÃ§Ã£o',NULL),(12746,'pt_BR:reports.stats.keydevelopments.highestAmountPerTransaction.yAxis','Maior valor / trans.',NULL),(12747,'pt_BR:accountHistory.credits.count','NÂº de crÃ©ditos',NULL),(12748,'pt_BR:alert.member.loginBlockedByTries','O acesso do usuÃ¡rio estÃ¡ temporariamente bloqueado por exceder a quantidade mÃ¡xima de tentativas. O endereÃ§o IP do membro Ã© {1}',NULL),(12749,'pt_BR:accountType.removed','A conta foi removida',NULL),(12750,'pt_BR:smsMailing.type.FREE','Gratuita',NULL),(12751,'pt_BR:menu.operator.guarantees.searchCertifications','CertificaÃ§Ãµes',NULL),(12752,'pt_BR:currency.error.pattern','Deve incluir #amount#, o qual serÃ¡ substituido pela quantia atual.',NULL),(12753,'pt_BR:customImage.system.next','Ãcone de prÃ³xima pÃ¡gina',NULL),(12754,'pt_BR:settings.message.invoiceAccepted','Fatura eletrÃ´nica aceita',NULL),(12755,'pt_BR:permission.brokerMessages.sendToMembers','Enviar mensagem para membros registrados',NULL),(12756,'pt_BR:permission.adminMemberAccess.disconnectOperator','Desconectar operador',NULL),(12757,'pt_BR:serviceClient.removed','O cliente de serviÃ§os web foi removido',NULL),(12758,'pt_BR:permission.systemReports.aRateConfigSimulation','SimulaÃ§Ã£o da configuraÃ§Ã£o do Ã­ndice-A',NULL),(12759,'pt_BR:reports.stats.finances.singlePeriod.expenditure','SaÃ­da',NULL),(12760,'pt_BR:permission.systemAdminPermissions.manage','Gerenciar',NULL),(12761,'pt_BR:externalTransfer.title.new','Novo pagamento externo',NULL),(12762,'pt_BR:menu.admin.messages.messages','Mensagens',NULL),(12763,'pt_BR:permission.systemGroups.manageMember','Gerenciar grupos de membros',NULL),(12764,'pt_BR:account.transactionPasswordRequired','Exigir senha de transaÃ§Ã£o',NULL),(12765,'pt_BR:adImport.status.TOO_MANY_CATEGORY_LEVELS','Muitos nÃ­veis de categoria (mÃ¡x.=3)',NULL),(12766,'pt_BR:messageCategory.removed','A categoria de mensagem foi removida',NULL),(12767,'pt_BR:paymentObligation.delete','Excluir',NULL),(12768,'pt_BR:reports.transactions_report.incoming','De entrada',NULL),(12769,'pt_BR:reports.stats.activity.singlePeriod.loginTimes.row1','Acessos por membro',NULL),(12770,'pt_BR:home.admin.jumpToProfile.title','Ir para perfil do membro',NULL),(12771,'pt_BR:messageCategory.inserted','A categoria de mensagem foi inserida',NULL),(12772,'pt_BR:group.account.modified','A conta de grupo foi modificada',NULL),(12773,'pt_BR:permission.memberInvoices.view','Ver',NULL),(12774,'pt_BR:serviceClient.credentialsRequired','Credentials required',NULL),(12775,'pt_BR:accountHistory.filter','Tipo de pagamento',NULL),(12776,'pt_BR:paymentObligation.removeConfirmation','VocÃª confirma a exclusÃ£o desta obrigaÃ§Ã£o de pagamento?',NULL),(12777,'pt_BR:message.sendTo.GROUP','Grupo(s)',NULL),(12778,'pt_BR:permission.memberPreferences','OpÃ§Ãµes',NULL),(12779,'pt_BR:scheduledPayment.transfer','Parcela',NULL),(12780,'pt_BR:reference.transactionFeedback.replyComments.saved','A rÃ©plica da qualificaÃ§Ã£o foi salva',NULL),(12781,'pt_BR:loan.grant.manualDate','Data de concessÃ£o',NULL),(12782,'pt_BR:externalTransfer.status','Estado',NULL),(12783,'pt_BR:permission.adminMemberTransactionFeedbacks.manage','Gerenciar',NULL),(12784,'pt_BR:permission.adminMemberPayments.chargeback','Estornar pagamento para membros',NULL),(12785,'pt_BR:reports.stats.activity.comparePeriods.percentageNoTrade.row1','Percentual de membros que nÃ£o transacionam',NULL),(12786,'pt_BR:icon.title.conciliated','Pagamento conciliado',NULL),(12787,'pt_BR:adImport.status.INVALID_PRICE','O preÃ§o Ã© invÃ¡lido: {0}',NULL),(12788,'pt_BR:menu.admin.accounts.systemPayment','Pagamento para sistema',NULL),(12789,'pt_BR:memberRecord.action.new','Novo registro de {0}',NULL),(12790,'pt_BR:menu.admin.settings.file','Importar / Exportar',NULL),(12791,'pt_BR:settings.message.mail','Atributos para notificaÃ§Ãµes enviadas por e-mail',NULL),(12792,'pt_BR:settings.alert.amountIncorrectLogin','Tentativas de acesso incorretas',NULL),(12793,'pt_BR:accountHistory.debits.amount','Total de dÃ©bitos',NULL),(12794,'pt_BR:reference.summary.last30days','Ãšltimos 30 dias',NULL),(12795,'pt_BR:createMember.registrationAgreementButton','Eu concordo com os termos de adesÃ£o acima',NULL),(12796,'pt_BR:receiptPrinter.error.applet','A applet da impressora de recibos nÃ£o pÃ´de ser inicializada.\n\nCertifique-se que o plugin do Java esteja instalado e que a applet do jZebra tenha sido autorizada a rodar.',NULL),(12797,'pt_BR:global.pagination.single.page','{0} resultado(s)',NULL),(12798,'pt_BR:posweb.error.notEnoughCredits','O pagamento nÃ£o pÃ´de ser realizado',NULL),(12799,'pt_BR:invoice.action.accept','Aceitar',NULL),(12800,'pt_BR:customField.memberRecord.memberRecordType','Tipo',NULL),(12801,'pt_BR:pos.actions.changePin','Alterar Pin',NULL),(12802,'pt_BR:conversionSimulation.result.nofees','Nenhuma taxa encontrada',NULL),(12803,'pt_BR:posLog.by','Por',NULL),(12804,'pt_BR:customField.member.indexing.MEMBERS_AND_ADS','Membros e anÃºncios',NULL),(12805,'pt_BR:permission.adminAdminRecords.modify','Modificar',NULL),(12806,'pt_BR:loanGroup.action.grantLoan','Conceder emprÃ©stimo',NULL),(12807,'pt_BR:reports.stats.keydevelopments.throughTime.months.xAxis','Meses',NULL),(12808,'pt_BR:externalTransfer.member','Membro',NULL),(12809,'pt_BR:customField.operator.visibility.NOT_VISIBLE','NÃ£o visÃ­vel',NULL),(12810,'pt_BR:menu.admin.reports.sms','Registros de SMS',NULL),(12811,'pt_BR:externalTransfer.action.MARK_AS_CHECKED','Marcar como verificada',NULL),(12812,'pt_BR:invoice.denied','A fatura eletrÃ´nica foi negada',NULL),(12813,'pt_BR:help.title.invoices','Faturas eletrÃ´nicas',NULL),(12814,'pt_BR:notificationPreferences.selectAll','Todos',NULL),(12815,'pt_BR:ticket.status.EXPIRED','Expirado',NULL),(12816,'pt_BR:pos.status.BLOCKED','Bloqueado',NULL),(12817,'pt_BR:member.title.bulkActions.filter','Filtro de membros para aÃ§Ãµes em massa',NULL),(12818,'pt_BR:reports.stats.keydevelopments.grossProduct.allTransactions.short','Tudo',NULL),(12819,'pt_BR:permission.systemMemberRecordTypes.view','Ver',NULL),(12820,'pt_BR:receipt.posweb.transactions.member','{0}',NULL),(12821,'pt_BR:group.inserted','O grupo foi inserido',NULL),(12822,'pt_BR:memberRecordType.inserted','O tipo de registro de membro foi inserido',NULL),(12823,'pt_BR:rates.reinit.reinit','Reinicializar?',NULL),(12824,'pt_BR:payment.status.PROCESSED','Processado',NULL),(12825,'pt_BR:help.title.passwords','Senhas',NULL),(12826,'pt_BR:accountFeeLog.finished','ConcluÃ­da',NULL),(12827,'pt_BR:mobile.home.viewPayments','Ver Pagamentos',NULL),(12828,'pt_BR:notificationPreferences.noPaidSmsLeft','VocÃª nÃ£o possui nenhuma mensagem paga adicional',NULL),(12829,'pt_BR:reports.stats.taxes.title','EstatÃ­sticas de taxas',NULL),(12830,'pt_BR:loan.status.AUTHORIZATION_DENIED','AutorizaÃ§Ã£o negada',NULL),(12831,'pt_BR:notificationPreferences.enableSmsOperations','Permitir operaÃ§Ãµes por SMS',NULL),(12832,'pt_BR:payment.cancel.transactionPassword','Para cancelar este pagamento, vocÃª deve fornecer sua senha de transaÃ§Ã£o',NULL),(12833,'pt_BR:profile.pendingEmail.resent','O e-mail de verificaÃ§Ã£o foi enviado para {0}',NULL),(12834,'pt_BR:conversionSimulation.transferType','Tipo de transaÃ§Ã£o',NULL),(12835,'pt_BR:admin.title.search','Procurar administradores',NULL),(12836,'pt_BR:document.action.new.dynamic','Novo documento dinÃ¢mico',NULL),(12837,'pt_BR:guaranteeType.removeConfirmation','VocÃª tem certeza que deseja excluir o tipo de garantia?',NULL),(12838,'pt_BR:infoText.title.new','Nova mensagem informativa',NULL),(12839,'pt_BR:settings.message.brokerRemovedRemarkComments','ComentÃ¡rio da observaÃ§Ã£o de corretor removido',NULL),(12840,'pt_BR:settings.log.traceLevel','NÃ­vel do log de aÃ§Ãµes',NULL),(12841,'pt_BR:permission.operatorReferences','ReferÃªncias',NULL),(12842,'pt_BR:fieldMapping.field.TYPE','Tipo de pagamento',NULL),(12843,'pt_BR:profile.pendingEmail','A mudanÃ§a para {0} estÃ¡ pendente de confirmaÃ§Ã£o',NULL),(12844,'pt_BR:permission.adminMemberAds.view','Ver',NULL),(12845,'pt_BR:alert.title.search','HistÃ³rico de avisos',NULL),(12846,'pt_BR:settings.log.scheduledTaskFile','EndereÃ§o/nome do arquivo de log de tarefas agendadas',NULL),(12847,'pt_BR:reports.stats.general.notUsed','nÃ£o utilizado',NULL),(12848,'pt_BR:document.nature','Tipo',NULL),(12849,'pt_BR:transferType.inserted','O tipo de transaÃ§Ã£o foi inserido',NULL),(12850,'pt_BR:pin.unblock.button','Desbloquear senha externa (PIN)',NULL),(12851,'pt_BR:permission.systemCustomImages.view','Ver',NULL),(12852,'pt_BR:activities.rates','Ãndices',NULL),(12853,'pt_BR:ad.status.ACTIVE','Ativo',NULL),(12854,'pt_BR:alert.member.initialCreditFailed','A concessÃ£o do crÃ©dito inicial falhou para {0}',NULL),(12855,'pt_BR:channel.title.modify','Modificar canal',NULL),(12856,'pt_BR:accountFee.invoiceMode.ALWAYS','Sempre (nÃ£o cobrar o membro automaticamente)',NULL),(12857,'pt_BR:permission.adminMemberAccess.disconnect','Desconectar membro',NULL),(12858,'pt_BR:customField.allSelectedLabel','Todas',NULL),(12859,'pt_BR:loan.showProjection','Exibir',NULL),(12860,'pt_BR:paymentObligation.title.view','Detalhes da obrigaÃ§Ã£o de pagamento',NULL),(12861,'pt_BR:alert.system.INDEX_REBUILD_END','ConclusÃ£o de reconstruÃ§Ã£o de Ã­ndice de busca',NULL),(12862,'pt_BR:externalTransferImport.title.import','Importar transaÃ§Ãµes de {0}',NULL),(12863,'pt_BR:global.weekDay.MONDAY','Segunda-feira',NULL),(12864,'pt_BR:menu.admin.customFields.memberFields','Membro',NULL),(12865,'pt_BR:accountFeeLog.status.INVOICE','Fatura',NULL),(12866,'pt_BR:member.bulkActions.changeGroup.confirmation','VocÃª tem certeza que deseja mudar o grupo de todos os membros que satisfazem ao filtro?',NULL),(12867,'pt_BR:cardType.title.list','Tipos de cartÃ£o',NULL),(12868,'pt_BR:loan.confirmation.header','VocÃª estÃ¡ prestes a conceder este emprÃ©stimo:',NULL),(12869,'pt_BR:fileMapping.negativeAmountValue','Valor negativo',NULL),(12870,'pt_BR:sms.type.PAYMENT','Pagamento direto',NULL),(12871,'pt_BR:errors.passwords','As senhas nÃ£o sÃ£o iguais',NULL),(12872,'pt_BR:alert.system.errorProcessingAccountStatus','Erro crÃ­tico no processamento do estado de conta. Detalhes do pagamento: data: {0}, de {1}, para {2}, valor {3}',NULL),(12873,'pt_BR:transactionFee.aRateRelation','RelaÃ§Ã£o entre taxa e Ã­ndice-A',NULL),(12874,'pt_BR:transferType.showScheduledPaymentsToDestination','Mostrar pagamentos agendados ao destinatÃ¡rio',NULL),(12875,'pt_BR:settings.mail.activationMessageWithPassword','Mensagem quando a senha Ã© gerada',NULL),(12876,'pt_BR:reports.stats.activity.histogram.logins.title','Acessos por membro, histograma',NULL),(12877,'pt_BR:transfer.guarantee.details','Clique aqui para detalhes.',NULL),(12878,'pt_BR:home.admin.status.connectedBrokers','NÃºmero de corretores conectados',NULL),(12879,'pt_BR:defaultBrokerCommission.validity','Validade',NULL),(12880,'pt_BR:adminTasks.onlineState.confirmOffline','Definir o sistema como inativo irÃ¡ desconectar todos os usuÃ¡rios conectados (exceto vocÃª) e prevenir que nenhum usuÃ¡rio se conecte, exceto adminsitradores com permissÃµes de definir o sistema como ativo novamente.\n\nVocÃª tem certeza que quer definir o sistema como inativo?',NULL),(12881,'pt_BR:transactionFee.title.broker.insert','Inserir comissÃ£o de corretor',NULL),(12882,'pt_BR:settings.local.title','ConfiguraÃ§Ãµes de local',NULL),(12883,'pt_BR:receipt.transfer.textBefore','----------------',NULL),(12884,'pt_BR:memberPos.resultPageSize','Resultados por pÃ¡gina',NULL),(12885,'pt_BR:guarantee.seller','Vendedor',NULL),(12886,'pt_BR:adImport.file','Arquivo CSV',NULL),(12887,'pt_BR:menu.admin.alerts.alertHistory','HistÃ³rico de avisos',NULL),(12888,'pt_BR:menu.admin.accounts.scheduledPayments','Pagamentos agendados',NULL),(12889,'pt_BR:groups.name','Nome',NULL),(12890,'pt_BR:pendingMember.search.date','Data',NULL),(12891,'pt_BR:reports.stats.activity.throughTime.loginTimes.title','Acessos por membro ao longo do tempo',NULL),(12892,'pt_BR:cardType.showCardSecurityCode','Exibir o cÃ³digo de seguranÃ§a',NULL),(12893,'pt_BR:message.error.memberCannotReceive','A mensagem nÃ£o pÃ´de ser enviada pois o membro escolheu nÃ£o receber mensagens',NULL),(12894,'pt_BR:profile.action.manageNotifications','Gerenciar notificaÃ§Ãµes',NULL),(12895,'pt_BR:card.user.of','CartÃµes do {0}',NULL),(12896,'pt_BR:paymentObligationLog.date','Data',NULL),(12897,'pt_BR:loanPayment.summary.recoveredPayments','Parcelas recuperadas',NULL),(12898,'pt_BR:customField.pattern','PadrÃ£o de entrada',NULL),(12899,'pt_BR:ticket.status.OK_PENDING','Sucesso / Pendente',NULL),(12900,'pt_BR:errorLog.path','EndereÃ§o',NULL),(12901,'pt_BR:transferType.transferListenerClass','Classe Java para notificaÃ§Ã£o de pagamentos processados',NULL),(12902,'pt_BR:errors.minLength','{0} nÃ£o pode ser menor do que {1} caracteres',NULL),(12903,'pt_BR:adminTasks.indexes.status.CORRUPT','Corrompido',NULL),(12904,'pt_BR:guarantee.sellerName','Nome do vendedor',NULL),(12905,'pt_BR:posweb.bannerText','POS web',NULL),(12906,'pt_BR:transferType.availability.PAYMENT','Pagamento direto',NULL),(12907,'pt_BR:channel.removeConfirmation','VocÃª tem certeza que deseja remover este canal?',NULL),(12908,'pt_BR:receipt.posweb.transactions.noTransfers','Nenhum pagamento',NULL),(12909,'pt_BR:settings.message.scheduledPaymentFailedToPayer','Pagamento agendado: falha ao processar (para quem pagou)',NULL),(12910,'pt_BR:group.settings.transactionPassword','Senha de transaÃ§Ã£o',NULL),(12911,'pt_BR:memberImport.status.INVALID_CUSTOM_FIELD_VALUE_MAX_LENGTH','{0} Ã© invalido: o tamanho mÃ¡ximo Ã© {1}.',NULL),(12912,'pt_BR:permission.adminMemberGroups.manageAccountSettings','Gerenciar configuraÃ§Ã£o de contas',NULL),(12913,'pt_BR:adImport.title.import','Importar anÃºncios',NULL),(12914,'pt_BR:settings.local.language.SPANISH','Espanhol',NULL),(12915,'pt_BR:permission.systemThemes.export','Exportar',NULL),(12916,'pt_BR:settings.message.scheduledPaymentFailedToPayee','Pagamento agendado de fatura: falha ao processar (para quem recebeu)',NULL),(12917,'pt_BR:loan.repayment.paymentNumber','NÃºmero do pagamento',NULL),(12918,'pt_BR:loan.repayment.manualDate','Data de pagamento',NULL),(12919,'pt_BR:paymentObligation.cancel','Cancelar',NULL),(12920,'pt_BR:paymentObligation.description','DescriÃ§Ã£o',NULL),(12921,'pt_BR:transfer.to','Para',NULL),(12922,'pt_BR:permission.adminMemberRecords.view','Ver',NULL),(12923,'pt_BR:reports.stats.finances.singlePeriod.overview.yAxis','Quantidade',NULL),(12924,'pt_BR:login.transactionPassword','Senha de transaÃ§Ã£o',NULL),(12925,'pt_BR:global.searchResults','Resultados da busca',NULL),(12926,'pt_BR:ticket.status.PENDING','Pendente',NULL),(12927,'pt_BR:receipt.transfer.from','De: {0}',NULL),(12928,'pt_BR:customImage.system.quickAccess_searchMembers','Acesso rÃ¡pido: procurar membros',NULL),(12929,'pt_BR:permission.adminAdmins.view','Ver',NULL),(12930,'pt_BR:currency.name','Nome',NULL),(12931,'pt_BR:reports.stats.taxes.numberOfCharges','CobranÃ§as',NULL),(12932,'pt_BR:adminTasks.indexes.status.MISSING','Faltando',NULL),(12933,'pt_BR:menu.operator.help','Ajuda',NULL),(12934,'pt_BR:mobile.payment.transactionPassword','Senha de transaÃ§Ã£o',NULL),(12935,'pt_BR:permission.systemMessageCategories.manage','Gerenciar',NULL),(12936,'pt_BR:brokerCommissionContract.title.list','Contratos de comissÃ£o de corretor',NULL),(12937,'pt_BR:message.action.MARK_AS_UNREAD','Marcar como nÃ£o lida',NULL),(12938,'pt_BR:settings.local.numberLocale.PERIOD_AS_DECIMAL','1,234.56',NULL),(12939,'pt_BR:changePin.error.invalidTransactionPassword','Senha de transaÃ§Ã£o incorreta',NULL),(12940,'pt_BR:reports.stats.general.selectMulti','Selecione um ou mais',NULL),(12941,'pt_BR:transfer.processDate','Processado em',NULL),(12942,'pt_BR:message.sendTo.BROKERED_MEMBERS','Membros do corretor',NULL),(12943,'pt_BR:memberImport.status.INVALID_CUSTOM_FIELD_VALUE_UNIQUE','{0} Ã© invalido: {1} nÃ£o Ã© unico.',NULL),(12944,'pt_BR:certification.error.certificationActiveExists','JÃ¡ existe uma certificaÃ§Ã£o para o comprador e moeda selecionados',NULL),(12945,'pt_BR:permission.operatorReports','RelatÃ³rios',NULL),(12946,'pt_BR:authorizationLevel.error.maxLevel','NÃ£o Ã© possÃ­vel inserir mais do que {0} nÃ­veis de autorizaÃ§Ã£o',NULL),(12947,'pt_BR:message.type.AD_EXPIRATION','Vencimento de anÃºncios',NULL),(12948,'pt_BR:permission.adminMemberLoans.manageExpiredStatus','Gerenciar o estado de emprÃ©stimos vencidos',NULL),(12949,'pt_BR:accountFeeLog.status.ACCEPTED_INVOICE','Fatura aceita',NULL),(12950,'pt_BR:transactionPassword.reset.confirmMessage','VocÃª tem certeza de que deseja reinicializar a senha de transaÃ§Ã£o do membro?',NULL),(12951,'pt_BR:help.title.contacts','Contatos',NULL),(12952,'pt_BR:mobile.payment.error.notEnoughCredits','VocÃª nÃ£o tem crÃ©ditos suficientes para realizar o pagamento',NULL),(12953,'pt_BR:customField.control.TEXT','Caixa de texto',NULL),(12954,'pt_BR:createOperator.passwordConfirmation','Confirme a senha',NULL),(12955,'pt_BR:reports.members_reports.include_no_traders','Incluir membros sem transaÃ§Ãµes',NULL),(12956,'pt_BR:document.nature.DYNAMIC','DinÃ¢mico',NULL),(12957,'pt_BR:brokering.title.print','Membros registrados',NULL),(12958,'pt_BR:transfer.title.children','Detalhes da transaÃ§Ã£o gerada',NULL),(12959,'pt_BR:account.iRate','Indice-I',NULL),(12960,'pt_BR:mobile.home.doPayment','Fazer pagamento',NULL),(12961,'pt_BR:menu.member.search.ads','Produtos e serviÃ§os',NULL),(12962,'pt_BR:menu.admin.externalAccounts.fileMappings','Mapeamentos de arquivos',NULL),(12963,'pt_BR:reports.members.ads.active_ads','AnÃºncios ativos',NULL),(12964,'pt_BR:settings.message.adminPaymentFromSystemToSystem','Pagamentos do sistema para o sistema',NULL),(12965,'pt_BR:reports.stats.general.p','Valor-p',NULL),(12966,'pt_BR:permission.systemAdCategories.manage','Gerenciar',NULL),(12967,'pt_BR:permission.systemStatus.viewConnectedAdmins','Ver administradores conectados',NULL),(12968,'pt_BR:memberRecord.title.flat','{0} para {1}',NULL),(12969,'pt_BR:permission.systemGroupFilters.manage','Gerenciar',NULL),(12970,'pt_BR:payment.title.brokerMemberToMember','Pagamento entre membros',NULL),(12971,'pt_BR:permission.brokerMemberRecords.view','Ver',NULL),(12972,'pt_BR:menu.admin.accounts.transfersAuthorizations','Busca de autorizaÃ§Ãµes',NULL),(12973,'pt_BR:menu.admin.help.manual.stats','Manual de estatÃ­sticas',NULL),(12974,'pt_BR:message.actionPerformed.RESTORE','As mensagens foram restauradas',NULL),(12975,'pt_BR:guarantee.myWithBuyerOnly','Somente minhas garantias com comprador',NULL),(12976,'pt_BR:group.settings.maxAdImagesPerMember','Qtde. mÃ¡x. de imagens por anÃºncio',NULL),(12977,'pt_BR:reports.current.invoices.SYSTEM_INCOMING.amount','Soma das faturas eletrÃ´nicas de entrada no sistema',NULL),(12978,'pt_BR:settings.message.pendingPaymentDenied','Pagamento pendente negado',NULL),(12979,'pt_BR:permission.adminAdminRecords.create','Criar',NULL),(12980,'pt_BR:menu.operator.logout','Sair',NULL),(12981,'pt_BR:menu.admin.contentManagement.systemImages','Imagens de sistema',NULL),(12982,'pt_BR:payment.status.DENIED','Negado',NULL),(12983,'pt_BR:transactionFee.allBrokerGroups','Todos os grupos de corretores',NULL),(12984,'pt_BR:settings.message.posPinBlocked','Senha externa (PIN) do canal POS bloqueada por excesso de tentativas invÃ¡lidas',NULL),(12985,'pt_BR:customizedFile.title.customize.page','Personalizar pÃ¡gina do aplicativo',NULL),(12986,'pt_BR:createOperator.action.saveAndNew','Salvar e inserir outro operador',NULL),(12987,'pt_BR:transfer.date','Data',NULL),(12988,'pt_BR:paymentObligationLog.by','Alterado por',NULL),(12989,'pt_BR:card.status','Estado',NULL),(12990,'pt_BR:reports.stats.activity.histogram.logins.xAxis','Acessos/membro',NULL),(12991,'pt_BR:reports.stats.general.graph.selectNone','NÃ£o selecionar nenhum grÃ¡fico',NULL),(12992,'pt_BR:settings.message.expiredGuarantee','CertificaÃ§Ã£o negada',NULL),(12993,'pt_BR:customField.type.DATE','Data',NULL),(12994,'pt_BR:profile.action.advertisementsActions','AnÃºncios',NULL),(12995,'pt_BR:settings.mailTranslation.modified','A traduÃ§Ã£o dos e-mails foi modificada',NULL),(12996,'pt_BR:channel.credentials.LOGIN_PASSWORD','Senha de login',NULL),(12997,'pt_BR:login.error.blocked','Seu acesso estÃ¡ temporariamente bloqueado',NULL),(12998,'pt_BR:loan.title.search.group','EmprÃ©stimos do grupo {0}',NULL),(12999,'pt_BR:reports.simulations.aRate.config.combinedGraph.yAxis','Taxa',NULL),(13000,'pt_BR:adInterest.title.modify','Modificar interesse em anÃºncios',NULL),(13001,'pt_BR:smsMailing.systemName','Nome do sistema',NULL),(13002,'pt_BR:account.lowUnitsMessage','Mensagem de poucas unidades',NULL),(13003,'pt_BR:externalTransferType.inserted','O tipo de pagamento foi inserido',NULL),(13004,'pt_BR:transactionPassword.blocked','A senha de transaÃ§Ã£o agora estÃ¡ bloqueada',NULL),(13005,'pt_BR:reports.stats.activity.comparePeriods.numberTransactions.row2','NÃºmero de transaÃ§Ãµes sobre todos os membro',NULL),(13006,'pt_BR:reports.stats.activity.comparePeriods.numberTransactions.row1','NÃºmero de transaÃ§Ãµes por membro que realiza transaÃ§Ãµes',NULL),(13007,'pt_BR:accountHistory.conciliation.all','Todas',NULL),(13008,'pt_BR:transferType.fields.action.new','Inserir novo campo',NULL),(13009,'pt_BR:transactionFee.chargeType.A_RATE','Ã­ndice-A',NULL),(13010,'pt_BR:customField.ad.indexed','Incluir na busca por palavras-chave',NULL),(13011,'pt_BR:brokering.list.noResults','Nenhum membro registrado de acordo com o filtro',NULL),(13012,'pt_BR:createAdmin.action.saveAndOpenProfile','Salvar e abrir perfil',NULL),(13013,'pt_BR:permission.adminMemberLoanGroups','AssociaÃ§Ã£o a grupo de emprÃ©stimos',NULL),(13014,'pt_BR:document.title.insert','Inserir novo documento',NULL),(13015,'pt_BR:changeGroup.error.remove.hasBalance','O membro nÃ£o pode ser removido porque sua conta nÃ£o possui saldo zero em {0}',NULL),(13016,'pt_BR:group.settings.emailValidation.BROKER','Corretor',NULL),(13017,'pt_BR:menu.admin.usersGroups.membersBulkAction','AÃ§Ãµes em massa',NULL),(13018,'pt_BR:card.member','Membro',NULL),(13019,'pt_BR:loan.confirmation.transactionPassword','Para confirmar este emprÃ©stimo, vocÃª deve informar a sua senha de transaÃ§Ã£o',NULL),(13020,'pt_BR:accountType.limitType.UNLIMITED','Ilimitado',NULL),(13021,'pt_BR:global.iRate.steps','passos',NULL),(13022,'pt_BR:changeGroup.error.remove.hasOpenLoans','O membro nÃ£o pode ser removido porque possui emprÃ©stimos nÃ£o pagos',NULL),(13023,'pt_BR:certification.status.CANCELLED','Cancelada',NULL),(13024,'pt_BR:account.balance','Saldo da conta',NULL),(13025,'pt_BR:multiDropDown.noItemsMessage','Nenhum item selecionado',NULL),(13026,'pt_BR:customizedFile.action.customizeNew','Personalizar novo arquivo',NULL),(13027,'pt_BR:permission.systemAdCategories.view','Ver',NULL),(13028,'pt_BR:admin.adminUsername','Nome de usuÃ¡rio do administrador',NULL),(13029,'pt_BR:alert.system.accountFeeRunning','A taxa de conta {0} estÃ¡ sendo executada',NULL),(13030,'pt_BR:customField.member.access.MEMBER_NOT_REGISTRATION','Membro sem ser no cadastro',NULL),(13031,'pt_BR:remark.title','ObservaÃ§Ãµes de {0}',NULL),(13032,'pt_BR:mobile.home.creditLimit','Limite: {0}',NULL),(13033,'pt_BR:changePin.error.invalidPassword','Senha incorreta',NULL),(13034,'pt_BR:reports.stats.activity.whatToShow.THROUGH_TIME','Ao longo do tempo',NULL),(13035,'pt_BR:settings.local.language','Linguagem',NULL),(13036,'pt_BR:memberRecordType.modified','O tipo de registro de membro foi modificado',NULL),(13037,'pt_BR:receiptPrinterSettings.localPrinter.defaultBrowserPrinting','ImpressÃ£o padrÃ£o do navegador',NULL),(13038,'pt_BR:permission.brokerMemberPayments.paymentAsMemberToSystem','Pagamento como membro para sistema',NULL),(13039,'pt_BR:customField.member.access.ADMIN','Administrador',NULL),(13040,'pt_BR:home.status.unreadMessages','VocÃª tem {0} mensagens nÃ£o lidas',NULL),(13041,'pt_BR:memberImport.accountType','Tipo de conta',NULL),(13042,'pt_BR:paymentObligation.status.CANCELED','Cancelada',NULL),(13043,'pt_BR:permission.memberCards.cancel','Cancelar',NULL),(13044,'pt_BR:message.type.BROKERING','Alertas de corretagem',NULL),(13045,'pt_BR:cardType.removeConfirmation','Remover este tipo de cartÃ£o?',NULL),(13046,'pt_BR:customField.payment.listAccess','Exibir na lista de resultados',NULL),(13047,'pt_BR:memberImport.status.SUCCESS','Sucesso',NULL),(13048,'pt_BR:adImport.status.MISSING_CATEGORY','A categoria estÃ¡ faltando',NULL),(13049,'pt_BR:settings.local.csv.recordSeparator','Quebra de linha',NULL),(13050,'pt_BR:permission.adminMemberBrokerings.viewMembers','Ver lista de membros (como corretor)',NULL),(13051,'pt_BR:adCategory.title.order.description','Arraste os campos para alterar a ordem',NULL),(13052,'pt_BR:sms.type.REQUEST_PAYMENT.description','SolicitaÃ§Ã£o de pagamento',NULL),(13053,'pt_BR:menu.admin.personal.mailPreferences','NotificaÃ§Ãµes por E-Mail',NULL),(13054,'pt_BR:payment.error.noTransferType','NÃ£o hÃ¡ um tipo de transaÃ§Ã£o possÃ­vel para esse pagamento.\nPor favor, contate a administraÃ§Ã£o',NULL),(13055,'pt_BR:card.action.cancel','Cancelar',NULL),(13056,'pt_BR:settings.mail.smtp','ParÃ¢metros do servidor SMTP',NULL),(13057,'pt_BR:loan.title.printDetails','Detalhes do emprÃ©stimo',NULL),(13058,'pt_BR:accountFee.chargeMode.NEGATIVE_VOLUME_PERCENTAGE','Percentual sobre volume negativo',NULL),(13059,'pt_BR:pos.assignPos.confirmation','Atribuir o POS ao membro?',NULL),(13060,'pt_BR:menu.operator.member.transactionFeedbacks','QualificaÃ§Ãµes de transaÃ§Ãµes',NULL),(13061,'pt_BR:guarantee.editGuaranteeType','Editar o tipo de garantia',NULL),(13062,'pt_BR:customizedFile.type.STATIC_FILE','EstÃ¡tico',NULL),(13063,'pt_BR:error.unknownImageType','Formato de imagem desconhecido.\nOs formatos possÃ­veis sÃ£o {0}',NULL),(13064,'pt_BR:ad.category.choose','Selecione uma categoria',NULL),(13065,'pt_BR:channel.credentials','Credenciais',NULL),(13066,'pt_BR:message.rootType.MEMBER','Membros',NULL),(13067,'pt_BR:permission.brokerMembers.managePending','Gerenciar membros pendentes',NULL),(13068,'pt_BR:permission.operatorPayments.paymentToSelf','Auto-pagamento',NULL),(13069,'pt_BR:cardType.defaultExpiration','ExpiraÃ§Ã£o',NULL),(13070,'pt_BR:loanPayment.number','NÃºmero',NULL),(13071,'pt_BR:reports.members.show_btn','Exibir relatÃ³rio',NULL),(13072,'pt_BR:settings.log.accountFeeLevel.OFF','Desligado',NULL),(13073,'pt_BR:notificationPreferences.my.title.name','OpÃ§Ãµes de notificaÃ§Ã£o',NULL),(13074,'pt_BR:permission.systemCustomFields.manage','Gerenciar',NULL),(13075,'pt_BR:permission.brokerMembers.changeProfile','Alterar perfil',NULL),(13076,'pt_BR:settings.local.maxThumbnailWidth','',NULL),(13077,'pt_BR:customField.member.error.indexingVisibility','Para incluir na busca por palavras-chave, a visibilidade do campo deve ser para \'outros membros\'',NULL),(13078,'pt_BR:smsMailing.search.noResults','NÃ£o hÃ¡ mensagens SMS de difusÃ£o',NULL),(13079,'pt_BR:customField.title.order.loanGroup','Ajustar ordem de campo customizado de grupo de emprÃ©stimos',NULL),(13080,'pt_BR:loanGroup.error.memberAlreadyInList','O membro jÃ¡ pertence ao grupo',NULL),(13081,'pt_BR:smsMailing.type.PAID','Paga',NULL),(13082,'pt_BR:accountType.nature.SYSTEM','Sistema',NULL),(13083,'pt_BR:settings.mail.subject','Assunto',NULL),(13084,'pt_BR:member.bulkActions.channelsChangedForAll','Todos os membros correspondentes ao filtro ({0}) foram alterados.',NULL),(13085,'pt_BR:invoice.from','De',NULL),(13086,'pt_BR:externalAccount.title.list','Lista de Contas Externas',NULL),(13087,'pt_BR:transactionPassword.status.user.PENDING','Pendente',NULL),(13088,'pt_BR:translationMessage.imported','O arquivo de propriedades foi importado',NULL),(13089,'pt_BR:settings.type.LOG','Config. de log',NULL),(13090,'pt_BR:ad.title.search','Procurar produtos e serviÃ§os',NULL),(13091,'pt_BR:global.datePattern.hour','hh',NULL),(13092,'pt_BR:externalAccountHistory.error.cannotMarkExternalTransferAsChecked','Apenas pagamentos com todos campos preenchidos podem ser marcados como conferidos',NULL),(13093,'pt_BR:guarantee.modified','A garantia foi alterada com sucesso',NULL),(13094,'pt_BR:payment.calculatePayments','Calcular pagamentos',NULL),(13095,'pt_BR:memberRecord.title.edit','Editar registo de {0} para {1}',NULL),(13096,'pt_BR:menu.admin.contentManagement.manageTranslation','Arquivo de traduÃ§Ã£o',NULL),(13097,'pt_BR:settings.mail.accountDetails','Detalhes da conta',NULL),(13098,'pt_BR:loan.summary.remainingAmount','Valor restante total',NULL),(13099,'pt_BR:guaranteeType.feePayers.BUYER','Comprador',NULL),(13100,'pt_BR:permission.systemTasks.onlineState','Definir a disponibilidade do sistema',NULL),(13101,'pt_BR:transactionFee.initialAmount','Valor maior ou igual a',NULL),(13102,'pt_BR:brokerCommission.action.unsuspend','Liberar',NULL),(13103,'pt_BR:transactionPassword.status.user.BLOCKED','Bloqueada',NULL),(13104,'pt_BR:customField.title.order.admin','Ajustar ordem de campo customizado de administrador',NULL),(13105,'pt_BR:customField.title.order.description','Arraste os campos para alterar a ordem',NULL),(13106,'pt_BR:currency.aRate.initValue','Valor de inicializaÃ§Ã£o do Ã­ndice-A',NULL),(13107,'pt_BR:permission.brokerMemberRecords.delete','Apagar',NULL),(13108,'pt_BR:transfer.by','Executado por',NULL),(13109,'pt_BR:brokering.title.addMember','Adicionar membro',NULL),(13110,'pt_BR:transactionFee.title.simple.modify','Modificar taxa de transaÃ§Ã£o',NULL),(13111,'pt_BR:settings.log.restFile','EndereÃ§o/nome do arquivo de log de serviÃ§os REST',NULL),(13112,'pt_BR:serviceClient.removeConfirmation','VocÃª tem certeza que deseja remover este cliente?',NULL),(13113,'pt_BR:settings.local.extra','Outros',NULL),(13114,'pt_BR:defaultBrokerCommission.updated','ConfiguraÃ§Ãµes de comissÃµes atualizadas',NULL),(13115,'pt_BR:customField.type.DECIMAL','NÃºmero decimal',NULL),(13116,'pt_BR:createOperator.password','Senha',NULL),(13117,'pt_BR:errors.email','{0} Ã© um endereÃ§o de e-mail invÃ¡lido',NULL),(13118,'pt_BR:settings.log.scheduledTaskLevel.DETAILED','ExecuÃ§Ã£o detalhada',NULL),(13119,'pt_BR:member.bulkActions.channelsNotChanged','Nenhum membro correspondente ao filtro ({0}) foi alterado.',NULL),(13120,'pt_BR:transactionFee.conditions','CondiÃ§Ãµes de aplicabilidade',NULL),(13121,'pt_BR:conversionSimulation.result.initialAmount','Valor a converter',NULL),(13122,'pt_BR:permission.systemDocuments.manage','Gerenciar',NULL),(13123,'pt_BR:permission.adminMemberBulkActions.generateCard','Gerar cartÃ£o',NULL),(13124,'pt_BR:changeGroup.admin.confirmPermanentRemove','Remover permanentemente o administrador?',NULL),(13125,'pt_BR:smsMailing.error.noMobilePhone','O membro selecionado nÃ£o possui telefone celular',NULL),(13126,'pt_BR:payment.authorizeConfirmationMessage','VocÃª estÃ¡ prestes a autorizar este pagamento.\n\nPor favor, clique em OK para confirmar',NULL),(13127,'pt_BR:authorizationLevel.error.lowerLevelAmount','O valor deste nÃ­vel nÃ£o pode ser menor que o do nÃ­vel anterior',NULL),(13128,'pt_BR:customField.possibleValue.error.removing','O valor nÃ£o foi removido porque estÃ¡ sendo usado',NULL),(13129,'pt_BR:mailPreferences.payments','Pagamentos',NULL),(13130,'pt_BR:guarantee.generatedLoan','EmprÃ©stimo',NULL),(13131,'pt_BR:reports.stats.activity.histogram.numberTransactions.title','NÃºmero de transaÃ§Ãµes por membro, histograma',NULL),(13132,'pt_BR:accountFeeLog.status.ERROR','Erro',NULL),(13133,'pt_BR:permission.adminMemberInvoices.sendAsMemberToSystem','Enviar como membro para sistema',NULL),(13134,'pt_BR:reports.stats.activity.developments.title','Progressos-chave na atividade do membro',NULL),(13135,'pt_BR:customImage.system.edit_gray','Ãcone editar vazio',NULL),(13136,'pt_BR:permission.memberMessages','Mensagens',NULL),(13137,'pt_BR:activities.transactions.numberSell','Recebidas - qtde.',NULL),(13138,'pt_BR:ad.description.onlyNew','(somente annuncios novos)',NULL),(13139,'pt_BR:permission.operatorReports.view','Visualizar relatÃ³rios de outros membros',NULL),(13140,'pt_BR:group.account.noResults','O grupo nÃ£o tem contas associadas',NULL),(13141,'pt_BR:ad.title.modify','Modificar anÃºncio',NULL),(13142,'pt_BR:reports.stats.activity.singlePeriod.numberTransactions.title','NÃºmero de transaÃ§Ãµes por membro (perÃ­odo simples)',NULL),(13143,'pt_BR:group.registrationAgreement','Termos de adesÃ£o',NULL),(13144,'pt_BR:paymentRequest.title.search','Busca de solicitaÃ§Ãµes de pagamento',NULL),(13145,'pt_BR:guaranteeType.disabled.tooltip','Tipo de garantia inativo',NULL),(13146,'pt_BR:guarantee.expiresTo','Final do vencimento',NULL),(13147,'pt_BR:transactionFee.toAllGroups','Para todos os grupos',NULL),(13148,'pt_BR:permission.systemStatus.view','Ver estado do sistema',NULL),(13149,'pt_BR:infoText.removeConfirmation','Remover esta mensagem informativa?',NULL),(13150,'pt_BR:conversionSimulation.result.input.drate','Ãndice-D aplicado',NULL),(13151,'pt_BR:reports.stats.activity.topten.numberTransactions.title','Os dez maiores em transaÃ§Ãµes por membro',NULL),(13152,'pt_BR:settings.local.language.CZECH','Tcheco',NULL),(13153,'pt_BR:permission.systemAccounts','Contas',NULL),(13154,'pt_BR:reference.paymentsAwaitingFeedback.noResults','No momento nÃ£o hÃ¡ pagamentos necessitando de qualificaÃ§Ã£o',NULL),(13155,'pt_BR:certificationLog.status','Estado',NULL),(13156,'pt_BR:payment.confirmation.appliedFees','Taxas aplicadas',NULL),(13157,'pt_BR:settings.message.newCommissionContract','Novo contrato de comissÃ£o',NULL),(13158,'pt_BR:activities.references.received','Recebida',NULL),(13159,'pt_BR:guarantee.status.CANCELLED','Cancelada',NULL),(13160,'pt_BR:adImport.newCategories','Novas categorias',NULL),(13161,'pt_BR:group.customizedFiles.title.modify','Modificar arquivo customizado para {0}',NULL),(13162,'pt_BR:loanPayment.summary.inProcessPayments','Parcelas em processo',NULL),(13163,'pt_BR:reports.stats.activity.throughTime.grossProduct.col4','no. Todos',NULL),(13164,'pt_BR:reports.stats.activity.throughTime.grossProduct.col3','no. com entrada',NULL),(13165,'pt_BR:guaranteeType.feeType.FIXED','Fixo',NULL),(13166,'pt_BR:reports.stats.activity.throughTime.grossProduct.col2','Produto bruto todos',NULL),(13167,'pt_BR:accountFeeLog.failedMembers','Erros',NULL),(13168,'pt_BR:reports.stats.activity.throughTime.grossProduct.col1','Produto bruto membros com entradas',NULL),(13169,'pt_BR:loan.repayment.repay','Pagar',NULL),(13170,'pt_BR:reference.title.given','ReferÃªncias dadas por {0}',NULL),(13171,'pt_BR:receipt.transfer.scheduledFor','Agendado para: {0}',NULL),(13172,'pt_BR:group.title.modify.broker','ConfiguraÃ§Ãµes de grupo de corretores',NULL),(13173,'pt_BR:payment.confirmation.header.scheduled','VocÃª estÃ¡ prestes a agendar o seguinte pagamento:',NULL),(13174,'pt_BR:permission.adminMemberInvoices.deny','Rejeitar fatura eletrÃ´nica',NULL),(13175,'pt_BR:externalAccount.title.insert','Inserir conta externa',NULL),(13176,'pt_BR:card.activated','CartÃ£o ativado',NULL),(13177,'pt_BR:externalTransfer.type','Tipo',NULL),(13178,'pt_BR:permission.memberCards.unblock','Desbloquear',NULL),(13179,'pt_BR:settings.message.certificationStatusChanged','Estado da certificaÃ§Ã£o alterado',NULL),(13180,'pt_BR:group.settings.maxAdPublicationTime.field','Tempo mÃ¡x. de publicaÃ§Ã£o do anÃºncio (unid.)',NULL),(13181,'pt_BR:transfer.transactionNumber','NÃºmero da transaÃ§Ã£o',NULL),(13182,'pt_BR:settings.neverExpiresMessage','0 nunca vence',NULL),(13183,'pt_BR:message.action.choose','Executar aÃ§Ã£o com as mensagens selecionadas',NULL),(13184,'pt_BR:invoice.status.OPEN','Aberta',NULL),(13185,'pt_BR:error.queryParse','VocÃª informou palavras-chave invÃ¡lidas para a pesquisa',NULL),(13186,'pt_BR:cardLog.by','Alterado por',NULL),(13187,'pt_BR:errorLog.removed','Os erros selecionados foram removidos',NULL),(13188,'pt_BR:errors.invalid','{0} Ã© invÃ¡lido',NULL),(13189,'pt_BR:customField.title.order.operator','Ajustar ordem de campo customizado de operador',NULL),(13190,'pt_BR:transactionFee.subject.FIXED_MEMBER','Membro fixo',NULL),(13191,'pt_BR:smsMailing.date','Data',NULL),(13192,'pt_BR:conversionSimulation.account','Conta',NULL),(13193,'pt_BR:error.ajax','Houve um erro durante o processamento de sua solicitaÃ§Ã£o',NULL),(13194,'pt_BR:loanGroup.action.viewLoans','Ver emprÃ©stimos',NULL),(13195,'pt_BR:permission.adminMemberInvoices.acceptAsMemberFromSystem','Aceitar fatura eletrÃ´nica de sistema como membro',NULL),(13196,'pt_BR:customImage.title.custom','Imagens customizadas',NULL),(13197,'pt_BR:alert.system.adminLoginBlockedByPermissionDenieds',' O acesso do administrador \'{0}\' ao sistema estÃ¡ temporariamente bloqueado por exceder o mÃ¡ximo de permissÃµes negadas. O endereÃ§o IP Ã© {2}',NULL),(13198,'pt_BR:alert.member.LOGIN_BLOCKED_BY_PERMISSION_DENIEDS','O mÃ¡ximo de permissÃµes negadas foi alcanÃ§ado por um membro',NULL),(13199,'pt_BR:customField.possibleValue.value','Valor',NULL),(13200,'pt_BR:reference.level','Valor',NULL),(13201,'pt_BR:transfer.scheduledFor','Agendado para',NULL),(13202,'pt_BR:rates.reinit.maintainLast','Manter configuraÃ§Ãµes anteriores',NULL),(13203,'pt_BR:permission.brokerMessages.manage','Gerenciar',NULL),(13204,'pt_BR:reference.transactionFeedback.role.BUYER','Pagamentos realizados',NULL),(13205,'pt_BR:brokerCommissionContract.acceptConfirmation','Aceitar este contrato de comissÃ£o de corretor?',NULL),(13206,'pt_BR:customField.payment.type','Tipo',NULL),(13207,'pt_BR:guaranteeType.description','DescriÃ§Ã£o',NULL),(13208,'pt_BR:login.action.loginAsOperator','Acessar como operator',NULL),(13209,'pt_BR:permission.memberProfile.changeUsername','Alterar o prÃ³prio nome de usuÃ¡rio',NULL),(13210,'pt_BR:profile.member.brokerLink','Abrir perfil',NULL),(13211,'pt_BR:image.file','Arquivo',NULL),(13212,'pt_BR:loanGroup.title.insert','Novo grupo de emprÃ©stimos',NULL),(13213,'pt_BR:loan.paymentCount','NÃºmero de parcelas',NULL),(13214,'pt_BR:externalTransferImport.error.format.general','Erro ao importar transaÃ§Ãµes: {0}',NULL),(13215,'pt_BR:reports.current.n_actvads','NÃºmero de anÃºncios ativos',NULL),(13216,'pt_BR:payment.error.pendingCommissionContract','O pagamento nÃ£o pÃ´de ser processado porque hÃ¡ um contrato de commissÃ£o pendente relativo Ã  comissÃ£o: {0}',NULL),(13217,'pt_BR:pos.blockPos.confirmation','Bloquear o POS?',NULL),(13218,'pt_BR:message.reply.subject','Re: {0}',NULL),(13219,'pt_BR:permission.systemGroupFilters.view','Ver',NULL),(13220,'pt_BR:message.action.MOVE_TO_TRASH','Enviar para a lixeira',NULL),(13221,'pt_BR:payment.action.deny','Negar',NULL),(13222,'pt_BR:menu.member.help','Ajuda',NULL),(13223,'pt_BR:message.rootType','Tipo',NULL),(13224,'pt_BR:conversionSimulation.result.graph.subtitle','Valor da conversÃ£o: {0}',NULL),(13225,'pt_BR:activities.transactions.last30Days','TransaÃ§Ãµes nos Ãºltimos 30 dias',NULL),(13226,'pt_BR:fieldMapping.field.MEMBER_USERNAME','Nome de usuÃ¡rio',NULL),(13227,'pt_BR:fileMapping.decimalSeparator.error.required','Separador decimal Ã© necessÃ¡rio',NULL),(13228,'pt_BR:errors.periodInvalidBounds','A data de inÃ­cio de {0} deve ser menor que a de final',NULL),(13229,'pt_BR:invoice.title.of','Faturas eletrÃ´nicas de {0}',NULL),(13230,'pt_BR:fieldMapping.order','Ordem',NULL),(13231,'pt_BR:permission.brokerAccounts.scheduledInformation','Ver pagamentos agendados',NULL),(13232,'pt_BR:error.aRateParameters.noFutureInitEmission','Valor inicial e data levarÃ£o a datas de emissÃ£o futuras, o que nÃ£o Ã© permitido.',NULL),(13233,'pt_BR:externalAccount.systemAccount','Conta de sistema',NULL),(13234,'pt_BR:settings.message.buyerOnlyGuaranteeStatusChanged','Estado da garantia (apenas com comprador) alterado',NULL),(13235,'pt_BR:group.initialGroup','Grupo inicial',NULL),(13236,'pt_BR:reports.stats.activity.paymentFilterRequired','Para exibir essas estatÃ­sticas, Ã© preciso haver pelo menos um filtro de pagamentos',NULL),(13237,'pt_BR:changeBroker.old','Corretor anterior',NULL),(13238,'pt_BR:cardType.cardSecurityCode','CÃ³digo de seguranÃ§a',NULL),(13239,'pt_BR:settings.message.loanGranted','EmprÃ©stimo concedido',NULL),(13240,'pt_BR:adCategory.error.removing','A categoria nÃ£o pode ser removida.\n\nProvavelmente hÃ¡ anÃºncios que pertenÃ§am a ela',NULL),(13241,'pt_BR:document.name','Nome',NULL),(13242,'pt_BR:reference.title.transactionFeedbacks.of','QualificaÃ§Ãµes de transaÃ§Ãµes de {0}',NULL),(13243,'pt_BR:createMember.initialGroup.title','SeleÃ§Ã£o de grupo',NULL),(13244,'pt_BR:contact.removed','O contato foi removido',NULL),(13245,'pt_BR:permission.module.type.OPERATOR','PermissÃµes de operador de {0}',NULL),(13246,'pt_BR:invoice.title.my','Minhas faturas eletrÃ´nicas',NULL),(13247,'pt_BR:menu.operator.member.activities','RelatÃ³rios',NULL),(13248,'pt_BR:reference.title.summary.references.of','ReferÃªncias de {0}',NULL),(13249,'pt_BR:permission.adminMemberPos.changePin','Alterar senha externa',NULL),(13250,'pt_BR:ad.search.tradeType.OFFER','Oferta',NULL),(13251,'pt_BR:reports.stats.show','Exibir',NULL),(13252,'pt_BR:createMember.public.alreadyExists','O nome de login jÃ¡ estÃ¡ em uso, por favor escolha outro nome.',NULL),(13253,'pt_BR:message.actionPerformed.DELETE','As mensagens selecionadas foram removidas',NULL),(13254,'pt_BR:reports.stats.activity.throughTime.percentageNoTrade.title','Percentual de membros nÃ£o transacionando ao longo do tempo',NULL),(13255,'pt_BR:permission.systemExternalAccounts.check','Conferir pagamento',NULL),(13256,'pt_BR:menu.admin.settings.adminTasks','Tarefas de sistema',NULL),(13257,'pt_BR:reports.nocheckboxes','VocÃª nÃ£o selecionou nenhuma opÃ§Ã£o, nÃ£o hÃ¡ nada para exibir',NULL),(13258,'pt_BR:changeGroup.confirmRemove','Alterar um membro para o grupo {0} irÃ¡ remover\n\ntodos os anÃºncios, contatos e referÃªncias dele.\n\nVocÃª tem certeza?',NULL),(13259,'pt_BR:alert.member.DENIED_INVOICES','O membro negou muitas faturas',NULL),(13260,'pt_BR:message.sendTo.ADMIN','AdministraÃ§Ã£o',NULL),(13261,'pt_BR:reports.stats.keydevelopments.averageAmountPerTransaction','Valor mÃ©diano por transaÃ§Ã£o',NULL),(13262,'pt_BR:serviceClient.permissions','PermissÃµes',NULL),(13263,'pt_BR:reports.stats.mockwarning','ATENÃ‡ÃƒO: esses sÃ£o dados simulados. EstatÃ­sticas reais serÃ£o fornecidas em uma atualizaÃ§Ã£o futura.',NULL),(13264,'pt_BR:smsMailing.mailingType.PAID_TO_GROUP','DifusÃ£o paga para grupo',NULL),(13265,'pt_BR:loanGroup.removeMemberConfirmation','Remover este membro do grupo de emprÃ©stimos?',NULL),(13266,'pt_BR:reports.stats.activity.histogram.numberTransactions.xAxis','NÃºmero de transaÃ§Ãµes',NULL),(13267,'pt_BR:message.type.ACCESS','Acesso',NULL),(13268,'pt_BR:permission.adminMemberAccess.transactionPassword','Gerenciar senha de transaÃ§Ã£o',NULL),(13269,'pt_BR:reports.stats.activity.comparePeriods.loginTimes.yAxis','Acessos / membro',NULL),(13270,'pt_BR:reports.stats.finances.ThroughTime.expenditure.title','SaÃ­da (atravÃ©s do tempo)',NULL),(13271,'pt_BR:permission.brokerAds.manage','Gerenciar',NULL),(13272,'pt_BR:reports.stats.activity.singlePeriod.loginTimes.title','Acessos por membro (perÃ­odo simples)',NULL),(13273,'pt_BR:permission.adminMemberAccess.changePassword','Alterar senha de acesso',NULL),(13274,'pt_BR:channel.displayName','Nome de exibiÃ§Ã£o',NULL),(13275,'pt_BR:reports.current.number_open_loans','NÃºmero de emprÃ©stimos em aberto',NULL),(13276,'pt_BR:menu.member.account.systemPayment','Pagamento para o sistema',NULL),(13277,'pt_BR:brokerCommissionContract.startDate.from','Iniciando a partir de',NULL),(13278,'pt_BR:loan.repayment.remainingAmount','Valor restante',NULL),(13279,'pt_BR:profile.action.memberInfoActions','InformaÃ§Ãµes de membro',NULL),(13280,'pt_BR:authorizationLevel.error.adminGroupRequired','Se o autorizador for um administrador, Ã© necessÃ¡rio escolher um grupo de administradores',NULL),(13281,'pt_BR:guarantee.expirationTimeForIssuer','Vencimento para o vendedor',NULL),(13282,'pt_BR:permission.module.type.BASIC','PermissÃµes bÃ¡sicas de {0}',NULL),(13283,'pt_BR:permission.adminMemberInvoices.sendAsMember','Enviar fatura eletrÃ´nica como membro',NULL),(13284,'pt_BR:contact.title.edit','Editar nota de contato',NULL),(13285,'pt_BR:errors.periodEndRequired','A data de fim de {0} Ã© obrigatÃ³ria',NULL),(13286,'pt_BR:guaranteeType.issueFee.readonly','Somente de leitura',NULL),(13287,'pt_BR:rates.reinit.type','Tipo',NULL),(13288,'pt_BR:reports.members_reports.account_type.selectAccountTypes','Selecione os tipos de conta',NULL),(13289,'pt_BR:pos.created','O POS foi criado',NULL),(13290,'pt_BR:fieldMapping.field.AMOUNT','Valor do pagamento',NULL),(13291,'pt_BR:settings.message.adminNewMember','Novo membro cadastrado',NULL),(13292,'pt_BR:alert.member.expiredLoan','EmprÃ©stimo vencido',NULL),(13293,'pt_BR:guarantee.buyer','Comprador',NULL),(13294,'pt_BR:permission.operatorInvoices.view','Visualizar',NULL),(13295,'pt_BR:global.select.empty','Selecione',NULL),(13296,'pt_BR:adImport.status.PUBLICATION_BEGIN_AFTER_END','A data de inÃ­cio de publicaÃ§Ã£o Ã© apÃ³s a data de fim',NULL),(13297,'pt_BR:admin.adminName','Nome do administrador',NULL),(13298,'pt_BR:payment.title.systemMemberToSystem','Pagamento do membro {0} para o sistema',NULL),(13299,'pt_BR:alert.system.NULL_IRATE','Ãndice-I nulo inexperado encontrado',NULL),(13300,'pt_BR:accountHistory.conciliation.conciliated','Conciliado',NULL),(13301,'pt_BR:currency.title.list','Moedas',NULL),(13302,'pt_BR:memberRecordType.fields.action.new','Inserir novo campo customizado',NULL),(13303,'pt_BR:errors.required','{0} Ã© requerido',NULL),(13304,'pt_BR:theme.action.remove','Remover',NULL),(13305,'pt_BR:externalTransfer.removed','TransferÃªncia external removida',NULL),(13306,'pt_BR:errorLog.search.noResults','Nenhum erro encontrado',NULL),(13307,'pt_BR:menu.member.account.systemInvoice','Fatura para o sistema',NULL),(13308,'pt_BR:memberPos.changePin.confirmation','Alterar o PIN?',NULL),(13309,'pt_BR:smsMailing.member','Membro',NULL),(13310,'pt_BR:group.nature.ADMIN','Administrador',NULL),(13311,'pt_BR:paymentObligation.removed','A obrigaÃ§Ã£o de pagamento foi excluÃ­da',NULL),(13312,'pt_BR:guaranteeType.registerGuarantee','Criar garantia',NULL),(13313,'pt_BR:profile.action.manageLoans','Ver emprÃ©stimos',NULL),(13314,'pt_BR:errorLog.title.view','Erros de aplicaÃ§Ã£o',NULL),(13315,'pt_BR:menu.admin.accessDevices.cards.search','Busca cartÃµes',NULL),(13316,'pt_BR:customizedFile.title.customize.help','Personalizar arquivo de ajuda',NULL),(13317,'pt_BR:message.type.FROM_MEMBER','Mensagens de membros',NULL),(13318,'pt_BR:customImage.system.quickAccess_searchAds','Acesso rÃ¡pido: procurar anÃºncios',NULL),(13319,'pt_BR:reports.simulations.aRateConfigSimulation.transferType','Tipo de transaÃ§Ã£o (para valores padrÃ£o)',NULL),(13320,'pt_BR:changeGroup.error.move.hasOpenLoans','O membro nÃ£o pode ser movido porque possui emprÃ©stimos nÃ£o pagos',NULL),(13321,'pt_BR:permission.adminMemberDocuments.manageStatic','Gerenciar documentos estÃ¡ticos',NULL),(13322,'pt_BR:alert.member.SCHEDULED_PAYMENT_FAILED','Falha em pagamento agendado',NULL),(13323,'pt_BR:help.title.profiles','Perfil',NULL),(13324,'pt_BR:receiptPrinterSettings.helpMessage','O nome da impressora local deve ser o nome exato de uma impressora configurada no sistema operacional como genÃ©rica / somente texto ou como \'raw queue\', dependendo do sistema operacional.\nOs comandos de inÃ­cio e fim de documento dependem da marca / modelo da impressora. Eles sÃ£o Ãºteis, por exemplo, para cortar o papel ou emitir um alerta sonoro apÃ³s a impressÃ£o. Para enviar caracteres ASCII especÃ­ficos, utilize #cÃ³digo. Por exemplo, para o caractere ASCII 100, use #100. Como exemplo, impressoras de recibo Epson utilizam a sequÃªncia #27#105 para cortar o papel. Para quebras de linha, use &#92;n. Algumas impressoras precisam de algumas quebras de linha antes do corte de papel.\nPara mais detalhes, <a href=\"{0}\">clique aqui</a>.',NULL),(13325,'pt_BR:memberRecord.by','Criado por',NULL),(13326,'pt_BR:menu.member.personal.transactionFeedbacks','QualificaÃ§Ãµes de transaÃ§Ãµes',NULL),(13327,'pt_BR:alert.system.RATE_INITIALIZATION_FINISHED','Tarefa de reinicializaÃ§Ã£o de indices finalizada',NULL),(13328,'pt_BR:permission.adminAdminRemarks.manage','Gerenciar',NULL),(13329,'pt_BR:errorLog.date','Data',NULL),(13330,'pt_BR:ad.title.print','Resultado da busca de anÃºncios',NULL),(13331,'pt_BR:help.title.member_records','Registros de membros',NULL),(13332,'pt_BR:loanGroup.action.create','Criar grupo de emprÃ©stimos',NULL),(13333,'pt_BR:brokerCommissionContract.status.CANCELLED','Cancelado',NULL),(13334,'pt_BR:message.error.emailNotSent','O membro nÃ£o pÃ´de receber a mensagem por problemas no envio de e-mail',NULL),(13335,'pt_BR:reports.current.loans','EmprÃ©stimos',NULL),(13336,'pt_BR:settings.message.value','Valor',NULL),(13337,'pt_BR:menu.admin.bookkeeping','Contabilidade',NULL),(13338,'pt_BR:mobile.home.reservedAmount','Reservado: {0}',NULL),(13339,'pt_BR:reports.stats.finances.singlePeriod.income','Entrada',NULL),(13340,'pt_BR:permission.memberGuarantees.buyWithPaymentObligations','Comprar com obrigaÃ§Ãµes de pagamento',NULL),(13341,'pt_BR:payment.title.memberToSelf','TransferÃªncia entre minhas contas',NULL),(13342,'pt_BR:permission.memberDocuments.view','Ver',NULL),(13343,'pt_BR:brokering.notes','Notas',NULL),(13344,'pt_BR:settings.access.administrationWhitelist','Whitelist para acesso Ã  administraÃ§Ã£o',NULL),(13345,'pt_BR:menu.member.account','Conta',NULL),(13346,'pt_BR:infoText.noMatch','NÃ£o foi encontrada nenhuma mensagem informativa que corresponda aos critÃ©rios especificados.',NULL),(13347,'pt_BR:guaranteeType.error.forwardTransferType','O tipo de pagamento para o encaminhamento Ã© obrigatÃ³rio',NULL),(13348,'pt_BR:invite.message','Digite um endereÃ§o de e-mail, essa pessoa receberÃ¡ um convite para experimentar o sistema',NULL),(13349,'pt_BR:document.modified','O documento foi modificado',NULL),(13350,'pt_BR:reports.stats.finances.singlePeriod.overview','VisÃ£o geral',NULL),(13351,'pt_BR:account.defaultUpperCreditLimit','Limite de crÃ©dito superior',NULL),(13352,'pt_BR:adInterest.type.OFFER','Oferta',NULL),(13353,'pt_BR:loan.repayment.setDate','Data retroativa',NULL),(13354,'pt_BR:loan.title.print','Resultado da busca de emprÃ©stimos',NULL),(13355,'pt_BR:group.account.action.new','Associar nova conta',NULL),(13356,'pt_BR:groupFilter.customizedFiles.action.new','Personalizar novo arquivo',NULL),(13357,'pt_BR:paymentRequest.error.sending','A solicitaÃ§Ã£o de pagamento nao pÃ´de ser enviada',NULL),(13358,'pt_BR:reports.stats.keydevelopments.throughTime.selectQuarters','Selecione trimestres e anos',NULL),(13359,'pt_BR:profile.action.records','Registros',NULL),(13360,'pt_BR:settings.local.maxIteratorResults','No. max. de linhas nos relatÃ³rios',NULL),(13361,'pt_BR:adCategory.modified','A categoria foi modificada',NULL),(13362,'pt_BR:customField.control.RICH_EDITOR','Editor de texto formatado',NULL),(13363,'pt_BR:permission.brokerMemberAccess.changePin','Alterar senha externa',NULL),(13364,'pt_BR:createMember.title.byBroker','Corretagem - Criar novo membro',NULL),(13365,'pt_BR:reports.stats.finances.overview','VisÃ£o geral',NULL),(13366,'pt_BR:permission.systemCustomizedFiles.manage','Gerenciar',NULL),(13367,'pt_BR:brokerCommission.error.suspending','Erro suspendendo a commissÃ£o de corretor!',NULL),(13368,'pt_BR:settings.local.language.CHINESE_SIMPLIFIED','ChinÃªs (Simplificado)',NULL),(13369,'pt_BR:menu.operator.account.loanGroups','Grupos de EmprÃ©stimo',NULL),(13370,'pt_BR:transactionFee.subject.DESTINATION_BROKER','Corretor do membro que estÃ¡ recebendo (destino)',NULL),(13371,'pt_BR:smsLog.free','Gratuito',NULL),(13372,'pt_BR:reports.simulations.dRate.config.graph.title','Curva da configuraÃ§Ã£o do Ãndice-D',NULL),(13373,'pt_BR:settings.message.sentInvoiceExpired','Fatura eletrÃ´nica enviada expirada',NULL),(13374,'pt_BR:notificationPreferences.sms','SMS',NULL),(13375,'pt_BR:receipt.posweb.transactions.header','{0} TransaÃ§Ãµes',NULL),(13376,'pt_BR:messageCategory.error.removing','A categoria de mensagem nÃ£o pÃ´de ser removida pois existem mensagens com essa categoria',NULL),(13377,'pt_BR:loan.expirationFeeRepaymentType','Tipo de pagamento para taxa de vencimento',NULL),(13378,'pt_BR:group.nature.BROKER','Corretor',NULL),(13379,'pt_BR:reports.stats.keydevelopments.highestAmountPerTransaction.title','Progressos no maior valor por transaÃ§Ã£o',NULL),(13380,'pt_BR:group.settings.passwordExpiresAfter','Senha de acesso vencerÃ¡ apÃ³s',NULL),(13381,'pt_BR:admin.name','Nome',NULL),(13382,'pt_BR:permission.systemLoanGroups.manage','Gerenciar',NULL),(13383,'pt_BR:permission.systemThemes.select','Selecionar',NULL),(13384,'pt_BR:memberRecordType.description','DescriÃ§Ã£o',NULL),(13385,'pt_BR:payment.awaitingAuthorization','O pagamento foi submetido Ã  autorizaÃ§Ã£o.\n Ele ficarÃ¡ com o estado de pendente atÃ© que seja autorizado e processado.',NULL),(13386,'pt_BR:login.password','Senha',NULL),(13387,'pt_BR:guaranteeType.model.WITH_BUYER_ONLY','Somente com comprador',NULL),(13388,'pt_BR:permission.brokerSmsMailings.paidSmsMailings','Enviar mensagens de difusÃ£o pagas',NULL),(13389,'pt_BR:externalTransferImport.title.search','Busca de imporaÃ§Ãµes de {0}',NULL),(13390,'pt_BR:transferType.isLoan','Ã‰ emprÃ©stimo',NULL),(13391,'pt_BR:createMember.forceChangePassword','ForÃ§ar que seja alterada no primeiro login',NULL),(13392,'pt_BR:customImage.name','Nome',NULL),(13393,'pt_BR:sms.type.HELP','Ajuda',NULL),(13394,'pt_BR:externalTransferType.title.modify','Modificar tipo de pagamento',NULL),(13395,'pt_BR:reports.stats.general.comparePeriods','Comparar dois perÃ­odos',NULL),(13396,'pt_BR:changeGroup.action.changeGroup','Alterar grupo',NULL),(13397,'pt_BR:reports.members_reports.details_level.TRANSACTIONS','TransaÃ§Ãµes',NULL),(13398,'pt_BR:createMember.action.saveAndNew','Salvar e inserir novo membro',NULL),(13399,'pt_BR:permission.systemExternalAccounts.processPayment','Processar pagamentos',NULL),(13400,'pt_BR:createMember.assignBroker','Atribuir corretor',NULL),(13401,'pt_BR:profile.pendingEmail.link','Reenviar o e-mail de verificaÃ§Ã£o',NULL),(13402,'pt_BR:home.status.hasPendingCommissionContracts','HÃ¡ contratos de comissÃ£o pendentes. VocÃª nÃ£o poderÃ¡ fazer pagamentos enquanto estiverem pendentes',NULL),(13403,'pt_BR:message.type.LOAN','Eventos de emprÃ©stimo',NULL),(13404,'pt_BR:customField.type','Tipo de dado',NULL),(13405,'pt_BR:mobile.viewPayments.transactionNumber','Num. da TransaÃ§Ã£o',NULL),(13406,'pt_BR:pendingMember.emailResent','O e-mail de validaÃ§Ã£o foi re-enviado',NULL),(13407,'pt_BR:global.tooltip.permissions','Editar permissÃµes',NULL),(13408,'pt_BR:ad.id','Identificador',NULL),(13409,'pt_BR:loanPayment.status.EXPIRED','Vencido',NULL),(13410,'pt_BR:customImage.system.dropdown','Ãcone de menu suspenso',NULL),(13411,'pt_BR:permission.systemPayments.cancel','Cancelar',NULL),(13412,'pt_BR:payment.authorize.transactionPassword','Para autorizar ou negar este pagamento, vocÃª deve fornecer sua senha de transaÃ§Ã£o',NULL),(13413,'pt_BR:reports.stats.finances.keyParams','ParÃ¢metros chave para estatÃ­sticas financeiras',NULL),(13414,'pt_BR:settings.local.csv.stringQuote.SINGLE_QUOTE','Aspas simples',NULL),(13415,'pt_BR:fileMapping.numberFormat.WITH_SEPARATOR','Com separador',NULL),(13416,'pt_BR:permission.memberProfile.view','Ver',NULL),(13417,'pt_BR:transactionPassword.status.user.NEVER_CREATED','NÃ£o gerada',NULL),(13418,'pt_BR:image.details.drag.hint','Arraste as imagens para ajustar ordem e preencha a legenda nos campos',NULL),(13419,'pt_BR:settings.message.commissionContractCancelled','Contrato de comissÃ£o cancelado',NULL),(13420,'pt_BR:changeGroup.error.remove.activeOperator','O operador nÃ£o pode ser permanentemente removido porque ele jÃ¡ esteve ativo no sistema.\nTente move-lo para um grupo com o estado Removido',NULL),(13421,'pt_BR:settings.log.transactionLevel.OFF','Desligado',NULL),(13422,'pt_BR:invoice.cancelled','A fatura eletrÃ´nica foi cancelada',NULL),(13423,'pt_BR:connectedUsers.remoteAddress','EndereÃ§o IP',NULL),(13424,'pt_BR:global.back','Voltar',NULL),(13425,'pt_BR:reports.stats.keydevelopments.numberOfMembers.numberOfMembers','NÃºmero de membros',NULL),(13426,'pt_BR:alert.system.adminLoginBlockedByTries','O acesso do administrador \'{0}\' estÃ¡ temporariamente bloqueado por exceder a quantidade mÃ¡xima de tentativas. O endereÃ§o IP remoto Ã© {2}',NULL),(13427,'pt_BR:webshop.payment.enterPasswordText','Senha',NULL),(13428,'pt_BR:permission.brokerAds.view','Ver',NULL),(13429,'pt_BR:registrationAgreement.title.modify','Modificar termo de adesÃ£o',NULL),(13430,'pt_BR:paymentObligation.expiration','Vencimento',NULL),(13431,'pt_BR:changeGroup.member.confirmPermanentRemove','Remover permanentemente o membro?',NULL),(13432,'pt_BR:element.search.keywords','Palavras-chave',NULL),(13433,'pt_BR:menu.admin.contentManagement.styleImages','Imagens de folha de estilo',NULL),(13434,'pt_BR:menu.member.account.transfersAuthorizations','Busca de autorizaÃ§Ãµes',NULL),(13435,'pt_BR:customField.member.access.MEMBER','Membro',NULL),(13436,'pt_BR:menu.admin.messages.infoTexts','Mensagens informativas',NULL),(13437,'pt_BR:permission.operatorReports.viewMember','Visualizar meus relatÃ³rios',NULL),(13438,'pt_BR:transferType.availability.SELF_PAYMENT','Auto-pagamento',NULL),(13439,'pt_BR:menu.operator.guarantees.searchGuarantees','Garantias',NULL),(13440,'pt_BR:global.range.from','De',NULL),(13441,'pt_BR:menu.admin.translation.internalMessages','NotificaÃ§Ãµes',NULL),(13442,'pt_BR:channel.enableSMS','Confire a configuraÃ§Ã£o do canal SMS em',NULL),(13443,'pt_BR:changePassword.error.mustIncludeLettersNumbersSpecial','A senha deve conter letras, nÃºmeros e caracteres especiais',NULL),(13444,'pt_BR:permission.memberPayments.ticket','Gerar tickets de pagamento externo',NULL),(13445,'pt_BR:settings.message.commissionContractDenied','Contrato de comissÃ£o negado',NULL),(13446,'pt_BR:externalAccountHistory.button.newPayment','Novo pagamento',NULL),(13447,'pt_BR:group.settings.passwordLength.min','Tamanho mÃ­n. da senha',NULL),(13448,'pt_BR:guaranteeType.creditFeeTransferType','Taxa de crÃ©dito',NULL),(13449,'pt_BR:scheduledPayment.title.transfers','Parcelas do pagamento agendado',NULL),(13450,'pt_BR:menu.member.personal.pos.memberPos','Dispositivos POS',NULL),(13451,'pt_BR:payment.cancelOrDeny.transactionPassword','Para cancelar ou negar este pagamento, vocÃª deve fornecer sua senha de transaÃ§Ã£o',NULL),(13452,'pt_BR:rates.error.rateNotEnabledForInit','VocÃª tentou inicializar um indice, mas este indice nÃ£o esta ativado. VocÃª deve primeiramente ativalo na moeda.',NULL),(13453,'pt_BR:reports.transactions_report.number','NÃºmero',NULL),(13454,'pt_BR:paymentObligation.error.certificationActiveNotExists','NÃ£o foi possÃ­vel criar uma obrigaÃ§Ã£o de pagamento. VocÃª nÃ£o possui nenhuma certificaÃ§Ã£o ativa em {0}.',NULL),(13455,'pt_BR:member.member','Membro',NULL),(13456,'pt_BR:permission.brokerMembers.manageDefaults','Gerenciar comissÃµes padrÃµes',NULL),(13457,'pt_BR:menu.operator.member','Operacao de Membros',NULL),(13458,'pt_BR:transactionFee.h','Porcentagem mÃ¡xima',NULL),(13459,'pt_BR:card.actions','AÃ§Ãµes',NULL),(13460,'pt_BR:loan.discarded','O descarte foi processado com sucesso',NULL),(13461,'pt_BR:menu.operator.account.systemPayment','Pagamento para o Sistema',NULL),(13462,'pt_BR:guaranteeType.issueFee','Taxa de emissÃ£o',NULL),(13463,'pt_BR:memberImport.initialDebits','DÃ©bitos',NULL),(13464,'pt_BR:transactionPassword.title','Senha de transaÃ§Ã£o',NULL),(13465,'pt_BR:settings.message.invoiceReceived','Fatura eletrÃ´nica recebida',NULL),(13466,'pt_BR:message.type.AD_INTEREST','Interesse em anÃºncios',NULL),(13467,'pt_BR:permission.adminMemberSmsMailings.view','Ver',NULL),(13468,'pt_BR:reports.stats.period.periodMain','PerÃ­odo principal',NULL),(13469,'pt_BR:infoText.title.search','Procurar mensagem informativa',NULL),(13470,'pt_BR:menu.admin.usersGroups.messageToGroups','Mensagem para grupo',NULL),(13471,'pt_BR:settings.local.language.FRENCH','FrancÃªs',NULL),(13472,'pt_BR:theme.removed','O tema foi removido',NULL),(13473,'pt_BR:adImport.status.UNKNOWN_ERROR','Erro desconhecido',NULL),(13474,'pt_BR:guaranteeLog.status','Estado',NULL),(13475,'pt_BR:changePassword.passwordLength','Escolha uma senha com {0} caracteres',NULL),(13476,'pt_BR:reports.members_reports.incoming','De entrada',NULL),(13477,'pt_BR:reports.stats.general.submit','Exibir estatÃ­stica',NULL),(13478,'pt_BR:mailPreferences.guarantees','Garantias',NULL),(13479,'pt_BR:permission.adminAdminRecords.view','Ver',NULL),(13480,'pt_BR:reports.simulations.dRateConfigSimulation.startD','Iniciar a partir de D =',NULL),(13481,'pt_BR:creditLimit.upper','Superior',NULL),(13482,'pt_BR:quickAccess.placeAd','Publicar anÃºncio',NULL),(13483,'pt_BR:permission.systemAccounts.information','Ver informaÃ§Ãµes de contas de sistema',NULL),(13484,'pt_BR:guarantee.action.deny','Negar',NULL),(13485,'pt_BR:reports.members_reports.transactions.accountTypesRequired','Ã‰ necessÃ¡rio selecionar pelo menos um tipo de conta',NULL),(13486,'pt_BR:reports.simulations.dRateConfigSimulation.title','SimulaÃ§Ã£o da configuraÃ§Ã£o do Ã­ndice-D',NULL),(13487,'pt_BR:help.title.guarantees','Garantias',NULL),(13488,'pt_BR:menu.member.personal.messages','Mensagens',NULL),(13489,'pt_BR:reports.stats.keydevelopments.title','EstatÃ­sticas de progressos-chave',NULL),(13490,'pt_BR:memberImport.status.BALANCE_UPPER_THAN_CREDIT_LIMIT','O saldo Ã© superior ao limite de crÃ©dito',NULL),(13491,'pt_BR:menu.admin.contentManagement.customImages','Imagens customizadas',NULL),(13492,'pt_BR:customField.control.CHECKBOX','Caixa de seleÃ§Ã£o',NULL),(13493,'pt_BR:theme.message.import','Importar tema a partir de um arquivo',NULL),(13494,'pt_BR:reference.title.received','ReferÃªncias recebidas por {0}',NULL),(13495,'pt_BR:alert.system.ERROR_PROCESSING_ACCOUNT_STATUS','Erro crÃ­tico no processamento do estado de conta',NULL),(13496,'pt_BR:menu.operator.account.systemInvoice','Fatura para o Sistema',NULL),(13497,'pt_BR:card.blockCard.confirmation','Bloquear cartÃ£o?',NULL),(13498,'pt_BR:permission.systemExternalAccounts.checkPayment','Conferir pagamento',NULL),(13499,'pt_BR:permission.adminMemberAccounts.information','Ver informaÃ§Ãµes',NULL),(13500,'pt_BR:category.name','Nome',NULL),(13501,'pt_BR:brokering.error.memberAlreadyInBrokering','O membro jÃ¡ Ã© agenciado por este corretor',NULL),(13502,'pt_BR:member.bulkActions.generateCard','Gerar cartÃ£o',NULL),(13503,'pt_BR:paymentObligation.buyerUsername','UsuÃ¡rio do comprador',NULL),(13504,'pt_BR:paymentObligation.title.selectPaymentObligation','Selecionar obrigaÃ§Ãµes de pagamento',NULL),(13505,'pt_BR:permission.memberPayments.paymentToSelf','Auto-pagamento',NULL),(13506,'pt_BR:certification.issuer','Emissor',NULL),(13507,'pt_BR:alert.member.LOGIN_BLOCKED_BY_TRIES','Login bloqueado por excesso de tentativas',NULL),(13508,'pt_BR:reference.removeConfirmation','Remover referÃªncia?',NULL),(13509,'pt_BR:permission.brokerPreferences','PreferÃªncias',NULL),(13510,'pt_BR:reports.stats.activity.whatToShow.COMPARE_PERIODS','Comparar dois perÃ­odos',NULL),(13511,'pt_BR:global.print','Imprimir',NULL),(13512,'pt_BR:permission.adminMemberPayments.cancelScheduledAsMember','Cancelar pagamento agendado como membro',NULL),(13513,'pt_BR:posweb.client.pin','PIN',NULL),(13514,'pt_BR:permission.adminAdminAccess.changePassword','Alterar senha',NULL),(13515,'pt_BR:image.details.success','Os detalhes da imagem foram salvos com sucesso',NULL),(13516,'pt_BR:reports.members_reports.system_invoices.paymentFilterRequired','Para mostrar faturas de sistema, Ã© necessÃ¡rio escolher pelo menos um filtro de pagamento',NULL),(13517,'pt_BR:loanPayment.status.IN_PROCESS','Em processo',NULL),(13518,'pt_BR:changePassword.forceChange','ForÃ§ar alteraÃ§Ã£o no prÃ³ximo acesso',NULL),(13519,'pt_BR:permission.brokerMemberPayments.authorize','Autorizar',NULL),(13520,'pt_BR:reports.simulations.dRate.config.graph.xAxis','Ãndice-D (dias)',NULL),(13521,'pt_BR:group.settings.smsChargeAmount','Valor cobrado por SMS',NULL),(13522,'pt_BR:profile.action.disconnect','Desconectar usuÃ¡rio',NULL),(13523,'pt_BR:settings.message.guaranteeStatusChanged','Estado da garantia',NULL),(13524,'pt_BR:messageCategory.modified','A categoria de mensagem foi modificada',NULL),(13525,'pt_BR:permission.adminMemberInvoices.view','Ver faturas eletrÃ´nicas de membros',NULL),(13526,'pt_BR:card.cancelCard.confirmation','Cancelar cartÃ£o?',NULL),(13527,'pt_BR:permission.systemSettings.manageLog','Gerenciar configuraÃ§Ãµes de log',NULL),(13528,'pt_BR:permission.adminAdminRemarks.view','Ver',NULL),(13529,'pt_BR:settings.alert.amountDeniedInvoices','Faturas eletrÃ´nicas negadas',NULL),(13530,'pt_BR:permission.systemTranslation.manageNotification','NotificaÃ§Ãµes',NULL),(13531,'pt_BR:certification.error.changeStatus','NÃ£o foi possÃ­vel alterar o estado da certificaÃ§Ã£o para: {0}',NULL),(13532,'pt_BR:paymentObligation.maxPublishDate','Publicado atÃ©',NULL),(13533,'pt_BR:loan.status.DISCARDED','Descartado',NULL),(13534,'pt_BR:translationMessage.search.showOnlyEmpty','Apenas valores vazios',NULL),(13535,'pt_BR:translationMessage.action.new','Inserir nova chave',NULL),(13536,'pt_BR:fileMapping.className','Nome da classe',NULL),(13537,'pt_BR:permission.systemAccountFees.view','Ver',NULL),(13538,'pt_BR:customField.internalName','Nome interno',NULL),(13539,'pt_BR:accountFee.removeConfirmation','Remover esta taxa de conta?',NULL),(13540,'pt_BR:notificationPreferences.modified','OpÃ§Ãµes de notificaÃ§Ã£o modificadas',NULL),(13541,'pt_BR:reports.stats.activity.developments.logins','Acessos',NULL),(13542,'pt_BR:pos.changeParameters.confirmation','Alterar os parÃ¢metros do POS?',NULL),(13543,'pt_BR:global.clear','Limpar',NULL),(13544,'pt_BR:settings.local.identification','IdentificaÃ§Ã£o da instÃ¢ncia do Cyclos',NULL),(13545,'pt_BR:pos.error.posIdExists','O identificador POS jÃ¡ existe. Por favor escolha outro valor.',NULL),(13546,'pt_BR:permission.memberProfile.changeName','Alterar o prÃ³prio nome',NULL),(13547,'pt_BR:mobile.home','PÃ¡gina principal',NULL),(13548,'pt_BR:help.title.user_management','GerÃªncia de usuÃ¡rios',NULL),(13549,'pt_BR:currency.enableIRate','Ativar indice-I',NULL),(13550,'pt_BR:permission.systemRegistrationAgreements.manage','Gerenciar',NULL),(13551,'pt_BR:permission.brokerPos.assign','Atribuir',NULL),(13552,'pt_BR:permission.adminMembers','Membros',NULL),(13553,'pt_BR:group.settings.passwordLength.max','Tamanho mÃ¡x. da senha',NULL),(13554,'pt_BR:card.status.securityCodeBlocked','O cÃ³digo de seguranÃ§a do cartÃ£o estÃ¡ bloqueado',NULL),(13555,'pt_BR:createMember.public.errorSendingMail','Desculpa, ocorreu um erro ao enviar o e-mail de validaÃ§Ã£o.\n\nPor favor, tente novamente mais tarde.',NULL),(13556,'pt_BR:permission.operatorReferences.manageMemberReferences','Gerenciar minhas referÃªncias',NULL),(13557,'pt_BR:externalTransfer.title.modify','Modificar tranferÃªncia externa',NULL),(13558,'pt_BR:document.formPage','PÃ¡gina de formulÃ¡rio',NULL),(13559,'pt_BR:payment.action.unblock','Desbloquear',NULL),(13560,'pt_BR:references.removeConfirmation','Remover esta referÃªncia?',NULL),(13561,'pt_BR:profile.modified.emailPending','O perfil foi modificado, mas um e-mail de confirmaÃ§Ã£o foi enviado para {0} a fim de confirmar o novo endereÃ§o',NULL),(13562,'pt_BR:reports.stats.keydevelopments.transactionAmount.median.short','MÃ©diano',NULL),(13563,'pt_BR:group.settings.enablePermanentAds','Permitir anÃºncios permanentes',NULL),(13564,'pt_BR:transferType.allowsScheduledPayments','Permite pagamentos agendados',NULL),(13565,'pt_BR:customField.memberRecord.brokerAccess.READ_ONLY','Apenas leitura',NULL),(13566,'pt_BR:alert.member.blockedPosUsed','Tentativa de utilizar o dispositivo POS com identificador {0} a partir do endereÃ§o IP {1}',NULL),(13567,'pt_BR:permission.adminMemberGuarantees.registerGuarantees','Cadastrar garantias',NULL),(13568,'pt_BR:settings.message.adminPendingBuyerOnlyGuarantee','Garantia pendente (apenas com comprador) de autorizaÃ§Ã£o do administrador',NULL),(13569,'pt_BR:group.settings.passwordExpiresAfter.field','Senha de acesso vencerÃ¡ apÃ³s (unid.)',NULL),(13570,'pt_BR:translationMessage.import.type.REPLACE','Substituir o arquivo inteiro',NULL),(13571,'pt_BR:settings.local.dataDisplay','ExibiÃ§Ã£o de informaÃ§Ãµes',NULL),(13572,'pt_BR:settings.local.adDescriptionFormat','Formato da descriÃ§Ã£o dos anÃºncios',NULL),(13573,'pt_BR:message.warning.messageNotReceivedByEmail','O membro recebeu a mensagem internamente, mas nÃ£o por e-mail',NULL),(13574,'pt_BR:externalAccountHistory.button.processPayments','Processar pagamentos',NULL),(13575,'pt_BR:permission.memberAds.view','Ver',NULL),(13576,'pt_BR:menu.operator.account.requestPayment','Solicitar pagamento',NULL),(13577,'pt_BR:reports.stats.general.members','membros',NULL),(13578,'pt_BR:sms.type.ACCOUNT_DETAILS','Detalhes da conta',NULL),(13579,'pt_BR:settings.local.memberResultDisplay.USERNAME','Nome de usuÃ¡rio do membro',NULL),(13580,'pt_BR:reports.stats.general.perMember','Por membro',NULL),(13581,'pt_BR:reports.stats.finances.singlePeriod.overview.title','VisÃ£o geral conta de sistema',NULL),(13582,'pt_BR:home.status.openLoans','VocÃª tem {0} emprÃ©stimos em aberto',NULL),(13583,'pt_BR:transferAuthorization.by','UsuÃ¡rio',NULL),(13584,'pt_BR:group.modified','O grupo foi modificado',NULL),(13585,'pt_BR:fileMapping.nature.CUSTOM','Personalizado',NULL),(13586,'pt_BR:rates.error.reinitValidation.noRateSpecified','Nenhum indice foi especificado.',NULL),(13587,'pt_BR:reports.stats.activity.histogram.grossProduct','Histograma de produto bruto',NULL),(13588,'pt_BR:groupFilter.name','Nome',NULL),(13589,'pt_BR:smsMailing.mailingType.FREE_TO_GROUP','DifusÃ£o gratuita para grupo',NULL),(13590,'pt_BR:memberImport.status.INVALID_USERNAME','O nome de usuÃ¡rio Ã© invÃ¡lido: {0}',NULL),(13591,'pt_BR:ad.permanent','Sem vencimento',NULL),(13592,'pt_BR:customImage.system.permissions','Ãcone de permissÃµes',NULL),(13593,'pt_BR:global.range.to','AtÃ©',NULL),(13594,'pt_BR:reports.members.smsLog','Mensagens de SMS enviadas',NULL),(13595,'pt_BR:permission.brokerReports.showAccountInformation','Exibir informaÃ§Ãµes de conta',NULL),(13596,'pt_BR:settings.local.sms.sendSmsWebServiceUrl','URL do Web Service de envio de SMS',NULL),(13597,'pt_BR:ad.description','DescriÃ§Ã£o',NULL),(13598,'pt_BR:menu.admin.messages','Mensagens',NULL),(13599,'pt_BR:permission.brokerMembers.changeEmail','Alterar o e-mail',NULL),(13600,'pt_BR:permission.memberAdInterests.manage','Gerenciar',NULL),(13601,'pt_BR:account.reservedAmount','Valor reservado',NULL),(13602,'pt_BR:transferType.title.modify','Modificar tipo de transaÃ§Ã£o',NULL),(13603,'pt_BR:invoice.transferType','Tipo de pagamento',NULL),(13604,'pt_BR:loanPayment.date','Data',NULL),(13605,'pt_BR:reference.summary.score','Pontos',NULL),(13606,'pt_BR:help.title.members','Membros',NULL),(13607,'pt_BR:transfer.number','NÃºmero',NULL),(13608,'pt_BR:card.new','Inserir novo cartÃ£o',NULL),(13609,'pt_BR:transferType.modified','O tipo de transaÃ§Ã£o foi modificado',NULL),(13610,'pt_BR:payment.confirmation.unblock','VocÃª estÃ¡ prestes a desbloquear este pagamento.\n\nPor favor, clique em OK para confirmar',NULL),(13611,'pt_BR:receipt.transfer.amount','Valor: {0}',NULL),(13612,'pt_BR:login.registration.title','Ainda nÃ£o Ã© cadastrado?',NULL),(13613,'pt_BR:settings.access.virtualKeyboardLogin','Teclado virtual para senha de acesso',NULL),(13614,'pt_BR:transferType.allowSmsNotification','Permitir notificaÃ§Ãµes por SMS',NULL),(13615,'pt_BR:adminTasks.indexes.title','Ãndices de busca',NULL),(13616,'pt_BR:cardType.cardSecurityCode.AUTOMATIC','AutomÃ¡tico',NULL),(13617,'pt_BR:mobile.viewPayments.previous','Ant.',NULL),(13618,'pt_BR:settings.unlimited','0 ilimitado',NULL),(13619,'pt_BR:invoice.title.send.system','Enviar fatura eletrÃ´nica para sistema',NULL),(13620,'pt_BR:loanGroup.memberRemoved','O membro foi removido desse grupo de emprÃ©stimos',NULL),(13621,'pt_BR:customizedFile.title.customize.static','Personalizar arquivo estÃ¡tico',NULL),(13622,'pt_BR:webshop.payment.credentialsText','Para confirmar o pagamento, digite seu nome de usuÃ¡rio e {0} abaixo.',NULL),(13623,'pt_BR:guarantee.authorizedBy','Autorizado por',NULL),(13624,'pt_BR:settings.access.loginRegex','ExpressÃ£o regular do nome de usuÃ¡rio',NULL),(13625,'pt_BR:transferType.allowCancelScheduledPayments','Permitir ao pagante cancelar um pagamento agendado',NULL),(13626,'pt_BR:activities.brokering.commission.count','TransaÃ§Ãµes comissionadas',NULL),(13627,'pt_BR:transactionPassword.error.invalid','Senha de transaÃ§Ã£o invÃ¡lida.\nTente novamente.',NULL),(13628,'pt_BR:reports.stats.taxes.singlePeriod.totalSum.title','EstatÃ­sticas de taxas: Volume',NULL),(13629,'pt_BR:reports.stats.keydevelopments.throughTime','Todos os itens selecionados ao longo do tempo',NULL),(13630,'pt_BR:createMember.action.saveAndOpenProfile','Salvar e abrir perfil',NULL),(13631,'pt_BR:reports.current.invoices.SYSTEM_OUTGOING.count','NÃºmero de faturas eletrÃ´nicas de saÃ­da do sistema',NULL),(13632,'pt_BR:externalTransfer.lineNumber','Linha NÂ°',NULL),(13633,'pt_BR:permission.adminAdmins','Administradores',NULL),(13634,'pt_BR:settings.local.charset','Conjunto de caracteres',NULL),(13635,'pt_BR:reports.stats.keydevelopments.numberOfAds.expired','AnÃºncios vencidos',NULL),(13636,'pt_BR:accountFeeLog.period','PerÃ­odo',NULL),(13637,'pt_BR:menu.operator.guarantees.searchPaymentObligations','ObrigaÃ§Ãµes de pagamento',NULL),(13638,'pt_BR:login.createMember','Inscrever-se',NULL),(13639,'pt_BR:settings.log.transactionFile','EndereÃ§o/nome do arquivo de log de transaÃ§Ãµes',NULL),(13640,'pt_BR:message.body','ConteÃºdo',NULL),(13641,'pt_BR:mobile.home.logout','Sair',NULL),(13642,'pt_BR:transactionFee.error.removing','A taxa de transaÃ§Ã£o nÃ£o pÃ´de ser removida porque ela jÃ¡ foi cobrada',NULL),(13643,'pt_BR:transferType.minAmount','',NULL),(13644,'pt_BR:externalTransferProcess.processed','Os pagamentos selecionados foram processados',NULL),(13645,'pt_BR:reports.stats.warning','Alerta: cÃ¡lculos estatÃ­sticos podem ser muito pesados, e podem demorar algum tempo.',NULL),(13646,'pt_BR:menu.member.account.loanGroups','Grupos de emprÃ©stimos',NULL),(13647,'pt_BR:transactionFee.toFixedMember.username','Nome de usuÃ¡rio de destino',NULL),(13648,'pt_BR:accountType.description','DescriÃ§Ã£o',NULL),(13649,'pt_BR:guaranteeType.enabled.tooltip','Tipo de garantia ativo',NULL),(13650,'pt_BR:alert.member.givenVeryBadRefs','O membro deu {0} referÃªncias \"PÃ©ssimo\"',NULL),(13651,'pt_BR:theme.styles','Estilos neste tema',NULL),(13652,'pt_BR:brokerCommissionContract.endDate.to','atÃ©',NULL),(13653,'pt_BR:adCategory.parent','Categoria mÃ£e',NULL),(13654,'pt_BR:reports.stats.keydevelopments.throughTime.alert','VocÃª sÃ³ pode selecionar o item \"ao longo do tempo\" em combinaÃ§Ã£o com outros items.',NULL),(13655,'pt_BR:customField.title.modify.admin','Modificar campo customizado de administrador',NULL),(13656,'pt_BR:member.search.noResults','Nenhum membro foi encontrado',NULL),(13657,'pt_BR:reports.current.invoices','Faturas eletrÃ´nicas',NULL),(13658,'pt_BR:serviceClient.title.insert','Inserir cliente de serviÃ§os web',NULL),(13659,'pt_BR:ticket.status.FAILED','Failed',NULL),(13660,'pt_BR:mailPreferences.title','NotificaÃ§Ãµes por e-mail',NULL),(13661,'pt_BR:payment.error.pendingProcess','O pagamento nÃ£o pÃ´de ser realizado porque existem outros pagamentos da sua conta que ainda estÃ£o sendo processados.\nPor favor, tente novamente mais tarde',NULL),(13662,'pt_BR:channel.removed','O canal foi removido',NULL),(13663,'pt_BR:group.settings.expireMembersAfter','Expirar membros apÃ³s',NULL),(13664,'pt_BR:currency.error.removing','A moeda nÃ£o pode ser removida porque existe tipos de contas associadas Ã  ela.',NULL),(13665,'pt_BR:group.account.updateAccountLimits','Atualizar limite de crÃ©dito para os membros existentes',NULL),(13666,'pt_BR:customField.ad.searchVisibility.ADVANCED','Busca avanÃ§ada',NULL),(13667,'pt_BR:changeGroup.operator.changed','O grupo do operador foi alterado',NULL),(13668,'pt_BR:viewChannels.title.of','Ver os canais de {0}',NULL),(13669,'pt_BR:global.removeSelected','Remover selecionado(s)',NULL),(13670,'pt_BR:loan.firstExpirationDate','Primeira data de vencimento',NULL),(13671,'pt_BR:fileMapping.title','Mapeamento de arquivo',NULL),(13672,'pt_BR:reports.simulations.aRate.config.combinedGraph.title','Curva de configuraÃ§Ã£o do Ã­ndice-A',NULL),(13673,'pt_BR:customImage.upload','Carregar nova',NULL),(13674,'pt_BR:loanPayment.payment','Pagamento',NULL),(13675,'pt_BR:theme.author','Autor',NULL),(13676,'pt_BR:reports.transactions_report.debits','DÃ©bitos',NULL),(13677,'pt_BR:settings.access.passwordLength','Tamanho da senha',NULL),(13678,'pt_BR:pos.unblockPos.confirmation','Ativar o POS?',NULL),(13679,'pt_BR:paymentObligation.pack.details','Selecione um conjunto de obrigaÃ§Ãµes de pagamento que nÃ£o excedam o perÃ­odo mÃ¡ximo',NULL),(13680,'pt_BR:account.isDefault','Ã‰ padrÃ£o',NULL),(13681,'pt_BR:permission.adminAdminAccess.enableLogin','Permitir automaticamente o acesso de administradores desativados (por tentativas de senha)',NULL),(13682,'pt_BR:menu.admin.help','Ajuda',NULL),(13683,'pt_BR:theme.style.MAIN','Sistema',NULL),(13684,'pt_BR:accountHistory.period.begin','Data inicial',NULL),(13685,'pt_BR:serviceClient.ignoreRegistrationValidations','Ignorar validaÃ§Ã£o de e-mail e campos personalizados',NULL),(13686,'pt_BR:sms.error.type.ALLOW_CHARGING_DISABLED','Sem SMS disponÃ­veis e cobranÃ§a adicional desabilitada',NULL),(13687,'pt_BR:settings.message.adminSystemInvoice','Fatura eletrÃ´nica de sistema',NULL),(13688,'pt_BR:transferType.transactionHierarchyVisibility.MEMBER','Para todos os usuÃ¡rios',NULL),(13689,'pt_BR:settings.access.allowMultipleLogins','Permitir mÃºltiplos acessos do mesmo usuÃ¡rio',NULL),(13690,'pt_BR:reports.stats.activity.histogram.grossProduct.yAxis','NÃºmero de membros',NULL),(13691,'pt_BR:menu.admin.usersGroups.registrationAgreements','Termos de adesÃ£o',NULL),(13692,'pt_BR:posweb.client.card','CartÃ£o do cliente',NULL),(13693,'pt_BR:alert.member.loginBlockedByPermissionDenieds','O acesso do membro ao sistema estÃ¡ temporariamente bloqueado por exceder o mÃ¡ximo de permissÃµes negadas. O endereÃ§o IP Ã© {1}',NULL),(13694,'pt_BR:adminTasks.indexes.confirmRebuild','A reconstruÃ§Ã£o dos Ã­ndices de busca Ã© executada em segundo plano e pode fazer com que buscas por palavras-chave nÃ£o tragam os resultados esperados atÃ© que a reconstruÃ§Ã£o esteja completa.\n\nVocÃª tem certeza que deseja continuar?',NULL),(13695,'pt_BR:guaranteeLog.date','Data',NULL),(13696,'pt_BR:message.type.GUARANTEE','Garantias',NULL),(13697,'pt_BR:reports.stats.keydevelopments.averageAmountPerTransaction.yAxis','Valor mÃ©dio / trans.',NULL),(13698,'pt_BR:loan.repayment.error.upperCreditLimit','O emprÃ©stimo nÃ£o pÃ´de ser pago porque ele poderia deixar a conta de sistema que o estÃ¡ recebendo com saldo maior do que o permitido em seu limite de crÃ©dito superior',NULL),(13699,'pt_BR:customImage.system.save','Ãcone de exportaÃ§Ã£o como CSV',NULL),(13700,'pt_BR:pos.posId','Identificador POS',NULL),(13701,'pt_BR:settings.types','Tipos',NULL),(13702,'pt_BR:translationMessage.import.error.noFile','Por favor, selecione o arquivo de propriedades',NULL),(13703,'pt_BR:brokerCommission.error.unsuspending','Erro liberando a comissÃ£o do corretor!',NULL),(13704,'pt_BR:permission.operatorMessages','Mensagens',NULL),(13705,'pt_BR:changePassword.error.mustContainOnlyLettersOrNumbers','Somente sÃ£o permitidas letras e nÃºmeros na senha de login',NULL),(13706,'pt_BR:transactionFee.fInfinite','Valor em assimptota infinita',NULL),(13707,'pt_BR:permission.memberOperators','Operadores',NULL),(13708,'pt_BR:adCategory.title.import','Importar categorias de anÃºncio',NULL),(13709,'pt_BR:member.email','E-mail',NULL),(13710,'pt_BR:card.securityCode','CÃ³digo de seguranÃ§a',NULL),(13711,'pt_BR:manual.action.top','Ir para o topo',NULL),(13712,'pt_BR:externalTransferType.title.list','Tipos de pagamento',NULL),(13713,'pt_BR:permission.adminMemberLoans.repayWithDate','Pagar emprÃ©stimo em data no passado',NULL),(13714,'pt_BR:permission.systemPayments.cancelScheduled','Cancelar pagamento agendado',NULL),(13715,'pt_BR:home.status.paymentsAwaitingFeedback','VocÃª tem {0} pagamentos pendentes de qualificaÃ§Ã£o',NULL),(13716,'pt_BR:changeBroker.new','Novo corretor',NULL),(13717,'pt_BR:payment.title.systemToMember','Pagamento do sistema para um membro',NULL),(13718,'pt_BR:adImport.title.details.error','AnÃºncios com erro de importaÃ§Ã£o',NULL),(13719,'pt_BR:permission.adminMemberReports','RelatÃ³rio de atividades',NULL),(13720,'pt_BR:permission.operatorPayments.ticket','Gerar tickets de pagamento externo',NULL),(13721,'pt_BR:customField.ad.searchVisibility.BASIC','Busca bÃ¡sica',NULL),(13722,'pt_BR:menu.operator.account.selfPayment','TransferÃªncia entre contas prÃ³prias',NULL),(13723,'pt_BR:receiptPrinterSettings.endOfDocCommand','Comando de fim de documento',NULL),(13724,'pt_BR:ad.price.unspecified','NÃ£o especificado',NULL),(13725,'pt_BR:serviceClient.address','EndereÃ§o na Internet',NULL),(13726,'pt_BR:permission.adminMemberReferences','ReferÃªncias',NULL),(13727,'pt_BR:reference.title.given.my','ReferÃªncias dadas',NULL),(13728,'pt_BR:receipt.transfer.date','Data: {0}',NULL),(13729,'pt_BR:groupFilter.loginPageName','Nome na pÃ¡gina de login',NULL),(13730,'pt_BR:certification.usedAmount','Valor utilizado',NULL),(13731,'pt_BR:profile.action.manageLoginPassword','Gerenciar senha de acesso',NULL),(13732,'pt_BR:reports.stats.accountFeeFilters','Taxas de conta',NULL),(13733,'pt_BR:reports.stats.taxes.paid.both','Ambos',NULL),(13734,'pt_BR:profile.action.accountsAction','Contas',NULL),(13735,'pt_BR:memberImport.group.select','Selecione um grupo para os membros',NULL),(13736,'pt_BR:reports.stats.chooseStatisticsCategories','Por favor, selecione uma categoria de estatÃ­sticas a ser exibida',NULL),(13737,'pt_BR:reports.stats.choose.taxes','Taxas',NULL),(13738,'pt_BR:certification.amount','Valor',NULL),(13739,'pt_BR:menu.operator.account.simulateConversion','Simular conversÃ£o',NULL),(13740,'pt_BR:memberPos.status.PENDING','Pendente',NULL),(13741,'pt_BR:loan.status.EXPIRED','Expirado',NULL),(13742,'pt_BR:externalTransfer.status.CHECKED','Verificado',NULL),(13743,'pt_BR:global.today','Hoje',NULL),(13744,'pt_BR:sms.type.HELP.description','Ajuda',NULL),(13745,'pt_BR:home.admin.status.connectedAdmins','NÃºmero de administradores conectados',NULL),(13746,'pt_BR:permission.adminMemberReports.showAccountInformation','Exibir informaÃ§Ãµes de conta',NULL),(13747,'pt_BR:changePassword.error.userBlocked','Seu acesso foi temporariamente bloqueado',NULL),(13748,'pt_BR:group.settings.defaultChannels','Acesso padrÃ£o dos membros',NULL),(13749,'pt_BR:settings.imported','As configuraÃ§Ãµes foram importadas',NULL),(13750,'pt_BR:memberRecord.user','UsuÃ¡rio',NULL),(13751,'pt_BR:permission.adminMemberDocuments.manageMember','Gerenciar documentos de membros',NULL),(13752,'pt_BR:certification.validity','Validade',NULL),(13753,'pt_BR:posweb.searchTransactions.title','Lista de transaÃ§Ãµes',NULL),(13754,'pt_BR:mobile.payment.confirmation','Pagamento de {0} para {1}.{2}',NULL),(13755,'pt_BR:memberImport.successfulMembers','Membros ok',NULL),(13756,'pt_BR:transactionFee.chargeType.MIXED_A_D_RATES','Misto de Ã­ndice-A e D',NULL),(13757,'pt_BR:global.textFormat.RICH','Texto formatado',NULL),(13758,'pt_BR:sms.error.type.NOT_ENOUGH_FUNDS','Saldo insuficiente',NULL),(13759,'pt_BR:memberImport.group','Grupo de permissÃ£o',NULL),(13760,'pt_BR:brokering.modified','Notas modificadas',NULL),(13761,'pt_BR:channel.title.list','Canais',NULL),(13762,'pt_BR:settings.neverDeleteMessage','0 nunca remover',NULL),(13763,'pt_BR:accountType.name','Nome',NULL),(13764,'pt_BR:member.bulkActions.changeGroup','Alterar grupo',NULL),(13765,'pt_BR:externalTransferType.modified','O tipo de pagamento foi modificado',NULL),(13766,'pt_BR:externalTransferProcess.title','Processar pagamentos de {0}',NULL),(13767,'pt_BR:createMember.newCaptcha','Novo cÃ³digo',NULL),(13768,'pt_BR:settings.local.changeConfirmationMessage','Ao alterar a linguagem, o arquivo de traduÃ§Ã£o serÃ¡ substituÃ­do.\nQuaisquer mensagens customizadas serÃ£o perdidas.\nVocÃª deseja continuar?',NULL),(13769,'pt_BR:reports.stats.keydevelopments.throughTime.selectYears','Selecione anos',NULL),(13770,'pt_BR:changeBroker.title.history','HistÃ³rico',NULL),(13771,'pt_BR:profile.neverLoggedOn','Nunca acessou',NULL),(13772,'pt_BR:settings.message.loanExpiration','Vencimento do emprÃ©stimo',NULL),(13773,'pt_BR:infoText.nomatch.subject','InformaÃ§Ã£o nÃ£o encontrada para: {0}.',NULL),(13774,'pt_BR:customField.groups','Habilitar campo para os grupos',NULL),(13775,'pt_BR:menu.operator.preferences.receiptPrinterSettings','Impressoras de recibo',NULL),(13776,'pt_BR:profile.action.addContact','Adicionar aos contatos',NULL),(13777,'pt_BR:customField.ad.visibility.MEMBER','Todos os usuÃ¡rios',NULL),(13778,'pt_BR:brokerCommissionContract.search.noResults','NÃ£o foi encontrado nenhum contrato',NULL),(13779,'pt_BR:permission.adminMemberDocuments.manageDynamic','Gerenciar documentos dinÃ¢micos',NULL),(13780,'pt_BR:reports.members.ads','AnÃºncios',NULL),(13781,'pt_BR:authorizationLevel.removed','NÃ­vel de autorizaÃ§Ã£o removido',NULL),(13782,'pt_BR:permission.systemRegistrationAgreements','Termos de adesÃ£o',NULL),(13783,'pt_BR:certification.action.create','Nova certificaÃ§Ã£o',NULL),(13784,'pt_BR:reports.simulations.choose.aRateConfig','ConfiguraÃ§Ã£o do Ã­ndice-A',NULL),(13785,'pt_BR:permission.systemGroupFilters','Filtros de grupos',NULL),(13786,'pt_BR:translationMessage.key','Chave',NULL),(13787,'pt_BR:permission.memberPayments.blockScheduled','Bloquear pagamento agendado',NULL),(13788,'pt_BR:customImage.system.preview','Ãcone de prÃ©-visualizaÃ§Ã£o',NULL),(13789,'pt_BR:menu.admin.guarantees.searchGuarantees','Garantias',NULL),(13790,'pt_BR:settings.local.language.ENGLISH','InglÃªs',NULL),(13791,'pt_BR:customizedFile.type','Tipo',NULL),(13792,'pt_BR:accountFee.title.list','Taxas de conta',NULL),(13793,'pt_BR:image.noPicture.caption','Sem imagem',NULL),(13794,'pt_BR:document.action.new.member','Novo documento de membro',NULL),(13795,'pt_BR:permission.memberAccount.authorizedInformation','Ver pagamentos autorizados',NULL),(13796,'pt_BR:externalTransferImport.error.importing.invalidMemberUsername','Nome de login invÃ¡lido: {0}',NULL),(13797,'pt_BR:global.month.NOVEMBER','Novembro',NULL),(13798,'pt_BR:activities.title.of','RelatÃ³rios de {0}',NULL),(13799,'pt_BR:settings.access.error.virtualKeyboard.groupsRequireSpecial','{0} nÃ£o pode ser ativado pois existe ao menos um grupo que requer caracteres especiais na senha',NULL),(13800,'pt_BR:loan.title.grant','Conceder emprÃ©stimo a {0}',NULL),(13801,'pt_BR:reports.simulations.aRate.config.combinedGraph.xAxis','Ãndice-A relativo ao perÃ­odo de garantia',NULL),(13802,'pt_BR:reports.stats.keydevelopments.throughTime.title','Progressos ao longo do tempo',NULL),(13803,'pt_BR:settings.message.adminNewPendingPayment','Novo pagamento para o administrador autorizar',NULL),(13804,'pt_BR:message.rootType.all','Todos',NULL),(13805,'pt_BR:reference.title.paymentsAwaitingFeedback','Pagamentos pendentes de qualificaÃ§Ã£o',NULL),(13806,'pt_BR:alert.system.newVersionOfApplicationPage','Existe uma nova versÃ£o da pÃ¡gina do aplicativo {0}, que foi customizada.\nPor favor, verifique para resolver possÃ­veis conflitos',NULL),(13807,'pt_BR:reports.stats.keydevelopments.numberOfMembers.numberOfDisappearedMembers','NÃºmero de membros desaparecidos',NULL),(13808,'pt_BR:customField.validation.minLength','Tamanho mÃ­nimo',NULL),(13809,'pt_BR:paymentFilter.showInReports','Exibir em relatÃ³rios',NULL),(13810,'pt_BR:reports.simulations.dRate.config.graph','Porcentagem de taxa vx Ãndice-D',NULL),(13811,'pt_BR:profile.action.smsLogs','Registros de SMS',NULL),(13812,'pt_BR:adCategory.active','Ativa',NULL),(13813,'pt_BR:profile.member.title.of','Perfil de {0}',NULL),(13814,'pt_BR:reports.stats.finances.title','EstatÃ­sticas financeiras',NULL),(13815,'pt_BR:transferType.defaultFeedbackComments','ComentÃ¡rio da qualificaÃ§Ã£o quando expirado',NULL),(13816,'pt_BR:posweb.action.makePayment','Fazer pagamento (F3)',NULL),(13817,'pt_BR:activities.title.my','Meus relatÃ³rios',NULL),(13818,'pt_BR:admin.group','Grupo de administrador',NULL),(13819,'pt_BR:guarantee.issuerName','Nome do emissor',NULL),(13820,'pt_BR:smsLog.status.ERROR','Erro',NULL),(13821,'pt_BR:scheduledPayment.parcels','Parcelas',NULL),(13822,'pt_BR:operator.group','Grupo',NULL),(13823,'pt_BR:changeGroup.error.move.hasBalance','O membro nÃ£o pode ser movido porque sua conta nÃ£o possui saldo zero em {0}',NULL),(13824,'pt_BR:mobile.login.password','Senha',NULL),(13825,'pt_BR:menu.member.personal.manageExternalAccess','Acesso externo',NULL),(13826,'pt_BR:profile.member.title.my','Meu perfil',NULL),(13827,'pt_BR:sms.type.ACCOUNT_DETAILS_ERROR','Erro dos detalhes da conta',NULL),(13828,'pt_BR:currency.pattern','PadrÃ£o',NULL),(13829,'pt_BR:group.settings.smsContextClassName','Nome de classe customizado do contexto SMS',NULL),(13830,'pt_BR:guaranteeType.authorizedBy.ISSUER','Emissor',NULL),(13831,'pt_BR:reports.stats.keydevelopments.numberOfMembers.numberOfMembers.short','Todos',NULL),(13832,'pt_BR:activities.loans.amount','Valor total restante do emprÃ©stimo',NULL),(13833,'pt_BR:menu.admin.usersGroups.admins','Gerenciar administradores',NULL),(13834,'pt_BR:message.html','Formato HTML',NULL),(13835,'pt_BR:settings.mail.mailValidation','ValidaÃ§Ã£o do e-mail no cadastro pÃºblico',NULL),(13836,'pt_BR:profile.action.manageCards','Gerenciar cartÃµes',NULL),(13837,'pt_BR:message.from','De',NULL),(13838,'pt_BR:errorLog.removeOne.confirm','Remover este log de erro?',NULL),(13839,'pt_BR:permission.operatorLoans.view','Visualizar',NULL),(13840,'pt_BR:menu.admin.reports.members','RelatÃ³rio de membros',NULL),(13841,'pt_BR:externalTransferProcess.error.noPaymentToConciliate','NÃ£o hÃ¡ pagamentos possÃ­veis para conciliaÃ§Ã£o',NULL),(13842,'pt_BR:group.action.new','Inserir novo grupo',NULL),(13843,'pt_BR:menu.operator.account','Conta',NULL),(13844,'pt_BR:payment.backToMemberProfile','Ir para o perfil do membro',NULL),(13845,'pt_BR:mobile.credentials.TRANSACTION_PASSWORD','Senha transaÃ§Ã£o',NULL),(13846,'pt_BR:contact.inserted','O contato foi inserido',NULL),(13847,'pt_BR:customField.control.SELECT','SeleÃ§Ã£o',NULL),(13848,'pt_BR:changePin.error.transactionPasswordPending','Para definir a senha externa (PIN), Ã© necessÃ¡ria a senha de transaÃ§Ã£o, que pode ser gerada na <a class=\"default\" href=\"{0}\">pÃ¡gina inicial</a>',NULL),(13849,'pt_BR:settings.local.transactionNumber.suffix','Sufixo',NULL),(13850,'pt_BR:adCategory.removeConfirmation','Remover categoria?',NULL),(13851,'pt_BR:group.title.settings.access','ConfiguraÃ§Ãµes de acesso',NULL),(13852,'pt_BR:customField.memberRecord.brokerAccess','Acesso do corretor',NULL),(13853,'pt_BR:ad.owner','ProprietÃ¡rio',NULL),(13854,'pt_BR:posweb.title.makePayment','Fazer pagamento',NULL),(13855,'pt_BR:guaranteeType.model','Modelo',NULL),(13856,'pt_BR:disconnect.error.notConnected','O usuÃ¡rio nÃ£o estÃ¡ mais conectado',NULL),(13857,'pt_BR:message.action.DELETE','Remover permanentemente',NULL),(13858,'pt_BR:menu.operator.account.invoices','Faturas EletrÃ´nicas',NULL),(13859,'pt_BR:ad.publicationPeriod.begin','Data de publicaÃ§Ã£o',NULL),(13860,'pt_BR:ad.search.since','Nos Ãºltimo(s)',NULL),(13861,'pt_BR:menu.admin.cards.list','Procurar cartÃµes',NULL),(13862,'pt_BR:loan.repayment.discard.payment.confirmationMessage','VocÃª tem certeza de que deseja descartar esse pagamento?',NULL),(13863,'pt_BR:accountOverview.error.noAccounts','VocÃª nÃ£o possui contas',NULL),(13864,'pt_BR:guarantee.title.searchGuarantees','Busca de garantias',NULL),(13865,'pt_BR:reports.stats.Period','PerÃ­odo',NULL),(13866,'pt_BR:memberPos.status.ACTIVE','Ativo',NULL),(13867,'pt_BR:quickAccess.updateProfile','Atualizar perfil',NULL),(13868,'pt_BR:message.type.TRANSACTION_FEEDBACK','QualificaÃ§Ãµes de transaÃ§Ã£o',NULL),(13869,'pt_BR:groupFilter.rootUrl','URL raiz da aplicaÃ§Ã£o',NULL),(13870,'pt_BR:activities.loans.count','EmprÃ©stimos em aberto',NULL),(13871,'pt_BR:member.operator','Operador',NULL),(13872,'pt_BR:operator.name','Nome',NULL),(13873,'pt_BR:accountHistory.tooltip.viewGrouped','Ver grupo',NULL),(13874,'pt_BR:menu.admin.contentManagement.cssFiles','Arquivos CSS',NULL),(13875,'pt_BR:image.removeConfirmation','Remover imagem?',NULL),(13876,'pt_BR:reports.current.balance_account','Saldo de {0}',NULL),(13877,'pt_BR:pin.error.blocked','Sua senha externa (PIN) foi temporariamente bloqueada por excesso de tentativas invÃ¡lidas',NULL),(13878,'pt_BR:permission.brokerInvoices.acceptAsMemberFromSystem','Aceitar fatura eletrÃ´nica de sistema como membo',NULL),(13879,'pt_BR:notificationPreferences.acceptPaidMailing','Receber mensagens SMS de difusÃ£o pagas',NULL),(13880,'pt_BR:messageCategory.title.list','Categorias de mensagens',NULL),(13881,'pt_BR:brokerCommission.stopped','A cobranÃ§a da comissÃ£o de corretor foi interrompida',NULL),(13882,'pt_BR:mobile.viewPayments.date','Data',NULL),(13883,'pt_BR:cardType.cardSecurityCode.MANUAL','Manual',NULL),(13884,'pt_BR:changePin.modified','A senha externa (PIN) foi modificada',NULL),(13885,'pt_BR:loanPayment.status.RECOVERED','Recuperado',NULL),(13886,'pt_BR:reports.stats.activity.histogram.numberTransactions','Histograma de nÃºmero de transaÃ§Ãµes',NULL),(13887,'pt_BR:registrationAgreement.title.accept','Termo de adesÃ£o',NULL),(13888,'pt_BR:card.status.EXPIRED','Expirado',NULL),(13889,'pt_BR:memberRecord.title.insert','Inserir registro de {0} para {1}',NULL),(13890,'pt_BR:loan.repayment.transactionPassword.canPerformExpiredAction','Para definir o estado do emprÃ©stimo, vocÃª deve fornecer sua senha de transaÃ§Ã£o',NULL),(13891,'pt_BR:login.systemOffline','O sistema estÃ¡ temporariamente indisponÃ­vel.\nPor favor, tente novamente mais tarde.\nPedimos desculpas pelo transtorno.',NULL),(13892,'pt_BR:accountFee.chargeMode.FIXED','Valor fixo',NULL),(13893,'pt_BR:customField.title.order.payment','Ajustar ordem dos campos de {0}',NULL),(13894,'pt_BR:alert.member.transactionPasswordBlockedByTries','A senha de transaÃ§Ã£o foi bloqueada por exceder a quantidade mÃ¡xima de tentativas',NULL),(13895,'pt_BR:mobile.home.availableBalance','DisponÃ­vel: {0}',NULL),(13896,'pt_BR:profile.action.preferencesActions','PreferÃªncias',NULL),(13897,'pt_BR:settings.local.cyclosId','IdentificaÃ§Ã£o para canais externos',NULL),(13898,'pt_BR:receiptPrinterSettings.title.list','ConfiguraÃ§Ãµes de impressoras de recibos',NULL),(13899,'pt_BR:changeBroker.title','Alterar corretor de {0}',NULL),(13900,'pt_BR:account.lowUnits','Alerta de poucas unidades',NULL),(13901,'pt_BR:message.toMember','Para membro',NULL),(13902,'pt_BR:home.admin.status.systemUptime.message','{0} dia(s), {1} hora(s)',NULL),(13903,'pt_BR:message.messageBox.TRASH','Lixeira',NULL),(13904,'pt_BR:member.title.print','Resultado da busca de membros',NULL),(13905,'pt_BR:adImport.title.newCategories','Novas categorias',NULL),(13906,'pt_BR:permission.systemAlerts','Avisos',NULL),(13907,'pt_BR:global.timePeriod.HOURS','Hora(s)',NULL),(13908,'pt_BR:loanPayment.search.repaidAmount','Pagado',NULL),(13909,'pt_BR:group.smsMessages','Mensagens permitidas para SMS',NULL),(13910,'pt_BR:permission.brokerPos','POS',NULL),(13911,'pt_BR:reports.stats.period.periodCompared','PerÃ­odo com o qual comparar',NULL),(13912,'pt_BR:activities.invoices.outgoing.amount','Valor de saÃ­da',NULL),(13913,'pt_BR:reference.replyComments','RÃ©plica',NULL),(13914,'pt_BR:reports.transactions_report.system_to_member_invoices','{0} faturas eletrÃ´nicas de sistema para membro: {1}',NULL),(13915,'pt_BR:member.search.allGroupFilters','Todas as comunidades',NULL),(13916,'pt_BR:paymentObligation.inserted','A obrigaÃ§Ã£o de pagamento foi criada com sucesso',NULL),(13917,'pt_BR:changeGroup.error.move.hasOpenInvoices','O membro nÃ£o pode ser movido porque ele tem faturas eletrÃ´nicas em aberto',NULL),(13918,'pt_BR:invoice.date','Data',NULL),(13919,'pt_BR:settings.access.externalPaymentPassword.TRANSACTION_PASSWORD','Senha de transaÃ§Ã£o',NULL),(13920,'pt_BR:channel.title.insert','Novo canal',NULL),(13921,'pt_BR:serviceClient.channel','Canal',NULL),(13922,'pt_BR:help.title.content_management','Gerenciamento de conteÃºdo',NULL),(13923,'pt_BR:mobile.error.title','Erro',NULL),(13924,'pt_BR:reports.stats.activity.throughTime.numberTransactions','NÃºmero de transaÃ§Ãµes por membro',NULL),(13925,'pt_BR:reports.current.member_account','Contas de membro',NULL),(13926,'pt_BR:settings.message.adminApplicationError','Erros da aplicaÃ§Ã£o',NULL),(13927,'pt_BR:document.action.new.static','Novo documento estÃ¡tico',NULL),(13928,'pt_BR:rates.error.reinitValidation.reinitDateAfterEnableDate','A data que vocÃª informou como inicial para a reinicializaÃ§Ã£o Ã© posterior Ã  presente data de ativaÃ§Ã£o dos indices..\nVocÃª deve escolher uma data anterior Ã  data de ativaÃ§Ã£o.',NULL),(13929,'pt_BR:activities.transactions.total','Total de todas as transaÃ§Ãµes',NULL),(13930,'pt_BR:account.upperCreditLimit','Limite de crÃ©dito superior',NULL),(13931,'pt_BR:loanPayment.status.REPAID','Pago',NULL),(13932,'pt_BR:activities.transactions.numberBuy','Pagas - qtde.',NULL),(13933,'pt_BR:settings.message.admin.title','NotificaÃ§Ãµes de administradores',NULL),(13934,'pt_BR:settings.log.scheduledTaskLevel.OFF','Desligado',NULL),(13935,'pt_BR:message.sendTo','Enviar para',NULL),(13936,'pt_BR:group.defaultAcceptPaidMailing','Aceitar SMS de difusÃ£o pagos por padrÃ£o',NULL),(13937,'pt_BR:accountType.removeConfirmation','Remover esta conta, bem como os tipos de transaÃ§Ã£o?',NULL),(13938,'pt_BR:permission.adminMemberSmsMailings','Mensagens SMS de difusÃ£o',NULL),(13939,'pt_BR:reports.members_reports.members_invoices','Faturas eletrÃ´nicas de membros',NULL),(13940,'pt_BR:adCategory.orderModified','A ordem das catgorias foi modificada',NULL),(13941,'pt_BR:reports.stats.activity.singlePeriod.grossProduct.yAxis','Produto bruto',NULL),(13942,'pt_BR:group.settings.emailValidation.ADMIN','Administrador',NULL),(13943,'pt_BR:certification.guaranteeType','Tipo de garantia',NULL),(13944,'pt_BR:loanPayment.summary.total','Total',NULL),(13945,'pt_BR:connectedUsers.title','UsuÃ¡rios conectados',NULL),(13946,'pt_BR:member.creationDate','Data de criaÃ§Ã£o',NULL),(13947,'pt_BR:settings.access.virtualKeyboardTransactionPassword','Teclado virtual para senha de transaÃ§Ã£o',NULL),(13948,'pt_BR:reports.stats.activity.comparePeriods.loginTimes.title','Acessos por membro (comparando dois perÃ­odos)',NULL),(13949,'pt_BR:createMember.initialGroup.preface.public','Por favor, selecione o grupo que vocÃª deseja participar',NULL),(13950,'pt_BR:invoice.invalid.schedulingDate','As parcelas da fatura eletrÃ´nica devem ser agendadas para antes de {0}',NULL),(13951,'pt_BR:alert.removeSelected.confirm','Remover os avisos selecionados?',NULL),(13952,'pt_BR:settings.local.transactionNumber.prefix','Prefixo',NULL),(13953,'pt_BR:settings.message.adminPaymentFromMemberToSystem','Pagamentos de membros para o sistema',NULL),(13954,'pt_BR:invoice.sendConfirmationMessage','Enviar uma fatura eletrÃ´nica para {0} de {1}?\n\nPor favor, clique em OK para confirmar',NULL),(13955,'pt_BR:permission.brokerMemberRecords.modify','Modificar',NULL),(13956,'pt_BR:permission.adminMemberCards.unblock','Desbloquear',NULL),(13957,'pt_BR:groupFilter.showInProfile','Exibir no perfil',NULL),(13958,'pt_BR:alert.system.NULL_RATE','',NULL),(13959,'pt_BR:menu.member.help.manual','Manual',NULL),(13960,'pt_BR:permission.adminMemberRecords.manage','Gerenciar',NULL),(13961,'pt_BR:payment.error.transferMinimum','O valor do pagamento nÃ£o pode ser menor do que {0}',NULL),(13962,'pt_BR:paymentFilter.title.list','Filtros de pagamentos',NULL),(13963,'pt_BR:transferType.enabled','Habilitado',NULL),(13964,'pt_BR:paymentRequest.error.invalidChannel','A requisiÃ§Ã£o de pagamento nÃ£o pÃ´de ser realizada porque o usuÃ¡rio {0} nÃ£o possui o canal {1} ativado',NULL),(13965,'pt_BR:ticket.status.CANCELLED','Cancelado',NULL),(13966,'pt_BR:loan.repayment.discard.loan','Descartar emprÃ©stimo',NULL),(13967,'pt_BR:channel.defaultPrincipal','IdentificaÃ§Ã£o padrÃ£o do usuÃ¡rio',NULL),(13968,'pt_BR:global.month.MARCH','MarÃ§o',NULL),(13969,'pt_BR:menu.logout.confirmationMessage','Deseja realmente sair?',NULL),(13970,'pt_BR:permission.adminMemberAccounts','Contas',NULL),(13971,'pt_BR:adImport.status.MISSING_TITLE','O tÃ­tulo estÃ¡ faltando',NULL),(13972,'pt_BR:message.title.search','Lista de mensagens',NULL),(13973,'pt_BR:permission.systemAccounts.view','Ver gerenciamento de contas',NULL),(13974,'pt_BR:group.details','Detalhes do grupo',NULL),(13975,'pt_BR:customImage.system.print','Ãcone de impressÃ£o',NULL),(13976,'pt_BR:accountType.change','Alterar conta',NULL),(13977,'pt_BR:menu.operator.home','Principal',NULL),(13978,'pt_BR:permission.systemCustomizedFiles.view','Ver',NULL),(13979,'pt_BR:guarantee.emissionDate','Data de emissÃ£o',NULL),(13980,'pt_BR:memberRecord.search.noResults','Nenhum registro de {0} foi encontrado',NULL),(13981,'pt_BR:error.sendingMail','Houve um erro durante o envio de um e-mail para {0}',NULL),(13982,'pt_BR:profile.action.mail','Enviar e-mail',NULL),(13983,'pt_BR:settings.local.deleteMessagesOnTrashAfter','Remover mensagens da lixeira apÃ³s',NULL),(13984,'pt_BR:transfer.hour','Hora',NULL),(13985,'pt_BR:posLog.memberPosStatus','Estado do POS do membro',NULL),(13986,'pt_BR:group.title.modify.operator','ConfiguraÃ§Ãµes de grupo de operadores',NULL),(13987,'pt_BR:memberImport.status.INVALID_CREDIT_LIMIT','O limite de crÃ©dito Ã© invÃ¡lido: {0}',NULL),(13988,'pt_BR:brokerCommissionContract.removeConfirmation','Remover este contrato de comissÃ£o de corretor?',NULL),(13989,'pt_BR:customField.title.order.ad','Ajustar ordem de campo customizado de anÃºncio',NULL),(13990,'pt_BR:loan.group','Grupo de emprÃ©stimo',NULL),(13991,'pt_BR:permission.adminMemberCards.generate','Gerar',NULL),(13992,'pt_BR:customField.member.indexing.NONE','NÃ£o incluir',NULL),(13993,'pt_BR:loan.grant.error.unsortedPayments','Os pagamentos de emprÃ©stimo nÃ£o estÃ£o ordernados corretamente por data',NULL),(13994,'pt_BR:ticket.fromChannel','Canal de solicitaÃ§Ã£o',NULL),(13995,'pt_BR:profile.action.creditLimit','Ajustar limite de crÃ©dito',NULL),(13996,'pt_BR:ad.maxAdsMessage','Por favor, apague um ou mais produtos e serviÃ§os para poder criar um novo',NULL),(13997,'pt_BR:permission.adminMemberAccess.resetPassword','Reiniciar senha de acesso',NULL),(13998,'pt_BR:certification.login','UsuÃ¡rio',NULL),(13999,'pt_BR:currency.pendingRateInitProgression','ReinicializaÃ§Ã£o de indices esta sendo processada; Processados atÃ© o momento',NULL),(14000,'pt_BR:customField.type.INTEGER','NÃºmero inteiro',NULL),(14001,'pt_BR:global.datePattern.minute','mm',NULL),(14002,'pt_BR:accountHistory.finalBalance','Saldo final',NULL),(14003,'pt_BR:menu.admin.messages.messageCategory','Categorias da mensagem',NULL),(14004,'pt_BR:errors.notAllowed','{0}',NULL),(14005,'pt_BR:externalAccount.name','Nome',NULL),(14006,'pt_BR:permission.adminMemberAccounts.simulateConversion','Simular conversÃ£o',NULL),(14007,'pt_BR:permission.systemSettings.file','Exportar / importar para arquivo',NULL),(14008,'pt_BR:reports.stats.finances.ThroughTime.income','Entrada',NULL),(14009,'pt_BR:group.settings.smsChargeTransferType','Tipo de transaÃ§Ã£o para cobranÃ§a de SMS',NULL),(14010,'pt_BR:serviceOperation.DO_PAYMENT','Realizar pagamentos',NULL),(14011,'pt_BR:permission.memberPayments.cancelScheduled','Cancelar pagamento agendado',NULL),(14012,'pt_BR:settings.local.internationalization','InternacionalizaÃ§Ã£o',NULL),(14013,'pt_BR:reports.stats.activity.developments.grossProduct','Produto bruto',NULL),(14014,'pt_BR:changePassword.oldPassword','Senha atual',NULL),(14015,'pt_BR:transferType.title.list','Tipos de transaÃ§Ã£o',NULL),(14016,'pt_BR:currency.dRate.initValue','Valor inicial do Ã­ndice-D',NULL),(14017,'pt_BR:paymentObligation.date','Data',NULL),(14018,'pt_BR:customizedFile.title.applicationPage','PÃ¡ginas customizadas do aplicativo',NULL),(14019,'pt_BR:image.caption','Legenda',NULL),(14020,'pt_BR:permission.brokerMessages.view','Ver',NULL),(14021,'pt_BR:scheduledPayments.searchType.INCOMING','Entrada',NULL),(14022,'pt_BR:account.status','Estado',NULL),(14023,'pt_BR:reports.stats.general.whatToShow','O que exibir?',NULL),(14024,'pt_BR:brokerCommission.notCharging','Esse tipo de comissÃ£o nÃ£o estÃ¡ sendo cobrado',NULL),(14025,'pt_BR:transferType.requiresAuthorization','Requer autorizaÃ§Ã£o',NULL),(14026,'pt_BR:permission.systemPayments','Pagamentos de sistema',NULL),(14027,'pt_BR:changeBroker.changed','O corretor foi alterado',NULL),(14028,'pt_BR:global.weekDay.short.SUNDAY','Dom',NULL),(14029,'pt_BR:paymentObligation.accept','Aceitar obrigaÃ§Ã£o de pagamento',NULL),(14030,'pt_BR:reports.stats.groupOfGroups','Filtro de grupo',NULL),(14031,'pt_BR:mobile.login.accessUsing','Usar {0}',NULL),(14032,'pt_BR:transactionPassword.reset','A senha de transaÃ§Ã£o foi reinicializada.\nAgora o membro estÃ¡ apto a gerar a sua senha de transaÃ§Ã£o',NULL),(14033,'pt_BR:permission.adminMemberCards.changeCardSecurityCode','Alterar cÃ³digo',NULL),(14034,'pt_BR:profile.action.viewDocuments','Documentos de membro',NULL),(14035,'pt_BR:permission.brokerAccounts','Conta',NULL),(14036,'pt_BR:permission.module.type.ADMIN_ADMIN','PermissÃµes de administraÃ§Ã£o de administradores de {0}',NULL),(14037,'pt_BR:home.admin.status.connectedOperators','NÃºmero de operadores conectados',NULL),(14038,'pt_BR:group.settings.emailValidation.WEB_SERVICE','Web service',NULL),(14039,'pt_BR:changeGroup.current','Grupo atual',NULL),(14040,'pt_BR:memberRecordType.error.removing','O tipo de registro de member nÃ£o pode ser removido pois hÃ¡ pelo um registro de membro usando ele',NULL),(14041,'pt_BR:transactionFee.finalAmount','Valor menor ou igual',NULL),(14042,'pt_BR:member.name','Nome',NULL),(14043,'pt_BR:reports.members.broker','Corretor',NULL),(14044,'pt_BR:menu.admin.ads.categories.file','Imp. / Exp. categorias',NULL),(14045,'pt_BR:adCategory.title.list','Categorias de anÃºncio',NULL),(14046,'pt_BR:operator.created','O operador foi criado com sucesso',NULL),(14047,'pt_BR:group.settings.transactionPassword.length','Tamanho da senha de transaÃ§Ã£o',NULL),(14048,'pt_BR:payment.error.sameAccount','A conta de destino deve ser diferente da conta de origem',NULL),(14049,'pt_BR:settings.local.transferListenerClass','Classe Java para notificaÃ§Ã£o de pagamentos processados',NULL),(14050,'pt_BR:permission.brokerMemberPayments.cancelScheduledAsMember','Cancelar pagamento agendado como membro',NULL),(14051,'pt_BR:memberImport.status.MISSING_CUSTOM_FIELD','{0} estÃ¡ faltando',NULL),(14052,'pt_BR:payment.error.pastDateWithRates','Pagamentos no passado nÃ£o sÃ£o possÃ­veis caso os Ã­ndices estejam ativados.\nIsto Ã© um erro de configuraÃ§Ã£o; por favor contate o administrador do sistema.',NULL),(14053,'pt_BR:changeGroup.error.remove.hasOpenInvoices','O membro nÃ£o pode ser removido porque ele tem faturas eletrÃ´nicas em aberto',NULL),(14054,'pt_BR:smsLog.date','Data',NULL),(14055,'pt_BR:changePin.pinLength','Escolha uma senha externa (PIN) com {0} caracteres',NULL),(14056,'pt_BR:permission.systemGroupFilters.manageCustomizedFiles','Gerenciar arquivos customizados',NULL),(14057,'pt_BR:adInterest.title.insert','Novo interesse em anÃºncios',NULL),(14058,'pt_BR:groupFilter.customizedFiles.customized','Agora o arquivo estÃ¡ customizado para o filtro de grupos',NULL),(14059,'pt_BR:transferType.fixedDestinationMember.name','Nome completo do membro fixo de destino',NULL),(14060,'pt_BR:externalTransferImport.error.importing.invalidTypeCode','CÃ³digo do tipo de pagamento Ã© invÃ¡lido: {0}',NULL),(14061,'pt_BR:transactionFee.deductAmount.false','NÃ£o deduzir do valor total',NULL),(14062,'pt_BR:posLog.title','Log do POS',NULL),(14063,'pt_BR:accountFeeLog.running','Executando',NULL),(14064,'pt_BR:loan.title.search','Procurar emprÃ©stimos',NULL),(14065,'pt_BR:brokerCommission.removed','A comissÃ£o de corretor foi removida',NULL),(14066,'pt_BR:channel.errorRemoving','NÃ£o foi possÃ­vel remover o canal',NULL),(14067,'pt_BR:externalTransferType.error.removing','O tipo de pagamento nÃ£o pÃ´de ser removido da conta externa',NULL),(14068,'pt_BR:mobile.login.title','Cyclos',NULL),(14069,'pt_BR:pos.unblocked','POS foi desbloqueado',NULL),(14070,'pt_BR:reports.stats.finances.ComparePeriods.income','Entradas',NULL),(14071,'pt_BR:loan.repayment.totalAmount','Total',NULL),(14072,'pt_BR:reports.stats.chooseStatistics','Por favor, selecione as estatÃ­sticas a serem exibidas',NULL),(14073,'pt_BR:conversionSimulation.rates','Ãndices',NULL),(14074,'pt_BR:receiptPrinterSettings.beginOfDocCommand','Comando de inÃ­cio de documento',NULL),(14075,'pt_BR:permission.adminMemberCards.block','Bloquear',NULL),(14076,'pt_BR:ad.status','Estado',NULL),(14077,'pt_BR:defaultBrokerCommission.validity.transactions','{0} transaÃ§Ãµes',NULL),(14078,'pt_BR:settings.log.webServiceLevel.OFF','Desligado',NULL),(14079,'pt_BR:alert.system.ACCOUNT_FEE_FAILED','Taxa de conta falhou',NULL),(14080,'pt_BR:transactionFee.when.ALWAYS','Sempre',NULL),(14081,'pt_BR:alert.system.INDEX_REBUILD_START','InÃ­cio de reconstruÃ§Ã£o de Ã­ndice de busca',NULL),(14082,'pt_BR:scheduledPayments.totalAmount','Total restante',NULL),(14083,'pt_BR:smsLog.title.searchMy','Buscar registros de mensagens SMS',NULL),(14084,'pt_BR:groupFilter.customizedFiles.modified','O arquivo foi modificado para este filtro de grupos',NULL),(14085,'pt_BR:global.title.results','Resultado',NULL),(14086,'pt_BR:reports.stats.activity.comparePeriods.grossProduct.row2.short','Todos',NULL),(14087,'pt_BR:permission.operatorGuarantees.sellWithPaymentObligations','Vender com obrigaÃ§Ãµes de pagamento',NULL),(14088,'pt_BR:authorizationLevel.title.list','NÃ­veis de autorizaÃ§Ã£o',NULL),(14089,'pt_BR:group.settings.passwordPolicy.AVOID_OBVIOUS_LETTERS_NUMBERS','Requerer letras e nÃºmeros',NULL),(14090,'pt_BR:menu.admin.accounts.authorizedPayments','Pagamentos autorizados',NULL),(14091,'pt_BR:createAdmin.action.saveAndNew','Salvar e inserir novo administrador',NULL),(14092,'pt_BR:settings.mail.title','ConfiguraÃ§Ãµes de e-mail',NULL),(14093,'pt_BR:changeGroup.error.remove.activeAdmin','Um administrador ativo nÃ£o pode ser removido.\nTente movÃª-lo para um group do tipo REMOVIDO',NULL),(14094,'pt_BR:infotext.aliases','Alias',NULL),(14095,'pt_BR:payment.goToAccountHistory','Ir para o extrato de conta',NULL),(14096,'pt_BR:settings.message.member.title','NotificaÃ§Ãµes de membros',NULL),(14097,'pt_BR:group.settings.smsShowFreeThreshold','Mostrar mensagens SMS gratuitas somente se menor de',NULL),(14098,'pt_BR:reports.stats.transactionFeeFilters','Taxas de transaÃ§Ã£o',NULL),(14099,'pt_BR:invoice.error.sendingWithMultipleTransferTypesWithCustomFields','Esta fatura nÃ£o pÃ´de ser enviada pois existem distintos tipos de pagamento possÃ­veis com campos personalizados',NULL),(14100,'pt_BR:brokering.loans.amount','Valor total restante do emprÃ©stimo',NULL),(14101,'pt_BR:settings.local.timeZone','Fuso horÃ¡rio',NULL),(14102,'pt_BR:changePassword.currentPassword','Senha de acesso atual',NULL),(14103,'pt_BR:loan.repayment.error.enoughCredits','VocÃª nÃ£o tem crÃ©ditos suficientes para pagar esse emprÃ©stimo',NULL),(14104,'pt_BR:pendingMember.title.profile','Detalhes do membro pendente',NULL),(14105,'pt_BR:error.image','A imagem enviada nÃ£o pÃ´de ser processada',NULL),(14106,'pt_BR:ad.inserted','AnÃºncio inserido',NULL),(14107,'pt_BR:channel.credentials.TRANSACTION_PASSWORD','Senha de transaÃ§Ã£o',NULL),(14108,'pt_BR:permission.adminMemberGuarantees.viewPaymentObligations','Ver obrigaÃ§Ãµes de pagamento',NULL),(14109,'pt_BR:settings.local.maxUploadSize','Tamanho mÃ¡ximo de arquivo',NULL),(14110,'pt_BR:loan.repayment.amount','Valor',NULL),(14111,'pt_BR:settings.local.memberSortOrder','Ordem de classificaÃ§Ã£o para o resultado da busca de membros',NULL),(14112,'pt_BR:loan.repayment.discard.loan.confirmationMessage','VocÃª tem certeza de que deseja descartar esse emprÃ©stimo?',NULL),(14113,'pt_BR:reports.simulations.dRateConfigSimulation.currency','Moeda',NULL),(14114,'pt_BR:notificationPreferences.allowChargingSmsPackage','Autorizar cobranÃ§a por mensagens SMS adicionais',NULL),(14115,'pt_BR:loan.title.confirm','ConfirmaÃ§Ã£o do emprÃ©stimo',NULL),(14116,'pt_BR:document.documentPage','PÃ¡gina de documento',NULL),(14117,'pt_BR:settings.file','Arquivo',NULL),(14118,'pt_BR:ad.view.lastAds','Ãšltimos anÃºncios',NULL),(14119,'pt_BR:customField.moveValue','Substituir ocorrÃªncias por',NULL),(14120,'pt_BR:permission.adminMemberPayments.paymentWithDate','Pagamentos de membros em data no passado',NULL),(14121,'pt_BR:smsMailing.title.search','Mensagens SMS de difusÃ£o',NULL),(14122,'pt_BR:certification.buyerName','Nome do comprador',NULL),(14123,'pt_BR:guarantee.removed','A garantia foi removida',NULL),(14124,'pt_BR:profile.action.personalMessages','Enviar mensagem pessoal',NULL),(14125,'pt_BR:memberImport.file','Arquivo CSV',NULL),(14126,'pt_BR:cardType.title.modify','Modificar tipo de cartÃ£o',NULL),(14127,'pt_BR:loan.description','DescriÃ§Ã£o',NULL),(14128,'pt_BR:group.settings.repayLoanByGroup','Pagamento do emprÃ©stimo permitido por qualquer membro do grupo',NULL),(14129,'pt_BR:reports.stats.taxes.numberOfTransactions','TransaÃ§Ãµes',NULL),(14130,'pt_BR:ad.search.price','PreÃ§o',NULL),(14131,'pt_BR:settings.local.maxChargebackTime','PerÃ­odo mÃ¡ximo para estorno',NULL),(14132,'pt_BR:accountFee.paymentDirection.TO_SYSTEM','De membro para sistema',NULL),(14133,'pt_BR:group.settings','Editar as configuraÃ§Ãµes',NULL),(14134,'pt_BR:global.timePeriod.YEARS','Ano(s)',NULL),(14135,'pt_BR:reports.stats.finances.balance','Saldo',NULL),(14136,'pt_BR:profile.action.byMember.title','AÃ§Ãµes de membro para {0}',NULL),(14137,'pt_BR:permission.brokerMemberRecords.create','Criar',NULL),(14138,'pt_BR:settings.log.traceFile','EndereÃ§o/nome do arquivo de log de aÃ§Ãµes',NULL),(14139,'pt_BR:reports.stats.activity.singlePeriod.numberTransactions','NÃºmero de transaÃ§Ãµes por membro',NULL),(14140,'pt_BR:accountFeeLog.openInvoices','Faturas abertas',NULL),(14141,'pt_BR:payment.statusGroup.OPEN','Aberto',NULL),(14142,'pt_BR:settings.log.scheduledTaskLevel.INFO','ExecuÃ§Ã£o resumida',NULL),(14143,'pt_BR:ad.search.keywords','Palavras-chave',NULL),(14144,'pt_BR:cardLog.status','Estado',NULL),(14145,'pt_BR:loan.setExpiredStatus.confirmation','VocÃª estÃ¡ certo que deseja alterar o estado deste emprÃ©stimo?',NULL),(14146,'pt_BR:menu.member.personal.sms','Mensagens SMS',NULL),(14147,'pt_BR:menu.operator.personal','Pessoal',NULL),(14148,'pt_BR:translationMessage.action.export','Exportar como arquivo de propriedades',NULL),(14149,'pt_BR:transferAuthorization.error.alreadyAuthorized','VocÃª jÃ¡ autorizou este pagamento em um nÃ­vel anterior',NULL),(14150,'pt_BR:groupFilter.containerUrl','URL da pÃ¡gina container',NULL),(14151,'pt_BR:permission.systemSettings.manageAccess','Gerenciar configuraÃ§Ãµes de acesso',NULL),(14152,'pt_BR:accountFee.action.run','Executar agora',NULL),(14153,'pt_BR:login.bottomText','Aqui a administraÃ§Ã£o pode colocar algum texto adicional.\n(Na seÃ§Ã£o de administraÃ§Ã£o: TraduÃ§Ã£o - AplicaÃ§Ã£o - login.bottomText)',NULL),(14154,'pt_BR:fieldMapping.field','Campo',NULL),(14155,'pt_BR:alert.member.INVOICE_IDLE_TIME_EXCEEDED','A fatura enviada para o membro expirou',NULL),(14156,'pt_BR:serviceOperation.ACCOUNT_DETAILS','Acessar informaÃ§Ãµes de conta',NULL),(14157,'pt_BR:permission.operatorPayments.paymentToSystem','Pagamento para sistema',NULL),(14158,'pt_BR:group.nature.MEMBER','Membro',NULL),(14159,'pt_BR:channel.inserted','O canal foi inserido',NULL),(14160,'pt_BR:reports.stats.activity.developments.percentageNoTraders','% de membros que nÃ£o transacionam',NULL),(14161,'pt_BR:group.settings.passwordExpiresAfter.number','Senha de acesso vencerÃ¡ apÃ³s (qtde.)',NULL),(14162,'pt_BR:settings.local.timePattern','Formato do horÃ¡rio',NULL),(14163,'pt_BR:changePassword.error.sameAsTransactionPasswordOrPin','A senha nÃ£o pode ser igual Ã  senha de transaÃ§Ã£o ou PIN',NULL),(14164,'pt_BR:permission.brokerCards.changeCardSecurityCode','Alterar cÃ³digo',NULL),(14165,'pt_BR:mobile.login.pin','Senha externa (PIN)',NULL),(14166,'pt_BR:permission.memberGuarantees.sellWithPaymentObligations','Vender com obrigaÃ§Ãµes de pagamento',NULL),(14167,'pt_BR:generateCard.generateForMemberWithActiveCard','Gerar para membros com cartÃ£o ativo?',NULL),(14168,'pt_BR:reports.members_reports.transactions.paymentFilterRequired','Ã‰ necessÃ¡rio escolher pelo menos um filtro de pagamento',NULL),(14169,'pt_BR:brokerCommission.suspended','A comissÃ£o de corretor foi suspensa',NULL),(14170,'pt_BR:changePassword.title.of','Alterar senha de acesso de {0}',NULL),(14171,'pt_BR:guaranteeType.loanTransferType','EmprÃ©stimo',NULL),(14172,'pt_BR:smsMailing.byBroker.all','Membros do corretor',NULL),(14173,'pt_BR:permission.operatorLoans.repay','Pagar',NULL),(14174,'pt_BR:global.month.FEBRUARY','Fevereiro',NULL),(14175,'pt_BR:ad.search.action.toggleFilter','Filtros',NULL),(14176,'pt_BR:transferType.feedbackExpirationTime','Tempo limite para qualificaÃ§Ã£o',NULL),(14177,'pt_BR:reports.stats.keydevelopments.numberOfMembers.numberOfDisappearedMembers.short','Desaparecido',NULL),(14178,'pt_BR:permission.adminMemberLoans.discard','Descartar emprÃ©stimo',NULL),(14179,'pt_BR:menu.admin.contentManagement','Gerenc. de conteÃºdo',NULL),(14180,'pt_BR:loanGroup.errorRemoving','O grupo de emprÃ©stimos nÃ£o pÃ´de ser removido.\nCertifique-se de que ele nÃ£o tenha emprÃ©stimos antes de tentar removÃª-lo.',NULL),(14181,'pt_BR:conversionSimulation.title.of','SimulaÃ§Ã£o de conversÃ£o para {0}',NULL),(14182,'pt_BR:brokerCommissionContract.status.CLOSED','Fechado',NULL),(14183,'pt_BR:settings.local.transactionNumber.enable','Habilitado',NULL),(14184,'pt_BR:customImage.removed','A imagem foi removida',NULL),(14185,'pt_BR:permission.memberGuarantees.issueGuarantees','Emitir garantias',NULL),(14186,'pt_BR:permission.memberCards.view','Ver',NULL),(14187,'pt_BR:customField.title.list.member','Campos customizados de membro',NULL),(14188,'pt_BR:changePassword.title.my','Alterar minha senha de acesso',NULL),(14189,'pt_BR:document.visibility.ADMIN','Administradores',NULL),(14190,'pt_BR:permission.memberAccess.unblockPin','Desbloquear senha externa (PIN)',NULL),(14191,'pt_BR:card.cardType','Tipo de cartÃ£o',NULL),(14192,'pt_BR:accountFee.error.removing','A taxa de conta nÃ£o pode ser removida porque ela jÃ¡ foi cobrada',NULL),(14193,'pt_BR:card.blocked','CartÃ£o bloqueado',NULL),(14194,'pt_BR:mobile.credentials.LOGIN_PASSWORD','Senha',NULL),(14195,'pt_BR:loanGroup.loanGroup','Grupo de emprÃ©stimos',NULL),(14196,'pt_BR:permission.adminMemberLoans','EmprÃ©stimos',NULL),(14197,'pt_BR:adminTasks.indexRebuildEnqueued','A reconstruÃ§Ã£o do Ã­ndice foi iniciada.\nUm alerta de sistema serÃ¡ criado quando esta for concluÃ­da',NULL),(14198,'pt_BR:transactionFee.title.simple.insert','Inserir taxa de transaÃ§Ã£o',NULL),(14199,'pt_BR:adminTasks.indexes.type.Operator','Operadores',NULL),(14200,'pt_BR:payment.invalid.paymentDates','As datas das parcelas devem estar ordenadas e devem ser em datas futuras',NULL),(14201,'pt_BR:paymentObligation.amount','Valor',NULL),(14202,'pt_BR:sms.type.PAYMENT.description','Pagamento direto',NULL),(14203,'pt_BR:conversionSimulation.title.my','SimulaÃ§Ã£o de conversÃ£o',NULL),(14204,'pt_BR:error.general','Houve um erro interno no sistema Cyclos',NULL),(14205,'pt_BR:permission.brokerMembers.changeUsername','Alterar o nome de usuÃ¡rio',NULL),(14206,'pt_BR:changePassword.newPassword','Nova senha',NULL),(14207,'pt_BR:customImage.system.icon','Ãcone de atalho',NULL),(14208,'pt_BR:brokerCommissionContract.error.removing','O contrato de comissÃ£o de corretor nÃ£o pode ser removido porque ele jÃ¡ tem comissÃµes pagas',NULL),(14209,'pt_BR:permission.adminAdmins.remove','Remover',NULL),(14210,'pt_BR:reports.members.ads.expired','Vencidos',NULL),(14211,'pt_BR:reports.stats.activity.topten.login','Acessos',NULL),(14212,'pt_BR:settings.log.maxFilesPerLog','No. mÃ¡x. de arquivos por log',NULL),(14213,'pt_BR:mobile.credentials.PIN','PIN',NULL),(14214,'pt_BR:serviceOperation.ACCESS','InformaÃ§Ãµes de acesso',NULL),(14215,'pt_BR:memberImport.title.import','Importar membros',NULL),(14216,'pt_BR:loan.status.CLOSED','Fechado',NULL),(14217,'pt_BR:menu.admin.alerts.system','Avisos de sistema',NULL),(14218,'pt_BR:group.title.new','Inserir novo grupo',NULL),(14219,'pt_BR:brokerCommissionContract.denied','O contrato de comissÃ£o de corretor foi negado',NULL),(14220,'pt_BR:transactionFee.subject.SOURCE_BROKER','Corretor do membro que estÃ¡ pagando (origem)',NULL),(14221,'pt_BR:group.name','Nome',NULL),(14222,'pt_BR:settings.log.title','ConfiguraÃ§Ãµes de log',NULL),(14223,'pt_BR:customField.member.indexing','Incluir na busca por palavras-chave',NULL),(14224,'pt_BR:conversionSimulation.graph','TraÃ§ar intervalo no grÃ¡fico contra o tempo',NULL),(14225,'pt_BR:permission.systemCurrencies','Moedas',NULL),(14226,'pt_BR:adminTasks.indexes.rebuild','Reconstruir',NULL),(14227,'pt_BR:loan.grantFeeRepaymentType','Tipo de pagamento para taxa de concessÃ£o',NULL),(14228,'pt_BR:customField.possibleValue.default','Valor padrÃ£o',NULL),(14229,'pt_BR:error.validation','Envio invÃ¡lido de formulÃ¡rio',NULL),(14230,'pt_BR:rates.reinit.warning','Observe que reinicializar um indice Ã© um processo que pode demorar horas. A aplicaÃ§Ã£o sera definida como indisponivel caso vocÃª inicie uma tarefa de inicializaÃ§Ã£o de indice.',NULL),(14231,'pt_BR:global.month.JUNE','Junho',NULL),(14232,'pt_BR:global.pagination.tooltip.previous','PÃ¡gina anterior',NULL),(14233,'pt_BR:ad.title.insert','Novo anÃºncio',NULL),(14234,'pt_BR:payment.error.circularFees','O pagamento nÃ£o pÃ´de ser realizado pois foram detectadas taxas circulares.\n\nPor favor, contate a administraÃ§Ã£o.',NULL),(14235,'pt_BR:accountFee.inserted','A taxa de conta foi inserida',NULL),(14236,'pt_BR:reports.transactions_report.outgoing','De saÃ­da',NULL),(14237,'pt_BR:transferType.removed','O tipo de transaÃ§Ã£o foi removido',NULL),(14238,'pt_BR:changeBroker.suspendCommission','Suspender comissÃ£o',NULL),(14239,'pt_BR:reports.stats.activity.throughTime.grossProduct.yAxis','Produto bruto',NULL),(14240,'pt_BR:alert.system.NEGATIVE_VIRTUAL_RATED_BALANCE','Um balanÃ§o negativo virtual de indices foi encontrado em uma conta de sistema.',NULL),(14241,'pt_BR:permission.brokerDocuments.view','Ver',NULL),(14242,'pt_BR:category.order.alpha','Clique para usar ordem alfabÃ©tica',NULL),(14243,'pt_BR:message.category.choose','Selecione uma categoria',NULL),(14244,'pt_BR:accountFee.title.modify','Modificar taxa de conta',NULL),(14245,'pt_BR:customImage.system.calendar','Ãcone de calendÃ¡rio',NULL),(14246,'pt_BR:infoText.title.edit','Editar mensagem informativa',NULL),(14247,'pt_BR:permission.brokerMemberPayments','Pagamentos de membros',NULL),(14248,'pt_BR:global.month.JULY','Julho',NULL),(14249,'pt_BR:settings.message.pendingPaymentReceived','Pagamento que requer autorizaÃ§Ã£o recebido',NULL),(14250,'pt_BR:profile.action.changeGroup','Alterar grupo de permissÃµes',NULL),(14251,'pt_BR:invoice.search.period.begin','De',NULL),(14252,'pt_BR:reports.stats.filters','Filtros',NULL),(14253,'pt_BR:transfer.scheduling.MULTIPLE_FUTURE','Agendado para pagamento parcelado',NULL),(14254,'pt_BR:menu.admin.settings.log','Config. de Log',NULL),(14255,'pt_BR:menu.member.account.authorizedPayments','Pagamentos autorizados',NULL),(14256,'pt_BR:errors.greaterThan','{0} deve ser maior que {1}',NULL),(14257,'pt_BR:alert.member.cardSecurityCodeBlockedByTries','CÃ³digo de seguranÃ§a do cartÃ£o bloqueado por exceder {0} tentativas para o cartÃ£o {1}',NULL),(14258,'pt_BR:paymentObligation.title.new','Nova obrigaÃ§Ã£o de pagamento',NULL),(14259,'pt_BR:menu.admin.reports.simulations','SimulaÃ§Ãµes',NULL),(14260,'pt_BR:transferType.transactionHierarchyVisibility','Exibir transaÃ§Ãµes pai / filhas',NULL),(14261,'pt_BR:posweb.title.receivePayment','Receber pagamento',NULL),(14262,'pt_BR:global.choose','Escolher',NULL),(14263,'pt_BR:conversionSimulation.result.total','Total',NULL),(14264,'pt_BR:accountFeeLog.totalCollectedAmount','Valor total coletado',NULL),(14265,'pt_BR:externalTransferType.action.CONCILIATE_PAYMENT','Conciliar pagamento',NULL),(14266,'pt_BR:guaranteeType.issueFeeTransferType','Taxa de emissÃ£o',NULL),(14267,'pt_BR:invoice.denyConfirmationMessage','Negar fatura eletrÃ´nica vinda de {0} de {1}?\n\nPor favor, clique em OK para confirmar',NULL),(14268,'pt_BR:invoice.error.noTransferType','NÃ£o hÃ¡ tipo de pagamento possÃ­vel.\nPor favor, contate a administraÃ§Ã£o',NULL),(14269,'pt_BR:registrationAgreement.contents','ConteÃºdo',NULL),(14270,'pt_BR:transactionPassword.NOT_USED','NÃ£o usada',NULL),(14271,'pt_BR:memberPos.assign.memberWithoutAccount','O membro nÃ£o possui uma conta.',NULL),(14272,'pt_BR:loan.group.responsible','ResponsÃ¡vel',NULL),(14273,'pt_BR:smsMailing.stillSending','Ainda enviando...',NULL),(14274,'pt_BR:ad.new','Inserir novo anÃºncio',NULL),(14275,'pt_BR:guarantee.registrationDate','Data de criaÃ§Ã£o',NULL),(14276,'pt_BR:profile.action.loanGroups','Grupos de emprÃ©stimos',NULL),(14277,'pt_BR:reports.current.ads_information','InformaÃ§Ãµes de anÃºncios',NULL),(14278,'pt_BR:memberImport.status.INVALID_UPPER_CREDIT_LIMIT','O limite de crÃ©dito superior Ã© invÃ¡lido: {0}',NULL),(14279,'pt_BR:adImport.status.SUCCESS','Sucesso',NULL),(14280,'pt_BR:alert.member.CARD_SECURITY_CODE_BLOCKED_BY_TRIES','CÃ³digo de seguranÃ§a do cartÃ£o bloqueado por tentativas invÃ¡lidas',NULL),(14281,'pt_BR:document.newFile','Carregar arquivo',NULL),(14282,'pt_BR:alert.system.ACCOUNT_FEE_FINISHED_WITH_ERRORS','Taxa de conta concluÃ­da com erros',NULL),(14283,'pt_BR:loan.error.noTransferType','NÃ£o hÃ¡ tipo de pagamento possÃ­vel para conceder esse emprÃ©stimo',NULL),(14284,'pt_BR:alert.member.scheduledPaymentFailed','Um pagamento agendado de {0} do tipo {1} falhou',NULL),(14285,'pt_BR:smsLog.type.SMS_OPERATION','OperaÃ§Ã£o por SMS',NULL),(14286,'pt_BR:menu.operator.member.contacts','Contatos',NULL),(14287,'pt_BR:theme.title','TÃ­tulo',NULL),(14288,'pt_BR:reports.stats.finances.other','Outro',NULL),(14289,'pt_BR:memberImport.initialCreditTransferType.empty','Ignorar saldos positivos',NULL),(14290,'pt_BR:settings.alert.alertNewPendingMembers','Novos membros com ativaÃ§Ã£o pendente',NULL),(14291,'pt_BR:loan.expirationFee','Taxa de vencimento',NULL),(14292,'pt_BR:mobile.payment.title.do','Realizar Pagamento',NULL),(14293,'pt_BR:permission.systemDocuments','Documentos customizados',NULL),(14294,'pt_BR:memberImport.status.BALANCE_LOWER_THAN_CREDIT_LIMIT','O saldo Ã© inferior ao limite de crÃ©dito',NULL),(14295,'pt_BR:certification.status','Estado',NULL),(14296,'pt_BR:payment.error.enoughCreditsOtherAccount','O pagamento nÃ£o pode ser realizado pois uma conta relacionada nÃ£o possui saldo suficiente',NULL),(14297,'pt_BR:alert.system.RATE_INITIALIZATION_STARTED','Tarefa de reinicializaÃ§Ã£o de indices iniciada',NULL),(14298,'pt_BR:payment.confirmation.self','VocÃª irÃ¡ transferir {0} de {1} para {2}.{3}\n\nPor favor, clique em OK para confirmar',NULL),(14299,'pt_BR:loan.grantDate','Conceder',NULL),(14300,'pt_BR:permission.brokerMemberAccess.unblockPin','Desbloquear senha externa (PIN)',NULL),(14301,'pt_BR:reference.level.VERY_BAD','PÃ©ssimo',NULL),(14302,'pt_BR:error.systemOffline','O sistema estÃ¡ temporariamente indisponÃ­vel',NULL),(14303,'pt_BR:permission.systemSettings','ConfiguraÃ§Ãµes',NULL),(14304,'pt_BR:global.timePeriod.WEEKS','Semana(s)',NULL),(14305,'pt_BR:posweb.client.any','Cliente',NULL),(14306,'pt_BR:permission.adminMemberPayments','Pagamentos de membros',NULL),(14307,'pt_BR:loan.repaid','O pagamento foi processado com sucesso',NULL),(14308,'pt_BR:theme.title.import','Importar novo tema',NULL),(14309,'pt_BR:customField.possibleValue.error.saving','Erro ao salvar o valor.\nCertifique-se de que ele jÃ¡ nÃ£o exista.',NULL),(14310,'pt_BR:menu.member.home','PÃ¡gina Principal',NULL),(14311,'pt_BR:reports.members.presentation.result','Resultado do relatÃ³rio de membros',NULL),(14312,'pt_BR:loan.type','Tipo de emprÃ©stimo',NULL),(14313,'pt_BR:memberPos.status.BLOCKED','Bloqueado',NULL),(14314,'pt_BR:permission.systemServiceClients','Clientes de serviÃ§os web',NULL),(14315,'pt_BR:ad.tradeType.SEARCH','Demanda',NULL),(14316,'pt_BR:profile.action.invoiceFromSystem','Fatura eletrÃ´nica de sistema para membro',NULL),(14317,'pt_BR:settings.local.transactionNumber','NÃºmero da transaÃ§Ã£o',NULL),(14318,'pt_BR:paymentRequest.sent','A solicitaÃ§Ã£o de pagamento foi enviada a {0}',NULL),(14319,'pt_BR:permission.systemAccounts.manage','Gerenciar contas',NULL),(14320,'pt_BR:customImage.system.mobileSplash_large','Mobile: Imagem inicial grande',NULL),(14321,'pt_BR:permission.adminMemberBulkActions.changeChannels','Alterar acesso aos canais',NULL),(14322,'pt_BR:group.removed','O grupo foi removido',NULL),(14323,'pt_BR:brokerCommissionContract.removed','O contrato de comissÃ£o de corretor foi removido',NULL),(14324,'pt_BR:adInterest.removeOne.confirm','Remover interesse em anÃºncio?',NULL),(14325,'pt_BR:posweb.client.username','UsuÃ¡rio do cliente',NULL),(14326,'pt_BR:fileMapping.decimalSeparator','Separador decimal',NULL),(14327,'pt_BR:reports.stats.activity.comparePeriods.percentageNoTrade.yAxis','% member que nÃ£o transacionam',NULL),(14328,'pt_BR:customField.payment.searchAccess','Exibir na busca',NULL),(14329,'pt_BR:transactionPassword.status.user.ACTIVE','Ativa',NULL),(14330,'pt_BR:payment.canceled','O pagamento foi cancelado',NULL),(14331,'pt_BR:reference.level.VERY_GOOD','Muito bom',NULL),(14332,'pt_BR:memberRecord.title.search.member','Busca de {0} para {1}',NULL),(14333,'pt_BR:help.title.messages','Mensagens',NULL),(14334,'pt_BR:paymentObligation.error.noActiveCertificationFound','NÃ£o existe certificaÃ§Ã£o ativa para o comprador {0} emitida por {1}',NULL),(14335,'pt_BR:settings.local.sms.channel','Canal do operacao',NULL),(14336,'pt_BR:adCategory.title.modify','Modificar categoria de anÃºncio',NULL),(14337,'pt_BR:transactionFee.fromFixedMember.username','Nome de usuÃ¡rio de origem',NULL),(14338,'pt_BR:reports.stats.general.printable','VersÃ£o de impressÃ£o',NULL),(14339,'pt_BR:permission.systemReports','RelatÃ³rios',NULL),(14340,'pt_BR:brokerCommission.suspendTooltip','Suspender',NULL),(14341,'pt_BR:permission.systemAlerts.viewSystemAlerts','Ver avisos de sistema',NULL),(14342,'pt_BR:memberPos.title.noPos','O membro nÃ£o tem POS',NULL),(14343,'pt_BR:translationMessage.import.type.ONLY_NEW','Importar apenas chaves novas (mantendo as chaves existentes)',NULL),(14344,'pt_BR:customizedFile.select.type','Selecione o tipo',NULL),(14345,'pt_BR:global.submit','Enviar',NULL),(14346,'pt_BR:settings.message.pendingBuyerOnlyGuaranteeIssuer','Garantia pendente (apenas com comprador) de autorizaÃ§Ã£o do emissor',NULL),(14347,'pt_BR:permission.memberSms','Registros de SMS',NULL),(14348,'pt_BR:currency.rates','Indices disponÃ­veis ara esta moeda',NULL),(14349,'pt_BR:permission.adminMembers.view','Ver',NULL),(14350,'pt_BR:message.action.reply','Responder',NULL),(14351,'pt_BR:permission.adminMembers.changeName','Alterar o nome completo',NULL),(14352,'pt_BR:ad.status.SCHEDULED','Agendado',NULL),(14353,'pt_BR:permission.systemStatus.viewConnectedOperators','Ver operadores conectados',NULL),(14354,'pt_BR:notificationPreferences.message','Cyclos mensagem',NULL),(14355,'pt_BR:notificationPreferences.email','E-mail',NULL),(14356,'pt_BR:permission.memberPayments.paymentToSystem','Pagamentos de sistema',NULL),(14357,'pt_BR:invoice.accepted.withAuthorization','A fatura eletrÃ´nica foi aceita, mas o pagamento ainda necessita de autorizaÃ§Ã£o para ser processado',NULL),(14358,'pt_BR:transferAuthorization.date','Data',NULL),(14359,'pt_BR:sms.type.INFO_TEXT.description','Mensagem informativa',NULL),(14360,'pt_BR:smsLog.title.search','Buscar registros de mensagens SMS para {0}',NULL),(14361,'pt_BR:reports.current.show_btn','Exibir relatÃ³rios',NULL),(14362,'pt_BR:reports.stats.choose.miscellaneous','EstatÃ­sticas gerais',NULL),(14363,'pt_BR:reports.stats.activity.histogram.grossProduct.title','Produto bruto por membro, histograma',NULL),(14364,'pt_BR:settings.import.confirmation','Tem certeza de que deseja importar as configuraÃ§Ãµes do arquivo selecionado?',NULL),(14365,'pt_BR:help.title.ads_interest','Interesses em anÃºncios',NULL),(14366,'pt_BR:transactionFee.action.simple.new','Inserir nova taxa de transaÃ§Ã£o',NULL),(14367,'pt_BR:settings.mail.smtpPassword','Senha',NULL),(14368,'pt_BR:brokerCommission.type.defaultCommission','ComissÃ£o padrÃ£o',NULL),(14369,'pt_BR:channel.enableSMSLinkTo','notificaÃ§Ãµes',NULL),(14370,'pt_BR:loan.monthlyInterest','Juros mensais',NULL),(14371,'pt_BR:ad.modified','AnÃºncio modificado',NULL),(14372,'pt_BR:reports.stats.general.year','Ano',NULL),(14373,'pt_BR:invoice.to','Para',NULL),(14374,'pt_BR:settings.message.transactionFeedbackReceived','QualificaÃ§Ã£o de transaÃ§Ã£o recebida',NULL),(14375,'pt_BR:reports.stats.keydevelopments.averageAmountPerTransaction.title','Progressos no valor mÃ©diano por transaÃ§Ã£o',NULL),(14376,'pt_BR:permission.adminMemberLoans.repay','Pagar emprÃ©stimo',NULL),(14377,'pt_BR:transferType.allowBlockScheduledPayments','Permitir ao pagante bloquear um pagamento agendado',NULL),(14378,'pt_BR:transfer.totalAmount','Valor total',NULL),(14379,'pt_BR:message.action.MARK_AS_READ','Marcar como lida',NULL),(14380,'pt_BR:reports.stats.activity.singlePeriod.numberTransactions.row2.short','Todos os membros',NULL),(14381,'pt_BR:createMember.title.byAdmin','Cadastrar novo membro',NULL),(14382,'pt_BR:permission.operatorInvoices.sendToSystem','Enviar para o sistema',NULL),(14383,'pt_BR:permission.adminMemberMessages.manage','Gerenciar',NULL),(14384,'pt_BR:contact.error.alreadyExists','O membro informado jÃ¡ estÃ¡ na sua lista de contatos',NULL),(14385,'pt_BR:settings.log.restLevel','NÃ­vel de log de serviÃ§os REST',NULL),(14386,'pt_BR:card.internalKey','Chave',NULL),(14387,'pt_BR:menu.admin.reports.members.list','Lista de membros',NULL),(14388,'pt_BR:adminTasks.indexes.type.MemberRecord','Registros de membros',NULL),(14389,'pt_BR:customImage.title.new.custom','Nova imagem customizada',NULL),(14390,'pt_BR:menu.admin.accounts.accountFees','Taxas de conta',NULL),(14391,'pt_BR:smsMailing.error.variableNotFound','NÃ£o foi possivel encontrar as seguintes variaveis: {0}',NULL),(14392,'pt_BR:permission.systemReports.memberList','Listas de membros',NULL),(14393,'pt_BR:transferType.availability.DISABLED','Desativado',NULL),(14394,'pt_BR:reference.transactionFeedback.feedbackPeriodExpired','O periodo de qualificaÃ§Ã£o expirou',NULL),(14395,'pt_BR:customField.title.modify.member','Modificar campo customizado de membro',NULL),(14396,'pt_BR:ad.title.categories','Navegar por categoria',NULL),(14397,'pt_BR:loan.openTransfer','Exibir o pagamento relacionado',NULL),(14398,'pt_BR:selectChannels.channels','Canais',NULL),(14399,'pt_BR:memberPos.status','Estado do POS do membro',NULL),(14400,'pt_BR:home.member.news.title','NotÃ­cias (quadro de mensagens)',NULL),(14401,'pt_BR:adImport.title.details.success','AnÃºncios importados com sucesso',NULL),(14402,'pt_BR:permission.adminMemberCards.activate','Ativar',NULL),(14403,'pt_BR:global.timePeriod.MONTHS','MÃªs(es)',NULL),(14404,'pt_BR:reports.stats.activity.whatToShow.SINGLE_PERIOD','Um perÃ­odo',NULL),(14405,'pt_BR:theme.action.select','Selecionar',NULL),(14406,'pt_BR:help.title.loan_groups','Grupos de emprÃ©stimos',NULL),(14407,'pt_BR:brokerCommissionContract.endDate','Data de tÃ©rmino',NULL),(14408,'pt_BR:fileMapping.nature.CSV','CSV',NULL),(14409,'pt_BR:global.close','Fechar',NULL),(14410,'pt_BR:brokerCommission.suspendConfirmation','VocÃª deseja suspender essa comissÃ£o e os contratos do corretor que estÃ£o relacionados a ela?',NULL),(14411,'pt_BR:group.defaultSmsMessages','Mensagens enviadas por SMS por padrÃ£o',NULL),(14412,'pt_BR:permission.operatorPayments.cancelScheduled','Cancelar pagamento agendado',NULL),(14413,'pt_BR:permission.systemMemberRecordTypes.manage','Gerenciar',NULL),(14414,'pt_BR:customImage.system.view','Ãcone de visualizaÃ§Ã£o',NULL),(14415,'pt_BR:reports.members_reports.transactions.transactionModeRequired','Ã‰ necessÃ¡rio selecionar transaÃ§Ãµes de dÃ©bito ou de crÃ©dito',NULL),(14416,'pt_BR:transactionFee.toGroups','Para os grupos',NULL),(14417,'pt_BR:message.sendTo.MEMBER','Membro',NULL),(14418,'pt_BR:home.admin.status.systemUptime','Tempo de execuÃ§Ã£o do sistema',NULL),(14419,'pt_BR:loanPayment.status.OPEN','Aberto',NULL),(14420,'pt_BR:permission.brokerMembers.changeName','Alterar o nome completo',NULL),(14421,'pt_BR:member.username','UsuÃ¡rio do membro',NULL),(14422,'pt_BR:serviceOperation.WEBSHOP','Pagamento para loja virtual',NULL),(14423,'pt_BR:payment.error.negativeFinalAmount','Todas as taxas aplicadas sÃ£o maiores do que o valor original da transaÃ§Ã£o. Para mais detalhes contate a administraÃ§Ã£o.',NULL),(14424,'pt_BR:channel.modified','O canal foi modificado',NULL),(14425,'pt_BR:settings.error.selectedSettingTypeNotInFile','Aviso! Os seguintes tipos de configuraÃ§Ã£o nÃ£o foram importados pois nÃ£o foram encontrados no arquivo:\n{0}',NULL),(14426,'pt_BR:card.creationDate','Data de criaÃ§Ã£o',NULL),(14427,'pt_BR:accountFee.name','Nome',NULL),(14428,'pt_BR:receipt.posweb.transactions.scheduledPayment','{0} {1} {2} {3} {4}',NULL),(14429,'pt_BR:cardType.action.new','Inserir novo tipo de cartÃ£o',NULL),(14430,'pt_BR:fileMapping.decimalPlaces.error.required','NÃºmero de casas decimais Ã© necessÃ¡rio',NULL),(14431,'pt_BR:customField.type.STRING','String',NULL),(14432,'pt_BR:changePin.error.transactionPasswordBlocked','Para definir a senha externa (PIN), Ã© necessÃ¡ria a senha de transaÃ§Ã£o.\nNo entanto, sua senha de transaÃ§Ã£o estÃ¡ bloqueada.\nPor favor, contate a administraÃ§Ã£o',NULL),(14433,'pt_BR:memberRecordType.layout.FLAT','Plano',NULL),(14434,'pt_BR:global.weekDay.short.FRIDAY','Sex',NULL),(14435,'pt_BR:loan.repayment.amountToRepaid','Valor',NULL),(14436,'pt_BR:guarantee.expiresFrom','InÃ­cio do vencimento',NULL),(14437,'pt_BR:paymentObligation.status.ACCEPTED','Aceita',NULL),(14438,'pt_BR:customField.error.removing','O campo customizado nÃ£o pÃ´de ser removido porque jÃ¡ estÃ¡ em uso',NULL);
/*!40000 ALTER TABLE `translation_messages` ENABLE KEYS */;
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
  CONSTRAINT `FK625D9832F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK625D98354774F2E` FOREIGN KEY (`loan_group_id`) REFERENCES `loan_groups` (`id`)
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
  CONSTRAINT `FK1E50E66E399E68AE` FOREIGN KEY (`generated_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK1E50E66E823FB102` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK1E50E66E9DCA1693` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK1E50E66ED56AF6F0` FOREIGN KEY (`original_type_id`) REFERENCES `transfer_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_fees`
--

LOCK TABLES `transaction_fees` WRITE;
/*!40000 ALTER TABLE `transaction_fees` DISABLE KEYS */;
INSERT INTO `transaction_fees` VALUES (1,'S','src','\0',13,25,'Transaction tax','','','Tax over all member to member trades','\0',5.000000,'F',NULL,NULL,NULL,NULL,NULL,'sys',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(2,'B','sys','\0',13,26,'Broker commission','','','Broker commission','\0',2.500000,'P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'S','C',20,'');
/*!40000 ALTER TABLE `transaction_fees` ENABLE KEYS */;
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
  CONSTRAINT `FKD472F23CA4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FKD472F23CFB43CB21` FOREIGN KEY (`preference_id`) REFERENCES `admin_notification_preferences` (`id`)
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
  CONSTRAINT `FK19C43358609349CF` FOREIGN KEY (`manager_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK19C4335881536B8E` FOREIGN KEY (`managed_group_id`) REFERENCES `groups` (`id`)
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
  CONSTRAINT `FK9BFD1F2E2B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK9BFD1F2EEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
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
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
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
  CONSTRAINT `FKFC716B825A5B3E8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKFC716B83794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
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
  CONSTRAINT `FK76C397252CF15203` FOREIGN KEY (`loan_repayment_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK76C397255CCE1A44` FOREIGN KEY (`loan_expiration_fee_type_id`) REFERENCES `transfer_types` (`id`),
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
INSERT INTO `transfer_types` VALUES (1,1,2,'\0','','\0','\0','\0','\0','Debit to community','From debit to community account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,3,'\0','','\0','\0','\0','\0','Voucher creation','Used to create vouchers',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,4,'\0','','\0','\0','\0','\0','Debit to organization','From debit to organization account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,2,1,'\0','','\0','\0','\0','\0','Community to debit','From community to debit account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,2,3,'\0','','\0','\0','\0','\0','Community to voucher','From community to voucher account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,2,4,'\0','','\0','\0','\0','\0','Community to organization','From community to organization account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,3,1,'\0','','\0','\0','\0','\0','Voucher destruction','Destroy vouchers',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,3,2,'\0','','\0','\0','\0','\0','Voucher to community','From voucher to community account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,3,4,'\0','','\0','\0','\0','\0','Voucher to organization','From voucher to organization account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,4,1,'\0','','\0','\0','\0','\0','Organization to debit','From organization to debit account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,4,2,'\0','','\0','\0','\0','\0','Organization to community','From organization to community account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,4,3,'\0','','\0','\0','\0','\0','Organization to voucher','From organization to voucher account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,5,5,'','\0','\0','\0','\0','','Trade transfer','Trades between members',NULL,1000.000000,NULL,'\0','\0','\0','\0','\0','',NULL,'2013-12-14',2,3,2,3,'No comments have been assigned to this transaction',0,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1,5,'','\0','\0','\0','\0','\0','Debit to member','From debit to member account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,2,5,'','\0','\0','\0','\0','\0','Community to member','From community to member account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,3,5,'','\0','\0','\0','\0','\0','Voucher cashing','Create vouchers',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,4,5,'','\0','\0','\0','\0','\0','Organization to member','From organization to member account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,5,2,'','\0','\0','\0','\0','\0','Member to community','From member to community account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,5,3,'','\0','\0','\0','\0','\0','Voucher buying','Used by a member to buy vouchers',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,5,4,'','\0','\0','\0','\0','\0','Member to organization','From member to organization account',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,5,1,'\0','\0','\0','\0','\0','\0','Loan repayment','Loan repayment\nTotal amount: #loanTotalAmount#',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,1,5,'','\0','\0','\0','\0','\0','Loan','Used when a loan is granted',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M','S',21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30),(23,1,5,'\0','\0','\0','\0','\0','\0','Initial credit','Initial credit on account activation',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,1,5,'','\0','\0','\0','\0','\0','Money deposit','When a member converts money into units, a payment of this type is performed',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,5,2,'\0','\0','\0','\0','\0','\0','Transaction tax payment','Transaction tax payment',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,2,5,'\0','\0','\0','\0','\0','\0','Broker commission payment','Broker commission payment',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,5,2,'\0','\0','\0','\0','\0','\0','Contribution payment','Units contribution payment',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,5,2,'\0','\0','\0','\0','\0','\0','Liquidity tax payment','Liquidity tax payment\n Period: #begin_date# - #end_date#',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,5,5,'','\0','\0','\0','\0','\0','Trade transfer from mobile','Trades between members from mobile service',NULL,500.000000,NULL,'\0','\0','\0','\0','\0','',NULL,'2013-12-14',2,3,2,3,'No comments have been assigned to this transaction',0,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,5,5,'','\0','\0','\0','','\0','External trade transfer','External trade between members',NULL,500.000000,NULL,'','','\0','\0','\0','\0',NULL,NULL,0,5,0,5,NULL,2,NULL,'M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `transfer_types` ENABLE KEYS */;
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
  CONSTRAINT `FKE831E404461D0C55` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `FKE831E404CB78BB0` FOREIGN KEY (`owner_group_id`) REFERENCES `groups` (`id`)
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
  CONSTRAINT `FK1D3D3FFF2F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK1D3D3FFFE9B959A1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`)
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
  CONSTRAINT `FK9B3E7BCB9383E848` FOREIGN KEY (`guarantee_type_id`) REFERENCES `guarantee_types` (`id`),
  CONSTRAINT `FK9B3E7BCBFB43CB21` FOREIGN KEY (`preference_id`) REFERENCES `admin_notification_preferences` (`id`)
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
  CONSTRAINT `FKC9084FA0823FB102` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKC9084FA09DCA1693` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`id`)
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
  CONSTRAINT `FKE08D27012F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FKE08D27013317FFBA` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
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
  CONSTRAINT `FK51FA69A3A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK51FA69A3BC65B77D` FOREIGN KEY (`service_client_id`) REFERENCES `service_clients` (`id`)
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
  CONSTRAINT `FK943CF27F2B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK943CF27F8799AF6F` FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK943CF27F9D63275E` FOREIGN KEY (`type_id`) REFERENCES `transfer_types` (`id`),
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
  CONSTRAINT `FK6EE4F972B1214C2` FOREIGN KEY (`by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK6EE4F973AEC8F84` FOREIGN KEY (`payment_obligation_id`) REFERENCES `payment_obligations` (`id`)
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
INSERT INTO `groups_account_fees` VALUES (5,1),(9,1),(5,2),(9,2),(5,4),(5,3);
/*!40000 ALTER TABLE `groups_account_fees` ENABLE KEYS */;
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
  CONSTRAINT `FK25F222E62F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK25F222E66957A5AA` FOREIGN KEY (`account_fee_log_id`) REFERENCES `account_fee_logs` (`id`),
  CONSTRAINT `FK25F222E6823FB102` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK25F222E69DCA1693` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK25F222E69F954783` FOREIGN KEY (`performed_by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK25F222E6A440355B` FOREIGN KEY (`sent_by_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK25F222E6A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK25F222E6B3A79238` FOREIGN KEY (`scheduled_payment_id`) REFERENCES `scheduled_payments` (`id`),
  CONSTRAINT `FK25F222E6C70B3BCA` FOREIGN KEY (`dest_type_id`) REFERENCES `account_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,NULL,2,NULL,2,'2013-12-16 00:29:10',5.000000,'A','From member to community account',2,18,2,1,NULL),(2,NULL,2,1,NULL,'2013-12-16 01:25:19',2.000000,'O','Traveller checks fee',3,19,NULL,NULL,NULL);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
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
  CONSTRAINT `FK355A402F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK355A40823FB102` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK355A409DCA1693` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`id`),
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
  CONSTRAINT `FKAF53099C617A8174` FOREIGN KEY (`external_transfer_id`) REFERENCES `external_transfers` (`id`),
  CONSTRAINT `FKAF53099CF9B21025` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`)
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
INSERT INTO `groups_default_channels` VALUES (5,1),(5,2),(5,3),(6,1),(9,1),(9,2),(9,3);
/*!40000 ALTER TABLE `groups_default_channels` ENABLE KEYS */;
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
  CONSTRAINT `FKE0379EAE108D798A` FOREIGN KEY (`transfer_authorization_id`) REFERENCES `transfer_authorizations` (`id`),
  CONSTRAINT `FKE0379EAE2F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FKE0379EAE3317FFBA` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FKE0379EAEB3A79238` FOREIGN KEY (`scheduled_payment_id`) REFERENCES `scheduled_payments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amount_reservations`
--

LOCK TABLES `amount_reservations` WRITE;
/*!40000 ALTER TABLE `amount_reservations` DISABLE KEYS */;
INSERT INTO `amount_reservations` VALUES (1,'P',5,'2013-12-16 01:20:00',5.000000,5,NULL,NULL);
/*!40000 ALTER TABLE `amount_reservations` ENABLE KEYS */;
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
  CONSTRAINT `FK5A4E59EDB45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK5A4E59EDBC65B77D` FOREIGN KEY (`service_client_id`) REFERENCES `service_clients` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization_levels`
--

LOCK TABLES `authorization_levels` WRITE;
/*!40000 ALTER TABLE `authorization_levels` DISABLE KEYS */;
INSERT INTO `authorization_levels` VALUES (1,1,0.000000,'B',30);
/*!40000 ALTER TABLE `authorization_levels` ENABLE KEYS */;
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
  CONSTRAINT `FK39737E38B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK39737E38E969E40E` FOREIGN KEY (`transaction_fee_id`) REFERENCES `transaction_fees` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (1,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-14 18:15:39',NULL),(2,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 00:20:27',NULL),(3,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 00:20:34',NULL),(4,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:04:04',NULL),(5,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:04:18',NULL),(6,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:21:04',NULL),(7,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:21:16',NULL),(8,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:24:39',NULL),(9,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 02:24:51',NULL),(10,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 04:52:03',NULL),(11,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-15 12:13:23',NULL),(12,'S','\0','alert.system.accountFeeRunning','Registration',NULL,NULL,NULL,NULL,'2013-12-16 00:29:10',NULL),(13,'S','\0','alert.system.accountFeeFinished','Registration',NULL,NULL,NULL,NULL,'2013-12-16 00:29:10',NULL),(14,'S','\0','alert.system.accountFeeRunning','Registration',NULL,NULL,NULL,NULL,'2013-12-16 00:51:58',NULL),(15,'S','\0','alert.system.accountFeeFinished','Registration',NULL,NULL,NULL,NULL,'2013-12-16 00:51:58',NULL),(16,'S','\0','alert.system.accountFeeRunning','Adhoc',NULL,NULL,NULL,NULL,'2013-12-16 01:23:40',NULL),(17,'S','\0','alert.system.accountFeeFinished','Adhoc',NULL,NULL,NULL,NULL,'2013-12-16 01:23:40',NULL),(18,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:02:45',NULL),(19,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:02:53',NULL),(20,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:18:44',NULL),(21,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:18:52',NULL),(22,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:19:33',NULL),(23,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:19:40',NULL),(24,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:21:43',NULL),(25,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:24:30',NULL),(26,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:29:34',NULL),(27,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:29:41',NULL),(28,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:29:52',NULL),(29,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:29:59',NULL),(30,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:30:06',NULL),(31,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:32:42',NULL),(32,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:37:26',NULL),(33,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:37:33',NULL),(34,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:40:51',NULL),(35,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:41:03',NULL),(36,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:48:29',NULL),(37,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:48:36',NULL),(38,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:54:27',NULL),(39,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:54:37',NULL),(40,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:55:02',NULL),(41,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:55:17',NULL),(42,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:57:40',NULL),(43,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 02:57:49',NULL),(44,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:12:14',NULL),(45,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:13:16',NULL),(46,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:13:23',NULL),(47,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:15:05',NULL),(48,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:15:11',NULL),(49,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:15:43',NULL),(50,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:15:49',NULL),(51,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:16:01',NULL),(52,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:19:51',NULL),(53,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:22:23',NULL),(54,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:22:31',NULL),(55,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:27:46',NULL),(56,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:27:52',NULL),(57,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:28:04',NULL),(58,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:28:10',NULL),(59,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:29:42',NULL),(60,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:31:44',NULL),(61,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:46:15',NULL),(62,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:46:22',NULL),(63,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:46:34',NULL),(64,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:46:40',NULL),(65,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:50:44',NULL),(66,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 03:50:50',NULL),(67,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:03:19',NULL),(68,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:11:05',NULL),(69,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:14:18',NULL),(70,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:14:25',NULL),(71,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:18:29',NULL),(72,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:18:35',NULL),(73,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:20:48',NULL),(74,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:20:54',NULL),(75,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:21:26',NULL),(76,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:23:57',NULL),(77,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:35:26',NULL),(78,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:35:33',NULL),(79,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:59:49',NULL),(80,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 04:59:56',NULL),(81,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:28:27',NULL),(82,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:28:39',NULL),(83,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:31:04',NULL),(84,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:31:15',NULL),(85,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:38:38',NULL),(86,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:38:49',NULL),(87,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:40:36',NULL),(88,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:40:47',NULL),(89,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:41:12',NULL),(90,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:41:37',NULL),(91,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:43:46',NULL),(92,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:43:57',NULL),(93,'S','\0','alert.system.applicationShutdown','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:47:26',NULL),(94,'S','\0','alert.system.applicationRestarted','robertombp2',NULL,NULL,NULL,NULL,'2013-12-16 05:47:37',NULL),(95,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-23 05:25:19',NULL),(96,'S','\0','alert.system.accountFeeRunning','Registration',NULL,NULL,NULL,NULL,'2013-12-23 05:28:03',NULL),(97,'S','\0','alert.system.accountFeeFinished','Registration',NULL,NULL,NULL,NULL,'2013-12-23 05:28:03',NULL),(98,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-23 05:58:04',NULL),(99,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-23 17:53:29',NULL),(100,'S','\0','alert.system.applicationShutdown','dell-xps',NULL,NULL,NULL,NULL,'2013-12-23 18:01:21',NULL),(101,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-23 18:13:25',NULL),(102,'S','\0','alert.system.applicationShutdown','dell-xps',NULL,NULL,NULL,NULL,'2013-12-23 18:19:42',NULL),(103,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-23 18:21:20',NULL),(104,'S','\0','alert.system.applicationShutdown','dell-xps',NULL,NULL,NULL,NULL,'2013-12-23 18:48:33',NULL),(105,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-23 18:54:13',NULL),(106,'S','\0','alert.system.applicationShutdown','dell-xps',NULL,NULL,NULL,NULL,'2013-12-23 18:55:17',NULL),(107,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-23 18:55:55',NULL),(108,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-25 16:49:52',NULL),(109,'S','\0','alert.system.applicationShutdown','dell-xps',NULL,NULL,NULL,NULL,'2013-12-25 17:09:23',NULL),(110,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-25 17:10:26',NULL),(111,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-26 03:41:06',NULL),(112,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-26 06:40:41',NULL),(113,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-26 16:56:54',NULL),(114,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-26 20:53:26',NULL),(115,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-26 20:59:44',NULL),(116,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-26 21:13:03',NULL),(117,'S','\0','alert.system.applicationShutdown','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-26 21:18:06',NULL),(118,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-26 21:20:40',NULL),(119,'S','\0','alert.system.applicationShutdown','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-26 22:02:44',NULL),(120,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-26 22:04:57',NULL),(121,'S','\0','alert.system.applicationShutdown','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-26 22:05:31',NULL),(122,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-26 22:07:20',NULL),(123,'S','\0','alert.system.applicationShutdown','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-26 22:14:17',NULL),(124,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-26 22:16:05',NULL),(125,'S','\0','alert.system.applicationShutdown','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:12:46',NULL),(126,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:14:48',NULL),(127,'S','\0','alert.system.applicationShutdown','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:16:46',NULL),(128,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:18:47',NULL),(129,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:22:45',NULL),(130,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:32:49',NULL),(131,'S','\0','alert.system.applicationShutdown','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:34:14',NULL),(132,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:36:14',NULL),(133,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6138.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:36:33',NULL),(134,'S','\0','alert.system.applicationShutdown','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:45:39',NULL),(135,'S','\0','alert.system.applicationShutdown','tomcat6.6.0.37.6138.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:46:02',NULL),(136,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6138.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:48:04',NULL),(137,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:49:44',NULL),(138,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6138.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:50:09',NULL),(139,'S','\0','alert.system.applicationShutdown','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:50:40',NULL),(140,'S','\0','alert.system.applicationShutdown','tomcat6.6.0.37.6138.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:50:59',NULL),(141,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6135.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:51:57',NULL),(142,'S','\0','alert.system.applicationRestarted','tomcat6.6.0.37.6138.acaciabank',NULL,NULL,NULL,NULL,'2013-12-27 05:52:18',NULL),(143,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-27 04:04:49',NULL),(144,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-27 04:56:22',NULL),(145,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-27 05:08:01',NULL),(146,'S','\0','alert.system.applicationShutdown','dell-xps',NULL,NULL,NULL,NULL,'2013-12-27 05:23:54',NULL),(147,'S','\0','alert.system.applicationRestarted','dell-xps',NULL,NULL,NULL,NULL,'2013-12-27 05:29:33',NULL);
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_log_entries`
--

LOCK TABLES `error_log_entries` WRITE;
/*!40000 ALTER TABLE `error_log_entries` DISABLE KEYS */;
INSERT INTO `error_log_entries` VALUES (1,'2013-12-16 02:24:53','/cyclos/do/member/accountHistory','\0',2,'java.lang.ClassCastException: com.sun.proxy.$Proxy60 cannot be cast to nl.strohalm.cyclos.services.transactions.InvoiceServiceLocal\n	at nl.strohalm.cyclos.controls.accounts.details.AccountHistoryAction.prepareForm(AccountHistoryAction.java:423)\n	at nl.strohalm.cyclos.controls.BaseQueryAction.executeAction(BaseQueryAction.java:94)\n	at nl.strohalm.cyclos.controls.BaseAction.execute(BaseAction.java:192)\n	at org.apache.struts.action.RequestProcessor.processActionPerform(RequestProcessor.java:425)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.doExecuteAction(CyclosRequestProcessor.java:459)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.executeAction(CyclosRequestProcessor.java:496)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.processActionPerform(CyclosRequestProcessor.java:256)\n	at org.apache.struts.action.RequestProcessor.process(RequestProcessor.java:228)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.process(CyclosRequestProcessor.java:144)\n	at org.apache.struts.action.ActionServlet.process(ActionServlet.java:1913)\n	at org.apache.struts.action.ActionServlet.doGet(ActionServlet.java:449)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:723)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at nl.strohalm.cyclos.http.LoggedUserFilter.execute(LoggedUserFilter.java:117)\n	at nl.strohalm.cyclos.http.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at nl.strohalm.cyclos.http.RequestProcessingFilter.execute(RequestProcessingFilter.java:74)\n	at nl.strohalm.cyclos.http.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at nl.strohalm.cyclos.http.SanitizerFilter.execute(SanitizerFilter.java:66)\n	at nl.strohalm.cyclos.http.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:293)\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:861)\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:606)\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\n	at java.lang.Thread.run(Thread.java:695)\n'),(2,'2013-12-16 03:23:42','/cyclos/do/admin/confirmPayment','\0',1,'java.lang.ClassCastException: nl.strohalm.cyclos.entities.accounts.SystemAccountOwner cannot be cast to nl.strohalm.cyclos.entities.members.Member\n	at nl.strohalm.cyclos.services.accounts.AccountServiceImpl.getStatusAt(AccountServiceImpl.java:931)\n	at nl.strohalm.cyclos.services.accounts.AccountServiceImpl.getStatus(AccountServiceImpl.java:566)\n	at nl.strohalm.cyclos.services.accounts.AccountServiceImpl.getCurrentStatus(AccountServiceImpl.java:473)\n	at nl.strohalm.cyclos.services.transactions.PaymentServiceImpl.validateAmount(PaymentServiceImpl.java:2393)\n	at nl.strohalm.cyclos.services.transactions.PaymentServiceImpl.insertTransferAndPayFees(PaymentServiceImpl.java:1941)\n	at nl.strohalm.cyclos.services.transactions.PaymentServiceImpl.performInsert(PaymentServiceImpl.java:2225)\n	at nl.strohalm.cyclos.services.transactions.PaymentServiceImpl.performInsert(PaymentServiceImpl.java:2344)\n	at nl.strohalm.cyclos.services.transactions.PaymentServiceImpl.access$11(PaymentServiceImpl.java:2341)\n	at nl.strohalm.cyclos.services.transactions.PaymentServiceImpl$5.doInTransaction(PaymentServiceImpl.java:1363)\n	at nl.strohalm.cyclos.services.transactions.PaymentServiceImpl$5.doInTransaction(PaymentServiceImpl.java:1)\n	at nl.strohalm.cyclos.utils.TransactionHelperImpl.maybeRunInNewTransaction(TransactionHelperImpl.java:183)\n	at nl.strohalm.cyclos.utils.TransactionHelperImpl.maybeRunInNewTransaction(TransactionHelperImpl.java:175)\n	at nl.strohalm.cyclos.services.transactions.PaymentServiceImpl.doInsert(PaymentServiceImpl.java:1355)\n	at nl.strohalm.cyclos.services.transactions.PaymentServiceImpl.doPayment(PaymentServiceImpl.java:1380)\n	at nl.strohalm.cyclos.services.transactions.PaymentServiceImpl.doPayment(PaymentServiceImpl.java:772)\n	at nl.strohalm.cyclos.services.transactions.PaymentServiceSecurity.doPayment(PaymentServiceSecurity.java:94)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\n	at java.lang.reflect.Method.invoke(Method.java:597)\n	at nl.strohalm.cyclos.spring.ServiceSecurityProxyInvocationHandler.invoke(ServiceSecurityProxyInvocationHandler.java:65)\n	at com.sun.proxy.$Proxy205.doPayment(Unknown Source)\n	at nl.strohalm.cyclos.controls.payments.ConfirmPaymentAction.handleSubmit(ConfirmPaymentAction.java:117)\n	at nl.strohalm.cyclos.controls.BaseFormAction.executeAction(BaseFormAction.java:52)\n	at nl.strohalm.cyclos.controls.BaseAction.execute(BaseAction.java:192)\n	at org.apache.struts.action.RequestProcessor.processActionPerform(RequestProcessor.java:425)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.doExecuteAction(CyclosRequestProcessor.java:459)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.executeAction(CyclosRequestProcessor.java:496)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.processActionPerform(CyclosRequestProcessor.java:256)\n	at org.apache.struts.action.RequestProcessor.process(RequestProcessor.java:228)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.process(CyclosRequestProcessor.java:144)\n	at org.apache.struts.action.ActionServlet.process(ActionServlet.java:1913)\n	at org.apache.struts.action.ActionServlet.doPost(ActionServlet.java:462)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:643)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:723)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at nl.strohalm.cyclos.http.LoggedUserFilter.execute(LoggedUserFilter.java:117)\n	at nl.strohalm.cyclos.http.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at nl.strohalm.cyclos.http.RequestProcessingFilter.execute(RequestProcessingFilter.java:74)\n	at nl.strohalm.cyclos.http.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at nl.strohalm.cyclos.http.SanitizerFilter.execute(SanitizerFilter.java:66)\n	at nl.strohalm.cyclos.http.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:293)\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:861)\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:606)\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\n	at java.lang.Thread.run(Thread.java:695)\n'),(3,'2013-12-16 04:53:19','/cyclos/pages/services/editServiceClient.jsp','\0',1,'org.apache.jasper.JasperException: An exception occurred processing JSP page /pages/services/editServiceClient.jsp at line 13\n\n10: var channelsById = {};\n11: var emptyPassword = ${empty serviceClient.password};\n12: </script>\n13: <ssl:form method=\"post\" action=\"${formAction}\">\n14: <html:hidden property=\"clientId\"/>\n15: <html:hidden property=\"serviceClient(id)\"/>\n16: \n\n\nStacktrace:\n	at org.apache.jasper.servlet.JspServletWrapper.handleJspException(JspServletWrapper.java:521)\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:412)\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:313)\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:260)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:723)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at nl.strohalm.cyclos.http.JspTransactionFilter$1.doInTransactionWithoutResult(JspTransactionFilter.java:84)\n	at org.springframework.transaction.support.TransactionCallbackWithoutResult.doInTransaction(TransactionCallbackWithoutResult.java:33)\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:130)\n	at nl.strohalm.cyclos.http.JspTransactionFilter.execute(JspTransactionFilter.java:80)\n	at nl.strohalm.cyclos.http.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at nl.strohalm.cyclos.http.LoggedUserFilter.execute(LoggedUserFilter.java:117)\n	at nl.strohalm.cyclos.http.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:293)\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:861)\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:606)\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\n	at java.lang.Thread.run(Thread.java:695)\nCaused by: javax.servlet.ServletException: javax.servlet.jsp.JspException: Form bean not specified on mapping for action: \"\"\n	at org.apache.jasper.runtime.PageContextImpl.doHandlePageException(PageContextImpl.java:865)\n	at org.apache.jasper.runtime.PageContextImpl.handlePageException(PageContextImpl.java:794)\n	at org.apache.jsp.pages.services.editServiceClient_jsp._jspService(editServiceClient_jsp.java:155)\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:723)\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:388)\n	... 26 more\nCaused by: javax.servlet.jsp.JspException: Form bean not specified on mapping for action: \"\"\n	at org.apache.struts.taglib.html.FormTag.lookup(FormTag.java:879)\n	at org.apache.struts.taglib.html.SecureFormTag.doStartTag(SecureFormTag.java:128)\n	at org.apache.jsp.pages.services.editServiceClient_jsp._jspx_meth_ssl_005fform_005f0(editServiceClient_jsp.java:194)\n	at org.apache.jsp.pages.services.editServiceClient_jsp._jspService(editServiceClient_jsp.java:147)\n	... 29 more\n'),(4,'2013-12-27 05:40:00','/do/admin/editTranslationMessage','\0',1,'java.lang.StringIndexOutOfBoundsException: String index out of range: -6\n	at java.lang.String.substring(String.java:1911)\n	at nl.strohalm.cyclos.utils.conversion.HtmlConverter.valueOf(HtmlConverter.java:115)\n	at nl.strohalm.cyclos.utils.conversion.HtmlConverter.valueOf(HtmlConverter.java:1)\n	at nl.strohalm.cyclos.utils.PropertyHelper.getAsObject(PropertyHelper.java:112)\n	at nl.strohalm.cyclos.utils.binding.PropertyBinder.readFromString(PropertyBinder.java:79)\n	at nl.strohalm.cyclos.utils.binding.BeanBinder.readInto(BeanBinder.java:100)\n	at nl.strohalm.cyclos.utils.binding.BeanBinder.readFromString(BeanBinder.java:87)\n	at nl.strohalm.cyclos.controls.customization.translationMessages.EditTranslationMessageAction.validateForm(EditTranslationMessageAction.java:97)\n	at nl.strohalm.cyclos.controls.BaseFormAction.handleValidation(BaseFormAction.java:85)\n	at nl.strohalm.cyclos.controls.BaseFormAction.executeAction(BaseFormAction.java:50)\n	at nl.strohalm.cyclos.controls.BaseAction.execute(BaseAction.java:192)\n	at org.apache.struts.action.RequestProcessor.processActionPerform(RequestProcessor.java:425)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.doExecuteAction(CyclosRequestProcessor.java:459)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.executeAction(CyclosRequestProcessor.java:496)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.processActionPerform(CyclosRequestProcessor.java:256)\n	at org.apache.struts.action.RequestProcessor.process(RequestProcessor.java:228)\n	at nl.strohalm.cyclos.struts.CyclosRequestProcessor.process(CyclosRequestProcessor.java:144)\n	at org.apache.struts.action.ActionServlet.process(ActionServlet.java:1913)\n	at org.apache.struts.action.ActionServlet.doPost(ActionServlet.java:462)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:643)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:723)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at nl.strohalm.cyclos.http.LoggedUserFilter.execute(LoggedUserFilter.java:117)\n	at nl.strohalm.cyclos.http.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at nl.strohalm.cyclos.http.RequestProcessingFilter.execute(RequestProcessingFilter.java:74)\n	at nl.strohalm.cyclos.http.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at nl.strohalm.cyclos.http.SanitizerFilter.execute(SanitizerFilter.java:66)\n	at nl.strohalm.cyclos.http.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103)\n	at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:615)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\n	at org.apache.catalina.ha.session.JvmRouteBinderValve.invoke(JvmRouteBinderValve.java:227)\n	at org.apache.catalina.ha.tcp.ReplicationValve.invoke(ReplicationValve.java:347)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:293)\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:861)\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:606)\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\n	at java.lang.Thread.run(Thread.java:724)\n');
/*!40000 ALTER TABLE `error_log_entries` ENABLE KEYS */;
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
  CONSTRAINT `FK74581F9F2F78F3B3` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK74581F9F6957A5AA` FOREIGN KEY (`account_fee_log_id`) REFERENCES `account_fee_logs` (`id`),
  CONSTRAINT `FK74581F9FE9B959A1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `FK74581F9FEAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_account_fee_logs`
--

LOCK TABLES `member_account_fee_logs` WRITE;
/*!40000 ALTER TABLE `member_account_fee_logs` DISABLE KEYS */;
INSERT INTO `member_account_fee_logs` VALUES (1,'2013-12-16 00:29:10',2,1,5.000000,'',0,NULL,1),(2,'2013-12-16 00:51:58',2,2,5.000000,'',0,4,NULL),(3,'2013-12-16 01:23:40',2,3,1.000000,'',0,6,NULL),(4,'2013-12-23 05:28:03',2,4,5.000000,'',0,8,NULL);
/*!40000 ALTER TABLE `member_account_fee_logs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `closed_account_balances`
--

LOCK TABLES `closed_account_balances` WRITE;
/*!40000 ALTER TABLE `closed_account_balances` DISABLE KEYS */;
INSERT INTO `closed_account_balances` VALUES (1,1,'2013-12-24',-230.000000,0.000000),(2,2,'2013-12-24',21.000000,0.000000),(3,5,'2013-12-24',209.000000,5.000000);
/*!40000 ALTER TABLE `closed_account_balances` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `members_channels` ENABLE KEYS */;
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
  CONSTRAINT `FK466919A8A4766B0A` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK466919A8A78BAF2E` FOREIGN KEY (`payment_filter_id`) REFERENCES `payment_filters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_types_payment_filters`
--

LOCK TABLES `transfer_types_payment_filters` WRITE;
/*!40000 ALTER TABLE `transfer_types_payment_filters` DISABLE KEYS */;
INSERT INTO `transfer_types_payment_filters` VALUES (29,1),(13,1),(21,2),(22,2),(25,3),(27,3),(28,3),(26,4),(16,5),(19,5),(19,6),(18,6),(20,6),(1,7),(4,7),(2,8),(7,8),(3,9),(10,9),(23,10),(22,10),(14,10),(5,11),(8,11),(1,12),(4,12),(6,13),(11,13),(27,14),(28,15),(26,16),(21,17),(22,17),(18,18),(15,18),(2,19),(7,19),(5,20),(8,20),(9,21),(12,21),(16,22),(19,22),(3,23),(10,23),(6,24),(11,24),(9,25),(12,25),(17,26),(20,26),(30,1);
/*!40000 ALTER TABLE `transfer_types_payment_filters` ENABLE KEYS */;
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
  CONSTRAINT `FKABBE5CA17514938B` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`),
  CONSTRAINT `FKABBE5CA1A288505` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`),
  CONSTRAINT `FKABBE5CA1B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_groups_custom_fields`
--

LOCK TABLES `member_groups_custom_fields` WRITE;
/*!40000 ALTER TABLE `member_groups_custom_fields` DISABLE KEYS */;
INSERT INTO `member_groups_custom_fields` VALUES (1,5),(1,6),(1,9),(2,5),(2,6),(2,9),(4,5),(4,6),(4,9),(7,5),(7,6),(7,9),(8,5),(8,6),(8,9),(9,5),(9,6),(9,9),(14,6),(15,6),(16,6),(19,6),(20,6),(18,6),(3,9),(3,5),(3,6),(17,6),(13,7),(13,9),(13,5),(13,6),(23,6),(25,6),(24,6),(26,6),(29,6),(30,6),(27,6),(28,6),(31,6),(32,6),(33,6),(34,6),(35,6),(36,6);
/*!40000 ALTER TABLE `member_groups_custom_fields` ENABLE KEYS */;
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
  CONSTRAINT `FK6033727133E01D0A` FOREIGN KEY (`registration_agreement_id`) REFERENCES `registration_agreements` (`id`),
  CONSTRAINT `FK603372714B8741B8` FOREIGN KEY (`broker_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK60337271B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK60337271EAE0AB57` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_members`
--

LOCK TABLES `pending_members` WRITE;
/*!40000 ALTER TABLE `pending_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_members` ENABLE KEYS */;
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
  CONSTRAINT `FKBF10006F239B8C3E` FOREIGN KEY (`a_rate_params_id`) REFERENCES `rate_parameters` (`id`),
  CONSTRAINT `FKBF10006FD5E3649E` FOREIGN KEY (`d_rate_params_id`) REFERENCES `rate_parameters` (`id`),
  CONSTRAINT `FKBF10006FFF05CD3E` FOREIGN KEY (`i_rate_params_id`) REFERENCES `rate_parameters` (`id`)
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
INSERT INTO `users` VALUES (1,'A','5eT01Zl32L0uXY46nkA446Mdk6Iczz3I','admin','D482671592944A548F6A97F95F1C79952C4C3F28ED2C2C3CC01A4E64FE87781B',NULL,'N','2013-12-27 09:05:25','2013-12-14 18:15:32',NULL,NULL,NULL),(2,'M','lkHBxlwS3igqt9C1aNdkCpMl4ZFsrq1K','12345','614EA75C89E2AB4011E3BDB093121FB258A26956A475292F3CA3EB297581DC82',NULL,'N','2013-12-27 05:20:29','2013-12-15 00:36:12',NULL,NULL,NULL),(3,'M','vMYkkgPdVmSueTGLRSxtlR4HwoLXm3Kr','9107','3B27B632CC5F65DFA83C45AC902ACBDF7A863E91E45F1645CAF9A2FED6A4C79A',NULL,'N','2013-12-15 03:29:36','2013-12-15 03:08:55',NULL,NULL,NULL),(4,'O','raML7cX93fw5BRXs5GDwYUFp6zFkYudy','theop','FFD23A566D99EF5E99379031ACC123F44E98BA1E9C57B1CCFCBAC2EE7ABC0F8C',NULL,'N',NULL,'2013-12-15 03:40:31',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
INSERT INTO `brokering_commission_status` VALUES (1,1,2,'C',2.500000,'P','2013-12-15',NULL,'2013-12-15 03:15:37',NULL,20,0,0.000000);
/*!40000 ALTER TABLE `brokering_commission_status` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_fee_logs`
--

LOCK TABLES `account_fee_logs` WRITE;
/*!40000 ALTER TABLE `account_fee_logs` DISABLE KEYS */;
INSERT INTO `account_fee_logs` VALUES (1,3,'2013-12-16 00:29:10','\0',0,0,1,'2013-12-16 00:29:10',5.000000,NULL,NULL,NULL),(2,3,'2013-12-16 00:51:58','\0',0,0,1,'2013-12-16 00:51:58',5.000000,NULL,NULL,NULL),(3,4,'2013-12-16 01:23:40','\0',0,0,1,'2013-12-16 01:23:40',1.000000,NULL,NULL,NULL),(4,3,'2013-12-23 05:27:11','\0',0,0,1,'2013-12-23 05:28:03',5.000000,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account_fee_logs` ENABLE KEYS */;
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
  CONSTRAINT `FKBB2E758E3794D57D` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKBB2E758EFB6913C5` FOREIGN KEY (`authorization_id`) REFERENCES `authorization_levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_group_authorization_level`
--

LOCK TABLES `admin_group_authorization_level` WRITE;
/*!40000 ALTER TABLE `admin_group_authorization_level` DISABLE KEYS */;
INSERT INTO `admin_group_authorization_level` VALUES (1,2),(1,1);
/*!40000 ALTER TABLE `admin_group_authorization_level` ENABLE KEYS */;
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
  CONSTRAINT `FK410DACF33439FCD` FOREIGN KEY (`subject_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK410DACF3AE7A5DD9` FOREIGN KEY (`new_broker_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK410DACF3BE3D3300` FOREIGN KEY (`old_group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK410DACF3C5BE0FA7` FOREIGN KEY (`new_group_id`) REFERENCES `groups` (`id`),
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
  CONSTRAINT `FK3EBE45E8CF860F8D` FOREIGN KEY (`fee_id`) REFERENCES `transaction_fees` (`id`),
  CONSTRAINT `FK3EBE45E8DD5BFBFE` FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK3EBE45E8E735A8CE` FOREIGN KEY (`loan_payment_id`) REFERENCES `loan_payments` (`id`),
  CONSTRAINT `FK3EBE45E8E846CE9F` FOREIGN KEY (`chargedback_by_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `FK3EBE45E8E969E40E` FOREIGN KEY (`transaction_fee_id`) REFERENCES `transaction_fees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
INSERT INTO `transfers` VALUES (1,1,5,14,'2013-12-16 00:46:52',30.000000,NULL,NULL,NULL,'O','2013-12-16 00:46:52',NULL,1,'some test money',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000000001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,5,2,18,'2013-08-16 00:47:49',5.000000,NULL,NULL,NULL,'O','2013-08-16 00:47:49',NULL,2,'From member to community account',NULL,NULL,NULL,NULL,NULL,1,NULL,'0000000002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,5,2,18,'2013-09-16 00:48:24',5.000000,NULL,NULL,NULL,'O','2013-09-16 00:48:24',NULL,2,'Paying some back',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000000003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,5,2,18,'2013-10-16 00:51:58',5.000000,NULL,NULL,NULL,'O','2013-10-16 00:51:58',NULL,NULL,'From member to community account',NULL,NULL,NULL,NULL,NULL,2,NULL,'0000000004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,5,7,30,'2013-12-16 01:20:00',5.000000,NULL,NULL,NULL,'P',NULL,NULL,2,'Transferring to external account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000000005',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(6,5,2,27,'2013-11-16 01:23:40',1.000000,NULL,NULL,NULL,'O','2013-11-16 01:23:40',NULL,NULL,'Units contribution payment',NULL,NULL,NULL,NULL,NULL,3,NULL,'0000000006',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,1,5,14,'2013-12-16 03:33:35',200.000000,NULL,NULL,NULL,'O','2013-12-16 03:33:35',NULL,1,'Sorry some more debt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000000007',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,5,2,18,'2013-12-23 05:28:03',5.000000,NULL,NULL,NULL,'O','2013-12-23 05:28:03',NULL,NULL,'From member to community account',NULL,NULL,NULL,NULL,NULL,4,NULL,'0000000008',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wrong_username_attempts`
--

LOCK TABLES `wrong_username_attempts` WRITE;
/*!40000 ALTER TABLE `wrong_username_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wrong_username_attempts` ENABLE KEYS */;
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
  CONSTRAINT `FKA3F5E80552CC4E04` FOREIGN KEY (`sms_mailing_id`) REFERENCES `sms_mailings` (`id`),
  CONSTRAINT `FKA3F5E805B45926EE` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
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
INSERT INTO `group_view_profile_permissions` VALUES (5,9),(5,5),(9,5),(9,9);
/*!40000 ALTER TABLE `group_view_profile_permissions` ENABLE KEYS */;
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
  CONSTRAINT `FK4302740234403429` FOREIGN KEY (`credit_fee_transfer_type_id`) REFERENCES `transfer_types` (`id`),
  CONSTRAINT `FK43027402907BA249` FOREIGN KEY (`issue_fee_transfer_type_id`) REFERENCES `transfer_types` (`id`),
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
  CONSTRAINT `FK6445482A4B8741B8` FOREIGN KEY (`broker_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FK6445482ABF06B6F9` FOREIGN KEY (`brokered_id`) REFERENCES `members` (`id`)
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
  CONSTRAINT `FK25619205461D0C55` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `FK256192055D14BEFA` FOREIGN KEY (`owner_group_id`) REFERENCES `groups` (`id`)
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
  CONSTRAINT `FK409CBDFC29C0E817` FOREIGN KEY (`guarantee_id`) REFERENCES `guarantees` (`id`),
  CONSTRAINT `FK409CBDFC40A58052` FOREIGN KEY (`seller_id`) REFERENCES `members` (`id`),
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
-- Dumping events for database 'cyclos3'
--

--
-- Dumping routines for database 'cyclos3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-27  7:19:20
