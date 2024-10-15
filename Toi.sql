-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 15, 2024 at 02:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Toi`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(50) NOT NULL,
  `product_name` text NOT NULL,
  `product_desc` varchar(50) NOT NULL,
  `product_cost` int(50) NOT NULL,
  `product_category` text NOT NULL,
  `product_image_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_desc`, `product_cost`, `product_category`, `product_image_name`) VALUES
(1, 'Newborn Baby Starter Kit 1', 'Includes diapers, wipes, and onesies.', 2250, 'Essentials', 'starterkit.jpg'),
(2, 'Newborn Baby Starter Kit 2', 'Includes bath items and swaddle blankets.', 450, 'Essentials', 'swaddle.jpg'),
(3, 'Newborn Baby Starter Kit 3', 'Includes feeding bottles and pacifiers.', 1000, 'Essentials', 'paccifier.jpg'),
(4, 'Newborn Baby Starter Kit 4', 'Includes baby clothes and hats.', 1500, 'Essentials', 'kit1.jpg'),
(5, 'Newborn Baby Starter Kit 5', 'Includes grooming kit and thermometer.', 900, 'Essentials', 'kit2.jpg'),
(6, 'Newborn Baby Starter Kit 6', 'Includes toys and teething rings.', 350, 'Essentials', 'baby teether.jpg'),
(7, 'Newborn Baby Starter Kit 7', 'Includes blankets and crib sheets.', 1300, 'Essentials', 'baby shawl.jpg'),
(8, 'Newborn Baby Starter Kit 8', 'Includes diaper bag and changing mat.', 1600, 'Essentials', 'crawl mat.jpg'),
(9, 'Newborn Baby Starter Kit 9', 'Includes safety items and pacifier clips.', 1500, 'Essentials', 'paccifier.jpg'),
(10, 'Newborn Baby Starter Kit 10', 'Includes health kit and soft toys.', 850, 'Essentials', 'toybank.jpg'),
(11, 'Stylish Diaper Bag 1', 'Water-resistant diaper bag with multiple pockets.', 1800, 'Bags', 'diaperbag1.jpg'),
(12, 'Stylish Diaper Bag 2', 'Insulated pockets for bottles and snacks.', 1600, 'Bags', 'diaper bag2.jpg'),
(13, 'Stylish Diaper Bag 3', 'Compact design with changing mat included.', 2400, 'Bags', 'diaper bag3.jpg'),
(14, 'Stylish Diaper Bag 4', 'Durable fabric and easy to clean.', 2400, 'Bags', 'diaper bag3.jpg'),
(15, 'Stylish Diaper Bag 5', 'Trendy backpack style with ample storage.', 1800, 'Bags', 'diaper bag4.jpg'),
(16, 'Stylish Diaper Bag 6', 'Classic tote with chic design and functionality.', 1450, 'Bags', 'diaper bag7.jpg'),
(17, 'Stylish Diaper Bag 7', 'Lightweight and ergonomic for comfort.', 1800, 'Bags', 'diaper bag6.jpg'),
(18, 'Stylish Diaper Bag 8', 'Versatile bag that doubles as a handbag.', 2400, 'Bags', 'diaper bag3.jpg'),
(19, 'Stylish Diaper Bag 9', 'Multi-functional bag with stroller straps.', 1800, 'Bags', 'diaper bag6.jpg'),
(20, 'Stylish Diaper Bag 10', 'Eco-friendly materials and stylish design.', 1800, 'Bags', 'diaper bag4.jpg'),
(21, 'Colorful Baby Walker 1', 'Adjustable height with fun toys for entertainment.', 3200, 'Walkers', 'baby walker1.jpg'),
(22, 'Colorful Baby Walker 2', 'Features safety brakes and a comfortable seat.', 3500, 'Walkers', 'pushwalker.jpg'),
(23, 'Colorful Baby Walker 3', 'Lightweight and easy to fold for storage.', 5500, 'Walkers', 'rocker1.jpg'),
(24, 'Colorful Baby Walker 4', 'Includes music and lights for interactive play.', 3200, 'Walkers', 'baby walker1.jpg'),
(25, 'Colorful Baby Walker 5', 'Sturdy frame with non-slip wheels for safety.', 5500, 'Walkers', 'rocker3.jpg'),
(26, 'Colorful Baby Walker 6', 'Portable design for on-the-go families.', 3500, 'Walkers', 'rocker4.jpg'),
(27, 'Colorful Baby Walker 7', 'Can convert to a push walker for added stability.', 3500, 'Walkers', 'pushwalker.jpg'),
(28, 'Colorful Baby Walker 8', 'Vibrant colors and engaging toys for sensory play.', 3200, 'Walkers', 'baby walker1.jpg'),
(29, 'Colorful Baby Walker 9', 'Ergonomic design with cushioned seat.', 5500, 'Walkers', 'rocker1.jpg'),
(30, 'Colorful Baby Walker 10', 'Easy to clean fabric and removable seat cover.', 4900, 'Walkers', 'feeding chair2.jpg'),
(57, 'Baby Feeder 1', 'Silicone feeder with soft, easy-grip handle.', 400, 'Feeders', 'feeder.jpg'),
(58, 'Baby Feeder 2', 'Mesh feeder for introducing solids safely.', 450, 'Feeders', 'food masher.jpg'),
(59, 'Baby Feeder 3', 'BPA-free plastic feeder with various sizes.', 150, 'Feeders', 'feeder2.jpg'),
(60, 'Feeding Bottle 1', 'Feeding bottle with anticolic design.', 1800, 'Feeders', 'feeder bottle2.jpg'),
(61, 'Feeding Bottle 2', 'Feeding bottle with wide-neck for easy filling.', 1000, 'Feeders', 'feeder bottle3.jpg'),
(62, 'Feeding Bottle 3', 'Silicone feeding bottle with soft spout.', 350, 'Feeders', 'feeding bottle.jpg'),
(63, 'Feeding Bottle 4', 'Lightweight bottle with ergonomic shape.', 300, 'Feeders', 'feeding bottle1.jpg'),
(64, 'Feeding Chair 1', 'Adjustable high chair with safety harness.', 6300, 'Feeders', 'feeding chair.jpg'),
(65, 'Feeding Chair 2', 'Compact folding high chair for easy storage.', 13000, 'Feeders', 'feeding chair1.jpg'),
(66, 'Feeding Chair 3', 'Wooden high chair with classic design.', 4900, 'Feeders', 'feeding chair2.jpg'),
(67, 'Feeding Chair 4', 'Multi-functional chair that grows with your child.', 5500, 'Feeders', 'rocker3.jpg'),
(68, 'Feeding Chair 5', 'Soft padded chair with removable cover.', 4900, 'Feeders', 'feeding chair2.jpg'),
(69, 'Food Masher', 'Easy-to-use food masher for homemade baby food.', 450, 'Feeders', 'food masher.jpg'),
(70, 'Baby T-Shirt 1', 'Soft cotton t-shirt with fun prints.', 1200, 'Clothings', 'clothe.jpg'),
(71, 'Baby T-Shirt 2', 'Short-sleeve t-shirt in vibrant colors.', 1200, 'Clothings', 'clothe1.jpg'),
(72, 'Baby Onesie 1', 'Classic onesie with easy snap buttons.', 1300, 'Clothings', 'clothe2.jpg'),
(73, 'Baby Onesie 2', 'Long-sleeve onesie for cooler weather.', 1200, 'Clothings', 'clothe3.jpg'),
(74, 'Baby Pants 1', 'Comfy elastic pants with adorable patterns.', 750, 'Clothings', 'clothe4.jpg'),
(75, 'Baby Pants 2', 'Lightweight pants for everyday wear.', 1300, 'Clothings', 'clothe2.jpg'),
(76, 'Baby Dress 1', 'Charming dress with floral design.', 1700, 'Clothings', 'hooded shawl.jpg'),
(77, 'Fleece Baby Shawl 2', 'Cozy shawl with fun animal prints.', 1300, 'Clothings', 'fleece shawl.jpg'),
(78, 'Reversible Baby Shawl 1', 'Two-in-one design for versatile styling.', 1350, 'Clothings', 'baby shawl1.jpg'),
(79, 'Reversible Baby Shawl 2', 'Stylish reversible shawl for any occasion.', 1300, 'Clothings', 'baby shawl.jpg'),
(125, 'Luxury Baby Nest 1', 'Soft and cozy nest with removable cover.', 2300, 'Fancy', 'babynest.jpg'),
(126, 'Luxury Baby Nest 2', 'Stylish design with breathable fabric.', 2500, 'Fancy', 'babynest1.jpg'),
(127, 'Luxury Baby Nest 3', 'Portable baby nest with adjustable sides.', 1300, 'Fancy', 'babynest2.jpg'),
(128, 'Luxury Baby Nest 4', 'Elegant decorative stitching.', 1000, 'Fancy', 'babynest3.jpg'),
(129, 'Luxury Electric Breast Pump 1', 'Efficient electric pump, customizable settings.', 2300, 'Fancy', 'Electric breast pump.jpg'),
(130, 'Premium Manual Breast Pump 1', 'Ergonomically designed pump for comfortable use.', 1700, 'Fancy', 'breastpump.jpg'),
(131, 'Deluxe Wearable Breast Pump 1', 'Discreet hands-free pump with advanced technology.', 950, 'Fancy', 'breast pumb.jpg'),
(132, 'Luxury Strap Carrier 1', 'Comfortable ergonomic design, adjustable.', 2100, 'Fancy', 'carrier.jpg'),
(133, 'Deluxe Strap Carrier 2', 'Stylish carrier with breathable extra padding.', 1500, 'Fancy', 'strap carrier.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `username` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
