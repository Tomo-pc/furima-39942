# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shopping_charge_id | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| shopping_days_id   | integer    | null: false                    |
| price              | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shopping_charge
- belongs_to_active_hash :shopping_days
- belongs_to_active_hash :prefectures


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| order          | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| city_address   | string     | null: false                    |
| building_name  | string     |                                |
| telephone      | string     | null: false                    |

### Association

- belongs_to :order
- has_one_active_hash :prefectures