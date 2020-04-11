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

ActiveRecord::Schema.define(version: 2020_04_10_183952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "match_teams", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "team_id"
    t.integer "runs_scored", default: 0
    t.integer "balls_played", default: 0
    t.integer "runs_conceded", default: 0
    t.integer "balls_bowled", default: 0
    t.integer "outcome", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_match_teams_on_match_id"
    t.index ["team_id"], name: "index_match_teams_on_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "number", default: "1"
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "url"
    t.integer "status", default: 0
    t.bigint "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "short_name"
    t.string "victory_margin"
    t.bigint "vault_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.integer "no_results", default: 0
    t.decimal "net_run_rate", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_name", limit: 10
    t.integer "points", default: 0
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vaults", force: :cascade do |t|
    t.bigint "team_1_id"
    t.bigint "team_2_id"
    t.integer "team_1_score", default: 0
    t.integer "team_1_wickets", default: 0
    t.decimal "team_1_overs", precision: 10, scale: 1, default: "0.0"
    t.decimal "team_1_run_rate", precision: 10, scale: 4, default: "0.0"
    t.integer "team_1_extras", default: 0
    t.integer "team_2_score", default: 0
    t.integer "team_2_wickets", default: 0
    t.decimal "team_2_overs", precision: 10, scale: 1, default: "0.0"
    t.decimal "team_2_run_rate", precision: 10, scale: 4, default: "0.0"
    t.integer "team_2_extras", default: 0
    t.string "victory_margin"
    t.jsonb "team_1_batting", default: {}
    t.jsonb "team_2_bowling", default: {}
    t.jsonb "team_2_batting", default: {}
    t.jsonb "team_1_bowling", default: {}
    t.text "raw_input"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "match_teams", "matches"
  add_foreign_key "match_teams", "teams"
end
