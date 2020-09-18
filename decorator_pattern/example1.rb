module MyDecorator
  # Module#method_added
  # 当新定义一个方法时，会调用这个方法。
  def method_added(method_name)
    unless decorator_methods.empty?
      decorator_method = decorator_methods.pop

      new_name = "#{method_name}_without_decorator"
      alias_method new_name, method_name

      define_method method_name do |*args|
        method(decorator_method).call method(new_name), *args do |p = args|
          method(new_name).call(*p)
        end
      end
    end
  end

  def wrap(decorator)
    decorator_methods << decorator
  end

  def decorator_methods
    @decorator_methods ||= []
  end
end

class Demo
  extend MyDecorator

  def logger(method, *args)
    puts "before execute #{method.original_name}"
    yield
    puts 'after execute'
  end

  def talk_to1(someone)
    puts 'talk to ' + someone
  end

  wrap :logger
  def talk_to2(someone)
    puts 'talk to ' + someone
  end

  def talk_to3(someone)
    puts 'talk to ' + someone
  end
end

d = Demo.new
d.talk_to1 '张三'

puts "\n"

d.talk_to2 '李四'

puts "\n"

d.talk_to3 '王五'
