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

ActiveRecord::Schema.define(version: 2018_08_14_204101) do

  create_table "accent_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accents", force: :cascade do |t|
    t.integer "actors_id"
    t.integer "languages_id"
    t.integer "accent_types_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accent_types_id"], name: "index_accents_on_accent_types_id"
    t.index ["actors_id"], name: "index_accents_on_actors_id"
    t.index ["languages_id"], name: "index_accents_on_languages_id"
  end

  create_table "actors", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.float "height"
    t.integer "manager_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photos"
    t.string "videos"
    t.string "confirmed", default: "N"
    t.string "phone"
    t.date "birth_date"
    t.string "location"
    t.index ["manager_id"], name: "index_actors_on_manager_id"
    t.index ["user_id"], name: "index_actors_on_user_id"
  end

  create_table "actors_languages", id: false, force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "language_id", null: false
  end

  create_table "casting_messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "castings", force: :cascade do |t|
    t.integer "character_id"
    t.integer "actor_id"
    t.integer "manager_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_castings_on_actor_id"
    t.index ["character_id"], name: "index_castings_on_character_id"
    t.index ["manager_id"], name: "index_castings_on_manager_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "open"
    t.integer "actor_id"
    t.integer "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "project_name"
    t.date "shooting_start"
    t.date "shooting_end"
    t.date "deadline"
    t.index ["actor_id"], name: "index_characters_on_actor_id"
    t.index ["manager_id"], name: "index_characters_on_manager_id"
  end

  create_table "citizenships", id: false, force: :cascade do |t|
    t.integer "actors_id"
    t.integer "countries_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actors_id"], name: "index_citizenships_on_actors_id"
    t.index ["countries_id"], name: "index_citizenships_on_countries_id"
  end

  create_table "countries", primary_key: "country_code", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "phone"
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "role_id"
    t.string "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_roles_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "login"
    t.string "password"
    t.string "password_digest"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["group_id"], name: "index_users_on_group_id"
  end

  create_table "visa_types", force: :cascade do |t|
    t.string "name"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_visa_types_on_country_id"
  end

  create_table "visas", force: :cascade do |t|
    t.string "status"
    t.date "begin"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_permits", id: false, force: :cascade do |t|
    t.integer "actors_id"
    t.integer "countries_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actors_id"], name: "index_work_permits_on_actors_id"
    t.index ["countries_id"], name: "index_work_permits_on_countries_id"
  end

end
