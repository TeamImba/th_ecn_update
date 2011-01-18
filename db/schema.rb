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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110116213331) do

  create_table "approvals", :force => true do |t|
    t.integer   "user_id",                         :precision => 38, :scale => 0
    t.integer   "ecn_id",                          :precision => 38, :scale => 0
    t.timestamp "approval_timestamp", :limit => 6
    t.integer   "status",                          :precision => 38, :scale => 0
    t.integer   "pos_id",                          :precision => 38, :scale => 0
    t.datetime  "created_at"
    t.datetime  "updated_at"
  end

  create_table "customer_infos", :force => true do |t|
    t.string   "cust_id",    :limit => 30, :default => ""
    t.string   "th_pn",      :limit => 30, :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecndocuments", :force => true do |t|
    t.string    "title",             :limit => 150,                                :default => ""
    t.string    "customer_name",     :limit => 200,                                :default => ""
    t.string    "th_part_no",        :limit => 30,                                 :default => ""
    t.string    "ref_spec",          :limit => 30,                                 :default => ""
    t.integer   "extension",                        :precision => 38, :scale => 0
    t.text      "description_to"
    t.text      "description_from"
    t.text      "reason"
    t.string    "revision1",         :limit => 15,                                 :default => ""
    t.string    "action",            :limit => 30,                                 :default => ""
    t.datetime  "effectivity_from"
    t.datetime  "effectivity_to"
    t.integer   "user_id",                          :precision => 38, :scale => 0
    t.string    "ecn_doc",           :limit => 20,                                 :default => ""
    t.string    "revision2",         :limit => 15,                                 :default => ""
    t.integer   "user_designation",                 :precision => 38, :scale => 0
    t.timestamp "closed_timestamps", :limit => 6
    t.integer   "obsoletion",                       :precision => 38, :scale => 0
  end

  create_table "ecnpositions", :force => true do |t|
    t.string "position_name", :limit => 30, :default => ""
  end

  create_table "ecnreview_forms", :force => true do |t|
    t.integer   "user_id",                         :precision => 38, :scale => 0
    t.integer   "ecn_id",                          :precision => 38, :scale => 0
    t.timestamp "approval_timestamp", :limit => 6
    t.text      "review"
    t.integer   "pos_id",                          :precision => 38, :scale => 0
    t.text      "rem"
  end

  create_table "ecnsignatures", :force => true do |t|
    t.integer "user_id",   :precision => 38, :scale => 0
    t.text    "signature"
  end

  create_table "ecnusers", :force => true do |t|
    t.integer  "pos_id",                                :precision => 38, :scale => 0
    t.integer  "signature_id",                          :precision => 38, :scale => 0
    t.string   "first_name",             :limit => 20,                                 :default => ""
    t.string   "last_name",              :limit => 40,                                 :default => ""
    t.string   "username",               :limit => 50,                                 :default => ""
    t.string   "password",               :limit => 250,                                :default => ""
    t.string   "email",                  :limit => 200,                                :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "signature_file_name"
    t.string   "signature_content_type"
    t.integer  "signature_file_size",                   :precision => 38, :scale => 0
  end

end
