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
	$connexions=utilisateur::chargeConnexions();
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