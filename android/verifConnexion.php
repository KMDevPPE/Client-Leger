<?php
    include ("Modele.class.php");

    if(isset($_REQUEST['mail'])) // comme le get mais pour java
    {
        $mail = $_REQUEST['mail'];
    }else {
        $mail = "";
    }

    if(isset($_REQUEST['mdp'])) // comme le get mais pour java
    {
        $mdp = $_REQUEST['mdp'];
    }else {
        $mdp = "";
    }

    $resultat[] = Modele::verifConnexion($mail,$mdp);

    print(json_encode($resultat));

?>
