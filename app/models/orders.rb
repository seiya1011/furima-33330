class Orders
  include ActiveModel::Model
  attr_accessor :nickname,:email,:first_name,:first_name,:first_name_kana,:first_name_kana,:birthday,:image,:name,:price,:info,:category_id,:day_to_ship_id,:prefecture_id,:product_condition_id,:shipping_charge_id,:postcode,:block,:city,:building,:phone_number
  with_options presence: true do
    validates :nickname
    validates :email
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, } 
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ } 
    validates :birthday
    validates :image
    validates :name
    validates :image
    validates :price
  end

  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/} 

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :day_to_ship_id
    validates :prefecture_id
    validates :product_condition_id
    validates :shipping_charge_id
    end

    def save
      user =  User.create(nickname: nickname, email: email, first_name: first_name, family_name: family_name, first_name_kana: first_name_kana, family_name_kana: family_name_kana, birthday: birthday)
      Item.create(image: image, name: name, info: info, category_id: category.id, product_condition_id: product_condition.id, day_to_ship_id: day_to_ship.id, prefecture_id: prefecture.id, shipping_chage_id: shipping_charge.id, price: price, user_id: user.id)
    end
end
