<?php
class champ {
	var $nomChamp;
	var $ordre;
	var $libelleChamp;
	var $description;
	var $typeInterface;	// U=une ligne, M=multilignes, D=Date, L=Liste (liste définie par $typeListe)
	var $typeListe;
	var $tailleMax;
	var $afficheDansListe;
	var $idCategorie;
	var $masque;
	
	static function charger() {
		$result = executeSqlSelect("SELECT * FROM champ order by ordre");
		$champs = array();
		while($row = mysqli_fetch_array($result)) {
			$champ = self::instanceDepuisSqlRow($row);
			$champs[$champ->nomChamp]=$champ;
		}
		return $champs;
	}
		
	static function instanceDepuisSqlRow($row) {
		$champ = new champ();
		$champ->nomChamp=$row['nomChamp'];
		$champ->ordre=$row['ordre'];
		$champ->libelleChamp=$row['libelleChamp'];
		$champ->description=$row['description'];
		$champ->typeInterface=$row['typeInterface'];
		$champ->typeListe=$row['typeListe'];
		$champ->tailleMax=$row['tailleMax'];
		$champ->afficheDansListe=$row['afficheDansListe'];
		$champ->idCategorie=$row['idCategorie'];
		$champ->masque=$row['masque'];
		return $champ;
	}
	
	function update() {
		$libelleChamp=mysqlEscape($this->libelleChamp);
		$description=mysqlEscape($this->description);
		$sql="update champ set ordre=$this->ordre, libelleChamp='$libelleChamp', description='$description', typeInterface='$this->typeInterface', typeListe='$this->typeListe', tailleMax=$this->tailleMax, afficheDansListe='$this->afficheDansListe', idCategorie=$this->idCategorie, masque='$this->masque' where nomChamp='$this->nomChamp'";
		executeSql($sql);
	}

	function bAfficheDansListe() {
		return ($this->afficheDansListe=="O");
	}
}
?>