class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @items = Item.order('created_at DESC')
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if current_user.id == item.user_id
    redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :introduction, :category_id, :condition_id, :delivery_fee_id,
                                 :prefecture_id, :days_to_ship_id, :selling_price).merge(user_id: current_user.id)
  end
end
