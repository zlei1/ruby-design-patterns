class Employee
  attr_reader :name, :education

  def initialize(name, education)
    @name = name
    @education = education
  end
end

class EmployeeCollection
  attr_accessor :collection
  private :collection

  def initialize(collection = [])
    @collection = collection
  end

  def add(employee)
    @collection << employee
  end

  def iterator
    Iterator.new(@collection)
  end
end

class Iterator
  def initialize(collection)
    @collection = collection
  end

  def get_master_education_count
    count = @collection.map { |c| c.education == "硕士" ? c.name : nil }.compact.count
    puts "硕士个数为#{count}"
  end
end

employee1 = Employee.new("张三", "小学")
employee2 = Employee.new("李四", "大学")
employee3 = Employee.new("王五", "硕士")

employee_collection = EmployeeCollection.new
employee_collection.add(employee1)
employee_collection.add(employee2)
employee_collection.add(employee3)

employee_collection.iterator.get_master_education_count
