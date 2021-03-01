class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :delivery_fee
  belongs_to :prefecture
  has_one_attached :image

  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
    validates :introduction, length: { maximum: 1000 }
    validates :image
    validates :selling_price
    validates :category
    validates :condition
    validates :days_to_ship
    validates :delivery_fee
  end
  validates :selling_price, format: { with: /\A[0-9]+\z/ }
  validates :selling_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, :condition_id, :days_to_ship_id, :delivery_fee_id, :prefecture_id, numericality: { other_than: 1 }
end
