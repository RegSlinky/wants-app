class Item < ApplicationRecord

  belongs_to :user
  belongs_to :tweet
  has_one_attached :image
  has_one :order, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_fee_status
  belongs_to :prefecture

  validates :image, presence: true 

  with_options presence: true do
    validates :partner_nickname, length: {maximum: 10}
    validates :artist, length: {maximum: 40}
    validates :title, length: {maximum: 140}
  end

  with_options numericality: { other_than: 1, message: "を入力してください" } do
    validates :shipping_fee_status_id
    validates :prefecture_id
  end

  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "を¥300~¥9,999,999の間の半角数字を入力してください" }

end
