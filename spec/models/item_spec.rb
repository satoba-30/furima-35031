require 'rails_helper'

RSpec.describe :item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品機能' do
    context '出品できるとき' do
      it 'name,text,image,category_id,status_id,delivery_fee_id,post_address_id,post_daytime_id,priceが入力されると出品できる' do
        
      end
      it 'priceが300円以上、9,999,999円以下なら出品できる' do
        
      end
      it 'ログイン中ならば出品できる' do
        
      end
    end
    context '出品できないとき' do
      it 'nameが空では登録できない' do
        
      end
      it 'textが空では登録できない' do
        
      end
      it 'imageが空では登録できない' do
        
      end
      it 'category_idが空では登録できない' do
        
      end
      it 'category_idが1だと出品できない' do
        
      end
      it 'status_idが空では登録できない' do
        
      end
      it 'status_idが1だと出品できない' do
        
      end
      it 'delivery_fee_idが空では登録できない' do
        
      end
      it 'delivery_fee_idが1だと出品できない' do
        
      end
      it 'post_address_idが空では登録できない' do
        
      end
      it 'post_address_idが1だと出品できない' do
        
      end
      it 'post_daytime_idが空では登録できない' do
        
      end
      it 'post_daytime_idが1だと出品できない' do
        
      end
      it 'priceが空では登録できない' do
        
      end
      it 'priceが300円未満、9,999,999円以上だと出品できない' do
        
      end
      it 'ログインしていなければ出品できない' do
        
      end
    end
  end
end
