class Follow < ApplicationRecord
    belongs_to :follower
    belongs_to :followed
   
    # フォローしたときの処理
    def follow(user_id)
        follows.create(followed_id: user_id)
    end
    # フォローを外すときの処理
    def unfollow(user_id)
        followss.find_by(followed_id: user_id).destroy
    end
    # フォローしているか判定
    def following?(user)
        followings.include?(user)
    end
end
