require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address,user_id: user.id,item_id: item.id)
      sleep 0.1  
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_numが空だと保存できないこと' do
        @order_address.post_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post num can't be blank")
      end
      it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_num = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post num is invalid.Include hyphen(-)")
      end
      it 'post_address_idを選択していないと保存できないこと' do
        @order_address.post_address_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post address can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'buildは空でも保存できること' do
        @order_address.build = ''
        expect(@order_address).to be_valid
      end
      it 'telephone_numが空だと保存できないこと' do
        @order_address.telephone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone num can't be blank"
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end

  end
end
