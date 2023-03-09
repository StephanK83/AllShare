import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = {
    chatroomId: Number
  }

  connect() {
    console.log(`Connecting to the ActionCable channel with id ${this.chatroomIdValue}`)
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: (data) => { this.insertMessage(data) } }
    )
  }

  disconnect() {
    console.log("disconnected")
    this.channel.unsubscribe()
  }

  resetForm(event) {
    event.target.reset()
  }

  insertMessage(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data);
    // scroll to the bottom of the message
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
