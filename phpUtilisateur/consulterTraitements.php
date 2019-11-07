<?php
	require "inc_commun.php";
	require "header_et_menu.php";
	// Gestion du filtre "direction"
	$idDirectionFiltre="Tous";
	if (isset($_SESSION['filtre_direction'])) {
		$idDirectionFiltre=$_SESSION["filtre_direction"];
	}

	// Gestion du filtre "recherche textuelle"
	$rechercheFiltre="";
	if (isset($_SESSION['recherche'])) {
		$rechercheFiltre=$_SESSION["recherche"];
	}
	// Chargement des données
	$traitements = traitement::charger($champs, 'N', $services);

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

// La fonction suivante, spécifique à IE, permet de provoquer l'appel du "onchange" de l'input "Rechercher" (filtre) lorsque ENTER est pressée (ce qui est automatique sur Chrome et FF)
function checkEnter(event) {
   var keynum;
   var keychar;
   var enttest;
   if (window.event) {
      keynum = event.keyCode;
   } else {
      if (event.which) {
         keynum = event.which;
         }
   }
   if (keynum==13) {
      event.srcElement.blur();
      return false;
   }
}
</script>
<!-- ****************************** Menu ****************************** -->
<div class="divMenuGauche">
<a class="menu" href="ajouterTraitement_trt.php">
<div class="lettreMenu" width="1%">+</div>
Ajouter<br>Traitement
</a>
<br>
<a class="menu" href="consulterTraitementsCorbeille.php">
<img style="margin-top:5px;" width="35px" src="../img/corbeille.png"><br>
Voir la<br>corbeille
</a>
<br>
<a class="menu" href="exportTraitementsCSV.php">
<img style="margin-top:10px;" src="../img/csv_p.png"><br>
Export CSV
</a>
<br>
<a class="menu" href="modifierDirectionsEtServices.php">
<div class="lettreMenu" width="1%">S</div>
Modifier<br>Services
</a>
</div>
</div>

<!-- ****************************** Corps de la page ****************************** -->
<CENTER>

<br><br><br>
<h1>Liste des traitements</h1>
<br><br>

<!-- Filtre -->
<table width="80%">
<tr>
	<td>
		Direction &nbsp;
		<select onchange="javascript:window.location='consulterTraitements_trt.php?direction=' + this.value;">
		<option <?php echo ($idDirectionFiltre=="Tous"?" selected":""); ?> value="Tous">-- Toutes --</option>
			<?php
			foreach ($directions as $direction) {
				$libelleDirection=$direction->libelle;
				$idDirection=$direction->idDirection;
				if ($idDirectionFiltre==$idDirection) {
					$selected="SELECTED";
				} else {
					$selected="";
				}
				echo "<option $selected value=\"$idDirection\">$libelleDirection</option>";
			}
			?>
		<option <?php echo ($idDirectionFiltre=="Vide"?" selected":""); ?> value="Vide">-- Vide --</option>
		</select>
		&nbsp;&nbsp;Rechercher : <input type="text" value="<?php echo $rechercheFiltre;?>" onchange="javascript:window.location='consulterTraitements_trt.php?recherche=' + this.value;" onkeypress="checkEnter(event);" size="12">
	</td>
</tr>
</table>

<br>
<!-- Liste des traitements -->
<table width="80%" class="tableCommune">
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
		$idDirection=$traitement->idDirection();
		if ($idDirection==null) $idDirection="Vide";
		if (($idDirectionFiltre==$idDirection) || ($idDirectionFiltre=="Tous")) {
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
						if ($champ->typeInterface=='S') {
							if ($champ->typeListe=='SERVICE') {
								$donnee=$traitement->libelleService();
							}
							if ($champ->typeListe=='DIRECTION') {
								$donnee=$traitement->libelleDirection();
							}
						} else {
							$donnee=$donnees[$champ->nomChamp];
							$donnee=str_replace("\n", "<br>", $donnee);
						}
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
</CENTER>
<br><br><br><br><br><br>
<?php
	require "footer.php";
?>