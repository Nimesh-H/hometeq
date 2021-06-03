-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2021 at 11:03 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hometeq`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderNo` int(4) NOT NULL,
  `userId` int(4) NOT NULL,
  `orderDateTime` datetime NOT NULL,
  `orderTotal` decimal(8,2) NOT NULL DEFAULT 0.00,
  `orderStatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderNo`, `userId`, `orderDateTime`, `orderTotal`, `orderStatus`) VALUES
(1, 1, '2021-06-01 22:56:07', '956.95', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_line`
--

CREATE TABLE `order_line` (
  `oderLineId` int(4) NOT NULL,
  `orderNo` int(4) NOT NULL,
  `prodId` int(4) NOT NULL,
  `quantityOrdered` int(4) NOT NULL,
  `subTotal` decimal(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prodId` int(4) NOT NULL,
  `prodName` varchar(30) NOT NULL,
  `prodPicNameSmall` varchar(100) NOT NULL,
  `prodPicNameLarge` varchar(100) NOT NULL,
  `prodDescripShort` varchar(1000) DEFAULT NULL,
  `prodDescripLong` varchar(3000) DEFAULT NULL,
  `prodPrice` decimal(6,2) NOT NULL,
  `prodQuantity` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prodId`, `prodName`, `prodPicNameSmall`, `prodPicNameLarge`, `prodDescripShort`, `prodDescripLong`, `prodPrice`, `prodQuantity`) VALUES
(1, 'Sony WH-XB900N', 'sony.jpg', 'sonylarge.jpg', 'Sony WH-XB900N Noise Cancelling Extra Bass Bluetooth NFC Wireless Over-Ear Headphones with Mic/Remote, Black', 'Enhance your wireless listening with Noise Cancelling and Extra Bass technology with Sony’s WH-XB900N. Digital Noise Cancellation excludes external ambient sound, you can take hands-free calls with them, and interact with your phone’s voice assistant. And they’re designed to ensure a comfortable listen over their long-lasting battery life.', '169.00', 10),
(2, 'Audio-Technica ATH-SR30BT', 'audio.jpg', 'audiolarge.jpg', 'Audio-Technica ATH-SR30BT Wireless Bluetooth Over-Ear Headphones with Mic/Remote, Black, Black', 'These Bluetooth headphones from Audio-Technica offer great sound and wireless freedom. Control them via simple controls on the ear-cup, and they have a very long battery life. Hook up these earphones to your smart device wirelessly through Bluetooth. Experience pure audio clarity. 40mm drivers deliver great quality sound up and down a frequency range of 5 – 35,000Hz, so your music is rich, balanced and full of detail.', '89.99', 20),
(3, 'Jabra Elite Active 75t', 'jabra.jpg', 'jabralarge.jpg', 'Jabra Elite Active 75t True Wireless Bluetooth Active Noise Cancelling Sweat & Weather-Resistant In-Ear Headphones with Mic/Remote, Dark Grey, Dark Grey', 'With a new compact design and improved eargels, Jabra\'s Elite Active 75t true wireless earbuds with Active Noise Cancellation (ANC) offer the liberating freedom of true wireless listening and the resilience demanded of a high-power workout. Enjoy high quality Jabra sound and crystal clear phone calls. They\'re durable, comfortable and secure, and will keep you in music throughout the day with an included charging carry case.', '189.00', 45);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(4) NOT NULL,
  `userType` varchar(1) NOT NULL,
  `userFName` varchar(50) NOT NULL,
  `userSName` varchar(50) NOT NULL,
  `userAddress` varchar(50) NOT NULL,
  `userPostCode` varchar(50) NOT NULL,
  `userTelNo` varchar(50) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userPassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `userType`, `userFName`, `userSName`, `userAddress`, `userPostCode`, `userTelNo`, `userEmail`, `userPassword`) VALUES
(1, '', 'Donald', 'Duck', '2 Disney Rd', 'N2 6RD', '02079115002', 'dd@gmail.com', '123'),
(2, '', 'Nimesh', 'Hirudika', 'No 10, Galle', '80000', '0771234567', 'nimesh@gmail.com', 'nimesh123'),
(3, '', 'Nimesh', 'Hirudika', 'no 98/63', '80000', '02079115002', 'thedenisovich@gmail.com', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderNo`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`oderLineId`),
  ADD KEY `orderNo` (`orderNo`),
  ADD KEY `prodId` (`prodId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderNo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_line`
--
ALTER TABLE `order_line`
  MODIFY `oderLineId` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prodId` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);

--
-- Constraints for table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`orderNo`) REFERENCES `orders` (`orderNo`),
  ADD CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`prodId`) REFERENCES `product` (`prodId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
