<?php
session_start();
require_once '../config.php';
require_once '../functions.php';
require_once '../session.php';

$report = false;
$apply = false;

if(form("id")){
    // if(!$islogin){
    //     navigate("../auth/?a=already");
    // }

    $id = mysqli_value($con,"id");

    $result_query = mysqli_query($con,"
    SELECT
        tbl_jobs.id,
        tbl_jobs.j_number_of_vacancy,
        tbl_jobs.j_name,
        tbl_jobs.j_description,
        tbl_jobs.j_created_at,
        (tbl_jobs.j_number_of_vacancy - (select count(*) from applicants where job_id = tbl_jobs.id and status = '1')) as total_vacancy
    FROM
        tbl_jobs
    WHERE
    tbl_jobs.id = $id
    ");

    if(hasResult($result_query)){
        $data = mysqli_fetch_assoc($result_query);
    }else{
        navigate("./");
    }

    if(form("apply")){
        //check if the user is fully verified.
        // $apply = true;
        // if($u_verification_state == 2){
        //     $fully_verified = true;

        //     $job_id = $data["id"];
        //     $company_id = $data["c_id"];
            
        //     $check_application = mysqli_query($con,"SELECT * FROM `tbl_applicants` WHERE `companyid` = $company_id AND `applicantsid` = $u_id AND `jobid` = $job_id ");
        //     if(hasResult($check_application)){
        //         $already_submited = true;
        //     }else{
        //         $submit_application = mysqli_query($con,"
        //         INSERT INTO `tbl_applicants`(
        //             `companyid`,
        //             `applicantsid`,
        //             `jobid`
        //         )
        //         VALUES(
        //             $company_id,
        //             $u_id,
        //             $job_id
        //         )
        //         ");
        //         $sms_message = ucwords($data["lastname"].', '.$data["firstname"]). ", Applying for  ".ucwords($data["j_name"]);
        //         createNotify($con, $data["userid"], $sms_message, 0);
        //         $already_submited = false;
        //     }
        // }else{
        //     $fully_verified = false;
        // }
    }else{
        $apply = false;
    }
}elseif(form("report") && is_numeric(value("report"))){
    $report = true;
    $reported_company_id = value("report");
}else{
    navigate("./");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="icon" href="../assets/logo.png" > -->
    <link rel="icon" href="../assets/psa_logo.png" >
    <title>PSA - Jobs</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" defer></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" href="./view.css">
    <link rel="stylesheet" href="../verify.css">
    <link rel="stylesheet" href="../header.css">
    <link rel="stylesheet" href="../notify_style.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- javascript -->
</head>
<body>
    <div class="main">
        <?php include '../header.php' ?>
        <div class="body">
              <div class="box job_information">
                <div class="box_header">
                    <div class="box_header_title">
                        <?= $data["j_name"]?>
                    </div>
                    <div class="box_header_sub">
                        <p>
                            <i class="fa fa-users"></i> Vacancy
                            <?= $data["j_number_of_vacancy"] ?>
                        </p>
                        <p>
                            <i class="fa fa-calendar"></i>
                            <?= date("m-d-Y",strtotime($data["j_created_at"]))?>
                        </p>
                    </div>
                </div>
                <hr>
                <div class="box_body">
                    <?= $data["j_description"]?>
                </div>
                <hr>
                <div class="box_button">
                     <button data-toggle="modal" data-target="#exampleModal" class="btn_applynow">
                          <i class="fa fa-file-text-o"></i>
                        APPLY NOW
                     </button>
                       
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Personal Information</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
            <form id="apply_job"  method="post" enctype="multipart/form-data">
                <input type="hidden" name="job_id" value="<?php echo isset($_GET["id"]) ? $_GET['id'] : '' ?>" readonly>
          <div class="modal-body">
              <div class="form-group mb-0">
                <label for="first_name" class="col-form-label">First Name:</label>
                <input type="text" class="form-control form-control-sm" id="first_name" placeholder="First Name" name="first_name">
              </div>
              <div class="form-group mb-0">
                <label for="last_name" class="col-form-label">Last Name:</label>
                <input type="text" class="form-control form-control-sm" id="last_name" placeholder="Last Name" name="last_name">
              </div>
              <div class="form-group mb-0">
                <label for="email" class="col-form-label">Email:</label>
                <input type="email" class="form-control form-control-sm" id="email" placeholder="Email" name="email">
              </div>
              <div class="form-group mb-0">
                <label for="contact_no" class="col-form-label">Contact NO.</label>
                <input type="text" class="form-control form-control-sm" id="contact_no" placeholder="Contact NO" name="contact_no">
              </div>
              <div class="form-group mb-0">
                <label for="message" class="col-form-label">Message:</label>
                <textarea class="form-control" id="message" name="message"></textarea>
              </div>
              <div class="form-group mb-0">
                <label for="upload" class="col-form-label">Upload Resume:</label>
                <input type="file" class="form-control form-control-sm" id="upload" placeholder="Contact NO" name="upload">
              </div>
              
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
          </form>
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

$(document).ready(() => {
    $("#apply_job").on("submit",(e) => {
        e.preventDefault();
        
        // var data = $('#apply_job').serializeArray()
        // var data = new FormData(this);
        const form = document.getElementById('apply_job');
        const formData = new FormData(form);

        $.ajax({
            url : "./routes/apply_job.php",
            type: "post",
            data:  formData,
            contentType: false,
            cache: false,
            processData:false,
            success: (res) => {
                console.log(res)
                if(res.success){
                    Swal.fire(
                        'Success',
                        `${res.message}`,
                        'success'
                    ) 
                    setTimeout(() => {
                        window.location.href="./?page=resume"
                    }, 1000);
                }else{
                    Swal.fire(
                        'Failed',
                        `${res.message}`,
                        'error'
                    )
                }
            }
        });
    });
});
</script>