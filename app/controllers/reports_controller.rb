class ReportsController < ApplicationController
    before_action :authenticate_user!

    def create
        @report = Report.new(report_params)
        @report.reporter_id = current_user.id
        if context == Post
            @post = Post.find(params[:post_id])
            @report_user = @post.user
            @report.reported_id =  @reported_user.id
        else #if context == Comment
            @comment = Comment.find(params[:comment_id])
            @comment = @comment.comment
            @reported_user = @comment.user
            @report.reported_id =  @ureport_user.id
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