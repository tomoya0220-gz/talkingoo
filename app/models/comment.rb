class Comment < ApplicationRecord
  belongs_to :post

  validates:content, presence: true, length: { maximum: 100 }

  has_one :notification, as: :notifiable, dependent: :destroy

  after_create_commit :create_notifications

  private
  def create_notifications
    Notification.create(notifiable: self, user_id: post.user_id, notifiable_type: Notification.notifiable_types[:commented_on_the_post])
  end
end
