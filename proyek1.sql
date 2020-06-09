-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2020 at 06:52 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyek1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user_id`, `nama_admin`, `jenis_kelamin`, `alamat`, `tanggal_lahir`, `foto`, `created_at`, `updated_at`) VALUES
(1, 13, 'Edwin Damanik', 'L', 'Parluasan, Pematan Siantar', '2000-10-10', 'singgolom.jpeg', '2020-05-03 03:52:28', '2020-05-03 03:52:28'),
(4, 19, 'Jerry Andrianto Pangaribu', 'L', 'Simpang Kalvin', '2000-05-22', 'Jerry Andrianto Pangaribuan_DIV Teknologi Rekayasa Perangkat Lunak_Fakultas Informatika dan Teknik Elektro_11419046.JPG', '2020-05-13 09:45:23', '2020-05-15 06:03:44');

-- --------------------------------------------------------

--
-- Table structure for table `balasan`
--

CREATE TABLE `balasan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isi_balasan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pesan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `balasan`
--

INSERT INTO `balasan` (`id`, `isi_balasan`, `pesan_id`, `created_at`, `updated_at`) VALUES
(1, 'Festival dimulai tanggal 21 oktober 2020.', 1, '2020-05-05 08:21:57', '2020-05-05 08:21:57'),
(2, 'Terimakasih Ricky Alfrido Pangaribuan', 2, '2020-05-06 07:01:17', '2020-05-06 07:01:17'),
(3, 'Dana desa telah dialokasikan untuk masyarakat yang kurang mampu, agar mereka dapat bertahan hidup ditengah pandemi covid 19 ini', 3, '2020-05-06 12:08:35', '2020-05-06 12:08:35'),
(4, 'Apabila anda tidak percaya, anda dapat melihat langsung pembagian sembako kepada masyarakat yang kurang mampu', 3, '2020-05-06 12:10:24', '2020-05-06 12:10:24'),
(5, 'pukul 19:00 WIB.', 9, '2020-05-13 07:56:01', '2020-05-13 07:56:01');

-- --------------------------------------------------------

--
-- Table structure for table `balasan_komentar`
--

CREATE TABLE `balasan_komentar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isi_balasan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengunjung_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `balasan_komentar`
--

INSERT INTO `balasan_komentar` (`id`, `isi_balasan`, `pengunjung_id`, `created_at`, `updated_at`) VALUES
(4, 'Benar, memang lintong nihuta patut jadi destinasi wisata bagi wisatawan lokal maupun mancanegara', 2, '2020-05-06 11:52:43', '2020-05-06 11:52:43'),
(5, 'Terimakasih timothy', 1, '2020-05-06 12:04:02', '2020-05-06 12:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `biodata_warga`
--

CREATE TABLE `biodata_warga` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warga_id` int(11) NOT NULL,
  `agama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `biodata_warga`
--

INSERT INTO `biodata_warga` (`id`, `warga_id`, `agama`, `jenis_kelamin`, `tanggal_lahir`, `foto`, `created_at`, `updated_at`) VALUES
(5, 2, 'Protestan', 'L', '1996-06-09', 'AirBrush_20190403110629.jpg', '2020-05-06 11:57:36', '2020-05-06 11:57:36'),
(6, 3, 'Protestan', 'P', '1995-04-02', 'IMG_20190629_213105.jpg', '2020-05-07 01:49:12', '2020-05-07 01:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `informasi`
--

CREATE TABLE `informasi` (
  `id_informasi` bigint(20) UNSIGNED NOT NULL,
  `judul_info` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar_info` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `informasi`
--

