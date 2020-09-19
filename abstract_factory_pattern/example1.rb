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

# 颜色 
class Color
  def fill
    raise "yous should override this method in subclass"
  end
end

# 红色
class Red < Shape
  def fill
    puts "填充了红色"
  end
end

# 绿色
class Green < Shape
  def fill 
    puts "填充了绿色"
  end
end

# 蓝色
class Blue < Shape
  def fill 
    puts "填充了蓝色"
  end
end

# 抽象工厂
class AbstractFactory
  def get_shape(_shape)
    raise "yous should override this method in subclass"
  end

  def get_color(_color)
    raise "yous should override this method in subclass"
  end
end

# 形状工厂
class ShapeFactory < AbstractFactory
  def get_shape(shape)
    case shape
    when 'CIRCLE'
      Circle.new
    when 'RECTANGLE'
      Rectangle.new
    when 'SQUARE'
      Square.new
    end
  end

  def get_color(color)
  end
end

# 颜色工厂
class ColorFactory < AbstractFactory
  def get_shape(shape)
  end

  def get_color(color)
    case color
    when 'RED'
      Red.new
    when 'GREEN'
      Green.new
    when 'BLUE'
      Blue.new
    end
  end
end

# 工厂生成器
class FactoryProducer
  def self.perform(choice)
    case choice
    when 'SHAPE'
      ShapeFactory.new
    when 'COLOR'
      ColorFactory.new
    end
  end
end

# 获取形状工厂
shape_factory = FactoryProducer.perform('SHAPE')

# 获取形状为 Circle 的对象
shape1 = shape_factory.get_shape('CIRCLE')
shape1.draw

# 获取形状为 Square 的对象
shape2 = shape_factory.get_shape('SQUARE')
shape2.draw

# 获取形状为 Rectangle 的对象
shape3 = shape_factory.get_shape('RECTANGLE')
shape3.draw
