-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for iconnect
CREATE DATABASE IF NOT EXISTS `iconnect` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `iconnect`;

-- Dumping structure for table iconnect.tbl_accounts
DROP TABLE IF EXISTS `tbl_accounts`;
CREATE TABLE IF NOT EXISTS `tbl_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `cnum` varchar(20) NOT NULL,
  `bday` date NOT NULL,
  `age` int NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` int NOT NULL COMMENT 'admin=1 company=2 client=3',
  `verification_state` int NOT NULL DEFAULT '0' COMMENT '0 = not verified\r\n1 = semi verified\r\n2 = verified',
  `avatar` varchar(50) NOT NULL DEFAULT 'avatar_default.png',
  `department` varchar(50) NOT NULL DEFAULT 'none',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table iconnect.tbl_accounts: ~5 rows (approximately)
DELETE FROM `tbl_accounts`;
INSERT INTO `tbl_accounts` (`id`, `firstname`, `lastname`, `cnum`, `bday`, `age`, `address`, `email`, `password`, `type`, `verification_state`, `avatar`, `department`, `created_at`) VALUES
	(6, 'admin', 'admin', '09093939708', '2001-08-30', 25, '739 G. Araneta Avenue 1100', 'admin@connect.com', '1234', 1, 0, 'avatar_default.png', 'none', '2022-08-03 10:15:03'),
	(7, 'company', 'company', '09093939705', '2022-09-10', 25, 'Rm. 202 Grace Building Ortigas Avenue Greenhills 1500', 'company@connect.com', '1234', 2, 0, 'avatar_default.png', 'none', '2022-08-03 10:33:47'),
	(8, 'client', 'client', '09486502742', '2002-02-22', 25, 'P. Burgos Street corner Caseres Street', 'client@connect.com', '1234', 3, 2, 'avatar_default.png', 'I.T', '2022-08-03 10:34:28'),
	(9, 'client1', 'client1', '09755983121', '2002-02-22', 25, '#26 mBaguio First Hotel, Bonifacio Street', 'client1@connect.com', '1234', 3, 2, 'avatar_default.png', 'I.T', '2022-08-03 10:34:28'),
	(10, '1', '1', '09093939708', '2022-09-15', 12, '12121', '1234@yahoo.com', '123456789', 2, 0, 'avatar_default.png', 'none', '2022-09-14 09:06:23'),
	(12, 'marvin', 'villanea', '09486502742', '2006-02-07', 21, 'Purok 2, Tibanga-Saray', 'marvinvillanea1@gmail.com', 'marvin123', 3, 2, 'avatar_default.png', 'I.T', '2022-11-14 15:56:26');

-- Dumping structure for table iconnect.tbl_applicants
DROP TABLE IF EXISTS `tbl_applicants`;
CREATE TABLE IF NOT EXISTS `tbl_applicants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `companyid` int NOT NULL,
  `applicantsid` int NOT NULL,
  `jobid` int NOT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '1=pending\r\n2=hired\r\n3=decline',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table iconnect.tbl_applicants: ~5 rows (approximately)
DELETE FROM `tbl_applicants`;
INSERT INTO `tbl_applicants` (`id`, `companyid`, `applicantsid`, `jobid`, `status`, `created_at`) VALUES
	(1, 4, 8, 3, 1, '2022-08-12 06:00:44'),
	(2, 4, 8, 3, 1, '2022-08-12 06:00:44'),
	(3, 5, 8, 3, 2, '2022-08-12 06:00:44'),
	(4, 5, 8, 3, 2, '2022-08-12 06:00:44'),
	(5, 4, 8, 3, 1, '2022-09-02 06:31:42'),
	(7, 5, 8, 2, 1, '2022-11-15 02:06:55');

-- Dumping structure for table iconnect.tbl_company
DROP TABLE IF EXISTS `tbl_company`;
CREATE TABLE IF NOT EXISTS `tbl_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `c_logo` varchar(70) NOT NULL DEFAULT 'company_logo_default.png',
  `c_banner` varchar(70) NOT NULL DEFAULT 'company_banner_default.png',
  `c_name` varchar(50) NOT NULL,
  `c_address` varchar(100) NOT NULL,
  `c_cnum` varchar(20) NOT NULL,
  `c_position` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table iconnect.tbl_company: ~4 rows (approximately)
