class CreateBairros < ActiveRecord::Migration
  def self.up
    create_table :bairros do |t|
      t.string :nome, :null => false
      t.references :cidade, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :bairros
  end
end
