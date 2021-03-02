# frozen_string_literal: true

# This class creates, displays, and finds chatrooms.

class ChatroomsController < ApplicationController
  # Finds all chatrooms where the current user is a member.
  def index
    @user = User.find(current_user.id)
    current_user.profile&.update_attribute(:search, '')
    @chatrooms = Chatroom.all
  end

  # Finds and displays the chatroom with the given parameters, along with its messages.
  def show
    @user = User.find(current_user.id)
    current_user.profile&.update_attribute(:search, '')
    @chatroom = Chatroom.find(params[:id])

    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first
    @chatroom_user&.update_attribute(:read, true)
    @messages = @chatroom.messages.order(created_at: :desc).reverse
  end

  # Updates the chatroom with the given parameters and redirects to the chatroom if successful.
  def update
    @user = User.find(current_user.id)
    @chatroom = Chatroom.find(params[:chatroom_id])
    if @chatroom.update_attributes(chatroom_params)
      redirect_to user_path(id: params[:user_id])
    end
  end

  # Creates a new chatroom.
  def new
    @user = User.find(current_user.id)
    current_user.profile&.update_attribute(:search, '')
    @chatroom = Chatroom.new
  end

  # Edits a chatroom. Not currently implemented or used.
  def edit; end

  # Creates a new chatroom and redirects to it if successfully saved.
  def create
    @user = User.find(current_user.id)
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatroom_chatroom_users_path(chatroom_id: @chatroom.id, user_id: current_user.id), method: :post
    else
      render action: new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  # Never trust parameters from the scary internet, only allow the white list through.
  def chatroom_params
    params.require(:chatroom).permit(:title, :details, :search, :gender, :collegestudent, :minimumage, :maximumage, :city, :visible)
  end
end
