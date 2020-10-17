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
-- Dumping data for table `website_roles`
--

LOCK TABLES `website_roles` WRITE;
/*!40000 ALTER TABLE `website_roles` DISABLE KEYS */;
INSERT INTO `website_roles` VALUES (1,'owner',123,12),(2,'editor',123,23),(3,'admin',123,34),(4,'owner',234,23),(5,'editor',234,34),(6,'admin',234,12),(7,'owner',345,34),(8,'editor',345,12),(9,'admin',345,23),(10,'owner',456,12),(11,'editor',456,23),(12,'admin',456,34),(16,'owner',678,34),(17,'editor',678,12),(18,'admin',678,23);
/*!40000 ALTER TABLE `website_roles` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `website_roles_AFTER_INSERT` AFTER INSERT ON `website_roles` FOR EACH ROW BEGIN
	IF NEW.role = 'admin' OR NEW.role = 'owner' THEN
		INSERT INTO website_privileges VALUES (NULL, 'create', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'update', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'delete', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'read', NEW.website_id, NEW.developer_id);
    END IF;
    IF NEW.role = 'writer' THEN
		INSERT INTO website_privileges VALUES (NULL, 'creat', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'update', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'read', NEW.website_id, NEW.developer_id);
	END IF;
    IF NEW.role = 'editor' THEN
        INSERT INTO website_privileges VALUES (NULL, 'update', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'read', NEW.website_id, NEW.developer_id);
	END IF;
    IF NEW.role = 'reviewer' THEN
        INSERT INTO website_privileges VALUES (NULL, 'read', NEW.website_id, NEW.developer_id);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `website_roles_AFTER_UPDATE` AFTER UPDATE ON `website_roles` FOR EACH ROW BEGIN
	DELETE FROM website_privileges
			WHERE website_privileges.developer_id = OLD.developer_id AND website_privileges.website_id = OLD.website_id;
    IF NEW.role = 'admin' OR NEW.role = 'owner' THEN
        INSERT INTO website_privileges VALUES (NULL, 'create', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'update', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'delete', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'read', NEW.website_id, NEW.developer_id);
	END IF;
    IF NEW.role = 'writer' THEN
		DELETE FROM website_privileges
			WHERE website_privileges.developer_id = OLD.developer_id AND website_privileges.website_id = OLD.website_id;
        INSERT INTO website_privileges VALUES (NULL, 'create', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'update', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'read', NEW.website_id, NEW.developer_id);
	END IF;
    IF NEW.role = 'editor' THEN
        INSERT INTO website_privileges VALUES (NULL, 'update', NEW.website_id, NEW.developer_id);
        INSERT INTO website_privileges VALUES (NULL, 'read', NEW.website_id, NEW.developer_id);
	END IF;
    IF NEW.role = 'reviewer' THEN
        INSERT INTO website_privileges VALUES (NULL, 'read', NEW.website_id, NEW.developer_id);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `website_roles_AFTER_DELETE` AFTER DELETE ON `website_roles` FOR EACH ROW BEGIN
	DELETE FROM website_privileges
		WHERE website_privileges.developer_id = OLD.developer_id AND website_privileges.website_id = OLD.website_id;
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

-- Dump completed on 2020-10-16 21:27:15
