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

-- Dumping structure for table psa.applicants
CREATE TABLE IF NOT EXISTS `applicants` (
  `applicant_id` int NOT NULL AUTO_INCREMENT,
  `job_id` int DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `resume` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '0 = pendding ,, 1 = accept ,  2 = reject',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text,
  PRIMARY KEY (`applicant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table psa.applicants: ~3 rows (approximately)
INSERT INTO `applicants` (`applicant_id`, `job_id`, `first_name`, `last_name`, `email`, `phone_no`, `resume`, `status`, `created_at`, `message`) VALUES
	(3, 32, 'villanea', 'marvin', 'marvinvillanea1@gmail.com', '09755983121', '370776c06dc7bed2c9e67c2eb80cc04b_villanea_marvin.pdf', '1', '2022-12-30 03:18:45', 'afdsafdsafadsfadsfsadfsadf'),
	(4, 33, 'testing1', 'testing1', 'testing1@gmail.com', '09755983121', 'fac3b206c18e37abfacdb0a4e3f25c38_testing1_testing1.pdf', '1', '2022-12-30 14:10:02', '10 years experiecne');

-- Dumping structure for table psa.tbl_accounts
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
  `type` int NOT NULL COMMENT 'admin(HR)=1 , company(unithead)=2, chief statstics= 3, chief employee= 4',
  `status_id` int DEFAULT '0' COMMENT '0 =active, 1 = not active',
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'none',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table psa.tbl_accounts: ~12 rows (approximately)
INSERT INTO `tbl_accounts` (`id`, `firstname`, `lastname`, `cnum`, `bday`, `age`, `address`, `email`, `password`, `type`, `status_id`, `gender`, `created_at`, `updated_at`) VALUES
	(6, 'admin', 'admin', '09093939708', '2001-08-30', 25, '739 G. Araneta Avenue 1100', 'admin@connect.com', '1234', 1, 1, 'none', '2022-08-03 10:15:03', '2022-12-18 03:12:36'),
	(7, 'company', 'company', '09093939705', '2022-09-10', 25, 'Rm. 202 Grace Building Ortigas Avenue Greenhills 1500', 'company@connect.com', '1234', 2, 1, 'none', '2022-08-03 10:33:47', '2022-12-18 02:56:36'),
	(8, 'client', 'client', '09486502742', '2002-02-22', 25, 'P. Burgos Street corner Caseres Street', 'client@connect.com', '1234', 3, 1, 'I.T', '2022-08-03 10:34:28', '2022-12-18 02:56:22'),
	(9, 'client1', 'client1', '09755983121', '2002-02-22', 25, '#26 mBaguio First Hotel, Bonifacio Street', 'client1@connect.com', '1234', 3, 1, 'I.T', '2022-08-03 10:34:28', '2022-12-13 05:37:42'),
	(10, '1', '1', '09093939708', '2022-09-15', 12, '12121', '1234@yahoo.com', '123456789', 2, 1, 'none', '2022-09-14 09:06:23', '2022-12-14 21:16:05'),
	(12, 'marvin', 'villanea', '09486502742', '2006-02-07', 21, 'Purok 2, Tibanga-Saray', 'marvinvillanea1@gmail.com', 'marvin123', 3, 1, 'I.T', '2022-11-14 15:56:26', '2022-12-18 02:59:32'),
	(13, 'VILLANEA', 'MARVIN', '09755983121', '2022-02-13', 23, 'adfafdaf', 'courier@gmail.com', 'testing123', 2, 0, 'none', '2022-11-26 13:17:37', '2022-12-13 05:35:50'),
	(15, 'VILLANEA', 'MARVIN', '09755983121', '2022-11-09', 23, 'testing123', 'USDggcharot@gmail.com', 'USDggcharot', 3, 0, 'dasfadsfas', '2022-11-26 13:58:03', '2022-12-13 05:35:50'),
	(17, 'VILLANEA', 'MARVIN', '09755983121', '2022-12-15', 23, 'testing123', 'admin1234444@connect.com', 'admin1234444', 2, 0, 'none', '2022-12-14 20:44:03', '2022-12-14 20:44:03'),
	(18, 'VILLANEA', 'MARVIN', '09755983121', '2022-12-30', 21, 'Purok 2, Tibanga-Saray', 'marvinvillanea122@gmail.com', 'marvinvillanea122', 3, 0, 'I.T', '2022-12-14 20:58:07', '2022-12-14 20:58:07'),
	(19, 'VILLANEA', 'MARVIN', '09755983121', '2001-06-18', 21, 'Tibanga Iligan City', 'marvinvillanea1222222@gmail.com', 'marvinvillanea1222222', 2, 1, 'none', '2022-12-18 03:04:51', '2022-12-18 03:06:24'),
	(20, 'VILLANEA', 'MARVIN', '09755983121', '2022-12-18', 23, 'testing123', 'marvinvillanea123211@gmail.com', 'marvinvillanea123211', 3, 1, 'I.T', '2022-12-18 03:12:19', '2022-12-18 03:12:59');

-- Dumping structure for table psa.tbl_jobs
CREATE TABLE IF NOT EXISTS `tbl_jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `j_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `j_number_of_vacancy` int DEFAULT '0',
  `j_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `j_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `J_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table psa.tbl_jobs: ~3 rows (approximately)
INSERT INTO `tbl_jobs` (`id`, `j_name`, `j_number_of_vacancy`, `j_description`, `j_created_at`, `J_updated_at`) VALUES
	(3, 'Back End Developer', 0, '<p><strong>Bruh</strong></p>\r\n', '2022-08-11 21:22:23', '2022-12-23 04:34:53'),
	(32, 'Accountant', 1, '<p><strong>MedSpecialized, Inc.</strong>&nbsp;is looking for an&nbsp;<strong>Accountant</strong>!</p>\r\n\r\n<p><strong>About the account:</strong>&nbsp;<strong>DrCatalyst</strong></p>\r\n\r\n<p><br />\r\nDrCatalyst (DrC) is a remote healthcare staffing organization that has over 250 billable staff from the Philippines.&nbsp;<br />\r\n<br />\r\n<strong>Work Schedule and Arrangement:</strong>&nbsp;10&nbsp;PM - 7&nbsp;AM PHT (Full time);&nbsp;Remote set-up<br />\r\n<br />\r\n<strong>Office Location:</strong>&nbsp;8th floor Skyrise 4B Building, IT Park, Lahug, Cebu City, Cebu<br />\r\n<br />\r\n<strong>Responsibilities:</strong></p>\r\n\r\n<ul>\r\n	<li>Processing payment of vendor invoices in a timely and organized manner</li>\r\n	<li>Perform account reconciliation (bank, credit card, etc.)</li>\r\n	<li>Examine financial transactions and ensure adequate documentation</li>\r\n	<li>Maintain account schedules (Fixed Asset, Loan, Prepaid Expenses, etc.)</li>\r\n	<li>Perform month-end and year-end closing procedures</li>\r\n	<li>Preparation of FS and reporting to management</li>\r\n	<li>Provide support during audit and tax reporting</li>\r\n	<li>Preparation of ad hoc reports needed by management.</li>\r\n</ul>\r\n\r\n<p><strong>Requirements:</strong></p>\r\n\r\n<ul>\r\n	<li>Bachelor&rsquo;s degree in Management Accounting or Accountancy</li>\r\n	<li>Must be college graduate</li>\r\n	<li>Accounts Payable, General Accounting, Reconciliation, and auditing experience preferred</li>\r\n	<li>At least 1 year accounting related experience preferably from audit firms</li>\r\n	<li>Good English communication skills</li>\r\n	<li>Someone who has initiative and can work with less supervision</li>\r\n	<li>Time management, data entry management, and general math skills</li>\r\n</ul>\r\n\r\n<p><strong>Salary and monetary benefits (in PHP):</strong></p>\r\n\r\n<ul>\r\n	<li>Monthly salary of 20,000 or more depending on experience</li>\r\n	<li>New hire bonus of 5,000&nbsp;</li>\r\n</ul>\r\n\r\n<p><strong>Perks and other benefits:</strong></p>\r\n\r\n<ul>\r\n	<li>Equipment (PC/Laptop)&nbsp;provided</li>\r\n	<li>Paid Training Period</li>\r\n	<li>All national Philippines and USA holidays are observed</li>\r\n	<li>Paid time off&mdash;public holidays, vacation, and personal time off</li>\r\n	<li>Robust and effective Government Benefits Administration</li>\r\n	<li>Lactation breaks (for breastfeeding moms)</li>\r\n	<li>Discounted optical services with our partner clinic</li>\r\n	<li>Free lunch/dinner and unlimited coffee and ice cream daily (for on site employees)</li>\r\n	<li>Free Health insurance with one (1) free dependent</li>\r\n	<li>Free Life insurance</li>\r\n	<li>Free Accident insurance</li>\r\n	<li>Relocation allowance for new hires (from Outside Cebu)</li>\r\n	<li>Company-sponsored outings</li>\r\n	<li>Interest-based employee clubs (DOTA, Basketball, Dance, Music, Photography, Yoga)</li>\r\n	<li>International travel opportunities (India and US office)</li>\r\n</ul>\r\n\r\n<p><strong>Our Recruitment Process:</strong></p>\r\n\r\n<ol>\r\n	<li>Candidate Application Form</li>\r\n	<li>General Assessment&nbsp;</li>\r\n	<li>Initial Interview (Virtual)</li>\r\n	<li>Final Interview (Virtual)</li>\r\n	<li>Job Offer</li>\r\n	<li>Training</li>\r\n</ol>\r\n', '2022-12-25 10:55:59', '2022-12-25 11:02:57'),
	(33, 'FullStack Developer', 5, '<p><strong>MedSpecialized, Inc.</strong>&nbsp;is looking for an&nbsp;<strong>Accountant</strong>!</p>\r\n\r\n<p><strong>About the account:</strong>&nbsp;<strong>DrCatalyst</strong></p>\r\n\r\n<p><br />\r\nDrCatalyst (DrC) is a remote healthcare staffing organization that has over 250 billable staff from the Philippines.&nbsp;<br />\r\n<br />\r\n<strong>Work Schedule and Arrangement:</strong>&nbsp;10&nbsp;PM - 7&nbsp;AM PHT (Full time);&nbsp;Remote set-up<br />\r\n<br />\r\n<strong>Office Location:</strong>&nbsp;8th floor Skyrise 4B Building, IT Park, Lahug, Cebu City, Cebu<br />\r\n<br />\r\n<strong>Responsibilities:</strong></p>\r\n\r\n<ul>\r\n	<li>Processing payment of vendor invoices in a timely and organized manner</li>\r\n	<li>Perform account reconciliation (bank, credit card, etc.)</li>\r\n	<li>Examine financial transactions and ensure adequate documentation</li>\r\n	<li>Maintain account schedules (Fixed Asset, Loan, Prepaid Expenses, etc.)</li>\r\n	<li>Perform month-end and year-end closing procedures</li>\r\n	<li>Preparation of FS and reporting to management</li>\r\n	<li>Provide support during audit and tax reporting</li>\r\n	<li>Preparation of ad hoc reports needed by management.</li>\r\n</ul>\r\n\r\n<p><strong>Requirements:</strong></p>\r\n\r\n<ul>\r\n	<li>Bachelor&rsquo;s degree in Management Accounting or Accountancy</li>\r\n	<li>Must be college graduate</li>\r\n	<li>Accounts Payable, General Accounting, Reconciliation, and auditing experience preferred</li>\r\n	<li>At least 1 year accounting related experience preferably from audit firms</li>\r\n	<li>Good English communication skills</li>\r\n	<li>Someone who has initiative and can work with less supervision</li>\r\n	<li>Time management, data entry management, and general math skills</li>\r\n</ul>\r\n\r\n<p><strong>Salary and monetary benefits (in PHP):</strong></p>\r\n\r\n<ul>\r\n	<li>Monthly salary of 20,000 or more depending on experience</li>\r\n	<li>New hire bonus of 5,000&nbsp;</li>\r\n</ul>\r\n\r\n<p><strong>Perks and other benefits:</strong></p>\r\n\r\n<ul>\r\n	<li>Equipment (PC/Laptop)&nbsp;provided</li>\r\n	<li>Paid Training Period</li>\r\n	<li>All national Philippines and USA holidays are observed</li>\r\n	<li>Paid time off&mdash;public holidays, vacation, and personal time off</li>\r\n	<li>Robust and effective Government Benefits Administration</li>\r\n	<li>Lactation breaks (for breastfeeding moms)</li>\r\n	<li>Discounted optical services with our partner clinic</li>\r\n	<li>Free lunch/dinner and unlimited coffee and ice cream daily (for on site employees)</li>\r\n	<li>Free Health insurance with one (1) free dependent</li>\r\n	<li>Free Life insurance</li>\r\n	<li>Free Accident insurance</li>\r\n	<li>Relocation allowance for new hires (from Outside Cebu)</li>\r\n	<li>Company-sponsored outings</li>\r\n	<li>Interest-based employee clubs (DOTA, Basketball, Dance, Music, Photography, Yoga)</li>\r\n	<li>International travel opportunities (India and US office)</li>\r\n</ul>\r\n\r\n<p><strong>Our Recruitment Process:</strong></p>\r\n\r\n<ol>\r\n	<li>Candidate Application Form</li>\r\n	<li>General Assessment&nbsp;</li>\r\n	<li>Initial Interview (Virtual)</li>\r\n	<li>Final Interview (Virtual)</li>\r\n	<li>Job Offer</li>\r\n	<li>Training</li>\r\n</ol>\r\n', '2022-12-30 14:08:02', '2022-12-30 14:08:02');

-- Dumping structure for table psa.tbl_notification
CREATE TABLE IF NOT EXISTS `tbl_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table psa.tbl_notification: ~51 rows (approximately)
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
	(20, 7, 'Company, Company, Applying for  Social Media Avertiser', 1, '2022-11-15 02:06:55', '2022-11-16 15:55:45'),
	(21, 8, 'Hello client client, Your application for this position Social Media Avertiser was declined - Fux Devs.', 1, '2022-11-16 15:56:01', '2022-11-16 15:58:16'),
	(22, 7, 'Company, Company, Applying for  Social Media Avertiser', 1, '2022-11-28 14:19:16', '2022-12-18 02:58:21'),
	(23, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job TESTIN.', 0, '2022-11-28 17:05:43', '2022-11-28 17:05:43'),
	(24, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job TESTIN.', 0, '2022-11-28 17:05:46', '2022-11-28 17:05:46'),
	(25, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job TESTIN.', 0, '2022-11-28 17:05:51', '2022-11-28 17:05:51'),
	(26, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer.', 0, '2022-11-28 17:07:26', '2022-11-28 17:07:26'),
	(27, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer.', 0, '2022-11-28 17:07:31', '2022-11-28 17:07:31'),
	(28, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer.', 0, '2022-11-28 17:07:41', '2022-11-28 17:07:41'),
	(29, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer.', 0, '2022-11-28 17:07:49', '2022-11-28 17:07:49'),
	(30, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer.', 0, '2022-11-28 17:07:50', '2022-11-28 17:07:50'),
	(31, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer.', 0, '2022-11-28 17:08:11', '2022-11-28 17:08:11'),
	(32, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Marvin.', 0, '2022-11-28 17:11:19', '2022-11-28 17:11:19'),
	(33, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Marvin.', 0, '2022-11-28 17:13:14', '2022-11-28 17:13:14'),
	(34, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Marvin3232.', 0, '2022-11-28 17:21:18', '2022-11-28 17:21:18'),
	(35, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job PHP PROGRAMMER .', 0, '2022-11-28 17:22:50', '2022-11-28 17:22:50'),
	(36, 12, 'LocalMJob \n Hello marvin, Fux Devs has new open job PHP PROGRAMMER .', 0, '2022-11-28 17:22:51', '2022-11-28 17:22:51'),
	(37, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer Testinggggffff.', 0, '2022-11-28 18:18:25', '2022-11-28 18:18:25'),
	(38, 12, 'LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer Testinggggffff.', 0, '2022-11-28 18:18:26', '2022-11-28 18:18:26'),
	(39, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer.', 0, '2022-11-28 18:25:27', '2022-11-28 18:25:27'),
	(40, 12, 'LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer.', 0, '2022-11-28 18:25:27', '2022-11-28 18:25:27'),
	(41, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer Testindsafdasfadsf.', 0, '2022-11-28 18:26:31', '2022-11-28 18:26:31'),
	(42, 12, 'LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer Testindsafdasfadsf.', 0, '2022-11-28 18:26:31', '2022-11-28 18:26:31'),
	(43, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer TAE.', 0, '2022-11-28 18:33:44', '2022-11-28 18:33:44'),
	(44, 12, 'LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer TAE.', 0, '2022-11-28 18:33:44', '2022-11-28 18:33:44'),
	(45, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job TESTIN tae.', 0, '2022-11-28 18:34:21', '2022-11-28 18:34:21'),
	(46, 12, 'LocalMJob \n Hello marvin, Fux Devs has new open job TESTIN tae.', 0, '2022-11-28 18:34:22', '2022-11-28 18:34:22'),
	(47, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer Testingggg TAEEEEE.', 0, '2022-11-28 18:34:55', '2022-11-28 18:34:55'),
	(48, 12, 'LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer Testingggg TAEEEEE.', 0, '2022-11-28 18:34:55', '2022-11-28 18:34:55'),
	(49, 9, 'LocalMJob \n Hello client1, Fux Devs has new open job Web Developer Testingggg fsdgfdsgfsdg.', 0, '2022-11-28 18:35:22', '2022-11-28 18:35:22'),
	(50, 12, 'LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer Testingggg fsdgfdsgfsdg.', 1, '2022-11-28 18:35:22', '2022-12-18 03:00:02'),
	(51, 7, 'Company, Company, Applying for  Web Developer', 1, '2022-11-29 02:05:32', '2022-11-29 02:05:41');

-- Dumping structure for table psa.tbl_sms_logs
CREATE TABLE IF NOT EXISTS `tbl_sms_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiverid` bigint NOT NULL DEFAULT '0',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table psa.tbl_sms_logs: ~41 rows (approximately)
INSERT INTO `tbl_sms_logs` (`id`, `receiverid`, `message`, `created_at`) VALUES
	(69, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello client1, Fux Devs has new open job PHP PROGRAMMER .","to":"+6309755983121"}', '2022-11-28 17:22:50'),
	(70, 9, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 17:22:51'),
	(71, 12, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello marvin, Fux Devs has new open job PHP PROGRAMMER .","to":"+6309486502742"}', '2022-11-28 17:22:51'),
	(72, 12, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 17:22:52'),
	(73, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello client1, Fux Devs has new open job Web Developer Testinggggffff.","to":"+6309755983121"}', '2022-11-28 18:18:25'),
	(74, 9, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:18:26'),
	(75, 12, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer Testinggggffff.","to":"+6309486502742"}', '2022-11-28 18:18:26'),
	(76, 12, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:18:26'),
	(77, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello client1, Fux Devs has new open job Web Developer.","to":"+6309755983121"}', '2022-11-28 18:25:27'),
	(78, 9, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:25:27'),
	(79, 12, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer.","to":"+6309486502742"}', '2022-11-28 18:25:27'),
	(80, 12, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:25:28'),
	(81, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello client1, Fux Devs has new open job Web Developer Testindsafdasfadsf.","to":"+6309755983121"}', '2022-11-28 18:26:31'),
	(82, 9, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:26:31'),
	(83, 12, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer Testindsafdasfadsf.","to":"+6309486502742"}', '2022-11-28 18:26:31'),
	(84, 12, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:26:31'),
	(85, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello client1, Fux Devs has new open job Web Developer TAE.","to":"+6309755983121"}', '2022-11-28 18:33:44'),
	(86, 9, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:33:44'),
	(87, 12, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer TAE.","to":"+6309486502742"}', '2022-11-28 18:33:45'),
	(88, 12, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:33:45'),
	(89, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello client1, Fux Devs has new open job TESTIN tae.","to":"+6309755983121"}', '2022-11-28 18:34:21'),
	(90, 9, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:34:21'),
	(91, 12, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello marvin, Fux Devs has new open job TESTIN tae.","to":"+6309486502742"}', '2022-11-28 18:34:22'),
	(92, 12, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:34:22'),
	(93, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello client1, Fux Devs has new open job Web Developer Testingggg TAEEEEE.","to":"+6309755983121"}', '2022-11-28 18:34:55'),
	(94, 9, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:34:55'),
	(95, 12, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer Testingggg TAEEEEE.","to":"+6309486502742"}', '2022-11-28 18:34:55'),
	(96, 12, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:34:56'),
	(97, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello client1, Fux Devs has new open job Web Developer Testingggg fsdgfdsgfsdg.","to":"+6309755983121"}', '2022-11-28 18:35:22'),
	(98, 9, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:35:22'),
	(99, 12, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"LocalMJob \n Hello marvin, Fux Devs has new open job Web Developer Testingggg fsdgfdsgfsdg.","to":"+6309486502742"}', '2022-11-28 18:35:22'),
	(100, 12, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-11-28 18:35:22'),
	(101, 9, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"Hi Client1 Your Account has been Decline by the Administrator.","to":"+6309755983121"}', '2022-12-13 05:37:42'),
	(102, 9, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-12-13 05:37:43'),
	(103, 10, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"Hi 1 Your Account has been Accepted by the Administrator.","to":"+6309093939708"}', '2022-12-14 21:16:05'),
	(104, 10, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-12-14 21:16:06'),
	(105, 19, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"Hi VILLANEA. Your Company account in LocalMJob has been approved.","to":"+6309755983121"}', '2022-12-18 03:05:44'),
	(106, 19, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-12-18 03:05:45'),
	(107, 20, '{"api_key":"2H7GtWOeyWYMff0XzK7en5zEdy6","api_secret":"m0hv1Nw4C0949gsL9RGVRIp75QomqWsLqD5fjpjB","from":"iConnect","text":"Hi VILLANEA. Your Client account in LocalMJob has been approved.","to":"+6309755983121"}', '2022-12-18 03:12:47'),
	(108, 20, 'Client error: `POST https://api.movider.co/v1/sms` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-12-18 03:12:48'),
	(109, 20, 'Client error: `POST https://api.movider.co/v1/balance` resulted in a `401 Unauthorized` response:\n{"error":{"code":403,"name":"ERR_AUTHENTICATION_FAILED","description":"Authentication field."}}\n', '2022-12-18 03:14:35');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
