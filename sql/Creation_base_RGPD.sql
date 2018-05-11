-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 11 Mai 2018 à 16:56
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
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `libelle`, `description`) VALUES
(10, 'Action 2 - Identification du traitement', ''),
(15, 'Action 3 - DÃ©finir les prioritÃ©s', ''),
(20, 'Action 2 - Acteurs', ''),
(30, 'Action 3 - CatÃ©goriser les donnÃ©es', ''),
(35, 'Action 4 - Droits d''accÃ¨s (Ã  l''application ou aux fichiers)', 'Cf. notice -> Action 4 -> Point C'),
(37, 'Action 4 - Etude d''impact sur la Vie PrivÃ©e', 'Cf. notice -> Action 4 -> Point D'),
(38, 'Action 4 - Consentement de la personne', 'Cf. notice -> Action 4 -> Point E'),
(40, 'Action 4 - Minimiser la collecte de donnÃ©es au regard des finalitÃ©s et en limiter la conservation', 'Cf. notice -> Action 4 -> Points F, G et H'),
(55, 'Action 4 - Respect des droits des personnes concernÃ©es (CNIL)', 'Cf. notice -> Action 4 -> Point I'),
(56, 'Autres obligations : sous-Traitance (nouveautÃ© RGPD)', 'Cf. notice -> Autres obligations -> contrats et sous-traitance'),
(70, 'Autres obligations : transfert(s) hors UE', '');

-- --------------------------------------------------------

--
-- Structure de la table `champ`
--

