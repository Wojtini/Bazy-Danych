-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               10.5.5-MariaDB - mariadb.org binary distribution
-- Serwer OS:                    Win64
-- HeidiSQL Wersja:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Zrzut struktury bazy danych music
DROP DATABASE IF EXISTS `music`;
CREATE DATABASE IF NOT EXISTS `music` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `music`;

-- Zrzut struktury tabela music.album
DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `tytul` varchar(180) NOT NULL,
  `gatunek` varchar(180) DEFAULT NULL,
  `zespol` int(11) NOT NULL,
  PRIMARY KEY (`tytul`,`zespol`),
  KEY `pom_index` (`gatunek`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli music.album: ~5 rows (około)
DELETE FROM `album`;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` (`tytul`, `gatunek`, `zespol`) VALUES
	('AlbumNumer4', 'Classical', 298),
	('AlbumNumer2', 'Heavy Metal', 300),
	('AlbumNumer5', 'Latin', 295),
	('AlbumNumer3', 'Opera', 299),
	('AlbumNumer1', 'Rock', 301);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;

-- Zrzut struktury procedura music.Test
DROP PROCEDURE IF EXISTS `Test`;
DELIMITER //
CREATE PROCEDURE `Test`()
BEGIN

UPDATE zespol AS ze
SET ze.liczbaAlbumow=0;

UPDATE zespol AS ze
SET ze.liczbaAlbumow = (SELECT COUNT(alb.tytul) FROM zespol AS zes JOIN album AS alb WHERE(alb.zespol=zes.id AND ze.id=zes.id) GROUP BY zes.nazwa LIMIT 1);


END//
DELIMITER ;

-- Zrzut struktury tabela music.utwor
DROP TABLE IF EXISTS `utwor`;
CREATE TABLE IF NOT EXISTS `utwor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tytul` varchar(180) NOT NULL,
  `czas` int(11) DEFAULT NULL,
  `album` varchar(180) NOT NULL,
  `zespol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`czas` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli music.utwor: ~54 rows (około)
DELETE FROM `utwor`;
/*!40000 ALTER TABLE `utwor` DISABLE KEYS */;
INSERT INTO `utwor` (`id`, `tytul`, `czas`, `album`, `zespol`) VALUES
	(1, 'd', 2, 'a', 2),
	(2, 'Utwor15 A295', 901, 'AlbumNumer5', 295),
	(3, 'Utwor14 A295', 452, 'AlbumNumer5', 295),
	(4, 'Utwor13 A295', 559, 'AlbumNumer5', 295),
	(5, 'Utwor12 A295', 440, 'AlbumNumer5', 295),
	(6, 'Utwor11 A295', 524, 'AlbumNumer5', 295),
	(7, 'Utwor10 A295', 301, 'AlbumNumer5', 295),
	(8, 'Utwor9 A295', 931, 'AlbumNumer5', 295),
	(9, 'Utwor8 A295', 755, 'AlbumNumer5', 295),
	(10, 'Utwor7 A295', 983, 'AlbumNumer5', 295),
	(11, 'Utwor6 A295', 651, 'AlbumNumer5', 295),
	(12, 'Utwor5 A295', 307, 'AlbumNumer5', 295),
	(13, 'Utwor4 A295', 582, 'AlbumNumer5', 295),
	(14, 'Utwor3 A295', 987, 'AlbumNumer5', 295),
	(15, 'Utwor2 A295', 191, 'AlbumNumer5', 295),
	(16, 'Utwor1 A295', 996, 'AlbumNumer5', 295),
	(17, 'Utwor10 A298', 961, 'AlbumNumer4', 298),
	(18, 'Utwor9 A298', 700, 'AlbumNumer4', 298),
	(19, 'Utwor8 A298', 621, 'AlbumNumer4', 298),
	(20, 'Utwor7 A298', 6, 'AlbumNumer4', 298),
	(21, 'Utwor6 A298', 165, 'AlbumNumer4', 298),
	(22, 'Utwor5 A298', 810, 'AlbumNumer4', 298),
	(23, 'Utwor4 A298', 554, 'AlbumNumer4', 298),
	(24, 'Utwor3 A298', 342, 'AlbumNumer4', 298),
	(25, 'Utwor2 A298', 49, 'AlbumNumer4', 298),
	(26, 'Utwor1 A298', 218, 'AlbumNumer4', 298),
	(27, 'Utwor15 A299', 370, 'AlbumNumer3', 299),
	(28, 'Utwor14 A299', 929, 'AlbumNumer3', 299),
	(29, 'Utwor13 A299', 537, 'AlbumNumer3', 299),
	(30, 'Utwor12 A299', 896, 'AlbumNumer3', 299),
	(31, 'Utwor11 A299', 871, 'AlbumNumer3', 299),
	(32, 'Utwor10 A299', 667, 'AlbumNumer3', 299),
	(33, 'Utwor9 A299', 724, 'AlbumNumer3', 299),
	(34, 'Utwor8 A299', 617, 'AlbumNumer3', 299),
	(35, 'Utwor7 A299', 916, 'AlbumNumer3', 299),
	(36, 'Utwor6 A299', 730, 'AlbumNumer3', 299),
	(37, 'Utwor5 A299', 900, 'AlbumNumer3', 299),
	(38, 'Utwor4 A299', 312, 'AlbumNumer3', 299),
	(39, 'Utwor3 A299', 860, 'AlbumNumer3', 299),
	(40, 'Utwor2 A299', 365, 'AlbumNumer3', 299),
	(41, 'Utwor1 A299', 244, 'AlbumNumer3', 299),
	(42, 'Utwor7 A300', 215, 'AlbumNumer2', 300),
	(43, 'Utwor6 A300', 580, 'AlbumNumer2', 300),
	(44, 'Utwor5 A300', 256, 'AlbumNumer2', 300),
	(45, 'Utwor4 A300', 538, 'AlbumNumer2', 300),
	(46, 'Utwor3 A300', 922, 'AlbumNumer2', 300),
	(47, 'Utwor2 A300', 995, 'AlbumNumer2', 300),
	(48, 'Utwor1 A300', 213, 'AlbumNumer2', 300),
	(49, 'Utwor6 A301', 742, 'AlbumNumer1', 301),
	(50, 'Utwor5 A301', 545, 'AlbumNumer1', 301),
	(51, 'Utwor4 A301', 502, 'AlbumNumer1', 301),
	(52, 'Utwor3 A301', 874, 'AlbumNumer1', 301),
	(53, 'Utwor2 A301', 864, 'AlbumNumer1', 301),
	(54, 'Utwor1 A301', 698, 'AlbumNumer1', 301);
/*!40000 ALTER TABLE `utwor` ENABLE KEYS */;

-- Zrzut struktury procedura music.zad1
DROP PROCEDURE IF EXISTS `zad1`;
DELIMITER //
CREATE PROCEDURE `zad1`(IN tab VARCHAR(120),IN nrow VARCHAR(120))
BEGIN
	PREPARE stmt1 FROM concat('SELECT * FROM ', tab);
	EXECUTE stmt1;
END//
DELIMITER ;

-- Zrzut struktury procedura music.zad7
DROP PROCEDURE IF EXISTS `zad7`;
DELIMITER //
CREATE PROCEDURE `zad7`(k INT)
BEGIN
	DECLARE pom CHAR(120);
	DECLARE utwGen INT;
	DECLARE aktZes VARCHAR(120);
	DECLARE aktZesIndex INT;
	DECLARE aktAlb VARCHAR(120);
	WHILE k > 0 DO
		SET utwGen = FLOOR(RAND()*10)+6;
		#Tworzenie zespolu
		IF k <> 0 THEN
			SET aktZes = CONCAT("ZespolNumer",k);
			INSERT INTO zespol (nazwa,liczbaAlbumow) VALUES (aktZes,0);
			SET aktZesIndex = (SELECT id FROM zespol WHERE (nazwa = aktZes) LIMIT 1);
		END IF;
		#Tworzenie albumu
		SET aktAlb = CONCAT("AlbumNumer",k);
		INSERT INTO album (tytul,zespol,gatunek) VALUES (aktAlb,aktZesIndex,(SELECT alb.gatunek FROM album AS alb ORDER BY RAND() LIMIT 1));
		#Uzupelnianie utworow albumu
		WHILE utwGen > 0 DO
			INSERT INTO utwor (tytul,czas,album,zespol) VALUES (CONCAT("Utwor",utwGen," A",aktZesIndex),FLOOR(RAND()*1000),aktAlb,aktZesIndex);
			SET utwGen = utwGen-1;
		END WHILE;
		
		SET k = k-1;	
	END WHILE;
END//
DELIMITER ;

-- Zrzut struktury procedura music.zad8
DROP PROCEDURE IF EXISTS `zad8`;
DELIMITER //
CREATE PROCEDURE `zad8`(nazwaZespolu VARCHAR(120))
BEGIN
	IF NOT EXISTS (SELECT nazwa FROM zespol WHERE nazwaZespolu=nazwa LIMIT 1) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nie istnieje taki zespol';
	END IF;

	SELECT zespol.nazwa,album.tytul,SUM(utwor.czas) AS SUMA
	FROM zespol
	JOIN album
	JOIN utwor
	WHERE(
	zespol.id=album.zespol AND album.tytul=utwor.album AND zespol.id = utwor.zespol
	AND
	zespol.nazwa = nazwaZespolu
	)
	GROUP BY album.tytul
	ORDER BY SUMA DESC
	LIMIT 1;
END//
DELIMITER ;

-- Zrzut struktury procedura music.zadanie16
DROP PROCEDURE IF EXISTS `zadanie16`;
DELIMITER //
CREATE PROCEDURE `zadanie16`(IN t varchar(90), IN k varchar(90))
BEGIN
	#sprawdzenie
	IF
		NOT EXISTS (
		SELECT * FROM information_schema.columns
		WHERE TABLE_SCHEMA = "music" AND TABLE_NAME = t AND COLUMN_NAME = k
		)
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Blad';
	END IF;

    PREPARE stmt FROM
        concat('SELECT ', k ,' FROM ', t, ' ORDER BY ', k, ' DESC LIMIT 1');
    EXECUTE stmt;
END//
DELIMITER ;

-- Zrzut struktury tabela music.zespol
DROP TABLE IF EXISTS `zespol`;
CREATE TABLE IF NOT EXISTS `zespol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(180) NOT NULL,
  `liczbaAlbumow` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli music.zespol: ~6 rows (około)
DELETE FROM `zespol`;
/*!40000 ALTER TABLE `zespol` DISABLE KEYS */;
INSERT INTO `zespol` (`id`, `nazwa`, `liczbaAlbumow`) VALUES
	(295, 'ZespolNumer5', 0),
	(297, 'ZespolNumer5', 0),
	(298, 'ZespolNumer4', 0),
	(299, 'ZespolNumer3', 0),
	(300, 'ZespolNumer2', 0),
	(301, 'ZespolNumer1', 0);
/*!40000 ALTER TABLE `zespol` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
