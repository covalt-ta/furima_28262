class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipment_prefecture
  belongs_to :item

  with_options presence: true do 
    validates :postal_code
    validates :shipment_prefecture, numericality: { other_than: 1 }
    validates :city
    validates :building
    validates :phone_number
  end
end
