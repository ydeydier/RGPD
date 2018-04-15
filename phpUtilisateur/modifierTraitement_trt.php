<?php
	require "inc_commun.php";
	$traitement=$_SESSION["traitement"];		// variable utilisée uniquement sur cette page et modifierTraitement.php
	$donnees =& $traitement->donnees;
	foreach ($champs as $champ) {
		$nomChamp=$champ->nomChamp;
		$typeInterface=$champ->typeInterface;
		$donnee=$_POST["txt_$nomChamp"];
		$donnees[$nomChamp]=$donnee;
		// TODO : dans le cas d'un champ LISTE, ajouter aux intitulés si celui-ci n'existe pas
	}
	$traitement->update($champs, $utilisateur->login);
	unset($_SESSION["traitement"]);
	header("Location: consulterTraitement.php?id=$traitement->idTraitement");
?>