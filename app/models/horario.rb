# -*- coding: utf-8 -*-
class Horario < ActiveRecord::Base
  belongs_to :linha
  default_scope :order => "dia_da_semana DESC, sentido ASC, hora ASC"

  validate :linha_id     , :presence => true
  validate :dia_da_semana, :presence => true
  validate :hora         , :presence => true

  def self.pesquisar(linha_id)
    return [] unless linha_id
    horarios = Horario.where(:linha_id => linha_id)
    unless horarios.count > 0
      codigos  = Linha.find(linha_id).numero.split('-')
      paginas = [
                 Nokogiri::HTML(open("http://www.stp.salvador.ba.gov.br/transporte/categorias/Onibus/consultar_horario.php?tipoDiaHorario=Dias%20%DAteis&acao=CONSULTAR_HORARIO&tipoDia=1&codigo=#{codigos[0]}&&codigofilha=#{codigos[1]}")),
                 Nokogiri::HTML(open("http://www.stp.salvador.ba.gov.br/transporte/categorias/Onibus/consultar_horario.php?tipoDiaHorario=Dias%20%DAteis&acao=CONSULTAR_HORARIO&tipoDia=2&codigo=#{codigos[0]}&&codigofilha=#{codigos[1]}")),
                 Nokogiri::HTML(open("http://www.stp.salvador.ba.gov.br/transporte/categorias/Onibus/consultar_horario.php?tipoDiaHorario=Dias%20%DAteis&acao=CONSULTAR_HORARIO&tipoDia=3&codigo=#{codigos[0]}&&codigofilha=#{codigos[1]}"))
                ]
      novos = []
      paginas.each_with_index do |html,i|
        anterior = "00:00"
        sentido = "i" # Cada página (útil/sábado/domingo) começa com sentido de ida
        html.css('td[width="548"] table[width="548"]').each_with_index do |table,j|
          table.css('td.tit02[width="100"] div').each do |col|
            hora = col.text
            unless hora.empty?
              sentido = "v" if hora < anterior # Se diminuiu a hora em relação ao anterior, o sentido é de volta
              novos.push({
                              :linha_id => linha_id,
                              :dia_da_semana => ["u","s","d"].at(i),
                              :hora => hora,
                              :sentido => sentido
                            })
              anterior = hora
            end
          end
        end
        
      end
      horarios = Horario.create(novos)      
    end
    horarios
  end
end
