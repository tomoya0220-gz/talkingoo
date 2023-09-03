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

    def show
        @user = User.find(params[:user_id])
        @user_profile = UserProfile.find_by(user_id: params[:user_id])
        @follow = Follow.find(params[:user_id])
        render :show
    end

    def follow
        followed_id = params[:user_id]
        follower_id = current_user.id
        #Followモデルに空箱を与える
        follow = Follow.new
        follow.followed_id = followed_id
        follow.follower_id = follower_id
        if follow.save
            redirect_to show_profile_path(followed_id), notice: 'フォローしました！'
        else
            render :show, status: :unprocessable_entity
        end
    end

    def destroy
        @follow = Follow.find(params[:id])
        @follow.destroy
        redirect_to index_post_path, notice: '削除しました'
    end

    private
    def user_profiles_params
        params.require(:user_profile).permit(:name, :image, :introduction)
    end
end


