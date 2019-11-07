<?php
	require "inc_commun.php";
	require "header_et_menu.php";
?>
<script type="text/javascript">
function renommerService(nomService, idService) {
	var nomService = prompt("Nouveau nom du service", nomService);
	if (nomService!=null) {
		window.location="modifierDirectionsEtServices_trt.php?action=renommerService&idService=" + idService + "&nouveauNom=" + encodeURIComponent(nomService);
	}
}
function renommerDirection(nomDirection, idDirection) {
	var nomDirection = prompt("Nouveau nom de la direction", nomDirection);
	if (nomDirection!=null) {
		window.location="modifierDirectionsEtServices_trt.php?action=renommerDirection&idDirection=" + idDirection + "&nouveauNom=" + encodeURIComponent(nomDirection);
	}
}
function ajouterDirection() {
	var nomDirection = prompt("Nouvelle direction", nomDirection);
	if (nomDirection!=null) {
		window.location="modifierDirectionsEtServices_trt.php?action=ajouterDirection&nom=" + encodeURIComponent(nomDirection);
	}
}
function supprimerDirection(nomDirection, idDirection) {
	var ret = confirm("Voulez-vous supprimer la direction " + nomDirection + " ?");
	if (ret) {
		window.location="modifierDirectionsEtServices_trt.php?action=supprimerDirection&idDirection=" + idDirection;
	}
}
function supprimerService(nomService, idService) {
	var ret = confirm("Voulez-vous supprimer le service " + nomService + " ?");
	if (ret) {
		window.location="modifierDirectionsEtServices_trt.php?action=supprimerService&idService=" + idService;
	}
}
</script>
<!-- ****************************** Menu ****************************** -->
<div class="divMenuGauche">
<a class="menu" href="consulterTraitements.php">
<img style="margin-top:12px;" width="30px" src="../img/menu.png"><br>
Liste des<br>traitements
</a>
<br>
<a class="menu" href="javascript:ajouterDirection()">
<div class="lettreMenu" width="1%">+d</div>
Ajouter<br>Direction
</a>
<br>
<a class="menu" href="ajouterService.php">
<div class="lettreMenu" width="1%">+s</div>
Ajouter<br>Service
</a>
</div>

<!-- ****************************** Corps de la page ****************************** -->
<CENTER>

<br><br><br>
<h1>Modifier les directions et services</h1>
<br><br>
<b>Remarque:</b> pour pouvoir supprimer un service aucun traitement ne doit lui en faire partie.
<br><br><br>
<table width="40%" class="tableCommune">
<tr><th>Direction</th><th>Renommer<br>Supprimer</th><th>Service</th><th>Renommer<br>Supprimer</th><th>Nombre de<br>traitements</th></tr>
<?php
	$sql= "SELECT S.idService, D.idDirection, D.libelle direction, S.libelle service, (select count(*) from traitement T where T.idService=S.idService) nombreTraitements ";
	$sql.="FROM direction D left outer join service S on S.idDirection=D.idDirection ";
	$sql.="ORDER BY D.libelle, S.libelle";
	$result = executeSqlSelect($sql);
	$directionPrecedente="";
	while($row = mysqli_fetch_array($result)) {
		$direction=$row['direction'];
		$service=$row['service'];
		$idService=$row['idService'];
		$idDirection=$row['idDirection'];
		$nombreTraitements=$row['nombreTraitements'];
		echo "<tr>";
		// Direction
		if ($direction==$directionPrecedente) {
			echo "<td>\"</td>";
			echo "<td></td>";
		} else {
			echo "<td>$direction</td>";
			echo "<td align=center>";
			echo "<a href=\"javascript:renommerDirection('$direction', $idDirection)\"><img onmouseover=\"this.src='../img/edit_over.png'\"   onmouseout=\"this.src='../img/edit.png'\" src=\"../img/edit.png\"></a>";
			if ($service==null) {
				echo "&nbsp;<a href=\"javascript:supprimerDirection('$direction', $idDirection)\"><img onmouseover=\"this.src='../img/delete_over.png'\" onmouseout=\"this.src='../img/delete.png'\" src=\"../img/delete.png\"></a>";
			}
			echo "</td>";
			$directionPrecedente=$direction;
		}
		// Service
		echo "<td>$service</td>";
		// Bouton Renommer service
		echo "<td align=center>";
		if ($service!=null) {
			echo "<a href=\"javascript:renommerService('$service', $idService)\"><img onmouseover=\"this.src='../img/edit_over.png'\" onmouseout=\"this.src='../img/edit.png'\" src=\"../img/edit.png\"></a>";
		} else {
			echo "-";
		}
		// Bouton Supprimer service
		if (($nombreTraitements==0) && ($service!=null)) {
			echo "&nbsp;<a href=\"javascript:supprimerService('$service', $idService)\"><img onmouseover=\"this.src='../img/delete_over.png'\" onmouseout=\"this.src='../img/delete.png'\" src=\"../img/delete.png\"></a>";
		}
		echo "</td>";
		// Nombre de traitements
		echo "<td>$nombreTraitements</td>";
		echo "</tr>";
	}
?>
</table>
</CENTER>
<br><br><br><br><br><br>
<?php
	require "footer.php";
?>