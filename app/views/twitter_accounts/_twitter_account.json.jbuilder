json.extract! twitter_account, :id, :name, :consumer_key, :consumer_secret, :access_key, :access_secret, :created_at, :updated_at
json.url twitter_account_url(twitter_account, format: :json)
