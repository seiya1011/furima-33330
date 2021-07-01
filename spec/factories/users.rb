FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'s12345'}
    password_confirmation {password}
    first_name            {"太郎"}
    family_name           {"田中"}
    first_name_kana       {"タロウ"}
    family_name_kana      {"タナカ"}
    birthday              {"2001-1-11"}
  end
end