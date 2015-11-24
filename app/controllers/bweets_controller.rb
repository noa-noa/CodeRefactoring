class BweetsController < ApplicationController
  
  def index
    @bweets = Bweet.order("created_at DESC").limit(10)
  end

  def create
  	@bweets = Bweet.order("created_at DESC").limit(10)
    @bweet = Bweet.new(bweet_params)
    respond_to do |format|
        if @bweet.save
            format.js
        else
            render "index"
        end
    end
  end

  private

    def bweet_params
        params.permit(:description)
    end
end
