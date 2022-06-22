-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.5-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for project2
CREATE DATABASE IF NOT EXISTS `project2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `project2`;

-- Dumping structure for table project2.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `CId` int(11) NOT NULL,
  `CName` char(50) DEFAULT NULL,
  PRIMARY KEY (`CId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table project2.customer: ~6 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`CId`, `CName`) VALUES
	(1, 'Jeffery'),
	(2, 'Alec'),
	(3, 'Gomey'),
	(4, 'Tom'),
	(5, 'Whiskey'),
	(6, 'Henesy');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table project2.ingredients
CREATE TABLE IF NOT EXISTS `ingredients` (
  `IngredId` int(11) NOT NULL,
  `name` char(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ingreProdId` int(11) NOT NULL,
  PRIMARY KEY (`IngredId`),
  KEY `ingreProdId` (`ingreProdId`),
  CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`ingreProdId`) REFERENCES `product` (`prodId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table project2.ingredients: ~4 rows (approximately)
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` (`IngredId`, `name`, `description`, `ingreProdId`) VALUES
	(1, 'Salt', 'Salts used for food. Make it more flavorful', 2),
	(2, 'Sugar', 'Sweet and delicious', 3),
	(3, 'Dairy', 'For Cake ', 1),
	(4, 'Flour', 'For making breads and Donuts', 4),
	(5, 'Vegetable', 'Used for making foods and cooking', 3);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;

-- Dumping structure for table project2.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `itemNo` int(11) NOT NULL,
  `orderMenuNo` int(11) NOT NULL,
  `productMenuId` int(11) NOT NULL,
  PRIMARY KEY (`itemNo`),
  KEY `orderMenuNo` (`orderMenuNo`),
  KEY `productMenuId` (`productMenuId`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`orderMenuNo`) REFERENCES `orders` (`orderNo`),
  CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`productMenuId`) REFERENCES `product` (`prodId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table project2.menu: ~7 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`itemNo`, `orderMenuNo`, `productMenuId`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 1, 4),
	(5, 4, 3),
	(6, 4, 2),
	(7, 6, 3),
	(8, 2, 2);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table project2.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orderNo` int(11) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `waiterID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`orderNo`),
  KEY `waiterID` (`waiterID`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`waiterID`) REFERENCES `waiter` (`WaiterID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`CId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table project2.orders: ~6 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderNo`, `orderDate`, `waiterID`, `customerID`) VALUES
	(1, '2021-12-05', 1, 1),
	(2, '2021-10-05', 2, 2),
	(3, '2022-01-05', 3, 3),
	(4, '2022-01-05', 4, 4),
	(5, '2022-01-05', 1, 5),
	(6, '2021-11-05', 2, 6);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table project2.product
CREATE TABLE IF NOT EXISTS `product` (
  `prodId` int(11) NOT NULL,
  `desc` varchar(255) NOT NULL DEFAULT '',
  `price` float DEFAULT NULL,
  `prodName` char(50) DEFAULT NULL,
  PRIMARY KEY (`prodId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table project2.product: ~4 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`prodId`, `desc`, `price`, `prodName`) VALUES
	(1, 'Pasta make it with flours and sugar', 18, 'Pasta Gordon'),
	(2, 'Meat with vegatbale oil with salt', 20.99, 'Meat Gordon'),
	(3, 'Veggie oil with salt and dairy', 40.99, 'Veggie Gordon'),
	(4, 'Great cheese cake with dairy', 10.99, 'Cake Gordon');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table project2.waiter
CREATE TABLE IF NOT EXISTS `waiter` (
  `WaiterID` int(11) NOT NULL,
  `WaiterName` char(50) DEFAULT NULL,
  PRIMARY KEY (`WaiterID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table project2.waiter: ~5 rows (approximately)
/*!40000 ALTER TABLE `waiter` DISABLE KEYS */;
INSERT INTO `waiter` (`WaiterID`, `WaiterName`) VALUES
	(1, 'Tan'),
	(2, 'Suzin'),
	(3, 'Sriram'),
	(4, 'Karishma'),
	(5, 'The Rock');
/*!40000 ALTER TABLE `waiter` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
