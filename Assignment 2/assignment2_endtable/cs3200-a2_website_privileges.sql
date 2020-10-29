-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cs3200-a2
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `website_privileges`
--

LOCK TABLES `website_privileges` WRITE;
/*!40000 ALTER TABLE `website_privileges` DISABLE KEYS */;
INSERT INTO `website_privileges` VALUES (57,'create',123,12),(58,'update',123,12),(59,'delete',123,12),(60,'read',123,12),(61,'update',123,23),(62,'read',123,23),(63,'create',123,34),(64,'update',123,34),(65,'delete',123,34),(66,'read',123,34),(67,'create',234,23),(68,'update',234,23),(69,'delete',234,23),(70,'read',234,23),(71,'update',234,34),(72,'read',234,34),(73,'create',234,12),(74,'update',234,12),(75,'delete',234,12),(76,'read',234,12),(77,'create',345,34),(78,'update',345,34),(79,'delete',345,34),(80,'read',345,34),(81,'update',345,12),(82,'read',345,12),(83,'create',345,23),(84,'update',345,23),(85,'delete',345,23),(86,'read',345,23),(87,'create',456,12),(88,'update',456,12),(89,'delete',456,12),(90,'read',456,12),(91,'update',456,23),(92,'read',456,23),(93,'create',456,34),(94,'update',456,34),(95,'delete',456,34),(96,'read',456,34),(111,'update',678,12),(112,'read',678,12),(133,'create',678,34),(134,'update',678,34),(135,'delete',678,34),(136,'read',678,34),(145,'create',678,23),(146,'update',678,23),(147,'delete',678,23),(148,'read',678,23);
/*!40000 ALTER TABLE `website_privileges` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 21:27:15
