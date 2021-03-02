# frozen_string_literal: true

# This class creates, shows, and modifies chatroom users.

class ChatroomUsersController < ApplicationController
  # Adds a user to a chatroom and deletes their request to join.
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @request = Request.find(params[:request_id])
    @chatroom_user = @chatroom.chatroom_users.where(user_id: @request.user_id).first_or_create

    @chatroom.requests.where(user_id: @request.user_id).destroy_all
    redirect_to chatrooms_path(id: current_user.id)
  end

  # Shows the specified chatroom user.
  def show
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
    @chatroom_user.update_attribute(:admin, true)
    redirect_to @chatroom
  end

  # Destroys the chatroom and removes all of its members.
  def destroy
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first
    @chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
    if @chatroom_user.admin == true
      @chatroom.chatroom_users.each do |x|
        x.update_attribute(:admin, true)
      end
    end
    redirect_to chatrooms_path(id: current_user.id)
  end
end
