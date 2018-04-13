<?php
	require "inc_commun.php";
	// Gestion du tri
	if (isset($_GET['tri'])) {
		$_SESSION["tri"]=$_GET['tri'];
	}
	// Gestion du filtre "service"
	if (isset($_GET['service'])) {
		$_SESSION["service"]=$_GET['service'];
	}
	// Gestion du filtre "recherche textuelle"
	if (isset($_GET['recherche'])) {
		$_SESSION["recherche"]=trim($_GET['recherche']);
	}
	// Action sur le traitement
	if (isset($_GET['action'])) {
		$action=$_GET["action"];
		$idTraitement=$_GET["idTraitement"];
		if ($action=="Supprimer") {
			$traitement = traitement::chargerAvecId($idTraitement, $champs);
			$traitement->envoyerCorbeille();
		}
	}
	// Redirection
	header("Location: consulterTraitements.php");
?>