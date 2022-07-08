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

ActiveRecord::Schema.define(version: 2022_07_08_183847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.integer "gender"
    t.integer "total_book"
    t.text "summary"
    t.datetime "born"
    t.datetime "died"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "isbn"
    t.string "original_title"
    t.integer "year"
    t.bigint "author_id", null: false
    t.text "plot"
    t.string "copyright"
    t.string "title"
    t.float "average_rating"
    t.integer "rating_count"
    t.string "similiar_book_ids"
    t.text "description"
    t.string "loc_class"
    t.integer "pages"
    t.string "language"
    t.string "isbn13"
    t.datetime "release_date"
    t.text "summary"
    t.boolean "content_cleaned"
    t.boolean "content_available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "social_sources", force: :cascade do |t|
    t.integer "sourceable_id"
    t.string "sourceable_type"
    t.string "url"
    t.boolean "found"
    t.string "type_source"
    t.integer "year"
    t.integer "num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "books", "authors"
end
