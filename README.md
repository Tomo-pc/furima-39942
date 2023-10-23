# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type    | Options      |
| ---------------- | ------- | -----------  |
| name             | string  | null: false  |
| explanation      | text    | null: false  |
| category         | string  | null: false  |
| condition        | string  |  null: false |
| shopping_charge  | string  | null: false  |
| shopping_address | string  |  null: false |
| shopping_days    | string  | null: false  |
| price            | integer | null: false  |

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :sp_charge
- belongs_to_active_hash :sp_days
- belongs_to_active_hash :prefectures


## orders テーブル

| Column  | Type       | Options  |
| ------- | ---------- | -------- |
| user_id | references |          |
| item_id | references |          |


### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer

## buyers テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| user_id        | references |             |
| post_code      | string     | null: false |
| prefectures    | string     | null: false |
| municipalities | string     | null: false |
| street_address | string     | null: false |
| building_name  | string     |             |
| telephone      | string     | null: false |

### Association

- belongs_to :order
- has_one_active_hash :prefectures