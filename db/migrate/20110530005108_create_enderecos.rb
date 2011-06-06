class CreateEnderecos < ActiveRecord::Migration
  def self.up
    create_table :enderecos do |t|
      t.string :endereco, :null => false, :default => ""
      t.references :bairro

      t.timestamps
    end
  end

  def self.down
    drop_table :enderecos
  end
end
