<?php
require_once "../classes/class.direction.php";
require_once "../classes/class.service.php";

class traitement {
	var $idTraitement;
	var $timestamp;
	var $quimaj;
	var $corbeille;			// 'O' ou 'N'
	var $service;
	var $donnees;			// array contenant l'ensemble des champs
	
	static function charger($champs, $corbeille, $services) {
		$result = executeSqlSelect("SELECT * FROM traitement WHERE corbeille='$corbeille'");
		$traitements = array();
		while($row = mysqli_fetch_array($result)) {
			$traitement = self::instanceDepuisSqlRow($row, $champs, $services);
			$traitements[$traitement->idTraitement]=$traitement;
		}
		return $traitements;
	}

	static function chargerAvecId($idTraitement, $champs, $services) {
		$result = executeSqlSelect("SELECT * FROM traitement where idTraitement=$idTraitement");
		$row = mysqli_fetch_array($result);
		$traitement = self::instanceDepuisSqlRow($row, $champs, $services);
		return $traitement;
	}

	static function instanceDepuisSqlRow($row, $champs, $services) {
		$traitement = new traitement();
		$traitement->idTraitement=$row['idTraitement'];
		$traitement->timestamp=$row['timestamp'];
		$traitement->quimaj=$row['quimaj'];
		$traitement->corbeille=$row['corbeille'];
		$idService=$row['idService'];
		$service=$services[$idService];
		$traitement->service=$service;
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
			switch ($champ->typeInterface) {
				case "D":
					$donnee=dateMySql($donnee);
					$sql.=", ".$nomChamp."=$donnee";
					break;
				case "S":
					if ($champ->typeListe=='SERVICE') {
						if ($this->service!=null) {
							$idService=$this->service->idService;
						} else {
							$idService='null';
						}
						$sql.=", idService=$idService";
					}
					break;
				default:
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
	function delete($idTraitement) {
		executeSql("delete from traitement where idTraitement=$idTraitement");
	}
	function idDirection() {
		if ($this->service!=null) {
			$ret=$this->service->direction->idDirection;
		} else {
			$ret=null;
		}
		return $ret;
	}
	
	function libelleService() {
		if ($this->service==null) {
			$libelle="";
		} else {
			$libelle=$this->service->libelle;
		}
		return $libelle;
	}
	function libelleDirection() {
		if ($this->service==null) {
			$libelle="";
		} else {
			$libelle=$this->service->direction->libelle;
		}
		return $libelle;
	}
}
?>