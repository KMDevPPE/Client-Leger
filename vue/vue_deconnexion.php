<br>
<form>
	<input type="submit" name="deco" value="deco" id="btnDisconnect">
</form>
<div id="resultat_deconnexion"></div>
<br>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<script>
    function redirect() {
        document.location.href="index.php"
    }
    $(document).ready(function(){
        $("#btnDisconnect").click(function(e){
            console.log('deconnexion cliqué');
            e.preventDefault();
            $.post(
                'controleur/deconnexion.php',
                {
                    deco : 'deco'
                },

                function(data){
                	console.log('Resultat : ' + data);
                	switch (data) {
                		case 'OK':
                			document.location.href='index.php';
                			break;
                		case 'KO':
                			$("#resultat_deconnexion").html("Erreur lors de la deconnexion");
                			break;
                	}
                },
                'text'
            );
        });
    });
</script>
