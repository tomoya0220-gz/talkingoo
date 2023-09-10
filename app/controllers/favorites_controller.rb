class FavoritesController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        favorite = current_user.Favorite.find_by(post_id: post.id)
        @favorite = Favorite.find_by(user_id: current_user.id)
        
        if favorite.save
            redirect_to index_post_path, notice: 'いいねしました！'
        else
            redirect_to index_post_path, notice: 'いいねできませんでした。'
            # redirect_to request.referer
        end
        render template:"comment/new"
    end

    def destroy
        post = Post.find(params[:post_id])
        favorite = current_user.favorites.find_by(post_id: post.id)
        post.destroy
        redirect_to index_post_path, notice: 'いいねを外しました。'
    end

end