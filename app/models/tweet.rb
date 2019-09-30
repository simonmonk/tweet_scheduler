require 'twitter'

class Tweet < ApplicationRecord
    
    belongs_to :twitter_account
    
    def tweet()
        failed = false
        acc = TwitterAccount.find(self.twitter_account_id)
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = acc.consumer_key
            config.consumer_secret     = acc.consumer_secret
            config.access_token        = acc.access_key
            config.access_token_secret = acc.access_secret
        end
        
        if (self.image && self.image != '')
            begin
                image_file = File.new("public/images/" + self.image)
                puts image_file
                client.update_with_media(self.status, image_file)
            rescue Exception => e
                self.send_status = "FAILED: " + e.to_s
                failed = true
            end
        else
            begin
                client.update(self.status)
            rescue Exception => e
                self.send_status = "FAILED: " + e.to_s
                failed = true
            end 
        end
        if (! failed)
            if (not self.times_tweeted)
                self.times_tweeted = 0
            end
            self.send_status = "Sent OK"
            self.times_tweeted += 1
            self.last_tweeted = Time.now()
        end
        self.save
    end
    
end
