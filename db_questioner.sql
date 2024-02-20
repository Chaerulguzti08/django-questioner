-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2024 at 05:09 AM
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
-- Database: `db_questioner`
--

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
(25, 'Can add tbl survei', 7, 'add_tblsurvei'),
(26, 'Can change tbl survei', 7, 'change_tblsurvei'),
(27, 'Can delete tbl survei', 7, 'delete_tblsurvei'),
(28, 'Can view tbl survei', 7, 'view_tblsurvei'),
(29, 'Can add tbl answer', 8, 'add_tblanswer'),
(30, 'Can change tbl answer', 8, 'change_tblanswer'),
(31, 'Can delete tbl answer', 8, 'delete_tblanswer'),
(32, 'Can view tbl answer', 8, 'view_tblanswer'),
(33, 'Can add tbl question', 9, 'add_tblquestion'),
(34, 'Can change tbl question', 9, 'change_tblquestion'),
(35, 'Can delete tbl question', 9, 'delete_tblquestion'),
(36, 'Can view tbl question', 9, 'view_tblquestion'),
(37, 'Can add tbl answers', 10, 'add_tblanswers'),
(38, 'Can change tbl answers', 10, 'change_tblanswers'),
(39, 'Can delete tbl answers', 10, 'delete_tblanswers'),
(40, 'Can view tbl answers', 10, 'view_tblanswers'),
(41, 'Can add tbl project', 11, 'add_tblproject'),
(42, 'Can change tbl project', 11, 'change_tblproject'),
(43, 'Can delete tbl project', 11, 'delete_tblproject'),
(44, 'Can view tbl project', 11, 'view_tblproject'),
(45, 'Can add tbl respondent', 12, 'add_tblrespondent'),
(46, 'Can change tbl respondent', 12, 'change_tblrespondent'),
(47, 'Can delete tbl respondent', 12, 'delete_tblrespondent'),
(48, 'Can view tbl respondent', 12, 'view_tblrespondent'),
(49, 'Can add tbl response', 13, 'add_tblresponse'),
(50, 'Can change tbl response', 13, 'change_tblresponse'),
(51, 'Can delete tbl response', 13, 'delete_tblresponse'),
(52, 'Can view tbl response', 13, 'view_tblresponse'),
(53, 'Can add tbl responses', 14, 'add_tblresponses'),
(54, 'Can change tbl responses', 14, 'change_tblresponses'),
(55, 'Can delete tbl responses', 14, 'delete_tblresponses'),
(56, 'Can view tbl responses', 14, 'view_tblresponses');

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
(8, 'appquestioner', 'tblanswer'),
(10, 'appquestioner', 'tblanswers'),
(11, 'appquestioner', 'tblproject'),
(9, 'appquestioner', 'tblquestion'),
(12, 'appquestioner', 'tblrespondent'),
(13, 'appquestioner', 'tblresponse'),
(14, 'appquestioner', 'tblresponses'),
(7, 'appquestioner', 'tblsurvei'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
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
(1, 'contenttypes', '0001_initial', '2023-09-15 02:59:09.820873'),
(2, 'auth', '0001_initial', '2023-09-15 02:59:10.500544'),
(3, 'admin', '0001_initial', '2023-09-15 02:59:10.653990'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-09-15 02:59:10.673393'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-09-15 02:59:10.679484'),
(6, 'appquestioner', '0001_initial', '2023-09-15 02:59:10.704389'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-09-15 02:59:10.793823'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-09-15 02:59:10.854373'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-09-15 02:59:10.880021'),
(10, 'auth', '0004_alter_user_username_opts', '2023-09-15 02:59:10.891713'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-09-15 02:59:10.939623'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-09-15 02:59:10.939623'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-09-15 02:59:10.962525'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-09-15 02:59:10.990111'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-09-15 02:59:11.025020'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-09-15 02:59:11.041082'),
(17, 'auth', '0011_update_proxy_permissions', '2023-09-15 02:59:11.060387'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-09-15 02:59:11.091690'),
(19, 'sessions', '0001_initial', '2023-09-15 02:59:11.131388'),
(20, 'appquestioner', '0002_tblanswer', '2023-09-19 04:17:27.823761'),
(21, 'appquestioner', '0003_alter_tblanswer_question_id', '2023-09-19 04:19:59.151125'),
(22, 'appquestioner', '0004_tblquestion', '2023-09-20 04:27:02.134236'),
(23, 'appquestioner', '0005_tblanswers', '2023-09-20 04:27:02.164625'),
(24, 'appquestioner', '0006_tblproject', '2023-09-21 03:23:14.478617'),
(25, 'appquestioner', '0007_tblrespondent', '2023-09-22 03:39:38.284788'),
(26, 'appquestioner', '0008_tblresponse', '2023-09-22 07:48:53.942667'),
(27, 'appquestioner', '0009_tblresponses', '2023-09-22 07:51:43.388935'),
(28, 'appquestioner', '0010_delete_tblanswer_delete_tblsurvei', '2023-09-25 03:39:51.765016'),
(29, 'appquestioner', '0011_delete_tblresponses_alter_tblresponse_question_id_and_more', '2023-09-25 03:41:23.396607'),
(30, 'appquestioner', '0012_delete_tblresponse', '2023-10-05 04:26:19.748156'),
(31, 'appquestioner', '0013_tblresponse', '2023-10-05 04:26:19.801065'),
(32, 'appquestioner', '0014_alter_tblresponse_unique_together', '2023-10-05 04:59:57.905613'),
(33, 'appquestioner', '0015_delete_tblresponse', '2023-10-05 05:09:24.744979'),
(34, 'appquestioner', '0016_tblresponse', '2023-10-05 05:10:13.473720'),
(35, 'appquestioner', '0017_delete_tblresponse', '2023-10-05 06:25:25.474856'),
(36, 'appquestioner', '0018_tblresponse', '2023-10-05 06:27:29.452518'),
(37, 'appquestioner', '0019_delete_tblresponse', '2023-10-05 07:31:11.750189'),
(38, 'appquestioner', '0020_tblresponse', '2023-10-05 07:31:45.251204'),
(39, 'appquestioner', '0021_delete_tblresponse', '2023-10-05 07:42:27.247061'),
(40, 'appquestioner', '0022_tblresponse', '2023-10-05 07:47:15.326679');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_answers`
--

CREATE TABLE `tbl_answers` (
  `id` bigint(20) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` varchar(250) NOT NULL,
  `correct` varchar(250) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_answers`
--

INSERT INTO `tbl_answers` (`id`, `question_id`, `answer`, `correct`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(74, 3, 'zxc', '', 'admin', 'admin', '2023-10-13 06:35:42.499549', '2023-10-13 06:35:42.499549'),
(75, 1, 'ini 1', '', 'admin', 'admin', '2023-10-13 06:38:59.370795', '2023-10-13 06:38:59.370795'),
(76, 2, 'Ya', '', 'admin', 'admin', '2023-10-13 06:38:59.444542', '2023-10-13 06:38:59.444542'),
(77, 4, 'ini 3', '', 'admin', 'admin', '2023-10-13 06:38:59.517784', '2023-10-13 06:38:59.517784'),
(78, 5, 'ini 4', '', 'admin', 'admin', '2023-10-13 06:38:59.558304', '2023-10-13 06:38:59.558304'),
(79, 3, 'ini 1', '', 'admin', 'admin', '2023-10-13 06:40:35.688186', '2023-10-13 06:40:35.688186'),
(80, 6, 'Mungkin', '', 'admin', 'admin', '2023-10-13 06:41:16.112761', '2023-10-13 06:41:16.112761'),
(81, 3, 'zxc', '', 'admin', 'admin', '2023-10-13 07:07:40.826679', '2023-10-13 07:07:40.826679'),
(82, 3, 'Ya', '', 'admin', 'admin', '2023-10-13 07:34:04.651017', '2023-10-13 07:34:04.651017'),
(83, 3, 'Ya', '', 'admin', 'admin', '2023-10-13 08:04:02.718979', '2023-10-13 08:04:02.718979'),
(84, 3, 'Tidak', '', 'admin', 'admin', '2023-10-13 08:32:33.706266', '2023-10-13 08:32:33.706266'),
(85, 6, 'Tidak', '', 'admin', 'admin', '2023-10-13 08:35:54.856545', '2023-10-13 08:35:54.856545'),
(86, 3, 'asd', '', 'admin', 'admin', '2023-10-13 08:44:03.819855', '2023-10-13 08:44:03.819855'),
(87, 3, '098', '', 'admin', 'admin', '2023-10-13 08:44:51.237165', '2023-10-13 08:44:51.237165'),
(88, 3, '08', '', 'admin', 'admin', '2023-10-13 08:46:13.203613', '2023-10-13 08:46:13.203613'),
(89, 3, '09', '', 'admin', 'admin', '2023-10-13 08:48:43.588720', '2023-10-13 08:48:43.588720'),
(90, 3, '098', '', 'admin', 'admin', '2023-10-13 09:13:36.669852', '2023-10-13 09:13:36.669852'),
(91, 3, 'asd5', '', 'admin', 'admin', '2023-10-13 09:16:10.239758', '2023-10-13 09:16:10.239758'),
(92, 6, 'Tidak', '', 'admin', 'admin', '2023-10-13 09:17:58.279780', '2023-10-13 09:17:58.279780');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project`
--

CREATE TABLE `tbl_project` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `location` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_project`
--

INSERT INTO `tbl_project` (`id`, `name`, `location`, `date`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Questioner Blockwood', 'Bandung', '2023-09-01', 'admin', 'admin', '2023-03-01 11:17:30.000000', '2023-03-01 11:17:30.000000'),
(2, 'questioner Adbang', 'Garut', '2023-09-01', 'admin', 'admin', '2023-03-01 11:17:30.000000', '2023-03-01 11:17:30.000000'),
(3, 'ini project', 'German', '2022-08-08', 'admin', 'admin', '2023-09-29 07:43:03.034739', '2023-09-29 07:43:03.034739'),
(9, 'ini contoh', 'jakarta', '2023-11-10', 'admin', 'admin', '2023-11-08 06:49:26.300135', '2023-11-08 06:49:26.300135');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question`
--

CREATE TABLE `tbl_question` (
  `id` bigint(20) NOT NULL,
  `project_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_question`
--

INSERT INTO `tbl_question` (`id`, `project_id`, `type`, `question`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 'Pertanyaan 1', 'admin', 'admin', '2023-03-01 11:17:30.000000', '2023-06-22 12:23:27.000000'),
(2, 1, '2', 'ini Pertanyaan 2', 'admin', 'admin', '2023-03-01 11:17:30.000000', '2023-03-01 11:17:30.000000'),
(3, 2, '1', 'apakah ?', 'admin', 'admin', '2023-03-01 11:17:30.000000', '2023-03-01 11:17:30.000000'),
(4, 1, '1', 'asdasdadasd', 'admin', '', '2023-03-01 11:17:30.000000', '2023-03-01 11:17:30.000000'),
(5, 1, '1', 'asdasd', 'asd', 'asd', '2023-09-21 09:33:16.000000', '2023-09-08 09:33:16.000000'),
(6, 3, '2', 'lorem ipsum ?', 'admin', 'admin', '2023-09-29 07:41:07.053290', '2023-09-29 07:41:07.053290'),
(7, 1, '1', 'xinting', 'admin', 'admin', '2023-11-08 02:57:22.780990', '2023-11-08 07:33:40.000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_respondents`
--

CREATE TABLE `tbl_respondents` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `phone_number` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `froms` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_respondents`
--

INSERT INTO `tbl_respondents` (`id`, `name`, `phone_number`, `email`, `froms`) VALUES
(61, 'zxc', '123', 'zxc@gmail.com', 'zxc'),
(62, 'chaerul', '098', 'chaerul@gmail.com', 'chaerul'),
(63, 'chaerul', '09', 'chaerul@gmail.com', 'chaerul'),
(64, 'chaerul', '098', 'chaerul@gmail.com', 'chaeru'),
(65, 'dasd', '12', 'asd@gmail.com', 'zxc'),
(66, 'ads', '876', 'ads@gmail.com', 'asd'),
(67, 'woy', '123', 'woy@gamil.com', 'sd'),
(68, 'sui', '098', 'sui@gmail.com', 'sui'),
(69, 'asd', '098', 'asd@gmail.com', 'sdfsd'),
(70, 'asd', '098', 'asdm@gmail.com', 'asd'),
(71, 'ads', '098', 'asd1@gmail.com', '098'),
(72, 'ads2', '098', 'asd2@gmail.com', '098'),
(73, 'asd2', '098', 'asd3@gmail.com', '098'),
(74, 'ads', '098', 'asd4@gmail.com', '098'),
(75, 'asd', '098', 'asd5@gmail.com', '098'),
(76, 'asd', '098', 'asd5@gmail.com', '098');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_response`
--

CREATE TABLE `tbl_response` (
  `id` bigint(20) NOT NULL,
  `question_id` int(11) NOT NULL,
  `respondent_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_response`
--

INSERT INTO `tbl_response` (`id`, `question_id`, `respondent_id`, `answer_id`, `answer`) VALUES
(29, 3, 61, 74, 'zxc'),
(30, 1, 62, 75, 'ini 1'),
(31, 2, 62, 76, 'Ya'),
(32, 4, 62, 77, 'ini 3'),
(33, 5, 62, 78, 'ini 4'),
(34, 3, 63, 79, 'ini 1'),
(35, 6, 64, 80, 'Mungkin'),
(36, 3, 65, 81, 'zxc'),
(37, 3, 66, 82, 'sad'),
(38, 3, 67, 83, 'sdsd'),
(39, 3, 68, 84, 'sui'),
(40, 6, 69, 85, 'Tidak'),
(41, 3, 70, 86, 'asd'),
(42, 3, 71, 87, '098'),
(43, 3, 72, 88, '08'),
(44, 3, 73, 89, '09'),
(45, 3, 74, 90, '098'),
(46, 3, 75, 91, 'asd5'),
(47, 6, 76, 92, 'Tidak');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `tbl_answers`
--
ALTER TABLE `tbl_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_project`
--
ALTER TABLE `tbl_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_question`
--
ALTER TABLE `tbl_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_respondents`
--
ALTER TABLE `tbl_respondents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_response`
--
ALTER TABLE `tbl_response`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_response_question_id_respondent_id_7a350d18_uniq` (`question_id`,`respondent_id`);

--
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_answers`
--
ALTER TABLE `tbl_answers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `tbl_project`
--
ALTER TABLE `tbl_project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_question`
--
ALTER TABLE `tbl_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_respondents`
--
ALTER TABLE `tbl_respondents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `tbl_response`
--
ALTER TABLE `tbl_response`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

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
