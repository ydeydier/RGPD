<?php
	require "inc_commun.php";
	require "header_et_menu.php";
	$idTraitement=$_GET["id"];
	$actionAnnuler=$_GET["actionAnnuler"];
	$traitement = traitement::chargerAvecId($idTraitement, $champs, $services);	// la base est lue à nouveau de manière à s'assurer de visualiser la dernière version
	$donnees=$traitement->donnees;
	$_SESSION["traitement"]=$traitement;		// variable de session utilisée uniquement sur cette page et modifierTraitement_trt.php
	// Lien en cas d'annulation
	switch ($actionAnnuler) {
		case "delete":
			$locationAnnuler="supprimerTraitement_trt.php?id=$idTraitement";
			break;
		case "consulterUnitaire":
			$locationAnnuler="consulterTraitement.php?id=$idTraitement";
			break;
		case "consulterListe":
			$locationAnnuler="consulterTraitements.php";
			break;
	}
?>
<!-- ****************************** Menu ****************************** -->
<div class="divMenuGauche">
<a class="menu" style="cursor:pointer;" onclick="javascript:document.formModif.submit();">
<img style="margin-top:10px;margin-bottom:4px;" src="../img/validation_p.png"><br>
Valider
</a>
<br>
<a class="menu" style="cursor:pointer;" onclick="javascript:window.location='<?php echo $locationAnnuler;?>'">
<img style="margin-top:10px;margin-bottom:4px;" src="../img/annulation_p.png"><br>
Annuler
</a>
</div>

<!-- ****************************** Corps de la page ****************************** -->
<CENTER>
<br><br><br>
<h1><?php echo $donnees['nom'];?></h1>
<br><br><br>
<form name="formModif" method="POST" action="modifierTraitement_trt.php">
<table width="50%" class="tableCommune">
<?php
	$libelleCategoriePrecedent="";
	foreach ($champs as $champ) {
		$nomChamp=$champ->nomChamp;
		// Libellé et descrition
		$libelle=$champ->libelleChamp;
		$description=$champ->description;
		$description=str_replace("\n", "<br>", $description);
		$idCategorie=$champ->idCategorie;
		$libelleCategorie=$categories[$idCategorie]->libelle;
		$descriptionCategorie=$categories[$idCategorie]->description;
		if ($descriptionCategorie!="") $descriptionCategorie="<br><span class=\"descriptionCategorie\">$descriptionCategorie</span>";
		if ($libelleCategoriePrecedent<>$libelleCategorie) {
			echo "<tr height=\"20px\"><th class=\"thBlanc\" colspan=\"2\">&nbsp;</th></tr>";
			echo "<tr height=\"30px\"><th class=\"categorie\" colspan=\"2\">$libelleCategorie$descriptionCategorie</th></tr>";
			$libelleCategoriePrecedent=$libelleCategorie;
		}
		$typeInterface=$champ->typeInterface;
		$tailleMax=$champ->tailleMax;
		// Données du traitement
		$donnee=$donnees[$nomChamp];
		// Cas particulier : référence
		if ($nomChamp=="reference") {
			$long="15";
			$refInterne="REF_".$traitement->idTraitement;
			$texteApres="&nbsp;&nbsp;&nbsp;num. interne : $refInterne";
			if (trim($donnee)=="") $donnee=$refInterne;
		} else {
			$long="40";
			$texteApres="";
		}
		// Champ de type "Ligne (une unique ligne de texte)"
		if ($typeInterface=="U") {
			$donnee=htmlspecialchars($donnee);
			$HTMLchamp="<input maxlength=\"$tailleMax\" size=\"$long\" type=\"text\" value=\"$donnee\" name=\"txt_$nomChamp\">$texteApres";
		}
		// Champ de type "Multiligne"
		if ($typeInterface=="M") {
			$donnee=htmlspecialchars($donnee);
			$HTMLchamp="<textarea maxlength=\"$tailleMax\" rows=\"3\" cols=\"40\" name=\"txt_$nomChamp\">$donnee</textarea>";
		}
		// Champ de type "Liste" : liste d'intitulés
		if ($typeInterface=="L") {
			$typeListe=$champ->typeListe;
			$HTMLchamp ="<select name=\"txt_$nomChamp\">";
			$HTMLchamp.="<option value=\"\"> - </option>";
			$intitulesChamp = intitule::getIntitules($typeListe, $intitules);
			foreach ($intitulesChamp as $intitule) {
				$libelleIntitule=$intitule->libelle;
				if ($donnee==$libelleIntitule) {
					$selected="SELECTED";
				} else {
					$selected="";
				}
				$HTMLchamp.="<option $selected value=\"$libelleIntitule\">$libelleIntitule</option>";
			}
			$HTMLchamp.="</select>";
		}
		// Champ de type "Spécifique"
		if ($typeInterface=="S") {
			$typeListe=$champ->typeListe;
			if ($typeListe=='SERVICE') {
				$service=$traitement->service;
				$HTMLchamp ="<select name=\"idService\">";
				$HTMLchamp.="<option value=\"\"> - </option>";
				foreach ($services as $unService) {
					$libelleService=$unService->libelle;
					$libelleDirection=$unService->direction->libelle;
					$idService=$unService->idService;
					if ($idService==$service->idService) {
						$selected="SELECTED";
					} else {
						$selected="";
					}
					$HTMLchamp.="<option $selected value=\"$idService\">$libelleDirection - $libelleService</option>";
				}
				$HTMLchamp.="</select>";
			}
			if ($typeListe=='DIRECTION') {
				$donnee=$traitement->service->direction->libelle;
				$HTMLchamp=$donnee;
			}
		}
		// Champ de type "Date"
		if ($typeInterface=="D") {
			$HTMLchamp="<input maxlength=\"10\" size=\"10\" type=\"text\" value=\"$donnee\" name=\"txt_$nomChamp\"> (JJ/MM/AAAA)";
		}
		echo "<tr>";
		echo "<th width=\"40%\" align=\"left\">$libelle<br><span class=\"description\">$description</span></th>";
		echo "<td width=\"60%\">$HTMLchamp</td>";
		echo "</tr>";
	}
?>
</table>
<!-- Input suivant : pour permettre de valider le formulaire avec la touche ENTER, sous IE -->
<input type="submit" style="opacity:0;">
</form>

</CENTER>
<br><br><br><br><br><br>
<?php
	require "footer.php";
?>