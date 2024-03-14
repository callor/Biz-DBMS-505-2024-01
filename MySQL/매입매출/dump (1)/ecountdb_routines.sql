CREATE DATABASE  IF NOT EXISTS `ecountdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecountdb`;
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
-- Temporary view structure for view `view_iolist`
--

DROP TABLE IF EXISTS `view_iolist`;
/*!50001 DROP VIEW IF EXISTS `view_iolist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_iolist` AS SELECT 
 1 AS `io_seq`,
 1 AS `io_date`,
 1 AS `io_time`,
 1 AS `io_pcode`,
 1 AS `p_name`,
 1 AS `p_item`,
 1 AS `p_comp`,
 1 AS `io_dcode`,
 1 AS `d_name`,
 1 AS `d_ceo`,
 1 AS `d_tel`,
 1 AS `d_addr`,
 1 AS `io_div`,
 1 AS `io_quan`,
 1 AS `io_iprice`,
 1 AS `io_oprice`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_iolist`
--

/*!50001 DROP VIEW IF EXISTS `view_iolist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_iolist` AS select `tbl_iolist`.`io_seq` AS `io_seq`,`tbl_iolist`.`io_date` AS `io_date`,`tbl_iolist`.`io_time` AS `io_time`,`tbl_iolist`.`io_pcode` AS `io_pcode`,`tbl_products`.`p_name` AS `p_name`,`tbl_products`.`p_item` AS `p_item`,`tbl_products`.`p_comp` AS `p_comp`,`tbl_iolist`.`io_dcode` AS `io_dcode`,`tbl_depts`.`d_name` AS `d_name`,`tbl_depts`.`d_ceo` AS `d_ceo`,`tbl_depts`.`d_tel` AS `d_tel`,`tbl_depts`.`d_addr` AS `d_addr`,`tbl_iolist`.`io_div` AS `io_div`,`tbl_iolist`.`io_quan` AS `io_quan`,`tbl_iolist`.`io_iprice` AS `io_iprice`,`tbl_iolist`.`io_oprice` AS `io_oprice` from ((`tbl_iolist` left join `tbl_products` on((`tbl_iolist`.`io_pcode` = `tbl_products`.`p_code`))) left join `tbl_depts` on((`tbl_iolist`.`io_dcode` = `tbl_depts`.`d_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-30 14:46:12
