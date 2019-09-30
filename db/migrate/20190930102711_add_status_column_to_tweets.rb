class AddStatusColumnToTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :send_status, :string
  end
end
