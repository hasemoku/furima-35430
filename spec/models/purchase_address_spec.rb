require 'rails_helper'

  RSpec.describe PurchaseAddress, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id , item_id: item.id)
    end

    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it '存在すれば登録できる' do
          expect(@purchase_address).to be_valid
        end

        it 'bilding_nameが空でも登録できる' do
          @purchase_address.bilding_name = ''
          expect(@purchase_address).to be_valid
        end

      end

    context '商品出品がうまくいかないとき' do

      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
      end

      it 'postal_codeが空では登録できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeが数字3桁、ハイフン、数字4桁の並びでしか登録できない' do
        @purchase_address.postal_code = '12345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it 'delivery_source_idが---では登録できない' do
        @purchase_address.delivery_source_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Delivery source must be other than 1'
      end

      it 'municipaliが空では登録できない' do
        @purchase_address.municipali = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Municipali can't be blank"
      end

      it 'municipaliは全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @purchase_address.municipali = '000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Municipali Full-width characters"
      end

      it 'city_stringが空では登録できない' do
        @purchase_address.city_string = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "City string can't be blank"
      end

      it 'phone_numberが空では登録できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
      end


    end
  end
end