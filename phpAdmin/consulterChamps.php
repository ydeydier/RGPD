<?php
	require "inc_commun.php";
	require "header_et_menu.php";
?>
<CENTER>

<br>
<h1>Gérer les champs</h1>
<br>

<table width="80%" class="tableCommune">
<tr><th>Nom</th><th>Ordre</th><th>Libelle</th><th>Description</th><th>Type Interface<br>(U=une ligne, M=multilignes,<br>D=Date, L=Liste, S=Spécifique)</th><th>Type liste (pour Type Interface L ou S)</th><th>Taille max</th><th>Afficher dans liste</th><th>Categorie</th><th>Masqué</th><th>Modif.</th></tr>
<?php
	$champs = champ::charger();
	foreach ($champs as $champ) {
		$description=str_replace("\n", "<br>", $champ->description);
		echo "<tr>";
		echo "<td>$champ->nomChamp</td>";
		echo "<td>$champ->ordre</td>";
		echo "<td>$champ->libelleChamp</td>";
		echo "<td>$description</td>";
		echo "<td>$champ->typeInterface</td>";
		echo "<td>$champ->typeListe</td>";
		echo "<td>$champ->tailleMax</td>";
		echo "<td>$champ->afficheDansListe</td>";
		echo "<td>$champ->idCategorie</td>";
		echo "<td>$champ->masque</td>";
		echo "<td align=\"center\"><a href=\"modifierChamp.php?nomChamp=$champ->nomChamp\"><img onmouseover=\"this.src='../img/edit_over.png'\" onmouseout=\"this.src='../img/edit.png'\" src=\"../img/edit.png\"></a></td>";
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