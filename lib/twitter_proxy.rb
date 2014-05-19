module TwitterProxy
    #Gets a list of ids of a user's friends
    def self.get_friends(username)
        #Invokes Twitter API for friends/ids to minimise API calls
        #since this API call returns a maximum of 5000 ids
        friends = TwitterClient.friend_ids(username)

        #Exhausting cursor for case > 5000 friends        
        while friends.attrs['next_cursor'] != friends.attrs['previous_cursor']
            remaining_friends = TwitterClient.friend_ids(username, {cursor: friends.attrs['next_cursor']})
            friends += remaining_friends
        end
        friends
    end

    #Gets the common friends between two user's friends using the 
    #intersection algorithm for a set, a better optimization than
    #the intersection algorithm for arrays
    def self.get_friend_intersection(first_username, second_username)
        #Using sets for a more optimized intersection algorithm for
        #friend's IDs        
        first_friends = get_friends(first_username).to_set
        second_friends = get_friends(second_username).to_set

        lookup_ids(first_friends & second_friends)
    end 
    
    #Gets the names of the users specified in the list 'user_ids'
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
    
    #Gets the most recent tweets performed by a specified user
    def self.recent_tweets(username)
        #Invokes Twitter API for user_timeline
        tweets = TwitterClient.user_timeline(username)
    end
   
end
