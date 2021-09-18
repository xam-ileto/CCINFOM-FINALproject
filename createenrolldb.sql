CREATE DATABASE  IF NOT EXISTS `enrolldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `enrolldb`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: enrolldb
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `coursedegree`
--

DROP TABLE IF EXISTS `coursedegree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coursedegree` (
  `courseid` varchar(24) NOT NULL,
  `degree` varchar(10) NOT NULL,
  PRIMARY KEY (`courseid`,`degree`),
  KEY `FK002_idx` (`degree`),
  CONSTRAINT `FK001` FOREIGN KEY (`courseid`) REFERENCES `courses` (`courseid`),
  CONSTRAINT `FK002` FOREIGN KEY (`degree`) REFERENCES `degree` (`degreeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursedegree`
--

LOCK TABLES `coursedegree` WRITE;
/*!40000 ALTER TABLE `coursedegree` DISABLE KEYS */;
INSERT INTO `coursedegree` VALUES ('CCICOMP','BSCS'),('CCINFOM','BSCS'),('CCPROG1','BSCS'),('CCPROG2','BSCS'),('CCICOMP','BSIS'),('CCINFOM','BSIS'),('CCPROG1','BSIS'),('CCPROG3','BSIS'),('ISINFOM','BSIS'),('ITISORG','BSIS'),('CCICOMP','BSIT'),('CCINFOM','BSIT'),('CCPROG1','BSIT'),('CCPROG2','BSIT'),('ITISORG','BSIT'),('ITSECUR','BSIT');
/*!40000 ALTER TABLE `coursedegree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `courseid` varchar(25) NOT NULL,
  `coursename` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('CCICOMP','Introduction to Computing','Computer Technology'),('CCINFOM','Introduction to Databases','Information Technology'),('CCPROG1','Computer Programming 1','Software Technology'),('CCPROG2','Computer Programming 2','Software Technology'),('CCPROG3','Object-Oriented Programming','Software Technology'),('ISINFOM','Business Intelligence','Information Technology'),('ITISORG','Organizations and Management','Information Technology'),('ITSECUR','Information Security','Computer Technology');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree` (
  `degreeid` varchar(10) NOT NULL,
  `degreename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`degreeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES ('BSCS','Bachelor of Science in Computer Science'),('BSIS','Bachelor of Science in Information Systems'),('BSIT','Bachelor of Science in Information Technology');
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `studentid` bigint(8) NOT NULL,
  `courseid` varchar(25) NOT NULL,
  `term` int(1) NOT NULL,
  `schoolyear` int(8) NOT NULL,
  PRIMARY KEY (`studentid`,`courseid`,`term`,`schoolyear`),
  KEY `FK004_idx` (`courseid`),
  CONSTRAINT `FK003` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK004` FOREIGN KEY (`courseid`) REFERENCES `courses` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (10100001,'CCPROG1',1,20192020),(10100002,'CCPROG1',1,20192020),(10100003,'CCPROG1',1,20192020),(10100004,'CCPROG1',1,20192020),(10100005,'CCPROG1',1,20192020),(10100006,'CCPROG1',1,20192020),(10100007,'CCPROG1',1,20192020),(10100007,'CCPROG1',2,20192020),(10100008,'CCPROG1',1,20192020),(10100008,'CCPROG1',2,20192020),(10100009,'CCPROG1',1,20192020),(10100009,'CCPROG1',2,20192020),(10100010,'CCPROG1',1,20192020),(10100010,'CCPROG1',2,20192020),(10100011,'CCPROG1',1,20192020),(10100011,'CCPROG1',2,20192020),(10100001,'CCPROG2',2,20192020),(10100002,'CCPROG2',2,20192020),(10100003,'CCPROG2',2,20192020),(10100004,'CCPROG2',2,20192020),(10100005,'CCPROG2',2,20192020),(10100006,'CCPROG2',2,20192020);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `studentid` bigint(8) NOT NULL,
  `completename` varchar(45) DEFAULT NULL,
  `degreeid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (10100001,'Angela Reyes','BSCS'),(10100002,'Bernice Yung','BSCS'),(10100003,'Candice Everdeen','BSIS'),(10100004,'Daniela Campos','BSIT'),(10100005,'Elisa Sico','BSIS'),(10100006,'Fiona Layug','BSIS'),(10100007,'Gabriela Silang','BSIT'),(10100008,'Henrietta Ong','BSCS'),(10100009,'Isabel Hong','BSCS'),(10100010,'Jasmine Lee','BSCS'),(10100011,'Kathleen Bulag','BSIT');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'enrolldb'
--

--
-- Dumping routines for database 'enrolldb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-21 12:32:40
