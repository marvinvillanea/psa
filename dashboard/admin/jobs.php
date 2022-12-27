<?php 

$company_view = false;
$load_jobs_list = mysqli_query($con,"SELECT *,  (select count(*) from applicants where job_id = tbl_jobs.id and status = 1 ) total_applicant  from tbl_jobs order by j_created_at desc");
if(form("sub") == "all_list" && form("view")){
    $company_view = true;
    $job_id = mysqli_value($con,"view");

    if(is_numeric($job_id)){
        $job_datas = mysqli_query($con," SELECT * from tbl_jobs WHERE tbl_jobs.id =  $job_id ");
        if(hasResult($job_datas)){
            $company_view = true;
            $data = mysqli_fetch_assoc($job_datas);

            $list_applicants = mysqli_query($con," SELECT * from applicants WHERE applicants.job_id =  $job_id and status = 1 ");

        }else{
            $company_view = false;
        }
    }else{
        $company_view = false;
    }
}

if(form("sub")){?>
    <div class="sidebar">
        <a href="?page=jobs&sub=all_list" <?= (value("sub") == "all_list") ? 'class="active"' : "" ?>>
            <i class="fa fa-list"></i>
            <p class="name">Job's List</p>
        </a>
        <a href="?page=jobs&sub=add_jobs" <?= (value("sub") == "add_jobs") ? 'class="active"' : "" ?>>
            <i class="fa fa-list"></i>
            <p class="name">Add Job Posting</p>
        </a>
    </div>
     <div class="showcase" id="showcase_sub_all_list">
        <?php if(value("sub") == "all_list"){?>
            <?php if($company_view){?>
                <!-- VIEW OR UPDATES  -->
                <div class="container">
                    <div class="container_title">
                        <div class="title">
                        Job Details
                        </div>
                        <div class="filter">
                            <a href="./?page=jobs&sub=all_list&view=<?= $job_id?>&action=overview" <?= (value("action") == "overview") ? 'class="active"' : "" ?> >Details</a>
                            <a href="./?page=jobs&sub=all_list&view=<?= $job_id?>&action=list_applicant" <?= (value("action") == "list_applicant") ? 'class="active"' : "" ?>>List Applicants</a>
                            <a href="./?page=jobs&sub=all_list&view=<?= $job_id?>&action=delete" <?= (value("action") == "delete") ? 'class="active"' : "" ?>>DELETE</a>
                        </div>
                    </div>
                    <div class="container_body">
                        <?php if(form("action")){
                            $action = value("action");
                        ?>
                            <?php if($action == "overview"){?>
                                    <form method="post" class="edit_job">
                                        <div class="field">
                                            <input type="hidden" name="job_id" value="<?= $data["id"]  ?>" readonly>
                                        </div>
                                         <label class="label">Created At</label>
                                        <div class="field">
                                            <input type="text" name="created" value="<?= $data["j_created_at"]  ?>" id="created" placeholder="Created At" disabled>
                                        </div>
                                        <label class="label">Job Title</label>
                                        <div class="field">
                                            <input type="text" name="title_job" value="<?= $data["j_name"]  ?>" id="title_job" placeholder="Title name">
                                        </div>
                                        <label class="label">No. of Vacancy</label>
                                        <div class="field">
                                            <input type="number" name="no_vacancy" value="<?= $data["j_number_of_vacancy"]  ?>" id="no_vacancy" placeholder="No. of Vacancy">
                                        </div>
                                        <div class="field">
                                            <textarea name="description" class="description" id="content" placeholder="Description" readonly><?= $data["j_description"]  ?></textarea>
                                        </div>
                                        <button class="btn_submit">
                                            SAVE
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
                                    <button class="btn_delete btn_delete_job" data-id="<?= $job_id ?>"> DELETE</button>
                                </div>
                            <?php }else{navigate("./?page=jobs&sub=all_list&view=$job_id&action=overview");}?>
                        <?php }else{ navigate("./?page=jobs&sub=all_list&view=$job_id&action=overview"); }?>
                    </div>
                </div>
            <?php }else{?>
                    <!-- JOB LIST -->
                    <div class="container">
                        <div class="container_title">
                            Job's List
                        </div>
                        <div class="container_body">
                            <?php if(hasResult($load_jobs_list)){?>
                                <?php while($row = mysqli_fetch_assoc($load_jobs_list)){?>
                                    <a href="?page=jobs&sub=all_list&view=<?= $row["id"] ?>&action=overview" class="box">
                                        <div class="text">
                                            <p class="name"><?= $row['j_name']; ?></p>
                                            <p class="salary_range">No. Vacancy : <?= $row['j_number_of_vacancy']; ?></p>
                                            <p class="salary_range">No. of Applicants : <?= $row['total_applicant']; ?></p>
                                            <p class="salary_range">Created At :<?= $row['j_created_at']; ?></p>
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
        <?php }elseif(value("sub") == "add_jobs"){?>
                <div class="container">
                    <div class="container_title">
                        <div class="title">
                        Job Details
                        </div>
                       
                    </div>
                    <div class="container_body">
                        <form method="post" class="add_jobs">
                            <label class="label">Job Title</label>
                            <div class="field">
                                <input type="text" name="title_job"  id="title_job" placeholder="Title name">
                            </div>
                            <label class="label">No. of Vacancy</label>
                            <div class="field">
                                <input type="number" name="no_vacancy"  id="no_vacancy" placeholder="No. of Vacancy">
                            </div>
                            <div class="field">
                                <textarea name="description" class="description" id="content" placeholder="Description"></textarea>
                            </div>
                            <button class="btn_submit">
                                SAVE
                            </button>
                        </form>
                    </div>
                </div>
        <?php }else{ navigate("?page=jobs&sub=all_list"); }?>
    </div>
    
<?php }else{ navigate("?page=jobs&sub=all_list"); }?>