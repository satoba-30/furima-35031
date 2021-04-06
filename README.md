# README

##　usersテーブル

| Column               | Type   | Options                 |
| --------             | ------ | -----------             |
| nickname             | string | null: false             |
| email                | string | null: false,unique:true |
| encrypted_password   | string | null: false             |
|password_confirmation | string | null: false             |
| last_name            |string  | null: false             |
| first_name           |string  | null: false             |
| last_name_kana       |string  | null: false             |
| first_name_kana      |string  | null: false             |
| birthday             | date   | null: false             |
### association
has_many :items
has_many :order


## itemsテーブル

| Column         | Type      | Options          |
| --------       | ------    | ---------------- |
| name           | string    | null: false      |
| price          | integer   | null: false      |
| category_id    | integer   | null: false      |
| text           | text      | null: false      |
| status_id      | integer   | null: false      |
| delivery_fee_id| integer   | null: false      |
| post_address_id| integer   | null: false      |
|post_daytime_id | text      | null: false      |
| user           | references| foreign_key:true |
### association
belongs_to :user
belongs_to :order

## ordersテーブル

| Column   | Type       | Options         |
| -------- | ------ ----| --------------  |
| item     | references | foreign_key:true|
| user     | references | foreign_key:true|
### association
has_one :item
belongs_to :user
has_one :address

## addressesテーブル

| Column         | Type       | Options         |
| --------       | ------ ----| --------------  |
| expiration date| integer    | null: false     |
| security_code  | integer    | null: false     |
| post_num       | string     | null: false     |
| prefectures_id |integer     | null: false     |
| post_address_id|string      | null: false     |
| address        |string      |null: false      |
| build          | text       |                 |
| telephone_num  | sting      | null:false      |
| order          | references | foreign_key:true|
### association
belongs_to :order
