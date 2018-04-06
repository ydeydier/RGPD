<?php
	header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
	require_once "../phpCommun/fonctionsSql.php";
	require_once "../classes/class.categorie.php";
	require_once "../classes/class.champ.php";
	require_once "../classes/class.utilisateur.php";
	session_start();
	require_once "../phpCommun/connexion.php";
	
	$login=$_POST["txtLogin"];
	$passwordSaisi=$_POST["txtPassword"];
	$tConnexionLDAP = $tConfiguration["connexionLDAP"];
	$utilisateur=utilisateur::charger($login);
	$passwordRenseigne=(trim($utilisateur->password)!="");
	if ($utilisateur!=FALSE) {
		if ($passwordRenseigne) {
			// Si un mot de passe existe en base, vérifier si celui saisi est identique
			$bPassword=$utilisateur->verifierLoginPasswordBase($passwordSaisi);
		} else {
			// Sinon demander au LDAP
			$bPassword=$utilisateur->verifierLoginPasswordLDAP($passwordSaisi, $tConnexionLDAP);
		}
		if ($bPassword!=FALSE) {
			if ($utilisateur->estAdministrateur()) {
				$_SESSION["estAdministrateur"]="OUI";
				$redirigeVers="../phpAdmin/pagePrincipaleAdmin.php";
			} else {
				$_SESSION["estAdministrateur"]="NON";
				$redirigeVers="../phpUtilisateur/consulterTraitements.php";
			}
			$_SESSION["estConnecte"]="OUI";
			$_SESSION["utilisateur"]=$utilisateur;
			// Charge l'ensemble des champs et catégories, et les stocke en session (array d'instances de 'champ' et de 'categorie')
			$champs=champ::charger();
			$categories=categorie::charger();
			$_SESSION["champs"]=$champs;
			$_SESSION["categories"]=$categories;
			setcookie('login', $login, time() + 5*365*24*3600, null, null, false, true);
			setcookie('password', $passwordSaisi, time() + 5*365*24*3600, null, null, false, true);
		} else {
			if ($passwordRenseigne) {
				$erreur="passwordIncorrectBase"; // TODO: tester tout cela !
			} else {
				$erreur="passwordIncorrectLDAP";
			}
			$redirigeVers="../phpCommun/login.php?erreur=".$erreur;
		}
	} else {
		$redirigeVers="../phpCommun/login.php?erreur=loginIncorrect";
	}
	header("Location: $redirigeVers");
?>