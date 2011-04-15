class Bairro < ActiveRecord::Base

  belongs_to :cidade
	has_many 	 :linhas_partida, :class_name => "Linha", :foreign_key => 'bairro_partida_id'
	has_many 	 :linhas_chegada, :class_name => "Linha", :foreign_key => 'bairro_chegada_id'

	validates :nome, 		 :presence => true
	validates :cidade_id, :presence => true

end
