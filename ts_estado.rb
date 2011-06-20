require 'test/unit'
require 'estado'

class TesteEstado < Test::Unit::TestCase
        def setup

		@q0 = Estado.new("q0", Set.new, true, true)
		
		@q1 = Estado.new("q1", Set.new, false, false)
	
		@q0.add_transicao(@q1, "b")
		@q0.add_transicao(@q0, "a")
		@q0.add_transicao(@q1, "a")

		@transicao_q0 = Set.new([Transicao.new(@q1, "b"), Transicao.new(@q0, "a"), Transicao.new(@q1, "a")])
					
		@q1.add_transicao(@q1, "b")            
                
                @transicao1 = Transicao.new(@q1, "b")
                @transicao2 = Transicao.new(@q1, "a")
		@transicao3 = Transicao.new(@q1, "a")        
        end 
        def test_estado
                assert_equal("q0", @q0.tag)
                assert_equal(true, @q0.final?)
                assert_equal(false, @q1.final?)
                assert_same(@q0, Estado.new("q0", @transicao_q0, true, true))
        end

        def test_add_transicao
                assert_equal(3, @q0.transicoes.size)
                assert_same(@transicao1, Transicao.new(@q1, "b"))
                assert(true, @q0.transicoes.include?(@transicao2))
        end

        def test_get_transicao_element
                assert_same(@transicao3, Transicao.new(@q1,"a"))
                assert(true, @q0.get_transicao("a").include?(@transicao2))
                assert_equal(1, @q1.get_transicao("b").size)
                @q0.add_transicao(@q2, "b")
                assert_equal(2, @q0.get_transicao("b").size)
        end
        def test_get_destinos
                assert_equal(true, @q0.get_destino("a").include?(@q1))
		assert_equal(2, @q0.get_destino("a").size)
        end
	def test_deterministico?
		assert_equal(false, @q0.deterministico?)
		assert(true, @q1.deterministico?)
	end
end

