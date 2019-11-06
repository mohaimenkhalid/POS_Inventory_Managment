-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 06, 2019 at 11:29 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory-vue`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Phone', '2019-08-03 09:36:24', '2019-08-03 09:36:24'),
(3, 'Monitor', '2019-08-03 09:51:07', '2019-08-04 12:01:14'),
(4, 'Laptop', '2019-08-04 12:01:06', '2019-08-04 12:01:06'),
(5, 'Watch', '2019-08-04 12:01:20', '2019-08-04 12:01:20'),
(6, 'Ram', '2019-08-04 12:01:28', '2019-08-04 12:01:28'),
(7, 'Keyboard', '2019-08-04 12:01:43', '2019-08-04 12:01:43'),
(8, 'Motherboard', '2019-08-04 19:27:39', '2019-08-04 19:27:39'),
(9, 'Processor', '2019-08-04 19:27:46', '2019-08-04 19:27:46'),
(10, 'SSD/HHD', '2019-08-04 19:28:28', '2019-08-04 19:28:28'),
(11, 'Camera', '2019-08-04 19:28:58', '2019-08-04 19:28:58'),
(12, 'Headphone', '2019-08-04 19:38:29', '2019-08-04 19:38:29'),
(13, 'Fridge', '2019-08-04 19:38:44', '2019-08-04 19:38:44'),
(14, 'AC', '2019-08-04 19:38:53', '2019-08-04 19:38:53'),
(15, 'TV', '2019-08-04 19:40:58', '2019-08-04 19:40:58'),
(16, 'Other', '2019-08-04 19:43:04', '2019-08-04 19:43:04');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'asaduzzaman', 'asadur@gmail.com', '0155555666', 'dhaka', 'backend/images/customer/1564938027.png', '2019-08-04 10:42:33', '2019-08-04 11:00:27'),
(2, 'Munna', 'munna@gmail.com', '0155588555', 'dhaka', 'backend/images/customer/1564937011.png', '2019-08-04 10:43:31', '2019-08-04 10:43:31'),
(3, 'polash', 'polash@gmail.com', '0155585552', 'mymensingh', 'backend/images/customer/1564937044.png', '2019-08-04 10:44:04', '2019-08-04 10:44:04'),
(4, 'Ali', 'ali@gmail.com', '53763746354', 'khulna', 'backend/images/customer/1564937072.png', '2019-08-04 10:44:32', '2019-08-04 10:44:32'),
(5, 'Himel', 'himel@gmail.com', '04556564', 'khulna', 'backend/images/customer/1564937091.png', '2019-08-04 10:44:51', '2019-08-04 10:44:51'),
(8, 'mohaimen', 'mohaimen@gmail.com', '01528383483', 'dhaka', 'backend/images/customer/1564997650.png', '2019-08-05 03:34:11', '2019-08-05 03:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` int(11) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `salary`, `address`, `nid`, `joining_date`, `photo`, `created_at`, `updated_at`) VALUES
(2, 'khalid', 'khalid@gmail.com', '0179856555', 500000, 'dhaka', '12451054564501654', '2019-08-05', 'backend/images/employee/1564680793.jpeg', '2019-08-01 11:33:14', '2019-08-02 14:24:29'),
(6, 'Shohag', 'test@gmail.com', '5585654555', 5555, 'test..', '25414154545121544', '2019-08-02', 'backend/images/employee/1564783551.png', '2019-08-02 04:38:41', '2019-08-02 16:05:51'),
(7, 'Demo', 'gyjj@gmail.com', '655465465966', 757567, 'dgzdgrdgb', '5453453453', '2019-08-02', 'backend/images/employee/1564783561.png', '2019-08-02 05:24:55', '2019-08-02 16:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE `extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extras`
--

INSERT INTO `extras` (`id`, `vat`, `logo`, `favicon`, `phone`, `email`, `Address`, `created_at`, `updated_at`) VALUES
(1, '4', '', '', '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_01_134124_create_employees_table', 2),
(4, '2019_08_02_205855_create_suppliers_table', 3),
(5, '2019_08_03_150729_create_categories_table', 4),
(6, '2019_08_03_164224_create_products_table', 5),
(8, '2019_08_03_212007_create_expenses_table', 6),
(9, '2019_08_04_082248_create_salaries_table', 7),
(10, '2019_08_04_162142_create_customers_table', 8),
(11, '2019_08_05_112112_create_pos_table', 9),
(12, '2019_08_05_184303_create_extras_table', 10),
(13, '2019_08_06_171017_create_orders_table', 11),
(14, '2019_08_06_171129_create_order_details_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `qty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payby` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `qty`, `sub_total`, `vat`, `total`, `pay`, `due`, `payby`, `order_date`, `order_month`, `order_year`, `created_at`, `updated_at`) VALUES
(7, 1, '4', '166400', '4', '173056', '567587', '565', 'HandCash', '06/08/2019', 'August', '2019', NULL, NULL),
(8, 1, '4', '166400', '4', '173056', '4564564', '6456', 'HandCash', '06/08/2019', 'August', '2019', NULL, NULL),
(9, 8, '1', '30000', '4', '31200', '31200', '0', 'HandCash', '07/08/2019', 'August', '2019', NULL, NULL),
(10, 4, '2', '40900', '4', '42536', '40000', '2536', 'HandCash', '07/08/2019', 'August', '2019', NULL, NULL),
(11, 2, '5', '132700', '4', '138008', '130000', '8008', 'HandCash', '07/08/2019', 'August', '2019', NULL, NULL),
(12, 8, '1', '3200', '4', '3328', '3328', '0', 'HandCash', '07/08/2019', 'August', '2019', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `pro_qantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `pro_qantity`, `pro_price`, `sub_total`, `created_at`, `updated_at`) VALUES
(7, 7, 31, '2', '7200', '14400', NULL, NULL),
(8, 7, 29, '2', '76000', '152000', NULL, NULL),
(9, 8, 31, '2', '7200', '14400', NULL, NULL),
(10, 8, 29, '2', '76000', '152000', NULL, NULL),
(11, 9, 18, '1', '30000', '30000', NULL, NULL),
(12, 10, 13, '1', '10900', '10900', NULL, NULL),
(13, 10, 14, '1', '30000', '30000', NULL, NULL),
(14, 11, 31, '1', '7200', '7200', NULL, NULL),
(15, 11, 30, '1', '18000', '18000', NULL, NULL),
(16, 11, 29, '1', '76000', '76000', NULL, NULL),
(17, 11, 28, '1', '1500', '1500', NULL, NULL),
(18, 11, 23, '1', '30000', '30000', NULL, NULL),
(19, 12, 27, '1', '3200', '3200', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `root` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buying_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buying_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `supplier_id`, `product_name`, `product_code`, `root`, `buying_price`, `selling_price`, `buying_date`, `product_quantity`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'iphone X', 'i0123', 'S-1', '50000', '60000', '2019-08-04', '10', 'backend/images/product/1564865262.jpeg', '2019-08-03 14:08:03', '2019-08-03 14:47:42'),
(3, 1, 1, 'Samsung', 's01234', 'S-2', '40000', '80000', '2019-08-04', '5', 'backend/images/product/1564865451.jpeg', '2019-08-03 14:43:53', '2019-08-03 14:50:51'),
(6, 1, 3, 'samsung j6', 's122', 'S-2', '12000', '14000', '2019-08-04', '5', 'backend/images/product/1564865801.jpeg', '2019-08-03 14:56:42', '2019-08-03 14:56:42'),
(7, 1, 4, 'iphone 6', 'i254', 'S-1', '25000', '33000', '2019-08-04', '100', 'backend/images/product/1564865907.jpeg', '2019-08-03 14:58:27', '2019-08-04 09:36:10'),
(8, 7, 4, 'web camera', 'c-4654', 'C-1', '4000', '5000', '2019-08-04', '12', 'backend/images/product/1564866007.jpeg', '2019-08-03 15:00:07', '2019-08-04 15:57:48'),
(9, 4, 1, 'Hp 8480 laptop', 'lao-1001', 'L-1', '30000', '34000', '2019-08-05', '10', 'backend/images/product/1564941779.jpeg', '2019-08-04 12:02:59', '2019-08-04 12:02:59'),
(10, 4, 1, 'Asus Laptop', 'lap-0236', 'L-1', '25000', '30000', '2019-08-05', '0', 'backend/images/product/1564941845.webp', '2019-08-04 12:04:05', '2019-08-04 12:04:05'),
(11, 6, 3, 'ADATA Ram 4GB', 'r-124', 'R-1', '2000', '2500', '2019-08-05', '60', 'backend/images/product/1564941960.jpeg', '2019-08-04 12:06:00', '2019-08-04 12:06:00'),
(12, 6, 4, 'Transet Ram 8GB', 'r-1001', 'R-2', '3400', '4400', '2019-08-05', '20', 'backend/images/product/1564942013.jpeg', '2019-08-04 12:06:53', '2019-08-04 12:06:53'),
(13, 3, 3, 'Dell 22\'\' monitor', 'D-1012', 'M-2', '8000', '10900', '2019-08-05', '19', 'backend/images/product/1564942130.jpeg', '2019-08-04 12:08:50', '2019-08-07 06:04:35'),
(14, 3, 3, 'Dell 24\" monitor', 'd-5685', 'M-1', '25000', '30000', '2019-08-05', '11', 'backend/images/product/1564942178.jpeg', '2019-08-04 12:09:38', '2019-08-07 06:04:35'),
(15, 3, 4, 'Dell 18\" monitor', 'd-586', 'M-1', '4000', '5000', '2019-08-05', '30', 'backend/images/product/1564942217.jpeg', '2019-08-04 12:10:17', '2019-08-04 12:10:17'),
(16, 3, 4, 'Dell 18.5\" monitor', 'm-4441', 'M-2', '5500', '6500', '2019-08-05', '42', 'backend/images/product/1564942261.jpeg', '2019-08-04 12:11:01', '2019-08-04 12:11:01'),
(17, 5, 4, 'Apple watch series 4', 'A-101', 'W-1', '34000', '44000', '2019-08-05', '5', 'backend/images/product/1564942374.webp', '2019-08-04 12:12:54', '2019-08-04 12:12:54'),
(18, 5, 3, 'Apple watch series 3', 'A-456', 'W-1', '25000', '30000', '2019-08-05', '0', 'backend/images/product/1564942421.jpeg', '2019-08-04 12:13:41', '2019-08-07 05:51:08'),
(19, 1, 1, 'Xiaomi Note 7 4/64GB', 'X-1254', 'X-1', '17000', '21000', '2019-08-05', '60', 'backend/images/product/1564968149.png', '2019-08-04 19:22:29', '2019-08-04 19:22:29'),
(20, 1, 4, 'Samsung Note 9', 'S-45774', 'S-1', '64000', '74000', '2019-08-05', '12', 'backend/images/product/1564968204.jpeg', '2019-08-04 19:23:25', '2019-08-04 19:23:25'),
(21, 7, 1, 'keyboard A4tech', 'K-1545', 'K-1', '1200', '2200', '2019-08-05', '42', 'backend/images/product/1564968427.png', '2019-08-04 19:27:07', '2019-08-04 19:27:07'),
(22, 8, 3, 'Gigabyte HG-8568', 'G-573547', 'MO-1', '12000', '15000', '2019-08-05', '20', 'backend/images/product/1564968664.png', '2019-08-04 19:31:04', '2019-08-04 19:31:04'),
(23, 14, 4, 'Samsung AC', 'AC-548', 'G-1', '25000', '30000', '2019-08-05', '19', 'backend/images/product/1564969197.jpeg', '2019-08-04 19:39:57', '2019-08-07 13:11:06'),
(24, 12, 1, 'samsung Headphone', 'He-46875', 'T-1', '800', '1200', '2019-08-05', '50', 'backend/images/product/1564969242.png', '2019-08-04 19:40:42', '2019-08-04 19:40:42'),
(25, 15, 4, 'Lg LED tv 40\"', 'T-5465', 'G-5', '50000', '60000', '2019-08-05', '15', 'backend/images/product/1564969316.jpeg', '2019-08-04 19:41:56', '2019-08-04 19:41:56'),
(26, 12, 1, 'mini headphone', 'he-855', 'H-1', '500', '800', '2019-08-05', '60', 'backend/images/product/1564969362.jpeg', '2019-08-04 19:42:42', '2019-08-04 19:42:42'),
(27, 16, 5, 'Blander mini', 'BL-8569', 'K-4', '2200', '3200', '2019-08-05', '21', 'backend/images/product/1564969433.png', '2019-08-04 19:43:53', '2019-08-07 13:11:32'),
(28, 16, 1, 'Dry Iron', 'FF-85', 'K-1', '800', '1500', '2019-08-05', '12', 'backend/images/product/1564969484.png', '2019-08-04 19:44:45', '2019-08-07 13:11:06'),
(29, 11, 3, 'Nikon D5600', 'CA-586', 'C-1', '56000', '76000', '2019-08-05', '13', 'backend/images/product/1564969598.jpeg', '2019-08-04 19:46:39', '2019-08-07 13:11:06'),
(30, 11, 4, 'nikon coolpix', 'N-8757', 'CA-1', '14000', '18000', '2019-08-05', '7', 'backend/images/product/1564969660.jpeg', '2019-08-04 19:47:40', '2019-08-07 13:11:05'),
(31, 10, 3, 'western green 2T', 'HDD-56655', 'H-5', '5200', '7200', '2019-08-05', '33', 'backend/images/product/1564969771.jpeg', '2019-08-04 19:49:31', '2019-08-07 13:11:05');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`id`, `employee_id`, `amount`, `salary_date`, `salary_month`, `salary_year`, `created_at`, `updated_at`) VALUES
(3, 2, '500000', '04/08/19', 'January', '2019', '2019-08-04 05:53:39', '2019-08-04 05:53:39'),
(4, 6, '5555', '04/08/19', 'January', '2019', '2019-08-04 05:55:00', '2019-08-04 05:55:00'),
(6, 2, '500000', '04/08/19', 'February', '2019', '2019-08-04 06:22:47', '2019-08-04 06:22:47'),
(7, 6, '5555', '04/08/19', 'February', '2019', '2019-08-04 06:22:54', '2019-08-04 06:22:54'),
(8, 7, '757567', '04/08/19', 'February', '2019', '2019-08-04 06:22:58', '2019-08-04 06:22:58'),
(9, 7, '757567', '04/08/19', 'January', '2019', '2019-08-04 08:20:37', '2019-08-04 08:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `address`, `shopname`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Toha Khara', 'toha@gmail.com', '01525555847', 'badda dhaka', 'tohashop', 'backend/images/supplier/1564783128.jpeg', '2019-08-02 15:39:50', '2019-08-02 15:58:48'),
(3, 'Mamun', 'mamun@gmail.com', '0155254555', 'Jamalpur', 'mamun shop', 'backend/images/supplier/1564783443.png', '2019-08-02 16:04:03', '2019-08-02 16:04:03'),
(4, 'kamrul', 'kamrul@gmail.com', '01928558855', 'Jhinaidah', 'kamrul shop', 'backend/images/supplier/1564783486.png', '2019-08-02 16:04:46', '2019-08-02 16:04:46'),
(5, 'dfgxdfg', 'dfgd@dfdf.com', '473273', 'ewawe', 'awfwef', 'backend/images/supplier/1564936873.png', '2019-08-04 10:41:13', '2019-08-04 10:41:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'mohaimen', 'mohaimen707@gmail.com', NULL, '$2y$10$tYwLmLTsCRC1we5HvFozn.xKa23RvhM5wmZH58Ypn.e4Fq5k.0W86', NULL, NULL, NULL),
(2, 'khalid', 'khalid@gmail.com', NULL, '$2y$10$ODW0AXHgctcjhMFXvWwEQ.fMuxGpyyWaTYLib34JRRiCYZpS4Ncxa', NULL, NULL, NULL),
(3, 'khalid', 'mohaimen@gmail.com', NULL, '$2y$10$/YPgbgcNPTPibbKpOkoafeGCCc2JROUOtKb73q8De0z.INZ9UBrF2', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
