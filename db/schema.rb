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

ActiveRecord::Schema.define(:version => 20110415044250) do

  create_table "bairros", :force => true do |t|
    t.string   "nome",       :null => false
    t.integer  "cidade_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cidades", :force => true do |t|
    t.string   "nome",       :null => false
    t.integer  "estado_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empresas", :force => true do |t|
    t.string   "nome",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", :force => true do |t|
    t.string   "nome",       :null => false
    t.string   "uf",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "linhas", :force => true do |t|
    t.string   "codigo",            :null => false
    t.string   "nome",              :null => false
    t.integer  "empresa_id",        :null => false
    t.integer  "bairro_partida_id", :null => false
    t.integer  "bairro_chegada_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
