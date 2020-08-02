class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
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
      :city, :block, :building, :phone_number, :token
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_c1186f2a2d36c991f9a68515"
    Payjp::Charge.create(
      amaount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
