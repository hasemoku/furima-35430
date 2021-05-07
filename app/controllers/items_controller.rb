class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:update, :edit, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def show
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

  def edit
  end

  def update
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path method: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :shipping_charge_id, :delivery_source_id,
                                 :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    return redirect_to root_path if current_user.id != @item.user_id || @item.purchase.present?
  end
end
