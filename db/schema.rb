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

ActiveRecord::Schema.define(version: 2022_01_30_054117) do

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.text "instruction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes_ingredients", id: false, force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
    t.index ["ingredient_id"], name: "index_recipes_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipes_ingredients_on_recipe_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "ocena"
    t.integer "user_id", null: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_reviews_on_recipe_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "stockpiles", id: false, force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_stockpiles_on_ingredient_id"
    t.index ["user_id"], name: "index_stockpiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token"
    t.index ["token"], name: "index_users_on_token"
  end

  add_foreign_key "reviews", "recipes"
  add_foreign_key "reviews", "users"
end
