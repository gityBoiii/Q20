-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: guestbook
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `guestbook`
--

DROP TABLE IF EXISTS `guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook` (
  `idx` int NOT NULL AUTO_INCREMENT COMMENT '일련번호\n',
  `name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '작성자\n',
  `content` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '내용\n',
  `count` int NOT NULL DEFAULT '0' COMMENT '읽은수 \n',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook`
--

LOCK TABLES `guestbook` WRITE;
/*!40000 ALTER TABLE `guestbook` DISABLE KEYS */;
INSERT INTO `guestbook` VALUES (5,'강호재','방명록은 언제 만들어와?',0),(6,'강호재','방명록은 언제 만들어와?',0),(7,'강호재','방명록은 언제 만들어와?',0),(8,'강호재','방명록은 언제 만들어와?',0),(9,'강호재','방명록은 언제 만들어와?',0),(10,'강호재','방명록은 언제 만들어와?',0),(11,'강호재','방명록은 언제 만들어와?',0),(12,'강호재','방명록은 언제 만들어와?',0),(13,'강호재','방명록은 언제 만들어와?',0),(14,'강호재','방명록은 언제 만들어와?',0),(15,'강호재','방명록은 언제 만들어와?',0),(16,'강호재','방명록은 언제 만들어와?',0),(17,'강호재','방명록은 언제 만들어와?',0),(18,'강호재','방명록은 언제 만들어와?',0),(19,'강호재','방명록은 언제 만들어와?',0),(20,'강호재','방명록은 언제 만들어와?',0),(21,'강호재','방명록은 언제 만들어와?',0),(22,'강호재','방명록은 언제 만들어와?',0),(23,'강호재','방명록은 언제 만들어와?',0),(24,'강호재','방명록은 언제 만들어와?',0),(25,'강호재','방명록은 언제 만들어와?',0),(26,'강호재','방명록은 언제 만들어와?',0),(27,'강호재','방명록은 언제 만들어와?',0),(28,'강호재','방명록은 언제 만들어와?',0),(29,'강호재','방명록은 언제 만들어와?',0),(30,'강호재','방명록은 언제 만들어와?',0),(31,'강호재','방명록은 언제 만들어와?',0),(32,'강호재','방명록은 언제 만들어와?',0),(33,'강호재','방명록은 언제 만들어와?',0),(34,'강호재','방명록은 언제 만들어와?',0),(35,'강호재','방명록은 언제 만들어와?',0);
/*!40000 ALTER TABLE `guestbook` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-28 14:55:44
