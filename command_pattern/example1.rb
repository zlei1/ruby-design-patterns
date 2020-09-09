class Manager
  def initialize
    @commands = []
  end

  def add_command(cmd)
    @commands << cmd
  end

  def execute
    @commands.each {|cmd| cmd.execute}
  end
end

class Command
  def execute
    raise "yous should override this method in subclass"
  end
end

class WorkCommand < Command
  def initialize(employee)
    @employee = employee
  end

  def execute
    puts "老板说#{@employee.name}快去工作"
    @employee.action1
  end
end

class ReportCommand < Command
  def initialize(employee)
    @employee = employee
  end

  def execute
    puts "老板说#{@employee.name}快交报告"
    @employee.action2
  end
end

class Employee
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def action1
    puts "#{@name}去工作了"
  end

  def action2
    puts "#{@name}交报告了"
  end
end

m = Manager.new
m.add_command(WorkCommand.new(Employee.new("小郑")))
m.add_command(ReportCommand.new(Employee.new("小刘")))
m.execute
