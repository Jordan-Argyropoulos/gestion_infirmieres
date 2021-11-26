/******************************/
/* Initialize the application */
/******************************/

function init() {
    disp("scr_login");

    /* Register events */
    $("inp_enter").onclick=login_click;
    $("inp_logout").onclick=logout_click;

}

/*********/
/* Login */
/*********/
function login_click() {
    var login=$("inp_login").value;
    var pass=$("inp_passwd").value;
    var param = "email_etudiant="+encodeURIComponent(login);
    param=param+"&password="+encodeURIComponent(pass);

    var xhr=getXHR();
    xhr.onreadystatechange= function() {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                login_cb(xhr.responseXML);
                console.log(xhr.responseXML);
            }
        }
    };

    xhr.open("POST","php/login.php",true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    xhr.send(param);
}

function login_cb(res) {
    var r;
    var error = $("div_error");
    r=getvalfromxml(res,"result");
    e=getvalfromxml(res,"error");

    /* Login OK */
    if (r == "ok") {
        disp("scr_accueil");
        error.innerHTML = "";
    } else {
        /* Login failed */
        error.innerHTML = e;
    }

    
}

/**********/
/* Logout */
/**********/
function logout_click() {
    var xhr=getXHR();
    var error = $("div_error");
    xhr.open("GET","php/logout.php",true);
    xhr.send(null);
    disp("scr_login");
    $("inp_login").value="";
    error.innerHTML = "";
}

/********************/
/* Helper functions */
/********************/

/* Show one screen, hide the others */
function disp(scr) {
    var allscr=[ "scr_login","scr_accueil"];
    var i;

    for(i=0;i<allscr.length;i++)  {
        if (allscr[i] == scr) {
            show(allscr[i]);
        } else {
            hide(allscr[i]);
        }
    }
}
window.onload=init;