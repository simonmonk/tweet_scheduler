class AddScheduleFieldToTweet < ActiveRecord::Migration[5.0]
  def change
      add_column :tweets, :scheduled, :boolean, :default => false
  end
end
