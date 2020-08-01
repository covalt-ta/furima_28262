FactoryBot.define do
  factory :item do
    name                   { Faker::Book.title }
    text                   { Faker::Lorem.sentence }
    price                  { Faker::Number.between(from: 300, to: 9_999_999) }
    item_category_id       { 2 }
    item_status_id         { 2 }
    shipping_fee_id        { 2 }
    shipment_prefecture_id { 2 }
    shipping_day_id        { 2 }
    association :user
  end
end
