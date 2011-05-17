class CreateLinhas < ActiveRecord::Migration
  def self.up
    create_table :linhas do |t|
      t.string :codigo, :null => false
      t.string :nome, :null => false
      t.references :empresa
      t.references :bairro_partida
      t.references :bairro_chegada

      t.timestamps
    end
  end

  def self.down
    drop_table :linhas
  end
end
