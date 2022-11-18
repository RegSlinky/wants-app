require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end


  describe '新規投稿' do
    context "投稿できる場合" do
      it "すべての値が正しく入力されていれば投稿は保存される" do
        expect(@tweet).to be_valid
      end
    end

    context '投稿できないとき' do
      it 'アーティスト名が空では投稿できない' do
        @tweet.artist = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("アーティスト名を入力してください")
      end
      it '商品の詳細が空では投稿できない' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '画像が空では投稿できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("画像を入力してください")
      end
      it 'アーティスト名が40文字以上では投稿できない' do
        @tweet.artist = "a" * 41
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("アーティスト名は40文字以内で入力してください")
      end
      it '商品の詳細が140文字以上では投稿できない' do
        @tweet.text = Faker::Lorem.characters(number:141)
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("商品の説明は140文字以内で入力してください")
      end
      it 'ユーザー情報がない場合は投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
