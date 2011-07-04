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
        lista_verificar = Set.new([automato.inicial])
        conjunto_deterministico = Set.new
        while !lista_verificar.empty? do
                lista_verificar.each {|estado|
                	novo_estado = automato.determinizar(estado)
			conjunto_deterministico.add(novo_estado)
			novo_estado.transicoes.each {|transicao|
				lista_verificar.add(transicao.destino)
			}
			lista_verificar.delete(estado)
		}
        end
                Automato.new(conjunto_deterministico, automato.alfabeto, automato.inicial)       
end
