import { Controller } from "stimulus";
import toastr from "toastr";

export default class extends Controller {
  connect() {
    console.log("Reverse Endless Controller was connected.");

    $(".pagination").hide();

    $("#rcable-messages").on("scroll", function() {
      let current_level = $(this).scrollTop();
      if ($(".pagination").length == 0) {
        if (current_level <= $(this).height() * 2) {
          $("#go-to-top").hide();
          $("#go-to-bottom").show();
        } else if (
          current_level > $(this).height() * 2 &&
          current_level < $(this)[0].scrollHeight - $(this).height() * 3
        ) {
          $("#go-to-top").show();
          $("#go-to-bottom").show();
        } else {
          $("#go-to-top").show();
          $("#go-to-bottom").hide();
        }
      } else {
        $("#go-to-top").show();
        $("#go-to-bottom").show();
      }

      let url = $(".pagination .next_page").attr("href");
      if (url && current_level <= 50) {
        // console.log(url);
        $.getScript(url);
      }
    });
  }

  goBottom(e) {
    console.log("Called reverse_endless#goBottom");
    // toastr.success("채팅 마지막 페이지입니다.");
    $("#rcable-messages").animate(
      { scrollTop: $("#rcable-messages")[0].scrollHeight },
      200
    );
    // $("#go-to-top").show();
    // $("#go-to-bottom").hide();
    e.preventDefault();
  }

  goTop(e) {
    console.log("Called reverse_endless#goTop");
    // toastr.success("채팅 첫번째 페이지입니다. ");
    $("#rcable-messages").animate({ scrollTop: 0 }, 200);
    // $("#go-to-top").hide();
    // $("#go-to-bottom").show();
    e.preventDefault();
  }
}
