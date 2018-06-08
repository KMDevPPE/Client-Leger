<?php
    include ("Modele.class.php");

    if(isset($_REQUEST['email'])) // comme le get mais pour java
    {
        $email = $_REQUEST['email'];
    }else {
        $email = "";
    }

    $resultats = Modele::mesReservations($email);
    print(json_encode($resultats));

?>