CREATE TABLE IF NOT EXISTS `champ` (
  `nomChamp` varchar(50) NOT NULL,
  `ordre` int(11) NOT NULL,
  `libelleChamp` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `typeInterface` char(2) NOT NULL COMMENT 'U=une ligne, M=multilignes, D=Date, L=Liste d''intitulés, S=Spécifique',
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
('archivageEfficace', 320, 'Pensez-vous que votre processus d''archivage soit efficace ?', '', 'L', 'ON', 0, 'N', 40, 'N'),
('categorieDonneesNonSens', 140, 'Reporter les catÃ©gories de donnÃ©es NON SENSIBLES utilisÃ©es dans le traitement', '- Etat civil (identitÃ©, donnÃ©es d''identification, imagesâ€¦)\r\n- Vie personnelle (habitudes de vie, situation familiale...)\r\n- Informations d''ordre Ã©conomique et financier (revenus, situation financiÃ¨re, situation fiscale, etc.)\r\n- DonnÃ©es de connexion (adresse IP, logs...)\r\n- Localisation (dÃ©placements, donnÃ©es GPS, GSM...)', 'M', '', 400, 'N', 30, 'N'),
('categorieDonneesSens', 150, 'Reporter les catÃ©gories de donnÃ©es SENSIBLES utilisÃ©es dans le traitement', '- Origine prÃ©tendument raciale ou ethnique.\r\n- Opinions politiques, philosophiques ou religieuses.\r\n- Appartenance syndicale.\r\n- SantÃ© ou lâ€™orientation sexuelle.\r\n- GÃ©nÃ©tiques ou biomÃ©triques.\r\n- Infraction ou condamnation pÃ©nale.', 'M', '', 400, 'N', 30, 'N'),
('clausesRedigees', 630, 'Avez-vous rÃ©digÃ© les clauses RGPD liÃ©es Ã  la sous-traitance dans votre contrat ?', '', 'L', 'ON', 1, 'N', 56, 'N'),
('commentArchivageEfficace', 330, 'Si cela n''est pas le cas, que manquerait-il pour le rendre efficace ? (Ã©volution du logiciel...)', '', 'M', '', 250, 'N', 40, 'N'),
('consentementComment', 250, 'Mise en oeuvre du recueil du consentement', 'Comment envisagez-vous ou matÃ©rialisez-vous le recueil de ce consentement ? (case Ã  cocher papier ou informatique, avec signature)', 'M', '', 200, 'N', 38, 'N'),
('consentementDelai', 260, 'DÃ©lais de mise en oeuvre', 'Si cette preuve n''est pas effective, quel dÃ©lai vous imposez-vous pour se conformer au RGPD sur ce point ?', 'M', '', 0, 'N', 38, 'N'),
('consentementTrace', 240, 'Consentement de la personne', 'Avez-vous une trace du consentement de la personne pour laquelle vous rÃ©alisez le traitement ?', 'L', 'ON', 0, 'N', 38, 'N'),
('destinataireHorsUE', 760, 'Votre  traitement est il concernÃ© par un transfert de donnÃ©es personnelles hors Union EuropÃ©enne ?', '', 'L', 'ON', 0, 'N', 70, 'N'),
('destinationDonnees', 210, 'Destination des donnÃ©es (flux de sortie)', 'Qui utilise les donnÃ©es ?\r\n- au sein du service\r\n- au sein de la mairie\r\n- transmises Ã  l''extÃ©rieur (hors mairie) ?', 'U', '', 100, 'N', 30, 'N'),
('detailFinalite', 70, 'DÃ©tail de la finalitÃ©', 'Exemple : fondement juridique...', 'M', '', 400, 'N', 10, 'N'),
('direction', 35, 'Direction', '', 'S', 'DIRECTION', 0, 'O', 10, 'N'),
('droitAccesOk', 510, 'Ce processus est-il en place ?', '', 'L', 'ONEC', 0, 'N', 55, 'N'),
('droitAccesProcessus', 500, 'Quelle est la procÃ©dure et le dÃ©lai pour traiter les demandes d''accÃ¨s des personnes Ã  leurs informations ?', 'Cf. notice -> Action 4 -> Point I', 'M', '', 250, 'N', 55, 'N'),
('droitAccesRevisionComment', 226, 'ModalitÃ©s', 'Comment cette rÃ©vision sera-t-elle opÃ©rÃ©e ?', 'M', '', 150, 'N', 35, 'N'),
('droitAccesRevisionDate', 227, 'PÃ©riodicitÃ© de vÃ©rification des droits d''accÃ¨s', 'Elle doit Ãªtre cohÃ©rente avec les mouvements au sein du service.\r\n- Mensuelle\r\n- Trimestrielle\r\n- Semestrielle\r\n- Annuelle', 'U', '', 60, 'N', 35, 'N'),
('droitEffacementOk', 550, 'Ce processus est-il en place ?', '', 'L', 'ONEC', 0, 'N', 55, 'N'),
('droitEffacementProcessus', 540, 'Quelle est la procÃ©dure et le dÃ©lai pour traiter les demandes d''effacement des DCP ("Droit Ã  l''oubli") ?', 'Cf. notice -> Action 4 -> Point I', 'M', '', 250, 'N', 55, 'N'),
('droitOppositionOk', 590, 'Ce processus est-il en place ?', '', 'L', 'ONEC', 0, 'N', 55, 'N'),
('droitOppositionProcessus', 580, 'Quelle est la procÃ©dure et le dÃ©lai pour traiter les demandes de d''opposition (=retrait du consentement) ?', 'Cf. notice -> Action 4 -> Point I', 'M', '', 250, 'N', 55, 'N'),
('droitPortabiliteOk', 570, 'Ce processus est-il en place ?', '', 'L', 'ONEC', 0, 'N', 55, 'N'),
('droitPortabiliteProcessus', 560, 'Quelle est la procÃ©dure et le dÃ©lai pour traiter les demandes de transfert de vos donnÃ©es vers une autre administration (portabilitÃ©) ?', 'Cf. notice -> Action 4 -> Point I', 'M', '', 250, 'N', 55, 'N'),
('droitRectifOk', 530, 'Ce processus est-il en place ?', '', 'L', 'ONEC', 0, 'N', 55, 'N'),
('droitRectifProcessus', 520, 'Quelle est la procÃ©dure et le dÃ©lai pour traiter les demandes de rectification des DCP (donnÃ©es Ã  caractÃ¨re personnel) ?', 'Cf. notice -> Action 4 -> Point I', 'M', '', 250, 'N', 55, 'N'),
('droitViolation', 592, 'Quelle est la procÃ©dure et le dÃ©lai pour traiter les droit des personne sur la violation des donnÃ©es ?', '', 'M', '', 250, 'N', 55, 'N'),
('droitViolationOk', 596, 'Ce processus est-il en place ?', '', 'L', 'ONEC', 1, 'N', 55, 'N'),
('dureeConservation', 170, 'DurÃ©e de conservation des donnÃ©es', 'DurÃ©e dÃ©finie par les services eux-mÃªmes :\r\n- imposÃ©e par la rÃ¨glementation et/ou\r\n- utile pour le service', 'M', '', 30, 'N', 30, 'N'),
('finalite', 30, 'FinalitÃ©', 'Objectif principal. Exemples de finalitÃ© : gestion des recrutements, gestion des activitÃ©s scolaires, surveillance des locaux, etc...', 'M', '', 400, 'O', 10, 'N'),
('limitationConservation', 275, 'Dans le cas oÃ¹ ce n''est pas effectif, que manque-t-il pour que ce soit le cas et quel dÃ©lai envisagez-vous ?', '', 'M', '', 400, 'N', 40, 'N'),
('localisation', 60, 'Localisation du traitement', 'Local, sur internet, prestataire...', 'U', '', 40, 'N', 10, 'N'),
('methodeArchivage', 310, 'Comment procÃ©dez-vous pour les archiver ?', '', 'M', '', 200, 'N', 40, 'N'),
('nom', 10, 'Nom', '', 'U', '', 255, 'O', 10, 'N'),
('origineDonnees', 200, 'Origine des donnÃ©es (flux d''entrÃ©e)', 'D''oÃ¹ proviennent-elles, qui les a fournies ?', 'U', '', 100, 'N', 30, 'N'),
('PIA_realisee', 228, 'Avez-vous rÃ©alisÃ© l''Etude d''Impact sur la Vie PrivÃ©e ?', 'Si votre traitement est "trÃ¨s prioritaire" vous devez conduire une analyse d''impact sur la protection des donnÃ©es Pour cela suivez les instructions de la notice, action 4 - D.', 'L', 'ONEC', 1, 'N', 37, 'N'),
('PIA_resultat', 229, 'RÃ©sultat de l''Ã©tude', 'Risques identifiÃ©s et mesures prises', 'M', '', 200, 'N', 37, 'N'),
('presenceDonneesSensibles', 155, 'PrÃ©sence de donnÃ©es sensibles', '', 'L', 'ON', 1, 'O', 30, 'N'),
('presenceSousTrce', 600, 'Vous ou votre Ã©diteur, mettez-vous en oeuvre de la sous-traitance ?', 'Concernant l''Ã©diteur, veuillez vÃ©rifier auprÃ¨s de votre rÃ©fÃ©rent logiciel DSI.', 'L', 'ON', 1, 'N', 56, 'N'),
('priorite', 220, 'PrioritÃ©', 'DÃ©terminer cette prioritÃ© Ã  l''aide du paragraphe "PrioritÃ© du traitement" de la notice (encadrÃ© jaune) et aprÃ¨s le travail de catÃ©gorisation des donnÃ©es (rubrique prÃ©cÃ©dente)', 'L', 'PRIORITE', 20, 'O', 15, 'N'),
('reference', 20, 'RÃ©f.', '', 'U', '', 20, 'O', 10, 'N'),
('referent', 225, 'RÃ©fÃ©rent (gestionnaire des accÃ¨s aux donnÃ©es)', '"Super utilisateur" ou chef de projet utilisateur (CPU) de l''application, responsable des droits d''accÃ¨s.', 'U', '', 40, 'O', 35, 'N'),
('representant', 110, 'ReprÃ©sentant', 'Personne dÃ©signÃ©e par le responsable du traitement qui le reprÃ©sente en ce qui concerne leurs obligations respectives en vertu du RGPD (ex: responsable du service). Il est le garant du respect des obligations du RGPD.', 'U', '', 40, 'N', 20, 'N'),
('responsable', 100, 'Responsable du Traitement', 'Personne physique ou morale, l''autoritÃ© publique, le service ou un autre organisme qui, seul ou conjointement avec d''autres, dÃ©termine les finalitÃ©s et les moyens du traitement.\r\nDans le cas d''une ville, le responsable est Monsieur le Maire.', 'U', '', 40, 'N', 20, 'N'),
('responsableContratSousTrt', 620, 'Responsable du contrat de sous-traitance', '', 'U', '', 50, 'N', 56, 'N'),
('service', 40, 'Service', 'Service chargÃ© de la mise en oeuvre du traitement', 'S', 'SERVICE', 40, 'O', 10, 'N'),
('sousTraitants', 610, 'Sous- traitant(s) et objet de la sous-traitance', '', 'M', '', 400, 'N', 56, 'N'),
('statutMinimisationDonnees', 270, 'Pensez-vous avoir les donnÃ©es minimum pour rÃ©aliser votre traitement ?', 'Vous ne devez collecter et stocker que les informations dont vous avez besoin pour rÃ©aliser votre traitement. \r\nAprÃ¨s vÃ©rification, est-ce bien le cas ?', 'L', 'ON', 1, 'N', 40, 'N'),
('tempsConservation', 290, 'Combien de temps conservez-vous les donnÃ©es ?', '', 'U', '', 50, 'N', 40, 'N'),
('typeTraitement', 65, 'Type de traitement', '', 'L', 'TYPE_TRT', 60, 'N', 10, 'N');

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE IF NOT EXISTS `connexion` (
  `login` varchar(15) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `connexion`
--

INSERT INTO `connexion` (`login`, `timestamp`) VALUES
('odufour', '2018-04-23 17:49:02'),
('odufour', '2018-04-23 17:51:21'),
('odufour', '2018-04-23 17:54:44'),
('odufour', '2018-04-26 18:26:28'),
('fplantade', '2018-04-27 09:17:18'),
('vbongibault', '2018-04-27 09:22:09'),
('fplantade', '2018-05-07 17:14:48'),
('admin', '2018-05-09 17:20:02'),
('ydeydier', '2018-05-11 11:16:52'),
('admin', '2018-05-11 11:17:11'),
('ydeydier', '2018-05-11 11:17:24'),
('admin', '2018-05-11 11:18:37'),
('admin', '2018-05-11 11:19:31'),
('ydeydier', '2018-05-11 11:19:38'),
('ydeydier', '2018-05-11 11:25:29'),
('ydeydier', '2018-05-11 12:09:46'),
('ydeydier', '2018-05-11 14:20:52'),
('ydeydier', '2018-05-11 15:07:40'),
('ydeydier', '2018-05-11 15:44:59'),
('ydeydier', '2018-05-11 16:28:08');

-- --------------------------------------------------------

--
-- Structure de la table `direction`
--

CREATE TABLE IF NOT EXISTS `direction` (
  `idDirection` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`idDirection`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `direction`
--

INSERT INTO `direction` (`idDirection`, `libelle`) VALUES
(1, 'DCLS'),
(2, 'CTM'),
(3, 'DACV'),
(4, 'DCOM'),
(5, 'DF'),
(6, 'DFCP'),
(7, 'DGS'),
(8, 'DRH'),
(9, 'DSG'),
(10, 'DSI'),
(11, 'DVAS'),
(12, 'DIRECTION GENERALE'),
(13, 'INCONNU');

-- --------------------------------------------------------

--
-- Structure de la table `intitule`
--

CREATE TABLE IF NOT EXISTS `intitule` (
  `idIntitule` int(11) NOT NULL AUTO_INCREMENT,
  `ordre` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `libelle` varchar(60) NOT NULL,
  PRIMARY KEY (`idIntitule`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Contenu de la table `intitule`
--

INSERT INTO `intitule` (`idIntitule`, `ordre`, `type`, `libelle`) VALUES
(45, 1, 'PRIORITE', 'Non prioritaire'),
(46, 2, 'PRIORITE', 'Prioritaire'),
(47, 3, 'PRIORITE', 'TrÃ¨s prioritaire'),
(50, 1, 'ON', 'OUI'),
(51, 2, 'ON', 'NON'),
(52, 1, 'ONEC', 'OUI'),
(53, 2, 'ONEC', 'NON'),
(54, 3, 'ONEC', 'En cours'),
(55, 1, 'TYPE_TRT', 'Fichier CALC ou EXCEL'),
(56, 2, 'TYPE_TRT', 'Fichier WRITER ou WORD'),
(57, 3, 'TYPE_TRT', 'Logiciel mÃ©tier'),
(58, 4, 'TYPE_TRT', 'Ensemble de fichiers / dossier informatique');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `idService` int(11) NOT NULL AUTO_INCREMENT,
  `idDirection` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`idService`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`idService`, `idDirection`, `libelle`) VALUES
(1, 1, 'CCAS'),
(2, 2, 'CTM'),
(3, 3, 'BERP'),
(4, 3, 'DEVELOPPEMENT DURABLE'),
(5, 3, 'URBANISME'),
(6, 3, 'VILLE ET HABITAT'),
(7, 1, 'MEDIATHEQUE'),
(8, 4, 'DCOM'),
(9, 5, 'PAF'),
(10, 5, 'PETITE ENFANCE'),
(11, 6, 'FINANCES'),
(12, 6, 'MARCHES'),
(13, 6, 'DFCP'),
(14, 6, 'CONTROLE DE GESTION'),
(15, 7, 'ARCHE'),
(16, 8, 'DRH'),
(17, 9, 'DSG'),
(18, 9, 'COURRIER'),
(19, 9, 'QUARTIERS'),
(20, 9, 'ARCHIVES'),
(21, 10, 'CDS'),
(22, 10, 'SRT'),
(23, 11, 'VIE ASSOCIATIVE'),
(24, 12, 'ETAT CIVIL'),
(25, 13, 'INCONNU'),
(26, 12, 'POLICE MUNICIPALE'),
(27, 12, 'PREVENTION'),
(28, 3, 'DACV'),
(29, 8, 'COURRIERS'),
(30, 8, 'EMPLOI'),
(31, 8, 'RECRUTEMENT'),
(32, 8, 'CARRIERE PAIE'),
(33, 8, 'PROTECTION SOCIALE'),
(34, 8, 'STAGIAIRES ECOLES'),
(35, 8, 'COMMUNICATION INTERNE'),
(36, 8, 'SYNDICATS'),
(37, 8, 'FORMATION');

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
  `idService` int(11) DEFAULT NULL,
  `finalite` varchar(400) DEFAULT NULL,
  `priorite` varchar(20) NOT NULL,
  `localisation` varchar(40) DEFAULT NULL,
  `typeTraitement` varchar(60) NOT NULL,
  `detailFinalite` varchar(400) DEFAULT NULL,
  `responsable` varchar(40) DEFAULT NULL,
  `representant` varchar(40) DEFAULT NULL,
  `referent` varchar(40) DEFAULT NULL,
  `presenceSousTrce` char(3) DEFAULT NULL,
  `categorieDonneesNonSens` varchar(400) DEFAULT NULL,
  `categorieDonneesSens` varchar(400) DEFAULT NULL,
  `dureeConservation` varchar(30) DEFAULT NULL,
  `presenceDonneesSensibles` char(3) DEFAULT NULL,
  `PIA_realisee` char(8) DEFAULT NULL,
  `PIA_resultat` varchar(200) NOT NULL,
  `origineDonnees` varchar(100) DEFAULT NULL,
  `destinationDonnees` varchar(100) DEFAULT NULL,
  `droitAccesRevisionDate` varchar(60) NOT NULL,
  `droitAccesRevisionComment` varchar(150) NOT NULL,
  `droitAccesProcessus` varchar(250) DEFAULT NULL,
  `droitAccesOk` char(8) DEFAULT NULL,
  `droitEffacementProcessus` varchar(250) DEFAULT NULL,
  `droitEffacementOk` char(8) DEFAULT NULL,
  `consentementTrace` char(3) NOT NULL,
  `consentementComment` varchar(200) NOT NULL,
  `consentementDelai` varchar(200) NOT NULL,
  `tempsConservation` varchar(50) DEFAULT NULL,
  `methodeArchivage` varchar(200) DEFAULT NULL,
  `archivageEfficace` char(3) NOT NULL,
  `commentArchivageEfficace` varchar(250) NOT NULL,
  `statutMinimisationDonnees` char(3) DEFAULT NULL,
  `droitOppositionProcessus` varchar(250) DEFAULT NULL,
  `droitOppositionOk` char(8) DEFAULT NULL,
  `droitViolation` varchar(250) NOT NULL,
  `droitViolationOk` char(8) NOT NULL,
  `limitationConservation` varchar(300) DEFAULT NULL,
  `droitPortabiliteProcessus` varchar(250) DEFAULT NULL,
  `droitPortabiliteOk` char(8) DEFAULT NULL,
  `droitRectifProcessus` varchar(250) NOT NULL,
  `droitRectifOk` char(8) NOT NULL,
  `sousTraitants` varchar(300) DEFAULT NULL,
  `responsableContratSousTrt` varchar(50) DEFAULT NULL,
  `clausesRedigees` char(3) DEFAULT NULL,
  `destinataireHorsUE` char(3) DEFAULT NULL,
  PRIMARY KEY (`idTraitement`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=206 ;

--
-- Contenu de la table `traitement`
--

INSERT INTO `traitement` (`idTraitement`, `timestamp`, `corbeille`, `quimaj`, `nom`, `reference`, `idService`, `finalite`, `priorite`, `localisation`, `typeTraitement`, `detailFinalite`, `responsable`, `representant`, `referent`, `presenceSousTrce`, `categorieDonneesNonSens`, `categorieDonneesSens`, `dureeConservation`, `presenceDonneesSensibles`, `PIA_realisee`, `PIA_resultat`, `origineDonnees`, `destinationDonnees`, `droitAccesRevisionDate`, `droitAccesRevisionComment`, `droitAccesProcessus`, `droitAccesOk`, `droitEffacementProcessus`, `droitEffacementOk`, `consentementTrace`, `consentementComment`, `consentementDelai`, `tempsConservation`, `methodeArchivage`, `archivageEfficace`, `commentArchivageEfficace`, `statutMinimisationDonnees`, `droitOppositionProcessus`, `droitOppositionOk`, `droitViolation`, `droitViolationOk`, `limitationConservation`, `droitPortabiliteProcessus`, `droitPortabiliteOk`, `droitRectifProcessus`, `droitRectifOk`, `sousTraitants`, `responsableContratSousTrt`, `clausesRedigees`, `destinataireHorsUE`) VALUES
(1, '2018-05-11 16:55:06', 'N', 'ydeydier', 'SONATE', 'REF_1', 1, 'Logiciel CCAS / CIAS, accueil, aides lÃ©gales et facultatives, logements, suivi social et RSA, portage de repas, aides Ã  domicile', '', 'Local', 'Logiciel mÃ©tier', '', 'Monsieur le Maire', 'Fabienne SIONNEAU', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Editeur ARPEGE', 'La DSI / Resp. Application', '', ''),
(2, '2018-04-09 18:02:07', 'N', 'dsi', 'PASSERELLE', 'REF_2', 1, 'Gestion de la Banque Alimentaire', '', 'LOCAL', '', '', 'Monsieur le Maire', 'Anthony RAMOND', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, '2018-04-09 18:02:07', 'N', 'dsi', 'OMEGA (MÃ©tropole)', 'REF_3', 2, 'Liste des clients, avec comme donnÃ©es personnelles : leur adresse, mail, tÃ©lÃ©phone, consommations d''eau', '', '', '', '', 'Monsieur le Maire', 'METROPOLE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),

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
(1, 'dsi', 'dsi', 'DSI', '', 'N'),
(2, 'admin', 'admin', 'Administrateur', '', 'O');
