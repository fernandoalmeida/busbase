class Linha < ActiveRecord::Base

  belongs_to :empresa
  belongs_to :bairro_partida, :class_name => "Bairro"
  belongs_to :bairro_chegada, :class_name => "Bairro"

	validates :numero, 						:presence => true, :uniqueness => { :scope => [:empresa_id, :bairro_partida_id, :bairro_chegada_id] }
	validates :nome, 							:presence => true
	validates :empresa_id, 				:presence => true
	validates :bairro_partida_id, :presence => true
	validates :bairro_chegada_id, :presence => true
  
end
