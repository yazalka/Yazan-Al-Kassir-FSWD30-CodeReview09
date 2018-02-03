-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2018 at 03:13 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_yazan_al_kassir_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident`
--

CREATE TABLE `accident` (
  `charge_id` int(11) NOT NULL,
  `fk_driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accident`
--

INSERT INTO `accident` (`charge_id`, `fk_driver_id`) VALUES
(1, 1),
(2, 4),
(3, 5),
(4, 13),
(5, 17),
(6, 19);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `car_type` varchar(25) DEFAULT NULL,
  `car_price` int(11) DEFAULT NULL,
  `car_details` varchar(55) DEFAULT NULL,
  `car_start_return_location` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `car_type`, `car_price`, `car_details`, `car_start_return_location`) VALUES
(1, 'KIA', 49, '4 Seats 4 Doors 2 Bags Automatic gearbox', 'Hainburger straße 32'),
(2, 'BMW', 55, '4 Seats 2 Doors 2 Bags Manual gearbox', 'Linzer straße 23'),
(3, 'Mercedes', 60, '5 Seats 4 Doors 2 Bags Manual gearbox', 'Landstraße 11'),
(4, 'Volkswagen', 53, '5 Seats 2 Doors 2 Bags Manual gearbox', 'Derfflingerstraße 2');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `phone_number` bigint(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `first_name`, `last_name`, `address`, `phone_number`, `fk_car_id`) VALUES
(1, 'Yazan', 'Al Kassir', 'Hainburger straße 32', 6608564125, 3),
(2, 'Liam', 'Naison', 'Dudweilerstraße 11', 6608564123, 2),
(3, 'Jack', 'Jones', 'Hauptstraße 23', 6608534225, 1),
(4, 'Jennifer', 'Lopez', 'Hainburger straße 32', 6605431235, 4),
(5, 'Robert', 'William', 'Hainburger straße 32', 6601353235, 1),
(6, 'James', 'Jonnas', 'Hauptstraße 44', 6603457635, 2),
(7, 'Bob', 'Marley', 'Feldgasse 11', 6605566235, 4),
(8, 'David', 'Mason', 'Bahnhofstraße 30', 6605431235, 2),
(9, 'John', 'Woods', 'Dorfstraße 35', 6134431235, 2),
(10, 'Conor', 'McGregor', 'Schulstraße 12', 6645131234, 1),
(11, 'Emma', 'Steiner', 'Main Street 13', 6605431234, 4),
(12, 'Alex', 'Mason', 'Grand Canal Way 23', 6605431215, 3),
(13, 'John', 'James', 'Via Roma 41', 6605431235, 2),
(14, 'Jason', 'Hudson', 'Rue de l’Église 20', 6605431755, 3),
(15, 'Sarah', 'Bowman', 'Main Street 3', 6605431235, 1),
(16, 'Megan', 'Fox', 'Grande Rue 14', 6605423243, 4),
(17, 'Hanna', 'Wagner', 'Royal Canal Way 40', 6605434245, 3),
(18, 'Jennnifer', 'Lawrance', 'Petőfi Sándor utca 24', 7505434123, 2),
(19, 'Amanda', 'Sayfried', 'High Street 9', 6605325275, 1),
(20, 'Keanu', 'Reeves', 'Rue des Champs 22', 6605434542, 4);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_charge_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_reservation_id`, `fk_charge_id`) VALUES
(1, 1, 1),
(2, 2, NULL),
(3, 3, NULL),
(4, 4, 2),
(5, 5, 3),
(6, 6, NULL),
(7, 7, NULL),
(8, 8, NULL),
(9, 9, NULL),
(10, 10, NULL),
(11, 11, NULL),
(12, 12, NULL),
(13, 13, 4),
(14, 14, NULL),
(15, 15, NULL),
(16, 16, NULL),
(17, 17, 5),
(18, 18, NULL),
(19, 19, 6),
(20, 20, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `country` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `dropoff_date` date DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `country`, `city`, `pickup_date`, `dropoff_date`, `fk_driver_id`, `fk_invoice_id`) VALUES
(1, 'Austria', 'Vienna', '2018-02-02', '2018-02-27', 1, 1),
(2, 'Germany', 'Saarbrücken', '2018-01-01', '2018-02-01', 2, 2),
(3, 'Austria', 'Innsbruck', '2017-03-05', '2017-03-29', 3, 3),
(4, 'Austria', 'Linz', '2018-05-01', '2018-05-30', 4, 4),
(5, 'Austria', 'Vienna', '2018-01-22', '2018-02-13', 5, 5),
(6, 'Germany', 'Berlin', '2015-05-26', '2015-06-15', 6, 6),
(7, 'Germany', 'Hamburg', '2018-04-27', '2018-05-26', 7, 7),
(8, 'Germany', 'Frankfurt', '2013-01-25', '2013-02-24', 8, 8),
(9, 'Germany', 'Munich', '2011-03-23', '2011-04-20', 9, 9),
(10, 'France', 'Bordeaux', '2015-08-23', '2015-09-23', 10, 10),
(11, 'Austria', 'Graz', '2016-07-24', '2016-02-22', 11, 11),
(12, 'Irekand', 'Galway', '2016-09-27', '2016-10-25', 12, 12),
(13, 'France', 'Nice', '2011-08-28', '2011-09-26', 13, 13),
(14, 'Austria', 'Linz', '2012-06-29', '2012-07-25', 14, 14),
(15, 'Ireland', 'Waterford', '2014-05-22', '2014-06-15', 15, 15),
(16, 'France', 'Lyon', '2014-01-15', '2014-02-17', 16, 16),
(17, 'Austria', 'Vienna', '2015-02-11', '2015-03-14', 17, 17),
(18, 'Ireland', 'Cork', '2017-03-10', '2017-04-12', 18, 18),
(19, 'Austria', 'Salzburg', '2016-05-02', '2016-06-27', 19, 19),
(20, 'France', 'Nantes', '2018-04-14', '2018-05-15', 20, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident`
--
ALTER TABLE `accident`
  ADD PRIMARY KEY (`charge_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_charge_id` (`fk_charge_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accident`
--
ALTER TABLE `accident`
  ADD CONSTRAINT `accident_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_charge_id`) REFERENCES `accident` (`charge_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
