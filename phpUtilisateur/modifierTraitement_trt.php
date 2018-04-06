<?php
	require "inc_commun.php";
	$traitement=$_SESSION["traitement"];		// variable utilisée uniquement sur cette page et modifierTraitement.php
	$donnees =& $traitement->donnees;
	foreach ($champs as $champ) {
		$nomChamp=$champ->nomChamp;
		$typeInterface=$champ->typeInterface;
		if (($typeInterface=="U" || $typeInterface=="M" || $typeInterface=="D")) {
			$donnee=$_POST["txt_$nomChamp"];
			$donnees[$nomChamp]=$donnee;
		}
		if (($typeInterface=="ON") || ($typeInterface=="OK")){
			$donnee=$_POST["cbo_$nomChamp"];
			$donnees[$nomChamp]=$donnee;
		}
	}
	$traitement->update($champs, $utilisateur->login);
	unset($_SESSION["traitement"]);
	header("Location: consulterTraitement.php?id=$traitement->idTraitement");
?>