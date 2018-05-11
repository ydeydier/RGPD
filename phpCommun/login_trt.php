<?php
	header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
	require_once "../phpCommun/fonctionsSql.php";
	require_once "../classes/class.categorie.php";
	require_once "../classes/class.champ.php";
	require_once "../classes/class.direction.php";
	require_once "../classes/class.service.php";
	require_once "../classes/class.utilisateur.php";
	require_once "../classes/class.intitule.php";
	session_start();
	require_once "../phpCommun/connexion.php";
	
	$loginSaisi=$_POST["txtLogin"];
	$passwordSaisi=$_POST["txtPassword"];
	$tConnexionLDAP = $tConfiguration["connexionLDAP"];
	
	// ***************************************************
	// Principe de vérification du login-password
	// ***************************************************
	//     - recherche en base de donnée du login.
	//			-> Si trouvé
	//				-> si en base le mot de passe est renseigné, on le compare avec celui saisi. FIN DU TEST.
	//				-> si non renseigné, on demande au ldap. FIN DU TEST.
	//          -> Si non trouvé on demande au LDAP, et on récupère nom et prénom dans le LDAP. FIN DU TEST.
	//
	$utilisateur=utilisateur::chargerDepuisBDD($loginSaisi);
	if ($utilisateur) {
		$passwordRenseigne=($utilisateur->password!="");
		if ($passwordRenseigne) {
			// Si un mot de passe existe en base, vérifier si celui saisi est identique
			$bPasswordOK=$utilisateur->verifierLoginPasswordBase($passwordSaisi);
		} else {
			// Sinon demander au LDAP
			$bPasswordOK=$utilisateur->verifierLoginPasswordLDAP($passwordSaisi, $tConnexionLDAP);
		}
	} else {
		$utilisateur=utilisateur::chargerDepuisLDAP($loginSaisi, $passwordSaisi, $tConnexionLDAP);
		if ($utilisateur) {
			$bPasswordOK=true;
		} else {
			$bPasswordOK=false;
		}
	}
	if ($bPasswordOK) {
		// Test : administrateur ou pas
		if ($utilisateur->estAdministrateur()) {
			$_SESSION["estAdministrateur"]="OUI";
			$redirigeVers="../phpAdmin/pagePrincipaleAdmin.php";
		} else {
			$_SESSION["estAdministrateur"]="NON";
			$redirigeVers="../phpUtilisateur/consulterTraitements.php";
		}
		// Variables de sessions
		$_SESSION["estConnecte"]="OUI";
		$_SESSION["utilisateur"]=$utilisateur;
		$utilisateur->logConnexion();
		// Charge l'ensemble du paramétrage, et le stock en session
		$champs=champ::charger();
		$categories=categorie::charger();
		$intitules=intitule::charger();
		$directions=direction::charger();
		$services=service::charger($directions);
		$_SESSION["champs"]=$champs;
		$_SESSION["categories"]=$categories;
		$_SESSION["intitules"]=$intitules;
		$_SESSION["directions"]=$directions;
		$_SESSION["services"]=$services;
	} else {
		$redirigeVers="../phpCommun/login.php?erreur=loginPasswordIncorrects";
	}
	setcookie('login', $loginSaisi, time() + 5*365*24*3600, null, null, false, true);
	setcookie('password', $passwordSaisi, time() + 5*365*24*3600, null, null, false, true);
	header("Location: $redirigeVers");
?>