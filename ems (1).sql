-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2021 at 03:09 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ems`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator_department`
--

CREATE TABLE `administrator_department` (
  `id` int(11) NOT NULL,
  `dp_name` varchar(255) NOT NULL,
  `dp_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator_department`
--

INSERT INTO `administrator_department` (`id`, `dp_name`, `dp_status`) VALUES
(1, 'Accounts and Finance', 'published'),
(2, 'HR', 'published'),
(3, 'Product development', 'published'),
(4, 'Research and development', 'published'),
(5, 'Security and transport.', 'unpublished');

-- --------------------------------------------------------

--
-- Table structure for table `administrator_employees`
--

CREATE TABLE `administrator_employees` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(255) NOT NULL,
  `emp_name` varchar(255) NOT NULL,
  `emp_email` varchar(255) NOT NULL,
  `emp_number` varchar(17) NOT NULL,
  `emp_department` int(11) NOT NULL,
  `emp_designation` varchar(255) NOT NULL,
  `emp_gender` varchar(50) NOT NULL,
  `joined_date` date NOT NULL,
  `emp_password` varchar(50) NOT NULL,
  `emp_img` varchar(100) DEFAULT NULL,
  `emp_status` varchar(50) NOT NULL,
  `emp_address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator_employees`
--

INSERT INTO `administrator_employees` (`id`, `emp_id`, `emp_name`, `emp_email`, `emp_number`, `emp_department`, `emp_designation`, `emp_gender`, `joined_date`, `emp_password`, `emp_img`, `emp_status`, `emp_address`) VALUES
(8, '8', 'Athul Pramod', 'athulpramod1@gmail.com', '9874556120', 3, 'Developers', 'male', '2021-09-11', '', 'uploads/20210908234519team_member_2.jpg', 'active', 'Nandanam\r\nKallukettuchira\r\npo kottali'),
(9, '9', 'Santhosh Gupta', 'santhosh@gmail.com', '987455612', 3, 'Tester', 'male', '2021-09-11', '', 'uploads/20210908234534team_member_4.jpg', 'exemp', 'Palakkad'),
(10, '10', 'Navya', 'navya@gmail.com', '0987455612', 2, 'HR  Manager', 'female', '2021-09-10', '', 'uploads/20210908234609team04.jpg', 'blocked', 'Nandanam'),
(11, '11', 'Jivin Jose', 'jivin@gmail.com', '9874561230', 3, 'Developer', 'male', '2021-09-11', '', 'uploads/202109082341101594028633author.jpg', 'active', 'Thrissur'),
(12, '12', 'Nayana', 'nayana@gmail.com', '9874561230', 4, 'Reasearch coordinator', 'female', '2021-09-03', '', 'uploads/20210908234312team_member_1.jpg', 'active', 'kannur'),
(13, '13', 'Prajisha', 'prajisha@gmail.com', '1234567890', 3, 'Software Tester', 'female', '2021-09-10', '', 'uploads/20210908234454team_member_3.jpg', 'active', 'kozhikode');

-- --------------------------------------------------------

--
-- Table structure for table `administrator_login`
--

CREATE TABLE `administrator_login` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `administrator_slider`
--

CREATE TABLE `administrator_slider` (
  `id` int(11) NOT NULL,
  `slider_img` varchar(100) DEFAULT NULL,
  `slider_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator_slider`
--

INSERT INTO `administrator_slider` (`id`, `slider_img`, `slider_status`) VALUES
(1, 'uploads/202109080050034.jpeg', 'published'),
(2, 'uploads/202109080050161.jpg', 'published'),
(3, 'uploads/202109080050302.png', 'published'),
(5, 'uploads/202109121815353.jpg', 'unpublished');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add department', 1, 'add_department'),
(2, 'Can change department', 1, 'change_department'),
(3, 'Can delete department', 1, 'delete_department'),
(4, 'Can view department', 1, 'view_department'),
(5, 'Can add employees', 2, 'add_employees'),
(6, 'Can change employees', 2, 'change_employees'),
(7, 'Can delete employees', 2, 'delete_employees'),
(8, 'Can view employees', 2, 'view_employees'),
(9, 'Can add login', 3, 'add_login'),
(10, 'Can change login', 3, 'change_login'),
(11, 'Can delete login', 3, 'delete_login'),
(12, 'Can view login', 3, 'view_login'),
(13, 'Can add slider', 4, 'add_slider'),
(14, 'Can change slider', 4, 'change_slider'),
(15, 'Can delete slider', 4, 'delete_slider'),
(16, 'Can view slider', 4, 'view_slider'),
(17, 'Can add log entry', 5, 'add_logentry'),
(18, 'Can change log entry', 5, 'change_logentry'),
(19, 'Can delete log entry', 5, 'delete_logentry'),
(20, 'Can view log entry', 5, 'view_logentry'),
(21, 'Can add permission', 6, 'add_permission'),
(22, 'Can change permission', 6, 'change_permission'),
(23, 'Can delete permission', 6, 'delete_permission'),
(24, 'Can view permission', 6, 'view_permission'),
(25, 'Can add group', 7, 'add_group'),
(26, 'Can change group', 7, 'change_group'),
(27, 'Can delete group', 7, 'delete_group'),
(28, 'Can view group', 7, 'view_group'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add content type', 9, 'add_contenttype'),
(34, 'Can change content type', 9, 'change_contenttype'),
(35, 'Can delete content type', 9, 'delete_contenttype'),
(36, 'Can view content type', 9, 'view_contenttype'),
(37, 'Can add session', 10, 'add_session'),
(38, 'Can change session', 10, 'change_session'),
(39, 'Can delete session', 10, 'delete_session'),
(40, 'Can view session', 10, 'view_session'),
(41, 'Can add skills', 11, 'add_skills'),
(42, 'Can change skills', 11, 'change_skills'),
(43, 'Can delete skills', 11, 'delete_skills'),
(44, 'Can view skills', 11, 'view_skills');

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
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `role`) VALUES
(1, 'pbkdf2_sha256$260000$ptylHLDLOfvBiXbaZ8oJWX$VCMRTDCOqlQXV8jxzRcRZl7ZdxcRD7SXSPEdV9TsshI=', '2021-09-12 12:54:41.853801', 1, 'admin@admin.in', '', '', 'admin@admin.in', 1, 1, '2021-09-07 19:03:51.628220', 'admin'),
(3, 'pbkdf2_sha256$260000$gtMOmzZ4FZrAGsRIyeR57O$CblBF3c/Vlc8TvG1VrZJrYFP6dY0uGYNUl4imCRsLMU=', '2021-09-12 11:24:19.865701', 0, 'athulpramod1@gmail.com', '', '', 'athulpramod1@gmail.com', 0, 1, '2021-09-07 20:45:51.039981', ''),
(5, 'pbkdf2_sha256$260000$QtMHGCDpRsIMVfmrWs6ABI$C8e1KCWUce5jI2CHSd1NVfY3pK1It8h8y5KiCX+2pBU=', NULL, 0, 'santhosh@gmail.com', '', '', 'santhosh@gmail.com', 0, 1, '2021-09-08 18:05:05.430816', ''),
(6, 'pbkdf2_sha256$260000$kSTNHYrjITI88ZNm3PkADU$e+thzmUB3i2EGh8QmujlaKf2mZIrC+0roGgnXyebSmg=', NULL, 0, 'navya@gmail.com', '', '', 'navya@gmail.com', 0, 1, '2021-09-08 18:09:13.794999', ''),
(7, 'pbkdf2_sha256$260000$vbL4tN6XVqk8Ha881ZbBRA$1OXw9GQH6U14vOzEgJwWL8SVtNs6Wyw/3Tcj+2KmlE8=', '2021-09-12 11:31:00.635345', 0, 'jivin@gmail.com', '', '', 'jivin@gmail.com', 0, 1, '2021-09-08 18:11:10.546887', ''),
(8, 'pbkdf2_sha256$260000$9jA5UNSu8nUsxI6rwOq4Xe$mIIpjcVyPU/A2t7T7B5gZ5X85AGAYXTE7j+wImvBp5M=', '2021-09-12 03:26:20.115690', 0, 'nayana@gmail.com', '', '', 'nayana@gmail.com', 0, 1, '2021-09-08 18:13:12.457709', ''),
(9, 'pbkdf2_sha256$260000$VEF6msfUGF3lBG553XrBFT$oKnUYIQXWjD5Mny2Sc/DSqhW78yZPC6qssxklhMRy3s=', NULL, 0, 'prajisha@gmail.com', '', '', 'prajisha@gmail.com', 0, 1, '2021-09-08 18:14:55.275700', '');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(5, 'admin', 'logentry'),
(1, 'administrator', 'department'),
(2, 'administrator', 'employees'),
(3, 'administrator', 'login'),
(4, 'administrator', 'slider'),
(7, 'auth', 'group'),
(6, 'auth', 'permission'),
(8, 'auth', 'user'),
(9, 'contenttypes', 'contenttype'),
(10, 'sessions', 'session'),
(11, 'website', 'skills');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-09-07 19:01:36.503835'),
(2, 'auth', '0001_initial', '2021-09-07 19:01:47.925635'),
(3, 'admin', '0001_initial', '2021-09-07 19:01:49.860109'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-09-07 19:01:49.954161'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-07 19:01:50.003357'),
(6, 'administrator', '0001_initial', '2021-09-07 19:01:51.142812'),
(7, 'contenttypes', '0002_remove_content_type_name', '2021-09-07 19:01:52.286310'),
(8, 'auth', '0002_alter_permission_name_max_length', '2021-09-07 19:01:52.929041'),
(9, 'auth', '0003_alter_user_email_max_length', '2021-09-07 19:01:54.092265'),
(10, 'auth', '0004_alter_user_username_opts', '2021-09-07 19:01:54.193896'),
(11, 'auth', '0005_alter_user_last_login_null', '2021-09-07 19:01:55.509930'),
(12, 'auth', '0006_require_contenttypes_0002', '2021-09-07 19:01:55.573103'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2021-09-07 19:01:55.661162'),
(14, 'auth', '0008_alter_user_username_max_length', '2021-09-07 19:01:56.893316'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2021-09-07 19:01:57.396405'),
(16, 'auth', '0010_alter_group_name_max_length', '2021-09-07 19:01:58.197520'),
(17, 'auth', '0011_update_proxy_permissions', '2021-09-07 19:01:58.259565'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2021-09-07 19:01:58.838980'),
(19, 'sessions', '0001_initial', '2021-09-07 19:01:59.263428'),
(20, 'website', '0001_initial', '2021-09-11 14:40:47.240480');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0ghesr09emeahxj6gmcovw8dyv59t0ch', 'e30:1mOzZr:giqQuCNhWjH8pOZvtqkPd4pMI-hrFE5UE7MLkJ1BGAw', '2021-09-25 09:45:39.696516'),
('6cpd61zei854d6zbueie9vysp2e6b0os', 'e30:1mOvpT:G3KKDxXwSW7oyn3puKcE3eEK_eiWp6oHhjmM1bQAFwY', '2021-09-25 05:45:31.259474'),
('7mkcsac4ovr61kqm02ym8tuaia0fpa93', 'e30:1mOzbP:-7Jed7rpaFHsOvplcLZxWIedqJ3SVu0KytegWFQ2l44', '2021-09-25 09:47:15.703458'),
('fnefaqcr3h7ire7jnkjpz0wtddh7bdph', 'e30:1mOvrG:lQd4xOvP-lJiKf_ZJAa1KGpFP2fw6FOiJuQ_HJHvPFM', '2021-09-25 05:47:22.981430'),
('o23bg81kv46e0k0r3ngoujd4nzwhmwal', 'e30:1mOz1l:dNon-cRb8ngRzNEorBbRNNYq9kiPuErEVqh26HpNSgM', '2021-09-25 09:10:25.595144'),
('oj5t6g8etrlr8fl60jn611vbwx77l9sn', 'e30:1mOvtS:r_qfo4nScl-oK_NZvgU60UStpKq6UhEcoo_O8yP3RTE', '2021-09-25 05:49:38.834476'),
('q4uhydn0elemkny1wodd202qb318as2n', 'e30:1mOvxn:ZShxd0-zxNLWJDu1v7dwpPZdgyzT4CVhawIvgfEnQ_I', '2021-09-25 05:54:07.145016');

-- --------------------------------------------------------

--
-- Table structure for table `website_skills`
--

CREATE TABLE `website_skills` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `skill` varchar(255) NOT NULL,
  `rating` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `website_skills`
--

INSERT INTO `website_skills` (`id`, `employee_id`, `skill`, `rating`) VALUES
(1, 11, 'css', '50'),
(2, 11, 'python', '20'),
(3, 11, 'Javascript', '80'),
(4, 11, 'Bootstrap', '30'),
(5, 11, 'C#', '95'),
(6, 11, 'Html', '65'),
(7, 11, 'Angular', '2'),
(8, 12, 'Python', '85'),
(9, 8, 'CSS', '90'),
(10, 14, 'css', '82');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator_department`
--
ALTER TABLE `administrator_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `administrator_employees`
--
ALTER TABLE `administrator_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `administrator_login`
--
ALTER TABLE `administrator_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `administrator_slider`
--
ALTER TABLE `administrator_slider`
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
-- Indexes for table `website_skills`
--
ALTER TABLE `website_skills`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator_department`
--
ALTER TABLE `administrator_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `administrator_employees`
--
ALTER TABLE `administrator_employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `administrator_login`
--
ALTER TABLE `administrator_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `administrator_slider`
--
ALTER TABLE `administrator_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `website_skills`
--
ALTER TABLE `website_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
