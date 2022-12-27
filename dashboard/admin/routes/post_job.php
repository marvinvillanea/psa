<?php

session_start();
require_once '../../../config.php';
require_once '../../../functions.php';
require_once '../../../session.php';

header("Content-Type: application/json");

if($_SERVER['REQUEST_METHOD'] === 'POST'){
    $title_job = mysqli_value($con,"title_job");
    $no_vacancy = mysqli_value($con,"no_vacancy");
    $description = mysqli_value($con,"description");

    function message($status,$message){
        $msg = array(
            "success" => $status,
            "message" => $message
        );
        echo arraytojson($msg);
        die();
    }

    if($title_job == ""){
        message(false, "Please enter the Title.");
    }
    if($no_vacancy == ""){
        message(false, "Please enter the No. Vacancy.");
    }
    if($description == ""){
        message(false, "Are you sure you want to save? Please check the save button again. Thank you");
    }

    $save_query = mysqli_query($con,"
    INSERT INTO `tbl_jobs`(
        `userid`,
        `j_name`,
        `j_number_of_vacancy`,
        `j_description`
    )
    VALUES(
        $u_id,
        '$title_job',
        '$no_vacancy',
        '$description'
    )
    ");

    if($save_query){
        message(true,"Successfully posted.");
    }else{
        message(false,"Failed to post the jobs.");
    }
}