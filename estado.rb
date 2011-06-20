require 'set'
require 'transicao'

class Estado
	def initialize(tag)
		@tag = tag
		@inicial = false
		@final = false
		@transicoes = Set.new
	end
	def addTransicao(destino, elemento)
		@transicoes.add(Transicao.new(self, destino, elemento))
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
	def final
		@final = true
	end
	def final?
		@final
	end
	def getDestino(elemento)
		getTransicao(elemento).collect {|transicao| transicao.destino }
	end
	def getTransicao(elemento)
		@transicoes.select {|transicao| transicao if elemento.eql?(transicao.elemento)
		}
	end
	def deterministico?
		@transicoes.each {|transicao|
			return false if getDestino(transicao.elemento).size > 1
			}
		return true
	end
	attr_writer :tag
	attr_reader :tag, :transicoes
end
