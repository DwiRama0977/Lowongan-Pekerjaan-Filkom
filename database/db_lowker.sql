-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2024 at 03:25 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_lowker`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_nama` varchar(51) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_nama`) VALUES
(41, 'admin');

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `check_role_admin` BEFORE INSERT ON `admin` FOR EACH ROW BEGIN
		IF (SELECT login_role FROM login WHERE login_id = NEW.admin_id) != 'Admin' THEN 
			SIGNAL SQLSTATE '45000';
		END IF;
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `calon_pekerja`
--

CREATE TABLE `calon_pekerja` (
  `calon_pekerja_id` int(11) NOT NULL,
  `calon_pekerja_nama_lengkap` varchar(51) NOT NULL,
  `calon_pekerja_alamat` varchar(101) DEFAULT NULL,
  `kota_id` int(11) DEFAULT NULL,
  `calon_pekerja_jenis_kelamin` enum('L','P') DEFAULT NULL,
  `calon_pekerja_tempat_lahir` varchar(51) DEFAULT NULL,
  `calon_pekerja_tanggal_lahir` date DEFAULT NULL,
  `calon_pekerja_status_pernikahan` enum('Lajang','Menikah','Janda/Duda') DEFAULT NULL,
  `calon_pekerja_email` varchar(51) NOT NULL,
  `calon_pekerja_telepon` varchar(13) DEFAULT NULL,
  `calon_pekerja_pendidikan_terakhir` enum('SD','SMP','SMA','S1','S2') DEFAULT NULL,
  `calon_pekerja_tempat_pendidikan_terakhir` varchar(51) DEFAULT NULL,
  `calon_pekerja_tempat_bekerja_terakhir` varchar(51) DEFAULT NULL,
  `calon_pekerja_pekerjaan_bekerja_terakhir` varchar(51) DEFAULT NULL,
  `calon_pekerja_file_cv` varchar(101) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `calon_pekerja`
--

INSERT INTO `calon_pekerja` (`calon_pekerja_id`, `calon_pekerja_nama_lengkap`, `calon_pekerja_alamat`, `kota_id`, `calon_pekerja_jenis_kelamin`, `calon_pekerja_tempat_lahir`, `calon_pekerja_tanggal_lahir`, `calon_pekerja_status_pernikahan`, `calon_pekerja_email`, `calon_pekerja_telepon`, `calon_pekerja_pendidikan_terakhir`, `calon_pekerja_tempat_pendidikan_terakhir`, `calon_pekerja_tempat_bekerja_terakhir`, `calon_pekerja_pekerjaan_bekerja_terakhir`, `calon_pekerja_file_cv`) VALUES
(30, 'Ryan Nabris Oktvian', '', 16, 'L', '', '0000-00-00', 'Lajang', 'ryan@gmail.com', '', 'SMA', '', '', '', ''),
(33, 'Dwi Rama Prasetiya', '', 15, 'L', '', '0000-00-00', 'Lajang', 'dwirama0977@student.ub.ac.id', '9080909', 'SMA', '', '', '', ''),
(36, 'Roy Sagita Putra', '', 17, 'L', '', '0000-00-00', 'Lajang', 'roy@gmail.com', '', 'SMA', '', '', '', ''),
(37, 'Syahreza Fisti Ferdian', '', 14, 'L', '', '0000-00-00', 'Lajang', 'reza@gmail.com', '', 'SMA', '', '', '', ''),
(38, 'Fiego Triwanda Putra', '', 8, 'L', '', '0000-00-00', 'Lajang', 'fiego@gmail.com', '', 'SD', '', '', '', ''),
(39, 'Rivaro Farrelino', '', 11, 'L', '', '0000-00-00', 'Lajang', 'rivaro@gmail.com', '', 'SMA', '', '', '', '');

--
-- Triggers `calon_pekerja`
--
DELIMITER $$
CREATE TRIGGER `check_role_calon_pekerja` BEFORE INSERT ON `calon_pekerja` FOR EACH ROW BEGIN
		IF (SELECT login_role FROM login WHERE login_id = NEW.calon_pekerja_id) != 'Calon Pekerja' THEN 
			SIGNAL SQLSTATE '45000';
		END IF;
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`) VALUES
(3, 'AI Specialist'),
(2, 'Cloud Computing'),
(8, 'Data Science'),
(12, 'Database Admin'),
(7, 'IT Support'),
(11, 'Mobile Developer'),
(1, 'Networking Specialist'),
(13, 'Product Manager'),
(10, 'Programmer'),
(4, 'Security Analyst'),
(6, 'Security System'),
(5, 'UI/UX Designer'),
(9, 'Web Developer');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `kota_id` int(11) NOT NULL,
  `kota_nama` varchar(51) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`kota_id`, `kota_nama`) VALUES
