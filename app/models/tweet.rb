require 'twitter'

class Tweet < ApplicationRecord
    
    belongs_to :twitter_account
    
    def tweet()
        puts "*********************** HERE ***************************"
        acc = TwitterAccount.find(self.twitter_account_id)
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = acc.consumer_key
            config.consumer_secret     = acc.consumer_secret
            config.access_token        = acc.access_key
            config.access_token_secret = acc.access_secret
        end
        
        if (self.image && self.image != '')
            image_file = File.new("public/images/" + self.image)
            puts image_file
#            client.update_with_media(self.status, image_file)
        else
#            client.update(self.status)
        end
        if (not self.times_tweeted)
            self.times_tweeted = 0
        end
        self.times_tweeted += 1
        self.last_tweeted = Time.now()
        self.save
    end
    
end
