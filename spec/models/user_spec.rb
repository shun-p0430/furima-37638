require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての項目を正しく入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がない場合は登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = 'test0'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'test0000'
        @user.password_confirmation = 'test1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角英字だけでは登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordが半角数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it '全角文字を含むpasswordでは登録できない' do
        @user.password = 'testテスト0000'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.first_name = 'rikutarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end

      it 'first_name_rubyが空では登録できない' do
        @user.first_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end

      it 'first_name_rubyが漢字では登録できない' do
        @user.first_name_ruby = '陸太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name ruby is invalid. Input full-width katakana characters')
      end

      it 'first_name_rubyがひらがなでは登録できない' do
        @user.first_name_ruby = 'りくたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name ruby is invalid. Input full-width katakana characters')
      end

      it 'first_name_rubyが英字では登録できない' do
        @user.first_name_ruby = 'rikutarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name ruby is invalid. Input full-width katakana characters')
      end

      it 'last_name_rubyが空では登録できない' do
        @user.last_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
      end

      it 'last_name_rubyが漢字では登録できない' do
        @user.last_name_ruby = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name ruby is invalid. Input full-width katakana characters')
      end

      it 'last_name_rubyがひらがなでは登録できない' do
        @user.last_name_ruby = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name ruby is invalid. Input full-width katakana characters')
      end
      it 'last_name_rubyが英字では登録できない' do
        @user.last_name_ruby = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name ruby is invalid. Input full-width katakana characters')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
