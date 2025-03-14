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

ActiveRecord::Schema[8.0].define(version: 2025_02_26_121456) do
  create_table "bookings", force: :cascade do |t|
    t.integer "house_id", null: false
    t.date "day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id", "day"], name: "index_bookings_on_house_id_and_day", unique: true
    t.index ["house_id"], name: "index_bookings_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name", null: false
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_houses_on_name", unique: true
  end

  add_foreign_key "bookings", "houses"
end
