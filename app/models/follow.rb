class Follow < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
    
    has_one :notification, as: :notifiable, dependent: :destroy
    
    after_create_commit :create_follow_notifications

    private
    def create_follow_notifications
        Notification.create(
            sender_id: self.follower_id,
            recipient_id: self.followed_id,
            notifiable: self,
            notifiable_id: self.id,
            unread: true,               
        )
        # Notification.create(notifiable: self, user_id: followed_id)
    end
end
