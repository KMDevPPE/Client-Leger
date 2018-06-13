<h2> Historique des locations</h2>
<br/>
<table border = "1">
	<tr>
		<td>Nom du client</td>
		<td>Nom du matériel</td>
		<td>ID du matériel</td>
		<td>ID du Contrat</td>
		<td></td>
	</tr>
	<?php
		foreach ($resultats as $unResultat) {
			echo "
				<tr> 
						<td> ".$unResultat['NOM_C']."</td>
						<td> ".$unResultat['NOM_M']."</td>	
						<td> ".$unResultat['ID_C']."</td>
						<td> ".$unResultat['ID_CONT']."</td>
				</tr>
				";

		}
	?>
</table>