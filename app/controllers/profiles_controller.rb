class ProfilesController < ApplicationController
    def new
        @user = current_user
        @user_profile = @user.user_profile
        if @user_profile == nil
            @user_profile = UserProfile.new
        end
        render :new
    end
        
    private
    def user_profile_params
        params.require(:user_profile).permit(:name, :image, :introduction)
    end
end


