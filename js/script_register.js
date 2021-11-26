
    function checkEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
}


    function checkPassword() {
        var mdp = document.getElementById("password").value; // tu récupères la valeur du mdp
        var longueur = mdp.lenght; // tu récupères la longueur
        // si la longueur n'est pas bonne tu affiches le message
        if(longueur <= 4 || longueur > 255) {
            return false;
    }
}

    function validate() {
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;

        if (checkEmail(email) && (checkPassword(password))) {
            alert('Adresse e-mail et mot de passe valide');
        } else if (checkEmail(email) == false) {
            alert('Adresse e-mail non valide, celle-ci doit contenir au moins une lettre, puis des lettres ou le caractère ".", puis au moins une lettre, puis le caractère @, puis au moins une lettre, puis un ".", puis au moins une lettre');
        }else{
            alert('mot de passe non valide, celui-ci doit contenir au moins 4 caracteres')
        }
        
        return false;
    }
