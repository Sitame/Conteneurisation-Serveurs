-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: voyage
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

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
-- Table structure for table `activite`
--

DROP TABLE IF EXISTS `activite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activite` (
  `idActivite` int(11) NOT NULL,
  `libelleActivite` varchar(48) NOT NULL,
  PRIMARY KEY (`idActivite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activite`
--

LOCK TABLES `activite` WRITE;
/*!40000 ALTER TABLE `activite` DISABLE KEYS */;
INSERT INTO `activite` VALUES (3,'Culture');
/*!40000 ALTER TABLE `activite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(48) NOT NULL,
  `prenom` varchar(48) NOT NULL,
  `adresse` varchar(96) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientInscritVoyage`
--

DROP TABLE IF EXISTS `clientInscritVoyage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientInscritVoyage` (
  `idNmVoyage` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `nbPlaceReserve` int(11) NOT NULL,
  PRIMARY KEY (`idNmVoyage`,`idClient`),
  KEY `idClient` (`idClient`),
  CONSTRAINT `clientInscritVoyage_ibfk_1` FOREIGN KEY (`idNmVoyage`) REFERENCES `instanceVoyage` (`id`) ON DELETE CASCADE,
  CONSTRAINT `clientInscritVoyage_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientInscritVoyage`
--

LOCK TABLES `clientInscritVoyage` WRITE;
/*!40000 ALTER TABLE `clientInscritVoyage` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientInscritVoyage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide`
--

DROP TABLE IF EXISTS `guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guide` (
  `id` int(11) NOT NULL,
  `nom` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide`
--

LOCK TABLES `guide` WRITE;
/*!40000 ALTER TABLE `guide` DISABLE KEYS */;
INSERT INTO `guide` VALUES (1,'Cléôpatre'),(2,'Mohamed'),(3,'Tao'),(4,'Yún chá'),(5,'Georges'),(6,'Touarig'),(7,'Pablo'),(8,'ALEXIS');
/*!40000 ALTER TABLE `guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guideParticipeVoyage`
--

DROP TABLE IF EXISTS `guideParticipeVoyage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guideParticipeVoyage` (
  `idGuide` int(11) NOT NULL,
  `idVoyage` int(11) NOT NULL,
  PRIMARY KEY (`idGuide`,`idVoyage`),
  KEY `idVoyage` (`idVoyage`),
  CONSTRAINT `guideParticipeVoyage_ibfk_1` FOREIGN KEY (`idGuide`) REFERENCES `guide` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guideParticipeVoyage_ibfk_2` FOREIGN KEY (`idVoyage`) REFERENCES `voyage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guideParticipeVoyage`
--

LOCK TABLES `guideParticipeVoyage` WRITE;
/*!40000 ALTER TABLE `guideParticipeVoyage` DISABLE KEYS */;
INSERT INTO `guideParticipeVoyage` VALUES (1,1),(2,2),(3,3),(3,4),(4,4),(4,5),(5,6),(6,7),(7,8);
/*!40000 ALTER TABLE `guideParticipeVoyage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instanceVoyage`
--

DROP TABLE IF EXISTS `instanceVoyage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instanceVoyage` (
  `id` int(11) NOT NULL,
  `idVoyage` int(11) NOT NULL,
  `dateDeb` date NOT NULL,
  `dateFin` date NOT NULL,
  `nbPlace` int(11) NOT NULL,
  PRIMARY KEY (`id`,`idVoyage`),
  KEY `idVoyage` (`idVoyage`),
  CONSTRAINT `instanceVoyage_ibfk_1` FOREIGN KEY (`idVoyage`) REFERENCES `voyage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instanceVoyage`
--

LOCK TABLES `instanceVoyage` WRITE;
/*!40000 ALTER TABLE `instanceVoyage` DISABLE KEYS */;
/*!40000 ALTER TABLE `instanceVoyage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langue`
--

DROP TABLE IF EXISTS `langue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langue` (
  `id` int(11) NOT NULL,
  `Libelle` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langue`
--

LOCK TABLES `langue` WRITE;
/*!40000 ALTER TABLE `langue` DISABLE KEYS */;
INSERT INTO `langue` VALUES (1,'Arabe'),(2,'Mandarin'),(3,'Cantonais'),(4,'Anglais'),(5,'Espagnol');
/*!40000 ALTER TABLE `langue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parler`
--

DROP TABLE IF EXISTS `parler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parler` (
  `idGuide` int(11) NOT NULL,
  `idLangue` int(11) NOT NULL,
  PRIMARY KEY (`idGuide`,`idLangue`),
  KEY `idLangue` (`idLangue`),
  CONSTRAINT `parler_ibfk_1` FOREIGN KEY (`idGuide`) REFERENCES `guide` (`id`) ON DELETE CASCADE,
  CONSTRAINT `parler_ibfk_2` FOREIGN KEY (`idLangue`) REFERENCES `langue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parler`
--

LOCK TABLES `parler` WRITE;
/*!40000 ALTER TABLE `parler` DISABLE KEYS */;
INSERT INTO `parler` VALUES (1,1),(1,4),(2,1),(2,5);
/*!40000 ALTER TABLE `parler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pays` (
  `code` int(11) NOT NULL,
  `nom` varchar(48) DEFAULT NULL,
  `photos` varchar(96) DEFAULT NULL,
  `idLangue` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `idLangue` (`idLangue`),
  CONSTRAINT `pays_ibfk_1` FOREIGN KEY (`idLangue`) REFERENCES `langue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (1,'Egypte','Egypte.jpg',1),(2,'Chine','Chine.jpg',2),(3,'Etats-Unis','USA.jpg',3),(4,'Maroc','Maroc.jpg',4),(5,'Perou','Perou.jpg',5);
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `login` varchar(48) NOT NULL,
  `password` varchar(96) NOT NULL,
  `grade` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'Directeur','Directeur',1),(2,'Hotesse','Hotesse',2),(3,'Guide','Guide',3);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ville`
--

DROP TABLE IF EXISTS `ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ville` (
  `id` int(11) NOT NULL,
  `nom` varchar(48) DEFAULT NULL,
  `idPays` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPays` (`idPays`),
  CONSTRAINT `ville_ibfk_1` FOREIGN KEY (`idPays`) REFERENCES `pays` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ville`
--

LOCK TABLES `ville` WRITE;
/*!40000 ALTER TABLE `ville` DISABLE KEYS */;
INSERT INTO `ville` VALUES (1,'Le Caire',1),(2,'Alexandrie',1),(3,'Pekin',2),(4,'Shanghai',2),(5,'Hong-Kong',2),(6,'Xian',2),(7,'Dallas',3),(8,'Laâyoune',4),(9,'Lima',5);
/*!40000 ALTER TABLE `ville` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villeDepartVoyage`
--

DROP TABLE IF EXISTS `villeDepartVoyage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `villeDepartVoyage` (
  `idVoyage` int(11) NOT NULL,
  `idVille` int(11) NOT NULL,
  PRIMARY KEY (`idVoyage`,`idVille`),
  KEY `idVille` (`idVille`),
  CONSTRAINT `villeDepartVoyage_ibfk_1` FOREIGN KEY (`idVoyage`) REFERENCES `voyage` (`id`) ON DELETE CASCADE,
  CONSTRAINT `villeDepartVoyage_ibfk_2` FOREIGN KEY (`idVille`) REFERENCES `ville` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villeDepartVoyage`
--

LOCK TABLES `villeDepartVoyage` WRITE;
/*!40000 ALTER TABLE `villeDepartVoyage` DISABLE KEYS */;
INSERT INTO `villeDepartVoyage` VALUES (1,2),(2,1),(3,4),(4,3),(5,6),(6,7),(7,8),(8,9);
/*!40000 ALTER TABLE `villeDepartVoyage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voyage`
--

DROP TABLE IF EXISTS `voyage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voyage` (
  `id` int(11) NOT NULL,
  `nom` varchar(48) DEFAULT NULL,
  `idVilleArrivee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idVilleArrivee` (`idVilleArrivee`),
  CONSTRAINT `voyage_ibfk_1` FOREIGN KEY (`idVilleArrivee`) REFERENCES `ville` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voyage`
--

LOCK TABLES `voyage` WRITE;
/*!40000 ALTER TABLE `voyage` DISABLE KEYS */;
INSERT INTO `voyage` VALUES (1,'Balade sur le nil (Alexandrie-Le Caire)',1),(2,'Balade sur le nil (Le Caire-Alexandrie)',2),(3,'Un rêve d\'Asie (Sud-Est de La Chine)',5),(4,'Un rêve d\'Asie (Nord-Est de La Chine)',3),(5,'Un rêve d\'Asie (Centre de La Chine)',6),(6,'American Dream (Texas)',7),(7,'Le Sahara : Un désert pas comme les autres',8),(8,'Au coeur des Andes',9);
/*!40000 ALTER TABLE `voyage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-01 16:46:58