(1, 'Aceh'),
(32, 'Ambon'),
(13, 'Bandung'),
(22, 'Banjarmasin'),
(12, 'Banten'),
(31, 'Banyuwangi'),
(26, 'Bekasi'),
(28, 'Bogor'),
(9, 'Bojonegoro'),
(17, 'Denpasar'),
(11, 'DKI Jakarta'),
(6, 'Jambi'),
(34, 'Jayapura'),
(33, 'Jojakarta'),
(5, 'Kediri'),
(30, 'Kendari'),
(19, 'Kupang'),
(10, 'Lampung'),
(18, 'Madura'),
(29, 'Makasar'),
(15, 'Malang'),
(25, 'Manado'),
(21, 'NTT'),
(8, 'Palembang'),
(27, 'Palu'),
(7, 'Pekalongan'),
(20, 'Pontianak'),
(4, 'Riau'),
(23, 'Samarinda'),
(14, 'Semarang'),
(3, 'Sumatra Barat'),
(2, 'Sumatra Utara'),
(16, 'Surabaya'),
(24, 'Tanjung Kelor');

-- --------------------------------------------------------

--
-- Table structure for table `lamaran`
--

CREATE TABLE `lamaran` (
  `lamaran_id` int(11) NOT NULL,
  `lowongan_id` int(11) NOT NULL,
  `calon_pekerja_id` int(11) NOT NULL,
  `lamaran_status_lolos` enum('Menunggu','Lolos','Tidak Lolos') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lamaran`
--

INSERT INTO `lamaran` (`lamaran_id`, `lowongan_id`, `calon_pekerja_id`, `lamaran_status_lolos`) VALUES
(22, 19, 38, 'Menunggu'),
(23, 20, 38, 'Menunggu'),
(24, 25, 39, 'Menunggu'),
(26, 22, 39, 'Menunggu'),
(27, 23, 33, 'Menunggu'),
(28, 32, 33, 'Lolos');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `login_username` varchar(26) NOT NULL,
  `login_password` varchar(101) NOT NULL,
  `login_role` enum('Admin','Perusahaan','Calon Pekerja') NOT NULL DEFAULT 'Calon Pekerja'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `login_username`, `login_password`, `login_role`) VALUES
(30, 'ryan', '202cb962ac59075b964b07152d234b70', 'Calon Pekerja'),
(31, 'telkom', '202cb962ac59075b964b07152d234b70', 'Perusahaan'),
(32, 'kemendikbud', '202cb962ac59075b964b07152d234b70', 'Perusahaan'),
(33, 'dwi', '202cb962ac59075b964b07152d234b70', 'Calon Pekerja'),
(34, 'shopee', '202cb962ac59075b964b07152d234b70', 'Perusahaan'),
(36, 'roy', '202cb962ac59075b964b07152d234b70', 'Calon Pekerja'),
(37, 'reza', '202cb962ac59075b964b07152d234b70', 'Calon Pekerja'),
(38, 'fiego', '202cb962ac59075b964b07152d234b70', 'Calon Pekerja'),
(39, 'rivaro', '202cb962ac59075b964b07152d234b70', 'Calon Pekerja'),
(40, 'filkom', '202cb962ac59075b964b07152d234b70', 'Perusahaan'),
(41, 'admin', '202cb962ac59075b964b07152d234b70', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `lowongan`
--

CREATE TABLE `lowongan` (
  `lowongan_id` int(11) NOT NULL,
  `perusahaan_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `lowongan_judul` varchar(51) NOT NULL,
  `lowongan_deskripsi` text NOT NULL,
  `lowongan_tgl_buka` date NOT NULL,
  `lowongan_tgl_tutup` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lowongan`
--

INSERT INTO `lowongan` (`lowongan_id`, `perusahaan_id`, `kategori_id`, `lowongan_judul`, `lowongan_deskripsi`, `lowongan_tgl_buka`, `lowongan_tgl_tutup`) VALUES
(19, 31, 10, 'Programmmer', 'Join Sluur', '2023-09-22', '2024-09-26'),
(20, 31, 9, 'Web Developer', '', '2023-09-22', '2024-09-26'),
(21, 32, 11, 'Mobile Developer', '', '2023-09-22', '2024-09-24'),
(22, 32, 11, 'Mobile Developer', '', '2023-09-22', '2024-09-24'),
(23, 34, 13, 'Product Manager', '', '2023-09-22', '2024-09-25'),
(24, 34, 5, 'UI/UX Designer', '', '2023-09-22', '2024-09-30'),
(25, 34, 4, 'Security Analyst', '', '2023-09-22', '2024-09-25'),
(26, 34, 12, 'Database Admin', '', '2023-09-22', '2024-09-22'),
(27, 34, 2, 'Cloud Computing', '', '2023-09-22', '2024-09-22'),
(28, 34, 6, 'Security System', '', '2023-09-22', '2024-09-22'),
(29, 34, 8, 'Data Science', '', '2023-09-22', '2024-09-22'),
(30, 34, 1, 'Networking Specialist', '', '2023-09-22', '2024-09-22'),
(31, 34, 3, 'AI Specialist', '', '2023-09-22', '2024-09-22'),
(32, 40, 11, 'Mobile Developer', '', '2024-01-22', '2024-09-30');

-- --------------------------------------------------------

--
-- Table structure for table `lowongan_jobdesc`
--

CREATE TABLE `lowongan_jobdesc` (
  `lowongan_jobdesc_id` int(11) NOT NULL,
  `lowongan_id` int(11) NOT NULL,
  `lowongan_jobdesc_isi` varchar(101) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lowongan_jobdesc`
--

INSERT INTO `lowongan_jobdesc` (`lowongan_jobdesc_id`, `lowongan_id`, `lowongan_jobdesc_isi`) VALUES
(19, 19, ''),
(20, 20, ''),
(21, 21, ''),
(22, 22, ''),
(23, 23, ''),
(24, 24, ''),
(25, 25, ''),
(26, 26, ''),
(27, 27, ''),
(28, 28, ''),
(29, 29, ''),
(30, 30, ''),
(32, 32, 'Pendidikan');

-- --------------------------------------------------------

--
-- Table structure for table `lowongan_syarat`
--

CREATE TABLE `lowongan_syarat` (
  `lowongan_syarat_id` int(11) NOT NULL,
  `lowongan_id` int(11) NOT NULL,
  `lowongan_syarat` varchar(101) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lowongan_syarat`
--

INSERT INTO `lowongan_syarat` (`lowongan_syarat_id`, `lowongan_id`, `lowongan_syarat`) VALUES
(10, 19, 'SMA sederajat'),
(11, 20, ''),
(12, 21, 'S1 Pendidikan'),
(13, 22, 'S2 Pendidikan'),
(14, 23, ''),
(15, 24, ''),
(16, 25, ''),
(17, 26, ''),
(18, 27, ''),
(19, 28, ''),
(20, 29, ''),
(21, 30, ''),
(23, 32, 'S1 Ilmu Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `perusahaan_id` int(11) NOT NULL,
  `perusahaan_nama` varchar(51) NOT NULL,
  `perusahaan_alamat` varchar(101) DEFAULT NULL,
  `kota_id` int(11) DEFAULT NULL,
  `perusahaan_email` varchar(51) NOT NULL,
  `perusahaan_telepon` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`perusahaan_id`, `perusahaan_nama`, `perusahaan_alamat`, `kota_id`, `perusahaan_email`, `perusahaan_telepon`) VALUES
(31, 'PT Telkom Indonesia', 'Jogja', 11, 'Telkom@ac.id', '08997654565'),
(32, 'Kemendikbud', 'Bandung', 13, 'guru@id', '0987677777'),
(34, 'PT Shopee', 'Surabaya', 16, 'shopee@yahoo,com', ''),
(40, 'FILKOM UB', 'Malang', 15, 'filkom.ub.ac.id', '09876577');

--
-- Triggers `perusahaan`
--
DELIMITER $$
CREATE TRIGGER `check_role_perusahaan` BEFORE INSERT ON `perusahaan` FOR EACH ROW BEGIN
		IF (SELECT login_role FROM login WHERE login_id = NEW.perusahaan_id) != 'Perusahaan' THEN 
			SIGNAL SQLSTATE '45000';
		END IF;
	END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_nama` (`admin_nama`);

--
-- Indexes for table `calon_pekerja`
--
ALTER TABLE `calon_pekerja`
  ADD PRIMARY KEY (`calon_pekerja_id`),
  ADD KEY `fk_calon_pekerja_kota` (`kota_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`),
  ADD UNIQUE KEY `kategori_nama` (`kategori_nama`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`kota_id`),
  ADD UNIQUE KEY `kota_nama` (`kota_nama`);

--
-- Indexes for table `lamaran`
--
ALTER TABLE `lamaran`
  ADD PRIMARY KEY (`lamaran_id`),
  ADD UNIQUE KEY `lowongan_id` (`lowongan_id`,`calon_pekerja_id`),
  ADD KEY `calon_pekerja_id` (`calon_pekerja_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `login_username` (`login_username`);

--
-- Indexes for table `lowongan`
--
ALTER TABLE `lowongan`
  ADD PRIMARY KEY (`lowongan_id`),
  ADD KEY `fk_lowongan_perusahaan` (`perusahaan_id`),
  ADD KEY `fk_lowongan_kategori` (`kategori_id`);

--
-- Indexes for table `lowongan_jobdesc`
--
ALTER TABLE `lowongan_jobdesc`
  ADD PRIMARY KEY (`lowongan_jobdesc_id`),
  ADD KEY `fk_jobdesc_lowongan` (`lowongan_id`);

--
-- Indexes for table `lowongan_syarat`
--
ALTER TABLE `lowongan_syarat`
  ADD PRIMARY KEY (`lowongan_syarat_id`),
  ADD KEY `fk_syarat_lowongan` (`lowongan_id`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`perusahaan_id`),
  ADD UNIQUE KEY `perusahaan_nama` (`perusahaan_nama`),
  ADD KEY `fk_perusahaan_kota` (`kota_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `kota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `lamaran`
--
ALTER TABLE `lamaran`
  MODIFY `lamaran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `lowongan`
--
ALTER TABLE `lowongan`
  MODIFY `lowongan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `lowongan_jobdesc`
--
ALTER TABLE `lowongan_jobdesc`
  MODIFY `lowongan_jobdesc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `lowongan_syarat`
--
ALTER TABLE `lowongan_syarat`
  MODIFY `lowongan_syarat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_login` FOREIGN KEY (`admin_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `calon_pekerja`
--
ALTER TABLE `calon_pekerja`
  ADD CONSTRAINT `fk_calon_pekerja_kota` FOREIGN KEY (`kota_id`) REFERENCES `kota` (`kota_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_calon_pekerja_login` FOREIGN KEY (`calon_pekerja_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lamaran`
--
ALTER TABLE `lamaran`
  ADD CONSTRAINT `lamaran_ibfk_1` FOREIGN KEY (`calon_pekerja_id`) REFERENCES `calon_pekerja` (`calon_pekerja_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lamaran_ibfk_2` FOREIGN KEY (`lowongan_id`) REFERENCES `lowongan` (`lowongan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lowongan`
--
ALTER TABLE `lowongan`
  ADD CONSTRAINT `fk_lowongan_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lowongan_perusahaan` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan` (`perusahaan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lowongan_jobdesc`
--
ALTER TABLE `lowongan_jobdesc`
  ADD CONSTRAINT `fk_jobdesc_lowongan` FOREIGN KEY (`lowongan_id`) REFERENCES `lowongan` (`lowongan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lowongan_syarat`
--
ALTER TABLE `lowongan_syarat`
  ADD CONSTRAINT `fk_syarat_lowongan` FOREIGN KEY (`lowongan_id`) REFERENCES `lowongan` (`lowongan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD CONSTRAINT `fk_perusahaan_kota` FOREIGN KEY (`kota_id`) REFERENCES `kota` (`kota_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_perusahaan_login` FOREIGN KEY (`perusahaan_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
