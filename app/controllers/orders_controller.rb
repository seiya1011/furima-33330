class OrdersController < ApplicationController
  def index
    @oders = Orders.new
   end
 
   def create
     binding.pry
   end
end
