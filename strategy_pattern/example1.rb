class A
  def method1
    raise "yous should override this method in subclass"
  end
end

class B < A
  def method1
    puts "B method1"
  end
end

class C < A
  def method1
    puts "C method1"
  end
end

class D

  attr_accessor :strategy

  def call
    strategy.method1
  end

end

d1 = D.new
d1.strategy = B.new
d1.call

d2 = D.new
d2.strategy = C.new
d2.call
