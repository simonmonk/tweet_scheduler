class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :status
      t.string :image
      t.timestamp :last_tweeted
      t.integer :frequency

      t.timestamps
    end
  end
end
