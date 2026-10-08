-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: employee_payroll
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `allowances`
--

DROP TABLE IF EXISTS `allowances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allowances` (
  `allowance_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `allowance_type` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`allowance_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `allowances_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowances`
--

LOCK TABLES `allowances` WRITE;
/*!40000 ALTER TABLE `allowances` DISABLE KEYS */;
INSERT INTO `allowances` VALUES (1,1,'HRA',3000.00),(2,1,'Travel',2000.00),(3,2,'HRA',2500.00),(4,2,'Travel',1500.00),(5,3,'HRA',2000.00),(6,3,'Travel',1000.00),(7,4,'HRA',1500.00),(8,4,'Travel',1000.00),(9,5,'HRA',3500.00),(10,5,'Travel',2500.00),(11,6,'HRA',3000.00),(12,6,'Travel',2000.00),(13,7,'HRA',2000.00),(14,7,'Travel',1500.00),(15,8,'HRA',1500.00),(16,8,'Travel',1500.00),(17,1,'HRA',3000.00),(18,1,'Travel',2000.00),(19,2,'HRA',2500.00),(20,2,'Travel',1500.00),(21,3,'HRA',2000.00),(22,3,'Travel',1000.00),(23,4,'HRA',1500.00),(24,4,'Travel',1000.00),(25,5,'HRA',3500.00),(26,5,'Travel',2500.00),(27,6,'HRA',3000.00),(28,6,'Travel',2000.00),(29,7,'HRA',2000.00),(30,7,'Travel',1500.00),(31,8,'HRA',1500.00),(32,8,'Travel',1500.00);
/*!40000 ALTER TABLE `allowances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'IT'),(2,'HR'),(3,'Finance'),(4,'Marketing');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Rahul','rahul@gmail.com','9876543219',1),(2,'Priya','priya@gmail.com','9876543211',1),(3,'Arun','arun@gmail.com','9876543212',2),(4,'Divya','divya@gmail.com','9876543213',2),(5,'Karthik','karthik@gmail.com','9876543214',3),(6,'Sneha','sneha@gmail.com','9876543215',3),(7,'Vijay','vijay@gmail.com','9876543216',4),(8,'Anu','anu@gmail.com','9876543217',4),(22,'swethaa','sweth123@gmail.com','7878787878',2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_records`
--

DROP TABLE IF EXISTS `salary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_records` (
  `salary_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `basic_salary` decimal(10,2) NOT NULL,
  `allowance_amount` decimal(10,2) DEFAULT '0.00',
  `deduction` decimal(10,2) DEFAULT '0.00',
  `net_salary` decimal(10,2) DEFAULT '0.00',
  `salary_date` date DEFAULT NULL,
  PRIMARY KEY (`salary_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `salary_records_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_records`
--

LOCK TABLES `salary_records` WRITE;
/*!40000 ALTER TABLE `salary_records` DISABLE KEYS */;
INSERT INTO `salary_records` VALUES (1,1,50000.00,5000.00,2000.00,53000.00,'2026-10-01'),(2,2,45000.00,4000.00,1500.00,47500.00,'2026-10-01'),(3,3,40000.00,3000.00,1000.00,42000.00,'2026-10-01'),(4,4,35000.00,2500.00,1000.00,36500.00,'2026-10-01'),(5,5,60000.00,6000.00,2500.00,63500.00,'2026-10-01'),(6,6,55000.00,5000.00,2000.00,58000.00,'2026-10-01'),(7,7,45000.00,3500.00,1500.00,47000.00,'2026-10-01'),(8,8,40000.00,3000.00,1000.00,42000.00,'2026-10-01'),(10,2,45000.00,4000.00,1500.00,47500.00,'2026-10-01'),(11,3,40000.00,3000.00,1000.00,42000.00,'2026-10-01'),(12,4,35000.00,2500.00,1000.00,36500.00,'2026-10-01'),(13,5,60000.00,6000.00,2500.00,63500.00,'2026-10-01'),(14,6,55000.00,5000.00,2000.00,58000.00,'2026-10-01'),(15,7,45000.00,3500.00,1500.00,47000.00,'2026-10-01'),(16,8,40000.00,3000.00,1000.00,42000.00,'2026-10-01'),(17,1,55000.00,6000.00,2000.00,59000.00,'2026-10-01'),(18,2,50000.00,5000.00,2000.00,53000.00,'2026-10-01'),(19,1,60000.00,7000.00,2000.00,65000.00,'2026-10-05'),(20,1,60000.00,7000.00,2000.00,65000.00,'2026-10-05'),(21,1,60000.00,7000.00,2000.00,65000.00,'2026-10-05'),(22,1,60000.00,7000.00,2000.00,65000.00,'2026-10-05'),(23,1,60000.00,7000.00,2000.00,65000.00,'2026-10-05'),(24,1,60000.00,7000.00,2000.00,65000.00,'2026-10-05'),(25,1,60000.00,7000.00,2000.00,65000.00,'2026-10-05');
/*!40000 ALTER TABLE `salary_records` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `calculate_payroll` BEFORE INSERT ON `salary_records` FOR EACH ROW SET NEW.net_salary =
    NEW.basic_salary
    + NEW.allowance_amount
    - NEW.deduction */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'employee_payroll'
--

--
-- Dumping routines for database 'employee_payroll'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_net_salary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_net_salary`(
    p_basic_salary DECIMAL(10,2),
    p_allowance DECIMAL(10,2),
    p_deduction DECIMAL(10,2)
) RETURNS decimal(10,2)
    DETERMINISTIC
RETURN p_basic_salary + p_allowance - p_deduction ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_salary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_salary`(
    IN p_employee_id INT,
    IN p_basic_salary DECIMAL(10,2),
    IN p_allowance DECIMAL(10,2),
    IN p_deduction DECIMAL(10,2)
)
BEGIN
    DECLARE v_net_salary DECIMAL(10,2);

    SET v_net_salary = p_basic_salary + p_allowance - p_deduction;

    INSERT INTO salary_records
    (
        employee_id,
        basic_salary,
        allowance_amount,
        deduction,
        net_salary,
        salary_date
    )
    VALUES
    (
        p_employee_id,
        p_basic_salary,
        p_allowance,
        p_deduction,
        v_net_salary,
        CURDATE()
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-08  7:59:08
