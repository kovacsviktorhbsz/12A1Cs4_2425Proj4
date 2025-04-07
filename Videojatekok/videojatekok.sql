-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 30. 14:11
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `videojatekok`
--

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fejlesztok`
--

CREATE TABLE `fejlesztok` (
  `fejleszto_id` int(11) NOT NULL,
  `nev` varchar(255) DEFAULT NULL,
  `orszag` varchar(100) DEFAULT NULL,
  `alapitas_ev` int(11) DEFAULT NULL
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `fejlesztok`
--

INSERT INTO `fejlesztok` (`fejleszto_id`, `nev`, `orszag`, `alapitas_ev`) VALUES
(1, 'FromSoftware', 'Japán', 1986),
(2, 'Capcom', 'Japán', 1979),
(3, 'Larian Studios', 'Belgium', 1996),
(4, 'Sucker Punch Productions', 'USA', 1997),
(5, 'Omocat', 'USA', NULL),
(6, 'Future Cat', 'Ismeretlen', NULL),
(7, 'Toby Fox', 'USA', NULL),
(8, 'Arsi \"Hakita\" Patala', 'Ismeretlen', NULL),
(9, 'Edmund McMillen', 'USA', NULL),
(10, 'Arkane Studios', 'Franciaország', 1999),
(11, 'Treyarch', 'USA', 1996),
(12, 'Riot Games', 'USA', 2006),
(13, 'Psyonix', 'USA', 2000);

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jatekok`
--

CREATE TABLE `jatekok` (
  `jatek_id` int(11) NOT NULL,
  `cim` varchar(255) DEFAULT NULL,
  `kiadasi_ev` int(11) DEFAULT NULL,
  `fejleszto_id` int(11) DEFAULT NULL,
  `mufaj` varchar(100) DEFAULT NULL,
  `ar` varchar(255) DEFAULT NULL,
  `multiplayer` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `jatekok`
--

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
(15, 'Rocket League', 2015, 13, 'Sports', '0', 'van');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jatek_platform`
--

CREATE TABLE `jatek_platform` (
  `jatek_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `jatek_platform`
--

INSERT INTO `jatek_platform` (`jatek_id`, `platform_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(8, 1),
(8, 2),
(9, 1),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(12, 3),
(13, 1),
(13, 2),
(13, 3),
(14, 1),
(15, 1),
(15, 2),
(15, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `platformok`
--

CREATE TABLE `platformok` (
  `platform_id` int(11) NOT NULL,
  `nev` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `platformok`
--

INSERT INTO `platformok` (`platform_id`, `nev`) VALUES
(8, 'Epic Games Store'),
(9, 'Google Stadia'),
(6, 'Nintendo Switch'),
(1, 'PC'),
(3, 'PlayStation 4'),
(2, 'PlayStation 5'),
(7, 'Steam'),
(5, 'Xbox One'),
(4, 'Xbox Series X');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `fejlesztok`
--
ALTER TABLE `fejlesztok`
  ADD PRIMARY KEY (`fejleszto_id`);


--
-- A tábla indexei `jatekok`
--
ALTER TABLE `jatekok`
  ADD PRIMARY KEY (`jatek_id`),
  ADD KEY `fejleszto_id` (`fejleszto_id`);

--
-- A tábla indexei `jatek_platform`
--
ALTER TABLE `jatek_platform`
  ADD PRIMARY KEY (`jatek_id`,`platform_id`),
  ADD KEY `platform_id` (`platform_id`);

--
-- A tábla indexei `platformok`
--
ALTER TABLE `platformok`
  ADD PRIMARY KEY (`platform_id`),
  ADD UNIQUE KEY `nev` (`nev`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `ertekelesek`
--


--
-- AUTO_INCREMENT a táblához `fejlesztok`
--
ALTER TABLE `fejlesztok`
  MODIFY `fejleszto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--


--
-- AUTO_INCREMENT a táblához `jatekok`
--
ALTER TABLE `jatekok`
  MODIFY `jatek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `platformok`
--
ALTER TABLE `platformok`
  MODIFY `platform_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Megkötések a kiírt táblákhoz
--



--
-- Megkötések a táblához `jatekok`
--
ALTER TABLE `jatekok`
  ADD CONSTRAINT `jatekok_ibfk_1` FOREIGN KEY (`fejleszto_id`) REFERENCES `fejlesztok` (`fejleszto_id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `jatek_platform`
--
ALTER TABLE `jatek_platform`
  ADD CONSTRAINT `jatek_platform_ibfk_1` FOREIGN KEY (`jatek_id`) REFERENCES `jatekok` (`jatek_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jatek_platform_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platformok` (`platform_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
