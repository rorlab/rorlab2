import consumer from "./consumer"

consumer.subscriptions.create("RcableChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connected")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data)
    $(`#message-for-rcable-${data.rcable_id}`).append(data.message)
  }
});
