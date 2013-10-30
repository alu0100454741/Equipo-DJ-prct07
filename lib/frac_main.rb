class Fraccion

  include Comparable
  
  #Getter para las variables numerador y denominador
  attr_accessor :numerador, :denominador

  #Método máximo común divisor
  def gdc(u, v)
    u, v = u.abs, v.abs
    while v > 0
      u, v = v, u % v
    end
    u
  end

  #Método de inicialización de la Clase Fracción
  def initialize (num, den)
    raise TypeError, "El denominador no puede ser 0" if den.eql? 0
    min = gdc(num, den)
    @numerador = num / min
    @denominador =  den / min
    # "#@numerador/#@denominador"
  end

  #Método que retorna el numerador de la fracción
  def num
    @numerador
  end

  #Método que retorna el denominador de la fracción
  def denom
    @denominador
  end

  #Método que convierta la fraccion a un String de la forma a/b
  def to_s
    "#@numerador/#@denominador"
  end

  #Método que muestra la fraccion en formato flotante
  def to_f
    @numerador/@denominador
  end

  #Sobrecarga de metodo == para la comparaion de dos fracciones 
  def ==(other)
    return @numerador == other.numerador && @denominador == other.denominador if other.instance_of? Fraccion 
    false
  end

  #Método que calcula el valor absoluto de una fracción
  def abs
    Fraccion.new(@numerador.abs, @denominador) 
  end

  #Método que crea un objeto Fraccion con su reciproco
  def reciprocal
    Fraccion.new(@denominador,@numerador)
  end

  #Método que crea el opuesto de una fraccion  
  def -@
    Fraccion.new(-@numerador,@denominador)
  end

  #Método que calcula la suma de dos fracciones
  def +(other)
    denomTotal = @denominador * other.denominador
    Fraccion.new(((denomTotal / @denominador) * @numerador) +((denomTotal / other.denominador) * other.numerador), denomTotal)
  end

  #Método que calcula la resta de dos fracciones
  def -(other)
    self + (-other)
  end

  #Método que calcula la multiplicacion de dos fracciones
  def *(other)
    Fraccion.new(@numerador * other.numerador, @denominador * other.denominador)
  end

  #Método que calcula la division de dos fracciones
  def /(other)
    Fraccion.new(@numerador * other.denominador, @denominador * other.numerador)
  end

  #Método que calcula el resto dos fracciones
  def %(other)
    l = @numerador * other.denominador
    r = @denominador * other.numerador
    n = l/r
    Fraccion.new( l - n * r, @denominador * other.denominador)
  end

  #Método de la guerra de las galaxias que hace las comparaciones <, >, <= y >=
  def <=>(other)
    return nil unless other.instance_of? Fraccion
    (num.to_f / denom) <=> (other.num.to_f / other.denom)
  end

end

if __FILE__ == $0
  frac = Fraccion.new(-3,4)
  frac2 = Fraccion.new(2,3)
  frac3 = Fraccion.new(-1,5)
  frac4 = Fraccion.new(22,16)
  frac5 = Fraccion.new(6,4)
  frac6 = Fraccion.new(1,5)
          
  puts frac == frac2
  puts frac == frac3
  puts frac
  puts -frac
  puts frac.reciprocal
  puts frac.abs
  puts frac4
  puts frac5
  puts frac2 + frac6
  puts frac2 + frac3
  puts frac2 + frac5
  puts frac2 - frac6
  puts frac2 - frac5
  puts frac2 * frac5
  puts frac2 / frac6
  puts frac2 % frac5
  puts frac2 < frac5
  puts frac5 < frac2
  puts frac5 > frac2
  puts frac2 <= frac5
  puts frac2 <= frac2
  puts frac2 >= frac5
end