INSERT INTO `informasi` (`id_informasi`, `judul_info`, `kategori`, `isi_info`, `gambar_info`, `created_at`, `updated_at`) VALUES
(1, 'Bukit Singgolom', 'wisata', 'Bukit ini merupakan bukit yang sangat indah di desa lintong nihuta, bukit ini dulunya bernama muara puccu', 'danau.jpeg', '2020-04-30 14:32:23', '2020-05-14 10:37:12'),
(2, 'Pantai Pakkodian', 'wisata', 'Pantai ini merupakan pantai yang sangat indah di Indonesia', 'pantai.jpg', '2020-04-30 14:32:38', NULL),
(3, 'Desa Siambat Dalan', 'wisata', 'Desa ini merupakan desa yang memiliki rumah adat yang cukup banyak', 'siambatDalan.jpg', '2020-04-30 13:55:25', NULL),
(10, 'Panatapan Almonsari Resort', 'penginapan', 'Penginapan Panatapan Almonsari Resort menawarkan beberapa layanan seperti wi-Fi gratis diseluruh areanya dan terdapat pemandangan danau di banua hulu. Setiap kamar memiliki TV satelit layar datar dan kamar mandi pribadi serta terdapat lemari pakaian. Di penginapan ini juga kita dapat menikmati pemandangan gunung yang begitu indah.', 'almonsari.jpg', '2020-05-12 00:26:38', '2020-05-12 08:50:54'),
(11, 'Tiara Bunga Hotel', 'penginapan', 'Tiara Bunga Hotel ini terletak di Balige, Kab. Toba tepatnya di jalan. Tuktuk Tara Bunga, hotel ini memiliki restoran, kolam renang, dan juga taman. Hotel ini memiliki area pantai pribadi dan teras. Hotel ini menawarkan beberapa layanan seperti resepsionis 24 jam, antar-jemput bandara, kamar, serta wi-Fi gratis. Kamar di hotel ini dilengkapi dengan AC, TV layar datar dengan saluran kabel, teko, shower, perlengkapan mandi gratis serta meja. Hotel ini juga menawarkan pemandangan Danau Toba yang begitu indah. Selain itu pada setiap kamar terdapat area tempat duduk. Hotel ini menyediakan sarapan prasmanan setiap paginya untuk para pelanggan. Serta di hotel ini juga terdapat taman bermain anak-anak.', 'tiara_bunga.jpg', '2020-05-12 00:29:16', '2020-05-12 08:36:17'),
(12, 'Marhite', 'berita', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\nWhere does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', '11419046_Jerry Andrianto Pangaribuan.jpg', '2020-06-03 09:41:08', '2020-06-03 09:42:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_04_30_133107_create_informasi_table', 1),
(4, '2020_05_01_190848_create_warga_table', 2),
(5, '2020_05_02_040726_create_pengunjung_table', 3),
(7, '2020_05_03_092841_create_admin_table', 4),
(8, '2020_05_03_170343_create_biodata_warga_table', 5),
(9, '2020_05_05_143648_create_balasan_table', 6),
(10, '2020_05_06_144526_create_balasan_komentar_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `pengunjung`
--

CREATE TABLE `pengunjung` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `komentar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengunjung`
--

INSERT INTO `pengunjung` (`id`, `nama`, `alamat`, `komentar`, `created_at`, `updated_at`) VALUES
(1, 'Timothy', 'Pematang Siantar', 'Website ini sangat bagus, karena memperkenalkan desa pariwisata', '2020-05-01 22:11:08', '2020-05-01 22:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id` int(11) NOT NULL,
  `isi_pesan` text NOT NULL,
  `warga_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id`, `isi_pesan`, `warga_id`, `created_at`, `updated_at`) VALUES
(8, 'Dimana Lokasi diadakannya festival kaldera?', 4, '2020-05-13 07:51:01', '2020-05-13 14:51:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `status`, `name`, `username`, `username_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(13, 'admin', 'Edwin Damanik', 'edwin2200', NULL, '$2y$10$df3uIUIBqQjTFqZ2vDWb2On1jlxUxPsre7y1zEESekWi4gRid/7vy', 'ydlMPlpeUG33Kkt7rRGGHBNG8Lrg4AvNl9DgFI6u3UmQDuVMpwc1l6QiKCAq', '2020-05-03 03:52:28', '2020-05-03 03:52:28'),
(15, 'warga', 'Irin Chandra Pangaribuan', 'irin0906', NULL, '$2y$10$nZMti5glRJoeFOE/9Rz6gOPjp4Rgwk9v0CRTjD7KvJf0fJBJk0RiK', 'OnPeWzsfff2iXP4WteirC4yLYBUaDmILyYt9nUmlLbXRbl6Rx8gDUxkFBKfw', '2020-05-13 07:34:02', '2020-05-13 07:34:02'),
(19, 'admin', 'Jerry Andrianto Pangaribu', 'jerry2204', NULL, '$2y$10$fleCw0uR8Nw1wUSqLMDDvOYX5UMEgDj23dLkTlfx.Xw9OMNQdEfSC', 'G2FkxAXnmHeZyEkz1WllU2TXHiRkcFLWhb2E0LTZvxBk5081zRVeJForcIWC', '2020-05-13 09:45:23', '2020-05-15 06:03:44');

-- --------------------------------------------------------

--
-- Table structure for table `warga`
--

CREATE TABLE `warga` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_warga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NIK` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warga`
--

INSERT INTO `warga` (`id`, `user_id`, `nama_warga`, `NIK`, `alamat`, `created_at`, `updated_at`) VALUES
(4, 15, 'Irin Chandra Pangaribuan', '1208230906960002', 'Simpang Siambat Dalan', '2020-05-13 07:34:03', '2020-05-13 07:34:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balasan`
--
ALTER TABLE `balasan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balasan_komentar`
--
ALTER TABLE `balasan_komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `biodata_warga`
--
ALTER TABLE `biodata_warga`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warga_id` (`warga_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `informasi`
--
ALTER TABLE `informasi`
  ADD PRIMARY KEY (`id_informasi`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`username`);

--
-- Indexes for table `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `balasan`
--
ALTER TABLE `balasan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `balasan_komentar`
--
ALTER TABLE `balasan_komentar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `biodata_warga`
--
ALTER TABLE `biodata_warga`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `informasi`
--
ALTER TABLE `informasi`
  MODIFY `id_informasi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pengunjung`
--
ALTER TABLE `pengunjung`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `warga`
--
ALTER TABLE `warga`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
