class Component
  attr_accessor :parent

  def method1
    # ...
  end
end

# defind task
class Task1 < Component
  def method1
    puts "Task 1"
  end
end

class Task2 < Component
  def method1
    puts "Task 2"
  end
end

class Task3 < Component
  def method1
    puts "Task 3"
  end
end

# package task
class Composite < Component
  def initialize
    @children = []
  end

  def add(component)
    @children << component
    component.parent = self
  end

  def remove(component)
    @children.delete(component)
    component.parent = nil
  end

  def method1
    @children.map(&:method1)
  end
end

class Package1 < Composite
  def initialize
    super
    add(Task1.new)
    add(Task2.new)
    add(Task3.new)
  end
end

Package1.new.method1 

class Package2 < Composite
  def initialize
    super
    add(Task2.new)
    add(Task3.new)
  end
end

class Package3 < Composite
  def initialize
    super
    add(Task1.new)
    add(Package2.new)
  end
end

Package3.new.method1
