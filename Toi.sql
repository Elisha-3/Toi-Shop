-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 17, 2024 at 11:29 AM
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
  `product_desc` varchar(500) NOT NULL,
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
(133, 'Deluxe Strap Carrier 2', 'Stylish carrier with breathable extra padding.', 1500, 'Fancy', 'strap carrier.jpg'),
(134, 'CozyNest Baby Cot', 'A stylish and comfortable cot with adjustable mattress heights.', 25000, 'cots', 'cott3.jpg'),
(135, 'Dreamy Sleep Baby Cot', 'Designed for safety and comfort, with breathable materials and a soothing mobile.', 22500, 'cots', 'cott7.jpg'),
(136, 'EcoWood Baby Cot', 'Made from sustainable wood, this cot features a classic design and non-toxic finishes.', 30000, 'cots', 'cott3.jpg'),
(137, 'Classic Cradle Cot', 'A timeless cradle with gentle rocking motion for a soothing sleep experience.', 20000, 'cots', 'cott8.jpg'),
(138, 'Luxury Dream Cot', 'A premium cot with plush padding, adjustable height, and elegant design.', 40000, 'cots', 'cott6.jpg'),
(139, 'SafetyFirst Cot', 'Features rounded edges and a sturdy design, ensuring maximum safety for your baby.', 18000, 'cots', 'cott2.jpg'),
(140, ' SoftTouch Cotton Cot', 'Comes with hypoallergenic cotton bedding for a gentle touch on baby\'s skin.', 24000, 'cots', 'cott10.jpg'),
(141, 'Convertible Baby Cot', 'A versatile cot that easily converts into a toddler bed as your child grows.', 35000, 'cots', 'cott5.jpg'),
(142, 'Vintage Charm Baby Cot', 'A charming vintage-inspired design with intricate details and a classic finish.', 32000, 'cots', 'cott4.jpg'),
(143, 'Cute Cuddle Booties', 'Soft, warm booties for chilly days, featuring a non-slip sole.', 1800, 'shoes', 'foot2.jpg'),
(144, 'Little Explorer Sandals', 'Lightweight sandals with adjustable straps for a secure fit.\r\n', 2200, 'shoes', 'foot16.jpg'),
(145, 'Tiny Toes Sneakers', 'Comfortable canvas sneakers perfect for everyday wear.', 2500, 'shoes', 'foot3.jpg'),
(146, 'Classic Mary Janes', 'Timeless leather shoes with a buckle, great for special occasions.', 3000, 'shoes', 'foot15.jpg'),
(147, 'Adventurer High Tops', 'Trendy high-top sneakers designed for little adventurers.\r\n', 2800, 'shoes', 'foot8.jpg'),
(148, 'Fluffy Fleece Slippers', 'Cozy slippers made from soft fleece, perfect for indoors.', 1500, 'shoes', 'foot11.jpg'),
(149, 'Rainbow Lace-Up Shoes', 'Colorful lace-up shoes that add fun to any outfit.', 2400, 'shoes', 'foot7.jpg'),
(150, 'Bouncy Balloons Trainers', ' Sporty trainers with fun balloon prints, ideal for playtime.\r\n', 2600, 'shoes', 'foot3.jpg'),
(151, 'Velvet Soft Crib Shoes', 'Adorable crib shoes made from soft velvet for delicate feet.', 1700, 'shoes', 'foot1.jpg'),
(152, 'Pirate Ship Slip-Ons', 'Fun slip-on shoes with a pirate theme, great for casual outings.', 1500, 'shoes', 'foot6.jpg'),
(153, 'Colorful Canvas Espadrilles', 'Breezy espadrilles with a colorful design for summer days.', 2100, 'shoes', 'foot8.jpg'),
(154, 'Animal Print Booties', 'Fun booties with cute animal prints, perfect for playtime.\r\n', 1900, 'shoes', 'foot13.jpg'),
(155, 'Superhero Slip-Ons', ' Slip-on shoes featuring popular superhero designs for little fans.', 2500, 'shoes', 'foot12.jpg'),
(156, 'Classic Blue Denim Shoes', 'Versatile denim shoes that can match any casual outfit.', 2700, 'shoes', 'foot10.jpg'),
(157, 'Silicone Baby Feeder', 'Soft silicone feeder that allows babies to self-feed safely.', 1200, 'containers', 'feeder1.jpg'),
(158, 'Mesh Food Feeder', 'Mesh feeder perfect for fruits and veggies, promoting healthy eating.', 900, 'containers', 'feeder4.jpg'),
(159, 'Teething Feeder', 'Designed to soothe gums while allowing for safe food exploration.', 1000, 'containers', 'feeder6.jpg'),
(160, 'Baby Food Dispensing Spoon', 'Spoon that dispenses pureed food directly, making feeding easier.', 150, 'containers', 'feeder2.jpg'),
(161, 'Nibbler Feeder', 'Feeder designed for introducing solids; safe and easy to clean.', 300, 'containers', 'feeder bottle3.jpg'),
(162, 'Multi-Functional Baby Feeder', 'Combines a teething toy and food feeder in one for versatility.', 1400, 'containers', 'swinger.jpg'),
(163, 'Standard Baby Bottle', 'Classic baby bottle with anti-colic nipple design.', 1000, 'containers', 'feeder2.jpg'),
(164, 'Anti-Colic Feeding Bottle', 'Specially designed to reduce colic and gas in babies.', 1500, 'containers', 'baby bottles.jpg'),
(165, 'Self-Feeding Bottle', 'Innovative bottle that encourages babies to feed themselves.', 1200, 'containers', 'feeder3.jpg'),
(166, 'Maternity Maxi Dress', 'A comfortable, flowy maxi dress designed for easy wear throughout pregnancy. Features adjustable straps and a flattering empire waist.', 1800, 'moms', 'mom1.jpg'),
(167, 'High-Waisted Maternity Leggings', 'Soft and stretchy leggings that provide support and comfort for the growing belly. Perfect for casual outings or lounging at home.', 2200, 'moms', 'mom.jpg'),
(168, 'Maternity Tunic Top', 'A stylish, flowy tunic made from breathable fabric, ideal for layering or wearing on its own. Available in various colors.', 1200, 'moms', 'mom8.jpg'),
(169, 'Nursing Top with Button Access', 'Stylish top featuring button-down access for easy breastfeeding. Made from soft, breathable fabric.', 800, 'moms', 'mom8.jpg'),
(170, 'Nursing Bra', 'Comfortable and supportive nursing bra with easy clip-down access for breastfeeding.', 600, 'moms', 'bra1.jpg'),
(171, ' Nursing Sports Bra', 'Supportive sports bra designed for nursing mothers, featuring adjustable straps and easy access.', 650, 'moms', 'bra.jpg'),
(172, 'Lightweight Cardigan', 'A versatile cardigan ideal for layering, with open fronts for easy nursing access.', 1200, 'moms', 'mom4.jpg'),
(173, 'Maternity Jeans', 'Classic denim jeans with a stretchy belly panel for added comfort. Perfect for everyday wear.', 1000, 'moms', 'mom9.jpg'),
(174, 'Swaddle Blanket Set', 'A set of soft, breathable swaddle blankets made from organic cotton, perfect for keeping the baby cozy and comfortable.', 2000, 'moms', 'blankets.jpg'),
(175, 'Diaper Bag Backpack', 'A stylish and functional diaper bag with multiple compartments for easy organization, designed to be worn as a backpack for convenience.', 1800, 'moms', 'diaper_bag.jpg'),
(176, 'Baby Care Kit', 'A comprehensive baby care kit including essentials like a digital thermometer, nail clippers, comb, and brush. Perfect for new moms to keep their baby well-cared for.', 2200, 'moms', 'grooming kit.jpg'),
(177, 'Kanga (Lesso) Set', 'A beautifully designed kanga set made from soft, breathable cotton. Perfect for wrapping the baby, using as a blanket, or even as a stylish fashion accessory for the mom. Comes with vibrant prints and traditional sayings.', 1800, 'moms', 'lesso.jpg'),
(178, 'C-Shaped Nursing Pillow', 'A supportive C-shaped nursing pillow that provides comfort for both mom and baby during breastfeeding. Made from soft, hypoallergenic fabric with removable, washable cover.', 3500, 'moms', 'nursing pillow.jpg'),
(179, 'Multi-Use Nursing Pillow', 'This versatile nursing pillow can be used for breastfeeding, tummy time, and as a support pillow as the baby grows. Features a soft cover and adjustable support.', 4000, 'moms', 'nursing.pillow.jpg'),
(180, 'U-Shaped Nursing Pillow', 'Designed to cradle both mom and baby, this U-shaped nursing pillow offers excellent support and comfort. The removable cover is easy to wash, and it includes a pocket for storing essentials', 2500, 'moms', 'nursing.pillow1.jpg'),
(181, 'Comfort Hip Straps', 'Designed for maximum comfort and support, these hip straps are perfect for daily activities or fitness routines. Made with breathable fabric and adjustable fittings, they ensure a secure fit for all body types. Ideal for running, hiking, or just lounging around, these straps provide the perfect blend of style and functionality.', 2500, 'moms', 'hip strap.jpg');

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phone`, `password`, `role`) VALUES
(1, 'Manuel', 'nuelsema5@gmail.com', '+254731552276', '321456', 'user'),
(2, 'Sharon Mary', 'smart@gmail.com', '+254731552382', '987456', 'user'),
(3, 'Ban', 'keancheelisha3@gmail.com', '+254704112663', '@pgaDmin4#0', 'admin'),
(4, 'Esther', 'esmo@gmail.com', '+254793055563', 'esmo_ken', 'admin'),
(5, 'Keanche Ngare', 'keancheelishan@outlook.com', '+254704112663', '2023@Nuel5/19', 'admin');

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
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
