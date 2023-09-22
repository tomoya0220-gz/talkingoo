class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :post

    has_one :notification, as: :notifiable, dependent: :destroy

    after_create_commit :create_favorite_notification

    private
    def create_favorite_notification
        # if self.user_id != self.post.user_id
            Notification.create(
                sender_id: self.user_id,
                recipient_id: self.post.user_id,
                notifiable: self,
                notifiable_id: self.id,
                unread: true,               
            )
            
        # end
            # Notification.create(notifiable: self, user_id: user_id)
        
    end
end