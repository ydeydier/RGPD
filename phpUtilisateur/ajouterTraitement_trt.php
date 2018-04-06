<?php
	require "inc_commun.php";
	$traitement=new traitement();
	$traitement->insert($utilisateur->login);
	header("Location: modifierTraitement.php?id=$traitement->idTraitement&actionAnnuler=delete");
?>