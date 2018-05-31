<?php


include __DIR__ . '/controleur.php';
include ("../modele/modele.php");

$unControleur = new Controleur ("localhost","btprent", "root","");
session_start();

	if (isset($_POST['mail']) && isset($_POST['mdp']))
	{
		$unControleur->setTable("particulier,entreprise");
		$tab = array(
			"mail"=>$_POST['mail'],
			"mdp"=>$_POST['mdp']
		);
		$listeInfos = array('mail' => $_POST['mail'], 'mdp' => $_POST['mdp']);
		//$unControleur->setTable("particulier , entreprise");
		//$a = $unControleur->selectCount($tab);

		$resultat = $unControleur->verifierIdentifiants($listeInfos);
		if ($resultat) {
			echo "OK";
			$_SESSION['mail'] = $_POST['mail'];
		} else {
			echo "IDENTIFIANTS INCORRECTS";
		}

		/*if ($a = 1)
		{
			echo "OK";
			$_SESSION['mail'] = $_POST['mail'];
		} else {
			echo "Identifiants inccorects !";
		}*/
	}else {
		echo "veuillez remplir tous les champs";
	}
?>
