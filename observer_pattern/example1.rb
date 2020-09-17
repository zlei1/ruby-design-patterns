class Product
  attr_reader :current_price

  def initialize
    @users = []
    @current_price = 0
  end

  def current_price=(price)
    @current_price = price
  end

  def attach(user)
    puts "添加竞价者"
    @users << user
  end

  def detach(user)
    puts "竞价者离开"
    @users.delete(user)
  end

  def notify
    puts "商品价格通知"
    @users.each { |user| user.update(self) }
  end
end

class User
  def initialize(name)
    @name = name
  end

  def update(product)
    puts "#{@name}收到商品的当前价格: #{product.current_price}"
  end
end

product = Product.new
product.current_price = 100
product.notify

puts "\n"

user = User.new("张三")
user2 = User.new("李四")
product.attach(user)
product.attach(user2)
product.notify

puts "\n"

product.current_price = 200
product.detach(user2)
product.notify
