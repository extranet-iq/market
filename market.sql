-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2019 at 06:21 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `market`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounting`
--

CREATE TABLE `accounting` (
  `accounting_id` int(10) NOT NULL,
  `accounting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `m_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `co_id` int(10) NOT NULL,
  `co_name` varchar(250) NOT NULL,
  `add_date` datetime NOT NULL,
  `e_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cost`
--

CREATE TABLE `cost` (
  `cost_id` int(10) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` text COLLATE utf8_bin,
  `cost_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `e_id` int(10) NOT NULL,
  `m_id` int(10) NOT NULL,
  `accounting_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `co_back`
--

CREATE TABLE `co_back` (
  `co_back_id` int(10) NOT NULL,
  `input_id` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `co_seller_id` int(10) NOT NULL,
  `back_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `emp_id` int(10) NOT NULL,
  `description` text COLLATE utf8_bin,
  `m_id` int(10) NOT NULL,
  `money_back` decimal(10,0) NOT NULL,
  `accounting_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `co_info`
--

CREATE TABLE `co_info` (
  `co_id` int(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `discription` text NOT NULL,
  `add_date` datetime NOT NULL,
  `e_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `co_seller`
--

CREATE TABLE `co_seller` (
  `co_id` int(10) NOT NULL,
  `co_seller_id` int(10) NOT NULL,
  `co_seller_name` varchar(25) NOT NULL,
  `add_date` datetime NOT NULL,
  `e_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `co_seller_info`
--

CREATE TABLE `co_seller_info` (
  `co_seller_id` int(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `discription` text NOT NULL,
  `add_date` datetime NOT NULL,
  `e_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_id` int(10) NOT NULL,
  `c_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `phone` text COLLATE utf8_bin NOT NULL,
  `phone_2` text COLLATE utf8_bin,
  `address` text COLLATE utf8_bin,
  `e_id` int(10) NOT NULL,
  `r_date` datetime NOT NULL,
  `description` text COLLATE utf8_bin,
  `balance` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `debt`
--

CREATE TABLE `debt` (
  `debt_id` int(10) NOT NULL,
  `voucher_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `payed` decimal(10,0) NOT NULL,
  `first_debt` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `e_id` int(8) NOT NULL,
  `e_name` varchar(25) NOT NULL,
  `role_id` int(8) NOT NULL,
  `m_id` int(8) NOT NULL,
  `user` varchar(25) NOT NULL,
  `pass` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_info`
--

CREATE TABLE `employee_info` (
  `e_id` int(8) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `phone2` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `blood_groupe` varchar(3) NOT NULL,
  `state_of_marrage` varchar(9) NOT NULL,
  `child_no` int(2) NOT NULL,
  `discription` text NOT NULL,
  `r_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `input`
--

CREATE TABLE `input` (
  `input_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `price_one` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `input_price` int(11) NOT NULL,
  `exp_date` datetime NOT NULL,
  `e_id` int(11) NOT NULL,
  `voucher_no` int(11) NOT NULL,
  `xasm_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `input_voucher`
--

CREATE TABLE `input_voucher` (
  `in_v_id` int(10) NOT NULL,
  `v_id` int(10) NOT NULL,
  `total_price` int(11) NOT NULL,
  `paied` int(11) NOT NULL,
  `e_id` int(10) NOT NULL,
  `co_seller_id` int(10) NOT NULL,
  `input_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `in_v_pay`
--

CREATE TABLE `in_v_pay` (
  `pay_id` int(10) NOT NULL,
  `in_v_id` int(10) NOT NULL,
  `money` int(11) NOT NULL,
  `pay_date` datetime NOT NULL,
  `e_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `code` int(11) NOT NULL,
  `item_name` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price_one` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `item_back`
--

CREATE TABLE `item_back` (
  `back_id` int(10) NOT NULL,
  `voucher_id` int(10) NOT NULL,
  `code` varchar(20) COLLATE utf8_bin NOT NULL,
  `qty` int(10) NOT NULL,
  `money_back` decimal(10,0) NOT NULL,
  `back_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_name` varchar(40) COLLATE utf8_bin NOT NULL,
  `customer_phone` text COLLATE utf8_bin NOT NULL,
  `e_id` int(10) NOT NULL,
  `m_id` int(10) NOT NULL,
  `description` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `item_jwmla`
--

CREATE TABLE `item_jwmla` (
  `code` int(11) NOT NULL,
  `j_id` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `jwmla`
--

CREATE TABLE `jwmla` (
  `j_id` int(11) NOT NULL,
  `j_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `pay_back`
--

CREATE TABLE `pay_back` (
  `pay_back_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `money` decimal(10,0) NOT NULL,
  `pay_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `e_id` int(10) NOT NULL,
  `accounting_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(10) NOT NULL,
  `role_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sell`
--

CREATE TABLE `sell` (
  `sell_id` int(10) NOT NULL,
  `code` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `voucher_id` int(10) NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `input_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `talaf`
--

CREATE TABLE `talaf` (
  `talaf_id` int(10) NOT NULL,
  `input_id` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `talaf_date` datetime NOT NULL,
  `emp_id` int(10) NOT NULL,
  `description` text COLLATE utf8_bin,
  `m_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(10) NOT NULL,
  `type` varchar(60) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `voucher_id` int(10) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `e_id` int(10) NOT NULL,
  `v_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discount` decimal(10,0) DEFAULT NULL,
  `debt_state` int(1) DEFAULT NULL,
  `acc_id` int(10) NOT NULL,
  `debt_total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounting`
--
ALTER TABLE `accounting`
  ADD PRIMARY KEY (`accounting_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`co_id`);

--
-- Indexes for table `cost`
--
ALTER TABLE `cost`
  ADD PRIMARY KEY (`cost_id`);

--
-- Indexes for table `co_back`
--
ALTER TABLE `co_back`
  ADD PRIMARY KEY (`co_back_id`);

--
-- Indexes for table `co_info`
--
ALTER TABLE `co_info`
  ADD PRIMARY KEY (`co_id`);

--
-- Indexes for table `co_seller`
--
ALTER TABLE `co_seller`
  ADD PRIMARY KEY (`co_seller_id`);

--
-- Indexes for table `co_seller_info`
--
ALTER TABLE `co_seller_info`
  ADD PRIMARY KEY (`co_seller_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `debt`
--
ALTER TABLE `debt`
  ADD PRIMARY KEY (`debt_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`e_id`),
  ADD UNIQUE KEY `user` (`user`);

--
-- Indexes for table `employee_info`
--
ALTER TABLE `employee_info`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `input`
--
ALTER TABLE `input`
  ADD PRIMARY KEY (`input_id`);

--
-- Indexes for table `input_voucher`
--
ALTER TABLE `input_voucher`
  ADD PRIMARY KEY (`in_v_id`);

--
-- Indexes for table `in_v_pay`
--
ALTER TABLE `in_v_pay`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `item_back`
--
ALTER TABLE `item_back`
  ADD PRIMARY KEY (`back_id`);

--
-- Indexes for table `jwmla`
--
ALTER TABLE `jwmla`
  ADD PRIMARY KEY (`j_id`);

--
-- Indexes for table `pay_back`
--
ALTER TABLE `pay_back`
  ADD PRIMARY KEY (`pay_back_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `sell`
--
ALTER TABLE `sell`
  ADD PRIMARY KEY (`sell_id`);

--
-- Indexes for table `talaf`
--
ALTER TABLE `talaf`
  ADD PRIMARY KEY (`talaf_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounting`
--
ALTER TABLE `accounting`
  MODIFY `accounting_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `co_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cost`
--
ALTER TABLE `cost`
  MODIFY `cost_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `co_back`
--
ALTER TABLE `co_back`
  MODIFY `co_back_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `co_info`
--
ALTER TABLE `co_info`
  MODIFY `co_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `co_seller`
--
ALTER TABLE `co_seller`
  MODIFY `co_seller_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `co_seller_info`
--
ALTER TABLE `co_seller_info`
  MODIFY `co_seller_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `c_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debt`
--
ALTER TABLE `debt`
  MODIFY `debt_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `e_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_info`
--
ALTER TABLE `employee_info`
  MODIFY `e_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `input`
--
ALTER TABLE `input`
  MODIFY `input_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `input_voucher`
--
ALTER TABLE `input_voucher`
  MODIFY `in_v_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `in_v_pay`
--
ALTER TABLE `in_v_pay`
  MODIFY `pay_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_back`
--
ALTER TABLE `item_back`
  MODIFY `back_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jwmla`
--
ALTER TABLE `jwmla`
  MODIFY `j_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_back`
--
ALTER TABLE `pay_back`
  MODIFY `pay_back_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell`
--
ALTER TABLE `sell`
  MODIFY `sell_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `talaf`
--
ALTER TABLE `talaf`
  MODIFY `talaf_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucher_id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
