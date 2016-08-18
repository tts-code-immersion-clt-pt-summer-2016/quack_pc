class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: "tweet was succesfully created"}
      else
        format.html { render :new }
      end
    end
  end

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
end
