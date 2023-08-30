class FollowsController < ApplicationController
    # フォローするとき
    def create
        current_user.follow(params[:user_id])
        redirect_to request.referer
    end
    # フォロー外すとき
    def destroy
        current_user.unfollow(params[:user_id])
        redirect_to request.referer  
    end
    # フォロー数とフォロワー数を表示する    
    def show
        @user = User.find(params[:id])
        @following_users = @user.following_users
        @follower_users = @user.follower_users
    end

end
