<?php
	require "inc_commun.php";
	// Gestion du tri
	if (isset($_GET['tri'])) {
		$_SESSION["tri"]=$_GET['tri'];
	}
	// Gestion du filtre "direction"
	if (isset($_GET['direction'])) {
		$_SESSION["filtre_direction"]=$_GET['direction'];
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
			$traitement = traitement::chargerAvecId($idTraitement, $champs, $services);
			$traitement->envoyerCorbeille();
		}
	}
	// Redirection
	header("Location: consulterTraitements.php");
?>