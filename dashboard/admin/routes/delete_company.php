<?php

session_start();
require_once '../../../config.php';
require_once '../../../functions.php';
require_once '../../../session.php';

 header("Content-Type: application/json");

if($_SERVER['REQUEST_METHOD'] === 'POST'){

    function message($status,$message){
        $msg = array(
            "success" => $status,
            "message" => $message
        );
        echo arraytojson($msg);
        die();
    }

    $id = mysqli_value($con,"id");

    $delete = mysqli_query($con,"DELETE FROM `tbl_jobs` WHERE `id` =  $id);

    if($delete){
        message(true,"Successfully deleted.");
    }else{
        message(false,"Failed to delete the selected job.");
    }
}