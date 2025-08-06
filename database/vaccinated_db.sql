-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 16, 2024 at 04:34 PM
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
-- Database: `vaccinated_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `individual_list`
--

CREATE TABLE `individual_list` (
  `id` int(30) NOT NULL,
  `tracking_code` varchar(50) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text NOT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=Partially Vaccinated, 2= Fully Vaccinated',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `individual_list`
--

INSERT INTO `individual_list` (`id`, `tracking_code`, `firstname`, `middlename`, `lastname`, `gender`, `dob`, `contact`, `address`, `status`, `date_created`, `date_updated`) VALUES
(1, '133632365921974', 'Samantha ', 'Nimeshi', 'Perera', 'Female', '1997-06-23', '07123456789', 'No.22, Colombo, Sri Lanka', 2, '2024-04-01 16:00:22', '2024-04-15 19:19:24');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Epidemiology Unit Ministry of Health - Sri Lanka'),
(6, 'short_name', 'COVID-19 MANAGEMENT'),
(11, 'logo', 'uploads/logo-1634524879.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1634524906.png');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext NOT NULL,
  `EmailId` varchar(255) NOT NULL,
  `ContactNo` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Kegalle, Sri Lanka', 'covidinfo@gmail.com', '0785233222');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `location_id` int(30) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `nic` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `location_id`, `date_added`, `date_updated`, `nic`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, NULL, '2021-01-20 14:02:37', '2024-04-16 19:15:53', '200013214574'),
(3, 'John', 'Smith', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'uploads/avatar-3.png?v=1634528899', NULL, 2, 2, '2021-10-18 11:38:39', '2024-04-16 19:16:02', '200224214574'),
(4, 'Clairry', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatar-4.png?v=1634529434', NULL, 2, 1, '2021-10-18 11:57:14', '2024-04-16 19:16:10', '200099214574'),
(6, 'Nisan', 'Perera', 'Nizan', '0ce9e2a07ebe3678ed75c8bbb1f63d04', NULL, NULL, 2, 1, '2024-04-16 01:10:08', '2024-04-16 19:16:17', '200014213374'),
(7, 'Shehan', 'Perera', 'Nizannn', '0ce9e2a07ebe3678ed75c8bbb1f63d04', NULL, NULL, 2, 1, '2024-04-16 01:10:33', '2024-04-16 19:16:24', '200114214574'),
(9, 'test', 'testt', 'test1', '098f6bcd4621d373cade4e832627b4f6', NULL, NULL, 2, 2, '2024-04-16 01:16:24', '2024-04-16 19:16:31', '200014214588'),
(14, 'Jayy', 'Jayyyy', 'Jayy', '8d358fd50782ff64c17cec036bd4444c', NULL, NULL, 2, 4, '2024-04-16 01:26:42', '2024-04-16 19:15:36', '200016514574'),
(15, 'Thanushi', 'Jay', 'Perera', '7b0e45e5de271ba59d9da7d39a09d79d', NULL, NULL, 1, 0, '2024-04-16 19:09:19', NULL, '200014214574');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_location_list`
--

CREATE TABLE `vaccination_location_list` (
  `id` int(30) NOT NULL,
  `location` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vaccination_location_list`
--

INSERT INTO `vaccination_location_list` (`id`, `location`, `status`, `date_created`) VALUES
(1, 'Vaccine Area 01, Colombo, Sri Lanka', 1, '2024-03-30 11:16:32'),
(2, 'Vaccine Area 02, Kandy, Sri Lanka', 1, '2024-03-30 11:20:21'),
(3, 'Vaccine Area 03, Kegalle, Sri Lanka', 1, '2024-03-30 11:20:42'),
(4, 'Vaccine Area 04, Gampaha, Sri Lanka', 1, '2024-03-30 11:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_history_list`
--

CREATE TABLE `vaccine_history_list` (
  `id` int(30) NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `individual_id` int(30) NOT NULL,
  `vaccine_id` int(30) NOT NULL,
  `location_id` int(30) NOT NULL,
  `vaccination_type` varchar(50) NOT NULL,
  `vaccinated_by` text NOT NULL,
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vaccine_history_list`
--

INSERT INTO `vaccine_history_list` (`id`, `user_id`, `individual_id`, `vaccine_id`, `location_id`, `vaccination_type`, `vaccinated_by`, `remarks`, `date_created`, `date_updated`) VALUES
(1, 1, 1, 1, 4, '1st Dose', 'Dr. Seneviratne', 'Sample Only', '2024-03-31 16:00:22', '2024-03-31 16:07:49'),
(8, 1, 1, 5, 1, '2nd Dose', 'Dr. Darmadasa', 'Final Dose', '2024-03-31 17:01:39', '2024-04-15 19:17:21');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_list`
--

CREATE TABLE `vaccine_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expired_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vaccine_list`
--

INSERT INTO `vaccine_list` (`id`, `name`, `status`, `date_created`, `expired_date`) VALUES
(1, 'Pfizer-BioNTech', 1, '2024-04-16 19:59:16', '2025-04-03'),
(2, 'Moderna', 1, '2024-04-16 19:59:29', '2025-04-05'),
(3, 'Johnson & Johnson’s Janssen', 1, '2024-04-16 19:59:38', '2025-04-06'),
(4, 'AstraZeneca', 1, '2024-04-16 19:59:47', '2025-04-07'),
(5, 'Sinovac', 1, '2024-04-16 19:59:59', '2025-04-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `individual_list`
--
ALTER TABLE `individual_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `vaccination_location_list`
--
ALTER TABLE `vaccination_location_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccine_history_list`
--
ALTER TABLE `vaccine_history_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vaccine_id` (`vaccine_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `individual_id` (`individual_id`);

--
-- Indexes for table `vaccine_list`
--
ALTER TABLE `vaccine_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `individual_list`
--
ALTER TABLE `individual_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `vaccination_location_list`
--
ALTER TABLE `vaccination_location_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vaccine_history_list`
--
ALTER TABLE `vaccine_history_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vaccine_list`
--
ALTER TABLE `vaccine_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vaccine_history_list`
--
ALTER TABLE `vaccine_history_list`
  ADD CONSTRAINT `vaccine_history_list_ibfk_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vaccine_history_list_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `vaccination_location_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vaccine_history_list_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vaccine_history_list_ibfk_7` FOREIGN KEY (`individual_id`) REFERENCES `individual_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
