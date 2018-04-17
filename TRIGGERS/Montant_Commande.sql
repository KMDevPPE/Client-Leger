Alter table Contrat
ADD Montant float(8,2);

Alter table Louer
ADD qtteCOM int(5);

Alter table Materiel
ADD Stock_M int(5);

Alter table Materiel
ADD Prix_M float(8,2); /* Prix de la location pour une journée adapté en fonction du nombre jours et introduire des reducs*/




Drop trigger if exists AjoutMontant;
Delimiter //
Create trigger AjoutMontant
After Insert ON LOUER
For each row
Begin
	Declare P int ;
	Declare M float ;
	select Prix_M into P from Materiel where ID_M = new.ID_M ;
	select Montant into M from Contrat where ID_CONT = new.ID_CONT ;
	UPDATE Contrat set Montant = M + ( P * new.qtteCOM)
	WHERE ID_CONT = new.ID_CONT ;
END //
Delimiter ;


Drop trigger if exists MAJMontant;
Delimiter //
Create trigger MAJMontant
After UPDATE ON LOUER
For each row
Begin
	Declare P int ;
	Declare M float ;
	select Prix_M into P from Materiel where ID_M = new.ID_M ;
	select Montant into M from Contrat where ID_CONT = new.ID_CONT ;
	UPDATE Contrat set Montant = M + ( P * new.qtteCOM)
	WHERE ID_CONT = new.ID_CONT ;
END //
Delimiter ;



Drop trigger if exists SuppligCOM;
Delimiter //
Create trigger SuppligCOM
After Delete ON Louer
For each row
Begin
	Declare P int ;
	Declare M float ;
	select Prix_M into P from Materiel where ID_M = old.ID_M ;
	select Montant into M from Contrat where ID_CONT = old.ID_CONT ;
	UPDATE commande set montant = M - ( P * old.qtteCOM)
	WHERE ID_CONT = old.ID_CONT ;
END //
Delimiter ;
