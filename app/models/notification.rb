class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
  belongs_to :user

  enum read: { unread: false, read: true }
  scope :recent, ->(count) { order(created_at: :desc).limit(count)}

  enum notifiable_type: {
    favorited_the_post:      0,
    followed_you:             1,
    commented_on_the_post:   2
  }

end
