-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Feb 05, 2023 alle 09:13
-- Versione del server: 10.4.25-MariaDB
-- Versione PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DB`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `acquisto_menu`
--

CREATE TABLE `acquisto_menu` (
  `id_menu` int(11) NOT NULL,
  `id_transazione` int(11) NOT NULL,
  `quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `acquisto_menu`
--

INSERT INTO `acquisto_menu` (`id_menu`, `id_transazione`, `quantita`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `acquisto_piatto`
--

CREATE TABLE `acquisto_piatto` (
  `id_piatto` int(11) NOT NULL,
  `id_transazione` int(11) NOT NULL,
  `quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `acquisto_piatto`
--

INSERT INTO `acquisto_piatto` (`id_piatto`, `id_transazione`, `quantita`) VALUES
(1, 1, 1),
(1, 3, 15),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `AZIENDA`
--

CREATE TABLE `AZIENDA` (
  `email` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `id_azienda` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `locazione` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `AZIENDA`
--

INSERT INTO `AZIENDA` (`email`, `telefono`, `id_azienda`, `nome`, `locazione`) VALUES
('amadori@amadori.com', '1245678', 1, 'amadori', 'via amadori 567'),
('orogel.orogel.com', '98765432', 2, 'orogel', 'via orogel 8746');

-- --------------------------------------------------------

--
-- Struttura della tabella `composizione_menu`
--

CREATE TABLE `composizione_menu` (
  `id_menu` int(11) NOT NULL,
  `id_piatto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `composizione_menu`
--

INSERT INTO `composizione_menu` (`id_menu`, `id_piatto`) VALUES
(2, 1),
(2, 2),
(1, 3),
(2, 4),
(1, 5),
(1, 6),
(2, 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `FORNITORI`
--

CREATE TABLE `FORNITORI` (
  `id_fornitori` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `residenza` varchar(100) NOT NULL,
  `id_azienda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `FORNITORI`
--

INSERT INTO `FORNITORI` (`id_fornitori`, `email`, `telefono`, `nome`, `cognome`, `residenza`, `id_azienda`) VALUES
(1, 'pinco@pallino.it', '87924376', 'pinco', 'pallino', 'via casaDiPinco 444', 1),
(2, 'pippo@baldo.com', '123456847658', 'pippo', 'baldo', 'via garibaldi 723', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `INGREDIENTE`
--

CREATE TABLE `INGREDIENTE` (
  `id_ingrediente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descrizione` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `INGREDIENTE`
--

INSERT INTO `INGREDIENTE` (`id_ingrediente`, `nome`, `descrizione`) VALUES
(1, 'carne macinata di manzo', 'carne macinata di manzo'),
(2, 'patate', 'patate'),
(3, 'bottiglie d\'acqua', 'bottiglie d\'acqua da 0,5L'),
(4, 'cipolla', 'cipolla'),
(5, 'radicchio', 'radicchio'),
(6, 'zucchine', 'zucchine'),
(7, 'melanzane', 'melanzane');

-- --------------------------------------------------------

--
-- Struttura della tabella `inventario`
--

CREATE TABLE `inventario` (
  `id_ingrediente` int(11) NOT NULL,
  `id_ristorante` int(11) NOT NULL,
  `rimanenza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `MENU`
--

CREATE TABLE `MENU` (
  `id_menu` int(11) NOT NULL,
  `descrizione` varchar(1000) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `MENU`
--

INSERT INTO `MENU` (`id_menu`, `descrizione`, `nome`) VALUES
(1, 'menù a base di verdure per vegetariani', 'menu vegetariano'),
(2, 'classico menu con hamburger patatine e coca cola', 'menù classic');

-- --------------------------------------------------------

--
-- Struttura della tabella `menu_offerti`
--

CREATE TABLE `menu_offerti` (
  `id_menu` int(11) NOT NULL,
  `id_ristorante` int(11) NOT NULL,
  `prezzo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `menu_offerti`
--

INSERT INTO `menu_offerti` (`id_menu`, `id_ristorante`, `prezzo`) VALUES
(1, 1, '14.00'),
(2, 1, '10.00'),
(1, 2, '12.50'),
(2, 3, '17.00');

-- --------------------------------------------------------

--
-- Struttura della tabella `PERSONALE`
--

CREATE TABLE `PERSONALE` (
  `id_personale` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `stipendio` decimal(10,2) NOT NULL,
  `percentuale` int(10) NOT NULL,
  `IBAN` varchar(100) NOT NULL,
  `fine_contratto` date NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `residenza` varchar(100) NOT NULL,
  `inizio_contratto` date NOT NULL,
  `id_ristorante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `PERSONALE`
--

INSERT INTO `PERSONALE` (`id_personale`, `email`, `telefono`, `stipendio`, `percentuale`, `IBAN`, `fine_contratto`, `nome`, `cognome`, `residenza`, `inizio_contratto`, `id_ristorante`) VALUES
(1, 'a', '1', '0.00', 1, '1', '2023-02-28', '1', '1', '1', '2023-02-08', 1),
(2, 'pintusgiuseppe01@gmail.com', '3496117720', '1234.00', 0, 'awefqwefcqw', '2023-02-17', 'giuseppe', 'pintus', 'via cesena', '2023-02-07', 1),
(4, 'asdgfads', 'asdfas', '0.00', 1, 'asdf', '2023-02-24', 'asfgadf', 'asdfa', 'asdf', '2023-02-15', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `piatti_offerti`
--

CREATE TABLE `piatti_offerti` (
  `id_piatto` int(11) NOT NULL,
  `id_ristorante` int(11) NOT NULL,
  `prezzo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `piatti_offerti`
--

INSERT INTO `piatti_offerti` (`id_piatto`, `id_ristorante`, `prezzo`) VALUES
(1, 1, '3.99'),
(2, 1, '8.99'),
(6, 1, '1.50');

-- --------------------------------------------------------

--
-- Struttura della tabella `PIATTO`
--

CREATE TABLE `PIATTO` (
  `id_piatto` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descrizione` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `PIATTO`
--

INSERT INTO `PIATTO` (`id_piatto`, `nome`, `descrizione`) VALUES
(1, 'patatine fritte', 'patatine fritte'),
(2, 'hamburger di manzo', 'carne macinata di manzo a forma di cerchio, peso stima 100g'),
(3, 'verdure grigliate', 'set base di verdure grigliate, comprende :melanzane, zuchine, cipolla, radicchio.'),
(4, 'coca cola', 'bevanda a base di latte di cocco'),
(5, 'hamburger di soia', 'hamburger per vegetariani'),
(6, 'acqua minerale', 'bottiglia di acqua minerale'),
(7, 'gelato classic', 'gelato alla vaniglia');

-- --------------------------------------------------------

--
-- Struttura della tabella `ricetta`
--

CREATE TABLE `ricetta` (
  `id_ingrediente` int(11) NOT NULL,
  `id_piatto` int(11) NOT NULL,
  `quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `ricetta`
--

INSERT INTO `ricetta` (`id_ingrediente`, `id_piatto`, `quantita`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 6, 1),
(4, 3, 1),
(5, 3, 1),
(6, 3, 1),
(7, 3, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `RIFORNIMENTO`
--

CREATE TABLE `RIFORNIMENTO` (
  `data_richiesta` date NOT NULL,
  `data_consegna` date DEFAULT NULL,
  `costo` decimal(10,2) NOT NULL,
  `quantita` int(11) NOT NULL,
  `id_rifornimento` int(10) NOT NULL,
  `id_fornitori` int(11) NOT NULL,
  `id_ristorante` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `RIFORNIMENTO`
--

INSERT INTO `RIFORNIMENTO` (`data_richiesta`, `data_consegna`, `costo`, `quantita`, `id_rifornimento`, `id_fornitori`, `id_ristorante`, `id_ingrediente`) VALUES
('2023-02-08', '2023-02-05', '5000.00', 34, 1, 1, 1, 7),
('2023-02-02', '2023-02-05', '234.00', 2, 2, 1, 1, 5),
('2023-02-02', NULL, '540.00', 3, 3, 1, 1, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `RISTORANTE`
--

CREATE TABLE `RISTORANTE` (
  `id_ristorante` int(11) NOT NULL,
  `locazione` varchar(100) NOT NULL,
  `tassa_proprieta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `RISTORANTE`
--

INSERT INTO `RISTORANTE` (`id_ristorante`, `locazione`, `tassa_proprieta`) VALUES
(1, 'via università 50', '10000'),
(2, 'forli ', '250'),
(3, 'milano ', '25000');

-- --------------------------------------------------------

--
-- Struttura della tabella `SCONTO`
--

CREATE TABLE `SCONTO` (
  `id_sconto` int(11) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  `percentuale` int(11) NOT NULL,
  `id_ristorante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `sconto_menu`
--

CREATE TABLE `sconto_menu` (
  `id_menu` int(11) NOT NULL,
  `id_sconto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `sconto_piatto`
--

CREATE TABLE `sconto_piatto` (
  `id_piatto` int(11) NOT NULL,
  `id_sconto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `TRANSAZIONE`
--

CREATE TABLE `TRANSAZIONE` (
  `costo_totale` decimal(10,2) NOT NULL,
  `data` date NOT NULL,
  `id_transazione` int(11) NOT NULL,
  `id_ristorante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `TRANSAZIONE`
--

INSERT INTO `TRANSAZIONE` (`costo_totale`, `data`, `id_transazione`, `id_ristorante`) VALUES
('17.99', '2023-02-15', 1, 1),
('14.00', '2023-02-22', 2, 1),
('14.00', '2023-02-18', 3, 1),
('17.99', '2018-02-16', 4, 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `acquisto_menu`
--
ALTER TABLE `acquisto_menu`
  ADD PRIMARY KEY (`id_transazione`,`id_menu`),
  ADD UNIQUE KEY `ID_acquisto_menu_IND` (`id_transazione`,`id_menu`),
  ADD KEY `REF_acqui_MENU_IND` (`id_menu`);

--
-- Indici per le tabelle `acquisto_piatto`
--
ALTER TABLE `acquisto_piatto`
  ADD PRIMARY KEY (`id_piatto`,`id_transazione`),
  ADD UNIQUE KEY `ID_acquisto_piatto_IND` (`id_piatto`,`id_transazione`),
  ADD KEY `REF_acqui_TRANS_IND` (`id_transazione`);

--
-- Indici per le tabelle `AZIENDA`
--
ALTER TABLE `AZIENDA`
  ADD PRIMARY KEY (`id_azienda`),
  ADD UNIQUE KEY `ID_AZIENDA_IND` (`id_azienda`);

--
-- Indici per le tabelle `composizione_menu`
--
ALTER TABLE `composizione_menu`
  ADD PRIMARY KEY (`id_piatto`,`id_menu`),
  ADD UNIQUE KEY `ID_composizione_menu_IND` (`id_piatto`,`id_menu`),
  ADD KEY `REF_compo_MENU_IND` (`id_menu`);

--
-- Indici per le tabelle `FORNITORI`
--
ALTER TABLE `FORNITORI`
  ADD PRIMARY KEY (`id_fornitori`),
  ADD UNIQUE KEY `ID_FORNITORI_IND` (`id_fornitori`),
  ADD KEY `REF_FORNI_AZIEN_IND` (`id_azienda`);

--
-- Indici per le tabelle `INGREDIENTE`
--
ALTER TABLE `INGREDIENTE`
  ADD PRIMARY KEY (`id_ingrediente`),
  ADD UNIQUE KEY `ID_INGREDIENTE_IND` (`id_ingrediente`);

--
-- Indici per le tabelle `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_ristorante`,`id_ingrediente`),
  ADD UNIQUE KEY `ID_inventario_IND` (`id_ristorante`,`id_ingrediente`),
  ADD KEY `REF_inven_INGRE_IND` (`id_ingrediente`);

--
-- Indici per le tabelle `MENU`
--
ALTER TABLE `MENU`
  ADD PRIMARY KEY (`id_menu`),
  ADD UNIQUE KEY `ID_MENU_IND` (`id_menu`);

--
-- Indici per le tabelle `menu_offerti`
--
ALTER TABLE `menu_offerti`
  ADD PRIMARY KEY (`id_ristorante`,`id_menu`),
  ADD UNIQUE KEY `ID_menu_offerti_IND` (`id_ristorante`,`id_menu`);

--
-- Indici per le tabelle `PERSONALE`
--
ALTER TABLE `PERSONALE`
  ADD PRIMARY KEY (`id_personale`),
  ADD UNIQUE KEY `ID_PERSONALE_IND` (`id_personale`),
  ADD KEY `REF_PERSO_RISTO_IND` (`id_ristorante`);

--
-- Indici per le tabelle `piatti_offerti`
--
ALTER TABLE `piatti_offerti`
  ADD PRIMARY KEY (`id_ristorante`,`id_piatto`),
  ADD UNIQUE KEY `SID_piatt_PIATT_ID` (`id_piatto`),
  ADD UNIQUE KEY `ID_piatti_offerti_IND` (`id_ristorante`,`id_piatto`),
  ADD UNIQUE KEY `SID_piatt_PIATT_IND` (`id_piatto`);

--
-- Indici per le tabelle `PIATTO`
--
ALTER TABLE `PIATTO`
  ADD PRIMARY KEY (`id_piatto`),
  ADD UNIQUE KEY `ID_PIATTO_IND` (`id_piatto`);

--
-- Indici per le tabelle `ricetta`
--
ALTER TABLE `ricetta`
  ADD PRIMARY KEY (`id_ingrediente`,`id_piatto`),
  ADD UNIQUE KEY `ID_ricetta_IND` (`id_ingrediente`,`id_piatto`),
  ADD KEY `REF_ricet_PIATT_IND` (`id_piatto`);

--
-- Indici per le tabelle `RIFORNIMENTO`
--
ALTER TABLE `RIFORNIMENTO`
  ADD PRIMARY KEY (`id_rifornimento`),
  ADD UNIQUE KEY `ID_RIFORNIMENTO_IND` (`id_rifornimento`),
  ADD KEY `FKR_2_IND` (`id_fornitori`),
  ADD KEY `FKR_1_IND` (`id_ristorante`),
  ADD KEY `FKR_IND` (`id_ingrediente`);

--
-- Indici per le tabelle `RISTORANTE`
--
ALTER TABLE `RISTORANTE`
  ADD PRIMARY KEY (`id_ristorante`),
  ADD UNIQUE KEY `ID_RISTORANTE_IND` (`id_ristorante`);

--
-- Indici per le tabelle `SCONTO`
--
ALTER TABLE `SCONTO`
  ADD PRIMARY KEY (`id_sconto`),
  ADD UNIQUE KEY `ID_SCONTO_IND` (`id_sconto`),
  ADD KEY `REF_SCONT_RISTO_IND` (`id_ristorante`);

--
-- Indici per le tabelle `sconto_menu`
--
ALTER TABLE `sconto_menu`
  ADD PRIMARY KEY (`id_menu`,`id_sconto`),
  ADD UNIQUE KEY `ID_sconto_menu_IND` (`id_menu`,`id_sconto`),
  ADD KEY `REF_scont_SCONT_1_IND` (`id_sconto`);

--
-- Indici per le tabelle `sconto_piatto`
--
ALTER TABLE `sconto_piatto`
  ADD PRIMARY KEY (`id_piatto`,`id_sconto`),
  ADD UNIQUE KEY `ID_sconto_piatto_IND` (`id_piatto`,`id_sconto`),
  ADD KEY `REF_scont_SCONT_IND` (`id_sconto`);

--
-- Indici per le tabelle `TRANSAZIONE`
--
ALTER TABLE `TRANSAZIONE`
  ADD PRIMARY KEY (`id_transazione`),
  ADD UNIQUE KEY `ID_TRANSAZIONE_IND` (`id_transazione`),
  ADD KEY `REF_TRANS_RISTO_IND` (`id_ristorante`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `AZIENDA`
--
ALTER TABLE `AZIENDA`
  MODIFY `id_azienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `FORNITORI`
--
ALTER TABLE `FORNITORI`
  MODIFY `id_fornitori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `INGREDIENTE`
--
ALTER TABLE `INGREDIENTE`
  MODIFY `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `MENU`
--
ALTER TABLE `MENU`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `PERSONALE`
--
ALTER TABLE `PERSONALE`
  MODIFY `id_personale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `PIATTO`
--
ALTER TABLE `PIATTO`
  MODIFY `id_piatto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `RIFORNIMENTO`
--
ALTER TABLE `RIFORNIMENTO`
  MODIFY `id_rifornimento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `RISTORANTE`
--
ALTER TABLE `RISTORANTE`
  MODIFY `id_ristorante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `SCONTO`
--
ALTER TABLE `SCONTO`
  MODIFY `id_sconto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `TRANSAZIONE`
--
ALTER TABLE `TRANSAZIONE`
  MODIFY `id_transazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `acquisto_menu`
--
ALTER TABLE `acquisto_menu`
  ADD CONSTRAINT `REF_acqui_MENU_FK` FOREIGN KEY (`id_menu`) REFERENCES `MENU` (`id_menu`),
  ADD CONSTRAINT `REF_acqui_TRANS_1` FOREIGN KEY (`id_transazione`) REFERENCES `TRANSAZIONE` (`id_transazione`);

--
-- Limiti per la tabella `acquisto_piatto`
--
ALTER TABLE `acquisto_piatto`
  ADD CONSTRAINT `REF_acqui_PIATT` FOREIGN KEY (`id_piatto`) REFERENCES `PIATTO` (`id_piatto`),
  ADD CONSTRAINT `REF_acqui_TRANS_FK` FOREIGN KEY (`id_transazione`) REFERENCES `TRANSAZIONE` (`id_transazione`);

--
-- Limiti per la tabella `composizione_menu`
--
ALTER TABLE `composizione_menu`
  ADD CONSTRAINT `REF_compo_MENU_FK` FOREIGN KEY (`id_menu`) REFERENCES `MENU` (`id_menu`),
  ADD CONSTRAINT `REF_compo_PIATT` FOREIGN KEY (`id_piatto`) REFERENCES `PIATTO` (`id_piatto`);

--
-- Limiti per la tabella `FORNITORI`
--
ALTER TABLE `FORNITORI`
  ADD CONSTRAINT `REF_FORNI_AZIEN_FK` FOREIGN KEY (`id_azienda`) REFERENCES `AZIENDA` (`id_azienda`);

--
-- Limiti per la tabella `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `REF_inven_INGRE_FK` FOREIGN KEY (`id_ingrediente`) REFERENCES `INGREDIENTE` (`id_ingrediente`),
  ADD CONSTRAINT `REF_inven_RISTO` FOREIGN KEY (`id_ristorante`) REFERENCES `RISTORANTE` (`id_ristorante`);

--
-- Limiti per la tabella `menu_offerti`
--
ALTER TABLE `menu_offerti`
  ADD CONSTRAINT `REF_menu__RISTO` FOREIGN KEY (`id_ristorante`) REFERENCES `RISTORANTE` (`id_ristorante`),
  ADD CONSTRAINT `SID_menu__MENU_FK` FOREIGN KEY (`id_menu`) REFERENCES `MENU` (`id_menu`);

--
-- Limiti per la tabella `PERSONALE`
--
ALTER TABLE `PERSONALE`
  ADD CONSTRAINT `REF_PERSO_RISTO_FK` FOREIGN KEY (`id_ristorante`) REFERENCES `RISTORANTE` (`id_ristorante`);

--
-- Limiti per la tabella `piatti_offerti`
--
ALTER TABLE `piatti_offerti`
  ADD CONSTRAINT `REF_piatt_RISTO` FOREIGN KEY (`id_ristorante`) REFERENCES `RISTORANTE` (`id_ristorante`),
  ADD CONSTRAINT `SID_piatt_PIATT_FK` FOREIGN KEY (`id_piatto`) REFERENCES `PIATTO` (`id_piatto`);

--
-- Limiti per la tabella `ricetta`
--
ALTER TABLE `ricetta`
  ADD CONSTRAINT `REF_ricet_INGRE` FOREIGN KEY (`id_ingrediente`) REFERENCES `INGREDIENTE` (`id_ingrediente`),
  ADD CONSTRAINT `REF_ricet_PIATT_FK` FOREIGN KEY (`id_piatto`) REFERENCES `PIATTO` (`id_piatto`);

--
-- Limiti per la tabella `RIFORNIMENTO`
--
ALTER TABLE `RIFORNIMENTO`
  ADD CONSTRAINT `FKR_1_FK` FOREIGN KEY (`id_ristorante`) REFERENCES `RISTORANTE` (`id_ristorante`),
  ADD CONSTRAINT `FKR_2_FK` FOREIGN KEY (`id_fornitori`) REFERENCES `FORNITORI` (`id_fornitori`),
  ADD CONSTRAINT `FKR_FK` FOREIGN KEY (`id_ingrediente`) REFERENCES `INGREDIENTE` (`id_ingrediente`);

--
-- Limiti per la tabella `SCONTO`
--
ALTER TABLE `SCONTO`
  ADD CONSTRAINT `REF_SCONT_RISTO_FK` FOREIGN KEY (`id_ristorante`) REFERENCES `RISTORANTE` (`id_ristorante`);

--
-- Limiti per la tabella `sconto_menu`
--
ALTER TABLE `sconto_menu`
  ADD CONSTRAINT `REF_scont_MENU` FOREIGN KEY (`id_menu`) REFERENCES `MENU` (`id_menu`),
  ADD CONSTRAINT `REF_scont_SCONT_1_FK` FOREIGN KEY (`id_sconto`) REFERENCES `SCONTO` (`id_sconto`);

--
-- Limiti per la tabella `sconto_piatto`
--
ALTER TABLE `sconto_piatto`
  ADD CONSTRAINT `REF_scont_PIATT` FOREIGN KEY (`id_piatto`) REFERENCES `PIATTO` (`id_piatto`),
  ADD CONSTRAINT `REF_scont_SCONT_FK` FOREIGN KEY (`id_sconto`) REFERENCES `SCONTO` (`id_sconto`);

--
-- Limiti per la tabella `TRANSAZIONE`
--
ALTER TABLE `TRANSAZIONE`
  ADD CONSTRAINT `REF_TRANS_RISTO_FK` FOREIGN KEY (`id_ristorante`) REFERENCES `RISTORANTE` (`id_ristorante`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
