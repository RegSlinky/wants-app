class Comment < ApplicationRecord
  belongs_to :tweet  
  belongs_to :user 

  validates :comment, presence: true 
  validates :comment, length: {maximum: 100}
end
