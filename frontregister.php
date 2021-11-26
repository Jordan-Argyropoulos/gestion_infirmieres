<!doctype html>
<html>
	<head>
		<title><?= $titre ?></title>
		<link rel="stylesheet" href="css/styles.css" />
      <script src="./js/common.js" type="text/javascript"></script>
      <script src="./js/script_register.js" type="text/javascript"></script>
	</head>
	<body>
<!-- faudra certainement adapter avec la table adresse -->
<form class="box" action="./php/register.php" method="post" >
	<h1 class="box-logo box-title"><a>Inscription</a></h1>
   <input type="text" class="box-input" name="numero_inami" placeholder="Numéro Inami" required />
	<input type="text" class="box-input" name="nom" placeholder="Nom" required  />
   <input type="text" class="box-input" name="prenom" placeholder="Prénom" required  />
   <input type="text" class="box-input" name="adresse_mail" placeholder="Adresse mail" required id="email" />
   <input type="password" class="box-input" name="password" placeholder="Mot de passe" required id="password"/>
   <input type="password" class="box-input" name="password_confirm" placeholder="Confirmation du mot de passe" required  />
   <input type="text" class="box-input" name="numero_telephone" placeholder="Numéro de téléphone" required />
   <input type="submit" name="valider" class="box-button" onclick="validate()" />
   <p class="box-register">Déjà inscrit? <a href="index.php">Connectez-vous ici</a></p>
</form>
		
	</body>
</html>
