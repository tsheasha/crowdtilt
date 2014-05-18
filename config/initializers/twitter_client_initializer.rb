TwitterClient = Twitter::REST::Client.new do |config|
    config.consumer_key= "CFU7FOLB6FXY02qJ46Lhx1R9t" #ENV["TWITTER_API_KEY"]
    config.consumer_secret = "5SJ6OdLEkoJC2Z2cgL5AFxWEswNPqAMCENyWH7NBl9xQ8fe6Sa" #ENV["TWITTER_API_SECRET"]
end
