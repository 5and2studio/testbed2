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

ActiveRecord::Schema.define(version: 20180317194134) do

  create_table "permissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.string "name", limit: 150
    t.string "verb", limit: 150
    t.string "noun", limit: 150
    t.string "conditions"
    t.index ["created_by_id"], name: "index_permissions_on_created_by_id"
    t.index ["updated_by_id"], name: "index_permissions_on_updated_by_id"
  end

  create_table "permissions_user_groups", force: :cascade do |t|
    t.integer "permission_id"
    t.integer "user_group_id"
    t.index ["permission_id"], name: "index_permissions_user_groups_on_permission_id"
    t.index ["user_group_id"], name: "index_permissions_user_groups_on_user_group_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.string "name", limit: 150
    t.index ["created_by_id"], name: "index_user_groups_on_created_by_id"
    t.index ["updated_by_id"], name: "index_user_groups_on_updated_by_id"
  end

  create_table "user_groups_users", force: :cascade do |t|
    t.integer "user_group_id"
    t.integer "user_id"
    t.index ["user_group_id"], name: "index_user_groups_users_on_user_group_id"
    t.index ["user_id"], name: "index_user_groups_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_admin"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["created_by_id"], name: "index_users_on_created_by_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["updated_by_id"], name: "index_users_on_updated_by_id"
  end

end
