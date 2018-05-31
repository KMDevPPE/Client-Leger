drop procedure if exists PInsMat;
delimiter //
create procedure PInsMat (nomM char(32), prix float(10,2), ville varchar(128), codeP char(5), larue varchar (128), dateD date, dateF date, nomType char(32), etat char(32))

	begin
		declare nbL, nbE, nbT, idl, ide, idt int;

		select count(*) into nbL from localisation where lieux = ville and cp = codeP and rue_c = larue;

		select count(*) into nbE from etat where nom_etat = etat;

		select count(*) into nbT from type_materiel where libelle = nomType;

		if nbE > 0 then
			select 'erreur de saisie de l\'etat ';
		end if;

		if nbT > 0 then
			select 'erreur de saisie du type ';
		end if;

		if nbL < 1 then
			insert into localisation values (null,ville,codeP,larue);

			select id_etat into ide from etat where nom_etat= etat;

			select id_type into idt from type_materiel where libelle = nomType;

			select id_localisation into idl from localisation where lieux = ville and cp = codeP and rue_c = larue;

			insert into materiel values (null,idl,idt,ide,nomM,prix,dateD,dateF);

		end if;


		select id_etat into ide from etat where nom_etat= etat;

		select id_type into idt from type_materiel where libelle = nomType;

		select id_localisation into idl from localisation where lieux = ville and cp = codeP and rue_c = larue;

		insert into materiel values (null,idl,idt,ide,nomM,prix,dateD,dateF);

	end //
delimiter ;


-- call PInsMat ('truc','10.2','paris','75000','rue de paris','2018-04-01',curdate(),'nettoyage','neuf');
