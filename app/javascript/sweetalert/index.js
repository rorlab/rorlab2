import swal from 'sweetalert2'
import Rails from '@rails/ujs'

Rails.confirm = function (message, element) {
  const swalWithBootstrap = swal.mixin({
    customClass: {
      confirmButton: 'btn btn-success w-25 mr-2',
      cancelButton: 'btn btn-info w-25'
    },
    buttonsStyling: false
  })

  console.log('alert starting')

  swalWithBootstrap.fire({
      html: message,
      // type: 'success',
      imageUrl: '/assets/rorlab_320_no_border.png', 
      imageHeight: 76,
      imageWidth: 150,
      showCancelButton: true,
      confirmButtonText: i18n.t('okay'),
      cancelButtonText: i18n.t('cancel')
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