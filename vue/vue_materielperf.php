<h2> Materiel de perforation</h2>
<br/>
<table border = "1">
	<tr> 
		<td>Nom</td>
		<td>Image</td>
		<td>Prix</td> 
		<td>Ajouter au panier</td>
	</tr>
	<?php
		foreach ($resultats as $unResultat) {
			echo "
				<tr> 	<td> ".$unResultat['NOM_M']."</td>	
						<td> <img class='imgProd' src=".$unResultat['IMAGE_M']."></td>
						<td> ".$unResultat['PRIX']."</td>
						<td> <a href=\"panier.php?action=ajout&idm=".$unResultat['ID_M']."&libelle=".$unResultat['NOM_M']."&qte=1&prix=".$unResultat['PRIX']."\"' onclick=\"window.open(this.href, '', 
							'toolbar=no, location=no, directories=no, status=yes, scrollbars=yes, resizable=yes, copyhistory=no, width=600, height=350'); return false;\"><i class=\"fa fa-cart-plus\" aria-hidden=\"true\"></i></a> </td>
				</tr>
				";

		}
	?>
</table>

<!-- 
image du boutton ajouter au panier <i class=\"fa fa-cart-plus\" aria-hidden=\"true\"></i>
-->