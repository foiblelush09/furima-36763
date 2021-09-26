class OrdersController < ApplicationController
  def index
    @order_ship = OrderShip.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_ship = OrderShip.new(order_params)
    if @order_ship.valid?
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_ship).permit(:postalcode, :prefecture_id, :city, :address, :building_name, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
