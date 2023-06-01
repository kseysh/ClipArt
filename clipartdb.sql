-- MariaDB dump 10.19  Distrib 10.11.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: clipartdb
-- ------------------------------------------------------
-- Server version	10.11.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `classification`
--

DROP TABLE IF EXISTS `classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `classification_title` char(12) DEFAULT '(분류지정)',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification`
--

LOCK TABLES `classification` WRITE;
/*!40000 ALTER TABLE `classification` DISABLE KEYS */;
INSERT INTO `classification` VALUES
(3,'자연'),
(30,'사람'),
(34,'기타'),
(36,'캐릭터');
/*!40000 ALTER TABLE `classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_table`
--

DROP TABLE IF EXISTS `image_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_table` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(12) DEFAULT 'NO TITLE',
  `image_classification` varchar(12) DEFAULT '분류 지정',
  `last_edited_time` datetime NOT NULL DEFAULT current_timestamp(),
  `originalFileName` tinytext DEFAULT NULL,
  `savedFileName` tinytext DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_table`
--

LOCK TABLES `image_table` WRITE;
/*!40000 ALTER TABLE `image_table` DISABLE KEYS */;
INSERT INTO `image_table` VALUES
(24,'토토로','캐릭터','2023-06-01 12:55:32','image_1.jpg','image_1_4ca657ff-c5f3-483d-ae08-0ec47096a16a.jpg'),
(26,'run','사람','2023-05-31 19:46:19','run.gif','run_2c911d57-cbf3-4605-9808-2b06cd50b3d9.gif'),
(27,'daffy','캐릭터','2023-06-01 12:51:09','daffy.gif','daffy_7b1f6c84-70fb-4d91-9f49-c1f0f037ac17.gif'),
(31,'토토로2','캐릭터','2023-06-01 13:02:44','image_1.jpg','image_1_d978370f-9a31-493f-925e-9a56b797de33.jpg'),
(32,'해','자연','2023-06-01 17:31:45','sun.jpg','sun_10adbcb6-31eb-4dff-b6d1-dabce670cbc3.jpg');
/*!40000 ALTER TABLE `image_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-01 18:49:26
