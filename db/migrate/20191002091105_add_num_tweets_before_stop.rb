class AddNumTweetsBeforeStop < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :num_tweets_before_stop, :integer
  end
end
