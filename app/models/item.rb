class Item < ActiveHash::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :delivery_fee
  belongs_to :prefecture
  has_one_attached :image

  validates :category, :condition, :days_to_ship, :delivery_fee, :prefecture, presence: true
  validates :category_id, :condition_id, :days_to_ship_id, :delivery_fee_id, :prefecture_id, numericality: { other_than: 1 }
end
