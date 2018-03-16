class Carrinho

    def initialize 
        @item = Array.new
    end

    def incluir (produto)
       @item << produto
    end

    def remover(produto)
        @item.delete(produto)
    end

    def quantidade (produto)
        @item.count(produto)
    end

    def alterar_quantidade(produto, quantidade)
        if quantidade > @item.count(produto)
            aumentar_quantidade(produto, quantidade)
        else
           diminuir_quantidade(produto, quantidade)
        end
    end
    
    def total
        valor_total = 0
        @item.each{|produto| valor_total = valor_total + produto.preco}
        valor_total
    end

    def produtos
        @item.uniq
    end

    private
    def aumentar_quantidade(produto, quantidade)
        quantidade - @item.count(produto).times do
        incluir(produto)
        end
    end

    def diminuir_quantidade(produto, quantidade)
        @item.count(produto) - quantidade.times do
        @item.delete_at(@item.index(produto))
        end
    end
end

class Produto
    attr_reader :titulo, :preco

    def initialize (nome, preco)
        @nome = nome
        @preco = preco
    end

    def nome
        @nome
    end

    def preco
        @preco
    end

end