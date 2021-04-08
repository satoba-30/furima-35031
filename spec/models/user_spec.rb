require 'rails_helper'

RSpec.describe :user, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,last_name(kana),first_name(kana),birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'password,password_confirmationが6文字以上かつ半角英数字を含んでいると登録できる' do
        @user.password='12345s'
        @user.password_confirmation='12345s'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname=""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email=""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password=""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordがあっても、password_confirmationが空では登録できない' do
        @user.password_confirmation=""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password" 
      end
      it 'passwordは6文字以上でも、半角英数字を含んでいないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password  include both letters and numbers"
      end
      it 'passwordは5文字以下だと登録できない' do
        @user.password='123fr'
        @user.password_confirmation='123fr'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name=""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameは全角でないと登録できない' do
        @user.last_name = 'furima'
        @user.valid?   
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name=""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角でないと登録できない' do
        @user.first_name= 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana=""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_name_kanaが全角カタカナでないと登録できない' do
        @user.last_name_kana='furima'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana  Full-width katakana characters"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana=""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'fist_name_kanaが全角カタカナでないと登録できない' do
        @user.first_name_kana= 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana  Full-width katakana characters"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday=""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'emailが重複すると登録できない' do
        @user.save
        another_user=FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
    end
  end
end
