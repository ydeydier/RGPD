<?php
	require "inc_commun.php";
	require "header_et_menu.php";
	$champs=champ::charger(); // TODO : à supprimer ! Inutile de recharger cela à chaque fois
	// Gestion du filtre "service"
	$serviceFiltre="Tous";
	if (isset($_SESSION['service'])) {
		$serviceFiltre=$_SESSION["service"];
	}
	// Gestion du filtre "recherche textuelle"
	$rechercheFiltre="";
	if (isset($_SESSION['recherche'])) {
		$rechercheFiltre=$_SESSION["recherche"];
	}
	// Chargement des données
	$traitements = traitement::charger($champs, 'N');
	// Gestion du tri
	$tri="reference";
	if (isset($_SESSION["tri"])) {
		$tri=$_SESSION["tri"];
	}
	function comparePourTriTrt($trt1, $trt2) {
		global $tri;
		$donnee1=$trt1->donnees;
		$donnee2=$trt2->donnees;
		if ($tri=="reference") {
			$donnee1 = str_replace("REF_", "", $donnee1);	// suppression du "REF_" du début pour que le tri soit correct
			$donnee2 = str_replace("REF_", "", $donnee2);	// suppression du "REF_" du début pour que le tri soit correct
		}
		return ($donnee1[$tri] < $donnee2[$tri]) ? -1 : 1;
	}
	usort($traitements, "comparePourTriTrt");
?>
<script type="text/javascript">
function envoyerCorbeille(idTraitement) {
	if (confirm('Etes vous sur(e) de vouloir supprimer (mettre à la corbeille) ce traitement ?')) {
		window.location="consulterTraitements_trt.php?action=Supprimer&idTraitement=" + idTraitement;
	}
}
</script>
<CENTER>

<br><br><br>
<h1>Liste des traitements</h1>
<br><br>

<table width="70%">
<tr>
	<td>
		Service &nbsp;
		<select onchange="javascript:window.location='consulterTraitements_trt.php?service=' + this.value;">
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
		&nbsp;&nbsp;Rechercher : <input type="text" value="<?php echo $rechercheFiltre;?>" onchange="javascript:window.location='consulterTraitements_trt.php?recherche=' + this.value;" size="12">
	</td>
	<td align="right">
		<a href="exportTraitementsCSV.php">Export CSV</a>
	</td>
</tr>
</table>

<br>

<table width="70%" class="tableCommune">
<?php
	// Ligne de titre
	echo "<tr>";
	foreach ($champs as $champ) {
		if ($champ->bAfficheDansListe()) {
			echo "<th><a href=\"consulterTraitements_trt.php?tri=$champ->nomChamp\">$champ->libelleChamp</a></th>";
		}
	}
	echo "<th>Modif.</th>";
	echo "<th>Suppr.</th>";
	echo "</tr>";
	// Lignes de données
	foreach ($traitements as $traitement) {
		$donnees=$traitement->donnees;
		// Gestion du filtre
		if ($serviceFiltre==($donnees["service"]) || ($serviceFiltre=="Tous")) {
			$bAfficherLigne=true;
			if ($rechercheFiltre!="") {
				$bAfficherLigne=false;
				foreach ($champs as $champ) {
					if ($champ->bAfficheDansListe()) {
						$donnee=$donnees[$champ->nomChamp];
						if (stripos($donnee, $rechercheFiltre)!==false) {
							$bAfficherLigne=true;
							break;
						}
					}
				}
			}
			if ($bAfficherLigne) {
				echo "<tr style=\"cursor:pointer;\" onclick=\"window.location='consulterTraitement.php?id=$traitement->idTraitement'\">";
				foreach ($champs as $champ) {
					if ($champ->bAfficheDansListe()) {
						$donnee=$donnees[$champ->nomChamp];
						$donnee=str_replace("\n", "<br>", $donnee);
						echo "<td>$donnee</td>";
					}
				}
				echo "<td style=\"cursor:default;\" onclick=\"event.stopPropagation();\" align=\"center\"><a href=\"modifierTraitement.php?id=$traitement->idTraitement&actionAnnuler=consulterListe\"><img onmouseover=\"this.src='../img/edit_over.png'\" onmouseout=\"this.src='../img/edit.png'\" src=\"../img/edit.png\"></a></td>";
				echo "<td style=\"cursor:default;\" onclick=\"event.stopPropagation();\" align=\"center\"><a href=\"javascript:envoyerCorbeille($traitement->idTraitement);\"><img onmouseover=\"this.src='../img/delete_over.png'\" onmouseout=\"this.src='../img/delete.png'\" src=\"../img/delete.png\"></a></td>";
				echo "</tr>";
			}
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