<?php
   session_start();
   // Informations d'identification
   $source = 'mysql:host=localhost;dbname=gestion_infirmieres';
   $user = 'root';
   $mdp = '';
   try{
      $pdo = new PDO($source, $user, $mdp);
      //var_dump($pdo);
   }
   catch (PDOException $error ) {
      $message = '<p>Erreur à la connexion : ' . $erreur->getMessage(). '</p>';
      echo $message; die();
   }

   $error="";
   $register="null";

   // faudra certaienement ajouter le champs adresse
   if(isset($_POST["numero_inami"]) && ($_POST["nom"]) && ($_POST["prenom"]) && ($_POST["adresse_mail"]) 
   && ($_POST["password"]) && ($_POST["password_confirm"]) && ($_POST["numero_telephone"])){
      $numero_inami=$_POST["numero_inami"];
      $nom=$_POST["nom"];
      $prenom=$_POST["prenom"];
      $adresse_mail=$_POST["adresse_mail"];
      $pass=$_POST["password"];
      $repass=$_POST["password_confirm"];
      $numero_telephone=$_POST["numero_telephone"];
      $rue=$_POST["rue"];
      $ville=$_POST["ville"];
      $code_postal=$_POST["code_postal"];
   }
   

   if(!empty($adresse_mail) && ($pass)){
      $sel=$pdo->prepare("SELECT COUNT(*) from infirmieres where adrese_mail=? AND numero_inami=? ");
      $sel->execute(array($adresse_mail, $numero_inami));
      $tab=$sel->fetchAll();
      
      if(count($tab)>0){
         echo "adresse mail ou numero inami déjà existant !";
         //header("location:../frontregister.php");
      }
      if($pass != $repass){

         echo "mot de passe différent de la confirmation du mot de passe";
      }
      // faudra certaienement ajouter le champs adresse
      else{
         $ins=$pdo->prepare("INSERT into adresse(rue,ville,code_postal) values(?,?,?)");
         if($ins->execute(array($rue,$ville,$code_postal)))
            header("location:./../index.php");

         $ins=$pdo->prepare("INSERT into infirmieres(numero_inami,nom,prenom,adresse_mail,password,password_confirm,numero_telephone) values(?,?,?,?,?,?,?)");
         if($ins->execute(array($numero_inami,$nom,$prenom,$adresse_mail,$pass,$repass,$numero_telephone)))
            header("location:./../index.php");
      }   
   }

   echo "<login><result>$register</result><error>$error</error></login>";
?>