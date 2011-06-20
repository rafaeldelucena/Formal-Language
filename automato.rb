require 'estado'

class Automato
	def initialize(estados, alfabeto)
		@estados = estados
                @alfabeto = alfabeto
                @conjunto_estados = Set.new
                @conjunto_alfabeto = Set.new
                @inicial = estado_inicial
                self.estados_automato
                self.alfabeto_automato
	end
        def estados_finais
                Set.new([@estados.select {|estado| estado if estado.final? }])
        end
        def estado_inicial
                @estados.select {|estado| estado if estado.inicial? }
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
        def to_s
	@estados.each {|estado|
		"(#{estado.tag})--#{estado.elemento}-->(#{estado.destino})"
	}
	end

        attr_reader :conjunto_alfabeto, :conjunto_estados, :estados, :alfabeto, :inicial
end
