-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2021 at 11:50 AM
-- Server version: 8.0.23
-- PHP Version: 7.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `factory_worker`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dept_no` char(4) NOT NULL,
  `dept_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dept_emp`
--

CREATE TABLE `dept_emp` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dept_manager`
--

CREATE TABLE `dept_manager` (
  `dept_no` char(4) NOT NULL,
  `emp_no` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `emp_no` int NOT NULL,
  `designation` varchar(50) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `first_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `birth_date` date NOT NULL,
  `gender` enum('M','F') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hire_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_no`, `first_name`, `last_name`, `birth_date`, `gender`, `hire_date`) VALUES
(1, 'Navin', 'Chandra', '1999-04-15', 'M', '2010-02-01'),
(2, 'Rohan', 'Naik', '2005-12-26', 'M', '2015-04-01'),
(3, 'Siddhant', 'Panda', '1995-08-02', 'M', '2005-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `emp_salary`
--

CREATE TABLE `emp_salary` (
  `emp_no` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `salary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_no`);

--
-- Indexes for table `dept_emp`
--
ALTER TABLE `dept_emp`
  ADD PRIMARY KEY (`emp_no`,`dept_no`),
  ADD KEY `dept_emp_dept_no_departments` (`dept_no`);

--
-- Indexes for table `dept_manager`
--
ALTER TABLE `dept_manager`
  ADD PRIMARY KEY (`dept_no`,`emp_no`),
  ADD KEY `dept_manager_emp_no_employees` (`emp_no`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`emp_no`,`designation`,`from_date`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_no`);

--
-- Indexes for table `emp_salary`
--
ALTER TABLE `emp_salary`
  ADD PRIMARY KEY (`emp_no`,`from_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dept_emp`
--
ALTER TABLE `dept_emp`
  ADD CONSTRAINT `dept_emp_dept_no_departments` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dept_emp_emp_no_employees` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dept_manager`
--
ALTER TABLE `dept_manager`
  ADD CONSTRAINT `dept_manager_dept_no_departments` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dept_manager_emp_no_employees` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `designation`
--
ALTER TABLE `designation`
  ADD CONSTRAINT `emp_no_designation` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emp_salary`
--
ALTER TABLE `emp_salary`
  ADD CONSTRAINT `emp_salary_emp_no_employees` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
