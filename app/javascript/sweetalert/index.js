import swal from 'sweetalert2'
import Rails from '@rails/ujs'

// document.addEventListener('turbolinks:load', function(){
//   swal.fire('hello world')
// })

Rails.confirm = function (message, element) {
  const swalWithBootstrap = swal.mixin({
    customClass: {
      confirmButton: 'btn btn-success mr-2',
      cancelButton: 'btn btn-info'
    },
    buttonsStyling: false
  })

  console.log('alert starting')

  swalWithBootstrap.fire({
      html: message,
      type: 'success',
      showCancelButton: true,
      confirmButtonText: 'Okay',
      cancelButtonText: 'Cancel'
    })
    .then((result) => {
      if (result.value) {
        console.log('sweetalert finished')
        element.removeAttribute('data-confirm')
        element.click()
      }
    })
  console.log('alert ended')
}