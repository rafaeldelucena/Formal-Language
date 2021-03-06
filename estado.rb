require 'set'
require 'transicao'

class Estado
	def initialize(tag, transicoes, inicial, final)
		@tag = tag
		@inicial = inicial
		@final = final
		@transicoes = Set.new
		@transicoes.merge(transicoes)
	end
	def add_transicao(destino, elemento)
		@transicoes.add(Transicao.new(destino, elemento))
	end
        def add_transicoes(transicoes)
        	@transicoes.merge(transicoes)
	end
	def to_s
		"#{@tag}"
	end
	def hash
		@tag.hash
	end
	def equal?(estado)
		self.hash == estado.hash
	end
        def inicial?
                @inicial
        end
	def final?
		@final
	end
	def get_destino(elemento)
		Set.new(get_transicao(elemento).collect {|transicao| transicao.destino })
	end
	def get_transicao(elemento)
		Set.new(@transicoes.select {|transicao| transicao if elemento.eql?(transicao.elemento)})
	end
	def deterministico?
		@transicoes.each {|transicao|
			return false if get_destino(transicao.elemento).size > 1
		}
		return true
	end
	def to_determinize(elemento)
		get_destino(elemento).size > 1 ? get_destino(elemento) : []
	end
	attr_writer :tag
	attr_reader :tag, :transicoes, :final, :inicial
end
