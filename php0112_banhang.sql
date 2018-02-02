-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 02, 2018 at 12:35 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php0112_banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `date_order` date NOT NULL,
  `total` double NOT NULL,
  `payment_method` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token_date` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment_method`, `note`, `token`, `token_date`, `status`) VALUES
(12, 12, '2014-01-13', 2718000, 'tiền mặt', '', NULL, NULL, 0),
(13, 13, '2014-01-13', 2718000, 'tiền mặt', '', NULL, NULL, 0),
(14, 16, '2014-05-20', 295000, 'tiền mặt', '', NULL, NULL, 0),
(15, 17, '2014-05-20', 410000, 'tiền mặt', '', NULL, NULL, 0),
(16, 27, '2017-11-07', 75000, NULL, '3', NULL, NULL, 1),
(17, 29, '2017-11-07', 75000, NULL, '', 'oJOuTBXLciXnMJsHFVVyw6nfHxoMo7S', '2017-11-07 06:54:22', 0),
(18, 30, '2017-11-07', 100000, NULL, '', '4gec6JFMGXHgnpMV2exZ2DKs090oVg1', '2017-11-07 07:08:33', 0),
(19, 31, '2017-11-07', 100000, NULL, 'ggggggggggggggggggg', 'Nx1IrTPn7wquB0x8ybjJChezeXaYz7qb', '2017-11-07 07:12:12', 0),
(20, 32, '2017-11-07', 170000, NULL, 'edfdfdfdfd', 'FNssv5VjyrI83amDtfLAozAwaVfjzBUK', '2017-11-07 07:13:48', 0),
(21, 33, '2017-11-09', 25000, NULL, '3333333333', 'Tc9HxkJNNHVCnJaB1PfX20sRSGiFSc1', '2017-11-09 06:47:46', 0),
(22, 34, '2017-11-09', 25000, NULL, '333333333', '7Edd7C1SHgqaRGNVyr5uIS5UdTJwCda9', '2017-11-09 06:50:04', 0),
(23, 35, '2017-11-09', 90000, NULL, '32efdfdf', 'J9CiIQh2u856VTgaZBS0x9KsLwt15hYF', '2017-11-09 06:56:12', 0),
(24, 36, '2017-11-09', 25000, NULL, '333333', 'xHkoNLppxpZMZ6aaItYUceP5fMpZWY', '2017-11-09 06:59:11', 0),
(25, 37, '2017-11-09', 25000, NULL, 'hhhhhhhhh', '7d7FaoxG4bJTx6D6dCVnuA7BRjlveVb', '2017-11-09 07:01:04', 0),
(26, 38, '2017-11-09', 25000, NULL, '4444444444444444', 'a9b62ne22zz8KOhBGbq83z3lgSBrpkC', '2017-11-09 07:03:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(11) NOT NULL,
  `id_bill` int(11) NOT NULL,
  `id_food` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='chi_tiet_hoa_don' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_food`, `quantity`, `price`) VALUES
(1, 12, 3, 3, 50000),
(2, 12, 1, 2, 50000),
(3, 18, 4, 3, 50000),
(4, 18, 3, 1, 50000),
(5, 19, 4, 3, 50000),
(6, 19, 3, 1, 50000),
(7, 20, 2, 2, 50000),
(8, 20, 6, 1, 50000),
(9, 21, 1, 1, 50000),
(10, 22, 1, 1, 50000),
(11, 23, 2, 2, 50000),
(12, 24, 3, 1, 50000),
(13, 25, 3, 1, 50000),
(18, 10, 15, 7, 10000000),
(19, 10, 15, 7, 10000000),
(20, 10, 15, 7, 10000000),
(21, 6, 15, 7, 10000000),
(23, 10, 52, 5, 89),
(24, 12, 52, 8, 89);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `gender`, `email`, `address`, `phone`, `note`) VALUES
(12, 'Nguyễn Thị Thảo', 'nữ', 'thao@gmail.com', 'đường 27', '0123456799', 'Sinh Nhật'),
(13, 'Trần Thu Trang', 'nữ', 'trang@yahoo.com', 'đường 27', '0123456799', 'Đám cưới'),
(14, 'Đỗ Lâm Thiên', 'nam', 'thien@mail.com', '357 Lê Hồng Phong, Q.10', '8331056', ''),
(16, 'Khuất Thùy Phương', 'nữ', 'kpt@edu.vn', 'Nguyễn Oanh', '0123456789', 'Vui lòng gửi hàng đúng ngày'),
(17, 'Mai Thu Thảo', 'nữ', 'thao@gmail.com', 'Nguyễn Văn Cừ', '0235698758', ''),
(18, 'Ngọc Hương 03', 'nữ', 'huognguyenak@gmail.com', 'Tân Bình', '', ''),
(20, 'Ngọc Hương', 'nữ', 'huognguyenak96@gmail.com', 'Quận 1', '', ''),
(21, 'Z Hương', 'nữ', 'huongnguyenak96@gmail.com', 'Quận 1', '2345678234', ''),
(22, 'Hương', 'nữ', 'huongnguyenak96@gmail.com', 'Quận 1', '2345678234', ''),
(23, 'Hương Hương', 'nnam', 'huongnguyenak96121@gmail.com', 'Quận 1, HCM', '232242424', ''),
(27, 'Hương Hương', 'nữ', 'huongnguyenak96@gmail.com', 'hhhhhhhhhhhhhh', '232323232', ''),
(29, 'Hương', 'nnam', 'huongnguyenak96@gmail.com', 'ữc', '232323', ''),
(30, 'Hương', 'nnam', 'huongnguyenak96@gmail.com', '23456789', '23456789', ''),
(31, 'Hương 234t', 'nữ', 'huongnguyenak96@gmail.com', 'hgfd', '32323233', ''),
(32, 'Hương 23456789', 'nữ', 'huongnguyenak96121@gmail.com', '3434343434', '434343434', ''),
(33, 'Hương Hương', 'nữ', 'huongnguyenak96@gmail.com', 'fff', '333333333333333', ''),
(34, 'Hương Hương 4444444444444', 'nữ', 'huongnguyenak96@gmail.com', 'gg', '333333333', ''),
(35, 'Hương Hương ', 'nữ', 'huongnguyenak96@gmail.com', 'hhhhhhhhhhhhhh', '232323', ''),
(36, 'Hương Hương', 'nữ', 'huongnguyenak96@gmail.com', 'hgfx', '3333333333', ''),
(37, 'Hương Hương', 'nnam', 'huongnguyenak96@gmail.com', 'hhhhhhhhhhhhhhh', 'hhhhhhhhhhh', ''),
(38, 'Hương Hương', 'nữ', 'huongnguyenak96@gmail.com', 'hhhhhhhhhhhh', '44444', ''),
(39, 'Hương Hương', 'nữ', 'huongnguyenak96@gmail.com', 'hhhhhhhhhhhhhhhhhh', '33333333333', ''),
(40, 'Hương Hương', 'nữ', 'huongnguyenak96@gmail.com', 'fffffffffffffffff', '1232323', ''),
(41, 'Hương Hương', 'nữ', 'huongnguyenak96@gmail.com', 'hfc', '113', '');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_url` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `summary` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `detail` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `promotion_price` double NOT NULL,
  `promotion` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'nước ngọt, khăn lạnh',
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `update_at` date NOT NULL,
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'đĩa',
  `today` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `id_type`, `id_url`, `name`, `summary`, `detail`, `price`, `promotion_price`, `promotion`, `image`, `update_at`, `unit`, `today`) VALUES
