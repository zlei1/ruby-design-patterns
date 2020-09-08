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
  def initialize
    @d = D.new
  end

  def method1
    @d.method1
  end
end

class D
  def method1
    puts "D method2"
  end
end

def call(target)
  target.method1
end

call(B.new)
call(C.new)
