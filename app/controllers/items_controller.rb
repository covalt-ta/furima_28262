class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new, :create]
  before_action :set_item, only: [:show]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :item_category_id,
                                 :item_status_id, :shipping_fee_id,
                                 :shipment_prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
