-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: newtgdd
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Hà Nội','Cầu Giấy','09999999'),(2,'Hà Nội','Triệu Việt Vương','08888888'),(3,'TP.HCM','Quận 3','0123456789');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`brand_id`),
  KEY `FK_4b5f29a73f7b34a6e7566133393` (`category_id`),
  CONSTRAINT `FK_4b5f29a73f7b34a6e7566133393` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'SamSung',1),(2,'Apple',1),(3,'MSI',2),(4,'Razer',2),(5,'DELL',2),(6,'Macbook',2),(7,'Apple',4),(8,'SamSung',4),(9,'HyperX',5),(10,'Logitech',5),(11,'JBL',5),(12,'Apple',5),(13,'Apple',3);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `productId` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK_371eb56ecc4104c2644711fa85f` (`productId`),
  CONSTRAINT `FK_371eb56ecc4104c2644711fa85f` FOREIGN KEY (`productId`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (103,'15c16d7d-93bb-4149-b596-fc3a68236948',55,1),(104,'15c16d7d-93bb-4149-b596-fc3a68236948',54,1),(106,'8361a94a-b416-441e-abdc-0d0b625e8d47',56,1),(107,'8361a94a-b416-441e-abdc-0d0b625e8d47',58,1),(108,'8361a94a-b416-441e-abdc-0d0b625e8d47',57,9);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Smart Phone'),(2,'Laptop'),(3,'Smart Watch'),(4,'Tablet'),(5,'Acessory');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `high_price`
--

DROP TABLE IF EXISTS `high_price`;
/*!50001 DROP VIEW IF EXISTS `high_price`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `high_price` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `product_stocks`,
 1 AS `price`,
 1 AS `product_image`,
 1 AS `brandId`,
 1 AS `sold`,
 1 AS `categoryId`,
 1 AS `status`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customerId` varchar(255) NOT NULL,
  `total` int NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `FK_124456e637cca7a415897dce659` (`customerId`),
  CONSTRAINT `FK_124456e637cca7a415897dce659` FOREIGN KEY (`customerId`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (27,'15c16d7d-93bb-4149-b596-fc3a68236948',95400000,'hehehe','Hoàn thành','home_delivery','2023-08-02 02:40:55'),(28,'d6e1b26c-e6df-45b7-a198-70e8763b0dc3',34460000,NULL,'Đã hủy','home_delivery','2023-08-09 08:38:18'),(29,'d6e1b26c-e6df-45b7-a198-70e8763b0dc3',13380000,NULL,'Hoàn thành','home_delivery','2023-08-10 02:26:42'),(30,'15c16d7d-93bb-4149-b596-fc3a68236948',325000000,NULL,'Hoàn thành','home_delivery','2023-08-15 01:06:25'),(32,'15c16d7d-93bb-4149-b596-fc3a68236948',33320000,NULL,'Chờ xác nhận','home_delivery','2023-10-07 17:33:50');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_details_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `idProduct` int NOT NULL,
  `quantity` int NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`order_details_id`),
  KEY `FK_3ff3367344edec5de2355a562ee` (`order_id`),
  KEY `FK_3f45e5f0c6b43aec31bf69bbe92` (`idProduct`),
  CONSTRAINT `FK_3f45e5f0c6b43aec31bf69bbe92` FOREIGN KEY (`idProduct`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_3ff3367344edec5de2355a562ee` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (29,27,5,1,'Yên Hòa, Cầu Giấy'),(30,27,3,1,'Yên Hòa, Cầu Giấy'),(31,27,4,1,'Yên Hòa, Cầu Giấy'),(32,27,60,1,'Yên Hòa, Cầu Giấy'),(33,27,1,1,'Yên Hòa, Cầu Giấy'),(34,28,60,1,'265 Yen Hoa, Cau Giay'),(35,28,58,1,'265 Yen Hoa, Cau Giay'),(36,28,57,1,'265 Yen Hoa, Cau Giay'),(37,28,56,1,'265 Yen Hoa, Cau Giay'),(38,29,56,1,'Nguyễn Thị Thập'),(39,29,55,1,'Nguyễn Thị Thập'),(40,30,60,13,'Mua hết'),(46,32,57,1,'265 Yên Hòa, Cầu Giấy'),(47,32,56,1,'265 Yên Hòa, Cầu Giấy'),(48,32,55,1,'265 Yên Hòa, Cầu Giấy');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_stocks` int NOT NULL,
  `price` int NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `brandId` int NOT NULL,
  `sold` int DEFAULT NULL,
  `categoryId` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`product_id`),
  KEY `FK_bb7d3d9dc1fae40293795ae39d6` (`brandId`),
  KEY `FK_ff0c0301a95e517153df97f6812` (`categoryId`),
  CONSTRAINT `FK_bb7d3d9dc1fae40293795ae39d6` FOREIGN KEY (`brandId`) REFERENCES `brand` (`brand_id`),
  CONSTRAINT `FK_ff0c0301a95e517153df97f6812` FOREIGN KEY (`categoryId`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Điện thoại Samsung Galaxy A14 6GB',54,5000000,'https://firebasestorage.googleapis.com/v0/b/netflixsource-75bc5.appspot.com/o/images%2F216925679_3070105829875470_3380111040008293903_n.jpg?alt=media&token=2f6a917b-2e06-495f-a01f-b8c61e1289fd',1,1,1,'Available','Samsung tiếp tục chứng tỏ sự nỗ lực của mình trong việc cải thiện dòng sản phẩm phân khúc cấp thấp trong năm 2023 bằng việc ra mắt mẫu smartphone Samsung Galaxy A14 4G. Với thiết kế độc đáo và hiện đại, sản phẩm này đáp ứng đầy đủ tiêu chí \"ngon - bổ - rẻ\" với cấu hình ổn định và giá cả cực kỳ hợp lý.'),(2,'Điện thoại Samsung Galaxy A34 5G 128GB',88,6000000,'https://cdn.tgdd.vn/Products/Images/42/303583/samsung-galaxy-a34-thumb-den-600x600.jpg',1,0,1,'Available','Điện thoại Samsung Galaxy A34 5G 128GBĐiện thoại Samsung Galaxy A34 5G 128GBĐiện thoại Samsung Galaxy A34 5G 128GB'),(3,'Điện thoại iPhone 14 Pro 128GB',70,21000000,'https://cdn.tgdd.vn/Products/Images/42/247508/iphone-14-pro-vang-thumb-600x600.jpg',2,1,1,'Available','Điện thoại iPhone 14 Pro 128GBĐiện thoại iPhone 14 Pro 128GBĐiện thoại iPhone 14 Pro 128GBĐiện thoại iPhone 14 Pro 128GBĐiện thoại iPhone 14 Pro 128GB'),(4,'Điện thoại iPhone 14 Pro MAX 256GB',85,35000000,'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-den-thumb-600x600.jpg',2,1,1,'Available','Điện thoại iPhone 14 Pro MAX 256GBĐiện thoại iPhone 14 Pro MAX 256GBĐiện thoại iPhone 14 Pro MAX 256GBĐiện thoại iPhone 14 Pro MAX 256GBĐiện thoại iPhone 14 Pro MAX 256GBĐiện thoại iPhone 14 Pro MAX 256GBĐiện thoại iPhone 14 Pro MAX 256GB'),(5,'Điện thoại iPhone 14',98,20000000,'https://cdn.tgdd.vn/Products/Images/42/240259/iPhone-14-thumb-do-600x600.jpg',2,1,1,'Available','Điện thoại iPhone 14Điện thoại iPhone 14Điện thoại iPhone 14Điện thoại iPhone 14Điện thoại iPhone 14Điện thoại iPhone 14Điện thoại iPhone 14'),(6,'Điện thoại iPhone 13',98,17000000,'https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-blue-1-600x600.jpg',2,1,1,'Available','Điện thoại iPhone 13Điện thoại iPhone 13Điện thoại iPhone 13Điện thoại iPhone 13Điện thoại iPhone 13Điện thoại iPhone 13Điện thoại iPhone 13Điện thoại iPhone 13Điện thoại iPhone 13Điện thoại iPhone 13Điện thoại iPhone 13Điện thoại iPhone 13'),(7,'Samsung Galaxy S23 Ultra 5G',84,26960000,'https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-thumb-xanh-600x600.jpg',1,0,1,'Available','Samsung Galaxy S23 Ultra 5GSamsung Galaxy S23 Ultra 5GSamsung Galaxy S23 Ultra 5GSamsung Galaxy S23 Ultra 5GSamsung Galaxy S23 Ultra 5GSamsung Galaxy S23 Ultra 5GSamsung Galaxy S23 Ultra 5GSamsung Galaxy S23 Ultra 5G'),(8,'Samsung Galaxy S22 Ultra 5G 128 GB',84,23600000,'https://cdn.tgdd.vn/Products/Images/42/235838/Galaxy-S22-Ultra-Burgundy-600x600.jpg',1,0,1,'Available','Samsung Galaxy S22 Ultra 5G 128 GBSamsung Galaxy S22 Ultra 5G 128 GBSamsung Galaxy S22 Ultra 5G 128 GBSamsung Galaxy S22 Ultra 5G 128 GBSamsung Galaxy S22 Ultra 5G 128 GBSamsung Galaxy S22 Ultra 5G 128 GBSamsung Galaxy S22 Ultra 5G 128 GB'),(9,'MacBook Pro 16 inch M1 Pro 2021 16 core-GPU',99,39900000,'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-10-core-cpu-600x600.jpg',6,0,2,'Available','MacBook Pro 16 M1 Pro 2021 không chỉ sở hữu thiết kế mới trông vuông vức hơn mà còn mang trong mình sức mạnh hiệu năng vượt trội đến từ bộ vi xử lý M1 Pro, cho mình trải nghiệm sử dụng mượt mà và ấn tượng như một dân chuyên đúng nghĩa.'),(10,'MacBook Pro 13 inch M1 2020 8-core GPU',99,42000000,'https://cdn.tgdd.vn/Products/Images/44/231255/macbook-pro-m1-2020-gray-600x600.jpg',6,0,2,'Available','Macbook Pro M1 2020 được nâng cấp với bộ vi xử lý mới cực kỳ mạnh mẽ, chiếc laptop này sẽ phục vụ tốt cho công việc của bạn, đặc biệt cho lĩnh vực đồ họa, kỹ thuật.'),(24,'Samsung Galaxy S23+ 5G',100,19990000,'https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-600x600.jpg',1,0,1,'Available','Samsung Galaxy S23+ 5G 256GB là chiếc điện thoại thuộc dòng cao cấp nhất của Samsung được giới thiệu vào tháng 02/2023. Máy sở hữu một vài điểm ấn tượng như camera có khả năng quay video 8K, cùng với đó là con chip Snapdragon 8 Gen 2 mạnh mẽ hàng đầu giới điện thoại Android.'),(25,'Samsung Galaxy Z Fold4 5G',100,29990000,'https://cdn.tgdd.vn/Products/Images/42/250625/samsung-galaxy-z-fold4-kem-256gb-600x600.jpg',1,0,1,'Available','Tại sự kiện Samsung Unpacked thường niên, Samsung Galaxy Z Fold4 256GB chính thức được trình làng thị trường công nghệ, mang trên mình nhiều cải tiến đáng giá giúp Galaxy Z Fold trở thành dòng điện thoại gập đã tốt nay càng tốt hơn.'),(26,'MacBook Air 13 inch M2 2022 10-core GPU',99,37990000,'https://cdn.tgdd.vn/Products/Images/44/289441/apple-macbook-air-m2-2022-16gb-600x600.jpg',6,0,2,'Available','MacBook Air M2 2022 một lần nữa đã khẳng định vị thế hàng đầu của Apple trong phân khúc laptop cao cấp - sang trọng vào giữa năm 2022 khi sở hữu phong cách thiết kế thời thượng, đẳng cấp cùng sức mạnh bộc phá đến từ bộ vi xử lý Apple M2 mạnh mẽ.'),(27,'MSI Gaming GF63 Thin 11UC i7 11800H (1228VN)',99,19490000,'https://cdn.tgdd.vn/Products/Images/44/306133/msi-gaming-gf63-thin-11uc-i7-1228vn-thumb-600x600.jpg',3,0,2,'Available','Laptop MSI Gaming GF63 Thin 11UC i7 11800H (1228VN) được trang bị bộ vi xử lý Intel Core i7 dòng H hiệu năng cao và card đồ họa NVIDIA mạnh mẽ, đáp ứng mọi nhu cầu của game thủ và người dùng làm trong ngành sáng tạo nội dung.'),(28,'Laptop MSI Gaming GS66 Stealth 11UG i7 11800H',100,50490000,'https://cdn.tgdd.vn/Products/Images/44/249147/msi-gaming-gs66-stealth-11ug-i7-219vn-600x600.jpg',3,0,2,'Available','Xứng danh tay chơi cự phách nơi đô thị sầm uất, laptop MSI Gaming GS66 Stealth 11UG i7 11800H (219VN) với vẻ ngoài đầy mạnh mẽ cùng sức mạnh tuyệt hảo, phát huy hiệu suất tối ưu và khả năng chiến game cực đã cùng đồng đội.'),(29,'MSI Gaming Cyborg 15 A12VE i7 12650H (240VN)',60,27600000,'https://cdn.tgdd.vn/Products/Images/44/304843/msi-cyborg-15-a12ve-i7-240vn-thumb-600x600.jpg',3,0,2,'Available','Laptop MSI Cyborg 15 A12VE i7 (240VN) hướng tới đối tượng người dùng là các game thủ và những người đam mê công nghệ khi được trang bị đầy đủ tính năng tiên tiến nhất để mang lại trải nghiệm tuyệt vời cho người dùng.'),(30,'Dell Inspiron 16 5620 i7 1255U (N6I7110W1)',27,23490000,'https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-thumb-600x600.jpg',5,3,2,'Available','Khi nhắc đến dòng laptop học tập - văn phòng thì bạn không thể nào bỏ qua laptop Dell Inspiron 16 5620 i7 (N6I7110W1) với hiệu năng vượt trội, thiết kế hiện đại và gọn nhẹ phù hợp với nhu cầu sử dụng của sinh viên và nhân viên văn phòng cần phải di chuyển thường xuyên.'),(31,'Razer Blade 15 Core i7 8750H',30,47500000,'https://bizweb.dktcdn.net/thumb/grande/100/305/872/products/razer-blade-15-2.jpg?v=1558671347383',4,0,2,'Available','Razer từ trước đến nay vốn được coi là cao cấp bậc nhất trong dòng Gaming Laptop cao cấp với thân hình quyến rũ cùng cấu hình mạnh mẽ, nối tiếng nhất chính là dòng Blade Pro. Tiếp nối những thành công trong năm 2017, Razer tiếp tục “tút lại nhan sắc” cũng như nâng cấp cấu hình cho dòng sản phẩm của mình trong năm 2018 với Razer Blade 15 - phiên bản được rất nhiều người mong đợi. '),(32,'Laptop Razer Blade 15',10,103000000,'https://product.hstatic.net/1000374492/product/6-500x500_021a25dc5f904ac890ea6ef1781316d0_master.jpg',4,0,2,'Available','Laptop Razer Blade 15 (i9-12900H | 32GB | 1TB | GeForce® RTX 3080Ti 16GB'),(33,'Dell XPS 9510 15 inch',9,75000000,'https://macstores.vn/wp-content/uploads/2021/08/dell-xps-15-9510-4.jpg',5,1,2,'Available','Vẫn làm bằng chất liệu nhôm nguyên khối cùng những đường cắt Diamond tinh xảo đem lại sự chắc chắn và sang trọng. Khung máy được gia cố bằng hợp kim magnesium chắc chắn, với mặt trên được phủ một lớp carbon fiber đã quá quen thuộc với các dòng XPS trước đây.\n'),(34,'iPad 9 WiFi 64GB',20,9400000,'https://cdn.tgdd.vn/Products/Images/522/247517/iPad-9-wifi-trang-600x600.jpg',7,0,4,'Available','iPad 9 WiFi 64GBiPad 9 WiFi 64GBiPad 9 WiFi 64GBiPad 9 WiFi 64GBiPad 9 WiFi 64GBiPad 9 WiFi 64GBiPad 9 WiFi 64GBiPad 9 WiFi 64GBiPad 9 WiFi 64GB'),(35,'iPad Air 5 M1 Wifi 64GB',15,14940000,'https://cdn.tgdd.vn/Products/Images/522/248096/ipad-air-5-wifi-blue-thumb-600x600.jpg',7,0,4,'Available','iPad Air 5 M1 Wifi 64GBiPad Air 5 M1 Wifi 64GBiPad Air 5 M1 Wifi 64GBiPad Air 5 M1 Wifi 64GBiPad Air 5 M1 Wifi 64GBiPad Air 5 M1 Wifi 64GBiPad Air 5 M1 Wifi 64GB'),(36,'Samsung Galaxy Tab S8 Ultra 5G',19,25990000,'https://cdn.tgdd.vn/Products/Images/522/247513/samsung-tab-s8-ultra-thumb-600x600.jpg',8,0,4,'Available','Samsung Galaxy Tab S8 Ultra 5GSamsung Galaxy Tab S8 Ultra 5GSamsung Galaxy Tab S8 Ultra 5GSamsung Galaxy Tab S8 Ultra 5GSamsung Galaxy Tab S8 Ultra 5G'),(37,'iPad Pro M1 12.9 inch 5G',14,29740000,'https://cdn.tgdd.vn/Products/Images/522/238649/ipad-pro-2021-129-inch-silver-600x600.jpg',7,0,4,'Available','iPad Pro M1 12.9 inch 5GiPad Pro M1 12.9 inch 5GiPad Pro M1 12.9 inch 5GiPad Pro M1 12.9 inch 5GiPad Pro M1 12.9 inch 5G'),(38,'iPad Pro M1 11 inch WiFi 2TB (2021)',5,44990000,'https://cdn.tgdd.vn/Products/Images/522/269328/ipad-pro-m1-11-inch-wifi-2tb-2021-bac-thumb-600x600.jpeg',7,0,4,'Available','iPad Pro M1 11 inch WiFi 2TB (2021)iPad Pro M1 11 inch WiFi 2TB (2021)iPad Pro M1 11 inch WiFi 2TB (2021)iPad Pro M1 11 inch WiFi 2TB (2021)'),(39,'iPad 10 WiFi + Cellular 64GB',10,14390000,'https://cdn.tgdd.vn/Products/Images/522/295453/ipad-10-wifi-cellular-sliver-thumb-600x600.jpeg',7,0,4,'Available','iPad 10 WiFi + Cellular 64GBiPad 10 WiFi + Cellular 64GBiPad 10 WiFi + Cellular 64GB'),(40,'Samsung Galaxy Tab A7 Lite',20,3970000,'https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-gray-600x600.jpg',8,0,4,'Available','Samsung Galaxy Tab A7 LiteSamsung Galaxy Tab A7 LiteSamsung Galaxy Tab A7 Lite'),(41,'Samsung Galaxy Tab S7 FE 4G',20,10390000,'https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fe-black-600x600.jpg',8,0,4,'Available','Samsung Galaxy Tab S7 FE 4GSamsung Galaxy Tab S7 FE 4GSamsung Galaxy Tab S7 FE 4GSamsung Galaxy Tab S7 FE 4GSamsung Galaxy Tab S7 FE 4G'),(42,'iPad Pro M1 12.9 inch WiFi',15,32690000,'https://cdn.tgdd.vn/Products/Images/522/259650/ipad-pro-m1-129-inch-wifi-sliver-thumb-600x600.jpg',7,0,4,'Available','iPad Pro M1 12.9 inch WiFiiPad Pro M1 12.9 inch WiFiiPad Pro M1 12.9 inch WiFiiPad Pro M1 12.9 inch WiFiiPad Pro M1 12.9 inch WiFi'),(43,'iPad Pro M2 11 inch WiFi',16,20690000,'https://cdn.tgdd.vn/Products/Images/522/294104/ipad-pro-m2-11-wifi-xam-thumb-600x600.jpg',7,0,4,'Available','iPad Pro M2 11 inch WiFiiPad Pro M2 11 inch WiFiiPad Pro M2 11 inch WiFiiPad Pro M2 11 inch WiFi'),(46,'Tai nghe Bluetooth Apple AirPods Pro 2022',20,5990000,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/r/group_111_5_.png',12,0,5,'Available','Tích hợp chip Apple H2 mang đến chất âm sống động cùng khả năng tái tạo âm thanh 3 chiều vượt trội\nCông nghệ Bluetooth 5.3 kết nối ổn định, mượt mà, tiêu thụ năng lượng thấp, giúp tiết kiệm pin đáng kể\nChống ồn chủ động loại bỏ tiếng ồn hiệu quả gấp đôi thế hệ trước, giúp nâng cao trải nghiệm nghe nhạc\nChống nước chuẩn IPX4 trên tai nghe và hộp sạc, giúp bạn thỏa sức tập luyện không cần lo thấm mồ hôi'),(50,'Tai nghe Bluetooth Apple AirPods Pro 2023',20,7990000,'https://cdn.tgdd.vn/Products/Images/42/303891/iphone-15-plus-128gb-xanh-thumb-600x600.jpg',12,0,5,'Available','Tai nghe Bluetooth Apple AirPods Pro 2022Tai nghe Bluetooth Apple AirPods Pro 2022Tai nghe Bluetooth Apple AirPods Pro 2022Tai nghe Bluetooth Apple AirPods Pro 2022Tai nghe Bluetooth Apple AirPods Pro 2022Tai nghe Bluetooth Apple AirPods Pro 2022'),(51,'Tai nghe  HyperX Cloud II - Pink',19,1000000,'https://cdn.tgdd.vn/Products/Images/42/317530/samsung-galaxy-a05s-sliver-thumb-600x600.jpeg',9,1,5,'Available','Tai nghe Over-ear là một trong những thiết bị ngoại vi quan trọng hỗ trợ game thủ leo rank. HyperX Cloud II Pink với phiên bản màu hồng thu hút người dùng trẻ nhất là các bạn nữ. Nếu bạn đang tìm kiếm một chiếc tai nghe máy tính dạng chụp tai có chất lượng âm thanh tốt thì sản phẩm nhà HyperX là lựa chọn không thể bỏ qua. '),(52,'Cáp chuyển đổi cổng Lightning sang 3,5mm',48,210000,'https://cdn.tgdd.vn/Products/Images/42/316771/xiaomi-redmi-13c-xanh-la-1-2-3-600x600.jpg',12,2,5,'Available','Cáp chuyển đổi cổng Lightning sang 3,5mmCáp chuyển đổi cổng Lightning sang 3,5mmCáp chuyển đổi cổng Lightning sang 3,5mmCáp chuyển đổi cổng Lightning sang 3,5mmCáp chuyển đổi cổng Lightning sang 3,5mm'),(53,'Apple Pencil (thế hệ thứ 1)',12,2560000,'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-xi-den-600x600.jpg',12,3,5,'Available','\nApple Pencil bổ sung sức mạnh cho iPad và mở ra những khả năng sáng tạo mới. Nhạy với lực ép và nghiêng để bạn có thể dễ dàng vẽ những nét với độ dày khác nhau, tạo bóng mờ tinh tế và nhiều hiệu ứng nghệ thuật, tương tự như bút chì thông thường, nhưng với độ chính xác hoàn hảo đến từng điểm ảnh.'),(54,'Đồng hồ thông minh Apple Watch S8 LTE 41mm',20,12290000,'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-xi-den-600x600.jpg',13,0,3,'Available','Đồng hồ thông minh Apple Watch S8 LTE 41mm viền nhôm là một trong những dòng sản phẩm cao cấp được Apple trình làng vào tháng 9/2022. Với thiết kế thời thượng đi cùng nhiều tiện ích cao cấp, đây hứa hẹn sẽ là siêu phẩm được rất nhiều người săn đón.'),(55,'Đồng hồ thông minh Apple Watch SE 2022',17,6390000,'https://cdn.tgdd.vn/Products/Images/42/309814/xiaomi-13-t-xanh-duong-thumb-thumb-600x600.jpg',13,3,3,'Available','Trong sự kiện Far Out 2022, nhà Táo Khuyết đã mang đến hàng loạt sản phẩm mới trong đó có đồng hồ thông minh Apple Watch SE 2022 GPS 40mm. Mẫu smartwatch giá rẻ mới nhất của Apple này hứa hẹn sẽ khiến cho các iFans đứng ngồi không yên khi sở hữu nhiều tính năng hấp dẫn.'),(56,'Đồng hồ thông minh Apple Watch SE 2022 GPS 44mm ',15,6990000,'https://cdn.tgdd.vn/Products/Images/42/313154/oppo-a38-gold-thumb-600x600.jpg',13,4,3,'Available','Trong sự kiện ra mắt sản phẩm mới vào tháng 9/2022, Apple đã trình làng thế hệ tiếp theo của dòng Apple Watch SE mang tên Apple Watch SE 2022, với mục tiêu đem những trải nghiệm công nghệ cao cấp đến gần hơn với nhiều đối tượng người dùng.'),(57,'Đồng hồ thông minh Apple Watch Ultra LTE 49mm dây Alpine size M',16,19940000,'https://cdn.tgdd.vn/Products/Images/42/285082/oppo-a57-xanh-thumb-1-600x600.jpeg',13,3,3,'Available','Trong sự kiện ra mắt sản phẩm mới vào tháng 9/2022, Apple đã trình làng thế hệ tiếp theo của dòng Apple Watch SE mang tên Apple Watch SE 2022, với mục tiêu đem những trải nghiệm công nghệ cao cấp đến gần hơn với nhiều đối tượng người dùng.'),(58,'Đồng hồ thông minh Apple Watch S8 LTE 41mm viền thép ',18,16990000,'https://cdn.tgdd.vn/Products/Images/42/311120/vivo-y36-xanh-thumbnew-600x600.jpg',13,2,3,'Available','Trong sự kiện ra mắt sản phẩm thường niên vào tháng 9/2022, bên cạnh các sản phẩm điện thoại luôn thu hút sự chú ý của giới công nghệ, Apple cũng trình làng các sản phẩm smartwatch kế nhiệm của dòng Apple Watch S7 mang tên đồng hồ thông minh Apple Watch Series 8.'),(60,'Điện thoại Samsung Galaxy A04 (4GB/64GB)',0,25000000,'https://cdn.tgdd.vn/Products/Images/42/309816/xiaomi-13t-pro-xanh-thumb-600x600.jpg',1,15,1,'Available','Samsung Galaxy A04 (4GB/64GB) sở hữu màn hình kích thước lớn, camera độ phân giải cao lên đến 50 MP và viên pin 5000 mAh, hứa hẹn sẽ trở thành đối thủ đáng gờm trong phân khúc điện thoại giá rẻ.');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `pro_id` int NOT NULL,
  `rate_points` int NOT NULL,
  `comment` longtext NOT NULL,
  `idUser` varchar(255) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rate_id`),
  KEY `FK_154de7ccf3ee26d2f030af1a8bb` (`idUser`),
  KEY `FK_1812a1c683377415e087e58635f` (`pro_id`),
  CONSTRAINT `FK_154de7ccf3ee26d2f030af1a8bb` FOREIGN KEY (`idUser`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_1812a1c683377415e087e58635f` FOREIGN KEY (`pro_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (6,3,5,'10 diem','15c16d7d-93bb-4149-b596-fc3a68236948'),(7,60,5,'Sản phẩm tốt','d6e1b26c-e6df-45b7-a198-70e8763b0dc3'),(8,56,5,'10 điểm','d6e1b26c-e6df-45b7-a198-70e8763b0dc3'),(9,55,4,'hehe','d6e1b26c-e6df-45b7-a198-70e8763b0dc3'),(10,57,5,'Sản phẩm tốt','15c16d7d-93bb-4149-b596-fc3a68236948'),(11,57,3,'Sản phẩm bình thường','15c16d7d-93bb-4149-b596-fc3a68236948');
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `roles` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('094e2da2-8e7c-43e1-9cd3-fbb613ff0a13','Nguyễn Minh Dương','0981965299','$argon2id$v=19$m=65536,t=3,p=4$vvOD3WFNL7OmUo/WlC8nqA$wlcW+yY6FJ0Jw6olAcbrDMyBeLMCwx6lneA82IC3OdA','aaaaaa',1,'2023-10-10',0,'Available','abcxukkykuyz@gmail.com'),('15c16d7d-93bb-4149-b596-fc3a68236948','Nguyen Minh Duong','0123456789','$argon2id$v=19$m=65536,t=3,p=4$rqelDu7Cz/FkycYl9lXlRg$tLdz3ohjlS7Jpr2305/3vqG+/04SjZv1xZ6gupjR+1k','265 Yên Hòa, Cầu Giấy, Hà Nội',1,'2001-03-15',0,'Available','fishyshynn@gmail.com'),('5223c270-20a5-4de4-ae8b-af2074f81728','Nguyễn Minh Dương','0917395608','$argon2id$v=19$m=65536,t=3,p=4$+lN5Rtja33BVldzl/Hr1Kg$0guO4bDHgujfj3TrlYviVLK8SMrtho0R1TOMQT1xbMY','265 Yên Hòa, Cầu Giấy, Hà Nội',0,'2001-03-15',0,'Available','fishyshynn@gmail.com'),('8361a94a-b416-441e-abdc-0d0b625e8d47','Minh Duong','0987654321','$argon2id$v=19$m=65536,t=3,p=4$iPMKJKObSM3+UTygWTOhBQ$tr0ZUccsNrKC8hofXizItspc0viwm278d5oTqZFp1ow','Cau Giay Ha Noi',0,'2001-03-15',0,'Available','minhduong@gmail.com'),('9115bccd-15db-454b-aa57-4904d16cf0fc',NULL,'0915301488','$argon2id$v=19$m=65536,t=3,p=4$nKijaCZKwfU4X/t49tmZRw$iANuDngmS8Lvtfz6pvAtIuumpVERzji5QT16kOPpyC0',NULL,NULL,NULL,0,'Available',NULL),('d6e1b26c-e6df-45b7-a198-70e8763b0dc3','Nguyen Huu Minh','0969159308','$argon2id$v=19$m=65536,t=3,p=4$dxipYVp5f/YPt3VKYKL8ZA$CZq4kjZqjJWMED4i8RjDUEcXJCNG/rE88yxWsE604VQ','ASDJAKJSAKLD',0,'2023-08-01',1,'Available','marcoreus1503@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `voucher_id` int NOT NULL AUTO_INCREMENT,
  `voucher_discount` int NOT NULL,
  `voucher_name` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES (3,30,'VOUCHERT8'),(4,15,'VOUCHERT9');
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `high_price`
--

/*!50001 DROP VIEW IF EXISTS `high_price`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `high_price` AS select `product`.`product_id` AS `product_id`,`product`.`product_name` AS `product_name`,`product`.`product_stocks` AS `product_stocks`,`product`.`price` AS `price`,`product`.`product_image` AS `product_image`,`product`.`brandId` AS `brandId`,`product`.`sold` AS `sold`,`product`.`categoryId` AS `categoryId`,`product`.`status` AS `status`,`product`.`description` AS `description` from `product` where (`product`.`price` > 5000000) */;
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

-- Dump completed on 2024-01-14 23:55:12
