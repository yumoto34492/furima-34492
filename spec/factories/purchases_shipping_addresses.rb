FactoryBot.define do
  factory :purchases_shipping_address do
    post_code         { '123-1234' }
    prefecture_id     { 5 }
    municipality      { '横浜市' }
    address           { '青山1' }
    building_name     { 'ビル１' }
    phone_num         { '09099999999' }
    token             { "tok_asdfgh234567890" }
  end
end
