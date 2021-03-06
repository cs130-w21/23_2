# frozen_string_literal: true

# This class creates messages.

class MessagesController < ApplicationController
  # Create a message with the given parameters and post it to the current chatroom.
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    message = @chatroom.messages.new(message_params)
    message.user = current_user
    message.save
    @chatroom.chatroom_users.each do |x|
      x.update_attribute(:read, false) if x.user_id != current_user.id
    end
    redirect_to @chatroom
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
