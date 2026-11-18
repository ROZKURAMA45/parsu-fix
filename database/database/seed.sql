-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2026 at 02:51 PM
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
-- Database: `campusfix_db`
--

--
-- Dumping data for table `assignment_reworks`
--

INSERT INTO `assignment_reworks` (`rework_id`, `assignment_id`, `repair_no`, `returned_by`, `reason`, `returned_at`, `resubmitted_at`) VALUES
(1, 6, 2, 4, 'not stable', '2026-11-10 15:03:14', '2026-11-10 15:54:10');

--
-- Dumping data for table `facility_issues`
--

INSERT INTO `facility_issues` (`issue_id`, `reported_by`, `location_id`, `facility_name`, `facility_identifier`, `specific_area`, `issue_category`, `description`, `priority`, `status`, `reported_at`, `updated_at`, `resolved_at`, `reviewed_by`, `reviewed_at`, `admin_feedback`, `duplicate_of_issue_id`) VALUES
(11, 1, 1, 'Electric Fan', 'FAN-001', 'Near the instructor table', 'Electrical', 'The electric fan is not working.', 'Medium', 'Pending', '2026-11-06 14:17:49', '2026-11-09 19:54:11', NULL, NULL, NULL, NULL, NULL),
(12, 2, 2, 'Classroom Chair', 'CHAIR-001', 'Near the classroom door', 'Furniture', 'The chair has a broken leg.', 'High', 'Completed', '2026-11-06 14:17:49', '2026-11-09 21:12:26', '2026-11-09 13:12:26', NULL, NULL, NULL, NULL),
(13, 3, 3, 'Ceiling Light', 'LIGHT-001', 'Near the classroom board', 'Electrical', 'The ceiling light is flickering.', 'Medium', 'Pending', '2026-11-06 14:17:49', '2026-11-09 17:47:02', NULL, NULL, NULL, NULL, NULL),
(14, 1, 4, 'Office Door', 'DOOR-001', 'Main entrance', 'Structural', 'The door lock is not functioning properly.', 'High', 'Pending', '2026-11-06 14:17:49', '2026-11-09 19:53:57', NULL, NULL, NULL, NULL, NULL),
(15, 2, 5, 'Reading Table', 'TABLE-001', 'Near the window', 'Furniture', 'The table is unstable.', 'Low', 'Pending', '2026-11-06 14:17:49', '2026-11-06 14:17:49', NULL, NULL, NULL, NULL, NULL),
(16, 4, 2, 'table', NULL, 'instructor table', 'Furniture', 'broken leg', 'Low', 'Completed', '2026-11-08 19:29:28', '2026-11-10 23:54:30', '2026-11-10 15:54:30', 4, '2026-11-08 11:31:17', NULL, NULL),
(17, 4, 2, 'table', NULL, 'instructor table', 'Furniture', 'broken table', 'Medium', 'Duplicate', '2026-11-08 19:32:42', '2026-11-08 19:34:16', NULL, 4, '2026-11-08 11:34:16', NULL, 16),
(18, 1, 1, 'Computer', 'PC 2', 'between pc and pc3', 'Electrical', 'crack yung lcd po', 'Medium', 'Completed', '2026-11-09 19:18:15', '2026-11-17 20:40:42', '2026-11-17 12:40:42', 4, '2026-11-09 11:21:24', NULL, NULL),
(19, 1, 4, 'window', NULL, 'near the  wall fan', 'Structural', 'can\'t open', 'Low', 'Duplicate', '2026-11-10 23:11:35', '2026-11-11 09:39:02', NULL, 4, '2026-11-11 01:39:02', NULL, NULL),
(20, 1, 3, 'white board', NULL, 'nasa wall isang white boardlang meron dun', 'Other', 'sira sira na madami ng butas', 'Low', 'Pending Review', '2026-11-11 09:52:54', '2026-11-11 09:52:54', NULL, NULL, NULL, NULL, NULL);

--
-- Dumping data for table `issue_assignments`
--

INSERT INTO `issue_assignments` (`assignment_id`, `issue_id`, `staff_id`, `assigned_by`, `verified_by`, `verified_at`, `assigned_at`, `scheduled_date`, `scheduled_time`, `assignment_status`, `responded_at`, `assignment_notes`, `response_reason`) VALUES
(4, 11, 1, 4, NULL, NULL, '2026-11-06 14:29:01', NULL, NULL, 'Cancelled', NULL, 'Please inspect and repair the electric fan.', NULL),
(5, 14, 1, 4, NULL, NULL, '2026-11-09 05:45:30', '2026-11-15', NULL, 'Cancelled', NULL, 'Buy a new door knob', NULL),
(6, 16, 1, 4, NULL, NULL, '2026-11-09 07:41:22', '2026-11-09', NULL, 'Completed', '2026-11-09 08:06:24', NULL, NULL),
(7, 12, 1, 4, NULL, NULL, '2026-11-09 09:06:24', '2026-11-11', NULL, 'Completed', '2026-11-09 11:39:40', NULL, NULL),
(8, 13, 1, 4, NULL, NULL, '2026-11-09 09:43:50', '2026-12-02', '18:43:00', 'Declined', '2026-11-09 09:47:02', NULL, 'busy ako maam'),
(9, 18, 1, 4, NULL, NULL, '2026-11-09 11:21:50', '2026-11-12', NULL, 'Declined', '2026-11-09 11:27:12', NULL, 'busy po maam'),
(10, 18, 1, 4, 7, '2026-11-17 12:40:42', '2026-11-09 13:04:26', '2026-11-20', NULL, 'Completed', '2026-11-09 13:05:11', NULL, NULL);

