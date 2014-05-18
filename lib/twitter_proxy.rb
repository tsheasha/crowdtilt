module TwitterProxy

    def self.get_friends(username)
        friends = TwitterClient.friend_ids(username)

        #Exhausting cursor for case > 5000 friends        
        while friends.attrs['next_cursor'] != friends.attrs['previous_cursor']
            remaining_friends = TwitterClient.friend_ids(username, {cursor: friends.attrs['next_cursor']})
            friends += remaining_friends
        end
        friends
    end
    def self.get_friend_intersection(first_username, second_username)
        #Using sets for a more optimized intersection algorithm for
        #friend's IDs        
        first_friends = get_friends(first_username).to_set
        second_friends = get_friends(second_username).to_set

        lookup_ids(first_friends & second_friends)
    end 
    
    def self.lookup_ids(user_ids)
        # Exhaust user_ids list in case more than 100 ids
        friend_count = 0
        user_ids = user_ids.to_a
        while friend_count < user_ids.size
            user_ids[friend_count,100] = TwitterClient.users(user_ids[friend_count,100])
            friend_count += 100
        end
        user_ids
    end

    def self.recent_tweets(username)
        tweets = TwitterClient.user_timeline(username)
    end
   
end
