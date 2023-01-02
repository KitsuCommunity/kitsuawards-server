# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2021_01_06_114244) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blacklists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "username", null: false
    t.boolean "acc_too_recent", default: false
    t.boolean "acc_not_enough_entries", default: false
    t.boolean "acc_non_verified_email", default: false
    t.boolean "acc_default_pfp", default: false
    t.boolean "verified"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "year_id", null: false
    t.string "url", null: false
    t.datetime "start"
    t.datetime "end"
    t.index ["year_id"], name: "index_categories_on_year_id"
  end

  create_table "judges", force: :cascade do |t|
    t.integer "user_id", null: false
    t.bigint "year_id", null: false
    t.index ["year_id"], name: "index_judges_on_year_id"
  end

  create_table "nominees", force: :cascade do |t|
    t.bigint "subcategory_id", null: false
    t.string "name", null: false
    t.string "media", null: false
    t.index ["subcategory_id"], name: "index_nominees_on_subcategory_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "user_id", null: false
    t.bigint "nominee_id", null: false
    t.bigint "subcategories_id"
    t.index ["nominee_id"], name: "index_votes_on_nominee_id"
    t.index ["subcategories_id"], name: "index_votes_on_subcategories_id"
  end

  create_table "years", force: :cascade do |t|
    t.datetime "start", null: false
    t.datetime "end", null: false
    t.boolean "show_results", default: false
    t.string "description", null: false
  end

  add_foreign_key "categories", "years"
  add_foreign_key "judges", "years"
  add_foreign_key "nominees", "subcategories"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "votes", "nominees"
end
