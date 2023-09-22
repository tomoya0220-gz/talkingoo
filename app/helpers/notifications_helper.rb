module NotificationsHelper
    def generate_notification_message(notification)
	return unless notification
	
        case notification.notifiable_type
        when 'Favorite'
            if notification.sender.user_profile
                "#{notification.sender.user_profile.name} さんがいいね！しました".html_safe
                # <strong>#{t("notification.notifiable_type")}</strong> - <strong>#{notifiable_type(notification)}</strong> に
            else
                "id#{notification.sender_id} 番さんが いいね！しました".html_safe
                # <strong>#{t("notification.notifiable_type")}</strong> - <strong>#{notifiable_type(notification)}</strong> に
            end
            
        when 'Follow'
            if notification.sender.user_profile
                "#{notification.sender.user_profile.name} さんがあなたをフォローしました".html_safe
            else
                "id#{notification.sender_id} 番さんがあなたをフォローしました".html_safe
            end
            
        when 'Comment'
            if notification.sender.user_profile
                "#{notification.sender.user_profile.name} さんがあなたにコメントしました".html_safe
            else
                "id#{notification.sender_id} 番さんがあなたにコメントしました".html_safe
            end        
        else
            '新規通知がありました'
        end
    end

    # private

    # def notifiable_name(notification)
    #     return unless notification && notification.notifiable
	
    #     case notification.notifiable_type
    #     when 'Favorite'
    #         if notification.notifiable_type == 'Favorite'
    #             "#{notification.notifiable.likeable.body}"
    #         else
    #             "#{notification.notifiable.likeable.title}"  
    #         end
    #     when 'Comment'
    #         "#{notification.notifiable.commentable.title}"
    #     when 'Follow'
    #         "#{}"
    #     else
    #         '新規通知がありました'
    #     end
    # end
end