require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end


  describe "商品出品" do
  context '商品が出品できる時' do
    it 'product_nameとpriceとinfoとcategory_idとproduct_condition_idとshipping_chage_idとprefecture_idとday_to_ship_idとimageが存在すれば出品できる' do
      expect(@item).to be_valid
    end
  end
  context '出費ができない時' do
    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it 'product_nameが空だと出品できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product name can't be blank"
    end
    it 'infoが空だと出品できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Info can't be blank"
    end
    it 'category_idが空だと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category is not a number"
    end
    it 'product_condition_idが空だと出品できない' do
      @item.product_condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product condition is not a number"
    end
    it 'shipping_charge_idが空だと出品できない' do
      @item.shipping_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charge is not a number"
    end
    it 'prefecture_idが空だと出品できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture is not a number"
    end
    it 'day_to_ship_id が空だと出品できない' do
      @item.day_to_ship_id  = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Day to ship is not a number"
    end
  end
end
end