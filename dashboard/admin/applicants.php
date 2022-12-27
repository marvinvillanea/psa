<?php 

$applicant_view = false;


if(form("sub") == "all_list" && form("view")){
    $applicant_view = true;
    $applicant_id = mysqli_value($con,"view");

    if(is_numeric($applicant_id)){
        $applicant_data = mysqli_query($con," SELECT *,concat(first_name, ', ', last_name) fullname, (select j_name from tbl_jobs where id = applicants.job_id limit 1 ) as job_title from applicants WHERE applicants.applicant_id =  $applicant_id ");
        if(hasResult($applicant_data)){
            $applicant_view = true;
            $data = mysqli_fetch_assoc($applicant_data);


        }else{
            $applicant_view = false;
        }
    }else{
        $applicant_view = false;
    }
}

$type_status = array(
    "all" => " ",
    "pending" => " where `status` = 0 ",
    "hired" => " where `status` = 1 ",
    "declined" => "where `status` = 2 "
);
$get_query_applicant_list = "SELECT *, concat(first_name, ', ', last_name) fullname from applicants ".$type_status["all"]."  order by created_at desc";
if(form("filter")) {
   $get_query_applicant_list = "SELECT *, concat(first_name, ', ', last_name) fullname from applicants ".$type_status[value("filter")]."  order by created_at desc";
}

$load_applicants = mysqli_query($con,$get_query_applicant_list);

