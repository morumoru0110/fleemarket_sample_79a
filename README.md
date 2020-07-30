# README

#ER 図
![データベース ER 図 (IE記法) (6)](https://user-images.githubusercontent.com/67144675/88506341-adade700-d014-11ea-8a69-b1ab20eab66a.png)
=======
![データベース ER 図 (IE記法) (4)](https://user-images.githubusercontent.com/67144675/88154131-50dfb480-cc41-11ea-9996-05373d0a0462.png)

# DB 設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| last_name_kanji  | string | null: false |
| first_name_kanji | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |


### Association

- has_many :products
- has_many :comments
- has_many :likes
- has_one :address dependent: :destroy
- has_one :card dependent: :destroy

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| prefecture    | string     |
| zip_code      | string     | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building_name | string     |
| room_number   | string     |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## cards テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| card_token   | string     | null: false                    |
| client_token | string     | null: false                    |

### Association

- belongs_to :user

## products テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| description     | text    | null: false |
| category        | integer | null: false |
| price           | integer | null: false |
| brand           | string  |
| condition       | string  | null: false |
| shipping_charge | integer | null: false |
| shipping_area   | string  | null: false |
| shipping_day    | integer | null: false |
| seller_id       | integer | null: false |
| buyer_id        | integer |             |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :images dependent: :destroy
- has_many :categories

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| comment    | text       | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## likes テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| nickname   | string     | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## images テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| image      | string     | null: false                    |
| product_id | references | null: false, foreign_key: true |

### Association

- belongs_to :product

## categories テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| category | string | null: false |
| ancestry | string |

### Association

- belongs_to :product
