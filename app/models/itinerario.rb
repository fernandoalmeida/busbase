# -*- coding: utf-8 -*-
class Itinerario < ActiveRecord::Base
  belongs_to :linha
  belongs_to :endereco

  scope :ida, where(:sentido => "i")
  scope :volta, where(:sentido => "v")

  default_scope order("sentido, position ASC")

  def self.pesquisar(linha_id)
    return [] unless linha_id
    itinerario = Itinerario.where(:linha_id => linha_id)
    unless itinerario.count > 0
      codigos = Linha.find(linha_id).numero.split('-')
      html = Nokogiri::HTML(open("http://www.stp.salvador.ba.gov.br/transporte/categorias/Onibus/consultar_itinerario.php?codigo=#{codigos[0]}&&codigofilha=#{codigos[1]}"))
      novos = {:i => [], :v => []}
      html.css('table[height="108"]').each_with_index do |table,i|
        table.css('.style4 .style28').each do |col|
          endereco = col.text
          sentido = i == 0 ? 'i' : 'v'
          unless endereco.empty? || endereco == "Não existe horário de retorno para esta linha"
            novos[sentido.to_sym].push({
                         :linha_id => linha_id,
                         :endereco_id => Endereco.create(:endereco => endereco).id,
                         :sentido => sentido,
                         :position => novos[sentido.to_sym].count + 1
                       })
          end
        end
      end
      itinerario = Itinerario.create(novos[:i] + novos[:v])
    end
    itinerario
  end
  
end
