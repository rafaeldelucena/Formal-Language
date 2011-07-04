require 'estado'
require 'util'

class Automato
	def initialize(estados, alfabeto, inicial)
		@estados = estados
                @alfabeto = alfabeto
                @conjunto_estados = Set.new
                @conjunto_alfabeto = Set.new
                @inicial = inicial
                self.estados_automato
                self.alfabeto_automato
	end
	def hash
		@estados.hash
	end
	def equal?(automato)
		self.hash == automato.hash
	end
        def estados_finais
                Set.new([@estados.select {|estado| estado if estado.final? }])
        end
	def estados_automato
                @estados.each {|estado|
                        @conjunto_estados.add(estado.tag)
                }
        end
        def alfabeto_automato
                @estados.each {|estado|
                        estado.transicoes.each {|transicao|
                                @conjunto_alfabeto.add(transicao.elemento)
                        }
                }
        end
        def deterministico?
                @estados.each {|estado|
                        return false if !(estado.deterministico?)
                }
                return true
        end
	def determinizar(estado)
	        if !estado.deterministico?
		        estado_determinizado = Estado.new(estado.tag, Set.new, estado.inicial, estado.final)
			estado.transicoes.each {|transicao|
			        destinos = Set.new
				estado.get_destino(transicao.elemento).each {|destino|
				        destinos.add(destino)
			        }
			        if destinos.size > 1
			                novo_estado = juntar_estados(destinos)
				        estado_determinizado.add_transicao(novo_estado, transicao.elemento)
			        else
				        estado_determinizado.add_transicao(transicao.destino, transicao.elemento)
			        end
		        }
			return estado_determinizado
                else
        		return estado
		end
        end
        def to_s
                @estados.each {|estado|
		        "(#{estado.tag})--#{estado.elemento}-->(#{estado.destino})"
		}
	end

        attr_reader :conjunto_alfabeto, :conjunto_estados, :estados, :alfabeto, :inicial
end
