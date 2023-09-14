class PostsController < ApplicationController
    def new
        @post = Post.new        
        @category = Category.all
        render :new
    end
    def index
        @title = params[:title]
        if @title.present?
            @posts = Post.eager_load(:favorites).where("title LIKE ? = #{@title}")
        else
            @posts = Post.all
            # @posts = Post.eager_load(:favorites).where("favorites.user_id = #{current_user.id}").all
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

    # #いいねとコメントのメソッド
    # def create_notification_by(current_user)
    #     notification = current_user.active_notifications.new(
    #         post_id: id,
    #         visited_id: user_id,
    #         action: "like"
    #     )
    #     notification.save if notification.valid?
    # end

    # def create_notification_comment!(current_user, comment_id)
    #     # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    #     temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    #     temp_ids.each do |temp_id|
    #         save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    #     end
    #     # まだ誰もコメントしていない場合は、投稿者に通知を送る
    #     save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
    # end

    # def save_notification_comment!(current_user, comment_id, visited_id)
    #     # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    #     notification = current_user.active_notifications.new(
    #     post_id: id,
    #     comment_id: comment_id,
    #     visited_id: visited_id,
    #     action: 'comment'
    #     )
    #     # 自分の投稿に対するコメントの場合は、通知済みとする
    #     if notification.visiter_id == notification.visited_id
    #         notification.checked = true
    #     end
    #     notification.save if notification.valid?
    # end

    # #フォロー時の通知
    # def create_notification_follow!(current_user)
    #     temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    #     if temp.blank?
    #     notification = current_user.active_notifications.new(
    #     visited_id: id,
    #     action: 'follow'
    #     )
    #     notification.save if notification.valid?
    #     end
    # end

    # # フォロー一覧
    # def followings
    #     user = User.find(params[:user_id])
    #     @users = user.followings
    # end
    # # フォロワー一覧
    # def followers
    #     user = User.find(params[:user_id])
    #     @users = user.followers
    # end
    
    private
    def post_params
        params.require(:post).permit(:title, :content, :category_id, :image)
    end
end