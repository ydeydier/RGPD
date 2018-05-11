<?php
	require "inc_commun.php";
	$txtNomService=$_POST["txtNomService"];
	$idDirection=$_POST["idDirection"];
	service::ajouter($txtNomService, $idDirection);
	// Mise à jour des variables de session
	$directions=direction::charger();
	$services=service::charger($directions);
	$_SESSION["directions"]=$directions;
	$_SESSION["services"]=$services;
	// Redirection
	header("Location: modifierDirectionsEtServices.php");
?>