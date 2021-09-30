class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set2_item,           only: [:index, :create]

  def index
    @order_ship = OrderShip.new
    if @item.order.present?
      redirect_to root_path
    end
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
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

  def set2_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_ship).permit(:postalcode, :prefecture_id, :city, :address, :building_name, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
      )
  end
  
end
