

$(document).ready(() => {
    $(".btn_delete_job").click((e)=>{
        Swal.fire({
            icon: 'question',
            title: 'Do you want to delete this Job? Including all the publisher, applicants and job posted.',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: 'Yes',
            denyButtonText: `No`,
        }).then((result) => {
            if (result.isConfirmed) {
                var id = $(".btn_delete_job").data("id");
                $.ajax({
                    url : "./routes/delete_job.php",
                    method: "post",
                    data : {
                        id : id
                    },
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
            }
        })
    });
});