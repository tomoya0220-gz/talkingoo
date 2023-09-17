class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_notification_object

    include NotificationsHelper
    
    private    
    def set_notification_object
        @notifications = current_user.notifications.unread.order(created_at: :desc) if current_user
    end
end
