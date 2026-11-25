-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2026 at 11:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student-admission-management-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admission`
--

CREATE TABLE `admission` (
  `admission_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admission`
--

INSERT INTO `admission` (`admission_id`, `student_id`, `course_id`, `admission_date`, `status`) VALUES
(11, 1, 1, '2026-01-10', 'Pending'),
(12, 2, 1, '2026-01-11', 'processed'),
(13, 3, 2, '2026-01-12', 'pending'),
(14, 4, 3, '2026-01-13', 'processed'),
(15, 5, 3, '2026-01-14', 'pending '),
(16, 6, 2, '2026-01-15', 'processed'),
(17, 7, 1, '2026-01-16', 'pending '),
(18, 8, 2, '2026-01-17', 'processed'),
(19, 9, 3, '2026-01-18', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `credit_hours` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `duration`, `credit_hours`, `dept_id`) VALUES
(1, 'BSCS', '4 Years', 130, 1),
(2, 'BSIT', '4 Years', 125, 1),
(3, 'BBA', '4 Years', 120, 2),
(4, 'MBA', '2 Years', 60, 2),
(5, 'BSEE', '4 Years', 135, 3),
(6, 'BS Telecommunication', '4 Years', 130, 3);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_id`, `dept_name`) VALUES
(1, 'Computer Science'),
(2, 'Business Administration'),
(3, 'Electrical Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `fee_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `status` enum('Paid','Unpaid') DEFAULT 'Unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`fee_id`, `student_id`, `amount`, `payment_date`, `status`) VALUES
(1, 1, 45000.00, '2026-01-10', 'Paid'),
(2, 2, 45000.00, '2026-01-11', 'Paid'),
(3, 3, 45000.00, '2026-01-12', 'Unpaid'),
(4, 4, 38000.00, '2026-01-13', 'Paid'),
(5, 5, 38000.00, '2026-01-14', 'Unpaid'),
(6, 6, 50000.00, '2026-01-15', 'Paid'),
(7, 7, 47000.00, '2026-01-16', 'Paid'),
(8, 8, 47000.00, '2026-01-17', 'Unpaid'),
(9, 9, 47000.00, '2026-01-18', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `roll_no` varchar(20) DEFAULT NULL,
  `gpa` decimal(3,2) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `roll_no`, `gpa`, `section`, `dept_id`) VALUES
(1, 'Ali Khan', 'CS-001', 3.85, 'A', 1),
(2, 'Sara Ahmed', 'CS-002', 3.95, 'A', 1),
(3, 'Usman Malik', 'CS-003', 2.75, 'B', 1),
(4, 'Fatima Zahra', 'BBA-001', 3.45, 'A', 2),
(5, 'Hamza Ali', 'BBA-002', 2.90, 'A', 2),
(6, 'Mariam Khan', 'BBA-003', 3.78, 'B', 2),
(7, 'Hassan', 'EE-001', 3.88, 'A', 3),
(8, 'Iqra Bibi', 'EE-002', 3.40, 'A', 3),
(9, 'Omar Farooq', 'EE-003', 2.95, 'B', 3),
(10, 'Khadija', 'BBA-004', 3.85, 'A', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admission`
--
ALTER TABLE `admission`
  ADD PRIMARY KEY (`admission_id`),
  ADD KEY `fk_admission_student` (`student_id`),
  ADD KEY `fk_admission_course` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `fk_course_dept` (`dept_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`fee_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `fk_student_dept` (`dept_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admission`
--
ALTER TABLE `admission`
  MODIFY `admission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission`
--
ALTER TABLE `admission`
  ADD CONSTRAINT `admission_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `admission_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `admission_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `fk_admission_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_admission_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_course_dept` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE;

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_student_dept` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`),
  ADD CONSTRAINT `students_ibfk_3` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
