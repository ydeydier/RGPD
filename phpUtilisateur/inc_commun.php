<?php
	header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
	//error_reporting(E_ALL ^ E_DEPRECATED);
	require_once "../phpCommun/fonctionsSql.php";
	require_once "../classes/class.champ.php";
	require_once "../classes/class.direction.php";
	require_once "../classes/class.service.php";
	require_once "../classes/class.categorie.php";
	require_once "../classes/class.intitule.php";
	require_once "../classes/class.traitement.php";
	require_once "../classes/class.utilisateur.php";
	session_start();
	require_once "../phpCommun/connexion.php";

	if (!isset($_SESSION["estConnecte"])) {
		header('Location: ../phpCommun/login.php');
	}
	$utilisateur=$_SESSION["utilisateur"];
	$champs=$_SESSION["champs"];
	$categories=$_SESSION["categories"];
	$intitules=$_SESSION["intitules"];
	$directions=$_SESSION["directions"];
	$services=$_SESSION["services"];
?>