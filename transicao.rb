class Transicao
	def initialize(origem, destino, elemento)
	        @origem = origem
		@destino = destino
		@elemento = elemento
	end
	def to_s
	        "(#{@origem}, #{@elemento}) = #{@destino}\n"
	end
	def hash
		self.to_s.hash
        end
        def equal?(transicao)
    	        self.hash == transicao.hash
	end
	attr_reader :origem, :destino, :elemento
	attr_writer :origem, :destino
end
