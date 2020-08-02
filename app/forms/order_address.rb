class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id

  #バリデーションは基本動作確認後に実装

  def save
    Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code,
      shipment_prefecture_id: shipment_prefecture_id,
      city: city,
      block: block,
      building: building,
      phone_number: phone_number,
      item_id: item_id
    )
  end
end