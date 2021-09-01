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
    it 'priceが300円なら出品できる' do
      @item.price = 300
      expect(@item).to be_valid
    end
    it 'priceが9,999,999円なら出品できる' do
      @item.price = 9_999_999
      expect(@item).to be_valid
    end
    it 'priceが半角なら出品できる' do
      @item.price = 300
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
    it 'priceが空だと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
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
    it 'category_idがないと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'day_to_ship_idがないと出品できない' do
      @item.day_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day to ship must be other than 1')
    end
    it 'prefecture_idがないと出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'product_condition_idがないと出品できない' do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Product condition must be other than 1')
    end
    it 'shipping_charge_idがないと出品できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
    end
    it 'priceが300円以下だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceが9,999,999円以上だと出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceが半角数字でないと出品できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it "priceが半角英数混合では登録できないこと" do
      @item.price = "200dollars"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it "priceが半角英語だけでは登録できないこと" do
      @item.price = "threemillion"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
 end
end