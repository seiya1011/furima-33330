require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailに＠がない場合は登録できない' do
      @user.email = 'test.test'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'family_nameが空では登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'falimy_name_kanaが空では登録できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it 'first_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'family_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.family_name = 'Abe'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it 'first_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.first_name_kana = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'family_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.family_name_kana = 'Abe'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "birthday can't be blank"
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 's1234'
      @user.password_confirmation = 's2345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが全角では登録できない' do
      @user.password = 'KIHUMU'
      @user.valid?
      expect(@user.errors.full_messages).to include "password is invalid"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "password can't be blank"
    end
    it 'encrypted_passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "encrypted_password can't be blank"
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが全角では登録できない' do
      @user.password = 'KIHUMU'
      @user.valid?
      expect(@user.errors.full_messages).to include "password is invalid"
    end
    it 'passwordがでは半角英語だけでは登録できない' do
      @user.password = 'seiyag'
      @user.valid?
      expect(@user.errors.full_messages).to include "password is invalid"
    end
    it 'passwordがでは半角数字だけでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "password is invalid"
    end
    it 'passwordは確認用を含めて2回入力することであれば登録できること' do
      @user.password = 's23456'
      @user.password_confirmation = 's23456'
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 's23456'
      @user.password_confirmation = 's234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
