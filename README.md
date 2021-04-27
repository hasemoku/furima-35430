# テーブル設計

## users テーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| nick_name          | string     | null: false                |
| email              | string     | unique: true , null: false |
| encrypted_password | string     | null: false                |
| last_name          | string     | null: false                |
| first_name         | string     | null: false                |
| last_name_kana     | string     | null: false                |
| first_name_kana    | string     | null: false                |
| birthday           | date       | null: false                |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| description         | text       | null: false |
| cutegory_id         | integer    | null: false |
| condition_id        | integer    | null: false |
| shipping_charges_id | integer    | null: false |
| delivery_source_id  | integer    | null: false |
| days_to_ship_id     | integer    | null: false |
| praice              | string     | null: false |
| user                | references |             |

### Association

- belongs_to :user
- belongs_to :purchas




## purchases テーブル

| Column       | Type       | Options     |
| ------------ | ---------  | ----------- |
| product_name | string     | null: false |
| user         | references |             |
| item         | references |             |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| delivery_source_id | integer    | null: false |
| municipali         | string     | null: false |
| city_string        | string     | null: false |
| bilding_name       | string     |             |
| phone_number       | string     | null: false |
| purchase           | references |             |

### Association

- belongs_to :purchase