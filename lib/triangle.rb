class Triangle

  attr_accessor :one, :two, :three

  def initialize(one,two,three)
     @one = one
     @two = two
     @three = three
  end

  def kind
    validate_triangle
    if one == two && two == three
      :equilateral
    elsif
      one == two || two == three || three == one
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [one,two,three].all?(&:positive?)
  end

  def valid_triangle_inequality?
    one+two > three && one + three > two && two + three > one
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end

end
