-- MariaDB dump 10.17  Distrib 10.5.5-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Music
-- ------------------------------------------------------
-- Server version	10.5.5-MariaDB

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `tytul` varchar(180) NOT NULL,
  `gatunek` varchar(180) DEFAULT NULL,
  `zespol` int(11) NOT NULL,
  PRIMARY KEY (`tytul`,`zespol`),
  KEY `pom_index` (`gatunek`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES ('AlbumNumer4','Classical',298),('AlbumNumer2','Heavy Metal',300),('AlbumNumer5','Latin',295),('AlbumNumer3','Opera',299),('AlbumNumer1','Rock',301);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utwor`
--

DROP TABLE IF EXISTS `utwor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utwor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tytul` varchar(180) NOT NULL,
  `czas` int(11) DEFAULT NULL,
  `album` varchar(180) NOT NULL,
  `zespol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`czas` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utwor`
--

LOCK TABLES `utwor` WRITE;
/*!40000 ALTER TABLE `utwor` DISABLE KEYS */;
INSERT INTO `utwor` VALUES (1,'d',2,'a',2),(2,'Utwor15 A295',901,'AlbumNumer5',295),(3,'Utwor14 A295',452,'AlbumNumer5',295),(4,'Utwor13 A295',559,'AlbumNumer5',295),(5,'Utwor12 A295',440,'AlbumNumer5',295),(6,'Utwor11 A295',524,'AlbumNumer5',295),(7,'Utwor10 A295',301,'AlbumNumer5',295),(8,'Utwor9 A295',931,'AlbumNumer5',295),(9,'Utwor8 A295',755,'AlbumNumer5',295),(10,'Utwor7 A295',983,'AlbumNumer5',295),(11,'Utwor6 A295',651,'AlbumNumer5',295),(12,'Utwor5 A295',307,'AlbumNumer5',295),(13,'Utwor4 A295',582,'AlbumNumer5',295),(14,'Utwor3 A295',987,'AlbumNumer5',295),(15,'Utwor2 A295',191,'AlbumNumer5',295),(16,'Utwor1 A295',996,'AlbumNumer5',295),(17,'Utwor10 A298',961,'AlbumNumer4',298),(18,'Utwor9 A298',700,'AlbumNumer4',298),(19,'Utwor8 A298',621,'AlbumNumer4',298),(20,'Utwor7 A298',6,'AlbumNumer4',298),(21,'Utwor6 A298',165,'AlbumNumer4',298),(22,'Utwor5 A298',810,'AlbumNumer4',298),(23,'Utwor4 A298',554,'AlbumNumer4',298),(24,'Utwor3 A298',342,'AlbumNumer4',298),(25,'Utwor2 A298',49,'AlbumNumer4',298),(26,'Utwor1 A298',218,'AlbumNumer4',298),(27,'Utwor15 A299',370,'AlbumNumer3',299),(28,'Utwor14 A299',929,'AlbumNumer3',299),(29,'Utwor13 A299',537,'AlbumNumer3',299),(30,'Utwor12 A299',896,'AlbumNumer3',299),(31,'Utwor11 A299',871,'AlbumNumer3',299),(32,'Utwor10 A299',667,'AlbumNumer3',299),(33,'Utwor9 A299',724,'AlbumNumer3',299),(34,'Utwor8 A299',617,'AlbumNumer3',299),(35,'Utwor7 A299',916,'AlbumNumer3',299),(36,'Utwor6 A299',730,'AlbumNumer3',299),(37,'Utwor5 A299',900,'AlbumNumer3',299),(38,'Utwor4 A299',312,'AlbumNumer3',299),(39,'Utwor3 A299',860,'AlbumNumer3',299),(40,'Utwor2 A299',365,'AlbumNumer3',299),(41,'Utwor1 A299',244,'AlbumNumer3',299),(42,'Utwor7 A300',215,'AlbumNumer2',300),(43,'Utwor6 A300',580,'AlbumNumer2',300),(44,'Utwor5 A300',256,'AlbumNumer2',300),(45,'Utwor4 A300',538,'AlbumNumer2',300),(46,'Utwor3 A300',922,'AlbumNumer2',300),(47,'Utwor2 A300',995,'AlbumNumer2',300),(48,'Utwor1 A300',213,'AlbumNumer2',300),(49,'Utwor6 A301',742,'AlbumNumer1',301),(50,'Utwor5 A301',545,'AlbumNumer1',301),(51,'Utwor4 A301',502,'AlbumNumer1',301),(52,'Utwor3 A301',874,'AlbumNumer1',301),(53,'Utwor2 A301',864,'AlbumNumer1',301),(54,'Utwor1 A301',698,'AlbumNumer1',301);
/*!40000 ALTER TABLE `utwor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zespol`
--

DROP TABLE IF EXISTS `zespol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zespol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(180) NOT NULL,
  `liczbaAlbumow` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zespol`
--

LOCK TABLES `zespol` WRITE;
/*!40000 ALTER TABLE `zespol` DISABLE KEYS */;
INSERT INTO `zespol` VALUES (295,'ZespolNumer5',0),(297,'ZespolNumer5',0),(298,'ZespolNumer4',0),(299,'ZespolNumer3',0),(300,'ZespolNumer2',0),(301,'ZespolNumer1',0);
/*!40000 ALTER TABLE `zespol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-01 12:56:30
