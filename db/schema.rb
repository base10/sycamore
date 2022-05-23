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

ActiveRecord::Schema[7.0].define(version: 2022_05_19_011752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "slug", limit: 250, null: false
    t.string "title"
    t.text "summary"
    t.text "body", null: false
    t.boolean "published", default: true, null: false
    t.boolean "private", default: false, null: false
    t.bigint "user_id", null: false
    t.bigint "site_id", null: false
    t.date "published_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_articles_on_site_id"
    t.index ["slug", "published_on"], name: "index_articles_on_slug_and_published_on", unique: true
    t.index ["slug"], name: "index_articles_on_slug"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name", null: false
    t.string "url", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sites_on_name", unique: true
    t.index ["url"], name: "index_sites_on_url", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "sites"
  add_foreign_key "articles", "users"
end
