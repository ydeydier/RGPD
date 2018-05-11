<?php
	require "inc_commun.php";
	require "header_et_menu.php";
?>
<CENTER>
<br>
<h1>Modifier un champ</h1>
<br><br><br>

<form method="POST" name="formulaire" action="modifierChamp_trt.php">
<table class="tableCommune">
<?php
	$nomChamp=$_GET["nomChamp"];
	$champs = champ::charger();
	$champ = $champs[$nomChamp];
	$_SESSION["champModif"]=$champ;
	echo "<tr><th>Nom</th><td>$champ->nomChamp</td></tr>";
	echo "<tr><th>Ordre</th><td><input size=\"4\"  maxlength=\"4\" name=\"txtOrdre\" type=\"text\" value=\"$champ->ordre\"></td></tr>";
	echo "<tr><th>Libelle</th><td><input name=\"txtLibelle\" size=\"40\" type=\"text\" value=\"".htmlspecialchars($champ->libelleChamp)."\"></td></tr>";
	echo "<tr><th>Description</th><td><textarea rows=\"4\" cols=\"40\" name=\"txtDescription\">".htmlspecialchars($champ->description)."</textarea></td></tr>";
	echo "<tr><th>Type Interface<br>(U=une ligne, M=multilignes,<br>D=Date, L=Liste, S=Spécifique)</th><td><input name=\"txtTypeInterface\" size=\"1\"  maxlength=\"1\" type=\"text\" value=\"$champ->typeInterface\"></td></tr>";
	echo "<tr><th>Type Liste (pour Type Interface L (-> intitulé) ou S)</th><td><input size=\"10\" maxlength=\"10\" name=\"txtTypeListe\" type=\"text\" value=\"$champ->typeListe\"></td></tr>";
	echo "<tr><th>Taille Max</th><td><input size=\"3\" maxlength=\"3\" name=\"txtTailleMax\" type=\"text\" value=\"$champ->tailleMax\"></td></tr>";
	echo "<tr><th>Affiche Dans Liste</th><td><input size=\"1\" maxlength=\"1\" name=\"txtAfficheDansListe\" type=\"text\" value=\"$champ->afficheDansListe\"></td></tr>";
	echo "<tr><th>Catégorie</th><td><input name=\"txtCategorie\" size=\"3\" maxlength=\"3\" type=\"text\" value=\"$champ->idCategorie\"></td></tr>";
	echo "<tr><th>Masqué</th><td><input size=\"1\" maxlength=\"1\" name=\"txtMasque\" type=\"text\" value=\"$champ->masque\"></td></tr>";
?>
</table>
<br><br><br>
<button type="submit" class="boutonValider">Valider</button>
&nbsp;&nbsp;&nbsp
<button type="button" class="boutonAnnuler" onclick="javascript:window.location='consulterChamps.php'">Annuler</button>
</form>

</CENTER>
<br><br><br><br>
<?php
	require "footer.php";
?>