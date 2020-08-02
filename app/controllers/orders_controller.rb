class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(
      :postal_code, :shipment_prefecture_id,
      :city, :block, :building, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
