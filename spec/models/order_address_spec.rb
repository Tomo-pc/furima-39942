require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
    @order_address.user_id = 1
    @order_address.item_id = 1
  end

  describe '商品購入' do
    context '商品を購入できるとき' do
      it 'すべての値が正しいときは購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_address.building_name = ''
        @order_address.valid?
        expect(@order_address).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it 'post_codeが空だと購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefectures_idが空だと購入できない' do
        @order_address.prefectures_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'city_addressが空だと購入できない' do
        @order_address.city_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City address can't be blank")
      end
      it 'telephoneが空だと購入できない' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」でないと購入できない' do
        @order_address.post_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeは半角文字でないと購入できない' do
        @order_address.post_code = '１２３−４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'telephoneは10桁以上でないと購入できない' do
        @order_address.telephone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneは11桁以内でないと購入できない' do
        @order_address.telephone = '123123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneは半角数値でないと購入できない' do
        @order_address.telephone = '１２３１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is invalid')
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @order_address.prefectures_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefectures must be other than 1')
      end
      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @order_address.post_code = '123ー4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'userが紐付いていなければ購入できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
