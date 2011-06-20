require 'test/unit'
require 'automato'

class TesteAutomato < Test::Unit::TestCase

	def setup

		@q0 = Estado.new("q0")
		@q0.final
		@q1 = Estado.new("q1")
		@q1.addTransicao("q1", "b")
		@q0.addTransicao(@q1, "b")
		@q0.addTransicao(@q0, "a")
		@q0.addTransicao(@q1, "a")
		@estados = Set.new([@q0, @q1])
		@automato1 = Automato.new(@estados)
		@automato2 = Automato.new(@estados)	

	end

	def test_automato
		assert_same(@automato1, @automato1)
		assert_same(@automato1, @automato2)
	end

end