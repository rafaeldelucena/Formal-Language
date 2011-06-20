require 'set'
require 'transicao'

class Estado
	def initialize(tag, transicoes, inicial, final)
		@tag = tag
		@inicial = inicial
		@final = final
		@transicoes = transicoes
	end
	def add_transicao(destino, elemento)
		@transicoes.add(Transicao.new(destino, elemento))
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
		get_transicao(elemento).collect {|transicao| transicao.destino }
	end
	def get_transicao(elemento)
		@transicoes.select {|transicao| transicao if elemento.eql?(transicao.elemento)
		}
	end
	def deterministico?
		@transicoes.each {|transicao|
			return false if get_destino(transicao.elemento).size > 1
			}
		return true
	end
	attr_writer :tag
	attr_reader :tag, :transicoes, :final, :inicial
end
