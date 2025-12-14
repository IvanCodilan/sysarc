-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2025 at 05:02 AM
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
-- Table structure for table `authapp_archivedresident`
--

CREATE TABLE `authapp_archivedresident` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civil_status` varchar(50) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `relationship_to_household_head` varchar(50) DEFAULT NULL,
  `educational_background` varchar(100) DEFAULT NULL,
  `street_number` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `pwd_status` varchar(50) DEFAULT NULL,
  `voter_status` varchar(50) DEFAULT NULL,
  `resident_status` varchar(50) NOT NULL,
  `date_archived` datetime(6) NOT NULL,
  `archived_reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authapp_archivedresident`
--

INSERT INTO `authapp_archivedresident` (`id`, `first_name`, `middle_name`, `last_name`, `date_of_birth`, `place_of_birth`, `gender`, `civil_status`, `occupation`, `citizenship`, `relationship_to_household_head`, `educational_background`, `street_number`, `street`, `barangay`, `city`, `province`, `region`, `pwd_status`, `voter_status`, `resident_status`, `date_archived`, `archived_reason`) VALUES
(2, 'John', 'Diaz', 'Dale', '2002-02-02', 'Cavite Silang', 'Male', 'Single', 'None', 'Filipino', 'Mother', 'High School Graduate', '033', 'Lanzones St', 'Bf Homes', 'Paranaque', 'Manila', 'Ncr', 'No', 'Voter', 'Inactive', '2025-12-14 03:57:38.685536', 'Status changed to Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `authapp_barangayofficial`
--

CREATE TABLE `authapp_barangayofficial` (
  `id` bigint(20) NOT NULL,
  `position` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `committee` varchar(50) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authapp_barangayofficial`
--

INSERT INTO `authapp_barangayofficial` (`id`, `position`, `name`, `committee`, `order`) VALUES
(1, 'Punong Barangay', '', 'None', 1),
(2, 'Kagawad', '', 'Appropriation', 2),
(3, 'Kagawad', '', 'Peace & Order', 3),
(4, 'Kagawad', '', 'Health & Sanitation', 4),
(5, 'Kagawad', '', 'Youth & Education', 5),
(6, 'Kagawad', '', 'Clean & Beautification', 6),
(7, 'Kagawad', '', 'Women, Children, & Elderly', 7),
(8, 'Kagawad', '', 'Ways & Means', 8),
(9, 'SK Chairman', '', 'None', 9),
(10, 'Secretary', '', 'None', 10),
(11, 'Treasurer', '', 'None', 11);

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
  `certificate_number` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `resident_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authapp_certificatelog`
--

