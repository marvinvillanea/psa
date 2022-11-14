-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2022 at 01:17 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `connect`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_accounts`
--

CREATE TABLE `tbl_accounts` (
  `id` int(225) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `cnum` varchar(20) NOT NULL,
  `bday` date NOT NULL,
  `age` int(2) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` int(1) NOT NULL COMMENT 'admin=1 company=2 client=3',
  `verification_state` int(1) NOT NULL DEFAULT 0 COMMENT '0 = not verified\r\n1 = semi verified\r\n2 = verified',
  `avatar` varchar(50) NOT NULL DEFAULT 'avatar_default.png',
  `department` varchar(50) NOT NULL DEFAULT 'none',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_accounts`
--

INSERT INTO `tbl_accounts` (`id`, `firstname`, `lastname`, `cnum`, `bday`, `age`, `address`, `email`, `password`, `type`, `verification_state`, `avatar`, `department`, `created_at`) VALUES
(6, 'admin', 'admin', '09093939708', '2001-08-30', 25, '739 G. Araneta Avenue 1100', 'admin@connect.com', '1234', 1, 0, 'avatar_default.png', 'none', '2022-08-03 18:15:03'),
(7, 'company', 'company', '09093939705', '2022-09-10', 25, 'Rm. 202 Grace Building Ortigas Avenue Greenhills 1500', 'company@connect.com', '1234', 2, 0, 'avatar_default.png', 'none', '2022-08-03 18:33:47'),
(8, 'client', 'client', '09486502742', '2002-02-22', 25, 'P. Burgos Street corner Caseres Street', 'client@connect.com', '1234', 3, 2, 'avatar_default.png', 'I.T', '2022-08-03 18:34:28'),
(9, 'client1', 'client1', '09093939705', '2002-02-22', 25, '#26 mBaguio First Hotel, Bonifacio Street', 'client1@connect.com', '1234', 3, 0, 'avatar_default.png', 'I.T', '2022-08-03 18:34:28'),
(10, '1', '1', '09093939708', '2022-09-15', 12, '12121', '1234@yahoo.com', '123456789', 2, 0, 'avatar_default.png', 'none', '2022-09-14 17:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_applicants`
--

