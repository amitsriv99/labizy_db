/*
SQLyog Community v8.4 
MySQL - 5.5.13 : Database - labizy_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`labizy_db` /*!40100 DEFAULT CHARACTER SET utf16 COLLATE utf16_unicode_ci */;

USE `labizy_db`;

/*Table structure for table `address_tb` */

DROP TABLE IF EXISTS `address_tb`;

CREATE TABLE `address_tb` (
  `house_or_flat_number` char(20) COLLATE utf16_unicode_ci NOT NULL,
  `house_or_apartment_name` varchar(60) COLLATE utf16_unicode_ci DEFAULT NULL,
  `street_address` varchar(120) COLLATE utf16_unicode_ci NOT NULL,
  `locality_name` varchar(120) COLLATE utf16_unicode_ci DEFAULT NULL,
  `city_town_or_village` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `state` char(20) COLLATE utf16_unicode_ci NOT NULL,
  `country` char(20) COLLATE utf16_unicode_ci NOT NULL,
  `pin_code` char(10) COLLATE utf16_unicode_ci NOT NULL,
  `landmark` varchar(2000) COLLATE utf16_unicode_ci DEFAULT NULL,
  `address_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

/*Data for the table `address_tb` */

/*Table structure for table `contact_tb` */

DROP TABLE IF EXISTS `contact_tb`;

CREATE TABLE `contact_tb` (
  `contact_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `contact_type` char(20) COLLATE utf16_unicode_ci NOT NULL,
  `contact_detail` varchar(120) COLLATE utf16_unicode_ci NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

/*Data for the table `contact_tb` */

/*Table structure for table `user_activity_tb` */

DROP TABLE IF EXISTS `user_activity_tb`;

CREATE TABLE `user_activity_tb` (
  `user_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `last_logged_in` datetime DEFAULT NULL,
  `deleted_on` datetime DEFAULT NULL,
  `suspended_on` datetime DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `comments` varchar(2000) COLLATE utf16_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_user_activity_tb` FOREIGN KEY (`user_id`) REFERENCES `user_tb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

/*Data for the table `user_activity_tb` */

/*Table structure for table `user_address_tb` */

DROP TABLE IF EXISTS `user_address_tb`;

CREATE TABLE `user_address_tb` (
  `user_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `address_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `is_primary_address` tinyint(1) NOT NULL,
  `is_billing_address` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`,`address_id`,`is_primary_address`),
  KEY `FK2_user_address_tb` (`address_id`),
  KEY `UserAddressIndexUK1` (`user_id`,`address_id`,`is_billing_address`),
  CONSTRAINT `FK1_user_address_tb` FOREIGN KEY (`user_id`) REFERENCES `user_tb` (`user_id`),
  CONSTRAINT `FK2_user_address_tb` FOREIGN KEY (`address_id`) REFERENCES `address_tb` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

/*Data for the table `user_address_tb` */

/*Table structure for table `user_contact_tb` */

DROP TABLE IF EXISTS `user_contact_tb`;

CREATE TABLE `user_contact_tb` (
  `user_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `contact_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `is_primary_contact` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`,`contact_id`,`is_primary_contact`),
  KEY `FK2_user_contact_tb` (`contact_id`),
  CONSTRAINT `FK1_user_contact_tb` FOREIGN KEY (`user_id`) REFERENCES `user_tb` (`user_id`),
  CONSTRAINT `FK2_user_contact_tb` FOREIGN KEY (`contact_id`) REFERENCES `contact_tb` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

/*Data for the table `user_contact_tb` */

/*Table structure for table `user_oauth_tb` */

DROP TABLE IF EXISTS `user_oauth_tb`;

CREATE TABLE `user_oauth_tb` (
  `user_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `client_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `oauth_token` varchar(200) COLLATE utf16_unicode_ci NOT NULL,
  `oauth_token_issued_on` datetime NOT NULL,
  `is_guest` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`,`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

/*Data for the table `user_oauth_tb` */

/*Table structure for table `user_profile_tb` */

DROP TABLE IF EXISTS `user_profile_tb`;

CREATE TABLE `user_profile_tb` (
  `user_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `title` char(20) COLLATE utf16_unicode_ci DEFAULT NULL,
  `first_name` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `middle_name` varchar(60) COLLATE utf16_unicode_ci DEFAULT NULL,
  `last_name` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `sex` char(20) COLLATE utf16_unicode_ci NOT NULL,
  `date_of_birth` datetime NOT NULL,
  `marital_status` char(20) COLLATE utf16_unicode_ci NOT NULL,
  `profile_picture` varchar(2000) COLLATE utf16_unicode_ci DEFAULT NULL,
  `is_primary_profile` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_user_profile_tb` FOREIGN KEY (`user_id`) REFERENCES `user_tb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

/*Data for the table `user_profile_tb` */

/*Table structure for table `user_relationships` */

DROP TABLE IF EXISTS `user_relationships`;

CREATE TABLE `user_relationships` (
  `user_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `relation_user_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `relationship` char(20) COLLATE utf16_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`relation_user_id`),
  KEY `FK2_user_relationships` (`relation_user_id`),
  CONSTRAINT `FK1_user_relationships` FOREIGN KEY (`user_id`) REFERENCES `user_tb` (`user_id`),
  CONSTRAINT `FK2_user_relationships` FOREIGN KEY (`relation_user_id`) REFERENCES `user_tb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

/*Data for the table `user_relationships` */

/*Table structure for table `user_tb` */

DROP TABLE IF EXISTS `user_tb`;

CREATE TABLE `user_tb` (
  `user_id` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `email_id` varchar(120) COLLATE utf16_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf16_unicode_ci NOT NULL,
  `status` char(20) COLLATE utf16_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

/*Data for the table `user_tb` */

insert  into `user_tb`(`user_id`,`email_id`,`password`,`status`) values ('USER-1483910438031-8292-9926','prashant@labizy.com','$3cr3t',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
