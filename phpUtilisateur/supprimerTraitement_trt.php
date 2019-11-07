<?php
	require "inc_commun.php";
	$idTraitement=$_GET["id"];
	traitement::delete($idTraitement);
	header("Location: consulterTraitements.php");
?>