class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @oders = Orders.new
    @item = Item.find(params[:item_id])
   end
 
   def create
     binding.pry
   end
  end

