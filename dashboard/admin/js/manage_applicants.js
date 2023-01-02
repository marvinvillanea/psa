$(document).ready(() => {

    
      $(".btn_delete_applicant").click((e)=>{
        Swal.fire({
            icon: 'question',
            title: 'Do you want to delete this Applicant? ',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: 'Yes',
            denyButtonText: `No`,
        }).then((result) => {
            if (result.isConfirmed) {
                var id = $(".btn_delete_applicant").data("id");
                $.ajax({
                    url : "./routes/delete_applicant.php",
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
                                window.location.href = "?page=applicants&sub=all_list"
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

    // $(".btn_hired").each((i,e)=>{
    //     $(e).click(()=>{
     $(".btn_hired").click((e)=>{
          var id = $(".btn_hired").data("id");
          Swal.fire({
            icon: 'question',
            title: 'Hire?',
            text: 'Do you want to continue this action?',
            showCancelButton: true,
            confirmButtonText: 'Yes',
          }).then((result) => {
            if(result.isConfirmed){
              $.ajax({
                url : "./routes/manage_applicants.php",
                method: "post",
                data : {
                  id : id,
                  action: 1
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
                           window.location.href = "?page=applicants&sub=all_list"
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
    // });

   $(".btn_decline").click((e)=>{
          var id = $(".btn_decline").data("id");
          Swal.fire({
            icon: 'question',
            title: 'Decline?',
            text: 'Do you want to continue this action?',
            showCancelButton: true,
            confirmButtonText: 'Yes',
          }).then((result) => {
            if(result.isConfirmed){
              $.ajax({
                url : "./routes/manage_applicants.php",
                method: "post",
                data : {
                  id : id,
                  action: 2
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
                            window.location.href = "?page=applicants&sub=all_list"
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
