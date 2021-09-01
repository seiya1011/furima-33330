class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :day_to_ship
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :product_condition
  has_one_attached :image
  validates :image,:product_name,:info,:price,:user, presence: true

  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/} 
  
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :day_to_ship_id
  validates :prefecture_id
  validates :product_condition_id
  validates :shipping_charge_id
  end
end