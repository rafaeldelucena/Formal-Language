require 'estado'

def juntar_estados(estados)
        novas_transicoes = Set.new
        novo_tag = ""
        novo_final = false
        estados.each {|estado|
                novo_tag.concat(estado.tag)
                novo_final = true if estado.final?
                estado.transicoes.each {|transicao| 
                        novas_transicoes.add(transicao)
                }
        }
        
        Estado.new(novo_tag, novas_transicoes, false, novo_final)
 end
 def afd(automato)
        lista_verificar = [automato.inicial]
        conjunto_deterministico = Set.new
        while !lista_verificar.empty? do
                lista_verificar.each {|estado|
                        estado.transicoes.each {|transicao|
                                conjunto_deterministico.add(automato.determinizar(lista_verificar.pop))
                                lista_verificar << transicao.destino if !conjunto_deterministico.include?(transicao.destino)
                        }
                }
        end
                Automato.new(conjunto_deterministico, automato.alfabeto, automato.inicial)       
end
