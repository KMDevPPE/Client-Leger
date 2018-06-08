<?php
    class Modele
    {
        private static $pdo;
        public static function connexion()
        {
            try {
                Modele::$pdo = new PDO("mysql:host=localhost;dbname=BTPRent","marc","marc");
            } catch (Exeption $exp) {
                echo "Erreur de connexion a la bdd";
            }
        }
        public static function verifConnexion($mail,$mdp)
        {
            Modele::connexion();
            $requete="select count(*) as nb, NOM_C, PRENOM_C from CLIENT where mail=:mail and mdp=:mdp group by mail;";
            $donnees = array(':mail' => $mail,':mdp'=>$mdp );
            $select = Modele::$pdo->prepare($requete);
            $select -> execute($donnees);
            $resultat = $select->fetch();
            return $resultat;
        }
        public static function insertReponse($mail,$moyenne)
        {
            Modele::connexion();
            $requete="insert into ENQUETE values (:mail, :moyenne, curdate());";
            $donnees = array(':mail' => $mail,':moyenne'=>$moyenne );
            $select = Modele::$pdo->prepare($requete);
            $select -> execute($donnees);
        }

        public static function mesReservations ($email)
        {
            Modele::connexion();
            $requete="select * from lesReservations where email=:email;";
            $donnees = array(':email' => $email );
            $select = Modele::$pdo->prepare($requete);
            $select -> execute($donnees);
            $resultats = $select->fetchAll();
            return $resultats;
        }

        public static function selectAllReponses ($email)
        {
            Modele::connexion();
            $requete="select * from Enquete;";
            $select = Modele::$pdo->prepare($requete);
            $select -> execute();
            $resultats = $select->fetchAll();
            return $resultats;
        }
    }
 ?>
