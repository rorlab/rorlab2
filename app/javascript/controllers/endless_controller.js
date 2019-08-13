import {
  Controller
} from "stimulus";

export default class extends Controller {
  static targets = []

  connect() {
    $(".pagination").hide();
    $("#gotop").hide();
    if ($('.pagination').length && $(this).length) {
      $(window).scroll(function () {
        let url = $('.pagination .next_page').attr('href');
        if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
          $('.pagination').text("Loading more posts...");
          return $.cachedScript(url);
        }
      });
      return $(window).scroll();
    }
  }

  gotop() {
    $('html, body').animate({
      scrollTop: 0
    }, 200);
  }
}