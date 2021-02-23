class ProfilesController < ApplicationController
    def new
        @profile = Profile.new
    end
    
    def create
      # Ensure that we have the user who is filling out form
      @user = User.find( params[:user_id] )
      # Create profile linked to this specific user
      @profile = @user.build_profile( profile_params )
      if @profile.save
        flash[:success] = "Profile updated!"
        redirect_to user_path(id: params[:user_id] )
      else
        render action: :new
      end
    end
    
    def edit
        @user = User.find(current_user.id)
        @profile=@user.profile
    end
    
    def update
        @user = User.find(current_user.id)
        @profile = @user.profile
        if @profile.update_attributes(profile_params)
          flash[:success] = "Profile Updated."
          #redirect to their profile page
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
