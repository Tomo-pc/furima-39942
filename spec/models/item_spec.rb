require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品を出品できるとき' do
      it 'すべての値が正しいときは出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")

      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Name can't be blank")
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shopping_charge_idが空では出品できない' do
        @item.shopping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping charge can't be blank")
      end
      it 'shopping_days_idが空では出品できない' do
        @item.shopping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping charge can't be blank")
      end
      it 'prefectures_idが空では出品できない' do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idは---以外を選択しないと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'condition_idは---以外を選択しないと出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'shopping_charge_idは---以外を選択しないと出品できない' do
        @item.shopping_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping charge must be other than 1")
      end
      it 'shopping_days_idは---以外を選択しないと出品できない' do
        @item.shopping_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping days must be other than 1")
      end
      it 'prefectures_idは---以外を選択しないと出品できない' do
        @item.prefectures_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it 'priceは半角数字でないと出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは300円以下だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceは9,999,999円以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
       end
    end
  end
end