INSERT INTO `authapp_certificatelog` (`id`, `certificate_type`, `purpose`, `created_at`, `resident_name`, `certificate_number`, `user_id`, `resident_id`) VALUES
(1, 'Good Moral', 'Good Moral Certificate', '2025-12-14 03:36:12.454906', 'Justine Rod Jalmasco', 'BRGY570-2025-000001', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authapp_passwordresettoken`
--

CREATE TABLE `authapp_passwordresettoken` (
  `id` bigint(20) NOT NULL,
  `token` varchar(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authapp_personinformation`
--

CREATE TABLE `authapp_personinformation` (
  `id` bigint(20) NOT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `pwd_status` varchar(3) NOT NULL,
  `voter_status` varchar(10) NOT NULL,
  `resident_status` varchar(20) NOT NULL,
  `region` longtext DEFAULT NULL,
  `street_number` longtext DEFAULT NULL,
  `street` longtext DEFAULT NULL,
  `city` longtext DEFAULT NULL,
  `province` longtext DEFAULT NULL,
  `place_of_birth` longtext DEFAULT NULL,
  `civil_status` longtext DEFAULT NULL,
  `occupation` longtext DEFAULT NULL,
  `citizenship` longtext DEFAULT NULL,
  `relationship_to_household_head` longtext DEFAULT NULL,
  `educational_background` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authapp_personinformation`
--

INSERT INTO `authapp_personinformation` (`id`, `barangay`, `last_name`, `first_name`, `middle_name`, `date_of_birth`, `gender`, `pwd_status`, `voter_status`, `resident_status`, `region`, `street_number`, `street`, `city`, `province`, `place_of_birth`, `civil_status`, `occupation`, `citizenship`, `relationship_to_household_head`, `educational_background`, `user_id`) VALUES
(4, 'Bf Homes', 'Jalmasco', 'Justine', 'Rod', '2003-12-20', 'Male', 'PWD', 'Non-Voter', 'Active', 'gAAAAABpPjXV_swEUmF7212G157C85jNzAEAXbXmEpnzOBPqp4WYQ4EXoTsI-sycsHXdk5TqvixhWjAQySRKb3E-NjaSscg10w==', 'gAAAAABpPjXV3U49Nr4j1YMWzuA_bAIgp06fBni1j-sWcm21dDvddfqXuRPYUy-LTxBueWpxnYVySuyQ1vz_nCYe7SaW7aArag==', 'gAAAAABpPjXVvWu6bjh1y9cfe-LJ_oEwfBgAdgTrjP7Lc-64OguCsbRnB-MOhJnvp3fzP9ImaXd61WROJ0CV2ovlj4M1d1gAPA==', 'gAAAAABpPjXVSBiHcV7nRKB4RYeHW7tBaxPkSvAPUCtw86rAZFtINqkWhQolG10snJxvvbWH_kW5XdccbKo2xs0OsUk9ZWWQ7g==', 'gAAAAABpPjXVwv3Bubcqcn2KRR1dWKPYBaJuW5h78COf-sSwLaNdhq-43Ae7ZO63UKS3SBdz4vBoBw-vFFJ4HqKCcWVr38FqoQ==', 'gAAAAABpPjXVuQPRMS8TXZmRbJrN1LyPxeD7NzWO7Zh5Dt59XEXrUB48EnjJmXnw6fb7aaxEIM5_ZAbglYRe6m-lN045ozXFGg==', 'gAAAAABpPjXVl6hIewhS1Rir0OZmd3R9Om3cSelonfoTqSZ0z2nLUwny6lvXi4Ey-75PaSPucVHXgkp4GjzdTZRt6AGJNR8W6g==', 'gAAAAABpPjXVV7f0ODqf-JZXTnDYpjrlN4KTA3FvjxUMF5gOPxeK3sV2weJ5hMtK65r8NSbSVvLgUc_kWjF3INqj7P8qqHu_wA==', 'gAAAAABpPjXVGrWZ60il5NUkz0IExVobPzuv7lIS2cRWFEzeoboeoIi9y5VPvLiw79XD3mhcHkPuFmTxSh0CRONSi-PTsymMKw==', 'gAAAAABpPjXVubS_8qtL4wDTlUYpQ3LRA-ivu3ZQkM6JsB-N2XONDN6FS0TpMdhdwsHloNe63BBooUxvgeC85vTsLzMbgJeV5w==', 'College Graduate', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authapp_rolepermission`
--

CREATE TABLE `authapp_rolepermission` (
  `id` bigint(20) NOT NULL,
  `can_add_resident` tinyint(1) NOT NULL,
  `can_edit_resident` tinyint(1) NOT NULL,
  `can_delete_resident` tinyint(1) NOT NULL,
  `can_upload_excel` tinyint(1) NOT NULL,
  `can_edit_officials` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authapp_rolepermission`
--

INSERT INTO `authapp_rolepermission` (`id`, `can_add_resident`, `can_edit_resident`, `can_delete_resident`, `can_upload_excel`, `can_edit_officials`, `user_id`) VALUES
(1, 1, 0, 0, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'LimitedUser');

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
(25, 'Can add archived resident', 7, 'add_archivedresident'),
(26, 'Can change archived resident', 7, 'change_archivedresident'),
(27, 'Can delete archived resident', 7, 'delete_archivedresident'),
(28, 'Can view archived resident', 7, 'view_archivedresident'),
(29, 'Can add barangay official', 8, 'add_barangayofficial'),
(30, 'Can change barangay official', 8, 'change_barangayofficial'),
(31, 'Can delete barangay official', 8, 'delete_barangayofficial'),
(32, 'Can view barangay official', 8, 'view_barangayofficial'),
(33, 'Can add person information', 9, 'add_personinformation'),
(34, 'Can change person information', 9, 'change_personinformation'),
(35, 'Can delete person information', 9, 'delete_personinformation'),
(36, 'Can view person information', 9, 'view_personinformation'),
(37, 'Can add Certificate Log', 10, 'add_certificatelog'),
(38, 'Can change Certificate Log', 10, 'change_certificatelog'),
(39, 'Can delete Certificate Log', 10, 'delete_certificatelog'),
(40, 'Can view Certificate Log', 10, 'view_certificatelog'),
(41, 'Can add role permission', 11, 'add_rolepermission'),
(42, 'Can change role permission', 11, 'change_rolepermission'),
(43, 'Can delete role permission', 11, 'delete_rolepermission'),
(44, 'Can view role permission', 11, 'view_rolepermission'),
(45, 'Can add password reset token', 12, 'add_passwordresettoken'),
(46, 'Can change password reset token', 12, 'change_passwordresettoken'),
(47, 'Can delete password reset token', 12, 'delete_passwordresettoken'),
(48, 'Can view password reset token', 12, 'view_passwordresettoken');

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
(1, 'pbkdf2_sha256$600000$IqG2SnhSU0nVOCEZ5G38z7$Q0761RAbJtNUVM9oyNalZQSV13w11EDC5BWIfNUUlOM=', '2025-12-14 03:57:30.795332', 1, 'admin', 'CHRISTIAN', 'PALAD', 'christianpalad@gmail.com', 1, 1, '2025-12-14 03:23:01.000000'),
(2, 'pbkdf2_sha256$600000$I4Mhe7eAohz1XGvSbAJvAK$p2SAgJeCV8Wn4rur4VVIVZ6sVnCvQIrME/6fOtjHemI=', '2025-12-14 03:47:10.723849', 0, 'cdln', '', '', 'codilanivan@gmail.com', 1, 1, '2025-12-14 03:44:58.269414');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2);

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

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-12-14 03:23:32.132069', '1', 'admin', 1, '[{\"added\": {}}]', 3, 1),
(2, '2025-12-14 03:23:37.974759', '1', 'Admin', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(3, '2025-12-14 03:24:11.680241', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 1);

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
(7, 'authapp', 'archivedresident'),
(8, 'authapp', 'barangayofficial'),
(10, 'authapp', 'certificatelog'),
(12, 'authapp', 'passwordresettoken'),
(9, 'authapp', 'personinformation'),
(11, 'authapp', 'rolepermission'),
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
(1, 'contenttypes', '0001_initial', '2025-12-14 03:20:12.888544'),
(2, 'auth', '0001_initial', '2025-12-14 03:20:13.188671'),
(3, 'admin', '0001_initial', '2025-12-14 03:20:13.258229'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-12-14 03:20:13.263930'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-12-14 03:20:13.269467'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-12-14 03:20:13.310382'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-12-14 03:20:13.344734'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-12-14 03:20:13.355564'),
(9, 'auth', '0004_alter_user_username_opts', '2025-12-14 03:20:13.361634'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-12-14 03:20:13.391095'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-12-14 03:20:13.393518'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-12-14 03:20:13.399456'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-12-14 03:20:13.407550'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-12-14 03:20:13.416534'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-12-14 03:20:13.424021'),
(16, 'auth', '0011_update_proxy_permissions', '2025-12-14 03:20:13.429945'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-12-14 03:20:13.438979'),
(18, 'authapp', '0001_initial', '2025-12-14 03:20:13.625399'),
(19, 'authapp', '0002_rename_created_by_personinformation_user', '2025-12-14 03:20:14.034214'),
(20, 'authapp', '0003_rename_admin_certificatelog_user', '2025-12-14 03:20:14.236903'),
(21, 'authapp', '0004_passwordresettoken', '2025-12-14 03:20:14.292467'),
(22, 'sessions', '0001_initial', '2025-12-14 03:20:14.314961');

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
('3kd6paqfjtzjieb8r46enrev9g7n9bit', '.eJxVjDsOwjAQBe_iGll24k-Wkp4zWLvrNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmrI6K6tOvxshP6TuIN-x3mbNc12XifSu6IM2fZ2zPC-H-3cwYhu_dYRojcTck3GFKALHDoyXyIGL70Owrvedc1g6YhA2Q8YBoBQUAV-sen8A1604HQ:1vUdEg:2XIoTic3NKAk6p39nH5dRXJTIP6-hVnbiSm9UbkrDIU', '2025-12-28 03:57:30.796561'),
('a3zl4wborwo3cnqyiky4q2jlchn8223b', '.eJxVjDsOwjAQBe_iGlnY-EtJzxms3fUaB5AtxUmFuDtESgHtm5n3EgnWpaZ18JymLM5CicPvhkAPbhvId2i3Lqm3ZZ5Qborc6ZDXnvl52d2_gwqjfusIFCxxJlL-aJxDDYEdRTxFxqDJWo-kTVDOBUWssBBpG1zxoAubLN4f_Rs4oA:1vUchg:l4F84lDGXbmUmREGpw08NYBxbwIW0bZcpgBiJZHcqPI', '2025-12-28 03:23:24.353077'),
('cm8ewjm98ur7vpps0few35gpgr3kpb69', '.eJxVjDsOwjAQBe_iGlnY-EtJzxms3fUaB5AtxUmFuDtESgHtm5n3EgnWpaZ18JymLM5CicPvhkAPbhvId2i3Lqm3ZZ5Qborc6ZDXnvl52d2_gwqjfusIFCxxJlL-aJxDDYEdRTxFxqDJWo-kTVDOBUWssBBpG1zxoAubLN4f_Rs4oA:1vUcr9:SF5CYgL-AHSsBPSE86nDyzeJvZDT8w6GWKIyu1duGoY', '2025-12-28 03:33:11.798903'),
('eqziyw551oavuuu78svrf462f8su6b8v', '.eJxVjDsOwjAQBe_iGlnY-EtJzxms3fUaB5AtxUmFuDtESgHtm5n3EgnWpaZ18JymLM5CicPvhkAPbhvId2i3Lqm3ZZ5Qborc6ZDXnvl52d2_gwqjfusIFCxxJlL-aJxDDYEdRTxFxqDJWo-kTVDOBUWssBBpG1zxoAubLN4f_Rs4oA:1vUcoi:-J5FsJJuZdWYsGQRa7QXAAedXOEjOO5MoGcEhArCFZY', '2025-12-28 03:30:40.064076'),
('r1ucg3bzboetzuwy4ndvurew1gr337ob', '.eJxVjDsOwjAQBe_iGlnY-EtJzxms3fUaB5AtxUmFuDtESgHtm5n3EgnWpaZ18JymLM5CicPvhkAPbhvId2i3Lqm3ZZ5Qborc6ZDXnvl52d2_gwqjfusIFCxxJlL-aJxDDYEdRTxFxqDJWo-kTVDOBUWssBBpG1zxoAubLN4f_Rs4oA:1vUcpc:l3Aow8dv5UvuRgUIxhmGo-kEAFsV1BsEGI0lTJb-7_g', '2025-12-28 03:31:36.151058');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authapp_archivedresident`
--
ALTER TABLE `authapp_archivedresident`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `certificate_number` (`certificate_number`),
  ADD KEY `authapp_certificatel_resident_id_0d55f648_fk_authapp_p` (`resident_id`),
  ADD KEY `authapp_certificatelog_user_id_c3bfa00a_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `authapp_passwordresettoken`
--
ALTER TABLE `authapp_passwordresettoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `authapp_passwordresettoken_user_id_9936e1dd_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `authapp_personinformation`
--
ALTER TABLE `authapp_personinformation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authapp_personinformation_user_id_59d4cba9_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `authapp_rolepermission`
--
ALTER TABLE `authapp_rolepermission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `authapp_archivedresident`
--
ALTER TABLE `authapp_archivedresident`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `authapp_barangayofficial`
--
ALTER TABLE `authapp_barangayofficial`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `authapp_certificatelog`
--
ALTER TABLE `authapp_certificatelog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `authapp_passwordresettoken`
--
ALTER TABLE `authapp_passwordresettoken`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authapp_personinformation`
--
ALTER TABLE `authapp_personinformation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `authapp_rolepermission`
--
ALTER TABLE `authapp_rolepermission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authapp_certificatelog`
--
ALTER TABLE `authapp_certificatelog`
  ADD CONSTRAINT `authapp_certificatel_resident_id_0d55f648_fk_authapp_p` FOREIGN KEY (`resident_id`) REFERENCES `authapp_personinformation` (`id`),
  ADD CONSTRAINT `authapp_certificatelog_user_id_c3bfa00a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `authapp_passwordresettoken`
--
ALTER TABLE `authapp_passwordresettoken`
  ADD CONSTRAINT `authapp_passwordresettoken_user_id_9936e1dd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `authapp_personinformation`
--
ALTER TABLE `authapp_personinformation`
  ADD CONSTRAINT `authapp_personinformation_user_id_59d4cba9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `authapp_rolepermission`
--
ALTER TABLE `authapp_rolepermission`
  ADD CONSTRAINT `authapp_rolepermission_user_id_c36e2729_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
