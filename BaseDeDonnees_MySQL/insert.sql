--INSERT ESSENTIELS A LA BDD POUR LE FONCTIONNEMENT DES APPS

insert into ETAT
values
	(1,'neuf'),
	(2,'tres bon etat'),
	(3,'bon etat'),
	(4,'mauvais etat'),
	(5,'defectueux');

insert into LOCALISATION
values
	(1,'Paris','75017','rue de Paris'),
	(2,'Argenteuil','95100','rue Guy Moquet'),
	(3,'Colombes','92700','rue du oresident salvador allende'),
	(4,'Nanterre','92014','rue de je sais pas');

insert into TYPE_MATERIEL
values
	(1,'Gros Oeuvre'),
	(2,'Poncage'),
	(3,'Electricite'),
	(4,'Nettoyage'),
	(5,'Elevation'),
	(6,'Manutention'),
	(7,'Plomberie');

insert into SALARIE(ID_S, nom_s, prenom_s, rue_s, cp_s, ville_s, mail, mdp, droits)
values
	(null, 'MOUALEM', 'Yannis', 'Rue de Senlis', '95260', 'Beaumont', 'admin','mo', 'admin'),
	(null,"admin","admin","rue de l'admin","00000","ville de l'admin","admin","123","admin"),
	(null,"util","util","rue de l'util","00000","ville de l'util","util","456","util");


-- INSERT DE TEST

insert into PARTICULIER (id_C,datenaiss,nom_c,prenom_c,ville_c,cp_c,rue_c,telephone,mail,mdp)
values
	(null,'1999-01-21','didier','marc','paris','75007','rue de paris','0606060606','q@q.q','q'),
	(null,curdate(),'moualem','yannis','paris','75003','rue du 3eme','0707070707','y@y.y','y'),
	(null,curdate(),'kamoun','elies','paris','75008','rue par la','0909090909','e@e.e','e');

insert into ENTREPRISE
values
	(null,'yannis','truc','01234567891257','moualem','yannis','Paris','95100','rue de pars','0101010101','a@a','a'),
	(null,'logisur','logistique','01234567891257','didier','marc','Argenteuil','95100','rue guy moquet','0101010101','l@l.l','l');


insert into MATERIEL
values (null,1,1,1,'betonniere',49.99,'images/betoniere.jpg',5),
		(null,1,2,1,'ponceuse delta',49.99,'images/ponceuse_delta.jpg',0),
		(null,1,2,1,'scie sauteuse',49.99,'images/scie_sauteuse.jpg',120),
		(null,1,2,1,'scie circulaire',49.99,'images/scie_circulaire.jpg',30),
		(null,1,1,1,'grue mobile',199.99,'images/grueMobile.jpg',5),
		(null,1,3,1,'groupe electrogene',99.99,'images/groupeElectrogene',5),
		(null,1,6,1,'echafaudage',49.99,'images/echafaudage.jpg',5),
		(null,1,5,1,'chariot de nettoyage',19.99,'images/chariotDeNettoyage.jpg',10),
		(null,1,3,1,'gerbeur electrique',29.99,'images/gerbeurElectrique.jpg',5),
		(null,1,8,1,'motopompe haute pression',49.99,'images/motopompeHautePression.jpg',7);


-- call pInsCont ('e@e.e','scie sauteuse','images/scie_sauteuse.jpg',49.99,'2018-06-07',10);


update PARTICULIER
set prenom_C = 'Yannis'
where id_C = 1;

update ENTREPRISE
set telephone = '0202020202'
where id_C = 3;

delete from PARTICULIER
where id_C = 1;

delete from ENTREPRISE
where id_C = 3;
