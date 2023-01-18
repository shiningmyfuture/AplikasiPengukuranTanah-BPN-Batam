-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2022 at 04:11 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bapena`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_divisi`
--

CREATE TABLE `tb_divisi` (
  `idDivisi` int(2) NOT NULL,
  `nama_divisi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_divisi`
--

INSERT INTO `tb_divisi` (`idDivisi`, `nama_divisi`) VALUES
(1, 'pengukuran'),
(2, 'pemeriksaan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_dokumen`
--

CREATE TABLE `tb_dokumen` (
  `dokumenId` int(11) NOT NULL,
  `dok_satu` varchar(100) NOT NULL,
  `dok_dua` varchar(100) NOT NULL,
  `dok_tiga` varchar(100) NOT NULL,
  `id_petugasPemeriksaan` int(11) NOT NULL,
  `id_userPemohon` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_dokumen`
--

INSERT INTO `tb_dokumen` (`dokumenId`, `dok_satu`, `dok_dua`, `dok_tiga`, `id_petugasPemeriksaan`, `id_userPemohon`, `id_status`) VALUES
(2, 'D:\\Kuliah\\PBL\\contoh verif surat ukur.png', 'D:\\Kuliah\\PBL\\ui2.jpg', 'D:\\Kuliah\\PBL\\Screenshot_1.png', 5, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tb_hasil_ukur`
--

CREATE TABLE `tb_hasil_ukur` (
  `idHasil_ukur` int(11) NOT NULL,
  `nib` varchar(30) DEFAULT NULL,
  `keadaan_tnh` varchar(300) DEFAULT NULL,
  `penggunaan` varchar(300) DEFAULT NULL,
  `tgl_pengukuran` date DEFAULT NULL,
  `luas_tnh` varchar(255) DEFAULT NULL,
  `idPermohonan` int(11) DEFAULT NULL,
  `idPetugas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_hasil_ukur`
--

INSERT INTO `tb_hasil_ukur` (`idHasil_ukur`, `nib`, `keadaan_tnh`, `penggunaan`, `tgl_pengukuran`, `luas_tnh`, `idPermohonan`, `idPetugas`) VALUES
(4, '1234567', 'baik', 'perkebunan', '2022-06-03', '310 M2', 9, 1),
(6, '123123', 'baik ', 'perkebunan', '2022-06-03', '210 meter', 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_permohonan`
--

CREATE TABLE `tb_permohonan` (
  `idPermohonan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nik` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `lokasi_tnh` varchar(255) NOT NULL,
  `bukti_milik` varchar(255) NOT NULL,
  `ukuran_tnh` varchar(200) NOT NULL,
  `titik_koordinat` varchar(50) NOT NULL,
  `status` int(12) NOT NULL,
  `id_petugas` int(255) NOT NULL,
  `dokumen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_permohonan`
--

INSERT INTO `tb_permohonan` (`idPermohonan`, `id_user`, `nama`, `nik`, `email`, `no_telp`, `alamat`, `lokasi_tnh`, `bukti_milik`, `ukuran_tnh`, `titik_koordinat`, `status`, `id_petugas`, `dokumen`) VALUES
(9, 2, 'junanda ika rizky', '3214', 'junanda@gmail.com', '082268841090', 'kav.nusa jaya', 'dekat lapangan bola', 'sertifikat.png', '60 x 60 meter', '25.2126, 1 11.6666', 3, 1, NULL),
(10, 2, 'junanda', '1234321', 'ade123@gmail.com', '0812343223', 'sekupang', 'bengkong', 'sertifikat', '20x30', '12ls 321lu', 3, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `idPetugas` int(11) NOT NULL,
  `nik` varchar(30) NOT NULL,
  `nama_petugas` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `idDivisi` int(11) NOT NULL,
  `jobStatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_petugas`
--

INSERT INTO `tb_petugas` (`idPetugas`, `nik`, `nama_petugas`, `no_telp`, `alamat`, `idDivisi`, `jobStatus`) VALUES
(1, '3222321', 'ijul', '082269692020', 'batam center', 1, 1),
(2, '456473', 'ujang', '08309029578', 'tiban center', 1, 0),
(3, '456654', 'bayu', '081280967575', 'bengkong', 1, 0),
(4, '435654', 'Jossua', '08123211234', 'Punggur', 2, 1),
(5, '345432', 'kevin', '085789567423', 'nongsa', 2, 0),
(7, '12345', 'Rehan', '083456785622', 'sekupang', 1, 0),
(9, '12332145', 'cokiS', '082278789292', 'batam center', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_status`
--

CREATE TABLE `tb_status` (
  `id` int(2) NOT NULL,
  `nama_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_status`
--

INSERT INTO `tb_status` (`id`, `nama_status`) VALUES
(1, 'Menunggu Persetujuan'),
(2, 'Permohonan Disetujui'),
(3, 'Pengukuran Selesai'),
(4, 'Menunggu Pemeriksaan'),
(5, 'Pemeriksaan Selesai'),
(6, 'Proses Penerbitan SK'),
(7, 'SK Diterbitkan'),
(9, 'Permohonan Ditolak');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id_users` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(3) NOT NULL,
  `id_petugas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id_users`, `username`, `name`, `password`, `level`, `id_petugas`) VALUES
(1, 'admin', 'admin', 'admin123', '1', NULL),
(2, 'junan123', 'junan', 'junan', '3', NULL),
(3, 'bayu123', 'bayu diablo', 'bayu123', '2', 3),
(4, 'ujang123', 'ujang', 'ujang123', '2', 2),
(5, 'Rehan123', 'Rehan', 'rehan123', '2', 7),
(6, 'ijul123', 'ijul', 'ijul123', '2', 1),
(7, 'windah123', 'windah', 'windah123', '3', NULL),
(15, 'cokimuslim', 'cokiS', 'coki666', '2', 9),
(16, 'kevin123', 'kevin', 'kevin123', '2', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_divisi`
--
ALTER TABLE `tb_divisi`
  ADD PRIMARY KEY (`idDivisi`);

--
-- Indexes for table `tb_dokumen`
--
ALTER TABLE `tb_dokumen`
  ADD PRIMARY KEY (`dokumenId`),
  ADD KEY `id_status` (`id_status`),
  ADD KEY `tb_dokumen_ibfk_2` (`id_petugasPemeriksaan`),
  ADD KEY `id_userPemohon` (`id_userPemohon`);

--
-- Indexes for table `tb_hasil_ukur`
--
ALTER TABLE `tb_hasil_ukur`
  ADD PRIMARY KEY (`idHasil_ukur`),
  ADD KEY `idformPemohon` (`idPermohonan`),
  ADD KEY `idPetugas` (`idPetugas`);

--
-- Indexes for table `tb_permohonan`
--
ALTER TABLE `tb_permohonan`
  ADD PRIMARY KEY (`idPermohonan`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `dokumen` (`dokumen`),
  ADD KEY `petugas` (`id_petugas`),
  ADD KEY `status` (`status`),
  ADD KEY `tb_permohonan_ibfk_5` (`id_user`);

--
-- Indexes for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`idPetugas`),
  ADD KEY `idDivisi` (`idDivisi`);

--
-- Indexes for table `tb_status`
--
ALTER TABLE `tb_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id_users`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_dokumen`
--
ALTER TABLE `tb_dokumen`
  MODIFY `dokumenId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_hasil_ukur`
--
ALTER TABLE `tb_hasil_ukur`
  MODIFY `idHasil_ukur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_permohonan`
--
ALTER TABLE `tb_permohonan`
  MODIFY `idPermohonan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `idPetugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_status`
--
ALTER TABLE `tb_status`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_dokumen`
--
ALTER TABLE `tb_dokumen`
  ADD CONSTRAINT `tb_dokumen_ibfk_2` FOREIGN KEY (`id_petugasPemeriksaan`) REFERENCES `tb_petugas` (`idPetugas`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_dokumen_ibfk_3` FOREIGN KEY (`id_status`) REFERENCES `tb_status` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_dokumen_ibfk_4` FOREIGN KEY (`id_userPemohon`) REFERENCES `tb_users` (`id_users`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tb_hasil_ukur`
--
ALTER TABLE `tb_hasil_ukur`
  ADD CONSTRAINT `idformPemohon` FOREIGN KEY (`idPermohonan`) REFERENCES `tb_permohonan` (`idPermohonan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_hasil_ukur_ibfk_1` FOREIGN KEY (`idPetugas`) REFERENCES `tb_petugas` (`idPetugas`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tb_permohonan`
--
ALTER TABLE `tb_permohonan`
  ADD CONSTRAINT `tb_permohonan_ibfk_2` FOREIGN KEY (`status`) REFERENCES `tb_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_permohonan_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`idPetugas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_permohonan_ibfk_5` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id_users`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD CONSTRAINT `tb_petugas_ibfk_1` FOREIGN KEY (`idDivisi`) REFERENCES `tb_divisi` (`idDivisi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `tb_users_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`idPetugas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
