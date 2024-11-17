# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_09_155140) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adonis_schema", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "batch", null: false
    t.timestamptz "migration_time", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "adonis_schema_versions", primary_key: "version", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "address", limit: 255, null: false
    t.string "message", limit: 255, null: false
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", limit: 254, null: false
    t.string "password", limit: 255, null: false
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at"

    t.unique_constraint ["username"], name: "users_username_unique"
  end

end
