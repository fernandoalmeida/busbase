class Bairro < ActiveRecord::Base

  belongs_to :cidade
  has_many :enderecos

  validates :nome, :presence => true, :uniqueness => { :scope => [:cidade_id] }
  validates :cidade_id, :presence => true

end
