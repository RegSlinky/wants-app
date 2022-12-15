class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :item
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :artist, length: {maximum: 40}
    validates :text, length: {maximum: 140}
  end

  validates :image, presence: true

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
  
end
