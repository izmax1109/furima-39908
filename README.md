# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| full_name          | string | null: false               |
| birth_day          | string | null: false               |

### Association

- has_many :items
- has_many :records


## items テーブル

| Column             | Type       | Options                             |
| ------------------ | ----------------------------------------------   |
| user               | references | null: false, foreign_key: true      |
| picture            | string     | null: false                         |
| commodity          | string     | null: false                         |
| description        | string     | null: false                         |
| category           | string     | null: false                         |
| condition          | string     | null: false                         |
| payer              | string     | null: false                         |
| region             | string     | null: false                         |
| shipping_day       | string     | null: false                         |
| price              | string     | null: false                         |


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
| user                | references | null: false, foreign_key: true |
| postal_code         | string     | null: false                    |
| prefecture          | string     | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| bill_name           | string     | null: false                    |
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
