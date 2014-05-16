module TwitterProxy

    def self.get_friend_intersection(first_username, second_username)
        #TODO exhaust cursor for case > 5000 friends
        # Move client to a better place (load on init
        # move keys to env var
        client = Twitter::REST::Client.new do |config|
            config.consumer_key= "CFU7FOLB6FXY02qJ46Lhx1R9t"
            config.consumer_secret = "5SJ6OdLEkoJC2Z2cgL5AFxWEswNPqAMCENyWH7NBl9xQ8fe6Sa"
        end
        first_friends = client.friend_ids(first_username).to_a
        second_friends = client.friend_ids(second_username).to_a
        first_friends & second_friends
    end 
    
    def self.lookup_ids(user_ids)
        #TODO exhaust user_ids list
        client = Twitter::REST::Client.new do |config|
            config.consumer_key= "CFU7FOLB6FXY02qJ46Lhx1R9t"
            config.consumer_secret = "5SJ6OdLEkoJC2Z2cgL5AFxWEswNPqAMCENyWH7NBl9xQ8fe6Sa"
        end
        users = client.users(user_ids)
    end

    def self.recent_tweets(username)
        client = Twitter::REST::Client.new do |config|
            config.consumer_key= "CFU7FOLB6FXY02qJ46Lhx1R9t"
            config.consumer_secret = "5SJ6OdLEkoJC2Z2cgL5AFxWEswNPqAMCENyWH7NBl9xQ8fe6Sa"
        end
        tweets = client.user_timeline(username)
    end
   
end