DELETE FROM `tbl_company`;
INSERT INTO `tbl_company` (`id`, `userid`, `c_logo`, `c_banner`, `c_name`, `c_address`, `c_cnum`, `c_position`, `department`, `created_at`) VALUES
	(4, 6, 'company_logo_default.png', 'company_banner_default.png', 'D Devs', 'Manila, Metro Manila', '09093939708', 'I.T', 'I.T', '2022-08-03 10:15:03'),
	(5, 7, 'company_logo_default.png', 'company_banner_default.png', 'Fux Devs', 'Manila, Metro Manila', '09093939708', 'I.T', 'I.T', '2022-08-03 10:33:47'),
	(6, 8, 'company_logo_default.png', 'company_banner_default.png', 'Metro Ui', 'Manila, Metro Manila', '09093939708', 'Advertiser', 'I.T', '2022-08-03 10:34:28'),
	(7, 10, 'company_logo_default.png', 'company_banner_default.png', '12adasd', 'asdasd', '09093939708', 'asdasdas', 'try', '2022-09-14 09:06:23');

-- Dumping structure for table iconnect.tbl_company_reports
DROP TABLE IF EXISTS `tbl_company_reports`;
CREATE TABLE IF NOT EXISTS `tbl_company_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `reported_by` int NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table iconnect.tbl_company_reports: ~3 rows (approximately)
DELETE FROM `tbl_company_reports`;
INSERT INTO `tbl_company_reports` (`id`, `company_id`, `reported_by`, `message`, `created_at`) VALUES
	(1, 4, 8, 'Miss leading information', '2022-08-26 18:35:28'),
	(2, 4, 8, 'Miss leading information', '2022-08-26 18:35:28'),
	(3, 4, 8, 'asdasdsa', '2022-09-01 23:43:15');

-- Dumping structure for table iconnect.tbl_jobs
DROP TABLE IF EXISTS `tbl_jobs`;
CREATE TABLE IF NOT EXISTS `tbl_jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `j_name` varchar(50) NOT NULL,
  `j_age` int NOT NULL,
  `j_min` decimal(50,0) NOT NULL,
  `j_max` decimal(50,0) NOT NULL,
  `j_currency_symbol` varchar(1) NOT NULL,
  `j_description` text NOT NULL,
  `j_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table iconnect.tbl_jobs: ~5 rows (approximately)
DELETE FROM `tbl_jobs`;
INSERT INTO `tbl_jobs` (`id`, `userid`, `j_name`, `j_age`, `j_min`, `j_max`, `j_currency_symbol`, `j_description`, `j_created_at`) VALUES
	(1, 7, 'I.T', 18, 15000, 200000, '₱', 'Solary', '2022-08-04 16:46:17'),
	(2, 7, 'Social Media Avertiser', 18, 10000, 200000, '₱', 'Solary', '2022-08-04 16:46:17'),
	(3, 6, 'Back End Developer', 18, 15000, 20000, '₱', '<p><strong>Bruh</strong></p>\r\n', '2022-08-11 21:22:23'),
	(4, 7, 'PHP Dev', 21, 15000, 30000, '₱', '<p>Hi</p>\r\n', '2022-09-14 10:23:22'),
	(5, 7, '1', 50, 1, 1, '₱', '<p>1</p>\r\n', '2022-09-14 10:24:26');

-- Dumping structure for table iconnect.tbl_notification
DROP TABLE IF EXISTS `tbl_notification`;
CREATE TABLE IF NOT EXISTS `tbl_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table iconnect.tbl_notification: ~20 rows (approximately)
DELETE FROM `tbl_notification`;
INSERT INTO `tbl_notification` (`id`, `user_id`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, 3, 'You`re hired, Hello $fullname, We see your resume and you have good potential for this kind of job $job_name , Please contact us on $company_cnum. - $company_name.', 0, '2022-11-14 15:05:23', '2022-11-14 15:05:23'),
	(2, 3, 'Hello client client, Your application for this position Back End Developer was declined - Fux Devs.', 0, '2022-11-14 15:07:13', '2022-11-14 15:07:13'),
	(3, 3, 'You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.', 0, '2022-11-14 15:07:36', '2022-11-14 15:07:36'),
	(4, 3, 'Hello client client, Your application for this position Back End Developer was declined - Fux Devs.', 0, '2022-11-14 15:08:23', '2022-11-14 15:08:23'),
	(5, 3, 'You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.', 0, '2022-11-14 15:08:44', '2022-11-14 15:08:44'),
	(6, 3, 'Hello client client, Your application for this position Back End Developer was declined - Fux Devs.', 0, '2022-11-14 15:08:53', '2022-11-14 15:08:53'),
	(7, 3, 'You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.', 0, '2022-11-14 15:11:49', '2022-11-14 15:11:49'),
	(8, 3, 'Hello client client, Your application for this position Back End Developer was declined - Fux Devs.', 0, '2022-11-14 15:12:23', '2022-11-14 15:12:23'),
	(9, 3, 'You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.', 0, '2022-11-14 15:14:03', '2022-11-14 15:14:03'),
	(10, 3, 'Hello client client, Your application for this position Back End Developer was declined - Fux Devs.', 0, '2022-11-14 15:14:13', '2022-11-14 15:14:13'),
	(11, 3, 'You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.', 0, '2022-11-14 15:15:09', '2022-11-14 15:15:09'),
	(12, 3, 'Hello client client, Your application for this position Back End Developer was declined - Fux Devs.', 0, '2022-11-14 15:15:19', '2022-11-14 15:15:19'),
	(13, 8, 'You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.', 0, '2022-11-14 15:17:34', '2022-11-15 01:50:22'),
	(14, 8, 'Hello client client, Your application for this position Back End Developer was declined - Fux Devs.', 1, '2022-11-14 15:17:41', '2022-11-15 01:53:06'),
	(15, 8, 'You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.', 1, '2022-11-14 15:24:44', '2022-11-15 01:52:58'),
	(16, 8, 'You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.', 1, '2022-11-14 15:24:54', '2022-11-15 01:52:26'),
	(17, 8, 'You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.', 1, '2022-11-14 15:27:14', '2022-11-15 01:52:19'),
	(18, 8, 'Hello client client, Your application for this position Back End Developer was declined - Fux Devs.', 0, '2022-11-15 01:54:19', '2022-11-15 01:54:19'),
	(19, 8, 'You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.', 0, '2022-11-15 01:54:23', '2022-11-15 01:54:23'),
	(20, 7, 'Company, Company, Applying for  Social Media Avertiser', 0, '2022-11-15 02:06:55', '2022-11-15 02:45:25');

