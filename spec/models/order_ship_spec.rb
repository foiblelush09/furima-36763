require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_ship = FactoryBot.build(:order_ship, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入情報入力' do
    context '購入情報が登録できる場合' do
      it 'postalcode,prefecture_id,city,address,phonenumber,tokenがあれば登録できる' do
        expect(@order_ship).to be_valid
      end

      it 'building_nameが空でも登録できる' do
        @order_ship.building_name = ''
        @order_ship.valid?
        expect(@order_ship).to be_valid
      end
    end

    context '購入情報が登録できない場合' do
      it 'postalcodeが空の場合登録できない' do
        @order_ship.postalcode = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Postalcode can't be blank")
      end

      it 'postalcodeに-が含まれていないと登録できない' do
        @order_ship.postalcode = '0000000'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが---だと登録できない' do
        @order_ship.prefecture_id = '1'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと登録できない' do
        @order_ship.city = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと登録できない' do
        @order_ship.address = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Address can't be blank")
      end

      it 'phonenumberが空だと登録できない' do
        @order_ship.phonenumber = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phonenumber can't be blank")
      end

      it 'phonenumberが９桁以下だと登録できない' do
        @order_ship.phonenumber = '000000000'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phonenumber is invalid")
      end

      it 'phonenumberが12桁以上だと登録でいない' do
        @order_ship.phonenumber = '000000000000'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phonenumber is invalid")
      end

      it 'phonenumberが半角数値でないと登録できない' do
        @order_ship.phonenumber = '０００００００００００'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phonenumber input only number")
      end

      it 'token が空だと登録できない' do
        @order_ship.token = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと登録できない' do
        @order_ship.user_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと登録できない' do
        @order_ship.item_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end