(1, 2, 1, 'Bánh canh', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Được làm từ bột gạo, bột mì, hoặc bột sắn hoặc bột gạo pha bột sắn cán thành tấm và cắt ra thành sợi to và ngắn với nước dùng được nấu từ tôm, cá, giò heo... thêm gia vị tùy theo từng loại', 25000, 0, 'nước ngọt, khăn lạnh', 'Banh-Canh-Thit.jpg', '2013-12-28', 'đĩa', 0),
(2, 10, 2, 'Nước giải khác các loại', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Chèn thập cẩm, chè đâu xanh, trà sữa trân châu,... được chế biến từ chính các đầu bếp của nhà hàng chúng tôi.', 45000, 0, 'nước ngọt, khăn lạnh', 'nuoc_giai_khat_cac_loai.jpg', '2013-12-29', 'đĩa', 0),
(3, 2, 3, 'Súp Gà Ngô non', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Cách làm:\r\n\r\n\r\nĐun nước dùng sôi, cho thịt gà vào, nêm muối tiêu, đun sôi nhỏ lửa 10 phút. Nếu bạn sợ gà quá nhừ thì có thể vớt thịt gà ra.', 25000, 0, 'nước ngọt, khăn lạnh', 'sup_ngo_non.jpg', '2013-12-29', 'đĩa', 0),
(4, 1, 4, 'Salát cà chua dưa chuột', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...Cách làm: dưa chuột cà chua, dứa, gọt vỏ, rửa sạch, thái lát mỏng. Bày xen kẽ các nguyên liệu trên theo hình tròn hoặc hình dẻ quạt.Tỏi, ớt đập dập, băm nhỏ, cho vào tô với một chút dấm đường và một chút muối. Quậy đều hỗn hợp trên, nếm thử thấy có vị chua, ngọt vừa ăn là được. Dội hỗn hợp trên vào đĩa nguyên liệu đã được trình bày.', 25000, 0, 'nước ngọt, khăn lạnh', 'salat_ca_chua_dua_chuot.jpg', '2013-12-29', 'đĩa', 0),
(5, 1, 5, 'Nộm gà xé phay', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Nguyên liệu:\r\n250g thịt ức gà\r\n½ củ hành tây to (hoặc 1 củ nhỏ)\r\n½ củ cà rốt\r\n1 chút lạc rang\r\nRau mùi, húng\r\nNước mắm, chanh, đường', 80000, 0, 'nước ngọt, khăn lạnh', 'nom_ga_xe_phay.jpg', '2013-12-29', 'đĩa', 0),
(6, 2, 6, 'Nem Phù đổng', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Gọi một đĩa nem ốc mà phải đợi đến 15 phút. Nem được gói từ trước, đến khi khách gọi nhà hàng mới mang vào rán. Trong lúc đợi có thể gọi bún ốc, Gọi một đĩa nem ốc mà phải đợi đến 15 phút. Nem được gói từ trước, đến khi khách gọi nhà hàng mới mang vào rán. Trong lúc đợi có thể gọi bún ốc, ', 80000, 0, 'nước ngọt, khăn lạnh', 'nem-oc-phu-dong.jpg', '2013-12-29', 'đĩa', 0),
(7, 1, 7, 'Tôm sú chiên trà', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Tôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên trà', 650000, 0, 'nước ngọt, khăn lạnh', 'tomsu-nuocdua.jpg', '2013-12-29', 'đĩa', 0),
(8, 2, 8, 'Gà quay', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Xu hướng ẩm thực của nhà hàng Anh Em khá đa dạng, tuy nhiên, nổi bật nhất vẫn là những món quay với hương vị mới như gà quay sầu riêng, gà quay bọc xôi...Xu hướng ẩm thực của nhà hàng Anh Em khá đa dạng, tuy nhiên, nổi bật nhất vẫn là những món quay với hương vị mới như gà quay sầu riêng, gà quay bọc xôi...', 25000, 0, 'nước ngọt, khăn lạnh', 'ImageHandler.ashx.jpg', '2013-12-29', 'đĩa', 0),
(9, 1, 10, 'Mực xào thập cẩm', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Mực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩm', 180000, 5, 'nước ngọt, khăn lạnh', 'muc_xao_tham_cap.jpg', '2013-12-29', 'đĩa', 0),
(10, 1, 10, 'Mực xào thập cẩm', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Mực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩm', 180000, 5, 'nước ngọt, khăn lạnh', 'muc_xao_tham_cap.jpg', '2013-12-29', 'đĩa', 0),
(11, 1, 11, 'Cải làn xào tỏi', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Cải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏi', 70000, 0, 'nước ngọt, khăn lạnh', 'cai_lan_xao_toi.jpg', '2013-12-29', 'đĩa', 0),
(12, 3, 12, 'Canh chua ngao', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Canh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngao', 90000, 0, 'nước ngọt, khăn lạnh', 'canh ngao.jpg', '2013-12-29', 'đĩa', 0),
(13, 2, 25, 'Cơm tám', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'com_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpg', 25000, 0, 'nước ngọt, khăn lạnh', 'com_tam.jpg', '2013-12-29', 'đĩa', 0),
(14, 1, 14, 'Xôi Hoàng Phố', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Xôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng Phố', 60000, 0, 'nước ngọt, khăn lạnh', 'xoi_hoang_pho.jpg', '2013-12-29', 'đĩa', 0),
(15, 2, 15, 'Khăn lạnh', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Khăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnh', 2000, 0, 'nước ngọt, khăn lạnh', 'khen_lanh.jpg', '2013-12-29', 'đĩa', 0),
(16, 2, 16, 'Dưa Vàng', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Dưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa Vàng', 60000, 0, 'nước ngọt, khăn lạnh', 'dua_vang.jpg', '2013-12-29', 'đĩa', 0),
(17, 2, 60, 'Nộm gà hoa chuối', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Nộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuối', 80000, 0, 'nước ngọt, khăn lạnh', 'nom_ga_hoa_chuoi.jpg', '2013-12-29', 'đĩa', 0),
(18, 3, 18, 'Tôm sú nướng ngũ vị', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Tôm sú nướng ngũ vịTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị', 650000, 0, 'nước ngọt, khăn lạnh', 'tom_su_nuong_ngu_vi.jpg', '2013-12-29', 'đĩa', 0),
(19, 3, 32, 'Gà nướng Phù Đổng', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Gà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù Đổng', 280000, 0, 'nước ngọt, khăn lạnh', 'ga_nuong_phu_dong.JPG', '2013-12-29', 'đĩa', 0),
(20, 2, 20, 'Bò xốt tiêu đen', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Bò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đen', 150000, 0, 'nước ngọt, khăn lạnh', 'bo_sot_tieu_den.jpg', '2013-12-30', 'đĩa', 0),
(21, 2, 21, 'Cá Điêu hồng chiên xù', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Cá Điêu hồng chiên xù\r\nCá Điêu hồng chiên xù\r\nCá Điêu hồng chiên xùCá Điêu hồng chiên xù\r\nCá Điêu hồng chiên xù\r\nCá Điêu hồng chiên xù', 2400000, 0, 'nước ngọt, khăn lạnh', 'ca_dieu_hong_chien_xu.jpg', '2013-12-30', 'đĩa', 0),
(22, 2, 22, 'Ngô chiên', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Ngô chiênNgô chiênNgô chiênNgô chiênNgô chiên\r\nNgô chiênNgô chiên\r\nNgô chiên', 60000, 0, 'nước ngọt, khăn lạnh', 'ngochien.jpg', '2013-12-30', 'đĩa', 0),
(23, 2, 23, 'Ngọn susu xào tỏi', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Ngọn susu xào tỏi Ngọn susu xào tỏi Ngọn susu xào tỏi\r\nNgọn susu xào tỏi Ngọn susu xào tỏi Ngọn susu xào tỏi', 45000, 0, 'nước ngọt, khăn lạnh', 'susu_xao_toi.jpg', '2013-12-30', 'đĩa', 0),
(24, 2, 24, 'Canh bóng mọc thập cẩm', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Canh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩm\r\nCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩm\r\nCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩm', 60000, 0, 'nước ngọt, khăn lạnh', 'canh_bong_moc_thap_cam.jpg', '2013-12-30', 'đĩa', 0),
(25, 2, 25, 'Cơm tám', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám \r\nCơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám \r\nCơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám ', 30000, 0, 'nước ngọt, khăn lạnh', 'com_tam_ga.jpg', '2013-12-30', 'đĩa', 0),
(26, 2, 26, 'Xôi vò hạt sen', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Xôi vò hạt sen\r\nXôi vò hạt sen\r\nXôi vò hạt sen\r\nXôi vò hạt sen\r\nXôi vò hạt sen\r\nXôi vò hạt sen', 60000, 0, 'nước ngọt, khăn lạnh', 'xoi_vo_hat_sen.jpg', '2013-12-30', 'đĩa', 0),
(27, 2, 58, 'Gỏi mướp đắng ruốc', 'Nguyên liệu\n\nMướp đắng: 2 quả, ruốc thịt heo: 50g, đá bào: 500g, nilon bọc đồ ăn, hoa cà rốt trang trí.', 'Cách chế biến\n\nMướp đắng rửa sạch, để ráo. Bổ đôi quả theo chiều dọc, sau đó xát thành từng lát mỏng 0,8 mm theo chiều ngang quả mướp. Đá cây bào mỏng, cho vào đĩa sâu lòng, bọc nilon mỏng kín mặt đĩa, xếp mướp đắng lên trên, trình bày cho đẹp mắt. Để khoảng 30 phút cho mướp mát lạnh. Nếu đã tan hết thì thay lượt đá khác với cách làm tương tự. Sau đó rắc ruốc thịt heo xé tơi lên trên.', 50000, 0, 'nước ngọt, khăn lạnh', 'goi muop dang ruoc.jpg', '2013-12-30', 'đĩa', 0),
(28, 2, 28, 'Dưa hấu', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Dưa hấu Dưa hấuDưa hấu Dưa hấuDưa hấu Dưa hấuDưa hấu Dưa hấu\r\nDưa hấu Dưa hấuDưa hấu Dưa hấu', 50000, 0, 'nước ngọt, khăn lạnh', 'dua_hau.jpg', '2013-12-30', 'đĩa', 0),
(29, 2, 29, 'Súp ngô cua', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua', 30000, 0, 'nước ngọt, khăn lạnh', 'sup_ngo_cua.jpg', '2013-12-30', 'đĩa', 0),
(30, 2, 30, 'Salad Phù Đổng', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng', 120000, 0, 'nước ngọt, khăn lạnh', 'salat.jpg', '2013-12-30', 'đĩa', 0),
(31, 2, 31, 'Tôm sú rang muối tiêu', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Tôm sú rang muối tiêu\r\nTôm sú rang muối tiêu\r\nTôm sú rang muối tiêu\r\nTôm sú rang muối tiêu\r\nTôm sú rang muối tiêu\r\nTôm sú rang muối tiêu', 650000, 0, 'nước ngọt, khăn lạnh', 'tom_su_rang_muoi.jpg', '2013-12-30', 'đĩa', 1),
(32, 2, 32, 'Gà nướng Phù Đổng', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Gà nướng Phù Đổng\r\nGà nướng Phù Đổng\r\nGà nướng Phù Đổng\r\nGà nướng Phù Đổng\r\nGà nướng Phù Đổng\r\nGà nướng Phù Đổng', 280000, 0, 'nước ngọt, khăn lạnh', 'ga_nuong_pd.jpg', '2013-12-30', 'đĩa', 0),
(33, 2, 33, 'Cua bấy chiên bơ', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Cua bấy chiên bơ\r\nCua bấy chiên bơ\r\nCua bấy chiên bơ\r\nCua bấy chiên bơ\r\nCua bấy chiên bơ\r\nCua bấy chiên bơ', 70000, 0, 'nước ngọt, khăn lạnh', 'cua_bay_chien_bo.jpg', '2013-12-30', 'đĩa', 1),
(34, 2, 34, 'Bò lúc lắc khoai tây', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Bò lúc lắc khoai tây\r\nBò lúc lắc khoai tây\r\nBò lúc lắc khoai tây\r\nBò lúc lắc khoai tây\r\nBò lúc lắc khoai tây\r\nBò lúc lắc khoai tây', 150000, 0, 'nước ngọt, khăn lạnh', 'bo_luc_lac_khoai_tay.jpg', '2013-12-30', 'đĩa', 0),
(35, 2, 35, 'Hoa lơ xanh xào tỏi', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Hoa lơ xanh xào tỏi\r\nHoa lơ xanh xào tỏi\r\nHoa lơ xanh xào tỏi\r\nHoa lơ xanh xào tỏi\r\nHoa lơ xanh xào tỏi\r\nHoa lơ xanh xào tỏi', 70000, 0, 'nước ngọt, khăn lạnh', 'bong_cai_xanh.png', '2013-12-30', 'đĩa', 1),
(36, 2, 36, 'Canh mọc tôm cua', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Canh mọc tôm cua\r\nCanh mọc tôm cuaCanh mọc tôm cua', 32000, 0, 'nước ngọt, khăn lạnh', 'canh_moc_tom_cua.jpg', '2013-12-30', 'đĩa', 0),
(37, 2, 37, 'Cơm chiên Hạnh Phúc', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Cơm chiên Hạnh Phúc\r\nCơm chiên Hạnh Phúc\r\nCơm chiên Hạnh Phúc\r\nCơm chiên Hạnh Phúc\r\nCơm chiên Hạnh Phúc\r\nCơm chiên Hạnh Phúc', 60000, 0, 'nước ngọt, khăn lạnh', 'com_hanh_phuc.jpg', '2013-12-30', 'đĩa', 0),
(38, 2, 38, 'Bánh trưng', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Bánh trưng Bánh trưng\r\nBánh trưng Bánh trưng Bánh trưng\r\nBánh trưng Bánh trưng\r\nBánh trưng Bánh trưng Bánh trưng', 60000, 0, 'nước ngọt, khăn lạnh', 'banh_chung.jpg', '2013-12-30', 'đĩa', 0),
(39, 2, 39, 'Kem Caramen', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Kem Caramen Kem Caramen Kem Caramen\r\nKem Caramen Kem Caramen Kem Caramen\r\nKem Caramen Kem Caramen Kem Caramen\r\nKem Caramen Kem Caramen Kem Caramen', 12000, 0, 'nước ngọt, khăn lạnh', 'kem-caramen.jpg', '2013-12-30', 'đĩa', 0),
(40, 2, 41, 'Súp Hải sản', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Súp Hải sản Súp Hải sản Súp Hải sản\r\nSúp Hải sản Súp Hải sản Súp Hải sản\r\nSúp Hải sản Súp Hải sản Súp Hải sản', 50000, 0, 'nước ngọt, khăn lạnh', 'sup_hai_san.jpg', '2013-12-30', 'đĩa', 0),
(41, 2, 41, 'Súp Hải sản', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Súp Hải sản Súp Hải sản Súp Hải sản\r\nSúp Hải sản Súp Hải sản Súp Hải sản\r\nSúp Hải sản Súp Hải sản Súp Hải sản', 50000, 0, 'nước ngọt, khăn lạnh', 'sup_hai_san.jpg', '2013-12-30', 'đĩa', 0),
(42, 2, 42, 'Salad Cá Ngừ', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Salad Cá Ngừ Salad Cá Ngừ\r\nSalad Cá Ngừ Salad Cá Ngừ\r\nSalad Cá Ngừ Salad Cá Ngừ\r\nSalad Cá Ngừ Salad Cá Ngừ\r\nSalad Cá Ngừ Salad Cá Ngừ\r\nSalad Cá Ngừ Salad Cá Ngừ', 98000, 0, 'nước ngọt, khăn lạnh', 'salad_ca_ngu.jpg', '2013-12-30', 'đĩa', 0),
(43, 2, 43, 'Tôm sú hấp nước dừa', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Tôm sú hấp nước dừa\r\nTôm sú hấp nước dừa\r\nTôm sú hấp nước dừa\r\nTôm sú hấp nước dừa', 650000, 0, 'nước ngọt, khăn lạnh', 'tom_su_hap_nuoc_dua.jpg', '2013-12-30', 'đĩa', 0),
(44, 2, 44, 'Gà hấp lá chanh', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Gà hấp lá chanh\r\nGà hấp lá chanh\r\nGà hấp lá chanh\r\nGà hấp lá chanh\r\nGà hấp lá chanh\r\nGà hấp lá chanh', 320000, 0, 'nước ngọt, khăn lạnh', 'ga_hap_la_canh.jpg', '2013-12-30', 'đĩa', 0),
(45, 2, 45, 'Cá tầm nướng', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Cá tầm nướng Cá tầm nướng\r\nCá tầm nướng Cá tầm nướng\r\nCá tầm nướng Cá tầm nướng\r\nCá tầm nướng Cá tầm nướng\r\nCá tầm nướng Cá tầm nướng\r\nCá tầm nướng Cá tầm nướng', 320000, 0, 'nước ngọt, khăn lạnh', 'ca_tam_nuong.jpg', '2013-12-30', 'đĩa', 0),
(46, 2, 47, 'Bò Úc bít tết', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Bò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết', 220000, 0, 'nước ngọt, khăn lạnh', 'bo_uc_bit_tet.jpg', '2013-12-30', 'đĩa', 0),
(47, 2, 47, 'Bò Úc bít tết', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Bò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết', 220000, 0, 'nước ngọt, khăn lạnh', 'bo_uc_bit_tet.jpg', '2013-12-30', 'đĩa', 0),
(48, 4, 48, 'Rau cải chíp xào thịt hộp', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Rau cải chíp xào thịt hộp Rau cải chíp xào thịt hộp Rau cải chíp xào thịt hộp\r\nRau cải chíp xào thịt hộp Rau cải chíp xào thịt hộp Rau cải chíp xào thịt hộp', 80000, 0, 'nước ngọt, khăn lạnh', 'rau_cai_chip_vao_thit_hop.jpg', '2013-12-30', 'đĩa', 0),
(49, 5, 49, 'Canh gà nấm tươi', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Canh gà nấm tươi Canh gà nấm tươi Canh gà nấm tươi\r\nCanh gà nấm tươi Canh gà nấm tươi Canh gà nấm tươi', 70000, 0, 'nước ngọt, khăn lạnh', 'canh_ga_nam_tuoi.jpg', '2013-12-30', 'đĩa', 0),
(50, 6, 50, 'Cơm rang Hải sản', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Cơm rang Hải sản Cơm rang Hải sản Cơm rang Hải sản\r\nCơm rang Hải sản Cơm rang Hải sản Cơm rang Hải sản', 80000, 0, 'nước ngọt, khăn lạnh', 'com_rang_hai_san.jpg', '2013-12-30', 'đĩa', 0),
(51, 6, 51, 'Xôi lạp sườn', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Xôi lạp sườn Xôi lạp sườn Xôi lạp sườn\r\nXôi lạp sườn Xôi lạp sườn Xôi lạp sườn\r\nXôi lạp sườn Xôi lạp sườn Xôi lạp sườn', 60000, 0, 'nước ngọt, khăn lạnh', 'xoi_lap_suon.jpg', '2013-12-30', 'đĩa', 0),
(52, 6, 52, 'Hoa quả thập cẩm', 'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', 'Hoa quả thập cẩm Hoa quả thập cẩm Hoa quả thập cẩm\r\nHoa quả thập cẩm Hoa quả thập cẩm Hoa quả thập cẩm', 65000, 0, 'nước ngọt, khăn lạnh', 'hoa_qua_thap_cam.jpg', '2013-12-30', 'đĩa', 0),
(53, 4, 53, 'Salat Tôm trái thơm', 'Tôm để làm salad nên chọn tôm tươi, thích nhất vẫn là loại tôm đang bơi lội tung tăng khi ra chợ', 'Nguyên liệu:\r\n\r\n* Nước trộn:\r\n\r\n- 80ml dấm gạo\r\n\r\n- 60ml xì dầu\r\n\r\n- 2 tbs mật ong\r\n\r\n- 1 tsp dầu vừng\r\n\r\n- 1 – 2 tsp gừng băm nhỏ\r\n\r\n- 4, 5 tép tỏi, băm nhỏ', 150000, 0, 'nước uống, khen lạnh', 'salad_tom_thai_thom.jpg', '2013-12-31', 'đĩa', 1),
(54, 4, 54, 'Bào Ngư xào song nấm', 'Dùng nóng với cơm và chấm kèm nước tương. ', 'Nguyên liệu- 1 hộp bầu ngư - 10 tai nấm đông cô - 1 hủ hay 1 hộp măng tây - củ hành,- muối ,tiêu, bột bouillons de volaille ( hoặc bột ngọt ),- 1 muỗng súp dầu mè,- 1 muỗng súp dầu hào.- Dầu ăn- 1 muổng súp bột maïzenna - Chút ngò , hành lá ', 300000, 0, 'nước uống, khen lạnh', 'nam bao ngu xao toi.jpg', '2013-12-31', 'đĩa', 1),
(55, 4, 55, 'Bào Ngư sốt dầu hào nguyên con', 'Đây là một món ăn ngon và bổ dưỡng,chế biến món ăn tốn khá nhiều thời gian cho khâu sơ chế và khâu nấu nướng,dưới đây là cách chế biến món bào ngư sốt dầu hào. ', 'Nguyên liệu:\r\n\r\n    Bào ngư 4 con\r\n    gà mái 1 con\r\n    thịt nạc 300g\r\n    sò điệp khô 3 con\r\n    Hành lá 1 tép\r\n    Nước dùng gà\r\n    jambon Kim Hoa 50g\r\n    dầu hào\r\n    dầu mè\r\n    bột năng\r\n    một miếng phên tre nếu không có thì dùng mấy chiếc xiên bằng tre', 250000, 0, 'nước uống, khen lạnh', 'bao_ngu_sot_dau_hao.jpg', '2013-12-31', 'đĩa', 1),
(56, 4, 56, 'Bào Ngư om cải xanh', 'Nguyên liệu: 500g bào ngư Úc 300g rau cải xanh Nước xương gà, hành khô, gừng, mắm, muối, mì chính. ', 'YÊU CẦU THÀNH PHẨM:\r\n\r\nThơm ngon , nước trong mà vẫn ngọt đặc trưng. Có thể cho thêm nấm hương để tăng thêm độ hấp dẫn. Trang trí thêm hoa cà rốt cho bắt mắt.\r\n\r\nMón này dùng làm món khai vị (thay súp). ', 180000, 0, 'nước uống, khen lạnh', 'bao_ngu_om_cai_xanh.jpg', '2013-12-31', 'đĩa', 1),
(57, 4, 57, 'Bào Ngư sốt nấm', 'Bắc nồi lên bếp, cho mỡ gà vào thắng lấy nước. ', 'Nguyên liệu:\r\n- 500g nấm hương\r\n- 2 chai nước bào ngư\r\n- 100g bông cải xanh\r\n- 300g nước dùng gà\r\n- 50g dầu hàu\r\n- 150g mỡ gà\r\n- 5g muối\r\n- 50g gừng, hành tây', 190000, 0, 'nước uống, khen lạnh', 'bao_ngu_sot_nam.jpg', '2013-12-31', 'đĩa', 1),
(58, 4, 58, 'Gỏi mướp đắng ruốc', 'Mướp đắng ướp đá ruốc không chỉ là món ăn đơn giản, ngon miệng mà còn rất tốt cho sức khỏe. ', 'Nguyên liệu\r\n\r\nMướp đắng: 2 quả, ruốc thịt heo: 50g, đá bào: 500g, nilon bọc đồ ăn, hoa cà rốt trang trí.', 12000, 0, 'nước uống, khen lạnh', 'goi-kho-qua-muop-dang.jpg', '2013-12-31', 'đĩa', 1),
(59, 4, 59, 'Nộm bò rau muống', 'Món này ăn rau muống giòn cực như ăn rau sống ý. Mùa hè ăn thế này thấy mát mát và mát mắt nữa vì đủ màu, xanh, đỏ, nâu, trắng. Thịt bò cũng chua chua ngọt ngọt. ', 'Nguyên liệu:\r\n\r\nRau muống: sơ mới ½ mớ\r\nGiá đỗ: 1 ít thôi\r\nCà rốt: thái mỏng dài bằng giá đỗ.\r\nThịt thăn bò, dứa ½ quả\r\nLạc rang giã dập\r\nMuối, cốt chanh, đường, ớt xay.', 80000, 0, 'nước uống, khen lạnh', 'nom_bo_rau_muong.jpg', '2013-12-31', 'đĩa', 1),
(60, 4, 60, 'Nộm gà hoa chuối', 'Nộm gà hoa chuối làm không quá cầu kỳ nhưng để để món ăn có được nhiều hương vị phong phú, bạn cần chuẩn bị nhiều loại nguyên liệu khác nhau. ', 'Nguyên liệu: Thịt gà (lườn): 150 g, cà rốt bào sợi: một củ, hoa chuối: 300 g, chanh: một quả, đường: 3 thìa canh, giấm: 3 thìa canh, muối: 2 thìa cà phê, mắm: 2 thìa canh, lá chanh: 5 lá, hành tây: một củ, rau răm, tỏi, ớt, lạc, hành, tiêu, rau mùi, thơm, xà lách, cà chua.', 50000, 0, 'nước uống, khen lạnh', 'nom_ga_rau_chuoi.jpg', '2013-12-31', 'đĩa', 1),
(61, 6, 61, 'Xôi gà', 'Nộm gà hoa chuối làm không quá cầu kỳ nhưng để để món ăn có được nhiều hương vị phong phú, bạn cần chuẩn bị nhiều loại nguyên liệu khác nhau. ', 'Nguyên liệu: Thịt gà (lườn): 150 g, cà rốt bào sợi: một củ, hoa chuối: 300 g, chanh: một quả, đường: 3 thìa canh, giấm: 3 thìa canh, muối: 2 thìa cà phê, mắm: 2 thìa canh, lá chanh: 5 lá, hành tây: một củ, rau răm, tỏi, ớt, lạc, hành, tiêu, rau mùi, thơm, xà lách, cà chua.', 25000, 0, 'nước ngọt, khăn lạnh', 'xoi_ga.jpg', '2014-01-03', 'đĩa', 1),
(62, 1, 62, 'ốc bươu kho gừng ', 'Món ốc đậm đà thấm vị, thịt giòn ngọt, thơm và ấm vị gừng. Mùa mưa đang đến, ngồi bên mâm cơm gia đình với món Ốc bươu kho gừng thơm lừng sẽ giúp không khí cả gia đình bạn ấm cúng lắm đó.', 'Để chế biến món ăn này, chúng ta cần các nguyên liệu sau đây:\r\n- Ốc bươu bỏ phần ốc bùn phía dưới, xát thịt ốc với ít muối và ít giấm rửa sạch nhớt, để ráo. Ướp với 1m bột ngọt AJI-NO-MOTO®, 1M nước mắm, 1m giấm gạo lên men LISA, 2M hành tỏi băm, gừng sợi và ớt hiểm.\r\n- Gừng thái chỉ. Ớt hiểm đập dập.\r\nCách chế biến\r\n- Dùng tộ đất cho 1M dầu, 1M đường thắng caramel, thêm 1M dầu điều, cho ốc bươu vào xào săn, kho nhỏ lửa đến khi ốc vừa chín, nước kho cạn sệt.\r\nThưởng thức\r\n- Bày ra đĩa, dùng khi ', 50000, 0, '0', 'oc-buou-kho-gung.jpg', '2014-04-21', 'món', 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_type`
--

CREATE TABLE `food_type` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `food_type`
--

INSERT INTO `food_type` (`id`, `name`, `description`, `image`, `icon`) VALUES
(1, 'Món Canh Bổ Dưỡng', 'Mùi thơm của cá quyện với vị ngọt của hoa thiên lý sẽ mang đến cho cả nhà một tô canh ngọt ngào và bổ dưỡng. Bạn có muốn biết thêm nhiều công thức món canh ngon hấp dẫn khác của người Việt Nam?', 'caloc-bongly.jpg', 'swin-icon-dinner-2'),
(2, 'Bún, mì, miến, phở', 'Bánh canh, Bánh đa cua, Bún bò Huế, Bún bung', 'bun_mi_mien_pho.jpg', 'swin-icon-dinner'),
(3, 'Cơm', 'Cơm bình dân với nhiều món ăn đa dạng, phong phú. Thông thường thực đơn sẽ bao gồm một dĩa cơm và một phần thức ăn theo lựa chọn, một bát canh.', 'com.jpg', 'swin-icon-medal'),
(4, 'Món ăn thường nhật', 'Sử dụng rất đa dạng các loại rau, củ, quả phối trộn với muối theo một tỉ lệ nhất định theo kinh nghiệm của người ẩm thực không quá mặn cũng không quá nhạt.', 'page2-img5.jpg', 'swin-icon-dish'),
(5, 'Xôi', 'Là một món ăn ngon, bổ, phổ thông, và rất được ưa chuộng như một đồ thờ cúng ngày lễ, tết, giỗ chạp, hoặc đi kèm với lợn sữa quay trên mâm đồ lễ ăn hỏi. Sử dụng thịt gấc để tạo màu sắc đỏ tươi tắn và hương vị thơm ngon cho món xôi.', 'xoi_ga10.jpg', 'swin-icon-pasta'),
(6, 'Cháo, súp, canh', 'Gồm một nồi nước dùng đang sôi, các món ăn sống được để xung quanh và người ăn gắp đồ ăn sống bỏ vào nồi nước dùng, đợi chín tới và ăn nóng', 'chao_sup_canh.jpg', 'swin-icon-carrot'),
(7, 'Món cuốn', 'Món ăn ngon, nổi tiếng của người Việt và được chế biến từ thịt, trứng, rau củ quả băm nhỏ trộn đều, gói trong bánh đa nem và rán giòn', 'mon_cuon.jpg', 'swin-icon-menu-1'),
(8, 'Bánh mặn', 'à loại bánh duy nhất có lịch sử lâu đời trong ẩm thực truyền thống Việt Nam còn được sử sách nhắc lại, bánh chưng có vị trí đặc biệt trong tâm thức của cộng đồng người Việt', 'banh_man.jpg', 'swin-icon-noodles'),
(9, 'Xào', 'Một số loại lá được đốt lên lấy tro để ngâm cùng với gạo nếp tạo ra màu nâu vàng như màu hổ phách cũng như hương vị đặc trưng của bánh. Phổ biến nhất vẫn là cách gói bánh thuôn dài. Bánh ăn chấm đường hoặc mật ong,mật mía.', 'xao.jpg', 'swin-icon-meat'),
(10, 'Nước giải khát', 'Các loại nước giải khát', 'nuoc_giai_khat.jpg', 'swin-icon-wine'),
(11, 'Salát', 'Đây là một món ăn được nhiều người Việt Nam thích ăn. Có 2 nguyên liệu tạo nên hương vị đặc trưng cho món sa lát Nga. Đó là Sause Mayonnaise (có thể mua ở các siêu thị) và Jambon (mua ở các cửa hàng bán thực phẩm chín), còn các nguyên liệu khác là rau quả củ rất sẵn ', 'salat.jpg', 'swin-icon-ice-cream'),
(12, 'Bào ngư', 'Đây là một món ăn ngon và bổ dưỡng,chế biến món ăn tốn khá nhiều thời gian cho khâu sơ chế và khâu nấu nướng,dưới đây là cách chế biến món bào ngư sốt dầu hào. ', 'bao_ngu.jpg', 'swin-icon-fish');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `price`, `detail`, `image`) VALUES
(1, 'Thực đơn 1', 1194000, 'Súp Gà Ngô non, Nộm gà xé phay, Tôm sú chiên trà, Mực xào thập cẩm, Cải làn xào tỏi', 'thuc_don_1.jpg'),
(2, 'Thực đơn 2', 1327000, 'Cải làn xào tỏi, Cơm tám, Xôi Hoàng Phố, Dưa Vàng, Nộm gà hoa chuối', 'thuc_don_2.jpg'),
(3, 'Thực đơn 3', 170600, 'Tôm sú nướng ngũ vị, Gà nướng Phù Đổng, Bò xốt tiêu đen, Cá Điêu hồng chiên xù.', 'thuc_don_3.jpg'),
(4, 'Thực đơn 4', 2185000, 'Các món ăn theo thực đơn đã chọn, chế biến ngon, đẹp, đầy đặn, phục vụ nóng<br>\nKhuyến mãi: khăn lạnh, món tráng miệng', 'thuc_don_4.jpg'),
(5, 'Thực đơn 5', 2180000, 'Các món ăn theo thực đơn đã chọn, chế biến ngon, đẹp, đầy đặn, phục vụ nóng<br>\nKhuyến mãi: khăn lạnh, món tráng miệng', 'thuc_don_5.jpg'),
(6, 'Thực đơn 6', 2690000, 'Các món ăn theo thực đơn đã chọn, chế biến ngon, đẹp, đầy đặn, phục vụ nóng<br>\nKhuyến mãi: khăn lạnh, món tráng miệng', 'thuc_don_6.jpg'),
(7, 'Thực đơn 7', 2890000, 'Các món ăn theo thực đơn đã chọn, chế biến ngon, đẹp, đầy đặn, phục vụ nóng<br>\nKhuyến mãi: khăn lạnh, món tráng miệng', 'thuc_don_7.jpg'),
(8, 'Thực đơn 8', 1980000, 'Các món ăn theo thực đơn đã chọn, chế biến ngon, đẹp, đầy đặn, phục vụ nóng<br>\nKhuyến mãi: khăn lạnh, món tráng miệng', 'thuc_don_8.jpg'),
(9, 'Thực đơn 9', 1780000, 'Các món ăn theo thực đơn đã chọn, chế biến ngon, đẹp, đầy đặn, phục vụ nóng<br>\nKhuyến mãi: khăn lạnh, món tráng miệng', 'thuc_don_9.jpg'),
(10, 'Thực đơn 10', 1780000, 'Các món ăn theo thực đơn đã chọn, chế biến ngon, đẹp, đầy đặn, phục vụ nóng<br>\nKhuyến mãi: khăn lạnh, món tráng miệng', 'thuc_don_10.jpg'),
(11, 'Thực đơn 11', 1890000, 'Các món ăn theo thực đơn đã chọn, chế biến ngon, đẹp, đầy đặn, phục vụ nóng<br>\nKhuyến mãi: khăn lạnh, món tráng miệng', 'thuc_don_11.jpg'),
(12, 'Thực đơn 12', 1890000, 'Các món ăn theo thực đơn đã chọn, chế biến ngon, đẹp, đầy đặn, phục vụ nóng<br>\nKhuyến mãi: khăn lạnh, món tráng miệng', 'thuc_don_12.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `menu_detail`
--

CREATE TABLE `menu_detail` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_food` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `menu_detail`
--

INSERT INTO `menu_detail` (`id`, `id_menu`, `id_food`, `quantity`) VALUES
(1, 1, 3, 2),
(2, 1, 7, 1),
(3, 1, 8, 1),
(4, 1, 9, 1),
(5, 1, 17, 1),
(6, 2, 11, 1),
(7, 2, 13, 1),
(8, 2, 14, 1),
(9, 2, 15, 1),
(10, 2, 16, 1),
(11, 2, 17, 1),
(12, 3, 18, 1),
(13, 3, 19, 1),
(14, 3, 20, 1),
(15, 3, 21, 1),
(16, 3, 22, 1),
(17, 3, 30, 1),
(18, 4, 17, 1),
(19, 4, 23, 1),
(20, 4, 24, 1),
(21, 4, 25, 1),
(22, 4, 26, 1),
(23, 4, 27, 1),
(24, 5, 18, 1),
(25, 5, 28, 1),
(26, 5, 29, 1),
(27, 5, 31, 1),
(28, 5, 32, 1),
(29, 5, 33, 1),
(30, 6, 18, 1),
(31, 6, 34, 1),
(32, 6, 35, 1),
(33, 6, 36, 1),
(34, 6, 37, 1),
(35, 6, 38, 1),
(36, 7, 39, 1),
(37, 7, 40, 1),
(38, 7, 41, 1),
(39, 7, 42, 1),
(40, 7, 43, 1),
(41, 7, 44, 2),
(42, 8, 45, 1),
(43, 8, 46, 1),
(44, 8, 47, 1),
(45, 8, 48, 1),
(46, 8, 49, 1),
(47, 8, 50, 1),
(48, 9, 51, 1),
(49, 9, 52, 1),
(50, 9, 53, 1),
(51, 9, 54, 1),
(52, 9, 55, 1),
(53, 9, 56, 1),
(54, 10, 1, 1),
(55, 10, 58, 1),
(56, 10, 59, 1),
(57, 10, 60, 1),
(58, 10, 61, 1),
(59, 10, 62, 1),
(60, 11, 22, 1),
(61, 11, 24, 1),
(62, 11, 26, 1),
(63, 11, 28, 1),
(64, 11, 30, 1),
(65, 11, 32, 1),
(66, 12, 2, 1),
(67, 12, 8, 1),
(68, 12, 16, 1),
(69, 12, 22, 1),
(70, 12, 32, 1),
(71, 12, 48, 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_url`
--

CREATE TABLE `page_url` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `page_url`
--

INSERT INTO `page_url` (`id`, `url`) VALUES
(1, 'banh-canh'),
(2, 'nuoc-giai-khac-cac-loai'),
(3, 'sup-ga-ngo-non'),
(4, 'salat-ca-chua-dua-chuot'),
(5, 'nom-ga-xe-phay'),
(6, 'nem-phu-dong'),
(7, 'tom-su-chien-tra'),
(8, 'ga-quay'),
(9, 'muc-xao-thap-cam'),
(10, 'muc-xao-thap-cam'),
(11, 'cai-lan-xao-toi'),
(12, 'canh-chua-ngao'),
(13, 'com-tam'),
(14, 'xoi-hoang-pho'),
(15, 'khan-lanh'),
(16, 'dua-vang'),
(17, 'nom-ga-hoa-chuoi'),
(18, 'tom-su-nuong-ngu-vi'),
(19, 'ga-nuong-phu-dong'),
(20, 'bo-xot-tieu-den'),
(21, 'ca-dieu-hong-chien-xu'),
(22, 'ngo-chien'),
(23, 'ngon-susu-xao-toi'),
(24, 'canh-bong-moc-thap-cam'),
(25, 'com-tam'),
(26, 'xoi-vo-hat-sen'),
(27, 'goi-muop-dang-ruoc'),
(28, 'dua-hau'),
(29, 'sup-ngo-cua'),
(30, 'salad-phu-dong'),
(31, 'tom-su-rang-muoi-tieu'),
(32, 'ga-nuong-phu-dong'),
(33, 'cua-bay-chien-bo'),
(34, 'bo-luc-lac-khoai-tay'),
(35, 'hoa-lo-xanh-xao-toi'),
(36, 'canh-moc-tom-cua'),
(37, 'com-chien-hanh-phuc'),
(38, 'banh-trung'),
(39, 'kem-caramen'),
(40, 'sup-hai-san'),
(41, 'sup-hai-san'),
(42, 'salad-ca-ngu'),
(43, 'tom-su-hap-nuoc-dua'),
(44, 'ga-hap-la-chanh'),
(45, 'ca-tam-nuong'),
(46, 'bo-uc-bit-tet'),
(47, 'bo-uc-bit-tet'),
(48, 'rau-cai-chip-xao-thit-hop'),
(49, 'canh-ga-nam-tuoi'),
(50, 'com-rang-hai-san'),
(51, 'xoi-lap-suon'),
(52, 'hoa-qua-thap-cam'),
(53, 'salat-tom-trai-thom'),
(54, 'bao-ngu-xao-song-nam'),
(55, 'bao-ngu-sot-dau-hao-nguyen-con'),
(56, 'bao-ngu-om-cai-xanh'),
(57, 'bao-ngu-sot-nam'),
(58, 'goi-muop-dang-ruoc'),
(59, 'nom-bo-rau-muong'),
(60, 'nom-ga-hoa-chuoi'),
(61, 'xoi-ga'),
(62, 'oc-buou-kho-gung');

-- --------------------------------------------------------

--
-- Table structure for table `role_resource`
--

CREATE TABLE `role_resource` (
  `id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_resource`
--

INSERT INTO `role_resource` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'guest'),
(3, 'staff'),
(4, 'CEO');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`) VALUES
(1, 33, 1),
(2, 33, 2),
(3, 34, 3),
(4, 34, 5),
(5, 33, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `birthdate`, `gender`, `address`, `email`, `phone`, `remember_token`, `updated_at`, `created_at`) VALUES
(33, 'thuhong', '$2y$10$d3DIfnUu7gS4nEQT8XhbwO3NVio61M/ic4EB28YNecTVZH9OkwHry', 'Nguyen Thu Hong', '1994-01-01', 'nữ', 'Trần Hưng Đạo', 'thu@yahoo.com', '123456789', NULL, '2018-01-12 20:27:50', '2018-01-12 20:27:50'),
(32, 'hoahong', '$2y$10$R6ZXeWJRsVkaM/cfCR28Weao/FqyCcQVFdkfIk1cXBrFL1UE81YSK', 'Nguyen Thu Hong', '1995-01-01', 'nam', 'Lê Hồng Phong', 'hoa@gmail.com', '123456789', NULL, '2018-01-12 20:27:50', '2018-01-12 20:27:50'),
(34, 'hoang', '$2y$10$R6ZXeWJRsVkaM/cfCR28Weao/FqyCcQVFdkfIk1cXBrFL1UE81YSK', 'Nguyen Thu Hong', '1977-09-08', 'nam', 'Đường 27, Sơn kỳ, Tân Phú', 'hoang@gmail.com', '34567890', NULL, '2018-01-12 20:27:50', '2018-01-12 20:27:50'),
(42, 'huonghuong', '$2y$10$R6ZXeWJRsVkaM/cfCR28Weao/FqyCcQVFdkfIk1cXBrFL1UE81YSK', 'Nguyen Thu Hong', '2017-09-14', 'nữ', 'Lê Thị Riêng', 'huongnguyenak96@gmail.com', '11111111111', NULL, '2018-01-12 20:27:50', '2018-01-12 20:27:50'),
(45, 'huongngoc', '123456', 'Huong Huong Nguyen', '2000-12-15', 'nam', '92 Le Thi Rieng', 'huong011@gmail.com', '12345670987', NULL, '2018-01-19 18:51:20', '2018-01-19 18:51:20'),
(46, 'khoaphamtraining', 'b210ce5d3e1bb2111725deaf427eb26f', 'Khoa Pham Training', NULL, NULL, NULL, 'khoaphamtraining@gmail.com', NULL, NULL, '2018-01-22 18:11:12', '2018-01-22 18:11:12'),
(48, 'huong111', '8b80ace7b2b1b4cfe854b47f18b26980', 'Huong Ngoc', NULL, NULL, NULL, 'huongnguyen08.cv@gmail.com', NULL, NULL, '2018-01-22 18:31:54', '2018-01-22 18:31:54'),
(49, 'huong112', '9170f64bcd999d47ab4865b960ebcb25', 'Ngoc Huong', NULL, NULL, NULL, 'huong1212.cv@gmail.com', NULL, NULL, '2018-01-22 18:32:57', '2018-01-22 18:32:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `3` (`id_food`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_url` (`id_url`);

--
-- Indexes for table `food_type`
--
ALTER TABLE `food_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_detail`
--
ALTER TABLE `menu_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_food` (`id_food`);

--
-- Indexes for table `page_url`
--
ALTER TABLE `page_url`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_resource`
--
ALTER TABLE `role_resource`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `address` (`address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `food_type`
--
ALTER TABLE `food_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `menu_detail`
--
ALTER TABLE `menu_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `page_url`
--
ALTER TABLE `page_url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `role_resource`
--
ALTER TABLE `role_resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `1` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`);

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `food_type` (`id`),
  ADD CONSTRAINT `foods_ibfk_2` FOREIGN KEY (`id_url`) REFERENCES `page_url` (`id`);

--
-- Constraints for table `menu_detail`
--
ALTER TABLE `menu_detail`
  ADD CONSTRAINT `menu_detail_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `menu_detail_ibfk_2` FOREIGN KEY (`id_food`) REFERENCES `foods` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
