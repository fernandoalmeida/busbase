class HorariosIda < ActiveRecord::Base
  belongs_to :linha
  default_scope :order => "hora ASC"

  validate :linha_id     , :presence => true
  validate :dia_da_semana, :presence => true
  validate :hora         , :presence => true

  def self.pesquisar(linha_id)
    return [] unless linha_id
    horarios_ida = HorariosIda.where(:linha_id => linha_id)
    unless horarios_ida.count > 0
      codigos  = Linha.find(linha_id).numero.split('-')
      paginas = [
                 Nokogiri::HTML(open("http://www.stp.salvador.ba.gov.br/transporte/categorias/Onibus/consultar_horario.php?tipoDiaHorario=Dias%20%DAteis&acao=CONSULTAR_HORARIO&tipoDia=1&codigo=#{codigos[0]}&&codigofilha=#{codigos[1]}")),
                 Nokogiri::HTML(open("http://www.stp.salvador.ba.gov.br/transporte/categorias/Onibus/consultar_horario.php?tipoDiaHorario=Dias%20%DAteis&acao=CONSULTAR_HORARIO&tipoDia=2&codigo=#{codigos[0]}&&codigofilha=#{codigos[1]}")),
                 Nokogiri::HTML(open("http://www.stp.salvador.ba.gov.br/transporte/categorias/Onibus/consultar_horario.php?tipoDiaHorario=Dias%20%DAteis&acao=CONSULTAR_HORARIO&tipoDia=3&codigo=#{codigos[0]}&&codigofilha=#{codigos[1]}"))
                ]
      horarios = []
      paginas.each_with_index do |html,i|
        html.css('td.tit02[width="100"] div').each do |col|
          hora = col.text
          unless hora.empty?
              horarios.push({
                              :linha_id => linha_id,
                              :dia_da_semana => ["u","s","d"].at(i),
                              :hora => col.text
                            })
          end
        end
      end
      horarios_ida = HorariosIda.create(horarios)
    end
    horarios_ida
  end
  
end
