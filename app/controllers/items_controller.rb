class ItemsController < ApplicationController
  before_action :move_to_index, except: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :contributor_confirmation, only: [:new, :create]

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
    @item = @tweet.item.id
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(edit_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user.id
      item.destroy
    end
    redirect_to root_path
  end

  private

  def move_to_index
    @tweet = Tweet.find(params[:tweet_id])
  end

  def item_params
    params.require(:item).permit(:artist, :image, :title, :shipping_fee_status_id, :prefecture_id, :partner_nickname, :price).merge(user_id:current_user.id, tweet_id: params[:tweet_id])
  end

  def edit_params
    params.require(:item).permit(:artist, :image, :title, :shipping_fee_status_id, :prefecture_id, :partner_nickname, :price).merge(user_id:current_user.id)
  end

  def contributor_confirmation
     if current_user.id == @tweet.user.id
      redirect_to root_path
    end
  end

end
