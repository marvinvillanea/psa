<?php
session_start();
require_once '../../config.php';
require_once '../../functions.php';
// require_once '../../session.php';

header("Content-Type: application/json");

function message($status,$message){
    $msg = array(
        "success" => $status,
        "message" => $message
    );
    echo arraytojson($msg);
    die();
}

if($_SERVER['REQUEST_METHOD'] === 'POST'){

    $first_name = mysqli_value($con,"first_name");
    $last_name = mysqli_value($con,"last_name");
    $email = mysqli_value($con,"email");
    $contact_no = mysqli_value($con,"contact_no");
    $message = mysqli_value($con,"message");

    if($first_name == ""){
        message(false, "Please enter the First Name.");
    }
    if($last_name == ""){
        message(false, "Please enter the Last Name.");
    }
    if($email == ""){
        message(false, "Please enter the Email");
    }

    if($contact_no == ""){
        message(false, "Please enter the Contact No.");
    }
    if($message == ""){
        message(false, "Please enter the Message");
    }
    
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      message(false, "Email is not a valid email address");
    } 


    $job_id = mysqli_value($con, 'job_id');

    $first_name = strtolower($first_name);
    $last_name = strtolower($last_name);



    $file = $_FILES["upload"];

    $dir = "../../resume";

    $fileName = $file["name"];
    $fileTmpName = $file["tmp_name"];
    $fileSize = $file["size"];
    $fileType = $file["type"];
    $fileError = $file["error"];

    $fileExt = explode('.',$fileName);
    $fileActualExt = strtolower(end($fileExt));
    $allowed = array('pdf', 'jpeg','png');
    $timestamp = microtime();
    


    if(in_array($fileActualExt,$allowed)){
        if($fileError === 0){
            if($fileSize < 5000000){

                $fileNewName = md5($timestamp).'_'.$first_name.'_'.$last_name.".".$fileActualExt;
                $fileDestination = $dir."/".$fileNewName;

                $upload_status = move_uploaded_file($fileTmpName,$fileDestination);

                if($upload_status){
                    // echo $fileDestination;

                    $inset_applicant = mysqli_query($con,"
                        INSERT INTO `applicants`(
                            `job_id`,
                            `first_name`,
                            `last_name`,
                            `email`,
                            `phone_no`,
                            `resume`,
                            `message`
                        )
                        VALUES(
                            $job_id,
                            '$first_name',
                            '$last_name',
                            '$email',
                            '$contact_no',
                            '$fileNewName',
                            '$message'
                        )
                    ");
                    if($inset_applicant){
                        message(true,"Your application was successfully submited.");
                    }else{
                        message(false,"Something went wrong with the server.");
                    }
                }else{
                    message(false,"There was an error uploading your file!");
                }
            }else{
                message(false,"Your file is too big!");
            }
        }else{
            message(false,"There was an error uploading your file!");
        }
    }else{
        message(false,"You cannot upload files of this type!. Files supported (pdf,jpeg,png)");
    }

}