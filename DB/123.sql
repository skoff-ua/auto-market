-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: automarket
-- ------------------------------------------------------
-- Server version	5.7.9-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UX_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES (1,'Ford','/images/mark/ford.png'),(6,'Opel','/images/mark/opel.png'),(7,'Mercedes','/images/mark/mercedes.png'),(8,'Citroen','/images/mark/citroen.png'),(9,'Fiat','/images/mark/fiat.png'),(10,'Nissan','/images/mark/nissan.png'),(11,'Peugeot','/images/mark/peugeot.png'),(12,'Renault','/images/mark/renault.png'),(13,'Volkswagen','/images/mark/volkswagen.png');
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_parts`
--

DROP TABLE IF EXISTS `model_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_parts` (
  `modelId` int(10) unsigned DEFAULT NULL,
  `partId` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_parts`
--

LOCK TABLES `model_parts` WRITE;
/*!40000 ALTER TABLE `model_parts` DISABLE KEYS */;
INSERT INTO `model_parts` VALUES (1,1),(1,2),(1,3),(2,1),(2,3),(4,4);
/*!40000 ALTER TABLE `model_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `auto_id` int(10) unsigned NOT NULL,
  `imgurl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UX_name` (`name`),
  UNIQUE KEY `imgurl_UNIQUE` (`imgurl`),
  KEY `FK_auto` (`auto_id`),
  CONSTRAINT `models_ibfk_1` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'Connect',1,'/images/model/connect.jpg'),(2,'Courier',1,'/images/model/courier.jpg'),(4,'Transit',1,'/images/model/transit.jpg'),(5,'Movano',6,'/images/model/movano.jpg'),(6,'Vivaro',6,'/images/model/vivaro.jpg'),(7,'Berlingo',8,'/images/model/berlingo.jpg'),(8,'Jumper',8,'/images/model/jumper.jpg'),(9,'Jumpy',8,'/images/model/jumpy.jpg'),(10,'Nemo',8,'/images/model/nemo.jpg'),(11,'Doblo',9,'/images/model/doblo.jpg'),(12,'Ducato',9,'/images/model/ducato.jpg'),(13,'Scudo',9,'/images/model/scudo.jpg'),(14,'Sprinter',7,'/images/model/sprinter.jpg'),(15,'Vito',7,'/images/model/vito.jpg'),(16,'Kubistar',10,'/images/model/kubistar.jpg'),(17,'Primastar',10,'/images/model/primastar.jpg'),(18,'Bipper',11,'/images/model/bipper.jpg'),(19,'Boxer',11,'/images/model/boxer.jpg'),(20,'Expert',11,'/images/model/expert.jpg'),(21,'Partner',11,'/images/model/partner.jpg'),(22,'Kengoo',12,'/images/model/kengoo.jpg'),(23,'Mascott',12,'/images/model/mascott.jpg'),(24,'Master',12,'/images/model/master.jpg'),(25,'Trafic',12,'/images/model/trafic.jpg'),(26,'Caddy',13,'/images/model/caddy.jpg'),(27,'Crafter',13,'/images/model/crafter.jpg');
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `description` text,
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UX_name` (`name`),
  KEY `FK_model` (`model_id`),
  CONSTRAINT `parts_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES (1,'Engine',1,'dasfs',5000.00),(2,'Transmission',1,'asfsdh',3000.00),(3,'Camshaft',1,'2342avbad',1000.00),(4,'asdf',1,'asdf',0.00);
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-22 14:24:41
