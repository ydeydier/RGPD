-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 13 Avril 2018 à 17:34
-- Version du serveur: 5.1.49
-- Version de PHP: 5.3.3-7+squeeze7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `rgpd`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(150) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `categorie`
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

CREATE TABLE IF NOT EXISTS `champ` (
  `nomChamp` varchar(50) NOT NULL,
  `ordre` int(11) NOT NULL,
  `libelleChamp` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `typeInterface` char(2) NOT NULL COMMENT 'U=une ligne, M=multilignes, D=Date, L=Liste',
  `typeListe` varchar(10) NOT NULL,
  `tailleMax` int(11) NOT NULL,
  `afficheDansListe` char(1) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  `masque` char(1) NOT NULL COMMENT 'Masqué : Oui ou Non',
  PRIMARY KEY (`nomChamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `champ`
--

INSERT INTO `champ` (`nomChamp`, `ordre`, `libelleChamp`, `description`, `typeInterface`, `typeListe`, `tailleMax`, `afficheDansListe`, `idCategorie`, `masque`) VALUES
('baseLegale', 250, 'Base lÃ©gale', '', 'M', '', 400, 'N', 4, 'N'),
('categorieDonnees', 140, 'CatÃ©gories de donnÃ©es personnelles concernÃ©es', '', 'M', '', 500, 'N', 3, 'N'),
('complementMesures', 390, 'ComplÃ©ment(s)', '', 'M', '', 400, 'N', 5, 'N'),
('dateCreation', 80, 'Date de crÃ©ation', '', 'D', '', 10, 'N', 1, 'N'),
('descriptionDonnees', 160, 'Description des donnÃ©es', '', 'M', '', 400, 'N', 3, 'N'),
('destinataireHorsUE', 430, 'Destinataire(s)', '', 'M', '', 200, 'N', 7, 'N'),
('destinationDonnees', 210, 'Destination des donnÃ©es (flux de sortie)', '', 'U', '', 100, 'N', 3, 'N'),
('detailFinalite', 70, 'DÃ©tails de la finalitÃ© du traitement', '', 'M', '', 400, 'N', 1, 'N'),
('dureeConservation', 170, 'La durÃ©e de conservation des donnÃ©es traitÃ©es', '', 'M', '', 50, 'N', 3, 'N'),
('exactitudeDonnees', 310, 'Exactitude des donnÃ©es', '', 'M', '', 400, 'N', 4, 'N'),
('finalite', 50, 'FinalitÃ©', '', 'M', '', 400, 'O', 1, 'N'),
('garantiesHorsUE', 450, 'Type(s) de Garanties', '', 'M', '', 400, 'N', 7, 'N'),
('integriteConfidentialite', 350, 'IntÃ©gritÃ© et confidentialitÃ©', '', 'M', '', 400, 'N', 4, 'N'),
('limitationConservation', 330, 'Limitation de la conservation', '', 'M', '', 400, 'N', 4, 'N'),
('limitationFinalites', 270, 'Limitation des finalitÃ©s', '', 'M', '', 400, 'N', 4, 'N'),
('LLT', 230, 'LicÃ©itÃ©, loyautÃ© et transparence', '', 'M', '', 400, 'N', 4, 'N'),
('localisation', 60, 'Localisation du traitement', '', 'U', '', 40, 'N', 1, 'N'),
('mesuresOrga', 380, 'Mesures organisationnelles', '', 'M', '', 400, 'N', 5, 'N'),
('mesuresTechniques', 370, 'Mesures techniques', '', 'M', '', 400, 'N', 5, 'N'),
('minimisationDonnees', 290, 'Minimisation des donnÃ©es', '', 'M', '', 400, 'N', 4, 'N'),
('nom', 10, 'Nom', '', 'U', '', 255, 'O', 1, 'N'),
('origineDonnees', 200, 'Origine des donnÃ©es (flux d''entrÃ©e)', '', 'U', '', 100, 'N', 3, 'N'),
('paysHorsUE', 440, 'Pays', '', 'M', '', 200, 'N', 7, 'N'),
('PIA_EIVP_realisee', 190, 'PIA ou EIVP rÃ©alisÃ©e', '', 'L', 'ON', 1, 'N', 3, 'N'),
('precisions', 220, 'PrÃ©cision(s)', '', 'M', '', 400, 'N', 3, 'N'),
('presenceDonneesSensibles', 180, 'PrÃ©sence de donnÃ©es sensibles', '', 'L', 'ON', 1, 'O', 3, 'N'),
('presenceSousTrce', 130, 'PrÃ©sence de sous-Traitance', '', 'L', 'ON', 1, 'N', 2, 'N'),
('rappelProfils', 150, 'Rappel des profils', '', 'M', '', 400, 'N', 3, 'N'),
('reference', 20, 'RÃ©f.', '', 'U', '', 20, 'O', 1, 'N'),
('referent', 120, 'RÃ©fÃ©rent (ReprÃ©sentant)', '', 'U', '', 40, 'O', 2, 'N'),
('remarqueSousTrt', 420, 'Remarque(s)', '', 'M', '', 400, 'N', 6, 'N'),
('responsable', 100, 'Responsable du Traitement', 'La personne physique ou morale, l''autoritÃ© publique, le service ou un autre organisme qui, seul ou conjointement avec d''autres, dÃ©termine les finalitÃ©s et les moyens du traitement.', 'U', '', 40, 'N', 2, 'N'),
('responsableConjoint', 110, 'Responsable(s) conjoint(s)', '', 'U', '', 40, 'N', 2, 'N'),
('responsableContratSousTrt', 410, 'Responsable du contrat de sous-traitance', '', 'U', '', 50, 'N', 6, 'N'),
('service', 40, 'Service', 'Service chargÃ© de la mise en oeuvre du traitement', 'L', 'SERVICE', 40, 'O', 1, 'N'),
('sousTraitants', 400, 'Sous- traitant(s)', '', 'M', '', 400, 'N', 6, 'N'),
('statutBaseLegale', 260, 'Statut base lÃ©gale', '', 'L', 'OK', 1, 'N', 4, 'N'),
('statutExactitudeDonnees', 320, 'Statut - exactitude des donnÃ©es', '', 'L', 'OK', 1, 'N', 4, 'N'),
('statutIntegriteConfidentialite', 360, 'Statut intÃ©gritÃ© et confidentialitÃ©', '', 'L', 'OK', 1, 'N', 4, 'N'),
('statutLimitationConservation', 340, 'Statut limitation de la conservation', '', 'L', 'OK', 1, 'N', 4, 'N'),
('statutLimitationFinalites', 280, 'Statut limitation des finalitÃ©s', '', 'L', 'OK', 1, 'N', 4, 'N'),
('statutLLT', 240, 'Statut licÃ©itÃ©, loyautÃ© et transparence', '', 'L', 'OK', 1, 'N', 4, 'N'),
('statutMinimisationDonnees', 300, 'Statut minimisation des donnÃ©es', '', 'L', 'OK', 1, 'N', 4, 'N'),
('suiviModif', 90, 'suivi des modification', '', 'M', '', 400, 'N', 1, 'N');

-- --------------------------------------------------------

--
-- Structure de la table `intitule`
--

CREATE TABLE IF NOT EXISTS `intitule` (
  `idIntitule` int(11) NOT NULL AUTO_INCREMENT,
  `ordre` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`idIntitule`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Contenu de la table `intitule`
--

INSERT INTO `intitule` (`idIntitule`, `ordre`, `type`, `libelle`) VALUES
(6, 1, 'OK', 'OK'),
(7, 2, 'OK', 'KO'),
(8, 1, 'ON', 'OUI'),
(9, 2, 'ON', 'NON'),
(11, 0, 'SERVICE', 'DCLS - CCAS'),
(12, 0, 'SERVICE', 'CTM - CTM'),
(13, 0, 'SERVICE', 'DACV - BERP'),
(14, 0, 'SERVICE', 'DACV - DEVELOPPEMENT DURABLE'),
(15, 0, 'SERVICE', 'DACV - URBANISME'),
(16, 0, 'SERVICE', 'DACV - VILLE ET HABITAT'),
(17, 0, 'SERVICE', 'DCLS - MEDIATHEQUE'),
(18, 0, 'SERVICE', 'DCOM - DCOM'),
(19, 0, 'SERVICE', 'DF - PAF'),
(20, 0, 'SERVICE', 'DF - PETITE ENFANCE'),
(21, 0, 'SERVICE', 'DFCP - FINANCES'),
(22, 0, 'SERVICE', 'DFCP - MARCHES'),
(23, 0, 'SERVICE', 'DFCP'),
(24, 0, 'SERVICE', 'DFCP - CONTROLE DE GESTION'),
(25, 0, 'SERVICE', 'DGS - ARCHE'),
(26, 0, 'SERVICE', 'DRH - DRH'),
(27, 0, 'SERVICE', 'DSG - DSG'),
(28, 0, 'SERVICE', 'DSG - COURRIER'),
(29, 0, 'SERVICE', 'DSG - QUARTIERS'),
(30, 0, 'SERVICE', 'DSG - ARCHIVES'),
(31, 0, 'SERVICE', 'DSI - CDS'),
(32, 0, 'SERVICE', 'DSI - SRT'),
(33, 0, 'SERVICE', 'DVAS - VIE ASSOCIATIVE'),
(34, 0, 'SERVICE', 'DIRECTION GENERALE - ETAT CIVI'),
(35, 0, 'SERVICE', 'INCONNU - INCONNU'),
(36, 0, 'SERVICE', 'DIRECTION GENERALE - POLICE MU'),
(37, 0, 'SERVICE', 'DIRECTION GENERALE - PREVENTIO'),
(38, 0, 'SERVICE', 'DACV - DACV'),
(41, 4, 'OK', 'EC'),
(42, 3, 'OK', 'NA'),
(43, 4, 'ON', 'EC'),
(44, 3, 'ON', 'NA');

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

CREATE TABLE IF NOT EXISTS `traitement` (
  `idTraitement` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `corbeille` char(1) NOT NULL DEFAULT 'N',
  `quimaj` varchar(15) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `reference` varchar(20) DEFAULT NULL,
  `service` varchar(40) DEFAULT NULL,
  `finalite` varchar(400) DEFAULT NULL,
  `localisation` varchar(40) DEFAULT NULL,
  `detailFinalite` varchar(400) DEFAULT NULL,
  `dateCreation` date DEFAULT NULL,
  `suiviModif` varchar(300) DEFAULT NULL,
  `responsable` varchar(40) DEFAULT NULL,
  `responsableConjoint` varchar(40) DEFAULT NULL,
  `referent` varchar(40) DEFAULT NULL,
  `presenceSousTrce` char(3) DEFAULT NULL,
  `categorieDonnees` varchar(400) DEFAULT NULL,
  `rappelProfils` varchar(300) DEFAULT NULL,
  `descriptionDonnees` varchar(400) DEFAULT NULL,
  `dureeConservation` varchar(50) DEFAULT NULL,
  `presenceDonneesSensibles` char(3) DEFAULT NULL,
  `PIA_EIVP_realisee` char(3) DEFAULT NULL,
  `origineDonnees` varchar(100) DEFAULT NULL,
  `destinationDonnees` varchar(100) DEFAULT NULL,
  `precisions` varchar(300) DEFAULT NULL,
  `LLT` varchar(300) DEFAULT NULL,
  `statutLLT` char(2) DEFAULT NULL,
  `baseLegale` varchar(300) DEFAULT NULL,
  `statutBaseLegale` char(2) DEFAULT NULL,
  `limitationFinalites` varchar(300) DEFAULT NULL,
  `statutLimitationFinalites` char(2) DEFAULT NULL,
  `minimisationDonnees` varchar(300) DEFAULT NULL,
  `statutMinimisationDonnees` char(2) DEFAULT NULL,
  `exactitudeDonnees` varchar(300) DEFAULT NULL,
  `statutExactitudeDonnees` char(2) DEFAULT NULL,
  `limitationConservation` varchar(300) DEFAULT NULL,
  `statutLimitationConservation` char(2) DEFAULT NULL,
  `integriteConfidentialite` varchar(300) DEFAULT NULL,
  `statutIntegriteConfidentialite` char(2) DEFAULT NULL,
  `mesuresTechniques` varchar(300) DEFAULT NULL,
  `mesuresOrga` varchar(300) DEFAULT NULL,
  `complementMesures` varchar(300) DEFAULT NULL,
  `sousTraitants` varchar(300) DEFAULT NULL,
  `responsableContratSousTrt` varchar(50) DEFAULT NULL,
  `remarqueSousTrt` varchar(300) DEFAULT NULL,
  `destinataireHorsUE` varchar(200) DEFAULT NULL,
  `paysHorsUE` varchar(200) DEFAULT NULL,
  `garantiesHorsUE` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idTraitement`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=133 ;

--
-- Contenu de la table `traitement`
--

INSERT INTO `traitement` (`idTraitement`, `timestamp`, `corbeille`, `quimaj`, `nom`, `reference`, `service`, `finalite`, `localisation`, `detailFinalite`, `dateCreation`, `suiviModif`, `responsable`, `responsableConjoint`, `referent`, `presenceSousTrce`, `categorieDonnees`, `rappelProfils`, `descriptionDonnees`, `dureeConservation`, `presenceDonneesSensibles`, `PIA_EIVP_realisee`, `origineDonnees`, `destinationDonnees`, `precisions`, `LLT`, `statutLLT`, `baseLegale`, `statutBaseLegale`, `limitationFinalites`, `statutLimitationFinalites`, `minimisationDonnees`, `statutMinimisationDonnees`, `exactitudeDonnees`, `statutExactitudeDonnees`, `limitationConservation`, `statutLimitationConservation`, `integriteConfidentialite`, `statutIntegriteConfidentialite`, `mesuresTechniques`, `mesuresOrga`, `complementMesures`, `sousTraitants`, `responsableContratSousTrt`, `remarqueSousTrt`, `destinataireHorsUE`, `paysHorsUE`, `garantiesHorsUE`) VALUES
(1, '2018-04-13 14:20:19', 'N', 'sdurant', 'SONATE', 'REF_1', 'DCLS - CCAS', 'Logiciel CCAS / CIAS, accueil, aides lÃ©gales et facultatives, logements, suivi social et RSA, portage de repas, aides Ã  domicile', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Fabienne SIONNEAU', '', '', '', 'LOGICIEL', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Editeur ARPEGE', 'La DSI / Resp. Application', 'HÃ©bergement en local Ã  la Mairie.\r\nContrat de service pour la maintenance et le support (avec un accÃ¨s Ã  distance).', 'Non', '', ''),
(2, '2018-04-09 18:02:07', 'N', 'DSI', 'PASSERELLE', 'REF_2', 'DCLS - CCAS', 'Gestion de la Banque Alimentaire', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Anthony RAMOND', '', '', '', 'LOGICIEL', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, '2018-04-09 18:02:07', 'N', 'DSI', 'OMEGA (MÃ©tropole)', 'REF_3', 'CTM - CTM', 'Liste des clients, avec comme donnÃ©es personnelles : leur adresse, mail, tÃ©lÃ©phone, consommations d''eau', '', '', NULL, NULL, 'Monsieur le Maire', NULL, 'METROPOLE', '', '', '', '?', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, '2018-04-09 18:02:07', 'N', 'DSI', 'ASTECH', 'REF_4', 'CTM - CTM', '', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Denis MOULIN', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, '2018-04-09 18:02:07', 'N', 'DSI', 'Maisons fleuries', 'REF_5', 'CTM - CTM', 'Fichier Excel des abraysiens participant aux maisons fleuries.', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'FrÃ©dÃ©ric VIAUD', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, '2018-04-09 18:02:07', 'N', 'DSI', 'Astreintes', 'REF_6', 'CTM - CTM', 'Liste des agents susceptibles d''Ãªtre appelÃ©s en astreinte ou renfort d''astreinte : noms, adresses, numÃ©ros de tÃ©lÃ©phone.', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Nadine DELAPORTE', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(7, '2018-04-09 18:02:07', 'N', 'DSI', 'Tailles et pointures', 'REF_7', 'CTM - CTM', 'Fichier des tailles et pointures des agents pour les vÃªtements de travail', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Nadine DELAPORTE', '', '', '', 'BUREAUTIQUE', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(8, '2018-04-09 18:02:07', 'N', 'DSI', 'Permis et habilitations', 'REF_8', 'CTM - CTM', 'Fichier des permis et habilitations des agents', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Nadine DELAPORTE', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, '2018-04-09 18:02:07', 'N', 'DSI', 'Permis', 'REF_9', 'CTM - CTM', 'Cahier reprenant toutes les copies des permis et caces des agents du CTM', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Nadine DELAPORTE', '', '', '', 'PAPIER', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(10, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_10', 'CTM - CTM', 'Fiches en T dans le bureau de Nadine : nom, numÃ©ro de tÃ©lÃ©phone', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Nadine DELAPORTE', '', '', '', 'PAPIER', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(11, '2018-04-09 18:02:07', 'N', 'DSI', 'Evaluations', 'REF_11', 'CTM - CTM', 'La ressource Y contient toutes les Ã©valuations des agents. Par ailleurs, dans nos dossiers, nous pouvons conserver des rapports sur les agents. ', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Emmanuelle LE MENEZ', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(12, '2018-04-09 18:02:07', 'N', 'DSI', 'Photos', 'REF_12', 'CTM - CTM', 'Dans nos fichiers, nous avons aussi des photos de certains agents, mais sans possibilitÃ© de mettre un nom sur les personnes photographiÃ©es.', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Nadine DELAPORTE', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(13, '2018-04-10 09:33:23', 'N', 'sdurant', 'ALX', 'REF_13', 'CTM - CTM', 'gestion des pompes Ã  essence du CTM', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Denis MOULIN', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(14, '2018-04-09 18:02:07', 'N', 'DSI', 'LSM', 'REF_14', 'CTM - CTM', 'Gestion des accÃ¨s aux batiments (donnÃ©es professionnelles, usages)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Denis MET', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(15, '2018-04-09 18:02:07', 'N', 'DSI', 'Installations classÃ©es', 'REF_15', 'CTM - CTM', 'Gestion des installations classÃ©es dans le cadre du plan municipal de sÃ©curitÃ©', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Marie-CÃ©line TYSSIER', '', '', '', '?', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(16, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_16', 'DACV - BERP', 'Pour les surbaissements de bordures: liste de noms, adresses', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(17, '2018-04-09 18:03:23', 'N', 'sdurant', '', 'REF_17', '', 'Pour les arrÃªtÃ©s de voirie, au profit de quelques particuliers en direct (Ã©chafaudage, dÃ©pÃ´t de matÃ©riaux...) et au profit d''entreprises de travaux, pour le compte de particuliers (branchements rÃ©seaux...) : liste rÃ©capitulative des arrÃªtÃ©s: noms, adresses', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(18, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_18', 'DACV - DEVELOPPEMENT DURABLE', 'Ensemble des listings liÃ©s aux divers groupes de travail dÃ©veloppement durable.', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(19, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_19', 'DACV - DEVELOPPEMENT DURABLE', 'Liste " arbres remarquables "', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Jean-Pierre ORANGE', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(20, '2018-04-10 09:33:49', 'N', 'sdurant', 'CARTADS', 'REF_20', 'DACV - URBANISME', 'Demandes d''autorisation d''urbanisme (permis de construire, permis d''amÃ©nager, permis de dÃ©molir, dÃ©claration prÃ©alable, certificat d''urbanisme, autorisation de travaux) pour lesquelles il y a,les adresses, les no de tÃ©lÃ©phone, les dates de naissance.', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Magali CIET', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(21, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_21', 'DACV - URBANISME', 'DÃ©clarations d''intention d''aliÃ©ner (noms, adresses, prix de vente des biens)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(22, '2018-04-09 18:03:54', 'N', 'sdurant', '', 'REF_22', '', 'Conventions de mise Ã  disposition (nom, adresse, loyers...)', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(23, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_23', 'DACV - URBANISME', 'Dossiers " risques inondation, sÃ©cheresse " : nom, adresse, tÃ©l, mail', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(24, '2018-04-10 10:23:13', 'N', 'sdurant', '', 'REF_24', 'DACV - URBANISME', 'Conventions (logement, local, parking Becquerel, antennes) : en plus des coordonnÃ©es (nom, adresse, tÃ©l, mail),il y a aussi la date de naissance (pour les impÃ´ts), la situation familiale (pour logements de fonction) et quelques attestations d''assurance (parking Becquerel)', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(25, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_25', 'DACV - URBANISME', 'Liste des potentiels acquÃ©reurs Miramion', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(26, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_26', 'DACV - URBANISME', 'RÃ©unions riverains (en cas de travaux ou de constructions)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(27, '2018-04-09 18:02:07', 'N', 'DSI', 'INTRAGEO', 'REF_27', 'DACV - URBANISME', 'DonnÃ©es gÃ©ographiques', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Jacky GIVERNAUD', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(28, '2018-04-09 18:02:07', 'N', 'DSI', 'MAJIC3 - EDIGEO', 'REF_28', 'DACV - URBANISME', 'Fichiers cadastraux', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Sylvaine CRAMPETTE', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(29, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_29', 'DACV - VILLE ET HABITAT', 'Liste des membres de l''ATU Ecoquartier et des groupes de travail Ecoquartier et autres ATU (ECLO, CENTRE VILLE, PLU)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(30, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_30', 'DACV - VILLE ET HABITAT', 'Dossiers contentieux (exemple : contacts maisons passives)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(31, '2018-04-10 10:22:14', 'N', 'sdurant', '', 'REF_31', 'DACV - VILLE ET HABITAT', 'Liste Ã©tudiants reÃ§us Ã  la DACV (coordonnÃ©es dans le logiciel outlook)', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Magali CIET', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(32, '2018-04-09 18:02:07', 'N', 'DSI', 'ORPHEE', 'REF_32', 'DCLS - MEDIATHEQUE', 'Gestion de la mÃ©diathÃ¨que / Portail (Ã©tat-civil, donnÃ©es d''usage)\r\n- Statistiques globales uniquement (pas nominatives)\r\n- pas de liaison emprunts / emprunteurs', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'ValÃ©rie BONGIBAULT', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(33, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_33', 'DCLS - MEDIATHEQUE', 'Communication aux usagers intÃ©ressÃ©s par les actions culturelles de la mÃ©diathÃ¨que', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'ValÃ©rie BONGIBAULT', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(34, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_34', 'DCLS - MEDIATHEQUE', 'Listes d''adresses en vue d''envoi d''informations', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Flavie RENAULT', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(35, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_35', 'DCOM - DCOM', 'Communication politique', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Sylvain BRIENT', '', '', '', 'BUREAUTIQUE', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(36, '2018-04-09 18:02:07', 'N', 'DSI', 'SITE INTERNET', 'REF_36', 'DCOM - DCOM', 'Site Internet de la ville', 'EXTERNALISE', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Sylvain BRIENT', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(37, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_37', 'DF - PAF', 'dossiers papiers pour chacune des familles utilisant des prestations ville (agents de l''EAF)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'FrÃ©dÃ©ric GUYOT', '', '', '', 'PAPIER', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(38, '2018-04-09 18:02:07', 'N', 'DSI', 'MAELIS', 'REF_38', 'DF - PAF', 'Gestion des activitÃ©s pÃ©riscolaire et restauration', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'FrÃ©dÃ©ric GUYOT', '', '', '', 'LOGICIEL', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(39, '2018-04-09 18:02:07', 'N', 'DSI', 'portail familles', 'REF_39', 'DF - PAF', 'Portail des activitÃ©s pÃ©riscolaire et restauration', 'EXTERNALISE', '', NULL, NULL, 'Monsieur le Maire', NULL, 'FrÃ©dÃ©ric GUYOT', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(40, '2018-04-10 10:22:31', 'N', 'sdurant', 'BASE ELEVE', 'REF_40', 'DF - PAF', 'accÃ¨s Ã  la base ONDE (ex-base Ã©lÃ¨ves) (Responsable PAF)', 'EXTERNALISE', '', NULL, '', 'Monsieur le Maire', '', 'FrÃ©dÃ©ric GUYOT', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(41, '2018-04-10 10:24:46', 'N', 'sdurant', 'CAFPRO', 'REF_41', 'DF - PAF', 'accÃ¨s Ã  CAFPRO pour recherche des QF des familles  (agents de l''EAF)', 'EXTERNALISE', '', NULL, '', 'Monsieur le Maire', '', 'Raoul DAUPEUX', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(42, '2018-04-09 18:02:07', 'N', 'DSI', 'GRAM', 'REF_42', 'DF - PETITE ENFANCE', 'Gestion du RAM', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'VÃ©ronique MARCHAND', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(43, '2018-04-09 18:02:07', 'N', 'DSI', 'GSS', 'REF_43', 'DF - PAF', 'Gestion de stock', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Brigitte Bouchareine', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(44, '2018-04-09 18:02:07', 'N', 'DSI', 'CONCERTO', 'REF_44', 'DF - PETITE ENFANCE', 'Logiciel petite enfance', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Raoul DAUPEUX', '', '', '', 'LOGICIEL', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(45, '2018-04-09 18:02:07', 'N', 'DSI', 'SEDIT GF', 'REF_45', 'DFCP - FINANCES', 'Gestion financiÃ¨re de la commune (nom, prÃ©nom, donnÃ©es bancaires)', 'EXTERNALISE', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Nicolas POCHARD', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(46, '2018-04-10 10:24:33', 'N', 'sdurant', 'INFINE', 'REF_46', 'DFCP - FINANCES', 'Outil d''aide Ã  la dÃ©cision FINANCES', 'EXTERNALISE', '', NULL, '', 'Monsieur le Maire', '', 'Nicolas POCHARD', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(47, '2018-04-10 10:24:19', 'N', 'sdurant', 'INSITO', 'REF_47', 'DFCP - FINANCES', 'Outil d''aide Ã  la dÃ©cision FINANCES', 'EXTERNALISE', '', NULL, '', 'Monsieur le Maire', '', 'Nicolas POCHARD', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(48, '2018-04-09 18:02:07', 'N', 'DSI', 'TLPE', 'REF_48', 'DFCP - FINANCES', 'Taxe local sur la publicitÃ© des entreprises', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Nicolas POCHARD', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(49, '2018-04-09 18:02:07', 'N', 'DSI', 'NEMAUSIC Finances', 'REF_49', 'DFCP - FINANCES', 'Ancien logiciel Finances', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Nicolas POCHARD', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(50, '2018-04-09 18:02:07', 'N', 'DSI', 'SIS MARCHE', 'REF_50', 'DFCP - MARCHES', 'Gestion des marchÃ©s publics', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Marie-Christine RODRIGUEZ', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(51, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_51', 'DFCP', 'ImpayÃ©s par chÃ¨que', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Nicolas POCHARD', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(52, '2018-04-09 18:02:07', 'N', 'DSI', 'ENERGIE', 'REF_52', 'DFCP - CONTROLE DE GESTION', 'Facturation des consommations d''Ã©nergie', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Bruno GENESTRE', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(53, '2018-04-09 18:02:07', 'N', 'DSI', 'ARCHE - AGDE', 'REF_53', 'DGS - ARCHE', 'Gestion des donnÃ©es d''Ã©tablissements sur le territoire communal et de Boigny', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'RÃ©my POIGNANT', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(54, '2018-04-09 18:02:07', 'N', 'DSI', 'Fichiers bureautiques RH', 'REF_54', 'DRH - DRH', 'Cf. onglet DRH, DaniÃ¨le', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'DaniÃ¨le BOULANT', '', '', '', 'LOGICIEL', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(55, '2018-04-09 18:02:07', 'N', 'DSI', 'SEDIT RH', 'REF_55', 'DRH - DRH', 'Gestion des Ressources Humaines', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'DaniÃ¨le BOULANT', '', '', '', 'LOGICIEL', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(56, '2018-04-09 18:02:07', 'N', 'DSI', 'NEMAUSIC RH', 'REF_56', 'DRH - DRH', 'Ancien logiciel RH', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'DaniÃ¨le BOULANT', '', '', '', 'LOGICIEL', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(57, '2018-04-09 18:02:07', 'N', 'DSI', 'HOROQUARTZ', 'REF_57', 'DRH - DRH', 'Gestion des heures supplÃ©mentaires', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Emmanuelle LE MENEZ', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(58, '2018-04-09 18:02:07', 'N', 'DSI', 'GALPE', 'REF_58', 'DRH - DRH', 'Gestion du chomage', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'CÃ©line HAGLUND', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(59, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_59', 'DSG - DSG', 'Liste des conseils municipaux comportant date de naissance et adresse', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Emilie THOMAS', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(60, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_60', 'DSG - DSG', '- Liste des conseils municipaux comportant date de naissance et adresse, \r\n- un tableau des membres des bureaux et membres par comitÃ© de quartier (soit 6 tableaux )\r\n- un tableau qui rÃ©capitule l''ensemble des bureaux des comitÃ©s (1 tableau )\r\n- une liste par bureau de comitÃ©  (6 listes)\r\n- une liste des prÃ©sidents des comitÃ©s (1 liste)\r\n- un tableau du groupe de travail pour le rÃ©amÃ©nageme', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Emilie THOMAS', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(61, '2018-04-09 18:02:07', 'N', 'DSI', 'MAARCH', 'REF_61', 'DSG - COURRIER', 'Logiciel Maarch', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'AurÃ©lie LE BIHAN', '', '', '', 'LOGICIEL', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(62, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_62', 'DSG - QUARTIERS', 'Tableau des membres des bureaux et membres par comitÃ© de quartier (soit 6 tableaux)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Delphine TARAGON', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(63, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_63', 'DSG - QUARTIERS', 'Tableau qui rÃ©capitule l''ensemble des bureaux des comitÃ©s (1 tableau )', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Delphine TARAGON', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(64, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_64', 'DSG - QUARTIERS', 'Liste par bureau de comitÃ©  (6 listes)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Delphine TARAGON', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(65, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_65', 'DSG - QUARTIERS', 'Liste des prÃ©sidents des comitÃ©s (1 liste)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Delphine TARAGON', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(66, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_66', 'DSG - QUARTIERS', 'Tableau du groupe de travail pour le rÃ©amÃ©nagement du boulevard Kennedy ', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Delphine TARAGON', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(67, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_67', 'DSG - QUARTIERS', 'Tableau du groupe de travail pour la requalification du parc du Vallon St Loup ', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Delphine TARAGON', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(68, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_68', 'DSG - QUARTIERS', 'Tableau du groupe de travail pour la requalification du parc des Armenault ', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Delphine TARAGON', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(69, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_69', 'DSG - ARCHIVES', 'Tableau du service des archives pour la direction des ressources humaines concernant les anciens agents de la ville, ', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Emilie THOMAS', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(70, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_70', 'DSG - ARCHIVES', 'Tableau du service des archives concernant les anciens permis de construire.', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Emilie THOMAS', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(71, '2018-04-09 18:02:07', 'N', 'DSI', 'GLPI', 'REF_71', 'DSI - CDS', 'Inventaire du parc informatique et traitement des incidents (Nom, PrÃ©nom, service)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Olivier DUFOUR', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(72, '2018-04-09 18:02:07', 'N', 'DSI', 'Annuaire Active Directory', 'REF_72', 'DSI - SRT', 'Annuaire des utilisateurs informatiques de la mairie (nom, prÃ©nom, donnÃ©es professionnelles)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Olivier DUFOUR', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(73, '2018-04-10 10:25:30', 'N', 'sdurant', 'CLEARPASS', 'REF_73', 'DSI - SRT', 'Historique des connexions wifi des utilisateurs Ã  conserver selon la lÃ©gislation', 'LOCAL', 'Exigence lÃ©gale de la loi LCEN du 21 juin 2004, Ã©tendu le 23 janvier 2006 Ã  l''ensemble des fournisseurs d''accÃ¨s Ã  Internet. ', NULL, '', 'Monsieur le Maire', '', 'Nicolas DROULIN', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(74, '2018-04-09 18:02:07', 'N', 'DSI', 'XIVO', 'REF_74', 'DSI - CDS', 'Annuaire tÃ©lÃ©phonique de la mairie (nom, prÃ©nom, donnÃ©es professionnelles, historique des usages des outils)', 'LOCAL', 'Exigence lÃ©gale de la loi  Code des postes et des Communications Electroniques (CPCE).', NULL, NULL, 'Monsieur le Maire', NULL, 'Nicolas DROULIN', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(75, '2018-04-09 18:02:07', 'N', 'DSI', 'PAPERCUT', 'REF_75', 'DSI - CDS', 'Gestion des copieurs (donnÃ©es professionnelles et usages)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Olivier DUFOUR', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(76, '2018-04-12 11:42:57', 'N', 'sdurant', 'FORTIANALYZER', 'REF_76', 'DSI - SRT', 'Historique des connexions internet des utilisateurs mairie', 'LOCAL', 'Exigence lÃ©gale de la loi LCEN du 21 juin 2004, Ã©tendu le 23 janvier 2006 Ã  l''ensemble des fournisseurs d''accÃ¨s Internet.', NULL, '', 'Monsieur le Maire', '', 'Nicolas DROULIN', 'NON', 'Adresse IP (DHCP) & MAC, horodatage, URL, catÃ©gorie,', 'DonnÃ©es de connexion / techniques', 'LOGICIEL', '1 an', 'NON', 'NA', 'Pare feu FORTINET', 'DSI pour statistiques / Police Nationale sur rÃ©quisition.', '', 'Information des agents via la charte informatique.', 'OK', 'Obligation lÃ©gale', 'OK', 'Oui', 'OK', 'uniquement les donnÃ©es strictement nÃ©cessaires', 'OK', '', 'OK', 'Limitation Ã  mettre en place dans la configuation. A ce jour, le limitation est basÃ©e sur la taille du disque.', 'KO', 'Gestion des habilitations sur le FORTIANALYSER.\r\nVÃ©rifier si les log sont bien sauvegardÃ©s -> ODU : aprÃ¨s vÃ©rification, non les logs ne sont pas sauvegardÃ©s.\r\n', 'EC', '', '', '', '', '', '', '', '', ''),
(77, '2018-04-12 11:54:09', 'N', 'sdurant', 'FORTIGATE', 'REF_77', 'DSI - SRT', 'Mesure de l''utilisation de la bande passante', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Nicolas DROULIN', 'NON', '', 'DonnÃ©es de connexion / techniques', 'LOGICIEL', '1 an', 'NON', 'NA', 'Pare feu FORTINET', 'DSI pour statistiques / Police Nationale sur rÃ©quisition.', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(78, '2018-04-09 18:02:07', 'N', 'DSI', 'EXCHANGE ', 'REF_78', 'DSI - SRT', 'Messagerie d''entreprise', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Olivier DUFOUR', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(79, '2018-04-10 10:25:43', 'N', 'sdurant', 'PRINEO', 'REF_79', 'DSI - CDS', 'Gestion des soumissions de travaux Ã  la reprographie', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Jonathan NIO', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(80, '2018-04-10 10:25:52', 'N', 'sdurant', 'Subventions aux associations', 'REF_80', 'DVAS - VIE ASSOCIATIVE', 'Nous stockons de faÃ§on dÃ©matÃ©rialisÃ©e les statuts des associations avec les coordonnÃ©es des membres du bureau, les donnÃ©es bancaires des associations.', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Elodie Bordonado', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(81, '2018-04-09 18:02:07', 'N', 'DSI', 'RÃ©gie', 'REF_81', 'DVAS - VIE ASSOCIATIVE', 'Tenue des registres avec talons de suivi (noms, numÃ©ro des chÃ¨ques)', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'ValÃ©rie Laugeray', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(82, '2018-04-09 18:02:07', 'N', 'DSI', 'Locations de salle', 'REF_82', 'DVAS - VIE ASSOCIATIVE', 'Dans le cadre des locations de salles, nous rÃ©ceptionnons des attestations d''assurance.', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'ValÃ©rie Laugeray', '', '', '', 'PAPIER', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(83, '2018-04-09 18:02:07', 'N', 'DSI', 'Veille associative', 'REF_83', 'DVAS - VIE ASSOCIATIVE', 'Documents depuis la publication aux JO (publique) jusqu''aux statuts et attestations d''assurance associative.', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Elodie Bordonado', '', '', '', 'PAPIER', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(84, '2018-04-10 10:26:12', 'N', 'sdurant', 'Fichier Diff''', 'REF_84', 'DVAS - VIE ASSOCIATIVE', 'Fichier de contacts global rÃ©fÃ©renÃ§ant les associations, les institutions partenaires, les membres des comitÃ©s des sages et de quartiers, des fournisseurs, les Ã©tablissements, les villes jumelles... Ce fichier rassemble les coordonnÃ©es adresses, mails, tÃ©lÃ©phones ( accÃ¨s Ã  la DGEVS ) et compte plus de 500 rÃ©fÃ©rences.', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Blandine Creusillet', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(85, '2018-04-09 18:02:07', 'N', 'DSI', 'RÃ©pertoire associatif', 'REF_85', 'DVAS - VIE ASSOCIATIVE', 'DonnÃ©es pour le guide pratique, liste de contact associatif.', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Elodie Bordonado', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(86, '2018-04-10 10:26:30', 'N', 'sdurant', 'Portail des associations', 'REF_86', 'DVAS - VIE ASSOCIATIVE', 'PrÃ©sence sur le site internet de l''annuaire des associations avec publication des contacts donnÃ©es par les associations. Formulaires de contact (matÃ©riel, reprographie, salles...). Ces formulaires demandent Ã©galement des informations nominatives et des coordonnÃ©es tÃ©lÃ©phoniques et courriels.', 'EXTERNALISE', '', NULL, '', 'Monsieur le Maire', '', 'TimothÃ©e Berthalon', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(87, '2018-04-09 18:02:07', 'N', 'DSI', 'Logiciel de caisse de la piscine', 'REF_87', 'DVAS - VIE ASSOCIATIVE', 'La piscine dÃ©livre des cartes d''abonnement en enregistrant des donnÃ©es personnelles des usagers sur le logiciel de caisse.', 'EXTERNALISE', '', NULL, NULL, 'Monsieur le Maire', NULL, 'RÃ©gisseur piscine', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(88, '2018-04-09 18:02:07', 'N', 'DSI', 'Outils de messagerie', 'REF_88', 'DVAS - VIE ASSOCIATIVE', 'Les contacts professionnels peuvent Ã©galement Ãªtre enregistrÃ©s dans les contacts Outlook ou OWA, ou encore dans les smartphone pour ceux qui en ont.', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Richard DELIMESLE', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(89, '2018-04-09 18:02:07', 'N', 'DSI', 'MÃ©lodie', 'REF_89', 'DIRECTION GENERALE - ETAT CIVIL', 'Gestion de l''Ã©tat civil', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Elodie BAPTUT', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(90, '2018-04-09 18:02:07', 'N', 'DSI', 'Adagio', 'REF_90', 'DIRECTION GENERALE - ETAT CIVIL', 'Gestion des listes Ã©lectorales', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Elodie BAPTUT', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(91, '2018-04-10 10:26:42', 'N', 'sdurant', 'Maestro', 'REF_91', '', 'Recensement pour la JournÃ©e DÃ©fense et CitoyennetÃ© (JDC), inscription sur les listes jusqu''Ã  la tÃ©lÃ©transmission des donnÃ©es au Centre de Service National (CSN)', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'Roselyne MALAIZE', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(92, '2018-04-09 18:02:07', 'N', 'DSI', 'Open CimetiÃ¨re', 'REF_92', 'DIRECTION GENERALE - ETAT CIVIL', '', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Roselyne MALAIZE', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(93, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_93', 'DIRECTION GENERALE - ETAT CIVIL', 'RÃ©pertoire X - DG-Cab - Etat civil', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Elodie BAPTUT', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(94, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_94', 'DIRECTION GENERALE - ETAT CIVIL', 'RÃ©pertoire T - Etat civil - Cabinet', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Elodie BAPTUT', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(95, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_95', 'DIRECTION GENERALE - ETAT CIVIL', 'Etat civil/affaires gÃ©nÃ©rales:\r\nRegistres d''Ã©tat civil\r\nDossiers d''Ã©tat civil n-1 ou n-2 archivÃ©s dans le local archives avant leur versement \r\nDossiers et documents d''Ã©tat civil de l''annÃ©e rangÃ©s dans le service\r\nDossiers et documents relevant des affaires gÃ©nÃ©rales rangÃ©s dans le service (dossiers de demande de titres d''identitÃ© durant l''instruction par la prÃ©fecture, notices de rec', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Elodie BAPTUT', '', '', '', 'PAPIER', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(96, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_96', 'DIRECTION GENERALE - ETAT CIVIL', 'Disques durs des 2 dispositifs pour le recueil des demandes de titres d''identitÃ©', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Elodie BAPTUT', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(97, '2018-04-09 18:02:07', 'N', 'DSI', 'Logements vaccants', 'REF_97', 'INCONNU - INCONNU', '', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, '', '', '', '', '?', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(98, '2018-04-09 18:02:07', 'N', 'DSI', 'MUNICIPOL', 'REF_98', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'Gestion de l''activitÃ© PM et des mains courantes', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Pascal MARTIN', '', '', '', 'LOGICIEL', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(99, '2018-04-09 18:02:07', 'N', 'DSI', 'CANIS', 'REF_99', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'Gestion des chiens dangereux', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Pascal MARTIN', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(100, '2018-04-09 18:02:07', 'N', 'DSI', 'ARGOS', 'REF_100', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'Gestion de la vidÃ©oprotection', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Pascal MARTIN', '', '', '', 'LOGICIEL', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(101, '2018-04-09 18:02:07', 'N', 'DSI', 'PVE', 'REF_101', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'PV Ã©lectroniques', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Pascal MARTIN', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(102, '2018-04-10 10:27:27', 'N', 'sdurant', '', 'REF_102', '', 'RÃ©ussite Ã©ducative : dossiers papiers nominatifs et tableaux excel nominatifs: ChloÃ© Alphonse et Christine Bonnet', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'FranÃ§ois PLANTADE', '', '', '', 'BUREAUTIQUE', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(103, '2018-04-10 10:27:43', 'N', 'sdurant', '', 'REF_103', '', 'MÃ©diateurs : fichier Excel adresses (les trois agents de mÃ©diation)', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'FranÃ§ois PLANTADE', '', '', '', 'BUREAUTIQUE', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(104, '2018-04-10 10:27:50', 'N', 'sdurant', '', 'REF_104', '', 'PrÃ©vention : dossiers papiers nominatifs pour le suivi des jeunes dÃ©linquants', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'FranÃ§ois PLANTADE', '', '', '', 'BUREAUTIQUE', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(105, '2018-04-10 10:27:56', 'N', 'sdurant', '', 'REF_105', '', 'PrÃ©vention : dossiers papiers et tableau excel pour les chantiers Ã©ducatifs', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'FranÃ§ois PLANTADE', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(106, '2018-04-10 10:28:20', 'N', 'sdurant', '', 'REF_106', '', 'PrÃ©vention : dossiers nominatifs informations prÃ©occupantes et protection de l''enfance', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'FranÃ§ois PLANTADE', '', '', '', 'BUREAUTIQUE', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(107, '2018-04-10 10:27:09', 'N', 'sdurant', '', 'REF_107', '', 'PrÃ©vention : dossiers papiers et tableau excel pour la gestion des TIG et des rappels Ã  l''ordre', 'LOCAL', '', NULL, '', 'Monsieur le Maire', '', 'FranÃ§ois PLANTADE', '', '', '', 'BUREAUTIQUE', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(108, '2018-04-09 18:02:07', 'N', 'DSI', 'ARGOS', 'REF_108', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'Surveillance Parking Becquerel', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Pascal MARTIN', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(109, '2018-04-09 18:02:07', 'N', 'DSI', 'ARGOS', 'REF_109', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'Surveillance CTM', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Pascal MARTIN', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(110, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_110', 'INCONNU - INCONNU', 'BiomÃ©trie : rÃ©seau veineux de la main sur les lieux de travail', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, '', '', '', '', '?', '', 'OUI', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(111, '2018-04-09 18:02:07', 'N', 'DSI', 'A6COM', 'REF_111', 'DSI - CDS', 'Taxation tÃ©lÃ©phonique', 'EXTERNALISE', '', NULL, NULL, 'Monsieur le Maire', NULL, 'Olivier DUFOUR', '', '', '', 'LOGICIEL', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(112, '2018-04-09 18:02:07', 'N', 'DSI', 'VACANCES LOGT', 'REF_112', 'DSG - DSG', 'Lutte contre la vacance des logements par les mairies', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, '', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(113, '2018-04-09 18:02:07', 'N', 'DSI', 'COS', 'REF_113', 'DRH - DRH', 'Gestion des adhÃ©rents du COS de SJB', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'DaniÃ¨le BOULANT', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(114, '2018-04-09 18:02:07', 'N', 'DSI', '', 'REF_114', 'DACV - DACV', 'Cf. onglet DACV de VÃ©ronique LE GUENNEC', 'LOCAL', '', NULL, NULL, 'Monsieur le Maire', NULL, 'VÃ©ronique LE GUENNEC', '', '', '', 'BUREAUTIQUE', '', 'NON', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(15) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `administrateur` enum('O','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`idUtilisateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `login`, `password`, `nom`, `prenom`, `administrateur`) VALUES
(1, 'sdurant', 'sdurant', 'Sylvain', 'Durant', 'N'),
(2, 'admin', 'admin', 'Administrateur', '', 'O');
