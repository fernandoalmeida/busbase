# -*- coding: utf-8 -*-
class Linha < ActiveRecord::Base

  belongs_to :empresa
  belongs_to :bairro_partida, :class_name => "Bairro"
  belongs_to :bairro_chegada, :class_name => "Bairro"

  validates :numero, :presence => true
  validates :nome, :presence => true

  def self.pesquisar bairro
    return nil unless bairro
    linhas = Linha.where("nome ILIKE ?",bairro.insert(0,"%").insert(-1,"%"))
    linhas = parse_salvador(URI.escape(bairro.gsub("%",""))) unless linhas.count > 0
    linhas
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
