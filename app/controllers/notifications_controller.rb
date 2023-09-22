class NotificationsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @notifications = current_user.received_notifications.unread.order(created_at: :desc)
        # @notifications = current_user.user_id.order(created_at: :desc).page(params[:page]).per(20)
        respond_to do |format|
            format.turbo_stream do
                render turbo_stream: [
                    turbo_stream.append('notifications', partial: 'notifications/notification', collection: @notifications, as: :notification ),
                    turbo_stream.replace('notification_count', partial: 'notifications/notification_count', locals: { notifications: @notifications })
            ]
            end
            format.html
        end
        render :index
    end

    def update
        @notifications = current_user.received_notifications.find(params[:id])
        # @notifications = current_user.user_id.find(params[:id])
        # unread_notifications = current_user.notifications.where(read: false)
        @notification.update(unread: false)
        if @notification 
            respond_to do |format|
                format.turbo_stream do
                    render turbo_stream: [
                        turbo_stream.remove(@notification),
                        turbo_stream.replace('notification_count', partial: 'notifications/notification_count', locals: { notifications: current_user.notifications.unread })
                    ]
                end
                format.html
            end
        else
            respond_to do |format|
                format.turbo_stream do
                    render turbo_stream: [
                        turbo_stream.replace('notifications', '')
                    ]
                end
            end
        end
    end

    def mark_all_as_read
        @notifications = current_user.received_notifications.unread
        # @notifications = current_user.user_id.find(params[:id])
        @notifications.destroy_all
        respond_to do |format|
            format.turbo_stream do
                render turbo_stream: [
                    turbo_stream.remove('notifications'),
                    turbo_stream.replace('notification_count', partial: 'notifications/notification_count', locals: { notifications: current_user.notifications.unread }),
                    turbo_stream.prepend('no_notification', partial: 'notifications/no_notification')
                ]
            end
            format.html
        end
    end
end