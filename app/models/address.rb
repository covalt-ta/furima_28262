class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipment_prefecture

  validates :postal_code, :shipment_prefecture, :city, :block, :building,
            :phone_number, :item_id, presence: true

  with_options numericality: { other_than: 1 } do
    validates :shipment_prefecture_id
  end
end
