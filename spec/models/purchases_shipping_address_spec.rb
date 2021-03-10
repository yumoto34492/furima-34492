require 'rails_helper'

RSpec.describe PurchasesShippingAddress, type: :model do
  before do
    @purchases_shipping_address = FactoryBot.build(:purchases_shipping_address)
  end

  describe '商品購入' do
    context '商品が購入できるとき' do
      it '全項目が存在すれば購入できる' do
        expect(@purchases_shipping_address).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @purchases_shipping_address.post_code = ''
        @purchases_shipping_address.valid?
        expect(@purchases_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postal_codeに−（ハイフン）がないと保存できないこと' do
        @purchases_shipping_address.post_code = '1231234'
        @purchases_shipping_address.valid?
        expect(@purchases_shipping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @purchases_shipping_address.prefecture_id= ''
        @purchases_shipping_address.valid?
        expect(@purchases_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @purchases_shipping_address.municipality = ''
        @purchases_shipping_address.valid?
        expect(@purchases_shipping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchases_shipping_address.address = ''
        @purchases_shipping_address.valid?
        expect(@purchases_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numが空だと保存できないこと' do
        @purchases_shipping_address.phone_num = ''
        @purchases_shipping_address.valid?
        expect(@purchases_shipping_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが全角数字だと保存できないこと' do
        @purchases_shipping_address.phone_num = '１１１１１１１１１１１'
        @purchases_shipping_address.valid?
        expect(@purchases_shipping_address.errors.full_messages).to include("Phone num is invalid")
      end
      it 'phone_numは12桁以上だと保存できないこと' do
        @purchases_shipping_address.phone_num = '111111111111'
        @purchases_shipping_address.valid?
        expect(@purchases_shipping_address.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")
      end
      it 'phone_numに−（ハイフン）があると保存できないこと' do
        @purchases_shipping_address.phone_num = '111-1111-1111'
        @purchases_shipping_address.valid?
        expect(@purchases_shipping_address.errors.full_messages).to include("Phone num is invalid")
      end
      it 'tokenがないと保存できないこと' do
        @purchases_shipping_address.token = nil
        @purchases_shipping_address.valid?
        expect(@purchases_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
