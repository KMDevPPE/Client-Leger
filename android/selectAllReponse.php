<?php
    include ("Modele.class.php");

    $resultats = Modele::selectAllReponses();
    print(json_encode($resultats));



 ?>
