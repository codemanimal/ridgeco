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

ActiveRecord::Schema.define(version: 20160314155940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brokers", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "cell"
    t.string   "office"
    t.string   "fax"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.text     "about"
    t.text     "portrait"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin"
  end

  create_table "brokers_listings", id: false, force: :cascade do |t|
    t.integer "broker_id",  null: false
    t.integer "listing_id", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "unit"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "listing_type"
    t.integer  "bedroom"
    t.integer  "bathroom"
    t.string   "sqft"
    t.string   "detail"
    t.string   "feature"
    t.text     "description"
    t.integer  "mls_id"
    t.text     "mls_url"
    t.boolean  "is_sold?"
    t.boolean  "is_in_contract?"
    t.boolean  "is_under_review?"
    t.text     "asset1"
    t.text     "asset2"
    t.text     "asset3"
    t.text     "asset4"
    t.text     "asset5"
    t.text     "asset6"
    t.text     "asset7"
    t.text     "asset8"
    t.text     "asset9"
    t.text     "asset10"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_rental"
    t.boolean  "is_sale"
    t.boolean  "is_development"
    t.boolean  "is_featured"
    t.integer  "price",            default: 0
  end

end
