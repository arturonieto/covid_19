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

ActiveRecord::Schema.define(version: 2020_05_20_015605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "daily_reports", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "region_id"
    t.bigint "suburb_id"
    t.datetime "date"
    t.integer "confirmed"
    t.integer "deaths"
    t.integer "recovered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_daily_reports_on_country_id"
    t.index ["region_id"], name: "index_daily_reports_on_region_id"
    t.index ["suburb_id"], name: "index_daily_reports_on_suburb_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "suburbs", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.bigint "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_suburbs_on_country_id"
    t.index ["region_id"], name: "index_suburbs_on_region_id"
  end

  add_foreign_key "daily_reports", "countries"
  add_foreign_key "daily_reports", "regions"
  add_foreign_key "daily_reports", "suburbs"
  add_foreign_key "regions", "countries"
  add_foreign_key "suburbs", "countries"
  add_foreign_key "suburbs", "regions"
end
