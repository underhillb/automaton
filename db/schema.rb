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

ActiveRecord::Schema.define(version: 20161015103512) do

  create_table "blueprint_objects", force: :cascade do |t|
    t.integer  "object_type_id"
    t.integer  "catalog_item_id"
    t.integer  "blueprint_id"
    t.string   "name"
    t.text     "description"
    t.integer  "version"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["blueprint_id"], name: "index_blueprint_objects_on_blueprint_id"
    t.index ["catalog_item_id"], name: "index_blueprint_objects_on_catalog_item_id"
    t.index ["object_type_id"], name: "index_blueprint_objects_on_object_type_id"
  end

  create_table "blueprints", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "version"
    t.integer  "user_id"
    t.string   "group"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_blueprints_on_user_id"
  end

  create_table "catalog_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "configuration_detail_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "configuration_details", force: :cascade do |t|
    t.integer  "configuration_template_id"
    t.integer  "configuration_detail_type_id"
    t.integer  "configuration_detail_order"
    t.text     "configuration_detail_data"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["configuration_detail_type_id"], name: "index_configuration_details_on_configuration_detail_type_id"
    t.index ["configuration_template_id"], name: "index_configuration_details_on_configuration_template_id"
  end

  create_table "configuration_files", force: :cascade do |t|
    t.integer  "configuration_template_id"
    t.integer  "version"
    t.text     "file_content"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["configuration_template_id"], name: "index_configuration_files_on_configuration_template_id"
  end

  create_table "configuration_templates", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "blueprint_objects_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["blueprint_objects_id"], name: "index_configuration_templates_on_blueprint_objects_id"
  end

  create_table "object_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
