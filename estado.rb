require 'transicao'

class Estado
	def initialize(tag, final)
		@tag = tag
		@final = final
		@transicoes = []
		@destinos = []
	end
	def addTransicao(destino, elemento)
		@transicoes << Transicao.new(self, destino, elemento)
	end
        def to_s
                "#{@tag}"
        end
        def equal?(estado)
                (@tag == estado.tag && @final == estado.final) ? true : false
        end
        
        def getDestino(elemento)
                getTransicao(elemento).collect {|transicao|
                        transicao.destino
                }
        end
        def getTransicao(elemento)
                @transicoes.select {|transicao|
                    transicao if elemento == transicao.elemento
                }
        end
        def deterministico?
                @transicoes.each {|transicao|
                        return false if getDestino(transicao.elemento).size > 1
                }
			return true
        end
	 attr_writer :tag
	 attr_reader :tag, :final, :destinos, :transicoes
end
