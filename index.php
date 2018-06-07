<?php
	session_start();
	include ("controleur/controleur.php");
	include ("modele/modele.php");
?>
<!DOCTYPE HTML>
<!--
	Arcana by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>BTPRent </title>
		<meta charset="utf-8" />
		<link rel="shortcut icon" href="images/icone.png" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>


		<div id="page-wrapper">




			<!-- Header -->
				<div id="header">

					<!-- <div>
					<?php
					$date = date("d-m-Y");
					$heure = date("H:i");
					echo '<p class="datej"> <strong>'.$date.' ' .$heure. '</strong> </p>';
					?>
					 </div>
					-->


					<!-- Logo -->
						<h1><a href="index.php" id="logo"> BTPRent </a></h1>  

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.php?page=1">Accueil</a></li>
								<li><a href="index.php?page=2">Gros Oeuvre</a></li>
								<li><a href="index.php?page=3">Ponçage</a></li>
								<li><a href="index.php?page=4">Electricité</a></li>
								<li><a href="index.php?page=5">Rénovation</a></li>
								<li><a href="index.php?page=6">Nettoyage</a></li>
								<li><a href="index.php?page=7">Elévation</a></li>
								<li><a href="index.php?page=8">Manutention</a></li>
								<li><a href="index.php?page=9">Plomberie</a></li>
							</ul>
						</nav>

				</div>
		</div>


		<!-- PHP -->
			<?php
			if (isset($_GET['page'])){
				$page = $_GET['page'];
			}
			else {
				$page =  0;
			}
			$unControleur = new Controleur ("localhost","btprent", "root","");
			switch ($page)
			{
				case 0 :
					include ("vue/vueAccueil.php");
					break;
				case 1 :
					include ("vue/vueAccueil.php");
					break;
				case 2 :
					$unControleur->setTable("materiel");
					$tab = array("ID_TYPE"=>1);
					$resultats = $unControleur->selectWhere($tab);
					include ("vue/vue_materielperf.php");
					break;
				case 3 :
					$unControleur->setTable("materiel");
					$tab = array("ID_TYPE"=>2);
					$resultats = $unControleur->selectWhere($tab);
					include ("vue/vue_materielperf.php");
					break;
				case 4 :
					$unControleur->setTable("materiel");
					$tab = array("ID_TYPE"=>3);
					$resultats = $unControleur->selectWhere($tab);
					include ("vue/vue_materielperf.php");
					break;
				case 5 :
					$unControleur->setTable("materiel");
					$tab = array("ID_TYPE"=>4);
					$resultats = $unControleur->selectWhere($tab);
					include ("vue/vue_materielperf.php");
					break;
				case 6 :
					$unControleur->setTable("materiel");
					$tab = array("ID_TYPE"=>5);
					$resultats = $unControleur->selectWhere($tab);
					include ("vue/vue_materielperf.php");
					break;
				case 7 :
					$unControleur->setTable("materiel");
					$tab = array("ID_TYPE"=>6);
					$resultats = $unControleur->selectWhere($tab);
					include ("vue/vue_materielperf.php");
					break;
				case 8 :
					$unControleur->setTable("materiel");
					$tab = array("ID_TYPE"=>7);
					$resultats = $unControleur->selectWhere($tab);
					include ("vue/vue_materielperf.php");
					break;
				case 9 :
					$unControleur->setTable("materiel");
					$tab = array("ID_TYPE"=>8);
					$resultats = $unControleur->selectWhere($tab);
					include ("vue/vue_materielperf.php");
					break;
				case 10 :
					$unControleur->setTable("Entreprise");
					include ("vue/vueInsertPro.php");
					if (isset($_POST['valider']))
					{
						$tab = array("raison"=>$_POST['raison'],
							"domaine"=>$_POST['domaine'],
							"siret"=>$_POST['siret'],
							"nom_c"=>$_POST['nom'],
							"prenom_c"=>$_POST['prenom'],
							"ville_c"=>$_POST['ville'],
							"cp_c"=>$_POST['cp'],
							"rue_c"=>$_POST['rue'],
							"telephone"=>$_POST['telephone'],
							"mail"=>$_POST['mail'],
							"mdp"=>$_POST['mdp']
						);
						$unControleur->setTable("entreprise");
						$unControleur->insert($tab);
					}
					break;
				case 11 :
					$unControleur->setTable("particulier");
					include ("vue/vueInsertPart.php");
					if (isset($_POST['valider']))
					{
						$tab = array(
							"datenaiss"=>$_POST['datenaiss'],
							"nom_c"=>$_POST['nom'],
							"prenom_c"=>$_POST['prenom'],
							"ville_c"=>$_POST['ville'],
							"cp_c"=>$_POST['cp'],
							"rue_c"=>$_POST['rue'],
							"telephone"=>$_POST['telephone'],
							"mail"=>$_POST['mail'],
							"mdp"=>$_POST['mdp']
						);
						$unControleur->setTable("particulier");
						$unControleur->insert($tab);
					}
					break;
			}
			?>


			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
							<section class="3u 6u(narrower) 12u$(mobilep)">

								<?php
								if (isset($_SESSION['mail'])) {
									echo "Bonjour " . $_SESSION['mail'];
									include 'vue/vue_deconnexion.php';
								} else {
									include 'vue/vue_connexion.php';
								}
								?>

							</section>
							<section class="3u 6u$(narrower) 12u$(mobilep)">
								<h3>Pas encore inscrit ?</h3>
								<br>
								<p>Etes vous un professionnel ?</p>
								<a href="index.php?page=10"><input type="submit" name="oui" value="OUI"></a>
								<br><br>
								<a href="index.php?page=11"><input type="submit" name="non" value="NON"></a>

							</section>
							<section class="6u 12u(narrower)">
								<h3>Nous contacter</h3>
								<form>
									<div class="row 50%">
										<div class="6u 12u(mobilep)">
											<input type="text" name="nom" id="nom" placeholder="Nom" />
										</div>
										<div class="6u 12u(mobilep)">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
									</div>
									<div class="row 50%">
										<div class="12u">
											<textarea name="message" id="message" placeholder="Message" rows="5"></textarea>
										</div>
									</div>
									<div class="row 50%">
										<div class="12u">
											<ul class="actions">
												<li><input type="submit" class="button alt" value="Envoyer" /></li>
											</ul>
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>

					<!-- Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
						</ul>

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; BTPRent. Tous droits réservés.</li><li>Réalisation du site : <a href="#">KMDev</a></li>
							</ul>
						</div>

				</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>
