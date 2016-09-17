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

ActiveRecord::Schema.define(version: 20160711012347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "diets", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "name"
    t.string   "goal"
    t.string   "description"
    t.float    "calories"
    t.float    "protein_percentage"
    t.float    "carbohydrate_percentage"
    t.float    "fat_percentage"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "diets", ["person_id"], name: "index_diets_on_person_id", using: :btree

  create_table "diets_foods", id: false, force: :cascade do |t|
    t.integer "diet_id", null: false
    t.integer "food_id", null: false
  end

  create_table "diets_meals", id: false, force: :cascade do |t|
    t.integer "diet_id", null: false
    t.integer "meal_id", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.float    "size"
    t.string   "unit"
    t.float    "calories"
    t.float    "protein"
    t.float    "carbohydrate"
    t.float    "fat"
    t.boolean  "high_protein"
    t.boolean  "high_carbohydrate"
    t.boolean  "high_fat"
    t.boolean  "breakfast"
    t.boolean  "lunch"
    t.boolean  "dinner"
    t.boolean  "snack"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "foods_people", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "person_id"
    t.boolean  "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.float    "calories"
    t.float    "protein_percentage"
    t.float    "carbohydrate_percentage"
    t.float    "fat_percentage"
    t.time     "time"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "meals_portions", id: false, force: :cascade do |t|
    t.integer "meal_id",    null: false
    t.integer "portion_id", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.float    "height"
    t.float    "weight"
    t.integer  "age"
    t.string   "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portions", force: :cascade do |t|
    t.integer  "food_id"
    t.float    "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "portions", ["food_id"], name: "index_portions_on_food_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "users", ["person_id"], name: "index_users_on_person_id", using: :btree

  add_foreign_key "comments", "articles"
end
