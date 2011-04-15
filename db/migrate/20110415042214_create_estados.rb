class CreateEstados < ActiveRecord::Migration
  def self.up
    create_table :estados do |t|
      t.string :nome, :null => false
      t.string :uf, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :estados
  end
end
