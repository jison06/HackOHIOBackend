# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_14_065308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "workout"
    t.string "description"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_cards_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.integer "score", default: 0, null: false
    t.string "difficulty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.text "bio"
    t.integer "score", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "user_cards", force: :cascade do |t|
    t.bigint "user_set_id"
    t.bigint "card_id"
    t.datetime "completed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_user_cards_on_card_id"
    t.index ["user_set_id"], name: "index_user_cards_on_user_set_id"
  end

  create_table "user_decks", force: :cascade do |t|
    t.string "name"
    t.string "difficulty"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_decks_on_user_id"
  end

  create_table "user_sets", force: :cascade do |t|
    t.bigint "user_deck_id"
    t.datetime "completed_at"
    t.boolean "is_active", default: true, null: false
    t.boolean "is_saved", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_deck_id"], name: "index_user_sets_on_user_deck_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.integer "score", default: 0
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cards", "categories"
  add_foreign_key "profiles", "users"
  add_foreign_key "user_cards", "cards"
  add_foreign_key "user_cards", "user_sets"
  add_foreign_key "user_decks", "users"
  add_foreign_key "user_sets", "user_decks"
end
