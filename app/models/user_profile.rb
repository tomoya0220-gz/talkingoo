class UserProfile < ApplicationRecord
    belongs_to:user

    validates:name,presence:true

    has_one_attached :image

    belongs_to :follower
    belongs_to :followed
end
