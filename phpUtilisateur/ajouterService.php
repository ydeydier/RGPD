<?php
	require "inc_commun.php";
	require "header_et_menu.php";
?>
<script type="text/javascript">
function validerFormulaire() {
	ret=true;
	var comboDirection = document.getElementById("comboDirection");
	if (comboDirection.value=="") {
		alert("Veuillez choisir une direction");
		return false;
	}
	var txtNomService = document.getElementById("txtNomService");
	if (txtNomService.value.trim()=="") {
		alert("Veuillez saisir un nom de service");
		return false;
	}
	return ret;
}
function soumettre() {
	if (validerFormulaire()) javascript:document.formAjout.submit();
}
</script>
<!-- ****************************** Menu ****************************** -->
<div class="divMenuGauche">
<a class="menu" style="cursor:pointer;" onclick="javascript:soumettre()">
<img style="margin-top:10px;margin-bottom:4px;" src="../img/validation_p.png"><br>
Valider
</a>
<br>
<a class="menu" style="cursor:pointer;" onclick="javascript:window.location='modifierDirectionsEtServices.php'">
<img style="margin-top:10px;margin-bottom:4px;" src="../img/annulation_p.png"><br>
Annuler
</a>
</div>
<!-- ****************************** Corps de la page ****************************** -->
<CENTER>
<br><br><br>
<h1>Ajouter un service</h1>
<br><br><br>

<form name="formAjout" onsubmit="return validerFormulaire()" method="POST" action="ajouterService_trt.php">
<table width="30%" class="tableCommune">
<?php
	$HTMLCombo ="<select name=\"idDirection\" id=\"comboDirection\">";
	$HTMLCombo.="<option value=\"\"> - </option>";
	foreach ($directions as $direction) {
		$libelleDirection=$direction->libelle;
		$idDirection=$direction->idDirection;
		$HTMLCombo.="<option value=\"$idDirection\">$libelleDirection</option>";
	}
	$HTMLCombo.="</select>";
?>
<tr><td>Direction</td><td><?php echo $HTMLCombo;?></td></tr>
<tr><td>Nom du service</td><td><input type="text" id="txtNomService" name="txtNomService" size="30"></td></tr>
</table>
</form>

</CENTER>
<br><br><br><br><br><br>
<?php
	require "footer.php";
?>