CREATE TABLE `tbl_applicants` (
  `id` int(225) NOT NULL,
  `companyid` int(225) NOT NULL,
  `applicantsid` int(225) NOT NULL,
  `jobid` int(225) NOT NULL,
  `status` int(1) NOT NULL COMMENT '1=pending\r\n2=hired\r\n3=decline',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_applicants`
--

INSERT INTO `tbl_applicants` (`id`, `companyid`, `applicantsid`, `jobid`, `status`, `created_at`) VALUES
(1, 4, 8, 3, 1, '2022-08-12 14:00:44'),
(2, 4, 8, 3, 1, '2022-08-12 14:00:44'),
(3, 5, 8, 3, 1, '2022-08-12 14:00:44'),
(4, 5, 8, 3, 2, '2022-08-12 14:00:44'),
(5, 4, 8, 3, 1, '2022-09-02 14:31:42');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `id` int(225) NOT NULL,
  `userid` int(225) NOT NULL,
  `c_logo` varchar(70) NOT NULL DEFAULT 'company_logo_default.png',
  `c_banner` varchar(70) NOT NULL DEFAULT 'company_banner_default.png',
  `c_name` varchar(50) NOT NULL,
  `c_address` varchar(100) NOT NULL,
  `c_cnum` varchar(20) NOT NULL,
  `c_position` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`id`, `userid`, `c_logo`, `c_banner`, `c_name`, `c_address`, `c_cnum`, `c_position`, `department`, `created_at`) VALUES
(4, 6, 'company_logo_default.png', 'company_banner_default.png', 'D Devs', 'Manila, Metro Manila', '09093939708', 'I.T', 'I.T', '2022-08-03 18:15:03'),
(5, 7, 'company_logo_default.png', 'company_banner_default.png', 'Fux Devs', 'Manila, Metro Manila', '09093939708', 'I.T', 'I.T', '2022-08-03 18:33:47'),
(6, 8, 'company_logo_default.png', 'company_banner_default.png', 'Metro Ui', 'Manila, Metro Manila', '09093939708', 'Advertiser', 'I.T', '2022-08-03 18:34:28'),
(7, 10, 'company_logo_default.png', 'company_banner_default.png', '12adasd', 'asdasd', '09093939708', 'asdasdas', 'try', '2022-09-14 17:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company_reports`
--

CREATE TABLE `tbl_company_reports` (
  `id` int(225) NOT NULL,
  `company_id` int(225) NOT NULL,
  `reported_by` int(225) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_company_reports`
--

INSERT INTO `tbl_company_reports` (`id`, `company_id`, `reported_by`, `message`, `created_at`) VALUES
(1, 4, 8, 'Miss leading information', '2022-08-27 02:35:28'),
(2, 4, 8, 'Miss leading information', '2022-08-27 02:35:28'),
(3, 4, 8, 'asdasdsa', '2022-09-02 07:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jobs`
--

CREATE TABLE `tbl_jobs` (
  `id` int(225) NOT NULL,
  `userid` int(225) NOT NULL,
  `j_name` varchar(50) NOT NULL,
  `j_age` int(2) NOT NULL,
  `j_min` decimal(50,0) NOT NULL,
  `j_max` decimal(50,0) NOT NULL,
  `j_currency_symbol` varchar(1) NOT NULL,
  `j_description` text NOT NULL,
  `j_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jobs`
--

INSERT INTO `tbl_jobs` (`id`, `userid`, `j_name`, `j_age`, `j_min`, `j_max`, `j_currency_symbol`, `j_description`, `j_created_at`) VALUES
(1, 7, 'I.T', 18, '15000', '200000', '₱', 'Solary', '2022-08-05 00:46:17'),
(2, 7, 'Social Media Avertiser', 18, '10000', '200000', '₱', 'Solary', '2022-08-05 00:46:17'),
(3, 6, 'Back End Developer', 18, '15000', '20000', '₱', '<p><strong>Bruh</strong></p>\r\n', '2022-08-12 05:22:23'),
(4, 7, 'PHP Dev', 21, '15000', '30000', '₱', '<p>Hi</p>\r\n', '2022-09-14 18:23:22'),
(5, 7, '1', 50, '1', '1', '₱', '<p>1</p>\r\n', '2022-09-14 18:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_resume`
--

CREATE TABLE `tbl_resume` (
  `id` int(225) NOT NULL,
  `userid` int(225) NOT NULL,
  `path` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_resume`
--

INSERT INTO `tbl_resume` (`id`, `userid`, `path`, `created_at`) VALUES
(1, 6, 'example1.png', '2022-08-12 06:35:51'),
(2, 7, 'example2.jpg', '2022-08-12 06:35:51'),
(3, 8, 'c9f0f895fb98ab9159f51fd0297e236d.jpg', '2022-09-02 05:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_logs`
--

CREATE TABLE `tbl_sms_logs` (
  `id` int(225) NOT NULL,
  `receiverid` int(225) NOT NULL,
  `message` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_sms_logs`
--

INSERT INTO `tbl_sms_logs` (`id`, `receiverid`, `message`, `created_at`) VALUES
(4, 8, 'Connect \nVerification code: 484709', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_verificationcode`
--

CREATE TABLE `tbl_verificationcode` (
  `id` int(225) NOT NULL,
  `session` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0=not used\r\n1=used',
  `used_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_verificationcode`
--

INSERT INTO `tbl_verificationcode` (`id`, `session`, `code`, `status`, `used_at`, `created_at`) VALUES
(17, 'dd3d05d7de99af7a376db3aaf6a18dba', '484709', 1, '2022-09-02 05:34:41', '2022-09-02 05:33:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_applicants`
--
ALTER TABLE `tbl_applicants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_company_reports`
--
ALTER TABLE `tbl_company_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_jobs`
--
ALTER TABLE `tbl_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_resume`
--
ALTER TABLE `tbl_resume`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sms_logs`
--
ALTER TABLE `tbl_sms_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_verificationcode`
--
ALTER TABLE `tbl_verificationcode`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_applicants`
--
ALTER TABLE `tbl_applicants`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_company_reports`
--
ALTER TABLE `tbl_company_reports`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_jobs`
--
ALTER TABLE `tbl_jobs`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_resume`
--
ALTER TABLE `tbl_resume`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_sms_logs`
--
ALTER TABLE `tbl_sms_logs`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_verificationcode`
--
ALTER TABLE `tbl_verificationcode`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
