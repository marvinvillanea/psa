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
    <link rel="icon" href="../assets/logo.png" >
    <title>LocalMJob</title>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" defer></script> -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
    <!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="style.css">
    <!-- javascript -->
    <script src="./js/register_company.js" defer></script>
    <script src="./js/register.js" defer></script>
    <script src="./js/login.js" defer></script>
    
     <style type="text/css">
   .stepwizard-step p {
     margin-top: 10px;
   }
   .stepwizard-row {
     display: table-row;
   }
   .stepwizard {
     display: table;
     width: 100%;
     position: relative;
   }
   .stepwizard-step button[disabled] {
     opacity: 1 !important;
     filter: alpha(opacity=100) !important;
   }
   .stepwizard-row:before {
     top: 14px;
     bottom: 0;
     position: absolute;
     content: " ";
     width: 100%;
     height: 1px;
     background-color: #ccc;
     z-order: 0;
   }
   .stepwizard-step {
     display: table-cell;
     text-align: center;
     position: relative;
   }
   .btn-circle {
     width: 30px;
     height: 30px;
     text-align: center;
     padding: 6px 0;
     font-size: 12px;
     line-height: 1.428571429;
     border-radius: 15px;
   }
   .modal-body {
     max-height: calc(100vh - 210px);
     overflow-y: auto;
   }
   .modal-dialog {
     min-width: 70%;
   }
   </style>
</head>
<body>
    <?php if($a=="join"){?>
        <div class="main" id="main_step_1">
        <div class="header">
            <a href="../" class="header_logo">
                <img src="../assets/logo.png" alt="logo">
                <p>LocalMJob</p>
            </a>
        </div>
        <div class="body">
            <h1>ARE YOU LOOKING FOR A?</h1>
            <div class="showcase">
                <div class="type showcase_job">
                    <a href="./?a=join&step=2&type=2">
                        <img src="../assets/team.png" alt="team">
                        <p>COMPANY</p>
                    </a>
                </div>
                <h3 class="divider">
                    OR
                </h3>
                <div class="type showcase_company">
                    <a href="./?a=join&step=2&type=3">
                        <img src="../assets/company.png" alt="company">
                        <p>JOB</p>
                    </a>
                </div>  
            </div>
            <p >Already on LocalMJob? <a href="./?a=already">Sign in</a></p>
        </div>
        </div>
    <?php

        // show modal each register
        if(form("type") &&  value("type") == 2 ){ 
            include './register_company.php';

        }else if(form("type") &&  value("type") == 3 ){ 
             include './register_client.php';
        } else {
            echo "aw";
        }

        include '../footer.php';
     }else{?>
        <div class="main" id="main_login">
            <div class="header">
                <a href="../" class="header_logo">
                    <img src="../assets/logo.png" alt="logo">
                    <p>LocalMJob</p>
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
                    <p class="already">New to LocalMJob? <a href="./?a=join">Join Now</a></p>
                </form>
            </div>
            <?php include '../footer.php'?>
        </div>
    <?php } ?>
</body>
</html>


<script type="text/javascript">
// $('#modalUser').show()
    $('#modalUser').modal('show');
$(document).ready(function() {

  var navListItems = $('div.setup-panel div a'),
    allWells = $('.setup-content'),
    allNextBtn = $('.nextBtn'),
    allPrevBtn = $('.prevBtn');

  allWells.hide();

  navListItems.click(function(e) {
    e.preventDefault();
    var $target = $($(this).attr('href')),
      $item = $(this);

   if (!$item.hasClass('disabled')) {
      navListItems.removeClass('btn-primary').addClass('btn-default');
      $item.addClass('btn-primary');
      allWells.hide();
      $target.show();
      $target.find('input:eq(0)').focus();
    }
  });

  allPrevBtn.click(function() {
    var curStep = $(this).closest(".setup-content"),
      curStepBtn = curStep.attr("id"),
      prevStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().prev().children("a");

    prevStepWizard.trigger('click');
  });

  allNextBtn.click(function() {
    var curStep = $(this).closest(".setup-content"),
      curStepBtn = curStep.attr("id"),
      nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
      curInputs = curStep.find("input[type='text'],input[type='url']"),
      isValid = true;

    $(".form-group").removeClass("has-error");
    for (var i = 0; i < curInputs.length; i++) {
      if (!curInputs[i].validity.valid) {
        isValid = false;
        $(curInputs[i]).closest(".form-group").addClass("has-error");
      }
    }

    if (isValid)
      nextStepWizard.removeAttr('disabled').trigger('click');
  });

  $('div.setup-panel div a.btn-primary').trigger('click');
});

</script>