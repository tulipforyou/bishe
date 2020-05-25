-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: bishe
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `choose`
--

DROP TABLE IF EXISTS `choose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='选课表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choose`
--

LOCK TABLES `choose` WRITE;
/*!40000 ALTER TABLE `choose` DISABLE KEYS */;
INSERT INTO `choose` VALUES (1,2,3,0);
/*!40000 ALTER TABLE `choose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `cno` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) DEFAULT '在线学习系统',
  `uno` int(11) NOT NULL,
  PRIMARY KEY (`cno`),
  KEY `course_user_uno_fk` (`uno`),
  CONSTRAINT `course_user_uno_fk` FOREIGN KEY (`uno`) REFERENCES `user` (`uno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'在线学习系统',1),(2,'在线学习系统',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `img` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `src` varchar(200) NOT NULL,
  `picture` varchar(200) NOT NULL,
  `descript` varchar(400) NOT NULL,
  `uptime` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='媒体文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'springboot教程－01','sch','28dbb072-f86f-4f64-909e-5665a65fa707-SpringBoot_入门简介.mp4','10a866c6-70bc-40d4-aa58-cefd137c3466-dm1.jpg','springboot入门案例','2020-05-20'),(2,'springboot进阶教程－01','sch','a11f8571-8bf6-488c-823a-c76fe5d34965-HelloWorld细节-自动配置.mp4','f568dca3-a32d-47ca-9739-e861f1dfc384-dm2.jpg','springboot自动配置详细说明','2020-05-20'),(3,'springboot高级案例－01','sch','e61cbcbb-3b90-4eee-ac92-d8fa4d8c1113-场景启动器.mp4','9ccfbb21-1017-4223-a9b3-ad184c213748-dm3.jpeg','springboot场景启动器讲解及使用','2020-05-20');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newst`
--

DROP TABLE IF EXISTS `newst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head` varchar(100) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `body` longtext NOT NULL,
  `date` date DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newst`
--

LOCK TABLES `newst` WRITE;
/*!40000 ALTER TABLE `newst` DISABLE KEYS */;
INSERT INTO `newst` VALUES (1,'英语课程','如何学好英语？','Why do you want to learn English?\r\nBefore you begin, or go back to, studying English, ask youself one question. Why do I want to study English? Is it because you want to, or because someone else wants you to? Like every decision in life, studying English must be something you want to do.','2020-05-19','7e02bcde-24e7-45ee-8e9c-6eb0697d10bc英语.jpg','课程介绍'),(2,'古诗理解-语文','对古诗词的理解','茅屋为秋风所破歌\r\n[ 唐 ] 杜甫\r\n八月秋高风怒号，卷我屋上三重茅。茅飞渡江洒江郊，高者挂罥长林梢，下者飘转沉塘坳。\r\n南村群童欺我老无力，忍能对面为盗贼。公然抱茅入竹去，唇焦口燥呼不得，归来倚杖自叹息。\r\n俄顷风定云墨色，秋天漠漠向昏黑。布衾多年冷似铁，娇儿恶卧踏里裂。床头屋漏无干处，雨脚如麻未断绝。自经丧乱少睡眠，长夜沾湿何由彻！\r\n安得广厦千万间，大庇天下寒士俱欢颜！风雨不动安如山。呜呼！何时眼前突兀见此屋，吾庐独破受冻死亦足！\r\n译文：\r\n八月里秋深，狂风怒号，狂风卷走了我屋顶上好几层茅草。茅草乱飞，渡过浣花溪，散落在对岸江边。飞得高的茅草缠绕在高高的树梢上，飞得低的飘飘洒洒沉落到池塘和洼地里。\r\n南村的一群儿童欺负我年老没e5a48de588b6e799bee5baa6e997aee7ad9431333365666331力气，竟忍心这样当面做“贼”抢东西，毫无顾忌地抱着茅草跑进竹林去了。我嘴唇干燥也喝止不住，回来后拄着拐杖，独自叹息。\r\n一会儿风停了，天空中乌云像墨一样黑，深秋天空阴沉迷蒙渐渐黑下来了。布被盖了多年，又冷又硬，像铁板似的。孩子睡觉姿势不好，把被子蹬破了。一下雨屋顶漏水，屋内没有一点儿干燥的地方，房顶的雨水像麻线一样不停地往下漏。自从安史之乱之后，我睡眠的时间很少，长夜漫漫，屋漏床湿，怎能挨到天亮。\r\n如何能得到千万间宽敞高大的房子，普遍地庇覆天下间贫寒的读书人，让他们开颜欢笑，房子在风雨中也不为所动，安稳得像是山一样？唉！什么时候眼前出现这样高耸的房屋，到那时即使我的茅屋被秋风所吹破，我自己受冻而死也心甘情愿！      ','2020-05-19','b29c7cac-f10a-401b-89a4-520cd2d5688b语文.jpeg','课程内容'),(3,'物理课程实践','物理实验','用适当的绳子  挂上一个重物   再把绳子挂在门上的栏杆（差来不多的地方也行）\r\n然后源确保 重物挂好后 拉直能 刚好 轻轻碰到你的鼻子  \r\n像这样     然后再放手  人不用动  等绳百子再次荡回来时 不会碰到你的鼻子（而刚开始时碰着你的鼻子放开的）    可验证能量守恒度  空气会产生阻力\r\n实验材料 简单    过程安全。','2020-05-19','66d98d2f-047e-4080-8e0c-18e5ea2f37be物理.png','课程实践'),(4,'孙朝辉','合肥工业大学本科毕业生','合工大物联网工程专业本科毕业生,现从事java web开发.','2020-05-19','0027075d-6970-4ff9-908e-c084134dcdeasss','教学团队');
/*!40000 ALTER TABLE `newst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadexercise`
--

DROP TABLE IF EXISTS `uploadexercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadexercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(20) NOT NULL,
  `exerciseType` varchar(20) NOT NULL,
  `knowledgePoints` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `answer1` varchar(100) NOT NULL,
  `answer2` varchar(100) NOT NULL,
  `answer3` varchar(100) NOT NULL,
  `answer4` varchar(100) NOT NULL,
  `correctAnswer` varchar(100) NOT NULL,
  `uptime` varchar(20) NOT NULL,
  `studentAnswerCheck` varchar(20) DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL,
  `studentAnswer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadexercise`
--

LOCK TABLES `uploadexercise` WRITE;
/*!40000 ALTER TABLE `uploadexercise` DISABLE KEYS */;
INSERT INTO `uploadexercise` VALUES (1,'英语','翻译','句子翻译和练习','I like three thing in the  world,the sun,the moon,and you,sun for morning,moon for night,and you for all!','我不会','我还是不会','我依然不会啊','浮世万千,吾爱有三,日,月与卿,日为朝,月为暮,卿为朝朝暮暮!','浮世万千,吾爱有三,日,月与卿,日为朝,月为暮,卿为朝朝暮暮!','2020-05-20',NULL,NULL,NULL),(2,'数学','小数计算','小数加减乘除计算','0.2 X 0.3 =?','0.15','0.25','0.05','0.06','0.06','2020-05-20',NULL,NULL,NULL),(3,'语文','古诗理解','古诗的背诵及内容的理解练习','忽如一夜春风来,千树万树梨花开中梨花指的是什么?','梨树的话','雪花','菊花','牵牛花','雪花','2020-05-20',NULL,NULL,NULL);
/*!40000 ALTER TABLE `uploadexercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `shool` varchar(20) DEFAULT NULL,
  `no` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `flag` char(2) NOT NULL,
  PRIMARY KEY (`uno`),
  UNIQUE KEY `user_no_uindex` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'001','合肥工业大学','003','1','2524356811@qq.com','1'),(3,'sch','合肥工业大学','002','1','18856362003@163.com','2'),(4,'sch','合肥工业大学','001','1','2524356811@qq.com','1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `date` varchar(40) NOT NULL,
  `content` varchar(400) NOT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `words_media_id_fk` (`media_id`),
  CONSTRAINT `words_media_id_fk` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='综合描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-25 11:08:13
