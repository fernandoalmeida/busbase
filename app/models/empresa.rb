class Empresa < ActiveRecord::Base

	has_many :linhas
	
	validates :nome, :presence => true
	
end
