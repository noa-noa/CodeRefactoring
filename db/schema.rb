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

ActiveRecord::Schema.define(version: 20151113114859) do

  create_table "answers", force: :cascade do |t|
    t.text     "body"
    t.integer  "question_id"
    t.integer  "like",        default: 0
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "bweets", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "follows", ["followed_id"], name: "index_follows_on_followed_id"
  add_index "follows", ["follower_id", "followed_id"], name: "index_follows_on_follower_id_and_followed_id", unique: true
  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id"

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "theme"
    t.text     "code"
    t.string   "tag"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "test"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "liker_id"
    t.integer  "liked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "relationships", ["liked_id"], name: "index_relationships_on_liked_id"
  add_index "relationships", ["liker_id", "liked_id"], name: "index_relationships_on_liker_id_and_liked_id", unique: true
  add_index "relationships", ["liker_id"], name: "index_relationships_on_liker_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "provider",                     null: false
    t.string   "uid",                          null: false
    t.string   "nickname",                     null: false
    t.string   "image_url",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "introduction"
    t.integer  "speed_score",      default: 0
    t.integer  "readable_score",   default: 0
    t.integer  "row_score",        default: 0
    t.integer  "recyclable_score", default: 0
    t.integer  "total",            default: 0
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true

end
