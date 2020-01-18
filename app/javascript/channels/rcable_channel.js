import consumer from "./consumer";
import toastr from "toastr";

$(document).on("turbolinks:load", function() {
  consumer.subscriptions.create(
    {
      channel: "RcableChannel",
      rcable_id: $("#rcable-messages").attr("data-rcable-id"),
      channel_user_id: $("#rcable-messages").attr("data-channel-user-id")
    },
    {
      connected() {
        // Called when the subscription is ready for use on the server
        console.log(
          `Connected to Rcable ID ${$("#rcable-messages").attr(
            "data-rcable-id"
          )}`
        );
        console.log(
          `Connected to Channel User ID ${$("#rcable-messages").attr(
            "data-channel-user-id"
          )}`
        );
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        if ($("#rcable-messages").length > 0) {
          $("#rcable-messages").append(data.message);
          $("#rcable-messages").scrollTop(
            $("#rcable-messages")[0].scrollHeight
          );
          if (data.mention) {
            // alert("You have a new mention");
            toastr.success(`You have a new mention from @${data.from}.`);
          }
        }
      }
    }
  );
});
