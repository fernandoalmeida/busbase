class RemoveBairrosLinhas < ActiveRecord::Migration
  def self.up
    remove_column :linhas, :bairro_partida_id
    remove_column :linhas, :bairro_chegada_id
  end

  def self.down
    add_column :linhas, :bairro_partida_id, :integer
    add_column :linhas, :bairro_chegada_id, :integer
  end
end
