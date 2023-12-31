class Post < ApplicationRecord   
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true
  
  has_many :comments,dependent: :destroy
  has_one_attached :image
  has_many :notifications, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reports, as: :context

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
