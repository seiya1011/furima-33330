class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :baria_user, only: [ :destroy,:edit]
  before_action :set_message, only: [ :show,:destroy,:edit,:update]
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
    redirect_to root_path
    else
      render :new
    end
  end

  def index
    @item = Item.all.order(created_at: :desc)
     end

     def show
     end
     
     def destroy
      @item.destroy
      redirect_to root_path
    end
  
    def edit
    end

    def update
      if  @item.update(items_params)
        redirect_to action: :show
    else
      render :edit
    end
  end



private

  def items_params
    params.require(:item).permit(:product_name, :image,:info,:category_id,:product_condition_id,:shipping_charge_id,:prefecture_id,:day_to_ship_id,:price).merge(user_id: current_user.id)
  end

  def baria_user
    unless Item.find(params[:id]).user.id.to_i == current_user.id
        redirect_to root_path(current_user)
    end
  end 
  def set_message
    @item = Item.find(params[:item_id])
  end
end