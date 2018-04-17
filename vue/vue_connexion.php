<h3>Se connecter</h3>
<form method="post">
Mail : <input type="text" name="mail" id="mail">
Mot de passe : <input type="password" name="mdp" id="password"><br>
<input type="submit" name="seCo" id="btn_connexion" value="Se connecter">
</form>
<div id="result_connexion"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<script>
    function redirect() {
        document.location.href="index.php";
    }

    $(document).ready(function(){
        $("#btn_connexion").click(function(e){
            console.log('Salut les amis');
            e.preventDefault();
            $.post(
                'controleur/connexion.php',
                {
                    mail : $("#mail").val(),
                    mdp : $("#password").val()
                },

                function(data){

                	console.log(data);
                	if (data === 'OK') {
                		document.location.href="index.php";
                	} else {
						$("#result_connexion").html(data);
                	}
                },
                'text'
            );
        });
    });
</script>