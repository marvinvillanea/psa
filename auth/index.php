<?php
session_start();
require_once '../config.php';
require_once '../functions.php';
require_once '../session.php';

if($islogin == true){
    navigate("../");
}else{
    if(form("a")){
        $a = value("a");
        $step = (form("step")) ? value("step") : "1";
        $type = (form("type")) ? value("type") : "3";
    }else{
        navigate("../");
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../assets/peso_logo_one.gif" >
    <title>PSA - Philippine Statistics Authority</title>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="style.css">
    <!-- javascript -->
    <script src="./js/login.js" defer></script>
   
</head>
<body>
    <div class="main" id="main_login">
        <div class="header">
            <a href="../" class="header_logo">
                    <img src="/<?= $__name__ ?>/assets/psa_logo.png" alt="logo">
                    <p>Philippine Statistics Authority</p>
            </a>
        </div>
        <div class="body">
            <h1>Stay updated on your professional world</h1>
            <form method="post" class="form login_account">
                <div class="field">
                    <label for="email">Email</label>
                    <input type="email" name="email" placeholder="Email">
                </div>
                <div class="field">
                    <label for="password">Password</label>
                    <input type="password" name="password" placeholder="Password">
                </div>
                <button type="submit" name="register_company">Sign in</button>
            </form>
        </div>
        <?php include '../footer.php'?>
    </div>
</body>
</html>

