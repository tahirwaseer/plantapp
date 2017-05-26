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

  create_table "material_requirements", force: :cascade do |t|
    t.integer  "plant_id"
    t.date     "order_date"
    t.string   "item_code"
    t.string   "item_description"
    t.string   "item_type"
    t.string   "item_type_description"
    t.string   "uom"
    t.integer  "demand"
    t.integer  "receipts"
    t.integer  "inv_on_hand"
    t.datetime "inventory_run_out_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["plant_id"], name: "index_material_requirements_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string   "region_name"
    t.string   "plant_code"
    t.string   "plant_name"
    t.boolean  "Active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "plants_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "plant_id", null: false
    t.index ["plant_id", "user_id"], name: "index_plants_users_on_plant_id_and_user_id"
    t.index ["user_id", "plant_id"], name: "index_plants_users_on_user_id_and_plant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.date     "effective_start_date"
    t.date     "effective_end_date"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
