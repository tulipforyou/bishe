-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bishe
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `choose`
--

DROP TABLE IF EXISTS `choose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choose` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `cno` int(11) NOT NULL,
  `uno` int(11) NOT NULL,
  `grade` int(11) DEFAULT '0',
  PRIMARY KEY (`no`),
  KEY `choose_course_cno_fk` (`cno`),
  KEY `choose_user_uno_fk` (`uno`),
  CONSTRAINT `choose_course_cno_fk` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`),
  CONSTRAINT `choose_user_uno_fk` FOREIGN KEY (`uno`) REFERENCES `user` (`uno`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='选课表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `cno` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) DEFAULT '在线学习系统',
  `uno` int(11) NOT NULL,
  PRIMARY KEY (`cno`),
  KEY `course_user_uno_fk` (`uno`),
  CONSTRAINT `course_user_uno_fk` FOREIGN KEY (`uno`) REFERENCES `user` (`uno`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `img` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `src` varchar(200) NOT NULL,
  `picture` varchar(200) NOT NULL,
  `descript` varchar(400) NOT NULL,
  `uptime` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='媒体文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newst`
--

DROP TABLE IF EXISTS `newst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head` varchar(100) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `body` longtext NOT NULL,
  `time` date DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `date` varchar(40) NOT NULL,
  `content` varchar(400) NOT NULL,
  `words_id` int(11) DEFAULT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reply_media_id_fk` (`media_id`),
  KEY `reply_words_id_fk` (`words_id`),
  CONSTRAINT `reply_media_id_fk` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `reply_words_id_fk` FOREIGN KEY (`words_id`) REFERENCES `words` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `shool` varchar(20) DEFAULT NULL,
  `no` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `flag` char(2) NOT NULL,
  PRIMARY KEY (`uno`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `date` varchar(40) NOT NULL,
  `content` varchar(400) NOT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `words_media_id_fk` (`media_id`),
  CONSTRAINT `words_media_id_fk` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='综合描述';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-05 22:07:46
