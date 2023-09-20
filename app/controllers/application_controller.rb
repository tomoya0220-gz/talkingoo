class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_notification_object

    include NotificationsHelper
    
    private    
    def set_notification_object
        @notifications = []
        if current_user
            @notifications = Notification.where(user_id: current_user.id).order(:read).order(created_at: :desc)
        end
    end
end
