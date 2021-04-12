require 'rails_helper'

RSpec.describe :item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品機能' do
    context '出品できるとき' do
      it 'name,text,image,category_id,status_id,delivery_fee_id,post_address_id,post_daytime_id,priceがあれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが300円以上なら出品できる' do
        @item.price = '400'
        expect(@item).to be_valid
      end
      it 'priceが9,999,999円以下なら出品できる' do
        @item.price = '40000'
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'status_idが1だと出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status must be other than 1'
      end
      it 'delivery_fee_idが空では登録できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it 'delivery_fee_idが1だと出品できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery fee must be other than 1'
      end
      it 'post_address_idが空では登録できない' do
        @item.post_address_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Post address can't be blank"
      end
      it 'post_address_idが1だと出品できない' do
        @item.post_address_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Post address must be other than 1'
      end
      it 'post_daytime_idが空では登録できない' do
        @item.post_daytime_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Post daytime can't be blank"
      end
      it 'post_daytime_idが1だと出品できない' do
        @item.post_daytime_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Post daytime must be other than 1'
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceは半角数字のみでないと出品できない' do
        @item.price = 'かきくけこ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが300円未満だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than 300'
      end
      it 'priceは9,999,999円以上だと出品できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 9999999'
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
