## usersテーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| last_name          | string   | null: false               |
| first_name         | string   | null: false               |
| last_name_kana     | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birthday           | date     | null: false               |

### Association

- has_many :items
- has_many :buys

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| description     | text       | null: false                    |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| shipping_charge | integer    | null: false                    |
| source          | integer    | null: false                    |
| days_to_ship    | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buysテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id       | references | null: false, foreign_key: true |
| buyer_user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one_attached :ship

## shipsテーブル

|Column          | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postalcode     | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phonenumber    | integer    | null: false                    |
| seller_user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buys