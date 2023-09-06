import consumer from "channels/consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    console.log("conned")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    let counter = document.getElementById('notif_counter');
    let counterData = counter.innerText
    console.log(data,"data",counter);
    counter.innerText = parseInt(counterData) + 1
  }
});
