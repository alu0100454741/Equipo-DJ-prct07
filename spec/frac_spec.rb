require 'frac_main.rb'

require 'rspec'

describe Fraccion do

  before :each do
    @frac1 = Fraccion.new(8,2)
    @frac2 = Fraccion.new(6,3)
    @comfrac1 = Fraccion.new(2,1)
    @fracreciprocal = Fraccion.new(1,4)
  end

  it "El numerador tiene que ser un Fixnum" do
  	@frac1.numerador.class == Fixnum
  end

  it "El denominador tiene que ser un Fixnum" do
  	@frac1.denominador.class == Fixnum
  end
  
  it "Debe de existir un numerador" do
    @frac1.numerador.should == 4
  end
  
  it "Debe de existir un denominador" do
    @frac1.denominador.should == 1
  end

  it "Para la fracción 8/2 debe de estar en su forma reducida" do
    @frac1.numerador.should_not == 8
    @frac1.numerador.should_not == 2
  end

  it "Se debe invocar al metodo num() para obtener el numerador" do
  	Fraccion.new(1, 6).respond_to?("num").should == true
  end

  it "Se debe invocar al metodo denom() para obtener el denominador" do
    Fraccion.new(1, 6).respond_to?("denom").should == true
  end

  it "Se debe mostrar por la consola la fraccion de la forma: a/b, donde a es el numerador y b el denominador" do
  	@frac1.to_s.should == "4/1"
  end

  it "Se debe mostrar por la consola la fraccion en formato flotante" do
    @frac1.to_f.should == 4/1
    @frac2.to_f.should == 6/3
  end

  it "Se debe comparar si dos fracciones son iguales con ==" do
  	@frac2.should == @comfrac1	
  end

  it "Se debe calcular el valor absoluto de una fraccion con el metodo abs" do
    Fraccion.new(-4,3).abs.should == Fraccion.new(4, 3)
  end

  it "Se debe calcular el reciproco de una fraccion con el metodo reciprocal" do
  	@frac1.reciprocal.should == @fracreciprocal
  end

  it "Se debe calcular el opuesto de una fraccion con -" do
    (- @frac2).should == Fraccion.new(-6, 3)
  end

  it "Se debe sumar dos fracciones con + y dar el resultado de forma reducida" do
  	(@frac1 + Fraccion.new(1,2)).should == Fraccion.new(9,2)
  end

  it "Se debe restar dos fracciones con - y dar el resultado de forma reducida" do
    (@frac1 - Fraccion.new(1,2)).should == Fraccion.new(7,2)
  end

  it "Se debe multiplicar dos fracciones con * y dar el resultado de forma reducida" do
  	(@frac1 * Fraccion.new(1,2)).should == Fraccion.new(8,4)
  end

  it "Se debe dividir dos fracciones con / y dar el resultado de forma reducida" do
    (@frac1 / Fraccion.new(1,2)).should == Fraccion.new(8,1)
  end

  it "Se debe calcular el resto dos fracciones con % y dar el resultado de forma reducida" do
  	(@frac1 % Fraccion.new(1,2)).should == Fraccion.new(0,2)
  end

  it "Se debe de poder comprobar si una fraccion es menor que otra" do
    (@frac1 < Fraccion.new(1,2)).should == false
  end

  it "Se debe de poder comprobar si una fraccion es mayor que otra" do
   	(@frac1 > Fraccion.new(1,2)).should == true
  end

  it "Se debe de poder comprobar si una fraccion es menor o igual que otra" do
    (@frac1 <= Fraccion.new(8,2)).should == true
  end

  it "Se debe de poder comprobar si una fracion es mayor o igual que otra" do
    (@frac1 >= Fraccion.new(3,2)).should == true
  end

end