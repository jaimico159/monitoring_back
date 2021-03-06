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

ActiveRecord::Schema.define(version: 2022_01_13_093850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contract_engineers", force: :cascade do |t|
    t.bigint "engineer_id", null: false
    t.bigint "contract_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contract_id"], name: "index_contract_engineers_on_contract_id"
    t.index ["engineer_id"], name: "index_contract_engineers_on_engineer_id"
  end

  create_table "contract_plan_days", force: :cascade do |t|
    t.date "current_date"
    t.bigint "contract_plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contract_plan_id"], name: "index_contract_plan_days_on_contract_plan_id"
  end

  create_table "contract_plans", force: :cascade do |t|
    t.bigint "contract_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "slot_duration"
    t.integer "time_slots_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contract_id"], name: "index_contract_plans_on_contract_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "name"
    t.datetime "start_at", precision: 6
    t.datetime "end_at", precision: 6
    t.integer "slot_duration"
    t.integer "contract_duration"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_contracts_on_company_id"
  end

  create_table "engineers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "display_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "engineer_id", null: false
    t.bigint "time_slot_id", null: false
    t.datetime "completed_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["engineer_id"], name: "index_reservations_on_engineer_id"
    t.index ["time_slot_id"], name: "index_reservations_on_time_slot_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.datetime "start_at", precision: 6
    t.integer "duration"
    t.bigint "contract_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "contract_plan_id"
    t.integer "engineer_id"
    t.bigint "contract_plan_day_id"
    t.index ["contract_id"], name: "index_time_slots_on_contract_id"
    t.index ["contract_plan_day_id"], name: "index_time_slots_on_contract_plan_day_id"
    t.index ["contract_plan_id"], name: "index_time_slots_on_contract_plan_id"
    t.index ["engineer_id"], name: "index_time_slots_on_engineer_id"
  end

  add_foreign_key "contract_engineers", "contracts"
  add_foreign_key "contract_engineers", "engineers"
  add_foreign_key "contract_plan_days", "contract_plans"
  add_foreign_key "contract_plans", "contracts"
  add_foreign_key "contracts", "companies"
  add_foreign_key "reservations", "engineers"
  add_foreign_key "reservations", "time_slots"
  add_foreign_key "time_slots", "contract_plan_days"
  add_foreign_key "time_slots", "contract_plans"
  add_foreign_key "time_slots", "contracts"
end
