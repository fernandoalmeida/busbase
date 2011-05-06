class Empresa < ActiveRecord::Base

	has_many :linhas
	
	validates :nome, :presence => true, :uniqueness => true
	
end
