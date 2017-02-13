-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.54-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for labizy_product_labs_db
DROP DATABASE IF EXISTS `labizy_product_labs_db`;
CREATE DATABASE IF NOT EXISTS `labizy_product_labs_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `labizy_product_labs_db`;

-- Dumping structure for table labizy_product_labs_db.change_activity_tb
DROP TABLE IF EXISTS `change_activity_tb`;
CREATE TABLE IF NOT EXISTS `change_activity_tb` (
  `product_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `lab_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `product_deleted_on` datetime DEFAULT NULL,
  `product_suspended_on` datetime DEFAULT NULL,
  `product_last_activate_on` datetime DEFAULT NULL,
  `lab_deleted_on` datetime DEFAULT NULL,
  `lab_suspended_on` datetime DEFAULT NULL,
  `lab_last_activated_on` datetime DEFAULT NULL,
  `last_price_updated_on` datetime DEFAULT NULL,
  `last_promo_updated_on` datetime DEFAULT NULL,
  `comments` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `UK_change_activity_tb` (`product_id`,`lab_id`),
  KEY `FK2_change_activity_tb` (`lab_id`),
  CONSTRAINT `FK1_change_activity_tb` FOREIGN KEY (`product_id`) REFERENCES `product_tb` (`product_id`),
  CONSTRAINT `FK2_change_activity_tb` FOREIGN KEY (`lab_id`) REFERENCES `labs_tb` (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table labizy_product_labs_db.labs_details_tb
DROP TABLE IF EXISTS `labs_details_tb`;
CREATE TABLE IF NOT EXISTS `labs_details_tb` (
  `lab_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address_line1` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address_line2` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `locality_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_town_or_village` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `state` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pin_code` char(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `landmark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `useful_tips` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_reviews_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image1_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image1_text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image2_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image2_text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image3_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image3_text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `large_size_image_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `large_size_image_text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lab_id`),
  CONSTRAINT `FK_labs_details_tb` FOREIGN KEY (`lab_id`) REFERENCES `labs_tb` (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table labizy_product_labs_db.labs_ranking_tb
DROP TABLE IF EXISTS `labs_ranking_tb`;
CREATE TABLE IF NOT EXISTS `labs_ranking_tb` (
  `lab_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`lab_id`),
  CONSTRAINT `FK_labs_ranking_tb` FOREIGN KEY (`lab_id`) REFERENCES `labs_tb` (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table labizy_product_labs_db.labs_tb
DROP TABLE IF EXISTS `labs_tb`;
CREATE TABLE IF NOT EXISTS `labs_tb` (
  `lab_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `group_name` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `parent_lab_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_image_url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lab_id`),
  KEY `FK_labs_tb` (`parent_lab_id`),
  CONSTRAINT `FK_labs_tb` FOREIGN KEY (`parent_lab_id`) REFERENCES `labs_tb` (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table labizy_product_labs_db.product_details_tb
DROP TABLE IF EXISTS `product_details_tb`;
CREATE TABLE IF NOT EXISTS `product_details_tb` (
  `product_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `free_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `about_this_line1` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `about_this_line1_type` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'why?' COMMENT 'Why Is This Test?',
  `about_this_line2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `about_this_line2_type` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'what?' COMMENT 'What Does This Test Measure?',
  `about_this_line3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `about_this_line3_type` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'how?' COMMENT 'How Should The Test Results Be Interpreted?',
  `useful_tips` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_blog_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image1_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image1_text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image2_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image2_text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image3_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size_image3_text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `large_size_image_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `large_size_image_text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `FK_product_details_tb` FOREIGN KEY (`product_id`) REFERENCES `product_tb` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table labizy_product_labs_db.product_ranking_tb
DROP TABLE IF EXISTS `product_ranking_tb`;
CREATE TABLE IF NOT EXISTS `product_ranking_tb` (
  `product_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `FK_product_ranking_tb` FOREIGN KEY (`product_id`) REFERENCES `product_tb` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table labizy_product_labs_db.product_tb
DROP TABLE IF EXISTS `product_tb`;
CREATE TABLE IF NOT EXISTS `product_tb` (
  `product_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sub_type` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_product` tinyint(4) DEFAULT NULL,
  `is_package` tinyint(4) DEFAULT NULL,
  `is_service` tinyint(4) DEFAULT NULL,
  `thumbnail_image_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table labizy_product_labs_db.promo_pricing_tb
DROP TABLE IF EXISTS `promo_pricing_tb`;
CREATE TABLE IF NOT EXISTS `promo_pricing_tb` (
  `product_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `lab_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` double NOT NULL DEFAULT '0',
  `currency_code` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `uom` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `promo_type` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `promo_value` double NOT NULL DEFAULT '0',
  UNIQUE KEY `UK_product_id_lab_id` (`product_id`,`lab_id`),
  KEY `FK2_promo_pricing_tb` (`lab_id`),
  CONSTRAINT `FK1_promo_pricing_tb` FOREIGN KEY (`product_id`) REFERENCES `product_tb` (`product_id`),
  CONSTRAINT `FK2_promo_pricing_tb` FOREIGN KEY (`lab_id`) REFERENCES `labs_tb` (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
