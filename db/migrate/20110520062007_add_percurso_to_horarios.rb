class AddPercursoToHorarios < ActiveRecord::Migration
  def self.up
    add_column :horarios_idas, :sentido, :string, :null => false, :default => "i"
  end

  def self.down
    remove_column :horarios_idas, :sentido
  end
end
