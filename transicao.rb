class Transicao
	def initialize(origem, destino, elemento)
		@origem = origem
		@destino = destino
		@elemento = elemento
	end
	def to_s
		"(#{@origem}, #{@elemento}) = #{@destino}\n"
	end
        def equal?(transicao)
               (@origem.equal?(transicao.origem) && @destino.equal?(transicao.destino) && @elemento == transicao.elemento) ? true : false
        end
	attr_reader :origem, :destino, :elemento
	attr_writer :origem, :destino
end
