class Item < ActiveHash::Base
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to [:category, :condition, :days_to_ship, :delivery_fee, :prefecture]
end