-- Dumping structure for table iconnect.tbl_resume
DROP TABLE IF EXISTS `tbl_resume`;
CREATE TABLE IF NOT EXISTS `tbl_resume` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `path` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table iconnect.tbl_resume: ~5 rows (approximately)
DELETE FROM `tbl_resume`;
INSERT INTO `tbl_resume` (`id`, `userid`, `path`, `created_at`) VALUES
	(1, 6, 'example1.png', '2022-08-11 22:35:51'),
	(2, 7, 'example2.jpg', '2022-08-11 22:35:51'),
	(3, 8, 'c9f0f895fb98ab9159f51fd0297e236d.jpg', '2022-09-01 21:34:59'),
	(4, 9, '45c48cce2e2d7fbdea1afc51c7c6ad26.jpg', '2022-11-14 14:33:18'),
	(5, 12, 'c20ad4d76fe97759aa27a0c99bff6710.jpg', '2022-11-14 15:58:45');

-- Dumping structure for table iconnect.tbl_sms_logs
DROP TABLE IF EXISTS `tbl_sms_logs`;
CREATE TABLE IF NOT EXISTS `tbl_sms_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiverid` bigint NOT NULL DEFAULT '0',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table iconnect.tbl_sms_logs: ~58 rows (approximately)
DELETE FROM `tbl_sms_logs`;
INSERT INTO `tbl_sms_logs` (`id`, `receiverid`, `message`, `created_at`) VALUES
	(1, 9, 'LocalMJob \nVerification code: 354494', '2022-11-14 02:13:39'),
	(2, 9, '{"type":"USD","amount":25.225988}', '2022-11-14 02:46:19'),
	(3, 9, '{"type":"USD","amount":25.225988}', '2022-11-14 02:57:13'),
	(4, 9, '{"type":"USD","amount":25.225988}', '2022-11-14 02:57:20'),
	(5, 9, '{"type":"USD","amount":25.225988}', '2022-11-14 03:00:29'),
	(6, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"09093939705"}', '2022-11-14 03:00:29'),
	(7, 9, '{"type":"USD","amount":25.225988}', '2022-11-14 03:02:03'),
	(8, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"09755983121"}', '2022-11-14 03:02:03'),
	(9, 9, '{"type":"USD","amount":25.225988}', '2022-11-14 03:03:28'),
	(10, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"09755983121"}', '2022-11-14 03:03:28'),
	(11, 9, 'Client error: `POST https://api.movider.co/v1/verify` resulted in a `400 Bad Request` response:\n{"error":{"code":411,"name":"ERR_INVALID_RECEIVER_NUMBER","description":"Receivers number are invalid."}}\n', '2022-11-14 03:03:29'),
	(12, 9, '{"type":"USD","amount":25.225988}', '2022-11-14 03:07:46'),
	(13, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 03:07:46'),
	(14, 9, '{"request_id":"5nRJwCgt95yfmq9qXl94nL16683952663747","number":"639755983121","price":0.006}', '2022-11-14 03:07:46'),
	(15, 9, '{"type":"USD","amount":25.219988}', '2022-11-14 03:15:06'),
	(16, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 03:15:06'),
	(17, 9, '{"request_id":"5nRJwCgt95yfmq9qXl9TKR16683957064531","number":"639755983121","price":0.006}', '2022-11-14 03:15:06'),
	(18, 9, '{"type":"USD","amount":25.213988}', '2022-11-14 03:16:01'),
	(19, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 03:16:01'),
	(20, 9, 'Client error: `POST https://api.movider.co/v1/verify` resulted in a `400 Bad Request` response:\n{"error":{"code":441,"name":"ERR_NUMBER_IS_VERIFYING","description":"The receiver number is verifying."}}\n', '2022-11-14 03:16:01'),
	(21, 9, '{"type":"USD","amount":25.213988}', '2022-11-14 03:22:22'),
	(22, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 03:22:22'),
	(23, 9, '{"request_id":"5nRJwCgt95yfmq9qXl9rMw16683961428938","number":"639755983121","price":0.006}', '2022-11-14 03:22:22'),
	(24, 9, '{"type":"USD","amount":25.207988}', '2022-11-14 03:23:51'),
	(25, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 03:23:51'),
	(26, 9, 'Client error: `POST https://api.movider.co/v1/verify` resulted in a `400 Bad Request` response:\n{"error":{"code":441,"name":"ERR_NUMBER_IS_VERIFYING","description":"The receiver number is verifying."}}\n', '2022-11-14 03:23:51'),
	(27, 9, '{"type":"USD","amount":25.207988}', '2022-11-14 03:25:16'),
	(28, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 03:25:16'),
	(29, 9, 'Client error: `POST https://api.movider.co/v1/verify` resulted in a `400 Bad Request` response:\n{"error":{"code":441,"name":"ERR_NUMBER_IS_VERIFYING","description":"The receiver number is verifying."}}\n', '2022-11-14 03:25:16'),
	(30, 9, '{"type":"USD","amount":25.207988}', '2022-11-14 03:27:23'),
	(31, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 03:27:23'),
	(32, 9, 'Client error: `POST https://api.movider.co/v1/verify` resulted in a `400 Bad Request` response:\n{"error":{"code":441,"name":"ERR_NUMBER_IS_VERIFYING","description":"The receiver number is verifying."}}\n', '2022-11-14 03:27:23'),
	(33, 9, '{"type":"USD","amount":25.207988}', '2022-11-14 03:37:14'),
	(34, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 03:37:14'),
	(35, 9, '{"request_id":"5nRJwCgt95yfmq9qXlAhFy16683970342838","number":"639755983121","price":0.006}', '2022-11-14 03:37:14'),
	(36, 9, '{"type":"USD","amount":25.201988}', '2022-11-14 03:39:32'),
	(37, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 03:39:32'),
	(38, 9, 'Client error: `POST https://api.movider.co/v1/verify` resulted in a `400 Bad Request` response:\n{"error":{"code":441,"name":"ERR_NUMBER_IS_VERIFYING","description":"The receiver number is verifying."}}\n', '2022-11-14 03:39:32'),
	(39, 9, '{"type":"USD","amount":25.201988}', '2022-11-14 03:42:48'),
	(40, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 03:42:48'),
	(41, 9, '{"request_id":"5nRJwCgt95yfmq9qXlB1lv16683973682073","number":"639755983121","price":0.006}', '2022-11-14 03:42:48'),
	(42, 9, '{"type":"USD","amount":25.171988}', '2022-11-14 14:00:30'),
	(43, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 14:00:30'),
	(44, 9, '{"request_id":"5nRJwCgt95yfmq9qXly1SB16684344287422","number":"639755983121","price":0.006}', '2022-11-14 14:00:30'),
	(45, 9, '{"type":"USD","amount":25.165988}', '2022-11-14 14:04:04'),
	(46, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 14:04:04'),
	(47, 9, 'Client error: `POST https://api.movider.co/v1/verify` resulted in a `400 Bad Request` response:\n{"error":{"code":441,"name":"ERR_NUMBER_IS_VERIFYING","description":"The receiver number is verifying."}}\n', '2022-11-14 14:04:04'),
	(48, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","request_id":"5nRJwCgt95yfmq9qXly1SB16684344287422","code":"109933"}', '2022-11-14 14:06:14'),
	(49, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","request_id":"5nRJwCgt95yfmq9qXly1SB16684344287422","code":"109933"}', '2022-11-14 14:09:34'),
	(50, 9, '{"type":"USD","amount":25.165988}', '2022-11-14 14:09:38'),
	(51, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309755983121"}', '2022-11-14 14:09:38'),
	(52, 9, '{"request_id":"5nRJwCgt95yfmq9qXlyjW216684349778122","number":"639755983121","price":0.006}', '2022-11-14 14:09:38'),
	(53, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","request_id":"5nRJwCgt95yfmq9qXlyjW216684349778122","code":"210193"}', '2022-11-14 14:10:34'),
	(54, 9, '{"request_id":"5nRJwCgt95yfmq9qXlyjW216684349778122","price":0.006}', '2022-11-14 14:10:35'),
	(55, 8, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.","to":"+6309486502742"}', '2022-11-14 15:27:14'),
	(56, 8, '{"remaining_balance":25.147988,"total_sms":2,"phone_number_list":[{"number":"639486502742","message_id":"5nRJwCgt95yfmq9qXm4Ae016684396336512","price":0.012}],"bad_phone_number_list":[]}', '2022-11-14 15:27:14'),
	(57, 12, '{"type":"USD","amount":25.147988}', '2022-11-14 15:56:48'),
	(58, 12, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","code_length":"6","language":"en-us","pin_expire":"300","to":"+6309486502742"}', '2022-11-14 15:56:48'),
	(59, 12, '{"request_id":"5nRJwCgt95yfmq9qXm69fL16684414075689","number":"639486502742","price":0.006}', '2022-11-14 15:56:49'),
	(60, 12, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","request_id":"5nRJwCgt95yfmq9qXm69fL16684414075689","code":"037016"}', '2022-11-14 15:57:12'),
	(61, 12, '{"request_id":"5nRJwCgt95yfmq9qXm69fL16684414075689","price":0.006}', '2022-11-14 15:57:12'),
	(62, 8, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"Hello client client, Your application for this position Back End Developer was declined - Fux Devs.","to":"+6309486502742"}', '2022-11-15 01:54:19'),
	(63, 8, '{"remaining_balance":25.135988,"total_sms":1,"phone_number_list":[{"number":"639486502742","message_id":"5nRJwCgt95yfmq9qXmaNc216684772578016","price":0.006}],"bad_phone_number_list":[]}', '2022-11-15 01:54:20'),
	(64, 8, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"You`re hired, Hello client client, We see your resume and you have good potential for this kind of job Back End Developer , Please contact us on 09093939708. - Fux Devs.","to":"+6309486502742"}', '2022-11-15 01:54:23'),
	(65, 8, '{"remaining_balance":25.123988,"total_sms":2,"phone_number_list":[{"number":"639486502742","message_id":"5nRJwCgt95yfmq9qXmaNtW16684772615483","price":0.012}],"bad_phone_number_list":[]}', '2022-11-15 01:54:24');

-- Dumping structure for table iconnect.tbl_verificationcode
DROP TABLE IF EXISTS `tbl_verificationcode`;
CREATE TABLE IF NOT EXISTS `tbl_verificationcode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '0=not used\r\n1=used',
  `used_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table iconnect.tbl_verificationcode: ~4 rows (approximately)
DELETE FROM `tbl_verificationcode`;
INSERT INTO `tbl_verificationcode` (`id`, `session`, `code`, `status`, `used_at`, `created_at`) VALUES
	(17, 'dd3d05d7de99af7a376db3aaf6a18dba', '484709', 1, '2022-09-01 21:34:41', '2022-09-01 21:33:54'),
	(19, '5nRJwCgt95yfmq9qXlB1lv16683973682073', NULL, 0, '2022-11-14 03:42:48', '2022-11-14 03:42:48'),
	(20, '5nRJwCgt95yfmq9qXly1SB16684344287422', NULL, 0, '2022-11-14 14:00:30', '2022-11-14 14:00:30'),
	(21, '5nRJwCgt95yfmq9qXlyjW216684349778122', NULL, 1, '2022-11-14 14:10:35', '2022-11-14 14:09:38'),
	(22, '5nRJwCgt95yfmq9qXm69fL16684414075689', NULL, 1, '2022-11-14 15:57:12', '2022-11-14 15:56:49');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
