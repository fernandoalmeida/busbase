# -*- coding: utf-8 -*-
class Linha < ActiveRecord::Base

  belongs_to :empresa
  has_many :horarios
  has_many :itinerarios

  validates :numero, :presence => true
  validates :nome, :presence => true, :uniqueness => true

  def self.pesquisar bairro
    return nil unless bairro
    ja_pesquisado = Busca.where("texto = ?", bairro).count > 0
    parse_salvador(URI.escape(bairro.gsub("%",""))) unless ja_pesquisado
    Linha.where("nome ILIKE ?",bairro.insert(0,"%").insert(-1,"%"))
  end

  # TODO: implementar outras cidades
  # def self.parse cidade
  #   case cidade
  #   when "Salvador"
  #     parse_salvador
  #   end
  # end

  def self.parse_salvador linha
    return [] unless linha
    html = Nokogiri::HTML(open("http://www.stp.salvador.ba.gov.br/transporte/categorias/Onibus/consultar_linha.php?linha=#{linha}"))
    linhas = []
    cidade = Cidade.where(:nome => "Salvador").first
    estado = Estado.where(:nome => "Bahia").first
    html.css('.fundocadastrologin').each_with_index do |l, i|
      bairro = l.at('td[@width="238"]').text.split('-')
      linhas[i] = {
        :numero => l.at('td div').text,
	:nome 	=> l.at('td[@width="238"]').text
      }
    end
    Linha.create(linhas)
  end
  
end
