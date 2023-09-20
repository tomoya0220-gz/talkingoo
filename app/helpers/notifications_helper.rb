module NotificationsHelper
    def generate_notification_message(notification)
	return unless notification
	
        case notification.notifiable_type
        when 'Favorite'
            "#{notification.user_id.name} が <strong><#{t("notification.notifiable_type.#{notification.notifiable_type.Favorite}")}></strong> - <strong>#{notifiable_name(notification)}</strong> にいいね！しました".html_safe
        when 'Follow'
            "#{notification.user_id.name} が <strong><#{t("notification.notifiable_type.#{notification.notifiable_type.Follow}")}></strong> - <strong>#{notifiable_name(notification)}</strong> にいいね！しました".html_safe
        when 'Comment'
            "#{notification.user_id.name} が <strong>#{t("notification.notifiable_type.#{notification.notifiable_type.Comment}")}</strong> - <strong>#{notifiable_name(notification)}</strong> にコメントしました".html_safe
        
        else
            '新規通知がありました'
        end
    end

    private

    def notifiable_name(notification)
        return unless notification && notification.notifiable
	
        case notification.notifiable_type
        when 'Favorite'
            if notification.notifiable.likeable_type == 'Comment'
                "#{notification.notifiable.likeable.body}"
            else
                "#{notification.notifiable.likeable.title}"  
            end
        when 'Comment'
            "#{notification.notifiable.commentable.title}"
        when 'Follow'
            "#{}"
        else
            '新規通知がありました'
        end
    end
end