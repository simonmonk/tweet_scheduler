class CreateTwitterAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :twitter_accounts do |t|
      t.string :name
      t.string :consumer_key
      t.string :consumer_secret
      t.string :access_key
      t.string :access_secret

      t.timestamps
    end
  end
end
