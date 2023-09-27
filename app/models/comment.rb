class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presence: true, length: { maximum: 100 }

  has_many :reports, as: :context

  has_one :notification, as: :notifiable, dependent: :destroy

  after_create_commit :create_comment_notification

  private
  def create_comment_notification
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
