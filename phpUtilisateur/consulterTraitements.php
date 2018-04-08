<?php
	require "inc_commun.php";
	require "header_et_menu.php";
	$champs=champ::charger(); // TODO : à supprimer ! Inutile de recharger cela à chaque fois
	// Gestion du filtre
	if (isset($_GET['service'])) {
		$serviceFiltre=$_GET['service'];
	} else {
		$serviceFiltre="Tous";
	}
	// Chargement des données
	$traitements = traitement::charger($champs);
?>
<CENTER>

<br><br><br>
<h1>Liste des traitements</h1>

<br><br>
Service &nbsp;
<select onchange="javascript:window.location='consulterTraitements.php?service=' + this.value;">
<option <?php echo ($serviceFiltre=="Tous"?" selected":""); ?> value="Tous">Tous</option>
	<?php
	$intituleServices = intitule::getIntitules("SERVICE");
	foreach ($intituleServices as $intitule) {
		$libelleIntitule=$intitule->libelle;
		if ($serviceFiltre==$libelleIntitule) {
			$selected="SELECTED";
		} else {
			$selected="";
		}
		echo "<option $selected value=\"$libelleIntitule\">$libelleIntitule</option>";
	}
	?>
</select>
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
		if ($serviceFiltre==($donnees["service"]) || ($serviceFiltre=="Tous")) {
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