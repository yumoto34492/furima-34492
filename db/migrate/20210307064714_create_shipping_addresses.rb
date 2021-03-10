class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :post_code,      null: false
      t.integer :prefecture_id, null: false
      t.string :municipality,   null: false
      t.string :address,        null: false
      t.string :building_name
      t.string :phone_num,      null: false
      t.references :purchase,   null: false, foreign_key: true
    end
  end
end
