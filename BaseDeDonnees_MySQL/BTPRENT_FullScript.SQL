DROP DATABASE IF EXISTS BTPRent;

CREATE DATABASE IF NOT EXISTS BTPRent;
USE BTPRent;
# -----------------------------------------------------------------------------
#       TABLE : LOCALISATION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LOCALISATION
 (
   ID_LOCALISATION INTEGER(2) NOT NULL auto_increment ,
   LIEUX VARCHAR(128) NULL  ,
   CP CHAR(5) NULL  ,
   rue_c VARCHAR(128) NULL
   , PRIMARY KEY (ID_LOCALISATION)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : TYPE_MATERIEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPE_MATERIEL
 (
   ID_TYPE CHAR(5) NOT NULL  ,
   LIBELLE CHAR(32) NULL
   , PRIMARY KEY (ID_TYPE)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MATERIEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MATERIEL
 (
   ID_M INTEGER(2) NOT NULL auto_increment ,
   ID_LOCALISATION INTEGER(2) NOT NULL  ,
   ID_TYPE CHAR(5) NOT NULL  ,
   ID_ETAT INTEGER(2) NOT NULL  ,
   NOM_M CHAR(32) NULL  ,
   PRIX_M DECIMAL(10,2) NULL  ,
   IMAGE_M VARCHAR(200)  ,
   STOCK_M INTEGER(2)
   , PRIMARY KEY (ID_M)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ETAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ETAT
 (
   ID_ETAT INTEGER(2) NOT NULL  ,
   NOM_ETAT CHAR(32) NULL
   , PRIMARY KEY (ID_ETAT)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CONTRAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONTRAT
 (
   ID_CONT INTEGER(2) NOT NULL auto_increment ,
   ID_M INTEGER(2) NULL  ,
   ID_S INTEGER(2) NULL  ,
   ID_C INTEGER(2) NOT NULL  ,
   QUANTITE INTEGER(2) NULL ,
   DATE_DEB DATE NULL  ,
   DATE_F DATETIME NULL
   , PRIMARY KEY (ID_CONT)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CLIENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLIENT
 (
   ID_C INTEGER(2) NOT NULL default 0 ,
   NOM_C VARCHAR(50) NOT NULL  ,
   PRENOM_C VARCHAR(50) NOT NULL  ,
   VILLE_C CHAR(32) NULL  ,
   CP_C CHAR(32) NULL  ,
   RUE_C VARCHAR(128) NULL  ,
   TELEPHONE CHAR(10) NULL  ,
   MAIL VARCHAR(128) NOT NULL  ,
   MDP CHAR(100) NOT NULL
   , PRIMARY KEY (ID_C)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : TECHNICIEN
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TECHNICIEN
 (
   IDT INTEGER(2) NOT NULL auto_increment ,
   NOMT CHAR(32) NULL  ,
   PRENOMT CHAR(32) NULL  ,
   MAIL CHAR(100) NOT NULL  ,
   MDP CHAR(100) NOT NULL
   , PRIMARY KEY (IDT)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ENTREPRISE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ENTREPRISE
 (
   ID_C INTEGER(2) NOT NULL default 0 ,
   RAISON VARCHAR(50) NULL  ,
   DOMAINE VARCHAR(50) NULL  ,
   SIRET CHAR(14) NULL  ,
   NOM_C VARCHAR(50) NOT NULL  ,
   PRENOM_C VARCHAR(50) NOT NULL  ,
   VILLE_C CHAR(32) NULL  ,
   CP_C CHAR(32) NULL  ,
   RUE_C VARCHAR(128) NULL  ,
   TELEPHONE CHAR(10) NULL  ,
   MAIL VARCHAR(128) NOT NULL  ,
   MDP CHAR(100) NOT NULL
   , PRIMARY KEY (ID_C)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SALARIE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SALARIE
 (
   ID_S INTEGER(2) NOT NULL auto_increment ,
   NOM_S CHAR(32) NULL  ,
   PRENOM_S CHAR(32) NULL  ,
   RUE_S VARCHAR(128) NULL  ,
   CP_S CHAR(5) NULL  ,
   VILLE_S VARCHAR(128) NULL  ,
   MAIL CHAR(32) NULL  ,
   MDP CHAR(32) NULL  ,
   DROITS ENUM('admin','util') NULL
   , PRIMARY KEY (ID_S)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PARTICULIER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PARTICULIER
 (
   ID_C INTEGER(2) NOT NULL default 0 ,
   DATENAISS DATE NULL  ,
   NOM_C VARCHAR(50) NOT NULL  ,
   PRENOM_C VARCHAR(50) NOT NULL  ,
   VILLE_C CHAR(32) NULL  ,
   CP_C CHAR(32) NULL  ,
   rue_c VARCHAR(128) NULL  ,
   TELEPHONE CHAR(10) NULL  ,
   MAIL VARCHAR(128) NOT NULL  ,
   MDP CHAR(100) NOT NULL
   , PRIMARY KEY (ID_C)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : INTERVENIR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS INTERVENIR
 (
   ID_I INTEGER(2) NOT NULL auto_increment,
   IDT INTEGER(2) NOT NULL  ,
   ID_M INTEGER(2) NOT NULL  ,
   DATE_DEBUT DATE NULL  ,
   DATE_FIN DATE NULL
   , PRIMARY KEY (ID_I, IDT,ID_M)
 )
 comment = "";


 # -----------------------------------------------------------------------------
 #       TABLE : ENQUETE
 # -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ENQUETE
(
    MAIL VARCHAR(128)  ,
    MOYENNE DECIMAL (5,2)  ,
    DATE_E  DATE
)
comment = "";


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE MATERIEL
  ADD FOREIGN KEY FK_MATERIEL_LOCALISATION (ID_LOCALISATION)
      REFERENCES LOCALISATION (ID_LOCALISATION) ;


ALTER TABLE MATERIEL
  ADD FOREIGN KEY FK_MATERIEL_TYPE_MATERIEL (ID_TYPE)
      REFERENCES TYPE_MATERIEL (ID_TYPE) ;


ALTER TABLE MATERIEL
  ADD FOREIGN KEY FK_MATERIEL_ETAT (ID_ETAT)
      REFERENCES ETAT (ID_ETAT) ;


ALTER TABLE CONTRAT
  ADD FOREIGN KEY FK_CONTRAT_MATERIEL (ID_M)
      REFERENCES MATERIEL (ID_M) ;


ALTER TABLE CONTRAT
  ADD FOREIGN KEY FK_CONTRAT_SALARIE (ID_S)
      REFERENCES SALARIE (ID_S) ;


ALTER TABLE CONTRAT
  ADD FOREIGN KEY FK_CONTRAT_CLIENT (ID_C)
      REFERENCES CLIENT (ID_C) ;


ALTER TABLE ENTREPRISE
  ADD FOREIGN KEY FK_ENTREPRISE_CLIENT (ID_C)
      REFERENCES CLIENT (ID_C) ;


ALTER TABLE PARTICULIER
  ADD FOREIGN KEY FK_PARTICULIER_CLIENT (ID_C)
      REFERENCES CLIENT (ID_C) ;


ALTER TABLE INTERVENIR
  ADD FOREIGN KEY FK_INTERVENIR_TECHNICIEN (IDT)
      REFERENCES TECHNICIEN (IDT) ;


ALTER TABLE INTERVENIR
  ADD FOREIGN KEY FK_INTERVENIR_MATERIEL (ID_M)
      REFERENCES MATERIEL (ID_M) ;




insert into ETAT
values
	(1,'neuf'),
	(2,'tres bon etat'),
	(3,'bon etat'),
	(4,'mauvais etat'),
	(5,'defectueux');

insert into TYPE_MATERIEL
values
	(1,'Gros Oeuvre'),
	(2,'Poncage'),
	(3,'Electricite'),
	(4,'Renovation'),
	(5,'Nettoyage'),
	(6,'Elevation'),
	(7,'Manutention'),
	(8,'Plomberie');

insert into LOCALISATION
values
	(1,'Paris','75017','rue de Paris'),
	(2,'Argenteuil','95100','rue Guy Moquet'),
	(3,'Colombes','92700','rue du oresident salvador allende'),
	(4,'Nanterre','92014','rue de je sais pas');

insert into SALARIE(ID_S, nom_s, prenom_s, rue_s, cp_s, ville_s, mail, mdp, droits)
values
	(null, 'MOUALEM', 'Yannis', 'Rue de Senlis', '95260', 'Beaumont', 'admin','123', 'admin');

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


	/* TRIGGERS GERANT L'HERITAGE ENTRE CLIENT et les tables ENTREPRISE et PARTICULIER */
drop trigger if exists hPart;
delimiter //
create trigger hPart
    before insert on PARTICULIER
    for each row
    begin
    declare nb int (2) ;
    select Max(id_C) into nb from CLIENT;

    if nb is null
        then
            set nb = 0 ;
    else
            set nb = nb + 1 ;
    end if ;
            set new.id_C = nb ;

            insert into CLIENT
            values (new.id_C, new.nom_C, new.prenom_C, new.ville_C, new.cp_C, new.rue_C, new.telephone,new.mail, new.mdp);

    end //
delimiter ;

drop trigger if exists hEntr;
delimiter //
create trigger hEntr
    before insert on ENTREPRISE
    for each row
    begin
    declare nb int (2) ;
    select Max(id_C) into nb from CLIENT;

    if nb is null
        then
            set nb = 0 ;
    else
            set nb = nb + 1 ;
    end if ;
            set new.id_C = nb ;

            insert into CLIENT
            values (new.id_C, new.nom_C, new.prenom_C, new.ville_C, new.cp_C, new.rue_C, new.telephone,new.mail, new.mdp);

    end //
delimiter ;

drop trigger if exists upPart;
delimiter //
create trigger upPart
    before update on PARTICULIER
    for each row
    begin
        update CLIENT
        set nom_C = new.nom_C ,
            prenom_C = new.prenom_C ,
            ville_C = new.ville_C,
            cp_C = new.cp_C,
            rue_C = new.cp_C,
            telephone = new.telephone,
            mail = new.mail,
            mdp = new.mdp
        where id_C = new.id_C;
    end //
delimiter ;

drop trigger if exists upEntr;
delimiter //
create trigger upEntr
    before update on ENTREPRISE
    for each row
    begin
        update CLIENT
        set nom_C = new.nom_C ,
            prenom_C = new.prenom_C ,
            ville_C = new.ville_C,
            cp_C = new.cp_C,
            rue_C = new.cp_C,
            telephone = new.telephone,
            mail = new.mail,
            mdp = new.mdp
        where id_C = new.id_C;
    end //
delimiter ;

drop trigger if exists delPart;
delimiter //
create trigger delPart
    after delete on PARTICULIER
    for each row
    begin
        delete from Client
        where id_C = old.id_C;
    end //
delimiter ;

drop trigger if exists delEntr;
delimiter //
create trigger delEntr
    after delete on ENTREPRISE
    for each row
    begin
        delete from CLIENT
        where id_C = old.id_C;
    end //
delimiter ;

drop trigger if exists insCont;
delimiter //
create trigger insCont
    after insert on CONTRAT
    for each row
    begin
    update MATERIEL
        set STOCK_M = STOCK_M - new.QUANTITE;
    end //
delimiter ;


/*PROCEDURE PERMETTANT L'INSERTION D'UN MATERIEL AVEC UN ETAT, UN TYPE ET UNE LOCALISATION APPELLEE DANS LE CLIENT LOURD GESTIONBTPRent */
drop procedure if exists PInsMat;
delimiter //
create procedure PInsMat (nomM char(32), prix float(10,2), ville varchar(128), codeP char(5), larue varchar (128), imageM varchar (100), stockM int (2), nomType char(32), etat char(32))

	begin
		declare nbL, nbE, nbT, idl, ide, idt int;

		select count(*) into nbL from LOCALISATION where lieux = ville and cp = codeP and rue_c = larue;

		select count(*) into nbE from ETAT where nom_etat = etat;

		select count(*) into nbT from TYPE_MATERIEL where libelle = nomType;

		if nbE < 0 then
			select 'erreur de saisie de l etat ';
		end if;

		if nbT < 0 then
			select 'erreur de saisie du type ';
		end if;

		if nbL < 1 then
			insert into LOCALISATION values (null,ville,codeP,larue);

			select id_etat into ide from ETAT where nom_etat= etat;

			select id_type into idt from TYPE_MATERIEL where libelle = nomType;

			select id_localisation into idl from LOCALISATION where lieux = ville and cp = codeP and rue_c = larue;

			insert into MATERIEL values (null,idl,idt,ide,nomM,prix,imageM,stockM);

		else

		select id_etat into ide from ETAT where nom_etat= etat;

		select id_type into idt from TYPE_MATERIEL where libelle = nomType;

		select id_localisation into idl from LOCALISATION where lieux = ville and cp = codeP and rue_c = larue;

		insert into MATERIEL values (null,idl,idt,ide,nomM,prix,imageM,stockM);

	end if;
		insert into MATERIEL values (null,idl,idt,ide,nomM,prix,img,stock);

	end //
delimiter ;



/* call PInsMat ('manitou','20.90','Beaumont','95260','rue de senlis','/images/manitou.jpg',10,'manutention','bon etat'); */

drop procedure if exists pInsCont ;
delimiter //
create procedure pInsCont ( mailC varchar(128), nomM char(32),  prix decimal(10,2), qtt int(2))
	begin
	 	declare idc, idm int(2);

		select ID_M into idm from MATERIEL where NOM_M = nomM and PRIX_M = prix;
		select ID_C into idc from CLIENT where MAIL = mailC;

		insert into CONTRAT values (null,idm,null,idc,qtt,now(),null);
	end //
delimiter ;
