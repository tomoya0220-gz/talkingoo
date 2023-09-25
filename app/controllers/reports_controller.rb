class ReportsController < ApplicationController
    before_action :authenticate_user!

    def create
        @report = Report.new(report_params)
        @report.reporter_id = current_user.id
        if context == Post
            @post = Post.params[:post_id]
            @user = @post.user_id
            @report.reported_id =  @user.id
        else #if context == Comment
            @comment = Comment.params[:comment_id]
            @post = @comment.post_id
            @user = @post.user_id
            @report.reported_id =  @user.id
        end

        if @report.save
            redirect_to index_post_path, notice: 'ご報告ありがとうございます。'
        else
            redirect_to index_post_path, notice: 'もう一度お試しください。'
        end
    end

    private
    def report_params
        params.require(:report).permit(:reason, :reporter_id, :reported_id)
    end
end