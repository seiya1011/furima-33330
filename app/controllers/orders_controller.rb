class OrdersController < ApplicationController
  def index
    @oders = Orders.new
    @item = Item.new
   end
 
   def create
     binding.pry
   end
end
