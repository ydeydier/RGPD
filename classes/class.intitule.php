<?php
class intitule {
	var $idIntitule;
	var $type;
	var $libelle;
	private static $intitules;	// tableau des intitules
	
	static function charger() {
		// echo "JE CHARGE !"; TOTO : pourquoi chargement à chaque fois ?!!!!
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
	
	static function getIntitules($type) {
		if (!isset(self::$intitules)) {
			self::$intitules=self::charger();
		}
		$ret=array();
		foreach (self::$intitules as $intitule) {
			if ($intitule->type==$type) {
				$ret[]=$intitule;
			}
		}
		return $ret;
	}
}
?>