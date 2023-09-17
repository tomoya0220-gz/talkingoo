class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
  belongs_to :user

  enum notifiable_type: {
    'Favorite' => 0,          
    'Follow' => 1,
    'Comment' => 2
  }
end