class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @order_ship = OrderShip.new
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_ship = OrderShip.new(order_params)
    if @order_ship.valid?
      pay_item
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_ship).permit(:postalcode, :prefecture_id, :city, :address, :building_name, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
      )
  end
  
end
