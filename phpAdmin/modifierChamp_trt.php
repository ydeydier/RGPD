<?php
	require "inc_commun.php";
	$champ=$_SESSION["champModif"];
	$champ->ordre=$_POST["txtOrdre"];
	$champ->libelleChamp=$_POST["txtLibelle"];
	$champ->description=$_POST["txtDescription"];
	$champ->typeInterface=$_POST["txtTypeInterface"];
	$champ->typeListe=$_POST["txtTypeListe"];
	$champ->tailleMax=$_POST["txtTailleMax"];
	$champ->afficheDansListe=$_POST["txtAfficheDansListe"];
	$champ->idCategorie=$_POST["txtCategorie"];
	$champ->masque=$_POST["txtMasque"];
	$champ->update();
	
	// Redirection
	header('Location: consulterChamps.php');
?>