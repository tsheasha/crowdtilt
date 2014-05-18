class TwitterController < ApplicationController
  def tweets
     user = params[:username]
     @tweets = TwitterProxy.recent_tweets(user)
     tweets_json = @tweets.map{|x| x.attrs.select{|key, value| [:text].include?(key)}}
     render json: [tweets_json.to_json]
  end

  def common_friends
     first_user = params[:first_user]
     second_user = params[:second_user]
     @users = TwitterProxy.get_friend_intersection(first_user, second_user)
     puts @users.first.attrs.keys
     users_json = @users.map{|x| x.attrs.select{|key, value| [:name,:screen_name,:profile_image_url].include?(key)}}
     render json: [users_json.to_json]
  end

  def index
    
  end
end
