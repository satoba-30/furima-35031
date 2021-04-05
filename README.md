# README

##　usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| card     |integer | null: false |
| address  |string  | null: false |
### association
has_many :items
belongs_to :address


## itemsテーブル

| Column   | Type      | Options          |
| -------- | ------    | ---------------- |
| name     | string    | null: false      |
| price    | integer   | null: false      |
| category | string    | null: false      |
| user_id  | references| foreign_key:true |
### association
belongs_to :user
belongs_to :order

## ordersテーブル

| Column   | Type       | Options         |
| -------- | ------ ----| --------------  |
| item_id  | references | foreign_key:true|
| user_id  | references | foreign_key:true|
### association
has_many :items
belongs_to :user
belongs_to :address

## addressテーブル

| Column   | Type       | Options         |
| -------- | ------ ----| --------------  |
| order_id | references | foreign_key:true|
| user_id  | references | foreign_key:true|
### association
belongs_to :order
belongs_to :user