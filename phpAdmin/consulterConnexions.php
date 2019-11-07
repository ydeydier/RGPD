<?php
	require "inc_commun.php";
	require "header_et_menu.php";
?>
<CENTER>

<br>
<h1>Historique des connexions</h1>
<br>
<br><br><br>
<table width="20%" class="tableCommune">
<tr><th>Login</th><th>Timestamp</th></tr>
<?php
	$filtre=$_SESSION["filtre_connexions"];
	if (!isset($filtre)) $filtre="";
	$connexions=utilisateur::chargeConnexions($filtre);
	foreach ($connexions as $connexion) {
		$login=$connexion["login"];
		$timestamp=$connexion["timestamp"];
		$timestamp = strtotime($timestamp);
		$timestamp=date("d/m/Y H:i:s", $timestamp);
		echo "<tr>";
		echo "<td>$login</td>";
		echo "<td>$timestamp</td>";
		echo "</tr>";
	}
?>
</table>
<br><br>
<form action="consulterConnexions_trt.php" method="POST">
Filtre : supprimer <input type="text" value="<?php echo htmlspecialchars($filtre);?>" placeholder="ex: admin ydurant" name="filtre">&nbsp;<input type="submit" value="Filtrer">
</form>
<br><br><br><br>
<a class="menu" href="pagePrincipaleAdmin.php">
<div class="lettreMenu" width="1%"><-</div>
Retour
</a>
</CENTER>
<br><br><br><br>
<?php
	require "footer.php";
?>