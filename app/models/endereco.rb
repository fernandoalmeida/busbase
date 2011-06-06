class Endereco < ActiveRecord::Base
  belongs_to :bairro
  has_many :itinerarios
  has_many :linhas, :through => :itinerarios
end
