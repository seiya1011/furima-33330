class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
         validates :nickname,:birthday

         with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
          validates :first_name
          validates :family_name
        end
        with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' } do
          validates :first_name_kana
          validates :family_name_kana
        end
        with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字を使用してください' } do
          validates :password
        end
      end
    end