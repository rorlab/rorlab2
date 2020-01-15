import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log("Connected to Cable Controller");
  }

  handleKeypress(event) {
    console.log(event.keyCode)
    if (!(event.altKey || event.shiftKey || event.ctrlKey) && (event.keyCode == 13)) {
      console.log("Enter key pressed...")
      $("button").click()
    } 
  }
}
