class Triangle

  def initialize(input1, input2, input3)
    p "initialize class [Triangle] with side lenghts of [#{input1}], [#{input2}], and [#{input3}]"
    @lenA = input1
    @lenB = input2
    @lenC = input3

    @sides = Array.new
    @sides << @lenA
    @sides << @lenB
    @sides << @lenC
  end

  def kind
    if @sides.detect{|x| x <= 0} != nil
        raise TriangleError
    end
    if @sides.max < (@sides.sum - @sides.max) == false
      raise TriangleError
    end

    matches = @sides.select { |x| @sides.count(x) > 1}
    p matches
    p "there are [#{matches.length}] matches in @sides [#{@sides}]"
    if matches.length == 3
      return :equilateral
    end
    if matches.length == 2
      return :isosceles
    end
    return :scalene
  end

  class TriangleError < StandardError
  end

end
