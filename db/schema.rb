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

ActiveRecord::Schema.define(version: 2019_11_25_172245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.boolean "day_care"
    t.boolean "active"
    t.float "total_price"
    t.bigint "user_id"
    t.bigint "kennel_id"
    t.bigint "dog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_bookings_on_dog_id"
    t.index ["kennel_id"], name: "index_bookings_on_kennel_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "breed"
    t.text "dietry_requirements"
    t.text "medications"
    t.bigint "user_id"
    t.bigint "vet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["user_id"], name: "index_dogs_on_user_id"
    t.index ["vet_id"], name: "index_dogs_on_vet_id"
  end

  create_table "kennel_photos", force: :cascade do |t|
    t.string "url"
    t.bigint "kennel_id"
    t.bigint "user_id"
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["kennel_id"], name: "index_kennel_photos_on_kennel_id"
    t.index ["user_id"], name: "index_kennel_photos_on_user_id"
  end

  create_table "kennels", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "capacity"
    t.text "description"
    t.integer "total_rating"
    t.boolean "day_care"
    t.boolean "dog_walking"
    t.boolean "behaviorist"
    t.float "daily_price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_kennels_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "description"
    t.integer "rating"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vets", force: :cascade do |t|
    t.string "clinic_name"
    t.string "primary_veterinarian"
    t.string "address"
    t.string "phone_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "dogs"
  add_foreign_key "bookings", "kennels"
  add_foreign_key "bookings", "users"
  add_foreign_key "dogs", "users"
  add_foreign_key "dogs", "vets"
  add_foreign_key "kennel_photos", "kennels"
  add_foreign_key "kennel_photos", "users"
  add_foreign_key "kennels", "users"
  add_foreign_key "reviews", "bookings"
end
