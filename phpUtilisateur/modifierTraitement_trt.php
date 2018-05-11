<?php
	require "inc_commun.php";
	$traitement=$_SESSION["traitement"];		// variable utilisée uniquement sur cette page et modifierTraitement.php
	$donnees =& $traitement->donnees;
	foreach ($champs as $champ) {
		$nomChamp=$champ->nomChamp;
		$typeInterface=$champ->typeInterface;
		if ($typeInterface=="S") {
			$typeListe=$champ->typeListe;
			if ($typeListe=='SERVICE') {
				$idService=$_POST["idService"];
				if ($idService!="") {
					$traitement->service=$services[$idService];
				} else {
					$traitement->service=null;
				}
			}
		} else {
			$donnee=$_POST["txt_$nomChamp"];
			$donnees[$nomChamp]=$donnee;
		}
	}
	$traitement->update($champs, $utilisateur->login, $intitules);
	// Un intitulé peut avoir été ajouté, il convient donc de les recharger
	$intitules=intitule::charger();
	$_SESSION["intitules"]=$intitules;
	// La variable de session 'traitement' n'est plus utile, elle est supprimée
	unset($_SESSION["traitement"]);
	// Redirection
	header("Location: consulterTraitement.php?id=$traitement->idTraitement");
?>