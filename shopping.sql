-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 24, 2023 at 03:13 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2023-02-04 16:21:18', '15-03-2023 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(7, 'Men', 'Trendy and Fashionable dresses for men.', '2023-03-23 07:02:27', NULL),
(8, 'Women', 'Trendy and Fashionable dresses for women.', '2023-03-23 07:02:57', NULL),
(9, 'Kids', 'Trendy and Fashionable dresses for kids.', '2023-03-23 07:03:15', NULL),
(10, 'Accessrories', 'Trendy and Fashionable accessories for men, women and kids.', '2023-03-23 07:04:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `userId` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `email`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(15, 4, 'mali1@example.com', '22', 1, '2023-04-08 18:00:00', 'COD', 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int NOT NULL,
  `orderId` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2023-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2023-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2023-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2023-03-10 19:50:36'),
(5, 7, 'in Process', 'Your order is taken and you will get your product as soon as possible. \r\n\r\nThank you for purchasing from us!', '2023-03-23 07:37:12');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int NOT NULL,
  `productId` int DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `value` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Md Ali', 'A best product according to the price :)', 'Quality product :)', '2023-03-02 01:43:57'),
(3, 3, 3, 4, 3, 'Tayeba Mogal Nipa', 'Nice Product', 'Value for money', '2023-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Tania Haque', 'Nice Product', 'Value for money', '2023-02-16 22:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `category` int NOT NULL,
  `subCategory` int DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int DEFAULT NULL,
  `productPriceBeforeDiscount` int DEFAULT NULL,
  `stock` bigint DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `productDescription` longtext,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `stock`, `size`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(22, 7, 14, 'Jeans Pant', 'A', 1350, 1500, 4, 'S', 'Jeans Pant<br>', 'j1.jpg', 'j2.jpg', 'j3.jpg', 50, 'In Stock', '2023-03-23 07:15:46', NULL),
(23, 7, 15, 'Sport T-shirt', 'a', 500, 600, 10, 'M', 'Sport T-shirt', 'ts2.jpg', 'ts1.jpg', '', 50, 'In Stock', '2023-03-23 07:18:51', NULL),
(24, 8, 16, '3 pcs', 'A', 1600, 2000, 10, 'L', '3 pcs', 'tp1.jpg', 'tp2.jpg', '', 50, 'In Stock', '2023-03-23 07:20:57', NULL),
(25, 8, 16, '3 pcs', 'A', 1700, 2200, 10, 'S', '3 pcs', 'tp22.jpg', 'tp21.jpg', '', 50, 'Out of Stock', '2023-03-23 07:21:49', NULL),
(26, 9, 20, 'Shirt and Pant combo', 'A', 1000, 1200, 10, 'L', 'Shirt and Pant combo Eid special offer!', 'sp1.jpg', 'sp2.jpg', '', 50, 'In Stock', '2023-03-23 07:25:23', NULL),
(27, 10, 24, 'Formal Shoe', 'A', 1900, 2000, 10, 'M', 'Formal Shoe', 'sh1.jpg', 'sh3.jpg', 'sh2.jpg', 50, 'In Stock', '2023-03-23 07:26:51', NULL),
(28, 7, 13, 'ddd', 'ddd', 4, 20, 10, 'S', 'dddd', 'G7.jpeg', 'GearUP G7 Neckband BD.jpg', '', 2, 'In Stock', '2023-04-09 08:56:15', NULL),
(29, 7, 13, 'dddss', 'sds', 8, 10, 100, 'M', 'eeee', 'GearUP G7 Neckband BD.jpg', 'GearUP G7 Neckband BD.jpg', '', 2, 'In Stock', '2023-04-09 08:57:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `image`) VALUES
(15, 'Untitled design (2).png'),
(16, 'danial-igdery-FCHlYvR5gJI-unsplash.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int NOT NULL,
  `categoryid` int DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(13, 7, 'Shirt', '2023-03-23 07:05:01', NULL),
(14, 7, 'Pant', '2023-03-23 07:05:07', NULL),
(15, 7, 'T-Shirt', '2023-03-23 07:05:21', NULL),
(16, 8, '3 pcs', '2023-03-23 07:05:33', NULL),
(17, 8, 'Pant', '2023-03-23 07:05:41', NULL),
(18, 8, 'Shirt', '2023-03-23 07:05:49', NULL),
(19, 8, 'T-Shirt', '2023-03-23 07:05:55', NULL),
(20, 9, 'Shirt', '2023-03-23 07:06:02', NULL),
(21, 9, 'Pant', '2023-03-23 07:06:13', NULL),
(22, 9, 'T-Shirt', '2023-03-23 07:06:21', NULL),
(23, 9, 'Frocks', '2023-03-23 07:06:45', NULL),
(24, 10, 'Mens Shoe', '2023-03-23 07:07:12', NULL),
(25, 10, 'Womens Shoes', '2023-03-23 07:07:27', NULL),
(26, 10, 'Kids Shoe', '2023-03-23 07:07:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'nipa@example.com', 0x3a3a3100000000000000000000000000, '2023-02-26 11:18:50', '', 1),
(2, 'tania@example.com', 0x3a3a3100000000000000000000000000, '2023-03-16 11:29:33', '', 1),
(24, 'mdali1@example.com', 0x3a3a3100000000000000000000000000, '2023-03-23 07:01:10', NULL, 1),
(25, 'mdali1@example.com', 0x3a3a3100000000000000000000000000, '2023-04-09 08:51:09', '09-04-2023 02:21:23 PM', 1),
(26, 'mdali1@example.com', 0x3a3a3100000000000000000000000000, '2023-04-09 09:42:39', NULL, 1),
(27, 'mdali1@example.com', 0x3a3a3100000000000000000000000000, '2023-04-09 09:43:21', '09-04-2023 03:17:45 PM', 1),
(28, 'mdali1@example.com', 0x3a3a3100000000000000000000000000, '2023-04-09 09:47:52', '13-04-2023 11:28:55 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int DEFAULT NULL,
  `billingAddress` longtext,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(4, 'mdali1', 'mdali1@example.com', 123456789, 'e10adc3949ba59abbe56e057f20f883e', '12/e Mirpurs', 'Mirpur', 'dhaka', 1216, '12/e Mirpur', 'Dhaka', 'dhaka', 1216, '2023-03-23 06:45:07', NULL),
(5, 'mdali1', 'mdali1@example.com', 123456789, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-23 06:50:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int NOT NULL,
  `userId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2023-02-27 18:53:17'),
(2, 4, 27, '2023-03-23 14:02:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
