-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 28, 2023 at 02:10 AM
-- Server version: 10.6.12-MariaDB-log
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multiver_multiverzum`
-- 

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add user', 1, 'add_user'),
(2, 'Can change user', 1, 'change_user'),
(3, 'Can delete user', 1, 'delete_user'),
(4, 'Can view user', 1, 'view_user'),
(5, 'Can add item', 2, 'add_item'),
(6, 'Can change item', 2, 'change_item'),
(7, 'Can delete item', 2, 'delete_item'),
(8, 'Can view item', 2, 'view_item'),
(9, 'Can add order', 3, 'add_order'),
(10, 'Can change order', 3, 'change_order'),
(11, 'Can delete order', 3, 'delete_order'),
(12, 'Can view order', 3, 'view_order'),
(13, 'Can add shop', 4, 'add_shop'),
(14, 'Can change shop', 4, 'change_shop'),
(15, 'Can delete shop', 4, 'delete_shop'),
(16, 'Can view shop', 4, 'view_shop'),
(17, 'Can add size group', 5, 'add_sizegroup'),
(18, 'Can change size group', 5, 'change_sizegroup'),
(19, 'Can delete size group', 5, 'delete_sizegroup'),
(20, 'Can view size group', 5, 'view_sizegroup'),
(21, 'Can add user info', 6, 'add_userinfo'),
(22, 'Can change user info', 6, 'change_userinfo'),
(23, 'Can delete user info', 6, 'delete_userinfo'),
(24, 'Can view user info', 6, 'view_userinfo'),
(25, 'Can add size', 7, 'add_size'),
(26, 'Can change size', 7, 'change_size'),
(27, 'Can delete size', 7, 'delete_size'),
(28, 'Can view size', 7, 'view_size'),
(29, 'Can add seller', 8, 'add_seller'),
(30, 'Can change seller', 8, 'change_seller'),
(31, 'Can delete seller', 8, 'delete_seller'),
(32, 'Can view seller', 8, 'view_seller'),
(33, 'Can add order items', 9, 'add_orderitems'),
(34, 'Can change order items', 9, 'change_orderitems'),
(35, 'Can delete order items', 9, 'delete_orderitems'),
(36, 'Can view order items', 9, 'view_orderitems'),
(37, 'Can add item image', 10, 'add_itemimage'),
(38, 'Can change item image', 10, 'change_itemimage'),
(39, 'Can delete item image', 10, 'delete_itemimage'),
(40, 'Can view item image', 10, 'view_itemimage'),
(41, 'Can add category', 11, 'add_category'),
(42, 'Can change category', 11, 'change_category'),
(43, 'Can delete category', 11, 'delete_category'),
(44, 'Can view category', 11, 'view_category'),
(45, 'Can add message', 12, 'add_message'),
(46, 'Can change message', 12, 'change_message'),
(47, 'Can delete message', 12, 'delete_message'),
(48, 'Can view message', 12, 'view_message'),
(49, 'Can add log entry', 13, 'add_logentry'),
(50, 'Can change log entry', 13, 'change_logentry'),
(51, 'Can delete log entry', 13, 'delete_logentry'),
(52, 'Can view log entry', 13, 'view_logentry'),
(53, 'Can add permission', 14, 'add_permission'),
(54, 'Can change permission', 14, 'change_permission'),
(55, 'Can delete permission', 14, 'delete_permission'),
(56, 'Can view permission', 14, 'view_permission'),
(57, 'Can add group', 15, 'add_group'),
(58, 'Can change group', 15, 'change_group'),
(59, 'Can delete group', 15, 'delete_group'),
(60, 'Can view group', 15, 'view_group'),
(61, 'Can add content type', 16, 'add_contenttype'),
(62, 'Can change content type', 16, 'change_contenttype'),
(63, 'Can delete content type', 16, 'delete_contenttype'),
(64, 'Can view content type', 16, 'view_contenttype'),
(65, 'Can add filter', 17, 'add_filter'),
(66, 'Can change filter', 17, 'change_filter'),
(67, 'Can delete filter', 17, 'delete_filter'),
(68, 'Can view filter', 17, 'view_filter'),
(69, 'Can add order item', 18, 'add_orderitem'),
(70, 'Can change order item', 18, 'change_orderitem'),
(71, 'Can delete order item', 18, 'delete_orderitem'),
(72, 'Can view order item', 18, 'view_orderitem'),
(73, 'Can add item comment', 19, 'add_itemcomment'),
(74, 'Can change item comment', 19, 'change_itemcomment'),
(75, 'Can delete item comment', 19, 'delete_itemcomment'),
(76, 'Can view item comment', 19, 'view_itemcomment'),
(77, 'Can add wishes', 20, 'add_wishes'),
(78, 'Can change wishes', 20, 'change_wishes'),
(79, 'Can delete wishes', 20, 'delete_wishes'),
(80, 'Can view wishes', 20, 'view_wishes'),
(81, 'Can add cart item', 21, 'add_cartitem'),
(82, 'Can change cart item', 21, 'change_cartitem'),
(83, 'Can delete cart item', 21, 'delete_cartitem'),
(84, 'Can view cart item', 21, 'view_cartitem'),
(85, 'Can add item filter', 22, 'add_itemfilter'),
(86, 'Can change item filter', 22, 'change_itemfilter'),
(87, 'Can delete item filter', 22, 'delete_itemfilter'),
(88, 'Can view item filter', 22, 'view_itemfilter'),
(89, 'Can add session', 23, 'add_session'),
(90, 'Can change session', 23, 'change_session'),
(91, 'Can delete session', 23, 'delete_session'),
(92, 'Can view session', 23, 'view_session'),
(93, 'Can add search recommendation', 24, 'add_searchrecommendation'),
(94, 'Can change search recommendation', 24, 'change_searchrecommendation'),
(95, 'Can delete search recommendation', 24, 'delete_searchrecommendation'),
(96, 'Can view search recommendation', 24, 'view_searchrecommendation'),
(97, 'Can add profile like', 25, 'add_profilelike'),
(98, 'Can change profile like', 25, 'change_profilelike'),
(99, 'Can delete profile like', 25, 'delete_profilelike'),
(100, 'Can view profile like', 25, 'view_profilelike'),
(101, 'Can add email address', 26, 'add_emailaddress'),
(102, 'Can change email address', 26, 'change_emailaddress'),
(103, 'Can delete email address', 26, 'delete_emailaddress'),
(104, 'Can view email address', 26, 'view_emailaddress'),
(105, 'Can add email confirmation', 27, 'add_emailconfirmation'),
(106, 'Can change email confirmation', 27, 'change_emailconfirmation'),
(107, 'Can delete email confirmation', 27, 'delete_emailconfirmation'),
(108, 'Can view email confirmation', 27, 'view_emailconfirmation'),
(109, 'Can add social account', 28, 'add_socialaccount'),
(110, 'Can change social account', 28, 'change_socialaccount'),
(111, 'Can delete social account', 28, 'delete_socialaccount'),
(112, 'Can view social account', 28, 'view_socialaccount'),
(113, 'Can add social application', 29, 'add_socialapp'),
(114, 'Can change social application', 29, 'change_socialapp'),
(115, 'Can delete social application', 29, 'delete_socialapp'),
(116, 'Can view social application', 29, 'view_socialapp'),
(117, 'Can add social application token', 30, 'add_socialtoken'),
(118, 'Can change social application token', 30, 'change_socialtoken'),
(119, 'Can delete social application token', 30, 'delete_socialtoken'),
(120, 'Can view social application token', 30, 'view_socialtoken');

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `item_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`id`, `date_created`, `is_deleted`, `quantity`, `item_id`, `user_id`) VALUES
(1, '2023-04-15 22:21:04.274344', 0, 1, 11, 3),
(2, '2023-04-17 21:56:04.526798', 1, 1, 14, 2),
(3, '2023-04-17 21:56:02.818273', 1, 1, 14, 2),
(4, '2023-04-18 10:33:28.354282', 0, 1, 8, 2),
(5, '2023-04-25 12:32:35.039672', 1, 1, 25, 1),
(6, '2023-04-21 16:11:29.744042', 0, 1, 25, 8),
(7, '2023-04-26 12:48:44.473615', 0, 1, 41, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `date_created`, `is_deleted`, `name`, `parent_id`) VALUES
(1, '2023-04-12 14:20:49.028755', 0, 'Clothing', NULL),
(2, '2023-04-12 14:22:28.010510', 0, 'Phone Cases', NULL),
(3, '2023-04-12 14:22:43.319082', 0, 'Gifts', NULL),
(4, '2023-04-12 14:22:54.823556', 0, 'Accessories', NULL),
(5, '2023-04-12 14:23:14.120634', 0, 'Mugs', NULL),
(7, '2023-04-12 14:23:47.312689', 0, 'Bags', NULL),
(8, '2023-04-12 14:24:21.547560', 0, 'Electronics', NULL),
(9, '2023-04-12 14:24:33.853243', 0, 'School & Office', NULL),
(10, '2023-04-12 14:24:55.912776', 0, 'Pillows', 4),
(11, '2023-04-12 14:25:10.688228', 0, 'Music & Art', NULL),
(12, '2023-04-12 14:25:20.529519', 0, 'Kids & Babies', NULL),
(13, '2023-04-12 14:26:20.346245', 0, 'T-shirts', 1),
(14, '2023-04-12 14:26:44.359863', 0, 'Sweatshirts', 1),
(15, '2023-04-12 14:26:52.953479', 0, 'Sweatpants', 1),
(16, '2023-04-12 14:27:57.720911', 0, 'iPhone', 2),
(17, '2023-04-12 14:29:17.232903', 0, 'Samsung', 2),
(18, '2023-04-12 14:30:15.894599', 0, 'Huawei', 2),
(19, '2023-04-12 14:31:26.468696', 0, 'Keychains', 4),
(20, '2023-04-12 14:33:29.918874', 0, 'Stickers', 4),
(21, '2023-04-12 14:37:10.170592', 0, 'Socks', 1),
(22, '2023-04-12 14:38:11.204867', 0, 'Tote Bags', 7),
(23, '2023-04-12 14:38:57.623084', 0, 'Backpacks', 7),
(24, '2023-04-12 14:40:21.760211', 0, 'Laptop bags', 7),
(25, '2023-04-12 14:45:29.587447', 0, 'Gifts For Her', 3),
(26, '2023-04-12 14:45:43.983602', 0, 'Gifts For Him', 3),
(27, '2023-04-12 14:46:11.502452', 0, 'Notebooks', 9),
(28, '2023-04-12 14:47:02.971838', 0, 'Mouse Pads', 8),
(29, '2023-04-12 14:47:12.794791', 0, 'Mouse Pads', 9),
(30, '2023-04-12 14:47:40.266084', 0, 'Music', 11),
(31, '2023-04-12 14:48:02.136404', 0, 'Keyboards', 8),
(32, '2023-04-12 14:48:22.426290', 0, 'Keyboards', 9),
(33, '2023-04-12 14:48:49.818551', 0, 'Mouses', 9),
(34, '2023-04-12 14:49:21.093867', 0, 'Mouses', 8),
(35, '2023-04-12 14:49:49.305875', 0, 'Coffee Mugs', 5),
(36, '2023-04-12 14:50:36.942845', 0, 'Travel Mugs', 5),
(37, '2023-04-12 14:51:17.053025', 0, 'Funny Mugs', 5),
(38, '2023-04-12 14:51:56.812837', 0, 'Paintings', 11),
(39, '2023-04-15 12:20:33.809569', 0, 'Wallets', 7),
(40, '2023-04-20 19:10:15.246623', 0, 'Jewelry', NULL),
(41, '2023-04-20 19:10:53.007083', 0, 'Necklaces', 40),
(42, '2023-04-20 19:11:14.369377', 0, 'Bracelets', 40),
(43, '2023-04-20 19:11:38.928748', 0, 'Rings', 40),
(44, '2023-04-20 19:11:55.554948', 0, 'Earrings', 40),
(45, '2023-04-20 19:12:19.652642', 0, 'Anklets', 40),
(46, '2023-04-22 21:09:50.138628', 0, 'Pacifiers', 12),
(47, '2023-04-24 09:38:13.787935', 0, 'Games', NULL),
(48, '2023-04-24 09:38:30.510508', 0, 'Puzzles', 47),
(49, '2023-04-26 00:37:11.831916', 0, 'Other', NULL),
(50, '2023-04-26 00:37:26.082510', 0, 'Other', 47);

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
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-04-12 14:20:49.029491', '1', 'Clothes', 1, '[{\"added\": {}}]', 11, 1),
(2, '2023-04-12 14:22:28.011163', '2', 'Phone Cases', 1, '[{\"added\": {}}]', 11, 1),
(3, '2023-04-12 14:22:43.319640', '3', 'Gifts', 1, '[{\"added\": {}}]', 11, 1),
(4, '2023-04-12 14:22:54.824111', '4', 'Accessories', 1, '[{\"added\": {}}]', 11, 1),
(5, '2023-04-12 14:23:14.121170', '5', 'Mugs', 1, '[{\"added\": {}}]', 11, 1),
(6, '2023-04-12 14:23:37.600787', '6', 'Wallets', 1, '[{\"added\": {}}]', 11, 1),
(7, '2023-04-12 14:23:47.313275', '7', 'Bags', 1, '[{\"added\": {}}]', 11, 1),
(8, '2023-04-12 14:24:21.548228', '8', 'Electronics', 1, '[{\"added\": {}}]', 11, 1),
(9, '2023-04-12 14:24:33.853801', '9', 'School & Office', 1, '[{\"added\": {}}]', 11, 1),
(10, '2023-04-12 14:24:55.913383', '10', 'Pillows', 1, '[{\"added\": {}}]', 11, 1),
(11, '2023-04-12 14:25:10.688779', '11', 'Art', 1, '[{\"added\": {}}]', 11, 1),
(12, '2023-04-12 14:25:20.530276', '12', 'Baby', 1, '[{\"added\": {}}]', 11, 1),
(13, '2023-04-12 14:26:20.346824', '13', 'T-shirts', 1, '[{\"added\": {}}]', 11, 1),
(14, '2023-04-12 14:26:44.360448', '14', 'Sweatshirts', 1, '[{\"added\": {}}]', 11, 1),
(15, '2023-04-12 14:26:52.954072', '15', 'Sweatpants', 1, '[{\"added\": {}}]', 11, 1),
(16, '2023-04-12 14:27:57.721603', '16', 'iPhone', 1, '[{\"added\": {}}]', 11, 1),
(17, '2023-04-12 14:29:17.233603', '17', 'Samsung', 1, '[{\"added\": {}}]', 11, 1),
(18, '2023-04-12 14:30:15.895238', '18', 'Huawei', 1, '[{\"added\": {}}]', 11, 1),
(19, '2023-04-12 14:31:26.469263', '19', 'Keychains', 1, '[{\"added\": {}}]', 11, 1),
(20, '2023-04-12 14:33:29.919379', '20', 'Stickers', 1, '[{\"added\": {}}]', 11, 1),
(21, '2023-04-12 14:37:10.171236', '21', 'Socks', 1, '[{\"added\": {}}]', 11, 1),
(22, '2023-04-12 14:38:11.205441', '22', 'Tote Bags', 1, '[{\"added\": {}}]', 11, 1),
(23, '2023-04-12 14:38:57.623726', '23', 'Backpacks', 1, '[{\"added\": {}}]', 11, 1),
(24, '2023-04-12 14:40:21.760798', '24', 'Laptop bags', 1, '[{\"added\": {}}]', 11, 1),
(25, '2023-04-12 14:45:29.588036', '25', 'Gifts For Her', 1, '[{\"added\": {}}]', 11, 1),
(26, '2023-04-12 14:45:43.984137', '26', 'Gifts For Him', 1, '[{\"added\": {}}]', 11, 1),
(27, '2023-04-12 14:46:11.503035', '27', 'Notebooks', 1, '[{\"added\": {}}]', 11, 1),
(28, '2023-04-12 14:47:02.972382', '28', 'Mouse Pads', 1, '[{\"added\": {}}]', 11, 1),
(29, '2023-04-12 14:47:12.795336', '29', 'Mouse Pads', 1, '[{\"added\": {}}]', 11, 1),
(30, '2023-04-12 14:47:40.266730', '30', 'Music', 1, '[{\"added\": {}}]', 11, 1),
(31, '2023-04-12 14:48:02.136952', '31', 'Keyboards', 1, '[{\"added\": {}}]', 11, 1),
(32, '2023-04-12 14:48:22.426828', '32', 'Keyboards', 1, '[{\"added\": {}}]', 11, 1),
(33, '2023-04-12 14:48:49.819202', '33', 'Mouses', 1, '[{\"added\": {}}]', 11, 1),
(34, '2023-04-12 14:49:21.094423', '34', 'Mouses', 1, '[{\"added\": {}}]', 11, 1),
(35, '2023-04-12 14:49:49.306605', '35', 'Coffee Mugs', 1, '[{\"added\": {}}]', 11, 1),
(36, '2023-04-12 14:50:36.943588', '36', 'Travel Mugs', 1, '[{\"added\": {}}]', 11, 1),
(37, '2023-04-12 14:51:17.053562', '37', 'Funny Mugs', 1, '[{\"added\": {}}]', 11, 1),
(38, '2023-04-12 14:51:56.813401', '38', 'Paintings', 1, '[{\"added\": {}}]', 11, 1),
(39, '2023-04-15 12:20:33.810769', '39', 'Wallets', 1, '[{\"added\": {}}]', 11, 2),
(40, '2023-04-15 16:44:02.326664', '1', 'Gender', 1, '[{\"added\": {}}]', 17, 2),
(41, '2023-04-15 16:44:25.264761', '2', 'Color', 1, '[{\"added\": {}}]', 17, 2),
(42, '2023-04-15 16:44:45.707969', '3', 'Dimensions (w, h)', 1, '[{\"added\": {}}]', 17, 2),
(43, '2023-04-15 16:44:54.230108', '4', 'Clothing Size - Baby', 1, '[{\"added\": {}}]', 17, 2),
(44, '2023-04-15 16:45:06.225674', '5', 'Clothing Size - Children', 1, '[{\"added\": {}}]', 17, 2),
(45, '2023-04-15 16:45:17.176928', '6', 'Clothing Size - Regular', 1, '[{\"added\": {}}]', 17, 2),
(46, '2023-04-17 17:49:04.699714', '1', 'SearchRecommendation object (1)', 1, '[{\"added\": {}}]', 24, 2),
(47, '2023-04-17 17:49:10.782182', '2', 'SearchRecommendation object (2)', 1, '[{\"added\": {}}]', 24, 2),
(48, '2023-04-17 17:49:32.372511', '3', 'SearchRecommendation object (3)', 1, '[{\"added\": {}}]', 24, 2),
(49, '2023-04-18 22:38:02.546293', '4', 'Sweatpants', 1, '[{\"added\": {}}]', 24, 6),
(50, '2023-04-18 22:38:11.117473', '5', 'Socks', 1, '[{\"added\": {}}]', 24, 6),
(51, '2023-04-18 22:39:07.493027', '6', 'Sweatshirts', 1, '[{\"added\": {}}]', 24, 6),
(52, '2023-04-18 22:39:20.618113', '7', 'Funny socks', 1, '[{\"added\": {}}]', 24, 6),
(53, '2023-04-18 22:39:48.558555', '8', 'Samsung phone cases', 1, '[{\"added\": {}}]', 24, 6),
(54, '2023-04-18 22:46:53.879240', '9', 'Wallets', 1, '[{\"added\": {}}]', 24, 6),
(55, '2023-04-18 22:47:14.897593', '10', 'Coffe Mugs', 1, '[{\"added\": {}}]', 24, 6),
(56, '2023-04-18 22:47:25.104676', '11', 'Mouses', 1, '[{\"added\": {}}]', 24, 6),
(57, '2023-04-18 22:47:50.098391', '12', 'Notebooks', 1, '[{\"added\": {}}]', 24, 6),
(58, '2023-04-18 22:48:23.935582', '13', 'Tote bags', 1, '[{\"added\": {}}]', 24, 6),
(59, '2023-04-18 22:48:41.497636', '14', 'Backpacks', 1, '[{\"added\": {}}]', 24, 6),
(60, '2023-04-18 22:50:47.572579', '15', 'Phone Cases - Huawei', 1, '[{\"added\": {}}]', 24, 6),
(61, '2023-04-18 22:51:08.535791', '16', 'Phone Cases - Samsung', 1, '[{\"added\": {}}]', 24, 6),
(62, '2023-04-18 22:51:24.015438', '17', 'Phone Cases - iPhone', 1, '[{\"added\": {}}]', 24, 6),
(63, '2023-04-18 22:52:02.587367', '8', 'Samsung phone cases', 3, '', 24, 6),
(64, '2023-04-18 22:53:25.835088', '18', 'Pillows', 1, '[{\"added\": {}}]', 24, 6),
(65, '2023-04-18 22:53:53.560959', '19', 'Keychains', 1, '[{\"added\": {}}]', 24, 6),
(66, '2023-04-18 22:57:39.674036', '20', 'Mouse Pads', 1, '[{\"added\": {}}]', 24, 6),
(67, '2023-04-18 22:58:17.127245', '13', 'Tote Bags', 2, '[{\"changed\": {\"fields\": [\"Query\"]}}]', 24, 6),
(68, '2023-04-18 22:59:02.224928', '7', 'Funny Socks', 2, '[{\"changed\": {\"fields\": [\"Query\"]}}]', 24, 6),
(69, '2023-04-18 22:59:31.153988', '21', 'Mugs', 1, '[{\"added\": {}}]', 24, 6),
(70, '2023-04-18 23:17:35.081584', '22', 'Metallica', 1, '[{\"added\": {}}]', 24, 6),
(71, '2023-04-18 23:18:03.375472', '23', 'Family Guy', 1, '[{\"added\": {}}]', 24, 6),
(72, '2023-04-18 23:18:15.796537', '24', 'Squid Game', 1, '[{\"added\": {}}]', 24, 6),
(73, '2023-04-18 23:18:37.660220', '25', 'Simpsons', 1, '[{\"added\": {}}]', 24, 6),
(74, '2023-04-18 23:19:04.763167', '26', 'Iron Maiden', 1, '[{\"added\": {}}]', 24, 6),
(75, '2023-04-18 23:20:54.224409', '27', 'Guns N\' Roses', 1, '[{\"added\": {}}]', 24, 6),
(76, '2023-04-20 19:10:15.247360', '40', 'Jewelry', 1, '[{\"added\": {}}]', 11, 2),
(77, '2023-04-20 19:10:53.007658', '41', 'Necklaces', 1, '[{\"added\": {}}]', 11, 2),
(78, '2023-04-20 19:11:14.370210', '42', 'Bracelets', 1, '[{\"added\": {}}]', 11, 2),
(79, '2023-04-20 19:11:38.929442', '43', 'Rings', 1, '[{\"added\": {}}]', 11, 2),
(80, '2023-04-20 19:11:55.555577', '44', 'Earrings', 1, '[{\"added\": {}}]', 11, 2),
(81, '2023-04-20 19:12:19.653215', '45', 'Anklets', 1, '[{\"added\": {}}]', 11, 2),
(82, '2023-04-22 11:09:04.566536', '1', 'multiverzum', 1, '[{\"added\": {}}]', 29, 2),
(83, '2023-04-22 11:10:37.084699', '1', 'multiverzum', 2, '[{\"changed\": {\"fields\": [\"Key\"]}}]', 29, 2),
(84, '2023-04-22 21:07:40.745836', '46', 'Pacifier', 1, '[{\"added\": {}}]', 11, 2),
(85, '2023-04-22 21:09:50.139801', '46', 'Pacifiers', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 11, 2),
(86, '2023-04-24 09:38:13.788689', '47', 'Games', 1, '[{\"added\": {}}]', 11, 2),
(87, '2023-04-24 09:38:30.511109', '48', 'Puzzles', 1, '[{\"added\": {}}]', 11, 2),
(88, '2023-04-26 00:37:11.832713', '49', 'Other', 1, '[{\"added\": {}}]', 11, 2),
(89, '2023-04-26 00:37:26.083123', '50', 'Other', 1, '[{\"added\": {}}]', 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(26, 'account', 'emailaddress'),
(27, 'account', 'emailconfirmation'),
(13, 'admin', 'logentry'),
(15, 'auth', 'group'),
(14, 'auth', 'permission'),
(12, 'chat', 'message'),
(16, 'contenttypes', 'contenttype'),
(11, 'main', 'category'),
(17, 'main', 'filter'),
(2, 'main', 'item'),
(19, 'main', 'itemcomment'),
(10, 'main', 'itemimage'),
(3, 'main', 'order'),
(18, 'main', 'orderitem'),
(9, 'main', 'orderitems'),
(24, 'main', 'searchrecommendation'),
(8, 'main', 'seller'),
(4, 'main', 'shop'),
(7, 'main', 'size'),
(5, 'main', 'sizegroup'),
(1, 'main', 'user'),
(6, 'main', 'userinfo'),
(22, 'seller', 'itemfilter'),
(23, 'sessions', 'session'),
(28, 'socialaccount', 'socialaccount'),
(29, 'socialaccount', 'socialapp'),
(30, 'socialaccount', 'socialtoken'),
(21, 'user', 'cartitem'),
(25, 'user', 'profilelike'),
(20, 'user', 'wishes');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(371, 'main', '0001_initial', '2023-04-20 20:24:26.417657'),
(372, 'contenttypes', '0001_initial', '2023-04-20 20:24:26.424131'),
(373, 'admin', '0001_initial', '2023-04-20 20:24:26.428355'),
(374, 'admin', '0002_logentry_remove_auto_add', '2023-04-20 20:24:26.434942'),
(375, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-20 20:24:26.439026'),
(376, 'contenttypes', '0002_remove_content_type_name', '2023-04-20 20:24:26.443268'),
(377, 'auth', '0001_initial', '2023-04-20 20:24:26.447352'),
(378, 'auth', '0002_alter_permission_name_max_length', '2023-04-20 20:24:26.451494'),
(379, 'auth', '0003_alter_user_email_max_length', '2023-04-20 20:24:26.455734'),
(380, 'auth', '0004_alter_user_username_opts', '2023-04-20 20:24:26.463705'),
(381, 'auth', '0005_alter_user_last_login_null', '2023-04-20 20:24:26.467684'),
(382, 'auth', '0006_require_contenttypes_0002', '2023-04-20 20:24:26.471747'),
(383, 'auth', '0007_alter_validators_add_error_messages', '2023-04-20 20:24:26.475745'),
(384, 'auth', '0008_alter_user_username_max_length', '2023-04-20 20:24:26.479919'),
(385, 'auth', '0009_alter_user_last_name_max_length', '2023-04-20 20:24:26.484024'),
(386, 'auth', '0010_alter_group_name_max_length', '2023-04-20 20:24:26.488174'),
(387, 'auth', '0011_update_proxy_permissions', '2023-04-20 20:24:26.492369'),
(388, 'auth', '0012_alter_user_first_name_max_length', '2023-04-20 20:24:26.496631'),
(389, 'chat', '0001_initial', '2023-04-20 20:24:26.500896'),
(390, 'seller', '0001_initial', '2023-04-20 20:24:26.505150'),
(391, 'sessions', '0001_initial', '2023-04-20 20:24:26.509228'),
(392, 'user', '0001_initial', '2023-04-20 20:24:26.513406'),
(393, 'main', '0002_userinfo_likes', '2023-04-20 20:26:34.876588'),
(394, 'main', '0003_remove_userinfo_likes', '2023-04-20 20:26:50.194373'),
(395, 'user', '0002_initial', '2023-04-20 20:30:03.861225'),
(396, 'user', '0003_wishes_cartitem', '2023-04-20 20:30:09.150971'),
(397, 'chat', '0002_rename_text_message_message_message_created_at_and_more', '2023-04-22 09:29:38.603118'),
(398, 'chat', '0003_remove_message_reciever_message_receiver', '2023-04-22 09:29:38.611590'),
(399, 'main', '0002_remove_item_category_delete_category', '2023-04-22 09:29:38.619184'),
(400, 'main', '0003_category_item_category', '2023-04-22 09:29:38.624032'),
(401, 'main', '0004_remove_category_parent', '2023-04-22 09:29:38.629035'),
(402, 'main', '0005_category_parent', '2023-04-22 09:29:38.634077'),
(403, 'main', '0006_remove_item_material_alter_category_parent', '2023-04-22 09:29:38.641761'),
(404, 'main', '0007_item_condition', '2023-04-22 09:29:38.646374'),
(405, 'main', '0008_alter_item_description', '2023-04-22 09:29:38.651123'),
(406, 'main', '0009_alter_item_description', '2023-04-22 09:29:38.655680'),
(407, 'main', '0010_user_description', '2023-04-22 09:29:38.660388'),
(408, 'main', '0011_remove_item_discount_item_discount_price', '2023-04-22 09:29:38.665126'),
(409, 'main', '0012_alter_item_discount_price', '2023-04-22 09:29:38.669876'),
(410, 'main', '0013_alter_item_discount_price', '2023-04-22 09:29:38.674578'),
(411, 'main', '0014_alter_item_discount_price', '2023-04-22 09:29:38.679283'),
(412, 'main', '0015_filter', '2023-04-22 09:29:38.684074'),
(413, 'main', '0016_alter_orderitems_table_itemfilter', '2023-04-22 09:29:38.688880'),
(414, 'main', '0017_rename_orderitems_orderitem', '2023-04-22 09:29:38.693638'),
(415, 'main', '0018_delete_itemfilter', '2023-04-22 09:29:38.698368'),
(416, 'main', '0019_alter_filter_html_template_name_alter_filter_title', '2023-04-22 09:29:38.703261'),
(417, 'main', '0020_filter_two_choice_value_1_filter_two_choice_value_2', '2023-04-22 09:29:38.708187'),
(418, 'main', '0021_remove_filter_two_choice_value_1_and_more', '2023-04-22 09:29:38.712794'),
(419, 'main', '0022_alter_item_condition_itemfilter', '2023-04-22 09:29:38.717440'),
(420, 'main', '0023_remove_orderitem_seller_remove_shop_seller_id_and_more', '2023-04-22 09:29:38.722011'),
(421, 'main', '0024_remove_orderitem_seller_remove_shop_seller_id_and_more', '2023-04-22 09:29:38.726888'),
(422, 'main', '0025_alter_userinfo_user', '2023-04-22 09:29:38.731500'),
(423, 'main', '0026_alter_userinfo_user', '2023-04-22 09:29:38.736196'),
(424, 'main', '0027_alter_userinfo_shop', '2023-04-22 09:29:38.740912'),
(425, 'main', '0028_alter_user_description', '2023-04-22 09:29:38.745570'),
(426, 'main', '0029_alter_item_likes', '2023-04-22 09:29:38.750321'),
(427, 'main', '0030_delete_itemfilter', '2023-04-22 09:29:38.755188'),
(428, 'main', '0031_itemcomment', '2023-04-22 09:29:38.759970'),
(429, 'main', '0032_alter_item_description_alter_item_discount_price', '2023-04-22 09:29:38.764804'),
(430, 'main', '0033_searchrecommendation', '2023-04-22 09:29:38.773246'),
(431, 'main', '0034_remove_userinfo_likes', '2023-04-22 09:29:38.778078'),
(432, 'main', '0035_item_is_available', '2023-04-22 09:29:38.782830'),
(433, 'user', '0011_alter_profilelike_user', '2023-04-22 09:29:38.787790'),
(434, 'main', '0002_item_is_available', '2023-04-22 09:33:40.868389'),
(435, 'account', '0001_initial', '2023-04-22 10:17:15.367807'),
(436, 'account', '0002_email_max_length', '2023-04-22 10:17:15.454370'),
(437, 'socialaccount', '0001_initial', '2023-04-22 10:17:16.066138'),
(438, 'socialaccount', '0002_token_max_lengths', '2023-04-22 10:17:16.245566'),
(439, 'socialaccount', '0003_extra_data_default_dict', '2023-04-22 10:17:16.255936');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3ptais8rgne15vnmcaf119gb0eyl5cj5', '.eJxVjEsOAiEQBe_C2hCh-YhL956BdDeMjBpIhpmV8e5KMgtdveRVpV4i4raWuPW8xDmJswji8PsR8iPXAdId661JbnVdZpJDkTvt8tpSfl529y9QsJeRnXQgsOC8QWsxIaWswRztFEg51gFPib0yjoCZwMN3FOlgmb2HgOL9AekfOAY:1ps9ZO:Y6a8C3TxgVf7QBEYHsLBJ_kGMIpPPC9HDioyhh1QNHs', '2023-05-11 21:54:30.923438'),
('e1psj5brboyjqyty0zt0dg7fkvh007yj', '.eJxVjEEOwiAQRe_C2hBaGBCX7j0DGWZAqgaS0q6MdzckXej2v_f-WwTctxL2ntawsLgILU6_W0R6pjoAP7Dem6RWt3WJcijyoF3eGqfX9XD_Dgr2MuocibL2k1VkOTH5-QzWe2McezVFC-AQssqkkJxN2SinGSBG0C7NID5f-3s4FQ:1pqKI2:c4JZ3FCzwc8a3eu8z36kgcFYutwtFlJrZGs_NC8-bsY', '2023-05-06 20:57:02.636463'),
('gy59n5wht8x05fbzzwxpqqi3wys57bc9', '.eJxVjMsOwiAQRf-FtSHDwPBw6d5vIDAQqRqalHZl_Hdt0oVu7znnvkRM29riNuoSpyLOAsXpd8uJH7XvoNxTv82S574uU5a7Ig865HUu9Xk53L-Dlkb71tUbBqWJ0JriMwVMZIFczcAZMQCTDzoDKYcJjbbsDLiq2XoF2qJ4fwCu-DYS:1prHzG:XCGhfBM3UNTRzfOnnsh86nvmYoM7h9JverOVr7fuXug', '2023-05-09 12:41:38.672975'),
('hkdro32afj3yyf00t3gtywisph0v9tho', '.eJxVjDsOwjAQBe_iGlnrb2xK-pzBWq9XOIAcKU4qxN1JpBTQvpl5b5FwW2vaOi9pKuIqnLj8bhnpye0A5YHtPkua27pMWR6KPGmX41z4dTvdv4OKve41OAJiVj5qT0ZnU6xSMbANWmWAQaEtRpOHAIgDWrTeRueMCUXvKIjPF8HnNsg:1pnoyE:aL5qr5dDM5RKagY-z8wZ78GD1BzCXrvKO6FIrksWJHw', '2023-04-29 23:06:14.433573'),
('jbbm5jo08ak4cx60a19cuz3vo6wsh8bg', '.eJxVjMsOwiAQRf-FtSHDwPBw6d5vIDAQqRqalHZl_Hdt0oVu7znnvkRM29riNuoSpyLOAsXpd8uJH7XvoNxTv82S574uU5a7Ig865HUu9Xk53L-Dlkb71tUbBqWJ0JriMwVMZIFczcAZMQCTDzoDKYcJjbbsDLiq2XoF2qJ4fwCu-DYS:1pnj0A:SRnufWLQJHrimfGYihrtd-eIfZXRgPxvZ5z-v8szu1o', '2023-04-29 16:43:50.707985'),
('tocjk95o9ha59tb84fo8es0a5l97gv7o', '.eJxVjDsOwjAQBe_iGllx4i8lPWewdtdrHEC2FCcV4u4QKQW0b2beS0TY1hK3zkuckzgLK06_GwI9uO4g3aHemqRW12VGuSvyoF1eW-Ln5XD_Dgr08q0np9AqwsDGsQLHyAE4UE4umclbozGg12Qc2jBkJuX1mAbi0XqfTRbvDwDMOIk:1poWnT:abC4GFhkslb0gUfK9VGnfkQGdMx9fPouXETqnROQ3wU', '2023-05-01 21:54:03.461246'),
('vpagmbmd40px4mc2zs7nzvq5mctk853q', '.eJxVjMsOwiAQRf-FtSHDwPBw6d5vIDAQqRqalHZl_Hdt0oVu7znnvkRM29riNuoSpyLOAsXpd8uJH7XvoNxTv82S574uU5a7Ig865HUu9Xk53L-Dlkb71tUbBqWJ0JriMwVMZIFczcAZMQCTDzoDKYcJjbbsDLiq2XoF2qJ4fwCu-DYS:1pnet0:pBWpK6z7Z6UvJtiJ4anuEKX0aoCqRbBm_7tMiNw5oFY', '2023-04-29 12:20:10.028241'),
('wm2ilcv9ywf0s9g3cm940tn1e6amoew6', '.eJxVjMsOwiAQRf-FtSHDwPBw6d5vIDAQqRqalHZl_Hdt0oVu7znnvkRM29riNuoSpyLOAsXpd8uJH7XvoNxTv82S574uU5a7Ig865HUu9Xk53L-Dlkb71tUbBqWJ0JriMwVMZIFczcAZMQCTDzoDKYcJjbbsDLiq2XoF2qJ4fwCu-DYS:1prnDm:i1Z4yk_Zco1Q6jWPimcWqXJCJild3x0lrBK_MVm5swY', '2023-05-10 22:02:42.980808'),
('xi7yheek0obdfs0my09dgem9karijyl7', '.eJxVjMsOwiAQRf-FtSHDwPBw6d5vIDAQqRqalHZl_Hdt0oVu7znnvkRM29riNuoSpyLOAsXpd8uJH7XvoNxTv82S574uU5a7Ig865HUu9Xk53L-Dlkb71tUbBqWJ0JriMwVMZIFczcAZMQCTDzoDKYcJjbbsDLiq2XoF2qJ4fwCu-DYS:1prePi:Rkag-Y8S7fI-ZzZtDAlujtaL_FEW2hhCerGLiSQKmkk', '2023-05-10 12:38:26.507352'),
('y99932r2pfqq3uy999fi4e075is1jx5q', '.eJxVjMsOwiAQRf-FtSHDwPBw6d5vIDAQqRqalHZl_Hdt0oVu7znnvkRM29riNuoSpyLOAsXpd8uJH7XvoNxTv82S574uU5a7Ig865HUu9Xk53L-Dlkb71tUbBqWJ0JriMwVMZIFczcAZMQCTDzoDKYcJjbbsDLiq2XoF2qJ4fwCu-DYS:1poq5n:FcqKUOOBCrIscyOlNb_0NiEUMr1vIPrEbxt0D40Ojnk', '2023-05-02 18:30:15.889488');

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

CREATE TABLE `filter` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `title` varchar(80) NOT NULL,
  `html_template_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `filter`
--

INSERT INTO `filter` (`id`, `date_created`, `is_deleted`, `title`, `html_template_name`) VALUES
(1, '2023-04-15 16:44:02.325932', 0, 'Gender', 'gender.html'),
(2, '2023-04-15 16:44:25.264118', 0, 'Color', 'color-regular.html'),
(3, '2023-04-15 16:44:45.707372', 0, 'Dimensions (w, h)', 'dimensions-wh.html'),
(4, '2023-04-15 16:44:54.229470', 0, 'Clothing Size - Baby', 'clothing-size-baby.html'),
(5, '2023-04-15 16:45:06.225008', 0, 'Clothing Size - Children', 'clothing-size-children.html'),
(6, '2023-04-15 16:45:17.176129', 0, 'Clothing Size - Regular', 'clothing-size-regular.html');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `title` varchar(120) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `description` varchar(2900) DEFAULT NULL,
  `likes` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `condition` varchar(100) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `date_created`, `is_deleted`, `title`, `price`, `tags`, `description`, `likes`, `views`, `rating`, `seller_id`, `category_id`, `discount_price`, `condition`, `is_available`) VALUES
(1, '2023-04-15 20:47:07.340562', 1, 'Winter is Here - Game of Thrones White T-shirt with Direwolf', 23.00, 'TV shows', '', 0, 0, 0, 3, 13, NULL, NULL, 1),
(2, '2023-04-15 20:47:12.414070', 1, 'Winter is Here - Game of Thrones White T-shirt with Direwolf', 23.00, 'TV shows', '', 0, 0, 0, 3, 13, 0.00, NULL, 1),
(3, '2023-04-15 20:47:25.112676', 1, 'Winter is Here - Game of Thrones White T-shirt with Direwolf', 23.00, 'TV shows', '', 0, 0, 0, 3, 13, 0.00, NULL, 1),
(4, '2023-04-15 20:47:21.249366', 1, 'ajdkasdjk', 43.00, 'alsjdkajskdjkjs', '', 0, 0, 0, 3, 19, 0.00, NULL, 1),
(5, '2023-04-15 20:47:18.644067', 1, 'asdjasdjk', 24.00, 'asdas', '', 0, 0, 0, 3, 35, 0.00, NULL, 1),
(6, '2023-04-26 19:37:25.346319', 0, 'Winter is Here - Game of Thrones White T-shirt with Direwolf', 23.00, 'TV shows', '<p>Embrace the chilling winter with this Game of Thrones White T-shirt featuring the iconic Direwolf symbol of House Stark. Made from high-quality cotton, this T-shirt offers ultimate comfort while displaying your love for the beloved TV series. The intricate design of the Direwolf against the snowy white background is sure to turn heads and make a statement wherever you go. Whether you\'re a die-hard fan of the show or just looking for a stylish addition to your wardrobe, this T-shirt is a must-have.</p><p><br></p><p>For more info you can contact me by text or phone call:</p><h3><strong>+387 66 934 835</strong></h3>', 0, 2, 0, 3, 13, 0.00, NULL, 1),
(7, '2023-04-25 02:14:19.165748', 0, 'Smash Your Style with a Custom Hulk T-Shirt', 25.00, 'Movies Marvel', '<p>Get ready to unleash your inner hero with our custom Hulk t-shirt! Featuring the iconic green superhero in all his glory, this t-shirt is the perfect addition to your wardrobe. But what makes this t-shirt truly special is the ability to choose your own custom t-shirt color. From classic black to bold red or even cool blue, you can create a unique look that is all your own.</p><p><br></p><p>Crafted from high-quality materials, this t-shirt offers both style and comfort. The vibrant print of the Hulk is sure to turn heads and make a statement wherever you go. Whether you\'re heading to the gym, out for a casual day with friends, or just relaxing at home, this t-shirt will help you channel the incredible strength and power of the Hulk.</p>', 0, 1, 0, 3, 13, 0.00, NULL, 1),
(8, '2023-04-27 19:07:06.783699', 0, 'Rock Your Style with a Customizable Red Hot Chili Peppers T-Shirt', 23.99, 'Music rock n roll', '<p>If you\'re a fan of the Red Hot Chili Peppers, you won\'t want to miss out on our customizable t-shirt featuring the iconic band. With this t-shirt, you can choose your own size to ensure the perfect fit and customize it to make it truly unique.</p><p><br></p><p>Crafted from high-quality materials, this t-shirt offers both style and comfort. The vibrant print of the Red Hot Chili Peppers logo is sure to turn heads and make a statement wherever you go. Whether you\'re heading to a concert, out for a casual day with friends, or just relaxing at home, this t-shirt will help you rock your style.</p><p><br></p><p>Available in a range of sizes to fit any body type, this customizable Red Hot Chili Peppers t-shirt is the ultimate must-have for any fan of the band. So why wait? Get ready to show off your love for the Red Hot Chili Peppers in style and order yours today!</p>', 0, 13, 0, 3, 13, 0.00, NULL, 1),
(9, '2023-04-26 06:16:07.587064', 0, 'Unleash Your Inner Hero with a Marvel T-Shirt', 25.00, 'Movies TV', '<p>Whether you\'re a die-hard fan of the Avengers, Spider-Man, or Captain America, our Marvel t-shirt is the perfect way to show off your love for the superhero genre. Featuring an eye-catching design with some of Marvel\'s most iconic heroes, this t-shirt is sure to turn heads and make a statement wherever you go.</p><p><br></p><p>Crafted from high-quality materials, this t-shirt offers both style and comfort. The vibrant print of the Marvel heroes is sure to catch the eye of fellow fans, and you can customize the size to ensure the perfect fit.</p><p><br></p><p>Available in a range of sizes to fit any body type, this Marvel t-shirt is the ultimate must-have for any fan of the superhero genre. So why wait? Unleash your inner hero and order your Marvel t-shirt today!</p>', 0, 1, 0, 3, 13, 0.00, NULL, 1),
(10, '2023-04-15 21:37:49.799183', 0, 'Rock Out in Style with a Metallica Logo T-Shirt', 24.99, 'Music Rock n roll metal', '<p>Show off your love for one of the most legendary heavy metal bands of all time with our Metallica logo t-shirt. Featuring the iconic Metallica logo in all its glory, this t-shirt is a must-have for any true fan of the band.</p><p><br></p><p>Crafted from high-quality materials, this t-shirt offers both style and comfort. The bold and timeless design of the Metallica logo is sure to turn heads and make a statement wherever you go. You can customize the size to ensure the perfect fit.</p><p><br></p><p>Available in a range of sizes to fit any body type, this Metallica logo t-shirt is the ultimate must-have for any fan of the band. Whether you\'re heading to a concert or just want to rock out in style, this t-shirt is sure to make you feel like a true metalhead. So why wait? Order your Metallica logo t-shirt today and show the world your love for one of the greatest metal bands of all time.</p>', 0, 0, 0, 3, 13, 0.00, NULL, 1),
(11, '2023-04-26 12:40:15.122322', 0, 'React Native T-Shirt For Software Developers', 22.99, 'programming tech technology', '<p>Are you a fan of the popular mobile app development framework React Native? Show off your skills and your love for the technology with our React Native t-shirt. Featuring a stylish and modern design, this t-shirt is perfect for any developer who wants to showcase their passion for coding.</p><p><br></p><p>Crafted from high-quality materials, this t-shirt offers both style and comfort. The bold and vibrant design of the React Native logo is sure to turn heads and make a statement wherever you go. You can customize the size to ensure the perfect fit.</p><p><br></p><p>Available in a range of sizes to fit any body type, this React Native t-shirt is the ultimate must-have for any developer or technology enthusiast. Whether you\'re attending a tech conference or just want to show off your love for React Native, this t-shirt is the perfect addition to your wardrobe. So why wait? Level up your style and order your React Native t-shirt today!</p>', 0, 7, 0, 3, 13, 0.00, NULL, 1),
(12, '2023-04-26 12:40:51.470121', 0, 'Stay Cozy and Stylish with a Rick and Morty Hoodie', 28.50, 'cartoon meme funny', '<p>If you\'re a fan of the animated science-fiction sitcom Rick and Morty, then you\'ll love our Rick and Morty hoodie. Featuring some of the show\'s most beloved characters, this hoodie is the perfect way to show off your love for the series while staying warm and cozy.</p><p><br></p><p>Crafted from high-quality materials, this hoodie offers both style and comfort. The vibrant print of Rick, Morty, and other popular characters from the show is sure to catch the eye of fellow fans. The soft and comfortable fabric will keep you warm and cozy during those chilly days, and you can customize the size to ensure the perfect fit.</p><p><br></p><p>Available in a range of sizes to fit any body type, this Rick and Morty hoodie is the ultimate must-have for any fan of the show. Whether you\'re heading to a sci-fi convention or just lounging at home, this hoodie is the perfect addition to your wardrobe. So why wait? Stay cozy and stylish and order your Rick and Morty hoodie today!</p>', 0, 1, 0, 3, 14, 0.00, NULL, 1),
(13, '2023-04-15 22:15:35.368561', 0, 'Start Your Day Right with a Jujutsu Kaisen Coffee Mug', 8.99, 'anime', '<p>If you\'re a fan of the hit anime and manga series Jujutsu Kaisen, then you\'ll love our Jujutsu Kaisen mug. Featuring some of the series\' most iconic characters and designs, this mug is the perfect way to show off your love for the show while enjoying your favorite beverage.</p><p><br></p><p>Crafted from high-quality materials, this mug offers both style and function. The vibrant print of popular characters like Yuji Itadori, Megumi Fushiguro, and Gojo Satoru is sure to catch the eye of fellow fans. The sturdy ceramic material and comfortable handle make it easy to enjoy your favorite hot or cold beverage, whether you\'re at home or in the office.</p><p><br></p><p>This Jujutsu Kaisen mug is a great addition to any collection of anime merchandise, and it also makes for a perfect gift for any Jujutsu Kaisen fan. So why wait? Start your day right with a Jujutsu Kaisen mug and show off your love for the series in style!</p>', 0, 0, 0, 3, 35, 0.00, NULL, 1),
(14, '2023-04-26 12:39:59.954979', 0, 'Sip in Style with a \"Suits\" Mug - \"Anyone Can Do My Job, But No One Can Be Me\"', 8.99, 'tv shows', '<p>If you\'re a fan of the hit TV show \"Suits,\" then you\'ll love our \"Suits\" mug featuring the iconic quote \"Anyone Can Do My Job, But No One Can Be Me.\" This mug is the perfect way to show off your love for the show while enjoying your favorite beverage.</p><p><br></p><p>Crafted from high-quality materials, this mug offers both style and function. The bold and vibrant print of the quote is sure to catch the eye of fellow fans. The sturdy ceramic material and comfortable handle make it easy to enjoy your favorite hot or cold beverage, whether you\'re at home or in the office.</p><p><br></p><p>This \"Suits\" mug is a great addition to any collection of TV show merchandise, and it also makes for a perfect gift for any \"Suits\" fan. So why wait? Sip in style and show off your love for the show with this \"Suits\" mug featuring the iconic quote \"Anyone Can Do My Job, But No One Can Be Me.\"</p>', 0, 3, 0, 3, 35, 0.00, NULL, 1),
(15, '2023-04-18 19:00:32.743161', 1, 'Add a Touch of Elegance to Your Samsung Phone with a Beautiful Floral Phone Mask', 12.00, 'phone cases flowers', '<p>Protect your Samsung phone while adding a touch of elegance with our beautiful floral phone mask. Featuring a stunning floral design, this phone mask is the perfect way to keep your phone safe from scratches and bumps while adding a stylish touch.</p><p><br></p><p>Crafted from high-quality materials, this phone mask offers both style and function. The durable material provides excellent protection for your phone, while the beautiful floral design adds a touch of elegance. The precise cutouts ensure that all buttons and ports are easily accessible, allowing you to use your phone without any restrictions.</p><p>This floral phone mask is compatible with various Samsung phone models, including the Galaxy S21, S20, and Note 20. With its slim and lightweight design, it won\'t add any extra bulk to your phone, making it easy to carry around wherever you go.</p><p><br></p><p>Make a statement and add a touch of elegance to your Samsung phone with this beautiful floral phone mask. It\'s the perfect accessory for anyone who wants to protect their phone in style. So why wait? Order yours today and start enjoying your phone\'s new stylish look!</p>', 0, 0, 0, 3, 17, 0.00, NULL, 1),
(16, '2023-04-18 19:00:29.462744', 1, 'Add a Touch of Elegance to Your Samsung Phone with a Beautiful Floral Phone Mask', 12.00, 'phone cases flowers', '<p>Protect your Samsung phone while adding a touch of elegance with our beautiful floral phone mask. Featuring a stunning floral design, this phone mask is the perfect way to keep your phone safe from scratches and bumps while adding a stylish touch.</p><p><br></p><p>Crafted from high-quality materials, this phone mask offers both style and function. The durable material provides excellent protection for your phone, while the beautiful floral design adds a touch of elegance. The precise cutouts ensure that all buttons and ports are easily accessible, allowing you to use your phone without any restrictions.</p><p>This floral phone mask is compatible with various Samsung phone models, including the Galaxy S21, S20, and Note 20. With its slim and lightweight design, it won\'t add any extra bulk to your phone, making it easy to carry around wherever you go.</p><p><br></p><p>Make a statement and add a touch of elegance to your Samsung phone with this beautiful floral phone mask. It\'s the perfect accessory for anyone who wants to protect their phone in style. So why wait? Order yours today and start enjoying your phone\'s new stylish look!</p>', 0, 0, 0, 3, 17, 0.00, NULL, 1),
(17, '2023-04-20 19:15:53.006287', 0, 'Add a Touch of Elegance to Your Samsung Phone with a Beautiful Floral Phone Mask', 12.00, 'phone cases flowers', '<p>Protect your Samsung phone while adding a touch of elegance with our beautiful floral phone mask. Featuring a stunning floral design, this phone mask is the perfect way to keep your phone safe from scratches and bumps while adding a stylish touch.</p><p><br></p><p>Crafted from high-quality materials, this phone mask offers both style and function. The durable material provides excellent protection for your phone, while the beautiful floral design adds a touch of elegance. The precise cutouts ensure that all buttons and ports are easily accessible, allowing you to use your phone without any restrictions.</p><p>This floral phone mask is compatible with various Samsung phone models, including the Galaxy S21, S20, and Note 20. With its slim and lightweight design, it won\'t add any extra bulk to your phone, making it easy to carry around wherever you go.</p><p><br></p><p>Make a statement and add a touch of elegance to your Samsung phone with this beautiful floral phone mask. It\'s the perfect accessory for anyone who wants to protect their phone in style. So why wait? Order yours today and start enjoying your phone\'s new stylish look!</p>', 0, 1, 0, 3, 17, 0.00, NULL, 1),
(18, '2023-04-25 12:37:04.241688', 0, 'Add a Touch of Elegance to Your Samsung Phone with a Beautiful Floral Phone Mask', 12.00, 'phone cases flowers', '<p>Protect your Samsung phone while adding a touch of elegance with our beautiful floral phone mask. Featuring a stunning floral design, this phone mask is the perfect way to keep your phone safe from scratches and bumps while adding a stylish touch.</p><p><br></p><p>Crafted from high-quality materials, this phone mask offers both style and function. The durable material provides excellent protection for your phone, while the beautiful floral design adds a touch of elegance. The precise cutouts ensure that all buttons and ports are easily accessible, allowing you to use your phone without any restrictions.</p><p><br></p><p>This floral phone mask is compatible with various Samsung phone models, including the Galaxy S21, S20, and Note 20. With its slim and lightweight design, it won\'t add any extra bulk to your phone, making it easy to carry around wherever you go.</p><p><br></p><p>Make a statement and add a touch of elegance to your Samsung phone with this beautiful floral phone mask. It\'s the perfect accessory for anyone who wants to protect their phone in style. So why wait? Order yours today and start enjoying your phone\'s new stylish look!</p>', 0, 2, 0, 3, 17, 0.00, NULL, 1),
(19, '2023-04-25 11:23:15.113661', 0, 'Snuggle Up with a Cute Animal Children\'s Pillow', 17.99, 'pillows  children baby cute', '<p>Make bedtime more fun and comfortable for your little ones with our adorable children\'s pillow featuring cute animals. Crafted from soft and cozy materials, this pillow is the perfect addition to any child\'s bedroom.</p><p><br></p><p>The cute animal designs on the pillow are sure to delight your child, whether they love cats, dogs, or other furry creatures. The high-quality materials ensure that the pillow is both durable and comfortable, providing your child with a cozy spot to rest their head at night.</p><p><br></p><p>This children\'s pillow is the perfect size for little ones, measuring approximately 14 inches by 14 inches. It\'s also lightweight, making it easy for your child to carry it around and snuggle up with it wherever they go.</p><p><br></p><p>Order this cute animal children\'s pillow for your child today and watch their face light up with joy! It\'s the perfect gift for birthdays, holidays, or any other special occasion.</p>', 0, 11, 0, 3, 10, 0.00, NULL, 1),
(20, '2023-04-27 20:49:42.803796', 0, 'Snuggle Up with a Cute Animal Children\'s Pillow', 17.99, 'pillows  children baby cute', '<p>Make bedtime more fun and comfortable for your little ones with our adorable children\'s pillow featuring cute animals. Crafted from soft and cozy materials, this pillow is the perfect addition to any child\'s bedroom.</p><p><br></p><p>The cute animal designs on the pillow are sure to delight your child, whether they love cats, dogs, or other furry creatures. The high-quality materials ensure that the pillow is both durable and comfortable, providing your child with a cozy spot to rest their head at night.</p><p><br></p><p>This children\'s pillow is the perfect size for little ones, measuring approximately 14 inches by 14 inches. It\'s also lightweight, making it easy for your child to carry it around and snuggle up with it wherever they go.</p><p><br></p><p>Order this cute animal children\'s pillow for your child today and watch their face light up with joy! It\'s the perfect gift for birthdays, holidays, or any other special occasion.</p>', 0, 4, 0, 3, 10, 0.00, NULL, 1),
(21, '2023-04-23 21:29:16.514860', 0, 'Add Some Personality to Your Car with a Cute Car Sticker', 12.00, 'stickers car', '<p>Make your car stand out from the crowd with our adorable and fun car stickers. Featuring cute and whimsical designs, these stickers are the perfect way to add some personality to your vehicle.</p><p><br></p><p>Crafted from high-quality vinyl material, these car stickers are durable and weather-resistant, ensuring they will last for years to come. They\'re also easy to apply, simply peel and stick onto any smooth surface of your car, whether it\'s your bumper, window, or door.</p><p><br></p><p>Choose from a variety of cute and fun designs, including animals, cartoon characters, and inspiring quotes. These stickers are a great way to show off your personal style and make your car truly unique.</p><p><br></p><p>Order a cute car sticker today and add some personality to your vehicle. It\'s a great gift for anyone who loves to personalize their belongings, and it\'s sure to make anyone smile who sees it on the road.</p>', 0, 4, 0, 3, 20, 0.00, NULL, 1),
(22, '2023-04-18 19:33:16.174566', 0, 'Cute Sticker For Your Car', 12.00, 'stickers car', '<p>Make your car stand out from the crowd with our adorable and fun car stickers. Featuring cute and whimsical designs, these stickers are the perfect way to add some personality to your vehicle.</p><p><br></p><p>Crafted from high-quality vinyl material, these car stickers are durable and weather-resistant, ensuring they will last for years to come. They\'re also easy to apply, simply peel and stick onto any smooth surface of your car, whether it\'s your bumper, window, or door.</p><p><br></p><p>Choose from a variety of cute and fun designs, including animals, cartoon characters, and inspiring quotes. These stickers are a great way to show off your personal style and make your car truly unique.</p><p><br></p><p>Order a cute car sticker today and add some personality to your vehicle. It\'s a great gift for anyone who loves to personalize their belongings, and it\'s sure to make anyone smile who sees it on the road.</p>', 0, 0, 0, 3, 20, 0.00, NULL, 1),
(23, '2023-04-21 19:10:26.141551', 0, 'Work in Style with a Cute Cat Mouse Pad', 25.00, 'cats gaming gamers ', '<p>Make your workspace more fun and playful with our adorable cat mouse pad. Featuring a cute and whimsical cat design, this mouse pad is the perfect way to add some personality to your desk.</p><p>Crafted from high-quality materials, this mouse pad is both durable and comfortable. The smooth surface ensures that your mouse glides easily, while the non-slip backing keeps the mouse pad securely in place on your desk.</p><p>Measuring approximately 9 inches by 7.5 inches, this mouse pad is the perfect size for any desktop or laptop computer. Its slim profile also makes it easy to pack up and take with you on the go.</p><p>Order a cute cat mouse pad today and make your workday more enjoyable. It\'s the perfect gift for cat lovers or anyone who wants to add a touch of cuteness to their workspace.</p><p><br></p>', 0, 1, 0, 6, 28, 0.00, NULL, 1),
(24, '2023-04-18 21:02:12.106725', 1, ' Upgrade Your Workspace with a Cool Mouse Pad', 27.00, 'colorful work office', '<p> Elevate your workspace to the next level with our sleek and stylish cool mouse pad. Featuring a modern and minimalist design, this mouse pad is the perfect way to add some sophistication to your desk.</p><p>Crafted from high-quality materials, this mouse pad is both durable and comfortable. The smooth surface ensures that your mouse glides easily, while the non-slip backing keeps the mouse pad securely in place on your desk.</p><p>Measuring approximately 9 inches by 7.5 inches, this mouse pad is the perfect size for any desktop or laptop computer. Its slim profile also makes it easy to pack up and take with you on the go.</p><p>Choose from a variety of cool and stylish designs, including geometric patterns, abstract art, and inspiring quotes. This mouse pad is the perfect way to show off your personal style and make your workspace truly unique.</p><p>Order a cool mouse pad today and upgrade your workspace. It\'s the perfect gift for anyone who wants to add some sophistication to their work environment, and it\'s sure to make your workday more enjoyable.</p><p><br></p>', 0, 0, 0, 6, 28, 0.00, NULL, 1),
(25, '2023-04-26 11:09:37.257616', 0, 'Upgrade Your Workspace with a Cool Mouse Pad', 27.00, 'office gaming', '<p>Bring the beauty of nature to your workspace with our stunning mountain mouse pad. Featuring a breathtaking mountain landscape design, this mouse pad is the perfect way to add some inspiration to your desk.</p><p>Crafted from high-quality materials, this mouse pad is both durable and comfortable. The smooth surface ensures that your mouse glides easily, while the non-slip backing keeps the mouse pad securely in place on your desk.</p><p>Measuring approximately 9 inches by 7.5 inches, this mouse pad is the perfect size for any desktop or laptop computer. Its slim profile also makes it easy to pack up and take with you on the go.</p><p>Whether you love hiking, camping, or simply appreciating the beauty of nature, this mountain mouse pad is the perfect addition to your workspace. It\'s the perfect gift for anyone who loves the outdoors or needs a little inspiration to get through the workday.</p><p>Order a mountain mouse pad today and bring the beauty of nature to your desk. It\'s sure to make your work environment more enjoyable and inspiring.</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', 0, 12, 0, 6, 28, 19.99, NULL, 1),
(26, '2023-04-21 19:09:15.657086', 0, 'Upgrade Your Workspace with a Cool Mouse Pad', 27.00, 'gaming office', '<p>&nbsp;Elevate your workspace to the next level with our sleek and stylish cool mouse pad. Featuring a modern and minimalist design, this mouse pad is the perfect way to add some sophistication to your desk.</p><p><br></p><p>Crafted from high-quality materials, this mouse pad is both durable and comfortable. The smooth surface ensures that your mouse glides easily, while the non-slip backing keeps the mouse pad securely in place on your desk.</p><p><br></p><p>Measuring approximately 9 inches by 7.5 inches, this mouse pad is the perfect size for any desktop or laptop computer. Its slim profile also makes it easy to pack up and take with you on the go.</p><p><br></p><p>Choose from a variety of cool and stylish designs, including geometric patterns, abstract art, and inspiring quotes. This mouse pad is the perfect way to show off your personal style and make your workspace truly unique.</p><p><br></p><p>Order a cool mouse pad today and upgrade your workspace. It\'s the perfect gift for anyone who wants to add some sophistication to their work environment, and it\'s sure to make your workday more enjoyable.</p>', 0, 4, 0, 6, 28, 0.00, NULL, 1),
(27, '2023-04-20 23:30:24.525310', 1, 'Savor Your Morning Coffee in a Beautiful Flower Mug', 12.00, '', '<p>Start your day off right with our stunning flower mug. Featuring a beautiful and vibrant floral design, this mug is the perfect way to add some color and beauty to your morning routine.</p><p><br></p><p>Crafted from high-quality ceramic materials, this mug is both durable and comfortable to hold. It features a comfortable handle and a smooth, polished surface that feels great in your hands.</p><p><br></p><p>With a capacity of approximately 12 ounces, this mug is the perfect size for your morning cup of coffee or tea. Its dishwasher and microwave safe, making it easy to clean and convenient for everyday use.</p><p><br></p><p>Whether you\'re a flower lover or simply appreciate the beauty of nature, this flower mug is the perfect addition to your morning routine. It\'s the perfect gift for anyone who enjoys a beautiful and functional piece of drinkware.</p><p><br></p><p>Order a beautiful flower mug today and savor your morning coffee in style. It\'s sure to bring a smile to your face and make your morning routine more enjoyable.</p>', 0, 0, 0, 7, 35, 0.00, NULL, 1),
(28, '2023-04-21 19:12:03.957847', 0, 'Savor Your Morning Coffee in a Beautiful Flower Mug', 12.00, '', '<p>Start your day off right with our stunning flower mug. Featuring a beautiful and vibrant floral design, this mug is the perfect way to add some color and beauty to your morning routine.</p><p><br></p><p>Crafted from high-quality ceramic materials, this mug is both durable and comfortable to hold. It features a comfortable handle and a smooth, polished surface that feels great in your hands.</p><p><br></p><p>With a capacity of approximately 12 ounces, this mug is the perfect size for your morning cup of coffee or tea. Its dishwasher and microwave safe, making it easy to clean and convenient for everyday use.</p><p><br></p><p>Whether you\'re a flower lover or simply appreciate the beauty of nature, this flower mug is the perfect addition to your morning routine. It\'s the perfect gift for anyone who enjoys a beautiful and functional piece of drinkware.</p><p><br></p><p>Order a beautiful flower mug today and savor your morning coffee in style. It\'s sure to bring a smile to your face and make your morning routine more enjoyable.</p>', 0, 10, 0, 7, 35, 0.00, NULL, 1),
(29, '2023-04-26 12:39:38.168185', 0, 'Spiderman Notebook - Unleash Your Superpowers!', 9.99, '', '<p>Whether you\'re a fan of the friendly neighborhood Spiderman or just love a good superhero aesthetic, this notebook is for you! The cover features a powerful image of Spiderman in action, ready to inspire you to unleash your own superpowers and achieve your goals.</p><p><br></p><p>Inside, you\'ll find plenty of space to jot down notes, ideas, and to-do lists. The pages are blank, so you can use the notebook for anything from sketching to journaling. The compact size makes it easy to take with you on the go, whether you\'re headed to school, work, or just out and about.</p><p><br></p><p>Don\'t settle for a boring notebook - let Spiderman help you feel empowered and motivated every time you use this notebook!</p>', 0, 8, 0, 7, 27, 0.00, NULL, 1),
(30, '2023-04-26 18:48:01.825715', 0, 'Get Ready to Rock - Random Guitar Picks Bundle!', 3.99, '', '<p>Are you ready to take your guitar playing to the next level? Our Random Guitar Picks Bundle is just what you need! Each bundle contains a variety of cool, eye-catching guitar picks that will help you find your perfect match.</p><p><br></p><p>With this bundle, you\'ll get to experience the thrill of not knowing which pick you\'ll get until you open the package. Each pick is made from high-quality materials and designed with style in mind, so you can be sure you\'re getting a product that looks and feels great.</p><p><br></p><p>Whether you\'re a beginner or a seasoned pro, these picks are sure to inspire you to play your best. So why wait? Order your Random Guitar Picks Bundle today and get ready to rock!</p>', 0, 9, 0, 7, 30, 0.00, NULL, 1),
(31, '2023-04-26 12:39:48.929923', 0, 'Bring the Magic of Harry Potter to Your Morning Routine with Our Mug', 15.00, '', '<p>Start your day off with a touch of magic with our Harry Potter mug. Featuring a stylish and unique design inspired by the world of Hogwarts, this mug is the perfect way to add some enchantment to your morning routine.</p><p><br></p><p>Crafted from high-quality ceramic materials, this mug is both durable and comfortable to hold. It features a comfortable handle and a smooth, polished surface that feels great in your hands.</p><p><br></p><p>With a capacity of approximately 12 ounces, this mug is the perfect size for your morning cup of coffee or tea. Its dishwasher and microwave safe, making it easy to clean and convenient for everyday use.</p><p><br></p><p>Whether you\'re a die-hard Harry Potter fan or simply appreciate the magic of the wizarding world, this mug is the perfect addition to your drinkware collection. It\'s the perfect gift for anyone who loves Harry Potter and wants to bring a little bit of magic to their daily routine.</p><p><br></p><p>Order a Harry Potter mug today and start your day off with a touch of magic. It\'s sure to bring a smile to your face and make your morning routine more enjoyable.</p>', 0, 2, 0, 7, 35, 0.00, NULL, 1),
(32, '2023-04-23 15:34:50.162601', 0, 'Show Your Superpowers with Our Superman Mug', 13.00, '', '<p>Bring out your inner superhero with our Superman mug. Featuring the iconic Superman logo and a sleek, modern design, this mug is the perfect way to add some heroism to your morning routine.</p><p><br></p><p>Crafted from high-quality ceramic materials, this mug is both durable and comfortable to hold. It features a comfortable handle and a smooth, polished surface that feels great in your hands.</p><p><br></p><p>With a capacity of approximately 12 ounces, this mug is the perfect size for your morning cup of coffee or tea. Its dishwasher and microwave safe, making it easy to clean and convenient for everyday use.</p><p><br></p><p>Whether you\'re a die-hard Superman fan or simply appreciate the superhero\'s heroic qualities, this mug is the perfect addition to your drinkware collection. It\'s the perfect gift for anyone who wants to feel like a superhero while enjoying their morning beverage.</p><p><br></p><p>Order a Superman mug today and show your superpowers to the world. It\'s sure to bring a smile to your face and add some heroism to your morning routine.</p>', 0, 2, 0, 7, 35, 0.00, NULL, 1),
(33, '2023-04-23 15:01:05.613792', 0, 'Unleash Your Inner Dark Knight with Our Batman Mug', 12.00, '', '<p>Embrace your inner superhero with our Batman mug. Featuring the iconic Batman logo and a sleek, modern design, this mug is the perfect way to add some heroism to your morning routine.</p><p><br></p><p>Crafted from high-quality ceramic materials, this mug is both durable and comfortable to hold. It features a comfortable handle and a smooth, polished surface that feels great in your hands.</p><p><br></p><p>With a capacity of approximately 12 ounces, this mug is the perfect size for your morning cup of coffee or tea. Its dishwasher and microwave safe, making it easy to clean and convenient for everyday use.</p><p><br></p><p>Whether you\'re a die-hard Batman fan or simply appreciate the superhero\'s dark and mysterious qualities, this mug is the perfect addition to your drinkware collection. It\'s the perfect gift for anyone who wants to feel like a superhero while enjoying their morning beverage.</p><p><br></p><p>Order a Batman mug today and unleash your inner Dark Knight. It\'s sure to bring a smile to your face and add some heroism to your morning routine.</p>', 0, 1, 0, 7, 35, 0.00, NULL, 1),
(34, '2023-04-23 21:02:33.221716', 0, 'Game Over Mug - Perfect Gift for Gamers', 12.00, '', '<p>Calling all gamers! Our Game Over Mug is the perfect way to enjoy your favorite beverage while celebrating your love for gaming. This high-quality ceramic mug features a classic Game Over design, complete with a controller and pixelated text.</p><p><br></p><p>The mug is crafted from durable ceramic materials and has a smooth, polished surface that feels great in your hands. It\'s the perfect size for your morning cup of coffee or tea, with a capacity of approximately 12 ounces.</p><p><br></p><p>Not only is this mug a great addition to your own drinkware collection, but it also makes a perfect gift for the gamer in your life. Whether it\'s for a birthday, holiday, or just because, our Game Over Mug is sure to be a hit.</p><p><br></p><p>This mug is dishwasher and microwave safe, making it easy to clean and convenient for everyday use. So whether you\'re gaming late into the night or taking a break to enjoy a hot beverage, our Game Over Mug is the perfect way to celebrate your love for gaming.</p><p><br></p><p>Order a Game Over Mug today and show off your gamer pride. It\'s the perfect way to bring some fun and personality to your morning routine.</p>', 0, 1, 0, 7, 35, 0.00, NULL, 1),
(35, '2023-04-26 15:16:42.923923', 0, 'Get Nostalgic with Our Stranger Things Mug', 15.00, '', '<p>If you\'re a fan of the hit Netflix series Stranger Things, then our Stranger Things Mug is the perfect way to show off your love for the show. Featuring a sleek black design with the iconic Stranger Things logo, this mug is a must-have for any fan of the show.</p><p><br></p><p>Crafted from high-quality ceramic materials, this mug is both durable and comfortable to hold. It features a comfortable handle and a smooth, polished surface that feels great in your hands.</p><p><br></p><p>With a capacity of approximately 12 ounces, this mug is the perfect size for your morning cup of coffee or tea. Its dishwasher and microwave safe, making it easy to clean and convenient for everyday use.</p><p><br></p><p>Not only is this mug a great addition to your own drinkware collection, but it also makes a perfect gift for any Stranger Things fan. Whether it\'s for a birthday, holiday, or just because, our Stranger Things Mug is sure to be a hit.</p><p><br></p><p>So whether you\'re binge-watching your favorite episodes or taking a break to enjoy a hot beverage, our Stranger Things Mug is the perfect way to get nostalgic and show off your love for the show.</p><p><br></p><p>Order a Stranger Things Mug today and bring a piece of Hawkins, Indiana into your home. It\'s sure to be a conversation starter and a must-have for any fan of the show.</p>', 0, 4, 0, 7, 35, 0.00, NULL, 1),
(36, '2023-04-23 15:28:10.379272', 0, 'Embrace Your Inner Ninja with Our Naruto Mug', 13.00, '', '<p>If you\'re a fan of the popular anime series Naruto, then our Naruto Mug is the perfect way to show off your love for the show. Featuring a sleek black design with the iconic Naruto logo and ninja symbol, this mug is a must-have for any fan of the series.</p><p><br></p><p>Crafted from high-quality ceramic materials, this mug is both durable and comfortable to hold. It features a comfortable handle and a smooth, polished surface that feels great in your hands.</p><p><br></p><p>With a capacity of approximately 12 ounces, this mug is the perfect size for your morning cup of coffee or tea. It\'s dishwasher and microwave safe, making it easy to clean and convenient for everyday use.</p><p><br></p><p>Not only is this mug a great addition to your own drinkware collection, but it also makes a perfect gift for any Naruto fan. Whether it\'s for a birthday, holiday, or just because, our Naruto Mug is sure to be a hit.</p><p><br></p><p>So whether you\'re practicing your ninja moves or taking a break to enjoy a hot beverage, our Naruto Mug is the perfect way to embrace your inner ninja and show off your love for the show.</p><p><br></p><p>Order a Naruto Mug today and bring a piece of the Hidden Leaf Village into your home. It\'s sure to be a conversation starter and a must-have for any fan of the series.</p>', 0, 0, 0, 7, 35, 0.00, NULL, 1),
(37, '2023-04-23 15:35:43.658550', 0, 'Dive into Fun with Our Patrick Star Mug', 13.00, '', '<p>&nbsp;If you\'re a fan of the lovable character Patrick Star from the hit animated series SpongeBob SquarePants, then you\'ll love our Patrick Star Mug. This mug features a vibrant design of Patrick\'s iconic pink starfish face, making it a must-have for any SpongeBob fan.</p><p><br></p><p>Crafted from high-quality ceramic materials, this mug is both durable and comfortable to hold. It features a comfortable handle and a smooth, polished surface that feels great in your hands.</p><p><br></p><p>With a capacity of approximately 11 ounces, this mug is the perfect size for your morning cup of coffee or tea. It\'s dishwasher and microwave safe, making it easy to clean and convenient for everyday use.</p><p><br></p><p>Not only is this mug a great addition to your own drinkware collection, but it also makes a perfect gift for any SpongeBob fan. Whether it\'s for a birthday, holiday, or just because, our Patrick Star Mug is sure to be a hit.</p><p><br></p><p>So dive into the fun and add some Patrick Star charm to your morning routine with our Patrick Star Mug. Order yours today and start your day off with a smile!</p><p><br></p><p><br></p><p><br></p><p><br></p>', 0, 1, 0, 7, 35, 0.00, NULL, 1),
(38, '2023-04-23 15:32:10.513276', 0, ' Unleash Your Inner Activist with Our Anonymous Mug  ', 12.00, '', '<p>Make a statement and show your support for activism with our Anonymous Mug. Featuring the iconic Guy Fawkes mask associated with the Anonymous group, this mug is perfect for those who value privacy, freedom of speech, and social justice.</p><p><br></p><p>Crafted from high-quality ceramic materials, this mug is both durable and comfortable to hold. It features a comfortable handle and a smooth, polished surface that feels great in your hands.</p><p><br></p><p>With a capacity of approximately 11 ounces, this mug is the perfect size for your morning cup of coffee or tea. It\'s dishwasher and microwave safe, making it easy to clean and convenient for everyday use.</p><p><br></p><p>Whether you\'re a member of the Anonymous group or simply support their ideals, our Anonymous Mug is a great way to express yourself and start conversations. It\'s also a perfect gift for those who are passionate about activism, social justice, and privacy.</p><p><br></p><p>So unleash your inner activist and make a statement with our Anonymous Mug. Order yours today and start your day off with a powerful message.</p>', 0, 0, 0, 7, 35, 0.00, NULL, 1),
(39, '2023-04-23 15:33:44.350833', 0, 'Embrace the Glitch with Our Error 404 Mug', 13.00, 'gaming ', '<p>Don\'t let a little error get you down – embrace the glitch with our Error 404 Mug. Featuring the classic error message in bold black text against a white background, this mug is perfect for those who appreciate a good dose of humor and irony.</p><p><br></p><p>Crafted from high-quality ceramic materials, this mug is both durable and comfortable to hold. It features a comfortable handle and a smooth, polished surface that feels great in your hands.</p><p><br></p><p>With a capacity of approximately 11 ounces, this mug is the perfect size for your morning cup of coffee or tea. It\'s dishwasher and microwave safe, making it easy to clean and convenient for everyday use.</p><p><br></p><p>Whether you\'re a tech enthusiast or simply appreciate a good joke, our Error 404 Mug is a great way to add some personality to your drinkware collection. It\'s also a perfect gift for your friends, family, or coworkers who appreciate a good laugh.</p><p><br></p><p>So don\'t let a little error bring you down – embrace the glitch with our Error 404 Mug. Order yours today and start your day off with a smile.</p>', 0, 0, 0, 7, 35, 0.00, NULL, 1),
(40, '2023-04-26 12:40:32.566661', 0, 'Batman T-shirt for kids', 19.99, 'marvel', '<p>Dress your little superhero in this stylish and comfortable Batman t-shirt! Featuring the iconic Batman logo on the front, this tee is perfect for any young fan of the Dark Knight. Made from soft and durable materials, it is designed to withstand the wear and tear of active kids. Whether they\'re heading to school or out to play, this tee is sure to keep them looking cool and feeling comfortable all day long. Order now and give your child the gift of becoming their own caped crusader!</p>', 0, 1, 0, 3, 13, 0.00, NULL, 1),
(41, '2023-04-26 19:38:21.524917', 0, 'Get Your Game On - The Ultimate Gaming Mouse with a Twist!', 24.00, 'gaming electronics', '<p>Are you tired of boring, plain gaming mice? Our Ultimate Gaming Mouse with a Twist is just what you need to add some personality to your gaming setup! The mouse features a colorful and modern design with a mouse on it, which is sure to turn heads and make your gaming station stand out.</p><p><br></p><p>But this mouse is more than just a pretty face. It\'s designed with gamers in mind, with a comfortable ergonomic shape that fits perfectly in your hand. The high-precision optical sensor ensures accurate and responsive tracking, so you can stay on top of your game no matter what.</p><p><br></p><p>The mouse also comes with customizable RGB lighting, allowing you to personalize the look and feel of your gaming setup even further. And with its durable construction and high-quality materials, you can be sure this mouse will last through even the most intense gaming sessions.</p><p><br></p><p>So why settle for a boring gaming mouse when you can have one with a twist? Order our Ultimate Gaming Mouse with a Twist today and get ready to take your gaming experience to the next level!</p>', 0, 2, 0, 3, 34, 0.00, NULL, 1),
(42, '2023-04-27 20:50:10.224568', 0, 'Modern Gray Laptop Backpack for Men - Style and Functionality Combined!', 44.99, '', '<p>Looking for a backpack that\'s both stylish and functional? Look no further than our Modern Gray Laptop Backpack for Men! The sleek gray-black design is perfect for any outfit or occasion, while the durable construction ensures your laptop and other essentials stay safe and secure.</p><p><br></p><p>The backpack features a padded compartment that can hold laptops up to 15 inches, as well as plenty of other pockets and compartments for storing everything from books to water bottles. The padded shoulder straps and back panel provide comfortable support, even during long commutes or travels.</p><p><br></p><p>With its modern design and high-quality materials, this backpack is the perfect choice for anyone who wants to look good while staying organized and prepared. Whether you\'re heading to work, school, or just exploring the city, our Modern Gray Laptop Backpack for Men has got you covered.</p><p><br></p><p>So why wait? Order yours today and start enjoying the perfect combination of style and functionality!</p>', 0, 5, 0, 3, 23, 0.00, NULL, 1),
(43, '2023-04-26 21:14:21.506255', 1, 'Reach for the Stars with Our NASA Sweatshirt', 30.00, '', '<p>Whether you\'re a science enthusiast, a space fanatic, or simply love the iconic NASA logo, our NASA Sweatshirt is the perfect way to show your love for space exploration. Featuring the classic NASA logo in high-quality white sweatshirt, this sweatshirt is perfect for any occasion.</p><p><br></p><p>Crafted from soft and durable materials, this sweatshirt is perfect for keeping warm on chilly nights or simply lounging around the house. It features a classic fit, comfortable cuffs, and a smooth, comfortable feel against your skin.</p><p><br></p><p>Available in a variety of sizes, our NASA Sweatshirt is perfect for both men and women. It\'s machine washable for easy care and maintenance, making it a practical and stylish addition to your wardrobe.</p><p><br></p><p>So reach for the stars and show your love for space exploration with our NASA Sweatshirt. Order yours today and get ready to blast off in style.</p>', 0, 0, 0, 3, 14, 0.00, NULL, 1),
(44, '2023-04-26 21:26:09.913703', 0, 'Reach for the Stars with Our NASA Sweatshirt', 30.00, '', '<p>Whether you\'re a science enthusiast, a space fanatic, or simply love the iconic NASA logo, our NASA Sweatshirt is the perfect way to show your love for space exploration. Featuring the classic NASA logo in bold white letters against a comfortable, high-quality black sweatshirt, this sweatshirt is perfect for any occasion.</p><p><br></p><p>Crafted from soft and durable materials, this sweatshirt is perfect for keeping warm on chilly nights or simply lounging around the house. It features a classic fit, comfortable cuffs, and a smooth, comfortable feel against your skin.</p><p><br></p><p>Available in a variety of sizes, our NASA Sweatshirt is perfect for both men and women. It\'s machine washable for easy care and maintenance, making it a practical and stylish addition to your wardrobe.</p><p><br></p><p>So reach for the stars and show your love for space exploration with our NASA Sweatshirt. Order yours today and get ready to blast off in style.</p>', 0, 0, 0, 9, 14, 0.00, NULL, 1),
(45, '2023-04-26 21:33:50.546495', 1, 'Unleash Your Inner Hulk with Our Hulk T-Shirt', 25.00, '', '<p>Whether you\'re a fan of the classic comics or the blockbuster films, our Hulk T-Shirt is the perfect way to show your love for the iconic superhero. Featuring a bold and vibrant graphic of the Hulk in all his green glory, this t-shirt is sure to turn heads and make a statement.</p><p><br></p><p>Crafted from high-quality materials, this t-shirt is both comfortable and durable. It features a classic fit with a ribbed neckline and short sleeves, making it perfect for any casual occasion. Plus, it\'s available in a range of sizes to fit any body type.</p><p><br></p><p>With its eye-catching design and comfortable fit, our Hulk T-Shirt is perfect for everyday wear or for showing off your love of the Marvel universe at conventions and events. It also makes a great gift for any superhero fan in your life.</p><p><br></p><p>So if you\'re ready to unleash your inner Hulk, order our Hulk T-Shirt today and add some superhero style to your wardrobe.</p><p><br></p><p><br></p><p><br></p><p><br></p>', 0, 1, 0, 9, 13, 0.00, NULL, 1),
(46, '2023-04-26 21:55:12.873551', 1, 'Unleash Your Inner Hulk with Our Hulk T-Shirt', 23.00, '', '<p>Whether you\'re a fan of the classic comics or the blockbuster films, our Hulk T-Shirt is the perfect way to show your love for the iconic superhero. Featuring a bold and vibrant graphic of the Hulk in all his green glory, this t-shirt is sure to turn heads and make a statement.</p><p><br></p><p>Crafted from high-quality materials, this t-shirt is both comfortable and durable. It features a classic fit with a ribbed neckline and short sleeves, making it perfect for any casual occasion. Plus, it\'s available in a range of sizes to fit any body type.</p><p><br></p><p>With its eye-catching design and comfortable fit, our Hulk T-Shirt is perfect for everyday wear or for showing off your love of the Marvel universe at conventions and events. It also makes a great gift for any superhero fan in your life.</p><p><br></p><p>So if you\'re ready to unleash your inner Hulk, order our Hulk T-Shirt today and add some superhero style to your wardrobe.</p><p><br></p><p><br></p><p><br></p><p><br></p>', 0, 1, 0, 9, 13, 0.00, NULL, 1),
(47, '2023-04-27 20:48:35.743501', 0, ' Unleash Your Inner Hulk with Our Hulk T-Shirt', 23.00, '', '<p>Whether you\'re a fan of the classic comics or the blockbuster films, our Hulk T-Shirt is the perfect way to show your love for the iconic superhero. Featuring a bold and vibrant graphic of the Hulk in all his green glory, this t-shirt is sure to turn heads and make a statement.</p><p><br></p><p>Crafted from high-quality materials, this t-shirt is both comfortable and durable. It features a classic fit with a ribbed neckline and short sleeves, making it perfect for any casual occasion. Plus, it\'s available in a range of sizes to fit any body type.</p><p><br></p><p>With its eye-catching design and comfortable fit, our Hulk T-Shirt is perfect for everyday wear or for showing off your love of the Marvel universe at conventions and events. It also makes a great gift for any superhero fan in your life.</p><p><br></p><p>So if you\'re ready to unleash your inner Hulk, order our Hulk T-Shirt today and add some superhero style to your wardrobe.</p>', 0, 5, 0, 9, 13, 0.00, NULL, 1),
(48, '2023-04-26 22:08:19.911409', 0, ' Channel Your Inner Superhero with Our Marvel T-Shirt', 23.00, '', '<p>Whether you\'re a fan of the Avengers, X-Men, or any of the other iconic Marvel superheroes, our Marvel T-Shirt is the perfect way to show your love for the comics and films. Featuring a bold and colorful graphic of your favorite Marvel characters, this t-shirt is sure to turn heads and make a statement.</p><p><br></p><p>Crafted from high-quality materials, this t-shirt is both comfortable and durable. It features a classic fit withshort sleeves, making it perfect for any casual occasion. Plus, it\'s available in a range of sizes to fit any body type.</p><p><br></p><p>With its eye-catching design and comfortable fit, our Marvel T-Shirt is perfect for everyday wear or for showing off your love of the Marvel universe at conventions and events. It also makes a great gift for any superhero fan in your life.</p><p><br></p><p>So if you\'re ready to channel your inner superhero, order our Marvel T-Shirt today and add some superhero style to your wardrobe.</p>', 0, 2, 0, 9, 13, 0.00, NULL, 1);
INSERT INTO `item` (`id`, `date_created`, `is_deleted`, `title`, `price`, `tags`, `description`, `likes`, `views`, `rating`, `seller_id`, `category_id`, `discount_price`, `condition`, `is_available`) VALUES
(49, '2023-04-26 22:00:59.967700', 0, ' Rock Out in Our Metallica T-Shirt', 22.00, '', '<p>Are you a fan of heavy metal music? Show your love for one of the greatest bands of all time with our Metallica T-Shirt. Featuring the iconic Metallica logo in bold lettering, this t-shirt is a must-have for any true metalhead.</p><p><br></p><p>Crafted from high-quality materials, this t-shirt is both comfortable and durable. It features a classic fit with a ribbed neckline and short sleeves, making it perfect for any casual occasion. Plus, it\'s available in a range of sizes to fit any body type.</p><p><br></p><p>Whether you\'re heading to a concert or just hanging out with friends, our Metallica T-Shirt is the perfect way to show off your love for one of the greatest bands of all time. It also makes a great gift for any metalhead in your life.</p><p><br></p><p>So if you\'re ready to rock out in style, order our Metallica T-Shirt today and add some heavy metal flair to your wardrobe.</p>', 0, 1, 0, 9, 13, 0.00, NULL, 1),
(50, '2023-04-26 22:00:36.115977', 0, 'Rock On in Our Iron Maiden T-Shirt', 22.00, '', '<p>Are you a fan of heavy metal music? Show your love for one of the most iconic bands of all time with our Iron Maiden T-Shirt. Featuring the band\'s legendary mascot Eddie the Head and the classic Iron Maiden logo, this t-shirt is a must-have for any true metalhead.</p><p><br></p><p>Made from high-quality materials, this t-shirt is both comfortable and durable. It features a classic fit with short sleeves, making it perfect for any casual occasion. Plus, it\'s available in a range of sizes to fit any body type.</p><p><br></p><p>Whether you\'re heading to a concert or just hanging out with friends, our Iron Maiden T-Shirt is the perfect way to show off your love for one of the greatest metal bands of all time. It also makes a great gift for any metalhead in your life.</p><p><br></p><p>So if you\'re ready to rock on in style, order our Iron Maiden T-Shirt today and add some heavy metal flair to your wardrobe.</p>', 0, 0, 0, 9, 13, 0.00, NULL, 1),
(51, '2023-04-26 22:10:53.303015', 0, ' Add Some Spice to Your Wardrobe with Our Red Hot Chili Peppers T-Shirt', 25.00, '', '<p>Are you a fan of the Red Hot Chili Peppers? Show off your love for one of the greatest bands of all time with our Red Hot Chili Peppers T-Shirt. Featuring the band\'s iconic logo and vibrant colors, this t-shirt is a must-have for any true fan.</p><p><br></p><p>Made from high-quality materials, this t-shirt is both comfortable and durable. It features a classic fit with short sleeves, making it perfect for any casual occasion. Plus, it\'s available in a range of sizes to fit any body type.</p><p><br></p><p>Whether you\'re going to a concert or just hanging out with friends, our Red Hot Chili Peppers T-Shirt is the perfect way to add some spice to your wardrobe. It also makes a great gift for any fan of the band.</p><p><br></p><p>So if you\'re ready to rock out in style, order our Red Hot Chili Peppers T-Shirt today and show the world your love for this iconic band.</p>', 0, 0, 0, 9, 13, 0.00, NULL, 1),
(52, '2023-04-26 22:13:17.377140', 0, 'Level Up Your Style with Our React Native T-Shirt', 25.00, 'programming  technology', '<p>Are you a developer who loves working with React Native? Show off your skills and your style with our React Native T-Shirt. Made from high-quality materials, this t-shirt is both comfortable and durable, making it perfect for long days of coding.</p><p><br></p><p>Featuring the iconic React Native logo, this t-shirt is a must-have for any developer who loves working with this popular framework. It\'s available in a range of sizes, so you can find the perfect fit for your body type.</p><p><br></p><p>Not only is our React Native T-Shirt a great way to show off your skills and your passion for development, it also makes a great gift for any fellow developers in your life. Whether you\'re attending a tech conference or just hanging out with friends, this t-shirt is the perfect addition to any wardrobe.</p><p><br></p><p>So if you\'re ready to level up your style and show off your love for React Native, order our React Native T-Shirt today and start coding in style.</p>', 0, 0, 0, 9, 13, 0.00, NULL, 1),
(53, '2023-04-26 22:17:41.538826', 0, 'Add a Bold Pop of Color to Your Wardrobe with Our Red Tupac T-Shirt', 27.00, 'music rap', '<p>Our red Tupac t-shirt is the perfect addition to any wardrobe. Made from high-quality materials, this t-shirt is both comfortable and stylish, making it a great choice for any casual occasion.</p><p><br></p><p>Featuring the iconic image of Tupac Shakur, this t-shirt pays homage to one of the greatest rappers of all time. The bold red color adds a pop of color to any outfit, making it a standout piece in your collection.</p><p><br></p><p>Available in a range of sizes, our Tupac t-shirt is a great choice for fans of all body types. Whether you\'re heading out to a concert or just hanging out with friends, this t-shirt is sure to turn heads.</p><p><br></p><p>Order now and add a bold pop of color to your wardrobe with our Red Tupac T-Shirt. Whether you\'re a lifelong fan or just discovering Tupac\'s music for the first time, this t-shirt is the perfect way to show your love and appreciation for this iconic artist.</p>', 0, 0, 0, 9, 13, 0.00, NULL, 1),
(54, '2023-04-26 22:31:28.648362', 0, 'Stay Cool and Stylish with Our White Long Sleeve Arctic Monkeys Shirt', 28.00, 'music', '<p>Our white long sleeve Arctic Monkeys shirt is the perfect addition to your wardrobe. Made from high-quality materials, this shirt is both comfortable and stylish, making it a great choice for any casual occasion.</p><p><br></p><p>Featuring the iconic Arctic Monkeys logo, this shirt pays homage to one of the most popular rock bands of the 21st century. The clean white color and long sleeves make it a versatile piece that can be worn in any season and paired with your favorite jeans, shorts, or skirts.</p><p><br></p><p>Available in a range of sizes, our Arctic Monkeys shirt is a great choice for fans of all body types. Whether you\'re heading to a concert or just hanging out with friends, this shirt is sure to keep you looking cool and feeling comfortable.</p><p><br></p><p>Order now and stay cool and stylish with our White Long Sleeve Arctic Monkeys Shirt. Whether you\'re a longtime fan or just discovering their music for the first time, this shirt is the perfect way to show your love and appreciation for this iconic band.</p>', 0, 0, 0, 9, 13, 0.00, NULL, 1),
(55, '2023-04-26 22:36:45.548610', 0, 'Make Your Move in Style with Our Chess Figures White T-Shirt', 27.00, '', '<p>&nbsp;Our Chess Figures White T-Shirt is the perfect way to showcase your love for the game of chess. Made from high-quality materials, this shirt is both comfortable and stylish, making it a great choice for any casual occasion.</p><p><br></p><p>Featuring a unique design of chess figures in black, this shirt is a perfect fit for chess enthusiasts of all levels. The clean white color makes it a versatile piece that can be worn in any season and paired with your favorite jeans or shorts.</p><p><br></p><p>This chess-themed shirt is perfect for game nights with friends, chess tournaments, or even just a casual day out. Available in a range of sizes, our Chess Figures White T-Shirt is a great choice for fans of all body types.</p><p><br></p><p>Order now and make your move in style with our Chess Figures White T-Shirt. Whether you\'re a seasoned player or just getting started, this shirt is the perfect way to show your love and appreciation for the game of chess.</p>', 0, 0, 0, 9, 13, 0.00, NULL, 1),
(56, '2023-04-27 21:36:22.845923', 0, 'Classic Pink Floyd White T-Shirt - Show Your Love for the Legends of Rock!', 21.99, 'music ', '<p>Our Classic Pink Floyd White T-Shirt is the perfect addition to any music lover\'s wardrobe. Made from high-quality materials, this shirt is both comfortable and stylish, making it a great choice for any casual occasion.</p><p><br></p><p>Featuring the iconic Pink Floyd logo in bold letters on the front, this shirt is a tribute to the legends of rock music. The clean white color makes it a versatile piece that can be worn in any season and paired with your favorite jeans or shorts.</p><p><br></p><p>This Pink Floyd-themed shirt is perfect for concerts, music festivals, or even just a casual day out. Available in a range of sizes, our Classic Pink Floyd White T-Shirt is a great choice for fans of all body types.</p><p><br></p><p>Order now and show your love for the legends of rock with our Classic Pink Floyd White T-Shirt. Whether you\'re a die-hard fan or just getting into their music, this shirt is the perfect way to pay homage to one of the greatest bands of all time.</p>', 0, 0, 0, 9, 13, 0.00, NULL, 1),
(57, '2023-04-27 21:41:54.699208', 0, 'Classic Style with The Who Logo White T-Shirt', 24.00, '', '<p>Get ready to rock and roll with our classic The Who Logo white t-shirt. This shirt features the iconic The Who logo in bold letters, letting everyone know that you are a true fan. Made with high-quality materials, this t-shirt is comfortable and durable, perfect for concerts, casual wear, or just hanging out with friends. The white color and simple design make it versatile enough to wear with anything. Order now and add this must-have piece to your wardrobe.</p>', 0, 0, 0, 9, 13, 0.00, NULL, 1),
(58, '2023-04-27 21:54:30.900133', 0, 'Arctic Monkeys Black Sweatshirt', 37.00, 'music', '<p>This black sweatshirt is a must-have for fans of the Arctic Monkeys. Made with high-quality material, this sweatshirt is both comfortable and stylish. The graphic features the iconic Arctic Monkeys logo, with bold and striking design that will make a statement wherever you go. Whether you\'re going to a concert, hanging out with friends, or just running errands, this sweatshirt is the perfect choice. Available in a range of sizes, this sweatshirt is the ultimate addition to any Arctic Monkeys fan\'s wardrobe.</p>', 0, 0, 0, 9, 14, 0.00, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_filter`
--

CREATE TABLE `item_filter` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `filter_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `item_filter`
--

INSERT INTO `item_filter` (`id`, `date_created`, `is_deleted`, `filter_id`, `item_id`) VALUES
(1, '2023-04-15 17:08:17.686870', 0, 6, 2),
(2, '2023-04-15 17:12:00.280032', 0, 1, 3),
(3, '2023-04-15 17:12:00.292783', 0, 6, 3),
(4, '2023-04-15 20:07:45.817115', 0, 3, 4),
(5, '2023-04-15 20:10:23.650852', 0, 1, 5),
(6, '2023-04-15 20:35:50.343932', 0, 1, 6),
(7, '2023-04-15 20:35:50.354085', 0, 6, 6),
(8, '2023-04-15 20:53:56.434903', 0, 2, 7),
(9, '2023-04-15 20:53:56.442818', 0, 6, 7),
(10, '2023-04-15 21:04:33.517781', 0, 6, 8),
(11, '2023-04-15 21:34:07.896567', 0, 6, 9),
(12, '2023-04-15 21:37:50.063004', 0, 6, 10),
(13, '2023-04-15 21:42:40.986093', 0, 6, 11),
(14, '2023-04-15 22:08:36.544854', 0, 6, 12),
(15, '2023-04-24 22:20:42.622190', 0, 5, 40),
(16, '2023-04-26 21:33:06.174749', 0, 6, 45),
(17, '2023-04-26 21:33:06.182854', 0, 2, 45),
(18, '2023-04-26 21:35:30.068692', 0, 6, 46),
(19, '2023-04-26 21:41:02.644301', 0, 6, 47),
(20, '2023-04-26 22:00:36.459458', 0, 6, 50),
(21, '2023-04-26 22:10:53.321745', 0, 6, 51),
(22, '2023-04-26 22:13:17.401570', 0, 6, 52),
(23, '2023-04-26 22:17:41.565963', 0, 6, 53),
(24, '2023-04-26 22:31:28.663795', 0, 6, 54),
(25, '2023-04-26 22:36:45.564709', 0, 6, 55),
(26, '2023-04-27 21:36:22.864087', 0, 6, 56),
(27, '2023-04-27 21:41:54.713359', 0, 6, 57),
(28, '2023-04-27 21:54:30.919506', 0, 6, 58);

-- --------------------------------------------------------

--
-- Table structure for table `item_image`
--

CREATE TABLE `item_image` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `item_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `item_image`
--

INSERT INTO `item_image` (`id`, `date_created`, `is_deleted`, `image`, `item_id`) VALUES
(1, '2023-04-15 16:56:53.545656', 0, 'main/item_images/800f93c9-b536-4d70-86f8-4c6dfec160f7.png', 1),
(2, '2023-04-15 17:08:17.663771', 0, 'main/item_images/746f0cbd-1fcc-4977-a18c-c6b3ac025416.png', 2),
(3, '2023-04-15 17:12:00.264995', 0, 'main/item_images/07b7d879-7df8-4100-8062-55cb22efda70.png', 3),
(4, '2023-04-15 20:07:45.806312', 0, 'main/item_images/a4d8db75-7de2-4c33-99fa-7731de7b68be.png', 4),
(5, '2023-04-15 20:10:23.635436', 0, 'main/item_images/a1c47836-1bc6-4669-b217-3631335dd868.png', 5),
(6, '2023-04-15 20:35:50.330949', 0, 'main/item_images/52538780-8a9b-4f74-8ae6-97b9e798d0b0.png', 6),
(7, '2023-04-15 20:53:54.948720', 0, 'main/item_images/4a21852b-6653-4e9b-9463-4d6efb382bd6.png', 7),
(8, '2023-04-15 20:53:55.854691', 0, 'main/item_images/49ac5b9d-374c-4322-9ff0-d6a6e1032ffb.png', 7),
(9, '2023-04-15 21:04:33.508412', 0, 'main/item_images/dfe60831-c30a-4339-8f1d-7546ecb9fe39.png', 8),
(10, '2023-04-15 21:34:07.455564', 0, 'main/item_images/3d8b538e-7ca2-4603-81dc-f82ebebfa343.png', 9),
(11, '2023-04-15 21:37:49.807065', 0, 'main/item_images/53a9b831-de2b-4bcd-be01-60e5ca4ec5d7.png', 10),
(12, '2023-04-15 21:42:40.974762', 0, 'main/item_images/24125f72-f715-4c03-8d7d-543959b9244f.png', 11),
(13, '2023-04-15 22:08:36.532395', 0, 'main/item_images/8c1e65c2-7d9a-4374-b847-bb2e613d5b8b.png', 12),
(14, '2023-04-15 22:15:35.377180', 0, 'main/item_images/7b576eea-d6c3-4184-bb76-34c7969d04ed.png', 13),
(15, '2023-04-15 22:19:11.168223', 0, 'main/item_images/59bb99e5-09ef-45c4-b195-180f2e16e1e2.png', 14),
(16, '2023-04-15 22:19:11.174942', 0, 'main/item_images/5516f929-e6bb-45d7-9143-4b257dd97f69.png', 14),
(17, '2023-04-18 18:54:19.140168', 0, 'main/item_images/7adc60b1-e892-4a0b-bf73-7ecee40feb19.png', 15),
(18, '2023-04-18 18:58:24.954300', 0, 'main/item_images/fe3d827a-15fa-458e-904b-4e187f1a2682.png', 16),
(19, '2023-04-18 19:00:06.867965', 0, 'main/item_images/28de0406-13ea-458d-85cd-aa984f4240c0.png', 17),
(20, '2023-04-18 19:02:30.274919', 0, 'main/item_images/782cea10-82af-4577-bd6e-cd0841925f43.png', 18),
(21, '2023-04-18 19:19:30.280978', 0, 'main/item_images/ca36b2e9-d789-4534-b698-cc2da93c877e.png', 19),
(22, '2023-04-18 19:20:07.673234', 0, 'main/item_images/58287242-6f7e-4643-a56b-9104418c4c49.png', 20),
(23, '2023-04-18 19:32:00.140908', 0, 'main/item_images/b567be06-e2c5-4538-8bbf-fa486303486a.png', 21),
(24, '2023-04-18 19:33:16.186289', 0, 'main/item_images/93d5498a-51c5-4b42-8a30-daf3b10a5113.png', 22),
(25, '2023-04-18 20:25:34.886824', 0, 'main/item_images/ee6ae213-11c3-4135-8499-0dc6c6b966e5.png', 23),
(26, '2023-04-18 20:35:34.878779', 0, 'main/item_images/669cbae7-7d54-4fd8-a5b4-b2c284aafca1.png', 24),
(27, '2023-04-18 21:01:54.284323', 0, 'main/item_images/b3a20ba6-aeb6-4d72-974a-27dd0527cf48.png', 25),
(28, '2023-04-18 21:07:28.718428', 0, 'main/item_images/ae6ebe36-f6ab-4128-ab6e-585652166e4a.png', 26),
(29, '2023-04-20 23:20:36.547233', 0, 'main/item_images/7366a919-2be1-41d6-b6fa-136a2415a6e3.png', 27),
(30, '2023-04-20 23:24:51.943487', 0, 'main/item_images/7f29287b-081a-41f8-b927-e8491d2c8abd.png', 28),
(31, '2023-04-22 02:37:44.346940', 0, 'main/item_images/1d6f8dd4-ac71-4e3d-9b57-c2ca588d1092.png', 29),
(32, '2023-04-22 02:48:03.987763', 0, 'main/item_images/04cb8ae1-2e0f-481a-b44a-9ce0c925a5b0.png', 30),
(33, '2023-04-23 13:10:29.213597', 0, 'main/item_images/12cbe40b-42f4-4426-8922-5d9e133b4e8e.png', 31),
(34, '2023-04-23 13:27:43.741611', 0, 'main/item_images/7a65003e-90bf-4201-b562-574271c6d2eb.png', 32),
(35, '2023-04-23 13:30:45.409440', 0, 'main/item_images/3833f695-9ee6-475c-b377-26d558f54796.png', 33),
(36, '2023-04-23 15:22:50.448628', 0, 'main/item_images/54407700-92d8-4dbe-93a5-53bda25b1b3d.png', 34),
(37, '2023-04-23 15:26:56.248994', 0, 'main/item_images/18743fc7-52fd-438d-98f1-5a53c1adf8c5.png', 35),
(38, '2023-04-23 15:28:10.386658', 0, 'main/item_images/9ea36278-f967-47d9-abdd-65b8a7423f53.png', 36),
(39, '2023-04-23 15:30:29.677859', 0, 'main/item_images/134fa230-004f-46f9-a54b-29c91ccb5dd3.png', 37),
(40, '2023-04-23 15:32:10.520983', 0, 'main/item_images/9b60c978-1d36-435b-94e3-f16514ef331a.png', 38),
(41, '2023-04-23 15:33:44.355569', 0, 'main/item_images/fd334d93-ada9-4874-944e-63135d50106d.png', 39),
(42, '2023-04-24 22:20:42.604900', 0, 'main/item_images/f3ef7d67-719d-411b-a360-c712d2d66f33.png', 40),
(43, '2023-04-26 10:37:57.994026', 0, 'main/item_images/509676c4-f197-4714-8d59-f72381c1edee.png', 41),
(44, '2023-04-26 10:43:08.564733', 0, 'main/item_images/02484099-0a6c-4355-8aa9-2b79b33ca8a0.png', 42),
(45, '2023-04-26 21:00:48.799896', 0, 'main/item_images/619a994e-15f1-41ac-b416-1ce5f445b186.png', 43),
(46, '2023-04-26 21:26:09.920484', 0, 'main/item_images/9b014406-4a90-4885-8bcf-0a4773a19d47.png', 44),
(47, '2023-04-26 21:33:06.164931', 0, 'main/item_images/f251afa3-71c3-41d1-a42f-f9e62b444cb1.png', 45),
(48, '2023-04-26 21:35:29.958114', 0, 'main/item_images/30dada06-11b1-403a-9ba0-402ca29ab801.png', 46),
(49, '2023-04-26 21:41:02.539036', 0, 'main/item_images/759028a5-bc93-4ed7-82eb-76aa12f5656e.png', 47),
(50, '2023-04-26 21:47:50.704339', 0, 'main/item_images/091d3353-23ca-4a09-bad6-22638b93cbf9.png', 48),
(51, '2023-04-26 21:57:45.777617', 0, 'main/item_images/ddd9bc47-4a93-4f56-ad7a-96234415de13.png', 49),
(52, '2023-04-26 22:00:36.119970', 0, 'main/item_images/21e33a0b-2b9f-4826-9886-128f370ee558.png', 50),
(53, '2023-04-26 22:10:53.307992', 0, 'main/item_images/d066ad25-6b76-441b-be36-29328ffda7bc.png', 51),
(54, '2023-04-26 22:13:17.385542', 0, 'main/item_images/182848c9-a6b4-4244-bec8-06fd6e09c3e1.png', 52),
(55, '2023-04-26 22:17:41.546202', 0, 'main/item_images/fef209ff-3057-40e0-8dfe-0ec729ffcbc2.png', 53),
(56, '2023-04-26 22:31:28.653184', 0, 'main/item_images/4e68a8df-b13a-4a54-b1ec-d8c2db06509d.png', 54),
(57, '2023-04-26 22:36:45.556059', 0, 'main/item_images/068dfde6-9bc8-46a4-959e-e40ec33d3011.png', 55),
(58, '2023-04-27 21:36:22.851445', 0, 'main/item_images/e7eb8eaa-9423-48e3-a724-dd954d2d0eda.png', 56),
(59, '2023-04-27 21:41:54.703650', 0, 'main/item_images/75358424-bdcd-44d9-a2ed-c886788a8bb3.png', 57),
(60, '2023-04-27 21:54:30.905827', 0, 'main/item_images/17aa618b-9b70-4e28-9bc0-24475e02d0fd.png', 58),
(61, '2023-04-27 21:54:30.910362', 0, 'main/item_images/de5ba1ca-15ba-4cf8-98e2-e07474d37cfb.png', 58);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` bigint(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `message` varchar(9999) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `receiver_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `status`, `message`, `sender_id`, `created_at`, `is_deleted`, `updated_at`, `receiver_id`) VALUES
(1, 'Sent', 'Welcome to multiverzum.com', 1, '2023-04-15 11:42:43.142965', 0, '2023-04-15 11:42:43.143004', 2),
(2, 'Sent', 'Welcome to multiverzum.com', 1, '2023-04-15 11:50:56.668541', 0, '2023-04-15 11:50:56.668580', 3),
(3, 'Sent', 'Welcome to multiverzum.com', 2, '2023-04-15 23:02:20.386434', 0, '2023-04-15 23:02:20.386472', 4),
(4, 'Sent', 'Welcome to multiverzum.com', 2, '2023-04-15 23:06:14.424580', 0, '2023-04-15 23:06:14.424616', 5),
(5, 'Sent', 'Welcome to multiverzum.com', 2, '2023-04-17 21:54:03.450008', 0, '2023-04-17 21:54:03.450042', 6),
(6, 'Sent', 'Hello. This is admin user. Whats up?', 2, '2023-04-20 20:34:12.745434', 0, '2023-04-20 20:34:12.745459', 6),
(7, 'Sent', 'Welcome to multiverzum.com', 2, '2023-04-20 22:44:28.807692', 0, '2023-04-20 22:44:28.807727', 7),
(8, 'Sent', 'Welcome to multiverzum.com', 2, '2023-04-20 23:37:44.712723', 0, '2023-04-20 23:37:44.712755', 8),
(9, 'Sent', 'Welcome to multiverzum.com', 2, '2023-04-26 21:23:22.957219', 0, '2023-04-26 21:23:22.957259', 9);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `customer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `status` varchar(50) NOT NULL,
  `item_description` varchar(100) DEFAULT NULL,
  `item_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile_like`
--

CREATE TABLE `profile_like` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `liked_by_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `profile_like`
--

INSERT INTO `profile_like` (`id`, `date_created`, `is_deleted`, `liked_by_id`, `user_id`) VALUES
(1, '2023-04-20 20:32:11.240472', 0, 2, 6),
(2, '2023-04-20 23:31:08.765567', 0, 7, 7),
(3, '2023-04-21 19:02:46.590059', 0, 8, 7),
(4, '2023-04-21 19:02:58.014629', 0, 8, 6),
(5, '2023-04-21 19:03:42.883053', 0, 8, 3),
(6, '2023-04-21 19:05:23.329052', 0, 7, 6),
(7, '2023-04-21 19:05:31.058131', 0, 7, 3),
(8, '2023-04-21 19:08:58.826349', 0, 2, 3),
(9, '2023-04-21 19:09:27.961072', 0, 2, 7),
(10, '2023-04-21 19:10:59.430716', 0, 3, 7),
(11, '2023-04-21 19:11:10.489222', 0, 3, 6),
(12, '2023-04-21 19:11:40.707453', 0, 3, 3),
(13, '2023-04-22 20:55:47.160971', 0, 3, 2),
(14, '2023-04-23 18:27:22.098081', 1, 7, 2),
(15, '2023-04-25 12:36:49.619753', 0, 1, 3),
(16, '2023-04-27 19:10:18.581141', 0, 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `search_recommendation`
--

CREATE TABLE `search_recommendation` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `query` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `search_recommendation`
--

INSERT INTO `search_recommendation` (`id`, `date_created`, `is_deleted`, `query`) VALUES
(1, '2023-04-17 17:49:04.699021', 0, 'T-shirts for Men'),
(2, '2023-04-17 17:49:10.781548', 0, 'T-shirts for Women'),
(3, '2023-04-17 17:49:32.371892', 0, 'Guitar Picks'),
(4, '2023-04-18 22:38:02.545580', 0, 'Sweatpants'),
(5, '2023-04-18 22:38:11.116401', 0, 'Socks'),
(6, '2023-04-18 22:39:07.492287', 0, 'Sweatshirts'),
(7, '2023-04-18 22:59:02.224131', 0, 'Funny Socks'),
(9, '2023-04-18 22:46:53.878602', 0, 'Wallets'),
(10, '2023-04-18 22:47:14.896951', 0, 'Coffe Mugs'),
(11, '2023-04-18 22:47:25.104144', 0, 'Mouses'),
(12, '2023-04-18 22:47:50.097551', 0, 'Notebooks'),
(13, '2023-04-18 22:58:17.126472', 0, 'Tote Bags'),
(14, '2023-04-18 22:48:41.496992', 0, 'Backpacks'),
(15, '2023-04-18 22:50:47.571828', 0, 'Phone Cases - Huawei'),
(16, '2023-04-18 22:51:08.535174', 0, 'Phone Cases - Samsung'),
(17, '2023-04-18 22:51:24.014348', 0, 'Phone Cases - iPhone'),
(18, '2023-04-18 22:53:25.834439', 0, 'Pillows'),
(19, '2023-04-18 22:53:53.560386', 0, 'Keychains'),
(20, '2023-04-18 22:57:39.673392', 0, 'Mouse Pads'),
(21, '2023-04-18 22:59:31.153421', 0, 'Mugs'),
(22, '2023-04-18 23:17:35.080872', 0, 'Metallica'),
(23, '2023-04-18 23:18:03.374806', 0, 'Family Guy'),
(24, '2023-04-18 23:18:15.795906', 0, 'Squid Game'),
(25, '2023-04-18 23:18:37.659514', 0, 'Simpsons'),
(26, '2023-04-18 23:19:04.762317', 0, 'Iron Maiden'),
(27, '2023-04-18 23:20:54.223849', 0, 'Guns N\' Roses');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `orders_requested` int(11) NOT NULL,
  `orders_delivered` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `shop_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `location` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` bigint(20) NOT NULL,
  `size_name` varchar(20) NOT NULL,
  `size_group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `size_group`
--

CREATE TABLE `size_group` (
  `id` bigint(20) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `group_description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `socialaccount_socialapp`
--

INSERT INTO `socialaccount_socialapp` (`id`, `provider`, `name`, `client_id`, `secret`, `key`) VALUES
(1, 'google', 'multiverzum', '112236713596-fjc33ii2l4arm07r9jn55r45197j7p4a.apps.googleusercontent.com', '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', '112236713596-fjc33ii2l4arm07r9jn55r45197j7p4a.apps.googleusercontent.com');

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_seller` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `description` varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `password`, `email`, `username`, `first_name`, `last_name`, `date_joined`, `last_login`, `is_active`, `is_superuser`, `is_staff`, `is_admin`, `is_seller`, `is_deleted`, `profile_image`, `description`) VALUES
(1, 'pbkdf2_sha256$390000$pW3k5VfSJVjOd1lkaOLj9i$Hx+LgZvU5Nw+eezaqCp+5enhRVi/2GpffDFLKxUMXgE=', 'test@multiverzum.com', 'multiverzumTest', '', '', '2023-04-15 11:30:00.456148', '2023-04-15 11:30:00.456141', 1, 0, 0, 0, 0, 0, 'user/profile_images/multiverzum/empty-cart.png', 'Welcome to our eCommerce platform! I\'m Nenad, the admin of this website, and I\'m here to ensure that your shopping experience is smooth and hassle-free. Our eCommerce store offers a wide range of high-quality products at affordable prices, and we\'re constantly updating our inventory to provide you with the latest trends and must-have items. As an eCommerce admin, I\'m committed to ensuring that your personal information and payment details are always secure when you shop with us. Our checkout process is easy to use, and we offer a variety of payment options to make your shopping experience as convenient as possible. If you have any questions or concerns about our products or services, please don\'t hesitate to contact me. I\'m always happy to assist you with any inquiries you may have. Thank you for choosing our eCommerce platform, and happy shopping!\r\n'),
(2, 'pbkdf2_sha256$390000$Y7dHhwyVs2qjIwZO4108LO$ihNyYtj9TYCkTnTshAuZ/NneYqquS/hLJhAfF0DyG8E=', 'admin@multiverzum.com', 'multiverzum', 'Multiverzum', 'Admin', '2023-04-20 19:14:07.643683', '2023-04-26 22:02:42.977097', 1, 1, 1, 1, 0, 0, 'user/profile_images/multiverzum/logo-icon.png', 'Welcome to our eCommerce platform! I\'m Nenad, the admin of this website, and I\'m here to ensure that your shopping experience is smooth and hassle-free. Our eCommerce store offers a wide range of high-quality products at affordable prices, and we\'re constantly updating our inventory to provide you with the latest trends and must-have items.\r\n\r\nAs an eCommerce admin, I\'m committed to ensuring that your personal information and payment details are always secure when you shop with us. Our checkout process is easy to use, and we offer a variety of payment options to make your shopping experience as convenient as possible.\r\n\r\nIf you have any questions or concerns about our products or services, please don\'t hesitate to contact me. I\'m always happy to assist you with any inquiries you may have. Thank you for choosing our eCommerce platform, and happy shopping!'),
(3, 'pbkdf2_sha256$390000$4VwBOztjttoleGzw4d4QXV$8iaDd9j4RXRgK9OcbsminhjLiHSGBdAts+zdMCR6wJ0=', 'nenadblagovcanin2@gmail.com', 'simpleDesign', 'Nenad', 'Blagovcanin', '2023-04-15 12:10:16.386262', '2023-04-26 10:24:20.375246', 1, 0, 0, 0, 1, 0, 'user/profile_images/simpleDesign/005.jpg', 'Welcome to my seller profile, simpleDesign! I\'m dedicated to creating custom products that are as unique as you are. From phone cases to keyboards and everything in between, I offer a wide range of customizable options to help you create the perfect product that fits your style and personality.\r\n\r\nAs a skilled designer and craftsman, I\'m committed to using only the highest quality materials and technology to create products that are not only beautiful but also durable and long-lasting. My passion for design and attention to detail ensures that every product I create is a true work of art.'),
(4, 'pbkdf2_sha256$390000$AQiBzTiii4RBCPD8T3s2v4$4PWUnfSyB32vD2LLCabmpwrrxs1IPm00nmN4xE1Qy7U=', 'test@test.com', 'test_user', '', '', '2023-04-15 23:02:19.547528', '2023-04-15 23:02:19.804686', 1, 0, 0, 0, 0, 0, '/user/profile_images/profile.svg', 'Enter more about yourself...'),
(5, 'pbkdf2_sha256$390000$rSMJyTYiYKH3XmBsITSjMG$ygJN9gsiEYBIU22UQ6PiCcdSGJyuPB6ViEMpVPlB6mo=', 'test@abc.com', 'nenad2807', '', '', '2023-04-15 23:06:13.632275', '2023-04-15 23:06:13.882337', 1, 0, 0, 0, 0, 0, '/user/profile_images/profile.svg', 'Enter more about yourself...'),
(6, 'pbkdf2_sha256$390000$zM06HssGuSSGLvU3ezA904$ATu1byX4WBeUEPUSsOnrCGyKt9kI9vHlTsZFsmqnYzE=', 'natalija.cinco@multiverzum.com', 'NC', '', '', '2023-04-17 21:54:02.583125', '2023-04-18 20:10:54.347679', 1, 0, 1, 1, 1, 0, '/user/profile_images/profile.svg', 'Enter more about yourself...'),
(7, 'pbkdf2_sha256$390000$zdN5OeAzAlySH2B3FJcc1x$Ga2glpYlALg1ZNn4+pHT56CsukASTq1SexqfC/tQ+90=', 'crafty-softy@gmail.com', 'CraftySofty', '', '', '2023-04-20 23:29:19.391841', '2023-04-23 12:39:19.434270', 1, 0, 0, 0, 1, 0, 'user/profile_images/CraftySofty/pattern-7932239_1920.jpg', 'Welcome to my e-commerce store! \r\nAs a seller, I strive to provide high-quality products and excellent customer service. With years of experience in the industry, I understand the importance of creating a seamless buying experience for my customers. From the moment you land on my page, you\'ll be met with a wide range of unique and high-quality products that cater to your every need. I am dedicated to making sure that you are satisfied with your purchase and am always available to answer any questions you may have.\r\nThank you for visiting my store, and I look forward to serving you!'),
(8, 'pbkdf2_sha256$390000$z64t8j6GVG5H198DxAZUww$CvU7cLS1MtGLo8vO+nO8ik+sj39e5rN5vPoy8L77/Bs=', 'ladiescart@gmail.com', 'LadiesCart', '', '', '2023-04-20 23:45:02.713864', '2023-04-21 19:02:24.047656', 1, 0, 0, 0, 1, 0, 'user/profile_images/LadiesCart/shopping-1400845_1280.png', 'Hello and welcome to my e-commerce store! As a seller of female products, I am committed to providing a wide range of high-quality products that cater to the unique needs and preferences of women. From beauty and skincare to fashion and accessories, my store offers an extensive collection of products that are carefully selected to meet the diverse needs of my customers. I understand that shopping for female products can be overwhelming, which is why I am committed to providing a seamless and stress-free shopping experience for my customers. I am dedicated to ensuring that you are satisfied with your purchase, and I am always available to answer any questions or concerns you may have.\r\n Thank you for choosing my store, and I look forward to serving you!'),
(9, 'pbkdf2_sha256$390000$M35u0nxbF3SCjeGADaWz9V$SlKkuDdgbk9Jyi2Ka7oky/1RO+NQ3ptvcaaD7PnRxic=', 'myshirts@gmail.com', 'Megaprint', 'Mega', 'Print', '2023-04-26 22:56:50.676686', '2023-04-26 22:56:50.676679', 1, 0, 0, 0, 1, 0, 'user/profile_images/Megaprint/mega.png', 'Welcome to our online clothing store! We specialize in offering stylish and comfortable t-shirts, sweatshirts, and other apparel that are perfect for everyday wear. Our collection features a wide range of designs, colors, and sizes to fit all body types and personal styles.\r\nAt our store, we believe in providing our customers with high-quality products that are not only trendy but also durable and long-lasting. That\'s why we source our materials from trusted suppliers and use the latest printing techniques to ensure that our designs stay vibrant even after multiple washes.\r\nIn addition to our fantastic products, we pride ourselves on providing exceptional customer service. If you have any questions or concerns about your purchase, our friendly team is always here to assist you. We strive to make your shopping experience with us as easy and enjoyable as possible.\r\nThank you for visiting our store, and we look forward to helping you find the perfect piece for your wardrobe!\r\n\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL,
  `country` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `address_2` varchar(250) DEFAULT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `state_or_region` varchar(250) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `views` int(11) NOT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `country`, `city`, `address`, `address_2`, `phone_number`, `state_or_region`, `zip_code`, `user_id`, `views`, `shop_id`) VALUES
(1, 'Bosna i Hercegovina', 'Istocno Sarajevo', '', NULL, '066934835', NULL, NULL, 2, 0, NULL),
(2, 'Bosna i Hercegovina', 'Istocno Sarajevo', 'Karadjordjeva 6V', NULL, '066934835', NULL, NULL, 3, 0, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, NULL),
(6, 'None', 'Sarajevo', 'None', NULL, '', NULL, NULL, 7, 0, NULL),
(7, 'None', 'None', 'None', NULL, '', NULL, NULL, 8, 0, NULL),
(8, 'None', 'None', 'None', NULL, '', NULL, NULL, 9, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_wishes`
--

CREATE TABLE `user_wishes` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_wishes`
--

INSERT INTO `user_wishes` (`id`, `date_created`, `is_deleted`, `item_id`, `user_id`) VALUES
(1, '2023-04-26 15:23:52.388047', 1, 6, 3),
(2, '2023-04-18 00:55:01.930628', 0, 12, 5),
(3, '2023-04-21 10:51:55.485621', 1, 25, 2),
(4, '2023-04-21 16:12:41.510620', 1, 20, 8),
(5, '2023-04-26 14:53:16.860104', 1, 28, 3),
(6, '2023-04-22 15:20:11.992823', 0, 26, 3),
(7, '2023-04-23 15:36:09.382431', 1, 34, 7),
(8, '2023-04-24 23:21:57.462371', 0, 30, 3),
(9, '2023-04-25 02:07:00.161048', 0, 19, 3),
(10, '2023-04-25 12:35:02.557298', 0, 29, 1),
(11, '2023-04-25 12:35:07.452527', 0, 33, 1),
(12, '2023-04-26 14:53:20.231763', 0, 28, 3),
(13, '2023-04-27 10:40:49.052281', 0, 8, 9),
(14, '2023-04-27 12:00:23.261785', 0, 8, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_user_id` (`user_id`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

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
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_item_item_id_da83ee7e_fk_item_id` (`item_id`),
  ADD KEY `cart_item_user_id_70f45bd5_fk_user_id` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_parent_id_6d39ea7f_fk_category_id` (`parent_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`);

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
-- Indexes for table `filter`
--
ALTER TABLE `filter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_seller_id_ec81cf15_fk_user_id` (`seller_id`),
  ADD KEY `item_category_id_03b07192_fk_category_id` (`category_id`);

--
-- Indexes for table `item_filter`
--
ALTER TABLE `item_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_filter_filter_id_795ba774_fk_filter_id` (`filter_id`),
  ADD KEY `item_filter_item_id_a3a11337_fk_item_id` (`item_id`);

--
-- Indexes for table `item_image`
--
ALTER TABLE `item_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_image_item_id_baf91217_fk_item_id` (`item_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_sender_id_a2a2e825_fk_user_id` (`sender_id`),
  ADD KEY `message_receiver_id_763b350f_fk_user_id` (`receiver_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_customer_id_9da9253f_fk_user_id` (`customer_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_item_id_292542ad_fk_item_id` (`item_id`),
  ADD KEY `order_items_order_id_412ad78b_fk_order_id` (`order_id`),
  ADD KEY `order_items_seller_id_6b9fd548_fk_user_id` (`seller_id`);

--
-- Indexes for table `profile_like`
--
ALTER TABLE `profile_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_like_liked_by_id_cfa61365_fk_user_id` (`liked_by_id`),
  ADD KEY `profile_like_user_id_7de36bb8_fk_user_id` (`user_id`);

--
-- Indexes for table `search_recommendation`
--
ALTER TABLE `search_recommendation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_shop_id_1ccbf0a1_fk_shop_id` (`shop_id`),
  ADD KEY `seller_user_id_id_fa97e50b_fk_user_id` (`user_id_id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `size_size_group_id_8a258469_fk_size_group_id` (`size_group_id`);

--
-- Indexes for table `size_group`
--
ALTER TABLE `size_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  ADD KEY `socialaccount_socialaccount_user_id_8146e70c_fk_user_id` (`user_id`);

--
-- Indexes for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  ADD KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_info_user_id_5aed5314_fk_user_id` (`user_id`),
  ADD KEY `user_info_shop_id_008cb3cd_fk_shop_id` (`shop_id`);

--
-- Indexes for table `user_wishes`
--
ALTER TABLE `user_wishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_wishes_item_id_7e63d41f_fk_item_id` (`item_id`),
  ADD KEY `user_wishes_user_id_b6ad3d7b_fk_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;

--
-- AUTO_INCREMENT for table `filter`
--
ALTER TABLE `filter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `item_filter`
--
ALTER TABLE `item_filter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `item_image`
--
ALTER TABLE `item_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile_like`
--
ALTER TABLE `profile_like`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `search_recommendation`
--
ALTER TABLE `search_recommendation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `size_group`
--
ALTER TABLE `size_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_wishes`
--
ALTER TABLE `user_wishes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

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
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_item_id_da83ee7e_fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `cart_item_user_id_70f45bd5_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_parent_id_6d39ea7f_fk_category_id` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_category_id_03b07192_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `item_seller_id_ec81cf15_fk_user_id` FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `item_filter`
--
ALTER TABLE `item_filter`
  ADD CONSTRAINT `item_filter_filter_id_795ba774_fk_filter_id` FOREIGN KEY (`filter_id`) REFERENCES `filter` (`id`),
  ADD CONSTRAINT `item_filter_item_id_a3a11337_fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

--
-- Constraints for table `item_image`
--
ALTER TABLE `item_image`
  ADD CONSTRAINT `item_image_item_id_baf91217_fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_receiver_id_763b350f_fk_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `message_sender_id_a2a2e825_fk_user_id` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_customer_id_9da9253f_fk_user_id` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_items_item_id_292542ad_fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `order_items_order_id_412ad78b_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_items_seller_id_6b9fd548_fk_user_id` FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `profile_like`
--
ALTER TABLE `profile_like`
  ADD CONSTRAINT `profile_like_liked_by_id_cfa61365_fk_user_id` FOREIGN KEY (`liked_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `profile_like_user_id_7de36bb8_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_shop_id_1ccbf0a1_fk_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`),
  ADD CONSTRAINT `seller_user_id_id_fa97e50b_fk_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `size`
--
ALTER TABLE `size`
  ADD CONSTRAINT `size_size_group_id_8a258469_fk_size_group_id` FOREIGN KEY (`size_group_id`) REFERENCES `size_group` (`id`);

--
-- Constraints for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `user_info_shop_id_008cb3cd_fk_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`),
  ADD CONSTRAINT `user_info_user_id_5aed5314_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_wishes`
--
ALTER TABLE `user_wishes`
  ADD CONSTRAINT `user_wishes_item_id_7e63d41f_fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `user_wishes_user_id_b6ad3d7b_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
