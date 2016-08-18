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

ActiveRecord::Schema.define(version: 20160817194235) do

  create_table "books", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connections", force: :cascade do |t|
    t.string   "author_name"
    t.text     "url"
    t.text     "basis"
    t.integer  "connectable_id"
    t.string   "connectable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "author_name"
    t.text     "url"
    t.text     "basis"
    t.integer  "piece_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "links", ["piece_id"], name: "index_links_on_piece_id"

  create_table "pieces", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "author"
    t.string   "subject"
    t.text     "summary"
    t.string   "section"
    t.string   "links"
    t.text     "references"
    t.text     "thoughts"
    t.text     "questions"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.text     "broader_context"
    t.text     "summary"
    t.text     "key_questions_addressed"
    t.text     "thoughts"
    t.integer  "piece_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "sections", ["piece_id"], name: "index_sections_on_piece_id"

  create_table "subsections", force: :cascade do |t|
    t.string   "name"
    t.text     "broader_context"
    t.text     "summary"
    t.text     "key_questions_addressed"
    t.text     "thoughts"
    t.integer  "section_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "subsections", ["section_id"], name: "index_subsections_on_section_id"

  create_table "subsubsections", force: :cascade do |t|
    t.string   "name"
    t.text     "broader_context"
    t.text     "summary"
    t.text     "key_questions_addressed"
    t.text     "thoughts"
    t.integer  "subsection_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "subsubsections", ["subsection_id"], name: "index_subsubsections_on_subsection_id"

end
