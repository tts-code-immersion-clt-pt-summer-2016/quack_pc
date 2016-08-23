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
    # for demonstration purposes regarding different formats that rails can render
    # respond_to do |format|
    #   format.html
      # format.pdf {render pdf: "#{@tweet}", template: 'tweets/show.html.erb'}
      # format.csv {render :csv, template: 'tweets/show.csv'}
    # end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html {redirect_to tweet_path(@tweet.id), notice: 'Your Tweet has been updated'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_path, notice: "Tweet was deleted" }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
end
