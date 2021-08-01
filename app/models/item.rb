class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day_to_ship
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :product_condition
  has_one_attached :image



  validates :category_id, numericality: { other_than: 1 } 
  validates :day_to_ship_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :product_condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
end
