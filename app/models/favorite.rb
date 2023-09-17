class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :post

    has_one :notification, as: :notifiable, dependent: :destroy

    after_create_commit :create_notifications

    private
    def create_notifications
        Notification.create(notifiable: self, user_id: user_id)
    end
end