-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ecountdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `tbl_depts`
--

DROP TABLE IF EXISTS `tbl_depts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_depts` (
  `d_code` varchar(5) NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `d_ceo` varchar(20) DEFAULT NULL,
  `d_tel` varchar(15) DEFAULT NULL,
  `d_addr` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`d_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_depts`
--

LOCK TABLES `tbl_depts` WRITE;
/*!40000 ALTER TABLE `tbl_depts` DISABLE KEYS */;
INSERT INTO `tbl_depts` VALUES ('D0001','강릉농협하나로마트 임당점','감도원','',''),('D0002','강릉농협하나로마트 포남점','갈찬우','',''),('D0003','강릉농협하나로마트강동점','강원일','',''),('D0004','강릉농협하나로마트고단점','강수한','',''),('D0005','강릉농협하나로마트구정점','강영찬','',''),('D0006','강릉농협하나로마트사업소','갈재빈','',''),('D0007','강릉농협하나로마트성산점','강승완','',''),('D0008','강릉농협하나로마트왕산점','강송빈','',''),('D0009','강릉농협하나로마트정동점','강시우','',''),('D0010','강릉농협하나로편의점','감선우','',''),('D0011','강릉사천농협하나로마트본점','강원일','',''),('D0012','강릉원예농협 금학지점','가지민','',''),('D0013','강릉원예농협하나로마트초당점','강대원','',''),('D0014','강릉원예농협협동조합','가시율','',''),('D0015','강릉축협하나로마트내곡점','갈은규','',''),('D0016','강릉축협하나로마트성남점','가지민','',''),('D0017','강릉축협하나로마트포남점','가진혁','',''),('D0018','강원양돈농협 대학로하나로마트','갈준아','',''),('D0019','강원양돈농협 본점하나로마트','간채민','',''),('D0020','강원양돈농협성덕하나로마트','갈성원','',''),('D0021','강원양돈농협송정하나로마트','갈원우','',''),('D0022','강원양돈농협주문진하나로마트','가시빈','',''),('D0023','거진농협하나로마트본점','강윤채','',''),('D0024','거진농협하나로마트현내점','강이준','',''),('D0025','고성축협하나로마트거진점','강윤일','',''),('D0026','근덕농협하나로마트본점','경우준','',''),('D0027','금강농협하나로마트본점','강윤찬','',''),('D0028','금강농협하나로마트송암점','강재혁','',''),('D0029','금강농협하나로마트죽왕점','강준일','',''),('D0030','동해농협하나로마트북삼점','강지호','',''),('D0031','동해농협하나로마트사업소','강채민','',''),('D0032','동해농협하나로마트송정점','강준혁','',''),('D0033','동해농협하나로마트천곡점','강현호','',''),('D0034','동해삼척태백축협하나로마트근덕점','경서준','',''),('D0035','동해삼척태백축협하나로마트본점','견준상','',''),('D0036','동해삼척태백축협하나로마트제2판매장','견장혁','',''),('D0037','동해삼척태백축협하나로마트천곡점','강진혁','',''),('D0038','묵호농협하나로마트본점','강진영','',''),('D0039','묵호농협하나로마트부곡점','강준후','',''),('D0040','북강릉농협하나로마트연곡점','강연호','',''),('D0041','삼척농협하나로마트미로점','경동율','',''),('D0042','삼척농협하나로마트사업소','견재영','',''),('D0043','삼척농협하나로마트사직점','견동후','',''),('D0044','삼척농협하나로마트정라점','견선후','',''),('D0045','삼척농협하나로마트하장점','견효찬','',''),('D0046','옥계농협하나로마트본점','강우찬','',''),('D0047','원덕농협하나로마트본점','개성현','',''),('D0048','토성농협하나로마트백촌점','강장우','',''),('D0049','토성농협하나로마트본점','강이찬','',''),('D0050','토성농협하나로마트아야진점','강이황','','');
/*!40000 ALTER TABLE `tbl_depts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-30  9:11:39
