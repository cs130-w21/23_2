# frozen_string_literal: true

# This class creates and destroys requests to join chatrooms.

class RequestsController < ApplicationController
  before_action :authenticate_user!

  # Create a request to join the specified chatroom.
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    unless @chatroom.requests.exists?(user_id: current_user.id)
      request = @chatroom.requests.new(user_id: current_user.id, chatroom_id: @chatroom.id)
      request.user = current_user
      request.save
    end
    redirect_to root_path
  end

  # Destroy the specified request to join a chatroom.
  def destroy
    @chatroom = Chatroom.find(params[:chatroom_id])
    @request = Request.find(params[:request_id])
    @user = User.find(@request.user_id)
    @chatroom.requests.where(user_id: @user.id).destroy_all
    redirect_to chatrooms_path(id: current_user.id)
  end
end
