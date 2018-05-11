<?php
	header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
	//error_reporting(E_ALL ^ E_DEPRECATED);
	session_start();
	unset($_SESSION["fichierConfiguration"]);
	require "header1.php";
	$login="";
	$password="";
	if (isset($_COOKIE['login'])) $login=$_COOKIE['login'];
	if (isset($_COOKIE['password'])) $password=$_COOKIE['password'];
	$messageLoginIncorrect="";
	if (isset($_GET['erreur'])) {
		$erreur=$_GET['erreur'];
		if ($erreur=="loginPasswordIncorrects") $messageLoginIncorrect='<span class="erreur">Login ou mot de passe incorrect !</span>';
	}
?>
<table class="tableLogin">
<tr height="30%">
<td>
<img src="../img/rt-rgpd.png">
</td>
</tr>
<tr height="30%" style="BACKGROUND:#FFFFFF;">
<td>
	<?php echo $messageLoginIncorrect;?>
	<!-- <b style="color:#FF0000;">ATTENTION LE SITE EST EN COURS DE MAINTENANCE.<br>MERCI DE NE PAS L'UTILISER AUJOURD'HUI (Mercredi 09/05/2018)</b> -->
	<br><br>
	<form method="POST" action="login_trt.php">
	<table align="center" cellpadding="5px">
	<tr><td style="text-align:left;">Utilisateur</td><td><input spellcheck="false" type="text" name="txtLogin" value="<?php echo $login;?>" <?php if ($login=="") echo "autofocus";?>></td></tr>
	<tr><td style="text-align:left;">Mot de passe</td><td><input type="password" name="txtPassword" value="<?php echo $password;?>"></td></tr>
	</table>
	<br><br><br>
	<button type="submit" class="bouton" <?php if ($login!="") echo "autofocus";?>>Connexion</button>
	</form>
	<br><br>
</td>
</tr>

<tr height="40%">
<td style="color:#EEEEEE;" valign="bottom">
RTR Version 1.0 - <a class="lienFondVert" href="apropos.php">A propos de RTR</a></div>
</td>
</tr>
</table>
</body>
</html>