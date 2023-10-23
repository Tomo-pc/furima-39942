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

<<<<<<< HEAD
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
=======
| Column           | Type    | Options      |
| ---------------- | ------- | -----------  |
| name             | string  | null: false  |
| explanation      | text    | null: false  |
| category         | integer | null: false  |
| condition        | integer | null: false  |
| shopping_charge  | integer | null: false  |
| shopping_address | integer | null: false  |
| shopping_days    | integer | null: false  |
| price            | integer | null: false  |
>>>>>>> 5071842382dfd148afeac5a72a444b4fb56bce3b

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :_charge
- belongs_to_active_hash :sp_days
- belongs_to_active_hash :prefectures


## orders テーブル

<<<<<<< HEAD
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
=======
| Column  | Type       | Options  |
| ------- | ---------- | -------- |
| user_id | references |          |
| item_id | references |          |
>>>>>>> 5071842382dfd148afeac5a72a444b4fb56bce3b

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer


## buyers テーブル

<<<<<<< HEAD
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| order          | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| telephone      | string     | null: false                    |
=======
| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| user_id        | references |             |
| post_code      | string     | null: false |
| prefectures    | integer    | null: false |
| municipalities | string     | null: false |
| street_address | string     | null: false |
| building_name  | string     |             |
| telephone      | string     | null: false |
>>>>>>> 5071842382dfd148afeac5a72a444b4fb56bce3b

### Association

- belongs_to :order
- has_one_active_hash :prefectures
