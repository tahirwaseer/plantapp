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

ActiveRecord::Schema.define(version: 20170525150552) do

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "material_requirements", force: :cascade do |t|
    t.integer  "plant_id",               precision: 38
    t.date     "order_date"
    t.string   "item_code"
    t.string   "item_description"
    t.string   "item_type"
    t.string   "item_type_description"
    t.string   "uom"
    t.integer  "demand",                 precision: 38
    t.integer  "receipts",               precision: 38
    t.integer  "inv_on_hand",            precision: 38
    t.datetime "inventory_run_out_time", precision: 6
    t.datetime "created_at",             precision: 6,  null: false
    t.datetime "updated_at",             precision: 6,  null: false
  end

  add_index "material_requirements", ["plant_id"], name: "i_mat_req_pla_id"

  create_table "plants", force: :cascade do |t|
    t.string   "region_name"
    t.string   "plant_code"
    t.string   "plant_name"
    t.boolean  "Active"
    t.datetime "created_at",  precision: 6, null: false
    t.datetime "updated_at",  precision: 6, null: false
  end

  create_table "plants_users", id: false, force: :cascade do |t|
    t.integer "user_id",  precision: 38, null: false
    t.integer "plant_id", precision: 38, null: false
  end

  add_index "plants_users", ["plant_id", "user_id"], name: "i_pla_use_pla_id_use_id"
  add_index "plants_users", ["user_id", "plant_id"], name: "i_pla_use_use_id_pla_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                                 default: "",    null: false
    t.string   "encrypted_password",                    default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at",    precision: 6
    t.integer  "sign_in_count",          precision: 38, default: 0,     null: false
    t.datetime "current_sign_in_at",     precision: 6
    t.datetime "last_sign_in_at",        precision: 6
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",             precision: 6
    t.datetime "updated_at",             precision: 6
    t.string   "name"
    t.date     "effective_start_date"
    t.date     "effective_end_date"
    t.boolean  "admin",                                 default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "i_users_reset_password_token", unique: true

  add_foreign_key "material_requirements", "plants"
end
