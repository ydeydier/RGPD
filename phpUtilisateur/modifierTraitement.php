<?php
	require "inc_commun.php";
	require "header_et_menu.php";
	$idTraitement=$_GET["id"];
	$actionAnnuler=$_GET["actionAnnuler"];
	$traitement = traitement::chargerAvecId($idTraitement, $champs);	// la base est lue à nouveau de manière à s'assurer de visualiser la dernière version
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
<CENTER>

<script type="text/javascript">
function listeChanged(laListe) {
	valeur=laListe.value;
	nomChamp = laListe.getAttribute("data-nomChamp");
	leSpan=document.getElementById("ID_" + nomChamp + "_SPAN_AJOUT");
	leInput=leSpan.children[1];
	if (valeur.substr(0, 2)=="~~") {
		leSpan.setAttribute("class", "montre");
		laListe.name="";
		leInput.name="txt_" + nomChamp;
	} else {
		leSpan.setAttribute("class", "cache");
		laListe.name="txt_" + nomChamp;
		leInput.name="";
	}
}
</script>

<br><br><br>
<h1><?php echo $donnees['nom'];?></h1>
<br><br><br>


<form method="POST" action="modifierTraitement_trt.php">

<!-- Menu gauche -->
<div class="divMenuGauche">
<button type="submit" class="boutonValider">Valider</button>
&nbsp;&nbsp;&nbsp;
<button type="button" class="boutonAnnuler" onclick="javascript:window.location='<?php echo $locationAnnuler;?>'">Annuler</button>
</div>

<!-- Corps de la page -->
<table width="50%" class="tableCommune">
<?php
	$libelleCategoriePrecedent="";
	foreach ($champs as $champ) {
		$nomChamp=$champ->nomChamp;
		$donnee=$donnees[$nomChamp];
		$libelle=$champ->libelleChamp;
		$description=$champ->description;
		$description=str_replace("\n", "<br>", $description);
		$idCategorie=$champ->idCategorie;
		$libelleCategorie=$categories[$idCategorie]->libelle;
		if ($libelleCategoriePrecedent<>$libelleCategorie) {
			echo "<tr height=\"20px\"><th class=\"thBlanc\" colspan=\"2\">&nbsp;</th></tr>";
			echo "<tr height=\"30px\"><th class=\"categorie\" colspan=\"2\">$libelleCategorie</th></tr>";
			$libelleCategoriePrecedent=$libelleCategorie;
		}
		// TODO: utiliser le champ tailleMax
		$typeInterface=$champ->typeInterface;
		
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
			$HTMLchamp="<input size=\"$long\" type=\"text\" value=\"$donnee\" name=\"txt_$nomChamp\">$texteApres";
		}
		// Champ de type "Multiligne"
		if ($typeInterface=="M") {
			$HTMLchamp="<textarea rows=\"3\" cols=\"40\" name=\"txt_$nomChamp\">$donnee</textarea>";
		}
		// Champ de type "Liste"
		if ($typeInterface=="L") {
			$typeListe=$champ->typeListe;
			$HTMLchamp ="<select onchange=\"listeChanged(this)\" data-nomChamp=\"$nomChamp\" name=\"txt_$nomChamp\">";
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
			// Eventuel champ d'ajout
			$HTMLchamp.="<span class=\"cache\" id=\"ID_$nomChamp"."_SPAN_AJOUT\" ><br>Ajouter : <input style=\"margin-top:5px;\" type=\"text\"></span>";
		}
		// Champ de type "Date"
		if ($typeInterface=="D") {
			$HTMLchamp="<input size=\"10\" type=\"text\" value=\"$donnee\" name=\"txt_$nomChamp\"> (JJ/MM/AAAA)";
		}
		echo "<tr>";
		echo "<th width=\"40%\" align=\"left\">$libelle<br><span class=\"description\">$description</span></th>";
		echo "<td width=\"60%\">$HTMLchamp</td>";
		echo "</tr>";
	}
?>
</table>
</form>

</CENTER>
<br><br><br><br><br><br>
<?php
	require "footer.php";
?>