import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log("Connected to Cable Controller");
    $("#rcable-messages").scrollTop($("#rcable-messages")[0].scrollHeight);
  }

  handleKeydown(event) {
    // console.log(event.keyCode);
    if (
      !(event.altKey || event.shiftKey || event.ctrlKey) &&
      event.keyCode == 13
    ) {
      console.log("Enter key pressed...");
      // $("button").click();
      $("#rcable-message-form button").click();
      $(".message-form form")[0].reset();
      event.preventDefault();
    }
  }
}