--
-- Dumping data for table `issue_photos`
--

INSERT INTO `issue_photos` (`issue_photo_id`, `issue_id`, `file_path`, `original_filename`, `mime_type`, `file_size`, `uploaded_at`) VALUES
(1, 19, 'issue-photos/pussycat-8a28ed65-a9e7-45ef-9d64-c2b6e89c9ea8.png', 'pussycat.png', 'image/png', 398054, '2026-11-10 23:11:35'),
(2, 20, 'issue-photos/pussycat-d70e1a38-18d6-4678-8e9c-f98ff8501671.png', 'pussycat.png', 'image/png', 398054, '2026-11-11 09:52:54');

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `building_name`, `floor_number`, `room_name`) VALUES
(1, 'Information Technology Building', '1st Floor', 'Computer Laboratory'),
(2, 'Information Technology Building', '1st Floor', 'Room 6'),
(3, 'Information Technology Building', '1st Floor', 'Room 7'),
(4, 'Information Technology Building', '2nd Floor', 'Room 15'),
(5, 'Information Technology Building', '2nd Floor', 'Computer Laboratory'),
(6, 'Information Technology Building', '3rd Floor', 'Room 20');

--
-- Dumping data for table `maintenance_staff`
--

INSERT INTO `maintenance_staff` (`staff_id`, `user_id`, `specialization`, `availability_status`) VALUES
(1, 5, 'General Maintenance', 'Available');

--
-- Dumping data for table `repair_photos`
--

INSERT INTO `repair_photos` (`repair_photo_id`, `assignment_id`, `repair_no`, `file_path`, `original_filename`, `mime_type`, `file_size`, `uploaded_at`) VALUES
(1, 4, 1, 'uploads/repair_photos/electric_fan_repaired.jpg', 'electric_fan_repaired.jpg', 'image/jpeg', 300000, '2026-11-06 14:38:08'),
(2, 6, 2, 'repair-photos/9cf31b93-5198-4a64-80d9-5f3dd240aa8a.png', 'Gemini_Generated_Image_itzm2witzm2witzm.png', 'image/png', 1345379, '2026-11-10 15:01:58'),
(3, 10, 1, 'repair-photos/dd6ab7f5-8f9d-44a4-af31-46c56adf31c7.jpg', '4a68b958bad86fb7e183d5ee7c744d19.jpg', 'image/jpeg', 96322, '2026-11-17 12:39:17');

--
-- Dumping data for table `repair_records`
--

INSERT INTO `repair_records` (`assignment_id`, `repair_no`, `action_taken`, `repair_date`, `remarks`) VALUES
(4, 1, 'Inspected the electric fan and checked its electrical connection.', '2026-11-06 14:34:27', 'Initial inspection completed. Further repair may be needed.'),
(6, 1, 'New leg of the table', '2026-11-10 00:00:00', NULL),
(6, 2, 'fixed broken leg', '2026-11-10 00:00:00', NULL),
(6, 3, 'add a nail', '2026-11-10 00:00:00', NULL),
(7, 1, 'new leg of the table', '2026-11-09 00:00:00', NULL),
(10, 1, 'new lcd install', '2026-11-17 00:00:00', NULL);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password_hash`, `phone`, `role`, `account_status`, `created_at`) VALUES
(1, 'Juan Dela Cruz', 'juan@student.edu.ph', '$2y$12$2NZ/aD73iYx16TGpc1H0rOSy6tACfd1x7Rrcd086LzQgpH88J/uR.', '09171234567', 'Student', 'Active', '2026-11-06 13:05:54'),
(2, 'Maria Santos', 'maria@faculty.edu.ph', '$2y$12$mmzCsvYrNBf4qBMoDhStSuBC6x/V3DWnAkZu/4cdtXyXA5..YtmlS', '09181234567', 'Teaching Personnel', 'Active', '2026-11-06 13:05:54'),
(3, 'Pedro Reyes', 'pedro@campus.edu.ph', '$2y$12$w6XDOdui4PSt6LIaG5Ozj.C2NFdUQBh3p92/fSrNfeYOubyKfh4ha', '09191234567', 'Campus Support Personnel', 'Active', '2026-11-06 13:05:54'),
(4, 'Ana Garcia', 'ana@admin.edu.ph', '$2y$12$AayqZuoKYZ/kHwXVefdk2.I4M1Jp257bZfoRcf4zxregIQyFvg6cW', '09201234567', 'Admin', 'Active', '2026-11-06 13:05:54'),
(5, 'Jose Mendoza', 'roswellpancho@gmail.com', '$2y$12$rIzJRgXnylCmCHdkzCJ8LejHRet1i.Ug43HTygpIEpFBxKYnTegWC', '09211234567', 'Maintenance Personnel', 'Active', '2026-11-06 13:05:54'),
(7, 'Alpord Antonio', 'alpord@admin.edu.ph', '$2y$12$.6LwgwV63nzkTau5OLtVMOuwJ6piuqIL6O/.LP5PkUbPIC.7cMVvS', NULL, 'Admin', 'Active', '2026-11-17 14:12:48');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

