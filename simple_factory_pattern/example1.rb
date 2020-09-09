class Operation
  attr_accessor :a, :b

  def initialize(a = nil, b = nil)
    @a = a
    @b = b
  end

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
  class << self
    def create_operate(operate)
      case operate
      when '+'
        OperationAdd.new()
      when '-'
        OperationSub.new()
      when '*'
        OperationMul.new()
      when '/'
        OperationDiv.new()
      end
    end
  end
end

o = OperationFactory.create_operate('+')
o.a = 1
