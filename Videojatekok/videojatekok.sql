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

--
-- Tábla szerkezet ehhez a táblához `ertekelesek`
--

CREATE TABLE `ertekelesek` (
  `ertekeles_id` int(11) NOT NULL,
  `felhasznalo_id` int(11) DEFAULT NULL,
  `jatek_id` int(11) DEFAULT NULL,
  `ertekeles` int(11) DEFAULT NULL CHECK (`ertekeles` between 1 and 10),
  `szoveges_velemeny` text DEFAULT NULL,
  `datum` datetime DEFAULT current_timestamp(),
  `like_szam` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `ertekelesek`
--

INSERT INTO `ertekelesek` (`ertekeles_id`, `felhasznalo_id`, `jatek_id`, `ertekeles`, `szoveges_velemeny`, `datum`, `like_szam`) VALUES
(1, 1, 2, 9, 'Nagyon jó játék, szép grafika és izgalmas harcok.', '2024-03-10 00:00:00', 15),
(2, 2, 5, 8, 'Jó történet, de a harcrendszer kicsit nehézkes.', '2024-03-12 00:00:00', 8),
(3, 3, 1, 10, 'Az egyik legjobb játék, amit valaha játszottam!', '2024-03-15 00:00:00', 22),
(4, 4, 3, 7, 'Tetszett, de lehetett volna hosszabb a sztori.', '2024-03-18 00:00:00', 5),
(5, 5, 4, 6, 'Nem rossz, de vannak jobb alternatívák.', '2024-03-20 00:00:00', 3),
(6, 6, 6, 9, 'Nagyon szórakoztató és jó hangulatú játék.', '2024-03-22 00:00:00', 12);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fejlesztok`
--

CREATE TABLE `fejlesztok` (
  `fejleszto_id` int(11) NOT NULL,
  `nev` varchar(255) DEFAULT NULL,
  `orszag` varchar(100) DEFAULT NULL,
  `alapitas_ev` int(11) DEFAULT NULL,
  `weboldal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `fejlesztok`
--

INSERT INTO `fejlesztok` (`fejleszto_id`, `nev`, `orszag`, `alapitas_ev`, `weboldal`) VALUES
(1, 'FromSoftware', 'Japán', 1986, 'https://www.fromsoftware.jp/ww/'),
(2, 'Capcom', 'Japán', 1979, 'https://www.capcom.com/'),
(3, 'Larian Studios', 'Belgium', 1996, 'https://larian.com/'),
(4, 'Sucker Punch Productions', 'USA', 1997, 'https://www.suckerpunch.com/'),
(5, 'Omocat', 'USA', NULL, 'https://www.omocat.com/'),
(6, 'Future Cat', 'Ismeretlen', NULL, NULL),
(7, 'Toby Fox', 'USA', NULL, 'https://tobyfox.bandcamp.com/'),
(8, 'Arsi \"Hakita\" Patala', 'Ismeretlen', NULL, NULL),
(9, 'Edmund McMillen', 'USA', NULL, 'https://edmundmcmillen.com/'),
(10, 'Arkane Studios', 'Franciaország', 1999, 'https://www.arkane-studios.com/'),
(11, 'Treyarch', 'USA', 1996, 'https://www.treyarch.com/'),
(12, 'Riot Games', 'USA', 2006, 'https://www.riotgames.com/'),
(13, 'Psyonix', 'USA', 2000, 'https://www.psyonix.com/');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `felhasznalo_id` int(11) NOT NULL,
  `felhasznalonev` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `regisztracio_datum` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`felhasznalo_id`, `felhasznalonev`, `email`, `regisztracio_datum`) VALUES
(1, 'Gamer01', 'gamer01@example.com', '2023-01-15 00:00:00'),
(2, 'ProPlayer99', 'proplayer99@example.com', '2022-11-30 00:00:00'),
(3, 'NoobMaster', 'noobmaster@example.com', '2024-02-10 00:00:00'),
(4, 'EpicGamer', 'epicgamer@example.com', '2021-07-22 00:00:00'),
(5, 'CasualPlayer', 'casualplayer@example.com', '2023-05-05 00:00:00'),
(6, 'SpeedRunner', 'speedrunner@example.com', '2020-09-14 00:00:00');

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
(1, 'Elden Ring', 2022, 1, 'Action role-playing', '17990 Ft', 'van'),
(2, 'Monster Hunter: World', 2018, 2, 'Action role-playing', '8990 Ft', 'van'),
(3, 'Baldur\'s Gate 3', 2023, 3, 'Role-playing, turn-based combat', '21990 Ft', 'van'),
(4, 'Bloodborne', 2015, 1, 'Action role-playing', '5990 Ft', 'van'),
(5, 'Ghost of Tsushima', 2020, 4, 'Action-adventure', '16990 Ft', 'nincs'),
(6, 'Omori', 2020, 5, 'Role-playing', '4990 Ft', 'nincs'),
(7, 'Oneshot', 2016, 6, 'Adventure, puzzle', '2990 Ft', 'nincs'),
(8, 'Undertale', 2015, 7, 'Role-playing', '3990 Ft', 'nincs'),
(9, 'Ultrakill', 2020, 8, 'First-person shooter', '6490 Ft', 'nincs'),
(10, 'The Binding of Isaac', 2011, 9, 'Roguelike, action-adventure', '5990 Ft', 'van'),
(11, 'Deathloop', 2021, 10, 'First-person shooter', '18990 Ft', 'van'),
(12, 'Resident Evil 4 Remake', 2023, 2, 'Survival horror', '20990 Ft', 'nincs'),
(13, 'Call of Duty Black Ops 6', 2024, 11, 'First-person shooter', '24990 Ft', 'van'),
(14, 'Valorant', 2020, 12, 'Tactical shooter', 'Ingyenes', 'van'),
(15, 'Rocket League', 2015, 13, 'Sports', 'Ingyenes', 'van');

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
-- A tábla indexei `ertekelesek`
--
ALTER TABLE `ertekelesek`
  ADD PRIMARY KEY (`ertekeles_id`),
  ADD KEY `felhasznalo_id` (`felhasznalo_id`),
  ADD KEY `jatek_id` (`jatek_id`);

--
-- A tábla indexei `fejlesztok`
--
ALTER TABLE `fejlesztok`
  ADD PRIMARY KEY (`fejleszto_id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`felhasznalo_id`),
  ADD UNIQUE KEY `felhasznalonev` (`felhasznalonev`),
  ADD UNIQUE KEY `email` (`email`);

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
ALTER TABLE `ertekelesek`
  MODIFY `ertekeles_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `fejlesztok`
--
ALTER TABLE `fejlesztok`
  MODIFY `fejleszto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `felhasznalo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Megkötések a táblához `ertekelesek`
--
ALTER TABLE `ertekelesek`
  ADD CONSTRAINT `ertekelesek_ibfk_1` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalok` (`felhasznalo_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ertekelesek_ibfk_2` FOREIGN KEY (`jatek_id`) REFERENCES `jatekok` (`jatek_id`) ON DELETE CASCADE;

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
