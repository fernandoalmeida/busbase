class CreateBuscas < ActiveRecord::Migration
  def self.up
    create_table :buscas do |t|
      t.string :texto
    end
  end

  def self.down
    drop_table :buscas
  end
end
