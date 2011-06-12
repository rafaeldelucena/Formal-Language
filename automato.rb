require 'estado'

class Automato
	def initialize(estados)
		@estados = estados
	end
	def to_s
	@estados.each {|estado|
		"(#{estado.tag})--#{estado.elemento}-->(#{estado.destino})"
	}
	end
	def eql?(automato)
		self.hash == automato.hash
	end

end
