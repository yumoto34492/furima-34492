class PurchasesShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture, :municipality, :adderss, :building_name, :phone_num

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :adderss
    validates :phone_num
  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, prefecture: prefecture, municipality: municipality, address: address, building_name: building_name, phone_num: phone_num, purchase_id: purchase.id)
  end

end