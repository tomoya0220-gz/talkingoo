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
        @user_profile = UserProfile.new(user_profile_params)
        @user = current_user
        @user_profile.user_id = @user.id
        if params[:name][:image]
            @user_profile.image.attach(params[:name][:image])
        end
        
        if @user_profile.save
            redirect_to index_posts_path, notice: '登録しました'
        else
            render :new, status: :unprocessable_entity
        end
    end
end


