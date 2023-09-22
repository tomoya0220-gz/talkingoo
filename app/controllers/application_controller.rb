class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_notification_object

    include NotificationsHelper
    
    private    
    def set_notification_object
        # @notifications = []
        # if current_user
        @notifications = current_user.received_notifications.unread.order(created_at: :desc) if current_user
    end
            # @notifications = Notification.where(user_id: current_user.id).order(:read).order(created_at: :desc)
    
end
