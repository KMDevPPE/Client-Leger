Drop trigger if extists VerifEmbauche;
Delimiter //
Create trigger VerifEmbauche
	Before INSERT ON PILOTE
	FOR EACH Row	
	Begin
		if new.EMBAUCHE > curdate()
		Then
			SIGNAL SQLState '42000'
			Set Message_text = 'La date d''embauche ne peut être inférieure à la date d''aujourd''hui';
		END if;
	END //
	Delimiter ;