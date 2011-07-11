# -*- coding: utf-8 -*-
class Linha < ActiveRecord::Base

  default_scope :order => "nome ASC"

  belongs_to :empresa
  has_many :horarios
  has_many :itinerarios

  validates :numero, :presence => true
  validates :nome, :presence => true, :uniqueness => true

  def proximo_horario
    agora         = Time.now
    dia_da_semana = [1..5].include?(agora.wday) ? "u" : agora.wday == 6 ? "s" : "d"
    horarios      = Horario.where(:linha_id => id).where(:dia_da_semana => dia_da_semana).where("hora > ?", agora).order("hora ASC").partition {|h| h.sentido == "i"}
    ida, volta    = horarios[0].first, volta = horarios[1].first
    {
      :ida => (ida ? "#{ida.hora.hour}:#{ida.hora.min}" : nil),
      :volta => (volta ? "#{volta.hora.hour}:#{volta.hora.min}" : nil)
    }
  end

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
