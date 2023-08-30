class ProfilesController < ApplicationController
    def new
        @user = current_user
        @user_profile = @user.user_profile
        if @user_profile == nil
            @user_profile = UserProfile.new
        end
        render :new
    end

    def create 
        @user_profile = UserProfile.new(user_profiles_params)
        @user = current_user
        @user_profile.user_id = @user.id
        if params[:user_profile][:image]
            @user_profile.image.attach(params[:user_profile][:image])
        end
        
        if @user_profile.save
            redirect_to index_post_path,notice: 'プロフィール登録・更新しました'
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def user_profiles_params
        params.require(:user_profile).permit(:name, :image, :introduction)
    end
end


