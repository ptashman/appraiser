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

ActiveRecord::Schema.define(version: 20151228203712) do

  create_table "census_records", force: :cascade do |t|
    t.integer  "zip"
    t.integer  "population"
    t.integer  "population_male"
    t.integer  "population_female"
    t.integer  "median_age"
    t.integer  "median_age_male"
    t.integer  "median_age_female"
    t.integer  "population_race_white"
    t.integer  "population_race_black"
    t.integer  "population_amerindian"
    t.integer  "population_race_asian"
    t.integer  "population_race_pacific"
    t.integer  "population_race_other"
    t.integer  "population_race_multi"
    t.integer  "population_race_latino"
    t.integer  "households"
    t.integer  "husband_wife_households"
    t.integer  "single_father_household"
    t.integer  "single_mother_household"
    t.integer  "non_family_households"
    t.integer  "house_holder15to24"
    t.integer  "house_holder25to34"
    t.integer  "house_holder35to44"
    t.integer  "house_holder45to54"
    t.integer  "house_holder55to59"
    t.integer  "house_holder60to64"
    t.integer  "house_holder65to74"
    t.integer  "house_holder75to84"
    t.integer  "house_holder85over"
    t.integer  "households_with60_plus"
    t.integer  "households_with75_plus"
    t.integer  "households2_person"
    t.integer  "households3_person"
    t.integer  "households4_person"
    t.integer  "households5_person"
    t.integer  "households6_person"
    t.integer  "households7_plus_person"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "credit_score"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "price"
    t.string   "beds"
    t.string   "bathrooms"
    t.string   "sqfeet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
