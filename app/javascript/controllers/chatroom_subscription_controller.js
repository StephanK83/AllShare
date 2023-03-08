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
    createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: (data) => { this.messagesTarget.insertAdjacentHTML("beforeend", data) } }
    )
  }
}
