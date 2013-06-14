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

ActiveRecord::Schema.define(:version => 20130614151140) do

  create_table "ppwm_matcher_codes", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ppwm_matcher_codes", ["value"], :name => "index_ppwm_matcher_codes_on_value", :unique => true

  create_table "ppwm_matcher_users", :force => true do |t|
    t.string   "email"
    t.integer  "code_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "gravatar_id"
    t.string   "github_login"
    t.string   "name"
  end

  add_index "ppwm_matcher_users", ["github_login"], :name => "index_ppwm_matcher_users_on_github_login", :unique => true

end
