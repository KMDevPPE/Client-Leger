
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
			insert into localisation values (null,ville,codeP,larue);

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


-- call PInsMat ('manitou','20.90','Beaumont','95260','rue de senlis','/images/manitou.jpg',10,'manutention','bon etat');
-- call PInsMat ('grue','29.99','Chambly','60000','rue des champs','/images/grue.jpg',10,'manutention','bon etat');

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

-- call pInsCont ('e@e.e','truc',10.2,'2018-06-09',5);
-- insert into contrat values (null,1,null,0,20,curdate(),curdate());
