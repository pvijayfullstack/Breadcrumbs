# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090709165909) do

  create_table "breadcrumbs", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.integer  "status_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "description"
    t.integer  "project_id"
    t.text     "notes"
    t.integer  "priority_id"
    t.integer  "status_id"
    t.integer  "parent_id"
    t.integer  "effort_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "parent"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.text     "notes"
    t.integer  "priority"
    t.integer  "status_id"
    t.integer  "parent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "effort_id"
    t.boolean  "working"
  end

end
