require 'rails_helper'

RSpec.describe Destination, type: :model do
  describe '購入情報、配送先登録' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id, item_id: item.id)
      @pd = purchase_destination
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it '全ての項目が正しく入力されていれば購入できる' do
        expect(@pd).to be_valid
      end

      it 'apartmentが空でも購入できる' do
        @pd.apartment = ''
        expect(@pd).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが空では購入できない' do
        @pd.user_id = nil
        @pd.valid?
        expect(@pd.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない' do
        @pd.item_id = nil
        @pd.valid?
        expect(@pd.errors.full_messages).to include("Item can't be blank")
      end

      it 'post_codeが空では購入できない' do
        @pd.post_code = ''
        @pd.valid?
        expect(@pd.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが3桁-4桁でなければ購入できない' do
        @pd.post_code = '0000-000'
        @pd.valid?
        expect(@pd.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'prefecture_idが空では購入できない' do
        @pd.prefecture_id = ''
        @pd.valid?
        expect(@pd.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが0では購入できない' do
        @pd.prefecture_id = 0
        @pd.valid?
        expect(@pd.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では購入できない' do
        @pd.city = ''
        @pd.valid?
        expect(@pd.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では購入できない' do
        @pd.address = ''
        @pd.valid?
        expect(@pd.errors.full_messages).to include("Address can't be blank")
      end

      it 'telが空では購入できない' do
        @pd.tel = ''
        @pd.valid?
        expect(@pd.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが9桁以下では購入できない' do
        @pd.tel = '123456789'
        @pd.valid?
        expect(@pd.errors.full_messages).to include('Tel is too short')
      end

      it 'telが12桁以上では購入できない' do
        @pd.tel = '123456789012'
        @pd.valid?
        expect(@pd.errors.full_messages).to include('Tel is too short')
      end

      it 'telが半角数字以外では購入できない' do
        @pd.tel = '１２３４５６７８９０'
        @pd.valid?
        expect(@pd.errors.full_messages).to include('Tel is invalid. Input only number')
      end

      it 'tokenがなければ購入できない' do
        @pd.token = ''
        @pd.valid?
        expect(@pd.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
