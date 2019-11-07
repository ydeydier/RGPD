<?php
class direction {
	var $idDirection;
	var $libelle;
	
	static function charger() {
		$result = executeSqlSelect("SELECT * FROM direction ORDER BY libelle");
		$directions = array();
		while($row = mysqli_fetch_array($result)) {
			$direction = new direction();
			$direction->idDirection=$row['idDirection'];
			$direction->libelle=$row['libelle'];
			$directions[$direction->idDirection]=$direction;
		}
		return $directions;
	}

	static function renommer($idDirection, $nouveauNom) {
		$nouveauNom=mysqlEscape($nouveauNom);
		executeSql("update direction set libelle='$nouveauNom' where idDirection=$idDirection");
	}
	
	static function ajouter($nom) {
		$nom=mysqlEscape($nom);
		executeSql("insert into direction (libelle) values ('$nom')");
	}

	static function supprimer($idDirection) {
		executeSql("delete from direction where idDirection=$idDirection");
	}
}
?>