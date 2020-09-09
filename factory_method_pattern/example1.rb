class Operation
  attr_accessor :a, :b

  def initialize(a = nil, b = nil)
    @a = a
    @b = b end

  def result
    0
  end
end

class OperationAdd < Operation
 def result
   a + b
 end
end

class OperationSub < Operation
 def result
  a - b
 end
end

class OperationMul < Operation
 def result
  a * b
 end
end

class OperationDiv < Operation
 def result
  raise 'invalid value' if b == 0
  a / b
 end
end

class OperationFactory
  def create_operate
    raise "yous should override this method in subclass"
  end
end

class AddFactor < OperationFactory
  def create_operate
    OperationAdd.new
  end
end

class SubFactor < OperationFactory
  def create_operate
    OperationSub.new
  end
end

class MulFactor < OperationFactory
  def create_operate
    OperationMul.new
  end
end

class DivFactor < OperationFactory
  def create_operate
    OperationDiv.new
  end
end

add = AddFactor.new.create_operate
add.a = 1
add.b = 2
puts add.result
