class Comment < ApplicationRecord
  belongs_to :tweet  
  belongs_to :user 

  validates :comment, length: {maximum: 100}
end
