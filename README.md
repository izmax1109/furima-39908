# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_katakana | string | null: false               |
| first_name_katakana| string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :records


## items テーブル

| Column             | Type       | Options                             |
| ------------------ | ----------------------------------------------   |
| user               | references | null: false, foreign_key: true      |
| commodity          | string     | null: false                         |
| description        | string     | null: false                         |
| category           | id, name   | null: false, foreign_key: true      |
| condition          | id, naem   | null: false, foreign_key: true      |
| payer              | id, name   | null: false, foreign_key: true      |
| region             | id, name   | null: false, foreign_key: true      |
| shipping_day       | id, name   | null: false, foreign_key: true      |
| price              | integer    | null: false                         |


### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column              | Type    | Options                           |
| ------------------- | ------------------------------------------- |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column              | Type    | Options                           |
| ------------------- | ------------------------------------------- |
| user                | references | null: false                    |
| postal_code         | string     | null: false                    |
| prefecture          | id, name   | null: false, foreign_key: true |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| bill_name           | string     |                                |
| phone_number        | string     | null: false                    |

### Association

- belongs_to :record

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
