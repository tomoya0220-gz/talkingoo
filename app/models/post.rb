class Post < ApplicationRecord   
  belongs_to :user
  belongs_to :category

  validates:title,presence:true
  validates:comment,presence:true
  has_many:comments,dependent::destroy

  has_one_attached:image
end
