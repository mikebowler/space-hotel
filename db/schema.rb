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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140701214536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "option_values", force: true do |t|
    t.text     "value"
    t.integer  "shared_session_id"
    t.integer  "option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", force: true do |t|
    t.string   "description"
    t.string   "key"
    t.string   "value_type"
    t.text     "possible_values"
    t.text     "default_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shared_sessions", force: true do |t|
    t.string   "title"
    t.string   "alpha_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
