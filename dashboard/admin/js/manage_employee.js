$(document).ready(() => {

    
      $(".employee_add").click((e)=>{
        alert('fdasfdsaf');
    });


   //   $(".btn_hired").click((e)=>{
   //        var id = $(".btn_hired").data("id");
   //        Swal.fire({
   //          icon: 'question',
   //          title: 'Hire?',
   //          text: 'Do you want to continue this action?',
   //          showCancelButton: true,
   //          confirmButtonText: 'Yes',
   //        }).then((result) => {
   //          if(result.isConfirmed){
   //            $.ajax({
   //              url : "./routes/manage_applicants.php",
   //              method: "post",
   //              data : {
   //                id : id,
   //                action: 1
   //              },
   //              success: (res) => {
   //                  console.log(res)
   //                  if(res.success){
   //                      Swal.fire(
   //                        'Success',
   //                        `${res.message}`,
   //                        'success'
   //                      )
   //                      setTimeout(() => {
   //                         window.location.href = "?page=applicants&sub=all_list"
   //                      }, 1000);
   //                  }else{
   //                      Swal.fire(
   //                          'Failed',
   //                          `${res.message}`,
   //                          'error'
   //                      )
   //                  }
   //              }
   //            });
   //          }
   //        })
   //    });
   //  // });

   // $(".btn_decline").click((e)=>{
   //        var id = $(".btn_decline").data("id");
   //        Swal.fire({
   //          icon: 'question',
   //          title: 'Decline?',
   //          text: 'Do you want to continue this action?',
   //          showCancelButton: true,
   //          confirmButtonText: 'Yes',
   //        }).then((result) => {
   //          if(result.isConfirmed){
   //            $.ajax({
   //              url : "./routes/manage_applicants.php",
   //              method: "post",
   //              data : {
   //                id : id,
   //                action: 2
   //              },
   //              success: (res) => {
   //                  console.log(res)
   //                  if(res.success){
   //                      Swal.fire(
   //                        'Success',
   //                        `${res.message}`,
   //                        'success'
   //                      )
   //                      setTimeout(() => {
   //                          window.location.href = "?page=applicants&sub=all_list"
   //                      }, 1000);
   //                  }else{
   //                      Swal.fire(
   //                          'Failed',
   //                          `${res.message}`,
   //                          'error'
   //                      )
   //                  }
   //              }
   //            });
   //          }
   //        })
   //    });
  });
