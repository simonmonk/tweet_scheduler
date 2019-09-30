class AddAccFieldToTweet < ActiveRecord::Migration[5.0]
  def change
      add_column :tweets, :twitter_account_id, :reference
  end
end
