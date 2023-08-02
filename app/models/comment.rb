class Comment < ApplicationRecord
  belongs_to :post

  vallidates:content,presence:true
end
