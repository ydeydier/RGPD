-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  sam. 07 avr. 2018 à 00:29
-- Version du serveur :  10.1.28-MariaDB
-- Version de PHP :  7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `rgpd`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` int(11) NOT NULL,
  `libelle` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `libelle`) VALUES
(1, 'Identification du traitement'),
(2, 'Acteurs'),
(3, 'DonnÃ©es'),
(4, 'Principes fondamentaux'),
(5, 'Mesures de sÃ©curitÃ© SpÃ©cifiques'),
(6, 'Sous-Traitance'),
(7, 'Transfert(s) hors UE');

-- --------------------------------------------------------

--
-- Structure de la table `champ`
--

CREATE TABLE `champ` (
  `nomChamp` varchar(50) NOT NULL,
  `ordre` int(11) NOT NULL,
  `libelleChamp` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `typeInterface` char(2) NOT NULL COMMENT 'U=une ligne, M=multilignes, ON=oui/non, D=Date, OK=OK/KO',
  `tailleMax` int(11) NOT NULL,
  `afficheDansListe` char(1) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  `masque` char(1) NOT NULL COMMENT 'Masqué : Oui ou Non'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `champ`
--

INSERT INTO `champ` (`nomChamp`, `ordre`, `libelleChamp`, `description`, `typeInterface`, `tailleMax`, `afficheDansListe`, `idCategorie`, `masque`) VALUES
('baseLegale', 250, 'Base lÃ©gale', 'La description', 'M', 400, 'N', 4, 'N'),
('categorieDonnees', 140, 'CatÃ©gories de donnÃ©es personnelles concernÃ©es', 'La description', 'M', 500, 'N', 3, 'N'),
('complementMesures', 390, 'ComplÃ©ment(s)', 'La description', 'M', 400, 'N', 5, 'N'),
('dateCreation', 80, 'Date de crÃ©ation', 'La description', 'D', 10, 'N', 1, 'N'),
('descriptionDonnees', 160, 'Description des donnÃ©es', 'La description', 'M', 400, 'N', 3, 'N'),
('destinataireHorsUE', 430, 'Destinataire(s)', 'La description', 'M', 200, 'N', 7, 'N'),
('destinationDonnees', 210, 'Destination des donnÃ©es (flux de sortie)', 'La description', 'U', 100, 'N', 3, 'N'),
('detailFinalite', 70, 'DÃ©tails de la finalitÃ© du traitement', 'La description', 'M', 400, 'N', 1, 'N'),
('direction', 30, 'Direction', 'La description', 'U', 40, 'O', 1, 'N'),
('dureeConservation', 170, 'La durÃ©e de conservation des donnÃ©es traitÃ©es', 'La description', 'M', 50, 'N', 3, 'N'),
('exactitudeDonnees', 310, 'Exactitude des donnÃ©es', 'La description', 'M', 400, 'N', 4, 'N'),
('finalite', 50, 'FinalitÃ©', 'La description', 'M', 400, 'O', 1, 'N'),
('garantiesHorsUE', 450, 'Type(s) de Garanties', 'La description', 'M', 400, 'N', 7, 'N'),
('integriteConfidentialite', 350, 'IntÃ©gritÃ© et confidentialitÃ©', 'La description', 'M', 400, 'N', 4, 'N'),
('limitationConservation', 330, 'Limitation de la conservation', 'La description', 'M', 400, 'N', 4, 'N'),
('limitationFinalites', 270, 'Limitation des finalitÃ©s', 'La description', 'M', 400, 'N', 4, 'N'),
('LLT', 230, 'LicÃ©itÃ©, loyautÃ© et transparence', 'La description', 'M', 400, 'N', 4, 'N'),
('localisation', 60, 'Localisation du traitement', 'La description', 'U', 40, 'N', 1, 'N'),
('mesuresOrga', 380, 'Mesures organisationnelles', 'La description', 'M', 400, 'N', 5, 'N'),
('mesuresTechniques', 370, 'Mesures techniques', 'La description', 'M', 400, 'N', 5, 'N'),
('minimisationDonnees', 290, 'Minimisation des donnÃ©es', 'La description', 'M', 400, 'N', 4, 'N'),
('nom', 10, 'Nom', 'La description', 'U', 255, 'O', 1, 'N'),
('origineDonnees', 200, 'Origine des donnÃ©es (flux d\'entrÃ©e)', 'La description', 'U', 100, 'N', 3, 'N'),
('paysHorsUE', 440, 'Pays', 'La description', 'M', 200, 'N', 7, 'N'),
('PIA_EIVP_realisee', 190, 'PIA ou EIVP rÃ©alisÃ©e', 'La description', 'ON', 1, 'N', 3, 'N'),
('precisions', 220, 'PrÃ©cision(s)', 'La description', 'M', 400, 'N', 3, 'N'),
('presenceDonneesSensibles', 180, 'PrÃ©sence de donnÃ©es sensibles', 'La description', 'ON', 1, 'O', 3, 'N'),
('presenceSousTrce', 130, 'PrÃ©sence de sous-Traitance', 'La description', 'ON', 1, 'N', 2, 'N'),
('rappelProfils', 150, 'Rappel des profils', 'La description', 'M', 400, 'N', 3, 'N'),
('reference', 20, 'RÃ©f.', 'La description', 'U', 20, 'O', 1, 'N'),
('referent', 120, 'RÃ©fÃ©rent (ReprÃ©sentant)', 'La description', 'U', 40, 'O', 2, 'N'),
('remarqueSousTrt', 420, 'Remarque(s)', 'La description', 'M', 400, 'N', 6, 'N'),
('responsable', 100, 'Responsable du Traitement', 'La description', 'U', 40, 'N', 2, 'N'),
('responsableConjoint', 110, 'Responsable(s) conjoint(s)', 'La description', 'U', 40, 'N', 2, 'N'),
('responsableContratSousTrt', 410, 'Responsable du contrat de sous-traitance', 'La description', 'U', 50, 'N', 6, 'N'),
('service', 40, 'Le ou les services chargÃ©s de le mettre en oeuvre', 'La description', 'U', 40, 'O', 1, 'N'),
('sousTraitants', 400, 'Sous- traitant(s)', 'La description', 'M', 400, 'N', 6, 'N'),
('statutBaseLegale', 260, 'Statut base lÃ©gale', 'La description', 'OK', 1, 'N', 4, 'N'),
('statutExactitudeDonnees', 320, 'Statut - exactitude des donnÃ©es', 'La description', 'OK', 1, 'N', 4, 'N'),
('statutIntegriteConfidentialite', 360, 'Statut intÃ©gritÃ© et confidentialitÃ©', 'La description', 'OK', 1, 'N', 4, 'N'),
('statutLimitationConservation', 340, 'Statut limitation de la conservation', 'La description', 'OK', 1, 'N', 4, 'N'),
('statutLimitationFinalites', 280, 'Statut limitation des finalitÃ©s', 'La description', 'OK', 1, 'N', 4, 'N'),
('statutLLT', 240, 'Statut licÃ©itÃ©, loyautÃ© et transparence', 'La description', 'OK', 1, 'N', 4, 'N'),
('statutMinimisationDonnees', 300, 'Statut minimisation des donnÃ©es', 'La description', 'OK', 1, 'N', 4, 'N'),
('suiviModif', 90, 'suivi des modification', 'La description', 'M', 400, 'N', 1, 'N');

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

CREATE TABLE `traitement` (
  `idTraitement` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `corbeille` char(1) NOT NULL DEFAULT 'N',
  `quimaj` varchar(15) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `reference` varchar(20) DEFAULT NULL,
  `direction` varchar(40) DEFAULT NULL,
  `service` varchar(40) DEFAULT NULL,
  `finalite` varchar(400) DEFAULT NULL,
  `localisation` varchar(40) DEFAULT NULL,
  `detailFinalite` varchar(400) DEFAULT NULL,
  `dateCreation` date DEFAULT NULL,
  `suiviModif` varchar(300) DEFAULT NULL,
  `responsable` varchar(40) DEFAULT NULL,
  `responsableConjoint` varchar(40) DEFAULT NULL,
  `referent` varchar(40) DEFAULT NULL,
  `presenceSousTrce` char(1) DEFAULT NULL,
  `categorieDonnees` varchar(400) DEFAULT NULL,
  `rappelProfils` varchar(300) DEFAULT NULL,
  `descriptionDonnees` varchar(400) DEFAULT NULL,
  `dureeConservation` varchar(50) DEFAULT NULL,
  `presenceDonneesSensibles` char(1) DEFAULT NULL,
  `PIA_EIVP_realisee` char(1) DEFAULT NULL,
  `origineDonnees` varchar(100) DEFAULT NULL,
  `destinationDonnees` varchar(100) DEFAULT NULL,
  `precisions` varchar(300) DEFAULT NULL,
  `LLT` varchar(300) DEFAULT NULL,
  `statutLLT` char(1) DEFAULT NULL,
  `baseLegale` varchar(300) DEFAULT NULL,
  `statutBaseLegale` char(1) DEFAULT NULL,
  `limitationFinalites` varchar(300) DEFAULT NULL,
  `statutLimitationFinalites` char(1) DEFAULT NULL,
  `minimisationDonnees` varchar(300) DEFAULT NULL,
  `statutMinimisationDonnees` char(1) DEFAULT NULL,
  `exactitudeDonnees` varchar(300) DEFAULT NULL,
  `statutExactitudeDonnees` char(1) DEFAULT NULL,
  `limitationConservation` varchar(300) DEFAULT NULL,
  `statutLimitationConservation` char(1) DEFAULT NULL,
  `integriteConfidentialite` varchar(300) DEFAULT NULL,
  `statutIntegriteConfidentialite` char(1) DEFAULT NULL,
  `mesuresTechniques` varchar(300) DEFAULT NULL,
  `mesuresOrga` varchar(300) DEFAULT NULL,
  `complementMesures` varchar(300) DEFAULT NULL,
  `sousTraitants` varchar(300) DEFAULT NULL,
  `responsableContratSousTrt` varchar(50) DEFAULT NULL,
  `remarqueSousTrt` varchar(300) DEFAULT NULL,
  `destinataireHorsUE` varchar(200) DEFAULT NULL,
  `paysHorsUE` varchar(200) DEFAULT NULL,
  `garantiesHorsUE` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `traitement`
--

INSERT INTO `traitement` (`idTraitement`, `timestamp`, `corbeille`, `quimaj`, `nom`, `reference`, `direction`, `service`, `finalite`, `localisation`, `detailFinalite`, `dateCreation`, `suiviModif`, `responsable`, `responsableConjoint`, `referent`, `presenceSousTrce`, `categorieDonnees`, `rappelProfils`, `descriptionDonnees`, `dureeConservation`, `presenceDonneesSensibles`, `PIA_EIVP_realisee`, `origineDonnees`, `destinationDonnees`, `precisions`, `LLT`, `statutLLT`, `baseLegale`, `statutBaseLegale`, `limitationFinalites`, `statutLimitationFinalites`, `minimisationDonnees`, `statutMinimisationDonnees`, `exactitudeDonnees`, `statutExactitudeDonnees`, `limitationConservation`, `statutLimitationConservation`, `integriteConfidentialite`, `statutIntegriteConfidentialite`, `mesuresTechniques`, `mesuresOrga`, `complementMesures`, `sousTraitants`, `responsableContratSousTrt`, `remarqueSousTrt`, `destinataireHorsUE`, `paysHorsUE`, `garantiesHorsUE`) VALUES
(1, '2018-04-06 22:28:05', 'N', 'sdurant', 'Maelis', 'REF_1', 'DGEVS', '', '', '', '', NULL, '', '', '', '', '-', '', '', '', '', '-', '-', '', '', '', '', '-', '', '-', '', '-', '', '-', '', '-', '', '-', '', '-', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `login` varchar(15) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `administrateur` enum('O','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `login`, `password`, `nom`, `prenom`, `administrateur`) VALUES
(1, 'sdurant', 'sdurant', 'Sylvain', 'Durant', 'N');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `champ`
--
ALTER TABLE `champ`
  ADD PRIMARY KEY (`nomChamp`);

--
-- Index pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD PRIMARY KEY (`idTraitement`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `traitement`
--
ALTER TABLE `traitement`
  MODIFY `idTraitement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
