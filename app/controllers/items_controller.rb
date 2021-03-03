class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

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
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if current_user.id == item.user_id
    redirect_to root_path
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :introduction, :category_id, :condition_id, :delivery_fee_id,
                                 :prefecture_id, :days_to_ship_id, :selling_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
