FactoryBot.define do
  factory :item do
    product_name          {"test"}
    price                 {"200"}
    info                  {"商品"}
    category_id           {"3"}
    product_condition_id  {"2"}
    shipping_charge_id    {"2"}
    prefecture_id         {"2"}
    day_to_ship_id        {"2"}
    # association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end

