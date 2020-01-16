import consumer from "./consumer";

$(document).on("turbolinks:load", function() {
  consumer.subscriptions.create(
    {
      channel: "RcableChannel",
      rcable_id: $("#rcable-messages").attr("data-rcable-id")
    },
    {
      connected() {
        // Called when the subscription is ready for use on the server
        console.log(
          `Connected to Rcable ID ${$("#rcable-messages").attr(
            "data-rcable-id"
          )}`
        );
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        $("#rcable-messages").append(data.message);
        $("#rcable-messages").scrollTop($("#rcable-messages")[0].scrollHeight);
      }
    }
  );
});
