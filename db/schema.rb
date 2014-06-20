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

ActiveRecord::Schema.define(version: 20140620080823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "moderator_id"
    t.integer  "category_id"
    t.string   "banner"
    t.integer  "post_count"
    t.integer  "comment_count"
  end

  add_index "boards", ["category_id"], name: "index_boards_on_category_id", using: :btree
  add_index "boards", ["moderator_id"], name: "index_boards_on_moderator_id", using: :btree

  create_table "boards_labels", id: false, force: true do |t|
    t.integer "board_id"
    t.integer "label_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "parent_id"
  end

  add_index "comments", ["parent_id"], name: "index_comments_on_parent_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "labels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "board_id"
    t.integer  "label_id"
    t.integer  "comment_count"
  end

  add_index "posts", ["board_id"], name: "index_posts_on_board_id", using: :btree
  add_index "posts", ["label_id"], name: "index_posts_on_label_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "nick"
    t.string   "name"
    t.string   "passwd"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "email"
    t.string   "mobile"
    t.string   "activation_key"
    t.boolean  "activated"
    t.string   "id_scan_file_name"
    t.string   "id_scan_content_type"
    t.integer  "id_scan_file_size"
    t.datetime "id_scan_updated_at"
    t.boolean  "identified"
    t.boolean  "reg_completed"
  end

end
