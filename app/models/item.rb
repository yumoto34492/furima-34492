class Item < ActiveHash::Base
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to [:category, :condition, :days_to_ship, :delivery_fee, :prefecture]

  validates :category, :condition, :days_to_ship, :delivery_fee, :prefecture, presence: true
  validates :category_id, :condition_id, :days_to_ship_id, :delivery_fee_id, :prefecture_id, numericality: { other_than: 1 } 
end
