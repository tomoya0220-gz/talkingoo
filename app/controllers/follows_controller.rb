class FollowsController < ApplicationController
    # フォローするとき
    def create
        followed_id = params[:user_id]
        follower_id = current_user.id
        #Followモデルに空箱を与える
        follow = Follow.new
        follow.followed_id = followed_id
        follow.follower_id = follower_id
        if follow.save
            redirect_to show_follow_path(followed_id), notice: 'フォローしました！'
        else
            render :show, status: :unprocessable_entity
        end 
    end

    #プロフィール詳細画面へ
    def show
        @user_id = params[:user_id]
        @user_profile = UserProfile.find_by(user_id: params[:user_id])
        render :show
        @follow = Follow.find_by(followed_id:true ,follower_id:true)
    end

    # フォロー外すとき
    def destroy
        @following = Follow.find(params[:id])
        @following.destroy
        redirect_to show_follow_path, notice: 'フォローを外す。'
    end
end
