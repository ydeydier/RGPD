<?php
	require "inc_commun.php";
	// Action sur le traitement
	if (isset($_GET['action'])) {
		$action=$_GET["action"];
		$idTraitement=$_GET["idTraitement"];
		if ($action=="Restaurer") {
			$traitement = traitement::chargerAvecId($idTraitement, $champs, $services);
			$traitement->restaurerDepuisCorbeille();
		}
	}
	// Redirection
	header("Location: consulterTraitementsCorbeille.php");
?>