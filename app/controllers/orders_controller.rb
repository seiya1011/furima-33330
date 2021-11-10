class OrdersController < ApplicationController
  def index
    @oders = Orders.new
    @item = Item.find(params[:item_id])
   end
 
   def create
     binding.pry
   end
  end

