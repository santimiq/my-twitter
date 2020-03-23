class TweetsController < ApplicationController
  def create
    tweet = current_user.tweets.create(tweet_params)
    redirect_to root_path, redirect_options_for(tweet)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

  def redirect_options_for(tweet)
    if tweet.persisted?
      { notice: "Tweet successfully" }
    else
      { alert: "Could not tweet"}
    end
  end
end
