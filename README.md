# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :likes


## items テーブル

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| name                   | string     | null: false                   |
| text                   | text       | null: false                   |
| price                  | integer    | null: false                   |
| user                   | references | null: false foreign_key: true |
| item_category_id       | integer    | null: false                   |
| shipping_status_id     | integer    | null: false                   |
| shipping_fee_id        | integer    | null: false                   |
| shipment_prefecture_id | integer    | null: false                   |
| shipping_day_id        | integer    | null: false                   |


### Association

- belongs_to_active_hash :item_category
- belongs_to_active_hash :shipping_status
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :shipment_prefecture
- belongs_to_active_hash :shipping_day
- belongs_to             :user
- has_many               :comments
- has_many               :likes
- has_one                :address
- has_one_attached       :image


## addresses テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| postal_code  | string     | null: false                   |
| prefecture   | integer    | null: false                   |
| city         | string     | null: false                   |
| block        | string     | null: false                   |
| building     | string     |                               |
| phone_number | string     | null: false                   |
| item         | references | null: false foreign_key: true |

### Association

- belongs_to :item


## comments テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| comment | text       | null: false                   |
| item    | references | null: false foreign_key: true |
| user    | references | null: false foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## likes テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| item      | references | null: false foreign_key: true |
| user      | references | null: false foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## ActiveHash 

| model              |
| ------------------ |
| ItemCategory       |
| ProductStatus      |
| ShippingFee        |
| ShipmentPrefecture |
| ShippingDay        |

## Active Storage 
画像用テーブルはActive Storageを使用

### Gem / ツール
- active_storage
- imagemagick
- mini_magick
- image_processing

## PAY.JP
クレジットカード決済機能にはPAY.JPを用いて実装
