require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品の出品' do
    context "商品が保存できる場合" do
      it "すべての値が正しく入力されていれば商品は保存される" do
        expect(@item).to be_valid
      end
    end

    context '商品が保存できないとき' do
      it 'アーティスト名が空では保存できない' do
        @item.artist = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("アーティスト名を入力してください")
      end
      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品タイトルが空では保存できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品タイトルを入力してください")
      end
      it '投稿者のニックネームが空では保存できない' do
        @item.partner_nickname = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("投稿者のニックネームを入力してください")
      end
      it '配送料の負担の情報が初期値では保存できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '発送元の地域の情報が初期値では保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end 
      it '価格が空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '価格が半角数値以外は保存できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を¥300~¥9,999,999の間の半角数字を入力してください")
      end
      it '価格が¥300以下では保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を¥300~¥9,999,999の間の半角数字を入力してください")
      end
      it '価格が¥9,999,999以上では保存できない' do
        @item.price = 90000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を¥300~¥9,999,999の間の半角数字を入力してください")
      end
      it 'アーティスト名が40文字以上では投稿できない' do
        @item.artist = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("アーティスト名は40文字以内で入力してください")
      end
      it '投稿者のニックネームが40文字以上では投稿できない' do
        @item.partner_nickname = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("投稿者のニックネームは40文字以内で入力してください")
      end
      it '商品タイトルが140文字以上では投稿できない' do
        @item.title = Faker::Lorem.characters(number:141)
        @item.valid?
        expect(@item.errors.full_messages).to include("商品タイトルは140文字以内で入力してください")
      end
      it 'ユーザー情報がない場合は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it 'ツイート情報がない場合は保存できない' do
        @item.tweet = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Tweetを入力してください")
      end
    end
  end
end

