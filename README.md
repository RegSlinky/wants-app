###### アプリケーション名

wants

###### アプリケーション概要

探している商品を投稿して、商品を持っている人に出品してもらうアプリケーション

###### URL


###### テスト用アカウント

・Basic認証パスワード：
・Basic認証ID :
・メースアドレス：
・パスワード：

###### 利用方法

###### アプリケーションを作成した背景

###### 洗い出した要件

###### 実装した機能についての画像やGIFおよびその説明

###### 実装予定の機能

###### データベース設計

###### 画面遷移図

# テーブル設計

## users テーブル
| Column               | Type       | Options                   |
| -------------------- | ---------- | --------------------------|
| nickname             | string     | null: false               |
| email                | string     | null: false, unique: true |
| encrypted_password   | string     | null: false               |
| last_name            | string     | null: false               |
| first_name           | string     | null: false               |
| last_name_kana       | string     | null: false               |
| first_name_kana      | string     | null: false               |

### Association

- has_many :tweets
- has_many :comments
- has_many :items
- has_many :orders

## tweets テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| artist                 | string     | null: false                    |
| text                   | string     | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_many :comments

## comments テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| comment                | string     | null: false                    |
| tweet                  | references | null: false, foreign_key: true |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| artist                 | string     | null: false                    |
| title                  | string     | null: false                    |
| price                  | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| partner_nickname       | string     | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order


###### 開発環境

###### ローカルでの動作方法

###### 工夫したポイント