class Transicao
	def initialize(destino, elemento)
		@destino = destino
		@elemento = elemento
	end
	def to_s
	        "#{@elemento}) = #{@destino}\n"
	end
	def hash
		self.to_s.hash
        end
        def equal?(transicao)
    	        self.hash == transicao.hash
	end
	attr_reader :destino, :elemento
end
