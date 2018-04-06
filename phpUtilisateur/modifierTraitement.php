<?php
	require "inc_commun.php";
	require "header_et_menu.php";
	$idTraitement=$_GET["id"];
	$actionAnnuler=$_GET["actionAnnuler"];
	$traitement = traitement::chargerAvecId($idTraitement, $champs);	// la base est lue à nouveau de manière à s'assurer de visualiser la dernière version
	$donnees=$traitement->donnees;
	$_SESSION["traitement"]=$traitement;		// variable de session utilisée uniquement sur cette page et modifierTraitement_trt.php
?>
<CENTER>

<br><br><br>
<h1><?php echo $donnees['nom'];?></h1>
<br><br><br>


<form method="POST" action="modifierTraitement_trt.php">

<table class="tableCommune">
<?php
	$libelleCategoriePrecedent="";
	foreach ($champs as $champ) {
		$nomChamp=$champ->nomChamp;
		$donnee=$donnees[$nomChamp];
		$libelle=$champ->libelleChamp;
		$description=$champ->description;
		$idCategorie=$champ->idCategorie;
		$libelleCategorie=$categories[$idCategorie]->libelle;
		if ($libelleCategoriePrecedent<>$libelleCategorie) {
			echo "<tr height=\"30px\"><th class=\"categorie\" colspan=\"2\">$libelleCategorie</tr>";
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
			$long="35";
			$texteApres="";
		}
		
		if ($typeInterface=="U") {
			$HTMLchamp="<input size=\"$long\" type=\"text\" value=\"$donnee\" name=\"txt_$nomChamp\">$texteApres";
		}
		if ($typeInterface=="M") {
			$HTMLchamp="<textarea rows=\"2\" cols=\"35\" name=\"txt_$nomChamp\">$donnee</textarea>";
		}
		if ($typeInterface=="D") {
			// Date
			$HTMLchamp="<input size=\"10\" type=\"text\" value=\"$donnee\" name=\"txt_$nomChamp\"> (JJ/MM/AAAA)";
		}
		if ($typeInterface=="ON") {
			// Oui / non
			$HTMLchamp="<select name=\"cbo_$nomChamp\"><option value=\"-\"></option><option value=\"O\">OUI</option><option value=\"N\">NON</option></select>";
		}
		if ($typeInterface=="OK") {
			// OK / KO
			$HTMLchamp="<select name=\"cbo_$nomChamp\"><option value=\"-\"></option><option value=\"OK\">OK</option><option value=\"KO\">KO</option></select>";
		}
		
		echo "<tr>";
		echo "<th nowrap align=\"left\">$libelle<br><span class=\"description\">$description</span></th>";
		echo "<td>$HTMLchamp</td>";
		echo "</tr>";
	}
?>
</table>
<br><br>

<?php
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
<button type="submit" class="boutonValider">Valider</button>
&nbsp;&nbsp;&nbsp;
<button type="button" class="boutonAnnuler" onclick="javascript:window.location='<?php echo $locationAnnuler;?>'">Annuler</button>
</form>

</CENTER>
<br><br><br><br>
<?php
	require "footer.php";
?>