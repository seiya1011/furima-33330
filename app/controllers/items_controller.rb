class ItemsController < ApplicationController
end

private

def items_params
  params.require(:items).permit(:content, :image).merge(user_id: current_user.id)
end
