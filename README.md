# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| katakana           | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| image            | string | null: false |
| name             | string | null: false |
| explanation      | text   | null: false |
| category         | string | null: false |
| condition        | string | null: false |
| shopping_charge  | string | null: false |
| shopping_address | string | null: false |
| shopping_days    | string | null: false |
| price            | string | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| post_code      | string | null: false |
| prefectures    | string | null: false |
| municipalities | string | null: false |
| street_address | string | null: false |
| building_name  | string |             |
| telephone      | string | null: false |

### Association

- belongs_to :user
- belongs_to :item

