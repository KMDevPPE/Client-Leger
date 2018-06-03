<?php

	class Controleur
	{
		private $unModele ;
		public function __construct ($serveur,$bdd,$user,$mdp)
		{
			$this->unModele = new Modele ($serveur,$bdd,$user,$mdp);
		}

		public function setTable ($uneTable)
		{
			$this->unModele->setTable($uneTable);
		}
		public function selectAll ()
		{
			return $this->unModele->selectAll();
		}
		public function insert ($tab)
		{
			return $this->unModele->insert($tab);
		}
		public function delete ($tab)
		{
			return $this->unModele->delete($tab);
		}
		public function selectWhere($tab)
		{
			return $this->unModele->selectWhere($tab);
		}
		public function selectCount($tab)
		{
			return $this->unModele->selectCount($tab);
		}

		public function verifierIdentifiants($listeInfos) {
			return $this->unModele->verifierIdentifiants($listeInfos);
		}

		public function insertCont($tab)
		{
			return $this->unModele->insertCont($tab);
		}
	}

?>
