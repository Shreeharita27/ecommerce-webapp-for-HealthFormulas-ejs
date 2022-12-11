-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2022 at 10:20 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthformulas`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Beauty'),
(2, 'Health & Wellness'),
(3, 'Baby Care');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `title`, `content`) VALUES
(1, 'about', 'About Us', '<p>eCommerce is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>'),
(2, 'contact', 'Contact Us', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d58911.87500168799!2d88.39522544634136!3d22.65407989591108!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f89e6c605d82ff%3A0x1f6779d05c4879ee!2sDum+Dum%2C+Kolkata%2C+West+Bengal!5e0!3m2!1sen!2sin!4v1524345317520\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>\n\n<address>\n<strong>Dumdum, Kolkata</strong><br>\nWest Bengal, INDIA<br>\nPin: 700030<br>\n<abbr title=\"Phone\">Phone:</abbr> +91 9647 5724 19<br>\n<abbr title=\"Email\">Email:</abbr> sendmail2krrish@gmail.com\n</address>');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `details` longtext NOT NULL,
  `price` int(11) NOT NULL,
  `picture` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `category`, `title`, `details`, `price`, `picture`) VALUES
(1, 1, 'Ourdaily Biotin Tablets- 10000mcg | Vitamin B7 Tablets', 'OurDaily Biotin with 10,000mcg Biotin is an essential supplement that makes your hair strong and shiny, skin healthy, and promotes nail growth.', 284, 'p1.png'),
(2, 2, 'Waterbury\'s Compound A-Provides Quick Relief from Cold & Cough| Ayurvedic Immunity Booster | 250 ml', 'Waterbury\'s Compound A is an Ayurvedic, Non-Drowsy formulation to provide quick relief from Common Cold, Cough and Running nose, Allergic Bronchitis and year round Immunity', 140, 'p2.png'),
(3, 3, 'Little\'s Organix Gentle Baby Powder | Baby Powder with Aloe Vera and Neem Extract | Baby Rashes Powder', ' Little\'s Organix Gentle Baby Powder is a fragrant talcum powder enriched with corn starch, an excellent absorbent that provides additional protection against wetness and ensures baby\'s skin remains soft, smooth & dry for longer. It has no parabens or pthalates which makes it safe to use on babies.\r\nThis is ideal to use after bath, at every nappy change, and at bedtime. Regular use ensures no chafing, keeps baby fresh & happy for longer.', 179, 'p3.png'),
(4, 3, 'Little\'s Organix Baby Shampoo with Neem & Aloe Vera Extracts I Free from Paraben & Phthalates', ' Little\'s Organix Baby Shampoo is a safe and gentle shampoo for your baby. It is free of harmful ingredients and is enriched with organic ingredients, like Aloe vera and Neem. It is especially formulated to gently clean and nourish your baby\'s hair and scalp without causing any irritation. Little\'s Shampoo helps in maintaining the texture of the hair and gives the required softness, while maintaining a fresh fragrance.', 198, 'p4.png'),
(5, 2, 'Ourdaily Ashwagandha - Ashwagandha Tablets for Energy, Immunity and Stress relief', 'Ourdaily Ashwagandha provides a rich source of Ashwagandha, also known as Indian Ginseng, which helps support Immunity, boosts energy levels, relieves stress, and provides antioxidants.\r\nProduct Features\r\nSupports Immunity\r\nHelps relieve stress\r\nBoost energy levels\r\nRich source of antioxidants\r\nHelps balance Vata in turn helping with anxiety, lowering the risks of stress induced male infertility, and relieving symptoms of Arthritis', 129, 'p5.png'),
(6, 1, 'Tetmosol Plus Cream | Topical Antifungal Cream', 'Provides relief from fungal skin infections such as ringworms, jock itch, athlete\'s foot\r\nRelief from skin infections that may increase due to sweat accumulation, friction, moisture & humidity \r\nTetmosol Plus Cream is your Skin Infection Expert from Doctor\'s recommended Tetmosol Soap Family', 135, 'p6.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `password`) VALUES
('ajayroy@gmail.com', 'qwe'),
('bhuvan625@gmail.com', '123'),
('bhuvan@gmail.com', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
