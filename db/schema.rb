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

ActiveRecord::Schema.define(version: 20160824153629) do

  create_table "users", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "location",                 null: false
    t.string   "availability",             null: false
    t.string   "uid",                      null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "dog_name"
    t.integer  "dog_age"
    t.string   "dog_breed"
    t.string   "dog_picture_file_name"
    t.string   "dog_picture_content_type"
    t.integer  "dog_picture_file_size"
    t.datetime "dog_picture_updated_at"
    t.string   "dog_picture_url"
    t.string   "email"
  end

end
