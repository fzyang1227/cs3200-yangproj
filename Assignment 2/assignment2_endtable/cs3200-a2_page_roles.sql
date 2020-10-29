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
-- Dumping data for table `page_roles`
--

LOCK TABLES `page_roles` WRITE;
/*!40000 ALTER TABLE `page_roles` DISABLE KEYS */;
INSERT INTO `page_roles` VALUES (22,'editor',234,23),(23,'reviewer',234,34),(24,'writer',234,12),(25,'editor',345,34),(26,'reviewer',345,12),(27,'writer',345,23),(28,'editor',456,12),(29,'reviewer',456,23),(30,'writer',456,34);
/*!40000 ALTER TABLE `page_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `page_roles_AFTER_INSERT` AFTER INSERT ON `page_roles` FOR EACH ROW BEGIN
	IF NEW.role = 'admin' OR NEW.role = 'owner' THEN
		INSERT INTO page_privileges VALUES (NULL, 'create', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'update', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'delete', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'read', NEW.page_id, NEW.developer_id);
	END IF;
    IF NEW.role = 'writer' THEN
		INSERT INTO page_privileges VALUES (NULL, 'create', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'update', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'read', NEW.page_id, NEW.developer_id);
	END IF;
    IF NEW.role = 'editor' THEN
        INSERT INTO page_privileges VALUES (NULL, 'update', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'read', NEW.page_id, NEW.developer_id);
	END IF;
    IF NEW.role = 'reviewer' THEN
        INSERT INTO page_privileges VALUES (NULL, 'read', NEW.page_id, NEW.developer_id);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `page_roles_AFTER_UPDATE` AFTER UPDATE ON `page_roles` FOR EACH ROW BEGIN
DELETE FROM page_privileges
			WHERE page_privileges.developer_id = OLD.developer_id AND page_privileges.page_id = OLD.page_id;
IF NEW.role = 'admin' OR NEW.role = 'owner' THEN
        INSERT INTO page_privileges VALUES (NULL, 'create', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'update', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'delete', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'read', NEW.page_id, NEW.developer_id);
	END IF;
    IF NEW.role = 'writer' THEN
        INSERT INTO page_privileges VALUES (NULL, 'create', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'update', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'read', NEW.page_id, NEW.developer_id);
	END IF;
    IF NEW.role = 'editor' THEN
        INSERT INTO page_privileges VALUES (NULL, 'update', NEW.page_id, NEW.developer_id);
        INSERT INTO page_privileges VALUES (NULL, 'read', NEW.page_id, NEW.developer_id);
	END IF;
    IF NEW.role = 'reviewer' THEN
        INSERT INTO page_privileges VALUES (NULL, 'read', NEW.page_id, NEW.developer_id);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `page_roles_AFTER_DELETE` AFTER DELETE ON `page_roles` FOR EACH ROW BEGIN
	DELETE FROM page_privileges
		WHERE page_privileges.developer_id = OLD.developer_id AND page_privileges.page_id = OLD.page_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 21:27:18
