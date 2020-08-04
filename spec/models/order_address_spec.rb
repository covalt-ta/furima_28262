require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていると保存できる' do
      @order_address.valid?
      expect(@order_address).to be_valid
    end
    it 'buildingが空でも保存できる' do
      @order_address.building = nil
      @order_address.valid?
      expect(@order_address).to be_valid
    end
    it 'postal_codeが空だと保存できない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeがハイフンが入っていないと保存できない' do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end
    it 'shipment_prefecture_idが選択されていないと保存できない' do
      @order_address.shipment_prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipment prefecture can't be blank")
    end
    it 'cityが空だと保存できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank", "City is invalid")
    end
    it 'cityが空だとアルファベットだと保存できない' do
      @order_address.city = "shibuya"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City is invalid")
    end
    it 'blockが空だと保存できない' do
      @order_address.block = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block can't be blank")
    end
    it 'blockがアルファベットだと保存できない' do
      @order_address.block = "roppongi1-1"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block is invalid")
    end
    it 'buildingがアルファベットだと保存できない' do
      @order_address.building = "Tokiwaso101"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Building is invalid")
    end
    it 'phone_numberが空だと保存できない' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberにハイフンが入ると保存できない' do
      @order_address.phone_number = "090-12-1221"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが12桁以上だと保存できない' do
      @order_address.phone_number = "090123456789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'user_idが空だと保存できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
    it 'item_idが重複していると保存できない' do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.jpeg')
      @item.save
      @order_address_second = FactoryBot.build(:order_address)
      @order_address_second.item_id = @item.id
      @order_address_second.save
      @order_address.item_id = @order_address_second.item_id
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Item すでにidが存在します')
    end
  end
end
