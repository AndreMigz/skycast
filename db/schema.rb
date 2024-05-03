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

ActiveRecord::Schema[7.1].define(version: 2024_05_02_175042) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.decimal "longitude", precision: 10, scale: 6
    t.decimal "latitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.string "main"
    t.string "description"
    t.decimal "temperature", precision: 5, scale: 2
    t.decimal "wind_speed", precision: 5, scale: 2
    t.decimal "humidity", precision: 5, scale: 2
    t.decimal "real_feel", precision: 5, scale: 2
    t.decimal "cloudiness", precision: 5, scale: 2
    t.decimal "pressure", precision: 6, scale: 2
    t.integer "visibility", limit: 2
    t.decimal "max_temperature", precision: 5, scale: 2
    t.decimal "min_temperature", precision: 5, scale: 2
    t.datetime "sunrise"
    t.datetime "sunset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_weathers_on_location_id"
  end

  add_foreign_key "weathers", "locations"
end
