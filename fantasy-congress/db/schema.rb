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

ActiveRecord::Schema.define(version: 20161112170830) do

  create_table "bills", force: :cascade do |t|
    t.string   "bill_type_label"
    t.string   "current_status"
    t.string   "current_status_date"
    t.string   "congress_number"
    t.string   "introduced_date"
    t.integer  "politician_id"
    t.string   "bill_number"
    t.boolean  "is_alive"
    t.boolean  "is_current"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["politician_id"], name: "index_bills_on_politician_id"
  end

  create_table "league_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_league_users_on_league_id"
    t.index ["user_id"], name: "index_league_users_on_user_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.datetime "draft_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "player_a_id"
    t.integer  "player_b_id"
    t.integer  "player_a_points", default: 0
    t.integer  "player_b_points", default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["player_a_id"], name: "index_matches_on_player_a_id"
    t.index ["player_b_id"], name: "index_matches_on_player_b_id"
  end

  create_table "politician_bills", force: :cascade do |t|
    t.string   "politician_role"
    t.integer  "politician_id"
    t.integer  "bill_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["bill_id"], name: "index_politician_bills_on_bill_id"
    t.index ["politician_id"], name: "index_politician_bills_on_politician_id"
  end

  create_table "politicians", force: :cascade do |t|
    t.boolean  "current",      null: false
    t.string   "end_date"
    t.string   "party",        null: false
    t.string   "first_name",   null: false
    t.string   "gender"
    t.integer  "photo_id",     null: false
    t.string   "last_name",    null: false
    t.string   "middle_name"
    t.string   "twitter_id"
    t.string   "role_type"
    t.string   "senator_rank"
    t.string   "start_date",   null: false
    t.string   "state",        null: false
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_politicians", force: :cascade do |t|
    t.string   "team_name"
    t.integer  "user_id"
    t.integer  "politician_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["politician_id"], name: "index_user_politicians_on_politician_id"
    t.index ["user_id"], name: "index_user_politicians_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username",                            null: false
    t.integer  "total_wins",             default: 0
    t.integer  "league_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["league_id"], name: "index_users_on_league_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end