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

ActiveRecord::Schema.define(version: 2020_04_23_163058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "year_id", null: false
    t.string "url", null: false
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

  create_table "votes", force: :cascade do |t|
    t.datetime "date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "user_id", null: false
    t.bigint "nominee_id", null: false
    t.boolean "verified", default: true
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
