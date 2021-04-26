# テーブル設計

## users テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| nick_name      | string     | null: false |
| mail           | string     | null: false |
| password       | string     | null: false |
| last_name      | string     | null: false |
| first_name     | string     | null: false |
| last_name_kana | string     | null: false |
| first_name_kana| string     | null: false |
| birthday       | ActiveHash | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column           | Type          | Options     |
| ---------------- | ------------- | ----------- |
| image            | ActiveStarage | null: false |
| text             | text          | null: false |
| cutegory         | ActiveHash    |             |
| condition        | ActiveHash    |             |
| shipping_charges | ActiveHash    |             |
| delivery_source  | ActiveHash    |             |
| days_to_ship     | ActiveHash    |             |
| praice           | ActiveHash    |             |
| user             | references    |             |

### Association

- has_many :users
- has_many :comments

## comments テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| comment | text       | null: false |
| user    | references |             |
| item    | references |             |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column           | Type        | Options     |
| ---------------- | ----------- | ----------- |
| postal_code      | ActiveHash  |             |
| delivery_source  | ActiveHash  |             |
| municipali       | string      | null: false |
| address          | string      | null: false |
| bildingname      | string      |             |
| phone_number     | string      | null: false |
| user             | references  |             |

### Association

- belongs_to :user