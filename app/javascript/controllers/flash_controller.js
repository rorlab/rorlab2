import {
  Controller
} from 'stimulus';
import toastr from 'toastr';

export default class extends Controller {
  static targets = []

  connect() {
    let flash_key = this.data.get("key")
    let flash_value = this.data.get("value")
    
    switch(flash_key) {
      case 'notice':
      case 'success':
        toastr.success(flash_value);
        breaks;
      case 'info':
        toastr.info(flash_value);
        breaks;
      case 'warning':
        toastr.warning(flash_value);
        breaks;
      case 'alert':
      case 'error':
        toastr.error(flash_value);
        breaks;
      default:
        toastr.success(flash_value);
    }
  }
}