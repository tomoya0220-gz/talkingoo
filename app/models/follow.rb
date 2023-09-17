class Follow < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
    
    has_one :notification, as: :notifiable, dependent: :destroy
    
    after_create_commit :create_notifications

    private
    def create_notifications
        Notification.create(notifiable: self, user_id: followed_id)
    end
end
