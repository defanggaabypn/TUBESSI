-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2021 at 10:41 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubes`
--

-- --------------------------------------------------------

--
-- Table structure for table `130_accounts`
--

CREATE TABLE `130_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_accounts`
--

INSERT INTO `130_accounts` (`id`, `company_id`, `name`, `number`, `currency_code`, `opening_balance`, `bank_name`, `bank_phone`, `bank_address`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'REKENING LSHC', '1', 'IDR', 0.0000, 'BANK CENTRAL ASIA', NULL, NULL, 1, 'core::seed', NULL, '2021-12-06 02:46:20', '2021-12-06 03:03:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_bills`
--

CREATE TABLE `130_bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billed_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_bill_histories`
--

CREATE TABLE `130_bill_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_bill_items`
--

CREATE TABLE `130_bill_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_rate` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_bill_item_taxes`
--

CREATE TABLE `130_bill_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `bill_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_bill_totals`
--

CREATE TABLE `130_bill_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_categories`
--

CREATE TABLE `130_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_categories`
--

INSERT INTO `130_categories` (`id`, `company_id`, `name`, `type`, `color`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Transfer', 'other', '#3c3f72', 1, 'core::seed', NULL, '2021-12-06 02:46:20', '2021-12-06 02:46:20', NULL),
(2, 1, 'Deposit', 'income', '#efad32', 1, 'core::seed', NULL, '2021-12-06 02:46:20', '2021-12-06 02:46:20', NULL),
(3, 1, 'Penjualan', 'income', '#6da252', 1, 'core::seed', NULL, '2021-12-06 02:46:20', '2021-12-06 02:46:20', NULL),
(4, 1, 'Lainnya', 'expense', '#e5e5e5', 1, 'core::seed', NULL, '2021-12-06 02:46:20', '2021-12-06 02:46:20', NULL),
(5, 1, 'Umum', 'item', '#328aef', 1, 'core::seed', NULL, '2021-12-06 02:46:20', '2021-12-06 02:46:20', NULL),
(6, 1, 'Jasa', 'item', '#55588b', 1, 'core::ui', 1, '2021-12-06 03:16:18', '2021-12-06 03:16:18', NULL),
(7, 1, 'Obat', 'item', '#55588b', 1, 'core::ui', 1, '2021-12-06 03:17:14', '2021-12-06 03:17:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_companies`
--

CREATE TABLE `130_companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_companies`
--

INSERT INTO `130_companies` (`id`, `domain`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 1, 'core::ui', NULL, '2021-12-06 02:46:19', '2021-12-06 02:46:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_contacts`
--

CREATE TABLE `130_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_contacts`
--

INSERT INTO `130_contacts` (`id`, `company_id`, `type`, `name`, `email`, `user_id`, `tax_number`, `phone`, `address`, `city`, `zip_code`, `state`, `country`, `website`, `currency_code`, `enabled`, `reference`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'customer', 'Defangga Aby Vonega', 'defanggaabyvonega@gmail.com', NULL, NULL, NULL, 'Jl. Jend. Ahmad Yani No.009, Bandar Jaya Barat\nKec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163', NULL, NULL, NULL, 'ID', NULL, 'IDR', 1, NULL, 'core::ui', 1, '2021-12-06 03:04:40', '2021-12-06 03:04:40', NULL),
(2, 1, 'vendor', 'Vendor Testing', 'apt@rahayu.com', NULL, NULL, '085357542851', 'Jl. Jend. Ahmad Yani No.009, Bandar Jaya Barat\nKec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163', 'Lampung Tengah', '34163', 'Lampung', 'ID', NULL, 'IDR', 1, NULL, 'core::ui', 1, '2021-12-06 03:34:43', '2021-12-06 03:44:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_currencies`
--

CREATE TABLE `130_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,8) NOT NULL,
  `precision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_first` int(11) NOT NULL DEFAULT 1,
  `decimal_mark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_currencies`
--

INSERT INTO `130_currencies` (`id`, `company_id`, `name`, `code`, `rate`, `precision`, `symbol`, `symbol_first`, `decimal_mark`, `thousands_separator`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Dolar Amerika Serikat', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, 'core::seed', NULL, '2021-12-06 02:46:20', '2021-12-06 02:46:20', NULL),
(2, 1, 'Euro', 'EUR', 1.25000000, '2', '€', 1, ',', '.', 0, 'core::seed', NULL, '2021-12-06 02:46:20', '2021-12-06 02:48:04', NULL),
(3, 1, 'Pound sterling Inggris', 'GBP', 1.60000000, '2', '£', 1, '.', ',', 0, 'core::seed', NULL, '2021-12-06 02:46:20', '2021-12-06 02:48:05', NULL),
(4, 1, 'Lira Turki', 'TRY', 0.80000000, '2', '₺', 1, ',', '.', 0, 'core::seed', NULL, '2021-12-06 02:46:20', '2021-12-06 02:48:05', NULL),
(5, 1, 'Rupiah', 'IDR', 1.00000000, '0', 'Rp', 1, ',', '.', 1, 'core::ui', 1, '2021-12-06 02:51:03', '2021-12-06 02:51:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_dashboards`
--

CREATE TABLE `130_dashboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_dashboards`
--

INSERT INTO `130_dashboards` (`id`, `company_id`, `name`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Dasbor', 1, 'core::seed', NULL, '2021-12-06 02:46:23', '2021-12-06 02:46:23', NULL),
(2, 1, 'Dasbor', 1, 'core::seed', 1, '2021-12-06 03:20:54', '2021-12-06 03:20:54', NULL),
(3, 1, 'Dasbor', 1, 'core::seed', 1, '2021-12-06 03:24:42', '2021-12-06 03:24:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_documents`
--

CREATE TABLE `130_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_documents`
--

INSERT INTO `130_documents` (`id`, `company_id`, `type`, `document_number`, `order_number`, `status`, `issued_at`, `due_at`, `amount`, `currency_code`, `currency_rate`, `category_id`, `contact_id`, `contact_name`, `contact_email`, `contact_tax_number`, `contact_phone`, `contact_address`, `contact_city`, `contact_zip_code`, `contact_state`, `contact_country`, `notes`, `footer`, `parent_id`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'invoice', 'INV-00001', '1', 'draft', '2021-12-06 10:19:04', '2021-12-07 10:19:04', 1515000.0000, 'IDR', 1.00000000, 2, 1, 'Defangga Aby Vonega', 'defanggaabyvonega@gmail.com', NULL, NULL, 'Jl. Jend. Ahmad Yani No.009, Bandar Jaya Barat\nKec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163', NULL, NULL, NULL, 'ID', NULL, 'Lampung Sport Helath Center', 0, 'core::ui', 1, '2021-12-06 03:19:04', '2021-12-06 03:19:05', NULL),
(2, 1, 'invoice', 'INV-00002', NULL, 'draft', '2021-12-07 08:53:45', '2021-12-07 08:53:45', 220000.0000, 'IDR', 1.00000000, 2, 1, 'Defangga Aby Vonega', 'defanggaabyvonega@gmail.com', NULL, NULL, 'Jl. Jend. Ahmad Yani No.009, Bandar Jaya Barat\nKec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163', NULL, NULL, NULL, 'ID', NULL, NULL, 0, 'core::ui', 1, '2021-12-07 01:53:46', '2021-12-07 01:53:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_document_histories`
--

CREATE TABLE `130_document_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_document_histories`
--

INSERT INTO `130_document_histories` (`id`, `company_id`, `type`, `document_id`, `status`, `notify`, `description`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'invoice', 1, 'draft', 0, 'INV-00001 ditambahkan!', 'core::ui', '1', '2021-12-06 03:19:05', '2021-12-06 03:19:05', NULL),
(2, 1, 'invoice', 2, 'draft', 0, 'INV-00002 ditambahkan!', 'core::ui', '1', '2021-12-07 01:53:46', '2021-12-07 01:53:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_document_items`
--

CREATE TABLE `130_document_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `discount_rate` double(15,4) NOT NULL DEFAULT 0.0000,
  `total` double(15,4) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_document_items`
--

INSERT INTO `130_document_items` (`id`, `company_id`, `type`, `document_id`, `item_id`, `name`, `description`, `sku`, `quantity`, `price`, `tax`, `discount_type`, `discount_rate`, `total`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'invoice', 1, 1, 'Sport Injury Massage', 'Sport Injury Massage merupakan rangkaian pijat yang dikhususkan untuk penderita cedera dengan menerapkan ilmu yang tepat sesuai kaidah ilmiah', NULL, 1.00, 1500000.0000, 0.0000, 'percentage', 0.0000, 1500000.0000, 'core::ui', '1', '2021-12-06 03:19:04', '2021-12-06 03:19:04', NULL),
(2, 1, 'invoice', 1, 1, 'Sport Injury Massage', 'Sport Injury Massage merupakan rangkaian pijat yang dikhususkan untuk penderita cedera dengan menerapkan ilmu yang tepat sesuai kaidah ilmiah', NULL, 1.00, 15000.0000, 0.0000, 'percentage', 0.0000, 15000.0000, 'core::ui', '1', '2021-12-06 03:19:04', '2021-12-06 03:19:04', NULL),
(3, 1, 'invoice', 2, 2, 'Paracetamol', 'Parasetamol atau asetaminofen adalah obat analgesik dan antipiretik yang banyak dipakai untuk meredakan sakit kepala ringan akut, nyeri ringan hingga sedang, serta demam.', NULL, 1.00, 20000.0000, 0.0000, 'percentage', 0.0000, 20000.0000, 'core::ui', '1', '2021-12-07 01:53:46', '2021-12-07 01:53:46', NULL),
(4, 1, 'invoice', 2, 1, 'Sport Injury Massage', 'Sport Injury Massage merupakan rangkaian pijat yang dikhususkan untuk penderita cedera dengan menerapkan ilmu yang tepat sesuai kaidah ilmiah', NULL, 1.00, 200000.0000, 0.0000, 'percentage', 0.0000, 200000.0000, 'core::ui', '1', '2021-12-07 01:53:46', '2021-12-07 01:53:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_document_item_taxes`
--

CREATE TABLE `130_document_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL,
  `document_item_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_document_totals`
--

CREATE TABLE `130_document_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_document_totals`
--

INSERT INTO `130_document_totals` (`id`, `company_id`, `type`, `document_id`, `code`, `name`, `amount`, `sort_order`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'invoice', 1, 'sub_total', 'invoices.sub_total', 1515000.0000, 1, 'core::ui', '1', '2021-12-06 03:19:05', '2021-12-06 03:19:05', NULL),
(2, 1, 'invoice', 1, 'total', 'invoices.total', 1515000.0000, 2, 'core::ui', '1', '2021-12-06 03:19:05', '2021-12-06 03:19:05', NULL),
(3, 1, 'invoice', 2, 'sub_total', 'invoices.sub_total', 220000.0000, 1, 'core::ui', '1', '2021-12-07 01:53:46', '2021-12-07 01:53:46', NULL),
(4, 1, 'invoice', 2, 'total', 'invoices.total', 220000.0000, 2, 'core::ui', '1', '2021-12-07 01:53:46', '2021-12-07 01:53:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_email_templates`
--

CREATE TABLE `130_email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_email_templates`
--

INSERT INTO `130_email_templates` (`id`, `company_id`, `alias`, `class`, `name`, `subject`, `body`, `params`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'invoice_new_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_new_customer', '{invoice_number} Faktur dibuat', 'Kepada {customer_name},<br /><br />Kami telah Menyiapkan tagihan kepada Anda sebagai berikut: <strong>{invoice_number}</strong>.<br /><br />Anda dapat melihat rincian tagihan dan dilanjutkan dengan pembayaran dari link berikut ini: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Hubungi Kami Jika ada pertanyaan.<br /><br />Hormat Kami,,<br />{company_name}', NULL, 'core::seed', NULL, '2021-12-06 02:46:20', '2021-12-06 02:46:20', NULL),
(2, 1, 'invoice_remind_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_customer', 'pemberitahuan jatuh tempo tagihan nomor{invoice_number}', 'Kepada {customer_name},<br /><br />Ini adalah pemberitahuan jatuh tempo untuk tagihan nomor <strong>{invoice_number}</strong> invoice.<br /><br />Total tagihannya adalah {invoice_total} dan jatuh tempo pada <strong>{invoice_due_date}</strong>.<br /><br />Anda dapat melihat rincian tagihan dan melanjutkannya dengan pembayaran dengan link berikut ini: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Hormat Kami,<br />{company_name}', NULL, 'core::seed', NULL, '2021-12-06 02:46:21', '2021-12-06 02:46:21', NULL),
(3, 1, 'invoice_remind_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_admin', 'pemberitahuan jatuh tempo tagihan nomor{invoice_number}', 'Hello,<br /><br />{customer_name} telah menerima pemberitahuan jatuh tempo untuk tagihan nomor <strong>{invoice_number}</strong> <br /><br />Total tagihannya adalah {invoice_total} dan jatuh tempo pada <strong>{invoice_due_date}</strong>.<br /><br />Anda dapat melihan rincian tagihan dari link berikut ini: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Hormat Kami,,<br />{company_name}', NULL, 'core::seed', NULL, '2021-12-06 02:46:21', '2021-12-06 02:46:21', NULL),
(4, 1, 'invoice_recur_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_customer', 'tagihan ulang nomor {invoice_number} dibuat', 'Kepada {customer_name},<br /><br />Kami telah mempersiapkan tagihan kepada Anda sebagai berikut: <strong>{invoice_number}</strong>.<br /><br />Anda dapat melihat rincian tagihan dan dilanjutkan dengan pembayaran dari link berikut ini: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Apabila ada pertanyaan harap hubungi kami.<br /><br />Hormat Kami,,<br />{company_name}', NULL, 'core::seed', NULL, '2021-12-06 02:46:21', '2021-12-06 02:46:21', NULL),
(5, 1, 'invoice_recur_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_admin', 'tagihan ulang nomor {invoice_number} dibuat', 'Halo, <br /> <br /> Berdasarkan lingkaran berulang {customer_name}, <strong> {invoice_number} </strong> faktur telah dibuat secara otomatis. <br /> <br /> Anda dapat melihat detail faktur dari tautan berikut: <a href=\"{invoice_admin_link}\"> {invoice_number} </a>. <br /> <br /> Salam, <br /> {company_name}', NULL, 'core::seed', NULL, '2021-12-06 02:46:21', '2021-12-06 02:46:21', NULL),
(6, 1, 'invoice_payment_customer', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_customer', 'Pembayaran diterima untuk faktur {invoice_number}', 'Dear {customer_name}, <br /> <br /> Terima kasih atas pembayarannya. Temukan detail pembayaran di bawah ini: <br /> <br /> ------------------------------------ ------------- <br /> Jumlah: <strong> {transaction_total} </strong> <br /> Tanggal: <strong> {transaction_paid_date} </strong> <br /> Faktur Nomor: <strong> {invoice_number} </strong> <br /> ---------------------------------- --------------- <br /> <br /> Anda selalu dapat melihat detail faktur dari tautan berikut: <a href=\"{invoice_guest_link}\"> {invoice_number} </ a>. <br /> <br /> Jangan ragu untuk menghubungi kami jika ada pertanyaan. <br /> <br /> Salam, <br /> {company_name}', NULL, 'core::seed', NULL, '2021-12-06 02:46:21', '2021-12-06 02:46:21', NULL),
(7, 1, 'invoice_payment_admin', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_admin', 'Pembayaran diterima untuk faktur {invoice_number}', 'Halo, <br /> <br /> Berdasarkan lingkaran berulang {customer_name}, <strong> {invoice_number} </strong> faktur telah dibuat secara otomatis. <br /> <br /> Anda dapat melihat detail faktur dari tautan berikut: <a href=\"{invoice_admin_link}\"> {invoice_number} </a>. <br /> <br /> Salam, <br /> {company_name}', NULL, 'core::seed', NULL, '2021-12-06 02:46:21', '2021-12-06 02:46:21', NULL),
(8, 1, 'bill_remind_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_remind_admin', '{bill_number} pemberitahuan pengingat tagihan', 'Halo, <br /> <br /> Ini adalah pemberitahuan untuk tagihan <strong> {bill_number} </strong> ke {vendor_name}. <br /> <br /> Total tagihan adalah {bill_total} dan sudah jatuh tempo <strong> {bill_due_date} </strong>. <br /> <br /> Anda dapat melihat detail tagihan dari tautan berikut: <a href=\"{bill_admin_link}\"> {bill_number} </a>. <br /> <br /> Salam, <br /> {company_name}', NULL, 'core::seed', NULL, '2021-12-06 02:46:21', '2021-12-06 02:46:21', NULL),
(9, 1, 'bill_recur_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_recur_admin', '{bill_number} tagihan berulang dibuat', 'Halo, <br /> <br /> Berdasarkan lingkaran berulang {customer_name}, <strong> {invoice_number} </strong> faktur telah dibuat secara otomatis. <br /> <br /> Anda dapat melihat detail faktur dari tautan berikut: <a href=\"{invoice_admin_link}\"> {invoice_number} </a>. <br /> <br /> Salam, <br /> {company_name}', NULL, 'core::seed', NULL, '2021-12-06 02:46:21', '2021-12-06 02:46:21', NULL),
(10, 1, 'revenue_new_customer', 'App\\Notifications\\Sale\\Revenue', 'settings.email.templates.revenue_new_customer', '{revenue_date} pembayaran dibuat', 'Yang Terhormat {customer_name},<br /><br />Kami telah Menyiapkan pembayaran sebagai berikut. <br /><br />Anda dapat melihat rincian pembayaran dari tautan berikut: <a href=\"{revenue_guest_link}\">{revenue_date}</a>.<br /><br />Silahkan hubungi Kami jika ada pertanyaan..<br /><br />Hormat Kami,<br />{company_name}', NULL, 'core::seed', NULL, '2021-12-06 02:46:21', '2021-12-06 02:46:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_failed_jobs`
--

CREATE TABLE `130_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_firewall_ips`
--

CREATE TABLE `130_firewall_ips` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_id` int(11) DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_firewall_logs`
--

CREATE TABLE `130_firewall_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `middleware` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_firewall_logs`
--

INSERT INTO `130_firewall_logs` (`id`, `ip`, `level`, `middleware`, `user_id`, `url`, `referrer`, `request`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '::1', 'medium', 'login', 0, 'http://localhost/tubes/auth/login', 'http://localhost/tubes/auth/login', '_token=CmpPZXSaKhdnOzxQWCWrSSZH0eJLrVxGPUH3dqCj&email=info@lampungsporthealthcenter.com&password=******', '2021-12-06 02:46:35', '2021-12-06 02:46:35', NULL),
(2, '::1', 'medium', 'login', 0, 'http://localhost/tubes/auth/login', 'http://localhost/tubes/auth/login', '_token=CmpPZXSaKhdnOzxQWCWrSSZH0eJLrVxGPUH3dqCj&email=info@lampungsporthealthcenter.com&password=******', '2021-12-06 03:26:08', '2021-12-06 03:26:08', NULL),
(3, '::1', 'medium', 'login', 0, 'http://localhost/tubes/auth/login', 'http://localhost/tubes/auth/login', '_token=CmpPZXSaKhdnOzxQWCWrSSZH0eJLrVxGPUH3dqCj&email=infp@lampungsporthealthcenter.com&password=******', '2021-12-06 03:26:14', '2021-12-06 03:26:14', NULL),
(4, '::1', 'medium', 'login', 0, 'http://localhost/tubes/auth/login', 'http://localhost/tubes/auth/login', '_token=CmpPZXSaKhdnOzxQWCWrSSZH0eJLrVxGPUH3dqCj&email=infp@lampungsporthealthcenter.com&password=******', '2021-12-06 03:26:28', '2021-12-06 03:26:28', NULL),
(5, '::1', 'medium', 'login', 0, 'http://localhost/tubes/auth/login', 'http://localhost/tubes/auth/login', '_token=CmpPZXSaKhdnOzxQWCWrSSZH0eJLrVxGPUH3dqCj&email=info@lampungsporthealthcenter.com&password=******', '2021-12-06 03:26:41', '2021-12-06 03:26:41', NULL),
(6, '::1', 'medium', 'login', 0, 'http://localhost/tubes/auth/login', 'http://localhost/tubes/auth/login', '_token=CmpPZXSaKhdnOzxQWCWrSSZH0eJLrVxGPUH3dqCj&email=info@lampungsporthealthcenter.com&password=******', '2021-12-06 03:27:18', '2021-12-06 03:27:18', NULL),
(7, '::1', 'medium', 'login', 0, 'http://localhost/tubes/auth/login', 'http://localhost/tubes/auth/login', '_token=CmpPZXSaKhdnOzxQWCWrSSZH0eJLrVxGPUH3dqCj&email=info@lampungsporthealthcenter.com&password=******', '2021-12-06 03:27:23', '2021-12-06 03:27:23', NULL),
(8, '::1', 'medium', 'login', 0, 'http://localhost/tubes/auth/login', 'http://localhost/tubes/auth/login', '_token=CmpPZXSaKhdnOzxQWCWrSSZH0eJLrVxGPUH3dqCj&email=info@lampungsporthealthcenter.com&password=******', '2021-12-06 03:27:26', '2021-12-06 03:27:26', NULL),
(9, '::1', 'medium', 'login', 0, 'http://localhost/tubes/auth/login', 'http://localhost/tubes/auth/login', '_token=3bM1dDmjxWJk1W2wQNzxuQVtRqObC6o92vCzq45s&email=info@lampungsporthealthcenter.com&password=******', '2021-12-06 03:31:09', '2021-12-06 03:31:09', NULL),
(10, '::1', 'medium', 'login', 0, 'http://localhost/tubes/auth/login', 'http://localhost/tubes/auth/login', '_token=h0Dcm1LIciLosNYswZgVg7Wv6QhhvIH9GcAgnUci&email=admin@lampungsporthealthcenter.comq&password=******', '2021-12-07 01:51:59', '2021-12-07 01:51:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_invoices`
--

CREATE TABLE `130_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiced_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_invoice_histories`
--

CREATE TABLE `130_invoice_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_invoice_items`
--

CREATE TABLE `130_invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_rate` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_invoice_item_taxes`
--

CREATE TABLE `130_invoice_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_invoice_totals`
--

CREATE TABLE `130_invoice_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_items`
--

CREATE TABLE `130_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` double(15,4) NOT NULL,
  `purchase_price` double(15,4) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `category_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_items`
--

INSERT INTO `130_items` (`id`, `company_id`, `name`, `sku`, `description`, `sale_price`, `purchase_price`, `quantity`, `category_id`, `tax_id`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Sport Injury Massage', NULL, 'Sport Injury Massage merupakan rangkaian pijat yang dikhususkan untuk penderita cedera dengan menerapkan ilmu yang tepat sesuai kaidah ilmiah', 200000.0000, 1500000.0000, 1, 6, NULL, 1, 'core::ui', 1, '2021-12-06 03:16:22', '2021-12-06 03:16:22', NULL),
(2, 1, 'Paracetamol', NULL, 'Parasetamol atau asetaminofen adalah obat analgesik dan antipiretik yang banyak dipakai untuk meredakan sakit kepala ringan akut, nyeri ringan hingga sedang, serta demam.', 20000.0000, 15000.0000, 1, 7, NULL, 1, 'core::ui', 1, '2021-12-06 03:17:20', '2021-12-06 03:17:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_item_taxes`
--

CREATE TABLE `130_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_jobs`
--

CREATE TABLE `130_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_media`
--

CREATE TABLE `130_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `disk` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aggregate_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `variant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_media_id` int(10) UNSIGNED DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_media`
--

INSERT INTO `130_media` (`id`, `company_id`, `disk`, `directory`, `filename`, `extension`, `mime_type`, `aggregate_type`, `size`, `variant_name`, `original_media_id`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'uploads', '2021/12/06/1/settings', 'putih', 'png', 'image/png', 'image', 44277, NULL, NULL, 'core::ui', '1', '2021-12-06 02:47:59', '2021-12-06 02:47:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_mediables`
--

CREATE TABLE `130_mediables` (
  `media_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mediable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_mediables`
--

INSERT INTO `130_mediables` (`media_id`, `company_id`, `mediable_type`, `mediable_id`, `tag`, `order`, `created_from`, `created_by`) VALUES
(1, 1, 'App\\Models\\Common\\Company', 1, 'company.logo', 1, 'core::ui', '1');

-- --------------------------------------------------------

--
-- Table structure for table `130_migrations`
--

CREATE TABLE `130_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_migrations`
--

INSERT INTO `130_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_27_000000_create_mediable_tables', 1),
(2, '2017_09_14_000000_core_v1', 1),
(3, '2020_01_08_000000_core_v200', 1),
(4, '2020_03_20_183732_core_v208', 1),
(5, '2020_06_09_000000_core_v2014', 1),
(6, '2020_07_20_000000_core_v2017', 1),
(7, '2020_10_12_000000_add_variants_to_media', 1),
(8, '2020_10_13_000000_core_v210', 1),
(9, '2021_04_01_000000_core_v219', 1),
(10, '2021_05_17_000000_core_v2114', 1),
(11, '2021_06_17_000000_core_v2117', 1),
(12, '2021_09_01_000000_core_v2124', 1),
(13, '2021_09_10_000000_core_v2125', 1),
(14, '2021_09_10_000000_core_v2126', 1),
(15, '2021_09_10_000000_core_v2127', 1);

-- --------------------------------------------------------

--
-- Table structure for table `130_modules`
--

CREATE TABLE `130_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_modules`
--

INSERT INTO `130_modules` (`id`, `company_id`, `alias`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'offline-payments', 1, 'core::ui', NULL, '2021-12-06 02:46:21', '2021-12-06 02:46:21', NULL),
(2, 1, 'paypal-standard', 1, 'core::ui', NULL, '2021-12-06 02:46:22', '2021-12-06 02:46:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_module_histories`
--

CREATE TABLE `130_module_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_module_histories`
--

INSERT INTO `130_module_histories` (`id`, `company_id`, `module_id`, `version`, `description`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2.0.3', 'offline-payments terpasang', 'core::ui', NULL, '2021-12-06 02:46:21', '2021-12-06 02:46:21', NULL),
(2, 1, 2, '2.0.0', 'paypal-standard terpasang', 'core::ui', NULL, '2021-12-06 02:46:22', '2021-12-06 02:46:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_notifications`
--

CREATE TABLE `130_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_password_resets`
--

CREATE TABLE `130_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_permissions`
--

CREATE TABLE `130_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_permissions`
--

INSERT INTO `130_permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'read-admin-panel', 'Read Admin Panel', 'Read Admin Panel', '2021-12-06 02:43:44', '2021-12-06 02:43:44'),
(2, 'read-api', 'Read Api', 'Read Api', '2021-12-06 02:43:45', '2021-12-06 02:43:45'),
(3, 'create-auth-permissions', 'Create Auth Permissions', 'Create Auth Permissions', '2021-12-06 02:43:45', '2021-12-06 02:43:45'),
(4, 'read-auth-permissions', 'Read Auth Permissions', 'Read Auth Permissions', '2021-12-06 02:43:45', '2021-12-06 02:43:45'),
(5, 'update-auth-permissions', 'Update Auth Permissions', 'Update Auth Permissions', '2021-12-06 02:43:45', '2021-12-06 02:43:45'),
(6, 'delete-auth-permissions', 'Delete Auth Permissions', 'Delete Auth Permissions', '2021-12-06 02:43:46', '2021-12-06 02:43:46'),
(7, 'read-auth-profile', 'Read Auth Profile', 'Read Auth Profile', '2021-12-06 02:43:46', '2021-12-06 02:43:46'),
(8, 'update-auth-profile', 'Update Auth Profile', 'Update Auth Profile', '2021-12-06 02:43:46', '2021-12-06 02:43:46'),
(9, 'create-auth-roles', 'Create Auth Roles', 'Create Auth Roles', '2021-12-06 02:43:46', '2021-12-06 02:43:46'),
(10, 'read-auth-roles', 'Read Auth Roles', 'Read Auth Roles', '2021-12-06 02:43:46', '2021-12-06 02:43:46'),
(11, 'update-auth-roles', 'Update Auth Roles', 'Update Auth Roles', '2021-12-06 02:43:47', '2021-12-06 02:43:47'),
(12, 'delete-auth-roles', 'Delete Auth Roles', 'Delete Auth Roles', '2021-12-06 02:43:47', '2021-12-06 02:43:47'),
(13, 'create-auth-users', 'Create Auth Users', 'Create Auth Users', '2021-12-06 02:43:47', '2021-12-06 02:43:47'),
(14, 'read-auth-users', 'Read Auth Users', 'Read Auth Users', '2021-12-06 02:43:47', '2021-12-06 02:43:47'),
(15, 'update-auth-users', 'Update Auth Users', 'Update Auth Users', '2021-12-06 02:43:47', '2021-12-06 02:43:47'),
(16, 'delete-auth-users', 'Delete Auth Users', 'Delete Auth Users', '2021-12-06 02:43:47', '2021-12-06 02:43:47'),
(17, 'create-banking-accounts', 'Create Banking Accounts', 'Create Banking Accounts', '2021-12-06 02:43:48', '2021-12-06 02:43:48'),
(18, 'read-banking-accounts', 'Read Banking Accounts', 'Read Banking Accounts', '2021-12-06 02:43:48', '2021-12-06 02:43:48'),
(19, 'update-banking-accounts', 'Update Banking Accounts', 'Update Banking Accounts', '2021-12-06 02:43:48', '2021-12-06 02:43:48'),
(20, 'delete-banking-accounts', 'Delete Banking Accounts', 'Delete Banking Accounts', '2021-12-06 02:43:48', '2021-12-06 02:43:48'),
(21, 'create-banking-reconciliations', 'Create Banking Reconciliations', 'Create Banking Reconciliations', '2021-12-06 02:43:48', '2021-12-06 02:43:48'),
(22, 'read-banking-reconciliations', 'Read Banking Reconciliations', 'Read Banking Reconciliations', '2021-12-06 02:43:48', '2021-12-06 02:43:48'),
(23, 'update-banking-reconciliations', 'Update Banking Reconciliations', 'Update Banking Reconciliations', '2021-12-06 02:43:49', '2021-12-06 02:43:49'),
(24, 'delete-banking-reconciliations', 'Delete Banking Reconciliations', 'Delete Banking Reconciliations', '2021-12-06 02:43:49', '2021-12-06 02:43:49'),
(25, 'create-banking-transactions', 'Create Banking Transactions', 'Create Banking Transactions', '2021-12-06 02:43:49', '2021-12-06 02:43:49'),
(26, 'read-banking-transactions', 'Read Banking Transactions', 'Read Banking Transactions', '2021-12-06 02:43:49', '2021-12-06 02:43:49'),
(27, 'update-banking-transactions', 'Update Banking Transactions', 'Update Banking Transactions', '2021-12-06 02:43:49', '2021-12-06 02:43:49'),
(28, 'delete-banking-transactions', 'Delete Banking Transactions', 'Delete Banking Transactions', '2021-12-06 02:43:49', '2021-12-06 02:43:49'),
(29, 'create-banking-transfers', 'Create Banking Transfers', 'Create Banking Transfers', '2021-12-06 02:43:49', '2021-12-06 02:43:49'),
(30, 'read-banking-transfers', 'Read Banking Transfers', 'Read Banking Transfers', '2021-12-06 02:43:50', '2021-12-06 02:43:50'),
(31, 'update-banking-transfers', 'Update Banking Transfers', 'Update Banking Transfers', '2021-12-06 02:43:50', '2021-12-06 02:43:50'),
(32, 'delete-banking-transfers', 'Delete Banking Transfers', 'Delete Banking Transfers', '2021-12-06 02:43:50', '2021-12-06 02:43:50'),
(33, 'create-common-companies', 'Create Common Companies', 'Create Common Companies', '2021-12-06 02:43:50', '2021-12-06 02:43:50'),
(34, 'read-common-companies', 'Read Common Companies', 'Read Common Companies', '2021-12-06 02:43:50', '2021-12-06 02:43:50'),
(35, 'update-common-companies', 'Update Common Companies', 'Update Common Companies', '2021-12-06 02:43:50', '2021-12-06 02:43:50'),
(36, 'delete-common-companies', 'Delete Common Companies', 'Delete Common Companies', '2021-12-06 02:43:51', '2021-12-06 02:43:51'),
(37, 'create-common-dashboards', 'Create Common Dashboards', 'Create Common Dashboards', '2021-12-06 02:43:51', '2021-12-06 02:43:51'),
(38, 'read-common-dashboards', 'Read Common Dashboards', 'Read Common Dashboards', '2021-12-06 02:43:51', '2021-12-06 02:43:51'),
(39, 'update-common-dashboards', 'Update Common Dashboards', 'Update Common Dashboards', '2021-12-06 02:43:51', '2021-12-06 02:43:51'),
(40, 'delete-common-dashboards', 'Delete Common Dashboards', 'Delete Common Dashboards', '2021-12-06 02:43:51', '2021-12-06 02:43:51'),
(41, 'create-common-import', 'Create Common Import', 'Create Common Import', '2021-12-06 02:43:51', '2021-12-06 02:43:51'),
(42, 'create-common-items', 'Create Common Items', 'Create Common Items', '2021-12-06 02:43:52', '2021-12-06 02:43:52'),
(43, 'read-common-items', 'Read Common Items', 'Read Common Items', '2021-12-06 02:43:52', '2021-12-06 02:43:52'),
(44, 'update-common-items', 'Update Common Items', 'Update Common Items', '2021-12-06 02:43:52', '2021-12-06 02:43:52'),
(45, 'delete-common-items', 'Delete Common Items', 'Delete Common Items', '2021-12-06 02:43:52', '2021-12-06 02:43:52'),
(46, 'create-common-notifications', 'Create Common Notifications', 'Create Common Notifications', '2021-12-06 02:43:52', '2021-12-06 02:43:52'),
(47, 'read-common-notifications', 'Read Common Notifications', 'Read Common Notifications', '2021-12-06 02:43:53', '2021-12-06 02:43:53'),
(48, 'update-common-notifications', 'Update Common Notifications', 'Update Common Notifications', '2021-12-06 02:43:53', '2021-12-06 02:43:53'),
(49, 'delete-common-notifications', 'Delete Common Notifications', 'Delete Common Notifications', '2021-12-06 02:43:53', '2021-12-06 02:43:53'),
(50, 'create-common-reports', 'Create Common Reports', 'Create Common Reports', '2021-12-06 02:43:53', '2021-12-06 02:43:53'),
(51, 'read-common-reports', 'Read Common Reports', 'Read Common Reports', '2021-12-06 02:43:54', '2021-12-06 02:43:54'),
(52, 'update-common-reports', 'Update Common Reports', 'Update Common Reports', '2021-12-06 02:43:54', '2021-12-06 02:43:54'),
(53, 'delete-common-reports', 'Delete Common Reports', 'Delete Common Reports', '2021-12-06 02:43:54', '2021-12-06 02:43:54'),
(54, 'read-common-search', 'Read Common Search', 'Read Common Search', '2021-12-06 02:43:54', '2021-12-06 02:43:54'),
(55, 'read-common-uploads', 'Read Common Uploads', 'Read Common Uploads', '2021-12-06 02:43:54', '2021-12-06 02:43:54'),
(56, 'delete-common-uploads', 'Delete Common Uploads', 'Delete Common Uploads', '2021-12-06 02:43:54', '2021-12-06 02:43:54'),
(57, 'create-common-widgets', 'Create Common Widgets', 'Create Common Widgets', '2021-12-06 02:43:54', '2021-12-06 02:43:54'),
(58, 'read-common-widgets', 'Read Common Widgets', 'Read Common Widgets', '2021-12-06 02:43:55', '2021-12-06 02:43:55'),
(59, 'update-common-widgets', 'Update Common Widgets', 'Update Common Widgets', '2021-12-06 02:43:55', '2021-12-06 02:43:55'),
(60, 'delete-common-widgets', 'Delete Common Widgets', 'Delete Common Widgets', '2021-12-06 02:43:55', '2021-12-06 02:43:55'),
(61, 'create-purchases-bills', 'Create Purchases Bills', 'Create Purchases Bills', '2021-12-06 02:43:55', '2021-12-06 02:43:55'),
(62, 'read-purchases-bills', 'Read Purchases Bills', 'Read Purchases Bills', '2021-12-06 02:43:55', '2021-12-06 02:43:55'),
(63, 'update-purchases-bills', 'Update Purchases Bills', 'Update Purchases Bills', '2021-12-06 02:43:55', '2021-12-06 02:43:55'),
(64, 'delete-purchases-bills', 'Delete Purchases Bills', 'Delete Purchases Bills', '2021-12-06 02:43:56', '2021-12-06 02:43:56'),
(65, 'create-purchases-payments', 'Create Purchases Payments', 'Create Purchases Payments', '2021-12-06 02:43:56', '2021-12-06 02:43:56'),
(66, 'read-purchases-payments', 'Read Purchases Payments', 'Read Purchases Payments', '2021-12-06 02:43:56', '2021-12-06 02:43:56'),
(67, 'update-purchases-payments', 'Update Purchases Payments', 'Update Purchases Payments', '2021-12-06 02:43:56', '2021-12-06 02:43:56'),
(68, 'delete-purchases-payments', 'Delete Purchases Payments', 'Delete Purchases Payments', '2021-12-06 02:43:56', '2021-12-06 02:43:56'),
(69, 'create-purchases-vendors', 'Create Purchases Vendors', 'Create Purchases Vendors', '2021-12-06 02:43:56', '2021-12-06 02:43:56'),
(70, 'read-purchases-vendors', 'Read Purchases Vendors', 'Read Purchases Vendors', '2021-12-06 02:43:56', '2021-12-06 02:43:56'),
(71, 'update-purchases-vendors', 'Update Purchases Vendors', 'Update Purchases Vendors', '2021-12-06 02:43:56', '2021-12-06 02:43:56'),
(72, 'delete-purchases-vendors', 'Delete Purchases Vendors', 'Delete Purchases Vendors', '2021-12-06 02:43:57', '2021-12-06 02:43:57'),
(73, 'create-sales-customers', 'Create Sales Customers', 'Create Sales Customers', '2021-12-06 02:43:57', '2021-12-06 02:43:57'),
(74, 'read-sales-customers', 'Read Sales Customers', 'Read Sales Customers', '2021-12-06 02:43:57', '2021-12-06 02:43:57'),
(75, 'update-sales-customers', 'Update Sales Customers', 'Update Sales Customers', '2021-12-06 02:43:57', '2021-12-06 02:43:57'),
(76, 'delete-sales-customers', 'Delete Sales Customers', 'Delete Sales Customers', '2021-12-06 02:43:58', '2021-12-06 02:43:58'),
(77, 'create-sales-invoices', 'Create Sales Invoices', 'Create Sales Invoices', '2021-12-06 02:43:58', '2021-12-06 02:43:58'),
(78, 'read-sales-invoices', 'Read Sales Invoices', 'Read Sales Invoices', '2021-12-06 02:43:58', '2021-12-06 02:43:58'),
(79, 'update-sales-invoices', 'Update Sales Invoices', 'Update Sales Invoices', '2021-12-06 02:43:58', '2021-12-06 02:43:58'),
(80, 'delete-sales-invoices', 'Delete Sales Invoices', 'Delete Sales Invoices', '2021-12-06 02:43:58', '2021-12-06 02:43:58'),
(81, 'create-sales-revenues', 'Create Sales Revenues', 'Create Sales Revenues', '2021-12-06 02:43:59', '2021-12-06 02:43:59'),
(82, 'read-sales-revenues', 'Read Sales Revenues', 'Read Sales Revenues', '2021-12-06 02:43:59', '2021-12-06 02:43:59'),
(83, 'update-sales-revenues', 'Update Sales Revenues', 'Update Sales Revenues', '2021-12-06 02:43:59', '2021-12-06 02:43:59'),
(84, 'delete-sales-revenues', 'Delete Sales Revenues', 'Delete Sales Revenues', '2021-12-06 02:43:59', '2021-12-06 02:43:59'),
(85, 'read-install-updates', 'Read Install Updates', 'Read Install Updates', '2021-12-06 02:44:00', '2021-12-06 02:44:00'),
(86, 'update-install-updates', 'Update Install Updates', 'Update Install Updates', '2021-12-06 02:44:00', '2021-12-06 02:44:00'),
(87, 'create-modules-api-key', 'Create Modules Api Key', 'Create Modules Api Key', '2021-12-06 02:44:00', '2021-12-06 02:44:00'),
(88, 'update-modules-api-key', 'Update Modules Api Key', 'Update Modules Api Key', '2021-12-06 02:44:00', '2021-12-06 02:44:00'),
(89, 'read-modules-home', 'Read Modules Home', 'Read Modules Home', '2021-12-06 02:44:00', '2021-12-06 02:44:00'),
(90, 'create-modules-item', 'Create Modules Item', 'Create Modules Item', '2021-12-06 02:44:00', '2021-12-06 02:44:00'),
(91, 'read-modules-item', 'Read Modules Item', 'Read Modules Item', '2021-12-06 02:44:01', '2021-12-06 02:44:01'),
(92, 'update-modules-item', 'Update Modules Item', 'Update Modules Item', '2021-12-06 02:44:01', '2021-12-06 02:44:01'),
(93, 'delete-modules-item', 'Delete Modules Item', 'Delete Modules Item', '2021-12-06 02:44:01', '2021-12-06 02:44:01'),
(94, 'read-modules-my', 'Read Modules My', 'Read Modules My', '2021-12-06 02:44:01', '2021-12-06 02:44:01'),
(95, 'read-modules-tiles', 'Read Modules Tiles', 'Read Modules Tiles', '2021-12-06 02:44:01', '2021-12-06 02:44:01'),
(96, 'read-notifications', 'Read Notifications', 'Read Notifications', '2021-12-06 02:44:01', '2021-12-06 02:44:01'),
(97, 'update-notifications', 'Update Notifications', 'Update Notifications', '2021-12-06 02:44:02', '2021-12-06 02:44:02'),
(98, 'read-reports-expense-summary', 'Read Reports Expense Summary', 'Read Reports Expense Summary', '2021-12-06 02:44:02', '2021-12-06 02:44:02'),
(99, 'read-reports-income-summary', 'Read Reports Income Summary', 'Read Reports Income Summary', '2021-12-06 02:44:02', '2021-12-06 02:44:02'),
(100, 'read-reports-income-expense-summary', 'Read Reports Income Expense Summary', 'Read Reports Income Expense Summary', '2021-12-06 02:44:02', '2021-12-06 02:44:02'),
(101, 'read-reports-profit-loss', 'Read Reports Profit Loss', 'Read Reports Profit Loss', '2021-12-06 02:44:02', '2021-12-06 02:44:02'),
(102, 'read-reports-tax-summary', 'Read Reports Tax Summary', 'Read Reports Tax Summary', '2021-12-06 02:44:03', '2021-12-06 02:44:03'),
(103, 'create-settings-categories', 'Create Settings Categories', 'Create Settings Categories', '2021-12-06 02:44:03', '2021-12-06 02:44:03'),
(104, 'read-settings-categories', 'Read Settings Categories', 'Read Settings Categories', '2021-12-06 02:44:03', '2021-12-06 02:44:03'),
(105, 'update-settings-categories', 'Update Settings Categories', 'Update Settings Categories', '2021-12-06 02:44:03', '2021-12-06 02:44:03'),
(106, 'delete-settings-categories', 'Delete Settings Categories', 'Delete Settings Categories', '2021-12-06 02:44:04', '2021-12-06 02:44:04'),
(107, 'read-settings-company', 'Read Settings Company', 'Read Settings Company', '2021-12-06 02:44:04', '2021-12-06 02:44:04'),
(108, 'create-settings-currencies', 'Create Settings Currencies', 'Create Settings Currencies', '2021-12-06 02:44:04', '2021-12-06 02:44:04'),
(109, 'read-settings-currencies', 'Read Settings Currencies', 'Read Settings Currencies', '2021-12-06 02:44:04', '2021-12-06 02:44:04'),
(110, 'update-settings-currencies', 'Update Settings Currencies', 'Update Settings Currencies', '2021-12-06 02:44:04', '2021-12-06 02:44:04'),
(111, 'delete-settings-currencies', 'Delete Settings Currencies', 'Delete Settings Currencies', '2021-12-06 02:44:04', '2021-12-06 02:44:04'),
(112, 'read-settings-defaults', 'Read Settings Defaults', 'Read Settings Defaults', '2021-12-06 02:44:05', '2021-12-06 02:44:05'),
(113, 'read-settings-email', 'Read Settings Email', 'Read Settings Email', '2021-12-06 02:44:05', '2021-12-06 02:44:05'),
(114, 'read-settings-invoice', 'Read Settings Invoice', 'Read Settings Invoice', '2021-12-06 02:44:05', '2021-12-06 02:44:05'),
(115, 'read-settings-localisation', 'Read Settings Localisation', 'Read Settings Localisation', '2021-12-06 02:44:05', '2021-12-06 02:44:05'),
(116, 'read-settings-modules', 'Read Settings Modules', 'Read Settings Modules', '2021-12-06 02:44:05', '2021-12-06 02:44:05'),
(117, 'update-settings-modules', 'Update Settings Modules', 'Update Settings Modules', '2021-12-06 02:44:05', '2021-12-06 02:44:05'),
(118, 'read-settings-settings', 'Read Settings Settings', 'Read Settings Settings', '2021-12-06 02:44:06', '2021-12-06 02:44:06'),
(119, 'update-settings-settings', 'Update Settings Settings', 'Update Settings Settings', '2021-12-06 02:44:06', '2021-12-06 02:44:06'),
(120, 'read-settings-schedule', 'Read Settings Schedule', 'Read Settings Schedule', '2021-12-06 02:44:06', '2021-12-06 02:44:06'),
(121, 'create-settings-taxes', 'Create Settings Taxes', 'Create Settings Taxes', '2021-12-06 02:44:06', '2021-12-06 02:44:06'),
(122, 'read-settings-taxes', 'Read Settings Taxes', 'Read Settings Taxes', '2021-12-06 02:44:06', '2021-12-06 02:44:06'),
(123, 'update-settings-taxes', 'Update Settings Taxes', 'Update Settings Taxes', '2021-12-06 02:44:07', '2021-12-06 02:44:07'),
(124, 'delete-settings-taxes', 'Delete Settings Taxes', 'Delete Settings Taxes', '2021-12-06 02:44:07', '2021-12-06 02:44:07'),
(125, 'read-widgets-account-balance', 'Read Widgets Account Balance', 'Read Widgets Account Balance', '2021-12-06 02:44:07', '2021-12-06 02:44:07'),
(126, 'read-widgets-cash-flow', 'Read Widgets Cash Flow', 'Read Widgets Cash Flow', '2021-12-06 02:44:07', '2021-12-06 02:44:07'),
(127, 'read-widgets-expenses-by-category', 'Read Widgets Expenses By Category', 'Read Widgets Expenses By Category', '2021-12-06 02:44:07', '2021-12-06 02:44:07'),
(128, 'read-widgets-income-by-category', 'Read Widgets Income By Category', 'Read Widgets Income By Category', '2021-12-06 02:44:08', '2021-12-06 02:44:08'),
(129, 'read-widgets-latest-expenses', 'Read Widgets Latest Expenses', 'Read Widgets Latest Expenses', '2021-12-06 02:44:08', '2021-12-06 02:44:08'),
(130, 'read-widgets-latest-income', 'Read Widgets Latest Income', 'Read Widgets Latest Income', '2021-12-06 02:44:08', '2021-12-06 02:44:08'),
(131, 'read-widgets-total-expenses', 'Read Widgets Total Expenses', 'Read Widgets Total Expenses', '2021-12-06 02:44:08', '2021-12-06 02:44:08'),
(132, 'read-widgets-total-income', 'Read Widgets Total Income', 'Read Widgets Total Income', '2021-12-06 02:44:08', '2021-12-06 02:44:08'),
(133, 'read-widgets-total-profit', 'Read Widgets Total Profit', 'Read Widgets Total Profit', '2021-12-06 02:44:09', '2021-12-06 02:44:09'),
(134, 'read-widgets-currencies', 'Read Widgets Currencies', 'Read Widgets Currencies', '2021-12-06 02:44:09', '2021-12-06 02:44:09'),
(135, 'read-client-portal', 'Read Client Portal', 'Read Client Portal', '2021-12-06 02:44:22', '2021-12-06 02:44:22'),
(136, 'read-portal-invoices', 'Read Portal Invoices', 'Read Portal Invoices', '2021-12-06 02:44:22', '2021-12-06 02:44:22'),
(137, 'update-portal-invoices', 'Update Portal Invoices', 'Update Portal Invoices', '2021-12-06 02:44:22', '2021-12-06 02:44:22'),
(138, 'read-portal-payments', 'Read Portal Payments', 'Read Portal Payments', '2021-12-06 02:44:22', '2021-12-06 02:44:22'),
(139, 'update-portal-payments', 'Update Portal Payments', 'Update Portal Payments', '2021-12-06 02:44:22', '2021-12-06 02:44:22'),
(140, 'read-portal-profile', 'Read Portal Profile', 'Read Portal Profile', '2021-12-06 02:44:22', '2021-12-06 02:44:22'),
(141, 'update-portal-profile', 'Update Portal Profile', 'Update Portal Profile', '2021-12-06 02:44:22', '2021-12-06 02:44:22'),
(142, 'read-offline-payments-settings', 'Read Pembayaran Offline Settings', 'Read Pembayaran Offline Settings', '2021-12-06 02:46:21', '2021-12-06 02:46:21'),
(143, 'update-offline-payments-settings', 'Update Pembayaran Offline Settings', 'Update Pembayaran Offline Settings', '2021-12-06 02:46:21', '2021-12-06 02:46:21'),
(144, 'delete-offline-payments-settings', 'Delete Pembayaran Offline Settings', 'Delete Pembayaran Offline Settings', '2021-12-06 02:46:21', '2021-12-06 02:46:21'),
(145, 'read-paypal-standard-settings', 'Read PayPal Standard Settings', 'Read PayPal Standard Settings', '2021-12-06 02:46:22', '2021-12-06 02:46:22'),
(146, 'update-paypal-standard-settings', 'Update PayPal Standard Settings', 'Update PayPal Standard Settings', '2021-12-06 02:46:22', '2021-12-06 02:46:22');

-- --------------------------------------------------------

--
-- Table structure for table `130_reconciliations`
--

CREATE TABLE `130_reconciliations` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime NOT NULL,
  `closing_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `reconciled` tinyint(1) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_recurring`
--

CREATE TABLE `130_recurring` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `recurable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurable_id` bigint(20) UNSIGNED NOT NULL,
  `frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` int(11) NOT NULL DEFAULT 1,
  `started_at` datetime NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_reports`
--

CREATE TABLE `130_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_reports`
--

INSERT INTO `130_reports` (`id`, `company_id`, `class`, `name`, `description`, `settings`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'App\\Reports\\IncomeSummary', 'Ringkasan Pendapatan', 'Ringkasan penghasilan bulanan berdasarkan kategori.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', NULL, '2021-12-06 02:46:22', '2021-12-06 02:46:22', NULL),
(2, 1, 'App\\Reports\\ExpenseSummary', 'Ringkasan Pengeluaran', 'Ringkasan pengeluaran bulanan berdasarkan kategori.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', NULL, '2021-12-06 02:46:22', '2021-12-06 02:46:22', NULL),
(3, 1, 'App\\Reports\\IncomeExpenseSummary', 'Pendapatan berbanding Pengeluaran', 'Penghasilan bulanan vs biaya berdasarkan kategori.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', NULL, '2021-12-06 02:46:22', '2021-12-06 02:46:22', NULL),
(4, 1, 'App\\Reports\\ProfitLoss', 'Laba & Rugi', 'Laba & rugi triwulan menurut kategori.', '{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', NULL, '2021-12-06 02:46:22', '2021-12-06 02:46:22', NULL),
(5, 1, 'App\\Reports\\TaxSummary', 'Ringkasan Pajak', 'Ringkasan pajak triwulanan.', '{\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', NULL, '2021-12-06 02:46:22', '2021-12-06 02:46:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_roles`
--

CREATE TABLE `130_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_roles`
--

INSERT INTO `130_roles` (`id`, `name`, `display_name`, `description`, `created_from`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', NULL, NULL, '2021-12-06 02:43:44', '2021-12-06 02:43:44'),
(2, 'manager', 'Manager', 'Manager', NULL, NULL, '2021-12-06 02:44:09', '2021-12-06 02:44:09'),
(3, 'customer', 'Customer', 'Customer', NULL, NULL, '2021-12-06 02:44:21', '2021-12-06 02:44:21'),
(4, 'controling', 'Controling', NULL, 'core::ui', '1', '2021-12-06 03:32:45', '2021-12-06 03:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `130_role_permissions`
--

CREATE TABLE `130_role_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_role_permissions`
--

INSERT INTO `130_role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 115),
(1, 116),
(1, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(1, 123),
(1, 124),
(1, 125),
(1, 126),
(1, 127),
(1, 128),
(1, 129),
(1, 130),
(1, 131),
(1, 132),
(1, 133),
(1, 134),
(1, 142),
(1, 143),
(1, 144),
(1, 145),
(1, 146),
(2, 1),
(2, 7),
(2, 8),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 85),
(2, 86),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 109),
(2, 110),
(2, 111),
(2, 112),
(2, 113),
(2, 114),
(2, 115),
(2, 116),
(2, 117),
(2, 118),
(2, 119),
(2, 120),
(2, 121),
(2, 122),
(2, 123),
(2, 124),
(2, 125),
(2, 126),
(2, 127),
(2, 128),
(2, 129),
(2, 130),
(2, 131),
(2, 132),
(2, 133),
(2, 134),
(2, 142),
(2, 143),
(2, 144),
(2, 145),
(2, 146),
(3, 135),
(3, 136),
(3, 137),
(3, 138),
(3, 139),
(3, 140),
(3, 141),
(4, 3),
(4, 9),
(4, 13),
(4, 17),
(4, 21),
(4, 25),
(4, 29),
(4, 33),
(4, 37),
(4, 41),
(4, 42),
(4, 46),
(4, 50),
(4, 57),
(4, 61),
(4, 65),
(4, 69),
(4, 73),
(4, 77),
(4, 81),
(4, 87),
(4, 90),
(4, 103),
(4, 108),
(4, 121);

-- --------------------------------------------------------

--
-- Table structure for table `130_sessions`
--

CREATE TABLE `130_sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_settings`
--

CREATE TABLE `130_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_settings`
--

INSERT INTO `130_settings` (`id`, `company_id`, `key`, `value`) VALUES
(1, 1, 'invoice.title', 'Faktur'),
(2, 1, 'default.locale', 'id-ID'),
(3, 1, 'default.account', '1'),
(4, 1, 'default.income_category', '2'),
(5, 1, 'default.expense_category', '4'),
(6, 1, 'wizard.completed', '1'),
(7, 1, 'offline-payments.methods', '[{\"code\":\"offline-payments.cash.1\",\"name\":\"Tunai\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Transfer Bank\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]'),
(8, 1, 'company.name', 'Lampung Sport Health Center'),
(9, 1, 'company.email', 'infp@lampungsporthealthcenter.com'),
(10, 1, 'company.address', 'DUSUN V MARGARIA, LAMPUNG TENGAH'),
(11, 1, 'company.country', 'ID'),
(12, 1, 'company._prefix', 'company'),
(13, 1, 'company.logo', '1'),
(15, 1, 'default.use_gravatar', '0'),
(16, 1, 'default.currency', 'IDR'),
(17, 1, 'invoice.number_next', '3');

-- --------------------------------------------------------

--
-- Table structure for table `130_taxes`
--

CREATE TABLE `130_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,4) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_transactions`
--

CREATE TABLE `130_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `account_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_transactions`
--

INSERT INTO `130_transactions` (`id`, `company_id`, `type`, `paid_at`, `amount`, `currency_code`, `currency_rate`, `account_id`, `document_id`, `contact_id`, `category_id`, `description`, `payment_method`, `reference`, `parent_id`, `created_from`, `created_by`, `reconciled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'income', '2021-12-06 09:57:52', 111111.1100, 'USD', 1.00000000, 1, NULL, NULL, 2, NULL, 'offline-payments.cash.1', NULL, 0, 'core::ui', 1, 0, '2021-12-06 02:57:52', '2021-12-06 03:02:10', '2021-12-06 03:02:10'),
(2, 1, 'expense', '2021-12-06 10:35:17', 200000.0000, 'IDR', 1.00000000, 1, NULL, 2, 4, 'bayar obat', 'offline-payments.cash.1', NULL, 0, 'core::ui', 1, 0, '2021-12-06 03:35:17', '2021-12-06 03:35:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_transfers`
--

CREATE TABLE `130_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `expense_transaction_id` int(11) NOT NULL,
  `income_transaction_id` int(11) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_users`
--

CREATE TABLE `130_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'id-ID',
  `landing_page` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT 'dashboard',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_users`
--

INSERT INTO `130_users` (`id`, `name`, `email`, `password`, `remember_token`, `last_logged_in_at`, `locale`, `landing_page`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Defangga Aby Vonega', 'admin@lampungsporthealthcenter.com', '$2y$10$8naLET/EIcUKEeNSnU2zBOhAWigpN93jm/FsXwJTTOwpikFHEMqgq', NULL, '2021-12-07 02:11:13', 'id-ID', 'dashboard', 1, 'core::ui', NULL, '2021-12-06 02:46:23', '2021-12-07 02:11:13', NULL),
(2, 'Rahadian Eko Yudistiro', 'owner@lampungsporthealthcenter.com', '$2y$10$mO3LhD.SF3p.wbW2VQjK2OTZo1d3hIH09r1IageexAYAsg3yFhzUq', NULL, NULL, 'id-ID', 'dashboard', 1, 'core::ui', '1', '2021-12-06 03:20:53', '2021-12-06 03:20:53', NULL),
(3, 'Niko Irwanda', 'niko@lampungsporthealthcenter.com', '$2y$10$8McJIKEb42MGv8UJku/5lOJDbN.hXPt.q5UYWm8T7yXiauGHfbPtC', NULL, '2021-12-06 03:26:50', 'id-ID', 'invoices.index', 1, 'core::ui', '1', '2021-12-06 03:24:41', '2021-12-06 03:26:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `130_user_companies`
--

CREATE TABLE `130_user_companies` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_user_companies`
--

INSERT INTO `130_user_companies` (`user_id`, `company_id`, `user_type`) VALUES
(1, 1, 'users'),
(2, 1, 'users'),
(3, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `130_user_dashboards`
--

CREATE TABLE `130_user_dashboards` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `dashboard_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_user_dashboards`
--

INSERT INTO `130_user_dashboards` (`user_id`, `dashboard_id`, `user_type`) VALUES
(1, 1, 'users'),
(2, 2, 'users'),
(3, 3, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `130_user_permissions`
--

CREATE TABLE `130_user_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `130_user_roles`
--

CREATE TABLE `130_user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_user_roles`
--

INSERT INTO `130_user_roles` (`user_id`, `role_id`, `user_type`) VALUES
(1, 1, 'users'),
(2, 2, 'users'),
(3, 2, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `130_widgets`
--

CREATE TABLE `130_widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `dashboard_id` int(11) NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `130_widgets`
--

INSERT INTO `130_widgets` (`id`, `company_id`, `dashboard_id`, `class`, `name`, `sort`, `settings`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'App\\Widgets\\TotalIncome', 'Total Pendapatan', 1, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2021-12-06 02:46:23', '2021-12-06 02:46:23', NULL),
(2, 1, 1, 'App\\Widgets\\TotalExpenses', 'Total Pengeluaran', 2, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2021-12-06 02:46:23', '2021-12-06 02:46:23', NULL),
(3, 1, 1, 'App\\Widgets\\TotalProfit', 'Total Keuntungan', 3, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2021-12-06 02:46:24', '2021-12-06 02:46:24', NULL),
(4, 1, 1, 'App\\Widgets\\CashFlow', 'Arus Kas', 4, '{\"width\":\"col-md-12\"}', 'core::ui', NULL, '2021-12-06 02:46:24', '2021-12-06 02:46:24', NULL),
(5, 1, 1, 'App\\Widgets\\IncomeByCategory', 'Pendapatan menurut Kategori', 5, '{\"width\":\"col-md-6\"}', 'core::ui', NULL, '2021-12-06 02:46:24', '2021-12-06 02:46:24', NULL),
(6, 1, 1, 'App\\Widgets\\ExpensesByCategory', 'Pengeluaran berdasarkan Kategori', 6, '{\"width\":\"col-md-6\"}', 'core::ui', NULL, '2021-12-06 02:46:24', '2021-12-06 02:46:24', NULL),
(7, 1, 1, 'App\\Widgets\\AccountBalance', 'Saldo Rekening', 7, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2021-12-06 02:46:24', '2021-12-06 02:46:24', NULL),
(8, 1, 1, 'App\\Widgets\\LatestIncome', 'Pendapatan Terbaru', 8, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2021-12-06 02:46:24', '2021-12-06 02:46:24', NULL),
(9, 1, 1, 'App\\Widgets\\LatestExpenses', 'Pengeluaran Terbaru', 9, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2021-12-06 02:46:24', '2021-12-06 02:46:24', NULL),
(10, 1, 2, 'App\\Widgets\\TotalIncome', 'Total Pendapatan', 1, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:20:54', '2021-12-06 03:20:54', NULL),
(11, 1, 2, 'App\\Widgets\\TotalExpenses', 'Total Pengeluaran', 2, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:20:54', '2021-12-06 03:20:54', NULL),
(12, 1, 2, 'App\\Widgets\\TotalProfit', 'Total Keuntungan', 3, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:20:54', '2021-12-06 03:20:54', NULL),
(13, 1, 2, 'App\\Widgets\\CashFlow', 'Arus Kas', 4, '{\"width\":\"col-md-12\"}', 'core::ui', 1, '2021-12-06 03:20:54', '2021-12-06 03:20:54', NULL),
(14, 1, 2, 'App\\Widgets\\IncomeByCategory', 'Pendapatan menurut Kategori', 5, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2021-12-06 03:20:54', '2021-12-06 03:20:54', NULL),
(15, 1, 2, 'App\\Widgets\\ExpensesByCategory', 'Pengeluaran berdasarkan Kategori', 6, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2021-12-06 03:20:54', '2021-12-06 03:20:54', NULL),
(16, 1, 2, 'App\\Widgets\\AccountBalance', 'Saldo Rekening', 7, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:20:54', '2021-12-06 03:20:54', NULL),
(17, 1, 2, 'App\\Widgets\\LatestIncome', 'Pendapatan Terbaru', 8, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:20:54', '2021-12-06 03:20:54', NULL),
(18, 1, 2, 'App\\Widgets\\LatestExpenses', 'Pengeluaran Terbaru', 9, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:20:54', '2021-12-06 03:20:54', NULL),
(19, 1, 3, 'App\\Widgets\\TotalIncome', 'Total Pendapatan', 1, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:24:42', '2021-12-06 03:24:42', NULL),
(20, 1, 3, 'App\\Widgets\\TotalExpenses', 'Total Pengeluaran', 2, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:24:42', '2021-12-06 03:24:42', NULL),
(21, 1, 3, 'App\\Widgets\\TotalProfit', 'Total Keuntungan', 3, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:24:42', '2021-12-06 03:24:42', NULL),
(22, 1, 3, 'App\\Widgets\\CashFlow', 'Arus Kas', 4, '{\"width\":\"col-md-12\"}', 'core::ui', 1, '2021-12-06 03:24:42', '2021-12-06 03:24:42', NULL),
(23, 1, 3, 'App\\Widgets\\IncomeByCategory', 'Pendapatan menurut Kategori', 5, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2021-12-06 03:24:42', '2021-12-06 03:24:42', NULL),
(24, 1, 3, 'App\\Widgets\\ExpensesByCategory', 'Pengeluaran berdasarkan Kategori', 6, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2021-12-06 03:24:42', '2021-12-06 03:24:42', NULL),
(25, 1, 3, 'App\\Widgets\\AccountBalance', 'Saldo Rekening', 7, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:24:42', '2021-12-06 03:24:42', NULL),
(26, 1, 3, 'App\\Widgets\\LatestIncome', 'Pendapatan Terbaru', 8, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:24:42', '2021-12-06 03:24:42', NULL),
(27, 1, 3, 'App\\Widgets\\LatestExpenses', 'Pengeluaran Terbaru', 9, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2021-12-06 03:24:42', '2021-12-06 03:24:42', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `130_accounts`
--
ALTER TABLE `130_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_accounts_company_id_index` (`company_id`);

--
-- Indexes for table `130_bills`
--
ALTER TABLE `130_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_bills_company_id_bill_number_deleted_at_unique` (`company_id`,`bill_number`,`deleted_at`),
  ADD KEY `130_bills_company_id_index` (`company_id`);

--
-- Indexes for table `130_bill_histories`
--
ALTER TABLE `130_bill_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_bill_histories_company_id_index` (`company_id`),
  ADD KEY `130_bill_histories_bill_id_index` (`bill_id`);

--
-- Indexes for table `130_bill_items`
--
ALTER TABLE `130_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_bill_items_company_id_index` (`company_id`),
  ADD KEY `130_bill_items_bill_id_index` (`bill_id`);

--
-- Indexes for table `130_bill_item_taxes`
--
ALTER TABLE `130_bill_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_bill_item_taxes_company_id_index` (`company_id`),
  ADD KEY `130_bill_item_taxes_bill_id_index` (`bill_id`);

--
-- Indexes for table `130_bill_totals`
--
ALTER TABLE `130_bill_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_bill_totals_company_id_index` (`company_id`),
  ADD KEY `130_bill_totals_bill_id_index` (`bill_id`);

--
-- Indexes for table `130_categories`
--
ALTER TABLE `130_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_categories_company_id_index` (`company_id`);

--
-- Indexes for table `130_companies`
--
ALTER TABLE `130_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `130_contacts`
--
ALTER TABLE `130_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_contacts_company_id_type_email_deleted_at_unique` (`company_id`,`type`,`email`,`deleted_at`),
  ADD KEY `130_contacts_company_id_type_index` (`company_id`,`type`);

--
-- Indexes for table `130_currencies`
--
ALTER TABLE `130_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  ADD KEY `130_currencies_company_id_index` (`company_id`);

--
-- Indexes for table `130_dashboards`
--
ALTER TABLE `130_dashboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_dashboards_company_id_index` (`company_id`);

--
-- Indexes for table `130_documents`
--
ALTER TABLE `130_documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_documents_document_number_deleted_at_company_id_type_unique` (`document_number`,`deleted_at`,`company_id`,`type`),
  ADD KEY `130_documents_company_id_index` (`company_id`),
  ADD KEY `130_documents_type_index` (`type`);

--
-- Indexes for table `130_document_histories`
--
ALTER TABLE `130_document_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_document_histories_company_id_index` (`company_id`),
  ADD KEY `130_document_histories_type_index` (`type`),
  ADD KEY `130_document_histories_document_id_index` (`document_id`);

--
-- Indexes for table `130_document_items`
--
ALTER TABLE `130_document_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_document_items_company_id_index` (`company_id`),
  ADD KEY `130_document_items_type_index` (`type`),
  ADD KEY `130_document_items_document_id_index` (`document_id`);

--
-- Indexes for table `130_document_item_taxes`
--
ALTER TABLE `130_document_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_document_item_taxes_company_id_index` (`company_id`),
  ADD KEY `130_document_item_taxes_type_index` (`type`),
  ADD KEY `130_document_item_taxes_document_id_index` (`document_id`);

--
-- Indexes for table `130_document_totals`
--
ALTER TABLE `130_document_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_document_totals_company_id_index` (`company_id`),
  ADD KEY `130_document_totals_type_index` (`type`),
  ADD KEY `130_document_totals_document_id_index` (`document_id`);

--
-- Indexes for table `130_email_templates`
--
ALTER TABLE `130_email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_email_templates_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `130_email_templates_company_id_index` (`company_id`);

--
-- Indexes for table `130_failed_jobs`
--
ALTER TABLE `130_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `130_firewall_ips`
--
ALTER TABLE `130_firewall_ips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_firewall_ips_ip_deleted_at_unique` (`ip`,`deleted_at`),
  ADD KEY `130_firewall_ips_ip_index` (`ip`);

--
-- Indexes for table `130_firewall_logs`
--
ALTER TABLE `130_firewall_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_firewall_logs_ip_index` (`ip`);

--
-- Indexes for table `130_invoices`
--
ALTER TABLE `130_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_invoices_company_id_invoice_number_deleted_at_unique` (`company_id`,`invoice_number`,`deleted_at`),
  ADD KEY `130_invoices_company_id_index` (`company_id`);

--
-- Indexes for table `130_invoice_histories`
--
ALTER TABLE `130_invoice_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_invoice_histories_company_id_index` (`company_id`),
  ADD KEY `130_invoice_histories_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `130_invoice_items`
--
ALTER TABLE `130_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_invoice_items_company_id_index` (`company_id`),
  ADD KEY `130_invoice_items_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `130_invoice_item_taxes`
--
ALTER TABLE `130_invoice_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_invoice_item_taxes_company_id_index` (`company_id`),
  ADD KEY `130_invoice_item_taxes_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `130_invoice_totals`
--
ALTER TABLE `130_invoice_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_invoice_totals_company_id_index` (`company_id`),
  ADD KEY `130_invoice_totals_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `130_items`
--
ALTER TABLE `130_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_items_company_id_index` (`company_id`);

--
-- Indexes for table `130_item_taxes`
--
ALTER TABLE `130_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_item_taxes_company_id_item_id_index` (`company_id`,`item_id`);

--
-- Indexes for table `130_jobs`
--
ALTER TABLE `130_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `130_media`
--
ALTER TABLE `130_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_media_disk_directory_filename_extension_unique` (`disk`,`directory`,`filename`,`extension`),
  ADD UNIQUE KEY `130_media_disk_directory_filename_extension_deleted_at_unique` (`disk`,`directory`,`filename`,`extension`,`deleted_at`),
  ADD KEY `130_media_aggregate_type_index` (`aggregate_type`),
  ADD KEY `130_media_disk_directory_index` (`disk`,`directory`),
  ADD KEY `original_media_id` (`original_media_id`),
  ADD KEY `130_media_company_id_index` (`company_id`);

--
-- Indexes for table `130_mediables`
--
ALTER TABLE `130_mediables`
  ADD PRIMARY KEY (`media_id`,`mediable_type`,`mediable_id`,`tag`),
  ADD KEY `130_mediables_mediable_id_mediable_type_index` (`mediable_id`,`mediable_type`),
  ADD KEY `130_mediables_tag_index` (`tag`),
  ADD KEY `130_mediables_order_index` (`order`),
  ADD KEY `130_mediables_company_id_index` (`company_id`);

--
-- Indexes for table `130_migrations`
--
ALTER TABLE `130_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `130_modules`
--
ALTER TABLE `130_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `130_modules_company_id_index` (`company_id`);

--
-- Indexes for table `130_module_histories`
--
ALTER TABLE `130_module_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_module_histories_company_id_module_id_index` (`company_id`,`module_id`);

--
-- Indexes for table `130_notifications`
--
ALTER TABLE `130_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `130_password_resets`
--
ALTER TABLE `130_password_resets`
  ADD KEY `130_password_resets_email_index` (`email`);

--
-- Indexes for table `130_permissions`
--
ALTER TABLE `130_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_permissions_name_unique` (`name`);

--
-- Indexes for table `130_reconciliations`
--
ALTER TABLE `130_reconciliations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_reconciliations_company_id_index` (`company_id`);

--
-- Indexes for table `130_recurring`
--
ALTER TABLE `130_recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_recurring_recurable_type_recurable_id_index` (`recurable_type`,`recurable_id`),
  ADD KEY `130_recurring_company_id_index` (`company_id`);

--
-- Indexes for table `130_reports`
--
ALTER TABLE `130_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_reports_company_id_index` (`company_id`),
  ADD KEY `130_reports_class_index` (`class`);

--
-- Indexes for table `130_roles`
--
ALTER TABLE `130_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_roles_name_unique` (`name`);

--
-- Indexes for table `130_role_permissions`
--
ALTER TABLE `130_role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `130_role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `130_sessions`
--
ALTER TABLE `130_sessions`
  ADD UNIQUE KEY `130_sessions_id_unique` (`id`);

--
-- Indexes for table `130_settings`
--
ALTER TABLE `130_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_settings_company_id_key_unique` (`company_id`,`key`),
  ADD KEY `130_settings_company_id_index` (`company_id`);

--
-- Indexes for table `130_taxes`
--
ALTER TABLE `130_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `130_transactions`
--
ALTER TABLE `130_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_transactions_company_id_type_index` (`company_id`,`type`),
  ADD KEY `130_transactions_account_id_index` (`account_id`),
  ADD KEY `130_transactions_category_id_index` (`category_id`),
  ADD KEY `130_transactions_contact_id_index` (`contact_id`),
  ADD KEY `130_transactions_document_id_index` (`document_id`);

--
-- Indexes for table `130_transfers`
--
ALTER TABLE `130_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_transfers_company_id_index` (`company_id`);

--
-- Indexes for table `130_users`
--
ALTER TABLE `130_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `130_users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `130_user_companies`
--
ALTER TABLE `130_user_companies`
  ADD PRIMARY KEY (`user_id`,`company_id`,`user_type`);

--
-- Indexes for table `130_user_dashboards`
--
ALTER TABLE `130_user_dashboards`
  ADD PRIMARY KEY (`user_id`,`dashboard_id`,`user_type`);

--
-- Indexes for table `130_user_permissions`
--
ALTER TABLE `130_user_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `130_user_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `130_user_roles`
--
ALTER TABLE `130_user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `130_user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `130_widgets`
--
ALTER TABLE `130_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `130_widgets_company_id_dashboard_id_index` (`company_id`,`dashboard_id`),
  ADD KEY `130_widgets_class_index` (`class`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `130_accounts`
--
ALTER TABLE `130_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `130_bills`
--
ALTER TABLE `130_bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_bill_histories`
--
ALTER TABLE `130_bill_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_bill_items`
--
ALTER TABLE `130_bill_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_bill_item_taxes`
--
ALTER TABLE `130_bill_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_bill_totals`
--
ALTER TABLE `130_bill_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_categories`
--
ALTER TABLE `130_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `130_companies`
--
ALTER TABLE `130_companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `130_contacts`
--
ALTER TABLE `130_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `130_currencies`
--
ALTER TABLE `130_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `130_dashboards`
--
ALTER TABLE `130_dashboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `130_documents`
--
ALTER TABLE `130_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `130_document_histories`
--
ALTER TABLE `130_document_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `130_document_items`
--
ALTER TABLE `130_document_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `130_document_item_taxes`
--
ALTER TABLE `130_document_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_document_totals`
--
ALTER TABLE `130_document_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `130_email_templates`
--
ALTER TABLE `130_email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `130_failed_jobs`
--
ALTER TABLE `130_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_firewall_ips`
--
ALTER TABLE `130_firewall_ips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `130_firewall_logs`
--
ALTER TABLE `130_firewall_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `130_invoices`
--
ALTER TABLE `130_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_invoice_histories`
--
ALTER TABLE `130_invoice_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_invoice_items`
--
ALTER TABLE `130_invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_invoice_item_taxes`
--
ALTER TABLE `130_invoice_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_invoice_totals`
--
ALTER TABLE `130_invoice_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_items`
--
ALTER TABLE `130_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `130_item_taxes`
--
ALTER TABLE `130_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_jobs`
--
ALTER TABLE `130_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_media`
--
ALTER TABLE `130_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `130_migrations`
--
ALTER TABLE `130_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `130_modules`
--
ALTER TABLE `130_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `130_module_histories`
--
ALTER TABLE `130_module_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `130_permissions`
--
ALTER TABLE `130_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `130_reconciliations`
--
ALTER TABLE `130_reconciliations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_recurring`
--
ALTER TABLE `130_recurring`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_reports`
--
ALTER TABLE `130_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `130_roles`
--
ALTER TABLE `130_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `130_settings`
--
ALTER TABLE `130_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `130_taxes`
--
ALTER TABLE `130_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_transactions`
--
ALTER TABLE `130_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `130_transfers`
--
ALTER TABLE `130_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `130_users`
--
ALTER TABLE `130_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `130_widgets`
--
ALTER TABLE `130_widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `130_media`
--
ALTER TABLE `130_media`
  ADD CONSTRAINT `original_media_id` FOREIGN KEY (`original_media_id`) REFERENCES `130_media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `130_mediables`
--
ALTER TABLE `130_mediables`
  ADD CONSTRAINT `130_mediables_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `130_media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `130_role_permissions`
--
ALTER TABLE `130_role_permissions`
  ADD CONSTRAINT `130_role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `130_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `130_role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `130_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `130_user_permissions`
--
ALTER TABLE `130_user_permissions`
  ADD CONSTRAINT `130_user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `130_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `130_user_roles`
--
ALTER TABLE `130_user_roles`
  ADD CONSTRAINT `130_user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `130_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
