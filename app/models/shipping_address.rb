class ShippingAddress < ApplicationRecord
  has_one :purchase
end
