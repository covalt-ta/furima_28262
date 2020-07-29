class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :item_category_id,
                                :item_status_id, :shipping_fee_id,
                                :shipment_prefecture_id, :shipping_day_id)
  end
end
