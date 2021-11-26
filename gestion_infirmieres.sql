-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 24 nov. 2021 à 12:58
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_infirmieres`
--

-- --------------------------------------------------------

--
-- Structure de la table `anamnese`
--

DROP TABLE IF EXISTS `anamnese`;
CREATE TABLE IF NOT EXISTS `anamnese` (
  `id_anamnese` int(11) NOT NULL,
  `pulsation` int(3) NOT NULL,
  `oxygene` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tension` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_anamnese`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipe_infirmiere`
--

DROP TABLE IF EXISTS `equipe_infirmiere`;
CREATE TABLE IF NOT EXISTS `equipe_infirmiere` (
  `numero_inami_groupe` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_inami` int(11) NOT NULL,
  PRIMARY KEY (`numero_inami_groupe`),
  KEY `numero_inami` (`numero_inami`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fiche_de_soin`
--

DROP TABLE IF EXISTS `fiche_de_soin`;
CREATE TABLE IF NOT EXISTS `fiche_de_soin` (
  `id_tournees` int(11) NOT NULL,
  `id_soins` int(11) NOT NULL,
  `nn_patient` int(11) NOT NULL,
  KEY `id_tournees` (`id_tournees`),
  KEY `id_soins` (`id_soins`),
  KEY `nn_patient` (`nn_patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `infirmieres`
--

DROP TABLE IF EXISTS `infirmieres`;
CREATE TABLE IF NOT EXISTS `infirmieres` (
  `numero_inami` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_mail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_telephone` int(20) NOT NULL,
  PRIMARY KEY (`numero_inami`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `kine`
--

DROP TABLE IF EXISTS `kine`;
CREATE TABLE IF NOT EXISTS `kine` (
  `nn_inami` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_telephone` int(15) NOT NULL,
  `nn_patient` int(11) NOT NULL,
  PRIMARY KEY (`nn_inami`),
  KEY `nn_patient` (`nn_patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `nn_inami` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_telephone` int(15) NOT NULL,
  PRIMARY KEY (`nn_inami`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mutuelles`
--

DROP TABLE IF EXISTS `mutuelles`;
CREATE TABLE IF NOT EXISTS `mutuelles` (
  `numero_mutuelle` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siege_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nn_patient` int(11) NOT NULL,
  PRIMARY KEY (`numero_mutuelle`),
  KEY `nn_patient` (`nn_patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `numero_tournee`
--

DROP TABLE IF EXISTS `numero_tournee`;
CREATE TABLE IF NOT EXISTS `numero_tournee` (
  `numero_inami` int(11) NOT NULL,
  `id_tournees` int(11) NOT NULL,
  KEY `numero_inami` (`numero_inami`),
  KEY `id_tournees` (`id_tournees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `passages`
--

DROP TABLE IF EXISTS `passages`;
CREATE TABLE IF NOT EXISTS `passages` (
  `id_passages` int(11) NOT NULL,
  `heure_theorique` time NOT NULL,
  `heure_reelle` time NOT NULL,
  `id_tournees` int(11) NOT NULL,
  PRIMARY KEY (`id_passages`),
  KEY `id_tournees` (`id_tournees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `nn_patient` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_telephone` int(15) NOT NULL,
  `nn_perso_contact` int(11) NOT NULL,
  PRIMARY KEY (`nn_patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
CREATE TABLE IF NOT EXISTS `prescription` (
  `numero_prescription` int(11) NOT NULL,
  `justificatif` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_prescription` date NOT NULL,
  `date_fin` date NOT NULL,
  `nn_inami` int(11) NOT NULL,
  PRIMARY KEY (`numero_prescription`),
  KEY `nn_inami` (`nn_inami`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rapport_j`
--

DROP TABLE IF EXISTS `rapport_j`;
CREATE TABLE IF NOT EXISTS `rapport_j` (
  `id_rapport` int(11) NOT NULL,
  `observation` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_anamnese` int(11) NOT NULL,
  `nn_patient` int(11) NOT NULL,
  PRIMARY KEY (`id_rapport`),
  KEY `id_anamnese` (`id_anamnese`),
  KEY `nn_patient` (`nn_patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `soins`
--

DROP TABLE IF EXISTS `soins`;
CREATE TABLE IF NOT EXISTS `soins` (
  `id_soins` int(11) NOT NULL,
  `libelle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomenclature` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_prescription` int(11) NOT NULL,
  PRIMARY KEY (`id_soins`),
  KEY `id_prescription` (`id_prescription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tournees`
--

DROP TABLE IF EXISTS `tournees`;
CREATE TABLE IF NOT EXISTS `tournees` (
  `id_tournees` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id_tournees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `equipe_infirmiere`
--
ALTER TABLE `equipe_infirmiere`
  ADD CONSTRAINT `equipe_infirmiere_ibfk_1` FOREIGN KEY (`numero_inami`) REFERENCES `infirmieres` (`numero_inami`);

--
-- Contraintes pour la table `fiche_de_soin`
--
ALTER TABLE `fiche_de_soin`
  ADD CONSTRAINT `fiche_de_soin_ibfk_1` FOREIGN KEY (`id_soins`) REFERENCES `soins` (`id_soins`),
  ADD CONSTRAINT `fiche_de_soin_ibfk_2` FOREIGN KEY (`nn_patient`) REFERENCES `patient` (`nn_patient`),
  ADD CONSTRAINT `fiche_de_soin_ibfk_3` FOREIGN KEY (`id_tournees`) REFERENCES `tournees` (`id_tournees`);

--
-- Contraintes pour la table `kine`
--
ALTER TABLE `kine`
  ADD CONSTRAINT `kine_ibfk_1` FOREIGN KEY (`nn_patient`) REFERENCES `patient` (`nn_patient`);

--
-- Contraintes pour la table `mutuelles`
--
ALTER TABLE `mutuelles`
  ADD CONSTRAINT `mutuelles_ibfk_1` FOREIGN KEY (`nn_patient`) REFERENCES `patient` (`nn_patient`);

--
-- Contraintes pour la table `numero_tournee`
--
ALTER TABLE `numero_tournee`
  ADD CONSTRAINT `numero_tournee_ibfk_1` FOREIGN KEY (`id_tournees`) REFERENCES `tournees` (`id_tournees`),
  ADD CONSTRAINT `numero_tournee_ibfk_2` FOREIGN KEY (`numero_inami`) REFERENCES `infirmieres` (`numero_inami`);

--
-- Contraintes pour la table `passages`
--
ALTER TABLE `passages`
  ADD CONSTRAINT `passages_ibfk_1` FOREIGN KEY (`id_tournees`) REFERENCES `tournees` (`id_tournees`);

--
-- Contraintes pour la table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`nn_inami`) REFERENCES `medecin` (`nn_inami`);

--
-- Contraintes pour la table `rapport_j`
--
ALTER TABLE `rapport_j`
  ADD CONSTRAINT `rapport_j_ibfk_1` FOREIGN KEY (`id_anamnese`) REFERENCES `anamnese` (`id_anamnese`),
  ADD CONSTRAINT `rapport_j_ibfk_2` FOREIGN KEY (`nn_patient`) REFERENCES `patient` (`nn_patient`);

--
-- Contraintes pour la table `soins`
--
ALTER TABLE `soins`
  ADD CONSTRAINT `soins_ibfk_1` FOREIGN KEY (`id_prescription`) REFERENCES `prescription` (`numero_prescription`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
