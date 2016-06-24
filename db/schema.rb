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

ActiveRecord::Schema.define(version: 20160624153613) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "calendar_dates", force: :cascade do |t|
    t.date     "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "calendar_dates", ["day"], name: "index_calendar_dates_on_day", unique: true

  create_table "days", force: :cascade do |t|
    t.string   "country"
    t.integer  "year"
    t.integer  "month"
    t.integer  "day_of_month"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "holidays", force: :cascade do |t|
    t.string   "name"
    t.text     "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occurrences", force: :cascade do |t|
    t.integer  "holiday_id"
    t.integer  "calendar_date_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "occurrences", ["calendar_date_id"], name: "index_occurrences_on_calendar_date_id"
  add_index "occurrences", ["holiday_id"], name: "index_occurrences_on_holiday_id"

end
