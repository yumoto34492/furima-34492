FactoryBot.define do
  factory :item do
    product_name      { 'aaa' }
    introduction      { 'bbb' }
    category_id       { 2 }
    condition_id      { 2 }
    delivery_fee_id   { 2 }
    prefecture_id     { 2 }
    days_to_ship_id   { 2 }
    selling_price     { 500 }
    user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/DSC_0401.JPG'), filename: 'test_image.png')
    end
  end
end
