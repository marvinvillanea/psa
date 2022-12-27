<?php 

     $load_jobs = mysqli_query($con,"SELECT * FROM `tbl_jobs`");
    $count_jobs = mysqli_num_rows($load_jobs);

    $load_company = mysqli_query($con,"SELECT * FROM `tbl_accounts`");
    $count_company = mysqli_num_rows($load_company);


    $filter = "all";
    $load_applicants = mysqli_query($con,"SELECT * from applicants ");
    $count_applicants = mysqli_num_rows($load_applicants);
?>
<h2>Hi, <?= $u_fname." ". $u_lname ?> 👋</h2>
<div class="dashboard">
    <div class="box">
        <div class="box_name">
            Open Jobs
        </div>
        <div class="box_count">
            <?= $count_jobs ?>
        </div>
        <a href="./?page=jobs&sub=all_list">
            VIEW
        </a>
    </div>
    <div class="box">
        <div class="box_name">
            Applicants
        </div>
        <div class="box_count">
            <?= $count_applicants ?>
        </div>
        <a href="?page=applicants&sub=all_list">
            VIEW
        </a>
    </div>
    <div class="box">
        <div class="box_name">
            Employees
        </div>
        <div class="box_count">
            <?= $count_company ?>
        </div>
        <a href="?page=employees&sub=all_list">
            VIEW
        </a>
    </div>
</div>