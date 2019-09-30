class AddFieldsToTweet < ActiveRecord::Migration[5.0]
  def change
      add_column :tweets, :times_tweeted, :integer
      add_column :tweets, :scheduled_for, :timestamp
  end
end
