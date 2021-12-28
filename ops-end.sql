-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 28, 2021 at 08:29 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ops`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `compname` varchar(50) NOT NULL,
  `taxid` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `compname`, `taxid`, `name`, `tel`, `address`) VALUES
(4, 'Wachira Co.', '1212312121333', 'วชิรวิชญ์ พัฒนสิน', '0986453988', '5/23 ถ.สันติสุข'),
(5, 'บริษัท ทดสอบ จำกัด', '19111911999911', 'วชิรวิชญ์ พัฒนสิน', '08999999999', '5/23 ถ.สันติสุข'),
(6, 'บริษัท ทดสอบ จำกัด', '19111911999911', 'วชิรวิชญ์ พัฒนสิน', '08999999999', '5/23 ถ.สันติสุข'),
(7, 'บริษัท ทดสอบ จำกัด', '123123123123123', 'วชิรวิชญ์ พัฒนสิน', '08999999999', '5/23 ถ.สันติสุข');

-- --------------------------------------------------------

--
-- Table structure for table `coordinate`
--

CREATE TABLE `coordinate` (
  `taxid` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coordinate`
--

INSERT INTO `coordinate` (`taxid`, `name`, `email`, `tel`) VALUES
('1212312121333', 'วชิรวิชญ์ พัฒนสิน', 'test-test@gmail.com', '012345678'),
('19111911999911', 'Wachirawit Phatthanasin', 'ballspcep075@gmail.com', '0899999534'),
('19111911999911', 'Wachirawit Phatthanasin', 'ballspcep075@gmail.com', '0899999534'),
('123123123123123', 'วชิรวิชญ์ พัฒนสิน', 'i-tester@hotmail.com', '0899999534');

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `taxid` varchar(20) NOT NULL,
  `registerfee` double DEFAULT NULL,
  `systemfee` double DEFAULT NULL,
  `registerstart` date DEFAULT NULL,
  `registerend` date DEFAULT NULL,
  `paymentstart` date DEFAULT NULL,
  `paymentend` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`taxid`, `registerfee`, `systemfee`, `registerstart`, `registerend`, `paymentstart`, `paymentend`) VALUES
('123123123123123', 297, 44, '2021-12-28', '2022-01-05', '2022-01-05', '2022-01-30');

-- --------------------------------------------------------

--
-- Table structure for table `finance`
--

CREATE TABLE `finance` (
  `taxid` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance`
--

INSERT INTO `finance` (`taxid`, `name`, `email`, `tel`) VALUES
('1212312121333', 'ทดสอบ การเงิน', 'test-finance@gmail.com', '0987654321'),
('19111911999911', 'วชิรวิชญ์ พัฒนสิน', 'i-tester@hotmail.com', '0812345678'),
('19111911999911', 'วชิรวิชญ์ พัฒนสิน', 'i-tester@hotmail.com', '0812345678'),
('123123123123123', 'วชิรวิชญ์ พัฒนสิน', 'i-test-finance@hotmail.com', '0812345678');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `taxid` varchar(20) NOT NULL,
  `bankname` varchar(50) NOT NULL,
  `accname` varchar(50) NOT NULL,
  `acctype` varchar(20) NOT NULL,
  `accno` varchar(20) NOT NULL,
  `accbranch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`taxid`, `bankname`, `accname`, `acctype`, `accno`, `accbranch`) VALUES
('1212312121333', 'กสิกรไทย', '0203957424', 'ออมทรัพย์', '0203957424', 'ฟิวเจอร์พาร์ครังสิต'),
('19111911999911', 'ธนาคารแห่งประเทศไทย', 'อิอิซ่า', 'ออมทรัพย์', '0203957424', 'ฟิวเจอร์พาร์ครังสิต'),
('19111911999911', 'ธนาคารแห่งประเทศไทย', 'อิอิซ่า', 'ออมทรัพย์', '0203957424', 'ฟิวเจอร์พาร์ครังสิต'),
('123123123123123', 'กสิกรไทย', 'วชิรวิชญ์ พัฒนสิน', 'ออมทรัพย์', '0203957424', 'ฟิวเจอร์พาร์ครังสิต');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
