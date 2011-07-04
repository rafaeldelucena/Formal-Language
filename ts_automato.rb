require 'test/unit'
require 'automato'
require 'util'

class TesteAutomato < Test::Unit::TestCase

        def setup

                @alfabeto = ["a","b"]
		
		@q0 = Estado.new("q0", Set.new, true, true)
		
		@q1 = Estado.new("q1", Set.new, false, false)
	
		@q0.add_transicao(@q1, "b")
		@q0.add_transicao(@q0, "a")
		@q0.add_transicao(@q1, "a")

		@q0_transicao = Set.new([Transicao.new(@q1, "b"), Transicao.new(@q0, "a"), Transicao.new(@q1, "a")])
					
		@q1.add_transicao(@q1, "b") 
		
		
		@estados = Set.new([@q0, @q1])
		@automato1 = Automato.new(@estados, @alfabeto, @q0)
		@automato2 = Automato.new(@estados, @alfabeto, @q0)	
	end
	def test_automato
		assert_same(@automato1, @automato1)
		assert_same(@automato1, Automato.new(@estados, @alfabeto, @q0))
		assert_same(@automato1, @automato2)
	end
	def test_estados_automato
                assert(true, @automato1.conjunto_alfabeto.include?("a"))
                assert_equal(2, @automato1.conjunto_estados.size)
                assert(true, @automato1.estados_finais.include?(@q0))
                assert_equal(1, @automato1.estados_finais.size)
                assert_same(@q0, @automato1.inicial)
 	end
	def test_determinizar
		assert_equal(false, @q0.deterministico?)
		assert(true, @automato1.determinizar(@q0).deterministico?)

	end  
        def test_automato_deterministico
                assert_equal(false, @automato1.deterministico?)
                assert(true, afd(@automato1).deterministico?)
        end
end
