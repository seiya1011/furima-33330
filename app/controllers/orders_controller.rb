class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @oders = Orders.new
    @item = Item.find(params[:item_id])
   end
 
   def create
    @item = Item.find(params[:item_id])
    @orders = Orders.new(orders_params)
    if @orders.valid?
      @orders.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :home_num, :building_name, :tel).merge(user_id: current_user.id)
  end

end