if(form("sub")){?>
    <div class="sidebar">
        <a href="?page=applicants&sub=all_list" <?= (value("sub") == "all_list") ? 'class="active"' : "" ?>>
            <i class="fa fa-list"></i>
            <p class="name">List Applicant's</p>
        </a>

    </div>
     <div class="showcase" id="showcase_sub_all_list">
        <?php if(value("sub") == "all_list"){?>
            <?php if($applicant_view){?>
                <!-- VIEW OR UPDATES  -->
                <div class="container">
                    <div class="container_title">
                        <div class="title">
                        List Applicant's
                        </div>
                        <div class="filter">
                            <a href="./?page=applicants&sub=all_list&view=<?= $applicant_id?>&action=overview" <?= (value("action") == "overview") ? 'class="active"' : "" ?> >Details</a>
                            <a href="./?page=applicants&sub=all_list&view=<?= $applicant_id?>&action=delete" <?= (value("action") == "delete") ? 'class="active"' : "" ?>>DELETE</a>
                        </div>
                    </div>
                    <div class="container_body">
                        <?php if(form("action")){
                            $action = value("action");
                        ?>
                            <?php if($action == "overview"){?>
                                    <form method="post">
                                        <div class="field">
                                            <input type="hidden" name="applicant_id" value="<?= $data["applicant_id"]  ?>" readonly>
                                        </div>
                                         <label class="label">Name</label>
                                        <div class="field">
                                            <input type="text" name="fullname" value="<?= ucwords($data["fullname"])  ?>" id="fullname" placeholder="fullname" disabled>
                                        </div>
                                        <label class="label">Job Title</label>
                                        <div class="field">
                                            <input type="text" name="job_title" value="<?= $data["job_title"]  ?>" id="job_title" placeholder="Title name" disabled>
                                        </div>
                                        <label class="label">Email</label>
                                        <div class="field">
                                            <input type="email" name="email" value="<?= $data["email"]  ?>" id="email" placeholder="Email" disabled>
                                        </div>
                                        <label class="label">Contact No.</label>
                                        <div class="field">
                                            <input type="number" name="phone_no" value="<?= $data["phone_no"]  ?>" id="phone_no" placeholder="Contact No." disabled>
                                        </div>
                                        <label class="label">Resume</label>
                                        <button type="button" id="<?php  echo $data["resume"]?>" onclick="showProfId(this.id)"   style="color: white; padding:20PX; background-color: #36344d; padding-left: 30px; padding-right: 30px;border-radius: 10px;">View Resume</button>

                                        <button class="btn_submit">
                                            DECLINE
                                        </button>
                                          <button class="btn_submit">
                                            CONFIRM
                                        </button>
                                    </form>
                            <?php }elseif($action == "list_applicant"){?>
                                <?php if(hasResult($list_applicants)){?>
                                <?php while($row = mysqli_fetch_assoc($list_applicants)){?>
                                    <div class="box">
                                        <div class="text">
                                            <p style="font-size: 2rem; line-height: 2rem; text-transform: uppercase; "><?= $row["first_name"]." ".$row["last_name"] ?></p>
                                            <p style="font-size: .8rem;"><?= $row["email"] ?></p>
                                            <p style="font-size: .8rem;"><?= $row["phone_no"] ?></p>
                                            <p style="font-size: 1rem"><?= date("M d,Y",strtotime($row["created_at"])) ?></p>
                                        </div>
                                        <!-- <i class="fa fa-angle-right"></i> -->
                                    </div>
                                <?php } ?>
                                <?php }else{?>
                                    <div class="showcase" >
                                        <img src="./assets/empty.png" alt="empty" width="200">
                                        <p>No Applicants!..</p>
                                    </div>
                                <?php } ?>
                            <?php }elseif($action == "delete"){?>
                                <div class="showcase">
                                    <p>
                                        Delete <?= $data["j_name"] ?> 
                                    </p>
                                    <p>
                                        Warning : This action cannot be undone.
                                    </p>
                                    <button class="btn_delete btn_delete_job" data-id="<?= $applicant_id ?>"> DELETE</button>
                                </div>
                            <?php }else{navigate("./?page=applicants&sub=all_list&view=$applicant_id&action=overview");}?>
                        <?php }else{ navigate("./?page=applicants&sub=all_list&view=$applicant_id&action=overview"); }?>
                    </div>
                </div>
            <?php }else{?>
                    <!-- JOB LIST -->
                    <div class="container">
                        <div class="container_title">
                            List Applicant's
                            <div class="filter">
                                <a href="./?page=applicants&sub=all_list&filter=all" <?= (form("filter") && value("filter") == "all") ? 'class="active"' : "" ?> >ALL</a>
                                <a href="./?page=applicants&sub=all_list&filter=pending" <?= (form("filter") && value("filter") == "pending") ? 'class="active"' : "" ?> >PENDING</a>
                                <a href="./?page=applicants&sub=all_list&filter=hired" <?= (form("filter") && value("filter") == "hired") ? 'class="active"' : "" ?>>HIRED</a>
                                <a href="./?page=applicants&sub=all_list&filter=declined" <?= (form("filter") && value("filter") == "declined") ? 'class="active"' : "" ?>>DECLINED</a>
                            </div>
                        </div>

                        <div class="container_body">
                            <?php if(hasResult($load_applicants)){?>
                                <?php while($row = mysqli_fetch_assoc($load_applicants)){?>
                                    <a href="?page=applicants&sub=all_list&view=<?= $row["applicant_id"] ?>&action=overview" class="box">
                                        <div class="text">
                                            <p class="name">Name: <?= ucwords($row['fullname']); ?></p>
                                            <p class="salary_range">Email: <?= $row['email']; ?></p>
                                            <p class="salary_range">Contact No: <?= $row['phone_no']; ?></p>
                                            <p class="salary_range">Created At: <?= $row['created_at']; ?></p>
                                        </div>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                <?php } ?>
                            <?php }else{?>
                                <div class="showcase" >
                                    <img src="./assets/empty.png" alt="empty" width="200">
                                    <p>No data found</p>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
            <?php }?>

        <?php }else{ navigate("?page=applicants&sub=all_list"); }?>
    </div>
    
<?php }else{ navigate("?page=applicants&sub=all_list"); }?>
   <!-- The Modal -->
<style>

    /* The Modal (background) */
    .modal {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      padding-top: 2%; /* Location of the box */
      left: 0;
      top: 0;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content {
      background-color: #fefefe;
      margin: auto;
      padding: 20px;
      border: 1px solid #888;
      width: 40%;
    }
    .image_id {
        margin: 0px auto;
        width: auto;
        text-align: center;
    }

    /* The Close Button */
    .close {
      color: #aaaaaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: #000;
      text-decoration: none;
      cursor: pointer;
    }
    </style>
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close" onclick="closeProfid()">&times;</span>
    <div class="image_id" id="image_id">
        <img src="" width="450" id="itemDetail">
    </div>
  </div>

</div>
<script type="text/javascript">
    function showProfId(id){
        $('#myModal').show();
        $("img#itemDetail").attr('src' , id);

    }

    function closeProfid(){
          $('#myModal').hide();
    }
</script>