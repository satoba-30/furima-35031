# README

##　usersテーブル

| Column               | Type   | Options     |
| --------             | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | unique:true |
| encrypted_password   | string | null: false |
|password_confirmation | string | null: false |
| chinese_characters   |string  | null: false |
| katakana             |string  | null: false |
| birthday             | integer| null: false |
### association
has_many :items
has_one  :order


## itemsテーブル

| Column         | Type      | Options          |
| --------       | ------    | ---------------- |
| name           | string    | null: false      |
| price          | integer   | null: false      |
| category_id    | integer   | null: false      |
| image          | text      | null: false      |
| text           | text      | null: false      |
| status_id      | integer   | null: false      |
| delivery_fee_id| integer   | null: false      |
| post_address_id| integer   | null: false      |
|post_daytime_id | text      | null: false      |
| user_id        | references| foreign_key:true |
### association
belongs_to :user
belongs_to :order

## ordersテーブル

| Column   | Type       | Options         |
| -------- | ------ ----| --------------  |
| item_id  | references | foreign_key:true|
| user_id  | references | foreign_key:true|
### association
has_one :item
belongs_to :user
has_one :address

## addressesテーブル

| Column         | Type       | Options         |
| --------       | ------ ----| --------------  |
| card           |string      | null: false     |
| expiration date| integer    | null: false     |
| security_code  | integer    | null: false     |
| post_num       | text       | null: false     |
| prefectures_id |integer     | null: false     |
| municipalities |string      | null: false     |
| address        |string      |null: false      |
| build          | text       |                 |
| telephone_num  |integer     | null:false      |
| order_id       | references | foreign_key:true|
### association
belongs_to :order
