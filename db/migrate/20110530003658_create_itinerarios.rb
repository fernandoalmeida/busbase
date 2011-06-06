class CreateItinerarios < ActiveRecord::Migration
  def self.up
    create_table :itinerarios do |t|
      t.references :linha
      t.references :endereco
      t.string :sentido, :null => false, :default => ""
      t.integer :position, :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :itinerarios
  end
end
