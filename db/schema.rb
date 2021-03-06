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

ActiveRecord::Schema.define(version: 20160706232329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_tokens", force: :cascade do |t|
    t.string   "label",                     null: false
    t.string   "token",                     null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "client_tokens", ["token"], name: "index_client_tokens_on_token", unique: true, using: :btree

  create_table "session_tokens", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "token",      null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "session_tokens", ["token"], name: "index_session_tokens_on_token", unique: true, using: :btree
  add_index "session_tokens", ["user_id"], name: "index_session_tokens_on_user_id", using: :btree

  create_table "setting_goals", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "target",     default: 2, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "setting_goals", ["user_id"], name: "index_setting_goals_on_user_id", using: :btree

  create_table "setting_pipelines", force: :cascade do |t|
    t.integer  "user_id",                        null: false
    t.integer  "days_between_views", default: 2, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "last_viewed_at"
  end

  add_index "setting_pipelines", ["user_id"], name: "index_setting_pipelines_on_user_id", using: :btree

  create_table "todos", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.string   "task",                       null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "position"
    t.boolean  "completed",  default: false, null: false
    t.boolean  "active",     default: false, null: false
  end

  add_index "todos", ["user_id"], name: "index_todos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                               null: false
    t.string   "password_digest",                     null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "timezone",        default: "Etc/UTC", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "session_tokens", "users"
  add_foreign_key "setting_goals", "users"
  add_foreign_key "setting_pipelines", "users"
  add_foreign_key "todos", "users"
end
