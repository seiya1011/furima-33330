class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :day_to_ship
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :product_condition
  has_one_attached :image
  validates :image,:product_name,:info,:price, presence: true

  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/} 

  validates :category_id, numericality: { other_than: 1 } 
  validates :day_to_ship_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :product_condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
end