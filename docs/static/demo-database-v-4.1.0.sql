-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 16, 2025 at 07:13 AM
-- Server version: 10.11.10-MariaDB-cll-lve-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u863526903_edemand_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(50) NOT NULL,
  `type` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `alternate_mobile` varchar(20) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `city_id` int(20) NOT NULL DEFAULT 0,
  `city` varchar(252) NOT NULL,
  `landmark` varchar(128) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `lattitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

--
-- Table structure for table `admin_contact_query`
--

CREATE TABLE `admin_contact_query` (
  `id` int(11) NOT NULL,
  `email` mediumtext DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `message` longtext NOT NULL,
  `subject` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- ----------------------------------------------------------
--
-- Table structure for table `bank_transfers`
--

CREATE TABLE `bank_transfers` (
  `id` int(11) UNSIGNED NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attachments` mediumtext NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 Pending | 1 Accpted | 2 Rejected',
  `message` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `partner_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `is_saved_for_later` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_add_ons`
--

CREATE TABLE `cart_add_ons` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `add_on_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_collection`
--

CREATE TABLE `cash_collection` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` mediumtext NOT NULL,
  `commison` int(11) NOT NULL,
  `status` mediumtext NOT NULL,
  `partner_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(50) NOT NULL DEFAULT 0,
  `name` varchar(1024) NOT NULL,
  `image` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_commission` double NOT NULL COMMENT 'global admin commission for all partners',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive | 1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `dark_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `light_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `image`, `slug`, `admin_commission`, `status`, `created_at`, `updated_at`, `dark_color`, `light_color`) VALUES
(213, 0, 'Home Services', '1739277585_1c2b3fe0c7c9067af624.svg', 'home-services', 0, 1, '2022-11-02 07:12:28', '2025-02-13 11:33:29', '#2a2c3e', '#ffffff'),
(215, 213, 'Room Cleaning', 'room cleaning-min.jpg', 'room-cleaning', 0, 1, '2022-11-02 07:14:09', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(216, 213, 'Window Cleaning', 'window cleaning-min.jpg', 'window-cleaning', 0, 1, '2022-11-02 07:17:13', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(217, 213, 'Washroom Cleaning', 'washroom cleaning-min.jpg', 'washroom-cleaning', 0, 1, '2022-11-02 07:19:40', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(218, 213, 'Kitchen Cleaning', 'kitchen cleaning-min.jpg', 'kitchen-cleaning', 0, 1, '2022-11-02 07:30:06', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(220, 213, 'Carpet Cleaning', 'carpet cleaning-min.jpg', 'carpet-cleaning', 0, 1, '2022-11-02 08:22:47', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(221, 0, 'Ac Services', '1739277657_7586bb9b7b02d17fbb38.svg', 'ac-services', 0, 1, '2022-11-02 08:42:23', '2025-02-11 18:10:57', '#2a2c3e', '#ffffff'),
(222, 0, 'Laundry Services', '1739277630_1454a30cac175041d015.svg', 'laundry-services', 0, 1, '2022-11-02 09:37:57', '2025-02-11 18:10:30', '#2a2c3e', '#ffffff'),
(223, 221, 'Making to much noise', 'stressed-young-man-has-problem-with-air-conditioner-home.jpg', 'making-to-much-noise', 6, 1, '2022-11-02 09:42:11', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(224, 221, 'Compressor  switching off', 'closeup-hand-use-manifold-gauge-checking-refrigerant-air-conditioner.jpg', 'compressor--switching-off', 5, 1, '2022-11-02 09:43:02', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(225, 221, 'Water Leak inside', 'hands-technician-using-screwdriver-when-installing-air-conditioner-bedroom-customer.jpg', 'water-leak-inside', 6, 1, '2022-11-02 09:43:48', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(226, 221, 'Not Cooling Properly', 'worker-repairing-ceiling-air-conditioning-unit.jpg', 'not-cooling-properly', 6, 1, '2022-11-02 09:44:56', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(227, 221, 'AC System Freezing', 'air-conditioner-technician-checks-operation-industrial-air-conditioners.jpg', 'ac-system-freezing', 5, 1, '2022-11-02 09:47:48', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(228, 259, 'Oil Filter Changed', 'dipstick-checking-oil-level-car-engine-engine-oil-consumption-rates.jpg', 'oil-filter-changed', 0, 1, '2022-11-02 09:56:19', '0000-00-00 00:00:00', '#2a2c3e', '#ffffff'),
(229, 259, 'Antifreeze  added', 'person-pouring-antifreeze-car-wintertime.jpg', 'antifreeze--added', 0, 1, '2022-11-02 09:58:07', '0000-00-00 00:00:00', '#2a2c3e', '#ffffff'),
(230, 259, 'Battery  Replacement', 'auto-mechanic-carries-replacement-car-battery-car-electrical-maintenance.jpg', 'battery--replacement', 0, 1, '2022-11-02 10:02:36', '0000-00-00 00:00:00', '#2a2c3e', '#ffffff'),
(232, 259, 'New Tires', '1742884629_93f30993baa76e8a9ffb.jpg', 'new-tires', 0, 1, '2022-11-02 10:03:53', '2025-03-25 12:07:09', '#2a2c3e', '#ffffff'),
(234, 259, 'Brake repair', 'muscular-car-service-worker-repairing-vehicle.jpg', 'brake-repair', 0, 1, '2022-11-02 10:11:50', '0000-00-00 00:00:00', '#2a2c3e', '#ffffff'),
(235, 222, 'Washing', 'cleansing-min.jpg', 'washing', 0, 1, '2022-11-02 10:14:57', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(236, 222, 'Dry Cleaning', 'dry cleaning-min.jpg', 'dry-cleaning', 0, 1, '2022-11-02 10:17:28', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(237, 222, 'Leather Cleaning', 'leather cleaning-min.jpg', 'leather-cleaning', 0, 1, '2022-11-02 10:19:55', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(238, 222, 'Carpet & Floor Mat Cleaning', 'carpet cleaning-min (1).jpg', 'carpet-&-floor-mat-cleaning', 0, 1, '2022-11-02 10:23:35', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(239, 222, 'Blanket Cleaning', 'blanket cleaning-min.jpg', 'blanket-cleaning', 0, 1, '2022-11-02 10:27:02', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(240, 0, 'Plumbing Services', '1739277857_575f9a7fc5dfe0b63357.svg', 'plumbing-services', 0, 1, '2022-11-02 10:28:38', '2025-02-11 18:14:17', '#2a2c3e', '#ffffff'),
(241, 240, 'Water Leaks', 'water leaks-min.jpg', 'water-leaks', 0, 1, '2022-11-02 10:29:44', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(242, 240, 'Bathroom Installations', 'bathroom_-min.jpg', 'bathroom-installations', 0, 1, '2022-11-02 10:30:49', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(243, 240, 'Wall Pump Repair', 'wall pump-min.jpg', 'wall-pump-repair', 0, 1, '2022-11-02 10:33:25', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(244, 240, 'Water Heater Repair', 'water heater-min.jpg', 'water-heater-repair', 0, 1, '2022-11-03 05:41:03', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(245, 240, 'Shower Installation', '1667454147.jpg', 'shower-installation', 6, 1, '2022-11-03 05:42:27', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(246, 0, 'Pest Control Services', '1739277830_55eb2980983ed765830a.svg', 'pest-control-services', 0, 1, '2022-11-03 06:01:12', '2025-02-11 18:13:50', '#2a2c3e', '#ffffff'),
(247, 246, 'Mosquitoes', 'mosquitoes-min.png', 'mosquitoes', 0, 1, '2022-11-03 06:06:11', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(248, 246, 'Rats', 'rats-min (1).jpg', 'rats', 0, 1, '2022-11-03 06:07:50', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(249, 246, 'Cockroaches', 'cockroach-min.jpg', 'cockroaches', 0, 1, '2022-11-03 06:10:58', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(250, 246, 'Bed bug', 'bedbug-min.jpg', 'bed-bug', 0, 1, '2022-11-03 06:12:28', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(251, 246, 'Ant', 'ant-min.jpg', 'ant', 0, 1, '2022-11-03 06:16:54', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(252, 0, 'Electronic Services', '1739277804_5de79299ac54a3b65814.svg', 'electronic-services', 0, 1, '2022-11-05 04:49:46', '2025-02-11 18:13:24', '#2a2c3e', '#ffffff'),
(253, 252, 'Outdoor lighting', '1667623853.jpg', 'outdoor-lighting', 10, 1, '2022-11-05 04:50:53', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(254, 252, 'Fan installation', '1667623890.jpg', 'fan-installation', 10, 1, '2022-11-05 04:51:30', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(255, 252, 'Socket Switch Installation', '1667623928.jpg', 'socket-switch-installation', 10, 1, '2022-11-05 04:52:08', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(256, 252, 'Security  System', '1667623948.jpg', 'security--system', 10, 1, '2022-11-05 04:52:28', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(257, 252, 'Light Fixture', '1667623972.jpg', 'light-fixture', 10, 1, '2022-11-05 04:52:52', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(258, 252, 'Ground Wiring', '1667624041.jpg', 'ground-wiring', 10, 1, '2022-11-05 04:54:01', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(259, 0, 'Mechanic Services', '1739277769_f7a925e689a04081eb59.svg', 'mechanic-services', 0, 1, '2022-11-08 04:22:25', '2025-02-11 18:12:49', '#2a2c3e', '#ffffff'),
(265, 0, 'Salon Services', '1739277745_0a109dc0054a4f7374a6.svg', 'salon-services', 0, 1, '2022-11-08 06:38:47', '2025-02-11 18:12:25', '#2a2c3e', '#ffffff'),
(267, 265, 'Hair cut', '1667890022.jpg', 'hair-cut', 10, 1, '2022-11-08 06:47:02', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(268, 265, 'Hair color', '1667890048.jpg', 'hair-color', 10, 1, '2022-11-08 06:47:28', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(269, 265, 'Shave/Trim', '1667890081.jpg', 'shave/trim', 10, 1, '2022-11-08 06:48:01', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(270, 0, 'Carpenter Services', '1739277705_997bdd15a799f62f8da7.svg', 'carpenter-services', 0, 1, '2022-11-08 07:55:14', '2025-02-11 18:11:45', '#2a2c3e', '#ffffff'),
(271, 270, 'Kitchen Cabinets', '1667894196.jpg', 'kitchen-cabinets', 20, 1, '2022-11-08 07:56:36', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(272, 270, 'Wardrobe Cupboard', '1742884485_2d4002ba0490bdf5fa5b.jpg', 'wardrobe-cupboard', 0, 1, '2022-11-08 07:57:16', '2025-05-07 14:54:23', '#2a2c3e', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `booking_id` text DEFAULT NULL,
  `message` longtext NOT NULL,
  `file` longtext DEFAULT NULL,
  `file_type` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `e_id` int(11) NOT NULL,
  `sender_type` int(11) NOT NULL COMMENT '0 : Admin\r\n1: Provider\r\n2: customer',
  `receiver_type` int(11) NOT NULL COMMENT '0 : Admin\r\n1: Provider\r\n2: customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `latitude` varchar(120) DEFAULT NULL,
  `longitude` varchar(120) DEFAULT NULL,
  `delivery_charge_method` varchar(30) DEFAULT NULL,
  `fixed_charge` int(11) NOT NULL DEFAULT 0,
  `per_km_charge` int(11) NOT NULL DEFAULT 0,
  `range_wise_charges` text DEFAULT NULL,
  `time_to_travel` int(11) NOT NULL DEFAULT 0,
  `geolocation_type` varchar(30) DEFAULT NULL COMMENT 'not used in current',
  `radius` varchar(512) DEFAULT '0' COMMENT 'not used in current',
  `boundary_points` text DEFAULT NULL COMMENT 'not used in current',
  `max_deliverable_distance` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `latitude`, `longitude`, `delivery_charge_method`, `fixed_charge`, `per_km_charge`, `range_wise_charges`, `time_to_travel`, `geolocation_type`, `radius`, `boundary_points`, `max_deliverable_distance`, `created_at`, `updated_at`) VALUES
(7, 'Mundra', '22.8395642', '69.72407489999999', 'fixed_charge', 78, 0, NULL, 10, NULL, '0', NULL, 10, '2022-06-25 05:18:00', '2022-08-24 13:51:13'),
(10, 'Bharuch', '21.7051358', '72.9958748', 'per_km_charge', 0, 10, NULL, 0, NULL, '0', NULL, 0, '2022-07-01 10:16:00', '2022-09-21 04:09:57'),
(11, 'Mundra', '22.839715', '69.704199', 'fixed_charge', 0, 0, NULL, 20, NULL, '0', NULL, 20, '2022-07-01 10:16:33', '2022-07-14 12:33:53'),
(14, 'Gandhidham', '23.075297', '70.133673', 'fixed_charge', 0, 0, NULL, 20, NULL, '0', NULL, 20, '2022-07-01 10:17:53', '2022-07-14 12:33:18'),
(15, 'Bhachau', '23.2930388', '70.339045', 'fixed_charge', 0, 0, NULL, 20, NULL, '0', NULL, 30, '2022-07-14 06:28:00', '2022-07-14 12:32:57'),
(16, 'Anjar', '23.1166716', '70.0281023', 'fixed_charge', 10, 0, NULL, 20, NULL, '0', NULL, 10, '2022-07-14 06:55:11', '2022-07-14 11:48:10'),
(17, 'Mandvi', '22.833334', '69.3554783', 'fixed_charge', 0, 0, NULL, 20, NULL, '0', NULL, 50, '2022-07-14 07:16:00', '2022-07-14 12:38:21'),
(18, 'Bhuj', '23.242697188102483', '69.6639650758625', 'per_km_charge', 0, 10, NULL, 10, NULL, '0', NULL, 10, '2022-09-21 04:08:26', '2022-09-21 04:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `country_codes`
--

CREATE TABLE `country_codes` (
  `name` text NOT NULL,
  `code` text NOT NULL,
  `created_at` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  `is_default` int(11) NOT NULL DEFAULT 0,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country_codes`
--

INSERT INTO `country_codes` (`name`, `code`, `created_at`, `id`, `is_default`, `updated_at`) VALUES
('India', '+91', NULL, 1, 1, '2025-06-12');

-- --------------------------------------------------------

--
-- Table structure for table `custom_job_provider`
--

CREATE TABLE `custom_job_provider` (
  `id` int(11) NOT NULL,
  `custom_job_request_id` text NOT NULL,
  `partner_id` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_job_requests`
--

CREATE TABLE `custom_job_requests` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `service_title` text NOT NULL,
  `service_short_description` text NOT NULL,
  `min_price` text NOT NULL,
  `max_price` text NOT NULL,
  `requested_start_date` date NOT NULL,
  `requested_start_time` time NOT NULL,
  `requested_end_date` date NOT NULL,
  `requested_end_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delete_general_notification`
--

CREATE TABLE `delete_general_notification` (
  `id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `notification_id` int(50) NOT NULL,
  `is_readed` tinyint(50) NOT NULL,
  `is_deleted` tinytext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `user_id` text DEFAULT NULL,
  `subject` text NOT NULL,
  `type` text NOT NULL,
  `parameters` text NOT NULL,
  `bcc` text DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `subject` text NOT NULL,
  `to` text NOT NULL,
  `template` longtext NOT NULL,
  `bcc` text DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `parameters` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `type`, `subject`, `to`, `template`, `bcc`, `cc`, `parameters`) VALUES
(53, 'provider_approved', 'Approval of Registration Request', '', '&lt;p&gt;Dear [[provider_name]],&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;We&#039;re thrilled to inform you that your request has been approved! This is a significant milestone, and we can&#039;t wait to witness the impact your solutions will have on our operations.&lt;/p&gt;\\r\\n&lt;p&gt;Here are the details you need:&lt;br /&gt;&lt;br /&gt;Provider ID: [[provider_id]]&lt;br /&gt;Company Name: [[provider_name]]&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;\\r\\n&lt;p&gt;As we move forward, please feel free to reach out with any questions or additional information you may require. We&#039;re here to ensure a smooth and successful collaboration.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Thank you once again for your outstanding work and dedication. We&#039;re looking forward to a fruitful partnership!&lt;/p&gt;\\r\\n&lt;p&gt;Warm regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[company_logo]]&lt;/p&gt;\\r\\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\\\"provider_name\\\",\\\"provider_id\\\",\\\"provider_name\\\",\\\"company_logo\\\",\\\"company_contact_info\\\"]'),
(54, 'provider_disapproved', 'Rejection of Registration Request', '', '&lt;p&gt;Dear [[provider_name]] ,&lt;/p&gt;\\r\\n&lt;p&gt;I regret to inform you that your registration request has been declined. After careful review and consideration, we have determined that your offerings do not align with our current needs or standards.&lt;/p&gt;\\r\\n&lt;p&gt;While we appreciate your interest in partnering with us, we believe it&#039;s in both of our best interests to explore other opportunities that better fit our requirements at this time.&lt;/p&gt;\\r\\n&lt;p&gt;Please know that this decision was not made lightly, and we genuinely value the effort you put into your application. We encourage you to continue pursuing opportunities that align more closely with your expertise and offerings.&lt;/p&gt;\\r\\n&lt;p&gt;Thank you for your understanding. Should you have any questions or require further clarification, please don&#039;t hesitate to reach out.&lt;/p&gt;\\r\\n&lt;p&gt;I wish you all the best in your future endeavors.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Warm regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[company_name]]&lt;/p&gt;\\r\\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;', '', '', '[\\\"provider_name\\\",\\\"company_name\\\",\\\"company_contact_info\\\"]'),
(55, 'withdraw_request_approved', 'Withdrawal Request Approved', '', '&lt;p&gt;Dear [[Provider Name]],&lt;/p&gt;\\r\\n&lt;p&gt;We are pleased to inform you that your withdrawal request has been approved. If you have any questions or concerns regarding this transaction, please do not hesitate to contact us. Thank you for choosing our services. We look forward to providing you with excellent service in the future.&lt;/p&gt;\\r\\n&lt;p&gt;Your Request is for: [[Amount]] [[Currency]].&lt;/p&gt;\\r\\n&lt;p&gt;Best Regards, [[Company Name]]&lt;/p&gt;', '', '', '[\\\"Provider Name\\\",\\\"Amount\\\",\\\"Currency\\\",\\\"Company Name\\\"]'),
(56, 'withdraw_request_disapproved', 'Withdrawal Request Disapproved', '', '&lt;p&gt;Dear [[Provider Name]],&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;We regret to inform you that your withdrawal request has been disapproved. If you have any questions or concerns regarding this decision, please do not hesitate to contact us. Thank you for choosing our services. We look forward to providing you with excellent service in the future.&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;Your Request is for: [[Amount]] [[Currency]].&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;Best Regards, [[Company Name]]&lt;/p&gt;', '', '', '[\\\"Provider Name\\\",\\\"Amount\\\",\\\"Currency\\\",\\\"Company Name\\\"]'),
(57, 'payment_settlement', 'Payment Settlement', '', '&lt;p&gt;Dear [[provider_name]],&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;div&gt;I am writing to confirm that we have credited the agreed upon amount of [[currency]][[amount]] to your account, as per our agreement. This payment settles the outstanding balance for the services provided by your company.&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;\\r\\n&lt;div&gt;We understand the importance of timely payments for maintaining a healthy business relationship, and we strive to meet our payment obligations promptly. Please check your account and confirm that the payment has been received. If you have any questions or concerns, please do not hesitate to contact us.&lt;/div&gt;\\r\\n&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;[[company_contact_info]]&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;\\r\\n&lt;div&gt;Thank you for your prompt attention to this matter. We look forward to continuing our mutually beneficial partnership.&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;Best Regards ,&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;[[company_name]].&amp;nbsp;&lt;/div&gt;\\r\\n&lt;/div&gt;', '', '', '[\\\"provider_name\\\",\\\"currency\\\",\\\"amount\\\",\\\"company_contact_info\\\",\\\"company_name\\\"]'),
(58, 'service_disapproved', 'Rejection of Service Request', '', '&lt;p&gt;Dear [[Provider Name]],&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;We regret to inform you that your request for service approval has been disapproved. After thorough evaluation and consideration, our team has determined that your request does not meet the necessary criteria for approval.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;We understand that this decision may be disappointing for you, but please know that we carefully reviewed your request and made the best decision based on our policies and guidelines.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;If you have any questions or concerns regarding the decision, please do not hesitate to reach out to us. We would be happy to discuss any specific concerns that you may have.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Contact us:&lt;/p&gt;\\r\\n&lt;p&gt;[[Company Contact Info]]&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Best Regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[Company Name]]&lt;/p&gt;', '', '', '[\\\"Provider Name\\\",\\\"Company Contact Info\\\",\\\"Company Name\\\"]'),
(59, 'service_approved', 'Approval of Service Request', '', '&lt;p&gt;Dear [[Provider Name]],&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;I am pleased to inform you that your request for service approval has been approved. After careful review and consideration, our team has determined that your request meets all the necessary criteria and is eligible for approval.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Once again, congratulations on your approval status! We look forward to working with you and supporting your goals.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;If you have any questions or concerns, please do not hesitate to contact us.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Contact Us:&lt;/p&gt;\\r\\n&lt;p&gt;[[Company Contact Info]]&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Best Regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[Company Name]]&lt;/p&gt;', '', '', '[\\\"Provider Name\\\",\\\"Company Contact Info\\\",\\\"Company Name\\\"]'),
(60, 'user_account_active', 'Account activation confirmation', '', '&lt;p&gt;Dear [[user_name]],&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div&gt;We are pleased to inform you that your account has been successfully activated. You can now log in to your account and start using our services.&lt;/div&gt;\r\n&lt;div&gt;\r\n&lt;div&gt;If you have any questions or need any assistance feel free to contact us.&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n&lt;div&gt;Thank you again for choosing our services. We look forward to doing business with you again.&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;Best Regards ,&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;[[company_name]].&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '', '', '[\"user_name\",\"company_name\"]'),
(61, 'user_account_deactive', 'Account Deactivation Confirmation', '', '&lt;div&gt;Dear [[user_name]]&lt;/div&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;div&gt;We are sorry to inform you that your account has been deactivated.&lt;/div&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;div&gt;[[user_id]][[user_name]][[company_name]][[site_url]][[company_contact_info]][[company_logo]][[company_contact_info]][[company_logo]]&lt;/div&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;div&gt;\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;If you have any questions or need any assistance feel free to contact us.&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;Thank you again for choosing our services. We look forward to doing business with you again.&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;Best Regards&amp;nbsp;&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;[[company_name]]&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n&lt;/div&gt;', '', '', '[\\\"user_name\\\",\\\"user_id\\\",\\\"user_name\\\",\\\"company_name\\\",\\\"site_url\\\",\\\"company_contact_info\\\",\\\"company_logo\\\",\\\"company_contact_info\\\",\\\"company_logo\\\",\\\"company_name\\\"]'),
(62, 'booking_status_updated', 'Booking Status Updated', '', '&lt;p&gt;Subject: Booking Confirmation&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Dear [[user_name]],&lt;/p&gt;\n&lt;p&gt;Thank you for choosing [Service Name]. We are pleased to confirm your booking status has been changed.&lt;/p&gt;\n&lt;p&gt;Booking Details:&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Service Name: [[booking_service_names]]&lt;/li&gt;\n&lt;li&gt;Booking Date: [[booking_date]]&lt;/li&gt;\n&lt;li&gt;Time:[[booking_time]]&lt;/li&gt;\n&lt;li&gt;Address:[[booking_address]]&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;We look forward to serving you. If you have any questions or need to make changes to your booking, please don&#039;t hesitate to contact us at [Contact Information].&lt;/p&gt;\n&lt;p&gt;Best regards,&lt;/p&gt;\n&lt;p&gt;[[company_name]]&lt;/p&gt;\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\"user_name\",\"booking_service_names\",\"booking_date\",\"booking_time\",\"booking_address\",\"company_name\",\"company_contact_info\"]'),
(63, 'new_booking_confirmation_to_customer', 'Booking Confirmation', '', '&lt;p&gt;Dear [[user_name]],&lt;/p&gt;\n&lt;p&gt;Thank you for choosing [[provider_name]]. We are pleased to confirm your booking.&lt;/p&gt;\n&lt;p&gt;Booking Details:&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Booking Date:[[booking_date]]&lt;/li&gt;\n&lt;li&gt;Time:[[booking_time]]&lt;/li&gt;\n&lt;li&gt;Address:[[booking_address]]&lt;/li&gt;\n&lt;li&gt;Services include:[[booking_service_names]]&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;We look forward to serving you. If you have any questions or need to make changes to your booking, please don&#039;t hesitate to contact us at [Contact Information].&lt;/p&gt;\n&lt;p&gt;Best regards,&lt;/p&gt;\n&lt;p&gt;[[company_name]]&lt;/p&gt;\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\"user_name\",\"provider_name\",\"booking_date\",\"booking_time\",\"booking_address\",\"company_name\",\"company_contact_info\"]'),
(64, 'new_booking_received_for_provider', 'New Booking Received', '', '&lt;p&gt;Dear [[provider_name]] ,&lt;/p&gt;\n&lt;p&gt;We are delighted to inform you that a new booking has been received through our platform.&lt;/p&gt;\n&lt;p&gt;Booking Details:&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Service:[[booking_service_names]]&lt;/li&gt;\n&lt;li&gt;Booking Date: [[booking_date]]&lt;/li&gt;\n&lt;li&gt;Time: [[booking_time]]&lt;/li&gt;\n&lt;li&gt;Customer:[[user_name]]&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;Please ensure that you are prepared for the appointment and ready to provide exceptional service to our valued customer.&lt;/p&gt;\n&lt;p&gt;If you have any questions or require further information regarding this booking, feel free to reach out to us.&lt;/p&gt;\n&lt;p&gt;Thank you for being a part of our service and for your commitment to excellence.&lt;/p&gt;\n&lt;p&gt;Best regards,&lt;/p&gt;\n&lt;p&gt;[[company_name]]&lt;/p&gt;\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\"provider_name\",\"booking_service_names\",\"booking_date\",\"booking_time\",\"user_name\",\"company_name\",\"company_contact_info\"]'),
(65, 'provider_update_information', 'Provider Update Information', '', '&lt;p&gt;Dear [[company_name]]&lt;/p&gt;\\r\\n&lt;p&gt;I hope this message finds you well.&lt;/p&gt;\\r\\n&lt;p&gt;I wanted to inform you that [Provider Name] has recently updated their details. Please find the updated information below:&lt;/p&gt;\\r\\n&lt;p&gt;Provider ID: [[provider_id]]&lt;/p&gt;\\r\\n&lt;p&gt;[[provider_name]] has taken the initiative to ensure that their information is accurate and up-to-date in our records. If there are any further steps required from our end regarding this update, please let us know.&lt;/p&gt;\\r\\n&lt;p&gt;Thank you for your attention to this matter.&lt;/p&gt;\\r\\n&lt;p&gt;Best regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[company_name]]&lt;/p&gt;\\r\\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\\\"company_name\\\",\\\"provider_id\\\",\\\"provider_name\\\",\\\"company_name\\\",\\\"company_contact_info\\\"]'),
(66, 'new_provider_registerd', 'New Provider Registered', '', '&lt;p&gt;Subject: New Provider Registered&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Dear [[company_name]],&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;I hope this email finds you well.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;I&#039;m pleased to inform you that a new provider has registered with us. Here are the details of the new registration:&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Provider Name:[[provider_name]]&lt;/p&gt;\\r\\n&lt;p&gt;Provider ID:[[provider_id]]&lt;/p&gt;\\r\\n&lt;p&gt;We welcome [[provider_name]] to our platform and look forward to exploring potential collaborations with them. Kindly review the provided information and proceed with the necessary steps to onboard them into our system.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;If you require any further details or assistance regarding this registration, please don&#039;t hesitate to reach out to me.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Thank you for your attention to this matter.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Best regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[company_name]]&lt;/p&gt;\\r\\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\\\"company_name\\\",\\\"provider_name\\\",\\\"provider_id\\\",\\\"provider_name\\\",\\\"company_name\\\",\\\"company_contact_info\\\"]'),
(67, 'withdraw_request_received', 'Withdrawal Request Received', '', '&lt;p&gt;Subject: Withdrawal Request Received&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Dear [[company_name]],&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;I hope this email finds you well.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;I wanted to bring to your attention that we have received a withdrawal request from one of our providers. Here are the details of the request:&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Provider Name: [[provider_name]]&lt;/p&gt;\\r\\n&lt;p&gt;Provider ID:[[provider_id]]&lt;/p&gt;\\r\\n&lt;p&gt;Amount:[[amount]]&lt;/p&gt;\\r\\n&lt;p&gt;Currency:[[currency]]&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Please review this withdrawal request at your earliest convenience and proceed with the necessary steps to process it accordingly. If you need any additional information or assistance, please don&#039;t hesitate to reach out to me.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Thank you for your attention to this matter.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;', '', '', '[\\\"company_name\\\",\\\"provider_name\\\",\\\"provider_id\\\",\\\"amount\\\",\\\"currency\\\"]'),
(68, 'new_rating_given_by_customer', ' New Rating Received from a Customer', 'null', '<p><strong>Subject:</strong> New Rating Received from a Customer !</p>\r\n<p><strong>Dear [[provider_name]],</strong></p>\r\n<p>We wanted to let you know that a customer has recently submitted a rating for your service.</p>\r\n<p>To view the details and feedback, please log in to your provider dashboard at your convenience.</p>\r\n<p>Thank you for your continued commitment to providing excellent service!</p>\r\n<p>Best regards,<br />[[company_name]]</p>\r\n<p>[[company_contact_info]]</p>', '', '', '[\"provider_name\",\"company_name\",\"company_contact_info\"]'),
(69, 'rating_request_to_customer', 'We Value Your Feedback – Please Share Your Rating!', 'null', ' <p><strong>Subject:</strong> We Value Your Feedback – Please Share Your Rating!!</p>\r\n<p><strong>Dear [[user_name]],</strong></p>\r\n<p>We hope you enjoyed your recent experience with us!</p>\r\n<p>Your feedback is incredibly important and helps us to continue improving our services. We would greatly appreciate it if you could take a moment to rate your experience by clicking the link below:</p>\r\n<p> </p>\r\n<p>Thank you for your time and for choosing [[provider_name]]. If you have any additional comments or suggestions, please feel free to reply to this email.</p>\r\n<p>Best regards,<br />[[company_name]]<br /><br /></p>', '', '', '[\"user_name\",\"provider_name\",\"company_name\"]');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(60) NOT NULL,
  `customer_id` int(250) DEFAULT NULL,
  `title` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0: Open 1:Close',
  `userType` int(11) NOT NULL COMMENT '0 : Admin\r\n1: Provider\r\n2: customer\r\n',
  `date` date NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `provider_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` mediumtext DEFAULT NULL,
  `answer` mediumtext DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `faqs` (`id`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(9, 'What is eDemand?', 'eDemand is a multi-vendor on-demand home and doorstep services marketplace platform that comes with a Flutter app and an admin panel.', '1', '2023-03-10 06:50:46', '2023-03-10 06:50:46'),
(10, 'What are the features of eDemand?', 'Some of the features of eDemand include multi-vendor support, multiple categories for services, real-time order tracking, in-app messaging, and payment integration.', '1', '2023-03-10 06:52:06', '2023-03-10 06:52:06'),
(11, 'What is the technology used to build eDemand?', 'eDemand is built using the Flutter framework, which is an open-source mobile application development framework created by Google.', '1', '2023-03-10 06:53:06', '2023-03-10 06:53:06'),
(13, 'Is eDemand easy to use for customers and service providers?', 'Yes, eDemand is designed to be user-friendly for both customers and service providers. The app and admin panel provide clear and intuitive interfaces for managing orders and services.', '1', '2023-03-10 06:54:00', '2023-03-10 06:54:00'),
(14, 'What types of services can be offered on eDemand?', 'eDemand supports a wide range of services, including home cleaning, beauty and wellness, appliance repair, handyman services, and much more.', '1', '2023-03-10 06:54:22', '2023-03-10 06:54:22'),
(15, 'How does eDemand handle payments?', 'eDemand integrates with popular payment gateways such as PayPal and Stripe to handle payments securely and efficiently.', '1', '2023-03-10 06:54:39', '2023-03-10 06:54:39'),
(16, 'Is eDemand scalable for larger marketplaces?', 'Yes, eDemand is built to be scalable and can handle larger marketplaces with multiple vendors and services.', '1', '2023-03-10 06:54:53', '2023-03-10 06:54:53'),
(17, 'What types of services can I book on eDemand?', 'eDemand supports a wide range of services, including home cleaning, beauty and wellness, appliance repair, handyman services, and much more.', '1', '2023-03-10 06:56:35', '2023-03-10 06:56:35'),
(18, 'Can I cancel or reschedule an order on eDemand?', 'Yes, you can cancel or reschedule an order on eDemand as long as you do it within the cancellation/rescheduling policy provided by the service provider.', '1', '2023-03-10 06:57:01', '2023-03-10 06:57:01'),
(19, 'How do I rate and provide feedback on a service provider on eDemand?', 'After your service is completed, you can rate and provide feedback on the service provider through the app. Your feedback can help improve the quality of services provided on the platform.', '1', '2023-03-10 06:57:24', '2023-03-10 06:57:24'),
(20, 'Can I request a specific service provider on eDemand?', 'Yes, you can request a specific service provider on eDemand, but the availability of the service provider will depend on their schedule.', '1', '2023-03-10 06:57:59', '2023-03-10 06:57:59'),
(21, 'Can I book services in advance on eDemand?', 'Yes, you can book services in advance on eDemand by selecting the date and time that works best for you.', '1', '2023-03-10 06:58:22', '2023-03-10 06:58:22'),
(22, 'Can I get a refund for a service on eDemand?', 'Refunds are subject to the cancellation policy of the service provider. You can contact the service provider or customer support to initiate a refund.', '1', '2023-03-10 06:58:40', '2023-03-10 06:58:40');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL COMMENT 'partners | services',
  `type_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'Customers'),
(3, 'partners', 'Service Providing Partners'),
(4, 'superadmin', 'Super Admin');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `is_rtl` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_default` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `code`, `is_rtl`, `created_at`, `is_default`) VALUES
(1, 'English', 'en', 0, '2021-12-25 10:37:11', '1');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2021-12-02-124048', 'App\\Database\\Migrations\\AddProducts', 'default', 'App', 1646388947, 1),
(2, '2021-12-03-040835', 'App\\Database\\Migrations\\Test', 'default', 'App', 1646388947, 1),
(3, '2022-03-25-114504', 'App\\Database\\Migrations\\bank_transfers', 'default', 'App', 1669955348, 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `type_id` varchar(512) NOT NULL DEFAULT '0',
  `image` varchar(128) DEFAULT NULL,
  `order_id` int(50) DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `is_readed` tinyint(1) NOT NULL,
  `notification_type` varchar(50) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `target` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `order_status` text DEFAULT NULL,
  `custom_job_request_id` text DEFAULT NULL,
  `bidder_id` text DEFAULT NULL,
  `bid_status` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `type_id` int(11) NOT NULL,
  `image` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - Deactive | 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL DEFAULT 0,
  `city` varchar(252) NOT NULL,
  `total` double NOT NULL,
  `visiting_charges` double NOT NULL DEFAULT 0,
  `promo_code` varchar(64) NOT NULL,
  `promo_discount` double NOT NULL,
  `final_total` double NOT NULL,
  `payment_method` varchar(64) NOT NULL,
  `admin_earnings` double NOT NULL,
  `partner_earnings` double NOT NULL,
  `is_commission_settled` tinyint(1) NOT NULL COMMENT '0: Not settled\r\n1: Settled\r\n',
  `address_id` int(11) NOT NULL,
  `address` varchar(2048) NOT NULL,
  `date_of_service` date NOT NULL,
  `starting_time` time NOT NULL,
  `ending_time` time NOT NULL,
  `duration` varchar(64) NOT NULL COMMENT 'in minutes',
  `status` varchar(64) NOT NULL COMMENT '0. awaiting\r\n1. confirmed\r\n2. rescheduled\r\n3. cancelled\r\n4. completed',
  `remarks` varchar(2048) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `payment_status` int(11) NOT NULL,
  `otp` int(11) DEFAULT NULL,
  `work_started_proof` text DEFAULT NULL,
  `work_completed_proof` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order_latitude` text DEFAULT NULL,
  `order_longitude` text DEFAULT NULL,
  `promocode_id` int(11) DEFAULT NULL,
  `isRefunded` varchar(255) DEFAULT '0',
  `additional_charges` text DEFAULT NULL,
  `payment_status_of_additional_charge` text DEFAULT NULL,
  `total_additional_charge` text DEFAULT NULL,
  `custom_job_request_id` text DEFAULT NULL,
  `payment_method_of_additional_charge` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_services`
--

CREATE TABLE `order_services` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_title` text NOT NULL,
  `tax_percentage` double NOT NULL,
  `tax_amount` double NOT NULL,
  `price` double NOT NULL,
  `discount_price` double NOT NULL,
  `quantity` double NOT NULL,
  `sub_total` double NOT NULL COMMENT 'price X quantity',
  `status` varchar(64) NOT NULL COMMENT '0. awaiting \r\n1. confirmed \r\n2. rescheduled \r\n3. cancelled \r\n4. completed	',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `custom_job_request_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partner_bids`
--

CREATE TABLE `partner_bids` (
  `id` int(11) NOT NULL,
  `partner_id` text NOT NULL,
  `counter_price` text NOT NULL,
  `note` text NOT NULL,
  `duration` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `custom_job_request_id` text NOT NULL,
  `status` text NOT NULL,
  `tax_id` text DEFAULT NULL,
  `tax_amount` text DEFAULT NULL,
  `tax_percentage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partner_details`
--

CREATE TABLE `partner_details` (
  `id` int(11) UNSIGNED NOT NULL,
  `partner_id` int(11) NOT NULL COMMENT 'user_id',
  `company_name` varchar(1024) DEFAULT NULL,
  `about` varchar(4096) NOT NULL,
  `national_id` varchar(1024) DEFAULT NULL,
  `address` varchar(1024) DEFAULT NULL,
  `banner` longtext NOT NULL,
  `address_id` varchar(1024) DEFAULT NULL,
  `passport` varchar(1024) DEFAULT NULL,
  `tax_name` varchar(100) DEFAULT NULL,
  `tax_number` varchar(64) DEFAULT NULL,
  `bank_name` varchar(256) DEFAULT NULL,
  `account_number` varchar(128) NOT NULL,
  `account_name` varchar(512) DEFAULT NULL,
  `bank_code` varchar(256) DEFAULT NULL,
  `swift_code` varchar(256) DEFAULT NULL,
  `advance_booking_days` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - individual | 1 - organization ',
  `number_of_members` int(11) NOT NULL,
  `admin_commission` text NOT NULL COMMENT '[ {"category_id" : "commission"},{...} ]',
  `visiting_charges` int(20) NOT NULL,
  `is_approved` tinyint(1) NOT NULL COMMENT '0. Not approved\r\n1. Approved\r\n7. Trashed',
  `service_range` double DEFAULT NULL,
  `ratings` double NOT NULL DEFAULT 0,
  `number_of_ratings` double NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `other_images` text NOT NULL,
  `long_description` longtext NOT NULL,
  `at_store` int(11) DEFAULT NULL,
  `at_doorstep` int(11) DEFAULT NULL,
  `need_approval_for_the_service` text DEFAULT NULL,
  `chat` varchar(255) NOT NULL DEFAULT '0',
  `pre_chat` varchar(255) NOT NULL DEFAULT '1',
  `custom_job_categories` text DEFAULT NULL,
  `is_accepting_custom_jobs` varchar(255) NOT NULL DEFAULT '1',
  `slug` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partner_details`
--

INSERT INTO `partner_details` (`id`, `partner_id`, `company_name`, `about`, `national_id`, `address`, `banner`, `address_id`, `passport`, `tax_name`, `tax_number`, `bank_name`, `account_number`, `account_name`, `bank_code`, `swift_code`, `advance_booking_days`, `type`, `number_of_members`, `admin_commission`, `visiting_charges`, `is_approved`, `service_range`, `ratings`, `number_of_ratings`, `created_at`, `updated_at`, `other_images`, `long_description`, `at_store`, `at_doorstep`, `need_approval_for_the_service`, `chat`, `pre_chat`, `custom_job_categories`, `is_accepting_custom_jobs`, `slug`) VALUES
(5, 50, 'Electric ', 'Faulty switches? Shocks and sparks? Circuit overload? Whatever the problem, find the best electrician in Dubai, United Arab Emirates to fix it on the Urban Company app. We understand our customers’ concern about quality and security. Our team ensures that all our electricians are verified, well-experienced, and skilled to handle any electrical job.  Find our professional electrician services in Dubai, United Arab Emirates at affordable cost and thank us later for making your life this easier. You don’t need to worry about bookings because we have made this procedure short and simple. We are just one click away, so you can book for expert electricians in Dubai, United Arab Emirates in one go and have them at your doorstep on the same day.', 'public/backend/assets/national_id/1742965073_53632c1b6d9890b3baa8.jpg', '6MR8+QQV,Ghanshyam Nagar,Bhuj,India,370001', 'public/backend/assets/banner/1749622416_d7c711a58e9def929b3f.jpg', 'public/backend/assets/address_id/272779-aadhar-card.avif', 'public/backend/assets/passport/1742965074_548393688f402ecc86fa.jpg', 'HDFC12456', 'G85940T', 'HDFC', '343434', '2147483647', 'HDFC12456', 'zxc', 60, 1, 50, '20', 60, 1, 25, 4.5396825396825, 63, '2022-06-16 05:00:14', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1715745925_1f8a8192e8da04fb6e03.avif\",\"public\\/uploads\\/partner\\/1715745925_ce928a1e05cd061dba3f.avif\",\"public\\/uploads\\/partner\\/1715745925_916962931f9b23fe9a15.jpg\",\"public\\/uploads\\/partner\\/1715745925_338ff2b1d8bc38e1d98a.avif\",\"public\\/uploads\\/partner\\/1715745925_450e34a1f0b2d5cefb9b.jpg\",\"public\\/uploads\\/partner\\/1715745925_4f6721975f3ec89cc7da.jpg\"]', '<p>&nbsp;</p>\r\n<h1 style=\"color: #333; font-size: 32px;\">Your Trusted Electronic Service Provider</h1>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">We Fix, You Relax!</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At our electronic service provider, we take care of all your electronic repair needs with expertise and dedication. Our team of skilled technicians is committed to providing reliable and efficient solutions, so you can sit back, relax, and enjoy your devices without any worries.</p>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Smartphone Repair: From screen replacements to battery replacements, we fix all types of smartphone issues.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Laptop and Computer Repair: Our expert technicians handle laptop and computer repairs, ensuring optimal performance.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> TV and Home Theater Repair: We specialize in repairing TVs, home theaters, and audio systems to enhance your entertainment experience.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Gaming Console Repair: Get back in the game with our reliable gaming console repair services.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Electronic Device Upgrades: We offer upgrade services to help you keep up with the latest technology trends.</li>\r\n</ul>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Expert Technicians: Our highly skilled technicians possess the knowledge and expertise to handle all types of electronic repairs.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quick Turnaround Time: We strive to provide efficient and prompt service, ensuring minimal downtime for your devices.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quality Parts: We use only high-quality parts and components for repairs, ensuring long-lasting results.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Transparent Pricing: Our pricing is fair and transparent, with no hidden costs or surprises.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Excellent Customer Service: We are committed to providing exceptional customer service, ensuring your satisfaction throughout the repair process.</li>\r\n</ul>\r\n</div>', 1, 1, '0', '1', '1', '[\"277\",\"276\",\"275\",\"274\",\"273\",\"272\",\"270\",\"269\",\"268\",\"267\",\"265\",\"259\",\"258\",\"257\",\"256\",\"255\",\"254\",\"253\",\"252\",\"251\",\"250\",\"249\",\"248\",\"247\",\"246\",\"245\",\"244\",\"243\",\"242\",\"241\",\"240\",\"239\",\"238\",\"237\",\"236\",\"235\",\"234\",\"232\",\"230\",\"229\",\"228\",\"227\",\"226\",\"225\",\"224\",\"223\",\"222\",\"221\",\"220\",\"218\",\"217\",\"216\",\"215\",\"213\",\"282\"]', '1', 'electric-1-1-1-1'),
(6, 138, 'alite', '', '1656325147.', NULL, '', NULL, NULL, 'fgfdg', 'fgfd', 'fgfg', '0', NULL, 'fgfg', 'fgfg', 60, 1, 2, '10', 0, 0, NULL, 0, 0, '2022-06-27 10:19:07', '2022-06-27 15:49:07', '', '', 1, 1, '0', '1', '1', NULL, '1', 'alite'),
(7, 139, 'net', '', '1656325579.jpg', NULL, '', NULL, NULL, 'fgfdg', 'fgfd', 'fgfg', '0', NULL, 'fgfg', 'fgfg', 60, 1, 5, '10', 0, 0, NULL, 0, 0, '2022-06-27 10:26:19', '2022-06-27 15:56:19', '', '', 1, 1, '0', '1', '1', NULL, '1', 'net'),
(8, 140, NULL, '', '1656327732.jpg', NULL, '', NULL, NULL, 'fgfdg', 'fgfd', 'fgfg', '0', NULL, 'fgfg', 'fgfg', 60, 1, 5, '10', 0, 0, NULL, 0, 0, '2022-06-27 11:02:12', '2022-06-27 16:32:12', '', '', 1, 1, '0', '1', '1', NULL, '1', NULL),
(9, 141, NULL, '', '1656328834.jpg', NULL, '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 5, '10', 0, 0, NULL, 0, 0, '2022-06-27 11:20:34', '2022-06-27 16:50:34', '', '', 1, 1, '0', '1', '1', NULL, '1', NULL),
(10, 142, 'Alite services', '', '1656329008.jpg', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 5, '10', 0, 0, NULL, 0, 0, '2022-06-27 11:23:28', '2022-06-27 16:53:28', '', '', 1, 1, '0', '1', '1', NULL, '1', 'alite-services'),
(11, 143, 'p k beauty parlour', '', '1656329407.jpg', '234,jaynagar', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 2, '10', 0, 0, NULL, 0, 0, '2022-06-27 11:30:07', '2022-06-27 17:00:07', '', '', 1, 1, '0', '1', '1', NULL, '1', 'p-k-beauty-parlour'),
(12, 144, 'Alite services', '', 'dairimillk.png.png', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 10, '10', 0, 0, NULL, 0, 0, '2022-06-27 12:24:43', '2022-06-27 17:54:43', '', '', 1, 1, '0', '1', '1', NULL, '1', 'alite-services'),
(13, 146, 'lghgkhjk', '', 'anti_hair_fall_spa_kit_2.jpg.jpg', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 52, '10', 0, 0, NULL, 0, 0, '2022-06-27 12:27:16', '2022-06-27 17:57:16', '', '', 1, 1, '0', '1', '1', NULL, '1', 'lghgkhjk'),
(15, 149, 'lghgkhjk', '', 'anti_hair_fall_spa_kit_2.jpg.jpg', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 52, '10', 100, 0, NULL, 0, 0, '2022-06-27 12:33:17', '2022-06-27 18:03:17', '', '', 1, 1, '0', '1', '1', NULL, '1', 'lghgkhjk'),
(16, 150, 'nesh services', '', 'download (3).jpg.jpg', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 0, 5, '10', 100, 0, NULL, 0, 0, '2022-06-27 13:03:27', '2022-06-27 18:33:27', '', '', 1, 1, '0', '1', '1', NULL, '1', 'nesh-services'),
(17, 151, 'Alite services', '', 'anti_hair_fall_spa_kit_2.jpg.jpg', '234,jaynagar', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 5, '10', 100, 0, NULL, 0, 0, '2022-06-28 10:10:13', '2022-06-28 15:40:13', '', '', 1, 1, '0', '1', '1', NULL, '1', 'alite-services'),
(18, 152, 'Alite services', '', 'anti_hair_fall_spa_kit_1.jpg.jpg', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 0, 0, '10', 100, 0, NULL, 0, 0, '2022-06-28 10:12:49', '2022-06-28 15:42:49', '', '', 1, 1, '0', '1', '1', NULL, '1', 'alite-services'),
(19, 153, 'pp k beauty parlour', '', 'download (2).jpg.jpg', '234,jaynagar', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 5, '10', 100, 0, NULL, 0, 0, '2022-06-29 05:31:55', '2022-06-29 11:01:55', '', '', 1, 1, '0', '1', '1', NULL, '1', 'pp-k-beauty-parlour'),
(20, 154, 'l k beauty parlour', '', 'anti_hair_fall_spa_kit_1.jpg.jpg', '234,jaynagar', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 5, '10', 215, 0, NULL, 0, 0, '2022-06-29 06:05:54', '2022-06-29 11:35:54', '', '', 1, 1, '0', '1', '1', NULL, '1', 'l-k-beauty-parlour'),
(24, 160, 'apple hair cut vale', '', '5.jpg.jpg', NULL, '', NULL, NULL, 'dfe', 'sds', 'sdwr', '0', NULL, 'asd', 'sas f', 60, 0, 0, '10', 100, 0, NULL, 0, 0, '2022-07-12 11:12:52', '2022-07-12 16:42:52', '', '', 1, 1, '0', '1', '1', NULL, '1', 'apple-hair-cut-vale'),
(26, 166, 'Infinite Technologies', '', '6.jpg.jpg', NULL, '', NULL, NULL, '123', '456', '789', '789', NULL, '456', '147', 60, 1, 15, '10', 1000, 0, NULL, 0, 0, '2022-07-19 07:18:55', '2022-07-19 12:48:55', '', '', 1, 1, '0', '1', '1', NULL, '1', 'infinite-technologies'),
(30, 187, 'test', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 60, 0, 0, '10', 0, 0, NULL, 0, 0, '2022-11-01 12:46:54', '0000-00-00 00:00:00', '', '', 1, 1, '0', '1', '1', NULL, '1', 'test'),
(32, 194, 'test partner', '', 'sandwich.png.png', NULL, '', NULL, NULL, 'gst', 'gst12345', 'axis', '2147483647', NULL, '1525', '56156', 60, 0, 0, '10', 100, 0, NULL, 0, 0, '2022-11-04 11:11:23', '0000-00-00 00:00:00', '', '', 1, 1, '0', '1', '1', NULL, '1', 'test-partner'),
(42, 204, 'Electric', 'Whatever the problem, find the best electrician in World, We understand our customers’ concern about quality and security. Our team ensures that all our electricians are verified, well-experienced, and skilled to handle any electrical job.\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\nFind our professional electrician services in eDemand App, You don’t need to worry about bookings because we have made this procedure short and simple. We are just one click away, so you can book for expert electricians in India, eDemand in one go and have them at your doorstep on the same day', 'download.jpg.jpg', 'Electric Point', 'public/backend/assets/banner/1668492390_65a23c3d746c54bddf35_1.jpg', NULL, NULL, '370001', '12ABCDE3456FGZH', 'BOB', '2147483647', 'test', '370001', '00', 60, 0, 0, '10', 10, 0, NULL, 0, 0, '2022-11-04 12:35:08', '0000-00-00 00:00:00', '', '<p>&nbsp;</p>\r\n<h1 style=\"color: #333; font-size: 32px;\">Your Trusted Electronic Service Provider</h1>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">We Fix, You Relax!</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At our electronic service provider, we take care of all your electronic repair needs with expertise and dedication. Our team of skilled technicians is committed to providing reliable and efficient solutions, so you can sit back, relax, and enjoy your devices without any worries.</p>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Smartphone Repair: From screen replacements to battery replacements, we fix all types of smartphone issues.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Laptop and Computer Repair: Our expert technicians handle laptop and computer repairs, ensuring optimal performance.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> TV and Home Theater Repair: We specialize in repairing TVs, home theaters, and audio systems to enhance your entertainment experience.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Gaming Console Repair: Get back in the game with our reliable gaming console repair services.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Electronic Device Upgrades: We offer upgrade services to help you keep up with the latest technology trends.</li>\r\n</ul>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Expert Technicians: Our highly skilled technicians possess the knowledge and expertise to handle all types of electronic repairs.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quick Turnaround Time: We strive to provide efficient and prompt service, ensuring minimal downtime for your devices.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quality Parts: We use only high-quality parts and components for repairs, ensuring long-lasting results.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Transparent Pricing: Our pricing is fair and transparent, with no hidden costs or surprises.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Excellent Customer Service: We are committed to providing exceptional customer service, ensuring your satisfaction throughout the repair process.</li>\r\n</ul>\r\n</div>', 1, 1, '0', '1', '1', NULL, '1', 'electric'),
(98, 260, 'StormBrand    ', 'Whatever the problem, find the best electrician in World. We understand our customers’ concern about quality and security. Our team ensures that all our electricians are verified, well-experienced, and skilled to handle any electrical job.Find our professional electrician services in the eDemand App, You don’t need to worry about bookings because we have made this procedure short and simple. We are just one click away, so you can book for expert electricians in India, eDemand in one go and have them at your doorstep on the same day,', 'public/backend/assets/national_id/2 WRT-Logo-new 1024 x 1024.jpg', 'Saket District Centre, Sector 6, Pushp Vihar, New Delhi', 'public/backend/assets/banner/1743499323_6b6c62ad1c4f63dd2213.png', 'public/backend/assets/address_id/2 WRT-Logo-new 1024 x 1024.jpg', 'public/backend/assets/passport/2 WRT-Logo-new 1024 x 1024.jpg', '4526', '15236658768', 'bob', '2147483647', 'test', '4526', '4563', 60, 1, 10, '5', 200, 1, NULL, 4.5555555555556, 9, '2022-11-07 07:29:11', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743506195_b348e64df6379f312472.jpg\",\"public\\/uploads\\/partner\\/1743506195_7c8fc85704f8c26356e1.jpg\",\"public\\/uploads\\/partner\\/1743506195_c6ec8ef3765f04f9b4a1.jpg\",\"public\\/uploads\\/partner\\/1743506195_44b8fa6d5b4cea0cb648.jpg\"]', '<p>&nbsp;</p>\r\n<h1 style=\"color: #333; font-size: 32px;\">Your Trusted Electronic Service Provider</h1>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">We Fix, You Relax!</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At our electronic service provider, we take care of all your electronic repair needs with expertise and dedication. Our team of skilled technicians is committed to providing reliable and efficient solutions, so you can sit back, relax, and enjoy your devices without any worries.</p>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Smartphone Repair: From screen replacements to battery replacements, we fix all types of smartphone issues.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Laptop and Computer Repair: Our expert technicians handle laptop and computer repairs, ensuring optimal performance.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> TV and Home Theater Repair: We specialize in repairing TVs, home theaters, and audio systems to enhance your entertainment experience.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Gaming Console Repair: Get back in the game with our reliable gaming console repair services.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Electronic Device Upgrades: We offer upgrade services to help you keep up with the latest technology trends.</li>\r\n</ul>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Expert Technicians: Our highly skilled technicians possess the knowledge and expertise to handle all types of electronic repairs.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quick Turnaround Time: We strive to provide efficient and prompt service, ensuring minimal downtime for your devices.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quality Parts: We use only high-quality parts and components for repairs, ensuring long-lasting results.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Transparent Pricing: Our pricing is fair and transparent, with no hidden costs or surprises.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Excellent Customer Service: We are committed to providing exceptional customer service, ensuring your satisfaction throughout the repair process.</li>\r\n</ul>\r\n</div>', 1, 1, '0', '1', '1', '[252,253,270]', '1', 'stormbrand-1-1'),
(100, 263, 'PlumbService Pvt Ltd      ', 'Welcome to our Expert Plumbing Services! With a dedicated team of skilled plumbers, we provide reliable solutions for all your plumbing needs, ensuring peace of mind and optimal functionality.', 'public/backend/assets/national_id/credit-card.png.png', 'Time Square Empire', 'public/backend/assets/banner/1743420603_7ebdd08d0d7abafb0578.png', '', 'public/backend/assets/passport/1743420416_4ce5ef08ab1221f94be8.png', '452652', '15236658722', 'bob', '2147483647', 'test', '452652', '526389', 60, 0, 0, '20', 50, 1, NULL, 5, 5, '2022-11-07 10:31:39', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743502838_3d6f75b28fe23ff8a9b6.jpg\",\"public\\/uploads\\/partner\\/1743502838_2f8f755a814db06d20b2.jpg\",\"public\\/uploads\\/partner\\/1743502838_1010bc96d2daaf6ff6c8.jpg\",\"public\\/uploads\\/partner\\/1743502838_14a0029df1ea549d22a3.jpg\"]', '<p>test</p>', 1, 1, '0', '1', '1', '[240]', '1', 'plumbservice-pvt-ltd-1-1-1-1-1-1'),
(107, 270, 'Piston Car Service             ', 'We provide a 12 month/10,000 KM warranty with every car service. Whether you choose to buy genuine or aftermarket parts from us, both come with a hassle-free warranty policy. The labor is also covered under the warranty.', 'public/backend/assets/national_id/1743424630_ed3f200b27e42706c1af.png', 'Katira Complex, 8/a, Sanskar Nagar, Bhuj, Gujarat 370001', 'public/backend/assets/banner/1743425008_e0ddaefc6ddef8077f53.png', 'public/backend/assets/address_id/1743424630_9f82a3bd6ecef2028b47.png', 'public/backend/assets/passport/1743424630_b2f0e16eebb207059909.png', '7356771', 'Z645-5081-7851', 'Bank', '2147483647', 'amarik', '7356771', '100007', 60, 0, 0, '10', 20, 1, NULL, 5, 6, '2022-11-08 04:17:16', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743502488_87b7b5e70e7e0bd8f70d.jpg\",\"public\\/uploads\\/partner\\/1743502488_36e1b41ee6a1df783e39.jpg\",\"public\\/uploads\\/partner\\/1743502488_de823f083d06178632f5.jpg\",\"public\\/uploads\\/partner\\/1743502488_af735562ae82fbc8235a.jpg\"]', '', 1, 1, '0', '1', '1', '[228,230,232,259]', '1', 'piston-car-service-1-1-1-1-1-1-1-1-1'),
(108, 271, 'World Clean Pvt Ltd', '', 'passport.jpg.jpg', NULL, 'public/uploads/users/partners/banner_images/004 World Clean Pvt Ltd-min.jpg', NULL, NULL, 'GST', 'Y114-7129-6149', 'Bank of India.', '2147483647', NULL, '9256086', '100008', 60, 1, 20, '10', 20, 0, NULL, 0, 0, '2022-11-08 05:23:59', '0000-00-00 00:00:00', '', '', 1, 1, '0', '1', '1', NULL, '1', 'world-clean-pvt-ltd'),
(110, 273, 'QUB Saloon      ', 'Welcome to our Barber Shop! We provide high-quality grooming services delivered by skilled barbers for all your hair and grooming needs.', 'public/backend/assets/national_id/public/backend/assets/national_id/1742898685_b0becaf12d7b4e32a90f.jpg', 'Time Square Empire', 'public/backend/assets/banner/1742898702_c52c5dec78805de28e8c.jpg', 'public/backend/assets/address_id/public/backend/assets/address_id/1742898685_7d450d37b4c64e213013.jpg', 'public/backend/assets/passport/public/backend/assets/passport/1742898685_057ed2763dcced19d2c3.jpg', '257366290', 'Z096-3784-4340', 'Bank', '2147483647', 'test', '257366290', '100009', 60, 0, 0, '10', 30, 1, NULL, 5, 14, '2022-11-08 06:36:44', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1688729464_4a6a5c5b831f64629697.jpg\",\"public\\/uploads\\/partner\\/1688729464_c6d6bacd9b90f646e008.jpg\",\"public\\/uploads\\/partner\\/1688729464_cf3b01c63d7c63065093.jpg\",\"public\\/uploads\\/partner\\/1688729464_fb0a7440fc83b46df859.jpg\"]', '<h1>Welcome to our Barber Shop</h1>\r\n<h2>About Us</h2>\r\n<p>At our barber shop, we are dedicated to providing high-quality grooming services to our valued customers. With years of experience in the industry, our skilled barbers are committed to delivering exceptional haircuts, styling, and grooming treatments.</p>\r\n<h2>Services Offered</h2>\r\n<ul>\r\n<li>Haircuts: Our expert barbers are trained in various haircut styles, catering to your preferences and ensuring a tailored look that suits your individuality.</li>\r\n<li>Beard Trimming: We offer precise beard trims, shaping, and grooming, helping you maintain a well-groomed and stylish beard.</li>\r\n<li>Shaving: Experience a traditional straight razor shave for a smooth and refreshing finish, accompanied by soothing hot towels and high-quality grooming products.</li>\r\n<li>Hairstyling: From classic to modern styles, our barbers are skilled in creating versatile and trendy looks, ensuring you leave our shop feeling confident.</li>\r\n<li>Facial Treatments: Pamper yourself with our rejuvenating facial treatments designed to cleanse, nourish, and revitalize your skin.</li>\r\n</ul>\r\n<h2>Why Choose Us</h2>\r\n<p>When you choose our barber shop, you can expect:</p>\r\n<ul>\r\n<li>Experienced and Skilled Barbers: Our team of barbers is experienced, highly trained, and passionate about delivering the best grooming services.</li>\r\n<li>Attention to Detail: We pay meticulous attention to detail, ensuring precision and accuracy in every service we provide.</li>\r\n<li>Relaxing Atmosphere: Enjoy a welcoming and comfortable environment where you can sit back, relax, and unwind during your grooming session.</li>\r\n<li>Quality Products: We use only the finest grooming products, ensuring that you receive exceptional results and care for your hair and skin.</li>\r\n<li>Excellent Customer Service: Our friendly and professional staff is dedicated to providing excellent customer service, making your experience with us memorable.</li>\r\n</ul>\r\n<p>&nbsp;</p>', 1, 1, '0', '1', '1', '[265,267,268]', '1', 'qub-saloon'),
(117, 283, 'Woodwork Carpentry                ', '', 'public/backend/assets/national_id/1742972777_2e385f89c9900370d902.jpg', 'Time Square Empire', 'public/backend/assets/banner/1743409652_ec5845981471ad621e7e.png', 'public/backend/assets/address_id/1742972777_51e66dbb2febb5feeea9.jpg', 'public/backend/assets/passport/1742972777_dd23408ff9db2e23f29a.jpg', '9484163', 'F104-5916-2416', 'Canara', '2147483647', 'Woodwork', '9484163', '100010', 60, 1, 10, '10', 20, 1, NULL, 5, 6, '2022-11-08 11:01:16', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743503407_e6d016cfaed5816d33ed.jpg\",\"public\\/uploads\\/partner\\/1743503407_a2b3ad9e2490a64695a8.jpg\",\"public\\/uploads\\/partner\\/1743503407_704093e5183ef9a940dd.jpg\",\"public\\/uploads\\/partner\\/1743503407_52a520fceba58bce3a11.jpg\",\"public\\/uploads\\/partner\\/1743503407_8e971397b459e750877f.jpg\"]', '', 1, 1, '0', '1', '1', '[270]', '1', 'woodwork-carpentry-1-1-1-1-1-1-1-1-1'),
(118, 293, 'World Clean Pvt. Ltd.       ', 'Welcome to our Cleaning Service! We offer top-notch cleaning solutions delivered by our professional team, ensuring a spotless and sanitized environment for your utmost satisfaction.', 'public/backend/assets/national_id/public/backend/assets/national_id/public/backend/assets/national_id/04 World Clean Pvt Ltd.jpg.jpg', 'Dubai Hills Estate, Dubai, United Arab Emirates', 'public/backend/assets/banner/1739449302_89a5494ad04597f57943.png', 'public/backend/assets/address_id/public/backend/assets/address_id/public/backend/assets/address_id/', 'public/backend/assets/passport/public/backend/assets/passport/public/backend/assets/passport/', '9256086', 'Y114-7129-6149', 'Bank', '2147483647', 'World', '9256086', '100008', 60, 0, 0, '10', 25, 1, NULL, 5, 8, '2022-11-09 05:11:30', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1707736648_7f09a5114b807357bc92.jpg\",\"public\\/uploads\\/partner\\/1707736648_e22320db4bc60631e32b.jpg\",\"public\\/uploads\\/partner\\/1707736648_501a361309c8b7a085f9.jpg\",\"public\\/uploads\\/partner\\/1707736648_1837b87c384dc7858a02.jpg\"]', '<header>\r\n<h1>Welcome to our Cleaning Service</h1>\r\n</header><main>\r\n<section>\r\n<h2>About Us</h2>\r\n<p>At our cleaning service, we are dedicated to providing exceptional cleaning solutions to our valued customers. With a team of highly trained professionals, we ensure thorough cleanliness and a fresh environment in every space we clean.</p>\r\n</section>\r\n<section>\r\n<h2>Our Services</h2>\r\n<ul>\r\n<li>Residential Cleaning: From apartments to houses, we offer comprehensive cleaning services to make your home sparkle and shine.</li>\r\n<li>Commercial Cleaning: We specialize in cleaning offices, retail spaces, and commercial establishments, ensuring a clean and hygienic workspace for your employees and customers.</li>\r\n<li>Deep Cleaning: Our deep cleaning services tackle those hard-to-reach areas, eliminating dirt, grime, and allergens for a thorough and healthy clean.</li>\r\n<li>Move-in/Move-out Cleaning: Whether you\'re moving in or out of a property, we provide detailed cleaning services to ensure a fresh start or leave the space in pristine condition.</li>\r\n<li>Specialized Cleaning: We offer specialized cleaning solutions for specific needs, such as carpet cleaning, window cleaning, and post-construction cleaning.</li>\r\n</ul>\r\n</section>\r\n<section>\r\n<h2>Why Choose Us</h2>\r\n<ul>\r\n<li>Experienced Professionals: Our cleaning team consists of experienced and trained professionals who deliver exceptional results.</li>\r\n<li>Quality Cleaning Products: We use high-quality, eco-friendly cleaning products that are safe for your space and the environment.</li>\r\n<li>Attention to Detail: We pay meticulous attention to detail, ensuring no corner is left untouched and providing a thorough cleaning experience.</li>\r\n<li>Flexible Scheduling: We offer flexible scheduling options to accommodate your specific cleaning needs and preferences.</li>\r\n<li>Customer Satisfaction: Your satisfaction is our top priority, and we strive to exceed your expectations with our excellent service.</li>\r\n</ul>\r\n</section>\r\n<section></section>\r\n</main>', 1, 1, '0', '1', '1', '[213,215,216,217,218,238,270]', '1', 'world-clean-pvt.-ltd.-------'),
(119, 297, 'Pestguard pvt ltd   ', 'PestGuard Services: Your trusted solution for effective pest control, providing extermination, termite control, rodent exclusion, bed bug treatment, and mosquito control. Enjoy a pest-free environment with our professional team.', 'public/backend/assets/national_id/07 Pestguard pvt ltd-min.jpg.jpg', 'Hill view near', 'public/backend/assets/banner/1743495510_aee9617ac296529b2c57.png', 'public/backend/assets/address_id/', 'public/backend/assets/passport/', '4737195', 'D509-0597-6171', 'Central', '2147483647', 'Pestguard', '4737195', '100011', 60, 0, 0, '10', 20, 1, NULL, 5, 2, '2022-11-09 05:53:22', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1688732428_fb0ab5cbd57d045eb84e.jpg\",\"public\\/uploads\\/partner\\/1688732428_871e9bf5d0e41f4939ef.jpg\",\"public\\/uploads\\/partner\\/1688732428_3c61692895016a57668e.jpg\",\"public\\/uploads\\/partner\\/1688732428_6cc2549134d5465d934d.jpg\"]', '<h1 style=\"color: #007bff; font-size: 20px;\">PestGuard Services</h1>\r\n<table style=\"width: 100%; margin-top: 40px; border-collapse: collapse;\">\r\n<tbody>\r\n<tr>\r\n<th style=\"color: #007bff; font-size: 14px; padding: 10px;\">Services</th>\r\n<th style=\"color: #007bff; font-size: 14px; padding: 10px;\">Benefits</th>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Pest Extermination</td>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Say goodbye to pests! Our experts will identify and eliminate a wide range of pests, including ants, cockroaches, spiders, and more. We use safe and effective pest control methods to ensure a pest-free environment.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Termite Control</td>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Protect your property from costly termite damage. Our specialized termite control treatments include inspection, prevention, and extermination methods to safeguard your structure. We use advanced techniques and environmentally friendly products to ensure long-lasting termite control solutions.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Rodent Exclusion</td>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Don\'t let rodents invade your space! Our comprehensive rodent exclusion measures will identify entry points, seal off access, and implement effective trapping and removal techniques. We provide long-term solutions to keep your property rodent-free.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Bed Bug Treatment</td>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Sleep soundly without bed bugs. Our professional bed bug treatments target bed bug infestations, eliminating these pests at all life stages. We employ a combination of heat treatment, chemical treatment, and thorough inspections to ensure complete eradication.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Mosquito Control</td>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Enjoy your outdoor space without the nuisance of mosquitoes. Our mosquito control services focus on targeted treatments and preventive measures to reduce mosquito populations and minimize the risk of mosquito-borne diseases.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"color: #333; font-size: 12px; margin-top: 40px;\">Experience reliable pest control solutions with our professional PestGuard services. Our team of experts will exterminate pests, protect against termites, exclude rodents, eliminate bed bugs, and control mosquitoes. Say goodbye to pests and enjoy a pest-free environment with PestGuard!</p>\r\n<h2 style=\"color: #007bff; font-size: 20px; margin-top: 40px;\">Why Choose PestGuard?</h2>\r\n<ul style=\"color: #333; font-size: 12px; text-align: left; margin-left: 40px;\">\r\n<li>Experienced Professionals: Our team consists of highly trained and licensed technicians who have extensive knowledge in pest control and management.</li>\r\n<li>Customized Solutions: We understand that every pest situation is unique. Our experts provide tailored solutions to address your specific needs and effectively eliminate pests.</li>\r\n<li>Safe and Eco-Friendly: We prioritize the safety of your family, pets, and the environment. Our pest control methods are eco-friendly and adhere to strict safety standards.</li>\r\n<li>Guaranteed Results: We stand behind the quality of our services. If pests return within the specified warranty period, we will re-treat your property at no additional cost.</li>\r\n<li>Excellent Customer Service: We value our customers and strive to deliver exceptional service. Our friendly and knowledgeable staff is ready to assist you with any inquiries or concerns.</li>\r\n</ul>', 1, 1, '0', '1', '1', '[246,247,248,249,250,251]', '1', 'pestguard-pvt-ltd-1'),
(120, 298, 'Plumbhelp  Pvt Ltd    ', 'Welcome to our Expert Plumbing Services! With a dedicated team of skilled plumbers, we provide reliable solutions for all your plumbing needs, ensuring peace of mind and optimal functionality.', 'public/backend/assets/national_id/PLUMBING.jpg.jpg', 'Time Square Empire', 'public/backend/assets/banner/1743418986_a01615c86018888e3c24.png', 'public/backend/assets/address_id/', 'public/backend/assets/passport/', '852963', 'ED984-4972-810', 'bob', '2147483647', 'test', '852963', '321000', 60, 0, 0, '10', 20, 1, NULL, 5, 1, '2022-11-09 06:41:15', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743505998_48e54ff1e6e854bc5e63.jpg\",\"public\\/uploads\\/partner\\/1743505998_555deebfbfc3b84db8c3.jpg\",\"public\\/uploads\\/partner\\/1743505998_412962feac328ce2bb92.jpg\",\"public\\/uploads\\/partner\\/1743505998_bb249e627a1a311c9903.jpg\"]', '<p>tes]</p>', 1, 1, '0', '1', '1', '[240,241,242]', '1', 'plumbhelp-pvt-ltd-1'),
(121, 301, 'TeamWork Gourp of Comapny   ', 'At TeamWork Gourp of Comapny, we provide reliable and efficient solutions for all your air conditioning needs. With our team of experienced technicians, we offer professional AC installation, repair, and maintenance services. Stay cool and comfortable year-round with our top-notch AC services.', 'public/backend/assets/national_id/handsome-guy-posing-gray-wall.jpg.jpg', 'Time Square Empire', 'public/backend/assets/banner/1743420408_6473c90f245139e5c73e.png', '', '', '2729248', 'D984-4972-8105', 'Bank', '2147483647', 'test', '2729248', '100015', 60, 0, 0, '10', 30, 1, NULL, 5, 2, '2022-11-09 09:57:25', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743506539_233631b88d0ab17b1f53.jpg\",\"public\\/uploads\\/partner\\/1743506539_e9028c9b8c314e40e1b5.jpg\",\"public\\/uploads\\/partner\\/1743506539_99c9eadcb81baf970ab9.jpg\",\"public\\/uploads\\/partner\\/1743506539_66ab431db37a74569ea1.jpg\"]', '<h1 style=\"color: #333; font-size: 32px;\">AC Services</h1>\r\n<table style=\"width: 100%; margin-top: 40px; border-collapse: collapse;\">\r\n<tbody>\r\n<tr>\r\n<th style=\"color: #333; font-size: 24px; padding: 10px;\">Services</th>\r\n<th style=\"color: #333; font-size: 24px; padding: 10px;\">Benefits</th>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">AC Installation</td>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">Experience the comfort of a perfectly installed AC system tailored to your needs.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">AC Repair</td>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">Trust our skilled technicians to diagnose and fix any AC issues, restoring optimal cooling performance.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">AC Maintenance</td>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">Keep your AC system running efficiently and extend its lifespan with our regular maintenance services.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">Emergency AC Service</td>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">We\'re available 24/7 to provide immediate assistance when you need it the most.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 40px;\">Experience reliable cooling solutions with our professional AC services. Our team of experienced technicians ensures top-notch installation, repair, and maintenance, keeping you comfortable all year round. Don\'t sweat it, trust us for your AC needs!</p>', 1, 1, '0', '1', '1', '[221]', '1', 'teamwork-gourp-of-comapny-1-1-1'),
(123, 303, 'DlyingData Multi-Services   ', 'Your convenient solution for professional laundry care. We offer wash & fold, dry cleaning, and ironing services with quality and reliability. Experience exceptional results and hassle-free laundry with us.', 'public/backend/assets/national_id/young-woman-with-rubber-gloves-ready-clean (2).jpg.jpg', 'Time Square Empire', 'public/backend/assets/banner/1743425487_232497e7c78527048e55.png', '', '', '6046-18-5173', 'X654-7478-4144', 'Indian', '2147483647', 'test', '6046-18-5173', '100013', 60, 0, 0, '10', 20, 1, NULL, 5, 3, '2022-11-09 11:06:38', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743506880_81150db2cd3e8622efe9.jpg\",\"public\\/uploads\\/partner\\/1743506880_1cecf95f920b7e4a1b76.jpg\",\"public\\/uploads\\/partner\\/1743506880_6e0b6625ffb54deaa200.jpg\",\"public\\/uploads\\/partner\\/1743506880_8c7b90c44c908f2e7306.jpg\"]', '<h2 style=\"color: #666; font-size: 24px; margin-top: 40px;\">Professional Laundry Solutions for Your Convenience</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At DlyingData Multi-Services, we offer professional laundry solutions to make your life easier. With our commitment to quality and customer satisfaction, we provide convenient and reliable laundry services for individuals and businesses alike.</p>\r\n<h2 style=\"color: #666; font-size: 24px; margin-top: 40px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px; text-align: left;\">\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Wash &amp; Fold Service: Leave your laundry worries behind as we take care of washing, drying, and folding your clothes with precision and care. Enjoy clean and neatly folded garments delivered right to your doorstep.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Dry Cleaning: Trust our expert dry cleaners to handle your delicate fabrics and garments that require specialized care. We use advanced techniques and quality solvents to ensure your clothes look and feel their best.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Ironing Service: Say goodbye to wrinkled clothes with our professional ironing service. Our skilled team will iron and press your garments to perfection, giving them a crisp and polished appearance.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Stain Removal: Let us handle those stubborn stains. Our experienced staff utilizes effective stain removal techniques to tackle even the toughest stains, ensuring your clothes are fresh and spotless.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Alterations &amp; Repairs: Need a quick fix or alteration? Our skilled tailors provide alteration and repair services, ensuring your clothes fit perfectly and are in excellent condition.</li>\r\n</ul>\r\n<h2 style=\"color: #666; font-size: 24px; margin-top: 40px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px; text-align: left;\">\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Quality Service: We take pride in delivering exceptional quality and attention to detail in every laundry service we provide. Your satisfaction is our top priority.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Convenience: Enjoy the convenience of our pickup and delivery service, saving you time and effort. We ensure prompt and reliable service right at your doorstep.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Skilled Team: Our team consists of experienced laundry professionals who handle your clothes with care and expertise, using the latest techniques and equipment.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Competitive Pricing: We offer competitive and transparent pricing, ensuring that you receive excellent value for the quality laundry services we provide.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Eco-Friendly Practices: We are committed to environmental sustainability. Our laundry processes incorporate eco-friendly practices and detergents for a greener approach.</li>\r\n</ul>', 1, 1, '0', '1', '1', '[222,235,236]', '1', 'dlyingdata-multi-services-1-1-1'),
(137, 327, 'Big Brand Electronic Service         ', 'Whatever the problem, find the best electrician in World, We understand our customers’ concern about quality and security. Our team ensures that all our electricians are verified, well-experienced, and skilled to handle any electrical job.Find our professional electrician services in eDemand App, You don’t need to worry about bookings because we have made this procedure short and simple. We are just one click away, so you can book for expert electricians in India, eDemand in one go and have them at your doorstep on the same day', 'public/backend/assets/national_id/1750054956_a652a188c669997da188.png', 'Big Brand  service, Haripar road Bhuj-Kutch-370001', 'public/backend/assets/banner/1750054956_f0220bbf87b7ff0ba499.png', 'public/backend/assets/address_id/1750054956_754823fe086c7e8e044e.jpeg', 'public/backend/assets/passport/1750054956_7975526bacabf524ba3f.jpeg', '9256086', '15236658768', 'bob', '2147483647', 'Asutosh', '9256086', '100008', 60, 0, 0, '10', 20, 1, NULL, 5, 1, '2022-11-15 06:06:30', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743507056_def2acd807fc0c316fe2.jpg\",\"public\\/uploads\\/partner\\/1743507056_3dd1893cb0aaa10de090.jpg\",\"public\\/uploads\\/partner\\/1743507056_d4e2ec0dd22aad1295ae.jpg\",\"public\\/uploads\\/partner\\/1750054956_77331d0c435c172a84a4.png\"]', '<p>&nbsp;</p>\r\n<h1 style=\"color: #333; font-size: 32px;\">Your Trusted Electronic Service Provider</h1>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">We Fix, You Relax!</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At our electronic service provider, we take care of all your electronic repair needs with expertise and dedication. Our team of skilled technicians is committed to providing reliable and efficient solutions, so you can sit back, relax, and enjoy your devices without any worries.</p>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Smartphone Repair: From screen replacements to battery replacements, we fix all types of smartphone issues.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Laptop and Computer Repair: Our expert technicians handle laptop and computer repairs, ensuring optimal performance.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> TV and Home Theater Repair: We specialize in repairing TVs, home theaters, and audio systems to enhance your entertainment experience.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Gaming Console Repair: Get back in the game with our reliable gaming console repair services.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Electronic Device Upgrades: We offer upgrade services to help you keep up with the latest technology trends.</li>\r\n</ul>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Expert Technicians: Our highly skilled technicians possess the knowledge and expertise to handle all types of electronic repairs.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quick Turnaround Time: We strive to provide efficient and prompt service, ensuring minimal downtime for your devices.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quality Parts: We use only high-quality parts and components for repairs, ensuring long-lasting results.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Transparent Pricing: Our pricing is fair and transparent, with no hidden costs or surprises.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Excellent Customer Service: We are committed to providing exceptional customer service, ensuring your satisfaction throughout the repair process.</li>\r\n</ul>\r\n</div>', 1, 1, '0', '1', '1', '[252,253,254,255]', '1', 'big-brand-electronic-service-1-1'),
(139, 360, 'test', '', 'public/uploads/users/national_id/sport.png', NULL, '', NULL, 'public/uploads/users/passport/sport_2.png', 'gst', 'gdsyfsdf', '', '0', '', '', '', 60, 1, 2, '10', 50, 0, NULL, 0, 0, '2022-12-02 07:30:17', '0000-00-00 00:00:00', '', '', 1, 1, '0', '1', '1', NULL, '1', 'test'),
(143, 556, 'wrteam', 'xvbn hnznnsjjs', '', 'cvbns', 'public/backend/assets/banner/image_picker439744776022053418.jpg', '', '', 'zhhhs', '794997', 'hdfc', '6699884964949', 'zcnnjjns njs', 'hdfc001', 'bbbb', 60, 1, 5, '10', 10, 0, NULL, 0, 0, '2023-03-13 07:21:02', '0000-00-00 00:00:00', '', '', 1, 1, '0', '1', '1', NULL, '1', 'wrteam');
-- --------------------------------------------------------

--
-- Table structure for table `partner_subscriptions`
--

CREATE TABLE `partner_subscriptions` (
  `subscription_id` text NOT NULL,
  `status` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `is_payment` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `duration` text NOT NULL,
  `price` text NOT NULL,
  `discount_price` text NOT NULL,
  `publish` text DEFAULT NULL,
  `order_type` text NOT NULL,
  `max_order_limit` text DEFAULT NULL,
  `service_type` text NOT NULL,
  `max_service_limit` text DEFAULT NULL,
  `tax_type` text NOT NULL,
  `tax_id` text NOT NULL,
  `is_commision` text NOT NULL,
  `commission_threshold` text DEFAULT NULL,
  `commission_percentage` text DEFAULT NULL,
  `transaction_id` text DEFAULT NULL,
  `tax_percentage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partner_subscriptions`
--

INSERT INTO `partner_subscriptions` (`subscription_id`, `status`, `created_at`, `updated_at`, `is_payment`, `id`, `partner_id`, `purchase_date`, `expiry_date`, `name`, `description`, `duration`, `price`, `discount_price`, `publish`, `order_type`, `max_order_limit`, `service_type`, `max_service_limit`, `tax_type`, `tax_id`, `is_commision`, `commission_threshold`, `commission_percentage`, `transaction_id`, `tax_percentage`) VALUES
('7', 'deactive', '2023-08-10 18:43:24', '2023-08-10 18:43:24', 1, 9, 263, '2023-08-10', '2023-08-10', 'Premium', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', 'unlimited', '599', '549', '1', 'unlimited', '0', 'limited', '0', 'included', '12', 'yes', '100000', '10', '0', 10),
('7', 'active', '2023-08-10 18:43:27', '2023-08-10 18:43:27', 1, 10, 270, '2023-08-10', '2023-08-10', 'Premium', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', 'unlimited', '599', '549', '1', 'unlimited', '0', 'limited', '0', 'included', '12', 'yes', '100000', '10', '0', 10),
('7', 'active', '2023-08-10 18:43:31', '2023-08-10 18:43:31', 1, 11, 273, '2023-08-10', '2023-08-10', 'Premium', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', 'unlimited', '599', '549', '1', 'unlimited', '0', 'limited', '0', 'included', '12', 'yes', '100000', '10', '0', 10),
('7', 'active', '2023-08-10 18:43:35', '2023-08-10 18:43:35', 1, 12, 283, '2023-08-10', '2023-08-10', 'Premium', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', 'unlimited', '599', '549', '1', 'unlimited', '0', 'limited', '0', 'included', '12', 'yes', '100000', '10', '0', 10),
('7', 'active', '2023-08-10 18:43:39', '2023-08-10 18:43:39', 1, 13, 293, '2023-08-10', '2023-08-10', 'Premium', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', 'unlimited', '599', '549', '1', 'unlimited', '0', 'limited', '0', 'included', '12', 'yes', '100000', '10', '0', 10),
('7', 'active', '2023-08-10 18:43:42', '2023-08-10 18:43:42', 1, 14, 297, '2023-08-10', '2023-08-10', 'Premium', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', 'unlimited', '599', '549', '1', 'unlimited', '0', 'limited', '0', 'included', '12', 'yes', '100000', '10', '0', 10),
('7', 'active', '2023-08-10 18:43:47', '2023-08-10 18:43:47', 1, 15, 298, '2023-08-10', '2023-08-10', 'Premium', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', 'unlimited', '599', '549', '1', 'unlimited', '0', 'limited', '0', 'included', '12', 'yes', '100000', '10', '0', 10),
('7', 'active', '2023-08-10 18:43:51', '2023-08-10 18:43:51', 1, 16, 301, '2023-08-10', '2023-08-10', 'Premium', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', 'unlimited', '599', '549', '1', 'unlimited', '0', 'limited', '0', 'included', '12', 'yes', '100000', '10', '0', 10),
('7', 'active', '2023-08-10 18:43:55', '2023-08-10 18:43:55', 1, 17, 303, '2023-08-10', '2023-08-10', 'Premium', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', 'unlimited', '599', '549', '1', 'unlimited', '0', 'limited', '0', 'included', '12', 'yes', '100000', '10', '0', 10),
('7', 'active', '2023-08-10 18:43:59', '2023-08-10 18:43:59', 1, 18, 327, '2023-08-10', '2023-08-10', 'Premium', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', 'unlimited', '599', '549', '1', 'unlimited', '0', 'limited', '0', 'included', '12', 'yes', '100000', '10', '0', 10);
-- --------------------------------------------------------

--
-- Table structure for table `partner_timings`
--

CREATE TABLE `partner_timings` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `day` varchar(20) DEFAULT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `is_open` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partner_timings`
--

INSERT INTO `partner_timings` (`id`, `partner_id`, `day`, `opening_time`, `closing_time`, `is_open`, `created_at`, `updated_at`) VALUES
(1, 50, 'sunday', '09:10:00', '17:00:00', 1, '2022-06-16 05:00:14', '2022-06-16 05:00:14'),
(2, 50, 'saturday', '09:00:00', '17:00:00', 1, '2022-06-15 06:25:44', '2022-06-15 06:25:44'),
(3, 50, 'friday', '09:00:00', '17:00:00', 1, '2022-06-15 10:35:40', '2022-06-15 10:35:40'),
(4, 50, 'thursday', '09:00:00', '17:00:00', 1, '2022-06-15 10:35:40', '2022-06-15 10:35:40'),
(5, 50, 'wednesday', '09:00:00', '17:00:00', 1, '2022-06-16 05:00:14', '2022-06-16 05:00:14'),
(6, 50, 'tuesday', '09:00:00', '17:00:00', 1, '2022-06-16 05:00:14', '2022-06-16 05:00:14'),
(7, 50, 'monday', '09:00:00', '17:00:00', 1, '2022-06-16 05:00:14', '2022-06-16 05:00:14'),
(27, 166, 'monday', '08:46:00', '06:46:00', 1, '2022-07-19 07:18:55', '2022-07-19 07:18:55'),
(28, 166, 'tuesday', '08:46:00', '18:46:00', 1, '2022-07-19 07:18:55', '2022-07-19 07:18:55'),
(29, 166, 'wednesday', '08:47:00', '18:47:00', 1, '2022-07-19 07:18:55', '2022-07-19 07:18:55'),
(30, 166, 'thursday', '08:47:00', '18:47:00', 1, '2022-07-19 07:18:55', '2022-07-19 07:18:55'),
(31, 166, 'friday', '08:47:00', '18:47:00', 1, '2022-07-19 07:18:55', '2022-07-19 07:18:55'),
(147, 260, 'monday', '08:00:00', '17:00:00', 1, '2022-11-07 07:29:11', '2022-11-07 07:29:11'),
(148, 260, 'tuesday', '09:00:00', '18:00:00', 1, '2022-11-07 07:29:11', '2022-11-07 07:29:11'),
(151, 263, 'monday', '09:00:00', '21:00:00', 1, '2022-11-07 10:31:39', '2022-11-07 10:31:39'),
(152, 263, 'tuesday', '09:00:00', '21:00:00', 1, '2022-11-07 10:31:39', '2022-11-07 10:31:39'),
(165, 270, 'monday', '09:00:00', '17:00:00', 1, '2022-11-08 04:17:16', '2022-11-08 04:17:16'),
(166, 270, 'tuesday', '09:00:00', '17:00:00', 1, '2022-11-08 04:17:16', '2022-11-08 04:17:16'),
(167, 270, 'wednesday', '09:00:00', '17:00:00', 1, '2022-11-08 04:17:16', '2022-11-08 04:17:16'),
(168, 270, 'thursday', '09:00:00', '17:00:00', 1, '2022-11-08 04:17:16', '2022-11-08 04:17:16'),
(169, 270, 'friday', '09:00:00', '17:00:00', 1, '2022-11-08 04:17:16', '2022-11-08 04:17:16'),
(170, 270, 'saturday', '09:00:00', '14:00:00', 1, '2022-11-08 04:17:16', '2022-11-08 04:17:16'),
(171, 271, 'monday', '09:00:00', '18:00:00', 1, '2022-11-08 05:24:00', '2022-11-08 05:24:00'),
(172, 271, 'tuesday', '09:00:00', '17:00:00', 1, '2022-11-08 05:24:00', '2022-11-08 05:24:00'),
(173, 271, 'wednesday', '09:00:00', '17:00:00', 1, '2022-11-08 05:24:00', '2022-11-08 05:24:00'),
(174, 271, 'thursday', '09:00:00', '17:00:00', 1, '2022-11-08 05:24:00', '2022-11-08 05:24:00'),
(175, 271, 'friday', '09:00:00', '17:00:00', 1, '2022-11-08 05:24:00', '2022-11-08 05:24:00'),
(176, 271, 'saturday', '09:00:00', '17:00:00', 1, '2022-11-08 05:24:00', '2022-11-08 05:24:00'),
(183, 273, 'monday', '10:00:00', '21:00:00', 1, '2022-11-08 06:36:44', '2022-11-08 06:36:44'),
(184, 273, 'tuesday', '10:00:00', '21:00:00', 1, '2022-11-08 06:36:45', '2022-11-08 06:36:45'),
(185, 273, 'wednesday', '10:00:00', '21:00:00', 1, '2022-11-08 06:36:45', '2022-11-08 06:36:45'),
(186, 273, 'thursday', '10:00:00', '21:00:00', 1, '2022-11-08 06:36:45', '2022-11-08 06:36:45'),
(187, 273, 'friday', '10:00:00', '21:00:00', 1, '2022-11-08 06:36:45', '2022-11-08 06:36:45'),
(188, 273, 'saturday', '10:00:00', '20:00:00', 1, '2022-11-08 06:36:45', '2022-11-08 06:36:45'),
(189, 274, 'monday', '09:59:00', '18:00:00', 1, '2022-11-08 07:02:26', '2022-11-08 07:02:26'),
(190, 274, 'tuesday', '09:00:00', '18:00:00', 1, '2022-11-08 07:02:26', '2022-11-08 07:02:26'),
(191, 274, 'wednesday', '09:00:00', '18:00:00', 1, '2022-11-08 07:02:26', '2022-11-08 07:02:26'),
(192, 274, 'thursday', '09:00:00', '18:30:00', 1, '2022-11-08 07:02:26', '2022-11-08 07:02:26'),
(193, 274, 'friday', '09:30:00', '18:30:00', 1, '2022-11-08 07:02:26', '2022-11-08 07:02:26'),
(194, 274, 'saturday', '09:30:00', '18:30:00', 1, '2022-11-08 07:02:26', '2022-11-08 07:02:26'),
(204, 283, 'monday', '08:00:00', '20:00:00', 1, '2022-11-08 11:01:17', '2022-11-08 11:01:17'),
(205, 283, 'tuesday', '08:00:00', '20:00:00', 1, '2022-11-08 11:01:17', '2022-11-08 11:01:17'),
(206, 283, 'wednesday', '08:00:00', '20:00:00', 1, '2022-11-08 11:01:17', '2022-11-08 11:01:17'),
(207, 283, 'thursday', '08:00:00', '20:00:00', 1, '2022-11-08 11:01:17', '2022-11-08 11:01:17'),
(208, 283, 'friday', '08:00:00', '20:00:00', 1, '2022-11-08 11:01:17', '2022-11-08 11:01:17'),
(209, 283, 'saturday', '08:00:00', '20:00:00', 1, '2022-11-08 11:01:17', '2022-11-08 11:01:17'),
(210, 283, 'sunday', '08:00:00', '13:00:00', 1, '2022-11-08 11:01:17', '2022-11-08 11:01:17'),
(211, 293, 'monday', '09:00:00', '17:00:00', 1, '2022-11-09 05:11:30', '2022-11-09 05:11:30'),
(212, 293, 'tuesday', '09:00:00', '17:00:00', 1, '2022-11-09 05:11:30', '2022-11-09 05:11:30'),
(213, 293, 'wednesday', '09:00:00', '17:00:00', 1, '2022-11-09 05:11:30', '2022-11-09 05:11:30'),
(214, 293, 'thursday', '09:00:00', '17:00:00', 1, '2022-11-09 05:11:30', '2022-11-09 05:11:30'),
(215, 293, 'friday', '09:00:00', '17:00:00', 0, '2022-11-09 05:11:30', '2022-11-09 05:11:30'),
(216, 293, 'saturday', '09:00:00', '14:00:00', 1, '2022-11-09 05:11:30', '2022-11-09 05:11:30'),
(217, 297, 'monday', '09:00:00', '17:00:00', 1, '2022-11-09 05:53:22', '2022-11-09 05:53:22'),
(218, 297, 'tuesday', '09:00:00', '17:00:00', 1, '2022-11-09 05:53:22', '2022-11-09 05:53:22'),
(219, 297, 'wednesday', '09:00:00', '17:00:00', 1, '2022-11-09 05:53:22', '2022-11-09 05:53:22'),
(220, 297, 'thursday', '09:00:00', '17:00:00', 1, '2022-11-09 05:53:22', '2022-11-09 05:53:22'),
(221, 297, 'friday', '09:00:00', '17:00:00', 1, '2022-11-09 05:53:22', '2022-11-09 05:53:22'),
(222, 298, 'monday', '09:00:00', '21:00:00', 1, '2022-11-09 06:41:15', '2022-11-09 06:41:15'),
(223, 298, 'tuesday', '09:00:00', '21:00:00', 1, '2022-11-09 06:41:15', '2022-11-09 06:41:15'),
(224, 298, 'wednesday', '09:00:00', '21:00:00', 1, '2022-11-09 06:41:15', '2022-11-09 06:41:15'),
(225, 298, 'thursday', '09:00:00', '21:00:00', 1, '2022-11-09 06:41:15', '2022-11-09 06:41:15'),
(226, 298, 'friday', '09:00:00', '21:00:00', 1, '2022-11-09 06:41:15', '2022-11-09 06:41:15'),
(227, 298, 'saturday', '09:00:00', '21:00:00', 1, '2022-11-09 06:41:15', '2022-11-09 06:41:15'),
(228, 298, 'sunday', '09:00:00', '21:00:00', 1, '2022-11-09 06:41:15', '2022-11-09 06:41:15'),
(229, 301, 'monday', '09:00:00', '14:00:00', 1, '2022-11-09 09:57:26', '2022-11-09 09:57:26'),
(230, 301, 'tuesday', '09:00:00', '21:00:00', 1, '2022-11-09 09:57:26', '2022-11-09 09:57:26'),
(231, 301, 'wednesday', '09:00:00', '21:00:00', 1, '2022-11-09 09:57:26', '2022-11-09 09:57:26'),
(232, 301, 'thursday', '09:00:00', '21:00:00', 1, '2022-11-09 09:57:26', '2022-11-09 09:57:26'),
(233, 301, 'friday', '09:00:00', '21:00:00', 1, '2022-11-09 09:57:26', '2022-11-09 09:57:26'),
(234, 301, 'saturday', '09:00:00', '21:00:00', 1, '2022-11-09 09:57:26', '2022-11-09 09:57:26'),
(235, 301, 'sunday', '09:00:00', '21:00:00', 1, '2022-11-09 09:57:26', '2022-11-09 09:57:26'),
(237, 303, 'monday', '10:00:00', '17:00:00', 1, '2022-11-09 11:06:38', '2022-11-09 11:06:38'),
(238, 303, 'tuesday', '10:00:00', '18:00:00', 1, '2022-11-09 11:06:38', '2022-11-09 11:06:38'),
(239, 303, 'wednesday', '10:00:00', '20:00:00', 1, '2022-11-09 11:06:38', '2022-11-09 11:06:38'),
(240, 303, 'thursday', '10:00:00', '21:00:00', 1, '2022-11-09 11:06:38', '2022-11-09 11:06:38'),
(241, 303, 'friday', '10:00:00', '21:00:00', 1, '2022-11-09 11:06:38', '2022-11-09 11:06:38'),
(242, 303, 'saturday', '09:00:00', '14:00:00', 1, '2022-11-09 11:06:38', '2022-11-09 11:06:38'),
(243, 303, 'sunday', '09:00:00', '14:00:00', 1, '2022-11-09 11:06:38', '2022-11-09 11:06:38'),
(244, 304, 'monday', '04:37:00', '16:37:00', 1, '2022-11-09 11:08:10', '2022-11-09 11:08:10'),
(245, 305, 'monday', '04:38:00', '16:39:00', 1, '2022-11-09 11:09:35', '2022-11-09 11:09:35'),
(246, 306, 'monday', '04:43:00', '16:43:00', 1, '2022-11-09 11:13:56', '2022-11-09 11:13:56'),
(247, 317, 'monday', '10:37:00', '22:37:00', 1, '2022-11-10 05:08:08', '2022-11-10 05:08:08'),
(248, 318, 'monday', '10:54:00', '22:54:00', 1, '2022-11-10 05:25:35', '2022-11-10 05:25:35'),
(249, 319, 'monday', '09:00:00', '18:00:00', 1, '2022-11-10 05:32:00', '2022-11-10 05:32:00'),
(250, 320, 'monday', '09:00:00', '20:59:00', 1, '2022-11-10 05:39:29', '2022-11-10 05:39:29'),
(252, 325, 'monday', '05:19:00', '17:19:00', 1, '2022-11-14 11:50:27', '2022-11-14 11:50:27'),
(254, 327, 'monday', '09:00:00', '21:00:00', 1, '2022-11-15 06:06:30', '2022-11-15 06:06:30'),
(255, 327, 'tuesday', '09:00:00', '21:00:00', 1, '2022-11-15 06:06:30', '2022-11-15 06:06:30'),
(256, 327, 'wednesday', '09:00:00', '21:00:00', 1, '2022-11-15 06:06:30', '2022-11-15 06:06:30'),
(257, 327, 'thursday', '09:00:00', '21:00:00', 1, '2022-11-15 06:06:30', '2022-11-15 06:06:30'),
(258, 327, 'friday', '09:00:00', '21:00:00', 1, '2022-11-15 06:06:30', '2022-11-15 06:06:30'),
(259, 327, 'saturday', '09:00:00', '21:00:00', 1, '2022-11-15 06:06:30', '2022-11-15 06:06:30'),
(260, 260, 'wednesday', '03:43:00', '15:43:00', 1, '2022-11-15 10:13:45', '2022-11-15 10:13:45'),
(261, 260, 'thursday', '09:00:00', '21:00:00', 1, '2022-11-15 10:13:45', '2022-11-15 10:13:45'),
(262, 260, 'friday', '09:00:00', '21:00:00', 1, '2022-11-15 10:13:45', '2022-11-15 10:13:45'),
(263, 260, 'saturday', '08:00:00', '17:00:00', 1, '2022-11-15 10:13:45', '2022-11-15 10:13:45'),
(264, 260, 'sunday', '09:00:00', '18:00:00', 1, '2022-11-15 10:13:45', '2022-11-15 10:13:45'),
(265, 270, 'sunday', '09:30:00', '20:00:00', 1, '2022-11-16 07:06:40', '2022-11-16 07:06:40'),
(266, 549, 'monday', '03:00:00', '04:10:00', 1, '2023-03-10 05:33:52', '2023-03-10 05:33:52'),
(267, 549, 'tuesday', '00:00:00', '04:10:00', 1, '2023-03-10 05:33:52', '2023-03-10 05:33:52'),
(268, 549, 'wednesday', '02:00:00', '04:15:00', 1, '2023-03-10 05:33:52', '2023-03-10 05:33:52'),
(269, 549, 'thursday', '00:00:00', '04:10:00', 1, '2023-03-10 05:33:52', '2023-03-10 05:33:52'),
(270, 549, 'friday', '00:00:00', '06:00:00', 1, '2023-03-10 05:33:52', '2023-03-10 05:33:52'),
(271, 549, 'saturday', '00:00:00', '06:00:00', 1, '2023-03-10 05:33:52', '2023-03-10 05:33:52'),
(272, 549, 'sunday', '20:00:00', '00:00:00', 1, '2023-03-10 05:33:52', '2023-03-10 05:33:52'),
(273, 552, 'monday', '00:00:00', '00:00:00', 0, '2023-03-10 13:12:59', '2023-03-10 13:12:59'),
(274, 552, 'tuesday', '00:00:00', '00:00:00', 0, '2023-03-10 13:12:59', '2023-03-10 13:12:59'),
(275, 552, 'wednesday', '00:00:00', '00:00:00', 0, '2023-03-10 13:12:59', '2023-03-10 13:12:59'),
(276, 552, 'thursday', '00:00:00', '00:00:00', 0, '2023-03-10 13:12:59', '2023-03-10 13:12:59'),
(277, 552, 'friday', '00:00:00', '00:00:00', 0, '2023-03-10 13:12:59', '2023-03-10 13:12:59'),
(278, 552, 'saturday', '00:00:00', '00:00:00', 0, '2023-03-10 13:12:59', '2023-03-10 13:12:59'),
(279, 552, 'sunday', '00:00:00', '00:00:00', 0, '2023-03-10 13:12:59', '2023-03-10 13:12:59'),
(280, 327, 'monday', '09:00:00', '21:00:00', 1, '2023-03-11 12:34:51', '2023-03-11 12:34:51'),
(281, 327, 'tuesday', '09:00:00', '21:00:00', 1, '2023-03-11 12:34:51', '2023-03-11 12:34:51'),
(282, 327, 'wednesday', '09:00:00', '21:00:00', 1, '2023-03-11 12:34:51', '2023-03-11 12:34:51'),
(283, 327, 'thursday', '09:00:00', '21:00:00', 1, '2023-03-11 12:34:51', '2023-03-11 12:34:51'),
(284, 327, 'friday', '09:00:00', '21:00:00', 1, '2023-03-11 12:34:51', '2023-03-11 12:34:51'),
(285, 327, 'saturday', '09:00:00', '21:00:00', 1, '2023-03-11 12:34:51', '2023-03-11 12:34:51'),
(286, 327, 'sunday', '09:00:00', '21:00:00', 1, '2023-03-11 12:34:51', '2023-03-11 12:34:51'),
(294, 327, 'monday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:49', '2023-03-13 06:34:49'),
(295, 327, 'tuesday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:49', '2023-03-13 06:34:49'),
(296, 327, 'wednesday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:49', '2023-03-13 06:34:49'),
(297, 327, 'thursday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:49', '2023-03-13 06:34:49'),
(298, 327, 'friday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:49', '2023-03-13 06:34:49'),
(299, 327, 'saturday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:49', '2023-03-13 06:34:49'),
(300, 327, 'sunday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:49', '2023-03-13 06:34:49'),
(301, 327, 'monday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:59', '2023-03-13 06:34:59'),
(302, 327, 'tuesday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:59', '2023-03-13 06:34:59'),
(303, 327, 'wednesday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:59', '2023-03-13 06:34:59'),
(304, 327, 'thursday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:59', '2023-03-13 06:34:59'),
(305, 327, 'friday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:59', '2023-03-13 06:34:59'),
(306, 327, 'saturday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:59', '2023-03-13 06:34:59'),
(307, 327, 'sunday', '09:00:00', '21:00:00', 1, '2023-03-13 06:34:59', '2023-03-13 06:34:59'),
(308, 556, 'monday', '00:00:00', '00:00:00', 0, '2023-03-13 07:21:02', '2023-03-13 07:21:02'),
(309, 556, 'tuesday', '08:00:00', '16:00:00', 1, '2023-03-13 07:21:02', '2023-03-13 07:21:02'),
(310, 556, 'wednesday', '00:00:00', '00:00:00', 0, '2023-03-13 07:21:02', '2023-03-13 07:21:02'),
(311, 556, 'thursday', '00:00:00', '00:00:00', 0, '2023-03-13 07:21:02', '2023-03-13 07:21:02'),
(312, 556, 'friday', '00:00:00', '00:00:00', 0, '2023-03-13 07:21:02', '2023-03-13 07:21:02'),
(313, 556, 'saturday', '00:00:00', '00:00:00', 0, '2023-03-13 07:21:02', '2023-03-13 07:21:02'),
(314, 556, 'sunday', '00:00:00', '00:00:00', 0, '2023-03-13 07:21:02', '2023-03-13 07:21:02'),
(336, 260, 'monday', '08:00:00', '17:00:00', 1, '2023-03-14 11:46:31', '2023-03-14 11:46:31'),
(337, 260, 'tuesday', '09:00:00', '18:00:00', 1, '2023-03-14 11:46:31', '2023-03-14 11:46:31'),
(338, 260, 'wednesday', '03:43:00', '15:43:00', 1, '2023-03-14 11:46:31', '2023-03-14 11:46:31'),
(339, 260, 'thursday', '09:00:00', '21:00:00', 1, '2023-03-14 11:46:31', '2023-03-14 11:46:31'),
(340, 260, 'friday', '09:00:00', '21:00:00', 1, '2023-03-14 11:46:31', '2023-03-14 11:46:31'),
(341, 260, 'monday', '08:00:00', '17:00:00', 1, '2023-03-14 11:48:29', '2023-03-14 11:48:29'),
(342, 260, 'tuesday', '09:00:00', '18:00:00', 1, '2023-03-14 11:48:29', '2023-03-14 11:48:29'),
(343, 260, 'wednesday', '03:43:00', '15:43:00', 1, '2023-03-14 11:48:29', '2023-03-14 11:48:29'),
(344, 260, 'thursday', '09:00:00', '21:00:00', 1, '2023-03-14 11:48:29', '2023-03-14 11:48:29'),
(345, 260, 'friday', '09:00:00', '21:00:00', 1, '2023-03-14 11:48:29', '2023-03-14 11:48:29'),
(367, 260, 'monday', '08:00:00', '17:00:00', 1, '2023-03-15 04:04:34', '2023-03-15 04:04:34'),
(368, 260, 'tuesday', '09:00:00', '18:00:00', 1, '2023-03-15 04:04:34', '2023-03-15 04:04:34'),
(369, 260, 'wednesday', '03:43:00', '15:43:00', 1, '2023-03-15 04:04:34', '2023-03-15 04:04:34'),
(370, 260, 'thursday', '09:00:00', '21:00:00', 1, '2023-03-15 04:04:34', '2023-03-15 04:04:34'),
(371, 260, 'friday', '09:00:00', '21:00:00', 1, '2023-03-15 04:04:34', '2023-03-15 04:04:34'),
(372, 260, 'saturday', '08:00:00', '17:00:00', 1, '2023-03-15 04:04:34', '2023-03-15 04:04:34'),
(373, 260, 'sunday', '09:00:00', '18:00:00', 1, '2023-03-15 04:04:34', '2023-03-15 04:04:34'),
(374, 260, 'monday', '08:00:00', '17:00:00', 1, '2023-03-15 04:05:20', '2023-03-15 04:05:20'),
(375, 260, 'tuesday', '09:00:00', '18:00:00', 1, '2023-03-15 04:05:20', '2023-03-15 04:05:20'),
(376, 260, 'wednesday', '03:43:00', '15:43:00', 1, '2023-03-15 04:05:20', '2023-03-15 04:05:20'),
(377, 260, 'thursday', '09:00:00', '21:00:00', 1, '2023-03-15 04:05:20', '2023-03-15 04:05:20'),
(378, 260, 'friday', '09:00:00', '21:00:00', 1, '2023-03-15 04:05:20', '2023-03-15 04:05:20'),
(379, 260, 'saturday', '08:00:00', '17:00:00', 1, '2023-03-15 04:05:20', '2023-03-15 04:05:20'),
(380, 260, 'sunday', '09:00:00', '18:00:00', 1, '2023-03-15 04:05:20', '2023-03-15 04:05:20'),
(444, 297, 'monday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:08', '2023-03-24 11:38:08'),
(445, 297, 'tuesday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:08', '2023-03-24 11:38:08'),
(446, 297, 'wednesday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:08', '2023-03-24 11:38:08'),
(447, 297, 'thursday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:08', '2023-03-24 11:38:08'),
(448, 297, 'friday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:08', '2023-03-24 11:38:08'),
(449, 297, 'saturday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:08', '2023-03-24 11:38:08'),
(450, 297, 'sunday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:08', '2023-03-24 11:38:08'),
(451, 297, 'monday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:54', '2023-03-24 11:38:54'),
(452, 297, 'tuesday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:54', '2023-03-24 11:38:54'),
(453, 297, 'wednesday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:54', '2023-03-24 11:38:54'),
(454, 297, 'thursday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:54', '2023-03-24 11:38:54'),
(455, 297, 'friday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:54', '2023-03-24 11:38:54'),
(456, 297, 'saturday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:54', '2023-03-24 11:38:54'),
(457, 297, 'sunday', '09:00:00', '17:00:00', 1, '2023-03-24 11:38:54', '2023-03-24 11:38:54'),
(479, 260, 'monday', '08:00:00', '17:00:00', 1, '2023-04-04 07:08:14', '2023-04-04 07:08:14'),
(480, 260, 'tuesday', '09:00:00', '18:00:00', 1, '2023-04-04 07:08:14', '2023-04-04 07:08:14'),
(481, 260, 'wednesday', '03:43:00', '15:43:00', 1, '2023-04-04 07:08:14', '2023-04-04 07:08:14'),
(482, 260, 'thursday', '09:00:00', '21:00:00', 1, '2023-04-04 07:08:14', '2023-04-04 07:08:14'),
(483, 260, 'friday', '09:00:00', '21:00:00', 1, '2023-04-04 07:08:14', '2023-04-04 07:08:14'),
(484, 260, 'saturday', '08:00:00', '17:00:00', 1, '2023-04-04 07:08:14', '2023-04-04 07:08:14'),
(485, 260, 'sunday', '09:00:00', '18:00:00', 1, '2023-04-04 07:08:14', '2023-04-04 07:08:14'),
(486, 615, 'monday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(487, 615, 'tuesday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(488, 615, 'wednesday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(489, 615, 'thursday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(490, 615, 'friday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(491, 615, 'saturday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(492, 615, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(493, 624, 'monday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(494, 624, 'tuesday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(495, 624, 'wednesday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(496, 624, 'thursday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(497, 624, 'friday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(498, 624, 'saturday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(499, 624, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(500, 628, 'monday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(501, 628, 'tuesday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(502, 628, 'wednesday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(503, 628, 'thursday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(504, 628, 'friday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(505, 628, 'saturday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(506, 628, 'sunday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(514, 643, 'monday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(515, 643, 'tuesday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(516, 643, 'wednesday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(517, 643, 'thursday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(518, 643, 'friday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(519, 643, 'saturday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(520, 643, 'sunday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(521, 293, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-11 10:13:56', '2023-04-11 10:13:56'),
(522, 273, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-11 10:18:51', '2023-04-11 10:18:51'),
(523, 263, 'wednesday', '09:00:00', '21:00:00', 1, '2023-04-11 10:21:12', '2023-04-11 10:21:12'),
(524, 263, 'thursday', '09:00:00', '21:00:00', 1, '2023-04-11 10:21:12', '2023-04-11 10:21:12'),
(525, 263, 'friday', '09:00:00', '21:00:00', 1, '2023-04-11 10:21:12', '2023-04-11 10:21:12'),
(526, 263, 'saturday', '09:00:00', '21:00:00', 1, '2023-04-11 10:21:12', '2023-04-11 10:21:12'),
(527, 263, 'sunday', '09:00:00', '21:00:00', 1, '2023-04-11 10:21:12', '2023-04-11 10:21:12'),
(535, 646, 'monday', '00:00:00', '00:00:00', 1, '2023-04-11 16:17:36', '2023-04-11 16:17:36'),
(536, 646, 'tuesday', '00:00:00', '00:00:00', 1, '2023-04-11 16:17:36', '2023-04-11 16:17:36'),
(537, 646, 'wednesday', '00:00:00', '00:00:00', 1, '2023-04-11 16:17:36', '2023-04-11 16:17:36'),
(538, 646, 'thursday', '00:00:00', '00:00:00', 1, '2023-04-11 16:17:36', '2023-04-11 16:17:36'),
(539, 646, 'friday', '00:00:00', '00:00:00', 1, '2023-04-11 16:17:36', '2023-04-11 16:17:36'),
(540, 646, 'saturday', '00:00:00', '00:00:00', 1, '2023-04-11 16:17:36', '2023-04-11 16:17:36'),
(541, 646, 'sunday', '00:00:00', '00:00:00', 1, '2023-04-11 16:17:36', '2023-04-11 16:17:36'),
(542, 649, 'monday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(543, 649, 'tuesday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(544, 649, 'wednesday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(545, 649, 'thursday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(546, 649, 'friday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(547, 649, 'saturday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(548, 649, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(549, 658, 'monday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(550, 658, 'tuesday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(551, 658, 'wednesday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(552, 658, 'thursday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(553, 658, 'friday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(554, 658, 'saturday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(555, 658, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(556, 665, 'monday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(557, 665, 'tuesday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(558, 665, 'wednesday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(559, 665, 'thursday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(560, 665, 'friday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(561, 665, 'saturday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(562, 665, 'sunday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(563, 668, 'monday', '00:00:00', '00:00:00', 0, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(564, 668, 'tuesday', '00:00:00', '00:00:00', 1, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(565, 668, 'wednesday', '00:00:00', '00:00:00', 1, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(566, 668, 'thursday', '00:00:00', '00:00:00', 1, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(567, 668, 'friday', '00:00:00', '00:00:00', 1, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(568, 668, 'saturday', '00:00:00', '00:00:00', 1, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(569, 668, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(570, 675, 'monday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(571, 675, 'tuesday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(572, 675, 'wednesday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(573, 675, 'thursday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(574, 675, 'friday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(575, 675, 'saturday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(576, 675, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(577, 706, 'monday', '00:00:00', '00:00:00', 1, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(578, 706, 'tuesday', '00:00:00', '00:00:00', 1, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(579, 706, 'wednesday', '00:00:00', '00:00:00', 1, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(580, 706, 'thursday', '00:00:00', '00:00:00', 1, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(581, 706, 'friday', '00:00:00', '00:00:00', 0, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(582, 706, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(583, 706, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(584, 709, 'monday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(585, 709, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(586, 709, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(587, 709, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(588, 709, 'friday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(589, 709, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(590, 709, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(591, 727, 'monday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(592, 727, 'tuesday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(593, 727, 'wednesday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(594, 727, 'thursday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(595, 727, 'friday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(596, 727, 'saturday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(597, 727, 'sunday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(598, 733, 'monday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(599, 733, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(600, 733, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(601, 733, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(602, 733, 'friday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(603, 733, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(604, 733, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(605, 742, 'monday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(606, 742, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(607, 742, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(608, 742, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(609, 742, 'friday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(610, 742, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(611, 742, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(612, 753, 'monday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(613, 753, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(614, 753, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(615, 753, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(616, 753, 'friday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(617, 753, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(618, 753, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(619, 761, 'monday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(620, 761, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(621, 761, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(622, 761, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(623, 761, 'friday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(624, 761, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(625, 761, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(626, 763, 'monday', '00:00:00', '00:00:00', 0, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(627, 763, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(628, 763, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(629, 763, 'thursday', '00:00:00', '00:00:00', 1, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(630, 763, 'friday', '00:00:00', '00:00:00', 1, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(631, 763, 'saturday', '00:00:00', '00:00:00', 1, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(632, 763, 'sunday', '00:00:00', '00:00:00', 1, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(633, 767, 'monday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(634, 767, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(635, 767, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(636, 767, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(637, 767, 'friday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(638, 767, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(639, 767, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(640, 772, 'monday', '00:00:00', '00:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(641, 772, 'tuesday', '00:00:00', '00:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(642, 772, 'wednesday', '00:00:00', '00:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(643, 772, 'thursday', '00:00:00', '00:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(644, 772, 'friday', '00:00:00', '00:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(645, 772, 'saturday', '09:00:00', '20:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(646, 772, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(647, 780, 'monday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(648, 780, 'tuesday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(649, 780, 'wednesday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(650, 780, 'thursday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(651, 780, 'friday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(652, 780, 'saturday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(653, 780, 'sunday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(654, 798, 'monday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(655, 798, 'tuesday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(656, 798, 'wednesday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(657, 798, 'thursday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(658, 798, 'friday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(659, 798, 'saturday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(660, 798, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(661, 810, 'monday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(662, 810, 'tuesday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(663, 810, 'wednesday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(664, 810, 'thursday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(665, 810, 'friday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(666, 810, 'saturday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(667, 810, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:18', '2023-06-12 13:29:18'),
(668, 811, 'monday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(669, 811, 'tuesday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(670, 811, 'wednesday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(671, 811, 'thursday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(672, 811, 'friday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(673, 811, 'saturday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(674, 811, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(675, 818, 'monday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(676, 818, 'tuesday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(677, 818, 'wednesday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(678, 818, 'thursday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(679, 818, 'friday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(680, 818, 'saturday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(681, 818, 'sunday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(682, 829, 'monday', '00:00:00', '00:00:00', 0, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(683, 829, 'tuesday', '00:00:00', '00:00:00', 1, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(684, 829, 'wednesday', '00:00:00', '00:00:00', 1, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(685, 829, 'thursday', '00:00:00', '00:00:00', 0, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(686, 829, 'friday', '00:00:00', '00:00:00', 0, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(687, 829, 'saturday', '10:00:00', '16:00:00', 1, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(688, 829, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(689, 833, 'monday', '00:00:00', '00:00:00', 0, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(690, 833, 'tuesday', '00:00:00', '00:00:00', 1, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(691, 833, 'wednesday', '00:00:00', '00:00:00', 1, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(692, 833, 'thursday', '00:00:00', '00:00:00', 1, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(693, 833, 'friday', '00:00:00', '00:00:00', 1, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(694, 833, 'saturday', '00:00:00', '00:00:00', 1, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(695, 833, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(696, 840, 'monday', '00:00:00', '00:00:00', 1, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(697, 840, 'tuesday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(698, 840, 'wednesday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(699, 840, 'thursday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(700, 840, 'friday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(701, 840, 'saturday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(702, 840, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(710, 859, 'monday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(711, 859, 'tuesday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(712, 859, 'wednesday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(713, 859, 'thursday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(714, 859, 'friday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(715, 859, 'saturday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(716, 859, 'sunday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(717, 871, 'monday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(718, 871, 'tuesday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(719, 871, 'wednesday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(720, 871, 'thursday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(721, 871, 'friday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(722, 871, 'saturday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(723, 871, 'sunday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(724, 883, 'monday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(725, 883, 'tuesday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(726, 883, 'wednesday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(727, 883, 'thursday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(728, 883, 'friday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(729, 883, 'saturday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(730, 883, 'sunday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(731, 886, 'monday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(732, 886, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(733, 886, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(734, 886, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(735, 886, 'friday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(736, 886, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(737, 886, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(738, 888, 'monday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:42', '2023-08-03 23:42:42'),
(739, 888, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(740, 888, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(741, 888, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(742, 888, 'friday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(743, 888, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(744, 888, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(745, 907, 'monday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(746, 907, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(747, 907, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(748, 907, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(749, 907, 'friday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(750, 907, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(751, 907, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(752, 910, 'monday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(753, 910, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(754, 910, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(755, 910, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(756, 910, 'friday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(757, 910, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(758, 910, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(759, 918, 'monday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(760, 918, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(761, 918, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(762, 918, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(763, 918, 'friday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(764, 918, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(765, 918, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(766, 922, 'monday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(767, 922, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(768, 922, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(769, 922, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(770, 922, 'friday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(771, 922, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(772, 922, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(773, 923, 'monday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(774, 923, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(775, 923, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(776, 923, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(777, 923, 'friday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(778, 923, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(779, 923, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(780, 930, 'monday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(781, 930, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(782, 930, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(783, 930, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(784, 930, 'friday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(785, 930, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(786, 930, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(787, 934, 'monday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(788, 934, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(789, 934, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(790, 934, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(791, 934, 'friday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(792, 934, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(793, 934, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(794, 935, 'monday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(795, 935, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(796, 935, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(797, 935, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(798, 935, 'friday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(799, 935, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(800, 935, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(801, 940, 'monday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(802, 940, 'tuesday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(803, 940, 'wednesday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(804, 940, 'thursday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(805, 940, 'friday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(806, 940, 'saturday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(807, 940, 'sunday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(808, 942, 'monday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(809, 942, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(810, 942, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(811, 942, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(812, 942, 'friday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(813, 942, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(814, 942, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(815, 944, 'monday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(816, 944, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(817, 944, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(818, 944, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(819, 944, 'friday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(820, 944, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(821, 944, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(822, 949, 'monday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(823, 949, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(824, 949, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(825, 949, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(826, 949, 'friday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(827, 949, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(828, 949, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(829, 954, 'monday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(830, 954, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(831, 954, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(832, 954, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(833, 954, 'friday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(834, 954, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(835, 954, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(836, 955, 'monday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(837, 955, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(838, 955, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(839, 955, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(840, 955, 'friday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(841, 955, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(842, 955, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(843, 961, 'monday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(844, 961, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(845, 961, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(846, 961, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(847, 961, 'friday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(848, 961, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(849, 961, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(850, 962, 'monday', '00:00:00', '00:00:00', 0, '2023-09-08 18:36:11', '2023-09-08 18:36:11');

-- --------------------------------------------------------

--
-- Table structure for table `payment_request`
--

CREATE TABLE `payment_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(56) NOT NULL COMMENT 'partner | customer',
  `payment_address` varchar(1024) NOT NULL,
  `amount` double NOT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0-pending | 1- approved|2-rejected',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `promo_code` varchar(28) NOT NULL,
  `message` varchar(512) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `no_of_users` int(11) DEFAULT NULL,
  `minimum_order_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `discount_type` varchar(32) DEFAULT NULL,
  `max_discount_amount` double DEFAULT NULL,
  `repeat_usage` tinyint(4) NOT NULL,
  `no_of_repeat_usage` int(11) DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Table structure for table `queue_jobs`
--

CREATE TABLE `queue_jobs` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `queue` varchar(64) NOT NULL,
  `payload` mediumtext NOT NULL,
  `priority` varchar(64) NOT NULL DEFAULT 'default',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_jobs_failed`
--

CREATE TABLE `queue_jobs_failed` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `connection` varchar(64) NOT NULL,
  `queue` varchar(64) NOT NULL,
  `payload` mediumtext NOT NULL,
  `priority` varchar(64) NOT NULL DEFAULT 'default',
  `exception` mediumtext NOT NULL,
  `failed_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reasons_for_report_and_block_chat`
--

CREATE TABLE `reasons_for_report_and_block_chat` (
  `id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `needs_additional_info` text NOT NULL,
  `type` enum('admin','provider') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1024) NOT NULL,
  `section_type` varchar(1024) NOT NULL,
  `category_ids` varchar(255) DEFAULT NULL,
  `partners_ids` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` text NOT NULL,
  `limit` text NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `banner_type` text DEFAULT NULL,
  `banner_url` text DEFAULT NULL,
  `app_banner_image` text DEFAULT NULL,
  `web_banner_image` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `title`, `section_type`, `category_ids`, `partners_ids`, `created_at`, `updated_at`, `status`, `limit`, `rank`, `banner_type`, `banner_url`, `app_banner_image`, `web_banner_image`, `description`) VALUES
(85, 'Home Care Services', 'categories', '220,218,217,216,215', NULL, '2022-11-03 11:01:08', '2025-06-11 13:14:30', '1', '', 8, NULL, NULL, NULL, NULL, 'Reliable Solutions for a Clean, Safe, and Comfortable Home!'),
(87, 'Laundry & Cleaning Services', 'categories', '239,238,237,236,235', NULL, '2022-11-03 11:06:42', '2025-06-11 13:14:30', '1', '', 11, NULL, NULL, NULL, NULL, 'Fresh, Spotless, and Hassle-Free—We Do the Dirty Work for You!'),
(88, 'Plumbing Solutions', 'categories', '245,244,243,242,241', NULL, '2022-11-03 11:13:49', '2025-06-11 13:14:30', '1', '', 4, NULL, NULL, NULL, NULL, 'Reliable Repairs & Expert Maintenance for Every Leak and Clog!'),
(89, 'Auto Repair & Maintenance', 'categories', '234,232,230,228', NULL, '2022-11-03 11:19:49', '2025-06-11 13:14:30', '1', '', 3, NULL, NULL, NULL, NULL, 'Keep Your Ride Running: Top Auto Repair & Maintenance Services!'),
(97, 'Local Experts Nearby', 'near_by_provider', NULL, '327,303,273,263,204', '2023-07-13 09:12:32', '2025-06-11 13:14:30', '1', '', 6, NULL, NULL, NULL, NULL, 'Trusted Professionals Ready to Assist You Anytime, Anywhere!'),
(100, 'Elite Providers', 'top_rated_partner', NULL, NULL, '2023-09-27 09:10:26', '2025-06-11 13:14:30', '1', '10', 10, NULL, NULL, NULL, NULL, 'Top-Rated Experts Delivering Premium Services Just for You!'),
(101, 'Recently Booked', 'previous_order', NULL, NULL, '2024-02-12 18:19:27', '2025-06-11 13:14:30', '1', '3', 7, NULL, NULL, NULL, NULL, 'Your Past Bookings at a Glance for Quick & Easy Rebooking!'),
(102, 'Featured Ad Providers', 'partners', NULL, '327,303,301,298,293,283,273,271,270,263,260,50', '2024-09-02 11:44:24', '2025-06-11 13:14:30', '1', '0', 2, NULL, NULL, NULL, NULL, 'Top Ad Providers: Boost Your Brand with the Best!'),
(103, '', 'banner', NULL, NULL, '2024-11-08 09:43:56', '2025-06-11 13:14:30', '1', '0', 9, 'banner_url', 'https://edemandweb.wrteam.me/become-provider', '1743243728_f19feaf17aa2065a5d7f.png', '1743249651_50887464c31e2be8fcf9.png', 'Become Provider\r\n'),
(104, '', 'banner', NULL, '293', '2024-11-08 09:47:15', '2025-06-11 13:14:30', '1', '0', 5, 'banner_provider', NULL, '1743169679_541348205b2b74039d25.png', '1743246583_9cbb7df971f61e6d9e82.png', 'Provider\r\n'),
(105, '', 'banner', NULL, NULL, '2024-11-08 09:47:48', '2025-06-11 13:14:30', '1', '0', 12, 'banner_url', 'https://codecanyon.net/item/edemand-multi-vendor-on-demand-home-doorstep-services-marketplace-with-flutter-app-admin-panel/40825792?irgwc=1&clickid=0z3RVPXjNxyPUEX0ay2aXQiVUkC0neXVqx7rSM0&iradid=275988&irpid=2430794&iradtype=ONLINE_TRACKING_LINK&irmptype=mediapartner&mp_value1=&utm_campaign=af_impact_radius_2430794&utm_medium=affiliate&utm_source=impact_radius', '1743494229_376bf62ec2d62f071b8d.png', '1743492664_5ce7cdde9d85deaac0fa.png', 'Banner\r\n'),
(106, '', 'banner', '282', NULL, '2025-06-11 13:09:43', '2025-06-11 13:14:30', '1', '0', 1, 'banner_category', NULL, '1749627583_0764dd86547b6a49fee7.png', '1749627583_ac15f3feca139786f372.jpeg', 'Test'),
(107, '', 'banner', '282', NULL, '2025-06-11 17:44:33', '2025-06-11 17:44:33', '1', '0', 13, 'banner_category', NULL, '1749644073_8e6a2affb2c16c99dd03.png', '1749644073_494c4337638c2f58b135.jpeg', 'testing');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'partner_id',
  `category_id` int(11) NOT NULL,
  `tax_type` varchar(20) NOT NULL DEFAULT ' included',
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `tax` float NOT NULL,
  `title` varchar(2048) NOT NULL,
  `slug` varchar(2048) NOT NULL,
  `description` text NOT NULL,
  `tags` text NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `price` double NOT NULL,
  `discounted_price` double NOT NULL DEFAULT 0,
  `number_of_members_required` int(11) NOT NULL DEFAULT 1 COMMENT 'No of members required to perform service',
  `duration` varchar(128) NOT NULL COMMENT 'in minutes',
  `rating` double NOT NULL DEFAULT 0 COMMENT 'Average rating',
  `number_of_ratings` double NOT NULL DEFAULT 0,
  `on_site_allowed` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 - not allowed | 1 - allowed',
  `is_cancelable` tinyint(1) NOT NULL DEFAULT 0,
  `cancelable_till` varchar(200) NOT NULL,
  `max_quantity_allowed` int(11) NOT NULL DEFAULT 0 COMMENT '0 - unlimited | number - limited qty',
  `is_pay_later_allowed` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 - not allowed | 1 - allowed',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 - deactive | 1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `long_description` longtext NOT NULL,
  `other_images` text NOT NULL,
  `files` text NOT NULL,
  `faqs` text NOT NULL,
  `at_store` text DEFAULT NULL,
  `at_doorstep` text DEFAULT NULL,
  `approved_by_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `category_id`, `tax_type`, `tax_id`, `tax`, `title`, `slug`, `description`, `tags`, `image`, `price`, `discounted_price`, `number_of_members_required`, `duration`, `rating`, `number_of_ratings`, `on_site_allowed`, `is_cancelable`, `cancelable_till`, `max_quantity_allowed`, `is_pay_later_allowed`, `status`, `created_at`, `updated_at`, `long_description`, `other_images`, `files`, `faqs`, `at_store`, `at_doorstep`, `approved_by_admin`) VALUES
(41, 327, 255, 'included', 6, 0, 'Switch and Socket', 'switch-and-socket', 'Professional replacement and repair services for switches and sockets to ensure safety and functionality in your home or office.', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity,switch,socket,Electrical Repair,Switch Replacement,Socket Repair,Electrical Maintenance,Home Repair', 'public/uploads/services/1667566610_ec8b7b023f74b6fd16a9.jpg', 100, 80, 1, '120', 0, 0, 1, 0, '', 10, 1, 1, '2022-11-04 12:56:50', '2025-05-19 10:47:30', '<p>Our <strong data-start=\"534\" data-end=\"579\">Switch and Socket Replacement &amp; Repairing</strong> service offers expert solutions for faulty or outdated switches and sockets in your home or office. Whether it&rsquo;s a single switch replacement, socket repair, or complete upgrade, our licensed electricians ensure that all work complies with safety standards. Faulty switches and sockets are not only inconvenient, they can also pose serious electrical hazards. Our team provides reliable, efficient, and cost-effective services to fix or replace any malfunctioning electrical components in your space.</p>', '', '', '{\"1\":[\"How do I know if my switch or socket needs to be replaced?\",\"Signs include flickering lights, sparks, or a loose connection. If you hear buzzing sounds or smell burning, it\\u2019s time to call an electrician immediately.\"],\"2\":[\"Is there a warranty on the replacement or repair?\",\"Yes, we offer a 6-month warranty on all replacement switches and sockets for peace of mind.\"],\"3\":[\"\",\"\"],\"4\":[\"Can I continue using the socket or switch until it\\u2019s repaired?\",\"We recommend turning off the power to the faulty switch or socket for safety until a professional arrives.\"],\"5\":[\"Can I choose the type of switch or socket I want installed?\",\"Yes, we offer a variety of switches and sockets, from standard to smart devices. You can select the type that fits your needs and style preferences.\"]}', '1', '1', 1),
(42, 327, 254, 'included', 16, 0, 'Fan Installation & Repair', 'fan-installation-repair', 'Professional fan installation and repair services for ceiling fans, exhaust fans, and other types of fans to ensure smooth operation and efficiency.Best and quick electricity services on your location', 'electrician,electronic,electronics,electric,maintenance,electrical,electricity,fan,Fan Repair,Electrical Services,Ceiling Fan,Exhaust Fan,Home Repair', 'public/uploads/services/1667630682_53ce00a077c9d1867908.jpg', 40, 35, 1, '30', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:44:42', '2025-05-19 10:58:10', '<p>Our<strong> </strong>Fan Installation &amp; Repair service provides expert installation, repair, and maintenance of various types of fans, including ceiling fans, exhaust fans, and stand-alone fans. Whether you\'re upgrading your home, office, or outdoor space, our licensed electricians ensure the fan is installed correctly and functions efficiently. We also offer repair services for malfunctioning fans, addressing issues like motor failure, noisy operation, or damaged wiring.</p>', '', '', '{\"1\":[\"What types of fans do you install or repair?\",\"We install and repair ceiling fans, exhaust fans, wall-mounted fans, and stand-alone fans in residential and commercial settings.\"],\"2\":[\"How long does fan installation take?\",\"Installation usually takes 1\\u20132 hours, depending on the type of fan and complexity of the setup.\"],\"3\":[\"Can you repair fans that aren\\u2019t working?\",\"Yes, our electricians can repair most fan types, including fixing speed issues, motor failures, and electrical wiring problems.\"],\"4\":[\"Do you provide energy-efficient fan options?\",\"Yes, we offer energy-efficient fans that can reduce your electricity bills. You can choose from a range of models that fit your needs\"]}', '1', '1', 1),
(43, 327, 252, 'included', 7, 0, 'Lighting Installation & Repair', 'lighting-installation-repair', 'Professional installation and repair services for ceiling lights, lamps, and decorative lighting to enhance the ambiance and functionality of your space.', 'electrician,electronic,electronics,electric,maintenance,electrical,electricity,light,Lighting Installation,Lamp Repair,Home Lighting,Ceiling Lights,LED Lights,Decorative Lights,Electrical Services', 'public/uploads/services/1667630773_4783612212fd63c98b0a.jpg', 50, 45, 1, '30', 0, 0, 1, 0, '', 10, 1, 1, '2022-11-05 06:46:13', '2025-05-19 11:06:59', '<p>Our Lighting Installation &amp; Repair service provides expert solutions for installing and repairing various types of lighting, including ceiling lights, wall-mounted lamps, LED lights, pendant lights, and more. Whether you want to upgrade your home with new lighting fixtures or need repairs for your existing lamps and lights, our licensed electricians are here to ensure that your lighting works efficiently and safely. We install all types of lighting with precision and provide repair services for issues like flickering lights, faulty wiring, or switch problems.</p>', '', '', '{\"1\":[\"Do you offer smart lighting installation?\",\"Yes, we can install smart lights and integrate them with home automation systems for added convenience.\"],\"2\":[\"How long does it take to install a light fixture?\",\"Installation typically takes about 30\\u201360 minutes per fixture, depending on the complexity of the setup and wiring.\"],\"3\":[\"Can you repair old, damaged lights?\",\"Yes, we repair most common lighting issues, including faulty wiring, flickering, and broken switches.\"],\"4\":[\"Are LED lights worth installing?\",\"Yes! LED lights are energy-efficient and long-lasting, reducing electricity bills while providing high-quality lighting.\"]}', '1', '1', 1),
(44, 327, 252, 'included', 7, 0, 'MCB & Fuse Installation & Repair', 'mcb-fuse', 'Professional installation and repair services for MCBs (Miniature Circuit Breakers) and fuses to ensure the safety and functionality of your electrical circuits.', 'electrician,electronic,electronics,electric,maintenance,electricity,MCB Installation,Fuse Repair,Electrical Circuit,Circuit Breaker,Home Wiring,Electrical Services', 'public/uploads/services/1667630851_2b94161f1427d8482278.jpg', 100, 90, 1, '60', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:47:31', '2025-05-19 11:10:20', '<p>Our MCB &amp; Fuse Installation &amp; Repair service provides expert solutions for the installation, repair, and replacement of Miniature Circuit Breakers (MCBs) and fuses in your electrical system. MCBs are crucial for preventing electrical overloads and short circuits, protecting your home or office from electrical hazards. Similarly, fuses help prevent circuit damage caused by overcurrent, and we ensure that they are correctly installed or replaced to keep your electrical system safe.</p>', '', '', '{\"1\":[\"What is the difference between an MCB and a fuse?\",\"An MCB is a switch that automatically turns off the circuit during an overload or short circuit, whereas a fuse is a safety device that breaks the circuit when the current exceeds a certain level. MCBs are reusable, whereas fuses need to be replaced after they blow.\"],\"2\":[\"How do I know if my MCB or fuse needs to be replaced?\",\"Frequent tripping of the MCB or blown fuses are common signs that it\\u2019s time for replacement or repair. If circuits fail to work properly, or you notice overheating, it\\u2019s time to check your MCB and fuses.\"],\"3\":[\"Can you install MCBs in an old electrical panel?\",\"Yes, we can upgrade older electrical panels to accommodate modern MCBs, enhancing safety and functionality.\"],\"4\":[\"How often should I replace my fuses or MCBs?\",\"MCBs typically last a long time, but fuses may need to be replaced more frequently, especially if they blow due to electrical overload. Regular inspection is recommended to ensure they are functioning properly.\"]}', '1', '1', 1),
(45, 327, 252, 'included', 7, 0, 'Appliance Installation & Repair', 'appliance', 'Professional installation and repair services for home appliances like refrigerators, washing machines, microwave ovens, and other electrical devices.', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity,Appliance,ppliance Installation,Home Appliance Repair,Electrical Appliances,Refrigerator Repair,Washing Machine Repair,Kitchen Appliances', 'public/uploads/services/1667631013_1b951d37371fe32bf4e5.jpg', 100, 90, 1, '120', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:50:13', '2025-05-19 11:12:52', '<p>Our Appliance Installation &amp; Repair service offers expert installation, repair, and maintenance of a wide range of home appliances to keep them functioning smoothly. Whether you need a new appliance installed, an old one repaired, or regular maintenance to extend the lifespan of your equipment, our licensed technicians are here to help. We specialize in repairing appliances such as refrigerators, washing machines, microwaves, dishwashers, and more, ensuring they operate efficiently and safely.</p>', '', '', '{\"1\":[\"How do I know if my appliance needs repair or replacement?\",\"If your appliance is not working efficiently, making strange noises, leaking, or showing error codes, it may need repair. If it\\u2019s more than 8\\u201310 years old and frequently breaking down, it might be time to consider replacement.\"],\"2\":[\"Do I need to provide any tools or parts for the repair?\",\"No, we bring all necessary tools and parts to perform the repair. In some cases, we may need to order specific parts, which could take additional time.\"],\"3\":[\"Can you repair all types of home appliances?\",\"We specialize in repairing most home appliances, including refrigerators, washing machines, ovens, dishwashers, microwave ovens, and more. For more specialized appliances, please contact us for confirmation\"],\"4\":[\"Is there a warranty on the repairs?\",\"Yes, we offer a 3-month warranty on repairs to ensure your appliance is working properly after service. If the issue persists within this time, we\\u2019ll fix it at no additional cost.\"]}', '1', '1', 1),
(46, 327, 252, 'included', 7, 0, 'Wiring Installation & Repair', 'wiring', 'Professional installation, repair, and maintenance services for electrical wiring in residential and commercial properties to ensure safe and efficient power distribution.', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity,wiring,Electrical Wiring,Home Wiring,Wiring Installation,Electrical Repair,Circuit Wiring,Residential Wiring,Commercial Wiring', 'public/uploads/services/1667631101_107c2700eb90d43c423c.jpg', 200, 180, 2, '60', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:51:41', '2025-05-19 11:39:02', '<p>Our Wiring Installation &amp; Repair service ensures that your electrical wiring is safe, reliable, and up to code. Whether you need new wiring installed for a renovation, repairs for damaged wiring, or routine maintenance, our licensed electricians have the skills and experience to handle it all. We specialize in both residential and commercial wiring, offering services for lighting, power distribution, and circuit connections.</p>', '', '', '{\"1\":[\"How do I know if my wiring needs to be replaced?\",\"If you notice frequent electrical problems like tripped circuit breakers, flickering lights, or outlets that feel warm to the touch, it may be time to replace the wiring.\"],\"2\":[\"Can you rewire my entire house?\",\"Yes, we offer full rewiring services for homes and offices, which is especially recommended for older buildings with outdated wiring.\"],\"3\":[\"How long does wiring installation or repair take?\",\"The time required depends on the size of the area and the complexity of the work. Typically, installation or repair can take anywhere from a few hours to a few days for large projects.\"],\"4\":[\"Is my electrical system safe if the wiring is old?\",\"Older wiring may pose safety risks, such as electrical fires. We recommend having your system inspected and, if necessary, rewired to meet modern safety standards.\"]}', '1', '1', 1),
(47, 260, 252, 'included', 9, 0, 'Ceiling fan repair', 'ceiling-fan-repair', ' Professional repair services for ceiling fans, addressing issues like malfunctioning motors, faulty wiring, and noisy operation.', 'fan,celling fan,Ceiling Fan Repair,Fan Issues,Electrical Repair,Fan Maintenance,Ceiling Fan Troubleshooting', 'public/uploads/services/1667807249_bd5ce6baf3f0693c17c7.jpg', 600, 480, 25, '160', 4.5555555555556, 9, 1, 1, '30', 23, 1, 1, '2022-11-07 07:47:29', '2025-05-19 11:47:25', '<p>Our Ceiling Fan Repair service ensures that your ceiling fans run smoothly and efficiently. Ceiling fans are essential for comfort, but when they malfunction, it can cause discomfort and frustration. Whether your fan is not spinning, making noise, wobbling, or not working at all, our skilled technicians can diagnose and repair the issue. We specialize in motor repairs, speed control problems, and electrical issues, ensuring your fan works as good as new.</p>', '', '', '{\"1\":[\"How do I know if my ceiling fan needs repair?\",\"Common signs include unusual noises, the fan not spinning or operating at the correct speed, flickering lights (if attached), or the fan wobbling.\"],\"2\":[\"Is it safe to repair my ceiling fan myself?\",\"Ceiling fans contain electrical components that can be hazardous if handled improperly. It\'s best to hire a professional to avoid injury or damage.\"],\"3\":[\"How long will it take to repair my ceiling fan?\",\"Ceiling fan repairs generally take about 1\\u20132 hours, depending on the complexity of the issue. More extensive repairs may take longer.\"],\"4\":[\"Do you repair all types of ceiling fans?\",\"Yes, we repair a variety of ceiling fan brands and models, including standard, remote-controlled, and smart ceiling fans. If you have a specific type, feel free to inquire.\"]}', '1', '1', 1),
(48, 260, 253, 'included', 6, 0, 'Outdoor Lighting Installation', 'outdoor-lighting-1', 'Professional installation of outdoor lighting to enhance the safety, ambiance, and aesthetic of your outdoor spaces.', 'outdoor,electronic,service,electronic service,lightting,Outdoor Lighting,Landscape Lighting,Garden Lights,Pathway Lights,Yard Lighting,Exterior Lighting', 'public/uploads/services/1667812651_5cdc2a7156532b4faf94.jpg', 200, 160, 6, '260', 5, 10, 1, 0, '', 6, 1, 1, '2022-11-07 09:17:31', '2025-05-19 11:42:59', '<p>Our Outdoor Lighting Installation service helps transform your yard, garden, pathway, or patio into a beautifully lit and functional space. Outdoor lighting not only improves security but also enhances the beauty and functionality of your home&rsquo;s exterior. Whether you need lights for a garden, pathway, driveway, or patio, our experts will ensure proper placement and installation to highlight architectural features and ensure safe passage.</p>', '', '', '[[\"What types of outdoor lighting do you install?\",\"We install a wide range of outdoor lighting, including pathway lights, garden lights, landscape lighting, security lights, and more. We also offer solar-powered options.\"],[\"How long does it take to install outdoor lighting?\",\"The installation typically takes 2\\u20134 hours, depending on the number of lights and complexity of the layout. Larger projects may take longer.\"],[\"Can you install outdoor lighting for security purposes?\",\"Yes, we specialize in installing motion-sensor and flood lights to enhance security around your home.\"],[\"Are the lights weather-resistant?\",\"Yes, all our outdoor lights are designed to withstand outdoor conditions and are rated for wet environments to ensure durability.\"]]', '1', '1', 1),
(49, 260, 252, 'included', 6, 0, 'Socket Switch Installation', 'socket-switch-installation', 'Professional installation of power sockets and switches to enhance the functionality and safety of your home or office electrical system.', 'Socket,Switch,Electronic service,installation,Electrical Installation,Switch Installation,Socket Installation,Home Electrical,Electrical Setup,Power Outlets', 'public/uploads/services/1667812954_6433be8661a014cc913c.jpg', 150, 105, 2, '160', 5, 5, 0, 0, '', 5, 1, 1, '2022-11-07 09:22:34', '2025-05-19 11:56:10', '<p>Our Socket &amp; Switch Installation service ensures that your electrical outlets and switches are safely and efficiently installed. Whether you\'re remodeling your space or need to add more outlets, our licensed electricians can install or replace sockets and switches to meet your needs. We provide solutions for everything from standard power outlets to specialized switches for lights, fans, or appliances. With our expertise, we ensure proper placement, wiring, and safety standards, so you can have peace of mind knowing your home or office is powered correctly.</p>', '', '', '{\"1\":[\"Can I choose the type of socket or switch to be installed?\",\"Yes, you can select from a variety of switches and sockets, including dimmers, safety sockets, and standard outlets. We also offer modern designs to match your home decor.\"],\"2\":[\"Do I need to turn off the power before the installation?\",\"Yes, for safety reasons, the power will be turned off during installation, and our electricians will ensure all safety precautions are followed.\"],\"3\":[\"How long does it take to install a socket or switch?\",\"Each socket or switch installation typically takes about 30\\u201345 minutes. More complex installations may take longer.\"],\"4\":[\"Do you offer services for outdoor socket and switch installation?\",\"Yes, we install outdoor sockets and switches for garden lights, outdoor fans, and other external appliances. These are installed with weather-resistant fittings to ensure durability.\"]}', '1', '1', 1),
(50, 260, 252, 'included', 6, 0, 'Security System Installation', 'security-system-installation', 'Professional installation of security systems including CCTV cameras, alarm systems, motion sensors, and other home or office security solutions to keep your property safe.', 'security,security System,Electronic service,service,Security Systems,Surveillance,CCTV Installation,Alarm Systems,Home Security,Motion Sensors,Home Protection', 'public/uploads/services/1667813924_066b314484e34db47956.jpg', 500, 400, 5, '160', 5, 10, 1, 0, '', 2, 1, 1, '2022-11-07 09:38:44', '2025-05-19 11:59:51', '<p>Our Security System Installation service provides complete solutions to protect your home, office, or commercial property. Whether you need a simple CCTV camera setup, a complete alarm system, or advanced motion detection devices, we offer top-tier installations that ensure safety and peace of mind. We use the latest technology in security systems to provide reliable and efficient protection against intruders, fire hazards, and other emergencies. Our team of experts will assess your space and recommend the best security setup tailored to your needs.</p>', '', '', '{\"1\":[\"What type of security systems do you install?\",\"We install CCTV cameras, alarm systems, motion sensors, smart security systems, and access control systems tailored to your security needs.\"],\"2\":[\"Can I monitor my security system remotely?\",\"Yes, with our smart security systems, you can monitor your property from anywhere using your smartphone, tablet, or computer.\"],\"3\":[\"How long does it take to install a security system?\",\"A standard CCTV installation takes approximately 2-3 hours. More complex systems like alarm and access control installations may take longer, typically 4-6 hours, depending on the setup.\"],\"4\":[\"Is there a warranty on the security system?\",\"Yes, we provide a 1-year warranty on the installation and any installed equipment, covering defects and issues caused by improper installation.\"]}', '1', '1', 1),
(51, 260, 252, 'included', 11, 0, 'Ground Wiring Installation & Repair', 'ground-wiring', ' Professional installation and repair services for ground wiring to ensure electrical safety and prevent electrical hazards in your home or office.', 'Ground wiring,ground wire,electronic service,Grounding,Electrical Safety,Electrical Repair,Home Electrical,Wiring Solutions', 'public/uploads/services/1667814211_af672b623b6cdcd2968a.jpg', 600, 480, 5, '240', 5, 10, 1, 0, '', 2, 1, 1, '2022-11-07 09:43:31', '2025-05-19 12:02:21', '<p>Our Ground Wiring Installation &amp; Repair service is designed to provide safe and efficient grounding solutions for your electrical system. Proper grounding is essential to protect your home or office from electrical surges, faults, and lightning strikes. We offer expert installation of ground wiring for new builds, as well as repairs and upgrades for existing systems to comply with current safety standards. Our electricians ensure that all work is done with the utmost care and precision, preventing electrical hazards and ensuring peace of mind.</p>', '', '', '{\"1\":[\"Why is ground wiring necessary for my home or office?\",\"Ground wiring is essential for electrical safety. It helps prevent electrical shocks, protects electrical appliances from damage caused by surges, and ensures compliance with electrical safety codes.\"],\"2\":[\"How do I know if my home\\u2019s ground wiring is outdated or faulty?\",\"If you notice frequent electrical issues, such as circuit breakers tripping, tingling sensations when touching appliances, or electrical surges, it may indicate a problem with your grounding system.\"],\"3\":[\"Can I upgrade my existing electrical system to include proper ground wiring?\",\"Yes, we can upgrade your current system to include proper ground wiring and ensure it meets modern electrical safety standards.\"],\"4\":[\"Is ground wiring required for all electrical installations?\",\"Yes, ground wiring is required for all new electrical systems and should be included in older systems that are being upgraded or renovated to meet current safety standards.\"]}', '1', '1', 1),
(57, 263, 240, 'included', 10, 0, 'Water Leak Detection & Repair', 'water-leaks', ' Professional water leak detection and repair services to prevent water damage and ensure the integrity of your plumbing system.', 'Water Leaks', 'public/uploads/services/1667817381_a04e80dc05b18e88d073.jpg', 300, 240, 3, '60', 0, 0, 0, 0, '', 5, 1, 1, '2022-11-07 10:36:21', '2025-05-19 12:06:54', '<p>Our Water Leak Detection &amp; Repair service helps identify and fix water leaks in your home or office to prevent costly water damage and ensure the efficiency of your plumbing system. Water leaks can occur in pipes, faucets, water heaters, and other plumbing fixtures, causing significant damage if left unaddressed. Using advanced tools and techniques, we quickly locate hidden leaks and provide reliable repair solutions to fix them, ensuring that your plumbing system is leak-free and operating efficiently.</p>', '', '', '{\"1\":[\"How do I know if I have a water leak?\",\"Signs include unusually high water bills, damp spots on walls or ceilings, musty odors, water stains, or sounds of running water when no fixtures are in use.\"],\"2\":[\"Can water leaks be hidden in walls or under floors?\",\"Yes, leaks can often be hidden in walls, ceilings, or under floors, making them hard to detect without specialized equipment like infrared cameras.\"],\"3\":[\"How long does it take to detect and repair a water leak?\",\"Leak detection usually takes 1-2 hours, and repairs may take an additional 1-3 hours depending on the severity and location of the leak.\"],\"4\":[\"Are the repairs permanent?\",\"Yes, we provide long-lasting repairs using high-quality materials to ensure that the leak does not return. We also offer preventative maintenance to help avoid future leaks.\"]}', '1', '1', 1),
(58, 263, 240, 'included', 10, 0, 'Bathroom installation', 'bathroom-installation', 'Professional bathroom installation services, from complete renovations to installing new fixtures, to transform your bathroom into a functional and stylish space.', 'Bathroom installation,plumbing service,Plumbing,Shower Installation,Bathroom Renovation,Toilet Installation,Home Improvement', 'public/uploads/services/1667817654_d812ae041106b98c86db.jpg', 200, 100, 2, '60', 5, 4, 1, 0, '', 5, 1, 1, '2022-11-07 10:40:54', '2025-05-19 12:15:11', '<p>Our<strong> </strong>Bathroom Installation service provides comprehensive solutions for designing and installing everything from a brand-new bathroom to complete renovations. Whether you are looking to upgrade your existing bathroom or create a completely new one, we offer expert installation of all plumbing fixtures, including toilets, sinks, showers, bathtubs, faucets, and storage solutions. Our team ensures that all installations comply with safety standards and provide you with a bathroom that meets your needs and aesthetic preferences.</p>', '', '', '{\"1\":[\"How long does it take to install a new bathroom?\",\"The installation typically takes 3-5 days, depending on the complexity of the project, the number of fixtures, and the overall design.\"],\"2\":[\"Can I customize the design of my bathroom?\",\"Yes, we offer full customization to suit your needs and style preferences. You can choose your fixtures, tiles, vanities, and layout.\"],\"3\":[\"Are plumbing and electrical work included in the installation?\",\"Yes, all necessary plumbing and electrical work is included in our bathroom installation services, ensuring everything functions correctly.\"],\"4\":[\"Can you help with bathroom renovations for small spaces?\",\"Absolutely! We specialize in making the most out of small spaces and can help you design a bathroom that maximizes space and functionality.\"]}', '1', '1', 1),
(59, 263, 240, 'included', 10, 0, 'Wall Pump Repair', 'wall-pump-repair', 'Professional repair services for wall-mounted water pumps to restore functionality and ensure efficient water supply in your home or office.', 'wall pump repair,pump repair,wall pump,Water Pump,Plumbing Repair,Water Supply,Pump Maintenance', 'public/uploads/services/1667817780_bb74c7e936e04e13b052.jpg', 350, 280, 5, '60', 5, 2, 0, 0, '', 2, 1, 1, '2022-11-07 10:43:00', '2025-05-19 12:18:50', '<p>Our Wall Pump Repair service is designed to address issues with wall-mounted water pumps, ensuring that your water supply is efficient and reliable. Wall pumps are crucial for maintaining water pressure and providing a steady flow of water throughout your property. If your pump is malfunctioning, making strange noises, or not providing adequate water pressure, our experts can quickly diagnose and repair the problem. We specialize in a range of wall pumps, from simple manual pumps to advanced electric models, ensuring a prompt and effective solution to your water supply issues.</p>', '', '', '[[\"How do I know if my wall pump needs repair?\",\"Signs include inconsistent water pressure, strange noises, no water flow, or frequent pump cycling without consistent water delivery.\"],[\"How long does wall pump repair take?\",\"Simple repairs can be completed in 1\\u20132 hours, while more complex repairs or replacements (e.g., motor replacement) may take up to 3\\u20134 hours.\"],[\"Can you repair all types of wall pumps?\",\"Yes, we repair most types of wall-mounted pumps, including manual, electric, and pressure pumps. We will assess the problem and provide a solution that fits your specific pump type.\"],[\"How often should I service my wall pump?\",\"We recommend servicing your wall pump at least once a year to ensure its longevity and prevent unexpected breakdowns.\"]]', '1', '1', 1),
(60, 263, 240, 'included', 10, 0, 'Water Heater Repair', 'water-heater-repair', 'Professional repair services for water heaters to restore hot water supply and ensure efficient functioning of your heating system.\r\n\r\n', 'Water Heater Repair', 'public/uploads/services/1667818090_8980b9669917c7cfb640.jpg', 200, 180, 5, '60', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-07 10:48:10', '2025-05-19 12:21:11', '<p>Our Water Heater Repair service is designed to fix any issues with your water heater and restore your access to hot water. Whether you have a traditional tank water heater or a modern tankless model, we specialize in diagnosing and repairing a wide range of issues, including heating problems, leaks, and electrical faults. We use advanced tools and techniques to ensure your water heater is repaired efficiently, helping you avoid the cost of a full replacement and ensuring that your water heater is functioning at its best.</p>', '', '', '{\"1\":[\"How do I know if my water heater needs repair?\",\"Common signs include no hot water, inconsistent hot water temperature, strange noises (such as popping or rumbling), leaks around the base of the unit, or an increase in your energy bills.\"],\"2\":[\"How long does a water heater repair take?\",\"Most repairs can be completed within 1-2 hours, though more complex issues like replacing heating elements or repairing leaks may take longer.\"],\"3\":[\"Can you repair both tank and tankless water heaters?\",\"Yes, we repair both traditional tank-style water heaters and tankless models, handling issues specific to each system.\"],\"4\":[\"How often should I service my water heater?\",\"To maintain efficiency and prevent breakdowns, it\\u2019s recommended to have your water heater inspected and maintained at least once a year, particularly for older units.\"]}', '1', '1', 1),
(61, 263, 245, 'included', 10, 0, 'Shower Installation', 'shower-installation', 'Professional shower installation services, from installing standard showers to custom-designed units, ensuring proper plumbing, safety, and style.', 'Shower Instsllation,plumbing service,shower,hower Installation,Bathroom Renovation,Plumbing Services,Shower Systems,Bathroom Fixtures', 'public/uploads/services/1667818247_fdae48938be5e6f999ff.jpg', 200, 140, 2, '60', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-07 10:50:47', '2025-05-20 06:29:21', '<p>Our Shower Installation service provides expert solutions for installing a wide variety of shower systems in your bathroom. Whether you\'re renovating your bathroom, adding a new shower, or upgrading your current unit, our team ensures precise installation that meets your plumbing and aesthetic requirements. From traditional shower setups to modern walk-in showers, steam showers, or custom enclosures, we handle it all. We ensure that all plumbing connections are made securely, tiles are laid neatly, and all systems are set up for optimal water flow and drainage.</p>', '', '', '[[\"How long does shower installation take?\",\"A standard shower installation typically takes 1-2 hours, while more complex installations (like walk-in showers or custom enclosures) can take up to 1\\u20132 days.\"],[\"Do I need to purchase the shower system, or do you provide it?\",\"We can install a system that you provide, or we can help you select a high-quality shower system that fits your needs and budget.\"],[\"Can you install showers in small bathrooms?\",\"Yes, we specialize in maximizing space in smaller bathrooms and can install showers that fit in compact areas, including corner showers and walk-ins.\"],[\"What kind of maintenance does a new shower require?\",\"After installation, regular cleaning and checking for leaks are recommended. If you have a custom shower system, periodic maintenance on the valves and faucet system will ensure it continues to operate efficiently.\"]]', '1', '1', 1),
(62, 270, 259, 'included', 11, 0, 'Car Service', 'car-service', ' From routine maintenance to complex repairs, our car service offers expert solutions, ensuring your vehicle stays in excellent condition and on the road with confidence.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667882464_056b252e18b85cb59752.jpg', 250, 200, 2, '160', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-08 04:30:11', '2025-05-20 06:31:27', '<p>Our Car Service provides full maintenance and repair solutions to ensure your vehicle stays in top condition. Regular car servicing is essential to prolong the life of your vehicle and ensure that it operates safely and efficiently. Whether it\'s an oil change, brake check, tire replacement, or a full diagnostic, our expert mechanics offer reliable and affordable services for all makes and models. We use high-quality parts and the latest diagnostic tools to identify and fix issues before they become major problems.</p>', '[\"public\\/uploads\\/services\\/1688989712_57b58c1264fa09699e3f.jpg\",\"public\\/uploads\\/services\\/1688989712_a3d96f656853b44fd170.jpg\",\"public\\/uploads\\/services\\/1688989712_02251ea187acff43cc9b.jpg\",\"public\\/uploads\\/services\\/1688989712_9af9988acf9fe1372deb.jpg\"]', '', '[[\"How often should I get an oil change?\",\"It is generally recommended to get an oil change every 3,000 to 5,000 miles or as advised by your vehicle\'s manufacturer.\"],[\"What are the signs that my brakes need to be replaced?\",\"Warning signs of worn-out brakes include squeaking or grinding noises, reduced braking power, vibrating brake pedal, or the brake warning light illuminated on the dashboard.\"],[\"How frequently should I check my tire pressure?\",\"It is recommended to check your tire pressure at least once a month and before long trips. Proper tire pressure ensures optimal handling, fuel efficiency, and tire lifespan.\"],[\"When should I replace my car battery?\",\"On average, car batteries last about 3 to 5 years. Signs of a failing battery include difficulty starting the car, dim headlights, or a battery warning light on the dashboard.\"],[\"Do you offer a warranty for your services?\",\"Yes, we provide a warranty for our services. The duration and coverage may vary depending on the type of service performed. Please contact us for specific warranty details.\"]]', '1', '1', 1),
(63, 270, 259, 'included', 11, 0, 'Car Repair', 'car-repair', 'Comprehensive car repair services for all types of vehicle issues, including engine, transmission, electrical, and body repairs, ensuring your vehicle is restored to optimal condition.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667883256_5799cda64762c81d25fe.jpg', 350, 280, 5, '160', 5, 2, 1, 0, '', 5, 1, 1, '2022-11-08 04:43:45', '2025-05-20 06:33:26', '<p>Our Car Repair service offers expert solutions for a wide range of car issues, from engine and transmission repairs to electrical system troubleshooting. Whether you&rsquo;re dealing with a breakdown, strange noises, or warning lights, our certified mechanics provide efficient repairs to get your car back on the road. We use advanced diagnostic tools and high-quality parts to ensure your vehicle runs smoothly and reliably.</p>', '', '', '{\"1\":[\"How do I know if my car needs repairs?\",\"Signs include unusual noises, warning lights on the dashboard, poor performance, overheating, or problems with acceleration, braking, or steering.\"],\"2\":[\"How long does a typical car repair take?\",\"The duration depends on the type of repair. Minor repairs may take a few hours, while more complex issues, such as engine or transmission repairs, may take 1\\u20132 days.\"],\"3\":[\"Do you repair all makes and models of cars?\",\"Yes, our mechanics are skilled in repairing all makes and models of vehicles, including domestic and foreign cars, trucks, and SUVs.\"],\"4\":[\"Is there a warranty on car repairs?\",\"Yes, we offer a 6-month warranty on most car repairs to ensure that the issue is fully resolved.\"]}', '1', '1', 1),
(64, 270, 259, 'included', 12, 0, 'Car Wash', 'car-wash', 'Comprehensive car wash and detailing services, including exterior cleaning, interior detailing, and full vehicle care to keep your car looking fresh and well-maintained.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667882796_4bec9d83b7287e1bb34f.jpg', 400, 320, 2, '30', 0, 0, 1, 1, '30', 5, 1, 1, '2022-11-08 04:46:36', '2025-05-20 06:47:51', '<p>Our Car Wash service provides a thorough cleaning for your vehicle, both inside and out, to ensure it looks and feels like new. Whether you need a quick wash or a complete detailing service, we offer customized packages designed to meet your needs. Our experienced staff uses high-quality products and equipment to deliver professional results, ensuring that your car receives the best care.</p>', '', '', '[[\"How long does a car wash take?\",\"A basic exterior wash typically takes about 20-30 minutes, while full detailing services can take 1\\u20132 hours, depending on the size and condition of the vehicle.\"],[\"Do I need to schedule an appointment for a car wash?\",\"We accept walk-ins for quick exterior washes, but appointments are recommended for full detailing services to ensure we have adequate time to complete the job.\"],[\"Is waxing included in the basic car wash?\",\"No, waxing is a separate service, but we offer it as part of our detailing packages for added protection and shine.\"],[\"Do you use eco-friendly cleaning products?\",\"Yes, we use eco-friendly and biodegradable cleaning products to ensure your vehicle gets the best care while being environmentally conscious.\"]]', '1', '1', 1),
(65, 270, 259, 'included', 11, 0, 'Car Ac Service & Repair ', 'car-ac-service-repair', 'Comprehensive car air conditioning service and repair to ensure your vehicle stays cool and comfortable, with efficient diagnostics and expert repairs.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667882893_8aed5ceeb25356f70442.jpg', 500, 450, 2, '120', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-08 04:48:13', '2025-05-20 06:45:05', '<p>Our Car A/C Service &amp; Repair ensures that your vehicle\'s air conditioning system runs smoothly, keeping you comfortable during hot weather. Whether your A/C isn&rsquo;t blowing cold air, is making strange noises, or has a strange smell, our expert technicians can diagnose and repair any issues. We use the latest diagnostic tools to identify the cause of the problem and provide reliable repairs or recharges. From a simple A/C recharge to fixing leaks, replacing compressors, or addressing airflow problems, we offer full-service A/C maintenance and repairs.</p>', '', '', '{\"1\":[\"How do I know if my car\'s A\\/C needs repair?\",\"Common signs include weak airflow, warm air blowing from the vents, strange noises (such as clicking or hissing), or bad smells coming from the A\\/C.\"],\"2\":[\"How long does an A\\/C recharge take?\",\"A simple A\\/C recharge typically takes 30 minutes to 1 hour, depending on the vehicle and refrigerant type.\"],\"3\":[\"Can I use my car\\u2019s A\\/C when the refrigerant is low?\",\"It\\u2019s not recommended to run the A\\/C system with low refrigerant, as it can damage the compressor and other components over time.\"],\"4\":[\"How often should I service my car\\u2019s A\\/C?\",\"It\\u2019s recommended to service your A\\/C system every 1\\u20132 years to keep it functioning efficiently, especially before the warmer months.\"]}', '1', '1', 1),
(66, 270, 259, 'included', 12, 0, 'Detailing Services', 'detailing-services', 'Complete car detailing services, including both interior and exterior cleaning, to restore your vehicle’s shine and cleanliness, leaving it looking as good as new.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667883017_e5b89f2d98a16fbf327e.jpg', 250, 200, 2, '60', 5, 10, 0, 0, '', 6, 1, 1, '2022-11-08 04:50:17', '2025-05-20 06:59:29', '<p>Our Car Detailing Services offer a deep, thorough cleaning of your vehicle both inside and out, restoring its shine, freshness, and overall appearance. Whether you need a simple wash or a full detailing, we provide exceptional services that address every detail of your car&rsquo;s cleanliness and condition. We use premium cleaning products, advanced equipment, and skilled technicians to deliver high-quality results for all makes and models.</p>', '', '', '{\"1\":[\"How long does car detailing take?\",\"Full detailing usually takes between 2-4 hours, depending on the condition of the vehicle and the services selected.\"],\"2\":[\"Can you detail the car if I have pets?\",\"Yes, we offer specialized cleaning for pet hair removal and odor elimination to ensure your car is clean and fresh.\"],\"3\":[\"Is the detailing service safe for all types of vehicles?\",\"Absolutely! We tailor our services to suit all vehicle types, including cars, trucks, SUVs, and even luxury vehicles, ensuring that all surfaces are handled with care.\"],\"4\":[\"How often should I have my car detailed?\",\"For optimal results, it\\u2019s recommended to have your car detailed every 6 months. However, regular cleaning (monthly or quarterly) can help maintain your car\\u2019s appearance.\"]}', '1', '1', 1),
(67, 270, 232, 'included', 9, 0, 'Tires & Wheels Care', 'tires-wheels-care', 'Comprehensive tire and wheel care services to ensure your vehicle runs smoothly and safely, including tire replacements, rotations, balancing, and alignment.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667883446_0f970879656912a6a515.jpg', 250, 200, 5, '120', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-08 04:53:45', '2025-05-20 07:02:26', '<p>Our Tires &amp; Wheels Care service is designed to keep your vehicle&rsquo;s tires and wheels in top condition, improving safety, performance, and longevity. Whether you need a new set of tires, a tire rotation, or wheel alignment, our experts use state-of-the-art equipment to provide reliable and efficient service. Proper tire care ensures optimal performance, better fuel efficiency, and safer handling on the road.</p>', '', '', '{\"1\":[\"How often should I rotate my tires?\",\"Tires should be rotated every 6,000 to 8,000 miles or as recommended by your vehicle\\u2019s manufacturer to ensure even wear and extend their lifespan.\"],\"2\":[\"How do I know when my tires need to be replaced?\",\"Signs include low tread depth, frequent punctures, sidewall bulges, or visible wear and tear. If the tread depth is less than 2\\/32 inches, it\\u2019s time to replace the tires.\"],\"3\":[\"What are the benefits of wheel alignment?\",\"Proper alignment ensures your vehicle drives straight, improves tire longevity, and prevents uneven tire wear, reducing the risk of tire blowouts.\"],\"4\":[\"Can you repair punctured tires?\",\"Yes, we offer tire puncture repairs, but the repair depends on the location and size of the puncture. We recommend bringing the vehicle in for an inspection if you notice a flat or slow leak.\"]}', '1', '1', 1),
(68, 270, 259, 'included', 12, 0, 'Window Tinting', 'window-tinting', 'Professional window tinting services for your vehicle, providing UV protection, heat reduction, privacy, and a sleek, stylish look.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667883370_73f5f381040c6865cae5.jpg', 250, 200, 2, '60', 5, 10, 0, 0, '', 5, 1, 1, '2022-11-08 04:56:10', '2025-05-20 07:04:21', '<p>Our Window Tinting service offers high-quality, durable tinting for your vehicle&rsquo;s windows, enhancing both the appearance and functionality of your car. Whether you&rsquo;re looking to reduce glare, block harmful UV rays, improve privacy, or give your vehicle a more stylish look, our window tinting options provide a range of benefits. We use premium window films that offer long-lasting protection and come in a variety of shades to suit your preferences.</p>', '', '', '{\"1\":[\"How long does the window tinting process take?\",\"Typically, it takes about 2\\u20134 hours to complete the window tinting process, depending on the number of windows and the vehicle type.\"],\"2\":[\"Is window tinting legal in all areas?\",\"Tinting laws vary by state and country, particularly regarding the level of darkness and the windows that can be tinted. We comply with local laws to ensure your tinting is legal.\"],\"3\":[\"How long will the tint last?\",\"Our window tinting films are designed to last for many years without peeling or fading. The durability depends on the quality of the film, the vehicle\\u2019s exposure to the sun, and how well it is maintained.\"],\"4\":[\"Can the tint film be removed if I no longer want it?\",\"Yes, we offer tint removal services. The process includes carefully removing the film without damaging the glass, although tint removal may leave some residue, which we can clean.\"]}', '1', '1', 1),
(69, 270, 230, 'included', 12, 0, 'Batteries', 'batteries', 'Professional repair and maintenance services for automotive and rechargeable batteries to extend their lifespan and ensure optimal performance.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667883908_6e400f3979372dcde7a5.jpg', 500, 400, 3, '120', 5, 10, 0, 0, '', 52, 1, 1, '2022-11-08 05:05:08', '2025-05-20 07:06:11', '<p>Our Batteries Repairing Services specialize in diagnosing and repairing a wide range of batteries, including automotive batteries, rechargeable batteries, and other types of electrical storage units. Whether you&rsquo;re experiencing issues with battery drainage, slow charging, or overall poor performance, our expert technicians can quickly identify the problem and repair it. Regular maintenance of your batteries ensures longevity and reliable performance. We offer both repair and reconditioning services to help restore your battery&rsquo;s efficiency.</p>', '', '', '{\"1\":[\"How do I know if my car battery needs repairing?\",\"Signs include dim headlights, difficulty starting the car, clicking sounds when trying to start the vehicle, or a battery warning light on the dashboard.\"],\"2\":[\"Can a car battery be repaired?\",\"In some cases, car batteries with damaged terminals, low voltage, or other issues can be repaired or reconditioned, depending on the severity of the problem.\"],\"3\":[\"How often should I get my battery tested or maintained?\",\"It\\u2019s recommended to test your car battery at least once a year or every 12,000 miles, particularly before the cold winter months when batteries are more prone to failure.\"],\"4\":[\"Can I get a new battery instead of repairing my old one?\",\"Yes, if the repair or reconditioning isn\\u2019t effective, we can recommend and replace the battery with a new one that matches your vehicle\\u2019s specifications.\"]}', '1', '1', 1),
(70, 270, 259, 'included', 11, 0, 'Towing Service', 'towing-service', 'Professional and reliable towing services to assist with car breakdowns, accidents, flat tires, or any vehicle transport needs, available 24/7.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667884012_1deaff6534944ce05c82.jpg', 300, 180, 2, '30', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-08 05:06:52', '2025-05-20 07:08:08', '<p>Our Towing Service is designed to provide quick, reliable assistance in emergency situations, including vehicle breakdowns, accidents, or any situation where your car is immobile. Whether your vehicle has a flat tire, dead battery, or mechanical failure, our experienced drivers and tow trucks are ready to get you back on the road or transport your vehicle to a safe location. We offer both local and long-distance towing services, ensuring safe, efficient transportation for cars, trucks, and motorcycles.</p>', '[\"public\\/uploads\\/services\\/1688640931_552643046177764dfaf3.jpg\",\"public\\/uploads\\/services\\/1688640931_a17c7d4288b91a6ba63a.jpg\",\"public\\/uploads\\/services\\/1688640931_2308972a15e9a1914fd0.jpg\",\"public\\/uploads\\/services\\/1688640931_40ce323d85cb0baf3064.jpg\",\"public\\/uploads\\/services\\/1688640931_1644184b6475b7d88b4f.jpg\"]', '', '{\"1\":[\"How quickly can you arrive for towing?\",\"We aim to arrive within 30-45 minutes for local towing, but wait times may vary depending on traffic and the location.\"],\"2\":[\"Can I tow my car to any location?\",\"Yes, you can request to have your vehicle towed to any safe location, such as a repair shop, home, or another destination of your choice.\"],\"3\":[\"Do I need to be with my vehicle for towing?\",\"Ideally, yes, but we can tow the vehicle without you being present as long as you have provided the necessary authorization for the towing.\"],\"4\":[\"What should I do if my vehicle is involved in an accident?\",\"Stay safe, call emergency services if necessary, and contact us for accident recovery. We will ensure the safe transport of your vehicle to your desired location.\"]}', '1', '1', 1);
INSERT INTO `services` (`id`, `user_id`, `category_id`, `tax_type`, `tax_id`, `tax`, `title`, `slug`, `description`, `tags`, `image`, `price`, `discounted_price`, `number_of_members_required`, `duration`, `rating`, `number_of_ratings`, `on_site_allowed`, `is_cancelable`, `cancelable_till`, `max_quantity_allowed`, `is_pay_later_allowed`, `status`, `created_at`, `updated_at`, `long_description`, `other_images`, `files`, `faqs`, `at_store`, `at_doorstep`, `approved_by_admin`) VALUES
(71, 270, 228, 'included', 16, 0, 'Oil Change & Report', 'oil-change-report', 'Comprehensive oil change service with a detailed vehicle report, ensuring optimal engine performance and providing insights into your car\'s overall health.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667884133_b53ebbf3012855433f7b.jpg', 250, 200, 1, '30', 0, 0, 0, 0, '', 5, 1, 1, '2022-11-08 05:08:53', '2025-05-20 07:13:57', '<p class=\"\" data-start=\"456\" data-end=\"988\">Our Oil Change &amp; Report service ensures that your vehicle&rsquo;s engine stays well-lubricated and runs smoothly by replacing old, dirty oil with fresh, high-quality oil. Regular oil changes are essential for prolonging the life of your engine, improving fuel efficiency, and preventing engine damage. Along with the oil change, we provide a detailed vehicle health report, covering the condition of key components such as brakes, tires, and fluids, giving you a clear picture of your car\'s overall health.</p>', '[\"public\\/uploads\\/services\\/1688640332_c9dda2404b80bc934849.jpg\",\"public\\/uploads\\/services\\/1688640332_1f87982d7616b597b4fd.jpg\",\"public\\/uploads\\/services\\/1688640332_c299d5d820fb2931ae8a.jpg\",\"public\\/uploads\\/services\\/1688640332_18ddb5c854fa5991b012.jpg\",\"public\\/uploads\\/services\\/1688640332_41a9a96d4322f26f8ddd.jpg\",\"public\\/uploads\\/services\\/1688640332_feb4ee73bc3a724c69fe.jpg\",\"public\\/uploads\\/services\\/1688640332_dcc71588fffa11b59dc0.jpg\"]', '', '{\"1\":[\"How often should I get an oil change?\",\"It\\u2019s recommended to change your oil every 3,000 to 7,000 miles, depending on the type of oil used and your vehicle\\u2019s manufacturer recommendations.\"],\"2\":[\"What\\u2019s the difference between synthetic and standard oil?\",\"Synthetic oil is a higher-performance oil that offers better lubrication, higher temperature tolerance, and longer-lasting protection compared to standard mineral oils. It is typically used in newer or high-performance vehicles.\"],\"3\":[\"Why do I need an engine health report?\",\"The engine health report helps identify potential issues with your car\\u2019s vital systems, including the brakes, tires, and fluids, which can prevent major problems down the road. It\\u2019s an essential part of maintaining your vehicle\\u2019s longevity and performance.\"],\"4\":[\"Can I just get an oil change without the report?\",\"Yes, you can opt for just the oil change service. The report is an optional add-on that provides a detailed look at your vehicle\\u2019s overall condition.\"]}', '1', '1', 1),
(72, 270, 259, 'included', 7, 0, 'Denting & Painting', 'denting-painting', ' Professional dent repair and vehicle painting services to restore the appearance and structural integrity of your car, making it look brand new again.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667884193_b2d999077929047e41ca.jpg', 400, 280, 2, '60', 0, 0, 0, 0, '', 85, 1, 1, '2022-11-08 05:09:53', '2025-05-20 07:16:49', '<p>Our Denting &amp; Painting service provides expert repair for dents, scratches, and other body damage, along with high-quality painting to restore your vehicle&rsquo;s appearance. Whether you&rsquo;ve had a small fender bender or need a full vehicle repaint, our skilled technicians will carefully repair the dents and apply a smooth, flawless coat of paint to make your car look as good as new. We use advanced tools and premium paints to ensure a long-lasting finish that matches your vehicle\'s original color.</p>', '[\"public\\/uploads\\/services\\/1688640226_91f80d7d5e4f010bcf46.jpg\",\"public\\/uploads\\/services\\/1688640226_7816dc0123fa68eeb1d1.jpg\",\"public\\/uploads\\/services\\/1688640226_1fce4d2cca701f217f54.jpg\",\"public\\/uploads\\/services\\/1688640226_e9754633f83d6fe20106.jpg\",\"public\\/uploads\\/services\\/1688640226_a62bcdfc0c8fcdadc013.jpg\",\"public\\/uploads\\/services\\/1688640226_b465c689203917e30d06.jpg\",\"public\\/uploads\\/services\\/1688640226_e395b6cde01144519bd9.jpg\"]', '', '[[\"How long does dent repair take?\",\"Minor dent repairs typically take 1\\u20132 hours, while larger dents may take longer. The overall process depends on the severity of the damage.\"],[\"Is full car painting necessary if I only have a few scratches?\",\"No, we can simply touch up or repair the scratches without the need for a full repaint. Full car painting is recommended if the paint has worn out or if there\\u2019s significant damage.\"],[\"Can you match the paint color exactly to my car\\u2019s original color?\",\"Yes, we use advanced color-matching technology to ensure that the paint is a perfect match to your car\\u2019s original color.\"],[\"How long will the paint job last?\",\"With proper care and regular washing, a professional paint job can last 5-10 years, depending on the paint quality and environmental factors.\"]]', '1', '1', 1),
(73, 293, 218, 'included', 16, 0, 'Kitchen Cleaning', 'kitchen-cleaning-1', 'Kitchen cleaners perform thorough cleanings of Kitchen using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,Kitchen Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning', 'public/uploads/services/1667886635_c0a5888fcc39d53c07d0.jpg', 100, 90, 2, '60', 0, 0, 0, 0, '', 5, 1, 1, '2022-11-08 05:35:14', '2025-05-21 07:16:23', '<p>Our Kitchen Cleaning service provides a thorough cleaning of your kitchen, ensuring every surface is spotless and sanitized. Kitchens are prone to grease, food stains, and bacteria buildup, which is why regular professional cleaning is essential. Our team cleans all areas of your kitchen, including counters, cabinets, sinks, and appliances, leaving your space looking fresh and safe for cooking. We use eco-friendly, non-toxic cleaning solutions that are effective at eliminating grease, grime, and germs.</p>', '[\"public\\/uploads\\/services\\/1687949817_deb2c7024b1197041245.jpg\",\"public\\/uploads\\/services\\/1687949817_745fe2ebb39b77955b6d.jpg\",\"public\\/uploads\\/services\\/1687949817_864bf1928821ad8ba32d.jpg\",\"public\\/uploads\\/services\\/1687949817_08838fbb5cf87b10a38e.jpg\",\"public\\/uploads\\/services\\/1687949817_5cd0d3dc6d49b689507d.jpg\",\"public\\/uploads\\/services\\/1687949817_a15446f9c3bd9b340f95.jpg\"]', '[\"public\\/uploads\\/services\\/kitchen.pdf\"]', '[[\"How often should I schedule professional kitchen cleaning?\",\"Monthly or quarterly is recommended for professional kitchen cleaning.\"],[\"What areas of the kitchen do your cleaning services cover?\",\"We cover countertops, sinks, stovetops, oven exteriors, fridge exteriors, and cabinet surfaces.\"],[\"Do you clean kitchen appliances such as microwaves and dishwashers?\",\"Yes, we clean the exteriors of appliances like microwaves and dishwashers.\"],[\"What cleaning products do you use for kitchen cleaning?\",\"We use food-safe and eco-friendly cleaning products for kitchen surfaces.\"],[\"Can you handle tough grease and stubborn stains in the kitchen?\",\"Absolutely! Our professionals are equipped to handle tough grease and stubborn stains.\"]]', '1', '1', 1),
(74, 293, 213, 'included', 11, 0, 'Bathroom Cleaning', 'bathroom-cleaning-1', 'Bathroom cleaners perform thorough cleanings of Bathroom using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,Bathroom,Bathroom cleaning,Bath tab cleaning', 'public/uploads/services/1667886666_c0dd691e9044e18a1996.jpg', 600, 540, 2, '60', 5, 8, 1, 0, '', 25, 1, 1, '2022-11-08 05:37:17', '2025-05-21 07:29:14', '<p>Bathroom Cleaning service provides a deep, comprehensive clean to ensure your bathroom remains spotless and hygienic. Bathrooms are high-moisture areas that can accumulate grime, soap scum, mold, and bacteria. Our professional cleaning team will sanitize and clean all surfaces, from sinks to tubs, toilets to mirrors, leaving your bathroom fresh, sparkling, and free from harmful bacteria. We use eco-friendly, non-toxic cleaning products that are safe for you, your family, and the environment.</p>', '[\"public\\/uploads\\/services\\/1689221233_85f844a77222c9b7f812.jpg\",\"public\\/uploads\\/services\\/1689221233_81ac204c4878d270ea18.jpg\",\"public\\/uploads\\/services\\/1689221233_beb7f51a8eeaf3175137.jpg\",\"public\\/uploads\\/services\\/1689221233_1ffe423b40d02d84603a.jpg\",\"public\\/uploads\\/services\\/1689221233_dc2db9951d28f8a678f6.jpg\"]', '', '{\"1\":[\"How often should I have my bathroom cleaned?\",\"For regular maintenance, it\\u2019s recommended to clean your bathroom once a week. High-traffic bathrooms or those with more use may benefit from more frequent cleanings.\"],\"2\":[\"Do I need to remove personal items before the cleaning?\",\"It\\u2019s helpful to clear countertops and shelves to allow for a thorough cleaning. However, we can clean around personal items if needed.\"],\"3\":[\"What products do you use for cleaning?\",\"We use eco-friendly, non-toxic cleaning products that are safe for your family, pets, and the environment, ensuring effective and healthy cleaning.\"],\"4\":[\"Will the cleaning remove mold and mildew from the bathroom?\",\"Yes, our team will specifically target and treat visible mold and mildew, providing a clean and sanitized bathroom. For heavy mold infestations, we may recommend additional treatment.\"]}', '1', '1', 1),
(75, 293, 213, 'included', 11, 0, 'Full Home Cleaning', 'full-home-cleaning', 'Full home cleaners perform thorough cleanings of Full home using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,full home', 'public/uploads/services/1667886754_b37015aeb9171e87fe41.jpg', 600, 540, 2, '180', 5, 10, 0, 0, '', 60, 1, 1, '2022-11-08 05:38:48', '2025-05-21 07:30:50', '<p>Our Full Home Cleaning service offers a thorough cleaning of your entire home, ensuring every room is spotless, sanitized, and refreshed. Whether it&rsquo;s a one-time deep clean or regular maintenance, we provide a customized service to suit your needs. Our professional cleaning team tackles everything from dusting and vacuuming to sanitizing surfaces, cleaning floors, and organizing clutter. We use eco-friendly cleaning products to ensure your home is safe for your family and the environment.</p>', '', '', '{\"1\":[\"How often should I schedule a full home cleaning?\",\"We recommend deep cleaning your home at least once every few months, with regular maintenance cleanings every 1-2 weeks, depending on your lifestyle and preferences.\"],\"2\":[\"What does deep cleaning include that standard cleaning doesn\\u2019t?\",\"Deep cleaning includes cleaning areas that are often overlooked, such as baseboards, behind appliances, and inside cabinets. It also includes more intensive cleaning of floors, bathrooms, and kitchens.\"],\"3\":[\"Do I need to provide any cleaning supplies or equipment?\",\"No, we bring all the necessary cleaning supplies and equipment, including eco-friendly products and professional-grade tools.\"],\"4\":[\"Is the cleaning service available for empty homes or before moving in\\/moving out?\",\"Yes, we offer specialized cleaning for homes before or after moving in or out, ensuring that the space is thoroughly cleaned and sanitized.\"]}', '1', '1', 1),
(76, 293, 213, 'included', 12, 0, 'Office Cleaning', 'office-cleaning', 'Office cleaners perform thorough cleanings of Office using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,office cleaning,office', 'public/uploads/services/1667886870_9c428144bc2c790e75b7.jpg', 400, 320, 5, '60', 5, 2, 1, 0, '', 3, 1, 1, '2022-11-08 05:42:21', '2025-05-21 07:38:21', '<p>Our Office Cleaning service is designed to keep your workplace clean, organized, and sanitized, ensuring a comfortable environment for both employees and clients. Whether you need a one-time deep cleaning or regular maintenance, we tailor our services to fit your specific office requirements. We use eco-friendly cleaning products and professional equipment to ensure that your office not only looks great but also provides a healthy workspace.</p>', '', '', '{\"1\":[\"How often should my office be cleaned?\",\"Regular cleaning is recommended at least once a week, with more frequent services (e.g., bi-weekly or daily) for larger offices or high-traffic areas.\"],\"2\":[\"Do you provide cleaning supplies and equipment?\",\"Yes, we provide all cleaning supplies and equipment necessary for the job. We use eco-friendly products to ensure a safe and healthy office environment.\"],\"3\":[\"Can you clean our office after hours?\",\"Yes, we offer flexible scheduling and can clean your office outside of regular working hours to minimize disruption to your employees.\"],\"4\":[\"Can I customize the office cleaning services to fit our specific needs?\",\"Absolutely! We offer customized cleaning packages based on your office\\u2019s unique requirements, including specific areas that need more attention.\"]}', '1', '1', 1),
(77, 293, 213, 'included', 12, 0, 'Window Cleaning', 'window-cleaning-1', 'Professional window cleaning services for residential and commercial properties, ensuring clear, streak-free windows that enhance the appearance of your space.', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,window cleaning,window clean', 'public/uploads/services/1667887129_59b1e300b6ec2b3ec6a3.jpg', 300, 180, 2, '60', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-08 05:58:49', '2025-05-21 07:40:04', '<p>Our Window Cleaning service is designed to give your windows a sparkling, streak-free finish, improving the clarity of your view and enhancing the overall appearance of your property. Whether you need interior or exterior windows cleaned, we use specialized equipment and cleaning solutions to remove dirt, smudges, and water spots, leaving your windows spotless and gleaming. We provide both residential and commercial window cleaning services, ensuring a professional result every time.</p>', '', '', '{\"1\":[\"How often should I clean my windows?\",\"It\\u2019s recommended to clean windows every 3 to 6 months, depending on environmental factors such as dust, rain, and pollution.\"],\"2\":[\"Do I need to be home for the window cleaning service?\",\"While it\\u2019s not required for you to be home, we recommend being present for interior cleaning. For exterior window cleaning, we can arrange access as needed.\"],\"3\":[\"What happens if there are stains or buildup on my windows?\",\"We can address most stains, including hard water and mineral deposits, with special cleaning techniques. For persistent issues, we offer stain removal services.\"],\"4\":[\"Can you clean windows on high-rise buildings?\",\"Yes, we offer safe and efficient high-rise window cleaning services, using appropriate tools and safety measures for tall buildings.\"]}', '1', '1', 1),
(78, 293, 213, 'included', 11, 0, 'Sofa Cleaning', 'sofa-cleaning', 'Professional cleaning service for your sofas and upholstered furniture, removing dirt, stains, and odors, while restoring their original freshness and appearance.', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,sofa cleaning,sofa dip cleaning,lather sofa cleaning', 'public/uploads/services/1667887315_cde7cd1507cd93b56255.jpg', 300, 210, 2, '60', 5, 7, 0, 0, '', 5, 1, 1, '2022-11-08 06:01:55', '2025-05-21 07:42:34', '<p>Our Sofa Cleaning service is designed to refresh and restore the cleanliness of your sofa or upholstered furniture. Over time, sofas accumulate dirt, dust, stains, and odors that regular vacuuming can&rsquo;t eliminate. Our expert team uses advanced cleaning methods and eco-friendly products to deep clean your furniture, removing dirt and allergens, while preserving the integrity of the fabric. Whether you have a fabric, leather, or synthetic sofa, we provide customized solutions to meet your specific needs.</p>', '', '', '[[\"How often should I clean my sofa?\",\"It\\u2019s recommended to have your sofa professionally cleaned every 6 to 12 months, depending on use, to maintain its condition and hygiene.\"],[\"Can you remove all types of stains from my sofa?\",\"We can remove most common stains, including food, drinks, and pet stains. However, some stains may be difficult to remove depending on the fabric type and age of the stain.\"],[\"Is the cleaning process safe for all types of fabrics?\",\"Yes, we use eco-friendly, gentle cleaning solutions that are safe for all types of upholstery, including delicate fabrics, leather, and synthetic materials.\"],[\"How long will it take for my sofa to dry after cleaning?\",\"Drying time typically ranges from 4 to 6 hours, depending on the fabric type and humidity. We recommend allowing your sofa to dry completely before using it.\"]]', '1', '1', 1),
(79, 293, 213, 'included', 12, 0, 'Balcony Deep Cleaning', 'balcony-deep-cleaning', 'Thorough balcony cleaning service that includes deep cleaning of floors, walls, railings, and outdoor furniture to restore a clean and inviting outdoor space.\r\n\r\n', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,homecleaning,balcony cleaning,Balcony Deep Cleaning,balcony', 'public/uploads/services/1667887411_49b120fdfbba11b80350.jpg', 400, 320, 2, '60', 5, 10, 0, 0, '', 3, 1, 1, '2022-11-08 06:03:31', '2025-05-21 07:44:20', '<p class=\"\" data-start=\"463\" data-end=\"1011\">Our Balcony Deep Cleaning service is designed to restore the cleanliness and beauty of your balcony, patio, or terrace. Balconies accumulate dust, debris, mold, and stains over time, especially in outdoor environments exposed to weather elements. We provide a deep cleaning service to ensure your balcony is fresh, tidy, and ready for relaxation or entertainment. Our team uses specialized equipment and eco-friendly products to clean and sanitize all areas, including floors, walls, railings, and outdoor furniture.</p>\r\n<p>&nbsp;</p>', '', '', '{\"1\":[\"How often should I clean my balcony?\",\"Balconies should be cleaned at least once a season, with deeper cleanings done every 6\\u201312 months, especially if the balcony is exposed to harsh weather or heavy use.\"],\"2\":[\"Can you remove mold or mildew from my balcony?\",\"Yes, we offer specialized treatments to remove mold and mildew, which can build up in humid or shaded areas.\"],\"3\":[\"Do I need to remove my furniture before cleaning?\",\"We recommend removing or moving light furniture, but if you prefer, we can clean around heavier pieces. However, clearing the area allows for a more thorough clean.\"],\"4\":[\"Is the cleaning process safe for my plants on the balcony?\",\"Yes, our team will take care to avoid harming plants during the cleaning process. However, it\'s a good idea to move any delicate plants away from cleaning areas for extra precaution.\"]}', '1', '1', 1),
(80, 293, 213, 'included', 10, 0, 'Carpet Cleaning', 'carpet-cleaning-1', 'Professional carpet cleaning service that removes dirt, stains, and allergens, leaving your carpets fresh, clean, and looking new.', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,carpet,carpet cleaning,carpet clen', 'public/uploads/services/1667887507_d4fcaa478be6aeed58ae.jpg', 200, 140, 2, '60', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-08 06:05:07', '2025-05-21 07:45:55', '<p>Our Carpet Cleaning service provides a deep and thorough cleaning to restore your carpets to their original condition. Carpets trap dirt, dust, pet dander, and stains, which can affect indoor air quality and the overall look of your space. Using advanced cleaning techniques such as steam cleaning and dry cleaning, we effectively remove dirt and stains from deep within the fibers, leaving your carpet soft, clean, and free from allergens. Whether it&rsquo;s a small area or a full house, our team can handle carpets of all sizes and materials.</p>', '', '', '{\"1\":[\"How often should I clean my carpet?\",\"It\\u2019s recommended to clean your carpets every 6 to 12 months, or more frequently in high-traffic areas. Homes with pets or allergies may require more frequent cleaning.\"],\"2\":[\"Will carpet cleaning remove all stains?\",\"We can remove most common stains, but some stains, especially those from certain chemicals or deep-set damage, may be difficult or impossible to fully eliminate.\"],\"3\":[\"How long will it take for my carpets to dry after cleaning?\",\"After steam cleaning, carpets typically take 6-12 hours to dry, depending on the type of carpet and humidity. Dry cleaning methods have a faster drying time, usually within 1-2 hours.\"],\"4\":[\"Is the cleaning process safe for pets and children?\",\"Yes, we use eco-friendly, non-toxic cleaning products that are safe for both pets and children, ensuring a healthy home environment.\"]}', '1', '1', 1),
(81, 293, 213, 'included', 11, 0, 'Mattress Cleaning', 'mattress-cleaning', 'Professional mattress cleaning service that removes dust, allergens, stains, and odors, promoting a clean, healthy, and comfortable sleeping environment.', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,Mattress Clean,Mattress,Mattress Cleaning,Mattress Sanitization,Deep Cleaning,Stain Removal,Allergy Relief,Mattress Maintenance', 'public/uploads/services/1667887600_b0023b366931654c0532.jpg', 300, 210, 5, '60', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-08 06:06:40', '2025-05-21 07:50:48', '<p>Our<strong> </strong>Mattress Cleaning service is designed to improve the hygiene and lifespan of your mattress by removing dust mites, allergens, stains, and odors that accumulate over time. Regular cleaning helps maintain a healthier sleep environment, reduces allergens, and enhances the quality of your rest. We use safe and effective cleaning methods such as steam cleaning and deep stain removal to ensure your mattress is fresh, sanitized, and comfortable.</p>', '', '', '[[\"How often should I clean my mattress?\",\"It\\u2019s recommended to clean your mattress every 6 to 12 months, or more frequently if you have allergies, pets, or experience spills or stains.\"],[\"Will mattress cleaning remove all stains?\",\"We can remove most common stains, such as sweat, food, or pet stains. However, older or more stubborn stains may not be completely removed, but we will make every effort to improve the appearance.\"],[\"How long will it take for my mattress to dry after cleaning?\",\"Mattress drying time typically takes 4 to 6 hours, depending on the cleaning method used and the humidity level in the room.\"],[\"Is the cleaning process safe for sensitive skin or allergies?\",\"Yes, we use non-toxic, eco-friendly cleaning products that are safe for sensitive skin and individuals with allergies, ensuring a safe and comfortable sleep environment.\"]]', '1', '1', 1),
(82, 293, 213, 'included', 11, 0, 'Pillow Cleaning', 'pillow-cleaning', 'Professional pillow cleaning service to remove dirt, allergens, stains, and odors, leaving your pillows fresh, clean, and comfortable.', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,pillow clean,pillow cleaning,pillow,Deep Cleaning,Stain Removal,Pillow Sanitization,Dust Mite Removal,Odor Removal,Fabric Care', 'public/uploads/services/1667887740_92ee6f45530289ec0b96.jpg', 100, 90, 5, '30', 5, 10, 0, 0, '', 5, 1, 1, '2022-11-08 06:09:00', '2025-05-21 07:57:20', '<p>Our Pillow Cleaning service ensures that your pillows are thoroughly cleaned, sanitized, and refreshed. Over time, pillows accumulate dust, sweat, allergens, and oils from your skin, which can affect the comfort and cleanliness of your sleeping environment. We use safe and effective cleaning methods to remove these contaminants, as well as any stains or odors, leaving your pillows fresh, clean, and more hygienic. Whether you have foam, feather, or synthetic pillows, we tailor our cleaning process to suit the material and enhance the longevity of your pillows.</p>', '', '', '{\"1\":[\"How often should I clean my pillows?\",\"Pillows should be cleaned every 6 months or more frequently if you suffer from allergies, have pets, or if your pillows become stained or soiled.\"],\"2\":[\"Will pillow cleaning remove all stains?\",\"We can remove most common stains such as sweat, makeup, and food stains. However, older or deeply-set stains may be more difficult to remove completely, but we will make every effort to improve their appearance.\"],\"3\":[\"Can you clean all types of pillows?\",\"Yes, we clean a wide range of pillow types, including foam, feather, down, synthetic, and memory foam pillows. We tailor the cleaning process to suit the material to ensure the best results.\"],\"4\":[\"Is the cleaning process safe for sensitive skin or allergies?\",\"Yes, we use eco-friendly, non-toxic cleaning products that are safe for sensitive skin and allergies, ensuring a safe and comfortable sleeping experience.\"]}', '1', '1', 1),
(83, 293, 213, 'included', 11, 0, 'Chair Cleaning', 'chair-cleaning', 'Chair cleaners perform thorough cleanings of Chair cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,Chair,Chair cleaning,Chair clean', 'public/uploads/services/1667887912_7e14b0e936135752dbfe.jpg', 400, 360, 3, '120', 5, 10, 1, 0, '', 6, 1, 1, '2022-11-08 06:11:52', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(84, 273, 265, 'included', 11, 0, 'Haircut', 'haircut-1', 'Professional unisex haircut services for both men and women, tailored to your preferences, style, and hair type.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667890499_5f44735c0d8c1ba95737.jpg', 50, 40, 2, '30', 5, 14, 0, 0, '', 2, 1, 1, '2022-11-08 06:41:14', '2025-05-21 12:56:34', '<p>Our Haircut service offers professional and stylish haircuts for both men and women, whether you\'re looking for a trendy new look, a classic style, or a simple trim. Our skilled hairstylists are trained in a variety of techniques and will provide a haircut that suits your individual style, face shape, and hair texture. From short to long, curly to straight, we ensure that you leave feeling refreshed and confident with your new look.</p>', '[\"public\\/uploads\\/services\\/1688637098_89723008aaad352bfcf7.jpg\",\"public\\/uploads\\/services\\/1688637098_112e7e152a6c77bd9775.jpg\",\"public\\/uploads\\/services\\/1688637098_d43f78148974a6fec3e4.jpg\",\"public\\/uploads\\/services\\/1688637098_3c939a1d818c86bfd145.jpg\",\"public\\/uploads\\/services\\/1688637098_2a934d9de43d92c0e809.jpg\",\"public\\/uploads\\/services\\/1688637098_f6a1d68bc49579d0a7ac.jpg\",\"public\\/uploads\\/services\\/1688637098_7102d366824df6b9aa93.jpg\"]', '', '[[\"How do I choose the right haircut for me?\",\"Our experienced hairstylists are here to guide you. They will consider your face shape, hair texture, lifestyle, and personal preferences to help you select a haircut that complements your features and suits your individual style.\"],[\"Do I need to come with a specific haircut idea in mind?\",\"Not at all! Our hairstylists are skilled in providing personalized recommendations. Feel free to discuss your preferences and hair goals, and they will suggest suitable options tailored to enhance your unique look.\"],[\"Can I bring a photo of a haircut I like?\",\"Absolutely! Visual references can be helpful in communicating your desired haircut. Show our hairstylists any inspiration photos you have, and they will work with you to achieve a similar look that suits your hair type and face shape.\"],[\"What if I want to change my hairstyle significantly?\",\"Our hairstylists love creating transformative looks! Discuss your desire for a significant change during the consultation, and they will provide expert advice and recommendations to ensure a successful and stunning transformation.\"],[\" Can you provide haircare tips for maintaining my new haircut at home?\",\"Absolutely! Our hairstylists are more than happy to share professional tips and advice on how to maintain and style your haircut at home. They will recommend suitable products and techniques to keep your hair looking its best.\"],[\"What safety measures do you have in place?\",\"Your safety is our priority. We maintain strict hygiene and sanitation protocols in our salon, including regular disinfection, sanitization of tools, and adherence to social distancing guidelines. Rest assured, you can enjoy your haircut experience in a clean and safe environment.\"]]', '1', '1', 1),
(85, 273, 265, 'included', 11, 0, 'Kids Haircut', 'kids-haircut', 'Fun and professional haircut services for kids, ensuring a comfortable and enjoyable experience while getting a fresh new look.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa,Kids Haircut,Children’s Haircut,Kids Styling,Professional Haircut,Kids Hair Trim,Kids Hairstylist', 'public/uploads/services/1667890412_1fa8614d627a447b6772.jpg', 40, 32, 1, '30', 5, 14, 0, 0, '', 5, 1, 1, '2022-11-08 06:53:32', '2025-05-21 13:28:51', '<p>Our Kids Haircut service is designed to provide a fun, safe, and stress-free experience for children. Whether your child needs a quick trim, a fun new style, or their first haircut, our skilled stylists will ensure that they leave with a stylish look. We specialize in haircuts for children of all ages, from toddlers to pre-teens, and create an environment that makes them feel comfortable and at ease.</p>', '[\"public\\/uploads\\/services\\/1688640022_16aef27a9a47db618f30.jpg\",\"public\\/uploads\\/services\\/1688640022_2e1607fa83ceba104d8f.jpg\",\"public\\/uploads\\/services\\/1688640022_87484de2856f16da7540.jpg\",\"public\\/uploads\\/services\\/1688640022_8cc28eb2705655e4a4bf.jpg\",\"public\\/uploads\\/services\\/1688640022_a96b0940c45a72793a94.jpg\",\"public\\/uploads\\/services\\/1688640022_769febbacc3359cb8389.jpg\",\"public\\/uploads\\/services\\/1688640022_acb9f60bb790cda78d8f.jpg\"]', '', '[[\"How do I choose the right haircut for me?\",\"Our experienced hairstylists are here to guide you. They will consider your face shape, hair texture, lifestyle, and personal preferences to help you select a haircut that complements your features and suits your individual style.\"],[\"Do I need to come with a specific haircut idea in mind?\",\"Not at all! Our hairstylists are skilled in providing personalized recommendations. Feel free to discuss your preferences and hair goals, and they will suggest suitable options tailored to enhance your unique look.\"],[\"Can I bring a photo of a haircut I like?\",\"Absolutely! Visual references can be helpful in communicating your desired haircut. Show our hairstylists any inspiration photos you have, and they will work with you to achieve a similar look that suits your hair type and face shape.\"],[\"What if I want to change my hairstyle significantly?\",\"Our hairstylists love creating transformative looks! Discuss your desire for a significant change during the consultation, and they will provide expert advice and recommendations to ensure a successful and stunning transformation.\"],[\" Can you provide haircare tips for maintaining my new haircut at home?\",\"Absolutely! Our hairstylists are more than happy to share professional tips and advice on how to maintain and style your haircut at home. They will recommend suitable products and techniques to keep your hair looking its best.\"],[\"What safety measures do you have in place?\",\"Your safety is our priority. We maintain strict hygiene and sanitation protocols in our salon, including regular disinfection, sanitization of tools, and adherence to social distancing guidelines. Rest assured, you can enjoy your haircut experience in a clean and safe environment.\"]]', '1', '1', 1),
(86, 273, 265, 'included', 16, 0, 'Women Hair Highlights', 'women-hair-highlights', 'Professional hair highlighting services for women, including blonde highlights, balayage, ombre, and customized color options to add dimension and a fresh, vibrant look to your hair.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa,Hair Highlights,Women\'s Hair Color,Hair Coloring,Blonde Highlights,Balayage,Ombre,Hair Makeover', 'public/uploads/services/1667891363_18966f84d25c107d4c58.jpg', 50, 45, 1, '60', 5, 14, 0, 0, '', 2, 1, 1, '2022-11-08 07:09:23', '2025-05-21 13:34:04', '<p>Our Women Hair Highlights service is designed to add depth, dimension, and a vibrant look to your hair. Whether you\'re looking for subtle highlights, dramatic blonde streaks, or a trendy balayage or ombre, our experienced stylists will tailor the color to suit your face shape, hair type, and personal style. Highlights can brighten your look, create texture, and offer a refreshing change to your hair. We use premium hair color products that ensure long-lasting results and healthy hair.</p>', '[\"public\\/uploads\\/services\\/1688639909_d685a646121ea07f044e.jpg\",\"public\\/uploads\\/services\\/1688639909_79d68e4608b284fa0324.jpg\",\"public\\/uploads\\/services\\/1688639909_ff9643f16da3ef0c948c.jpg\",\"public\\/uploads\\/services\\/1688639909_49747f04a5e90c0c2e2b.jpg\",\"public\\/uploads\\/services\\/1688639909_65505a565e06675f9883.jpg\",\"public\\/uploads\\/services\\/1688639909_60de92caaeaab1300557.jpg\",\"public\\/uploads\\/services\\/1688639909_fe3bbcfcbc06b78d3a22.jpg\"]', '', '[[\"How long do highlights last?\",\"Highlights typically last 6-8 weeks, depending on how quickly your hair grows and how well you maintain the color.\"],[\"What\\u2019s the difference between balayage and ombre?\",\"Balayage is a more natural, blended highlighting technique where color is hand-painted onto the hair for a sun-kissed look, while ombre creates a more dramatic color transition from dark roots to light ends.\"],[\"Can I highlight my hair if it\'s already colored?\",\"Yes, but it\\u2019s important to consider the current color and condition of your hair. If your hair is already colored, we may need to do a color consultation to ensure the highlights will blend well with your existing color.\"],[\"How often should I get touch-up highlights?\",\"Typically, highlights need to be touched up every 6-8 weeks, depending on your hair growth and the type of highlights.\"]]', '1', '1', 1),
(87, 273, 265, 'included', 12, 0, 'Women Hair Bleaching', 'women-hair-bleaching', 'Professional hair bleaching service to lighten your hair to blonde or other shades, offering a bold transformation and vibrant results.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667891926_99b338f6f687fb30a988.jpg', 50, 35, 1, '60', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-08 07:16:18', '2025-05-21 13:36:07', '<p>Our Women Hair Bleaching service is designed for those looking to dramatically lighten their hair, whether you\'re aiming for a platinum blonde, honey blonde, or a lighter base for vibrant colors. Bleaching is a powerful process that requires professional care to ensure minimal damage and long-lasting results. Our experienced stylists use premium bleaching products and techniques to safely lighten your hair while maintaining its strength and integrity. Whether you\'re going for a full bleach or touch-ups to lighten your roots, we tailor the process to suit your hair type and desired look.</p>', '[\"public\\/uploads\\/services\\/1688639723_944ae0508f475ee99d7a.jpg\",\"public\\/uploads\\/services\\/1688639723_0625c9d940a28e6b714e.jpg\",\"public\\/uploads\\/services\\/1688639723_4ebbef31c60156e38c51.jpg\",\"public\\/uploads\\/services\\/1688639723_ef86cc0284fcfd2e60c9.jpg\",\"public\\/uploads\\/services\\/1688639723_1834ab6acad3fff42a8b.jpg\",\"public\\/uploads\\/services\\/1688639723_a87d1e5b7791a9e1acd0.jpg\",\"public\\/uploads\\/services\\/1688639723_030ba14b0782b3124db4.jpg\"]', '', '{\"1\":[\"How long does hair bleaching last?\",\"Hair bleaching is a permanent change, but it requires touch-ups every 6-8 weeks, especially if you have fast hair growth or your natural color is dark.\"],\"2\":[\"Will bleaching damage my hair?\",\"Bleaching can cause dryness and damage if not done properly. However, we use high-quality products and techniques to minimize damage. We also recommend a deep conditioning treatment after bleaching to maintain hair health.\"],\"3\":[\"Can I bleach my hair if it\\u2019s already dyed?\",\"It depends on the type and condition of your current color. We recommend a consultation before bleaching to ensure the process is safe and effective for your hair.\"],\"4\":[\"How do I maintain my bleached hair?\",\"We recommend using color-safe, sulfate-free shampoos, deep conditioning treatments, and avoiding excessive heat styling. Regular touch-ups will also help maintain a fresh look.\"]}', '1', '1', 1),
(88, 273, 265, 'included', 11, 0, 'Men Hair Colouring', 'men-hair-colouring', 'Professional hair colouring service for men, offering natural shades, grey coverage, or bold colour transformations to suit your style and personality.', 'Colouring,salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667892292_e03f3051b26c78faeddc.jpg', 50, 45, 1, '60', 0, 0, 0, 0, '', 1, 1, 1, '2022-11-08 07:20:21', '2025-05-21 13:41:20', '<p>Our Men\'s Hair Colouring service is designed to offer natural, stylish, and professional hair colour options for men. Whether you&rsquo;re looking to cover grey hair, enhance your natural colour, or completely change your look, our experienced stylists use high-quality colouring products to achieve the desired result. We provide a range of colours and techniques tailored to suit your skin tone, style, and hair type. From subtle, natural colour enhancements to bold, vibrant looks, we ensure a flawless, even finish.</p>', '[\"public\\/uploads\\/services\\/1688639599_721268f847863f541255.jpg\",\"public\\/uploads\\/services\\/1688639599_44de71d0fa7a53240178.jpg\",\"public\\/uploads\\/services\\/1688639599_67ef31972b69f7a12b9b.jpg\",\"public\\/uploads\\/services\\/1688639599_28a4479926c73f91cb2d.jpg\"]', '', '{\"1\":[\"How often should I colour my hair?\",\"It\\u2019s generally recommended to touch up your hair colour every 4-6 weeks to maintain a fresh look, especially for grey coverage or root touch-ups.\"],\"2\":[\"Will hair colouring damage my hair?\",\"Our stylists use high-quality products to minimize damage, but hair colouring can cause dryness or breakage if not properly maintained. Regular conditioning treatments and using colour-safe shampoos can help maintain hair health.\"],\"3\":[\"Can I choose any colour for my hair?\",\"Yes, you can choose a natural shade to blend with your hair or go for a bold, vibrant colour. We\\u2019ll discuss options and choose the best technique for your desired result.\"],\"4\":[\"How long does hair colour last?\",\"The longevity of your hair colour depends on the type of colouring used and how well it is maintained. Generally, professional hair colour lasts around 4-6 weeks, and highlights may require more frequent touch-ups.\"]}', '1', '1', 1),
(89, 273, 265, 'included', 10, 0, 'Beard Shave/Trim', 'beard-shavetrim', 'Professional beard shave and trimming services to shape, tidy, and maintain your beard, ensuring it looks sharp and well-groomed.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa,Beard Trim,Beard Shave,Men’s Grooming,Beard Styling,Beard Care,Facial Hair,Beard Maintenance', 'public/uploads/services/1667892126_495e84c035a92eaae85c.jpg', 40, 28, 1, '30', 0, 0, 0, 0, '', 1, 1, 1, '2022-11-08 07:22:06', '2025-05-21 13:47:38', '<p>Our Beard Shave/Trim service is designed to give your beard the perfect shape and style, whether you prefer a clean shave, a light trim, or a complete beard grooming session. Our experienced barbers work with precision to ensure your beard is shaped according to your preferences, leaving you with a neat, fresh, and stylish look. Whether you\'re going for a short stubble or a full beard, we offer expert beard trimming, shaping, and shaving to suit your face shape and style.</p>', '[\"public\\/uploads\\/services\\/1688638693_d789a8179f650ce0e5db.jpg\",\"public\\/uploads\\/services\\/1688638693_e8e61175e1262dac990f.jpg\",\"public\\/uploads\\/services\\/1688638693_2384f2aec994e7baa8d9.jpg\",\"public\\/uploads\\/services\\/1688638693_3356255c3859140f0aaa.jpg\",\"public\\/uploads\\/services\\/1688638693_faf04edaf8a03d38ba25.jpg\",\"public\\/uploads\\/services\\/1688638693_10a72e60c49e328bda2e.jpg\",\"public\\/uploads\\/services\\/1688638693_662646133a94665d4dbf.jpg\"]', '', '{\"1\":[\"How often should I get a beard trim or shave?\",\"It depends on your beard growth rate and personal preference. For a well-maintained look, regular trims every 3-4 weeks are recommended. If you prefer a shorter, stubbled look, it may require more frequent grooming\"],\"2\":[\"Can you shape my beard to fit my face shape?\",\"Yes, our barbers specialize in customizing beard shapes to suit your facial features, creating a balanced, flattering look.\"],\"3\":[\"What should I do to maintain my beard after trimming or shaving?\",\"To keep your beard in top shape, use beard oils or balms to hydrate the hair, prevent dryness, and reduce itchiness. Regular cleaning and trimming will help maintain its look.\"],\"4\":[\"Can I get a beard trim or shave if I have sensitive skin?\",\"Absolutely! Our barbers use gentle products and techniques, and we can adjust our approach for sensitive skin to ensure a smooth and comfortable grooming experience.\"]}', '1', '1', 1),
(90, 273, 268, 'included', 12, 0, 'Beard Coloring', 'beard-coloring', ' Professional beard coloring service to add depth, richness, and vibrancy to your beard, covering grey hairs or creating a bold new look.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa,Beard Dye,Beard Color,Beard Grooming,Facial Hair Color,Beard Makeover,Beard Maintenance,Hair Dyeing', 'public/uploads/services/1667892389_7b917ec2a29fc844a3b3.jpg', 50, 40, 1, '30', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-08 07:26:29', '2025-05-21 13:49:53', '<p>Our Beard Coloring service is designed to give your beard a rich, vibrant color that complements your style. Whether you&rsquo;re looking to cover grey hairs, enhance your natural color, or experiment with a bold new shade, we offer expert beard coloring services tailored to your preferences. We use high-quality, safe hair dyes specifically formulated for facial hair, ensuring long-lasting, natural-looking results that keep your beard looking sharp.</p>', '[\"public\\/uploads\\/services\\/1688638375_8baaed693c7db508c3a2.jpg\",\"public\\/uploads\\/services\\/1688638375_0826b8974301c1d2787a.jpg\",\"public\\/uploads\\/services\\/1688638375_bfde90c394694c6944e3.jpg\",\"public\\/uploads\\/services\\/1688638375_d03a5020877533172655.jpg\"]', '', '{\"1\":[\"How long does beard color last?\",\"The color typically lasts 4-6 weeks, depending on your hair growth rate, skin type, and how often you wash your beard. Regular touch-ups can help maintain the color.\"],\"2\":[\"Is the dye safe for facial hair?\",\"Yes, we use dyes specifically formulated for facial hair, which are safe for use on the beard and mustache. We also offer patch tests for sensitive skin.\"],\"3\":[\"Can I choose a custom color for my beard?\",\"Yes, we offer a range of colors, from natural shades like brown and black to more creative hues like red, blonde, or even bold colors like blue or green.\"],\"4\":[\"Do I need to do anything special to maintain my colored beard?\",\"After coloring, we recommend using mild, color-safe beard shampoos and conditioners to maintain the color. You may also want to apply beard oils or balms to keep it soft and hydrated.\"]}', '0', '0', 1),
(92, 273, 265, 'included', 9, 0, 'Pedicure', 'pedicure', 'Relaxing and rejuvenating pedicure service that includes nail care, exfoliation, massage, and polish, leaving your feet looking fresh and feeling pampered.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa,Pedicure,Foot Care,Nail Care,Foot Treatment,Nail Polish,Spa Treatment,Foot Massage,Toenail Care', 'public/uploads/services/1667892614_b4ad74ceb8b93add51d7.jpg', 50, 30, 1, '60', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-08 07:28:49', '2025-05-21 13:51:34', '<p>Our Pedicure service is designed to provide a full treatment for your feet, leaving them feeling refreshed, relaxed, and beautifully groomed. From basic nail care to indulgent foot treatments, we use high-quality products to ensure your feet look and feel their best. Whether you\'re looking for a simple nail trim or a luxurious spa pedicure, we offer a variety of options to suit your needs.</p>', '[\"public\\/uploads\\/services\\/1688638061_d795c7b1f27dab9cb540.jpg\",\"public\\/uploads\\/services\\/1688638061_b1016c75f4d17ffcd083.jpg\",\"public\\/uploads\\/services\\/1688638061_9c2188ac9ac1c35d3d5f.jpg\",\"public\\/uploads\\/services\\/1688638061_fc9508c22bbdeeed23cf.jpg\",\"public\\/uploads\\/services\\/1688638061_fdc3295f1d98746a2234.jpg\",\"public\\/uploads\\/services\\/1688638061_7c1b3fbd33a3081b279e.jpg\",\"public\\/uploads\\/services\\/1688638061_9c495c5dc899fe763db7.jpg\"]', '', '{\"1\":[\"How long does a pedicure take?\",\"A basic pedicure typically takes about 30 minutes, while a spa or gel pedicure may take 45-60 minutes, depending on the treatments included.\"],\"2\":[\"Can I get a pedicure if I have calluses or cracked heels?\",\"Yes, we can treat and remove calluses during the pedicure process. We also offer special treatments to hydrate and restore cracked heels.\"],\"3\":[\"How often should I get a pedicure?\",\"It\\u2019s recommended to get a pedicure every 4-6 weeks to maintain healthy nails and feet, though you can enjoy a pedicure more frequently if desired.\"],\"4\":[\"Is a gel pedicure better than a regular pedicure?\",\"Gel pedicures are long-lasting, providing a glossy finish that can last 2-3 weeks without chipping. They\\u2019re ideal if you want a more durable, low-maintenance option compared to regular nail polish.\"]}', '1', '1', 1),
(93, 273, 265, 'included', 10, 0, 'Manicure and Pedicure', 'manicure-and-pedicure', 'A complete hand and foot care service that includes nail grooming, exfoliation, massage, and polish, leaving your nails and skin soft, healthy, and beautifully polished.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa,Manicure,Pedicure,Nail Care,Hand & Foot Treatment,Nail Polish,Spa Treatment,Foot Massage,Hand Care', 'public/uploads/services/1667892603_34bf6a93bbd0f004f5bf.jpg', 100, 60, 1, '100', 0, 0, 0, 0, '', 1, 1, 1, '2022-11-08 07:30:03', '2025-05-21 13:53:51', '<p>Our Manicure and Pedicure service offers a complete treatment for your hands and feet, combining both professional nail care and relaxing spa treatments. Whether you\'re looking for a basic nail care session or a luxurious spa treatment, we provide a variety of options tailored to your needs. Our skilled technicians ensure that your nails and skin are well cared for, leaving you with a refreshed, polished look that lasts.</p>', '[\"public\\/uploads\\/services\\/1688638088_eb106fbb6f82cc381903.jpg\",\"public\\/uploads\\/services\\/1688638088_dfb99934f594b6ff70ce.jpg\",\"public\\/uploads\\/services\\/1688638088_591c6d4af3f9784cc15d.jpg\",\"public\\/uploads\\/services\\/1688638088_2279c6464de7d0aa080a.jpg\",\"public\\/uploads\\/services\\/1688638088_a4d079245b25216750a3.jpg\",\"public\\/uploads\\/services\\/1688638088_d60c356e096f7a876f68.jpg\",\"public\\/uploads\\/services\\/1688638088_6d80933d1f9d4a05b2c7.jpg\"]', '', '{\"1\":[\"How long does a manicure and pedicure take?\",\"A basic manicure and pedicure usually take about 1.5 hours. Spa, gel, or paraffin treatments may take up to 2 hours, depending on the services included.\"],\"2\":[\"Can I get a gel manicure and pedicure at the same time?\",\"Yes, we offer both gel manicure and pedicure services, and they are a great option for long-lasting results.\"],\"3\":[\"How often should I get a manicure and pedicure?\",\"It\\u2019s recommended to get a manicure and pedicure every 3-4 weeks to maintain healthy nails and skin, but you can enjoy them more frequently if desired.\"],\"4\":[\"Do you offer nail art or designs with the manicure and pedicure?\",\"Yes! We offer nail art and designs as an add-on to your manicure and pedicure for a personalized, creative touch.\"]}', '1', '1', 1);
INSERT INTO `services` (`id`, `user_id`, `category_id`, `tax_type`, `tax_id`, `tax`, `title`, `slug`, `description`, `tags`, `image`, `price`, `discounted_price`, `number_of_members_required`, `duration`, `rating`, `number_of_ratings`, `on_site_allowed`, `is_cancelable`, `cancelable_till`, `max_quantity_allowed`, `is_pay_later_allowed`, `status`, `created_at`, `updated_at`, `long_description`, `other_images`, `files`, `faqs`, `at_store`, `at_doorstep`, `approved_by_admin`) VALUES
(94, 273, 265, 'included', 16, 0, 'Men\'s Face Scrub', 'mens-face-scrub', 'A professional facial scrub treatment designed specifically for men to exfoliate the skin, remove dead cells, and reveal a fresh, smooth complexion.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa,Men\'s Skincare,Face Scrub,Exfoliation,Men\'s Facial,Skincare Treatment,Clean Skin,Face Care', 'public/uploads/services/1667893302_41229dbcd6b6cb17d5b3.jpg', 60, 48, 1, '60', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-08 07:36:31', '2025-05-21 13:56:14', '<p>Our Men\'s Face Scrub service is designed to cleanse, exfoliate, and refresh your skin. Men&rsquo;s skin can often accumulate dead skin cells, dirt, and oil, which can lead to clogged pores and dull-looking skin. This exfoliating treatment removes dead skin cells, unclogs pores, and leaves your face feeling smooth and revitalized. We use high-quality, soothing products tailored to men\'s skin, ensuring that the scrub is both effective and gentle. Ideal for all skin types, this treatment helps to brighten the complexion and prepare your skin for the next steps in your skincare routine.</p>', '[\"public\\/uploads\\/services\\/1688637581_cc3fa3a6b181b7af81d4.jpg\",\"public\\/uploads\\/services\\/1688637581_5384870835c61c762ec9.jpg\",\"public\\/uploads\\/services\\/1688637581_b130a33e5c50fe251b21.jpg\",\"public\\/uploads\\/services\\/1688637581_37b4ceefc81159f3025c.jpg\",\"public\\/uploads\\/services\\/1688637581_7a4f9c4900ab5b1a5f6c.jpg\",\"public\\/uploads\\/services\\/1688637581_d560d917b6023d9258de.jpg\",\"public\\/uploads\\/services\\/1688637581_9ed85390641ac300059e.jpg\"]', '', '[[\"What is a full facial service?\",\"Our full facial service is a comprehensive skincare treatment that targets multiple skin concerns. It typically includes cleansing, exfoliation, steam, extractions, facial massage, mask application, and moisturization, tailored to your specific needs.\"],[\"How often should I get a full facial?\",\"The frequency of full facial treatments depends on your skin type, concerns, and personal preference. As a general guideline, monthly facials are recommended to maintain optimal skin health and address ongoing skincare needs.\"],[\"What are the benefits of a full facial service?\",\"Our full facial service offers numerous benefits, including deep cleansing, removal of dead skin cells, improved circulation, hydration, and relaxation. It helps promote healthy, glowing skin while addressing specific concerns like acne, dullness, or aging.\"],[\"Is the full facial suitable for all skin types?\",\"Yes, our skilled estheticians customize the full facial service based on your skin type and concerns. Whether you have dry, oily, sensitive, or combination skin, our professionals will tailor the treatment to deliver the best results while ensuring your comfort.\"],[\"Are the products used in the facial treatment suitable for my skin?\",\"Absolutely! We use high-quality skincare products formulated to address various skin types and concerns. Our estheticians will assess your skin during the consultation and select products that are gentle, effective, and suitable for your unique needs.\"],[\"Will I experience any discomfort during the facial treatment?\",\"Our goal is to provide a relaxing and rejuvenating experience. While certain steps, such as extractions, may cause slight discomfort, our estheticians are trained to minimize any discomfort and ensure your overall comfort throughout the treatment.\"],[\"Can I wear makeup after a full facial?\",\"It is generally recommended to avoid applying makeup immediately after a facial to allow your skin to breathe and fully benefit from the treatment. However, if you need to wear makeup, our estheticians can provide guidance on suitable products and techniques.\"]]', '1', '1', 1),
(95, 273, 265, 'included', 16, 0, 'Express Facial', 'express-facial', 'A quick and rejuvenating facial treatment that cleanses, exfoliates, and hydrates your skin, offering a fresh and glowing complexion in just 30 minutes.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa,Express Facial,Quick Facial,Skincare,Face Treatment,Instant Glow,Facial for Men,Skin Refresh', 'public/uploads/services/1667893243_6688caf86010cacdb429.jpg', 50, 40, 1, '60', 0, 0, 0, 0, '', 1, 1, 1, '2022-11-08 07:40:43', '2025-05-21 13:57:46', '<p>Our Express Facial is the perfect solution for those who are short on time but still want to refresh and rejuvenate their skin. This quick facial treatment offers deep cleansing, exfoliation, and hydration, leaving your skin looking fresh, smooth, and glowing in just 30 minutes. Ideal for anyone with a busy schedule, this facial targets key skincare concerns such as dullness, dryness, and clogged pores, while restoring a healthy and radiant complexion. It&rsquo;s the perfect pick-me-up for your skin when you\'re in a hurry or need a skin boost before an event.</p>', '[\"public\\/uploads\\/services\\/1688637399_0aa8f71226ae11476088.jpg\",\"public\\/uploads\\/services\\/1688637399_cebe5b414870a70cf65f.jpg\",\"public\\/uploads\\/services\\/1688637399_4ab68287cd12c154e108.jpg\",\"public\\/uploads\\/services\\/1688637399_e80dfcefcf4b4e1f29d0.jpg\",\"public\\/uploads\\/services\\/1688637399_4eff991da0eea18d0ebb.jpg\",\"public\\/uploads\\/services\\/1688637399_349b4e2b9761e2c71dbb.jpg\",\"public\\/uploads\\/services\\/1688637399_ea329afff684fb93dcde.jpg\"]', '', '[[\"What is a full facial service?\",\"Our full facial service is a comprehensive skincare treatment that targets multiple skin concerns. It typically includes cleansing, exfoliation, steam, extractions, facial massage, mask application, and moisturization, tailored to your specific needs.\"],[\"How often should I get a full facial?\",\"The frequency of full facial treatments depends on your skin type, concerns, and personal preference. As a general guideline, monthly facials are recommended to maintain optimal skin health and address ongoing skincare needs.\"],[\"What are the benefits of a full facial service?\",\"Our full facial service offers numerous benefits, including deep cleansing, removal of dead skin cells, improved circulation, hydration, and relaxation. It helps promote healthy, glowing skin while addressing specific concerns like acne, dullness, or aging.\"],[\"Is the full facial suitable for all skin types?\",\"Yes, our skilled estheticians customize the full facial service based on your skin type and concerns. Whether you have dry, oily, sensitive, or combination skin, our professionals will tailor the treatment to deliver the best results while ensuring your comfort.\"],[\"Are the products used in the facial treatment suitable for my skin?\",\"Absolutely! We use high-quality skincare products formulated to address various skin types and concerns. Our estheticians will assess your skin during the consultation and select products that are gentle, effective, and suitable for your unique needs.\"],[\"Will I experience any discomfort during the facial treatment?\",\"Our goal is to provide a relaxing and rejuvenating experience. While certain steps, such as extractions, may cause slight discomfort, our estheticians are trained to minimize any discomfort and ensure your overall comfort throughout the treatment.\"],[\"Can I wear makeup after a full facial?\",\"It is generally recommended to avoid applying makeup immediately after a facial to allow your skin to breathe and fully benefit from the treatment. However, if you need to wear makeup, our estheticians can provide guidance on suitable products and techniques.\"]]', '1', '1', 1),
(96, 273, 265, 'included', 10, 0, 'Women Full Facial', 'women-full-facial', 'A complete facial treatment that includes cleansing, exfoliation, extraction, mask, and hydration, providing a deep rejuvenation for your skin and leaving it glowing.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1688558801_e3643515a8005ed0a9b2.jpg', 60, 48, 1, '60', 0, 0, 1, 0, '', 1, 1, 1, '2022-11-08 07:43:18', '2025-05-21 14:00:55', '<p>Our Women Full Facial service is a comprehensive treatment designed to deeply cleanse, exfoliate, hydrate, and rejuvenate your skin. This full facial provides all the benefits of a classic facial with a more extensive treatment, making it perfect for those looking to address specific skin concerns or simply indulge in a relaxing, skin-refreshing experience. The facial includes a thorough cleansing, exfoliation, extraction of impurities, a soothing mask, and a nourishing moisturizer, leaving your skin smooth, bright, and refreshed. It&rsquo;s ideal for combating dryness, dullness, fine lines, and clogged pores, providing visible results in just one session.</p>', '[\"public\\/uploads\\/services\\/1688637266_0a7e6820624689ce3670.jpg\",\"public\\/uploads\\/services\\/1688637266_53e7c2a8924f10fe6cf5.jpg\",\"public\\/uploads\\/services\\/1688637266_9bcc6f0ae4eacca0688e.jpg\",\"public\\/uploads\\/services\\/1688637266_6a39b168503c12cad762.jpg\",\"public\\/uploads\\/services\\/1688637266_9910dd4a7512536a940f.jpg\",\"public\\/uploads\\/services\\/1688637266_8c67b3ac032d4a6b6c1c.jpg\",\"public\\/uploads\\/services\\/1688637266_241f72c794b30d4ddae9.jpg\"]', '', '[[\"What is a full facial service?\",\"Our full facial service is a comprehensive skincare treatment that targets multiple skin concerns. It typically includes cleansing, exfoliation, steam, extractions, facial massage, mask application, and moisturization, tailored to your specific needs.\"],[\"How often should I get a full facial?\",\"The frequency of full facial treatments depends on your skin type, concerns, and personal preference. As a general guideline, monthly facials are recommended to maintain optimal skin health and address ongoing skincare needs.\"],[\"What are the benefits of a full facial service?\",\"Our full facial service offers numerous benefits, including deep cleansing, removal of dead skin cells, improved circulation, hydration, and relaxation. It helps promote healthy, glowing skin while addressing specific concerns like acne, dullness, or aging.\"],[\"Is the full facial suitable for all skin types?\",\"Yes, our skilled estheticians customize the full facial service based on your skin type and concerns. Whether you have dry, oily, sensitive, or combination skin, our professionals will tailor the treatment to deliver the best results while ensuring your comfort.\"],[\"Are the products used in the facial treatment suitable for my skin?\",\"Absolutely! We use high-quality skincare products formulated to address various skin types and concerns. Our estheticians will assess your skin during the consultation and select products that are gentle, effective, and suitable for your unique needs.\"],[\"Will I experience any discomfort during the facial treatment?\",\"Our goal is to provide a relaxing and rejuvenating experience. While certain steps, such as extractions, may cause slight discomfort, our estheticians are trained to minimize any discomfort and ensure your overall comfort throughout the treatment.\"],[\"Can I wear makeup after a full facial?\",\"It is generally recommended to avoid applying makeup immediately after a facial to allow your skin to breathe and fully benefit from the treatment. However, if you need to wear makeup, our estheticians can provide guidance on suitable products and techniques.\"]]', '1', '1', 1),
(97, 283, 270, 'included', 6, 0, 'Kitchen Cabinets', 'kitchen-cabinets-1', 'Kitchen Cabinets Trained and certified carpenters with hassle-free Kitchen Cabinets service', 'kitchen,cabinets,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667967738_2d302847b6e446d30687.jpg', 200, 120, 2, '30', 5, 7, 1, 0, '', 10, 1, 1, '2022-11-08 11:06:51', '2025-05-21 14:10:04', '<p>Our Kitchen Cabinets service offers complete solutions for transforming your kitchen with stylish, functional cabinets. Whether you\'re building a new kitchen, renovating your existing one, or simply upgrading your current cabinets, we provide customized designs that fit your space and needs. We offer high-quality materials and expert craftsmanship to ensure that your cabinets are not only visually appealing but also durable and functional. From installing new cabinets to refinishing or refurbishing old ones, our team will provide you with the best options for storage, style, and organization.</p>', '', '', '{\"1\":[\"How long does it take to install custom kitchen cabinets?\",\"The installation of custom cabinets typically takes 1-2 weeks, depending on the size of the kitchen and the complexity of the design.\"],\"2\":[\"Can I change the design or layout of my kitchen cabinets?\",\"Yes! Our custom cabinet services are tailored to your needs, and we can help you redesign your kitchen layout to maximize space and improve functionality.\"],\"3\":[\"Do you provide the materials for the cabinets?\",\"Yes, we offer a wide range of materials to choose from, including wood, laminate, and more. We\\u2019ll help you select the best materials based on your style preferences and budget.\"],\"4\":[\"Can you refinish my existing cabinets instead of replacing them?\",\"Absolutely! If your current cabinets are in good shape but need a new look, we offer cabinet refinishing and refurbishment services to give them a fresh update without the cost of full replacement.\"]}', '1', '1', 1),
(98, 283, 270, 'included', 15, 0, 'Wardrobe Cupboard', 'wardrobe-cupboard', 'Tailored wardrobe cupboard solutions designed to maximize your storage space, enhance your bedroom’s aesthetics, and improve organization with functional, stylish designs.', 'wardrobe,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation,Wardrobe Design,Wardrobe Cupboard,Custom Wardrobe,Bedroom Storage,Closet Design,Furniture Installation,Wardrobe Refurbishment', 'public/uploads/services/1667968094_88fca954e8199b514805.jpg', 250, 200, 5, '2880', 5, 5, 1, 0, '', 9, 1, 1, '2022-11-09 04:28:14', '2025-05-21 14:15:39', '<p>Our Wardrobe Cupboard service offers custom wardrobe designs and installations to suit your bedroom&rsquo;s space, style, and storage needs. Whether you need a simple, functional wardrobe or a luxurious custom closet, we create high-quality wardrobes with optimal organization. We offer a variety of designs, materials, and finishes, ensuring your wardrobe is not only functional but also complements the overall aesthetic of your room. From sliding doors to open shelving and pull-out drawers, we provide customized solutions for all your storage requirements.</p>', '', '', '[[\"How long does it take to design and install a custom wardrobe?\",\"A custom wardrobe can take between 2 to 4 weeks, depending on the complexity of the design and the size of the wardrobe.\"],[\"Can I add more storage features to my existing wardrobe?\",\"Yes, we offer wardrobe upgrades such as additional shelves, pull-out drawers, and hanging space, allowing you to customize your existing wardrobe to suit your needs.\"],[\"What materials do you use for wardrobe construction?\",\"We offer a wide range of materials, including wood, MDF, plywood, and laminates. You can choose from various finishes such as matte, glossy, or textured to match your room\'s d\\u00e9cor.\"],[\"Is a walk-in wardrobe practical for smaller spaces?\",\"While walk-in wardrobes are luxurious and spacious, we also provide solutions for smaller spaces using modular and sliding-door systems that maximize storage without compromising room size.\"]]', '1', '1', 1),
(99, 283, 270, 'included', 16, 0, 'Reception Counter', 'reception-counter', 'Custom-designed reception counters that offer functional and stylish solutions for your office or business\'s front desk, enhancing the professional look of your workspace', 'reception,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667968226_6e4c74c5c78851a70ca2.jpg', 300, 240, 5, '300', 5, 10, 1, 0, '', 9, 1, 1, '2022-11-09 04:30:26', '2025-05-21 14:15:14', '<p>Our Reception Counter service is designed to provide you with a stylish and functional reception desk that fits your office space and brand image. Whether you need a compact counter for a small office or a larger, more elaborate desk for a corporate lobby, we offer tailored solutions to meet your specific requirements. We use high-quality materials and designs that ensure both aesthetic appeal and durability. Our reception counters are not only visually attractive but also designed for functionality, offering ample storage, a clean surface for customer interactions, and ergonomic features for ease of use.</p>', '', '', '{\"1\":[\"How long does it take to design and install a custom reception counter?\",\"The process typically takes 2-4 weeks, depending on the complexity of the design, materials chosen, and the size of the counter.\"],\"2\":[\"Can I choose the material for my reception counter?\",\"Yes, we offer a wide range of materials, including wood, laminate, glass, metal, and more, to ensure that the counter matches your office\'s aesthetic and durability needs.\"],\"3\":[\"Is a custom reception counter a good fit for a small office?\",\"Absolutely! We offer compact and modular reception counters that are ideal for small spaces, offering functionality without compromising on style.\"],\"4\":[\"Do you provide installation services for the reception counter?\",\"Yes, we provide professional installation services to ensure that your reception counter is installed correctly and securely, allowing you to focus on running your business.\"]}', '1', '1', 1),
(100, 283, 270, 'included', 11, 0, 'Shelves installation', 'shelves-installation', 'Professional installation of shelves for home or office spaces to enhance storage, organization, and decor, with options for wall-mounted, floating, or custom-designed shelves.', 'shelves,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667968560_97cb980a42ae258d401c.jpg', 250, 200, 5, '300', 5, 10, 1, 0, '', 9, 1, 1, '2022-11-09 04:36:00', '2025-05-21 14:16:54', '<p>Our Shelves Installation service offers expert installation of shelves to maximize your storage space and enhance the aesthetic appeal of your home or office. Whether you need functional shelving for your living room, kitchen, bathroom, or office, we provide reliable installation services that ensure the shelves are securely mounted and aligned for optimal use. From floating shelves that create a minimalist look to custom-built shelving units for specific needs, we cater to a variety of styles and purposes.</p>\r\n<p>&nbsp;</p>', '', '', '{\"1\":[\"How long does it take to install shelves?\",\"The installation time varies depending on the number of shelves and complexity of the setup. Typically, it takes between 1-3 hours to install 1-3 shelves. Custom shelving units may take longer.\"],\"2\":[\"Do I need to buy the shelves myself?\",\"We offer both installation-only services or complete shelving solutions. If you have already purchased your shelves, we can install them. Otherwise, we can assist with selecting and purchasing shelves for your space.\"],\"3\":[\"Can you install shelves on any wall?\",\"Yes, we can install shelves on most types of walls (drywall, plaster, concrete, etc.), but some walls may require specific anchors or support systems, which we will ensure are suitable for the weight and size of the shelves.\"],\"4\":[\"Can I install shelves in my bathroom or other high-humidity areas?\",\"Yes, we offer specialized shelves and installation techniques for bathrooms, using materials that are resistant to moisture, such as stainless steel, plastic, or treated wood.\"]}', '1', '1', 1),
(101, 283, 270, 'included', 10, 0, 'Wooden Table', 'wooden-table', 'Custom-designed wooden tables for home or office, offering durable and stylish solutions in a variety of finishes, sizes, and designs to fit your space and needs.', 'carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667968857_2a2fa2222584fb7c62db.jpg', 250, 200, 5, '2880', 5, 10, 1, 1, '2880', 5, 1, 1, '2022-11-09 04:40:57', '2025-05-21 14:18:21', '<p class=\"\" data-start=\"443\" data-end=\"958\">Our Wooden Table service provides bespoke, high-quality wooden tables that are crafted to suit your specific requirements and aesthetic preferences. Whether you\'re looking for a stylish dining table, a sturdy coffee table, or a custom work desk, we offer personalized solutions that combine functionality with timeless design. Our skilled craftsmen use premium wood materials and expert techniques to create beautiful, durable tables that complement any d&eacute;cor, from modern to rustic.</p>', '', '', '{\"1\":[\"How long does it take to build a custom wooden table?\",\"The time to build a custom wooden table varies based on design complexity and size. Typically, it takes 2-4 weeks for production and finishing.\"],\"2\":[\"Can I choose the wood type for my table?\",\"Yes! We offer a range of wood types, including oak, walnut, maple, teak, and more, depending on your design preferences and budget.\"],\"3\":[\"Can the size of the table be customized?\",\"Absolutely! All our tables are custom-made to fit the dimensions and style of your space, so you can choose the size that works best for your home or office.\"],\"4\":[\"How do I care for my wooden table?\",\"To keep your wooden table looking great, we recommend regular cleaning with a damp cloth, avoiding harsh chemicals, and periodically applying a protective finish or polish.\"]}', '1', '1', 1),
(102, 283, 270, 'included', 7, 0, 'Wooden Flooring', 'wooden-flooring', 'High-quality wooden flooring installation, offering a variety of wood types and finishes that add elegance, warmth, and durability to any home or office space.', 'wooden,flooring,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation,Wooden Flooring,Hardwood Flooring,Floor Installation,Wood Flooring,Floor Renovation,Floor Refinishing,Flooring Services', 'public/uploads/services/1667968989_c7c8a73f86a23a52eba2.jpg', 300, 240, 5, '2880', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-09 04:43:09', '2025-05-21 14:25:22', '<p>Our Wooden Flooring service offers a range of elegant, durable, and eco-friendly flooring options, tailored to fit your style, space, and budget. Whether you prefer classic hardwood or more modern engineered wood options, we offer a selection of premium materials and finishes to enhance your space. Wooden floors provide a timeless look that enhances the aesthetic value of any room while being easy to maintain and built to last. We handle everything from the initial consultation and design to the precise installation, ensuring a flawless finish.</p>', '', '', '{\"1\":[\"How long does wooden flooring installation take?\",\"The installation time varies depending on the size and type of flooring. Typically, a room can be completed in 1-2 days, while larger spaces may take 3-5 days or more.\"],\"2\":[\"What is the difference between solid hardwood and engineered wood?\",\"Solid hardwood is made from a single piece of wood and offers a timeless, traditional look. Engineered wood has a real wood veneer layer with a plywood core, making it more stable and less susceptible to temperature changes, ideal for varying humidity levels.\"],\"3\":[\"Can wooden flooring be installed over existing floors?\",\"Yes, in some cases, wooden flooring can be installed over existing floors as long as the base is level and structurally sound. Our team will assess your space to determine the best approach.\"],\"4\":[\"How should I care for and maintain my wooden floors?\",\"Regular cleaning with a soft cloth or vacuum and applying appropriate wood cleaners will help maintain the finish. It is also recommended to periodically apply a wood polish or refinishing treatment to keep the wood protected and looking fresh.\"]}', '1', '1', 1),
(103, 283, 270, 'included', 12, 0, 'Kitchen & Bathroom Renovation', 'kitchen-bathroom-renovation', 'Comprehensive kitchen and bathroom renovation services, offering design, installation, and remodeling to transform your space into a modern, functional, and stylish environment.', 'kitchen,bathroom,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation,Kitchen Renovation,Bathroom Renovation,Home Renovation,Kitchen Remodeling,Bathroom Remodeling,Renovation Services,Custom Design,Home Improvement', 'public/uploads/services/1667969305_15a5779819d1d513df26.jpg', 300, 240, 5, '3000', 5, 10, 0, 0, '', 9, 1, 1, '2022-11-09 04:48:25', '2025-05-22 05:05:11', '<p>Our Kitchen &amp; Bathroom Renovation service offers complete solutions to transform your kitchen and bathroom into functional, aesthetically pleasing spaces that suit your needs and style. Whether you want to update your existing design or completely remodel your space, we work with you to create a layout that enhances both functionality and beauty. From custom cabinetry and countertops to flooring and lighting, we handle every aspect of the renovation process, ensuring a smooth and efficient experience.</p>', '', '', '{\"1\":[\"How long will my kitchen or bathroom renovation take?\",\"A typical kitchen or bathroom renovation can take anywhere from 3 to 6 weeks, depending on the size of the space and the complexity of the design. Larger renovations may take longer.\"],\"2\":[\"Can I customize the materials and designs used for my renovation?\",\"Absolutely! We offer a wide range of materials and finishes for every aspect of the renovation, from cabinets and countertops to flooring and fixtures. We work with you to select options that match your style and budget.\"],\"3\":[\"Do I need to vacate the space during the renovation?\",\"While you may not need to leave the home, certain aspects of the renovation (such as plumbing and electrical work) may require you to vacate the area for safety reasons. We can provide you with a timeline to help plan accordingly.\"],\"4\":[\"What\\u2019s the difference between a renovation and a remodel?\",\"Renovation typically refers to upgrading existing features, such as replacing cabinets or countertops, whereas remodeling involves altering the layout and structure of the space, such as moving walls or plumbing fixtures.\"]}', '1', '1', 1),
(104, 283, 270, 'included', 9, 0, 'Office Renovation', 'office-renovation', 'Comprehensive office renovation services that enhance the functionality, aesthetics, and comfort of your workspace, creating a productive and modern work environment.', 'Office,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation,Office Renovation,Office Remodeling,Workplace Renovation,Office Design,Commercial Renovation,Office Makeover,Office Space Optimization', 'public/uploads/services/1667969415_804d734db569352cb631.jpg', 300, 210, 5, '5760', 5, 3, 0, 0, '', 6, 1, 1, '2022-11-09 04:50:15', '2025-05-22 05:06:34', '<p>Our Office Renovation service is designed to transform your existing office space into a more functional, efficient, and aesthetically pleasing environment. Whether you\'re looking to update your office with a modern, sleek design or need to optimize the layout for better space utilization, we offer tailored solutions to fit your needs. From floor plan redesigns and custom furniture installations to lighting upgrades and modern finishes, we handle every aspect of the renovation process to ensure your office meets both functional and aesthetic goals.</p>', '', '', '{\"1\":[\"How long does an office renovation take?\",\"The timeline for office renovations depends on the scope of the work. Minor renovations may take 2-4 weeks, while larger projects can take 6-8 weeks or more.\"],\"2\":[\"Can I stay in the office during the renovation?\",\"While we aim to minimize disruptions, certain tasks (like electrical or HVAC work) may require temporarily vacating specific areas. We\\u2019ll work with you to plan the renovation to minimize downtime and ensure a smooth workflow.\"],\"3\":[\"Can I customize the furniture for my office?\",\"Yes, we offer custom furniture design and installation that can be tailored to your office\\u2019s needs, whether it\'s for individual workstations, collaborative spaces, or private offices.\"],\"4\":[\"What should I consider when renovating an office space?\",\"When renovating your office, consider factors such as functionality, employee comfort, and branding. We will help you choose materials, layouts, and designs that enhance productivity and create a welcoming atmosphere for your team.\"]}', '1', '1', 1),
(105, 283, 270, 'included', 10, 0, 'Shop Renovation', 'shop-renovation', 'Complete shop renovation services to transform your retail space into an attractive, functional, and customer-friendly environment that enhances your business’s appeal.', 'Shop,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation,Shop Renovation,Retail Space Remodeling,Commercial Renovation,Shop Interior Design,Store Makeover,Commercial Interior,Retail Design', 'public/uploads/services/1667969617_e154bc04a5e3ceba64c6.jpg', 350, 280, 5, '2880', 5, 10, 1, 0, '', 6, 1, 1, '2022-11-09 04:53:37', '2025-05-22 05:09:55', '<p>Our Shop Renovation service provides professional, customized solutions to transform your retail space into a modern, functional, and inviting environment. Whether you\'re looking to refresh your store\'s look, optimize space, or enhance customer experience, we handle all aspects of the renovation process, from interior design and layout planning to the installation of fixtures, lighting, and flooring. We work with you to create a store that aligns with your brand, attracts customers, and maximizes space and functionality.</p>', '', '', '{\"1\":[\"How long does a shop renovation take?\",\"The timeline for a shop renovation depends on the scope of the project. Minor renovations can take 1-2 weeks, while full-scale renovations may take 3-6 weeks or more, depending on size and complexity.\"],\"2\":[\"Can I remain open during the renovation?\",\"We strive to minimize disruptions to your business. For smaller renovations, it may be possible to keep your shop open, but for larger projects, temporary closure or working during off-hours may be necessary.\"],\"3\":[\"Can you help with branding during the renovation?\",\"Yes, we can integrate branding elements into the design, including logos, colors, and signage, to ensure your shop\\u2019s interior matches your brand identity.\"],\"4\":[\"What should I focus on when renovating my shop?\",\"When renovating your shop, focus on creating a welcoming atmosphere, optimizing space, and ensuring the layout encourages customer flow. We also recommend enhancing product visibility with proper lighting and display systems.\"]}', '1', '1', 1),
(106, 283, 270, 'included', 12, 0, 'Glass Partition', 'glass-partition', 'Installation of high-quality glass partitions for offices, homes, or commercial spaces to create modern, stylish, and functional divisions while maintaining an open, airy feel.', 'Glass,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667971795_3daf16ea1ed47e4fcb3d.jpg', 350, 245, 6, '2880', 5, 10, 1, 0, '', 9, 1, 1, '2022-11-09 05:29:55', '2025-05-22 05:11:55', '<p>Our Glass Partition service offers a sleek, modern solution to dividing spaces while maintaining an open and spacious feel. Glass partitions are perfect for creating private offices, meeting rooms, or designated workspaces in offices or commercial establishments. They allow natural light to flow freely throughout the space, making the area feel larger and more open. Available in a variety of styles, including clear, frosted, or tinted glass, our partitions can be customized to meet your specific needs for privacy and aesthetics.</p>', '', '', '{\"1\":[\"How long does it take to install a glass partition?\",\"The installation of a glass partition typically takes 1-2 days, depending on the size and complexity of the design.\"],\"2\":[\"Can glass partitions be customized to fit my space?\",\"Yes, glass partitions are customizable in size, style, and design. We work with you to create a partition system that perfectly fits your space and needs.\"],\"3\":[\"Are glass partitions safe and durable?\",\"Yes, we use tempered or laminated glass, which is highly durable, shatter-resistant, and safe for both office and home use.\"],\"4\":[\"Do you offer soundproof glass partitions?\",\"Yes, we offer soundproof glass partitions, which are ideal for creating quiet, private spaces in busy environments like offices, clinics, or conference rooms.\"]}', '1', '1', 1),
(107, 260, 270, 'included', 9, 0, 'TV Installation', 'tv-installation', 'Professional TV installation and wall mounting service for a sleek, modern setup that optimizes your viewing experience and enhances your living space.', 'TV,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation,TV Mounting,TV Setup,Home Theater Installation,TV Wall Mount,Smart TV Setup,TV Installation Service,Television Mounting', 'public/uploads/services/1667971901_1ee8644d6b298e3f7c7c.jpg', 200, 140, 5, '480', 0, 0, 1, 0, '', 9, 1, 1, '2022-11-09 05:31:41', '2025-05-23 06:23:01', '<p>Our TV Installation service provides a hassle-free, professional solution to mounting your TV securely on the wall or setting it up on a stand. We offer expert mounting services for flat-screen TVs, smart TVs, and home theater systems, ensuring that your TV is properly installed with all cables hidden and the setup optimized for the best viewing angle. Whether you\'re installing in your living room, bedroom, or home theater, we ensure a clean, professional look and a fully functional setup that enhances your home entertainment experience.</p>', '[\"public\\/uploads\\/services\\/1747981381_f1d19979faff9efbe272.jpg\",\"public\\/uploads\\/services\\/1747981381_41ca971dd152ffa49dc9.jpg\",\"public\\/uploads\\/services\\/1747981381_aef270fdd06c02f412d1.jpg\",\"public\\/uploads\\/services\\/1747981381_a49360abd158d7962cde.jpg\",\"public\\/uploads\\/services\\/1747981381_1514c241a9f8ef824b0a.jpg\",\"public\\/uploads\\/services\\/1747981381_0a6d6a39f0d3567c5a15.jpg\"]', '', '[[\"How long does it take to install a TV?\",\"The installation time usually takes between 1-2 hours, depending on the size of the TV, complexity of the wall mount, and additional setup (e.g., connecting to streaming services or other devices).\"],[\"Can you install my TV on a brick or concrete wall?\",\"Yes, we can install TVs on brick, concrete, and other types of walls. We use the proper anchors and brackets to ensure a secure and safe installation.\"],[\"Will you hide the cables?\",\"Yes, cable management is included in the installation process. We can hide cables within the walls, use cable covers, or organize cables neatly depending on your preference and the room setup.\"],[\"Do I need to provide the mounting brackets?\",\"If you have your own mounting bracket, we can use it for installation. If not, we offer a variety of mounting brackets based on your TV size and wall type, and we can recommend the best option for your setup.\"]]', '1', '1', 1),
(108, 283, 270, 'included', 7, 0, 'Drawer Installation', 'drawer-installation', 'Drawer Installation Trained and certified carpenters with hassle-free Drawer Installation service', 'Drawer,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation,Drawer Installation,Cabinet Drawers,Storage Solutions,Custom Drawers,Furniture Installation,Home Organization,Drawer Setup', 'public/uploads/services/1667971959_22e3c03daafe8276e9e1.jpg', 150, 105, 2, '120', 5, 10, 0, 0, '', 3, 1, 1, '2022-11-09 05:32:39', '2025-05-23 06:27:59', '<p style=\"text-align: left;\">Our Drawer Installation service offers expert installation of drawers in cabinets, wardrobes, or custom furniture pieces, maximizing storage efficiency and improving the overall organization of your space. Whether you need to install a single drawer or a full set of drawers in your kitchen, office, or bedroom, we provide reliable and precise installation. We work with various drawer styles, including traditional, soft-close, pull-out, and custom designs, ensuring that your drawers function smoothly and look great.</p>', '[\"public\\/uploads\\/services\\/1747981679_35f52a59ba47d882001a.jpg\",\"public\\/uploads\\/services\\/1747981679_b39d9b7c3733c11048c6.jpg\",\"public\\/uploads\\/services\\/1747981679_f6651deec30e00e95665.jpg\",\"public\\/uploads\\/services\\/1747981679_f5d0573c93f3dc1e2d89.jpg\",\"public\\/uploads\\/services\\/1747981679_ce296b5335ebf1025f7a.jpg\",\"public\\/uploads\\/services\\/1747981679_da3623a13c6d7366c8b1.jpg\"]', '', '{\"1\":[\"How long does it take to install a drawer?\",\"Installation time depends on the number of drawers and the complexity of the installation. Generally, it takes 30-60 minutes per drawer.\"],\"2\":[\"Can I install drawers in an existing cabinet?\",\"Yes, we can retrofit drawers into existing cabinets, depending on the available space and structure. If the cabinet requires modifications, we will ensure it fits and functions well.\"],\"3\":[\"Do you provide custom drawer designs?\",\"Yes, we offer custom drawer designs tailored to your storage needs, including specialized drawers for specific items like spices, cutlery, or larger storage needs.\"],\"4\":[\"Is soft-close technology included in the drawer installation?\",\"Soft-close mechanisms are available as an upgrade. They allow the drawers to close smoothly and quietly, adding a high-end feel to your furniture.\"]}', '1', '1', 1),
(109, 283, 270, 'included', 11, 0, 'Door Installation', 'door-installation', 'Professional installation of interior and exterior doors, including custom, sliding, and French doors, to enhance security, privacy, and aesthetics in your home or office.', 'Door,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation,Door Installation,Door Setup,Door Replacement,Exterior Doors,Interior Doors,Custom Doors,Door Frame,Home Renovation', 'public/uploads/services/1667972038_44f3121b4ebd7a473a9d.jpg', 300, 270, 3, '480', 5, 10, 1, 0, '', 4, 1, 1, '2022-11-09 05:33:58', '2025-05-23 06:34:23', '<p data-start=\"481\" data-end=\"1043\">Our Door Installation service offers expert installation of both interior and exterior doors, tailored to your space and design preferences. Whether you\'re replacing an old door, installing a new door for a fresh look, or adding custom doors for specific needs, our experienced team ensures that each door is installed securely, properly aligned, and functioning perfectly. We provide various styles and materials, including wooden, glass, sliding, and French doors, allowing you to choose the best option for your home or office.</p>', '[\"public\\/uploads\\/services\\/1747982063_6d09d6b60bca05f65f59.jpg\",\"public\\/uploads\\/services\\/1747982063_506b66df9ffd1d3e5bf0.jpg\",\"public\\/uploads\\/services\\/1747982063_32b0297e9be68aea2dea.jpg\",\"public\\/uploads\\/services\\/1747982063_377d2fc4325b1b1d7d2b.jpg\",\"public\\/uploads\\/services\\/1747982063_30b5b01b016f7d4f5fa3.jpg\",\"public\\/uploads\\/services\\/1747982063_14a775adc6873156eaa4.jpg\",\"public\\/uploads\\/services\\/1747982063_67b6c8d3327e3f35ca66.jpg\"]', '', '{\"1\":[\"How long does it take to install a door?\",\"Installation typically takes 1-3 hours per door, depending on the type and complexity of the installation. Custom doors or larger installations may take longer.\"],\"2\":[\"Do I need to provide the door, or can you supply it?\",\"You can provide the door if you have a specific model in mind, or we can help you choose and supply a wide range of door options based on your preferences.\"],\"3\":[\"Can you install a door if the frame needs to be replaced?\",\"Yes, we can replace the door frame as part of the installation service to ensure a secure and properly aligned fit for the door.\"],\"4\":[\"What type of doors are best for my home?\",\"The choice of door depends on your needs for security, privacy, and aesthetics. For exterior doors, we recommend solid wood, steel, or fiberglass for security and durability. For interior doors, hollow core or solid wood options are common, while sliding and French doors are perfect for enhancing open spaces or transitioning between rooms.\"]}', '1', '1', 1),
(110, 283, 270, 'included', 12, 0, 'Furniture Repair', 'furniture-repair', 'Professional furniture repair services that restore, fix, and enhance the functionality and aesthetics of your furniture, ensuring it looks and functions like new.', 'Furniture,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation,Furniture Repair,Furniture Restoration,Wood Repair,Upholstery Repair,Furniture Refurbishment,Custom Furniture Repair,Antique Furniture Repair', 'public/uploads/services/1667972090_ae6494b629a0a3d93b2e.jpg', 200, 100, 3, '480', 5, 10, 0, 0, '', 5, 1, 1, '2022-11-09 05:34:50', '2025-05-23 10:25:02', '<p>Our Furniture Repair service offers expert repairs for all types of furniture, including wooden, upholstered, leather, and metal pieces. Over time, furniture can become damaged or worn, but with our professional restoration and repair services, we can return your pieces to their original condition, prolonging their life and improving their appearance. Whether it&rsquo;s fixing a broken chair, reupholstering a sofa, or restoring antique furniture, we use high-quality materials and craftsmanship to deliver the best results.</p>', '', '', '{\"1\":[\"How long does it take to repair my furniture?\",\"The time required depends on the type of repair. Simple repairs may take 1-2 hours, while larger restoration projects (like reupholstering or refinishing) can take several days.\"],\"2\":[\"Do you repair all types of furniture?\",\"Yes, we offer repair services for all types of furniture, including wooden, upholstered, leather, and metal pieces. We also specialize in restoring antique furniture.\"],\"3\":[\"Is furniture repair worth it, or should I just buy new furniture?\",\"Furniture repair is often a cost-effective solution, especially for high-quality or sentimental pieces. Repairing and restoring furniture can be more affordable than buying new and extends the life of your furniture.\"],\"4\":[\"Can you match the original finish or upholstery?\",\"Yes, we can match the original wood finish or upholstery pattern. We offer custom refinishing and reupholstering services to restore your furniture to its original look.\"]}', '1', '1', 1),
(111, 297, 246, 'included', 7, 0, 'General Pest Control', 'general-pest-control-1', 'General Pest is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests,Pest Control,Exterminator,Home Pest Control,Commercial Pest Control,Pest Prevention,Termite Control,Rodent Control,Insect Control', 'public/uploads/services/1667973335_baf355118aba7e8825a2.jpg', 60, 54, 3, '120', 5, 10, 1, 0, '', 4, 1, 1, '2022-11-09 05:55:35', '2025-05-23 10:27:36', '<p>Our General Pest Control service offers comprehensive solutions to eliminate and prevent common pests such as ants, termites, rodents, cockroaches, spiders, and more. Whether you\'re dealing with an existing infestation or looking to prevent future pest problems, our expert team uses safe, effective methods to ensure your space is free from pests. We use eco-friendly, non-toxic treatments that are safe for children and pets while providing long-lasting results.</p>', '', '', '{\"1\":[\"How often should I schedule pest control treatments?\",\"For general pest control, it\'s recommended to schedule treatments quarterly for regular maintenance and prevention. However, if you have a current infestation, more frequent visits may be necessary until the issue is resolved.\"],\"2\":[\"Are the pest control treatments safe for pets and children?\",\"Yes, we use eco-friendly, non-toxic methods for most treatments. However, some treatments may require you to keep pets and children out of the treated area for a short period, which will be communicated by the technician.\"],\"3\":[\"How can I prevent pests from entering my home?\",\"We provide pest prevention services that include sealing cracks, gaps, and entry points around your home. Regular cleaning and reducing food sources also help prevent infestations.\"],\"4\":[\"Do you offer a guarantee on your pest control services?\",\"Yes, we offer a satisfaction guarantee on our pest control services. If pests return within a specified period after treatment, we will return for a follow-up visit to address the issue at no additional cost.\"]}', '1', '1', 1),
(112, 297, 246, 'included', 9, 0, 'Termite Control', 'termite-control', 'Expert termite control services to eliminate active infestations and prevent future damage, ensuring your home or business remains safe and protected from termites.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests,Termite Control,Termite Extermination,Pest Control,Termite Treatment,Termite Prevention,Home Protection,Termite Inspection', 'public/uploads/services/1667973444_466d5fb8494c50ce1a70.jpg', 50, 40, 3, '180', 5, 10, 1, 0, '', 4, 1, 1, '2022-11-09 05:57:24', '2025-05-23 10:33:21', '<p data-start=\"474\" data-end=\"1049\">Our Termite Control service offers specialized treatment to eliminate termite infestations and prevent future damage to your property. Termites can cause significant structural damage if left unchecked, and our team uses proven, safe, and effective methods to treat and protect your home or business. We begin with a thorough inspection to identify active infestations and areas at risk, followed by treatment and long-term prevention strategies. Our termite control services are designed to protect your investment and give you peace of mind.</p>', '', '', '{\"1\":[\"How do I know if I have termites?\",\"Common signs of a termite infestation include wood that sounds hollow when tapped, mud tubes on walls or foundations, discarded wings near windows or doors, and visible damage to wooden structures. A professional inspection is the best way to confirm the presence of termites.\"],\"2\":[\"How long does termite treatment take?\",\"The duration of termite treatment depends on the size of your property and the type of treatment used. Typically, liquid treatments can take 1-2 days, while fumigation may require 1-3 days to complete.\"],\"3\":[\"Is termite treatment safe for my family and pets?\",\"Yes, our termite treatments are safe when applied correctly. We use eco-friendly products for most treatments, and for fumigation, we take necessary precautions to ensure the safety of your family and pets during and after the procedure.\"],\"4\":[\"How often should I schedule termite treatment?\",\"If you\\u2019ve had an active infestation, it\\u2019s recommended to schedule termite treatment every 1-3 years to ensure continued protection. Regular inspections can help detect potential problems early.\"]}', '1', '1', 1);
INSERT INTO `services` (`id`, `user_id`, `category_id`, `tax_type`, `tax_id`, `tax`, `title`, `slug`, `description`, `tags`, `image`, `price`, `discounted_price`, `number_of_members_required`, `duration`, `rating`, `number_of_ratings`, `on_site_allowed`, `is_cancelable`, `cancelable_till`, `max_quantity_allowed`, `is_pay_later_allowed`, `status`, `created_at`, `updated_at`, `long_description`, `other_images`, `files`, `faqs`, `at_store`, `at_doorstep`, `approved_by_admin`) VALUES
(113, 297, 250, 'included', 10, 0, 'Bed Bugs Control', 'bed-bugs-control', 'Professional bed bug control services to eliminate infestations and prevent future issues, ensuring your home or business is bed bug-free and comfortable.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests,Bed Bug Treatment,Bed Bug Extermination,Pest Control,Bed Bug Removal,Bed Bug Prevention,Home Pest Control,Insect Control', 'public/uploads/services/1667973610_7de914ec2e5e6a89d7c2.jpg', 80, 64, 3, '300', 5, 10, 1, 0, '', 6, 1, 1, '2022-11-09 06:00:10', '2025-05-23 10:34:29', '<p>Our Bed Bugs Control service provides comprehensive solutions to identify, treat, and eliminate bed bug infestations in your home, office, or commercial space. Bed bugs are notorious for hiding in small cracks and crevices, making them difficult to detect without professional inspection. Our expert team uses safe and effective methods, such as heat treatment, chemical treatments, and integrated pest management, to ensure a bed bug-free environment. We also offer preventative measures to ensure your space stays protected from future infestations.</p>', '', '', '{\"1\":[\"How do I know if I have a bed bug infestation?\",\"Common signs of a bed bug infestation include red, itchy bites on the skin, blood stains on sheets or mattress covers, small dark spots (feces), and the presence of bed bugs themselves. A professional inspection can confirm an infestation.\"],\"2\":[\"How long does it take to eliminate bed bugs?\",\"The duration of the treatment depends on the severity of the infestation. Chemical treatments typically take 1-2 visits, while heat treatments can eliminate bed bugs in a single session. Follow-up visits may be required to ensure complete eradication.\"],\"3\":[\"Are bed bug treatments safe for my family and pets?\",\"Yes, we use safe and eco-friendly treatments whenever possible. For chemical treatments, we ensure that they are applied in a way that is safe for children and pets, and we recommend temporarily vacating the treated area for a short time.\"],\"4\":[\"How can I prevent bed bugs from coming back?\",\"Regular inspections, using protective covers for mattresses, and avoiding second-hand furniture or clothing from infested areas are some ways to prevent future infestations. Our prevention plan includes sealing cracks and crevices and regular monitoring.\"]}', '1', '1', 1),
(114, 297, 249, 'included', 10, 0, 'Cockroach Control', 'cockroach-control', ' Expert cockroach control services to eliminate infestations and prevent future issues, ensuring your home or business remains clean, safe, and roach-free.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests,Cockroach Extermination,Pest Control,Roach Removal,Cockroach Prevention,Pest Management,Insect Control', 'public/uploads/services/1667973678_4dab164563d459b3ccf2.jpg', 70, 63, 2, '180', 5, 10, 1, 0, '', 3, 1, 1, '2022-11-09 06:01:18', '2025-05-23 11:21:00', '<p>Our Cockroach Control service provides effective solutions to eliminate cockroach infestations and prevent them from returning. Cockroaches are resilient pests that can spread diseases and cause allergic reactions, making it essential to address an infestation quickly and thoroughly. Our expert team uses a combination of chemical treatments, traps, and preventive measures to target cockroaches at all stages of their life cycle. We ensure a safe, pest-free environment for your home or business with eco-friendly and effective treatments.</p>', '', '', '[[\"How do I know if I have a cockroach infestation?\",\"Signs of a cockroach infestation include seeing roaches during the day, noticing droppings (small, black pellets), or finding damaged food packaging. A professional inspection can confirm an infestation.\"],[\"How long does it take to eliminate cockroaches?\",\"Cockroach treatments can take 1-2 visits, depending on the severity of the infestation. Some follow-up visits may be necessary to ensure complete eradication.\"],[\"Are the chemicals used in cockroach treatment safe?\",\"Yes, we use eco-friendly and safe insecticides, and we take the necessary precautions to protect children, pets, and other inhabitants during the treatment process.\"],[\"Can cockroaches return after treatment?\",\"While our treatments are highly effective, cockroaches can return if proper sanitation and preventive measures are not maintained. We recommend follow-up visits and regular monitoring to ensure long-term control.\"]]', '1', '1', 1),
(115, 297, 248, 'included', 10, 0, 'Rodents/Mice/Rat Control', 'rodentsmicerat-control', 'Comprehensive rodent control services to eliminate mice, rats, and other rodents from your home or business, ensuring a safe and clean environment.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests,Rodent Control,Mice Control,Rat Extermination,Rodent Removal,Pest Control,Mice Prevention,Rat Control,Wildlife Management', 'public/uploads/services/1667973741_c56a9fd2897103bd6a67.jpg', 60, 54, 2, '120', 5, 10, 0, 0, '', 6, 1, 1, '2022-11-09 06:02:21', '2025-05-23 11:20:21', '<p>Our Rodents/Mice/Rat Control service provides professional and humane solutions to eliminate rodent infestations, including mice and rats, from your property. Rodents are not only a nuisance but also carry diseases and can cause significant damage to property. Our expert team conducts a thorough inspection to identify signs of infestation, entry points, and breeding areas. We use safe and effective methods, including traps, bait stations, and sealing entry points, to eliminate and prevent rodent issues. Whether you have a minor infestation or a more severe problem, we provide tailored solutions to ensure your home or business is rodent-free.</p>', '', '', '{\"1\":[\"How do I know if I have a rodent infestation?\",\"Signs of a rodent infestation include hearing scratching noises in walls or ceilings, seeing droppings (small black pellets), chewed wires or furniture, or noticing nests made of shredded materials. A professional inspection can confirm the presence of rodents.\"],\"2\":[\"Are the methods used for rodent control safe?\",\"Yes, we use safe and humane methods for trapping and controlling rodents. We also ensure that any chemicals used, such as rodenticides, are applied carefully to minimize risks to pets and children.\"],\"3\":[\"How long does it take to eliminate rodents from my property?\",\"The length of time depends on the size of the infestation. Simple treatments may take a day or two, while larger infestations may require several visits over the course of 1-2 weeks for full elimination.\"],\"4\":[\"Can I prevent rodents from entering my home?\",\"Yes, we provide rodent-proofing services that seal up entry points around doors, windows, vents, and other potential entryways. Additionally, keeping your home clean and free of food debris, as well as regular maintenance of the exterior, can help prevent future infestations.\"]}', '1', '1', 1),
(116, 297, 251, 'included', 9, 0, 'Ants Control', 'ants-control', 'Professional ant control services to eliminate and prevent ant infestations in your home or business, ensuring a clean, pest-free environment.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests,Ant Control,Ant Extermination,Pest Control,Ant Removal,Pest Management,Insect Control,Home Ant Treatment', 'public/uploads/services/1667973812_ffc6322b2e910786e9ae.jpg', 60, 54, 3, '120', 5, 10, 0, 0, '', 3, 1, 1, '2022-11-09 06:03:32', '2025-05-23 11:22:51', '<p>Our Ants Control service provides effective solutions to eliminate ant infestations and prevent them from returning. Ants can be a persistent nuisance, invading kitchens, bathrooms, and other areas of your home or business. Whether you\'re dealing with common household ants, carpenter ants, or fire ants, we offer tailored treatments to get rid of them. Our expert team uses eco-friendly, safe methods to eliminate ants, block their entry points, and treat their nests to ensure long-term control.</p>', '', '', '{\"1\":[\"How do I know if I have an ant infestation?\",\"Signs of an ant infestation include seeing ant trails, particularly around food sources, finding small piles of debris or dead ants, or spotting nests inside or outside your home.\"],\"2\":[\"How long does it take to eliminate ants from my property?\",\"Ant treatment may take 1-2 visits, depending on the severity of the infestation. Ant baiting systems may take a few days to show results, as ants carry the poison back to their colony.\"],\"3\":[\"Are the methods used for ant control safe for my family and pets?\",\"Yes, we offer safe and eco-friendly treatments for ant control. We use non-toxic methods whenever possible, and chemical treatments are applied with care to ensure the safety of children and pets.\"],\"4\":[\"What can I do to prevent ants from coming back?\",\"We provide advice on keeping your home clean, sealing entry points, and eliminating food sources. Regularly inspecting your property and maintaining preventive measures will help reduce the likelihood of future infestations.\"]}', '1', '1', 1),
(117, 297, 246, 'included', 7, 0, 'Snakes Catching', 'snakes-catching', 'Safe and professional snake catching and removal services, ensuring your home or business is free from snakes and protected from potential risks.\r\n\r\n', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1667974017_d2a73e6fc15444e02c93.jpg', 80, 72, 2, '30', 5, 10, 1, 0, '', 3, 1, 1, '2022-11-09 06:06:57', '2025-05-23 12:54:23', '<p>Our Snakes Catching service offers safe, humane, and efficient solutions to remove snakes from your home, business, or property. Snakes can be a dangerous presence, especially if they are venomous or pose a threat to pets and people. Our trained professionals specialize in snake catching and removal, ensuring that the snakes are safely relocated without harm. We also provide snake prevention measures to protect your space from future intrusions. Whether it&rsquo;s a garden snake, venomous species, or a simple scare, we handle snake removal with precision and care.</p>', '', '', '[[\"How do I know if I have a snake problem?\",\"Signs of a snake problem include finding a snake in or around your home, seeing tracks or skin shed, noticing holes or gaps where snakes can enter, or hearing rustling sounds from hidden areas.\"],[\"Are the snakes killed during removal?\",\"No, we use humane methods to capture and relocate snakes safely. Our goal is to remove the snake without causing harm and release it back into its natural environment far from your property.\"],[\"Can you handle venomous snakes?\",\"Yes, our team is trained and equipped to safely catch and remove venomous snakes. We take extra precautions when handling potentially dangerous species.\"],[\"How can I prevent snakes from entering my property?\",\"We offer snake-proofing services, which include sealing gaps, doors, and windows, removing food sources, and reducing areas that attract snakes (such as tall grass, piles of wood, or standing water).\"]]', '1', '1', 1),
(118, 297, 246, 'included', 10, 0, 'Bee Hive Removal', 'bee-hive-removal', 'Safe and professional bee hive removal services, providing effective removal of bee hives while ensuring the safety of your property and protecting bees whenever possible.', 'Bee Hive Removal,pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests,Bee Extermination,Pest Control,Bee Nest Removal,Honeybee Control,Bee Relocation,Wildlife Control', 'public/uploads/services/1667974142_a51ad1075d38b4e2ba14.jpg', 70, 56, 3, '60', 5, 10, 1, 0, '', 3, 1, 1, '2022-11-09 06:09:02', '2025-05-23 13:29:47', '<p>Our Bee Hive Removal service specializes in safely removing bee hives from residential, commercial, and industrial properties. Bees can create nests in walls, roofs, attics, or outdoor spaces, posing a threat to the safety of people and pets if left unchecked. While we prioritize humane removal methods and protect beneficial bees when possible, we also ensure that your property is free from the risks associated with bee hives, such as stings, structural damage, or infestations. We offer expert bee hive removal, relocation, and prevention services to ensure your space remains safe and bee-free.</p>', '', '', '[[\"How do I know if I have a bee hive on my property?\",\"Common signs include seeing a large number of bees flying around one particular area, discovering bees entering and exiting a hole or crack in your building, or noticing a buzzing sound inside walls or ceilings.\"],[\"Are the bees harmed during removal?\",\"We prioritize humane bee removal and relocation whenever possible. If relocation is not feasible, we take necessary precautions to eliminate the hive without harming the environment.\"],[\"What happens to the bees after they are removed?\",\"When possible, we relocate the bees to a safe environment, such as a local apiary or wooded area. In cases of extermination, we ensure safe and environmentally friendly disposal.\"],[\"How can I prevent bees from nesting in my property again?\",\"We offer sealing and prevention services to block entry points where bees can build their nests. Regular inspections can also help detect potential bee activity before it becomes a problem.\"]]', '1', '1', 1),
(132, 263, 240, 'included', 16, 0, 'Tap repair ', 'tap-repair', 'Professional tap repair services to fix leaky or malfunctioning faucets, ensuring a fully functional and water-efficient system in your home or business.', 'Tap repair,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower,Faucet Repair,Plumbing Repair,Leaky Tap,Faucet Replacement,Plumbing Services,Water Leak Repair', 'public/uploads/services/1667984710_60711076fd98a6b864af.jpg', 400, 320, 2, '60', 0, 0, 0, 0, '', 3, 1, 1, '2022-11-09 09:05:10', '2025-05-23 13:42:15', '<p data-start=\"431\" data-end=\"967\">Our Tap Repair service specializes in fixing leaking or broken taps, faucets, and plumbing fixtures to restore proper water flow and prevent unnecessary water wastage. Whether you have a leaky faucet in your kitchen, bathroom, or utility room, our expert plumbers provide fast and reliable repairs. We also offer faucet replacements if the damage is beyond repair. From minor fixes to major repairs, our team is equipped to handle any tap-related issue, ensuring your plumbing system is in top condition.</p>\r\n<p>&nbsp;</p>\r\n<p data-start=\"972\" data-end=\"1102\">&nbsp;</p>', '', '', '{\"1\":[\"Why is my tap leaking?\",\"A leaking tap is often caused by worn-out washers, seals, or cartridges. Over time, these components can deteriorate, causing water to leak even when the tap is turned off.\"],\"2\":[\"Can you fix a tap without replacing it?\",\"Yes, in many cases, we can repair a tap by replacing only the damaged parts, such as washers, cartridges, or seals. If the damage is too severe, we may recommend replacing the tap altogether.\"],\"3\":[\"How long does it take to repair a tap?\",\"Tap repairs typically take about 30 minutes to 1 hour, depending on the complexity of the issue. More extensive repairs or faucet replacements may take longer.\"],\"4\":[\"How can I prevent my taps from leaking in the future?\",\"Regular maintenance, such as checking washers, seals, and cartridges for wear and tear, can help prevent leaks. Additionally, avoiding turning taps too tightly can reduce strain on the components and prolong their life.\"]}', '1', '1', 1),
(133, 298, 240, 'included', 16, 0, 'Tap installation', 'tap-installation', 'Professional tap installation service for kitchens, bathrooms, and other areas, ensuring a secure, functional, and stylish faucet setup.', 'Tap installation,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower,Faucet Installation,Kitchen Tap Installation,Bathroom Faucet Installation,Plumbing Installation,Home Improvement,Water Fixtures', 'public/uploads/services/1667984836_a552c71721a88aebf150.jpg', 300, 240, 2, '60', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-09 09:07:16', '2025-05-30 06:46:45', '<p data-start=\"471\" data-end=\"975\">Our Tap Installation service offers expert installation for all types of taps, whether you are upgrading, replacing, or installing a new faucet in your kitchen, bathroom, laundry, or utility areas. We handle a variety of faucet models including single-handle, double-handle, pull-out, touchless, and high-tech sensor-based taps. Our skilled plumbers ensure the installation is done securely, with proper fittings and adjustments, providing a smooth, functional water flow.</p>', '[\"public\\/uploads\\/services\\/1748587605_4cdbeb11c99ddcdc3b2f.jpg\",\"public\\/uploads\\/services\\/1748587605_98279e282bd14eb37653.jpg\",\"public\\/uploads\\/services\\/1748587605_869b23ef3ef8d7170234.jpg\",\"public\\/uploads\\/services\\/1748587605_9817edbf4613cede7f75.jpg\",\"public\\/uploads\\/services\\/1748587605_3ce6280e6405efaf9a87.jpg\"]', '', '[[\"How long does it take to install a tap?\",\"Tap installation typically takes around 30-60 minutes, depending on the type of tap and any necessary adjustments to plumbing.\"],[\"Can I choose the type of tap I want?\",\"Absolutely! You can choose the tap style and model, and we can help guide you in selecting the best option based on your space and usage needs.\"],[\"Do you provide the taps, or do I need to purchase them myself?\",\"We can either install the tap you provide or help you choose a suitable tap from a selection of high-quality brands and models.\"],[\"What should I do if my new tap is leaking after installation?\",\"Leaking could be due to improper sealing or a faulty part. If this happens, we offer follow-up services to fix any issues. It\\u2019s rare but we ensure all installations are done with precision.\"]]', '1', '1', 1),
(134, 298, 240, 'included', 16, 0, 'Tap replacement', 'tap-replacement', 'Professional tap replacement services to remove old or damaged faucets and install new, functional, and stylish taps in kitchens, bathrooms, and other areas.', 'Tap replacement,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower,Faucet Replacement,Kitchen Faucet Replacement,Bathroom Faucet Replacement,Plumbing Services,Home Improvement,Faucet Installation', 'public/uploads/services/1667984986_e879da5413a38943e119.jpg', 300, 210, 1, '60', 5, 10, 1, 0, '', 1, 1, 1, '2022-11-09 09:09:46', '2025-05-30 09:18:53', '<p>Our Tap Replacement service offers expert replacement of old, damaged, or malfunctioning taps with new, high-quality faucets. Whether you need to replace a leaky kitchen faucet, a worn-out bathroom tap, or an outdated fixture, our skilled plumbers provide efficient and hassle-free replacement services. We work with a wide range of taps, including modern touchless, traditional, pull-out, and high-tech faucets. Our team ensures the new tap is securely installed, with all necessary adjustments for a smooth and fully functional water flow.</p>', '[\"public\\/uploads\\/services\\/1748596733_e332535449fdda13c6d1.jpg\",\"public\\/uploads\\/services\\/1748596733_c7bb8035d563dd8f94ac.jpg\",\"public\\/uploads\\/services\\/1748596733_828881d4d53f51dc303d.jpg\",\"public\\/uploads\\/services\\/1748596733_92dcaa3e2124a65e51e4.jpg\",\"public\\/uploads\\/services\\/1748596733_65ca2f609a106b455370.jpg\"]', '', '{\"1\":[\"How long does it take to replace a tap?\",\"Tap replacement typically takes around 30-60 minutes, depending on the complexity of the faucet and plumbing connections.\"],\"2\":[\"Do I need to purchase the new tap, or can you provide one?\",\"You can either purchase your new tap, or we can assist you in selecting the right tap from a variety of high-quality options that suit your needs and style.\"],\"3\":[\"What should I do if the new tap starts leaking after replacement?\",\"A leaking tap after replacement could be due to faulty installation or an issue with the new tap. If this happens, please contact us, and we will provide a follow-up visit to resolve the issue.\"],\"4\":[\"Why should I replace my old tap?\",\"Replacing old or damaged taps can improve water efficiency, prevent leaks, and enhance the overall look of your kitchen or bathroom. It also ensures better performance, reducing the risk of plumbing issues in the future.\"]}', '1', '1', 1),
(135, 298, 240, 'included', 0, 10, 'Hot & cold water mixer Tap installation', 'hot-&-cold-water-mixer-tap-installation', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Tap,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985118_eb8f80dc48df8bf4f7b6.jpg', 300, 240, 1, '60', 5, 10, 1, 0, '', 1, 1, 1, '2022-11-09 09:11:58', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(136, 298, 240, 'included', 0, 10, 'Pipeline leakage repair', 'pipeline-leakage-repair', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Pipeline,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985185_1e6c3ae985b1815fde42.jpg', 100, 90, 1, '60', 5, 1, 0, 0, '', 2, 1, 1, '2022-11-09 09:13:05', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(137, 298, 240, 'included', 0, 10, 'Jet Spray Installation/Repair ', 'jet-spray-installation/repair-', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Spray,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985243_f42f0f5beb38fda0f738.jpg', 200, 180, 1, '60', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-09 09:14:03', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(138, 298, 240, 'included', 0, 10, 'Flush tank repair ', 'flush-tank-repair-', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Flush tank,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985408_98429a39a56545840a91.jpg', 200, 160, 1, '90', 5, 10, 1, 0, '', 2, 1, 1, '2022-11-09 09:16:48', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(139, 298, 242, 'included', 0, 10, 'Shower installation (ceiling mounted)', 'shower-installation-(ceiling-mounted)', 'Shower installation Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Shower,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet', 'public/uploads/services/1667985607_1553b55dc38b3687818b.jpg', 200, 160, 1, '90', 5, 10, 1, 0, '', 2, 1, 1, '2022-11-09 09:20:07', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(140, 298, 241, 'included', 0, 10, 'Drainage pipe blockage removal', 'drainage-pipe-blockage-removal', 'Drainage pipe blockage removal Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Drainage pipe,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985675_aa01dd0798d13d278323.jpg', 300, 210, 3, '120', 5, 10, 0, 0, '', 5, 1, 1, '2022-11-09 09:21:15', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(141, 298, 240, 'included', 0, 10, 'Western toilet installation (floor mounted)', 'western-toilet-installation-(floor-mounted)', 'Western toilet installation Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'toilet,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,shower', 'public/uploads/services/1667985777_7ad9eb207c90ad20d53d.jpg', 300, 240, 2, '120', 5, 10, 1, 0, '', 3, 1, 1, '2022-11-09 09:22:57', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(142, 298, 240, 'included', 0, 10, 'Western toilet repair (floor mounted)', 'western-toilet-repair-(floor-mounted)', 'Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Western toilet,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985882_2ca4452a7b954cb1d621.jpg', 200, 180, 2, '60', 5, 10, 0, 1, '30', 3, 1, 1, '2022-11-09 09:24:42', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(143, 301, 221, 'included', 0, 10, 'Ac Installation-Uninstallation Service', 'ac-installation-uninstallation-service', 'AC Installation and Un-installation, for new as well as old Air conditioners', 'airconditioning,heating,airconditioner,cooling,airconditioninginstallation,service', 'public/uploads/services/1667988701_e257ec9edc3da3eb0628.jpg', 350, 280, 2, '120', 5, 2, 1, 0, '', 5, 1, 1, '2022-11-09 10:11:41', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(144, 301, 221, 'included', 0, 10, 'Ac Repair & Maintance Service', 'ac-repair-&-maintance-service', 'We, at Flew Air conditioning solution Provide Service Repair and Maintenance for multiple Types of Air conditioner (AC) like,', 'airconditioning,heating,airconditioner,cooling,airconditioninginstallation,service,Ac Repair,Maintance Service', 'public/uploads/services/1667988846_4f3ad09ee98ae1398503.jpg', 200, 120, 2, '120', 5, 3, 1, 0, '', 3, 1, 1, '2022-11-09 10:14:06', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(146, 301, 221, 'included', 0, 10, 'Ac Wash Service', 'ac-wash-service', 'We are offering Ac Wash OR Water Jet Wash service for multiple Types of Air conditioner (AC) like', 'Ac Wash Service,airconditioning,heating,airconditioner,cooling,airconditioninginstallation,service', 'public/uploads/services/1667989010_6fc127853cb3cfacd909.jpg', 200, 160, 1, '60', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-09 10:16:50', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(152, 293, 213, 'included', 0, 0, 'Kitchen Cleaning', 'kitchen-cleaning', 'House cleaners perform thorough cleanings of houses using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,Kitchen Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning', 'public/uploads/services/1667989553_8489bebca5831eedd304.jpg', 500, 400, 4, '120', 0, 0, 0, 0, '', 5, 1, 1, '2022-11-09 10:25:53', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(153, 297, 246, 'included', 0, 0, 'General Pest Control', 'general-pest-control', 'General Pest is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1667990002_802852d46960b911a446.jpg', 200, 180, 2, '60', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-09 10:33:22', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(154, 273, 267, 'included', 0, 0, 'Haircut', 'haircut', '\"Unlock a new level of style with our expert haircut service. Step into our salon and let our talented hairstylists create a look that reflects your unique personality and leaves you feeling confident and fabulous.\"', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667990160_2cb73070807d5799e1fd.jpg', 60, 54, 1, '30', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-09 10:36:00', '2025-03-26 13:44:06', '<p><strong>About the Process</strong></p>\r\n<table style=\"border-collapse: collapse; width: 100.073%;\" border=\"0\" cellspacing=\"5\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 3.67502%; text-align: left; vertical-align: middle;\"><img src=\"https://i.imgur.com/Db1VbId.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%; text-align: left; vertical-align: middle;\"><strong>Consultation</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">\r\n<p>Our hairstylist will begin by having a consultation with you to understand your desired haircut, style preferences, and any specific requests you may have.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/IbcdHaj.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Hair Preparation</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Next, your hair will be prepared for the haircut. This may involve washing and conditioning your hair, or it can be done on dry hair depending on your preference and the style you\'re aiming for.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/pALt5jG.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Cutting Technique</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Using professional cutting tools and techniques, our skilled hairstylist will carefully trim and shape your hair according to the agreed-upon style. They will ensure precision and attention to detail, making adjustments as needed to achieve the desired look.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/KWuKAfQ.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Styling and Finishing</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Once the haircut is complete, your hairstylist will style your hair to showcase the haircut\'s full potential. This may involve blow-drying, using styling products, and adding any finishing touches to create the desired final look.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/AUcAJvU.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Guidance and Maintenance Tips</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">To help you maintain your haircut at home, your hairstylist will provide you with guidance on styling techniques, recommended products, and any specific care instructions to keep your hair looking its best until your next visit.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/r3cS0GK.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Client Satisfaction</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Throughout the process, our hairstylist will ensure your satisfaction by actively listening to your feedback and addressing any concerns or requests you may have. Your happiness and confidence in your new haircut are our top priorities.</td>\r\n</tr>\r\n</tbody>\r\n</table>', '[\"public\\/uploads\\/services\\/1688636862_d12f843149c9350bf8cc.jpg\",\"public\\/uploads\\/services\\/1688636862_780879eab43ae577a73d.jpg\",\"public\\/uploads\\/services\\/1688636862_c2d6af0cf3d49fbb2e10.jpg\",\"public\\/uploads\\/services\\/1688636862_327749eddd96681c07e1.jpg\",\"public\\/uploads\\/services\\/1688636862_393a7ddb697ae73afa0c.jpg\",\"public\\/uploads\\/services\\/1688636862_baddf7b8af9910d4e7fa.jpg\",\"public\\/uploads\\/services\\/1688636862_938b075c33625beddeae.jpg\"]', '', '[[\"How do I choose the right haircut for me?\",\"Our experienced hairstylists are here to guide you. They will consider your face shape, hair texture, lifestyle, and personal preferences to help you select a haircut that complements your features and suits your individual style.\"],[\"Do I need to come with a specific haircut idea in mind?\",\"Not at all! Our hairstylists are skilled in providing personalized recommendations. Feel free to discuss your preferences and hair goals, and they will suggest suitable options tailored to enhance your unique look.\"],[\"Can I bring a photo of a haircut I like?\",\"Absolutely! Visual references can be helpful in communicating your desired haircut. Show our hairstylists any inspiration photos you have, and they will work with you to achieve a similar look that suits your hair type and face shape.\"],[\"What if I want to change my hairstyle significantly?\",\"Our hairstylists love creating transformative looks! Discuss your desire for a significant change during the consultation, and they will provide expert advice and recommendations to ensure a successful and stunning transformation.\"],[\" Can you provide haircare tips for maintaining my new haircut at home?\",\"Absolutely! Our hairstylists are more than happy to share professional tips and advice on how to maintain and style your haircut at home. They will recommend suitable products and techniques to keep your hair looking its best.\"],[\"What safety measures do you have in place?\",\"Your safety is our priority. We maintain strict hygiene and sanitation protocols in our salon, including regular disinfection, sanitization of tools, and adherence to social distancing guidelines. Rest assured, you can enjoy your haircut experience in a clean and safe environment.\"]]', '1', '1', 1),
(155, 0, 270, 'included', 0, 10, 'Kitchen Cabinets', 'kitchen-cabinets', 'Kitchen Cabinets Trained and certified carpenters with hassle-free Kitchen Cabinets service', 'kitchen,cabinets,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667990645_b9eaff1ad58c6932daa1.jpg', 400, 320, 5, '2880', 5, 10, 0, 0, '', 6, 1, 1, '2022-11-09 10:44:05', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(157, 298, 240, 'included', 0, 0, 'Tap repair ', 'tap-repair-', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Tap repair,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667990728_dd28bf1fec8c7a3ea84d.jpg', 100, 90, 1, '60', 0, 0, 0, 0, '', 1, 1, 1, '2022-11-09 10:45:28', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(159, 303, 236, 'included', 0, 0, 'Dry Cleaning', 'dry-cleaning', 'Laundry Tag provide a durable means to read garments automatically without a line-of-sight for multiple wash cycles.', 'Dry Cleaning,Premium Laundry,Steam Ironing,Laundry', 'public/uploads/services/1667992529_cb976ee3f08f89b3b2e0.jpg', 200, 180, 1, '120', 0, 0, 0, 1, '30', 2, 1, 1, '2022-11-09 11:15:29', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(160, 303, 235, 'included', 17, 0, 'Premium Laundry', 'premium-laundry', 'Some of the key particulars that might be present in a laundry tag include - customer name, order number, service', 'Premium Laundry,Laundry,drycleaning', 'public/uploads/services/1667993161_a210a3f35a6a88d33b98.jpg', 200, 160, 2, '160', 0, 0, 0, 1, '30', 20, 1, 1, '2022-11-09 11:26:01', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(161, 303, 222, 'included', 0, 0, 'Steam Ironing', 'steam-ironing', 'Popular Laundry Services in Bhuj', 'Steam Ironing,Dry cleaning,laundry,laundry service', 'public/uploads/services/1667993388_ba7e61b79aef22990b23.jpg', 200, 180, 2, '120', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-09 11:29:48', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(166, 293, 215, 'included', 0, 0, 'Room Cleaning', 'room-cleaning', 'room cleaning ', 'window,Bad,washroom,cleaning,badshit cleaning', 'public/uploads/services/1668495327_25ccf7925bb841b1ce1a.jpg', 200, 160, 1, '60', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-15 05:35:01', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(167, 327, 253, 'included', 12, 0, 'Outdoor Lighting', 'outdoor-lighting', 'Outdoor lighting', 'outdoor lighting,lighting,electric lighting', 'public/uploads/services/1668492807_6994fd53d848e72afd16.jpg', 100, 60, 2, '60', 0, 0, 0, 1, '30', 2, 1, 1, '2022-11-15 06:13:27', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(168, 327, 254, 'included', 0, 0, 'Fan installation', 'fan-installation', 'fan installation and best work ', 'fan,fan installation,ceiling fan', 'public/uploads/services/1668494551_68e96b953a9098ddc1ab.jpg', 100, 90, 1, '30', 5, 10, 0, 0, '', 3, 1, 1, '2022-11-15 06:42:31', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(169, 293, 216, 'included', 12, 0, 'Window cleaning', 'window-cleaning', '\"See the world through crystal-clear windows! Our professional window cleaning service leaves your glass sparkling, giving you a clear view and a brighter home.\"', 'window cleaning,room window,kitchen window cleaning', 'public/uploads/services/1668495264_c78d04d785708a8d4d43.jpg', 100, 85, 2, '60', 0, 0, 0, 0, '', 5, 1, 1, '2022-11-15 06:54:24', '2025-03-26 13:44:06', '<p><img src=\"https://img.freepik.com/free-vector/residential-windows-cleaning-service-illustration_1284-59083.jpg?w=2000&amp;t=st=1688543969~exp=1688544569~hmac=4de065ffebb41890af242f02b41c97b888d42985b101d8749331352cd0e9000f\" alt=\"\" width=\"2000\" height=\"893\" /></p>\r\n<p>&nbsp;</p>\r\n<table style=\"border-collapse: collapse; width: 100.073%;\" border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 100.001%; text-align: center; vertical-align: middle;\" colspan=\"2\"><strong>Thorough Cleaning</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 49.9272%;\"><img src=\"https://img.freepik.com/free-photo/man-cleaning-windows_23-2148119221.jpg?w=1480&amp;t=st=1688543757~exp=1688544357~hmac=4382c4f03fb8e9b7c8e66f07c42235ffdb86db76ee519eff75a1194de723001c\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 50.074%;\">\r\n<p style=\"color: grey; font-size: 8;\">Our highly trained technicians meticulously clean each window, paying attention to every detail. From removing dirt, fingerprints, and smudges to tackling stubborn stains, we leave no trace behind.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%; text-align: center; vertical-align: middle;\" colspan=\"2\"><strong>Streak-Free Brilliance</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 49.9272%;\"><img src=\"https://img.freepik.com/free-photo/people-housework-housekeeping-concept-happy-woman-gloves-cleaning-window-with-rag-cleanser-spray-home_231208-575.jpg?w=1800&amp;t=st=1688542612~exp=1688543212~hmac=6b34ff862ec876fa61ad9a361994f63ce07310e5da5ac422d5346386467c65cc\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 50.074%;\">\r\n<p style=\"color: grey; font-size: 8;\">Say goodbye to streaks and haze. We use professional-grade tools and techniques to ensure a streak-free shine, providing you with crystal-clear windows that let in abundant natural light.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%; text-align: center; vertical-align: middle;\" colspan=\"2\"><strong>Multi-Surface Expertise</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 49.9272%;\"><img src=\"https://img.freepik.com/free-photo/full-shot-people-cleaning-office_23-2150454557.jpg?w=826&amp;t=st=1688543698~exp=1688544298~hmac=6bd605fec7c1b0530aebdb321c0016f9ff9e9805ec3c6859e4c641f9f97de10c\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 50.074%;\">\r\n<p style=\"color: grey; font-size: 8;\">Our expertise extends beyond standard glass windows. We clean various window types, including skylights, glass doors, French windows, and more, restoring their beauty and clarity.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%; text-align: center; vertical-align: middle;\" colspan=\"2\"><strong>Hard-to-Reach Areas:</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 49.9272%;\"><img src=\"https://img.freepik.com/free-photo/workers-washing-windows-office-building_1153-4658.jpg?w=1800&amp;t=st=1688543657~exp=1688544257~hmac=de084038556effee0b863a270209c561f4ad8f363b77e336305ccaa98a87e802\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 50.074%;\">\r\n<p style=\"color: grey; font-size: 8;\">No window is too high or inaccessible for us. Our team is equipped with the right tools and expertise to clean windows in high-rise buildings or other challenging locations, ensuring all windows are immaculate.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', '[\"public\\/uploads\\/services\\/1688551164_8d7d4e31d731abc01f2f.jpg\",\"public\\/uploads\\/services\\/1688551164_afd13fb4916da3d523fc.jpg\",\"public\\/uploads\\/services\\/1688551164_2b091bef5b6b379fabc5.jpg\",\"public\\/uploads\\/services\\/1688551164_353d2e204929b4adaeed.jpg\",\"public\\/uploads\\/services\\/1688551164_bb9adab1cec4174ed253.jpg\",\"public\\/uploads\\/services\\/1688551164_20b56c64d94962f0e8c9.jpg\",\"public\\/uploads\\/services\\/1688551164_64ddc49f85b07bd627df.jpg\"]', '', '[[\"How often should I have my windows professionally cleaned?\",\"Regular window cleaning is recommended every six months to a year, depending on your location, weather conditions, and personal preference.\"],[\"Will you clean both the interior and exterior of my windows?\",\"Yes, our comprehensive window cleaning service covers both the inside and outside of your windows, ensuring a thorough and streak-free shine.\"],[\"What cleaning methods do you use for windows?\",\"We utilize a combination of industry-leading techniques, including eco-friendly cleaning solutions, professional-grade squeegees, and careful hand detailing to achieve exceptional results.\"],[\"Can you clean hard-to-reach windows or high-rise buildings?\",\"Absolutely! Our trained professionals are equipped to handle various window cleaning challenges, including hard-to-reach windows, skylights, and even high-rise buildings, utilizing safe and efficient access methods.\"],[\"Will your cleaning products harm my window frames or surroundings?\",\"We take great care to protect your window frames, sills, and surrounding areas. Our cleaning products are specifically chosen to be safe for your windows while effectively removing dirt and grime.\"]]', '1', '1', 1),
(170, 293, 217, 'included', 0, 0, 'Best washroom cleaning', 'best-washroom-cleaning', 'Blah Blah', 'washroom', 'public/uploads/services/1668495811_5dc02daf5851d12c38c0.jpg', 200, 140, 1, '159', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-15 07:03:31', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(171, 297, 247, 'included', 0, 0, 'Mosquitoes/Flies Control', 'mosquitoes/flies-control', 'Mosquitoes is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1668497597_adee1ab8dd3c8a41727c.jpg', 150, 120, 2, '30', 5, 10, 0, 0, '', 5, 1, 1, '2022-11-15 07:33:17', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(186, 270, 259, 'included', 12, 0, 'Carwash service ', 'carwash-service-', 'demo services description ', 'carwash', 'public/uploads/services/1681216669_56e59e19bdb11c176091.jpg', 300, 210, 30, '120', 0, 0, 0, 1, '30', 30, 1, 1, '2023-02-25 13:39:41', '2025-03-26 13:44:06', '<hr style=\"height: 1px; border-width: 0; color: gray;\" />\r\n<p><strong><br />When you choose our car wash service, you can expect the following benefits:</strong></p>\r\n<table style=\"border-collapse: collapse; width: 100.072%; margin-left: auto; margin-right: auto;\" border=\"0\" cellspacing=\"5\" cellpadding=\"10\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 100%;\"><strong>Impeccable Cleanliness:</strong> Our meticulous approach ensures that every inch of your vehicle is thoroughly cleaned, leaving no dirt, grime, or smudges behind. Your car will shine like new.</td>\r\n<td style=\"width: 50%;\"><img src=\"https://img.freepik.com/free-photo/man-wash-car-using-shampoo_1150-6986.jpg?w=2000&amp;t=st=1688538303~exp=1688538903~hmac=b760b70b1ff373bc465cdff69d7e1fdad6556ceed8c59df2e86ca9cbdd09dc47\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\"><img src=\"https://img.freepik.com/free-photo/man-washing-his-car-garage_1157-26072.jpg?w=2000&amp;t=st=1688538587~exp=1688539187~hmac=1920c467ba9fcf6885af0326db2a7bd1fb6d58a9c436ce68405edc585a77daa2\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 100%;\"><strong>Attention to Detail:</strong> Our skilled professionals pay close attention to even the smallest details, ensuring that every nook and cranny is meticulously cleaned. We leave no spot untouched.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100%;\"><strong>Premium Products and Techniques:</strong> We use top-quality products and employ cutting-edge techniques to deliver outstanding results. Your vehicle will receive the best treatment available.</td>\r\n<td style=\"width: 50%;\"><img src=\"https://img.freepik.com/free-vector/car-care-product-advertising-poster-with-bottle-high-quality-automobile-wax-luxury-class-sedan-realistic_1284-31735.jpg?w=2000&amp;t=st=1688538627~exp=1688539227~hmac=a067aaf58613686f7c2f816031f2360c570c286dc25f7e33d3aa0f5440c35a1c\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\"><img src=\"https://img.freepik.com/free-photo/man-polish-car-garage_1157-26061.jpg?w=2000&amp;t=st=1688538707~exp=1688539307~hmac=00594ca1f711f50e148c622b01381f91ff59a45d6dc8e581790b14bf2770661e\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 100%;\"><strong>Protection for Your Paintwork:</strong> Our car wash service not only cleans your vehicle but also helps protect its paintwork. We take care to use gentle methods that won\'t harm the finish of your car.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr style=\"height: 1px; border-width: 0; color: gray;\" />\r\n<p><img src=\"https://img.freepik.com/free-vector/car-wash-service-icons-set_1284-13386.jpg?w=1380&amp;t=st=1688539426~exp=1688540026~hmac=32a499d2b9163eb1879b763fc2c5958cccd372ce3b47ae681101949a4fec58e5\" alt=\"\" width=\"1380\" height=\"1380\" /></p>\r\n<hr style=\"height: 1px; border-width: 0; color: gray;\" />', '[\"public\\/uploads\\/services\\/1688540367_c4144b0607b78f7c857e.jpg\",\"public\\/uploads\\/services\\/1688540367_aabf8b8fcc48fe493157.jpg\",\"public\\/uploads\\/services\\/1688540367_c73d72db0f0799c2d606.jpg\",\"public\\/uploads\\/services\\/1688540367_21f99a7be637cdc94c37.jpg\",\"public\\/uploads\\/services\\/1688540367_b0ec87681c1f6857c853.jpg\",\"public\\/uploads\\/services\\/1688540367_0ea658d0b63d5c8b4c28.jpg\",\"public\\/uploads\\/services\\/1688540367_7cb901fd7af04b0d8c8e.jpg\"]', '[\"public\\/uploads\\/services\\/car-spa-wash-brochure.pdf\"]', '[[\"How often should I get my car washed?\",\"The frequency of car washes depends on various factors such as your location, driving conditions, and personal preferences. As a general guideline, it is recommended to wash your car every two weeks to maintain its cleanliness and protect the paintwork.\"],[\"Are your car wash products safe for my vehicle?\",\"Yes, we prioritize the use of high-quality and safe car wash products. Our cleaning agents are specifically formulated to be gentle on your vehicle\'s paintwork, leaving no harm or residue behind. We take utmost care to protect and maintain the integrity of your vehicle during the cleaning process.\"],[\"Can I remain in my car during the car wash?\",\"For safety reasons, it is generally recommended that customers exit their vehicles during the car wash process. Our car wash facility is designed to accommodate customers comfortably while their vehicles are being cleaned. You can relax in our waiting area and enjoy complimentary amenities while we take care of your car.\"],[\"Can you remove stubborn stains or odors from the interior of my car?\",\"Yes, we offer interior cleaning services that target stains, spills, and odors. Our skilled team uses specialized cleaning techniques and products to tackle various interior issues. However, please note that the complete removal of certain stains or odors may depend on their severity and the type of material affected.\"]]', '1', '1', 1);
INSERT INTO `services` (`id`, `user_id`, `category_id`, `tax_type`, `tax_id`, `tax`, `title`, `slug`, `description`, `tags`, `image`, `price`, `discounted_price`, `number_of_members_required`, `duration`, `rating`, `number_of_ratings`, `on_site_allowed`, `is_cancelable`, `cancelable_till`, `max_quantity_allowed`, `is_pay_later_allowed`, `status`, `created_at`, `updated_at`, `long_description`, `other_images`, `files`, `faqs`, `at_store`, `at_doorstep`, `approved_by_admin`) VALUES
(188, 293, 270, 'included', 12, 0, 'Ceiling Fan cleaning', 'ceiling-fan-cleaning', '\"Revitalize your ceiling fan with our expert cleaning service, restoring its performance and leaving it dust-free and sparkling.\"', 'Fan cleaning', 'public/uploads/services/1678440084_41c4481c262e17a1ed6a.jpg', 500, 450, 2, '50', 0, 0, 0, 0, '', 5, 1, 1, '2023-03-10 09:21:24', '2025-03-26 13:44:06', '<table style=\"border-collapse: collapse; width: 100.072%; height: 530.555px; border-style: dashed;\" border=\"0\" cellspacing=\"0\" cellpadding=\"1\">\r\n<tbody>\r\n<tr style=\"height: 44.7969px;\">\r\n<td style=\"width: 97.8053%; height: 44.7969px;\"><strong>Sparkling Clean Blades:</strong> Bid farewell to layers of dust and grime. Our skilled technicians will meticulously clean every blade, leaving them spotless and gleaming.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 67.1875px;\">\r\n<td style=\"width: 97.8053%; height: 67.1875px;\"><strong>Enhanced Performance:</strong> A clean ceiling fan operates more efficiently, ensuring better airflow and improved cooling in your space. Experience the full potential of your fan\'s performance.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 67.1953px;\">\r\n<td style=\"width: 97.8053%; height: 67.1953px;\"><strong>Fresher Indoor Air:</strong> Dust and allergens can accumulate on ceiling fan blades, leading to poor air quality. Our thorough cleaning removes these particles, helping you breathe cleaner, fresher air.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 67.1953px;\">\r\n<td style=\"width: 97.8053%; height: 67.1953px;\"><strong>Quieter Operation:</strong> Dust build-up on fan blades can cause annoying squeaks or rattles. Our cleaning service eliminates dirt and debris, resulting in a quieter and more peaceful fan operation.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 67.1953px;\">\r\n<td style=\"width: 97.8053%; height: 67.1953px;\"><strong>Professional Expertise:</strong> Our experienced technicians possess the knowledge and tools to clean even the most hard-to-reach fans safely. Leave the ladder climbing to us and enjoy hassle-free cleaning.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 67.1875px;\">\r\n<td style=\"width: 97.8053%; height: 67.1875px;\"><strong>Protecting Your Space:</strong> We take extra care to safeguard your furniture and floors during the cleaning process. Our team utilizes protective coverings to ensure no mess is left behind.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 44.7969px;\">\r\n<td style=\"width: 97.8053%; height: 44.7969px;\"><strong>Time-Efficient Service:</strong> We value your time, and our efficient team strives to complete the cleaning promptly, minimizing any disruption to your daily routine.</td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '', '[[\"Is your ceiling fan covered in dust and grime?\",\"Say goodbye to dusty blades with our professional ceiling fan cleaning service!\"],[\"Why should I clean my ceiling fan regularly?\",\"Regular cleaning ensures optimal performance, eliminates allergens, and maintains a clean and fresh environment.\"],[\"How do you clean hard-to-reach ceiling fans?\",\"Our skilled technicians have the tools and expertise to safely clean even the highest and most inaccessible ceiling fans.\"],[\"Will cleaning my ceiling fan make it run smoother and quieter?\",\"Absolutely! By removing dirt and debris, we enhance your fan\'s performance, \"],[\"Can a dirty ceiling fan affect the air quality in my home?\",\"Yes, accumulated dust and allergens on the fan blades can be circulated back into the air you breathe. Our cleaning service helps maintain a healthier indoor environment.\"]]', '1', '1', 1),
(217, 50, 252, 'included', 9, 0, 'Festive Lights installations', 'festive-lights-installations', 'Installation of festive lights', 'lights,festival', 'public/uploads/services/1683700067_c19d13e06e183df54ee5.jpg', 100, 70, 5, '30', 4.5396825396825, 63, 0, 1, '300000', 10, 1, 1, '2023-03-14 11:16:34', '2025-05-27 10:09:06', '', '', '', '', '1', '1', 1),
(218, 50, 252, 'included', 9, 0, 'Geyser Installation', 'geyser-installation', 'Installation Of Geyser', 'Geyser,Installation', 'public/uploads/services/1681216644_365559e5ac42355a4174.jpg', 250, 200, 12, '30', 4.5, 58, 0, 1, '30', 30, 1, 1, '2023-03-14 11:18:29', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(219, 50, 221, 'included', 12, 0, 'AC switchbox Installation', 'ac-switchbox-installation', 'Installation of one AC switch box', 'AC,switch,installation', 'public/uploads/services/1681216596_c9c93aa54bef44a100aa.jpg', 400, 320, 20, '60', 4.5272727272727, 55, 0, 1, '30', 10, 1, 1, '2023-03-14 11:20:58', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(220, 50, 252, 'included', 9, 0, 'Switchboard Repair', 'switchboard-repair', 'When your switchboard is causing electrical disruptions or malfunctioning, our professional Switchboard Repair Service is here to restore the power and keep your electrical system running smoothly. We understand the frustration that arises from flickering lights, tripping circuits, or faulty switches. With our expertise, we swiftly diagnose and repair issues with your switchboard, ensuring safety and optimal functionality. Whether it\'s a faulty circuit breaker, damaged wiring, or a need for an upgrade, our skilled technicians will provide reliable solutions. Trust us to handle your switchboard repairs efficiently, so you can enjoy a safe and uninterrupted power supply.', 'repair,switchboard', 'public/uploads/services/1681216554_1e86ba39c02990669efb.jpg', 150, 105, 2, '2', 4.5322580645161, 62, 0, 1, '30', 120, 1, 1, '2023-03-14 11:22:54', '2025-05-23 12:50:50', '', '', '', '{\"1\":[\"Why is my switchboard malfunctioning?\",\"Switchboards can malfunction due to various reasons, such as overloaded circuits, faulty wiring, loose connections, or damaged components. Our technicians can identify the specific issue and provide the necessary repairs.\"],\"2\":[\"What are the signs that indicate a problem with my switchboard?\",\"Signs of switchboard issues include frequent tripping of circuit breakers, flickering lights, burning smells, buzzing sounds, or outlets not functioning. If you notice any of these signs, it\'s important to seek professional switchboard repairs.\"],\"3\":[\"Is it dangerous to have a faulty switchboard?\",\"Yes, a faulty switchboard can pose serious safety risks, including electrical shocks, fires, or damage to electrical appliances. It\'s crucial to address switchboard issues promptly by seeking professional repair services.\"],\"4\":[\"How long does switchboard repair typically take?\",\"The duration of switchboard repairs depends on the complexity of the issue. Simple repairs can be completed relatively quickly, while more extensive repairs or upgrades may require additional time. Our technicians work efficiently to minimize any inconvenience caused.\"]}', '1', '1', 1),
(221, 50, 252, 'included', 12, 0, 'Fan repair', 'fan-repair', 'Is your fan not working as it should? Don\'t sweat it! Our professional Fan Repairing Service is here to keep you cool and comfortable. With our expertise and swift repairs, we\'ll have your fan spinning again in no time. Whether it\'s a faulty motor, malfunctioning switch, or wiring issue, our skilled technicians will diagnose and fix the problem efficiently. Say goodbye to sleepless nights or stuffy rooms. Experience the breeze of relief with our reliable Fan Repairing Service.', 'fan,repair', 'public/uploads/services/1681216503_808c4dc166a9e61fac4f.jpg', 200, 180, 2, '120', 4.5178571428571, 56, 0, 1, '30', 1, 1, 1, '2023-03-14 11:25:09', '2025-03-26 13:44:06', '', '', '', '[[\"How do I know if my fan needs repair?\",\"Signs that your fan may need repair include slow or erratic spinning, unusual noises, complete fan failure, or issues with the fan\'s controls. If you notice any of these signs, it\'s best to seek professional repair services.\"],[\"How long does fan repair usually take?\",\"The duration of fan repair depends on the specific issue and the availability of replacement parts, if needed. Simple repairs can often be completed within a short time, while more complex issues may require additional time for diagnostics and repairs.\"],[\"Should I attempt to repair the fan myself?\",\"Fan repair involves electrical components and can be dangerous if you lack the necessary expertise. It\'s recommended to leave fan repairs to professional technicians who have the knowledge and experience to handle electrical repairs safely.\"]]', '1', '1', 1),
(222, 50, 252, 'included', 12, 0, 'MCB fuse replacement', 'mcb-fuse-replacement', 'Upgrade your electrical safety with our professional MCB fuse replacement service. Ensure reliable circuit protection and peace of mind.', 'MCB,fuse,replacement', 'public/uploads/services/1680947082_339c8e3764a7cce54c09.jpg', 150, 120, 2, '50', 4.5084745762712, 59, 0, 1, '45', 25, 1, 1, '2023-03-14 11:26:59', '2025-03-30 11:11:55', '', '[\"public\\/uploads\\/services\\/1687870769_30a4b440c963a29978a8.jpg\"]', '[\"public\\/uploads\\/services\\/How-it-Works.docx\"]', '{\"1\":[\"What is an MCB fuse replacement service?\",\"An MCB fuse replacement service involves replacing faulty or outdated MCB (Miniature Circuit Breaker) fuses in electrical distribution boards or consumer units. It ensures proper circuit protection and helps maintain electrical safety.\"],\"2\":[\"Why do I need MCB fuse replacement?\",\"Over time, MCB fuses can become faulty, wear out, or become outdated. Replacing them is crucial to maintain the integrity of your electrical system, prevent electrical hazards, and ensure reliable circuit protection.\"],\"3\":[\"How do I know if my MCB fuses need replacement?\",\"Signs that your MCB fuses may need replacement include frequent tripping, overheating, buzzing sounds, or visible signs of damage. It\'s best to consult a qualified electrician who can assess and determine if replacement is necessary.\"],\"4\":[\"How long does the MCB fuse replacement process take?\",\"The duration of the MCB fuse replacement process depends on various factors, such as the number of fuses to be replaced and the complexity of the electrical system. Typically, a professional electrician can complete the replacement efficiently and promptly.\"]}', '1', '1', 1),
(223, 293, 238, 'included', 12, 0, 'Carpet Cleaning', 'carpet-cleaning', 'Revive the beauty of your home with our professional carpet cleaning service. Our expert team uses advanced techniques and eco-friendly cleaning solutions to remove dirt, stains, and allergens from your carpets, leaving them fresh, clean, and vibrant. Whether it\'s a high-traffic area or a special rug, we take care of every detail to ensure your carpets look and feel their best. Experience the difference of a deep and thorough carpet cleaning that not only enhances the appearance of your space but also promotes a healthier indoor environment. Trust us to bring new life to your carpets and leave your home feeling refreshed.', 'carpet,cleaning,home carpet,sofa carpet', 'public/uploads/services/1696483020_055119628e60fff81826.jpg', 500, 450, 0, '120', 0, 0, 0, 1, '30', 5, 1, 1, '2023-10-05 05:17:00', '2025-03-26 13:44:06', '<header>\r\n<h1>Welcome to Our Carpet Cleaning Services</h1>\r\n</header>\r\n<section>\r\n<h2>Why Choose Us?</h2>\r\n<p>At [Your Company Name], we specialize in providing top-notch carpet cleaning services that transform your carpets and leave your home looking and feeling fresh. Our team of experienced professionals is dedicated to delivering outstanding results that meet your highest expectations.</p>\r\n<p>Here\'s why you should choose our carpet cleaning services:</p>\r\n<ul>\r\n<li>State-of-the-art equipment: We use the latest and most advanced carpet cleaning technology to ensure deep cleaning and stain removal.</li>\r\n<li>Experienced technicians: Our trained and certified technicians have years of experience in carpet cleaning and are committed to excellence.</li>\r\n<li>Eco-friendly solutions: We prioritize the use of environmentally friendly cleaning products that are safe for your family and pets.</li>\r\n<li>Customized services: Every carpet is unique, and we tailor our cleaning approach to meet the specific needs of your carpets.</li>\r\n</ul>\r\n</section>\r\n<section>\r\n<h2>Our Services</h2>\r\n<p>We offer a wide range of carpet cleaning services, including:</p>\r\n<ul>\r\n<li>Deep steam cleaning</li>\r\n<li>Stain and spot removal</li>\r\n<li>Carpet odor removal</li>\r\n<li>Carpet protection and sealing</li>\r\n<li>Area rug cleaning</li>\r\n</ul>\r\n<p>No matter the size or condition of your carpets, we have the expertise to revitalize them and restore their original beauty.</p>\r\n</section>', '', '', '[[\"What sets your carpet cleaning service apart from others?\",\"we stand out because of our commitment to excellence. We use state-of-the-art equipment and eco-friendly cleaning solutions to ensure a deep and thorough carpet cleaning. Our experienced technicians are dedicated to providing outstanding results tailored to your specific needs.\"],[\"How often should I have my carpets professionally cleaned?\",\"The frequency of professional carpet cleaning depends on various factors, including foot traffic, pets, and lifestyle. As a general guideline, most households benefit from annual or biannual carpet cleaning. However, high-traffic areas may require more frequent cleaning. Our team can assess your specific situation and recommend a suitable cleaning schedule during your consultation.\"],[\"Is your carpet cleaning process safe for children and pets?\",\"Yes, our carpet cleaning process is safe for children and pets. We prioritize the use of eco-friendly and non-toxic cleaning solutions that are gentle on your carpets and safe for your loved ones. Our technicians take extra care to ensure that no harmful residues are left behind after the cleaning process, providing a clean and healthy environment for your family and pets.\"]]', '1', '1', 1),
(224, 2126, 213, 'included', 11, 0, 'Bathroom Cleaning', 'bathroom-cleaning', 'Deep cleaning for a fresh and hygienic bathroom!\r\nWe remove soap scum, sanitize surfaces, and scrub floors to give you a spotless and germ-free bathroom.', 'Bathroom,Cleaning,Home,Clean,bath', '1739446933_4dc7148cd4f6025615f3.jpg', 540, 420, 2, '60', 0, 0, 0, 1, '60', 6, 1, 1, '2025-01-28 13:05:27', '2025-02-13 11:42:13', '<p>Our bathroom cleaning service includes a deep cleanse of sinks, toilets, bathtubs, showers, and mirrors. We remove stubborn stains, soap scum, and hard water deposits to ensure a sparkling clean finish. Floors and tiles are scrubbed and sanitized to eliminate bacteria and germs. Our team also disinfects high-touch areas like doorknobs and handles. We use high-quality, eco-friendly cleaning products for a fresh and hygienic bathroom.</p>', '[\"public\\/uploads\\/services\\/1738069527_3dd5046eebe9b12f65a2.jpg\",\"public\\/uploads\\/services\\/1738069527_07829284cde1aee98376.jpg\",\"public\\/uploads\\/services\\/1738069527_c786f3fde79823f88673.jpg\"]', '', '[[\"How often should I get my bathroom cleaned?\",\"We recommend weekly cleaning for maintenance and deep cleaning every month to prevent mold and bacteria buildup.\"],[\"Do you clean showerheads and faucets?\",\"Yes! We descale and sanitize showerheads, faucets, and other fixtures to remove limescale and bacteria.\"],[\"Can you remove hard water stains and mold?\",\"Absolutely! Our team uses specialized cleaning solutions to tackle hard water stains, soap scum, and mold buildup.\"],[\"Do I need to clear my bathroom before the cleaning?\",\"It\\u2019s helpful if personal items like toiletries and towels are removed, but our team can work around them if needed.\"]]', '0', '1', 1),
(225, 2126, 213, 'included', 6, 0, 'Kitchen Cleaning', 'kitchen-cleaning', 'Thorough cleaning of kitchen countertops, sinks, appliances, and cabinets, ensuring a hygienic and grease-free environment.', 'Kitchen', 'public/uploads/services/1739278795_14f0b79b7785507b4b2c.png', 620, 550, 4, '20', 0, 0, 0, 1, '20', 2, 1, 1, '2025-02-11 12:59:55', '2025-02-11 12:59:55', '<p>Our kitchen cleaning service covers everything from countertops to appliances. We deep clean sinks, stovetops, ovens, and cabinets, removing grease and food stains. The team ensures every surface is wiped, sanitized, and free from bacteria. Floors are swept and mopped for a spotless finish. We also take care of dishwashing, trash disposal, and organizing pantry shelves. Enjoy a fresh and hygienic cooking space with our thorough cleaning service.</p>', '', '', '[]', '1', '1', 1),
(229, 50, 213, 'excluded', 6, 0, 'dehydrating service', 'smoothmeal', 'deydrating', 'dehydrating', 'public/uploads/services/1743251034_361448bdf0bc84c721e2.jpg', 500, 450, 1, '120', 0, 0, 0, 0, '', 1, 1, 1, '2025-03-29 12:23:54', '2025-04-02 11:33:38', '<p>Dehydrating service .It is good</p>', '', '', '[]', '0', '0', 1),
(230, 270, 234, 'included', 12, 0, 'ProBrake Solutions', 'probrake-solutions', 'Your vehicle’s brake system is one of its most critical safety components. At [Your Garage Name], we provide professional and reliable brake repair services to keep you and your passengers safe on the road. Whether you’re hearing squeaking sounds, feeling vibrations, or your brake warning light is on, our team is here to help.', 'brake', 'public/uploads/services/1745487062_483d13bc5f0bf8c8bea3.jpg', 250, 239, 1, '25', 0, 0, 0, 1, '30', 149, 1, 1, '2025-04-24 09:31:02', '2025-04-24 09:31:42', '<h2>Our Brake Services Include:</h2>\r\n<h3>???? Brake Inspection</h3>\r\n<p>We perform a thorough inspection of all brake system components including brake pads, rotors, calipers, brake lines, and fluid levels to detect any wear or damage.</p>\r\n<h3>????️ Brake Pad Replacement</h3>\r\n<p>Worn brake pads can reduce stopping power and damage other parts of your braking system. We use high-quality pads that provide smooth and safe braking.</p>\r\n<h3>???? Brake Rotor Resurfacing or Replacement</h3>\r\n<p>Rotors can warp or wear unevenly over time. We&rsquo;ll determine whether resurfacing or replacing your rotors is the safest and most cost-effective option.</p>\r\n<h3>???? Brake Fluid Flush</h3>\r\n<p>Old or contaminated brake fluid can lead to poor brake performance. We flush the old fluid and replace it with new, manufacturer-recommended brake fluid.</p>\r\n<h3>???? Caliper Service &amp; Replacement</h3>\r\n<p>Brake calipers are responsible for pressing the pads against the rotors. If they&rsquo;re sticking or leaking, it can compromise braking performance.</p>\r\n<h2>Why Choose Us?</h2>\r\n<ul>\r\n<li>✔️ Certified Technicians</li>\r\n<li>✔️ Genuine OEM &amp; High-Quality Aftermarket Parts</li>\r\n<li>✔️ Transparent Estimates &amp; No Hidden Charges</li>\r\n<li>✔️ Fast Turnaround Time</li>\r\n<li>✔️ Warranty on All Repairs</li>\r\n</ul>\r\n<h2>Signs You Might Need Brake Repair:</h2>\r\n<ul>\r\n<li>Squeaking, squealing, or grinding noises</li>\r\n<li>Vibration when braking</li>\r\n<li>Spongy or soft brake pedal</li>\r\n<li>Car pulling to one side while braking</li>\r\n<li>Increased stopping distance</li>\r\n<li>Brake warning light on dashboard</li>\r\n</ul>\r\n<h2>Schedule Your Brake Inspection Today!</h2>\r\n<p>Don&rsquo;t take chances with your safety. If you suspect a brake issue, visit <strong>[Your Garage Name]</strong> or book an appointment online. Our expert team will make sure your brakes are road-ready and reliable.</p>', '', '', '[[\"How do I know if my brakes need repair?\",\"Common signs include squeaking or grinding noises, vibration when braking, a soft or spongy brake pedal, longer stopping distance, or the brake warning light turning on.\"],[\"How often should I replace my brake pads?\",\"On average, brake pads should be replaced every 30,000 to 70,000 kilometers, but it depends on your driving habits and vehicle type. Regular inspections are the best way to know for sure.\"],[\"What happens if I ignore brake issues?\",\"Ignoring brake problems can lead to more expensive repairs later, reduced braking performance, or even complete brake failure, putting your safety at serious risk.\"],[\"Do you use original parts for replacements?\",\"Yes, we use genuine OEM parts or high-quality aftermarket alternatives, based on your preference and vehicle requirements.\"],[\"Is it safe to drive with squeaky brakes?\",\"Squeaky brakes might just be dirty, but they could also mean worn-out pads or damaged components. It\\u2019s best to get them inspected as soon as possible to avoid risks.\"]]', '1', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services_ratings`
--

CREATE TABLE `services_ratings` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `rating` double NOT NULL,
  `comment` varchar(4096) DEFAULT NULL,
  `images` text DEFAULT NULL COMMENT 'multiple images( comma separated )',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `custom_job_request_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `variable` varchar(35) NOT NULL,
  `value` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`, `created_at`, `updated_at`) VALUES
(1, 'test', '{\"val\" : \"this\"}', '2022-04-21 05:59:17', '0000-00-00 00:00:00'),
(2, 'languages', '{\"ar-XA\":\"Arabic [Switzerland]\",\"bn-IN\":\"Bengali [India]\",\"en-GB\":\"English [United Kingdom]\",\"fr-CA\":\"French [Canada]\",\"en-US\":\"English [United States of America]\",\"es-ES\":\"Spanish \\/ Castilian [Spain]\",\"fi-FI\":\"Finnish [Finland]\",\"gu-IN\":\"Gujarati [India]\",\"ja-JP\":\"Japanese (ja) [Japan]\",\"kn-IN\":\"Kannada [India]\",\"ml-IN\":\"Malayalam [India]\",\"sv-SE\":\"Swedish [Sweden]\",\"ta-IN\":\"Tamil [India]\",\"tr-TR\":\"Turkish [Turkey]\",\"ms-MY\":\"Malay [Malaysia]\",\"pa-IN\":\"Punjabi [India]\",\"cs-CZ\":\"Czech [Czech Republic]\",\"de-DE\":\"German [Germany]\",\"en-AU\":\"English [Australia]\",\"en-IN\":\"English [India]\",\"es-US\":\"Spanish \\/ Castilian [United States of America]\",\"fr-FR\":\"French [France, French Republic]\",\"hi-IN\":\"Hindi [India]\",\"id-ID\":\"Indonesian [Indonesia]\",\"it-IT\":\"Italian [Italy]\",\"ko-KR\":\"Korean [Korea]\",\"ru-RU\":\"Russian [Russian Federation]\",\"uk-UA\":\"Ukrainian [Ukraine]\",\"cmn-CN\":\"Mandarin Chinese [China]\",\"cmn-TW\":\"Mandarin Chinese [Taiwan]\",\"da-DK\":\"Danish [Denmark]\",\"el-GR\":\"Greek \\/ Modern [Greece]\",\"fil-PH\":\"Filipino \\/ Pilipino [Philippines]\",\"hu-HU\":\"Hungarian [Hungary]\",\"nb-NO\":\"Norwegian Bokm\\u00e5l [Norway]\",\"nl-BE\":\"Dutch [Belgium]\",\"nl-NL\":\"Dutch [Netherlands the]\",\"pt-PT\":\"Portuguese [Portugal, Portuguese Republic]\",\"sk-SK\":\"Slovak [Slovakia (Slovak Republic)]\",\"vi-VN\":\"Vietnamese [Vietnam]\",\"pl-PL\":\"Polish [Poland]\",\"pt-BR\":\"Portuguese [Brazil]\",\"ca-ES\":\"Catalan; Valencian [Spain]\",\"yue-HK\":\"Yue Chinese [Hong Kong]\",\"af-ZA\":\"Afrikaans [South Africa]\",\"bg-BG\":\"Bulgarian [Bulgaria]\",\"lv-LV\":\"Latvian [Latvia]\",\"ro-RO\":\"Romanian \\/ Moldavian \\/ Moldovan [Romania]\",\"sr-RS\":\"Serbian [Serbia]\",\"th-TH\":\"Thai [Thailand]\",\"te-IN\":\"Telugu [India]\",\"is-IS\":\"Icelandic [Iceland]\",\"cy-GB\":\"Welsh [United Kingdom]\",\"en-GB-WLS\":\"English [united kingdom]\",\"es-MX\":\"Spanish \\/ Castilian [Mexico]\",\"en-NZ\":\"English [New Zealand]\",\"en-ZA\":\"English [South Africa]\",\"ar-EG\":\"Arabic [Egypt]\",\"ar-SA\":\"Arabic [Saudi Arabia]\",\"de-AT\":\"German [Austria]\",\"de-CH\":\"German [Switzerland, Swiss Confederation]\",\"en-CA\":\"English [Canada]\",\"en-HK\":\"English [Hong Kong]\",\"en-IE\":\"English [Ireland]\",\"en-PH\":\"English [Philippines]\",\"en-SG\":\"English [Singapore]\",\"es-AR\":\"Spanish \\/ Castilian [Argentina]\",\"es-CO\":\"Spanish \\/ Castilian [Colombia]\",\"et-EE\":\"Estonian [Estonia]\",\"fr-BE\":\"French [Belgium]\",\"fr-CH\":\"French [Switzerland, Swiss Confederation]\",\"ga-IE\":\"Irish [Ireland]\",\"he-IL\":\"Hebrew (modern) [Israel]\",\"hr-HR\":\"Croatian [Croatia]\",\"lt-LT\":\"Lithuanian [Lithuania]\",\"mr-IN\":\"Marathi [India]\",\"mt-MT\":\"Maltese [Malta]\",\"sl-SI\":\"Slovene [Slovenia]\",\"sw-KE\":\"Swahili [Kenya]\",\"ur-PK\":\"Urdu [Pakistan]\",\"zh-CN\":\"Chinese [China]\",\"zh-HK\":\"Chinese [Hong Kong]\",\"zh-TW\":\"Chinese [Taiwan]\",\"es-LA\":\"Spanish \\/ Castilian [Lao]\",\"ar-MS\":\"Arabic [Montserrat]\"}', '2022-04-21 05:59:17', '0000-00-00 00:00:00'),
(13, 'payment_gateways_settings', '{\"cod_setting\":1,\"payment_gateway_setting\":1,\"paypal_status\":\"enable\",\"paypal_mode\":\"sandbox\",\"paypal_business_email\":\"sb-wwo4914722035@business.example.com\",\"paypal_currency_code\":\"USD\",\"paypal_webhook_url\":\"https:\\/\\/webhook.in\\/api\\/webhooks\\/paypal\",\"paypal_website_url\":\"https:\\/\\/website.me\",\"paypal_client_key\":\"client APi key\",\"paypal_secret_key\":\"secret key\",\"razorpayApiStatus\":\"enable\",\"razorpay_mode\":\"test\",\"razorpay_currency\":\"INR\",\"razorpay_secret\":\"secret\",\"razorpay_key\":\"razorpay key\",\"endpoint\":\"https:\\/\\/test.in\\/api\\/webhooks\\/razorpay\",\"paystack_status\":\"enable\",\"paystack_mode\":\"test\",\"paystack_currency\":\"GHS\",\"paystack_secret\":\"secret\",\"paystack_key\":\"paystack keyendpoint.in\\/api\\/webhooks\\/paystack\",\"stripe_status\":\"enable\",\"stripe_mode\":\"test\",\"stripe_currency\":\"INR\",\"stripe_publishable_key\":\"publishable_key\",\"stripe_webhook_secret_key\":\"webhook_secret\",\"stripe_secret_key\":\"secret_key\",\"stripe_endpoint\":\"endpoint.in\\/api\\/webhooks\\/stripe\",\"flutterwave_status\":\"enable\",\"flutterwave_currency_code\":\"NGN\",\"flutterwave_public_key\":\"public-key\",\"flutterwave_secret_key\":\"secret-key\",\"flutterwave_encryption_key\":\"encryption-key\",\"flutterwave_webhook_secret_key\":\"webhook_key\",\"flutterwave_endpoint\":\"endpoint.in\\/api\\/webhooks\\/flutterwave\",\"flutterwave_website_url\":\"url.me\"}', '2025-06-02 11:06:48', '0000-00-00 00:00:00'),
(15, 'terms_conditions', '{\"terms_conditions\":\"<h2>Introduction<\\/h2>\\r\\n<p>These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, edemand accessible at edemand.<\\/p>\\r\\n<p>These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions. These Terms and Conditions have been generated with the help of the <a href=\\\"https:\\/\\/www.termsfeed.com\\/blog\\/sample-terms-and-conditions-template\\/\\\">Terms And Conditions Sample Template<\\/a>.<\\/p>\\r\\n<p>Minors or people below 18 years old are not allowed to use this Website.<\\/p>\\r\\n<h2>Intellectual Property Rights<\\/h2>\\r\\n<p>Other than the content you own, under these Terms, edemand and\\/or its licensors own all the intellectual property rights and materials contained in this Website.<\\/p>\\r\\n<p>You are granted limited license only for purposes of viewing the material contained on this Website.<\\/p>\\r\\n<h2>Restrictions<\\/h2>\\r\\n<p>You are specifically restricted from all of the following:<\\/p>\\r\\n<ul>\\r\\n<li>publishing any Website material in any other media;<\\/li>\\r\\n<li>selling, sublicensing and\\/or otherwise commercializing any Website material;<\\/li>\\r\\n<li>publicly performing and\\/or showing any Website material;<\\/li>\\r\\n<li>using this Website in any way that is or may be damaging to this Website;<\\/li>\\r\\n<li>using this Website in any way that impacts user access to this Website;<\\/li>\\r\\n<li>using this Website contrary to applicable laws and regulations, or in any way may cause harm to the Website, or to any person or business entity;<\\/li>\\r\\n<li>engaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this Website;<\\/li>\\r\\n<li>using this Website to engage in any advertising or marketing.<\\/li>\\r\\n<\\/ul>\\r\\n<p>Certain areas of this Website are restricted from being access by you and edemand may further restrict access by you to any areas of this Website, at any time, in absolute discretion. Any user ID and password you may have for this Website are confidential and you must maintain confidentiality as well.<\\/p>\\r\\n<h2>Your Content<\\/h2>\\r\\n<p>In these Website Standard Terms and Conditions, \\\"Your Content\\\" shall mean any audio, video text, images or other material you choose to display on this Website. By displaying Your Content, you grant edemand a non-exclusive, worldwide irrevocable, sub licensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.<\\/p>\\r\\n<p>Your Content must be your own and must not be invading any third-party\'s rights. edemand reserves the right to remove any of Your Content from this Website at any time without notice.<\\/p>\\r\\n<h2>No warranties<\\/h2>\\r\\n<p>This Website is provided \\\"as is,\\\" with all faults, and edemand express no representations or warranties, of any kind related to this Website or the materials contained on this Website. Also, nothing contained on this Website shall be interpreted as advising you.<\\/p>\\r\\n<h2>Limitation of liability<\\/h2>\\r\\n<p>In no event shall edemand, nor any of its officers, directors and employees, shall be held liable for anything arising out of or in any way connected with your use of this Website whether such liability is under contract. &nbsp;edemand, including its officers, directors and employees shall not be held liable for any indirect, consequential or special liability arising out of or in any way related to your use of this Website.<\\/p>\\r\\n<h2>Indemnification<\\/h2>\\r\\n<p>You hereby indemnify to the fullest extent edemand from and against any and\\/or all liabilities, costs, demands, causes of action, damages and expenses arising in any way related to your breach of any of the provisions of these Terms.<\\/p>\\r\\n<h2>Severability<\\/h2>\\r\\n<p>If any provision of these Terms is found to be invalid under any applicable law, such provisions shall be deleted without affecting the remaining provisions herein.<\\/p>\\r\\n<h2>Variation of Terms<\\/h2>\\r\\n<p>edemand is permitted to revise these Terms at any time as it sees fit, and by using this Website you are expected to review these Terms on a regular basis.<\\/p>\\r\\n<h2>Assignment<\\/h2>\\r\\n<p>The edemand is allowed to assign, transfer, and subcontract its rights and\\/or obligations under these Terms without any notification. However, you are not allowed to assign, transfer, or subcontract any of your rights and\\/or obligations under these Terms.<\\/p>\\r\\n<h2>Entire Agreement<\\/h2>\\r\\n<p>These Terms constitute the entire agreement between edemand and you in relation to your use of this Website, and supersede all prior agreements and understandings.<\\/p>\\r\\n<h2>Governing Law &amp; Jurisdiction<\\/h2>\\r\\n<p>These Terms will be governed by and interpreted in accordance with the laws of the State of in, and you submit to the non-exclusive jurisdiction of the state and federal courts located in in for the resolution of any disputes.<\\/p>\\r\\n<p>&nbsp;<\\/p>\"}', '2023-05-02 04:02:05', '0000-00-00 00:00:00'),
(16, 'privacy_policy', '{\"privacy_policy\":\"<p>At eDemand, accessible from https:\\/\\/edemand.wrteam.me, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by eDemand and how we use it.<\\/p>\\r\\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.<\\/p>\\r\\n<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and\\/or collect in eDemand. This policy is not applicable to any information collected offline or via channels other than this website.<\\/p>\\r\\n<h2>Consent<\\/h2>\\r\\n<p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.<\\/p>\\r\\n<h2>Information we collect<\\/h2>\\r\\n<p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.<\\/p>\\r\\n<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and\\/or attachments you may send us, and any other information you may choose to provide.<\\/p>\\r\\n<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.<\\/p>\\r\\n<h2>How we use your information<\\/h2>\\r\\n<p>We use the information we collect in various ways, including to:<\\/p>\\r\\n<ul>\\r\\n<li>Provide, operate, and maintain our website<\\/li>\\r\\n<li>Improve, personalize, and expand our website<\\/li>\\r\\n<li>Understand and analyze how you use our website<\\/li>\\r\\n<li>Develop new products, services, features, and functionality<\\/li>\\r\\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes<\\/li>\\r\\n<li>Send you emails<\\/li>\\r\\n<li>Find and prevent fraud<\\/li>\\r\\n<\\/ul>\\r\\n<h2>Log Files<\\/h2>\\r\\n<p>eDemand follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring\\/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.<\\/p>\\r\\n<h2>Advertising Partners Privacy Policies<\\/h2>\\r\\n<p>You may consult this list to find the Privacy Policy for each of the advertising partners of eDemand.<\\/p>\\r\\n<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on eDemand, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and\\/or to personalize the advertising content that you see on websites that you visit.<\\/p>\\r\\n<p>Note that eDemand has no access to or control over these cookies that are used by third-party advertisers.<\\/p>\\r\\n<h2>Third Party Privacy Policies<\\/h2>\\r\\n<p>eDemand\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.<\\/p>\\r\\n<p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.<\\/p>\\r\\n<h2>CCPA Privacy Rights (Do Not Sell My Personal Information)<\\/h2>\\r\\n<p>Under the CCPA, among other rights, California consumers have the right to:<\\/p>\\r\\n<p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.<\\/p>\\r\\n<p>Request that a business delete any personal data about the consumer that a business has collected.<\\/p>\\r\\n<p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>GDPR Data Protection Rights<\\/h2>\\r\\n<p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:<\\/p>\\r\\n<p>The right to access &ndash; You have the right to request copies of your personal data. We may charge you a small fee for this service.<\\/p>\\r\\n<p>The right to rectification &ndash; You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.<\\/p>\\r\\n<p>The right to erasure &ndash; You have the right to request that we erase your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to restrict processing &ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to object to processing &ndash; You have the right to object to our processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to data portability &ndash; You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>Children\'s Information<\\/h2>\\r\\n<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and\\/or monitor and guide their online activity.<\\/p>\\r\\n<p>eDemand does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.<\\/p>\\r\\n<h2>Changes to This Privacy Policy<\\/h2>\\r\\n<p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<h2>Contact Us<\\/h2>\\r\\n<p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>&nbsp;<\\/p>\"}', '2023-05-02 04:02:15', '0000-00-00 00:00:00'),
(17, 'about_us', '{\"about_us\":\"<h2 style=\\\"color: #333333; text-align: center;\\\">Welcome to eDemand!<\\/h2>\\r\\n<p style=\\\"text-align: center;\\\">eDemand is a cutting-edge platform that connects users with a wide range of on-demand home and doorstep services. Whether you need a plumber, electrician, house cleaner, or any other service provider, eDemand has got you covered.<\\/p>\\r\\n<h2 style=\\\"color: #333333; text-align: center;\\\">Our Mission<\\/h2>\\r\\n<p style=\\\"text-align: center;\\\">At eDemand, our mission is to make everyday life easier for people by providing a convenient and reliable platform for accessing essential services. We aim to revolutionize the way services are delivered, making them more accessible, efficient, and affordable for everyone.<\\/p>\\r\\n<h2 style=\\\"color: #333333; text-align: center;\\\">Why Choose Us?<\\/h2>\\r\\n<p style=\\\"text-align: center;\\\">With eDemand, you can expect:<\\/p>\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul style=\\\"list-style-type: disc; margin-left: 20px;\\\">\\r\\n<li style=\\\"text-align: left;\\\">Access to a wide range of services from trusted vendors<\\/li>\\r\\n<li style=\\\"text-align: left;\\\">Convenient booking and scheduling options<\\/li>\\r\\n<li style=\\\"text-align: left;\\\">Secure and seamless payment processing<\\/li>\\r\\n<li style=\\\"text-align: left;\\\">Real-time tracking and updates on service requests<\\/li>\\r\\n<li style=\\\"text-align: left;\\\">Excellent customer support<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<h2 style=\\\"color: #333333; text-align: center;\\\">Get Started Today!<\\/h2>\\r\\n<p style=\\\"text-align: center;\\\">Ready to experience the convenience of eDemand? Download our app now and start booking your favorite services with just a few taps!<\\/p>\"}', '2025-03-27 05:29:41', '0000-00-00 00:00:00'),
(18, 'general_settings', '{\"country_currency_code\":\"USD\",\"currency\":\"$\",\"decimal_point\":\"2\",\"customer_current_version_android_app\":\"4.0.0\",\"customer_current_version_ios_app\":\"4.0.0\",\"customer_compulsary_update_force_update\":\"1\",\"provider_current_version_android_app\":\"4.0.0\",\"provider_current_version_ios_app\":\"4.0.0\",\"provider_compulsary_update_force_update\":\"1\",\"customer_playstore_url\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=wrteam.edemand.customer.e_demand\",\"customer_appstore_url\":\"https:\\/\\/testflight.apple.com\\/join\\/KdqqsTnH\",\"provider_playstore_url\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=wrteam.edemand.provider\",\"provider_appstore_url\":\"https:\\/\\/testflight.apple.com\\/join\\/n5tteGPs\",\"provider_location_in_provider_details\":\"1\",\"android_google_interstitial_id\":\"your_android_google_interstitial_id\",\"android_google_banner_id\":\"your_android_google_banner_id\",\"android_google_ads_status\":\"1\",\"ios_google_interstitial_id\":\"your_ios_google_interstitial_id\",\"ios_google_banner_id\":\"your_ios_google_banner_id\",\"ios_google_ads_status\":\"1\",\"customer_app_maintenance_schedule_date\":\"2023-01-17 00:00 to 2023-01-19 23:59\",\"message_for_customer_application\":\"We are currently performing maintenance on our app. We will be back up and running soon!\",\"provider_app_maintenance_schedule_date\":\"2022-12-22 00:00 to 2023-01-10 23:59\",\"message_for_provider_application\":\"We are currently performing maintenance on our app. We will be back up and running soon!\",\"provider_app_maintenance_mode\":\"0\",\"customer_google_ads_mob_id\":\"\",\"favicon\":\"1657775760_29d5c9510f319bcff33f.svg\",\"half_logo\":\"1657775760_f730e7b07a5cda36133e.svg\",\"logo\":\"1655699574_7fd61254c6132ebfd8ce.svg\",\"partner_favicon\":\"1655699528_c19e479401407f3a416d.svg\",\"partner_half_logo\":\"1657775933_c37b2c2a81820814b648.svg\",\"partner_logo\":\"edemand_provider_logo.svg\",\"login_image\":\"\",\"customer_app_maintenance_mode\":\"0\",\"company_title\":\"eDemand - On Demand Services\",\"support_name\":\"eDemand\",\"support_email\":\"youremail@gmail.com\",\"phone\":\"919988776655\",\"system_timezone_gmt\":\"+05:30\",\"system_timezone\":\"Asia\\/Kolkata\",\"primary_color\":\"#0277FA\",\"secondary_color\":\"#fcfcfc\",\"primary_shadow\":\"#ffffff\",\"max_serviceable_distance\":\"5000000\",\"distance_unit\":\"km\",\"address\":\"Time Square Empire, 262-263, highway, Mirjapar, Bhuj, Mirjapar Part, Gujarat 370001\",\"short_description\":\"eDemand- On Demand services\",\"copyright_details\":\"Copyright \\u00a9 2025 eDemand. All rights reserved.\",\"booking_auto_cancle_duration\":\"1\",\"maxFilesOrImagesInOneMessage\":\"10\",\"maxFileSizeInMBCanBeSent\":\"10\",\"maxCharactersInATextMessage\":\"500\",\"otp_system\":\"1\",\"authentication_mode\":\"firebase\",\"company_map_location\":\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3666.2869218637325!2d69.64153407559186!3d23.232643908455636!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39511e5b00000001%3A0xc42d67c61628af6d!2sWRTeam%20Pvt.%20Ltd.!5e0!3m2!1sen!2sin!4v1742999646887!5m2!1sen!2sin\",\"support_hours\":\"09:00 to 18:00\",\"allow_pre_booking_chat\":\"1\",\"allow_post_booking_chat\":\"1\",\"file_manager\":\"local_server\",\"aws_access_key_id\":\"your aws access key id\",\"aws_secret_access_key\":\"your aws secret access key\",\"aws_default_region\":\"us-east-1\",\"aws_bucket\":\"your aws bucket\",\"aws_url\":\"your_aws_url\",\"storage_disk\":\"\",\"image_compression_preference\":\"0\",\"image_compression_quality\":\"0\"}', '2025-06-14 04:55:43', NULL),
(19, 'email_settings', '{\"mailProtocol\":\"SMTP\",\"smtpPort\":\"465\",\"smtpHost\":\"smtpout.secureserver.net\",\"smtpEncryption\":\"ssl\",\"smtpUsername\":\"emailhere\",\"mailType\":\"html\",\"smtpPassword\":\"yourpasswordhere\",\"update\":\"Save changes\"}', '2025-06-11 12:27:56', '0000-00-00 00:00:00'),
(21, 'refund_policy', '{\"refund_policy\":\"\"}', '2022-04-21 05:59:17', '0000-00-00 00:00:00'),
(22, 'app_settings', '{\"maintenance_date\":\"2022-11-15\",\"start_time\":\"11:01\",\"end_time\":\"15:03\",\"maintenance_mode\":\"on\"}', '2024-07-12 10:01:39', '0000-00-00 00:00:00'),
(23, 'customer_terms_conditions', '{\"customer_terms_conditions\":\"<h2>Introduction<\\/h2>\\r\\n<p>These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, edemand accessible at edemand.<\\/p>\\r\\n<p>These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions. These Terms and Conditions have been generated with the help of the <a href=\\\"https:\\/\\/www.termsfeed.com\\/blog\\/sample-terms-and-conditions-template\\/\\\">Terms And Conditions Sample Template<\\/a>.<\\/p>\\r\\n<p>Minors or people below 18 years old are not allowed to use this Website.<\\/p>\\r\\n<h2>Intellectual Property Rights<\\/h2>\\r\\n<p>Other than the content you own, under these Terms, edemand and\\/or its licensors own all the intellectual property rights and materials contained in this Website.<\\/p>\\r\\n<p>You are granted limited license only for purposes of viewing the material contained on this Website.<\\/p>\\r\\n<h2>Restrictions<\\/h2>\\r\\n<p>You are specifically restricted from all of the following:<\\/p>\\r\\n<ul>\\r\\n<li>publishing any Website material in any other media;<\\/li>\\r\\n<li>selling, sublicensing and\\/or otherwise commercializing any Website material;<\\/li>\\r\\n<li>publicly performing and\\/or showing any Website material;<\\/li>\\r\\n<li>using this Website in any way that is or may be damaging to this Website;<\\/li>\\r\\n<li>using this Website in any way that impacts user access to this Website;<\\/li>\\r\\n<li>using this Website contrary to applicable laws and regulations, or in any way may cause harm to the Website, or to any person or business entity;<\\/li>\\r\\n<li>engaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this Website;<\\/li>\\r\\n<li>using this Website to engage in any advertising or marketing.<\\/li>\\r\\n<\\/ul>\\r\\n<p>Certain areas of this Website are restricted from being access by you and edemand may further restrict access by you to any areas of this Website, at any time, in absolute discretion. Any user ID and password you may have for this Website are confidential and you must maintain confidentiality as well.<\\/p>\\r\\n<h2>Your Content<\\/h2>\\r\\n<p>In these Website Standard Terms and Conditions, \\\"Your Content\\\" shall mean any audio, video text, images or other material you choose to display on this Website. By displaying Your Content, you grant edemand a non-exclusive, worldwide irrevocable, sub licensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.<\\/p>\\r\\n<p>Your Content must be your own and must not be invading any third-party\'s rights. edemand reserves the right to remove any of Your Content from this Website at any time without notice.<\\/p>\\r\\n<h2>No warranties<\\/h2>\\r\\n<p>This Website is provided \\\"as is,\\\" with all faults, and edemand express no representations or warranties, of any kind related to this Website or the materials contained on this Website. Also, nothing contained on this Website shall be interpreted as advising you.<\\/p>\\r\\n<h2>Limitation of liability<\\/h2>\\r\\n<p>In no event shall edemand, nor any of its officers, directors and employees, shall be held liable for anything arising out of or in any way connected with your use of this Website whether such liability is under contract. &nbsp;edemand, including its officers, directors and employees shall not be held liable for any indirect, consequential or special liability arising out of or in any way related to your use of this Website.<\\/p>\\r\\n<h2>Indemnification<\\/h2>\\r\\n<p>You hereby indemnify to the fullest extent edemand from and against any and\\/or all liabilities, costs, demands, causes of action, damages and expenses arising in any way related to your breach of any of the provisions of these Terms.<\\/p>\\r\\n<h2>Severability<\\/h2>\\r\\n<p>If any provision of these Terms is found to be invalid under any applicable law, such provisions shall be deleted without affecting the remaining provisions herein.<\\/p>\\r\\n<h2>Variation of Terms<\\/h2>\\r\\n<p>edemand is permitted to revise these Terms at any time as it sees fit, and by using this Website you are expected to review these Terms on a regular basis.<\\/p>\\r\\n<h2>Assignment<\\/h2>\\r\\n<p>The edemand is allowed to assign, transfer, and subcontract its rights and\\/or obligations under these Terms without any notification. However, you are not allowed to assign, transfer, or subcontract any of your rights and\\/or obligations under these Terms.<\\/p>\\r\\n<h2>Entire Agreement<\\/h2>\\r\\n<p>These Terms constitute the entire agreement between edemand and you in relation to your use of this Website, and supersede all prior agreements and understandings.<\\/p>\\r\\n<h2>Governing Law &amp; Jurisdiction<\\/h2>\\r\\n<p>These Terms will be governed by and interpreted in accordance with the laws of the State of in, and you submit to the non-exclusive jurisdiction of the state and federal courts located in in for the resolution of any disputes.<\\/p>\\r\\n<p>&nbsp;<\\/p>\"}', '2023-05-02 04:02:01', NULL),
(24, 'customer_privacy_policy', '{\"customer_privacy_policy\":\"<p>At eDemand, accessible from https:\\/\\/edemand.wrteam.me, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by eDemand and how we use it.<\\/p>\\r\\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.<\\/p>\\r\\n<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and\\/or collect in eDemand. This policy is not applicable to any information collected offline or via channels other than this website.<\\/p>\\r\\n<h2>Consent<\\/h2>\\r\\n<p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.<\\/p>\\r\\n<h2>Information we collect<\\/h2>\\r\\n<p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.<\\/p>\\r\\n<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and\\/or attachments you may send us, and any other information you may choose to provide.<\\/p>\\r\\n<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.<\\/p>\\r\\n<h2>How we use your information<\\/h2>\\r\\n<p>We use the information we collect in various ways, including to:<\\/p>\\r\\n<ul>\\r\\n<li>Provide, operate, and maintain our website<\\/li>\\r\\n<li>Improve, personalize, and expand our website<\\/li>\\r\\n<li>Understand and analyze how you use our website<\\/li>\\r\\n<li>Develop new products, services, features, and functionality<\\/li>\\r\\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes<\\/li>\\r\\n<li>Send you emails<\\/li>\\r\\n<li>Find and prevent fraud<\\/li>\\r\\n<\\/ul>\\r\\n<h2>Log Files<\\/h2>\\r\\n<p>eDemand follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring\\/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.<\\/p>\\r\\n<h2>Advertising Partners Privacy Policies<\\/h2>\\r\\n<p>You may consult this list to find the Privacy Policy for each of the advertising partners of eDemand.<\\/p>\\r\\n<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on eDemand, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and\\/or to personalize the advertising content that you see on websites that you visit.<\\/p>\\r\\n<p>Note that eDemand has no access to or control over these cookies that are used by third-party advertisers.<\\/p>\\r\\n<h2>Third Party Privacy Policies<\\/h2>\\r\\n<p>eDemand\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.<\\/p>\\r\\n<p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.<\\/p>\\r\\n<h2>CCPA Privacy Rights (Do Not Sell My Personal Information)<\\/h2>\\r\\n<p>Under the CCPA, among other rights, California consumers have the right to:<\\/p>\\r\\n<p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.<\\/p>\\r\\n<p>Request that a business delete any personal data about the consumer that a business has collected.<\\/p>\\r\\n<p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>GDPR Data Protection Rights<\\/h2>\\r\\n<p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:<\\/p>\\r\\n<p>The right to access &ndash; You have the right to request copies of your personal data. We may charge you a small fee for this service.<\\/p>\\r\\n<p>The right to rectification &ndash; You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.<\\/p>\\r\\n<p>The right to erasure &ndash; You have the right to request that we erase your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to restrict processing &ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to object to processing &ndash; You have the right to object to our processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to data portability &ndash; You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>Children\'s Information<\\/h2>\\r\\n<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and\\/or monitor and guide their online activity.<\\/p>\\r\\n<p>eDemand does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.<\\/p>\\r\\n<h2>Changes to This Privacy Policy<\\/h2>\\r\\n<p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<h2>Contact Us<\\/h2>\\r\\n<p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>&nbsp;<\\/p>\"}', '2023-05-02 04:02:10', NULL);
INSERT INTO `settings` (`id`, `variable`, `value`, `created_at`, `updated_at`) VALUES
(25, 'country_codes', '{\n  \"countries\": [\n    {\n      \"code\": \"+7 840\",\n      \"name\": \"Abkhazia\"\n    },\n    {\n      \"code\": \"+93\",\n      \"name\": \"Afghanistan\"\n    },\n    {\n      \"code\": \"+355\",\n      \"name\": \"Albania\"\n    },\n    {\n      \"code\": \"+213\",\n      \"name\": \"Algeria\"\n    },\n    {\n      \"code\": \"+1 684\",\n      \"name\": \"American Samoa\"\n    },\n    {\n      \"code\": \"+376\",\n      \"name\": \"Andorra\"\n    },\n    {\n      \"code\": \"+244\",\n      \"name\": \"Angola\"\n    },\n    {\n      \"code\": \"+1 264\",\n      \"name\": \"Anguilla\"\n    },\n    {\n      \"code\": \"+1 268\",\n      \"name\": \"Antigua and Barbuda\"\n    },\n    {\n      \"code\": \"+54\",\n      \"name\": \"Argentina\"\n    },\n    {\n      \"code\": \"+374\",\n      \"name\": \"Armenia\"\n    },\n    {\n      \"code\": \"+297\",\n      \"name\": \"Aruba\"\n    },\n    {\n      \"code\": \"+247\",\n      \"name\": \"Ascension\"\n    },\n    {\n      \"code\": \"+61\",\n      \"name\": \"Australia\"\n    },\n    {\n      \"code\": \"+672\",\n      \"name\": \"Australian External Territories\"\n    },\n    {\n      \"code\": \"+43\",\n      \"name\": \"Austria\"\n    },\n    {\n      \"code\": \"+994\",\n      \"name\": \"Azerbaijan\"\n    },\n    {\n      \"code\": \"+1 242\",\n      \"name\": \"Bahamas\"\n    },\n    {\n      \"code\": \"+973\",\n      \"name\": \"Bahrain\"\n    },\n    {\n      \"code\": \"+880\",\n      \"name\": \"Bangladesh\"\n    },\n    {\n      \"code\": \"+1 246\",\n      \"name\": \"Barbados\"\n    },\n    {\n      \"code\": \"+1 268\",\n      \"name\": \"Barbuda\"\n    },\n    {\n      \"code\": \"+375\",\n      \"name\": \"Belarus\"\n    },\n    {\n      \"code\": \"+32\",\n      \"name\": \"Belgium\"\n    },\n    {\n      \"code\": \"+501\",\n      \"name\": \"Belize\"\n    },\n    {\n      \"code\": \"+229\",\n      \"name\": \"Benin\"\n    },\n    {\n      \"code\": \"+1 441\",\n      \"name\": \"Bermuda\"\n    },\n    {\n      \"code\": \"+975\",\n      \"name\": \"Bhutan\"\n    },\n    {\n      \"code\": \"+591\",\n      \"name\": \"Bolivia\"\n    },\n    {\n      \"code\": \"+387\",\n      \"name\": \"Bosnia and Herzegovina\"\n    },\n    {\n      \"code\": \"+267\",\n      \"name\": \"Botswana\"\n    },\n    {\n      \"code\": \"+55\",\n      \"name\": \"Brazil\"\n    },\n    {\n      \"code\": \"+246\",\n      \"name\": \"British Indian Ocean Territory\"\n    },\n    {\n      \"code\": \"+1 284\",\n      \"name\": \"British Virgin Islands\"\n    },\n    {\n      \"code\": \"+673\",\n      \"name\": \"Brunei\"\n    },\n    {\n      \"code\": \"+359\",\n      \"name\": \"Bulgaria\"\n    },\n    {\n      \"code\": \"+226\",\n      \"name\": \"Burkina Faso\"\n    },\n    {\n      \"code\": \"+257\",\n      \"name\": \"Burundi\"\n    },\n    {\n      \"code\": \"+855\",\n      \"name\": \"Cambodia\"\n    },\n    {\n      \"code\": \"+237\",\n      \"name\": \"Cameroon\"\n    },\n    {\n      \"code\": \"+1\",\n      \"name\": \"Canada\"\n    },\n    {\n      \"code\": \"+238\",\n      \"name\": \"Cape Verde\"\n    },\n    {\n      \"code\": \"+ 345\",\n      \"name\": \"Cayman Islands\"\n    },\n    {\n      \"code\": \"+236\",\n      \"name\": \"Central African Republic\"\n    },\n    {\n      \"code\": \"+235\",\n      \"name\": \"Chad\"\n    },\n    {\n      \"code\": \"+56\",\n      \"name\": \"Chile\"\n    },\n    {\n      \"code\": \"+86\",\n      \"name\": \"China\"\n    },\n    {\n      \"code\": \"+61\",\n      \"name\": \"Christmas Island\"\n    },\n    {\n      \"code\": \"+61\",\n      \"name\": \"Cocos-Keeling Islands\"\n    },\n    {\n      \"code\": \"+57\",\n      \"name\": \"Colombia\"\n    },\n    {\n      \"code\": \"+269\",\n      \"name\": \"Comoros\"\n    },\n    {\n      \"code\": \"+242\",\n      \"name\": \"Congo\"\n    },\n    {\n      \"code\": \"+243\",\n      \"name\": \"Congo, Dem. Rep. of (Zaire)\"\n    },\n    {\n      \"code\": \"+682\",\n      \"name\": \"Cook Islands\"\n    },\n    {\n      \"code\": \"+506\",\n      \"name\": \"Costa Rica\"\n    },\n    {\n      \"code\": \"+385\",\n      \"name\": \"Croatia\"\n    },\n    {\n      \"code\": \"+53\",\n      \"name\": \"Cuba\"\n    },\n    {\n      \"code\": \"+599\",\n      \"name\": \"Curacao\"\n    },\n    {\n      \"code\": \"+537\",\n      \"name\": \"Cyprus\"\n    },\n    {\n      \"code\": \"+420\",\n      \"name\": \"Czech Republic\"\n    },\n    {\n      \"code\": \"+45\",\n      \"name\": \"Denmark\"\n    },\n    {\n      \"code\": \"+246\",\n      \"name\": \"Diego Garcia\"\n    },\n    {\n      \"code\": \"+253\",\n      \"name\": \"Djibouti\"\n    },\n    {\n      \"code\": \"+1 767\",\n      \"name\": \"Dominica\"\n    },\n    {\n      \"code\": \"+1 809\",\n      \"name\": \"Dominican Republic\"\n    },\n    {\n      \"code\": \"+670\",\n      \"name\": \"East Timor\"\n    },\n    {\n      \"code\": \"+56\",\n      \"name\": \"Easter Island\"\n    },\n    {\n      \"code\": \"+593\",\n      \"name\": \"Ecuador\"\n    },\n    {\n      \"code\": \"+20\",\n      \"name\": \"Egypt\"\n    },\n    {\n      \"code\": \"+503\",\n      \"name\": \"El Salvador\"\n    },\n    {\n      \"code\": \"+240\",\n      \"name\": \"Equatorial Guinea\"\n    },\n    {\n      \"code\": \"+291\",\n      \"name\": \"Eritrea\"\n    },\n    {\n      \"code\": \"+372\",\n      \"name\": \"Estonia\"\n    },\n    {\n      \"code\": \"+251\",\n      \"name\": \"Ethiopia\"\n    },\n    {\n      \"code\": \"+500\",\n      \"name\": \"Falkland Islands\"\n    },\n    {\n      \"code\": \"+298\",\n      \"name\": \"Faroe Islands\"\n    },\n    {\n      \"code\": \"+679\",\n      \"name\": \"Fiji\"\n    },\n    {\n      \"code\": \"+358\",\n      \"name\": \"Finland\"\n    },\n    {\n      \"code\": \"+33\",\n      \"name\": \"France\"\n    },\n    {\n      \"code\": \"+596\",\n      \"name\": \"French Antilles\"\n    },\n    {\n      \"code\": \"+594\",\n      \"name\": \"French Guiana\"\n    },\n    {\n      \"code\": \"+689\",\n      \"name\": \"French Polynesia\"\n    },\n    {\n      \"code\": \"+241\",\n      \"name\": \"Gabon\"\n    },\n    {\n      \"code\": \"+220\",\n      \"name\": \"Gambia\"\n    },\n    {\n      \"code\": \"+995\",\n      \"name\": \"Georgia\"\n    },\n    {\n      \"code\": \"+49\",\n      \"name\": \"Germany\"\n    },\n    {\n      \"code\": \"+233\",\n      \"name\": \"Ghana\"\n    },\n    {\n      \"code\": \"+350\",\n      \"name\": \"Gibraltar\"\n    },\n    {\n      \"code\": \"+30\",\n      \"name\": \"Greece\"\n    },\n    {\n      \"code\": \"+299\",\n      \"name\": \"Greenland\"\n    },\n    {\n      \"code\": \"+1 473\",\n      \"name\": \"Grenada\"\n    },\n    {\n      \"code\": \"+590\",\n      \"name\": \"Guadeloupe\"\n    },\n    {\n      \"code\": \"+1 671\",\n      \"name\": \"Guam\"\n    },\n    {\n      \"code\": \"+502\",\n      \"name\": \"Guatemala\"\n    },\n    {\n      \"code\": \"+224\",\n      \"name\": \"Guinea\"\n    },\n    {\n      \"code\": \"+245\",\n      \"name\": \"Guinea-Bissau\"\n    },\n    {\n      \"code\": \"+595\",\n      \"name\": \"Guyana\"\n    },\n    {\n      \"code\": \"+509\",\n      \"name\": \"Haiti\"\n    },\n    {\n      \"code\": \"+504\",\n      \"name\": \"Honduras\"\n    },\n    {\n      \"code\": \"+852\",\n      \"name\": \"Hong Kong SAR China\"\n    },\n    {\n      \"code\": \"+36\",\n      \"name\": \"Hungary\"\n    },\n    {\n      \"code\": \"+354\",\n      \"name\": \"Iceland\"\n    },\n    {\n      \"code\": \"+91\",\n      \"name\": \"India\"\n    },\n    {\n      \"code\": \"+62\",\n      \"name\": \"Indonesia\"\n    },\n    {\n      \"code\": \"+98\",\n      \"name\": \"Iran\"\n    },\n    {\n      \"code\": \"+964\",\n      \"name\": \"Iraq\"\n    },\n    {\n      \"code\": \"+353\",\n      \"name\": \"Ireland\"\n    },\n    {\n      \"code\": \"+972\",\n      \"name\": \"Israel\"\n    },\n    {\n      \"code\": \"+39\",\n      \"name\": \"Italy\"\n    },\n    {\n      \"code\": \"+225\",\n      \"name\": \"Ivory Coast\"\n    },\n    {\n      \"code\": \"+1 876\",\n      \"name\": \"Jamaica\"\n    },\n    {\n      \"code\": \"+81\",\n      \"name\": \"Japan\"\n    },\n    {\n      \"code\": \"+962\",\n      \"name\": \"Jordan\"\n    },\n    {\n      \"code\": \"+7 7\",\n      \"name\": \"Kazakhstan\"\n    },\n    {\n      \"code\": \"+254\",\n      \"name\": \"Kenya\"\n    },\n    {\n      \"code\": \"+686\",\n      \"name\": \"Kiribati\"\n    },\n    {\n      \"code\": \"+965\",\n      \"name\": \"Kuwait\"\n    },\n    {\n      \"code\": \"+996\",\n      \"name\": \"Kyrgyzstan\"\n    },\n    {\n      \"code\": \"+856\",\n      \"name\": \"Laos\"\n    },\n    {\n      \"code\": \"+371\",\n      \"name\": \"Latvia\"\n    },\n    {\n      \"code\": \"+961\",\n      \"name\": \"Lebanon\"\n    },\n    {\n      \"code\": \"+266\",\n      \"name\": \"Lesotho\"\n    },\n    {\n      \"code\": \"+231\",\n      \"name\": \"Liberia\"\n    },\n    {\n      \"code\": \"+218\",\n      \"name\": \"Libya\"\n    },\n    {\n      \"code\": \"+423\",\n      \"name\": \"Liechtenstein\"\n    },\n    {\n      \"code\": \"+370\",\n      \"name\": \"Lithuania\"\n    },\n    {\n      \"code\": \"+352\",\n      \"name\": \"Luxembourg\"\n    },\n    {\n      \"code\": \"+853\",\n      \"name\": \"Macau SAR China\"\n    },\n    {\n      \"code\": \"+389\",\n      \"name\": \"Macedonia\"\n    },\n    {\n      \"code\": \"+261\",\n      \"name\": \"Madagascar\"\n    },\n    {\n      \"code\": \"+265\",\n      \"name\": \"Malawi\"\n    },\n    {\n      \"code\": \"+60\",\n      \"name\": \"Malaysia\"\n    },\n    {\n      \"code\": \"+960\",\n      \"name\": \"Maldives\"\n    },\n    {\n      \"code\": \"+223\",\n      \"name\": \"Mali\"\n    },\n    {\n      \"code\": \"+356\",\n      \"name\": \"Malta\"\n    },\n    {\n      \"code\": \"+692\",\n      \"name\": \"Marshall Islands\"\n    },\n    {\n      \"code\": \"+596\",\n      \"name\": \"Martinique\"\n    },\n    {\n      \"code\": \"+222\",\n      \"name\": \"Mauritania\"\n    },\n    {\n      \"code\": \"+230\",\n      \"name\": \"Mauritius\"\n    },\n    {\n      \"code\": \"+262\",\n      \"name\": \"Mayotte\"\n    },\n    {\n      \"code\": \"+52\",\n      \"name\": \"Mexico\"\n    },\n    {\n      \"code\": \"+691\",\n      \"name\": \"Micronesia\"\n    },\n    {\n      \"code\": \"+1 808\",\n      \"name\": \"Midway Island\"\n    },\n    {\n      \"code\": \"+373\",\n      \"name\": \"Moldova\"\n    },\n    {\n      \"code\": \"+377\",\n      \"name\": \"Monaco\"\n    },\n    {\n      \"code\": \"+976\",\n      \"name\": \"Mongolia\"\n    },\n    {\n      \"code\": \"+382\",\n      \"name\": \"Montenegro\"\n    },\n    {\n      \"code\": \"+1664\",\n      \"name\": \"Montserrat\"\n    },\n    {\n      \"code\": \"+212\",\n      \"name\": \"Morocco\"\n    },\n    {\n      \"code\": \"+95\",\n      \"name\": \"Myanmar\"\n    },\n    {\n      \"code\": \"+264\",\n      \"name\": \"Namibia\"\n    },\n    {\n      \"code\": \"+674\",\n      \"name\": \"Nauru\"\n    },\n    {\n      \"code\": \"+977\",\n      \"name\": \"Nepal\"\n    },\n    {\n      \"code\": \"+31\",\n      \"name\": \"Netherlands\"\n    },\n    {\n      \"code\": \"+599\",\n      \"name\": \"Netherlands Antilles\"\n    },\n    {\n      \"code\": \"+1 869\",\n      \"name\": \"Nevis\"\n    },\n    {\n      \"code\": \"+687\",\n      \"name\": \"New Caledonia\"\n    },\n    {\n      \"code\": \"+64\",\n      \"name\": \"New Zealand\"\n    },\n    {\n      \"code\": \"+505\",\n      \"name\": \"Nicaragua\"\n    },\n    {\n      \"code\": \"+227\",\n      \"name\": \"Niger\"\n    },\n    {\n      \"code\": \"+234\",\n      \"name\": \"Nigeria\"\n    },\n    {\n      \"code\": \"+683\",\n      \"name\": \"Niue\"\n    },\n    {\n      \"code\": \"+672\",\n      \"name\": \"Norfolk Island\"\n    },\n    {\n      \"code\": \"+850\",\n      \"name\": \"North Korea\"\n    },\n    {\n      \"code\": \"+1 670\",\n      \"name\": \"Northern Mariana Islands\"\n    },\n    {\n      \"code\": \"+47\",\n      \"name\": \"Norway\"\n    },\n    {\n      \"code\": \"+968\",\n      \"name\": \"Oman\"\n    },\n    {\n      \"code\": \"+92\",\n      \"name\": \"Pakistan\"\n    },\n    {\n      \"code\": \"+680\",\n      \"name\": \"Palau\"\n    },\n    {\n      \"code\": \"+970\",\n      \"name\": \"Palestinian Territory\"\n    },\n    {\n      \"code\": \"+507\",\n      \"name\": \"Panama\"\n    },\n    {\n      \"code\": \"+675\",\n      \"name\": \"Papua New Guinea\"\n    },\n    {\n      \"code\": \"+595\",\n      \"name\": \"Paraguay\"\n    },\n    {\n      \"code\": \"+51\",\n      \"name\": \"Peru\"\n    },\n    {\n      \"code\": \"+63\",\n      \"name\": \"Philippines\"\n    },\n    {\n      \"code\": \"+48\",\n      \"name\": \"Poland\"\n    },\n    {\n      \"code\": \"+351\",\n      \"name\": \"Portugal\"\n    },\n    {\n      \"code\": \"+1 787\",\n      \"name\": \"Puerto Rico\"\n    },\n    {\n      \"code\": \"+974\",\n      \"name\": \"Qatar\"\n    },\n    {\n      \"code\": \"+262\",\n      \"name\": \"Reunion\"\n    },\n    {\n      \"code\": \"+40\",\n      \"name\": \"Romania\"\n    },\n    {\n      \"code\": \"+7\",\n      \"name\": \"Russia\"\n    },\n    {\n      \"code\": \"+250\",\n      \"name\": \"Rwanda\"\n    },\n    {\n      \"code\": \"+685\",\n      \"name\": \"Samoa\"\n    },\n    {\n      \"code\": \"+378\",\n      \"name\": \"San Marino\"\n    },\n    {\n      \"code\": \"+966\",\n      \"name\": \"Saudi Arabia\"\n    },\n    {\n      \"code\": \"+221\",\n      \"name\": \"Senegal\"\n    },\n    {\n      \"code\": \"+381\",\n      \"name\": \"Serbia\"\n    },\n    {\n      \"code\": \"+248\",\n      \"name\": \"Seychelles\"\n    },\n    {\n      \"code\": \"+232\",\n      \"name\": \"Sierra Leone\"\n    },\n    {\n      \"code\": \"+65\",\n      \"name\": \"Singapore\"\n    },\n    {\n      \"code\": \"+421\",\n      \"name\": \"Slovakia\"\n    },\n    {\n      \"code\": \"+386\",\n      \"name\": \"Slovenia\"\n    },\n    {\n      \"code\": \"+677\",\n      \"name\": \"Solomon Islands\"\n    },\n    {\n      \"code\": \"+27\",\n      \"name\": \"South Africa\"\n    },\n    {\n      \"code\": \"+500\",\n      \"name\": \"South Georgia and the South Sandwich Islands\"\n    },\n    {\n      \"code\": \"+82\",\n      \"name\": \"South Korea\"\n    },\n    {\n      \"code\": \"+34\",\n      \"name\": \"Spain\"\n    },\n    {\n      \"code\": \"+94\",\n      \"name\": \"Sri Lanka\"\n    },\n    {\n      \"code\": \"+249\",\n      \"name\": \"Sudan\"\n    },\n    {\n      \"code\": \"+597\",\n      \"name\": \"Suriname\"\n    },\n    {\n      \"code\": \"+268\",\n      \"name\": \"Swaziland\"\n    },\n    {\n      \"code\": \"+46\",\n      \"name\": \"Sweden\"\n    },\n    {\n      \"code\": \"+41\",\n      \"name\": \"Switzerland\"\n    },\n    {\n      \"code\": \"+963\",\n      \"name\": \"Syria\"\n    },\n    {\n      \"code\": \"+886\",\n      \"name\": \"Taiwan\"\n    },\n    {\n      \"code\": \"+992\",\n      \"name\": \"Tajikistan\"\n    },\n    {\n      \"code\": \"+255\",\n      \"name\": \"Tanzania\"\n    },\n    {\n      \"code\": \"+66\",\n      \"name\": \"Thailand\"\n    },\n    {\n      \"code\": \"+670\",\n      \"name\": \"Timor Leste\"\n    },\n    {\n      \"code\": \"+228\",\n      \"name\": \"Togo\"\n    },\n    {\n      \"code\": \"+690\",\n      \"name\": \"Tokelau\"\n    },\n    {\n      \"code\": \"+676\",\n      \"name\": \"Tonga\"\n    },\n    {\n      \"code\": \"+1 868\",\n      \"name\": \"Trinidad and Tobago\"\n    },\n    {\n      \"code\": \"+216\",\n      \"name\": \"Tunisia\"\n    },\n    {\n      \"code\": \"+90\",\n      \"name\": \"Turkey\"\n    },\n    {\n      \"code\": \"+993\",\n      \"name\": \"Turkmenistan\"\n    },\n    {\n      \"code\": \"+1 649\",\n      \"name\": \"Turks and Caicos Islands\"\n    },\n    {\n      \"code\": \"+688\",\n      \"name\": \"Tuvalu\"\n    },\n    {\n      \"code\": \"+1 340\",\n      \"name\": \"U.S. Virgin Islands\"\n    },\n    {\n      \"code\": \"+256\",\n      \"name\": \"Uganda\"\n    },\n    {\n      \"code\": \"+380\",\n      \"name\": \"Ukraine\"\n    },\n    {\n      \"code\": \"+971\",\n      \"name\": \"United Arab Emirates\"\n    },\n    {\n      \"code\": \"+44\",\n      \"name\": \"United Kingdom\"\n    },\n    {\n      \"code\": \"+1\",\n      \"name\": \"United States\"\n    },\n    {\n      \"code\": \"+598\",\n      \"name\": \"Uruguay\"\n    },\n    {\n      \"code\": \"+998\",\n      \"name\": \"Uzbekistan\"\n    },\n    {\n      \"code\": \"+678\",\n      \"name\": \"Vanuatu\"\n    },\n    {\n      \"code\": \"+58\",\n      \"name\": \"Venezuela\"\n    },\n    {\n      \"code\": \"+84\",\n      \"name\": \"Vietnam\"\n    },\n    {\n      \"code\": \"+1 808\",\n      \"name\": \"Wake Island\"\n    },\n    {\n      \"code\": \"+681\",\n      \"name\": \"Wallis and Futuna\"\n    },\n    {\n      \"code\": \"+967\",\n      \"name\": \"Yemen\"\n    },\n    {\n      \"code\": \"+260\",\n      \"name\": \"Zambia\"\n    },\n    {\n      \"code\": \"+255\",\n      \"name\": \"Zanzibar\"\n    },\n    {\n      \"code\": \"+263\",\n      \"name\": \"Zimbabwe\"\n    }\n  ]\n}', '2022-06-06 06:54:27', '2022-06-06 06:48:21'),
(26, 'country_code', '+91', '2022-06-06 07:52:41', '2022-06-06 07:52:26'),
(27, 'api_key_settings', '{\"API_link_for_customer_app\":\"https:\\/\\/yourdomain.com\\/api\\/v1\\/\",\"API_link_for_provider_app\":\"https:\\/\\/yourdomain.com\\/partner\\/api\\/v1\\/\",\"google_map_api\":\"your_google_map_api\"}', '2024-11-30 05:53:48', NULL),
(29, 'range_units', 'kilometers', '2022-08-10 10:37:37', NULL),
(30, 'contact_us', '{\"contact_us\":\"<p>#262-263, Time Square Empire, SH 42 Mirjapar highway,<br \\/>Bhuj - Kutch 370001 Gujarat India.<br \\/><br \\/><a class=\\\"c-link c-link--underline\\\" href=\\\"http:\\/\\/youremail@gmail.com\\/\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" data-stringify-link=\\\"http:\\/\\/youremail@gmail.com\\/\\\" data-sk=\\\"tooltip_parent\\\">Email Address :<\\/a>&nbsp;<a class=\\\"c-link c-link--underline\\\" href=\\\"mailto:youremail@gmail.com\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" data-stringify-link=\\\"mailto:youremail@gmail.com\\\" data-sk=\\\"tooltip_parent\\\" aria-haspopup=\\\"menu\\\" aria-expanded=\\\"false\\\">youremail@gmail.com<\\/a><\\/p>\\r\\n<p><a class=\\\"c-link c-link--underline\\\" href=\\\"http:\\/\\/www.wrteam.in\\/\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" data-stringify-link=\\\"http:\\/\\/www.wrteam.in\\\" data-sk=\\\"tooltip_parent\\\">www.wrteam.in<\\/a><\\/p>\\r\\n<p>Phone Number :&nbsp;<a class=\\\"c-link c-link--underline\\\" href=\\\"tel:+919988776655\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" data-stringify-link=\\\"tel:+919988776655\\\" data-sk=\\\"tooltip_parent\\\">+91 9988776655<\\/a><\\/p>\"}', '2024-05-01 08:09:44', NULL),
(31, 'system_tax_settings', '{\"tax_status\":\"on\",\"tax_name\":\"GST\",\"tax\":\"10\"}', '2022-11-11 05:17:50', NULL),
(33, 'firebase_settings', '{\"apiKey\":\"your_api_key\",\"authDomain\":\"auth_domain\",\"projectId\":\"project_id\",\"storageBucket\":\"storage_bucket\",\"messagingSenderId\":\"messaging_sender_id\",\"appId\":\"app_id\",\"measurementId\":\"measurement_id\",\"vapidKey\":\"vapid_key\",\"json_file\":\"firebaseConfig.json\"}', '2024-08-22 04:04:11', NULL),
(34, 'web_settings', '{\"social_media\":[{\"url\":\"https:\\/\\/twitter.com\\/wrteamin\",\"file\":\"x.png\"},{\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/wrteam\\/\",\"file\":\"li.png\"},{\"url\":\"https:\\/\\/api.whatsapp.com\\/send\\/?phone=%2B9988776655&text=Hello%20WRTeam&type=phone_number&app_absent=0\",\"file\":\"w.png\"},{\"url\":\"https:\\/\\/www.facebook.com\\/wrteam.in\\/\",\"file\":\"f.png\"},{\"url\":\"https:\\/\\/www.youtube.com\\/channel\\/UCLt9XRUuiWsqKng4681_6cQ\",\"file\":\"Youtube.png\"},{\"url\":\"https:\\/\\/www.instagram.com\\/wrteam.in\\/?hl=en\",\"file\":\"insta.png\"}],\"web_title\":\"Let\\u2019s Download eDemand Mobile App Free\",\"playstore_url\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=wrteam.edemand.customer.e_demand\",\"category_section_title\":\"Essential Repair Services\",\"category_section_description\":\"Discover top-notch services tailored to meet your every need. Our professionals are dedicated to providing reliable and efficient solutions for your home and beyond.\",\"rating_section_title\":\"What people say about our services\",\"rating_section_description\":\"Read feedback from our valued customers to see how we\\u2019ve made a difference for them. Your opinion matters to us\\u2014share your experience and help others make informed decisions.\",\"faq_section_title\":\"Frequently Asked Questions\",\"faq_section_description\":\"Find answers to common questions about our services, how to use the app, and more. If you have any additional questions, feel free to reach out to our support team for further assistance.\",\"landing_page_logo\":\"1712290334_c232acc0fea1307e8e97.png\",\"landing_page_backgroud_image\":\"1727435552_acdf7561ec6b35394f6f.jpeg\",\"rating_section_status\":1,\"faq_section_status\":1,\"category_section_status\":0,\"category_ids\":[\"270\",\"265\",\"259\",\"252\",\"246\",\"240\",\"222\",\"221\",\"213\"],\"rating_ids\":[\",86,85,81,73,42,27,26\"],\"landing_page_title\":\"One Stop Solution For Your All Services\",\"process_flow_title\":\"How eDemand Work\",\"process_flow_description\":\"Learn how eDemand streamlines the service booking process for you. From selecting your desired service to tracking its progress, our user-friendly platform ensures a seamless experience.\",\"footer_description\":\"eDemand: Your premier destination for efficient and reliable on-demand services.\",\"step_1_title\":\"Request Service\",\"step_2_title\":\"Match with Providers\",\"step_3_title\":\"Monitor Progress\",\"step_4_title\":\"Receive Quality Results\",\"step_1_description\":\"Easily request the service you need with just a few taps. Get started quickly and effortlessly!\",\"step_2_description\":\"Find the perfect provider for your service needs. Our smart matching ensures you get the best fit.\",\"step_3_description\":\"Stay updated on your service progress in real-time. Track every step and stay informed.\",\"step_4_description\":\"Enjoy top-quality results delivered right to your doorstep. Satisfaction guaranteed with every service.\",\"step_1_image\":\"1728038098_97ac34997ed2ee92e9f6.png\",\"step_2_image\":\"1728038003_14c6cf9429a5e5a8f5e1.png\",\"step_3_image\":\"1712289102_5f4cd2d127ceb36b69a0.png\",\"step_4_image\":\"1712289102_089f079a3cb8fd99f6c2.png\",\"process_flow_status\":0,\"cookie_consent_status\":1,\"cookie_consent_title\":\"\\ud83c\\udf6a We Use Cookies\",\"cookie_consent_description\":\"We use cookies to enhance your browsing experience, serve personalized content, and analyze our traffic. By continuing to use our site, you consent to our use of cookies.\",\"app_section_status\":\"1\",\"web_logo\":\"1712291207_ea8387289fbe73fb9692.svg\",\"web_favicon\":\"1749195839_bb34478102790149d2e3.png\",\"web_half_logo\":\"1712290334_44294b1cf3becbbf12c8.svg\",\"footer_logo\":\"1728041471_af1190b0db783d2f4c83.png\",\"customer_web_maintenance_mode\":\"1\",\"message_for_customer_web\":\"We\\u2019re currently performing scheduled maintenance to improve your experience.\\r\\nPlease check back shortly. Thank you for your patience and understanding!\",\"customer_web_maintenance_schedule_date\":\"2025-06-10 16:46 to 2025-06-10 16:46\",\"applestore_url\":\"https:\\/\\/testflight.apple.com\\/join\\/KdqqsTnH\"}', '2025-06-14 04:55:55', NULL),
(35, 'notification_settings', '{\"provider_approved_email\":\"true\",\"provider_approved_sms\":\"true\",\"provider_approved_notification\":\"true\",\"provider_disapproved_email\":\"true\",\"provider_disapproved_sms\":\"true\",\"provider_disapproved_notification\":\"true\",\"withdraw_request_approved_email\":\"true\",\"withdraw_request_approved_sms\":\"true\",\"withdraw_request_approved_notification\":\"true\",\"withdraw_request_disapproved_email\":\"true\",\"withdraw_request_disapproved_sms\":\"true\",\"withdraw_request_disapproved_notification\":\"true\",\"payment_settlement_email\":\"true\",\"payment_settlement_sms\":\"true\",\"payment_settlement_notification\":\"true\",\"service_approved_email\":\"true\",\"service_approved_sms\":\"true\",\"service_approved_notification\":\"true\",\"service_disapproved_email\":\"true\",\"service_disapproved_sms\":\"true\",\"service_disapproved_notification\":\"true\",\"user_account_active_email\":\"true\",\"user_account_active_sms\":\"true\",\"user_account_active_notification\":\"true\",\"user_account_deactive_email\":\"true\",\"user_account_deactive_sms\":\"true\",\"user_account_deactive_notification\":\"true\",\"provider_update_information_email\":\"true\",\"provider_update_information_sms\":\"true\",\"provider_update_information_notification\":\"true\",\"new_provider_registerd_email\":\"true\",\"new_provider_registerd_sms\":\"true\",\"new_provider_registerd_notification\":\"true\",\"withdraw_request_received_email\":\"true\",\"withdraw_request_received_sms\":\"true\",\"withdraw_request_received_notification\":\"true\",\"booking_status_updated_email\":\"true\",\"booking_status_updated_sms\":\"true\",\"booking_status_updated_notification\":\"true\",\"new_booking_confirmation_to_customer_email\":\"true\",\"new_booking_confirmation_to_customer_sms\":\"true\",\"new_booking_confirmation_to_customer_notification\":\"true\",\"new_booking_received_for_provider_email\":\"true\",\"new_booking_received_for_provider_sms\":\"true\",\"new_booking_received_for_provider_notification\":\"true\",\"withdraw_request_send_email\":\"true\",\"withdraw_request_send_sms\":\"true\",\"withdraw_request_send_notification\":\"true\",\"new_rating_given_by_customer_email\":\"true\",\"new_rating_given_by_customer_sms\":\"true\",\"new_rating_given_by_customer_notification\":\"true\",\"rating_request_to_customer_email\":\"true\",\"rating_request_to_customer_sms\":\"true\",\"rating_request_to_customer_notification\":\"true\"}', '2025-04-10 13:39:34', NULL),
(36, 'sms_gateway_setting', '{\"twilio_endpoint\":\"endpoint\",\"sms_gateway_method\":\"POST\",\"country_code_include\":\"0\",\"header_key\":[\"Authorization\"],\"header_value\":[\" Basic Your Token\"],\"params_key\":\"\",\"params_value\":\"\",\"body_key\":[\"To\",\"From\",\"Body\"],\"body_value\":[\"{only_mobile_number}\",\"123456780\",\"{message}\"]}', '2024-08-31 07:27:41', NULL),
(37, 'storage_disk', 'local_server', '2025-02-05 04:42:58', NULL),
(38, 'become_provider_page_settings', '{\"hero_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"OPPORTUNITY KNOCKS\\\",\\\"title\\\":\\\"We Provide High Quality Professional Services\\\",\\\"description\\\":\\\"Become an ShebaCity provider and start earning extra money today. Enjoy flexibility, choose your hours, and take control of your financial future.\\\",\\\"images\\\":[{\\\"image\\\":\\\"1742990017_b7543a5a607df5412e6b.png\\\"},{\\\"image\\\":\\\"1742990529_dc811298a4aa05b7cb85.png\\\"},{\\\"image\\\":\\\"1742990529_5f56f34f54c25c2abf25.png\\\"},{\\\"image\\\":\\\"1742990529_70d695d2bb7e36041338.png\\\"}]}\",\"how_it_work_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"HOW IT WORKS\\\",\\\"title\\\":\\\"Become a Successful Service Provider\\\",\\\"description\\\":\\\"Easily transform your skills into a thriving business. Our platform provides the tools you need to attract customers, manage bookings, and grow your service empire.\\\",\\\"steps\\\":\\\"[{\\\\\\\"title\\\\\\\":\\\\\\\"Create an Account as a Provider\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Register as a service provider in the system\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Approval from Admin\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"The admin will review and approve the provider\'s profile\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Add Services\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"The provider can list the services they offer\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Subscription Purchase\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers need to buy a subscription to be listed for customers.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Receive Bookings\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Customers can book services based on the listed offerings.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Custom Bookings\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers can receive custom booking requests.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Bidding System\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers can bid for custom jobs, increasing their earning opportunities.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Service Mode Selection\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers can choose to offer services at the customer\\\\\\\\u2019s location or at their shop.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Earnings Based on Work\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Payment is received based on the completed services.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Track Earnings\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers can view their earnings and transaction details.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Promocode Offers\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers can offer promo codes to attract more bookings.\\\\\\\"}]\\\"}\",\"category_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"YOUR NEEDS, OUR SERVICES \\\",\\\"title\\\":\\\"Discover a World of Services at Your Fingertips\\\",\\\"description\\\":\\\"Need a cleaner, a plumber, or a tech expert? We have got you covered. Discover a wide range of services, all in one place.\\\",\\\"category_ids\\\":[\\\"282\\\"]}\",\"subscription_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"UNLOCK UNLIMITED ACCESS\\\",\\\"title\\\":\\\"Elevate Your Business with Our Subscription\\\",\\\"description\\\":\\\"                                            Get more out of eDemand with our subscription plan. Enjoy increased visibility, access to premium features, and the ability to expand your service offerings.\\\"}\",\"top_providers_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"TOP RATED PROVIDERS\\\",\\\"title\\\":\\\"Trusted by Thousands: Our Top-Rated Providers\\\",\\\"description\\\":\\\"Our top-rated providers are customer favorites. With a proven track record of excellence, they consistently deliver outstanding service.\\\"}\",\"review_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"YOUR REVIEW MATTERS\\\",\\\"title\\\":\\\"What our Customers Says About Providers\\\",\\\"description\\\":\\\"Discover how eDemand has transformed businesses. Hear directly from our satisfied providers about their success stories and how our platform has helped them reach new heights.\\\",\\\"rating_ids\\\":[\\\",147\\\"]}\",\"faq_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\" TRANSPARENCY MATTERS \\\",\\\"title\\\":\\\"Need Help? We have Got Answers\\\",\\\"description\\\":\\\"Have questions about joining eDemand or providing services? Our FAQ section offers clear and concise answers to the most common inquiries.\\\",\\\"faqs\\\":\\\"[{\\\\\\\"question\\\\\\\":\\\\\\\" What is eDemand, and how does it help service providers?\\\\\\\",\\\\\\\"answer\\\\\\\":\\\\\\\"eDemand is an on-demand service platform that connects skilled service providers with customers looking for various services, including home repairs, beauty, cleaning, and more. It helps providers grow their business by getting more job requests without marketing hassle.\\\\\\\"}]\\\"}\",\"feature_section\":\"{\\\"status\\\":1,\\\"features\\\":[{\\\"short_headline\\\":\\\"Ff\\\",\\\"title\\\":\\\"Dd,\\\",\\\"description\\\":\\\"Gg\\\",\\\"position\\\":\\\"right\\\",\\\"image\\\":\\\"1749705562_07eba5dcd6f5fe9a8c87.png\\\"}]}\"}', '2025-06-14 07:35:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settlement_cashcollection_history`
--

CREATE TABLE `settlement_cashcollection_history` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_request_id` int(11) DEFAULT NULL,
  `commission_percentage` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `type` text NOT NULL COMMENT ' -cash_collection_by_admin  - cod\r\n    -cash_collection_by_provider - code\r\n    -received_by_admin - online_payment\r\n    -settled_by_settlement - manual settlement by admin\r\n    -settled_by_payment_request - withrequest approved by admin',
  `date` date NOT NULL,
  `time` time NOT NULL,
  `amount` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `commission_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settlement_history`
--

CREATE TABLE `settlement_history` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `amount` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `type_id` int(11) NOT NULL,
  `app_image` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - deactive \r\n1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `url` text DEFAULT NULL,
  `web_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `type`, `type_id`, `app_image`, `status`, `created_at`, `updated_at`, `url`, `web_image`) VALUES
(38, 'Category', 240, '1743168351_f294f914fb98c727fa9e.png', 1, '2022-11-14 12:05:00', '2025-04-24 15:45:38', '', '1743164615_f81027d4be978ad50bfc.png'),
(39, 'Category', 213, '1743491300_1a6d5fee938f8668ce63.png', 1, '2022-11-14 12:07:00', '2025-04-24 15:46:13', '', '1743164628_e915c8972d2724c06399.png'),
(40, 'Category', 279, '1749554404_4c7fcff2749e0a121e5e.jpg', 1, '2025-06-10 11:20:04', '2025-06-10 16:50:04', '', '1749554404_43392fed313a5ba08951.jpeg'),
(41, 'Category', 281, '1749554596_86b3d4884db38b533fb4.jpg', 1, '2025-06-10 11:23:16', '2025-06-10 16:53:16', '', '1749554596_42cfdfaa3bdc01fe7298.jpg'),
(42, 'Category', 282, '1749557298_b00da376b59db2de162d.png', 1, '2025-06-10 12:08:18', '2025-06-10 17:38:18', '', '1749557298_ba53b35fd137977fb5e7.png');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `template` longtext NOT NULL,
  `parameters` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `title` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `type`, `template`, `parameters`, `created_at`, `updated_at`, `title`) VALUES
(18, 'provider_approved', 'Dear [[provider_name]], your request as a provider has been approved. You can now start providing services through our platform. Visit [[site_url]] for more details.', '[\"provider_name\",\"site_url\"]', '2024-07-16 12:19:21', '2024-07-16 12:19:21', 'Approval'),
(19, 'provider_disapproved', 'Dear [[provider_name]], we regret to inform you that your provider request with [[company_name]] has been disapproved. For further information, please contact us at [[company_contact_info]].\r\n', '[\"provider_name\",\"company_name\",\"company_contact_info\"]', '2024-07-16 12:23:29', '2024-07-16 12:23:29', 'Rejection'),
(20, 'withdraw_request_approved', 'Hello [[provider_name]], your withdrawal request has been approved. The amount of [[amount]] [[currency]] will be processed shortly.', '[\"provider_name\",\"amount\",\"currency\"]', '2024-07-16 12:24:04', '2024-07-16 12:24:04', 'Withdrawal'),
(21, 'withdraw_request_disapproved', 'Hello [[provider_name]], we regret to inform you that your withdrawal request has been disapproved.Please contact [[company_name]] at [[company_contact_info]] for more details.\r\n', '[\"provider_name\",\"company_name\",\"company_contact_info\"]', '2024-07-16 12:34:19', '2024-07-16 12:34:19', 'Withdrawal'),
(22, 'payment_settlement', 'Dear [[provider_name]], your payment of [[amount]] [[currency]] has been successfully settled. Thank you for choosing [[company_name]].\r\n', '[\"provider_name\",\"amount\",\"currency\",\"company_name\"]', '2024-07-16 12:35:19', '2024-07-16 12:35:19', 'Payment'),
(23, 'service_disapproved', 'Dear [[provider_name]], we regret to inform you that your service request ([[service_name]]) with [[company_name]] has been disapproved. Please contact us for further assistance.\r\n', '[\"provider_name\",\"service_name\",\"company_name\"]', '2024-07-16 12:36:14', '2024-07-16 12:36:14', 'Rejection'),
(24, 'service_approved', 'Hello [[provider_name]], your service request ([[service_name]]) has been approved by [[company_name]]. You can proceed with the service as planned.\r\n', '[\"provider_name\",\"service_name\",\"company_name\"]', '2024-07-16 12:37:22', '2024-07-16 12:37:22', 'Approval'),
(25, 'user_account_active', 'Hello [[user_name]], your account with [[company_name]] is now active. \r\n', '[\"user_name\",\"company_name\"]', '2024-07-16 12:37:56', '2024-07-16 12:37:56', 'Account'),
(26, 'user_account_deactive', 'Hello [[user_name]], your account with [[company_name]] has been deactivated. If you have any questions, please contact us at [[company_contact_info]].\r\n', '[\"user_name\",\"company_name\",\"company_contact_info\"]', '2024-07-16 12:38:47', '2024-07-16 12:38:47', 'Account'),
(27, 'booking_status_updated', 'Hello [[user_name]], the status of your booking ([[booking_id]]) with [[company_name]] has been updated. Visit [[site_url]] for details.\r\n', '[\"user_name\",\"booking_id\",\"company_name\",\"site_url\"]', '2024-07-16 12:44:21', '2024-07-16 12:44:21', 'Booking'),
(28, 'new_booking_confirmation_to_customer', 'Hello [[user_name]], your booking ([[booking_id]]) with [[company_name]] for [[booking_service_names]] on [[booking_date]] at [[booking_time]] has been confirmed. Thank you for choosing us!\r\n', '[\"user_name\",\"booking_id\",\"company_name\",\"booking_service_names\",\"booking_date\",\"booking_time\"]', '2024-07-16 12:46:26', '2024-07-16 12:46:26', 'Booking'),
(29, 'new_booking_received_for_provider', 'Hello [[provider_name]], a new booking ([[booking_id]]) has been received for you from [[user_name]]. Please review and confirm at [[site_url]].\r\n', '[\"provider_name\",\"booking_id\",\"user_name\",\"site_url\"]', '2024-07-16 12:47:31', '2024-07-16 12:47:31', 'New'),
(30, 'provider_update_information', 'Hello [[company_logo]], [[provider_name]] updated their details. Check once.\r\n', '[\"company_logo\",\"provider_name\"]', '2024-07-16 12:48:38', '2024-07-16 12:48:38', 'Provider Update Information'),
(31, 'new_provider_registerd', 'A new provider [[provider_name]] has registered with [[company_name]]. Visit [[site_url]] for more details.\r\n', '[\"provider_name\",\"company_name\",\"site_url\"]', '2024-07-16 12:51:15', '2024-07-16 12:51:15', 'New Provider Registered'),
(32, 'withdraw_request_received', 'Hello [[provider_name]], we have received your withdrawal request. It is currently being processed. You will be notified once it\'s approved or disapproved.\r\n', '[\"provider_name\"]', '2024-07-16 12:54:38', '2024-07-16 12:54:38', 'Withdrawal Request Received'),
(33, 'new_rating_given_by_customer', 'Dear [[provider_name]] A [[user_name]] has just rated your service. Check your dashboard for details and feedback. Thank you!', '[\"provider_name\",\"user_name\"]', '2024-08-02 17:54:27', '2024-08-02 17:54:27', 'New Rating Alert'),
(34, 'rating_request_to_customer', 'Dear [[user_name]] We value your feedback! Please take a moment to rate your recent experience with us. Your input helps us improve. \r\n\r\n', '[\"user_name\"]', '2024-08-02 17:56:08', '2024-08-02 17:56:08', 'Rating Request to customer'),
(35, 'new_booking_received_for_provider', '[[user_id]]okokkokokok', '[\"user_id\"]', '2024-11-29 22:50:10', '2024-11-29 22:50:10', 'ok');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `duration` text NOT NULL,
  `price` double NOT NULL,
  `discount_price` double NOT NULL,
  `publish` text NOT NULL,
  `order_type` text NOT NULL,
  `max_order_limit` text DEFAULT NULL,
  `service_type` text NOT NULL,
  `max_service_limit` text DEFAULT NULL,
  `tax_type` text NOT NULL,
  `tax_id` text DEFAULT NULL,
  `is_commision` text NOT NULL,
  `commission_threshold` text DEFAULT NULL,
  `commission_percentage` text DEFAULT NULL,
  `status` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `name`, `description`, `duration`, `price`, `discount_price`, `publish`, `order_type`, `max_order_limit`, `service_type`, `max_service_limit`, `tax_type`, `tax_id`, `is_commision`, `commission_threshold`, `commission_percentage`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Premium1', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', '30', 599, 549, '1', 'unlimited', '0', 'unlimited', NULL, 'included', '12', 'yes', '100000', '40', '1', '2023-08-10 13:42:15', '2023-08-10 13:42:15'),
(8, 'Pro Plan', 'Buy the Pro plan and get your bookings.', '180', 1099, 999, '1', 'limited', '90', 'unlimited', NULL, 'included', '16', 'yes', '10000', '5', '1', '2023-09-11 06:14:12', '2023-09-11 06:14:12'),
(9, 'Standard', 'Buy the Standard plan and get bookings', '90', 699, 749, '1', 'limited', '50', 'unlimited', NULL, '', NULL, 'yes', '1', '10', '1', '2024-08-06 07:51:44', '2024-08-06 07:51:44'),
(10, 'Elite', 'Buy the Elite plan and get your bookings', '365', 1599, 1299, '1', 'unlimited', '0', 'unlimited', NULL, 'excluded', '', 'no', '0', '0', '1', '2024-08-06 07:56:03', '2024-08-06 07:56:03'),
(11, 'Essential', 'Try with the Essential plan and start your business', 'unlimited', 0, 500, '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '1', '2024-08-06 07:59:10', '2024-08-06 07:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `percentage` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0- deactive | 1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `title`, `percentage`, `status`, `created_at`, `updated_at`) VALUES
(6, 'GST', 5, 1, '2022-06-22 10:16:35', '2022-08-03 09:48:30'),
(7, 'NIL', 3, 1, '2022-06-22 10:16:43', '2022-08-03 09:48:25'),
(9, 'INTL', 10, 1, '2022-07-16 07:33:51', '2022-07-27 08:34:16'),
(10, 'PLTL', 1, 1, '2022-07-16 07:34:03', '2022-07-27 08:34:22'),
(11, 'BTPL', 25, 1, '2022-07-16 07:34:15', '2022-07-27 08:34:25'),
(12, 'MNLP', 10, 1, '2022-07-16 07:34:29', '2022-07-27 08:34:27'),
(14, 'mok', 1, 0, '2022-08-10 09:57:51', NULL),
(15, 'test', 5, 1, '2022-11-09 04:11:59', NULL),
(16, 'None', 0, 1, '2023-03-11 04:31:07', NULL),
(17, 'TEST', 1, 1, '2023-03-14 08:44:42', '2023-03-14 14:14:54'),
(18, 'test', 12, 1, '2025-03-27 06:08:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_default` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `slug`, `image`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Retro', 'retro', 'retro.png', 1, 1, '2021-12-03 13:33:03', '2022-08-09 10:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `ticket_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` int(11) NOT NULL,
  `user_type` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `transaction_type` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `txn_id` varchar(256) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(12) DEFAULT NULL,
  `currency_code` varchar(5) DEFAULT NULL,
  `message` varchar(128) NOT NULL,
  `transaction_date` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` text DEFAULT NULL,
  `subscription_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(20) NOT NULL,
  `version` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `version`, `created_at`, `updated_at`) VALUES
(1, '1.0', '2022-11-14 04:55:25', '2022-11-14 04:55:25'),
(3, '1.1.0', '2022-12-02 12:13:49', '2022-12-02 12:13:49'),
(6, '1.2.0', '2022-12-20 04:14:25', '2022-12-20 04:14:25'),
(7, '1.3.0', '2023-01-27 10:45:33', '2023-01-27 10:45:33'),
(8, '1.4.0', '2023-01-27 10:45:33', '2023-01-27 10:45:33'),
(10, '1.5.0', '2023-04-08 09:50:57', '2023-04-08 09:50:57'),
(11, '1.6.0', '2023-04-28 12:11:05', '2023-04-28 12:11:05'),
(12, '1.7.0', '2023-06-19 04:39:36', '2023-06-19 04:39:36'),
(13, '1.8.0', '2023-06-27 12:56:56', '2023-06-27 12:56:56'),
(14, '1.9.0', '2023-08-10 13:27:50', '2023-08-10 13:27:50'),
(15, '2.0.0', '2023-09-25 08:37:36', '2023-09-25 08:37:36'),
(16, '2.1.0', '2023-10-27 10:45:27', '2023-10-27 10:45:27'),
(17, '2.2.0', '2024-02-01 12:16:21', '2024-02-01 12:16:21'),
(18, '2.2.1', '2024-02-15 12:31:25', '2024-02-15 12:31:25'),
(19, '2.3.0', '2024-03-18 11:10:34', '2024-03-18 11:10:34'),
(20, '2.4.0', '2024-04-08 04:04:54', '2024-04-08 04:04:54'),
(21, '2.5.0', '2024-05-14 12:45:05', '2024-05-14 12:45:05'),
(22, '2.6.0', '2024-06-14 06:41:44', '2024-06-14 06:41:44'),
(23, '2.7.0', '2024-07-10 09:25:38', '2024-07-10 09:25:38'),
(24, '2.8.0', '2024-08-31 07:08:43', '2024-08-31 07:08:43'),
(25, '2.9.0', '2024-09-23 09:43:41', '2024-09-23 09:43:41'),
(26, '3.0.0', '2024-11-30 05:46:04', '2024-11-30 05:46:04'),
(27, '3.0.1', '2025-02-05 04:39:04', '2025-02-05 04:39:04'),
(28, '3.1.0', '2025-02-05 04:42:58', '2025-02-05 04:42:58'),
(29, '4.0.0', '2025-03-26 13:44:05', '2025-03-26 13:44:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `country_code` text NOT NULL,
  `fcm_id` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `api_key` text NOT NULL,
  `friends_code` varchar(255) DEFAULT NULL,
  `referral_code` varchar(255) DEFAULT NULL,
  `city_id` int(50) DEFAULT 0,
  `city` varchar(252) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payable_commision` int(11) NOT NULL DEFAULT 0,
  `strip_id` text DEFAULT NULL,
  `web_fcm_id` text DEFAULT NULL,
  `platform` text DEFAULT NULL,
  `panel_fcm_id` text DEFAULT NULL,
  `unsubscribe_email` varchar(255) NOT NULL DEFAULT '1',
  `uid` varchar(255) DEFAULT NULL,
  `loginType` varchar(255) DEFAULT NULL,
  `countryCodeName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `balance`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `country_code`, `fcm_id`, `image`, `api_key`, `friends_code`, `referral_code`, `city_id`, `city`, `latitude`, `longitude`, `created_at`, `updated_at`, `payable_commision`, `strip_id`, `web_fcm_id`, `platform`, `panel_fcm_id`, `unsubscribe_email`, `uid`, `loginType`, `countryCodeName`) VALUES
(1, '127.0.0.1', 'Wrteam', '$2y$12$4Eag4sMGT78JqLPfKSDFleYPX/TZYzOjrRpeKcsDnxS3qbgEMP6F6', 'wrteam@gmail.com', 2000100, NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1750053878, 1, 'Admin', 'istrator', 'ADMIN', '9876543210', '+91', 'cZ87XVGpTomEKhl3dhkTW7:APA91bEOgAV7X2RyTMGFcz513xCOLTYr2JCaubtJ8Su7beQMnMCMNwgnm3wWQRD33m43G0fCV-OM2pgacoS39SBsQ4Qr1KP51pPWQnbbwb4ozs3rYp9YyV0Xqj5vGBOM3l8lEzTjmm25', '1713127745_b2ad80a25b45f12f8087.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODU1ODUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjE1ODUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMSJ9.N6hNKXlLvu-DKlGL4qcANnwrrEQ9ts1pqziPucItt60', '45dsrwr', 'MY_CODE', 10, '', '23.2740707', '69.6530334', '2022-05-24 04:44:29', '2022-05-24 04:44:29', 0, NULL, 'eORnXVCem9jDgh_rDXt9bg:APA91bHaFFsHtS4Qr1dImLTS48vuHVoYrXS7C5OWB_p1n4r19dRn0VpfG6raqUxeLeMorA-zjW_YuLIKY6bIB587mj5vjCWREHJ6XRuOhZAlQ7Ep_UjYaOW3O5isHHTiC1MzyhJdBkSE', 'android', 'dseTfgIVp0x3qNmX-tiyLy:APA91bE3wzzZq4s1DL9gKUHS-lBNIsiMP7ZoCKmE49_ui_N-ZeWxhSbVLOomq5cnfTp9WnsNs8SzH2zC6ySLp55qmr_mVG9gV8uY7QYmJgHJ_F4bdUJvvx8', '1', NULL, NULL, NULL),
(43, '::1', 'kingguy1507', '$2y$10$rpjMKo1LknuwQ3POUG0IGu3Wv6YgbTlPtJF0vVjjxbgMudbFZLptO', '', 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1647497231, 1651751295, 1, 'king', 'of_hell', NULL, '9949288755', '', '', '1651321136.3878.jpg', '', '', '', NULL, '', '23.2740707', '69.6530334', '2022-05-24 04:44:29', '2022-05-24 04:44:29', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(44, '::1', 'jave', '$2y$10$Ehufnr0mW/44gBtnWq9AnOpp/Mt7Ov6F4kSB6baLzu9TBiRA/trtW', 'javedker00@gmial.com', 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1651746947, 1651755832, 1, 'test', 'test', 'cocacola', '9874565478', '', 'eLDK_YsdQBuAHevt_YXPbs:APA91bH3Z1P_NH-SEDLI4TXkfziSW8Cj4JkUTjnwuAifaEqVctU78gJtBdkRpcdj6Fg7iMIh1HC9NoSnxLWFNQVGwMVSikU00HSGnXeFVO2WKFHNBvPbK3hnV40zyNFj4ETb0RFC9P0P', '1655719419_35d7ecc73ff0b03a1880.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTUyNzU0ODUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NTUyNzcyODUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiNDQifQ.VWKoIuFJ3LA4klUt3ElzBO-1i2wLbPvqA11TUsxHIrc', '', '', 7, '', '23.2740707', '69.6530334', '2022-05-24 04:44:29', '2022-05-24 04:44:29', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(50, '::1', 'Electric', '$2y$10$nN83ruIG1I/BIYqRKGuR7OuuBawX.r8gPtJiG1cxn9KQviawET/vy', 'XXXX@gmail.com', 82, 'b1380c5ba355b7f1185e', '$2y$10$dieHbD7KDbD2xGEKgwpNQ.yFmTjXLJWnfGPyF5enwoFwCNnMMolOi', NULL, NULL, NULL, NULL, NULL, 1652250409, 1749818548, 1, 'partner', 'edemand', 'Edemand partner', '1234567890', '+91', 'c2JJvp9URTG4Wtz1DhZsBS:APA91bEO6cbbr50uLpXlqa-806Y9vNWGJohPr330dgDX6yOHXOQ6gufw_M2Ci87Ip-ZjoEe1CBjnBcrQOoY5eVjIl_nqYNpXfVJX7lLZttk0wjpgTFgIg6c', 'public/backend/assets/profile/1749622416_4b8f1555ad9f3a1c7370.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODY4NDEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjI4NDEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiNTAifQ.9PqL7oFGAS4PHvCYMhGFeFAmnI6hwpldaIUzs1lFgfQ', '', '', 18, 'Bhuj', '23.241999', '69.666932', '2022-05-24 04:44:29', '2022-05-24 04:44:29', 751, NULL, NULL, 'android', 'eq6JtAEHJ4QBJ-PIDYtyIO:APA91bE_Bw0N16Fx9p_DWP2nECg1mgocmOC6llo3P5EQZH6usJspkLC5DECJm9J4KhFQprSkM6ORp7PFv7bS2ALyJkk7PAl1LdKNvRanSmO81NZSRJ_x6fc', '1', NULL, NULL, NULL),
(63, '150.129.54.182', 'javedker00@gmail.com', '$2y$10$Wbma3bTT2MzJ7kVu/IOaLuSyEsZ/XtoUKx2je4pTwiLAVp9dwMjP.', '', 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1653370029, 1745018105, 1, NULL, NULL, NULL, '123456780', '+91', 'cz9BqKHVBENAq5z1gaRTem:APA91bFFOg14ZK5Mw_V8vfCOOWk2UoybEmqQQCFWbzuI5d4JQ0gf8bh4ZL3UAXMvyzhrlrM0hl-BDZy9lTyzorjcc91_14gD-HaPdqMlHH31vvkiStrYf64', '1651321136.3878.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTM0NTQ4MDAsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NTM0NTY2MDAsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiNjMifQ.32TFNeu0BkMS03bj3z3e7C0N9aTUqzIZ-VmydhBop38', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-05-24 05:27:09', '2022-05-24 05:27:09', 0, NULL, NULL, 'ios', NULL, '1', NULL, NULL, NULL),
(64, '150.129.54.166', 'javed', '$2y$10$LCLTGT54z5uv5WH5qJQLLuSe6MslPCNOfnTl1vVMPk4RJUngdsb5y', 'infinitietechnologies10@gmail.com', 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1653473530, 1653534635, 1, 'Partner', 'edemand', 'Infinity', '9874565478', '', 'sqwqwe', '1653473682.5462.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTQxNjY5ODYsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NTQxNjg3ODYsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiNjQifQ.ac1xkGzioysrXjs3o6FA7N1S5-kVOwzdDdBp7DNTL3U', NULL, NULL, 7, '', '23.2740707', '69.6530334', '2022-05-25 10:12:10', '2022-05-25 10:12:10', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(65, '49.34.77.170', '123456987', '$2y$10$YqylyAUBXL0W1tyPkwdkCu4mD8b2.W/eUQHyhJeTZFeHGisfNb/iS', '', 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1653800460, NULL, 1, NULL, NULL, NULL, '123456987', '', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTM4MDEwMDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NTM4MDI4MDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiNjUifQ.fXx0O9EWE_1ldqDb0hqmv9OejpbVSQ2Q2Z3MMlgiIiM', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-05-29 05:01:00', '2022-05-29 05:01:00', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(67, '49.34.77.170', '78787878', '$2y$10$Faj33aQ9y6wsnmmW6k50ROWgv2G7WXETT/ZvbSe7iCj31e3e5O2Lu', '', 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1653801023, NULL, 1, NULL, NULL, NULL, '78787878', '', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTM4MDEwNzksImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NTM4MDI4NzksInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiNjcifQ.o3otGkAm5h-vPX7cRB9Jkb0LL3v-OUXFuF8GTq7ZR4E', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-05-29 05:10:23', '2022-05-29 05:10:23', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(68, '114.31.180.23', '9925880172', '$2y$10$GOnGgKcdlpTcXR.jnTRsruw.I5wyAE7iZjf/.8BR3TVPAD8gT0JDK', '', 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1653801294, NULL, 1, NULL, NULL, NULL, '9925880172', '', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NjEzMzc0NDIsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NjEzMzkyNDIsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiNjgifQ.eWPA3yS9jwP2XISYKTpL9gYWJxPTdKlUZ4y6vl7KySk', NULL, 'Vijay7272', 11, '', '23.2740707', '69.6530334', '2022-05-29 05:14:54', '2022-05-29 05:14:54', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(69, '150.129.54.167', 'javed', '$2y$10$x2ZIURCMjBsDFgbDk8Wq1.xVHsKDQ2D9A.yetjw1yCJAW6rflLO.G', '', 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1653883834, NULL, 1, NULL, NULL, NULL, '9874565478', '', '1234wewheihwer', '1653886164_14678c6a90f00a6607f7.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTM5NzAyNTksImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NTM5NzIwNTksInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiNjkifQ.f1GLHzQVY1jN9UqYGemkkasZPoyhU-07DD_Y1Z0TY5A', NULL, NULL, 7, '', '23.2740707', '69.6530334', '2022-05-30 04:10:34', '2022-05-30 04:10:34', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(72, '103.96.14.161', 'Sumra Mohammed Anish', '$2y$10$Xdag48FdXmhEAOZLCwHs4e9eLSAwXQE1EMw8OBPDANQuts8iCQzWG', 'anish12@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1654087620, NULL, 1, NULL, NULL, NULL, '8200786263', '', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njc5ODYzOTYsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njc5ODgxOTYsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiNzIifQ.Arln5sBCwhk8BCpitxtFQ60FdsgfPSEapd5AOAI3hgY', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-06-01 12:47:00', '2022-06-01 12:47:00', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(73, '150.129.54.133', 'gurnanik', '$2y$10$xOMcW1PJbUNvKqt4evrm3uHKuMug.s74F2QbC80gteiRcKJCzwPRu', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1654167007, NULL, 1, NULL, NULL, NULL, '4646798234587', '', NULL, NULL, '', NULL, NULL, 7, '', '23.2740707', '69.6530334', '2022-06-02 10:50:07', '2022-06-02 10:50:07', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(78, '103.96.14.161', 'gurnanik', '$2y$10$o47UbeRrs.lTBPsavZAMSe9IXAxvhVjzbcWJufdk0q6FX.KRAEDi.', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1654515947, NULL, 1, NULL, NULL, NULL, '98745654798', '', NULL, '1651321136.3878.jpg', '', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-06-06 11:45:47', '2022-06-06 11:45:47', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(179, '', 'nikita_bhanderi', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '+919974093845', '', 'er7k-43SRL-AimQtDwu1ie:APA91bHT5ck2NFFcCvgOWZ4dtVuG_f7mZ_iLu_A5wHRtJs8ADnCJPnKlTcmmZcBQZQPhZo1gpRToActOXylygi3z2OZy5_ulK-iB0fd64j2uq_-CAUCQ2CujpRQZ2IoVgudKdR0BrgRk', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NjM1NzAxNDEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NjM1NzE5NDEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTc5In0.-CdbWR2RB7dRGQv7Ka6ML43EKJcTFBoSsNxA9lfccOU', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-08-25 06:05:38', '2022-08-25 06:05:38', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(181, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1234567892134645777', '', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NjUwNDM4MjMsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NjUwNDU2MjMsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTgxIn0.VO7fzo9gF9O5W97I5pIayWc7aTJSeRZEfVNzWFn-7QI', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-09-24 03:13:11', '2022-09-24 03:13:11', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(182, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '12345678921346457777', '', NULL, NULL, '', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-10-12 06:39:44', '2022-10-12 06:39:44', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(183, '103.30.227.172', 'test', '$2y$10$mv.mt5Oe8L2nAsiolfELmOsybU5Xq92YVDQhCWJ3sicCohq29FzVe', 'test@gmail.com', 0, NULL, NULL, 'c2c3f7da639578304b3c', '$2y$10$/AUS/VdmogtcGhWuMMkLGue4J9GP8ftmSZyxtqDL/K4OfFAWHgSty', 1671187241, NULL, NULL, 1665733293, NULL, 1, NULL, NULL, 'Jignesh Company', '8200786264', '+91', 'e_SpEGdXT06vnnjP6ejLtX:APA91bHI7c9sAkvxwJ-AxksOC1o09RzN0mVEf8QpUinCsFIPeDhfOfSDGsG0yFhxZmIFDhL3WhdrfHCIHjJNpgCSl8HPE1kww4fX-2-kO8GEYg03uwe6z6U8o6bxeJPW1VJbJ11cO47W', '1679718790_f13fd81f36b9aeb157e1.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDU3MjExMzEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3NzcyNTcxMzEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjM2OCJ9.4b06HDqdiZFFx_99DFXmRDob9KHrJGn4tW8LRQlj7Ug', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-10-14 07:41:33', '2022-10-14 07:41:33', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(184, '', 'test@gmail.com', '', 'wrteam.jignesh@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '+918200323468', '', 'clVFIbp0vUnmsQOE6eTEdy:APA91bHgG0a7wAjbogU2S7WU_ojypBi6AjWF0dP4v4BOf5DL9UR6-eY3LByKe8pxLK0BT_v2CwTWxpKexNNE4tKGgkEhYsLNyc0fVMjHBgQWF04QnW_CFsbUNw1TOei0a2lXo_lIPkjW', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODI3MjMsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMTg3MjMsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTg0In0.zAHIiW_ErJEymwqAoxAgTv-Cmnv5MpKeqUqcCRsas_g', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-10-19 11:11:22', '2022-10-19 11:11:22', 0, NULL, NULL, 'ios', NULL, '1', NULL, NULL, NULL),
(186, '', 'Anish', '$2y$10$mv.mt5Oe8L2nAsiolfELmOsybU5Xq92YVDQhCWJ3sicCohq29FzVe', 'anish9th@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '+916359676012', '', 'dB6tHuITQTiHy2NB3iEYT1:APA91bEaobhsBRrJFjZmMC2YWXAfLv_xz6-snvAmrWJry6esMBx_R2MAUPFX-GPpGPDc6sjaGLTT3G0oaL0j-pQ2eg6REVT3HliSpLkH8ivf07qZINaqxhw7hQGXYyviBMhfWiSIO92l', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NjY5NTE3MzcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NjY5NTM1MzcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTg2In0.nLCP6dO_9ivSvair0lBN9g918Kv6Y6XfQDGrgNtVce0', NULL, NULL, 18, '', '23.2740707', '69.6530334', '2022-10-28 10:08:06', '2022-10-28 10:08:06', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(189, '', 'Divy Jani', '', 'diva@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '+918200727077', '', 'eFackRkOSh2_dlxUz4_r2p:APA91bF1NZShChhNE2cYWbsNnrGgu-W3QcKCtRNuULZa24gxcyu2Vcbcq1lVTdQexW1nI7ovl1NQb_p-VLaTFQzIVs71LzYS87k2GylTi0Aa2_-AEKI9X6BIuJniuLuAsh-hfs6SZwMz', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODUzNzcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjEzNzcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTg5In0.hijDnyePN8RkZT8vbDoW706yjnZGTN0ItEnjLPmUpMA', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-03 04:33:42', '2022-11-03 04:33:42', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(190, '', '9876543210', '12345678', 'l.shreesoftech@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896523102', '', NULL, '1667460068.jpg', '', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-03 07:21:08', '2022-11-03 07:21:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(191, '', 'WRTeamtbgwnnyen2y', '', 'wrteam@gmail.comhhfjdjdjdjdjd', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '+919876543210', '', 'dodBat2DgUVWo8zKnsRO9o:APA91bEhSUDV5G2DcgrmYBFp6scluxEevOuy3sZ4RLgUipjrwE4URkY5J3DSDzT20-VogTEi3ZnuVRV5r3fvYx12aYeAfsvi_mQ5m0jbLzr9EjGDsITVFAF0Ukl0xuJaP3vJp_NzFd37', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODU1ODIsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjE1ODIsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTkxIn0.qx-6Ymm09ARkbab-lkUpdQR0vZDiD0KxTwU4jk6nh94', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-03 11:12:43', '2022-11-03 11:12:43', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(192, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '919876543210', '+', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njc2NDcwMjcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njc2NDg4MjcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTkyIn0.WG2usHA8jRXZX7ofoSmZwxBIrGaeDSOp0qEU2TZ97SI', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-03 11:41:11', '2022-11-03 11:41:11', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(193, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '+917202027077', '', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njc2MjE0NDMsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njc2MjMyNDMsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTkzIn0.D8IjQ5ZsHU7-qyFIiirH7M8ncFG24Jorj89quMkExJw', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-03 11:46:20', '2022-11-03 11:46:20', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(194, '', 'test partner', '12345678', 'infinitietechnologies10@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '9876540321', '', NULL, '1667560283.png', '', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-04 11:11:23', '2022-11-04 11:11:23', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(195, '', 'test partner', '12345678', 'infinitietechnologies10@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '9876540321', '', NULL, '1667560805.png', '', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-04 11:20:05', '2022-11-04 11:20:05', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(196, '', 'test partner', '12345678', 'infinitietechnologies10@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '9876540321', '', NULL, '1667561000.png', '', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-04 11:23:20', '2022-11-04 11:23:20', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(197, '', 'Alexunder Hash ', '8200727077', 'Alex@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '8200727077', '+91', 'fnRrdRg4TpuU-u40ArSF6E:APA91bHY9qPvU2daykWcjhSoJ-X_HMfhQ-VKq-jJsReCKd7FAQ3puh3OWdK-CUGJKYcjsDmV5VHgICeCOXaUrKLnkqANxMUhyypOUyoeg9v_k9R44Ztxu2Gy_iIVihQwMYqqQvLUav85', '1668401578_94e507e30369fa5c48f7.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODUzNzUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjEzNzUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTk3In0.InCkAsPOTvO1CSPqZSCESBlACRhnoR8Q4Q1vKCAkAsA', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-04 12:20:49', '2022-11-04 12:20:49', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(198, '', 'Asgar', '8200727077', 'shreesofttech07@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '8200727077', '+91', NULL, '1667564458.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODUzNzUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjEzNzUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTk3In0.InCkAsPOTvO1CSPqZSCESBlACRhnoR8Q4Q1vKCAkAsA', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-04 12:20:58', '2022-11-04 12:20:58', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(199, '', 'Asgar', '8200727077', 'shreesofttech07@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '8200727077', '+91', NULL, '1667564475.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODUzNzUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjEzNzUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTk3In0.InCkAsPOTvO1CSPqZSCESBlACRhnoR8Q4Q1vKCAkAsA', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-04 12:21:15', '2022-11-04 12:21:15', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(200, '', 'Asgar', '8200727077', 'shreesofttech07@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '8200727077', '+91', NULL, '1667564476.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODUzNzUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjEzNzUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTk3In0.InCkAsPOTvO1CSPqZSCESBlACRhnoR8Q4Q1vKCAkAsA', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-04 12:21:16', '2022-11-04 12:21:16', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(201, '', 'Asgar', '8200727077', 'shreesofttech07@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '8200727077', '+91', NULL, '1667564481.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODUzNzUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjEzNzUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTk3In0.InCkAsPOTvO1CSPqZSCESBlACRhnoR8Q4Q1vKCAkAsA', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-04 12:21:21', '2022-11-04 12:21:21', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(202, '', 'Asgar', '8200727077', 'shreesofttech07@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '8200727077', '+91', NULL, '1667564507.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODUzNzUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjEzNzUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTk3In0.InCkAsPOTvO1CSPqZSCESBlACRhnoR8Q4Q1vKCAkAsA', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-04 12:21:47', '2022-11-04 12:21:47', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(203, '', 'Asgar', '8200727077', 'shreesofttech07@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '8200727077', '+91', NULL, '1667564530.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODUzNzUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjEzNzUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTk3In0.InCkAsPOTvO1CSPqZSCESBlACRhnoR8Q4Q1vKCAkAsA', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-04 12:22:10', '2022-11-04 12:22:10', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(204, '', 'Jignesh', '$2y$10$LCLTGT54z5uv5WH5qJQLLuSe6MslPCNOfnTl1vVMPk4RJUngdsb5y', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1678525029, 1, NULL, NULL, NULL, '12344567801', '', NULL, '1667565308.png', '', NULL, NULL, NULL, 'Bhuj', '23.2740707', '69.6530334', '2022-11-04 12:35:08', '2022-11-04 12:35:08', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(205, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', 'fwGmOxu-Q1iOhtcxNlBJ1c:APA91bHJYibadJ-5JFIRvIH6GVIVpPW0xV8HMnhfuPG_-qQ_7TwfLVixr9K7AUl05Q-1hquHuXN6gaQXx-yKsNSxSbK7QFd797C1POT9ZfGw5AS_70Ma2QtRHfks36OgfQb2HTznYbm1', '1668423343_c2785e28c323da4682a4.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:42:18', '2022-11-07 06:42:18', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(206, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803345.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:42:25', '2022-11-07 06:42:25', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(207, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803419.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:43:39', '2022-11-07 06:43:39', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(208, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803467.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:44:27', '2022-11-07 06:44:27', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(209, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803502.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:02', '2022-11-07 06:45:02', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(210, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803506.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:06', '2022-11-07 06:45:06', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(211, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803506.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:06', '2022-11-07 06:45:06', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(212, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803506.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:06', '2022-11-07 06:45:06', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(213, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803507.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:07', '2022-11-07 06:45:07', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(214, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803507.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:07', '2022-11-07 06:45:07', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(215, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803508.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:08', '2022-11-07 06:45:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(216, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803508.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:08', '2022-11-07 06:45:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(217, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803508.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:08', '2022-11-07 06:45:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(218, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803508.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:08', '2022-11-07 06:45:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(219, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803508.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:08', '2022-11-07 06:45:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(220, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803508.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:08', '2022-11-07 06:45:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(221, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803508.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:08', '2022-11-07 06:45:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(222, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803508.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:08', '2022-11-07 06:45:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(223, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803508.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:08', '2022-11-07 06:45:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(224, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803508.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:08', '2022-11-07 06:45:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(225, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803509.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:09', '2022-11-07 06:45:09', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(226, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803509.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:09', '2022-11-07 06:45:09', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(227, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803509.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:09', '2022-11-07 06:45:09', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(228, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803510.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:10', '2022-11-07 06:45:10', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(229, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803510.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:45:10', '2022-11-07 06:45:10', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(230, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803564.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:46:04', '2022-11-07 06:46:04', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(231, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803719.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:39', '2022-11-07 06:48:39', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(232, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803719.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:39', '2022-11-07 06:48:39', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(233, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803719.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:39', '2022-11-07 06:48:39', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(234, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803719.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:39', '2022-11-07 06:48:39', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(235, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803719.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:39', '2022-11-07 06:48:39', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(236, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803720.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:40', '2022-11-07 06:48:40', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(237, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803720.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:40', '2022-11-07 06:48:40', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(238, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803721.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:41', '2022-11-07 06:48:41', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(239, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803721.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:41', '2022-11-07 06:48:41', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(240, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803722.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:42', '2022-11-07 06:48:42', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(241, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803722.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:42', '2022-11-07 06:48:42', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(242, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803722.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:42', '2022-11-07 06:48:42', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(243, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803722.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:42', '2022-11-07 06:48:42', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(244, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803722.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:42', '2022-11-07 06:48:42', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(245, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803722.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:42', '2022-11-07 06:48:42', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(246, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803722.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:42', '2022-11-07 06:48:42', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(247, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803723.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:43', '2022-11-07 06:48:43', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(248, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803723.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:43', '2022-11-07 06:48:43', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(249, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803723.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:43', '2022-11-07 06:48:43', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(250, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803723.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:48:43', '2022-11-07 06:48:43', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(251, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803790.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:49:50', '2022-11-07 06:49:50', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(252, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803790.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:49:50', '2022-11-07 06:49:50', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(253, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803790.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:49:50', '2022-11-07 06:49:50', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(254, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803790.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:49:50', '2022-11-07 06:49:50', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(255, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803790.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:49:50', '2022-11-07 06:49:50', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(256, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803790.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:49:50', '2022-11-07 06:49:50', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(257, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803790.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:49:50', '2022-11-07 06:49:50', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL);
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `balance`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `country_code`, `fcm_id`, `image`, `api_key`, `friends_code`, `referral_code`, `city_id`, `city`, `latitude`, `longitude`, `created_at`, `updated_at`, `payable_commision`, `strip_id`, `web_fcm_id`, `platform`, `panel_fcm_id`, `unsubscribe_email`, `uid`, `loginType`, `countryCodeName`) VALUES
(258, '', 'Rashmi Hirani', '7896541230', 'rashmi@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7896541230', '', NULL, '1667803790.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1ODUyNDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAxMjEyNDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjA1In0.dKGhlvS793Dr88BVwnvfekx7z44hjWNrekLNXNmULPs', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 06:49:50', '2022-11-07 06:49:50', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(259, '103.30.227.15', 'Divy Jani', '$2y$10$dHnp/yMov4BscGUgwtWIyeKebedmgo1cLEz9CUo3g4DAuQ9t.B95C', 'diva@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1667805297, 1667816214, 1, NULL, NULL, 'PlumbService Pvt Ltd', '8200727077', '+91', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODUzNzUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjEzNzUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMTk3In0.InCkAsPOTvO1CSPqZSCESBlACRhnoR8Q4Q1vKCAkAsA', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 07:14:57', '2022-11-07 07:14:57', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(260, '', 'Strombrand', '$2y$10$LCLTGT54z5uv5WH5qJQLLuSe6MslPCNOfnTl1vVMPk4RJUngdsb5y', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1680572239, 1, NULL, NULL, NULL, '12344567801', '+91', '', 'public/backend/assets/profile/02 StormBrand Electronic Store.jpg', '', NULL, NULL, NULL, 'Bhuj', '23.2740707', '69.6530334', '2022-11-07 07:29:11', '2022-11-07 07:29:11', 200, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(262, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '+916359676012', '', NULL, NULL, '', NULL, NULL, NULL, '', '23.2740707', '69.6530334', '2022-11-07 08:24:54', '2022-11-07 08:24:54', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(263, '', 'divy', '$2y$12$4Eag4sMGT78JqLPfKSDFleYPX/TZYzOjrRpeKcsDnxS3qbgEMP6F6', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '12344567801', '+234', NULL, 'public/backend/assets/profile/1743420886_d3d945261f6f3f7caccb.jpg', '', NULL, NULL, NULL, 'Bhuj', '23.2740707', '69.6530334', '2022-11-07 10:31:39', '2022-11-07 10:31:39', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(269, '', 'Test Man', '12345678', 'test@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '9988776654', '', NULL, '1667826138.png', '', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-07 13:02:18', '2022-11-07 13:02:18', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(270, '', 'amarik', '$2y$10$D6sdYtfZk7e9bYa3DQFVZu/ZNyPfx6gQWpcdh7usARWXELf0rz1ye', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1668582548, 1, NULL, NULL, NULL, '9988776655', '+91', 'fodg2JX_RVaqF_7Bd3xr1a:APA91bE7CzWqgetgagWilbIo1mEqfZ4I2KkGBLfxSA91RDF6UFcNZ0FSRmf1MXGNuuXk17gdfwTWgnmAz-GdJ1YHZ8aUgLghRm7N8uG7sLyjuPayRaa2j-TNnHk-aQ_B7PTlDMUdSJBv', 'public/backend/assets/profile/1743424881_ad710891149582cd0b37.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODU0MTAsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjE0MTAsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjcwIn0.-ByzeFrajWO1pOrHgZoBW3i0mNzrTB8v3ig0ifrMtiQ', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-08 04:17:16', '2022-11-08 04:17:16', 49, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(273, '', 'Jack', '$2y$10$D6sdYtfZk7e9bYa3DQFVZu/ZNyPfx6gQWpcdh7usARWXELf0rz1ye', 'XXXX@gmail.com', 122.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1668409407, 1, NULL, NULL, NULL, '1234567888', '+91', 'dNyOJrN5TQGB5gZA9iqxaX:APA91bHc0ZPsBpcX53wHKwOwwGEmvgNrgtt-Fgodm3Db3DD5l2lw0nbbJeWZFUCYpLGqeCRdr6LTC-F-mYl1YockSVBKul9e-9QzaVW4Kj5ifbLQnH4WiWvu-4GMWuHf39fT8F5Z8Dl6', 'public/backend/assets/profile/1742967144_ae77243cadd17ff2c4f3.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg0MjY0MzIsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njg0MjgyMzIsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjczIn0.IzWv2AgRqgumlymDMUGEtNtOGh_J6yH_VBr96w12rJM', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-08 06:36:44', '2022-11-08 06:36:44', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(274, '', 'Test Partner', '12345678', 'abcd@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1597534862', '', NULL, '1667890946.jpeg', '', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-08 07:02:26', '2022-11-08 07:02:26', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(275, '', 'test', '1245678', 'abc123@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1223456789', '', NULL, '1667891145.jpeg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDU3MjExMzEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3NzcyNTcxMzEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjM2OCJ9.4b06HDqdiZFFx_99DFXmRDob9KHrJGn4tW8LRQlj7Ug', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-08 07:05:45', '2022-11-08 07:05:45', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(276, '', 'test', '12345678', 'abc123@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '9537376389', '', NULL, '1667894107.jpeg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDU3MjExMzEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3NzcyNTcxMzEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjM2OCJ9.4b06HDqdiZFFx_99DFXmRDob9KHrJGn4tW8LRQlj7Ug', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-08 07:55:07', '2022-11-08 07:55:07', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(277, '', 'zcsd', '12345678', 'infinitietechnologies10@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '99139200623', '', NULL, '1667900143.jpeg', '', NULL, NULL, 0, 'vzdv', '23.2740707', '69.6530334', '2022-11-08 09:35:44', '2022-11-08 09:35:44', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(278, '', 'Superadmin', '4514541', 'infinitietechnologies10@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '9510746255', '', NULL, '1667900253.png', '', NULL, NULL, 0, 'cghdth', '23.2740707', '69.6530334', '2022-11-08 09:37:33', '2022-11-08 09:37:33', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(279, '', 'test', '12345678', 'abc123@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '9537376389', '', NULL, '1667900554.jpeg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDU3MjExMzEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3NzcyNTcxMzEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjM2OCJ9.4b06HDqdiZFFx_99DFXmRDob9KHrJGn4tW8LRQlj7Ug', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-08 09:42:34', '2022-11-08 09:42:34', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(281, '', 'Superadmin', '$2y$10$gBNlo0N5/jX9a.RvSWkKOe5spZq0OhHQaGeMsRA6q56YgNzdKCk5i', 'infinitietechnologies10@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1667903593, 1, NULL, NULL, NULL, '9537376389', '', NULL, '1667902637.jpeg', '', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-08 10:17:17', '2022-11-08 10:17:17', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(282, '150.129.54.137', 'test ', '$2y$10$D6sdYtfZk7e9bYa3DQFVZu/ZNyPfx6gQWpcdh7usARWXELf0rz1ye', 'infinitietechnologies06@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1667903714, 1667903758, 1, NULL, NULL, 'test company', '9510746255', '', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDU3MjExMzEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3NzcyNTcxMzEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjM2OCJ9.4b06HDqdiZFFx_99DFXmRDob9KHrJGn4tW8LRQlj7Ug', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-08 10:35:14', '2022-11-08 10:35:14', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(283, '', 'Nupur Kailash', '$2y$10$D6sdYtfZk7e9bYa3DQFVZu/ZNyPfx6gQWpcdh7usARWXELf0rz1ye', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1667974321, 1, NULL, NULL, NULL, '7757733533', '+91', NULL, 'public/backend/assets/profile/1742993942_71557a13acc4f1dfe43f.jpeg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-08 11:01:16', '2022-11-08 11:01:16', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(284, '', 'Asgar ', '', 'shreesofttech07@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '+918866337244', '', 'eK76DUlDS7WkkbFI1-WPG_:APA91bGyiYLR3vPKZeNTI3pfKa-UhRK2WQFKY5VzHjzpbKwMW57rTDXm8bKs5A-tUwvpnVCtsTLWARJBQT6ghUhySQFfaVjQfA6Q-VVoFCHFkNteDv_CsoVgAgeXjKFnEskIRBRMXv0D', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njc5NzM4OTAsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njc5NzU2OTAsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjg0In0.qojAH2cACIRS2bpSaUZQAuHiJyFKcwYwb7lom5Y8i5Y', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-08 11:43:06', '2022-11-08 11:43:06', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(286, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '555555555', '', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njc5MTAzNjgsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njc5MTIxNjgsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjg2In0.Q1_C427eZytnKHDVvdvj8ZVp7SOSnpURtqBVQUfqQsM', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-08 12:11:05', '2022-11-08 12:11:05', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(290, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9974692496', '+91', 'fBnRxvUrRKO8kf7WpllpTw:APA91bEPdhBqqjx_x0jvHvTF8Lj4j5EV-N5KKE8TEGMinLeL6lSfF8wLm4qT0sHqkc2BjS3L9B7wqtd5J23FDP-GAdfy3R-7kiP6b5kKJLZh2JJZEZqDNNTokiMC9PSJxRd-aBd3dCfH', NULL, '', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-08 12:36:40', '2022-11-08 12:36:40', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(291, '', 'teat', '', 'qwj@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '8200970233', '+91', 'fOGZmW5hTP-vF0B2_C85TG:APA91bFe9IC5ArazNncHzgxIV7-xsqx36pLGgvHzmiaU5IZTML9w-up4Zxm4BJBp8db5XO96DOa-XVaiUZQTtcnKVyYJbqirBNE1idRON9d2HqT_mSqqeyuFX0WtNgonPAu0DSCc2Znz', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2Nzg5NDgsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMTQ5NDgsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjkxIn0.AYQI0-AER0vFylDFsfW71bAxPhUR6MGYbW6JLEkE-0w', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-08 12:36:53', '2022-11-08 12:36:53', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(292, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '14569875214', '', NULL, NULL, '', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-08 12:56:15', '2022-11-08 12:56:15', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(293, '', 'Sameera', '$2y$10$oHvhoLB78/8Tj3d6WUEoaOXl67xLbou1XQbkgG3/AzUwfCi.sBbau', 'XXXX@gmail.com', 0.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1722626769, 1, NULL, NULL, NULL, '1234567891', '+91', 'eWS2XMeQTkqSKjNZv2TujJ:APA91bF8xFt8Kga7C6hbUGKo4G3A4Mco_n0f4s-d5H2r5jHQ3cfyweWMZ1X53vULEh9Hbmb5trooJis9fxzY8mZKWtw7AdaFgvoj08KAmxhs_obfYIi0k_AAssKsAXW2J37NIfxanY23', 'public/backend/assets/profile/1742992459_3b1ee2b80e0a2259ae21.jpeg', '', NULL, NULL, 0, 'Dubai', '25.10631345233886', '55.25440692901611', '2022-11-09 05:11:30', '2022-11-09 05:11:30', 141, NULL, NULL, 'android', 'de_1esfOCaZo3XtnpWtEbo:APA91bFuVbksuKLUYrBPXFwoyQ-ek03iRmF4tm2BC4glChHcpG1wxZtUDPib6ythafcdkZeeIWQYG-1YhYY4kk5PNEkeyU1vqc8CXkFjCOo5aOQ76xCeNWvCGMzYp3emPp-Ro4VVaSts', '1', NULL, NULL, NULL),
(294, '', 'Sameera Umesh Kohli', '$2y$10$SmtSTadHCqV8gybY0X0x/OOZmS.BBuE0KuYm4o3o6Anl0PCtHf6Cq', 'sameera@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9919911911', '', NULL, '1667970691.jpg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-09 05:11:31', '2022-11-09 05:11:31', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(295, '', 'Sameera Umesh Kohli', '$2y$10$wIdoWImZB2iD7f/Pgomsuu9hbTUmJ3N3q.BB/sLBcJGw./raFFEUi', 'sameera@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1668417499, 1, NULL, NULL, NULL, '9919911911', '', NULL, '1667970691.jpg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-09 05:11:31', '2022-11-09 05:11:31', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(296, '', 'tttt', '', 'wrteam.jignesh@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '1231231231', '', 'crkS87WWTASVmX07dL9-YK:APA91bFcwqKMx1qBSArUWMxiOm2aiZ8bNdaNf0mYzdbpjGYVsBUX5GGSMZhniWw6yKL3ZhYJERdNXJa8HyaPgkQsnAMf22CtAe7JCUL4XbYyws0IFQIk5uVdbA1uK5EdCZLLLVrP-M3F', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NjgxNjU3MDEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NjgxNjc1MDEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjk2In0.NVw7OCU148LH4PHHx60WpDDyCcFvJa5zaS2letCxcOc', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-09 05:25:51', '2022-11-09 05:25:51', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(297, '', 'Aarti', '$2y$10$ljAcz.E71F14C1a/ruePduDDi16RcE2.ddYV6lfzFdTthMpzBGeL.', 'XXXX@gmail.com', 82.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '12344567801', '+91', NULL, 'public/backend/assets/profile/1742991472_99120dd79584d814ebce.jpeg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-09 05:53:22', '2022-11-09 05:53:22', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(298, '', 'anand', '$2y$10$fRH8HlV2VZFXoF9b1iRe0O9uNkKqi73niej/ZmhasO9TiBey.Bz4.', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1667977009, 1, NULL, NULL, NULL, '12344567801', '+91', NULL, 'public/backend/assets/profile/1742994304_1ae0ec0cdc2361c88e7a.png', '', NULL, NULL, 0, 'anjar', '23.2740707', '69.6530334', '2022-11-09 06:41:15', '2022-11-09 06:41:15', 24, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(299, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '6359676012', '', NULL, NULL, '', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-09 07:20:07', '2022-11-09 07:20:07', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(301, '', 'Ananya', '$2y$10$OutQAwonVK5Hv6mH9rTHNeQ5L9/4sIIMCiAyN3g0rIyngvJ1l6WYW', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '12344567801', '+234', NULL, 'public/backend/assets/profile/1743420736_ee7b45d7bb60e4e024cb.jpg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-09 09:57:25', '2022-11-09 09:57:25', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(302, '', 'test partner', '$2y$10$rtTbkOC9Wwp2dfPa8NEWN.E16UsSyZnrnybcE7kQ02jjZz2VaRwQ6', 'abc123@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '1597531462', '', NULL, '1667991674.jpeg', '', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-09 11:01:14', '2022-11-09 11:01:14', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(303, '', 'Himani', '$2y$10$pzyu3JDYCAdpiUuWOFy1Re/ueVhe4TocUmu1LtkyGX.f05yqNLwgq', 'XXXX@gmail.com', 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '12344567801', '+234', NULL, 'public/backend/assets/profile/1743425673_83dc22867fb32c384263.jpg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-09 11:06:38', '2022-11-09 11:06:38', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(304, '', 'Superadmin', '$2y$10$5246jCyamRaUWAi.uF5BveoTiOFDYfR5133P31pi/YdTj76AA3odK', 'infinitietechnologies06@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9510746255', '', NULL, '1667992090.jpg', '', NULL, NULL, 0, 'zdvs', '23.2740707', '69.6530334', '2022-11-09 11:08:10', '2022-11-09 11:08:10', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(305, '', 'admin@kasuwaniger.com', '$2y$10$D/v5UATXvfMRLhOxm7PekeKvDAPw2zWY2utec6aJMJmk858tZHl5W', 'infinitietechnologies06@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9510746255', '', NULL, '1667992175.jpg', '', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-09 11:09:35', '2022-11-09 11:09:35', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(306, '', 'Superadmin', '$2y$10$5.3VEQoLCHnvpzJiOhgOX.Cb1BXsfDYoyJMtw9uIFUAHxvzxu30V6', 'infinitietechnologies10@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9510746255', '', NULL, '1667992436.png', '', NULL, NULL, 0, 'mandvi', '23.2740707', '69.6530334', '2022-11-09 11:13:56', '2022-11-09 11:13:56', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(307, '', 'gyiy', '$2y$10$k4oX6Psvu5FTv08Xkf3gbe8dFIAULXnMUgEZ5Uvh4wj9z/2cNJhSS', 'infinitietechnologies06@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '', '', NULL, '1667992536.', '', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-09 11:15:36', '2022-11-09 11:15:36', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(308, '', 'gyiy', '$2y$10$srYxWrzgkGL1XrBg0BxAcOhVJzvlsgkfV8GTBaWxlFBqgVAK48MWG', 'infinitietechnologies06@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '', '', NULL, '1667992552.', '', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-09 11:15:52', '2022-11-09 11:15:52', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(309, '', 'testing', '', 'test@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '5050505050', '', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njc5OTQxOTEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njc5OTU5OTEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMzA5In0.DWfCj5mcQJ8HI9nqXMSY4AF9p-SceR6zsNWNnjH_tLk', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-09 11:42:44', '2022-11-09 11:42:44', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(310, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9865321470', '', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njc5OTUzMzIsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njc5OTcxMzIsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMzEwIn0.6UEBy6xd5DM6j0nridEBoQhIzrpgOw69BBh70MIuE3g', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-09 12:01:22', '2022-11-09 12:01:22', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(311, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9876543215', '', NULL, NULL, '', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-09 12:07:13', '2022-11-09 12:07:13', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(312, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9873216540', '', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njc5OTU4NDcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njc5OTc2NDcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMzEyIn0.PU1narV-AXGVY2qtw4n4WUnijX78eVpaq0hNIgpl834', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-09 12:08:40', '2022-11-09 12:08:40', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(313, '', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9873216544', '', ' ', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njc5OTYyMTcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njc5OTgwMTcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMzEzIn0.djifFq-tUrC4yHCQpTejJ_i4vOMJpdF_yc8wJncezP4', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-09 12:14:59', '2022-11-09 12:14:59', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(314, '', 'test', '', 'abcg@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9873216545', '', ' ', '/home/u349549739/domains/espeech.in/public_html/edemand/public/backend/assets/profiles/1667996843_e733f449eff72486f608.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDU3MjExMzEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3NzcyNTcxMzEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjM2OCJ9.4b06HDqdiZFFx_99DFXmRDob9KHrJGn4tW8LRQlj7Ug', '', '', 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-09 12:27:23', '2022-11-09 12:27:23', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(315, '', 'test', '', 'abcg@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9873216546', '', ' ', '1667997217_cfa72699cd96344c6339.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDU3MjExMzEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3NzcyNTcxMzEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjM2OCJ9.4b06HDqdiZFFx_99DFXmRDob9KHrJGn4tW8LRQlj7Ug', '', '', 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-09 12:31:33', '2022-11-09 12:31:33', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(316, '', 'testing', '', 'test@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9873216548', '', ' ', '1668053484_875070d5244ac276fd86.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NjgwODQ4MTUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2NjgwODY2MTUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMzE2In0.3tqNIh71myIW-nzSYbapQVWzbRGxKNDgEiViZaU5KCc', '', '', 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-09 12:59:29', '2022-11-09 12:59:29', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(317, '', 'Superadmin', '$2y$10$pw00HevO/q9/OI4cvQAWeOfawA7R5fAvtaA7DOB7iyYX7B3NmwSvC', 'abc123@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9510746255', '', NULL, '1668056888.', '', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-10 05:08:08', '2022-11-10 05:08:08', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(318, '', 'Superadmin', '$2y$10$5WA1Dj5wlv05PTSeiOcAZeLVNu.lbRwXoXZ.q9piWc/plir2XbI.6', 'abc123@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9510746255', '', NULL, '1668057935.png', '', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-10 05:25:35', '2022-11-10 05:25:35', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(319, '', 'Superadmin', '$2y$10$2gqjXXT1SgxX1CrNLe7LCeszAmWro3zimWcd8xOe.V1onNc4yeB.S', 'abc123456@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9537376389', '', NULL, '1668058320.jpeg', '', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-10 05:32:00', '2022-11-10 05:32:00', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(320, '', 'Superadmin', '$2y$10$0RL4hqu3jkGld1pMj8EjmOAQAzoXbtTlpVfulLeBkHc6QWpvJuqfm', 'abc123456@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9537376389', '', NULL, '1668058769.jpeg', '', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-10 05:39:29', '2022-11-10 05:39:29', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(321, '103.30.227.17', 'asgarluhar', '$2y$10$5TliLYkM2fmKoZMnxuLHjOh1AhJnPAoaySZzt3BhLF5HJAvZ5zOPq', 'asgarluhar@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1668406000, NULL, 1, NULL, NULL, 'blacksmith pvt ltd', '8866337244', '+91', 'eE3w9DQ1TXahZqs-iYOhc8:APA91bFJaNVWk06Oq1igsz6IIvUiU5isRNjvYzrSokCpEICQfuTcJ0W-tn520NUD-N054MQ2VJMRkXxa8skKgGa36zW7eHQJt6231StN6DCV7lWTZyPAMaQ53oJ5mMCVQnKBRae17qs0', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg1MDMxMzcsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njg1MDQ5MzcsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMzIxIn0.2mlkwxa-2YISozPmtNbmATU100G4wEljFw_yIy-HPHE', NULL, NULL, 0, '', '23.2740707', '69.6530334', '2022-11-14 06:06:40', '2022-11-14 06:06:40', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(322, '', 'test', '$2y$10$ZstYeyRS6Y3YchMgo3IZwelqMGQ9g6dvKQ4xnJsHqVX2HWCXTKmJ.', 'yihe230@hotmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9873216540', '', NULL, '1668406430.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDU3MjExMzEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3NzcyNTcxMzEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjM2OCJ9.4b06HDqdiZFFx_99DFXmRDob9KHrJGn4tW8LRQlj7Ug', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-14 06:13:50', '2022-11-14 06:13:50', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(323, '', 'luker', '$2y$10$Cull1Y4d1lmq8pu630g4uupeXd6NqqCMrjvpi6TFFIGhBAcXfk9AW', 'abc123@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9537376389', '', NULL, '1668426315.jpg', '', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-14 11:45:15', '2022-11-14 11:45:15', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(324, '', 'Superadmin', '$2y$10$Bv.lk86PY3EQAChxcz/naOAExthLWBcpv6wAvTLTvFeYmoRld.RtS', 'infinitietechnologies10@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9510746255', '', NULL, '1668426470.jpg', '', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-14 11:47:50', '2022-11-14 11:47:50', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(325, '', 'test', '$2y$10$AHxVtxdIXWGNZg9LlD6JSewLdsbP8NQ37HDE40i8De5R82dfGuYLq', 'infinitietechnologies06@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9537376389', '', NULL, '1668426627.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDU3MjExMzEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3NzcyNTcxMzEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjM2OCJ9.4b06HDqdiZFFx_99DFXmRDob9KHrJGn4tW8LRQlj7Ug', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-14 11:50:27', '2022-11-14 11:50:27', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(326, '', 'Superadmin', '$2y$10$H3BnVWDJd0Tz2c1JfpXCXeBy7rOVEplgJpQsmwdWwXNRpsDpFA9mK', 'infinitietechnologies06@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '9510746255', '', NULL, '1668486726.jpg', '', NULL, NULL, 0, 'bhuj', '23.2740707', '69.6530334', '2022-11-15 04:32:06', '2022-11-15 04:32:06', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(327, '', 'Asutosh', '$2y$10$EeeO/x1rkDrFFY8DntNf5uyCjJ9T7KwDd8IPcoJBwVN8mcm3M1UFi', 'XXXX@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1748955997, 1, NULL, NULL, NULL, '12344567801', '+91', NULL, 'public/backend/assets/profile/1750054956_f5ed50c0720f256a7bbe.png', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-15 06:06:30', '2022-11-15 06:06:30', 110, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL);
-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(45, 44, 2),
(51, 50, 3),
(64, 63, 3),
(65, 64, 3),
(66, 65, 2),
(67, 67, 2),
(68, 68, 2),
(69, 69, 2),
(71, 72, 2),
(72, 73, 2),
(78, 78, 1),
(88, 183, 3),
(90, 190, 3),
(94, 195, 3),
(96, 196, 3),
(98, 197, 3),
(100, 198, 3),
(102, 199, 3),
(104, 200, 3),
(106, 201, 3),
(108, 202, 3),
(110, 203, 3),
(114, 205, 3),
(116, 206, 3),
(118, 207, 3),
(120, 208, 3),
(122, 209, 3),
(124, 210, 3),
(126, 211, 3),
(128, 212, 3),
(130, 213, 3),
(132, 214, 3),
(134, 215, 3),
(136, 216, 3),
(138, 217, 3),
(140, 218, 3),
(142, 219, 3),
(144, 220, 3),
(146, 221, 3),
(148, 222, 3),
(150, 223, 3),
(152, 224, 3),
(154, 225, 3),
(156, 226, 3),
(158, 227, 3),
(160, 228, 3),
(162, 229, 3),
(164, 230, 3),
(166, 231, 3),
(168, 232, 3),
(170, 233, 3),
(172, 234, 3),
(174, 235, 3),
(176, 236, 3),
(178, 237, 3),
(180, 238, 3),
(182, 239, 3),
(184, 240, 3),
(186, 241, 3),
(188, 242, 3),
(190, 243, 3),
(192, 244, 3),
(194, 245, 3),
(196, 246, 3),
(198, 247, 3),
(200, 248, 3),
(202, 249, 3),
(204, 250, 3),
(206, 251, 3),
(208, 252, 3),
(210, 253, 3),
(212, 254, 3),
(214, 255, 3),
(216, 256, 3),
(218, 257, 3),
(220, 258, 3),
(222, 259, 3),
(223, 260, 3),
(227, 263, 3),
(239, 269, 3),
(241, 270, 3),
(244, 273, 3),
(245, 274, 3),
(246, 275, 3),
(247, 276, 3),
(248, 279, 3),
(249, 281, 3),
(250, 282, 3),
(251, 283, 3),
(253, 290, 2),
(254, 291, 2),
(255, 292, 2),
(256, 293, 3),
(257, 296, 2),
(258, 297, 3),
(259, 298, 3),
(260, 299, 2),
(262, 301, 3),
(263, 302, 3),
(264, 303, 3),
(265, 304, 3),
(266, 305, 3),
(267, 306, 3),
(268, 309, 2),
(269, 310, 2),
(270, 311, 2),
(271, 312, 2),
(272, 313, 2),
(273, 314, 2),
(274, 315, 2),
(275, 316, 2),
(276, 317, 3),
(277, 318, 3),
(278, 319, 3),
(279, 320, 3),
(280, 321, 3),
(281, 322, 3),
(282, 325, 3),
(283, 326, 3),
(284, 327, 3),
(285, 328, 2),
(286, 329, 2),
(289, 334, 2),
(290, 335, 2),
(291, 336, 2),
(292, 337, 2),
(293, 338, 2),
(294, 339, 2),
(295, 340, 2),
(296, 341, 2),
(297, 342, 2),
(298, 343, 2),
(299, 344, 2),
(300, 345, 2),
(301, 346, 2),
(302, 347, 2),
(303, 348, 2),
(304, 349, 2),
(305, 350, 2),
(307, 352, 2),
(308, 353, 2),
(309, 354, 2),
(310, 355, 2),
(311, 356, 2),
(314, 359, 2),
(316, 361, 2),
(320, 365, 3),
(323, 368, 2),
(324, 369, 2),
(325, 370, 2),
(326, 371, 2),
(327, 372, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users_tokens`
--

CREATE TABLE `users_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role` varchar(512) NOT NULL COMMENT '1. super admin\r\n2. admin\r\n3. client',
  `permissions` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `role`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 1, '1', NULL, '2022-07-19 07:32:07', '2022-08-05 09:58:16'),
(2, 37, '3', '{\"create\":{\"order\":0,\"category\":1,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":1,\"settings\":1},\"read\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":1,\"settings\":1},\"update\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"faq\":0,\"system\":1,\"support_ticket\":1,\"settings\":1},\"delete\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"notification\":0,\"system\":0}}', '2022-07-19 07:32:07', '2022-08-05 10:58:54'),
(10, 78, '2', '{\"create\":{\"order\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"read\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"update\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"faq\":0,\"system\":0,\"support_ticket\":0,\"settings\":0},\"delete\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"notification\":0,\"system\":0}}', '2022-07-20 10:37:18', '2022-08-05 12:21:44'),
(11, 141, '1', NULL, '2022-07-21 04:18:12', '2022-08-11 07:36:06'),
(12, 1, 'editor', '{\"create\":{\"order\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"read\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"update\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"faq\":0,\"system\":0,\"support_ticket\":0,\"settings\":0},\"delete\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"notification\":0,\"system\":0}}', '2022-10-20 11:22:19', '2022-10-20 11:22:19'),
(13, 1, 'admin', '{\"create\":{\"order\":0,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":\"\",\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"read\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"update\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"faq\":1,\"system\":1,\"support_ticket\":1,\"settings\":1},\"delete\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"notification\":1,\"system\":1}}', '2022-11-16 07:32:15', '2022-11-16 07:32:15'),
(14, 1, 'admin', '{\"create\":{\"order\":0,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":\"\",\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"read\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"update\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"faq\":1,\"system\":1,\"support_ticket\":1,\"settings\":1},\"delete\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"notification\":1,\"system\":1}}', '2022-11-16 07:36:04', '2022-11-16 07:36:04'),
(15, 555, '1', '', '2022-11-16 07:36:04', '2023-03-13 06:10:33'),
(16, 2454, '2', '{\"create\":{\"order\":0,\"categories\":0,\"subscription\":0,\"sliders\":1,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":0,\"customers\":0,\"send_notification\":0,\"faq\":0,\"settings\":1,\"system_user\":0},\"read\":{\"orders\":0,\"categories\":0,\"subscription\":0,\"sliders\":1,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customers\":1,\"send_notification\":0,\"faq\":0,\"settings\":1,\"system_user\":0},\"update\":{\"orders\":0,\"categories\":0,\"subscription\":0,\"sliders\":1,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customers\":1,\"faq\":0,\"system_update\":0,\"settings\":1,\"system_user\":0},\"delete\":{\"orders\":0,\"categories\":0,\"subscription\":0,\"sliders\":1,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customers\":\"\",\"faq\":0,\"send_notification\":0,\"system_user\":0}}', '2025-06-02 06:30:26', '2025-06-02 06:32:25'),
(17, 2476, '2', '{\"create\":{\"order\":0,\"categories\":1,\"subscription\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customers\":0,\"send_notification\":1,\"faq\":1,\"settings\":1,\"system_user\":1},\"read\":{\"orders\":1,\"categories\":1,\"subscription\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customers\":1,\"send_notification\":1,\"faq\":1,\"settings\":1,\"system_user\":1},\"update\":{\"orders\":1,\"categories\":1,\"subscription\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customers\":1,\"faq\":1,\"system_update\":1,\"settings\":1,\"system_user\":1},\"delete\":{\"orders\":1,\"categories\":1,\"subscription\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customers\":1,\"faq\":1,\"send_notification\":1,\"system_user\":1}}', '2025-06-10 06:25:43', '2025-06-10 06:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_reports`
--

CREATE TABLE `user_reports` (
  `id` int(11) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `reported_user_id` int(11) NOT NULL,
  `reason_id` int(11) NOT NULL,
  `additional_info` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `admin_contact_query`
--
ALTER TABLE `admin_contact_query`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_transfers`
--
ALTER TABLE `bank_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_add_ons`
--
ALTER TABLE `cart_add_ons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `cash_collection`
--
ALTER TABLE `cash_collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_codes`
--
ALTER TABLE `country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_job_provider`
--
ALTER TABLE `custom_job_provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_job_requests`
--
ALTER TABLE `custom_job_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delete_general_notification`
--
ALTER TABLE `delete_general_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `order_services`
--
ALTER TABLE `order_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`,`service_id`);

--
-- Indexes for table `partner_bids`
--
ALTER TABLE `partner_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_details`
--
ALTER TABLE `partner_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`partner_id`),
  ADD KEY `address_id` (`address_id`(768));

--
-- Indexes for table `partner_subscriptions`
--
ALTER TABLE `partner_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_timings`
--
ALTER TABLE `partner_timings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `payment_request`
--
ALTER TABLE `payment_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`partner_id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `queue_jobs`
--
ALTER TABLE `queue_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_priority_status_available_at` (`queue`,`priority`,`status`,`available_at`);

--
-- Indexes for table `queue_jobs_failed`
--
ALTER TABLE `queue_jobs_failed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue` (`queue`);

--
-- Indexes for table `reasons_for_report_and_block_chat`
--
ALTER TABLE `reasons_for_report_and_block_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`category_id`,`tax_id`),
  ADD KEY `tax_id` (`tax_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `tax_id_2` (`tax_id`);

--
-- Indexes for table `services_ratings`
--
ALTER TABLE `services_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`service_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_cashcollection_history`
--
ALTER TABLE `settlement_cashcollection_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_history`
--
ALTER TABLE `settlement_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_fcm_ids`
--
ALTER TABLE `users_fcm_ids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `users_tokens`
--
ALTER TABLE `users_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_reports`
--
ALTER TABLE `user_reports`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1383;

--
-- AUTO_INCREMENT for table `admin_contact_query`
--
ALTER TABLE `admin_contact_query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `bank_transfers`
--
ALTER TABLE `bank_transfers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1546;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15339;

--
-- AUTO_INCREMENT for table `cart_add_ons`
--
ALTER TABLE `cart_add_ons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_collection`
--
ALTER TABLE `cash_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2373;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `country_codes`
--
ALTER TABLE `country_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_job_provider`
--
ALTER TABLE `custom_job_provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2274;

--
-- AUTO_INCREMENT for table `custom_job_requests`
--
ALTER TABLE `custom_job_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=546;

--
-- AUTO_INCREMENT for table `delete_general_notification`
--
ALTER TABLE `delete_general_notification`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1087;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7376;

--
-- AUTO_INCREMENT for table `order_services`
--
ALTER TABLE `order_services`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8904;

--
-- AUTO_INCREMENT for table `partner_bids`
--
ALTER TABLE `partner_bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

--
-- AUTO_INCREMENT for table `partner_details`
--
ALTER TABLE `partner_details`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=537;

--
-- AUTO_INCREMENT for table `partner_subscriptions`
--
ALTER TABLE `partner_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT for table `partner_timings`
--
ALTER TABLE `partner_timings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3160;

--
-- AUTO_INCREMENT for table `payment_request`
--
ALTER TABLE `payment_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `queue_jobs`
--
ALTER TABLE `queue_jobs`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_jobs_failed`
--
ALTER TABLE `queue_jobs_failed`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reasons_for_report_and_block_chat`
--
ALTER TABLE `reasons_for_report_and_block_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `services_ratings`
--
ALTER TABLE `services_ratings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `settlement_cashcollection_history`
--
ALTER TABLE `settlement_cashcollection_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;

--
-- AUTO_INCREMENT for table `settlement_history`
--
ALTER TABLE `settlement_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3370;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2487;

--
-- AUTO_INCREMENT for table `users_fcm_ids`
--
ALTER TABLE `users_fcm_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2443;

--
-- AUTO_INCREMENT for table `users_tokens`
--
ALTER TABLE `users_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16850;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_reports`
--
ALTER TABLE `user_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
