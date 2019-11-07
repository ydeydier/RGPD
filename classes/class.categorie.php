<?php
class categorie {
	var $idCategorie;
	var $libelle;
	var $description;
	
	static function charger() {
		$result = executeSqlSelect("SELECT * FROM categorie");
		$categories = array();
		while($row = mysqli_fetch_array($result)) {
			$categorie = self::instanceDepuisSqlRow($row);
			$categories[$categorie->idCategorie]=$categorie;
		}
		return $categories;
	}
		
	static function instanceDepuisSqlRow($row) {
		$categorie = new categorie();
		$categorie->idCategorie=$row['idCategorie'];
		$categorie->libelle=$row['libelle'];
		$categorie->description=$row['description'];
		return $categorie;
	}
}
?>