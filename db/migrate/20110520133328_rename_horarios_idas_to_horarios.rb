class RenameHorariosIdasToHorarios < ActiveRecord::Migration
  def self.up
    rename_table :horarios_idas, :horarios
  end

  def self.down
    rename_table :horarios, :horarios_idas
  end
end
