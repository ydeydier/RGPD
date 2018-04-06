<?php
class traitement {
	var $idTraitement;
	var $timestamp;
	var $corbeille;			// 'O' ou 'N'
	var $donnees;			// array contenant l'ensemble des champs
	
	static function charger($champs) {
		$result = executeSqlSelect("SELECT * FROM traitement");
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

	function update($champs, $login) {
		$nomChamps=array_keys($champs);
		$dernierChamp = end($nomChamps);
		$sql="";
		foreach ($champs as $champ) {
			if ($sql=="") {
				$sql="update traitement set quimaj='$login', timestamp=now()";
			}
			$nomChamp=$champ->nomChamp;
			$donnees=$this->donnees;
			$donnee=$donnees[$nomChamp];
			$typeInterface=$champ->typeInterface;
			if ($typeInterface=="D") {
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
	}

	function insert($login) {
		executeSql("insert into traitement (quimaj) values ('$login')");
		$this->idTraitement=dernierIdAttribue();
	}

	function delete($idTraitement) {
		executeSql("delete from traitement where idTraitement=$idTraitement");
	}
}
?>