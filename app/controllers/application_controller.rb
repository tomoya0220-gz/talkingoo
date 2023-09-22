class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_notification_object

    include NotificationsHelper
    
    private    
    def set_notification_object
        
        # if current_user
        # @notifications = current_user.received_notifications.unread.order(created_at: :desc) 
        # end
        @notifications = []
        @notifications = Notification.where(recipient_id: current_user.id).order(:unread).order(created_at: :desc)
    end
end
