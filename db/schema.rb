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

ActiveRecord::Schema.define(version: 20140417065425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: true do |t|
    t.string   "category"
    t.string   "name"
    t.integer  "point"
    t.text     "question"
    t.text     "solution"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solutions", force: true do |t|
    t.integer  "challenge_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "solutions", ["challenge_id"], name: "index_solutions_on_challenge_id", using: :btree
  add_index "solutions", ["team_id"], name: "index_solutions_on_team_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_score"
    t.string   "name"
  end

  add_index "teams", ["email"], name: "index_teams_on_email", unique: true, using: :btree
  add_index "teams", ["reset_password_token"], name: "index_teams_on_reset_password_token", unique: true, using: :btree

end
