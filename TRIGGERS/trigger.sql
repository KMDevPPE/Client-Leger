drop trigger if exists InsPro;
delimiter // 
create trigger InsPro
	before insert on Entreprise
	for each row
	begin 
	declare nbA,nbS int;
	select count(*) into nbA from Entreprise where id_C=new.id_C;

	if nbA = 0 
		then 
		insert into client (id_C,adresse,mail,mdp)
		values (new.id_C,new.adresse,new.mail,new.mdp);
	end if;

	select count(*) into nbS from Particulier where id_C=new.id_C;

	if nbS >0
		then 
			signal sqlstate '42000'
			set Message_text='il est deja salarie';
	end if;
end //
delimiter ;