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

ActiveRecord::Schema.define(version: 20150312145349) do

  create_table "event_registrations", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile_no"
    t.string   "college"
    t.string   "token"
    t.decimal  "amount",     precision: 5, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "event_registrations", ["user_id"], name: "index_event_registrations_on_user_id"

  create_table "event_registrations_events", force: :cascade do |t|
    t.integer "event_registration_id"
    t.integer "event_id"
  end

  add_index "event_registrations_events", ["event_id"], name: "index_event_registrations_events_on_event_id"
  add_index "event_registrations_events", ["event_registration_id"], name: "index_event_registrations_events_on_event_registration_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.decimal  "registration_fee"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
