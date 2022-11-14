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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" defer></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <!-- javascript -->
    <script src="./js/register_company.js" defer></script>
    <script src="./js/register.js" defer></script>
    <script src="./js/login.js" defer></script>
</head>
<body>
    <?php if($a=="join"){?>
        <div class="main" id="main_step_<?= $step ?>">
        <div class="header">
            <a href="../" class="header_logo">
                <img src="../assets/logo.png" alt="logo">
                <p>LocalMJob</p>
            </a>
        </div>
        <?php if($step == "1"){?>
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
                <p class="already">Already on LocalMJob? <a href="./?a=already">Sign in</a></p>
            </div>
        <?php }elseif($step=="2"){?>
            <div class="body">
                <h1>Make the most of your professional life</h1>
                <?php if($type == "2"){?>
                    <form action="" class="form register_company">
                        <input type="hidden" name="account_type" value="<?= $type ?>">
                        <div class="divider">
                            <p>
                                General information
                            </p>
                            <span></span>
                        </div>
                        <div class="field">
                            <label for="fname">First name</label>
                            <input type="text" name="fname" placeholder="First name">
                        </div>
                        <div class="field">
                            <label for="lname">Last name</label>
                            <input type="text" name="lname" placeholder="Last name">
                        </div>
                        <div class="field">
                            <label for="cnum">Contact no.</label>
                            <input type="number" name="cnum" placeholder="Contact number" maxlength="11">
                        </div>
                        <div class="field">
                            <label for="bday">Birthday</label>
                            <input type="date" name="bday" placeholder="Birthday">
                        </div>
                        <div class="field">
                            <label for="age">Age</label>
                            <input type="number" name="age" placeholder="Age" maxlength="2">
                        </div>
                        <div class="field">
                            <label for="address">Address</label>
                            <input type="text" name="address" placeholder="Address">
                        </div>
                        <div class="divider">
                            <p>
                                Company
                            </p>
                            <span></span>
                        </div>
                        <div class="field">
                            <label for="company_name">Company name</label>
                            <input type="text" name="company_name" placeholder="Company name">
                        </div>
                        <div class="field">
                            <label for="company_address">Company address</label>
                            <input type="text" name="company_address" placeholder="Company address">
                        </div>
                        <div class="field">
                            <label for="company_cnum">Company contact no.</label>
                            <input type="text" name="company_cnum" placeholder="Company contact no." maxlength="11">
                        </div>
                        <div class="field">
                            <label for="company_position">Company position</label>
                            <input type="text" name="company_position" placeholder="Company position">
                        </div>
                        <div class="field">
                            <label for="deparment">Deparment</label>
                            <input type="text" name="deparment" placeholder="Department">
                        </div>
                        <div class="divider">
                            <p>
                                Account
                            </p>
                            <span></span>
                        </div>
                        <div class="field">
                            <label for="email">Email</label>
                            <input type="email" name="email" placeholder="Email">
                        </div>
                        <div class="field">
                            <label for="password">Password</label>
                            <input type="password" name="password" placeholder="Password">
                        </div>
                        <p class="terms">By clicking Agree & Join, you agree to the <span class="company_name">LocalMJob</span> <a href="">User Agreement</a> and <a href="">Privacy Policy</a>.</p>
                        <button type="submit">Agree & Join</button>
                        <p class="already">Already on LocalMJob? <a href="./?a=already">Sign in</a></p>
                    </form>
                <?php }elseif($type == "3"){?>
                    <?php
                        $select_departments = mysqli_query($con,"SELECT `department` FROM `tbl_company` GROUP BY `department`");    
                    ?>
                    <form method="post" class="form register_account">
                        <input type="hidden" name="account_type" value="<?= $type ?>">
                        <div class="divider">
                            <p>
                                General information
                            </p>
                            <span></span>
                        </div>
                        <div class="field">
                            <label for="fname">First name</label>
                            <input type="text" name="fname" placeholder="First name" class="tb">
                        </div>
                        <div class="field">
                            <label for="lname">Last name</label>
                            <input type="text" name="lname" placeholder="Last name" class="tb">
                        </div>
                        <div class="field">
                            <label for="cnum">Contact no.</label>
                            <input type="number" name="cnum" placeholder="Contact number" class="tb">
                        </div>
                        <div class="field">
                            <label for="bday">Birthday</label>
                            <input type="date" name="bday" placeholder="Birthday" class="tb">
                        </div>
                        <div class="field">
                            <label for="age">Age</label>
                            <input type="number" name="age" placeholder="Age" class="tb">
                        </div>
                        <div class="field">
                            <label for="address">Address</label>
                            <input type="text" name="address" placeholder="Address" class="tb">
                        </div>
                        <div class="field">
                            <label for="department">Department</label>
                            <select name="department" id="department" class="tb">
                                <option value="" disabled selected> -- department -- </option>
                                <?php while($row = mysqli_fetch_assoc($select_departments)){ ?>
                                    <option value="<?= $row["department"] ?>"><?= $row["department"] ?></option>
                                <?php }?>
                            </select>
                        </div>
                        <div class="divider">
                            <p>
                                Account
                            </p>
                            <span></span>
                        </div>
                        <div class="field">
                            <label for="email">Email</label>
                            <input type="email" name="email" placeholder="Email" class="tb">
                        </div>
                        <div class="field">
                            <label for="password">Password</label>
                            <input type="password" name="password" placeholder="Password" class="tb">
                        </div>
                        <p class="terms">By clicking Agree & Join, you agree to the <span class="company_name">LocalMJob</span> <a href="">User Agreement</a> and <a href="">Privacy Policy</a>.</p>
                        <button type="submit" name="register_company">Agree & Join</button>
                        <p class="already">Already on LocalMJob? <a href="./?a=already">Sign in</a></p>
                    </form>
                <?php }?>
            </div>
        <?php  } ?>
        <?php include '../footer.php'?>
        </div>
    <?php }else{?>
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