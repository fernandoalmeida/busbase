class CreateHorariosIdas < ActiveRecord::Migration
  def self.up
    create_table :horarios_idas do |t|
      t.references :linha, :null => false
      t.string :dia_da_semana, :null => false
      t.time :hora, :null => false
    end
  end

  def self.down
    drop_table :horarios_idas
  end
end
