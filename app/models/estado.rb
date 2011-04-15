class Estado < ActiveRecord::Base

	has_many :cidades
	
	validates :nome, :presence => true
	validates :uf,   :presence => true
	
end
