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

ActiveRecord::Schema[7.1].define(version: 2024_06_04_222111) do
  create_table "lists", force: :cascade do |t|
    t.text "name"
    t.text "detail"
    t.text "image"
    t.boolean "usable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reserves", force: :cascade do |t|
    t.text "user_id"
    t.date "start"
    t.date "end"
    t.integer "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "isRenting"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "image"
    t.boolean "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "user_id"
  end

end
