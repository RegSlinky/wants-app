# アプリケーション名
wants-app

# アプリケーション概要
探している商品を投稿して、商品を持っている人に出品してもらうアプリケーション

# URL
https://wantsapp-38579.onrender.com/

# テスト用アカウント
・Basic認証パスワード：2222<br>
・Basic認証ID :admin<br>
・メースアドレス：mai@mai.com<br>
・パスワード：mai345

# 利用方法
## 探している商品の投稿
1.トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う<br>
2.トップページの新規投稿ボタンから、探している商品内容(アーティスト名・商品の詳細・画像)を入力し投稿する<br>
3.投稿した内容が、トップページにサムネイルで表示される

## 商品を持っている人に出品してもらう
1.サムネイルをクリックし、コメントページへ遷移する<br>
2.コメントフォームからコメントし、価格交渉や商品の状態などを確認する<br>
3.出品者が見つからない場合は、投稿者はコメントページにある削除ボタンから投稿を削除できる<br>
4.コメントにて交渉が成立したら、コメントページにある出品ボタンから、出品情報(投稿者・画像・アーティスト名・タイトル・配送料の負担・発送元の地域・価格)を入力して出品する<br>
5.サムネイルに表示される編集ボタンから、出品情報の編集、又は削除ができる<br>
6.サムネイルに表示される購入ボタンから、購入情報(クレジットカード情報・郵便番号・市区町村・番地・建物名・電話番号)を入力して購入する

# アプリケーションを作成した背景
私は趣味で音楽関連商品をコレクションしており、コンサート限定商品など、なかなか手に入れられないことを課題と感じていた。そのような商品は元々の販売数量が少なく、持っている人も滅多に手放すことがないため、市場に出回らないことが真因と仮説を立てた。同様の問題を抱えている方も多いと推測し、真因を解決するために、探している商品を自ら投稿し、商品を持っている方に出品してもらうアプリケーションを開発することにした。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1fzkWWtEcK8hh9i7Rkya_EteegBMaDjVO0dvpw9r9TcI/edit#gid=596474342)

# 実装した機能についての画像やGIFおよびその説明
1・[ツイート投稿機能の動画](https://i.gyazo.com/de17d9dbbe3403b1e617d7f1d418deeb.gif)：新規投稿ボタンから、探している商品内容を入力し投稿ができる。入力に不備があるとエラーメッセージが表示される。<br>
2・[ポップアップ機能の動画](https://i.gyazo.com/b1561fe4f874dc4ab5b5fee9413d74a3.gif)：サムネイル内にある吹き出しアイコン上にマウスを近づけると、商品の詳細がポップアップ表示される。<br>
3・[ユーザーによる出品可否の動画](https://i.gyazo.com/7bb32a605744546755a55b1ba2345ec9.gif)：投稿者がコメントページに遷移すると、投稿削除ボタンの表示があり、出品ボタンの表示はない。投稿者以外の方がコメントページに遷移すると、出品ボタンの表示があり、投稿削除ボタンの表示はない。<br>
4・[出品者、購入者毎の画面遷移の動画](https://i.gyazo.com/064eb6003abe2c1f652d4ab7daaf3359.gif)：商品が出品済みの場合、投稿者がログイン中は、該当する投稿のサムネイルに購入ボタンが表示される。出品者がログイン中は、該当するサムネイルに編集ボタンが表示される。また、ユーザーに関係なく、コメントページに出品ボタンと削除ボタンは表示されない。

# 実装予定の機能
今後は検索機能の実装と、コメントの通知をアイコンに表示する通知機能を実装予定。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/61e090f0be755ff0ac08955fe97f43b6.png)](https://gyazo.com/61e090f0be755ff0ac08955fe97f43b6)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/0d9ece7cbbd249b75bdea91809628937.png)](https://gyazo.com/0d9ece7cbbd249b75bdea91809628937)

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

# 開発環境
・フロントエンド<br>
・バックエンド<br>
・インフラ<br>
・テスト<br>
・テキストエディタ

# ローカルでの動作方法
% git clone https://github.com/RegSlinky/wants-app<br>
% cd wants-app<br>
% bundle install<br>
% yarn install

# 工夫したポイント
・ユーザー毎と商品の出品/購入の違いによって、ボタン表示の切り分けをしたところ<br>
・投稿した商品をサムネイル表示にし、ポップアップを表示することで、見た目をシンプルにしたところ<br>
・サムネイル表示を、新着投稿は1行4件までの表示、過去の一覧リストは1行7件ずつの表示に分けたところ<br>
・コメントページで、コメントのやり取りをチャット形式にしたところ
