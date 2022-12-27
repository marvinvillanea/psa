<?php

session_start();
require_once '../../../config.php';
require_once '../../../functions.php';
require_once '../../../session.php';

header("Content-Type: application/json");

// Array
// (
//     [job_id] => 32
//     [title_job] => Accountant
//     [no_vacancy] => 1
//     [description] => <p><strong>MedSpecialized, Inc.</strong>&nbsp;is looking for an&nbsp;<strong>Accountant</strong>!</p>
// )

if($_SERVER['REQUEST_METHOD'] === 'POST'){

    $job_id = mysqli_value($con,"job_id");
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
    


    $update_job = mysqli_query($con,"
    UPDATE
        `tbl_jobs`
    SET
        `j_name` = '$title_job',
        `j_number_of_vacancy` = $no_vacancy,
        `j_description` = '$description'
    WHERE
        `id` = $job_id
    ");


    if($update_job){
        message(true,"Successfully saved.");
    }else{
        message(false,"Failed to update the selected job.");
    }
}