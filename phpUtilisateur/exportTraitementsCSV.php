<?php
header("Content-Type: text/csv; charset=utf-8;");
header("Content-disposition: attachment; filename=TraitementsRGPD_".date("d_m_Y").".csv");
require "inc_commun.php";
$traitements = traitement::charger($champs, 'N');
$delimiteur=";";

// Fichier output
$out = fopen('php://output', 'w');
fputs($out, $bom =( chr(0xEF) . chr(0xBB) . chr(0xBF) ));

// Ligne de titre
$csvLine=array();
foreach ($champs as $champ) {
	$csvLine[]=$champ->libelleChamp;
}
fputcsv($out, $csvLine, $delimiteur);

// Lignes de données
foreach ($traitements as $traitement) {
	$donnees=$traitement->donnees;
	$csvLine=array();
	foreach ($champs as $champ) {
		$donnee=$donnees[$champ->nomChamp];
		$csvLine[]=$donnee;
	}
	fputcsv($out, $csvLine, $delimiteur);
}
fclose($out);
?>