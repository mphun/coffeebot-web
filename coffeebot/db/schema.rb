# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130625180106) do

  create_table "analytics_usages", :force => true do |t|
    t.integer  "user_id"
    t.string   "username",         :limit => 128, :null => false
    t.string   "coffee_brew_type", :limit => 64,  :null => false
    t.float    "level"
    t.float    "percent_used"
    t.datetime "age",                             :null => false
  end

  create_table "brews", :force => true do |t|
    t.string   "brew_type", :limit => 64,                                           :null => false
    t.float    "level"
    t.integer  "filled_up",                                          :default => 0
    t.datetime "filled_at",                                                         :null => false
    t.enum     "state",     :limit => [:normal, :pumping, :removed]
  end

  add_index "brews", ["brew_type"], :name => "index_brews_on_brew_type", :unique => true

end
