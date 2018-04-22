<?php
require_once "../classes/class.ldap.php";
class utilisateur {
	var $idUtilisateur;
	var $login;
	var $password;
	var $nom;
	var $prenom;
	var $administrateur;	// 'O' ou 'N'
	
	static function chargerDepuisBDD($login) {
		$login=strtolower(trim($login));
		$result = executeSqlSelect("SELECT * FROM utilisateur where lower(trim(login))='$login'");
		$row = mysqli_fetch_array($result);
		if ($row) {
			$utilisateur=self::instanceDepuisSqlRow($row);
		} else {
			$utilisateur=false;
		}
		return $utilisateur;
	}

	static function chargerDepuisLDAP($login, $passwordSaisi, $tConnexionLDAP) {
		$login=strtolower(trim($login));
		$retLdap=ldap::chargerDepuisLDAP($login, $passwordSaisi, $tConnexionLDAP);
		$utilisateur=false;
		if (sizeof($retLdap)>0) {
			$utilisateur = new utilisateur();
			$utilisateur->login=$login;
			$utilisateur->password=$passwordSaisi;
			$utilisateur->nom=$retLdap['nom'];
			$utilisateur->prenom=$retLdap['prenom'];
			$utilisateur->administrateur="N";
		}
		return $utilisateur;
	}

	static function instanceDepuisSqlRow($row) {
		$utilisateur = new utilisateur();
		$utilisateur->idUtilisateur=$row['idUtilisateur'];
		$utilisateur->login=trim($row['login']);
		$utilisateur->password=trim($row['password']);
		$utilisateur->nom=$row['nom'];
		$utilisateur->prenom=$row['prenom'];
		$utilisateur->administrateur=$row['administrateur'];
		return $utilisateur;
	}

	function verifierLoginPasswordBase($passwordSaisi) {
		return strtolower(trim($passwordSaisi))==strtolower(trim($this->password));
	}

	function verifierLoginPasswordLDAP($passwordSaisi, $tConnexionLDAP) {
		$sLdap = $tConnexionLDAP["utiliserLDAP"];
		$bAuthLDAP = (trim(strtolower($sLdap))=="oui");
		if ($bAuthLDAP) {
			$bRet=ldap::verifierLoginPassword($this->login, $passwordSaisi, $tConnexionLDAP);
		} else {
			$bRet=false;
		}
		return $bRet;
	}

	function estAdministrateur() {
		return ($this->administrateur=="O");
	}

	/*
	function update() {
		$sql="update utilisateur set nom='".mysqlEscape($this->nom)."', prenom='".mysqlEscape($this->prenom)."', password='".mysqlEscape($this->password)."' where idUtilisateur=$this->idUtilisateur";
		executeSql($sql);
	}

	function insert() {
		$sql="insert into utilisateur (nom, prenom, login, password) value ('".mysqlEscape($this->nom)."', '".mysqlEscape($this->prenom)."', '".mysqlEscape($this->login)."', '".mysqlEscape($this->password)."')";
		executeSql($sql);
	}
	
	static function delete($idUtilisateur) {
		$sql="delete from utilisateur where idUtilisateur=$idUtilisateur";
		executeSql($sql);
	}
	*/
	function logConnexion() {
		$sql="insert into connexion (login) value ('".mysqlEscape($this->login)."')";
		executeSql($sql);
	}
	function chargeConnexions() {
		$connexions = array();
		$result = executeSqlSelect("SELECT * FROM connexion order by timestamp desc");
		while($row = mysqli_fetch_array($result)) {
			$connexions[]=array("login"=>$row["login"], "timestamp"=>$row["timestamp"]);
		}
		return $connexions;
	}
}
?>