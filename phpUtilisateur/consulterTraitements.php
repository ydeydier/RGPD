<?php
	require "inc_commun.php";
	require "header_et_menu.php";
	$traitements = traitement::charger($champs);
	$champs=champ::charger(); // TODO : à supprimer ! Inutile de recharger cela à chaque fois
?>
<CENTER>

<br><br><br>
<h1>Liste des traitements</h1>
<br><br><br>

<table width="70%" class="tableCommune">
<?php
	// Ligne de titre
	echo "<tr>";
	foreach ($champs as $champ) {
		if ($champ->bAfficheDansListe()) {
			echo "<th>$champ->libelleChamp</th>";
		}
	}
	echo "<th>Modif.</th>";
	echo "</tr>";
	// Lignes de données
	foreach ($traitements as $traitement) {
		$donnees=$traitement->donnees;
		echo "<tr style=\"cursor:pointer;\" onclick=\"window.location='consulterTraitement.php?id=$traitement->idTraitement'\">";
		foreach ($champs as $champ) {
			if ($champ->bAfficheDansListe()) {
				$donnee=$donnees[$champ->nomChamp];
				echo "<td>$donnee</td>";
			}
		}
		echo "<td style=\"cursor:default;\" onclick=\"event.stopPropagation();\" align=\"center\"><a href=\"modifierTraitement.php?id=$traitement->idTraitement&actionAnnuler=consulterListe\"><img onmouseover=\"this.src='../img/edit_over.png'\" onmouseout=\"this.src='../img/edit.png'\" src=\"../img/edit.png\"></a></td>";
		echo "</tr>";
	}
?>
</table>
<br><br>
<a class="menu" href="ajouterTraitement_trt.php">Ajouter un traitement</a><br>
<a class="menu" href="consulterTraitementsCorbeille.php">Voir la corbeille</a><br>

</CENTER>
<br><br><br><br>
<?php
	require "footer.php";
?>