class MudaCodigoParaNumetoEmLinhas < ActiveRecord::Migration
  def self.up
  	rename_column :linhas, :codigo, :numero
  end

  def self.down
  	rename_column :linhas, :numero, :codigo
  end
end
