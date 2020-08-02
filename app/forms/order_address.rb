class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_prefecture_id, :city, :block, :building, :phone_number

  #バリデーションは基本動作確認後に実装

  def save
    address = Address.create(
      postal_code: postal_code,
      shipment_prefecture_id: shipment_prefecture_id,
      city: city,
      block: block,
      building: building,
      phone_number: phone_number,
      item_id: item_id
    )
    Order.create(user_id: user_id, item_id: address.item_id)
end