# 形状
class Shape
  def draw
    raise "yous should override this method in subclass"
  end
end

# 长方形
class Rectangle < Shape
  def draw
    puts "画了一个长方形"
  end
end

# 正方形
class Square < Shape
  def draw
    puts "画了一个正方形"
  end
end

# 圆形
class Circle < Shape
  def draw
    puts "画了一个圆形"
  end
end

class ShapeMaker
  def initialize()
    @rectangle = Rectangle.new
    @square = Square.new
    @circle = Circle.new
  end

  def draw_rectangle
    @rectangle.draw
  end

  def draw_square
    @square.draw
  end

  def draw_circle
    @circle.draw
  end
end

shape_maker = ShapeMaker.new
shape_maker.draw_rectangle
shape_maker.draw_square
shape_maker.draw_circle
