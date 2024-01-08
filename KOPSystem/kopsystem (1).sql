-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 04:30 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kopsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `AccountName` varchar(50) NOT NULL,
  `AccountSector` varchar(50) NOT NULL,
  `Project` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`AccountName`, `AccountSector`, `Project`) VALUES
('UEMS', 'ENT', 'WHUTT');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_Name` varchar(50) NOT NULL,
  `Admin_Username` varchar(50) NOT NULL,
  `Admin_Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_Name`, `Admin_Username`, `Admin_Password`) VALUES
('Adam', 'adammf', 'cingcong'),
('Azrai', 'Azrai11', 'roy123');

-- --------------------------------------------------------

--
-- Table structure for table `promises`
--

CREATE TABLE `promises` (
  `Promise_ID` int(5) NOT NULL,
  `AccountName` varchar(50) NOT NULL,
  `Promise_Owner` varchar(50) NOT NULL,
  `Client_Name` varchar(50) NOT NULL,
  `Category_Promise` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promises`
--

INSERT INTO `promises` (`Promise_ID`, `AccountName`, `Promise_Owner`, `Client_Name`, `Category_Promise`) VALUES
(1, 'UEMS', 'Adimas', 'Faizal', 'Non-Contractual Promise'),
(2, 'UEMS', 'Shamin', 'Azran', 'Contractual Promise'),
(3, 'UEMS', 'Chedet', 'Faizal', 'Non-Contractual Promise');

-- --------------------------------------------------------

--
-- Table structure for table `promise_detail`
--

CREATE TABLE `promise_detail` (
  `Promise_ID` int(5) NOT NULL,
  `Promise_Description` varchar(150) NOT NULL,
  `Designation_Level` varchar(100) NOT NULL,
  `DueDate` date NOT NULL,
  `ActionBy` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Remark` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promise_detail`
--

INSERT INTO `promise_detail` (`Promise_ID`, `Promise_Description`, `Designation_Level`, `DueDate`, `ActionBy`, `Status`, `Remark`) VALUES
(1, 'feff', '2222', '2024-01-04', 'Ocad', 'In Progress', 'edee'),
(2, 'dsdd', '1111', '2024-01-10', 'Azrai', 'In Progress', 'ddfgdgdg'),
(3, 'Beli ayam', '2222', '2024-01-04', 'Adam', 'In Progress', 'wwewewe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccountName`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `Admin_Username` (`Admin_Username`);

--
-- Indexes for table `promises`
--
ALTER TABLE `promises`
  ADD UNIQUE KEY `Promise_ID_2` (`Promise_ID`),
  ADD KEY `Promise_ID` (`Promise_ID`,`AccountName`),
  ADD KEY `AccountName` (`AccountName`);

--
-- Indexes for table `promise_detail`
--
ALTER TABLE `promise_detail`
  ADD PRIMARY KEY (`Promise_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `promise_detail`
--
ALTER TABLE `promise_detail`
  MODIFY `Promise_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `promises`
--
ALTER TABLE `promises`
  ADD CONSTRAINT `promises_ibfk_1` FOREIGN KEY (`AccountName`) REFERENCES `account` (`AccountName`),
  ADD CONSTRAINT `promises_ibfk_2` FOREIGN KEY (`Promise_ID`) REFERENCES `promise_detail` (`Promise_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
