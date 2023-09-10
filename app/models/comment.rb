class Comment < ApplicationRecord
  belongs_to :post

  validates:content, presence: true, length: { maximum: 100 }

  belongs_to :post
end
