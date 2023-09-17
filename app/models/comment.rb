class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates:content, presence: true, length: { maximum: 100 }

  has_one :notification, as: :notifiable, dependent: :destroy

  after_create_commit :create_notifications

  private
    def create_notifications
        Notification.create(notifiable: self, user_id: user_id)
    end
end
