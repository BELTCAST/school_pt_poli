-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `acudiente`
--

DROP TABLE IF EXISTS `acudiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acudiente` (
  `acudiente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `ocupacion` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `municipio_id` int DEFAULT NULL,
  `vive_con_el_joven` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`acudiente_id`),
  KEY `municipio_id` (`municipio_id`),
  CONSTRAINT `acudiente_ibfk_1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`municipio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acudiente`
--

LOCK TABLES `acudiente` WRITE;
/*!40000 ALTER TABLE `acudiente` DISABLE KEYS */;
/*!40000 ALTER TABLE `acudiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignatura` (
  `asignatura_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `intensidad_horaria` int DEFAULT NULL,
  PRIMARY KEY (`asignatura_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `docente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`docente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `estudiante_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `acudiente_id` int DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `grado` varchar(50) DEFAULT NULL,
  `jornada` varchar(50) DEFAULT NULL,
  `municipio_id` int DEFAULT NULL,
  PRIMARY KEY (`estudiante_id`),
  KEY `acudiente_id` (`acudiente_id`),
  KEY `municipio_id` (`municipio_id`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`acudiente_id`) REFERENCES `acudiente` (`acudiente_id`),
  CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`municipio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grado` (
  `grado_id` int NOT NULL AUTO_INCREMENT,
  `cupos_disponibles` int DEFAULT NULL,
  `director_de_grado` varchar(100) DEFAULT NULL,
  `jornada` varchar(50) DEFAULT NULL,
  `salon` varchar(50) DEFAULT NULL,
  `institucion_id` int DEFAULT NULL,
  PRIMARY KEY (`grado_id`),
  KEY `institucion_id` (`institucion_id`),
  CONSTRAINT `grado_ibfk_1` FOREIGN KEY (`institucion_id`) REFERENCES `institucion` (`institucion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado_asignatura`
--

DROP TABLE IF EXISTS `grado_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grado_asignatura` (
  `grado_id` int NOT NULL,
  `asignatura_id` int NOT NULL,
  PRIMARY KEY (`grado_id`,`asignatura_id`),
  KEY `asignatura_id` (`asignatura_id`),
  CONSTRAINT `grado_asignatura_ibfk_1` FOREIGN KEY (`grado_id`) REFERENCES `grado` (`grado_id`),
  CONSTRAINT `grado_asignatura_ibfk_2` FOREIGN KEY (`asignatura_id`) REFERENCES `asignatura` (`asignatura_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado_asignatura`
--

LOCK TABLES `grado_asignatura` WRITE;
/*!40000 ALTER TABLE `grado_asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `grado_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado_docente`
--

DROP TABLE IF EXISTS `grado_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grado_docente` (
  `grado_id` int NOT NULL,
  `docente_id` int NOT NULL,
  PRIMARY KEY (`grado_id`,`docente_id`),
  KEY `docente_id` (`docente_id`),
  CONSTRAINT `grado_docente_ibfk_1` FOREIGN KEY (`grado_id`) REFERENCES `grado` (`grado_id`),
  CONSTRAINT `grado_docente_ibfk_2` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`docente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado_docente`
--

LOCK TABLES `grado_docente` WRITE;
/*!40000 ALTER TABLE `grado_docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `grado_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion`
--

DROP TABLE IF EXISTS `institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucion` (
  `institucion_id` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `cupos_disponibles` int DEFAULT NULL,
  `tipo_institucion` varchar(50) DEFAULT NULL,
  `municipio_id` int DEFAULT NULL,
  `solicitud_id` int DEFAULT NULL,
  PRIMARY KEY (`institucion_id`),
  KEY `municipio_id` (`municipio_id`),
  KEY `solicitud_id` (`solicitud_id`),
  CONSTRAINT `institucion_ibfk_1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`municipio_id`),
  CONSTRAINT `institucion_ibfk_2` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitud` (`solicitud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion`
--

LOCK TABLES `institucion` WRITE;
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `municipio_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`municipio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `solicitud_id` int NOT NULL AUTO_INCREMENT,
  `renueva` tinyint(1) DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `grado_que_solicita` varchar(50) DEFAULT NULL,
  `estudiante_id` int DEFAULT NULL,
  PRIMARY KEY (`solicitud_id`),
  KEY `estudiante_id` (`estudiante_id`),
  CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`estudiante_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-23 18:29:17
