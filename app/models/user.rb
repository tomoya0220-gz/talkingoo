class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_profile
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
  
  # フォローをした、されたの関係
has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
has_many :reverse_of_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy

# 一覧画面で使う
has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
has_many :follower_user, through: :followed, source: :follower  # 自分をフォローしている人

  # フォローしたときの処理
  def follow(user_id)
    follows.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    follows.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

end
