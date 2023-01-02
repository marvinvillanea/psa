<?php
session_start();
require_once '../config.php';
require_once '../functions.php';
require_once '../session.php';



if(form("search")){
    $onsearch = true;
    $search = mysqli_value($con,"search");

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
    tbl_jobs.j_name LIKE '%$search%' 
    order by j_created_at desc
    ");
}else{
    $onsearch = false;

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
        order by j_created_at desc
        ");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../assets/logo.png" >
    <title>PSA - Jobs</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" defer></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="../verify.css">
    <link rel="stylesheet" href="../header.css">
    <link rel="stylesheet" href="../notify_style.css">
</head>
<body>
    <div class="main">
        <?php include '../header.php' ?>
        <div class="body_search">
            <div class="container_search">
                <h1>Search the for job that you looking for.</h1>
                <form action="" class="search_form" method="get">
                    <div class="field">
                        <i class="fa fa-search"></i>
                        <input type="text" name="search" id="search" value="<?= ($onsearch) ? value("search") : "" ?>"placeholder="Job title" required>
                    </div>
                    <button type="submit">
                        SEARCH
                    </button>
                </form>
            </div>
            <div class="content">
                <div class="container recommended">
                    <div class="container_title">
                        <?php if($onsearch){ ?>
                            Result-<?= mysqli_num_rows($result_query) ?>
                        <?php }else{ ?>
                            <?= ($islogin) ? "Recommended Jobs" : "Featured Jobs" ?>
                        <?php } ?>
                    </div>
                    <div class="container_body">
                        <?php if(hasResult($result_query)){?>
                            <?php while($row = mysqli_fetch_assoc($result_query)){?>
                                <a class="box" href="view.php?id=<?= $row["id"]?>">
                                    <div class="box_header">
                                        <div class="box_header_title">
                                            <?= $row["j_name"]?>
                                        </div>
                                        <div class="box_header_sub">
                                            <p>
                                                <i class="fa fa-users"></i> Vacancy
                                                <?= $row["total_vacancy"] ?>
                                            </p>
                                            <p>
                                                <i class="fa fa-calendar"></i>
                                                <?= date("m-d-Y",strtotime($row["j_created_at"]))?>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            <?php }?>
                        <?php }else{?>
                            <div class="not_found">
                                <img src="../assets/empty.png" >
                                <p>No Result</p>
                            </div>
                        <?php }?>
                    </div>
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