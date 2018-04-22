<?php
	require "inc_commun.php";
	require "header_et_menu.php";
	$champs=champ::charger(); // TODO : à supprimer ! Inutile de recharger cela à chaque fois
	// Chargement des données
	$traitements = traitement::charger($champs, 'O');
?>
<script type="text/javascript">
function restaurerDepuisCorbeille(idTraitement) {
	if (confirm('Etes vous sur(e) de vouloir restaurer (sortir de la corbeille) ce traitement ?')) {
		window.location="consulterTraitementsCorbeille_trt.php?action=Restaurer&idTraitement=" + idTraitement;
	}
}
</script>
<!-- Menu gauche -->
<div class="divMenuGauche">
<a class="menu" href="consulterTraitements.php">
<img style="margin-top:12px;" width="30px" src="../img/menu.png"><br>
Liste des<br>traitements
</a>
</div>

<!-- Corps de la page -->
<CENTER>
<br><br><br>
<h1>Liste des traitements en corbeille</h1>
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
	echo "<th>Restaurer</th>";
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
		echo "<td style=\"cursor:default;\" onclick=\"event.stopPropagation();\" align=\"center\"><a href=\"javascript:restaurerDepuisCorbeille($traitement->idTraitement);\">Restaurer</a></td>";
		echo "</tr>";
	}
?>
</table>
</CENTER>
<br><br><br><br><br><br>
<?php
	require "footer.php";
?>