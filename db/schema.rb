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

ActiveRecord::Schema.define(:version => 20110506045632) do

  create_table "bairros", :force => true do |t|
    t.string    "nome",       :null => false
    t.integer   "cidade_id",  :null => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "cidades", :force => true do |t|
    t.string    "nome",       :null => false
    t.integer   "estado_id",  :null => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "empresas", :force => true do |t|
    t.string    "nome",       :null => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "estados", :force => true do |t|
    t.string    "nome",       :null => false
    t.string    "uf",         :null => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "linhas", :force => true do |t|
    t.string   "numero",            :null => false
    t.string   "nome",              :null => false
    t.integer  "empresa_id",        :null => false
    t.integer  "bairro_partida_id", :null => false
    t.integer  "bairro_chegada_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string    "message"
    t.string    "username"
    t.integer   "item"
    t.string    "table"
    t.integer   "month"
    t.integer   "year"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "users", :force => true do |t|
    t.string    "email",                                 :default => "", :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
