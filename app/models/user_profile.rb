class UserProfile < ApplicationRecord
    belongs_to:user

    validates:name,presence:true

    has_one_attached :image

    # belongs_to :follower, class_name: "User"
    # belongs_to :followed, class_name: "User"
end
