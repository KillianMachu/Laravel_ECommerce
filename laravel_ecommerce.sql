-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 09 mars 2025 à 22:29
-- Version du serveur : 5.7.36
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laravel_ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Address name',
  `recipient` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Recipient name',
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Street',
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Postal code',
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'City',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Phone',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is default address',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `addresses`
--

INSERT INTO `addresses` (`id`, `customer_id`, `name`, `recipient`, `street`, `postal_code`, `city`, `phone`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Alessandra Rohan', 'Prof. Loren Mraz III', '78684 Eva Burg', '49494-9079', 'Prohaskaborough', '424-920-7207', 0, '2025-03-09 21:19:52', '2025-03-09 21:22:57'),
(2, 1, 'Dwight Ondricka', 'Dr. Mario Blick DVM', '83201 Irwin Locks Apt. 238', '15872', 'Dinomouth', '910.213.7151', 0, '2025-03-09 21:19:52', '2025-03-09 21:22:57'),
(3, 2, 'Kirsten Feest', 'Mrs. Eve Weimann', '4501 Larry Freeway', '27326', 'Traceyton', '+18702878927', 1, '2025-03-09 21:19:52', '2025-03-09 21:19:53'),
(4, 2, 'Evan Rice', 'Dr. Gayle Kutch V', '767 Kay Throughway Apt. 168', '60537-9139', 'East Samara', '714-503-4683', 0, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(5, 3, 'Mr. Rodger Ankunding MD', 'Prof. Tess Collins V', '91035 Dianna Landing', '27616-1041', 'Gloverfort', '1-318-833-9233', 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(6, 3, 'Ms. Filomena Vandervort', 'Alvah Cole', '2655 Reilly Drives', '16922', 'Odellmouth', '609.242.0295', 0, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(7, 4, 'Dr. Reid Terry IV', 'Maude Swaniawski DDS', '817 Addie Landing Suite 196', '90555', 'Port Arianna', '1-269-293-3353', 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(8, 4, 'Barney Kling', 'Shaniya Luettgen', '692 Wehner Extension Apt. 423', '21793-3915', 'North Odellfort', '386-250-8622', 0, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(9, 5, 'Keaton Hahn', 'Augusta West', '89278 Ethyl Trace Suite 091', '15057', 'Hermannview', '+1-872-915-4309', 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(10, 5, 'Camren Gaylord', 'Dustin Dibbert', '925 Liliana Pines Suite 909', '96367', 'Cormierstad', '+1 (334) 930-7563', 0, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(11, 6, 'Miss Daniella Goodwin III', 'Mr. Dillon Dibbert DDS', '586 Braun Point', '10404', 'Kulasport', '(660) 741-6496', 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(12, 6, 'Missouri Kuhic', 'Yvette Gibson', '3602 Yost Overpass', '89361-9832', 'Port Evangelineside', '+1-325-830-2872', 0, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(13, 7, 'Roderick Nolan', 'Brycen Klocko', '6255 Lowe Parkway', '73083-4981', 'Feestmouth', '507-623-0012', 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(14, 7, 'Ocie Jaskolski', 'Mr. Dalton Lebsack', '122 Dickens Rue Suite 508', '72329-4498', 'North Greta', '856-702-1592', 0, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(15, 8, 'Mrs. Augustine Williamson III', 'Lauren Jakubowski', '5915 Durgan Valleys', '69073', 'Quincyhaven', '231.997.5849', 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(16, 8, 'Dr. Carlotta Terry', 'Chauncey Miller', '597 Florida Crossing', '18212', 'VonRuedenville', '+1-240-493-6962', 0, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(17, 9, 'Gonzalo Bednar V', 'Prof. Erika Aufderhar MD', '901 Elva Plaza Apt. 983', '60961', 'Port Buddyberg', '831.652.0199', 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(18, 9, 'Jedidiah Mosciski', 'Kari Gutkowski', '1783 Marvin Keys', '30784-5521', 'New Shaniya', '1-386-406-7952', 0, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(19, 10, 'Prof. Haleigh Mueller IV', 'Lane Blick', '71590 Jayson Estate Suite 204', '31267-7835', 'Port Duane', '641-883-5177', 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(20, 10, 'Prof. Ardella Bahringer V', 'Destinee Bayer', '3492 Hills Road Suite 979', '43587-1437', 'Paulinemouth', '+1.424.302.8892', 0, '2025-03-09 21:19:53', '2025-03-09 21:19:53');

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_customer_id_foreign` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `created_at`, `updated_at`) VALUES
(2, 2, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(3, 3, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(4, 4, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(5, 5, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(6, 6, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(7, 7, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(8, 8, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(9, 9, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(10, 10, '2025-03-09 21:19:53', '2025-03-09 21:19:53');

-- --------------------------------------------------------

--
-- Structure de la table `cart_product`
--

DROP TABLE IF EXISTS `cart_product`;
CREATE TABLE IF NOT EXISTS `cart_product` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT 'Quantity',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_product_cart_id_foreign` (`cart_id`),
  KEY `cart_product_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cart_product`
--

INSERT INTO `cart_product` (`id`, `cart_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(4, 2, 9, 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(5, 2, 7, 3, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(6, 3, 9, 5, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(7, 3, 2, 3, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(8, 3, 1, 5, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(9, 4, 10, 2, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(10, 4, 4, 2, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(11, 5, 9, 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(12, 5, 1, 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(13, 5, 2, 3, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(14, 6, 3, 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(15, 7, 7, 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(16, 7, 8, 4, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(17, 8, 8, 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(18, 8, 5, 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(19, 8, 6, 2, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(20, 9, 10, 4, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(21, 9, 9, 2, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(22, 9, 4, 4, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(23, 9, 6, 1, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(24, 10, 5, 5, '2025-03-09 21:19:53', '2025-03-09 21:19:53');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Category name',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Product description',
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Image URL',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Category slug',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image_url`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'soluta', 'Voluptatem qui quos nostrum fugiat sit optio nemo. Nam sequi excepturi aut et laboriosam pariatur velit eaque. Aut non earum ut rerum hic vel ipsa.', 'products/67ce13fabadfb.jpg', 'soluta', '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(2, 'reiciendis', 'Fuga molestias inventore quia numquam repudiandae unde omnis. Voluptatem itaque omnis enim libero deserunt. Voluptas nihil voluptatem voluptatem quos sapiente.', 'products/67ce13fb6e38e.jpg', 'reiciendis', '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(3, 'iusto', 'Quis distinctio nostrum est asperiores quia facere sit. Inventore rem quia aut dolore. Qui necessitatibus nihil tempora expedita autem quis non. Voluptatem autem consectetur placeat fugit ut molestiae dignissimos.', 'products/67ce13fbdf5c9.jpg', 'iusto', '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(4, 'maiores', 'Mollitia eaque esse perferendis. Possimus at voluptatem fuga assumenda unde doloribus ullam aut. Et et atque sit. Omnis mollitia nulla ab excepturi aspernatur.', 'products/67ce13fc51f1f.jpg', 'maiores', '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(5, 'libero', 'Ad eligendi nihil sint deleniti eligendi porro magni aut. Fuga pariatur voluptas ullam repudiandae quia.', 'products/67ce13fcae0be.jpg', 'libero', '2025-03-09 21:19:41', '2025-03-09 21:19:41');

-- --------------------------------------------------------

--
-- Structure de la table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE IF NOT EXISTS `category_product` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_product_id_foreign` (`product_id`),
  KEY `category_product_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_product`
--

INSERT INTO `category_product` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(2, 1, 5, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(3, 2, 4, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(4, 2, 3, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(5, 2, 1, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(6, 3, 2, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(7, 3, 4, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(8, 3, 1, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(9, 4, 4, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(10, 5, 2, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(11, 6, 2, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(12, 7, 4, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(13, 7, 2, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(14, 7, 3, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(15, 8, 3, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(16, 8, 4, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(17, 9, 5, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(18, 9, 1, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(19, 10, 3, '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(20, 10, 2, '2025-03-09 21:19:41', '2025-03-09 21:19:41');

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Phone',
  `birth_date` date DEFAULT NULL COMMENT 'Birth date',
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other' COMMENT 'Gender',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `phone`, `birth_date`, `gender`, `created_at`, `updated_at`) VALUES
(1, 2, '(586) 833-0972', '1998-04-20', 'male', '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(2, 3, '(424) 492-7142', '2013-01-25', 'other', '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(3, 4, '(617) 369-8075', '1976-03-07', 'other', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(4, 5, '279.351.9966', '1996-11-12', 'female', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(5, 6, '+1 (407) 224-3061', '1993-02-21', 'male', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(6, 7, '1-213-747-8174', '2014-12-05', 'other', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(7, 8, '+1.219.288.9123', '2017-02-21', 'male', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(8, 9, '1-779-810-6230', '2008-05-08', 'other', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(9, 10, '(864) 363-1450', '1988-08-09', 'other', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(10, 11, '+1 (712) 612-3538', '2007-11-28', 'male', '2025-03-09 21:19:53', '2025-03-09 21:19:53');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=868 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(851, '2014_10_12_000000_create_users_table', 1),
(852, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(853, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(854, '2019_08_19_000000_create_failed_jobs_table', 1),
(855, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(856, '2025_01_31_084754_create_sessions_table', 1),
(857, '2025_01_31_092323_create_customers_table', 1),
(858, '2025_01_31_105909_create_products_table', 1),
(859, '2025_01_31_112019_create_categories_table', 1),
(860, '2025_01_31_112849_create_category_product_table', 1),
(861, '2025_01_31_114900_create_product_images_table', 1),
(862, '2025_02_13_095403_create_carts_table', 1),
(863, '2025_02_13_102354_create_cart_product_table', 1),
(864, '2025_02_13_225137_create_addresses_table', 1),
(865, '2025_02_13_234938_create_orders_table', 1),
(866, '2025_02_13_235111_create_order_product_table', 1),
(867, '2025_02_14_010959_create_shipping_addresses_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` int(11) NOT NULL COMMENT 'Total price in cents',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT 'Order status',
  `shipping_address_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_shipping_address_id_foreign` (`shipping_address_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `total_price`, `status`, `shipping_address_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1380, 'pending', 1, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(2, 1, 5697, 'refunded', 2, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(3, 1, 2022, 'delivered', 3, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(4, 2, 3799, 'processing', 4, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(5, 2, 133, 'processing', 5, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(6, 2, 5832, 'refunded', 6, '2025-03-09 21:19:52', '2025-03-09 21:19:53'),
(7, 3, 3484, 'processing', 7, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(8, 3, 10232, 'shipped', 8, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(9, 3, 2046, 'cancelled', 9, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(10, 4, 6459, 'shipped', 10, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(11, 4, 752, 'shipped', 11, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(12, 4, 4556, 'shipped', 12, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(13, 5, 6321, 'cancelled', 13, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(14, 5, 3649, 'shipped', 14, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(15, 5, 3900, 'refunded', 15, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(16, 6, 3644, 'pending', 16, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(17, 6, 3010, 'cancelled', 17, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(18, 6, 5375, 'pending', 18, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(19, 7, 5132, 'cancelled', 19, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(20, 7, 1264, 'shipped', 20, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(21, 7, 3816, 'processing', 21, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(22, 8, 3488, 'cancelled', 22, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(23, 8, 4722, 'shipped', 23, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(24, 8, 4232, 'refunded', 24, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(25, 9, 2016, 'pending', 25, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(26, 9, 133, 'processing', 26, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(27, 9, 2960, 'delivered', 27, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(28, 10, 1024, 'shipped', 28, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(29, 10, 2750, 'shipped', 29, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(30, 10, 5736, 'cancelled', 30, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(31, 1, 1266, 'pending', 31, '2025-03-09 21:23:13', '2025-03-09 21:23:13');

-- --------------------------------------------------------

--
-- Structure de la table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT 'Quantity',
  `unitary_price` int(11) NOT NULL COMMENT 'Unitary price',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_foreign` (`order_id`),
  KEY `order_product_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`, `unitary_price`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 5, 276, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(2, 2, 1, 1, 512, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(3, 2, 6, 1, 678, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(4, 2, 7, 3, 499, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(5, 2, 4, 5, 602, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(6, 3, 7, 2, 499, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(7, 3, 1, 2, 512, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(8, 4, 10, 1, 769, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(9, 4, 7, 2, 499, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(10, 4, 4, 1, 602, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(11, 4, 2, 2, 715, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(12, 5, 8, 1, 133, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(13, 6, 5, 4, 276, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(14, 6, 2, 4, 715, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(15, 6, 1, 1, 512, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(16, 6, 6, 2, 678, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(17, 7, 1, 1, 512, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(18, 7, 3, 5, 444, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(19, 7, 9, 2, 376, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(20, 8, 10, 5, 769, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(21, 8, 6, 4, 678, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(22, 8, 4, 5, 602, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(23, 8, 8, 5, 133, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(24, 9, 5, 1, 276, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(25, 9, 8, 2, 133, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(26, 9, 9, 4, 376, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(27, 10, 3, 2, 444, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(28, 10, 7, 5, 499, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(29, 10, 10, 4, 769, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(30, 11, 9, 2, 376, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(31, 12, 7, 4, 499, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(32, 12, 1, 5, 512, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(33, 13, 3, 5, 444, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(34, 13, 9, 1, 376, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(35, 13, 2, 1, 715, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(36, 13, 4, 5, 602, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(37, 14, 9, 4, 376, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(38, 14, 2, 3, 715, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(39, 15, 3, 5, 444, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(40, 15, 10, 1, 769, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(41, 15, 8, 3, 133, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(42, 15, 1, 1, 512, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(43, 16, 10, 3, 769, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(44, 16, 8, 1, 133, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(45, 16, 4, 2, 602, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(46, 17, 4, 5, 602, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(47, 18, 3, 4, 444, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(48, 18, 9, 4, 376, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(49, 18, 5, 5, 276, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(50, 18, 2, 1, 715, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(51, 19, 7, 4, 499, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(52, 19, 2, 4, 715, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(53, 19, 5, 1, 276, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(54, 20, 8, 2, 133, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(55, 20, 7, 2, 499, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(56, 21, 3, 3, 444, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(57, 21, 4, 3, 602, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(58, 21, 6, 1, 678, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(59, 22, 5, 5, 276, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(60, 22, 9, 2, 376, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(61, 22, 6, 2, 678, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(62, 23, 6, 5, 678, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(63, 23, 3, 3, 444, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(64, 24, 6, 1, 678, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(65, 24, 2, 1, 715, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(66, 24, 10, 3, 769, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(67, 24, 8, 4, 133, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(68, 25, 3, 2, 444, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(69, 25, 9, 3, 376, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(70, 26, 8, 1, 133, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(71, 27, 4, 4, 602, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(72, 27, 5, 2, 276, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(73, 28, 1, 2, 512, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(74, 29, 8, 2, 133, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(75, 29, 6, 1, 678, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(76, 29, 4, 3, 602, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(77, 30, 4, 4, 602, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(78, 30, 7, 4, 499, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(79, 30, 3, 3, 444, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(80, 31, 3, 1, 444, '2025-03-09 21:23:13', '2025-03-09 21:23:13'),
(81, 31, 9, 3, 274, '2025-03-09 21:23:13', '2025-03-09 21:23:13');

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Product name',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Product description',
  `price` int(11) NOT NULL COMMENT 'Price in cents',
  `discount_price` int(11) DEFAULT NULL COMMENT 'Discount price in cents',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT 'Stock quantity',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Product is active',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Product slug',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `discount_price`, `stock`, `is_active`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'unde rerum necessitatibus', 'Quas praesentium aut nesciunt rerum dolorum non. Consequatur saepe consectetur quo omnis aut accusamus. Perspiciatis et eius aliquid vero repellat ad. Magni et qui architecto voluptatem consequatur.', 51200, NULL, 36, 1, 'unde-rerum-necessitatibus', '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(2, 'consequatur distinctio occaecati', 'Asperiores consequuntur asperiores eum est molestiae fugiat laborum. Temporibus eum dolor qui quo vitae occaecati. Voluptatum voluptates sed nobis qui. Quaerat odio eos qui.', 71500, NULL, 18, 1, 'consequatur-distinctio-occaecati', '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(3, 'exercitationem voluptates expedita', 'Quasi quas blanditiis et et reprehenderit. Maxime odit sunt enim blanditiis ipsum sed. Ducimus vitae consequatur nesciunt expedita unde neque.', 44400, NULL, 77, 1, 'exercitationem-voluptates-expedita', '2025-03-09 21:19:41', '2025-03-09 21:23:13'),
(4, 'blanditiis ea dolore', 'Et ducimus non possimus. Saepe eveniet eius porro officia. Asperiores ut rerum laudantium ipsam ut labore quaerat.', 60200, 403, 98, 0, 'blanditiis-ea-dolore', '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(5, 'dolorum quia sunt', 'Dolor placeat eveniet incidunt modi et dolor esse. Corporis omnis doloribus officiis praesentium vitae nam omnis. Neque rerum iure ea libero.', 27600, 226, 55, 1, 'dolorum-quia-sunt', '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(6, 'id est dolorem', 'Quia sunt sint consequatur aut necessitatibus. Aperiam a qui repellendus iure. Illum et quas sit.', 67800, 420, 27, 1, 'id-est-dolorem', '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(7, 'et nesciunt similique', 'Facere doloribus illo id architecto et. Consequatur numquam quasi omnis est velit dolores placeat. Et vero aut alias qui.', 49900, NULL, 57, 1, 'et-nesciunt-similique', '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(8, 'molestiae aut et', 'Enim dolor ipsum illo aut illum suscipit. Nulla assumenda ut consequatur. Qui magni illum placeat est nihil. Ratione aut autem cum.', 13300, NULL, 25, 0, 'molestiae-aut-et', '2025-03-09 21:19:41', '2025-03-09 21:19:41'),
(9, 'ut aut aut', 'Voluptate aliquam rerum laborum in molestiae repudiandae. Blanditiis non vero ab labore aut sunt vel. At in facere nisi et ratione.', 37600, 274, 37, 1, 'ut-aut-aut', '2025-03-09 21:19:41', '2025-03-09 21:23:13'),
(10, 'beatae rem placeat', 'Ut aut autem cumque iusto. Dolor nam sed et sed. Totam ut debitis voluptas ut omnis est. Velit voluptates blanditiis omnis soluta.', 76900, NULL, 96, 1, 'beatae-rem-placeat', '2025-03-09 21:19:41', '2025-03-09 21:19:41');

-- --------------------------------------------------------

--
-- Structure de la table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Image URL',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is primary image',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Image position',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `is_primary`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, 'products/67ce13fd249b6.jpg', 0, 6, '2025-03-09 21:19:42', '2025-03-09 21:19:42'),
(2, 1, 'products/67ce13fd8c388.jpg', 0, 10, '2025-03-09 21:19:42', '2025-03-09 21:19:42'),
(3, 1, 'products/67ce13fdf208b.jpg', 1, 6, '2025-03-09 21:19:42', '2025-03-09 21:19:42'),
(4, 1, 'products/67ce13fe70e9e.jpg', 0, 6, '2025-03-09 21:19:42', '2025-03-09 21:19:42'),
(5, 2, 'products/67ce13feda57f.jpg', 0, 9, '2025-03-09 21:19:43', '2025-03-09 21:19:43'),
(6, 2, 'products/67ce13ff45aae.jpg', 0, 1, '2025-03-09 21:19:43', '2025-03-09 21:19:43'),
(7, 3, 'products/67ce13ffc41ec.jpg', 0, 9, '2025-03-09 21:19:44', '2025-03-09 21:19:44'),
(8, 4, 'products/67ce14003414f.jpg', 0, 6, '2025-03-09 21:19:44', '2025-03-09 21:19:44'),
(9, 5, 'products/67ce1400a992f.jpg', 0, 5, '2025-03-09 21:19:45', '2025-03-09 21:19:45'),
(10, 6, 'products/67ce14011c1ae.jpg', 0, 7, '2025-03-09 21:19:46', '2025-03-09 21:19:46'),
(11, 6, 'products/67ce14017de21.jpg', 1, 2, '2025-03-09 21:19:46', '2025-03-09 21:19:46'),
(12, 6, 'products/67ce1401dea68.jpg', 1, 6, '2025-03-09 21:19:46', '2025-03-09 21:19:46'),
(13, 7, 'products/67ce14024429f.jpg', 0, 7, '2025-03-09 21:19:48', '2025-03-09 21:19:48'),
(14, 7, 'products/67ce1402a619f.jpg', 0, 3, '2025-03-09 21:19:48', '2025-03-09 21:19:48'),
(15, 7, 'products/67ce14033ec6f.jpg', 0, 7, '2025-03-09 21:19:48', '2025-03-09 21:19:48'),
(16, 7, 'products/67ce1403a3cc6.jpg', 1, 3, '2025-03-09 21:19:48', '2025-03-09 21:19:48'),
(17, 8, 'products/67ce14040b094.jpg', 0, 10, '2025-03-09 21:19:48', '2025-03-09 21:19:48'),
(18, 9, 'products/67ce140471ec6.jpg', 0, 9, '2025-03-09 21:19:48', '2025-03-09 21:19:48'),
(19, 10, 'products/67ce1404cbf8b.jpg', 0, 2, '2025-03-09 21:19:50', '2025-03-09 21:19:50'),
(20, 10, 'products/67ce140536ea0.jpg', 0, 1, '2025-03-09 21:19:50', '2025-03-09 21:19:50'),
(21, 10, 'products/67ce140599829.jpg', 1, 5, '2025-03-09 21:19:50', '2025-03-09 21:19:50'),
(22, 10, 'products/67ce14060d02a.jpg', 1, 6, '2025-03-09 21:19:50', '2025-03-09 21:19:50');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('87XaFoftIeObzswqwbZjOYxlbErSazJtahsYCMtE', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTUVkazNwRDl2ekFxN1Fuc2JjZk41aDhFSGkwQ2ZpNk1WaTUxclhlQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTIkQ3h6UTVpdzY1R0pDbjdTR3BwdzM1LlN5MmFvald0Z2JEa09qUHVESEhTbkRLVnpIcjczVksiO30=', 1741559032);

-- --------------------------------------------------------

--
-- Structure de la table `shipping_addresses`
--

DROP TABLE IF EXISTS `shipping_addresses`;
CREATE TABLE IF NOT EXISTS `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Address name',
  `recipient` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Recipient name',
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Street',
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Postal code',
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'City',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Phone',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `name`, `recipient`, `street`, `postal_code`, `city`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Elouise Huels V', 'Miss Ashlee Runolfsdottir DVM', '856 Adriana Roads', '88883', 'Ricardohaven', '310-501-8873', '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(2, 'Vickie Durgan', 'Winfield Spencer', '6480 Emilio Shore', '78360-1284', 'Rathville', '843.423.7194', '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(3, 'Jerrell Becker', 'Mrs. Drew Prohaska', '4366 Penelope Divide Suite 554', '90034', 'Franeckiburgh', '413-265-7318', '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(4, 'Diego Prohaska', 'Lera Ledner', '825 Andrew Way', '14130-9380', 'East Parisland', '+1.586.219.8411', '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(5, 'Jefferey Greenfelder', 'Maya Yost', '621 Beahan Street Suite 168', '66050', 'Derickborough', '+1-828-896-7483', '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(6, 'Camilla Bradtke', 'Coby Grimes', '6121 Pfeffer Trail Suite 656', '52748-5140', 'Brakusville', '+1-256-363-1358', '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(7, 'Braxton Russel PhD', 'Ellie Stiedemann', '323 McDermott Road Apt. 907', '46344-6065', 'Port Verdie', '+1-325-699-8370', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(8, 'Dr. Houston Mosciski', 'Freddy Rogahn', '9487 Easton Isle Apt. 649', '78136', 'Nikitamouth', '(712) 902-0667', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(9, 'Alice Ernser', 'Dr. Angel Franecki', '96455 Willms Orchard Apt. 979', '72875-8953', 'Corwinstad', '1-352-207-8198', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(10, 'Dr. Demond Huels', 'Julianne Gleason', '49409 Lori Terrace', '45992', 'Bellmouth', '+14237038127', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(11, 'Ulises Wintheiser', 'Quinn Schoen', '440 Dayana Square', '22805', 'Jarrettstad', '+18059853561', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(12, 'Mr. Brycen Mitchell PhD', 'Aidan Stanton', '514 Ledner Field', '68976', 'Treutelshire', '530-805-2825', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(13, 'Bo Wolff', 'Jackeline Jaskolski', '417 Hintz Prairie', '37427', 'Bradtkefurt', '1-201-993-9875', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(14, 'Pete Barrows', 'Prof. Floyd Ledner', '556 Connelly Green Suite 320', '11786-2728', 'Thompsonfort', '+1.928.426.7023', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(15, 'Randi Ryan', 'Dr. Nedra Ondricka I', '2180 Nickolas Crossroad', '35048', 'Kunzeview', '260.525.5482', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(16, 'Mr. Ethan Harvey', 'Dr. Marques Hintz', '638 Kovacek Flats Suite 870', '34064', 'Luettgenville', '1-609-743-8756', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(17, 'Hayley Marks', 'Mrs. Ashley Beahan', '28020 Turner Ridge Apt. 474', '60621', 'New Letaville', '860-770-6496', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(18, 'Aurelia Nikolaus', 'Chesley Turcotte', '72219 Douglas Forges Suite 899', '94737', 'Port Jovanberg', '+1-225-784-5530', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(19, 'Branson Little', 'Michel O\'Conner', '23640 Braeden Canyon Apt. 832', '27208', 'Amarifurt', '+1-937-974-8015', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(20, 'Carter Glover', 'Joey Robel', '55321 Marilyne Valleys', '37443-9802', 'Tayaton', '+1.707.721.6739', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(21, 'Ms. Ila Huel', 'Sigmund Brekke', '745 Gerhold Circles', '86702', 'Veldafort', '651-739-6289', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(22, 'Carrie Zboncak', 'Mr. Jayme Parker III', '5596 Crona Ford', '51028-4824', 'South Dalton', '351-345-6106', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(23, 'Prof. Camila Hessel DVM', 'Jared Senger Jr.', '7515 Heathcote Junction', '91596', 'North Lavonneburgh', '763-693-1420', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(24, 'Estella Wyman', 'Dr. Bobbie Zboncak IV', '47834 Olen Springs Apt. 474', '68231-2342', 'Nellachester', '1-856-981-6581', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(25, 'Wilfrid Kunde Jr.', 'Darron Ebert', '79865 Nolan Throughway', '09178', 'West Solonborough', '+13808268666', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(26, 'Darrion Smith', 'April Johns', '530 Christina Crescent Apt. 056', '97545-2733', 'Gulgowskimouth', '+1-352-386-9299', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(27, 'Marilyne Schmeler', 'Erika Klein', '7267 Jovan Forks Apt. 494', '13208-9547', 'Daphneestad', '435.613.0755', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(28, 'Trever Marks', 'Prof. Ruby O\'Reilly MD', '541 Kuvalis Corner Apt. 693', '53920', 'North Ezekielside', '(469) 370-0448', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(29, 'Mr. Oswaldo Hansen DVM', 'Joy Mohr', '147 Bechtelar Plaza Suite 124', '85791', 'Lake Lillianaburgh', '(339) 668-2894', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(30, 'Carrie Jerde', 'Dr. Bailey Huels DDS', '267 Harber Fields', '69178', 'Port Micaela', '+1 (918) 885-2366', '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(31, 'Maison', 'gazgea fzafza', 'Rue de Lens', '59000', 'Lille', '0684746384', '2025-03-09 21:23:13', '2025-03-09 21:23:13');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `role`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', '2025-03-09 21:19:50', '$2y$12$9P4b5.pj8GEpufV1DaiAT.w1zF86f.p9Q1J8W76TgLvKLdlGxYBWO', NULL, NULL, NULL, 'admin', 'NpoQSG2uxq', NULL, NULL, '2025-03-09 21:19:50', '2025-03-09 21:19:50'),
(2, 'Dr. Nico Rogahn II', 'wmacejkovic@example.com', '2025-03-09 21:19:50', '$2y$12$CxzQ5iw65GJCn7SGppw35.Sy2aojWtgbDkOjPuDHHSnDKVzHr73VK', NULL, NULL, NULL, 'customer', 'fyBXxF45SK', NULL, NULL, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(3, 'Alexander Douglas', 'batz.sid@example.com', '2025-03-09 21:19:51', '$2y$12$12inXg/nIRQ99K7XEwNjeuOWkNtxvdSMcxm0IOuHTM2.1Z1kxfVA.', NULL, NULL, NULL, 'customer', 'WITxu43M3h', NULL, NULL, '2025-03-09 21:19:52', '2025-03-09 21:19:52'),
(4, 'Noe Mueller', 'vheaney@example.com', '2025-03-09 21:19:51', '$2y$12$yGVjnby3avTq9yft5EzpOufkSGwgKtGEMtlgUkiYb17G0ctkcv0b6', NULL, NULL, NULL, 'customer', 'jgF1moGfHW', NULL, NULL, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(5, 'Bennett Rodriguez IV', 'rprice@example.com', '2025-03-09 21:19:51', '$2y$12$BYg0ol47DTqQxTOxiTGq3uxfi0mJxgv3d2pQ6Qm/Kc/LmYyBdxW6y', NULL, NULL, NULL, 'customer', 'XtNU7N2CCo', NULL, NULL, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(6, 'Eveline Gerhold', 'christiansen.corene@example.org', '2025-03-09 21:19:51', '$2y$12$ul4tsN5SLeIwxHi64CYWOezfkVwJ0DZ.oH7sQZnmMW4ClihPGqEZO', NULL, NULL, NULL, 'customer', 'WQAju0GUz6', NULL, NULL, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(7, 'Mollie O\'Reilly', 'garret32@example.net', '2025-03-09 21:19:51', '$2y$12$N8O0qR8MYQL1BK6B4BSQDuFuroaxaCdDafyDQMG7z5Nz8IJZgH9Ru', NULL, NULL, NULL, 'customer', 'tM0KEFaqVS', NULL, NULL, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(8, 'Rogelio Zemlak', 'andreanne.ebert@example.org', '2025-03-09 21:19:52', '$2y$12$g.CtrCYwsSx0.TQbb7aUVe4pG.ucEgaopefNcMzZBZY/x1CI7CwZa', NULL, NULL, NULL, 'customer', 'NpZsoGb7zl', NULL, NULL, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(9, 'Emie Kris', 'wsawayn@example.net', '2025-03-09 21:19:52', '$2y$12$tYpbOswLTPu30cjELjMVPuA/EIOBZhA5jQH6La616SQHB9ifawxCC', NULL, NULL, NULL, 'customer', 'VhLHdJ5d4A', NULL, NULL, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(10, 'Brandon Ebert', 'equigley@example.com', '2025-03-09 21:19:52', '$2y$12$zN08yx2aR17SklvzkYW2eOfQotz3Kjy5d0WkfJ7fIY2zNZe0ND6..', NULL, NULL, NULL, 'customer', 'jhjP2hMPUd', NULL, NULL, '2025-03-09 21:19:53', '2025-03-09 21:19:53'),
(11, 'Tressa Oberbrunner', 'zgleichner@example.net', '2025-03-09 21:19:52', '$2y$12$1.C/ke6hihBiz9bcL0k1y.lTczRrcYAkMQfoEyUaoRgPA5OWdDlTG', NULL, NULL, NULL, 'customer', 'xrwAnxjYRj', NULL, NULL, '2025-03-09 21:19:53', '2025-03-09 21:19:53');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
