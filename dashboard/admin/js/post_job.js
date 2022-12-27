$(document).ready(() => {
    $(".add_jobs").on("submit",(e) => {
        e.preventDefault();
        var data = $('.add_jobs').serializeArray()
        $.ajax({
            url : "./routes/post_job.php",
            method: "post",
            data : data,
            success: (res) => {
                console.log(res)
                if(res.success){
                    Swal.fire(
                        'Success',
                        `${res.message}`,
                        'success'
                    )
                    setTimeout(() => {
                        window.location.href = "?page=jobs&sub=all_list"
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