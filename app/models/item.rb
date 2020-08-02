class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipment_prefecture
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_fee
  belongs_to :user
  has_one_attached :image
  has_one :address, dependent: :restrict_with_error
  has_one :order

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
    validates :item_category
    validates :item_status
    validates :shipment_prefecture
    validates :shipping_fee
    validates :shipping_day

    with_options numericality: { other_than: 1 } do
      validates :item_category_id, :item_status_id, :shipment_prefecture_id,
                :shipping_day_id, :shipping_fee_id
    end
  end
end
