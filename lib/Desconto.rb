class Desconto

  def initialize(filmes)
    @filmes = filmes
    @valor_carrinho = 0.0
    @desconto_acao = 0.0
  end

  def scan(carrinho)
    @carrinho = carrinho.scan(/\w/)
    @carrinho.each {|id| @valor_carrinho +=  @filmes[id.to_i][:preco]}
    calcula_desconto
  end

  def calcula_desconto

    @carrinho.each { |id|  @filmes[id.to_i][:genero] == "Ação" && @desconto_acao == 0.0 ?  @desconto_acao = 5.0 : 0.0 }

    case @valor_carrinho

    when 0...100
      @desconto = @desconto_acao
      calcula_total
    when 100...200
      @desconto = @desconto_acao + 10.0
      calcula_total
    when 200...300
      @desconto = @desconto_acao + 20.0
      calcula_total
    when 300...400
      @desconto = @desconto_acao + 25.0
      calcula_total
    else
      @desconto = @desconto_acao + 30.0
      calcula_total
    end
  end

  def calcula_total
    if @desconto == 0.0
      puts "Sua compra não teve desconto e o valor total é: #{@valor_carrinho}"
    else
      @valor_carrinho -= (@valor_carrinho * @desconto / 100)
      puts "Sua compra teve #{@desconto}% de desconto e o valor total é: #{@valor_carrinho}"
    end
    @valor_carrinho
  end
end
