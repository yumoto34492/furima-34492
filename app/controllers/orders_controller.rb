class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  
  def index
    if current_user.id != @item.user_id && @item.purchase == nil
      @purchases_shipping_address = PurchasesShippingAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchases_shipping_address = PurchasesShippingAddress.new(purchases_shipping_address_params)
    if @purchases_shipping_address.valid?
      pay_item
      @purchases_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def purchases_shipping_address_params
    params.require(:purchases_shipping_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.selling_price,
        card: purchases_shipping_address_params[:post_code],
        card: purchases_shipping_address_params[:prefecture_id],
        card: purchases_shipping_address_params[:municipality],
        card: purchases_shipping_address_params[:address],
        card: purchases_shipping_address_params[:building_name],
        card: purchases_shipping_address_params[:phone_num],
        card: purchases_shipping_address_params[:user_id],
        card: purchases_shipping_address_params[:item_id],
        card: purchases_shipping_address_params[:token],
        currency: 'jpy'
      )
  end
end
