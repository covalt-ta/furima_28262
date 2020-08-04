FactoryBot.define do
  factory :order_address do
    postal_code            { "123-4567" }
    shipment_prefecture_id { 2 }
    city                   { Gimei.address.city.kanji }
    block                  { Gimei.address.town.kanji }
    building               { "トキワ荘101" }
    phone_number           { Faker::Number.leading_zero_number(digits: 10) }
    user_id                { 1 }
    item_id                { 2 }
  end
end
