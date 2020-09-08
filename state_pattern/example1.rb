class State
  def method1
    raise "yous should override this method in subclass"
  end
end

class State1 < State
  def method1
    puts "State1 method1"
  end
end

class State2 < State
  def method1
    puts "State2 method1"
  end
end

class State3 < State
  def method1
    puts "State3 method1"
  end
end

class A
  attr_writer :state

  def initialize
    @state = nil
  end

  def call
    @state.classify.constantize.new.method1
  end
end

class String
  def classify
    self.to_s.split(/\_/).map(&:capitalize).join
  end

  def constantize
    Object.const_get(self)
  end
end

a = A.new
a.state = "state1"
a.call

a.state = "state2"
a.call

a.state = "state3"
a.call
