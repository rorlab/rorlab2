import {
  Controller
} from 'stimulus';
import toastr from 'toastr';

export default class extends Controller {
  static targets = []

  connect() {
    let success_message = this.data.get("success")
    let info_message = this.data.get("info")
    let warning_message = this.data.get("warning")
    let error_message = this.data.get("error")
    if (success_message) {
      console.log(success_message)
      toastr.success(success_message)
    }
    if (info_message) {
      console.log(info_message)
      toastr.info(info_message)
    }
    if (warning_message) {
      console.log(warning_message)
      toastr.warning(warning_message)
    }
    if (error_message) {
      console.log(error_message)
      toastr.error(error_message)
    }
  }
}