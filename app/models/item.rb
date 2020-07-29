class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipment_prefecture
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_fee
  has_one_attached :image
  has_one_attached :address

  validates :name, :text, :price, :item_category, :item_status, :image,
            :shipment_prefecture, :shipping_day, :shipping_fee, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  with_options numericality: { other_than: 1 } do
    validates :item_category_id, :item_status_id, :shipment_prefecture_id,
              :shipping_day_id, :shipping_fee_id
  end
end
