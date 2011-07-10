class Busca < ActiveRecord::Base
  validates :texto, :presence => true, :uniqueness => true
end
