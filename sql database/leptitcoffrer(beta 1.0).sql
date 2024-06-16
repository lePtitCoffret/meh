-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2024 at 08:10 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leptitcoffrer`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `adr` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `codePostale` int(4) NOT NULL,
  `ville` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `IdClient` int(4) NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `genre` enum('H','F') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'H',
  `adr` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pannier`
--

CREATE TABLE `pannier` (
  `idProduit` int(4) NOT NULL,
  `idClient` int(5) NOT NULL,
  `qte` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `idProduit` int(4) NOT NULL,
  `nomProduit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stock` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`adr`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`IdClient`),
  ADD KEY `adr` (`adr`);

--
-- Indexes for table `pannier`
--
ALTER TABLE `pannier`
  ADD PRIMARY KEY (`idProduit`,`idClient`),
  ADD KEY `idProduit` (`idProduit`),
  ADD KEY `idClient` (`idClient`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProduit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `IdClient` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `idProduit` int(4) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`adr`) REFERENCES `adresse` (`adr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pannier`
--
ALTER TABLE `pannier`
  ADD CONSTRAINT `pannier_ibfk_1` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pannier_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `client` (`IdClient`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
