require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'aaaaaa@gmail.com'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end
      it 'ユーザー本名は、名字が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'ユーザー本名は、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name Full-width characters'
      end
      it 'ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name Full-width characters'
      end
      it 'ユーザー本名のフリガナは、名字が必須であること' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'ユーザー本名のフリガナは、名前が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'ユーザー本名の名字のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana Full-width katakana characters'
      end
      it 'ユーザー本名の名前のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana Full-width katakana characters'
      end
      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailが@がない場合は登録できない' do
        @user.email = 'aaaaaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = 'ssssss7'
        @user.password_confirmation = 'ssssdddd3'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英語のみは登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'passwordが数字のみは登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'passwordが全角英数混合は登録できない' do
        @user.password = '１23456a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end
end
