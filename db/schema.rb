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

ActiveRecord::Schema.define(version: 20180611060416) do

  create_table "cities", force: :cascade do |t|
    t.integer "province_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "cell_phone"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "company_name"
    t.string "cell_phone"
    t.string "phone"
    t.string "website"
    t.string "address"
    t.integer "number_of_trucks"
    t.boolean "non_runners"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "driver_id"
    t.integer "service_type_id"
    t.integer "transport_type_id"
    t.string "reservation"
    t.string "direction"
    t.string "pickup_address"
    t.string "pickup_contact"
    t.string "delivery_address"
    t.string "delivery_contact"
    t.integer "transit_time"
    t.decimal "booking_deposit"
    t.decimal "balance_on_delivery"
    t.decimal "grand_total"
    t.decimal "tax"
    t.string "year_make_model"
    t.string "color"
    t.string "vin"
    t.string "plate"
    t.string "condition"
    t.string "estimated_pickup_date"
    t.decimal "driver_pay"
    t.string "security_question"
    t.string "security_password"
    t.string "shipping_from_province"
    t.string "shipping_from_city"
    t.string "shipping_to_province"
    t.string "shipping_to_city"
    t.text "notes"
    t.boolean "no_runner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.date "pick_up_date"
    t.date "delivery_date"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["driver_id"], name: "index_orders_on_driver_id"
    t.index ["service_type_id"], name: "index_orders_on_service_type_id"
    t.index ["transport_type_id"], name: "index_orders_on_transport_type_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.integer "driver_id"
    t.string "province_from"
    t.string "city_from"
    t.string "province_to"
    t.string "city_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_routes_on_driver_id"
  end

  create_table "service_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transport_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twilio_confs", force: :cascade do |t|
    t.string "acct_id"
    t.string "auth_token"
    t.string "phone_number"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
