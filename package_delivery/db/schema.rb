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

ActiveRecord::Schema.define(version: 20161004051116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fa_q_main_lists", force: :cascade do |t|
    t.string   "FaqMainName"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fa_q_sub_lists", force: :cascade do |t|
    t.string   "SubFaqQuestion"
    t.text     "SubFaqAnswer"
    t.integer  "FaqMainLstId"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickup_histories", force: :cascade do |t|
    t.string   "condition"
    t.integer  "EmployeeId"
    t.integer  "PickupId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickups", force: :cascade do |t|
    t.string   "name"
    t.string   "company"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.integer  "number"
    t.integer  "shipment_amount"
    t.decimal  "weight"
    t.string   "location_type"
    t.string   "package_location"
    t.text     "instructions"
    t.date     "pickup_date"
    t.time     "pickup_time"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "employeeid",       default: 0,         null: false
    t.string   "pickupscondition", default: "Pending", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.text     "package_type"
    t.integer  "quantity"
    t.decimal  "length"
    t.decimal  "width"
    t.decimal  "height"
    t.text     "measurement"
    t.decimal  "weight"
    t.text     "wcategory"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "testimonies", force: :cascade do |t|
    t.string   "name"
    t.text     "text"
    t.decimal  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "identity"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "password_digest"
    t.string   "status",          default: "Available", null: false
  end

end
