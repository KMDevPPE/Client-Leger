<?php

	class Modele
	{
		private $pdo,$table;

	public function __construct ($serveur,$bdd,$user,$mdp)
	{
		$this->pdo = null;
		$this->table = "";

		try
		{
			$this->pdo = new PDO ("mysql:host=".$serveur.";dbname=".$bdd , $user,$mdp);
		}

		catch (Exception $exp)
		{
			echo "erreur de connexion a la bdd";
		}
	}

	public function setTable ($uneTable){
		$this->table = $uneTable ;
	}

	public function selectAll()
	{
		if ($this->pdo != NULL)
		{
			$requete = "select * from ".$this->table.";";
			$select = $this->pdo->prepare ($requete);
			$select -> execute ();
			$resultats = $select->fetchAll();
			return $resultats ;
		}else {
			return null ;
		}
	}

	public function insert($tab) //on recoit un tableau
	{
		if ($this->pdo != NULL)
		{
			$donnees = array();
			$champs = array();
			foreach ($tab as $cle => $valeur) {
				$champs[] = ":".$cle;
				$donnees [":".$cle] = $valeur;
			}

			$chainechamps = implode(",", $champs);

			$requete = "insert into ".$this->table." values (
				null,".$chainechamps.")";

				echo "test".$requete;

			$insert = $this->pdo->prepare ($requete);
			$insert->execute($donnees);
		}
	}

	// public function recherche($motcle)
	// {
	// 	if ($this->pdo != NULL)
	// 	{
	// 		$requete = "select * from eleve where nom like :motcle or prenom like :motcle;";
	// 		$donnees = array(":motcle"=>"%".$motcle."%");
	// 		$recherche = $this->pdo->prepare($requete);
	// 		$recherche->execute($donnees);
	// 		$resultats = $recherche->fetchAll();
	// 		return $resultats;
	// 	}
	// 	else
	// 	{
	// 		return null;
	// 	}
	// }

	public function delete($tab)
	{
		if ($this->pdo != NULL)
		{
			$donnees = array();
			$champs = array();

			foreach ($tab as $cle => $valeur) {
				$champs[]=$cle."= :".$cle;
				$donnees[":".$cle]=$valeur;
			}

			$chainechamps=implode(" and ",$champs);//le caractere separateur est le AND

			$requete = "delete from ".$this->table." where ".$chainechamps;

			$delete = $this->pdo->prepare($requete);
			$delete->execute($donnees);
		}
		else
		{
			return null;
		}
	}

	// public function update($tab)
	// {
	// 	if ($this->pdo != NULL)
	// 	{
	// 		$requete = "update eleve set nom = :nom , prenom = :prenom , age = :age where idEleve = :ideleve;";
	// 		$donnees = array(
	// 						":ideleve"=>$tab['ideleve'],
	// 						":nom"    =>$tab['nom'],
	// 						":prenom" =>$tab['prenom'],
	// 						":age"    =>$tab['age']
	// 					);
	// 		$update = $this->pdo->prepare($requete);
	// 		$update->execute($donnees);
	// 	}
	// 	else
	// 	{
	// 		return null;
	// 	}
	// }

	/*public function selectWhere ($id)
	{
		if ($this->pdo != NULL)
		{
			$requete = "select * from eleve where ideleve = :ideleve;";
			$donnees = array(
							":ideleve"=>$id
						);
			$selectWhere = $this->pdo->prepare($requete);
			$selectWhere->execute($donnees);
			$unResultat = $selectWhere->fetch();

			return $unResultat;
		}
		else
		{
			return null;
		}
	}*/

	public function selectWhere ($tab)
	{
		if ($this->pdo != NULL)
		{
				$donnees = array();
				$champs = array();

				foreach ($tab as $cle => $valeur) {
					$champs[]=$cle."= :".$cle;
					$donnees[":".$cle]=$valeur;
				}

				$chainechamps=implode(" and ",$champs);//le caractere separateur est le AND

				$requete = "select * from ".$this->table." where ".$chainechamps;

				$selectWhere = $this->pdo->prepare($requete);
				$selectWhere->execute($donnees);
				$resultats = $selectWhere->fetchAll();
				return $resultats ;
		}
		else
		{
			return null;
		}
	}
	public function selectCount ($tab)
	{
		if ($this->pdo != NULL)
		{
				$donnees = array();
				$champs = array();

				foreach ($tab as $cle => $valeur) {
					$champs[]=$cle."= :".$cle;
					$donnees[":".$cle]=$valeur;
				}

				$chainechamps=implode(" and ",$champs);//le caractere separateur est le AND

				$requete = "select count(*) from ".$this->table." where ".$chainechamps;

				$selectCount = $this->pdo->prepare($requete);
				$selectCount->execute($donnees);
				$resultats = $selectCount->fetchAll();
				return $resultats ;
		}
		else
		{
			return null;
		}

	}

	public function verifierIdentifiants($listeInfos) {
		if ($this->pdo != null) {
			$requete = $this->pdo->prepare("SELECT * FROM Client WHERE mail = :mail AND MDP = :mdp");
			try {
				$requete->execute($listeInfos);
			} catch (PDOException $e) {
				echo $e;
			}
			return $requete->fetch();
		}
	}

	public function insertCont($tab)
	{
		if ($this->pdo != NULL)
		{
			$chaine = implode("','",$tab);
			$requete = "call pInsCont ('".$chaine."');";
			$insertCont = $this->pdo->prepare ($requete);
			$insertCont->execute($tab);
			echo $requete;
		}
	}
}
?>
