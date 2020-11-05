# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_31_181239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "dwarf", id: :serial, force: :cascade do |t|
    t.text "email"
    t.text "cryptpwd"
    t.text "username"
    t.text "first_name"
    t.text "last_name"
    t.integer "dwarf_role"
    t.index ["email"], name: "dwarf_email_key", unique: true
    t.index ["username"], name: "dwarf_username_key", unique: true
  end

  create_table "dwarf_role", id: :serial, force: :cascade do |t|
    t.text "role_type"
  end

  create_table "reimbursement_request", id: :serial, force: :cascade do |t|
    t.integer "amount"
    t.datetime "submitted"
    t.datetime "resolved"
    t.text "description"
    t.binary "receipt"
    t.integer "dwarf_miner"
    t.integer "dwarf_overseer"
    t.integer "reimburse_type"
    t.integer "reimburse_status"
  end

  create_table "reimbursement_status", id: :serial, force: :cascade do |t|
    t.text "status"
  end

  create_table "reimbursement_type", id: :serial, force: :cascade do |t|
    t.text "reimburse_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "dwarf", "dwarf_role", column: "dwarf_role", name: "dwarf_dwarf_role_fkey"
  add_foreign_key "reimbursement_request", "dwarf", column: "dwarf_miner", name: "reimbursement_request_dwarf_miner_fkey"
  add_foreign_key "reimbursement_request", "dwarf", column: "dwarf_overseer", name: "reimbursement_request_dwarf_overseer_fkey"
  add_foreign_key "reimbursement_request", "reimbursement_status", column: "reimburse_status", name: "reimbursement_request_reimburse_status_fkey"
  add_foreign_key "reimbursement_request", "reimbursement_type", column: "reimburse_type", name: "reimbursement_request_reimburse_type_fkey"
end
