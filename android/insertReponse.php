<?php
    include ("Modele.class.php");

    if(isset($_REQUEST['email'])) // comme le get mais pour java
    {
        $mail = $_REQUEST['email'];
    }else {
        $mail = "";
    }

    if(isset($_REQUEST['moyenne'])) // comme le get mais pour java
    {
        $moyenne = $_REQUEST['moyenne'];
    }else {
        $moyenne = "";
    }

    Modele::insertReponse($mail,$moyenne);
?>
