# README

## usersテーブル

| Column               | Type   | Options                 |
| --------             | ------ | -----------             |
| nickname             | string | null: false             |
| email                | string | null: false,unique:true |
| encrypted_password   | string | null: false             |
| last_name            |string  | null: false             |
| first_name           |string  | null: false             |
| last_name_kana       |string  | null: false             |
| first_name_kana      |string  | null: false             |
| birthday             | date   | null: false             |
### association
has_many :items
has_many :orders
has_many :messages


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
|post_daytime_id | integer   | null: false      |
| user           | references| foreign_key:true |
### association
belongs_to :user
has_one :order
has_many :messages

## ordersテーブル

| Column   | Type       | Options         |
| -------- | ------ ----| --------------  |
| item     | references | foreign_key:true|
| user     | references | foreign_key:true|
### association
belongs_to  :item
belongs_to :user
has_one :address

## addressesテーブル

| Column         | Type       | Options         |
| --------       | ------ ----| --------------  |
| post_num       | string     | null: false     |
| prefecture_id |integer     | null: false     |
| post_address   |string      | null: false     |
| address        |string      |null: false      |
| build          | string     |                 |
| telephone_num  | sting      | null:false      |
| order          | references | foreign_key:true|
### association
belongs_to :order

## messages
| Column   | Type       | Options         |
| -------- | ------ ----| --------------  |
| item     | references | foreign_key:true|
| user     | references | foreign_key:true|

### association
belongs_to :user
belongs_to :item