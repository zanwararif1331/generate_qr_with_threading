-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2021 at 05:31 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `gedung`
--

CREATE TABLE `gedung` (
  `gedung_id` int(11) NOT NULL,
  `nama_gedung` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gedung`
--

INSERT INTO `gedung` (`gedung_id`, `nama_gedung`, `alamat`) VALUES
(12, 'GEDUNG A', 'Tulang Bawang Lampung');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(3, 'Operator', 'Operator');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(5, 'STAFF'),
(6, 'MANAJER'),
(7, 'HRD'),
(8, 'OFFICE BOY');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `id_karyawan` varchar(20) NOT NULL,
  `nama_karyawan` varchar(30) NOT NULL,
  `jabatan` int(11) NOT NULL,
  `id_shift` int(20) NOT NULL,
  `gedung_id` int(11) NOT NULL,
  `Hadir` int(5) NOT NULL,
  `Sakit` int(5) NOT NULL,
  `Izin` int(5) NOT NULL,
  `Alpha` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `id_karyawan`, `nama_karyawan`, `jabatan`, `id_shift`, `gedung_id`, `Hadir`, `Sakit`, `Izin`, `Alpha`) VALUES
(129, 'S2008001', 'Karyawan 1', 5, 5, 12, 1, 0, 0, 0),
(130, 'M2008129', 'Karyawan 2', 6, 6, 12, 0, 0, 0, 0),
(131, 'S2008130', 'Karyawan 3', 5, 5, 12, 0, 0, 1, 0),
(132, 'M2008131', 'Irfan', 6, 5, 12, 5, 0, 0, 0),
(133, 'S2008132', 'Luthfi', 5, 5, 12, 0, 0, 0, 0),
(134, 'M2009133', 'Yasman', 6, 6, 12, 1, 0, 0, 0),
(135, 'H2009134', 'Shinta', 7, 6, 12, 2, 0, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id_khd` int(11) NOT NULL,
  `nama_khd` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`id_khd`, `nama_khd`) VALUES
(1, 'Hadir'),
(2, 'Sakit'),
(3, 'Ijin'),
(4, 'Alpha'),
(5, 'Lepas/Off');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(1, '::1', 'admin@gmial.com', 1611763142);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `protected` tinyint(4) DEFAULT NULL,
  `is_active` int(1) NOT NULL,
  `is_parent` int(1) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`, `icon`, `protected`, `is_active`, `is_parent`, `sort`) VALUES
(15, 'menu management', 'menu management', 'fa fa-list-alt', NULL, 0, 42, 14),
(16, 'master data', 'master data', 'fa fa-folder', NULL, 0, 0, 1),
(18, 'Data Karyawan', 'Data Anggota', 'fa fa-user', NULL, 1, 16, 2),
(19, 'data Jabatan', 'jabatan', 'fa fa-briefcase', NULL, 1, 16, 3),
(21, 'Data Shift', 'shift', 'fa fa-retweet', NULL, 1, 16, 4),
(22, 'data Lokasi', 'lokasi', 'fa fa-location-arrow', NULL, 1, 16, 5),
(31, 'Ambil QR Code', 'GenBar', 'fa fa-qrcode', NULL, 1, 0, 6),
(33, 'Scan QRCODE', 'scan', 'fa fa-search-plus', NULL, 1, 0, 7),
(35, 'User management', 'users', 'fa fa-users', NULL, 1, 42, 13),
(36, 'Histori Absensi', 'presensi', 'fa fa-paperclip', NULL, 1, 41, 9),
(39, 'Rekap Absensi', 'rekap', 'fa fa-list-alt', NULL, 1, 41, 10),
(41, 'Data Absensi', 'dataabs', 'far fa-folder-open', NULL, 1, 0, 8),
(42, 'setting', 'setting', 'fas fa-cogs', NULL, 1, 0, 11);

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `id_absen` int(11) NOT NULL,
  `id_karyawan` varchar(20) NOT NULL,
  `tgl` date NOT NULL,
  `jam_msk` time NOT NULL,
  `jam_klr` time NOT NULL,
  `id_khd` int(11) DEFAULT NULL,
  `ket` varchar(150) NOT NULL,
  `id_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`id_absen`, `id_karyawan`, `tgl`, `jam_msk`, `jam_klr`, `id_khd`, `ket`, `id_status`) VALUES
(64, 'S2008001', '2020-08-02', '12:52:43', '12:52:46', 1, '', 2),
(65, 'M2008131', '2020-08-08', '01:00:46', '01:03:41', 1, '', 2),
(67, 'M2008131', '2020-08-11', '01:43:33', '01:44:31', 1, '', 2),
(68, 'M2008131', '2020-08-19', '04:48:38', '04:48:54', 1, '', 2),
(69, 'M2009133', '2020-09-01', '08:20:08', '08:20:14', 1, '', 2),
(70, 'M2008131', '2020-09-01', '08:38:04', '08:38:11', 1, '', 2),
(71, 'H2009134', '2020-09-02', '11:52:51', '11:56:08', 1, '', 2),
(72, 'M2008131', '2020-09-06', '07:23:16', '07:23:47', 1, '', 2),
(73, 'H2009134', '2020-09-08', '02:15:25', '04:00:00', 4, '', 2),
(77, 'H2009134', '2021-01-19', '00:00:00', '00:00:00', 4, '', 3),
(78, 'H2009134', '2021-01-19', '00:00:00', '00:00:00', 4, '', 3),
(79, 'H2009134', '2021-01-19', '00:00:00', '00:00:00', 1, '', 2),
(80, 'S2008130', '2021-01-19', '00:00:00', '00:00:00', 3, '', 3),
(81, 'H2009134', '2021-01-19', '00:00:00', '00:00:00', 3, '', 3);

