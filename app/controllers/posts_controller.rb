class PostsController < ApplicationController
    def new
        @post = Post.new        
        @category = Category.all
        render :new
    end
    def index
        @title = params[:title]
        if @title.present?
            @posts = Post.where('title LIKE ?', "%#{@title}%")
        else
            @posts = Post.all
        end
        render :index
    end

    def create
        @post = Post.new(post_params)
        user = current_user
        @post.user_id = user.id
        if params[:post][:image]
            @post.image.attach(params[:post][:image])
        end
        
        if @post.save
            redirect_to index_post_path, notice: '登録しました'
        else
            render :new, status: :unprocessable_entity
        end
    end


    def edit
        @post = Post.find(params[:id])
        render :edit
    end
    
    def update
        @post = Post.find(params[:id])
        if params[:post][:image]
            @post.image.attach(params[:post][:image])
        end
        if @post.update(post_params)
            redirect_to index_post_path, notice: '更新しました'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to index_post_path, notice: '削除しました'
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :content, :category_id, :image)
    end
end