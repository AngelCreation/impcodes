CREATE DATABASE  IF NOT EXISTS `wishlist` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `wishlist`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 10.100.112.1    Database: wishlist
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

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
-- Table structure for table `attendees`
--

DROP TABLE IF EXISTS `attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendees` (
  `EventID` int(10) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `Approved` int(1) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  KEY `EventID_attendees_event_idx` (`EventID`),
  KEY `UserID_attendees_user_idx` (`UserID`),
  CONSTRAINT `EventID_attendees_event` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserID_attendees_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `EventID` int(10) NOT NULL AUTO_INCREMENT,
  `EventCode` varchar(45) DEFAULT NULL,
  `EventName` varchar(45) DEFAULT NULL,
  `EventType` int(1) DEFAULT NULL,
  `EventCategoryID` int(10) DEFAULT NULL,
  `EventDescription` varchar(255) DEFAULT NULL,
  `EventVenue` varchar(255) DEFAULT NULL,
  `EventDate` date DEFAULT NULL,
  `EventTime` time DEFAULT NULL,
  `EventPoster` varchar(255) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `UserID_event_user_idx` (`UserID`),
  KEY `EventCategoryID_event_eventcategory_idx` (`EventCategoryID`),
  CONSTRAINT `EventCategoryID_event_eventcategory` FOREIGN KEY (`EventCategoryID`) REFERENCES `eventcategory` (`EventCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserID_event_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventcategory`
--

DROP TABLE IF EXISTS `eventcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventcategory` (
  `EventCategoryID` int(10) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(45) DEFAULT NULL,
  `CategoryDescription` varchar(255) DEFAULT NULL,
  `CategoryPoster` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EventCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `PhotoID` int(10) NOT NULL AUTO_INCREMENT,
  `EventID` int(10) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`PhotoID`),
  KEY `EventID_photos_event_idx` (`EventID`),
  KEY `UserID_photos_user_idx` (`UserID`),
  CONSTRAINT `EventID_photos_event` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserID_photos_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportabuse`
--

DROP TABLE IF EXISTS `reportabuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportabuse` (
  `ReportID` int(10) NOT NULL AUTO_INCREMENT,
  `EventID` int(10) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `ReportDescription` varchar(255) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `EventID_reportabuse_event_idx` (`EventID`),
  KEY `UserID_reportabuse_user_idx` (`UserID`),
  CONSTRAINT `EventID_reportabuse_event` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserID_reportabuse_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Password` varchar(15) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `MobileNo` varchar(15) DEFAULT NULL,
  `UserPhoto` varchar(255) DEFAULT NULL,
  `UserTypeID` int(10) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `UserTypeID_user_usertype_idx` (`UserTypeID`),
  CONSTRAINT `UserTypeID_user_usertype` FOREIGN KEY (`UserTypeID`) REFERENCES `usertype` (`UserTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `UserTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `UserType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `WishID` int(10) NOT NULL AUTO_INCREMENT,
  `EventID` int(10) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `WishName` varchar(45) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`WishID`),
  KEY `EventID_wishlist_event_idx` (`EventID`),
  CONSTRAINT `EventID_wishlist_event` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'wishlist'
--

--
-- Dumping routines for database 'wishlist'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-25 10:55:29
