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
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First_name can't be blank"
    end
    it 'family_nameが空では登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family_name can't be blank"
    end
    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First_name_kana can't be blank"
    end
    it 'falimy_name_kanaが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family_name_kana can't be blank"
    end
    it 'first_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include "First_name can't be blank"
    end
    it 'family_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = 'Abe'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family_name can't be blank"
    end
    it 'first_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.first_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include "First_name_kana can't be blank"
    end
    it 'family_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.first_name = 'Abe'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family_name_kana can't be blank"
    end
  end
end