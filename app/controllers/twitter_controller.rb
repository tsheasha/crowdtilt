class TwitterController < ApplicationController

  #Returns most recent tweets of a user.
  def tweets
     user = params[:username]
     #Calls TwitterProxy method to get recent tweets of a user     
     @tweets = TwitterProxy.recent_tweets(user)
     #Choosing the text attribute of the tweet to display.
     tweets_json = @tweets.map{|x| x.attrs.select{|key, value| [:text].include?(key)}}
     render json: [tweets_json.to_json]
  rescue
     #In case there is a rate limit exceeded.
     render json: []
  end

  def common_friends
     first_user = params[:first_user]
     second_user = params[:second_user]
     #Calls TwitterProxy method to get common friends between users
     @users = TwitterProxy.get_friend_intersection(first_user, second_user)
     #Choosing the name, screen_name, and profile_image_url attribute of the common user to display.     
     users_json = @users.map{|x| x.attrs.select{|key, value| [:name,:screen_name,:profile_image_url].include?(key)}}
     render json: [users_json.to_json]
  rescue
     #In case there is a rate limit exceeded.
     render json: []
  end
    
  #Returns main page that contains forms with recent tweets
  #and common friends functionalities
  def index 
  end
end
