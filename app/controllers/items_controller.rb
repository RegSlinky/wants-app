class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:tweet_id])
    @item = @tweet.item.id
  end

  private

  def item_params
    params.require(:item).permit(:artist, :image, :title, :shipping_fee_status_id, :prefecture_id, :partner_nickname, :price).merge(user_id:current_user.id, tweet_id: params[:tweet_id])
  end

end
