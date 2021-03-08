class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  
  def index
    if current_user.id != @item.user_id
      @purchases_shipping_address = PurchasesShippingAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchases_shipping_address = PurchasesShippingAddress.new(purchases_shipping_address_params)
   if @purchases_shipping_address.valid?
    @purchases_shipping_address.save
    redirect_to root_path
   else
    render :index
   end
  end


  private

  def purchases_shipping_address_params
    params.permit(:purchases_shipping_address).permit(:post_code, :prefecture, :municipality, :address, :building_name, :phone_num)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
