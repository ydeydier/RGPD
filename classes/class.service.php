<?php
require_once "../classes/class.direction.php";
class service {
	var $idService;
	var $direction;
	var $libelle;
	
	static function charger($directions) {
		$result = executeSqlSelect("SELECT * FROM service ORDER BY idDirection, libelle");
		$services = array();
		while($row = mysqli_fetch_array($result)) {
			$service = new service();
			$service->idService=$row['idService'];
			$service->libelle=$row['libelle'];
			$idDirection=$row['idDirection'];
			$service->direction=$directions[$idDirection];
			$services[$service->idService]=$service;
		}
		return $services;
	}

	static function renommer($idService, $nouveauNom) {
		$nouveauNom=mysqlEscape($nouveauNom);
		executeSql("update service set libelle='$nouveauNom' where idService=$idService");
	}
	static function supprimer($idService) {
		executeSql("delete from service where idService=$idService");
	}
	static function ajouter($nomService, $idDirection) {
		$nomService=mysqlEscape($nomService);
		executeSql("insert into service (libelle, idDirection) values ('$nomService', $idDirection)");
	}
}
?>