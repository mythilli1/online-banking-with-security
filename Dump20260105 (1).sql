-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: online_banking
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `account_branch`
--

DROP TABLE IF EXISTS `account_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_branch` (
  `account_id` varchar(10) NOT NULL,
  `branch_id` varchar(10) NOT NULL,
  PRIMARY KEY (`account_id`,`branch_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `account_branch_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `account_branch_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_branch`
--

LOCK TABLES `account_branch` WRITE;
/*!40000 ALTER TABLE `account_branch` DISABLE KEYS */;
INSERT INTO `account_branch` VALUES ('ACC001','BR001'),('ACC002','BR001'),('ACC003','BR002'),('ACC004','BR002'),('ACC005','BR003');
/*!40000 ALTER TABLE `account_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_type` (
  `type_name` varchar(20) NOT NULL,
  `interest_rate` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES ('Current',0.00),('Fixed',5.00),('Savings',3.50);
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_id` varchar(10) NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `account_number` varchar(20) NOT NULL,
  `account_type` varchar(20) DEFAULT NULL,
  `balance` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `customer_id` (`customer_id`),
  KEY `account_type` (`account_type`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`customer_id`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`account_type`) REFERENCES `account_type` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('ACC001','CUST001','ACC1001','Savings',10000.00,'2026-01-01 04:30:00'),('ACC002','CUST002','ACC1002','Current',32000.00,'2026-01-01 04:35:00'),('ACC003','CUST003','ACC1003','Savings',10000.00,'2026-01-01 04:40:00'),('ACC004','CUST004','ACC1004','Fixed',20000.00,'2026-01-01 04:45:00'),('ACC005','CUST005','ACC1005','Savings',1500.00,'2026-01-01 04:50:00'),('ACC006','CUST006','ACC1006','Current',8000.00,'2026-01-01 04:55:00'),('ACC007','CUST007','ACC1007','Savings',12000.00,'2026-01-01 05:00:00'),('ACC008','CUST008','ACC1008','Current',9000.00,'2026-01-01 05:05:00'),('ACC009','CUST009','ACC1009','Fixed',30000.00,'2026-01-01 05:10:00'),('ACC010','CUST010','ACC1010','Savings',4000.00,'2026-01-01 05:15:00'),('ACC011','CUST011','ACC1011','Savings',6000.00,'2026-01-01 05:20:00'),('ACC012','CUST012','ACC1012','Current',10000.00,'2026-01-01 05:25:00'),('ACC013','CUST013','ACC1013','Fixed',50000.00,'2026-01-01 05:30:00'),('ACC014','CUST014','ACC1014','Savings',7500.00,'2026-01-01 05:35:00'),('ACC015','CUST015','ACC1015','Current',20000.00,'2026-01-01 05:38:00');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `audit_id` varchar(36) NOT NULL,
  `admin_id` varchar(10) DEFAULT NULL,
  `action_description` varchar(255) DEFAULT NULL,
  `action_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `audit_log_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
INSERT INTO `audit_log` VALUES ('8787872a-e9eb-11f0-a128-f8b46a1af961','CUST001','Locked user account CUST005','2026-01-05 04:03:44');
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiaries`
--

DROP TABLE IF EXISTS `beneficiaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiaries` (
  `beneficiary_id` varchar(10) NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `beneficiary_account` varchar(20) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`beneficiary_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `beneficiaries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiaries`
--

LOCK TABLES `beneficiaries` WRITE;
/*!40000 ALTER TABLE `beneficiaries` DISABLE KEYS */;
INSERT INTO `beneficiaries` VALUES ('BEN001','CUST001','ACC002','ABC Bank'),('BEN002','CUST001','ACC003','XYZ Bank'),('BEN003','CUST002','ACC001','ABC Bank');
/*!40000 ALTER TABLE `beneficiaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `branch_id` varchar(10) NOT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `IFSC_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  UNIQUE KEY `IFSC_code` (`IFSC_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES ('BR001','Velachery Branch','Chennai','IFSC001'),('BR002','Tambaram Branch','Chennai','IFSC002'),('BR003','T Nagar Branch','Chennai','IFSC003');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_transfers`
--

DROP TABLE IF EXISTS `daily_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_transfers` (
  `transfer_date` date NOT NULL,
  `account_id` varchar(10) NOT NULL,
  `total_amount` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`transfer_date`,`account_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `daily_transfers_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_transfers`
--

LOCK TABLES `daily_transfers` WRITE;
/*!40000 ALTER TABLE `daily_transfers` DISABLE KEYS */;
INSERT INTO `daily_transfers` VALUES ('2026-01-04','ACC001',25000.00);
/*!40000 ALTER TABLE `daily_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kyc_details`
--

DROP TABLE IF EXISTS `kyc_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kyc_details` (
  `kyc_id` varchar(10) NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `id_type` varchar(20) DEFAULT NULL,
  `id_number` varchar(50) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`kyc_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `kyc_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kyc_details`
--

LOCK TABLES `kyc_details` WRITE;
/*!40000 ALTER TABLE `kyc_details` DISABLE KEYS */;
INSERT INTO `kyc_details` VALUES ('KYC001','CUST001','Aadhar','1234-5678-9012',1),('KYC002','CUST002','PAN','ABCDE1234F',1),('KYC003','CUST003','Aadhar','9999-8888-7777',0);
/*!40000 ALTER TABLE `kyc_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_history` (
  `login_id` varchar(36) NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_history`
--

LOCK TABLES `login_history` WRITE;
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_log`
--

DROP TABLE IF EXISTS `message_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_log` (
  `message_id` varchar(36) NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `channel` varchar(10) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `message` text,
  `sent_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `message_log_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_log`
--

LOCK TABLES `message_log` WRITE;
/*!40000 ALTER TABLE `message_log` DISABLE KEYS */;
INSERT INTO `message_log` VALUES ('7a9f7cfc-e93e-11f0-a128-f8b46a1af961','CUST001','SMS','9876543210','Transferred 1000 to ACC002','2026-01-04 07:25:00');
/*!40000 ALTER TABLE `message_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` varchar(36) NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `message` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_validation`
--

DROP TABLE IF EXISTS `otp_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_validation` (
  `otp_id` varchar(36) NOT NULL,
  `account_id` varchar(10) DEFAULT NULL,
  `otp_code` varchar(6) DEFAULT NULL,
  `expiry_time` timestamp NULL DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`otp_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `otp_validation_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_validation`
--

LOCK TABLES `otp_validation` WRITE;
/*!40000 ALTER TABLE `otp_validation` DISABLE KEYS */;
INSERT INTO `otp_validation` VALUES ('09805e84-e93d-11f0-a128-f8b46a1af961','ACC001','123456','2026-01-04 07:19:41',1),('2d31befe-e942-11f0-a128-f8b46a1af961','ACC001','123456','2026-01-04 07:56:28',0),('55455387-e942-11f0-a128-f8b46a1af961','ACC001','123456','2026-01-04 07:57:35',0),('84ca3988-e940-11f0-a128-f8b46a1af961','ACC001','123456','2026-01-04 07:44:36',1),('97698012-e943-11f0-a128-f8b46a1af961','ACC001','123456','2026-01-04 08:06:36',0),('c338804b-e941-11f0-a128-f8b46a1af961','ACC001','123456','2026-01-04 07:53:30',1),('d57fdab8-e941-11f0-a128-f8b46a1af961','ACC001','123456','2026-01-04 07:54:01',1),('eb5354f6-e943-11f0-a128-f8b46a1af961','ACC001','123456','2026-01-04 08:08:56',0),('f05fbdcf-e941-11f0-a128-f8b46a1af961','ACC001','123456','2026-01-04 07:54:46',0);
/*!40000 ALTER TABLE `otp_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_name` varchar(20) NOT NULL,
  PRIMARY KEY (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('Admin'),('Customer'),('Teller');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` varchar(36) NOT NULL,
  `account_id` varchar(10) DEFAULT NULL,
  `transaction_type` varchar(20) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES ('0d4db061-e93d-11f0-a128-f8b46a1af961','ACC001','Transfer Out',5000.00,'2026-01-04 07:14:47'),('0d4db54e-e93d-11f0-a128-f8b46a1af961','ACC002','Transfer In',5000.00,'2026-01-04 07:14:47'),('c5f41087-e941-11f0-a128-f8b46a1af961','ACC001','Transfer Out',5000.00,'2026-01-04 07:48:35'),('c5f4185b-e941-11f0-a128-f8b46a1af961','ACC002','Transfer In',5000.00,'2026-01-04 07:48:35'),('d84714c2-e941-11f0-a128-f8b46a1af961','ACC001','Transfer Out',5000.00,'2026-01-04 07:49:05'),('d8471dbf-e941-11f0-a128-f8b46a1af961','ACC002','Transfer In',5000.00,'2026-01-04 07:49:05'),('deaac4a9-e940-11f0-a128-f8b46a1af961','ACC001','Transfer Out',10000.00,'2026-01-04 07:42:07'),('deaac9d6-e940-11f0-a128-f8b46a1af961','ACC002','Transfer In',10000.00,'2026-01-04 07:42:07');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `customer_id` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(256) NOT NULL,
  `role_name` varchar(20) NOT NULL,
  `failed_attempts` int DEFAULT '0',
  `account_locked` tinyint(1) DEFAULT '0',
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reset_token` varchar(100) DEFAULT NULL,
  `token_expiry` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `username` (`username`),
  KEY `role_name` (`role_name`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_name`) REFERENCES `roles` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('CUST001','alice','5e884898da28047151d0e56f8dc62927','Customer',3,1,'9876543210','alice@gmail.com','2026-01-01 04:30:00',NULL,NULL),('CUST002','bob','5e884898da28047151d0e56f8dc62927','Customer',0,0,'9123456789','bob@gmail.com','2026-01-01 04:35:00',NULL,NULL),('CUST003','charlie','5e884898da28047151d0e56f8dc62927','Teller',0,0,'9012345678','charlie@gmail.com','2026-01-01 04:40:00',NULL,NULL),('CUST004','david','5e884898da28047151d0e56f8dc62927','Customer',0,0,'9988776655','david@gmail.com','2026-01-01 04:45:00',NULL,NULL),('CUST005','eva','5e884898da28047151d0e56f8dc62927','Customer',0,0,'9876501234','eva@gmail.com','2026-01-01 04:50:00',NULL,NULL),('CUST006','frank','5e884898da28047151d0e56f8dc62927','Customer',0,0,'9765432109','frank@gmail.com','2026-01-01 04:55:00',NULL,NULL),('CUST007','grace','5e884898da28047151d0e56f8dc62927','Customer',0,0,'9654321098','grace@gmail.com','2026-01-01 05:00:00',NULL,NULL),('CUST008','harry','5e884898da28047151d0e56f8dc62927','Teller',0,0,'9543210987','harry@gmail.com','2026-01-01 05:05:00',NULL,NULL),('CUST009','irene','5e884898da28047151d0e56f8dc62927','Customer',0,0,'9432109876','irene@gmail.com','2026-01-01 05:10:00',NULL,NULL),('CUST010','jack','5e884898da28047151d0e56f8dc62927','Customer',0,0,'9321098765','jack@gmail.com','2026-01-01 05:15:00',NULL,NULL),('CUST011','kate','5e884898da28047151d0e56f8dc62927','Customer',0,0,'9210987654','kate@gmail.com','2026-01-01 05:20:00',NULL,NULL),('CUST012','leo','5e884898da28047151d0e56f8dc62927','Customer',0,0,'9109876543','leo@gmail.com','2026-01-01 05:25:00',NULL,NULL),('CUST013','mia','5e884898da28047151d0e56f8dc62927','Customer',0,0,'9098765432','mia@gmail.com','2026-01-01 05:30:00',NULL,NULL),('CUST014','nick','5e884898da28047151d0e56f8dc62927','Customer',0,0,'9087654321','nick@gmail.com','2026-01-01 05:35:00',NULL,NULL),('CUST015','olivia','5e884898da28047151d0e56f8dc62927','Admin',0,0,'9076543210','olivia@gmail.com','2026-01-01 05:40:00',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_daily_transfer_summary`
--

DROP TABLE IF EXISTS `vw_daily_transfer_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_daily_transfer_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_daily_transfer_summary` AS SELECT 
 1 AS `transfer_date`,
 1 AS `account_number`,
 1 AS `username`,
 1 AS `total_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_locked_accounts`
--

DROP TABLE IF EXISTS `vw_locked_accounts`;
/*!50001 DROP VIEW IF EXISTS `vw_locked_accounts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_locked_accounts` AS SELECT 
 1 AS `username`,
 1 AS `phone`,
 1 AS `email`,
 1 AS `failed_attempts`,
 1 AS `account_locked`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pending_kyc`
--

DROP TABLE IF EXISTS `vw_pending_kyc`;
/*!50001 DROP VIEW IF EXISTS `vw_pending_kyc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pending_kyc` AS SELECT 
 1 AS `username`,
 1 AS `id_type`,
 1 AS `id_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_recent_transactions`
--

DROP TABLE IF EXISTS `vw_recent_transactions`;
/*!50001 DROP VIEW IF EXISTS `vw_recent_transactions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_recent_transactions` AS SELECT 
 1 AS `transaction_id`,
 1 AS `account_number`,
 1 AS `username`,
 1 AS `transaction_type`,
 1 AS `amount`,
 1 AS `transaction_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_daily_transfer_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_daily_transfer_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_daily_transfer_summary` AS select `dt`.`transfer_date` AS `transfer_date`,`a`.`account_number` AS `account_number`,`u`.`username` AS `username`,`dt`.`total_amount` AS `total_amount` from ((`daily_transfers` `dt` join `accounts` `a` on((`dt`.`account_id` = `a`.`account_id`))) join `users` `u` on((`a`.`customer_id` = `u`.`customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_locked_accounts`
--

/*!50001 DROP VIEW IF EXISTS `vw_locked_accounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_locked_accounts` AS select `users`.`username` AS `username`,`users`.`phone` AS `phone`,`users`.`email` AS `email`,`users`.`failed_attempts` AS `failed_attempts`,`users`.`account_locked` AS `account_locked` from `users` where (`users`.`account_locked` = true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pending_kyc`
--

/*!50001 DROP VIEW IF EXISTS `vw_pending_kyc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pending_kyc` AS select `u`.`username` AS `username`,`k`.`id_type` AS `id_type`,`k`.`id_number` AS `id_number` from (`kyc_details` `k` join `users` `u` on((`k`.`customer_id` = `u`.`customer_id`))) where (`k`.`verified` = false) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_recent_transactions`
--

/*!50001 DROP VIEW IF EXISTS `vw_recent_transactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_recent_transactions` AS select `t`.`transaction_id` AS `transaction_id`,`a`.`account_number` AS `account_number`,`u`.`username` AS `username`,`t`.`transaction_type` AS `transaction_type`,`t`.`amount` AS `amount`,`t`.`transaction_date` AS `transaction_date` from ((`transactions` `t` join `accounts` `a` on((`t`.`account_id` = `a`.`account_id`))) join `users` `u` on((`a`.`customer_id` = `u`.`customer_id`))) order by `t`.`transaction_date` desc limit 50 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-05 10:31:08
