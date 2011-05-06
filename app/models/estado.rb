class Estado < ActiveRecord::Base

	has_many :cidades
	
	validates :nome, :presence => true, :uniqueness => true
	validates :uf,   :presence => true, :uniqueness => true
	
end
