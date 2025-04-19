-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 19, 2025 alle 12:59
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datab matrimonio`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `budget`
--

CREATE TABLE `budget` (
  `ID_Budget` int(11) NOT NULL,
  `importo_totale` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ID_Matrimonio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `budget`
--

INSERT INTO `budget` (`ID_Budget`, `importo_totale`, `ID_Matrimonio`) VALUES
(1, 6000.00, 1),
(2, 40000.00, 2),
(3, 10000.00, 3),
(4, 123123.00, 4),
(5, 8000.00, 5),
(8, 8750.00, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `ID_Categoria` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`ID_Categoria`, `nome`) VALUES
(1, 'Famiglia'),
(2, 'Amici'),
(3, 'Colleghi'),
(4, 'Altro');

-- --------------------------------------------------------

--
-- Struttura della tabella `evento`
--

CREATE TABLE `evento` (
  `ID_Evento` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `data` date NOT NULL,
  `ora` time DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `ID_Matrimonio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `evento`
--

INSERT INTO `evento` (`ID_Evento`, `nome`, `data`, `ora`, `descrizione`, `location`, `ID_Matrimonio`) VALUES
(4, 'Capelli e trucco', '2026-09-01', '09:10:00', 'Arrivo parrucchiera per la sposa alle 9.00', 'Casa', 1),
(5, 'chiesa', '2026-09-01', '11:30:00', 'celebrazione matrimonio napoli', 'Chiesa Del Rosario (NA)', 1),
(11, 'taglio della torta', '2026-01-01', '18:00:00', '', 'ristorante', 2),
(12, 'ricevimento', '2025-08-08', '13:00:00', 'evento', 'locale', 3),
(17, 'chiesa', '2026-05-05', '11:00:00', '', 'chiesa', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `invitato`
--

CREATE TABLE `invitato` (
  `ID_Invitato` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `conferma` enum('in attesa','confermato','rifiutato') NOT NULL DEFAULT 'in attesa',
  `ID_Utente` int(11) DEFAULT NULL,
  `ID_Matrimonio` int(11) NOT NULL,
  `ID_Categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `invitato`
--

INSERT INTO `invitato` (`ID_Invitato`, `nome`, `cognome`, `email`, `telefono`, `conferma`, `ID_Utente`, `ID_Matrimonio`, `ID_Categoria`) VALUES
(2, 'giuseppe', 'volpe', 'giuseppevolpe@email.it', '3336669944', 'in attesa', NULL, 1, 3),
(3, 'Valentino', 'Russo', 'valentinorusso@email.it', '', 'confermato', NULL, 1, 1),
(5, 'Nicola', 'Giglio', 'nicolagiglio@email.it', '', 'rifiutato', NULL, 1, 4),
(13, 'Giuseppe', 'Gigli', 'peppeg5@email.it', '3948454326', 'in attesa', 20, 3, 4),
(16, 'marco', 'rissu', 'inv111@email.it', '3645982548', 'confermato', 26, 3, 2),
(18, 'giacomo77', NULL, 'giacomo77@email.it', NULL, 'in attesa', 5, 1, 2),
(19, 'Armando', 'delli', 'lkjhpol@email.it', '', 'confermato', 27, 3, 2),
(21, 'Gennaro', 'Fassio', 'qazwsx@email.it', '3245945852', 'rifiutato', 29, 3, 3),
(22, 'anna', 'cutuli', 'anna6@email.it', '31245565966', 'confermato', 33, 3, 1),
(23, 'giuseppe', 'uno', '', '', 'confermato', NULL, 3, 4),
(30, 'Leonardo', 'testi', 'leo55@email.it', '321452356', 'in attesa', 28, 3, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `invite_token`
--

CREATE TABLE `invite_token` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `wedding_id` int(11) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) DEFAULT 0,
  `ID_Ruolo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `invite_token`
--

INSERT INTO `invite_token` (`id`, `token`, `wedding_id`, `expires_at`, `used`, `ID_Ruolo`) VALUES
(20, 'f6019b71ac0007dd5b41be7c7bbdd1cd0b8c6c2aa968f6b4e154fbc2bea0e28e', 1, '2025-03-27 17:18:09', 1, 3),
(21, 'ae1a8bbdb0ce770fe2d976c020aeec3d6f724f34448970fcb9d385ac291fff4a', 1, '2025-03-27 21:51:38', 0, 3),
(25, '671b163ec02584fa9f17668fe854396688c9957461f2db5ee2b45b50134c09d6', 3, '2025-03-28 14:49:57', 1, 3),
(26, '796f2422b4406eabc04b5d6280bfbad99a406594e83ace9e0606b655913e0a31', 3, '2025-03-28 15:01:29', 1, 3),
(28, 'dd36546910b2512ebe12dcbc6fb7e5ca5bf4ca5a18a80fbe0d9edb88440c78aa', 2, '2025-03-28 15:04:43', 1, 3),
(29, 'a930c9f7df716fdda5461af8380d1c5e2dedd1f56e5ce1b327ea0c1c55f6ffd9', 3, '2025-03-28 17:00:24', 1, 2),
(30, '758b5238c4f62d67d0702032d5080f090551e68715bb6642297eb6a41791171a', 3, '2025-03-29 15:53:33', 1, 3),
(33, '54700c769c73da74b3bc0f1cd785411fd0902b5da12f1c0faf82e4b3c15f3b4b', 3, '2025-03-29 18:28:26', 0, 3),
(37, 'e048a3ebb16d6a55ef743212f651cf9417d8373fe55a9fa048510ec0fe5f4eff', 3, '2025-03-29 18:36:07', 0, 3),
(38, '254b6867e14d962b77d20c678580ecda87f32505df12089b5265539e67edf244', 3, '2025-03-29 18:37:09', 1, 3),
(39, '54324b8b312e4296e8bf4da74ebe9b50bb5089a22fba5d91331777f251ba8991', 3, '2025-03-29 18:38:35', 1, 3),
(40, 'd78bd86aa24543c6a13f949723ca8a87335f1cf7d5b8b2622c740cf2eeae1aca', 3, '2025-03-29 18:41:20', 0, 3),
(41, '6819ce766f06ede1768f4bc08c8b430797dc388ad2a2bd8c20fd9abbb7b8b4db', 3, '2025-03-29 18:42:58', 1, 3),
(42, '55b003089baa8c750fd6d46e0466536919fc9e7f018d9b71a61858049d71007f', 3, '2025-03-29 18:44:26', 0, 2),
(43, '3e33076761a85c13bda90492e47adf52d6861145b02978ba4b536b3d29b48c84', 3, '2025-03-30 20:39:32', 1, 3),
(44, '20005b6119c444515fd181ff557764878acf80ed9fe83bde10c3918957d0ebc8', 3, '2025-03-31 13:47:12', 1, 3),
(45, 'cceb6c5d8b383936eacfa8359245e37420b942ccba5914e096638da8bf350071', 3, '2025-03-31 15:13:04', 0, 3),
(46, '1fedbba603637acc7b84136e279e1d01ed51a5e4168b99f269846a5df9e5002e', 3, '2025-03-31 15:19:04', 0, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `matrimonio`
--

CREATE TABLE `matrimonio` (
  `ID_Matrimonio` int(11) NOT NULL,
  `data` date NOT NULL,
  `location` varchar(100) NOT NULL,
  `descrizione` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `matrimonio`
--

INSERT INTO `matrimonio` (`ID_Matrimonio`, `data`, `location`, `descrizione`) VALUES
(1, '2026-09-01', 'Rossi Beach', 'Siamo lieti di festeggiare il nostro matrimonio a Rossi Beach in via Lungomare (NA). Il matrimonio si terrà in spiaggia: è preferibile un abbigliamento casual, ma elegante.'),
(2, '2026-06-26', 'Heaven Resort', 'Noi sposi Francesco E Marianna siamo felici di invitarvi al nostro matrimonio a Heaven Resort situato a Firenze'),
(3, '2025-10-10', 'Villa del Borgo', 'matrimonio di chiara e federico matri80'),
(4, '0101-01-01', 'matrimonio di Giovi e Leo', 'siamo onorati di annunciare il nostro matrimonio e di invitarvi all\'evento'),
(5, '2027-04-01', 'luogo', 'descr'),
(6, '2026-01-01', 'location', 'descrizione');

-- --------------------------------------------------------

--
-- Struttura della tabella `notifica`
--

CREATE TABLE `notifica` (
  `ID_Notifica` int(11) NOT NULL,
  `messaggio` varchar(2000) NOT NULL,
  `data_ora` datetime DEFAULT current_timestamp(),
  `stato` enum('non_letto','letto') NOT NULL DEFAULT 'non_letto',
  `ID_Utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `notifica`
--

INSERT INTO `notifica` (`ID_Notifica`, `messaggio`, `data_ora`, `stato`, `ID_Utente`) VALUES
(21, 'Benvenuto! La tua registrazione è stata completata con successo', '2025-03-23 20:42:48', 'non_letto', 27),
(23, 'Benvenuto! La tua registrazione è stata completata con successo', '2025-03-23 20:53:23', 'letto', 28),
(24, 'L\'invitato Leonardo testi ha rifiutato l\'invito al matrimonio', '2025-03-23 20:55:23', 'non_letto', 7),
(26, 'Benvenuto! La tua registrazione è stata completata con successo', '2025-03-23 21:16:51', 'non_letto', 29),
(27, 'L\'invitato Gennaro Fassio ha rifiutato l\'invito al matrimonio', '2025-03-23 21:18:40', 'non_letto', 7),
(30, 'L\'invitato Leonardo testi ha accettato l\'invito al matrimonio', '2025-03-23 21:27:58', 'letto', 18),
(37, 'Hai confermato la tua presenza al matrimonio', '2025-03-23 21:28:16', 'letto', 28),
(40, 'La tua risposta all\'invito è stata aggiornata come \'in attesa di conferma\'', '2025-03-23 21:28:20', 'letto', 28),
(47, 'L\'invitato Leonardo testi ha rifiutato l\'invito al matrimonio', '2025-03-23 21:38:46', 'letto', 7),
(48, 'L\'invitato Leonardo testi ha rifiutato l\'invito al matrimonio', '2025-03-23 21:38:46', 'letto', 18),
(49, 'Hai comunicato che non potrai partecipare al matrimonio', '2025-03-23 21:38:46', 'non_letto', 28),
(50, 'Benvenuti! Il vostro account matrimonio è stato registrato con successo', '2025-03-24 12:53:50', 'non_letto', 30),
(51, 'Benvenuti! Il vostro account matrimonio è stato registrato con successo', '2025-03-24 13:33:03', 'non_letto', 31),
(52, 'Benvenuti! Il vostro account matrimonio è stato registrato con successo', '2025-03-24 13:37:41', 'non_letto', 32),
(53, 'Benvenuto! La tua registrazione è stata completata con successo', '2025-03-24 13:47:38', 'non_letto', 33),
(54, 'L\'invitato anna cutuli ha accettato l\'invito al matrimonio', '2025-03-24 13:48:30', 'non_letto', 7),
(55, 'L\'invitato anna cutuli ha accettato l\'invito al matrimonio', '2025-03-24 13:48:30', 'non_letto', 18),
(56, 'Hai confermato la tua presenza al matrimonio', '2025-03-24 13:48:30', 'non_letto', 33),
(57, 'L\'invitato Leonardo testi ha aggiornato la sua risposta all\'invito al matrimonio', '2025-03-25 21:49:55', 'non_letto', 7),
(58, 'L\'invitato Leonardo testi ha aggiornato la sua risposta all\'invito al matrimonio', '2025-03-25 21:49:55', 'non_letto', 18),
(59, 'La tua risposta all\'invito è stata aggiornata come \'in attesa di conferma\'', '2025-03-25 21:49:55', 'non_letto', 28);

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipazione`
--

CREATE TABLE `partecipazione` (
  `ID_Partecipazione` int(11) NOT NULL,
  `ID_Matrimonio` int(11) NOT NULL,
  `ID_Utente` int(11) NOT NULL,
  `ID_Ruolo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `partecipazione`
--

INSERT INTO `partecipazione` (`ID_Partecipazione`, `ID_Matrimonio`, `ID_Utente`, `ID_Ruolo`) VALUES
(1, 1, 3, 1),
(2, 2, 4, 1),
(3, 1, 5, 3),
(4, 3, 7, 1),
(6, 3, 17, 3),
(7, 3, 18, 2),
(8, 2, 19, 3),
(9, 3, 20, 3),
(10, 3, 21, 3),
(12, 3, 26, 3),
(13, 3, 27, 3),
(14, 3, 28, 3),
(15, 3, 29, 3),
(16, 5, 30, 1),
(17, 6, 31, 1),
(19, 3, 33, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `ruolo`
--

CREATE TABLE `ruolo` (
  `ID_Ruolo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ruolo`
--

INSERT INTO `ruolo` (`ID_Ruolo`, `nome`) VALUES
(1, 'Coppia'),
(2, 'Wedding Planner'),
(3, 'Invitato');

-- --------------------------------------------------------

--
-- Struttura della tabella `spesa`
--

CREATE TABLE `spesa` (
  `ID_Spesa` int(11) NOT NULL,
  `importo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `descrizione` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `ID_Budget` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `spesa`
--

INSERT INTO `spesa` (`ID_Spesa`, `importo`, `descrizione`, `data`, `ID_Budget`) VALUES
(1, 900.00, 'caparra per location', '2025-04-07', 1),
(2, 160.00, 'caparra noleggio auto per sposi', '2025-05-01', 1),
(4, 1000.00, 'acquisto bomboniere', '2025-03-05', 2),
(5, 3500.00, 'costo per abito da sposa', '2025-03-01', 2),
(16, 1527.00, 'spesa', '2025-10-10', 3),
(17, 669.00, 'bomboniere', '2026-05-05', 3),
(18, 5000.00, 'vestito sposa', '2025-10-10', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `ID_Utente` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`ID_Utente`, `username`, `password`, `email`) VALUES
(3, 'coppia3', '$2y$10$fLNgeJ5efJ9nuYmGU39zWe9rjnaBm.hjqv6ok5u1CEih54sGwHnYS', 'coppia3@email.it'),
(4, 'matrimonio26', '$2y$10$C96yTO6xEw7tMA4jI6df6O4S7tWaTwLQAVZluhr1HS5ieki874vbq', 'matrimonio26@email.it'),
(5, 'giacomo77', '$2y$10$QV93lIky88TaCgfrmhCNYuBboob7aPdVhn/k0Qi25rmGBda3fq16e', 'giacomo77@email.it'),
(7, 'matri80', '$2y$10$62smKPovY/48e/0QH4YBJ.mTrSGKCqua2r/fu0HvZWed4qoxvopTS', 'matri80@email.it'),
(17, 'unodue', '$2y$10$MEPP2c8MFD3mNG82qyn36eUdynwsSA8lwr6O1fhHMROJ3sf0fNL8.', 'unodue@email.it'),
(18, 'weddingmatri80', '$2y$10$7fkmSQ0XYHYTcqfSj6UG1OMpUVDE7S/5R2Lw2mSbZ5EHwk4IlNbDG', 'weddingmatri80@email.it'),
(19, 'matrimonio26invitato', '$2y$10$Tiqq/PPVa2Csj3ttXcaFCuuOKGTYsblpDePnEBl7Y7aj8edKjgXNe', 'matrimonio26invitato@email.it'),
(20, 'invitato2matri80', '$2y$10$P78tN/Ukoj/C60UNsUpEE.Hw8HazFX55VCClgttLWNHdZwcyu/QqS', 'invitato2matri80@email.it'),
(21, 'invitato3matri80', '$2y$10$/jznEY3k4GfNt9yvcV5RheslauW7TmCwoD5XibrcTOzH/0h0RmNoi', 'invitato3matri80@email.it'),
(26, 'inv835535', '$2y$10$azy1K7d.JQgzRrACjV9EOupQW.8xLYtbAzmRKGiWAt6rZiSy5FrPK', 'inv111@email.it'),
(27, 'lkjhpol', '$2y$10$KcHfKM8OwYHF53dD935UxOkbgRAY8w.fgZ6XMrLxPAf08H9x2PDli', 'lkjhpol@email.it'),
(28, 'leo55', '$2y$10$SmzOQpfkvkl7Jc9bc6VmYe3Tyidra1JFbHNB.O0r/aOnlEbOVhBlG', 'leo55@email.it'),
(29, 'qazwsx', '$2y$10$Tg25vH0VMYGUQei8BeKC0e48PpfY19Pubz8J9jOiq8dTepevgQHei', 'qazwsx@email.it'),
(30, 'sposi180', '$2y$10$R/Nwl4ZSZjh5EPm7MXxByu17L7/Xo3xl83Dw1Ml6aR2SuXRANPz/q', 'sposi180@email.it'),
(31, 'jematr2', '$2y$10$kv.wlG0bf9WwqD03NJz7sO541LpmE5YF4HNaOx1eygNt8UcDh.ksm', 'jematr2@email.it'),
(32, 'mnbvc', '$2y$10$gpGxSdGLXe87KjbBVMs4p.spf/5gtsOwjMMPsdFhl/LfD3q9vdkt2', 'mnbvc@email.it'),
(33, 'anna61', '$2y$10$ZePh.jKdHJvSSjO8r5cMr.xliFIghP3osViIgou0DMD3F9G0Dun9e', 'anna6@email.it');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `budget`
--
ALTER TABLE `budget`
  ADD PRIMARY KEY (`ID_Budget`),
  ADD UNIQUE KEY `ID_Matrimonio` (`ID_Matrimonio`);

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indici per le tabelle `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`ID_Evento`),
  ADD KEY `ID_Matrimonio` (`ID_Matrimonio`);

--
-- Indici per le tabelle `invitato`
--
ALTER TABLE `invitato`
  ADD PRIMARY KEY (`ID_Invitato`),
  ADD UNIQUE KEY `ID_Utente` (`ID_Utente`),
  ADD KEY `ID_Matrimonio` (`ID_Matrimonio`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indici per le tabelle `invite_token`
--
ALTER TABLE `invite_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wedding_id` (`wedding_id`),
  ADD KEY `ID_Ruolo` (`ID_Ruolo`);

--
-- Indici per le tabelle `matrimonio`
--
ALTER TABLE `matrimonio`
  ADD PRIMARY KEY (`ID_Matrimonio`);

--
-- Indici per le tabelle `notifica`
--
ALTER TABLE `notifica`
  ADD PRIMARY KEY (`ID_Notifica`),
  ADD KEY `ID_Utente` (`ID_Utente`);

--
-- Indici per le tabelle `partecipazione`
--
ALTER TABLE `partecipazione`
  ADD PRIMARY KEY (`ID_Partecipazione`),
  ADD KEY `ID_Matrimonio` (`ID_Matrimonio`),
  ADD KEY `ID_Utente` (`ID_Utente`),
  ADD KEY `ID_Ruolo` (`ID_Ruolo`);

--
-- Indici per le tabelle `ruolo`
--
ALTER TABLE `ruolo`
  ADD PRIMARY KEY (`ID_Ruolo`);

--
-- Indici per le tabelle `spesa`
--
ALTER TABLE `spesa`
  ADD PRIMARY KEY (`ID_Spesa`),
  ADD KEY `ID_Budget` (`ID_Budget`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`ID_Utente`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `budget`
--
ALTER TABLE `budget`
  MODIFY `ID_Budget` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `evento`
--
ALTER TABLE `evento`
  MODIFY `ID_Evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT per la tabella `invitato`
--
ALTER TABLE `invitato`
  MODIFY `ID_Invitato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT per la tabella `invite_token`
--
ALTER TABLE `invite_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT per la tabella `matrimonio`
--
ALTER TABLE `matrimonio`
  MODIFY `ID_Matrimonio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT per la tabella `notifica`
--
ALTER TABLE `notifica`
  MODIFY `ID_Notifica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT per la tabella `partecipazione`
--
ALTER TABLE `partecipazione`
  MODIFY `ID_Partecipazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT per la tabella `ruolo`
--
ALTER TABLE `ruolo`
  MODIFY `ID_Ruolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `spesa`
--
ALTER TABLE `spesa`
  MODIFY `ID_Spesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `ID_Utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `budget`
--
ALTER TABLE `budget`
  ADD CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`ID_Matrimonio`) REFERENCES `matrimonio` (`ID_Matrimonio`);

--
-- Limiti per la tabella `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`ID_Matrimonio`) REFERENCES `matrimonio` (`ID_Matrimonio`);

--
-- Limiti per la tabella `invitato`
--
ALTER TABLE `invitato`
  ADD CONSTRAINT `invitato_ibfk_1` FOREIGN KEY (`ID_Utente`) REFERENCES `utente` (`ID_Utente`),
  ADD CONSTRAINT `invitato_ibfk_2` FOREIGN KEY (`ID_Matrimonio`) REFERENCES `matrimonio` (`ID_Matrimonio`),
  ADD CONSTRAINT `invitato_ibfk_3` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria` (`ID_Categoria`);

--
-- Limiti per la tabella `invite_token`
--
ALTER TABLE `invite_token`
  ADD CONSTRAINT `invite_token_ibfk_1` FOREIGN KEY (`wedding_id`) REFERENCES `matrimonio` (`ID_Matrimonio`),
  ADD CONSTRAINT `invite_token_ibfk_2` FOREIGN KEY (`ID_Ruolo`) REFERENCES `ruolo` (`ID_Ruolo`);

--
-- Limiti per la tabella `notifica`
--
ALTER TABLE `notifica`
  ADD CONSTRAINT `notifica_ibfk_1` FOREIGN KEY (`ID_Utente`) REFERENCES `utente` (`ID_Utente`);

--
-- Limiti per la tabella `partecipazione`
--
ALTER TABLE `partecipazione`
  ADD CONSTRAINT `partecipazione_ibfk_1` FOREIGN KEY (`ID_Matrimonio`) REFERENCES `matrimonio` (`ID_Matrimonio`),
  ADD CONSTRAINT `partecipazione_ibfk_2` FOREIGN KEY (`ID_Utente`) REFERENCES `utente` (`ID_Utente`),
  ADD CONSTRAINT `partecipazione_ibfk_3` FOREIGN KEY (`ID_Ruolo`) REFERENCES `ruolo` (`ID_Ruolo`);

--
-- Limiti per la tabella `spesa`
--
ALTER TABLE `spesa`
  ADD CONSTRAINT `spesa_ibfk_1` FOREIGN KEY (`ID_Budget`) REFERENCES `budget` (`ID_Budget`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
