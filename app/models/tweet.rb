class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :item
  has_many :comments, dependent: :destroy

  validates :artist, presence: true
  validates :text, {length: {maximum: 140}}
  validates :image, presence: true
end
