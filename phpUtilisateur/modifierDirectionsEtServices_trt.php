<?php
	require "inc_commun.php";
	$action=$_GET["action"];
	switch ($action) {
		case "renommerService":
			$idService=$_GET["idService"];
			$nouveauNom=$_GET["nouveauNom"];
			service::renommer($idService, $nouveauNom);
			break;
		case "renommerDirection":
			$idDirection=$_GET["idDirection"];
			$nouveauNom=$_GET["nouveauNom"];
			direction::renommer($idDirection, $nouveauNom);
			break;
		case "ajouterDirection":
			$nom=$_GET["nom"];
			direction::ajouter($nom);
			break;
		case "supprimerDirection":
			$idDirection=$_GET["idDirection"];
			direction::supprimer($idDirection);
			break;
		case "supprimerService":
			$idService=$_GET["idService"];
			service::supprimer($idService);
			break;
	}
	// Mise à jour des variables de session
	$directions=direction::charger();
	$services=service::charger($directions);
	$_SESSION["directions"]=$directions;
	$_SESSION["services"]=$services;
	// Redirection
	header("Location: modifierDirectionsEtServices.php");
?>