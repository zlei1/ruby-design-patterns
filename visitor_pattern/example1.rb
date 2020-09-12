class Employee
  def accept(_visitor)
    raise "yous should override this method in subclass"
  end
end

class Engineer < Employee
  def accept(visitor)
    visitor.visit_engineer
  end
end

class Manager < Employee
  def accept(visitor)
    visitor.visit_manager
  end
end

class Visitor
  def visit_engineer
    raise "yous should override this method in subclass"
  end

  def visit_manager
    raise "yous should override this method in subclass"
  end
end

class Ceo < Visitor
  def visit_engineer
    puts "Ceo查看工程师的kpi"
  end

  def visit_manager
    puts "Ceo查看经理的新产品数量"
  end
end

class Cto < Visitor
  def visit_engineer
    puts "Cto查看工程师代码量"
  end

  def visit_manager
    puts "Cto查看经理的新产品数量和kpi"
  end
end

employees = [Engineer.new, Manager.new]
visitor1 = Ceo.new
visitor2 = Cto.new
employees.each do |e|
  e.accept(visitor1)
  e.accept(visitor2)
  puts "-----------"
end
