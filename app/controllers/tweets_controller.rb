class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, only: [:show]

  def index
    @fourtweets = Tweet.includes(:item).order("created_at DESC").limit(4)
    @tweets = Tweet.includes(:item).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if current_user.id == tweet.user.id
      tweet.destroy
    end
      redirect_to root_path
  end

    def search
    @tweets = Tweet.search(params[:keyword])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:artist, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @tweet = Tweet.find(params[:id])
    if @tweet.item != nil 
      if @tweet.item.order != nil
      redirect_to root_path
      end
    end
  end

end
