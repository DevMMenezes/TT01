CREATE DATABASE  IF NOT EXISTS `tt01` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tt01`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tt01
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `cidade` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `uf` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'N1','C1','U1'),(2,'N2','C2','U2'),(10,'N10','C10','U1'),(11,'N10','C10','U1'),(12,'N10','C10','U1'),(13,'N3','C3','U3'),(14,'N4','C4','U4'),(15,'N5','C5','U5'),(16,'N6','C6','U6'),(17,'N7','C7','U7'),(18,'N8','C8','U8'),(19,'N9','C9','U9'),(20,'N10','C10','U1'),(21,'N11','C11','U1'),(22,'N12','C12','U1'),(23,'N13','C13','U1'),(24,'N14','C14','U1'),(25,'N15','C15','U1'),(26,'N16','C16','U1'),(27,'N17','C17','U1'),(28,'N18','C18','U1'),(29,'N19','C19','U1'),(30,'N20','C20','U1'),(31,'N21','C21','U1');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `numero_pedido` int NOT NULL AUTO_INCREMENT,
  `data_emissao` varchar(45) COLLATE utf8mb3_bin DEFAULT 'now',
  `codigo_cliente` int NOT NULL,
  `valor_total` decimal(15,3) DEFAULT NULL,
  `pedidoscol` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`numero_pedido`),
  KEY `FKCliente_idx` (`codigo_cliente`),
  CONSTRAINT `FKCliente` FOREIGN KEY (`codigo_cliente`) REFERENCES `clientes` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (6,'2024-11-17 14:30:28',1,0.000,NULL),(7,'2024-11-17 14:30:28',1,0.000,NULL),(8,'2024-11-17 14:30:28',1,0.000,NULL),(9,'2024-11-17 14:30:28',1,0.000,NULL),(11,'2024-11-17 14:30:28',1,0.000,NULL),(12,'2024-11-17 14:30:28',1,0.000,NULL),(13,'2024-11-17 14:30:28',1,0.000,NULL),(14,'2024-11-17 14:30:28',1,0.000,NULL),(15,'2024-11-17 14:30:28',1,0.000,NULL),(16,'2024-11-17 14:30:28',1,0.000,NULL),(17,'2024-11-17 14:30:28',1,0.000,NULL),(18,'2024-11-17 14:30:28',1,0.000,NULL),(19,'2024-11-17 14:30:28',1,0.000,NULL),(20,'2024-11-17 14:30:28',1,0.000,NULL),(21,'2024-11-17 14:30:28',1,0.000,NULL),(23,'2024-11-17 14:30:28',1,0.000,NULL),(27,'2024-11-17 14:30:28',1,0.000,NULL),(29,'2024-11-17 14:30:28',1,0.000,NULL),(30,'2024-11-17 14:30:28',1,0.000,NULL),(31,'2024-11-17 14:30:28',1,0.000,NULL),(32,'2024-11-17 14:30:28',1,0.000,NULL),(33,'2024-11-17 14:30:28',1,0.000,NULL),(34,'2024-11-17 14:30:28',1,0.000,NULL),(35,'2024-11-17 14:30:28',1,0.000,NULL),(36,'2024-11-17 14:30:28',1,0.000,NULL),(37,'2024-11-17 14:30:28',1,0.000,NULL),(38,'2024-11-17 14:30:28',1,0.000,NULL),(39,'2024-11-17 14:30:28',1,0.000,NULL),(40,'2024-11-17 14:30:28',1,0.000,NULL),(41,'2024-11-17 14:30:28',1,0.000,NULL),(42,'2024-11-17 14:30:28',1,0.000,NULL),(43,'2024-11-17 14:30:28',1,0.000,NULL),(44,'2024-11-17 14:30:28',1,0.000,NULL),(45,'2024-11-17 14:30:28',1,0.000,NULL),(46,'2024-11-17 14:30:28',1,0.000,NULL),(47,'2024-11-17 14:30:28',1,0.000,NULL),(48,'2024-11-17 14:30:28',1,0.000,NULL),(49,'2024-11-17 14:30:28',1,0.000,NULL),(50,'2024-11-17 14:30:28',1,0.000,NULL),(51,'2024-11-17 14:30:28',1,0.000,NULL),(52,'2024-11-17 14:30:28',1,0.000,NULL),(55,'2024-11-17 14:30:28',1,0.000,NULL),(56,'2024-11-17 14:30:28',1,0.000,NULL),(57,'2024-11-17 14:30:28',1,0.000,NULL),(58,'2024-11-17 14:30:28',1,0.000,NULL),(60,'2024-11-17 14:30:28',1,0.000,NULL),(64,'2024-11-17 14:30:28',1,0.000,NULL),(65,'2024-11-17 14:30:28',1,0.000,NULL),(66,'2024-11-17 14:30:28',1,0.000,NULL),(67,'2024-11-17 14:30:28',1,0.000,NULL),(68,'2024-11-17 14:30:28',1,0.000,NULL),(69,'2024-11-17 14:30:28',1,0.000,NULL),(70,'2024-11-17 14:30:28',1,0.000,NULL),(71,'2024-11-17 14:30:28',1,0.000,NULL),(73,'2024-11-17 14:30:28',1,0.000,NULL),(75,'2024-11-17 14:30:28',1,0.000,NULL),(76,'2024-11-17 14:30:28',1,0.000,NULL),(78,'2024-11-17 14:30:28',1,0.000,NULL),(79,'2024-11-17 14:30:28',1,0.000,NULL),(80,'2024-11-17 14:30:28',1,0.000,NULL),(81,'2024-11-17 14:30:28',1,0.000,NULL),(82,'2024-11-17 14:30:28',1,0.000,NULL),(83,'2024-11-17 14:30:28',1,0.000,NULL),(84,'2024-11-17 14:30:28',1,0.000,NULL),(85,'2024-11-17 14:30:28',1,0.000,NULL),(86,'2024-11-17 14:30:28',1,0.000,NULL),(87,'2024-11-17 14:30:28',1,0.000,NULL),(88,'2024-11-17 14:30:28',1,0.000,NULL),(89,'2024-11-17 14:30:28',1,0.000,NULL),(90,'2024-11-17 14:30:28',1,0.000,NULL),(91,'2024-11-17 14:30:28',1,0.000,NULL);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_produtos`
