require 'test/unit'
require 'estado'

class TesteEstado < Test::Unit::TestCase
        def setup
                @q0 = Estado.new("q0", true)
                @q1 = Estado.new("q1", false)
                @q2 = Estado.new("q0", true)
                
				@q1.addTransicao("q1", "b")

				@q0.addTransicao(@q1, "b")
              	@q0.addTransicao(@q0, "a")
				@q0.addTransicao(@q1, "a")
                
				@transicao3 = Transicao.new(@q0, @q1, "a")        
                @transicao = Transicao.new(@q0, @q1, "b")
                @transicao2 = Transicao.new(@q0, @q1, "a")
                
        end 
        def test_estado
                assert_equal("q0", @q0.tag)
                assert_equal(true, @q0.final)
                assert_same(@q0, @q2)
        end

        def test_add_transicao
                assert_equal(3, @q0.transicoes.size)
                assert_same(@transicao3, @transicao2)
                assert_same(@transicao2, @q0.transicoes.pop)
        end

        def test_get_transicao_element
                assert_same(@transicao3, Transicao.new(@q0,@q1,"a"))
                assert_same(@transicao2, @q0.getTransicao("a").pop)
                assert_equal(1, @q1.getTransicao("b").size)
                @q0.addTransicao(@q2, "b")
                assert_equal(2, @q0.getTransicao("b").size)
        end
        def test_get_destinos
                assert_same(@transicao2.destino, @q0.getDestino("a").pop)
				assert_equal(2, @q0.getDestino("a").size)
        end
	def test_deterministico?
		assert_equal(false, @q0.deterministico?)
		assert(true, @q1.deterministico?)
	end
end
