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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140209003918) do

  create_table "ingredient_meals", :id => false, :force => true do |t|
    t.integer  "meal_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "ingredient_meals", ["ingredient_id"], :name => "index_ingredient_meals_on_ingredient_id"
  add_index "ingredient_meals", ["meal_id"], :name => "index_ingredient_meals_on_meal_id"

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.integer  "calories"
    t.integer  "protein"
    t.integer  "carbs"
    t.decimal  "price",        :precision => 5, :scale => 2
    t.integer  "serving_size"
    t.integer  "servings"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "meals", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "prep_time"
    t.string   "clean_up"
    t.boolean  "homemade",    :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id"
  end

  create_table "statuses", :force => true do |t|
    t.integer  "remaining_calories"
    t.integer  "remaining_protein"
    t.integer  "remaining_carbs"
    t.integer  "weight"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "age"
    t.string   "gender"
    t.integer  "weight"
    t.integer  "feet"
    t.integer  "inches"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end