--

DROP TABLE IF EXISTS `pedidos_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_produtos` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `numero_pedido` int NOT NULL,
  `codigo_produto` int NOT NULL,
  `quantidade` decimal(15,3) DEFAULT NULL,
  `vlr_unitario` decimal(15,3) DEFAULT NULL,
  `vlr_total` decimal(15,3) DEFAULT NULL,
  `pedidos_produtoscol` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FKPedido_idx` (`numero_pedido`),
  CONSTRAINT `FKPedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`numero_pedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_produtos`
--

LOCK TABLES `pedidos_produtos` WRITE;
/*!40000 ALTER TABLE `pedidos_produtos` DISABLE KEYS */;
INSERT INTO `pedidos_produtos` VALUES (5,23,1,1.000,10.000,10.000,NULL),(12,27,1,1.000,10.000,10.000,NULL),(17,29,1,1.000,10.000,10.000,NULL),(18,31,1,1.000,10.000,10.000,NULL),(19,31,2,1.000,20.000,20.000,NULL),(20,31,0,1.000,0.000,0.000,NULL),(21,34,1,1.000,10.000,10.000,NULL),(22,35,1,1.000,10.000,10.000,NULL),(23,35,2,1.000,20.000,20.000,NULL),(24,36,2,1.000,20.000,20.000,NULL),(25,37,2,1.000,20.000,20.000,NULL),(26,38,2,1.000,20.000,20.000,NULL),(27,38,1,1.000,10.000,10.000,NULL),(28,40,2,1.000,20.000,20.000,NULL),(29,43,2,1.000,20.000,20.000,NULL),(30,48,1,1.000,10.000,10.000,NULL),(31,49,2,1.000,20.000,20.000,NULL),(33,55,2,1.000,20.000,20.000,NULL),(34,57,2,1.000,20.000,20.000,NULL),(35,58,1,1.000,10.000,10.000,NULL),(37,60,1,1.000,10.000,10.000,NULL),(38,60,1,1.000,10.000,10.000,NULL),(39,60,1,1.000,10.000,10.000,NULL),(45,64,2,1.000,20.000,20.000,NULL),(46,64,2,1.000,20.000,20.000,NULL),(47,64,1,1.000,10.000,10.000,NULL),(48,64,1,1.000,10.000,10.000,NULL),(49,65,1,1.000,10.000,10.000,NULL),(50,65,2,1.000,20.000,20.000,NULL),(51,66,1,1.000,10.000,10.000,NULL),(52,66,2,1.000,20.000,20.000,NULL),(53,67,2,1.000,20.000,20.000,NULL),(54,67,1,1.000,10.000,10.000,NULL),(55,68,2,1.000,20.000,20.000,NULL),(56,68,1,1.000,10.000,10.000,NULL),(57,68,2,1.000,20.000,20.000,NULL),(58,68,2,1.000,20.000,20.000,NULL),(59,69,1,1.000,10.000,10.000,NULL),(60,69,2,1.000,20.000,20.000,NULL),(61,70,2,1.000,20.000,20.000,NULL),(62,70,1,1.000,10.000,10.000,NULL),(63,71,2,1.000,20.000,20.000,NULL),(64,71,1,1.000,10.000,10.000,NULL),(70,78,1,1.000,10.000,10.000,NULL),(71,78,1,1.000,10.000,10.000,NULL),(72,78,1,1.000,10.000,10.000,NULL),(73,79,1,1.000,10.000,10.000,NULL),(74,80,2,1.000,20.000,20.000,NULL),(75,80,2,1.000,20.000,20.000,NULL),(76,80,1,1.000,10.000,10.000,NULL),(77,80,1,1.000,10.000,10.000,NULL),(78,81,1,1.000,10.000,10.000,NULL),(79,81,2,1.000,20.000,20.000,NULL),(80,82,2,1.000,20.000,20.000,NULL),(81,82,1,1.000,10.000,10.000,NULL),(82,83,2,1.000,20.000,20.000,NULL),(83,83,1,1.000,10.000,10.000,NULL),(84,84,2,1.000,20.000,20.000,NULL),(85,84,2,1.000,20.000,20.000,NULL),(86,85,1,1.000,10.000,10.000,NULL),(87,86,1,1.000,10.000,10.000,NULL),(88,86,2,1.000,20.000,20.000,NULL),(89,87,1,1.000,10.000,10.000,NULL),(90,87,2,1.000,20.000,20.000,NULL),(91,88,1,1.000,10.000,10.000,NULL),(92,88,2,1.000,20.000,20.000,NULL),(93,88,2,1.000,20.000,20.000,NULL),(94,88,1,1.000,10.000,10.000,NULL),(95,89,1,1.000,10.000,10.000,NULL),(96,89,2,1.000,20.000,20.000,NULL),(97,90,1,1.000,10.000,10.000,NULL),(98,90,2,1.000,20.000,20.000,NULL),(99,90,2,1.000,20.000,20.000,NULL),(100,90,1,15.000,10.000,150.000,NULL),(101,90,1,11.000,10.000,114.000,NULL),(102,91,2,1.000,20.000,20.000,NULL),(103,91,3,1.000,4.000,4.000,NULL),(104,91,4,1.000,34.000,34.000,NULL),(105,91,3,11.120,4.000,44.480,NULL),(106,91,1,1.000,10.200,10.200,NULL);
/*!40000 ALTER TABLE `pedidos_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(80) COLLATE utf8mb3_bin NOT NULL,
  `preco_de_venda` decimal(15,3) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'P1',10.000),(2,'P2',20.000),(3,'P3',4.000),(4,'P4',34.000),(5,'P5',2.000),(6,'P6',7.000),(7,'P7',8.000),(8,'P8',1.000),(9,'P9',23.000),(10,'P10',87.000),(11,'P11',32.000),(12,'P12',96.000),(13,'P13',3.000),(14,'P14',4.000),(15,'P15',9.000),(16,'P16',4.000),(17,'P17',1.000),(18,'P18',2.000),(19,'P19',69.000),(20,'P20',7.000),(21,'P21',9.000);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 14:32:12
