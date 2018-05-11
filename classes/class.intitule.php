<?php
class intitule {
	var $idIntitule;
	var $type;
	var $libelle;
	
	static function charger() {
		$result = executeSqlSelect("SELECT * FROM intitule ORDER BY type, ordre, libelle");
		$intitules = array();
		while($row = mysqli_fetch_array($result)) {
			$intitule = self::instanceDepuisSqlRow($row);
			$intitules[$intitule->idIntitule]=$intitule;
		}
		return $intitules;
	}
		
	static function instanceDepuisSqlRow($row) {
		$intitule = new intitule();
		$intitule->idIntitule=$row['idIntitule'];
		$intitule->type=$row['type'];
		$intitule->libelle=$row['libelle'];
		return $intitule;
	}
	
	static function getIntitules($type, $intitules) {
		$ret=array();
		foreach ($intitules as $intitule) {
			if ($intitule->type==$type) {
				$ret[]=$intitule;
			}
		}
		return $ret;
	}
}
?>