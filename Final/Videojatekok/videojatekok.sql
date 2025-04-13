SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

drop database if exists videojatekok;
create database videojatekok; 

CREATE TABLE `fejlesztok` (
  `fejleszto_id` int(11) NOT NULL,
  `nev` varchar(255) DEFAULT NULL,
  `orszag` varchar(100) DEFAULT NULL,
  `alapitas_ev` int(11) DEFAULT NULL
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `fejlesztok` (`fejleszto_id`, `nev`, `orszag`, `alapitas_ev`) VALUES
(1, 'FromSoftware', 'Japán', 1986),
(2, 'Capcom', 'Japán', 1979),
(3, 'Larian Studios', 'Belgium', 1996),
(4, 'Sucker Punch Productions', 'USA', 1997),
(5, 'Omocat', 'USA', 2014),
(6, 'Future Cat LLC', 'Ismeretlen', 2014),
(7, 'Toby Fox', 'USA', 2015),
(8, 'Arsi \"Hakita\" Patala', 'Ismeretlen', 2014),
(9, 'Edmund McMillen', 'USA', 2007),
(10, 'Arkane Studios', 'Franciaország', 1999),
(11, 'Treyarch', 'USA', 1996),
(12, 'Riot Games', 'USA', 2006),
(13, 'Psyonix', 'USA', 2000),
(14, 'Ubisoft','Franciaország', 1984),
(15, 'Monolith Productions', 'USA', 1994),
(16, 'Santa Monica Studio', 'USA', 1999);

CREATE TABLE `jatekok` (
  `jatek_id` int(11) NOT NULL,
  `cim` varchar(255) DEFAULT NULL,
  `kiadasi_ev` int(11) DEFAULT NULL,
  `fejleszto_id` int(11) DEFAULT NULL,
  `mufaj` varchar(100) DEFAULT NULL,
  `ar` varchar(255) DEFAULT NULL,
  `multiplayer` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `jatekok` (`jatek_id`, `cim`, `kiadasi_ev`, `fejleszto_id`, `mufaj`, `ar`, `multiplayer`) VALUES
(1, 'Elden Ring', 2022, 1, 'Action role-playing', '17990', 'van'),
(2, 'Monster Hunter: World', 2018, 2, 'Action role-playing', '8990', 'van'),
(3, 'Baldur\'s Gate 3', 2023, 3, 'Role-playing, turn-based combat', '21990', 'van'),
(4, 'Bloodborne', 2015, 1, 'Action role-playing', '5990', 'van'),
(5, 'Ghost of Tsushima', 2020, 4, 'Action-adventure', '16990', 'nincs'),
(6, 'Omori', 2020, 5, 'Role-playing', '4990', 'nincs'),
(7, 'Oneshot', 2016, 6, 'Adventure, puzzle', '2990', 'nincs'),
(8, 'Undertale', 2015, 7, 'Role-playing', '3990', 'nincs'),
(9, 'Ultrakill', 2020, 8, 'First-person shooter', '6490', 'nincs'),
(10, 'The Binding of Isaac', 2011, 9, 'Roguelike, action-adventure', '5990', 'van'),
(11, 'Deathloop', 2021, 10, 'First-person shooter', '18990', 'van'),
(12, 'Resident Evil 4 Remake', 2023, 2, 'Survival horror', '20990', 'nincs'),
(13, 'Call of Duty Black Ops 6', 2024, 11, 'First-person shooter', '24990', 'van'),
(14, 'Valorant', 2020, 12, 'Tactical shooter', '0', 'van'),
(15, 'Rocket League', 2015, 13, 'Sports', '0', 'van'),
(16, 'Assassin’s Creed Origins', 2017, 14,'Action-adventure',19990,'nincs'),
(17, 'Middle-earth: Shadow of War', 2017, 15, 'Action-adventure',16390, 'nincs'),
(18, 'Dark Souls 3', 2016, 1, 'Action role-playing', 24590, 'van'),
(19, 'Devil May Cry 5', 2019, 2, 'Action-adventure, hack and slash', 2990, 'van'),
(20, 'God of War', 2018, 16, 'Action-adventure, hack and slash', 20500, 'nincs');

CREATE TABLE `jatek_platform` (
  `jatek_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `jatek_platform` (`jatek_id`, `platform_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 2),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 1),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3);

CREATE TABLE `platformok` (
  `platform_id` int(11) NOT NULL,
  `nev` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `platformok` (`platform_id`, `nev`) VALUES
(1, 'PC'),
(2, 'Konzol'),
(3, 'PC és konzol');

ALTER TABLE `fejlesztok`
  ADD PRIMARY KEY (`fejleszto_id`);

ALTER TABLE `jatekok`
  ADD PRIMARY KEY (`jatek_id`),
  ADD KEY `fejleszto_id` (`fejleszto_id`);

ALTER TABLE `jatek_platform`
  ADD PRIMARY KEY (`jatek_id`,`platform_id`),
  ADD KEY `platform_id` (`platform_id`);

ALTER TABLE `platformok`
  ADD PRIMARY KEY (`platform_id`),
  ADD UNIQUE KEY `nev` (`nev`);


ALTER TABLE `fejlesztok`
  MODIFY `fejleszto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
  
ALTER TABLE `jatekok`
  MODIFY `jatek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

ALTER TABLE `platformok`
  MODIFY `platform_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `jatekok`
  ADD CONSTRAINT `jatekok_ibfk_1` FOREIGN KEY (`fejleszto_id`) REFERENCES `fejlesztok` (`fejleszto_id`) ON DELETE CASCADE;


ALTER TABLE `jatek_platform`
  ADD CONSTRAINT `jatek_platform_ibfk_1` FOREIGN KEY (`jatek_id`) REFERENCES `jatekok` (`jatek_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jatek_platform_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platformok` (`platform_id`) ON DELETE CASCADE;
COMMIT;
