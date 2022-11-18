require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

    describe '新規コメント' do
      context 'コメントできないとき' do
        it 'コメントが100文字以上ではコメントができない' do
          @comment.comment = Faker::Lorem.characters(number:101)
          @comment.valid?
          expect(@comment.errors.full_messages).to include("コメントは100文字以内で入力してください")
        end
        it 'ツイート情報がない場合はコメントできない' do
          @comment.tweet= nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Tweetを入力してください")
        end
        it 'ユーザー情報がない場合はコメントできない' do
          @comment.user = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Userを入力してください")
        end
      end
    end
end
