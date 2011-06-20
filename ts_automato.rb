require 'test/unit'
require 'automato'

class TesteAutomato < Test::Unit::TestCase

	def setup

                @alfabeto = ["a","b"]
		
		@transicao_q0 = Set.new([Transicao.new(@q1, "b"), Transicao.new(@q0, "a"), Transicao.new(@q1, "a")])
		@q0 = Estado.new("q0", transicao_q0, true, true)

		@transicao_q1 = Set.new([Transicao.new(@q1, "b")])
                @q1 = Estado.new("q1", transicao_q1, false, false)
		
		
		@estados = Set.new([@q0, @q1])
		@automato1 = Automato.new(@estados, @alfabeto)
		@automato2 = Automato.new(@estados, @alfabeto)	

	end
        def test_estados_automato
                assert(true, @automato1.conjunto_alfabeto.include?("a"))
                assert_equal(2, @automato1.conjunto_estados.size)
                assert(true, @automato1.estados_finais.include?(@q0))
                assert_equal(1, @automato1.estados_finais.size)
                assert_equal(1, @automato1.inicial.size)
                assert_same(@q0, @automato1.inicial.last)
        end
        def test_automato_deterministico
                assert_equal(false, @automato1.deterministico?)
        end
        
end
