class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @oders = Orders.new
    @item = Item.find(params[:item_id])
   end
 
   def create
    @item = Item.find(params[:item_id])
    @orders = Orders.new(item_orders_params)
    if @orders.valid?
      @orders.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def orders_params
    params.require(:item_orders).permit(:nickname,:email,:encrypted_password,:first_name,:first_name,:first_name_kana,:first_name_kana,:birthday,:image,:name,:price,:info,:category_id,:day_to_ship_id,:prefecture_id,:product_condition_id,:shipping_charge_id,:postcode,:block,:city,:building,:phone_number)
  end

end