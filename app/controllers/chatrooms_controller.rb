class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    puts @chatroom.inspect
    @message = Message.new
    authorize @chatroom
  end
end
