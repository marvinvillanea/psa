<?php

date_default_timezone_set('Asia/Manila');


function fetch_assoc($sql){
    return mysqli_fetch_assoc($sql);
}

function getTimeAndDate(){
    return date("Y-m-d H:i:s");
}
function getDateOfTheDay(){
    return date("Y-m-d");
}
function randomid(){
    $randomid = uniqid('',true);
    return md5($randomid);
}
function checkemail($con, $email, $exeception = ""){
    $check_query = mysqli_query($con,"SELECT * FROM `tbl_accounts` WHERE `email` = '$email' $exeception");
    if($check_query){
        if(mysqli_num_rows($check_query) > 0){
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}
function checkcnum($con, $cnum, $exeception = ""){
    $check_query = mysqli_query($con,"SELECT * FROM `tbl_accounts` WHERE `cnum` = '$cnum' $exeception");
    if($check_query){
        if(mysqli_num_rows($check_query) > 0){
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}

function clicksend_sms($cnum,$msg){
    $url = "https://api-mapper.clicksend.com/http/v2/send.php";
    $username = "LocalMJob";
    $key = "CED78221-5B58-273D-C856-EBD16C3422B0";


    /* 
    Alternate account
    username = Connect@yahoo.com
    key = D0CDA481-F30A-7BC4-0B75-BECEF7135150

    registered 10/16/2022
    */
    $data_array = array(
        "method" => "http",
        "username" => $username,
        "key" => $key,
        "to" => $cnum,
        "message" => $msg
    );
    $data = http_build_query($data_array);

    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER	,true);

    $resp = curl_exec($ch);

    
    if (strpos($resp, 'Success') !== false) {
        return true;
    }else{
        return false;
    }
}
function form($e){
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            return isset($_POST[$e]);
        }else{
            return isset($_GET[$e]);
        }
}
function form_array($array){
    $length = count($array);
    $empty = 0;
    for($i = 0; $i < $length; $i++){
        if(form($array[$i])){
            
        }else{
            $empty++;
        }
    }
    if($empty > 0){
        return false;
    }else{
        return true;
    }
}
function hasResult($result){
    if(mysqli_num_rows($result) > 0){
        return true;
    }else{
        return false;
    }
}
function form_empty_array($array){
    $length = count($array);
    $empty = 0;
    for($i = 0; $i < $length; $i++){
        if(value($array[$i]) == ""){
            $empty++;
        }
    }
    if($empty > 0){
        return false;
    }else{
        return true;
    }
}
function show_empty_fields($array){
    $length = count($array);
    $emtpy_fields = "";
    for($i = 0; $i < $length; $i++){
        if(form($array[$i])){
        }else{
            $emtpy_fields .= "[$array[$i]]";           
        }
    }
    return $emtpy_fields;
}
function value($e){
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if(isset($_POST[$e])){
                return $_POST[$e];
        }   
    }else{
        if(isset($_GET[$e])){
                return $_GET[$e];
        }
    }
}
function mysqli_value($con,$e){
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if(isset($_POST[$e])){
            return mysqli_escape_string($con,$_POST[$e]);
        }   
    }else{
        if(isset($_GET[$e])){
            return mysqli_escape_string($con,$_GET[$e]);
        }
    }
}
function TimeAndDateToArray($time){
    $bt = debug_backtrace();
    $caller = array_shift($bt);
    $line = $caller['line'];
    
    if($time !== ""){
        if(($timestamp = strtotime($time)) !== false ){
            $output = getdate($timestamp);
            return  array('valid'=>1,'dat'=>$output);
        }else{
            /* $this->showErrors("value","<span class='method'>TimeAndDateToArray()</span> expecting valid time and date format.",$line); */
            return false;
        }
    }else{
        /* $this->showErrors("value","<span class='method'>TimeAndDateToArray()</span>parameter are empty.",$line); */
        return false;
    }

}


function navigate($e){
    if (filter_var($e, FILTER_VALIDATE_URL)) { 
        echo "<script>window.open('$e','_self')</script>";
    }else{
        echo "<script>window.location.href = '$e'</script>";
    }
}

    function arraytojson($array){

    if(is_array($array)){
        return json_encode($array,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    }else{
        /* $this->showErrors("arraytojson","<span class='method'> arraytojson()</span> expecting an array.",$line); */
        return false;
    }
}

function getFileExtension($e){
    $fileExt = explode('.', $e);
    $fileActualExt = strtolower(end($fileExt));
    return $fileActualExt;
}

