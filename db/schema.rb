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

ActiveRecord::Schema.define(version: 2018_09_09_173309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cases", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "author_type"
    t.bigint "author_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_comments_on_author_type_and_author_id"
  end

  create_table "contexts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "recordable_type"
    t.bigint "recordable_id"
    t.string "recordable_previous_type"
    t.bigint "recordable_previous_id"
    t.bigint "context_id"
    t.integer "creator_id"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["context_id"], name: "index_events_on_context_id"
    t.index ["recordable_previous_type", "recordable_previous_id"], name: "index_events_on_recordable_previous"
    t.index ["recordable_type", "recordable_id"], name: "index_events_on_recordable_type_and_recordable_id"
  end

  create_table "recordings", force: :cascade do |t|
    t.bigint "context_id"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["context_id"], name: "index_recordings_on_context_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "contexts"
  add_foreign_key "recordings", "contexts"
end
