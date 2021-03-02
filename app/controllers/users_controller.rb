# frozen_string_literal: true

# This class finds the user with the given ID.

class UsersController < ApplicationController
  before_action :authenticate_user!
  # Find the user with the given ID.
  def show
    @user = User.find(params[:id])
  end
end
