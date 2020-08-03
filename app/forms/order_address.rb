class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id

  #バリデーションは基本動作確認後に実装

  with_options presence: true do 
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipment_prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :phone_number, format: { with: /\A\d{,11}\z/ }
  end

  def save
    Address.create(
      postal_code: postal_code,
      shipment_prefecture_id: shipment_prefecture_id,
      city: city,
      block: block,
      building: building,
      phone_number: phone_number,
      item_id: item_id
    )
    Order.create(item_id: item_id, user_id: user_id)
  end
end