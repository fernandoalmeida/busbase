class Cidade < ActiveRecord::Base

  belongs_to :estado
	has_many 	 :bairros
	
	validates :nome, 			:presence => true
	validates :estado_id, 	:presence => true

end
