class ReportsController < ApplicationController
    before_action :authenticate_user!

    def create
        @report = Report.new
        @report.reporter_id = current_user.id
        if params[:context] == "Post"
            @post = Post.find(params[:post_id])
            @report.reported_id= @post.user_id
            @report.context_type = "Post"
            @report.context_id = @post.id
            @report.reason = params[:reason]
        elsif params[:context] == "Comment"
            @comment = Comment.find(params[:comment_id])
            @report.reported_id = @comment.user_id
            @report.context_type = "Comment"
            @report.context_id = @comment.id
            @report.reason = params[:reason]
        end
        
        if @report.save
            redirect_to index_post_path, notice: 'ご報告ありがとうございます。'
        else
            flash[:alert] = 'もう一度お試しください。'
            redirect_to new_comment_path
        end
    end
    
end