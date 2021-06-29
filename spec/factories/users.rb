FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    first_name            {"太郎"}
    family_name           {"田中"}
    first_name_kana       {"タロウ"}
    family_name_kana      {"タナカ"}
    birthday              {"1月２日"}
  end
end