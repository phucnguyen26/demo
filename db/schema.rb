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

ActiveRecord::Schema.define(version: 20141128081244) do

  create_table "answers", force: true do |t|
    t.string   "content"
    t.boolean  "correct"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["word_id"], name: "index_answers_on_word_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_words", force: true do |t|
    t.integer  "word_id"
    t.integer  "answer_id"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lesson_words", ["answer_id"], name: "index_lesson_words_on_answer_id", using: :btree
  add_index "lesson_words", ["lesson_id"], name: "index_lesson_words_on_lesson_id", using: :btree
  add_index "lesson_words", ["word_id"], name: "index_lesson_words_on_word_id", using: :btree

  create_table "lessons", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "categorie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons", ["categorie_id"], name: "index_lessons_on_categorie_id", using: :btree
  add_index "lessons", ["user_id"], name: "index_lessons_on_user_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  create_table "words", force: true do |t|
    t.string   "english"
    t.integer  "categorie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["categorie_id"], name: "index_words_on_categorie_id", using: :btree

end
