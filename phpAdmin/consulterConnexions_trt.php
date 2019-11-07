<?php
	require "inc_commun.php";
	$filtre=trim($_POST["filtre"]);
	$_SESSION["filtre_connexions"]=$filtre;
	// Redirection
	header('Location: consulterConnexions.php');
?>