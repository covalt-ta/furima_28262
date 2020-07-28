class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.integer :price, null: false
      t.integer :item_category_id, null: false
      t.integer :shipping_status_id, null: false
      t.integer :shipment_prefecture_id, null: false
      t.integer :shipping_fee_id, null: false
      t.integer :shipping_day_id, null: false
      t.timestamps
    end
  end
end
