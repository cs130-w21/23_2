# frozen_string_literal: true

# This class creates and modifies user profiles.

class ProfilesController < ApplicationController
  # Generates a new profile.
  def new
    @profile = Profile.new
  end

  # Creates a user profile with the given parameters. If successful, redirects to their profile page.
  def create
    # Ensure that we have the user who is filling out form
    @user = User.find(params[:user_id])
    # Create profile linked to this specific user
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = 'Profile updated!'
      redirect_to user_path(id: params[:user_id])
    else
      render action: :new
    end
  end

  # Finds the user with the current ID.
  def edit
    @user = User.find(current_user.id)
    @profile = @user.profile
  end

  # Updates the attributes of the selected profile with the given parameters. If successful, redirects to their profile page.
  def update
    @user = User.find(current_user.id)
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = 'Profile Updated.'
      # redirect to their profile page
      redirect_to root_path
    else
      render action: :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :age, :gender, :city, :collegeemail, :minimumage, :maximumage, :genderpreference, :collegepreference, :search)
  end
end
