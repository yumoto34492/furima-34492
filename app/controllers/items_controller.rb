class ItemsController < ApplicationController
  private

  def item_params
    params.require(:item).permit(:image, :product_name, :introduction, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :selling_price).merge(user_id: current_user.id)
  end
end
