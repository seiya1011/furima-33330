class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]
  before_action :move_to_index, except: [:index, :show]
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
      @item =Item.find(params[:id])
     end
     
     #def destroy
      #@item = Item.find(params[:id])
      #redirect_to root_path
    #end
  
    def edit
      @item =Item.find(params[:id])
      redirect_to root_path unless current_user.id == @item.user_id
    end

    def update
      @item =Item.find(params[:id])
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


def move_to_index
  redirect_to new_user_session_path unless user_signed_in?
  end
end