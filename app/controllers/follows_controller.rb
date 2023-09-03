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
        @follow = Follow.find_by(followed_id: params[:user_id] ,follower_id: current_user.id)
        #:user_idのプロフィールを表示させたい
        
        render :show
    end

    # フォロー外すとき
    def destroy
        @follow = Follow.find(params[:id])
        @follow.destroy
        redirect_to show_follow_path(@follow.followedid), notice: 'フォローを外す。'
    end
end
