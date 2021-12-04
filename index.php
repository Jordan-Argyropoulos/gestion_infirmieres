<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Registration</title>
  <link rel="stylesheet" href="css/styles.css" />
  <link href="./php/calendar/calendar.css" type="text/css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="./js/common.js" type="text/javascript"></script>
  <script src="./js/script.js" type="text/javascript"></script>
</head>
<body>
    <?php
    include './php/calendar/calendar.php';

    $calendar = new Calendar();

    echo $calendar->show();
    ?>
  <div>
    <div id="scr_login">

      <table class="box">
        <h1 class="box-title"><a>Connexion</a></h1>
        <tr><td>Mail</td><td><input type="text" class="box-input" id="inp_login" required></td></tr>
        <tr><td>Password</td><td><input type="password" class="box-input" id="inp_passwd" required></td></tr>
        <tr><td></td><td><button type="button" class="box-button" id="inp_enter">Connexion</button></td></tr>
        <tr><td></td><td><p class="box-register">Vous êtes nouveau ici? <a href="frontregister.php">S'inscrire</a></p></td></tr>
      </table>
      <div id="div_error"></div>

    </div>
    <div id="scr_accueil">
    <?php session_start();
    require ('php/navbar.php');?>

    <h1><?php echo "<p> Bienvenue  $_SESSION[adresse_mail].</p>"; ?></h1>
      <ul class="exo-menu">
          <!-- a adapter <li><a class="active" href="./vue/info_stage"><i class="fa fa-toggle-right"></i> Informations sur les stages choisis</a></li>
                <li><a class="active" href="./vue/liste_etudiants.php"><i class="fa fa-toggle-right"></i> Liste des étudiants</a></li>
                <li><a class="active" href="./vue/liste_entreprise.php"><i class="fa fa-toggle-right"></i> Liste des adresses des entreprises</a></li>
                <li><a class="active" href="lieu_stage.html"><i class="fa fa-toggle-right"></i> Encoder l'adresse d'une entreprise</a></li>	
                <li><a class="active" href="" id="inp_logout"><i class="fa fa-toggle-right"></i> Se déconnecter</a></li> -->
      </ul>


    </div>
  </div>
</body>
</html>