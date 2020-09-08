require 'singleton'

class A
  include Singleton

  def method1
    puts "methods"
  end
end

a = A.instance
b = A.instance
a.method1
b.method1
puts a == b
