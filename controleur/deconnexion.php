<?php 
if (isset($_POST['deco'])) {
	session_start();
	$_SESSION = array();
	session_destroy();
	echo "OK";
} else {
	echo "KO";
}
?>