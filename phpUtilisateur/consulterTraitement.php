<?php
	require "inc_commun.php";
	require "header_et_menu.php";
	$idTraitement=$_GET["id"];
	$traitement = traitement::chargerAvecId($idTraitement, $champs, $services);	// la base est lue à nouveau de manière à s'assurer de visualiser la dernière version
	$donnees=$traitement->donnees;
?>
<CENTER>
<!-- ****************************** Menu ****************************** -->
<div class="divMenuGauche">
<a class="menu" href="modifierTraitement.php?id=<?php echo $traitement->idTraitement;?>&actionAnnuler=consulterUnitaire">
<img style="margin-top:12px;" width="35px" src="../img/editOriginale.png"><br>
Modifier
</a><br>
<a class="menu" href="consulterTraitements.php">
<img style="margin-top:10px;margin-bottom:2px;" width="30px" src="../img/menu.png"><br>
Liste des<br>traitements
</a>
<br>
</div>

<!-- ****************************** Corps de la page ****************************** -->
<br><br><br>
<h1>Traitement : <?php echo $donnees['nom'];?></h1>
<br><br><br>

<table width="50%" class="tableCommune">
<?php
	$libelleCategoriePrecedent="";
	foreach ($champs as $champ) {
		// Données du traitement
		if ($champ->typeInterface=='S') {
			if ($champ->typeListe=='SERVICE')   $donnee=$traitement->libelleService();
			if ($champ->typeListe=='DIRECTION') $donnee=$traitement->libelleDirection();
		} else {
			$donnee=$donnees[$champ->nomChamp];
			$donnee=str_replace("\n", "<br>", $donnee);
		}
		// Libellé et descrition
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
		echo "<tr>";
		echo "<th width=\"40%\" align=\"left\">$libelle<br><span class=\"description\">$description</span></th>";
		echo "<td width=\"60%\">$donnee</td>";
		echo "</tr>";
	}
?>
<tr><td class="modif" colspan="2">Dernière modification par <?php echo $traitement->quimaj?>, le <?php echo $traitement->timestampFr()?></td></tr>
</table>
</CENTER>
<br><br><br><br><br><br><br><br>
<?php
	require "footer.php";
?>