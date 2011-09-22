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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110922142238) do

  create_table "companies", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "companies", ["user_id", "name"], :name => "index_companies_on_user_id_and_name", :unique => true
  add_index "companies", ["user_id"], :name => "index_companies_on_user_id"

  create_table "direct_costs", :force => true do |t|
    t.string   "name",                                               :null => false
    t.decimal  "fixed_cost_price",    :precision => 16, :scale => 8, :null => false
    t.decimal  "variable_cost_price", :precision => 16, :scale => 8, :null => false
    t.string   "type",                                               :null => false
    t.integer  "product_id",                                         :null => false
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "direct_costs", ["product_id", "name"], :name => "index_direct_costs_on_product_id_and_name", :unique => true
  add_index "direct_costs", ["product_id"], :name => "index_direct_costs_on_product_id"

  create_table "products", :force => true do |t|
    t.string   "name",                                          :null => false
    t.decimal  "net_sale_price", :precision => 16, :scale => 8, :null => false
    t.integer  "company_id",                                    :null => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "products", ["company_id", "name"], :name => "index_products_on_company_id_and_name", :unique => true
  add_index "products", ["company_id"], :name => "index_products_on_company_id"

  create_table "stock_items", :force => true do |t|
    t.integer  "company_id",                                                        :null => false
    t.string   "name",                                                              :null => false
    t.decimal  "minimum_usage",     :precision => 16, :scale => 8, :default => 0.0, :null => false
    t.decimal  "maximum_usage",     :precision => 16, :scale => 8,                  :null => false
    t.decimal  "minimum_lead_time", :precision => 16, :scale => 8,                  :null => false
    t.decimal  "maximum_lead_time", :precision => 16, :scale => 8,                  :null => false
    t.decimal  "order_cost",        :precision => 16, :scale => 8,                  :null => false
    t.decimal  "buffer",            :precision => 16, :scale => 8, :default => 0.0, :null => false
    t.decimal  "holding_cost",      :precision => 16, :scale => 8,                  :null => false
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  add_index "stock_items", ["company_id", "name"], :name => "index_stock_items_on_company_id_and_name", :unique => true
  add_index "stock_items", ["company_id"], :name => "index_stock_items_on_company_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name",                                                  :null => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
