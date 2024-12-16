-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 21, 2024 at 05:08 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--


-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `authorid` int(9) NOT NULL,
  `name` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`authorid`, `name`) VALUES
(1, 'Author One'),
(2, 'Author Two'),
(4, 'Author Four'),
(5, 'Author Five'),
(7, 'neighbor'),
(8, 'SOFTCORE'),
(10, 'LIKTIK'),
(11, 'LIL UZI VERT'),
(13, 'John Doe');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookid` int(9) NOT NULL,
  `title` char(255) DEFAULT NULL,
  `authorid` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookid`, `title`, `authorid`) VALUES
(2, 'Book Two', 2),
(4, 'Book Four', 4),
(5, 'Book Five', 5),
(7, 'Updated Book Title', 5),
(9, 'dmmmsu nlucccc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `collectionid` int(9) NOT NULL,
  `bookid` int(9) DEFAULT NULL,
  `authorid` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`collectionid`, `bookid`, `authorid`) VALUES
(2, 2, 2),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`) VALUES
(1, 'WALA WALA', '9516d9adedd4d6cca6057fc6a0bc8bf58a14ec6fafb4f797d231936781b3e29c'),
(3, 'Pedro', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1'),
(5, 'Sab', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1'),
(9, 'JAMES BUCSIT', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5'),
(11, 'JAMES 1', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(12, 'Klarence', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b'),
(13, 'new123', '4d17fcbde3767e77a11f173cd1a1b2a6959b3cc2075d553759528e6be4149475'),
(14, 'RIELAN', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(16, 'KLARENCE GAMING', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(19, 'string', '473287f8298dba7163a897908958f7c0eae733e25d2e027992ea2edc9bed2fa8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`authorid`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `authorid` (`authorid`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`collectionid`),
  ADD KEY `bookid` (`bookid`),
  ADD KEY `authorid` (`authorid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `authorid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `book_authors`
--
ALTER TABLE `book_authors`
  MODIFY `collectionid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`authorid`) REFERENCES `authors` (`authorid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_authors_ibfk_2` FOREIGN KEY (`authorid`) REFERENCES `authors` (`authorid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
