# テーブル設計

## users テーブル

| Column             | Type       | Options      |
| ------------------ | ---------- | ------------ |
| nick_name          | string     | null: false  |
| email              | string     | unique: true |
| encrypted_password | string     | null: false  |
| last_name          | string     | null: false  |
| first_name         | string     | null: false  |
| last_name_kana     | string     | null: false  |
| first_name_kana    | string     | null: false  |
| birthday           | date       | null: false  |

### Association

- has_many :items
- has_many :purchases
- has_many :addresses



## items テーブル

| Column              | Type              | Options     |
| ------------------- | ----------------- | ----------- |
| description         | text              | null: false |
| cutegory_id         | integer           |             |
| condition_id        | integer           |             |
| shipping_charges_id | integer           |             |
| delivery_source_id  | integer           |             |
| days_to_ship_id     | integer           |             |
| praice              | string            | null: false |
| comment             | text              | null: false |
| user                | foreign_key: true |             |

### Association

- belongs_to :user
- belongs_to :purchases




## purchases テーブル

| Column | Type              | Options     |
| ------ | ----------------- | ----------- |
| user   | foreign_key: true |             |
| item   | foreign_key: true |             |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column             | Type              | Options     |
| ------------------ | ----------------- | ----------- |
| postal_code        | string            | null: false |
| delivery_source_id | integer           |             |
| municipali         | string            | null: false |
| city_string        | string            | null: false |
| bilding_name       | string            |             |
| phone_number       | string            | null: false |
| purchase           | foreign_key: true |             |

### Association

- belongs_to :purchase