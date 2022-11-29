<?php
session_start();

require_once '../vendor/autoload.php';
require_once '../config.php';
require_once '../functions.php';
require_once '../session.php';


if(!$islogin){
    navigate("../");
}


if(!form("page") && value("page") !== ""){
    navigate("./?page=general_information");
}else{
    $page = value("page");
    if($page=="general_information"){
        if(form("step") && value("step") == "1"){

            if(isset($_SESSION["random_id"])){
                $session = $_SESSION["random_id"];
            }else{
                $session = randomid();
                $_SESSION["random_id"] = $session;
            }

            $session = '';
            if(isset($_SESSION["request_id"])){
                $session = $_SESSION["request_id"];
            }
            // echo '<script>alert('.$session.')</script>';
            $check_session=  mysqli_query($con,"SELECT *, now() - created_at AS expired_at FROM `tbl_verificationcode` WHERE `session` = '$session' HAVING expired_at < 300 ");
            if(hasResult($check_session)){
                $already_sent = true;
            }else{

                // $generated_code = rand(100000,999999);
            
                // $sms_message = "LocalMJob \nVerification code: $generated_code";
             
                // clicksend_sms($u_cnum,$sms_message);
                $checkBalance = moviderGetBalance($con,$u_id);
                if($checkBalance){
                    $details = [
                        "to" => $u_cnum,
                    ];
                    $moviderSendVerify = moviderSendVerify($con,$u_id,$details);

                }
                // $sms_log = mysqli_query($con,"
                //     INSERT INTO `tbl_sms_logs`(
                //         `receiverid`,
                //         `message`
                //     )
                //     VALUES(
                //         $u_id,
                //         '$sms_message'
                //     )
                // ");

                // $create_new_session = mysqli_query($con,"
                //     INSERT INTO `tbl_verificationcode`(
                //         `session`,
                //         `code`
                //     )
                //     VALUES(
                //         '$session',
                //         '$generated_code'
                //     )
                // ");

                $already_sent = false;
            }
        }else{
            $already_sent = false;
        }
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
    <title>LocalMJob - PROFILE</title>
    <!-- js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" defer></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
    <script src="./js/index.js" defer></script>
    <script src="./js/update_general.js" defer></script>
    <script src="./js/update_account.js" defer></script>
    <script src="./js/update_password.js" defer></script>
    <script src="./js/send_verification_code.js" defer></script>
    <script src="./js/resume_account.js" defer></script>
    <!-- css -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./style.css">
    <link rel="stylesheet" href="../verify.css">
    <link rel="stylesheet" href="../header.css">
    <link rel="stylesheet" href="../notify_style.css">
</head>
<body>
    <div class="main">
        <?php include '../header.php' ?>
        <div class="body">
            <div class="sidebar">
                <a href="?page=general_information" <?= (value("page") == "general_information") ? 'class="active"' : "" ?>>
                    <i class="fa fa-user"></i>
                    <p class="name">Account Information</p>
                </a>
                <a href="?page=password" <?= (value("page") == "password") ? 'class="active"' : "" ?>>
                    <i class="fa fa-key"></i>
                    <p class="name">Password</p>
                </a>
                <a href="?page=resume" <?= (value("page") == "resume") ? 'class="active"' : "" ?>>
                    <i class="fa fa-file-text-o"></i>
                    <p class="name">Resume</p>
                </a>
            </div>
            <div class="showcase">
                <div class="content box_<?= $page ?>">
                    <?php if($page == "general_information"){?>
                        <?php if(form("sub") && value("sub") !== "" && value("sub") == "verified"){?>
                            <?php if(form("step") && value("step") == "1" && $u_verification_state == 0){?>
                                <div class="container">
                                    <div class="container_title">
                                        Step 1, Verify your email/mobile number.
                                    </div>
                                    <div class="container_body">
                                        <?php if($already_sent){?>
                                                <p>We already sent a verification code to your email (<?= $u_email ?>) and mobile number (<?= $u_cnum ?>).</p>
                                        <?php }else{ ?>
                                                <p>We sent a verification code to your email (<?= $u_email ?>) and mobile number (<?= $u_cnum ?>).</p>
                                        <?php }?>
                                        <br>
                                        <form method="post" class="frm_<?= $page ?>_verify" autocomplete="off">
                                            <div class="field">
                                                <label for="tb_code">Verfication code </label>
                                                <input type="number" name="tb_code" id="tb_code" placeholder="Combination of 6 Digits">
                                            </div>
                                            <button class="button btn_submit">
                                                CONTINUE
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            <?php }elseif(form("step") && value("step") == "2"){?>

                            <?php }else{?>
                                <?php if($u_verification_state == 0){?>
                                    <div class="container">
                                        <div class="container_title">
                                            Step 1, Verify your email/mobile number.
                                        </div>
                                        <div class="container_body">
                                            <a href="?page=general_information&sub=verified&step=1">Send to my email (<?= $u_email ?>) and mobile number (<?= $u_cnum ?>) the verification code.</a>
                                        </div>
                                    </div>
                                <?php }elseif($u_verification_state == 1){?>
                                    <div class="container">
                                        <div class="container_title">
                                            Step 2, Upload your resume.
                                        </div>
                                        <div class="container_body">
                                            <a href="?page=resume">Upload your resume, We use your resume to confirm your account. CONTINUE</a>
                                        </div>
                                    </div>
                                <?php }elseif($u_verification_state == 2){?>
                                    <div class="container">
                                        <div class="container_title">
                                            Step 3, Finish
                                        </div>
                                        <div class="container_body">
                                            <p>You are now fully verified</p>
                                        </div>
                                    </div>
                                <?php }else{ navigate("?page=general_information"); }?>
                            <?php }?>
                        <?php }else{?>
                        <div class="container"> 
                            <div class="container_title">
                                Avatar
                            </div>
                            <div class="container_body">
                                <div class="image_center_body">
                                    <img src="../assets/images/<?= $u_avatar ?>" class="company_logo_preview profile_picture">
                                </div>
                                <input type="file" name="input_upload_field" id="input_upload_field" class="input_upload_field" data-set="avatar" accept="image/*">
                                <br>
                                <label for="input_upload_field" class="btn_upload_picture" >CHANGE AVATAR</label>
                            </div>
                        </div>
                        <div class="container"> 
                            <div class="container_title">
                                Personal information
                            </div>
                            <div class="container_body">
                                <form method="post" class="frm_<?= $page ?>">
                                    <div class="field">
                                        <label for="tb_firstnmae">First name</label>
                                        <input type="text" name="tb_firstname" id="tb_firstname" placeholder="First name" value="<?= $u_fname ?>">
                                    </div>
                                    <div class="field">
                                        <label for="tb_lastname">Last name</label>
                                        <input type="text" name="tb_lastname" id="tb_lastname" placeholder="Last name" value="<?= $u_lname ?>">
                                    </div>
                                    <div class="field">
                                        <label for="tb_age">Age</label>
                                        <input type="number" name="tb_age" id="tb_age" placeholder="Age" value="<?= $u_age ?>">
                                    </div>
                                    <div class="field">
                                        <label for="tb_bday">Birthday</label>
                                        <input type="date" name="tb_bday"  id="tb_bday" value="<?= $u_bday ?>">
                                    </div>
                                    <div class="field">
                                        <label for="tb_address">Address</label>
                                        <textarea name="tb_address" class="tb_address" id="tb_address" placeholder="Address"><?= $u_address ?></textarea>
                                    </div>
                                    <button class="button btn_submit">
                                        SAVE
                                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="container">
                            <div class="container_title">
                                Account settings
                            </div>
                            <div class="container_body">
                                <?php if($u_verification_state == 0 || $u_verification_state < 2) {?>
                                <div class="msg">
                                    <p>
                                        Your account is not fully verified.
                                    </p>
                                    <a href="?page=general_information&sub=verified">
                                        GET VERIFIED NOW
                                    </a>
                                </div>
                                <?php } ?>
                                <form method="post" class="frm_<?= $page ?>_account">
                                    <div class="field">
                                        <label for="tb_email">Email</label>
                                        <input type="email" name="tb_email" id="tb_email" placeholder="Email" value="<?= $u_email ?>">
                                    </div>
                                    <div class="field">
                                        <label for="tb_cnum">Contact number</label>
                                        <input type="number" name="tb_cnum" id="tb_cnum" placeholder="Contact number" value="<?= $u_cnum ?>">
                                    </div>
                                    <button class="button btn_submit">
                                        SAVE
                                    </button>
                                </form>
                            </div>
                        </div>
                        <?php }?>           
                    <?php }elseif($page == "password"){?>
                        <div class="container">
                            <div class="container_title">
                                Password
                            </div>
                            <div class="container_body">
                                <form method="post" class="frm_<?= $page ?>_account">
                                    <div class="field">
                                        <label for="tb_pw">Old password</label>
                                        <input type="password" name="tb_pw" id="tb_pw" placeholder="Old password">
                                    </div>
                                    <div class="field">
                                        <label for="tb_newpw">New password</label>
                                        <input type="password" name="tb_newpw" id="tb_newpw" placeholder="New password">
                                    </div>
                                    <div class="field">
                                        <label for="tb_cnewpw">Confirm new password</label>
                                        <input type="password" name="tb_cnewpw" id="tb_cnewpw" placeholder="Confirm new password">
                                    </div>
                                    <button class="button btn_submit">
                                        SAVE
                                    </button>
                                </form>
                            </div>
                        </div>
                    <?php }elseif($page == "resume"){?>
                        <div class="container">
                            <div class="container_title">
                                Resume
                            </div>
                            <div class="container_body">
                                <?php if($have_resume) {?>
                                    <form method="post" class="frm_<?= $page ?>_account">
                                        <div class="field">
                                            <label for="">Resume</label>
                                            <input type="file" id="fileToUpload" class="fileToUpload">
                                            <label for="fileToUpload" class="btn_upload_picture">
                                                <i class="fa fa-file-pdf-o"></i>
                                                UPLOAD RESUME
                                            </label>
                                        </div>
                                        <div class="button_container">
                                            <button class="button btn_submit">
                                                SAVE CHANGES
                                            </button>
                                            <a href="../resume/<?= $r_path ?>" class="button btn_submit" download>
                                                DOWNLOAD RESUME
                                            </a>
                                        </div>
                                    </form>
                                <?php }else{ ?>
                                    <?php if($u_verification_state == 0 || $u_verification_state < 2) {?>
                                        <div class="msg">
                                            <p>
                                                Uploading your resume will be used to verify/confirm your account.
                                            </p>
                                        </div>
                                    <?php } ?>
                                    <form method="post" class="frm_<?= $page ?>_account">
                                        <div class="field">
                                            <label for="">Resume</label>
                                            <input type="file" id="fileToUpload" class="fileToUpload">
                                            <label for="fileToUpload" class="btn_upload_picture">
                                                <i class="fa fa-file-pdf-o"></i>
                                                UPLOAD RESUME
                                            </label>
                                        </div>
                                        <button class="button btn_submit">
                                            SAVE
                                        </button>
                                    </form>
                                <?php } ?>
                            </div>
                        </div>
                    <?php }else{ navigate("./?page=general_information"); }?>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<script type="text/javascript">
function showNotification(){
    $('.notification-drop .item').find('ul').toggle();
}

function updateNotification(id){
    $.ajax({
        url : "../controller/NotificationAction.php",
        method: "post",
        data : {id:id},
        success: (res) => {
            console.log(res);
            if(res == "SUCCESS"){
                 setTimeout(() => {
                    window.location.href="../profile/?page=general_information"
                }, 300);
            } else {
                location.reload();
            }
        }
    });
}
</script>
