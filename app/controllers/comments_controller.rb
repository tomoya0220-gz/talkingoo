class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:post_id])
    @user = current_user
    @user_profile = @user.user_profile
    user_id = current_user.id
    post_id = params[:post_id]
    @favorite = Favorite.new(user_id: user_id, post_id: post_id)
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to new_comment_path(params[:post_id]), notice: 'コメントしました'
    else
      @post = Post.find(params[:post_id])
      @comments = Comment.where(post_id: params[:post_id])
      render :new, status: :unprocessable_entity
      @user = current_user
      @user_profile = @user.user_profile
    end
  end

  def favorite
    user_id = current_user.id
    post_id = params[:post_id]
    @favorite = Favorite.new(user_id: user_id, post_id: post_id)
    if @favorite.save
      redirect_to index_post_path, notice: 'いいねしました！'
    else
      redirect_to index_post_path, notice: 'いいねできませんでした。'
      # redirect_to request.referer
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to index_post_path, notice: 'いいねを外しました。'
  end

  private
  def comment_params
  params.require(:comment).permit(:content).merge(post_id: params[:post_id])
  end
end
