<?php
	require "inc_commun.php";
	require "header_et_menu.php";
	$idTraitement=$_GET["id"];
	$traitement = traitement::chargerAvecId($idTraitement, $champs);	// la base est lue à nouveau de manière à s'assurer de visualiser la dernière version
	$donnees=$traitement->donnees;
?>
<CENTER>

<br><br><br>
<h1>Traitement : <?php echo $donnees['nom'];?></h1>
<br><br><br>

<table class="tableCommune">
<?php
	$libelleCategoriePrecedent="";
	foreach ($champs as $champ) {
		$donnee=$donnees[$champ->nomChamp];
		$donnee=str_replace("\n", "<br>", $donnee);
		$libelle=$champ->libelleChamp;
		$description=$champ->description;
		$idCategorie=$champ->idCategorie;
		$libelleCategorie=$categories[$idCategorie]->libelle;
		if ($libelleCategoriePrecedent<>$libelleCategorie) {
			echo "<tr height=\"30px\"><th class=\"categorie\" colspan=\"2\">$libelleCategorie</tr>";
			$libelleCategoriePrecedent=$libelleCategorie;
		}
		echo "<tr>";
		echo "<th nowrap align=\"left\">$libelle<br><span class=\"description\">$description</span></th>";
		echo "<td width=\"300px\">$donnee</td>";
		echo "</tr>";
	}
?>
</table>

<br><br>
<a class="menu" href="modifierTraitement.php?id=<?php echo $traitement->idTraitement;?>&actionAnnuler=consulterUnitaire">Modifier</a><br>
<a class="menu" href="consulterTraitements.php">Retour à la liste des traitements</a><br>
</CENTER>
<br><br><br><br>
<?php
	require "footer.php";
?>