<?php
class traitement {
	var $idTraitement;
	var $timestamp;
	var $quimaj;
	var $corbeille;			// 'O' ou 'N'
	var $donnees;			// array contenant l'ensemble des champs
	
	static function charger($champs, $corbeille) {
		$result = executeSqlSelect("SELECT * FROM traitement WHERE corbeille='$corbeille'");
		$traitements = array();
		while($row = mysqli_fetch_array($result)) {
			$traitement = self::instanceDepuisSqlRow($row, $champs);
			$traitements[$traitement->idTraitement]=$traitement;
		}
		return $traitements;
	}

	static function chargerAvecId($idTraitement, $champs) {
		$result = executeSqlSelect("SELECT * FROM traitement where idTraitement=$idTraitement");
		$row = mysqli_fetch_array($result);
		$traitement = self::instanceDepuisSqlRow($row, $champs);
		return $traitement;
	}

	static function instanceDepuisSqlRow($row, $champs) {
		$traitement = new traitement();
		$traitement->idTraitement=$row['idTraitement'];
		$traitement->timestamp=$row['timestamp'];
		$traitement->quimaj=$row['quimaj'];
		$traitement->corbeille=$row['corbeille'];
		$traitement->donnees=array();
		foreach ($champs as $champ) {
			$nomChamp=$champ->nomChamp;
			$donnee=$row[$nomChamp];
			if ($champ->typeInterface=="D") $donnee=date_fr($donnee);
			$traitement->donnees[$nomChamp]=$donnee;
		}
		return $traitement;
	}

	function update($champs, $login, $intitules) {
		$nomChamps=array_keys($champs);
		$dernierChamp = end($nomChamps);
		$sql="";
		// La requête d'update est découpée en plusieurs requêtes, de taille maximale 4300 caractère
		// afin d'éviter une erreur SQL en cas de requête trop grande.
		foreach ($champs as $champ) {
			if ($sql=="") {
				$sql="update traitement set quimaj='$login', timestamp=now()";
			}
			$nomChamp=$champ->nomChamp;
			$donnees=$this->donnees;
			$donnee=$donnees[$nomChamp];
			if ($champ->typeInterface=="D") {
				$donnee=dateMySql($donnee);
				$sql.=", ".$nomChamp."=$donnee";
			} else {
				$donnee=mysqlEscape($donnee);
				$sql.=", ".$nomChamp."='$donnee'";
			}
			if ((strlen($sql)>4300) || ($nomChamp==$dernierChamp)) {
				$sql.=" where idTraitement=$this->idTraitement";
				executeSql($sql);
				$sql="";
			}
		}
		// Si une donnée n'existe pas dans la table des intitulées, celle-ci y est ajoutée
		foreach ($champs as $champ) {
			$typeInterface=$champ->typeInterface;
			if ($typeInterface=="L") {
				$typeListe=$champ->typeListe;
				$nomChamp=$champ->nomChamp;
				$libelle=trim($donnees[$nomChamp]);
				if ($libelle!="" && !intitule::existe($typeListe, $libelle, $intitules)) {
					intitule::ajoute($typeListe, $libelle);
				}
			}
		}
	}

	function insert($login) {
		executeSql("insert into traitement (quimaj) values ('$login')");
		$this->idTraitement=dernierIdAttribue();
	}
	function envoyerCorbeille() {
		executeSql("update traitement set corbeille='O' where idTraitement=$this->idTraitement");
	}
	function restaurerDepuisCorbeille() {
		executeSql("update traitement set corbeille='N' where idTraitement=$this->idTraitement");
	}
	function timestampFr() {
		$ts=$this->timestamp;
		$ts = strtotime($ts);
		$ts=date("d/m/Y H:i:s", $ts);
		return $ts;
	}
	//function delete($idTraitement) {
	//	executeSql("delete from traitement where idTraitement=$idTraitement");
	//}
}
?>