# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20191002091105) do

  create_table "tweets", force: :cascade do |t|
    t.string   "status"
    t.string   "image"
    t.datetime "last_tweeted"
    t.integer  "frequency"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "times_tweeted"
    t.datetime "scheduled_for"
    t.         "twitter_account_id"
    t.boolean  "scheduled",              default: false
    t.string   "send_status"
    t.integer  "num_tweets_before_stop"
  end

  create_table "twitter_accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "consumer_key"
    t.string   "consumer_secret"
    t.string   "access_key"
    t.string   "access_secret"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
