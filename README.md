## usersテーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| last_name        | string   | null: false |
| first_name       | string   | null: false |
| last_name_kana   | string   | null: false |
| first_name_kana  | string   | null: false |
| birthday         | date     | null: false |

### Association

- has_many :items
- has_many :buys
- has_many :ships

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           |            |                                |
| title           | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shipping_charge | string     | null: false                    |
| source          | string     | null: false                    |
| days_to_ship    | string     | null: false                    |
| price           | integer    | null: false                    |
| seller_user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :buy
- has_one_attached :ship

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