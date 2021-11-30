-- -------------------------------------------------------------
-- TablePlus 4.5.0(396)
--
-- https://tableplus.com/
--
-- Database: arch_app
-- Generation Time: 2021-11-30 12:16:10.9860
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `professor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `wands`;
CREATE TABLE `wands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `wizard_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wizard_id` (`wizard_id`),
  CONSTRAINT `wands_ibfk_1` FOREIGN KEY (`wizard_id`) REFERENCES `wizards` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `wizards`;
CREATE TABLE `wizards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `wizards_classes_relationship`;
CREATE TABLE `wizards_classes_relationship` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wizard_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wizard_id` (`wizard_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `wizards_classes_relationship_ibfk_1` FOREIGN KEY (`wizard_id`) REFERENCES `wizards` (`id`),
  CONSTRAINT `wizards_classes_relationship_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `classes` (`id`, `name`, `professor`) VALUES
(1, 'history', 'pilar'),
(2, 'music', 'marta'),
(3, 'magic', 'eike');

INSERT INTO `wands` (`id`, `name`, `wizard_id`) VALUES
(1, 'Cool wand', 1),
(2, 'Rainbowe', 2),
(3, 'quick', 3),
(4, 'moon', 4),
(5, 'unicorn', 5);

INSERT INTO `wizards` (`id`, `name`, `email`) VALUES
(1, 'manu', 'email@email.com'),
(2, 'pilar', 'email@email.co.uk'),
(3, 'anna', 'email@anna.com'),
(4, 'claudia', 'claudia@email.com'),
(5, 'vitali', 'vitali@email.com');

INSERT INTO `wizards_classes_relationship` (`id`, `wizard_id`, `class_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 2),
(4, 2, 1),
(5, 3, 2),
(6, 5, 3),
(7, 4, 1);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;