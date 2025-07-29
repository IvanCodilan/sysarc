-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2025 at 04:42 PM
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
-- Database: `brgy_570_prtl`
--

-- --------------------------------------------------------

--
-- Table structure for table `authapp_barangayofficial`
--

CREATE TABLE `authapp_barangayofficial` (
  `id` int(11) NOT NULL,
  `position` varchar(50) NOT NULL,
  `committee` varchar(50) NOT NULL DEFAULT 'None',
  `order` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authapp_barangayofficial`
--

INSERT INTO `authapp_barangayofficial` (`id`, `position`, `committee`, `order`, `name`) VALUES
(1, 'Punong Barangay', 'None', 1, 'JAYSON L. BALDOVINO'),
(2, 'Kagawad', 'Appropriation', 2, 'JOCELYN F. DUTONG'),
(3, 'Kagawad', 'Clean & Beautification', 3, 'BRYAN MORRIS S. ABABAO'),
(4, 'Kagawad', 'Women, Children, & Elderly', 4, 'SIMONE JULIENNE T. SORIO'),
(5, 'Kagawad', 'Health & Sanitation', 5, 'FREDIE C. ARAMBULO '),
(6, 'Kagawad', 'Peace & Order', 6, 'ROSA MAIA L. LACAP'),
(7, 'Kagawad', 'Youth & Education', 7, 'MICKO T. GOMEZ'),
(8, 'Kagawad', 'Ways & Means', 8, 'MANOLITO G. GERADO'),
(9, 'Secretary', 'None', 9, 'KONRAD KENNEDY D. MARTINEZ'),
(10, 'Treasurer', 'None', 10, 'ROSE ANN R. SANTOS'),
(11, 'SK Chairman', 'None', 11, 'SERGS MATTHEW RAVALO');

-- --------------------------------------------------------

--
-- Table structure for table `authapp_certificatelog`
--

CREATE TABLE `authapp_certificatelog` (
  `id` bigint(20) NOT NULL,
  `certificate_type` varchar(100) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `resident_name` varchar(255) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `resident_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authapp_certificatelog`
--

INSERT INTO `authapp_certificatelog` (`id`, `certificate_type`, `purpose`, `created_at`, `resident_name`, `admin_id`, `resident_id`) VALUES
(11, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 11:23:10.074394', 'Jayson Rod Jalmasco', 1, 1),
(12, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 11:51:32.009888', 'Jayson Rod Jalmasco', 1, 1),
(13, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 11:52:02.856215', 'Jayson Rod Jalmasco', 1, 1),
(14, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 11:53:06.044717', 'Jayson Rod Jalmasco', 1, 1),
(15, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 11:53:18.620276', 'Jayson Rod Jalmasco', 1, 1),
(16, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 11:53:47.572749', 'Jayson Rod Jalmasco', 1, 1),
(17, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 11:57:37.357143', 'Jayson Rod Jalmasco', 1, 1),
(18, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:06:24.557614', 'Jayson Rod Jalmasco', 1, 1),
(19, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:08:07.225073', 'Jayson Rod Jalmasco', 1, 1),
(20, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:09:01.398799', 'Jayson Rod Jalmasco', 1, 1),
(21, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:09:43.584962', 'Jayson Rod Jalmasco', 1, 1),
(22, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:10:24.270182', 'Jayson Rod Jalmasco', 1, 1),
(23, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:14:12.876773', 'Jayson Rod Jalmasco', 1, 1),
(24, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:15:13.162170', 'Jayson Rod Jalmasco', 1, 1),
(25, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:29:57.867905', 'Jayson Rod Jalmasco', 1, 1),
(26, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:35:24.500847', 'Jayson Rod baldovino', 1, 2),
(27, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:36:00.467108', 'Jayson Rod baldovino', 1, 2),
(28, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:42:07.895913', 'Jayson Rod Jalmasco', 1, 1),
(29, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:42:36.678507', 'Jayson Rod Jalmasco', 1, 1),
(30, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:45:17.721977', 'Jayson Rod baldovino', 1, 2),
(31, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:46:13.883839', 'Jayson Rod Jalmasco', 1, 1),
(32, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:48:29.533683', 'Jayson Rod Jalmasco', 1, 1),
(33, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:48:55.443075', 'Jayson Rod baldovino', 1, 2),
(34, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:50:30.668289', 'Jayson Rod baldovino', 1, 2),
(35, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:50:41.685173', 'Jayson Rod Jalmasco', 1, 1),
(36, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:53:26.657633', 'Jayson Rod Jalmasco', 1, 1),
(37, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:53:37.365337', 'Jayson Rod Jalmasco', 1, 1),
(38, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:54:02.173008', 'Jayson Rod Jalmasco', 1, 1),
(39, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:54:13.804542', 'Jayson Rod Jalmasco', 1, 1),
(40, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:54:46.017589', 'Jayson Rod Jalmasco', 1, 1),
(41, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:55:08.622153', 'Jayson Rod Jalmasco', 1, 1),
(42, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:56:21.061723', 'Jayson Rod Jalmasco', 1, 1),
(43, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:56:34.793805', 'Jayson Rod Jalmasco', 1, 1),
(44, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:56:38.258692', 'Jayson Rod Jalmasco', 1, 1),
(45, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:59:32.569283', 'Jayson Rod Jalmasco', 1, 1),
(46, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:59:44.107111', 'Jayson Rod Jalmasco', 1, 1),
(47, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 12:59:58.675965', 'Jayson Rod Jalmasco', 1, 1),
(48, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:01:36.850093', 'Jayson Rod Jalmasco', 1, 1),
(49, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:01:45.697674', 'Jayson Rod Jalmasco', 1, 1),
(50, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:01:55.820839', 'Jayson Rod Jalmasco', 1, 1),
(51, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:05:03.890513', 'Jayson Rod Jalmasco', 1, 1),
(52, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:05:58.909646', 'Jayson Rod Jalmasco', 1, 1),
(53, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:06:21.208695', 'Jayson Rod baldovino', 1, 2),
(54, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:09:05.924394', 'Jayson Rod Jalmasco', 1, 1),
(55, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:20:35.604205', 'Jayson Rod Jalmasco', 1, 1),
(56, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:20:49.437540', 'Jayson Rod Jalmasco', 1, 1),
(57, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:21:35.359171', 'Jayson Rod Jalmasco', 1, 1),
(58, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:25:34.702624', 'Jayson Rod Jalmasco', 1, 1),
(59, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:25:47.160362', 'Jayson Rod Jalmasco', 1, 1),
(60, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:26:18.308021', 'Jayson Rod Jalmasco', 1, 1),
(61, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:27:52.679426', 'Jayson Rod Jalmasco', 1, 1),
(62, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:28:00.155880', 'Jayson Rod Jalmasco', 1, 1),
(63, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:28:28.744798', 'Jayson Rod Jalmasco', 1, 1),
(64, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:28:29.895919', 'Jayson Rod Jalmasco', 1, 1),
(65, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:28:42.994213', 'Jayson Rod Jalmasco', 1, 1),
(66, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:29:31.687250', 'Jayson Rod Jalmasco', 1, 1),
(67, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:29:37.047379', 'Jayson Rod Jalmasco', 1, 1),
(68, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:29:56.121843', 'Jayson Rod Jalmasco', 1, 1),
(69, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:29:59.989679', 'Jayson Rod Jalmasco', 1, 1),
(70, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:30:06.626432', 'Jayson Rod Jalmasco', 1, 1),
(71, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:30:22.430380', 'Jayson Rod Jalmasco', 1, 1),
(72, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:30:42.203195', 'Jayson Rod Jalmasco', 1, 1),
(73, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:32:34.921819', 'Jayson Rod Jalmasco', 1, 1),
(74, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:32:43.669656', 'Jayson Rod Jalmasco', 1, 1),
(75, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:33:48.089493', 'Jayson Rod Jalmasco', 1, 1),
(76, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:34:22.125377', 'Jayson Rod Jalmasco', 1, 1),
(77, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:35:51.953863', 'Jayson Rod Jalmasco', 1, 1),
(78, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:36:55.236704', 'Jayson Rod Jalmasco', 1, 1),
(79, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:37:12.471691', 'Jayson Rod Jalmasco', 1, 1),
(80, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:37:19.539377', 'Jayson Rod Jalmasco', 1, 1),
(81, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:37:27.760366', 'Jayson Rod Jalmasco', 1, 1),
(82, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:39:07.089551', 'Jayson Rod Jalmasco', 1, 1),
(83, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:39:20.073158', 'Jayson Rod Jalmasco', 1, 1),
(84, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:39:28.884946', 'Jayson Rod Jalmasco', 1, 1),
(85, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:39:36.650533', 'Jayson Rod Jalmasco', 1, 1),
(86, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:39:43.920969', 'Jayson Rod Jalmasco', 1, 1),
(87, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:39:50.887183', 'Jayson Rod Jalmasco', 1, 1),
(88, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:40:10.381452', 'Jayson Rod Jalmasco', 1, 1),
(89, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:40:23.013711', 'Jayson Rod Jalmasco', 1, 1),
(90, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:40:29.344406', 'Jayson Rod Jalmasco', 1, 1),
(91, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:40:38.086620', 'Jayson Rod Jalmasco', 1, 1),
(92, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:40:51.246923', 'Jayson Rod Jalmasco', 1, 1),
(93, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:41:09.466356', 'Jayson Rod Jalmasco', 1, 1),
(94, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:41:19.343062', 'Jayson Rod Jalmasco', 1, 1),
(95, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:41:25.047105', 'Jayson Rod Jalmasco', 1, 1),
(96, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:41:31.702532', 'Jayson Rod Jalmasco', 1, 1),
(97, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:41:40.825801', 'Jayson Rod Jalmasco', 1, 1),
(98, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:41:47.289286', 'Jayson Rod Jalmasco', 1, 1),
(99, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:41:59.384888', 'Jayson Rod Jalmasco', 1, 1),
(100, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:42:12.162674', 'Jayson Rod Jalmasco', 1, 1),
(101, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:42:21.677084', 'Jayson Rod Jalmasco', 1, 1),
(102, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:42:23.056852', 'Jayson Rod Jalmasco', 1, 1),
(103, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:42:23.659775', 'Jayson Rod Jalmasco', 1, 1),
(104, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:42:24.546200', 'Jayson Rod Jalmasco', 1, 1),
(105, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:42:36.490662', 'Jayson Rod Jalmasco', 1, 1),
(106, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:42:44.423633', 'Jayson Rod Jalmasco', 1, 1),
(107, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:43:37.905249', 'Jayson Rod Jalmasco', 1, 1),
(108, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:43:57.960054', 'Jayson Rod Jalmasco', 1, 1),
(109, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:44:05.503936', 'Jayson Rod Jalmasco', 1, 1),
(110, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:44:27.132306', 'Jayson Rod Jalmasco', 1, 1),
(111, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:45:05.211935', 'Jayson Rod Jalmasco', 1, 1),
(112, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:45:13.324962', 'Jayson Rod Jalmasco', 1, 1),
(113, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:45:23.294655', 'Jayson Rod Jalmasco', 1, 1),
(114, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:45:29.175160', 'Jayson Rod Jalmasco', 1, 1),
(115, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:45:38.061981', 'Jayson Rod Jalmasco', 1, 1),
(116, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:45:50.653623', 'Jayson Rod Jalmasco', 1, 1),
(117, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:46:04.045325', 'Jayson Rod Jalmasco', 1, 1),
(118, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:46:14.745212', 'Jayson Rod Jalmasco', 1, 1),
(119, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:46:15.366400', 'Jayson Rod Jalmasco', 1, 1),
(120, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:46:16.430548', 'Jayson Rod Jalmasco', 1, 1),
(121, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:46:24.668457', 'Jayson Rod Jalmasco', 1, 1),
(122, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:47:34.060320', 'Jayson Rod Jalmasco', 1, 1),
(123, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:47:45.089648', 'Jayson Rod Jalmasco', 1, 1),
(124, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:47:54.737340', 'Jayson Rod Jalmasco', 1, 1),
(125, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:48:15.537184', 'Jayson Rod Jalmasco', 1, 1),
(126, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:48:24.018576', 'Jayson Rod Jalmasco', 1, 1),
(127, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:48:33.807866', 'Jayson Rod Jalmasco', 1, 1),
(128, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:48:50.462331', 'Jayson Rod Jalmasco', 1, 1),
(129, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:49:00.135408', 'Jayson Rod Jalmasco', 1, 1),
(130, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:49:00.732322', 'Jayson Rod Jalmasco', 1, 1),
(131, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:49:17.685523', 'Jayson Rod Jalmasco', 1, 1),
(132, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:49:36.523868', 'Jayson Rod Jalmasco', 1, 1),
(133, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:49:47.067803', 'Jayson Rod Jalmasco', 1, 1),
(134, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:49:58.029384', 'Jayson Rod Jalmasco', 1, 1),
(135, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:50:07.701743', 'Jayson Rod Jalmasco', 1, 1),
(136, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:50:19.185683', 'Jayson Rod Jalmasco', 1, 1),
(137, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:50:34.247286', 'Jayson Rod Jalmasco', 1, 1),
(138, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:50:39.552254', 'Jayson Rod Jalmasco', 1, 1),
(139, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:51:12.605363', 'Jayson Rod Jalmasco', 1, 1),
(140, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:51:21.577168', 'Jayson Rod Jalmasco', 1, 1),
(141, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:51:31.570198', 'Jayson Rod Jalmasco', 1, 1),
(142, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:51:48.357558', 'Jayson Rod Jalmasco', 1, 1),
(143, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:51:49.185094', 'Jayson Rod Jalmasco', 1, 1),
(144, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:52:00.649246', 'Jayson Rod Jalmasco', 1, 1),
(145, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:52:12.355800', 'Jayson Rod Jalmasco', 1, 1),
(146, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:52:44.933903', 'Jayson Rod Jalmasco', 1, 1),
(147, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:52:53.457578', 'Jayson Rod Jalmasco', 1, 1),
(148, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:53:00.392822', 'Jayson Rod Jalmasco', 1, 1),
(149, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:53:09.325756', 'Jayson Rod Jalmasco', 1, 1),
(150, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:53:16.785908', 'Jayson Rod Jalmasco', 1, 1),
(151, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:53:31.022791', 'Jayson Rod Jalmasco', 1, 1),
(152, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:54:04.533669', 'Jayson Rod Jalmasco', 1, 1),
(153, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:54:13.491059', 'Jayson Rod Jalmasco', 1, 1),
(154, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:54:24.712610', 'Jayson Rod Jalmasco', 1, 1),
(155, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:54:52.533651', 'Jayson Rod Jalmasco', 1, 1),
(156, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:55:34.640353', 'Jayson Rod Jalmasco', 1, 1),
(157, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:56:03.120631', 'Jayson Rod Jalmasco', 1, 1),
(158, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:56:22.577630', 'Jayson Rod Jalmasco', 1, 1),
(159, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:56:30.999497', 'Jayson Rod Jalmasco', 1, 1),
(160, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:56:46.480824', 'Jayson Rod Jalmasco', 1, 1),
(161, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:57:00.087542', 'Jayson Rod Jalmasco', 1, 1),
(162, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:57:09.285126', 'Jayson Rod Jalmasco', 1, 1),
(163, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:57:26.704782', 'Jayson Rod Jalmasco', 1, 1),
(164, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:57:35.494595', 'Jayson Rod Jalmasco', 1, 1),
(165, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:58:01.522801', 'Jayson Rod Jalmasco', 1, 1),
(166, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:58:07.998625', 'Jayson Rod Jalmasco', 1, 1),
(167, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:58:14.853189', 'Jayson Rod Jalmasco', 1, 1),
(168, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:58:33.083951', 'Jayson Rod Jalmasco', 1, 1),
(169, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:58:40.066091', 'Jayson Rod Jalmasco', 1, 1),
(170, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:58:50.569417', 'Jayson Rod Jalmasco', 1, 1),
(171, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:58:57.198645', 'Jayson Rod Jalmasco', 1, 1),
(172, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:59:10.997621', 'Jayson Rod Jalmasco', 1, 1),
(173, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:59:26.364934', 'Jayson Rod Jalmasco', 1, 1),
(174, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:59:39.657588', 'Jayson Rod Jalmasco', 1, 1),
(175, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:59:45.251130', 'Jayson Rod Jalmasco', 1, 1),
(176, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 13:59:54.189410', 'Jayson Rod Jalmasco', 1, 1),
(177, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:00:18.321931', 'Jayson Rod Jalmasco', 1, 1),
(178, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:00:31.326474', 'Jayson Rod Jalmasco', 1, 1),
(179, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:00:47.452946', 'Jayson Rod Jalmasco', 1, 1),
(180, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:00:57.123475', 'Jayson Rod Jalmasco', 1, 1),
(181, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:01:06.610064', 'Jayson Rod Jalmasco', 1, 1),
(182, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:01:13.006576', 'Jayson Rod Jalmasco', 1, 1),
(183, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:01:24.263588', 'Jayson Rod Jalmasco', 1, 1),
(184, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:01:40.171913', 'Jayson Rod Jalmasco', 1, 1),
(185, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:02:05.058080', 'Jayson Rod Jalmasco', 1, 1),
(186, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:03:20.811466', 'Jayson Rod Jalmasco', 1, 1),
(187, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:15:26.192664', 'Jayson Rod Jalmasco', 1, 1),
(188, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:15:45.462902', 'Jayson Rod Jalmasco', 1, 1),
(189, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:15:55.431487', 'Jayson Rod Jalmasco', 1, 1),
(190, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:17:04.174077', 'Jayson Rod Jalmasco', 1, 1),
(191, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:17:13.405954', 'Jayson Rod Jalmasco', 1, 1),
(192, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:22:14.161254', 'Jayson Rod Jalmasco', 1, 1),
(193, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:25:28.987635', 'Jayson Rod Jalmasco', 1, 1),
(194, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-05-29 14:26:06.891650', 'Jayson Rod Jalmasco', 1, 1),
(195, 'Burial Assistance', 'OFFICIAL PURPOSES', '2025-05-29 14:26:21.565176', 'Jayson Rod Jalmasco', 1, 1),
(196, 'Solo Parent Renewal', 'SOLO PARENT/PWD SUPPORT', '2025-05-29 14:27:36.467774', 'Jayson Rod Jalmasco', 1, 1),
(197, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:29:19.177184', 'Jayson Rod Jalmasco', 1, 1),
(198, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-29 14:51:36.615560', 'Jayson Rod Jalmasco', 1, 1),
(199, 'Medical Assistance', 'MEDICAL ASSISTANCE', '2025-05-29 14:51:48.744795', 'Jayson Rod baldovino', 1, 2),
(200, 'Solo Parent Renewal', 'SOLO PARENT/PWD SUPPORT', '2025-05-29 14:52:03.979432', 'Jayson Rod Jalmasco', 1, 1),
(201, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-30 01:54:47.019080', 'Jayson Rod Jalmasco', 1, 1),
(202, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-05-30 01:55:16.436852', 'Jayson Rod Jalmasco', 1, 1),
(203, 'Good Moral', 'Good Moral Certificate', '2025-05-30 01:57:29.230142', 'Jayson Rod Jalmasco', 1, 1),
(204, 'Good Moral', 'Good Moral Certificate', '2025-05-30 01:58:09.443268', 'Jayson Rod Jalmasco', 1, 1),
(205, 'Good Moral', 'Good Moral Certificate', '2025-05-30 01:58:37.993468', 'Jayson Rod Jalmasco', 1, 1),
(206, 'Good Moral', 'Good Moral Certificate', '2025-05-30 01:59:12.104476', 'Jayson Rod Jalmasco', 1, 1),
(207, 'Good Moral', 'Good Moral Certificate', '2025-05-30 02:00:13.323428', 'Jayson Rod Jalmasco', 1, 1),
(208, 'Good Moral', 'Good Moral Certificate', '2025-05-30 02:00:30.410808', 'Jayson Rod Jalmasco', 1, 1),
(209, 'Good Moral', 'Good Moral Certificate', '2025-05-30 02:01:52.925032', 'Jayson Rod Jalmasco', 1, 1),
(210, 'Good Moral', 'Good Moral Certificate', '2025-05-30 02:01:58.925176', 'Jayson Rod Jalmasco', 1, 1),
(211, 'Good Moral', 'Good Moral Certificate', '2025-05-30 02:02:11.830668', 'Jayson Rod Jalmasco', 1, 1),
(212, 'Good Moral', 'Good Moral Certificate', '2025-05-30 02:02:47.069097', 'Jayson Rod Jalmasco', 1, 1),
(213, 'Good Moral', 'Good Moral Certificate', '2025-05-30 02:03:15.205486', 'Jayson Rod Jalmasco', 1, 1),
(214, 'Good Moral', 'Good Moral Certificate', '2025-05-30 02:04:35.169107', 'Jayson Rod Jalmasco', 1, 1),
(215, 'Good Moral', 'Good Moral Certificate', '2025-05-30 02:05:17.055348', 'Jayson Rod Jalmasco', 1, 1),
(216, 'Burial Assistance', 'OFFICIAL PURPOSES', '2025-05-30 02:33:28.828718', 'Jayson Rod baldovino', 1, 2),
(217, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-25 11:15:48.397960', 'Jayson Rod baldovino', 1, 2),
(218, 'Good Moral', 'Good Moral Certificate', '2025-06-25 11:16:27.931815', 'Jayson Rod Jalmasco', 1, 1),
(219, 'Good Moral', 'Good Moral Certificate', '2025-06-25 12:05:54.618918', 'Jayson Rod baldovino', 1, 2),
(220, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-25 12:06:08.927495', 'Jayson Rod Jalmasco', 1, 1),
(221, 'Good Moral', 'Good Moral Certificate', '2025-06-25 12:15:41.472085', 'Jayson Rod baldovino', 1, 2),
(222, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-25 12:15:52.345185', 'Jayson Rod baldovino', 1, 2),
(223, 'Good Moral', 'Good Moral Certificate', '2025-06-25 14:14:09.954734', 'Jayson Rod baldovino', 1, 2),
(224, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-25 14:14:18.042341', 'Jayson Rod baldovino', 1, 2),
(225, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 09:22:50.155876', 'Jayson Rod baldovino', 1, 2),
(226, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 09:42:35.463492', 'Jayson Rod baldovino', 1, 2),
(227, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 09:50:37.432095', 'Jayson Rod baldovino', 1, 2),
(228, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 09:54:15.377209', 'Jayson Rod baldovino', 1, 2),
(229, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 09:54:28.163508', 'Jayson Rod baldovino', 1, 2),
(230, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 09:57:20.639363', 'Jayson Rod baldovino', 1, 2),
(231, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 09:57:40.695622', 'Jayson Rod baldovino', 1, 2),
(232, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 09:58:39.265077', 'Jayson Rod baldovino', 1, 2),
(233, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 10:00:43.255142', 'Jayson Rod baldovino', 1, 2),
(234, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 10:04:43.428057', 'Jayson Rod baldovino', 1, 2),
(235, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 10:04:44.050748', 'Jayson Rod baldovino', 1, 2),
(236, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 10:04:45.285390', 'Jayson Rod baldovino', 1, 2),
(237, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 10:06:32.532988', 'Jayson Rod baldovino', 1, 2),
(238, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 10:07:06.168106', 'Jayson Rod baldovino', 1, 2),
(239, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 10:07:07.450034', 'Jayson Rod baldovino', 1, 2),
(240, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 10:07:15.402188', 'Jayson Rod baldovino', 1, 2),
(241, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 10:07:29.589830', 'Jayson Rod baldovino', 1, 2),
(242, 'Proof Of Residency', 'PROOF OF RESIDENCY', '2025-06-26 10:09:13.869081', 'Jayson Rod baldovino', 1, 2),
(243, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:09:36.399350', 'Jayson Rod baldovino', 1, 2),
(244, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:11:07.318154', 'Jayson Rod baldovino', 1, 2),
(245, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:11:36.954086', 'Jayson Rod baldovino', 1, 2),
(246, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:12:05.267489', 'Jayson Rod baldovino', 1, 2),
(247, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:12:40.040081', 'Jayson Rod Jalmasco', 1, 1),
(248, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:12:54.439086', 'Jayson Rod Jalmasco', 1, 1),
(249, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:13:47.397638', 'Jayson Rod baldovino', 1, 2),
(250, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:16:31.833991', 'Jayson Rod baldovino', 1, 2),
(251, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:17:30.437834', 'Jayson Rod Jalmasco', 1, 1),
(252, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:17:49.504524', 'Jayson Rod Jalmasco', 1, 1),
(253, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:18:12.649739', 'Jayson Rod baldovino', 1, 2),
(254, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:18:26.911005', 'Jayson Rod Jalmasco', 1, 1),
(255, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:18:35.076281', 'Jayson Rod Jalmasco', 1, 1),
(256, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:19:02.440032', 'Jayson Rod Jalmasco', 1, 1),
(257, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:19:14.648181', 'Jayson Rod Jalmasco', 1, 1),
(258, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:19:15.546795', 'Jayson Rod Jalmasco', 1, 1),
(259, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:19:20.724445', 'Jayson Rod baldovino', 1, 2),
(260, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:19:30.407597', 'Jayson Rod baldovino', 1, 2),
(261, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:19:36.034436', 'Jayson Rod baldovino', 1, 2),
(262, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 10:20:00.967954', 'Jayson Rod baldovino', 1, 2),
(263, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:17:07.663845', 'Jayson Rod baldovino', 1, 2),
(264, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:17:24.809983', 'Jayson Rod baldovino', 1, 2),
(265, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:21:28.086338', 'Jayson Rod baldovino', 1, 2),
(266, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:21:55.547067', 'Jayson Rod baldovino', 1, 2),
(267, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:22:12.035460', 'Jayson Rod baldovino', 1, 2),
(268, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:22:18.316015', 'Jayson Rod baldovino', 1, 2),
(269, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:22:25.068972', 'Jayson Rod baldovino', 1, 2),
(270, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:22:32.280508', 'Jayson Rod baldovino', 1, 2),
(271, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:22:48.614887', 'Jayson Rod baldovino', 1, 2),
(272, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:22:58.083618', 'Jayson Rod baldovino', 1, 2),
(273, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:23:12.447271', 'Jayson Rod baldovino', 1, 2),
(274, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:23:18.308001', 'Jayson Rod baldovino', 1, 2),
(275, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:23:25.503660', 'Jayson Rod baldovino', 1, 2),
(276, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:24:03.778226', 'Jayson Rod baldovino', 1, 2),
(277, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:24:19.630367', 'Jayson Rod baldovino', 1, 2),
(278, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:24:34.514758', 'Jayson Rod baldovino', 1, 2),
(279, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:24:41.658626', 'Jayson Rod baldovino', 1, 2),
(280, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:24:47.379866', 'Jayson Rod baldovino', 1, 2),
(281, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:24:53.940445', 'Jayson Rod baldovino', 1, 2),
(282, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:25:00.910030', 'Jayson Rod baldovino', 1, 2),
(283, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:25:11.665908', 'Jayson Rod baldovino', 1, 2),
(284, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:25:33.326611', 'Jayson Rod baldovino', 1, 2),
(285, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:26:15.948279', 'Jayson Rod baldovino', 1, 2),
(286, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:26:50.864080', 'Jayson Rod baldovino', 1, 2),
(287, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:27:07.358057', 'Jayson Rod baldovino', 1, 2),
(288, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:27:14.412003', 'Jayson Rod baldovino', 1, 2),
(289, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:27:20.611635', 'Jayson Rod baldovino', 1, 2),
(290, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:27:29.424055', 'Jayson Rod baldovino', 1, 2),
(291, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:27:39.487591', 'Jayson Rod baldovino', 1, 2),
(292, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:27:44.714696', 'Jayson Rod baldovino', 1, 2),
(293, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:28:35.573575', 'Jayson Rod baldovino', 1, 2),
(294, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:28:42.707015', 'Jayson Rod baldovino', 1, 2),
(295, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:28:59.967627', 'Jayson Rod baldovino', 1, 2),
(296, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:29:34.364099', 'Jayson Rod baldovino', 1, 2),
(297, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:30:08.626665', 'Jayson Rod baldovino', 1, 2),
(298, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:31:24.368691', 'Jayson Rod baldovino', 1, 2),
(299, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:41:48.875402', 'Jayson Rod baldovino', 1, 2),
(300, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:42:23.506538', 'Jayson Rod baldovino', 1, 2),
(301, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:42:44.962089', 'Jayson Rod baldovino', 1, 2),
(302, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:43:17.385988', 'Jayson Rod baldovino', 1, 2),
(303, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:43:26.272344', 'Jayson Rod baldovino', 1, 2),
(304, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:43:37.757664', 'Jayson Rod baldovino', 1, 2),
(305, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:43:45.563863', 'Jayson Rod baldovino', 1, 2),
(306, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:43:51.063614', 'Jayson Rod baldovino', 1, 2),
(307, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:43:56.945044', 'Jayson Rod baldovino', 1, 2),
(308, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:44:03.080195', 'Jayson Rod baldovino', 1, 2),
(309, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:44:27.024538', 'Jayson Rod baldovino', 1, 2),
(310, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:44:42.402776', 'Jayson Rod baldovino', 1, 2),
(311, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:44:51.628526', 'Jayson Rod baldovino', 1, 2),
(312, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:45:14.414823', 'Jayson Rod baldovino', 1, 2),
(313, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:45:21.073975', 'Jayson Rod baldovino', 1, 2),
(314, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:45:27.694519', 'Jayson Rod baldovino', 1, 2),
(315, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:45:34.741945', 'Jayson Rod baldovino', 1, 2),
(316, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:46:02.019541', 'Jayson Rod baldovino', 1, 2),
(317, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:46:08.704643', 'Jayson Rod baldovino', 1, 2),
(318, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:46:17.145481', 'Jayson Rod baldovino', 1, 2),
(319, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:46:22.865844', 'Jayson Rod baldovino', 1, 2),
(320, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:46:48.886067', 'Jayson Rod baldovino', 1, 2),
(321, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:46:55.159080', 'Jayson Rod baldovino', 1, 2),
(322, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:47:11.173299', 'Jayson Rod baldovino', 1, 2),
(323, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:47:49.569475', 'Jayson Rod baldovino', 1, 2),
(324, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:47:56.390804', 'Jayson Rod baldovino', 1, 2),
(325, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:48:02.934103', 'Jayson Rod baldovino', 1, 2),
(326, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:51:34.515486', 'Jayson Rod baldovino', 1, 2),
(327, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:54:18.402568', 'Jayson Rod baldovino', 1, 2),
(328, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:55:46.063724', 'Jayson Rod baldovino', 1, 2),
(329, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:56:01.511491', 'Jayson Rod baldovino', 1, 2),
(330, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:57:45.035159', 'Jayson Rod baldovino', 1, 2),
(331, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:58:00.812286', 'Jayson Rod baldovino', 1, 2),
(332, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:58:09.948140', 'Jayson Rod baldovino', 1, 2),
(333, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:58:19.513219', 'Jayson Rod baldovino', 1, 2),
(334, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 12:58:24.297500', 'Jayson Rod baldovino', 1, 2),
(335, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:16:35.098422', 'Jayson Rod baldovino', 1, 2),
(336, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:17:31.415695', 'Jayson Rod baldovino', 1, 2),
(337, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:17:54.183661', 'Jayson Rod baldovino', 1, 2),
(338, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:18:02.626420', 'Jayson Rod baldovino', 1, 2),
(339, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:18:10.792607', 'Jayson Rod baldovino', 1, 2),
(340, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:18:19.433011', 'Jayson Rod baldovino', 1, 2),
(341, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:18:51.535463', 'Jayson Rod baldovino', 1, 2),
(342, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:19:23.355618', 'Jayson Rod baldovino', 1, 2),
(343, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:19:35.642508', 'Jayson Rod baldovino', 1, 2),
(344, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:19:48.741642', 'Jayson Rod baldovino', 1, 2),
(345, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:19:57.564295', 'Jayson Rod baldovino', 1, 2),
(346, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:20:15.733856', 'Jayson Rod baldovino', 1, 2),
(347, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:20:18.172715', 'Jayson Rod baldovino', 1, 2),
(348, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:20:34.449745', 'Jayson Rod baldovino', 1, 2),
(349, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:20:57.216156', 'Jayson Rod baldovino', 1, 2),
(350, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:21:46.344035', 'Jayson Rod baldovino', 1, 2),
(351, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:22:13.794515', 'Jayson Rod baldovino', 1, 2),
(352, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:22:28.576661', 'Jayson Rod baldovino', 1, 2),
(353, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:23:02.761475', 'Jayson Rod baldovino', 1, 2),
(354, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:23:26.749506', 'Jayson Rod baldovino', 1, 2),
(355, 'Financial Assistance', 'FINANCIAL ASSISTANCE', '2025-06-26 13:23:53.115646', 'Jayson Rod baldovino', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `authapp_personinformation`
--

CREATE TABLE `authapp_personinformation` (
  `id` bigint(20) NOT NULL,
  `region` varchar(100) DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `street_number` varchar(20) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `civil_status` varchar(9) NOT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `relationship_to_household_head` varchar(100) DEFAULT NULL,
  `educational_background` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authapp_personinformation`
--

INSERT INTO `authapp_personinformation` (`id`, `region`, `barangay`, `last_name`, `first_name`, `middle_name`, `street_number`, `street`, `city`, `province`, `date_of_birth`, `place_of_birth`, `gender`, `civil_status`, `occupation`, `citizenship`, `relationship_to_household_head`, `educational_background`) VALUES
(1, 'NCR', 'BF Homes', 'Jalmasco', 'Jayson', 'Rod', '033', 'Lanzones St', 'Paranaque', 'Cavite', '2025-05-29', 'Cavite Silang', 'Male', 'Single', 'none', 'Filipino', 'Mother', 'College Graduate'),
(2, 'NCR', 'BF Homes', 'baldovino', 'Jayson', 'Rod', '033', 'Lanzones St', 'Paranaque', 'Cavite', '2025-05-29', 'Cavite Silang', 'Other', 'Married', 'none', 'Filipino', 'Mother', 'Elementary Graduate');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add person information', 7, 'add_personinformation'),
(26, 'Can change person information', 7, 'change_personinformation'),
(27, 'Can delete person information', 7, 'delete_personinformation'),
(28, 'Can view person information', 7, 'view_personinformation'),
(29, 'Can add Certificate Log', 8, 'add_certificatelog'),
(30, 'Can change Certificate Log', 8, 'change_certificatelog'),
(31, 'Can delete Certificate Log', 8, 'delete_certificatelog'),
(32, 'Can view Certificate Log', 8, 'view_certificatelog'),
(33, 'Can add barangay official', 9, 'add_barangayofficial'),
(34, 'Can change barangay official', 9, 'change_barangayofficial'),
(35, 'Can delete barangay official', 9, 'delete_barangayofficial'),
(36, 'Can view barangay official', 9, 'view_barangayofficial');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$led2Q25hZo9MaKKG8u8tJD$yd2cWXDoL3Wpz4nmIZ6NlYkIdh0FeW+EsAaaUkEVgcA=', '2025-07-29 12:05:32.433998', 1, 'cdln', '', '', 'cdln@gmail.com', 1, 1, '2025-03-25 10:34:10.162063');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(9, 'authapp', 'barangayofficial'),
(8, 'authapp', 'certificatelog'),
(7, 'authapp', 'personinformation'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-03-25 10:33:37.133233'),
(2, 'auth', '0001_initial', '2025-03-25 10:33:37.891358'),
(3, 'admin', '0001_initial', '2025-03-25 10:33:38.061476'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-03-25 10:33:38.076523'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-03-25 10:33:38.093293'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-03-25 10:33:38.189190'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-03-25 10:33:38.336174'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-03-25 10:33:38.363710'),
(9, 'auth', '0004_alter_user_username_opts', '2025-03-25 10:33:38.379195'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-03-25 10:33:38.442022'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-03-25 10:33:38.448014'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-03-25 10:33:38.465485'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-03-25 10:33:38.488303'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-03-25 10:33:38.511302'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-03-25 10:33:38.535559'),
(16, 'auth', '0011_update_proxy_permissions', '2025-03-25 10:33:38.556094'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-03-25 10:33:38.577563'),
(18, 'sessions', '0001_initial', '2025-03-25 10:33:38.616881'),
(19, 'authapp', '0001_initial', '2025-05-29 09:03:24.742052'),
(20, 'authapp', '0002_alter_activitylog_table', '2025-05-29 09:03:24.749485'),
(21, 'authapp', '0003_logentry_delete_activitylog', '2025-05-29 09:03:24.795123'),
(22, 'authapp', '0004_certificatelog', '2025-05-29 09:03:24.863976'),
(23, 'authapp', '0005_delete_logentry', '2025-05-29 09:03:24.870330'),
(24, 'authapp', '0006_logentry', '2025-05-29 09:03:24.906017'),
(25, 'authapp', '0007_delete_logentry', '2025-05-29 09:03:24.912911'),
(26, 'authapp', '0008_barangayofficial', '2025-05-29 09:32:17.147080'),
(27, 'authapp', '0009_alter_barangayofficial_committee_and_more', '2025-06-25 12:24:17.961789');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1zbp04yqvo85ji8dbwjdepqmzqn5bn5d', '.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1txgmO:pW2W0jKLDfXniMHIoDqHDVyqKor93C8S7ImiTRoT8J4', '2025-04-10 06:31:52.489552'),
('32n1nvk3u1zc6brry6cu4rg6zfj308yb', '.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1txgyy:igkOkb6ZPwOtcMu8knd9Y6XI1SCaqiJpcLw-SYvRKPs', '2025-04-10 06:44:52.768317'),
('66x8x6u4mxxcwmtk0phrel3h0wqnscf1', '.eJxVjDsOwyAQBe9CHSFYYxZSpvcZ0PILTiKQjF1FuXtsyUXSvpl5b-ZoW4vbelrcHNmVSXb53TyFZ6oHiA-q98ZDq-sye34o_KSdTy2m1-10_w4K9bLX2VBGlFFGbQHRaBvIgwoWshDCewBj0Q56hIRAQRHtrhkjpSEYVMQ-X9dFN6g:1uUinq:16HtKQjYdOLai83mEBYTFtkG0xHmgQPvrn0g4EckOiM', '2025-07-10 09:21:54.756449'),
('c5z5rndyhd86m1kw5wfrfl50gw7k5a31', '.eJxVjDsOwyAQBe9CHSFYYxZSpvcZ0PILTiKQjF1FuXtsyUXSvpl5b-ZoW4vbelrcHNmVSXb53TyFZ6oHiA-q98ZDq-sye34o_KSdTy2m1-10_w4K9bLX2VBGlFFGbQHRaBvIgwoWshDCewBj0Q56hIRAQRHtrhkjpSEYVMQ-X9dFN6g:1ugj5I:Gg68LhCcZHuH1X2-m4HgjDUSGCUTHOnSoTC3Qye1aao', '2025-08-12 12:05:32.435998'),
('h34t2e6f77zgp9e6q0zmc10p4l8nebli', '.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1txhTd:F3pUqd2LMwvazx7lxXqPfa1fa_UZqoSvbCOvPuEgC8w', '2025-04-10 07:16:33.676503'),
('laynhds0fryukyp6jtt5owimz0psw9qi', '.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1tx360:Knd57sLWTWYVyxP-W2jTwhLXsuquLdBrM6izvElasms', '2025-04-08 12:09:28.895244'),
('obfhbwq5pw8iecinttv719r71pnmbc1q', '.eJxVjDsOwyAQBe9CHSFYYxZSpvcZ0PILTiKQjF1FuXtsyUXSvpl5b-ZoW4vbelrcHNmVSXb53TyFZ6oHiA-q98ZDq-sye34o_KSdTy2m1-10_w4K9bLX2VBGlFFGbQHRaBvIgwoWshDCewBj0Q56hIRAQRHtrhkjpSEYVMQ-X9dFN6g:1uULyr:1IodpAQpUmmbvebBpl_blpBkoprJkZkl8-LhvzMnKbc', '2025-07-09 08:59:45.686461'),
('r9l09poqsmpwn5crs8g69ygt0kho07mp', 'e30:1tx1jT:-zqz04TwuW1F_NFCt2h9e76AywI38Twq5NZCOIfV3tQ', '2025-04-08 10:42:07.176100'),
('sxkkd2dylwtv4do7743rw9zl3jnhej7y', '.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1txh82:31nx0QPcPUvMKH77AY8uDj7enNgbPZsfjkdQxn7a2p8', '2025-04-10 06:54:14.430825'),
('vd2di8t8hgyxh6ke0znc5ss1jfbox74o', '.eJxVjDsOwyAQBe9CHSFYYxZSpvcZ0PILTiKQjF1FuXtsyUXSvpl5b-ZoW4vbelrcHNmVSXb53TyFZ6oHiA-q98ZDq-sye34o_KSdTy2m1-10_w4K9bLX2VBGlFFGbQHRaBvIgwoWshDCewBj0Q56hIRAQRHtrhkjpSEYVMQ-X9dFN6g:1uKZB3:01F-QsxJ1YhR3HYDRu9wo4Xr2GyHR8-dxNVv-cZrWjc', '2025-06-12 09:03:53.254197'),
('whuoz7fhh4erxnhlgk3r1pmpwibp3e1y', '.eJxVjMsOwiAQRf-FtSHQQR4u3fcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLO4CC1Ov1tEeqS6A75jvTVJra7LHOWuyIN2OTZOz-vh_h0U7GWvI0P0eWANDlTgQIM1BInO2SMEcBQNsPPZKKWTV_bLEYOxkaxB48T7A-09N9M:1txgE5:hFrbuQaPnaXzZNJwF4uWFHToeZx1wcMZZWUWtQk1-sc', '2025-04-10 05:56:25.929019');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authapp_barangayofficial`
--
ALTER TABLE `authapp_barangayofficial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authapp_certificatelog`
--
ALTER TABLE `authapp_certificatelog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authapp_certificatelog_admin_id_efca4934_fk_auth_user_id` (`admin_id`),
  ADD KEY `authapp_certificatel_resident_id_0d55f648_fk_authapp_p` (`resident_id`);

--
-- Indexes for table `authapp_personinformation`
--
ALTER TABLE `authapp_personinformation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authapp_barangayofficial`
--
ALTER TABLE `authapp_barangayofficial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `authapp_certificatelog`
--
ALTER TABLE `authapp_certificatelog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;

--
-- AUTO_INCREMENT for table `authapp_personinformation`
--
ALTER TABLE `authapp_personinformation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authapp_certificatelog`
--
ALTER TABLE `authapp_certificatelog`
  ADD CONSTRAINT `authapp_certificatel_resident_id_0d55f648_fk_authapp_p` FOREIGN KEY (`resident_id`) REFERENCES `authapp_personinformation` (`id`),
  ADD CONSTRAINT `authapp_certificatelog_admin_id_efca4934_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
