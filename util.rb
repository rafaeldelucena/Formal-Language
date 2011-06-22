require 'estado'

def juntar_estados(estados)
        novas_transicoes = Set.new
        novo_tag = ""
        novo_final = false
        estados.each {|estado|
                novo_tag.concat(estado.tag)
                novo_final = estado.final?
                estado.transicoes.each {|transicao| 
                        novas_transicoes.add(transicao)
                }
        }
        
        Estado.new(novo_tag, novas_transicoes, false, novo_final)
 end
