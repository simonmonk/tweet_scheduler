json.extract! tweet, :id, :status, :image, :last_tweeted, :frequency, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
