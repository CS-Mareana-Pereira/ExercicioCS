require_relative '../lib/Desconto.rb'
require_relative 'Filmes.rb'

RSpec.describe Desconto do

  context 'Valida filmes sem acao' do

    it 'Validando desconto de preco de filme com valor menor que 100' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('1')).to eq(45.00)
    end

    it 'Validando desconto de preco de filme com valor igual a 100' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('5')).to eq(90.00)
    end

    it 'Validando desconto de preco de filme com valor entre 101 e 199' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('221')).to eq(139.5)
    end

    it 'Validando desconto de preco de filme com valor entre 200 e 299' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('6')).to eq(160.00)
    end

    it 'Validando desconto de preco de filme com valor entre 300 e 399' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('652')).to eq(266.25)
    end

    it 'Validando desconto de preco de filme com valor maior que 400' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('65122')).to eq(318.5)
    end
  end

  context 'Valida filmes com acao' do

    it 'Validando desconto de preco de filme com valor menor que 100' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('4')).to eq(52.25)
    end

    it 'Validando desconto de preco de filme com valor igual a 100' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('3')).to eq(85.00)
    end

    it 'Validando desconto de preco de filme com valor entre 101 e 199' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('44')).to eq(93.5)
    end

    it 'Validando desconto de preco de filme com valor entre 200 e 299' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('314')).to eq(150)
    end

    it 'Validando desconto de preco de filme com valor entre 300 e 399' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('24456')).to eq(302.25)
    end

    it 'Validando desconto de preco de filme com valor maior que 400' do
      @desconto = Desconto.new(FILMES)
      expect(@desconto.scan('244356')).to eq(367.25)
    end
  end
end
