FactoryBot.define do
  factory :item do
    name                   {Faker::Book.title}
    text                   {Faker::Lorem.sentence}
    price                  {Faker::Number.between(from: 300, to: 9999999)}
    item_category_id       {Faker::Number.between(from: 2, to: 11)}
    item_status_id         {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_id        {Faker::Number.between(from: 2, to: 3)}
    shipment_prefecture_id {Faker::Number.between(from: 2, to: 48)}
    shipping_day_id        {Faker::Number.between(from: 2, to: 4)}
    association :user
  end
end
