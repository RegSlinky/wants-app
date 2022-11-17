class Item < ApplicationRecord

  belongs_to :user
  belongs_to :tweet
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_fee_status
  belongs_to :prefecture

  validates :artist, presence: true
  validates :title, presence: true
  validates :image, presence: true 
  validates :partner_nickname, presence: true

  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "を¥300~¥9,999,999の間の半角数字を入力してください" }
 
  with_options numericality: { other_than: 1, message: "を入力してください" } do
    validates :shipping_fee_status_id
    validates :prefecture_id
  end

end
