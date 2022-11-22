###### アプリケーション名
***
wants-app

###### アプリケーション概要
***
探している商品を投稿して、商品を持っている人に出品してもらうアプリケーション

###### URL
***
https://wantsapp-38579.onrender.com/

###### テスト用アカウント
***
・Basic認証パスワード：2222
・Basic認証ID :admin
・メースアドレス：mai@mai.com
・パスワード：mai345

###### 利用方法
***
### 探している商品の投稿
***
1.トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う
2.新規投稿ボタンから、探している商品内容(アーティスト名・商品の詳細・画像)を入力し投稿する
3.投稿した内容が、トップページにサムネイルで表示される

### 商品を持っている人に出品してもらう
***
1.サムネイルをクリックし、コメントページへ遷移する
2.コメントフォームからコメントし、価格交渉や商品の状態などを確認する
3.出品者が見つからない場合は、投稿者はコメントページにある削除ボタンで、投稿を削除できる
3.コメントにて交渉が成立したら、コメントページにある出品ボタンから、出品情報(投稿者・画像・アーティスト名・タイトル・配送料の負担・発送元の地域・価格)を入力して出品する
4.サムネイルに表示される編集ボタンから、出品情報の編集もしくは削除する
5.サムネイルに表示される購入ボタンから、購入情報(クレジットカード情報・郵便番号・市区町村・番地・建物名・電話番号)を入力して購入する

###### アプリケーションを作成した背景
***

###### 洗い出した要件
***
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1fzkWWtEcK8hh9i7Rkya_EteegBMaDjVO0dvpw9r9TcI/edit#gid=596474342)

###### 実装した機能についての画像やGIFおよびその説明
***
・[ツイート投稿機能の動画](https://i.gyazo.com/909c28b6fa6aaa545eac4c39cf96940b.gif)
・[ポップアップ機能の動画](https://i.gyazo.com/b10a613ebc968a1220375ecf00675a71.gif)
・[ユーザーによる出品可否の動画](https://i.gyazo.com/a4c2d50f15b786023f65f75e82e90a62.gif)
・[出品者、購入者毎の画面遷移の動画](https://i.gyazo.com/dce48229b6a5e4bd089f956051ea8620.gif)

###### 実装予定の機能
***
今後は検索機能の実装と、コメントがあった際のアイコンへの通知機能を実装予定。

###### データベース設計
***
[![Image from Gyazo](https://i.gyazo.com/61e090f0be755ff0ac08955fe97f43b6.png)](https://gyazo.com/61e090f0be755ff0ac08955fe97f43b6)

###### 画面遷移図
***
[![Image from Gyazo](https://i.gyazo.com/0d9ece7cbbd249b75bdea91809628937.png)](https://gyazo.com/0d9ece7cbbd249b75bdea91809628937)

###### テーブル設計
***

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
| tweet                  | references | null: false, foreign_key: true |

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
***
・フロントエンド
・バックエンド
・インフラ
・テスト
・テキストエディタ

###### ローカルでの動作方法
***
% git clone https://github.com/RegSlinky/wants-app
% cd wants-app
% bundle install
% yarn install

###### 工夫したポイント
***