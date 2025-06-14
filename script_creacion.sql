-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (arm64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	8.4.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Aud_Carga`
--

DROP TABLE IF EXISTS `Aud_Carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aud_Carga` (
  `Id_Aud` int NOT NULL AUTO_INCREMENT,
  `Id_Carga` int NOT NULL,
  `Fecha_Old` date NOT NULL,
  `Litros_Old` decimal(10,2) NOT NULL,
  `Costo_Old` decimal(12,2) NOT NULL,
  `Id_Veh_Old` int NOT NULL,
  `Id_Est_Old` int NOT NULL,
  `Fecha_Op` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Tipo_Op` enum('DELETE','UPDATE') NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Aud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aud_Carga`
--

LOCK TABLES `Aud_Carga` WRITE;
/*!40000 ALTER TABLE `Aud_Carga` DISABLE KEYS */;
/*!40000 ALTER TABLE `Aud_Carga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carga`
--

DROP TABLE IF EXISTS `Carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carga` (
  `Id_Carga` int NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Litros_Cargados` decimal(10,2) DEFAULT NULL,
  `Costo_Total` decimal(12,2) DEFAULT NULL,
  `Id_Vehiculo` int DEFAULT NULL,
  `Id_Estacion` int DEFAULT NULL,
  PRIMARY KEY (`Id_Carga`),
  KEY `Id_Vehiculo` (`Id_Vehiculo`),
  KEY `Id_Estacion` (`Id_Estacion`),
  CONSTRAINT `carga_ibfk_1` FOREIGN KEY (`Id_Vehiculo`) REFERENCES `Vehiculo` (`Id_Vehiculo`),
  CONSTRAINT `carga_ibfk_2` FOREIGN KEY (`Id_Estacion`) REFERENCES `Gasolinera` (`Id_Estacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carga`
--

LOCK TABLES `Carga` WRITE;
/*!40000 ALTER TABLE `Carga` DISABLE KEYS */;
INSERT INTO `Carga` VALUES (2000,'2023-10-01',82.50,2054.25,105,1),(2001,'2023-10-05',78.30,1781.33,10,2),(2002,'2023-10-10',65.00,1625.00,106,3),(2003,'2023-10-15',70.75,1874.88,107,4),(2004,'2023-10-20',76.20,1905.00,108,5),(2005,'2023-10-25',88.40,2210.00,11,6),(2006,'2023-11-01',72.90,1822.50,12,7),(2007,'2023-11-05',83.60,2090.00,13,8),(2008,'2023-11-10',79.80,1995.00,14,9),(2009,'2023-11-15',90.00,2250.00,15,10),(2010,'2023-11-20',92.25,2075.63,26,11),(2011,'2023-11-25',85.60,1926.00,27,12),(2012,'2023-11-30',75.30,1694.25,28,13),(2013,'2023-12-05',88.90,2000.25,29,14),(2014,'2023-12-10',80.00,1800.00,30,15),(2015,'2023-12-15',68.50,1541.25,31,16),(2016,'2023-12-20',95.20,2142.00,32,17),(2017,'2023-12-25',77.75,1749.38,33,18),(2018,'2023-12-30',89.10,2004.75,34,19),(2019,'2024-01-05',82.00,1845.00,35,20),(2025,'2025-06-04',55.00,1320.00,10,20),(8000,'2025-06-04',42.00,1300.00,10,20),(8002,'2025-06-14',1500.00,75.00,111,1);
/*!40000 ALTER TABLE `Carga` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_aud_carga_update` BEFORE UPDATE ON `carga` FOR EACH ROW BEGIN
  INSERT INTO Aud_Carga (
    Id_Carga,
    Fecha_Op,
    Tipo_Op,
    Usuario,
    Fecha_Old,
    Litros_Old,
    Costo_Old,
    Id_Veh_Old,
    Id_Est_Old
  ) VALUES (
    OLD.Id_Carga,
    NOW(),
    'UPDATE',
    USER(),
    OLD.Fecha,
    OLD.Litros_Cargados,
    OLD.Costo_Total,
    OLD.Id_Vehiculo,
    OLD.Id_Estacion
  );
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_aud_carga_delete` BEFORE DELETE ON `carga` FOR EACH ROW BEGIN
  INSERT INTO Aud_Carga (
    Id_Carga,
    Fecha_Op,
    Tipo_Op,
    Usuario,
    Fecha_Old,
    Litros_Old,
    Costo_Old,
    Id_Veh_Old,
    Id_Est_Old
  ) VALUES (
    OLD.Id_Carga,
    NOW(),
    'DELETE',
    USER(),
    OLD.Fecha,
    OLD.Litros_Cargados,
    OLD.Costo_Total,
    OLD.Id_Vehiculo,
    OLD.Id_Estacion
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Carga_Pago`
--

DROP TABLE IF EXISTS `Carga_Pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carga_Pago` (
  `Id_Pago` int NOT NULL AUTO_INCREMENT,
  `Id_Carga` int DEFAULT NULL,
  `Id_Modo` int DEFAULT NULL,
  `Monto` decimal(12,2) DEFAULT NULL,
  `Litros` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Id_Pago`),
  KEY `Id_Carga` (`Id_Carga`),
  KEY `Id_Modo` (`Id_Modo`),
  CONSTRAINT `carga_pago_ibfk_1` FOREIGN KEY (`Id_Carga`) REFERENCES `Carga` (`Id_Carga`),
  CONSTRAINT `carga_pago_ibfk_2` FOREIGN KEY (`Id_Modo`) REFERENCES `ModosPago` (`Id_Modo`)
) ENGINE=InnoDB AUTO_INCREMENT=3020 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carga_Pago`
--

LOCK TABLES `Carga_Pago` WRITE;
/*!40000 ALTER TABLE `Carga_Pago` DISABLE KEYS */;
INSERT INTO `Carga_Pago` VALUES (3000,2000,1001,2054.25,82.50),(3001,2001,1002,1781.33,78.30),(3002,2002,1003,1625.00,65.00),(3003,2003,1004,1874.88,70.75),(3004,2004,1005,1905.00,76.20),(3005,2005,1006,2210.00,88.40),(3006,2006,1007,1822.50,72.90),(3007,2007,1008,2090.00,83.60),(3008,2008,1009,1995.00,79.80),(3009,2009,1010,2250.00,90.00),(3010,2010,1011,2075.63,92.25),(3011,2011,1012,1926.00,85.60),(3012,2012,1013,1694.25,75.30),(3013,2013,1014,2000.25,88.90),(3014,2014,1015,1800.00,80.00),(3015,2015,1016,1541.25,68.50),(3016,2016,1017,2142.00,95.20),(3017,2017,1018,1749.38,77.75),(3018,2018,1019,2004.75,89.10),(3019,2019,1020,1845.00,82.00);
/*!40000 ALTER TABLE `Carga_Pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gasolinera`
--

DROP TABLE IF EXISTS `Gasolinera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gasolinera` (
  `Id_Estacion` int NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(100) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Estacion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gasolinera`
--

LOCK TABLES `Gasolinera` WRITE;
/*!40000 ALTER TABLE `Gasolinera` DISABLE KEYS */;
INSERT INTO `Gasolinera` VALUES (1,'Av. Insurgentes Sur 2450, CDMX','Pemex'),(2,'Calz. de Tlalpan 1565, CDMX','Shell'),(3,'Eje Central Lázaro Cárdenas 800, CDMX','BP'),(4,'Av. Revolución 1300, CDMX','Gulf'),(5,'Av. Universidad 300, CDMX','Pemex'),(6,'Periférico Sur 5600, CDMX','Shell'),(7,'Av. Miguel Ángel de Quevedo 700, CDMX','BP'),(8,'Calle Dr. Vértiz 1050, CDMX','Gulf'),(9,'Av. Cuauhtémoc 950, CDMX','Pemex'),(10,'Av. División del Norte 1400, CDMX','BP'),(11,'Av. Tláhuac 4200, CDMX','Pemex'),(12,'Av. Patriotismo 120, CDMX','Shell'),(13,'Eje 10 Sur 600, CDMX','Gulf'),(14,'Av. Río Churubusco 3400, CDMX','BP'),(15,'Calle Norte 45 #2000, CDMX','Pemex'),(16,'Blvd. Miguel de Cervantes, Toluca','Shell'),(17,'Av. Tecnológico, Querétaro','BP'),(18,'Av. Central, Ecatepec','Pemex'),(19,'Carretera Federal 57, San Luis Potosí','Gulf'),(20,'Av. López Mateos, Guadalajara','BP');
/*!40000 ALTER TABLE `Gasolinera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModosPago`
--

DROP TABLE IF EXISTS `ModosPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ModosPago` (
  `Id_Modo` int NOT NULL AUTO_INCREMENT,
  `Descripcion_Modo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Modo`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModosPago`
--

LOCK TABLES `ModosPago` WRITE;
/*!40000 ALTER TABLE `ModosPago` DISABLE KEYS */;
INSERT INTO `ModosPago` VALUES (1001,'Efectivo Directo'),(1002,'Efectivo Flotilla'),(1003,'Efectivo Viáticos'),(1004,'Efectivo Sucursal'),(1005,'Efectivo Gerencial'),(1006,'Efectivo Operativo'),(1007,'Efectivo Emergencia'),(1008,'Vale PEMEX Flotilla'),(1009,'Vale BP Empresarial'),(1010,'Vale Shell Fleet'),(1011,'Vale Total Combustible'),(1012,'Vale Mobil Corporativo'),(1013,'Vale G500 Flotillas'),(1014,'Vale Repsol Negocios'),(1015,'Vale Oxxo Gas Empresa'),(1016,'Pago Móvil'),(1017,'Tarjeta Débito Empresarial'),(1018,'Vales Electrónicos'),(1019,'Vale Gasolina Digital'),(1020,'Pago con Cheque Flotilla');
/*!40000 ALTER TABLE `ModosPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehiculo`
--

DROP TABLE IF EXISTS `Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehiculo` (
  `Id_Vehiculo` int NOT NULL AUTO_INCREMENT,
  `Cap_Tanque` decimal(10,2) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Placa` varchar(20) DEFAULT NULL,
  `Anio` year DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehiculo`
--

LOCK TABLES `Vehiculo` WRITE;
/*!40000 ALTER TABLE `Vehiculo` DISABLE KEYS */;
INSERT INTO `Vehiculo` VALUES (10,70.00,'Chrysler','VYG-1997',1997,'Voyager'),(11,70.00,'Ford','FLD-1123',2021,'Explorer XLT'),(12,65.50,'Toyota','TYT-4567',2019,'Highlander Limited'),(13,68.00,'Honda','HND-8910',2020,'Pilot Touring'),(14,72.00,'Nissan','NSN-2345',2018,'Pathfinder SL'),(15,66.75,'Jeep','JEP-6789',2022,'Grand Cherokee Alt.'),(26,98.00,'Ford','NAV-2626',2023,'Expedition XLT'),(27,85.00,'Chevrolet','NAV-2727',2022,'Tahoe LT'),(28,100.00,'GMC','NAV-2828',2021,'Yukon XL SLT'),(29,98.00,'Cadillac','NAV-2929',2023,'Escalade ESV'),(30,93.00,'Toyota','NAV-3030',2022,'Land Cruiser'),(31,90.00,'Nissan','NAV-3131',2021,'Armada Platinum'),(32,98.00,'Jeep','NAV-3232',2023,'Wagoneer Series III'),(33,93.00,'Lincoln','NAV-3333',2022,'Navigator L'),(34,90.00,'Land Rover','NAV-3434',2021,'Defender 110'),(35,100.00,'Chevrolet','NAV-3535',2023,'Suburban Premier'),(105,90.00,'Chevrolet','DESCONOCIDA',2005,'Suburban'),(106,100.00,'Chevrolet','JKL-321',2021,'Suburban'),(107,98.00,'Cadillac','MNO-654',2019,'Escalade'),(108,96.00,'GMC','PQR-987',2022,'Yukon'),(109,80.00,'honda','556_REM',2002,'accord'),(110,80.00,'Toyota','890_TYZ',2018,'Camry'),(111,90.00,'audi','789_ZYP',2020,'a1'),(112,100.00,'Chevrolet','999-ZZZ',2020,'Suburban');
/*!40000 ALTER TABLE `Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_cargas`
--

DROP TABLE IF EXISTS `vista_cargas`;
/*!50001 DROP VIEW IF EXISTS `vista_cargas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cargas` AS SELECT 
 1 AS `Id_Carga`,
 1 AS `Fecha`,
 1 AS `Litros_Cargados`,
 1 AS `Costo_Total`,
 1 AS `Placa`,
 1 AS `Estación`,
 1 AS `Modo_Pago`,
 1 AS `Monto`,
 1 AS `Litros`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_cargas`
--

/*!50001 DROP VIEW IF EXISTS `vista_cargas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cargas` AS select `c`.`Id_Carga` AS `Id_Carga`,`c`.`Fecha` AS `Fecha`,`c`.`Litros_Cargados` AS `Litros_Cargados`,`c`.`Costo_Total` AS `Costo_Total`,`v`.`Placa` AS `Placa`,`g`.`Direccion` AS `Estación`,`m`.`Descripcion_Modo` AS `Modo_Pago`,`cp`.`Monto` AS `Monto`,`cp`.`Litros` AS `Litros` from ((((`carga` `c` join `vehiculo` `v` on((`c`.`Id_Vehiculo` = `v`.`Id_Vehiculo`))) join `gasolinera` `g` on((`c`.`Id_Estacion` = `g`.`Id_Estacion`))) join `carga_pago` `cp` on((`cp`.`Id_Carga` = `c`.`Id_Carga`))) join `modospago` `m` on((`cp`.`Id_Modo` = `m`.`Id_Modo`))) */;
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

-- Dump completed on 2025-06-14 14:12:34
