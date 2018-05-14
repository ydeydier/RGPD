-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Lun 23 Avril 2018 à 15:11
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=81 ;

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
(56, 'Sous-Traitance (nouveautÃ© RGPD)', 'Cf. notice -> Autres obligations -> contrats et sous-traitance'),
(57, 'Mesures de sÃ©curitÃ© SpÃ©cifiques', ''),
(70, 'Transfert(s) hors UE', '');

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
('archivageEfficace', 320, 'Pensez-vous que votre processus d''archivage soit efficace ?', '', 'L', 'ON', 0, 'N', 40, 'N'),
('categorieDonneesNonSens', 140, 'Reporter les catÃ©gories de donnÃ©es NON SENSIBLES utilisÃ©es dans le traitement', '- Etat civil (identitÃ©, donnÃ©es d''identification, imagesâ€¦)\r\n- Vie personnelle (habitudes de vie, situation familiale...)\r\n- Informations d''ordre Ã©conomique et financier (revenus, situation financiÃ¨re, situation fiscale, etc.)\r\n- DonnÃ©es de connexion (adresse IP, logs...)\r\n- Localisation (dÃ©placements, donnÃ©es GPS, GSM...)', 'M', '', 400, 'N', 30, 'N'),
('categorieDonneesSens', 150, 'Reporter les catÃ©gories de donnÃ©es SENSIBLES utilisÃ©es dans le traitement', '- Origine prÃ©tendument raciale ou ethnique.\r\n- Opinions politiques, philosophiques ou religieuses.\r\n- Appartenance syndicale.\r\n- SantÃ© ou lâ€™orientation sexuelle.\r\n- GÃ©nÃ©tiques ou biomÃ©triques.\r\n- Infraction ou condamnation pÃ©nale.', 'M', '', 400, 'N', 30, 'N'),
('commentArchivageEfficace', 330, 'Si cela n''est pas le cas, que manquerait-il pour le rendre efficace ? (Ã©volution du logiciel...)', '', 'M', '', 250, 'N', 40, 'N'),
('complementMesures', 720, 'ComplÃ©ment(s)', '', 'M', '', 400, 'N', 57, 'N'),
('consentementComment', 250, 'Mise en oeuvre du recueil du consentement', 'Comment envisagez-vous ou matÃ©rialisez-vous le recueil de ce consentement ? (case Ã  cocher papier ou informatique, avec signature)', 'M', '', 200, 'N', 38, 'N'),
('consentementDelai', 260, 'DÃ©lais de mise en oeuvre', 'Si cette preuve n''est pas effective, quel dÃ©lai vous imposez-vous pour se conformer au RGPD sur ce point ?', 'M', '', 0, 'N', 38, 'N'),
('consentementTrace', 240, 'Consentement de la personne', 'Avez-vous une trace du consentement de la personne pour laquelle vous rÃ©alisez le traitement ?', 'L', 'ON', 0, 'N', 38, 'N'),
('destinataireHorsUE', 760, 'Destinataire(s)', '', 'M', '', 200, 'N', 70, 'N'),
('destinationDonnees', 210, 'Destination des donnÃ©es (flux de sortie)', 'Qui utilise les donnÃ©es ?\r\n- au sein du service\r\n- au sein de la mairie\r\n- transmises Ã  l''extÃ©rieur (hors mairie) ?', 'U', '', 100, 'N', 30, 'N'),
('detailFinalite', 70, 'DÃ©tail de la finalitÃ©', 'Exemple : fondement juridique...', 'M', '', 400, 'N', 10, 'N'),
('droitAccesOk', 510, 'Ce processus est-il en place ?', '', 'L', 'ONEC', 0, 'N', 55, 'N'),
('droitAccesProcessus', 500, 'Comment rÃ©pondez-vous aux demandes d''accÃ¨s des personnes Ã  leurs informations ?', 'Cf. notice -> Action 4 -> Point I', 'M', '', 250, 'N', 55, 'N'),
('droitAccesRevisionComment', 226, 'ModalitÃ©s', 'Comment cette rÃ©vision sera-t-elle opÃ©rÃ©e ?', 'M', '', 150, 'N', 35, 'N'),
('droitAccesRevisionDate', 227, 'PÃ©riodicitÃ© de vÃ©rification des droits d''accÃ¨s', 'Elle doit Ãªtre cohÃ©rente avec les mouvements au sein du service.\r\n- Mensuelle\r\n- Trimestrielle\r\n- Semestrielle\r\n- Annuelle', 'U', '', 60, 'N', 35, 'N'),
('droitEffacementOk', 550, 'Ce processus est-il en place ?', '', 'L', 'ONEC', 0, 'N', 55, 'N'),
('droitEffacementProcessus', 540, 'Comment rÃ©pondez-vous aux demandes d''effacement des DCP ("Droit Ã  l''oubli") ?', 'Cf. notice -> Action 4 -> Point I', 'M', '', 250, 'N', 55, 'N'),
('droitOppositionOk', 590, 'Ce processus est-il en place ?', '', 'L', 'ONEC', 0, 'N', 55, 'N'),
('droitOppositionProcessus', 580, 'Comment rÃ©pondez-vous aux demandes de d''opposition (=retrait du consentement) ?', 'Cf. notice -> Action 4 -> Point I', 'M', '', 250, 'N', 55, 'N'),
('droitPortabiliteOk', 570, 'Ce processus est-il en place ?', '', 'L', 'ONEC', 0, 'N', 55, 'N'),
('droitPortabiliteProcessus', 560, 'Comment rÃ©pondez-vous aux demandes de portabilitÃ© des donnÃ©es ?', 'Cf. notice -> Action 4 -> Point I', 'M', '', 250, 'N', 55, 'N'),
('droitRectifOk', 530, 'Ce processus est-il en place ?', '', 'L', 'ONEC', 0, 'N', 55, 'N'),
('droitRectifProcessus', 520, 'Comment rÃ©pondez-vous aux demandes de rectification des DCP (donnÃ©es Ã  caractÃ¨re personnel) ?', 'Cf. notice -> Action 4 -> Point I', 'M', '', 250, 'N', 55, 'N'),
('dureeConservation', 170, 'DurÃ©e de conservation des donnÃ©es', 'DurÃ©e dÃ©finie par les services eux-mÃªmes :\r\n- imposÃ©e par la rÃ¨glementation et/ou\r\n- utile pour le service', 'M', '', 30, 'N', 30, 'N'),
('finalite', 30, 'FinalitÃ©', 'Objectif principal. Exemples de finalitÃ© : gestion des recrutements, gestion des activitÃ©s scolaires, surveillance des locaux, etc...', 'M', '', 400, 'O', 10, 'N'),
('garantiesHorsUE', 780, 'Type(s) de Garanties', '', 'M', '', 400, 'N', 70, 'N'),
('limitationConservation', 275, 'Autrement, que mettez vous en oeuvre pour rÃ©duire les informations au minimum ?', '', 'M', '', 400, 'N', 40, 'N'),
('localisation', 60, 'Localisation du traitement', 'Local, sur internet, prestataire...', 'U', '', 40, 'N', 10, 'N'),
('mesuresOrga', 710, 'Mesures organisationnelles', '', 'M', '', 400, 'N', 57, 'N'),
('mesuresTechniques', 700, 'Mesures techniques', '', 'M', '', 400, 'N', 57, 'N'),
('methodeArchivage', 310, 'Comment procÃ©dez-vous pour les archiver ?', '', 'M', '', 200, 'N', 40, 'N'),
('nom', 10, 'Nom', '', 'U', '', 255, 'O', 10, 'N'),
('origineDonnees', 200, 'Origine des donnÃ©es (flux d''entrÃ©e)', 'D''oÃ¹ proviennent-elles, qui les a fournies ?', 'U', '', 100, 'N', 30, 'N'),
('paysHorsUE', 770, 'Pays', '', 'M', '', 200, 'N', 70, 'N'),
('PIA_realisee', 228, 'Avez-vous rÃ©alisÃ© l''Etude d''Impact sur la Vie PrivÃ©e ?', 'Si votre traitement est "trÃ¨s prioritaire" vous devez conduire une analyse d''impact sur la protection des donnÃ©es Pour cela suivez les instructions de la notice, action 4 - D.', 'L', 'ONEC', 1, 'N', 37, 'N'),
('PIA_resultat', 229, 'RÃ©sultat de l''Ã©tude', 'Risques identifiÃ©s et mesures prises', 'M', '', 200, 'N', 37, 'N'),
('presenceDonneesSensibles', 155, 'PrÃ©sence de donnÃ©es sensibles', '', 'L', 'ON', 1, 'O', 30, 'N'),
('presenceSousTrce', 600, 'PrÃ©sence de sous-Traitance', '', 'L', 'ON', 1, 'N', 56, 'N'),
('priorite', 220, 'PrioritÃ©', 'DÃ©terminer cette prioritÃ© Ã  l''aide du paragraphe "PrioritÃ© du traitement" de la notice (encadrÃ© jaune) et aprÃ¨s le travail de catÃ©gorisation des donnÃ©es (rubrique prÃ©cÃ©dente)', 'L', 'PRIORITE', 20, 'O', 15, 'N'),
('reference', 20, 'RÃ©f.', '', 'U', '', 20, 'O', 10, 'N'),
('referent', 225, 'RÃ©fÃ©rent (gestionnaire des accÃ¨s aux donnÃ©es)', '"Super utilisateur" ou chef de projet utilisateur (CPU) de l''application, responsable des droits d''accÃ¨s.', 'U', '', 40, 'O', 35, 'N'),
('remarqueSousTrt', 630, 'Remarque(s)', '', 'M', '', 400, 'N', 56, 'N'),
('representant', 110, 'ReprÃ©sentant', 'Personne dÃ©signÃ©e par le responsable du traitement qui le reprÃ©sente en ce qui concerne leurs obligations respectives en vertu du RGPD (ex: responsable du service). Il est le garant du respect des obligations du RGPD.', 'U', '', 40, 'N', 20, 'N'),
('responsable', 100, 'Responsable du Traitement', 'Personne physique ou morale, l''autoritÃ© publique, le service ou un autre organisme qui, seul ou conjointement avec d''autres, dÃ©termine les finalitÃ©s et les moyens du traitement.\r\nDans le cas d''une ville, le responsable est Monsieur le Maire.', 'U', '', 40, 'N', 20, 'N'),
('responsableContratSousTrt', 620, 'Responsable du contrat de sous-traitance', '', 'U', '', 50, 'N', 56, 'N'),
('service', 40, 'Service', 'Service chargÃ© de la mise en oeuvre du traitement', 'L', 'SERVICE', 40, 'O', 10, 'N'),
('sousTraitants', 610, 'Sous- traitant(s)', '', 'M', '', 400, 'N', 56, 'N'),
('statutMinimisationDonnees', 270, 'Pensez-vous avoir les donnÃ©es minimum pour rÃ©aliser votre traitement ?', 'Autre formulation de la question : vous ne devez collecter et stocker que les donnÃ©es strictement nÃ©cessaires Ã  vos traitements.\r\nEst-ce bien le cas ?', 'L', 'ON', 1, 'N', 40, 'N'),
('tempsConservation', 290, 'Combien de temps conservez-vous les donnÃ©es ?', '', 'U', '', 50, 'N', 40, 'N');

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
('dsi', '2018-04-23 14:01:35'),
('admin', '2018-04-23 14:24:06'),
('dsi', '2018-04-23 14:27:02'),
('ydeydier', '2018-04-23 14:27:56'),
('admin', '2018-04-23 14:31:24'),
('ydeydier', '2018-04-23 14:36:13'),
('ydeydier', '2018-04-23 15:01:32'),
('admin', '2018-04-23 15:03:06'),
('ydeydier', '2018-04-23 15:07:19');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Contenu de la table `intitule`
--

