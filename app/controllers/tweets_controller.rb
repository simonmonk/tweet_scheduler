class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy, :tweet]
  skip_before_filter :verify_authenticity_token 

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
    @tweet.twitter_account_id = 1
    @tweet.save
  end

  # GET /tweets/1/edit
  def edit
  end
    
  def tweet
      @tweet.tweet()
      render :edit
  end
    
  def check
      # call on a 1 minute ping
      # delay for 0.59 seconds before each send
      now = Time.now
      scheduled_tweets = Tweet.where("scheduled = ?", true)
      scheduled_tweets.each do | tweet |
          if (tweet.scheduled_for < now)
              delay = rand(59)
              sleep(delay)
              tweet.tweet()
              tweet.scheduled = false
              tweet.save
          end
      end
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
        redirect_to :action => "index"
    else
        render :new
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:status, :image, :last_tweeted, :frequency, :times_tweeted, :scheduled_for, :twitter_account_id, :scheduled)
    end
end
