class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id

  with_options presence: true do 
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipment_prefecture_id, numericality: { other_than: 1 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :block, format: {with: /\A[ぁ-んァ-ン一-龥\d]/ }
    validates :phone_number, format: { with: /\A\d{,11}\z/ }
    validates :user_id
    validates :item_id
  end
  validates :building, format: {with: /\A[ぁ-んァ-ン一-龥\d]/, allow_nil: true }
  validate :uniqueness?

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

  def uniqueness?
    address = Address.find_by(item_id: item_id)
    unless address.nil?
      errors.add(:item_id, "すでにidが存在します")
    end
  end
end