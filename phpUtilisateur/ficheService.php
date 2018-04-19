<?php
	require "inc_commun.php";
	require "header_et_menu.php";
	$champs=champ::charger(); // TODO : à supprimer ! Inutile de recharger cela à chaque fois
?>
<CENTER>

<br><br><br>
<h1>Service : Ressources Humaines</h1>
<br><br>

<table width="50%" class="tableCommune">
<tr>
	<th colspan="2">Etape 1 : recenser les traitements</th>
</tr>
<tr>
	<td colspan="2">
	<table>
	<tr>
	<td class="lettreInformation" width="1%">i</td>
	<td>Pour mesurer concrètement l’impact du règlement européen sur la protection des données que vous traitez, commencez par recenser de façon précise vos traitements de données personnelles. L'élaboration d'un registre des traitements vous permet de faire le point.</td>
	</tr>
	<tr>
	<td class="lettreInterrogation" width="1%">?</td>
	<td><b>Comment procéder ?</b><br>Pour mesurer concrètement l’impact du règlement européen sur la protection des données que vous traitez, commencez par recenser de façon précise vos traitements de données personnelles. L'élaboration d'un registre des traitements vous permet de faire le point.</td>
	</tr>
	</table>
	</td>
</tr>
<tr>
	<td width="50%">Les traitements de type <b>logiciel métier</b> (ex : SEDIT...) sont-ils recensés ?</td>
	<td><select><option>-</option><option>OUI</option><option>NON</option><option>En cours</option></td>
</tr>
<tr>
	<td width="50%">Les traitements de type <b>bureautique</b> (fichier Excel, CALC, Writer...) sont-ils recensés ?</td>
	<td><select><option>-</option><option>OUI</option><option>NON</option><option>En cours</option></td>
</tr>
</table>

<br>


</table>
<br><br>

</CENTER>
<br><br><br><br>
<?php
	require "footer.php";
?>