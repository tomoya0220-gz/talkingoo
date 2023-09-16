class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :post

    has_one :notification, as: :notifiable, dependent: :destroy

    after_create_commit :create_notifications

    private
    def create_notifications
        Notification.create(notifiable: self, notifiable_type: Notification.notifiable_types[:favorited_the_post])
    end
end
