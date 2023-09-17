module NotificationsHelpermodule NotificationsHelper
    def generate_notification_message(notification)
	return unless notification
	
        case notification.notifiable_type
        when 'Like'
            "#{User_profile.name} が <strong><#{t("like.likeable_type.#{notification.notifiable.likeable_type}")}></strong> - <strong>#{notifiable_name(notification)}</strong> にいいね！しました".html_safe
        when 'Follow'
            "#{User_profile.name} が <strong><#{t("like.likeable_type.#{notification.notifiable.likeable_type}")}></strong> - <strong>#{notifiable_name(notification)}</strong> にいいね！しました".html_safe
        when 'Comment'
            "#{User_profile.name} が <strong>#{t("like.likeable_type.#{notification.notifiable.commentable_type}")}</strong> - <strong>#{notifiable_name(notification)}</strong> にコメントしました".html_safe
        
        else
            '新規通知がありました'
        end
    end

    private

    def notifiable_name(notification)
        return unless notification && notification.notifiable
	
        case notification.notifiable_type
        when 'Comment'
            "#{notification.notifiable.commentable.title}"
        when 'Article'
            "#{notification.notifiable.title}"
        when 'Idea'
            "#{notification.notifiable.title}"
        when 'Like'
            if notification.notifiable.likeable_type == 'Comment'
                "#{notification.notifiable.likeable.body}"
            else
                "#{notification.notifiable.likeable.title}"  
            end
        else
            '新規通知がありました'
        end
    end
end