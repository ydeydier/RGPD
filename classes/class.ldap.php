<?php
class ldap {
	static function verifierLoginPassword($username, $password, $tConnexionLDAP) {
		$adServer = $tConnexionLDAP["host"];
		$domain = $tConnexionLDAP["domain"];
		$ldap = ldap_connect($adServer);
		$ldaprdn = $domain . "\\" . $username;
		ldap_set_option($ldap, LDAP_OPT_PROTOCOL_VERSION, 3);
		ldap_set_option($ldap, LDAP_OPT_REFERRALS, 0);
		return @ldap_bind($ldap, $ldaprdn, $password);
	}
	
	static function chargerDepuisLDAP($username, $password, $tConnexionLDAP) {
		$adServer = $tConnexionLDAP["host"];
		$domain = $tConnexionLDAP["domain"];
		$ldap = ldap_connect($adServer);
		$ldaprdn = $domain . "\\" . $username;
		ldap_set_option($ldap, LDAP_OPT_PROTOCOL_VERSION, 3);
		ldap_set_option($ldap, LDAP_OPT_REFERRALS, 0);
		$rBind=ldap_bind($ldap, $ldaprdn, $password);
		$resulat=array();
		if ($rBind) {
			$base_dn=$tConnexionLDAP["base_dn"];
			$filter=$tConnexionLDAP["filter"];
			$sr = ldap_search($ldap, $base_dn, $filter."=".$username);
			$info = ldap_get_entries($ldap, $sr);
			if ($info) {
				$prenom=$info[0]["givenname"][0];
				$nom=$info[0]["sn"][0];
				$resulat['prenom']=$prenom;
				$resulat['nom']=$nom;
			}
		}
		return $resulat;
	}
}
?>