-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2026 at 03:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sisi_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `ATTENDANCE_ID` int(11) NOT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `ATTENDANCE_DATE` date NOT NULL,
  `CHECK_IN` time DEFAULT NULL,
  `CHECK_OUT` time DEFAULT NULL,
  `ATTENDANCE_STATUS` varchar(30) DEFAULT NULL,
  `DESCRIPTION` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_trip`
--

CREATE TABLE `business_trip` (
  `BUSINESS_TRIP_ID` int(11) NOT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `SPPD_NUMBER` varchar(50) DEFAULT NULL,
  `DEPARTURE_DATE` date DEFAULT NULL,
  `RETURN_DATE` date DEFAULT NULL,
  `DESTINATION` varchar(200) DEFAULT NULL,
  `PURPOSE` varchar(300) DEFAULT NULL,
  `TRANSPORTATION` varchar(100) DEFAULT NULL,
  `COST` decimal(15,2) DEFAULT NULL,
  `STATUS` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deduction_type`
--

CREATE TABLE `deduction_type` (
  `DEDUCTION_TYPE_ID` int(11) NOT NULL,
  `DEDUCTION_NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `ID_USER` varchar(30) DEFAULT NULL,
  `POSITION_ID` int(11) NOT NULL,
  `EMPLOYEE_NUMBER` varchar(30) NOT NULL,
  `NATIONAL_ID` varchar(30) DEFAULT NULL,
  `EMPLOYEE_NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `PHONE` varchar(30) DEFAULT NULL,
  `ADDRESS` varchar(300) DEFAULT NULL,
  `JOIN_DATE` date DEFAULT NULL,
  `BASIC_SALARY` decimal(15,2) DEFAULT NULL,
  `EMPLOYEE_STATUS` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `i_error_application`
--

CREATE TABLE `i_error_application` (
  `ERROR_ID` int(11) NOT NULL,
  `ID_USER` varchar(30) DEFAULT NULL,
  `ERROR_DATE` varchar(3) DEFAULT NULL,
  `MODULES` varchar(100) DEFAULT NULL,
  `CONTROLLER` varchar(200) DEFAULT NULL,
  `FUNCTION` varchar(200) DEFAULT NULL,
  `ERROR_LINE` varchar(30) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(1000) DEFAULT NULL,
  `STATUS` varchar(30) DEFAULT NULL,
  `PARAM` varchar(300) DEFAULT NULL,
  `CREATE_DATE` varchar(30) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `DELETE_MARK` varchar(1) DEFAULT NULL,
  `UPDATE_BY` varchar(30) DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `i_error_application`
--

INSERT INTO `i_error_application` (`ERROR_ID`, `ID_USER`, `ERROR_DATE`, `MODULES`, `CONTROLLER`, `FUNCTION`, `ERROR_LINE`, `ERROR_MESSAGE`, `STATUS`, `PARAM`, `CREATE_DATE`, `CREATE_TIME`, `DELETE_MARK`, `UPDATE_BY`, `UPDATE_DATE`) VALUES
(1, 'USER001', '09', 'Menu Management', 'create_menu.php', 'Create Menu', '50', 'Duplicate entry \'M01\' for key \'PRIMARY\'', 'ERROR', 'MENU_ID=M01', '2026-09-09', '2026-09-09 00:26:17', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_request`
--

CREATE TABLE `leave_request` (
  `LEAVE_ID` int(11) NOT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `LEAVE_TYPE` varchar(30) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `REASON` varchar(300) DEFAULT NULL,
  `STATUS` varchar(30) DEFAULT NULL,
  `APPROVED_BY` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `MENU_ID` varchar(3) NOT NULL,
  `ID_LEVEL` varchar(3) DEFAULT NULL,
  `MENU_NAME` varchar(300) DEFAULT NULL,
  `MENU_LINK` varchar(300) DEFAULT NULL,
  `MENU_ICON` varchar(300) DEFAULT NULL,
  `PARENT_ID` varchar(30) DEFAULT NULL,
  `CREATE_BY` varchar(30) DEFAULT NULL,
  `CREATE_DATE` date DEFAULT NULL,
  `DELETE_MARK` varchar(1) DEFAULT NULL,
  `UPDATE_BY` varchar(30) DEFAULT NULL,
  `UPDATE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`MENU_ID`, `ID_LEVEL`, `MENU_NAME`, `MENU_LINK`, `MENU_ICON`, `PARENT_ID`, `CREATE_BY`, `CREATE_DATE`, `DELETE_MARK`, `UPDATE_BY`, `UPDATE_DATE`) VALUES
('M01', '001', 'Dashboard', 'index.php', '', '', 'USER001', '2026-09-09', '0', NULL, NULL),
('M02', '001', 'User Management', 'create_user.php', '', '', 'USER001', '2026-09-09', '0', NULL, NULL),
('M03', '001', 'Menu Management', 'create_menu.php', '', '', 'USER001', '2026-09-09', '0', NULL, NULL),
('M04', '001', 'Menu Access', 'menu_access.php', '', '', 'USER001', '2026-09-09', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_level`
--

CREATE TABLE `menu_level` (
  `ID_LEVEL` varchar(3) NOT NULL,
  `LEVEL` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_level`
--

INSERT INTO `menu_level` (`ID_LEVEL`, `LEVEL`) VALUES
('001', 'Main Menu');

-- --------------------------------------------------------

--
-- Table structure for table `menu_user`
--

CREATE TABLE `menu_user` (
  `NO_SETTING` int(11) NOT NULL,
  `ID_USER` varchar(30) DEFAULT NULL,
  `MENU_ID` varchar(3) DEFAULT NULL,
  `CREATE_DATE` varchar(30) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `DELETE_MARK` varchar(1) DEFAULT NULL,
  `UPDATE_BY` varchar(30) DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_user`
--

INSERT INTO `menu_user` (`NO_SETTING`, `ID_USER`, `MENU_ID`, `CREATE_DATE`, `CREATE_TIME`, `DELETE_MARK`, `UPDATE_BY`, `UPDATE_DATE`) VALUES
(1, 'USER001', 'M02', '2026-09-09', '2026-09-08 23:19:09', '0', NULL, NULL),
(2, 'USER001', 'M01', '2026-09-09', '2026-09-08 23:19:26', '0', NULL, NULL),
(3, 'USER002', 'M01', '2026-09-09', '2026-09-08 23:21:43', '0', NULL, NULL),
(4, 'USER003', 'M01', '2026-09-09', '2026-09-09 00:12:59', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `PAYROLL_ID` int(11) NOT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `MONTH` int(11) NOT NULL,
  `YEAR` int(11) NOT NULL,
  `BASIC_SALARY` decimal(15,2) DEFAULT NULL,
  `TOTAL_DEDUCTION` decimal(15,2) DEFAULT NULL,
  `NET_SALARY` decimal(15,2) DEFAULT NULL,
  `PROCESS_DATE` date DEFAULT NULL,
  `STATUS` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_deduction`
--

CREATE TABLE `payroll_deduction` (
  `PAYROLL_DEDUCTION_ID` int(11) NOT NULL,
  `PAYROLL_ID` int(11) NOT NULL,
  `DEDUCTION_TYPE_ID` int(11) NOT NULL,
  `AMOUNT` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `POSITION_ID` int(11) NOT NULL,
  `POSITION_NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID_USER` varchar(30) NOT NULL,
  `NAMA_USER` varchar(60) DEFAULT NULL,
  `USERNAME` varchar(60) DEFAULT NULL,
  `PASSWORD` varchar(60) DEFAULT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `NO_HP` varchar(30) DEFAULT NULL,
  `WA` varchar(30) DEFAULT NULL,
  `PIN` varchar(30) DEFAULT NULL,
  `ID_JENIS_USER` varchar(3) DEFAULT NULL,
  `STATUS_USER` varchar(30) DEFAULT NULL,
  `DELETE_MARK` varchar(1) DEFAULT NULL,
  `CREATE_BY` varchar(30) DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT NULL,
  `UPDATE_BY` varchar(30) DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID_USER`, `NAMA_USER`, `USERNAME`, `PASSWORD`, `EMAIL`, `NO_HP`, `WA`, `PIN`, `ID_JENIS_USER`, `STATUS_USER`, `DELETE_MARK`, `CREATE_BY`, `CREATE_DATE`, `UPDATE_BY`, `UPDATE_DATE`) VALUES
('USER001', 'Tanzil', 'tanzil', '$2y$10$d34n9XGDJ.4HSOyPXYd5DurWJkbYhaCh9YCSnjWFz8ojRlNmcR/JC', 'tanzilaziim3@gmail.com', '083861673722', '083861673722', '123456', 'ADM', 'Aktif', '0', 'SYSTEM', '2026-09-08 16:36:47', NULL, NULL),
('USER002', 'Aziim', 'aziim', '$2y$10$iFsrXb5H8WFCgtCfVb6jGu6MetX2N.Deo9XFKvrOK0a.NrcC5UlBm', 'aziim@gmail.com', '083861673722', '083861673722', '123456', 'STF', 'Aktif', '0', 'SYSTEM', '2026-09-08 23:21:11', NULL, NULL),
('USER003', 'Anonymous', 'dansk', '$2y$10$Wmw235vIwiDTzx1YcmexvuuKHRJvnZYRb0q.lvZQV1nYCmVAY2Ffq', 'tanzilaziim3@gmail.com', '083861673722', '083861673722', '123456', 'STF', 'Aktif', '0', 'USER001', '2026-09-09 00:12:06', NULL, NULL),
('USER004', 'Burhan', 'burhan', '$2y$10$h8sJnZhdEANhpuxsViRz3.udAqENvsuIp0e4PVaNCx1ifYXEwMdvW', 'tanzilaziim3@gmail.com', '083861673722', '083861673722', '123456', 'STF', 'Aktif', '0', 'USER001', '2026-09-09 00:40:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_activity`
--

CREATE TABLE `user_activity` (
  `NO_ACTIVITY` int(11) NOT NULL,
  `ID_USER` varchar(30) DEFAULT NULL,
  `DISCRIPSI` varchar(300) DEFAULT NULL,
  `STATUS` varchar(30) DEFAULT NULL,
  `MENU_ID` varchar(3) DEFAULT NULL,
  `DELETE_MARK` varchar(1) DEFAULT NULL,
  `CREATE_BY` varchar(30) DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_activity`
--

INSERT INTO `user_activity` (`NO_ACTIVITY`, `ID_USER`, `DISCRIPSI`, `STATUS`, `MENU_ID`, `DELETE_MARK`, `CREATE_BY`, `CREATE_DATE`) VALUES
(1, 'USER001', 'Logout dari aplikasi', 'SUCCESS', NULL, '0', 'USER001', '2026-09-09 00:01:44'),
(2, 'USER001', 'Login ke aplikasi', 'SUCCESS', NULL, '0', 'USER001', '2026-09-09 00:01:59'),
(3, 'USER001', 'Membuat user USER003', 'SUCCESS', 'M02', '0', 'USER001', '2026-09-09 00:12:06'),
(4, 'USER001', 'Memberikan akses menu M01 kepada user USER003', 'SUCCESS', 'M04', '0', 'USER001', '2026-09-09 00:12:59'),
(5, 'USER001', 'Gagal membuat menu Menunggumu', 'FAILED', 'M03', '0', 'USER001', '2026-09-09 00:26:17'),
(6, 'USER001', 'Gagal membuat user, ID atau username sudah digunakan', 'FAILED', 'M02', '0', 'USER001', '2026-09-09 00:29:31'),
(7, 'USER001', 'Logout dari aplikasi', 'SUCCESS', NULL, '0', 'USER001', '2026-09-09 00:38:38'),
(8, 'USER001', 'Login ke aplikasi', 'SUCCESS', NULL, '0', 'USER001', '2026-09-09 00:38:53'),
(9, 'USER001', 'Membuat user USER004', 'SUCCESS', 'M02', '0', 'USER001', '2026-09-09 00:40:11'),
(10, 'USER001', 'Logout dari aplikasi', 'SUCCESS', NULL, '0', 'USER001', '2026-09-09 00:40:29'),
(11, 'USER002', 'Login ke aplikasi', 'SUCCESS', NULL, '0', 'USER002', '2026-09-09 00:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_foto`
--

CREATE TABLE `user_foto` (
  `NO_FOTO` int(11) NOT NULL,
  `ID_USER` varchar(30) DEFAULT NULL,
  `FOTO` varchar(200) DEFAULT NULL,
  `CREATE_BY` varchar(30) DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT NULL,
  `DELETE_MARK` varchar(1) DEFAULT NULL,
  `UPDATE_BY` varchar(30) DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`ATTENDANCE_ID`),
  ADD KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`);

--
-- Indexes for table `business_trip`
--
ALTER TABLE `business_trip`
  ADD PRIMARY KEY (`BUSINESS_TRIP_ID`),
  ADD KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`);

--
-- Indexes for table `deduction_type`
--
ALTER TABLE `deduction_type`
  ADD PRIMARY KEY (`DEDUCTION_TYPE_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD UNIQUE KEY `EMPLOYEE_NUMBER` (`EMPLOYEE_NUMBER`),
  ADD UNIQUE KEY `ID_USER` (`ID_USER`),
  ADD UNIQUE KEY `NATIONAL_ID` (`NATIONAL_ID`),
  ADD KEY `POSITION_ID` (`POSITION_ID`);

--
-- Indexes for table `i_error_application`
--
ALTER TABLE `i_error_application`
  ADD PRIMARY KEY (`ERROR_ID`),
  ADD KEY `ID_USER` (`ID_USER`);

--
-- Indexes for table `leave_request`
--
ALTER TABLE `leave_request`
  ADD PRIMARY KEY (`LEAVE_ID`),
  ADD KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  ADD KEY `APPROVED_BY` (`APPROVED_BY`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`MENU_ID`),
  ADD KEY `ID_LEVEL` (`ID_LEVEL`);

--
-- Indexes for table `menu_level`
--
ALTER TABLE `menu_level`
  ADD PRIMARY KEY (`ID_LEVEL`);

--
-- Indexes for table `menu_user`
--
ALTER TABLE `menu_user`
  ADD PRIMARY KEY (`NO_SETTING`),
  ADD KEY `ID_USER` (`ID_USER`),
  ADD KEY `MENU_ID` (`MENU_ID`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`PAYROLL_ID`),
  ADD KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`);

--
-- Indexes for table `payroll_deduction`
--
ALTER TABLE `payroll_deduction`
  ADD PRIMARY KEY (`PAYROLL_DEDUCTION_ID`),
  ADD KEY `PAYROLL_ID` (`PAYROLL_ID`),
  ADD KEY `DEDUCTION_TYPE_ID` (`DEDUCTION_TYPE_ID`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`POSITION_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER`);

--
-- Indexes for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`NO_ACTIVITY`),
  ADD KEY `ID_USER` (`ID_USER`);

--
-- Indexes for table `user_foto`
--
ALTER TABLE `user_foto`
  ADD PRIMARY KEY (`NO_FOTO`),
  ADD KEY `ID_USER` (`ID_USER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `ATTENDANCE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_trip`
--
ALTER TABLE `business_trip`
  MODIFY `BUSINESS_TRIP_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deduction_type`
--
ALTER TABLE `deduction_type`
  MODIFY `DEDUCTION_TYPE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EMPLOYEE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_request`
--
ALTER TABLE `leave_request`
  MODIFY `LEAVE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `PAYROLL_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_deduction`
--
ALTER TABLE `payroll_deduction`
  MODIFY `PAYROLL_DEDUCTION_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `POSITION_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`);

--
-- Constraints for table `business_trip`
--
ALTER TABLE `business_trip`
  ADD CONSTRAINT `business_trip_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`POSITION_ID`) REFERENCES `position` (`POSITION_ID`);

--
-- Constraints for table `i_error_application`
--
ALTER TABLE `i_error_application`
  ADD CONSTRAINT `i_error_application_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Constraints for table `leave_request`
--
ALTER TABLE `leave_request`
  ADD CONSTRAINT `leave_request_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`),
  ADD CONSTRAINT `leave_request_ibfk_2` FOREIGN KEY (`APPROVED_BY`) REFERENCES `user` (`ID_USER`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`ID_LEVEL`) REFERENCES `menu_level` (`ID_LEVEL`);

--
-- Constraints for table `menu_user`
--
ALTER TABLE `menu_user`
  ADD CONSTRAINT `menu_user_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`),
  ADD CONSTRAINT `menu_user_ibfk_2` FOREIGN KEY (`MENU_ID`) REFERENCES `menu` (`MENU_ID`);

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`);

--
-- Constraints for table `payroll_deduction`
--
ALTER TABLE `payroll_deduction`
  ADD CONSTRAINT `payroll_deduction_ibfk_1` FOREIGN KEY (`PAYROLL_ID`) REFERENCES `payroll` (`PAYROLL_ID`),
  ADD CONSTRAINT `payroll_deduction_ibfk_2` FOREIGN KEY (`DEDUCTION_TYPE_ID`) REFERENCES `deduction_type` (`DEDUCTION_TYPE_ID`);

--
-- Constraints for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD CONSTRAINT `user_activity_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Constraints for table `user_foto`
--
ALTER TABLE `user_foto`
  ADD CONSTRAINT `user_foto_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