--
-- Triggers `presensi`
--
DELIMITER $$
CREATE TRIGGER `rekap` AFTER INSERT ON `presensi` FOR EACH ROW BEGIN
	UPDATE karyawan SET 
    Hadir = (SELECT COUNT(*) FROM `presensi` where id_karyawan = new.id_karyawan AND id_khd = 1), 
    Sakit = (SELECT COUNT(*) FROM `presensi` where id_karyawan = new.id_karyawan AND id_khd = 2), 
    Izin = (SELECT COUNT(*) FROM `presensi` where id_karyawan = new.id_karyawan AND id_khd = 3),
    Alpha = (SELECT COUNT(*) FROM `presensi` where id_karyawan = new.id_karyawan AND id_khd = 4) 
    WHERE id_karyawan = new.id_karyawan;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id_shift` int(11) NOT NULL,
  `nama_shift` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id_shift`, `nama_shift`) VALUES
(5, 'SIANG'),
(6, 'PAGI');

-- --------------------------------------------------------

--
-- Table structure for table `stts`
--

CREATE TABLE `stts` (
  `id_status` int(11) NOT NULL,
  `nama_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stts`
--

INSERT INTO `stts` (`id_status`, `nama_status`) VALUES
(1, 'Masuk'),
(2, 'Pulang'),
(3, 'tidak hadir');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(26, '::1', 'admin', '$2y$12$MPcQlOck9fzd/5UjJ6iIXuhZivhkXdfoVD2xFXpZTnZ2IWQw/nFhW', 'admin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1556798313, 1611763397, 1, 'admin', 'nistator', NULL, '123412341234'),
(46, '::1', 'operator', '$2y$10$ibxBt.RYG7jib0JxBxB1.usc9pzjqUqPPTvwLgPp1gMRKg6VMLLei', 'operator@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1562178403, 1598965918, 0, 'operator', '2', NULL, '34890234809238490'),
(47, '::1', 'staff', '$2y$12$RHPXgho6UJLQWv8W3F9oJekbSnFYXyhNADZvuqaYmGEoUD6Yl1Hd.', 'staff@staff.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1564294648, 1597298824, 1, 'staf', 'staff', NULL, '239423849234890'),
(48, '::1', 'irfan', '$2y$12$KQpBfvo6vekU3uk4aQovj.IBqGB5Yss8ybqrmdkpuFQJpSMGa0PEm', 'irfan151073@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1596791644, 1596866300, 1, 'Irfan', 'NoorFadillah Yasri', 'Nama Perusahaan', '089788961961'),
(49, '::1', 'operator1@gmail.com', '$2y$10$mUgigwVb3hdEJ05G6JrUwOnoGgrROMBaFh4h4Wvw7eUI7c18.53dK', 'operator1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1598967062, 1611764919, 1, 'operator', '1', 'Nama Perusahaan', '085709507134'),
(50, '::1', 'yasman@gmail.com', '$2y$10$yCpe08W/Yr6xpfrvlBRTdeV7BcysFBTCC8G8GxveXjldUp10l313W', 'yasman@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1599017763, 1599017785, 1, 'Muhammad', 'Yasman', 'Nama Perusahaan', '089801616581');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(29, 26, 1),
(49, 46, 3),
(50, 47, 1),
(51, 48, 3),
(52, 49, 3),
(53, 50, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gedung`
--
ALTER TABLE `gedung`
  ADD PRIMARY KEY (`gedung_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id_karyawan`),
  ADD KEY `fk_jabatan` (`jabatan`),
  ADD KEY `fk_shift` (`id_shift`),
  ADD KEY `fk_gedung` (`gedung_id`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id_khd`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `fl_karyawan` (`id_karyawan`),
  ADD KEY `fk_kehadiran` (`id_khd`),
  ADD KEY `fk_status` (`id_status`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id_shift`);

--
-- Indexes for table `stts`
--
ALTER TABLE `stts`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gedung`
--
ALTER TABLE `gedung`
  MODIFY `gedung_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id_khd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id_shift` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stts`
--
ALTER TABLE `stts`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `fk_gedung` FOREIGN KEY (`gedung_id`) REFERENCES `gedung` (`gedung_id`),
  ADD CONSTRAINT `fk_jabatan` FOREIGN KEY (`jabatan`) REFERENCES `jabatan` (`id_jabatan`),
  ADD CONSTRAINT `fk_shift` FOREIGN KEY (`id_shift`) REFERENCES `shift` (`id_shift`);

--
-- Constraints for table `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `fk_kehadiran` FOREIGN KEY (`id_khd`) REFERENCES `kehadiran` (`id_khd`),
  ADD CONSTRAINT `fk_status` FOREIGN KEY (`id_status`) REFERENCES `stts` (`id_status`),
  ADD CONSTRAINT `fl_karyawan` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`);

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
