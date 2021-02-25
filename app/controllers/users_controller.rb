# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  # GET to /users/:id
  def show
    current_user.profile&.update_attribute(:search, '')

    @user = User.find(params[:id])
  end
end