INSERT INTO `intitule` (`idIntitule`, `ordre`, `type`, `libelle`) VALUES
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
(39, 0, 'SERVICE', '~~ Ajouter un service ~~'),
(45, 1, 'PRIORITE', 'Non prioritaire'),
(46, 2, 'PRIORITE', 'Prioritaire'),
(47, 3, 'PRIORITE', 'TrÃ¨s prioritaire'),
(50, 1, 'ON', 'OUI'),
(51, 2, 'ON', 'NON'),
(52, 1, 'ONEC', 'OUI'),
(53, 2, 'ONEC', 'NON'),
(54, 3, 'ONEC', 'En cours');

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
  `priorite` varchar(20) NOT NULL,
  `localisation` varchar(40) DEFAULT NULL,
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
  `limitationConservation` varchar(300) DEFAULT NULL,
  `droitPortabiliteProcessus` varchar(250) DEFAULT NULL,
  `droitPortabiliteOk` char(8) DEFAULT NULL,
  `droitRectifProcessus` varchar(250) NOT NULL,
  `droitRectifOk` char(8) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=134 ;

--
-- Contenu de la table `traitement`
--

INSERT INTO `traitement` (`idTraitement`, `timestamp`, `corbeille`, `quimaj`, `nom`, `reference`, `service`, `finalite`, `priorite`, `localisation`, `detailFinalite`, `responsable`, `representant`, `referent`, `presenceSousTrce`, `categorieDonneesNonSens`, `categorieDonneesSens`, `dureeConservation`, `presenceDonneesSensibles`, `PIA_realisee`, `PIA_resultat`, `origineDonnees`, `destinationDonnees`, `droitAccesRevisionDate`, `droitAccesRevisionComment`, `droitAccesProcessus`, `droitAccesOk`, `droitEffacementProcessus`, `droitEffacementOk`, `consentementTrace`, `consentementComment`, `consentementDelai`, `tempsConservation`, `methodeArchivage`, `archivageEfficace`, `commentArchivageEfficace`, `statutMinimisationDonnees`, `droitOppositionProcessus`, `droitOppositionOk`, `limitationConservation`, `droitPortabiliteProcessus`, `droitPortabiliteOk`, `droitRectifProcessus`, `droitRectifOk`, `mesuresTechniques`, `mesuresOrga`, `complementMesures`, `sousTraitants`, `responsableContratSousTrt`, `remarqueSousTrt`, `destinataireHorsUE`, `paysHorsUE`, `garantiesHorsUE`) VALUES
(1, '2018-04-23 15:10:02', 'N', 'ydeydier', 'SONATE', 'REF_1', 'DCLS - CCAS', 'Logiciel CCAS / CIAS, accueil, aides lÃ©gales et facultatives, logements, suivi social et RSA, portage de repas, aides Ã  domicile', '', 'Local', '', 'Monsieur le Maire', 'Fabienne SIONNEAU', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Editeur ARPEGE', 'La DSI / Resp. Application', 'HÃ©bergement en local Ã  la Mairie.\r\nContrat de service pour la maintenance et le support (avec un accÃ¨s Ã  distance).', 'Non', '', ''),
(2, '2018-04-09 18:02:07', 'N', 'dsi', 'PASSERELLE', 'REF_2', 'DCLS - CCAS', 'Gestion de la Banque Alimentaire', '', 'LOCAL', '', 'Monsieur le Maire', 'Anthony RAMOND', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, '2018-04-09 18:02:07', 'N', 'dsi', 'OMEGA (MÃ©tropole)', 'REF_3', 'CTM - CTM', 'Liste des clients, avec comme donnÃ©es personnelles : leur adresse, mail, tÃ©lÃ©phone, consommations d''eau', '', '', '', 'Monsieur le Maire', 'METROPOLE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, '2018-04-09 18:02:07', 'N', 'dsi', 'ASTECH', 'REF_4', 'CTM - CTM', '', '', 'LOCAL', '', 'Monsieur le Maire', 'Denis MOULIN', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, '2018-04-09 18:02:07', 'N', 'dsi', 'Maisons fleuries', 'REF_5', 'CTM - CTM', 'Fichier Excel des abraysiens participant aux maisons fleuries.', '', 'LOCAL', '', 'Monsieur le Maire', 'FrÃ©dÃ©ric VIAUD', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, '2018-04-09 18:02:07', 'N', 'dsi', 'Astreintes', 'REF_6', 'CTM - CTM', 'Liste des agents susceptibles d''Ãªtre appelÃ©s en astreinte ou renfort d''astreinte : noms, adresses, numÃ©ros de tÃ©lÃ©phone.', '', 'LOCAL', '', 'Monsieur le Maire', 'Nadine DELAPORTE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(7, '2018-04-09 18:02:07', 'N', 'dsi', 'Tailles et pointures', 'REF_7', 'CTM - CTM', 'Fichier des tailles et pointures des agents pour les vÃªtements de travail', '', 'LOCAL', '', 'Monsieur le Maire', 'Nadine DELAPORTE', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(8, '2018-04-09 18:02:07', 'N', 'dsi', 'Permis et habilitations', 'REF_8', 'CTM - CTM', 'Fichier des permis et habilitations des agents', '', 'LOCAL', '', 'Monsieur le Maire', 'Nadine DELAPORTE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, '2018-04-09 18:02:07', 'N', 'dsi', 'Permis', 'REF_9', 'CTM - CTM', 'Cahier reprenant toutes les copies des permis et caces des agents du CTM', '', 'LOCAL', '', 'Monsieur le Maire', 'Nadine DELAPORTE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(10, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_10', 'CTM - CTM', 'Fiches en T dans le bureau de Nadine : nom, numÃ©ro de tÃ©lÃ©phone', '', 'LOCAL', '', 'Monsieur le Maire', 'Nadine DELAPORTE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(11, '2018-04-09 18:02:07', 'N', 'dsi', 'Evaluations', 'REF_11', 'CTM - CTM', 'La ressource Y contient toutes les Ã©valuations des agents. Par ailleurs, dans nos dossiers, nous pouvons conserver des rapports sur les agents. ', '', 'LOCAL', '', 'Monsieur le Maire', 'Emmanuelle LE MENEZ', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(12, '2018-04-09 18:02:07', 'N', 'dsi', 'Photos', 'REF_12', 'CTM - CTM', 'Dans nos fichiers, nous avons aussi des photos de certains agents, mais sans possibilitÃ© de mettre un nom sur les personnes photographiÃ©es.', '', 'LOCAL', '', 'Monsieur le Maire', 'Nadine DELAPORTE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(13, '2018-04-10 09:33:23', 'N', 'dsi', 'ALX', 'REF_13', 'CTM - CTM', 'gestion des pompes Ã  essence du CTM', '', 'LOCAL', '', 'Monsieur le Maire', 'Denis MOULIN', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(14, '2018-04-09 18:02:07', 'N', 'dsi', 'LSM', 'REF_14', 'CTM - CTM', 'Gestion des accÃ¨s aux batiments (donnÃ©es professionnelles, usages)', '', 'LOCAL', '', 'Monsieur le Maire', 'Denis MET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(15, '2018-04-09 18:02:07', 'N', 'dsi', 'Installations classÃ©es', 'REF_15', 'CTM - CTM', 'Gestion des installations classÃ©es dans le cadre du plan municipal de sÃ©curitÃ©', '', 'LOCAL', '', 'Monsieur le Maire', 'Marie-CÃ©line TYSSIER', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(16, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_16', 'DACV - BERP', 'Pour les surbaissements de bordures: liste de noms, adresses', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(17, '2018-04-09 18:03:23', 'N', 'dsi', '', 'REF_17', '', 'Pour les arrÃªtÃ©s de voirie, au profit de quelques particuliers en direct (Ã©chafaudage, dÃ©pÃ´t de matÃ©riaux...) et au profit d''entreprises de travaux, pour le compte de particuliers (branchements rÃ©seaux...) : liste rÃ©capitulative des arrÃªtÃ©s: noms, adresses', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(18, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_18', 'DACV - DEVELOPPEMENT DURABLE', 'Ensemble des listings liÃ©s aux divers groupes de travail dÃ©veloppement durable.', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(19, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_19', 'DACV - DEVELOPPEMENT DURABLE', 'Liste " arbres remarquables "', '', 'LOCAL', '', 'Monsieur le Maire', 'Jean-Pierre ORANGE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(20, '2018-04-10 09:33:49', 'N', 'dsi', 'CARTADS', 'REF_20', 'DACV - URBANISME', 'Demandes d''autorisation d''urbanisme (permis de construire, permis d''amÃ©nager, permis de dÃ©molir, dÃ©claration prÃ©alable, certificat d''urbanisme, autorisation de travaux) pour lesquelles il y a,les adresses, les no de tÃ©lÃ©phone, les dates de naissance.', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(21, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_21', 'DACV - URBANISME', 'DÃ©clarations d''intention d''aliÃ©ner (noms, adresses, prix de vente des biens)', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(22, '2018-04-09 18:03:54', 'N', 'dsi', '', 'REF_22', '', 'Conventions de mise Ã  disposition (nom, adresse, loyers...)', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(23, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_23', 'DACV - URBANISME', 'Dossiers " risques inondation, sÃ©cheresse " : nom, adresse, tÃ©l, mail', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(24, '2018-04-10 10:23:13', 'N', 'dsi', '', 'REF_24', 'DACV - URBANISME', 'Conventions (logement, local, parking Becquerel, antennes) : en plus des coordonnÃ©es (nom, adresse, tÃ©l, mail),il y a aussi la date de naissance (pour les impÃ´ts), la situation familiale (pour logements de fonction) et quelques attestations d''assurance (parking Becquerel)', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(25, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_25', 'DACV - URBANISME', 'Liste des potentiels acquÃ©reurs Miramion', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(26, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_26', 'DACV - URBANISME', 'RÃ©unions riverains (en cas de travaux ou de constructions)', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(27, '2018-04-09 18:02:07', 'N', 'dsi', 'INTRAGEO', 'REF_27', 'DACV - URBANISME', 'DonnÃ©es gÃ©ographiques', '', 'LOCAL', '', 'Monsieur le Maire', 'Jacky GIVERNAUD', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(28, '2018-04-09 18:02:07', 'N', 'dsi', 'MAJIC3 - EDIGEO', 'REF_28', 'DACV - URBANISME', 'Fichiers cadastraux', '', 'LOCAL', '', 'Monsieur le Maire', 'Sylvaine CRAMPETTE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(29, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_29', 'DACV - VILLE ET HABITAT', 'Liste des membres de l''ATU Ecoquartier et des groupes de travail Ecoquartier et autres ATU (ECLO, CENTRE VILLE, PLU)', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(30, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_30', 'DACV - VILLE ET HABITAT', 'Dossiers contentieux (exemple : contacts maisons passives)', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(31, '2018-04-10 10:22:14', 'N', 'dsi', '', 'REF_31', 'DACV - VILLE ET HABITAT', 'Liste Ã©tudiants reÃ§us Ã  la DACV (coordonnÃ©es dans le logiciel outlook)', '', 'LOCAL', '', 'Monsieur le Maire', 'Magali CIET', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(32, '2018-04-09 18:02:07', 'N', 'dsi', 'ORPHEE', 'REF_32', 'DCLS - MEDIATHEQUE', 'Gestion de la mÃ©diathÃ¨que / Portail (Ã©tat-civil, donnÃ©es d''usage)\r\n- Statistiques globales uniquement (pas nominatives)\r\n- pas de liaison emprunts / emprunteurs', '', 'LOCAL', '', 'Monsieur le Maire', 'ValÃ©rie BONGIBAULT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(33, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_33', 'DCLS - MEDIATHEQUE', 'Communication aux usagers intÃ©ressÃ©s par les actions culturelles de la mÃ©diathÃ¨que', '', 'LOCAL', '', 'Monsieur le Maire', 'ValÃ©rie BONGIBAULT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(34, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_34', 'DCLS - MEDIATHEQUE', 'Listes d''adresses en vue d''envoi d''informations', '', 'LOCAL', '', 'Monsieur le Maire', 'Flavie RENAULT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(35, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_35', 'DCOM - DCOM', 'Communication politique', '', 'LOCAL', '', 'Monsieur le Maire', 'Sylvain BRIENT', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(36, '2018-04-09 18:02:07', 'N', 'dsi', 'SITE INTERNET', 'REF_36', 'DCOM - DCOM', 'Site Internet de la ville', '', 'EXTERNALISE', '', 'Monsieur le Maire', 'Sylvain BRIENT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(37, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_37', 'DF - PAF', 'dossiers papiers pour chacune des familles utilisant des prestations ville (agents de l''EAF)', '', 'LOCAL', '', 'Monsieur le Maire', 'FrÃ©dÃ©ric GUYOT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(38, '2018-04-09 18:02:07', 'N', 'dsi', 'MAELIS', 'REF_38', 'DF - PAF', 'Gestion des activitÃ©s pÃ©riscolaire et restauration', '', 'LOCAL', '', 'Monsieur le Maire', 'FrÃ©dÃ©ric GUYOT', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(39, '2018-04-09 18:02:07', 'N', 'dsi', 'portail familles', 'REF_39', 'DF - PAF', 'Portail des activitÃ©s pÃ©riscolaire et restauration', '', 'EXTERNALISE', '', 'Monsieur le Maire', 'FrÃ©dÃ©ric GUYOT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(40, '2018-04-10 10:22:31', 'N', 'dsi', 'BASE ELEVE', 'REF_40', 'DF - PAF', 'accÃ¨s Ã  la base ONDE (ex-base Ã©lÃ¨ves) (Responsable PAF)', '', 'EXTERNALISE', '', 'Monsieur le Maire', 'FrÃ©dÃ©ric GUYOT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(41, '2018-04-10 10:24:46', 'N', 'dsi', 'CAFPRO', 'REF_41', 'DF - PAF', 'accÃ¨s Ã  CAFPRO pour recherche des QF des familles  (agents de l''EAF)', '', 'EXTERNALISE', '', 'Monsieur le Maire', 'Raoul DAUPEUX', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(42, '2018-04-09 18:02:07', 'N', 'dsi', 'GRAM', 'REF_42', 'DF - PETITE ENFANCE', 'Gestion du RAM', '', 'LOCAL', '', 'Monsieur le Maire', 'VÃ©ronique MARCHAND', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(43, '2018-04-09 18:02:07', 'N', 'dsi', 'GSS', 'REF_43', 'DF - PAF', 'Gestion de stock', '', 'LOCAL', '', 'Monsieur le Maire', 'Brigitte Bouchareine', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(44, '2018-04-09 18:02:07', 'N', 'dsi', 'CONCERTO', 'REF_44', 'DF - PETITE ENFANCE', 'Logiciel petite enfance', '', 'LOCAL', '', 'Monsieur le Maire', 'Raoul DAUPEUX', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(45, '2018-04-09 18:02:07', 'N', 'dsi', 'SEDIT GF', 'REF_45', 'DFCP - FINANCES', 'Gestion financiÃ¨re de la commune (nom, prÃ©nom, donnÃ©es bancaires)', '', 'EXTERNALISE', '', 'Monsieur le Maire', 'Nicolas POCHARD', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(46, '2018-04-10 10:24:33', 'N', 'dsi', 'INFINE', 'REF_46', 'DFCP - FINANCES', 'Outil d''aide Ã  la dÃ©cision FINANCES', '', 'EXTERNALISE', '', 'Monsieur le Maire', 'Nicolas POCHARD', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(47, '2018-04-10 10:24:19', 'N', 'dsi', 'INSITO', 'REF_47', 'DFCP - FINANCES', 'Outil d''aide Ã  la dÃ©cision FINANCES', '', 'EXTERNALISE', '', 'Monsieur le Maire', 'Nicolas POCHARD', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(48, '2018-04-09 18:02:07', 'N', 'dsi', 'TLPE', 'REF_48', 'DFCP - FINANCES', 'Taxe local sur la publicitÃ© des entreprises', '', 'LOCAL', '', 'Monsieur le Maire', 'Nicolas POCHARD', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(49, '2018-04-09 18:02:07', 'N', 'dsi', 'NEMAUSIC Finances', 'REF_49', 'DFCP - FINANCES', 'Ancien logiciel Finances', '', 'LOCAL', '', 'Monsieur le Maire', 'Nicolas POCHARD', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(50, '2018-04-09 18:02:07', 'N', 'dsi', 'SIS MARCHE', 'REF_50', 'DFCP - MARCHES', 'Gestion des marchÃ©s publics', '', 'LOCAL', '', 'Monsieur le Maire', 'Marie-Christine RODRIGUEZ', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(51, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_51', 'DFCP', 'ImpayÃ©s par chÃ¨que', '', 'LOCAL', '', 'Monsieur le Maire', 'Nicolas POCHARD', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(52, '2018-04-09 18:02:07', 'N', 'dsi', 'ENERGIE', 'REF_52', 'DFCP - CONTROLE DE GESTION', 'Facturation des consommations d''Ã©nergie', '', 'LOCAL', '', 'Monsieur le Maire', 'Bruno GENESTRE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(53, '2018-04-09 18:02:07', 'N', 'dsi', 'ARCHE - AGDE', 'REF_53', 'DGS - ARCHE', 'Gestion des donnÃ©es d''Ã©tablissements sur le territoire communal et de Boigny', '', 'LOCAL', '', 'Monsieur le Maire', 'RÃ©my POIGNANT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(54, '2018-04-09 18:02:07', 'N', 'dsi', 'Fichiers bureautiques RH', 'REF_54', 'DRH - DRH', 'Cf. onglet DRH, DaniÃ¨le', '', 'LOCAL', '', 'Monsieur le Maire', 'DaniÃ¨le BOULANT', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(55, '2018-04-09 18:02:07', 'N', 'dsi', 'SEDIT RH', 'REF_55', 'DRH - DRH', 'Gestion des Ressources Humaines', '', 'LOCAL', '', 'Monsieur le Maire', 'DaniÃ¨le BOULANT', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(56, '2018-04-09 18:02:07', 'N', 'dsi', 'NEMAUSIC RH', 'REF_56', 'DRH - DRH', 'Ancien logiciel RH', '', 'LOCAL', '', 'Monsieur le Maire', 'DaniÃ¨le BOULANT', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(57, '2018-04-09 18:02:07', 'N', 'dsi', 'HOROQUARTZ', 'REF_57', 'DRH - DRH', 'Gestion des heures supplÃ©mentaires', '', 'LOCAL', '', 'Monsieur le Maire', 'Emmanuelle LE MENEZ', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(58, '2018-04-09 18:02:07', 'N', 'dsi', 'GALPE', 'REF_58', 'DRH - DRH', 'Gestion du chomage', '', 'LOCAL', '', 'Monsieur le Maire', 'CÃ©line HAGLUND', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(59, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_59', 'DSG - DSG', 'Liste des conseils municipaux comportant date de naissance et adresse', '', 'LOCAL', '', 'Monsieur le Maire', 'Emilie THOMAS', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(60, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_60', 'DSG - DSG', '- Liste des conseils municipaux comportant date de naissance et adresse, \r\n- un tableau des membres des bureaux et membres par comitÃ© de quartier (soit 6 tableaux )\r\n- un tableau qui rÃ©capitule l''ensemble des bureaux des comitÃ©s (1 tableau )\r\n- une liste par bureau de comitÃ©  (6 listes)\r\n- une liste des prÃ©sidents des comitÃ©s (1 liste)\r\n- un tableau du groupe de travail pour le rÃ©amÃ©nageme', '', 'LOCAL', '', 'Monsieur le Maire', 'Emilie THOMAS', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(61, '2018-04-09 18:02:07', 'N', 'dsi', 'MAARCH', 'REF_61', 'DSG - COURRIER', 'Logiciel Maarch', '', 'LOCAL', '', 'Monsieur le Maire', 'AurÃ©lie LE BIHAN', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(62, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_62', 'DSG - QUARTIERS', 'Tableau des membres des bureaux et membres par comitÃ© de quartier (soit 6 tableaux)', '', 'LOCAL', '', 'Monsieur le Maire', 'Delphine TARAGON', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(63, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_63', 'DSG - QUARTIERS', 'Tableau qui rÃ©capitule l''ensemble des bureaux des comitÃ©s (1 tableau )', '', 'LOCAL', '', 'Monsieur le Maire', 'Delphine TARAGON', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(64, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_64', 'DSG - QUARTIERS', 'Liste par bureau de comitÃ©  (6 listes)', '', 'LOCAL', '', 'Monsieur le Maire', 'Delphine TARAGON', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(65, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_65', 'DSG - QUARTIERS', 'Liste des prÃ©sidents des comitÃ©s (1 liste)', '', 'LOCAL', '', 'Monsieur le Maire', 'Delphine TARAGON', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(66, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_66', 'DSG - QUARTIERS', 'Tableau du groupe de travail pour le rÃ©amÃ©nagement du boulevard Kennedy ', '', 'LOCAL', '', 'Monsieur le Maire', 'Delphine TARAGON', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(67, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_67', 'DSG - QUARTIERS', 'Tableau du groupe de travail pour la requalification du parc du Vallon St Loup ', '', 'LOCAL', '', 'Monsieur le Maire', 'Delphine TARAGON', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(68, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_68', 'DSG - QUARTIERS', 'Tableau du groupe de travail pour la requalification du parc des Armenault ', '', 'LOCAL', '', 'Monsieur le Maire', 'Delphine TARAGON', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(69, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_69', 'DSG - ARCHIVES', 'Tableau du service des archives pour la direction des ressources humaines concernant les anciens agents de la ville, ', '', 'LOCAL', '', 'Monsieur le Maire', 'Emilie THOMAS', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(70, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_70', 'DSG - ARCHIVES', 'Tableau du service des archives concernant les anciens permis de construire.', '', 'LOCAL', '', 'Monsieur le Maire', 'Emilie THOMAS', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(71, '2018-04-09 18:02:07', 'N', 'dsi', 'GLPI', 'REF_71', 'DSI - CDS', 'Inventaire du parc informatique et traitement des incidents (Nom, PrÃ©nom, service)', '', 'LOCAL', '', 'Monsieur le Maire', 'Olivier DUFOUR', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(72, '2018-04-09 18:02:07', 'N', 'dsi', 'Annuaire Active Directory', 'REF_72', 'DSI - SRT', 'Annuaire des utilisateurs informatiques de la mairie (nom, prÃ©nom, donnÃ©es professionnelles)', '', 'LOCAL', '', 'Monsieur le Maire', 'Olivier DUFOUR', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(73, '2018-04-10 10:25:30', 'N', 'dsi', 'CLEARPASS', 'REF_73', 'DSI - SRT', 'Historique des connexions wifi des utilisateurs Ã  conserver selon la lÃ©gislation', '', 'LOCAL', 'Exigence lÃ©gale de la loi LCEN du 21 juin 2004, Ã©tendu le 23 janvier 2006 Ã  l''ensemble des fournisseurs d''accÃ¨s Ã  Internet. ', 'Monsieur le Maire', 'Nicolas DROULIN', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(74, '2018-04-09 18:02:07', 'N', 'dsi', 'XIVO', 'REF_74', 'DSI - CDS', 'Annuaire tÃ©lÃ©phonique de la mairie (nom, prÃ©nom, donnÃ©es professionnelles, historique des usages des outils)', '', 'LOCAL', 'Exigence lÃ©gale de la loi  Code des postes et des Communications Electroniques (CPCE).', 'Monsieur le Maire', 'Nicolas DROULIN', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(75, '2018-04-09 18:02:07', 'N', 'dsi', 'PAPERCUT', 'REF_75', 'DSI - CDS', 'Gestion des copieurs (donnÃ©es professionnelles et usages)', '', 'LOCAL', '', 'Monsieur le Maire', 'Olivier DUFOUR', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(76, '2018-04-12 11:42:57', 'N', 'dsi', 'FORTIANALYZER', 'REF_76', 'DSI - SRT', 'Historique des connexions internet des utilisateurs mairie', '', 'LOCAL', 'Exigence lÃ©gale de la loi LCEN du 21 juin 2004, Ã©tendu le 23 janvier 2006 Ã  l''ensemble des fournisseurs d''accÃ¨s Internet.', 'Monsieur le Maire', 'Nicolas DROULIN', NULL, 'NON', 'Adresse IP (DHCP) & MAC, horodatage, URL, catÃ©gorie,', 'DonnÃ©es de connexion / techniques', '1 an', 'NON', 'NA', '', 'Pare feu FORTINET', 'DSI pour statistiques / Police Nationale sur rÃ©quisition.', '', '', 'Information des agents via la charte informatique.', 'OK', 'Obligation lÃ©gale', 'OK', '', '', '', 'Oui', 'uniquement les donnÃ©es strictement nÃ©cessaires', '', '', 'OK', '', 'OK', 'Limitation Ã  mettre en place dans la configuation. A ce jour, le limitation est basÃ©e sur la taille du disque.', 'Gestion des habilitations sur le FORTIANALYSER.\r\nVÃ©rifier si les log sont bien sauvegardÃ©s -> ODU : aprÃ¨s vÃ©rification, non les logs ne sont pas sauvegardÃ©s.\r\n', 'EC', '', '', '', '', '', '', '', '', '', '', ''),
(77, '2018-04-12 11:54:09', 'N', 'dsi', 'FORTIGATE', 'REF_77', 'DSI - SRT', 'Mesure de l''utilisation de la bande passante', '', 'LOCAL', '', 'Monsieur le Maire', 'Nicolas DROULIN', NULL, 'NON', '', 'DonnÃ©es de connexion / techniques', '1 an', 'NON', 'NA', '', 'Pare feu FORTINET', 'DSI pour statistiques / Police Nationale sur rÃ©quisition.', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(78, '2018-04-09 18:02:07', 'N', 'dsi', 'EXCHANGE ', 'REF_78', 'DSI - SRT', 'Messagerie d''entreprise', '', 'LOCAL', '', 'Monsieur le Maire', 'Olivier DUFOUR', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(79, '2018-04-10 10:25:43', 'N', 'dsi', 'PRINEO', 'REF_79', 'DSI - CDS', 'Gestion des soumissions de travaux Ã  la reprographie', '', 'LOCAL', '', 'Monsieur le Maire', 'Jonathan NIO', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(80, '2018-04-10 10:25:52', 'N', 'dsi', 'Subventions aux associations', 'REF_80', 'DVAS - VIE ASSOCIATIVE', 'Nous stockons de faÃ§on dÃ©matÃ©rialisÃ©e les statuts des associations avec les coordonnÃ©es des membres du bureau, les donnÃ©es bancaires des associations.', '', 'LOCAL', '', 'Monsieur le Maire', 'Elodie Bordonado', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(81, '2018-04-09 18:02:07', 'N', 'dsi', 'RÃ©gie', 'REF_81', 'DVAS - VIE ASSOCIATIVE', 'Tenue des registres avec talons de suivi (noms, numÃ©ro des chÃ¨ques)', '', 'LOCAL', '', 'Monsieur le Maire', 'ValÃ©rie Laugeray', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(82, '2018-04-09 18:02:07', 'N', 'dsi', 'Locations de salle', 'REF_82', 'DVAS - VIE ASSOCIATIVE', 'Dans le cadre des locations de salles, nous rÃ©ceptionnons des attestations d''assurance.', '', 'LOCAL', '', 'Monsieur le Maire', 'ValÃ©rie Laugeray', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(83, '2018-04-09 18:02:07', 'N', 'dsi', 'Veille associative', 'REF_83', 'DVAS - VIE ASSOCIATIVE', 'Documents depuis la publication aux JO (publique) jusqu''aux statuts et attestations d''assurance associative.', '', 'LOCAL', '', 'Monsieur le Maire', 'Elodie Bordonado', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(84, '2018-04-10 10:26:12', 'N', 'dsi', 'Fichier Diff''', 'REF_84', 'DVAS - VIE ASSOCIATIVE', 'Fichier de contacts global rÃ©fÃ©renÃ§ant les associations, les institutions partenaires, les membres des comitÃ©s des sages et de quartiers, des fournisseurs, les Ã©tablissements, les villes jumelles... Ce fichier rassemble les coordonnÃ©es adresses, mails, tÃ©lÃ©phones ( accÃ¨s Ã  la DGEVS ) et compte plus de 500 rÃ©fÃ©rences.', '', 'LOCAL', '', 'Monsieur le Maire', 'Blandine Creusillet', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(85, '2018-04-09 18:02:07', 'N', 'dsi', 'RÃ©pertoire associatif', 'REF_85', 'DVAS - VIE ASSOCIATIVE', 'DonnÃ©es pour le guide pratique, liste de contact associatif.', '', 'LOCAL', '', 'Monsieur le Maire', 'Elodie Bordonado', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(86, '2018-04-10 10:26:30', 'N', 'dsi', 'Portail des associations', 'REF_86', 'DVAS - VIE ASSOCIATIVE', 'PrÃ©sence sur le site internet de l''annuaire des associations avec publication des contacts donnÃ©es par les associations. Formulaires de contact (matÃ©riel, reprographie, salles...). Ces formulaires demandent Ã©galement des informations nominatives et des coordonnÃ©es tÃ©lÃ©phoniques et courriels.', '', 'EXTERNALISE', '', 'Monsieur le Maire', 'TimothÃ©e Berthalon', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(87, '2018-04-09 18:02:07', 'N', 'dsi', 'Logiciel de caisse de la piscine', 'REF_87', 'DVAS - VIE ASSOCIATIVE', 'La piscine dÃ©livre des cartes d''abonnement en enregistrant des donnÃ©es personnelles des usagers sur le logiciel de caisse.', '', 'EXTERNALISE', '', 'Monsieur le Maire', 'RÃ©gisseur piscine', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(88, '2018-04-09 18:02:07', 'N', 'dsi', 'Outils de messagerie', 'REF_88', 'DVAS - VIE ASSOCIATIVE', 'Les contacts professionnels peuvent Ã©galement Ãªtre enregistrÃ©s dans les contacts Outlook ou OWA, ou encore dans les smartphone pour ceux qui en ont.', '', 'LOCAL', '', 'Monsieur le Maire', 'Richard DELIMESLE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(89, '2018-04-09 18:02:07', 'N', 'dsi', 'MÃ©lodie', 'REF_89', 'DIRECTION GENERALE - ETAT CIVIL', 'Gestion de l''Ã©tat civil', '', 'LOCAL', '', 'Monsieur le Maire', 'Elodie BAPTUT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(90, '2018-04-09 18:02:07', 'N', 'dsi', 'Adagio', 'REF_90', 'DIRECTION GENERALE - ETAT CIVIL', 'Gestion des listes Ã©lectorales', '', 'LOCAL', '', 'Monsieur le Maire', 'Elodie BAPTUT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(91, '2018-04-10 10:26:42', 'N', 'dsi', 'Maestro', 'REF_91', '', 'Recensement pour la JournÃ©e DÃ©fense et CitoyennetÃ© (JDC), inscription sur les listes jusqu''Ã  la tÃ©lÃ©transmission des donnÃ©es au Centre de Service National (CSN)', '', 'LOCAL', '', 'Monsieur le Maire', 'Roselyne MALAIZE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(92, '2018-04-09 18:02:07', 'N', 'dsi', 'Open CimetiÃ¨re', 'REF_92', 'DIRECTION GENERALE - ETAT CIVIL', '', '', 'LOCAL', '', 'Monsieur le Maire', 'Roselyne MALAIZE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(93, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_93', 'DIRECTION GENERALE - ETAT CIVIL', 'RÃ©pertoire X - DG-Cab - Etat civil', '', 'LOCAL', '', 'Monsieur le Maire', 'Elodie BAPTUT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(94, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_94', 'DIRECTION GENERALE - ETAT CIVIL', 'RÃ©pertoire T - Etat civil - Cabinet', '', 'LOCAL', '', 'Monsieur le Maire', 'Elodie BAPTUT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(95, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_95', 'DIRECTION GENERALE - ETAT CIVIL', 'Etat civil/affaires gÃ©nÃ©rales:\r\nRegistres d''Ã©tat civil\r\nDossiers d''Ã©tat civil n-1 ou n-2 archivÃ©s dans le local archives avant leur versement \r\nDossiers et documents d''Ã©tat civil de l''annÃ©e rangÃ©s dans le service\r\nDossiers et documents relevant des affaires gÃ©nÃ©rales rangÃ©s dans le service (dossiers de demande de titres d''identitÃ© durant l''instruction par la prÃ©fecture, notices de rec', '', 'LOCAL', '', 'Monsieur le Maire', 'Elodie BAPTUT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(96, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_96', 'DIRECTION GENERALE - ETAT CIVIL', 'Disques durs des 2 dispositifs pour le recueil des demandes de titres d''identitÃ©', '', 'LOCAL', '', 'Monsieur le Maire', 'Elodie BAPTUT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(97, '2018-04-09 18:02:07', 'N', 'dsi', 'Logements vaccants', 'REF_97', 'INCONNU - INCONNU', '', '', 'LOCAL', '', 'Monsieur le Maire', '', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(98, '2018-04-09 18:02:07', 'N', 'dsi', 'MUNICIPOL', 'REF_98', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'Gestion de l''activitÃ© PM et des mains courantes', '', 'LOCAL', '', 'Monsieur le Maire', 'Pascal MARTIN', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(99, '2018-04-09 18:02:07', 'N', 'dsi', 'CANIS', 'REF_99', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'Gestion des chiens dangereux', '', 'LOCAL', '', 'Monsieur le Maire', 'Pascal MARTIN', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(100, '2018-04-09 18:02:07', 'N', 'dsi', 'ARGOS', 'REF_100', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'Gestion de la vidÃ©oprotection', '', 'LOCAL', '', 'Monsieur le Maire', 'Pascal MARTIN', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(101, '2018-04-09 18:02:07', 'N', 'dsi', 'PVE', 'REF_101', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'PV Ã©lectroniques', '', 'LOCAL', '', 'Monsieur le Maire', 'Pascal MARTIN', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(102, '2018-04-10 10:27:27', 'N', 'dsi', '', 'REF_102', '', 'RÃ©ussite Ã©ducative : dossiers papiers nominatifs et tableaux excel nominatifs: ChloÃ© Alphonse et Christine Bonnet', '', 'LOCAL', '', 'Monsieur le Maire', 'FranÃ§ois PLANTADE', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(103, '2018-04-10 10:27:43', 'N', 'dsi', '', 'REF_103', '', 'MÃ©diateurs : fichier Excel adresses (les trois agents de mÃ©diation)', '', 'LOCAL', '', 'Monsieur le Maire', 'FranÃ§ois PLANTADE', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(104, '2018-04-10 10:27:50', 'N', 'dsi', '', 'REF_104', '', 'PrÃ©vention : dossiers papiers nominatifs pour le suivi des jeunes dÃ©linquants', '', 'LOCAL', '', 'Monsieur le Maire', 'FranÃ§ois PLANTADE', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(105, '2018-04-10 10:27:56', 'N', 'dsi', '', 'REF_105', '', 'PrÃ©vention : dossiers papiers et tableau excel pour les chantiers Ã©ducatifs', '', 'LOCAL', '', 'Monsieur le Maire', 'FranÃ§ois PLANTADE', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(106, '2018-04-10 10:28:20', 'N', 'dsi', '', 'REF_106', '', 'PrÃ©vention : dossiers nominatifs informations prÃ©occupantes et protection de l''enfance', '', 'LOCAL', '', 'Monsieur le Maire', 'FranÃ§ois PLANTADE', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(107, '2018-04-10 10:27:09', 'N', 'dsi', '', 'REF_107', '', 'PrÃ©vention : dossiers papiers et tableau excel pour la gestion des TIG et des rappels Ã  l''ordre', '', 'LOCAL', '', 'Monsieur le Maire', 'FranÃ§ois PLANTADE', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(108, '2018-04-09 18:02:07', 'N', 'dsi', 'ARGOS', 'REF_108', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'Surveillance Parking Becquerel', '', 'LOCAL', '', 'Monsieur le Maire', 'Pascal MARTIN', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(109, '2018-04-09 18:02:07', 'N', 'dsi', 'ARGOS', 'REF_109', 'DIRECTION GENERALE - POLICE MUNICIPALE', 'Surveillance CTM', '', 'LOCAL', '', 'Monsieur le Maire', 'Pascal MARTIN', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(110, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_110', 'INCONNU - INCONNU', 'BiomÃ©trie : rÃ©seau veineux de la main sur les lieux de travail', '', 'LOCAL', '', 'Monsieur le Maire', '', NULL, '', '', '', '', 'OUI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(111, '2018-04-09 18:02:07', 'N', 'dsi', 'A6COM', 'REF_111', 'DSI - CDS', 'Taxation tÃ©lÃ©phonique', '', 'EXTERNALISE', '', 'Monsieur le Maire', 'Olivier DUFOUR', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(112, '2018-04-09 18:02:07', 'N', 'dsi', 'VACANCES LOGT', 'REF_112', 'DSG - DSG', 'Lutte contre la vacance des logements par les mairies', '', 'LOCAL', '', 'Monsieur le Maire', '', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(113, '2018-04-09 18:02:07', 'N', 'dsi', 'COS', 'REF_113', 'DRH - DRH', 'Gestion des adhÃ©rents du COS de SJB', '', 'LOCAL', '', 'Monsieur le Maire', 'DaniÃ¨le BOULANT', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(114, '2018-04-09 18:02:07', 'N', 'dsi', '', 'REF_114', 'DACV - DACV', 'Cf. onglet DACV de VÃ©ronique LE GUENNEC', '', 'LOCAL', '', 'Monsieur le Maire', 'VÃ©ronique LE GUENNEC', NULL, '', '', '', '', 'NON', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(133, '2018-04-23 14:22:49', 'O', 'dsi', 'test yann', 'REF_133', 'CTM - CTM', 'FinalitÃ©', 'Non prioritaire', 'Localisation du traitement', 'DÃ©tail de la finalitÃ©', 'resp', 'repres', 'severine', 'OUI', 'reporter non sensible', 'sensibles', 'duree', 'OUI', 'OUI', 'resultat eivp', 'origine', 'destinattion', 'periodicitÃ©', 'modalitÃ©', 'Comment rÃ©pondez-vous aux demandes d''accÃ¨s des personnes Ã  leurs informations ?', 'OK', 'Comment rÃ©pondez-vous aux demandes d''effacement des DCP ("Droit Ã  l''oubli") ?', 'NA', 'NA', 'Mise en oeuvre du recueil du consentement', 'DÃ©lais de mise en oeuvre', 'Combien ', 'omment procÃ©dez-vous pour les archiver ?\r\n', 'OUI', ' cela n''est pas le', 'NON', 'Comment rÃ©pondez-vous aux demandes de d''opposition (=retrait du consentement) ?', 'OK', 'Autrement', 'Comment rÃ©pondez-vous aux demandes de portabilitÃ© des donnÃ©es ?', 'EC', 'Comment rÃ©pondez-vous aux demandes de rectification des DCP (donnÃ©es Ã  caractÃ¨re personnel) ?', 'KO', 'Mesures techniques', 'Mesures organisationnelles', 'ComplÃ©ment(s)', 'Sous- traitant(s)', 'Responsable du contrat de sous-traitance', 'Remarque(s)', 'Destinataire(s)', 'Pays', 'Type(s) de Garanties');

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
