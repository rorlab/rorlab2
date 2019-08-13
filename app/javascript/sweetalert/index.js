import swal from 'sweetalert2'
import Rails from '@rails/ujs'

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